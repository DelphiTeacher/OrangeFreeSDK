unit FlyUtils.Android.PostRunnableAndTimer;

(****************************************************)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　　编写：爱吃猪头肉 & Flying Wang　　　　　*)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　2015-09-15　　　　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(****************************************************)

//提供一个 TAndroidTimer 和一个 CallInPostRunnable
//http://blog.csdn.net/dull_boy2/article/details/19128235


interface

{$IFDEF ANDROID}

uses
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  System.Classes;
{$ENDIF}
{$IFDEF ANDROID}

type
  TMethodCallback = procedure of object;
  TCallBack = reference to procedure;

  TFmxHandle = THandle;

  TAndroidTimer = class(TComponent)
  private
    FInterval: Cardinal;
    FTimerHandle: TFmxHandle;
    FOnTimer: TNotifyEvent;
    FEnabled: Boolean;
    procedure Timer;
  protected
    procedure SetEnabled(Value: Boolean); virtual;
    procedure SetInterval(Value: Cardinal); virtual;
    procedure SetOnTimer(Value: TNotifyEvent); virtual;
    procedure DoOnTimer; virtual;
    procedure UpdateTimer; virtual;
    procedure KillTimer; virtual;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Interval: Cardinal read FInterval write SetInterval default 1000;
    property OnTimer: TNotifyEvent read FOnTimer write SetOnTimer;
  end;

procedure CallInPostRunnable(AMethod: TMethodCallback); overload;
procedure CallInPostRunnable(AMethod: TCallBack); overload;

//可能会发生问题，建议不要用。
procedure CallInPostRunnableAndWaitFinishing(AMethod: TMethodCallback); overload;
procedure CallInPostRunnableAndWaitFinishing(AMethod: TCallBack); overload;

{$ENDIF}

implementation

{$IFDEF ANDROID}

uses
  Androidapi.JNI.Os,
  Androidapi.Timer,
  System.SyncObjs,
  System.Generics.Collections;

type
  TPostRunnable = class (TJavaLocal, JRunnable)
  strict private
    FMethodCallback: TMethodCallback;
    FCallback: TCallBack;
    FFinished: Boolean;
  public
    constructor Create; overload;
    constructor Create(ACallback: TCallBack); overload;
    constructor Create(AMethodCallback: TMethodCallback); overload;
    procedure Post;
    { JRunnable }
    procedure run; cdecl;
    property Finished: Boolean read FFinished;
  end;

type
  TFinishedRunnableCollector = class
  strict private class var
    FFinishedThreadCollector : TFinishedRunnableCollector;
  strict private
    FTimerHandle: Cardinal;
    procedure DoTimer;
    function SupportTimer: Boolean;
    function HasTimer: Boolean;
    procedure Start(Timeout: Integer = 2000);
  public
    constructor Create;
    destructor Destroy; override;
    class procedure Call(Timeout: Integer = 2000);
  end;

  TTimerProc = procedure of object;

  TTimerManager = class
  strict private type
    TTimerEventQueue = class(TThreadedQueue<TFmxHandle>)
    private
      const QueueSize = 128;
    private
      FLock: TObject; // a dedicated lock object to avoid locking conflicts with TThreadedQueue<T>
      FShadowQueue: TList<TFmxHandle>;
    public
      constructor Create; overload;
      destructor Destroy; override;
      function PushItem(const AItem: TFmxHandle): TWaitResult; reintroduce; overload;
      function PopItem(var AQueueSize: Integer; var AItem: TFmxHandle): TWaitResult; reintroduce; overload;
    end;

  strict private
    FHandlers: TDictionary<TFmxHandle, TTimerProc>;
    FQueue: TTimerEventQueue;
    class var FInstance: TTimerManager;
    class function GetInstance: TTimerManager; static;
    procedure DoOnTimer(TimerHandle: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    function CreateTimer(Interval: Integer; TimerFunc: TTimerProc): TFmxHandle;
    procedure DestroyTimer(TimerHandle: TFmxHandle);
    procedure CheckSynchronize;
    procedure KillAllTimers;
    class property Current: TTimerManager read GetInstance;
  end;

{ TTimerManager }

{ TTimerManager.TTimerEventQueue }

constructor TTimerManager.TTimerEventQueue.Create;
begin
  FLock := TObject.Create;
  FShadowQueue := TList<TFmxHandle>.Create;
  FShadowQueue.Capacity := QueueSize;
  inherited Create(QueueSize, 0, 0);
end;

destructor TTimerManager.TTimerEventQueue.Destroy;
begin
  FLock.Free;
  inherited;
end;

function TTimerManager.TTimerEventQueue.PopItem(var AQueueSize: Integer; var AItem: TFmxHandle): TWaitResult;
begin
  TMonitor.Enter(FLock);
  try
    Result := inherited PopItem(AQueueSize, AItem);
    if Result = TWaitResult.wrSignaled then
      FShadowQueue.Remove(AItem);
  finally
    TMonitor.Exit(FLock);
  end;
end;

function TTimerManager.TTimerEventQueue.PushItem(const AItem: TFmxHandle): TWaitResult;
begin
  Result := TWaitResult.wrError;
  TMonitor.Enter(FLock);
  try
    if not FShadowQueue.Contains(AItem) then
    begin
      Result := inherited PushItem(AItem);
      FShadowQueue.Add(AItem);
    end;
  finally
    TMonitor.Exit(FLock);
  end;
end;

constructor TTimerManager.Create;
begin
  FHandlers := TDictionary<TFmxHandle, TTimerProc>.Create;
  FQueue := TTimerEventQueue.Create;
  AndroidTimerSetHandler(DoOnTimer);
end;

destructor TTimerManager.Destroy;
begin
  AndroidTimerSetHandler(nil);
  FQueue.Free;
  FHandlers.Free;
  inherited;
end;

function TTimerManager.CreateTimer(Interval: Integer; TimerFunc: TTimerProc): TFmxHandle;
var
  TimerHandle: Integer;
begin
  TMonitor.Enter(Self);
  try
    TimerHandle := AndroidTimerCreate;
    FHandlers.Add(TimerHandle, TimerFunc);
    AndroidTimerSetInterval(TimerHandle, Interval);
  finally
    TMonitor.Exit(Self);
  end;

  Result := TimerHandle;
end;

procedure TTimerManager.DestroyTimer(TimerHandle: TFmxHandle);
begin
  TMonitor.Enter(Self);
  try
    AndroidTimerDestroy(TimerHandle);
    FHandlers.Remove(TimerHandle);
  finally
    TMonitor.Exit(Self);
  end;
end;

procedure TTimerManager.DoOnTimer(TimerHandle: Integer);
begin
  FQueue.PushItem(TimerHandle);
end;

procedure TTimerManager.CheckSynchronize;
var
  Handle: TFmxHandle;
  QueueSize: Integer;
  Proc: TTimerProc;
  HasProc: Boolean;
begin
  while (FQueue.PopItem(QueueSize, Handle) = TWaitResult.wrSignaled) and not FQueue.ShutDown do
  begin
    TMonitor.Enter(Self);
    try
      HasProc := FHandlers.TryGetValue(Handle, Proc);
    finally
      TMonitor.Exit(Self);
    end;
    if HasProc and Assigned(Proc) then
      Proc;
  end;
end;

class function TTimerManager.GetInstance: TTimerManager;
begin
  if FInstance = nil then
    FInstance := TTimerManager.Create;
  Result := FInstance;
end;

procedure TTimerManager.KillAllTimers;
var
  Keys: TArray<TFmxHandle>;
  I: Integer;
begin
  FQueue.DoShutDown;
  Keys := FHandlers.Keys.ToArray;
  for I := Length(Keys) - 1 downto 0 do
  try
    DestroyTimer(Keys[I]);
  except
    Continue;
  end;
  FInstance := nil;
end;


{ TAndroidTimer }

const
  cIdNoTimer: TFmxHandle = TFmxHandle(-1);

constructor TAndroidTimer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FInterval := 1000;
  FTimerHandle := cIdNoTimer;
  FEnabled := True;
end;

destructor TAndroidTimer.Destroy;
begin
  FOnTimer := nil;
  FEnabled := False;
  KillTimer;
  inherited Destroy;
end;

procedure TAndroidTimer.KillTimer;
begin
  if FTimerHandle <> cIdNoTimer then
  begin
    TTimerManager.Current.DestroyTimer(FTimerHandle);
    FTimerHandle := cIdNoTimer;
  end;
end;

procedure TAndroidTimer.Loaded;
begin
  inherited Loaded;
  UpdateTimer;
end;

procedure TAndroidTimer.UpdateTimer;
begin
  KillTimer;
  if (FEnabled) and (FInterval > 0) and (([csDesigning, csLoading, csDestroying] * ComponentState = [])) and
    Assigned(FOnTimer) then
  begin
    FTimerHandle := TTimerManager.Current.CreateTimer(FInterval, Timer);
    if FTimerHandle = 0 then
      FEnabled := False;
  end;
end;

procedure TAndroidTimer.Timer;
begin
  if (FEnabled) and (FInterval > 0) then
    DoOnTimer;
end;

procedure TAndroidTimer.SetOnTimer(Value: TNotifyEvent);
begin
  if TMethod(Value) = TMethod(FOnTimer) then
    Exit;
  FOnTimer := Value;
  UpdateTimer;
end;

procedure TAndroidTimer.DoOnTimer;
begin
  if Assigned(FOnTimer) then
    FOnTimer(Self);
end;

procedure TAndroidTimer.SetEnabled(Value: Boolean);
begin
  if (Value <> FEnabled) then
  begin
    FEnabled := Value;
    UpdateTimer;
  end;
end;

procedure TAndroidTimer.SetInterval(Value: Cardinal);
begin
  if (Value <> FInterval) then
  begin
    FInterval := Value;
    UpdateTimer;
  end;
end;


{ TPostRunnable }

constructor TPostRunnable.Create(ACallback: TCallBack);
begin
  Create;
  FCallback := ACallback;
end;

constructor TPostRunnable.Create(AMethodCallback: TMethodCallback);
begin
  Create;
  FMethodCallback := AMethodCallback;
end;

constructor TPostRunnable.Create;
begin
  inherited Create;
  FFinished := False;
end;

procedure TPostRunnable.run;
begin
  try
    if Assigned(FCallback) then
      FCallback;
    if Assigned(FMethodCallback) then
      FMethodCallback;
  finally
    FFinished := True;
    TFinishedRunnableCollector.Call;
  end;
end;

procedure TPostRunnable.Post;
var
  Handler: JHandler;
begin
  Handler := TJHandler.JavaClass.init(TJLooper.JavaClass.getMainLooper);
  Handler.post(Self);
end;

var
  ActiveJavaRunnables: TThreadList<TPostRunnable>;

procedure CallInPostRunnable(AMethod: TMethodCallback);
var
  Runnable: TPostRunnable;
begin
  Runnable := TPostRunnable.Create(AMethod);
  ActiveJavaRunnables.Add(Runnable);
  Runnable.Post;
end;

procedure CallInPostRunnable(AMethod: TCallBack);
var
  Runnable: TPostRunnable;
begin
  Runnable := TPostRunnable.Create(AMethod);
  ActiveJavaRunnables.Add(Runnable);
  Runnable.Post;
end;

procedure CallInPostRunnableAndWaitFinishing(AMethod: TMethodCallback);
var
  Event: TEvent;
begin
  Event := TEvent.Create;
  try
    CallInPostRunnable(procedure
      begin
        if Assigned(AMethod) then
          AMethod;
        Event.SetEvent;
      end);
    Event.WaitFor;
  finally
    Event.DisposeOf;
  end;
end;

procedure CallInPostRunnableAndWaitFinishing(AMethod: TCallBack);
var
  Event: TEvent;
begin
  Event := TEvent.Create;
  try
    CallInPostRunnable(procedure
      begin
        if Assigned(AMethod) then
          AMethod;
        Event.SetEvent;
      end);
    Event.WaitFor;
  finally
    Event.DisposeOf;
  end;
end;

{ TFinishedThreadCollector }

procedure TFinishedRunnableCollector.Start(Timeout: Integer = 2000);
begin
  if SupportTimer then
  begin
    if HasTimer then
      TTimerManager.Current.DestroyTimer(FTimerHandle);
    FTimerHandle := TTimerManager.Current.CreateTimer(Timeout, DoTimer);
  end;
end;

function TFinishedRunnableCollector.SupportTimer: Boolean;
begin
  Result := True;
//  Result := FTimerService <> nil;
end;

procedure TFinishedRunnableCollector.DoTimer;
var
  I: Integer;
  JavaThread: TPostRunnable;
  List: TList<TPostRunnable>;
begin
  try
    List := ActiveJavaRunnables.LockList;
    try
      I := 0;
      while (I < List.Count) do
      begin
        JavaThread := List[I];
        if JavaThread.Finished then
          List.Remove(JavaThread)
        else
          Inc(I);
      end;
    finally
      ActiveJavaRunnables.UnlockList;
    end;
  finally
    if SupportTimer then
      TTimerManager.Current.DestroyTimer(FTimerHandle);
  end;
end;

function TFinishedRunnableCollector.HasTimer: Boolean;
begin
  Result := FTimerHandle <> 0;
end;

constructor TFinishedRunnableCollector.Create;
begin
  FTimerHandle := 0;
end;

destructor TFinishedRunnableCollector.Destroy;
begin
  DoTimer;
  inherited Destroy;
end;

class procedure TFinishedRunnableCollector.Call(Timeout: Integer);
begin
  if not Assigned(FFinishedThreadCollector) then
    FFinishedThreadCollector := TFinishedRunnableCollector.Create;

  FFinishedThreadCollector.Start;
  if not FFinishedThreadCollector.SupportTimer then
    FFinishedThreadCollector.DoTimer;
end;

initialization
  ActiveJavaRunnables := TThreadList<TPostRunnable>.Create;

finalization
  TTimerManager.Current.KillAllTimers;
  ActiveJavaRunnables.DisposeOf;

{$ENDIF}

end.
