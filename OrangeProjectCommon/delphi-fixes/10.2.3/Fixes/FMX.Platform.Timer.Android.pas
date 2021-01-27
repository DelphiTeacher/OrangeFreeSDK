//http://blog.qdac.cc/?p=4547
// bug 2
//http://blog.qdac.cc/?p=4791
//https://quality.embarcadero.com/browse/RSP-19525
//fix by swish QDAC
//fix and add by flying for https://quality.embarcadero.com/browse/RSP-18043
(*　仅支持 RAD10.2.3(10.2 Release 3)，其他版本请自行修改　*)

{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2016-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Timer.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.SyncObjs, System.Generics.Collections, System.Messaging, Androidapi.JNI.Embarcadero, Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge, AndroidApi.JNI.App, FMX.Types;

type

  TAndroidCommonTimerListener = class(TJavaLocal, JFMXTimerListener)
  public type
    TTimerEvent = procedure(const AHandle: Integer) of object;
  private
    FTimerEvent: TTimerEvent;
  public
    constructor Create(const ATimerEvent: TTimerEvent);
    { JFMXTimerListener }
    procedure onTimer(AHandle: Integer); cdecl;
  end;

  THandleQueue = class
  strict private
    FRingBuffer: TArray<TFmxHandle>;
    FLock: TObject;
    FHead, FTail: Integer;
  const
    InitialCapacity: Integer = 32;
    function Size: Integer;
    function Capacity: Integer;
    procedure Expand(const At: Integer);
    function Contains(const Handle: TFmxHandle): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Enqueue(const Handle: TFmxHandle);
    function TryDequeue(var Value: TFmxHandle): Boolean;
  end;

  /// <summary>Implementation of timer service for Android</summary>
  TAndroidTimerService = class(TInterfacedObject, IFMXTimerService)
  private
    FTimers: TDictionary<TFmxHandle, TTimerProc>;
    FObjectMap: TDictionary<TFmxHandle, TObject>;
    FTimersQueue: THandleQueue;
    FHandleCounter: TFmxHandle;
    FTerminating: Boolean;
    FInternalProcessMessage: Integer;
    FCommonTimerListener: TAndroidCommonTimerListener;
    procedure ApplicationTerminatingHandler(const Sender: TObject; const Msg: TMessage);
    procedure CommonTimerHandler(const AHandle: Integer);
    procedure AddToTimerQueue(const AHandle: TFmxHandle);

  protected
    /// <summary>Returns new unique handle</summary>
    function NewFmxHandle: TFmxHandle;
    /// <summary>Creates new unique handle and binds it with specified object.</summary>
    /// <remarks>Use <c>DeleteObjectHandle</c> for removing of created binding.</remarks>
    function AllocObjectHandle(const AObject: TObject): TFmxHandle;
    /// <summary>Removes binding specified handle with object, which was created by <c>AllocObjectHandle</c></summary>
    procedure DeleteObjectHandle(const AHandle: TFmxHandle);
    /// <summary>Finds object, which was bound with specified handle</summary>
    function HandleToObject(const AHandle: TFmxHandle): TObject;
    /// <summary>Checks a validity of a <c>AHandle</c></summary>
    procedure ValidateHandle(const AHandle: TFmxHandle);
    /// <summary>Registers timer service in platform</summary>
    procedure RegisterService; virtual;
    /// <summary>Unregisters timer service from platform</summary>
    procedure UnregisterService; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>Destroys all allocated timers</summary>
    procedure DestroyTimers;
    { IFMXTimerService }
    /// <summary>Creates timer and assing <c>ATimerFunc</c></summary>
    /// <returns>Handle of timer for correet destroying by <c>DestroyTimer</c></returns>
    function CreateTimer(AInterval: Integer; ATimerProc: TTimerProc): TFmxHandle;
    /// <summary>Destroy timer by specified timer's handle</summary>
    function DestroyTimer(ATimer: TFmxHandle): Boolean;
    /// <summary>Returns current time in nano seconds</summary>
    function GetTick: Double;
    function TimerExists(const ATimer: TFmxHandle): Boolean;
    // Invokes all events from timer,
    procedure ProcessQueueTimers;
  end;

implementation

uses
  System.SysUtils, System.Classes, Posix.Time, Androidapi.Helpers, FMX.Platform, FMX.Forms, FMX.Consts,
  FMX.Helpers.Android, Androidapi.JNI.Os;

type
  TAndroidTimer = class;

  TTimerRunnable = class(TJavaLocal, JRunnable)
  private
    FInterval: Integer;
    FTimer: TAndroidTimer; // Strong reference in order to keep object
    //fix by swish
    //swish:Use these variants to calc timer calls
    FStartTick,FPriorTick,FNextTick:Double;
    FStopped: Boolean;
  private class var
    FMainHandler: JHandler;
  private
    class function GetMainHandler: JHandler; static;
    //fix by swish
    procedure UpdateNext(ADoPost:Boolean);
  public
    constructor Create(const ATimer: TAndroidTimer; const AInterval: Integer);
    procedure RunTimerProc(AQueueNext:Boolean);
    procedure run; cdecl;
    class property MainHandler: JHandler read GetMainHandler;
  end;

  TAndroidTimer = class
  private
    FRunnable: TTimerRunnable;
    FTimerProc: TTimerProc;
    //FStopped: Boolean;
    //fix by swish
    function GetStopped: Boolean;
  public
    constructor Create(const AInterval: Integer; const ATimerProc: TTimerProc);
    procedure Stop;
    property TimerProc: TTimerProc read FTimerProc;
    //property Stopped: Boolean read FStopped;
    //fix by swish
    property Stopped: Boolean read GetStopped;
  end;

//fix by swish
var
  TimerService:TAndroidTimerService;

{ TAndroidTimerService }

procedure TAndroidTimerService.AddToTimerQueue(const AHandle: TFmxHandle);
begin
end;

function TAndroidTimerService.AllocObjectHandle(const AObject: TObject): TFmxHandle;
begin
end;

procedure TAndroidTimerService.ApplicationTerminatingHandler(const Sender: TObject; const Msg: TMessage);
begin
end;

constructor TAndroidTimerService.Create;
begin
  inherited;
  //fix by swish
  TimerService:=Self;
  RegisterService;
  //fix by swish
  FObjectMap:=TDictionary<TFmxHandle, TObject>.Create;
end;

function TAndroidTimerService.CreateTimer(AInterval: Integer; ATimerProc: TTimerProc): TFmxHandle;
var
  Timer: TAndroidTimer;
begin
  Result := 0;
  if (AInterval > 0) and Assigned(ATimerProc) then
  begin
    Timer := TAndroidTimer.Create(AInterval, ATimerProc);
    Result := TFmxHandle(Timer);
    //fix by swish
    FObjectMap.Add(Result,Timer);
  end;
end;

procedure TAndroidTimerService.DeleteObjectHandle(const AHandle: TFmxHandle);
begin
end;

destructor TAndroidTimerService.Destroy;
begin
  UnregisterService;
  //fix by swish
  FreeAndNil(FObjectMap);
  inherited;
end;

function TAndroidTimerService.DestroyTimer(ATimer: TFmxHandle): Boolean;
var
  Timer: TAndroidTimer;
begin
  Result := False;
  Timer := TAndroidTimer(ATimer);
  if Timer <> nil then
  begin
    Timer.Stop;
    Result := True;
  //fix by swish
    FObjectMap.Remove(ATimer);
    //fix or add by flying wang.
    Timer.Free;
  end;
end;

procedure TAndroidTimerService.DestroyTimers;
begin
end;

function TAndroidTimerService.GetTick: Double;
var
  Res: timespec;
begin
  clock_gettime(CLOCK_MONOTONIC, @Res);
  Result := (Int64(1000000000) * res.tv_sec + res.tv_nsec) / 1000000000;
end;

function TAndroidTimerService.HandleToObject(const AHandle: TFmxHandle): TObject;
begin
end;

function TAndroidTimerService.TimerExists(const ATimer: TFmxHandle): Boolean;
begin
end;

function TAndroidTimerService.NewFmxHandle: TFmxHandle;
begin
end;

procedure TAndroidTimerService.CommonTimerHandler(const AHandle: Integer);
begin
end;

//fix by swish
procedure TAndroidTimerService.ProcessQueueTimers;
var
  AObj:TObject;
  ATimer:TAndroidTimer;
  ATick:Double;
begin
  ATick:=GetTick;
  for AObj in FObjectMap.Values do
    begin
    ATimer:=AObj as TAndroidTimer;
    if ((ATick- ATimer.FRunnable.FPriorTick)*1000)>=ATimer.FRunnable.FInterval then
       ATimer.FRunnable.RunTimerProc(False);
    end;
end;

procedure TAndroidTimerService.RegisterService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXTimerService) then
    TPlatformServices.Current.AddPlatformService(IFMXTimerService, Self);
end;

procedure TAndroidTimerService.UnregisterService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXTimerService);
end;

procedure TAndroidTimerService.ValidateHandle(const AHandle: TFmxHandle);
begin
end;

{ TAndroidTimerListener }

constructor TAndroidCommonTimerListener.Create(const ATimerEvent: TTimerEvent);
begin
  inherited Create;
end;

procedure TAndroidCommonTimerListener.onTimer(AHandle: Integer);
begin
end;

{ TTimerRunnable }

constructor TTimerRunnable.Create(const ATimer: TAndroidTimer; const AInterval: Integer);
begin
  inherited Create;
  FTimer := ATimer;
  FInterval := AInterval;
  //fix by swish
  FStartTick:=TimerService.GetTick;
  FNextTick:=FStartTick+AInterval/1000;
  FPriorTick:=FStartTick;
  MainHandler.postDelayed(Self, AInterval);
end;

class function TTimerRunnable.GetMainHandler: JHandler;
begin
  if FMainHandler = nil then
    FMainHandler := TJHandler.JavaClass.init(TJLooper.JavaClass.getMainLooper);
  Result := FMainHandler;
end;

//procedure TTimerRunnable.run;
//begin
//  if not FTimer.Stopped then
//  begin
//    FTimer.TimerProc;
//    MainHandler.postDelayed(Self, FInterval);
//  end
//  else
//    FTimer := nil;
//end;

//fix by swish
procedure TTimerRunnable.UpdateNext(ADoPost:Boolean);
var
  ATimes,ADelta:Integer;
  ATick:Double;
begin
  ATick:=TimerService.GetTick;
  ATimes:=Trunc((ATick-FStartTick)*1000/FInterval);
  FNextTick:=FStartTick+((ATimes+1)*FInterval)/1000;
  if ADoPost then
    begin
    ADelta:=Trunc((FNextTick-ATick)*1000);
    MainHandler.postDelayed(Self,ADelta);
    end;
end;

//fix by swish
procedure TTimerRunnable.run;
begin
//  if not FStopped then
//    RunTimerProc(true)
//  else
//    FTimer:=nil;
  //fix by flying wang.
  if FStopped then
  begin
    MainHandler.removeCallbacks(Self);
//    FTimer := nil;
  end
  else
  begin
    RunTimerProc(True);
  end;
end;

//fix by swish
procedure TTimerRunnable.RunTimerProc(AQueueNext:Boolean);
begin
  FPriorTick:=TimerService.GetTick;
  try
    FTimer.TimerProc;
  finally
    UpdateNext(AQueueNext);
  end;
end;

{ TAndroidTimer }

constructor TAndroidTimer.Create;
begin
  FRunnable := TTimerRunnable.Create(Self, AInterval);
  FTimerProc := ATimerProc;
end;

//fix by swish
function TAndroidTimer.GetStopped: Boolean;
begin
  Result:=FRunnable.FStopped;
end;

procedure TAndroidTimer.Stop;
begin
//  FStopped := True;
  //fix by swish
  FRunnable.FStopped := True;
end;

{ THandleQueue }

function THandleQueue.Size: Integer;
begin
  Result := 0;
end;

function THandleQueue.Capacity: Integer;
begin
  Result := 0;
end;

function THandleQueue.Contains(const Handle: TFmxHandle): Boolean;
begin
  Result := False;
end;

constructor THandleQueue.Create;
begin
end;

destructor THandleQueue.Destroy;
begin
  inherited;
end;

procedure THandleQueue.Enqueue(const Handle: TFmxHandle);
begin
end;

procedure THandleQueue.Expand(const At: Integer);
begin
end;

function THandleQueue.TryDequeue(var Value: TFmxHandle): Boolean;
begin
end;

end.
