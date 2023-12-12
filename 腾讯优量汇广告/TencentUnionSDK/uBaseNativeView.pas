unit uBaseNativeView;

interface

uses
  Classes,
  FMX.Forms,
  Types,
  FMX.Types,
  SysUtils,
  UITypes,
  FMX.Objects,
  FMX.Graphics,
  System.Messaging,

//  uBaseViewController,
//  uOrangeUISmartSDKDeployment,

  {$IFDEF ANDROID}
  FMX.ZOrder.Android,
  Androidapi.Helpers,
  FMX.Platform.Android,
  FMX.Helpers.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.App,
  Androidapi.JNI.Widget,
  Androidapi.NativeActivity,
  Androidapi.JNI.Os,

  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.GraphicsContentViewText,


  Androidapi.JNI.Webkit,
  Androidapi.JNI,
  Androidapi.JNI.Util,
  Androidapi.Log,



//  uAndroidViewController,
  {$ENDIF ANDROID}




  {$IFDEF IOS}
  iOSapi.UIKit,
  FMX.ZOrder.iOS,
  FMX.Platform.iOS,
  Macapi.Helpers,
  {$ENDIF}



  {$IFDEF MSWINDOWS}
  FMX.ZOrder.Win,
  FMX.Platform.Win,
  {$ENDIF}


//  {$IFDEF _MACOS}
//  FMX.Platform.Mac,
//  {$ENDIF}

//  uSDKVersion,


  FMX.Controls;


type
  //为了控件能跨平台
  {$IFDEF ANDROID}
  TNativeView=JView;
  TZOrderManager=TAndroidZOrderManager;
  {$ENDIF}


  {$IFDEF IOS}
  TNativeView=UIView;
  TZOrderManager=TIOSZOrderManager;
  {$ENDIF}


  {$IFDEF MSWINDOWS}
  TNativeView=TControl;
  TZOrderManager=TWinZOrderManager;
  {$ENDIF}


  {$IFDEF _MACOS}
  //不支持
  TNativeView=TControl;
  TZOrderManager=TObject;
  {$ENDIF}



  TSkinNativeView = class(TRectangle)
  private
    function GetZOrderManager: TZOrderManager;
  protected
    /// <summary>Update map view when control changes</summary>
    procedure DoAbsoluteChanged; override;
    /// <summary>Update map view when parent changes</summary>
    procedure ParentChanged; override;
    /// <summary>Paint the control. Used in design time and for taking screenshots.</summary>
    procedure ChangeOrder; override;
    procedure AncestorVisibleChanged(const Visible: Boolean); override;
//    procedure Notification(AComponent: TComponent;Operation: TOperation); override;

    /// <summary>Called when position changes</summary>
    procedure Move; override;
    /// <summary>Called when the control is being shown</summary>
    procedure Show; override;
    /// <summary>Called when the control is being hidden</summary>
    procedure Hide; override;
    /// <summary>Called after the size of the control had been changed</summary>
    procedure Resize; override;
  public
    {$IFDEF ANDROID}
    FParentViewContainer: JViewGroup;
    FChildrenContainer: JViewGroup;
    {$ENDIF}
    //创建原生控件
    function CreateNativeView: TNativeView; virtual;abstract;
  public
    procedure doNativeShow;virtual;
    procedure doNativeHide;
    procedure UpdateContentFromControl;
    property ZOrderManager: TZOrderManager read GetZOrderManager;
  public
    //原生控件
    FNativeControl: TNativeView;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Action;
    property Align default TAlignLayout.{$IF CompilerVersion >= 35.0}None{$ELSE}alNone{$IFEND};
    property Anchors;
//    property AutoTranslate default True;
//    property Cancel: Boolean read FCancel write FCancel default False;
    property CanFocus;// default True;
    property CanParentFocus;
//    property ControlType;
    property ClipChildren;// default False;
    property ClipParent;// default False;
    property Cursor default crDefault;
//    property Default: Boolean read FDefault write FDefault default False;
//    property DesignVisible default True;
//    property DisableFocusEffect;
    property DragMode default TDragMode.dmManual;
//    property EnableDragHighlight default True;
    property Enabled default True;
//    property Font;
//    property StyledSettings;
    property Height;
    property Hint;
//    property HelpContext;
//    property HelpKeyword;
//    property HelpType;
    property HitTest default True;
//    property IsPressed default False;
    property Locked default False;
    property Padding;
//    property ModalResult default mrNone;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property Scale;
    property Size;
//    {$ENDIF}
//    property RepeatClick default False;
    property RotationAngle;
    property RotationCenter;
//    property Scale;
    property ShowHint;
//    property StyleLookup;
    property TabOrder;
//    property Text;
//    property Trimming;
//    property TextAlign default TTextAlign.taCenter;
    property TouchTargetExpansion;
    property Visible default True;
    property Width;
//    pro
//    property WordWrap default False;
//    property OnApplyStyleLookup;
//    property OnGestureLongTap:TOnGestureLongTap read FOnGestureLongTap write FOnGestureLongTap;

    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    property OnKeyDown;
    property OnKeyUp;
    property OnCanFocus;
    property OnClick;
    property OnDblClick;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnPainting;
    property OnPaint;
    property OnResize;
  end;


  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or pidiOSSimulator or pidiOSDevice32 or pidiOSDevice64 or pidAndroid)]
  TSkinNativeTextView=class(TSkinNativeView)
  private
    FText: String;
    FBackgroundColor: TAlphaColor;
    FTextColor: TAlphaColor;
    FTextSize: Double;
    FTextAlignment: Integer;
    procedure SetText(const Value: String);
    procedure SetBackgroundColor(const Value: TAlphaColor);
    procedure SetTextColor(const Value: TAlphaColor);
    procedure SetTextSize(const Value: Double);
    procedure SetTextAlignment(const Value: Integer);
  protected
    //创建原生控件
    function CreateNativeView: TNativeView; override;
  public
  {$IFDEF ANDROID}
    FJTextView:JTextView;
  {$ENDIF ANDROID}
    constructor Create(AOwner:TComponent);override;
  published
    property TextAlignment:Integer read FTextAlignment write SetTextAlignment;
    property Text:String read FText write SetText;
    property TextColor:TAlphaColor read FTextColor write SetTextColor;
    property TextSize:Double read FTextSize write SetTextSize;
    property BackgroundColor:TAlphaColor read FBackgroundColor write SetBackgroundColor;
  end;



procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('OrangeFreeControl',[TSkinNativeTextView]);
end;


procedure TSkinNativeView.AncestorVisibleChanged(const Visible: Boolean);
begin
  inherited;
  UpdateContentFromControl;

end;

procedure TSkinNativeView.ChangeOrder;
begin
  inherited;
  UpdateContentFromControl;

end;

constructor TSkinNativeView.Create(AOwner: TComponent);
    {$IFDEF ANDROID}
var
  LayoutParams: JRelativeLayout_LayoutParams;
    {$ENDIF}
begin
  inherited Create(AOwner);

  FMX.Types.Log.d('OrangeUI TSkinNativeView.Create begin');

  FNativeControl:=CreateNativeView;

  Self.Fill.Kind:=TBrushKind.None;
  Self.Stroke.Kind:=TBrushKind.None;

  {$IFDEF ANDROID}
  FParentViewContainer := TJRelativeLayout.JavaClass.init(TAndroidHelper.Context);
  FChildrenContainer := TJRelativeLayout.JavaClass.init(TAndroidHelper.Context);
  LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
  FParentViewContainer.addView(FNativeControl, LayoutParams);
  LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
  FParentViewContainer.addView(FChildrenContainer, LayoutParams);
  {$ENDIF}

  FMX.Types.Log.d('OrangeUI TSkinNativeView.Create end');
end;

destructor TSkinNativeView.Destroy;
begin
  inherited;
end;

procedure TSkinNativeView.DoAbsoluteChanged;
begin
  inherited;
  UpdateContentFromControl;
end;

procedure TSkinNativeView.doNativeHide;
begin
    {$IFDEF ANDROID}
  if FParentViewContainer<>nil then
  begin
    FParentViewContainer.setVisibility(TJView.JavaClass.INVISIBLE);
  end;
    {$ENDIF}
end;

procedure TSkinNativeView.doNativeShow;
begin
    {$IFDEF ANDROID}
  if FParentViewContainer<>nil then
  begin
    FParentViewContainer.setVisibility(TJView.JavaClass.VISIBLE);
  end;
    {$ENDIF}
end;

function TSkinNativeView.GetZOrderManager: TZOrderManager;
var
  Form: TCommonCustomForm;
begin
  Result := nil;

  if not (csDesigning in Self.ComponentState) then
  begin
    {$IFNDEF _MACOS}
        //非MacOS系统下
        if (Self.Root <> nil) and (Self.Root.GetObject is TCommonCustomForm) then
        begin
          Form := TCommonCustomForm(Self.Root);
          Result := WindowHandleToPlatform(Form.Handle).ZOrderManager;
        end;
    {$ELSE}
        //苹果电脑系统不支持
    {$ENDIF}
  end;
end;

procedure TSkinNativeView.Hide;
begin
  inherited;
  UpdateContentFromControl;

end;

procedure TSkinNativeView.Move;
begin
  inherited;
  UpdateContentFromControl;

end;

procedure TSkinNativeView.ParentChanged;
begin
  inherited;
  UpdateContentFromControl;

end;

procedure TSkinNativeView.Resize;
begin
  inherited;
  UpdateContentFromControl;

end;

procedure TSkinNativeView.Show;
begin
  inherited;
  UpdateContentFromControl;

end;

procedure TSkinNativeView.UpdateContentFromControl;
begin
  if (FNativeControl <> nil) and (ZOrderManager <> nil) then
  begin
    {$IFDEF ANDROID}
    if FParentViewContainer<>nil then
    begin
      ZOrderManager.AddOrSetLink(Self, FParentViewContainer, FChildrenContainer);
      ZOrderManager.UpdateOrderAndBounds(Self);
    end;
    {$ENDIF ANDROID}
  end
  else
  begin
    //不能用Hide,会StackOverflow
    doNativeHide;
  end;
end;

{ TSkinNativeTextView }

constructor TSkinNativeTextView.Create(AOwner: TComponent);
begin
  inherited;

  FTextColor:=TAlphaColorRec.Black;
  FTextSize:=12;

end;

function TSkinNativeTextView.CreateNativeView: TNativeView;
//  {$IFDEF ANDROID}
//var
//  LStr:JString;
//  {$ENDIF}
begin
    {$IFDEF ANDROID}
    FJTextView:=TJTextView.JavaClass.init(TAndroidHelper.Context);
    Result:=FJTextView;

//    FJTextView.setTextAlignment();
//    LStr := TAndroidHelper.StringToJString('原生文本');
//    FJTextView.setText(LStr.subSequence(0, LStr.length));
//    FJTextView.setTextSize();
//    FJTextView.setText();
    {$ENDIF ANDROID}

end;

procedure TSkinNativeTextView.SetBackgroundColor(const Value: TAlphaColor);
var
  ABackgroundColor: Integer;
begin
  FBackgroundColor := Value;

  {$IFDEF ANDROID}
  if FJTextView<>nil then
  begin
    ABackgroundColor := TAndroidHelper.AlphaColorToJColor(FBackgroundColor);
    FJTextView.setBackgroundColor(ABackgroundColor);
  end;
  {$ENDIF}

end;

procedure TSkinNativeTextView.SetText(const Value: String);
  {$IFDEF ANDROID}
var
  LStr:JString;
  {$ENDIF}
begin
  FText := Value;

  {$IFDEF ANDROID}
  if FJTextView<>nil then
  begin
    LStr := TAndroidHelper.StringToJString(Value);
    FJTextView.setText(LStr.subSequence(0, LStr.length));
//    FJTextView.setTextColor();
  end;
  {$ENDIF}

end;

procedure TSkinNativeTextView.SetTextAlignment(const Value: Integer);
begin
  FTextAlignment := Value;

  {$IFDEF ANDROID}
  if FJTextView<>nil then
  begin
    FJTextView.setTextAlignment(FTextAlignment);
  end;
  {$ENDIF}
end;

procedure TSkinNativeTextView.SetTextColor(const Value: TAlphaColor);
var
  ATextColor: Integer;
begin
  FTextColor := Value;
  {$IFDEF ANDROID}
  if FJTextView<>nil then
  begin
    ATextColor := TAndroidHelper.AlphaColorToJColor(FTextColor);
    FJTextView.setTextColor(ATextColor);
  end;
  {$ENDIF}
end;

procedure TSkinNativeTextView.SetTextSize(const Value: Double);
begin
  FTextSize := Value;
  {$IFDEF ANDROID}
  if FJTextView<>nil then
  begin
    FJTextView.setTextSize(FTextSize);
  end;
  {$ENDIF}
end;

end.

