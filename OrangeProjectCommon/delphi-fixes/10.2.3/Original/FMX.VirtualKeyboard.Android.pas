{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.VirtualKeyboard.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.SysUtils, System.UITypes, System.Types,
  System.SyncObjs, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Embarcadero, Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge, FMX.Types, FMX.Helpers.Android, FMX.VirtualKeyboard;

type
  TVirtualKeyboardAndroid = class;

  TVKListener = class(TJavaLocal, JVKStateChangeListener)
  private
    [Weak] FKeyboardService: TVirtualKeyboardAndroid;
    FEvent: TEvent;
    function ObtainKeyboardRect: TRect;
  public
    constructor Create(const AService: TVirtualKeyboardAndroid);
    destructor Destroy; override;
    procedure ResetEvent;
    procedure WaitEvent;
    { JVKStateChangeListener }
    procedure onVirtualKeyboardShown; cdecl;
    procedure onVirtualKeyboardHidden; cdecl;
  end;

  TVirtualKeyboardAndroid = class(TInterfacedObject, IFMXVirtualKeyboardService)
  private type
    TvkbState = (Hidden, Shown);
  private
    FState: TvkbState;
    FVKListener: TVKListener;
    FTransient: Boolean;
    function IsAutoShow: Boolean;
    procedure SetState(Value: TvkbState);
    procedure RegisterListener;
    procedure RegisterService;
    procedure UnregisterService;
  public
    constructor Create;
    destructor Destroy; override;
    { IFMXVirtualKeyboardService }
    function ShowVirtualKeyboard(const AControl: TFmxObject): Boolean;
    function HideVirtualKeyboard: Boolean;
    function GetVirtualKeyboardState: TVirtualKeyboardStates;
    procedure SetTransientState(Value: Boolean);
    property VirtualKeyboardState: TVirtualKeyboardStates read GetVirtualKeyboardState;
  end;

implementation

uses
  System.Messaging, FMX.Forms, FMX.Platform.Android, FMX.Platform;

{ TAndroidVirtualKeyboardService }

function TVirtualKeyboardAndroid.IsAutoShow: Boolean;
begin
  Result := VKAutoShowMode in [TVKAutoShowMode.Always, TVKAutoShowMode.DefinedBySystem];
end;

procedure TVirtualKeyboardAndroid.RegisterListener;
begin
  if FVKListener = nil then
  begin
    FVKListener := TVKListener.Create(Self);
    MainActivity.getTextEditorProxy.addOnVKStateChangeListener(FVKListener);
  end;
end;

procedure TVirtualKeyboardAndroid.RegisterService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService) then
    TPlatformServices.Current.AddPlatformService(IFMXVirtualKeyboardService, Self);
end;

constructor TVirtualKeyboardAndroid.Create;
begin
  inherited;
  RegisterService;
end;

destructor TVirtualKeyboardAndroid.Destroy;
begin
  UnregisterService;
  inherited;
end;

function TVirtualKeyboardAndroid.GetVirtualKeyboardState: TVirtualKeyboardStates;
begin
  Result := [];
  if IsAutoShow then
    Include(Result, TVirtualKeyboardState.AutoShow);
  if FTransient then
    Include(Result, TVirtualKeyboardState.Transient);
  if FState = TvkbState.Shown then
    Include(Result, TVirtualKeyboardState.Visible);
end;

function TVirtualKeyboardAndroid.HideVirtualKeyboard: Boolean;
var
  TextView: JFMXTextEditorProxy;
begin
  Result := False;
  try
    if not FTransient then
    begin
      RegisterListener;
      TextView := MainActivity.getTextEditorProxy;
      FVKListener.ResetEvent;
      TextView.setFocusable(false);
      TextView.setFocusableInTouchMode(false);
      TextView.showSoftInput(false);
      TextView.clearFocus;
      FVKListener.WaitEvent;
      Result := FState = TvkbState.Hidden;
    end
  except
    Application.HandleException(Screen.ActiveForm);
  end;
end;

function TVirtualKeyboardAndroid.ShowVirtualKeyboard(const AControl: TFmxObject): Boolean;
var
  TextView: JFMXTextEditorProxy;
begin
  RegisterListener;
  TextView := MainActivity.getTextEditorProxy;
  FVKListener.ResetEvent;
  TextView.setFocusable(true);
  TextView.setFocusableInTouchMode(true);
  TextView.requestFocus;
  TextView.showSoftInput(true);
  FVKListener.WaitEvent;
  Result := FState = TvkbState.Shown;
end;

procedure TVirtualKeyboardAndroid.UnregisterService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXVirtualKeyboardService);
end;

procedure TVirtualKeyboardAndroid.SetState(Value: TvkbState);
begin
  if FState <> Value then
  begin
    FState := Value;
    TMessageManager.DefaultManager.SendMessage(Self,
      TVKStateChangeMessage.Create(FState = TvkbState.Shown, FVKListener.ObtainKeyboardRect), True);
  end;
end;

procedure TVirtualKeyboardAndroid.SetTransientState(Value: Boolean);
begin
  FTransient := Value;
end;

{ TVKListener }

constructor TVKListener.Create(const AService: TVirtualKeyboardAndroid);
begin
  inherited Create;
  FKeyboardService := AService;
  FEvent := TEvent.Create;
end;

procedure TVKListener.ResetEvent;
begin
  FEvent.ResetEvent;
end;

procedure TVKListener.WaitEvent;
begin
  FEvent.WaitFor(250);
end;

procedure WaitingForContentChanged(const Listener: TVKListener);
// The only way to get correct keyboard size is waiting little bit to time when system changes ContentView properties
// 1000ms maximum timeout. Usually it takes only one iteration. This procedure called from separated thread and main
// thread not blocked.
const
  MaxCounter = 20;
  SleepingTime = 50;
var
  Counter: Integer;
  KeyboardRect: TRect;
begin
  Counter := 0;
  KeyboardRect := Listener.ObtainKeyboardRect;
  while (KeyboardRect = Listener.ObtainKeyboardRect) and (Counter < MaxCounter) do
  begin
    Sleep(SleepingTime);
    Inc(Counter);
  end;
end;

procedure TVKListener.onVirtualKeyboardShown;
begin
  WaitingForContentChanged(Self);
  TThread.Synchronize(nil, procedure
  begin
    FKeyboardService.SetState(TVirtualKeyboardAndroid.TvkbState.Shown);
    FEvent.SetEvent;
  end);
end;

procedure TVKListener.onVirtualKeyboardHidden;
begin
  TThread.Synchronize(nil, procedure
  begin
    FKeyboardService.SetState(TVirtualKeyboardAndroid.TvkbState.Hidden);
    FEvent.SetEvent;
  end);
end;

destructor TVKListener.Destroy;
begin
  FEvent.Free;
  inherited;
end;

function TVKListener.ObtainKeyboardRect: TRect;
var
  ContentRect, TotalRect: JRect;
begin
  ContentRect := TJRect.Create;
  TotalRect := TJRect.Create;
  MainActivity.getWindow.getDecorView.getWindowVisibleDisplayFrame(ContentRect);
  MainActivity.getWindow.getDecorView.getDrawingRect(TotalRect);
  Result := TRectF.Create(ConvertPixelToPoint(TPointF.Create(TotalRect.left, TotalRect.top + ContentRect.height)),
    ConvertPixelToPoint(TPointF.Create(TotalRect.right, TotalRect.bottom))).Truncate;
end;

end.

