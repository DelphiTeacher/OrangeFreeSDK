{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.StdCtrls;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Types, System.Rtti, System.UITypes, System.Messaging, System.Math, System.ImageList,
  FMX.ActnList, FMX.Types, FMX.Objects, FMX.Ani, FMX.StdActns, FMX.Controls, FMX.Graphics, FMX.Controls.Presentation,
  FMX.Controls.Model, FMX.ImgList, FMX.AcceleratorKey;

type

{ TPresentedTextControl }

  /// <summary>Base class for all presented text controls such as
  /// TLabel.</summary>
  TPresentedTextControl = class(TPresentedControl, ITextSettings, ICaption, IAcceleratorKeyReceiver)
  private
    FTextSettingsInfo: TTextSettingsInfo;
    FTextObject: TControl;
    FITextSettings: ITextSettings;
    FObjectState: IObjectState;
    FText: string;
    FIsChanging: Boolean;
    FPrefixStyle: TPrefixStyle;
    FAcceleratorKey: Char;
    FAcceleratorKeyIndex: Integer;
    function TextStored: Boolean;
    function GetFont: TFont;
    function GetText: string;
    procedure SetFont(const Value: TFont);
    function GetTextAlign: TTextAlign;
    procedure SetTextAlign(const Value: TTextAlign);
    function GetVertTextAlign: TTextAlign;
    procedure SetVertTextAlign(const Value: TTextAlign);
    function GetWordWrap: Boolean;
    procedure SetWordWrap(const Value: Boolean);
    function GetFontColor: TAlphaColor;
    procedure SetFontColor(const Value: TAlphaColor);
    function GetTrimming: TTextTrimming;
    procedure SetTrimming(const Value: TTextTrimming);
    procedure SetPrefixStyle(const Value: TPrefixStyle);
    { ITextSettings }
    function GetDefaultTextSettings: TTextSettings;
    function GetTextSettings: TTextSettings;
    function GetStyledSettings: TStyledSettings;
    function GetResultingTextSettings: TTextSettings;
  protected
    /// <summary>Overrides the TControl.DoRootChanging to register/unregister the control in the form as a
    /// IAcceleratorKeyReceiver if the control has an accelerator key.</summary>
    procedure DoRootChanging(const NewRoot: IRoot); override;
    /// <summary>This function is invoked to filter the text that is going to be displayed. This function doesn't modify the string
    /// stored by the control used as Text property.</summary>
    function DoFilterPresentedText(const AText: string): string; virtual;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoStyleChanged; override;
    procedure SetText(const Value: string); virtual;
    /// <summary>Set new value to text property without calling DoTextChanged.</summary>
    procedure SetTextInternal(const Value: string); virtual;
    procedure SetName(const Value: TComponentName); override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    procedure Loaded; override;
    /// <summary>Retrieves the resource object linked to the style of the current TextObject.</summary>
    function FindTextObject: TFmxObject; virtual;
    /// <summary>Copy text releated properties to TextObject.</summary>
    procedure UpdateTextObject(const TextControl: TControl; const Str: string);
    /// <summary>Link to object in style that actually displays control's data.</summary>
    property TextObject: TControl read FTextObject;
    /// <summary>Called when text is changed.</summary>
    procedure DoTextChanged; virtual;
    procedure DoEndUpdate; override;
    /// <summary>Return TextObject bounds using current text alignment values.</summary>
    function CalcTextObjectSize(const MaxWidth: Single; var Size: TSizeF): Boolean;
    { ITextSettings }
    procedure SetTextSettings(const Value: TTextSettings); virtual;
    procedure SetStyledSettings(const Value: TStyledSettings); virtual;
    /// <summary>Updates the representation of the text on the control.</summary>
    procedure DoChanged; virtual;
    /// <summary>Retrieves whether any of the default values of font properties that are stored in the StyledSettings property is changed</summary>
    function StyledSettingsStored: Boolean; virtual;
    /// <summary>Use to create new instance of TextSettings object</summary>
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; virtual;
    { IAcceleratorKeyReceiver }
    /// <summary>Implements IAcceleratorKeyReceiver.TriggerAcceleratorKey by setting focus to this control.</summary>
    procedure TriggerAcceleratorKey; virtual;
    /// <summary>Implements IAcceleratorKeyReceiver.CanTriggerAcceleratorKey by returning True if this control and all
    /// of its parent controls are visible.</summary>
    function CanTriggerAcceleratorKey: Boolean; virtual;
    /// <summary>Implements IAcceleratorKeyReceiver.GetAcceleratorChar by returning the value stored in FAcceleratorKey.</summary>
    function GetAcceleratorChar: Char;
    /// <summary>Implements IAcceleratorKeyReceiver.GetAcceleratorCharIndex by returning the value stored in
    /// FAcceleratorKeyIndex. This indicates the position within the text string of the accelerator character.</summary>
    function GetAcceleratorCharIndex: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    function ToString: string; override;
    /// <summary>Specifies the text that will be rendered over the surface of this control</summary>
    property Text: string read GetText write SetText stored TextStored;
    /// <summary>Stores a TTextSettings type object keeping the default values of the text representation properties</summary>
    property DefaultTextSettings: TTextSettings read GetDefaultTextSettings;
    /// <summary>Stores a TTextSettings type object, which handles the text representation properties to be used for drawing the text in this control</summary>
    property TextSettings: TTextSettings read GetTextSettings write SetTextSettings;
    /// <summary>Defines the values of the styled text representation properties</summary>
    property StyledSettings: TStyledSettings read GetStyledSettings write SetStyledSettings stored StyledSettingsStored nodefault;
    /// <summary>Returns a TTextSettings object that declares the text control representation properties</summary>
    property ResultingTextSettings: TTextSettings read GetResultingTextSettings;
    /// <summary>Calls DoChanged when any of the styled text representation properties of the control is changed.</summary>
    procedure Change;
    /// <summary>Specifies the font to use when rendering the text</summary>
    property Font: TFont read GetFont write SetFont;
    /// <summary>Specifies the font color of the text</summary>
    property FontColor: TAlphaColor read GetFontColor write SetFontColor default TAlphaColorRec.Black;
    /// <summary>Specifies how the text will be displayed in terms of vertical alignment.</summary>
    property VertTextAlign: TTextAlign read GetVertTextAlign write SetVertTextAlign default TTextAlign.Center;
    /// <summary>Specifies how the text will be displayed in terms of horizontal alignment.</summary>
    property TextAlign: TTextAlign read GetTextAlign write SetTextAlign default TTextAlign.Leading;
    /// <summary>Specifies whether the text inside the control wraps when it is longer than the width of the control</summary>
    property WordWrap: Boolean read GetWordWrap write SetWordWrap default False;
    /// <summary>Specifies the behavior of the text, when it overflows the area for drawing the text.</summary>
    property Trimming: TTextTrimming read GetTrimming write SetTrimming default TTextTrimming.None;
    /// <summary> Determine the way portraying a single character "&amp;"</summary>
    property PrefixStyle: TPrefixStyle read FPrefixStyle write SetPrefixStyle default TPrefixStyle.HidePrefix;
  end;

{ TPanel }

  TPanel = class(TPresentedControl)
  protected
    function GetDefaultSize: TSizeF; override;
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Action;
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property TabOrder;
    property TabStop;
    property ParentShowHint;
    property ShowHint;
    property OnApplyStyleLookup;
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    property OnKeyDown;
    property OnKeyUp;
    property OnCanFocus;
    property OnEnter;
    property OnExit;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnPainting;
    property OnPaint;
    property OnResize;
    property OnResized;
  end;

{ TCalloutPanel }

  TCalloutPanel = class(TPanel)
  public const
    DefaultCalloutPosition = TCalloutPosition.Top;
    DefaultCalloutWidth = 23;
    DefaultCalloutLength = 11;
  private
    FCalloutRect: TCalloutRectangle;
    FCalloutLength: Single;
    FCalloutWidth: Single;
    FCalloutPosition: TCalloutPosition;
    FCalloutOffset: Single;
    FSavedPadding: TRectF;
    FUpdatingPadding: Boolean;
    procedure SetCalloutLength(const Value: Single);
    procedure SetCalloutPosition(const Value: TCalloutPosition);
    procedure SetCalloutWidth(const Value: Single);
    procedure SetCalloutOffset(const Value: Single);
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    /// <summary>Updates values: <c>CalloutLength</c>, <c>CalloutWidth</c>, <c>CalloutPosition</c> and
    /// <c>CalloutOffset</c> of <c>CalloutRect</c> object in style</summary>
    procedure UpdateCallout;
    /// <summary>Updates padding based on value of <c>CalloutLength</c> and <c>CalloutPosition</c></summary>
    procedure UpdatePadding;
    /// <summary>Saves current values of padding, which are not equaled to <c>CalloutLength</c></summary>
    procedure SavePadding;
    /// <summary>Restores previous saved value of padding</summary>
    procedure RestorePadding;
    procedure PaddingChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    /// <summary>Access to style object <c>TCalloutRectangle</c></summary>
    property CalloutRectangle: TCalloutRectangle read FCalloutRect write FCalloutRect;
  published
    property CalloutWidth: Single read FCalloutWidth write SetCalloutWidth;
    property CalloutLength: Single read FCalloutLength write SetCalloutLength;
    property CalloutPosition: TCalloutPosition read FCalloutPosition write SetCalloutPosition
      default DefaultCalloutPosition;
    property CalloutOffset: Single read FCalloutOffset write SetCalloutOffset;
  end;

{ TLabel }

  TLabel = class(TPresentedTextControl)
  private
    FAutoSize: Boolean;
    FIsPressed: Boolean;
    FInFitSize: Boolean;
    FNeedFitSize: Boolean;
    [Weak] FFocusControl: TControl;
    procedure SetAutoSize(const Value: Boolean);
    procedure FitSize;
    procedure SetFocusControl(const Value: TControl);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DefineProperties(Filer: TFiler); override;
    function GetDefaultSize: TSizeF; override;
    procedure Resize; override;
    procedure DoChanged; override;
    procedure ApplyStyle; override;
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; override;
    { IAcceleratorKeyReceiver }
    /// <summary>Overrides TPresentedTextControl.TriggerAcceleratorKey</summary>
    procedure TriggerAcceleratorKey; override;
  public
    constructor Create(AOwner: TComponent); override;
    { triggers }
    property IsPressed: Boolean read FIsPressed;
    property Font;
    property FontColor;
    property TextAlign;
    property VertTextAlign;
    property WordWrap;
    property Trimming;
  published
    property Action;
    property Align;
    property Anchors;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property AutoTranslate default True;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property StyledSettings;
    property Locked default False;
    /// <summary>This property is used if the labbel has an accelerator key. If FocusControls supports IAcceleratorKeyReceiver
    /// calls the FocusControl default trigger action. If the IAcceleratorKeyReceiver is not supported, only sets the focus to
    /// FocusControl when the label catches the accelerator key.</summary>
    property FocusControl: TControl read FFocusControl write SetFocusControl;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default False;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TextSettings;
    property Text;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;
    property TabOrder;
    property TabStop;
    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TCustomButton }

  TCustomButton = class(TPresentedTextControl, IGlyph)
  private
    FPressing: Boolean;
    FIsPressed: Boolean;
    FModalResult: TModalResult;
    FStaysPressed: Boolean;
    FRepeatTimer: TTimer;
    FRepeat: Boolean;
    FTintColor: TAlphaColor;
    FTintObject: ITintedObject;
    FIconTintColor: TAlphaColor;
    FIconTintObject: ITintedObject;
    FIcon: TControl;
    FOldIconVisible: Boolean;
    FGlyph: TGlyph;
    FGlyphSize: TSizeF;
    FImageLink: TGlyphImageLink;
    procedure SetTintColor(const Value: TAlphaColor);
    function IsTintColorStored: Boolean;
    function IsIconTintColorStored: Boolean;
    procedure SetIconTintColor(const Value: TAlphaColor);
    function GetImages: TCustomImageList;
    procedure SetImages(const Value: TCustomImageList);
    { IGlyph }
    function GetImageIndex: TImageIndex;
    procedure SetImageIndex(const Value: TImageIndex);
    function GetImageList: TBaseImageList; inline;
    procedure SetImageList(const Value: TBaseImageList);
    function IGlyph.GetImages = GetImageList;
    procedure IGlyph.SetImages = SetImageList;
    function UpdateGlyphSize: Boolean;
  protected
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    function IsPressedStored: Boolean; virtual;
    procedure RestoreButtonState;
    procedure ApplyTriggers; virtual;
    procedure SetIsPressed(const Value: Boolean); virtual;
    procedure SetStaysPressed(const Value: Boolean); virtual;
    procedure Click; override;
    procedure DblClick; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure ToggleStaysPressed; virtual;
    procedure DoRealign; override;
    procedure DoRepeatTimer(Sender: TObject);
    procedure DoRepeatDelayTimer(Sender: TObject);
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    function GetDefaultSize: TSizeF; override;
    function GetDefaultTouchTargetExpansion: TRectF; override;
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; override;
    property TintColor: TAlphaColor read FTintColor write SetTintColor stored IsTintColorStored;
    property TintObject: ITintedObject read FTintObject;
    property IconTintColor: TAlphaColor read FIconTintColor write SetIconTintColor stored IsIconTintColorStored;
    property IconTintObject: ITintedObject read FIconTintObject;
    procedure ImagesChanged; virtual;
    /// <summary> Determines whether the <b>ImageIndex</b> property needs to be stored in the fmx-file</summary>
    /// <returns> <c>True</c> if the <b>ImageIndex</b> property needs to be stored in the fmx-file</returns>
    function ImageIndexStored: Boolean; virtual;
    { IAcceleratorKeyReceiver }
    /// <summary>Overrides the TPresentedTextControl.TriggerAcceleratorKey</summary>
    procedure TriggerAcceleratorKey; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Action;
    property StaysPressed: Boolean read FStaysPressed write SetStaysPressed stored IsPressedStored default False;
    { triggers }
    property IsPressed: Boolean read FIsPressed write SetIsPressed default False;
    property ModalResult: TModalResult read FModalResult write FModalResult default mrNone;
    property RepeatClick: Boolean read FRepeat write FRepeat default False;
    ///<summary> The list of images. Can be <c>nil</c>. <para>See also <b>FMX.ActnList.IGlyph</b></para></summary>
    property Images: TCustomImageList read GetImages write SetImages;
    ///<summary> Zero based index of an image. The default is <c>-1</c>.
    ///<para> See also <b>FMX.ActnList.IGlyph</b></para></summary>
    ///<remarks> If non-existing index is specified, an image is not drawn and no exception is raised</remarks>
    property ImageIndex: TImageIndex read GetImageIndex write SetImageIndex stored ImageIndexStored;
  end;

{ TButton }

  TButton = class(TCustomButton)
  private
    FDefault: Boolean;
    FCancel: Boolean;
  public
    property TintObject;
    property IconTintObject;
  protected
    procedure AfterDialogKey(var Key: Word; Shift: TShiftState); override;
    property Font;
    property TextAlign;
    property Trimming;
    property WordWrap;
  published
    property StaysPressed default False;
    property Action;
    property Align default TAlignLayout.None;
    property Anchors;
    property AutoTranslate default True;
    property Cancel: Boolean read FCancel write FCancel default False;
    property CanFocus default True;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property Default: Boolean read FDefault write FDefault default False;
    property DisableFocusEffect;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property StyledSettings;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property IconTintColor;
    property Images;
    property ImageIndex;
    property IsPressed default False;
    property Locked default False;
    property Padding;
    property ModalResult default mrNone;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RepeatClick default False;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property Text;
    property TextSettings;
    property TintColor;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;
    property OnApplyStyleLookup;
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
    property OnResized;
  end;

  TSpeedButtonGroupMessage = class(TMessage<string>);

  TSpeedButton = class(TCustomButton, IGroupName)
  private
    FGroupName: string;
    { IIsChecked }
    function GetIsChecked: Boolean;
    procedure SetIsChecked(const Value: Boolean);
    function IsCheckedStored: Boolean;
    procedure GroupMessageCall(const Sender : TObject; const M : TMessage);
    { IGroupName }
    function GetGroupName: string;
    function GroupNameStored: Boolean;
    procedure SetGroupName(const Value: string);
  protected
    function IsPressedStored: Boolean; override;
    procedure ToggleStaysPressed; override;
    procedure SetIsPressed(const Value: Boolean); override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Font;
    property IconTintObject;
    property TextAlign;
    property TintObject;
    property Trimming;
    property WordWrap;
  published
    // do not move this line
    property StaysPressed default False;
    property Action;
    property Align default TAlignLayout.None;
    property Anchors;
    property AutoTranslate default True;
    property CanFocus default False;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property GroupName: string read GetGroupName write SetGroupName stored GroupNameStored nodefault;
    property StyledSettings;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property IsPressed default False;
    property IconTintColor;
    property Images;
    property ImageIndex;
    property Locked default False;
    property Padding;
    property ModalResult default mrNone;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RepeatClick default False;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property ParentShowHint;
    property ShowHint;
    property StyleLookup;
    property Text;
    property TextSettings;
    property TintColor;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property OnApplyStyleLookup;
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnPainting;
    property OnPaint;
    property OnResize;
    property OnResized;
  end;

{ TCustomCornerButton }

  TCustomCornerButton = class(TCustomButton)
  private
    FYRadius: Single;
    FXRadius: Single;
    FCorners: TCorners;
    FCornerType: TCornerType;
    FSides: TSides;
    function IsCornersStored: Boolean;
    procedure SetXRadius(const Value: Single);
    procedure SetYRadius(const Value: Single);
    procedure SetCorners(const Value: TCorners);
    procedure SetCornerType(const Value: TCornerType);
    procedure SetSides(const Value: TSides);
    function IsSidesStored: Boolean;
  protected
    procedure ApplyStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property XRadius: Single read FXRadius write SetXRadius;
    property YRadius: Single read FYRadius write SetYRadius;
    property Corners: TCorners read FCorners write SetCorners stored IsCornersStored;
    property CornerType: TCornerType read FCornerType write SetCornerType default TCornerType.Round;
    property Sides: TSides read FSides write SetSides stored IsSidesStored;
  end;

{ TCornerButton }

  TCornerButton = class(TCustomCornerButton)
  public
    property Font;
    property TextAlign default TTextAlign.Center;
    property WordWrap default False;
  published
    property StaysPressed default False;
    property Action;
    property Align;
    property Anchors;
    property AutoTranslate default True;
    property CanFocus default True;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Corners;
    property CornerType;
    property Cursor default crDefault;
    property DisableFocusEffect;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property StyledSettings;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Images;
    property ImageIndex;
    { triggers }
    property IsPressed default False;

    property Locked default False;
    property Padding;
    property ModalResult default mrNone;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RepeatClick default False;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Sides;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property Text;
    property TextSettings;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property XRadius;
    property YRadius;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TCheckBox }

  TCheckBox = class(TPresentedTextControl, IIsChecked)
  private
    FPressing: Boolean;
    FOnChange: TNotifyEvent;
    FIsPressed: Boolean;
    FIsChecked: Boolean;
    FIsPan: Boolean;
    function GetIsChecked: Boolean;
    procedure SetIsChecked(const Value: Boolean);
    function IsCheckedStored: Boolean;
  protected
    procedure DoExit; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    function CanObserve(const ID: Integer): Boolean; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    function GetDefaultSize: TSizeF; override;
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; override;
    function TryValueIsChecked(const Value: TValue; out IsChecked: Boolean): Boolean;
    { IAcceleratorKeyReceiver }
    /// <summary>Overrides TPresentedTextControl.TriggerAcceleratorKey. The behaviour is to check/uncheck the
    /// box control.</summary>
    procedure TriggerAcceleratorKey; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    property IsPressed: Boolean read FIsPressed default False;
    property Font;
    property TextAlign;
    property WordWrap;
  published
    property Action;
    property Align;
    property Anchors;
    property AutoTranslate default True;
    property CanFocus default True;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DisableFocusEffect;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property StyledSettings;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property IsChecked: Boolean read GetIsChecked write SetIsChecked stored IsCheckedStored default False;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property Text;
    property TextSettings;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;
    {events}
    property OnApplyStyleLookup;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TRadioButton }

  TRadioButtonGroupMessage = class(TMessage)
  private
    FGroupName: string;
  public
    constructor Create(const AGroupName: string);
    property GroupName: string read FGroupName;
  end;

  TRadioButton = class(TPresentedTextControl, IGroupName)
  private
    FPressing: Boolean;
    FOnChange: TNotifyEvent;
    FIsPressed: Boolean;
    FIsChecked: Boolean;
    FGroupName: string;
    function GetIsChecked: Boolean;
    procedure SetIsChecked(const Value: Boolean);
    function IsCheckedStored: Boolean;
    function GetGroupName: string;
    procedure SetGroupName(const Value: string);
    function GroupNameStored: Boolean;
    procedure GroupMessageCall(const Sender : TObject; const M : TMessage);
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    function GetDefaultSize: TSizeF; override;
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; override;
    { IAcceleratorKeyReceiver }
    /// <summary>Overrides TPresentedTextControl.TriggerAcceleratorKey. The behavior is to check the
    /// radio control.</summary>
    procedure TriggerAcceleratorKey; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    property IsPressed: Boolean read FIsPressed;
    property TextAlign;
    property Font;
    property WordWrap;
  published
    property Action;
    property Align;
    property Anchors;
    property AutoTranslate default True;
    property CanFocus default True;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DisableFocusEffect;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property StyledSettings;
    property GroupName: string read GetGroupName write SetGroupName stored GroupNameStored nodefault;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    { triggers }
    property IsChecked: Boolean read GetIsChecked write SetIsChecked stored IsCheckedStored default False;

    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property Text;
    property TextSettings;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TGroupBox }

  TGroupBox = class(TPresentedTextControl)
  protected
    procedure DefineProperties(Filer: TFiler); override;
    function GetDefaultSize: TSizeF; override;
    function StyledSettingsStored: Boolean; override;
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    property Font;
  published
    property Action;
    property Align;
    property Anchors;
    property AutoTranslate default True;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property StyledSettings;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property Text;
    property TextSettings;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property TabOrder;
    property TabStop;
    property ParentShowHint;
    property ShowHint;
    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TStatusBar }

  TStatusBar = class(TPresentedControl, IHintReceiver)
  private
    FShowSizeGrip: Boolean;
    FOnHint: TNotifyEvent;
    FAutoHint: Boolean;
    procedure SetShowSizeGrip(const Value: Boolean);
  protected
    procedure ApplyStyle; override;
    procedure DefineProperties(Filer: TFiler); override;
    function GetDefaultSize: TSizeF; override;
    /// <summary>Reimplementation of changing root in order the control to be unregistered from the old root
    /// and registered to the new one. This is useful for the control to be registered on unregistered as a hint
    /// receiver.</summary>
    procedure DoRootChanging(const NewRoot: IRoot); override;
    { IHintReceiver }
    /// <summary>Implementation of IHintReceiver.TriggerOnHint.</summary>
    procedure TriggerOnHint;
    /// <summary>Method to trigger the OnHint event.</summary>
    function DoHint: Boolean; virtual;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Action;
    property Align default TAlignLayout.Bottom;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property ShowSizeGrip: Boolean read FShowSizeGrip write SetShowSizeGrip;
    property Size;
    property StyleLookup;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property TabOrder;
    property TabStop;
    property ParentShowHint;
    property ShowHint;
    /// <summary>Use this property to enable/disable the OnHint event.</summary>
    property AutoHint: Boolean read FAutoHint write FAutoHint default False;
    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;

    /// <summary>Event to be triggered when the application catches a hint.</summary>
    property OnHint: TNotifyEvent read FOnHint write FOnHint;
  end;

{ TToolBar }

  TToolBar = class(TPresentedControl)
  private
    FTintColor: TAlphaColor;
    FTintObject: ITintedObject;
    procedure SetTintColor(const Value: TAlphaColor);
    function IsTintColorStored: Boolean;
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DefineProperties(Filer: TFiler); override;
    function GetDefaultSize: TSizeF; override;
  public
    constructor Create(AOwner: TComponent); override;
    property TintObject: ITintedObject read FTintObject;
  published
    property Action;
    property Align default TAlignLayout.Top;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property TintColor: TAlphaColor read FTintColor write SetTintColor  stored IsTintColorStored;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property OnApplyStyleLookup;
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
    property OnResized;
  end;

{ TSizeGrip }

  TSizeGrip = class(TStyledControl, ISizeGrip)
  protected
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Action;
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TouchTargetExpansion;
    property Visible;
    property Width;

    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TSplitter }

  TSplitter = class(TStyledControl)
  private
    FPressed: Boolean;
    FControl: TControl;
    FDownPos: TPointF;
    FMinSize: Single;
    FMaxSize: Single;
    FNewSize, FOldSize: Single;
    FSplit: Single;
    FShowGrip: Boolean;
    procedure SetShowGrip(const Value: Boolean);
  protected
    procedure ApplyStyle; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure Paint; override;
    procedure SetAlign(const Value: TAlignLayout); override;
    function FindObject: TControl;
    procedure CalcSplitSize(X, Y: Single; var NewSize, Split: Single);
    procedure UpdateSize(X, Y: Single);
    function DoCanResize(var NewSize: Single): Boolean;
    procedure UpdateControlSize;
    function GetDefaultSize: TSizeF; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
  published
    property Action;
    property Align;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest default True;
    property Padding;
    property MinSize: Single read FMinSize write FMinSize;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property ShowGrip: Boolean read FShowGrip write SetShowGrip default True ;
    property Size;
    property StyleLookup;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property TabStop;

    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TProgressBar }

  TProgressBar = class(TPresentedControl, IValueRange)
  private
    FOrientation: TOrientation;
    FValueRange: TValueRange;
    FDefaultValueRange: TBaseValueRange;
    procedure SetOrientation(const Value: TOrientation);
    function GetMax: Single;
    function GetMin: Single;
    function GetValue: Single;
    procedure SetMax(const Value: Single);
    procedure SetMin(const Value: Single);
    procedure SetValue(const Value: Single);
    function GetValueRange: TCustomValueRange;
    procedure SetValueRange(const AValue: TCustomValueRange);
    function DefStored: Boolean;
    procedure ChangedProc(Sender: TObject);
    function MaxStored: Boolean;
    function MinStored: Boolean;
    function ValueStored: Boolean;
  protected
    function ChooseAdjustType(const FixedSize: TSize): TAdjustType; override;
    procedure ApplyStyle; override;
    procedure DefineProperties(Filer: TFiler); override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure DoRealign; override;
    function GetActionLinkClass: TActionLinkClass; override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    procedure AfterChangeProc(Sender: TObject); virtual;
    property DefaultValueRange: TBaseValueRange read FDefaultValueRange;
    procedure Loaded; override;
    function GetDefaultSize: TSizeF; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AfterConstruction; override;
    destructor Destroy; override;
  published
    property Action;
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Max: Single read GetMax write SetMax stored MaxStored nodefault;
    property Min: Single read GetMin write SetMin stored MinStored nodefault;
    property Opacity;
    property Orientation: TOrientation read FOrientation write SetOrientation;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TouchTargetExpansion;
    property Value: Single read GetValue write SetValue stored ValueStored nodefault;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;
    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TThumb }

  TCustomTrack = class;

  TThumb = class(TStyledControl)
  private
    [Weak] FTrack: TCustomTrack;
    FDownOffset: TPointF;
    FPressed: Boolean;
    function PointToValue(X, Y: Single): Single;
  public
    constructor Create(AOwner: TComponent); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    function GetDefaultTouchTargetExpansion: TRectF; override;
    property IsPressed: Boolean read FPressed;
  published
    property Action;
    property Align;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

  TMouseDownAction = (&Goto, None);

  TMouseDownActionHelper = record helper for TMouseDownAction
  const
    mdaGoto = TMouseDownAction.Goto deprecated 'Use TMouseDownAction.Goto';
    mdaNone = TMouseDownAction.None deprecated 'Use TMouseDownAction.None';
  end;

{ TCustomTrack }

  TCustomTrack = class(TPresentedControl, IValueRange)
  private const
    FirstInterval = 10;
    SecondInterval = 500;
    OtherInterval = 20;
  private
    FValueRange: TValueRange;
    FDefaultValueRange: TBaseValueRange;
    [Weak] FThumb: TThumb;
    FMouseDownAction: TMouseDownAction;
    FPushedValue: Single;
    FPushedSign: TValueSign;
    FPushedShift: TShiftState;
    FPushedTimer: TTimer;
    FSmallChange: Single;
    function GetIsTracking: Boolean;
    procedure SetMax(const Value: Single);
    procedure SetMin(const Value: Single);
    procedure SetValue(Value: Single);
    procedure SetFrequency(const Value: Single);
    procedure SetViewportSize(const Value: Single);
    function GetFrequency: Single;
    function GetMax: Single;
    function GetMin: Single;
    function GetValue: Single;
    function GetViewportSize: Single;
    function GetValueRange: TCustomValueRange;
    procedure SetValueRange(const AValue: TCustomValueRange);
    procedure SetValueRange_(const Value: TValueRange);
    function DefStored: Boolean;
    procedure SetNewValue(const LValue: Single);
    procedure UpdateHighlight;
    function FrequencyStored: Boolean;
    function MaxStored: Boolean;
    function MinStored: Boolean;
    function ValueStored: Boolean;
    function ViewportSizeStored: Boolean;
    procedure ObserversValueUpdate;
    function GetIncrement: Double;
    function DoSmallChange(N: Integer; const TargetValue: Double): Boolean;
    function MousePosToValue(const MousePos: TPointF): Single;
    procedure TimerProc(Sender: TObject);
  protected
    FOnChange, FOnTracking: TNotifyEvent;
    FIgnoreViewportSize: Boolean;
    FOrientation: TOrientation;
    FTracking: Boolean;
    FTrack: TControl;
    FTrackHighlight: TControl;
    FThumbSize: Single;
    FMinThumbSize: Single;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    function CanObserve(const ID: Integer): Boolean; override;
    procedure SetOrientation(const Value: TOrientation); virtual;
    function GetThumbRect(Value: single): TRectF; overload; virtual;
    function GetThumbRect: TRectF; overload;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DoMouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single; LValue: Single); virtual;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    function ChooseAdjustType(const FixedSize: TSize): TAdjustType; override;
    function GetDefaultTouchTargetExpansion: TRectF; override;
    procedure DoThumbClick(Sender: TObject); virtual;
    procedure DoThumbDblClick(Sender: TObject); virtual;
    function GetThumbSize(var IgnoreViewportSize: Boolean): Integer; virtual;
    procedure DoRealign; override;
    property IsTracking: Boolean read GetIsTracking;
    function GetActionLinkClass: TActionLinkClass; override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    procedure Loaded; override;
    procedure DoChanged; virtual;
    procedure DoTracking; virtual;
    function GetDefaultSize: TSizeF; override;
    function CreateValueRangeTrack : TValueRange; virtual;
    property MouseDownAction: TMouseDownAction read FMouseDownAction write FMouseDownAction;
    property DefaultValueRange: TBaseValueRange read FDefaultValueRange;
    procedure Resize; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    property ValueRange: TValueRange read FValueRange write SetValueRange_ stored ValueStored;
    property Min: Single read GetMin write SetMin stored MinStored nodefault;
    property Max: Single read GetMax write SetMax stored MaxStored nodefault;
    property Frequency: Single read GetFrequency write SetFrequency stored FrequencyStored nodefault;
    ///<summary>Controls the number of positions this track bar's thumb moves on each pressing of the free area</summary>
    property SmallChange: Single read FSmallChange write FSmallChange;
    property Value: Single read GetValue write SetValue stored ValueStored nodefault;
    property ViewportSize: Single read GetViewportSize write SetViewportSize stored ViewportSizeStored nodefault;
    property Orientation: TOrientation read FOrientation write SetOrientation;
    property Tracking: Boolean read FTracking write FTracking default True;
    property Thumb: TThumb read FThumb;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnTracking: TNotifyEvent read FOnTracking write FOnTracking;
  end;

{ TTrack }

  TTrack = class(TCustomTrack)
  published
    property Action;
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Frequency;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Max;
    property Min;
    property Opacity;
    property Orientation;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Tracking;
    property Value;
    property ViewportSize;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    property OnChange;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TTrackBar }

  TTrackBar = class(TCustomTrack)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Action;
    property Align;
    property Anchors;
    property CanFocus default True;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property ControlType;
    property DisableFocusEffect;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Frequency;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Max;
    property Min;
    property Orientation;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Tracking;
    property Value;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    property OnChange;
    property OnTracking;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TBitmapTrackBar }

  TBitmapTrackBar = class(TTrackBar)
  protected
    FBitmap: TBitmap;
    FBackground: TShape;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoRealign; override;
    function GetDefaultStyleLookupName: string; override;
    procedure UpdateBitmap;
    procedure FillBitmap; virtual;
    procedure SetOrientation(const Value: TOrientation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

{ TSwitch }

const
  MM_VALUE_CHANGED = MM_USER + 1;

type

  /// <summary>Data model for the TSwitch control.</summary>
  TSwitchModel = class(TDataModel)
  private
    FValue: Boolean;
    FOnSwitch: TNotifyEvent;
    procedure SetValue(AValue: Boolean);
  protected
    /// <summary>Invokes OnSwitch event handler</summary>
    procedure DoChanged; virtual;
  public
    /// <summary>Invokes OnSwitch event handler</summary>
    procedure Change;
  public
    /// <summary>Property representing the boolean value of the switch. When the switch is On, the boolean value is
    /// True. When the switch is Off, the boolean value is False.</summary>
    property Value: Boolean read FValue write SetValue;
    /// <summary>Event handler is called, when <c>TSwitch</c> changed <c>IsChecked</c></summary>
    property OnSwitch: TNotifyEvent read FOnSwitch write FOnSwitch;
  end;

  /// <summary>Represents a two-way on/off switch for use in
  /// applications.</summary>
  TCustomSwitch = class(TPresentedControl, IIsChecked)
  private type
    TNeededToDo = set of (SetChecked, CallClick);
  private
    FNeededToDo: TNeededToDo;
    function GetModel: TSwitchModel; overload;
    procedure SetOnSwitch(const Value: TNotifyEvent);
    function GetOnSwitch: TNotifyEvent;
    { IIsChecked }
    procedure SetIsChecked(const AValue: Boolean);
    function GetIsChecked: Boolean;
    function IsCheckedStored: Boolean;
  protected
    { Actions }
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    function GetActionLinkClass: TActionLinkClass; override;
    { Live Binding }
    function CanObserve(const ID: Integer): Boolean; override;
    procedure SetData(const Value: TValue); override;
    function GetData: TValue; override;
    { Mouse Events }
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure Click; override;
    function GetDefaultTouchTargetExpansion: TRectF; override;
    function DefineModelClass: TDataModelClass; override;
    /// <summary>This virtual method is performed after changing the IsChecked property. By default, it executes the
    /// event handler OnSwitch </summary>
    procedure DoSwitch; virtual;
    function GetDefaultSize: TSizeF; override;
  public
    constructor Create(AOwner: TComponent); override;
    /// <summary>Property to retrieve the data model of the switch control.</summary>
    property Model: TSwitchModel read GetModel;
  public
    /// <summary>True if switch is turned on. Returns False otherwise.</summary>
    property IsChecked: Boolean read GetIsChecked write SetIsChecked stored IsCheckedStored;
    /// <summary>Event handler is being invoked, when switch changes value <c>IsChecked</c>.</summary>
    property OnSwitch: TNotifyEvent read GetOnSwitch write SetOnSwitch;
  end;

  TSwitch = class(TCustomSwitch)
  published
    property Action;
    property Align;
    property Anchors;
    property CanFocus default True;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property Hint;
    property HitTest default True;
    property IsChecked;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;
    property OnApplyStyleLookup;
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
    property OnResized;
    property OnSwitch;
  end;

{ TScrollBar }

  TScrollBar = class(TStyledControl)
  private
    FValueRange: TValueRange;
    FTrackChanging: Boolean;
    FOnChange: TNotifyEvent;
    FOrientation: TOrientation;
    FTrack: TCustomTrack;
    FMinButton: TCustomButton;
    FMaxButton: TCustomButton;
    FSmallChange: Single;
    FDefaultValueRange: TBaseValueRange;
    procedure SetMax(const Value: Single);
    procedure SetMin(const Value: Single);
    procedure SetValue(const Value: Single);
    procedure SetViewportSize(const Value: Single);
    function GetMax: Single;
    function GetMin: Single;
    function GetValue: Single;
    function GetViewportSize: Single;
    function GetValueRange: TValueRange;
    procedure SetValueRange(const Value: TValueRange);
    procedure SetOrientation(const Value: TOrientation);
    function DefStored: Boolean;
    procedure TrackChangedProc(Sender: TObject);
    procedure FreeTrack;
    function GetSmallChange: Single;
    procedure SetSmallChange(const Value: Single);
    function SmallChangeStored: Boolean;
    function GetIncrement: Double;
    procedure DoSmallChange(N: Integer);
    function MaxStored: Boolean;
    function MinStored: Boolean;
    function ValueStored: Boolean;
    function ViewportSizeStored: Boolean;
  protected
    procedure DoMinButtonClick(Sender: TObject);
    procedure DoMaxButtonClick(Sender: TObject);
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    function CanObserve(const ID: Integer): Boolean; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    function GetActionLinkClass: TActionLinkClass; override;
    procedure DoActionClientChanged; override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    property Track: TCustomTrack read FTrack;
    property MinButton: TCustomButton read FMinButton;
    property MaxButton: TCustomButton read FMaxButton;
    procedure DoChanged; virtual;
    procedure DefineProperties(Filer: TFiler); override;
    function GetDefaultSize: TSizeF; override;
    procedure Loaded; override;
    property DefaultValueRange: TBaseValueRange read FDefaultValueRange;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    property ValueRange: TValueRange read GetValueRange write SetValueRange;
  published
    property Action;
    property Align;
    property Anchors;
    property CanFocus default False;
    property CanParentFocus default False;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest default True;
    property Padding;
    property Max: Single read GetMax write SetMax stored MaxStored nodefault;
    property Min: Single read GetMin write SetMin stored MinStored nodefault;
    property Value: Single read GetValue write SetValue stored ValueStored nodefault;
    property ViewportSize: Single read GetViewportSize write SetViewportSize stored ViewportSizeStored nodefault;
    property SmallChange: Single read GetSmallChange write SetSmallChange stored SmallChangeStored nodefault;
    property Orientation: TOrientation read FOrientation write SetOrientation;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    {events}
    property OnApplyStyleLookup;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TSmallScrollBar }

  TSmallScrollBar = class(TScrollBar)
  protected
    procedure ApplyStyle; override;
    function GetDefaultSize: TSizeF; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TAniIndicator }

  TAniIndicatorStyle = (Linear, Circular);

  TAniIndicatorStyleHelper = record helper for TAniIndicatorStyle
  const
    aiLinear = TAniIndicatorStyle.Linear deprecated 'Use TAniIndicatorStyle.Linear';
    aiCircular = TAniIndicatorStyle.Circular deprecated 'Use TAniIndicatorStyle.Circular';
  end;

  TAniIndicator = class(TStyledControl)
  private type
    TRotationControl = class(TControl)
    public
      property RotationAngle;
    end;
  private
    FLayout: TControl;
    FAni: TAnimation;
    FStyle: TAniIndicatorStyle;
    FFill: TBrush;
    procedure SetStyle(const Value: TAniIndicatorStyle);
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure SetEnabled(const Value: Boolean); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure Paint; override;
    function EnabledStored: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ApplyStyleLookup; override;
  published
    property Action;
    property Align;
    property Anchors;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled stored EnabledStored;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property StyleLookup;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property Style: TAniIndicatorStyle read FStyle write SetStyle default TAniIndicatorStyle.Linear;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;
    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TArcDial }

  TArcDial = class(TPresentedControl, IValueRange)
  private
    FValueRange: TValueRange;
    FValueChanged: Boolean;
    FPressing: Boolean;
    FOnChange: TNotifyEvent;
    FSaveValue: Single;
    FTracking: Boolean;
    FShowValue: Boolean;
    FOldValue: Single;
    FDefaultValueRange: TBaseValueRange;
    procedure SetValue(const Value: Single);
    procedure SetShowValue(const Value: Boolean);
    function DefStored: Boolean;
    function GetValueRange: TCustomValueRange;
    procedure SetValueRange(const AValue: TCustomValueRange);
    procedure SetValueRange_(const Value: TValueRange);
    function GetValue: Single;
    function GetFrequency: Single;
    procedure SetFrequency(const Value: Single);
    function FrequencyStored: Boolean;
    function ValueStored: Boolean;
  protected
    function Tick: TControl;
    function Text: TText;
    procedure ApplyStyle; override;
    function CanObserve(const ID: Integer): Boolean; override;
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    procedure Loaded; override;
    function GetActionLinkClass: TActionLinkClass; override;
    procedure ActionChange(Sender: TBasicAction; CheckDefaults: Boolean); override;
    procedure BeforeChangeProc(Sender: TObject);
    procedure ValueRangeChangeProc(Sender: TObject);
    procedure AfterChangedProc(Sender: TObject); virtual;
    function GetDefaultSize: TSizeF; override;
    property DefaultValueRange: TBaseValueRange read FDefaultValueRange;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    property ValueRange: TValueRange read FValueRange write SetValueRange_;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
  published
    { props }
    property Action;
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property ControlType;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property ShowValue: Boolean read FShowValue write SetShowValue default False;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Tracking: Boolean read FTracking write FTracking default True;
    property Value: Single read GetValue write SetValue stored ValueStored nodefault;
    property Frequency: Single read GetFrequency write SetFrequency stored FrequencyStored nodefault;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TExpanderButton }

  TExpanderButton = class(TCustomButton)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Action;
    property Align;
    property Anchors;
    property AutoTranslate default True;
    property CanFocus default False;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DisableFocusEffect;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Font;
    property StyledSettings;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    { triggers }
    property StaysPressed default False;
    property IsPressed default False;

    property Locked default False;
    property Padding;
    property ModalResult default mrNone;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RepeatClick default False;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property Text;
    property TextAlign default TTextAlign.Center;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property WordWrap default False;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

  TExpander = class(TTextControl)
  public const
    /// <summary>Default header height</summary>
    cDefaultHeaderHeight = 25;
  private
    FShowCheck: Boolean;
    FIsChecked: Boolean;
    FOnCheckChange: TNotifyEvent;
    FContentHeight: Integer;
    FHeader: TControl;
    FHeaderHeight: Integer;
    FStyleHeaderHeight: Integer;
    FOnExpandedChanging: TNotifyEvent;
    FOnExpandedChanged: TNotifyEvent;
    FChangingState: Boolean;
    procedure HandleButtonClick(Sender: TObject);
    procedure HandleCheckChange(Sender: TObject);
    procedure SetIsChecked(const Value: Boolean);
    procedure SetIsExpanded(const Value: Boolean);
    procedure SetShowCheck(const Value: Boolean);
    procedure UpdateControlSize(const ChangingState: Boolean);
    procedure ExpandedChanging;
    procedure ExpandedChanged;
  protected
    FIsExpanded: Boolean;
    FContent: TContent;
    FButton: TCustomButton;
    FCheck: TCheckBox;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoRealign; override;
    procedure DoStyleChanged; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure ReadContentSize(Reader: TReader);
    procedure WriteContentSize(Writer: TWriter);
    procedure DoAddObject(const AObject: TFmxObject); override;
    procedure UpdateContentSize;
    procedure DoResized; override;
    function DoSetSize(const ASize: TControlSize; const NewPlatformDefault: Boolean; ANewWidth, ANewHeight: Single;
      var ALastWidth, ALastHeight: Single): Boolean; override;
    function GetDefaultSize: TSizeF; override;
    /// <summary>Called when expanded state is going to change</summary>
    procedure DoExpandedChanging; virtual;
    /// <summary>Called when expanded state just has changed</summary>
    procedure DoExpandedChanged; virtual;
    /// <summary>Called when checked state just has changed</summary>
    procedure DoCheckedChanged; virtual;
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; override;
    procedure SetHeaderHeight(const Value: Integer);
    function GetHeaderHeight: Integer;
    /// <summary>Evaluate header height that will be used based on style availability and property value</summary>
    function EffectiveHeaderHeight: Integer;
    /// <summary>Evaluate default header height based on style availability</summary>
    function DefaultHeaderHeight: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    function GetTabList: ITabList; override;
  published
    property Action;
    property Align;
    property Anchors;
    property AutoTranslate default True;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property StyledSettings;
    property TextSettings;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest default True;
    /// <summary>Allows to customize header height. Default value is -1.
    /// <para>When the value is -1, if the style defines a <c>header</c> element style element height will be taken
    /// for a default. If no such style element is defined, the value of
    /// <see cref="FMX.StdCtrls|TExpander.cDefaultHeaderHeight "/> will be taken in</para></summary>
    property HeaderHeight: Integer read GetHeaderHeight write SetHeaderHeight default -1;
    /// <summary>True if the checkbox is used and is checked (the content is enabled).
    /// <para>See <see cref="FMX.StdCtrls|TExpander.OnCheckChange"/>,
    /// <see cref="FMX.StdCtrls|TExpander.ShowCheck"/></para>
    /// </summary>
    property IsChecked: Boolean read FIsChecked write SetIsChecked default True;
    /// <summary><c>True</c> if expanded
    /// <para>Setting this property to <c>True</c> will expand the control,
    /// <c>False</c> will collapse. Before the state is changed,
    /// <see cref="FMX.StdCtrls|TExpander.OnExpandedChanging"/> event will be called. User can
    /// abort this operation by invoking <see cref="System.SysUtils|Abort"/> in the handler.
    /// <see cref="FMX.StdCtrls|TExpander.OnExpandedChanged"/> event will be invoked after the state change.
    /// </para></summary>
    property IsExpanded: Boolean read FIsExpanded write SetIsExpanded default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    /// <summary>Setting to <c>True</c> will show a check box that enables or disables the content</summary>
    property ShowCheck: Boolean read FShowCheck write SetShowCheck;
    property Size;
    property StyleLookup;
    property Text;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property TabOrder;
    property TabStop;

    {events}
    property OnApplyStyleLookup;
    /// <summary>Called when checkbox state is changed</summary>
    property OnCheckChange: TNotifyEvent read FOnCheckChange write FOnCheckChange;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
    /// <summary>Called when checkbox state is about to change. Can be aborted by EAbort</summary>
    property OnExpandedChanging: TNotifyEvent read FOnExpandedChanging write FOnExpandedChanging;
    /// <summary>Called when checkbox state has changed</summary>
    property OnExpandedChanged: TNotifyEvent read FOnExpandedChanged write FOnExpandedChanged;
  end;

  TImageLoadedEvent = procedure (Sender: TObject; const FileName: string) of object;

  TImageControl = class(TStyledControl)
  private
    FImage: TImage;
    FOnChange: TNotifyEvent;
    FBitmap: TBitmap;
    FEnableOpenDialog: Boolean;
    FOnLoaded: TImageLoadedEvent;
    procedure SetBitmap(const Value: TBitmap);
    procedure UpdateImage;
  protected
    function GetData: TValue; override;
    procedure SetData(const Value: TValue); override;
    function CanObserve(const ID: Integer): Boolean; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Click; override;
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation); override;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); override;
    procedure DoBitmapChanged(Sender: TObject); virtual;
    procedure DoLoadFromFile(const FileName: string); virtual;
    function GetDefaultSize: TSizeF; override;
    property Image: TImage read FImage;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadFromFile(const FileName: string);
    function ShowOpenDialog: Boolean;
  published
    property Action;
    property Align;
    property Anchors;
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property CanFocus default True;
    property CanParentFocus;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DisableFocusEffect;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property EnableOpenDialog: Boolean read FEnableOpenDialog write FEnableOpenDialog default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TabOrder;
    property TabStop;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnLoaded: TImageLoadedEvent read FOnLoaded write FOnLoaded;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

{ TPathLabel }

  TPathLabel = class(TStyledControl)
  private
    FPath: TCustomPath;
    function GetWrapMode: TPathWrapMode;
    procedure SetWrapMode(const Value: TPathWrapMode);
    function GetPathData: TPathData;
    procedure SetPathData(const Value: TPathData);
  protected
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Action;
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property Data: TPathData read GetPathData write SetPathData;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property Hint;
    property HitTest default False;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property StyleLookup;
    property TouchTargetExpansion;
    property Visible;
    property Width;
    property WrapMode: TPathWrapMode read GetWrapMode write SetWrapMode
      default TPathWrapMode.Stretch;
    property ParentShowHint;
    property ShowHint;

    {events}
    property OnApplyStyleLookup;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Keyboard events}
    property OnKeyDown;
    property OnKeyUp;
    {Mouse events}
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
    property OnResized;
  end;

implementation

uses
  System.UIConsts, System.Actions, System.RTLConsts, System.TypInfo, System.SysUtils, System.Math.Vectors,
  System.Character, FMX.Consts, FMX.Utils, FMX.Platform, FMX.Dialogs, FMX.TextLayout, FMX.BehaviorManager, FMX.Forms,
  FMX.Switch.Style, FMX.Styles, FMX.Styles.Objects {$IFDEF IOS}, FMX.Switch.iOS{$ENDIF}
  {$IFDEF MSWINDOWS}, FMX.Switch.Win{$ENDIF}{$IFDEF ANDROID}, FMX.Switch.Android{$ENDIF};

type
  TTextControlSettingsInfo = class (TTextSettingsInfo)
  private
    [Weak] FTextControl: TPresentedTextControl;
  protected
    procedure DoCalculatedTextSettings; override;
  public
    constructor Create(AOwner: TPersistent; ATextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass); override;
    property TextControl: TPresentedTextControl read FTextControl;
  end;

{ TTextControlSettingsInfo }

constructor TTextControlSettingsInfo.Create(AOwner: TPersistent; ATextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass);
begin
  inherited;
  if AOwner is TPresentedTextControl then
    FTextControl := TPresentedTextControl(AOwner)
  else
    raise EArgumentException.CreateFMT(SEUseHeirs, [TPresentedTextControl.ClassName]);
end;

procedure TTextControlSettingsInfo.DoCalculatedTextSettings;
begin
  inherited;
  FTextControl.DoChanged;
end;

{ TTextControl }

type
  TTextControlTextSettings = class (TTextSettingsInfo.TCustomTextSettings)
  published
    property Font;
    property FontColor;
  end;

constructor TPresentedTextControl.Create(AOwner: TComponent);
begin
  inherited;
  FIsChanging := True;
  FTextSettingsInfo := TTextControlSettingsInfo.Create(Self, GetTextSettingsClass);
  EnableExecuteAction := True;
  FAcceleratorKey := #0;
  FAcceleratorKeyIndex := -1;
end;

destructor TPresentedTextControl.Destroy;
var
  AccelKeyService: IFMXAcceleratorKeyRegistryService;
begin
  FTextSettingsInfo.Free;
  if TPlatformServices.Current <> nil then
    if TPlatformServices.Current.SupportsPlatformService(IFMXAcceleratorKeyRegistryService, AccelKeyService) then
      AccelKeyService.UnregisterReceiver(Root, Self);

  inherited;
end;

procedure TPresentedTextControl.AfterConstruction;
begin
  inherited;
  FIsChanging := False;
end;

procedure TPresentedTextControl.DefineProperties(Filer: TFiler);
var
  LTextPropLoader: TTextSettingsInfo.TTextPropLoader;
begin
  inherited;
  LTextPropLoader := TTextSettingsInfo.TTextPropLoader.Create(Self, Filer);
  try
    LTextPropLoader.ReadProperties;
  finally
    LTextPropLoader.Free;
  end;
end;

procedure TPresentedTextControl.SetName(const Value: TComponentName);
var
  ChangeText: Boolean;
begin
  ChangeText := not (csLoading in ComponentState) and (Name = Text) and
    ((Owner = nil) or not (csLoading in TComponent(Owner).ComponentState));
  inherited SetName(Value);
  if ChangeText then
    Text := Value;
end;

procedure TPresentedTextControl.ActionChange(Sender: TBasicAction; CheckDefaults: Boolean);
begin
  if Sender is TCustomAction then
  begin
    if not CheckDefaults or Text.IsEmpty or (Text = Name) then
     Text := TCustomAction(Sender).Text;
  end;
  inherited;
end;

function TPresentedTextControl.FindTextObject: TFmxObject;
begin
  Result := FindStyleResource('text'); // Do not localize
end;

procedure TPresentedTextControl.ApplyStyle;
var
  NewT : string;
  FontBehavior: IFontBehavior;
  BrushObject: TBrushObject;

  procedure SetupDefaultTextSetting(const AObject: TFmxObject;
                                    const ADefaultTextSettings: TTextSettings);
  var
    NewFamily: string;
    NewSize: Single;
  begin
    if (AObject <> nil) and AObject.GetInterface(IObjectState, FObjectState) then
      FObjectState.SaveState
    else
      FObjectState := nil;

    FITextSettings := nil;
    FTextObject := nil;
    if ADefaultTextSettings <> nil then
    begin
      if (AObject <> nil) and Supports(AObject, ITextSettings, FITextSettings) then
        ADefaultTextSettings.Assign(FITextSettings.TextSettings)
      else
        ADefaultTextSettings.Assign(nil);

      if FontBehavior <> nil then
      begin
        NewFamily := '';
        FontBehavior.GetDefaultFontFamily(Scene.GetObject, NewFamily);
        if not NewFamily.IsEmpty then
          ADefaultTextSettings.Font.Family := NewFamily;

        NewSize := 0;
        FontBehavior.GetDefaultFontSize(Scene.GetObject, NewSize);
        if not SameValue(NewSize, 0, TEpsilon.FontSize) then
          ADefaultTextSettings.Font.Size := NewSize;
      end;
    end;
    if (AObject is TControl) then
      FTextObject := TControl(AObject)
  end;

begin
  ResultingTextSettings.BeginUpdate;
  try
    FTextSettingsInfo.Design := False;
    { behavior }
    if Scene <> nil then
      TBehaviorServices.Current.SupportsBehaviorService(IFontBehavior, FontBehavior, Scene.GetObject);
    { from text }
    SetupDefaultTextSetting(FindTextObject, FTextSettingsInfo.DefaultTextSettings);
    inherited;
    { from foreground }
    if FindStyleResource<TBrushObject>('foreground', BrushObject) then // Do not localize
    begin
      // use instead of the black, foreground color
      if (FTextSettingsInfo.DefaultTextSettings.FontColor = claBlack) or
         (FTextSettingsInfo.DefaultTextSettings.FontColor = claNull) then
        FTextSettingsInfo.DefaultTextSettings.FontColor := BrushObject.Brush.Color;
    end;
    ResultingTextSettings.Change;
  finally
    ResultingTextSettings.EndUpdate;
    FTextSettingsInfo.Design := csDesigning in ComponentState;
  end;
  if AutoTranslate and not FText.IsEmpty then
  begin
    NewT := Translate(Text); // need for collection texts
    if not(csDesigning in ComponentState) then
      Text := NewT;
  end;
end;

procedure TPresentedTextControl.FreeStyle;
begin
  if FObjectState <> nil then
  begin
    FObjectState.RestoreState;
    FObjectState := nil;
  end
  else
    if FITextSettings <> nil then
      FITextSettings.TextSettings := FITextSettings.DefaultTextSettings;
  FITextSettings := nil;
  FTextObject := nil;
  inherited;
end;

procedure TPresentedTextControl.DoChanged;
var
  TextStr: string;
begin
  if FITextSettings <> nil then
    FITextSettings.TextSettings.BeginUpdate;
  try
    if FITextSettings <> nil then
      FITextSettings.TextSettings.Assign(ResultingTextSettings);

    TextStr := DoFilterPresentedText(Text);

    if FTextObject <> nil then
      UpdateTextObject(FTextObject, TextStr)
    else
    begin
      if ResourceControl is TText then
        UpdateTextObject(ResourceControl, TextStr)
      else
      begin
        Repaint;
        UpdateEffects;
      end;
    end;
  finally
    if FITextSettings <> nil then
      FITextSettings.TextSettings.EndUpdate;
  end;
end;

procedure TPresentedTextControl.DoTextChanged;
begin

end;

function TPresentedTextControl.CanTriggerAcceleratorKey: Boolean;
begin
  Result := ParentedVisible;
end;

procedure TPresentedTextControl.DoEndUpdate;
begin
  inherited;
  if ([csLoading, csDestroying] * ComponentState = []) and
     (ResultingTextSettings.IsAdjustChanged or ResultingTextSettings.IsChanged) then
    Change;
end;

function TPresentedTextControl.DoFilterPresentedText(const AText: string): string;
begin
  if (ControlType = TPresentedControl.TControlType.Styled) or
    TPlatformServices.Current.SupportsPlatformService(IFMXAcceleratorKeyRegistryService) then
    Result := Text
  else
    Result := DelAmp(AText);
end;

procedure TPresentedTextControl.DoRootChanging(const NewRoot: IRoot);
var
  AccelKeyService: IFMXAcceleratorKeyRegistryService;
begin
  if (ComponentState * [csLoading, csDestroying] = []) and
    TPlatformServices.Current.SupportsPlatformService(IFMXAcceleratorKeyRegistryService, AccelKeyService) then
    AccelKeyService.ChangeReceiverRoot(Self, Root, NewRoot);
  inherited;
end;

function TPresentedTextControl.CalcTextObjectSize(const MaxWidth: Single; var Size: TSizeF): Boolean;
const
  FakeText = 'P|y'; // Do not localize

  function RoundToScale(const Value, Scale: Single): Single;
  begin
    if Scale > 0 then
      Result := Ceil(Value * Scale) / Scale
    else
      Result := Ceil(Value);
  end;

var
  Layout: TTextLayout;
  LScale: Single;
  LText: string;
  LMaxWidth, LWidth: Single;
begin
  Result := False;
  if (Scene <> nil) and (TextObject <> nil) then
  begin
    LMaxWidth := MaxWidth - TextObject.Margins.Left - TextObject.Margins.Right;

    LScale := Scene.GetSceneScale;
    Layout := TTextLayoutManager.DefaultTextLayout.Create;
    try
      if TextObject is TText then
        LText := TText(TextObject).Text
      else
        LText := Text;
      Layout.BeginUpdate;
      if LText.IsEmpty then
        Layout.Text := FakeText
      else
        Layout.Text := LText;
      Layout.Font := ResultingTextSettings.Font;
      if ResultingTextSettings.WordWrap and (LMaxWidth > 1) then
        Layout.MaxSize := TPointF.Create(LMaxWidth, TTextLayout.MaxLayoutSize.Y);
      Layout.WordWrap := ResultingTextSettings.WordWrap;
      Layout.Trimming := TTextTrimming.None;
      Layout.VerticalAlign := TTextAlign.Leading;
      Layout.HorizontalAlign := TTextAlign.Leading;
      Layout.EndUpdate;

      if ResultingTextSettings.WordWrap then
        Layout.MaxSize := TPointF.Create(LMaxWidth + Layout.TextRect.Left * 2, TTextLayout.MaxLayoutSize.Y);

      if LText.IsEmpty then
        LWidth := 0
      else if ResultingTextSettings.WordWrap then
        LWidth := Layout.MaxSize.X
      else
        LWidth := Layout.Width;
      Size.Width := RoundToScale(LWidth, LScale) + TextObject.Margins.Left + TextObject.Margins.Right;
      Size.Height := RoundToScale(Layout.Height, LScale) + TextObject.Margins.Top + TextObject.Margins.Bottom;
      Result := True;
    finally
      Layout.Free;
    end;
  end;
end;

procedure TPresentedTextControl.Change;
begin
  if not FIsChanging and ([csLoading, csDestroying] * ComponentState = []) then
  begin
    FIsChanging := True;
    try
      DoChanged;
      ResultingTextSettings.IsAdjustChanged := False;
      ResultingTextSettings.IsChanged := False;
    finally
      FIsChanging := False;
    end;
  end;
end;

procedure TPresentedTextControl.DoStyleChanged;
var
  NewT: string;
begin
  inherited;
  if AutoTranslate and not Text.IsEmpty then
  begin
    NewT := Translate(Text);
    if not(csDesigning in ComponentState) then
      Text := NewT;
  end;
end;

function TPresentedTextControl.TextStored: Boolean;
begin
  Result := (not Text.IsEmpty and not ActionClient) or (not (ActionClient and (ActionLink <> nil) and
    ActionLink.CaptionLinked and (Action is TContainedAction)));
end;

procedure TPresentedTextControl.Loaded;
begin
  inherited;
  Change;
  FTextSettingsInfo.Design := csDesigning in ComponentState;
end;

function TPresentedTextControl.GetText: string;
begin
  Result := FText;
end;

procedure TPresentedTextControl.SetPrefixStyle(const Value: TPrefixStyle);
begin
  if FPrefixStyle <> Value then
  begin
    FPrefixStyle := Value;
    if FText.Contains('&') then
    begin
      ResultingTextSettings.IsAdjustChanged := True;
      if (FUpdating = 0) and ([csUpdating, csLoading, csDestroying] * ComponentState = []) then
      begin
        ApplyStyleLookup;
        Change;
      end;
    end;
  end;
end;

procedure TPresentedTextControl.SetText(const Value: string);
var
  AccelKeyService: IFMXAcceleratorKeyRegistryService;
begin
  if FText <> Value then
  begin
    FText := Value;

    if TPlatformServices.Current.SupportsPlatformService(IFMXAcceleratorKeyRegistryService, AccelKeyService) then
    begin
      AccelKeyService.UnregisterReceiver(Root, Self);
      FAcceleratorKey := #0;
      FAcceleratorKeyIndex := -1;
      AccelKeyService.RegisterReceiver(Root, Self);
    end;

    ResultingTextSettings.IsAdjustChanged := True;
    if not IsUpdating and ([csUpdating, csLoading, csDestroying] * ComponentState = []) then
    begin
      ApplyStyleLookup;
      Change;
      DoTextChanged;
    end;
  end;
end;

procedure TPresentedTextControl.SetTextInternal(const Value: string);
begin
  if FText <> Value then
  begin
    FText := Value;
    ApplyStyleLookup;
    Change;
  end;
end;

procedure TPresentedTextControl.SetStyledSettings(const Value: TStyledSettings);
begin
  FTextSettingsInfo.StyledSettings := Value;
end;

function TPresentedTextControl.GetAcceleratorChar: Char;
var
  AccelKeyService: IFMXAcceleratorKeyRegistryService;
begin
  if (FAcceleratorKeyIndex < 0) and TPlatformServices.Current.SupportsPlatformService(IFMXAcceleratorKeyRegistryService,
    AccelKeyService) then
    AccelKeyService.ExtractAcceleratorKey(Text, FAcceleratorKey, FAcceleratorKeyIndex);

  Result := FAcceleratorKey;
end;

function TPresentedTextControl.GetAcceleratorCharIndex: Integer;
var
  AccelKeyService: IFMXAcceleratorKeyRegistryService;
begin
  if (FAcceleratorKeyIndex < 0) and TPlatformServices.Current.SupportsPlatformService(IFMXAcceleratorKeyRegistryService,
    AccelKeyService) then
    AccelKeyService.ExtractAcceleratorKey(Text, FAcceleratorKey, FAcceleratorKeyIndex);

  Result := FAcceleratorKeyIndex;
end;

function TPresentedTextControl.GetData: TValue;
begin
  Result := Text;
end;

procedure TPresentedTextControl.SetData(const Value: TValue);
begin
  if Value.IsEmpty then
    Text := ''
  else
    Text := Value.ToString;
end;

function TPresentedTextControl.GetFont: TFont;
begin
  Result := FTextSettingsInfo.TextSettings.Font;
end;

procedure TPresentedTextControl.SetFont(const Value: TFont);
begin
  FTextSettingsInfo.TextSettings.Font := Value;
end;

function TPresentedTextControl.GetFontColor: TAlphaColor;
begin
  Result := FTextSettingsInfo.TextSettings.FontColor;
end;

function TPresentedTextControl.GetResultingTextSettings: TTextSettings;
begin
  Result := FTextSettingsInfo.ResultingTextSettings;
end;

procedure TPresentedTextControl.SetFontColor(const Value: TAlphaColor);
begin
  FTextSettingsInfo.TextSettings.FontColor := Value;
end;

function TPresentedTextControl.GetTextAlign: TTextAlign;
begin
  Result := FTextSettingsInfo.TextSettings.HorzAlign;
end;

procedure TPresentedTextControl.SetTextAlign(const Value: TTextAlign);
begin
  FTextSettingsInfo.TextSettings.HorzAlign := Value;
end;

function TPresentedTextControl.GetVertTextAlign: TTextAlign;
begin
  Result := FTextSettingsInfo.TextSettings.VertAlign;
end;

procedure TPresentedTextControl.SetVertTextAlign(const Value: TTextAlign);
begin
  FTextSettingsInfo.TextSettings.VertAlign := Value;
end;

function TPresentedTextControl.GetWordWrap: Boolean;
begin
  Result := FTextSettingsInfo.TextSettings.WordWrap;
end;

procedure TPresentedTextControl.SetWordWrap(const Value: Boolean);
begin
  FTextSettingsInfo.TextSettings.WordWrap := Value;
end;

function TPresentedTextControl.StyledSettingsStored: Boolean;
begin
  Result := StyledSettings <> DefaultStyledSettings;
end;

function TPresentedTextControl.ToString: string;
begin
  Result := Format('%s ''%s''', [inherited ToString, FText]);
end;

procedure TPresentedTextControl.TriggerAcceleratorKey;
begin
  SetFocus;
end;

procedure TPresentedTextControl.UpdateTextObject(const TextControl: TControl; const Str: string);
var
  Caption: ICaption;
begin
  if TextControl <> nil then
  begin
    if TextControl is TText then
    begin
      TText(TextControl).PrefixStyle := FPrefixStyle;
      TText(TextControl).Text := Str;
      TText(TextControl).Width := Min(TText(TextControl).Width, Width - TText(TextControl).Position.X - 5);
    end;
    if Supports(TextControl, ICaption, Caption) then
      Caption.Text := Str;
    TextControl.UpdateEffects;
    UpdateEffects;
    TextControl.Repaint;
  end;
end;

function TPresentedTextControl.GetDefaultTextSettings: TTextSettings;
begin
  Result := FTextSettingsInfo.DefaultTextSettings;
end;

function TPresentedTextControl.GetTextSettings: TTextSettings;
begin
  Result := FTextSettingsInfo.TextSettings;
end;

function TPresentedTextControl.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TTextControlTextSettings;
end;

procedure TPresentedTextControl.SetTextSettings(const Value: TTextSettings);
begin
  FTextSettingsInfo.TextSettings.Assign(Value);
end;

function TPresentedTextControl.GetStyledSettings: TStyledSettings;
begin
  Result := FTextSettingsInfo.StyledSettings;
end;

function TPresentedTextControl.GetTrimming: TTextTrimming;
begin
  Result := FTextSettingsInfo.TextSettings.Trimming;
end;

procedure TPresentedTextControl.SetTrimming(const Value: TTextTrimming);
begin
  FTextSettingsInfo.TextSettings.Trimming := Value;
end;

{ TPanel }

constructor TPanel.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TPanel.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

function TPanel.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(120, 120);
end;

{ TCalloutPanel }

constructor TCalloutPanel.Create(AOwner: TComponent);
begin
  inherited;
  FCalloutWidth := DefaultCalloutWidth;
  FCalloutLength := DefaultCalloutLength;
  FCalloutPosition := DefaultCalloutPosition;
  FUpdatingPadding := False;
  FSavedPadding := TRectF.Empty;
  UpdatePadding;
end;

procedure TCalloutPanel.FreeStyle;
begin
  FCalloutRect := nil;
  inherited;
end;

procedure TCalloutPanel.PaddingChanged;
begin
  inherited;
  if not FUpdatingPadding then
    SavePadding;
end;

procedure TCalloutPanel.RestorePadding;
begin
  Padding.Rect := FSavedPadding;
end;

procedure TCalloutPanel.ApplyStyle;
begin
  inherited;
  FCalloutRect := nil;
  if not FindStyleResource<TCalloutRectangle>('Background', FCalloutRect) and (ResourceControl is TCalloutRectangle) then
    FCalloutRect := TCalloutRectangle(ResourceControl);
  UpdateCallout;
end;

procedure TCalloutPanel.SavePadding;
begin
  if not SameValue(FCalloutLength, Padding.Top) then
    FSavedPadding.Top := Padding.Top;

  if not SameValue(FCalloutLength, Padding.Bottom) then
    FSavedPadding.Bottom := Padding.Bottom;

  if not SameValue(FCalloutLength, Padding.Left) then
    FSavedPadding.Left := Padding.Left;

  if not SameValue(FCalloutLength, Padding.Right) then
    FSavedPadding.Right := Padding.Right;
end;

procedure TCalloutPanel.SetCalloutLength(const Value: Single);
begin
  if FCalloutLength <> Value then
  begin
    FCalloutLength := Value;
    UpdatePadding;
    UpdateCallout;
  end;
end;

procedure TCalloutPanel.SetCalloutPosition(const Value: TCalloutPosition);
begin
  if FCalloutPosition <> Value then
  begin
    FCalloutPosition := Value;
    UpdatePadding;
    UpdateCallout;
  end;
end;

procedure TCalloutPanel.SetCalloutWidth(const Value: Single);
begin
  if FCalloutWidth <> Value then
  begin
    FCalloutWidth := Value;
    UpdateCallout;
  end;
end;

procedure TCalloutPanel.UpdateCallout;
begin
  if FCalloutRect <> nil then
  begin
    FCalloutRect.CalloutWidth := CalloutWidth;
    FCalloutRect.CalloutLength := CalloutLength;
    FCalloutRect.CalloutPosition := CalloutPosition;
    FCalloutRect.CalloutOffset := CalloutOffset;
  end;
end;

procedure TCalloutPanel.UpdatePadding;
begin
  FUpdatingPadding := True;
  try
    RestorePadding;
    case FCalloutPosition of
      TCalloutPosition.Top:
        Padding.Top := FCalloutLength;
      TCalloutPosition.Left:
        Padding.Left := FCalloutLength;
      TCalloutPosition.Bottom:
        Padding.Bottom := FCalloutLength;
      TCalloutPosition.Right:
        Padding.Right := FCalloutLength;
    end;
  finally
    FUpdatingPadding := False;
  end;
end;

procedure TCalloutPanel.SetCalloutOffset(const Value: Single);
begin
  if FCalloutOffset <> Value then
  begin
    FCalloutOffset := Value;
    UpdateCallout;
  end;
end;

{ TStatusBar }

constructor TStatusBar.Create(AOwner: TComponent);
begin
  inherited;
  FShowSizeGrip := True;
  Align := TAlignLayout.Bottom;
  SetAcceptsControls(True);
end;

procedure TStatusBar.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

function TStatusBar.DoHint: Boolean;
begin
  if Assigned(FOnHint) then
  begin
    FOnHint(Self);
    Result := True;
  end
  else
    Result := False;
end;

procedure TStatusBar.DoRootChanging(const NewRoot: IRoot);
var
  LHintRegistry: IHintRegistry;
begin
  inherited;

  if Supports(Root, IHintRegistry, LHintRegistry) then
    LHintRegistry.UnregisterHintReceiver(Self);
  if Supports(NewRoot, IHintRegistry, LHintRegistry) then
    LHintRegistry.RegisterHintReceiver(Self);

end;

function TStatusBar.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(120, 22);
end;

procedure TStatusBar.ApplyStyle;
var
  SizeGrip: TControl;
begin
  inherited;
  if FindStyleResource<TControl>('sizegrip', SizeGrip) then
  begin
    SizeGrip.Visible := FShowSizeGrip;
    if not (csDesigning in ComponentState) then
    begin
      SizeGrip.Locked := False;
      SizeGrip.HitTest := True;
    end;
  end;
end;

procedure TStatusBar.SetShowSizeGrip(const Value: Boolean);
begin
  if FShowSizeGrip <> Value then
  begin
    FShowSizeGrip := Value;
    ApplyStyleLookup;
  end;
end;

procedure TStatusBar.TriggerOnHint;
begin
  if AutoHint and not (csDesigning in ComponentState) then
    DoHint;
end;

{ TToolBar }

constructor TToolBar.Create(AOwner: TComponent);
begin
  inherited;
  Align := TAlignLayout.Top;
end;

procedure TToolBar.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

procedure TToolBar.ApplyStyle;
begin
  inherited;
  if Supports(ResourceLink, ITintedObject, FTintObject) then
    FTintObject.TintColor := FTintColor;
end;

procedure TToolBar.FreeStyle;
begin
  FTintObject := nil;
  inherited;
end;

function TToolBar.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(120, 40);
end;

function TToolBar.IsTintColorStored: Boolean;
begin
  Result := FTintColor <> claNull;
end;

procedure TToolBar.SetTintColor(const Value: TAlphaColor);
begin
  if FTintColor <> Value then
  begin
    FTintColor := Value;
    if FTintObject <> nil then
      FTintObject.TintColor := FTintColor;
  end;
end;

{ TLabel }

type
  TLabelTextSettings = class (TTextSettingsInfo.TCustomTextSettings)
  public
    constructor Create(const AOwner: TPersistent); override;
  published
    property Font;
    property FontColor;
    property HorzAlign;
    property VertAlign;
    property WordWrap default True;
    property Trimming default TTextTrimming.Character;
  end;

{ TLabelTextSettings }

constructor TLabelTextSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  WordWrap := True;
  Trimming := TTextTrimming.Character;
end;

procedure TLabel.ApplyStyle;
begin
  inherited;
  if FNeedFitSize then
    FitSize;
end;

constructor TLabel.Create(AOwner: TComponent);
var
  DefaultValueService: IInterface;
  TrimmingDefault: TValue;
begin
  inherited;
  AutoTranslate := True;

  if (csDesigning in ComponentState)
    and SupportsPlatformService(IFMXDefaultPropertyValueService, DefaultValueService) then
  begin
    TrimmingDefault := IFMXDefaultPropertyValueService(DefaultValueService).GetDefaultPropertyValue(Self.ClassName, 'trimming');
    if not TrimmingDefault.IsEmpty then
      Trimming := TrimmingDefault.AsType<TTextTrimming>;
  end;

  WordWrap := True;
  HitTest := False;
  SetAcceptsControls(False);
end;

procedure TLabel.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

procedure TLabel.DoChanged;
begin
  if FITextSettings <> nil then
    FITextSettings.TextSettings.BeginUpdate;
  try
    inherited;
    if (FITextSettings <> nil) and AutoSize then
      FITextSettings.TextSettings.Trimming := TTextTrimming.None;
  finally
    if FITextSettings <> nil then
      FITextSettings.TextSettings.EndUpdate;
  end;
  if not (csLoading in ComponentState) and AutoSize and ResultingTextSettings.IsAdjustChanged then
    FitSize
end;

function TLabel.GetDefaultSize: TSizeF;
var
  DeviceInfo: IDeviceBehavior;
begin
  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior, DeviceInfo, Self) then
    case DeviceInfo.GetOSPlatform(Self) of
      TOSPlatform.Windows:
        Result := TSizeF.Create(120, 17);
      TOSPlatform.OSX:
        Result := TSizeF.Create(120, 17);
      TOSPlatform.iOS:
        Result := TSize.Create(82, 21);
      TOSPlatform.Android:
        Result := TSize.Create(82, 23);
    end
  else
    Result := TSizeF.Create(120, 17);
end;

function TLabel.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TLabelTextSettings;
end;

procedure TLabel.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FIsPressed := True;
    StartTriggerAnimation(Self, 'IsPressed');
    ApplyTriggerEffect(Self, 'IsPressed');
  end;
end;

procedure TLabel.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (Button = TMouseButton.mbLeft) and (FIsPressed) then
  begin
    FIsPressed := False;
    StartTriggerAnimation(Self, 'IsPressed');
    ApplyTriggerEffect(Self, 'IsPressed');
  end;
end;

procedure TLabel.Resize;
begin
  inherited;
  if FAutoSize then
    FitSize;
end;

procedure TLabel.FitSize;
var
  LSize: TSizeF;
  Rect: TRectF;
begin
  if not FInFitSize and (not (Align in [TAlignLayout.Client, TAlignLayout.Contents])) then
  begin
    FInFitSize := True;
    try
      if CalcTextObjectSize(Width, LSize) then
      begin
        FNeedFitSize := False;
        Rect.TopLeft := Position.Point;
        if not (Align in [TAlignLayout.Top, TAlignLayout.Bottom, TAlignLayout.MostTop, TAlignLayout.MostBottom,
          TAlignLayout.VertCenter]) then
          if Text = '' then
            Rect.Width := 0
          else
            Rect.Width := LSize.cx
        else
          Rect.Width := Width;
        if not (Align in [TAlignLayout.Left, TAlignLayout.Right, TAlignLayout.MostLeft, TAlignLayout.MostRight,
          TAlignLayout.HorzCenter]) then
          Rect.Height := LSize.cy
        else
          Rect.Height := Height;
        BoundsRect := Rect;
      end
      else
        FNeedFitSize := True;
    finally
      FInFitSize := False;
    end;
  end;
end;

procedure TLabel.SetAutoSize(const Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    if FAutoSize then
      FitSize;
  end;
end;

procedure TLabel.SetFocusControl(const Value: TControl);
begin
  FFocusControl := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TLabel.TriggerAcceleratorKey;
var
  LControl: TControl;
  LReceiver: IAcceleratorKeyReceiver;
begin
  LControl := FFocusControl;
  if LControl <> nil then
    if Supports(LControl, IAcceleratorKeyReceiver, LReceiver) then
      LReceiver.TriggerAcceleratorKey
    else
      LControl.SetFocus;
end;

procedure TLabel.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FFocusControl) then
    FFocusControl := nil;
end;

type
  TButtonFontColors = class (TFontColorForState)
  protected
    function GetCurrentColor(const Index: TFontColorForState.TIndex): TAlphaColor; override;
  published
    property Normal;
    property Hot;
    property Pressed;
    property Focused;
  end;

  TButtonSettings = class (TTextSettingsInfo.TCustomTextSettings)
  protected
    function GetTextColorsClass: TFontColorForStateClass; override;
  public
    constructor Create(const AOwner: TPersistent); override;
  published
    property Font;
    property FontColor;
    property FontColorForState;
    property HorzAlign default TTextAlign.Center;
    property VertAlign default TTextAlign.Center;
    property WordWrap default False;
    property Trimming default TTextTrimming.Character;
  end;

{ TButtonFontColors }

function TButtonFontColors.GetCurrentColor(const Index: TFontColorForState.TIndex): TAlphaColor;
var
  LColors: TFontColorForState;
begin
  Result := inherited GetCurrentColor(Index);
  if (Result = claNull) and (Owner is TTextSettingsInfo.TBaseTextSettings) and
    (TTextSettingsInfo.TBaseTextSettings(Owner).Info.DefaultTextSettings <> Owner) and
    (TTextSettingsInfo.TBaseTextSettings(Owner).Info.DefaultTextSettings is TButtonSettings) then
  begin
    LColors := TButtonSettings(TTextSettingsInfo.TBaseTextSettings(Owner).Info.DefaultTextSettings).FontColorForState;
    Result := LColors.CurrentColor[Index];
  end;
end;

{ TButtonSettings }

constructor TButtonSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  WordWrap := False;
  HorzAlign := TTextAlign.Center;
  Trimming := TTextTrimming.Character;
end;

function TButtonSettings.GetTextColorsClass: TFontColorForStateClass;
begin
  Result := TButtonFontColors;
end;

{ TCustomButton }

constructor TCustomButton.Create(AOwner: TComponent);
var
  DefaultValueService: IInterface;
  TrimmingDefault: TValue;
begin
  inherited Create(AOwner);
  AutoTranslate := True;
  WordWrap := False;
  TextAlign := TTextAlign.Center;
  FImageLink := TGlyphImageLink.Create(Self);

  if (csDesigning in ComponentState)
    and SupportsPlatformService(IFMXDefaultPropertyValueService, DefaultValueService) then
  begin
    TrimmingDefault := IFMXDefaultPropertyValueService(DefaultValueService).GetDefaultPropertyValue(Self.ClassName, 'trimming');
    if not TrimmingDefault.IsEmpty then
      Trimming := TrimmingDefault.AsType<TTextTrimming>;
  end;

  AutoCapture := True;
  CanFocus := True;
  SetAcceptsControls(False);
end;

destructor TCustomButton.Destroy;
begin
  FImageLink.DisposeOf;
  inherited;
end;

function TCustomButton.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TButtonSettings;
end;

procedure TCustomButton.ApplyTriggers;
var
  SaveIsMouseOver: Boolean;
begin
  SaveIsMouseOver := IsMouseOver;
  if IsPressed and StaysPressed then
    FIsMouseOver := True;
  StartTriggerAnimation(Self, 'IsPressed');
  ApplyTriggerEffect(Self, 'IsPressed');
  FIsMouseOver := SaveIsMouseOver;
end;

function TCustomButton.GetDefaultTouchTargetExpansion: TRectF;
var
  DeviceSrv: IFMXDeviceService;
begin
  if SupportsPlatformService(IFMXDeviceService, DeviceSrv) and
    (TDeviceFeature.HasTouchScreen in DeviceSrv.GetFeatures) then
    Result := TRectF.Create(DefaultTouchTargetExpansion, DefaultTouchTargetExpansion, DefaultTouchTargetExpansion,
      DefaultTouchTargetExpansion)
  else
    Result := inherited;
end;

procedure TCustomButton.ActionChange(Sender: TBasicAction; CheckDefaults: Boolean);
begin
  if (Sender is TCustomAction) and not CheckDefaults then
  begin
    ImageIndex := TCustomAction(Sender).ImageIndex;
    if (TCustomAction(Sender).ActionList <> nil) and (TCustomAction(Sender).ActionList.Images is TCustomImageList) then
      Images := TCustomImageList(TCustomAction(Sender).ActionList.Images)
    else
      Images := nil;
  end;
  inherited;
end;

function TCustomButton.UpdateGlyphSize: Boolean;
const
  HeightSide = [TAlignLayout.Top, TAlignLayout.MostTop, TAlignLayout.Bottom, TAlignLayout.MostBottom,
    TAlignLayout.VertCenter, TAlignLayout.Horizontal];
  WidthSide = [TAlignLayout.Left, TAlignLayout.MostLeft, TAlignLayout.Right, TAlignLayout.MostRight,
    TAlignLayout.HorzCenter, TAlignLayout.Vertical];
var
  NewSize, Space: TSizeF;
  LControl: TControl;
begin
  Result := False;
  if (not FGlyphSize.IsZero) and (FGlyph <> nil) and (FGlyph.ParentControl <> nil) and
    (FGlyph.Align in HeightSide + WidthSide + [TAlignLayout.Center]) then
  begin
    Space := TSizeF.Create(0, 0);
    NewSize := FGlyphSize;
    LControl := FGlyph;
    while (LControl <> nil) and (LControl <> Self) do
    begin
      Space.cx := Space.cx + LControl.Margins.Left + LControl.Margins.Right;
      Space.cy := Space.cy + LControl.Margins.Top + LControl.Margins.Bottom;
      LControl := LControl.ParentControl;
      if LControl <> nil then
      begin
        Space.cx := Space.cx + LControl.Padding.Left + LControl.Padding.Right;
        Space.cy := Space.cy + LControl.Padding.Top + LControl.Padding.Bottom;
      end;
    end;
    if FGlyph.Align = TAlignLayout.Center then
    begin
      NewSize.cx := Max(0, Min(FGlyphSize.cx, Width - Space.cx));
      NewSize.cy := Max(0, Min(FGlyphSize.cy, Height - Space.cy));
    end
    else if FGlyph.Align in HeightSide then
      NewSize.cy := Max(0, Min(FGlyphSize.cy, Height - Space.cy))
    else
      NewSize.cx := Max(0, Min(FGlyphSize.cx, Width - Space.cx));

    Result := not (SameValue(NewSize.cx, FGlyph.Width, TEpsilon.FontSize) and
      SameValue(NewSize.cy, FGlyph.Height, TEpsilon.FontSize));
    if Result then
      FGlyph.Size.Size := NewSize;
  end;
end;

procedure TCustomButton.ApplyStyle;
var
  StyleObject: TFmxObject;
begin
  inherited;
  StyleObject := nil;
  if FindStyleResource<TFmxObject>('background', StyleObject) and Supports(StyleObject, ITintedObject, FTintObject) then
    FTintObject.TintColor := FTintColor;
  if FindStyleResource<TGlyph>('glyphstyle', FGlyph) then
  begin
    FGlyph.BeginUpdate;
    try
      FGlyph.Images := TCustomImageList(FImageLink.Images);
      FGlyph.ImageIndex := FImageLink.ImageIndex;
      if (FGlyph.Width > 0) and (FGlyph.Height > 0) then
        FGlyphSize := TSizeF.Create(FGlyph.Width, FGlyph.Height);
    finally
      FGlyph.EndUpdate;
    end;
    UpdateGlyphSize;
  end;
  StyleObject := nil;
  if FindStyleResource<TFmxObject>('icon', StyleObject) and Supports(StyleObject, ITintedObject) then
  begin
    FIconTintObject := StyleObject as ITintedObject;
    FIconTintObject.TintColor := FIconTintColor;
  end;
  if StyleObject is TControl then
  begin
    FIcon := TControl(StyleObject);
    FOldIconVisible := FIcon.Visible;
  end;
  ImagesChanged;
  if IsPressed then
    ApplyTriggers;
end;

procedure TCustomButton.FreeStyle;
var
  SavePressed: Boolean;
  SaveFocused: Boolean;
  SaveMouseOver: Boolean;
begin
  SavePressed := IsPressed;
  SaveFocused := IsFocused;
  SaveMouseOver := IsMouseOver;
  try
    if SavePressed or SaveFocused or SaveMouseOver then
    begin
      FIsFocused := False;
      FIsPressed := False;
      FIsMouseOver := False;
      ApplyTriggers;
    end
  finally
    FIsFocused := SaveFocused;
    FIsPressed := SavePressed;
    FIsMouseOver := SaveMouseOver;
  end;
  if FGlyph <> nil then
  begin
    FGlyph.ImageIndex := -1;
    FGlyph.Images := nil;
    FGlyph := nil;
  end;
  FTintObject := nil;
  FIconTintObject := nil;
  if FIcon <> nil then
  begin
    FIcon.Visible := FOldIconVisible;
    FIcon := nil;
  end;
  inherited;
end;

procedure TCustomButton.RestoreButtonState;
begin
  FIsPressed := False;
  ApplyTriggers;
end;

function TCustomButton.GetData: TValue;
begin
  Result := TValue.From<TNotifyEvent>(OnClick);
end;

function TCustomButton.GetDefaultSize: TSizeF;
var
  DeviceInfo: IDeviceBehavior;
begin
  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior, DeviceInfo, Self) then
    case DeviceInfo.GetOSPlatform(Self) of
      TOSPlatform.Windows:
        Result := TSizeF.Create(80, 22);
      TOSPlatform.OSX:
        Result := TSizeF.Create(80, 22);
      TOSPlatform.iOS:
        Result := TSizeF.Create(73, 44);
      TOSPlatform.Android:
        Result := TSizeF.Create(73, 44);
    end
  else
    Result := TSizeF.Create(80, 22);
end;

function TCustomButton.IsIconTintColorStored: Boolean;
begin
  Result := FIconTintColor <> claNull;
end;

function TCustomButton.IsPressedStored: Boolean;
begin
  Result := True;
end;

function TCustomButton.IsTintColorStored: Boolean;
begin
  Result := FTintColor <> claNull;
end;

procedure TCustomButton.SetData(const Value: TValue);
begin
  if Value.IsType<TNotifyEvent> then
    OnClick := Value.AsType<TNotifyEvent>();
end;

procedure TCustomButton.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if ((Key = vkReturn) or (KeyChar = ' ')) and (Shift = []) then
  begin
    Click;
    Key := 0;
    KeyChar := #0;
  end;
end;

procedure TCustomButton.DoRepeatTimer(Sender: TObject);
begin
  if (Root <> nil) and (Root.Captured <> nil) and (Root.Captured.GetObject = Self) then
    Click
  else
    FRepeatTimer.Enabled := False;
end;

procedure TCustomButton.DoRealign;
var
  GlyphChanged: Boolean;
  OldDisableAlign: Boolean;
begin
  inherited;
  OldDisableAlign := FDisableAlign;
  try
    FDisableAlign := True;
    GlyphChanged := UpdateGlyphSize;
  finally
    FDisableAlign := OldDisableAlign;
  end;
  if GlyphChanged then
  begin
    inherited;
    if csDesigning in ComponentState then
      Repaint;
  end;
end;

procedure TCustomButton.DoRepeatDelayTimer(Sender: TObject);
begin
  FRepeatTimer.OnTimer := DoRepeatTimer;
  FRepeatTimer.Interval := 100;
end;

procedure TCustomButton.DblClick;
begin
  inherited;
  Click;
end;

procedure TCustomButton.Click;
var
  O: TComponent;
begin
  inherited;
  if (Self <> nil) and (ModalResult <> mrNone) then
  begin
    O := Scene.GetObject;
    while O <> nil do
    begin
      if (O is TCommonCustomForm) then
      begin
        TCommonCustomForm(O).ModalResult := FModalResult;
        Break;
      end;
      O := O.Owner;
    end;
  end;
end;

procedure TCustomButton.ToggleStaysPressed;
begin
  IsPressed := not FIsPressed;
end;

procedure TCustomButton.TriggerAcceleratorKey;
begin
  inherited;
  Click;
end;

procedure TCustomButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FPressing := True;
    if FStaysPressed then
      ToggleStaysPressed
    else begin
      FIsPressed := True;
      if FRepeat then
      begin
        if FRepeatTimer = nil then
        begin
          FRepeatTimer := TTimer.Create(Self);
          FRepeatTimer.Interval := 500;
        end;
        FRepeatTimer.OnTimer := DoRepeatDelayTimer;
        FRepeatTimer.Enabled := True;
      end;
      ApplyTriggers;
    end;
  end;
end;

procedure TCustomButton.MouseMove(Shift: TShiftState; X, Y: Single);
var
  Inside: Boolean;
begin
  inherited;
  if (ssLeft in Shift) and FPressing then
  begin
    Inside := LocalRect.Contains(TPointF.Create(X, Y));
    if FIsPressed <> Inside then
    begin
      if not FStaysPressed then
      begin
        FIsPressed := Inside;
        ApplyTriggers;
      end;
    end;
  end;
end;

procedure TCustomButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if FPressing then
  begin
    if FRepeatTimer <> nil then
      FRepeatTimer.Enabled := False;
    FPressing := False;
    if not FStaysPressed or not LocalRect.Contains(TPointF.Create(X, Y)) then
      RestoreButtonState;
  end;
  inherited;
end;

procedure TCustomButton.SetIconTintColor(const Value: TAlphaColor);
begin
  if FIconTintColor <> Value then
  begin
    FIconTintColor := Value;
    if FIconTintObject <> nil then
      FIconTintObject.TintColor := FIconTintColor;
  end;
end;

procedure TCustomButton.SetIsPressed(const Value: Boolean);
begin
  if FStaysPressed then
  begin
    if Value <> FIsPressed then
    begin
      FIsPressed := Value;
      ApplyTriggers;
    end;
  end;
end;

procedure TCustomButton.SetStaysPressed(const Value: Boolean);
begin
  if not Value and FIsPressed then
    SetIsPressed(False);
  if FStaysPressed <> Value then
    FStaysPressed := Value;
end;

procedure TCustomButton.SetTintColor(const Value: TAlphaColor);
begin
  if FTintColor <> Value then
  begin
    FTintColor := Value;
    if FTintObject <> nil then
      FTintObject.TintColor := FTintColor;
  end;
end;

procedure TCustomButton.ImagesChanged;
begin
  if FGlyph <> nil then
  begin
    FGlyph.BeginUpdate;
    try
      FGlyph.ImageIndex := FImageLink.ImageIndex;
      FGlyph.Images := TCustomImageList(FImageLink.Images);
    finally
      FGlyph.EndUpdate;
    end;
    if FIcon <> nil then
      FIcon.Visible := not FGlyph.Visible;
    Repaint;
  end;
end;

function TCustomButton.ImageIndexStored: Boolean;
begin
  Result := ActionClient or (ImageIndex <> -1);
end;

function TCustomButton.GetImages: TCustomImageList;
begin
  Result := TCustomImageList(FImageLink.Images);
end;

procedure TCustomButton.SetImages(const Value: TCustomImageList);
begin
  FImageLink.Images := Value;
end;

function TCustomButton.GetImageIndex: TImageIndex;
begin
  Result := FImageLink.ImageIndex;
end;

procedure TCustomButton.SetImageIndex(const Value: TImageIndex);
begin
  FImageLink.ImageIndex := Value;
end;

function TCustomButton.GetImageList: TBaseImageList;
begin
  Result := GetImages;
end;

procedure TCustomButton.SetImageList(const Value: TBaseImageList);
begin
  ValidateInheritance(Value, TCustomImageList);
  SetImages(TCustomImageList(Value));
end;

{ TButton }

procedure TButton.AfterDialogKey(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Default and (Key = vkReturn)) or (Cancel and (Key = vkEscape)) then
  begin
    Click;
    Key := 0;
  end;
end;

{ TSpeedButton }

constructor TSpeedButton.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := False;
  TMessageManager.DefaultManager.SubscribeToMessage(TSpeedButtonGroupMessage, GroupMessageCall);
end;

destructor TSpeedButton.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TSpeedButtonGroupMessage, GroupMessageCall);
  inherited;
end;

function TSpeedButton.GetGroupName: string;
begin
  Result := FGroupName;
end;

procedure TSpeedButton.GroupMessageCall(const Sender: TObject; const M: TMessage);
begin
  if (GroupName <> '') and SameText(TSpeedButtonGroupMessage(M).Value, GroupName) and (Sender <> Self) and
     (Scene <> nil) and (not (Sender is TControl) or ((Sender as TControl).Scene = Scene)) then
    IsPressed := False;
end;

procedure TSpeedButton.ActionChange(Sender: TBasicAction; CheckDefaults: Boolean);
begin
  inherited;
  if Sender is TCustomAction then
  begin
    if (not CheckDefaults) or (not GetIsChecked) then
      SetIsChecked(TCustomAction(Sender).Checked);
    if (not CheckDefaults) or (GroupName = '') or (GroupName = '0') then
      GroupName := IntToStr(TCustomAction(Sender).GroupIndex);
  end;
end;

function GroupNameIsSet(AGroupName: string): Boolean;
begin
  AGroupName := AGroupName.Trim;
  Result := (not AGroupName.IsEmpty) and (AGroupName <> '0') and (AGroupName <> '-1');
end;

function TSpeedButton.GroupNameStored: Boolean;
begin
  if ActionClient and (ActionLink <> nil) and (Action is TContainedAction) then
    Result := False
  else
    Result := GroupNameIsSet(FGroupName);
end;

procedure TSpeedButton.SetGroupName(const Value: string);
var
  I: Integer;
  S: string;
begin
  S := Value.Trim;
  if FGroupName <> S then
  begin
    I := 0;
    if S.IsEmpty or TryStrToInt(S, I) then
    begin
      FGroupName := S;
      if ActionClient and (ActionLink <> nil) and (Action is TContainedAction) then
        TContainedAction(Action).GroupIndex := I;
    end
    else
    begin
      if ActionClient and (ActionLink <> nil) and (Action is TContainedAction) then
        raise EComponentError.Create(SInvalidPropertyValue);
      FGroupName := Value;
    end;
    if ([csLoading, csDesigning] * ComponentState = [csDesigning]) and GroupNameIsSet(FGroupName) then
      StaysPressed := True;
  end;
end;

function TSpeedButton.GetIsChecked: Boolean;
begin
  Result := IsPressed;
end;

function TSpeedButton.IsCheckedStored: Boolean;
begin
  Result := IsPressedStored;
end;

function TSpeedButton.IsPressedStored: Boolean;
begin
  Result := not (ActionClient and (ActionLink <> nil) and ActionLink.CheckedLinked and (Action is TContainedAction));
end;

procedure TSpeedButton.SetIsChecked(const Value: Boolean);
begin
  IsPressed := Value;
end;

procedure TSpeedButton.SetIsPressed(const Value: Boolean);
var
  M: TSpeedButtonGroupMessage;
begin
  if FStaysPressed then
  begin
    if FIsPressed <> Value then
    begin
      if not IsPressedStored then
      begin
        FIsPressed := Value;
        TContainedAction(Action).Checked := FIsPressed;
      end
      else
      begin
        // allows check/uncheck in design-mode
        if (csDesigning in ComponentState) and FIsPressed then
          FIsPressed := Value
        else
        begin
          FIsPressed := Value;
          { all group uncheck}
          if Value then
          begin
            M := TSpeedButtonGroupMessage.Create(GroupName);
            TMessageManager.DefaultManager.SendMessage(Self, M, True);
          end;
        end;
      end;
      // visual feedback
      ApplyTriggers;
    end;
  end;
end;

procedure TSpeedButton.ToggleStaysPressed;
begin
  if GroupName <> '' then
    IsPressed := True
  else
    IsPressed := not FIsPressed;
end;

{ TCustomCornerButton }

constructor TCustomCornerButton.Create(AOwner: TComponent);
begin
  inherited;
  FCorners := AllCorners;
  FXRadius := 3;
  FYRadius := 3;
  FSides := AllSides;
end;

destructor TCustomCornerButton.Destroy;
begin
  inherited;
end;

procedure TCustomCornerButton.ApplyStyle;
var
  Background: TRectangle;
begin
  inherited;
  if FindStyleResource<TRectangle>('Background', Background) then
  begin
    Background.CornerType := FCornerType;
    Background.Corners := FCorners;
    Background.XRadius := XRadius;
    Background.YRadius := YRadius;
    Background.Sides := FSides;
  end;
  if FindStyleResource<TRectangle>('SecondBackground', Background) then
  begin
    Background.CornerType := FCornerType;
    Background.Corners := FCorners;
    Background.XRadius := XRadius;
    Background.YRadius := YRadius;
    Background.Sides := FSides;
  end;
end;

function TCustomCornerButton.IsCornersStored: Boolean;
begin
  Result := FCorners <> AllCorners;
end;

function TCustomCornerButton.IsSidesStored: Boolean;
begin
  Result := FSides * AllSides <> [];
end;

procedure TCustomCornerButton.SetCorners(const Value: TCorners);
begin
  if FCorners <> Value then
  begin
    FCorners := Value;
    ApplyStyle;
  end;
end;

procedure TCustomCornerButton.SetCornerType(const Value: TCornerType);
begin
  if FCornerType <> Value then
  begin
    FCornerType := Value;
    ApplyStyle;
  end;
end;

procedure TCustomCornerButton.SetXRadius(const Value: Single);
begin
  if FXRadius <> Value then
  begin
    FXRadius := Value;
    ApplyStyle;
  end;
end;

procedure TCustomCornerButton.SetYRadius(const Value: Single);
begin
  if FYRadius <> Value then
  begin
    FYRadius := Value;
    ApplyStyle;
  end;
end;

procedure TCustomCornerButton.SetSides(const Value: TSides);
begin
  if FSides <> Value then
  begin
    FSides := Value;
    ApplyStyle;
  end;
end;

type
  TCheckBoxSettings = class (TTextSettingsInfo.TCustomTextSettings)
  public
    constructor Create(const AOwner: TPersistent); override;
  published
    property Font;
    property FontColor;
    property HorzAlign default TTextAlign.Leading;
    property VertAlign default TTextAlign.Center;
    property WordWrap default False;
    property Trimming;
  end;

{ TCheckBoxSettings }

constructor TCheckBoxSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  WordWrap := False;
end;

{ TCheckBox }

constructor TCheckBox.Create(AOwner: TComponent);
begin
  inherited;
  AutoTranslate := True;
  AutoCapture := True;
  CanFocus := True;
  TextAlign := TTextAlign.Leading;
  MinClipWidth := 16;
  MinClipHeight := 16;
  SetAcceptsControls(False);
end;

function TCheckBox.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TCheckBoxSettings;
end;

function TCheckBox.GetData: TValue;
begin
  Result := IsChecked;
end;

function TCheckBox.GetDefaultSize: TSizeF;
var
  DefMetricsSrv: IFMXDefaultMetricsService;
begin
  if SupportsPlatformService(IFMXDefaultMetricsService, DefMetricsSrv) and
    DefMetricsSrv.SupportsDefaultSize(TComponentKind.CheckBox) then
    Result := TSizeF.Create(DefMetricsSrv.GetDefaultSize(TComponentKind.CheckBox).Width,
      DefMetricsSrv.GetDefaultSize(TComponentKind.CheckBox).Height)
  else
    Result := TSizeF.Create(120, 19);
end;

function TCheckBox.TryValueIsChecked(const Value: TValue; out IsChecked: Boolean): Boolean;
var
  S: string;
  B: Boolean;
begin
  if Value.IsType<Boolean> then
  begin
    IsChecked := Value.AsType<Boolean>;
    Result := True;
  end
  else if Value.IsType<string> then
  begin
    S := Value.AsType<string>;
    if (S <> '') and TryStrToBool(S, B) then
      IsChecked := B
    else
      IsChecked := False;
    Result := True;
  end
  else
    Result := False;
end;

procedure TCheckBox.SetData(const Value: TValue);
var
  B: Boolean;
begin
  if TryValueIsChecked(Value, B) then
    IsChecked := B
  else if Value.IsType<TNotifyEvent> then
    OnChange := Value.AsType<TNotifyEvent>()
  else
    IsChecked := False;
end;

procedure TCheckBox.DoExit;
begin
  inherited;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    TLinkObservers.EditLinkUpdate(Observers);
  if Observers.IsObserving(TObserverMapping.ControlValueID) then
    TLinkObservers.ControlValueUpdate(Observers);
end;

procedure TCheckBox.ActionChange(Sender: TBasicAction; CheckDefaults: Boolean);
begin
  inherited;
  if Sender is TCustomAction then
    if (not CheckDefaults) or (not IsChecked) then
      IsChecked := TCustomAction(Sender).Checked;
end;

procedure TCheckBox.ApplyStyle;
begin
  inherited;
  if IsChecked then
    StartTriggerAnimation(Self, 'IsChecked');
end;

procedure TCheckBox.FreeStyle;

  procedure ResetTrigger(var StateVar: Boolean; const Trigger: string);
  begin
    if StateVar then
      try
        StateVar := False;
        StartTriggerAnimation(Self, Trigger);
      finally
        StateVar := True;
      end;
  end;

begin
  ResetTrigger(FIsChecked, 'IsChecked');
  ResetTrigger(FIsPressed, 'IsActive');
  ResetTrigger(FIsFocused, 'IsFocused');
  ResetTrigger(FIsMouseOver, 'IsMouseOver');
  inherited;
end;

procedure TCheckBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit;
    FPressing := True;
    FIsPressed := True;
    FIsPan := False;
    StartTriggerAnimation(Self, 'IsPressed');
  end;
end;

procedure TCheckBox.MouseMove(Shift: TShiftState; X, Y: Single);
const
  ThresholdMouseTap = 5;
var
  Distance: Single;
begin
  inherited;
  if (ssLeft in Shift) and FPressing then
  begin
    if FIsPressed <> LocalRect.Contains(PointF(X, Y)) then
    begin
      FIsPressed := LocalRect.Contains(PointF(X, Y));
      StartTriggerAnimation(Self, 'IsPressed');
    end;
    if not FIsPan then
    begin
      Distance := LocalToScreen(PressedPosition).Distance(LocalToScreen(TPointF.Create(X, Y)));
      if Distance > ThresholdMouseTap then
        FIsPan := True;
    end;
  end;
end;

procedure TCheckBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if FPressing then
  begin
    inherited;
    FPressing := False;
    FIsPressed := False;

    if LocalRect.Contains(PointF(X, Y)) then
    begin
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
      begin
        if TLinkObservers.EditLinkEdit(Observers) then
          TLinkObservers.EditLinkModified(Observers)
        else
        begin
          TLinkObservers.EditLinkReset(Observers);
          Exit;
        end;
      end;
      // Avoiding a changing "Checked" state if user moves cursor of finger through the control.
      case TOSVersion.Platform of
        TOSVersion.TPlatform.pfiOS,
        TOSVersion.TPlatform.pfAndroid:
          if not FIsPan then
            IsChecked := not IsChecked;
      else
        IsChecked := not IsChecked;
      end;
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
        TLinkObservers.EditLinkTrackUpdate(Observers);
      if Observers.IsObserving(TObserverMapping.ControlValueID) then
      begin
        TLinkObservers.ControlValueModified(Observers);
        TLinkObservers.ControlValueTrackUpdate(Observers);
      end;
    end
  end;
end;

function TCheckBox.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True;
  if ID = TObserverMapping.ControlValueID then
    Result := True;
end;

procedure TCheckBox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if (KeyChar = ' ') then
  begin
    Click; // Emulate mouse click to perform Action.OnExecute
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
    begin
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit;
      if TLinkObservers.EditLinkEdit(Observers) then
        TLinkObservers.EditLinkModified(Observers)
      else
      begin
        TLinkObservers.EditLinkReset(Observers);
        Exit;
      end;
    end;
    IsChecked := not IsChecked;
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      TLinkObservers.EditLinkTrackUpdate(Observers);
    if Observers.IsObserving(TObserverMapping.ControlValueID) then
    begin
      TLinkObservers.ControlValueModified(Observers);
      TLinkObservers.ControlValueTrackUpdate(Observers);
    end;
    KeyChar := #0;
  end;
end;

function TCheckBox.GetIsChecked: Boolean;
begin
  Result := FIsChecked;
end;

function TCheckBox.IsCheckedStored: Boolean;
begin
  Result := not (ActionClient and (ActionLink <> nil) and ActionLink.CheckedLinked and (Action is TContainedAction));
end;

procedure TCheckBox.SetIsChecked(const Value: Boolean);
var
  Llinked: Boolean;
begin
  if FIsChecked <> Value then
  begin
    Llinked := not IsCheckedStored;
    FIsChecked := Value;
    if Llinked then
      TContainedAction(Action).Checked := FIsChecked;
    StartTriggerAnimation(Self, 'IsChecked');
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TCheckBox.TriggerAcceleratorKey;
begin
  inherited;
  SetIsChecked(not GetIsChecked);
end;

{ TRadioButtonGroupMessage }

constructor TRadioButtonGroupMessage.Create(const AGroupName: string);
begin
  inherited Create;
  FGroupName := AGroupName;
end;

{ TRadioButton }

constructor TRadioButton.Create(AOwner: TComponent);
begin
  inherited;
  AutoTranslate := True;
  AutoCapture := True;
  CanFocus := True;
  TextAlign := TTextAlign.Leading;
  MinClipWidth := 16;
  MinClipHeight := 16;
  SetAcceptsControls(False);
  TMessageManager.DefaultManager.SubscribeToMessage(TRadioButtonGroupMessage, GroupMessageCall);
end;

destructor TRadioButton.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TRadioButtonGroupMessage, GroupMessageCall);
  inherited;
end;

function TRadioButton.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TCheckBoxSettings;
end;

function TRadioButton.GetData: TValue;
begin
  Result := IsChecked;
end;

function TRadioButton.GetDefaultSize: TSizeF;
var
  DefMetricsSrv: IFMXDefaultMetricsService;
begin
  if SupportsPlatformService(IFMXDefaultMetricsService, DefMetricsSrv) and
    DefMetricsSrv.SupportsDefaultSize(TComponentKind.RadioButton) then
    Result := TSizeF.Create(DefMetricsSrv.GetDefaultSize(TComponentKind.RadioButton).Width,
      DefMetricsSrv.GetDefaultSize(TComponentKind.RadioButton).Height)
  else
    Result := TSizeF.Create(120, 19);
end;

procedure TRadioButton.SetData(const Value: TValue);
begin
  if Value.IsType<TNotifyEvent> then
    OnChange := Value.AsType<TNotifyEvent>()
  else if Value.IsType<Boolean> then
    IsChecked := Value.AsType<Boolean>
  else
    IsChecked := False;
end;

procedure TRadioButton.ActionChange(Sender: TBasicAction;
  CheckDefaults: Boolean);
begin
  inherited;
  if Sender is TCustomAction then
  begin
    if (not CheckDefaults) or (not IsChecked) then
      IsChecked := TCustomAction(Sender).Checked;
    if (not CheckDefaults) or (GroupName = '') or (GroupName = '0') then
      GroupName := IntToStr(TCustomAction(Sender).GroupIndex);
  end;
end;

procedure TRadioButton.ApplyStyle;
begin
  inherited;
  if IsChecked then
    StartTriggerAnimation(Self, 'IsChecked');
end;

procedure TRadioButton.FreeStyle;

  procedure ResetTrigger(var StateVar: Boolean; const Trigger: string);
  begin
    if StateVar then
      try
        StateVar := False;
        StartTriggerAnimation(Self, Trigger);
      finally
        StateVar := True;
      end;
  end;

begin
  ResetTrigger(FIsChecked, 'IsChecked');
  ResetTrigger(FIsFocused, 'IsFocused');
  ResetTrigger(FIsPressed, 'IsPressed');
  ResetTrigger(FIsMouseOver, 'IsMouseOver');
  inherited;
end;

procedure TRadioButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FPressing := True;
    FIsPressed := True;
    StartTriggerAnimation(Self, 'IsPressed');
  end;
end;

procedure TRadioButton.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (ssLeft in Shift) and (FPressing) then
  begin
    if FIsPressed <> LocalRect.Contains(PointF(X, Y)) then
    begin
      FIsPressed := LocalRect.Contains(PointF(X, Y));
      StartTriggerAnimation(Self, 'IsPressed');
    end;
  end;
end;

procedure TRadioButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FPressing then
  begin
    FPressing := False;
    FIsPressed := False;
    if not IsChecked then
    begin
      if LocalRect.Contains(PointF(X, Y)) then
      begin
        IsChecked := not IsChecked;
      end
    end;
  end;
end;

procedure TRadioButton.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if (KeyChar = ' ') and not IsChecked then
  begin
    Click; // Emulate mouse click to perform Action.OnExecute
    IsChecked := not IsChecked;
    KeyChar := #0;
  end;
end;

function TRadioButton.GetIsChecked: Boolean;
begin
  Result := FIsChecked;
end;

function TRadioButton.IsCheckedStored: Boolean;
begin
  Result := not (ActionClient and (ActionLink <> nil) and ActionLink.CheckedLinked and (Action is TContainedAction));
end;

procedure TRadioButton.SetIsChecked(const Value: Boolean);
var
  M: TRadioButtonGroupMessage;
begin
  if FIsChecked <> Value then
  begin
    if not IsCheckedStored then
    begin
      FIsChecked := Value;
      TContainedAction(Action).Checked := FIsChecked;
    end
    else
    begin
      // allows check/uncheck in design-mode
      if (csDesigning in ComponentState) and FIsChecked then
        FIsChecked := Value
      else
      begin
        FIsChecked := Value;
        if Value then
        begin
          M := TRadioButtonGroupMessage.Create(GroupName);
          TMessageManager.DefaultManager.SendMessage(Self, M, True);
        end;
      end;
    end;
    // visual feedback
    StartTriggerAnimation(Self, 'IsChecked');
    { event }
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TRadioButton.TriggerAcceleratorKey;
begin
  inherited;
  SetIsChecked(True);
end;

function TRadioButton.GetGroupName: string;
begin
  Result := FGroupName;
end;

procedure TRadioButton.GroupMessageCall(const Sender: TObject; const M: TMessage);
begin
  if SameText(TRadioButtonGroupMessage(M).GroupName, GroupName) and (Sender <> Self) and (Scene <> nil) and
     (not (Sender is TControl) or ((Sender as TControl).Scene = Scene)) then
    IsChecked := False;
end;

function TRadioButton.GroupNameStored: Boolean;
begin
  if ActionClient and (ActionLink <> nil) and (Action is TContainedAction) then
    Result := False
  else
    Result := GroupNameIsSet(FGroupName);
end;

procedure TRadioButton.SetGroupName(const Value: string);
var
  I: Integer;
  S: string;
begin
  S := Value.Trim;
  if FGroupName <> S then
  begin
    I := 0;
    if S.IsEmpty or TryStrToInt(S, I) then
    begin
      FGroupName := S;
      if ActionClient and (ActionLink <> nil) and (Action is TContainedAction) then
        TContainedAction(Action).GroupIndex := I;
    end
    else
    begin
      if ActionClient and (ActionLink <> nil) and (Action is TContainedAction) then
        raise EComponentError.Create(SInvalidPropertyValue);
      FGroupName := Value;
    end;
  end;
end;

{ TSizeGrip }

constructor TSizeGrip.Create(AOwner: TComponent);
begin
  inherited;
  SetAcceptsControls(False);
end;

procedure TSizeGrip.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

{ TGroupBox }

constructor TGroupBox.Create(AOwner: TComponent);
begin
  inherited;
  AutoTranslate := True;
  CanFocus := False;
  StyledSettings := AllStyledSettings;
end;

type
  TGroupBoxSettings = class (TTextSettingsInfo.TCustomTextSettings)
  public
    constructor Create(const AOwner: TPersistent); override;
  published
    property Font;
    property FontColor;
  end;

{ TGroupBoxSettings }

constructor TGroupBoxSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  WordWrap := False;
  HorzAlign := TTextAlign.Leading;
  VertAlign := TTextAlign.Center;
end;

function TGroupBox.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TGroupBoxSettings;
end;

function TGroupBox.StyledSettingsStored: Boolean;
begin
  Result := StyledSettings <> AllStyledSettings;
end;

procedure TGroupBox.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

function TGroupBox.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(120, 100);
end;

{ TSplitter }

constructor TSplitter.Create(AOwner: TComponent);
begin
  inherited;
  FMinSize := 20;
  FShowGrip := True;
  AutoCapture := True;
  Align := TAlignLayout.Left;
  Cursor := crHSplit;
  SetAcceptsControls(False);
end;

procedure TSplitter.ApplyStyle;
var
  Grip: TControl;
begin
  inherited;
  if FindStyleResource<TControl>('grip', Grip) then
    Grip.Visible := FShowGrip;
end;

procedure TSplitter.Paint;
var
  R: TRectF;
begin
  inherited;
  if (csDesigning in ComponentState) and not Locked and not FInPaintTo then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.DrawDashRect(R, 0, 0, AllCorners, AbsoluteOpacity, $A0909090);
  end;
end;

procedure TSplitter.SetAlign(const Value: TAlignLayout);
var
  Thickness: Single;
begin
  Thickness := Min(Width, Height);
  inherited;
  if Align in [TAlignLayout.Top, TAlignLayout.Bottom] then
    Cursor := crVSplit
  else
    Cursor := crHSplit;
  SetBounds(Position.X, Position.Y, Thickness, Thickness);
end;

function TSplitter.FindObject: TControl;
var
  ParentRelativePoint: TPointF;
  I: Integer;
  LRect: TRectF;
  LBounds: TBounds;
  IsHorizontalAlign, IsVerticalAlign: Boolean;
begin
  Result := nil;
  ParentRelativePoint := Position.Point;
  case Align of
    TAlignLayout.Left, TAlignLayout.MostLeft:
      ParentRelativePoint.X := ParentRelativePoint.X - 1 - Margins.Left;
    TAlignLayout.Right, TAlignLayout.MostRight:
      ParentRelativePoint.X := ParentRelativePoint.X + Width + 1 + Margins.Right;
    TAlignLayout.Top:
      ParentRelativePoint.Y := ParentRelativePoint.Y - 1 - Margins.Top;
    TAlignLayout.Bottom:
      ParentRelativePoint.Y := ParentRelativePoint.Y + Height + 1 + Margins.Bottom;
  else
    Exit;
  end;
  if Parent <> nil then
  begin
    IsVerticalAlign := Align in [TAlignLayout.Top, TAlignLayout.Bottom, TAlignLayout.MostTop, TAlignLayout.MostBottom];
    IsHorizontalAlign := Align in [TAlignLayout.Left, TAlignLayout.MostLeft, TAlignLayout.Right, TAlignLayout.MostRight];
    for I := 0 to Parent.ChildrenCount - 1 do
    begin
      if not(Parent.Children[I] is TControl) then
        Continue;
      Result := TControl(Parent.Children[I]);

      if Result.Locked then
        Continue;
      if IsHorizontalAlign and not ((Result.Align in [TAlignLayout.Left, TAlignLayout.MostLeft, TAlignLayout.Right, TAlignLayout.MostRight])) then
        Continue;
      if IsVerticalAlign and not ((Result.Align in [TAlignLayout.Top, TAlignLayout.Bottom, TAlignLayout.MostTop, TAlignLayout.MostBottom])) then
        Continue;

      if Result.Visible then
      begin
        LRect := Result.LocalRect;
        LBounds := Result.Margins;
        OffsetRect(LRect, Result.Position.X, Result.Position.Y);
        LRect.Inflate(LBounds.Left, LBounds.Top, LBounds.Right, LBounds.Bottom);

        if (LRect.Right - LRect.Left) = 0 then
          if Align in [TAlignLayout.Top, TAlignLayout.Left, TAlignLayout.MostLeft] then
            LRect.Left := LRect.Left - 1
          else
            LRect.Right := LRect.Right + 1;
        if (LRect.Bottom - LRect.Top) = 0 then
          if Align in [TAlignLayout.Top, TAlignLayout.Left, TAlignLayout.MostLeft] then
            LRect.Top := LRect.Top - 1
          else
            LRect.Bottom := LRect.Bottom + 1;

        if LRect.Contains(ParentRelativePoint) then
          Exit;
      end;
    end;
  end;
  Result := nil;
end;

function TSplitter.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(5, 5);
end;

procedure TSplitter.UpdateSize(X, Y: Single);
begin
  CalcSplitSize(X, Y, FNewSize, FSplit);
end;

procedure TSplitter.CalcSplitSize(X, Y: Single; var NewSize, Split: Single);
var
  S: Single;
begin
  if Align in [TAlignLayout.Left, TAlignLayout.Right, TAlignLayout.MostLeft, TAlignLayout.MostRight] then
    Split := X - FDownPos.X
  else
    Split := Y - FDownPos.Y;
  S := 0;
  case Align of
    TAlignLayout.Left, TAlignLayout.MostLeft:
      S := FControl.Width + Split;
    TAlignLayout.Right, TAlignLayout.MostRight:
      S := FControl.Width - Split;
    TAlignLayout.Top:
      S := FControl.Height + Split;
    TAlignLayout.Bottom:
      S := FControl.Height - Split;
  end;
  NewSize := S;
  if S < FMinSize then
    NewSize := FMinSize
  else if S > FMaxSize then
    NewSize := FMaxSize;
  if S <> NewSize then
  begin
    if Align in [TAlignLayout.Right, TAlignLayout.MostRight, TAlignLayout.Bottom] then
      S := S - NewSize
    else
      S := NewSize - S;
    Split := Split + S;
  end;
end;

procedure TSplitter.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

function TSplitter.DoCanResize(var NewSize: Single): Boolean;
begin
  Result := True;
  if (NewSize <= FMinSize) { and FAutoSnap } then
    NewSize := FMinSize;
end;

procedure TSplitter.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  i: Integer;
  C: IContainerObject;
  SiblingControl: TControl;
begin
  inherited;
  if (Button = TMouseButton.mbLeft) and Supports(Parent, IContainerObject, C) then
  begin
    FPressed := True;
    FDownPos := PointF(X, Y);
    FControl := FindObject;
    if FControl <> nil then
    begin
      if Align in [TAlignLayout.Left, TAlignLayout.MostLeft, TAlignLayout.Right, TAlignLayout.MostRight] then
      begin
        FMaxSize := C.ContainerWidth - FMinSize;
        if Parent is TControl then
          FMaxSize := FMaxSize - TControl(Parent).Padding.left - TControl(Parent).Padding.right;
        for i := 0 to Parent.ChildrenCount - 1 do
        begin
          if not (Parent.Children[i] is TControl) then
            Continue;
          SiblingControl := TControl(Parent.Children[i]);
          if SiblingControl.Visible and (SiblingControl.Align in [TAlignLayout.Left, TAlignLayout.Right,
            TAlignLayout.MostLeft, TAlignLayout.MostRight]) then
            FMaxSize := FMaxSize - SiblingControl.Width - SiblingControl.Margins.left - SiblingControl.Margins.right;
        end;
        FMaxSize := FMaxSize + FControl.Width;
      end
      else
      begin
        FMaxSize := C.ContainerHeight - FMinSize;
        if Parent is TControl then
          FMaxSize := FMaxSize - TControl(Parent).Padding.top - TControl(Parent).Padding.bottom;
        for i := 0 to Parent.ChildrenCount - 1 do
        begin
          if not(Parent.Children[i] is TControl) then
            Continue;
          SiblingControl := TControl(Parent.Children[i]);
          if SiblingControl.Visible and (SiblingControl.Align in [TAlignLayout.Top, TAlignLayout.Bottom,
            TAlignLayout.MostTop, TAlignLayout.MostBottom]) then
            FMaxSize := FMaxSize - SiblingControl.Height - SiblingControl.Margins.top - SiblingControl.Margins.bottom;
        end;
        FMaxSize := FMaxSize + FControl.Height;
      end;
      UpdateSize(X, Y);
    end;
  end;
end;

procedure TSplitter.MouseMove(Shift: TShiftState; X, Y: Single);
var
  NewSize, Split: Single;
begin
  inherited;
  if FPressed and (FControl <> nil) and FControl.Visible then
  begin
    CalcSplitSize(X, Y, NewSize, Split);
    if DoCanResize(NewSize) then
    begin
      FNewSize := NewSize;
      FSplit := Split;
      UpdateControlSize;
    end;
  end;
end;

procedure TSplitter.UpdateControlSize;
begin
  if FNewSize <> FOldSize then
  begin
    case Align of
      TAlignLayout.Left, TAlignLayout.MostLeft:
        FControl.Width := FNewSize;
      TAlignLayout.Top:
        FControl.Height := FNewSize;
      TAlignLayout.Right, TAlignLayout.MostRight:
        begin
          FControl.Position.X := FControl.Position.X + (FControl.Width - FNewSize);
          FControl.Width := FNewSize;
        end;
      TAlignLayout.Bottom:
        begin
          FControl.Position.Y := FControl.Position.Y + (FControl.Height - FNewSize);
          FControl.Height := FNewSize;
        end;
    end;
    // if Assigned(FOnMoved) then FOnMoved(Self);
    FOldSize := FNewSize;
  end;
end;

procedure TSplitter.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FPressed := False;
  FControl := nil;
end;

procedure TSplitter.SetShowGrip(const Value: Boolean);
begin
  if FShowGrip <> Value then
  begin
    FShowGrip := Value;
    ApplyStyle;
  end;
end;

{ TProgressBar }

constructor TProgressBar.Create(AOwner: TComponent);
begin
  inherited;
  FValueRange := TValueRange.Create(Self);
  FDefaultValueRange := TBaseValueRange.Create;
  FValueRange.AfterChange := AfterChangeProc;
  FValueRange.OnChanged := ChangedProc;
  CanFocus := False;
  SetAcceptsControls(False);
end;

procedure TProgressBar.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

destructor TProgressBar.Destroy;
begin
  FreeAndNil(FDefaultValueRange);
  FreeAndNil(FValueRange);
  inherited;
end;

procedure TProgressBar.AfterConstruction;
begin
  inherited;
  DefaultValueRange.Assign(FValueRange.New);
end;

procedure TProgressBar.Loaded;
begin
  if FValueRange.IsChanged then
    FValueRange.Changed(True);
  inherited;
end;

function TProgressBar.GetData: TValue;
begin
  Result := Value;
end;

function TProgressBar.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(100, 20);
end;

procedure TProgressBar.SetData(const Value: TValue);
begin
  if Value.IsOrdinal then
    Self.Value := Value.AsOrdinal
  else
  if Value.IsType<Single> then
    Self.Value := Value.AsType<Single>
  else
    Self.Value := Min
end;

function TProgressBar.GetActionLinkClass: TActionLinkClass;
begin
  Result := TValueRangeActionLink;
end;

procedure TProgressBar.ActionChange(Sender: TBasicAction;
  CheckDefaults: Boolean);
begin
  if Sender is TValueRangeAction then
  begin
    if (not CheckDefaults) or (FValueRange.IsEmpty) then
      FValueRange.Assign(TValueRangeAction(Sender).ValueRange);
  end;
  inherited;
end;

function TProgressBar.GetValueRange: TCustomValueRange;
begin
  Result := FValueRange;
end;

function TProgressBar.MaxStored: Boolean;
begin
  Result := DefStored and (not SameValue(Max, DefaultValueRange.Max));
end;

function TProgressBar.MinStored: Boolean;
begin
  Result := DefStored and (not SameValue(Min, DefaultValueRange.Min));
end;

function TProgressBar.ValueStored: Boolean;
begin
  Result := DefStored and (not SameValue(Value, DefaultValueRange.Value));
end;

procedure TProgressBar.SetValueRange(const AValue: TCustomValueRange);
begin
  FValueRange.Assign(AValue);
end;

function TProgressBar.GetMax: Single;
begin
  Result := FValueRange.Max - FValueRange.ViewportSize;
end;

procedure TProgressBar.SetMax(const Value: Single);
var V: Single;
begin
  V := Value + FValueRange.ViewportSize;
  if FValueRange.Max <> V then
    FValueRange.Max := V;
end;

function TProgressBar.GetMin: Single;
begin
  Result :=  FValueRange.Min;
end;

procedure TProgressBar.SetMin(const Value: Single);
begin
  if FValueRange.Min <> Value then
    FValueRange.Min := Value;
end;

function TProgressBar.GetValue: Single;
begin
  Result := FValueRange.Value;
end;

procedure TProgressBar.SetValue(const Value: Single);
begin
  if FValueRange.Value <> Value then
    FValueRange.Value := Value;
end;

procedure TProgressBar.ApplyStyle;
var
  Indicator: TFmxObject;
  IndicatorStyleName: string;
begin
  inherited;
  if Orientation = TOrientation.Horizontal then
    IndicatorStyleName := 'hindicator'
  else
    IndicatorStyleName := 'vindicator';

  if FindStyleResource<TFmxObject>(IndicatorStyleName, Indicator) then
    TAnimator.StartTriggerAnimation(Indicator, Self, 'IsVisible');
  Realign;
end;

procedure TProgressBar.AfterChangeProc(Sender: TObject);
begin
  if ActionClient and (not DefStored) and (not TValueRangeAction(Action).ValueRange.Changing) then
    TValueRangeAction(Action).ValueRange := FValueRange;
end;

procedure TProgressBar.ChangedProc(Sender: TObject);
begin
  Realign;
end;

function TProgressBar.ChooseAdjustType(const FixedSize: TSize): TAdjustType;
begin
  if FixedSize.Height <> 0 then
  begin
    if Orientation = TOrientation.Horizontal then
      Result := TAdjustType.FixedHeight
    else
    begin
      SetAdjustSizeValue(TSizeF.Create(AdjustSizeValue.Height, AdjustSizeValue.Width));
      Result := TAdjustType.FixedWidth;
    end;
  end
  else
    Result := TAdjustType.None;
end;

function TProgressBar.DefStored: Boolean;
begin
  Result := not (ActionClient and (Action is TCustomValueRangeAction));
end;

procedure TProgressBar.DoRealign;
var
  HorizontalIndicator, VerticalIndicator, T: TControl;
  NewSize: Single;
begin
  inherited;
  if not FDisableAlign then
  begin
    FDisableAlign := True;
    try
      T := nil;
      case Orientation of
        TOrientation.Horizontal:
        begin
          if FindStyleResource<TControl>('vtrack', T) then
            T.Visible := False;
          FindStyleResource<TControl>('htrack', T);
        end;
        TOrientation.Vertical:
        begin
          if FindStyleResource('htrack', T) then
            T.Visible := False;
          FindStyleResource<TControl>('vtrack', T);
        end;
      end;
      if T = nil then
        FindStyleResource<TControl>('track', T);
      if T <> nil then
      begin
        T.Visible := True;
        if Max > Min then
        begin
          HorizontalIndicator := nil;
          FindStyleResource<TControl>('hindicator', HorizontalIndicator);
          VerticalIndicator := nil;
          FindStyleResource<TControl>('vindicator', VerticalIndicator);
          if Orientation = TOrientation.Horizontal then
          begin
            if HorizontalIndicator <> nil then
            begin
              NewSize := (T.Width - T.Padding.Left - T.Padding.Right - HorizontalIndicator.Margins.Left - HorizontalIndicator.Margins.Right)
                * FValueRange.RelativeValue;
              HorizontalIndicator.Width := Round(NewSize);
              HorizontalIndicator.Visible := HorizontalIndicator.Width > 2;
            end;
            if VerticalIndicator <> nil then
              VerticalIndicator.Visible := False;
          end
          else
          begin
            if VerticalIndicator <> nil then
            begin
              NewSize := (T.Height - T.Padding.Top - T.Padding.Bottom - HorizontalIndicator.Margins.Top - HorizontalIndicator.Margins.Bottom)
                * FValueRange.RelativeValue;
              VerticalIndicator.Height := Round(NewSize);
              VerticalIndicator.Visible := VerticalIndicator.Height > 2;
            end;
            if HorizontalIndicator <> nil then
              HorizontalIndicator.Visible := False;
          end;
        end;
      end;
    finally
      FDisableAlign := False;
    end;
  end;
end;

procedure TProgressBar.SetOrientation(const Value: TOrientation);
var
  SavedSize: TSizeF;
begin
  if FOrientation <> Value then
  begin
    SavedSize := Size.Size;

    FOrientation := Value;
    NeedStyleLookup;
    ApplyStyleLookup;

    if not (csLoading in ComponentState) then
      SetBounds(Position.X, Position.Y, SavedSize.Height, SavedSize.Width);
  end;
end;

{ TThumb }

function ValueToPos(MinValue, MaxValue, ViewportSize, ThumbSize, TrackSize, Value: Single; IgnoreViewportSize: Boolean): Single;
var ValRel: Double;
begin
  Result := ThumbSize / 2;
  if (ViewportSize < 0) or IgnoreViewportSize then
    ViewportSize := 0;
  ValRel := MaxValue - MinValue - ViewportSize;
  if ValRel > 0 then
  begin
    ValRel := (Value - MinValue) / ValRel;
    Result := (TrackSize - ThumbSize) * ValRel + Result;
  end;
end;

function PosToValue(MinValue, MaxValue, ViewportSize, ThumbSize, TrackSize, Pos: Single; IgnoreViewportSize: Boolean): Single;
var ValRel: Double;
begin
  Result := MinValue;
  if (ViewportSize < 0) or IgnoreViewportSize then
    ViewportSize := 0;
  ValRel := TrackSize - ThumbSize;
  if ValRel > 0 then
  begin
    ValRel := (Pos - ThumbSize / 2) / ValRel;
    if ValRel < 0 then
      ValRel := 0;
    if ValRel > 1 then
      ValRel := 1;
    Result := MinValue + ValRel * (MaxValue - MinValue - ViewportSize);
  end;
end;

constructor TThumb.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := False;
  CanParentFocus := True;
  AutoCapture := True;
end;

function TThumb.PointToValue(X, Y: Single): Single;
var
  P: TPointF;
begin
  Result := 0;
  if (FTrack <> nil) and (Parent is TControl) then
  begin
    if FTrack.Orientation = TOrientation.Horizontal then
    begin
      P := FTrack.ScreenToLocal(LocalToScreen(TPointF.Create(X, 0)));
      P.X := P.X - FDownOffset.X + Width / 2;
      Result := PosToValue(FTrack.Min, FTrack.Max, FTrack.ViewportSize, Self.Width, FTrack.Width, P.X, FTrack.FIgnoreViewportSize);
    end
    else
    begin
      P := FTrack.ScreenToLocal(LocalToScreen(TPointF.Create(0, Y)));
      P.Y := P.Y - FDownOffset.Y + Height / 2;
      Result := PosToValue(FTrack.Min, FTrack.Max, FTrack.ViewportSize, Self.Height, FTrack.Height, P.Y, FTrack.FIgnoreViewportSize);
    end;
  end;
end;

function TThumb.GetDefaultTouchTargetExpansion: TRectF;
var
  DeviceSrv: IFMXDeviceService;
begin
  if SupportsPlatformService(IFMXDeviceService, DeviceSrv) and
    (TDeviceFeature.HasTouchScreen in DeviceSrv.GetFeatures) then
    Result := TRectF.Create(DefaultTouchTargetExpansion, DefaultTouchTargetExpansion, DefaultTouchTargetExpansion,
      DefaultTouchTargetExpansion)
  else
    Result := inherited ;
end;

procedure TThumb.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (Button = TMouseButton.mbLeft) and Enabled then
  begin
    FPressed := True;
    FDownOffset := PointF(X, Y);
    if FTrack <> nil then
    begin
      FTrack.SetFocus;
      FTrack.ValueRange.Tracking := FTrack.Tracking;
    end;
    StartTriggerAnimation(Self, 'IsPressed');
    ApplyTriggerEffect(Self, 'IsPressed');
  end;
end;

procedure TThumb.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if FPressed and Enabled then
    try
      if FTrack <> nil then
        FTrack.SetNewValue(PointToValue(X, Y));
    except
      FPressed := False;
      raise;
    end;
end;

procedure TThumb.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  LValue: Single;
begin
  LValue := PointToValue(X, Y);
  inherited;
  if (FTrack <> nil) and (FTrack.FPushedTimer <> nil) and (Button = TMouseButton.mbLeft) then
    FTrack.FPushedTimer.Free;
  if FPressed then
  begin
    FPressed := False;
    try
      if (FTrack <> nil) and (not FTrack.ValueRange.Tracking) then
      begin
        FTrack.SetNewValue(LValue);
        FTrack.ValueRange.Tracking := True;
      end;
    finally
      StartTriggerAnimation(Self, 'IsPressed');
      ApplyTriggerEffect(Self, 'IsPressed');
    end;
  end;
end;

type
  TCustomTrackActionLink = class (TValueRangeActionLink)
  protected
    function IsScroll: Boolean;
    procedure AssignClient(AClient: TObject); override;
    function IsCheckedLinked: Boolean; override;
    function IsEnabledLinked: Boolean; override;
    function IsVisibleLinked: Boolean; override;
  end;

{ TCustomTrackActionLink }

procedure TCustomTrackActionLink.AssignClient(AClient: TObject);
begin
  if (AClient <> nil) and (not (AClient is TCustomTrack)) then
    raise EActionError.CreateFmt(StrNoClientClass, [AClient.ClassName]);
  inherited;
end;

function TCustomTrackActionLink.IsScroll: Boolean;
var Par: TFmxObject;
begin
  Par := TCustomTrack(Client);
  while (Par <> nil) and (not (Par is TScrollBar)) do
    Par := Par.Parent;
  Result := Par <> nil;
end;

function TCustomTrackActionLink.IsVisibleLinked: Boolean;
begin
  if IsScroll then
    Result := False
  else
    Result := inherited IsVisibleLinked;
end;

function TCustomTrackActionLink.IsCheckedLinked: Boolean;
begin
  if IsScroll then
    Result := False
  else
    Result := inherited IsCheckedLinked;
end;

function TCustomTrackActionLink.IsEnabledLinked: Boolean;
begin
  if IsScroll then
    Result := False
  else
    Result := inherited IsEnabledLinked;
end;

type
  TValueRangeTrack = class (TValueRange)
  private
    [Weak] FTrack: TCustomTrack;
    FValueChanged: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoBeforeChange; override;
    procedure DoChanged; override;
    procedure DoAfterChange; override;
    procedure DoTrackingChange; override;
    function NeedActionChange: Boolean;
    property Track: TCustomTrack read FTrack;
  end;

{ TValueRangeTrack }

function TValueRangeTrack.NeedActionChange: Boolean;
begin
  Result := FTrack.ActionClient and
           (not FTrack.DefStored) and
           (not TValueRangeAction(FTrack.Action).ValueRange.Changing);
end;

constructor TValueRangeTrack.Create(AOwner: TComponent);
begin
  if not (AOwner is TCustomTrack) then
    raise EActionError.CreateFMT(SEUseHeirs, [TCustomTrack.ClassName]);
  inherited;
  FTrack := TCustomTrack(AOwner);
end;

procedure TValueRangeTrack.DoBeforeChange;
begin
  FValueChanged := (not SameValue(Value, New.Value));
  if NeedActionChange then
    TValueRangeAction(FTrack.Action).ValueRange.Assign(New);
  inherited;
end;

procedure TValueRangeTrack.DoChanged;
begin
  FTrack.Realign;
  FTrack.DoTracking;
  inherited;
end;

procedure TValueRangeTrack.DoTrackingChange;
begin
  inherited;
end;

procedure TValueRangeTrack.DoAfterChange;
begin
  if FValueChanged then
  try
    FTrack.DoChanged;
  finally
    FValueChanged := False;
  end;
  inherited;
end;


{ TCustomTrack }

constructor TCustomTrack.Create(AOwner: TComponent);
begin
  inherited;
  FValueRange := CreateValueRangeTrack;
  FDefaultValueRange := TBaseValueRange.Create;
  FTracking := True;
  FMinThumbSize := 5;
  CanParentFocus := True;
end;

destructor TCustomTrack.Destroy;
begin
  FreeAndNil(FDefaultValueRange);
  FreeAndNil(FValueRange);
  FPushedTimer.DisposeOf;
  inherited;
end;

procedure TCustomTrack.AfterConstruction;
begin
  inherited;
  DefaultValueRange.Assign(FValueRange.New);
end;

procedure TCustomTrack.ObserversValueUpdate;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if TLinkObservers.EditLinkIsModified(Observers) then
      TLinkObservers.EditLinkUpdate(Observers);
  if Observers.IsObserving(TObserverMapping.ControlValueID) then
    TLinkObservers.ControlValueUpdate(Observers);
end;

procedure TCustomTrack.Resize;
begin
  inherited;
  UpdateHighlight;
end;

procedure TCustomTrack.Loaded;
begin
  if not (csDestroying in ComponentState) then
  begin
    if FValueRange.IsChanged then
      FValueRange.Changed(True);
  end;
  inherited;
end;

function TCustomTrack.CreateValueRangeTrack : TValueRange;
begin
  Result := TValueRangeTrack.Create(Self);
end;

function TCustomTrack.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.PositionLinkID then
    Result := True;
  if ID = TObserverMapping.EditLinkID then
    Result := True;
  if ID = TObserverMapping.ControlValueID then
    Result := True;
end;

function TCustomTrack.GetData: TValue;
begin
  Result := Value;
end;

function TCustomTrack.GetDefaultSize: TSizeF;
var
  DeviceInfo: IDeviceBehavior;
begin
  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior, DeviceInfo, Self) then
    case DeviceInfo.GetOSPlatform(Self) of
      TOSPlatform.Windows:
        if TOSVersion.Check(6, 2) then // Great then Windows 8
          Result := TSizeF.Create(100, 19)
        else
          Result := TSizeF.Create(100, 20);
      TOSPlatform.OSX:
        Result := TSizeF.Create(100, 19);
      TOSPlatform.iOS:
        Result := TSizeF.Create(100, 36);
      TOSPlatform.Android:
        Result := TSizeF.Create(100, 32);
    end
  else
    Result := TSizeF.Create(100, 20);
end;

function TCustomTrack.GetDefaultTouchTargetExpansion: TRectF;
var
  DeviceSrv: IFMXDeviceService;
begin
  if SupportsPlatformService(IFMXDeviceService, DeviceSrv) and
    (TDeviceFeature.HasTouchScreen in DeviceSrv.GetFeatures) then
    Result := TRectF.Create(DefaultTouchTargetExpansion, DefaultTouchTargetExpansion, DefaultTouchTargetExpansion,
      DefaultTouchTargetExpansion)
  else
    Result := inherited ;
end;

procedure TCustomTrack.SetData(const Value: TValue);
begin
  if Value.IsType<TNotifyEvent> then
    OnChange := Value.AsType<TNotifyEvent>()
  else if Value.IsOrdinal then
    Self.Value := Value.AsOrdinal
  else if Value.IsType<Single> then
    Self.Value := Value.AsType<Single>
  else
    Self.Value := Min
end;

function TCustomTrack.GetThumbRect(Value: single): TRectF;
var
  Pos, Size: Single;
begin
  Result := LocalRect;
  Size := GetThumbSize(FIgnoreViewportSize);
  case Orientation of
    TOrientation.Horizontal:
    begin
      Pos := ValueToPos(Min, Max, ViewportSize, Size, Width, Value, FIgnoreViewportSize);
      Size := Size / 2;
      Result := RectF(Pos - Size, 0, Pos + Size, Height);
    end;
    TOrientation.Vertical:
    begin
      Pos := ValueToPos(Min, Max, ViewportSize, Size, Height, Value, FIgnoreViewportSize);
      Size := Size / 2;
      Result := RectF(0, Pos - Size, Width, Pos + Size);
    end;
  end;
  if (FThumb <> nil) and (FThumb.Parent <> nil) and (FThumb.Parent is TControl) then
  begin
    if RectWidth(Result) > TControl(FThumb.Parent).Padding.left + FThumb.Margins.left + TControl(FThumb.Parent).Padding.right - FThumb.Margins.right then
    begin
      Result.left := Round(Result.left + TControl(FThumb.Parent).Padding.left + FThumb.Margins.left);
      Result.right := Round(Result.right - TControl(FThumb.Parent).Padding.right - FThumb.Margins.right);
    end;
    Result.top := Round(Result.top + TControl(FThumb.Parent).Padding.top + FThumb.Margins.top);
    Result.bottom := Round(Result.bottom - TControl(FThumb.Parent).Padding.bottom - FThumb.Margins.bottom);
  end;
end;

function TCustomTrack.GetThumbRect: TRectF;
begin
  Result := GetThumbRect(Value);
end;

function TCustomTrack.GetThumbSize(var IgnoreViewportSize: Boolean): Integer;
var
  lSize: Double;
begin
  Result := 0;
  case Orientation of
    TOrientation.Horizontal:
    begin
      if ViewportSize > 0 then
        lSize := ViewportSize / (Max - Min) * Width
      else
        if SameValue(FThumbSize, 0) then
          lSize := Height
        else
          lSize := FThumbSize;
      Result := Round(System.Math.Min(System.Math.MaxValue([lSize, Height / 2, FMinThumbSize]), Width));
    end;
    TOrientation.Vertical:
    begin
      if ViewportSize > 0 then
        lSize := ViewportSize / (Max - Min) * Height
      else
        if SameValue(FThumbSize, 0) then
          lSize := Width
        else
          lSize := FThumbSize;
      Result := Round(System.Math.Min(System.Math.MaxValue([lSize, Width / 2, FMinThumbSize]), Height));
    end;
  else
    lSize := FMinThumbSize;
  end;
  if Result < FMinThumbSize then
    Result := 0;
  IgnoreViewportSize := Result <= (lSize - 1);
end;

function TCustomTrack.DefStored: Boolean;
begin
  Result := not (ActionClient and (Action is TCustomValueRangeAction));
end;

function TCustomTrack.ValueStored: Boolean;
begin
  Result := DefStored and (not SameValue(Value, DefaultValueRange.Value));
end;

function TCustomTrack.ViewportSizeStored: Boolean;
begin
  Result := DefStored and (not SameValue(ViewportSize, DefaultValueRange.ViewportSize));
end;

function TCustomTrack.FrequencyStored: Boolean;
begin
  Result := DefStored and (not SameValue(Frequency, DefaultValueRange.Frequency));
end;

function TCustomTrack.MaxStored: Boolean;
begin
  Result := DefStored and (not SameValue(Max, DefaultValueRange.Max));
end;

function TCustomTrack.MinStored: Boolean;
begin
  Result := DefStored and (not SameValue(Min, DefaultValueRange.Min));
end;

function TCustomTrack.GetMax: Single;
begin
  Result := FValueRange.Max;
end;

procedure TCustomTrack.SetMax(const Value: Single);
begin
  FValueRange.Max := Value;
end;

procedure TCustomTrack.SetMin(const Value: Single);
begin
  FValueRange.Min := Value;
end;

function TCustomTrack.GetMin: Single;
begin
  Result := FValueRange.Min;
end;

procedure TCustomTrack.SetFrequency(const Value: Single);
begin
  FValueRange.Frequency := Value;
end;

function TCustomTrack.GetFrequency: Single;
begin
  Result := FValueRange.Frequency;
end;

function TCustomTrack.GetValue: Single;
begin
  Result := FValueRange.Value;
end;

procedure TCustomTrack.SetValue(Value: Single);
begin
  FValueRange.Value := Value;
end;

function TCustomTrack.GetViewportSize: Single;
begin
  Result := FValueRange.ViewportSize;
end;

procedure TCustomTrack.SetViewportSize(const Value: Single);
begin
  FValueRange.ViewportSize := Value;
end;

function TCustomTrack.GetValueRange: TCustomValueRange;
begin
  Result := FValueRange;
end;

procedure TCustomTrack.SetValueRange(const AValue: TCustomValueRange);
begin
  FValueRange.Assign(AValue);
end;

procedure TCustomTrack.SetValueRange_(const Value: TValueRange);
begin
  FValueRange.Assign(Value);
end;

function TCustomTrack.GetActionLinkClass: TActionLinkClass;
begin
  Result := TCustomTrackActionLink;
end;

procedure TCustomTrack.ActionChange(Sender: TBasicAction;
  CheckDefaults: Boolean);
begin
  if Sender is TValueRangeAction then
  begin
    if (not CheckDefaults) or (FValueRange.IsEmpty) then
      FValueRange.Assign(TValueRangeAction(Sender).ValueRange);
  end;
  if (ActionLink is TCustomTrackActionLink) and
     (TCustomTrackActionLink(ActionLink).IsScroll) then
    Exit;
  inherited;
end;

procedure TCustomTrack.DoRealign;
var R: TRectF;
begin
  inherited;
  if FThumb <> nil then
  begin
    R := GetThumbRect;
    FThumb.Visible := not ((R.Right <= R.Left) or (R.Bottom <= R.Top));
    FThumb.BoundsRect := R;
  end;
end;

function TCustomTrack.ChooseAdjustType(const FixedSize: TSize): TAdjustType;
begin
  if FixedSize.Height <> 0 then
  begin
    if Orientation = TOrientation.Horizontal then
      Result := TAdjustType.FixedHeight
    else
    begin
      SetAdjustSizeValue(TSizeF.Create(AdjustSizeValue.Height, AdjustSizeValue.Width));
      Result := TAdjustType.FixedWidth;
    end;
  end
  else
    Result := TAdjustType.None;
end;

procedure TCustomTrack.ApplyStyle;
var
  Thumb: TThumb;
  T: TControl;
  StyleObject: TFmxObject;
begin
  inherited;
  Thumb := nil;
  if FindStyleResource<TThumb>('vthumb', Thumb) then
  begin
    if Orientation = TOrientation.Horizontal then
      Thumb.Visible := False
    else
    begin
      FThumb := Thumb;
      FThumb.Visible := True;
    end;
  end;
  if FindStyleResource<TThumb>('hthumb', Thumb) then
  begin
    if Orientation = TOrientation.Vertical then
      Thumb.Visible := False
    else
    begin
      FThumb := Thumb;
      FThumb.Visible := True;
    end;
  end;
  if FindStyleResource<TThumb>('thumb', Thumb) then
    FThumb := Thumb;
  if FThumb <> nil then
    FThumb.FTrack := Self;

  if FindStyleResource<TControl>('vtrack', T) then
  begin
    if Orientation = TOrientation.Horizontal then
      T.Visible := False
    else
    begin
      FTrack := T;
      FTrack.Visible := True;
    end;
  end;
  if FindStyleResource<TControl>('htrack', T) then
  begin
    if Orientation = TOrientation.Vertical then
      T.Visible := False
    else
    begin
      FTrack := T;
      FTrack.Visible := True;
    end;
  end;
  if FindStyleResource<TControl>('track', T) then
  begin
    FTrack := T;
    FTrack.Visible := True;
  end;
  if FTrack <> nil then
  begin
    StyleObject := FTrack.FindStyleResource('highlight');
    if StyleObject is TControl then
      FTrackHighlight := TControl(StyleObject);
    UpdateHighlight;
  end;

  StyleObject := FindStyleResource('thumbsize');
  if StyleObject <> nil then
  begin
    if StyleObject.Tag > 0 then
      FThumbSize := StyleObject.Tag;
    if StyleObject.TagFloat > 0 then
      FThumbSize := StyleObject.TagFloat;
  end;

  // forward the thumb clicks and dblClicks to the trackbar events
  if FThumb <> nil then
  begin
    FThumb.OnClick := DoThumbClick;
    FThumb.OnDblClick := DoThumbDblClick;
  end;
  Realign;
  if FThumb <> nil then
  begin
    MinClipWidth := FThumb.Width;
    MinClipHeight := FThumb.Height;
  end;
end;

procedure TCustomTrack.UpdateHighlight;
begin
  if FTrackHighlight <> nil then
  begin
    case Orientation of
      TOrientation.Horizontal:
        FTrackHighlight.Width := Round((GetThumbRect.Left + GetThumbRect.Right) / 2);
      TOrientation.Vertical:
        FTrackHighlight.Height := Round((GetThumbRect.Top + GetThumbRect.Bottom) / 2);
    end;
  end;
end;

procedure TCustomTrack.FreeStyle;
begin
  FThumbSize := 0;
  FThumb := nil;
  FTrack := nil;
  FTrackHighlight := nil;
  inherited;
end;

procedure TCustomTrack.DoChanged;
begin
  if not (csLoading in ComponentState) and Assigned(FOnChange) then
    FOnChange(Self);
  UpdateHighlight;
end;

procedure TCustomTrack.DoTracking;
begin
  if not (csLoading in ComponentState) and Assigned(FOnTracking) then
    FOnTracking(Self);
  UpdateHighlight;
end;

procedure TCustomTrack.SetNewValue(const LValue: Single);
begin
  if LValue <> Value then
  begin
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
    begin
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit;
      if not TLinkObservers.EditLinkEdit(Observers) then
        Exit;
    end;
    TLinkObservers.PositionLinkPosChanging(Observers);
    Value := LValue;
    TLinkObservers.PositionLinkPosChanged(Observers);
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      TLinkObservers.EditLinkModified(Observers);


    if Tracking then
    begin
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
        if TLinkObservers.EditLinkIsModified(Observers) then
          TLinkObservers.EditLinkUpdate(Observers);
      if Observers.IsObserving(TObserverMapping.ControlValueID) then
      begin
        TLinkObservers.ControlValueModified(Observers);
        TLinkObservers.ControlValueUpdate(Observers);
      end;
    end
    else
    if Observers.IsObserving(TObserverMapping.ControlValueID) then
      TLinkObservers.ControlValueModified(Observers);
  end
  else
    Value := LValue;
end;

function TCustomTrack.GetIncrement: Double;
const
  EmpiricallyObtainedValue = 1.66;
  TooSmallNumberOfSteps = 50;
var
  P: Integer;
  Delta: Double;
begin
  Result := SmallChange;
  if Result <= 0 then
  begin
    Delta := Max - Min;
    if Delta > 0 then
    begin
      P := Round(Log10(Delta) - EmpiricallyObtainedValue);
      Result := Power(10, P);
      if (Delta / Result) < TooSmallNumberOfSteps then
        Result := Result / 2;
      if Frequency > 0 then
        Result := Round(System.Math.Max(1, Result / Frequency)) * Frequency;
    end
    else
      Result := 0;
  end;
end;

function TCustomTrack.MousePosToValue(const MousePos: TPointF): Single;
var
  Size: Integer;
begin
  Size := GetThumbSize(FIgnoreViewportSize);
  case Orientation of
    TOrientation.Horizontal:
      Result := PosToValue(Min, Max, ViewportSize, Size, Width, MousePos.X, FIgnoreViewportSize);
    TOrientation.Vertical:
      Result := PosToValue(Min, Max, ViewportSize, Size, Height, MousePos.Y, FIgnoreViewportSize);
  else
    Result := Value;
  end
end;

function TCustomTrack.DoSmallChange(N: Integer; const TargetValue: Double): Boolean;
var
  Inc: Double;
begin
  Result := False;
  if ((N < 0) and (TargetValue < Value)) or ((N > 0) and (TargetValue > Value)) then
  begin
    Inc := GetIncrement;
    if not SameValue(Inc, 0) then
    begin
      Inc := Inc * N;
      Inc := Sign(Inc) * System.Math.Min(Abs(Inc), Abs(TargetValue - Value));
      if not SameValue(Inc, 0) then
      begin
        SetNewValue(Value + Inc);
        Result := True;
        if not Tracking then
          ObserversValueUpdate;
      end;
    end;
  end;
end;

procedure TCustomTrack.TimerProc(Sender: TObject);
var
  MousePos: TPointF;
  LValue: Single;
begin
  if MouseDownAction = TMouseDownAction.Goto then
  begin
    if (ssShift in FPushedShift) or not Tracking then
    begin
      MousePos := ScreenToLocal(Screen.MousePos);
      LValue := MousePosToValue(MousePos);
      SetNewValue(LValue);
      if not Tracking then
        ObserversValueUpdate;
    end
    else
    begin
      if FPushedTimer.Interval = FirstInterval then
        FPushedTimer.Interval := SecondInterval
      else
        FPushedTimer.Interval := OtherInterval;
      MousePos := ScreenToLocal(Screen.MousePos);
      if LocalRect.Contains(MousePos) then
      begin
        LValue := MousePosToValue(MousePos);
        if Sign(LValue - Value) = FPushedSign then
          DoSmallChange(FPushedSign, LValue);
      end;
    end;
  end
  else
    FPushedTimer.Free;
end;

procedure TCustomTrack.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (MouseDownAction = TMouseDownAction.Goto) and (Button = TMouseButton.mbLeft) then
  begin
    FPushedTimer.DisposeOf;
    FPushedValue := MousePosToValue(TPointF.Create(X, Y));
    FPushedSign := Sign(FPushedValue - Value);
    FPushedShift := Shift;
    if not SameValue(FPushedValue, Value) then
    begin
      Capture;
      FPushedTimer := TTimer.Create(nil);
      TComponent(FPushedTimer).FreeNotification(Self);
      FPushedTimer.OnTimer := TimerProc;
      FPushedTimer.Interval := FirstInterval;
      FPushedTimer.Enabled := True;
    end;
  end;
end;

procedure TCustomTrack.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  LValue: single;
begin
  if Button = TMouseButton.mbLeft then
    FPushedTimer.DisposeOf;
  LValue := Value;
  inherited MouseUp(Button, Shift, X, Y);
  DoMouseUp(Button, Shift, X, Y, LValue);
end;

procedure TCustomTrack.DoMouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single; LValue : Single);
begin
end;

procedure TCustomTrack.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FPushedTimer) then
    FPushedTimer := nil;
end;

procedure TCustomTrack.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  inc: Single;
  LValue: Single;
begin
  inc := Frequency;
  if inc = 0 then
    inc := 1;
  inherited;
  case Key of
    vkHome:
      LValue := Min;
    vkEnd:
      LValue := Max;
    vkUp:
      LValue := Value - inc;
    vkDown:
      LValue := Value + inc;
    vkLeft:
      LValue := Value - inc;
    vkRight:
      LValue := Value + inc;
  else
    Exit;
  end;
  Key := 0;
  SetNewValue(LValue);
end;

procedure TCustomTrack.SetOrientation(const Value: TOrientation);
var
  SavedSize: TSizeF;
begin
  if FOrientation <> Value then
  begin
    SavedSize := Size.Size;

    FOrientation := Value;
    NeedStyleLookup;
    ApplyStyleLookup;

    if not (csLoading in ComponentState) then
      SetBounds(Position.X, Position.Y, SavedSize.Height, SavedSize.Width);
  end;
end;

function TCustomTrack.GetIsTracking: Boolean;
begin
  Result := (FThumb <> nil) and FThumb.FPressed;
end;

procedure TCustomTrack.DoThumbClick(Sender: TObject);
begin
  if not Tracking then
    ObserversValueUpdate;
  if Assigned(OnClick) then
    OnClick(Self);
end;

procedure TCustomTrack.DoThumbDblClick(Sender: TObject);
begin
  if not Tracking then
    ObserversValueUpdate;
  if Assigned(OnDblClick) then
    OnDblClick(Self);
end;

{ TTrackBar }

constructor TTrackBar.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := True;
  SetAcceptsControls(False);
end;

{ TBitmapTrackBar }

constructor TBitmapTrackBar.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TBitmapTrackBar.Destroy;
begin
  FreeAndNil(FBitmap);
  inherited;
end;

procedure TBitmapTrackBar.ApplyStyle;
var
  T: TFmxObject;
  NeedUpdate: Boolean;
begin
  inherited;
  NeedUpdate := False;
  if Orientation = TOrientation.Horizontal then
  begin
    T := FindStyleResource('htrack');
    if T is TShape then
    begin
      FBackground := TShape(T);
      NeedUpdate := True;
    end;
    if T <> nil then
    begin
      T := T.FindStyleResource('background');
      if (T is TShape) then
      begin
        FBackground := TShape(T);
        NeedUpdate := True;
      end;
    end
  end
  else
  begin
    T := FindStyleResource('vtrack');
    if T is TShape then
    begin
      FBackground := TShape(T);
      NeedUpdate := True;
    end;
    if T <> nil then
    begin
      T := T.FindStyleResource('background');
      if (T is TShape) then
      begin
        FBackground := TShape(T);
        NeedUpdate := True;
      end;
    end
  end;
  if (FBackground <> nil) and (FTrackHighlight <> nil) then
  begin
    FTrackHighlight.Visible := False;
    FTrackHighlight := nil;
    NeedUpdate := True;
  end;
  if NeedUpdate then
    UpdateBitmap;
end;

procedure TBitmapTrackBar.FreeStyle;
begin
  if FBackground <> nil then
    FBackground.Fill.Bitmap.Bitmap.FreeHandle;
  FBackground := nil;
  inherited;
end;

function TBitmapTrackBar.GetDefaultStyleLookupName: string;
begin
  Result := 'trackbarstyle';
end;

procedure TBitmapTrackBar.DoRealign;
begin
  inherited;
  UpdateBitmap;
end;

procedure TBitmapTrackBar.SetOrientation(const Value: TOrientation);
begin
  if Value <> FOrientation then
  begin
    inherited;
    FreeAndNil(FBitmap);
    UpdateBitmap;
  end;
end;

procedure TBitmapTrackBar.UpdateBitmap;
begin
  if FBackground = nil then
    Exit;

  if (FBitmap <> nil) and ((FBitmap.Width <> Trunc(FBackground.Width)) or (FBitmap.Height <> Trunc(FBackground.Height))) then
  begin
    FBackground.Fill.Bitmap.Bitmap.FreeHandle;
    FreeAndNil(FBitmap);
  end;

  if FBitmap = nil then
    FBitmap := TBitmap.Create(Trunc(FBackground.Width), Trunc(FBackground.Height));

  if FBitmap.HandleAllocated then
  begin
    FillBitmap;

    FBackground.Fill.Kind := TBrushKind.Bitmap;
    FBackground.Fill.Bitmap.Bitmap.Assign(FBitmap);

    Repaint;
  end;
end;

procedure TBitmapTrackBar.FillBitmap;
begin
end;

{TSwitchModel}

procedure TSwitchModel.Change;
begin
  DoChanged;
end;

procedure TSwitchModel.DoChanged;
begin
  if Owner is TCustomSwitch then
    TCustomSwitch(Owner).DoSwitch;
end;

procedure TSwitchModel.SetValue(AValue: Boolean);
begin
  if FValue <> AValue then
  begin
    FValue := AValue;
    SendMessage<Boolean>(MM_VALUE_CHANGED, FValue);
  end;
end;

{ TSwitch }

constructor TCustomSwitch.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := True;
  SetAcceptsControls(False);
  CanUseDefaultPresentation := False;
  EnableExecuteAction := True;
end;

function TCustomSwitch.DefineModelClass: TDataModelClass;
begin
  Result := TSwitchModel;
end;

function TCustomSwitch.CanObserve(const ID: Integer): Boolean;
begin
  Result := (ID = TObserverMapping.EditLinkID) or (ID = TObserverMapping.ControlValueID);
end;

procedure TCustomSwitch.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if (Button = TMouseButton.mbLeft) and Enabled then
  begin
    if not IsCheckedStored then
      Include(FNeededToDo, SetChecked);
    Include(FNeededToDo, CallClick);
  end;
  inherited;
end;

procedure TCustomSwitch.Click;
begin
  if not IsCheckedStored then
    Include(FNeededToDo, SetChecked);
  Include(FNeededToDo, CallClick);
  // Don't call inherited. This method will call in DoSwitch
end;

function TCustomSwitch.GetActionLinkClass: TActionLinkClass;
begin
  Result := TControlActionLink;
end;

function TCustomSwitch.GetDefaultSize: TSizeF;
var
  DeviceInfo: IDeviceBehavior;
begin
  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior, DeviceInfo, Self) then
    case DeviceInfo.GetOSPlatform(Self) of
      TOSPlatform.iOS:
        Result := TSizeF.Create(55, 35);
      TOSPlatform.Android:
        Result := TSizeF.Create(44, 26);
      else
        Result := TSize.Create(78, 27);
    end
  else
    Result := TSizeF.Create(78, 27);
end;

function TCustomSwitch.GetDefaultTouchTargetExpansion: TRectF;
var
  DeviceSrv: IFMXDeviceService;
begin
  if SupportsPlatformService(IFMXDeviceService, DeviceSrv) and
    (TDeviceFeature.HasTouchScreen in DeviceSrv.GetFeatures) then
    Result := TRectF.Create(DefaultTouchTargetExpansion, DefaultTouchTargetExpansion, DefaultTouchTargetExpansion,
      DefaultTouchTargetExpansion)
  else
    Result := inherited ;
end;

function TCustomSwitch.GetIsChecked: Boolean;
begin
  Result := Model.Value;
end;

function TCustomSwitch.GetModel: TSwitchModel;
begin
  Result := GetModel<TSwitchModel>;
end;

function TCustomSwitch.GetOnSwitch: TNotifyEvent;
begin
  Result := Model.OnSwitch;
end;

procedure TCustomSwitch.SetOnSwitch(const Value: TNotifyEvent);
begin
  Model.OnSwitch := Value;
end;

procedure TCustomSwitch.DoSwitch;
begin
  try
    if CallClick in FNeededToDo then
      inherited Click;
    if (SetChecked in FNeededToDo) and (Action is TContainedAction) then
      TContainedAction(Action).Checked := Model.Value;
    if Assigned(OnSwitch) then
      OnSwitch(Self);
  finally
    FNeededToDo := [];
  end;
end;

function TCustomSwitch.GetData: TValue;
begin
  Result := IsChecked;
end;

procedure TCustomSwitch.SetData(const Value: TValue);
var
  B: Boolean;
begin
  if Value.IsType<Boolean> then
    IsChecked := Value.AsType<Boolean>
  else if Value.IsType<string> and TryStrToBool(Value.AsType<string>, B) then
    IsChecked := B
  else if Value.IsType<TNotifyEvent> then
    OnSwitch := Value.AsType<TNotifyEvent>();
end;

procedure TCustomSwitch.SetIsChecked(const AValue: Boolean);
begin
  if Model.Value <> AValue then
  begin
    if not IsCheckedStored then
      Include(FNeededToDo, SetChecked);
    if not Pressed then
      Exclude(FNeededToDo, CallClick);
    Model.Value := AValue;
  end;
end;

function TCustomSwitch.IsCheckedStored: Boolean;
begin
  Result := not (ActionClient and (ActionLink <> nil) and ActionLink.CheckedLinked and (Action is TContainedAction));
end;

procedure TCustomSwitch.ActionChange(Sender: TBasicAction; CheckDefaults: Boolean);
begin
  inherited;
  if (Sender is TCustomAction) and (not CheckDefaults or not IsChecked) then
    IsChecked := TCustomAction(Sender).Checked;
end;

type
  TScrollValueRange = class (TValueRange)
  private
    [Weak] FScroll: TScrollBar;
    FValueChanged: Boolean;
  protected
    function FrequencyStored: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Clear; override;
    procedure DoBeforeChange; override;
    procedure DoAfterChange; override;
  end;

{ TScrollValueRange }

constructor TScrollValueRange.Create(AOwner: TComponent);
begin
  if not (AOwner is TScrollBar) then
    raise EActionError.CreateFMT(SEUseHeirs, [TScrollBar.ClassName]);
  inherited;
  FScroll := TScrollBar(AOwner);
end;

procedure TScrollValueRange.DoBeforeChange;
begin
  inherited;
  FValueChanged := not SameValue(Value, New.Value);
end;

function TScrollValueRange.FrequencyStored: Boolean;
begin
  Result := Frequency = 1;
end;

procedure TScrollValueRange.Clear;
begin
  BeginUpdate;
  try
    inherited;
    Frequency := 1;
  finally
    EndUpdate;
  end;
end;

procedure TScrollValueRange.DoAfterChange;
begin
  if (not FScroll.FTrackChanging) and (FScroll.FTrack <> nil) then
  begin
    FScroll.FTrackChanging := True;
    try
      FScroll.FTrack.ValueRange.Assign(Self);
    finally
      FScroll.FTrackChanging := False;
    end;
  end;
  inherited;
  if (FValueChanged) then
    FScroll.DoChanged;
end;

{ TScrollBar }

constructor TScrollBar.Create(AOwner: TComponent);
begin
  inherited;
  FValueRange := TScrollValueRange.Create(Self);
  FDefaultValueRange := TBaseValueRange.Create;
  FValueRange.Frequency := 0;
  SetAcceptsControls(False);
end;

destructor TScrollBar.Destroy;
begin
  FreeAndNil(FDefaultValueRange);
  FreeAndNil(FValueRange);
  inherited;
end;

procedure TScrollBar.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

procedure TScrollBar.AfterConstruction;
begin
  inherited;
  DefaultValueRange.Assign(FValueRange.New);
end;

procedure TScrollBar.Loaded;
begin
  if not (csDestroying in ComponentState) then
  begin
    if FValueRange.IsChanged then
      FValueRange.Changed(True);
  end;
  inherited;
end;

function TScrollBar.GetData: TValue;
begin
  Result := Value;
end;

function TScrollBar.GetDefaultSize: TSizeF;
var
  DeviceInfo: IDeviceBehavior;
begin
  if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior, DeviceInfo, Self) then
    case DeviceInfo.GetOSPlatform(Self) of
      TOSPlatform.Windows:
        Result := TSizeF.Create(150, 18);
      TOSPlatform.OSX:
        Result := TSizeF.Create(150, 18);
      TOSPlatform.iOS:
        Result := TSizeF.Create(7, 7);
      TOSPlatform.Android:
        Result := TSizeF.Create(7, 7);
    end
  else
    Result := TSizeF.Create(150, 18);
end;

procedure TScrollBar.SetData(const Value: TValue);
begin
  if Value.IsType<TNotifyEvent> then
    OnChange := Value.AsType<TNotifyEvent>()
  else if Value.IsOrdinal then
    Self.Value := Value.AsOrdinal
  else if Value.IsType<Single> then
    Self.Value := Value.AsType<Single>
  else
    Self.Value := Min
end;

procedure TScrollBar.TrackChangedProc(Sender: TObject);
begin
  if not FTrackChanging then
  begin
    FTrackChanging := True;
    try
      FValueRange.Assign(FTrack.FValueRange);
    finally
      FTrackChanging := False;
    end;
  end;
end;

procedure TScrollBar.FreeTrack;
begin
  if not FTrackChanging then
  begin
    FTrackChanging := True;
    try
      if FTrack <> nil then
      begin
        FTrack.ValueRange.OnChanged := nil;
        if FTrack.ValueRange.IsChanged then
          FTrack.ValueRange.Changed;
        FValueRange.Assign(FTrack.ValueRange);
        FTrack.Action := nil;
        FTrack := nil;
      end;
    finally
      FTrackChanging := False;
    end;
  end;
end;

procedure TScrollBar.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  Processed: Boolean;
begin
  inherited;
  Processed := False;
  case Key of
    vkUp, vkLeft, vkPrior:
    begin
      DoSmallChange(-1);
      Processed := True;
    end;
    vkDown, vkRight, vkNext:
    begin
      DoSmallChange(1);
      Processed := True;
    end;
    vkHome:
    begin
      Value := Min;
      Processed := True;
    end;
    vkEnd:
    begin
      Value := Max;
      Processed := True;
    end;
  end;

  if Processed then
  begin
    Key := 0;
    KeyChar := #0;
  end;
end;

procedure TScrollBar.ApplyStyle;
var
  HT, VT: TCustomTrack;
  LB, TB: TCustomButton;
  RB, BB: TCustomButton;
  SystemInfoSrv: IFMXSystemInformationService;

  procedure UpdateTrack;
  begin
    FreeTrack;
    FTrackChanging := True;
    try
      if FValueRange.IsChanged then
        FValueRange.Changed;
      if Orientation = TOrientation.Vertical then
        FTrack := VT
      else
        FTrack := HT;
      if FTrack <> nil then
      begin
        if Action is TCustomValueRangeAction then
          FTrack.Action := Action
        else
          FTrack.ValueRange.Assign(FValueRange);
        if FTrack.ValueRange.IsChanged then
          FTrack.ValueRange.Changed;
        FTrack.ValueRange.OnChanged := TrackChangedProc;
        FTrack.SmallChange := FSmallChange;
      end;
    finally
      FTrackChanging := False;
    end;
  end;

begin
  inherited;
  // When user clicks on style elements with thumbs or buttons, we need to transfer focus style to control.
  // For this purpose we set CanParentFocus.
  ResourceControl.CanParentFocus := True;
  HT := nil;
  VT := nil;
  if FindStyleResource<TCustomTrack>('htrack', HT) or FindStyleResource<TCustomTrack>('track', HT) then
  begin
    HT.FOrientation := TOrientation.Horizontal;
    HT.Max := Max;
    HT.Min := Min;
    HT.Value := Value;
    HT.ViewportSize := ViewportSize;
    HT.Visible := Orientation = TOrientation.Horizontal;
    HT.CanFocus := False;
    if TPlatformServices.Current.SupportsPlatformService(IFMXSystemInformationService, SystemInfoSrv) then
      HT.FMinThumbSize := SystemInfoSrv.GetMinScrollThumbSize;
    if HT.Visible then
      HT.Realign;
  end;
  if FindStyleResource<TCustomTrack>('vtrack', VT) or FindStyleResource<TCustomTrack>('track', VT) then
  begin
    VT.FOrientation := TOrientation.Vertical;
    VT.Max := Max;
    VT.Min := Min;
    VT.Value := Value;
    VT.ViewportSize := ViewportSize;
    VT.Visible := Orientation = TOrientation.Vertical;
    VT.CanFocus := False;
    if TPlatformServices.Current.SupportsPlatformService(IFMXSystemInformationService, SystemInfoSrv) then
      VT.FMinThumbSize := SystemInfoSrv.GetMinScrollThumbSize;
    if VT.Visible then
      VT.Realign;
  end;
  if not FTrackChanging then
    UpdateTrack;
  TB := nil;
  LB := nil;
  if FindStyleResource<TCustomButton>('leftbutton', LB) then
  begin
    LB.OnClick := DoMinButtonClick;
    LB.Visible := Orientation = TOrientation.Horizontal;
    LB.CanFocus := False;
    LB.RepeatClick := True;
  end;

  if FindStyleResource<TCustomButton>('topbutton', TB) then
  begin
    TB.OnClick := DoMinButtonClick;
    TB.Visible := Orientation = TOrientation.Vertical;
    TB.CanFocus := False;
    TB.RepeatClick := True;
  end;

  if Orientation = TOrientation.Vertical then
    FMinButton := TB
  else
    FMinButton := LB;

  RB := nil;
  BB := nil;
  if FindStyleResource<TCustomButton>('rightbutton', RB) then
  begin
    RB.OnClick := DoMaxButtonClick;
    RB.Visible := Orientation = TOrientation.Horizontal;
    RB.CanFocus := False;
    RB.RepeatClick := True;
  end;

  if FindStyleResource<TCustomButton>('bottombutton', BB) then
  begin
    BB.OnClick := DoMaxButtonClick;
    BB.Visible := Orientation = TOrientation.Vertical;
    BB.CanFocus := False;
    BB.RepeatClick := True;
  end;

  if Orientation = TOrientation.Vertical then
  begin
    FMaxButton := BB;
    MinClipHeight := 29;
    MinClipWidth := 8;
  end
  else
  begin
    FMaxButton := RB;
    MinClipHeight := 8;
    MinClipWidth := 29;
  end;
end;

procedure TScrollBar.FreeStyle;
begin
  FreeTrack;
  FMinButton := nil;
  FMaxButton := nil;
  inherited;
end;

function TScrollBar.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.PositionLinkID then
    Result := True;
end;

function TScrollBar.GetIncrement: Double;
begin
  if FTrack <> nil then
    Result := FTrack.GetIncrement
  else
    Result := 0;
end;

procedure TScrollBar.DoSmallChange(N: Integer);
var
  Inc: Double;
begin
  if N <> 0 then
  begin
    Inc := GetIncrement;
    if not SameValue(Inc, 0) then
    begin
      Inc := Inc * N;
      FValueRange.BeginUpdate;
      try
        FTrack.SetNewValue(Value + Inc);
        Value := Value + Inc;
      finally
        FValueRange.EndUpdate;
      end;
    end;
  end;
end;

procedure TScrollBar.DoMinButtonClick(Sender: TObject);
begin
  SetFocus;
  DoSmallChange(-1);
end;

procedure TScrollBar.DoMaxButtonClick(Sender: TObject);
begin
  SetFocus;
  DoSmallChange(1);
end;

function TScrollBar.GetActionLinkClass: TActionLinkClass;
begin
  Result := TValueRangeActionLink;
end;

function TScrollBar.DefStored: Boolean;
begin
  if (FTrack <> nil) then
    Result := FTrack.DefStored
  else
    Result := True;
end;

function TScrollBar.MaxStored: Boolean;
begin
  Result := DefStored and (not SameValue(Max, DefaultValueRange.Max));
end;

function TScrollBar.MinStored: Boolean;
begin
  Result := DefStored and (not SameValue(Min, DefaultValueRange.Min));
end;

function TScrollBar.ValueStored: Boolean;
begin
  Result := DefStored and (not SameValue(Value, DefaultValueRange.Value));
end;

function TScrollBar.ViewportSizeStored: Boolean;
begin
  Result := DefStored and (not SameValue(ViewportSize, DefaultValueRange.ViewportSize));
end;

procedure TScrollBar.DoActionClientChanged;
begin
  inherited;
  if (FTrack <> nil) and (not ActionClient) then
    FTrack.Action := nil;
end;

procedure TScrollBar.ActionChange(Sender: TBasicAction;
  CheckDefaults: Boolean);
begin
  if FTrack <> nil then
    FTrack.Action := Sender;
  inherited;
end;

function TScrollBar.GetValueRange: TValueRange;
begin
  Result := FValueRange;
end;

procedure TScrollBar.SetValueRange(const Value: TValueRange);
begin
  FValueRange.Assign(Value);
end;

function TScrollBar.GetMax: Single;
begin
  Result := FValueRange.Max;
end;

function TScrollBar.GetMin: Single;
begin
  Result := FValueRange.Min;
end;

function TScrollBar.GetValue: Single;
begin
  Result := FValueRange.Value;
end;

function TScrollBar.GetViewportSize: Single;
begin
  Result := FValueRange.ViewportSize;
end;

procedure TScrollBar.SetMax(const Value: Single);
begin
  FValueRange.Max := Value;
end;

procedure TScrollBar.SetMin(const Value: Single);
begin
  FValueRange.Min := Value;
end;

procedure TScrollBar.SetValue(const Value: Single);
begin
  FValueRange.Value := Value;
end;

procedure TScrollBar.SetViewportSize(const Value: Single);
begin
  FValueRange.ViewPortSize := Value;
end;

procedure TScrollBar.SetOrientation(const Value: TOrientation);
var
  T: Single;
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    // swap
    if ([csDestroying, csLoading] * ComponentState) = [] then
    begin
      T := Width;
      Width := Height;
      Height := T;
    end;
    DoStyleChanged;
  end;
end;

procedure TScrollBar.DoChanged;
begin
  if Assigned(FOnChange) and not (csLoading in ComponentState) then
    FOnChange(Self);
  if Observers.IsObserving(TObserverMapping.PositionLinkID) then
    TLinkObservers.PositionLinkPosChanged(Observers);
end;

function TScrollBar.SmallChangeStored: Boolean;
begin
  Result := not SameValue(SmallChange, 1);
end;

function TScrollBar.GetSmallChange: Single;
begin
  Result := FSmallChange;
end;

procedure TScrollBar.SetSmallChange(const Value: Single);
begin
  FSmallChange := Value;
  if FTrack <> nil then
    FTrack.SmallChange := FSmallChange;
end;

{ TSmallScrollBar }

constructor TSmallScrollBar.Create(AOwner: TComponent);
begin
  inherited;
end;

function TSmallScrollBar.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(150, 8);
end;

procedure TSmallScrollBar.ApplyStyle;
begin
  inherited;
  MinClipWidth := 8;
  MinClipHeight := 8;
end;

{ TAniIndicator }

constructor TAniIndicator.Create(AOwner: TComponent);
begin
  inherited;
  FFill := TBrush.Create(TBrushKind.Solid, $FFBABABA);
  Enabled := False;
  DisableDisappear := True;
  SetAcceptsControls(False);
end;

procedure TAniIndicator.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

destructor TAniIndicator.Destroy;
begin
  FreeAndNil(FFill);
  inherited;
end;

function TAniIndicator.EnabledStored: Boolean;
begin
  if ActionClient then
    Result := True
  else
    Result := Enabled;
end;

procedure TAniIndicator.ApplyStyleLookup;
begin
  if IsNeedStyleLookup then
  begin
    inherited;
    if FAni = nil then
    begin
      FLayout := TRotationControl.Create(Self);
      FLayout.Parent := Self;
      FLayout.Align := TAlignLayout.Contents;
      FLayout.Locked := True;
      FLayout.Stored := False;
      FLayout.HitTest := False;
      IControl(FLayout).SetAcceptsControls(False);
      FAni := TFloatAnimation.Create(Self);
      FAni.Parent := FLayout;
      FAni.Loop := True;
      TFloatAnimation(FAni).StartValue := 0;
      TFloatAnimation(FAni).StopValue := 360;
      TFloatAnimation(FAni).Duration := 10;
      TFloatAnimation(FAni).PropertyName := 'RotationAngle';
    end;
    if csDesigning in ComponentState then
    begin
      FAni.Start;
      FAni.Stop;
    end
    else if Enabled then
      FAni.Start
    else
      FAni.Stop;
  end
  else
    inherited;
end;

procedure TAniIndicator.ApplyStyle;
var
  O: TFmxObject;
  BO: IBrushObject;
begin
  inherited;
  O := FindStyleResource('text');
  if O is TText then
  begin
    TText(O).Text := '';
    FFill.Kind := TBrushKind.Solid;
    FFill.Color := TText(O).Color;
  end;
  O := FindStyleResource('fill');
  if Supports(O, IBrushObject, BO) then
    FFill.Assign(BO.Brush);
  FindStyleResource<TAnimation>('ani', FAni);
end;

procedure TAniIndicator.FreeStyle;
begin
  FreeAndNil(FLayout);
  FAni := nil;
  inherited;
end;

procedure TAniIndicator.Paint;
var
  a: Integer;
  P, P2: TPointF;
  wSize, eSize: Single;
  V: Single;
  Fill: TBrush;
  Stroke: TStrokeBrush;
  LRotatedControl: IRotatedControl;
begin
  if Supports(FLayout, IRotatedControl, LRotatedControl) then
  begin
    if Width < Height then
      wSize := Width / 2
    else
      wSize := Height / 2;
    eSize := wSize / 3.7;
    wSize := wSize - eSize;

    case FStyle of
      TAniIndicatorStyle.Linear:
        begin
          Stroke := TStrokeBrush.Create(TBrushKind.Solid, FFill.Color);
          Stroke.Thickness := eSize / 2;
          for a := 0 to 11 do
          begin
            P := PointF(Width / 2 + (cos(DegToRad(a * 30)) * wSize), Height / 2 + (sin(DegToRad(a * 30)) * wSize));
            P2 := PointF(Width / 2 + (cos(DegToRad(a * 30)) * (wSize / 2)), Height / 2 + (sin(DegToRad(a * 30)) * (wSize / 2)));
            Canvas.DrawLine(P, P2, Opacity * 0.2, Stroke);
            if Enabled then
            begin
              V := ((trunc(LRotatedControl.RotationAngle) + (30 - trunc((a / 12) * 30))) mod 30) / 30;
              if V > 1 then
                V := Abs(V - 2);
              V := 1 - V;
              Canvas.DrawLine(P, P2, V * Opacity, Stroke);
            end;
          end;
          Stroke.Free;
        end;
      TAniIndicatorStyle.Circular:
        begin
          Fill := TBrush.Create(TBrushKind.Solid, FFill.Color);
          for a := 0 to 7 do
          begin
            P := PointF(Width / 2 + (cos(DegToRad(a * 45)) * wSize), Height / 2 + (sin(DegToRad(a * 45)) * wSize));
            Canvas.FillEllipse(RectF(P.X - eSize, P.Y - eSize, P.X + eSize, P.Y + eSize), Opacity * 0.2, Fill);
            if Enabled then
            begin
              V := ((trunc(LRotatedControl.RotationAngle) + (30 - trunc((a / 7) * 30))) mod 30) / 30;
              if V > 1 then
                V := Abs(V - 2);
              V := 1 - V;
              Canvas.FillEllipse(RectF(P.X - eSize, P.Y - eSize, P.X + eSize, P.Y + eSize), V * Opacity, Fill);
            end;
          end;
          Fill.Free;
        end;
    end;
  end;
end;

procedure TAniIndicator.SetEnabled(const Value: Boolean);
begin
  if Enabled <> Value then
  begin
    inherited ;
    if FAni <> nil then
    begin
      if Enabled then
        FAni.Start
      else
        FAni.Stop;
    end;
  end;
end;

procedure TAniIndicator.SetStyle(const Value: TAniIndicatorStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Repaint;
  end;
end;

type
  TArcValueRange = class (TValueRange)
  protected
    function MaxStored: Boolean; override;
    function MinStored: Boolean; override;
  public
    procedure Clear; override;
  end;
{ TArcValueRange }

procedure TArcValueRange.Clear;
begin
  BeginUpdate;
  try
    inherited;
    Self.Min := -180;
    Self.Max := 180;
  finally
    EndUpdate;
  end;
end;

function TArcValueRange.MaxStored: Boolean;
begin
  Result := not SameValue(Max, 180);
end;

function TArcValueRange.MinStored: Boolean;
begin
  Result := not SameValue(Min, -180);
end;

{ TArcDial }

function TArcDial.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True;
  if ID = TObserverMapping.ControlValueID then
    Result := True;
end;

constructor TArcDial.Create(AOwner: TComponent);
begin
  inherited;
  FOldValue := -360;
  FValueRange := TArcValueRange.Create(Self);
  FValueRange.BeforeChange := BeforeChangeProc;
  FValueRange.OnChanged := ValueRangeChangeProc;
  FValueRange.AfterChange := AfterChangedProc;
  FDefaultValueRange := TBaseValueRange.Create;
  FTracking := True;
  AutoCapture := True;
  SetAcceptsControls(False);
end;

destructor TArcDial.Destroy;
begin
  FreeAndNil(FDefaultValueRange);
  FreeAndNil(FValueRange);
  inherited;
end;

procedure TArcDial.AfterConstruction;
begin
  inherited;
  FDefaultValueRange.Assign(ValueRange.New);
end;

function TArcDial.GetData: TValue;
begin
  Result := Value;
end;

function TArcDial.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(30, 30);
end;

function TArcDial.FrequencyStored: Boolean;
begin
  Result := DefStored and (not SameValue(Frequency, DefaultValueRange.Frequency));
end;

function TArcDial.ValueStored: Boolean;
begin
  Result := DefStored and (not SameValue(Value, DefaultValueRange.Value));
end;

function TArcDial.GetFrequency: Single;
begin
  Result := FValueRange.Max - FValueRange.Min - FValueRange.ViewportSize;
  if Result > 0 then
    Result := (360 * FValueRange.Frequency) / Result
  else
    Result := 0;
end;

procedure TArcDial.SetFrequency(const Value: Single);
begin
  FValueRange.Frequency := (Value / 360) * (FValueRange.Max - FValueRange.Min - FValueRange.ViewportSize);
end;

procedure TArcDial.SetData(const Value: TValue);
begin
  if Value.IsType<TNotifyEvent> then
    OnChange := Value.AsType<TNotifyEvent>()
  else if Value.IsOrdinal then
    Self.Value := Value.AsOrdinal
  else if Value.IsType<Single> then
    Self.Value := Value.AsType<Single>
  else
    Self.Value := 0
end;

function TArcDial.GetActionLinkClass: TActionLinkClass;
begin
  Result := TValueRangeActionLink;
end;

procedure TArcDial.ActionChange(Sender: TBasicAction; CheckDefaults: Boolean);
begin
  if Sender is TValueRangeAction then
  begin
    if (not CheckDefaults) or (FValueRange.IsEmpty) then
      FValueRange.Assign(TValueRangeAction(Sender).ValueRange);
  end;
  inherited;
end;

function TArcDial.GetValueRange: TCustomValueRange;
begin
  Result := FValueRange;
end;

procedure TArcDial.Loaded;
begin
  if FValueRange.IsChanged then
    FValueRange.Changed(True);
  inherited;
end;

procedure TArcDial.SetValueRange(const AValue: TCustomValueRange);
begin
  FValueRange.Assign(AValue);
end;

procedure TArcDial.SetValueRange_(const Value: TValueRange);
begin
  FValueRange.Assign(Value);
end;

procedure TArcDial.ApplyStyle;
begin
  inherited;
  Tick;
  Text;
  Realign;
end;

function TArcDial.Tick: TControl;
var
  T: TFmxObject;
  LRotatedControl: IRotatedControl;
begin
  T := FindStyleResource('tick');
  if T is TControl then
  begin
    Result := TControl(T);
    if Supports(Result, IRotatedControl, LRotatedControl) then
      LRotatedControl.RotationAngle := -Value;
  end
  else
    Result := nil;
end;

function TArcDial.DefStored: Boolean;
begin
  Result := not (ActionClient and
                 (Action is TCustomValueRangeAction));
end;

procedure TArcDial.BeforeChangeProc(Sender: TObject);
begin
  if ActionClient and
    (not DefStored) and
    (not TValueRangeAction(Action).ValueRange.Changing) then
    TValueRangeAction(Action).ValueRange.Assign(FValueRange.New);
  FValueChanged := FValueRange.New.Value <> FValueRange.Value;
end;

procedure TArcDial.ValueRangeChangeProc(Sender: TObject);
var
  NewValue: single;
  LRotatedControl: IRotatedControl;
begin
  NewValue := Value;
  if not SameValue(NewValue, FOldValue) then
  begin
    FOldValue := NewValue;
    if Supports(Tick, IRotatedControl, LRotatedControl) then
      LRotatedControl.RotationAngle := -NewValue
    else
      Repaint;
    Text;
  end;
end;

procedure TArcDial.AfterChangedProc(Sender: TObject);
begin
  if FValueChanged and Assigned(OnChange) and not (csLoading in ComponentState) then
    OnChange(Self);
end;

function TArcDial.Text: TText;
var
  TextObject: TText;
begin
  if FindStyleResource<TText>('tracktext', TextObject) then
  begin
    TextObject.Visible := False; // FPressing;
    TextObject.Text := IntToStr(Round(Value)) + System.WideChar($B0);
    if FPressing and not FTracking then
      TextObject.Opacity := 1
    else
      TextObject.Opacity := 0;
  end;

  if FindStyleResource<TText>('text', TextObject) then
  begin
    Result := TextObject;
    Result.Visible := FShowValue;
    Result.Text := IntToStr(Round(Value)) + System.WideChar($B0);
    if not FShowValue then
      Result.Opacity := 0
    else
      Result.Opacity := 1;
  end
  else
    Result := nil;
end;

procedure TArcDial.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    FPressing := True;
    FSaveValue := Value;
    FValueRange.Tracking := Tracking;
    Text;
  end;
end;

procedure TArcDial.MouseMove(Shift: TShiftState; X, Y: Single);

  function AngleBetween(const Point1, Point2: TPointF): Single;
  begin
    if Point1.CrossProduct(Point2) < 0 then
      Result := ArcCos(Point1.AngleCosine(Point2))
    else
      Result := - ArcCos(Point1.AngleCosine(Point2));
  end;

var
  FNewValue: Single;
begin
  inherited;
  if (ssLeft in Shift) and FPressing then
  begin
    FNewValue := AngleBetween(TPointF.Create(1, 0), TPointF.Create(X - (Width / 2), Y - (Height / 2))) * 180 / Pi;
    if not SameValue(FNewValue, Value, TEpsilon.Angle) then
    begin
      Value := FNewValue;
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
      begin
        if TLinkObservers.EditLinkEdit(Observers) then
          TLinkObservers.EditLinkModified(Observers)
        else
        begin
          TLinkObservers.EditLinkReset(Observers);
          Exit;
        end;
      end;
      if Tracking then
      begin
        if Observers.IsObserving(TObserverMapping.EditLinkID) then
          TLinkObservers.EditLinkUpdate(Observers);
        if Observers.IsObserving(TObserverMapping.ControlValueID) then
        begin
          TLinkObservers.ControlValueModified(Observers);
          TLinkObservers.ControlValueUpdate(Observers);
        end;
      end;
    end;
  end;
end;

procedure TArcDial.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (Button = TMouseButton.mbLeft) and FPressing then
  begin
    FPressing := False;
    FValueRange.Tracking := True;
    Text;
    if Value <> FSaveValue then
    begin
      if Assigned(FOnChange) then
        FOnChange(Self);
      if not Tracking then
      begin
        if Observers.IsObserving(TObserverMapping.EditLinkID) then
          if TLinkObservers.EditLinkIsModified(Observers) then
            TLinkObservers.EditLinkUpdate(Observers);
        if Observers.IsObserving(TObserverMapping.ControlValueID) then
          TLinkObservers.ControlValueUpdate(Observers);
      end;
    end;
  end;
end;

function TArcDial.GetValue: Single;
begin
  Result := (FValueRange.RelativeValue * 360) - 180;
end;

procedure TArcDial.SetValue(const Value: Single);
var
  Tmp: Double;
begin
  Tmp := (Value - 180) / 360;
  FValueRange.RelativeValue := (Tmp - Ceil(Tmp)) + 1.0;
end;

procedure TArcDial.SetShowValue(const Value: Boolean);
begin
  if FShowValue <> Value then
  begin
    FShowValue := Value;
    Text;
    Repaint;
  end;
end;

{ TExpanderButton }

constructor TExpanderButton.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := False;
end;

{ TExpanderTextSettings }

type
  TExpanderTextSettings = class(TTextSettingsInfo.TCustomTextSettings)
  public
    constructor Create(const AOwner: TPersistent); override;
  published
    property Font;
    property FontColor;
    property HorzAlign;
    property VertAlign;
    property WordWrap default False;
    property Trimming;
  end;

constructor TExpanderTextSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  WordWrap := False;
end;

{ TExpander }

constructor TExpander.Create(AOwner: TComponent);
begin
  inherited;
  AutoTranslate := True;

  FIsExpanded := True;
  FIsChecked := True;
  FHeaderHeight := -1;
  FStyleHeaderHeight := -1;

  FContent := TContent.Create(Self);
  FContent.Stored := False;
  FContent.ClipChildren := False;
  FContent.HitTest := False;
  FContent.Locked := True;
  FContent.Margins.Top := cDefaultHeaderHeight;
  FContent.Width := Width;
  FContent.Height := Height;
  FContent.Parent := Self;
end;

procedure TExpander.DoAddObject(const AObject: TFmxObject);
begin
  if (FContent <> nil) and (AObject <> FContent) and (AObject <> ResourceLink) then
    FContent.AddObject(AObject)
  else
    inherited;
end;

function TExpander.GetTabList: ITabList;
begin
  if FContent <> nil then
    Result := FContent.GetTabList
  else
    Result := nil;
end;

function TExpander.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TExpanderTextSettings;
end;

procedure TExpander.ApplyStyle;
begin
  inherited;
  if FindStyleResource<TControl>('header', FHeader) then
  begin
    FStyleHeaderHeight := Round(FHeader.Height);
    FHeader.Height := EffectiveHeaderHeight;
  end;
  FContent.Margins.Top := EffectiveHeaderHeight;
  if FindStyleResource<TCheckBox>('checkbox', FCheck) then
  begin
    FCheck.Visible := FShowCheck;
    FCheck.IsChecked := FIsChecked;
    FCheck.OnChange := HandleCheckChange;
  end;
  if FindStyleResource<TCustomButton>('button', FButton) then
  begin
    FButton.OnClick := HandleButtonClick;
    FButton.ApplyStyleLookup;
    FButton.StartTriggerAnimation(Self, 'IsExpanded');
    FButton.CanFocus := False;
  end;
  StartTriggerAnimation(Self, 'IsExpanded');
  UpdateControlSize(False);
end;

procedure TExpander.FreeStyle;
begin
  FCheck := nil;
  FButton := nil;
  FHeader := nil;
  FStyleHeaderHeight := -1;
  inherited;
end;

function TExpander.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(200, 200);
end;

procedure TExpander.HandleButtonClick(Sender: TObject);
begin
  IsExpanded := not FIsExpanded;
end;

function TExpander.DefaultHeaderHeight: Integer;
begin
  if FStyleHeaderHeight <> -1 then
    Result := FStyleHeaderHeight
  else
    Result := cDefaultHeaderHeight;
end;

procedure TExpander.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('ContentSize', ReadContentSize, WriteContentSize, True);
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

procedure TExpander.ReadContentSize(Reader: TReader);
begin
  FContentHeight := StrToInt(Reader.ReadString);
end;

procedure TExpander.DoResized;
begin
  inherited;
  UpdateContentSize;
end;

function TExpander.DoSetSize(const ASize: TControlSize; const NewPlatformDefault: Boolean; ANewWidth,
  ANewHeight: Single; var ALastWidth, ALastHeight: Single): Boolean;
begin
  if FChangingState or IsExpanded then
    Result := inherited
  else
    Result := inherited DoSetSize(ASize, NewPlatformDefault, ANewWidth, Height, ALastWidth, ALastHeight);
  if not FChangingState and IsExpanded then
    FContentHeight := Round(ANewHeight - EffectiveHeaderHeight);
end;


procedure TExpander.WriteContentSize(Writer: TWriter);
begin
  if FContent <> nil then
    Writer.WriteString(IntToStr(Round(FContent.Height)));
end;

procedure TExpander.DoRealign;
begin
  inherited;
  if TNonReentrantHelper.EnterSection(FDisableAlign) then
    try
      UpdateContentSize;
    finally
      TNonReentrantHelper.LeaveSection(FDisableAlign);
    end;
end;

procedure TExpander.DoStyleChanged;
begin
  inherited;
  FStyleHeaderHeight := -1;
end;

procedure TExpander.UpdateContentSize;
begin
  if not (csLoading in ComponentState) and (FContent <> nil) and IsExpanded then
  begin
    FContent.Position.Point := TPointF.Create(0, EffectiveHeaderHeight);
    FContent.Size.Size := TSizeF.Create(Width, Height - EffectiveHeaderHeight);
  end;
end;

procedure TExpander.UpdateControlSize(const ChangingState: Boolean);
begin
  FChangingState := ChangingState;
  try
    if FIsExpanded then
    begin
      FContent.Visible := FIsExpanded;
      if FButton <> nil then
        Height := FButton.Height + FContentHeight;
      Repaint;
    end
    else
    begin
      Repaint;
      FContent.Visible := FIsExpanded;
      if FButton <> nil then
        Height := FButton.Height;
    end;
  finally
    FChangingState := False;
  end;
end;

procedure TExpander.SetIsExpanded(const Value: Boolean);
begin
  if FIsExpanded <> Value then
  begin
    if not (csLoading in ComponentState) then
      ApplyStyleLookup;
    try
      ExpandedChanging;
      FIsExpanded := Value;
      UpdateControlSize(True);
      StartTriggerAnimation(Self, 'IsExpanded');
      if FButton <> nil then
        FButton.StartTriggerAnimation(Self, 'IsExpanded');
      ExpandedChanged;
    except
      on EAbort do begin
        // Aborted, state unchanged
      end
      else
        raise;
    end;
  end;
end;

procedure TExpander.HandleCheckChange(Sender: TObject);
begin
  if FCheck <> nil then
  begin
    FIsChecked := FCheck.IsChecked;
    FContent.Enabled := FIsChecked;
    if Assigned(OnCheckChange) then
      OnCheckChange(Self);
  end;
end;

procedure TExpander.SetIsChecked(const Value: Boolean);
begin
  if FIsChecked <> Value then
  begin
    FIsChecked := Value;
    FContent.Enabled := FIsChecked;
    DoCheckedChanged;
    if FCheck <> nil then
      FCheck.IsChecked := FIsChecked;
  end;
end;

procedure TExpander.DoCheckedChanged;
begin
end;

procedure TExpander.SetShowCheck(const Value: Boolean);
begin
  if FShowCheck <> Value then
  begin
    FShowCheck := Value;
    if FCheck <> nil then
      FCheck.Visible := FShowCheck;
  end;
end;

function TExpander.GetHeaderHeight: Integer;
begin
  Result := FHeaderHeight;
end;

procedure TExpander.SetHeaderHeight(const Value: Integer);
var
  SetValue: Integer;
begin
  SetValue := Value;
  if SetValue < -1 then
    SetValue := -1;
  FHeaderHeight := SetValue;
  if FHeader <> nil then
    if SetValue = -1 then
      FHeader.Height := DefaultHeaderHeight
    else
      FHeader.Height := SetValue;
  UpdateContentSize;
end;

function TExpander.EffectiveHeaderHeight: Integer;
begin
  if FHeaderHeight > -1 then
    Result := FHeaderHeight
  else if FHeader <> nil then
    Result := Round(FHeader.Height)
  else
    Result := cDefaultHeaderHeight;
end;

procedure TExpander.DoExpandedChanged;
begin
end;

procedure TExpander.ExpandedChanged;
begin
  if Assigned(FOnExpandedChanged) then
    FOnExpandedChanged(Self);
  DoExpandedChanged;
end;

procedure TExpander.ExpandedChanging;
begin
  if Assigned(FOnExpandedChanging) then
    FOnExpandedChanging(Self);
  DoExpandedChanging;
end;

procedure TExpander.DoExpandedChanging;
begin
end;



{ TImageControl }

constructor TImageControl.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := True;
  FEnableOpenDialog := True;
  FBitmap := TBitmap.Create;
  FBitmap.OnChange := DoBitmapChanged;
  SetAcceptsControls(False);
  EnableExecuteAction := True;
end;

destructor TImageControl.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

function TImageControl.GetData: TValue;
begin
  Result := Bitmap;
end;

function TImageControl.GetDefaultSize: TSizeF;
begin
  Result := TSizeF.Create(100, 100);
end;

procedure TImageControl.SetData(const Value: TValue);
begin
  if Value.IsEmpty then
    Bitmap.SetSize(0, 0)
  else if (Value.IsObject) and (Value.AsObject is TPersistent) then
    Bitmap.Assign(TPersistent(Value.AsObject))
  else
    Bitmap.LoadFromFile(Value.ToString)
end;

procedure TImageControl.ApplyStyle;
begin
  inherited;
  if FindStyleResource<TImage>('image', FImage) then
    UpdateImage;
end;

procedure TImageControl.FreeStyle;
begin
  FImage := nil;
  inherited;
end;

function TImageControl.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  //  Note that the user code is responsible for calling
  //  TLinkObservers.ControlChanged modifying the image
  if ID = TObserverMapping.EditLinkID then
    Result := True;
end;

procedure TImageControl.LoadFromFile(const FileName: string);
begin
  Bitmap.LoadFromFile(FileName);
  try
    DoLoadFromFile(FileName);
  except
    Application.HandleException(Self);
  end;
end;

procedure TImageControl.DoLoadFromFile(const FileName: string);
begin
  if Assigned(FOnLoaded) then
    FOnLoaded(Self, FileName);
end;

function TImageControl.ShowOpenDialog: Boolean;
var
  OpenDialog: TOpenDialog;
begin
  Result := False;
  if FEnableOpenDialog then
  begin
    OpenDialog := TOpenDialog.Create(nil);
    try
      OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
      Result := OpenDialog.Execute;
      if Result then
        LoadFromFile(OpenDialog.FileName);
    finally
      OpenDialog.Free;
    end;
  end;
end;

procedure TImageControl.Click;
begin
  inherited;
  ShowOpenDialog;
end;

procedure TImageControl.DragOver(const Data: TDragObject; const Point: TPointF; var Operation: TDragOperation);
begin
  inherited;
  // accept correct image file or TImage
  if ((Length(Data.Files) > 0) and FileExists(Data.Files[0]) and
    (TBitmapCodecManager.CodecExists(Data.Files[0]))) or (Data.Source is TImage) then
    Operation := TDragOperation.Link
  else
    Operation := TDragOperation.None;
end;

procedure TImageControl.DragDrop(const Data: TDragObject; const Point: TPointF);
begin
  inherited;
  if Data.Source is TImage then
    Bitmap.Assign(TImage(Data.Source).Bitmap)
  else if Length(Data.Files) > 0 then
    Bitmap.LoadFromFile(Data.Files[0]);
end;

procedure TImageControl.SetBitmap(const Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TImageControl.UpdateImage;
begin
  if (FImage <> nil) then
  begin
    if not FBitmap.IsEmpty then
      FImage.Bitmap.Assign(FBitmap)
    else
      FImage.Bitmap.SetSize(0, 0);
  end;
end;

procedure TImageControl.DoBitmapChanged(Sender: TObject);
begin
  UpdateImage;
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

{ TPathLabel }

constructor TPathLabel.Create(AOwner: TComponent);
begin
  inherited;
  HitTest := False;
  FPath := TPath.Create(nil);
  FPath.Parent := Self;
  FPath.Stored := False;
  FPath.Locked := True;
  FPath.HitTest := False;
  FPath.Align := TAlignLayout.Contents;
  SetAcceptsControls(False);
end;

procedure TPathLabel.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty('TabOrder', IgnoreIntegerValue, nil, False);
end;

destructor TPathLabel.Destroy;
begin
  FreeAndNil(FPath);
  inherited;
end;

procedure TPathLabel.ApplyStyle;
var
  TextObject: TText;
begin
  inherited;
  if FindStyleResource<TText>('text', TextObject) then
  begin
    TextObject.Text := '';
    if FPath <> nil then
    begin
      FPath.Fill.Kind := TBrushKind.Solid;
      FPath.Fill.Color := TextObject.Color;
      FPath.Stroke.Kind := TBrushKind.None;
    end;
  end;
end;

procedure TPathLabel.FreeStyle;
begin
  inherited;
end;

function TPathLabel.GetPathData: TPathData;
begin
  Result := FPath.Data;
end;

function TPathLabel.GetWrapMode: TPathWrapMode;
begin
  Result := FPath.WrapMode;
end;

procedure TPathLabel.SetPathData(const Value: TPathData);
begin
  FPath.Data.Assign(Value);
end;

procedure TPathLabel.SetWrapMode(const Value: TPathWrapMode);
begin
  FPath.WrapMode := Value;
end;

procedure RegisterAliases;
begin
  AddEnumElementAliases(TypeInfo(TMouseDownAction), ['mdaGoto', 'mdaNone']);
  AddEnumElementAliases(TypeInfo(TAniIndicatorStyle), ['aiLinear', 'aiCircular']);
end;

procedure UnregisterAliases;
begin
  RemoveEnumElementAliases(TypeInfo(TMouseDownAction));
  RemoveEnumElementAliases(TypeInfo(TAniIndicatorStyle));
end;

initialization
  RegisterAliases;
  RegisterFmxClasses([TThumb, TExpanderButton, TSizeGrip, TCheckBox, TRadioButton,
    TGroupBox, TPanel, TCalloutPanel, TLabel, TImageControl, TPathLabel, TProgressBar,
    TTrack, TScrollBar, TSmallScrollBar, TAniIndicator, TExpander, TTrackBar, TSplitter,
    TStatusBar, TToolBar, TButton, TSpeedButton, TArcDial, TSwitch, TCornerButton]);
finalization
  UnregisterAliases;
end.
