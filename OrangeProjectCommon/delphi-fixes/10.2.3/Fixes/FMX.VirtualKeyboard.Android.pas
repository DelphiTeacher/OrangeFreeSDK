(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2014-04-16　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.2.3(10.2 Release 3)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)

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
  //Fix And Add By Flying Wang.
  private
    FTimerForCheckHide: TTimer;
    procedure OnTimerForCheckHide(Sender: TObject);
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

//Fix And Add By Flying Wang.
var
///	<summary>
///   按返回的时候，如果存在焦点，只会使输入框失去焦点，只有输入框没有焦点的时候，才关闭输入法。
///	</summary>
  vkHardwareBackMustKillFocused: Boolean = True;
///	<summary>
///   是否使用 Timer 检查键盘。
///   注意：为了兼容物理键盘，需要在键盘隐藏之后，检查键盘是否显示。
///	</summary>
  AutoFixVKHideBugByTimerForCheckHide: Boolean = True;
///	<summary>
///   当没有输入焦点的时候，自动关闭输入框。
///	</summary>
  AutoHideWhenNoFocused: Boolean = True;
///	<summary>
///   Timer 检查键盘 的 Interval。
///	</summary>
  TimerForCheckHideInterval: Cardinal = 266;

///	<summary>
///  GetVirtualKeyboardHeight Exclude NavigationBar
///  When &lt; 1, it means VirtualKeyBoard Hided.
///	</summary>
function GetVirtualKeyboardRealHeight: Single;
///	<summary>
///  GetVirtualKeyboardHeight Include NavigationBar
///	</summary>
function GetVirtualKeyboardTotalHeight: Single;


///	<summary>
///	  <para>
///     IF not AutoFixVKHideBugByTimerForCheckHide.
///	    Use a timer to call me. it will fix VirtualKeyboard Hide Message.
///	  </para>
///	  <para>
///     如果您不打算使用本代码内部的修复。
///	    用一个 TIMER 调用本函数，可以修复虚拟键盘的隐藏消息。建议虚拟键盘显示后启用 TIMER。
///	  </para>
///	</summary>
procedure ProcessVirtualKeyboardEvent;

///	<summary>
///	  强制输入控件隐藏输入法。
///       Just Test
///	</summary>
function HideInputForFixVirtualKeyboardEvent(Focused: Boolean = False): Boolean;

implementation

uses
  //Fix And Add By Flying Wang.
  FMX.Platform.Screen.Android,
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
  //Fix And Add By Flying Wang.
  FTimerForCheckHide.Enabled := AutoFixVKHideBugByTimerForCheckHide;
  FTimerForCheckHide.Interval := TimerForCheckHideInterval;
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
  //Fix Error By 爱吃猪头肉 & Flying Wang
  FTimerForCheckHide := TTimer.Create(nil);
  FTimerForCheckHide.Enabled := False;
  FTimerForCheckHide.Interval := TimerForCheckHideInterval;
  FTimerForCheckHide.OnTimer := OnTimerForCheckHide;
end;

destructor TVirtualKeyboardAndroid.Destroy;
begin
  UnregisterService;
  //Fix Error By 爱吃猪头肉 & Flying Wang
  FreeAndNil(FTimerForCheckHide);
  inherited;
end;

//Fix Error By 爱吃猪头肉 & Flying Wang
procedure TVirtualKeyboardAndroid.OnTimerForCheckHide(Sender: TObject);
var
  VKObj: IVirtualKeyboardControl;
begin
  if not AutoFixVKHideBugByTimerForCheckHide then exit;
  FTimerForCheckHide.Interval := TimerForCheckHideInterval;
  GetVirtualKeyBoardState;
  VKObj := nil;
  if (Screen.ActiveForm <> nil) and (Screen.ActiveForm.Focused <> nil) then
    Screen.ActiveForm.Focused.QueryInterface(IVirtualKeyboardControl, VKObj);
  FTimerForCheckHide.Enabled := (VKObj <> nil);
  if (VKObj = nil) and AutoHideWhenNoFocused and (GetVirtualKeyboardRealHeight > 0) then
  begin
    HideInputForFixVirtualKeyboardEvent(False);
  end;
end;

function ObtainKeyboardRect(IncludeNavigationBar: Boolean = False): TRect;
var
  ContentRect, TotalRect: JRect;
  NavigationBarPixelHeight,
  Attributes_flags: Integer;
  IsTRANSLUCENT_NAVIGATION,
  IsFullScreen: Boolean;
  MFSWS: IFMXFullScreenWindowService;
begin
  IsTRANSLUCENT_NAVIGATION := False;
  IsFullScreen := False;
  NavigationBarPixelHeight := 0;
  Attributes_flags := 0;
  try
    if TPlatformServices.Current.SupportsPlatformService(
      IFMXFullScreenWindowService, MFSWS) then
    begin
      IsFullScreen := MFSWS.GetFullScreen(nil);
    end;
    Attributes_flags := MainActivity.getWindow.getAttributes.flags;
    if TOSVersion.Check(4,4) then
    begin
      IsTRANSLUCENT_NAVIGATION := (Attributes_flags and
        TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_NAVIGATION) =
          TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_NAVIGATION;
    end;
    //uses fixed FMX.Platform.Android
    NavigationBarPixelHeight := GetNavigationBarPixelHeight;
  except
    //防止没有处于 UIThread. 如果用 CallInUIThread 会来不及运行。如果用 CallInUIThreadAndWaitFinishing 会导致切换 APP 卡死。
  end;
  if (not IsTRANSLUCENT_NAVIGATION) and (not IsFullScreen) then
    NavigationBarPixelHeight := 0;

  ContentRect := TJRect.Create;
  TotalRect := TJRect.Create;
  MainActivity.getWindow.getDecorView.getWindowVisibleDisplayFrame(ContentRect);
  MainActivity.getWindow.getDecorView.getDrawingRect(TotalRect);
  //修正了在 NavigationBar 透明的时候的高度。
  if not IncludeNavigationBar then
  begin
    TotalRect.bottom := TotalRect.bottom - NavigationBarPixelHeight;
//  end
//  else if IsTRANSLUCENT_NAVIGATION and (NavigationBarPixelHeight > 0) and (not IsFullScreen) then
//  begin
//    TotalRect.bottom := TotalRect.bottom - 10; //个别设备，可能会多一些像素。但是不影响使用。
  end;

//修正了高度。下面官方的同名函数，获取的高度错误，
  Result := TRectF.Create(ConvertPixelToPoint(TPointF.Create(ContentRect.left, ContentRect.top + ContentRect.height)),
    ConvertPixelToPoint(TPointF.Create(ContentRect.right, TotalRect.bottom))).Truncate;
end;

function GetVirtualKeyboardHeight(IncludeNavigationBar: Boolean = False): Single;
var
  KeyboardRect: TRect;
begin
  Result := 0;
  KeyboardRect := ObtainKeyboardRect(IncludeNavigationBar);
  if (KeyboardRect.Width < 1) or (KeyboardRect.Height < 1) then
  begin
    exit;
  end;
  Result := KeyboardRect.Height;
end;

function GetVirtualKeyboardRealHeight: Single;
begin
  Result := GetVirtualKeyboardHeight(False);
end;

function GetVirtualKeyboardTotalHeight: Single;
begin
  Result := GetVirtualKeyboardHeight(True);
end;

procedure ProcessVirtualKeyboardEvent;
var
  VirtualKeyboard: IFMXVirtualKeyboardService;
  VirtualKeyboardAndroid: TVirtualKeyboardAndroid;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
    IInterface(VirtualKeyboard)) then
  begin
    VirtualKeyboardAndroid := TVirtualKeyboardAndroid(VirtualKeyboard);
    VirtualKeyboardAndroid.GetVirtualKeyBoardState;
  end;
end;

function HideInputForFixVirtualKeyboardEvent(Focused: Boolean = False): Boolean;
var
  TextView: JFMXTextEditorProxy;
begin
  Result := False;
  try
    if (not Focused) and (Screen.ActiveForm <> nil) then
      Screen.ActiveForm.Focused := nil;
    TextView := MainActivity.getTextEditorProxy;
    if TextView = nil then exit;
      CallInUIThread(
        procedure
        begin
          if Focused then
          begin
            TextView.setFocusable(true);
            TextView.setFocusableInTouchMode(true);
            TextView.showSoftInput(false);
            TextView.requestFocus;
          end
          else
          begin
            TextView.setFocusable(false);
            TextView.setFocusableInTouchMode(false);
            TextView.clearFocus;
          end;
        end);
      Result := True;
  except
    Application.HandleException(Screen.ActiveForm);
  end;
end;

var
  LastVirtualKeyboardRealHeight: Single = 0;
  NewVirtualKeyboardRealHeight: Single = 0;
function TVirtualKeyboardAndroid.GetVirtualKeyboardState: TVirtualKeyboardStates;
var
  KeyboardRect: TRect;
begin
  Result := [];
  if IsAutoShow then
    Result := Result + [TVirtualKeyboardState.AutoShow];
  if FTransient then
    Result := Result + [TVirtualKeyboardState.Transient];
  if (FState = TvkbState.Shown) then
  begin
    NewVirtualKeyboardRealHeight := GetVirtualKeyboardRealHeight;
    if NewVirtualKeyboardRealHeight < 1 then
    begin
      KeyboardRect := ObtainKeyboardRect(False);
      SetState(TVirtualKeyboardAndroid.TvkbState.Hidden);
      TMessageManager.DefaultManager.SendMessage(Self, TVKStateChangeMessage.Create(false, KeyboardRect), True);
      LastVirtualKeyboardRealHeight := 0;
    end
    else
    begin
      FTimerForCheckHide.Enabled := AutoFixVKHideBugByTimerForCheckHide;
      FTimerForCheckHide.Interval := TimerForCheckHideInterval;
      if (LastVirtualKeyboardRealHeight <> NewVirtualKeyboardRealHeight) then
      begin
        KeyboardRect := ObtainKeyboardRect(False);
        //发送新的高度。 //不能使用线程。会导致死锁。
        TMessageManager.DefaultManager.SendMessage(Self, TVKStateChangeMessage.Create(true, KeyboardRect), True);
      end;
      LastVirtualKeyboardRealHeight := NewVirtualKeyboardRealHeight;
    end;
  end
  else
  begin
    LastVirtualKeyboardRealHeight := 0;
    NewVirtualKeyboardRealHeight := GetVirtualKeyboardRealHeight;
    if NewVirtualKeyboardRealHeight >= 1 then
    begin
      FTimerForCheckHide.Enabled := AutoFixVKHideBugByTimerForCheckHide;
      FTimerForCheckHide.Interval := TimerForCheckHideInterval;
      KeyboardRect := ObtainKeyboardRect(False);
      //不能使用线程。会导致死锁。
      SetState(TVirtualKeyboardAndroid.TvkbState.Shown);
      TMessageManager.DefaultManager.SendMessage(Self, TVKStateChangeMessage.Create(true, KeyboardRect), True);
      LastVirtualKeyboardRealHeight := NewVirtualKeyboardRealHeight;
    end;
  end;
  if FState = TvkbState.Shown then
    Result := Result + [TVirtualKeyboardState.Visible];
end;
//fix or add end.

//function TVirtualKeyboardAndroid.GetVirtualKeyboardState: TVirtualKeyboardStates;
//begin
//  Result := [];
//  if IsAutoShow then
//    Include(Result, TVirtualKeyboardState.AutoShow);
//  if FTransient then
//    Include(Result, TVirtualKeyboardState.Transient);
//  if FState = TvkbState.Shown then
//    Include(Result, TVirtualKeyboardState.Visible);
//end;

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

