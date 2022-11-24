//convert pas to utf8 by ¥

unit FMX.AndroidLike.FlyToast;

// 参考了  Roland Kossow (https://www.cybertribe.de) 的 Toast 控件，非常感谢。

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2013-10-10　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　感谢 无为 178590299 测试 和 提供一些数值　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

{.$DEFINE HasVisualKeyboardHideBug}

uses
  System.SysUtils,
  System.Classes,
  System.Types,
  System.Rtti,
  System.UITypes,
  System.UIConsts,
  FMX.Types,
  FMX.Controls,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Ani,
  // FMX.Styles,
  // FMX.TextLayout,
  System.Messaging,
  FMX.Effects,
  FMX.Styles.Objects,
  FMX.Forms,
  FMX.Graphics;

const
  // Font.Size 默认最好是 GetToastDefaultFontSize 单行。 不一定有效。
//  DefaultToastBoxColor = $FF2B2B2B; // 感谢 无为  178590299 提供的数值。
  DefaultToastBoxColor = $FF303030;
  DefaultDuration = 2000;
  DefaultMinTextWidth = 28;
  //DefaultMaxTextWidth = 160;
  /// <value>
  ///   默认的 Toast 占用屏幕宽度百分比
  /// </value>
  DefaultPrecentForMaxTextWidth = 75;
  //默认水平边距
  DefaultTextHorizontalMargin = 12;
  //默认垂直边距
  DefaultTextVerticalMargin = 6.2;
  DefaultMarginForViewAndText = 2.5;
  DefaultToastBoxMargin = 72;
  DefaultTextScale = 1;
  MaxDurationTimes = 5;
  DefaultToastStyledSettings: TStyledSettings = [TStyledSetting.Family, TStyledSetting.Size,
    TStyledSetting.Style];
  COMPONENT_VERSION: String = '1.6.2015.203 By Flying Wang';

var
{$IF Defined(IOS) OR Defined(ANDROID)}
  ToastTextHorizontalShift: Single = 0;
{$ELSE}
  ToastTextHorizontalShift: Single = 0;
  ToastMultiTextHorizontalShift: Single = 4;
{$ENDIF}

const
  LongToastDuration = 5000;
  ShortToastDuration = 2000;

type
  TFlyToastLength = (LongToast, ShortToast);

  TFlyToastTypeVersion = (Android4x, Android5x);

  TFlyToastVisualKeyboardSettings = class;

  TFlyToastVisualKeyboardSettingsF = record
    EnabledCheck: Boolean;
    CheckInterval: Integer;
    class operator Equal(a,b: TFlyToastVisualKeyboardSettingsF): Boolean;
    class operator NotEqual(a,b: TFlyToastVisualKeyboardSettingsF): Boolean;
  end;

  TFlyToastVisualKeyboardSettings = class(TPersistent)
  private
    FOnChange: TNotifyEvent;
    FEnabledCheck: Boolean;
    FCheckInterval: Integer;
    FDefaultValue: TFlyToastVisualKeyboardSettingsF;
    procedure SetSettings(const Value: TFlyToastVisualKeyboardSettingsF);
    procedure SetEnabledCheck(const Value: Boolean);
    procedure SetCheckInterval(const Value: Integer);
    function GetSettings: TFlyToastVisualKeyboardSettingsF;
  protected
    procedure DoChange; virtual;
  public
    constructor Create(const ADefaultValue: TFlyToastVisualKeyboardSettingsF); virtual;
    procedure Assign(Source: TPersistent); override;
    procedure SetSettingsNoChange(const Value: TFlyToastVisualKeyboardSettingsF);
    property Settings: TFlyToastVisualKeyboardSettingsF read GetSettings write SetSettings;
    property DefaultValue: TFlyToastVisualKeyboardSettingsF read FDefaultValue write FDefaultValue;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property EnabledCheck: Boolean read FEnabledCheck write SetEnabledCheck default False;
    property CheckInterval: Integer read FCheckInterval write SetCheckInterval default 300;
  end;

  TToastBoxAutoPosition = (None, LeftCenter, TopCenter, RightCenter, BottomCenter, Center,
    LeftTop, RightTop, RightBottom, LeftBottom);

  // TAlignForViewAndText = (avtLeft, avtTop, avtRight, avtBottom);
  TAlignForViewAndText = TAnchorKind;

  TFlyToastTimerEndEvent = procedure(Sender: TObject; var Handled: Boolean) of object;
  TFlyToastShowHideEvent = procedure(Sender: TObject; const Animate: Boolean) of object;

  TFlyToastVisualKeyboardShowNotifyEvent =
    procedure(Sender: TObject; KeyboardRect: TRect; var Handled: Boolean) of object;

  TCustomFlyToast = class(TFMXObject)
  private
    FRealFlyToastTypeVersion: TFlyToastTypeVersion;
    FFlyToastTypeVersion: TFlyToastTypeVersion;
    FAndroidPlatformUsesAutoToastType: Boolean;
    FAnimateHideDuration: Single;
    FAnimateShowDuration: Single;
    FToastTextEffectEnabled: Boolean;
    FDefaultToastBoxEffectEnabled: Boolean;
    FAnimateToastBoxEffectOnShow: Boolean;
    FAutoMoveForVisualKeyboard: Boolean;
    FOnVisualKeyboardShow: TFlyToastVisualKeyboardShowNotifyEvent;
    FOnVisualKeyboardHide: TFlyToastVisualKeyboardShowNotifyEvent;
    FVisualKeyboardVisible: Boolean;
    FStateChangeMessageId: Integer;
    FVisualKeyboardLastHeight,
    FVisualKeyboardHeight: Single;
    FVisualKeyboardRect: TRect;
    FTimerForKeyboardCheck: TTimer;
    FVisualKeyboardSettings: TFlyToastVisualKeyboardSettings;
    FToastBoxShowing: Boolean;
    FAutoPositionWithHorizontalMargins: Boolean;
    FAutoPositionWithVerticalMargins: Boolean;
    FRootParentMode: Boolean;
    FShortObjectAlign: TTextAlign;
    FMarginForViewAndText: Single;
    FViewAlignWithText: TAlignForViewAndText;
    FStartShowTime, FStartFlyInTime: TDateTime;
    FOldParentedRect: TRectF;
    FOldVeiwParent: TFMXObject;
    FOldTextEffectParent: TFMXObject;
    FOldBoxEffectParent: TFMXObject;
    FInited: Boolean;
    FFirstInited: Boolean;
    FRectangleParentIsForm: Boolean;
    FTextFieldParentIsForm: Boolean;
    FTimerForHideParentIsForm: Boolean;
    FTimerForFlyOutParentIsForm: Boolean;
    FTimerForKeyboardCheckParentIsForm: Boolean;
    FDefaultToastBoxEffectParentIsForm: Boolean;
    FOldDefaultToastBoxEffectSoftness: Single;
    FDefaultToastBoxEffectSoftnessInited: Boolean;
    FRectangle: TRectangle;
    FToastBoxEffectOpacity: Single;
    FDefaultToastBoxEffect: TGlowEffect;
    [Weak] FToastTextEffect: TEffect;
    [Weak] FToastBoxEffect: TEffect;
    [Weak] FToastView: TControl;
    FTextField: TLabel;
    FTimerForHide: TTimer;
    FTimerForFlyOut: TTimer;
    FMinTextWidth: Single;
    FPrecentForMaxTextWidth: Single;
    FDuration: Integer;
    FTextHorizontalMargin, FTextVerticalMargin: Single;
    FOptimalWidth: Boolean;
    FOptimalMaxWidth: Boolean;
    FOptimalHeight: Boolean;
    FToastBoxAutoPosition: TToastBoxAutoPosition;
    FVersion: String;
    FOnTimerForHideEnd: TFlyToastTimerEndEvent;
    FOnTimerForFlyOutEnd: TFlyToastTimerEndEvent;
    FOnAnimateShown: TNotifyEvent;
    FOnAnimateHided: TNotifyEvent;
    FOnShow: TFlyToastShowHideEvent;
    FOnHide: TFlyToastShowHideEvent;
    FOnFlyIn: TNotifyEvent;
    FOnFlyOut: TNotifyEvent;
    FOnMouseUp: TMouseEvent;
    FOnMouseDown: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    FOnMouseWheel: TMouseWheelEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnMouseEnter: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnKeyDown: TKeyEvent;
    FOnKeyUp: TKeyEvent;

    procedure VisualKeyboardSettingsOnChange(Sender: TObject);

    procedure SetDuration(const Value: Integer);
    procedure HideToastBox(Sender: TObject);
    procedure ApplyToastBoxEffect;
    procedure FlyOutToastBox(Sender: TObject);
    //procedure InitForShow;
    procedure BeforeReShow;
    procedure BeforeReFlyIn;
    procedure TimerForKeyboardCheckOnTimer(Sender: TObject);

    procedure SetOptimalWidth(const Value: Boolean);
    procedure SetOptimalMaxWidth(const Value: Boolean);
    procedure SetOptimalHeight(const Value: Boolean);
    procedure SetToastView(const Value: TControl);
    procedure SetMinTextWidth(const Value: Single);
    procedure SetPrecentForMaxTextWidth(const Value: Single);
    procedure SetTextHorizontalMargin(const Value: Single);
    procedure SetTextVerticalMargin(const Value: Single);
    procedure SetNeedReInit(const Value: Boolean);
    procedure SetToastBoxAutoPosition(const Value: TToastBoxAutoPosition);
    procedure SetToastBoxEffect(const Value: TEffect);
    procedure SetToastTextEffect(const Value: TEffect);
    procedure SetDefaultToastBoxEffectSoftness(const Value: Single);
    procedure SetViewAlignWithText(const Value: TAlignForViewAndText);
    procedure SetMarginForViewAndText(const Value: Single);
    procedure SetShortObjectAlign(const Value: TTextAlign);
    procedure SetRootParentMode(const Value: Boolean);
    procedure SetAutoPositionWithHorizontalMargins(const Value: Boolean);
    procedure SetAutoPositionWithVerticalMargins(const Value: Boolean);
    procedure SetAutoMoveForVisualKeyboard(const Value: Boolean);

    procedure SetAndroidPlatformUsesAutoToastType(const Value: Boolean);
    procedure SetFlyToastTypeVersion(const Value: TFlyToastTypeVersion);

    function GetNeedReInit: Boolean;
    function GetLastDurationForHide: Integer;
    function GetLastDurationForFlyOut: Integer;
    function GetCurrToastBoxEffect: TEffect;
    function GetDefaultToastBoxEffectSoftness: Single;

    function GetParentedRect(Scaled: Boolean = True): TRectF;
    procedure AnimateHide(WaitForIt: Boolean = False);
    procedure AnimateShow(WaitForIt: Boolean = False);
    procedure CheckParent;
    procedure SetRectangleRadius(Use: Boolean);
    procedure ResetRealFlyToastTypeVersion;
  protected
    procedure ResetPosition(ParentedRect: TRectF);
    procedure ProcessVisualKeyboardEvent;
    procedure VirtualKeyboardChangeHandler(const Sender: TObject;
      const Msg: System.Messaging.TMessage);
    function GetTextWidth(const AText: string; UseCurrHeight: Boolean = True): Single;// deprecated 'use TTextLayout';
    function GetTextHeight(const AText: string; UseCurrWidth: Boolean = True): Single;// deprecated 'use TTextLayout';
    procedure DoTextSettingsChanged; virtual;
    function ReInitToastText: String; virtual;
    procedure ReInitTextSetting(const IsMultiText: Boolean); virtual;
    procedure ReInitRectangleSetting; virtual;
    procedure SetOnTimerForHideEnd(Value: TFlyToastTimerEndEvent); virtual;
    procedure SetOnTimerForFlyOutEnd(Value: TFlyToastTimerEndEvent); virtual;
    procedure SetName(const NewName: TComponentName); override;
    procedure SetParent(const Value: TFMXObject); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Loaded; override;
    procedure DoAddObject(const AObject: TFMXObject); override;
    procedure DoRemoveObject(const AObject: TFMXObject); override;
    { ani }
    procedure DoAniFinishedForShow(Sender: TObject);
    procedure DoAniProcessForShow(Sender: TObject);
    procedure DoAniFinishedForHide(Sender: TObject);
    procedure DoAniProcessForHide(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoResetPosition;
    procedure CancelForShowHide(Animate: Boolean = False; WaitForIt: Boolean = False);
    procedure CancelForFlyInOut(Animate: Boolean = False; WaitForIt: Boolean = False);
    procedure Hide(Animate: Boolean = True; WaitForIt: Boolean = False);
    procedure Show(Reshow: Boolean = True; Animate: Boolean = True; WaitForIt: Boolean = False);
    procedure FlyIn(AnimateShadow: Boolean = False);
    procedure FlyOut;
    procedure ReInit(SetOpacityTo: Single = 0);
    procedure StartTimerForHide(Interval: Cardinal);
    procedure AnimateToastBoxEffect;
    procedure UpdateToastBoxEffects;
    procedure StopDefaultAnimate;
    procedure StopHideTimer;
    procedure StopFlyOutTimer;
    function GetToastDefaultFontSize: Single;
    function GetNoStyleScale: Single;
    function GetStyleScale: Single;
    function GetMaxScaleRate: Single;
    function GetRectScale: Single;
    function GetNoStyleRectScale: Single;
    procedure BringToastBoxToFront; virtual;
    procedure SendToastBoxToBack; virtual;
    function GetRootParent: TFMXObject;
    procedure ResetAllParent;

    property FlyToastTypeVersion: TFlyToastTypeVersion
      read FFlyToastTypeVersion write SetFlyToastTypeVersion default TFlyToastTypeVersion.Android4x;
    property AndroidPlatformUsesAutoToastType: Boolean
     read FAndroidPlatformUsesAutoToastType write SetAndroidPlatformUsesAutoToastType default True;
    property AnimateHideDuration: Single read FAnimateHideDuration write FAnimateHideDuration nodefault;
    property AnimateShowDuration: Single read fAnimateShowDuration write FAnimateShowDuration nodefault;
    property ToastBox: TRectangle read FRectangle;
    property ToastLabel: TLabel read FTextField;
    property CurrToastBoxEffect: TEffect read GetCurrToastBoxEffect;
    property LastDurationForHide: Integer read GetLastDurationForHide;
    property LastDurationForFlyOut: Integer read GetLastDurationForFlyOut;
    property NeedReInit: Boolean read GetNeedReInit write SetNeedReInit;
    property DefaultToastBoxEffectSoftness: Single read GetDefaultToastBoxEffectSoftness
      write SetDefaultToastBoxEffectSoftness nodefault;
    property ToastBoxShowing: Boolean read FToastBoxShowing write FToastBoxShowing;

    property AutoMoveForVisualKeyboard: Boolean read FAutoMoveForVisualKeyboard write SetAutoMoveForVisualKeyboard default True;
    property AnimateToastBoxEffectOnShow: Boolean read FAnimateToastBoxEffectOnShow write FAnimateToastBoxEffectOnShow default False;
    property VisualKeyboardVisible: Boolean read FVisualKeyboardVisible;
    property VisualKeyboardRect: TRect read FVisualKeyboardRect;
    property VisualKeyboardSettings: TFlyToastVisualKeyboardSettings
      read FVisualKeyboardSettings write FVisualKeyboardSettings stored True;

    property Duration: Integer read FDuration write SetDuration default DefaultDuration;
    property MinTextWidth: Single read FMinTextWidth write SetMinTextWidth nodefault;
    /// <exception cref="">
    ///   Toast 占用屏幕宽度百分比 <br />
    /// </exception>
    property PrecentForMaxTextWidth: Single read FPrecentForMaxTextWidth write SetPrecentForMaxTextWidth nodefault;
    property TextHorizontalMargin: Single read FTextHorizontalMargin write SetTextHorizontalMargin nodefault;
    property TextVerticalMargin: Single read FTextVerticalMargin write SetTextVerticalMargin nodefault;
    property OptimalWidth: Boolean read FOptimalWidth write SetOptimalWidth default True;
    property OptimalMaxWidth: Boolean read FOptimalMaxWidth write SetOptimalMaxWidth default True;
    property OptimalHeight: Boolean read FOptimalHeight write SetOptimalHeight default True;
    property ToastBoxAutoPosition: TToastBoxAutoPosition read FToastBoxAutoPosition write SetToastBoxAutoPosition
      default TToastBoxAutoPosition.BottomCenter;
    property ToastView: TControl read FToastView write SetToastView;
    property DefaultToastBoxEffect: TGlowEffect read FDefaultToastBoxEffect;
    property ToastBoxEffect: TEffect read FToastBoxEffect write SetToastBoxEffect;
    property ToastTextEffect: TEffect read FToastTextEffect write SetToastTextEffect;
    property ViewAlignWithText: TAlignForViewAndText read FViewAlignWithText write SetViewAlignWithText
      default TAlignForViewAndText.akTop;
    property MarginForViewAndText: Single read FMarginForViewAndText write SetMarginForViewAndText nodefault;
    property ShortObjectAlign: TTextAlign read FShortObjectAlign write SetShortObjectAlign default TTextAlign.Center;
    property RootParentMode: Boolean read FRootParentMode write SetRootParentMode default True;
    property AutoPositionWithHorizontalMargins: Boolean read FAutoPositionWithHorizontalMargins
      write SetAutoPositionWithHorizontalMargins default True;
    property AutoPositionWithVerticalMargins: Boolean read FAutoPositionWithVerticalMargins
      write SetAutoPositionWithVerticalMargins default True;

    property OnTimerForHideEnd: TFlyToastTimerEndEvent read FOnTimerForHideEnd write SetOnTimerForHideEnd;
    property OnTimerForFlyOutEnd: TFlyToastTimerEndEvent read FOnTimerForFlyOutEnd write SetOnTimerForFlyOutEnd;
    property OnFlyIn: TNotifyEvent read FOnFlyIn write FOnFlyIn;
    property OnFlyOut: TNotifyEvent read FOnFlyOut write FOnFlyOut;
    property OnAnimateShown: TNotifyEvent read FOnAnimateShown write FOnAnimateShown;
    property OnAnimateHided: TNotifyEvent read FOnAnimateHided write FOnAnimateHided;
    property OnShow: TFlyToastShowHideEvent read FOnShow write FOnShow;
    property OnHide: TFlyToastShowHideEvent read FOnHide write FOnHide;
    { Mouse events }
    property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;
    property OnKeyUp: TKeyEvent read FOnKeyUp write FOnKeyUp;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnMouseWheel: TMouseWheelEvent read FOnMouseWheel write FOnMouseWheel;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    { VisualKeyboard events }
    property OnVisualKeyboardShow: TFlyToastVisualKeyboardShowNotifyEvent read FOnVisualKeyboardShow write FOnVisualKeyboardShow;
    property OnVisualKeyboardHide: TFlyToastVisualKeyboardShowNotifyEvent read FOnVisualKeyboardHide write FOnVisualKeyboardHide;
  published
    property Version: String read FVersion;
  end;

//{$IFDEF IDE_XE2up}
//  [ComponentPlatformsAttribute(pidAll)]
//{$ENDIF}
  TFlyToast = class(TCustomFlyToast)
  private
    FToastText: String;
    FDefaultTextSettings: TTextSettings;
    FOldTextSettings: TTextSettings;
    FTextFont: TFont;
    FTextColor: TAlphaColor;
    FTextScale: TPosition;
    FToastBoxColor: TAlphaColor;
    FToastBoxStrokeDash: TStrokeDash;
    FHorzTextAlign: TTextAlign;
    FVertTextAlign: TTextAlign;
    FTextWordWrap: Boolean;
    FTextTrimming: TTextTrimming;
    FStyledSettings: TStyledSettings;
    FTextSettings: TTextSettings;
    FToastBoxAlign: TAlignLayout;
    FToastBoxHeight: Single;
    FToastBoxMargins: TBounds;
    FToastBoxStrokeColor: TAlphaColor;
    FToastBoxStrokeThickness: Single;
    FToastBoxPosition: TPosition;
    FToastBoxWidth: Single;

    function IsToastTextStored: Boolean;

    procedure TextSettingsOnChange(Sender: TObject);
    procedure ToastBoxPositionOnChange(Sender: TObject);
    procedure TextScaleOnChange(Sender: TObject);
    procedure TextFontOnChange(Sender: TObject);
    procedure UpdateTextSettings;
    procedure ToastBoxMarginsOnChange(Sender: TObject);

    function GetToastText: String;

    procedure SetToastText(const Value: String);
    procedure SetToastBoxColor(const Value: TAlphaColor);
    procedure SetToastBoxStrokeDash(const Value: TStrokeDash);
    procedure SetHorzTextAlign(const Value: TTextAlign);
    procedure SetVertTextAlign(const Value: TTextAlign);
    procedure SetTextTrimming(const Value: TTextTrimming);
    procedure SetTextColor(const Value: TAlphaColor);
    procedure SetTextFont(const Value: TFont);
    procedure SetToastBoxAlign(const Value: TAlignLayout);
    procedure SetToastBoxMargins(const Value: TBounds);
    procedure SetToastBoxStrokeColor(const Value: TAlphaColor);
    procedure SetToastBoxStrokeThickness(const Value: Single);
    procedure SetToastBoxPosition(const Value: TPosition);
    procedure SetTextScale(const Value: TPosition);
    procedure SetTextWordWrap(const Value: Boolean);
    procedure SetToastBoxHeight(const Value: Single);
    procedure SetToastBoxWidth(const Value: Single);

    function IsPositionStored: Boolean; virtual;

  protected
    procedure DoTextSettingsChanged; override;
    function ReInitToastText: String; override;
    procedure ReInitTextSetting(const IsMultiText: Boolean); override;
    procedure ReInitRectangleSetting; override;
    procedure SetStyledSettings(const Value: TStyledSettings); virtual;
    function StyledSettingsStored: Boolean; virtual;
    procedure SetName(const NewName: TComponentName); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function Toast(Owner: TCommonCustomForm; const Msg: string;
      Duration: TFlyToastLength = TFlyToastLength.ShortToast): TFlyToast;

  published
    property AutoMoveForVisualKeyboard;
    property AnimateToastBoxEffectOnShow;
    ///	<summary>
    ///	  提示文本
    ///	</summary>
    property ToastText: String read GetToastText write SetToastText stored IsToastTextStored;
    property ToastBoxStrokeColor: TAlphaColor read FToastBoxStrokeColor write SetToastBoxStrokeColor
      default TAlphaColorRec.Black;
    property TextColor: TAlphaColor read FTextColor write SetTextColor default TAlphaColorRec.White;
    property TextFont: TFont read FTextFont write SetTextFont;
    property ToastBoxColor: TAlphaColor read FToastBoxColor write SetToastBoxColor default DefaultToastBoxColor;
    property ToastBoxStrokeDash: TStrokeDash read FToastBoxStrokeDash write SetToastBoxStrokeDash
      default TStrokeDash.Solid;
    property HorzTextAlign: TTextAlign read FHorzTextAlign write SetHorzTextAlign default TTextAlign.Center;
    property VertTextAlign: TTextAlign read FVertTextAlign write SetVertTextAlign default TTextAlign.Center;
    property TextWordWrap: Boolean read FTextWordWrap write SetTextWordWrap default True;
    property TextTrimming: TTextTrimming read FTextTrimming write SetTextTrimming default TTextTrimming.None;
    property ToastBoxAlign: TAlignLayout read FToastBoxAlign write SetToastBoxAlign default TAlignLayout.None;
    property ToastBoxHeight: Single read FToastBoxHeight write SetToastBoxHeight nodefault;
    property ToastBoxWidth: Single read FToastBoxWidth write SetToastBoxWidth nodefault;
    property ToastBoxMargins: TBounds read FToastBoxMargins write SetToastBoxMargins stored True;
    property ToastBoxStrokeThickness: Single read FToastBoxStrokeThickness write SetToastBoxStrokeThickness nodefault;
    property ToastBoxPosition: TPosition read FToastBoxPosition write SetToastBoxPosition stored IsPositionStored;
    property TextScale: TPosition read FTextScale write SetTextScale stored True;
    property StyledSettings: TStyledSettings read FStyledSettings write SetStyledSettings
      stored StyledSettingsStored nodefault;

    property FlyToastTypeVersion;
    property AndroidPlatformUsesAutoToastType;
    //property AnimateHideDuration;
    //property AnimateShowDuration;
    property ViewAlignWithText;
    property MarginForViewAndText;
    property ShortObjectAlign;
    property Duration;
    property MinTextWidth;
    property PrecentForMaxTextWidth;
    property TextHorizontalMargin;
    property TextVerticalMargin;
    property OptimalWidth;
    property OptimalMaxWidth;
    property OptimalHeight;
    property ToastBoxAutoPosition;
    property ToastView;
    property DefaultToastBoxEffect;
    property ToastTextEffect;
    property ToastBoxEffect;
    property RootParentMode;
    property AutoPositionWithHorizontalMargins;
    property AutoPositionWithVerticalMargins;
    property VisualKeyboardSettings;

    property OnTimerForHideEnd;
    property OnTimerForFlyOutEnd;
    property OnFlyIn;
    property OnFlyOut;
    property OnAnimateShown;
    property OnAnimateHided;
    property OnShow;
    property OnHide;
    { Mouse events }
    property OnKeyDown;
    property OnKeyUp;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    { VisualKeyboard events }
    property OnVisualKeyboardShow;
    property OnVisualKeyboardHide;
  end;

  // TFlyToastEx = class(TCustomFlyToast)
  // private
  // protected
  // public
  // constructor Create(AOwner: TComponent); override;
  // published
  //
  //property FlyToastTypeVersion;
  //property AndroidPlatformUsesAutoToastType;
  // //property AnimateHideDuration;
  // //property AnimateShowDuration;
  // property AutoMoveForVisualKeyboard;
  // property AnimateToastBoxEffectOnShow;
  // property ViewAlignWithText;
  // property MarginForViewAndText;
  // property ShortObjectAlign;
  // property ToastBox;
  // property ToastLabel;
  //
  // property Duration;
  // property MinTextWidth;
  // property PrecentForMaxTextWidth;
  // property TextHorizontalMargin;
  // property TextVerticalMargin;
  // property OptimalWidth;
  // property OptimalMaxWidth;
  // property OptimalHeight;
  // property ToastBoxAutoPosition;
  // property ToastView;
  // property DefaultToastBoxEffect;
  // property ToastTextEffect;
  // property ToastBoxEffect;
  // property RootParentMode;
  // property AutoPositionWithHorizontalMargins;
  // property AutoPositionWithVerticalMargins;
  // property VisualKeyboardSettings;
  //
  // property OnTimerForHideEnd;
  // property OnTimerForFlyOutEnd;
  // property OnFlyIn;
  // property OnFlyOut;
  // property OnAnimateShown;
  // property OnAnimateHided;
  // property OnShow;
  // property OnHide;
  // { Mouse events }
  // property OnKeyDown;
  // property OnKeyUp;
  // property OnClick;
  // property OnDblClick;
  // property OnMouseDown;
  // property OnMouseMove;
  // property OnMouseUp;
  // property OnMouseWheel;
  // property OnMouseEnter;
  // property OnMouseLeave;
  // { VisualKeyboard events }
  // property OnVisualKeyboardShow;
  // property OnVisualKeyboardHide;
  // end;

procedure Register;

function FindProperty(O: TObject; Path: String): TRttiProperty;
function HasProperty(O: TObject; Path: String): Boolean;

implementation

uses System.RTLConsts, System.Math, System.DateUtils,
{$IF CompilerVersion >= 29.0} // >= XE8
  FMX.Utils,
{$ENDIF}
{$IFDEF ANDROID}
//  FMX.Helpers.Android,
  FMX.Platform.UI.Android,
  FMX.Platform.Android,
  Androidapi.JNI.GraphicsContentViewText,
{$ENDIF}
//  FMX.Dialogs,
  FMX.Platform,
  System.Math.Vectors,
  FMX.Consts;

procedure Register;
begin
  RegisterComponents('AndroidLike', [TFlyToast { , TFlyToastEx } ]);
  // RegisterComponents('AndroidLike', [TFlyToast, TFlyToastEx  ]);
end;

 {TFlyToastVisualKeyboardSettings}

class operator TFlyToastVisualKeyboardSettingsF.Equal(a,b: TFlyToastVisualKeyboardSettingsF): Boolean;
begin
  Result := False;
//  if not Assigned(a) then Exit;
//  if not Assigned(b) then Exit;
  if a.EnabledCheck <> a.EnabledCheck then Exit;
  if a.CheckInterval <> a.CheckInterval then Exit;
  Result := True;
end;

class operator TFlyToastVisualKeyboardSettingsF.NotEqual(a,b: TFlyToastVisualKeyboardSettingsF): Boolean;
begin
  Result := not (a=b);
end;

constructor TFlyToastVisualKeyboardSettings.Create(const ADefaultValue: TFlyToastVisualKeyboardSettingsF);
begin
  inherited Create;
  FDefaultValue := ADefaultValue;
  FEnabledCheck := FDefaultValue.EnabledCheck;
  FCheckInterval := FDefaultValue.CheckInterval;
end;

procedure TFlyToastVisualKeyboardSettings.Assign(Source: TPersistent);
begin
  if Source is TFlyToastVisualKeyboardSettings then
  begin
    Settings := TFlyToastVisualKeyboardSettings(Source).Settings;
  end
  else
    inherited
end;

procedure TFlyToastVisualKeyboardSettings.SetSettingsNoChange(const Value: TFlyToastVisualKeyboardSettingsF);
begin
  FEnabledCheck := Value.EnabledCheck;
  FCheckInterval := Value.CheckInterval;
end;

procedure TFlyToastVisualKeyboardSettings.SetSettings(const Value: TFlyToastVisualKeyboardSettingsF);
var
  LChange: Boolean;
begin
  LChange := Settings <> Value;
  SetSettingsNoChange(Value);
  if LChange then
    DoChange;
end;

procedure TFlyToastVisualKeyboardSettings.SetEnabledCheck(const Value: Boolean);
var
  LChange: Boolean;
begin
  LChange := FEnabledCheck <> Value;
  FEnabledCheck := Value;
  if LChange then
    DoChange;
end;

procedure TFlyToastVisualKeyboardSettings.SetCheckInterval(const Value: Integer);
var
  LChange: Boolean;
begin
  LChange := FCheckInterval <> Value;
  FCheckInterval := Value;
  if LChange then
    DoChange;
end;

function TFlyToastVisualKeyboardSettings.GetSettings: TFlyToastVisualKeyboardSettingsF;
begin
  Result.EnabledCheck := FEnabledCheck;
  Result.CheckInterval := FCheckInterval;
end;

procedure TFlyToastVisualKeyboardSettings.DoChange;
begin
  if Assigned(OnChange) then
    OnChange(Self);
end;


// {TFlyToastEx}
//
// constructor TFlyToastEx.Create(AOwner: TComponent);
// begin
// inherited Create(AOwner);
// if not Assigned(FRectangle) then
// begin
// FRectangle := TRectangle.Create(AOwner);
// //FRectangle.Name := 'SubRectangle';
// FRectangle.SetSubComponent(True);
// //FRectangle.FreeNotification(Self);
// end;
// if not Assigned(FTextField) then
// begin
// FTextField := TLabel.Create(FRectangle);
// //FTextField.Name := 'SubTextfield';
// FTextField.SetSubComponent(True);
// //FTextField.FreeNotification(Self);
// end;
// CheckParent;
// end;

function FindProperty(O: TObject; Path: String): TRttiProperty;
var
  Persistent: String;
  T: TRttiType;
  Instance: TObject;
begin
  Result := nil;
  Instance := O;

  while Path.Contains('.') do
  begin
    Persistent := GetToken(Path, '.');
    T := SharedContext.GetType(Instance.ClassInfo);
    if Assigned(T) then
    begin
      Result := T.GetProperty(Persistent);
      if Assigned(Result) and (Result.PropertyType.IsInstance) then
        Instance := Result.GetValue(Instance).AsObject
    end;
  end;
  if Assigned(Instance) then
  begin
    T := SharedContext.GetType(Instance.ClassInfo);
    Result := T.GetProperty(Path);
  end;
end;

function HasProperty(O: TObject; Path: String): Boolean;
begin
  Result := Assigned(FindProperty(O, Path));
end;

////用 1 字体 12 14 无法正常显示。
////用  160 /144 字体 12 无法正常显示。
////const
////  C_RectScale_Fix_12: Single = 0.00248395733069628477091;
//// 决定只对文字宽度进行调整。
//  //C_TextRect_Width_CNChar_Fix: Single = 3.180662989616394043;
//function Get_TextRect_Width_CNChar_Fix_Add: Single;
//begin
//{$IF Defined(IOS) OR Defined(ANDROID)}
//  Result := 0.01;
//{$ELSE}
//  //Result := 0.069550510495901107787;
//  //Result := 0.07;
//  Result := 0.01;
//{$ENDIF}
//end;
//
//function Get_TextRect_Width_CNChar_Fix_111: Single;
//begin
//{$IF Defined(IOS) OR Defined(ANDROID)}
//  Result := 1;
//{$ELSE}
//  //Result := 160 /144;
//  //XE6 下面文字宽度显示正常了。
//  Result := 1;
//{$ENDIF}
//end;

{ TCustomFlyToast }

procedure TCustomFlyToast.SetOnTimerForHideEnd(Value: TFlyToastTimerEndEvent);
begin
  if TMethod(Value) = TMethod(FOnTimerForHideEnd) then
    Exit;
  FOnTimerForHideEnd := Value;
end;

procedure TCustomFlyToast.SetOnTimerForFlyOutEnd(Value: TFlyToastTimerEndEvent);
begin
  if TMethod(Value) = TMethod(FOnTimerForFlyOutEnd) then
    Exit;
  FOnTimerForFlyOutEnd := Value;
end;

procedure TCustomFlyToast.Loaded;
begin
  inherited;
  FInited := False;
  FFirstInited := True;
end;

procedure TCustomFlyToast.DoAddObject(const AObject: TFMXObject);
begin
  inherited;
  if not Assigned(AObject) then
    Exit;
  if (AObject is TEffect) and (AObject <> FDefaultToastBoxEffect) then
  begin
    SetToastBoxEffect(AObject as TEffect);
  end;
end;

procedure TCustomFlyToast.DoRemoveObject(const AObject: TFMXObject);
begin
  inherited;
  if not Assigned(AObject) then
    Exit;
  if (AObject is TEffect) and (AObject <> FDefaultToastBoxEffect) then
  begin
    // SetToastBoxEffect(nil);
  end;
end;

procedure TCustomFlyToast.SetName(const NewName: TComponentName);
begin
  inherited;
end;

procedure TCustomFlyToast.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = ToastView then
    begin
      FOldVeiwParent := nil;
      FToastView := nil;
    end;
    if AComponent = ToastTextEffect then
    begin
      FOldTextEffectParent := nil;
      ToastTextEffect := nil;
    end;
    if AComponent = ToastBoxEffect then
    begin
      FOldBoxEffectParent := nil;
      FToastBoxEffect := nil;
    end;
    if AComponent = FRectangle then
    begin
      FRectangle := nil;
      // FTextField 是 FRectangle 的子对象，所以也被销毁了。
      FTextField := nil;
    end;
    if AComponent = FTextField then
    begin
      FTextField := nil;
    end;
    if AComponent = FTimerForHide then
    begin
      FTimerForHide := nil;
    end;
    if AComponent = FTimerForKeyboardCheck then
    begin
      FTimerForKeyboardCheck := nil;
    end;
    if AComponent = FTimerForFlyOut then
    begin
      FTimerForFlyOut := nil;
    end;
  end;
  if (AComponent = FDefaultToastBoxEffect) and (Operation = opRemove) then
    FDefaultToastBoxEffect := nil;
end;

procedure TCustomFlyToast.CheckParent;
begin
  FRectangleParentIsForm := False;
  FTextFieldParentIsForm := False;
  FTimerForHideParentIsForm := False;
  FTimerForFlyOutParentIsForm := False;
  FTimerForKeyboardCheckParentIsForm := False;
  FDefaultToastBoxEffectParentIsForm := False;
  if Assigned(FRectangle) then
  begin
    FRectangleParentIsForm := Assigned(FRectangle.Parent) and (FRectangle.Parent is TCustomForm);
  end;
  FTextFieldParentIsForm := FRectangleParentIsForm;
  if Assigned(FDefaultToastBoxEffect) then
  begin
    FDefaultToastBoxEffectParentIsForm := Assigned(FDefaultToastBoxEffect.Parent) and FRectangleParentIsForm;
  end;
  if Assigned(FTimerForHide) then
  begin
    FTimerForHideParentIsForm := Assigned(FTimerForHide.Parent) and (FTimerForHide.Parent is TCustomForm);
  end;
  if Assigned(FTimerForFlyOut) then
  begin
    FTimerForFlyOutParentIsForm := Assigned(FTimerForFlyOut.Parent) and (FTimerForFlyOut.Parent is TCustomForm);
  end;
  if Assigned(FTimerForKeyboardCheck) then
  begin
    FTimerForKeyboardCheckParentIsForm := Assigned(FTimerForKeyboardCheck.Parent) and (FTimerForKeyboardCheck.Parent is TCustomForm);
  end;
end;

procedure TCustomFlyToast.SetParent(const Value: TFMXObject);
begin
  inherited;
  if Assigned(FRectangle) then
  begin
    if FRootParentMode then
    begin
      FRectangle.Parent := GetRootParent;
    end
    else
    begin
      FRectangle.Parent := Parent;
    end;
    if Assigned(FToastBoxEffect) then
    begin
      FToastBoxEffect.Parent := FRectangle;
      if Assigned(FDefaultToastBoxEffect) then
      begin
        FDefaultToastBoxEffect.Parent := Self;
      end;
    end
    else if Assigned(FDefaultToastBoxEffect) and Assigned(FRectangle.Parent) then
    begin
      FDefaultToastBoxEffect.Parent := FRectangle;
    end;
  end;
  if Assigned(FTextField) then
  begin
    if Assigned(FToastTextEffect) then
    begin
      FToastTextEffect.Parent := FTextField;
    end
  end;
  if Assigned(FTimerForHide) then
  begin
    FTimerForHide.Parent := Parent;
  end;
  if Assigned(FTimerForFlyOut) then
  begin
    FTimerForFlyOut.Parent := Parent;
  end;
  if Assigned(FTimerForKeyboardCheck) then
  begin
    FTimerForKeyboardCheck.Parent := Parent;
  end;
  CheckParent;
end;

function TCustomFlyToast.GetParentedRect(Scaled: Boolean = True): TRectF;
begin
  if Assigned(Parent) and (Parent is TControl) then
  begin
    Result := (Parent as TControl).BoundsRect;
    if Scaled then
    begin
      Result.Width := Result.Width * (Parent as IRotatedControl).Scale.X;
      Result.Height := Result.Height * (Parent as IRotatedControl).Scale.Y;
    end;
  end
  else if Assigned(Parent) and (Parent is TCommonCustomForm) then
  begin
    if (Parent as TCommonCustomForm).FullScreen then
    begin
      Result := RectF(0, 0, Screen.Size.cx,
        Screen.Size.cy - FVisualKeyboardHeight);
    end
    else
    begin
      Result := RectF(0, 0, (Parent as TCommonCustomForm).ClientWidth,
        (Parent as TCommonCustomForm).ClientHeight - FVisualKeyboardHeight);
    end;
  end
  else
  begin
    Application.FormFactor.AdjustToScreenSize;
    Result := RectF(0, 0, Application.FormFactor.Width,
      Application.FormFactor.Height - FVisualKeyboardHeight);
  end;
end;

function TCustomFlyToast.GetToastDefaultFontSize: Single;
begin
  if GetStyleScale > 1 then
  begin
    if GetStyleScale < GetNoStyleScale then
    begin
      Result := Round(12 + 8 * GetStyleScale / 3);
    end
    else if GetStyleScale > GetNoStyleScale then
    begin
      Result := Round(2 + 13 * GetStyleScale / GetNoStyleScale);
    end
    else
    begin
      Result := 12 + 2 * GetStyleScale;
    end;
  end
  else
  begin
    Result := 14;
  end;
end;
//var
//  NoStyleScale, StyleScale: Single;
//begin
//  NoStyleScale := GetNoStyleScale;
//  StyleScale := GetStyleScale;
//  if (NoStyleScale > 1) and (StyleScale <> NoStyleScale) then
//  begin
//    Result := Round(2 + 13 * StyleScale / NoStyleScale);
//  end
//  else
//  begin
//    Result := Round(14 + 4 * GetStyleScale / 3);
//  end;
//end;

function TCustomFlyToast.GetNoStyleScale: Single;
begin
  if Assigned(FRectangle) and Assigned(FRectangle.Scene) then
  begin
    Result := FRectangle.Scene.GetSceneScale;
  end
  else if Assigned(FRectangle) and Assigned(FRectangle.Canvas) then
  begin
    Result := FRectangle.Canvas.Scale;
  end
  else
  begin
    with TRectangle.Create(Self) do
    begin
      try
        if Assigned(Scene) then
        begin
          Result := Scene.GetSceneScale;
        end
        else
        begin
          Result := 1;
        end;
      finally
        free;
      end;
    end;
  end;
end;

function TCustomFlyToast.GetStyleScale: Single;
begin
  Result := TCustomStyleObject.ScreenScaleToStyleScale(GetNoStyleScale);
end;

function TCustomFlyToast.GetMaxScaleRate: Single;
begin
  Result := Max(GetStyleScale / GetNoStyleScale, GetNoStyleScale / GetStyleScale);
end;

function TCustomFlyToast.GetRectScale: Single;
begin
{$IF Defined(IOS) OR Defined(ANDROID)}
  Result := (160 / 96) * GetMaxScaleRate;
{$ELSE}
  Result := GetMaxScaleRate;
{$ENDIF}
end;

function TCustomFlyToast.GetNoStyleRectScale: Single;
begin
{$IF Defined(IOS) OR Defined(ANDROID)}
  Result := GetNoStyleScale;
{$ELSE}
  Result := GetNoStyleScale;
{$ENDIF}
end;

procedure TCustomFlyToast.SetRectangleRadius(Use: Boolean);
begin
  if Assigned(FRectangle) then
  begin
    if Use then
    begin
      FRectangle.XRadius := 1;
      FRectangle.YRadius := 1;
    end
    else
    begin
      FRectangle.XRadius := 0;
      FRectangle.YRadius := 0;
    end;
  end;
end;

function TCustomFlyToast.GetRootParent: TFMXObject;
begin
  Result := Parent;
  while Assigned(Result) and Assigned(Result.Parent) do
  begin
    Result := Result.Parent;
  end;
end;

procedure TCustomFlyToast.ResetAllParent;
begin
  //如果窗体销毁，就不能调用这个了。
  if Assigned(FToastView) and Assigned(FOldVeiwParent) then
  begin
    FToastView.Parent := FOldVeiwParent;
  end;
  if Assigned(FToastTextEffect) and Assigned(FOldTextEffectParent) then
  begin
    FToastTextEffect.Parent := FOldTextEffectParent;
  end;
  if Assigned(FToastBoxEffect) and Assigned(FOldBoxEffectParent) then
  begin
    FToastBoxEffect.Parent := FOldBoxEffectParent;
  end;
end;

procedure TCustomFlyToast.ResetRealFlyToastTypeVersion;
begin
  FRealFlyToastTypeVersion := FFlyToastTypeVersion;
{$IF Defined(ANDROID) }
  if AndroidPlatformUsesAutoToastType then
  begin
    if TOSVersion.Check(5) then
    begin
      FRealFlyToastTypeVersion := TFlyToastTypeVersion.Android5x;
    end
    else
    begin
      FRealFlyToastTypeVersion := TFlyToastTypeVersion.Android4x;
    end;
  end;
{$ENDIF}
end;

procedure TCustomFlyToast.DoResetPosition;
begin
  if not Assigned(FRectangle) then Exit;
  FRectangle.BeginUpdate;
  try
    if not Assigned(Parent) then
    begin
      ResetPosition(TRectF.Empty);
    end;
    if Assigned(Parent) and (Parent is TCommonCustomForm) then
    begin
      ResetPosition(TRectF.Empty);
    end;
  finally
    FRectangle.EndUpdate;
  end;
end;

procedure TCustomFlyToast.ResetPosition(ParentedRect: TRectF);
var
  RectangleScaledWidth, RectangleScaledHeight: Single;
begin
  if ParentedRect = TRectF.Empty then
  begin
    ParentedRect := GetParentedRect;
  end;
  RectangleScaledWidth := FRectangle.Width * FRectangle.Scale.X;
  RectangleScaledHeight := FRectangle.Height * FRectangle.Scale.Y;
  if FToastBoxAutoPosition <> TToastBoxAutoPosition.None then
  begin
    if (FToastBoxAutoPosition = TToastBoxAutoPosition.Center) or (FToastBoxAutoPosition = TToastBoxAutoPosition.LeftCenter) or (FToastBoxAutoPosition = TToastBoxAutoPosition.RightCenter) then
    begin
      FRectangle.Position.Y := (ParentedRect.Height - RectangleScaledHeight) / 2;
    end;
    if (FToastBoxAutoPosition = TToastBoxAutoPosition.Center) or (FToastBoxAutoPosition = TToastBoxAutoPosition.TopCenter) or (FToastBoxAutoPosition = TToastBoxAutoPosition.BottomCenter) then
    begin
      FRectangle.Position.X := (ParentedRect.Width - RectangleScaledWidth) / 2;
    end;
    if (FToastBoxAutoPosition = TToastBoxAutoPosition.LeftCenter) or (FToastBoxAutoPosition = TToastBoxAutoPosition.LeftTop) or (FToastBoxAutoPosition = TToastBoxAutoPosition.LeftBottom) then
    begin
      if FAutoPositionWithHorizontalMargins then
      begin
        FRectangle.Position.X := FRectangle.Margins.Left;
      end
      else
      begin
        FRectangle.Position.X := 0;
      end;
    end
    else if (FToastBoxAutoPosition = TToastBoxAutoPosition.RightCenter) or (FToastBoxAutoPosition = TToastBoxAutoPosition.RightTop) or (FToastBoxAutoPosition = TToastBoxAutoPosition.RightBottom) then
    begin
      if FAutoPositionWithHorizontalMargins then
      begin
        FRectangle.Position.X := ParentedRect.Width - RectangleScaledWidth - FRectangle.Margins.Right;
      end
      else
      begin
        FRectangle.Position.X := ParentedRect.Width - RectangleScaledWidth;
      end;
    end;
    if (FToastBoxAutoPosition = TToastBoxAutoPosition.TopCenter) or (FToastBoxAutoPosition = TToastBoxAutoPosition.LeftTop) or (FToastBoxAutoPosition = TToastBoxAutoPosition.RightTop) then
    begin
      if FAutoPositionWithVerticalMargins then
      begin
        FRectangle.Position.Y := FRectangle.Margins.Top;
      end
      else
      begin
        FRectangle.Position.Y := 0;
      end;
    end
    else if (FToastBoxAutoPosition = TToastBoxAutoPosition.BottomCenter) or (FToastBoxAutoPosition = TToastBoxAutoPosition.LeftBottom) or (FToastBoxAutoPosition = TToastBoxAutoPosition.RightBottom) then
    begin
      if FAutoPositionWithVerticalMargins then
      begin
        FRectangle.Position.Y := ParentedRect.Height - RectangleScaledHeight - FRectangle.Margins.Bottom;
      end
      else
      begin
        FRectangle.Position.Y := ParentedRect.Height - RectangleScaledHeight;
      end;
    end;
  end;
  FOldParentedRect := ParentedRect;
end;

procedure TCustomFlyToast.ProcessVisualKeyboardEvent;
var
  Handled: Boolean;
begin
  Handled := False;
  if FVisualKeyboardVisible then
  begin
    if Assigned(FOnVisualKeyboardShow) then
    begin
      FOnVisualKeyboardShow(Self, FVisualKeyboardRect, Handled);
    end;
    if (not Handled) and FAutoMoveForVisualKeyboard then
      DoResetPosition;
  end
  else
  begin
    if Assigned(FOnVisualKeyboardHide) then
    begin
      FOnVisualKeyboardHide(Self, FVisualKeyboardRect, Handled);
    end;
    if (not Handled) and FAutoMoveForVisualKeyboard then
      DoResetPosition;
  {$IFDEF HasVisualKeyboardHideBug}
    raise Exception.Create('Your code has VisualKeyboardHide bug .');
  {$ENDIF}
  end;
end;

constructor TCustomFlyToast.Create(AOwner: TComponent);
var
  AVisualKeyboardSettings: TFlyToastVisualKeyboardSettingsF;
begin
  FlyToastTypeVersion := TFlyToastTypeVersion.Android4x;
  FRealFlyToastTypeVersion := FlyToastTypeVersion;
  AndroidPlatformUsesAutoToastType := True;;
  FVisualKeyboardHeight := 0;
  FVisualKeyboardLastHeight := 0;
  FVisualKeyboardRect := TRect.Empty;
  FVisualKeyboardVisible := False;
  AVisualKeyboardSettings.EnabledCheck := False;
  AVisualKeyboardSettings.CheckInterval := 300;
  inherited Create(AOwner);
  FAutoMoveForVisualKeyboard := True;
  FAnimateToastBoxEffectOnShow := False;
  FToastTextEffectEnabled := True;
  FAnimateHideDuration := 0.3;
  FAnimateShowDuration := 0.3;
  FDefaultToastBoxEffectEnabled := True;
  FVisualKeyboardSettings := TFlyToastVisualKeyboardSettings.Create(AVisualKeyboardSettings);
  FVisualKeyboardSettings.OnChange := VisualKeyboardSettingsOnChange;
  FToastBoxShowing := False;
  FAutoPositionWithHorizontalMargins := True;
  FAutoPositionWithVerticalMargins := True;
  FRootParentMode := True;
  FShortObjectAlign := TTextAlign.Center;
  FViewAlignWithText := TAlignForViewAndText.akTop;
  FMarginForViewAndText := DefaultMarginForViewAndText;
  FOldDefaultToastBoxEffectSoftness := 0.25;
  FDefaultToastBoxEffectSoftnessInited := False;
  FStartShowTime := Now;
  FStartFlyInTime := Now;
  FOldParentedRect := TRectF.Empty;
  FOldVeiwParent := nil;
  FOldTextEffectParent := nil;
  FOldBoxEffectParent := nil;
  FInited := False;
  FFirstInited := True;
  FToastBoxAutoPosition := TToastBoxAutoPosition.BottomCenter;
  FVersion := COMPONENT_VERSION;
  FMinTextWidth := DefaultMinTextWidth;
  FPrecentForMaxTextWidth := DefaultPrecentForMaxTextWidth;
  FTextHorizontalMargin := DefaultTextHorizontalMargin;
  FTextVerticalMargin := DefaultTextVerticalMargin;
  FOptimalWidth := True;
  FOptimalMaxWidth := True;
  FOptimalHeight := True;

  FDuration := DefaultDuration;
  FRectangle := nil;
  FTextField := nil;
  FTimerForHide := nil;
  FTimerForFlyOut := nil;
  FTimerForKeyboardCheck := nil;
  FToastTextEffect := nil;
  FToastBoxEffect := nil;
  FToastBoxEffectOpacity := 0.6;

  if not Assigned(FDefaultToastBoxEffect) then
  begin
    FDefaultToastBoxEffect := TGlowEffect.Create(Self);
    FDefaultToastBoxEffect.Name := 'DefaultToastBoxEffect';
    FDefaultToastBoxEffect.SetSubComponent(True);
    FDefaultToastBoxEffect.FreeNotification(Self);
  end;
  FDefaultToastBoxEffect.GlowColor := TAlphaColorRec.Black;
  FDefaultToastBoxEffect.Softness := FOldDefaultToastBoxEffectSoftness;
{$IF Defined(IOS) OR Defined(ANDROID)}
  FDefaultToastBoxEffect.Opacity := 1;
{$ELSE}
  FDefaultToastBoxEffect.Opacity := 0.6;
{$ENDIF}
  FDefaultToastBoxEffect.Enabled := True;

  if AOwner is TFMXObject then
  begin
    Parent := AOwner as TFMXObject;
  end
  else
  begin
    Parent := Parent;
  end;
  if not(csDesigning in ComponentState) then
  begin
    if not Assigned(FRectangle) then
    begin
      FRectangle := TRectangle.Create(AOwner);
      // FRectangle.Name := 'SubRectangle';
      FRectangle.SetSubComponent(True);
      // FRectangle.FreeNotification(Self);
    end;
    if FRootParentMode then
    begin
      FRectangle.Parent := GetRootParent;
    end
    else if AOwner is TFMXObject then
    begin
      FRectangle.Parent := AOwner as TFMXObject;
    end
    else
    begin
      FRectangle.Parent := Parent;
    end;
    FRectangle.Align := TAlignLayout.None;

    FRectangle.Sides := [];
    FRectangle.Visible := False;
    FRectangle.CornerType := TCornerType.InnerLine;
    SetRectangleRadius(True);
    ApplyToastBoxEffect;
    if not Assigned(FTextField) then
    begin
      FTextField := TLabel.Create(FRectangle);
      // FTextField.Name := 'SubTextfield';
      FTextField.SetSubComponent(True);
      // FTextField.FreeNotification(Self);
    end;
    FTextField.FontColor := TAlphaColorRec.Red;
    FTextField.StyledSettings := [];
    FTextField.Stored := False;
    FTextField.Parent := FRectangle;
    FTextField.Text := '';
    FTextField.Align := TAlignLayout.None;
    if not Assigned(FTimerForHide) then
    begin
      FTimerForHide := TTimer.Create(AOwner);
      // FTimerForHide.Name := 'TimerForHide';
      FTimerForHide.SetSubComponent(True);
      // FTimerForHide.FreeNotification(Self);
    end;
    if AOwner is TFMXObject then
    begin
      FTimerForHide.Parent := AOwner as TFMXObject;
    end
    else
    begin
      FTimerForHide.Parent := Parent;
    end;
    FTimerForHide.Enabled := False;
    FTimerForHide.Interval := 1000;
    FTimerForHide.OnTimer := HideToastBox;
    if not Assigned(FTimerForFlyOut) then
    begin
      FTimerForFlyOut := TTimer.Create(AOwner);
      // FTimerForFlyOut.Name := 'TimerForFlyOut';
      FTimerForFlyOut.SetSubComponent(True);
      // FTimerForFlyOut.FreeNotification(Self);
    end;
    if AOwner is TFMXObject then
    begin
      FTimerForFlyOut.Parent := AOwner as TFMXObject;
    end
    else
    begin
      FTimerForFlyOut.Parent := Parent;
    end;
    FTimerForFlyOut.Enabled := False;
    FTimerForFlyOut.Interval := 1000;
    FTimerForFlyOut.OnTimer := FlyOutToastBox;

    if not Assigned(FTimerForKeyboardCheck) then
    begin
      FTimerForKeyboardCheck := TTimer.Create(AOwner);
      // FTimerForKeyboardCheck.Name := 'TimerForFlyOut';
      FTimerForKeyboardCheck.SetSubComponent(True);
      // FTimerForKeyboardCheck.FreeNotification(Self);
    end;
    if AOwner is TFMXObject then
    begin
      FTimerForKeyboardCheck.Parent := AOwner as TFMXObject;
    end
    else
    begin
      FTimerForKeyboardCheck.Parent := Parent;
    end;
    FTimerForKeyboardCheck.Enabled := False;
    FTimerForKeyboardCheck.Interval := FVisualKeyboardSettings.CheckInterval;
    FTimerForKeyboardCheck.OnTimer := TimerForKeyboardCheckOnTimer;
  end;

  CheckParent;

  FStateChangeMessageId := TMessageManager.DefaultManager.SubscribeToMessage(TVKStateChangeMessage, VirtualKeyboardChangeHandler);

end;

destructor TCustomFlyToast.Destroy;
begin
  StopDefaultAnimate;
//  if Assigned(FToastView) then
//  begin
//    FToastView.Parent := nil;
//  end;
//  if Assigned(FToastTextEffect) then
//  begin
//    FToastTextEffect.Parent := nil;
//  end;
//  if Assigned(FToastBoxEffect) then
//  begin
//    FToastBoxEffect.Parent := nil;
//  end;
  if Assigned(FRectangle) then
  begin
    FRectangle.OnClick := nil;
    FRectangle.OnDblClick := nil;
    FRectangle.OnKeyDown := nil;
    FRectangle.OnKeyUp := nil;
    FRectangle.OnMouseDown := nil;
    FRectangle.OnMouseMove := nil;
    FRectangle.OnMouseUp := nil;
    FRectangle.OnMouseWheel := nil;
    FRectangle.OnMouseEnter := nil;
    FRectangle.OnMouseLeave := nil;
    FRectangle.Touch := nil;
    FRectangle.OnGesture := nil;
  end;

  if Assigned(FTextField) then
  begin
    FTextField.OnClick := nil;
    FTextField.OnDblClick := nil;
    FTextField.OnKeyDown := nil;
    FTextField.OnKeyUp := nil;
    FTextField.OnMouseDown := nil;
    FTextField.OnMouseMove := nil;
    FTextField.OnMouseUp := nil;
    FTextField.OnMouseWheel := nil;
    FTextField.OnMouseEnter := nil;
    FTextField.OnMouseLeave := nil;
    FTextField.Touch := nil;
    FTextField.OnGesture := nil;
  end;
  //由于窗体的子对象销毁得不到通知，所以，一旦成为窗体的子对象，就不能从这里销毁了。
  //但是窗体子对象的子对象还是可以销毁的。
  if not FTextFieldParentIsForm then
  begin
    if Assigned(FTextField) then
    begin
      FreeAndNil(FTextField);
    end;
  end;
  if not FRectangleParentIsForm then
  begin
    if Assigned(FRectangle) then
    begin
      FreeAndNil(FRectangle);
    end;
  end;
  if not FTimerForHideParentIsForm then
  begin
    if Assigned(FTimerForHide) then
    begin
      FreeAndNil(FTimerForHide);
    end;
  end;
  if not FTimerForFlyOutParentIsForm then
  begin
    if Assigned(FTimerForFlyOut) then
    begin
      FreeAndNil(FTimerForFlyOut);
    end;
  end;
  if not FTimerForKeyboardCheckParentIsForm then
  begin
    if Assigned(FTimerForKeyboardCheck) then
    begin
      FreeAndNil(FTimerForKeyboardCheck);
    end;
  end;
  //下面的对象不受影响。
  //if not FDefaultToastBoxEffectParentIsForm then
  begin
    if Assigned(FDefaultToastBoxEffect) then
    begin
      FreeAndNil(FDefaultToastBoxEffect);
    end;
  end;

  if Assigned(FVisualKeyboardSettings) then
  begin
    FreeAndNil(FVisualKeyboardSettings);
  end;
  TMessageManager.DefaultManager.Unsubscribe(TVKStateChangeMessage, FStateChangeMessageId);
  inherited Destroy;
end;

procedure TCustomFlyToast.VirtualKeyboardChangeHandler(const Sender: TObject;
  const Msg: System.Messaging.TMessage);
begin
  exit;
{$IFDEF ANDROID}
  if not FVisualKeyboardSettings.EnabledCheck then
  begin
{$ELSE}
{$ENDIF}
    if TVKStateChangeMessage(Msg).KeyboardVisible then
    begin
      FVisualKeyboardRect := TVKStateChangeMessage(Msg).KeyboardBounds;
      FVisualKeyboardHeight := Min(TVKStateChangeMessage(Msg).KeyboardBounds.Height,
        TVKStateChangeMessage(Msg).KeyboardBounds.Width);
    end
    else
    begin
      FVisualKeyboardHeight := 0;
      FVisualKeyboardRect := TRect.Empty;
    end;
    FVisualKeyboardLastHeight := FVisualKeyboardHeight;
    FVisualKeyboardVisible := TVKStateChangeMessage(Msg).KeyboardVisible;
    ProcessVisualKeyboardEvent;
{$IFDEF ANDROID}
  end;
{$ELSE}
{$ENDIF}
end;

{$IFDEF ANDROID}
function GetVisualKeyboardRect: TRect;
var
  ContentRect, TotalRect: JRect;
begin
  ContentRect := TJRect.Create;
  TotalRect := TJRect.Create;
//  CallInUIThread(
//    procedure
//    begin
      MainActivity.getWindow.getDecorView.getWindowVisibleDisplayFrame(ContentRect);
      MainActivity.getWindow.getDecorView.getDrawingRect(TotalRect);
//    end);
  Result := TRectF.Create(ConvertPixelToPoint(TPointF.Create(TotalRect.left, TotalRect.top + ContentRect.height)),
    ConvertPixelToPoint(TPointF.Create(TotalRect.right, TotalRect.bottom))).Truncate;
end;
{$ENDIF}

function GetVisualKeyboardHeight(ARect: TRect): Single;
begin
  Result := Min(ARect.Height, ARect.Width);
  if Result < 30 then Result := 0;
end;

procedure TCustomFlyToast.TimerForKeyboardCheckOnTimer(Sender: TObject);
begin
{$IFDEF ANDROID}
  if not Assigned(FTimerForKeyboardCheck) then exit;
  if not Assigned(FVisualKeyboardSettings) then exit;
  FTimerForKeyboardCheck.Enabled := False;
  try
    FVisualKeyboardRect := GetVisualKeyboardRect;
    FVisualKeyboardHeight := GetVisualKeyboardHeight(FVisualKeyboardRect);
    FVisualKeyboardVisible := FVisualKeyboardHeight >= 1;
    //if FVisualKeyboardLastHeight <> FVisualKeyboardHeight then
    if (FVisualKeyboardLastHeight >= 1) <> FVisualKeyboardVisible then
    begin
      TThread.Synchronize(nil,
        procedure
        begin
          ProcessVisualKeyboardEvent;
        end);
    end;
    FVisualKeyboardLastHeight := FVisualKeyboardHeight;
  finally
    FTimerForKeyboardCheck.Enabled := FVisualKeyboardSettings.EnabledCheck;
  end;
{$ELSE}
{$ENDIF}
end;

procedure TCustomFlyToast.CancelForShowHide(Animate: Boolean = False; WaitForIt: Boolean = False);
begin
  FTimerForHide.Enabled := False;
  Hide(Animate, WaitForIt);
  FTimerForHide.Enabled := False;
end;

procedure TCustomFlyToast.CancelForFlyInOut(Animate: Boolean = False; WaitForIt: Boolean = False);
begin
  FTimerForFlyOut.Enabled := False;
  Hide(Animate, WaitForIt);
  FTimerForFlyOut.Enabled := False;
end;

procedure TCustomFlyToast.BringToastBoxToFront;
begin
  if Assigned(FRectangle) then
  begin
    //影响速度。
    FRectangle.BringToFront;
  end;
end;

procedure TCustomFlyToast.SendToastBoxToBack;
begin
  if Assigned(FRectangle) then
  begin
    // SendToBack 有内存泄露。
    // FRectangle.SendToBack;
    FRectangle.Visible := False;
  end;
end;

procedure TCustomFlyToast.UpdateToastBoxEffects;
var
  CurrEffect: TEffect;
begin
  CurrEffect := GetCurrToastBoxEffect;
  if not Assigned(CurrEffect) then
    Exit;
  if not CurrEffect.Enabled then
    Exit;
  CurrEffect.Parent := FRectangle;
  CurrEffect.UpdateParentEffects;
end;

procedure TCustomFlyToast.DoAniFinishedForShow(Sender: TObject);
begin
  if Assigned(FOnAnimateShown) then
  begin
    FOnAnimateShown(Sender);
  end;
  if Assigned(FDefaultToastBoxEffect) then
  begin
    FDefaultToastBoxEffect.Enabled := FDefaultToastBoxEffectEnabled;
  end;
  if Assigned(FToastTextEffect) then
  begin
    FToastTextEffect.Enabled := FToastTextEffectEnabled;
  end;
  if Assigned(Sender) and (Sender is TAnimator) then
    TAnimation(Sender).DisposeOf;
  UpdateToastBoxEffects;
end;

procedure TCustomFlyToast.DoAniProcessForShow(Sender: TObject);
begin
  if AnimateToastBoxEffectOnShow then
    UpdateToastBoxEffects;
end;

procedure TCustomFlyToast.DoAniFinishedForHide(Sender: TObject);
begin
  SendToastBoxToBack;
  if Assigned(FOnAnimateHided) then
  begin
    FOnAnimateHided(Sender);
  end;
  if Assigned(FDefaultToastBoxEffect) then
  begin
    FDefaultToastBoxEffect.Enabled := FDefaultToastBoxEffectEnabled;
  end;
  if Assigned(FToastTextEffect) then
  begin
    FToastTextEffect.Enabled := FToastTextEffectEnabled;
  end;
  if Assigned(Sender) and (Sender is TAnimator) then
    TAnimation(Sender).DisposeOf;
end;

procedure TCustomFlyToast.DoAniProcessForHide(Sender: TObject);
begin

end;

procedure TCustomFlyToast.AnimateHide(WaitForIt: Boolean = False);
var
  A: TFloatAnimation;
  APropertyName: String;
begin
  APropertyName := 'Opacity';
  //使用效果的时候，效率太低。
  if Assigned(FDefaultToastBoxEffect) then
  begin
    FDefaultToastBoxEffectEnabled := FDefaultToastBoxEffect.Enabled;
    FDefaultToastBoxEffect.Enabled := AnimateToastBoxEffectOnShow;
  end;
  if Assigned(FToastTextEffect) then
  begin
    FToastTextEffectEnabled := FToastTextEffect.Enabled;
    FToastTextEffect.Enabled := AnimateToastBoxEffectOnShow;
  end;
  if WaitForIt then
  begin
    FRectangle.AnimateFloatWait(APropertyName, 0, 0.3, TAnimationType.Out, TInterpolationType.Linear);
    SendToastBoxToBack;
    if Assigned(FDefaultToastBoxEffect) then
    begin
      FDefaultToastBoxEffect.Enabled := FDefaultToastBoxEffectEnabled;
    end;
    if Assigned(FToastTextEffect) then
    begin
      FToastTextEffect.Enabled := FToastTextEffectEnabled;
    end;
    Exit;
  end;
  if Assigned(FRectangle) then
  begin
    FRectangle.StopPropertyAnimation(APropertyName);
    A := TFloatAnimation.Create(Self);
    A.Parent := FRectangle;
    A.AnimationType := TAnimationType.Out;
    A.Interpolation := TInterpolationType.Linear;
    A.OnFinish := DoAniFinishedForHide;
    A.OnProcess := DoAniProcessForHide;
    A.Duration := FAnimateHideDuration;
    A.PropertyName := APropertyName;
    A.StartFromCurrent := True;
    A.StopValue := 0;
    A.Start;
  end;
end;

procedure TCustomFlyToast.AnimateShow(WaitForIt: Boolean = False);
var
  A: TFloatAnimation;
  APropertyName: String;
begin
  APropertyName := 'Opacity';
  //使用效果的时候，效率太低。
  if Assigned(FDefaultToastBoxEffect) then
  begin
    FDefaultToastBoxEffectEnabled := FDefaultToastBoxEffect.Enabled;
    FDefaultToastBoxEffect.Enabled := AnimateToastBoxEffectOnShow;
  end;
  if Assigned(FToastTextEffect) then
  begin
    FToastTextEffectEnabled := FToastTextEffect.Enabled;
    FToastTextEffect.Enabled := AnimateToastBoxEffectOnShow;
  end;
  if WaitForIt then
  begin
    FRectangle.AnimateFloatWait(APropertyName, 1, 0.3, TAnimationType.In, TInterpolationType.Linear);
    if Assigned(FDefaultToastBoxEffect) then
    begin
      FDefaultToastBoxEffect.Enabled := FDefaultToastBoxEffectEnabled;
    end;
    if Assigned(FToastTextEffect) then
    begin
      FToastTextEffect.Enabled := FToastTextEffectEnabled;
    end;
    Exit;
  end;
  if Assigned(FRectangle) then
  begin
    FRectangle.StopPropertyAnimation(APropertyName);
    A := TFloatAnimation.Create(Self);
    A.Parent := FRectangle;
    A.AnimationType := TAnimationType.In;
    A.Interpolation := TInterpolationType.Linear;
    A.OnFinish := DoAniFinishedForShow;
    A.OnProcess := DoAniProcessForShow;
    A.Duration := FAnimateShowDuration;
    A.PropertyName := APropertyName;
    A.StartFromCurrent := True;
    A.StopValue := 1;
    A.Start;
  end;
end;

procedure TCustomFlyToast.Hide(Animate: Boolean = True; WaitForIt: Boolean = False);
begin
  if Assigned(FTimerForHide) then
  begin
    FTimerForHide.Enabled := False;
  end;

  if FRectangle.Opacity <= 0 then
  begin
    SendToastBoxToBack;
    exit;
  end;

  if Assigned(FRectangle) then
  begin
    if Animate then
    begin
      AnimateHide(WaitForIt);
    end
    else
    begin
      FRectangle.StopPropertyAnimation('Opacity');
      FRectangle.BeginUpdate;
      try
        FRectangle.Opacity := 0;
        SendToastBoxToBack;
      finally
        FRectangle.EndUpdate;
      end;
    end;
  end;
  FToastBoxShowing := False;
  FStartShowTime := Now;
  FStartFlyInTime := Now;
  if Assigned(FOnHide) then
  begin
    FOnHide(Self, Animate);
  end;
end;

procedure TCustomFlyToast.StopHideTimer;
begin
  FTimerForHide.Enabled := False;
end;

procedure TCustomFlyToast.StopFlyOutTimer;
begin
  FTimerForFlyOut.Enabled := False;
end;

procedure TCustomFlyToast.BeforeReShow;
begin
  FTimerForHide.Enabled := False;
  FTimerForFlyOut.Enabled := False;
  StopDefaultAnimate;
  FTimerForHide.Enabled := False;
end;

procedure TCustomFlyToast.BeforeReFlyIn;
begin
  FTimerForHide.Enabled := False;
  FTimerForFlyOut.Enabled := False;
  StopDefaultAnimate;
  FTimerForFlyOut.Enabled := False;
end;

procedure TCustomFlyToast.Show(Reshow: Boolean = True; Animate: Boolean = True; WaitForIt: Boolean = False);
var
  ParentedRect: TRectF;
begin
  if not Assigned(FRectangle) then
    Exit;
  if not Assigned(FTimerForHide) then
    Exit;
  if FInited and (FToastBoxAutoPosition <> TToastBoxAutoPosition.None) and (FRectangle.Align = TAlignLayout.None)
  then
  begin
    ParentedRect := GetParentedRect;
    FInited := FOldParentedRect.Width = ParentedRect.Width;
    if FInited then
    begin
      FInited := FOldParentedRect.Height = ParentedRect.Height;
    end;
  end;
  if not FInited then
  begin
    ReInit;
  end;
  if (not Reshow) and FRectangle.Visible and FToastBoxShowing then
  begin
    FTimerForHide.Interval := FTimerForHide.Interval + Cardinal(FDuration);
    if FDuration > 0 then
    begin
      if FTimerForHide.Interval > Cardinal(FDuration * MaxDurationTimes) then
      begin
        FTimerForHide.Interval := FDuration * MaxDurationTimes;
      end;
    end;
    Exit;
  end;

  FRectangle.BeginUpdate;
  try
    if FTimerForHide.Enabled then
    begin
      BeforeReShow;
    end;
    FRectangle.Visible := True;
  finally
    FRectangle.EndUpdate;
  end;
  FStartShowTime := Now;
  FToastBoxShowing := True;
  if (not Animate) then
  begin
    FRectangle.BeginUpdate;
    try
      FRectangle.Opacity := 1;
    finally
      FRectangle.EndUpdate;
    end;
  end
  else
  begin
    AnimateShow(WaitForIt);
  end;
  FTimerForHide.Interval := FDuration;
  FTimerForHide.Enabled := True;
  if Assigned(FOnShow) then
  begin
    FOnShow(Self, Animate);
  end;
end;

procedure TCustomFlyToast.DoTextSettingsChanged;
begin

end;

function TCustomFlyToast.ReInitToastText: String;
begin
  Result := Name;
  if Assigned(FTextField) then
  begin
    Result := FTextField.Text;
  end;
end;

procedure TCustomFlyToast.ReInitTextSetting(const IsMultiText: Boolean);
begin

end;

procedure TCustomFlyToast.ReInitRectangleSetting;
begin
  if not Assigned(FDefaultToastBoxEffect) then
    Exit;

  if (not FDefaultToastBoxEffectSoftnessInited) or (FOldDefaultToastBoxEffectSoftness <> FDefaultToastBoxEffect.Softness)
  then
  begin
    FDefaultToastBoxEffect.Softness := FOldDefaultToastBoxEffectSoftness * GetStyleScale;
    FOldDefaultToastBoxEffectSoftness := FDefaultToastBoxEffect.Softness;
    FDefaultToastBoxEffectSoftnessInited := True;
  end;
end;

function TCustomFlyToast.GetTextHeight(const AText: string; UseCurrWidth: Boolean = True): Single;
var
  R: TRectF;
begin
  Result := 0;
  if not Assigned(FTextField) then Exit;
  if not Assigned(FTextField.Canvas) then Exit;
  R := RectF(0, 0, 10000, 10000);
  if UseCurrWidth then
  begin
    R.Width := FTextField.Width;
  end;
  FTextField.Canvas.MeasureText(R, AText, FTextField.WordWrap,
    [], FTextField.TextAlign, TTextAlign.Leading);
  Result := R.Bottom;
end;

const
  FuzzFactor = 1000;
  SingleResolution   = 1E-7 * FuzzFactor;
  DoubleResolution   = 1E-15 * FuzzFactor;
{$IFDEF EXTENDEDIS10BYTES}
  ExtendedResolution = 1E-19 * FuzzFactor;
{$ELSE  EXTENDEDIS10BYTES}
  ExtendedResolution = DoubleResolution;
{$ENDIF EXTENDEDIS10BYTES}
function TCustomFlyToast.GetTextWidth(const AText: string; UseCurrHeight: Boolean = True): Single;
var
  R: TRectF;
begin
  Result := 0;
  if not Assigned(FTextField) then Exit;
  if not Assigned(FTextField.Canvas) then Exit;
  R := RectF(0, 0, 10000, 20);
  if UseCurrHeight then
  begin
    R.Height := FTextField.Height;
  end;
  FTextField.Canvas.MeasureText(R, AText, FTextField.WordWrap,
    [], TTextAlign.Leading, TTextAlign.Leading);
{$IF Defined(IOS) OR Defined(ANDROID)}
  Result := R.Right + SingleResolution;
{$ELSE}
  Result := R.Right + 1E-2 * FuzzFactor;
{$ENDIF}
end;

function GetScreenSize: TSizeF;
var
  ScreenService: IFMXScreenService;
  ScreenSize: TPointF;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
  begin
    ScreenSize := ScreenService.GetScreenSize;
    Result := TSizeF.Create(ScreenSize.X, ScreenSize.Y)
  end else
  begin
    Result.cx := 0;
    Result.cy := 0;
  end;
end;

var
  OnelineHalfHeight: Single = 0.0;

procedure TCustomFlyToast.ReInit(SetOpacityTo: Single = 0);
var
  TrueWidth,
  RectScale, ScaledMinTextWidth, ScaledMaxTextWidth,
  ScaledMarginForViewAndText, HorizontalScaledMargin, VerticalScaledMargin,
    TextUsedWidth, TextUsedHeight, ViewScaledWidth, TextWidth,
    ViewScaledHeight, TextHeight, MaxWidth, MaxHeight: Single;
  isShowText: Boolean;
  FormatedText: String;
  IsMultiText: Boolean;
  TempTSizeF: TSizeF;
begin
  ResetRealFlyToastTypeVersion;
  if (FRealFlyToastTypeVersion = TFlyToastTypeVersion.Android5x) and
    (OnelineHalfHeight < 0.1) then
  begin
    OnelineHalfHeight := 0.11;
    ReInit;
  end;
  if not Assigned(FRectangle) then
    Exit;
  if not Assigned(FTextField) then
    Exit;
  if not Assigned(FRectangle.Canvas) then
    Exit;
  if not Assigned(FTextField.Canvas) then
    Exit;
  if not Assigned(FTimerForHide) then
    Exit;
  if not Assigned(FTimerForFlyOut) then
    Exit;

  FRectangle.OnClick := FOnClick;
  FRectangle.OnDblClick := FOnDblClick;
  FRectangle.OnKeyDown := FOnKeyDown;
  FRectangle.OnKeyUp := FOnKeyUp;
  FRectangle.OnMouseDown := FOnMouseDown;
  FRectangle.OnMouseMove := FOnMouseMove;
  FRectangle.OnMouseUp := FOnMouseUp;
  FRectangle.OnMouseWheel := FOnMouseWheel;
  FRectangle.OnMouseEnter := FOnMouseEnter;
  FRectangle.OnMouseLeave := FOnMouseLeave;
  FTextField.OnClick := FOnClick;
  FTextField.OnDblClick := FOnDblClick;
  FTextField.OnKeyDown := FOnKeyDown;
  FTextField.OnKeyUp := FOnKeyUp;
  FTextField.OnMouseDown := FOnMouseDown;
  FTextField.OnMouseMove := FOnMouseMove;
  FTextField.OnMouseUp := FOnMouseUp;
  FTextField.OnMouseWheel := FOnMouseWheel;
  FTextField.OnMouseEnter := FOnMouseEnter;
  FTextField.OnMouseLeave := FOnMouseLeave;
  FTimerForHide.OnTimer := HideToastBox;
  FTimerForFlyOut.OnTimer := FlyOutToastBox;

  RectScale := GetRectScale;
  HorizontalScaledMargin := FTextHorizontalMargin * RectScale;
  VerticalScaledMargin := FTextVerticalMargin * RectScale;
  ScaledMarginForViewAndText := FMarginForViewAndText * RectScale;
  ScaledMinTextWidth := FMinTextWidth * RectScale;
  TempTSizeF := GetScreenSize;
  TrueWidth := TempTSizeF.Width;
  if TrueWidth > TempTSizeF.Height then
  begin
    TrueWidth := TempTSizeF.Height;
  end;

  ScaledMaxTextWidth := RoundTo((TrueWidth * Max(Min(FPrecentForMaxTextWidth, 100), 10)) / 100, -2);
  if ScaledMaxTextWidth < ScaledMinTextWidth then
    ScaledMaxTextWidth := ScaledMinTextWidth;

  if (FRealFlyToastTypeVersion = TFlyToastTypeVersion.Android5x) and
     (OnelineHalfHeight > 0.1) and (OnelineHalfHeight < 0.12) then
  begin
    FormatedText := 'AgfWi你好';
  end
  else
  begin
    FormatedText := ReInitToastText;
  end;

  IsMultiText := Pos(sLineBreak, FormatedText) > 0;
  // XE6 下显示重叠 FRectangle.BeginUpdate;
  try
    FTextField.Margins.Left := HorizontalScaledMargin + ToastTextHorizontalShift;
    FTextField.Margins.Right := HorizontalScaledMargin;
    FTextField.Margins.Top := VerticalScaledMargin;
    FTextField.Margins.Bottom := VerticalScaledMargin;
    DoTextSettingsChanged;
    ReInitTextSetting(IsMultiText);
    FTextField.Text := FormatedText;

    if FRootParentMode then
    begin
      FRectangle.Parent := GetRootParent;
    end
    else
    begin
      FRectangle.Parent := Parent;
    end;
    ReInitRectangleSetting;

    isShowText := not(Assigned(FToastView) and (FormatedText = ''));
    FTextField.Visible := isShowText;
    FTextField.Position.X := HorizontalScaledMargin;
    FTextField.Position.Y := VerticalScaledMargin;
    SetRectangleRadius(not Assigned(FToastView));
    if Assigned(FToastView) then
    begin
      FToastView.Parent := FRectangle;
      FToastView.Position.X := 0;
      FToastView.Position.Y := 0;
      ViewScaledWidth := FToastView.Width * IRotatedControl(FToastView).Scale.X;
      ViewScaledHeight := FToastView.Height * IRotatedControl(FToastView).Scale.Y;
      if ViewScaledWidth < FRectangle.Width then
      begin
        FToastView.Position.X := (FRectangle.Width - ViewScaledWidth) / 2;
      end;
      if ViewScaledHeight < FRectangle.Height then
      begin
        FToastView.Position.Y := (FRectangle.Height - ViewScaledHeight) / 2;
      end;
      FToastView.Visible := True;
      if isShowText then
      begin
        FToastView.Align := TAlignLayout.None;
      end;
    end
    else
    begin
      ViewScaledWidth := 0;
      ViewScaledHeight := 0;
    end;

    if FormatedText <> '' then
    begin
      //TextWidth := FTextField.Canvas.TextWidth(FormatedText);
      TextWidth := GetTextWidth(FormatedText, False);
      // ShowMessage(TextWidth.ToString);
      if TStyledSetting.Size in FTextField.StyledSettings then
      begin
        TextWidth := TextWidth * RectScale;
      end;
      //TextWidth := TextWidth * Get_TextRect_Width_CNChar_Fix_111 + Get_TextRect_Width_CNChar_Fix_Add;
      // ShowMessage((StyleScale * 160 / 144).ToString);
      TextWidth := TextWidth * FTextField.Scale.X;
      if TextWidth < ScaledMinTextWidth then
        TextWidth := ScaledMinTextWidth;
      if TextWidth < 0 then
        TextWidth := 0;
      if FOptimalWidth and FOptimalMaxWidth then
      begin
        if TextWidth > ScaledMaxTextWidth then
          TextWidth := ScaledMaxTextWidth;
      end;
    end
    else
    begin
      TextWidth := ScaledMinTextWidth;
    end;
{$IFDEF MSWINDOWS}
    if IsMultiText and (FTextField.VertTextAlign = TTextAlign.Center) and
      ((not Assigned(FToastView)) or
          (FViewAlignWithText in [TAlignForViewAndText.akTop, TAlignForViewAndText.akBottom])) then
//Win 下面 水平居中，无法正常居中。
      TextWidth := TextWidth + HorizontalScaledMargin * 1.5;
{$ENDIF}
    TextUsedWidth := TextWidth + HorizontalScaledMargin * 2;
    try
      FTextField.Width := TextWidth / FTextField.Scale.X;
    except
    end;
    if FOptimalWidth then
    begin
      if (isShowText and Assigned(FToastView)) then
      begin
        if FViewAlignWithText in [TAlignForViewAndText.akLeft, TAlignForViewAndText.akRight] then
        begin
          MaxWidth := TextUsedWidth + ViewScaledWidth + ScaledMarginForViewAndText - HorizontalScaledMargin;
        end
        else
        begin
          MaxWidth := TextUsedWidth;
          if MaxWidth < ViewScaledWidth then
            MaxWidth := ViewScaledWidth;
        end;
      end
      else if isShowText then
      begin
        MaxWidth := TextUsedWidth;
      end
      else
      begin
        MaxWidth := ViewScaledWidth;
      end;
      FRectangle.Width := MaxWidth;
    end;

    if FormatedText <> '' then
    begin
      //TextHeight := FTextField.Canvas.TextHeight(FormatedText);
      //TextHeight := GetTextHeight(FormatedText, (not FOptimalWidth) or (FOptimalWidth and FOptimalMaxWidth));
      TextHeight := GetTextHeight(FormatedText);
      if TStyledSetting.Size in FTextField.StyledSettings then
      begin
        TextHeight := TextHeight * RectScale;
      end;
      // ShowMessage((StyleScale * 160 / 144).ToString);
      TextHeight := TextHeight * FTextField.Scale.Y;
      if TextHeight < 0 then
        TextHeight := 0;
    end
    else
    begin
      TextHeight := FRectangle.Height - VerticalScaledMargin * 2;
    end;
    TextUsedHeight := TextHeight + VerticalScaledMargin * 2;
    if FOptimalWidth and FOptimalMaxWidth then
      FTextField.Text := '';
    try
      FTextField.Height := TextHeight / FTextField.Scale.Y;
    except
    end;

    if (FRealFlyToastTypeVersion = TFlyToastTypeVersion.Android5x) and
     (OnelineHalfHeight > 0.1) and (OnelineHalfHeight < 0.12) then
    begin
      OnelineHalfHeight := FRectangle.Height / 2;
      exit;
    end;

    if FOptimalWidth and FOptimalMaxWidth then
      FTextField.Text := FormatedText;
    if FOptimalHeight then
    begin
      if (isShowText and Assigned(FToastView)) then
      begin
        if FViewAlignWithText in [TAlignForViewAndText.akTop, TAlignForViewAndText.akBottom] then
        begin
          MaxHeight := TextUsedHeight + ViewScaledHeight + ScaledMarginForViewAndText - VerticalScaledMargin;
        end
        else
        begin
          MaxHeight := TextUsedHeight;
          if MaxHeight < ViewScaledHeight then
            MaxHeight := ViewScaledHeight;
        end;
      end
      else if isShowText then
      begin
        MaxHeight := TextUsedHeight;
      end
      else
      begin
        MaxHeight := ViewScaledHeight;
      end;
      FRectangle.Height := MaxHeight;
    end;

    if isShowText then
    begin
      if (not Assigned(FToastView)) or (FShortObjectAlign = TTextAlign.Center) then
      begin
        if (not Assigned(FToastView)) or
          (FViewAlignWithText in [TAlignForViewAndText.akLeft, TAlignForViewAndText.akRight]) then
        begin
          FTextField.Position.Y := (FRectangle.Height - TextHeight) / 2;
        end;
        if (not Assigned(FToastView)) or
          (FViewAlignWithText in [TAlignForViewAndText.akTop, TAlignForViewAndText.akBottom]) then
        begin
          FTextField.Position.X := (FRectangle.Width - TextWidth) / 2;
        end;
      end;
    end;
    if Assigned(FToastView) then
    begin
      FToastView.Position.X := 0;
      FToastView.Position.Y := 0;
      if (not isShowText) or (FShortObjectAlign = TTextAlign.Center) then
      begin
        if (FViewAlignWithText in [TAlignForViewAndText.akLeft, TAlignForViewAndText.akRight]) then
        begin
          FToastView.Position.Y := (FRectangle.Height - ViewScaledHeight) / 2;
        end
        else if (FViewAlignWithText in [TAlignForViewAndText.akTop, TAlignForViewAndText.akBottom]) then
        begin
          FToastView.Position.X := (FRectangle.Width - ViewScaledWidth) / 2;
        end;
      end;
      if isShowText and (FShortObjectAlign = TTextAlign.Trailing) then
      begin
        if (FViewAlignWithText in [TAlignForViewAndText.akLeft, TAlignForViewAndText.akRight]) then
        begin
          if TextUsedHeight > ViewScaledHeight then
          begin
            FToastView.Position.Y := FRectangle.Height - ViewScaledHeight;
          end
          else
          begin
            FTextField.Position.Y := FRectangle.Height - TextUsedHeight + VerticalScaledMargin;
          end;
        end
        else if (not isShowText) or (FViewAlignWithText in [TAlignForViewAndText.akTop, TAlignForViewAndText.akBottom])
        then
        begin
          if TextUsedWidth > ViewScaledWidth then
          begin
            FToastView.Position.X := FRectangle.Width - ViewScaledWidth;
          end
          else
          begin
            FTextField.Position.X := FRectangle.Width - TextUsedWidth + HorizontalScaledMargin;
          end;
        end;
      end;
      if isShowText then
      begin
        if FViewAlignWithText = TAlignForViewAndText.akRight then
        begin
          FToastView.Position.X := FTextField.Position.X + TextWidth + ScaledMarginForViewAndText;
        end
        else if FViewAlignWithText = TAlignForViewAndText.akTop then
        begin
          FTextField.Position.Y := FToastView.Position.Y + ViewScaledHeight + ScaledMarginForViewAndText;
        end
        else if FViewAlignWithText = TAlignForViewAndText.akBottom then
        begin
          FToastView.Position.Y := FTextField.Position.Y + TextHeight + ScaledMarginForViewAndText;
        end
        else
        begin
          FTextField.Position.X := FToastView.Position.X + ViewScaledWidth + ScaledMarginForViewAndText;
        end;
      end;
    end;
    if IsMultiText then
    begin
{$IF Defined(IOS) OR Defined(ANDROID)}
      FTextField.Position.X := FTextField.Position.X + ToastTextHorizontalShift;
{$ELSE}
      if FTextField.TextAlign <> TTextAlign.Trailing then
      begin
        FTextField.Position.X := FTextField.Position.X + ToastTextHorizontalShift + ToastMultiTextHorizontalShift;
      end
      else if FTextField.TextAlign = TTextAlign.Trailing then
      begin
        if HorizontalScaledMargin >= ToastMultiTextHorizontalShift then
        begin
          FTextField.Position.X := FTextField.Position.X - ToastTextHorizontalShift - ToastMultiTextHorizontalShift;
        end;
      end;
{$ENDIF}
    end
    else
    begin
      FTextField.Position.X := FTextField.Position.X + ToastTextHorizontalShift;
    end;
    ResetPosition(TRectF.Empty);
    CheckParent;

    if isShowText then
    begin
      FRectangle.Corners := [TCorner.TopLeft, TCorner.TopRight, TCorner.BottomLeft, TCorner.BottomRight];
      if (FRealFlyToastTypeVersion = TFlyToastTypeVersion.Android5x) and
       (OnelineHalfHeight > 0.1) and (OnelineHalfHeight < 0.12) then
      begin
        OnelineHalfHeight := FRectangle.Height / 2;
        FRectangle.CornerType := TCornerType.Round;
        FRectangle.XRadius := OnelineHalfHeight;
        FRectangle.YRadius := OnelineHalfHeight;
        exit;
      end
      else if (FRealFlyToastTypeVersion = TFlyToastTypeVersion.Android5x) and
        (OnelineHalfHeight > 0.11) then
      begin
        FRectangle.CornerType := TCornerType.Round;
        FRectangle.XRadius := OnelineHalfHeight;
        FRectangle.YRadius := OnelineHalfHeight;
      end
      else
      begin
        //TFlyToastTypeVersion.Android4x
        FRectangle.CornerType := TCornerType.InnerLine;
        FRectangle.XRadius := 2;
        FRectangle.YRadius := 2;
      end;
    end
    else
    begin
      FRectangle.Corners := [];
    end;


    ApplyToastBoxEffect;

    if FFirstInited then
    begin
      //由于影响速度，尽量只执行一次。
      BringToastBoxToFront;
      FFirstInited := False;
    end;

    FRectangle.Opacity := SetOpacityTo;
  finally
    // XE6 下显示重叠 FRectangle.EndUpdate;
  end;
  FInited := True;
end;

//procedure TCustomFlyToast.InitForShow;
//begin
//  FRectangle.BeginUpdate;
//  try
//    //影响速度。如果您真的放到后头了，请显示之前放到前头。
//    //BringToastBoxToFront;
//    FRectangle.Visible := True;
//  finally
//    FRectangle.EndUpdate;
//  end;
////  FRectangle.Repaint;
//end;

procedure TCustomFlyToast.StartTimerForHide(Interval: Cardinal);
begin
  if not Assigned(FTimerForHide) then
    Exit;
  FTimerForHide.Interval := Interval;
  FTimerForHide.Enabled := True;
end;

procedure TCustomFlyToast.FlyIn(AnimateShadow: Boolean = False);
var
  ParentedRect: TRectF;
begin
  if not Assigned(FRectangle) then
    Exit;
  if not Assigned(FTimerForFlyOut) then
    Exit;
  if FInited and (FToastBoxAutoPosition <> TToastBoxAutoPosition.None) and (FRectangle.Align = TAlignLayout.None)
  then
  begin
    ParentedRect := GetParentedRect;
    FInited := FOldParentedRect.Width = ParentedRect.Width;
    if FInited then
    begin
      FInited := FOldParentedRect.Height = ParentedRect.Height;
    end;
  end;
  if not FInited then
  begin
    ReInit(1);
  end;
  //影响速度。如果您真的放到后头了，请显示之前放到前头。
  //BringToastBoxToFront;
  if FTimerForFlyOut.Enabled then
  begin
    BeforeReFlyIn;
  end;
  FRectangle.Visible := True;
  FStartFlyInTime := Now;
  if Assigned(FOnFlyIn) then
  begin
    if AnimateShadow then
    begin
      AnimateToastBoxEffect;
    end;
    FOnFlyIn(Self);
  end;
  FTimerForFlyOut.Interval := FDuration;
  FTimerForFlyOut.Enabled := True;
end;

procedure TCustomFlyToast.FlyOut;
begin
  if Assigned(FTimerForFlyOut) then
  begin
    FTimerForFlyOut.Enabled := False;
  end;
  if Assigned(FRectangle) then
  begin
    if Assigned(FOnFlyOut) then
    begin
      FOnFlyOut(Self);
    end
    else
    begin
      FRectangle.Opacity := 0;
    end;
  end;
end;

procedure TCustomFlyToast.StopDefaultAnimate;
var
  P: TRttiProperty;
  CurrEffect: TEffect;
begin
  if Assigned(FRectangle) then
  begin
    FRectangle.StopPropertyAnimation('Opacity');
  end;
  CurrEffect := GetCurrToastBoxEffect;
  if not Assigned(CurrEffect) then
    Exit;
  if not CurrEffect.Enabled then
    Exit;
  P := FindProperty(CurrEffect, 'Opacity');
  if Assigned(P) then
  begin
    P.SetValue(CurrEffect, 0);
    CurrEffect.StopPropertyAnimation('Opacity');
  end;
  CurrEffect.Parent := nil;
end;

procedure TCustomFlyToast.AnimateToastBoxEffect;
var
  P: TRttiProperty;
  CurrEffect: TEffect;
begin
  CurrEffect := GetCurrToastBoxEffect;
  if not Assigned(CurrEffect) then
    Exit;
  if not CurrEffect.Enabled then
    Exit;
  CurrEffect.Parent := FRectangle;
  P := FindProperty(CurrEffect, 'Opacity');
  if Assigned(P) then
  begin
    P.SetValue(CurrEffect, 0);
    CurrEffect.AnimateFloat('Opacity', FToastBoxEffectOpacity, 0.2);
  end
  else
  begin
    CurrEffect.UpdateParentEffects;
  end;
end;

procedure TCustomFlyToast.HideToastBox(Sender: TObject);
var
  Handled: Boolean;
begin
  Handled := False;
  FToastBoxShowing := False;
  if Assigned(FOnTimerForHideEnd) then
  begin
    OnTimerForHideEnd(Self, Handled);
  end;
  if not Handled then
  begin
    Hide;
  end;
end;

procedure TCustomFlyToast.FlyOutToastBox(Sender: TObject);
var
  Handled: Boolean;
begin
  Handled := False;
  if Assigned(FOnTimerForFlyOutEnd) then
  begin
    OnTimerForFlyOutEnd(Self, Handled);
  end;
  if not Handled then
  begin
    FlyOut;
  end;
end;

procedure TCustomFlyToast.VisualKeyboardSettingsOnChange(Sender: TObject);
begin
  if Assigned(FTimerForKeyboardCheck) then
  begin
    FTimerForKeyboardCheck.Enabled := FVisualKeyboardSettings.EnabledCheck;
    FTimerForKeyboardCheck.Interval := FVisualKeyboardSettings.CheckInterval;
    FTimerForKeyboardCheck.OnTimer := TimerForKeyboardCheckOnTimer;
  end;
end;

function TCustomFlyToast.GetDefaultToastBoxEffectSoftness: Single;
begin
  Result := FOldDefaultToastBoxEffectSoftness;
  if not Assigned(FDefaultToastBoxEffect) then
    Exit;
  if FDefaultToastBoxEffectSoftnessInited then
  begin
    Result := RoundTo(FDefaultToastBoxEffect.Softness / GetRectScale, -4);
  end
  else
  begin
    Result := FDefaultToastBoxEffect.Softness;
  end;
end;

function TCustomFlyToast.GetNeedReInit: Boolean;
begin
  Result := not FInited;
end;

function TCustomFlyToast.GetLastDurationForHide: Integer;
begin
  Result := FDuration - MilliSecondsBetween(Now, FStartShowTime);
  if Result < 0 then
    Result := 0;
end;

function TCustomFlyToast.GetLastDurationForFlyOut: Integer;
begin
  Result := FDuration - MilliSecondsBetween(Now, FStartFlyInTime);
  if Result < 0 then
    Result := 0;
end;

function TCustomFlyToast.GetCurrToastBoxEffect: TEffect;
begin
  Result := FDefaultToastBoxEffect;
  if Assigned(FToastBoxEffect) then
  begin
    Result := FToastBoxEffect;
  end;
end;

procedure TCustomFlyToast.SetFlyToastTypeVersion(const Value: TFlyToastTypeVersion);
begin
  if FFlyToastTypeVersion <> Value then
  begin
    FFlyToastTypeVersion := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetAndroidPlatformUsesAutoToastType(const Value: Boolean);
begin
  if FAndroidPlatformUsesAutoToastType <> Value then
  begin
    FAndroidPlatformUsesAutoToastType := Value;
{$IF Defined(ANDROID) }
    ResetRealFlyToastTypeVersion;
    FInited := False;
{$ENDIF}
  end;
end;

procedure TCustomFlyToast.SetAutoMoveForVisualKeyboard(const Value: Boolean);
begin
  if FAutoMoveForVisualKeyboard <> Value then
  begin
    FAutoMoveForVisualKeyboard := Value;
    if FAutoMoveForVisualKeyboard then
    begin
      DoResetPosition;
    end;
  end;
end;

procedure TCustomFlyToast.SetAutoPositionWithHorizontalMargins(const Value: Boolean);
begin
  if FAutoPositionWithHorizontalMargins <> Value then
  begin
    FAutoPositionWithHorizontalMargins := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetAutoPositionWithVerticalMargins(const Value: Boolean);
begin
  if FAutoPositionWithVerticalMargins <> Value then
  begin
    FAutoPositionWithVerticalMargins := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetRootParentMode(const Value: Boolean);
begin
  if FRootParentMode <> Value then
  begin
    FRootParentMode := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetShortObjectAlign(const Value: TTextAlign);
begin
  if FShortObjectAlign <> Value then
  begin
    FShortObjectAlign := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetMarginForViewAndText(const Value: Single);
begin
  if FMarginForViewAndText <> Value then
  begin
    FMarginForViewAndText := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetViewAlignWithText(const Value: TAlignForViewAndText);
begin
  if FViewAlignWithText <> Value then
  begin
    FViewAlignWithText := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetDefaultToastBoxEffectSoftness(const Value: Single);
begin
  if not Assigned(FDefaultToastBoxEffect) then
    Exit;
  FDefaultToastBoxEffect.Softness := Value;
  FDefaultToastBoxEffectSoftnessInited := False;
end;

procedure TCustomFlyToast.SetToastTextEffect(const Value: TEffect);
begin
  if FToastTextEffect <> Value then
  begin
    if Assigned(FToastTextEffect) then
    begin
      FToastTextEffect.Parent := FOldTextEffectParent;
    end;
    FToastTextEffect := Value;
    if Assigned(FToastTextEffect) then
    begin
      FOldTextEffectParent := FToastTextEffect.Parent;
    end;
  end;
end;

procedure TCustomFlyToast.SetToastBoxEffect(const Value: TEffect);
var
  P: TRttiProperty;
begin
  if FToastBoxEffect <> Value then
  begin
    if Assigned(FToastBoxEffect) then
    begin
      FToastBoxEffect.Parent := FOldBoxEffectParent;
    end;
    FToastBoxEffect := Value;
    if Assigned(FToastBoxEffect) then
    begin
      FOldBoxEffectParent := FToastBoxEffect.Parent;
    end;
    FToastBoxEffectOpacity := 0.6;
    if Assigned(FToastBoxEffect) then
    begin
      P := FindProperty(FToastBoxEffect, 'Opacity');
      if Assigned(P) then
      begin
        FToastBoxEffectOpacity := P.GetValue(FToastBoxEffect).AsExtended;
      end;
    end
    else if Assigned(FDefaultToastBoxEffect) then
    begin
      FToastBoxEffectOpacity := FDefaultToastBoxEffect.Opacity;
    end;
  end;
end;

procedure TCustomFlyToast.SetToastBoxAutoPosition(const Value: TToastBoxAutoPosition);
begin
  FToastBoxAutoPosition := Value;
  if FInited and (Value <> TToastBoxAutoPosition.None) then
  begin
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetNeedReInit(const Value: Boolean);
begin
  FInited := not Value;
end;

procedure TCustomFlyToast.SetDuration(const Value: Integer);
begin
  FDuration := Value;
end;

procedure TCustomFlyToast.SetOptimalWidth(const Value: Boolean);
begin
  if FOptimalWidth <> Value then
  begin
    FOptimalWidth := Value;
  end;
  if not FOptimalWidth then
  begin
    FOptimalMaxWidth := False;
  end;
end;

procedure TCustomFlyToast.SetOptimalMaxWidth(const Value: Boolean);
begin
  if FOptimalMaxWidth <> Value then
  begin
    FOptimalMaxWidth := Value;
  end;
  if FOptimalMaxWidth then
  begin
    FOptimalWidth := True;
  end;
end;

procedure TCustomFlyToast.SetOptimalHeight(const Value: Boolean);
begin
  if FOptimalHeight <> Value then
  begin
    FOptimalHeight := Value;
  end;
end;

procedure TCustomFlyToast.SetToastView(const Value: TControl);
begin
  if Assigned(Value) then
  begin
    if Value = Parent then
      Exit;
    if Value = FRectangle then
      Exit;
    if Value = FTextField then
      Exit;
  end;
  if FToastView <> Value then
  begin
    if Assigned(FToastView) and Assigned(FOldVeiwParent) then
    begin
      FToastView.Parent := FOldVeiwParent;
    end;
    FToastView := Value;
    if Assigned(FToastView) then
    begin
      FOldVeiwParent := FToastView.Parent;
    end;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetMinTextWidth(const Value: Single);
begin
  if FMinTextWidth <> Value then
  begin
    FMinTextWidth := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetPrecentForMaxTextWidth(const Value: Single);
begin
  if FPrecentForMaxTextWidth <> Value then
  begin
    FPrecentForMaxTextWidth := Value;
    if FPrecentForMaxTextWidth > 100 then
    begin
      FPrecentForMaxTextWidth := 100;
    end;
    if FPrecentForMaxTextWidth < 0.1 then
    begin
      FPrecentForMaxTextWidth := 0.1;
    end;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetTextHorizontalMargin(const Value: Single);
begin
  if FTextHorizontalMargin <> Value then
  begin
    FTextHorizontalMargin := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.SetTextVerticalMargin(const Value: Single);
begin
  if FTextVerticalMargin <> Value then
  begin
    FTextVerticalMargin := Value;
    FInited := False;
  end;
end;

procedure TCustomFlyToast.ApplyToastBoxEffect;
begin
  if Assigned(FToastBoxEffect) and Assigned(FRectangle) then
  begin
    FToastBoxEffect.Parent := FRectangle;
    if Assigned(FDefaultToastBoxEffect) then
    begin
      FDefaultToastBoxEffect.Parent := Self;
    end;
    FToastBoxEffect.UpdateParentEffects;
  end
  else if Assigned(FDefaultToastBoxEffect) and Assigned(FRectangle.Parent) then
  begin
    FDefaultToastBoxEffect.Parent := FRectangle;
    FDefaultToastBoxEffect.UpdateParentEffects;
  end;
end;

{ TFlyToast }

class function TFlyToast.Toast(Owner: TCommonCustomForm; const Msg: string;
  Duration: TFlyToastLength = TFlyToastLength.ShortToast): TFlyToast;
begin
  Result := nil;
  if not Assigned(Owner) then
    Exit;
  Result := TFlyToast.Create(Owner);
  // Result.Name := 'FlyToast_' + FormatDateTime('YYYYMMDDHHSSNNZZZ', Now);
  Result.Parent := Owner;
  Result.OptimalWidth := True;
  Result.OptimalMaxWidth := True;
  Result.OptimalHeight := True;
  if Duration = TFlyToastLength.LongToast then
  begin
    Result.Duration := LongToastDuration;
  end
  else
  begin
    Result.Duration := ShortToastDuration;
  end;
  Result.ToastText := Msg;
  Result.Show;
end;

constructor TFlyToast.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTextFont := TFont.Create;
  FTextFont.OnChanged := TextFontOnChange;
  FTextSettings := TTextSettings.Create(Self);
  FDefaultTextSettings := TTextSettings.Create(Self);
  FDefaultTextSettings.Assign(FTextSettings);
  FOldTextSettings := TTextSettings.Create(Self);
  FOldTextSettings.Assign(FTextSettings);
  FTextSettings.OnChanged := TextSettingsOnChange;
  FToastBoxPosition := TPosition.Create(TPointF.Create(0, 0));
  FToastBoxPosition.OnChange := ToastBoxPositionOnChange;
  FTextScale := TPosition.Create(TPointF.Create(DefaultTextScale, DefaultTextScale));
  FTextScale.OnChange := TextScaleOnChange;
  FToastBoxMargins := TBounds.Create(TRectF.Create(DefaultToastBoxMargin, DefaultToastBoxMargin, DefaultToastBoxMargin,
    DefaultToastBoxMargin));
  FToastBoxMargins.OnChange := ToastBoxMarginsOnChange;
  FToastBoxWidth := 100;
  FToastBoxHeight := 36;
  FStyledSettings := DefaultToastStyledSettings;
  FHorzTextAlign := TTextAlign.Center;
  FVertTextAlign := TTextAlign.Center;
  FTextWordWrap := True;
  FTextTrimming := TTextTrimming.None;
  FToastBoxStrokeDash := TStrokeDash.Solid;
  FToastBoxStrokeThickness := 1;
  FToastBoxStrokeColor := TAlphaColorRec.Black;
  FToastBoxAlign := TAlignLayout.None;
  // Android Like Toast
  FTextSettings.FontColor := TAlphaColorRec.White;
  FTextColor := FTextSettings.FontColor;
  FToastBoxColor := DefaultToastBoxColor;

  if Assigned(FRectangle) then
  begin
    FRectangle.Position.Assign(FToastBoxPosition);
    FRectangle.Width := FToastBoxWidth;
    FRectangle.Height := FToastBoxHeight;
  end;

  if Assigned(FTextField) then
  begin
    FTextField.Scale := FTextScale;
  end;

  if not(csDesigning in ComponentState) and Assigned(FTextField) then
  begin
    FDefaultTextSettings.Assign(FTextField.DefaultTextSettings);
    FOldTextSettings.Assign(FTextField.TextSettings);
    FTextSettings.Assign(FTextField.TextSettings);
  end;
  UpdateTextSettings;
end;

destructor TFlyToast.Destroy;
begin
  FreeAndNil(FTextFont);
  FreeAndNil(FTextSettings);
  FreeAndNil(FOldTextSettings);
  FreeAndNil(FDefaultTextSettings);
  FreeAndNil(FToastBoxPosition);
  FreeAndNil(FToastBoxMargins);
  FreeAndNil(FToastBoxPosition);
  FreeAndNil(FTextScale);
  inherited Destroy;
end;

function TFlyToast.ReInitToastText: String;
begin
  Result := FToastText;
end;

procedure TFlyToast.ReInitTextSetting(const IsMultiText: Boolean);
begin
  inherited;

  FTextField.Width := FToastBoxWidth;
  FTextField.Height := FToastBoxHeight;

  if IsMultiText then
  begin
{$IF Defined(IOS) OR Defined(ANDROID)}
{$ELSE}
    if FHorzTextAlign <> TTextAlign.Trailing then
    begin
      FTextField.Margins.Left := FTextHorizontalMargin + ToastTextHorizontalShift + ToastMultiTextHorizontalShift;
    end
    else if FHorzTextAlign = TTextAlign.Trailing then
    begin
      if FTextHorizontalMargin >= ToastMultiTextHorizontalShift then
      begin
        FTextField.Margins.Left := FTextHorizontalMargin - ToastTextHorizontalShift - ToastMultiTextHorizontalShift;
      end;
    end;
    if FHorzTextAlign <> TTextAlign.Trailing then
    begin
      if FTextHorizontalMargin >= ToastMultiTextHorizontalShift then
      begin
        FTextField.Margins.Right := FTextHorizontalMargin - ToastTextHorizontalShift - ToastMultiTextHorizontalShift;
      end;
    end
    else if FHorzTextAlign = TTextAlign.Trailing then
    begin
      FTextField.Margins.Right := FTextHorizontalMargin + ToastTextHorizontalShift + ToastMultiTextHorizontalShift;
    end;
{$ENDIF}
  end;
end;

procedure TFlyToast.ReInitRectangleSetting;
begin
  inherited;
  if not Assigned(FRectangle) then
    Exit;
  if not Assigned(FTextField) then
    Exit;
  if not Assigned(FRectangle.Canvas) then
    Exit;
  if not Assigned(FTextField.Canvas) then
    Exit;
  FRectangle.Align := FToastBoxAlign;
  FRectangle.Fill.Color := FToastBoxColor;
//  FRectangle.StrokeDash := FToastBoxStrokeDash;
  FRectangle.Stroke.Color := FToastBoxStrokeColor;
  FRectangle.Position.Assign(FToastBoxPosition);
  FRectangle.Margins := FToastBoxMargins;
  FRectangle.Width := FToastBoxWidth;
  FRectangle.Height := FToastBoxHeight;
  try
    //wn
//    FRectangle.StrokeThickness := FToastBoxStrokeThickness;
    FRectangle.Stroke.Thickness := FToastBoxStrokeThickness;
  except
  end;
end;

procedure TFlyToast.SetName(const NewName: TComponentName);
var
  ChangeText: Boolean;
begin
  ChangeText := not(csLoading in ComponentState) and (Name = ToastText) and
    ((not Assigned(Owner)) or not(Owner is TComponent) or not(csLoading in TComponent(Owner).ComponentState));
  inherited SetName(NewName);
  if ChangeText then
    ToastText := NewName;
end;

function TFlyToast.GetToastText: String;
begin
  Result := FToastText;
end;

function TFlyToast.IsToastTextStored: Boolean;
begin
  Result := (ToastText <> '');
end;

function TFlyToast.IsPositionStored: Boolean;
begin
  Result := not(FToastBoxAlign in [TAlignLayout.Client, TAlignLayout.Contents, TAlignLayout.Center,
    TAlignLayout.Fit]);
end;

procedure TFlyToast.SetToastText(const Value: String);
begin
  if FToastText <> Value then
  begin
    FToastText := Value;
    FInited := False;
  end;
end;

procedure TFlyToast.SetTextWordWrap(const Value: Boolean);
begin;
  if FTextWordWrap <> Value then
  begin
    FTextWordWrap := Value;
    FInited := False;
  end;
  if Assigned(FTextSettings) and (FTextSettings.WordWrap <> Value) then
  begin
    FTextSettings.WordWrap := Value;
    DoTextSettingsChanged;
  end;
end;

procedure TFlyToast.SetToastBoxHeight(const Value: Single);
begin
  if FToastBoxHeight <> Value then
  begin
    FToastBoxHeight := Value;
    FInited := False;
  end;
end;

procedure TFlyToast.SetToastBoxWidth(const Value: Single);
begin
  if FToastBoxWidth <> Value then
  begin
    FToastBoxWidth := Value;
    FInited := False;
  end;
end;

procedure TFlyToast.SetTextColor(const Value: TAlphaColor);
begin
  if FTextColor <> Value then
  begin
    FTextColor := Value;
    FInited := False;
  end;
  if Assigned(FTextSettings) and (FTextSettings.FontColor <> Value) then
  begin
    FTextSettings.FontColor := Value;
    DoTextSettingsChanged;
  end;
end;

procedure TFlyToast.SetToastBoxColor(const Value: TAlphaColor);
begin
  FToastBoxColor := Value;
  if Assigned(FRectangle) then
  begin
    FRectangle.Fill.Color := FToastBoxColor;
  end;
end;

procedure TFlyToast.SetToastBoxStrokeDash(const Value: TStrokeDash);
begin
  FToastBoxStrokeDash := Value;
  if Assigned(FRectangle) then
  begin
    FRectangle.Stroke.Dash := FToastBoxStrokeDash;
  end;
end;

procedure TFlyToast.SetHorzTextAlign(const Value: TTextAlign);
begin
  if FHorzTextAlign <> Value then
  begin
    FHorzTextAlign := Value;
    FInited := False;
  end;
  if Assigned(FTextSettings) and (FTextSettings.HorzAlign <> Value) then
  begin
    FTextSettings.HorzAlign := Value;
    DoTextSettingsChanged;
  end;
end;

procedure TFlyToast.SetVertTextAlign(const Value: TTextAlign);
begin
  if FVertTextAlign <> Value then
  begin
    FVertTextAlign := Value;
    FInited := False;
  end;
  if Assigned(FTextSettings) and (FTextSettings.VertAlign <> Value) then
  begin
    FTextSettings.VertAlign := Value;
    DoTextSettingsChanged;
  end;
end;

procedure TFlyToast.SetTextTrimming(const Value: TTextTrimming);
begin
  if FTextTrimming <> Value then
  begin
    FTextTrimming := Value;
    FInited := False;
  end;
  if Assigned(FTextSettings) and (FTextSettings.Trimming <> Value) then
  begin
    FTextSettings.Trimming := Value;
    DoTextSettingsChanged;
  end;
end;

procedure TFlyToast.SetToastBoxAlign(const Value: TAlignLayout);
begin
  FToastBoxAlign := Value;
  if Assigned(FRectangle) then
  begin
    FRectangle.Align := FToastBoxAlign;
    if FRectangle.Align = TAlignLayout.None then
    begin
      FInited := False;
    end;
  end;
end;

procedure TFlyToast.SetToastBoxMargins(const Value: TBounds);
begin
  FToastBoxMargins.Assign(Value);
end;

procedure TFlyToast.SetToastBoxStrokeColor(const Value: TAlphaColor);
begin
  FToastBoxStrokeColor := Value;
end;

procedure TFlyToast.SetToastBoxStrokeThickness(const Value: Single);
begin
  FToastBoxStrokeThickness := Value;
  if Assigned(FRectangle) then
  begin
    FRectangle.Stroke.Thickness := FToastBoxStrokeThickness;
  end;
end;

procedure TFlyToast.SetTextScale(const Value: TPosition);
begin
  FTextScale.Assign(Value);
end;

procedure TFlyToast.SetToastBoxPosition(const Value: TPosition);
begin
  FToastBoxPosition.Assign(Value);
end;

procedure TFlyToast.SetTextFont(const Value: TFont);
begin
  if not(((FTextSettings.Font = nil) and (Value = nil)) or
    ((Assigned(FTextSettings.Font) and FTextSettings.Font.Equals(Value)))) then
  begin
    FTextSettings.Font.Assign(Value);
  end;
  if not FTextFont.Equals(Value) then
  begin
    FTextFont.Assign(Value);
  end;
end;

procedure TFlyToast.ToastBoxMarginsOnChange(Sender: TObject);
begin
  FInited := False;
  if Assigned(FRectangle) then
  begin
    FRectangle.Margins.Assign(FToastBoxMargins);
  end;
end;

procedure TFlyToast.ToastBoxPositionOnChange(Sender: TObject);
begin
  FInited := False;
  if Assigned(FRectangle) then
  begin
    FRectangle.Position.Assign(FToastBoxPosition);
  end;
end;

procedure TFlyToast.TextScaleOnChange(Sender: TObject);
begin
  FInited := False;
  if Assigned(FTextField) then
  begin
    FTextField.Scale.Assign(FTextScale);
  end;
end;

procedure TFlyToast.TextFontOnChange(Sender: TObject);
begin
  FInited := False;
  if Assigned(FTextSettings) then
  begin
    FTextSettings.Font.Assign(FTextFont);
  end;
  DoTextSettingsChanged;
end;

procedure TFlyToast.TextSettingsOnChange(Sender: TObject);
begin
  DoTextSettingsChanged;
end;

procedure TFlyToast.SetStyledSettings(const Value: TStyledSettings);
begin
  if FStyledSettings <> Value then
  begin
    if TStyledSetting.Family in Value then
    begin
      FTextFont.Family := FDefaultTextSettings.Font.Family;
    end;
    if TStyledSetting.Size in Value then
    begin
      FTextFont.Size := FDefaultTextSettings.Font.Size;
    end;
    if TStyledSetting.Style in Value then
    begin
      FTextFont.Style := FDefaultTextSettings.Font.Style;
    end;
    if TStyledSetting.FontColor in Value then
    begin
      FTextColor := FDefaultTextSettings.FontColor;
    end;
    if TStyledSetting.Other in Value then
    begin
      FVertTextAlign := FDefaultTextSettings.VertAlign;
      FHorzTextAlign := FDefaultTextSettings.HorzAlign;
      FTextTrimming := FDefaultTextSettings.Trimming;
      FTextWordWrap := FDefaultTextSettings.WordWrap;
    end;
    UpdateTextSettings;
    FStyledSettings := Value;
    FInited := False;
  end;
end;

procedure TFlyToast.UpdateTextSettings;
begin
  FTextSettings.Font.Assign(FTextFont);
  FTextSettings.FontColor := FTextColor;
  FTextSettings.VertAlign := FVertTextAlign;
  FTextSettings.HorzAlign := FHorzTextAlign;
  FTextSettings.Trimming := FTextTrimming;
  FTextSettings.WordWrap := FTextWordWrap;
  FOldTextSettings.Assign(FTextSettings);
end;

procedure TFlyToast.DoTextSettingsChanged;
begin
  inherited;
  if Assigned(FTextSettings) then
  begin
    try
      if csDesigning in ComponentState then
      begin
        // If the user changed the value of the property, and it differs from the default,
        // then delete the corresponding value from StyledSettings
        if (not SameText(FOldTextSettings.Font.Family, FTextSettings.Font.Family)) and
          (not SameText(FDefaultTextSettings.Font.Family, FTextSettings.Font.Family)) then
          FStyledSettings := FStyledSettings - [TStyledSetting.Family];

        if (not SameValue(FOldTextSettings.Font.Size, FTextSettings.Font.Size, TEpsilon.FontSize)) and
          (not SameValue(FDefaultTextSettings.Font.Size, FTextSettings.Font.Size, TEpsilon.FontSize)) then
          FStyledSettings := FStyledSettings - [TStyledSetting.Size];

        if (FOldTextSettings.Font.Style <> FTextSettings.Font.Style) and
          (FDefaultTextSettings.Font.Style <> FTextSettings.Font.Style) then
          FStyledSettings := FStyledSettings - [TStyledSetting.Style];

        if (FOldTextSettings.FontColor <> FTextSettings.FontColor) and
          (FDefaultTextSettings.FontColor <> FTextSettings.FontColor) then
          FStyledSettings := FStyledSettings - [TStyledSetting.FontColor];

        if ((FOldTextSettings.HorzAlign <> FTextSettings.HorzAlign) and
          (FDefaultTextSettings.HorzAlign <> FTextSettings.HorzAlign)) or
          ((FOldTextSettings.VertAlign <> FTextSettings.VertAlign) and
          (FDefaultTextSettings.VertAlign <> FTextSettings.VertAlign)) or
          ((FOldTextSettings.Trimming <> FTextSettings.Trimming) and
          (FDefaultTextSettings.Trimming <> FTextSettings.Trimming)) or
          ((FOldTextSettings.WordWrap <> FTextSettings.WordWrap) and
          (FDefaultTextSettings.WordWrap <> FTextSettings.WordWrap)) then
          FStyledSettings := FStyledSettings - [TStyledSetting.Other];
      end;
      // UpdateLastText;
    finally
      FOldTextSettings.Assign(FTextSettings);
    end;
  end;
  if not Assigned(FTextField) then
    Exit;
  FInited := False;
  if not Assigned(FTextField.Canvas) then
    Exit;
  FTextField.TextSettings := FTextSettings;
  if TStyledSetting.Family in FStyledSettings then
  begin
    FTextField.Canvas.Font.Family := FDefaultTextSettings.Font.Family;
  end
  else
  begin
    FTextField.Canvas.Font.Family := FTextFont.Family;
  end;
  FTextField.Font.Family := FTextField.Canvas.Font.Family;

  if TStyledSetting.Size in FStyledSettings then
  begin
    FTextField.Canvas.Font.Size := FDefaultTextSettings.Font.Size;
  end
  else
  begin
    FTextField.Canvas.Font.Size := FTextFont.Size;
  end;
  FTextField.Font.Size := FTextField.Canvas.Font.Size;

  if TStyledSetting.Style in FStyledSettings then
  begin
    FTextField.Canvas.Font.Style := FDefaultTextSettings.Font.Style;
  end
  else
  begin
    FTextField.Canvas.Font.Style := FTextFont.Style;
  end;
  FTextField.Font.Style := FTextField.Canvas.Font.Style;

  if TStyledSetting.FontColor in FStyledSettings then
  begin
    FTextField.FontColor := FDefaultTextSettings.FontColor;
  end
  else
  begin
    FTextField.FontColor := FTextColor;
  end;

  if TStyledSetting.Other in FStyledSettings then
  begin
    FTextField.TextAlign := FDefaultTextSettings.HorzAlign;
    FTextField.VertTextAlign := FDefaultTextSettings.VertAlign;
    FTextField.Trimming := FDefaultTextSettings.Trimming;
    FTextField.WordWrap := FDefaultTextSettings.WordWrap;
  end
  else
  begin
    FTextField.TextAlign := FHorzTextAlign;
    FTextField.VertTextAlign := FVertTextAlign;
    FTextField.Trimming := FTextTrimming;
    FTextField.WordWrap := FTextWordWrap;
  end;
  FTextField.StyledSettings := FStyledSettings;
end;

function TFlyToast.StyledSettingsStored: Boolean;
begin
  Result := StyledSettings <> DefaultToastStyledSettings;
end;

end.
