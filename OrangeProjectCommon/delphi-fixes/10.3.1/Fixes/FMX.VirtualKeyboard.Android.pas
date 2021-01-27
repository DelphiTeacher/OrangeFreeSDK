(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2014-04-16　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)

{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2013-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.VirtualKeyboard.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Types, System.Messaging, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNI.Embarcadero,
  Androidapi.JNIBridge, FMX.Types, FMX.VirtualKeyboard;

type
  TVirtualKeyboardAndroid = class;

  TKeyboardStateChangedListener = class(TJavaLocal, JOnKeyboardStateChangedListener)
  private
    [Weak] FKeyboardService: TVirtualKeyboardAndroid;
    FNeedNotifyAboutFrameChanges: Boolean;
    FPreviousVKRect: TRect;
  public
    constructor Create(const AService: TVirtualKeyboardAndroid);
    { JOnKeyboardStateChangedListener }
    procedure onVirtualKeyboardWillShown; cdecl;
    procedure onVirtualKeyboardFrameChanged(newFrame: JRect); cdecl;
    procedure onVirtualKeyboardWillHidden; cdecl;
  end;

  TVirtualKeyboardAndroid = class(TInterfacedObject, IFMXVirtualKeyboardService)
  private
    FKeyboardStateListener: TKeyboardStateChangedListener;
    FTransient: Boolean;
    procedure RegisterService;
    procedure UnregisterService;
  protected
    function IsAutoShow: Boolean;
    function DefineNativeView(const AObject: TFmxObject): JView;
    procedure SendNotificationAboutKeyboardEvent(const AVKRect: TRect);
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
/////	<summary>
/////   是否使用 Timer 检查键盘。
/////   注意：为了兼容物理键盘，需要在键盘隐藏之后，检查键盘是否显示。
/////	</summary>
//  AutoFixVKHideBugByTimerForCheckHide: Boolean = True;
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
  System.SysUtils, FMX.Forms, FMX.Controls, FMX.Controls.Presentation, FMX.Platform, FMX.Platform.Android,
  FMX.Platform.UI.Android;

{ TAndroidVirtualKeyboardService }

function TVirtualKeyboardAndroid.IsAutoShow: Boolean;
begin
  Result := VKAutoShowMode in [TVKAutoShowMode.Always, TVKAutoShowMode.DefinedBySystem];
end;

procedure TVirtualKeyboardAndroid.RegisterService;
begin
  if not TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService) then
    TPlatformServices.Current.AddPlatformService(IFMXVirtualKeyboardService, Self);
end;

procedure TVirtualKeyboardAndroid.UnregisterService;
begin
  TPlatformServices.Current.RemovePlatformService(IFMXVirtualKeyboardService);
end;

constructor TVirtualKeyboardAndroid.Create;
begin
  inherited;
  RegisterService;
  FKeyboardStateListener := TKeyboardStateChangedListener.Create(Self);
  MainActivity.getVirtualKeyboard.addOnKeyboardStateChangedListener(FKeyboardStateListener);
end;

function TVirtualKeyboardAndroid.DefineNativeView(const AObject: TFmxObject): JView;

  function IsNativeControl: Boolean;
  begin
    Result := (AObject is TPresentedControl) and (TPresentedControl(AObject).ControlType = TControlType.Platform);
  end;

  function GetNativeView: JView;
  begin
    Result := JView(TPresentedControl(AObject).PresentationProxy.NativeObject);
  end;

begin
  if IsNativeControl then
    Result := GetNativeView
  else
    Result := MainActivity.getEditText;
end;

destructor TVirtualKeyboardAndroid.Destroy;
begin
  MainActivity.getVirtualKeyboard.removeOnKeyboardStateChangedListener(FKeyboardStateListener);
  FreeAndNil(FKeyboardStateListener);
  UnregisterService;
  inherited;
end;

//Fix or Add By 爱吃猪头肉 & Flying Wang
function ObtainKeyboardRect(IncludeNavigationBar: Boolean = False): TRect;
var
  VirtualKeyboardBottom,
  NavigationBarRealPixelHeight,
  NavigationBarPixelHeight,
  FullScreenHeight,
  CurrBottom,
  CurrBottomWithNavigationBar: Integer;
  windowInsets: JRect;
  IsNavigationBarInRect,
  IsNavigationBarIsTranslucent: Boolean;
begin
  windowInsets := MainActivity.getWindowInsets;
  FullScreenHeight := MainActivity.getWindow.getDecorView.getHeight;
  NavigationBarRealPixelHeight := GetNavigationBarPixelHeight(False, False, True); //真实
  NavigationBarPixelHeight := GetNavigationBarPixelHeight(True, False, False); //逻辑
  IsNavigationBarIsTranslucent := GetNavigationBarIsTranslucent;
  IsNavigationBarInRect := (NavigationBarRealPixelHeight <> 0);
  if IsNavigationBarInRect and (not IsNavigationBarIsTranslucent) then //没有处于导航条透明。
  begin
    IsNavigationBarInRect := False;
  end;
  //GetNavigationBarIsHide 不准，键盘弹起，也是 Hide 。
  if GetIsFullScreen(False) and GetNavigationBarIsHide then //全屏 并 导航条隐藏。
  begin
    windowInsets.bottom := 0;
    windowInsets.right := 0;
    IsNavigationBarInRect := False;
    if CurrVirtualKeyboardPixelTopForEvent >= FullScreenHeight - NavigationBarPixelHeight then
    begin
      CurrVirtualKeyboardPixelTopForEvent := 0; //键盘肯定也隐藏了，键盘显示，导航条也显示了。
    end
    else // 键盘弹起了。
    begin
      windowInsets.bottom := NavigationBarPixelHeight; //逻辑
      windowInsets.right := GetNavigationBarPixelHeight(False, True, False); //逻辑
      IsNavigationBarInRect := (NavigationBarRealPixelHeight <> 0);
    end;
  end;

  VirtualKeyboardBottom := FullScreenHeight - windowInsets.bottom;
  CurrBottomWithNavigationBar := VirtualKeyboardBottom;
  if IsNavigationBarInRect then
  begin
    CurrBottomWithNavigationBar := VirtualKeyboardBottom + NavigationBarPixelHeight;
  end;

  CurrBottom := VirtualKeyboardBottom;
  if IncludeNavigationBar then
  begin
    CurrBottom := CurrBottomWithNavigationBar;
  end;

  if not MainActivity.getVirtualKeyboard.isVirtualKeyboardShown then
  begin
    CurrVirtualKeyboardPixelTopForEvent := VirtualKeyboardBottom;
  end;

  if (CurrVirtualKeyboardPixelTopForEvent = 0) then
    CurrVirtualKeyboardPixelTopForEvent := VirtualKeyboardBottom;
  if CurrVirtualKeyboardPixelTopForEvent > CurrBottomWithNavigationBar then
    CurrVirtualKeyboardPixelTopForEvent := VirtualKeyboardBottom;

  CurrVirtualKeyboardPixelTop := CurrVirtualKeyboardPixelTopForEvent;

  Result := TRect.Create(0, Round(CurrVirtualKeyboardPixelTop),
      MainActivity.getWindow.getDecorView.getWidth - windowInsets.right, CurrBottom);
  if Result.Height < 1 then
    Result.Height := 0;
end;

//Fix Error By 爱吃猪头肉 & Flying Wang
//这个代码可以用于 Timer。不能依靠事件。
function GetVirtualKeyboardHeight(IncludeNavigationBar: Boolean = False): Single;
var
  KeyboardRect: TRect;
begin
  KeyboardRect := ObtainKeyboardRect(IncludeNavigationBar);
  Result := KeyboardRect.Height;
  if (Result < 1) then
  begin
    Result := 0;
  end;
  CurrVirtualKeyboardPixelTop := KeyboardRect.Top;
  CurrVirtualKeyboardPixelTotalHeight := Result;
  Result := PlatformAndroid.WindowService.PixelToPoint(TPointF.Create(0, Result)).Y;
  if (Result < 1) then
  begin
    Result := 0;
  end;
  CurrVirtualKeyboardTotalFmxHeight := Result;
  CurrVirtualKeyboardFmxTop := PlatformAndroid.WindowService.PixelToPoint(TPointF.Create(0, CurrVirtualKeyboardPixelTop)).Y;
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
begin
  Result := False;
  try
    Result := MainActivity.getVirtualKeyboard.hide;
    if Focused and (MainActivity.getEditText <> nil) then
      MainActivity.getEditText.setFocusable(true);
  except
    Application.HandleException(Screen.ActiveForm);
  end;
end;

var
  LastVKRect: TRect;
  LastVirtualKeyboardTotalHeight: Single = 0;
  NewVirtualKeyboardTotalHeight: Single = 0;
function TVirtualKeyboardAndroid.GetVirtualKeyboardState: TVirtualKeyboardStates;
var
  KeyboardRect: TRect;
begin
  Result := [];
  if IsAutoShow then
    Include(Result, TVirtualKeyboardState.AutoShow);
  if FTransient then
    Include(Result, TVirtualKeyboardState.Transient);

  KeyboardRect := ObtainKeyboardRect(True);
  NewVirtualKeyboardTotalHeight := KeyboardRect.Height;
  if MainActivity.getVirtualKeyboard.isVirtualKeyboardShown then
  begin
    if NewVirtualKeyboardTotalHeight < 1 then
    begin
      TMessageManager.DefaultManager.SendMessage(Self, TVKStateChangeMessage.Create(false, KeyboardRect), True);
      LastVirtualKeyboardTotalHeight := 0;
    end
    else
    begin
      if (LastVKRect <> KeyboardRect) then
      begin
        TMessageManager.DefaultManager.SendMessage(Self, TVKStateChangeMessage.Create(true, KeyboardRect), True);
      end;
      LastVirtualKeyboardTotalHeight := NewVirtualKeyboardTotalHeight;
    end;
  end
  else
  begin
    LastVirtualKeyboardTotalHeight := 0;
    if NewVirtualKeyboardTotalHeight >= 1 then
    begin
      TMessageManager.DefaultManager.SendMessage(Self, TVKStateChangeMessage.Create(true, KeyboardRect), True);
      LastVirtualKeyboardTotalHeight := NewVirtualKeyboardTotalHeight;
    end;
  end;
  LastVKRect := KeyboardRect;
  if MainActivity.getVirtualKeyboard.isVirtualKeyboardShown then
    Include(Result, TVirtualKeyboardState.Visible);
end;

//fix or add end.

//function TVirtualKeyboardAndroid.GetVirtualKeyboardState: TVirtualKeyboardStates;
//begin
//  Result := [];
//  if IsAutoShow then
//    Include(Result, TVirtualKeyboardState.AutoShow);
//  if FTransient then
//    Include(Result, TVirtualKeyboardState.Transient);
//  if MainActivity.getVirtualKeyboard.isVirtualKeyboardShown then
//    Include(Result, TVirtualKeyboardState.Visible);
//end;

function TVirtualKeyboardAndroid.HideVirtualKeyboard: Boolean;
begin
  Result := False;
  try
    if not FTransient then
      Result := MainActivity.getVirtualKeyboard.hide;
  except
    Application.HandleException(Screen.ActiveForm);
  end;
end;

function TVirtualKeyboardAndroid.ShowVirtualKeyboard(const AControl: TFmxObject): Boolean;
var
  View: JView;
begin
  View := DefineNativeView(AControl);
  Result := MainActivity.getVirtualKeyboard.showFor(View);
end;

procedure TVirtualKeyboardAndroid.SendNotificationAboutKeyboardEvent(const AVKRect: TRect);
var
  Message: TVKStateChangeMessage;
begin
  Message := TVKStateChangeMessage.Create(TVirtualKeyboardState.Visible in VirtualKeyboardState, AVKRect);
  TMessageManager.DefaultManager.SendMessage(Self, Message, True);
end;

procedure TVirtualKeyboardAndroid.SetTransientState(Value: Boolean);
begin
  FTransient := Value;
end;

{ TKeyboardStateChangedListener }

constructor TKeyboardStateChangedListener.Create(const AService: TVirtualKeyboardAndroid);
begin
  inherited Create;
  FKeyboardService := AService;
  FNeedNotifyAboutFrameChanges := False;
  FPreviousVKRect := TRect.Empty;
end;

procedure TKeyboardStateChangedListener.onVirtualKeyboardWillShown;
begin
  FNeedNotifyAboutFrameChanges := FNeedNotifyAboutFrameChanges or
                                  not (TVirtualKeyboardState.Visible in FKeyboardService.VirtualKeyboardState);
end;

procedure TKeyboardStateChangedListener.onVirtualKeyboardFrameChanged(newFrame: JRect);
var
  VKRect: TRect;
begin
  VKRect.TopLeft := ConvertPixelToPoint(TPointF.Create(newFrame.Left, newFrame.Top)).Round;
  VKRect.BottomRight := ConvertPixelToPoint(TPointF.Create(newFrame.Right, newFrame.Bottom)).Round;

  //Fix or Add By 爱吃猪头肉
  CurrVirtualKeyboardPixelTopForEvent := newFrame.Top;
  CurrVirtualKeyboardPixelTop := newFrame.Top;
  VKRect := ObtainKeyboardRect(True);
  CurrVirtualKeyboardPixelTop := VKRect.Top;
  CurrVirtualKeyboardPixelTotalHeight := VKRect.Height;

  LastVKRect := VKRect;

  VKRect.TopLeft := ConvertPixelToPoint(VKRect.TopLeft).Round;
  VKRect.BottomRight := ConvertPixelToPoint(VKRect.BottomRight).Round;

  CurrVirtualKeyboardFmxTop := PlatformAndroid.WindowService.PixelToPoint(TPointF.Create(0, CurrVirtualKeyboardPixelTop)).Y;
  CurrVirtualKeyboardTotalFmxHeight := PlatformAndroid.WindowService.PixelToPoint(TPointF.Create(0, CurrVirtualKeyboardPixelTotalHeight)).Y;

  NewVirtualKeyboardTotalHeight := CurrVirtualKeyboardTotalFmxHeight;
  LastVirtualKeyboardTotalHeight := NewVirtualKeyboardTotalHeight;

  //修正全屏 弹起 输入法后，隐藏输入法，导航条不消失问题。
  if GetIsFullScreen(False) and GetNavigationBarIsHide and (VKRect.Height = 0) then
  begin
    SetNavigationBarHide(True);
  end;
  //Fix end.

//  if (FNeedNotifyAboutFrameChanges or ((MainActivity.getVirtualKeyboard.isVirtualKeyboardShown) and (VKRect.Height > 0)))
//     and (FPreviousVKRect <> VKRect) then
    //Fix or Add By 爱吃猪头肉
    //https://quality.embarcadero.com/browse/RSP-21725
    //fix Event OnKeyboardHidden may not fire.
    if (FPreviousVKRect <> VKRect) then
    try
      FKeyboardService.SendNotificationAboutKeyboardEvent(VKRect);
      FPreviousVKRect := VKRect;
    finally
      FNeedNotifyAboutFrameChanges := False;
    end;
end;

procedure TKeyboardStateChangedListener.onVirtualKeyboardWillHidden;
begin
  FNeedNotifyAboutFrameChanges := FNeedNotifyAboutFrameChanges or
                                  (TVirtualKeyboardState.Visible in FKeyboardService.VirtualKeyboardState);
end;

end.

