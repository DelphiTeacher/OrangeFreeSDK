{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.TabControl;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.UITypes, System.Types, System.Actions, System.ImageList, System.Generics.Collections,
  FMX.ActnList, FMX.Types, FMX.Controls, FMX.MultiResBitmap, FMX.ImgList, FMX.InertialMovement, FMX.BehaviorManager,
  FMX.Graphics;

type
  TTabControl = class;
  TTabItem = class;
  TTabItemClass = class of TTabItem;

  TTabTransition = (None, Slide);

  TTabTransitionHelper = record helper for TTabTransition
  const
    ttNone = TTabTransition.None deprecated 'Use TTabTransition.None';
    ttSlide = TTabTransition.Slide deprecated 'Use TTabTransition.Slide';
  end;

  TTabTransitionDirection = (Normal, Reversed);

  TTabTransitionDirectionHelper = record helper for TTabTransitionDirection
  const
    tdNormal = TTabTransitionDirection.Normal deprecated 'Use TTabTransitionDirection.Normal';
    tdReversed = TTabTransitionDirection.Reversed deprecated 'Use TTabTransitionDirection.Reversed';
  end;

  TTabControlAction = class(TCustomAction)
  private
    [Weak] FTabControl: TTabControl;
    FTransition: TTabTransition;
    FDirection: TTabTransitionDirection;
    procedure SetTabControl(const Value: TTabControl);
  protected
    function FindVisibleTab(LeftToRight: Boolean): Integer;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property TabControl: TTabControl read FTabControl write SetTabControl;
    property Transition: TTabTransition read FTransition write FTransition default TTabTransition.Slide;
    property Direction: TTabTransitionDirection read FDirection write FDirection default TTabTransitionDirection.Normal;
  public
    constructor Create(AOwner: TComponent); override;
    function GetEnsuingTabIndex: Integer; virtual;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    function Update: Boolean; override;
  end;

  TChangeTabAction = class(TTabControlAction)
  private
    [Weak] FTab: TTabItem;
    procedure SetTab(const Value: TTabItem);
    procedure UpdateTabControl;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    function GetEnsuingTabIndex: Integer; override;
    procedure CustomTextChanged; override;
    procedure ExecuteTarget(Target: TObject); override;
    function Update: Boolean; override;
  published
    property CustomText;
    property Tab: TTabItem read FTab write SetTab;
    property Direction;
    property Transition;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property OnUpdate;
  end;

  TNextTabAction = class(TTabControlAction)
  public
    function GetEnsuingTabIndex: Integer; override;
    procedure CustomTextChanged; override;
  published
    property TabControl;
    property CustomText;
    property Direction;
    property Transition;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property OnUpdate;
  end;

  TPreviousTabAction = class(TTabControlAction)
  public
    function GetEnsuingTabIndex: Integer; override;
    procedure CustomTextChanged; override;
  published
    property TabControl;
    property CustomText;
    property Direction;
    property Transition;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property OnUpdate;
  end;

  { TTabItem }

  TTabItem = class(TTextControl, IGlyph)
  public const
    DotStyleName = 'tabdotstyle';
    DotSize = 8;
  public type
    /// <summary> The record for store of additional information about the sizes of the tab title</b> </summary>
    TTabItemInfo = record
      /// <summary> The size of the style element <c>layoutstyle</c>. If it is not present then <c>-1</c>, <c>-1</c>
      /// </summary>
      LayoutControlSize: TSizeF;
      /// <summary> The autocalculated size of the tab title </summary>
      Size: TSizeF;
      /// <summary> Size which was set manually when <c>AutoSize</c> was <c>False</c></summary>
      ExplicitSize: TSizeF;
    end;
    TPaintPart = (All, ResourceControl, Children, Nothing);
  private type
    TSizeState = (Invalid, Calculating, Calculated);
  strict private
    FSizeState: TSizeState;
    FInfo: TTabItemInfo;
    FContent: TContent;
  private
    FTabControl: TTabControl;
    FLeftOffset: Single;
    FRightOffset: Single;
    FAutoSize: Boolean;
    FOriginalGlyphSize: TSizeF;
    FOriginalIconSize: TSizeF;
    FIsSelected: Boolean;
    FCustomIcon: TFixedMultiResBitmap;
    FItemStyle: TControl;
    FIconObject: IMultiResBitmapObject;
    FIconControl: TControl;
    FLayoutControl: TControl;
    FOldLayoutWidth: Single;
    FOldIconControlVisible: Boolean;
    FCanTouchClick: Boolean;
    FBeginPanPosition: TPointF;
    FGlyph: TGlyph;
    FImageLink: TGlyphImageLink;
    FShowAsDot: Boolean;
    FCustomStyleLookup: string;
    FPaintPart: TPaintPart;
    function GetInfo: TTabItemInfo;
    procedure SetAutoSize(const Value: Boolean);
    procedure SetIsSelected(const Value: Boolean);
    procedure SetCustomIcon(const Value: TFixedMultiResBitmap);
    function GetImages: TCustomImageList;
    procedure SetImages(const Value: TCustomImageList);
    { IGlyph }
    function GetImageIndex: TImageIndex;
    procedure SetImageIndex(const Value: TImageIndex);
    function GetImageList: TBaseImageList; inline;
    procedure SetImageList(const Value: TBaseImageList);
    function IGlyph.GetImages = GetImageList;
    procedure IGlyph.SetImages = SetImageList;
    procedure UpdateIcon;
    procedure SetSelectedInternal(const Value: Boolean);
    procedure UpdateLayoutControl;
    procedure SetShowAsDot(const Value: Boolean);
    function GetStyleLookup: string;
    procedure SetStyleLookup(const Value: string);
    procedure ReadExplicitSizeCx(Reader: TReader);
    procedure ReadExplicitSizeCy(Reader: TReader);
    procedure WriteExplicitSizeCx(Writer: TWriter);
    procedure WriteExplicitSizeCy(Writer: TWriter);
    function TouchEnabled: Boolean;
    procedure TouchClick;
    procedure UpdatePaintPart;
    procedure SetPaintPart(const Value: TPaintPart);
  protected
    procedure CalcSize;
    /// <summary> Marks calculated as invalid, so that later on it will re-calculated </summary>
    /// <returns> <c>False</c> if the status hasn't changed, for example if the call happened at the moment of calculation of
    /// the sizes </returns>
    function InvalidateSize: Boolean;
    /// <summary> Calls <b>TabControl.RealignTabs</b>, if possible </summary>
    /// <returns> <c>False</c> if the call is not executed. For example, in the case of recursive calls </returns>
    function RealignTabs: Boolean;
    function GetDefaultStyleLookupName: string; override;
    procedure ChangeOrder; override;
    /// <summary> This property contains information about the size of the tab title. It is initialized in method
    /// <b>CalcSize</b> </summary>
    property Info: TTabItemInfo read GetInfo;
    procedure DoAddObject(const AObject: TFmxObject); override;
    procedure DoChanged; override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure SetText(const Value: string); override;
    function FindTextObject: TFmxObject; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseClick(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DblClick; override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    /// <summary> Should be called when you change an instance or reference to instance of <b>TBaseImageList</b> or the
    /// <b>ImageIndex</b> property
    /// <para>See also <b>FMX.ActnList.IGlyph</b></para></summary>
    procedure ImagesChanged; virtual;
    /// <summary> Determines whether the <b>ImageIndex</b> property needs to be stored in the fmx-file</summary>
    /// <returns> <c>True</c> if the <b>ImageIndex</b> property needs to be stored in the fmx-file</returns>
    function ImageIndexStored: Boolean; virtual;
    procedure ParentChanged; override;
    procedure Hide; override;
    procedure Show; override;
    function DoSetSize(const ASize: TControlSize; const NewPlatformDefault: Boolean; ANewWidth, ANewHeight: Single;
      var ALastWidth, ALastHeight: Single): Boolean; override;
    property Align;
    property RotationAngle;
    property RotationCenter;
    property Position;
    function GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass; override;
    procedure CMGesture(var EventInfo: TGestureEventInfo); override;
    { IAcceleratorKeyReciever }
    /// <summary>Reimplementation of TTextControl.TriggerAcceleratorKey</summary>
    procedure TriggerAcceleratorKey; override;

    procedure PaintChildren; override;
    procedure Painting; override;
    procedure Paint; override;
    procedure DoPaint; override;
    procedure AfterPaint; override;
    /// <summary> This property specifies the part of the page that needs be painted. This property is set by
    /// <b>TTabControl</b> during painting </summary>
    property PaintPart: TPaintPart read FPaintPart write SetPaintPart;
    /// <summary> This is control that contains all other controls which you dropped to the <b>TabItem</b> </summary>
    property Content: TContent read FContent;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetTabList: ITabList; override;
    property TabControl: TTabControl read FTabControl;
    property WordWrap;
    property Font;
    property VertTextAlign;
    property TextAlign default TTextAlign.Center;
    property Trimming;
    /// <summary> If this property is <c>True</c> then property <b>StyleLookup</b> is ignored, and always the style
    /// <c>'tabdotstyle'</c> is used. See <b>GetDefaultStyleLookupName</b>
    /// </summary>
    property ShowAsDot: Boolean read FShowAsDot write SetShowAsDot;
    /// <summary> The list of images. Can be <c>nil</c>. <para>See also <b>FMX.ActnList.IGlyph</b></para></summary>
    property Images: TCustomImageList read GetImages;
  published
    { props }
    property AutoTranslate default True;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property CanFocus default True;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property CustomIcon: TFixedMultiResBitmap read FCustomIcon write SetCustomIcon;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property TextSettings;
    property StyledSettings;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest default True;
    { trigger }
    property IsSelected: Boolean read FIsSelected write SetIsSelected;
    property Index stored False;
    /// <summary> Zero based index of an image. The default is <c>-1</c>.
    /// <para> See also <b>FMX.ActnList.IGlyph</b></para></summary>
    /// <remarks> If non-existing index is specified, an image is not drawn and no exception is raised</remarks>
    property ImageIndex: TImageIndex read GetImageIndex write SetImageIndex stored ImageIndexStored;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Scale;
    property Size;
    /// <summary> If the property <b>ShowAsDot</b> is <c>True</c> then the value <c>'tabdotstyle'</c> is always used.
    /// Otherwise the current value is used. </summary>
    property StyleLookup: string read GetStyleLookup write SetStyleLookup;
    property TabOrder;
    property TabStop;
    property Text;
    property TouchTargetExpansion;
    property Visible default True;
    property Width;
    property ParentShowHint;
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

  { TTabControl }

  TTabPosition = (Top, Bottom, None, Dots, PlatformDefault);

  TTabPositionHelper = record helper for TTabPosition
  const
    tpTop = TTabPosition.Top deprecated 'Use TTabPosition.Top';
    tpBottom = TTabPosition.Bottom deprecated 'Use TTabPosition.Bottom';
    tpNone = TTabPosition.None deprecated 'Use TTabPosition.None';
    tpDots = TTabPosition.Dots deprecated 'Use TTabPosition.Dots';
  end;

  TTabControl = class(TStyledControl, IItemsContainer, IGlyph)
  public type
    TFindKind = (Next, Back, First, Last, Current);
    TTabBarButton = (Left, Right);
    TTabBarButtons = set of TTabBarButton;
    TArrayTabBarControls = array [TTabBarButton] of TControl;
  public const
    DefaultButtons = [TTabBarButton.Left, TTabBarButton.Right];
    ///<summary> The styles names which used for the buttons in the header area </summary>
    ButtonStyleNames: array [TTabBarButton] of string = ('spinleftbutton', 'spinrightbutton');
  private
    FContent: TContent;
    FNoItemsContent: TControl;
    FTabIndex: Integer;
    FTabHeight: Single;
    FFullSize: TBehaviorBoolean;
    FRealigningTabs: Boolean;
    FTabPosition: TTabPosition;
    FBackground: TControl;
    FScrollBackground: TBrushObject;
    FDefaultFullSize: Boolean;
    FFixedTabHeight: Boolean;
    FOnChange: TNotifyEvent;
    FTransitionRunning: Boolean;
    FTransitionTabs: array of TTabItem;
    FTabPositionSet: Boolean;
    FImageLink: TGlyphImageLink;
    [Weak] FImages: TCustomImageList;
    FTabBarRect: TRectF;
    FClientRect: TRectF;
    FTabContentSize: TSizeF;
    FHasTouchScreen: Boolean;
    FTabBarControlPanel: TControl;
    FTabBarButtons: TTabBarButtons;
    FTabBarControls: TArrayTabBarControls;
    FAniCalculations: TAniCalculations;
    FInternalContentPosition: Single;
    FIndexOfTargetTab: Integer;
    FStoredTabSize: TList<TSizeF>;
    procedure SetTabIndex(const Value: Integer);
    procedure SetTabHeight(const Value: Single);
    procedure SetFullSize(const Value: TBehaviorBoolean);
    function GetActiveTab: TTabItem;
    procedure SetActiveTab(const Value: TTabItem);
    procedure SetTabPosition(const Value: TTabPosition);
    procedure ApplyTabsStyleLookup;
    function GetImages: TCustomImageList;
    procedure SetImages(const Value: TCustomImageList);
    { IGlyph }
    function GetImageIndex: TImageIndex;
    procedure SetImageIndex(const Value: TImageIndex);
    function GetImageList: TBaseImageList; inline;
    procedure SetImageList(const Value: TBaseImageList);
    function IGlyph.GetImages = GetImageList;
    procedure IGlyph.SetImages = SetImageList;
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    procedure WebBrowserRealign(Sender: TObject);
    procedure AnimationFinished(Sender: TObject);
    procedure SetTabBarButtons(const Value: TTabBarButtons);
    procedure TabButtonClick(Sender: TObject);
    procedure SetTabContentPosition(const Value: Single);
    function GetTabContentPosition: Single;
    procedure SetInternalContentPosition(const Value: Double);
    function RoundByScale(const Value: Double): Single;
    function TabBarControlsWidth: Single;
    procedure UpdateAnimation(const DotItems: Boolean; const ActiveTabLeft, ActiveTabRight: Single);
    procedure ReadSizes(Reader: TReader);
    procedure WriteSizes(Writer: TWriter);
    procedure AddOrInsertObject(const AObject: TFmxObject; const Index: Integer = MaxInt);
    function IsSpecialObject(const AObject: TFmxObject): Boolean;
  protected
    function GetTabItem(AIndex: Integer): TTabItem;
    function GetTabCount: Integer;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Loaded; override;
    procedure PaintChildren; override;
    procedure RealignTabs; virtual;
    procedure DoRealign; override;
    procedure ContentAddObject(const AObject: TFmxObject);
    procedure ContentRemoveObject(const AObject: TFmxObject);
    procedure DoAddObject(const AObject: TFmxObject); override;
    procedure DoRemoveObject(const AObject: TFmxObject); override;
    procedure DoInsertObject(Index: Integer; const AObject: TFmxObject); override;
    procedure DoChange; virtual;
    procedure DialogKey(var Key: Word; Shift: TShiftState); override;
    procedure DefineProperties(Filer: TFiler); override;
    function GetEffectiveTabPosition: TTabPosition; virtual;
    /// <summary> This function is used for determine whether the tab buttons occupy all the space in the tabs band. See
    /// <b>FullSize</b> </summary>
    /// <returns> If <b>FullSize</b> property is <c>PlatformDefault</c> then <c>True</c> in case if the style element
    /// <b>FullSize</b> found. Otherwise returns same value as <b>FullSize</b> property </returns>
    function GetEffectiveFullSize: Boolean; virtual;
    /// <summary> This method tries to find some control by the specified coordinates on the screen. First, the search
    /// is performed among the additional buttons in the area of titles. See <b>DoUpdateTabBarButtons</b>,
    /// <b>TabBarButtons</b>. Then search is performed among tab titles. After that the search goes to the general rules
    /// </summary>
    function ObjectAtPoint(P: TPointF): IControl; override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); override;
    procedure Resize; override;
    /// <summary> Should be called when you change an instance or reference to instance of <b>TBaseImageList</b> or the
    /// <b>ImageIndex</b> property
    /// <para>See also <b>FMX.ActnList.IGlyph</b></para></summary>
    procedure ImagesChanged; virtual;
    /// <summary> This method is called from the <b>UpdateTabBarButtons</b>. You can override this method to change the
    /// location and appearance of the buttons in the area of titles of tabs. You shouldn't call this method manually
    /// </summary>
    procedure DoUpdateTabBarButtons(const TabBarButtons: TTabBarButtons; const TabPosition: TTabPosition;
      const Content: TContent; var TabBarControls: TArrayTabBarControls); virtual;
    procedure EnabledChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetActiveTabWithTransition(const ATab: TTabItem; ATransition: TTabTransition;
      const ADirection: TTabTransitionDirection = TTabTransitionDirection.Normal);

    function FindVisibleTab(var Index: Integer; const FindKind: TFindKind): Boolean; overload;
    function FindVisibleTab(const FindKind: TFindKind): Integer; overload;
    /// <summary> This method moves the area of titles of tabs so that the active tab will is visible. The movement is
    /// asynchronous. See <b>AniCalculations</b> </summary>
    procedure GoToActiveTab;
    function GotoVisibleTab(Index: Integer; ATransition: TTabTransition = TTabTransition.Slide;
      const ADirection: TTabTransitionDirection = TTabTransitionDirection.Normal): Boolean;
    function Next(ATransition: TTabTransition = TTabTransition.Slide;
      const ADirection: TTabTransitionDirection = TTabTransitionDirection.Normal): Boolean;
    function Previous(ATransition: TTabTransition = TTabTransition.Slide;
      const ADirection: TTabTransitionDirection = TTabTransitionDirection.Normal): Boolean;
    function First(ATransition: TTabTransition = TTabTransition.Slide;
      const ADirection: TTabTransitionDirection = TTabTransitionDirection.Normal): Boolean;
    function Last(ATransition: TTabTransition = TTabTransition.Slide;
      const ADirection: TTabTransitionDirection = TTabTransitionDirection.Normal): Boolean;
    function Delete(const Index: Integer): Boolean;
    function Add(const TabClass: TTabItemClass = nil): TTabItem;
    function Insert(const Index: Integer; const TabClass: TTabItemClass = nil): TTabItem;
    function HasActiveTab: Boolean;
    function GetTabList: ITabList; override;
    /// <summary> Update the state of the buttons in the area of titles of tabs. This method calls
    /// <b>DoUpdateTabBarButtons</b> method</summary>
    procedure UpdateTabBarButtons;
    property TabCount: Integer read GetTabCount;
    property Tabs[AIndex: Integer]: TTabItem read GetTabItem;
    /// <summary> This property contains settings smooth movement area of titles of tabs </summary>
    property AniCalculations: TAniCalculations read FAniCalculations;
    /// <summary> The coordinates of the rectangle where all of the tab titles placed </summary>
    property TabBarRect: TRectF read FTabBarRect;
    /// <summary> The size of the area which contains all the tab titles </summary>
    property TabContentSize: TSizeF read FTabContentSize;
    /// <summary> The position of the area tab headers. See also <b>TAniCalculations.ViewportPosition.X</b> </summary>
    property TabContentPosition: Single read GetTabContentPosition write SetTabContentPosition;

    property TransitionRunning: Boolean read FTransitionRunning;
    property EffectiveTabPosition: TTabPosition read GetEffectiveTabPosition;
    /// <summary> The actual value of <b>FullSize</b>. If <b>FullSize</b> is <c>PlatformDefault</c> then its value is
    /// depends by system </summary>
    property EffectiveFullSize: Boolean read GetEffectiveFullSize;
    /// <summary> If the system presents touchscreen, then this property is <c>True</c></summary>
    property HasTouchScreen: Boolean read FHasTouchScreen;
    /// <summary> This property specifies, what buttons would be displayed in the field names of the tabs. In fact,
    /// the set of buttons depends on the availability of the touchpad (see <b>HasTouchScreen</b>), the location of the
    /// headers (see <b>TabPosition</b>) and number of tabs. See also <b>DoUpdateTabBarButtons</b> </summary>
    property TabBarButtons: TTabBarButtons read FTabBarButtons write SetTabBarButtons default DefaultButtons;
  published
    property Align;
    property Anchors;
    property ActiveTab: TTabItem read GetActiveTab write SetActiveTab stored False;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property FullSize: TBehaviorBoolean read FFullSize write SetFullSize default TBehaviorBoolean.PlatformDefault;
    property Locked default False;
    property Height;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property HitTest default True;
    /// <summary> The list of images. Can be <c>nil</c>. <para>See also <b>FMX.ActnList.IGlyph</b></para></summary>
    property Images: TCustomImageList read GetImages write SetImages;
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
    property TabHeight: Single read FTabHeight write SetTabHeight;
    property TabIndex: Integer read FTabIndex write SetTabIndex default -1;
    property TabOrder;
    property TabStop;
    property TabPosition: TTabPosition read FTabPosition write SetTabPosition stored True;
    property TouchTargetExpansion;
    property Visible default True;
    property Width;
    property OnApplyStyleLookup;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
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

implementation

uses
  System.SysUtils, System.Math, System.Math.Vectors, System.Rtti, System.TypInfo, {$IFDEF MACOS}Macapi.CoreFoundation, {$ENDIF}
  FMX.StdCtrls, FMX.Utils, FMX.Effects, FMX.Consts, FMX.Ani, FMX.Forms, FMX.Platform, FMX.Pickers, FMX.WebBrowser;

{ TTabItemContent }

type
  TTabItemContent = class(TContent);

  TOpenControl = class(TControl);

  { TTabControlAction }

constructor TTabControlAction.Create(AOwner: TComponent);
begin
  inherited;
  FTransition := TTabTransition.Slide;
end;

function TTabControlAction.GetEnsuingTabIndex: Integer;
begin
  Result := -1;
end;

function TTabControlAction.FindVisibleTab(LeftToRight: Boolean): Integer;
var
  I: Integer;
begin
  Result := -1;
  if (TabControl <> nil) then
  begin
    I := TabControl.TabIndex;
    if LeftToRight then
    begin
      if TabControl.FindVisibleTab(I, TTabControl.TFindKind.Next) then
        Result := I;
    end
    else
    begin
      if TabControl.FindVisibleTab(I, TTabControl.TFindKind.Back) then
        Result := I;
    end;
  end;
end;

procedure TTabControlAction.ExecuteTarget(Target: TObject);
begin
  inherited;
  if (TabControl <> nil) then
  begin
    if TabControl.GotoVisibleTab(GetEnsuingTabIndex, FTransition, FDirection) and
      (FTransition = TTabTransition.Slide) then
      TabControl.GoToActiveTab;
  end;
end;

function TTabControlAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Supported;
end;

procedure TTabControlAction.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FTabControl) then
    TabControl := nil;
end;

procedure TTabControlAction.SetTabControl(const Value: TTabControl);
begin
  if FTabControl <> Value then
  begin
    if FTabControl <> nil then
      TComponent(FTabControl).RemoveFreeNotification(Self);
    FTabControl := Value;
    if FTabControl <> nil then
      TComponent(FTabControl).FreeNotification(Self);
    CustomTextChanged;
  end;
end;

function TTabControlAction.Update: Boolean;
var
  LTabIndex: Integer;
begin
  if Supported and ([csLoading, csDestroying] * ComponentState = []) then
    CustomTextChanged;
  if Supported then
    LTabIndex := GetEnsuingTabIndex
  else
    LTabIndex := -1;
  Enabled := (LTabIndex >= 0) and
    (LTabIndex < TabControl.TabCount) and
    (TabControl.Tabs[LTabIndex].Visible) and
    (not TabControl.TransitionRunning) and
    (TabControl.TabIndex <> LTabIndex);
  Result := inherited Update;
end;

{ TChangeTabAction }

procedure TChangeTabAction.CustomTextChanged;
begin
  if CustomText = '' then
  begin
    if FTab <> nil then
      Text := Format(SGotoTab, [FTab.Text])
    else
      Text := SGotoNilTab;
  end
  else
    Text := CustomText;
end;

function TChangeTabAction.GetEnsuingTabIndex: Integer;
begin
  if (FTab <> nil) and (Tab.TabControl <> nil) then
    Result := FTab.Index
  else
    Result := inherited GetEnsuingTabIndex;
end;

procedure TChangeTabAction.UpdateTabControl;
begin
  if FTab <> nil then
    TabControl := FTab.TabControl
  else
    TabControl := nil;
end;

procedure TChangeTabAction.ExecuteTarget(Target: TObject);
begin
  UpdateTabControl;
  inherited;
end;

function TChangeTabAction.Update: Boolean;
begin
  UpdateTabControl;
  Result := inherited Update;
end;

procedure TChangeTabAction.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FTab) then
    Tab := nil;
end;

procedure TChangeTabAction.SetTab(const Value: TTabItem);
begin
  if FTab <> Value then
  begin
    if FTab <> nil then
      TComponent(FTab).RemoveFreeNotification(Self);
    FTab := Value;
    if FTab <> nil then
      TComponent(FTab).FreeNotification(Self);
    UpdateTabControl;
    CustomTextChanged;
  end;
end;

{ TNextTabAction }

procedure TNextTabAction.CustomTextChanged;
begin
  if CustomText = '' then
  begin
    if TabControl <> nil then
      Text := SmkcNext
    else
      Text := SGotoNilTab;
  end
  else
    Text := CustomText;
end;

function TNextTabAction.GetEnsuingTabIndex: Integer;
begin
  if TabControl <> nil then
    Result := FindVisibleTab(True)
  else
    Result := -1;
end;

{ TPreviousTabAction }

procedure TPreviousTabAction.CustomTextChanged;
begin
  if CustomText = '' then
  begin
    if TabControl <> nil then
      Text := SmkcBack
    else
      Text := SGotoNilTab;
  end
  else
    Text := CustomText;
end;

function TPreviousTabAction.GetEnsuingTabIndex: Integer;
begin
  if TabControl <> nil then
    Result := FindVisibleTab(False)
  else
    Result := -1;
end;

{ TCustomIconMultiResBitmap }

type

  TCustomIconMultiResBitmap = class(TFixedMultiResBitmap)
  private
    [Weak] FTabItem: TTabItem;
    procedure ReadCustomIcon(Stream: TStream);
    procedure ReadCustomIconHiRes(Stream: TStream);
  protected
    procedure Update(Item: TCollectionItem); override;
    procedure DefineProperties(Filer: TFiler); override;
  end;

procedure TCustomIconMultiResBitmap.DefineProperties(Filer: TFiler);
begin
  inherited;
  Filer.DefineBinaryProperty('CustomIcon.Bitmap.PNG', ReadCustomIcon, nil, False);
  Filer.DefineBinaryProperty('CustomIcon.BitmapHiRes.PNG', ReadCustomIconHiRes, nil, False);
end;

procedure TCustomIconMultiResBitmap.ReadCustomIcon(Stream: TStream);
begin
  LoadItemFromStream(Stream, 1);
end;

procedure TCustomIconMultiResBitmap.ReadCustomIconHiRes(Stream: TStream);
begin
  LoadItemFromStream(Stream, 2);
end;

procedure TCustomIconMultiResBitmap.Update(Item: TCollectionItem);
begin
  inherited;
  if (FTabItem = nil) and (Owner is TTabItem) then
    FTabItem := TTabItem(Owner);
  if (FTabItem <> nil) and (FTabItem.TabControl <> nil) and
    ([csLoading, csDestroying] * FTabItem.TabControl.ComponentState = []) and
    ([csLoading, csDestroying] * FTabItem.ComponentState = []) then
    FTabItem.ImagesChanged;
end;

{ TTabItem }

constructor TTabItem.Create(AOwner: TComponent);
var
  DefaultValueService: IInterface;
  TrimmingDefault: TValue;
begin
  inherited;
  FImageLink := TGlyphImageLink.Create(Self);
  FCustomIcon := TCustomIconMultiResBitmap.Create(Self, TFixedBitmapItem);
  FAutoSize := True;
  FContent := TTabItemContent.Create(Self);
  FContent.Name := 'TabItemContent_';
  FContent.Parent := Self;
  FContent.Locked := True;
  FContent.Stored := False;
  FContent.HitTest := False;
  FContent.Visible := False;
  FContent.ClipChildren := True;
  FDesignInteractive := True;
  AutoTranslate := True;
  TextAlign := TTextAlign.Center;
  HitTest := True;
  CanFocus := True;
  Touch.DefaultInteractiveGestures := [TInteractiveGesture.LongTap, TInteractiveGesture.Pan];
  Touch.InteractiveGestures := Touch.DefaultInteractiveGestures;
  if (csDesigning in ComponentState)
    and SupportsPlatformService(IFMXDefaultPropertyValueService, DefaultValueService) then
  begin
    TrimmingDefault := IFMXDefaultPropertyValueService(DefaultValueService).GetDefaultPropertyValue(Self.ClassName,
      'trimming');
    if not TrimmingDefault.IsEmpty then
      Trimming := TrimmingDefault.AsType<TTextTrimming>;
  end;
end;

destructor TTabItem.Destroy;
begin
  FreeAndNil(FCustomIcon);
  FImageLink.DisposeOf;
  FImageLink := nil;
  inherited;
end;

procedure TTabItem.DefineProperties(Filer: TFiler);
var
  ExplicitStored: Boolean;
begin
  inherited;
  Filer.DefineProperty('Position.X', IgnoreFloatValue, nil, False);
  Filer.DefineProperty('Position.Y', IgnoreFloatValue, nil, False);
  ExplicitStored := (TabControl <> nil) and not SameValue(Info.ExplicitSize.cy, 0) and (ShowAsDot or AutoSize or
    (TabControl.TabHeight > 0) or TabControl.EffectiveFullSize);
  Filer.DefineProperty('ExplicitSize.cx', ReadExplicitSizeCx, WriteExplicitSizeCx, ExplicitStored);
  Filer.DefineProperty('ExplicitSize.cy', ReadExplicitSizeCy, WriteExplicitSizeCy, ExplicitStored);
end;

procedure TTabItem.ReadExplicitSizeCx(Reader: TReader);
begin
  FInfo.ExplicitSize.cx := Reader.ReadFloat;
end;

procedure TTabItem.WriteExplicitSizeCx(Writer: TWriter);
begin
  Writer.WriteFloat(FInfo.ExplicitSize.cx);
end;

procedure TTabItem.ReadExplicitSizeCy(Reader: TReader);
begin
  FInfo.ExplicitSize.cy := Reader.ReadFloat;
end;

procedure TTabItem.WriteExplicitSizeCy(Writer: TWriter);
begin
  Writer.WriteFloat(FInfo.ExplicitSize.cy);
end;

procedure TTabItem.DoAddObject(const AObject: TFmxObject);
var
  ControlTmp: TControl;
  Pos: TPointF;
begin
  if (FContent <> nil) and not AObject.Equals(FContent) and not AObject.Equals(ResourceLink) then
  begin
    // Correct control position in design time
    if (csDesigning in ComponentState) and (AObject is TControl) then
    begin
      ControlTmp := TControl(AObject);
      Pos := ControlTmp.Position.Point;
      if ControlTmp.ParentControl <> nil then
        Pos := ControlTmp.ParentControl.LocalToAbsolute(Pos)
      else if TabControl <> nil then
        Pos := TabControl.LocalToAbsolute(Pos);
      Pos := FContent.AbsoluteToLocal(Pos);
      if FContent.Width > 0 then
        Pos.X := EnsureRange(Pos.X, 0, FContent.Width);
      if FContent.Height > 0 then
        Pos.Y := EnsureRange(Pos.Y, 0, FContent.Height);
      FContent.AddObject(AObject);
      ControlTmp.Position.Point := Pos;
    end
    else
      FContent.AddObject(AObject);
  end
  else
    inherited;
end;

procedure TTabItem.UpdateIcon;
var
  GlyphExists, IconExists: Boolean;
  I: Integer;
begin
  GlyphExists := (FGlyph <> nil) and (Images <> nil) and FGlyph.Visible;
  IconExists := (FIconControl <> nil) and not GlyphExists;
  if FIconObject <> nil then
  begin
    if GlyphExists then
      FIconObject.MultiResBitmap.Assign(nil)
    else
      FIconObject.MultiResBitmap.Assign(FCustomIcon);

    if IconExists then
    begin
      IconExists := False;
      for I := 0 to FIconObject.MultiResBitmap.Count - 1 do
        if not FIconObject.MultiResBitmap[I].IsEmpty then
        begin
          IconExists := True;
          Break;
        end;
    end;
  end;
  if FIconControl <> nil then
    FIconControl.Visible := IconExists;
end;

procedure TTabItem.ApplyStyle;
var
  B: TFmxObject;
  OldStyleState: TSizeState;
begin
  if (FTabControl <> nil) and (ResourceLink <> nil) then
  begin
    case FTabControl.EffectiveTabPosition of
      TTabPosition.Top:
        begin
          B := ResourceLink.FindStyleResource('top');
          if B is TControl then
          begin
            FItemStyle := TControl(B);
            FItemStyle.Visible := True;
            B := ResourceLink.FindStyleResource('bottom');
            if B is TControl then
              TControl(B).Visible := False;
          end;
        end;
      TTabPosition.Bottom:
        begin
          B := ResourceLink.FindStyleResource('bottom');
          if B is TControl then
          begin
            FItemStyle := TControl(B);
            FItemStyle.Visible := True;
            B := ResourceLink.FindStyleResource('top');
            if B is TControl then
              TControl(B).Visible := False;
          end;
        end;
    end;
    if FItemStyle = nil then
    begin
      FItemStyle := ResourceControl;
      if FItemStyle <> nil then
        FItemStyle.Visible := True;
    end;
    // custom icon
    if FItemStyle <> nil then
    begin
      B := FItemStyle.FindStyleResource('icon');
      if B is TControl then
      begin
        FIconControl := TControl(B);
        FOldIconControlVisible := FIconControl.Visible;
        FOriginalIconSize := FIconControl.Size.Size;
      end;
      if Supports(B, IMultiResBitmapObject) then
        FIconObject := (B as IMultiResBitmapObject);
      B := FItemStyle.FindStyleResource('glyphstyle');
      if B is TGlyph then
      begin
        FGlyph := TGlyph(B);
        FGlyph.BeginUpdate;
        try
          FOriginalGlyphSize := FGlyph.Size.Size;
          FGlyph.Images := TCustomImageList(FImageLink.Images);
          FGlyph.ImageIndex := FImageLink.ImageIndex;
        finally
          FGlyph.EndUpdate;
        end;
      end;
      B := FItemStyle.FindStyleResource('layoutstyle');
      if B is TControl then
      begin
        FLayoutControl := TControl(B);
        FOldLayoutWidth := FLayoutControl.Width;
      end;
    end;
  end;
  OldStyleState := FSizeState;
  FSizeState := TSizeState.Calculating;
  try
    inherited;
    ImagesChanged;
    IsSelected := (FTabControl <> nil) and (FTabControl.TabIndex = Index);
    if FItemStyle <> nil then
    begin
      FLeftOffset := FItemStyle.Margins.Left;
      FRightOffset := FItemStyle.Margins.Right;
    end;
  finally
    UpdatePaintPart;
    FSizeState := OldStyleState;
  end;
end;

function TTabItem.FindTextObject: TFmxObject;
begin
  if FItemStyle <> nil then
    Result := FItemStyle.FindStyleResource('text') // do not localize
  else
    Result := inherited FindTextObject;
end;

procedure TTabItem.FreeStyle;
begin
  if FGlyph <> nil then
  begin
    FGlyph.BeginUpdate;
    try
      FGlyph.Size.Size := FOriginalGlyphSize;
      FGlyph.ImageIndex := -1;
      FGlyph.Images := nil;
    finally
      FGlyph.EndUpdate;
    end;
    FGlyph := nil;
  end;
  if FIconControl <> nil then
  begin
    FIconControl.Size.Size := FOriginalIconSize;
    FIconControl.Visible := FOldIconControlVisible;
    FIconControl := nil;
  end;
  if FIconObject <> nil then
  begin
    FIconObject.MultiResBitmap.Assign(nil);
    FIconObject := nil;
  end;
  if FLayoutControl <> nil then
  begin
    FLayoutControl.Width := FOldLayoutWidth;
    FLayoutControl := nil;
  end;
  FItemStyle := nil;
  FLeftOffset := 0;
  FRightOffset := 0;
  inherited;
end;

procedure TTabItem.Loaded;
begin
  inherited;
  // necessary to update FLastWidth and FLastHeight for anchors
  TTabItemContent(FContent).Loaded;
  if not ShowAsDot then
  begin
    if FInfo.ExplicitSize.cx = 0 then
      FInfo.ExplicitSize.cx := Width;
    if FInfo.ExplicitSize.cy = 0 then
      FInfo.ExplicitSize.cy := Height;
  end;
  // necessary to apply TextSettings from style
  IsSelected := (FTabControl <> nil) and (FTabControl.TabIndex = Index);
end;

procedure TTabItem.CalcSize;
const
  VertLayouts: set of TAlignLayout = [TAlignLayout.Top, TAlignLayout.Bottom, TAlignLayout.MostTop,
    TAlignLayout.MostBottom];
  procedure UpdateAutoSizeByControl(const Control: TControl; const OriginalSize: TSizeF);
  var
    R: TRectF;
  begin
    if (Control <> nil) and (Control.Visible) then
    begin
      R := Control.BoundsRect;
      if OriginalSize.cx > 0 then
        R.Width := OriginalSize.cx;
      if OriginalSize.cy > 0 then
        R.Height := OriginalSize.cy;
      R := Control.Margins.MarginRect(R);
      if Control.Align in VertLayouts then
        FInfo.Size.cy := Round(Ceil(FInfo.Size.cy + R.Height))
      else
        FInfo.Size.cx := Round(Ceil(FInfo.Size.cx + R.Width));
    end;
  end;

  procedure UpdateAutoSizeByParent(const Control: TControl);
  begin
    if (Control <> nil) and (Control.Visible) then
    begin
      FInfo.Size.cx := FInfo.Size.cx + Control.Margins.Left + Control.Margins.Right + Control.Padding.Left +
        Control.Padding.Right;
      FInfo.Size.cy := FInfo.Size.cy + Control.Margins.Top + Control.Margins.Bottom + Control.Padding.Top +
        Control.Padding.Bottom;
    end;
  end;

  procedure MaxMargins(var OldMargins: TSizeF; const NewMargins: TRectF);
  begin
    OldMargins.cx := Max(OldMargins.cx, NewMargins.Left + NewMargins.Right);
    OldMargins.cy := Max(OldMargins.cy, NewMargins.Top + NewMargins.Bottom);
  end;

  procedure DoCalcSizeOfControls;
  var
    Size: TSizeF;
    ItemStyleMargins: TSizeF;
    Obj: TFmxObject;
  begin
    if CalcTextObjectSize(0, Size) then
    begin
      { Add the maximum size of margins to Size }
      if FItemStyle <> nil then
      begin
        ItemStyleMargins := TSizeF.Create(0, 0);
        MaxMargins(ItemStyleMargins, FItemStyle.Margins.Rect);
        for Obj in FItemStyle.Children do
          if (Obj is TRectAnimation) and
            (string.Compare(TRectAnimation(Obj).PropertyName, 'margins', [coIgnoreCase]) = 0) then
          begin
            MaxMargins(ItemStyleMargins, TRectAnimation(Obj).StopValue.Rect);
            MaxMargins(ItemStyleMargins, TRectAnimation(Obj).StartValue.Rect);
          end;
        Size.cx := Size.cx + ItemStyleMargins.cx;
        Size.cy := Size.cy + ItemStyleMargins.cy;
      end;
      FInfo.Size := Size.Round;
      UpdateAutoSizeByControl(FGlyph, FOriginalGlyphSize);
      UpdateAutoSizeByControl(FIconControl, FOriginalIconSize);
      if FLayoutControl <> nil then
      begin
        FInfo.LayoutControlSize.cx := Ceil(FInfo.Size.cx + FLayoutControl.Padding.Left + FLayoutControl.Padding.Right);
        FInfo.LayoutControlSize.cy := Ceil(FInfo.Size.cy + FLayoutControl.Padding.Left + FLayoutControl.Padding.Right);
      end;
    end;
  end;

begin
  if FSizeState = TSizeState.Calculating then
    Exit;
  FSizeState := TSizeState.Calculating;
  try
    try
      FInfo.Size := TSizeF.Create(0, 0);
      FInfo.LayoutControlSize := TSize.Create(-1, -1);
      ApplyStyleLookup; // force load style
      if FItemStyle = nil then
        Exit;
      if AutoSize or ShowAsDot then
      begin
        DoCalcSizeOfControls;
        UpdateAutoSizeByParent(FLayoutControl);
      end
      else
      begin
        if FInfo.ExplicitSize = TPointF.Zero then
        begin
          if FInfo.Size <> TPointF.Zero then
            FInfo.ExplicitSize := FInfo.Size
          else
            FInfo.ExplicitSize := GetDefaultSize
        end;
        DoCalcSizeOfControls;
        FInfo.Size := FInfo.ExplicitSize;
      end;
    finally
      FSizeState := TSizeState.Calculated;
    end;
  except
    FSizeState := TSizeState.Invalid;
    raise;
  end;
end;

procedure TTabItem.ChangeOrder;
var
  NewTabIndex: Integer;
begin
  if TabControl <> nil then
  begin
    if Self = TabControl.ActiveTab then
      NewTabIndex := Index
    else if TabControl.HasActiveTab then
      NewTabIndex := TabControl.ActiveTab.Index
    else
      NewTabIndex := TabControl.TabIndex;
  end;
  try
    inherited;
  finally
    if (TabControl <> nil) then
    begin
      if TabControl.FindVisibleTab(NewTabIndex, TTabControl.TFindKind.Current) then
        TabControl.TabIndex := NewTabIndex
      else
        TabControl.TabIndex := -1;
    end;
  end;
end;

function TTabItem.InvalidateSize: Boolean;
begin
  Result := FSizeState <> TSizeState.Calculating;
  if Result then
    FSizeState := TSizeState.Invalid;
end;

function TTabItem.RealignTabs: Boolean;
begin
  Result := (FTabControl <> nil) and not FTabControl.FRealigningTabs;
  if Result then
    FTabControl.RealignTabs;
end;

procedure TTabItem.DoChanged;
begin
  inherited;
  if InvalidateSize then
    RealignTabs
end;

function TTabItem.TouchEnabled: Boolean;
begin
  Result := (TabControl <> nil) and TabControl.HasTouchScreen and not (csDesigning in ComponentState);
end;

procedure TTabItem.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  ChangeIndex: Boolean;
begin
  if TouchEnabled and (ssTouch in Shift) then
  begin
    if Button = TMouseButton.mbLeft then
    begin
      Capture;
      FCanTouchClick := True;
      TabControl.FAniCalculations.MouseDown(0, 0)
    end;
  end
  else
  begin
    if Button = TMouseButton.mbLeft then
    begin
      ChangeIndex := (FTabControl <> nil) and (FTabControl.TabIndex <> Index);
      if ChangeIndex then
        FTabControl.TabIndex := Index;
      inherited;
{$IFDEF MSWINDOWS}
      if (csDesigning in ComponentState) and IsSelected and (Owner is TCommonCustomForm) and
        (TCommonCustomForm(Owner).Designer <> nil) then
      begin
        TCommonCustomForm(Owner).Designer.SelectComponent(Self);
        if ChangeIndex then
          TCommonCustomForm(Owner).Designer.Modified;
      end;
{$ENDIF}
    end
    else
      inherited;
  end;
end;

procedure TTabItem.MouseClick(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if TouchEnabled and (ssTouch in Shift) then
    TouchClick
  else
  begin
    FCanTouchClick := False;
    inherited;
  end;
end;

procedure TTabItem.DblClick;
var
  ChangeIndex: Boolean;
begin
  FCanTouchClick := False;
  ChangeIndex := (FTabControl <> nil) and (FTabControl.TabIndex <> Index);
  if ChangeIndex then
    FTabControl.TabIndex := Index;
  inherited;
  SetFocus;
end;

procedure TTabItem.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if TouchEnabled and (ssTouch in Shift) then
    FCanTouchClick := False
  else
    inherited;
end;

procedure TTabItem.TouchClick;
var
  ChangeIndex: Boolean;
begin
  if FCanTouchClick then
  begin
    FCanTouchClick := False;
    ChangeIndex := (TabControl <> nil) and (TabControl.TabIndex <> Index);
    if ChangeIndex then
      FTabControl.TabIndex := Index;
    inherited Click;
    SetFocus;
  end;
end;

procedure TTabItem.CMGesture(var EventInfo: TGestureEventInfo);
var
  Displacement: TPointF;
begin
  case EventInfo.GestureID of
    igiLongTap:
    begin
      TouchClick;
      EventInfo.GestureID := 0;
    end;
    igiPan:
    begin
      if TInteractiveGestureFlag.gfBegin in EventInfo.Flags then
        FBeginPanPosition := EventInfo.Location
      else
      begin
        Displacement := FBeginPanPosition - EventInfo.Location;
        if (Scene = nil) or (Scene.GetSceneScale <= 0) or (Abs(Displacement.X) / Scene.GetSceneScale > 1) then
          FCanTouchClick := False;
      end;
      if (TabControl <> nil) and (TabControl.TabContentSize.cx > TabControl.TabBarRect.Width) then
      begin
        if TInteractiveGestureFlag.gfBegin in EventInfo.Flags then
          TabControl.FAniCalculations.MouseDown(0, 0)
        else
        begin
          if EventInfo.Flags - [TInteractiveGestureFlag.gfEnd, TInteractiveGestureFlag.gfBegin] = [] then
            TabControl.FAniCalculations.MouseMove(Displacement.X, Displacement.Y);
          if TInteractiveGestureFlag.gfEnd in EventInfo.Flags then
            TabControl.FAniCalculations.MouseUp(Displacement.X, Displacement.Y);
        end;
        EventInfo.GestureID := 0;
      end;
    end;
  end;
  inherited;
end;

procedure TTabItem.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if TabControl <> nil then
  begin
    if Key = vkLeft then
    begin
      FTabControl.Previous(TTabTransition.None);
      Key := 0;
      TabControl.GoToActiveTab;
    end
    else
      if Key = vkRight then
    begin
      FTabControl.Next(TTabTransition.None);
      Key := 0;
      TabControl.GoToActiveTab;
    end;
    TabControl.ActiveTab.SetFocus;
  end;
end;

procedure TTabItem.UpdateLayoutControl;
var
  R: TRectF;
begin
  if (FSizeState = TSizeState.Calculated) and (FLayoutControl <> nil) then
  begin
    R := LocalRect;
    R := Padding.PaddingRect(R);
    R.Width := Trunc(Min(FInfo.LayoutControlSize.cx, R.Width));
    if not SameValue(FLayoutControl.Width, R.Width) then
    begin
      FLayoutControl.Size.PlatformDefault := False;
      FLayoutControl.Size.Width := R.Width;
    end;
  end;
end;

function TTabItem.DoSetSize(const ASize: TControlSize;
  const NewPlatformDefault: Boolean; ANewWidth, ANewHeight: Single;
  var ALastWidth, ALastHeight: Single): Boolean;

  function ShouldAvoidWidthChange: Boolean;
  begin
    Result := (csDesigning in ComponentState) and
      (FTabControl.EffectiveTabPosition in [TTabPosition.Top,
      TTabPosition.Bottom]) and FTabControl.EffectiveFullSize and
      not FTabControl.FDisableAlign;
  end;

begin
  if (FTabControl = nil) or FTabControl.FRealigningTabs or not ShouldAvoidWidthChange
  then
  begin
    if (FTabControl = nil) or FTabControl.FRealigningTabs or
      (FSizeState = TSizeState.Calculating) then
    begin
      Result := inherited;
      UpdateLayoutControl;
    end
    else
    begin
      if not(ShowAsDot or AutoSize) then
      begin
        Result := inherited;
        if not(csLoading in ComponentState) then
          FInfo.ExplicitSize := Size.Size;
        if InvalidateSize then
          RealignTabs;
      end
      else
        Result := False; // if Autosize then we doing nothing
    end;
  end
  else
  begin
    Result := inherited DoSetSize(ASize, NewPlatformDefault, ASize.Width,
      ANewHeight, ALastWidth, ALastHeight);
    UpdateLayoutControl;
  end;
end;

procedure TTabItem.SetAutoSize(const Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    if Value then
    begin
      if not (ShowAsDot or (csLoading in ComponentState)) then
        FInfo.ExplicitSize := Size.Size;
      FAutoSize := Value;
    end
    else
    begin
      FAutoSize := Value;
      if FInfo.ExplicitSize <> TPointF.Zero then
        Size.Size := FInfo.ExplicitSize;
    end;
    DoChanged;
  end;
end;

procedure TTabItem.SetCustomIcon(const Value: TFixedMultiResBitmap);
begin
  FCustomIcon.Assign(Value);
end;

procedure TTabItem.SetIsSelected(const Value: Boolean);
begin
  if not Value or (FTabControl = nil) or (FTabControl.TabIndex = Index) then
    SetSelectedInternal(Value)
  else if FTabControl <> nil then
    FTabControl.TabIndex := Index;
end;

procedure TTabItem.PaintChildren;
begin
  if FPaintPart = TPaintPart.ResourceControl then
  begin
    if (ResourceControl <> nil) and (ResourceControl is TControl) then
      TOpenControl(ResourceControl).PaintInternal;
  end
  else
    inherited;
end;

procedure TTabItem.Painting;
begin
  if FPaintPart <> TPaintPart.Children then
    inherited;
end;

procedure TTabItem.Paint;
begin
  if FPaintPart <> TPaintPart.Children then
    inherited;
end;

procedure TTabItem.DoPaint;
begin
  if FPaintPart <> TPaintPart.Children then
    inherited;
end;

procedure TTabItem.AfterPaint;
begin
  if FPaintPart <> TPaintPart.Children then
    inherited;
end;

procedure TTabItem.UpdatePaintPart;
begin
  if ResourceControl <> nil then
    TOpenControl(ResourceControl).FDisablePaint := FPaintPart = TPaintPart.Children;
  FDisablePaint := FPaintPart = TPaintPart.Nothing;
end;

procedure TTabItem.SetPaintPart(const Value: TPaintPart);
begin
  if FPaintPart <> Value then
  begin
    FPaintPart := Value;
    UpdatePaintPart;
  end;
end;

procedure TTabItem.SetSelectedInternal(const Value: Boolean);
begin
  FIsSelected := Value;
  StartTriggerAnimation(Self, 'IsSelected');
  ApplyTriggerEffect(Self, 'IsSelected');
end;

procedure TTabItem.SetShowAsDot(const Value: Boolean);
begin
  if FShowAsDot <> Value then
  begin
    if Value then
    begin
      if (TabControl <> nil) and (string.Compare(StyleLookup, DotStyleName, [coIgnoreCase]) <> 0) then
        FCustomStyleLookup := StyleLookup;
      inherited StyleLookup := string.Empty;
      FShowAsDot := Value;
    end
    else
    begin
      FShowAsDot := Value;
      inherited StyleLookup := FCustomStyleLookup;
    end;
  end;
end;

function TTabItem.GetStyleLookup: string;
begin
  if ShowAsDot then
    Result := FCustomStyleLookup
  else
    Result := inherited StyleLookup
end;

procedure TTabItem.SetStyleLookup(const Value: string);
begin
  if ShowAsDot then
  begin
    if ([csDestroying] * ComponentState = []) and
      (string.Compare(Value, DotStyleName, [coIgnoreCase]) <> 0) then
      FCustomStyleLookup := Value
  end
  else
  begin
    if (string.Compare(Value, StyleLookup, [coIgnoreCase]) <> 0) and
      (string.Compare(Value, DotStyleName, [coIgnoreCase]) <> 0) then
    begin
      inherited StyleLookup := Value;
      if ([csLoading, csDestroying] * ComponentState = []) and (FTabControl <> nil) and
        not FTabControl.FRealigningTabs then
        FTabControl.Realign;
    end;
  end;
end;

procedure TTabItem.ParentChanged;
begin
  inherited ParentChanged;
  if TFmxObjectHelper.FindNearestParentOfClass<TTabControl>(Self, FTabControl) then
    SetImages(FTabControl.Images)
  else
    SetImages(nil);
  NeedStyleLookup;
end;

procedure TTabItem.SetText(const Value: string);
begin
  if Text <> Value then
  begin
    NeedStyleLookup;
    inherited;
    if InvalidateSize then
      RealignTabs;
  end;
end;

procedure TTabItem.Show;
begin
  inherited Show;
  if FTabControl <> nil then
    FTabControl.Realign;
end;

procedure TTabItem.TriggerAcceleratorKey;
begin
  inherited;
  IsSelected := True;
end;

function TTabItem.GetInfo: TTabItemInfo;
begin
  if FSizeState = TSizeState.Invalid then
    CalcSize;
  Result := FInfo;
end;

function TTabItem.ImageIndexStored: Boolean;
begin
  Result := ActionClient or (ImageIndex <> -1);
end;

procedure TTabItem.ImagesChanged;
begin
  if FGlyph <> nil then
  begin
    FGlyph.Images := Images;
    FGlyph.ImageIndex := ImageIndex;
  end;
  UpdateIcon;
  if InvalidateSize then
    RealignTabs;
end;

function TTabItem.GetDefaultStyleLookupName: string;
begin
  if ShowAsDot then
    Result := DotStyleName
  else
    Result := inherited;
end;

function TTabItem.GetImageIndex: TImageIndex;
begin
  Result := FImageLink.ImageIndex;
end;

procedure TTabItem.SetImageIndex(const Value: TImageIndex);
begin
  FImageLink.ImageIndex := Value;
end;

function TTabItem.GetImageList: TBaseImageList;
begin
  Result := GetImages;
end;

procedure TTabItem.SetImageList(const Value: TBaseImageList);
begin
  // none
end;

function TTabItem.GetImages: TCustomImageList;
begin
  if FImageLink <> nil then
    Result := TCustomImageList(FImageLink.Images)
  else
    Result := nil;
end;

procedure TTabItem.SetImages(const Value: TCustomImageList);
begin
  if (FImageLink <> nil) and not (csDestroying in ComponentState) then
    FImageLink.Images := Value;
end;

type
  TTabItemSettings = class(TTextSettingsInfo.TCustomTextSettings)
  public
    constructor Create(const AOwner: TPersistent); override;
  published
    property Font;
    property FontColor;
    property HorzAlign default TTextAlign.Center;
    property VertAlign;
    property Trimming default TTextTrimming.Character;
    property WordWrap default False;
  end;

  { TTabItemSettings }

constructor TTabItemSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  HorzAlign := TTextAlign.Center;
  WordWrap := False;
  Trimming := TTextTrimming.Character;
end;

function TTabItem.GetTabList: ITabList;
begin
  if FContent <> nil then
    Result := FContent.GetTabList
  else
    Result := inherited GetTabList;
end;

function TTabItem.GetTextSettingsClass: TTextSettingsInfo.TCustomTextSettingsClass;
begin
  Result := TTabItemSettings;
end;

procedure TTabItem.Hide;
begin
  inherited Hide;
  IsSelected := False;
  if (FTabControl <> nil) and (FTabControl.TabIndex = Index) then
    FTabControl.ActiveTab := nil;
end;

type
  TTabControlContent = class(TContent)
  protected
    procedure ContentChanged; override;
    procedure DoAddObject(const AObject: TFmxObject); override;
    procedure DoInsertObject(Index: Integer; const AObject: TFmxObject); override;
    procedure DoRemoveObject(const AObject: TFmxObject); override;
    function GetTabListClass: TTabListClass; override;
  end;

  TTabControlContentTabList = class(TTabList)
  protected
    function GetTabControl: TTabControl;
    function IndexOf(const TabStop: IControl): Integer; override;
    function GetCount: Integer; override;
    function GetItem(const Index: Integer): IControl; override;
    function IsAddable(const TabStop: IControl): Boolean; override;
  end;

  { TTabContent }

procedure TTabControlContent.ContentChanged;
begin
  inherited;
  if not (csLoading in ComponentState) and (Parent is TTabControl) and not TTabControl(Parent).FRealigningTabs then
    TTabControl(Parent).RealignTabs;
end;

procedure TTabControlContent.DoAddObject(const AObject: TFmxObject);
begin
  if AObject is TTabItem then
    inherited DoAddObject(AObject);

  if Parent is TTabControl then
    TTabControl(Parent).ContentAddObject(AObject);
end;

procedure TTabControlContent.DoInsertObject(Index: Integer; const AObject: TFmxObject);
var
  I: Integer;
begin
  if AObject is TTabItem then
  begin
    I := Min(Max(Index, 0), ControlsCount);
    if I = ControlsCount then
      inherited DoAddObject(AObject)
    else
      inherited DoInsertObject(I, AObject);
  end;
  if Parent is TTabControl then
    TTabControl(Parent).ContentAddObject(AObject);
end;

procedure TTabControlContent.DoRemoveObject(const AObject: TFmxObject);
begin
  inherited;
  if Parent is TTabControl then
    TTabControl(Parent).ContentRemoveObject(AObject);
end;

function TTabControlContent.GetTabListClass: TTabListClass;
begin
  Result := TTabControlContentTabList;
end;

type
  TTabControlAnimation = class(TAniCalculations)
  private
    [Weak] FTabControl: TTabControl;
  protected
    procedure DoStart; override;
    procedure DoChanged; override;
    procedure DoStop; override;
  public
    constructor Create(AOwner: TPersistent); override;
    property TabControl: TTabControl read FTabControl;
  end;

  { TTabControlAnimation }

constructor TTabControlAnimation.Create(AOwner: TPersistent);
begin
  ValidateInheritance(AOwner, TTabControl, False);
  inherited;
  FTabControl := TTabControl(AOwner);
end;

procedure TTabControlAnimation.DoChanged;
begin
  if ([csLoading, csUpdating] * TabControl.ComponentState) = [] then
  begin
    TabControl.SetInternalContentPosition(ViewportPosition.X);
  end;
end;

procedure TTabControlAnimation.DoStart;
begin
  inherited;

end;

procedure TTabControlAnimation.DoStop;
begin
  inherited;
  if TabControl.FIndexOfTargetTab <> -1 then
  begin
    TabControl.FIndexOfTargetTab := -1;
    TabControl.UpdateAnimation(TabControl.EffectiveTabPosition in [TTabPosition.None, TTabPosition.Dots], 0, 0);
  end;
end;

{ TTabControl }

type
  TTabBarControlPanel = class(TControl)
  protected
    procedure Painting; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

constructor TTabBarControlPanel.Create(AOwner: TComponent);
begin
  ValidateInheritance(AOwner, TTabControl, False);
  inherited Create(AOwner);
  Locked := True;
  Stored := False;
  HitTest := False;
end;

procedure TTabBarControlPanel.Painting;
begin
  if TTabControl(Owner).FScrollBackground <> nil then
    Canvas.FillRect(LocalRect, 0, 0, AllCorners, 1, TTabControl(Owner).FScrollBackground.Brush, TCornerType.Bevel);
  inherited;
end;

constructor TTabControl.Create(AOwner: TComponent);
var
  DeviceService: IFMXDeviceService;
begin
  inherited;
  FStoredTabSize := TList<TSizeF>.Create;
  FFullSize := TBehaviorBoolean.PlatformDefault;
  if SupportsPlatformService(IFMXDeviceService, DeviceService) then
    FHasTouchScreen := TDeviceFeature.HasTouchScreen in DeviceService.GetFeatures;
  FIndexOfTargetTab := -1;
  FAniCalculations := TTabControlAnimation.Create(Self);
  FAniCalculations.Animation := not (csDesigning in ComponentState);
  FAniCalculations.BoundsAnimation := False;
  FAniCalculations.TouchTracking := [ttHorizontal];
  FAniCalculations.AutoShowing := False;

  FTabBarButtons := DefaultButtons;
  FImageLink := TGlyphImageLink.Create(Self);
  FContent := TTabControlContent.Create(Self);
  FContent.Name := 'TabControlContent_';
  FContent.Parent := Self;
  FContent.Stored := False;
  FContent.Locked := True;
  FContent.HitTest := False;
  FNoItemsContent := TControl.Create(nil);
  FNoItemsContent.Name := 'NoItemsContent_';
  FNoItemsContent.Parent := Self;
  FNoItemsContent.Stored := False;
  FNoItemsContent.Locked := True;
  FNoItemsContent.HitTest := False;
  FTabIndex := -1;
  FTabPosition := TTabPosition.PlatformDefault;
  AutoCapture := True;
  SetBounds(0, 0, 200, 200);
  SetAcceptsControls(True);
end;

destructor TTabControl.Destroy;
var
  Button: TTabBarButton;
begin
  FImageLink.DisposeOf;
  for Button := Low(TTabBarButton) to High(TTabBarButton) do
  begin
    FTabBarControls[Button].DisposeOf;
    FTabBarControls[Button] := nil;
  end;
  FAniCalculations.DisposeOf;
  FStoredTabSize.Free;
  FTabBarControlPanel.DisposeOf;
  inherited;
end;

function TTabControl.GetActiveTab: TTabItem;
begin
  if InRange(TabIndex, 0, TabCount - 1) then
    Result := Tabs[TabIndex]
  else
    Result := nil;
end;

function TTabControl.GetEffectiveTabPosition: TTabPosition;
var
  DeviceBehavior: IDeviceBehavior;
begin
  if FTabPosition = TTabPosition.PlatformDefault then
    if TBehaviorServices.Current.SupportsBehaviorService(IDeviceBehavior, DeviceBehavior, Self) and
      (DeviceBehavior.GetOSPlatform(Self) = TOSPlatform.iOS) then
      Result := TTabPosition.Bottom
    else
      Result := TTabPosition.Top
  else
    Result := FTabPosition;
end;

function TTabControl.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := Tabs[AIndex];
end;

function TTabControl.GetItemsCount: Integer;
begin
  Result := TabCount;
end;

procedure TTabControl.DialogKey(var Key: Word; Shift: TShiftState);
var
  FocusedIsChild: Boolean;
  FocusedControl: TControl;
begin
  inherited;
  if (Key = vkTab) and (ssCtrl in Shift) and (Root <> nil) and (Root.Focused <> nil) then
  begin
    FocusedIsChild := False;
    FocusedControl := nil;

    EnumControls(
      function(Control: TControl): TEnumControlsResult
      begin
        if Root.Focused.GetObject = Control then
        begin
          FocusedIsChild := True;
          FocusedControl := Control;
          Result := TEnumControlsResult.Discard;
        end
        else
          Result := TEnumControlsResult.Continue;
      end);

    if FocusedIsChild then
    begin
      if FocusedControl <> nil then
        FocusedControl.ResetFocus;
      if ssShift in Shift then
      begin
        if TabIndex = FindVisibleTab(TFindKind.First) then
          TabIndex := FindVisibleTab(TFindKind.Last)
        else
          TabIndex := FindVisibleTab(TFindKind.Back);
      end
      else
      begin
        if TabIndex = FindVisibleTab(TFindKind.Last) then
          TabIndex := FindVisibleTab(TFindKind.First)
        else
          TabIndex := FindVisibleTab(TFindKind.Next);
      end;
      if ActiveTab.CanFocus then
        ActiveTab.SetFocus;
      Key := 0;
    end;
  end;
end;

function TTabControl.IsSpecialObject(const AObject: TFmxObject): Boolean;
begin
  Result := (AObject is TEffect) or (AObject is TAnimation) or AObject.Equals(FContent) or
    AObject.Equals(FNoItemsContent) or AObject.Equals(ResourceLink) or (AObject.Parent = Self);
end;

procedure TTabControl.AddOrInsertObject(const AObject: TFmxObject; const Index: Integer = MaxInt);
  function InternalInsert(const Control: TControl): Integer;
  var
    LCount: Integer;
  begin
    LCount := Control.ChildrenCount;
    Result := Min(Max(Index, 0), LCount);
    if Control = Self then
      if Result = LCount then
        inherited DoAddObject(AObject)
      else
        inherited DoInsertObject(Result, AObject)
    else
      if Result = LCount then
        Control.AddObject(AObject)
      else
        Control.InsertObject(Result, AObject);
  end;
var
  I, IndexOfLastTab, LIndex, NewTabIndex: Integer;
  OldActiveTab: TTabItem;
begin
  // If AObject is TabItem, then we add it to the tab items container (FContent)
  // If AObject is Effect, Animation, Style resource, we add it to the Self
  // In all other cases, we add AObject to active tab or special container (FNoItemsContent)
  if AObject is TTabItem then
  begin
    if HasActiveTab then
      OldActiveTab := ActiveTab
    else
      OldActiveTab := nil;
    NewTabIndex := TabIndex;
    LIndex := InternalInsert(FContent);
    if ([csLoading, csDesigning] * ComponentState = []) then
    begin
      TTabItem(AObject).ShowAsDot := EffectiveTabPosition in [TTabPosition.Dots, TTabPosition.None];
      RealignTabs;
      if not HasActiveTab then
        ActiveTab := TTabItem(AObject);
    end;
    if (LIndex = FContent.ControlsCount - 1) and (csLoading in ComponentState) then
    begin
      IndexOfLastTab := TabCount - 1;
      if IndexOfLastTab < FStoredTabSize.Count then
        Tabs[IndexOfLastTab].Content.BoundsRect := TRectF.Create(Tabs[IndexOfLastTab].Content.Position.Point,
          FStoredTabSize[IndexOfLastTab].cx, FStoredTabSize[IndexOfLastTab].cy);
    end;
    if [csLoading, csDestroying] * ComponentState = [] then
      if csDesigning in ComponentState then
      begin
        ActiveTab := TTabItem(AObject);
        GoToActiveTab;
      end
      else
      begin
        for I := 0 to TabCount - 1 do
          if OldActiveTab = Tabs[I] then
          begin
            NewTabIndex := I;
            Break;
          end;
        if FindVisibleTab(NewTabIndex, TFindKind.Current) then
          TabIndex := NewTabIndex
        else
          TabIndex := -1;
      end;
  end
  else if IsSpecialObject(AObject) then
    InternalInsert(Self)
  else if HasActiveTab then
    InternalInsert(ActiveTab)
  else
    InternalInsert(FNoItemsContent);
end;

procedure TTabControl.DoAddObject(const AObject: TFmxObject);
begin
  AddOrInsertObject(AObject);
end;

procedure TTabControl.DoInsertObject(Index: Integer; const AObject: TFmxObject);
begin
  AddOrInsertObject(AObject, Index);
end;

procedure TTabControl.DoRemoveObject(const AObject: TFmxObject);
var
  NewTabIndex: Integer;
begin
  if AObject is TTabItem then
  begin
    if [csLoading, csDestroying] * ComponentState = [] then
    begin
      if HasActiveTab then
      begin
        if ActiveTab = AObject then
          NewTabIndex := -1
        else
          NewTabIndex := ActiveTab.Index
      end
      else
        NewTabIndex := TabIndex;
      try
        FContent.RemoveObject(AObject);
      finally
        if FindVisibleTab(NewTabIndex, TFindKind.Current) then
          TabIndex := NewTabIndex
        else
          TabIndex := -1;
      end;
    end
    else
      FContent.RemoveObject(AObject)
  end
  else if IsSpecialObject(AObject) then
    inherited DoRemoveObject(AObject)
  else if HasActiveTab then
    ActiveTab.RemoveObject(AObject)
  else
    FNoItemsContent.RemoveObject(AObject);
end;

procedure TTabControl.DoChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TTabControl.ContentAddObject(const AObject: TFmxObject);
begin
  if not (AObject is TTabItem) then
    FNoItemsContent.AddObject(AObject)
  else
    if FUpdating = 0 then
      Realign;
end;

procedure TTabControl.ContentRemoveObject(const AObject: TFmxObject);
begin
  if (FUpdating = 0) and (AObject is TTabItem) then
    Realign;
end;

procedure TTabControl.AnimationFinished(Sender: TObject);
begin
  WebBrowserRealign(Sender);
  TAnimation(Sender).Free;
end;

procedure TTabControl.ApplyStyle;
var
  B: TFmxObject;
begin
  inherited ApplyStyle;
  FindStyleResource<TBrushObject>('scrollbackground', FScrollBackground);
  FindStyleResource<TControl>('background', FBackground);
  if FindStyleResource<TFmxObject>('FullSize', B) then
    FDefaultFullSize := True;
  if FindStyleResource<TFmxObject>('TabHeight', B) then
  begin
    TabHeight := B.TagFloat;
    FFixedTabHeight := True;
  end;
  ApplyTabsStyleLookup;
  RealignTabs;
end;

procedure TTabControl.FreeStyle;
begin
  inherited FreeStyle;
  FScrollBackground := nil;
  FBackground := nil;
  FFixedTabHeight := False;
end;

procedure TTabControl.PaintChildren;
type
  TTabKind = (Active, Transition, Other);
  TTabKinds = set of TTabKind;
const
  AllTabs = [TTabKind.Active, TTabKind.Transition, TTabKind.Other];

  function IsTransitionTab(Tab: TTabItem): Boolean;
  var
    I: Integer;
  begin
    if FTransitionRunning then
      for I := Low(FTransitionTabs) to High(FTransitionTabs) do
        if FTransitionTabs[I] = Tab then
          Exit(True);
    Result := False;
  end;

  procedure SetTabsPaintPart(const APaintPart: TTabItem.TPaintPart; const TabKinds: TTabKinds = AllTabs);
  var
    I: Integer;
    Tab: TTabItem;
  begin
    if HasActiveTab and (TTabKind.Active in TabKinds) then
      ActiveTab.PaintPart := APaintPart;
    if FTransitionRunning  and (TTabKind.Transition in TabKinds) then
      for Tab in FTransitionTabs do
        if Tab <> ActiveTab then
          Tab.PaintPart := APaintPart;
    if TTabKind.Other in TabKinds then
      for I := 0 to TabCount - 1 do
        if (Tabs[I] <> ActiveTab) and not IsTransitionTab(Tabs[I]) then
          Tabs[I].PaintPart := APaintPart;
  end;

  procedure ActiveTabContentPaint;
  var
    Tab: TTabItem;
  begin
    if FTransitionRunning then
    begin
      SetTabsPaintPart(TTabItem.TPaintPart.Children, [TTabKind.Transition]);
      for Tab in FTransitionTabs do
        if Tab <> ActiveTab then
          Tab.PaintInternal;
    end;
    if HasActiveTab then
    begin
      SetTabsPaintPart(TTabItem.TPaintPart.Children, [TTabKind.Active]);
      ActiveTab.PaintInternal;
    end;
  end;

  procedure TitleItemsPaint;
  var
    I: Integer;
    Tab, LActiveTab: TTabItem;
  begin
    if HasActiveTab and (ActiveTab.Visible) and (ActiveTab.ResourceControl <> nil) then
      LActiveTab := ActiveTab
    else
      LActiveTab := nil;
    // Prepare for paint
    for I := 0 to TabCount - 1 do
      if Tabs[I].Visible and not Tabs[I].UpdateRect.IsEmpty then
        Tabs[I].PrepareForPaint;
    // Paint non-trasition and inactivetabs tabs
    for I := 0 to TabCount - 1 do
      if (Tabs[I].Visible) and (Tabs[I] <> LActiveTab) and (Tabs[I].ResourceControl <> nil) and
        not IsTransitionTab(Tabs[I]) and (Tabs[I].Top < TabBarRect.Bottom) then
          Tabs[I].PaintInternal;
    // Paint trasition and inactivetabs tabs
    if FTransitionRunning then
      for Tab in FTransitionTabs do
        if (Tab <> LActiveTab) and (Tab.ResourceControl <> nil) and (Tab.Top < TabBarRect.Bottom) then
          Tab.PaintInternal;
    // Paint active tab
    if (LActiveTab <> nil) and (LActiveTab.Top < TabBarRect.Bottom) then
        LActiveTab.PaintInternal;
  end;

  procedure DesignDotsPaint;
  var
    I: Integer;
    R: TRectF;
  begin
    for I := 0 to TabCount - 1 do
      if Tabs[I].Visible then
      begin
        R := Tabs[I].AbsoluteRect;
        R.TopLeft := AbsoluteToLocal(R.TopLeft);
        R.BottomRight := AbsoluteToLocal(R.BottomRight);
        Canvas.Fill.Kind := TBrushKind.Solid;
        Canvas.Stroke.Kind := TBrushKind.None;
        if I = TabIndex then
          Canvas.Fill.Color := $FF1072C5
        else
          Canvas.Fill.Color := $FF303030;
        Canvas.FillEllipse(R, 0.3);
      end;
  end;

  procedure TabBarPaint(const DesignStyle: Boolean);
  begin
    Canvas.SetMatrix(AbsoluteMatrix);
    if DesignStyle then
    begin
      SetTabsPaintPart(TTabItem.TPaintPart.Nothing);
      DesignDotsPaint;
    end
    else
    begin
      SetTabsPaintPart(TTabItem.TPaintPart.ResourceControl);
      TitleItemsPaint;
    end;
  end;

var
  LTabPosition: TTabPosition;
  State: TCanvasSaveState;
begin
  if FContent <> nil then
  begin
    LTabPosition := EffectiveTabPosition;
    TOpenControl(FNoItemsContent).FDisablePaint := True;
    State := Canvas.SaveState;
    try
      Canvas.IntersectClipRect(FClientRect);
      SetTabsPaintPart(TTabItem.TPaintPart.Nothing);
      try
        // Dots are painting over of the content, but the titles are painting under of the content
        if LTabPosition in [TTabPosition.Dots, TTabPosition.None] then
        begin
          // Dot style painting: 1. inherited, 2. active tab content, 3. tab titles
          inherited;
          ActiveTabContentPaint;
          if LTabPosition = TTabPosition.Dots then
            TabBarPaint(False)
          else if csDesigning in ComponentState then
            TabBarPaint(True);
        end
        else
        begin
          // Tab style painting: 1. inherited, 2. tab titles, 3. active tab content
          inherited;
          TabBarPaint(False);
          ActiveTabContentPaint;
        end;
      finally
        SetTabsPaintPart(TTabItem.TPaintPart.Nothing);
      end;
    finally
      Canvas.RestoreState(State);
      // NoItemsContent painting.
      TOpenControl(FNoItemsContent).FDisablePaint := False;
      if FNoItemsContent.Visible then
        TOpenControl(FNoItemsContent).PaintInternal;
    end;
  end
  else
    inherited;
end;

function TTabControl.TabBarControlsWidth: Single;
var
  Control: TControl;
begin
  Result := 0;
  if not (EffectiveTabPosition in [TTabPosition.None, TTabPosition.Dots]) then
    for Control in FTabBarControls do
      if (Control <> nil) and Control.Visible then
        Result := Result + Control.Width;
end;

procedure TTabControl.UpdateAnimation(const DotItems: Boolean; const ActiveTabLeft, ActiveTabRight: Single);
var
  I: Integer;
  EmptyWidth, MinActiveTabX, MaxActiveTabX: Single;
  MinTarget, MaxTarget: TAniCalculations.TTarget;
  OldTargets: array of TAniCalculations.TTarget;
  NewTargets: array of TAniCalculations.TTarget;
begin
  EmptyWidth := TabBarRect.Width - TabContentSize.Width - TabBarControlsWidth;
  FAniCalculations.GetTargets(OldTargets);
  MinTarget.Point := TPointD.Create(0, 0);
  MinTarget.TargetType := TAniCalculations.TTargetType.Min;
  MaxTarget.Point := TPointD.Create(0, 0);
  MaxTarget.TargetType := TAniCalculations.TTargetType.Max;
  if EmptyWidth >= 0 then
  begin
    if DotItems then
    begin
      MinTarget.Point.X := Ceil(EmptyWidth / 2);
      MaxTarget.Point.X := MinTarget.Point.X;
    end;
  end
  else
  begin
    MinTarget.Point.X := RoundByScale(Min(0, EmptyWidth));
    if not DotItems and (FIndexOfTargetTab >= 0) and (FIndexOfTargetTab < TabCount) and
      (Tabs[FIndexOfTargetTab].Visible) then
    begin
      MinActiveTabX := RoundByScale(Min(0, -ActiveTabLeft));
      MaxActiveTabX := RoundByScale(Min(0, TabBarRect.Width - ActiveTabRight - TabBarControlsWidth));
      if MaxActiveTabX < MinActiveTabX then
        MaxActiveTabX := MinActiveTabX;
      MinTarget.Point.X := MinActiveTabX;
      MaxTarget.Point.X := MaxActiveTabX;
    end;
  end;
  SetLength(NewTargets, 2);
  NewTargets[0] := MinTarget;
  NewTargets[1] := MaxTarget;
  for I := 0 to High(OldTargets) do
    if OldTargets[I].TargetType = TAniCalculations.TTargetType.Other then
    begin
      SetLength(NewTargets, Length(NewTargets) + 1);
      NewTargets[High(NewTargets)] := OldTargets[I];
    end;
  FAniCalculations.SetTargets(NewTargets);
end;

procedure TTabControl.RealignTabs;
const
  MinHeight = 5;
  InvisibleItemPos = $FFFF;
var
  TabPos: TTabPosition;
  DotItems: Boolean;
  CountVisibleTab, I, VisibleIndex, ColCount, RowCount, Surplus: Integer;
  CurX, CurY, LLeftOffset, LRightOffset, AutoWidth, MaxHeight, TotalWidth, ActiveTabLeft, ActiveTabRight: Single;
  ItemRect: TRectF;
  LItem: TTabItem;
  DesignTabWidth, DesignTabHeight, BorderDotItem: Integer;
begin
  if FRealigningTabs then
    Exit;
  if ([csLoading, csDestroying] * ComponentState = []) then
  begin
    FRealigningTabs := True;
    try
      { initialization }
      DesignTabWidth := TTabItem.DotSize;
      DesignTabHeight := TTabItem.DotSize;
      TabPos := EffectiveTabPosition;
      DotItems := TabPos in [TTabPosition.None, TTabPosition.Dots];
      FClientRect := LocalRect;
      if FBackground <> nil then
        FClientRect := FBackground.Padding.PaddingRect(FClientRect);
      if ResourceControl <> nil then
        FClientRect := ResourceControl.Margins.PaddingRect(FClientRect);
      if DotItems then
        MaxHeight := DesignTabHeight
      else
        MaxHeight := MinHeight;
      TotalWidth := 0;
      CountVisibleTab := 0;
      ActiveTabRight := 0;
      ActiveTabLeft := 0;
      { Calculate count of visible tabs and sizes }
      for I := 0 to TabCount - 1 do
      begin
        LItem := Tabs[I];
        LItem.FDesignSelectionMarks := not DotItems;
        if LItem.Visible then
        begin
          if not DotItems then
          begin
            if LItem = ActiveTab then
              ActiveTabLeft := TotalWidth + LItem.FLeftOffset;
            MaxHeight := Max(MaxHeight, Trunc(LItem.Info.Size.cy + LItem.Margins.Top + LItem.Margins.Bottom));
            TotalWidth := TotalWidth + LItem.Info.Size.cx + LItem.Margins.Left + LItem.Margins.Right;
            if LItem = ActiveTab then
              ActiveTabRight := TotalWidth - LItem.FRightOffset;
          end
          else if (CountVisibleTab = 0) and (LItem.ResourceControl <> nil) then
          begin
            if TOpenControl(LItem.ResourceControl).FixedSize.cx > 0 then
              DesignTabWidth := Max(DesignTabWidth, TOpenControl(LItem.ResourceControl).FixedSize.cx);
            if TOpenControl(LItem.ResourceControl).FixedSize.cy > 0 then
            begin
              DesignTabHeight := Max(DesignTabWidth, TOpenControl(LItem.ResourceControl).FixedSize.cy);
              MaxHeight := Max(MaxHeight, DesignTabHeight);
            end;
          end;
          Inc(CountVisibleTab);
        end;
      end;
      BorderDotItem := Max(1, Max(DesignTabHeight, DesignTabWidth) div 10);
      Inc(DesignTabHeight, 2 * BorderDotItem);
      Inc(DesignTabWidth, 2 * BorderDotItem);
      { Initialization of left and right offsets }
      LLeftOffset := 0;
      LRightOffset := 0;
      VisibleIndex := 0;
      if not DotItems then
        for I := 0 to TabCount - 1 do
        begin
          LItem := Tabs[I];
          if LItem.Visible then
          begin
            if VisibleIndex = 0 then
              LLeftOffset := LItem.FLeftOffset;
            if VisibleIndex = CountVisibleTab - 1 then
              LRightOffset := LItem.FRightOffset;
            Inc(VisibleIndex);
          end;
        end;
      { Calculate rows and columns }
      ColCount := CountVisibleTab;
      RowCount := 1;
      if DotItems and (CountVisibleTab > 0) then
      begin
        if CountVisibleTab * DesignTabWidth > FClientRect.Width then
        begin
          ColCount := Max(1, Trunc(FClientRect.Width / DesignTabWidth));
          RowCount := (CountVisibleTab + ColCount - 1) div ColCount;
        end;
        TotalWidth := ColCount * DesignTabWidth - 2 * BorderDotItem;
        MaxHeight := Max(RowCount * DesignTabHeight, FTabHeight);
        AutoWidth := DesignTabWidth;
      end
      else
      begin
        AutoWidth := FClientRect.Width + LLeftOffset + LRightOffset;
        if CountVisibleTab = 0 then
          MaxHeight := 0
        else
        begin
          if FTabHeight > 0 then
            MaxHeight := FTabHeight;
          if EffectiveFullSize then
          begin
            AutoWidth := Trunc(Max(MinHeight, AutoWidth / CountVisibleTab));
            TotalWidth := AutoWidth * CountVisibleTab;
          end;
          TotalWidth := TotalWidth - LLeftOffset - LRightOffset;
        end;
      end;
      { Initialization of bounds }
      FTabContentSize := TSizeF.Create(TotalWidth, MaxHeight);
      FTabBarRect := TRectF.Create(TPointF.Zero, FClientRect.Width, MaxHeight);
      case TabPos of
        TTabPosition.Top:
          FTabBarRect.Offset(FClientRect.TopLeft);
        TTabPosition.Bottom:
          FTabBarRect.Offset(FClientRect.Left, FClientRect.Bottom - FTabBarRect.Height);
        TTabPosition.None, TTabPosition.Dots:
          FTabBarRect.Offset(FClientRect.Left, FClientRect.Bottom - FTabBarRect.Height - DesignTabHeight);
      end;
      FContent.BoundsRect := TabBarRect;
      FNoItemsContent.BoundsRect := TabBarRect;
      FNoItemsContent.Visible := not (FTabPosition in [TTabPosition.None, TTabPosition.Dots]);
      UpdateTabBarButtons;
      UpdateAnimation(DotItems, ActiveTabLeft, ActiveTabRight);
      CurX := TabContentPosition - LLeftOffset;
      if EffectiveFullSize then
        Surplus := Trunc(Max(FClientRect.Width - TotalWidth, 0))
      else
        Surplus := 0;
      if DotItems then
        if (not (csDesigning in ComponentState)) and (TabPos = TTabPosition.None) then
          CurY := InvisibleItemPos
        else
          CurY := Round(Max(0, MaxHeight - (DesignTabHeight * RowCount - 2 * BorderDotItem)) / 2)
      else
        CurY := 0;
      VisibleIndex := 0;
      { Update tab positions }
      for I := 0 to TabCount - 1 do
      begin
        LItem := Tabs[I];
        if not LItem.Visible then
          Continue;
        if DotItems then
        begin
          ItemRect := TRectF.Create(CurX, CurY, CurX + DesignTabWidth - 2 * BorderDotItem,
            CurY + DesignTabHeight - 2 * BorderDotItem);
          CurX := CurX + DesignTabWidth;
          if CurX >= TabContentPosition + TabContentSize.Width then
          begin
            CurX := TabContentPosition;
            CurY := CurY + DesignTabHeight;
          end;
        end
        else
        begin
          ItemRect := TRectF.Create(TPointF.Create(CurX, CurY), LItem.Info.Size.cx, MaxHeight);
          ItemRect := LItem.Margins.PaddingRect(ItemRect);
          if EffectiveFullSize then
            ItemRect.Width := AutoWidth - LItem.Margins.Left - LItem.Margins.Right;
          if VisibleIndex = CountVisibleTab - 1 then
            ItemRect.Width := ItemRect.Width + Surplus;
          CurX := CurX + ItemRect.Width + LItem.Margins.Left + LItem.Margins.Right;
        end;
        LItem.BoundsRect := ItemRect;
        Inc(VisibleIndex);
      end;
      { aligning }
      for I := 0 to TabCount - 1 do
        if Tabs[I].Visible then
          Tabs[I].UpdateLayoutControl;
      if not FDisableAlign then
        Realign;
    finally
      FRealigningTabs := False;
    end;
  end
  else
    FContent.Height := 0;
end;

procedure TTabControl.Resize;
begin
  inherited;
  if [csLoading, csUpdating] * ComponentState = []  then
    TTabControlAnimation(FAniCalculations).UpdatePosImmediately;
end;

procedure TTabControl.DoRealign;
var
  I: Integer;
  B: TControl;
  TabPos: TTabPosition;
  LItem: TTabItem;
  LClientRect, ItemContentRect: TRectF;
  VisibleItemFound: Boolean;
begin
  if FTransitionRunning then
    Exit;
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  try
    RealignTabs;
    VisibleItemFound := False;
    LClientRect := FClientRect;
    TabPos := EffectiveTabPosition;
    case TabPos of
      TTabPosition.Top:
        LClientRect.Top := TabBarRect.Bottom;
      TTabPosition.Bottom:
        LClientRect.Bottom := TabBarRect.Top;
    end;
    if FContent.ControlsCount > 0 then
      for I := 0 to TabCount - 1 do
      begin
        LItem := Tabs[I];
        if not LItem.Visible then
          Continue;
        VisibleItemFound := True;
        LItem.Content.Visible := LItem.Index = TabIndex;
        ItemContentRect := Padding.PaddingRect(LClientRect);
        ItemContentRect := LItem.Content.Margins.PaddingRect(ItemContentRect);
        ItemContentRect.TopLeft := LItem.AbsoluteToLocal(LocalToAbsolute(ItemContentRect.TopLeft));
        ItemContentRect.BottomRight := LItem.AbsoluteToLocal(LocalToAbsolute(ItemContentRect.BottomRight));
        LItem.Content.BoundsRect := ItemContentRect;
        if LItem.Content.Visible then
          LItem.Content.BringToFront;
      end;
    if not VisibleItemFound then
      LClientRect := FClientRect;
    B := ResourceControl;
    if B <> nil then
    begin
      B.BoundsRect := LClientRect;
      B.BringToFront;
    end;
    if (TabPos in [TTabPosition.Dots, TTabPosition.None]) and (FContent <> nil) then
      FContent.BringToFront;
  finally
    FDisableAlign := False;
  end;
end;

function TTabControl.GetTabCount: Integer;
begin
  Result := FContent.ControlsCount;
end;

function TTabControl.GetTabItem(AIndex: Integer): TTabItem;
begin
  if InRange(AIndex, 0, FContent.ControlsCount - 1) then
    Result := FContent.Controls[AIndex] as TTabItem
  else
    Result := nil;
end;

function TTabControl.GetTabList: ITabList;
begin
  if FContent <> nil then
    Result := FContent.GetTabList
  else
    Result := inherited GetTabList;
end;

function TTabControl.FindVisibleTab(var Index: Integer; const FindKind: TFindKind): Boolean;

  function FindNextVisibleTab(const AFromIndex: Integer): Integer;
  var
    I: Integer;
  begin
    I := AFromIndex;
    repeat
      Inc(I);
    until (I >= TabCount) or Tabs[I].Visible;
    Result := I;
  end;

  function FindPrevVisibleTab(const AFromIndex: Integer): Integer;
  var
    I: Integer;
  begin
    I := AFromIndex;
    repeat
      Dec(I);
    until (I < 0) or Tabs[I].Visible;
    Result := I;
  end;

  function FindCurrentVisibleTab(const AFromIndex: Integer): Integer;
  begin
    if InRange(AFromIndex, 0, TabCount - 1) and Tabs[AFromIndex].Visible then
      Result := AFromIndex
    else
    begin
      Result := FindNextVisibleTab(AFromIndex);
      if Result >= TabCount then
        Result := FindPrevVisibleTab(AFromIndex);
    end;
  end;

var
  NormalizedTabIndex: Integer;
  NewIndex: Integer;
begin
  NormalizedTabIndex := EnsureRange(Index, -1, TabCount);
  case FindKind of
    TTabControl.TFindKind.Next:
      NewIndex := FindNextVisibleTab(NormalizedTabIndex);

    TTabControl.TFindKind.Back:
      NewIndex := FindPrevVisibleTab(NormalizedTabIndex);

    TTabControl.TFindKind.First:
      NewIndex := FindNextVisibleTab(-1);

    TTabControl.TFindKind.Last:
      NewIndex := FindPrevVisibleTab(TabCount);

    TTabControl.TFindKind.Current:
      NewIndex := FindCurrentVisibleTab(NormalizedTabIndex);
  else
    NewIndex := FindCurrentVisibleTab(NormalizedTabIndex);
  end;

  Result := InRange(NewIndex, 0, TabCount - 1);
  if Result then
    Index := NewIndex;
end;

function TTabControl.FindVisibleTab(const FindKind: TFindKind): Integer;
var
  I: Integer;
begin
  I := TabIndex;
  if FindVisibleTab(I, FindKind) then
    Result := I
  else
    Result := -1;
end;

procedure TTabControl.GoToActiveTab;
begin
  if (ActiveTab <> nil) and ActiveTab.Visible and (FIndexOfTargetTab <> ActiveTab.Index) then
  begin
    FIndexOfTargetTab := ActiveTab.Index;
    Realign;
  end;
end;

function TTabControl.GotoVisibleTab(Index: Integer; ATransition: TTabTransition;
const ADirection: TTabTransitionDirection): Boolean;
var
  LDirection: TTabTransitionDirection;
begin
  Result := (Index >= 0) and (Index < TabCount) and (Index <> TabIndex) and (Tabs[Index].Visible) and
    (not TransitionRunning);
  if Result then
  begin
    LDirection := ADirection;
    if TabIndex < 0 then
      TabIndex := Index
    else
    begin
      if Index < TabIndex then
      begin
        if LDirection = TTabTransitionDirection.Normal then
          LDirection := TTabTransitionDirection.Reversed
        else if LDirection = TTabTransitionDirection.Reversed then
          LDirection := TTabTransitionDirection.Normal;
      end;
      SetActiveTabWithTransition(Tabs[Index], ATransition, LDirection);
    end;
    Result := TabIndex = Index;
  end;
end;

function TTabControl.ObjectAtPoint(P: TPointF): IControl;

  function CheckControl(const Control: TControl; const LocalPoint: TPointF): Boolean;
  var
    LocalRect: TRectF;
  begin
    Result := (Control <> nil) and (Control.Visible);
    if Result then
    begin
      LocalRect := Control.AbsoluteRect;
      LocalRect.TopLeft := AbsoluteToLocal(LocalRect.TopLeft);
      LocalRect.BottomRight := AbsoluteToLocal(LocalRect.BottomRight);
      Result := LocalRect.Contains(LocalPoint);
    end;
  end;

var
  I: Integer;
  LTabPosition: TTabPosition;
  LocalPoint: TPointF;
  Button: TControl;
begin
  Result := nil;
  LocalPoint := ScreenToLocal(P);
  if FClientRect.Contains(LocalPoint) then
  begin
    if not (csDesigning in ComponentState) then
      for Button in FTabBarControls do
        if CheckControl(Button, LocalPoint) then
        begin
          if (Button as IControl).Enabled then
            Result := Button as IControl
          else if CheckControl(FTabBarControlPanel, LocalPoint) then
            Result := FTabBarControlPanel;
          Exit;
        end;
    LTabPosition := EffectiveTabPosition;
    if (LTabPosition = TTabPosition.Dots) or ((LTabPosition = TTabPosition.None) and (csDesigning in ComponentState))
    then
      for I := 0 to TabCount - 1 do
        if CheckControl(Tabs[I], LocalPoint) then
          Exit(Tabs[I] as IControl);
    Result := inherited ObjectAtPoint(P);
  end;
end;

function TTabControl.Next(ATransition: TTabTransition; const ADirection: TTabTransitionDirection): Boolean;
begin
  Result := GotoVisibleTab(FindVisibleTab(TFindKind.Next), ATransition, ADirection);
end;

function TTabControl.Previous(ATransition: TTabTransition; const ADirection: TTabTransitionDirection): Boolean;
begin
  Result := GotoVisibleTab(FindVisibleTab(TFindKind.Back), ATransition, ADirection);
end;

function TTabControl.First(ATransition: TTabTransition; const ADirection: TTabTransitionDirection): Boolean;
begin
  Result := GotoVisibleTab(FindVisibleTab(TFindKind.First), ATransition, ADirection);
end;

function TTabControl.Last(ATransition: TTabTransition; const ADirection: TTabTransitionDirection): Boolean;
begin
  Result := GotoVisibleTab(FindVisibleTab(TFindKind.Last), ATransition, ADirection);
end;

procedure TTabControl.Loaded;
var
  I: Integer;
  LShowAsDot: Boolean;
begin
  FRealigningTabs := True;
  try
    inherited;
    if not FTabPositionSet then
      TabPosition := TTabPosition.Top;
    LShowAsDot := EffectiveTabPosition in [TTabPosition.None, TTabPosition.Dots];
    for I := 0 to TabCount - 1 do
    begin
      Tabs[I].ShowAsDot := LShowAsDot;
      Tabs[I].ApplyStyleLookup;
      Tabs[I].InvalidateSize;
    end;
  finally
    FRealigningTabs := False;
  end;
  RealignTabs;
end;

procedure TTabControl.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
var
  R: TRectF;
begin
  if not (csDesigning in ComponentState) and (EffectiveTabPosition in [TTabPosition.Bottom, TTabPosition.Top]) then
  begin
    R := TabBarRect;
    R.TopLeft := LocalToScreen(R.TopLeft);
    R.BottomRight := LocalToScreen(R.BottomRight);
    if R.Contains(Screen.MousePos) then
    begin
      FAniCalculations.MouseWheel(WheelDelta / 3, 0);
      // TabContentPosition := TabContentPosition + (WheelDelta / 3);
      Handled := True;
    end
    else
      inherited;
  end
  else
    inherited;
end;

procedure TTabControl.DefineProperties(Filer: TFiler);

begin
  inherited;
  Filer.DefineProperty('Sizes', ReadSizes, WriteSizes, TabCount > 0);
end;

procedure TTabControl.ReadSizes(Reader: TReader);
var
  I: Integer;
  Size: TSizeF;
begin
  FStoredTabSize.Clear;
  I := 0;
  Reader.ReadListBegin;
  while not Reader.EndOfList do
  begin
    if Odd(I) then
    begin
      Size.Cy := Reader.ReadSingle;
      FStoredTabSize.Add(Size)
    end
    else
      Size.Cx := Reader.ReadSingle;
    Inc(I);
  end;
  Reader.ReadListEnd;
end;

procedure TTabControl.WriteSizes(Writer: TWriter);
var
  I: Integer;
begin
  Writer.WriteListBegin;
  for I := 0 to TabCount - 1 do
  begin
    Writer.WriteSingle(Tabs[I].Content.Width);
    Writer.WriteSingle(Tabs[I].Content.Height);
  end;
  Writer.WriteListEnd;
end;


function TTabControl.Delete(const Index: Integer): Boolean;
var
  LTabIndex: Integer;
  Obj: TFmxObject;
begin
  Result := False;
  if (Index >= 0) and (Index < TabCount) then
  begin
    if TabIndex > Index then
      LTabIndex := TabIndex - 1
    else if TabIndex = Index then
      LTabIndex := Index
    else
      LTabIndex := -1;
    Obj := (Self as IItemsContainer).GetItem(Index);
    Obj.DisposeOf;
    if (LTabIndex >= 0) and FindVisibleTab(LTabIndex, TFindKind.Current) then
      TabIndex := LTabIndex;
  end;
end;

function TTabControl.Add(const TabClass: TTabItemClass): TTabItem;
var
  LTabClass: TTabItemClass;
begin
  if TabClass = nil then
    LTabClass := TTabItem
  else
    LTabClass := TabClass;
  Result := LTabClass.Create(Self);
  try
    Result.Parent := Self;
  except
    FreeAndNil(Result);
    Raise;
  end;
end;

function TTabControl.Insert(const Index: Integer; const TabClass: TTabItemClass): TTabItem;
var
  LTabIndex: Integer;
begin
  Result := nil;
  if (Index >= 0) and (Index <= TabCount) then
  begin
    if TabIndex >= Index then
      LTabIndex := TabIndex + 1
    else
      LTabIndex := -1;
    Result := Add(TabClass);
    if Index < TabCount - 1 then
    begin
      Result.Index := Index;
      if (LTabIndex >= 0) and FindVisibleTab(LTabIndex, TFindKind.Current) then
        TabIndex := LTabIndex;
    end;
  end;
end;

function TTabControl.HasActiveTab: Boolean;
begin
  Result := ActiveTab <> nil;
end;

procedure TTabControl.WebBrowserRealign(Sender: TObject);
var
  BrowserManager: IFMXWBService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXWBService, BrowserManager) then
    BrowserManager.RealignBrowsers;
end;

procedure TTabControl.SetTabIndex(const Value: Integer);

  procedure DeselectActiveTab;
  begin
    if HasActiveTab then
      ActiveTab.SetSelectedInternal(False);
  end;

  procedure SelectActiveTab;
  begin
    if HasActiveTab then
      ActiveTab.SetSelectedInternal(True);
  end;

var
  PickerService: IFMXPickerService;
begin
  if FTabIndex <> Value then
  begin
    DeselectActiveTab;
    FTabIndex := Value;
    SelectActiveTab;
    Realign;
    if [csLoading, csDestroying] * ComponentState = [] then
      DoChange;
    // When user change active tab (iOS), we need close all active pickers
    if TPlatformServices.Current.SupportsPlatformService(IFMXPickerService, PickerService) then
      PickerService.CloseAllPickers;
    WebBrowserRealign(nil);
  end;
end;

procedure TTabControl.SetActiveTab(const Value: TTabItem);
begin
  if (Value <> nil) and IsChild(Value) then
    TabIndex := Value.Index
  else
    TabIndex := -1;
end;

procedure TTabControl.SetActiveTabWithTransition(const ATab: TTabItem; ATransition: TTabTransition;
const ADirection: TTabTransitionDirection = TTabTransitionDirection.Normal);

  procedure LocalAnimateInt(AParent: TFmxObject; const APropertyName: string; const NewValue: Integer;
  Duration: Single = 0.2;
  AType: TAnimationType = TAnimationType.In;
  AInterpolation: TInterpolationType = TInterpolationType.Linear);
  var
    A: TIntAnimation;
  begin
    TAnimator.StopPropertyAnimation(Self, APropertyName);
    A := TIntAnimation.Create(AParent);
    A.Parent := AParent;
    A.AnimationType := AType;
    A.Interpolation := AInterpolation;
    A.OnFinish := AnimationFinished;
    A.OnProcess := WebBrowserRealign;
    A.Duration := Duration;
    A.PropertyName := APropertyName;
    A.StartFromCurrent := True;
    A.StopValue := NewValue;
    A.Start;
  end;

  procedure LocalAnimateIntWait(AParent: TFmxObject; const APropertyName: string; const NewValue: Integer;
  Duration: Single = 0.2;
  AType: TAnimationType = TAnimationType.In;
  AInterpolation: TInterpolationType = TInterpolationType.Linear);
  var
    A: TIntAnimation;
  begin
    TAnimator.StopPropertyAnimation(Self, APropertyName);
    A := TIntAnimation.Create(AParent);
    try
      A.Parent := AParent;
      A.AnimationType := AType;
      A.Interpolation := AInterpolation;
      A.Duration := Duration;
      A.PropertyName := APropertyName;
      A.StartFromCurrent := True;
      A.StopValue := NewValue;
      A.Start;
      while A.Running do
      begin
        Application.ProcessMessages;
        Sleep(0);
      end;
    finally
      A.DisposeOf;
    end;
  end;

  procedure DisableDisappear(const AControl: TControl);
  var
    I: Integer;
  begin
    // To avoid free style during animation
    AControl.DisableDisappear := True;
    for I := 0 to AControl.ControlsCount - 1 do
      DisableDisappear(AControl.Controls[I]);
  end;

  procedure PreloadContent(const Control: TControl);
  var
    Buffer: TBitmap;
  begin
    // Draw to Bitmap force to load all styles, measure size, build font-glyphs etc
    Buffer := TBitmap.Create(1, 1);
    try
      Buffer.Canvas.BeginScene;
      try
        Control.PaintTo(Buffer.Canvas, Control.LocalRect);
      finally
        Buffer.Canvas.EndScene;
      end;
    finally
      Buffer.DisposeOf;
    end;
  end;

const
  Duration = 0.3;
var
  Tab1, Tab2: TTabItem;
  Layout1, Layout2: TControl;
  LayoutRect: TRectF;
  P, LayoutPos: TPointF;
begin
  case ATransition of
    TTabTransition.Slide:
      begin
        FTransitionRunning := True;
        ClipChildren := True;
        try
          LayoutPos := ActiveTab.Content.LocalToAbsolute(PointF(0, 0));
          LayoutRect := ActiveTab.Content.BoundsRect;

          Tab1 := ActiveTab;
          Layout1 := ActiveTab.Content;
          ActiveTab := ATab;
          Tab2 := ActiveTab;
          Layout2 := ActiveTab.Content;

          SetLength(FTransitionTabs, 2);
          FTransitionTabs[0] := Tab1;
          FTransitionTabs[1] := Tab2;

          DisableDisappear(Tab1);

          Layout1.Visible := True;
          Layout2.Visible := True;
          if not Tab2.DisableDisappear then
          begin
            DisableDisappear(Tab2);
            PreloadContent(Layout2);
          end;

          if ADirection = TTabTransitionDirection.Normal then
          begin
            P := Tab1.AbsoluteToLocal(LayoutPos);
            Layout1.SetBounds(P.X, P.Y, LayoutRect.Width, LayoutRect.Height);
            LocalAnimateInt(Layout1, 'Position.X', Round(P.X - LayoutRect.Width), Duration, TAnimationType.In,
              TInterpolationType.Linear);
            P := Tab2.AbsoluteToLocal(LayoutPos);
            Layout2.SetBounds(P.X + LayoutRect.Width, P.Y, LayoutRect.Width, LayoutRect.Height);
            LocalAnimateIntWait(Layout2, 'Position.X', Round(P.X), Duration, TAnimationType.In,
              TInterpolationType.Linear);
          end
          else
          begin
            P := Tab1.AbsoluteToLocal(LayoutPos);
            Layout1.SetBounds(P.X, P.Y, LayoutRect.Width, LayoutRect.Height);
            LocalAnimateInt(Layout1, 'Position.X', Round(P.X + LayoutRect.Width), Duration, TAnimationType.In,
              TInterpolationType.Linear);
            P := Tab2.AbsoluteToLocal(LayoutPos);
            Layout2.SetBounds(P.X - LayoutRect.Width, P.Y, LayoutRect.Width, LayoutRect.Height);
            LocalAnimateIntWait(Layout2, 'Position.X', Round(P.X), Duration, TAnimationType.In,
              TInterpolationType.Linear);
          end;
        finally
          SetLength(FTransitionTabs, 0);
          ClipChildren := False;
          FTransitionRunning := False;
          Realign;
        end;
        // Force repaint
        Application.ProcessMessages;
      end
  else
    ActiveTab := ATab;
  end;
end;

function TTabControl.RoundByScale(const Value: Double): Single;
var
  Scale: Double;
begin
  Scale := 1;
  if (FContent <> nil) then
  begin
    if FContent.Scene <> nil then
      Scale := FContent.Scene.GetSceneScale;
    Scale := Scale * TTabControlContent(FContent).AbsoluteScale.X;
  end;
  Result := RoundTo(RoundTo(Value * Scale, 0) / Scale, -3);
end;

function TTabControl.GetTabContentPosition: Single;
begin
  Result := RoundByScale(FAniCalculations.ViewportPosition.X);
end;

procedure TTabControl.SetTabContentPosition(const Value: Single);
var
  NewPosition: Single;
  P: TPointD;
begin
  NewPosition := RoundByScale(Value);
  if not SameValue(RoundByScale(GetTabContentPosition), NewPosition, TEpsilon.Position) then
  begin
    P := TPointD.Create(NewPosition, 0);
    FAniCalculations.ViewportPosition := P;
  end;
end;

procedure TTabControl.SetTabHeight(const Value: Single);
var
  I: Integer;
  OldRealigningTabs: Boolean;
begin
  if (FTabHeight <> Value) and not FFixedTabHeight then
  begin
    FTabHeight := Value;
    OldRealigningTabs := FRealigningTabs;
    try
      FRealigningTabs := True;
      for I := 0 to TabCount - 1 do
      begin
        if FTabHeight <= 0 then
        begin
          if not Tabs[I].AutoSize and (Tabs[I].Info.ExplicitSize.cy > 0) then
            Tabs[I].Height := Tabs[I].Info.ExplicitSize.cy;
        end
        else
          Tabs[I].Height := Value;
      end;
    finally
      FRealigningTabs := OldRealigningTabs;
    end;
    Realign;
  end;
end;

procedure TTabControl.SetFullSize(const Value: TBehaviorBoolean);
var
  OldFullSize: Boolean;
begin
  OldFullSize := EffectiveFullSize;
  FFullSize := Value;
  if OldFullSize <> EffectiveFullSize then
    Realign;
end;

procedure TTabControl.ImagesChanged;
var
  I: Integer;
begin
  inherited;
  if FImages <> FImageLink.Images then
  begin
    FImages := TCustomImageList(FImageLink.Images);
    for I := 0 to TabCount - 1 do
      Tabs[I].SetImages(FImages);
  end;
end;

function TTabControl.GetImageIndex: TImageIndex;
begin
  Result := -1;
end;

procedure TTabControl.SetImageIndex(const Value: TImageIndex);
begin
  // none
end;

function TTabControl.GetImageList: TBaseImageList;
begin
  Result := GetImages;
end;

procedure TTabControl.SetImageList(const Value: TBaseImageList);
begin
  ValidateInheritance(Value, TCustomImageList);
  SetImages(TCustomImageList(Value));
end;

function TTabControl.GetImages: TCustomImageList;
begin
  Result := TCustomImageList(FImageLink.Images);
end;

procedure TTabControl.SetImages(const Value: TCustomImageList);
begin
  FImageLink.Images := Value;
end;

procedure TTabControl.SetInternalContentPosition(const Value: Double);
var
  NewValue: Single;
begin
  if not FRealigningTabs then
  begin
    NewValue := RoundByScale(Value);
    if not SameValue(NewValue, FInternalContentPosition, TEpsilon.Position) then
    begin
      FInternalContentPosition := NewValue;
      Realign;
    end;
  end;
end;

procedure TTabControl.SetTabPosition(const Value: TTabPosition);
var
  I: Integer;
  LOldShowAsDot, LNewShowAsDot: Boolean;
begin
  FTabPositionSet := True;
  if FTabPosition <> Value then
  begin
    LOldShowAsDot := EffectiveTabPosition in [TTabPosition.None, TTabPosition.Dots];
    FTabPosition := Value;
    LNewShowAsDot := EffectiveTabPosition in [TTabPosition.None, TTabPosition.Dots];
    if LNewShowAsDot <> LOldShowAsDot then
    begin
      for I := 0 to TabCount - 1 do
        Tabs[I].ShowAsDot := LNewShowAsDot;
      if LOldShowAsDot then
      begin
        Realign;
        TabContentPosition := 0;
      end;
    end;
    if not (csLoading in ComponentState) then
      ApplyTabsStyleLookup;
    Realign;
    if (LNewShowAsDot <> LOldShowAsDot) and LOldShowAsDot then
      GoToActiveTab;
  end;
end;

procedure TTabControl.TabButtonClick(Sender: TObject);
const
  DefaultWheel = 40;
begin
  if Sender <> nil then
  begin
    if Sender = FTabBarControls[TTabBarButton.Left] then
      TabContentPosition := Min(TTabControlAnimation(FAniCalculations).MaxTarget.Point.X,
        TabContentPosition + DefaultWheel);
    if Sender = FTabBarControls[TTabBarButton.Right] then
      TabContentPosition := Max(TTabControlAnimation(FAniCalculations).MinTarget.Point.X,
        TabContentPosition - DefaultWheel);
  end;
end;

procedure TTabControl.DoUpdateTabBarButtons(const TabBarButtons: TTabBarButtons; const TabPosition: TTabPosition;
  const Content: TContent; var TabBarControls: TArrayTabBarControls);
const
  MinButtonSize = 9;
  MaxButtonSize = 21;
  PanelMargin = 5;

  function CreateScrollButton(const StyleName: string; const ClickEvent: TNotifyEvent): TCustomButton;
  begin
    Result := TSpeedButton.Create(nil);
    try
      if FTabBarControlPanel = nil then
      begin
        FTabBarControlPanel := TTabBarControlPanel.Create(Self);
        FTabBarControlPanel.Parent := Content;
      end;
      Result.Parent := FTabBarControlPanel;
      Result.RepeatClick := True;
      Result.StyleLookup := StyleName;
      Result.Locked := True;
      Result.Stored := False;
      Result.Visible := False;
      Result.OnClick := ClickEvent;
    except
      Result.DisposeOf;
      raise;
    end;
  end;

  function CalcNormalControlsSize(const ClientRect: TRectF): TSizeF;
  begin
    Result.cx := EnsureRange(Ceil(ClientRect.Height - 2 * PanelMargin), MinButtonSize, MaxButtonSize);
    if not Odd(Round(Result.cx)) then
      Result.cx := Result.cx - 1;
    Result.cy := Round(Max(MinButtonSize, ClientRect.Height - 2 * PanelMargin));
    if not Odd(Round(Result.cy)) then
      Result.cy := Result.cy + 1;
  end;

  function CalcSmallControlsSize(const ClientRect: TRectF): TSizeF;
  begin
    Result.cy := EnsureRange(ClientRect.Height / 2, PanelMargin, MinButtonSize);
    Result.cx := Result.cy;
  end;

  function InitTabBarControlPanel(const VisibleControlCount: Integer): TSizeF;
  var
    ContentClientRect: TRectF;
    PanelWidth: Single;
    PanelPosition: TPointF;
  begin
    ContentClientRect := Content.Padding.PaddingRect(Content.LocalRect);
    Result := CalcNormalControlsSize(ContentClientRect);
    PanelWidth := Result.cx * VisibleControlCount;
    if PanelWidth > (TabBarRect.Width / 2) then
    begin
      // small buttons
      Result := CalcSmallControlsSize(ContentClientRect);
      PanelWidth := Result.cx * Min(Trunc(TabBarRect.Width / Result.cx), VisibleControlCount);
      PanelPosition.Y := 0;
    end
    else
      PanelPosition.Y := Ceil(Max(0, ContentClientRect.Height - Result.Height) / 2);
    if EffectiveTabPosition = TTabPosition.Bottom then
      PanelPosition.Y := ContentClientRect.Bottom - Result.Height - PanelPosition.Y
    else
      PanelPosition.Y := ContentClientRect.Top + PanelPosition.Y;
    PanelPosition.X := ContentClientRect.Right - PanelWidth;
    FTabBarControlPanel.SetBounds(PanelPosition.X, PanelPosition.Y, PanelWidth, Result.cy);
    FTabBarControlPanel.Visible := True;
    FTabBarControlPanel.BringToFront;
  end;

  procedure InitTabBarControls(const ButtonSize: TSizeF);
  var
    X, LTabBarControlsWidth: Single;
    Button: TTabBarButton;
  begin
    X := FTabBarControlPanel.Width;
    for Button := High(TTabBarButton) downto Low(TTabBarButton) do
      if (TabBarControls[Button] <> nil) and TabBarControls[Button].Visible then
      begin
        X := X - ButtonSize.cx;
        if X < 0 then
          TabBarControls[Button].Visible := False;
        TabBarControls[Button].SetBounds(X, 0, ButtonSize.cx, ButtonSize.cy);
      end;
    LTabBarControlsWidth := TabBarControlsWidth;
    for Button := High(TTabBarButton) downto Low(TTabBarButton) do
      if (TabBarControls[Button] <> nil) and TabBarControls[Button].Visible then
        case Button of
          TTabControl.TTabBarButton.Left:
            TabBarControls[Button].Enabled := TabContentPosition < 0;
          TTabControl.TTabBarButton.Right:
            TabBarControls[Button].Enabled := TabBarRect.Width - LTabBarControlsWidth <
               (TabContentSize.Width + TabContentPosition);
        end;
  end;

var
  Button: TTabBarButton;
  ButtonSize: TSizeF;
  ButtonsFound: Boolean;
  VisibleControlCount: Integer;
begin
  VisibleControlCount := 0;
  ButtonsFound := False;
  for Button := Low(TTabBarButton) to High(TTabBarButton) do
    if Button in TabBarButtons then
    begin
      ButtonsFound := True;
      if TabBarControls[Button] = nil then
        TabBarControls[Button] := CreateScrollButton(ButtonStyleNames[Button], TabButtonClick);
      TabBarControls[Button].Visible := TabBarRect.Width < TabContentSize.Width;
      if TabBarControls[Button].Visible then
        Inc(VisibleControlCount);
    end
    else
    begin
      TabBarControls[Button].DisposeOf;
      TabBarControls[Button] := nil;
    end;

  if ButtonsFound then
  begin
    if VisibleControlCount > 0 then
    begin
      ButtonSize := InitTabBarControlPanel(VisibleControlCount);
      InitTabBarControls(ButtonSize);
    end
    else if FTabBarControlPanel <> nil then
      FTabBarControlPanel.Visible := False;
  end
  else
  begin
    FTabBarControlPanel.DisposeOf;
    FTabBarControlPanel := nil;
  end;
end;

procedure TTabControl.EnabledChanged;
begin
  RealignTabs;
  inherited;
end;

function TTabControl.GetEffectiveFullSize: Boolean;
begin
  case FFullSize of
    TBehaviorBoolean.True: Result := True;
    TBehaviorBoolean.False: Result := False;
  else
    Result := FDefaultFullSize;
  end;
end;

procedure TTabControl.UpdateTabBarButtons;
var
  CurrentTabButtons: TTabBarButtons;
  TabPos: TTabPosition;
  OldDisableAlign: Boolean;
begin
  if (FContent <> nil) then
  begin
    TabPos := EffectiveTabPosition;
    if (TabPos in [TTabPosition.Top, TTabPosition.Bottom]) and Enabled then
    begin
      CurrentTabButtons := TabBarButtons;
      if HasTouchScreen then
        CurrentTabButtons := CurrentTabButtons - [TTabBarButton.Left, TTabBarButton.Right];
    end
    else
      CurrentTabButtons := [];
    OldDisableAlign := TTabControlContent(FContent).FDisableAlign;
    try
      TTabControlContent(FContent).FDisableAlign := True;
      DoUpdateTabBarButtons(CurrentTabButtons, TabPos, FContent, FTabBarControls);
    finally
      TTabControlContent(FContent).FDisableAlign := OldDisableAlign;
    end;
  end;
end;

procedure TTabControl.SetTabBarButtons(const Value: TTabBarButtons);
begin
  if FTabBarButtons <> Value then
  begin
    FTabBarButtons := Value;
    RealignTabs;
  end;
end;

procedure TTabControl.ApplyTabsStyleLookup;
var
  I: Integer;
begin
  for I := 0 to TabCount - 1 do
  begin
    Tabs[I].NeedStyleLookup;
    Tabs[I].InvalidateSize;
  end;
end;

procedure RegisterAliases;
begin
  AddEnumElementAliases(TypeInfo(TTabTransition), ['ttNone', 'ttSlide']);
  AddEnumElementAliases(TypeInfo(TTabTransitionDirection), ['tdNormal', 'tdReversed']);
  AddEnumElementAliases(TypeInfo(TTabPosition), ['tpTop', 'tpBottom', 'tpNone', 'tpDots']);
end;

procedure UnregisterAliases;
begin
  RemoveEnumElementAliases(TypeInfo(TTabTransition));
  RemoveEnumElementAliases(TypeInfo(TTabTransitionDirection));
  RemoveEnumElementAliases(TypeInfo(TTabPosition));
end;

{ TTabControlContentTabList }

function TTabControlContentTabList.GetItem(const Index: Integer): IControl;
var
  TabControl: TTabControl;
begin
  TabControl := GetTabControl;
  if TabControl <> nil then
    Result := TabControl.ActiveTab;
end;

function TTabControlContentTabList.GetCount: Integer;
var
  TabControl: TTabControl;
begin
  Result := 0;
  TabControl := GetTabControl;
  if (TabControl <> nil) and (TabControl.TabCount > 0) then
    Result := 1;
end;

function TTabControlContentTabList.IndexOf(const TabStop: IControl): Integer;
begin
  Result := 0;
end;

function TTabControlContentTabList.IsAddable(const TabStop: IControl): Boolean;
begin
  Result := False;
end;

function TTabControlContentTabList.GetTabControl: TTabControl;
var
  Content: IControl;
  Parent: TFmxObject;
begin
  Result := nil;
  if Supports(Controller, IControl, Content) then
  begin
    Parent := Content.GetObject.Parent;
    if Parent is TTabControl then
      Result := TTabControl(Parent);
  end;
end;

initialization

RegisterAliases;
RegisterFmxClasses([TTabControl, TTabItem]);

finalization

UnregisterAliases;

end.
