
{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.ComCtrls;

{$R-,T-,H+,X+}

{$HPPEMIT '#ifndef _WIN64'}
{$HPPEMIT '#pragma link "dwmapi.lib"'}
{$HPPEMIT '#endif //_WIN64'}

interface

uses
{$IFDEF CLR}
  System.Runtime.InteropServices, System.Collections, System.Text, ActiveX,
{$ENDIF}
  Winapi.Messages, Winapi.Windows, System.SysUtils, Winapi.CommCtrl, Vcl.Forms, Vcl.Controls, Vcl.Menus,
  Vcl.Graphics, Vcl.StdCtrls, Winapi.RichEdit, Vcl.ToolWin, Vcl.ImgList, System.Classes, Vcl.ExtCtrls, Vcl.ListActns,
  Winapi.ShlObj, Vcl.Themes, Vcl.GraphUtil, System.UITypes;
  
const
{ Calendar common control support }
  dowMonday	= System.UITypes.TCalDayOfWeek.dowMonday;
  dowTuesday	= System.UITypes.TCalDayOfWeek.dowTuesday;
  dowWednesday	= System.UITypes.TCalDayOfWeek.dowWednesday;
  dowThursday	= System.UITypes.TCalDayOfWeek.dowThursday;
  dowFriday	= System.UITypes.TCalDayOfWeek.dowFriday;
  dowSaturday	= System.UITypes.TCalDayOfWeek.dowSaturday;
  dowSunday	= System.UITypes.TCalDayOfWeek.dowSunday;
  dowLocaleDefault	= System.UITypes.TCalDayOfWeek.dowLocaleDefault;  

type
  THitTest = (htAbove, htBelow, htNowhere, htOnItem, htOnButton, htOnIcon,
    htOnIndent, htOnLabel, htOnRight, htOnStateIcon, htToLeft, htToRight);
  THitTests = set of THitTest;

  TCustomTabControl = class;

  TTabChangingEvent = procedure(Sender: TObject;
    var AllowChange: Boolean) of object;

  TTabPosition = (tpTop, tpBottom, tpLeft, tpRight);

  TTabStyle = (tsTabs, tsButtons, tsFlatButtons);

  TDrawTabEvent = procedure(Control: TCustomTabControl; TabIndex: Integer;
    const Rect: TRect; Active: Boolean) of object;
  TTabGetImageEvent = procedure(Sender: TObject; TabIndex: Integer;
    var ImageIndex: Integer) of object;

  TCustomTabControl = class(TWinControl)
  private
    FCanvas: TCanvas;
    FHotTrack: Boolean;
    FImageChangeLink: TChangeLink;
    FImages: TCustomImageList;
    FMultiLine: Boolean;
    FMultiSelect: Boolean;
    FOwnerDraw: Boolean;
    FRaggedRight: Boolean;
    FSaveTabIndex: Integer;
    FSaveTabs: TStringList;
    FScrollOpposite: Boolean;
    FStyle: TTabStyle;
    FTabPosition: TTabPosition;
    FTabs: TStrings;
    FTabSize: TSmallPoint;
    FUpdating: Boolean;
    FSavedAdjustRect: TRect;
    FOnChange: TNotifyEvent;
    FOnChanging: TTabChangingEvent;
    FOnDrawTab: TDrawTabEvent;
    FOnGetImageIndex: TTabGetImageEvent;
    class constructor Create;
    class destructor Destroy;
    function GetDisplayRect: TRect;
    function GetTabIndex: Integer;
    function GetTabs: TStrings;
    procedure ImageListChange(Sender: TObject);
    function InternalSetMultiLine(Value: Boolean): Boolean;
    procedure SetHotTrack(Value: Boolean);
    procedure SetImages(Value: TCustomImageList);
    procedure SetMultiLine(Value: Boolean);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetOwnerDraw(Value: Boolean);
    procedure SetRaggedRight(Value: Boolean);
    procedure SetScrollOpposite(Value: Boolean);
    procedure SetStyle(Value: TTabStyle);
    procedure SetTabHeight(Value: Smallint);
    procedure SetTabPosition(Value: TTabPosition);
    procedure SetTabs(Value: TStrings);
    procedure SetTabWidth(Value: Smallint);
    procedure TabsChanged;
    procedure UpdateTabSize;
    procedure CMStyleChanged(var Message: TMessage); message CM_STYLECHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMTabStopChanged(var Message: TMessage); message CM_TABSTOPCHANGED;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure TCMAdjustRect(var Message: TTCMAdjustRect); message TCM_ADJUSTRECT;
    procedure WMDestroy(var Message: TWMDestroy); message WM_DESTROY;
    procedure WMNotifyFormat(var Message: TWMNotifyFormat); message WM_NOTIFYFORMAT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  protected
    procedure AdjustClientRect(var Rect: TRect); override;
    function CanChange: Boolean; dynamic;
    function CanShowTab(TabIndex: Integer): Boolean; virtual;
    procedure Change; dynamic;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean); virtual;
    function GetImageIndex(TabIndex: Integer): Integer; virtual;
    procedure Loaded; override;
    procedure UpdateTabImages;
    property DisplayRect: TRect read GetDisplayRect;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default False;
    property Images: TCustomImageList read FImages write SetImages;
    property MultiLine: Boolean read FMultiLine write SetMultiLine default False;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetTabIndex(Value: Integer); virtual;
    property OwnerDraw: Boolean read FOwnerDraw write SetOwnerDraw default False;
    property RaggedRight: Boolean read FRaggedRight write SetRaggedRight default False;
    property ScrollOpposite: Boolean read FScrollOpposite
      write SetScrollOpposite default False;
    property Style: TTabStyle read FStyle write SetStyle default tsTabs;
    property TabHeight: Smallint read FTabSize.Y write SetTabHeight default 0;
    property TabIndex: Integer read GetTabIndex write SetTabIndex default -1;
    property TabPosition: TTabPosition read FTabPosition write SetTabPosition
      default tpTop;
    property Tabs: TStrings read GetTabs write SetTabs;
    property TabWidth: Smallint read FTabSize.X write SetTabWidth default 0;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChanging: TTabChangingEvent read FOnChanging write FOnChanging;
    property OnDrawTab: TDrawTabEvent read FOnDrawTab write FOnDrawTab;
    property OnGetImageIndex: TTabGetImageEvent read FOnGetImageIndex write FOnGetImageIndex;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IndexOfTabAt(X, Y: Integer): Integer;
    function GetHitTestInfoAt(X, Y: Integer): THitTests;
    function TabRect(Index: Integer): TRect;
    function RowCount: Integer;
    procedure ScrollTabs(Delta: Integer);
    property Canvas: TCanvas read FCanvas;
    property TabStop default True;
  end;

  TTabControl = class(TCustomTabControl)
  strict private
    class constructor Create;
    class destructor Destroy;
  public
    property DisplayRect;
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property HotTrack;
    property Images;
    property MultiLine;
    property MultiSelect;
    property OwnerDraw;
    property ParentBiDiMode;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RaggedRight;
    property ScrollOpposite;
    property ShowHint;
    property Style;
    property TabHeight;
    property TabOrder;
    property TabPosition;
    property Tabs;
    property TabIndex;  // must be after Tabs
    property TabStop;
    property TabWidth;
    property Touch;
    property Visible;
    property StyleElements;
    property OnChange;
    property OnChanging;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawTab;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetImageIndex;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

  TPageControl = class;

  TTabSheet = class(TWinControl)
  private
    FImageIndex: TImageIndex;
    FPageControl: TPageControl;
    FTabVisible: Boolean;
    FTabShowing: Boolean;
    FHighlighted: Boolean;
    FOnHide: TNotifyEvent;
    FOnShow: TNotifyEvent;
    function GetPageIndex: Integer;
    function GetTabIndex: Integer;
    procedure SetHighlighted(Value: Boolean);
    procedure SetImageIndex(Value: TImageIndex);
    procedure SetPageControl(APageControl: TPageControl);
    procedure SetPageIndex(Value: Integer);
    procedure SetTabShowing(Value: Boolean);
    procedure SetTabVisible(Value: Boolean);
    procedure UpdateTabShowing;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DoHide; dynamic;
    procedure DoShow; dynamic;
    procedure PaintWindow(DC: HDC); override;
    procedure ReadState(Reader: TReader); override;
    procedure UpdateControlOriginalParentSize(AControl: TControl; var AOriginalParentSize: TPoint); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property PageControl: TPageControl read FPageControl write SetPageControl;
    property TabIndex: Integer read GetTabIndex;
  published
    property BorderWidth;
    property Caption;
    property DoubleBuffered;
    property DragMode;
    property Enabled;
    property Font;
    property Height stored False;
    property Highlighted: Boolean read FHighlighted write SetHighlighted default False;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default 0;
    property Left stored False;
    property Constraints;
    property PageIndex: Integer read GetPageIndex write SetPageIndex stored False;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabVisible: Boolean read FTabVisible write SetTabVisible default True;
    property Top stored False;
    property Touch;
    property Visible stored False;
    property Width stored False;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnHide: TNotifyEvent read FOnHide write FOnHide;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
    property OnStartDrag;
  end;

  TPageControl = class(TCustomTabControl)
  private
    FPages: TList;
    FActivePage: TTabSheet;
    FNewDockSheet: TTabSheet;
    FUndockingPage: TTabSheet;
    FInSetActivePage: Boolean;
    procedure ChangeActivePage(Page: TTabSheet);
    procedure DeleteTab(Page: TTabSheet; Index: Integer);
    function GetActivePageIndex: Integer;
    function GetDockClientFromMousePos(MousePos: TPoint): TControl;
    function GetPage(Index: Integer): TTabSheet;
    function GetPageCount: Integer;
    procedure InsertPage(Page: TTabSheet);
    procedure InsertTab(Page: TTabSheet);
    procedure MoveTab(CurIndex, NewIndex: Integer);
    function PageIndexFromTabIndex(TabIndex: Integer): Integer;
    procedure RemovePage(Page: TTabSheet);
    procedure SetActivePageIndex(const Value: Integer);
    procedure UpdateTab(Page: TTabSheet);
    procedure UpdateTabHighlights;
    procedure CMDesignHitTest(var Message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMDockNotification(var Message: TCMDockNotification); message CM_DOCKNOTIFICATION;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMEraseBkGnd(var Message: TWMEraseBkGnd); message WM_ERASEBKGND;
{$IFNDEF CLR}
    procedure CMDockClient(var Message: TCMDockClient); message CM_DOCKCLIENT;
    procedure CMUnDockClient(var Message: TCMUnDockClient); message CM_UNDOCKCLIENT;
{$ENDIF}
  protected
    function CanShowTab(TabIndex: Integer): Boolean; override;
    procedure Change; override;
    procedure DoAddDockClient(Client: TControl; const ARect: TRect); override;
    procedure DockOver(Source: TDragDockObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean); override;
    procedure DoRemoveDockClient(Client: TControl); override;
    function GetImageIndex(TabIndex: Integer): Integer; override;
    function GetPageFromDockClient(Client: TControl): TTabSheet;
    procedure GetSiteInfo(Client: TControl; var InfluenceRect: TRect;
      MousePos: TPoint; var CanDock: Boolean); override;
    procedure Loaded; override;
    procedure SetActivePage(Page: TTabSheet);
    procedure SetChildOrder(Child: TComponent; Order: Integer); override;
    procedure SetTabIndex(Value: Integer); override;
    procedure ShowControl(AControl: TControl); override;
    procedure UpdateActivePage; virtual;
{$IFDEF CLR}
    function DockClient(DockSource: TDragDockObject; MousePos: TPoint): Integer; override;
    function UndockClient(NewTarget, Client: TControl): Boolean; override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FindNextPage(CurPage: TTabSheet;
      GoForward, CheckTabVisible: Boolean): TTabSheet;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure SelectNextPage(GoForward: Boolean; CheckTabVisible: Boolean = True);
    property ActivePageIndex: Integer read GetActivePageIndex
      write SetActivePageIndex;
    property PageCount: Integer read GetPageCount;
    property Pages[Index: Integer]: TTabSheet read GetPage;
  published
    property ActivePage: TTabSheet read FActivePage write SetActivePage;
    property Align;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property HotTrack;
    property Images;
    property MultiLine;
    property OwnerDraw;
    property ParentBiDiMode;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RaggedRight;
    property ScrollOpposite;
    property ShowHint;
    property Style;
    property TabHeight;
    property TabIndex stored False;
    property TabOrder;
    property TabPosition;
    property TabStop;
    property TabWidth;
    property Touch;
    property Visible;
    property StyleElements;
    property OnChange;
    property OnChanging;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawTab;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetImageIndex;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

{ TCustomStatusBar }

  TCustomStatusBar = class;
  TStatusPanel = class;
  TStatusPanels = class;
  TStatusPanelStyle = (psText, psOwnerDraw);
  TStatusPanelBevel = (pbNone, pbLowered, pbRaised);
  TStatusPanelClass = class of TStatusPanel;

  TStatusPanel = class(TCollectionItem)
  private
    FText: string;
    FWidth: Integer;
    FAlignment: TAlignment;
    FBevel: TStatusPanelBevel;
    FBiDiMode: TBiDiMode;
    FParentBiDiMode: Boolean;
    FStyle: TStatusPanelStyle;
    FUpdateNeeded: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetBevel(Value: TStatusPanelBevel);
    procedure SetBiDiMode(Value: TBiDiMode);
    procedure SetParentBiDiMode(Value: Boolean);
    procedure SetStyle(Value: TStatusPanelStyle);
    procedure SetText(const Value: string);
    procedure SetWidth(Value: Integer);
    function IsBiDiModeStored: Boolean;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    procedure ParentBiDiModeChanged;
    function UseRightToLeftAlignment: Boolean;
    function UseRightToLeftReading: Boolean;
  published
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property Bevel: TStatusPanelBevel read FBevel write SetBevel default pbLowered;
    property BiDiMode: TBiDiMode read FBiDiMode write SetBiDiMode stored IsBiDiModeStored;
    property ParentBiDiMode: Boolean read FParentBiDiMode write SetParentBiDiMode default True;
    property Style: TStatusPanelStyle read FStyle write SetStyle default psText;
    property Text: string read FText write SetText;
    property Width: Integer read FWidth write SetWidth;
  end;

  TStatusPanels = class(TCollection)
  private
    FStatusBar: TCustomStatusBar;
    function GetItem(Index: Integer): TStatusPanel;
    procedure SetItem(Index: Integer; Value: TStatusPanel);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(StatusBar: TCustomStatusBar);
    function Add: TStatusPanel;
    function AddItem(Item: TStatusPanel; Index: Integer): TStatusPanel;
    function Insert(Index: Integer): TStatusPanel;
    property Items[Index: Integer]: TStatusPanel read GetItem write SetItem; default;
  end;

  TCustomDrawPanelEvent = procedure(StatusBar: TCustomStatusBar; Panel: TStatusPanel;
    const Rect: TRect) of object;
  TSBCreatePanelClassEvent = procedure(Sender: TCustomStatusBar;
    var PanelClass: TStatusPanelClass) of object;

  TCustomStatusBar = class(TWinControl)
  private
    FPanels: TStatusPanels;
    FCanvas: TCanvas;
    FSimpleText: string;
    FSimplePanel: Boolean;
    FSizeGrip, FSizeGripValid: Boolean;
    FUseSystemFont: Boolean;
    FAutoHint: Boolean;
    FOnDrawPanel: TCustomDrawPanelEvent;
    FOnHint: TNotifyEvent;
    FOnCreatePanelClass: TSBCreatePanelClassEvent;
    FUpdatedPanels: Boolean;
    class constructor Create;
    class destructor Destroy;
    procedure DoRightToLeftAlignment(var Str: string; AAlignment: TAlignment;
      ARTLAlignment: Boolean);
    procedure SetPanels(Value: TStatusPanels);
    procedure SetSimplePanel(Value: Boolean);
    procedure UpdateSimpleText;
    procedure SetSimpleText(const Value: string);
    procedure SetSizeGrip(Value: Boolean);
    procedure SyncToSystemFont;
    procedure UpdatePanel(Index: Integer; Repaint: Boolean);
    procedure UpdatePanels(UpdateRects, UpdateText: Boolean);
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMParentFontChanged(var Message: TCMParentFontChanged); message CM_PARENTFONTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMWinIniChange(var Message: TWMWinIniChange); message CM_WININICHANGE;
    procedure CMSysFontChanged(var Message: TMessage); message CM_SYSFONTCHANGED;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure WMEraseBkGnd(var Message: TWMEraseBkGnd); message WM_ERASEBKGND;
    procedure WMGetTextLength(var Message: TWMGetTextLength); message WM_GETTEXTLENGTH;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure SetUseSystemFont(const Value: Boolean);
    procedure ValidateSizeGrip(ARecreate: Boolean);
  protected
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    function CreatePanel: TStatusPanel; virtual;
    function CreatePanels: TStatusPanels; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    function DoHint: Boolean; virtual;
    procedure DrawPanel(Panel: TStatusPanel; const Rect: TRect); dynamic;
    function GetPanelClass: TStatusPanelClass; virtual;
    function IsFontStored: Boolean;
    procedure SetParent(AParent: TWinControl); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    procedure FlipChildren(AllLevels: Boolean); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    property Canvas: TCanvas read FCanvas;
    property AutoHint: Boolean read FAutoHint write FAutoHint;
    property Panels: TStatusPanels read FPanels write SetPanels;
    property SimplePanel: Boolean read FSimplePanel write SetSimplePanel;
    property SimpleText: string read FSimpleText write SetSimpleText;
    property SizeGrip: Boolean read FSizeGrip write SetSizeGrip;
    property UseSystemFont: Boolean read FUseSystemFont write SetUseSystemFont;
    property OnCreatePanelClass: TSBCreatePanelClassEvent read FOnCreatePanelClass
      write FOnCreatePanelClass;
    property OnHint: TNotifyEvent read FOnHint write FOnHint;
    property OnDrawPanel: TCustomDrawPanelEvent read FOnDrawPanel write FOnDrawPanel;
  end;

{ TStatusBar }

  TStatusBar = class;

  TDrawPanelEvent = procedure(StatusBar: TStatusBar; Panel: TStatusPanel;
    const Rect: TRect) of object;

  TStatusBar = class(TCustomStatusBar)
  private
{$IFDEF CLR}
    FOnDrawPanel: TDrawPanelEvent;
    procedure OnCustomDrawPanel(StatusBar: TCustomStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
{$ENDIF}
    class constructor Create;
    class destructor Destroy;
    function GetOnDrawPanel: TDrawPanelEvent;
    procedure SetOnDrawPanel(const Value: TDrawPanelEvent);
  published
    property Action;
    property AutoHint default False;
    property Align default alBottom;
    property Anchors;
    property BiDiMode;
    property BorderWidth;
    property Color default clBtnFace;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font stored IsFontStored;
    property Constraints;
    property Panels;
    property ParentBiDiMode;
    property ParentColor default False;
    property ParentDoubleBuffered;
    property ParentFont default False;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property SimplePanel default False;
    property SimpleText;
    property SizeGrip default True;
    property Touch;
    property UseSystemFont default True;
    property Visible;
    property StyleElements;
    property OnClick;
    property OnContextPopup;
    property OnCreatePanelClass;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnGesture;
    property OnHint;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    // Required for backwards compatibility with the old event signature
    property OnDrawPanel: TDrawPanelEvent read GetOnDrawPanel write SetOnDrawPanel;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
  end;

{ Custom draw }

  TCustomDrawTarget = (dtControl, dtItem, dtSubItem);
  TCustomDrawStage = (cdPrePaint, cdPostPaint, cdPreErase, cdPostErase);
  TCustomDrawState = set of (cdsSelected, cdsGrayed, cdsDisabled, cdsChecked,
    cdsFocused, cdsDefault, cdsHot, cdsMarked, cdsIndeterminate,
    cdsShowKeyboardCues, cdsNearHot, cdsOtherSideHot, cdsDropHilited);

{ TCustomHeaderControl }

  TCustomHeaderControl = class;
  
{ THeaderControl }

  THeaderControl = class;
  THeaderSection = class;

  THeaderSectionStyle = (hsText, hsOwnerDraw);
  THeaderSectionClass = class of THeaderSection;

  THeaderSection = class(TCollectionItem)
  private
    FText: string;
    FWidth: Integer;
    FMinWidth: Integer;
    FMaxWidth: Integer;
    FAlignment: TAlignment;
    FStyle: THeaderSectionStyle;
    FAllowClick: Boolean;
    FAutoSize: Boolean;
    FImageIndex: TImageIndex;
    FBiDiMode: TBiDiMode;
    FParentBiDiMode: Boolean;
    FCheckBox: Boolean;
    FChecked: Boolean;
    FFixedWidth: Boolean;
    function GetLeft: Integer;
    function GetRight: Integer;
    function IsBiDiModeStored: Boolean;
    procedure SetAlignment(Value: TAlignment);
    procedure SetAutoSize(Value: Boolean);
    procedure SetBiDiMode(Value: TBiDiMode);
    procedure SetMaxWidth(Value: Integer);
    procedure SetMinWidth(Value: Integer);
    procedure SetParentBiDiMode(Value: Boolean);
    procedure SetStyle(Value: THeaderSectionStyle);
    procedure SetText(const Value: string);
    procedure SetWidth(Value: Integer);
    procedure SetImageIndex(const Value: TImageIndex);
    procedure SetCheckBox(Value: Boolean);
    procedure SetChecked(Value: Boolean);
    procedure SetFixedWidth(Value: Boolean);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
    procedure ParentBiDiModeChanged;
    function UseRightToLeftAlignment: Boolean;
    function UseRightToLeftReading: Boolean;
    property Left: Integer read GetLeft;
    property Right: Integer read GetRight;
  published
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property AllowClick: Boolean read FAllowClick write FAllowClick default True;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property BiDiMode: TBiDiMode read FBiDiMode write SetBiDiMode stored IsBiDiModeStored;
    property CheckBox: Boolean read FCheckBox write SetCheckBox default False;
    property Checked: Boolean read FChecked write SetChecked default False;
    property FixedWidth: Boolean read FFixedWidth write SetFixedWidth default False;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex;
    property MaxWidth: Integer read FMaxWidth write SetMaxWidth default 10000;
    property MinWidth: Integer read FMinWidth write SetMinWidth default 0;
    property ParentBiDiMode: Boolean read FParentBiDiMode write SetParentBiDiMode default True;
    property Style: THeaderSectionStyle read FStyle write SetStyle default hsText;
    property Text: string read FText write SetText;
    property Width: Integer read FWidth write SetWidth;
  end;

  THeaderSections = class(TCollection)
  private
    FHeaderControl: TCustomHeaderControl;
    function GetItem(Index: Integer): THeaderSection;
    procedure SetItem(Index: Integer; Value: THeaderSection);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(HeaderControl: TCustomHeaderControl);
    function Add: THeaderSection;
    function AddItem(Item: THeaderSection; Index: Integer): THeaderSection;
    function Insert(Index: Integer): THeaderSection;
    property Items[Index: Integer]: THeaderSection read GetItem write SetItem; default;
  end;

  TSectionTrackState = (tsTrackBegin, tsTrackMove, tsTrackEnd);

  TCustomDrawSectionEvent = procedure(HeaderControl: TCustomHeaderControl;
    Section: THeaderSection; const Rect: TRect; Pressed: Boolean) of object;
  TCustomSectionNotifyEvent = procedure(HeaderControl: TCustomHeaderControl;
    Section: THeaderSection) of object;
  TCustomSectionTrackEvent = procedure(HeaderControl: TCustomHeaderControl;
    Section: THeaderSection; Width: Integer;
    State: TSectionTrackState) of object;
  TSectionDragEvent = procedure (Sender: TObject; FromSection, ToSection: THeaderSection;
    var AllowDrag: Boolean) of object;
  TCustomHCCreateSectionClassEvent = procedure(Sender: TCustomHeaderControl;
    var SectionClass: THeaderSectionClass) of object;

  THeaderStyle = (hsButtons, hsFlat);

  TCustomHeaderControl = class(TWinControl)
  private
    FSections: THeaderSections;
    FSectionStream: TMemoryStream;
    FUpdatingSectionOrder,
    FSectionDragged: Boolean;
    FCanvas: TCanvas;
    FFromIndex,
    FToIndex: Integer;
    FFullDrag: Boolean;
    FHotTrack: Boolean;
    FDragReorder: Boolean;
    FImageChangeLink: TChangeLink;
    FImages: TCustomImageList;
    FStyle: THeaderStyle;
    FTrackSection: THeaderSection;
    FTrackWidth: Integer;
    FTrackPos: TPoint;
    FOnDrawSection: TCustomDrawSectionEvent;
    FOnSectionClick: TCustomSectionNotifyEvent;
    FOnSectionCheck: TCustomSectionNotifyEvent;
    FOnSectionResize: TCustomSectionNotifyEvent;
    FOnSectionTrack: TCustomSectionTrackEvent;
    FOnSectionDrag: TSectionDragEvent;
    FOnSectionEndDrag: TNotifyEvent;
    FOnCreateSectionClass: TCustomHCCreateSectionClassEvent;
    FCheckBoxes: Boolean;
    FNoSizing: Boolean;
    FOverflow: Boolean;
    class constructor Create;
    class destructor Destroy;
    function GetSectionFromIndex(Index: Integer): THeaderSection;
    function  DoSectionDrag(FromSection, ToSection: THeaderSection): Boolean;
    procedure DoSectionEndDrag;
    procedure ImageListChange(Sender: TObject);
    procedure SetDragReorder(const Value: Boolean);
    procedure SetFullDrag(Value: Boolean);
    procedure SetHotTrack(Value: Boolean);
    procedure SetSections(Value: THeaderSections);
    procedure SetStyle(Value: THeaderStyle);
    procedure SetCheckBoxes(Value: Boolean);
    procedure SetNoSizing(Value: Boolean);
    procedure SetOverflow(Value: Boolean);
    procedure UpdateItem(Message, Index: Integer);
    procedure UpdateSection(Index: Integer);
    procedure UpdateSections;
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CNNotify(var Message: TWMNotifyHC); message CN_NOTIFY;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
  protected
    function CreateSection: THeaderSection; virtual;
    function CreateSections: THeaderSections; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure DestroyWnd; override;
    procedure DrawSection(Section: THeaderSection; const Rect: TRect;
      Pressed: Boolean); dynamic;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SectionClick(Section: THeaderSection); dynamic;
    procedure SectionCheck(Section: THeaderSection); dynamic;
    procedure SectionDrag(FromSection, ToSection: THeaderSection; var AllowDrag: Boolean); dynamic;
    procedure SectionEndDrag; dynamic;
    procedure SectionResize(Section: THeaderSection); dynamic;
    procedure SectionTrack(Section: THeaderSection; Width: Integer;
      State: TSectionTrackState); dynamic;
    procedure SetImages(Value: TCustomImageList); virtual;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Canvas: TCanvas read FCanvas;
    procedure FlipChildren(AllLevels: Boolean); override;
  published
    property Align default alTop;
    property Anchors;
    property BiDiMode;
    property BorderWidth;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DragReorder: Boolean read FDragReorder write SetDragReorder default False;
    property FullDrag: Boolean read FFullDrag write SetFullDrag;
    property HotTrack: Boolean read FHotTrack write SetHotTrack;
    property Enabled;
    property Font;
    property Images: TCustomImageList read FImages write SetImages;
    property Constraints;
    property Sections: THeaderSections read FSections write SetSections;
    property Style: THeaderStyle read FStyle write SetStyle;
    property OnCreateSectionClass: TCustomHCCreateSectionClassEvent read FOnCreateSectionClass
      write FOnCreateSectionClass;
    property OnDrawSection: TCustomDrawSectionEvent read FOnDrawSection write FOnDrawSection;
    property OnSectionClick: TCustomSectionNotifyEvent read FOnSectionClick
      write FOnSectionClick;
    property OnSectionCheck: TCustomSectionNotifyEvent read FOnSectionCheck
      write FOnSectionCheck;
    property OnSectionDrag: TSectionDragEvent read FOnSectionDrag
      write FOnSectionDrag;
    property OnSectionEndDrag: TNotifyEvent read FOnSectionEndDrag
      write FOnSectionEndDrag;
    property OnSectionResize: TCustomSectionNotifyEvent read FOnSectionResize
      write FOnSectionResize;
    property OnSectionTrack: TCustomSectionTrackEvent read FOnSectionTrack
      write FOnSectionTrack;
    property CheckBoxes: Boolean read FCheckBoxes write SetCheckBoxes default false;
    property NoSizing: Boolean read FNoSizing write SetNoSizing default false;
    property OverFlow: Boolean read FOverFlow write SetOverFlow default false;
  end;

{ THeaderControl }

  TDrawSectionEvent = procedure(HeaderControl: THeaderControl;
    Section: THeaderSection; const Rect: TRect; Pressed: Boolean) of object;
  TSectionNotifyEvent = procedure(HeaderControl: THeaderControl;
    Section: THeaderSection) of object;
  TSectionTrackEvent = procedure(HeaderControl: THeaderControl;
    Section: THeaderSection; Width: Integer;
    State: TSectionTrackState) of object;
  THCCreateSectionClassEvent = procedure(Sender: THeaderControl;
    var SectionClass: THeaderSectionClass) of object;

  THeaderControl = class(TCustomHeaderControl)
  private
{$IFDEF CLR}
    FOnDrawSection: TDrawSectionEvent;
    FOnSectionClick: TSectionNotifyEvent;
    FOnSectionResize: TSectionNotifyEvent;
    FOnSectionTrack: TSectionTrackEvent;
    procedure OnCustomDrawSection(HeaderControl: TCustomHeaderControl;
      Section: THeaderSection; const Rect: TRect; Pressed: Boolean);
    procedure OnCustomSectionClick(HeaderControl: TCustomHeaderControl;
      Section: THeaderSection);
    procedure OnCustomSectionResize(HeaderControl: TCustomHeaderControl;
      Section: THeaderSection);
    procedure OnCustomSectionTrack(HeaderControl: TCustomHeaderControl;
      Section: THeaderSection; Width: Integer; State: TSectionTrackState);
{$ENDIF}
    class constructor Create;
    class destructor Destroy;
    function GetOnDrawSection: TDrawSectionEvent;
    function GetOnSectionClick: TSectionNotifyEvent;
    function GetOnSectionResize: TSectionNotifyEvent;
    function GetOnSectionTrack: TSectionTrackEvent;
    procedure SetOnDrawSection(const Value: TDrawSectionEvent);
    procedure SetOnSectionClick(const Value: TSectionNotifyEvent);
    procedure SetOnSectionResize(const Value: TSectionNotifyEvent);
    procedure SetOnSectionTrack(const Value: TSectionTrackEvent);
  published
    property Align default alTop;
    property Anchors;
    property BiDiMode;
    property BorderWidth;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DragReorder;
    property Enabled;
    property Font;
    property FullDrag default True;
    property HotTrack default False;
    property Images;
    property Constraints;
    property Sections;
    property ShowHint;
    property Style default hsButtons;
    property ParentBiDiMode;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Touch;
    property Visible;
    property StyleElements;
    property OnContextPopup;
    property OnCreateSectionClass;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnGesture;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    // Required for backwards compatibility with the old events
    property OnDrawSection: TDrawSectionEvent read GetOnDrawSection write SetOnDrawSection;
    property OnSectionClick: TSectionNotifyEvent read GetOnSectionClick
      write SetOnSectionClick;
    property OnSectionResize: TSectionNotifyEvent read GetOnSectionResize
      write SetOnSectionResize;
    property OnSectionTrack: TSectionTrackEvent read GetOnSectionTrack
      write SetOnSectionTrack;
    property OnSectionDrag;
    property OnSectionEndDrag;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TTreeNode }

  TCustomTreeView = class;
  TTreeNode = class;
  TTreeNodes = class;

  TNodeState = (nsCut, nsDropHilited, nsFocused, nsSelected, nsExpanded);
  TNodeAttachMode = (naAdd, naAddFirst, naAddChild, naAddChildFirst, naInsert);
  TAddMode = (taAddFirst, taAdd, taInsert);

{$IFNDEF CLR}
  PNodeInfo = ^TNodeInfo;
  TNodeInfo = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    Data: Integer;
    Count: Integer;
    Text: string[255];
  end;

{$ALIGN 1}
  TNodeDataInfo = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    Data: Pointer;
    Count: Integer;
    TextLen: Byte;
    // WideString Text of TextLen chars follows
  end;

  TNodeDataInfoX86 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    Data: Integer;
    Count: Integer;
    TextLen: Byte;
    // WideString Text of TextLen chars follows
  end;


  TNodeDataInfo2 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    ExpandedIndex: Integer;
    Data: Pointer;
    Count: Integer;
    Enabled: Byte;
    TextLen: Byte;
    // WideString Text of TextLen chars follows
  end;

  TNodeDataInfo2x86 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    ExpandedIndex: Integer;
    Data: Integer;
    Count: Integer;
    Enabled: Byte;
    TextLen: Byte;
    // WideString Text of TextLen chars follows
  end;

  TNodeDataInfo2x64 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    ExpandedIndex: Integer;
    Data: Int64;
    Count: Integer;
    Enabled: Byte;
    TextLen: Byte;
    // WideString Text of TextLen chars follows
  end;
{$ALIGN ON}
{$ENDIF}

{$IFDEF CLR}
{$ALIGN 1}
  TNodeInfo = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    Data: TObject;
    Count: Integer;
    TextLen: Byte;
    // String of data follows as TextLen number of bytes
  end;

  TNodeInfo2 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    ExpandedIndex: Integer;
    Data: TObject;
    Count: Integer;
    Enabled: Byte;
    TextLen: Byte;
    // String of data follows as TextLen number of bytes
  end;

  // TNodeInfo32 is equivalent in size to TNodeInfo on a 32-bit platform.
  // This record is used by 64-bit applications loading TTreeNodes created
  // by 32-bit applications, to avoid size errors caused by TNodeInfo.Data.
  TNodeInfo32 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    Data: Integer; { TObject }
    Count: Integer;
    TextLen: Byte;
    // String of data follows as TextLen number of bytes
  end;

  // TNodeInfo64 is equivalent in size to TNodeInfo on a 64-bit platform.
  // This record is used by 32-bit applications loading TTreeNodes created
  // by 64-bit applications, to avoid size errors caused by TNodeInfo.Data.
  TNodeInfo64 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    Data: Int64; { TObject }
    Count: Integer;
    TextLen: Byte;
    // String of data follows as TextLen number of bytes
  end;

  TNodeInfo232 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    ExpandedIndex: Integer;
    Data: Integer; { TObject }
    Count: Integer;
    Enabled: Byte;
    TextLen: Byte;
    // String of data follows as TextLen number of bytes
  end;

  TNodeInfo264 = record
    ImageIndex: Integer;
    SelectedIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    ExpandedIndex: Integer;
    Data: Int64; { TObject }
    Count: Integer;
    Enabled: Byte;
    TextLen: Byte;
    // String of data follows as TextLen number of bytes
  end;
{$ALIGN ON}

{$ENDIF}

  TNodeDataType = (ndtDefault, ndtDefault2, ndt32bit, ndt64bit, ndt232bit, ndt264bit);

  TTVItemStateEx = (tviDisabled, tviFlat);
  TTVItemStateExSet = set of TTVItemStateEx;

{$IFDEF CLR}
  /// CustomSort in .NET uses TTVCompareProc instead of TTVCompare
  TTVCompareProc = function(lParam1, lParam2: TTreeNode; lParamSort: TTag): Integer;
{$ENDIF}

  TTreeNodeClass = class of TTreeNode;
  TTreeNode = class(TPersistent)
  private
    FOwner: TTreeNodes;
    FText: string;
    FData: TCustomData;
    FItemId: HTreeItem;
    FImageIndex: TImageIndex;
    FSelectedIndex: Integer;
    FOverlayIndex: Integer;
    FStateIndex: Integer;
    FDeleting: Boolean;
    FInTree: Boolean;
    FEnabled: Boolean;
    FExpandedImageIndex: TImageIndex;
    function CompareCount(CompareMe: Integer): Boolean;
    function DoCanExpand(Expand: Boolean): Boolean;
    procedure DoExpand(Expand: Boolean);
    procedure ExpandItem(Expand: Boolean; Recurse: Boolean);
    function GetAbsoluteIndex: Integer;
    function GetExpanded: Boolean;
    function GetLevel: Integer;
    function GetParent: TTreeNode;
    function GetChildren: Boolean;
    function GetCut: Boolean;
    function GetDropTarget: Boolean;
    function GetFocused: Boolean;
    function GetIndex: Integer;
    function GetItem(Index: Integer): TTreeNode;
    function GetSelected: Boolean;
    function GetCount: Integer;
    function GetTreeView: TCustomTreeView;
    procedure InternalMove(ParentNode, Node: TTreeNode; HItem: HTreeItem;
      AddMode: TAddMode);
    function IsEqual(Node: TTreeNode): Boolean;
    function IsNodeVisible: Boolean;
    procedure SetData(Value: TCustomData);
    procedure SetChildren(Value: Boolean);
    procedure SetCut(Value: Boolean);
    procedure SetDropTarget(Value: Boolean);
    procedure SetItem(Index: Integer; Value: TTreeNode);
    procedure SetExpanded(Value: Boolean);
    procedure SetFocused(Value: Boolean);
    procedure SetImageIndex(Value: TImageIndex);
    procedure SetExpandedImageIndex(Value: TImageIndex);
    procedure SetOverlayIndex(Value: Integer);
    procedure SetSelectedIndex(Value: Integer);
    procedure SetSelected(Value: Boolean);
    procedure SetStateIndex(Value: Integer);
    procedure SetText(const S: string);
    procedure SetEnabled(Value: Boolean);
{$IFDEF CLR}
    procedure ReadData(Stream: TStream; Info: TNodeInfo32);
    procedure ReadNodeData(Stream: TStream; NodeDataType: TNodeDataType);
    procedure WriteNodeData(Stream: TStream);
{$ELSE}
    procedure ReadData(Stream: TStream; Info: PNodeInfo);
    procedure ReadNodeData(Stream: TStream; NodeDataType: TNodeDataType);
    procedure WriteNodeData(Stream: TStream);
{$ENDIF}
  protected
    function GetState(NodeState: TNodeState): Boolean;
    procedure SetState(NodeState: TNodeState; Value: Boolean);
    procedure SetSelectedBit(Value: Boolean);
  public
    constructor Create(AOwner: TTreeNodes); virtual;
    destructor Destroy; override;
    function AlphaSort(ARecurse: Boolean = False): Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure Collapse(Recurse: Boolean);
    procedure Delete;
    procedure DeleteChildren;
    function DisplayRect(TextOnly: Boolean): TRect;
    function EditText: Boolean;
    procedure EndEdit(Cancel: Boolean);
    procedure Expand(Recurse: Boolean);
    function getFirstChild: TTreeNode; {GetFirstChild conflicts with C++ macro}
    function GetHandle: HWND;
    function GetLastChild: TTreeNode;
    function GetNext: TTreeNode;
    function GetNextChild(Value: TTreeNode): TTreeNode;
    function getNextSibling: TTreeNode; {GetNextSibling conflicts with C++ macro}
    function GetNextVisible: TTreeNode;
    function GetPrev: TTreeNode;
    function GetPrevChild(Value: TTreeNode): TTreeNode;
    function getPrevSibling: TTreeNode; {GetPrevSibling conflicts with a C++ macro}
    function GetPrevVisible: TTreeNode;
    function HasAsParent(Value: TTreeNode): Boolean;
    function IndexOf(Value: TTreeNode): Integer;
    procedure MakeVisible;
    procedure MoveTo(Destination: TTreeNode; Mode: TNodeAttachMode); virtual;
    function IsFirstNode: Boolean;
{$IFDEF CLR}
    function CustomSort(SortProc: TTVCompareProc; Data: TTag; ARecurse: Boolean = False): Boolean;
{$ELSE}
    function CustomSort(SortProc: TTVCompare; Data: NativeInt; ARecurse: Boolean = False): Boolean;
{$ENDIF}
    property AbsoluteIndex: Integer read GetAbsoluteIndex;
    property Count: Integer read GetCount;
    property Cut: Boolean read GetCut write SetCut;
    property Data: TCustomData read FData write SetData;
    property Deleting: Boolean read FDeleting;
    property Focused: Boolean read GetFocused write SetFocused;
    property DropTarget: Boolean read GetDropTarget write SetDropTarget;
    property Selected: Boolean read GetSelected write SetSelected;
    property Expanded: Boolean read GetExpanded write SetExpanded;
    property ExpandedImageIndex: TImageIndex read FExpandedImageIndex write SetExpandedImageIndex;
    property Handle: HWND read GetHandle;
    property HasChildren: Boolean read GetChildren write SetChildren;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex;
    property Index: Integer read GetIndex;
    property IsVisible: Boolean read IsNodeVisible;
    property Item[Index: Integer]: TTreeNode read GetItem write SetItem; default;
    property ItemId: HTreeItem read FItemId;
    property Level: Integer read GetLevel;
    property OverlayIndex: Integer read FOverlayIndex write SetOverlayIndex;
    property Owner: TTreeNodes read FOwner;
    property Parent: TTreeNode read GetParent;
    property SelectedIndex: Integer read FSelectedIndex write SetSelectedIndex;
    property Enabled: Boolean read FEnabled write SetEnabled;
    property StateIndex: Integer read FStateIndex write SetStateIndex;
    property Text: string read FText write SetText;
    property TreeView: TCustomTreeView read GetTreeView;
  end;

{ TTreeNodesEnumerator }

  TTreeNodesEnumerator = class
  private
    FIndex: Integer;
    FTreeNodes: TTreeNodes;
  public
    constructor Create(ATreeNodes: TTreeNodes);
    function GetCurrent: TTreeNode;
    function MoveNext: Boolean;
    property Current: TTreeNode read GetCurrent;
  end;

{ TTreeNodes }

{$IFNDEF CLR}
  PNodeCache = ^TNodeCache;
{$ENDIF}
  TNodeCache = record
    CacheNode: TTreeNode;
    CacheIndex: Integer;
  end;

  TTreeNodes = class(TPersistent)
  private
    FOwner: TCustomTreeView;
    FUpdateCount: Integer;
    FNodeCache: TNodeCache;
    procedure AddedNode(Value: TTreeNode);
    function GetHandle: HWND;
    function GetNodeFromIndex(Index: Integer): TTreeNode;
    procedure ReadData(Stream: TStream);
    procedure ReadNodeData(Stream: TStream);
    procedure Repaint(Node: TTreeNode);
    procedure WriteNodeData(Stream: TStream);
    procedure ClearCache;
    procedure WriteExpandedState(Stream: TStream);
    procedure ReadExpandedState(Stream: TStream);
    function GetReading: Boolean;
  protected
{$IFDEF CLR}
    FNodeHashTable: HashTable;
{$ENDIF}
    function AddItem(Parent, Target: HTreeItem; const Item: TTVItem;
      AddMode: TAddMode): HTreeItem;
    procedure DefineProperties(Filer: TFiler); override;
    function CreateItem(Node: TTreeNode): TTVItem;
    function GetCount: Integer;
    procedure SetItem(Index: Integer; Value: TTreeNode);
    procedure SetUpdateState(Updating: Boolean);
    property Reading: Boolean read GetReading;
  public
    constructor Create(AOwner: TCustomTreeView);
    destructor Destroy; override;
    function AddChildFirst(Parent: TTreeNode; const S: string): TTreeNode;
    function AddChild(Parent: TTreeNode; const S: string): TTreeNode;
    function AddChildObjectFirst(Parent: TTreeNode; const S: string;
      Ptr: TCustomData): TTreeNode;
    function AddChildObject(Parent: TTreeNode; const S: string;
      Ptr: TCustomData): TTreeNode;
    function AddObjectFirst(Sibling: TTreeNode; const S: string;
      Ptr: TCustomData): TTreeNode;
    function AddObject(Sibling: TTreeNode; const S: string;
      Ptr: TCustomData): TTreeNode;
    function AddNode(Node, Relative: TTreeNode; const S: string;
      Ptr: TCustomData; Method: TNodeAttachMode): TTreeNode;
    function AddFirst(Sibling: TTreeNode; const S: string): TTreeNode;
    function Add(Sibling: TTreeNode; const S: string): TTreeNode;
    function AlphaSort(ARecurse: Boolean = False): Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate;
    procedure Clear;
    procedure Delete(Node: TTreeNode);
    procedure EndUpdate;
    function GetFirstNode: TTreeNode;
    function GetEnumerator: TTreeNodesEnumerator;
    function GetNode(ItemId: HTreeItem): TTreeNode;
    function Insert(Sibling: TTreeNode; const S: string): TTreeNode;
    function InsertObject(Sibling: TTreeNode; const S: string;
      Ptr: TCustomData): TTreeNode;
    function InsertNode(Node, Sibling: TTreeNode; const S: string;
      Ptr: TCustomData): TTreeNode;
{$IFDEF CLR}
    function CustomSort(SortProc: TTVCompareProc; Data: TTag; ARecurse: Boolean = False): Boolean;
{$ELSE}
    function CustomSort(SortProc: TTVCompare; Data: NativeInt; ARecurse: Boolean = False): Boolean;
{$ENDIF}
    property Count: Integer read GetCount;
    property Handle: HWND read GetHandle;
    property Item[Index: Integer]: TTreeNode read GetNodeFromIndex; default;
    property Owner: TCustomTreeView read FOwner;
  end;

{ TCustomTreeView }

  TSortType = (stNone, stData, stText, stBoth);
  TMultiSelectStyles = (msControlSelect, msShiftSelect,
                        msVisibleOnly, msSiblingOnly);
  TMultiSelectStyle = set of TMultiSelectStyles;
  ETreeViewError = class(Exception);

  TTVChangingEvent = procedure(Sender: TObject; Node: TTreeNode;
    var AllowChange: Boolean) of object;
  TTVChangedEvent = procedure(Sender: TObject; Node: TTreeNode) of object;
  TTVEditingEvent = procedure(Sender: TObject; Node: TTreeNode;
    var AllowEdit: Boolean) of object;
  TTVEditedEvent = procedure(Sender: TObject; Node: TTreeNode; var S: string) of object;
  TTVExpandingEvent = procedure(Sender: TObject; Node: TTreeNode;
    var AllowExpansion: Boolean) of object;
  TTVCollapsingEvent = procedure(Sender: TObject; Node: TTreeNode;
    var AllowCollapse: Boolean) of object;
  TTVExpandedEvent = procedure(Sender: TObject; Node: TTreeNode) of object;
{$IFDEF CLR}
  TTVCompareEvent = procedure(Sender: TObject; Node1, Node2: TTreeNode;
    Data: TTag; var Compare: Integer) of object;
{$ELSE}
  TTVCompareEvent = procedure(Sender: TObject; Node1, Node2: TTreeNode;
    Data: Integer; var Compare: Integer) of object;
{$ENDIF}
  TTVHintEvent = procedure(Sender: TObject; const Node: TTreeNode;
    var Hint: String) of object;
  TTVCustomDrawEvent = procedure(Sender: TCustomTreeView; const ARect: TRect;
    var DefaultDraw: Boolean) of object;
  TTVCustomDrawItemEvent = procedure(Sender: TCustomTreeView; Node: TTreeNode;
    State: TCustomDrawState; var DefaultDraw: Boolean) of object;
  TTVAdvancedCustomDrawEvent = procedure(Sender: TCustomTreeView; const ARect: TRect;
    Stage: TCustomDrawStage; var DefaultDraw: Boolean) of object;
  TTVAdvancedCustomDrawItemEvent = procedure(Sender: TCustomTreeView; Node: TTreeNode;
    State: TCustomDrawState; Stage: TCustomDrawStage; var PaintImages,
    DefaultDraw: Boolean) of object;
  TTVCreateNodeClassEvent = procedure(Sender: TCustomTreeView;
    var NodeClass: TTreeNodeClass) of object;

{$IFDEF CLR}
  TTVEditInstance = class
  private
    FHandle: TFNWndProc;
  strict protected
    procedure Finalize; override;
  public
    property Handle: TFNWndProc read FHandle write FHandle;
  end;
{$ELSE}
  TTVEditInstance = Pointer;
{$ENDIF}

  TCustomTreeView = class(TWinControl)
  private
    FAutoExpand: Boolean;
    FBorderStyle: TBorderStyle;
    FCanvas: TCanvas;
    FCanvasChanged: Boolean;
    FDefEditProc: TWindowProcPtr;
    FEditInstance: TTVEditInstance;
    FDragged: Boolean;
    FDragImage: TDragImageList;
    FDragNode: TTreeNode;
    FEditHandle: HWND;
    FHideSelection: Boolean;
    FHotTrack: Boolean;
    FImageChangeLink: TChangeLink;
    FImages: TCustomImageList;
    FInBufferedPrintClient: Boolean;
    FLastDropTarget: TTreeNode;
    FMemStream: TMemoryStream;
    FRClickNode: TTreeNode;
    FRightClickSelect: Boolean;
    FManualNotify: Boolean;
    FReadOnly: Boolean;
    FRowSelect: Boolean;
    FSaveIndex: Integer;
    FSaveIndent: Integer;
    FSaveItems: TStringList;
    FSaveTopIndex: Integer;
    FShowButtons: Boolean;
    FShowLines: Boolean;
    FShowRoot: Boolean;
    FSortType: TSortType;
    FStateChanging: Boolean;
    FStateImages: TCustomImageList;
    FStateChangeLink: TChangeLink;
    FToolTips: Boolean;
    FTreeNodes: TTreeNodes;
    FWideText: WideString;
    FMultiSelect: Boolean;
    FMultiSelectStyle: TMultiSelectStyle;
    FSelections: TList;
                                                             
    FSaveIndexes: TList;
    FShiftAnchor: TTreeNode;
    FSelecting, FSelectChanged: Boolean;
    FOurFont: Integer;
    FStockFont: Integer;
    FCreateWndRestores: Boolean;
    FReading: Boolean;
    FEncoding: TEncoding;
    FOnAdvancedCustomDraw: TTVAdvancedCustomDrawEvent;
    FOnAdvancedCustomDrawItem: TTVAdvancedCustomDrawItemEvent;
    FOnCancelEdit: TTVChangedEvent;
    FOnChange: TTVChangedEvent;
    FOnChanging: TTVChangingEvent;
    FOnCollapsed: TTVExpandedEvent;
    FOnCollapsing: TTVCollapsingEvent;
    FOnCompare: TTVCompareEvent;
    FOnCustomDraw: TTVCustomDrawEvent;
    FOnCustomDrawItem: TTVCustomDrawItemEvent;
    FOnDeletion: TTVExpandedEvent;
    FOnAddition: TTVExpandedEvent;
    FOnEditing: TTVEditingEvent;
    FOnEdited: TTVEditedEvent;
    FOnExpanded: TTVExpandedEvent;
    FOnExpanding: TTVExpandingEvent;
    FOnGetImageIndex: TTVExpandedEvent;
    FOnGetSelectedIndex: TTVExpandedEvent;
    FOnHint: TTVHintEvent;
    FOnCreateNodeClass: TTVCreateNodeClassEvent;
    class constructor Create;
    class destructor Destroy;
    procedure CanvasChanged(Sender: TObject);
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMDrag(var Message: TCMDrag); message CM_DRAG;
    procedure CNNotify(var Message: TWMNotifyTV); message CN_NOTIFY;
    procedure EditWndProc(var Message: TMessage);
    procedure DoDragOver(Source: TDragObject; X, Y: Integer; CanDrop: Boolean);
    procedure NodeDeselect(Index: Integer);
    procedure NodeSelect(Node: TTreeNode; At: Integer = 0);
    procedure FinishSelection(Node: TTreeNode; ShiftState: TShiftState);
    procedure ControlSelectNode(Node: TTreeNode);
    procedure ShiftSelectNode(Node: TTreeNode; Backward: Boolean; Deselect: Boolean = True);
    procedure ControlShiftSelectNode(Node: TTreeNode; Backward: Boolean);
    procedure SelectNode(Node: TTreeNode);
    function GetChangeDelay: Integer;
    function GetDropTarget: TTreeNode;
    function GetIndent: Integer;
    function GetNodeFromItem(const Item: TTVItem): TTreeNode;
    function GetSelected: TTreeNode;
    function GetSelectionCount: Cardinal;
    function GetSelection(Index: Integer): TTreeNode;
    function GetTopItem: TTreeNode;
    procedure ImageListChange(Sender: TObject);
    procedure SetAutoExpand(Value: Boolean);
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetButtonStyle(Value: Boolean);
    procedure SetChangeDelay(Value: Integer);
    procedure SetDropTarget(Value: TTreeNode);
    procedure SetHideSelection(Value: Boolean);
    procedure SetHotTrack(Value: Boolean);
    procedure SetImageList(Value: HImageList; Flags: Integer);
    procedure SetIndent(Value: Integer);
    procedure SetImages(Value: TCustomImageList);
    procedure SetLineStyle(Value: Boolean);
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetMultiSelectStyle(const Value: TMultiSelectStyle);
    procedure SetReadOnly(Value: Boolean);
    procedure SetRootStyle(Value: Boolean);
    procedure SetRowSelect(Value: Boolean);
    procedure SetSelected(Value: TTreeNode);
    procedure SetSortType(Value: TSortType);
    procedure SetStateImages(Value: TCustomImageList);
    procedure SetToolTips(Value: Boolean);
    procedure SetTreeNodes(Value: TTreeNodes);
    procedure SetTopItem(Value: TTreeNode);
    procedure OnChangeTimer(Sender: TObject);
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMNotify(var Message: TWMNotify); message WM_NOTIFY;
    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    procedure WMCtlColorEdit(var Message: TMessage); message WM_CTLCOLOREDIT;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
{$IFDEF CLR}
    function CustomTreeViewSort(ANode1, ANode2: Longint; lParam: Integer): Integer;
    function DefaultTreeViewSort(ANode1, ANode2: TTreeNode; lParam: TTag): Integer;
{$ENDIF}
  protected
    FChangeTimer: TTimer;
    function CanEdit(Node: TTreeNode): Boolean; dynamic;
    function CanChange(Node: TTreeNode): Boolean; dynamic;
    function CanCollapse(Node: TTreeNode): Boolean; dynamic;
    function CanExpand(Node: TTreeNode): Boolean; dynamic;
    procedure Change(Node: TTreeNode); dynamic;
    procedure Collapse(Node: TTreeNode); dynamic;
    function CreateNode: TTreeNode; virtual;
    function CreateNodes: TTreeNodes; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    function CustomDraw(const ARect: TRect; Stage: TCustomDrawStage): Boolean; virtual;
    function CustomDrawItem(Node: TTreeNode; State: TCustomDrawState;
      Stage: TCustomDrawStage; var PaintImages: Boolean): Boolean; virtual;
    procedure Delete(Node: TTreeNode); dynamic;
    procedure Added(Node: TTreeNode); dynamic;
    procedure DestroyWnd; override;
    procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
    procedure DoStartDrag(var DragObject: TDragObject); override;
    procedure Edit(const Item: TTVItem); dynamic;
    procedure Expand(Node: TTreeNode); dynamic;
    procedure GetImageIndex(Node: TTreeNode); virtual;
    procedure GetSelectedIndex(Node: TTreeNode); virtual;
    function IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean; virtual;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetDragMode(Value: TDragMode); override;
    procedure WndProc(var Message: TMessage); override;
    procedure ValidateSelection;
    procedure InvalidateSelectionsRects;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    /// <summary> Sets the stored directive for Touch properties. </summary>
    function IsTouchPropertyStored(AProperty: TTouchProperty): Boolean; override;
    /// <summary> Setter for the Encoding property. </summary>
    procedure SetEncoding(Value: TEncoding);
    property AutoExpand: Boolean read FAutoExpand write SetAutoExpand default False;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property ChangeDelay: Integer read GetChangeDelay write SetChangeDelay default 0;
    property CreateWndRestores: Boolean read FCreateWndRestores write FCreateWndRestores default True;
    /// <summary> Read-only property that contains the value of the encoding detected when the LoadFromStream or
    /// LoadFromFile methods are called. </summary>
    property Encoding: TEncoding read FEncoding;
    property HideSelection: Boolean read FHideSelection write SetHideSelection default True;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default False;
    property Images: TCustomImageList read FImages write SetImages;
    property Indent: Integer read GetIndent write SetIndent;
    property Items: TTreeNodes read FTreeNodes write SetTreeNodes;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property MultiSelectStyle: TMultiSelectStyle read FMultiSelectStyle write SetMultiSelectStyle default [msControlSelect];
    property Reading: Boolean read FReading;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
    property RightClickSelect: Boolean read FRightClickSelect write FRightClickSelect default False;
    property RowSelect: Boolean read FRowSelect write SetRowSelect default False;
    property ShowButtons: Boolean read FShowButtons write SetButtonStyle default True;
    property ShowLines: Boolean read FShowLines write SetLineStyle default True;
    property ShowRoot: Boolean read FShowRoot write SetRootStyle default True;
    property SortType: TSortType read FSortType write SetSortType default stNone;
    property StateImages: TCustomImageList read FStateImages write SetStateImages;
    property ToolTips: Boolean read FToolTips write SetToolTips default True;
    property OnAddition: TTVExpandedEvent read FOnAddition write FOnAddition;
    property OnAdvancedCustomDraw: TTVAdvancedCustomDrawEvent read FOnAdvancedCustomDraw write FOnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem: TTVAdvancedCustomDrawItemEvent read FOnAdvancedCustomDrawItem write FOnAdvancedCustomDrawItem;
    property OnCancelEdit: TTVChangedEvent read FOnCancelEdit write FOnCancelEdit;
    property OnChange: TTVChangedEvent read FOnChange write FOnChange;
    property OnChanging: TTVChangingEvent read FOnChanging write FOnChanging;
    property OnCollapsed: TTVExpandedEvent read FOnCollapsed write FOnCollapsed;
    property OnCollapsing: TTVCollapsingEvent read FOnCollapsing write FOnCollapsing;
    property OnCompare: TTVCompareEvent read FOnCompare write FOnCompare;
    property OnCustomDraw: TTVCustomDrawEvent read FOnCustomDraw write FOnCustomDraw;
    property OnCustomDrawItem: TTVCustomDrawItemEvent read FOnCustomDrawItem write FOnCustomDrawItem;
    property OnDeletion: TTVExpandedEvent read FOnDeletion write FOnDeletion;
    property OnEditing: TTVEditingEvent read FOnEditing write FOnEditing;
    property OnEdited: TTVEditedEvent read FOnEdited write FOnEdited;
    property OnExpanding: TTVExpandingEvent read FOnExpanding write FOnExpanding;
    property OnExpanded: TTVExpandedEvent read FOnExpanded write FOnExpanded;
    property OnGetImageIndex: TTVExpandedEvent read FOnGetImageIndex write FOnGetImageIndex;
    property OnGetSelectedIndex: TTVExpandedEvent read FOnGetSelectedIndex write FOnGetSelectedIndex;
    property OnHint: TTVHintEvent read FOnHint write FOnHint;
    property OnCreateNodeClass: TTVCreateNodeClassEvent read FOnCreateNodeClass write FOnCreateNodeClass;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function AlphaSort(ARecurse: Boolean = True): Boolean;
    procedure FullCollapse;
    procedure FullExpand;
    function GetHitTestInfoAt(X, Y: Integer): THitTests;
    function GetNodeAt(X, Y: Integer): TTreeNode;
    function GetDragImages: TDragImageList; override;
    function IsEditing: Boolean;
    procedure LoadFromFile(const FileName: string); overload;
    procedure LoadFromFile(const FileName: string; AEncoding: TEncoding); overload;
    procedure LoadFromStream(Stream: TStream); overload;
    procedure LoadFromStream(Stream: TStream; AEncoding: TEncoding); overload;
    procedure SaveToFile(const FileName: string); overload;
    procedure SaveToFile(const FileName: string; AEncoding: TEncoding); overload;
    procedure SaveToStream(Stream: TStream); overload;
    procedure SaveToStream(Stream: TStream; AEncoding: TEncoding); overload;
    procedure Select(Node: TTreeNode; ShiftState: TShiftState = []); overload; virtual;
    procedure Select(const Nodes: array of TTreeNode); overload; virtual;
    procedure Select(Nodes: TList); overload; virtual;
    procedure Deselect(Node: TTreeNode); virtual;
    procedure Subselect(Node: TTreeNode; Validate: Boolean = False); virtual;
    procedure ClearSelection(KeepPrimary: Boolean = False); virtual;
    function GetSelections(AList: TList): TTreeNode;
    function FindNextToSelect: TTreeNode; virtual;
{$IFDEF CLR}
    function CustomSort(SortProc: TTVCompareProc; Data: TTag; ARecurse: Boolean = True): Boolean;
{$ELSE}
    function CustomSort(SortProc: TTVCompare; Data: NativeInt; ARecurse: Boolean = True): Boolean;
{$ENDIF}
    property Canvas: TCanvas read FCanvas;
    property DropTarget: TTreeNode read GetDropTarget write SetDropTarget;
    property Selected: TTreeNode read GetSelected write SetSelected;
    property TopItem: TTreeNode read GetTopItem write SetTopItem;
    property SelectionCount: Cardinal read GetSelectionCount;
    property Selections[Index: Integer]: TTreeNode read GetSelection;
  end;

  TTreeView = class(TCustomTreeView)
  strict private
    class constructor Create;
    class destructor Destroy;
  published
    property Align;
    property Anchors;
    property AutoExpand;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind default bkNone;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property BorderWidth;
    property ChangeDelay;
    property Color;
    property Ctl3D;
    property Constraints;
    property DoubleBuffered;
    property DragKind;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property HotTrack;
    property Images;
    property Indent;
    property MultiSelect;
    property MultiSelectStyle;
    property ParentBiDiMode;
    property ParentColor default False;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property RightClickSelect;
    property RowSelect;
    property ShowButtons;
    property ShowHint;
    property ShowLines;
    property ShowRoot;
    property SortType;
    property StateImages;
    property TabOrder;
    property TabStop default True;
    property ToolTips;
    property Touch;
    property Visible;
    property StyleElements;
    property OnAddition;
    property OnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem;
    property OnCancelEdit;
    property OnChange;
    property OnChanging;
    property OnClick;
    property OnCollapsed;
    property OnCollapsing;
    property OnCompare;
    property OnContextPopup;
    property OnCreateNodeClass;
    property OnCustomDraw;
    property OnCustomDrawItem;
    property OnDblClick;
    property OnDeletion;
    property OnDragDrop;
    property OnDragOver;
    property OnEdited;
    property OnEditing;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnExpanding;
    property OnExpanded;
    property OnGesture;
    property OnGetImageIndex;
    property OnGetSelectedIndex;
    property OnHint;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    { Items must be published after OnGetImageIndex and OnGetSelectedIndex }
    property Items;
  end;

{ TTrackBar }

  TTrackBarOrientation = (trHorizontal, trVertical);
  TTickMark = (tmBottomRight, tmTopLeft, tmBoth);
  TTickStyle = (tsNone, tsAuto, tsManual);
  TPositionToolTip = (ptNone, ptTop, ptLeft, ptBottom, ptRight);

  TTrackBar = class(TWinControl)
  private
    FOrientation: TTrackBarOrientation;
    FTickMarks: TTickMark;
    FTickStyle: TTickStyle;
    FLineSize: Integer;
    FPageSize: Integer;
    FThumbLength: Integer;
    FSliderVisible: Boolean;
    FMin: Integer;
    FMax: Integer;
    FFrequency: Integer;
    FPosition: Integer;
    FPositionToolTip: TPositionToolTip;
    FSelStart: Integer;
    FSelEnd: Integer;
    FShowSelRange: Boolean;
    FOnChange: TNotifyEvent;
    class constructor Create;
    class destructor Destroy;
    function GetThumbLength: Integer;
    procedure SetOrientation(Value: TTrackBarOrientation);
    procedure SetParams(APosition, AMin, AMax: Integer);
    procedure SetPosition(Value: Integer);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetFrequency(Value: Integer);
    procedure SetTickStyle(Value: TTickStyle);
    procedure SetTickMarks(Value: TTickMark);
    procedure SetLineSize(Value: Integer);
    procedure SetPageSize(Value: Integer);
    procedure SetPositionToolTip(const Value: TPositionToolTip);
    procedure SetThumbLength(Value: Integer);
    procedure SetSliderVisible(Value: Boolean);
    procedure SetSelStart(Value: Integer);
    procedure SetSelEnd(Value: Integer);
    procedure SetShowSelRange(const Value: Boolean);
    procedure UpdateSelection;
    procedure CMGestureManagerChanged(var Message: TMessage); message CM_GESTUREMANAGERCHANGED;
    procedure CNHScroll(var Message: TWMHScroll); message CN_HSCROLL;
    procedure CNNotify(var Message: TWMNotifyTRB); message CN_NOTIFY;
    procedure CNVScroll(var Message: TWMVScroll); message CN_VSCROLL;
    procedure WMEraseBkGnd(var Message: TWMEraseBkGnd); message WM_ERASEBKGND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure Changed; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetTick(Value: Integer);
  published
    property Align;
    property Anchors;
    property BorderWidth;
    property Ctl3D;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Constraints;
    property LineSize: Integer read FLineSize write SetLineSize default 1;
    property Max: Integer read FMax write SetMax default 10;
    property Min: Integer read FMin write SetMin default 0;
    property Orientation: TTrackBarOrientation read FOrientation write SetOrientation default trHorizontal;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentShowHint;
    property PageSize: Integer read FPageSize write SetPageSize default 2;
    property PopupMenu;
    property Frequency: Integer read FFrequency write SetFrequency default 1;
    property Position: Integer read FPosition write SetPosition default 0;
    property PositionToolTip: TPositionToolTip read FPositionToolTip write SetPositionToolTip default ptNone;
    property SliderVisible: Boolean read FSliderVisible write SetSliderVisible default True;
    property SelEnd: Integer read FSelEnd write SetSelEnd default 0;
    property SelStart: Integer read FSelStart write SetSelStart default 0;
    property ShowHint;
    property ShowSelRange: Boolean read FShowSelRange write SetShowSelRange default True;
    property TabOrder;
    property TabStop default True;
    property ThumbLength: Integer read GetThumbLength write SetThumbLength default 20;
    property TickMarks: TTickMark read FTickMarks write SetTickMarks default tmBottomRight;
    property TickStyle: TTickStyle read FTickStyle write SetTickStyle default tsAuto;
    property Touch;
    property Visible;
    property StyleElements;
    property OnContextPopup;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TProgressBar }

  TProgressRange = Integer; // for backward compatibility

  TProgressBarOrientation = (pbHorizontal, pbVertical);

  TProgressBarStyle = (pbstNormal, pbstMarquee);

  TProgressBarState = (pbsNormal, pbsError, pbsPaused);

  TProgressBar = class(TWinControl)
  private
    F32BitMode: Boolean;
    FMin: Integer;
    FMax: Integer;
    FPosition: Integer;
    FSavedPosition: Integer;
    FStep: Integer;
    FOrientation: TProgressBarOrientation;
    FSmooth: Boolean;
    FSmoothReverse: Boolean;
    FMarqueeInterval: Integer;
    FStyle: TProgressBarStyle;
    FBarColor: TColor;
    FBackgroundColor: TColor;
    FState: TProgressBarState;
    class constructor Create;
    class destructor Destroy;
    function GetMin: Integer;
    function GetMax: Integer;
    function GetPosition: Integer;
    procedure SetParams(AMin, AMax: Integer);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetMarqueeInterval(Value: Integer);
    procedure SetPosition(Value: Integer);
    procedure SetStep(Value: Integer);
    procedure SetOrientation(Value: TProgressBarOrientation);
    procedure SetSmooth(Value: Boolean);
    procedure SetSmoothReverse(Value: Boolean);
    procedure SetStyle(Value: TProgressBarStyle);
    procedure SetBarColor(Value: TColor);
    procedure SetBackgroundColor(Value: TColor);
    procedure SetState(Value: TProgressBarState);
    procedure WMEraseBkGnd(var Message: TWmEraseBkgnd); Message WM_ERASEBKGND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure StepIt;
    procedure StepBy(Delta: Integer);
  published
    property Align;
    property Anchors;
    property BorderWidth;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Hint;
    property Constraints;
    property Min: Integer read GetMin write SetMin default 0;
    property Max: Integer read GetMax write SetMax default 100;
    property Orientation: TProgressBarOrientation read FOrientation
      write SetOrientation default pbHorizontal;
    property ParentDoubleBuffered;
    property ParentShowHint;
    property PopupMenu;
    property Position: Integer read GetPosition write SetPosition default 0;
    property Smooth: Boolean read FSmooth write SetSmooth default False;
    property Style: TProgressBarStyle read FStyle write SetStyle default pbstNormal;
    property MarqueeInterval: Integer read FMarqueeInterval write SetMarqueeInterval default 10;
    property BarColor: TColor read FBarColor write SetBarColor default clDefault;
    property BackgroundColor: TColor read FBackgroundColor write SetBackgroundColor default clDefault;
    property SmoothReverse: Boolean read FSmoothReverse write SetSmoothReverse default false;
    property Step: Integer read FStep write SetStep default 10;
    property State: TProgressBarState read FState write SetState default pbsNormal;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property Visible;
    property StyleElements;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TTextAttributes }

  TCustomRichEdit = class;

  TAttributeType = (atSelected, atDefaultText);
  TConsistentAttribute = (caBold, caColor, caFace, caItalic,
    caSize, caStrikeOut, caUnderline, caProtected);
  TConsistentAttributes = set of TConsistentAttribute;

  TTextAttributes = class(TPersistent)
  private
    RichEdit: TCustomRichEdit;
    FType: TAttributeType;
    procedure GetAttributes(var Format: TCharFormat2);
    function GetCharset: TFontCharset;
    function GetColor: TColor;
    function GetConsistentAttributes: TConsistentAttributes;
    function GetHeight: Integer;
    function GetName: TFontName;
    function GetPitch: TFontPitch;
    function GetProtected: Boolean;
    function GetSize: Integer;
    function GetStyle: TFontStyles;
    procedure SetAttributes(var Format: TCharFormat2);
    procedure SetCharset(Value: TFontCharset);
    procedure SetColor(Value: TColor);
    procedure SetHeight(Value: Integer);
    procedure SetName(Value: TFontName);
    procedure SetPitch(Value: TFontPitch);
    procedure SetProtected(Value: Boolean);
    procedure SetSize(Value: Integer);
    procedure SetStyle(Value: TFontStyles);
  protected
    procedure InitFormat(var Format: TCharFormat2);
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create(AOwner: TCustomRichEdit; AttributeType: TAttributeType);
    procedure Assign(Source: TPersistent); override;
    property Charset: TFontCharset read GetCharset write SetCharset;
    property Color: TColor read GetColor write SetColor;
    property ConsistentAttributes: TConsistentAttributes read GetConsistentAttributes;
    property Name: TFontName read GetName write SetName;
    property Pitch: TFontPitch read GetPitch write SetPitch;
    property Protected: Boolean read GetProtected write SetProtected;
    property Size: Integer read GetSize write SetSize;
    property Style: TFontStyles read GetStyle write SetStyle;
    property Height: Integer read GetHeight write SetHeight;
  end;

{ TParaAttributes }

  TNumberingStyle = (nsNone, nsBullet);

  TParaAttributes = class(TPersistent)
  private
    RichEdit: TCustomRichEdit;
    procedure GetAttributes(var Paragraph: TParaFormat2);
    function GetAlignment: TAlignment;
    function GetFirstIndent: Longint;
    function GetLeftIndent: Longint;
    function GetRightIndent: Longint;
    function GetNumbering: TNumberingStyle;
    function GetTab(Index: Byte): Longint;
    function GetTabCount: Integer;
    procedure InitPara(var Paragraph: TParaFormat2);
    procedure SetAlignment(Value: TAlignment);
    procedure SetAttributes(var Paragraph: TParaFormat2);
    procedure SetFirstIndent(Value: Longint);
    procedure SetLeftIndent(Value: Longint);
    procedure SetRightIndent(Value: Longint);
    procedure SetNumbering(Value: TNumberingStyle);
    procedure SetTab(Index: Byte; Value: Longint);
    procedure SetTabCount(Value: Integer);
  public
    constructor Create(AOwner: TCustomRichEdit);
    procedure Assign(Source: TPersistent); override;
    property Alignment: TAlignment read GetAlignment write SetAlignment;
    property FirstIndent: Longint read GetFirstIndent write SetFirstIndent;
    property LeftIndent: Longint read GetLeftIndent write SetLeftIndent;
    property Numbering: TNumberingStyle read GetNumbering write SetNumbering;
    property RightIndent: Longint read GetRightIndent write SetRightIndent;
    property Tab[Index: Byte]: Longint read GetTab write SetTab;
    property TabCount: Integer read GetTabCount write SetTabCount;
  end;

{ TCustomRichEdit }

  TRichEditResizeEvent = procedure(Sender: TObject; Rect: TRect) of object;
  TRichEditProtectChange = procedure(Sender: TObject;
    StartPos, EndPos: Integer; var AllowChange: Boolean) of object;
  TRichEditSaveClipboard = procedure(Sender: TObject;
    NumObjects, NumChars: Integer; var SaveClipboard: Boolean) of object;
  TSearchType = (stWholeWord, stMatchCase);
  TSearchTypes = set of TSearchType;

  TConversionBuffer = TBytes;

  TConversion = class(TObject)
  public
    constructor Create; virtual;
    function ConvertReadStream(Stream: TStream; Buffer: TConversionBuffer; BufSize: Integer): Integer; virtual;
    function ConvertWriteStream(Stream: TStream; Buffer: TConversionBuffer; BufSize: Integer): Integer; virtual;
  end;

  TConversionClass = class of TConversion;

{$IFNDEF CLR}
  PConversionFormat = ^TConversionFormat;
{$ENDIF}
  TConversionFormat = record
    ConversionClass: TConversionClass;
    Extension: string;
  end;

{$IFNDEF CLR}
  PRichEditStreamInfo = ^TRichEditStreamInfo;
{$ENDIF}
  TRichEditStreamInfo = record
    Converter: TConversion;
    Stream: TStream;
    PlainText: Boolean;
    Encoding: TEncoding;
  end;

  TCustomRichEdit = class(TCustomMemo)
  private
    FHideScrollBars: Boolean;
    FSelAttributes: TTextAttributes;
    FDefAttributes: TTextAttributes;
    FParagraph: TParaAttributes;
    FOldParaAlignment: TAlignment;
    FScreenLogPixels: Integer;
    FRichEditStrings: TStrings;
    FMemStream: TMemoryStream;
    FOnSelChange: TNotifyEvent;
    FHideSelection: Boolean;
    FModified: Boolean;
    FDefaultConverter: TConversionClass;
    FOnResizeRequest: TRichEditResizeEvent;
    FOnProtectChange: TRichEditProtectChange;
    FOnSaveClipboard: TRichEditSaveClipboard;
    FPageRect: TRect;
    FOldSelLength: Integer;
    FOldSelStart: Integer;
    FOldZoom: Integer;
    FZoom: Integer;
    class constructor Create;
    class destructor Destroy;
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNNotify(var Message: TWMNotifyRE); message CN_NOTIFY;
    function GetActiveLineNo: DWORD;
    function GetPlainText: Boolean;
    function ProtectChange(StartPos, EndPos: Integer): Boolean;
    function SaveClipboard(NumObj, NumChars: Integer): Boolean;
    procedure SetHideScrollBars(Value: Boolean);
    procedure SetHideSelection(Value: Boolean);
    procedure SetPlainText(Value: Boolean);
    procedure SetRichEditStrings(Value: TStrings);
    procedure SetDefAttributes(Value: TTextAttributes);
    procedure SetSelAttributes(Value: TTextAttributes);
    procedure SetZoom(const Value: Integer);
    procedure WMNCDestroy(var Message: TWMNCDestroy); message WM_NCDESTROY;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMSetFont(var Message: TWMSetFont); message WM_SETFONT;
    procedure WMRButtonUp(var Message: TWMRButtonUp); message WM_RBUTTONUP;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure RequestSize(const Rect: TRect); virtual;
    procedure SelectionChange; dynamic;
    procedure DoSetMaxLength(Value: Integer); override;
    function GetCaretPos: TPoint; override;
    procedure SetCaretPos(const Value: TPoint); override;
    function GetSelLength: Integer; override;
    function GetSelStart: Integer; override;
    function GetSelText: string; override;
    procedure SetSelLength(Value: Integer); override;
    procedure SetSelStart(Value: Integer); override;
    function DefaultScalingFlags: TScalingFlags; override;
    property HideSelection: Boolean read FHideSelection write SetHideSelection default True;
    property HideScrollBars: Boolean read FHideScrollBars
      write SetHideScrollBars default True;
    property Lines: TStrings read FRichEditStrings write SetRichEditStrings;
    property OnSaveClipboard: TRichEditSaveClipboard read FOnSaveClipboard
      write FOnSaveClipboard;
    property OnSelectionChange: TNotifyEvent read FOnSelChange write FOnSelChange;
    property OnProtectChange: TRichEditProtectChange read FOnProtectChange
      write FOnProtectChange;
    property OnResizeRequest: TRichEditResizeEvent read FOnResizeRequest
      write FOnResizeRequest;
    property PlainText: Boolean read GetPlainText write SetPlainText default False;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Clear; override;
    function FindText(const SearchStr: string;
      StartPos, Length: Integer; Options: TSearchTypes): Integer;
    procedure Print(const Caption: string); virtual;
    class procedure RegisterConversionFormat(const AExtension: string;
      AConversionClass: TConversionClass);
{$IFDEF CLR}
    function GetSelTextBuf(var Buffer: string; BufSize: Integer): Integer;
{$ELSE}
    function GetSelTextBuf(Buffer: PChar; BufSize: Integer): Integer; override;
{$ENDIF}
    property ActiveLineNo: DWORD read GetActiveLineNo;
    property DefaultConverter: TConversionClass
      read FDefaultConverter write FDefaultConverter;
    property DefAttributes: TTextAttributes read FDefAttributes write SetDefAttributes;
    property SelAttributes: TTextAttributes read FSelAttributes write SetSelAttributes;
    property PageRect: TRect read FPageRect write FPageRect;
    property Paragraph: TParaAttributes read FParagraph;
    property Zoom: Integer read FZoom write SetZoom;
  end;

  TRichEdit = class(TCustomRichEdit)
  strict private
    class constructor Create;
    class destructor Destroy;
  published
    property Align;
    property Alignment;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind default bkNone;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property BorderWidth;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property HideScrollBars;
    property ImeMode;
    property ImeName;
    property Constraints;
    property Lines;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PlainText;
    property PopupMenu;
    property ReadOnly;
    property ScrollBars;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Touch;
    property Visible;
    property WantTabs;
    property WantReturns;
    property WordWrap;
    property StyleElements;
    property Zoom;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnProtectChange;
    property OnResizeRequest;
    property OnSaveClipboard;
    property OnSelectionChange;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TUpDown }

  TUDAlignButton = (udLeft, udRight);
  TUDOrientation = (udHorizontal, udVertical);
  TUDBtnType = (btNext, btPrev);
  TUpDownDirection = (updNone, updUp, updDown);
  TUDClickEvent = procedure (Sender: TObject; Button: TUDBtnType) of object;
  TUDChangingEvent = procedure (Sender: TObject; var AllowChange: Boolean) of object;
  TUDChangingEventEx = procedure (Sender: TObject; var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection) of object;

  TCustomUpDown = class(TWinControl)
  private
    FArrowKeys: Boolean;
    FAssociate: TWinControl;
    FMin: Integer;
    FMax: Integer;
    FIncrement: Integer;
    FNewValue: Integer;
    FNewValueDelta: Integer;
    FPosition: Integer;
    FThousands: Boolean;
    FWrap: Boolean;
    FOnClick: TUDClickEvent;
    FAlignButton: TUDAlignButton;
    FOrientation: TUDOrientation;
    FOnChanging: TUDChangingEvent;
    FOnChangingEx: TUDChangingEventEx;
    class constructor Create;
    class destructor Destroy;
    procedure UndoAutoResizing(Value: TWinControl);
    procedure SetAssociate(Value: TWinControl);
    function GetPosition: Integer;
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetIncrement(Value: Integer);
    procedure SetPosition(Value: Integer);
    procedure SetAlignButton(Value: TUDAlignButton);
    procedure SetOrientation(Value: TUDOrientation);
    procedure SetArrowKeys(Value: Boolean);
    procedure SetThousands(Value: Boolean);
    procedure SetWrap(Value: Boolean);
    procedure CMAllChildrenFlipped(var Message: TMessage); message CM_ALLCHILDRENFLIPPED;
    procedure CNNotify(var Message: TWMNotifyUD); message CN_NOTIFY;
    procedure WMHScroll(var Message: TWMHScroll); message CN_HSCROLL;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMVScroll(var Message: TWMVScroll); message CN_VSCROLL;
  protected
    function DoCanChange(NewVal: Integer; Delta: Integer): Boolean;
    function CanChange: Boolean; dynamic;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Click(Button: TUDBtnType); reintroduce; dynamic;
    property AlignButton: TUDAlignButton read FAlignButton write SetAlignButton default udRight;
    property ArrowKeys: Boolean read FArrowKeys write SetArrowKeys default True;
    property Associate: TWinControl read FAssociate write SetAssociate;
    property Min: Integer read FMin write SetMin default 0;
    property Max: Integer read FMax write SetMax default 100;
    property Increment: Integer read FIncrement write SetIncrement default 1;
    property Orientation: TUDOrientation read FOrientation write SetOrientation default udVertical;
    property Position: Integer read GetPosition write SetPosition default 0;
    property Thousands: Boolean read FThousands write SetThousands default True;
    property Wrap: Boolean read FWrap write SetWrap default False;
    property OnChanging: TUDChangingEvent read FOnChanging write FOnChanging;
    property OnChangingEx: TUDChangingEventEx read FOnChangingEx write FOnChangingEx;
    property OnClick: TUDClickEvent read FOnClick write FOnClick;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TUpDown = class(TCustomUpDown)
  strict private
    class constructor Create;
    class destructor Destroy;
  published
    property AlignButton;
    property Anchors;
    property Associate;
    property ArrowKeys;
    property DoubleBuffered;
    property Enabled;
    property Hint;
    property Min;
    property Max;
    property Increment;
    property Constraints;
    property Orientation;
    property ParentDoubleBuffered;
    property ParentShowHint;
    property PopupMenu;
    property Position;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Thousands;
    property Visible;
    property Wrap;
    property StyleElements;
    property OnChanging;
    property OnChangingEx;
    property OnContextPopup;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
  end;

{ THotKey }

  THKModifier = (hkShift, hkCtrl, hkAlt, hkExt);
  THKModifiers = set of THKModifier;
  THKInvalidKey = (hcNone, hcShift, hcCtrl, hcAlt, hcShiftCtrl,
    hcShiftAlt, hcCtrlAlt, hcShiftCtrlAlt);
  THKInvalidKeys = set of THKInvalidKey;

  TCustomHotKey = class(TWinControl)
  private
    FAutoSize: Boolean;
    FModifiers: THKModifiers;
    FInvalidKeys: THKInvalidKeys;
    FHotKey: Word;
    FOnChange: TNotifyEvent;
    class constructor Create;
    class destructor Destroy;
    procedure AdjustHeight;
    procedure SetInvalidKeys(Value: THKInvalidKeys);
    procedure SetModifiers(Value: THKModifiers);
    procedure UpdateHeight;
    function GetHotKey: TShortCut;
    procedure SetHotKey(Value: TShortCut);
    procedure ShortCutToHotKey(Value: TShortCut);
    function HotKeyToShortCut(Value: Longint): TShortCut;
    procedure ReadBoolean(Stream: TStream);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure DefineProperties(Filer: TFiler); override;
    procedure SetAutoSize(Value: Boolean); override;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default True;
    property InvalidKeys: THKInvalidKeys read FInvalidKeys write SetInvalidKeys default [hcNone, hcShift];
    property Modifiers: THKModifiers read FModifiers write SetModifiers default [hkAlt];
    property HotKey: TShortCut read GetHotKey write SetHotKey default $0041; { Alt - A }
    property TabStop default True;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  THotKey = class(TCustomHotKey)
  strict private
    class constructor Create;
    class destructor Destroy;
  published
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Constraints;
    property Enabled;
    property Hint;
    property HotKey;
    property InvalidKeys;
    property Modifiers;
    property ParentBiDiMode;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property Visible;
    property StyleElements;
    property OnChange;
    property OnContextPopup;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
  end;

const
  ColumnHeaderWidth = LVSCW_AUTOSIZE_USEHEADER;
  ColumnTextWidth = LVSCW_AUTOSIZE;

type
  TListColumns = class;
  TListGroups = class;
  TListItem = class;
  TListItems = class;
  TCustomListView = class;
  TWidth = ColumnHeaderWidth..MaxInt;

  TListGroupState = (
    lgsNormal,
    lgsHidden,
    lgsCollapsed,
    lgsNoHeader,
    lgsCollapsible,
    lgsFocused,
    lgsSelected,
    lgsSubseted,
    lgsSubSetLinkFocused
  );

  TListGroupStateSet = set of TListGroupState;

  TListGroup = class(TCollectionItem)
  private
    FHeader: string;
    FFooter: string;
    FGroupID: Integer;
    FState: TListGroupStateSet;
    FHeaderAlign: TAlignment;
    FFooterAlign: TAlignment;
    FSubtitle: string;
    FDescriptionTop: string;
    FDescriptionBottom: string;
    FTitleImage: TImageIndex;
    procedure SetHeader(Value: string);
    procedure SetFooter(Value: string);
    procedure SetGroupID(Value: Integer);
    procedure SetState(Value: TListGroupStateSet);
    function GetState: TListGroupStateSet;
    procedure SetHeaderAlign(Value: TAlignment);
    procedure SetFooterAlign(Value: TAlignment);
    procedure SetSubtitle(Value: string);
    procedure SetTitleImage(Value: TImageIndex);
    procedure ReadDescriptionTop(Reader: TReader);
    procedure ReadDescriptionBottom(Reader: TReader);
    procedure IgnoreInt(Reader: TReader);
    procedure IgnoreString(Reader: TReader);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    function GetDisplayName: string; override;
    procedure SetIndex(Value: Integer); override;
  public

    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Header: string read FHeader write SetHeader;
    property Footer: string read FFooter write SetFooter;
    property GroupID: Integer read FGroupID write SetGroupID;
    property State: TListGroupStateSet read GetState write SetState;
    property HeaderAlign: TAlignment read FHeaderAlign write SetHeaderAlign;
    property FooterAlign: TAlignment read FFooterAlign write SetFooterAlign;
    property Subtitle: string read FSubtitle write SetSubtitle;

    property TitleImage: TImageIndex read FTitleImage write SetTitleImage;
  end;

  TListGroups = class(TCollection)
  private
    FOwner: TCustomListView;
    function GetItem(Index: Integer): TListGroup;
    procedure SetItem(Index: Integer; Value: TListGroup);
    procedure UpdateGroups;
    function GetNextGroupID: Integer;
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TCustomListView);
    function Add: TListGroup;
    function Owner: TCustomListView;
    property Items[Index: Integer]: TListGroup read GetItem write SetItem; default;
    property NextGroupID: Integer read GetNextGroupID;
  end;

  TListColumnClass = class of TListColumn;

  TListColumn = class(TCollectionItem)
  private
    FAlignment: TAlignment;
    FAutoSize: Boolean;
    FCaption: string;
    FMaxWidth: TWidth;
    FMinWidth: TWidth;
    FImageIndex: TImageIndex;
    FPrivateWidth: TWidth;
    FWidth: TWidth;
    FOrderTag,
    FTag: Integer;
    procedure DoChange;
    function GetWidth: TWidth;
    function IsWidthStored: Boolean;
    procedure ReadData(Reader: TReader);
    procedure SetAlignment(Value: TAlignment);
    procedure SetAutoSize(Value: Boolean);
    procedure SetCaption(const Value: string);
    procedure SetImageIndex(Value: TImageIndex);
    procedure SetMaxWidth(Value: TWidth);
    procedure SetMinWidth(Value: TWidth);
    procedure SetWidth(Value: TWidth);
    procedure WriteData(Writer: TWriter);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    function GetDisplayName: string; override;
    procedure SetIndex(Value: Integer); override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property WidthType: TWidth read FWidth;
  published
    property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property Caption: string read FCaption write SetCaption;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex default -1;
    property MaxWidth: TWidth read FMaxWidth write SetMaxWidth default 0;
    property MinWidth: TWidth read FMinWidth write SetMinWidth default 0;
    property Tag: Integer read FTag write FTag default 0;
    property Width: TWidth read GetWidth write SetWidth stored IsWidthStored default 50;
  end;

  TListColumnsClass = class of TListColumns;

  TListColumns = class(TCollection)
  private
    FOwner: TCustomListView;
    function GetItem(Index: Integer): TListColumn;
    procedure SetItem(Index: Integer; Value: TListColumn);
    procedure UpdateCols;
  protected
    function GetListColumnClass: TListColumnClass; virtual;
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TCustomListView);
    function Add: TListColumn;
    function Owner: TCustomListView;
    property Items[Index: Integer]: TListColumn read GetItem write SetItem; default;
  end;

  TDisplayCode = (drBounds, drIcon, drLabel, drSelectBounds);

  { TListItem }

  TListItemClass = class of TListItem;
  TListItem = class(TPersistent)
  private
    FOwner: TListItems;
    FSubItems: TStrings;
    FImageIndex: TImageIndex;
    FIndent: Integer;
    FIndex: Integer;
    FOverlayIndex: TImageIndex;
    FStateIndex: TImageIndex;
    FCaption: string;
    FDeleting: Boolean;
    FProcessedDeleting: Boolean;
    FChecked: Boolean;
    FData: TCustomData;
    FGroupID: Integer;
    function GetChecked: Boolean;
    function GetHandle: HWND;
    function GetIndex: Integer;
    function GetListView: TCustomListView;
    function GetLeft: Integer;
    function GetState(Index: Integer): Boolean;
    function GetTop: Integer;
    function IsEqual(Item: TListItem): Boolean;
    procedure SetChecked(Value: Boolean);
    procedure SetCaption(const Value: string);
    procedure SetData(Value: TCustomData);
    procedure SetImage(Index: Integer; Value: TImageIndex);
    procedure SetIndent(Value: Integer);
    procedure SetLeft(Value: Integer);
    procedure SetState(Index: Integer; State: Boolean);
    procedure SetSubItems(Value: TStrings);
    procedure SetTop(Value: Integer);
    function GetSubItemImage(Index: Integer): Integer;
    procedure SetSubItemImage(Index: Integer; const Value: Integer);
    procedure SetGroupID(Value: Integer);
  public
    constructor Create(AOwner: TListItems); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure CancelEdit;
    procedure Delete;
    function DisplayRect(Code: TDisplayCode): TRect;
    function EditCaption: Boolean;
    function GetPosition: TPoint;
    procedure MakeVisible(PartialOK: Boolean);
    procedure Update;
    procedure SetPosition(const Value: TPoint);
    function WorkArea: Integer;
    property Caption: string read FCaption write SetCaption;
    property Checked: Boolean read GetChecked write SetChecked;
    property Cut: Boolean index 0 read GetState write SetState;
    property Data: TCustomData read FData write SetData;
    property Deleting: Boolean read FDeleting;
    property DropTarget: Boolean index 1 read GetState write SetState;
    property Focused: Boolean index 2 read GetState write SetState;
    property GroupID: Integer read FGroupID write SetGroupID default -1;
    property Handle: HWND read GetHandle;
    property ImageIndex: TImageIndex index 0 read FImageIndex write SetImage;
    property Indent: Integer read FIndent write SetIndent default 0;
    property Index: Integer read GetIndex;
    property Left: Integer read GetLeft write SetLeft;
    property ListView: TCustomListView read GetListView;
    property Owner: TListItems read FOwner;
    property OverlayIndex: TImageIndex index 1 read FOverlayIndex write SetImage;
    property Position: TPoint read GetPosition write SetPosition;
    property Selected: Boolean index 3 read GetState write SetState;
    property StateIndex: TImageIndex index 2 read FStateIndex write SetImage;
    property SubItems: TStrings read FSubItems write SetSubItems;
    property SubItemImages[Index: Integer]: Integer read GetSubItemImage write SetSubItemImage;
    property Top: Integer read GetTop write SetTop;
  end;

{ TListItemsEnumerator }

  TListItemsEnumerator = class
  private
    FIndex: Integer;
    FListItems: TListItems;
  public
    constructor Create(AListItems: TListItems);
    function GetCurrent: TListItem;
    function MoveNext: Boolean;
    property Current: TListItem read GetCurrent;
  end;

{ TListItems }

  TListItems = class(TPersistent)
  private
    FOwner: TCustomListView;
    FUpdateCount: Integer;
    FNoRedraw: Boolean;
    procedure ReadData(Stream: TStream);
    procedure ReadItemData(Stream: TStream);
    procedure WriteItemData(Stream: TStream);
  protected
{$IFDEF CLR}
    FItemHashTable: HashTable;
{$ENDIF}
    procedure DefineProperties(Filer: TFiler); override;
    function CreateItem(Index: Integer; ListItem: TListItem): TLVItem;
    function GetCount: Integer;
    function GetHandle: HWND;
    function GetItem(Index: Integer): TListItem;
    procedure SetCount(Value: Integer);
    procedure SetItem(Index: Integer; Value: TListItem);
    procedure SetUpdateState(Updating: Boolean);
  public
    constructor Create(AOwner: TCustomListView);
    destructor Destroy; override;
    function Add: TListItem;
    function AddItem(Item: TListItem; Index: Integer = -1): TListItem;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure EndUpdate;
    function GetEnumerator: TListItemsEnumerator;
    function IndexOf(Value: TListItem): Integer;
    function Insert(Index: Integer): TListItem;
    property Count: Integer read GetCount write SetCount;
    property Handle: HWND read GetHandle;
    property Item[Index: Integer]: TListItem read GetItem write SetItem; default;
    property Owner: TCustomListView read FOwner;
  end;

{ TWorkArea }

  TWorkArea = class(TCollectionItem)
  private
    FRect: TRect;
    FDisplayName: string;
    FColor: TColor;
    procedure SetRect(const Value: TRect);
    procedure SetColor(const Value: TColor);
  public
    constructor Create(Collection: TCollection); override;
    procedure SetDisplayName(const Value: string); override;
    function  GetDisplayName: string; override;
    property Rect: TRect read FRect write SetRect;
    property Color: TColor read FColor write SetColor;
  end;

{ TWorkAreas }

  TWorkAreas = class(TOwnedCollection)
  private
    function  GetItem(Index: Integer): TWorkArea;
    procedure SetItem(Index: Integer; const Value: TWorkArea);
  protected
    procedure Changed;
    procedure Update(Item: TCollectionItem); override;
  public
    function  Add: TWorkArea;
    procedure Delete(Index: Integer);
    function  Insert(Index: Integer): TWorkArea;
    property  Items[Index: Integer]: TWorkArea read GetItem write SetItem; default;
  end;

{ TIconOptions }

  TIconArrangement = (iaTop, iaLeft);

  TIconOptions = class(TPersistent)
  private
    FListView: TCustomListView;
    FArrangement: TIconArrangement;
    FAutoArrange: Boolean;
    FWrapText: Boolean;
    procedure SetArrangement(Value: TIconArrangement);
    procedure SetAutoArrange(Value: Boolean);
    procedure SetWrapText(Value: Boolean);
  public
    constructor Create(AOwner: TCustomListView);
  published
    property Arrangement: TIconArrangement read FArrangement write SetArrangement default iaTop;
    property AutoArrange: Boolean read FAutoArrange write SetAutoArrange default False;
    property WrapText: Boolean read FWrapText write SetWrapText default True;
  end;

  TOwnerDrawState = Winapi.Windows.TOwnerDrawState;

  (*$NODEFINE TOwnerDrawState*)

  TListArrangement = (arAlignBottom, arAlignLeft, arAlignRight,
    arAlignTop, arDefault, arSnapToGrid);
  TViewStyle = (vsIcon, vsSmallIcon, vsList, vsReport);
  TItemState = (isNone, isCut, isDropHilited, isFocused, isSelected, isActivating);
  TItemStates = set of TItemState;
  TItemChange = (ctText, ctImage, ctState);
  TItemFind = (ifData, ifPartialString, ifExactString, ifNearest);
  TSearchDirection = (sdLeft, sdRight, sdAbove, sdBelow, sdAll);
  TListHotTrackStyle = (htHandPoint, htUnderlineCold, htUnderlineHot);
  TListHotTrackStyles = set of TListHotTrackStyle;
  TItemRequests = (irText, irImage, irParam, irState, irIndent);
  TItemRequest = set of TItemRequests;

  TLVDeletedEvent = procedure(Sender: TObject; Item: TListItem) of object;
  TLVEditingEvent = procedure(Sender: TObject; Item: TListItem;
    var AllowEdit: Boolean) of object;
  TLVEditedEvent = procedure(Sender: TObject; Item: TListItem; var S: string) of object;
  TLVChangeEvent = procedure(Sender: TObject; Item: TListItem;
    Change: TItemChange) of object;
  TLVChangingEvent = procedure(Sender: TObject; Item: TListItem;
    Change: TItemChange; var AllowChange: Boolean) of object;
  TLVColumnClickEvent = procedure(Sender: TObject; Column: TListColumn) of object;
  TLVColumnRClickEvent = procedure(Sender: TObject; Column: TListColumn;
    Point: TPoint) of object;
{$IFDEF CLR}
  TLVCompareEvent = procedure(Sender: TObject; Item1, Item2: TListItem;
    Data: TTag; var Compare: Integer) of object;
{$ELSE}
  TLVCompareEvent = procedure(Sender: TObject; Item1, Item2: TListItem;
    Data: Integer; var Compare: Integer) of object;
{$ENDIF}
  TLVNotifyEvent = procedure(Sender: TObject; Item: TListItem) of object;
  TLVSelectItemEvent = procedure(Sender: TObject; Item: TListItem;
    Selected: Boolean) of object;
  TLVCheckedItemEvent = procedure(Sender: TObject; Item: TListItem) of object;
  TLVDrawItemEvent = procedure(Sender: TCustomListView; Item: TListItem;
    Rect: TRect; State: TOwnerDrawState) of object;
  TLVCustomDrawEvent = procedure(Sender: TCustomListView; const ARect: TRect;
    var DefaultDraw: Boolean) of object;
  TLVCustomDrawItemEvent = procedure(Sender: TCustomListView; Item: TListItem;
    State: TCustomDrawState; var DefaultDraw: Boolean) of object;
  TLVCustomDrawSubItemEvent = procedure(Sender: TCustomListView; Item: TListItem;
    SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean) of object;
  TLVAdvancedCustomDrawEvent = procedure(Sender: TCustomListView; const ARect: TRect;
    Stage: TCustomDrawStage; var DefaultDraw: Boolean) of object;
  TLVAdvancedCustomDrawItemEvent = procedure(Sender: TCustomListView; Item: TListItem;
    State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean) of object;
  TLVAdvancedCustomDrawSubItemEvent = procedure(Sender: TCustomListView; Item: TListItem;
    SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage;
    var DefaultDraw: Boolean) of object;
  TLVOwnerDataEvent = procedure(Sender: TObject; Item: TListItem) of object;
  TLVOwnerDataFindEvent = procedure(Sender: TObject; Find: TItemFind;
    const FindString: string; const FindPosition: TPoint; FindData: TCustomData;
    StartIndex: Integer; Direction: TSearchDirection; Wrap: Boolean;
    var Index: Integer) of object;
  TLVOwnerDataHintEvent = procedure(Sender: TObject; StartIndex, EndIndex: Integer) of object;
  TLVOwnerDataStateChangeEvent = procedure(Sender: TObject; StartIndex,
    EndIndex: Integer; OldState, NewState: TItemStates) of object;
  TLVSubItemImageEvent = procedure(Sender: TObject; Item: TListItem; SubItem: Integer;
    var ImageIndex: Integer) of object;
  TLVInfoTipEvent = procedure(Sender: TObject; Item: TListItem; var InfoTip: string) of object;
  TLVCreateItemClassEvent = procedure(Sender: TCustomListView; var ItemClass: TListItemClass) of object;

{$IFDEF CLR}
/// CustomSort now uses TLVCompareProc instead of TLVCompare
  TLVCompareProc = function(lParam1, lParam2: TListItem; lParamSort: TTag): Integer;

  TLVInstances = class
  private
    FEditInstance: TFNWndProc;
    FHeaderInstance: TFNWndProc;
  strict protected
    procedure Finalize; override;
  public
    property EditInstance: TFNWndProc read FEditInstance write FEditInstance;
    property HeaderInstance: TFNWndProc read FHeaderInstance write FHeaderInstance;
  end;
{$ENDIF}

{ TCustomListView }

  TCustomListView = class(TCustomMultiSelectListControl)
  private
    FCanvas: TCanvas;
    FBorderStyle: TBorderStyle;
    FViewStyle: TViewStyle;
    FReadOnly: Boolean;
    FLargeImages: TCustomImageList;
    FSaveSelectedIndex: Integer;
    FSmallImages: TCustomImageList;
    FStateImages: TCustomImageList;
    FGroupHeaderImages: TCustomImageList;
    FDragImage: TDragImageList;
    FMultiSelect: Boolean;
    FSortType: TSortType;
    FColumnClick: Boolean;
    FShowColumnHeaders: Boolean;
    FListItems: TListItems;
    FClicked: Boolean;
    FRClicked: Boolean;
    FIconOptions: TIconOptions;
    FHideSelection: Boolean;
    FListColumns: TListColumns;
    FMemStream: TMemoryStream;
    FOwnerData: Boolean;
    FOwnerDraw: Boolean;
    FColStream: TMemoryStream;
    FCheckStream: TMemoryStream;
    FDefEditProc: TWindowProcPtr;
    FDefHeaderProc: TWindowProcPtr;
    FEditHandle: HWND;
    FHeaderHandle: HWND;
    FAllocBy: Integer;
    FDragIndex: Integer;
    FLastDropTarget: TListItem;
    FCheckboxes: Boolean;
    FFlatScrollBars: Boolean;
    FFullDrag: Boolean;
    FGridLines: Boolean;
    FHotTrack: Boolean;
    FHotTrackStyles: TListHotTrackStyles;
    FRowSelect: Boolean;
    FHoverTime: Integer;
    FLargeChangeLink: TChangeLink;
    FSmallChangeLink: TChangeLink;
    FHeaderChangeLink: TChangeLink;
    FStateChangeLink: TChangeLink;
    FSavedSort: TSortType;
    FReading: Boolean;
    FCanvasChanged: Boolean;
    FTempItem: TListItem;
    FWorkAreas: TWorkAreas;
    FShowWorkAreas: Boolean;
    FUpdatingColumnOrder: Boolean;
    FOurFont: Integer;
    FStockFont: Integer;
    FInBufferedPrintClient: Boolean;
    FOwnerDataCount: Integer;
    FPanPoint: TPoint;
    FOnAdvancedCustomDraw: TLVAdvancedCustomDrawEvent;
    FOnAdvancedCustomDrawItem: TLVAdvancedCustomDrawItemEvent;
    FOnAdvancedCustomDrawSubItem: TLVAdvancedCustomDrawSubItemEvent;
    FOnChange: TLVChangeEvent;
    FOnChanging: TLVChangingEvent;
    FOnColumnClick: TLVColumnClickEvent;
    FOnColumnDragged: TNotifyEvent;
    FOnColumnRightClick: TLVColumnRClickEvent;
    FOnCompare: TLVCompareEvent;
    FOnCustomDraw: TLVCustomDrawEvent;
    FOnCustomDrawItem: TLVCustomDrawItemEvent;
    FOnCustomDrawSubItem: TLVCustomDrawSubItemEvent;
    FOnData: TLVOwnerDataEvent;
    FOnDataFind: TLVOwnerDataFindEvent;
    FOnDataHint: TLVOwnerDataHintEvent;
    FOnDataStateChange: TLVOwnerDataStateChangeEvent;
    FOnDeletion: TLVDeletedEvent;
    FOnDrawItem: TLVDrawItemEvent;
    FOnEdited: TLVEditedEvent;
    FOnEditing: TLVEditingEvent;
    FOnGetImageIndex: TLVNotifyEvent;
    FOnGetSubItemImage: TLVSubItemImageEvent;
    FOnInfoTip: TLVInfoTipEvent;
    FOnInsert: TLVDeletedEvent;
    FOnSelectItem: TLVSelectItemEvent;
    FOnItemChecked: TLVCheckedItemEvent;
    FOnCreateItemClass: TLVCreateItemClassEvent;
    FListGroups: TListGroups;
    FGroupView: Boolean;
{$IFDEF CLR}
    FLVInstances: TLVInstances;
{$ELSE}
    FEditInstance: Pointer;
    FHeaderInstance: Pointer;
{$ENDIF}
    FSavedIndents: array of Integer;
    FDeletingAllItems: Boolean;
    class constructor Create;
    class destructor Destroy;
    procedure SaveIndents;
    procedure RestoreIndents;
    function AreItemsStored: Boolean;
    procedure CanvasChanged(Sender: TObject);
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMDrag(var Message: TCMDrag); message CM_DRAG;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNNotify(var Message: TWMNotifyLV); message CN_NOTIFY;
    procedure DoAutoSize;
    procedure DoDragOver(Source: TDragObject; X, Y: Integer; CanDrop: Boolean);
    procedure DrawWorkAreas;
    procedure EditWndProc(var Message: TMessage);
    function GetBoundingRect: TRect;
    function GetColumnFromIndex(Index: Integer): TListColumn;
    function GetColumnFromTag(Tag: Integer): TListColumn;
    function GetDropTarget: TListItem;
    function GetFocused: TListItem;
    procedure GetImageIndex(Item: TListItem);
    procedure GetSubItemImage(Item: TListItem; SubItem: Integer; var ImageIndex: Integer);
    function GetItem(Value: TLVItem): TListItem;
    function GetSelected: TListItem;
    function GetTopItem: TListItem;
    function GetViewOrigin: TPoint;
    function GetVisibleRowCount: Integer;
    function GetHoverTime: Integer;
    procedure HeaderWndProc(var Message: TMessage);
    procedure ImageListChange(Sender: TObject);
    procedure RestoreChecks;
    procedure SaveChecks;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetColumnClick(Value: Boolean);
    procedure SetColumnHeaders(Value: Boolean);
    procedure SetDropTarget(Value: TListItem);
    procedure SetFocused(Value: TListItem);
    procedure SetHideSelection(Value: Boolean);
    procedure SetIconOptions(Value: TIconOptions);
    procedure SetImageList(Value: HImageList; Flags: Integer);
    procedure SetLargeImages(Value: TCustomImageList);
    procedure SetGroupHeaderImages(Value: TCustomImageList);
    procedure SetAllocBy(Value: Integer);
    procedure SetItems(Value: TListItems);
    procedure SetListColumns(Value: TListColumns);
    procedure SetListGroups(Value: TListGroups);
    procedure SetOwnerData(Value: Boolean);
    procedure SetOwnerDraw(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure SetShowWorkAreas(const Value: Boolean);
    procedure SetSmallImages(Value: TCustomImageList);
    procedure SetSortType(Value: TSortType);
    procedure SetSelected(Value: TListItem);
    procedure SetStateImages(Value: TCustomImageList);
    procedure SetTextBkColor(Value: TColor);
    procedure SetTextColor(Value: TColor);
    procedure SetCheckboxes(Value: Boolean);
    procedure SetFlatScrollBars(Value: Boolean);
    procedure SetFullDrag(Value: Boolean);
    procedure SetGridLines(Value: Boolean);
    procedure SetHotTrack(Value: Boolean);
    procedure SetHotTrackStyles(Value: TListHotTrackStyles);
    procedure SetRowSelect(Value: Boolean);
    procedure SetHoverTime(Value: Integer);
    procedure SetGroupView(Value: Boolean);
    procedure ResetExStyles;
    function ValidHeaderHandle: Boolean;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMNotify(var Message: TWMNotify); message WM_NOTIFY;
    procedure WMParentNotify(var Message: TWMParentNotify); message WM_PARENTNOTIFY;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure CMHintShow(var Message: TCMHintShow); message CM_HINTSHOW;
    procedure WMContextMenu(var Message: TWMContextMenu); message WM_CONTEXTMENU;
    procedure WMCtlColorEdit(var Message: TMessage); message WM_CTLCOLOREDIT;
{$IFDEF CLR}
    function CustomListViewSort(AnItem1, AnItem2: Longint; lParam: Integer): Integer;
    function DefaultListViewSort(Item1, Item2: TListItem; lParam: TTag): Integer;
{$ENDIF}
    function StoreGroups: Boolean;
  protected
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    function CanObserve(const ID: Integer): Boolean; override;
    function CanChange(Item: TListItem; Change: Integer): Boolean; dynamic;
    function CanEdit(Item: TListItem): Boolean; dynamic;
    procedure Change(Item: TListItem; Change: Integer); dynamic;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure ColClick(Column: TListColumn); dynamic;
    procedure ColRightClick(Column: TListColumn; Point: TPoint); dynamic;
    function ColumnsShowing: Boolean;
    function CreateListItem: TListItem; virtual;
    function CreateListItems: TListItems; virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    function CustomDraw(const ARect: TRect; Stage: TCustomDrawStage): Boolean; virtual;
    function CustomDrawItem(Item: TListItem; State: TCustomDrawState;
      Stage: TCustomDrawStage): Boolean; virtual;
    function CustomDrawSubItem(Item: TListItem; SubItem: Integer;
      State: TCustomDrawState; Stage: TCustomDrawStage): Boolean; virtual;
    procedure Delete(Item: TListItem); dynamic;
    procedure DestroyWnd; override;
    procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
    procedure DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean); override;
    procedure DoSelectItem(Item: TListItem; Selected: Boolean); virtual;
    procedure DoStartDrag(var DragObject: TDragObject); override;
    procedure DoInfoTip(Item: TListItem; var InfoTip: string); virtual;
    procedure DrawItem(Item: TListItem; Rect: TRect; State: TOwnerDrawState); virtual;
    procedure Edit(const Item: TLVItem); dynamic;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    function OwnerDataFetch(Item: TListItem; Request: TItemRequest): Boolean; virtual;
    function OwnerDataFind(Find: TItemFind; const FindString: string;
      const FindPosition: TPoint; FindData: TCustomData; StartIndex: Integer;
      Direction: TSearchDirection; Wrap: Boolean): Integer; virtual;
    function OwnerDataHint(StartIndex, EndIndex: Integer): Boolean; virtual;
    function OwnerDataStateChange(StartIndex, EndIndex: Integer; OldState,
      NewState: TItemStates): Boolean; virtual;
    function GetActionLinkClass: TControlActionLinkClass; override;
    function GetItemIndex(Value: TListItem): Integer; reintroduce; overload;
    function GetItemIndex: Integer; reintroduce; overload; override;
    function GetListColumnsClass: TListColumnsClass; virtual;
    function GetSelCount: Integer; override;
    procedure InsertItem(Item: TListItem); dynamic;
    function IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean; virtual;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetItemIndex(const Value: Integer); override;
    procedure SetMultiSelect(Value: Boolean); override;
    procedure SetViewStyle(Value: TViewStyle); virtual;
    procedure UpdateColumn(AnIndex: Integer);
    procedure UpdateColumns;
    procedure UpdateGroup(AnIndex: Integer);
    procedure UpdateGroups;
    procedure WndProc(var Message: TMessage); override;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Groups: TListGroups read FListGroups write SetListGroups stored StoreGroups;
    property Columns: TListColumns read FListColumns write SetListColumns;
    property ColumnClick: Boolean read FColumnClick write SetColumnClick default True;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    property HideSelection: Boolean read FHideSelection write SetHideSelection default True;
    property IconOptions: TIconOptions read FIconOptions write SetIconOptions;
    property AllocBy: Integer read FAllocBy write SetAllocBy default 0;
    property GroupView: Boolean read FGroupView write SetGroupView default False;
    property HoverTime: Integer read GetHoverTime write SetHoverTime default -1;
    property LargeImages: TCustomImageList read FLargeImages write SetLargeImages;
    property GroupHeaderImages: TCustomImageList read FGroupHeaderImages write SetGroupHeaderImages;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property OwnerData: Boolean read FOwnerData write SetOwnerData default False;
    property OwnerDraw: Boolean read FOwnerDraw write SetOwnerDraw default False;
    property OnAdvancedCustomDraw: TLVAdvancedCustomDrawEvent read FOnAdvancedCustomDraw write FOnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem: TLVAdvancedCustomDrawItemEvent read FOnAdvancedCustomDrawItem write FOnAdvancedCustomDrawItem;
    property OnAdvancedCustomDrawSubItem: TLVAdvancedCustomDrawSubItemEvent read FOnAdvancedCustomDrawSubItem write FOnAdvancedCustomDrawSubItem;
    property OnChange: TLVChangeEvent read FOnChange write FOnChange;
    property OnChanging: TLVChangingEvent read FOnChanging write FOnChanging;
    property OnColumnClick: TLVColumnClickEvent read FOnColumnClick
      write FOnColumnClick;
    property OnColumnDragged: TNotifyEvent read FOnColumnDragged write FOnColumnDragged;
    property OnColumnRightClick: TLVColumnRClickEvent read FOnColumnRightClick
      write FOnColumnRightClick;
    property OnCompare: TLVCompareEvent read FOnCompare write FOnCompare;
    property OnCreateItemClass: TLVCreateItemClassEvent read FOnCreateItemClass write FOnCreateItemClass;
    property OnCustomDraw: TLVCustomDrawEvent read FOnCustomDraw write FOnCustomDraw;
    property OnCustomDrawItem: TLVCustomDrawItemEvent read FOnCustomDrawItem write FOnCustomDrawItem;
    property OnCustomDrawSubItem: TLVCustomDrawSubItemEvent read FOnCustomDrawSubItem write FOnCustomDrawSubItem;
    property OnData: TLVOwnerDataEvent read FOnData write FOnData;
    property OnDataFind: TLVOwnerDataFindEvent read FOnDataFind write FOnDataFind;
    property OnDataHint: TLVOwnerDataHintEvent read FOnDataHint write FOnDataHint;
    property OnDataStateChange: TLVOwnerDataStateChangeEvent read FOnDataStateChange write FOnDataStateChange;
    property OnDeletion: TLVDeletedEvent read FOnDeletion write FOnDeletion;
    property OnDrawItem: TLVDrawItemEvent read FOnDrawItem write FOnDrawItem;
    property OnEdited: TLVEditedEvent read FOnEdited write FOnEdited;
    property OnEditing: TLVEditingEvent read FOnEditing write FOnEditing;
    property OnInfoTip: TLVInfoTipEvent read FOnInfoTip write FOnInfoTip;
    property OnInsert: TLVDeletedEvent read FOnInsert write FOnInsert;
    property OnGetImageIndex: TLVNotifyEvent read FOnGetImageIndex write FOnGetImageIndex;
    property OnGetSubItemImage: TLVSubItemImageEvent read FOnGetSubItemImage write FOnGetSubItemImage;
    property OnSelectItem: TLVSelectItemEvent read FOnSelectItem write FOnSelectItem;
    property OnItemChecked: TLVCheckedItemEvent read FOnItemChecked write FOnItemChecked;
    property Reading: Boolean read FReading;
    property ShowColumnHeaders: Boolean read FShowColumnHeaders write
      SetColumnHeaders default True;
    property ShowWorkAreas: Boolean read FShowWorkAreas write SetShowWorkAreas default False;
    property SmallImages: TCustomImageList read FSmallImages write SetSmallImages;
    property SortType: TSortType read FSortType write SetSortType default stNone;
    property StateImages: TCustomImageList read FStateImages write SetStateImages;
    property ViewStyle: TViewStyle read FViewStyle write SetViewStyle default vsIcon;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddItem(Item: String; AObject: TObject); override;
    function AlphaSort: Boolean;
    procedure Arrange(Code: TListArrangement);
    procedure Clear; override;
    procedure ClearSelection; override;
    procedure CopySelection(Destination: TCustomListControl); override;
    procedure DeleteSelected; override;
    function FindCaption(StartIndex: Integer; Value: string;
      Partial, Inclusive, Wrap: Boolean): TListItem;
    function FindData(StartIndex: Integer; Value: TCustomData;
      Inclusive, Wrap: Boolean): TListItem;
    function GetCount: Integer; override;
    function GetHitTestInfoAt(X, Y: Integer): THitTests;
    function GetItemAt(X, Y: Integer): TListItem;
    function GetNearestItem(Point: TPoint;
      Direction: TSearchDirection): TListItem;
    function GetNextItem(StartItem: TListItem;
      Direction: TSearchDirection; States: TItemStates): TListItem;
    function GetSearchString: string;
    function IsEditing: Boolean;
    procedure SelectAll; override;
    procedure Scroll(DX, DY: Integer);
{$IFDEF CLR}
    function CustomSort(SortProc: TLVCompareProc; Data: TTag): Boolean;
{$ELSE}
    function CustomSort(SortProc: TLVCompare; lParam: LPARAM): Boolean;
{$ENDIF}
    property Canvas: TCanvas read FCanvas;
    property Checkboxes: Boolean read FCheckboxes write SetCheckboxes default False;
    property Column[Index: Integer]: TListColumn read GetColumnFromIndex;
    property DropTarget: TListItem read GetDropTarget write SetDropTarget;
    property FlatScrollBars: Boolean read FFlatScrollBars write SetFlatScrollBars default False;
    property FullDrag: Boolean read FFullDrag write SetFullDrag default False;
    property GridLines: Boolean read FGridLines write SetGridLines default False;
    function GetDragImages: TDragImageList; override;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default False;
    property HotTrackStyles: TListHotTrackStyles read FHotTrackStyles write SetHotTrackStyles default [];
    property ItemFocused: TListItem read GetFocused write SetFocused;
    property Items: TListItems read FListItems write SetItems stored AreItemsStored;
    property RowSelect: Boolean read FRowSelect write SetRowSelect default False;
    property SelCount: Integer read GetSelCount;
    property Selected: TListItem read GetSelected write SetSelected;
    function StringWidth(S: string): Integer;
    procedure UpdateItems(FirstIndex, LastIndex: Integer);
    property TopItem: TListItem read GetTopItem;
    property ViewOrigin: TPoint read GetViewOrigin;
    property VisibleRowCount: Integer read GetVisibleRowCount;
    property BoundingRect: TRect read GetBoundingRect;
    property WorkAreas: TWorkAreas read FWorkAreas;
  end;

{ TListView }

  TListView = class(TCustomListView)
  strict private
    class constructor Create;
    class destructor Destroy;
  published
    property Action;
    property Align;
    property AllocBy;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind default bkNone;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property BorderWidth;
    property Checkboxes;
    property Color;
    property Columns;
    property ColumnClick;
    property Constraints;
    property Ctl3D;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property FlatScrollBars;
    property FullDrag;
    property GridLines;
    property Groups;
    property HideSelection;
    property HotTrack;
    property HotTrackStyles;
    property HoverTime;
    property IconOptions;
    property Items;
    property LargeImages;
    property MultiSelect;
    property StyleElements;
    property OwnerData;
    property OwnerDraw;
    property GroupHeaderImages;
    property GroupView default False;
    property ReadOnly default False;
    property RowSelect;
    property ParentBiDiMode;
    property ParentColor default False;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowColumnHeaders;
    property ShowWorkAreas;
    property ShowHint;
    property SmallImages;
    property SortType;
    property StateImages;
    property TabOrder;
    property TabStop default True;
    property Touch;
    property ViewStyle;
    property Visible;
    property OnAdvancedCustomDraw;
    property OnAdvancedCustomDrawItem;
    property OnAdvancedCustomDrawSubItem;
    property OnChange;
    property OnChanging;
    property OnClick;
    property OnColumnClick;
    property OnColumnDragged;
    property OnColumnRightClick;
    property OnCompare;
    property OnContextPopup;
    property OnCustomDraw;
    property OnCustomDrawItem;
    property OnCustomDrawSubItem;
    property OnCreateItemClass;
    property OnData;
    property OnDataFind;
    property OnDataHint;
    property OnDataStateChange;
    property OnDblClick;
    property OnDeletion;
    property OnDrawItem;
    property OnEdited;
    property OnEditing;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetImageIndex;
    property OnGetSubItemImage;
    property OnDragDrop;
    property OnDragOver;
    property OnInfoTip;
    property OnInsert;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnSelectItem;
    property OnItemChecked;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TListViewActionLink }

  TListViewActionLink = class(TListActionLink)
  protected
    procedure AddItem(AnItem: TListControlItem); override;
    procedure AddItem(ACaption: String; AImageIndex: Integer;
      DataPtr: TCustomData); override;
    procedure SetImages(Value: TCustomImageList); override;
  end;

{ TAnimate }

  TCommonAVI = (aviNone, aviFindFolder, aviFindFile, aviFindComputer, aviCopyFiles,
    aviCopyFile, aviRecycleFile, aviEmptyRecycle, aviDeleteFile);

  TAnimateParams = record
    FileName: string;
    CommonAVI: TCommonAVI;
    ResHandle: THandle;
    ResName: string;
    ResId: Integer;
  end;

{$IFDEF CLR}
  TAnimateResId = TObject;
{$ELSE}
  TAnimateResId = NativeInt;
{$ENDIF}

  TAnimate = class(TWinControl)
  private
    FActive: Boolean;
    FFileName: string;
    FCenter: Boolean;
    FCommonAVI: TCommonAVI;
    FFrameCount: Integer;
    FFrameHeight: Integer;
    FFrameWidth: Integer;
    FOpen: Boolean;
    FRecreateNeeded: Boolean;
    FRepetitions: Integer;
    FResHandle: THandle;
    FResId: Integer;
    FResName: string;
    FStreamedActive: Boolean;
    FTimers: Boolean;
    FTransparent: Boolean;
    FStartFrame: Smallint;
    FStopFrame: Smallint;
    FStopCount: Integer;
    FOnOpen: TNotifyEvent;
    FOnClose: TNotifyEvent;
    FOnStart: TNotifyEvent;
    FOnStop: TNotifyEvent;
    procedure CheckOpen;
    function InternalClose: Boolean;
    function InternalOpen: Boolean;
    procedure GetAnimateParams(var Params: TAnimateParams);
    procedure SetAnimateParams(const Params: TAnimateParams);
    function GetActualResId: TAnimateResId;
    function GetActualResHandle: THandle;
    procedure GetFrameInfo;
    procedure SetActive(Value: Boolean);
    procedure SetFileName(Value: string);
    procedure SetCenter(Value: Boolean);
    procedure SetCommonAVI(Value: TCommonAVI);
    procedure SetOpen(Value: Boolean);
    procedure SetRepetitions(Value: Integer);
    procedure SetResHandle(Value: THandle);
    procedure SetResId(Value: Integer);
    procedure SetResName(Value: string);
    procedure SetTimers(Value: Boolean);
    procedure SetTransparent(Value: Boolean);
    procedure SetStartFrame(Value: Smallint);
    procedure SetStopFrame(Value: Smallint);
    procedure UpdateActiveState;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
  protected
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure DoOpen; virtual;
    procedure DoClose; virtual;
    procedure DoStart; virtual;
    procedure DoStop; virtual;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    property FrameCount: Integer read FFrameCount;
    property FrameHeight: Integer read FFrameHeight;
    property FrameWidth: Integer read FFrameWidth;
    property Open: Boolean read FOpen write SetOpen;
    procedure Play(FromFrame, ToFrame: Word; Count: Integer);
    procedure Reset;
    procedure Seek(Frame: Smallint);
    procedure Stop;
    property ResHandle: THandle read FResHandle write SetResHandle;
    property ResId: Integer read FResId write SetResId;
    property ResName: string read FResName write SetResName;
  published
    property Align;
    property Active: Boolean read FActive write SetActive default False;
    property Anchors;
    property AutoSize default True;
    property BorderWidth;
    property Center: Boolean read FCenter write SetCenter default True;
    property Color;
    property CommonAVI: TCommonAVI read FCommonAVI write SetCommonAVI default aviNone;
    property Constraints;
    property DoubleBuffered;
    property FileName: string read FFileName write SetFileName;
    property ParentColor;
    property ParentDoubleBuffered;
    property ParentShowHint;
    property Repetitions: Integer read FRepetitions write SetRepetitions default 0;
    property ShowHint;
    property StartFrame: Smallint read FStartFrame write SetStartFrame default 1;
    property StopFrame: Smallint read FStopFrame write SetStopFrame default 0;
    property Timers: Boolean read FTimers write SetTimers default False;
    property Touch;
    property Transparent: Boolean read FTransparent write SetTransparent default True;
    property Visible;
    property OnOpen: TNotifyEvent read FOnOpen write FOnOpen;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnGesture;
    property OnStart: TNotifyEvent read FOnStart write FOnStart;
    property OnStop: TNotifyEvent read FOnStop write FOnStop;
  end;

{ TToolBar }

const
  CN_DROPDOWNCLOSED = WM_USER + $1000;

type
  TToolButtonStyle = (tbsButton, tbsCheck, tbsDropDown, tbsSeparator,
    tbsDivider, tbsTextButton);

  TToolButtonState = (tbsChecked, tbsPressed, tbsEnabled, tbsHidden,
    tbsIndeterminate, tbsWrap, tbsEllipses, tbsMarked);

  TToolBar = class;
  TToolButton = class;

{ TToolButtonActionLink }

  TToolButtonActionLink = class(TControlActionLink)
  protected
    FClient: TToolButton;
    procedure AssignClient(AClient: TObject); override;
    function IsCheckedLinked: Boolean; override;
    function IsDropdownMenuLinked: Boolean; override;
    function IsEnableDropdownLinked: Boolean; override;
    function IsImageIndexLinked: Boolean; override;
    procedure SetChecked(Value: Boolean); override;
    procedure SetDropdownMenu(Value: TPopupMenu); override;
    procedure SetEnableDropdown(Value: Boolean); override;
    procedure SetImageIndex(Value: Integer); override;
  end;

  TToolButtonActionLinkClass = class of TToolButtonActionLink;

  TToolButton = class(TGraphicControl)
  private
    FAllowAllUp: Boolean;
    FAutoSize: Boolean;
    FDown: Boolean;
    FGrouped: Boolean;
    FImageIndex: TImageIndex;
    FIndeterminate: Boolean;
    FMarked: Boolean;
    FMenuItem: TMenuItem;
    FDropdownMenu: TPopupMenu;
    FEnableDropdown: Boolean;
    FWrap: Boolean;
    FStyle: TToolButtonStyle;
    FUpdateCount: Integer;
    function GetButtonState: Byte;
    function GetIndex: Integer;
    function IsCheckedStored: Boolean;
    function IsImageIndexStored: Boolean;
    function IsWidthStored: Boolean;
    procedure SetButtonState(State: Byte);
    procedure SetDown(Value: Boolean);
    procedure SetDropdownMenu(Value: TPopupMenu);
    procedure SetEnableDropdown(Value: Boolean);
    procedure SetGrouped(Value: Boolean);
    procedure SetImageIndex(Value: TImageIndex);
    procedure SetIndeterminate(Value: Boolean);
    procedure SetMarked(Value: Boolean);
    procedure SetMenuItem(Value: TMenuItem);
    procedure SetStyle(Value: TToolButtonStyle);
    procedure SetWrap(Value: Boolean);
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMHitTest(var Message: TCMHitTest); message CM_HITTEST;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
    FToolBar: TToolBar;
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    procedure AssignTo(Dest: TPersistent); override;
    procedure BeginUpdate; virtual;
    procedure EndUpdate; virtual;
    function GetActionLinkClass: TControlActionLinkClass; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
    procedure RefreshControl; virtual;
    procedure SetAutoSize(Value: Boolean); override;
    procedure SetToolBar(AToolBar: TToolBar);
    procedure UpdateControl; virtual;
    procedure ValidateContainer(AComponent: TComponent); override;
  public
    constructor Create(AOwner: TComponent); override;
    function CheckMenuDropdown: Boolean; dynamic;
    procedure Click; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    property Index: Integer read GetIndex;
  published
    property Action;
    property AllowAllUp: Boolean read FAllowAllUp write FAllowAllUp default False;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property Caption;
    property Down: Boolean read FDown write SetDown stored IsCheckedStored default False;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DropdownMenu: TPopupMenu read FDropdownMenu write SetDropdownMenu;
    property Enabled;
    property EnableDropdown: Boolean read FEnableDropdown write SetEnableDropdown default False;
    property Grouped: Boolean read FGrouped write SetGrouped default False;
    property Height stored False;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex stored IsImageIndexStored default -1;
    property Indeterminate: Boolean read FIndeterminate write SetIndeterminate default False;
    property Marked: Boolean read FMarked write SetMarked default False;
    property MenuItem: TMenuItem read FMenuItem write SetMenuItem;
    property ParentShowHint;
    property PopupMenu;
    property Wrap: Boolean read FWrap write SetWrap default False;
    property ShowHint;
    property Style: TToolButtonStyle read FStyle write SetStyle default tbsButton;
    property Visible;
    property Width stored IsWidthStored;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

  TTBCustomDrawFlags = set of (tbNoEdges, tbHiliteHotTrack, tbNoOffset,
    tbNoMark, tbNoEtchedEffect);

  TTBGradientDrawingOptions = set of (gdoHotTrack, gdoGradient);
  TTBDrawingStyle = (dsNormal, dsGradient);

  TTBCustomDrawEvent = procedure(Sender: TToolBar; const ARect: TRect;
    var DefaultDraw: Boolean) of object;
  TTBCustomDrawBtnEvent = procedure(Sender: TToolBar; Button: TToolButton;
    State: TCustomDrawState; var DefaultDraw: Boolean) of object;
  TTBAdvancedCustomDrawEvent = procedure(Sender: TToolBar; const ARect: TRect;
    Stage: TCustomDrawStage; var DefaultDraw: Boolean) of object;
  TTBAdvancedCustomDrawBtnEvent = procedure(Sender: TToolBar; Button: TToolButton;
    State: TCustomDrawState; Stage: TCustomDrawStage;
    var Flags: TTBCustomDrawFlags; var DefaultDraw: Boolean) of object;
  TTBCustomizeQueryEvent = procedure(Sender: TToolbar; Index: Integer;
    var Allow: Boolean) of object;
  TTBNewButtonEvent = procedure(Sender: TToolbar; Index: Integer;
    var Button: TToolButton) of object;
  TTBButtonEvent = procedure(Sender: TToolbar; Button: TToolButton) of object;

  TToolBarEnumerator = class
  private
    FIndex: Integer;
    FToolBar: TToolBar;
  public
    constructor Create(AToolBar: TToolBar);
    function GetCurrent: TToolButton;
    function MoveNext: Boolean;
    property Current: TToolButton read GetCurrent;
  end;

  TToolBar = class(TToolWindow)
  private
    FBitmap: TBitmap;
    FAllowTextButtons: Boolean;
    FButtonWidth: Integer;
    FButtonHeight: Integer;
    FButtons: TList;
    FCaption: string;
    FCanvas: TCanvas;
    FCanvasChanged: Boolean;
    FCustomizable: Boolean;
    FCustomizing: Boolean;
    FGradientDrawingOptions: TTBGradientDrawingOptions;
    FGradientDirection: TGradientDirection;
    FDrawingStyle: TTBDrawingStyle;
    FGradientEndColor: TColor;
    FGradientStartColor: TColor;
    FHotTrackColor: TColor;
    FShowCaptions: Boolean;
    FList: Boolean;
    FFlat: Boolean;
    FLastQueryDeleteIndex: Integer;
    FTransparent: Boolean;
    FTransparentSet: Boolean;
    FWrapable: Boolean;
    FImages: TCustomImageList;
    FImageChangeLink: TChangeLink;
    FDisabledImages: TCustomImageList;
    FDisabledImageChangeLink: TChangeLink;
    FHotImages: TCustomImageList;
    FHotImageChangeLink: TChangeLink;
    FIndent: Integer;
    FNewStyle: Boolean;
    FNullBitmap: TBitmap;
    FOldHandle: HBitmap;
    FRestoring: Boolean;
    FUpdateCount: Integer;
    FHeightMargin: Integer;
    FSeparators: Integer;
    FOnAdvancedCustomDraw: TTBAdvancedCustomDrawEvent;
    FOnAdvancedCustomDrawButton: TTBAdvancedCustomDrawBtnEvent;
    FOnCustomDraw: TTBCustomDrawEvent;
    FOnCustomDrawButton: TTBCustomDrawBtnEvent;
    FOnCustomizeCanDelete: TTBCustomizeQueryEvent;
    FOnCustomizeCanInsert: TTBCustomizeQueryEvent;
    FOnCustomizeNewButton: TTBNewButtonEvent;
    FOnCustomized: TNotifyEvent;
    FOnCustomizeDelete: TTBButtonEvent;
    FOnCustomizeAdded: TTBButtonEvent;
    FOnCustomizing: TNotifyEvent;
    FOnCustomizeReset: TNotifyEvent;
    { Toolbar menu support }
    FCaptureChangeCancels: Boolean;
    FInMenuLoop: Boolean;
    FTempMenu: TPopupMenu;
    FButtonMenu: TMenuItem;
    FMenuButton: TToolButton;
    FMenuResult: Boolean;
    FMenuDropped: Boolean;
    FMenu: TMainMenu;
    FCustomizeKeyName: string;
    FCustomizeValueName: string;
    FOurFont: Integer;
    FStockFont: Integer;
    FHideClippedButtons: Boolean;
    class constructor Create;
    class destructor Destroy;
    function IsGradientEndColorStored: Boolean;
    function ButtonIndex(OldIndex, ALeft, ATop: Integer): Integer;
    procedure CanvasChanged(Sender: TObject);
    function DoGetButton(var NMToolbar: TNMToolbar): Boolean;
    procedure LoadImages(AImages: TCustomImageList);
    function GetButton(Index: Integer): TToolButton;
    function GetButtonCount: Integer;
    procedure GetButtonSize(var AWidth, AHeight: Integer);
    function GetRowCount: Integer;
    procedure SetAllowTextButtons(Value: Boolean);
    procedure SetList(Value: Boolean);
    procedure SetShowCaptions(Value: Boolean);
    procedure SetFlat(Value: Boolean);
    procedure SetTransparent(Value: Boolean);
    procedure SetWrapable(Value: Boolean);
    procedure InsertButton(Control: TControl);
    procedure RemoveButton(Control: TControl);
    function RefreshButton(Index: Integer): Boolean;
    procedure UpdateButton(Index: Integer);
    procedure UpdateButtons;
    procedure UpdateButtonState(Index: Integer);
    procedure UpdateButtonStates;
    function UpdateItem(Message, FromIndex, ToIndex: Integer): Boolean;
    function UpdateItem2(Message, FromIndex, ToIndex: Integer): Boolean;
    procedure ClearTempMenu;
    procedure CreateButtons(NewWidth, NewHeight: Integer);
    procedure SetButtonWidth(Value: Integer);
    procedure SetButtonHeight(Value: Integer);
    procedure UpdateImages;
    procedure ImageListChange(Sender: TObject);
    procedure SetImageList(Value: HImageList);
    procedure SetImages(Value: TCustomImageList);
    procedure DisabledImageListChange(Sender: TObject);
    procedure SetDisabledImageList(Value: HImageList);
    procedure SetDisabledImages(Value: TCustomImageList);
    procedure HotImageListChange(Sender: TObject);
    procedure SetHotImageList(Value: HImageList);
    procedure SetHotImages(Value: TCustomImageList);
    procedure SetIndent(Value: Integer);
    procedure SetMenu(const Value: TMainMenu);
    procedure AdjustControl(Control: TControl);
    procedure RecreateButtons;
    procedure RecreateButtonsFromToolbar;
    procedure BeginUpdate;
    procedure EndUpdate;
    procedure ResizeButtons;
    procedure SaveButtons(Save: Boolean);
    function InternalButtonCount: Integer;
    function ReorderButton(OldIndex, ALeft, ATop: Integer): Integer;
    procedure WMCaptureChanged(var Message: TMessage); message WM_CAPTURECHANGED;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMGetText(var Message: TWMGetText); message WM_GETTEXT;
    procedure WMGetTextLength(var Message: TWMGetTextLength); message WM_GETTEXTLENGTH;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMNotifyFormat(var Message: TWMNotifyFormat); message WM_NOTIFYFORMAT;
    procedure WMSetText(var Message: TWMSetText); message WM_SETTEXT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMSysChar(var Message: TWMSysChar); message WM_SYSCHAR;
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMDockNotification(var Message: TCMDockNotification); message CM_DOCKNOTIFICATION;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
    procedure CNChar(var Message: TWMChar); message CN_CHAR;
    procedure CNSysKeyDown(var Message: TWMSysKeyDown); message CN_SYSKEYDOWN;
    procedure CMSysFontChanged(var Message: TMessage); message CM_SYSFONTCHANGED;
    procedure CMSysFontsAllChanged(var Message: TMessage); message CM_SYSFONTSALLCHANGED;
    procedure CNDropDownClosed(var Message: TMessage); message CN_DROPDOWNCLOSED;
    procedure CNNotify(var Message: TWMNotifyTLB); message CN_NOTIFY;
    procedure SetCustomizable(const Value: Boolean);
    procedure SetHideClippedButtons(const Value: Boolean);
    procedure SetGradientDrawingOptions(Value: TTBGradientDrawingOptions);
    procedure SetGradientDirection(Value: TGradientDirection);
    procedure SetGradientEndColor(Value: TColor);
    procedure SetGradientStartColor(Value: TColor);
    procedure SetDrawingStyle(Value: TTBDrawingStyle);
    function Perform(Msg: Cardinal; WParam: WPARAM; var LParam: TTBButton): LRESULT; overload;
{$IFNDEF CLR}
    procedure CMControlChange(var Message: TCMControlChange); message CM_CONTROLCHANGE;
{$ENDIF}
  protected
{$IFDEF CLR}
    FButtonHashTable: HashTable;
    procedure ControlChange(Inserting: Boolean; Child: TControl); override;
{$ENDIF}
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure CancelMenu; dynamic;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    function CheckMenuDropdown(Button: TToolButton): Boolean; dynamic;
    procedure ClickButton(Button: TToolButton); dynamic;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    function GradientDrawToolBar(const ARect: TRect): Boolean; virtual;
    function GradientDrawButton(Button: TToolButton; State: TCustomDrawState;
      var Flags: TTBCustomDrawFlags): Boolean; virtual;
    function CustomDraw(const ARect: TRect; Stage: TCustomDrawStage): Boolean; virtual;
    function CustomDrawButton(Button: TToolButton; State: TCustomDrawState;
      Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags): Boolean; virtual;
    function DoQueryInsert(Index: Integer): Boolean; virtual;
    function DoQueryDelete(Index: Integer): Boolean; virtual;
    function FindButtonFromAccel(Accel: Word): TToolButton;
    procedure InitMenu(Button: TToolButton); dynamic;
    function IsCustomDrawn(Target: TCustomDrawTarget; Stage: TCustomDrawStage): Boolean; virtual;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure RepositionButton(Index: Integer);
    procedure RepositionButtons(Index: Integer);
    procedure WndProc(var Message: TMessage); override;
    function WrapButtons(var NewWidth, NewHeight: Integer): Boolean;
    procedure Resize; override;
    procedure SetAutoSize(Value: Boolean); override;
    procedure UpdateStyleElements; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FlipChildren(AllLevels: Boolean); override;
    function GetEnumerator: TToolBarEnumerator;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function TrackMenu(Button: TToolButton): Boolean; dynamic;
    property ButtonCount: Integer read GetButtonCount;
    property Buttons[Index: Integer]: TToolButton read GetButton;
    property Canvas: TCanvas read FCanvas;
    property CustomizeKeyName: string read FCustomizeKeyName write FCustomizeKeyName;
    property CustomizeValueName: string read FCustomizeValueName write FCustomizeValueName;
    property RowCount: Integer read GetRowCount;
  published
    property Align default alTop;
    property Anchors;
    property AutoSize;
    property BorderWidth;
    property ButtonHeight: Integer read FButtonHeight write SetButtonHeight default 22;
    property ButtonWidth: Integer read FButtonWidth write SetButtonWidth default 23;
    property Caption;
    property Color;
    property Constraints;
    property Ctl3D;
    property Customizable: Boolean read FCustomizable write SetCustomizable default False;
    property DisabledImages: TCustomImageList read FDisabledImages write SetDisabledImages;
    property DoubleBuffered;
    property DockSite;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DrawingStyle: TTBDrawingStyle read FDrawingStyle
      write SetDrawingStyle default dsNormal;
    property EdgeBorders default [];
    property EdgeInner;
    property EdgeOuter;
    property Enabled;
    property Flat: Boolean read FFlat write SetFlat default True;
    property Font;
    property GradientEndColor: TColor read FGradientEndColor
      write SetGradientEndColor stored IsGradientEndColorStored;
    property GradientStartColor: TColor read FGradientStartColor
      write SetGradientStartColor default clWindow;
    property Height default 32;
    property HideClippedButtons: Boolean read FHideClippedButtons write SetHideClippedButtons default False;
    property HotImages: TCustomImageList read FHotImages write SetHotImages;
    property HotTrackColor: TColor read FHotTrackColor
      write FHotTrackColor default $00EFD3C6;
    property Images: TCustomImageList read FImages write SetImages;
    property Indent: Integer read FIndent write SetIndent default 0;
    property List: Boolean read FList write SetList default False;
    property Menu: TMainMenu read FMenu write SetMenu;
    property GradientDirection: TGradientDirection read FGradientDirection
      write SetGradientDirection default gdVertical;
    property GradientDrawingOptions: TTBGradientDrawingOptions read FGradientDrawingOptions
      write SetGradientDrawingOptions default [gdoHotTrack, gdoGradient];
    property ParentColor;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowCaptions: Boolean read FShowCaptions write SetShowCaptions default False;
    property AllowTextButtons: Boolean read FAllowTextButtons write SetAllowTextButtons default False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property Transparent: Boolean read FTransparent write SetTransparent stored FTransparentSet;
    property Visible;
    property StyleElements;
    property Wrapable: Boolean read FWrapable write SetWrapable default True;
    property OnAdvancedCustomDraw: TTBAdvancedCustomDrawEvent
      read FOnAdvancedCustomDraw write FOnAdvancedCustomDraw;
    property OnAdvancedCustomDrawButton: TTBAdvancedCustomDrawBtnEvent
      read FOnAdvancedCustomDrawButton write FOnAdvancedCustomDrawButton;
    property OnClick;
    property OnContextPopup;
    property OnCustomDraw: TTBCustomDrawEvent read FOnCustomDraw write FOnCustomDraw;
    property OnCustomDrawButton: TTBCustomDrawBtnEvent read FOnCustomDrawButton
      write FOnCustomDrawButton;
    property OnCustomizeAdded: TTBButtonEvent read FOnCustomizeAdded write FOnCustomizeAdded;
    property OnCustomizeCanInsert: TTBCustomizeQueryEvent read FOnCustomizeCanInsert
      write FOnCustomizeCanInsert;
    property OnCustomizeCanDelete: TTBCustomizeQueryEvent read FOnCustomizeCanDelete
      write FOnCustomizeCanDelete;
    property OnCustomized: TNotifyEvent read FOnCustomized write FOnCustomized;
    property OnCustomizeDelete: TTBButtonEvent read FOnCustomizeDelete write FOnCustomizeDelete;
    property OnCustomizing: TNotifyEvent read FOnCustomizing write FOnCustomizing;
    property OnCustomizeNewButton: TTBNewButtonEvent read FOnCustomizeNewButton
      write FOnCustomizeNewButton;
    property OnCustomizeReset: TNotifyEvent read FOnCustomizeReset write FOnCustomizeReset;
    property OnDblClick;
    property OnDockDrop;
    property OnDockOver;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

  TToolBarDockObject = class(TDragDockObject)
  private
    FEraseDockRect: TRect;
    FErase: Boolean;
  protected
    procedure AdjustDockRect(ARect: TRect); override;
    procedure DrawDragDockImage; override;
    procedure EraseDragDockImage; override;
    function GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor; override;
    function ToolDockImage(Erase: Boolean): Boolean; virtual;
  end;

{ TCoolBar }

const
  CN_BANDCHANGE = WM_USER + $1000;

type
  TCoolBar = class;

  TCoolBand = class(TCollectionItem)
  private
    FBorderStyle: TBorderStyle;
    FBreak: Boolean;
    FFixedSize: Boolean;
    FVisible: Boolean;
    FHorizontalOnly: Boolean;
    FImageIndex: TImageIndex;
    FFixedBackground: Boolean;
    FMinHeight: Integer;
    FMinWidth: Integer;
    FColor: TColor;
    FControl: TWinControl;
    FParentColor: Boolean;
    FParentBitmap: Boolean;
    FBitmap: TBitmap;
    FText: string;
    FWidth: Integer;
    FDDB: TBitmap;
    FID: Integer;
    function CoolBar: TCoolBar;
    function IsColorStored: Boolean;
    function IsBitmapStored: Boolean;
    procedure BitmapChanged(Sender: TObject);
    function GetHeight: Integer;
    function GetVisible: Boolean;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure SetBreak(Value: Boolean);
    procedure SetFixedSize(Value: Boolean);
    procedure SetMinHeight(Value: Integer);
    procedure SetMinWidth(Value: Integer);
    procedure SetVisible(Value: Boolean);
    procedure SetHorizontalOnly(Value: Boolean);
    procedure SetImageIndex(Value: TImageIndex);
    procedure SetFixedBackground(Value: Boolean);
    procedure SetColor(Value: TColor);
    procedure SetControl(Value: TWinControl);
    procedure SetParentColor(Value: Boolean);
    procedure SetParentBitmap(Value: Boolean);
    procedure SetBitmap(Value: TBitmap);
    procedure SetText(const Value: string);
    procedure SetWidth(Value: Integer);
  protected
    procedure ChangeScale(M, D: Integer); virtual;
    function GetDisplayName: string; override;
    procedure ParentColorChanged; dynamic;
    procedure ParentBitmapChanged; dynamic;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property Height: Integer read GetHeight;
  published
    property Bitmap: TBitmap read FBitmap write SetBitmap stored IsBitmapStored;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsNone;
    property Break: Boolean read FBreak write SetBreak default True;
    property Color: TColor read FColor write SetColor stored IsColorStored default clBtnFace;
    property Control: TWinControl read FControl write SetControl;
    property FixedBackground: Boolean read FFixedBackground write SetFixedBackground default True;
    property FixedSize: Boolean read FFixedSize write SetFixedSize default False;
    property HorizontalOnly: Boolean read FHorizontalOnly write SetHorizontalOnly default False;
    property ImageIndex: TImageIndex read FImageIndex write SetImageIndex;
    property MinHeight: Integer read FMinHeight write SetMinHeight default 25;
    property MinWidth: Integer read FMinWidth write SetMinWidth default 0;
    property ParentColor: Boolean read FParentColor write SetParentColor default True;
    property ParentBitmap: Boolean read FParentBitmap write SetParentBitmap default True;
    property Text: string read FText write SetText;
    property Visible: Boolean read GetVisible write SetVisible default True;
    property Width: Integer read FWidth write SetWidth;
  end;

  TCoolBands = class(TCollection)
  private
    FCreatingBand: Boolean;
    FCoolBar: TCoolBar;
    FVisibleCount: Longword;
    function GetItem(Index: Integer): TCoolBand;
    procedure SetItem(Index: Integer; Value: TCoolBand);
  protected
{$IFDEF CLR}
    FCoolBandHashTable: HashTable;
{$ENDIF}
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
    function HaveGraphic: Boolean;
  public
    constructor Create(CoolBar: TCoolBar);
    destructor Destroy; override;
    function Add: TCoolBand;
    function FindBand(AControl: TControl): TCoolBand;
    property CoolBar: TCoolBar read FCoolBar;
    property Items[Index: Integer]: TCoolBand read GetItem write SetItem; default;
  end;

  TCoolBandMaximize = (bmNone, bmClick, bmDblClick);

  TCoolBar = class(TToolWindow)
  private
    FBands: TCoolBands;
    FBandBorderStyle: TBorderStyle;
    FBandMaximize: TCoolBandMaximize;
    FBitmap: TBitmap;
    FCaptionFont: TFont;
    FCaptionFontHeight: Integer;
    FDDB: TBitmap;
    FFixedSize: Boolean;
    FFixedOrder: Boolean;
    FImages: TCustomImageList;
    FImageChangeLink: TChangeLink;
    FShowText: Boolean;
    FVertical: Boolean;
    FTrackDrag: TSmallPoint;
    FUpdateCount: Integer;
    FOnChange: TNotifyEvent;
    class constructor Create;
    class destructor Destroy;
    procedure BeginUpdate;
    procedure BitmapChanged(Sender: TObject);
    procedure EndUpdate;
    function IsAutoSized: Boolean;
    function IsBackgroundDirty: Boolean;
    function GetAlign: TAlign;
    function GetCaptionFont: HFONT;
    function GetCaptionFontHeight: Integer;
    function GetCaptionSize(Band: TCoolBand): Integer;
    function GetRowHeight(Index: Integer): Integer;
    procedure RefreshControl(Band: TCoolBand);
    procedure SetAlign(Value: TAlign);
    procedure SetBands(Value: TCoolBands);
    procedure SetBandBorderStyle(Value: TBorderStyle);
    procedure SetBandMaximize(Value: TCoolBandMaximize);
    procedure SetBitmap(Value: TBitmap);
    procedure SetFixedSize(Value: Boolean);
    procedure SetFixedOrder(Value: Boolean);
    procedure SetImageList(Value: HImageList);
    procedure SetImages(Value: TCustomImageList);
    procedure SetShowText(Value: Boolean);
    procedure SetVertical(Value: Boolean);
    procedure ImageListChange(Sender: TObject);
    function PtInGripRect(const Pos: TPoint; var Band: TCoolBand): Integer;
    function ReadBands: Boolean;
    function UpdateItem(Message, FromIndex, ToIndex: Integer): Boolean;
    procedure UpdateBand(Index: Integer);
    procedure UpdateBands;
    procedure WMCaptureChanged(var Message: TMessage); message WM_CAPTURECHANGED;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMNotifyFormat(var Message: TWMNotifyFormat); message WM_NOTIFYFORMAT;
    procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMDesignHitTest(var Message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CNBandChange(var Message: TMessage); message CN_BANDCHANGE;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMSysFontChanged(var Message: TMessage); message CM_SYSFONTCHANGED;
    procedure CMSysFontsAllChanged(var Message: TMessage); message CM_SYSFONTSALLCHANGED;
    procedure CMWinIniChange(var Message: TWMWinIniChange); message CM_WININICHANGE;
{$IFNDEF CLR}
    procedure CMControlChange(var Message: TCMControlChange); message CM_CONTROLCHANGE;
{$ENDIF}
  protected
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure Change; dynamic;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    function GetPalette: HPALETTE; override;
    function HitTest(const Pos: TPoint): TCoolBand;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure WndProc(var Message: TMessage); override;
    procedure PaintWindow(DC: HDC); override;
{$IFDEF CLR}
    procedure ControlChange(Inserting: Boolean; Child: TControl); override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FlipChildren(AllLevels: Boolean); override;
    procedure ScaleForPPI(NewPPI: Integer); override;
  published
    property Align read GetAlign write SetAlign default alTop;
    property Anchors;
    property AutoSize;
    property BandBorderStyle: TBorderStyle read FBandBorderStyle write SetBandBorderStyle default bsSingle;
    property BandMaximize: TCoolBandMaximize read FBandMaximize write SetBandMaximize default bmClick;
    property Bands: TCoolBands read FBands write SetBands;
    property BorderWidth;
    property Color;
    property Constraints;
    property Ctl3D;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property EdgeBorders;
    property EdgeInner;
    property EdgeOuter;
    property Enabled;
    property FixedSize: Boolean read FFixedSize write SetFixedSize default False;
    property FixedOrder: Boolean read FFixedOrder write SetFixedOrder default False;
    property Font;
    property Images: TCustomImageList read FImages write SetImages;
    property ParentColor;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property PopupMenu;
    property ShowHint;
    property ShowText: Boolean read FShowText write SetShowText default True;
    property Touch;
    property Vertical: Boolean read FVertical write SetVertical default False;
    property Visible;
    property StyleElements;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDockDrop;
    property OnDockOver;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

{ Calendar common control support }

  TCommonCalendar = class;

  ECommonCalendarError = class(Exception);

{$IFDEF CLR}
  ECommonCalExceptClass = class of Exception;
{$ELSE}
  ECommonCalExceptClass = ExceptClass;
{$ENDIF}

  TMonthCalColors = class(TPersistent)
  private
    Owner: TCommonCalendar;
    FBackColor: TColor;
    FTextColor: TColor;
    FTitleBackColor: TColor;
    FTitleTextColor: TColor;
    FMonthBackColor: TColor;
    FTrailingTextColor: TColor;
    procedure SetColor(Index: Integer; Value: TColor);
    procedure SetAllColors;
  public
    constructor Create(AOwner: TCommonCalendar);
    procedure Assign(Source: TPersistent); override;
  published
    property BackColor: TColor index 0 read FBackColor write SetColor default clWindow;
    property TextColor: TColor index 1 read FTextColor write SetColor default clWindowText;
    property TitleBackColor: TColor index 2 read FTitleBackColor write SetColor default clActiveCaption;
    property TitleTextColor: TColor index 3 read FTitleTextColor write SetColor default clWhite;
    property MonthBackColor: TColor index 4 read FMonthBackColor write SetColor default clWhite;
    property TrailingTextColor: TColor index 5 read FTrailingTextColor
      write SetColor default clInactiveCaptionText;
  end;


  TCalDayOfWeek = System.UITypes.TCalDayOfWeek;
  {$NODEFINE TCalDayOfWeek}
  {$HPPEMIT OPENNAMESPACE}
  {$HPPEMIT 'using ::System::Uitypes::TCalDayOfWeek;'}
  {$HPPEMIT CLOSENAMESPACE}

  TOnGetMonthInfoEvent = procedure(Sender: TObject; Month: LongWord;
    var MonthBoldInfo: LongWord) of object;
  TOnGetMonthBoldInfoEvent = procedure(Sender: TObject; Month: LongWord; Year: LongWord;
    var MonthBoldInfo: LongWord) of object;

  TCommonCalendar = class(TWinControl)
  private
    FCalColors: TMonthCalColors;
    FCalExceptionClass: ECommonCalExceptClass;
    FDateTime: TDateTime;
    FEndDate: TDate;
    FFirstDayOfWeek: TCalDayOfWeek;
    FMaxDate: TDate;
    FMaxSelectRange: Integer;
    FMinDate: TDate;
    FMonthDelta: Integer;
    FMultiSelect: Boolean;
    FShowToday: Boolean;
    FShowTodayCircle: Boolean;
    FWeekNumbers: Boolean;
    FOnGetMonthInfo: TOnGetMonthInfoEvent deprecated 'use OnGetMonthBoldInfo';
    FOnGetMonthBoldInfo: TOnGetMonthBoldInfoEvent;
    function DoStoreEndDate: Boolean;
    function DoStoreMaxDate: Boolean;
    function DoStoreMinDate: Boolean;
    function GetDate: TDate;
    procedure SetCalColors(Value: TMonthCalColors);
    procedure SetDate(Value: TDate);
    procedure SetDateTime(Value: TDateTime);
    procedure SetEndDate(Value: TDate);
    procedure SetFirstDayOfWeek(Value: TCalDayOfWeek);
    procedure SetMaxDate(Value: TDate);
    procedure SetMaxSelectRange(Value: Integer);
    procedure SetMinDate(Value: TDate);
    procedure SetMonthDelta(Value: Integer);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetRange(MinVal, MaxVal: TDate);
    procedure SetSelectedRange(Date, EndDate: TDate);
    procedure SetShowToday(Value: Boolean);
    procedure SetShowTodayCircle(Value: Boolean);
    procedure SetWeekNumbers(Value: Boolean);
  protected
    procedure CheckEmptyDate; virtual;
    procedure CheckValidDate(Value: TDate); virtual;
    procedure CreateWnd; override;
    function GetCalendarHandle: HWND; virtual; abstract;
    function GetCalStyles: DWORD; virtual;
    function MsgSetCalColors(ColorIndex: Integer; ColorValue: TColor): Boolean; virtual; abstract;
    function MsgSetDateTime(Value: TSystemTime): Boolean; virtual; abstract;
    function MsgSetRange(Flags: Integer; SysTime: TSystemTimeRangeArray): Boolean; overload; virtual; abstract;
{$IFNDEF CLR}
    function MsgSetRange(Flags: Integer; SysTime: PSystemTime; Unused: Integer = 0): Boolean; overload; virtual; deprecated; abstract;
{$ENDIF}
    property CalExceptionClass: ECommonCalExceptClass read FCalExceptionClass write FCalExceptionClass;
    property CalColors: TMonthCalColors read FCalColors write SetCalColors;
    property CalendarHandle: HWND read GetCalendarHandle;
    property Date: TDate read GetDate write SetDate;
    property DateTime: TDateTime read FDateTime write SetDateTime;
    property EndDate: TDate read FEndDate write SetEndDate stored DoStoreEndDate;
    property FirstDayOfWeek: TCalDayOfWeek read FFirstDayOfWeek write SetFirstDayOfWeek
      default dowLocaleDefault;
    property MaxDate: TDate read FMaxDate write SetMaxDate stored DoStoreMaxDate;
    property MaxSelectRange: Integer read FMaxSelectRange write SetMaxSelectRange default 31;
    property MinDate: TDate read FMinDate write SetMinDate stored DoStoreMinDate;
    property MonthDelta: Integer read FMonthDelta write SetMonthDelta default 1;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property ShowToday: Boolean read FShowToday write SetShowToday default True;
    property ShowTodayCircle: Boolean read FShowTodayCircle write
      SetShowTodayCircle default True;
    property WeekNumbers: Boolean read FWeekNumbers write SetWeekNumbers default False;
    property OnGetMonthInfo: TOnGetMonthInfoEvent read FOnGetMonthInfo write FOnGetMonthInfo;
    property OnGetMonthBoldInfo: TOnGetMonthBoldInfoEvent read FOnGetMonthBoldInfo write FOnGetMonthBoldInfo;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure BoldDays(Days: array of LongWord; var MonthBoldInfo: LongWord);
  end;

{ TMonthCalendar }

  EMonthCalError = class(ECommonCalendarError);

  TMonthCalendar = class(TCommonCalendar)
  private
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNNotify(var Message: TWMNotifyMC); message CN_NOTIFY;
  protected
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    procedure ConstrainedResize(var MinWidth, MinHeight, MaxWidth,
      MaxHeight: Integer); override;
    procedure CreateParams(var Params: TCreateParams); override;
    function GetCalendarHandle: HWND; override;
    function MsgSetCalColors(ColorIndex: Integer; ColorValue: TColor): Boolean; override;
    function MsgSetDateTime(Value: TSystemTime): Boolean; override;
    function MsgSetRange(Flags: Integer; SysTime: TSystemTimeRangeArray): Boolean; override;
{$IFNDEF CLR}
    function MsgSetRange(Flags: Integer; SysTime: PSystemTime; Unused: Integer = 0): Boolean; override; deprecated;
{$ENDIF}
    procedure CreateWnd; override;
    /// <summary>
    ///    Override background painting for custom style
    /// </summary>
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Anchors;
    property AutoSize;
    property BorderWidth;
    property BiDiMode;
    property CalColors;
    property Constraints;
    property MultiSelect;  // must be before date stuff
    property Date;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property EndDate;
    property FirstDayOfWeek;
    property Font;
    property ImeMode;
    property ImeName;
    property MaxDate;
    property MaxSelectRange;
    property MinDate;
    property ParentBiDiMode;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property ShowToday;
    property ShowTodayCircle;
    property TabOrder;
    property TabStop;
    property Touch;
    property Visible;
    property WeekNumbers;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetMonthInfo;
    property OnGetMonthBoldInfo;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TDateTimePicker }

  EDateTimeError = class(ECommonCalendarError);

  TDateTimeKind = (dtkDate, dtkTime);
  TDTDateMode = (dmComboBox, dmUpDown);
  TDTDateFormat = (dfShort, dfLong);
  TDTCalAlignment = (dtaLeft, dtaRight);

  TDTParseInputEvent = procedure(Sender: TObject; const UserString: string;
    var DateAndTime: TDateTime; var AllowChange: Boolean) of object;

  TDateTimeColors = TMonthCalColors;  // for backward compatibility

  TDateTimePicker = class(TCommonCalendar)
  private
    FCalAlignment: TDTCalAlignment;
    FChanging: Boolean;
    FChecked: Boolean;
    FDateFormat: TDTDateFormat;
    FDateMode: TDTDateMode;
    FDroppedDown: Boolean;
    FKind: TDateTimeKind;
    FLastChange: TSystemTime;
    FParseInput: Boolean;
    FShowCheckbox: Boolean;
    FOnUserInput: TDTParseInputEvent;
    FOnCloseUp: TNotifyEvent;
    FOnChange: TNotifyEvent;
    FOnDropDown: TNotifyEvent;
    FFormat: String;
    class constructor Create;
    class destructor Destroy;
    procedure AdjustHeight;
    function GetTime: TTime;
    procedure SetCalAlignment(Value: TDTCalAlignment);
    procedure SetChecked(Value: Boolean);
    procedure SetDateMode(Value: TDTDateMode);
    procedure SetDateFormat(Value: TDTDateFormat);
    procedure SetKind(Value: TDateTimeKind);
    procedure SetParseInput(Value: Boolean);
    procedure SetShowCheckbox(Value: Boolean);
    procedure SetTime(Value: TTime);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CNNotify(var Message: TWMNotifyDT); message CN_NOTIFY;
    procedure SetFormat(const Value: String);
  protected
    function CanObserve(const ID: Integer): Boolean; override;
    procedure CheckEmptyDate; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure Change; dynamic;
    function GetCalendarHandle: HWND; override;
    function MsgSetCalColors(ColorIndex: Integer; ColorValue: TColor): Boolean; override;
    function MsgSetDateTime(Value: TSystemTime): Boolean; override;
    function MsgSetRange(Flags: Integer; SysTime: TSystemTimeRangeArray): Boolean; override;
{$IFNDEF CLR}
    function MsgSetRange(Flags: Integer; SysTime: PSystemTime; Unused: Integer = 0): Boolean; override; deprecated;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    property DateTime;
    property DroppedDown: Boolean read FDroppedDown;
  published
    property Align;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind default bkNone;
    property BevelWidth;
    property BiDiMode;
    property CalAlignment: TDTCalAlignment read FCalAlignment write SetCalAlignment default dtaLeft;
    property CalColors;
    property Constraints;
    // The Date, Time, ShowCheckbox, and Checked properties must be in this order:
    property Date;
    property Format: String read FFormat write SetFormat;
    property Time: TTime read GetTime write SetTime;
    property ShowCheckbox: Boolean read FShowCheckbox write SetShowCheckbox default False;
    property Checked: Boolean read FChecked write SetChecked default True;
    property Color stored True default clWindow;
    property DateFormat: TDTDateFormat read FDateFormat write SetDateFormat default dfShort;
    property DateMode: TDTDateMode read FDateMode write SetDateMode default dmComboBox;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property Kind: TDateTimeKind read FKind write SetKind default dtkDate;
    property MaxDate;
    property MinDate;
    property ParseInput: Boolean read FParseInput write SetParseInput default False;
    property ParentBiDiMode;
    property ParentColor default False;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Touch;
    property Visible;
    property StyleElements;
    property OnClick;
    property OnCloseUp: TNotifyEvent read FOnCloseUp write FOnCloseUp;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnContextPopup;
    property OnDropDown: TNotifyEvent read FOnDropDown write FOnDropDown;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnStartDock;
    property OnStartDrag;
    property OnUserInput: TDTParseInputEvent read FOnUserInput write FOnUserInput;
  end;

{ TPageScroller }

  TPageScrollerOrientation = (soHorizontal, soVertical);
  TPageScrollerButton = (sbFirst, sbLast);
  TPageScrollerButtonState = (bsNormal, bsInvisible, bsGrayed, bsDepressed, bsHot);

  TPageScrollEvent = procedure (Sender: TObject; Shift: TShiftState; X, Y: Integer;
    Orientation: TPageScrollerOrientation; var Delta: Integer) of object;

  TPageScroller = class(TWinControl)
  private
    FAutoScroll: Boolean;
    FButtonSize: Integer;
    FControl: TWinControl;
    FDragScroll: Boolean;
    FMargin: Integer;
    FOrientation: TPageScrollerOrientation;
    FPosition: Integer;
    FPreferredSize: Integer;
    FOnScroll: TPageScrollEvent;
    class constructor Create;
    class destructor Destroy;
    procedure CNNotify(var Message: TWMNotifyPS); message CN_NOTIFY;
    procedure DoSetControl(Value: TWinControl);
    procedure SetAutoScroll(Value: Boolean);
    procedure SetButtonSize(Value: Integer);
    procedure SetControl(Value: TWinControl);
    procedure SetDragScroll(Value: Boolean);
    procedure SetMargin(Value: Integer);
    procedure SetOrientation(Value: TPageScrollerOrientation);
    procedure SetPosition(Value: Integer);
    procedure UpdatePreferredSize;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
{$IFNDEF CLR}
    procedure CMControlChange(var Message: TCMControlChange); message CM_CONTROLCHANGE;
{$ENDIF}
  protected
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Scroll(Shift: TShiftState; X, Y: Integer;
      Orientation: TPageScrollerOrientation; var Delta: Integer); dynamic;
{$IFDEF CLR}
    procedure ControlChange(Inserting: Boolean; Child: TControl); override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    function GetButtonState(Button: TPageScrollerButton): TPageScrollerButtonState;
  published
    property Align;
    property Anchors;
    property AutoScroll: Boolean read FAutoScroll write SetAutoScroll default False;
    property BorderWidth;
    property ButtonSize: Integer read FButtonSize write SetButtonSize default 12;
    property Color;
    property Constraints;
    property Control: TWinControl read FControl write SetControl;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DragScroll: Boolean read FDragScroll write SetDragScroll default True;
    property Enabled;
    property Font;
    property Margin: Integer read FMargin write SetMargin default 0;
    property Orientation: TPageScrollerOrientation read FOrientation write SetOrientation default soHorizontal;
    property ParentBackground default True;
    property ParentColor;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Position: Integer read FPosition write SetPosition default 0;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property StyleElements;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseWheel;
    property OnResize;
    property OnScroll: TPageScrollEvent read FOnScroll write FOnScroll;
    property OnStartDock;
    property OnStartDrag;
  end;

{ TCustomComboBoxEx }

  TComboExItem = class(TListControlItem)
  private
    FSelectedImageIndex: TImageIndex;
    FOverlayImageIndex: TImageIndex;
    FIndent: Integer;
  protected
    procedure SetOverlayImageIndex(const Value: TImageIndex); virtual;
    procedure SetSelectedImageIndex(const Value: TImageIndex); virtual;
    procedure SetCaption(const Value: String); override;
    procedure SetData(const Value: TCustomData); override;
    procedure SetDisplayName(const Value: String); override;
    procedure SetImageIndex(const Value: TImageIndex); override;
    procedure SetIndex(Value: Integer); override;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property Indent: Integer read FIndent write FIndent default -1;
    property OverlayImageIndex: TImageIndex read FOverlayImageIndex
      write SetOverlayImageIndex default -1;
    property SelectedImageIndex: TImageIndex read FSelectedImageIndex
      write SetSelectedImageIndex default -1;
  end;

  TComboExItems = class(TListControlItems)
  private
    function GetComboItem(const Index: Integer): TComboExItem;
  protected
    procedure Notify(Item: TCollectionItem;
      Action: TCollectionNotification); override;
    procedure SetItem(const Index: Integer); virtual;
  public
    function Add: TComboExItem;
    function AddItem(const Caption: string; const ImageIndex, SelectedImageIndex,
      OverlayImageIndex, Indent: Integer; Data: TCustomData): TComboExItem;
    function Insert(Index: Integer): TComboExItem;
    property ComboItems[const Index: Integer]: TComboExItem read GetComboItem;
  end;

  TComboExItemsClass = class of TComboExItems;
  TComboExItemClass = class of TComboExItem;

  TCustomComboBoxEx = class;

  TComboBoxExStrings = class(TCustomComboBoxStrings)
  private
    FItems: TComboExItems;
    function GetSortType: TListItemsSortType;
    procedure SetItems(const Value: TComboExItems);
    procedure SetSortType(const Value: TListItemsSortType);
  protected
    function GetItemsClass: TComboExItemsClass; virtual;
    function GetItemClass: TComboExItemClass; virtual;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    constructor Create(Owner: TCustomComboBoxEx); reintroduce;
    destructor Destroy; override;
    function Add(const S: String): Integer; override;
    function AddItem(const Caption: string; const ImageIndex, SelectedImageIndex,
      OverlayImageIndex, Indent: Integer; Data: TCustomData): TComboExItem;
    function AddObject(const S: String; AObject: TObject): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Exchange(Index1: Integer; Index2: Integer); override;
    function Get(Index: Integer): String; override;
    function GetCapacity: Integer; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    function IndexOf(const S: String): Integer; override;
    function IndexOfName(const Name: String): Integer; override;
    procedure Insert(Index: Integer; const S: String); override;
    procedure Move(CurIndex: Integer; NewIndex: Integer); override;
    property SortType: TListItemsSortType read GetSortType write SetSortType;
    property ItemsEx: TComboExItems read FItems write SetItems;
  end;

  TComboBoxExStringsClass = class of TComboBoxExStrings;

{ TCustomComboBoxEx }

  TComboBoxExStyle = (csExDropDown, csExSimple, csExDropDownList);
  TComboBoxExStyleEx = (csExCaseSensitive, csExNoEditImage, csExNoEditImageIndent,
                        csExNoSizeLimit, csExPathWordBreak);
  TComboBoxExStyles = set of TComboBoxExStyleEx;

  TAutoCompleteOption = (acoAutoSuggest, acoAutoAppend, acoSearch,
    acoFilterPrefixes, acoUseTab, acoUpDownKeyDropsList, acoRtlReading);
  TAutoCompleteOptions = set of TAutoCompleteOption;

{$IFDEF CLR}
  TComboExInstance = class
  private
    FHandle: TFNWndProc;
  strict protected
    procedure Finalize; override;
  public
    property Handle: TFNWndProc read FHandle write FHandle;
  end;
{$ELSE}
  TComboExInstance = Pointer;
{$ENDIF}

(*$HPPEMIT ''*)
(*$HPPEMIT '#ifdef WIN32_LEAN_AND_MEAN'*)
(*$HPPEMIT '#include <shldisp.h>'*)
(*$HPPEMIT '#endif'*)
(*$HPPEMIT ''*)

  TCustomComboBoxEx = class(TCustomCombo)
  private
    FAutoCompleteIntf: IAutoComplete;
    FAutoCompleteOptions: TAutoCompleteOptions;
    FComboBoxExHandle: HWND;
    FComboBoxExDefProc: TWindowProcPtr;
    FComboBoxExInstance: TComboExInstance;
    FImageChangeLink: TChangeLink;
    FImages: TCustomImageList;
    FMemStream: TCollection;
    FReading: Boolean;
    FSaveIndex: Integer;
    FStyle: TComboBoxExStyle;
    FStyleEx: TComboBoxExStyles;
    FItemsEx: TComboExItems;
    FOnBeginEdit: TNotifyEvent;
    FOnEndEdit: TNotifyEvent;
    FEditText: string;
    class constructor Create;
    class destructor Destroy;
    function GetSelText: String;
    procedure ImageListChange(Sender: TObject);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetSelText(const Value: String);
    procedure SetStyle(Value: TComboBoxExStyle);
    procedure SetItemsEx(const Value: TComboExItems);
    procedure SetStyleEx(const Value: TComboBoxExStyles);
    function IsItemsExStored: Boolean;
    function GetDropDownCount: Integer;
    procedure UpdateAutoComplete;
    procedure SetAutoCompleteOptions(const Value: TAutoCompleteOptions);
    function GetEditText: string;
    function GetEditTextLength: integer;
  protected
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); override;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure ComboExWndProc(var Message: TMessage);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    function GetActionLinkClass: TControlActionLinkClass; override;
    function GetItemsClass: TCustomComboBoxStringsClass; override;
    function GetItemCount: Integer; override;
    function GetItemHt: Integer; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetDropDownCount(const Value: Integer); override;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WndProc(var Message: TMessage); override;
    procedure WMHelp(var Message: TWMHelp); message WM_HELP;
    /// <summary> Custom handler for WM_GETTEXTLENGTH message. </summary>
    procedure WMGetTextLength(var Message: TWMGetTextLength); message WM_GETTEXTLENGTH;
    /// <summary> Custom handler for WM_GETTEXT message. </summary>
    procedure WMGetText(var Message: TWMGetText); message WM_GETTEXT;
    /// <summary> Custom handler for WM_SETTEXT message. </summary>
    procedure WMSetText(var Message: TWMSetText); message WM_SETTEXT;
    /// <summary> Custom handler for CB_GETEDITSEL message. </summary>
    procedure CBGetEditSel(var Message: TMessage); message CB_GETEDITSEL;
    /// <summary> Custom handler for CB_SETEDITSEL message. </summary>
    procedure CBSetEditSel(var Message: TMessage); message CB_SETEDITSEL;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Focused: Boolean; override;
    procedure KeyPress(var Key: Char); override;
    property AutoCompleteOptions: TAutoCompleteOptions read FAutoCompleteOptions
      write SetAutoCompleteOptions default [acoAutoAppend];
    property DropDownCount: Integer read GetDropDownCount write SetDropDownCount default 8;
    property Images: TCustomImageList read FImages write SetImages;
    property ItemsEx: TComboExItems read FItemsEx write SetItemsEx stored IsItemsExStored;
    property SelText: string read GetSelText write SetSelText;
    property Style: TComboBoxExStyle read FStyle write SetStyle default csExDropDown;
    property StyleEx: TComboBoxExStyles read FStyleEx write SetStyleEx default [];
    property OnBeginEdit: TNotifyEvent read FOnBeginEdit write FOnBeginEdit;
    property OnEndEdit: TNotifyEvent read FOnEndEdit write FOnEndEdit;
  end;

{ TComboBoxEx }

  TComboBoxEx = class(TCustomComboBoxEx)
  strict private
    class constructor Create;
    class destructor Destroy;
  published
    property Align;
    property AutoCompleteOptions default [acoAutoAppend];
    property ItemsEx;
    property Style; {Must be published before Items}
    property StyleEx;
    property Action;
    property Anchors;
    property BiDiMode;
    property Color;
    property Constraints;
    property Ctl3D;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ItemHeight;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Touch;
    property Visible;
    property StyleElements;
    property OnBeginEdit;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnEndEdit;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseMove;
    property OnSelect;
    property OnStartDock;
    property OnStartDrag;
//    property Items;
    property Images;
    property DropDownCount;
  end;

{ TComboBoxExActionLink }

  TComboBoxExActionLink = class(TListActionLink)
  protected
    procedure AddItem(AnItem: TListControlItem); override;
    procedure AddItem(ACaption: String; AImageIndex: Integer;
      DataPtr: TCustomData); override;
  end;

function InitCommonControl(CC: Integer): Boolean;
procedure CheckCommonControl(CC: Integer);

const
  ComCtlVersionIE3 = $00040046;
  ComCtlVersionIE4 = $00040047;
  ComCtlVersionIE401 = $00040048;
  ComCtlVersionIE5 = $00050050;
  ComCtlVersionIE501 = $00050051;
  ComCtlVersionIE6 = $00060000;

function GetComCtlVersion: Integer;
procedure CheckToolMenuDropdown(ToolButton: TToolButton); deprecated;

type
  TTabControlStyleHook = class(TMouseTrackControlStyleHook)
  strict private
    FHotTabIndex: Integer;
    FMousePosition: TMouseTrackControlStyleHook.TMousePosition;
    FUpDownHandle: HWnd;
    FUpDownInstance: Pointer;
    FUpDownDefWndProc: Pointer;
    FUpDownLeftPressed, FUpDownRightPressed: Boolean;
    FUpDownMouseOnLeft, FUpDownMouseOnRight: Boolean;
    procedure AngleTextOut(Canvas: TCanvas; Angle: Integer; X, Y: Integer; const Text: string);
    function GetDisplayRect: TRect;
    function GetImages: TCustomImageList;
    function GetTabCount: Integer;
    function GetTabIndex: Integer;
    function GetTabPosition: TTabPosition;
    function GetTabRect(Index: Integer): TRect;
    function GetTabs(Index: Integer): string;
    function GetScrollOpposite: Boolean;
    procedure HookUpDownControl;
    procedure UpdateTabs(OldHotTab, HotTab: Integer);
    procedure UpdateUpDownArea;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure WMMouseMove(var Message: TMessage); message WM_MOUSEMOVE;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    procedure WMParentNotify(var Message: TMessage); message WM_PARENTNOTIFY;
  strict protected
    procedure DrawTab(Canvas: TCanvas; Index: Integer); virtual;
    function IndexOfTabAt(X, Y: Integer): Integer;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure PaintUpDown(Canvas: TCanvas); virtual;
    procedure UpDownWndProc(var Msg: TMessage); virtual;
    procedure WndProc(var Message: TMessage); override;
    property DisplayRect: TRect read GetDisplayRect;
    property HotTabIndex: Integer read FHotTabIndex;
    property Images: TCustomImageList read GetImages;
    property TabCount: Integer read GetTabCount;
    property TabIndex: Integer read GetTabIndex;
    property TabPosition: TTabPosition read GetTabPosition;
    property TabRect[Index: Integer]: TRect read GetTabRect;
    property Tabs[Index: Integer]: string read GetTabs;
    property ScrollOpposite: Boolean read GetScrollOpposite;
  public
    constructor Create(AControl: TWinControl); override;
    destructor Destroy; override;
  end;

  TDateTimePickerStyleHook = class(TMouseTrackControlStyleHook)
  strict private
    FDroppedDown, FMouseOnButton: Boolean;
    FUpDownHandle: HWnd;
    FUpDownInstance: Pointer;
    FUpDownDefWndProc: Pointer;
    FUpDownUpPressed, FUpDownDownPressed: Boolean;
    FUpDownMouseOnUp, FUpDownMouseOnDown: Boolean;
    FInitBorderInfo: Boolean;
    function GetButtonRect: TRect;
    function GetKind: TDateTimeKind;
    function GetDateMode: TDTDateMode;
    function GetChecked: Boolean;
    function GetShowCheckBox: Boolean;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure WMMouseMove(var Message: TWMMouse); message WM_MOUSEMOVE;
    procedure WMPaint(var Message: TMessage); message WM_PAINT;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMParentNotify(var Message: TWMParentNotify); message WM_PARENTNOTIFY;
  strict protected
    function AcceptMessage(var Message: TMessage): Boolean; override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure UpDownWndProc(var Msg: TMessage); virtual;
    procedure PaintUpDown(Canvas: TCanvas); virtual;
    procedure WndProc(var Message: TMessage); override;
    property ButtonRect: TRect read GetButtonRect;
    property Kind: TDateTimeKind read GetKind;
    property DateMode: TDTDateMode read GetDateMode;
    property Checked: Boolean read GetChecked;
    property ShowCheckBox: Boolean read GetShowCheckBox;
  public
    constructor Create(AControl: TWinControl); override;
    destructor Destroy; override;
  end;

  TTreeViewStyleHook = class(TScrollingStyleHook)
  strict private
    procedure TVMSetBkColor(var Message: TMessage); message TVM_SETBKCOLOR;
    procedure TVMSetTextColor(var Message: TMessage); message TVM_SETTEXTCOLOR;
    procedure WMMouseMove(var Msg: TWMMouse); message WM_MOUSEMOVE;
  strict protected
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  TListViewStyleHook = class(TScrollingStyleHook)
  strict private
    FHeaderHandle: HWnd;
    FHeaderInstance: Pointer;
    FDefHeaderProc: Pointer;
    FHotSection, FOldHotSection, FPressedSection: Integer;
    FHeaderLBtnDown: Boolean;
    procedure LVMSetBkColor(var Message: TMessage); message LVM_SETBKCOLOR;
    procedure LVMSetTextBkColor(var Message: TMessage); message LVM_SETTEXTBKCOLOR;
    procedure LVMSetTextColor(var Message: TMessage); message LVM_SETTEXTCOLOR;
    procedure WMMouseMove(var Message: TWMMouse); message WM_MOUSEMOVE;
    procedure WMNotify(var Message: TWMNotify); message WM_NOTIFY;
  strict protected
    procedure DrawHeaderSection(Canvas: TCanvas; R: TRect; Index: Integer;
      const Text: string; IsHot, IsPressed, IsBackground: Boolean); virtual;
    procedure HeaderWndProc(var Message: TMessage); virtual;
    procedure PaintHeader(DC: HDC); virtual;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
    destructor Destroy; override;
  end;

  TProgressBarStyleHook = class(TStyleHook)
  strict private
    function GetBarRect: TRect;
    function GetBorderWidth: Integer;
    function GetMax: Integer;
    function GetMin: Integer;
    function GetOrientation: TProgressBarOrientation;
    function GetPercent: Single;
    function GetPosition: Integer;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
  strict protected
    procedure PaintBar(Canvas: TCanvas); virtual;
    procedure PaintFrame(Canvas: TCanvas); virtual;
    procedure Paint(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
    property BarRect: TRect read GetBarRect;
    property BorderWidth: Integer read GetBorderWidth;
    property Max: Integer read GetMax;
    property Min: Integer read GetMin;
    property Orientation: TProgressBarOrientation read GetOrientation;
    property Position: Integer read GetPosition;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  TTrackBarStyleHook = class(TStyleHook)
  strict private
    FMouseOnThumb: Boolean;
    FThumbPressed: Boolean;
    procedure CNHScroll(var Message: TWMHScroll); message CN_HSCROLL;
    procedure CNVScroll(var Message: TWMVScroll); message CN_VSCROLL;
    procedure WMMouseMove(var Message: TWMMouse); message WM_MOUSEMOVE;
    procedure WMLButtonUp(var Message: TWMMouse); message WM_LBUTTONUP;
    procedure WMLButtonDown(var Message: TWMMouse); message WM_LBUTTONDOWN;
  strict protected
    function AcceptMessage(var Message: TMessage): Boolean; override;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  TStatusBarStyleHook = class(TStyleHook)
  strict protected
    procedure Paint(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
    /// <summary>
    ///    Override background painting
    /// </summary>
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  TToolBarStyleHook = class(TMouseTrackControlStyleHook)
  strict private
    FArrowDownButtonIndex: Integer;
    FHotButtonIndex: Integer;
    FImages: TCustomImageList;
    FRuntimeThemesEnabled: Boolean;
    procedure ApplyImageList;
    function GetButtonCount: Integer;
    function GetItemInfo(Index: Integer; Text: PChar; TextLen: Integer): TTBButtonInfo;
    function GetItemRect(Index: Integer): TRect;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    procedure WMMouseMove(var Message: TWMMouse); message WM_MOUSEMOVE;
    procedure WMNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  strict protected
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure MouseLeave; override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
    destructor Destroy; override;
  end;

  TCoolBarStyleHook = class(TStyleHook)
  strict private
    function GetBandText(Index: Integer): string;
    function GetBandRect(Index: Integer): TRect;
    function GetBandBorder(Index: Integer): TRect;
    function GetBandCount: Integer;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    procedure WMSize(var Message: TMessage); message WM_SIZE;
  strict protected
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  TUpDownStyleHook = class(TMouseTrackControlStyleHook)
  strict private
    FLeftPressed, FRightPressed: Boolean;
    FMouseOnLeft, FMouseOnRight: Boolean;
    function GetOrientation: TUDOrientation;
    procedure WMLButtonDblClk(var Message: TWMMouse); message WM_LBUTTONDBLCLK;
    procedure WMLButtonDown(var Message: TWMMouse); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMMouse); message WM_LBUTTONUP;
    procedure WMMouseMove(var Message: TWMMouse); message WM_MOUSEMOVE;
  strict protected
    procedure Paint(Canvas: TCanvas); override;
    procedure MouseLeave; override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  THeaderStyleHook = class(TMouseTrackControlStyleHook)
  strict private
    FPressedSectionIndex: Integer;
    FHotSectionIndex: Integer;
    procedure WMLButtonDown(var Message: TWMMouse); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMMouse); message WM_LBUTTONUP;
    procedure WMRButtonUp(var Message: TWMMouse); message WM_RBUTTONUP;
    procedure WMMouseMove(var Message: TWMMouse); message WM_MOUSEMOVE;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
  strict protected
    procedure DrawHeaderSection(Canvas: TCanvas; R: TRect; Index: Integer;
      const Text: string; IsPressed, IsHot, IsBackground: Boolean); virtual;
    procedure MouseLeave; override;
    procedure Paint(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  TPageScrollerStyleHook = class(TStyleHook)
  strict private
    procedure PGMSetBKColor(var Message: TMessage); message PGM_SETBKCOLOR;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
  strict protected
    procedure Paint(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  TComboBoxExStyleHook = class(TComboBoxStyleHook)
  strict private
    FDroppedDown: Boolean;
    FComboBoxHandle: HWnd;
    FComboBoxInstance: Pointer;
    FDefComboBoxProc: Pointer;
    FTempItemIndex: Integer;
    procedure InitComboBoxWnd;
    procedure PaintComboBoxWnd;
    procedure WMCommand(var Message: TWMCommand); message WM_COMMAND;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPaint;
    procedure WMParentNotify(var Message: TMessage); message WM_ParentNotify;
  strict protected
    procedure ComboBoxWndProc(var Msg: TMessage); virtual;
    procedure DoHotTrackTimer(Sender: TObject); override;
    procedure DrawComboBox(DC: HDC); virtual;
    procedure MouseLeave; override;
    procedure DrawListBoxItem(ADC: HDC; ARect: TRect; AIndex: Integer; ASelected: Boolean);
    procedure WndProc(var Message: TMessage); override;
    function IsChildHandle(AHandle: HWnd): Boolean; override;
  public
    constructor Create(AControl: TWinControl); override;
    destructor Destroy; override;
  end;

  TRichEditStyleHook = class(TScrollingStyleHook)
  strict private
    procedure EMSetBkgndColor(var Message: TMessage); message EM_SETBKGNDCOLOR;
    procedure EMSetCharFormat(var Message: TMessage); message EM_SETCHARFORMAT;
  strict protected
    procedure WndProc(var Message: TMessage); override;
  end;

implementation

{$WARN UNSUPPORTED_CONSTRUCT OFF}

uses
{$IFDEF CLR}
  System.Threading, System.Security, System.Security.Permissions, System.IO,
  WinUtils,
{$ELSE}
  Winapi.ActiveX,
{$ENDIF}
  Vcl.Printers, Vcl.Consts, System.RTLConsts, Vcl.ComStrs, Vcl.ActnList, Vcl.StdActns, System.Types,
  Winapi.UxTheme, Winapi.DwmApi, System.StrUtils, Winapi.CommDlg;

const
  SectionSizeArea = 8;
  ShellDllName = 'shell32.dll';
  RTFConversionFormat: TConversionFormat = (
    ConversionClass: TConversion;
    Extension: 'rtf');
  TextConversionFormat: TConversionFormat = (
    ConversionClass: TConversion;
    Extension: 'txt');
  RichEditModuleName = 'RICHED20.DLL';

{$IFDEF CLR}
type
  THandleWrapper = class(TObject)
  private
    FShellModule: THandle;
    FRichEditModule: THandle;
    procedure UnloadModules;
  strict protected
    procedure Finalize; override;
  public
    destructor Destroy; override;
    procedure InitializeRichEd20;
    procedure InitializeShell32;
  end;
{$ENDIF}

var
  ComCtlVersion: Integer;
  ConversionFormatList: TList;
{$IFDEF CLR}
  HandleWrapper: THandleWrapper;
{$ELSE}
  ShellModule: THandle;
  FRichEditModule: THandle;
{$ENDIF}

{$IFDEF CLR}
var
  { HeaderControl messages }
  _HDM_INSERTITEM: Integer    = HDM_INSERTITEMW;
  _HDM_SETITEM: Integer       = HDM_SETITEMW;

  { StatusBar  messages }
  _SB_SETTEXT: Integer        = SB_SETTEXTW;

  { TabControl messages }
  _TCM_GETITEM: Integer       = TCM_GETITEMW;
  _TCM_SETITEM: Integer       = TCM_SETITEMW;
  _TCM_INSERTITEM: Integer    = TCM_INSERTITEMW;

  { ToolBar messages }
  _TB_SAVERESTORE: Integer    = TB_SAVERESTOREW;
  _TB_ADDSTRING: Integer      = TB_ADDSTRINGW;
  _TB_SETBUTTONINFO: Integer  = TB_SETBUTTONINFOW;
  _TB_INSERTBUTTON: Integer   = TB_INSERTBUTTONW;

  { ComboBoxEx messages }
  _CBEM_GETITEM: Integer      = CBEM_GETITEMW;
  _CBEM_INSERTITEM: Integer   = CBEM_INSERTITEMW;
  _CBEM_SETITEM: Integer      = CBEM_SETITEMW;

  {Animate messages }
  _ACM_OPEN: Integer          = ACM_OPENW;

  { CoolBar messages }
  _RB_INSERTBAND: Integer     = RB_INSERTBANDW;
  _RB_SETBANDINFO: Integer    = RB_SETBANDINFOW;
  _RB_GETBANDINFO: Integer    = RB_GETBANDINFOW;
{$ELSE}
const
  { HeaderControl messages }
  _HDM_INSERTITEM    = HDM_INSERTITEM;
  _HDM_SETITEM       = HDM_SETITEM;

  { StatusBar  messages }
  _SB_SETTEXT        = SB_SETTEXT;

  { TabControl messages }
  _TCM_GETITEM       = TCM_GETITEM;
  _TCM_SETITEM       = TCM_SETITEM;
  _TCM_INSERTITEM    = TCM_INSERTITEM;

  { ToolBar messages }
  _TB_SAVERESTORE    = TB_SAVERESTORE;
  _TB_ADDSTRING      = TB_ADDSTRING;
  _TB_SETBUTTONINFO  = TB_SETBUTTONINFO;
  _TB_INSERTBUTTON   = TB_INSERTBUTTON;

  { ComboBoxEx messages }
  _CBEM_GETITEM      = CBEM_GETITEM;
  _CBEM_INSERTITEM   = CBEM_INSERTITEM;
  _CBEM_SETITEM      = CBEM_SETITEM;

  {Animate messages }
  _ACM_OPEN          = ACM_OPEN;

  { CoolBar messages }
  _RB_INSERTBAND     = RB_INSERTBAND;
  _RB_SETBANDINFO    = RB_SETBANDINFO;
  _RB_GETBANDINFO    = RB_GETBANDINFO;
{$ENDIF}

{$IFDEF CLR}
destructor THandleWrapper.Destroy;
begin
  UnloadModules;
  System.GC.SuppressFinalize(Self);
  inherited;
end;

procedure THandleWrapper.Finalize;
begin
  UnloadModules;
  inherited;
end;

procedure THandleWrapper.UnloadModules;
begin
  if FShellModule <> 0 then
  begin
    FreeLibrary(FShellModule);
    FShellModule := 0;
  end;
  if FRichEditModule <> 0 then
  begin
    FreeLibrary(FRichEditModule);
    FRichEditModule := 0;
  end;
end;


procedure THandleWrapper.InitializeRichEd20;
begin
  if FRichEditModule = 0 then
  begin
    FRichEditModule := LoadLibrary(RichEditModuleName);
    if FRichEditModule <= HINSTANCE_ERROR then FRichEditModule := 0;
  end;
end;

procedure THandleWrapper.InitializeShell32;
begin
  if FShellModule = 0 then
  begin
    FShellModule := SafeLoadLibrary(ShellDllName);
    if FShellModule <= HINSTANCE_ERROR then
      FShellModule := 0;
  end;
end;
{$ENDIF}

function InitCommonControl(CC: Integer): Boolean;
var
  ICC: TInitCommonControlsEx;
begin
{$IFDEF CLR}
  ICC.dwSize := Marshal.SizeOf(TypeOf(TInitCommonControlsEx));
{$ELSE}
  ICC.dwSize := SizeOf(TInitCommonControlsEx);
{$ENDIF}
  ICC.dwICC := CC;
  Result := InitCommonControlsEx(ICC);
  if not Result then InitCommonControls;
end;

procedure CheckCommonControl(CC: Integer);
begin
  if not InitCommonControl(CC) then
    raise EComponentError.CreateRes({$IFNDEF CLR}@{$ENDIF}SInvalidComCtl32);
end;

function GetShellModule: THandle;
begin
{$IFDEF CLR}
  if not Assigned(HandleWrapper) then
    HandleWrapper := THandleWrapper.Create;
  HandleWrapper.InitializeShell32;
  Result := HandleWrapper.FShellModule;
{$ELSE}
  if ShellModule = 0 then
  begin
    ShellModule := SafeLoadLibrary(ShellDllName);
    if ShellModule <= HINSTANCE_ERROR then
      ShellModule := 0;
  end;
  Result := ShellModule;
{$ENDIF}
end;

[FileIOPermission(SecurityAction.LinkDemand, Unrestricted=True)]
function GetComCtlVersion: Integer;
begin
  if ComCtlVersion = 0 then
    ComCtlVersion := GetFileVersion(comctl32);
  Result := ComCtlVersion;
end;

// Deprecated - use TToolButton.CheckMenuDropDown
procedure CheckToolMenuDropdown(ToolButton: TToolButton);
begin
  if ToolButton <> nil then ToolButton.CheckMenuDropdown;
end;

procedure SetComCtlStyle(Ctl: TWinControl; Value: Integer; UseStyle: Boolean);
var
  Style: Integer;
begin
  if Ctl.HandleAllocated then
  begin
    Style := GetWindowLong(Ctl.Handle, GWL_STYLE);
    if not UseStyle then Style := Style and not Value
    else Style := Style or Value;
    SetWindowLong(Ctl.Handle, GWL_STYLE, Style);
  end;
end;

function _Max(const A, B: Integer): Integer; inline;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;

{ TTabStrings }

type
  TTabStrings = class(TStrings)
  private
{$IFDEF CLR}
    FObjects: TList;
{$ENDIF}
    FTabControl: TCustomTabControl;
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
{$IFDEF CLR}
    constructor Create;
    destructor Destroy; override;
{$ENDIF}
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

procedure TabControlError(const S: string);
begin
  raise EListError.Create(S);
end;

{$IFDEF CLR}
constructor TTabStrings.Create;
begin
  inherited Create;
  FObjects := TList.Create;
end;

destructor TTabStrings.Destroy;
begin
  FObjects.Free;
  inherited Destroy;
end;
{$ENDIF}

procedure TTabStrings.Clear;
begin
  if SendMessage(FTabControl.Handle, TCM_DELETEALLITEMS, 0, 0) = 0 then
    TabControlError(sTabFailClear);
{$IFDEF CLR}
  FObjects.Clear;
{$ENDIF}
  FTabControl.TabsChanged;
end;

procedure TTabStrings.Delete(Index: Integer);
begin
  if SendMessage(FTabControl.Handle, TCM_DELETEITEM, Index, 0) = 0 then
    TabControlError(Format(sTabFailDelete, [Index]));
{$IFDEF CLR}
  FObjects.Delete(Index);
{$ENDIF}
  FTabControl.TabsChanged;
end;

function TTabStrings.Get(Index: Integer): string;
{$IFDEF CLR}
const
  BufSize = 4096;
  RTL: array[Boolean] of LongInt = (0, TCIF_RTLREADING);
var
  TCItem: TTCItem;
  Buffer: IntPtr;
begin
  TCItem.mask := TCIF_TEXT or RTL[FTabControl.UseRightToLeftReading];
  Buffer := Marshal.AllocHGlobal(BufSize);
  try
    TCItem.pszText := Buffer;
    TCItem.cchTextMax := BufSize;
    if SendGetStructMessage(FTabControl.Handle, _TCM_GETITEM, Index, TCItem, True) = 0 then
      TabControlError(Format(sTabFailRetrieve, [Index]));
    Result := Marshal.PtrToStringAuto(TCItem.pszText);
  finally
    // Win32 API doc states it may change the pszText member to point to a new
    // text instead of filling the supplied buffer. Must free the original
    // buffer and not the pszText member of TCItem, just in case.
    Marshal.FreeHGlobal(Buffer);
  end;
{$ELSE}
const
  RTL: array[Boolean] of LongInt = (0, TCIF_RTLREADING);
var
  TCItem: TTCItem;
  Buffer: array[0..4095] of Char;
begin
  TCItem.mask := TCIF_TEXT or RTL[FTabControl.UseRightToLeftReading];
  TCItem.pszText := Buffer;
  TCItem.cchTextMax := Length(Buffer);
  if SendMessage(FTabControl.Handle, TCM_GETITEM, Index, LPARAM(@TCItem)) = 0 then
    TabControlError(Format(sTabFailRetrieve, [Index]));
  Result := Buffer;
{$ENDIF}
end;

function TTabStrings.GetCount: Integer;
begin
  Result := SendMessage(FTabControl.Handle, TCM_GETITEMCOUNT, 0, 0);
end;

function TTabStrings.GetObject(Index: Integer): TObject;
{$IFDEF CLR}
begin
  Result := FObjects[Index];
{$ELSE}
var
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_PARAM;
  if SendMessage(FTabControl.Handle, TCM_GETITEM, Index, LPARAM(@TCItem)) = 0 then
    TabControlError(Format(sTabFailGetObject, [Index]));
  Result := TObject(TCItem.lParam);
{$ENDIF}
end;

procedure TTabStrings.Put(Index: Integer; const S: string);
const
  RTL: array[Boolean] of LongInt = (0, TCIF_RTLREADING);
var
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_TEXT or RTL[FTabControl.UseRightToLeftReading] or
    TCIF_IMAGE;
{$IFNDEF CLR}
  TCItem.pszText := PChar(S);
{$ELSE}
  TCItem.pszText := Marshal.StringToHGlobalAuto(S);
  try
{$ENDIF}
    TCItem.iImage := FTabControl.GetImageIndex(Index);
    if SendStructMessage(FTabControl.Handle, _TCM_SETITEM, Index, TCItem) = 0 then
      TabControlError(Format(sTabFailSet, [S, Index]));
    FTabControl.TabsChanged;
{$IFDEF CLR}
  finally
    Marshal.FreeHGlobal(TCItem.pszText);
  end;
{$ENDIF}
end;

procedure TTabStrings.PutObject(Index: Integer; AObject: TObject);
{$IFDEF CLR}
begin
  FObjects[Index] := AObject;
{$ELSE}
var
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_PARAM;
  TCItem.lParam := LPARAM(AObject);
  if SendMessage(FTabControl.Handle, TCM_SETITEM, Index, LPARAM(@TCItem)) = 0 then
    TabControlError(Format(sTabFailSetObject, [Index]));
{$ENDIF}
end;

procedure TTabStrings.Insert(Index: Integer; const S: string);
const
  RTL: array[Boolean] of LongInt = (0, TCIF_RTLREADING);
var
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_TEXT or RTL[FTabControl.UseRightToLeftReading] or TCIF_IMAGE;
{$IFNDEF CLR}
  TCItem.pszText := PChar(S);
{$ELSE}
  TCItem.pszText := Marshal.StringToHGlobalAuto(S);
  try
{$ENDIF}
    TCItem.iImage := FTabControl.GetImageIndex(Index);
    if SendStructMessage(FTabControl.Handle, _TCM_INSERTITEM, Index, TCItem) < 0 then
      TabControlError(Format(sTabFailSet, [S, Index]));
{$IFNDEF CLR}
    FTabControl.TabsChanged;
{$ELSE}
    FObjects.Insert(Index, nil);
    FTabControl.TabsChanged;
  finally
    Marshal.FreeHGlobal(TCItem.pszText);
  end;
{$ENDIF}
end;

procedure TTabStrings.SetUpdateState(Updating: Boolean);
begin
  FTabControl.FUpdating := Updating;
  SendMessage(FTabControl.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then
  begin
    FTabControl.Invalidate;
    FTabControl.TabsChanged;
  end;
end;

{ TCustomTabControl }

class constructor TCustomTabControl.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomTabControl, TTabControlStyleHook);
end;

constructor TCustomTabControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 289;
  Height := 193;
  TabStop := True;
  ControlStyle := [csAcceptsControls, csDoubleClicks, csPannable, csGestures];
  FTabs := TTabStrings.Create;
  TTabStrings(FTabs).FTabControl := Self;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
end;

class destructor TCustomTabControl.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomTabControl, TTabControlStyleHook);
end;

destructor TCustomTabControl.Destroy;
begin
  FreeAndNil(FCanvas);
  FreeAndNil(FTabs);
  FreeAndNil(FSaveTabs);
  FreeAndNil(FImageChangeLink);
  inherited Destroy;
end;

procedure TCustomTabControl.CMStyleChanged(var Message: TMessage);
begin
  inherited;
  if FScrollOpposite then ReAlign;
end;

function TCustomTabControl.CanChange: Boolean;
begin
  Result := True;
  if Assigned(FOnChanging) then FOnChanging(Self, Result);
end;

function TCustomTabControl.CanShowTab(TabIndex: Integer): Boolean;
begin
  Result := True;
end;

procedure TCustomTabControl.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomTabControl.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  inherited ChangeScale(M, D, isDpiChange);
  TabWidth := MulDiv(TabWidth, M, D);
  TabHeight := MulDiv(TabHeight, M, D);
end;

procedure TCustomTabControl.CreateParams(var Params: TCreateParams);
const
  AlignStyles: array[Boolean, TTabPosition] of DWORD =
    ((0, TCS_BOTTOM, TCS_VERTICAL, TCS_VERTICAL or TCS_RIGHT),
     (0, TCS_BOTTOM, TCS_VERTICAL or TCS_RIGHT, TCS_VERTICAL));
  TabStyles: array[TTabStyle] of DWORD = (TCS_TABS, TCS_BUTTONS,
    TCS_BUTTONS or TCS_FLATBUTTONS);
  RRStyles: array[Boolean] of DWORD = (0, TCS_RAGGEDRIGHT);
begin
  InitCommonControl(ICC_TAB_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, WC_TABCONTROL);
  with Params do
  begin
    Style := Style or WS_CLIPCHILDREN or
      AlignStyles[UseRightToLeftAlignment, FTabPosition] or
      TabStyles[FStyle] or RRStyles[FRaggedRight];
    if not TabStop then Style := Style or TCS_FOCUSNEVER;
    if FMultiLine then Style := Style or TCS_MULTILINE;
    if FMultiSelect then Style := Style or TCS_MULTISELECT;
    if FOwnerDraw and not (csDesigning in ComponentState) then
      Style := Style or TCS_OWNERDRAWFIXED;
    if FTabSize.X <> 0 then Style := Style or TCS_FIXEDWIDTH;
    if FHotTrack and (not (csDesigning in ComponentState)) then
      Style := Style or TCS_HOTTRACK;
    if FScrollOpposite then Style := Style or TCS_SCROLLOPPOSITE;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW) or
      CS_DBLCLKS;
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomTabControl.CreateWnd;
begin
  inherited CreateWnd;
  if (Images <> nil) and Images.HandleAllocated then
    Perform(TCM_SETIMAGELIST, 0, Images.Handle);
  if (FTabSize.X <> 0) or (FTabSize.Y <> 0) then UpdateTabSize;
  if FSaveTabs <> nil then
  begin
    FTabs.Assign(FSaveTabs);
    SetTabIndex(FSaveTabIndex);
    FSaveTabs.Free;
    FSaveTabs := nil;
  end;
end;

procedure TCustomTabControl.DrawTab(TabIndex: Integer; const Rect: TRect;
  Active: Boolean);
begin
  if Assigned(FOnDrawTab) then
    FOnDrawTab(Self, TabIndex, Rect, Active)
  else
    FCanvas.FillRect(Rect);
end;

function TCustomTabControl.GetDisplayRect: TRect;
begin
  Result := ClientRect;
  SendGetStructMessage(Handle, TCM_ADJUSTRECT, 0, Result, True);
  if TabPosition = tpTop then
    Inc(Result.Top, 2);
end;

function TCustomTabControl.GetImageIndex(TabIndex: Integer): Integer;
begin
  Result := TabIndex;
  if Assigned(FOnGetImageIndex) then FOnGetImageIndex(Self, TabIndex, Result);
end;

function TCustomTabControl.GetTabIndex: Integer;
begin
  Result := SendMessage(Handle, TCM_GETCURSEL, 0, 0);
end;

procedure TCustomTabControl.Loaded;
begin
  inherited Loaded;
  if Images <> nil then UpdateTabImages;
  if FScrollOpposite then ReAlign;
end;

procedure TCustomTabControl.SetHotTrack(Value: Boolean);
begin
  if FHotTrack <> Value then
  begin
    FHotTrack := Value;
    RecreateWnd;
  end;
end;

procedure TCustomTabControl.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Images) then
    Images := nil;
end;

procedure TCustomTabControl.SetImages(Value: TCustomImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if Images <> nil then
  begin
    Images.RegisterChanges(FImageChangeLink);
    Images.FreeNotification(Self);
    Perform(TCM_SETIMAGELIST, 0, Images.Handle);
  end
  else Perform(TCM_SETIMAGELIST, 0, 0);
end;

procedure TCustomTabControl.ImageListChange(Sender: TObject);
begin
  Perform(TCM_SETIMAGELIST, 0, TCustomImageList(Sender).Handle);
end;

function TCustomTabControl.InternalSetMultiLine(Value: Boolean): Boolean;
begin
  Result := FMultiLine <> Value;
  if Result then
  begin
    if not Value and ((TabPosition = tpLeft) or (TabPosition = tpRight)) then
      TabControlError(sTabMustBeMultiLine);
    FMultiLine := Value;
    if not Value then FScrollOpposite := False;
  end;
end;

procedure TCustomTabControl.SetMultiLine(Value: Boolean);
begin
  if InternalSetMultiLine(Value) then RecreateWnd;
end;

procedure TCustomTabControl.SetMultiSelect(Value: Boolean);
begin
  if FMultiSelect <> Value then
  begin
    FMultiSelect := Value;
    RecreateWnd;
  end;
end;

procedure TCustomTabControl.SetOwnerDraw(Value: Boolean);
begin
  if FOwnerDraw <> Value then
  begin
    FOwnerDraw := Value;
    RecreateWnd;
  end;
end;

procedure TCustomTabControl.SetRaggedRight(Value: Boolean);
begin
  if FRaggedRight <> Value then
  begin
    FRaggedRight := Value;
    SetComCtlStyle(Self, TCS_RAGGEDRIGHT, Value);
  end;
end;

procedure TCustomTabControl.SetScrollOpposite(Value: Boolean);
begin
  if FScrollOpposite <> Value then
  begin
    FScrollOpposite := Value;
    if Value then FMultiLine := Value;
    RecreateWnd;
  end;
end;

procedure TCustomTabControl.SetStyle(Value: TTabStyle);
begin
  if FStyle <> Value then
  begin
    if (Value <> tsTabs) and (TabPosition <> tpTop) then
      raise EInvalidOperation.Create(SInvalidTabStyle);
    ParentBackground := Value = tsTabs;
    FStyle := Value;
    RecreateWnd;
  end;
end;

procedure TCustomTabControl.SetTabHeight(Value: Smallint);
begin
  if FTabSize.Y <> Value then
  begin
    if Value < 0 then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [Self.Classname]);
    FTabSize.Y := Value;
    UpdateTabSize;
  end;
end;

procedure TCustomTabControl.SetTabIndex(Value: Integer);
begin
  if not (csDestroying in ComponentState) then
    SendMessage(Handle, TCM_SETCURSEL, Value, 0);
end;

procedure TCustomTabControl.SetTabPosition(Value: TTabPosition);
begin
  if FTabPosition <> Value then
  begin
    if (Value <> tpTop) and (Style <> tsTabs) then
      raise EInvalidOperation.Create(SInvalidTabPosition);
    FTabPosition := Value;
    if not MultiLine and ((Value = tpLeft) or (Value = tpRight)) then
      InternalSetMultiLine(True);
    RecreateWnd;
  end;
end;

procedure TCustomTabControl.SetTabs(Value: TStrings);
begin
  FTabs.Assign(Value);
end;

procedure TCustomTabControl.SetTabWidth(Value: Smallint);
var
  OldValue: Smallint;
begin
  if FTabSize.X <> Value then
  begin
    if Value < 0 then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [Self.Classname]);
    OldValue := FTabSize.X;
    FTabSize.X := Value;
    if (OldValue = 0) or (Value = 0) then RecreateWnd
    else UpdateTabSize;
  end;
end;

procedure TCustomTabControl.TabsChanged;
begin
  if not FUpdating then
  begin
    if HandleAllocated then
      SendMessage(Handle, WM_SIZE, SIZE_RESTORED,
        Integer(Word(Width) or Word(Height) shl 16));
    Realign;
  end;
end;

procedure TCustomTabControl.UpdateTabSize;
begin
  with FTabSize do
    SendMessage(Handle, TCM_SETITEMSIZE, 0, MakeLong(X, Y));
  TabsChanged;
end;

procedure TCustomTabControl.UpdateTabImages;
var
  I: Integer;
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_IMAGE;
  for I := 0 to FTabs.Count - 1 do
  begin
    TCItem.iImage := GetImageIndex(I);
    if SendStructMessage(Handle, _TCM_SETITEM, I, TCItem) = 0 then
      TabControlError(Format(sTabFailSet, [FTabs[I], I]));
  end;
  TabsChanged;
end;

procedure TCustomTabControl.CNDrawItem(var Message: TWMDrawItem);
var
  SaveIndex: Integer;
begin
  with Message.DrawItemStruct{$IFNDEF CLR}^{$ENDIF} do
  begin
    SaveIndex := SaveDC(hDC);
    FCanvas.Lock;
    try
      FCanvas.Handle := hDC;
      FCanvas.Font := Font;
      FCanvas.Brush := Brush;
      DrawTab(itemID, rcItem, itemState and ODS_SELECTED <> 0);
    finally
      FCanvas.Handle := 0;
      FCanvas.Unlock;
      RestoreDC(hDC, SaveIndex);
    end;
  end;
  Message.Result := 1;
end;

procedure TCustomTabControl.WMDestroy(var Message: TWMDestroy);
var
  FocusHandle: HWnd;
begin
  if (FTabs <> nil) and (FTabs.Count > 0) then
  begin
    FSaveTabs := TStringList.Create;
    FSaveTabs.Assign(FTabs);
    FSaveTabIndex := GetTabIndex;
  end;
  FocusHandle := GetFocus;
  if (FocusHandle <> 0) and ((FocusHandle = Handle) or
    IsChild(Handle, FocusHandle)) then
    Winapi.Windows.SetFocus(0);
  inherited;
  WindowHandle := 0;
end;

procedure TCustomTabControl.WMNotifyFormat(var Message: TWMNotifyFormat);
begin
  with Message do
    Result := DefWindowProc(Handle, Msg, From, Command);
end;

procedure TCustomTabControl.WMSize(var Message: TWMSize);
begin
  inherited;
  RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE);
end;

procedure TCustomTabControl.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated then Perform(WM_SIZE, 0, 0);
end;

procedure TCustomTabControl.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) then
  begin
    Message.Msg := WM_SYSCOLORCHANGE;
    DefaultHandler(Message);
  end;
end;

procedure TCustomTabControl.CMTabStopChanged(var Message: TMessage);
begin
  if not (csDesigning in ComponentState) then RecreateWnd;
end;

procedure TCustomTabControl.CNNotify(var Message: TWMNotify);
begin
  with Message do
    case NMHdr.code of
      TCN_SELCHANGE:
        Change;
      TCN_SELCHANGING:
        begin
          Result := 1;
          if CanChange then Result := 0;
        end;
    end;
end;

procedure TCustomTabControl.CMDialogChar(var Message: TCMDialogChar);
var
  I: Integer;
begin
  for I := 0 to FTabs.Count - 1 do
    if IsAccel(Message.CharCode, FTabs[I]) and CanShowTab(I) and CanFocus then
    begin
      Message.Result := 1;
      if CanChange then
      begin
        TabIndex := I;
        Change;
      end;
      Exit;
    end;
  inherited;
end;

procedure TCustomTabControl.AdjustClientRect(var Rect: TRect);
begin
  Rect := DisplayRect;
  inherited AdjustClientRect(Rect);
end;

function TCustomTabControl.IndexOfTabAt(X, Y: Integer): Integer;
var
  HitTest: TTCHitTestInfo;
begin
  Result := -1;
  if ClientRect.Contains(Point(X, Y)) then
    with HitTest do
    begin
      pt.X := X;
      pt.Y := Y;
      Result := TabCtrl_HitTest(Handle, HitTest);
    end;
end;

function TCustomTabControl.GetHitTestInfoAt(X, Y: Integer): THitTests;
var
  HitTest: TTCHitTestInfo;
begin
  Result := [];
  if ClientRect.Contains(Point(X, Y)) then
    with HitTest do
    begin
      pt.X := X;
      pt.Y := Y;
      if TabCtrl_HitTest(Handle, HitTest) <> -1 then
      begin
        if (flags and TCHT_NOWHERE) <> 0 then
          Include(Result, htNowhere);
        if (flags and TCHT_ONITEM) = TCHT_ONITEM then
          Include(Result, htOnItem)
        else
        begin
          if (flags and TCHT_ONITEM) <> 0 then
            Include(Result, htOnItem);
          if (flags and TCHT_ONITEMICON) <> 0 then
            Include(Result, htOnIcon);
          if (flags and TCHT_ONITEMLABEL) <> 0 then
            Include(Result, htOnLabel);
        end;
      end
      else
        Result := [htNowhere];
    end;
end;

function TCustomTabControl.TabRect(Index: Integer): TRect;
begin
  TabCtrl_GetItemRect(Handle, Index, Result);
end;

function TCustomTabControl.RowCount: Integer;
begin
  Result := TabCtrl_GetRowCount(Handle);
end;

procedure TCustomTabControl.ScrollTabs(Delta: Integer);
var
  Wnd: HWND;
  P: TPoint;
  Rect: TRect;
  I: Integer;
begin
  Wnd := FindWindowEx(Handle, 0, 'msctls_updown32', nil);
  if Wnd <> 0 then
  begin
    Winapi.Windows.GetClientRect(Wnd, Rect);
    if Delta < 0 then
      P.X := Rect.Left + 2
    else
      P.X := Rect.Right - 2;
    P.Y := Rect.Top + 2;
    for I := 0 to Abs(Delta) - 1 do
    with P do
      begin
        SendMessage(Wnd, WM_LBUTTONDOWN, 0, MakeLParam(X, Y));
        SendMessage(Wnd, WM_LBUTTONUP, 0, MakeLParam(X, Y));
      end;
  end;
end;

procedure TCustomTabControl.TCMAdjustRect(var Message: TTCMAdjustRect);
begin
  { Major hack around a problem in the Windows tab control. Don't try this
    at home. The tab control (4.71) will AV when in a TCM_ADJUSTRECT message
    when the height of the control is the same as the height of the tab (or the
    width of the control for tpBottom). This hack will return the last value
    successfully returned if an exception is encountered. This allows the
    control to function but the AV is still generated and and reported by the
    debugger. }
  try
    inherited;
    if (TabPosition <> tpTop) and (not Message.Larger) then
      FSavedAdjustRect := Message.Prc{$IFNDEF CLR}^{$ENDIF};
  except
    Message.Prc{$IFNDEF CLR}^{$ENDIF} := FSavedAdjustRect;
  end;
end;

function TCustomTabControl.GetTabs: TStrings;
begin
  if FSaveTabs <> nil then
    Result := FSaveTabs  // Use FSaveTabs while the window is deallocated
  else
    Result := FTabs;
end;

{ TTabControl }

class constructor TTabControl.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TTabControl, TTabControlStyleHook);
end;

class destructor TTabControl.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TTabControl, TTabControlStyleHook);
end;

{ TTabSheet }

constructor TTabSheet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Align := alClient;
  ControlStyle := ControlStyle + [csAcceptsControls, csNoDesignVisible,
    csParentBackground, csPannable];
  Visible := False;
  FTabVisible := True;
  FHighlighted := False;
end;

destructor TTabSheet.Destroy;
begin
  if FPageControl <> nil then
  begin
    if FPageControl.FUndockingPage = Self then FPageControl.FUndockingPage := nil;
    FPageControl.RemovePage(Self);
  end;
  inherited Destroy;
end;

procedure TTabSheet.PaintWindow(DC: HDC);
begin
  // It need to draw TGraphicControl
end;

procedure TTabSheet.DoHide;
begin
  if Assigned(FOnHide) then
    FOnHide(Self);
end;

procedure TTabSheet.DoShow;
begin
  if Assigned(FOnShow) then
    FOnShow(Self);
end;

function TTabSheet.GetPageIndex: Integer;
begin
  if FPageControl <> nil then
    Result := FPageControl.FPages.IndexOf(Self)
  else
    Result := -1;
end;

function TTabSheet.GetTabIndex: Integer;
var
  I: Integer;
begin
  Result := 0;
  if not FTabShowing then
    Dec(Result)
  else
    for I := 0 to PageIndex - 1 do
      if TTabSheet(FPageControl.FPages[I]).FTabShowing then
        Inc(Result);
end;

procedure TTabSheet.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
    with Params.WindowClass do
      style := style and not (CS_HREDRAW or CS_VREDRAW);
end;

procedure TTabSheet.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Reader.Parent is TPageControl then
    PageControl := TPageControl(Reader.Parent);
end;

procedure TTabSheet.SetImageIndex(Value: TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    if FTabShowing then
      FPageControl.UpdateTab(Self);
  end;
end;

procedure TTabSheet.SetPageControl(APageControl: TPageControl);
begin
  if FPageControl <> APageControl then
  begin
    if FPageControl <> nil then
      FPageControl.RemovePage(Self);
    Parent := APageControl;
    if APageControl <> nil then
      APageControl.InsertPage(Self);
  end;
end;

procedure TTabSheet.SetPageIndex(Value: Integer);
var
  I, MaxPageIndex: Integer;
begin
  if FPageControl <> nil then
  begin
    MaxPageIndex := FPageControl.FPages.Count - 1;
    if Value > MaxPageIndex then
      raise EListError.CreateResFmt({$IFNDEF CLR}@{$ENDIF}SPageIndexError, [Value, MaxPageIndex]);
    I := TabIndex;
    FPageControl.FPages.Move(PageIndex, Value);
    if I >= 0 then
      FPageControl.MoveTab(I, TabIndex);
  end;
end;

procedure TTabSheet.SetTabShowing(Value: Boolean);
var
  Index: Integer;
begin
  if FTabShowing <> Value then
    if Value then
    begin
      FTabShowing := True;
      FPageControl.InsertTab(Self);
    end else
    begin
      Index := TabIndex;
      FTabShowing := False;
      FPageControl.DeleteTab(Self, Index);
    end;
end;

procedure TTabSheet.SetTabVisible(Value: Boolean);
begin
  if FTabVisible <> Value then
  begin
    FTabVisible := Value;
    UpdateTabShowing;
  end;
end;

procedure TTabSheet.UpdateControlOriginalParentSize(AControl: TControl;
  var AOriginalParentSize: TPoint);
begin
  inherited;
  if (csLoading in ComponentState) then
  begin
    AOriginalParentSize.X := FDesignSize.X;
    AOriginalParentSize.Y := FDesignSize.Y;
  end;
  if not (csReading in ComponentState) and not HandleAllocated then
    Dec(AOriginalParentSize.X, BorderWidth * 2);
end;

procedure TTabSheet.UpdateTabShowing;
begin
  SetTabShowing((FPageControl <> nil) and FTabVisible);
end;

procedure TTabSheet.CMTextChanged(var Message: TMessage);
begin
  if FTabShowing then
    FPageControl.UpdateTab(Self);
end;

procedure TTabSheet.CMShowingChanged(var Message: TMessage);
begin
  inherited;
  if Showing then
  begin
    try
      DoShow
    except
      Application.HandleException(Self);
    end;
  end
  else
  if not Showing then
  begin
    try
      DoHide;
    except
      Application.HandleException(Self);
    end;
  end;
end;

procedure TTabSheet.SetHighlighted(Value: Boolean);
begin
  if not (csReading in ComponentState) then
    if Assigned(PageControl) then
      SendMessage(PageControl.Handle, TCM_HIGHLIGHTITEM, TabIndex,
        MakeLong(Word(Value), 0))
    else
      raise EInvalidOperation.Create(SPageControlNotSet);
  FHighlighted := Value;
end;

procedure TTabSheet.WMNCPaint(var Message: TWMNCPaint);
var
  DC: HDC;
  DrawRect: TRect;
  Details: TThemedElementDetails;
begin
  if StyleServices.Enabled and (BorderWidth > 0) then
  begin
    DC := GetWindowDC(Handle);
    try
      DrawRect := ClientRect;
      OffsetRect(DrawRect, BorderWidth, BorderWidth);
      with DrawRect do
        ExcludeClipRect(DC, Left, Top, Right, Bottom);
      SetWindowOrgEx(DC, -BorderWidth, -BorderWidth, nil);
      Details := StyleServices.GetElementDetails(ttBody);
      StyleServices.DrawParentBackground(Handle, DC, Details, False);
    finally
      ReleaseDC(Handle, DC);
    end;
    Message.Result := 0;
  end
  else
    inherited;
end;

procedure TTabSheet.WMEraseBkgnd(var Message: TWMEraseBkgnd);
var
  R: TRect;
  BorderSize: Integer;
  Details: TThemedElementDetails;
begin
  if (PageControl <> nil) and StyleServices.Enabled and
     (seClient in PageControl.StyleElements) and
     ((PageControl.Style = tsTabs) or TStyleManager.IsCustomStyleActive) then
  begin
    GetWindowRect(Handle, R);
    OffsetRect(R, -R.Left, -R.Top);
    BorderSize := ClientToParent(Point(0, 0)).X;
    InflateRect(R, BorderSize, BorderSize); // ttPane also contains the border that we don't want
    Details := StyleServices.GetElementDetails(ttPane);
    StyleServices.DrawElement(Message.DC, Details, R);
    Message.Result := 1;
  end
  else
    inherited;
end;

{ TPageControl }

constructor TPageControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csDoubleClicks, csOpaque, csPannable, csGestures];
  FPages := TList.Create;
end;

destructor TPageControl.Destroy;
var
  I: Integer;
begin
  for I := 0 to FPages.Count - 1 do TTabSheet(FPages[I]).FPageControl := nil;
  FPages.Free;
  inherited Destroy;
end;

procedure TPageControl.UpdateTabHighlights;
var
  I: Integer;
begin
  for I := 0 to PageCount - 1 do
    Pages[I].SetHighlighted(Pages[I].FHighlighted);
end;

procedure TPageControl.Loaded;
begin
  inherited Loaded;
  UpdateTabHighlights;
end;

function TPageControl.CanShowTab(TabIndex: Integer): Boolean;
begin
  Result := TTabSheet(FPages[PageIndexFromTabIndex(TabIndex)]).Enabled;
end;

procedure TPageControl.Change;
var
  Form: TCustomForm;
begin
  if TabIndex >= 0 then
    UpdateActivePage;
  if csDesigning in ComponentState then
  begin
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.Designer <> nil) then
      Form.Designer.Modified;
  end;
  inherited Change;
end;

procedure TPageControl.ChangeActivePage(Page: TTabSheet);
var
  ParentForm: TCustomForm;
begin
  if FActivePage <> Page then
  begin
    ParentForm := GetParentForm(Self);
    if (ParentForm <> nil) and (FActivePage <> nil) and
      FActivePage.ContainsControl(ParentForm.ActiveControl) then
    begin
      ParentForm.ActiveControl := FActivePage;
      if ParentForm.ActiveControl <> FActivePage then
      begin
        TabIndex := FActivePage.TabIndex;
        Exit;
      end;
    end;
    if Page <> nil then
    begin
      Page.BringToFront;
      Page.Visible := True;
      if (ParentForm <> nil) and (FActivePage <> nil) and
        (ParentForm.ActiveControl = FActivePage) then
        if Page.CanFocus then
          ParentForm.ActiveControl := Page else
          ParentForm.ActiveControl := Self;
      if not Page.TabVisible and TStyleManager.IsCustomStyleActive then
        RedrawWindow(Page.Handle, nil, 0, RDW_INVALIDATE or RDW_UPDATENOW);
    end;
    if FActivePage <> nil then FActivePage.Visible := False;
    FActivePage := Page;
    if (ParentForm <> nil) and (FActivePage <> nil) and
      (ParentForm.ActiveControl = FActivePage) then
      FActivePage.SelectFirst;
  end;
end;

procedure TPageControl.DeleteTab(Page: TTabSheet; Index: Integer);
var
  UpdateIndex: Boolean;
begin
  UpdateIndex := Page = ActivePage;
  Tabs.Delete(Index);
  if UpdateIndex then
  begin
    if Index >= Tabs.Count then
      Index := Tabs.Count - 1;
    TabIndex := Index;
  end;
  UpdateActivePage;
end;

procedure TPageControl.DoAddDockClient(Client: TControl; const ARect: TRect);
begin
  if FNewDockSheet <> nil then
    Client.Parent := FNewDockSheet;
end;

procedure TPageControl.DockOver(Source: TDragDockObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  R: TRect;
begin
  GetWindowRect(Handle, R);
  Source.DockRect := R;
  DoDockOver(Source, X, Y, State, Accept);
end;

procedure TPageControl.DoRemoveDockClient(Client: TControl);
begin
  if (FUndockingPage <> nil) and not (csDestroying in ComponentState) then
  begin
    SelectNextPage(True);
    FUndockingPage.Free;
    FUndockingPage := nil;
  end;
end;

function TPageControl.FindNextPage(CurPage: TTabSheet;
  GoForward, CheckTabVisible: Boolean): TTabSheet;
var
  I, StartIndex: Integer;
begin
  if FPages.Count <> 0 then
  begin
    StartIndex := FPages.IndexOf(CurPage);
    if StartIndex = -1 then
      if GoForward then StartIndex := FPages.Count - 1 else StartIndex := 0;
    I := StartIndex;
    repeat
      if GoForward then
      begin
        Inc(I);
        if I = FPages.Count then I := 0;
      end else
      begin
        if I = 0 then I := FPages.Count;
        Dec(I);
      end;
      Result := TTabSheet(FPages[I]);
      if not CheckTabVisible or Result.TabVisible then Exit;
    until I = StartIndex;
  end;
  Result := nil;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TPageControl.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
begin
  for I := 0 to FPages.Count - 1 do Proc(TComponent(FPages[I]));
end;

function TPageControl.GetImageIndex(TabIndex: Integer): Integer;
var
  I,
  Visible,
  NotVisible: Integer;
begin
  if Assigned(FOnGetImageIndex) then
    Result := inherited GetImageIndex(TabIndex) else
    begin
     { For a PageControl, TabIndex refers to visible tabs only. The control
     doesn't store }
      Visible := 0;
      NotVisible := 0;
      for I := 0 to FPages.Count - 1 do
      begin
        if not GetPage(I).TabVisible then Inc(NotVisible)
        else Inc(Visible);
        if Visible = TabIndex + 1 then Break;
      end;
      Result := GetPage(TabIndex + NotVisible).ImageIndex;
    end;
end;

function TPageControl.GetPageFromDockClient(Client: TControl): TTabSheet;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to PageCount - 1 do
  begin
    if (Client.Parent = Pages[I]) and (Client.HostDockSite = Self) then
    begin
      Result := Pages[I];
      Exit;
    end;
  end;
end;

function TPageControl.GetPage(Index: Integer): TTabSheet;
begin
  Result := TTabSheet(FPages[Index]);
end;

function TPageControl.GetPageCount: Integer;
begin
  Result := FPages.Count;
end;

procedure TPageControl.GetSiteInfo(Client: TControl; var InfluenceRect: TRect;
  MousePos: TPoint; var CanDock: Boolean);
begin
  CanDock := GetPageFromDockClient(Client) = nil;
  inherited GetSiteInfo(Client, InfluenceRect, MousePos, CanDock);
end;

procedure TPageControl.InsertPage(Page: TTabSheet);
begin
  FPages.Add(Page);
  Page.FPageControl := Self;
  Page.UpdateTabShowing;
end;

procedure TPageControl.InsertTab(Page: TTabSheet);
begin
  Tabs.InsertObject(Page.TabIndex, Page.Caption, Page);
  UpdateActivePage;
end;

procedure TPageControl.MoveTab(CurIndex, NewIndex: Integer);
begin
  Tabs.Move(CurIndex, NewIndex);
end;

procedure TPageControl.RemovePage(Page: TTabSheet);
var
  NextSheet: TTabSheet;
begin
  NextSheet := FindNextPage(Page, True, not (csDesigning in ComponentState));
  if NextSheet = Page then NextSheet := nil;
  Page.SetTabShowing(False);
  Page.FPageControl := nil;
  FPages.Remove(Page);
  SetActivePage(NextSheet);
end;

procedure TPageControl.SelectNextPage(GoForward: Boolean; CheckTabVisible: Boolean = True);
var
  Page: TTabSheet;
begin
  Page := FindNextPage(ActivePage, GoForward, CheckTabVisible);
  if (Page <> nil) and (Page <> ActivePage) and CanChange then
  begin
    SetActivePage(Page);
    Change;
  end;
end;

procedure TPageControl.SetActivePage(Page: TTabSheet);
begin
  if (Page <> nil) and (Page.PageControl <> Self) then
    Exit;
  FInSetActivePage := True;
  try
    ChangeActivePage(Page);
    if Page = nil then
      TabIndex := -1
    else
      if Page = FActivePage then
        TabIndex := Page.TabIndex;
  finally
    FInSetActivePage := False;
  end;
end;

procedure TPageControl.SetChildOrder(Child: TComponent; Order: Integer);
begin
  TTabSheet(Child).PageIndex := Order;
end;

procedure TPageControl.ShowControl(AControl: TControl);
begin
  if (AControl is TTabSheet) and (TTabSheet(AControl).PageControl = Self) then
    SetActivePage(TTabSheet(AControl));
  inherited ShowControl(AControl);
end;

procedure TPageControl.UpdateTab(Page: TTabSheet);
begin
  Tabs[Page.TabIndex] := Page.Caption;
end;

procedure TPageControl.UpdateActivePage;
begin
  if TabIndex >= 0 then
    SetActivePage(TTabSheet(Tabs.Objects[TabIndex]))
  else
    SetActivePage(nil);
end;

procedure TPageControl.CMDesignHitTest(var Message: TCMDesignHitTest);
var
  HitIndex: Integer;
  HitTestInfo: TTCHitTestInfo;
begin
  HitTestInfo.pt := SmallPointToPoint(Message.Pos);
  HitIndex := SendStructMessage(Handle, TCM_HITTEST, 0, HitTestInfo);
  if (HitIndex >= 0) and (HitIndex <> TabIndex) then
    Message.Result := 1;
end;

procedure TPageControl.CMDialogKey(var Message: TCMDialogKey);
begin
  if (Focused or Winapi.Windows.IsChild(Handle, Winapi.Windows.GetFocus)) and
    (Message.CharCode = VK_TAB) and (GetKeyState(VK_CONTROL) < 0) then
  begin
    SelectNextPage(GetKeyState(VK_SHIFT) >= 0);
    Message.Result := 1;
  end else
    inherited;
end;

{$IFDEF CLR}
function TPageControl.DockClient(DockSource: TDragDockObject; MousePos: TPoint): Integer;
{$ELSE}
procedure TPageControl.CMDockClient(var Message: TCMDockClient);
{$ENDIF}
var
  IsVisible: Boolean;
  DockCtl: TControl;
  I: Integer;
begin
{$IFNDEF CLR}
  with Message do
{$ENDIF}
  begin
    Result := 0;
    DockCtl := DockSource.Control;
    { First, look and see if the page is already docked. If it is,
      then simply move the page index to the end }
    for I := 0 to PageCount - 1 do
    begin
      if DockCtl.Parent = Pages[I] then
      begin
        { We did find it; just move the page to the end }
        Pages[I].PageIndex := PageCount - 1;
        Exit;
      end;
    end;
  
    FNewDockSheet := TTabSheet.Create(Self);
    try
      try
        if DockCtl is TCustomForm then
          FNewDockSheet.Caption := TCustomForm(DockCtl).Caption;
        FNewDockSheet.PageControl := Self;
        DockCtl.Dock(Self, DockSource.DockRect);
      except
        FNewDockSheet.Free;
        raise;
      end;
      IsVisible := DockCtl.Visible;
      FNewDockSheet.TabVisible := IsVisible;
      if IsVisible then
        ActivePage := FNewDockSheet;
      DockCtl.Align := alClient;
    finally
      FNewDockSheet := nil;
    end;
  end;
end;

procedure TPageControl.CMDockNotification(var Message: TCMDockNotification);
var
  I: Integer;
  S: string;
  Page: TTabSheet;
begin
  Page := GetPageFromDockClient(Message.Client);
  if Page <> nil then
    case Message.NotifyRec.ClientMsg of
      WM_SETTEXT:
        begin
{$IFDEF CLR}
          S := Marshal.PtrToStringAuto(IntPtr(Message.NotifyRec.MsgLParam));
{$ELSE}
          S := PChar(Message.NotifyRec.MsgLParam);
{$ENDIF}
          { Search for first CR/LF and end string there }
          for I := 1 to Length(S) do
            if CharInSet(S[I], [#13, #10]) then
            begin
              SetLength(S, I - 1);
              Break;
            end;
          Page.Caption := S;
        end;
      CM_VISIBLECHANGED:
        Page.TabVisible := Boolean(Message.NotifyRec.MsgWParam);
    end;
  inherited;
end;

{$IFDEF CLR}
function TPageControl.UndockClient(NewTarget, Client: TControl): Boolean;
{$ELSE}
procedure TPageControl.CMUnDockClient(var Message: TCMUnDockClient);
{$ENDIF}
var
  Page: TTabSheet;
begin
{$IFNDEF CLR}
  with Message do
  begin
    Result := 0;
{$ELSE}
  begin
    Result := True;
{$ENDIF}
    Page := GetPageFromDockClient(Client);
    if Page <> nil then
    begin
      FUndockingPage := Page;
      Client.Align := alNone;
    end;
  end;
end;

function TPageControl.GetDockClientFromMousePos(MousePos: TPoint): TControl;
var
  i, HitIndex: Integer;
  HitTestInfo: TTCHitTestInfo;
  Page: TTabSheet;
begin
  Result := nil;
  if DockSite then
  begin
    HitTestInfo.pt := MousePos;
    HitIndex := SendStructMessage(Handle, TCM_HITTEST, 0, HitTestInfo);
    if HitIndex >= 0 then
    begin
      Page := nil;
      for i := 0 to HitIndex do
        Page := FindNextPage(Page, True, True);
      if (Page <> nil) and (Page.ControlCount > 0) then
      begin
        Result := Page.Controls[0];
        if Result.HostDockSite <> Self then Result := nil;
      end;
    end;
  end;
end;

procedure TPageControl.WMLButtonDown(var Message: TWMLButtonDown);
var
  DockCtl: TControl;
begin
  inherited;
  DockCtl := GetDockClientFromMousePos(SmallPointToPoint(Message.Pos));
  if (DockCtl <> nil) and (Style = tsTabs) then
    DockCtl.BeginDrag(False);
end;

procedure TPageControl.WMLButtonDblClk(var Message: TWMLButtonDblClk);
var
  DockCtl: TControl;
begin
  inherited;
  DockCtl := GetDockClientFromMousePos(SmallPointToPoint(Message.Pos));
  if DockCtl <> nil then
    DockCtl.ManualDock(nil, nil, alNone);
end;

function TPageControl.GetActivePageIndex: Integer;
begin
  if ActivePage <> nil then
    Result := ActivePage.GetPageIndex
  else
    Result := -1;
end;

procedure TPageControl.SetActivePageIndex(const Value: Integer);
begin
  if (Value > -1) and (Value < PageCount) then
    ActivePage := Pages[Value]
  else
    ActivePage := nil;
end;

procedure TPageControl.SetTabIndex(Value: Integer);
begin
  inherited;
  if not FInSetActivePage and (Value >= 0) and (Value < FPages.Count) and
    Pages[Value].TabVisible then
  begin
    SetActivePage(Pages[PageIndexFromTabIndex(Value)]);
  end;
end;

procedure TPageControl.WMEraseBkGnd(var Message: TWMEraseBkGnd);
begin
  if (not StyleServices.Enabled) or (not ParentBackground) then
    inherited
  else
    Message.Result := 1;
end;

function TPageControl.PageIndexFromTabIndex(TabIndex: Integer): Integer;
var
  I: Integer;
begin
  // Tabs doesn't contain hidden TabSheets so the index
  // needs to be adjusted to account for any hidden pages.
  Result := TabIndex;
  for I := 0 to TabIndex do
    if not Pages[I].TabVisible then
      Inc(Result);
end;

{ TStatusPanel }

constructor TStatusPanel.Create(Collection: TCollection);
begin
  FWidth := 50;
  FBevel := pbLowered;
  FParentBiDiMode := True;
  inherited Create(Collection);
  ParentBiDiModeChanged;
end;

procedure TStatusPanel.Assign(Source: TPersistent);
begin
  if Source is TStatusPanel then
  begin
    Text := TStatusPanel(Source).Text;
    Width := TStatusPanel(Source).Width;
    Alignment := TStatusPanel(Source).Alignment;
    Bevel := TStatusPanel(Source).Bevel;
    Style := TStatusPanel(Source).Style;
  end
  else inherited Assign(Source);
end;

procedure TStatusPanel.SetBiDiMode(Value: TBiDiMode);
begin
  if Value <> FBiDiMode then
  begin
    FBiDiMode := Value;
    FParentBiDiMode := False;
    Changed(False);
  end;
end;

function TStatusPanel.IsBiDiModeStored: Boolean;
begin
  Result := not FParentBiDiMode;
end;

procedure TStatusPanel.SetParentBiDiMode(Value: Boolean);
begin
  if FParentBiDiMode <> Value then
  begin
    FParentBiDiMode := Value;
    ParentBiDiModeChanged;
  end;
end;

procedure TStatusPanel.ParentBiDiModeChanged;
begin
  if FParentBiDiMode then
  begin
    if GetOwner <> nil then
    begin
      BiDiMode := TStatusPanels(GetOwner).FStatusBar.BiDiMode;
      FParentBiDiMode := True;
    end;
  end;
end;

function TStatusPanel.UseRightToLeftReading: Boolean;
begin
  Result := SysLocale.MiddleEast and (BiDiMode <> bdLeftToRight);
end;

function TStatusPanel.UseRightToLeftAlignment: Boolean;
begin
  Result := SysLocale.MiddleEast and (BiDiMode = bdRightToLeft);
end;

function TStatusPanel.GetDisplayName: string;
begin
  Result := Text;
  if Result = '' then Result := inherited GetDisplayName;
end;

procedure TStatusPanel.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Changed(False);
  end;
end;

procedure TStatusPanel.SetBevel(Value: TStatusPanelBevel);
begin
  if FBevel <> Value then
  begin
    FBevel := Value;
    Changed(False);
  end;
end;

procedure TStatusPanel.SetStyle(Value: TStatusPanelStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Changed(False);
  end;
end;

procedure TStatusPanel.SetText(const Value: string);
begin
  if FText <> Value then
  begin
    FText := Value;
    Changed(False);
  end;
end;

procedure TStatusPanel.SetWidth(Value: Integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    Changed(True);
  end;
end;

{ TStatusPanels }

constructor TStatusPanels.Create(StatusBar: TCustomStatusBar);
begin
  if StatusBar <> nil then
    inherited Create(StatusBar.GetPanelClass)
  else
    inherited Create(TStatusPanel);
  FStatusBar := StatusBar;
end;

function TStatusPanels.Add: TStatusPanel;
begin
  Result := TStatusPanel(inherited Add);
end;

function TStatusPanels.GetItem(Index: Integer): TStatusPanel;
begin
  Result := TStatusPanel(inherited GetItem(Index));
end;

function TStatusPanels.GetOwner: TPersistent;
begin
  Result := FStatusBar;
end;

procedure TStatusPanels.SetItem(Index: Integer; Value: TStatusPanel);
begin
  inherited SetItem(Index, Value);
end;

procedure TStatusPanels.Update(Item: TCollectionItem);
begin
  if Item <> nil then
    FStatusBar.UpdatePanel(Item.Index, False)
  else
    FStatusBar.UpdatePanels(True, False);
end;

function TStatusPanels.AddItem(Item: TStatusPanel;
  Index: Integer): TStatusPanel;
begin
  if Item = nil then
    Result := FStatusBar.CreatePanel
  else
    Result := Item;
  if Assigned(Result) then
  begin
    Result.Collection := Self;
    if Index < 0 then
      Index := Count - 1;
    Result.Index := Index;
  end;
end;

function TStatusPanels.Insert(Index: Integer): TStatusPanel;
begin
  Result := AddItem(nil, Index);
end;

{ TCustomStatusBar }

class constructor TCustomStatusBar.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomStatusBar, TStatusBarStyleHook);
end;

constructor TCustomStatusBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csCaptureMouse, csClickEvents, csDoubleClicks, csOpaque, csGestures];
  Color := clBtnFace;
  Height := 19;
  Align := alBottom;
  FPanels := CreatePanels;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FSizeGrip := True;
  ParentFont := False;
  FUseSystemFont := True;
  SyncToSystemFont;
  FUpdatedPanels := False;
end;

class destructor TCustomStatusBar.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomStatusBar, TStatusBarStyleHook);
end;

destructor TCustomStatusBar.Destroy;
begin
  FCanvas.Free;
  FPanels.Free;
  inherited Destroy;
end;

procedure TCustomStatusBar.CreateParams(var Params: TCreateParams);
const
  GripStyles: array[Boolean] of DWORD = (CCS_TOP, SBARS_SIZEGRIP);
begin
  InitCommonControl(ICC_BAR_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, STATUSCLASSNAME);
  with Params do
  begin
    Style := Style or GripStyles[FSizeGrip and FSizeGripValid];
    if StyleServices.Enabled then
      WindowClass.style := WindowClass.style or CS_HREDRAW or CS_VREDRAW
    else
      WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomStatusBar.CreateWnd;
begin
  ValidateSizeGrip(False);
  inherited CreateWnd;
  SendMessage(Handle, SB_SETBKCOLOR, 0, ColorToRGB(Color));
  UpdatePanels(True, False);
  if FSimpleText <> '' then
    SendTextMessage(Handle, _SB_SETTEXT, 255, FSimpleText);
  if FSimplePanel then
    SendMessage(Handle, SB_SIMPLE, 1, 0);
end;

function TCustomStatusBar.DoHint: Boolean;
begin
  if Assigned(FOnHint) then
  begin
    FOnHint(Self);
    Result := True;
  end
  else Result := False;
end;

procedure TCustomStatusBar.DrawPanel(Panel: TStatusPanel; const Rect: TRect);
begin
  if Assigned(FOnDrawPanel) then
    FOnDrawPanel(Self, Panel, Rect)
  else
    FCanvas.FillRect(Rect);
end;

procedure TCustomStatusBar.SetPanels(Value: TStatusPanels);
begin
  FPanels.Assign(Value);
end;

procedure TCustomStatusBar.SetSimplePanel(Value: Boolean);
begin
  if FSimplePanel <> Value then
  begin
    FSimplePanel := Value;
    if HandleAllocated then
      SendMessage(Handle, SB_SIMPLE, Ord(FSimplePanel), 0);
  end;
end;

procedure TCustomStatusBar.DoRightToLeftAlignment(var Str: string;
  AAlignment: TAlignment; ARTLAlignment: Boolean);
begin
  if ARTLAlignment then ChangeBiDiModeAlignment(AAlignment);

  case AAlignment of
    taCenter: Insert(#9, Str, 1);
    taRightJustify: Insert(#9#9, Str, 1);
  end;
end;

procedure TCustomStatusBar.UpdateSimpleText;
const
  RTLReading: array[Boolean] of Longint = (0, SBT_RTLREADING);
begin
  DoRightToLeftAlignment(FSimpleText, taLeftJustify, UseRightToLeftAlignment);
  if HandleAllocated then
    SendTextMessage(Handle, _SB_SETTEXT, 255 or RTLReading[UseRightToLeftReading],
      FSimpleText);
end;

procedure TCustomStatusBar.SetSimpleText(const Value: string);
begin
  if FSimpleText <> Value then
  begin
    FSimpleText := Value;
    UpdateSimpleText;
  end;
end;

procedure TCustomStatusBar.CMBiDiModeChanged(var Message: TMessage);
var
  Loop: Integer;
begin
  inherited;
  if HandleAllocated then
    if not SimplePanel then
    begin
      for Loop := 0 to Panels.Count - 1 do
        if Panels[Loop].ParentBiDiMode then
          Panels[Loop].ParentBiDiModeChanged;
      UpdatePanels(True, True);
    end
    else
      UpdateSimpleText;
end;

procedure TCustomStatusBar.FlipChildren(AllLevels: Boolean);
var
  Loop, FirstWidth, LastWidth: Integer;
  APanels: TStatusPanels;
begin
  if HandleAllocated and
     (not SimplePanel) and (Panels.Count > 0) then
  begin
    { Get the true width of the last panel }
    LastWidth := ClientWidth;
    FirstWidth := Panels[0].Width;
    for Loop := 0 to Panels.Count - 2 do Dec(LastWidth, Panels[Loop].Width);
    { Flip 'em }
    APanels := TStatusPanels.Create(Self);
    try
      for Loop := 0 to Panels.Count - 1 do with APanels.Add do
        Assign(Self.Panels[Loop]);
      for Loop := 0 to Panels.Count - 1 do
        Panels[Loop].Assign(APanels[Panels.Count - Loop - 1]);
    finally
      APanels.Free;
    end;
    { Set the width of the last panel }
    if Panels.Count > 1 then
    begin
      Panels[Panels.Count-1].Width := FirstWidth;
      Panels[0].Width := LastWidth;
    end;
    UpdatePanels(True, True);
  end;
end;

procedure TCustomStatusBar.SetSizeGrip(Value: Boolean);
begin
  if FSizeGrip <> Value then
  begin
    FSizeGrip := Value;
    ValidateSizeGrip(True);
  end;
end;

procedure TCustomStatusBar.SyncToSystemFont;
begin
  if FUseSystemFont then
  begin
    Font := Screen.HintFont;
    Font.Color := clBtnText;
  end;
end;

procedure TCustomStatusBar.UpdatePanel(Index: Integer; Repaint: Boolean);
var
  Flags: Integer;
  S: string;
  PanelRect: TRect;
begin
  if HandleAllocated then
    with Panels[Index] do
    begin
      if not Repaint then
      begin
        FUpdateNeeded := True;
        SendGetStructMessage(Handle, SB_GETRECT, Index, PanelRect);
        InvalidateRect(Handle, PanelRect, True);
        Exit;
      end
      else if not FUpdateNeeded then Exit;
      FUpdateNeeded := False;
      Flags := 0;
      case Bevel of
        pbNone: Flags := SBT_NOBORDERS;
        pbRaised: Flags := SBT_POPOUT;
      end;
      if UseRightToLeftReading then Flags := Flags or SBT_RTLREADING;
      if Style = psOwnerDraw then Flags := Flags or SBT_OWNERDRAW;
      S := Text;
      if UseRightToLeftAlignment then
        DoRightToLeftAlignment(S, Alignment, UseRightToLeftAlignment)
      else
        case Alignment of
          taCenter: Insert(#9, S, 1);
          taRightJustify: Insert(#9#9, S, 1);
        end;
      SendTextMessage(Handle, _SB_SETTEXT, Index or Flags, S);
    end;
end;

procedure TCustomStatusBar.UpdatePanels(UpdateRects, UpdateText: Boolean);
const
  MaxPanelCount = 128;
var
  I, Count, PanelPos: Integer;
  PanelEdges: array[0..MaxPanelCount - 1] of Integer;
begin
  if HandleAllocated then
  begin
    Count := Panels.Count;
    if UpdateRects then
    begin
      if Count > MaxPanelCount then Count := MaxPanelCount;
      if Count = 0 then
      begin
        PanelEdges[0] := -1;
        SendStructMessage(Handle, SB_SETPARTS, 1, PanelEdges[0]);
        SendTextMessage(Handle, _SB_SETTEXT, 0, '');
      end else
      begin
        PanelPos := 0;
        for I := 0 to Count - 2 do
        begin
          Inc(PanelPos, Panels[I].Width);
          PanelEdges[I] := PanelPos;
        end;
        PanelEdges[Count - 1] := -1;
{$IFDEF CLR}
        SendArrayMessage(Handle, SB_SETPARTS, Count, PanelEdges);
{$ELSE}
        SendMessage(Handle, SB_SETPARTS, Count, LPARAM(@PanelEdges));
{$ENDIF}
      end;
    end;
    for I := 0 to Count - 1 do
      UpdatePanel(I, UpdateText);
  end;
end;

procedure TCustomStatusBar.CMWinIniChange(var Message: TWMWinIniChange);
begin
  inherited;
  if (Message.Unused = 0) or (Message.Unused = SPI_SETNONCLIENTMETRICS) then
    SyncToSystemFont;
end;

procedure TCustomStatusBar.CNDrawItem(var Message: TWMDrawItem);
var
  SaveIndex: Integer;
begin
  with Message.DrawItemStruct{$IFNDEF CLR}^{$ENDIF} do
  begin
    SaveIndex := SaveDC(hDC);
    FCanvas.Lock;
    try
      FCanvas.Handle := hDC;
      FCanvas.Font := Font;
      FCanvas.Brush.Color := clBtnFace;
      FCanvas.Brush.Style := bsSolid;
      DrawPanel(Panels[itemID], rcItem);
    finally
      FCanvas.Handle := 0;
      FCanvas.Unlock;
      RestoreDC(hDC, SaveIndex);
    end;
  end;
  Message.Result := 1;
end;

procedure TCustomStatusBar.WMGetTextLength(var Message: TWMGetTextLength);
begin
  if SimplePanel then
    Message.Result := Length(FSimpleText)
  else
    inherited;
end;

procedure TCustomStatusBar.WMPaint(var Message: TWMPaint);
begin
  if HandleAllocated and not FUpdatedPanels and
     not SimplePanel and (Panels.Count > 0) then
  begin
    FUpdatedPanels := True;
    UpdatePanels(True, True);
  end
  else
    UpdatePanels(False, True);
  inherited;
end;

procedure TCustomStatusBar.WMSize(var Message: TWMSize);
begin
  { Eat WM_SIZE message to prevent control from doing alignment }
  if not (csLoading in ComponentState) then Resize;
  Repaint;
end;

function TCustomStatusBar.IsFontStored: Boolean;
begin
  Result := not FUseSystemFont and not ParentFont and not DesktopFont;
end;

procedure TCustomStatusBar.SetUseSystemFont(const Value: Boolean);
begin
  if FUseSystemFont <> Value then
  begin
    FUseSystemFont := Value;
    if Value then
    begin
      if ParentFont then ParentFont := False;
      SyncToSystemFont;
    end;
  end;
end;

procedure TCustomStatusBar.CMColorChanged(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TCustomStatusBar.CMParentFontChanged(var Message: TCMParentFontChanged);
begin
  inherited;
  if FUseSystemFont and ParentFont then FUseSystemFont := False;
end;

function TCustomStatusBar.ExecuteAction(Action: TBasicAction): Boolean;
begin
  if AutoHint and not (csDesigning in ComponentState) and
     (Action is THintAction) and not DoHint then
  begin
    if SimplePanel or (Panels.Count = 0) then
      SimpleText := THintAction(Action).Hint else
      Panels[0].Text := THintAction(Action).Hint;
    Result := True;
  end
  else Result := inherited ExecuteAction(Action);
end;

procedure TCustomStatusBar.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TCustomStatusBar.CMSysFontChanged(var Message: TMessage);
begin
  inherited;
  SyncToSystemFont;
end;

procedure TCustomStatusBar.ChangeScale(M, D: Integer; isDpiChange: Boolean);
var
  I: Integer;
begin
  if UseSystemFont then  // status bar size based on system font size
    ScalingFlags := [sfHeight];
  inherited ChangeScale(M, D, isDpiChange);
  for I := 0 to Panels.Count - 1 do
    Panels[I].Width := MulDiv(Panels[I].Width, M, D)
end;

procedure TCustomStatusBar.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;
  ValidateSizeGrip(True);
end;

procedure TCustomStatusBar.SetParent(AParent: TWinControl);
begin
  inherited;
                                 
  //ValidateSizeGrip(False);
end;

procedure TCustomStatusBar.ValidateSizeGrip(ARecreate: Boolean);
var
  LForm: TCustomForm;
  LPoint: TPoint;
  LSizeGripValid: Boolean;
begin
  inherited;
  LSizeGripValid := False;
  LForm := GetParentForm(Self);
  if (LForm <> nil) and (LForm.BorderStyle in [bsSizeable, bsSizeToolWin]) then
  begin
    LPoint := ClientToParent(Point(Width, Height), LForm);
    LSizeGripValid := (LPoint.X = LForm.ClientWidth) and (LPoint.Y = LForm.ClientHeight);
  end;
  if LSizeGripValid <> FSizeGripValid then
  begin
    FSizeGripValid := LSizeGripValid;
    if ARecreate then
      RecreateWnd;
  end;
end;

function TCustomStatusBar.CreatePanel: TStatusPanel;
var
  LClass: TStatusPanelClass;
begin
  LClass := GetPanelClass;
  if Assigned(FOnCreatePanelClass) then
    FOnCreatePanelClass(Self, LClass);
  Result := LClass.Create(Panels);
end;

function TCustomStatusBar.CreatePanels: TStatusPanels;
begin
  Result := TStatusPanels.Create(Self);
end;

function TCustomStatusBar.GetPanelClass: TStatusPanelClass;
begin
  Result := TStatusPanel;
end;

procedure TCustomStatusBar.WMEraseBkGnd(var Message: TWMEraseBkGnd);
var
  Details: TThemedElementDetails;
begin
  if StyleServices.Enabled then
  begin
    Details := StyleServices.GetElementDetails(tsStatusRoot);
    StyleServices.DrawElement(Message.DC, Details, ClientRect, nil);
    Message.Result := 1;
  end
  else
    inherited;
end;

{ THeaderSection }

constructor THeaderSection.Create(Collection: TCollection);
begin
  FWidth := 50;
  FMaxWidth := 10000;
  FAllowClick := True;
  FImageIndex := -1;
  FParentBiDiMode := True;
  inherited Create(Collection);
  ParentBiDiModeChanged;
  FChecked := False;
  FCheckBox := False;
  FFixedWidth := False;
end;

procedure THeaderSection.Assign(Source: TPersistent);
begin
  if Source is THeaderSection then
  begin
    Text := THeaderSection(Source).Text;
    Width := THeaderSection(Source).Width;
    MinWidth := THeaderSection(Source).MinWidth;
    MaxWidth := THeaderSection(Source).MaxWidth;
    Alignment := THeaderSection(Source).Alignment;
    Style := THeaderSection(Source).Style;
    AllowClick := THeaderSection(Source).AllowClick;
    ImageIndex := THeaderSection(Source).ImageIndex;
    CheckBox := THeaderSection(Source).CheckBox;
    Checked := THeaderSection(Source).Checked;
  end
  else inherited Assign(Source);
end;

procedure THeaderSection.SetBiDiMode(Value: TBiDiMode);
begin
  if Value <> FBiDiMode then
  begin
    FBiDiMode := Value;
    FParentBiDiMode := False;
    Changed(False);
  end;
end;

function THeaderSection.IsBiDiModeStored: Boolean;
begin
  Result := not FParentBiDiMode;
end;

procedure THeaderSection.SetParentBiDiMode(Value: Boolean);
begin
  if FParentBiDiMode <> Value then
  begin
    FParentBiDiMode := Value;
    ParentBiDiModeChanged;
  end;
end;

procedure THeaderSection.ParentBiDiModeChanged;
begin
  if FParentBiDiMode then
  begin
    if GetOwner <> nil then
    begin
      BiDiMode := THeaderSections(GetOwner).FHeaderControl.BiDiMode;
      FParentBiDiMode := True;
    end;
  end;
end;

function THeaderSection.UseRightToLeftReading: Boolean;
begin
  Result := SysLocale.MiddleEast and (BiDiMode <> bdLeftToRight);
end;

function THeaderSection.UseRightToLeftAlignment: Boolean;
begin
  Result := SysLocale.MiddleEast and (BiDiMode = bdRightToLeft);
end;

function THeaderSection.GetDisplayName: string;
begin
  Result := Text;
  if Result = '' then Result := inherited GetDisplayName;
end;

function THeaderSection.GetLeft: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Index - 1 do
    Inc(Result, THeaderSections(Collection)[I].Width);
end;

function THeaderSection.GetRight: Integer;
begin
  Result := Left + Width;
end;

procedure THeaderSection.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Changed(False);
  end;
end;

procedure THeaderSection.SetAutoSize(Value: Boolean);
begin
  if Value <> FAutoSize then
  begin
    FAutoSize := Value;
    if THeaderSections(Collection).FHeaderControl <> nil then
      THeaderSections(Collection).FHeaderControl.AdjustSize;
  end;
end;

procedure THeaderSection.SetMaxWidth(Value: Integer);
begin
  if Value < FMinWidth then Value := FMinWidth;
  if Value > 10000 then Value := 10000;
  FMaxWidth := Value;
  SetWidth(FWidth);
end;

procedure THeaderSection.SetMinWidth(Value: Integer);
begin
  if Value < 0 then Value := 0;
  if Value > FMaxWidth then Value := FMaxWidth;
  FMinWidth := Value;
  SetWidth(FWidth);
end;

procedure THeaderSection.SetStyle(Value: THeaderSectionStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Changed(False);
  end;
end;

procedure THeaderSection.SetText(const Value: string);
begin
  if FText <> Value then
  begin
    FText := Value;
    Changed(False);
  end;
end;

procedure THeaderSection.SetWidth(Value: Integer);
begin
  if Value < FMinWidth then Value := FMinWidth;
  if Value > FMaxWidth then Value := FMaxWidth;
  if FWidth <> Value then
  begin
    FWidth := Value;
    if Collection <> nil then
      Changed(Index < Collection.Count - 1);
  end;
end;

procedure THeaderSection.SetImageIndex(const Value: TImageIndex);
begin
  if Value <> FImageIndex then
  begin
    FImageIndex := Value;
    Changed(False);
  end;
end;

procedure THeaderSection.SetCheckBox(Value: Boolean);
begin
  if Value <> FCheckBox then
  begin
    FCheckBox := Value;
    Changed(False);
  end;
end;

procedure THeaderSection.SetChecked(Value: Boolean);
begin
  if Value <> FChecked then
  begin
    FChecked := Value;
    Changed(False);
    THeaderSections(GetOwner).FHeaderControl.SectionCheck(Self);
  end;
end;

procedure THeaderSection.SetFixedWidth(Value: Boolean);
begin
  if Value <> FFixedWidth then
  begin
    FFixedWidth := Value;
    Changed(False);
  end;
end;

{ THeaderSections }

constructor THeaderSections.Create(HeaderControl: TCustomHeaderControl);
begin
  inherited Create(THeaderSection);
  FHeaderControl := HeaderControl;
end;

function THeaderSections.Add: THeaderSection;
begin
  Result := AddItem(nil, -1);
end;

function THeaderSections.GetItem(Index: Integer): THeaderSection;
begin
  Result := THeaderSection(inherited GetItem(Index));
end;

function THeaderSections.GetOwner: TPersistent;
begin
  Result := FHeaderControl;
end;

procedure THeaderSections.SetItem(Index: Integer; Value: THeaderSection);
begin
  inherited SetItem(Index, Value);
end;

procedure THeaderSections.Update(Item: TCollectionItem);
begin
  if Item <> nil then
    FHeaderControl.UpdateSection(Item.Index) else
    FHeaderControl.UpdateSections;
end;

function THeaderSections.AddItem(Item: THeaderSection;
  Index: Integer): THeaderSection;
begin
  if Item = nil then
    Result := FHeaderControl.CreateSection
  else
  begin
    Result := Item;
    if Assigned(Item) then
    begin
      Result.Collection := Self;
      if Index < Count then
        Index := Count - 1;
      Result.Index := Index;
    end;
  end;
end;

function THeaderSections.Insert(Index: Integer): THeaderSection;
begin
  Result := AddItem(nil, Index);
end;

{ TCustomHeaderControl }

class constructor TCustomHeaderControl.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomHeaderControl, THeaderStyleHook);
end;

constructor TCustomHeaderControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [];
  Align := alTop;
  Height := 17;
  FSections := CreateSections;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FFullDrag := True;
  FDragReorder := False;
  FSectionDragged := False;
  FUpdatingSectionOrder := False;
  FSectionStream := nil;
  FCheckBoxes := False;
  FNoSizing := False;
  FOverflow := False;
end;

class destructor TCustomHeaderControl.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomHeaderControl, THeaderStyleHook);
end;

destructor TCustomHeaderControl.Destroy;
begin
  FCanvas.Free;
  FSections.Free;
  FImageChangeLink.Free;
  if Assigned(FSectionStream) then FSectionStream.Free;
  inherited Destroy;
end;

procedure TCustomHeaderControl.CreateParams(var Params: TCreateParams);
const
  HeaderStyles: array[THeaderStyle] of DWORD = (HDS_BUTTONS, 0);
begin
  InitCommonControl(ICC_LISTVIEW_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, WC_HEADER);
  with Params do
  begin
    Style := Style or HeaderStyles[FStyle];
    if FFullDrag then Style := Style or HDS_FULLDRAG;
    if FHotTrack then Style := Style or HDS_HOTTRACK;
    if FDragReorder then Style := Style or HDS_DRAGDROP;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
    if CheckWin32Version(5, 1) and StyleServices.Enabled then
    begin
      if FCheckBoxes then
        Style := Style or HDS_CHECKBOXES;
      if FOverflow then
        Style := Style or HDS_OVERFLOW;
      if FNoSizing then
        Style := Style or HDS_NOSIZING;
    end;
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomHeaderControl.CreateWnd;

  procedure ReadSections;
  var
    Reader: TReader;
  begin
    if FSectionStream = nil then Exit;
    FSections.Free;
    FSections := CreateSections; // Ensure ID's start at zero
    Reader := TReader.Create(FSectionStream, 1024);
    try
      Reader.ReadValue;
      Reader.ReadCollection(Sections);
    finally
      Reader.Free;
    end;
    FSectionStream.Free;
    FSectionStream := nil;
  end;

begin
  inherited CreateWnd;
  if (Images <> nil) and Images.HandleAllocated then
    Header_SetImageList(Handle, Images.Handle);
  if FSectionStream <> nil then
    ReadSections
  else
    UpdateSections;
end;

procedure TCustomHeaderControl.ChangeScale(M, D: Integer; isDpiChange: Boolean);
var
  I: Integer;
begin
  inherited ChangeScale(M, D, isDpiChange);
  for I := 0 to Sections.Count - 1 do
    Sections[I].Width := MulDiv(Sections[I].Width, M, D);
end;

procedure TCustomHeaderControl.DestroyWnd;
var
  Writer: TWriter;
begin
  if csLoading in ComponentState then Exit;
  if (csRecreating in ControlState) then
  begin
    if FSectionStream = nil then
      FSectionStream := TMemoryStream.Create;
    Writer := TWriter.Create(FSectionStream, 1024);
    try
      Writer.WriteCollection(FSections);
    finally
      Writer.Free;
      FSectionStream.Position := 0;
    end;
  end;
  inherited DestroyWnd;
end;

procedure TCustomHeaderControl.CMBiDiModeChanged(var Message: TMessage);
var
  Loop: Integer;
begin
  inherited;
  if HandleAllocated then
    for Loop := 0 to Sections.Count - 1 do
      if Sections[Loop].ParentBiDiMode then
        Sections[Loop].ParentBiDiModeChanged;
end;

procedure TCustomHeaderControl.FlipChildren(AllLevels: Boolean);
var
  Loop, CurrentCount: Integer;
  SectionsList: THeaderSections;
begin
  if HandleAllocated and (Sections.Count > 1) then
  begin
    CurrentCount := Sections.Count;
    SectionsList := THeaderSections.Create(Self);
    try
      SectionsList.Assign(Sections);
      Sections.Clear;
      for Loop := 0 to CurrentCount - 1 do
        Sections.Add.Assign(SectionsList[CurrentCount - Loop - 1]);
    finally
      SectionsList.Free;
    end;
    UpdateSections;
  end;
end;

procedure TCustomHeaderControl.DrawSection(Section: THeaderSection;
  const Rect: TRect; Pressed: Boolean);
begin
  if Assigned(FOnDrawSection) then
    FOnDrawSection(Self, Section, Rect, Pressed) else
    FCanvas.FillRect(Rect);
end;

procedure TCustomHeaderControl.SectionClick(Section: THeaderSection);
begin
  if Assigned(FOnSectionClick) then FOnSectionClick(Self, Section);
end;

procedure TCustomHeaderControl.SectionCheck(Section: THeaderSection);
begin
  if Assigned(FOnSectionCheck) then FOnSectionCheck(Self, Section);
end;

procedure TCustomHeaderControl.SectionResize(Section: THeaderSection);
begin
  if Assigned(FOnSectionResize) then FOnSectionResize(Self, Section);
end;

procedure TCustomHeaderControl.SectionTrack(Section: THeaderSection;
  Width: Integer; State: TSectionTrackState);
begin
  if Assigned(FOnSectionTrack) then FOnSectionTrack(Self, Section, Width, State);
end;

procedure TCustomHeaderControl.SetFullDrag(Value: Boolean);
begin
  if FFullDrag <> Value then
  begin
    FFullDrag := Value;
    RecreateWnd;
  end;
end;

procedure TCustomHeaderControl.SetHotTrack(Value: Boolean);
begin
  if FHotTrack <> Value then
  begin
    FHotTrack := Value;
    RecreateWnd;
  end;
end;

procedure TCustomHeaderControl.SetStyle(Value: THeaderStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    RecreateWnd;
  end;
end;

procedure TCustomHeaderControl.SetCheckBoxes(Value: Boolean);
begin
  if FCheckBoxes <> Value then
  begin
    FCheckBoxes := Value;
    if CheckWin32Version(5, 1) and StyleServices.Enabled and HandleAllocated then
      RecreateWnd;
  end;
end;

procedure TCustomHeaderControl.SetNoSizing(Value: Boolean);
begin
  if FNoSizing <> Value then
  begin
    FNoSizing := Value;
    if CheckWin32Version(5, 1) and StyleServices.Enabled and HandleAllocated then
      RecreateWnd;
  end;
end;

procedure TCustomHeaderControl.SetOverflow(Value: Boolean);
begin
  if FOverflow <> Value then
  begin
    FOverflow := Value;
    if CheckWin32Version(5, 1) and StyleServices.Enabled and HandleAllocated then
      RecreateWnd;
  end;
end;

procedure TCustomHeaderControl.SetDragReorder(const Value: Boolean);
begin
  if FDragReorder <> Value then
  begin
    FDragReorder := Value;
      RecreateWnd;
  end;
end;

procedure TCustomHeaderControl.SetSections(Value: THeaderSections);
begin
  FSections.Assign(Value);
end;

procedure TCustomHeaderControl.UpdateItem(Message, Index: Integer);
var
  Item: THDItem;
  AAlignment: TAlignment;
begin
  with Sections[Index] do
  begin
{$IFNDEF CLR}
    FillChar(Item, SizeOf(Item), 0);
{$ENDIF}
    Item.mask := HDI_WIDTH or HDI_TEXT or HDI_FORMAT;
    Item.cxy := Width;
{$IFDEF CLR}
    Item.pszText := Marshal.StringToHGlobalAuto(Text);
    try
{$ELSE}
      Item.pszText := PChar(Text);
{$ENDIF}
      Item.cchTextMax := Length(Text);
      AAlignment := Alignment;
      if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
      case AAlignment of
        taLeftJustify: Item.fmt := HDF_LEFT;
        taRightJustify: Item.fmt := HDF_RIGHT;
      else
        Item.fmt := HDF_CENTER;
      end;
      if Style = hsOwnerDraw then
        Item.fmt := Item.fmt or HDF_OWNERDRAW else
        Item.fmt := Item.fmt or HDF_STRING;
      if CheckBox then
        Item.fmt := Item.fmt or HDF_CHECKBOX;
      if Checked then
        Item.fmt := Item.fmt or HDF_CHECKED;
      if FixedWidth then
        Item.fmt := Item.fmt or HDF_FIXEDWIDTH;
      if UseRightToLeftReading then Item.fmt := Item.fmt or HDF_RTLREADING;
      if Assigned(Images) and (FImageIndex >= 0) then
      begin
        Item.mask := Item.mask or HDI_IMAGE;
        Item.fmt := Item.fmt or HDF_IMAGE;
        Item.iImage := FImageIndex;
      end;
      SendStructMessage(Handle, Message, Index, Item);
{$IFDEF CLR}
    finally
      Marshal.FreeHGlobal(Item.pszText);
    end;
{$ENDIF}
  end;
end;

procedure TCustomHeaderControl.UpdateSection(Index: Integer);
begin
  if HandleAllocated then
    UpdateItem(_HDM_SETITEM, Index);
end;

procedure TCustomHeaderControl.UpdateSections;
var
  I: Integer;
begin
  if HandleAllocated and not FUpdatingSectionOrder then
  begin
    for I := 0 to SendMessage(Handle, HDM_GETITEMCOUNT, 0, 0) - 1 do
      SendMessage(Handle, HDM_DELETEITEM, 0, 0);
    for I := 0 to Sections.Count - 1 do
      UpdateItem(_HDM_INSERTITEM, I);
  end;
end;

procedure TCustomHeaderControl.CNDrawItem(var Message: TWMDrawItem);
var
  SaveIndex: Integer;
begin
  with Message.DrawItemStruct{$IFNDEF CLR}^{$ENDIF} do
  begin
    SaveIndex := SaveDC(hDC);
    FCanvas.Lock;
    try
      FCanvas.Handle := hDC;
      FCanvas.Font := Font;
      FCanvas.Brush.Color := clBtnFace;
      FCanvas.Brush.Style := bsSolid;
      DrawSection(Sections[itemID], rcItem, itemState and ODS_SELECTED <> 0);
    finally
      FCanvas.Handle := 0;
      FCanvas.Unlock;
      RestoreDC(hDC, SaveIndex);
    end;
  end;
  Message.Result := 1;
end;

procedure TCustomHeaderControl.CNNotify(var Message: TWMNotifyHC);
var
  Section: THeaderSection;
  TrackState: TSectionTrackState;
  hdi: THDItem;
  hdhti: THDHitTestInfo;
{$IFDEF CLR}
  HDNotify: THDNotify;
{$ELSE}
  HDNotify: PHDNotify;
{$ENDIF}
begin
  HDNotify := Message.HDNotify;
  with HDNotify{$IFNDEF CLR}^{$ENDIF} do
    case Hdr.code of
      HDN_ITEMCLICKA, HDN_ITEMCLICKW:
        SectionClick(Sections[Item]);
      HDN_ITEMSTATEICONCLICK:
        begin
          Section := GetSectionFromIndex(Item);
          Section.Checked := not Section.Checked;
        end;
      HDN_ITEMCHANGEDA, HDN_ITEMCHANGEDW:
        begin
{$IFDEF CLR}
          hdi := THDItem(Marshal.PtrToStructure(PItem, TypeOf(THDItem)));
          with hdi do
{$ELSE}
          with PItem^ do
{$ENDIF}
          begin
            if mask and HDI_WIDTH <> 0 then
            begin
              Section := GetSectionFromIndex(Item);
              if Section.FWidth <> cxy then
              begin
                Section.FWidth := cxy;
                SectionResize(Section);
              end;
            end;
          end;
        end;
      HDN_BEGINTRACKA, HDN_BEGINTRACKW, HDN_TRACKA, HDN_TRACKW,
      HDN_ENDTRACKA, HDN_ENDTRACKW:
        begin
          Section := GetSectionFromIndex(Item);
          case Hdr.code of
            HDN_BEGINTRACKA, HDN_BEGINTRACKW: TrackState := tsTrackBegin;
            HDN_ENDTRACKA, HDN_ENDTRACKW: TrackState := tsTrackEnd;
          else
            TrackState := tsTrackMove;
          end;
          try
            if TrackState <> tsTrackEnd then
            begin
              FTrackSection := Section;
              FTrackWidth := Section.Width;
              FTrackPos := SmallPoint(GetMessagePos);
              Winapi.Windows.ScreenToClient(Handle, FTrackPos);
            end;
{$IFDEF CLR}
            hdi := THDItem(Marshal.PtrToStructure(PItem, TypeOf(THDItem)));
            with hdi do
{$ELSE}
            with PItem^ do
{$ENDIF}
            begin
              if cxy < Section.FMinWidth then
                cxy := Section.FMinWidth;
              if cxy > Section.FMaxWidth then
                cxy := Section.FMaxWidth;
              SectionTrack(Section, cxy, TrackState);
{$IFDEF CLR}
              Marshal.WriteInt32(PItem, Integer(Marshal.OffsetOf(TypeOf(THDItem), 'cxy')), cxy);
{$ENDIF}
            end;
          finally
            if TrackState = tsTrackEnd then
              FTrackSection := nil;
          end;
        end;
      HDN_ENDDRAG:
        begin
          hdhti.Point := SmallPoint(GetMessagePos);
          Winapi.Windows.ScreenToClient(Handle, hdhti.Point);
          hdhti.Point.Y := ClientHeight div 2;
          SendStructMessage(Handle, HDM_HITTEST, 0, hdhti);
          hdi.Mask := HDI_ORDER;
          if hdhti.Item < 0 then
            if (HHT_TOLEFT and hdhti.Flags) <> 0 then
              FToIndex := 0
            else begin
              if ((HHT_TORIGHT and hdhti.Flags) <> 0)
              or ((HHT_NOWHERE and hdhti.Flags) <> 0) then
                FToIndex := Sections.Count - 1
            end
          else begin
            Header_GetItem(Handle, hdhti.Item, hdi);
            FToIndex := hdi.iOrder;
          end;
          Header_GetItem(Handle, Item, hdi);
          FFromIndex := hdi.iOrder;
          FSectionDragged := DoSectionDrag(Sections[FFromIndex], Sections[FToIndex]);
          Message.Result := LRESULT(not FSectionDragged);
          if GetCapture <> Self.Handle then
            SetCapture(Self.Handle);
        end;
      NM_RELEASEDCAPTURE:
        if FSectionDragged then DoSectionEndDrag;
    end;
{$IFDEF CLR}
  Message.HDNotify := HDNotify;
{$ENDIF}
end;

procedure TCustomHeaderControl.WndProc(var Message: TMessage);
var
  cxy: Integer;
  ShortCircuit: Boolean;
{$IFDEF CLR}
  MouseMsg: TWMMouse;
{$ENDIF}

  function FullWindowUpdate: Boolean;
  var
    DragWindows: Bool;
  begin
    Result := FullDrag and SystemParametersInfo(SPI_GETDRAGFULLWINDOWS, 0,
      {$IFNDEF CLR}@{$ENDIF}DragWindows, 0) and DragWindows;
  end;

begin
  if (Message.Msg = WM_MOUSEMOVE) and FullWindowUpdate and
    (FTrackSection <> nil) and MouseCapture then
  begin
{$IFDEF CLR}
    MouseMsg := TWMMouse.Create(Message);
    cxy := FTrackWidth + MouseMsg.XPos - FTrackPos.X;
{$ELSE}
    cxy := FTrackWidth + (TWMMouse(Message).XPos - FTrackPos.X);
{$ENDIF}
    ShortCircuit := False;
    if cxy < FTrackSection.FMinWidth then
    begin
      Dec(cxy, FTrackSection.FMinWidth);
      ShortCircuit := True;
    end;
    if cxy > FTrackSection.FMaxWidth then
    begin
      Dec(cxy, FTrackSection.FMaxWidth);
      ShortCircuit := True;
    end;
    SectionTrack(FTrackSection, cxy, tsTrackMove);
    if ShortCircuit then
{$IFDEF CLR}
      MouseMsg.XPos := MouseMsg.XPos - cxy;
{$ELSE}
      Dec(TWMMouse(Message).XPos, cxy);
{$ENDIF}
  end;
  inherited WndProc(Message);
end;

procedure TCustomHeaderControl.WMLButtonDown(var Message: TWMLButtonDown);
var
  Index: Integer;
  Info: THDHitTestInfo;
begin
  Info.Point.X := Message.Pos.X;
  Info.Point.Y := Message.Pos.Y;
  Index := SendGetStructMessage(Handle, HDM_HITTEST, 0, Info, True);
  if (Index < 0) or (Info.Flags and HHT_ONHEADER = 0) or
    Sections[Index].AllowClick then inherited;
end;

procedure TCustomHeaderControl.WMSize(var Message: TWMSize);
var
  I, Count, WorkWidth, TmpWidth, Remain: Integer;
  List: TList;
  Section: THeaderSection;
begin
  inherited;
  if HandleAllocated and not (csReading in ComponentState) then
  begin
    { Try to fit all sections within client width }
    List := TList.Create;
    try
      WorkWidth := ClientWidth;
      for I := 0 to Sections.Count - 1 do
      begin
        Section := Sections[I];
        if Section.AutoSize then
          List.Add(Section)
        else
          Dec(WorkWidth, Section.Width);
      end;
      if List.Count > 0 then
      begin
        Sections.BeginUpdate;
        try
          repeat
            Count := List.Count;
            Remain := WorkWidth mod Count;
            { Try to redistribute sizes to those sections which can take it }
            TmpWidth := WorkWidth div Count;
            for I := Count - 1 downto 0 do
            begin
              Section := THeaderSection(List[I]);
              if I = 0 then
                Inc(TmpWidth, Remain);
              Section.Width := TmpWidth;
            end;

            { Verify new sizes don't conflict with min/max section widths and
              adjust if necessary. }
            TmpWidth := WorkWidth div Count;
            for I := Count - 1 downto 0 do
            begin
              Section := THeaderSection(List[I]);
              if I = 0 then
                Inc(TmpWidth, Remain);
              if Section.Width <> TmpWidth then
              begin
                List.Delete(I);
                Dec(WorkWidth, Section.Width);
              end;
            end;
          until (List.Count = 0) or (List.Count = Count);
        finally
          Sections.EndUpdate;
        end;
      end;
    finally
      List.Free;
    end;
  end;
end;

procedure TCustomHeaderControl.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
  Invalidate;
end;

function TCustomHeaderControl.GetSectionFromIndex(Index: Integer): THeaderSection;
var
  OrderArray: TIntegerDynArray;
  I: Integer;
begin
  SetLength(OrderArray, Sections.Count);
{$IFDEF CLR}
  Header_GetOrderArray(Handle, Sections.Count, OrderArray);
{$ELSE}
  Header_GetOrderArray(Handle, Sections.Count, PInteger(OrderArray));
{$ENDIF}
  result := nil;
  for I := 0 to Length(OrderArray) - 1 do
    if OrderArray[I] = Index then
      result := Sections[I];
end;

function TCustomHeaderControl.DoSectionDrag(FromSection, ToSection: THeaderSection): Boolean;
begin
  Result := True;
  SectionDrag(FromSection, ToSection, Result);
end;

procedure TCustomHeaderControl.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Images) then
    Images := nil;
end;

procedure TCustomHeaderControl.SetImages(Value: TCustomImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if Images <> nil then
  begin
    Images.RegisterChanges(FImageChangeLink);
    Images.FreeNotification(Self);
    Header_SetImageList(Handle, Images.Handle);
  end
  else Header_SetImageList(Handle, 0);
  UpdateSections;
end;

procedure TCustomHeaderControl.ImageListChange(Sender: TObject);
begin
  Header_SetImageList(Handle, TCustomImageList(Sender).Handle);
  UpdateSections;
end;

procedure TCustomHeaderControl.SectionDrag(FromSection, ToSection: THeaderSection;
  var AllowDrag: Boolean);
begin
  if Assigned(FOnSectionDrag) then FOnSectionDrag(Self, FromSection, ToSection,
    AllowDrag);
end;

procedure TCustomHeaderControl.DoSectionEndDrag;

  procedure UpdateSectionOrder(FromSection, ToSection: THeaderSection);
  var
    I: Integer;
    SectionOrder: array of Integer;
  begin
    FUpdatingSectionOrder := True;
    try
      Sections.FindItemID(FromSection.ID).Index := ToSection.Index;
      SetLength(SectionOrder, Sections.Count);
      for I := 0 to Sections.Count - 1 do
        SectionOrder[I] := Sections[I].ID;
{$IFDEF CLR}
      Header_SetOrderArray(Handle, Sections.Count, SectionOrder);
{$ELSE}
      Header_SetOrderArray(Handle, Sections.Count, PInteger(SectionOrder));
{$ENDIF}
    finally
      FUpdatingSectionOrder := False;
    end;
  end;

begin
  FSectionDragged := False;
  UpdateSectionOrder(Sections[FFromIndex], Sections[FToIndex]);
  SectionEndDrag;
end;

procedure TCustomHeaderControl.SectionEndDrag;
begin
  if Assigned(FOnSectionEndDrag) then FOnSectionEndDrag(Self);
end;

function TCustomHeaderControl.CreateSection: THeaderSection;
var
  LClass: THeaderSectionClass;
begin
  LClass := THeaderSection;
  if Assigned(FOnCreateSectionClass) then
    FOnCreateSectionClass(Self, LClass);
  Result := LClass.Create(Sections);
end;

function TCustomHeaderControl.CreateSections: THeaderSections;
begin
  Result := THeaderSections.Create(Self);
end;

{ TTreeNode }

{$IFNDEF CLR}
function DefaultTreeViewSort(Node1, Node2: TTreeNode; lParam: Integer): Integer; stdcall;
begin
  with Node1 do
    if Assigned(TreeView.OnCompare) then
      TreeView.OnCompare(TreeView, Node1, Node2, lParam, Result)
    else Result := lstrcmp(PChar(Node1.Text), PChar(Node2.Text));
end;
{$ENDIF}

procedure TreeViewError(const Msg: string);
begin
  raise ETreeViewError.Create(Msg);
end;

procedure TreeViewErrorFmt(const Msg: string; const Format: array of const);
begin
  raise ETreeViewError.CreateFmt(Msg, Format);
end;

constructor TTreeNode.Create(AOwner: TTreeNodes);
begin
  inherited Create;
  FOverlayIndex := -1;
  FStateIndex := -1;
  FOwner := AOwner;
  FEnabled := True;
end;

destructor TTreeNode.Destroy;
var
  Node: TTreeNode;
  CheckValue: Integer;
begin
  Owner.ClearCache;
  FDeleting := True;
  if Owner.Owner <> nil then
    Owner.Owner.FSelections.Remove(Self);
  if Owner.Owner.FLastDropTarget = Self then
    Owner.Owner.FLastDropTarget := nil;
  Node := Parent;
  if (Node <> nil) and (not Node.Deleting) then
  begin
    if Node.IndexOf(Self) <> -1 then
      CheckValue := 1
    else
      CheckValue := 0;
    if Node.CompareCount(CheckValue) then
    begin
      Expanded := False;
      Node.HasChildren := False;
    end;
  end;
  if (Owner.Owner <> nil) and
     not (Owner.Owner.FCreateWndRestores and (csRecreating in Owner.Owner.ControlState)) then
    Owner.Owner.Delete(Self);
  if ItemId <> nil then
    TreeView_DeleteItem(Handle, ItemId);
  Data := nil;
  inherited Destroy;
end;

function TTreeNode.GetHandle: HWND;
begin
  Result := TreeView.Handle;
end;

function TTreeNode.GetTreeView: TCustomTreeView;
begin
  Result := Owner.Owner;
end;

function TTreeNode.HasAsParent(Value: TTreeNode): Boolean;
begin
  if Value <> Nil then
  begin
    if Parent = nil then Result := False
    else if Parent = Value then Result := True
    else Result := Parent.HasAsParent(Value);
  end
  else Result := True;
end;

procedure TTreeNode.SetEnabled(Value: Boolean);
var
  Item: TTVItemEx;
begin
  if not Deleting and (Value <> FEnabled) then
  begin
    FEnabled := Value;
    with Item do
    begin
      mask := TVIF_STATEEX;
      hItem := ItemId;
      if not Enabled then
        uStateEx := TVIS_EX_DISABLED
      else
        uStateEx := 0;
    end;
    TreeView_SetItem(Handle, Item);
  end;
end;

procedure TTreeNode.SetText(const S: string);
var
  Item: TTVItem;
begin
  if not Deleting and (S <> Text) then
  begin
    FText := S;
    with Item do
    begin
      mask := TVIF_TEXT;
      hItem := ItemId;
{$IFDEF CLR}
      pszText := IntPtr(LPSTR_TEXTCALLBACK);
{$ELSE}
      pszText := LPSTR_TEXTCALLBACK;
{$ENDIF}
    end;
    TreeView_SetItem(Handle, Item);
    if (TreeView.SortType in [stText, stBoth]) and FInTree then
    begin
      if (Parent <> nil) then
        Parent.AlphaSort
      else
        TreeView.AlphaSort(False);
    end;
  end;
end;

procedure TTreeNode.SetData(Value: TCustomData);
begin
  if not Deleting and (Value <> Data) then
  begin
    FData := Value;
    if (TreeView.SortType in [stData, stBoth]) and Assigned(TreeView.OnCompare)
      and (not Deleting) and FInTree then
    begin
      if Parent <> nil then
        Parent.AlphaSort
      else
        TreeView.AlphaSort(False);
    end;
  end;
end;

function TTreeNode.GetState(NodeState: TNodeState): Boolean;
var
  Item: TTVItem;
begin
  Result := False;
  if not Deleting then
    with Item do
    begin
      mask := TVIF_STATE;
      hItem := ItemId;
      if TreeView_GetItem(Handle, Item) then
        case NodeState of
          nsCut: Result := (state and TVIS_CUT) <> 0;
          nsFocused: Result := (state and TVIS_FOCUSED) <> 0;
          nsSelected: Result := (state and TVIS_SELECTED) <> 0;
          nsExpanded: Result := (state and TVIS_EXPANDED) <> 0;
          nsDropHilited: Result := (state and TVIS_DROPHILITED) <> 0;
        end;
    end;
end;

procedure TTreeNode.SetState(NodeState: TNodeState; Value: Boolean);
var
  Item: TTVItem;
begin
  if not Deleting then
  begin
    with Item do
    begin
      mask := TVIF_STATE;
      hItem := ItemId;
      case NodeState of
        nsCut: stateMask := TVIS_CUT;
        nsFocused: stateMask := TVIS_FOCUSED;
        nsSelected: stateMask := TVIS_SELECTED;
        nsExpanded: stateMask := TVIS_EXPANDED;
        nsDropHilited: stateMask := TVIS_DROPHILITED;
      end;
      if Value then
        state := stateMask and DWORD(-1)
      else
        state := DWORD(0);
    end;
    TreeView_SetItem(Handle, Item);
  end;
end;

procedure TTreeNode.SetImageIndex(Value: TImageIndex);
var
  Item: TTVItem;
begin
  if not Deleting and (Value <> ImageIndex) then
  begin
    FImageIndex := Value;
    with Item do
    begin
      mask := TVIF_IMAGE or TVIF_HANDLE;
      hItem := ItemId;
      if Assigned(TCustomTreeView(Owner.Owner).OnGetImageIndex) then
        iImage := I_IMAGECALLBACK
      else
        iImage := FImageIndex;
    end;
    TreeView_SetItem(Handle, Item);
  end;
end;

procedure TTreeNode.SetExpandedImageIndex(Value: TImageIndex);
var
  Item: TTVItemEx;
begin
  if not Deleting and (Value <> ExpandedImageIndex) then
  begin
    FExpandedImageIndex := Value;
    with Item do
    begin
      mask := TVIF_EXPANDEDIMAGE or TVIF_HANDLE;
      hItem := ItemId;
      iExpandedImage := FExpandedImageIndex;
    end;
    TreeView_SetItem(Handle, Item);
  end;
end;

procedure TTreeNode.SetSelectedIndex(Value: Integer);
var
  Item: TTVItem;
begin
  if not Deleting and (Value <> SelectedIndex) then
  begin
    FSelectedIndex := Value;
    with Item do
    begin
      mask := TVIF_SELECTEDIMAGE or TVIF_HANDLE;
      hItem := ItemId;
      if Assigned(TCustomTreeView(Owner.Owner).OnGetSelectedIndex) then
        iSelectedImage := I_IMAGECALLBACK
      else
        iSelectedImage := FSelectedIndex;
    end;
    TreeView_SetItem(Handle, Item);
  end;
end;

procedure TTreeNode.SetOverlayIndex(Value: Integer);
var
  Item: TTVItem;
begin
  if not Deleting and (Value <> OverlayIndex) then
  begin
    FOverlayIndex := Value;
    with Item do
    begin
      mask := TVIF_STATE or TVIF_HANDLE;
      stateMask := TVIS_OVERLAYMASK;
      hItem := ItemId;
      state := IndexToOverlayMask(FOverlayIndex + 1);
    end;
    TreeView_SetItem(Handle, Item);
  end;
end;

procedure TTreeNode.SetStateIndex(Value: Integer);
var
  Item: TTVItem;
begin
  if not Deleting and (Value <> StateIndex) then
  begin
    FStateIndex := Value;
    if Value >= 0 then Dec(Value);
    with Item do
    begin
      mask := TVIF_STATE or TVIF_HANDLE;
      stateMask := TVIS_STATEIMAGEMASK;
      hItem := ItemId;
      state := IndexToStateImageMask(Value + 1);
    end;
    TreeView_SetItem(Handle, Item);
  end;
end;

function TTreeNode.CompareCount(CompareMe: Integer): Boolean;
var
  Count: integer;
  Node: TTreeNode;
Begin
  Count := 0;
  Result := False;
  Node := GetFirstChild;
  while Node <> nil do
  begin
    Inc(Count);
    Node := Node.GetNextChild(Node);
    if Count > CompareMe then
      Exit;
  end;
  if Count = CompareMe then
    Result := True;
end;

function TTreeNode.DoCanExpand(Expand: Boolean): Boolean;
begin
  Result := False;
  if not Deleting then
    if HasChildren then
    begin
      if Expand then
        Result := TreeView.CanExpand(Self)
      else
        Result := TreeView.CanCollapse(Self);
    end;
end;

procedure TTreeNode.DoExpand(Expand: Boolean);
begin
  if not Deleting and HasChildren then
  begin
    if Expand then
      TreeView.Expand(Self)
    else
      TreeView.Collapse(Self);
  end;
end;

procedure TTreeNode.ExpandItem(Expand: Boolean; Recurse: Boolean);
var
  Flag: Integer;
  Node: TTreeNode;
begin
  if not Deleting then
    if Recurse then
    begin
      Node := Self;
      repeat
        Node.ExpandItem(Expand, False);
        Node := Node.GetNext;
      until (Node = nil) or (not Node.HasAsParent(Self));
    end
    else begin
      TreeView.FManualNotify := True;
      try
        Flag := 0;
        if Expand then
        begin
          if DoCanExpand(True) then
          begin
            Flag := TVE_EXPAND;
            DoExpand(True);
          end;
        end
        else begin
          if DoCanExpand(False) then
          begin
            Flag := TVE_COLLAPSE;
            DoExpand(False);
          end;
        end;
        if Flag <> 0 then TreeView_Expand(Handle, ItemId, Flag);
      finally
        TreeView.FManualNotify := False;
      end;
    end;
end;

procedure TTreeNode.Expand(Recurse: Boolean);
begin
  ExpandItem(True, Recurse);
end;

procedure TTreeNode.Collapse(Recurse: Boolean);
begin
  ExpandItem(False, Recurse);
end;

function TTreeNode.GetExpanded: Boolean;
begin
  Result := GetState(nsExpanded);
end;

procedure TTreeNode.SetExpanded(Value: Boolean);
begin
  if Value <> Expanded then
  begin
    if Value then
      Expand(False)
    else
      Collapse(False);
  end;
end;

function TTreeNode.GetSelected: Boolean;
begin
  Result := GetState(nsSelected);
end;

procedure TTreeNode.SetSelected(Value: Boolean);
begin
  if not Deleting and (Handle <> 0) and (ItemId <> nil) then
    if Value <> Selected then
    begin
      if Value then TreeView_SelectItem(Handle, ItemId)
      else if Selected then TreeView_SelectItem(Handle, nil);
    end
    else if (TreeView.MultiSelect) and (TreeView.FSelections.Count > 1) then
      TreeView.Select(Self, []);
end;

procedure TTreeNode.SetSelectedBit(Value: Boolean);
begin
  SetState(nsSelected, Value);
end;

function TTreeNode.GetCut: Boolean;
begin
  Result := GetState(nsCut);
end;

procedure TTreeNode.SetCut(Value: Boolean);
begin
  if Value <> Cut then
    SetState(nsCut, Value);
end;

function TTreeNode.GetDropTarget: Boolean;
begin
  Result := GetState(nsDropHilited);
end;

procedure TTreeNode.SetDropTarget(Value: Boolean);
begin
  if (Handle <> 0) and (ItemId <> nil) then
    if Value then
      TreeView_SelectDropTarget(Handle, ItemId)
    else if DropTarget then
      TreeView_SelectDropTarget(Handle, nil);
end;

function TTreeNode.GetChildren: Boolean;
var
  Item: TTVItem;
begin
  Result := False;
  if not Deleting then
  begin
    Item.mask := TVIF_CHILDREN;
    Item.hItem := ItemId;
    if TreeView_GetItem(Handle, Item) then
      Result := Item.cChildren > 0;
  end;
end;

procedure TTreeNode.SetFocused(Value: Boolean);
begin
  if Value <> Focused then
    SetState(nsFocused, Value);
end;

function TTreeNode.GetFocused: Boolean;
begin
  Result := GetState(nsFocused);
end;

procedure TTreeNode.SetChildren(Value: Boolean);
var
  Item: TTVItem;
begin
  if not Deleting then
  begin
    with Item do
    begin
      mask := TVIF_CHILDREN;
      hItem := ItemId;
      cChildren := Ord(Value);
    end;
    TreeView_SetItem(Handle, Item);
  end;
end;

function TTreeNode.GetParent: TTreeNode;
begin
  Result := nil;
  if (Handle <> 0) and (ItemId <> nil) then
    with FOwner do
      Result := GetNode(TreeView_GetParent(Handle, ItemId));
end;

function TTreeNode.GetNextSibling: TTreeNode;
begin
  Result := nil;
  if (Handle <> 0) and (ItemId <> nil) then
    with FOwner do
      Result := GetNode(TreeView_GetNextSibling(Handle, ItemId));
end;

function TTreeNode.GetPrevSibling: TTreeNode;
begin
  Result := nil;
  if (Handle <> 0) and (ItemId <> nil) then
    with FOwner do
      Result := GetNode(TreeView_GetPrevSibling(Handle, ItemId));
end;

function TTreeNode.GetNextVisible: TTreeNode;
begin
  Result := nil;
  if (Handle <> 0) and (ItemId <> nil) and IsVisible then
    with FOwner do
      Result := GetNode(TreeView_GetNextVisible(Handle, ItemId));
end;

function TTreeNode.GetPrevVisible: TTreeNode;
begin
  Result := nil;
  if (Handle <> 0) and (ItemId <> nil) and IsVisible then
    with FOwner do
      Result := GetNode(TreeView_GetPrevVisible(Handle, ItemId));
end;

function TTreeNode.GetNextChild(Value: TTreeNode): TTreeNode;
begin
  if Value <> nil then Result := Value.GetNextSibling
  else Result := nil;
end;

function TTreeNode.GetPrevChild(Value: TTreeNode): TTreeNode;
begin
  if Value <> nil then Result := Value.GetPrevSibling
  else Result := nil;
end;

function TTreeNode.GetFirstChild: TTreeNode;
begin
  Result := nil;
  if (Handle <> 0) and (ItemId <> nil) then
    with FOwner do
      Result := GetNode(TreeView_GetChild(Handle, ItemId));
end;

function TTreeNode.GetLastChild: TTreeNode;
var
  Node: TTreeNode;
begin
  Result := GetFirstChild;
  if Result <> nil then
  begin
    Node := Result;
    repeat
      Result := Node;
      Node := Result.GetNextSibling;
    until Node = nil;
  end;
end;

function TTreeNode.GetNext: TTreeNode;
var
  NodeID, ParentID: HTreeItem;
begin
  Result := nil;
  if (Handle <> 0) and (ItemId <> nil) then
  begin
    NodeID := TreeView_GetChild(Handle, ItemId);
    if NodeID = nil then
      NodeID := TreeView_GetNextSibling(Handle, ItemId);
    ParentID := ItemId;
    while (NodeID = nil) and (ParentID <> nil) do
    begin
      ParentID := TreeView_GetParent(Handle, ParentID);
      NodeID := TreeView_GetNextSibling(Handle, ParentID);
    end;
    Result := FOwner.GetNode(NodeID);
  end;
end;

function TTreeNode.GetPrev: TTreeNode;
var
  Node: TTreeNode;
begin
  Result := GetPrevSibling;
  if Result <> nil then
  begin
    Node := Result;
    repeat
      Result := Node;
      Node := Result.GetLastChild;
    until Node = nil;
  end else
    Result := Parent;
end;

function TTreeNode.GetAbsoluteIndex: Integer;
var
  Node: TTreeNode;
begin
  if Owner.FNodeCache.CacheNode = Self then
    Result := Owner.FNodeCache.CacheIndex
  else
  begin
    if IsFirstNode then
      Result := 0
    else
    begin
      Result := -1;
      Node := Self;
      while Node <> nil do
      begin
        Inc(Result);
        Node := Node.GetPrev;
      end;
    end;
  end;
end;

function TTreeNode.GetIndex: Integer;
var
  Node: TTreeNode;
begin
  Result := -1;
  Node := Self;
  while Node <> nil do
  begin
    Inc(Result);
    Node := Node.GetPrevSibling;
  end;
end;

function TTreeNode.GetItem(Index: Integer): TTreeNode;
begin
  Result := GetFirstChild;
  while (Result <> nil) and (Index > 0) do
  begin
    Result := GetNextChild(Result);
    Dec(Index);
  end;
  if Result = nil then TreeViewError(Format(SListIndexError, [Index]));
end;

procedure TTreeNode.SetItem(Index: Integer; Value: TTreeNode);
begin
  item[Index].Assign(Value);
end;

function TTreeNode.IndexOf(Value: TTreeNode): Integer;
var
  Node: TTreeNode;
begin
  Result := -1;
  Node := GetFirstChild;
  while (Node <> nil) do
  begin
    Inc(Result);
    if Node = Value then Break;
    Node := GetNextChild(Node);
  end;
  if Node = nil then Result := -1;
end;

function TTreeNode.GetCount: Integer;
var
  Node: TTreeNode;
begin
  Result := 0;
  Node := GetFirstChild;
  while Node <> nil do
  begin
    Inc(Result);
    Node := Node.GetNextChild(Node);
  end;
end;

procedure TTreeNode.EndEdit(Cancel: Boolean);
begin
  if not Deleting then
    TreeView_EndEditLabelNow(Handle, Cancel);
end;

procedure TTreeNode.InternalMove(ParentNode, Node: TTreeNode;
  HItem: HTreeItem; AddMode: TAddMode);
var
  I: Integer;
  NodeId: HTreeItem;
  TreeViewItem: TTVItem;
  Children: Boolean;
  IsSelected: Boolean;
begin
  Owner.ClearCache;
  if (AddMode = taInsert) and (Node <> nil) then
    NodeId := Node.ItemId else
    NodeId := nil;
  Children := HasChildren;
  IsSelected := Selected;
  if (Parent <> nil) and (Parent.CompareCount(1)) then
  begin
    Parent.Expanded := False;
    Parent.HasChildren := False;
  end;
  with TreeViewItem do
  begin
    mask := TVIF_PARAM;
    hItem := ItemId;
    lParam := 0;
  end;
  TreeView_SetItem(Handle, TreeViewItem);
  with Owner do
    HItem := AddItem(HItem, NodeId, CreateItem(Self), AddMode);
{$IFDEF CLR}
  // Add to hashtable to prevent premature garbage collection, and allow
  // access to the actual TreeNode object from the TVItem struct
  Owner.FNodeHashTable.Add(HTreeItem(HItem), Self);
{$ENDIF}
  if HItem = nil then
    raise EOutOfResources.Create(sInsertError);
  for I := Count - 1 downto 0 do
    Item[I].InternalMove(Self, nil, HItem, taAddFirst);
  TreeView_DeleteItem(Handle, ItemId);
  FItemId := HItem;
  Assign(Self);
  HasChildren := Children;
  Selected := IsSelected;
end;

procedure TTreeNode.MoveTo(Destination: TTreeNode; Mode: TNodeAttachMode);
var
  AddMode: TAddMode;
  Node: TTreeNode;
  HItem: HTreeItem;
  OldOnChanging: TTVChangingEvent;
  OldOnChange: TTVChangedEvent;
begin
  if Deleting or
    ((Destination = Parent) and (Parent <> nil) and
     (((Mode = naAddChild) and (Parent.GetLastChild = Self)) or
      ((Mode = naAddChildFirst) and (Parent.GetFirstChild = Self)))) then
    Exit;

  OldOnChanging := TreeView.OnChanging;
  OldOnChange := TreeView.OnChange;
  TreeView.OnChanging := nil;
  TreeView.OnChange := nil;
  try
    if (Destination = nil) or not Destination.HasAsParent(Self) then
    begin
      AddMode := taAdd;
      if (Destination <> nil) and not (Mode in [naAddChild, naAddChildFirst]) then
        Node := Destination.Parent else
        Node := Destination;
      case Mode of
        naAdd,
        naAddChild: AddMode := taAdd;
        naAddFirst,
        naAddChildFirst: AddMode := taAddFirst;
        naInsert:
          begin
            Destination := Destination.GetPrevSibling;
            if Destination = nil then AddMode := taAddFirst
            else AddMode := taInsert;
          end;
      end;
      if Node <> nil then
        HItem := Node.ItemId else
        HItem := nil;
      if (Destination <> Self) then
        InternalMove(Node, Destination, HItem, AddMode);
      Node := Parent;
      if Node <> nil then
      begin
        Node.HasChildren := True;
        Node.Expanded := True;
      end;
    end;
  finally
    TreeView.OnChanging := OldOnChanging;
    TreeView.OnChange := OldOnChange;
  end;
end;

function TTreeNode.IsFirstNode: Boolean;
begin
  Result := not Deleting and (Parent = nil) and (GetPrevSibling = nil);
end;

procedure TTreeNode.MakeVisible;
begin
  if (Handle <> 0) and (ItemId <> nil) then
    TreeView_EnsureVisible(Handle, ItemId);
end;

function TTreeNode.GetLevel: Integer;
var
  Node: TTreeNode;
begin
  Result := 0;
  Node := Parent;
  while Node <> nil do
  begin
    Inc(Result);
    Node := Node.Parent;
  end;
end;

function TTreeNode.IsNodeVisible: Boolean;
var
  Rect: TRect;
begin
  Result := not Deleting and TreeView_GetItemRect(Handle, ItemId, Rect, True);
end;

function TTreeNode.EditText: Boolean;
begin
  Result := (Handle <> 0) and (ItemId <> nil) and (TreeView_EditLabel(Handle, ItemId) <> 0);
end;

function TTreeNode.DisplayRect(TextOnly: Boolean): TRect;
begin
{$IFNDEF CLR}
  FillChar(Result, SizeOf(Result), 0);
{$ENDIF}
  if not Deleting then
    TreeView_GetItemRect(Handle, ItemId, Result, TextOnly);
end;

function TTreeNode.AlphaSort(ARecurse: Boolean): Boolean;
begin
{$IFDEF CLR}
  Result := CustomSort(nil, nil, ARecurse);
{$ELSE}
  Result := CustomSort(nil, 0, ARecurse);
{$ENDIF}
end;

{$IFDEF CLR}
type
  TTVCompareWrapper = record
    SortProc: TTVCompareProc;
    Data: TTag;
  end;
{$ENDIF}

{$IFDEF CLR}
function TTreeNode.CustomSort(SortProc: TTVCompareProc; Data: TTag; ARecurse: Boolean): Boolean;
{$ELSE}
function TTreeNode.CustomSort(SortProc: TTVCompare; Data: NativeInt; ARecurse: Boolean): Boolean;
{$ENDIF}
var
  SortCB: TTVSortCB;
  LNode: TTreeNode;
{$IFDEF CLR}
  CompareWrapper: TTVCompareWrapper;
{$ENDIF}
begin
  Result := False;
  if not Deleting then
  begin
    Owner.ClearCache;
    with SortCB do
    begin
{$IFDEF CLR}
      if not Assigned(SortProc) then
        CompareWrapper.SortProc := Owner.Owner.DefaultTreeViewSort
      else
        CompareWrapper.SortProc := SortProc;
      lpfnCompare := Owner.Owner.CustomTreeViewSort;
      CompareWrapper.Data := Data;
      hParent := ItemId;
      lParam := THandle(IntPtr(GCHandle.Alloc(CompareWrapper)));
      try
        Result := TreeView_SortChildrenCB(Handle, SortCB, 0);
      finally
        GCHandle(IntPtr(lParam)).Free;
      end;
{$ELSE}
      if not Assigned(SortProc) then
        lpfnCompare := @DefaultTreeViewSort
      else 
        lpfnCompare := SortProc;
      hParent := ItemId;
      lParam := Data;
      Result := TreeView_SortChildrenCB(Handle, SortCB, 0);
{$ENDIF}
    end;
    if ARecurse then
    begin
      LNode := GetFirstChild;
      while LNode <> nil do
      begin
        if LNode.HasChildren then
          LNode.CustomSort(SortProc, Data, True);
        LNode := LNode.GetNextSibling;
      end;
    end;
  end;
end;

procedure TTreeNode.Delete;
begin
  if not Deleting then
    Free;
end;

procedure TTreeNode.DeleteChildren;
begin
  Owner.ClearCache;
  if not Deleting then
    TreeView_Expand(TreeView.Handle, ItemID, TVE_COLLAPSE or TVE_COLLAPSERESET);
  HasChildren := False;
end;

procedure TTreeNode.Assign(Source: TPersistent);
var
  Node: TTreeNode;
begin
  Owner.ClearCache;
  if not Deleting and (Source is TTreeNode) then
  begin
    Node := TTreeNode(Source);
    Text := Node.Text;
    Data := Node.Data;
    ImageIndex := Node.ImageIndex;
    SelectedIndex := Node.SelectedIndex;
    StateIndex := Node.StateIndex;
    OverlayIndex := Node.OverlayIndex;
    Focused := Node.Focused;
    DropTarget := Node.DropTarget;
    Cut := Node.Cut;
    HasChildren := Node.HasChildren;
  end
  else
    inherited Assign(Source);
end;

function TTreeNode.IsEqual(Node: TTreeNode): Boolean;
begin
  Result := (Text = Node.Text) and (Data = Node.Data);
end;

{$IFDEF CLR}
procedure TTreeNode.ReadData(Stream: TStream; Info: TNodeInfo32);
var
  Buffer: TBytes;
  I, Size, ItemCount: Integer;
  LNode: TTreeNode;
  LText: TBytes;
begin
  Owner.ClearCache;
  Stream.ReadBuffer(Size, SizeOf(Size));
  SetLength(Buffer, Size);
  Stream.ReadBuffer(Buffer, Size);
  Info := TNodeInfo32(BytesToStructure(Buffer, TypeOf(TNodeInfo32)));
  SetLength(LText, Info.TextLen);
  System.Array.Copy(Buffer, Size - Info.TextLen, LText, 0, Info.TextLen);
  Text := StringOf(LText);
  ImageIndex := Info.ImageIndex;
  SelectedIndex := Info.SelectedIndex;
  StateIndex := Info.StateIndex;
  OverlayIndex := Info.OverlayIndex;
  if Info.Data <> 0 then
    Data := TObject(Info.Data);
  ItemCount := Info.Count;
  HasChildren := ItemCount <> 0;
  if ItemCount > 0 then
    for I := 0 to ItemCount - 1 do
    begin
      LNode := Owner.AddChild(Self, '');
      LNode.ReadData(Stream, Info);
      Owner.Owner.Added(LNode);
    end;
end;
{$ELSE}
procedure TTreeNode.ReadData(Stream: TStream; Info: PNodeInfo);
var
  I, Size, ItemCount: Integer;
  LNode: TTreeNode;
begin
  Owner.ClearCache;
  Stream.ReadBuffer(Size, SizeOf(Size));
  Stream.ReadBuffer(Info^, Size);
  Text := string(Info^.Text);
  ImageIndex := Info^.ImageIndex;
  SelectedIndex := Info^.SelectedIndex;
  StateIndex := Info^.StateIndex;
  OverlayIndex := Info^.OverlayIndex;
  Data := Pointer(Info^.Data);
  ItemCount := Info^.Count;
  HasChildren := ItemCount <> 0;
  if ItemCount > 0 then
    for I := 0 to ItemCount - 1 do
    begin
      LNode := Owner.AddChild(Self, '');
      LNode.ReadData(Stream, Info);
      Owner.Owner.Added(LNode);
    end;
end;
{$ENDIF}

{$IFDEF CLR}
procedure TTreeNode.ReadNodeData(Stream: TStream; NodeDataType: TNodeDataType);
var
  Buffer: TBytes;
  I, Size, ItemCount, LTextLen: Integer;
  LNode: TTreeNode;
  LText: TBytes;
  Info: TNodeInfo;
  Info2: TNodeInfo2;
  Info32: TNodeInfo32;
  Info64: TNodeInfo64;
  Info232: TNodeInfo232;
  Info264: TNodeInfo264;
begin
  Owner.ClearCache;
  Stream.ReadBuffer(Size, SizeOf(Size));
  SetLength(Buffer, Size);
  Stream.ReadBuffer(Buffer, Size);
  case NodeDataType of
    ndt32bit:
      begin
        Info32 := TNodeInfo32(BytesToStructure(Buffer, TypeOf(TNodeInfo32)));
        ImageIndex := Info32.ImageIndex;
        SelectedIndex := Info32.SelectedIndex;
        StateIndex := Info32.StateIndex;
        OverlayIndex := Info32.OverlayIndex;
        if Info32.Data <> 0 then
          Data := TObject(Info32.Data);
        ItemCount := Info32.Count;
        LTextLen := Info32.TextLen;
        Enabled := True;
        ExpandedImageIndex := 0;
      end;
    ndt64bit:
      begin
        Info64 := TNodeInfo64(BytesToStructure(Buffer, TypeOf(TNodeInfo64)));
        ImageIndex := Info64.ImageIndex;
        SelectedIndex := Info64.SelectedIndex;
        StateIndex := Info64.StateIndex;
        OverlayIndex := Info64.OverlayIndex;
        if Info64.Data <> 0 then
          Data := TObject(Info64.Data);
        ItemCount := Info64.Count;
        LTextLen := Info64.TextLen;
        Enabled := True;
        ExpandedImageIndex := 0;
      end;
    ndt232bit:
      begin
        Info232 := TNodeInfo232(BytesToStructure(Buffer, TypeOf(TNodeInfo232)));
        ImageIndex := Info232.ImageIndex;
        SelectedIndex := Info232.SelectedIndex;
        StateIndex := Info232.StateIndex;
        OverlayIndex := Info232.OverlayIndex;
        if Info232.Data <> 0 then
          Data := TObject(Info232.Data);
        ItemCount := Info232.Count;
        LTextLen := Info232.TextLen;
        Enabled := Info232.Enabled <> 0;
        ExpandedImageIndex := Info232.ExpandedIndex;
      end;
    ndt264bit:
      begin
        Info264 := TNodeInfo264(BytesToStructure(Buffer, TypeOf(TNodeInfo264)));
        ImageIndex := Info264.ImageIndex;
        SelectedIndex := Info264.SelectedIndex;
        StateIndex := Info264.StateIndex;
        OverlayIndex := Info264.OverlayIndex;
        if Info264.Data <> 0 then
          Data := TObject(Info264.Data);
        ItemCount := Info264.Count;
        LTextLen := Info264.TextLen;
        Enabled := Info264.Enabled <> 0;
        ExpandedImageIndex := Info264.ExpandedIndex;
      end;
    ndtDefault2:
      begin
        Info2 := TNodeInfo2(BytesToStructure(Buffer, TypeOf(TNodeInfo2)));
        ImageIndex := Info2.ImageIndex;
        SelectedIndex := Info2.SelectedIndex;
        StateIndex := Info2.StateIndex;
        OverlayIndex := Info2.OverlayIndex;
        Data := Info2.Data;
        ItemCount := Info2.Count;
        LTextLen := Info2.TextLen;
        Enabled := Info2.Enabled <> 0;
        ExpandedImageIndex := Info2.ExpandedIndex;
      end;
  else // ndtDefault
    begin
      Info := TNodeInfo(BytesToStructure(Buffer, TypeOf(TNodeInfo)));
      ImageIndex := Info.ImageIndex;
      SelectedIndex := Info.SelectedIndex;
      StateIndex := Info.StateIndex;
      OverlayIndex := Info.OverlayIndex;
      Data := Info.Data;
      ItemCount := Info.Count;
      LTextLen := Info.TextLen;
      Enabled := True;
      ExpandedImageIndex := 0;
    end;
  end;
  SetLength(LText, LTextLen * 2); // Info.TextLen holds number of chars of Unicode string
  System.Array.Copy(Buffer, Size - Length(LText), LText, 0, Length(LText));
  Text := WideStringOf(LText);
  HasChildren := ItemCount <> 0;
  if ItemCount > 0 then
    for I := 0 to ItemCount - 1 do
    begin
      LNode := Owner.AddChild(Self, '');
      LNode.ReadNodeData(Stream, NodeDataType);
      Owner.Owner.Added(LNode);
    end;
end;
{$ELSE}
procedure TTreeNode.ReadNodeData(Stream: TStream; NodeDataType: TNodeDataType);
var
  I, Size, LItemCount: Integer;
  LNode: TTreeNode;
  LText: UnicodeString;
  Info: TNodeDataInfoX86;
  Info2x86: TNodeDataInfo2x86;
  Info2x64: TNodeDataInfo2x64;
begin
  Owner.ClearCache;

  case NodeDataType of
    ndtDefault, ndt32bit:
      begin
        Stream.ReadBuffer(Size, SizeOf(Size));
        Stream.ReadBuffer(Info, SizeOf(TNodeDataInfoX86));
        SetLength(LText, Info.TextLen); // Info.TextLen holds number of chars of Unicode string
        Stream.ReadBuffer(LText[1], Info.TextLen * SizeOf(WideChar));
        Text := LText;
        ImageIndex := Info.ImageIndex;
        SelectedIndex := Info.SelectedIndex;
        StateIndex := Info.StateIndex;
        OverlayIndex := Info.OverlayIndex;
        Data := Pointer(Info.Data);
        ExpandedImageIndex := -1;
        Enabled := True;
        LItemCount := Info.Count;
        HasChildren := LItemCount <> 0;
        if LItemCount > 0 then
        begin
          for I := 0 to LItemCount - 1 do
          begin
            LNode := Owner.AddChild(Self, '');
            LNode.ReadNodeData(Stream, NodeDataType);
            Owner.Owner.Added(LNode);
          end;
        end;
      end;
    ndt232bit:
      begin
        Stream.ReadBuffer(Size, SizeOf(Size));
        Stream.ReadBuffer(Info2x86, SizeOf(TNodeDataInfo2x86));
        SetLength(LText, Info2x86.TextLen); // Info2x86.TextLen holds number of chars of Unicode string
        Stream.ReadBuffer(LText[1], Info2x86.TextLen * SizeOf(WideChar));
        Text := LText;
        ImageIndex := Info2x86.ImageIndex;
        SelectedIndex := Info2x86.SelectedIndex;
        StateIndex := Info2x86.StateIndex;
        OverlayIndex := Info2x86.OverlayIndex;
        ExpandedImageIndex := Info2x86.ExpandedIndex;
        Enabled := Info2x86.Enabled <> 0;
        Data := Pointer(Info2x86.Data);
        LItemCount := Info2x86.Count;
        HasChildren := LItemCount <> 0;
        if LItemCount > 0 then
        begin
          for I := 0 to LItemCount - 1 do
          begin
            LNode := Owner.AddChild(Self, '');
            LNode.ReadNodeData(Stream, NodeDataType);
            Owner.Owner.Added(LNode);
          end;
        end;
      end;
    ndt264bit:
      begin
        Stream.ReadBuffer(Size, SizeOf(Size));
        Stream.ReadBuffer(Info2x64, SizeOf(TNodeDataInfo2x64));
        SetLength(LText, Info2x64.TextLen); // Info2x64.TextLen holds number of chars of Unicode string
        Stream.ReadBuffer(LText[1], Info2x64.TextLen * SizeOf(WideChar));
        Text := LText;
        ImageIndex := Info2x64.ImageIndex;
        SelectedIndex := Info2x64.SelectedIndex;
        StateIndex := Info2x64.StateIndex;
        OverlayIndex := Info2x64.OverlayIndex;
        ExpandedImageIndex := Info2x64.ExpandedIndex;
        Enabled := Info2x64.Enabled <> 0;
        Data := Pointer(Info2x64.Data);
        LItemCount := Info2x64.Count;
        HasChildren := LItemCount <> 0;
        if LItemCount > 0 then
        begin
          for I := 0 to LItemCount - 1 do
          begin
            LNode := Owner.AddChild(Self, '');
            LNode.ReadNodeData(Stream, NodeDataType);
            Owner.Owner.Added(LNode);
          end;
        end;
      end;
  end;
end;
{$ENDIF}

{$IFDEF CLR}
procedure TTreeNode.WriteNodeData(Stream: TStream);
var
  Buffer, LText: TBytes;
  Info: TNodeInfo2;
  I, Size, ItemCount, TextLen: Integer;
begin
  LText := WideBytesOf(Text);
  TextLen := Length(LText);
  if TextLen > 510 then
    TextLen := 510; // Max length for an item is 255 chars
  Size := Marshal.SizeOf(TypeOf(TNodeInfo2)) + TextLen;
  Info.TextLen := TextLen div 2; // Store number of chars in Info.TextLen
  Info.ImageIndex := ImageIndex;
  Info.SelectedIndex := SelectedIndex;
  Info.OverlayIndex := OverlayIndex;
  Info.StateIndex := StateIndex;
  Info.Data := Data;
  if Enabled then
    Info.Enabled := 1
  else
    Info.Enabled := 0;
  Info.ExpandedIndex := ExpandedImageIndex;
  ItemCount := Count;
  if (ItemCount = 0) and HasChildren then // Preserve HasChildren in case
    Info.Count := -1                      // of recreating the control
  else
    Info.Count := ItemCount;
  Buffer := StructureToBytes(TObject(Info));
  Stream.WriteBuffer(Size, SizeOf(Size));
  Stream.WriteBuffer(Buffer, Size - TextLen);
  Stream.WriteBuffer(LText, TextLen);
  for I := 0 to ItemCount - 1 do
    Item[I].WriteNodeData(Stream);
end;
{$ELSE}
procedure TTreeNode.WriteNodeData(Stream: TStream);
var
  I, Size, LTextLen: Integer;
  LText: UnicodeString;
  Info: TNodeDataInfo2;
begin
  LText := Text;
  Info.TextLen := Length(LText);
  LTextLen := Length(LText);
  if LTextLen > 255 then
    LTextLen := 255;  // Max length for an item is 255 chars
  Info.TextLen := LTextLen;
  Size := SizeOf(TNodeDataInfo2) + (Info.TextLen * SizeOf(WideChar)); // Length in bytes
  Info.ImageIndex := ImageIndex;
  Info.SelectedIndex := SelectedIndex;
  Info.OverlayIndex := OverlayIndex;
  Info.StateIndex := StateIndex;
  Info.Data := Data;
  Info.ExpandedIndex := ExpandedImageIndex;
  if Enabled then  
    Info.Enabled := 1
  else
    Info.Enabled := 0;
  if (Count = 0) and HasChildren then // Preserve HasChildren in case
    Info.Count := -1                  // of recreating the control
  else
    Info.Count := Count;
  Stream.WriteBuffer(Size, SizeOf(Size));
  Stream.WriteBuffer(Info, SizeOf(TNodeDataInfo2));
  Stream.WriteBuffer(LText[1], Info.TextLen * SizeOf(WideChar)); // Length in bytes
  for I := 0 to Info.Count - 1 do
    Item[I].WriteNodeData(Stream);
end;
{$ENDIF}

{ TTreeNodesEnumerator }

constructor TTreeNodesEnumerator.Create(ATreeNodes: TTreeNodes);
begin
  inherited Create;
  FIndex := -1;
  FTreeNodes := ATreeNodes;
end;

function TTreeNodesEnumerator.GetCurrent: TTreeNode;
begin
  Result := FTreeNodes[FIndex];
end;

function TTreeNodesEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FTreeNodes.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTreeNodes }

constructor TTreeNodes.Create(AOwner: TCustomTreeView);
begin
  inherited Create;
  FOwner := AOwner;
{$IFDEF CLR}
  FNodeHashTable := HashTable.Create;
{$ENDIF}
end;

destructor TTreeNodes.Destroy;
begin
  Clear;
{$IFDEF CLR}
  FNodeHashTable.Free;
  FNodeHashTable := nil;
{$ENDIF}
  inherited Destroy;
end;

function TTreeNodes.GetCount: Integer;
begin
  if Owner.HandleAllocated then
    Result := TreeView_GetCount(Handle)
  else
    Result := 0;
end;

function TTreeNodes.GetHandle: HWND;
begin
  Result := Owner.Handle;
end;

procedure TTreeNodes.Delete(Node: TTreeNode);
begin
  Node.Delete;
end;

procedure TTreeNodes.Clear;
var
  LHandleAllocated: Boolean;
begin
  LHandleAllocated := Owner.HandleAllocated;
  if LHandleAllocated then
    BeginUpdate;
  try
    ClearCache;
    if Owner.HandleAllocated then
      TreeView_DeleteAllItems(Owner.Handle);
  finally
    if LHandleAllocated then
      EndUpdate;
  end;
end;

function TTreeNodes.AddChildFirst(Parent: TTreeNode; const S: string): TTreeNode;
begin
  Result := AddNode(nil, Parent, S, nil, naAddChildFirst);
end;

function TTreeNodes.AddChildObjectFirst(Parent: TTreeNode; const S: string;
  Ptr: TCustomData): TTreeNode;
begin
  Result := AddNode(nil, Parent, S, Ptr, naAddChildFirst);
end;

function TTreeNodes.AddChild(Parent: TTreeNode; const S: string): TTreeNode;
begin
  Result := AddNode(nil, Parent, S, nil, naAddChild);
end;

function TTreeNodes.AddChildObject(Parent: TTreeNode; const S: string;
  Ptr: TCustomData): TTreeNode;
begin
  Result := AddNode(nil, Parent, S, Ptr, naAddChild);
end;

function TTreeNodes.AddFirst(Sibling: TTreeNode; const S: string): TTreeNode;
begin
  Result := AddNode(nil, Sibling, S, nil, naAddFirst);
end;

function TTreeNodes.AddObjectFirst(Sibling: TTreeNode; const S: string;
  Ptr: TCustomData): TTreeNode;
begin
  Result := AddNode(nil, Sibling, S, Ptr, naAddFirst);
end;

function TTreeNodes.Add(Sibling: TTreeNode; const S: string): TTreeNode;
begin
  Result := AddNode(nil, Sibling, S, nil, naAdd);
end;

function TTreeNodes.AddObject(Sibling: TTreeNode; const S: string;
  Ptr: TCustomData): TTreeNode;
begin
  Result := AddNode(nil, Sibling, S, Ptr, naAdd);
end;

function TTreeNodes.Insert(Sibling: TTreeNode; const S: string): TTreeNode;
begin
  Result := AddNode(nil, Sibling, S, nil, naInsert);
end;

function TTreeNodes.InsertObject(Sibling: TTreeNode; const S: string;
  Ptr: TCustomData): TTreeNode;
begin
  Result := AddNode(nil, Sibling, S, Ptr, naInsert);
end;

function TTreeNodes.InsertNode(Node, Sibling: TTreeNode; const S: string;
  Ptr: TCustomData): TTreeNode;
begin
  Result := AddNode(Node, Sibling, S, Ptr, naInsert);
end;

function TTreeNodes.AddNode(Node, Relative: TTreeNode; const S: string;
  Ptr: TCustomData; Method: TNodeAttachMode): TTreeNode;
const
  cAddMode: array [TNodeAttachMode] of TAddMode =
    (taAdd, taAddFirst, taAdd, taAddFirst, taInsert);
var
  Item, ItemId: HTreeItem;
  Parent: TTreeNode;
  AddMode: TAddMode;
begin
  // what are we trying to add?
  if Node = nil then
    Result := Owner.CreateNode
  else
    Result := Node;

  // ok lets try to actually add it
  try
    Item := nil;
    ItemId := nil;
    Parent := nil;
    AddMode := cAddMode[Method];
    if Relative <> nil then
      case Method of
        naAdd, naAddFirst:
          begin
            Parent := Relative.Parent;
            if Parent <> nil then
              Item := Parent.ItemId;
          end;
        naAddChild, naAddChildFirst:
          begin
            Parent := Relative;
            Item := Parent.ItemId;
          end;
        naInsert:
          begin
            Parent := Relative.Parent;
            if Parent <> nil then
              Item := Parent.ItemId;
            Relative := Relative.GetPrevSibling;
            if Relative <> nil then
              ItemId := Relative.ItemId
            else
              AddMode := taAddFirst;
          end;
      end;
    Result.Data := Ptr;
    Result.Text := S;
    Item := AddItem(Item, ItemId, CreateItem(Result), AddMode);
    if Item = nil then
      raise EOutOfResources.Create(sInsertError);
    Result.FItemId := Item;
{$IFDEF CLR}
    // Add to hashtable to prevent premature garbage collection, and allow
    // access to the actual TreeNode object from the TVItem struct
    FNodeHashTable.Add(HTreeItem(Item), Result);
{$ENDIF}
    if (FUpdateCount = 0) and Result.IsFirstNode then
      SendMessage(Handle, WM_SETREDRAW, 1, 0);
    AddedNode(Parent);
    Owner.Added(Result);
  except
    Result.Free;
    raise;
  end;
end;

procedure TTreeNodes.Repaint(Node: TTreeNode);
var
  R: TRect;
begin
  if FUpdateCount < 1 then
  begin
    while (Node <> nil) and not Node.IsVisible do
      Node := Node.Parent;
    if Node <> nil then
    begin
      R := Node.DisplayRect(False);
      InvalidateRect(Owner.Handle, R, True);
    end;
  end;
end;

procedure TTreeNodes.AddedNode(Value: TTreeNode);
begin
  if Value <> nil then
  begin
    Value.HasChildren := True;
    Repaint(Value);
  end;
end;

function TTreeNodes.CreateItem(Node: TTreeNode): TTVItem;
begin
  Node.FInTree := True;
  with Result do
  begin
    mask := TVIF_TEXT or TVIF_PARAM or TVIF_IMAGE or TVIF_SELECTEDIMAGE;
{$IFDEF CLR}
    pszText := IntPtr(LPSTR_TEXTCALLBACK);
{$ELSE}
    lParam := Winapi.Windows.LPARAM(Node);
    pszText := LPSTR_TEXTCALLBACK;
{$ENDIF}
    iImage := I_IMAGECALLBACK;
    iSelectedImage := I_IMAGECALLBACK;
  end;
end;

function TTreeNodes.AddItem(Parent, Target: HTreeItem;
  const Item: TTVItem; AddMode: TAddMode): HTreeItem;
var
  InsertStruct: TTVInsertStruct;
{$IFDEF CLR}
  TVItem: TTVItem;
{$ENDIF}
begin
  ClearCache;
  with InsertStruct do
  begin
    hParent := Parent;
    case AddMode of
      taAddFirst:
        hInsertAfter := HTREEITEM(TVI_FIRST);
      taAdd:
        hInsertAfter := HTREEITEM(TVI_LAST);
      taInsert:
        hInsertAfter := Target;
    end;
  end;
  InsertStruct.item := Item;
  FOwner.FChangeTimer.Enabled := False;
  Result := TreeView_InsertItem(Handle, InsertStruct);

{$IFDEF CLR}
  // Modify the item to set the item's handle as the lParam, which is
  // needed for later retrieving the TreeNode object to perform custom sorting
  with TVItem do
  begin
    mask := TVIF_PARAM;
    hItem := Result;
    lParam := THandle(Result);
  end;
  TreeView_SetItem(Handle, TVItem);
{$ENDIF}
end;

function TTreeNodes.GetFirstNode: TTreeNode;
begin
  Result := GetNode(TreeView_GetRoot(Handle));
end;

function TTreeNodes.GetEnumerator: TTreeNodesEnumerator;
begin
  Result := TTreeNodesEnumerator.Create(Self);
end;

function TTreeNodes.GetNodeFromIndex(Index: Integer): TTreeNode;
var
  I: Integer;
begin
  if Index < 0 then
    TreeViewError(sInvalidIndex);
  if (FNodeCache.CacheNode <> nil) and (Abs(FNodeCache.CacheIndex - Index) <= 1) then
  begin
    with FNodeCache do
    begin
      if Index = CacheIndex then
        Result := CacheNode
      else
        if Index < CacheIndex then
          Result := CacheNode.GetPrev
        else
          Result := CacheNode.GetNext;
    end;
  end
  else
  begin
    Result := GetFirstNode;
    I := Index;
    while (I <> 0) and (Result <> nil) do
    begin
      Result := Result.GetNext;
      Dec(I);
    end;
  end;
  if Result = nil then
    TreeViewError(sInvalidIndex);
  FNodeCache.CacheNode := Result;
  FNodeCache.CacheIndex := Index;
end;

function TTreeNodes.GetReading: Boolean;
begin
  if FOwner = nil then
    Result := False
  else
    Result := FOwner.Reading;
end;

function TTreeNodes.GetNode(ItemId: HTreeItem): TTreeNode;
var
  Item: TTVItem;
begin
  with Item do
  begin
    hItem := ItemId;
    mask := TVIF_PARAM;
  end;
  if TreeView_GetItem(Handle, Item) then
{$IFDEF CLR}
    Result := TTreeNode(FNodeHashTable.Item[HTreeItem(Item.lParam)])
{$ELSE}
    Result := TTreeNode(Item.lParam)
{$ENDIF}
  else
    Result := nil;
end;

procedure TTreeNodes.SetItem(Index: Integer; Value: TTreeNode);
begin
  GetNodeFromIndex(Index).Assign(Value);
end;

procedure TTreeNodes.BeginUpdate;
begin
  if FUpdateCount = 0 then
    SetUpdateState(True);
  Inc(FUpdateCount);
end;

procedure TTreeNodes.SetUpdateState(Updating: Boolean);
begin
  SendMessage(Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then
    Owner.Refresh;
end;

procedure TTreeNodes.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then
    SetUpdateState(False);
end;

procedure TTreeNodes.Assign(Source: TPersistent);
var
  TreeNodes: TTreeNodes;
  MemStream: TMemoryStream;
begin
  ClearCache;
  if Source is TTreeNodes then
  begin
    TreeNodes := TTreeNodes(Source);
    Clear;
    MemStream := TMemoryStream.Create;
    try
      TreeNodes.WriteNodeData(MemStream);
      MemStream.Position := 0;
      ReadNodeData(MemStream);
    finally
      MemStream.Free;
    end;
  end
  else inherited Assign(Source);
end;

procedure TTreeNodes.DefineProperties(Filer: TFiler);

  function WriteNodes: Boolean;
  var
    I: Integer;
    Nodes: TTreeNodes;
  begin
    Nodes := TTreeNodes(Filer.Ancestor);
    if Nodes = nil then
      Result := Count > 0
    else if Nodes.Count <> Count then
      Result := True
    else
    begin
      Result := False;
      for I := 0 to Count - 1 do
      begin
        Result := not Item[I].IsEqual(Nodes[I]);
        if Result then
          Break;
      end
    end;
  end;

begin
  inherited DefineProperties(Filer);
  // Data property is platform specific (Ansi)
  // NodeData property stores data in Unicode
  Filer.DefineBinaryProperty('Data', ReadData, nil, False);
  Filer.DefineBinaryProperty('NodeData', ReadNodeData, WriteNodeData, WriteNodes);
end;

procedure TTreeNodes.ReadData(Stream: TStream);
var
  I, Count: Integer;
  LNode: TTreeNode;
  LHandleAllocated: Boolean;
{$IFDEF CLR}
  NodeInfo: TNodeInfo32;
{$ELSE}
  NodeInfo: TNodeInfo;
{$ENDIF}
begin
  LHandleAllocated := Owner.HandleAllocated;
  if LHandleAllocated then
    BeginUpdate;
  Owner.FReading := True;
  try
    Clear;
    Stream.ReadBuffer(Count, SizeOf(Count));
    for I := 0 to Count - 1 do
    begin
      LNode := Add(nil, '');
      LNode.ReadData(Stream, {$IFNDEF CLR}@{$ENDIF}NodeInfo);
      Owner.Added(LNode);
    end;
  finally
    Owner.FReading := False;
    if LHandleAllocated then
      EndUpdate;
  end;
end;

const
  TreeNodeStreamVersion1    = $01;  // 32-bit struct size version 1
  TreeNodeStreamVersion1x64 = $02;  // 64-bit struct size version 1
  TreeNodeStreamVersion2    = $03;  // 32-bit struct size version 2
  TreeNodeStreamVersion2x64 = $04;  // 64-bit struct size version 2

procedure TTreeNodes.ReadNodeData(Stream: TStream);
var
  StreamVersion: Byte;
  I, Count: Integer;
  LNode: TTreeNode;
  LHandleAllocated: Boolean;
  LNodeDataType: TNodeDataType;
begin
  LHandleAllocated := Owner.HandleAllocated;
  if LHandleAllocated then
    BeginUpdate;
  Owner.FReading := True;
  try
    Clear;
    Stream.ReadBuffer(StreamVersion, SizeOf(StreamVersion));

{$IFDEF CLR}
    LNodeDataType := ndt32bit; // remove compiler warning
{$ENDIF}
    case StreamVersion of
{$IFDEF CLR}
      TreeNodeStreamVersion:
        if IntPtr.Size = 8 then
          LNodeDataType := ndt32bit;
      TreeNodeStreamVersion64:
        if IntPtr.Size = 4 then
          LNodeDataType := ndt64bit;
      TreeNodeStreamVersion2:
        if IntPtr.Size = 8 then
          LNodeDataType := ndt232bit
        else
          LNodeDataType := ndtDefault2;
      TreeNodeStreamVersion264:
        if IntPtr.Size = 4 then
          LNodeDataType := ndt264bit
        else
          LNodeDataType := ndtDefault2;
{$ELSE}
      TreeNodeStreamVersion1:
        LNodeDataType := ndtDefault;
      TreeNodeStreamVersion2:
        LNodeDataType := ndt232bit;
      TreeNodeStreamVersion2x64:
        LNodeDataType := ndt264bit;
{$ENDIF}
    else
      Exit;
    end;

    Stream.ReadBuffer(Count, SizeOf(Count));
    for I := 0 to Count - 1 do
    begin
      LNode := Add(nil, '');
{$IFDEF CLR}
      LNode.ReadNodeData(Stream, LNodeDataType);
{$ELSE}
      LNode.ReadNodeData(Stream, LNodeDataType);
{$ENDIF}
      Owner.Added(LNode);
    end;
  finally
    Owner.FReading := False;
    if LHandleAllocated then
      EndUpdate;
  end;
end;

procedure TTreeNodes.WriteNodeData(Stream: TStream);
var
  I: Integer;
  Node: TTreeNode;
  LStreamVersion: Byte;
begin
  I := 0;
  Node := GetFirstNode;
  while Node <> nil do
  begin
    Inc(I);
    Node := Node.GetNextSibling;
  end;
  // Check which platform we're running under and write the
  // appropriate stream version. TNodeInfo.Data has a different
  // size when running as a 64-bit application.
{$IFDEF CLR}
  if IntPtr.Size = 4 then
    LStreamVersion := TreeNodeStreamVersion2
  else
    LStreamVersion := TreeNodeStreamVersion264;
{$ELSE}
{$IFDEF CPUX86}
  LStreamVersion := TreeNodeStreamVersion2;
{$ELSE}
  LStreamVersion := TreeNodeStreamVersion2x64;
{$ENDIF}
{$ENDIF}
  Stream.WriteBuffer(LStreamVersion, SizeOf(Byte));
  Stream.WriteBuffer(I, SizeOf(I));
  Node := GetFirstNode;
  while Node <> nil do
  begin
    Node.WriteNodeData(Stream);
    Node := Node.GetNextSibling;
  end;
end;

procedure TTreeNodes.ReadExpandedState(Stream: TStream);
var
  ItemCount, Index: Integer;
  Node: TTreeNode;
  NodeExpanded: Byte;
begin
  if Stream.Position < Stream.Size then
    Stream.ReadBuffer(ItemCount, SizeOf(ItemCount))
  else
    Exit;
  Index := 0;
  Node := GetFirstNode;
  while (Index < ItemCount) and (Node <> nil) do
  begin
    Stream.ReadBuffer(NodeExpanded, SizeOf(NodeExpanded));
    Node.Expanded := Boolean(NodeExpanded);
    Inc(Index);
    Node := Node.GetNext;
  end; 
end;

procedure TTreeNodes.WriteExpandedState(Stream: TStream);
var
  Size: Integer;
  Node: TTreeNode;
  NodeExpanded: Boolean;
begin
  Size := SizeOf(Boolean) * Count;
  Stream.WriteBuffer(Size, SizeOf(Size));
  Node := GetFirstNode;
  while (Node <> nil) do
  begin
    NodeExpanded := Node.Expanded;
    Stream.WriteBuffer(NodeExpanded, SizeOf(Boolean));
    Node := Node.GetNext;
  end;
end;

procedure TTreeNodes.ClearCache;
begin
  FNodeCache.CacheNode := nil;
end;

{ TTreeStrings }

type
  TTreeStrings = class(TStrings)
  private
    FOwner: TTreeNodes;
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetUpdateState(Updating: Boolean); override;
{$IFDEF CLR}
    function GetBufStart(Buffer: string; var Level: Integer): string;
{$ELSE}
    function GetBufStart(Buffer: PChar; var Level: Integer): PChar;
{$ENDIF}
  public
    constructor Create(AOwner: TTreeNodes);
    function Add(const S: string): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
    procedure LoadTreeFromStream(Stream: TStream; AEncoding: TEncoding);
    procedure SaveTreeToStream(Stream: TStream; AEncoding: TEncoding);
    property Owner: TTreeNodes read FOwner;
  end;

constructor TTreeStrings.Create(AOwner: TTreeNodes);
begin
  inherited Create;
  FOwner := AOwner;
end;

function TTreeStrings.Get(Index: Integer): string;
const
  TabChar = #9;
{$IFDEF CLR}
var
  Level, I: Integer;
  Node: TTreeNode;
  Buffer: StringBuilder;
begin
  Buffer := StringBuilder.Create(1024);
  Node := Owner.GetNodeFromIndex(Index);
  Level := Node.Level;
  for I := 0 to Level - 1 do
    Buffer.Append(TabChar);
  Buffer.Append(Node.Text);
  Result := Buffer.ToString;
{$ELSE}
var
  Level, I: Integer;
  Node: TTreeNode;
begin
  Result := '';
  Node := Owner.GetNodeFromIndex(Index);
  Level := Node.Level;
  for I := 0 to Level - 1 do Result := Result + TabChar;
  Result := Result + Node.Text;
{$ENDIF}
end;

{$IFDEF CLR}
function TTreeStrings.GetBufStart(Buffer: string; var Level: Integer): string;
var
  Pos: Integer;
begin
  Pos := 1;
  Level := 0;
  while (CharInSet(Buffer[Pos], [' ', #9])) do
  begin
    Inc(Pos);
    Inc(Level);
  end;
  Result := Copy(Buffer, Pos, Length(Buffer) - Pos + 1);
end;
{$ELSE}
function TTreeStrings.GetBufStart(Buffer: PChar; var Level: Integer): PChar;
begin
  Level := 0;
  while CharInSet(Buffer^, [' ', #9]) do
  begin
    Inc(Buffer);
    Inc(Level);
  end;
  Result := Buffer;
end;
{$ENDIF}

function TTreeStrings.GetObject(Index: Integer): TObject;
begin
  Result := Owner.GetNodeFromIndex(Index).Data;
end;

procedure TTreeStrings.PutObject(Index: Integer; AObject: TObject);
begin
  Owner.GetNodeFromIndex(Index).Data := AObject;
end;

function TTreeStrings.GetCount: Integer;
begin
  Result := Owner.Count;
end;

procedure TTreeStrings.Clear;
begin
  Owner.Clear;
end;

procedure TTreeStrings.Delete(Index: Integer);
begin
  Owner.GetNodeFromIndex(Index).Delete;
end;

procedure TTreeStrings.SetUpdateState(Updating: Boolean);
begin
  SendMessage(Owner.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then
    Owner.Owner.Refresh;
end;

function TTreeStrings.Add(const S: string): Integer;
var
  Level, OldLevel, I: Integer;
  NewStr: string;
  Node: TTreeNode;
begin
  Result := GetCount;
  if (Length(S) = 1) and (S[1] = Chr($1A)) then
    Exit;
  Node := nil;
  OldLevel := 0;
{$IFDEF CLR}
  NewStr := GetBufStart(S, Level);
{$ELSE}
  NewStr := GetBufStart(PChar(S), Level);
{$ENDIF}
  if Result > 0 then
  begin
    Node := Owner.GetNodeFromIndex(Result - 1);
    OldLevel := Node.Level;
  end;
  if (Level > OldLevel) or (Node = nil) then
  begin
    if Level - OldLevel > 1 then
      TreeViewError(sInvalidLevel);
  end
  else
  begin
    for I := OldLevel downto Level do
    begin
      Node := Node.Parent;
      if (Node = nil) and (I - Level > 0) then
        TreeViewError(sInvalidLevel);
    end;
  end;
  Owner.AddChild(Node, NewStr);
end;

procedure TTreeStrings.Insert(Index: Integer; const S: string);
begin
  with Owner do
    Insert(GetNodeFromIndex(Index), S);
end;

procedure TTreeStrings.LoadTreeFromStream(Stream: TStream; AEncoding: TEncoding);
var
  List: TStringList;
  ANode, NextNode: TTreeNode;
  ALevel, i: Integer;
  CurrStr: string;
begin
  List := TStringList.Create;
  Owner.BeginUpdate;
  try
    try
      Clear;
      List.LoadFromStream(Stream, AEncoding);
      if Owner.FOwner <> nil then
        Owner.FOwner.SetEncoding(List.Encoding);
      ANode := nil;
      for i := 0 to List.Count - 1 do
      begin
{$IFDEF CLR}
        CurrStr := GetBufStart(List[i], ALevel);
{$ELSE}
        CurrStr := GetBufStart(PChar(List[i]), ALevel);
{$ENDIF}
        if ANode = nil then
          ANode := Owner.AddChild(nil, CurrStr)
        else if ANode.Level = ALevel then
          ANode := Owner.AddChild(ANode.Parent, CurrStr)
        else if ANode.Level = (ALevel - 1) then
          ANode := Owner.AddChild(ANode, CurrStr)
        else if ANode.Level > ALevel then
        begin
          NextNode := ANode.Parent;
          while NextNode.Level > ALevel do
            NextNode := NextNode.Parent;
          ANode := Owner.AddChild(NextNode.Parent, CurrStr);
        end
        else TreeViewErrorFmt(sInvalidLevelEx, [ALevel, CurrStr]);
      end;
    finally
      Owner.EndUpdate;
      List.Free;
    end;
  except
    Owner.Owner.Invalidate;  // force repaint on exception
    raise;
  end;
end;

procedure TTreeStrings.SaveTreeToStream(Stream: TStream; AEncoding: TEncoding);
const
  TabChar = #9;
  EndOfLine = #13#10;
var
  I: Integer;
  ANode: TTreeNode;
  NodeStr: TStringBuilder;
  Buffer, Preamble: TBytes;
begin
  if Count > 0 then
  begin
    if AEncoding = nil then
      AEncoding := TEncoding.Default;
    Buffer := AEncoding.GetBytes(GetTextStr);
    Preamble := AEncoding.GetPreamble;
    if Length(Preamble) > 0 then
      Stream.WriteBuffer(Preamble{$IFNDEF CLR}[0]{$ENDIF}, Length(Preamble));

    NodeStr := TStringBuilder.Create(1024);
    try
      ANode := Owner[0];
      while ANode <> nil do
      begin
        NodeStr.Length := 0;
        for I := 0 to ANode.Level - 1 do
          NodeStr.Append(TabChar);
        NodeStr.Append(ANode.Text);
        NodeStr.Append(EndOfLine);
        Buffer := AEncoding.GetBytes(NodeStr.ToString);
        Stream.Write(Buffer{$IFNDEF CLR}[0]{$ENDIF}, Length(Buffer));
        ANode := ANode.GetNext;
      end;
    finally
      NodeStr.Free;
    end;
  end;
end;

function TTreeNodes.AlphaSort(ARecurse: Boolean): Boolean;
begin
  Result := FOwner.AlphaSort(ARecurse);
end;

{$IFDEF CLR}
function TTreeNodes.CustomSort(SortProc: TTVCompareProc; Data: TTag; ARecurse: Boolean): Boolean;
{$ELSE}
function TTreeNodes.CustomSort(SortProc: TTVCompare; Data: NativeInt; ARecurse: Boolean): Boolean;
{$ENDIF}
begin
  Result := FOwner.CustomSort(SortProc, Data, ARecurse);
end;

{$IFDEF CLR}
type
  TTVChangeTimer = class(TTimer)
  private
    FNode: TTreeNode;
  public
    property Node: TTreeNode read FNode write FNode;
  end;

procedure TTVEditInstance.Finalize;
begin
  if Assigned(FHandle) then
  begin
    FreeObjectInstance(FHandle);
    FHandle := nil;
  end;
  inherited;
end;
{$ENDIF}

{ TCustomTreeView }

class constructor TCustomTreeView.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomTreeView, TTreeViewStyleHook);
end;

constructor TCustomTreeView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csCaptureMouse] +
    [csDisplayDragImage, csReflector, csPannable];
  Width := 121;
  Height := 97;
  TabStop := True;
  ParentColor := False;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FTreeNodes := CreateNodes;
  FBorderStyle := bsSingle;
  FShowButtons := True;
  FShowRoot := True;
  FShowLines := True;
  FHideSelection := True;
  FDragImage := TDragImageList.CreateSize(32, 32);
  FSaveIndent := -1;
  FSelections := TList.Create;
  FMultiSelect := False;
  FMultiSelectStyle := [msControlSelect];
{$IFDEF CLR}
  FChangeTimer := TTVChangeTimer.Create(Self);
{$ELSE}
  FChangeTimer := TTimer.Create(Self);
{$ENDIF}
  FChangeTimer.Enabled := False;
  FChangeTimer.Interval := 0;
  FChangeTimer.OnTimer := OnChangeTimer;
  FCreateWndRestores := True;
  FToolTips := True;
{$IFDEF CLR}
  FEditInstance := TTVEditInstance.Create;
  FEditInstance.Handle := MakeObjectInstance(EditWndProc);
{$ELSE}
  FEditInstance := MakeObjectInstance(EditWndProc);
{$ENDIF}
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FStateChangeLink := TChangeLink.Create;
  FStateChangeLink.OnChange := ImageListChange;
  FSaveIndex := -1;
  FInBufferedPrintClient := False;
  Touch.InteractiveGestures := [igPan, igPressAndTap];
  Touch.InteractiveGestureOptions := [igoPanInertia,
    igoPanSingleFingerHorizontal, igoPanSingleFingerVertical,
    igoPanGutter, igoParentPassthrough];

end;

class destructor TCustomTreeView.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomTreeView, TTreeViewStyleHook);
end;

destructor TCustomTreeView.Destroy;
begin
  // the following should not be reduced to a FreeAndNil
  FTreeNodes.Free;
  FTreeNodes := nil;

  FSaveIndexes.Free;
  FSelections.Free;
  FChangeTimer.Free;
  FSaveItems.Free;
  FDragImage.Free;
  FMemStream.Free;
{$IFDEF CLR}
  if Assigned(FEditInstance) then
  begin
    if Assigned(FEditInstance.Handle) then
    begin
      FreeObjectInstance(FEditInstance.Handle);
      FEditInstance.Handle := nil;
    end;
    System.GC.SuppressFinalize(FEditInstance);
    FreeAndNil(FEditInstance);
  end;
{$ELSE}
  FreeObjectInstance(FEditInstance);
{$ENDIF}
  FImageChangeLink.Free;
  FStateChangeLink.Free;
  FCanvas.Free;
  FCanvas := nil;
  if (FEncoding <> nil) and not TEncoding.IsStandardEncoding(FEncoding) then
    FEncoding.Free;
  inherited Destroy;
end;

procedure TCustomTreeView.CreateParams(var Params: TCreateParams);
const
  BorderStyles: array[TBorderStyle] of DWORD = (0, WS_BORDER);
  LineStyles: array[Boolean] of DWORD = (0, TVS_HASLINES);
  RootStyles: array[Boolean] of DWORD = (0, TVS_LINESATROOT);
  ButtonStyles: array[Boolean] of DWORD = (0, TVS_HASBUTTONS);
  EditStyles: array[Boolean] of DWORD = (TVS_EDITLABELS, 0);
  HideSelections: array[Boolean] of DWORD = (TVS_SHOWSELALWAYS, 0);
  DragStyles: array[TDragMode] of DWORD = (TVS_DISABLEDRAGDROP, 0);
  RTLStyles: array[Boolean] of DWORD = (0, TVS_RTLREADING);
  ToolTipStyles: array[Boolean] of DWORD = (TVS_NOTOOLTIPS, TVS_INFOTIP);
  AutoExpandStyles: array[Boolean] of DWORD = (0, TVS_SINGLEEXPAND);
  HotTrackStyles: array[Boolean] of DWORD = (0, TVS_TRACKSELECT);
  RowSelectStyles: array[Boolean] of DWORD = (0, TVS_FULLROWSELECT);
begin
  InitCommonControl(ICC_TREEVIEW_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, WC_TREEVIEW);
  with Params do
  begin
    Style := Style or LineStyles[FShowLines] or BorderStyles[FBorderStyle] or
      RootStyles[FShowRoot] or ButtonStyles[FShowButtons] or
      EditStyles[FReadOnly] or HideSelections[FHideSelection] or
      DragStyles[DragMode] or RTLStyles[UseRightToLeftReading] or
      ToolTipStyles[FToolTips] or AutoExpandStyles[FAutoExpand] or
      HotTrackStyles[FHotTrack] or RowSelectStyles[FRowSelect];
    if Ctl3D and NewStyleControls and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := Params.ExStyle or WS_EX_CLIENTEDGE;
    end;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomTreeView.CreateWnd;
var
  I: Integer;
begin
  FStateChanging := False;
  inherited CreateWnd;
  TreeView_SetBkColor(Handle, ColorToRGB(Color));
  TreeView_SetTextColor(Handle, ColorToRGB(Font.Color));
  if FMemStream <> nil then
  begin
    Items.BeginUpdate;
    try
      Items.ReadNodeData(FMemStream);
      Items.ReadExpandedState(FMemStream);
      FreeAndNil(FMemStream);
      SetTopItem(Items.GetNodeFromIndex(FSaveTopIndex));
      FSaveTopIndex := 0;
      if FSaveIndexes <> nil then
      begin
        for I := 0 to FSaveIndexes.Count - 1 do
          FSelections.Add(Items.GetNodeFromIndex(Integer(FSaveIndexes[I])));
        FreeAndNil(FSaveIndexes);
        ValidateSelection;
        SetSelected(Selections[0]);
      end
      else
      if FSaveIndex <> -1 then
        SetSelected(Items.GetNodeFromIndex(FSaveIndex));
      FSaveIndex := -1;
    finally
      Items.EndUpdate;
    end;
  end;
  if FSaveIndent <> -1 then
    Indent := FSaveIndent;
  if (Images <> nil) and Images.HandleAllocated then
    SetImageList(Images.Handle, TVSIL_NORMAL);
  if (StateImages <> nil) and StateImages.HandleAllocated then
    SetImageList(StateImages.Handle, TVSIL_STATE);
  if StyleServices.Enabled and TOSVersion.Check(6) and StyleServices.IsSystemStyle then
    SetWindowTheme(Handle, 'explorer', nil); // do not localize
end;

procedure TCustomTreeView.DestroyWnd;
var
  Node: TTreeNode;
  I: Integer;
begin
  FStateChanging := True;
  FRClickNode := nil;
  FShiftAnchor := nil;
  if FCreateWndRestores and (Items.Count > 0) and (csRecreating in ControlState) then
  begin
    FMemStream := TMemoryStream.Create;
    Items.WriteNodeData(FMemStream);
    Items.WriteExpandedState(FMemStream);
    FMemStream.Position := 0;
    FSaveTopIndex := 0;
    FSaveIndex := -1;
    Node := GetTopItem;
    if Node <> nil then
      FSaveTopIndex := Node.AbsoluteIndex;
    Items.BeginUpdate;
    try
      if MultiSelect and (FSelections.Count > 1) then
      begin
        FSaveIndexes := TList.Create;
        for I := 0 to FSelections.Count - 1 do
{$IFDEF CLR}
          FSaveIndexes.Add(TObject(TTreeNode(FSelections[I]).AbsoluteIndex));
{$ELSE}
          FSaveIndexes.Add(Pointer(TTreeNode(FSelections[I]).AbsoluteIndex));
{$ENDIF}
        FSelections.Clear;
      end
      else
      begin
        Node := Selected;
        if Node <> nil then
          FSaveIndex := Node.AbsoluteIndex;
      end;
      Items.Clear;
    finally
      Items.EndUpdate;
    end;
  end;
  FSaveIndent := Indent;
  inherited DestroyWnd; 
end;

procedure TCustomTreeView.EditWndProc(var Message: TMessage);
var
  LWindowRect: TRect;
{$IFDEF CLR}
  KeyMsg: TWMKey;
{$ENDIF}
begin
  try
    with Message do
    begin
      case Msg of
        WM_KEYDOWN,
        WM_SYSKEYDOWN:
          begin
{$IFDEF CLR}
            KeyMsg := TWMKey.Create(Message);
            if DoKeyDown(KeyMsg) then
{$ELSE}
            if DoKeyDown(TWMKey(Message)) then
{$ENDIF}
              Exit;
          end;
        WM_CHAR:
          begin
{$IFDEF CLR}
            KeyMsg := TWMKey.Create(Message);
            if DoKeyPress(KeyMsg) then
{$ELSE}
            if DoKeyPress(TWMKey(Message)) then
{$ENDIF}
              Exit;
          end;
        WM_KEYUP,
        WM_SYSKEYUP:
          begin
{$IFDEF CLR}
            KeyMsg := TWMKey.Create(Message);
            if DoKeyUp(KeyMsg) then
{$ELSE}
            if DoKeyUp(TWMKey(Message)) then
{$ENDIF}
              Exit;
          end;
        CN_KEYDOWN,
        CN_CHAR, CN_SYSKEYDOWN,
        CN_SYSCHAR:
          begin
            WndProc(Message);
            Exit;
          end;
        CM_BUFFEREDPRINTCLIENT:
          if FInBufferedPrintClient then
          begin
            GetWindowRect(FEditHandle, LWindowRect);
            MapWindowPoints(0, FEditHandle, LWindowRect, 2);
            PerformBufferedPrintClient(FEditHandle, LWindowRect);
            FInBufferedPrintClient := False;
            Exit;
          end;
      end;
      Result := CallWindowProc(FDefEditProc, FEditHandle, Msg, WParam, LParam);
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TCustomTreeView.CMColorChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated then
    TreeView_SetBkColor(Handle, ColorToRGB(Color));
end;

procedure TCustomTreeView.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  if FBorderStyle = bsSingle then RecreateWnd;
end;

procedure TCustomTreeView.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated then
    TreeView_SetTextColor(Handle, ColorToRGB(Font.Color));
end;

procedure TCustomTreeView.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) then
    RecreateWnd;
end;

function TCustomTreeView.AlphaSort(ARecurse: Boolean): Boolean;
begin
{$IFDEF CLR}
  Result := CustomSort(nil, nil, ARecurse);
{$ELSE}
  Result := CustomSort(nil, 0, ARecurse);
{$ENDIF}
end;

{$IFDEF CLR}
function TCustomTreeView.CustomSort(SortProc: TTVCompareProc; Data: TTag; ARecurse: Boolean = True): Boolean;
{$ELSE}
function TCustomTreeView.CustomSort(SortProc: TTVCompare; Data: NativeInt; ARecurse: Boolean = True): Boolean;
{$ENDIF}
var
  SortCB: TTVSortCB;
  Node: TTreeNode;
{$IFDEF CLR}
  CompareWrapper: TTVCompareWrapper;
{$ENDIF}
begin
  Result := False;
  if HandleAllocated then
  begin
    with SortCB do
    begin
{$IFDEF CLR}
      if not Assigned(SortProc) then
        CompareWrapper.SortProc := DefaultTreeViewSort
      else
        CompareWrapper.SortProc := SortProc;
      lpfnCompare := CustomTreeViewSort;
      CompareWrapper.Data := Data;
      hParent := HTREEITEM(TVI_ROOT);
      lParam := THandle(IntPtr(GCHandle.Alloc(CompareWrapper)));
      try
        Result := TreeView_SortChildrenCB(Handle, SortCB, 0);
      finally
        GCHandle(IntPtr(lParam)).Free;
      end;
{$ELSE}
      if not Assigned(SortProc) then
        lpfnCompare := @DefaultTreeViewSort
      else
        lpfnCompare := SortProc;
      hParent := TVI_ROOT;
      lParam := Data;
      Result := TreeView_SortChildrenCB(Handle, SortCB, 0);
{$ENDIF}
    end;

    if ARecurse then
    begin
      Node := FTreeNodes.GetFirstNode;
      while Node <> nil do
      begin
        if Node.HasChildren then
          Node.CustomSort(SortProc, Data, True);
        Node := Node.GetNextSibling;
      end;
    end;
    Items.ClearCache;
  end;
end;

procedure TCustomTreeView.SetAutoExpand(Value: Boolean);
begin
  if FAutoExpand <> Value then
  begin
    FAutoExpand := Value;
    SetComCtlStyle(Self, TVS_SINGLEEXPAND, Value);
  end;
end;

procedure TCustomTreeView.SetHotTrack(Value: Boolean);
begin
  if FHotTrack <> Value then
  begin
    FHotTrack := Value;
    SetComCtlStyle(Self, TVS_TRACKSELECT, Value);
  end;
end;

procedure TCustomTreeView.SetRowSelect(Value: Boolean);
begin
  if FRowSelect <> Value then
  begin
    FRowSelect := Value;
    SetComCtlStyle(Self, TVS_FULLROWSELECT, Value);
  end;
end;

procedure TCustomTreeView.SetToolTips(Value: Boolean);
begin
  if FToolTips <> Value then
  begin
    FToolTips := Value;
    SetComCtlStyle(Self, TVS_NOTOOLTIPS, not Value);
  end;
end;

procedure TCustomTreeView.SetSortType(Value: TSortType);
begin
  if SortType <> Value then
  begin
    FSortType := Value;
    if ((SortType in [stData, stBoth]) and Assigned(OnCompare)) or
      (SortType in [stText, stBoth]) then
      AlphaSort;
  end;
end;

procedure TCustomTreeView.SetBorderStyle(Value: TBorderStyle);
begin
  if BorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TCustomTreeView.SetDragMode(Value: TDragMode);
begin
  if Value <> DragMode then
    SetComCtlStyle(Self, TVS_DISABLEDRAGDROP, Value = dmManual);
  inherited;
end;

procedure TCustomTreeView.SetButtonStyle(Value: Boolean);
begin
  if ShowButtons <> Value then
  begin
    FShowButtons := Value;
    SetComCtlStyle(Self, TVS_HASBUTTONS, Value);
  end;
end;

procedure TCustomTreeView.SetLineStyle(Value: Boolean);
begin
  if ShowLines <> Value then
  begin
    FShowLines := Value;
    SetComCtlStyle(Self, TVS_HASLINES, Value);
  end;
end;

procedure TCustomTreeView.SetRootStyle(Value: Boolean);
begin
  if ShowRoot <> Value then
  begin
    FShowRoot := Value;
    SetComCtlStyle(Self, TVS_LINESATROOT, Value);
  end;
end;

procedure TCustomTreeView.SetReadOnly(Value: Boolean);
begin
  if ReadOnly <> Value then
  begin
    FReadOnly := Value;
    SetComCtlStyle(Self, TVS_EDITLABELS, not Value);
  end;
end;

procedure TCustomTreeView.SetHideSelection(Value: Boolean);
begin
  if HideSelection <> Value then
  begin
    FHideSelection := Value;
    SetComCtlStyle(Self, TVS_SHOWSELALWAYS, not Value);
    Invalidate;
  end;
end;

function TCustomTreeView.GetNodeAt(X, Y: Integer): TTreeNode;
var
  HitTest: TTVHitTestInfo;
begin
  with HitTest do
  begin
    pt.X := X;
    pt.Y := Y;
    if TreeView_HitTest(Handle, HitTest) <> nil then
      Result := Items.GetNode(HitTest.hItem)
    else Result := nil;
  end;
end;

function TCustomTreeView.GetHitTestInfoAt(X, Y: Integer): THitTests;
var
  HitTest: TTVHitTestInfo;
begin
  Result := [];
  with HitTest do
  begin
    pt.X := X;
    pt.Y := Y;
    TreeView_HitTest(Handle, HitTest);
    if (flags and TVHT_ABOVE) <> 0 then Include(Result, htAbove);
    if (flags and TVHT_BELOW) <> 0 then Include(Result, htBelow);
    if (flags and TVHT_NOWHERE) <> 0 then Include(Result, htNowhere);
    if (flags and TVHT_ONITEM) = TVHT_ONITEM then
      Include(Result, htOnItem)
    else
    begin
      if (flags and TVHT_ONITEM) <> 0 then Include(Result, htOnItem);
      if (flags and TVHT_ONITEMICON) <> 0 then Include(Result, htOnIcon);
      if (flags and TVHT_ONITEMLABEL) <> 0 then Include(Result, htOnLabel);
      if (flags and TVHT_ONITEMSTATEICON) <> 0 then Include(Result, htOnStateIcon);
    end;
    if (flags and TVHT_ONITEMBUTTON) <> 0 then Include(Result, htOnButton);
    if (flags and TVHT_ONITEMINDENT) <> 0 then Include(Result, htOnIndent);
    if (flags and TVHT_ONITEMRIGHT) <> 0 then Include(Result, htOnRight);
    if (flags and TVHT_TOLEFT) <> 0 then Include(Result, htToLeft);
    if (flags and TVHT_TORIGHT) <> 0 then Include(Result, htToRight);
  end;
end;

procedure TCustomTreeView.SetTreeNodes(Value: TTreeNodes);
begin
  Items.Assign(Value);
end;

procedure TCustomTreeView.SetIndent(Value: Integer);
begin
  if Value <> Indent then TreeView_SetIndent(Handle, Value);
end;

function TCustomTreeView.GetIndent: Integer;
begin
  Result := TreeView_GetIndent(Handle)
end;

procedure TCustomTreeView.FullExpand;
var
  Node: TTreeNode;
begin
  Node := Items.GetFirstNode;
  while Node <> nil do
  begin
    Node.Expand(True);
    Node := Node.GetNextSibling;
  end;
end;

procedure TCustomTreeView.FullCollapse;
var
  Node: TTreeNode;
begin
  Node := Items.GetFirstNode;
  while Node <> nil do
  begin
    Node.Collapse(True);
    Node := Node.GetNextSibling;
  end;
end;

procedure TCustomTreeView.Loaded;
begin
  inherited Loaded;
  if csDesigning in ComponentState then FullExpand;
end;

function TCustomTreeView.GetTopItem: TTreeNode;
begin
  if HandleAllocated then
    Result := Items.GetNode(TreeView_GetFirstVisible(Handle))
  else Result := nil;
end;

procedure TCustomTreeView.SetTopItem(Value: TTreeNode);
begin
  if HandleAllocated and (Value <> nil) then
    TreeView_SelectSetFirstVisible(Handle, Value.ItemId);
end;

procedure TCustomTreeView.OnChangeTimer(Sender: TObject);
begin
  FChangeTimer.Enabled := False;
{$IFDEF CLR}
  Change(TTVChangeTimer(FChangeTimer).Node);
{$ELSE}
  Change(TTreeNode(FChangeTimer.Tag));
{$ENDIF}
end;

function TCustomTreeView.GetSelected: TTreeNode;
begin
  if HandleAllocated then
  begin
    if FRightClickSelect and Assigned(FRClickNode) then
      Result := FRClickNode
    else
      Result := Items.GetNode(TreeView_GetSelection(Handle));
  end
  else Result := nil;
end;

procedure TCustomTreeView.SetSelected(Value: TTreeNode);
begin
  if Value <> nil then
    Value.Selected := True
  else
    TreeView_SelectItem(Handle, nil);
end;

procedure TCustomTreeView.SetChangeDelay(Value: Integer);
begin
  FChangeTimer.Interval := Value;
end;

function TCustomTreeView.GetChangeDelay: Integer;
begin
  Result := FChangeTimer.Interval;
end;

function TCustomTreeView.GetDropTarget: TTreeNode;
begin
  if HandleAllocated then
  begin
    Result := Items.GetNode(TreeView_GetDropHilite(Handle));
    if Result = nil then Result := FLastDropTarget;
  end
  else Result := nil;
end;

procedure TCustomTreeView.SetDropTarget(Value: TTreeNode);
begin
  if HandleAllocated then
    if Value <> nil then Value.DropTarget := True
    else TreeView_SelectDropTarget(Handle, nil);
end;

procedure TCustomTreeView.SetEncoding(Value: TEncoding);
begin
  if not TEncoding.IsStandardEncoding(FEncoding) then
    FEncoding.Free;
  if TEncoding.IsStandardEncoding(Value) then
    FEncoding := Value
  else if Value <> nil then
    FEncoding := Value.Clone
  else
    FEncoding := TEncoding.Default;
end;

function TCustomTreeView.GetNodeFromItem(const Item: TTVItem): TTreeNode;
begin
  Result := nil;
  if Items <> nil then
    with Item do
      if (state and TVIF_PARAM) <> 0 then
{$IFDEF CLR}
        Result := TTreeNode(FTreeNodes.FNodeHashTable.Item[Item.hItem])
{$ELSE}
        Result := Pointer(lParam)
{$ENDIF}
      else
        Result := Items.GetNode(hItem);
end;

function TCustomTreeView.IsEditing: Boolean;
var
  ControlHand: HWnd;
begin
  ControlHand := TreeView_GetEditControl(Handle);
  Result := (ControlHand <> 0) and IsWindowVisible(ControlHand);
end;

function TCustomTreeView.IsTouchPropertyStored(AProperty: TTouchProperty): Boolean;
begin
  case AProperty of
    tpInteractiveGestures:
      Result := Touch.InteractiveGestures <> [igPan, igPressAndTap];
    tpInteractiveGestureOptions:
      Result := Touch.InteractiveGestureOptions <> [igoPanInertia,
        igoPanSingleFingerHorizontal, igoPanSingleFingerVertical,
        igoPanGutter, igoParentPassthrough];
  else
    Result := inherited IsTouchPropertyStored(AProperty);
  end;
end;

procedure TCustomTreeView.CNNotify(var Message: TWMNotifyTV);
var
  Node: TTreeNode;
  MousePos: TPoint;
  R: TRect;
  DefaultDraw, PaintImages: Boolean;
  TmpItem: TTVItem;
  LogFont: TLogFont;
  SmallPt: TSmallPoint;
{$IFDEF CLR}
  DispInfo: TTVDispInfo;
  Buffer: TBytes;
  Temp: TNMTVCustomDraw;
{$ELSE}
  DispInfo: PTVDispInfo;
  Temp: PNMTVCustomDraw;
{$ENDIF}
begin
  with Message do
    case NMHdr.code of
      NM_CUSTOMDRAW:
        if Assigned(FCanvas) then
          with NMCustomDraw{$IFNDEF CLR}^{$ENDIF} do
          begin
            FCanvas.Lock;
            try
              Result := CDRF_DODEFAULT;
              if (dwDrawStage and CDDS_ITEM) = 0 then
              begin
                R := ClientRect;
                case dwDrawStage of
                  CDDS_PREPAINT:
                  begin
                    if IsCustomDrawn(dtControl, cdPrePaint) then
                    begin
                      try
                        FCanvas.Handle := hdc;
                        FCanvas.Font := Font;
                        FCanvas.Brush := Brush;
                        DefaultDraw := CustomDraw(R, cdPrePaint);
                      finally
                        FCanvas.Handle := 0;
                      end;
                      if not DefaultDraw then
                      begin
                        Result := CDRF_SKIPDEFAULT;
                        Exit;
                      end;
                    end;
                    if IsCustomDrawn(dtItem, cdPrePaint) or IsCustomDrawn(dtItem, cdPreErase) then
                      Result := Result or CDRF_NOTIFYITEMDRAW;
                    if IsCustomDrawn(dtItem, cdPostPaint) then
                      Result := Result or CDRF_NOTIFYPOSTPAINT;
                    if IsCustomDrawn(dtItem, cdPostErase) then
                      Result := Result or CDRF_NOTIFYPOSTERASE;
                  end;
                  CDDS_POSTPAINT:
                    if IsCustomDrawn(dtControl, cdPostPaint) then
                      CustomDraw(R, cdPostPaint);
                  CDDS_PREERASE:
                    if IsCustomDrawn(dtControl, cdPreErase) then
                      CustomDraw(R, cdPreErase);
                  CDDS_POSTERASE:
                    if IsCustomDrawn(dtControl, cdPostErase) then
                      CustomDraw(R, cdPostErase);
                end;
              end
              else
              begin
{$IFNDEF CLR}
                FillChar(TmpItem, SizeOf(TmpItem), 0);
{$ENDIF}
                TmpItem.hItem := HTREEITEM(dwItemSpec);
                Node := GetNodeFromItem(TmpItem);
                if Node = nil then
                  Exit;
                case dwDrawStage of
                  CDDS_ITEMPREPAINT:
                      try
                        FCanvas.Handle := hdc;
                        FCanvas.Font := Font;
                        FCanvas.Brush := Brush;
                        // Unlike the list view, the tree view doesn't override the text
                        //  foreground and background colors of selected items.
                        if uItemState and CDIS_SELECTED <> 0 then
                        begin
                          FCanvas.Font.Color := clHighlightText;
                          FCanvas.Brush.Color := clHighlight;
                        end;
                        FCanvas.Font.OnChange := CanvasChanged;
                        FCanvas.Brush.OnChange := CanvasChanged;
                        FCanvasChanged := False;
                        DefaultDraw := CustomDrawItem(Node,
                          TCustomDrawState(Word(uItemState)), cdPrePaint, PaintImages);
                        if not PaintImages then
                          Result := Result or TVCDRF_NOIMAGES;
                        if not DefaultDraw then
                          Result := Result or CDRF_SKIPDEFAULT
                        else
                          if FCanvasChanged then
                          begin
                            FCanvasChanged := False;
                            FCanvas.Font.OnChange := nil;
                            FCanvas.Brush.OnChange := nil;
                            Temp := NMTVCustomDraw;
                            with Temp{$IFNDEF CLR}^{$ENDIF} do
                            begin
                              clrText := ColorToRGB(FCanvas.Font.Color);
                              clrTextBk := ColorToRGB(FCanvas.Brush.Color);
                            end;
{$IFDEF CLR}
                            NMTVCustomDraw := Temp;
                            if GetObject(FCanvas.Font.Handle, Marshal.SizeOf(LogFont), LogFont) <> 0 then
{$ELSE}
                            if GetObject(FCanvas.Font.Handle, SizeOf(LogFont), @LogFont) <> 0 then
{$ENDIF}
                            begin
                              FCanvas.Handle := 0;  // disconnect from hdc
                              // don't delete the stock font
                              FOurFont := CreateFontIndirect(LogFont);
                              FStockFont := SelectObject(hdc, FOurFont);
                              Result := Result or CDRF_NEWFONT;
                            end;
                          end;
                        if IsCustomDrawn(dtItem, cdPostPaint) then
                          Result := Result or CDRF_NOTIFYPOSTPAINT;
                      finally
                        FCanvas.Handle := 0;
                      end;
                  CDDS_ITEMPOSTPAINT:
                    begin
                      try
                        FCanvas.Handle := hdc;
                        FCanvas.Font := Font;
                        FCanvas.Brush := Brush;
                        if IsCustomDrawn(dtItem, cdPostPaint) then
                          CustomDrawItem(Node, TCustomDrawState(Word(uItemState)), cdPostPaint, PaintImages);
                      finally
                        FCanvas.Handle := 0;
                      end;
                      // release the font we may have loaned during item drawing.
                      if (FOurFont <> 0) and (FStockFont <> 0) then
                      begin
                        SelectObject(hdc, FStockFont);
                        DeleteObject(FOurFont);
                        FOurFont := 0;
                        FStockFont := 0;
                      end;
                    end;
                  CDDS_ITEMPREERASE:
                      if IsCustomDrawn(dtItem, cdPreErase) then
                        CustomDrawItem(Node, TCustomDrawState(Word(uItemState)), cdPreErase, PaintImages);
                  CDDS_ITEMPOSTERASE:
                      if IsCustomDrawn(dtItem, cdPostErase) then
                        CustomDrawItem(Node, TCustomDrawState(Word(uItemState)), cdPostErase, PaintImages);
                end;
              end;
            finally
              FCanvas.Unlock;
            end;
          end;
      TVN_BEGINDRAGA, TVN_BEGINDRAGW:
        begin
          FDragged := True;
          with NMTreeView{$IFNDEF CLR}^{$ENDIF} do
            FDragNode := GetNodeFromItem(ItemNew);
        end;
      TVN_BEGINLABELEDITA, TVN_BEGINLABELEDITW:
        begin
          with TVDispInfo{$IFNDEF CLR}^{$ENDIF} do
            if Dragging or not CanEdit(GetNodeFromItem(item)) then
              Result := 1;
          if Result = 0 then
          begin
            FEditHandle := TreeView_GetEditControl(Handle);
            FDefEditProc := TWindowProcPtr(GetWindowLong(FEditHandle, GWL_WNDPROC));
{$IFDEF CLR}
            SetWindowLong(FEditHandle, GWL_WNDPROC, FEditInstance.Handle);
{$ELSE}
            SetWindowLong(FEditHandle, GWL_WNDPROC, LPARAM(FEditInstance));
{$ENDIF}
          end;
        end;
      TVN_ENDLABELEDITA, TVN_ENDLABELEDITW:
        Edit(TVDispInfo.item);
      TVN_ITEMEXPANDINGA, TVN_ITEMEXPANDINGW:
        if not FManualNotify then
        begin
          with NMTreeView{$IFNDEF CLR}^{$ENDIF} do
          begin
            Node := GetNodeFromItem(ItemNew);
            if (action = TVE_EXPAND) and not CanExpand(Node) then
              Result := 1
            else
              if (action = TVE_COLLAPSE) and not CanCollapse(Node) then
                Result := 1;
          end;
        end;
      TVN_ITEMEXPANDEDA, TVN_ITEMEXPANDEDW:
        if not FManualNotify then
        begin
          with NMTreeView{$IFNDEF CLR}^{$ENDIF} do
          begin
            Node := GetNodeFromItem(itemNew);
            if (action = TVE_EXPAND) then
              Expand(Node)
            else
              if (action = TVE_COLLAPSE) then
                Collapse(Node);
          end;
        end;
      TVN_SELCHANGINGA, TVN_SELCHANGINGW:
          with NMTreeView{$IFNDEF CLR}^{$ENDIF} do
            if not CanChange(GetNodeFromItem(itemNew)) then
              Result := 1;
      TVN_SELCHANGEDA, TVN_SELCHANGEDW:
        with NMTreeView{$IFNDEF CLR}^{$ENDIF} do
          if FChangeTimer.Interval > 0 then
          with FChangeTimer do
          begin
            Enabled := False;
{$IFDEF CLR}
            Node := GetNodeFromItem(itemNew);
{$ELSE}
            Tag := IntPtr(GetNodeFromItem(itemNew));
{$ENDIF}
            Enabled := True;
          end
          else
            Change(GetNodeFromItem(itemNew));
      TVN_DELETEITEMA, TVN_DELETEITEMW:
        begin
          with NMTreeView{$IFNDEF CLR}^{$ENDIF} do
            Node := GetNodeFromItem(itemOld);
          if Node <> nil then
          begin
{$IFDEF CLR}
            FTreeNodes.FNodeHashTable.Remove(Node.FItemId);
{$ENDIF}
            Node.FItemId := nil;
            FChangeTimer.Enabled := False;
            if FStateChanging then
              Node.Delete
            else
              Items.Delete(Node);
          end;
        end;
      TVN_SETDISPINFOA, TVN_SETDISPINFOW:
        with TVDispInfo{$IFNDEF CLR}^{$ENDIF} do
        begin
          Node := GetNodeFromItem(item);
          if (Node <> nil) and ((item.mask and TVIF_TEXT) <> 0) then
{$IFDEF CLR}
            Node.Text := Marshal.PtrToStringAuto(item.pszText);
{$ELSE}
            Node.Text := item.pszText;
{$ENDIF}
        end;
      TVN_GETDISPINFOA, TVN_GETDISPINFOW:
        begin
          DispInfo := TVDispInfo;
          with DispInfo{$IFNDEF CLR}^{$ENDIF} do
          begin
            Node := GetNodeFromItem(item);
            if Node <> nil then
            begin
              if (item.mask and TVIF_TEXT) <> 0 then
{$IFDEF CLR}
              begin
                Buffer := PlatformBytesOf(Copy(Node.Text, 1, item.cchTextMax - 1) + #0);
                Marshal.Copy(Buffer, 0, item.pszText, Length(Buffer));
              end;
{$ELSE}
              StrLCopy(item.pszText, PChar(Node.Text), item.cchTextMax - 1);
{$ENDIF}
              if (item.mask and TVIF_IMAGE) <> 0 then
              begin
                GetImageIndex(Node);
                item.iImage := Node.ImageIndex;
              end;
              if (item.mask and TVIF_SELECTEDIMAGE) <> 0 then
              begin
                GetSelectedIndex(Node);
                item.iSelectedImage := Node.SelectedIndex;
              end;
            end;
          end;
{$IFDEF CLR}
          TVDispInfo := DispInfo;
{$ENDIF}
        end;
      NM_RCLICK:
        begin
          FRClickNode := nil;
          GetCursorPos(MousePos);
          if RightClickSelect then
            with PointToSmallPoint(ScreenToClient(MousePos)) do
            begin
              FRClickNode := GetNodeAt(X, Y);
              SmallPt := PointToSmallPoint(MousePos);
              Perform(WM_CONTEXTMENU, Handle, MakeLong(SmallPt.X, SmallPt.Y));
              FRClickNode := nil;
            end
          else
            // Win95/98 eat WM_CONTEXTMENU when posted to the message queue
            with MousePos do
              PostMessage(Handle, CN_BASE+WM_CONTEXTMENU, Handle, MakeLong(X, Y));
          Message.Result := 1;  // tell treeview not to perform default response
        end;
    end;
end;

{$IFDEF CLR}
function TCustomTreeView.CustomTreeViewSort(ANode1, ANode2: Longint;
  lParam: Integer): Integer;
var
  Node1, Node2: TTreeNode;
  CompareWrapper: TTVCompareWrapper;
begin
  if ANode1 <> 0 then
    Node1 := TTreeNode(FTreeNodes.FNodeHashTable.Item[HTreeItem(ANode1)])
  else
    Node1 := nil;
  if ANode2 <> 0 then
    Node2 := TTreeNode(FTreeNodes.FNodeHashTable.Item[HTreeItem(ANode2)])
  else
    Node2 := nil;

  // Extract SortProc, Data from wrapper structure and call SortProc
  CompareWrapper := TTVCompareWrapper(GCHandle(IntPtr(lParam)).Target);
  Result := CompareWrapper.SortProc(Node1, Node2, CompareWrapper.Data);
end;

function TCustomTreeView.DefaultTreeViewSort(ANode1, ANode2: TTreeNode;
  lParam: TTag): Integer;
begin
  if Assigned(ANode1) then
    with ANode1 do
      if Assigned(OnCompare) then
        OnCompare(TreeView, ANode1, ANode2, lParam, Result)
      else if Assigned(ANode2) then
        Result := CompareText(ANode1.Text, ANode2.Text)
      else
        Result := 1
  else
    Result := -1;
end;
{$ENDIF}

function TCustomTreeView.GetDragImages: TDragImageList;
begin
  if FDragImage.Count > 0 then
    Result := FDragImage else
    Result := nil;
end;

procedure TCustomTreeView.WndProc(var Message: TMessage);
{$IFDEF CLR}
var
  MouseMsg: TWMMouse;
{$ENDIF}
begin
  if not (csDesigning in ComponentState) and ((Message.Msg = WM_LBUTTONDOWN) or
    (Message.Msg = WM_LBUTTONDBLCLK)) and not Dragging and
    (DragMode = dmAutomatic) and (DragKind = dkDrag) then
  begin
{$IFDEF CLR}
    MouseMsg := TWMMouse.Create(Message);
    if not IsControlMouseMsg(MouseMsg) then
{$ELSE}
    if not IsControlMouseMsg(TWMMouse(Message)) then
{$ENDIF}
    begin
      ControlState := ControlState + [csLButtonDown];
      Dispatch(Message);
    end;
  end
  else
    if Message.Msg = CN_BASE+WM_CONTEXTMENU then
      Message.Result := Perform(WM_CONTEXTMENU, Message.WParam, Message.LParam)
    else
      inherited WndProc(Message);
end;

procedure TCustomTreeView.DoStartDrag(var DragObject: TDragObject);
var
  ImageHandle: HImageList;
  DragNode: TTreeNode;
  P: TPoint;
begin
  inherited DoStartDrag(DragObject);
  DragNode := FDragNode;
  FLastDropTarget := nil;
  FDragNode := nil;
  if DragNode = nil then
  begin
    GetCursorPos(P);
    with ScreenToClient(P) do
      DragNode := GetNodeAt(X, Y);
  end;
  if DragNode <> nil then
  begin
    ImageHandle := TreeView_CreateDragImage(Handle, DragNode.ItemId);
    if ImageHandle <> 0 then
      with FDragImage do
      begin
        Handle := ImageHandle;
        SetDragImage(0, 2, 2);
      end;
  end;
end;

procedure TCustomTreeView.DoEndDrag(Target: TObject; X, Y: Integer);
begin
  inherited DoEndDrag(Target, X, Y);
  FLastDropTarget := nil;
end;

procedure TCustomTreeView.CMDrag(var Message: TCMDrag);
begin
  inherited;
  with Message, DragRec{$IFNDEF CLR}^{$ENDIF} do
    case DragMessage of
      dmDragMove:
        with ScreenToClient(Pos) do
          DoDragOver(Source, X, Y, Message.Result <> 0);
      dmDragLeave:
        begin
          TDragObject(Source).HideDragImage;
          FLastDropTarget := DropTarget;
          DropTarget := nil;
          TDragObject(Source).ShowDragImage;
        end;
      dmDragDrop: FLastDropTarget := nil;
    end;
end;

procedure TCustomTreeView.DoDragOver(Source: TDragObject; X, Y: Integer; CanDrop: Boolean);
var
  Node: TTreeNode;
begin
  Node := GetNodeAt(X, Y);
  if (Node <> nil) and
    ((Node <> DropTarget) or (Node = FLastDropTarget)) then
  begin
    FLastDropTarget := nil;
    TDragObject(Source).HideDragImage;
    Node.DropTarget := True;
    TDragObject(Source).ShowDragImage;
  end;
end;

procedure TCustomTreeView.GetImageIndex(Node: TTreeNode);
begin
  if Assigned(FOnGetImageIndex) then FOnGetImageIndex(Self, Node);
end;

procedure TCustomTreeView.GetSelectedIndex(Node: TTreeNode);
begin
  if Assigned(FOnGetSelectedIndex) then FOnGetSelectedIndex(Self, Node);
end;

function TCustomTreeView.CanChange(Node: TTreeNode): Boolean;
begin
  Result := True;
  if not Reading and not (csRecreating in ControlState) and Assigned(FOnChanging) then
    FOnChanging(Self, Node, Result);
end;

procedure TCustomTreeView.Change(Node: TTreeNode);
begin
  FSelectChanged := True;
  FinishSelection(Selected, KeyDataToShiftState(0) + [ssLeft]);
  if not Reading and not (csRecreating in ControlState) and Assigned(FOnChange) then
    FOnChange(Self, Node);
end;

procedure TCustomTreeView.Added(Node: TTreeNode);
begin
  if not Reading and Assigned(FOnAddition) then
    FOnAddition(Self, Node);
end;

procedure TCustomTreeView.Delete(Node: TTreeNode);
begin
  if not Reading and Assigned(FOnDeletion) then
    FOnDeletion(Self, Node);
end;

procedure TCustomTreeView.Expand(Node: TTreeNode);
begin
  if not Reading and Assigned(FOnExpanded) then
    FOnExpanded(Self, Node);
end;

function TCustomTreeView.CanExpand(Node: TTreeNode): Boolean;
begin
  Result := True;
  if not Reading and Assigned(FOnExpanding) then
    FOnExpanding(Self, Node, Result);
end;

procedure TCustomTreeView.Collapse(Node: TTreeNode);
begin
  if Assigned(FOnCollapsed) then FOnCollapsed(Self, Node);
end;

function TCustomTreeView.CanCollapse(Node: TTreeNode): Boolean;
begin
  Result := True;
  if Assigned(FOnCollapsing) then FOnCollapsing(Self, Node, Result);
end;

function TCustomTreeView.CanEdit(Node: TTreeNode): Boolean;
begin
  Result := True;
  if Assigned(FOnEditing) then FOnEditing(Self, Node, Result);
end;

procedure TCustomTreeView.Edit(const Item: TTVItem);
var
  S: string;
  Node: TTreeNode;
begin
  with Item do
  begin
    Node := GetNodeFromItem(Item);
    if pszText <> nil then
    begin
{$IFDEF CLR}
      S := Marshal.PtrToStringAuto(pszText);
{$ELSE}
      S := pszText;
{$ENDIF}
      if Assigned(FOnEdited) then
        FOnEdited(Self, Node, S);
      if Node <> nil then
        Node.Text := S;
    end
    else
      if Assigned(FOnCancelEdit) then
        FOnCancelEdit(Self, Node);
  end;
end;

function TCustomTreeView.CreateNode: TTreeNode;
var
  LClass: TTreeNodeClass;
begin
  LClass := TTreeNode;
  if Assigned(FOnCreateNodeClass) then
    FOnCreateNodeClass(Self, LClass);
  Result := LClass.Create(Items);
end;

function TCustomTreeView.CreateNodes: TTreeNodes;
begin
  Result := TTreeNodes.Create(Self);
end;

procedure TCustomTreeView.SetImageList(Value: HImageList; Flags: Integer);
begin
  if HandleAllocated then TreeView_SetImageList(Handle, Value, Flags);
end;

procedure TCustomTreeView.ImageListChange(Sender: TObject);
var
  ImageHandle: HImageList;
begin
  if HandleAllocated then
  begin
    if TCustomImageList(Sender).HandleAllocated then
      ImageHandle := TCustomImageList(Sender).Handle
    else
      ImageHandle := 0;
    if Sender = Images then
      SetImageList(ImageHandle, TVSIL_NORMAL)
    else if Sender = StateImages then
      SetImageList(ImageHandle, TVSIL_STATE);
  end;
end;

procedure TCustomTreeView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = Images then Images := nil;
    if AComponent = StateImages then StateImages := nil;
  end;
end;

procedure TCustomTreeView.SetImages(Value: TCustomImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if Images <> nil then
  begin
    Images.RegisterChanges(FImageChangeLink);
    Images.FreeNotification(Self);
    SetImageList(Images.Handle, TVSIL_NORMAL)
  end
  else
    SetImageList(0, TVSIL_NORMAL);
end;

procedure TCustomTreeView.SetStateImages(Value: TCustomImageList);
begin
  if StateImages <> nil then
    StateImages.UnRegisterChanges(FStateChangeLink);
  FStateImages := Value;
  if StateImages <> nil then
  begin
    StateImages.RegisterChanges(FStateChangeLink);
    StateImages.FreeNotification(Self);
    SetImageList(StateImages.Handle, TVSIL_STATE)
  end
  else SetImageList(0, TVSIL_STATE);
end;

procedure TCustomTreeView.LoadFromFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TCustomTreeView.LoadFromFile(const FileName: string; AEncoding: TEncoding);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream, AEncoding);
  finally
    Stream.Free;
  end;
end;

procedure TCustomTreeView.LoadFromStream(Stream: TStream);
begin
  LoadFromStream(Stream, nil);
end;

procedure TCustomTreeView.LoadFromStream(Stream: TStream; AEncoding: TEncoding);
begin
  with TTreeStrings.Create(Items) do
    try
      LoadTreeFromStream(Stream, AEncoding);
    finally
      Free;
  end;
end;

procedure TCustomTreeView.SaveToFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TCustomTreeView.SaveToFile(const FileName: string; AEncoding: TEncoding);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream, AEncoding);
  finally
    Stream.Free;
  end;
end;

procedure TCustomTreeView.SaveToStream(Stream: TStream);
begin
  SaveToStream(Stream, FEncoding);
end;

procedure TCustomTreeView.SaveToStream(Stream: TStream; AEncoding: TEncoding);
begin
  with TTreeStrings.Create(Items) do
    try
      SaveTreeToStream(Stream, AEncoding);
    finally
      Free;
  end;
end;

procedure TCustomTreeView.WMContextMenu(var Message: TWMContextMenu);
var
  P: TPoint;
begin
  if not (csDesigning in ComponentState) then
    SetFocus;
  if InvalidPoint(Message.Pos) and (Selected <> nil) then
    Message.Pos := PointToSmallPoint(ClientToScreen(CenterPoint(Selected.DisplayRect(True))));
  inherited;
  if csDestroying in ComponentState then
    Exit;
  P := ScreenToClient(Point(Message.Pos.X, Message.Pos.Y));
  MouseUp(mbRight, KeyboardStateToShiftState, P.X, P.Y);
end;

procedure TCustomTreeView.WMCtlColorEdit(var Message: TMessage);
begin
  if (csGlassPaint in ControlState) and not FInBufferedPrintClient then
  begin
    FInBufferedPrintClient := True;
    PostMessage(FEditHandle, CM_BUFFEREDPRINTCLIENT, 0, 0);
  end
  else
    with Message do
      Result := DefWindowProc(Handle, Msg, WParam, LParam);
end;

procedure TCustomTreeView.WMLButtonDown(var Message: TWMLButtonDown);
var
  Node: TTreeNode;
  MousePos: TPoint;
begin
  FDragged := False;
  FDragNode := nil;
  try
    inherited;
    if (DragMode = dmAutomatic) and (DragKind = dkDrag) then
    begin
      SetFocus;
      if not FDragged then
      begin
        GetCursorPos(MousePos);
        with PointToSmallPoint(ScreenToClient(MousePos)) do
          Perform(WM_LBUTTONUP, 0, MakeLong(X, Y));
      end
      else begin
        Node := GetNodeAt(Message.XPos, Message.YPos);
        if Node <> nil then
        begin
          Node.Focused := True;
          Node.Selected := True;
          BeginDrag(False);
        end;
      end;
    end;
  finally
    FDragNode := nil;
  end;
end;

procedure TCustomTreeView.WMNotify(var Message: TWMNotify);
var
  Node: TTreeNode;
  Pt: TPoint;
  LItemRect: TRect;
  LHintText: string;
{$IFDEF CLR}
  ToolTipText: TToolTipTextW;
  LMessage: TWMNotifyTV;
{$ELSE}
  MaxTextLen: Integer;
{$ENDIF}
begin
{$IFDEF CLR}
  LMessage := TWMNotifyTV.Create(Message.OriginalMessage);
  with LMessage, NMHdr do
{$ELSE}
  with Message, NMHdr^ do
{$ENDIF}
    if code = TTN_NEEDTEXTW then
    begin
{$IFDEF CLR}
      ToolTipText := ToolTipTextW;
{$ENDIF}
      // Work around NT COMCTL32 problem with tool tips >= 80 characters
      GetCursorPos(Pt);
      Pt := ScreenToClient(Pt);
      Node := GetNodeAt(Pt.X, Pt.Y);
      if (Node = nil) or (Node.Text = '') or 
{$IFDEF CLR}
        (ToolTipText.uFlags and TTF_IDISHWND = 0) then
{$ELSE}
        (PToolTipTextW(NMHdr)^.uFlags and TTF_IDISHWND = 0) then
{$ENDIF}
        Exit;
      if (GetComCtlVersion >= ComCtlVersionIE4) and (Length(Node.Text) < 80) and
         (not Assigned(FOnHint)) then
      begin
        inherited;
        Exit;
      end;

      LHintText := Node.Text;
      if Assigned(FOnHint) then
        FOnHint(Self, Node, LHintText);
      FWideText := LHintText;
{$IFDEF CLR}
      ToolTipText.lpszText := FWideText;
      if Length(FWideText) >= NMTTMaxTextLen then
        SetLength(FWideText, NMTTMaxTextLen - 1);
      ToolTipText.szText := FWideText;
      ToolTipText.hInst := 0;
{$ELSE}
      MaxTextLen := SizeOf(PToolTipTextW(NMHdr)^.szText) div SizeOf(WideChar);
      if Length(FWideText) >= MaxTextLen then
        SetLength(FWideText, MaxTextLen - 1);
      PToolTipTextW(NMHdr)^.lpszText := PWideChar(FWideText);
      FillChar(PToolTipTextW(NMHdr)^.szText, MaxTextLen * SizeOf(WideChar), 0);
      Move(Pointer(FWideText)^, PToolTipTextW(NMHdr)^.szText, Length(FWideText) * SizeOf(WideChar));
      PToolTipTextW(NMHdr)^.hInst := 0;
{$ENDIF}
      // move the tooltip window over the corresponding tree node
      LItemRect := Node.DisplayRect(True);
      if LItemRect.Left < 0 then
        LItemRect.Left := 0;
      LItemRect.TopLeft := ClientToScreen(LItemRect.TopLeft);
{$IFDEF CLR}
      SendGetStructMessage(hwndFrom, TTM_ADJUSTRECT, THandle(True), LItemRect, False);
{$ELSE}
      SendMessage(hwndFrom, TTM_ADJUSTRECT, WPARAM(True), LPARAM(@LItemRect));
{$ENDIF}
      SetWindowPos(hwndFrom, HWND_TOP, LItemRect.Left, LItemRect.Top, 0, 0,
        SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOOWNERZORDER);
      Result := 1;
{$IFDEF CLR}
      ToolTipTextW := ToolTipText;
      Message := TWMNotify.Create(LMessage.OriginalMessage);
{$ENDIF}
    end
    else
      inherited;
end;

{ CustomDraw support }

procedure TCustomTreeView.CanvasChanged;
begin
  FCanvasChanged := True;
end;

function TCustomTreeView.IsCustomDrawn(Target: TCustomDrawTarget;
  Stage: TCustomDrawStage): Boolean;
begin
  { Tree view doesn't support erase notifications }
  if Stage = cdPrePaint then
  begin
    if Target = dtItem then
      Result := Assigned(FOnCustomDrawItem) or Assigned(FOnAdvancedCustomDrawItem)
    else if Target = dtControl then
      Result := Assigned(FOnCustomDraw) or Assigned(FOnAdvancedCustomDraw) or
        Assigned(FOnCustomDrawItem) or Assigned(FOnAdvancedCustomDrawItem)
    else
      Result := False;
  end
  else
  begin
    if Target = dtItem then
      Result := Assigned(FOnCustomDrawItem) or Assigned(FOnAdvancedCustomDrawItem)
    else if Target = dtControl then
      Result := Assigned(FOnAdvancedCustomDraw) or Assigned(FOnAdvancedCustomDrawItem)
    else
      Result := False;
  end;
end;

function TCustomTreeView.CustomDraw(const ARect: TRect; Stage: TCustomDrawStage): Boolean;
begin
  Result := True;
  if (Stage = cdPrePaint) and Assigned(FOnCustomDraw) then FOnCustomDraw(Self, ARect, Result);
  if Assigned(FOnAdvancedCustomDraw) then FOnAdvancedCustomDraw(Self, ARect, Stage, Result);
end;

function TCustomTreeView.CustomDrawItem(Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages: Boolean): Boolean;
begin
  Result := True;
  PaintImages := True;
  if (Stage = cdPrePaint) and Assigned(FOnCustomDrawItem) then FOnCustomDrawItem(Self, Node, State, Result);
  if Assigned(FOnAdvancedCustomDrawItem) then FOnAdvancedCustomDrawItem(Self, Node, State, Stage, PaintImages, Result);
end;

procedure TCustomTreeView.ClearSelection(KeepPrimary: Boolean);
var
  I: Integer;
begin
  for I := FSelections.Count - 1 downto 1 do
    NodeDeselect(I);
  if not KeepPrimary then
    Selected := nil;
end;

procedure TCustomTreeView.ControlSelectNode(Node: TTreeNode);
var
  I: Integer;
begin
  if msControlSelect in MultiSelectStyle then
  begin
    if (Node <> Selected) and ((Node = nil) or (not Node.Deleting)) then
      Selected := Node;
    I := FSelections.IndexOf(Node);
    if I <> -1 then
      NodeDeselect(I)
    else 
      NodeSelect(Node);
  end
  else
    SelectNode(Node);
end;

procedure TCustomTreeView.ControlShiftSelectNode(Node: TTreeNode;
  Backward: Boolean);
begin
  ShiftSelectNode(Node, Backward, not (msControlSelect in MultiSelectStyle));
end;

procedure TCustomTreeView.DoEnter;
begin
  InvalidateSelectionsRects;
  inherited;
end;

procedure TCustomTreeView.DoExit;
begin
  inherited;
  InvalidateSelectionsRects;
end;

procedure TCustomTreeView.FinishSelection(Node: TTreeNode;
  ShiftState: TShiftState);
var
  LNode: TTreeNode;
  LBackward: Boolean;
begin
  if not FSelecting and (ssLeft in ShiftState) then
  try
    FSelecting := True;
    if not (ssShift in ShiftState) then
      FShiftAnchor := nil;

    // what to do?
    if MultiSelect and (Node <> nil) then
      if ssShift in ShiftState then
      begin

        // figure out the shift anchor
        if (FShiftAnchor = nil) and
           (FSelections.Count > 0) then
          FShiftAnchor := Selections[0];
        if FShiftAnchor = nil then
        begin
          LNode := Items.GetFirstNode;
          if not LNode.IsVisible then
            LNode := LNode.GetNextVisible;
          while LNode <> nil do
          begin
            if LNode.Focused then
            begin
              FShiftAnchor := LNode;
              Break;
            end;
            LNode := LNode.GetNextVisible;
          end;
        end;
        LBackward := (FShiftAnchor <> nil) and
                     (Node.AbsoluteIndex < FShiftAnchor.AbsoluteIndex);

        // which way do we go?
        if ssCtrl in ShiftState then
          ControlShiftSelectNode(Node, LBackward)
        else
          ShiftSelectNode(Node, LBackward);
      end
      else

      // no shift, no problem
      begin
        if ssCtrl in ShiftState then
          ControlSelectNode(Node)
        else if FSelections.IndexOf(Node) <> -1 then
        begin
          if FSelections[0] <> Node then
          begin
            FSelections.Remove(Node);
            NodeSelect(Node, 0);
          end;
        end
        else
          SelectNode(Node);
      end
    else
      SelectNode(Node);

    // all is swell?
    ValidateSelection;
  finally
    FSelecting := False;
  end;
end;

function TCustomTreeView.GetSelectionCount: Cardinal;
begin
  Result := FSelections.Count
end;

function TCustomTreeView.GetSelection(Index: Integer): TTreeNode;
begin
  Result := TTreeNode(FSelections[Index])
end;

procedure TCustomTreeView.InvalidateSelectionsRects;
var
  I: Integer;
  LRect: TRect;
begin
  for I := 0 to FSelections.Count - 1 do
  begin
    LRect := Selections[I].DisplayRect(False);
    InvalidateRect(Handle, LRect, False);
  end;
end;

procedure TCustomTreeView.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    if FSelectChanged then
      FSelectChanged := False
    else if htOnItem in GetHitTestInfoAt(X, Y) then
      FinishSelection(Selected, Shift)
    else
      ValidateSelection;
  inherited;
end;

procedure TCustomTreeView.NodeDeselect(Index: Integer);
begin
  Selections[Index].SetSelectedBit(False);
  FSelections.Delete(Index);
end;

procedure TCustomTreeView.NodeSelect(Node: TTreeNode; At: Integer);
begin
  if (Node <> nil) and not Node.Deleting then
  begin
    FSelections.Insert(At, Node);
    Node.SetSelectedBit(True);
  end;
end;

procedure TCustomTreeView.Select(Node: TTreeNode; ShiftState: TShiftState);
begin
  FinishSelection(Node, ShiftState + [ssLeft]);
end;

procedure TCustomTreeView.SelectNode(Node: TTreeNode);
var
  I: Integer;
begin
  for I := FSelections.Count - 1 downto 0 do
    if Selections[I] <> Node then
      NodeDeselect(I);
  if (Node <> Selected) and ((Node = nil) or (not Node.Deleting))then
    Selected := Node;
  if (Node <> nil) and (not Node.Deleting) and
     (FSelections.Count = 0) then
    NodeSelect(Node);
end;

procedure TCustomTreeView.SetMultiSelect(const Value: Boolean);
begin
  if Value <> MultiSelect then
  begin
    if not Value then
      SelectNode(Selected);
    FMultiSelect := Value;
    ValidateSelection;
  end;
end;

procedure TCustomTreeView.SetMultiSelectStyle(const Value: TMultiSelectStyle);
begin
  if Value <> MultiSelectStyle then
  begin
    FMultiSelectStyle := Value;
    ValidateSelection;
  end;
end;

procedure TCustomTreeView.ShiftSelectNode(Node: TTreeNode; Backward,
  Deselect: Boolean);
var
  LNode: TTreeNode;
  LSelect, LDeselect: TList;
  I: Integer;
begin
  if (Node <> nil) and (not Node.Deleting) and (msShiftSelect in MultiSelectStyle) then
  begin
    LSelect := TList.Create;
    LDeselect := TList.Create;
    try
      LNode := FShiftAnchor;
      if LNode <> Node then
        while LNode <> nil do
        begin
          LSelect.Add(LNode);
          if Backward then
            if msVisibleOnly in MultiSelectStyle then
              LNode := LNode.GetPrevVisible
            else
              LNode := LNode.GetPrev
          else
            if msVisibleOnly in MultiSelectStyle then
              LNode := LNode.GetNextVisible
            else
              LNode := LNode.GetNext;
          if LNode = Node then
          begin
            LSelect.Add(LNode);
            Break;
          end;
        end;

      if Deselect then
      begin
        LDeselect.Assign(FSelections, TListAssignOp.laSrcUnique, LSelect);
        if LDeselect.Count > 0 then
          for I := FSelections.Count - 1 downto 0 do
            if LDeselect.IndexOf(FSelections[I]) <> -1 then
              NodeDeselect(I);
      end;

      LSelect.Assign(FSelections, TListAssignOp.laSrcUnique);
      for I := 0 to LSelect.Count - 1 do
        NodeSelect(TTreeNode(LSelect[I]));

      I := FSelections.IndexOf(Node);
      if I > 0 then
      begin
        FSelections.Delete(I);
        FSelections.Insert(0, Node);
      end
      else
        if I = -1 then
          NodeSelect(Node);
    finally
      LDeselect.Free;
      LSelect.Free;
    end;
  end
  else
    SelectNode(Node);
end;

procedure TCustomTreeView.Subselect(Node: TTreeNode; Validate: Boolean);
begin
  if not MultiSelect then
    raise ETreeViewError.Create(SMultiSelectRequired);
  if (Node <> nil) and (not Node.Deleting) then
  begin
    if FSelections.IndexOf(Node) = -1 then
      NodeSelect(Node, 1);
    if Validate then
      ValidateSelection;
  end;
end;

procedure TCustomTreeView.ValidateSelection;
var
  I: Integer;
  LPrimary, LNode: TTreeNode;
begin
  if FSelections.Count > 0 then
  begin
    LPrimary := Selections[0];
    for I := FSelections.Count - 1 downto 0 do
    begin
      LNode := Selections[I];
      if (LNode.Deleting) or
         ((I <> 0) and
          (not MultiSelect) or
          ((msVisibleOnly in MultiSelectStyle) and (not LNode.IsVisible)) or
          ((msSiblingOnly in MultiSelectStyle) and (LNode.Parent <> LPrimary.Parent))) then
        NodeDeselect(I)
      else if not LNode.Selected then
        LNode.SetSelectedBit(True);
    end;
  end;
end;

procedure TCustomTreeView.Select(const Nodes: array of TTreeNode);
var
  LList: TList;
  I: Integer;
begin
  LList := TList.Create;
  try
    for I := Low(Nodes) to High(Nodes) do
      if not Nodes[I].Deleting then
        LList.Add(Nodes[I]);
    Select(LList);
  finally
    LList.Free;
  end;
end;

procedure TCustomTreeView.Select(Nodes: TList);
var
  LSelect, LDeselect: TList;
  I: Integer;
begin
  if Nodes.Count = 0 then
    ClearSelection
  else
  begin
    LSelect := TList.Create;
    LDeselect := TList.Create;
    try
      // remove any nodes that are about to not be
      for I := Nodes.Count - 1 downto 0 do
        if TTreeNode(Nodes[I]).Deleting then
          Nodes.Delete(I);

      // make sure the Selected item is the first item
      if Nodes.Count > 0 then
        if Selected <> TTreeNode(Nodes[0]) then
          Selected := TTreeNode(Nodes[0]);

      // what needs to be deselected?
      LDeselect.Assign(FSelections, TListAssignOp.laSrcUnique, Nodes);
      if LDeselect.Count > 0 then
        for I := FSelections.Count - 1 downto 0 do
          if LDeselect.IndexOf(FSelections[I]) <> -1 then
            NodeDeselect(I);

      // what needs to be selected?
      LSelect.Assign(Nodes, TListAssignOp.laSrcUnique, FSelections);
      for I := 0 to LSelect.Count - 1 do
        NodeSelect(TTreeNode(LSelect[I]));

      // ok lets get the order right!
      FSelections.Assign(Nodes);
    finally
      LDeselect.Free;
      LSelect.Free;
    end;
  end;

  // show the world what we just did
  ValidateSelection;
end;

procedure TCustomTreeView.Deselect(Node: TTreeNode);
begin
  if FSelections.IndexOf(Node) <> -1 then
    ControlSelectNode(Node);
end;

function TCustomTreeView.FindNextToSelect: TTreeNode;
var
  LNodes: TList;

  function NodeInList(ANode: TTreeNode): Boolean;
  begin
    // return true only if node (or one of its parents) is not in the list
    while Assigned(ANode) do
      if LNodes.IndexOf(ANode) = -1 then
        ANode := ANode.Parent
      else
        Break;
    Result := Assigned(ANode);
  end;

  function SiblingNotInList(ANode: TTreeNode): TTreeNode;
  begin
    // if a succeeding sibling of the primary is not selected then select it
    Result := ANode.GetNextSibling;
    while Assigned(Result) do
      if NodeInList(Result) then
        Result := Result.GetNextSibling
      else
        Break;

    // next didn't work, try previous instead
    if Result = nil then
    begin
      Result := ANode.GetPrevSibling;
      while Assigned(Result) do
        if NodeInList(Result) then
          Result := Result.GetPrevSibling
        else
          Break;
    end;
  end;
var
  LSelected: TTreeNode;
begin
  LNodes := TList.Create;
  try
    // what is selected?
    LSelected := GetSelections(LNodes);
    Result := LSelected;

    // if the selected one is really selected then continue, otherwise return it
    while Assigned(LSelected) and LSelected.Selected do
    begin
      Result := SiblingNotInList(LSelected);
      if Result = nil then
        LSelected := LSelected.Parent
      else
        Break;
      Result := LSelected;
    end;
  finally
    LNodes.Free;
  end;
end;

function TCustomTreeView.GetSelections(AList: TList): TTreeNode;
var
  I: Integer;
begin
  with AList do
  begin
    Clear;
    for I := 0 to SelectionCount - 1 do
      Add(Selections[I]);
    Result := Selected;
  end;
end;

{ TTreeView }

class constructor TTreeView.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TTreeView, TTreeViewStyleHook);
end;

class destructor TTreeView.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TTreeView, TTreeViewStyleHook);
end;

{ TTrackBar }

const
  MaxAutoTicks = 10000;

class constructor TTrackBar.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TTrackBar, TTrackBarStyleHook);
end;

constructor TTrackBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 150;
  Height := 45;
  TabStop := True;
  FMin := 0;
  FMax := 10;
  FPosition := 0;
  FLineSize := 1;
  FPageSize := 2;
  FPositionToolTip := ptNone;
  FFrequency := 1;
  FSelStart := 0;
  FSelEnd := 0;
  FThumbLength := 20;
  FTickMarks := tmBottomRight;
  FTickStyle := tsAuto;
  FOrientation := trHorizontal;
  ControlStyle := ControlStyle - [csDoubleClicks, csGestures];
  FSliderVisible := True;
  FShowSelRange := True;
end;

class destructor TTrackBar.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TTrackBar, TTrackBarStyleHook);
end;

procedure TTrackBar.CreateParams(var Params: TCreateParams);
const
  OrientationStyle: array[TTrackbarOrientation] of DWORD = (TBS_HORZ, TBS_VERT);
  TickStyles: array[Boolean, TTickStyle] of DWORD =
    ((TBS_NOTICKS, TBS_AUTOTICKS, 0), (TBS_NOTICKS, 0, 0));
  TickMarks: array[TTickMark] of DWORD = (TBS_BOTTOM, TBS_TOP, TBS_BOTH);
var
  LTickStyles: DWORD;
begin
  InitCommonControl(ICC_BAR_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, TRACKBAR_CLASS);
  // Ignore tsAuto if more than MaxAutoTicks in the track bar range.
  // tsAuto is is ignored because the TRACKBAR_CLASS will paint,
  // as many tick marks as you ask for. Too many an it appears
  // the track bar has hung but it just painting very slowly. Since large
  // ranges can be accidentally entered in the object inpsector we just
  // have the control ignore them instead of hanging.
  if Frequency <> 0 then
    LTickStyles := TickStyles[(FMax - FMin) div Frequency > MaxAutoTicks, FTickStyle]
  else
    LTickStyles := TickStyles[(FMax - FMin) > MaxAutoTicks, FTickStyle];
  with Params do
  begin
    Style := Style or OrientationStyle[FOrientation] or
      LTickStyles or TickMarks[FTickMarks] or TBS_FIXEDLENGTH;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW) or
      CS_DBLCLKS;
    if not FSliderVisible then
      Style := Style or TBS_NOTHUMB;
    if FShowSelRange then
      Style := Style or TBS_ENABLESELRANGE;
    if FPositionToolTip <> ptNone then
      Style := Style or TBS_TOOLTIPS;
  end;
end;

procedure TTrackBar.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  ThumbLength := MulDiv(FThumbLength, M, D);
  inherited ChangeScale(M, D, isDpichange);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TTrackBar.CreateWnd;
const
  APositionToolTip: array[TPositionToolTip] of DWORD = (0, TBTS_TOP, TBTS_LEFT,
    TBTS_BOTTOM, TBTS_RIGHT);
begin
  inherited CreateWnd;
  if HandleAllocated then
  begin
    SendMessage(Handle, TBM_SETTHUMBLENGTH, FThumbLength, 0);
    SendMessage(Handle, TBM_SETLINESIZE, 0, FLineSize);
    SendMessage(Handle, TBM_SETPAGESIZE, 0, FPageSize);
    SendMessage(Handle, TBM_SETRANGEMIN, 0, FMin);
    SendMessage(Handle, TBM_SETRANGEMAX, 0, FMax);
    UpdateSelection;
    SendMessage(Handle, TBM_SETPOS, 1, FPosition);
    SendMessage(Handle, TBM_SETTICFREQ, FFrequency, 1);
    if FPositionToolTip <> ptNone then
      SendMessage(Handle, TBM_SETTIPSIDE, APositionToolTip[FPositionToolTip], 0);
  end;
end;

procedure TTrackBar.DestroyWnd;
begin
  inherited DestroyWnd;
end;

procedure TTrackBar.CMGestureManagerChanged(var Message: TMessage);
begin
  if not (csDestroying in ComponentState) then
  begin
    if (Touch.GestureManager <> nil) then
      ControlStyle := ControlStyle + [csGestures]
    else
      ControlStyle := ControlStyle - [csGestures];
    if HandleAllocated then
      RecreateWnd;
  end;
end;

procedure TTrackBar.CNHScroll(var Message: TWMHScroll);
begin
  inherited;
  FPosition := SendMessage(Handle, TBM_GETPOS, 0, 0);
  Changed;
  Message.Result := 0;
end;

procedure TTrackBar.CNVScroll(var Message: TWMVScroll);
begin
  inherited;
  FPosition := SendMessage(Handle, TBM_GETPOS, 0, 0);
  Changed;
  Message.Result := 0;
end;

function TTrackBar.GetThumbLength: Integer;
begin
  if HandleAllocated then
    Result := SendMessage(Handle, TBM_GETTHUMBLENGTH, 0, 0)
  else
    Result := FThumbLength;
end;

procedure TTrackBar.SetOrientation(Value: TTrackBarOrientation);
begin
  if Value <> FOrientation then
  begin
    FOrientation := Value;
    if ComponentState * [csLoading, csUpdating] = [] then
      SetBounds(Left, Top, Height, Width);
    RecreateWnd;
  end;
end;

procedure TTrackBar.SetParams(APosition, AMin, AMax: Integer);
begin
  if AMax < AMin then
    raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [Self.Classname]);
  if APosition < AMin then APosition := AMin;
  if APosition > AMax then APosition := AMax;
  if (AMax - AMin > MaxAutoTicks) <> (FMax - FMin > MaxAutoTicks) then
  begin
    FMin := AMin;
    FMax := AMax;
    RecreateWnd;
  end;
  if (FMin <> AMin) then
  begin
    FMin := AMin;
    if HandleAllocated then
      SendMessage(Handle, TBM_SETRANGEMIN, 1, AMin);
  end;
  if (FMax <> AMax) then
  begin
    FMax := AMax;
    if HandleAllocated then
      SendMessage(Handle, TBM_SETRANGEMAX, 1, AMax);
  end;
  if FPosition <> APosition then
  begin
    FPosition := APosition;
    if HandleAllocated then
      SendMessage(Handle, TBM_SETPOS, 1, APosition);
    Changed;
  end;
end;

procedure TTrackBar.SetPosition(Value: Integer);
begin
  SetParams(Value, FMin, FMax);
end;

procedure TTrackBar.SetMin(Value: Integer);
begin
  if Value <= FMax then
    SetParams(FPosition, Value, FMax);
end;

procedure TTrackBar.SetMax(Value: Integer);
begin
  if Value >= FMin then
    SetParams(FPosition, FMin, Value);
end;

procedure TTrackBar.SetFrequency(Value: Integer);
begin
  if Value <> FFrequency then
  begin
    FFrequency := Value;
    if HandleAllocated then
      SendMessage(Handle, TBM_SETTICFREQ, FFrequency, 1);
  end;
end;

procedure TTrackBar.SetTick(Value: Integer);
begin
  if HandleAllocated then
    SendMessage(Handle, TBM_SETTIC, 0, Value);
end;

procedure TTrackBar.SetTickStyle(Value: TTickStyle);
begin
  if Value <> FTickStyle then
  begin
    FTickStyle := Value;
    RecreateWnd;
  end;
end;

procedure TTrackBar.SetTickMarks(Value: TTickMark);
begin
  if Value <> FTickMarks then
  begin
    FTickMarks := Value;
    RecreateWnd;
  end;
end;

procedure TTrackBar.SetLineSize(Value: Integer);
begin
  if Value <> FLineSize then
  begin
    FLineSize := Value;
    if HandleAllocated then
      SendMessage(Handle, TBM_SETLINESIZE, 0, FLineSize);
  end;
end;

procedure TTrackBar.SetPageSize(Value: Integer);
begin
  if Value <> FPageSize then
  begin
    FPageSize := Value;
    if HandleAllocated then
      SendMessage(Handle, TBM_SETPAGESIZE, 0, FPageSize);
  end;
end;

procedure TTrackBar.SetPositionToolTip(const Value: TPositionToolTip);
begin
  if Value <> FPositionToolTip then
  begin
    FPositionToolTip := Value;
    if not (csDesigning in ComponentState) then
      RecreateWnd;
  end;
end;

procedure TTrackBar.SetThumbLength(Value: Integer);
begin
  if Value <> FThumbLength then
  begin
    FThumbLength := Value;
    if HandleAllocated then
      SendMessage(Handle, TBM_SETTHUMBLENGTH, Value, 0);
  end;
end;

procedure TTrackBar.SetSliderVisible(Value: Boolean);
begin
  if FSliderVisible <> Value then
  begin
    FSliderVisible := Value;
    RecreateWnd;
  end;
end;

procedure TTrackBar.SetShowSelRange(const Value: Boolean);
begin
  if Value <> FShowSelRange then
  begin
    FShowSelRange := Value;
    RecreateWnd;
  end;
end;

procedure TTrackBar.UpdateSelection;
begin
  if HandleAllocated then
  begin
    if (FSelStart = 0) and (FSelEnd = 0) then
      SendMessage(Handle, TBM_CLEARSEL, 1, 0)
    else
    begin
      if FSelEnd < High(SmallInt) then
        SendMessage(Handle, TBM_SETSEL, WPARAM(True), MakeLong(FSelStart, FSelEnd))
      else
      begin
        SendMessage(Handle, TBM_SETSELSTART, WPARAM(False), FSelStart);
        SendMessage(Handle, TBM_SETSELEND, WPARAM(True), FSelEnd);
      end;
    end;
  end;
end;

procedure TTrackBar.SetSelStart(Value: Integer);
begin
  if Value <> FSelStart then
  begin
    FSelStart := Value;
    UpdateSelection;
  end;
end;

procedure TTrackBar.SetSelEnd(Value: Integer);
begin
  if Value <> FSelEnd then
  begin
    FSelEnd := Value;
    UpdateSelection;
  end;
end;

procedure TTrackBar.Changed;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TTrackBar.CNNotify(var Message: TWMNotifyTRB);
var
  R: TRect;
  Rgn: HRGN;
  Details: TThemedElementDetails;
  Offset: Integer;
{$IFDEF CLR}
  Info: TNMCustomDraw;
{$ELSE}
  Info: PNMCustomDraw;
{$ENDIF}
begin
  if StyleServices.Enabled then
  begin
    with Message do
      if NMHdr.code = NM_CUSTOMDRAW then
      begin
        Info := NMCustomDraw;
        case Info.dwDrawStage of
          CDDS_PREPAINT:
            Result := CDRF_NOTIFYITEMDRAW;
          CDDS_ITEMPREPAINT:
            begin
{$IFDEF CLR}
              case Info.dwItemSpec.ToInt64 of
{$ELSE}
              case Info.dwItemSpec of
{$ENDIF}
                TBCD_TICS:
                  begin
                    R := ClientRect;
                    if Focused and ((Perform(WM_QUERYUISTATE, 0, 0) and UISF_HIDEFOCUS) = 0) then
                      InflateRect(R, -1, -1);
                    StyleServices.DrawParentBackground(Handle, Info.hDC, nil, False, R)
                  end;
                TBCD_CHANNEL:
                  begin
                    SendGetStructMessage(Handle, TBM_GETTHUMBRECT, 0, R);
                    Offset := 0;
                    if Focused then
                      Inc(Offset);
                    if Orientation = trHorizontal then
                    begin
                      R.Left := ClientRect.Left + Offset;
                      R.Right := ClientRect.Right - Offset;
                    end
                    else
                    begin
                      R.Top := ClientRect.Top + Offset;
                      R.Bottom := ClientRect.Bottom - Offset;
                    end;
                    with R do
                      Rgn := CreateRectRgn(Left, Top, Right, Bottom);
                    SelectClipRgn(Info.hDC, Rgn);
                    Details := StyleServices.GetElementDetails(ttbThumbTics);
                    StyleServices.DrawParentBackground(Handle, Info.hDC, Details, False);
                    DeleteObject(Rgn);
                    SelectClipRgn(Info.hDC, 0);
                  end;
              end;
              Result := CDRF_DODEFAULT;
            end;
        else
          Result := CDRF_DODEFAULT;
        end;
      end;
  end
  else
    inherited;
end;

procedure TTrackBar.WMEraseBkGnd(var Message: TWMEraseBkGnd);
var
  R: TRect;
begin
  if StyleServices.Enabled then
  begin
    R := ClientRect;
    if Focused and ((Perform(WM_QUERYUISTATE, 0, 0) and UISF_HIDEFOCUS) = 0) then
      InflateRect(R, -1, -1);
    StyleServices.DrawParentBackground(Handle, Message.DC, nil, False, R);
    Message.Result := 1;
  end
  else
    inherited;
end;

{ TProgressBar }

const
  Limit16 = 65535;

procedure ProgressLimitError;
begin
  raise Exception.CreateResFmt({$IFNDEF CLR}@{$ENDIF}SOutOfRange, [0, Limit16]);
end;

class constructor TProgressBar.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TProgressBar, TProgressBarStyleHook);
end;

constructor TProgressBar.Create(AOwner: TComponent);
begin
  F32BitMode := InitCommonControl(ICC_PROGRESS_CLASS);
  inherited Create(AOwner);
  Width := 150;
  Height := GetSystemMetrics(SM_CYVSCROLL);
  FMin := 0;
  FMax := 100;
  FStep := 10;
  FOrientation := pbHorizontal;
  FBarColor := clDefault;
  FBackgroundColor := clDefault;
  FMarqueeInterval := 10;
  FSmoothReverse := false;
  FState := pbsNormal;
  FStyle := pbstNormal;
end;

class destructor TProgressBar.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TProgressBar, TProgressBarStyleHook);
end;

procedure TProgressBar.CreateParams(var Params: TCreateParams);
begin
  if not F32BitMode then InitCommonControls;
  inherited CreateParams(Params);
  CreateSubClass(Params, PROGRESS_CLASS);
  with Params do
  begin
    if FOrientation = pbVertical then
      Style := Style or PBS_VERTICAL;
    if FSmooth then
      Style := Style or PBS_SMOOTH;
    //Enable pbstMarquee only on Windows >= XP
    if (FStyle = pbstMarquee) and StyleServices.Available and
       CheckWin32Version(5, 1) and not (csDesigning in ComponentState) then
      Style := Style or PBS_MARQUEE;
    if FSmoothReverse and StyleServices.Enabled and CheckWin32Version(6, 0) then
      Style := Style or PBS_SMOOTHREVERSE;
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TProgressBar.CreateWnd;
var
  MarqueeEnabled: Boolean;
begin
  inherited CreateWnd;
  if F32BitMode then SendMessage(Handle, PBM_SETRANGE32, FMin, FMax)
  else SendMessage(Handle, PBM_SETRANGE, 0, MakeLong(FMin, FMax));
  SendMessage(Handle, PBM_SETSTEP, FStep, 0);
  Position := FPosition;
  BarColor := FBarColor;
  BackgroundColor := FBackgroundColor;
  State := FState;

  if StyleServices.Available and CheckWin32Version(5, 1) and
     HandleAllocated and not (csDesigning in ComponentState) then
  begin
    MarqueeEnabled := FStyle = pbstMarquee;
    SendMessage(Handle, PBM_SETMARQUEE, WPARAM(THandle(MarqueeEnabled)), LPARAM(FMarqueeInterval));
  end;
end;

procedure TProgressBar.DestroyWnd;
begin
  FPosition := Position;
  inherited DestroyWnd;
end;

function TProgressBar.GetMin: Integer;
begin
  if HandleAllocated and F32BitMode then
    Result := SendMessage(Handle, PBM_GetRange, 1, 0)
  else
    Result := FMin;
end;

function TProgressBar.GetMax: Integer;
begin
  if HandleAllocated and F32BitMode then
    Result := SendMessage(Handle, PBM_GetRange, 0, 0)
  else
    Result := FMax;
end;

function TProgressBar.GetPosition: Integer;
begin
  if HandleAllocated then
  begin
    if F32BitMode then Result := SendMessage(Handle, PBM_GETPOS, 0, 0)
    else Result := SendMessage(Handle, PBM_DELTAPOS, 0, 0)
  end
  else Result := FPosition;
end;

procedure TProgressBar.SetParams(AMin, AMax: Integer);
begin
  if AMax < AMin then
    raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [Self.Classname]);
  if not F32BitMode and ((AMin < 0) or (AMin > Limit16) or (AMax < 0) or
    (AMax > Limit16)) then ProgressLimitError;
  if (FMin <> AMin) or (FMax <> AMax) then
  begin
    if HandleAllocated then
    begin
      if F32BitMode then SendMessage(Handle, PBM_SETRANGE32, AMin, AMax)
      else SendMessage(Handle, PBM_SETRANGE, 0, MakeLong(AMin, AMax));
      if FMin > AMin then // since Windows sets Position when increase Min..
        SendMessage(Handle, PBM_SETPOS, AMin, 0); // set it back if decrease
    end;
    FMin := AMin;
    FMax := AMax;
  end;
end;

procedure TProgressBar.SetMin(Value: Integer);
begin
  SetParams(Value, FMax);
end;

procedure TProgressBar.SetMax(Value: Integer);
begin
  SetParams(FMin, Value);
end;

procedure TProgressBar.SetMarqueeInterval(Value: Integer);
var
  MarqueeEnabled: Boolean;
begin
  FMarqueeInterval := Value;
  if (FStyle = pbstMarquee) and StyleServices.Available and
     CheckWin32Version(5, 1) and HandleAllocated and not (csDesigning in ComponentState) then
  begin
    MarqueeEnabled := FStyle = pbstMarquee;
    SendMessage(Handle, PBM_SETMARQUEE, WPARAM(MarqueeEnabled), LPARAM(FMarqueeInterval));
  end;
end;

procedure TProgressBar.SetPosition(Value: Integer);
begin
  if not F32BitMode and ((Value < 0) or (Value > Limit16)) then
    ProgressLimitError;
  if HandleAllocated then
    SendMessage(Handle, PBM_SETPOS, Value, 0)
  else
    FPosition := Value;
end;

procedure TProgressBar.SetStep(Value: Integer);
begin
  if Value <> FStep then
  begin
    FStep := Value;
    if HandleAllocated then
      SendMessage(Handle, PBM_SETSTEP, FStep, 0);
  end;
end;

procedure TProgressBar.StepIt;
begin
  if HandleAllocated then
    SendMessage(Handle, PBM_STEPIT, 0, 0);
end;

procedure TProgressBar.StepBy(Delta: Integer);
begin
  if HandleAllocated then
    SendMessage(Handle, PBM_DELTAPOS, Delta, 0);
end;

procedure TProgressBar.SetOrientation(Value: TProgressBarOrientation);
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;
    RecreateWnd;
  end;
end;

procedure TProgressBar.SetSmooth(Value: Boolean);
begin
  if FSmooth <> Value then
  begin
    FSmooth := Value;
    RecreateWnd;
  end;
end;

procedure TProgressBar.SetSmoothReverse(Value: Boolean);
begin
  if SmoothReverse <> Value then
  begin
    FSmoothReverse := Value;
    RecreateWnd;
  end;
end;

procedure TProgressBar.SetStyle(Value: TProgressBarStyle);
var
  MarqueeEnabled: Boolean;
begin
  if FStyle <> Value then
  begin
    FStyle := Value;

    if FStyle = pbstMarquee then
    begin
      FSavedPosition := Position; // Store the position in the saved field when we go to marquee mode
      DoubleBuffered := False;    // Marquee mode isn't compatible with DouleBuffered
    end;

    if StyleServices.Available and CheckWin32Version(5, 1) and
       HandleAllocated and not (csDesigning in ComponentState) then
    begin
      MarqueeEnabled := FStyle = pbstMarquee;
      SendMessage(Handle, PBM_SETMARQUEE, WPARAM(THandle(MarqueeEnabled)), LPARAM(FMarqueeInterval));
    end;

    RecreateWnd;

    if FStyle = pbstNormal then
      Position := FSavedPosition; //Restore the position from the saved field when we return from marquee mode
  end;
end;

procedure TProgressBar.SetBarColor(Value: TColor);
var
  ColorRef: TColorRef;
begin
  FBarColor := Value;
  if Value = clDefault then
    ColorRef := TColorRef($FF000000)
  else
    ColorRef := TColorRef(ColorToRGB(Value));
  if HandleAllocated then
    SendMessage(Handle, PBM_SETBARCOLOR, 0, ColorRef);
end;

procedure TProgressBar.SetBackgroundColor(Value: TColor);
var
  ColorRef: TColorRef;
begin
  FBackgroundColor := Value;
  if Value = clDefault then
    ColorRef := TColorRef($FF000000)
  else
    ColorRef := TColorRef(ColorToRGB(Value));
  if HandleAllocated then
    SendMessage(Handle, PBM_SETBKCOLOR, 0, ColorRef);
end;

procedure TProgressBar.SetState(Value: TProgressBarState);
begin
  FState := Value;
  if CheckWin32Version(6, 0) and HandleAllocated then
    SendMessage(Handle, PBM_SETSTATE, WPARAM(Ord(FState) + 1), 0);
end;

procedure TProgressBar.WMEraseBkGnd(var Message: TWmEraseBkgnd);
begin
  DefaultHandler(Message);
end;

{ TTextAttributes }

constructor TTextAttributes.Create(AOwner: TCustomRichEdit;
  AttributeType: TAttributeType);
begin
  inherited Create;
  RichEdit := AOwner;
  FType := AttributeType;
end;

procedure TTextAttributes.InitFormat(var Format: TCharFormat2);
begin
{$IFDEF CLR}
  Format.cbSize := Marshal.SizeOf(TypeOf(TCharFormat2));
{$ELSE}
  FillChar(Format, SizeOf(TCharFormat2), 0);
  Format.cbSize := SizeOf(TCharFormat2);
{$ENDIF}
end;

function TTextAttributes.GetConsistentAttributes: TConsistentAttributes;
var
  Format: TCharFormat2;
begin
  Result := [];
  if RichEdit.HandleAllocated and (FType = atSelected) then
  begin
    InitFormat(Format);
    SendGetStructMessage(RichEdit.Handle, EM_GETCHARFORMAT,
      WPARAM(FType = atSelected), Format, True);
    with Format do
    begin
      if (dwMask and CFM_BOLD) <> 0 then Include(Result, caBold);
      if (dwMask and CFM_COLOR) <> 0 then Include(Result, caColor);
      if (dwMask and CFM_FACE) <> 0 then Include(Result, caFace);
      if (dwMask and CFM_ITALIC) <> 0 then Include(Result, caItalic);
      if (dwMask and CFM_SIZE) <> 0 then Include(Result, caSize);
      if (dwMask and CFM_STRIKEOUT) <> 0 then Include(Result, caStrikeOut);
      if (dwMask and CFM_UNDERLINE) <> 0 then Include(Result, caUnderline);
      if (dwMask and CFM_PROTECTED) <> 0 then Include(Result, caProtected);
    end;
  end;
end;

procedure TTextAttributes.GetAttributes(var Format: TCharFormat2);
begin
  InitFormat(Format);
  if RichEdit.HandleAllocated then
    SendGetStructMessage(RichEdit.Handle, EM_GETCHARFORMAT,
      WPARAM(FType = atSelected), Format, True);
end;

procedure TTextAttributes.SetAttributes(var Format: TCharFormat2);
var
  Flag: Longint;
begin
  if FType = atSelected then Flag := SCF_SELECTION
  else Flag := 0;
  if RichEdit.HandleAllocated then
    SendStructMessage(RichEdit.Handle, EM_SETCHARFORMAT, Flag, Format);
end;

function TTextAttributes.GetCharset: TFontCharset;
var
  Format: TCharFormat2;
begin
  GetAttributes(Format);
  Result := Format.bCharset;
end;

procedure TTextAttributes.SetCharset(Value: TFontCharset);
var
  Format: TCharFormat2;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_CHARSET;
    bCharSet := Value;
  end;
  SetAttributes(Format);
end;

function TTextAttributes.GetProtected: Boolean;
var
  Format: TCharFormat2;
begin
  GetAttributes(Format);
  with Format do
    if (dwEffects and CFE_PROTECTED) <> 0 then
      Result := True else
      Result := False;
end;

procedure TTextAttributes.SetProtected(Value: Boolean);
var
  Format: TCharFormat2;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_PROTECTED;
    if Value then dwEffects := CFE_PROTECTED;
  end;
  SetAttributes(Format);
end;

function TTextAttributes.GetColor: TColor;
var
  Format: TCharFormat2;
begin
  GetAttributes(Format);
  with Format do
    if (dwEffects and CFE_AUTOCOLOR) <> 0 then
      Result := clWindowText else
      Result := crTextColor;
end;

procedure TTextAttributes.SetColor(Value: TColor);
var
  Format: TCharFormat2;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_COLOR;
    if Value = clWindowText then
      dwEffects := CFE_AUTOCOLOR else
      crTextColor := ColorToRGB(Value);
  end;
  SetAttributes(Format);
end;

function TTextAttributes.GetName: TFontName;
var
  Format: TCharFormat2;
begin
  GetAttributes(Format);
  Result := Format.szFaceName;
end;

procedure TTextAttributes.SetName(Value: TFontName);
var
  Format: TCharFormat2;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_FACE;
{$IFDEF CLR}
    szFaceName := Value;
{$ELSE}
    StrPLCopy(szFaceName, Value, Length(szFaceName) - 1);
{$ENDIF}
  end;
  SetAttributes(Format);
end;

function TTextAttributes.GetStyle: TFontStyles;
var
  Format: TCharFormat2;
begin
  Result := [];
  GetAttributes(Format);
  with Format do
  begin
    if (dwEffects and CFE_BOLD) <> 0 then Include(Result, fsBold);
    if (dwEffects and CFE_ITALIC) <> 0 then Include(Result, fsItalic);
    if (dwEffects and CFE_UNDERLINE) <> 0 then Include(Result, fsUnderline);
    if (dwEffects and CFE_STRIKEOUT) <> 0 then Include(Result, fsStrikeOut);
  end;
end;

procedure TTextAttributes.SetStyle(Value: TFontStyles);
var
  Format: TCharFormat2;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := CFM_BOLD or CFM_ITALIC or CFM_UNDERLINE or CFM_STRIKEOUT;
    if fsBold in Value then dwEffects := dwEffects or CFE_BOLD;
    if fsItalic in Value then dwEffects := dwEffects or CFE_ITALIC;
    if fsUnderline in Value then dwEffects := dwEffects or CFE_UNDERLINE;
    if fsStrikeOut in Value then dwEffects := dwEffects or CFE_STRIKEOUT;
  end;
  SetAttributes(Format);
end;

function TTextAttributes.GetSize: Integer;
var
  Format: TCharFormat2;
begin
  GetAttributes(Format);
  Result := Format.yHeight div 20;
end;

procedure TTextAttributes.SetSize(Value: Integer);
var
  Format: TCharFormat2;
begin
  InitFormat(Format);
  with Format do
  begin
    dwMask := DWORD(CFM_SIZE);
    yHeight := Value * 20;
  end;
  SetAttributes(Format);
end;

function TTextAttributes.GetHeight: Integer;
begin
  Result := MulDiv(Size, RichEdit.FScreenLogPixels, 72);
end;

procedure TTextAttributes.SetHeight(Value: Integer);
begin
  Size := MulDiv(Value, 72, RichEdit.FScreenLogPixels);
end;

function TTextAttributes.GetPitch: TFontPitch;
var
  Format: TCharFormat2;
begin
  GetAttributes(Format);
  case (Format.bPitchAndFamily and $03) of
    DEFAULT_PITCH: Result := fpDefault;
    VARIABLE_PITCH: Result := fpVariable;
    FIXED_PITCH: Result := fpFixed;
  else
    Result := fpDefault;
  end;
end;

procedure TTextAttributes.SetPitch(Value: TFontPitch);
var
  Format: TCharFormat2;
begin
  InitFormat(Format);
  with Format do
  begin
    case Value of
      fpVariable: Format.bPitchAndFamily := VARIABLE_PITCH;
      fpFixed: Format.bPitchAndFamily := FIXED_PITCH;
    else
      Format.bPitchAndFamily := DEFAULT_PITCH;
    end;
  end;
  SetAttributes(Format);
end;

procedure TTextAttributes.Assign(Source: TPersistent);
begin
  if Source is TFont then
  begin
    Color := TFont(Source).Color;
    Name := TFont(Source).Name;
    Charset := TFont(Source).Charset;
    Style := TFont(Source).Style;
    Size := TFont(Source).Size;
    Pitch := TFont(Source).Pitch;
  end
  else if Source is TTextAttributes then
  begin
    Color := TTextAttributes(Source).Color;
    Name := TTextAttributes(Source).Name;
    Charset := TTextAttributes(Source).Charset;
    Style := TTextAttributes(Source).Style;
    Pitch := TTextAttributes(Source).Pitch;
    Size := TTextAttributes(Source).Size;
  end
  else inherited Assign(Source);
end;

procedure TTextAttributes.AssignTo(Dest: TPersistent);
begin
  if Dest is TFont then
  begin
    TFont(Dest).Color := Color;
    TFont(Dest).Name := Name;
    TFont(Dest).Charset := Charset;
    TFont(Dest).Style := Style;
    TFont(Dest).Size := Size;
    TFont(Dest).Pitch := Pitch;
  end
  else if Dest is TTextAttributes then
  begin
    TTextAttributes(Dest).Color := Color;
    TTextAttributes(Dest).Name := Name;
    TTextAttributes(Dest).Charset := Charset;
    TTextAttributes(Dest).Style := Style;
    TTextAttributes(Dest).Pitch := Pitch;
  end
  else inherited AssignTo(Dest);
end;

{ TParaAttributes }

constructor TParaAttributes.Create(AOwner: TCustomRichEdit);
begin
  inherited Create;
  RichEdit := AOwner;
end;

procedure TParaAttributes.InitPara(var Paragraph: TParaFormat2);
begin
{$IFDEF CLR}
  Paragraph.cbSize := Marshal.SizeOf(TypeOf(TParaFormat2));
{$ELSE}
  FillChar(Paragraph, SizeOf(TParaFormat), 0);
  Paragraph.cbSize := SizeOf(TParaFormat);
{$ENDIF}
end;

procedure TParaAttributes.GetAttributes(var Paragraph: TParaFormat2);
begin
  InitPara(Paragraph);
  if RichEdit.HandleAllocated then
    SendGetStructMessage(RichEdit.Handle, EM_GETPARAFORMAT, 0, Paragraph, True);
end;

procedure TParaAttributes.SetAttributes(var Paragraph: TParaFormat2);
begin
  RichEdit.HandleNeeded; { we REALLY need the handle for BiDi }
  if RichEdit.HandleAllocated then
  begin
    if RichEdit.UseRightToLeftAlignment then
      if Paragraph.wAlignment = PFA_LEFT then
        Paragraph.wAlignment := PFA_RIGHT
      else if Paragraph.wAlignment = PFA_RIGHT then
        Paragraph.wAlignment := PFA_LEFT;
    SendStructMessage(RichEdit.Handle, EM_SETPARAFORMAT, 0, Paragraph);
  end;
end;

function TParaAttributes.GetAlignment: TAlignment;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := TAlignment(Paragraph.wAlignment - 1);
end;

procedure TParaAttributes.SetAlignment(Value: TAlignment);
var
  Paragraph: TParaFormat2;
begin
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_ALIGNMENT;
    wAlignment := Ord(Value) + 1;
  end;
  SetAttributes(Paragraph);
end;

function TParaAttributes.GetNumbering: TNumberingStyle;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := TNumberingStyle(Paragraph.wNumbering);
end;

procedure TParaAttributes.SetNumbering(Value: TNumberingStyle);
var
  Paragraph: TParaFormat2;
begin
  case Value of
    nsBullet: if LeftIndent < 10 then LeftIndent := 10;
    nsNone: LeftIndent := 0;
  end;
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_NUMBERING;
    wNumbering := Ord(Value);
  end;
  SetAttributes(Paragraph);
end;

function TParaAttributes.GetFirstIndent: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dxStartIndent div 20
end;

procedure TParaAttributes.SetFirstIndent(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_STARTINDENT;
    dxStartIndent := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TParaAttributes.GetLeftIndent: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dxOffset div 20;
end;

procedure TParaAttributes.SetLeftIndent(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_OFFSET;
    dxOffset := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TParaAttributes.GetRightIndent: Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.dxRightIndent div 20;
end;

procedure TParaAttributes.SetRightIndent(Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  InitPara(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_RIGHTINDENT;
    dxRightIndent := Value * 20;
  end;
  SetAttributes(Paragraph);
end;

function TParaAttributes.GetTab(Index: Byte): Longint;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.rgxTabs[Index] div 20;
end;

procedure TParaAttributes.SetTab(Index: Byte; Value: Longint);
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  with Paragraph do
  begin
    rgxTabs[Index] := Value * 20;
    dwMask := PFM_TABSTOPS;
    if cTabCount < Index then cTabCount := Index;
    SetAttributes(Paragraph);
  end;
end;

function TParaAttributes.GetTabCount: Integer;
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  Result := Paragraph.cTabCount;
end;

procedure TParaAttributes.SetTabCount(Value: Integer);
var
  Paragraph: TParaFormat2;
begin
  GetAttributes(Paragraph);
  with Paragraph do
  begin
    dwMask := PFM_TABSTOPS;
    cTabCount := Value;
    SetAttributes(Paragraph);
  end;
end;

procedure TParaAttributes.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TParaAttributes then
  begin
    Alignment := TParaAttributes(Source).Alignment;
    FirstIndent := TParaAttributes(Source).FirstIndent;
    LeftIndent := TParaAttributes(Source).LeftIndent;
    RightIndent := TParaAttributes(Source).RightIndent;
    Numbering := TParaAttributes(Source).Numbering;
    for I := 0 to MAX_TAB_STOPS - 1 do
      Tab[I] := TParaAttributes(Source).Tab[I];
  end
  else inherited Assign(Source);
end;

{ TConversion }

constructor TConversion.Create;
begin
  inherited Create;
end;

function TConversion.ConvertReadStream(Stream: TStream;
  Buffer: TConversionBuffer; BufSize: Integer): Integer;
begin
  Result := Stream.Read(Buffer{$IFNDEF CLR}[0]{$ENDIF}, BufSize);
end;

function TConversion.ConvertWriteStream(Stream: TStream;
  Buffer: TConversionBuffer; BufSize: Integer): Integer;
begin
  Result := Stream.Write(Buffer{$IFNDEF CLR}[0]{$ENDIF}, BufSize);
end;

{ TRichEditStrings }

const
  ReadError = $0001;
  WriteError = $0002;
  NoError = $0000;

type
  TRichEditStrings = class(TStrings)
  private
    RichEdit: TCustomRichEdit;
    FPlainText: Boolean;
    FConverter: TConversion;
    procedure EnableChange(const Value: Boolean);
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure SetUpdateState(Updating: Boolean); override;
    procedure SetTextStr(const Value: string); override;
  public
    destructor Destroy; override;
    procedure Clear; override;
    procedure AddStrings(Strings: TStrings); override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
    procedure LoadFromFile(const FileName: string; AEncoding: TEncoding); override;
    procedure LoadFromStream(Stream: TStream; AEncoding: TEncoding); override;
    procedure SaveToFile(const FileName: string; AEncoding: TEncoding); override;
    procedure SaveToStream(Stream: TStream; AEncoding: TEncoding); override;
    property PlainText: Boolean read FPlainText write FPlainText;
  end;

destructor TRichEditStrings.Destroy;
begin
  FConverter.Free;
  inherited Destroy;
end;

procedure TRichEditStrings.AddStrings(Strings: TStrings);
var
  SelChange: TNotifyEvent;
begin
  SelChange := RichEdit.OnSelectionChange;
  RichEdit.OnSelectionChange := nil;
  try
    inherited AddStrings(Strings);
  finally
    RichEdit.OnSelectionChange := SelChange;
  end;
end;

function TRichEditStrings.GetCount: Integer;
begin
  Result := SendMessage(RichEdit.Handle, EM_GETLINECOUNT, 0, 0);
  if SendMessage(RichEdit.Handle, EM_LINELENGTH, SendMessage(RichEdit.Handle,
    EM_LINEINDEX, Result - 1, 0), 0) = 0 then Dec(Result);
end;

function TRichEditStrings.Get(Index: Integer): string;
{$IFDEF CLR}
const
  MaxLineBytes = 4096 * 2;
var
  L: Integer;
begin
  L := SendGetTextMessage(RichEdit.Handle, EM_GETLINE, Index, Result, MaxLineBytes);
  if (L >= 1) and (Result[L] = #13) then
    SetLength(Result, L - 1);
{$ELSE}
var
  Text: array[0..4095] of Char;
  L: Integer;
begin
  Word((@Text)^) := Length(Text);
  L := SendMessage(RichEdit.Handle, EM_GETLINE, Index, LPARAM(@Text));
  if (L >= 1) and (Text[L - 1] = #13) then
    Dec(L);
  SetString(Result, Text, L);
{$ENDIF}
end;

procedure TRichEditStrings.Put(Index: Integer; const S: string);
var
  Selection: TCharRange;
begin
  if Index >= 0 then
  begin
    Selection.cpMin := SendMessage(RichEdit.Handle, EM_LINEINDEX, Index, 0);
    if Selection.cpMin <> -1 then
    begin
      Selection.cpMax := Selection.cpMin +
        SendMessage(RichEdit.Handle, EM_LINELENGTH, Selection.cpMin, 0);
      SendStructMessage(RichEdit.Handle, EM_EXSETSEL, 0, Selection);
      SendTextMessage(RichEdit.Handle, EM_REPLACESEL, 0, S);
    end;
  end;
end;

procedure TRichEditStrings.Insert(Index: Integer; const S: string);

  function CountLineBreaks(const S: string): Integer;
  const
    LB = #13#10;
  var
    P: Integer;
  begin
    Result := 0;
    P := Pos(LB, S);
    while P <> 0 do
    begin
      Inc(Result);
      P := PosEx(LB, S, P + 2);
    end;
  end;

const
  CRLF = #13;
var
  L: Integer;
  Selection: TCharRange;
  Fmt, Str: string;
begin
  if Index >= 0 then
  begin
    Selection.cpMin := SendMessage(RichEdit.Handle, EM_LINEINDEX, Index, 0);
    if Selection.cpMin >= 0 then
      Fmt := '%s' + CRLF
    else
    begin
      Selection.cpMin := SendMessage(RichEdit.Handle, EM_LINEINDEX, Index - 1, 0);
      if Selection.cpMin < 0 then Exit;
      L := SendMessage(RichEdit.Handle, EM_LINELENGTH, Selection.cpMin, 0);
      if L = 0 then Exit;
      Inc(Selection.cpMin, L);
      Fmt := CRLF + '%s';
    end;
    Selection.cpMax := Selection.cpMin;
    SendStructMessage(RichEdit.Handle, EM_EXSETSEL, 0, Selection);
    Str := Format(Fmt, [S]);
    SendTextMessage(RichEdit.Handle, EM_REPLACESEL, 0, Str);
    // RichEdit 2.0 replaces CRLF pairs with CR. We need to account for that when
    // verifying that the insertion succeeded in case S contains a CRLF pair.
    if RichEdit.SelStart <> (Selection.cpMax + Length(Str) - CountLineBreaks(Str)) then
      raise EOutOfResources.Create(sRichEditInsertError);
  end;
end;

procedure TRichEditStrings.Delete(Index: Integer);
const
  Empty = '';
var
  Selection: TCharRange;
begin
  if Index < 0 then Exit;
  Selection.cpMin := SendMessage(RichEdit.Handle, EM_LINEINDEX, Index, 0);
  if Selection.cpMin <> -1 then
  begin
    Selection.cpMax := SendMessage(RichEdit.Handle, EM_LINEINDEX, Index + 1, 0);
    if Selection.cpMax = -1 then
      Selection.cpMax := Selection.cpMin +
        SendMessage(RichEdit.Handle, EM_LINELENGTH, Selection.cpMin, 0);
    SendStructMessage(RichEdit.Handle, EM_EXSETSEL, 0, Selection);
    SendTextMessage(RichEdit.Handle, EM_REPLACESEL, 0, Empty);
  end;
end;

procedure TRichEditStrings.Clear;
begin
  RichEdit.Clear;
end;

procedure TRichEditStrings.SetUpdateState(Updating: Boolean);
begin
  if RichEdit.Showing then
    SendMessage(RichEdit.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then
  begin
    RichEdit.Refresh;
    RichEdit.Perform(CM_TEXTCHANGED, 0, 0);
  end;
end;

procedure TRichEditStrings.EnableChange(const Value: Boolean);
var
  EventMask: Longint;
begin
  with RichEdit do
  begin
    if Value then
      EventMask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0) or ENM_CHANGE
    else
      EventMask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0) and not ENM_CHANGE;
    SendMessage(Handle, EM_SETEVENTMASK, 0, EventMask);
  end;
end;

procedure TRichEditStrings.SetTextStr(const Value: string);
begin
  EnableChange(False);
  try
    inherited SetTextStr(Value);
  finally
    EnableChange(True);
  end;
end;

{$IFDEF CLR}
function AdjustLineBreaks(Dest: IntPtr; Source: TBytes; Start, Len: Integer): Integer;
var
  I, J: Integer;
begin
  I := Start; // Position in Source
  J := 0; // Position in Dest
  while I < (Len - 1) do
  begin
    if (Source[I] = 10) and (Source[I + 1] = 0) then
    begin
      // Convert #10 to #13#10
      Marshal.WriteByte(Dest, J, 13);
      Marshal.WriteByte(Dest, J + 1, 0);
      Inc(J, 2);
      Marshal.WriteByte(Dest, J, 10);
      Marshal.WriteByte(Dest, J + 1, 0);
    end
    else
    begin
      Marshal.WriteByte(Dest, J, Source[I]);
      Marshal.WriteByte(Dest, J + 1, Source[I + 1]);
      if (Source[I] = 13) and (Source[I + 1] = 0) then
      begin
        // Convert #13 to #13#10
        Inc(J, 2);
        Marshal.WriteByte(Dest, J, 10);
        Marshal.WriteByte(Dest, J + 1, 0);
        // Skip #10 if preceeded by #13
        if (Source[I + 2] = 10) and (Source[I + 3] = 0) then
          Inc(I, 2);
      end;
    end;
    Inc(I, 2);
    Inc(J, 2);
  end;
  if I = Len - 1 then
  begin
     Marshal.WriteByte(Dest, J, Source[I]);
     Inc(J);
  end;
  Result := J;
end;
{$ELSE}
function AdjustLineBreaks(Dest: PByte; Source: TBytes; Start, Len: Integer): Integer;
var
  P: PByte;
  I: Integer;
begin
  I := Start; // Position in Source
  P := Dest;
  while I < (Len - 1) do
  begin
    if (Source[I] = 10) and (Source[I + 1] = 0) then
    begin
      // Convert #10 to #13#10
      P^ := 13;
      Inc(P);
      P^ := 0;
      Inc(P);
      P^ := 10;
      Inc(P);
      P^ := 0;
      Inc(P);
    end
    else
    begin
      P^ := Source[I];
      Inc(P);
      P^ := Source[I + 1];
      Inc(P);
      if (Source[I] = 13) and (Source[I + 1] = 0) then
      begin
        // Convert #13 to #13#10
        P^ := 10;
        Inc(P);
        P^ := 0;
        Inc(P);
        // Skip #10 if preceeded by #13
        if (Source[I + 2] = 10) and (Source[I + 3] = 0) then
          Inc(I, 2);
      end;
    end;
    Inc(I, 2);
  end;
  if I = Len - 1 then
  begin
    P^ := Source[I];
    Inc(P);
  end;
  Result := P - Dest;
end;
{$ENDIF}

{$IFDEF CLR}
function StreamSave(dwCookie: DWORD_PTR; pbBuff: IntPtr;
  cb: Longint; var pcb: Longint): Longint;
{$ELSE}
function StreamSave(dwCookie: DWORD_PTR; pbBuff: PByte;
  cb: Longint; var pcb: Longint): Longint; stdcall;
{$ENDIF}
var
  StreamInfo: TRichEditStreamInfo;
  Buffer: TBytes;
{$IFDEF CLR}
  Handle: GCHandle;
{$ENDIF}
begin
  Result := NoError;
{$IFDEF CLR}
  Handle := GCHandle(IntPtr(dwCookie));
  StreamInfo := TRichEditStreamInfo(Handle.Target);
{$ELSE}
  StreamInfo := PRichEditStreamInfo(dwCookie)^;
{$ENDIF}
  try
    pcb := 0;
    if StreamInfo.Converter <> nil then
    begin
      SetLength(Buffer, cb);
{$IFDEF CLR}
      Marshal.Copy(pbBuff, Buffer, 0, cb);
{$ELSE}
      Move(pbBuff^, Buffer[0], cb);
{$ENDIF}
      // Convert from Unicode to Encoding if PlainText is set
      if StreamInfo.PlainText then
      begin
        if StreamInfo.Encoding = nil then
          Buffer := TEncoding.Convert(TEncoding.Unicode, TEncoding.Default, Buffer)
        else
        begin
          if not TEncoding.Unicode.Equals(StreamInfo.Encoding) then
            Buffer := TEncoding.Convert(TEncoding.Unicode, StreamInfo.Encoding, Buffer);
        end;
      end;
      pcb := StreamInfo.Converter.ConvertWriteStream(StreamInfo.Stream, Buffer, Length(Buffer));
      // Length(Buffer) may be different from 'cb' if we converted the char set
      if (pcb <> cb) and (pcb = Length(Buffer)) then
        pcb := cb; // Fake the number of bytes written
    end;
  except
    Result := WriteError;
  end;
end;

{$IFDEF CLR}
function StreamLoad(dwCookie: DWORD_PTR; pbBuff: IntPtr;
  cb: Longint; var pcb: Longint): Longint;
{$ELSE}
function StreamLoad(dwCookie: DWORD_PTR; pbBuff: PByte;
  cb: Longint; var pcb: Longint): Longint; stdcall;
{$ENDIF}
var
  Buffer, Preamble: TBytes;
  StreamInfo: TRichEditStreamInfo;
  StartIndex: Integer;
{$IFDEF CLR}
  Handle: GCHandle;
{$ENDIF}
begin
  Result := NoError;
{$IFDEF CLR}
  Handle := GCHandle(IntPtr(dwCookie));
  StreamInfo := TRichEditStreamInfo(Handle.Target);
{$ELSE}
  StreamInfo := PRichEditStreamInfo(dwCookie)^;
{$ENDIF}
  SetLength(Buffer, cb + 1);
  cb := cb div 2;
  if (cb mod 2) > 0 then
    cb := cb -1 ;
  StartIndex := 0;
  pcb := 0;
  try
    if StreamInfo.Converter <> nil then
      pcb := StreamInfo.Converter.ConvertReadStream(StreamInfo.Stream, Buffer, cb);
    if pcb > 0 then
    begin
      Buffer[pcb] := 0;
      if Buffer[pcb - 1] = 13 then
      begin
        Buffer[pcb - 1] := 0;
        Dec(pcb);
      end;

      // Convert from desired Encoding to Unicode
      if StreamInfo.PlainText then
      begin
        if StreamInfo.Encoding = nil then
        begin
          Buffer := TEncoding.Convert(TEncoding.Default, TEncoding.Unicode, Buffer, 0, pcb);
          pcb := Length(Buffer);
        end
        else
        begin
          if not TEncoding.Unicode.Equals(StreamInfo.Encoding) then
          begin
            Buffer := TEncoding.Convert(StreamInfo.Encoding, TEncoding.Unicode, Buffer, 0, pcb);
            pcb := Length(Buffer);
          end;
          // If Unicode preamble is present, set StartIndex to skip over it
          Preamble := TEncoding.Unicode.GetPreamble;
          if (pcb >= 2) and (Buffer[0] = Preamble[0]) and (Buffer[1] = Preamble[1]) then
            StartIndex := 2;
        end;
      end;
      pcb := AdjustLineBreaks(pbBuff, Buffer, StartIndex, pcb);
    end;
  except
    Result := ReadError;
  end;
end;

function ContainsPreamble(Stream: TStream; Signature: TBytes): Boolean;
var
  Buffer: TBytes;
  I, LBufLen, LSignatureLen, LPosition: Integer;
begin
  Result := True;
  LSignatureLen := Length(Signature);
  LPosition := Stream.Position;
  try
    SetLength(Buffer, LSignatureLen);
{$IFDEF CLR}
    LBufLen := Stream.Read(Buffer, LSignatureLen);
{$ELSE}
    LBufLen := Stream.Read(Buffer[0], LSignatureLen);
{$ENDIF}
  finally
    Stream.Position := LPosition;
  end;

  if LBufLen = LSignatureLen then
  begin
    for I := 1 to LSignatureLen do
      if Buffer[I - 1] <> Signature [I - 1] then
      begin
        Result := False;
        Break;
      end;
  end
  else
    Result := False;
end;

procedure TRichEditStrings.LoadFromStream(Stream: TStream; AEncoding: TEncoding);
var
  EditStream: TEditStream;
  Position: Longint;
  TextType: Longint;
  StreamInfo: TRichEditStreamInfo;
  Converter: TConversion;
{$IFDEF CLR}
  Handle: GCHandle;
{$ENDIF}
begin
  RichEdit.DoSetMaxLength($7FFFFFF0);
  if AEncoding = nil then
  begin
    // Find the appropraite encoding
    if ContainsPreamble(Stream, TEncoding.Unicode.GetPreamble) then
      AEncoding := TEncoding.Unicode
    else
      if ContainsPreamble(Stream, TEncoding.BigEndianUnicode.GetPreamble) then
        AEncoding := TEncoding.BigEndianUnicode
      else
        if ContainsPreamble(Stream, TEncoding.UTF8.GetPreamble) then
          AEncoding := TEncoding.UTF8
        else
          AEncoding := TEncoding.Default;
  end;

  StreamInfo.Stream := Stream;
  if FConverter <> nil then
    Converter := FConverter
  else
    Converter := RichEdit.DefaultConverter.Create;
  StreamInfo.Converter := Converter;
  StreamInfo.PlainText := PlainText;
  StreamInfo.Encoding := AEncoding;
  try
{$IFDEF CLR}
    Handle := GCHandle.Alloc(TObject(StreamInfo));
{$ENDIF}
    try
      with EditStream do
      begin
{$IFDEF CLR}
        dwCookie := DWORD_PTR(IntPtr(Handle));
{$ELSE}
        dwCookie := DWORD_PTR(@StreamInfo);
{$ENDIF}
        pfnCallBack := StreamLoad;
        dwError := 0;
      end;
      Position := Stream.Position;
      if PlainText then
        TextType := SF_TEXT or SF_UNICODE
      else
        TextType := SF_RTF;
      SendGetStructMessage(RichEdit.Handle, EM_STREAMIN, TextType, EditStream, True);
    finally
{$IFDEF CLR}
      Handle.Free;
{$ENDIF}
    end;

    if (TextType = SF_RTF) and (EditStream.dwError <> 0) then
    begin
      Stream.Position := Position;
      if PlainText then
        TextType := SF_RTF
      else
        TextType := SF_TEXT or SF_UNICODE;
      StreamInfo.PlainText := not PlainText;
{$IFDEF CLR}
      Handle := GCHandle.Alloc(TObject(StreamInfo));
      try
        EditStream.dwCookie := DWORD_PTR(IntPtr(Handle));
        SendGetStructMessage(RichEdit.Handle, EM_STREAMIN, TextType, EditStream, True);
      finally
        Handle.Free;
      end;
{$ELSE}
      SendMessage(RichEdit.Handle, EM_STREAMIN, TextType, LPARAM(@EditStream));
{$ENDIF}
      if EditStream.dwError <> 0 then
        raise EOutOfResources.Create(sRichEditLoadFail);
    end;
    SetEncoding(AEncoding); // Keep Encoding in case the stream is saved
  finally
    if FConverter = nil then
      Converter.Free;
  end;
end;

procedure TRichEditStrings.SaveToStream(Stream: TStream; AEncoding: TEncoding);
var
  EditStream: TEditStream;
  TextType: Longint;
  StreamInfo: TRichEditStreamInfo;
  Converter: TConversion;
  Preamble: TBytes;
{$IFDEF CLR}
  Handle: GCHandle;
{$ENDIF}
begin
  if FConverter <> nil then
    Converter := FConverter
  else
    Converter := RichEdit.DefaultConverter.Create;
  StreamInfo.Stream := Stream;
  StreamInfo.Converter := Converter;
  StreamInfo.PlainText := PlainText;
  StreamInfo.Encoding := AEncoding;
  try
{$IFDEF CLR}
    Handle := GCHandle.Alloc(TObject(StreamInfo));
{$ENDIF}
    try
      with EditStream do
      begin
{$IFDEF CLR}
        dwCookie := DWORD_PTR(IntPtr(Handle));
{$ELSE}
        dwCookie := DWORD_PTR(@StreamInfo);
{$ENDIF}
        pfnCallBack := StreamSave;
        dwError := 0;
      end;
      if PlainText then
      begin
        TextType := SF_TEXT or SF_UNICODE;
        if AEncoding <> nil then
        begin
          Preamble := AEncoding.GetPreamble;
          if Length(Preamble) > 0 then
{$IFDEF CLR}
            Stream.WriteBuffer(Preamble, Length(Preamble));
{$ELSE}
            Stream.WriteBuffer(Preamble[0], Length(Preamble));
{$ENDIF}
        end;
      end
      else
        TextType := SF_RTF;
      SendGetStructMessage(RichEdit.Handle, EM_STREAMOUT, TextType, EditStream, True);
      if EditStream.dwError <> 0 then
        raise EOutOfResources.Create(sRichEditSaveFail);
    finally
{$IFDEF CLR}
      Handle.Free;
{$ENDIF}
    end;
  finally
    if FConverter = nil then Converter.Free;
  end;
end;

procedure TRichEditStrings.LoadFromFile(const FileName: string; AEncoding: TEncoding);
var
  I: Integer;
  Ext: string;
  Convert, LConvert: TConversionFormat;
begin
  RichEdit.DoSetMaxLength($7FFFFFF0);
  Ext := WideLowerCase(ExtractFileExt(Filename));
{$IFDEF CLR}
  Borland.Delphi.System.Delete(Ext, 1, 1);
{$ELSE}
  System.Delete(Ext, 1, 1);
{$ENDIF}

  Convert := TextConversionFormat;
  for I := 0 to ConversionFormatList.Count - 1 do
  begin
{$IFDEF CLR}
    LConvert := TConversionFormat(ConversionFormatList[I]);
{$ELSE}
    LConvert := PConversionFormat(ConversionFormatList[I])^;
{$ENDIF}
    if LConvert.Extension = Ext then
    begin
      Convert := LConvert;
      Break;
    end;
  end;

  if FConverter = nil then
    FConverter := Convert.ConversionClass.Create;
  try
    inherited LoadFromFile(FileName, AEncoding);
  except
    FConverter.Free;
    FConverter := nil;
    raise;
  end;
end;

procedure TRichEditStrings.SaveToFile(const FileName: string; AEncoding: TEncoding);
var
  I: Integer;
  Ext: string;
  Convert, LConvert: TConversionFormat;
begin
  Ext := WideLowerCase(ExtractFileExt(Filename));
{$IFDEF CLR}
  Borland.Delphi.System.Delete(Ext, 1, 1);
{$ELSE}
  System.Delete(Ext, 1, 1);
{$ENDIF}

  Convert := TextConversionFormat;
  for I := 0 to ConversionFormatList.Count - 1 do
  begin
{$IFDEF CLR}
    LConvert := TConversionFormat(ConversionFormatList[I]);
{$ELSE}
    LConvert := PConversionFormat(ConversionFormatList[I])^;
{$ENDIF}
    if LConvert.Extension = Ext then
    begin
      Convert := LConvert;
      Break;
    end;
  end;

  if FConverter = nil then
    FConverter := Convert.ConversionClass.Create;
  try
    inherited SaveToFile(FileName, AEncoding);
  except
    FConverter.Free;
    FConverter := nil;
    raise;
  end;
end;

{ TRichEdit }

class constructor TCustomRichEdit.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomRichEdit, TRichEditStyleHook);
end;

constructor TCustomRichEdit.Create(AOwner: TComponent);
var
  DC: HDC;
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csNeedsBorderPaint];
  FSelAttributes := TTextAttributes.Create(Self, atSelected);
  FDefAttributes := TTextAttributes.Create(Self, atDefaultText);
  FParagraph := TParaAttributes.Create(Self);
  FRichEditStrings := TRichEditStrings.Create;
  TRichEditStrings(FRichEditStrings).RichEdit := Self;
  TabStop := True;
  Width := 185;
  Height := 89;
  AutoSize := False;
  DoubleBuffered := False;
  ParentDoubleBuffered := False;
  FHideSelection := True;
  HideScrollBars := True;
  DC := GetDC(0);
  FScreenLogPixels := GetDeviceCaps(DC, LOGPIXELSY);
  DefaultConverter := TConversion;
  ReleaseDC(0, DC);
  FOldParaAlignment := Alignment;
  FZoom := 100;
  Perform(CM_PARENTBIDIMODECHANGED, 0, 0);
end;

class destructor TCustomRichEdit.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomRichEdit, TRichEditStyleHook);
end;

destructor TCustomRichEdit.Destroy;
begin
  FSelAttributes.Free;
  FDefAttributes.Free;
  FParagraph.Free;
  FRichEditStrings.Free;
  FMemStream.Free;
  inherited Destroy;
end;

procedure TCustomRichEdit.Clear;
begin
  inherited Clear;
  Modified := False;
end;

function TCustomRichEdit.GetActiveLineNo;
begin
  Result := SendMessage(Handle, EM_LINEFROMCHAR, WPARAM(-1), 0);
end;

procedure TCustomRichEdit.CreateParams(var Params: TCreateParams);
const
  HideScrollBars: array[Boolean] of DWORD = (ES_DISABLENOSCROLL, 0);
  HideSelections: array[Boolean] of DWORD = (ES_NOHIDESEL, 0);
{$IFNDEF CLR}
{$IF NOT DEFINED(UNICODE)}
  RichEditClassName = 'RICHEDIT20A';
{$ELSE}
  RichEditClassName = 'RICHEDIT20W';
{$ENDIF}
{$ELSE}
var
  RichEditClassName: string;
{$ENDIF}
begin
{$IFDEF CLR}
  if not Assigned(HandleWrapper) then
    HandleWrapper := THandleWrapper.Create;
  HandleWrapper.InitializeRichEd20;
  if Marshal.SystemDefaultCharSize = 1 then
    RichEditClassName := 'RICHEDIT20A'
  else
    RichEditClassName := 'RICHEDIT20W';
{$ELSE}
  if FRichEditModule = 0 then
  begin
    FRichEditModule := LoadLibrary(RichEditModuleName);
    if FRichEditModule <= HINSTANCE_ERROR then FRichEditModule := 0;
  end;
{$ENDIF}
  inherited CreateParams(Params);

  CreateSubClass(Params, RichEditClassName);
  with Params do
  begin
    Style := Style or HideScrollBars[FHideScrollBars] or
      HideSelections[HideSelection];
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomRichEdit.CreateWnd;
var
  DesignMode: Byte;
  Plain, WasModified: Boolean;
begin
  WasModified := inherited Modified;
  inherited CreateWnd;
  Font.Charset := GetDefFontCharSet;
  SendMessage(Handle, EM_SETEVENTMASK, 0,
    ENM_CHANGE or ENM_SELCHANGE or ENM_REQUESTRESIZE or
    ENM_PROTECTED);
  SendMessage(Handle, EM_SETBKGNDCOLOR, 0, ColorToRGB(Color));
  if FMemStream <> nil then
  begin
    Plain := PlainText;
    FMemStream.ReadBuffer(DesignMode, SizeOf(DesignMode));
    PlainText := Boolean(DesignMode) or Plain;
    try
      Lines.LoadFromStream(FMemStream, TEncoding.Unicode);
      FMemStream.Free;
      FMemStream := nil;
    finally
      PlainText := Plain;
    end;
    SelStart := FOldSelStart;
    SelLength := FOldSelLength;
    Zoom := FOldZoom;
  end;
  Modified := WasModified;
end;

procedure TCustomRichEdit.DestroyWnd;
var
  Plain, DesignMode: Boolean;
begin
  if (csRecreating in ControlState) and not (csLoading in ComponentState) then
  begin
    FModified := Modified;
    FMemStream := TMemoryStream.Create;
    Plain := PlainText;
    DesignMode := (csDesigning in ComponentState);
    PlainText := DesignMode or Plain;
    FOldSelLength := SelLength;
    FOldSelStart := SelStart;
    FOldZoom := Zoom;
    FMemStream.WriteBuffer(DesignMode, SizeOf(DesignMode));
    try
      Lines.SaveToStream(FMemStream, TEncoding.Unicode);
      FMemStream.Position := 0;
    finally
      PlainText := Plain;
    end;
  end;
  inherited DestroyWnd;
end;

procedure TCustomRichEdit.WMNCDestroy(var Message: TWMNCDestroy);
begin
  inherited;
end;

procedure TCustomRichEdit.WMSetFont(var Message: TWMSetFont);
begin
  FDefAttributes.Assign(Font);
end;

procedure TCustomRichEdit.WMRButtonUp(var Message: TWMRButtonUp);
begin
  // RichEd20 does not pass the WM_RBUTTONUP message to defwndproc,
  // so we get no WM_CONTEXTMENU message.  Simulate message here.
  if Win32MajorVersion < 5 then
    Perform(WM_CONTEXTMENU, Handle,
      PointToLParam(ClientToScreen(SmallPointToPoint(Message.Pos))));
  inherited;
end;

procedure TCustomRichEdit.CMFontChanged(var Message: TMessage);
begin
  FDefAttributes.Assign(Font);
end;

procedure TCustomRichEdit.DoSetMaxLength(Value: Integer);
begin
  SendMessage(Handle, EM_EXLIMITTEXT, 0, Value);
end;

function TCustomRichEdit.GetCaretPos;
var
  CharRange: TCharRange;
begin
  SendGetStructMessage(Handle, EM_EXGETSEL, 0, CharRange);
  Result.X := CharRange.cpMax;
  Result.Y := SendMessage(Handle, EM_EXLINEFROMCHAR, 0, Result.X);
  Result.X := Result.X - SendMessage(Handle, EM_LINEINDEX, WPARAM(-1), 0);
end;

procedure TCustomRichEdit.SetCaretPos(const Value: TPoint);
var
  CharRange: TCharRange;
begin
  CharRange.cpMin := SendMessage(Handle, EM_LINEINDEX, Value.y, 0) + Value.x;
  CharRange.cpMax := CharRange.cpMin;
  SendStructMessage(Handle, EM_EXSETSEL, 0, CharRange);
end;

function TCustomRichEdit.GetSelLength: Integer;
var
  CharRange: TCharRange;
begin
  SendGetStructMessage(Handle, EM_EXGETSEL, 0, CharRange);
  Result := CharRange.cpMax - CharRange.cpMin;
end;

function TCustomRichEdit.GetSelStart: Integer;
var
  CharRange: TCharRange;
begin
  SendGetStructMessage(Handle, EM_EXGETSEL, 0, CharRange);
  Result := CharRange.cpMin;
end;

{$IFDEF CLR}
function TCustomRichEdit.GetSelTextBuf(var Buffer: string; BufSize: Integer): Integer;
{$ELSE}
function TCustomRichEdit.GetSelTextBuf(Buffer: PChar; BufSize: Integer): Integer;
{$ENDIF}
var
  S: string;
begin
  S := GetSelText;
  Result := Length(S);
  if BufSize <= Length(S) then Result := BufSize - 1;
{$IFDEF CLR}
  Buffer := Copy(S, 1, Result);
{$ELSE}
  StrPLCopy(Buffer, S, Result);
{$ENDIF}
end;

function TCustomRichEdit.GetSelText: string;
var
  LGetTextEx: TGetTextEx;
begin
  SetLength(Result, GetSelLength + 1);
  LGetTextEx.cb := Length(Result) * SizeOf(Char); // Size is in bytes, not chars
  LGetTextEx.Flags := GT_SELECTION;               // Get selected text
  LGetTextEx.codepage := 1200;                    // Return text in Unicode format
  LGetTextEx.lpDefaultChar := nil;
  LGetTextEx.lpUsedDefChar := nil;
  SendEMGetTextExMessage(Handle, EM_GETTEXTEX, LGetTextEx, Result);
end;

procedure TCustomRichEdit.CMBiDiModeChanged(var Message: TMessage);
var
  AParagraph: TParaFormat2;
begin
  HandleNeeded; { we REALLY need the handle for BiDi }
  inherited;
  Paragraph.GetAttributes(AParagraph);
  AParagraph.dwMask := PFM_ALIGNMENT;
  AParagraph.wAlignment := Ord(Alignment) + 1;
  Paragraph.SetAttributes(AParagraph);
end;

procedure TCustomRichEdit.SetHideScrollBars(Value: Boolean);
begin
  if HideScrollBars <> Value then
  begin
    FHideScrollBars := value;
    RecreateWnd;
  end;
end;

procedure TCustomRichEdit.SetHideSelection(Value: Boolean);
begin
  if HideSelection <> Value then
  begin
    FHideSelection := Value;
    SendMessage(Handle, EM_HIDESELECTION, Ord(HideSelection), LPARAM(True));
  end;
end;

procedure TCustomRichEdit.SetSelAttributes(Value: TTextAttributes);
begin
  SelAttributes.Assign(Value);
end;

procedure TCustomRichEdit.SetSelLength(Value: Integer);
var
  CharRange: TCharRange;
begin
  SendGetStructMessage(Handle, EM_EXGETSEL, 0, CharRange);
  CharRange.cpMax := CharRange.cpMin + Value;
  SendStructMessage(Handle, EM_EXSETSEL, 0, CharRange);
  SendMessage(Handle, EM_SCROLLCARET, 0, 0);
end;

procedure TCustomRichEdit.SetDefAttributes(Value: TTextAttributes);
begin
  DefAttributes.Assign(Value);
end;

procedure TCustomRichEdit.SetZoom(const Value: Integer);
var
  Multiplier: Integer;
begin
  if (Value <> FZoom) or (csRecreating in ControlState) then
  begin
    if Value > 100 then
      Multiplier := Round(0.64 * Value)
    else
      Multiplier := Round(1 + 0.63 * Value);
    if (Multiplier > 1) and (Multiplier < 4096) then
    begin
      FZoom := Value;
      SendMessage(Handle, EM_SETZOOM, Multiplier, 64);
    end;
 end;
end;

function TCustomRichEdit.GetPlainText: Boolean;
begin
  Result := TRichEditStrings(Lines).PlainText;
end;

procedure TCustomRichEdit.SetPlainText(Value: Boolean);
begin
  TRichEditStrings(Lines).PlainText := Value;
end;

procedure TCustomRichEdit.CMColorChanged(var Message: TMessage);
begin
  inherited;
  SendMessage(Handle, EM_SETBKGNDCOLOR, 0, ColorToRGB(Color))
end;

procedure TCustomRichEdit.SetRichEditStrings(Value: TStrings);
begin
  FRichEditStrings.Assign(Value);
end;

procedure TCustomRichEdit.SetSelStart(Value: Integer);
var
  CharRange: TCharRange;
begin
  CharRange.cpMin := Value;
  CharRange.cpMax := Value;
  SendStructMessage(Handle, EM_EXSETSEL, 0, CharRange); 
end;

function TCustomRichEdit.DefaultScalingFlags: TScalingFlags;
begin
  Result := [sfLeft, sfTop, sfWidth, sfHeight];
end;

procedure TCustomRichEdit.Print(const Caption: string);
var
  Range: TFormatRange;
  LastChar, MaxLen, LogX, LogY, OldMap: Integer;
  SaveRect: TRect;
  TextLen: TGetTextLengthEx;
{$IFDEF CLR}
  Buffer: IntPtr;
{$ENDIF}
begin
{$IFNDEF CLR}
  FillChar(Range, SizeOf(TFormatRange), 0);
{$ENDIF}
  with Printer, Range do
  begin
    Title := Caption;
    BeginDoc;
    hdc := Handle;
    hdcTarget := hdc;
    LogX := GetDeviceCaps(Handle, LOGPIXELSX);
    LogY := GetDeviceCaps(Handle, LOGPIXELSY);
    if IsRectEmpty(PageRect) then
    begin
      rc.right := PageWidth * 1440 div LogX;
      rc.bottom := PageHeight * 1440 div LogY;
    end
    else begin
      rc.left := PageRect.Left * 1440 div LogX;
      rc.top := PageRect.Top * 1440 div LogY;
      rc.right := PageRect.Right * 1440 div LogX;
      rc.bottom := PageRect.Bottom * 1440 div LogY;
    end;
    rcPage := rc;
    SaveRect := rc;
    LastChar := 0;

    // retrieve number of characters in rich edit control
    TextLen.Flags := GTL_NUMCHARS;
{$IFDEF CLR}
    if Marshal.SystemDefaultCharSize = 1 then
      TextLen.CodePage := CP_ACP // Active ANSI code page
    else
      TextLen.CodePage := 1200;  // Unicode
    Buffer := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TGetTextLengthEx)));
    try
      Marshal.StructureToPtr(TObject(TextLen), Buffer, False);
      MaxLen := SendMessage(Self.Handle, EM_GETTEXTLENGTHEX, LPARAM(Buffer), 0);
    finally
      Marshal.FreeHGlobal(Buffer);
    end;
{$ELSE}
    TextLen.CodePage := 1200;  // Unicode
    MaxLen := SendMessage(Self.Handle, EM_GETTEXTLENGTHEX, LPARAM(@TextLen), 0);
{$ENDIF}

    chrg.cpMax := -1;
    // ensure printer DC is in text map mode
    OldMap := SetMapMode(hdc, MM_TEXT);
    SendMessage(Self.Handle, EM_FORMATRANGE, 0, 0);    // flush buffer
    try
      repeat
        rc := SaveRect;
        chrg.cpMin := LastChar;
        LastChar := SendStructMessage(Self.Handle, EM_FORMATRANGE, 1, Range);
        if (LastChar < MaxLen) and (LastChar <> -1) then
          NewPage;
      until (LastChar >= MaxLen) or (LastChar = -1);
      EndDoc;
    finally
      SendMessage(Self.Handle, EM_FORMATRANGE, 0, 0);  // flush buffer
      SetMapMode(hdc, OldMap);       // restore previous map mode
    end;
  end;
end;

var
  Painting: Boolean = False;

procedure TCustomRichEdit.WMPaint(var Message: TWMPaint);
var
  R, R1: TRect;
begin
  if GetUpdateRect(Handle, R, True) then
  begin
    with ClientRect do R1 := Rect(Right - 3, Top, Right, Bottom);
    if IntersectRect(R, R, R1) then InvalidateRect(Handle, R1, True);
  end;
  if Painting then
    Invalidate
  else begin
    Painting := True;
    try
      inherited;
    finally
      Painting := False;
    end;
  end;
end;

procedure TCustomRichEdit.WMSetCursor(var Message: TWMSetCursor);
var
  P: TPoint;
begin
  inherited;
  if Message.Result = 0 then
  begin
    Message.Result := 1;
    GetCursorPos(P);
    with PointToSmallPoint(P) do
      case Int64(Perform(WM_NCHITTEST, 0, MakeLong(X, Y))) of
        HTVSCROLL,
        HTHSCROLL:
          Winapi.Windows.SetCursor(Screen.Cursors[crArrow]);
        HTCLIENT:
          Winapi.Windows.SetCursor(Screen.Cursors[crIBeam]);
      end;
  end;
end;

procedure TCustomRichEdit.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TCustomRichEdit.CNNotify(var Message: TWMNotifyRE);
begin
  with Message do
    case NMHdr.code of
      EN_SELCHANGE: SelectionChange;
      EN_REQUESTRESIZE: 
        RequestSize(ReqSize.rc);
      EN_SAVECLIPBOARD:
        with ENSaveClipboard{$IFNDEF CLR}^{$ENDIF} do
          if not SaveClipboard(cObjectCount, cch) then
            Result := 1;
      EN_PROTECTED:
        with ENProtected.chrg do
          if not ProtectChange(cpMin, cpMax) then
            Result := 1;
    end;
end;

function TCustomRichEdit.SaveClipboard(NumObj, NumChars: Integer): Boolean;
begin
  Result := True;
  if Assigned(OnSaveClipboard) then OnSaveClipboard(Self, NumObj, NumChars, Result);
end;

function TCustomRichEdit.ProtectChange(StartPos, EndPos: Integer): Boolean;
begin
  Result := False;
  if Assigned(OnProtectChange) then OnProtectChange(Self, StartPos, EndPos, Result);
end;

procedure TCustomRichEdit.SelectionChange;
begin
  if Assigned(OnSelectionChange) then OnSelectionChange(Self);
end;

procedure TCustomRichEdit.RequestSize(const Rect: TRect);
begin
  if Assigned(OnResizeRequest) then OnResizeRequest(Self, Rect);
end;

function TCustomRichEdit.FindText(const SearchStr: string;
  StartPos, Length: Integer; Options: TSearchTypes): Integer;
var
  Find: TFindText;
  Flags: Integer;
begin
  with Find.chrg do
  begin
    cpMin := StartPos;
    cpMax := cpMin + Length;
  end;
  Flags := FR_DOWN;
  if stWholeWord in Options then
    Flags := Flags or FR_WHOLEWORD;
  if stMatchCase in Options then
    Flags := Flags or FR_MATCHCASE;
{$IFDEF CLR}
  Find.lpstrText := SearchStr;
{$ELSE}
  Find.lpstrText := PChar(SearchStr.Replace(#$D#$A,#$D,[rfReplaceAll]));
{$ENDIF}
  Result := SendStructMessage(Handle, EM_FINDTEXT, Flags, Find);
end;

procedure AppendConversionFormat(const Ext: string; AClass: TConversionClass);
var
{$IFDEF CLR}
  NewRec: TConversionFormat;
{$ELSE}
  NewRec: PConversionFormat;
{$ENDIF}
begin
{$IFNDEF CLR}
  New(NewRec);
{$ENDIF}
  with NewRec{$IFNDEF CLR}^{$ENDIF} do
  begin
    Extension := AnsiLowerCaseFileName(Ext);
    ConversionClass := AClass;
  end;
{$IFDEF CLR}
  ConversionFormatList.Add(TObject(NewRec));
{$ELSE}
  ConversionFormatList.Add(Pointer(NewRec));
{$ENDIF}
end;

class procedure TCustomRichEdit.RegisterConversionFormat(const AExtension: string;
  AConversionClass: TConversionClass);
begin
  AppendConversionFormat(AExtension, AConversionClass);
end;

{ TRichEdit }

class constructor TRichEdit.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TRichEdit, TRichEditStyleHook);
end;

class destructor TRichEdit.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TRichEdit, TRichEditStyleHook);
end;

{ TUpDown }

class constructor TCustomUpDown.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomUpDown, TUpDownStyleHook);
end;

constructor TCustomUpDown.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := GetSystemMetrics(SM_CXVSCROLL);
  Height := GetSystemMetrics(SM_CYVSCROLL);
  Height := Height + (Height div 2);
  FArrowKeys := True;
  FWrap := false;
  FPosition := 0;
  FMin := 0;
  FMax := 100;
  FIncrement := 1;
  FAlignButton := udRight;
  FOrientation := udVertical;
  FThousands := True;
  ControlStyle := ControlStyle - [csDoubleClicks, csGestures];
end;

class destructor TCustomUpDown.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomUpDown, TUpDownStyleHook);
end;

procedure TCustomUpDown.CreateParams(var Params: TCreateParams);
begin
  InitCommonControl(ICC_UPDOWN_CLASS);
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or UDS_SETBUDDYINT;
    if FAlignButton = udRight then Style := Style or UDS_ALIGNRIGHT
    else Style := Style or UDS_ALIGNLEFT;
    if FOrientation = udHorizontal then Style := Style or UDS_HORZ;
    if FArrowKeys then Style := Style or UDS_ARROWKEYS;
    if not FThousands then Style := Style or UDS_NOTHOUSANDS;
    if FWrap then Style := Style or UDS_WRAP;
  end;
  CreateSubClass(Params, UPDOWN_CLASS);
  with Params.WindowClass do
    style := style and not (CS_HREDRAW or CS_VREDRAW) or CS_DBLCLKS;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomUpDown.CreateWnd;
var
  OrigWidth: Integer;
  AccelArray: array [0..0] of TUDAccel;
begin
  OrigWidth := Width;  { control resizes width - disallowing user to set width }
  inherited CreateWnd;
  if FAssociate <> nil then
  begin
    UndoAutoResizing(FAssociate);
    SendMessage(Handle, UDM_SETBUDDY, FAssociate.Handle, 0);
  end;
  Width := OrigWidth;
  SendMessage(Handle, UDM_SETRANGE32, FMin, FMax);
  SendMessage(Handle, UDM_SETPOS32, 0, FPosition);
  SendGetStructMessage(Handle, UDM_GETACCEL, 1, AccelArray[0]);
  AccelArray[0].nInc := FIncrement;
  SendStructMessage(Handle, UDM_SETACCEL, 1, AccelArray[0]);
end;

procedure TCustomUpDown.WMVScroll(var Message: TWMVScroll);
begin
  inherited;
  if Message.ScrollCode = SB_THUMBPOSITION then
  begin
    if Message.Pos > FPosition then
      Click(btNext)
    else
      if Message.Pos < FPosition then
        Click(btPrev);

    FPosition := Message.Pos;
  end;
end;

procedure TCustomUpDown.WMSize(var Message: TWMSize);
var
  R: TRect;
begin
  inherited;
  R := ClientRect;
  InvalidateRect(Handle, R, False);
end;

procedure TCustomUpDown.WMHScroll(var Message: TWMHScroll);
begin
  inherited;
  if Message.ScrollCode = SB_THUMBPOSITION then
  begin
    if Message.Pos > FPosition then
      Click(btNext)
    else
      if Message.Pos < FPosition then
        Click(btPrev);
    FPosition := Message.Pos;
  end;
end;

function TCustomUpDown.DoCanChange(NewVal: Integer; Delta: Integer): Boolean;
begin
  FNewValue := NewVal;
  FNewValueDelta := Delta;

  Result := CanChange;
end;

function TCustomUpDown.CanChange: Boolean;
var
  Direction: TUpDownDirection;
begin
  Result := True;
  Direction := updNone;

  if (FNewValue < Min) and (FNewValueDelta < 0) or
  (FNewValue > Max) and (FNewValueDelta > 0) then
    Direction := updNone
  else if FNewValueDelta < 0 then
    Direction := updDown
  else if FNewValueDelta > 0 then
    Direction := updUp;

  if Assigned(FOnChanging) then
    FOnChanging(Self, Result);
  if Assigned(FOnChangingEx) then
    FOnChangingEx(Self, Result, FNewValue, Direction);
end;

procedure TCustomUpDown.CMAllChildrenFlipped(var Message: TMessage);
begin
  if FAlignButton = udRight then
    SetAlignButton(udLeft)
  else
    SetAlignButton(udRight);
end;

procedure TCustomUpDown.CNNotify(var Message: TWMNotifyUD);
begin
  with Message.NMUpDown{$IFNDEF CLR}^{$ENDIF} do
    if Hdr.code = UDN_DELTAPOS then
    begin
      Message.Result := Winapi.Windows.LRESULT(not DoCanChange(iPos + iDelta, iDelta));
    end;
end;

procedure TCustomUpDown.Click(Button: TUDBtnType);
begin
  if Assigned(FOnClick) then FOnClick(Self, Button);
end;

procedure TCustomUpDown.SetAssociate(Value: TWinControl);
var
  I: Integer;

  function IsClass(ClassType: TClass; const Name: string): Boolean;
  begin
    Result := True;
    while ClassType <> nil do
    begin
      if ClassType.ClassNameIs(Name) then Exit;
      ClassType := ClassType.ClassParent;
    end;
    Result := False;
  end;

begin
  if Value <> nil then
    for I := 0 to Parent.ControlCount - 1 do // is control already associated
      if (Parent.Controls[I] is TCustomUpDown) and (Parent.Controls[I] <> Self) then
        if TCustomUpDown(Parent.Controls[I]).Associate = Value then
          raise Exception.CreateResFmt({$IFNDEF CLR}@{$ENDIF}SUDAssociated,
            [Value.Name, Parent.Controls[I].Name]);

  if FAssociate <> nil then { undo the current associate control }
  begin
    if HandleAllocated then
      SendMessage(Handle, UDM_SETBUDDY, 0, 0);
    FAssociate := nil;
  end;

  if (Value <> nil) and (Value.Parent = Self.Parent) and
    not (Value is TCustomUpDown) and
    not (Value is TCustomTreeView) and not (Value is TCustomListView) and
    not IsClass(Value.ClassType, 'TDBEdit') and
    not IsClass(Value.ClassType, 'TDBMemo') then
  begin
    if HandleAllocated then
    begin
      UndoAutoResizing(Value);
      SendMessage(Handle, UDM_SETBUDDY, Value.Handle, 0);
    end;
    FAssociate := Value;
    if Value is TCustomEdit then
      TCustomEdit(Value).Text := IntToStr(FPosition);
  end;
end;

procedure TCustomUpDown.UndoAutoResizing(Value: TWinControl);
var
  OrigWidth, NewWidth, DeltaWidth: Integer;
  OrigLeft, NewLeft, DeltaLeft: Integer;
begin
  { undo Window's auto-resizing }
  OrigWidth := Value.Width;
  OrigLeft := Value.Left;
  SendMessage(Handle, UDM_SETBUDDY, Value.Handle, 0);
  NewWidth := Value.Width;
  NewLeft := Value.Left;
  DeltaWidth := OrigWidth - NewWidth;
  DeltaLeft := NewLeft - OrigLeft;
  Value.Width := OrigWidth + DeltaWidth;
  Value.Left := OrigLeft - DeltaLeft;
end;

procedure TCustomUpDown.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FAssociate) then
    if HandleAllocated then
    begin
      SendMessage(Handle, UDM_SETBUDDY, 0, 0);
      FAssociate := nil;
    end;
end;

function TCustomUpDown.GetPosition: Integer;
var
  LError: BOOL;
begin
  if HandleAllocated then
  begin
  {$IFDEF CLR}
      Result := SendGetStructMessage(Handle, UDM_GETPOS32, 0, LError);
  {$ELSE}
      Result := SendMessage(Handle, UDM_GETPOS32, 0, LParam(@LError));
  {$ENDIF}
    if not LError then
      FPosition := Result
    else
      Result := FPosition;
  end
  else
    Result := FPosition;
end;

procedure TCustomUpDown.SetMin(Value: Integer);
begin
  if Value <> FMin then
  begin
    FMin := Value;
    if HandleAllocated then
      SendMessage(Handle, UDM_SETRANGE32, FMin, FMax);
  end;
end;

procedure TCustomUpDown.SetMax(Value: Integer);
begin
  if Value <> FMax then
  begin
    FMax := Value;
    if HandleAllocated then
      SendMessage(Handle, UDM_SETRANGE32, FMin, FMax);
  end;
end;

procedure TCustomUpDown.SetIncrement(Value: Integer);
var
  AccelArray: array [0..0] of TUDAccel;
begin
  if Value <> FIncrement then
  begin
    FIncrement := Value;
    if HandleAllocated then
    begin
      SendGetStructMessage(Handle, UDM_GETACCEL, 1, AccelArray[0]);
      AccelArray[0].nInc := Value;
      SendStructMessage(Handle, UDM_SETACCEL, 1, AccelArray[0]);
    end;
  end;
end;

procedure TCustomUpDown.SetPosition(Value: Integer);
begin
  if Value <> Position then
  begin
    if not (csDesigning in ComponentState) then
      if not DoCanChange(Value, Value-FPosition) then Exit;
    FPosition := Value;
    if (csDesigning in ComponentState) and (FAssociate <> nil) then
      if FAssociate is TCustomEdit then
        TCustomEdit(FAssociate).Text := IntToStr(FPosition);
    if HandleAllocated then
      SendMessage(Handle, UDM_SETPOS32, 0, FPosition);
  end;
end;

procedure TCustomUpDown.SetOrientation(Value: TUDOrientation);
begin
  if Value <> FOrientation then
  begin
    FOrientation := Value;
    if ComponentState * [csLoading, csUpdating] = [] then
      SetBounds(Left, Top, Height, Width);
    if HandleAllocated then
      SendMessage(Handle, UDM_SETBUDDY, 0, 0);
    RecreateWnd;
  end;
end;

procedure TCustomUpDown.SetAlignButton(Value: TUDAlignButton);
begin
  if Value <> FAlignButton then
  begin
    FAlignButton := Value;
    if HandleAllocated then
      SendMessage(Handle, UDM_SETBUDDY, 0, 0);
    RecreateWnd;
  end;
end;

procedure TCustomUpDown.SetArrowKeys(Value: Boolean);
begin
  if Value <> FArrowKeys then
  begin
    FArrowKeys := Value;
    if HandleAllocated then
      SendMessage(Handle, UDM_SETBUDDY, 0, 0);
    RecreateWnd;
  end;
end;

procedure TCustomUpDown.SetThousands(Value: Boolean);
begin
  if Value <> FThousands then
  begin
    FThousands := Value;
    if HandleAllocated then
      SendMessage(Handle, UDM_SETBUDDY, 0, 0);
    RecreateWnd;
  end;
end;

procedure TCustomUpDown.SetWrap(Value: Boolean);
begin
  if Value <> FWrap then
  begin
    FWrap := Value;
    if HandleAllocated then
      SendMessage(Handle, UDM_SETBUDDY, 0, 0);
    RecreateWnd;
  end;
end;

{ TUpDown }

class constructor TUpDown.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TUpDown, TUpDownStyleHook);
end;

class destructor TUpDown.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TUpDown, TUpDownStyleHook);
end;

{ TCustomHotKey }

class constructor TCustomHotKey.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomHotKey, TEditStyleHook);
end;

constructor TCustomHotKey.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DoubleBuffered := False; // HotKey control does not support double buffering
  ParentDoubleBuffered := False;
  Width := 121;
  Height := 25;
  TabStop := True;
  ParentColor := False;
  FAutoSize := True;
  FInvalidKeys := [hcNone, hcShift];
  FModifiers := [hkAlt];
  FHotKey := $0041;     // default - 'Alt+A'
  AdjustHeight;
end;

class destructor TCustomHotKey.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomHotKey, TEditStyleHook);
end;

procedure TCustomHotKey.CreateParams(var Params: TCreateParams);
begin
  InitCommonControl(ICC_HOTKEY_CLASS);
  inherited CreateParams(Params);
  CreateSubClass(Params, HOTKEYCLASS);
  with Params.WindowClass do
    style := style and not (CS_HREDRAW or CS_VREDRAW);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomHotKey.CreateWnd;
begin
  inherited CreateWnd;
  SendMessage(Handle, HKM_SETRULES, Byte(FInvalidKeys), MakeLong(Byte(FModifiers), 0));
  SendMessage(Handle, HKM_SETHOTKEY, MakeWord(Byte(FHotKey), Byte(FModifiers)), 0);
end;

procedure TCustomHotKey.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  // Inore values of properties no longer published to prevents errors
  // when loading forms.
  Filer.DefineBinaryProperty('DoubleBuffered', ReadBoolean, nil, False);
  Filer.DefineBinaryProperty('ParentDoubleBuffered', ReadBoolean, nil, False);
end;

procedure TCustomHotKey.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    UpdateHeight;
  end;
end;

procedure TCustomHotKey.SetModifiers(Value: THKModifiers);
begin
  if Value <> FModifiers then
  begin
    FModifiers := Value;
    SendMessage(Handle, HKM_SETRULES, Byte(FInvalidKeys), MakeLong(Byte(Value), 0));
    SendMessage(Handle, HKM_SETHOTKEY, MakeWord(Byte(FHotKey), Byte(FModifiers)), 0);
  end;
end;

procedure TCustomHotKey.SetInvalidKeys(Value: THKInvalidKeys);
begin
  if Value <> FInvalidKeys then
  begin
    FInvalidKeys := Value;
    SendMessage(Handle, HKM_SETRULES, Byte(Value), MakeLong(Byte(FModifiers), 0));
    SendMessage(Handle, HKM_SETHOTKEY, MakeWord(Byte(FHotKey), Byte(FModifiers)), 0);
  end;
end;

function TCustomHotKey.GetHotKey: TShortCut;
var
  HK: Longint;
begin
  HK := SendMessage(Handle, HKM_GETHOTKEY, 0, 0);
  Result := HotKeyToShortCut(HK);
end;

procedure TCustomHotKey.SetHotKey(Value: TShortCut);
begin
  ShortCutToHotKey(Value);
  SendMessage(Handle, HKM_SETHOTKEY, MakeWord(Byte(FHotKey), Byte(FModifiers)), 0);
end;

procedure TCustomHotKey.UpdateHeight;
begin
  if AutoSize then
  begin
    ControlStyle := ControlStyle + [csFixedHeight];
    AdjustHeight;
  end else
    ControlStyle := ControlStyle - [csFixedHeight];
end;

procedure TCustomHotKey.AdjustHeight;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  if NewStyleControls then
  begin
    if Ctl3D then I := 8 else I := 6;
    I := GetSystemMetrics(SM_CYBORDER) * I;
  end else
  begin
    I := SysMetrics.tmHeight;
    if I > Metrics.tmHeight then I := Metrics.tmHeight;
    I := I div 4 + GetSystemMetrics(SM_CYBORDER) * 4;
  end;
  Height := Metrics.tmHeight + I;
end;

procedure TCustomHotKey.ShortCutToHotKey(Value: TShortCut);
begin
  FHotKey := Value and not (scShift + scCtrl + scAlt);
  FModifiers := [];
  if Value and scShift <> 0 then Include(FModifiers, hkShift);
  if Value and scCtrl <> 0 then Include(FModifiers, hkCtrl);
  if Value and scAlt <> 0 then Include(FModifiers, hkAlt);
end;

function TCustomHotKey.HotKeyToShortCut(Value: Longint): TShortCut;
begin
  FModifiers := THKModifiers(HiByte(Value));
  FHotKey := LoWord(LoByte(Value));
  Result := FHotKey;
  if hkShift in FModifiers then Inc(Result, scShift);
  if hkCtrl in FModifiers then Inc(Result, scCtrl);
  if hkAlt in FModifiers then Inc(Result, scAlt);
end;

procedure TCustomHotKey.ReadBoolean(Stream: TStream);
var
  LBoolean: Boolean;
begin
  Stream.Read(LBoolean, SizeOf(Boolean));
end;

procedure TCustomHotKey.CNCommand(var Message: TWMCommand);
begin
  inherited;
  if (Message.NotifyCode = EN_CHANGE) and Assigned(FOnChange) then
    FOnChange(Self);
end;

{ THotKey }

class constructor THotKey.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(THotKey, TEditStyleHook);
end;

class destructor THotKey.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(THotKey, TEditStyleHook);
end;

{ TListColumn }

constructor TListColumn.Create(Collection: TCollection);
var
  Column: TLVColumn;
begin
  FOrderTag := Collection.Count;
  inherited Create(Collection);
  FWidth := 50;
  FAlignment := taLeftJustify;
  FImageIndex := -1;
  with Column do
  begin
    mask := LVCF_FMT or LVCF_WIDTH;
    fmt := LVCFMT_LEFT;
    cx := FWidth;
    iImage := FImageIndex;
  end;
  if TListColumns(Collection).Owner.HandleAllocated then
    ListView_InsertColumn(TListColumns(Collection).Owner.Handle, Index, Column);
end;

destructor TListColumn.Destroy;
var
  Columns: TListColumns;
begin
  Columns := TListColumns(Collection);
  if TListColumns(Collection).Owner.HandleAllocated then
    ListView_DeleteColumn(TListColumns(Collection).Owner.Handle, Index);
  inherited Destroy;
  Columns.UpdateCols;
end;

procedure TListColumn.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('WidthType', ReadData, WriteData,
    WidthType <= ColumnTextWidth);
end;

procedure TListColumn.ReadData(Reader: TReader);
begin
  with Reader do
  begin
    ReadListBegin;
    Width := TWidth(ReadInteger);
    ReadListEnd;
  end;
end;

procedure TListColumn.WriteData(Writer: TWriter);
begin
  with Writer do
  begin
    WriteListBegin;
    WriteInteger(Ord(WidthType));
    WriteListEnd;
  end;
end;

procedure TListColumn.DoChange;

  procedure WriteCols;
  var
    Writer: TWriter;
    LV: TCustomListView;
  begin
    LV := TListColumns(Collection).Owner;
    if LV.HandleAllocated or ([csLoading, csReading] * LV.ComponentState <> []) or
      LV.FReading then Exit;
    if LV.FColStream = nil then LV.FColStream := TMemoryStream.Create
    else LV.FColStream.Size := 0;
    Writer := TWriter.Create(LV.FColStream, 1024);
    try
      Writer.WriteCollection(Collection);
    finally
      Writer.Free;
      LV.FColStream.Position := 0;
    end;
  end;

var
  I: Integer;
begin
  for I := 0 to Collection.Count - 1 do
    if TListColumn(Collection.Items[I]).WidthType <= ColumnTextWidth then Break;
  Changed(I <> Collection.Count);
  WriteCols;
end;

procedure TListColumn.SetIndex(Value: Integer);
var
  ColumnOrder: array of Integer;
  I: Integer;
begin
  inherited SetIndex(Value);
  SetLength(ColumnOrder, Collection.Count);
  for I := 0 to Collection.Count - 1 do
    ColumnOrder[I] := TListColumn(Collection.Items[I]).FOrderTag;
{$IFDEF CLR}
  ListView_SetColumnOrderArray(TListColumns(Collection).Owner.Handle,
    Collection.Count, ColumnOrder);
{$ELSE}
  ListView_SetColumnOrderArray(TListColumns(Collection).Owner.Handle,
    Collection.Count, PInteger(ColumnOrder));
{$ENDIF}
end;

procedure TListColumn.SetCaption(const Value: string);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    DoChange;
  end;
end;

function TListColumn.GetWidth: TWidth;
var
  IsStreaming: Boolean;
  LOwner: TCustomListView;
begin
  LOwner := TListColumns(Collection).Owner;
  IsStreaming := [csReading, csWriting, csLoading] * LOwner.ComponentState <> [];

  if ((FWidth = 0) and (LOwner.HandleAllocated or not IsStreaming)) or
     ((not AutoSize) and LOwner.HandleAllocated and (LOwner.ViewStyle = vsReport) and
     (FWidth <> LVSCW_AUTOSIZE) and (LOwner.ValidHeaderHandle)) then
    FWidth := ListView_GetColumnWidth(LOwner.Handle, FOrderTag);
  Result := FWidth;
end;

function TListColumn.IsWidthStored: Boolean;
begin
  Result := not FAutoSize;
end;

procedure TListColumn.SetWidth(Value: TWidth);
begin
  if FWidth <> Value then
  begin
    if ((Value < MinWidth) and (Value >= 0)) then Value := MinWidth
    else if ((MaxWidth > 0) and (Value > MaxWidth)) then Value := MaxWidth;
    FWidth := Value;
    DoChange;
  end;
end;

procedure TListColumn.SetAlignment(Value: TAlignment);
begin
  if (Alignment <> Value) and (Index <> 0) then
  begin
    FAlignment := Value;
    Changed(False);
    TListColumns(Collection).Owner.Repaint;
  end;
end;

procedure TListColumn.SetAutoSize(Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    if TListColumns(Collection).Owner <> nil then
      TListColumns(Collection).Owner.AdjustSize;
    DoChange;
  end;
end;

procedure TListColumn.SetImageIndex(Value: TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    DoChange;
  end;
end;

procedure TListColumn.SetMaxWidth(Value: TWidth);
begin
  if FMaxWidth <> Value then
  begin
    FMaxWidth := Value;
    Changed(False);
  end;
end;

procedure TListColumn.SetMinWidth(Value: TWidth);
begin
  if FMinWidth <> Value then
  begin
    FMinWidth := Value;
    Changed(False);
  end;
end;

procedure TListColumn.Assign(Source: TPersistent);
var
  Column: TListColumn;
begin
  if Source is TListColumn then
  begin
    Column := TListColumn(Source);
    Alignment := Column.Alignment;
    AutoSize := Column.AutoSize;
    Caption := Column.Caption;
    ImageIndex := Column.ImageIndex;
    MaxWidth := Column.MaxWidth;
    MinWidth := Column.MinWidth;
    Width := Column.Width;
  end
  else inherited Assign(Source);
end;

function TListColumn.GetDisplayName: string;
begin
  Result := Caption;
  if Result = '' then Result := inherited GetDisplayName;
end;

{ TListColumns }

constructor TListColumns.Create(AOwner: TCustomListView);
begin
  inherited Create(GetListColumnClass);
  FOwner := AOwner;
end;

function TListColumns.GetItem(Index: Integer): TListColumn;
begin
  Result := TListColumn(inherited GetItem(Index));
end;

procedure TListColumns.SetItem(Index: Integer; Value: TListColumn);
begin
  inherited SetItem(Index, Value);
end;

function TListColumns.Add: TListColumn;
begin
  Result := TListColumn(inherited Add);
  UpdateCols;
end;

function TListColumns.Owner: TCustomListView;
begin
  Result := FOwner;
end;

function TListColumns.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TListColumns.Update(Item: TCollectionItem);
begin
  if Item <> nil then
    Owner.UpdateColumn(Item.Index) else
    Owner.UpdateColumns;
end;

procedure TListColumns.UpdateCols;
var
  I: Integer;
  LVColumn: TLVColumn;
  ColumnOrder: TIntegerDynArray;
begin
  if not Owner.HandleAllocated then Exit;
  BeginUpdate;
  try
    SetLength(ColumnOrder, Count);
    for I := Count - 1 downto 0 do
    begin
      ColumnOrder[I] := Items[I].FOrderTag;
      ListView_DeleteColumn(Owner.Handle, I);
    end;

    for I := 0 to Count - 1 do
    begin
      Items[I].FOrderTag := I;
      with LVColumn do
      begin
        mask := LVCF_FMT or LVCF_WIDTH;
        fmt := LVCFMT_LEFT;
        cx := Items[I].FWidth;
      end;
      ListView_InsertColumn(Owner.Handle, I, LVColumn);
    end;
    ListView_SetColumnOrderArray(Owner.Handle, Count, PInteger(ColumnOrder));
    Owner.UpdateColumns;
  finally
    EndUpdate;
  end;
end;

function TListColumns.GetListColumnClass: TListColumnClass;
begin
  Result := TListColumn;
end;

{ TWorkArea }

constructor TWorkArea.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FColor := clWindowText;
  FDisplayName := '';
end;

function TWorkArea.GetDisplayName: string;
begin
  Result := FDisplayName;
end;

procedure TWorkArea.SetColor(const Value: TColor);
begin
  FColor := Value;
  Changed(True);
end;

procedure TWorkArea.SetDisplayName(const Value: string);
begin
  FDisplayName := Value;
  Changed(True);
end;

procedure TWorkArea.SetRect(const Value: TRect);
begin
  FRect := Value;
  Changed(True);
end;

{ TWorkAreas }

procedure TWorkAreas.Update(Item: TCollectionItem);
var
  I: Integer;
  Rects: array of TRect;
  ListView: TCustomListView;
begin
  ListView := TCustomListView(GetOwner);
  SetLength(Rects, Count);
  for I := 0 to Count-1 do
    Rects[I] := Items[I].Rect;
{$IFDEF CLR}
  ListView_SetWorkAreas(ListView.Handle, Count, Rects);
{$ELSE}
  ListView_SetWorkAreas(ListView.Handle, Count, Pointer(Rects));
{$ENDIF}
  ListView.Invalidate;
end;

procedure TWorkAreas.Changed;
begin
  Update(nil);
end;

function TWorkAreas.Add: TWorkArea;
begin
  Result := TWorkArea(inherited Add);
end;

function TWorkAreas.GetItem(Index: Integer): TWorkArea;
begin
  Result := TWorkArea(inherited GetItem(Index));
end;

procedure TWorkAreas.SetItem(Index: Integer; const Value: TWorkArea);
begin
  inherited SetItem(Index, Value);
  Update(nil);
end;

procedure TWorkAreas.Delete(Index: Integer);
begin
  Items[Index].Free;
  Changed;
end;

function TWorkAreas.Insert(Index: Integer): TWorkArea;
begin
  Result := TWorkArea(inherited Insert(Index));
end;

{ TSubItems }

type
  TSubItems = class(TStringList)
  private
    FOwner: TListItem;
    FImageIndices: TList;
    procedure SetColumnWidth(Index: Integer);
    procedure RefreshItem(Index: Integer);
    function GetImageIndex(Index: Integer): TImageIndex;
    procedure SetImageIndex(Index: Integer; const Value: TImageIndex);
  protected
    function GetHandle: HWND;
    procedure Put(Index: Integer; const S: string); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    constructor Create(AOwner: TListItem);
    destructor Destroy; override;
    function Add(const S: string): Integer; override;
    function AddObject(const S: string; AObject: TObject): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
    property Handle: HWND read GetHandle;
    property Owner: TListItem read FOwner;
    property ImageIndex[Index: Integer]: TImageIndex read GetImageIndex write SetImageIndex;
  end;

constructor TSubItems.Create(AOwner: TListItem);
begin
  inherited Create;
  FOwner := AOwner;
  FImageIndices := TList.Create;
end;

destructor TSubItems.Destroy;
begin
  FImageIndices.Free;
  inherited;
end;

function TSubItems.Add(const S: string): Integer;
begin
  Result := inherited Add(S);
{$IFDEF CLR}
  FImageIndices.Add(TObject(TImageIndex(-1)));
{$ELSE}
  FImageIndices.Add(Pointer(-1));
{$ENDIF}
  RefreshItem(Result + 1);
end;

function TSubItems.AddObject(const S: string; AObject: TObject): Integer;
begin
  Result := inherited AddObject(S, AObject);
{$IFDEF CLR}
  FImageIndices.Add(TObject(TImageIndex(-1)));
{$ELSE}
  FImageIndices.Add(Pointer(-1));
{$ENDIF}
  RefreshItem(Result + 1);
end;

procedure TSubItems.Clear;
begin
  inherited;
  FImageIndices.Clear;
end;

procedure TSubItems.Delete(Index: Integer);
begin
  inherited;
  FImageIndices.Delete(Index);
  Owner.Update;
end;

function TSubItems.GetHandle: HWND;
begin
  Result := Owner.Owner.Handle;
end;

procedure TSubItems.SetColumnWidth(Index: Integer);
var
  ListView: TCustomListView;
begin
  ListView := Owner.ListView;
  if ListView.ColumnsShowing and
    (ListView.Columns.Count > Index) and
    (ListView.Column[Index].WidthType = ColumnTextWidth) then
    ListView.UpdateColumn(Index);
end;

procedure TSubItems.Insert(Index: Integer; const S: string);
var
  i: Integer;
begin
  inherited Insert(Index, S);
{$IFDEF CLR}
  FImageIndices.Insert(Index, TObject(TImageIndex(-1)));
{$ELSE}
  FImageIndices.Insert(Index, Pointer(-1));
{$ENDIF}
  for i := Index + 1 to Count do
    RefreshItem(i);
end;

procedure TSubItems.Put(Index: Integer; const S: string);
begin
  inherited Put(Index, S);
  RefreshItem(Index + 1);
end;

procedure TSubItems.RefreshItem(Index: Integer);
begin
{$IFDEF CLR}
  ListView_SetItemText(Handle, Owner.Index, Index, IntPtr(LPSTR_TEXTCALLBACK));
{$ELSE}
  ListView_SetItemText(Handle, Owner.Index, Index, LPSTR_TEXTCALLBACK);
{$ENDIF}
  SetColumnWidth(Index);
end;

procedure TSubItems.SetUpdateState(Updating: Boolean);
begin
  Owner.Owner.SetUpdateState(Updating);
end;

function TSubItems.GetImageIndex(Index: Integer): TImageIndex;
begin
  Result := TImageIndex(FImageIndices[Index]);
end;

procedure TSubItems.SetImageIndex(Index: Integer; const Value: TImageIndex);
begin
{$IFDEF CLR}
  FImageIndices[Index] := TObject(Value);
{$ELSE}
  FImageIndices[Index] := Pointer(Value);
{$ENDIF}
end;

{ TListItem }

constructor TListItem.Create(AOwner: TListItems);
begin
  inherited Create;
  FOwner := AOwner;
  FSubItems := TSubItems.Create(Self);
  FOverlayIndex := -1;
  FStateIndex := -1;
  FGroupID := -1;
{$IFDEF CLR}
  // Add to hashtable to prevent premature garbage collection, and allow
  // access to the actual ListItem object from the LVItem struct
  FOwner.FItemHashTable.Add(TObject(GetHashCode), Self);
{$ENDIF}
end;

destructor TListItem.Destroy;
begin
  FDeleting := True;
  if Owner.Owner.FLastDropTarget = Self then
    Owner.Owner.FLastDropTarget := nil;
  if not ListView.FDeletingAllItems and ListView.HandleAllocated then
    ListView_DeleteItem(Handle, Index);
{$IFDEF CLR}
  FOwner.FItemHashTable.Remove(TObject(GetHashCode));
{$ENDIF}
  FSubItems.Free;
  inherited Destroy;
end;

function TListItem.GetListView: TCustomListView;
begin
  Result := Owner.Owner;
end;

procedure TListItem.Delete;
begin
  if not FDeleting and (Self <> ListView.FTempItem) then
    Free;
end;

function TListItem.GetHandle: HWND;
begin
  Result := ListView.Handle;
end;

procedure TListItem.MakeVisible(PartialOK: Boolean);
begin
  ListView_EnsureVisible(Handle, Index, PartialOK);
end;

function TListItem.GetChecked: Boolean;
begin
  with Owner.Owner do
    if not OwnerData and HandleAllocated then
      Result := (ListView_GetCheckState(Handle, Index) <> 0)
    else
      Result := FChecked;
end;

procedure TListItem.SetChecked(Value: Boolean);
var
  LV: TCustomListView;
begin
  if Value <> Checked then
  begin
    FChecked := Value;
    LV := Owner.Owner;
    if not LV.OwnerData and LV.HandleAllocated then
      ListView_SetCheckState(LV.Handle, Index, Value);
  end;
end;

procedure TListItem.SetGroupID(Value: Integer);
var
  Item: TLVItem;
begin
  if Value <> FGroupID then
  begin
    {$IFNDEF CLR}
    ZeroMemory(@Item, SizeOf(Item));
    {$ENDIF}
    with Item do
    begin
      mask := LVIF_GROUPID;
      iItem := Self.Index;
      iGroupID := Value;
    end;
    ListView_SetItem(Handle, Item);
    FGroupID := Value;
  end;
end;

function TListItem.GetLeft: Integer;
begin
  Result := GetPosition.X;
end;

procedure TListItem.SetLeft(Value: Integer);
begin
  SetPosition(Point(Value, Top));
end;

function TListItem.GetTop: Integer;
begin
  Result := GetPosition.Y;
end;

procedure TListItem.SetTop(Value: Integer);
begin
  SetPosition(Point(Left, Value));
end;

procedure TListItem.Update;
begin
  ListView_Update(Handle, Index);
end;

procedure TListItem.SetCaption(const Value: string);
begin
  if Value <> Caption then
  begin
    FCaption := Value;
    if not Owner.Owner.OwnerData then
{$IFDEF CLR}
      ListView_SetItemText(Handle, Index, 0, IntPtr(Integer(LPSTR_TEXTCALLBACK)));
{$ELSE}
      ListView_SetItemText(Handle, Index, 0, LPSTR_TEXTCALLBACK);
{$ENDIF}
    if ListView.ColumnsShowing and
      (ListView.Columns.Count > 0) and
      (ListView.Column[0].WidthType <= ColumnTextWidth) then
      ListView.UpdateColumns;
    if ListView.SortType in [stBoth, stText] then
      ListView.AlphaSort;
  end;
end;

procedure TListItem.SetData(Value: TCustomData);
begin
  if Value <> Data then
  begin
    FData := Value;
    if ListView.SortType in [stBoth, stData] then
      ListView.AlphaSort;
  end;
end;

function TListItem.EditCaption: Boolean;
begin
  ListView.SetFocus;
  Result := ListView_EditLabel(Handle, Index) <> 0;
end;

procedure TListItem.CancelEdit;
begin
  ListView_EditLabel(Handle, -1);
end;

function TListItem.GetState(Index: Integer): Boolean;
var
  Mask: Integer;
begin
  case Index of
    0: Mask := LVIS_CUT;
    1: Mask := LVIS_DROPHILITED;
    2: Mask := LVIS_FOCUSED;
    3: Mask := LVIS_SELECTED;
    4: Mask := LVIS_ACTIVATING;
  else
    Mask := 0;
  end;
  Result := ListView_GetItemState(Handle, Self.Index, Mask) and Mask <> 0;
end;

procedure TListItem.SetState(Index: Integer; State: Boolean);
var
  Mask: Integer;
  Data: Integer;
begin
  case Index of
    0: Mask := LVIS_CUT;
    1: Mask := LVIS_DROPHILITED;
    2: Mask := LVIS_FOCUSED;
    3: Mask := LVIS_SELECTED;
    4: Mask := LVIS_ACTIVATING;
  else
    Mask := 0;
  end;
  if State then
    Data := Mask
  else
    Data := 0;
  ListView_SetItemState(Handle, Self.Index, Data, Mask);
end;

procedure TListItem.SetImage(Index: Integer; Value: TImageIndex);
var
  Item: TLVItem;
  LChanged: Boolean;
begin
  LChanged := False;
  case Index of
    0:  if Value <> FImageIndex then
        begin
          LChanged := True;
          FImageIndex := Value;
          if not Owner.Owner.OwnerData then
          begin
            with Item do
            begin
              mask := LVIF_IMAGE;
              iImage := I_IMAGECALLBACK;
              iItem := Self.Index;
              iSubItem := 0;
            end;
            ListView_SetItem(Handle, Item);
          end;
        end;
    1:  if Value <> FOverlayIndex then
        begin
          LChanged := True;
          FOverlayIndex := Value;
          if not Owner.Owner.OwnerData then
            ListView_SetItemState(Handle, Self.Index,
              IndexToOverlayMask(OverlayIndex + 1), LVIS_OVERLAYMASK);
        end;
    2:  if Value <> FStateIndex then
        begin
          LChanged := True;
          FStateIndex := Value;
          if Owner.Owner.CheckBoxes and (Value = -1) then
            Value := 0;
          if not Owner.Owner.OwnerData then
            ListView_SetItemState(Handle, Self.Index,
              IndexToStateImageMask(Value + 1), LVIS_STATEIMAGEMASK);
        end;
  end;
  if LChanged and not Owner.Owner.OwnerData then
    ListView.UpdateItems(Self.Index, Self.Index);
end;

procedure TListItem.SetIndent(Value: Integer);
var
  Item: TLVItem;
begin
  if FIndent <> Value then
  begin
    FIndent := Value;
    if not Owner.Owner.OwnerData then
    begin
      with Item do
      begin
        mask := LVIF_INDENT;
        iIndent := Value;
        iItem := Self.Index;
        iSubItem := 0;
      end;
      ListView_SetItem(Handle, Item);
      ListView.UpdateItems(Self.Index, Self.Index);
    end;
  end;
end;

procedure TListItem.Assign(Source: TPersistent);
begin
  if Source is TListItem then
    with Source as TListItem do
    begin
      Self.Caption := Caption;
      Self.Data := Data;
      Self.ImageIndex := ImageIndex;
      Self.Indent := Indent;
      Self.OverlayIndex := OverlayIndex;
      Self.StateIndex := StateIndex;
      Self.SubItems := SubItems;
      Self.Checked := Checked;
      Self.GroupID := GroupID;
    end
  else inherited Assign(Source);
end;

function TListItem.IsEqual(Item: TListItem): Boolean;
begin
  Result := (Caption = Item.Caption) and (Data = Item.Data);
end;

procedure TListItem.SetSubItems(Value: TStrings);
begin
  if Value <> nil then
    FSubItems.Assign(Value);
end;

function TListItem.GetIndex: Integer;
begin
  if Owner.Owner.OwnerData then
    Result := FIndex else
    Result := Owner.IndexOf(Self);
end;

function TListItem.GetPosition: TPoint;
begin
  ListView_GetItemPosition(Handle, Index, Result);
end;

procedure TListItem.SetPosition(const Value: TPoint);
var
  LAt: TPoint;
begin
  LAt := Position;
  if (LAt.X <> Value.X) or (LAt.Y <> Value.Y) then
    if ListView.ViewStyle in [vsSmallIcon, vsIcon] then
      ListView_SetItemPosition32(Handle, Index, Value.X, Value.Y);
end;

function TListItem.DisplayRect(Code: TDisplayCode): TRect;
const
  Codes: array[TDisplayCode] of Longint = (LVIR_BOUNDS, LVIR_ICON, LVIR_LABEL,
    LVIR_SELECTBOUNDS);
begin
  ListView_GetItemRect(Handle, Index, Result, Codes[Code]);
end;

function TListItem.GetSubItemImage(Index: Integer): Integer;
begin
  Result := TSubItems(FSubItems).ImageIndex[Index];
end;

procedure TListItem.SetSubItemImage(Index: Integer; const Value: Integer);
var
  item: TLVItem;
begin
  {Storage of sub-item image indices cannot be provided by the control because
   all display-related content requires a callback}
  if TSubItems(FSubItems).ImageIndex[Index] <> Value then
  begin
    TSubItems(FSubItems).ImageIndex[Index] := Value;
    if not Owner.Owner.OwnerData then
    begin
      with item do
      begin
        mask := LVIF_IMAGE;
        iImage := I_IMAGECALLBACK;
        iItem := Self.Index;
        iSubItem := Index+1;
      end;
      ListView_SetItem(Handle, item);
    end;
  end;
end;

function TListItem.WorkArea: Integer;
begin
  with Owner.Owner.WorkAreas do
  begin
    Result := Count-1;
    while (Result >= 0) and not Items[Result].Rect.Contains(GetPosition) do
      Dec(Result);
  end;
end;

{ TListItemsEnumerator }

constructor TListItemsEnumerator.Create(AListItems: TListItems);
begin
  inherited Create;
  FIndex := -1;
  FListItems := AListItems;
end;

function TListItemsEnumerator.GetCurrent: TListItem;
begin
  Result := FListItems[FIndex];
end;

function TListItemsEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FListItems.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TListItems }

type
{$IFNDEF CLR}
  PItemHeader = ^TItemHeader;
{$ENDIF}
  TItemHeader = record
    Size, Count: Integer;
{$IFDEF CLR}
    Items: THandle;
{$ELSE}
    Items: record end;
{$ENDIF}
  end;

{$IFNDEF CLR}
  PItemInfo = ^TItemInfo;
{$ENDIF}
  TItemInfo = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    Data: Integer;
    {Caption: string[255];}  // .NET: No longer used in structure
{$IFNDEF CLR}
    Caption: string[255];
{$ENDIF}
  end;

{$ALIGN 1}
{$IFNDEF CLR}
  PItemInfo2 = ^TItemInfo2;
{$ENDIF}
  TItemInfo2 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    GroupID: Integer;
    Data: TCustomData;
    {Caption: string[255];}  // .NET: No longer used in structure
{$IFNDEF CLR}
    Caption: string[255];
{$ENDIF}
  end;

{$IFNDEF CLR}
  TItemDataInfo = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    Data: Pointer;
    CaptionLen: Byte;
    // WideString Caption of CaptionLen chars follows
  end;

  TItemDataInfoX86 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    Data: Integer;  // must be integer
    CaptionLen: Byte;
    // WideString Caption of CaptionLen chars follows
  end;

  TItemDataInfo2 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    GroupID: Integer;
    Data: Pointer;
    CaptionLen: Byte;
    // WideString Caption of CaptionLen chars follows
  end;

  // Identical to TItemDataInfo2 except Data field is explicitly
  // 32-bits, used for reading 32-bit streams (ensuring compatibility
  // in 64-bit applications).
  TItemDataInfo2x86 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    GroupID: Integer;
    Data: Integer; // must be Integer
    CaptionLen: Byte;
    // WideString Caption of CaptionLen chars follows
  end;

  // Identical to TItemDataInfo2 except Data field is explicitly
  // 64-bits, used for reading 64-bit streams (ensuring compatibility
  // in 32-bit applications).
  TItemDataInfo2x64 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    GroupID: Integer;
    Data: Int64; // must be Int64
    CaptionLen: Byte;
    // WideString Caption of CaptionLen chars follows
  end;
{$ALIGN ON}

  ShortStr = string[255];
  PShortStr = ^ShortStr;
{$ENDIF}

constructor TListItems.Create(AOwner: TCustomListView);
begin
  inherited Create;
  FOwner := AOwner;
{$IFDEF CLR}
  FItemHashTable := HashTable.Create;
{$ENDIF}
end;

destructor TListItems.Destroy;
begin
  Clear;
{$IFDEF CLR}
  FItemHashTable.Free;
{$ENDIF}
  inherited Destroy;
end;

function TListItems.Add: TListItem;
begin
  Result := AddItem(nil, -1);
end;

function TListItems.Insert(Index: Integer): TListItem;
begin
  Result := AddItem(nil, Index);
end;

function TListItems.AddItem(Item: TListItem; Index: Integer): TListItem;
begin
  if Item = nil then
    Result := Owner.CreateListItem
  else
    Result := Item;
  if Index < 0 then
    Index := Count;
  ListView_InsertItem(Handle, CreateItem(Index, Result));
end;

function TListItems.GetCount: Integer;
begin
  if Owner.HandleAllocated then
    Result := ListView_GetItemCount(Handle)
  else
    Result := 0;
end;

function TListItems.GetEnumerator: TListItemsEnumerator;
begin
  Result := TListItemsEnumerator.Create(Self);
end;

function TListItems.GetHandle: HWND;
begin
  Result := Owner.Handle;
end;

function TListItems.GetItem(Index: Integer): TListItem;
var
  Item: TLVItem;
begin
  Result := nil;
  if Owner.Handle <> 0 then
  begin
    if Owner.OwnerData then
    begin
{$IFNDEF CLR}
      FillChar(Item, SizeOf(Item), 0);
{$ENDIF}
      with Item do
      begin
        mask := 0;
        iItem := Index;
        iSubItem := 0;
      end;
      Result := Owner.GetItem(Item);
    end
    else
    begin
      with Item do
      begin
        mask := LVIF_PARAM;
        iItem := Index;
        iSubItem := 0;
      end;
      if ListView_GetItem(Handle, Item) then
{$IFDEF CLR}
        Result := TListItem(FItemHashTable.Item[TObject(Integer(Item.lParam))]);
{$ELSE}
        Result := TListItem(Item.lParam);
{$ENDIF}
    end;
  end;
end;

function TListItems.IndexOf(Value: TListItem): Integer;
var
  Info: TLVFindInfo;
begin
  with Info do
  begin
    flags := LVFI_PARAM;
{$IFDEF CLR}
    lParam := Value.GetHashCode; 
{$ELSE}
    lParam := Winapi.Windows.LPARAM(Value);
{$ENDIF}
    Result := ListView_FindItem(Handle, -1, Info);
  end;
end;

procedure TListItems.SetCount(Value: Integer);
begin
  if Value <> 0 then
    ListView_SetItemCountEx(Handle, Value, LVSICF_NOINVALIDATEALL)
  else
    ListView_SetItemCountEx(Handle, Value, 0);
end;

procedure TListItems.SetItem(Index: Integer; Value: TListItem);
begin
  Item[Index].Assign(Value);
end;

procedure TListItems.Clear;
begin
  if Owner.HandleAllocated then ListView_DeleteAllItems(Handle);
end;

procedure TListItems.BeginUpdate;
begin
  if FUpdateCount = 0 then SetUpdateState(True);
  Inc(FUpdateCount);
end;

procedure TListItems.SetUpdateState(Updating: Boolean);
var
  i: Integer;
begin
  if Updating then
  begin
    with Owner do
    begin
      FSavedSort := SortType;
      SortType := stNone;
    end;
    for i := 0 to Owner.Columns.Count - 1 do
    begin
      with Owner.Columns[i] as TListColumn do
        if WidthType < 0 then
        begin
          FPrivateWidth := WidthType;
          FWidth := Width;
          DoChange;
        end;
    end;
    SendMessage(Handle, WM_SETREDRAW, 0, 0);
    if Owner.ColumnsShowing and Owner.ValidHeaderHandle then
      SendMessage(Owner.FHeaderHandle, WM_SETREDRAW, 0, 0);
  end
  else if FUpdateCount = 0 then
  begin
    Owner.SortType := Owner.FSavedSort;
    for i := 0 to Owner.Columns.Count - 1 do
    begin
      with Owner.Columns[i] as TListColumn do
        if FPrivateWidth < 0 then
        begin
          Width := FPrivateWidth;
          FPrivateWidth := 0;
        end;
    end;
    FNoRedraw := True;
    try
      SendMessage(Handle, WM_SETREDRAW, 1, 0);
      Owner.Invalidate;
    finally
      FNoRedraw := False;
    end;
    if Owner.ColumnsShowing and Owner.ValidHeaderHandle then
      SendMessage(Owner.FHeaderHandle, WM_SETREDRAW, 1, 0);
  end;
end;

procedure TListItems.EndUpdate;
begin
  Dec(FUpdateCount);
  if FUpdateCount = 0 then SetUpdateState(False);
end;

procedure TListItems.Assign(Source: TPersistent);
var
  Items: TListItems;
  I: Integer;
begin
  if Source is TListItems then
  begin
    Clear;
    Items := TListItems(Source);
    for I := 0 to Items.Count - 1 do Add.Assign(Items[I]);
  end
  else inherited Assign(Source);
end;

procedure TListItems.DefineProperties(Filer: TFiler);

  function WriteItems: Boolean;
  var
    I: Integer;
    Items: TListItems;
  begin
    Items := TListItems(Filer.Ancestor);
    if (Items = nil) then
      Result := (Count > 0) or ((Owner.FMemStream <> nil) and not Owner.HandleAllocated)
    else if (Items.Count <> Count) then
      Result := True
    else
    begin
      Result := False;
      for I := 0 to Count - 1 do
      begin
        Result := not Item[I].IsEqual(Items[I]);
        if Result then Break;
      end
    end;
  end;

begin
  inherited DefineProperties(Filer);
  // Data property is platform specific (Ansi)
  // ItemData property stores data in Unicode
  Filer.DefineBinaryProperty('Data', ReadData, nil, False);
  Filer.DefineBinaryProperty('ItemData', ReadItemData, WriteItemData, WriteItems);
end;

{$REGION CLR_LEGACY}
{$IFDEF CLR}
{$ALIGN 1}
type
  // TItemInfo32 is equivalent in size to TItemInfo on a 32-bit platform.
  // This record is used by 64-bit applications loading TListItems created
  // by 32-bit applications, to avoid size errors caused by TItemInfo.Data.
  TItemInfo32 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    Data: Integer; { TObject }
    {Caption: string[255];}  // No longer used in structure
  end;

  TItemInfo232 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    GroupID: Integer;
    Data: Integer; { TObject }
    {Caption: string[255];}  // No longer used in structure
  end;

  // TItemInfo64 is equivalent in size to TItemInfo on a 64-bit platform.
  // This record is used by 32-bit applications loading TListItems created
  // by 64-bit applications, to avoid size errors caused by TItemInfo.Data.
  TItemInfo64 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    Data: Int64; { TObject }
    {Caption: string[255];}  // No longer used in structure
  end;

  TItemInfo264 = record
    ImageIndex: Integer;
    StateIndex: Integer;
    OverlayIndex: Integer;
    SubItemCount: Integer;
    GroupID: Integer;
    Data: Int64; { TObject }
    {Caption: string[255];}  // No longer used in structure
  end;

  TItemDataType = (idtDefault, idt2Default, idt32bit, idt64bit, idt232bit, idt264bit);
{$ALIGN ON}
{$ENDIF}
{$ENDREGION CLR_LEGACY}

procedure TListItems.ReadData(Stream: TStream);
{$IFDEF CLR}
{$REGION CLR_LEGACY}
var
  Buffer, ItemInfoBuf: TBytes;
  I, J, Size, ItemCount, L, Len: Integer;
  ItemInfo: TItemInfo32;
begin
  Clear;
  Stream.ReadBuffer(Size, SizeOf(Integer));
  Stream.ReadBuffer(ItemCount, SizeOf(Integer));
  L := Marshal.SizeOf(TypeOf(TItemInfo32));
  SetLength(ItemInfoBuf, L);

  for I := 0 to ItemCount - 1 do
  begin
    Stream.ReadBuffer(ItemInfoBuf, L);
    with Add do
    begin
      // Read TItemInfo structure
      ItemInfo := TItemInfo32(BytesToStructure(ItemInfoBuf, TypeOf(TItemInfo32)));
      ImageIndex := ItemInfo.ImageIndex;
      OverlayIndex := ItemInfo.OverlayIndex;
      StateIndex := ItemInfo.StateIndex;
      if ItemInfo.Data <> 0 then
        Data := TObject(ItemInfo.Data);

      // Read length of Caption, followed by actual text
      Stream.ReadBuffer(Len, SizeOf(Byte));
      SetLength(Buffer, Len);
      Stream.ReadBuffer(Buffer, Len);
      Caption := StringOf(Buffer);

      // Read length of each SubItem, followed by actual text
      for J := 0 to ItemInfo.SubItemCount - 1 do
      begin
        Stream.ReadBuffer(Len, SizeOf(Byte));
        SetLength(Buffer, Len);
        Stream.ReadBuffer(Buffer, Len);
        SubItems.Add(StringOf(Buffer));
      end;
    end;
  end;

  // Read subitem images, if present
  for I := 0 to Count - 1 do
    with Item[I] do
      for J := 0 to SubItems.Count - 1 do
      begin
        Stream.ReadBuffer(Len, SizeOf(SmallInt));
        SubItemImages[J] := Len;
      end;
{$ENDREGION CLR_LEGACY}
{$ELSE}
var
  I, J, Size, L, Len: Integer;
  ItemHeader: PItemHeader;
  ItemInfo: PItemInfo;
  PStr: PShortStr;
  PInt: PSmallInt;
begin
  Clear;
  Stream.ReadBuffer(Size, SizeOf(Integer));
  ItemHeader := AllocMem(Size);
  try
    Stream.ReadBuffer(ItemHeader^.Count, Size - SizeOf(Integer));
    ItemInfo := @ItemHeader^.Items;
    PStr := nil;
    for I := 0 to ItemHeader^.Count - 1 do
    begin
      with Add do
      begin
        Caption := string(ItemInfo^.Caption);
        ImageIndex := ItemInfo^.ImageIndex;
        OverlayIndex := ItemInfo^.OverlayIndex;
        StateIndex := ItemInfo^.StateIndex;
        Data := Pointer(ItemInfo^.Data);
        PStr := @ItemInfo^.Caption;
        Inc(PByte(PStr), Length(PStr^) + 1);
        Len := 0;
        for J := 0 to ItemInfo^.SubItemCount - 1 do
        begin
          SubItems.Add(string(PStr^));
          L := Length(PStr^);
          Inc(Len, L + 1);
          Inc(PByte(PStr), L + 1);
        end;
      end;
      Inc(PByte(ItemInfo), SizeOf(TItemInfo) - 255 +
        Length(ItemInfo.Caption) + Len);
    end;
    //read subitem images, if present.
    if PChar(PStr) - PChar(ItemHeader) < Size then
    begin
      PInt := Pointer(PStr);
      for I := 0 to Count - 1 do
        with Item[I] do
          for J := 0 to SubItems.Count - 1 do
          begin
            SubItemImages[J] := PInt^;
            Inc(PInt);
          end;
    end;
  finally
    FreeMem(ItemHeader, Size);
  end;
{$ENDIF}
end;

const
  ListItemStreamVersion1    = $01; // 32-bit struct size version 1
  ListItemStreamVersion1x64 = $02; // 64-bit struct size version 1
  ListItemStreamVersion2    = $03; // 32-bit struct size version 2
  ListItemStreamVersion2x64 = $04; // 64-bit struct size version 2
  ListItemStreamVersion3    = $05; // 32-bit struct size version 3
  ListItemStreamVersion3x64 = $06; // 64-bit struct size version 3

procedure TListItems.ReadItemData(Stream: TStream);
{$IFDEF CLR}
{$REGION CLR_LEGACY}
var
  StreamVersion: Byte;
  Buffer, ItemInfoBuf: TBytes;
  I, J, Size, ItemCount, L, Len, LSubItemCount: Integer;
  LImageIndex: SmallInt;
  ItemDataType: TItemDataType;
  LItemType: System.&Type;
  LItemObject: TObject;
  ItemInfo: TItemInfo;
  ItemInfo32: TItemInfo32;
  ItemInfo64: TItemInfo64;
  ItemInfo2: TItemInfo2;
  ItemInfo232: TItemInfo232;
  ItemInfo264: TItemInfo264;
begin
  Clear;
  Stream.ReadBuffer(StreamVersion, SizeOf(StreamVersion));

  // Determine which structure to use when loading items
  ItemDataType := idtDefault;
  LItemType := TypeOf(TItemInfo);
  case StreamVersion of
    ListItemStreamVersion1:
      if IntPtr.Size = 8 then
      begin
        ItemDataType := idt32bit;
        LItemType := TypeOf(TItemInfo32);
      end;
    ListItemStreamVersion1x64:
      if IntPtr.Size = 4 then
      begin
        ItemDataType := idt64bit;
        LItemType := TypeOf(TItemInfo64);
      end;
    ListItemStreamVersion2:
      if IntPtr.Size = 8 then
      begin
        ItemDataType := idt232bit;
        LItemType := TypeOf(TItemInfo232);
      end
      else
      begin
        ItemDataType := idt2Default;
        LItemType := TypeOf(TItemInfo2);
      end;
    ListItemStreamVersion2x64:
      if IntPtr.Size = 4 then
      begin
        ItemDataType := idt264bit;
        LItemType := TypeOf(TItemInfo264);
      end
      else
      begin
        ItemDataType := idt2Default;
        LItemType := TypeOf(TItemInfo2);
      end;
  else
    Exit;
  end;
  
  Stream.ReadBuffer(Size, SizeOf(Integer));
  Stream.ReadBuffer(ItemCount, SizeOf(Integer));
  L := Marshal.SizeOf(LItemType);
  SetLength(ItemInfoBuf, L);

  for I := 0 to ItemCount - 1 do
  begin
    Stream.ReadBuffer(ItemInfoBuf, L);
    with Add do
    begin
      // Read TItemInfo structure
      LItemObject := BytesToStructure(ItemInfoBuf, LItemType);
      case ItemDataType of
        idt32bit:
          begin
            ItemInfo32 := TItemInfo32(LItemObject);
            ImageIndex := ItemInfo32.ImageIndex;
            OverlayIndex := ItemInfo32.OverlayIndex;
            StateIndex := ItemInfo32.StateIndex;
            GroupID := -1;
            if ItemInfo32.Data <> 0 then
              Data := TObject(ItemInfo32.Data);
            LSubItemCount := ItemInfo32.SubItemCount;
          end;
        idt64bit:
          begin
            ItemInfo64 := TItemInfo64(LItemObject);
            ImageIndex := ItemInfo64.ImageIndex;
            OverlayIndex := ItemInfo64.OverlayIndex;
            StateIndex := ItemInfo64.StateIndex;
            GroupID := -1;
            if ItemInfo64.Data <> 0 then
              Data := TObject(ItemInfo64.Data);
            LSubItemCount := ItemInfo64.SubItemCount;
          end;
        idt232bit:
          begin
            ItemInfo232 := TItemInfo232(LItemObject);
            ImageIndex := ItemInfo232.ImageIndex;
            OverlayIndex := ItemInfo232.OverlayIndex;
            StateIndex := ItemInfo232.StateIndex;
            GroupID := ItemInfo232.GroupID;
            if ItemInfo232.Data <> 0 then
              Data := TObject(ItemInfo232.Data);
            LSubItemCount := ItemInfo232.SubItemCount;
          end;
        idt264bit:
          begin
            ItemInfo264 := TItemInfo264(LItemObject);
            ImageIndex := ItemInfo264.ImageIndex;
            OverlayIndex := ItemInfo264.OverlayIndex;
            StateIndex := ItemInfo264.StateIndex;
            GroupID := ItemInfo264.GroupID;
            if ItemInfo264.Data <> 0 then
              Data := TObject(ItemInfo264.Data);
            LSubItemCount := ItemInfo264.SubItemCount;
          end;
        idt2Default:
          begin
            ItemInfo2 := TItemInfo2(LItemObject);
            ImageIndex := ItemInfo2.ImageIndex;
            OverlayIndex := ItemInfo2.OverlayIndex;
            StateIndex := ItemInfo2.StateIndex;
            GroupID := ItemInfo2.GroupID;
            Data := ItemInfo2.Data;
            LSubItemCount := ItemInfo2.SubItemCount;
          end;
      else // idtDefault
        begin
          ItemInfo := TItemInfo(LItemObject);
          ImageIndex := ItemInfo.ImageIndex;
          OverlayIndex := ItemInfo.OverlayIndex;
          StateIndex := ItemInfo.StateIndex;
          GroupID := -1;
          Data := ItemInfo.Data;
          LSubItemCount := ItemInfo.SubItemCount;
        end;
      end;

      // Read length of Caption in chars, followed by actual text
      Stream.ReadBuffer(Len, SizeOf(Byte));
      SetLength(Buffer, Len * SizeOf(WideChar));
      Stream.ReadBuffer(Buffer, Length(Buffer));
      Caption := WideStringOf(Buffer);

      // Read length of each SubItem in chars, followed by actual text
      for J := 0 to LSubItemCount - 1 do
      begin
        Stream.ReadBuffer(Len, SizeOf(Byte));
        SetLength(Buffer, Len * SizeOf(WideChar));
        Stream.ReadBuffer(Buffer, Length(Buffer));
        SubItems.Add(WideStringOf(Buffer));
      end;
    end;
  end;

  // Read subitem images, if present
  for I := 0 to Count - 1 do
    with Item[I] do
      for J := 0 to SubItems.Count - 1 do
      begin
        Stream.ReadBuffer(LImageIndex, SizeOf(SmallInt));
        SubItemImages[J] := LImageIndex;
      end;
{$ENDREGION CLR_LEGACY}
{$ELSE}
var
  I, J, Size, ItemCount: Integer;
  LImageIndex: SmallInt;
  StreamVersion, Len: Byte;
  ItemInfo: TItemDataInfoX86;
  ItemInfo2x86: TItemDataInfo2x86;
  ItemInfo2x64: TItemDataInfo2x64;
  LWideStr: UnicodeString;
  LSubItemData: Pointer;
begin
  Clear;
  if Stream.Size = 0 then
    Exit;

  Stream.ReadBuffer(StreamVersion, SizeOf(StreamVersion));
  case StreamVersion of
    ListItemStreamVersion1:
      begin
        Stream.ReadBuffer(Size, SizeOf(Integer));
        Stream.ReadBuffer(ItemCount, SizeOf(Integer));

        for I := 0 to ItemCount - 1 do
        begin
          Stream.ReadBuffer(ItemInfo, SizeOf(TItemDataInfoX86));
          with Add do
          begin
            ImageIndex := ItemInfo.ImageIndex;
            OverlayIndex := ItemInfo.OverlayIndex;
            StateIndex := ItemInfo.StateIndex;
            Data := Pointer(ItemInfo.Data);
            GroupID := -1;

            // Read Caption
            SetLength(LWideStr, ItemInfo.CaptionLen);
            Stream.ReadBuffer(LWideStr[1], ItemInfo.CaptionLen * SizeOf(WideChar));
            Caption := LWideStr;

            // Read length of each SubItem in chars, followed by actual text
            for J := 0 to ItemInfo.SubItemCount - 1 do
            begin
              Stream.ReadBuffer(Len, SizeOf(Byte));
              SetLength(LWideStr, Len);
              Stream.ReadBuffer(LWideStr[1], Len * SizeOf(WideChar));
              SubItems.Add(LWideStr);
            end;
          end;
        end;
      end;
    ListItemStreamVersion2,
    ListItemStreamVersion3:
      begin
        Stream.ReadBuffer(Size, SizeOf(Integer));
        Stream.ReadBuffer(ItemCount, SizeOf(Integer));

        for I := 0 to ItemCount - 1 do
        begin
          Stream.ReadBuffer(ItemInfo2x86, SizeOf(TItemDataInfo2x86));
          with Add do
          begin
            ImageIndex := ItemInfo2x86.ImageIndex;
            OverlayIndex := ItemInfo2x86.OverlayIndex;
            StateIndex := ItemInfo2x86.StateIndex;
            Data := Pointer(ItemInfo2x86.Data);
            GroupID := ItemInfo2x86.GroupID;

            // Read Caption
            SetLength(LWideStr, ItemInfo2x86.CaptionLen);
            Stream.ReadBuffer(LWideStr[1], ItemInfo2x86.CaptionLen * SizeOf(WideChar));
            Caption := LWideStr;

            // Read length of each SubItem in chars, followed by actual text
            for J := 0 to ItemInfo2x86.SubItemCount - 1 do
            begin
              Stream.ReadBuffer(Len, SizeOf(Byte));
              SetLength(LWideStr, Len);
              Stream.ReadBuffer(LWideStr[1], Len * SizeOf(WideChar));
              LSubItemData := nil;
              if StreamVersion = ListItemStreamVersion3 then
                Stream.ReadBuffer(LSubItemData, SizeOf(Integer));
              SubItems.AddObject(LWideStr, Pointer(LSubItemData));
            end;
          end;
        end;
      end;
    ListItemStreamVersion3x64:
      begin
        Stream.ReadBuffer(Size, SizeOf(Integer));
        Stream.ReadBuffer(ItemCount, SizeOf(Integer));

        for I := 0 to ItemCount - 1 do
        begin
          Stream.ReadBuffer(ItemInfo2x64, SizeOf(TItemDataInfo2x64));
          with Add do
          begin
            ImageIndex := ItemInfo2x64.ImageIndex;
            OverlayIndex := ItemInfo2x64.OverlayIndex;
            StateIndex := ItemInfo2x64.StateIndex;
            Data := Pointer(ItemInfo2x64.Data);
            GroupID := ItemInfo2x64.GroupID;

            // Read Caption
            SetLength(LWideStr, ItemInfo2x64.CaptionLen);
            Stream.ReadBuffer(LWideStr[1], ItemInfo2x64.CaptionLen * SizeOf(WideChar));
            Caption := LWideStr;

            // Read length of each SubItem in chars, followed by actual text
            for J := 0 to ItemInfo2x64.SubItemCount - 1 do
            begin
              Stream.ReadBuffer(Len, SizeOf(Byte));
              SetLength(LWideStr, Len);
              Stream.ReadBuffer(LWideStr[1], Len * SizeOf(WideChar));
              LSubItemData := nil;
              Stream.ReadBuffer(LSubItemData, SizeOf(Int64));
              SubItems.AddObject(LWideStr, Pointer(LSubItemData));
            end;
          end;
        end;
      end
  else
                                                       
    Exit;
  end;

  // Read subitem images, if present
  for I := 0 to Count - 1 do
    with Item[I] do
      for J := 0 to SubItems.Count - 1 do
      begin
        Stream.ReadBuffer(LImageIndex, SizeOf(SmallInt));
        SubItemImages[J] := LImageIndex;
      end;
{$ENDIF}
end;

procedure TListItems.WriteItemData(Stream: TStream);
{$IFDEF CLR}
{$REGION CLR_LEGACY}
var
  Buffer, LCaption: TBytes;
  I, J, Size, L, LCaptionLen: Integer;
  ItemInfo: TItemInfo2;

  function GetByteLength(const S: string): Integer;
  begin
    Result := ByteLength(S);
    if Result > 255 * SizeOf(Char) then
      Result := 255 * SizeOf(Char); // Max length for an item is 255 chars
  end;

begin
  Size := 0;
  for I := 0 to Count - 1 do
  begin
    L := GetByteLength(Item[I].Caption) + SizeOf(Byte); // Add length byte
    for J := 0 to Item[I].SubItems.Count - 1 do
    begin
      Inc(L, GetByteLength(Item[I].SubItems[J]) + SizeOf(Byte)); // Add length byte
      Inc(L, SizeOf(SmallInt)); // SubItem images
    end;
    Inc(Size, Marshal.SizeOf(TypeOf(TItemInfo)) + L);
  end;

  // Check which platform we're running under and write the
  // appropriate stream version. TItemInfo.Data has a different
  // size when running as a 64-bit application.
  if IntPtr.Size = 4 then
    Stream.WriteBuffer(ListItemStreamVersion2, SizeOf(Byte))
  else
    Stream.WriteBuffer(ListItemStreamVersion2x64, SizeOf(Byte));
  Stream.WriteBuffer(Size, SizeOf(Integer));
  Stream.WriteBuffer(Count, SizeOf(Integer));
  for I := 0 to Count - 1 do
  begin
    with Item[I] do
    begin
      // Write TItemInfo structure
      ItemInfo.ImageIndex := ImageIndex;
      ItemInfo.OverlayIndex := OverlayIndex;
      ItemInfo.StateIndex := StateIndex;
      ItemInfo.Data := Data;
      ItemInfo.GroupID := GroupID;
      ItemInfo.SubItemCount := SubItems.Count;
      Buffer := StructureToBytes(TObject(ItemInfo));
      Stream.WriteBuffer(Buffer, Length(Buffer));

      // Write length of Caption in chars followed by Caption
      LCaption := WideBytesOf(Caption);
      LCaptionLen := Length(Caption);
      if LCaptionLen > 255 then
        LCaptionLen := 255;
      Stream.WriteBuffer(LCaptionLen, SizeOf(Byte));
      Stream.WriteBuffer(LCaption, LCaptionLen * SizeOf(WideChar));

      // Write length of each SubItem in chars followed by the SubItem
      for J := 0 to SubItems.Count - 1 do
      begin
        LCaption := WideBytesOf(SubItems[J]);
        LCaptionLen := Length(SubItems[J]);
        if LCaptionLen > 255 then
          LCaptionLen := 255;
        Stream.WriteBuffer(LCaptionLen, SizeOf(Byte));
        Stream.WriteBuffer(LCaption, LCaptionLen * SizeOf(WideChar));
      end;
    end;
  end;

  // Write SubItem images
  for I := 0 to Count - 1 do
    with Item[I] do
      for J := 0 to SubItems.Count - 1 do
        Stream.WriteBuffer(SmallInt(SubItemImages[J]), SizeOf(SmallInt));
{$ENDREGION CLR_LEGACY}
{$ELSE}
var
  ItemInfo: TItemDataInfo2;
  LCaption: UnicodeString;
  I, J, Size, L: Integer;
  LImageIndex: Smallint;
  LStreamVersion: Byte;
  LItemCount, LCaptionLen: Integer;

  function GetByteLength(const S: string): Integer;
  begin
    Result := ByteLength(S);
    if Result > 255 * SizeOf(Char) then
      Result := 255 * SizeOf(Char); // Max length for an item is 255 chars
  end;

  function GetListItemsFromStream(Stream: TMemoryStream): TBytes;
  const
    ItemsPropName = 'Items.ItemData'; // do not localize
  var
    LReader: TReader;
    LFlags: TFilerFlags;
    LPos, LSize: Integer;
  begin
    SetLength(Result, 0);
    Stream.Position := 0;
    LReader := TReader.Create(Stream, 1024);
    try
      LReader.ReadSignature;
      LReader.ReadPrefix(LFlags, LPos);
      LReader.ReadStr; // Class name
      LReader.ReadStr; // Name property
      LReader.ReadStr; // 1st property name
      while LReader.NextValue <> vaNull do
      begin
        LReader.SkipValue;
        if LReader.ReadStr = ItemsPropName then
        begin
          LReader.CheckValue(vaBinary);
          LReader.Read(LSize, SizeOf(LSize));
          SetLength(Result, LSize);
          LReader.Read(Result[0], LSize);
          Break;
        end;
      end;
    finally
      LReader.Free;
    end;
  end;

var
  LBuffer: TBytes;
  LSubItemData: IntPtr;
begin
  if (Owner.FMemStream <> nil) and not Owner.HandleAllocated then
  begin
    // If the handle isn't allocated we need to extract the items
    // from the cached memory stream and write them to Stream
    LBuffer := GetListItemsFromStream(Owner.FMemStream);
    Stream.Write(LBuffer[0], Length(LBuffer));
    Exit;
  end;

  Size := 0;
  for I := 0 to Count - 1 do
  begin
    L := GetByteLength(Item[I].Caption) + SizeOf(Byte); // Add length byte
    for J := 0 to Item[I].SubItems.Count - 1 do
    begin
      Inc(L, GetByteLength(Item[I].SubItems[J]) + SizeOf(Byte)); // Add length byte
      Inc(L, SizeOf(LSubItemData)); // Add size of SubItem's Object
      Inc(L, SizeOf(SmallInt)); // SubItem images
    end;
    Inc(Size, SizeOf(TItemDataInfo2) + L);
  end;

  LItemCount := Count;
{$IFDEF CPUX86}
  LStreamVersion := ListItemStreamVersion3;
{$ELSE}
  LStreamVersion := ListItemStreamVersion3x64;
{$ENDIF}
  Stream.WriteBuffer(LStreamVersion, SizeOf(Byte));
  Stream.WriteBuffer(Size, SizeOf(Integer));
  Stream.WriteBuffer(LItemCount, SizeOf(Integer));
  for I := 0 to Count - 1 do
  begin
    with Item[I] do
    begin
      // Write TItemDataInfo structure
      ItemInfo.ImageIndex := ImageIndex;
      ItemInfo.OverlayIndex := OverlayIndex;
      ItemInfo.StateIndex := StateIndex;
      ItemInfo.Data := Data;
      ItemInfo.GroupID := GroupID;
      ItemInfo.SubItemCount := SubItems.Count;
      LCaption := Caption;
      LCaptionLen := Length(LCaption);
      if LCaptionLen > 255 then
        LCaptionLen := 255;
      ItemInfo.CaptionLen := LCaptionLen;
      Stream.WriteBuffer(ItemInfo, SizeOf(TItemDataInfo2));

      // Write Caption
      Stream.WriteBuffer(LCaption[1], ItemInfo.CaptionLen * SizeOf(WideChar));

      // Write length of each SubItem in chars followed by the SubItem
      for J := 0 to SubItems.Count - 1 do
      begin
        LCaption := SubItems[J];
        LCaptionLen := Length(LCaption);
        if LCaptionLen > 255 then
          LCaptionLen := 255;
        Stream.WriteBuffer(LCaptionLen, SizeOf(Byte));
        Stream.WriteBuffer(LCaption[1], LCaptionLen * SizeOf(WideChar));
        LSubItemData := IntPtr(SubItems.Objects[J]);
        Stream.WriteBuffer(LSubItemData, SizeOf(LSubItemData));
      end;
    end;
  end;

  // Write SubItem images
  for I := 0 to Count - 1 do
    with Item[I] do
      for J := 0 to SubItems.Count - 1 do
      begin
        LImageIndex := SubItemImages[J];
        Stream.WriteBuffer(LImageIndex, SizeOf(SmallInt));
      end;
{$ENDIF}
end;

procedure TListItems.Delete(Index: Integer);
begin
  Item[Index].Delete;
end;

function TListItems.CreateItem(Index: Integer;
  ListItem: TListItem): TLVItem;
begin
  with Result do
  begin
    mask := LVIF_PARAM or LVIF_IMAGE or LVIF_GROUPID;
    iItem := Index;
    iSubItem := 0;
    iImage := I_IMAGECALLBACK;
    iGroupId := -1;
{$IFDEF CLR}
    lParam := ListItem.GetHashCode; 
{$ELSE}
    lParam := Winapi.Windows.LPARAM(ListItem);
{$ENDIF}
  end;
end;

{ TIconOptions }

constructor TIconOptions.Create(AOwner: TCustomListView);
begin
  inherited Create;
  if AOwner = nil then
    raise Exception.Create(sInvalidOwner);
  FListView := AOwner;
  Arrangement := iaTop;
  AutoArrange := False;
  WrapText := True;
end;

procedure TIconOptions.SetArrangement(Value: TIconArrangement);
begin
  if Value <> Arrangement then
  begin;
    FArrangement := Value;
    FListView.RecreateWnd;
  end;
end;

procedure TIconOptions.SetAutoArrange(Value: Boolean);
begin
  if Value <> AutoArrange then
  begin
    FAutoArrange := Value;
    FListView.RecreateWnd;
  end;
end;

procedure TIconOptions.SetWrapText(Value: Boolean);
begin
  if Value <> WrapText then
  begin
    FWrapText := Value;
    FListView.RecreateWnd;
  end;
end;

{$IFDEF CLR}
procedure TLVInstances.Finalize;
begin
  if Assigned(FEditInstance) then
  begin
    FreeObjectInstance(FEditInstance);
    FEditInstance := nil;
  end;
  if Assigned(FHeaderInstance) then
  begin
    FreeObjectInstance(FHeaderInstance);
    FHeaderInstance := nil;
  end;
  inherited;
end;
{$ENDIF}

{ TCustomListView }

{$IFNDEF CLR}
function DefaultListViewSort(Item1, Item2: TListItem;
  lParam: Integer): Integer; stdcall;
begin
  with Item1 do
    if Assigned(ListView.OnCompare) then
      ListView.OnCompare(ListView, Item1, Item2, lParam, Result)
    else Result := lstrcmp(PChar(Item1.Caption), PChar(Item2.Caption));
end;
{$ENDIF}

class constructor TCustomListView.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomListView, TListViewStyleHook);
end;

constructor TCustomListView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csCaptureMouse] +
    [csDisplayDragImage, csReflector, csPannable];
  Width := 250;
  Height := 150;
  BorderStyle := bsSingle;
  ViewStyle := vsIcon;
  ParentColor := False;
  TabStop := True;
  HideSelection := True;
  ShowColumnHeaders := True;
  ColumnClick := True;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FDragIndex := -1;
  FListColumns := GetListColumnsClass.Create(Self);
  FListGroups := TListGroups.Create(Self);
  FListItems := CreateListItems;
  FTempItem := CreateListItem;
  FGroupView := False;
  FIconOptions := TIconOptions.Create(Self);
  FWorkAreas := TWorkAreas.Create(Self, TWorkArea);
  FShowWorkAreas := False;
  FUpdatingColumnOrder := False;
  FOwnerDataCount := 0;
  FHoverTime := -1;
  FDragImage := TDragImageList.CreateSize(32, 32);
{$IFDEF CLR}
  FLVInstances := TLVInstances.Create;
  FLVInstances.FEditInstance := MakeObjectInstance(EditWndProc);
  FLVInstances.FHeaderInstance := MakeObjectInstance(HeaderWndProc);
{$ELSE}
  FEditInstance := MakeObjectInstance(EditWndProc);
  FHeaderInstance := MakeObjectInstance(HeaderWndProc);
{$ENDIF}
  FLargeChangeLink := TChangeLink.Create;
  FLargeChangeLink.OnChange := ImageListChange;
  FHeaderChangeLink := TChangeLink.Create;
  FHeaderChangeLink.OnChange := ImageListChange;
  FSmallChangeLink := TChangeLink.Create;
  FSmallChangeLink.OnChange := ImageListChange;
  FStateChangeLink := TChangeLink.Create;
  FStateChangeLink.OnChange := ImageListChange;
  FSaveSelectedIndex := -1;
  FInBufferedPrintClient := False;
  ScalingFlags := ScalingFlags + [sfWidth];
end;

class destructor TCustomListView.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomListView, TListViewStyleHook);
end;

destructor TCustomListView.Destroy;
begin
  if HandleAllocated then DestroyWindowHandle;
  FDragImage.Free;
  FListColumns.Free;
  FTempItem.Free;
  FListGroups.Free;  
  FListItems.Free;
  FIconOptions.Free;
  FMemStream.Free;
  FColStream.Free;
  FCheckStream.Free;
  FWorkAreas.Free;
{$IFDEF CLR}
  if FHeaderHandle <> 0 then
    SetWindowLong(FHeaderHandle, GWL_WNDPROC, THandle(FDefHeaderProc));
  if Assigned(FLVInstances) then
  begin
    if Assigned(FLVInstances.FEditInstance) then
    begin
      FreeObjectInstance(FLVInstances.FEditInstance);
      FLVInstances.FEditInstance := nil;
    end;
    if Assigned(FLVInstances.FHeaderInstance) then
    begin
      FreeObjectInstance(FLVInstances.FHeaderInstance);
      FLVInstances.FHeaderInstance := nil;
    end;
    System.GC.SuppressFinalize(FLVInstances);
    FreeAndNil(FLVInstances);
  end;
{$ELSE}
  FreeObjectInstance(FEditInstance);
  if FHeaderHandle <> 0 then
    SetWindowLong(FHeaderHandle, GWL_WNDPROC, LPARAM(FDefHeaderProc));
  FreeObjectInstance(FHeaderInstance);
{$ENDIF}
  FreeAndNil(FLargeChangeLink);
  FreeAndNil(FSmallChangeLink);
  FreeAndNil(FStateChangeLink);
  FreeAndNil(FHeaderChangeLink);
  FCanvas.Free;
  FCanvas := nil;
  inherited Destroy;
end;

procedure TCustomListView.CreateParams(var Params: TCreateParams);
const
  BorderStyles: array[TBorderStyle] of DWORD = (0, WS_BORDER);
  EditStyles: array[Boolean] of DWORD = (LVS_EDITLABELS, 0);
  MultiSelections: array[Boolean] of DWORD = (LVS_SINGLESEL, 0);
  HideSelections: array[Boolean] of DWORD = (LVS_SHOWSELALWAYS, 0);
  Arrangements: array[TIconArrangement] of DWORD = (LVS_ALIGNTOP,
    LVS_ALIGNLEFT);
  AutoArrange: array[Boolean] of DWORD = (0, LVS_AUTOARRANGE);
  WrapText: array[Boolean] of DWORD = (LVS_NOLABELWRAP, 0);
  ViewStyles: array[TViewStyle] of DWORD = (LVS_ICON, LVS_SMALLICON,
    LVS_LIST, LVS_REPORT);
  ShowColumns: array[Boolean] of DWORD = (LVS_NOCOLUMNHEADER, 0);
  ColumnClicks: array[Boolean] of DWORD = (LVS_NOSORTHEADER, 0);
begin
  InitCommonControl(ICC_LISTVIEW_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, WC_LISTVIEW);
  with Params do
  begin
    Style := Style or WS_CLIPCHILDREN or ViewStyles[ViewStyle] or
      BorderStyles[BorderStyle] or Arrangements[IconOptions.Arrangement] or
      EditStyles[ReadOnly] or MultiSelections[MultiSelect] or
      HideSelections[HideSelection] or
      AutoArrange[IconOptions.AutoArrange] or
      WrapText[IconOptions.WrapText] or
      ShowColumns[ShowColumnHeaders] or
      ColumnClicks[ColumnClick] or
      LVS_SHAREIMAGELISTS;
    if FOwnerData then Style := Style or LVS_OWNERDATA;
    if FOwnerDraw then Style := Style or LVS_OWNERDRAWFIXED;
    if Ctl3D and NewStyleControls and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := Params.ExStyle or WS_EX_CLIENTEDGE;
    end;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomListView.CreateWnd;

  procedure ReadCols;
  var
    Reader: TReader;
  begin
    if FColStream = nil then Exit;
    Columns.ClearAndResetID;
    Reader := TReader.Create(FColStream, 1024);
    try
      Reader.ReadValue;
      Reader.ReadCollection(Columns);
    finally
      Reader.Free;
    end;
{$IFNDEF CLR}
    FColStream.Destroy;
{$ENDIF}
    FColStream := nil;
  end;

begin
  inherited CreateWnd;
  ResetExStyles;
  SetTextBKColor(Color);
  SetTextColor(Font.Color);
  SetAllocBy(AllocBy);
  HoverTime := FHoverTime;
  if FMemStream <> nil then
  begin
    Items.BeginUpdate;
    FReading := True;
    try
      Columns.ClearAndResetID;
      FMemStream.Position := 0;
      if csLoading in ComponentState then
        FMemStream.ReadComponent(Self)
      else
      begin
        FMemStream.ReadComponent(Self);
        if csLoading in ComponentState then
          inherited Loaded; // Reset csLoading flag
      end;
{$IFNDEF CLR}
      FMemStream.Destroy;
{$ENDIF}
      FMemStream := nil;
      if OwnerData then
        Items.Count := FOwnerDataCount;
      if FCheckboxes then
        RestoreChecks;
      ReadCols;
      Font := Font;
      if FSaveSelectedIndex <> -1 then
      begin
        Selected := Items[FSaveSelectedIndex];
        if Selected <> nil then
          Selected.MakeVisible(False);
      end;
      RestoreIndents;
    finally
      Items.EndUpdate;
      FReading := False;
    end;
  end;
  Columns.UpdateCols;

  ListView_EnableGroupView(Handle, FGroupView);
  UpdateGroups;

  if (LargeImages <> nil) and LargeImages.HandleAllocated then
    SetImageList(LargeImages.Handle, LVSIL_NORMAL);
  if (SmallImages <> nil) and SmallImages.HandleAllocated then
    SetImageList(SmallImages.Handle, LVSIL_SMALL);
  if (StateImages <> nil) and StateImages.HandleAllocated then
    SetImageList(StateImages.Handle, LVSIL_STATE);
  if (GroupHeaderImages <> nil) and GroupHeaderImages.HandleAllocated then
    SetImageList(GroupHeaderImages.Handle, LVSIL_GROUPHEADER);
  DoAutoSize;
  if StyleServices.Enabled and TOSVersion.Check(6) and StyleServices.IsSystemStyle then
    SetWindowTheme(Handle, 'explorer', nil); // do not localize
end;

procedure TCustomListView.DestroyWnd;
begin
  if (csRecreating in ControlState) then
  begin
    if FMemStream = nil then
      FMemStream := TMemoryStream.Create
    else
      FMemStream.Size := 0;
    if OwnerData then FOwnerDataCount := Items.Count;
    FMemStream.WriteComponent(Self);
    FMemStream.Position := 0;
    if FCheckboxes then
      SaveChecks;
    if Assigned(Selected) then
      FSaveSelectedIndex := Selected.Index
    else
      FSaveSelectedIndex := -1;
    SaveIndents;
  end;
  inherited DestroyWnd;
end;

procedure TCustomListView.SetImageList(Value: HImageList; Flags: Integer);
begin
  if HandleAllocated then ListView_SetImageList(Handle, Value, Flags);
end;

function TCustomListView.StoreGroups: Boolean;
begin
  Result := FListGroups.Count > 0;
end;

procedure TCustomListView.ImageListChange(Sender: TObject);
var
  ImageHandle: HImageList;
begin
  if HandleAllocated then
  begin
    if TCustomImageList(Sender).HandleAllocated then
      ImageHandle := TCustomImageList(Sender).Handle
    else
      ImageHandle := 0;
    if Sender = LargeImages then SetImageList(ImageHandle, LVSIL_NORMAL)
    else if Sender = SmallImages then SetImageList(ImageHandle, LVSIL_SMALL)
    else if Sender = StateImages then SetImageList(ImageHandle, LVSIL_STATE)
    else if Sender = StateImages then SetImageList(ImageHandle, LVSIL_GROUPHEADER);
  end;
end;

procedure TCustomListView.Loaded;
begin
  inherited;
  if HandleAllocated then
  begin
    ListView_EnableGroupView(Handle, FGroupView);
    UpdateGroups;
  end;
end;

procedure TCustomListView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = LargeImages then LargeImages := nil;
    if AComponent = SmallImages then SmallImages := nil;
    if AComponent = StateImages then StateImages := nil;
    if AComponent = GroupHeaderImages then GroupHeaderImages := nil;
  end;
end;

procedure TCustomListView.HeaderWndProc(var Message: TMessage);

  procedure UpdateColumnOrder;
  var
    I: Integer;
    ColumnOrder: TIntegerDynArray;
  begin
    SetLength(ColumnOrder, Columns.Count);
{$IFDEF CLR}
    ListView_GetColumnOrderArray(Handle, Columns.Count, ColumnOrder);
{$ELSE}
    ListView_GetColumnOrderArray(Handle, Columns.Count, PInteger(ColumnOrder));
{$ENDIF}
    FListColumns.BeginUpdate;
    try
      for I := 0 to FListColumns.Count - 1 do
        GetColumnFromTag(ColumnOrder[I]).Index := I;
      if Assigned(FOnColumnDragged) then FOnColumnDragged(Self);
    finally
      FListColumns.EndUpdate;
      FUpdatingColumnOrder := False;
    end;
  end;

  procedure DoBufferedPaint(DC: HDC; Rect: TRect);
  var
    MemDC: HDC;
    PaintBuffer: HPAINTBUFFER;
  begin
    PaintBuffer := BeginBufferedPaint(DC, Rect, BPBF_TOPDOWNDIB, nil, MemDC);
    try
      SendMessage(FHeaderHandle, WM_PRINTCLIENT, MemDC, PRF_CLIENT);
      BufferedPaintMakeOpaque(PaintBuffer, Rect);
    finally
      EndBufferedPaint(PaintBuffer, True);
    end;
  end;

var
  DC: HDC;
  PS: TPaintStruct;
  Form: TCustomForm;
begin
  try
    with Message do
    begin
      case Msg of
        WM_CAPTURECHANGED:
          if FUpdatingColumnOrder then UpdateColumnOrder;
        WM_NCHITTEST:
          with TWMNCHitTest(Message) do
            if csDesigning in ComponentState then
            begin
              Result := Winapi.Windows.HTTRANSPARENT;
              Exit;
            end;
        WM_NCDESTROY:
          begin
            Result := CallWindowProc(FDefHeaderProc, FHeaderHandle, Msg, WParam, LParam);
            FHeaderHandle := 0;
            FDefHeaderProc := nil;
            Exit;
          end;
        WM_PAINT:
          begin
            if DoubleBuffered and DwmCompositionEnabled then
            begin
              Form := GetParentForm(Self);
              if (Form <> nil) and Form.GlassFrame.FrameExtended and
                Form.GlassFrame.IntersectsControl(Self) then
              begin
                DC := BeginPaint(FHeaderHandle, PS);
                try
                  DoBufferedPaint(DC, PS.rcPaint);
                finally
                  EndPaint(FHeaderHandle, PS);
                end;
                Exit;
              end;
            end;
          end;
      end;
      Result := CallWindowProc(FDefHeaderProc, FHeaderHandle, Msg, WParam, LParam);
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TCustomListView.EditWndProc(var Message: TMessage);
var
  LWindowRect: TRect;
{$IFDEF CLR}
  KeyMsg: TWMKey;
{$ENDIF}
begin
  try
    with Message do
    begin
      case Msg of
        WM_KEYDOWN,
        WM_SYSKEYDOWN:
          begin
{$IFDEF CLR}
            KeyMsg := TWMKey.Create(Message);
            if DoKeyDown(KeyMsg) then
{$ELSE}
            if DoKeyDown(TWMKey(Message)) then
{$ENDIF}
              Exit;
          end;
        WM_CHAR:
          begin
{$IFDEF CLR}
            KeyMsg := TWMKey.Create(Message);
            if DoKeyPress(KeyMsg) then
{$ELSE}
            if DoKeyPress(TWMKey(Message)) then
{$ENDIF}
              Exit;
          end;
        WM_KEYUP,
        WM_SYSKEYUP:
          begin
{$IFDEF CLR}
            KeyMsg := TWMKey.Create(Message);
            if DoKeyUp(KeyMsg) then
{$ELSE}
            if DoKeyUp(TWMKey(Message)) then
{$ENDIF}
              Exit;
          end;
        CN_KEYDOWN,
        CN_CHAR, CN_SYSKEYDOWN,
        CN_SYSCHAR:
          begin
            WndProc(Message);
            Exit;
          end;
        CM_BUFFEREDPRINTCLIENT:
          if FInBufferedPrintClient then
          begin
            GetWindowRect(FEditHandle, LWindowRect);
            MapWindowPoints(0, FEditHandle, LWindowRect, 2);
            PerformBufferedPrintClient(FEditHandle, LWindowRect);
            FInBufferedPrintClient := False;
            Exit;
          end;
      end;
      Result := CallWindowProc(FDefEditProc, FEditHandle, Msg, WParam, LParam);
    end;
  except
    Application.HandleException(Self);
  end;
end;

procedure TCustomListView.UpdateItems(FirstIndex, LastIndex: Integer);
begin
  ListView_RedrawItems(Handle, FirstIndex, LastIndex);
end;

procedure TCustomListView.ResetExStyles;
var
  Styles: DWORD;
  TempImages: TCustomImageList;
begin
  if HandleAllocated then
  begin
    TempImages := nil;
    if StateImages <> nil then
    begin
      TempImages := StateImages;
      StateImages := nil;
    end;
    Styles := LVS_EX_SUBITEMIMAGES or LVS_EX_INFOTIP;
    if FCheckboxes then Styles := Styles or LVS_EX_CHECKBOXES;
    if FGridLines then Styles := Styles or LVS_EX_GRIDLINES;
    if FHotTrack then Styles := Styles or LVS_EX_TRACKSELECT;
    if FRowSelect then Styles := Styles or LVS_EX_FULLROWSELECT;
    if FFlatScrollBars then Styles := Styles or LVS_EX_FLATSB;
    if FFullDrag then Styles := Styles or LVS_EX_HEADERDRAGDROP;
    if FShowWorkAreas then Styles := Styles or LVS_EX_MULTIWORKAREAS; 
    if htHandPoint in FHotTrackStyles then
      Styles := Styles or LVS_EX_ONECLICKACTIVATE
    else if FHotTrackStyles * [htUnderlineHot, htUnderlineCold] <> [] then
      Styles := Styles or LVS_EX_TWOCLICKACTIVATE;
    if htUnderlineHot in FHotTrackStyles then
      Styles := Styles or LVS_EX_UNDERLINEHOT;
    if htUnderlineCold in FHotTrackStyles then
      Styles := Styles or LVS_EX_UNDERLINECOLD;
    ListView_SetExtendedListViewStyle(Handle, Styles);
    if TempImages <> nil then
      StateImages := TempImages;
  end;
end;

procedure TCustomListView.RestoreChecks;
var
  i: Integer;
  Value: Byte;
begin
  if not OwnerData then
    for i := 0 to Items.Count - 1 do
    begin
      if FCheckStream <> nil then
      begin
        FCheckStream.ReadBuffer(Value, SizeOf(Value));
        Items[i].Checked := Boolean(Value);
      end
      else
        Items[i].Checked := Items[i].FChecked;
    end;
  FCheckStream.Free;
  FCheckStream := nil;
end;

procedure TCustomListView.SaveChecks;
var
  i: Integer;
  Value: Boolean;
begin
 if OwnerData then Exit;
 if FCheckStream = nil then
    FCheckStream := TMemoryStream.Create
  else
    FCheckStream.Size := 0;
  for i := 0 to Items.Count - 1 do
  begin
    Value := Items[i].Checked;
    FCheckStream.WriteBuffer(Value, SizeOf(Value));
  end;
  FCheckStream.Position := 0;
end;

procedure TCustomListView.SetCheckboxes(Value: Boolean);
var
  I: Integer;
begin
  if FCheckboxes <> Value then
  begin
    if Value then
      SetStateImages(nil); //Cant have state images and checkboxes = true

    FCheckboxes := Value;
    ResetExStyles;
    if FCheckboxes then
      RestoreChecks
    else
      if not OwnerData then
        for I := 0 to Items.Count - 1 do
          Items[I].FChecked := (ListView_GetCheckState(Handle, Items[I].Index) <> 0)
  end;
end;

procedure TCustomListView.SetGridLines(Value: Boolean);
begin
  if FGridLines <> Value then
  begin
    FGridLines := Value;
    ResetExStyles;
  end;
end;

procedure TCustomListView.SetHotTrack(Value: Boolean);
begin
  if FHotTrack <> Value then
  begin
    FHotTrack := Value;
    ResetExStyles;
  end;
end;

procedure TCustomListView.SetHotTrackStyles(Value: TListHotTrackStyles);
begin
  if FHotTrackStyles <> Value then
  begin
    FHotTrackStyles := Value;
    ResetExStyles;
  end;
end;

procedure TCustomListView.SetOwnerData(Value: Boolean);
begin
  if FOwnerData <> Value then
  begin
    Items.Clear;
    FOwnerData := Value;
    RecreateWnd;
  end;
end;

procedure TCustomListView.SetOwnerDraw(Value: Boolean);
begin
  if FOwnerDraw <> Value then
  begin
    FOwnerDraw := Value;
    RecreateWnd;
  end;
end;

procedure TCustomListView.SetRowSelect(Value: Boolean);
begin
  if FRowSelect <> Value then
  begin
    FRowSelect := Value;
    ResetExStyles;
  end;
end;

procedure TCustomListView.SetFlatScrollBars(Value: Boolean);
begin
  if FFlatScrollBars <> Value then
  begin
    FFlatScrollBars := Value;
    ResetExStyles;
  end;
end;

procedure TCustomListView.SetFullDrag(Value: Boolean);
begin
  if FFullDrag <> Value then
  begin
    FFullDrag := Value;
    ResetExStyles;
  end;
end;

procedure TCustomListView.SetBorderStyle(Value: TBorderStyle);
begin
  if BorderStyle <> Value then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TCustomListView.SetColumnClick(Value: Boolean);
begin
  if ColumnClick <> Value then
  begin
    FColumnClick := Value;
    RecreateWnd;
  end;
end;

procedure TCustomListView.SetItemIndex(const Value: Integer);
begin
  if Value < 0 then
  begin
    if Selected <> nil then
      Selected.Selected := False
  end
  else
  begin
    Items[Value].Selected := True;
    ItemFocused := Items[Value];
  end;
end;

procedure TCustomListView.SetMultiSelect(Value: Boolean);
begin
  if Value <> MultiSelect then
  begin
    FMultiSelect := Value;
    RecreateWnd;
  end;
end;

procedure TCustomListView.SetColumnHeaders(Value: Boolean);
begin
  if Value <> ShowColumnHeaders then
  begin
    FShowColumnHeaders := Value;
    RecreateWnd;
  end;
end;

procedure TCustomListView.SetTextColor(Value: TColor);
begin
  ListView_SetTextColor(Handle, ColorToRGB(Font.Color));
end;

procedure TCustomListView.SetTextBkColor(Value: TColor);
begin
  ListView_SetTextBkColor(Handle, ColorToRGB(Color));
  ListView_SetBkColor(Handle, ColorToRGB(Color));
end;

procedure TCustomListView.SetAllocBy(Value: Integer);
begin
  if AllocBy <> Value then
  begin
    FAllocBy := Value;
    if HandleAllocated then ListView_SetItemCount(Handle, Value);
  end;
end;

procedure TCustomListView.CMColorChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated then SetTextBkColor(Color);
end;

procedure TCustomListView.CMCtl3DChanged(var Message: TMessage);
begin
  if FBorderStyle = bsSingle then RecreateWnd;
  inherited;
end;

procedure TCustomListView.WMNotify(var Message: TWMNotify);
var
  Col: TListColumn;
  P: TPoint;
  hChildWnd: HWND;
  hdhti: THDHitTestInfo;
{$IFDEF CLR}
  WndClass: StringBuilder;
  HDItem: THDItem;
  Hdr: TNMHdr;
  Notify: THDNotify;
  LMessage: TWMNotifyLV;
{$ELSE}
  WndClass: string;
{$ENDIF}
begin
  inherited;
{$IFDEF CLR}
  Hdr := Message.NMHdr;
  with Hdr do
{$ELSE}
  with Message.NMHdr^ do
{$ENDIF}
  begin
    if ValidHeaderHandle and (hWndFrom = FHeaderHandle) then
      case code of
        HDN_ENDTRACKA, HDN_ENDTRACKW:
          begin
{$IFDEF CLR}
            LMessage := TWMNotifyLV.Create(Message.OriginalMessage);
            Notify := LMessage.HDNotify;
            HDItem := THDItem(Marshal.PtrToStructure(Notify.PItem, TypeOf(THDItem)));
            with HDItem, Notify do
            begin
{$ELSE}
            with PHDNotify(Pointer(Message.NMHdr))^, PItem^ do
{$ENDIF}
              if (Mask and HDI_WIDTH) <> 0 then
                begin
                  Col := GetColumnFromTag(Item);
                  if Col.MinWidth >= cxy then
                    cxy := Col.MinWidth
                  else
                    if (Col.MaxWidth > 0) and (Col.MaxWidth <= cxy) then
                      cxy := Col.MaxWidth;
                  Col.Width := cxy;
                end;
{$IFDEF CLR}
              Marshal.StructureToPtr(TObject(HDItem), PItem, False);
            end;
            LMessage.HDNotify := Notify;
            Message := TWMNotify.Create(LMessage.OriginalMessage);
{$ENDIF}
          end;
        HDN_ENDDRAG:
          FUpdatingColumnOrder := True;
        HDN_DIVIDERDBLCLICKA, HDN_DIVIDERDBLCLICKW:
{$IFDEF CLR}
          with Hdr, TWMNotifyLV.Create(Message.OriginalMessage).HDNotify do
{$ELSE}
          with PHDNotify(Pointer(Message.NMHdr))^ do
{$ENDIF}
          begin
            Col := GetColumnFromTag(Item);
            Col.Width := ListView_GetColumnWidth(Handle, Item);
            if IsCustomDrawn(dtControl, cdPrePaint) then
              Invalidate;
          end;
        NM_RCLICK:
          begin
            P := SmallPoint(GetMessagePos);
            hChildWnd := ChildWindowFromPoint(Handle, ScreenToClient(P));
            if (hChildWnd <> 0) and (hChildWnd <> Handle) then
            begin
{$IFDEF CLR}
              WndClass := StringBuilder.Create(80);
              WndClass.Length := GetClassName(hChildWnd, WndClass, WndClass.Capacity);
              if WndClass.ToString = 'SysHeader32' then
{$ELSE}
              SetLength(WndClass, 80);
              SetLength(WndClass, GetClassName(hChildWnd, PChar(WndClass), Length(WndClass)));
              if WndClass = 'SysHeader32' then
{$ENDIF}
              begin
                hdhti.Point := ScreenToClient(P);
                hdhti.Point.X := hdhti.Point.X + GetScrollPos(Handle, SB_HORZ);
                if SendStructMessage(hChildWnd, HDM_HITTEST, 1, hdhti) >= 0 then
                  ColRightClick(GetColumnFromTag(hdhti.Item), hdhti.Point);
              end;
            end;
          end;
      end;
  end;
end;

function TCustomListView.ColumnsShowing: Boolean;
begin
  Result := (ViewStyle = vsReport);
end;

function TCustomListView.ValidHeaderHandle: Boolean;
begin
  Result := FHeaderHandle <> 0;
end;

procedure TCustomListView.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated then
  begin
    SetTextColor(Font.Color);
    if ValidHeaderHandle then
      InvalidateRect(FHeaderHandle, nil, True);
  end;
end;

procedure TCustomListView.SetHideSelection(Value: Boolean);
begin
  if Value <> HideSelection then
  begin
    FHideSelection := Value;
    RecreateWnd;
  end;
end;

procedure TCustomListView.SetReadOnly(Value: Boolean);
begin
  if Value <> ReadOnly then
  begin
    FReadOnly := Value;
    RecreateWnd;
  end;
end;

procedure TCustomListView.SetIconOptions(Value: TIconOptions);
begin
  with FIconOptions do
  begin
    Arrangement := Value.Arrangement;
    AutoArrange := Value.AutoArrange;
    WrapText := Value.WrapText;
  end;
end;

procedure TCustomListView.SetViewStyle(Value: TViewStyle);
const
  ViewStyles: array[TViewStyle] of Integer = (LVS_ICON, LVS_SMALLICON,
    LVS_LIST, LVS_REPORT);
var
  Style: Longint;
begin
  if Value <> FViewStyle then
  begin
    FViewStyle := Value;
    if HandleAllocated then
    begin
      Style := GetWindowLong(Handle, GWL_STYLE);
      Style := Style and (not LVS_TYPEMASK);
      Style := Style or Integer(ViewStyles[FViewStyle]);
      SetWindowLong(Handle, GWL_STYLE, Style);
      UpdateColumns;
      case ViewStyle of
        vsIcon,
        vsSmallIcon:
          if IconOptions.Arrangement = iaTop then
            Arrange(arAlignTop) else
            Arrange(arAlignLeft);
      end;
      if not (csLoading in ComponentState) then
        RecreateWnd;
    end;
  end;
end;

procedure TCustomListView.WMParentNotify(var Message: TWMParentNotify);
begin
  with Message do
    if (Event = WM_CREATE) and (FHeaderHandle = 0) then
    begin
      FHeaderHandle := ChildWnd;
      FDefHeaderProc := TWindowProcPtr(GetWindowLong(FHeaderHandle, GWL_WNDPROC));
{$IFDEF CLR}
      SetWindowLong(FHeaderHandle, GWL_WNDPROC, FLVInstances.FHeaderInstance);
{$ELSE}
      SetWindowLong(FHeaderHandle, GWL_WNDPROC, Winapi.Windows.LPARAM(FHeaderInstance));
{$ENDIF}
    end;
  inherited;
end;

function TCustomListView.GetItemIndex(Value: TListItem): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to Items.Count - 1 do if Items[I] = Value then Break;
  if I < Items.Count then Result := I;
end;

function TCustomListView.GetItemIndex: Integer;
begin
  Result := -1;
  if Selected <> nil then
    Result := Selected.Index;
end;

function TCustomListView.GetListColumnsClass: TListColumnsClass;
begin
  Result := TListColumns;
end;

function TCustomListView.OwnerDataFetch(Item: TListItem; Request: TItemRequest): Boolean;
begin
  if Assigned(FOnData) then
  begin
    FOnData(Self, Item);
    Result := True;
  end
  else Result := False;
end;

function TCustomListView.OwnerDataFind(Find: TItemFind; const FindString: string;
  const FindPosition: TPoint; FindData: TCustomData; StartIndex: Integer;
  Direction: TSearchDirection; Wrap: Boolean): Integer;
begin
  Result := -1;
  if Assigned(FOnDataFind) then
    FOnDataFind(Self, Find, FindString, FindPosition, FindData, StartIndex,
      Direction, Wrap, Result);
end;

function TCustomListView.OwnerDataHint(StartIndex, EndIndex: Integer): Boolean;
begin
  if Assigned(FOnDataHint) then
  begin
    FOnDataHint(Self, StartIndex, EndIndex);
    Result := True;
  end
  else Result := False;
end;

function TCustomListView.OwnerDataStateChange(StartIndex, EndIndex: Integer;
  OldState, NewState: TItemStates): Boolean;
begin
  if Assigned(FOnDataStateChange) then
  begin
    FOnDataStateChange(Self, StartIndex, EndIndex, OldState, NewState);
    Result := True;
  end
  else Result := False;
end;

function TCustomListView.CreateListItem: TListItem;
var
  LClass: TListItemClass;
begin
  LClass := TListItem;
  if Assigned(FOnCreateItemClass) then
    FOnCreateItemClass(Self, LClass);
  Result := LClass.Create(Items);
end;

function TCustomListView.CreateListItems: TListItems;
begin
  Result := TListItems.Create(Self);
end;

function TCustomListView.GetItem(Value: TLVItem): TListItem;
var
  S: string;
  Request: TItemRequest;

  function ConvertMask(Mask: Longint): TItemRequest;
  begin
    Result := [];
    if Mask and LVIF_TEXT <> 0 then
      Include(Result, irText);
    if Mask and LVIF_IMAGE <> 0 then
      Include(Result, irImage);
    if Mask and LVIF_PARAM <> 0 then
      Include(Result, irParam);
    if Mask and LVIF_STATE <> 0 then
      Include(Result, irState);
    if Mask and LVIF_INDENT <> 0 then
      Include(Result, irIndent);
  end;

begin
  with Value do
    if (mask and LVIF_PARAM) <> 0 then
{$IFDEF CLR}
      Result := TListItem(FListItems.FItemHashTable.Item[TObject(Integer(lParam))])
{$ELSE}
      Result := TListItem(lParam)
{$ENDIF}
    else
    begin
      if OwnerData then
      begin
        if iItem < 0 then
          Result := nil
        else
          if iSubItem = 0 then
          begin
            Request := ConvertMask(mask);
            FTempItem.FIndex := iItem;
{$IFDEF CLR}
            if lParam <> 0 then
              FTempItem.FData := TListItem(FListItems.FItemHashTable.Item[TObject(Integer(lParam))])
            else
              FTempItem.FData := nil;
            FTempItem.FSubItems.Clear;
            if (irText in Request) and (pszText <> nil) then
              S := Marshal.PtrToStringAuto(pszText)
{$ELSE}
            FTempItem.FData := Pointer(lParam);
            FTempItem.FSubItems.Clear;
            if (irText in Request) and (pszText <> nil) then
              S := StrPas(pszText) 
{$ENDIF}
            else
              S := '';
            FTempItem.FCaption := S;
            if irImage in Request then
              FTempItem.FImageIndex := iImage;
            if irIndent in Request then
              FTempItem.FIndent := iIndent;
            OwnerDataFetch(FTempItem, Request);
            Result := FTempItem;
          end
          else
            Result := FTempItem;
      end
      else
        Result := Items[IItem];
    end;
end;

function TCustomListView.GetSelCount: Integer;
begin
  Result := ListView_GetSelectedCount(Handle);
end;

procedure TCustomListView.CNNotify(var Message: TWMNotifyLV);
var
  Item: TListItem;
  I: Integer;
  R: TRect;
  DefaultDraw: Boolean;
  ItemFind: TItemFind;
  FindString: string;
  FindPos: TPoint;
  FindData: TCustomData;
  LSubItem: Integer;
  SearchDir: TSearchDirection;
  TmpItem: TLVItem;
  SubItem: Boolean;
  SubItemImage: Integer;
  LogFont: TLogFont;
  SaveIndex: Integer;
{$IFDEF CLR}
  Notify: THDNotify;
  HDItem: THDItem;
  LVCustomDraw: TNMLVCustomDraw;
  DispInfo: TLVDispInfo;
  Buffer: TBytes;
{$ELSE}
  LVCustomDraw: PNMLVCustomDraw;
  DispInfo: PLVDispInfo;
{$ENDIF}

  function ConvertFlags(Flags: Integer): TItemFind;
  begin
    if Flags and LVFI_PARAM <> 0 then
      Result := ifData
    else if Flags and LVFI_PARTIAL <> 0 then
      Result := ifPartialString
    else if Flags and LVFI_STRING <> 0 then
      Result := ifExactString
    else if Flags and LVFI_NEARESTXY <> 0 then
      Result := ifNearest
    else
      Result := ifData; // Fall-back value
  end;

  function ConvertStates(State: Integer): TItemStates;
  begin
    Result := [];
    if State and LVIS_ACTIVATING <> 0 then
      Include(Result, isActivating);
    if State and LVIS_CUT <> 0 then
      Include(Result, isCut);
    if State and LVIS_DROPHILITED <> 0 then
      Include(Result, isDropHilited);
    if State and LVIS_FOCUSED <> 0 then
      Include(Result, isFocused);
    if State and LVIS_SELECTED <> 0 then
      Include(Result, isSelected);
  end;

begin
  with Message do
    case NMHdr.code of
      HDN_TRACKA, HDN_TRACKW:
        begin
{$IFDEF CLR}
          Notify := Message.HDNotify;
          HDItem := THDItem(Marshal.PtrToStructure(Notify.PItem, TypeOf(THDItem)));
          with Notify, HDItem do
{$ELSE}
          with PHDNotify(Pointer(Message.NMHdr))^, PItem^ do
{$ENDIF}
            if ((Mask and HDI_WIDTH) <> 0) then
            begin
              if Column[Item].MinWidth >= cxy then
                Column[Item].Width := Column[Item].MinWidth
              else
                if Column[Item].MaxWidth <= cxy then
                  Column[Item].Width := Column[Item].MaxWidth;
            end;
          end;
      NM_CUSTOMDRAW:
        if Assigned(FCanvas) then
          with NMCustomDraw{$IFNDEF CLR}^{$ENDIF} do
          try
            FCanvas.Lock;
            Result := CDRF_DODEFAULT;

            if (dwDrawStage and CDDS_ITEM) = 0 then
            begin
              R := ClientRect;
              case dwDrawStage of
                CDDS_PREPAINT:
                begin
                  if IsCustomDrawn(dtControl, cdPrePaint) then
                  begin
                    try
                      FCanvas.Handle := hdc;
                      FCanvas.Font := Font;
                      FCanvas.Brush := Brush;
                      DefaultDraw := CustomDraw(R, cdPrePaint);
                    finally
                      FCanvas.Handle := 0;
                    end;
                    if not DefaultDraw then
                    begin
                      Result := CDRF_SKIPDEFAULT;
                      Exit;
                    end;
                  end;
                  if IsCustomDrawn(dtItem, cdPrePaint) or IsCustomDrawn(dtItem, cdPreErase) then
                    Result := CDRF_NOTIFYITEMDRAW;
                  if IsCustomDrawn(dtItem, cdPostPaint) then
                    Result := Result or CDRF_NOTIFYPOSTPAINT;
                  if IsCustomDrawn(dtItem, cdPostErase) then
                    Result := Result or CDRF_NOTIFYPOSTERASE;
                  if IsCustomDrawn(dtSubItem, cdPrePaint) or IsCustomDrawn(dtSubItem, cdPostPaint) then
                    Result := Result or CDRF_NOTIFYSUBITEMDRAW;
                end;
                CDDS_POSTPAINT:
                  if IsCustomDrawn(dtControl, cdPostPaint) then
                    CustomDraw(R, cdPostPaint);
                CDDS_PREERASE:
                  if IsCustomDrawn(dtControl, cdPreErase) then
                    CustomDraw(R, cdPreErase);
                CDDS_POSTERASE:
                  if IsCustomDrawn(dtControl, cdPostErase) then
                    CustomDraw(R, cdPostErase);
              end;
            end else
            begin
              LVCustomDraw := NMLVCustomDraw;
              SubItem := dwDrawStage and CDDS_SUBITEM <> 0;
              { Don't call CustomDrawSubItem for the 0th subitem since
                CustomDrawItem draws that item. }
              if SubItem and (LVCustomDraw.iSubItem = 0) then Exit;
              LSubItem := LVCustomDraw.iSubItem;
{$IFNDEF CLR}
              FillChar(TmpItem, SizeOf(TmpItem), 0);
{$ENDIF}
              TmpItem.iItem := dwItemSpec;

              if (dwDrawStage and CDDS_ITEMPREPAINT) = CDDS_ITEMPREPAINT then
              begin
                SaveIndex := SaveDC(hdc);
                try
                  FCanvas.Handle := hdc;
                  FCanvas.Font := Font;
                  FCanvas.Brush := Brush;
                  FCanvas.Font.OnChange := CanvasChanged;
                  FCanvas.Brush.OnChange := CanvasChanged;
                  FCanvasChanged := False;
                  if SubItem then
                    DefaultDraw := CustomDrawSubItem(GetItem(TmpItem),
                      LSubItem, TCustomDrawState(Word(uItemState)), cdPrePaint)
                  else
                    DefaultDraw := CustomDrawItem(GetItem(TmpItem),
                      TCustomDrawState(Word(uItemState)), cdPrePaint);
                  if not DefaultDraw then
                  begin
                    Result := Result or CDRF_SKIPDEFAULT;
                    Exit;
                  end
                  else if FCanvasChanged then
                  begin
                    FCanvasChanged := False;
                    FCanvas.Font.OnChange := nil;
                    FCanvas.Brush.OnChange := nil;
                    with LVCustomDraw{$IFNDEF CLR}^{$ENDIF} do
                    begin
                      clrText := ColorToRGB(FCanvas.Font.Color);
                      clrTextBk := ColorToRGB(FCanvas.Brush.Color);
{$IFDEF CLR}
                      if GetObject(FCanvas.Font.Handle, Marshal.SizeOf(LogFont), LogFont) <> 0 then
{$ELSE}
                      if GetObject(FCanvas.Font.Handle, SizeOf(LogFont), @LogFont) <> 0 then
{$ENDIF}
                      begin
                        FCanvas.Handle := 0;  // disconnect from hdc
                        // release the font if it's been changed when painting
                        // the listview item, or a previous subitem
                        if SubItem and (FOurFont <> 0) and (FStockFont <> 0) then
                        begin
                          SelectObject(hdc, FStockFont);
                          DeleteObject(FOurFont);
                          FOurFont := 0;
                          FStockFont := 0;
                        end;
                        // don't delete the stock font
                        FOurFont := CreateFontIndirect(LogFont);
                        FStockFont := SelectObject(hdc, FOurFont);
                        Result := Result or CDRF_NEWFONT;
                      end;
                    end;
{$IFDEF CLR}
                    NMLVCustomDraw := LVCustomDraw;
{$ENDIF}
                  end;
                finally
                  FCanvas.Handle := 0;
                  RestoreDC(hdc, SaveIndex);
                end;
                if not SubItem then
                begin
                  if IsCustomDrawn(dtSubItem, cdPrePaint) then
                    Result := Result or CDRF_NOTIFYSUBITEMDRAW;
                  if IsCustomDrawn(dtItem, cdPostPaint) then
                    Result := Result or CDRF_NOTIFYPOSTPAINT;
                  if IsCustomDrawn(dtItem, cdPostErase) then
                    Result := Result or CDRF_NOTIFYPOSTERASE;
                end else
                begin
                  if IsCustomDrawn(dtSubItem, cdPostPaint) then
                    Result := Result or CDRF_NOTIFYPOSTPAINT;
                  if IsCustomDrawn(dtSubItem, cdPostErase) then
                    Result := Result or CDRF_NOTIFYPOSTERASE;
                end;
              end
              else if (dwDrawStage and CDDS_ITEMPOSTPAINT) = CDDS_ITEMPOSTPAINT then
              begin
                SaveIndex := SaveDC(hdc);
                try
                  FCanvas.Handle := hdc;
                  FCanvas.Font := Font;
                  FCanvas.Brush := Brush;
                  if SubItem then
                    CustomDrawSubItem(GetItem(TmpItem),
                      LSubItem, TCustomDrawState(Word(uItemState)), cdPostPaint)
                  else
                    CustomDrawItem(GetItem(TmpItem),
                      TCustomDrawState(Word(uItemState)), cdPostPaint);
                finally
                  FCanvas.Handle := 0;
                  RestoreDC(hdc, SaveIndex);
                end;

                //release the font we may have loaned during item drawing.
                if (FOurFont <> 0) and (FStockFont <> 0) then
                begin
                  SelectObject(hdc, FStockFont);
                  DeleteObject(FOurFont);
                  FOurFont := 0;
                  FStockFont := 0;
                end;
              end
              else if (dwDrawStage and CDDS_ITEMPREERASE) = CDDS_ITEMPREERASE then
              begin
                if SubItem then
                  CustomDrawSubItem(GetItem(TmpItem),
                    LSubItem, TCustomDrawState(Word(uItemState)), cdPreErase)
                else
                  CustomDrawItem(GetItem(TmpItem),
                    TCustomDrawState(Word(uItemState)), cdPreErase);
              end
              else if (dwDrawStage and CDDS_ITEMPOSTERASE) = CDDS_ITEMPOSTERASE then
              begin
                if SubItem then
                  CustomDrawSubItem(GetItem(TmpItem),
                    LSubItem, TCustomDrawState(Word(uItemState)), cdPostErase)
                else
                  CustomDrawItem(GetItem(TmpItem),
                    TCustomDrawState(Word(uItemState)), cdPostErase);
              end;
            end;
          finally
            FCanvas.Unlock;
          end;
      LVN_BEGINDRAG:
        FDragIndex := NMListView.iItem;
      LVN_DELETEITEM:
        begin
{$IFDEF CLR}
          Delete(TListItem(FListItems.FItemHashTable.Item[TObject(Integer(NMListView.lParam))]));
{$ELSE}
          Delete(TListItem(PNMListView(NMHdr)^.lParam));
{$ENDIF}
          Result := 1;
        end;
      LVN_DELETEALLITEMS:
        begin
          FDeletingAllItems := True;
          try
            for I := Items.Count - 1 downto 0 do
              Delete(Items[I]);
          finally
            FDeletingAllItems := False;
          end;
          Result := 1;
        end;
      LVN_GETDISPINFOA, LVN_GETDISPINFOW:
        begin
          DispInfo := LVDispInfo;
          Item := GetItem(DispInfo.item);
          with DispInfo.item do
          begin
            if (mask and LVIF_TEXT) <> 0 then
              if iSubItem = 0 then
              begin
{$IFDEF CLR}
                Buffer := PlatformBytesOf(Copy(Item.Caption, 1, cchTextMax - 1) + #0);
                Marshal.Copy(Buffer, 0, pszText, Length(Buffer));
{$ELSE}
                StrPLCopy(pszText, Item.Caption, cchTextMax - 1);
{$ENDIF}
              end
              else
                with Item.SubItems do
                  if iSubItem <= Count then
{$IFDEF CLR}
                  begin
                    Buffer := PlatformBytesOf(Copy(Strings[iSubItem - 1], 1, cchTextMax - 1) + #0);
                    Marshal.Copy(Buffer, 0, pszText, Length(Buffer));
                  end
                  else
                    Marshal.WriteInt16(pszText, 0);
{$ELSE}
                    StrPLCopy(pszText, Strings[iSubItem - 1], cchTextMax - 1)
                  else pszText[0] := #0;
{$ENDIF}
            if (mask and LVIF_IMAGE) <> 0 then
            begin
              if iSubItem = 0 then
              begin
                GetImageIndex(Item);
                iImage := Item.ImageIndex;
                if Assigned(FStateImages) then
                begin
                  state := IndexToStateImageMask(Item.StateIndex + 1);
                  stateMask := $F000;
                  mask := mask or LVIF_STATE;
                end;
              end
              else
                if (iSubItem-1 >= 0) and (iSubItem-1 < Item.FSubItems.Count) then
                begin
                  SubItemImage := Item.SubItemImages[iSubItem-1];
                  GetSubItemImage(Item, iSubItem-1, SubItemImage);
                  iImage := SubItemImage;
                end;
{$IFDEF CLR}
              LVDispInfo := DispInfo;
{$ENDIF}
            end;
            if (mask and LVIF_INDENT) <> 0 then
            begin
              iIndent := Item.Indent;
{$IFDEF CLR}
              LVDispInfo := DispInfo;
{$ENDIF}
            end;
          end;
        end;

      LVN_ODCACHEHINT:
        with NMLVCacheHint{$IFNDEF CLR}^{$ENDIF} do
          OwnerDataHint(iFrom, iTo);
      LVN_ODFINDITEMA, LVN_ODFINDITEMW:
        with NMLVFindItem{$IFNDEF CLR}^{$ENDIF} do
        begin
          ItemFind := ConvertFlags(lvfi.flags);
          FindData := nil;
          FindString := '';
          FindPos := Point(0,0);
          SearchDir := sdAll;
          case ItemFind of
            ifData: FindData := TCustomData(lvfi.lParam);
            ifPartialString, ifExactString:
              if lvfi.psz <> nil then
{$IFDEF CLR}
                FindString := Marshal.PtrToStringAuto(lvfi.psz) else
{$ELSE}
                FindString := StrPas(lvfi.psz) else
{$ENDIF}
                FindString := '';
            ifNearest:
              begin
                FindPos := lvfi.pt;
                case lvfi.vkDirection of
                  VK_LEFT: SearchDir := sdLeft;
                  VK_UP: SearchDir := sdAbove;
                  VK_RIGHT: SearchDir := sdRight;
                  VK_DOWN: SearchDir := sdBelow;
                end;
              end;
          end;
          Result := OwnerDataFind(ConvertFlags(lvfi.flags), FindString, FindPos,
            FindData, iStart, SearchDir, lvfi.flags and LVFI_WRAP <> 0);
        end;
      LVN_ODSTATECHANGED:
        with NMLVODStateChange{$IFNDEF CLR}^{$ENDIF} do
          OwnerDataStateChange(iFrom, iTo, ConvertStates(uNewState),
            ConvertStates(uOldState));

      LVN_BEGINLABELEDITA, LVN_BEGINLABELEDITW:
        begin
          Item := GetItem(LVDispInfo.item);
          if not CanEdit(Item) then Result := 1;
          if Result = 0 then
          begin
            FEditHandle := ListView_GetEditControl(Handle);
            FDefEditProc := TWindowProcPtr(GetWindowLong(FEditHandle, GWL_WNDPROC));
{$IFDEF CLR}
            SetWindowLong(FEditHandle, GWL_WNDPROC, FLVInstances.FEditInstance);
{$ELSE}
            SetWindowLong(FEditHandle, GWL_WNDPROC, Winapi.Windows.LPARAM(FEditInstance));
{$ENDIF}
          end;
        end;
      LVN_ENDLABELEDITA, LVN_ENDLABELEDITW:
        with LVDispInfo{$IFNDEF CLR}^{$ENDIF} do
          if (item.pszText <> nil) and (item.IItem <> -1) then
            Edit(item);
      LVN_COLUMNCLICK:
        ColClick(GetColumnFromTag(NMListView.iSubItem));
      LVN_INSERTITEM:
        InsertItem(Items[NMListView.iItem]);
      LVN_ITEMCHANGING:
        with NMListView{$IFNDEF CLR}^{$ENDIF} do
          if not CanChange(Items[iItem], uChanged) then Result := 1;
      LVN_ITEMCHANGED:
        with NMListView{$IFNDEF CLR}^{$ENDIF} do
        begin
          if Reading then
            Exit;
          Item := Items[iItem];
          Change(Item, uChanged);
          if (uChanged = LVIF_STATE) then
          begin
            if (uOldState and LVIS_SELECTED <> 0) and
              (uNewState and LVIS_SELECTED = 0) then
              DoSelectItem(Item, False)
            else if (uOldState and LVIS_SELECTED = 0) and
              (uNewState and LVIS_SELECTED <> 0) then
              DoSelectItem(Item, True);
          end;
          if (Action <> nil) and not (csDesigning in ComponentState) and
             (ActionLink <> nil) then
            ActionLink.Execute(Self);
          if Assigned(FOnItemChecked) and (uChanged = LVIF_STATE) and
             (((uOldState and LVIS_STATEIMAGEMASK) shr 12) <>
             ((uNewState and LVIS_STATEIMAGEMASK) shr 12)) then
          begin
            FOnItemChecked(Self, Item);
          end;
        end;
      LVN_GETINFOTIPA, LVN_GETINFOTIPW:
        if Assigned(FOnInfoTip) then
          Application.ActivateHint(Mouse.CursorPos);
      NM_CLICK:
        FClicked := True;
      NM_RCLICK:
        FRClicked := True;
    end;
end;

procedure TCustomListView.DoSelectItem(Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    // Copied from TLinkObservers.ListSelectionChanged
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
    begin
      if TLinkObservers.EditLinkIsEditing(Observers) then
      begin
        TLinkObservers.EditLinkModified(Observers);
        TLinkObservers.EditLinkTrackUpdate(Observers);
        if Observers.IsObserving(TObserverMapping.PositionLinkID) then
          TLinkObservers.PositionLinkPosChanged(Observers);
      end
      else
        // Reset may cause stack overflow
        // Instead, TCustomListView.CanChange is used to prevent editing
        // TLinkObservers.EditLinkReset(Observers);
    end
    else
      TLinkObservers.ListSelectionChanged(Observers);
  end;
  if Assigned(FOnSelectItem) then
    FOnSelectItem(Self, Item, Selected);
end;

{$IFDEF CLR}
type
  TLVCompareWrapper = record
    SortProc: TLVCompareProc;
    Data: TTag;
  end;
{$ENDIF}

{$IFDEF CLR}
function TCustomListView.CustomListViewSort(AnItem1, AnItem2: Longint;
  lParam: Integer): Integer;
var
  Item1, Item2: TListItem;
  CompareWrapper: TLVCompareWrapper;
begin
  if AnItem1 <> 0 then
    Item1 := TListItem(FListItems.FItemHashTable.Item[TObject(Integer(AnItem1))])
  else
    Item1 := nil;
  if AnItem2 <> 0 then
    Item2 := TListItem(FListItems.FItemHashTable.Item[TObject(Integer(AnItem2))])
  else
    Item2 := nil;

  // Extract SortProc, Data from wrapper structure and call SortProc
  CompareWrapper := TLVCompareWrapper(GCHandle(IntPtr(lParam)).Target);
  Result := CompareWrapper.SortProc(Item1, Item2, CompareWrapper.Data);
end;
{$ENDIF}

{$IFDEF CLR}
function TCustomListView.DefaultListViewSort(Item1, Item2: TListItem;
  lParam: TTag): Integer;
begin
  if Assigned(Item1) then
    with Item1 do
      if Assigned(OnCompare) then
        OnCompare(ListView, Item1, Item2, lParam, Result)
      else if Assigned(Item2) then
        Result := CompareText(Item1.Caption, Item2.Caption)
      else
        Result := 1
  else
    Result := -1;
end;
{$ENDIF}

procedure TCustomListView.ChangeScale(M, D: Integer; isDpiChange: Boolean);
var
  I: Integer;
begin
  for I := 0 to Columns.Count-1 do
    if (Columns[I].Width <> LVSCW_AUTOSIZE) and
      (Columns[I].Width <> LVSCW_AUTOSIZE_USEHEADER) then
      Columns[I].Width := MulDiv(Columns[I].Width, M, D);
  inherited ChangeScale(M, D, isDPiChange);
end;

procedure TCustomListView.ColClick(Column: TListColumn);
begin
  if Assigned(FOnColumnClick) then FOnColumnClick(Self, Column);
end;

procedure TCustomListView.ColRightClick(Column: TListColumn; Point: TPoint);
begin
  if Assigned(FOnColumnRightClick) then FOnColumnRightClick(Self, Column, Point);
end;

procedure TCustomListView.InsertItem(Item: TListItem);
begin
  if not Reading and Assigned(FOnInsert) then
    FOnInsert(Self, Item);
end;

procedure TCustomListView.AddItem(Item: string; AObject: TObject);
begin
  with Items.Add do
  begin
    Caption := Item;
    Data := AObject;
  end;
end;

function TCustomListView.CanChange(Item: TListItem; Change: Integer): Boolean;
var
  ItemChange: TItemChange;
begin
  Result := True;
  case Change of
    LVIF_TEXT: ItemChange := ctText;
    LVIF_IMAGE: ItemChange := ctImage;
    LVIF_STATE: ItemChange := ctState;
  else
    Exit;
  end;
  if not Reading and Assigned(FOnChanging) then
    FOnChanging(Self, Item, ItemChange, Result);

  if ItemChange = ctState then
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      if TLinkObservers.GetEditLink(Observers).Updating then
        Result := True
      else if not TLinkObservers.EditLinkEdit(Observers) then
        Result := False;
end;

function TCustomListView.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True
  else if ID = TObserverMapping.PositionLinkID then
    Result := True
  else if ID = TObserverMapping.ControlValueID then
    Result := True;
end;

procedure TCustomListView.Change(Item: TListItem; Change: Integer);
var
  ItemChange: TItemChange;
begin
  case Change of
    LVIF_TEXT: ItemChange := ctText;
    LVIF_IMAGE: ItemChange := ctImage;
    LVIF_STATE: ItemChange := ctState;
  else
    Exit;
  end;
  if not Reading and Assigned(FOnChange) then
    FOnChange(Self, Item, ItemChange);
end;

procedure TCustomListView.Delete(Item: TListItem);
begin
  if (Item <> nil) and not Item.FProcessedDeleting then
  begin
    if not (csRecreating in ControlState) and Assigned(FOnDeletion) then
      FOnDeletion(Self, Item);
    Item.FProcessedDeleting := True;
    Item.Delete;
  end;
end;

function TCustomListView.CanEdit(Item: TListItem): Boolean;
begin
  Result := True;
  if Assigned(FOnEditing) then FOnEditing(Self, Item, Result);
end;

procedure TCustomListView.Edit(const Item: TLVItem);
var
  S: string;
  EditItem: TListItem;
begin
  with Item do
  begin
{$IFDEF CLR}
    S := Marshal.PtrToStringAuto(pszText);
{$ELSE}
    S := pszText;
{$ENDIF}
    EditItem := GetItem(Item);
    if Assigned(FOnEdited) then
      FOnEdited(Self, EditItem, S);
    if EditItem <> nil then
      EditItem.Caption := S;
  end;
end;

function TCustomListView.IsEditing: Boolean;
var
  ControlHand: HWnd;
begin
  ControlHand := ListView_GetEditControl(Handle);
  Result := (ControlHand <> 0) and IsWindowVisible(ControlHand);
end;

function TCustomListView.GetDragImages: TDragImageList;
begin
  if SelCount = 1 then
    Result := FDragImage else
    Result := nil;
end;

procedure TCustomListView.WndProc(var Message: TMessage);
{$IFDEF CLR}
var
  MouseMsg: TWMMouse;
{$ENDIF}
begin
  if not (csDesigning in ComponentState) and ((Message.Msg = WM_LBUTTONDOWN) or
    (Message.Msg = WM_LBUTTONDBLCLK)) and not Dragging and (DragMode = dmAutomatic) then
  begin
{$IFDEF CLR}
    MouseMsg := TWMMouse.Create(Message);
    if not IsControlMouseMsg(MouseMsg) then
{$ELSE}
    if not IsControlMouseMsg(TWMMouse(Message)) then
{$ENDIF}
    begin
      ControlState := ControlState + [csLButtonDown];
      Dispatch(Message);
    end;
  end
  else
    if (Message.Msg = CM_THEMECHANGED) and not (csLoading in ComponentState) then
    begin
      RecreateWnd;
      if ViewStyle = vsReport then
        UpdateColumns;
    end
    else if (Message.Msg = CM_SYSCOLORCHANGE) and not (csLoading in ComponentState) then
      RecreateWnd
    else if not (((Message.Msg = WM_PAINT) or (Message.Msg = WM_ERASEBKGND)) and
      Items.FNoRedraw) then
        inherited WndProc(Message);
end;

procedure TCustomListView.DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiPan then
  begin
    Handled := True;
    if gfBegin in EventInfo.Flags then
      FPanPoint := EventInfo.Location
    else if not (gfEnd in EventInfo.Flags) then
    begin
      ListView_Scroll(Handle, -(EventInfo.Location.X - FPanPoint.X),
        -(EventInfo.Location.Y - FPanPoint.Y));
      FPanPoint := EventInfo.Location
                                            
    end;
  end;
end;

procedure TCustomListView.DoStartDrag(var DragObject: TDragObject);
var
  P, P1: TPoint;
  ImageHandle: HImageList;
  DragItem: TListItem;
begin
  inherited DoStartDrag(DragObject);
  FLastDropTarget := nil;
  GetCursorPos(P);
  P := ScreenToClient(P);
  if FDragIndex <> -1 then
    DragItem := Items[FDragIndex]
    else DragItem := nil;
  FDragIndex := -1;
  if DragItem = nil then
    with P do DragItem := GetItemAt(X, Y);
  if DragItem <> nil then
  begin
    ImageHandle := ListView_CreateDragImage(Handle, DragItem.Index, P1);
    if ImageHandle <> 0 then
      with FDragImage do
      begin
        Handle := ImageHandle;
        with P, DragItem.DisplayRect(drBounds) do
          SetDragImage(0, X - Left , Y - Top);
      end;
  end;
end;

procedure TCustomListView.DoEndDrag(Target: TObject; X, Y: Integer);

begin
  inherited DoEndDrag(Target, X, Y);
  FDragImage.EndDrag;
  FLastDropTarget := nil;
end;

procedure TCustomListView.CMDrag(var Message: TCMDrag);
var
  I: Integer;
  Item: TListItem;
begin
  inherited;
  with Message, DragRec{$IFNDEF CLR}^{$ENDIF} do
    case DragMessage of
      dmDragMove: with ScreenToClient(Pos) do DoDragOver(Source, X, Y, Message.Result <> 0);
      dmDragLeave:
        begin
          TDragObject(Source).HideDragImage;
          FLastDropTarget := DropTarget;
          DropTarget := nil;
          Update;
          TDragObject(Source).ShowDragImage;
        end;
      dmDragDrop:
        begin
          FLastDropTarget := nil;
          { ListView_GetNextItem always returns nil for OwnerData = True and
            LVNI_ALL and LVNI_DROPHIGHLITED, so it is necessary to find the
            DropTarget and reset it by iterating through all items, starting
            with the first one that's visible }
          if OwnerData then
          begin
            if ViewStyle in [vsIcon, vsSmallIcon] then
              Item := GetNearestItem(Point(0, 0), sdAll)
            else
              Item := TopItem;
            if Item <> nil then
            for I := Item.Index to Items.Count - 1 do
              if Items[I].DropTarget then
              begin
                Items[I].DropTarget := False;
                Exit;
              end;
            end;
        end;
    end
end;

procedure TCustomListView.CMExit(var Message: TCMExit);
begin
  try
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      TLinkObservers.EditLinkUpdate(Observers);
    if Observers.IsObserving(TObserverMapping.ControlValueID) then
      TLinkObservers.ControlValueUpdate(Observers);
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TCustomListView.DoDragOver(Source: TDragObject; X, Y: Integer; CanDrop: Boolean);
var
  Item: TListItem;
  Target: TListItem;
begin
  Item := GetItemAt(X, Y);
  if Item <> nil then
  begin
    Target := DropTarget;
    if (Item <> Target) or (Item = FLastDropTarget) then
    begin
      FLastDropTarget := nil;
      TDragObject(Source).HideDragImage;
      Update;
      if Target <> nil then
        Target.DropTarget := False;
      Item.DropTarget := CanDrop;
      Update;
      TDragObject(Source).ShowDragImage;
    end;
  end;
end;

procedure TCustomListView.SetItems(Value: TListItems);
begin
  FListItems.Assign(Value);
end;

procedure TCustomListView.SetListColumns(Value: TListColumns);
begin
  FListColumns.Assign(Value);
end;

procedure TCustomListView.SetListGroups(Value: TListGroups);
begin
  FListGroups.Assign(Value);
end;

{$IFDEF CLR}
function TCustomListView.CustomSort(SortProc: TLVCompareProc; Data: TTag): Boolean;
var
  lParam: LongInt;
  CompareWrapper: TLVCompareWrapper;
begin
  Result := False;
  if HandleAllocated then
  begin
    if not Assigned(SortProc) then
      CompareWrapper.SortProc := DefaultListViewSort
    else
      CompareWrapper.SortProc := SortProc;
    CompareWrapper.Data := Data;

    lParam := THandle(IntPtr(GCHandle.Alloc(CompareWrapper)));
    try
      Result := ListView_SortItems(Handle, CustomListViewSort, lParam);
    finally
      GCHandle(IntPtr(lParam)).Free;
    end;
  end;
end;
{$ELSE}
function TCustomListView.CustomSort(SortProc: TLVCompare; lParam: LPARAM): Boolean;
begin
  Result := False;
  if HandleAllocated then
  begin
    if not Assigned(SortProc) then SortProc := @DefaultListViewSort;
    Result := ListView_SortItems(Handle, SortProc, lParam);
  end;
end;
{$ENDIF}

function TCustomListView.AlphaSort: Boolean;
begin
  if HandleAllocated then
{$IFDEF CLR}
    Result := CustomSort(nil, nil)
{$ELSE}
    Result := ListView_SortItems(Handle, @DefaultListViewSort, 0)
{$ENDIF}
  else
    Result := False;
end;

procedure TCustomListView.SetSortType(Value: TSortType);
begin
  if SortType <> Value then
  begin
    FSortType := Value;
    if ((SortType in [stData, stBoth]) and Assigned(OnCompare)) or
      (SortType in [stText, stBoth]) then
      AlphaSort;
  end;
end;

function TCustomListView.GetVisibleRowCount: Integer;
begin
  if ViewStyle in [vsReport, vsList] then
    Result := ListView_GetCountPerPage(Handle)
  else Result := 0;
end;

function TCustomListView.GetViewOrigin: TPoint;
begin
  ListView_GetOrigin(Handle, Result);
end;

function TCustomListView.GetTopItem: TListItem;
var
  Index: Integer;
begin
  Result := nil;
  if not (ViewStyle in [vsSmallIcon, vsIcon]) then
  begin
    Index := ListView_GetTopIndex(Handle);
    if Index <> -1 then Result := Items[Index];
  end;
end;

function TCustomListView.GetBoundingRect: TRect;
begin
  ListView_GetViewRect(Handle, Result);
end;

procedure TCustomListView.Scroll(DX, DY: Integer);
begin
  ListView_Scroll(Handle, DX, DY);
end;

procedure TCustomListView.SetGroupHeaderImages(Value: TCustomImageList);
begin
  if GroupHeaderImages <> Value then
  begin
    if GroupHeaderImages <> nil then
      GroupHeaderImages.UnRegisterChanges(FHeaderChangeLink);
    FGroupHeaderImages := Value;
    if GroupHeaderImages <> nil then
    begin
      GroupHeaderImages.RegisterChanges(FHeaderChangeLink);
      GroupHeaderImages.FreeNotification(Self);
      SetImageList(GroupHeaderImages.Handle, LVSIL_GROUPHEADER)
    end
    else SetImageList(0, LVSIL_GROUPHEADER);
    Invalidate;
  end;
end;

procedure TCustomListView.SetLargeImages(Value: TCustomImageList);
begin
  if LargeImages <> Value then
  begin
    if LargeImages <> nil then
      LargeImages.UnRegisterChanges(FLargeChangeLink);
    FLargeImages := Value;
    if LargeImages <> nil then
    begin
      LargeImages.RegisterChanges(FLargeChangeLink);
      LargeImages.FreeNotification(Self);
      SetImageList(LargeImages.Handle, LVSIL_NORMAL)
    end
    else SetImageList(0, LVSIL_NORMAL);
    Invalidate;
  end;
end;

procedure TCustomListView.SetSmallImages(Value: TCustomImageList);
begin
  if Value <> SmallImages then
  begin
    if SmallImages <> nil then
      SmallImages.UnRegisterChanges(FSmallChangeLink);
    FSmallImages := Value;
    if SmallImages <> nil then
    begin
      SmallImages.RegisterChanges(FSmallChangeLink);
      SmallImages.FreeNotification(Self);
      SetImageList(SmallImages.Handle, LVSIL_SMALL)
    end
    else SetImageList(0, LVSIL_SMALL);
    Invalidate;
  end;
end;

procedure TCustomListView.SetStateImages(Value: TCustomImageList);
begin
  if StateImages <> Value then
  begin
    if StateImages <> nil then
      StateImages.UnRegisterChanges(FStateChangeLink);
    FStateImages := Value;
    if StateImages <> nil then
    begin
      SetCheckboxes(False);
      StateImages.RegisterChanges(FStateChangeLink);
      StateImages.FreeNotification(Self);
      SetImageList(StateImages.Handle, LVSIL_STATE);
    end
    else
    begin
      SetImageList(0, LVSIL_STATE);
      if CheckBoxes then
      begin
        CheckBoxes := False;
        CheckBoxes := True;
      end;
    end;
    Invalidate;
  end;
end;

function TCustomListView.GetColumnFromIndex(Index: Integer): TListColumn;
begin
  Result := FListColumns[Index];
end;

function TCustomListView.FindCaption(StartIndex: Integer; Value: string;
  Partial, Inclusive, Wrap: Boolean): TListItem;
const
  FullString: array[Boolean] of Integer = (0, LVFI_PARTIAL);
  Wraps: array[Boolean] of Integer = (0, LVFI_WRAP);
var
  Info: TLVFindInfo;
  Index: Integer;
begin
  with Info do
  begin
    flags := LVFI_STRING or FullString[Partial] or Wraps[Wrap];
{$IFDEF CLR}
    psz := Marshal.StringToHGlobalAuto(Value);
{$ELSE}
    psz := PChar(Value);
{$ENDIF}
  end;
  try
    if Inclusive then
      Dec(StartIndex);
    Index := ListView_FindItem(Handle, StartIndex, Info);
    if Index <> -1 then
      Result := Items[Index]
    else
      Result := nil;
  finally
{$IFDEF CLR}
    Marshal.FreeHGlobal(Info.psz);
{$ENDIF}
  end;
end;

function TCustomListView.FindData(StartIndex: Integer; Value: TCustomData;
  Inclusive, Wrap: Boolean): TListItem;
var
  I: Integer;
  Item: TListItem;
begin
  Result := nil;
  if Inclusive then Dec(StartIndex);
  for I := StartIndex + 1 to Items.Count - 1 do
  begin
    Item := Items[I];
    if (Item <> nil) and (Item.Data = Value) then
    begin
      Result := Item;
      Exit;
    end;
  end;
  if Wrap then
  begin
    if Inclusive then
      Inc(StartIndex);
    for I := 0 to StartIndex - 1 do
    begin
      Item := Items[I];
      if (Item <> nil) and (Item.Data = Value) then
      begin
        Result := Item;
        Exit;
      end;
    end;
  end;
end;

function TCustomListView.GetHitTestInfoAt(X, Y: Integer): THitTests;
var
  HitTest: TLVHitTestInfo;
begin
  Result := [];
  with HitTest do
  begin
    pt.X := X;
    pt.Y := Y;
    ListView_HitTest(Handle, HitTest);

    //! WINBUG: LVHT_ABOVE and LVHT_ONITEMSTATEICON have the same value!
    //! We can determine whether a LVHT_ABOVE ocurred ourselves by checking
    //! whether the Y is below 0, and whether a LVHT_ONITEMSTATEICON ocurred
    //! by
    if ((flags and LVHT_ABOVE) <> 0) and (Y < 0) then Include(Result, htAbove);
    if (flags and LVHT_BELOW) <> 0 then Include(Result, htBelow);
    if (flags and LVHT_NOWHERE) <> 0 then Include(Result, htNowhere);
    if (flags and LVHT_ONITEM) = LVHT_ONITEM then
      Include(Result, htOnItem)
    else
    begin
      if (flags and LVHT_ONITEMICON) <> 0 then Include(Result, htOnIcon);
      if (flags and LVHT_ONITEMLABEL) <> 0 then Include(Result, htOnLabel);
      if (flags and LVHT_ONITEMSTATEICON) <> 0 then Include(Result, htOnStateIcon);
    end;
    if (flags and LVHT_TOLEFT) <> 0 then Include(Result, htToLeft);
    if (flags and LVHT_TORIGHT) <> 0 then Include(Result, htToRight);
  end;
end;

function TCustomListView.GetSelected: TListItem;
begin
  Result := GetNextItem(nil, sdAll, [isSelected]);
end;

procedure TCustomListView.SetSelected(Value: TListItem);
var
  I: Integer;
begin
  if Value <> nil then Value.Selected := True
  else begin
    Value := Selected;
    for I := 0 to SelCount - 1 do
      if Value <> nil then
      begin
        Value.Selected := False;
        Value := GetNextItem(Value, sdAll, [isSelected]);
      end;                                            
  end;
end;

function TCustomListView.GetDropTarget: TListItem;
begin
  Result := GetNextItem(nil, sdAll, [isDropHilited]);
  if Result = nil then
    Result := FLastDropTarget;
end;

procedure TCustomListView.SetDropTarget(Value: TListItem);
begin
  if HandleAllocated then
    if Value <> nil then Value.DropTarget := True
    else begin
      Value := DropTarget;
      if Value <> nil then Value.DropTarget := False;
    end;
end;

function TCustomListView.GetFocused: TListItem;
begin
  Result := GetNextItem(nil, sdAll, [isFocused]);
end;

procedure TCustomListView.SetFocused(Value: TListItem);
begin
  if HandleAllocated then
    if Value <> nil then Value.Focused := True
    else begin
      Value := ItemFocused;
      if Value <> nil then Value.Focused := False;
    end;
end;

procedure TCustomListView.GetImageIndex(Item: TListItem);
begin
  if Assigned(FOnGetImageIndex) then FOnGetImageIndex(Self, Item);
end;

function TCustomListView.GetNextItem(StartItem: TListItem;
  Direction: TSearchDirection; States: TItemStates): TListItem;
var
  Flags, Index: Integer;
begin
  Result := nil;
  if HandleAllocated then
  begin
    Flags := 0;
    case Direction of
      sdAbove: Flags := LVNI_ABOVE;
      sdBelow: Flags := LVNI_BELOW;
      sdLeft: Flags := LVNI_TOLEFT;
      sdRight: Flags := LVNI_TORIGHT;
      sdAll: Flags := LVNI_ALL;
    end;
    if StartItem <> nil then Index := StartItem.Index
    else Index := -1;
    if isCut in States then Flags := Flags or LVNI_CUT;
    if isDropHilited in States then Flags := Flags or LVNI_DROPHILITED;
    if isFocused in States then Flags := Flags or LVNI_FOCUSED;
    if isSelected in States then Flags := Flags or LVNI_SELECTED;
    Index := ListView_GetNextItem(Handle, Index, Flags);
    if Index <> -1 then Result := Items[Index];
  end;
end;

function TCustomListView.GetNearestItem(Point: TPoint;
  Direction: TSearchDirection): TListItem;
const
  Directions: array[TSearchDirection] of Integer = (VK_LEFT, VK_RIGHT,
    VK_UP, VK_DOWN, 0);
var
  Info: TLVFindInfo;
  Index: Integer;
begin
  with Info do
  begin
    flags := LVFI_NEARESTXY;
    pt := Point;
    vkDirection := Directions[Direction];
  end;
  Index := ListView_FindItem(Handle, -1, Info);
  if Index <> -1 then Result := Items[Index]
  else Result := nil;
end;

function TCustomListView.GetItemAt(X, Y: Integer): TListItem;
var
  Info: TLVHitTestInfo;
var
  Index: Integer;
begin
  Result := nil;
  if HandleAllocated then
  begin
    Info.pt := Point(X, Y);
    Index := ListView_HitTest(Handle, Info);
    if Index <> -1 then Result := Items[Index];
  end;
end;

procedure TCustomListView.Arrange(Code: TListArrangement);
const
  Codes: array[TListArrangement] of Longint = (LVA_ALIGNBOTTOM,
    LVA_ALIGNLEFT, LVA_ALIGNRIGHT, LVA_ALIGNTOP, LVA_DEFAULT, LVA_SNAPTOGRID);
begin
  ListView_Arrange(Handle, Codes[Code]);
end;

function TCustomListView.StringWidth(S: string): Integer;
begin
{$IFDEF CLR}
  Result := ListView_GetStringWidth(Handle, S);
{$ELSE}
  Result := ListView_GetStringWidth(Handle, PChar(S));
{$ENDIF}
end;

procedure TCustomListView.UpdateColumns;
var
  I: Integer;
begin
  if HandleAllocated and not FUpdatingColumnOrder then
    for I := 0 to Columns.Count - 1 do UpdateColumn(I);
end;

procedure TCustomListView.UpdateGroups;
var
  I: Integer;
  GroupIDs: array of Integer;
begin
  for I := 0 to Groups.Count -1 do
  begin
    if Groups[I].FDescriptionTop <> '' then
    begin
      if (Groups[I].FTitleImage > -1) and (Trim(Groups[I].FHeader) = '') then
        Groups[I].FHeader := Groups[I].FDescriptionTop;
      Groups[I].FDescriptionTop := '';
    end;
    if Groups[I].FDescriptionBottom <> '' then
    begin
      if (Groups[I].FTitleImage > -1) and (Trim(Groups[I].FSubtitle) = '') then
        Groups[I].FSubtitle := Groups[I].FDescriptionBottom;
      Groups[I].FDescriptionBottom := '';
    end;
  end;
  if HandleAllocated then
  begin
    if not OwnerData then
    begin
      SetLength(GroupIDs, Items.Count);

      for I := 0 to Items.Count - 1 do
      begin
        GroupIDs[I] := Items[I].GroupID;
        Items[I].GroupID := -1;
      end;

      for I := 0 to Groups.Count - 1 do
        UpdateGroup(I);

      for I := 0 to Items.Count - 1 do
        Items[I].GroupID := GroupIDs[I];
    end
    else
      for I := 0 to Groups.Count - 1 do
        UpdateGroup(I);
  end;
end;

procedure TCustomListView.UpdateGroup(AnIndex: Integer);
var
  Group: TLVGroup;
begin
  if HandleAllocated then
  begin
{$IFNDEF CLR}
    ZeroMemory(@Group, SizeOf(Group));
{$ENDIF}
    with Group, Groups.Items[AnIndex] do
    begin
      ListView_RemoveGroup(Handle, Groups.Items[AnIndex].GroupID);

      mask := LVGF_HEADER or LVGF_STATE or LVGF_ALIGN;

      if Footer <> '' then
        mask := mask or LVGF_FOOTER;
      uAlign := 0;
{$IFDEF CLR}
      cbSize := Marshal.SizeOf(TypeOf(Group));
      if (FHeaderAlign = taCenter) and (FTitleImage > -1) then
      begin
        pszHeader := Marshal.StringToHGLobalUni('');
        pszSubtitle := Marshal.StringToHGLobalUni('');
        pszDescriptionTop := Marshal.StringToHGLobalUni(Header);
        pszDescriptionBottom := Marshal.StringToHGLobalUni(Subtitle);
      end
      else
      begin
        pszHeader := Marshal.StringToHGLobalUni(Header);
        pszSubtitle := Marshal.StringToHGLobalUni(Subtitle);
        pszDescriptionTop := Marshal.StringToHGLobalUni('');
        pszDescriptionBottom := Marshal.StringToHGLobalUni('');
      end;
      pszFooter := Marshal.StringToHGlobalUni(Footer);
      try
{$ELSE}
      cbSize := SizeOf(Group);
      if (FHeaderAlign = taCenter) and (FTitleImage > -1) then
      begin
        pszHeader := PWideChar('');
        pszSubtitle := PWideChar('');
        pszDescriptionTop := PWideChar(UnicodeString(Header));
        pszDescriptionBottom := PWideChar(UnicodeString(Subtitle));
      end
      else
      begin
        pszHeader := PWideChar(UnicodeString(Header));
        pszSubtitle := PWideChar(UnicodeString(Subtitle));
        pszDescriptionTop := PWideChar('');
        pszDescriptionBottom := PWideChar('');
      end;

      pszFooter := PWideChar(UnicodeString(Footer));
{$ENDIF}

      Group.stateMask := 0;
      Group.state := 0;
      if lgsNormal in Groups.Items[AnIndex].FState then
        Group.state := Group.state or LVGS_NORMAL;
      if lgsHidden in Groups.Items[AnIndex].FState then
        Group.state := Group.state or LVGS_HIDDEN;

      if CheckWin32Version(6) then
      begin
        if lgsNoHeader in Groups.Items[AnIndex].FState then
          Group.state := Group.state or LVGS_NOHEADER;
        if lgsCollapsible in Groups.Items[AnIndex].FState then
          Group.state := Group.state or LVGS_COLLAPSIBLE;
        if lgsCollapsed in Groups.Items[AnIndex].FState then
          Group.state := Group.state or LVGS_COLLAPSED;
        if lgsFocused in Groups.Items[AnIndex].FState then
          Group.state := Group.state or LVGS_FOCUSED;
        if lgsSelected in Groups.Items[AnIndex].FState then
          Group.state := Group.state or LVGS_SELECTED;

        if FTitleImage > -1 then
          mask := mask or LVGF_TITLEIMAGE;
        iTitleImage := TitleImage;

        if (FHeaderAlign = taCenter) and (FTitleImage > -1) then
          mask := mask or LVGF_DESCRIPTIONTOP;

        if Subtitle <> '' then
          if (FHeaderAlign = taCenter) and (FTitleImage > -1) then
            mask := mask or LVGF_DESCRIPTIONBOTTOM or LVGF_SUBTITLE
          else
            mask := mask or LVGF_SUBTITLE;

        if FooterAlign = taLeftJustify then
          uAlign := uAlign or LVGA_FOOTER_LEFT
        else if FooterAlign = taRightJustify then
          uAlign := uAlign or LVGA_FOOTER_RIGHT
        else if FooterAlign = taCenter then
          uAlign := uAlign or LVGA_FOOTER_CENTER;
      end;

      if HeaderAlign = taLeftJustify then
        uAlign := uAlign or LVGA_HEADER_LEFT
      else if HeaderAlign = taRightJustify then
        uAlign := uAlign or LVGA_HEADER_RIGHT
      else if HeaderAlign = taCenter then
        uAlign := uAlign or LVGA_HEADER_CENTER;


      mask := mask or LVGF_GROUPID;
      iGroupId := Groups[AnIndex].GroupID;
      ListView_InsertGroup(Handle, AnIndex, Group);

{$IFDEF CLR}
      finally
        Marshal.FreeHGlobal(pszHeader);
        Marshal.FreeHGlobal(pszFooter);
        Marshal.FreeHGlobal(pszSubtitle);
        Marshal.FreeHGlobal(pszDescriptionTop);
        Marshal.FreeHGlobal(pszDescriptionBottom);
      end;
{$ENDIF}
    end;
  end;
end;

procedure TCustomListView.UpdateColumn(AnIndex: Integer);
const
  IAlignment: array[Boolean, TAlignment] of LongInt =
    ((LVCFMT_LEFT, LVCFMT_RIGHT, LVCFMT_CENTER),
    (LVCFMT_RIGHT, LVCFMT_LEFT, LVCFMT_CENTER));
var
  Column: TLVColumn;
  AAlignment: TAlignment;
begin
  if HandleAllocated then
    with Column, Columns.Items[AnIndex] do
    begin
      mask := LVCF_TEXT or LVCF_FMT or LVCF_IMAGE;
      iImage := FImageIndex;
{$IFDEF CLR}
      pszText := Marshal.StringToHGLobalAuto(Caption);
      try
{$ELSE}
      pszText := PChar(Caption);
{$ENDIF}
        AAlignment := Alignment;
        if Index <> 0 then
          fmt := IAlignment[UseRightToLeftAlignment, AAlignment]
        else
          fmt := LVCFMT_LEFT;
        if FImageIndex <> -1 then
          fmt := fmt or LVCFMT_IMAGE or LVCFMT_COL_HAS_IMAGES
        else
          mask := mask and not LVCF_IMAGE;
        if WidthType > ColumnTextWidth then
        begin
          mask := mask or LVCF_WIDTH;
          cx := FWidth;
          ListView_SetColumn(Handle, Columns[AnIndex].FOrderTag, Column);
        end
        else
        begin
          ListView_SetColumn(Handle, Columns[AnIndex].FOrderTag, Column);
          if ViewStyle = vsList then
            ListView_SetColumnWidth(Handle, -1, WidthType)
          else
            if (ViewStyle = vsReport) and not OwnerData then
              ListView_SetColumnWidth(Handle, Columns[AnIndex].FOrderTag, WidthType);
        end;
{$IFDEF CLR}
      finally
        Marshal.FreeHGlobal(pszText);
      end;
{$ENDIF}
    end;
end;

procedure TCustomListView.WMLButtonDown(var Message: TWMLButtonDown);
var
  Item: TListItem;
  MousePos: TPoint;
  ShiftState: TShiftState;
begin
  SetFocus;
  ShiftState := KeysToShiftState(Message.Keys);
  FClicked := False;
  FDragIndex := -1;
  inherited;
  if (DragMode = dmAutomatic) and MultiSelect then
  begin
    if not (ssShift in ShiftState) and not (ssCtrl in ShiftState) then
    begin
      if not FClicked then
      begin
        Item := GetItemAt(Message.XPos, Message.YPos);
        if (Item <> nil) and Item.Selected then
        begin
          BeginDrag(False);
          Exit;
        end;
      end;
    end;
  end;
  if FClicked then
  begin
    GetCursorPos(MousePos);
    with PointToSmallPoint(ScreenToClient(MousePos)) do
      if not Dragging then
      begin
        Perform(WM_LBUTTONUP, 0, MakeLong(X, Y));
        FClicked := False;
      end
      else SendMessage(GetCapture, WM_LBUTTONUP, 0, MakeLong(X, Y));
  end
  else if (DragMode = dmAutomatic) and not (MultiSelect and
    ((ssShift in ShiftState) or (ssCtrl in ShiftState))) then
  begin
    Item := GetItemAt(Message.XPos, Message.YPos);
    if (Item <> nil) and Item.Selected then
      BeginDrag(False);
  end;
end;

procedure TCustomListView.DoAutoSize;
var
  I, Count, WorkWidth, TmpWidth, Remain: Integer;
  List: TList;
  Column: TListColumn;
begin
  { Try to fit all sections within client width }
  List := TList.Create;
  try
    WorkWidth := ClientWidth;
    for I := 0 to Columns.Count - 1 do
    begin
      Column := Columns[I];
      if Column.AutoSize then
        List.Add(Column)
      else
        Dec(WorkWidth, Column.Width);
    end;
    if List.Count > 0 then
    begin
      Columns.BeginUpdate;
      try
        repeat
          Count := List.Count;
          Remain := WorkWidth mod Count;
          { Try to redistribute sizes to those sections which can take it }
          TmpWidth := WorkWidth div Count;
          for I := Count - 1 downto 0 do
          begin
            Column := TListColumn(List[I]);
            if I = 0 then
              Inc(TmpWidth, Remain);
            Column.Width := TmpWidth;
          end;

          { Verify new sizes don't conflict with min/max section widths and
            adjust if necessary. }
          TmpWidth := WorkWidth div Count;
          for I := Count - 1 downto 0 do
          begin
            Column := TListColumn(List[I]);
            if I = 0 then
              Inc(TmpWidth, Remain);
            if Column.Width <> TmpWidth then
            begin
              List.Delete(I);
              Dec(WorkWidth, Column.Width);
            end;
          end;
        until (List.Count = 0) or (List.Count = Count);
      finally
        Columns.EndUpdate;
      end;
    end;
  finally
    List.Free;
  end;
end;

procedure TCustomListView.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  if not (csReading in ComponentState) and
     (Message.WindowPos.flags and SWP_NOSIZE = 0) and HandleAllocated then
    DoAutoSize;
  inherited;
end;

function TCustomListView.GetSearchString: string;
{$IFDEF CLR}
var
  Buffer: string; 
begin
  Result := '';
  if HandleAllocated and ListView_GetISearchString(Handle, Buffer) then
    Result := Buffer;
{$ELSE}
var
  Len: Integer;
begin
  Result := '';
  if HandleAllocated then
  begin
    Len := SendMessage(Handle, LVM_GETISEARCHSTRING, 0, 0);
    if Len > 0 then
    begin
      SetLength(Result, Len);
      ListView_GetISearchString(Handle, PChar(Result));
    end;
  end;
{$ENDIF}
end;

procedure TCustomListView.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
  SaveIndex: Integer;
begin
  if Assigned(FCanvas) then
  begin
    with Message.DrawItemStruct{$IFNDEF CLR}^{$ENDIF} do
    begin
      State := TOwnerDrawState(LoWord(itemState));
      SaveIndex := SaveDC(hDC);
      FCanvas.Lock;
      try
        FCanvas.Handle := hDC;
        FCanvas.Font := Font;
        FCanvas.Brush := Brush;
        if itemID = DWORD(-1) then
          FCanvas.FillRect(rcItem)
        else
          DrawItem(Items[itemID], rcItem, State);
      finally
        FCanvas.Handle := 0;
        FCanvas.Unlock;
        RestoreDC(hDC, SaveIndex);
      end;
    end;
    Message.Result := 1;
  end;
end;

{ CustomDraw support }

procedure TCustomListView.CanvasChanged;
begin
  FCanvasChanged := True;
end;

function TCustomListView.IsCustomDrawn(Target: TCustomDrawTarget;
  Stage: TCustomDrawStage): Boolean;
begin
  { List view doesn't support erase notifications }
  if Stage = cdPrePaint then
  begin
    if Target = dtSubItem then
      Result := Assigned(FOnCustomDrawSubItem) or Assigned(FOnAdvancedCustomDrawSubItem)
    else if Target = dtItem then
      Result := Assigned(FOnCustomDrawItem) or Assigned(FOnAdvancedCustomDrawItem) or
        Assigned(FOnCustomDrawSubItem) or Assigned(FOnAdvancedCustomDrawSubItem)
    else
      Result := Assigned(FOnCustomDraw) or Assigned(FOnAdvancedCustomDraw) or
        Assigned(FOnCustomDrawItem) or Assigned(FOnAdvancedCustomDrawItem) or
        Assigned(FOnCustomDrawSubItem) or Assigned(FOnAdvancedCustomDrawSubItem);
  end
  else
  begin
    if Target = dtSubItem then
      Result := Assigned(FOnAdvancedCustomDrawSubItem) or Assigned(FOnCustomDrawSubItem)
    else if Target = dtItem then
      Result := Assigned(FOnAdvancedCustomDrawItem) or Assigned(FOnCustomDrawItem)
    else
      Result := Assigned(FOnAdvancedCustomDraw) or Assigned(FOnAdvancedCustomDrawItem) or
        Assigned(FOnAdvancedCustomDrawSubItem);
  end;
end;

function TCustomListView.CustomDraw(const ARect: TRect; Stage: TCustomDrawStage): Boolean;
begin
  Result := True;
  if (Stage = cdPrePaint) and Assigned(FOnCustomDraw) then FOnCustomDraw(Self, ARect, Result);
  if Assigned(FOnAdvancedCustomDraw) then FOnAdvancedCustomDraw(Self, ARect, Stage, Result)
end;

function TCustomListView.CustomDrawItem(Item: TListItem; State: TCustomDrawState;
  Stage: TCustomDrawStage): Boolean;
begin
  Result := True;
  if (Stage = cdPrePaint) and Assigned(FOnCustomDrawItem) then FOnCustomDrawItem(Self, Item, State, Result);
  if Assigned(FOnAdvancedCustomDrawItem) then FOnAdvancedCustomDrawItem(Self, Item, State, Stage, Result);
end;

function TCustomListView.CustomDrawSubItem(Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; Stage: TCustomDrawStage): Boolean;
begin
  Result := True;
  if (Stage = cdPrePaint) and Assigned(FOnCustomDrawSubItem) then
    FOnCustomDrawSubItem(Self, Item, SubItem, State, Result);
  if Assigned(FOnAdvancedCustomDrawSubItem) then
    FOnAdvancedCustomDrawSubItem(Self, Item, SubItem, State, Stage, Result);
end;

procedure TCustomListView.DrawItem(Item: TListItem; Rect: TRect;
  State: TOwnerDrawState);
begin
  TControlCanvas(FCanvas).UpdateTextFlags;
  if Assigned(FOnDrawItem) then FOnDrawItem(Self, Item, Rect, State)
  else
  begin
    FCanvas.FillRect(Rect);
    FCanvas.TextOut(Rect.Left + 2, Rect.Top, Item.Caption);
  end;
end;

procedure TCustomListView.GetSubItemImage(Item: TListItem;
  SubItem: Integer; var ImageIndex: Integer);
begin
  if Assigned(FOnGetSubItemImage) and (SubItem < Item.SubItems.Count) and (SubItem >= 0) then
    FOnGetSubItemImage(Self, Item, SubItem, ImageIndex);
end;

procedure TCustomListView.DrawWorkAreas;
var
  I, dX, dY: Integer;
  R: TRect;
begin
  with FCanvas do
  begin
    Brush.Style := bsClear;
    for I := 0 to WorkAreas.Count-1 do
    begin
      Pen.Color := WorkAreas[I].Color;
      Pen.Style := psDot;
      dX := -GetViewOrigin.X;
      dY := -GetViewOrigin.Y;
      R := WorkAreas[I].Rect;
      OffsetRect(R, dX, dY);
      Rectangle(R.Left, R.Top, R.Right, R.Bottom);
      if WorkAreas[I].DisplayName <> '' then
      begin
        Pen.Style := psSolid;
        Font.Color := WorkAreas[I].Color;
        TextOut(R.Left, R.Bottom, WorkAreas[I].DisplayName);
      end;
    end;
  end;
end;

procedure TCustomListView.WMPaint(var Message: TWMPaint);
begin
  inherited;
  if (ViewStyle in [vsIcon, vsSmallIcon]) and FShowWorkAreas then
    DrawWorkAreas;
end;

procedure TCustomListView.SetShowWorkAreas(const Value: Boolean);
begin
  FShowWorkAreas := Value;
  Invalidate;
end;

{ InfoTip support }

procedure TCustomListView.CMHintShow(var Message: TCMHintShow);
var
  Item: TListItem;
  ItemRect: TRect;
  InfoTip: string;
{$IFDEF CLR}
  Info: THintInfo;
{$ELSE}
  Info: PHintInfo;
{$ENDIF}
begin
  if Assigned(FOnInfoTip) then
    with Message do
    begin
      Item := GetItemAt(HintInfo.CursorPos.X, HintInfo.CursorPos.Y);
      if Item <> nil then
      begin
        Info := HintInfo;
        InfoTip := Item.Caption;
        DoInfoTip(Item, InfoTip);
        ItemRect := Item.DisplayRect(drBounds);
        ItemRect.TopLeft := ClientToScreen(ItemRect.TopLeft);
        ItemRect.BottomRight := ClientToScreen(ItemRect.BottomRight);
        with Info{$IFNDEF CLR}^{$ENDIF} do
        begin
          CursorRect := ItemRect;
          HintStr := InfoTip;
          HintPos.Y := CursorRect.Top + GetSystemMetrics(SM_CYCURSOR);
          HintPos.X := CursorRect.Left + GetSystemMetrics(SM_CXCURSOR);
          HintMaxWidth := ClientWidth;
          Message.Result := 0;
        end;
{$IFDEF CLR}
        HintInfo := Info;
{$ENDIF}
      end;
    end
  else
    inherited;
end;

procedure TCustomListView.DoInfoTip(Item: TListItem; var InfoTip: string);
begin
  if Assigned(FOnInfoTip) then FOnInfoTip(Self, Item, InfoTip);
end;

procedure TCustomListView.SetHoverTime(Value: Integer);
begin
  if Value <> HoverTime then
  begin
    if HandleAllocated then
      ListView_SetHoverTime(Handle, Value)
    else
      FHoverTime := Value;
  end;
end;

procedure TCustomListView.SetGroupView(Value: Boolean);
begin
  if Value <> FGroupView then
  begin
    FGroupView := Value;
    if HandleAllocated then
    begin
      ListView_EnableGroupView(Handle, FGroupView);
    end;
  end;
end;

function TCustomListView.GetHoverTime: Integer;
begin
  if HandleAllocated then
    Result := ListView_GetHoverTime(Handle)
  else
    Result := FHoverTime;
end;

procedure TCustomListView.SaveIndents;
var
  I: Integer;
begin
  if OwnerData then Exit;
  SetLength(FSavedIndents, Items.Count);
  for I := 0 to Items.Count - 1 do
    FSavedIndents[I] := Items[I].Indent;
end;

procedure TCustomListView.RestoreIndents;
var
  I: Integer;
begin
  if OwnerData then Exit;
  if Length(FSavedIndents) = Items.Count then
  begin
    for I := 0 to Items.Count - 1 do
      Items[I].Indent := FSavedIndents[I];
  end;
  SetLength(FSavedIndents, 0);    
end;

function TCustomListView.AreItemsStored: Boolean;
begin
  if Assigned(Action) then
  begin
    if Action is TCustomListAction then
      Result := False
    else
      Result := True;
  end
  else
    Result := not OwnerData;
end;

procedure TCustomListView.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (GetItemAt(X, Y) <> nil) or not FClicked then
    inherited;
end;

function TCustomListView.GetColumnFromTag(Tag: Integer): TListColumn;
var
  I: Integer;
begin
  for I := 0 to Columns.Count - 1 do
  begin
    Result := Columns[I];
    if Result.FOrderTag = Tag then Exit;
  end;
  Result := nil;
end;

procedure TCustomListView.WMContextMenu(var Message: TWMContextMenu);
begin
  if not (csDesigning in ComponentState) then
    SetFocus;
  if InvalidPoint(Message.Pos) and (Selected <> nil) then
    Message.Pos := PointToSmallPoint(ClientToScreen(CenterPoint(Selected.DisplayRect(drSelectBounds))));
  inherited;
end;

procedure TCustomListView.WMCtlColorEdit(var Message: TMessage);
begin
  if (csGlassPaint in ControlState) and not FInBufferedPrintClient then
  begin
    FInBufferedPrintClient := True;
    PostMessage(FEditHandle, CM_BUFFEREDPRINTCLIENT, 0, 0);
  end
  else
    with Message do
      Result := DefWindowProc(Handle, Msg, WParam, LParam);
end;

procedure TCustomListView.ClearSelection;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
    Items[I].Selected := False;
end;

procedure TCustomListView.CopySelection(Destination: TCustomListControl);
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
    if Items[I].Selected then
{$IFDEF CLR}
      Destination.AddItem(Items[I].Caption, TObject(Items[I].Data));
{$ELSE}
      Destination.AddItem(Items[I].Caption, Items[I].Data);
{$ENDIF}
end;

procedure TCustomListView.DeleteSelected;
var
  I: Integer;
begin
  Items.BeginUpdate;
  try
    for I := Items.Count - 1 downto 0 do
      if Items[I].Selected then
        Delete(Items[I]);
  finally
    Items.EndUpdate;
  end;
end;

function TCustomListView.GetCount: Integer;
begin
  Result := Items.Count;
end;

procedure TCustomListView.SelectAll;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
    Items[I].Selected := True;
end;

procedure TCustomListView.Clear;
begin
  FListItems.BeginUpdate;
  try
    FListItems.Clear;
  finally
    FListItems.EndUpdate;
  end;
end;

function TCustomListView.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TListViewActionLink;
end;

procedure TCustomListView.ActionChange(Sender: TObject;
  CheckDefaults: Boolean);
begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TStaticListAction then
    with TStaticListAction(Sender) do
    begin
      if not CheckDefaults or (Self.SmallImages = nil) then
        Self.SmallImages := Images;
      if not CheckDefaults or (Self.ItemIndex <> -1) then
        Self.ItemIndex := ItemIndex;
    end;
end;

procedure TCustomListView.WMVScroll(var Message: TWMVScroll);
var
  Before,
  After: Integer;
begin
  if StyleServices.Enabled then
  begin
    Before := GetScrollPos(Handle, SB_VERT);
    inherited;
    After := GetScrollPos(Handle, SB_VERT);
    if (Before <> After) then
      InvalidateRect(Handle, nil, True);
  end
  else
    inherited;
end;

{ TListView }

class constructor TListView.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TListView, TListViewStyleHook);
end;

class destructor TListView.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TListView, TListViewStyleHook);
end;

{ TAnimate }

constructor TAnimate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReflector];
  Width := 100;
  Height := 80;
  AutoSize := True;
  FCenter := True;
  FStartFrame := 1;
  FTransparent := True;
end;

procedure TAnimate.CreateParams(var Params: TCreateParams);
const
  CenterStyles: array[Boolean] of DWORD = (0, ACS_CENTER);
  TimerStyles: array[Boolean] of DWORD = (0, ACS_TIMER);
  TransparentStyles: array[Boolean] of DWORD = (0, ACS_TRANSPARENT);
begin
  InitCommonControl(ICC_ANIMATE_CLASS);
  inherited CreateParams(Params);
  { In versions of COMCTL32.DLL earlier than 4.71 the ANIMATE common control
    requires that it be created in the same instance address space as the AVI
    resource. }
  if GetComCtlVersion < ComCtlVersionIE4 then
    Params.WindowClass.hInstance := GetActualResHandle;
  CreateSubClass(Params, ANIMATE_CLASS);
  with Params do
  begin
    Style := Style or CenterStyles[FCenter] or
      TimerStyles[FTimers] or TransparentStyles[FTransparent];
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
    { Make sure window class is unique per instance if running a version of
      COMCTl32.DLL which doesn't support loading an AVI resource from a separate
      address space. }
    if GetComCtlVersion < ComCtlVersionIE4 then
{$IFDEF CLR}
      WinClassName := Format('%s.%.8X:%.8X', [ClassName, HInstance, GetCurrentThreadID]);
{$ELSE}
      StrFmt(WinClassName, '%s.%.8X:%.8X', [ClassName, HInstance, GetCurrentThreadID]);
{$ENDIF}
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TAnimate.CreateWnd;
begin
  FRecreateNeeded := False;
  FOpen := False;
  inherited CreateWnd;
  UpdateActiveState;
end;

procedure TAnimate.DestroyWnd;
var
  OldActive, OldOpen: Boolean;
begin
  OldActive := FActive;
  OldOpen := FOpen;
  SetOpen(False);
  inherited DestroyWnd;
  FOpen := OldOpen;
  FActive := OldActive;
end;

procedure TAnimate.UpdateActiveState;
begin
  if not (csLoading in ComponentState) then
  begin
    { Attempt to open AVI and set active if applicable }
    SetOpen(True);
    if FActive then
    begin
      FActive := False;
      SetActive(True);
    end;
  end;
end;

procedure TAnimate.WMNCCalcSize(var Message: TWMNCCalcSize);
{$IFDEF CLR}
var
  Temp: TNCCalcSizeParams;
begin
  if csDesigning in ComponentState then
  begin
    Temp := Message.CalcSize_Params;
    InflateRect(Temp.rgrc0, -1, -1);
    Message.CalcSize_Params := Temp;
  end;
  inherited;
{$ELSE}
begin
  if csDesigning in ComponentState then
    with Message.CalcSize_Params^ do
      InflateRect(rgrc[0], -1, -1);
  inherited;
{$ENDIF}
end;

procedure TAnimate.WMNCHitTest(var Message: TWMNCHitTest);
begin
  with Message do
    if not (csDesigning in ComponentState) then
      Result := HTCLIENT
    else
      inherited;
end;

procedure TAnimate.WMNCPaint(var Message: TWMNCPaint);
var
  DC: HDC;
  R: TRect;
  Pen, SavePen: HPEN;
begin
  if csDesigning in ComponentState then
  begin
    { Get window DC that is clipped to the non-client area }
    DC := GetDCEx(Handle, 0, DCX_WINDOW or DCX_CACHE or DCX_CLIPSIBLINGS);
    try
      GetWindowRect(Handle, R);
      OffsetRect(R, -R.Left, -R.Top);
      with R do
      begin
        ExcludeClipRect(DC, Left+1, Top+1, Right-1, Bottom-1);
        Pen := CreatePen(PS_DASH, 1, clBlack);
        SavePen := SelectObject(DC, Pen);
        SetBkColor(DC, ColorToRGB(Color));
        Rectangle(DC, R.Left, R.Top, R.Right, R.Bottom);
        if SavePen <> 0 then SelectObject(DC, SavePen);
        DeleteObject(Pen);
      end;
    finally
      ReleaseDC(Handle, DC);
    end;
  end
  else inherited;
end;

procedure TAnimate.WMSize(var Message: TWMSize);
begin
  inherited;
end;

procedure TAnimate.WMWindowPosChanged(var Message: TWMWindowPosChanged);
var
  R: TRect;
begin
  inherited;
  InvalidateRect(Handle, nil, True);
  R := Rect(0, 0, FrameWidth, FrameHeight);
  if Center then
    OffsetRect(R, (ClientWidth - (R.Right - R.Left)) div 2,
      (ClientHeight - (R.Bottom - R.Top)) div 2);
  ValidateRect(Handle, R);
  UpdateWindow(Handle);
  InvalidateRect(Handle, R, False);
end;

procedure TAnimate.CMColorChanged(var Message: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) then
    RecreateWnd;
end;

procedure TAnimate.CNCommand(var Message: TWMCommand);
begin
  inherited;
  case Message.NotifyCode of
    ACN_START: DoStart;
    ACN_STOP:
      if FStopCount = 0 then
        DoStop
      else
        Dec(FStopCount);
  end;
end;

procedure TAnimate.DoOpen;
begin
  if Assigned(FOnOpen) then FOnOpen(Self);
end;

procedure TAnimate.DoClose;
begin
  if Assigned(FOnClose) then FOnClose(Self);
end;

procedure TAnimate.DoStart;
begin
  if Assigned(FOnStart) then FOnStart(Self);
  FActive := True;
end;

procedure TAnimate.DoStop;
begin
  if Assigned(FOnStop) then FOnStop(Self);
  FActive := False;
end;

procedure TAnimate.Loaded;
begin
  inherited Loaded;
  if FStreamedActive then SetActive(True);
end;

procedure TAnimate.GetAnimateParams(var Params: TAnimateParams);
begin
  with Params do
  begin
    FileName := FFileName;
    CommonAVI := FCommonAVI;
    ResHandle := FResHandle;
    ResName := FResName;
    ResId := FResId;
  end;
end;

procedure TAnimate.SetAnimateParams(const Params: TAnimateParams);
begin
  with Params do
  begin
    FFileName := FileName;
    FCommonAVI := CommonAVI;
    FResHandle := ResHandle;
    FResName := ResName;
    FResId := ResId;
  end;  
end;

type
{$IFDEF CLR}
  TResNameType = Integer;
{$ELSE}
  TResNameType = PChar;
{$ENDIF}

function TAnimate.GetActualResHandle: THandle;
const
  CommonAVIId: array[TCommonAVI] of Integer = (0, 150, 151, 152, 160, 161, 162,
    163, 164);
  ResType = 'AVI';
begin
  if FCommonAVI <> aviNone then
  begin
    if (Win32MajorVersion >= 6) then
    begin
      if FindResource(MainInstance, TResNameType(CommonAVIId[FCommonAVI]), ResType) <> 0 then
        Result := MainInstance
      else if FindResource(HInstance, TResNameType(CommonAVIId[FCommonAVI]), ResType) <> 0 then
        Result := HInstance
      else Result := GetShellModule;
    end
    else Result := GetShellModule;
  end
  else if FResHandle <> 0 then Result := FResHandle
  else if MainInstance <> 0 then Result := MainInstance
  else Result := HInstance;
end;

function TAnimate.GetActualResId: TAnimateResId;
const
  CommonAVIId: array[TCommonAVI] of Integer = (0, 150, 151, 152, 160, 161, 162,
    163, 164);
begin
  if FCommonAVI <> aviNone then Result := TAnimateResId(CommonAVIId[FCommonAVI])
  else if FFileName <> '' then Result := TAnimateResId(FFileName)
  else if FResName <> '' then Result := TAnimateResId(FResName)
  else Result := TAnimateResId(FResId);
end;

procedure TAnimate.GetFrameInfo;

  function CreateResStream: TStream;
  const
    ResType = 'AVI';
  var
    Instance: THandle;
{$IFDEF CLR}
    ResourceID: TObject;
{$ENDIF}
  begin
    { AVI is from a file }
    if FFileName <> '' then
      Result := TFileStream.Create(FFileName, fmOpenRead or fmShareDenyNone)
    else
    begin
      { AVI is from a resource }
      Instance := GetActualResHandle;
      if FResName <> '' then
        Result := TResourceStream.Create(Instance, FResName, ResType)
      else
{$IFDEF CLR}
      begin
        ResourceID := GetActualResId;
        if ResourceID is System.string then
          Result := TResourceStream.Create(Instance, string(ResourceID), ResType)
        else
          Result := TResourceStream.CreateFromID(Instance, Integer(ResourceID), ResType);
      end;
{$ELSE}
        Result := TResourceStream.CreateFromID(Instance, GetActualResId, ResType);
{$ENDIF}
    end;
  end;

const
  CountOffset = 48;
  WidthOffset = 64;
  HeightOffset = 68;
begin
  with CreateResStream do
  try
    if Seek(CountOffset, soBeginning) = CountOffset then
      ReadBuffer(FFrameCount, SizeOf(FFrameCount));
    if Seek(WidthOffset, soBeginning) = WidthOffset then
      ReadBuffer(FFrameWidth, SizeOf(FFrameWidth));
    if Seek(HeightOffset, soBeginning) = HeightOffset then
      ReadBuffer(FFrameHeight, SizeOf(FFrameHeight));
  finally
    Free;
  end;
end;

procedure TAnimate.SetActive(Value: Boolean);
begin
  if (csReading in ComponentState) then
  begin
    if Value then FStreamedActive := True;
  end
  else
  begin
    if FActive <> Value then
    begin
      if Value then
        Play(FStartFrame, FStopFrame, FRepetitions)
      else
        Stop;
    end;
  end;
end;

procedure TAnimate.SetCenter(Value: Boolean);
begin
  if FCenter <> Value then
  begin
    FCenter := Value;
    RecreateWnd;
  end;
end;

procedure TAnimate.SetCommonAVI(Value: TCommonAVI);
begin
  if FCommonAVI <> Value then
  begin
    FRecreateNeeded := (FCommonAVI = aviNone) and
      (GetComCtlVersion < ComCtlVersionIE4);
    FCommonAVI := Value;
    FFileName := '';
    FResHandle := 0;
    FResName := '';
    FResId := 0;
    if Value = aviNone then SetOpen(False) else Reset;
  end;
end;

procedure TAnimate.SetFileName(Value: string);
var
  Save: TAnimateParams;
begin
  if AnsiCompareText(FFileName, Value) <> 0 then
  begin
    GetAnimateParams(Save);
    try
      FFileName := Value;
      FCommonAVI := aviNone;
      FResHandle := 0;
      FResName := '';
      FResId := 0;
      if FFileName = '' then SetOpen(False) else Reset;
    except
      SetAnimateParams(Save);
      raise;
    end;
  end;
end;

procedure TAnimate.SetOpen(Value: Boolean);
begin
  if (FOpen <> Value) then
    if Value then
    begin
      FOpen := InternalOpen;
      if AutoSize then AdjustSize;
    end
    else FOpen := InternalClose;
end;

procedure TAnimate.SetRepetitions(Value: Integer);
begin
  if FRepetitions <> Value then
  begin
    FRepetitions := Value;
    if not (csLoading in ComponentState) then Stop;
  end;
end;

procedure TAnimate.SetResHandle(Value: THandle);
begin
  if FResHandle <> Value then       
  begin
    FResHandle := Value;
    FRecreateNeeded := GetComCtlVersion < ComCtlVersionIE4;
    FCommonAVI := aviNone;
    FFileName := '';
    SetOpen(False)
  end;
end;

procedure TAnimate.SetResId(Value: Integer);
begin
  if FResId <> Value then
  begin
    FResId := Value;
    FRecreateNeeded := ((FCommonAVI <> aviNone) or (FFileName <> '')) and
      (GetComCtlVersion < ComCtlVersionIE4);
    FCommonAVI := aviNone;
    FFileName := '';
    FResName := '';
    if Value = 0 then SetOpen(False) else Reset;
  end;
end;

procedure TAnimate.SetResName(Value: string);
begin
  if FResName <> Value then
  begin
    FResName := Value;
    FRecreateNeeded := (FCommonAVI <> aviNone) or (FFileName <> '') and
      (GetComCtlVersion < ComCtlVersionIE4);
    FCommonAVI := aviNone;
    FFileName := '';
    FResId := 0;
    if Value = '' then SetOpen(False) else Reset;
  end;
end;

procedure TAnimate.SetStartFrame(Value: Smallint);
begin
  if FStartFrame <> Value then
  begin
    FStartFrame := Value;
    if not (csLoading in ComponentState) then
    begin
      Stop;
      Seek(Value);
    end;
  end;
end;

procedure TAnimate.SetStopFrame(Value: Smallint);
begin
  if FStopFrame <> Value then
  begin
    FStopFrame := Value;
    if not (csLoading in ComponentState) then Stop;
  end;
end;

procedure TAnimate.SetTimers(Value: Boolean);
begin
  if FTimers <> Value then
  begin
    FTimers := Value;
    RecreateWnd;
  end;
end;

procedure TAnimate.SetTransparent(Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    RecreateWnd;
  end;
end;

procedure TAnimate.CheckOpen;
begin
  SetOpen(True);
  if not Open then
    raise Exception.CreateRes({$IFNDEF CLR}@{$ENDIF}SCannotOpenAVI);
end;

function TAnimate.InternalOpen: Boolean;
var
  R: TRect;
{$IFDEF CLR}
  ResId: TObject;
{$ENDIF}
begin
  if FRecreateNeeded then RecreateWnd;
  HandleNeeded;
  { Preserve dimensions to prevent auto sizing }
  if not Center then R := BoundsRect;
{$IFDEF CLR}
  ResId := GetActualResId;
  if ResId is System.Int32 then
    Result := Perform(_ACM_OPEN, GetActualResHandle, Integer(ResId)) <> 0
  else
    Result := Perform(_ACM_OPEN, GetActualResHandle, string(ResId)) <> 0;
{$ELSE}
  Result := Perform(ACM_OPEN, GetActualResHandle, GetActualResId) <> 0;
{$ENDIF}
  { Restore dimensions in case control was resized }
  if not Center then BoundsRect := R;
  if Result then
  begin
    GetFrameInfo;
    FStartFrame := 1;
    FStopFrame := FFrameCount;
    DoOpen;
  end;
end;

function TAnimate.InternalClose: Boolean;
begin
  if FActive then Stop;
  Result := SendMessage(Handle, _ACM_OPEN, 0, 0) <> 0;
  DoClose;
  Invalidate;
end;

procedure TAnimate.Play(FromFrame, ToFrame: Word; Count: Integer);
begin
  HandleNeeded;
  CheckOpen;
  FActive := True;
  { ACM_PLAY excpects -1 for repeated animations }
  if Count = 0 then Count := -1;
  if Perform(ACM_PLAY, Count, MakeLong(FromFrame - 1, ToFrame - 1)) <> 1 then
    FActive := False;
end;

procedure TAnimate.Reset;
begin
  if not (csLoading in ComponentState) then
  begin
    SetOpen(False);
    Seek(1);
  end;
end;

procedure TAnimate.Seek(Frame: Smallint);
begin
  CheckOpen;
  SendMessage(Handle, ACM_PLAY, 1, MakeLong(Frame - 1, Frame - 1));
end;

procedure TAnimate.Stop;
begin
  { Seek to first frame }
  SendMessage(Handle, ACM_PLAY, 1, MakeLong(StartFrame - 1, StartFrame - 1));
  FActive := False;
  Inc(FStopCount);
  DoStop;
end;

function TAnimate.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  if Open then
  begin
    Result := True;
    NewWidth := FrameWidth;
    NewHeight := FrameHeight;
  end
  else Result := False;
end;

{ TToolButton }

constructor TToolButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if StyleServices.Available then
    ControlStyle := [csSetCaption, csClickEvents]
  else
    ControlStyle := [csCaptureMouse, csSetCaption, csClickEvents];
  Width := 23;
  Height := 22;
  FImageIndex := -1;
  FStyle := tbsButton;
end;

procedure TToolButton.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  if (Style = tbsDropDown) and (Button = mbLeft) then
    if Enabled or EnableDropdown then
    Down := not Down;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TToolButton.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if (Style = tbsDropDown) and MouseCapture then
    Down := (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight);
end;

procedure TToolButton.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (Button = mbLeft) and (X >= 0) and (X < ClientWidth) and (Y >= 0) and
    (Y <= ClientHeight) then
  if Style = tbsDropDown then Down := False;
end;

procedure TToolButton.Click;
begin
  inherited Click;
end;

procedure TToolButton.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = DropdownMenu then
      DropdownMenu := nil
    else if AComponent = MenuItem then
      MenuItem := nil;
  end;
end;

procedure TToolButton.CMTextChanged(var Message: TMessage);
begin
  inherited;
  UpdateControl;
  if not (csLoading in ComponentState) and (FToolBar <> nil) and 
    (FToolBar.ShowCaptions or (FToolBar.AllowTextButtons and (FStyle = tbsTextButton))) then
  begin
    FToolBar.FButtonWidth := 0;
    FToolBar.FButtonHeight := 0;
    FToolBar.RecreateButtons;
  end;
end;

procedure TToolButton.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  Pos: Integer;
  Reordered, NeedsUpdate: Boolean;
  ResizeWidth, ResizeHeight: Boolean;
begin
  if ((ALeft <> Left) or (ATop <> Top) or
    (AWidth <> Width) or (AHeight <> Height)) and
    (FUpdateCount = 0) and not (csLoading in ComponentState) and
    (FToolBar <> nil) then
  begin
    Pos := Index;
    Reordered := FToolBar.ReorderButton(Pos, ALeft, ATop) <> Pos;
    if Reordered then
    begin
      NeedsUpdate := False;
      if Index < Pos then Pos := Index
    end
    else
    begin
      NeedsUpdate := (Style in [tbsSeparator, tbsDivider]) and (AWidth <> Width);
      Reordered := NeedsUpdate;
    end;
    if (Style = tbsDropDown) and ((GetComCtlVersion >= ComCtlVersionIE4) or
      { IE3 doesn't display drop-down arrows }
      not FToolBar.Flat) then
        AWidth := FToolBar.ButtonWidth + AWidth - Width;
    ResizeWidth := not (Style in [tbsSeparator, tbsDivider]) and
      (AWidth <> FToolBar.ButtonWidth);
    ResizeHeight := AHeight <> FToolBar.ButtonHeight;
    if NeedsUpdate then inherited SetBounds(ALeft, ATop, AWidth, AHeight);
    if csDesigning in ComponentState then
    begin
      if ResizeWidth then FToolBar.ButtonWidth := AWidth;
      if ResizeHeight then FToolBar.ButtonHeight := AHeight;
    end;
    if Reordered and not ResizeWidth and not ResizeHeight then
    begin
      if NeedsUpdate then
        if Style in [tbsSeparator, tbsDivider] then
          FToolBar.RefreshButton(Pos)
        else
          FToolBar.UpdateButton(Pos);
      FToolBar.ResizeButtons;
      FToolBar.RepositionButtons(0);
    end
    else
      FToolBar.RepositionButton(Pos);
  end
  else
    inherited SetBounds(ALeft, ATop, AWidth, AHeight);
end;

const
  cDropDownWidth = 14;

procedure TToolButton.Paint;
const
  XorColor = $00FFD8CE;
var
  R: TRect;
  Details: TThemedElementDetails;
begin
  if FToolBar = nil then
    Exit;

  if (Style = tbsDropDown) and not FToolbar.Flat and not FToolBar.FMenuDropped
      and (GetComCtlVersion = ComCtlVersionIE5) then
    with Canvas do
    begin
      if not Down then
      begin
        R := Rect(Width - cDropDownWidth, 1, Width, Height);
        DrawEdge(Handle, R, BDR_RAISEDOUTER, BF_TOP or BF_RIGHT or BF_BOTTOM);
        R.Top := 0;
        DrawEdge(Handle, R, EDGE_ETCHED, BF_LEFT);
      end
      else
      begin
        R := Rect(Width - cDropDownWidth + 1, -1, Width, Height);
        DrawEdge(Handle, R, BDR_SUNKEN, BF_TOP or BF_RIGHT or BF_BOTTOM);
        DrawEdge(Handle, R, EDGE_ETCHED, BF_LEFT);
      end;
    end;

   if csDesigning in ComponentState then
    { Draw separator outline }
    if Style in [tbsSeparator, tbsDivider] then
      with Canvas do
      begin
        Pen.Style := psDot;
        Pen.Mode := pmXor;
        Pen.Color := XorColor;
        Brush.Style := bsClear;
        Rectangle(0, 0, ClientWidth, ClientHeight);
      end
    else
      if (FToolBar.Flat or StyleServices.Enabled) and not Down then
      begin
        R := Rect(0, 0, Width, Height);
        if StyleServices.Enabled then
        begin
          Details := StyleServices.GetElementDetails(ttbButtonHot);
          StyleServices.DrawEdge(Canvas.Handle, Details, R, [eeRaisedInner], [efRect]);
        end
        else
          DrawEdge(Canvas.Handle, R, BDR_RAISEDINNER, BF_RECT);
      end;
end;

const
  ButtonStates: array[TToolButtonState] of Word = (TBSTATE_CHECKED,
    TBSTATE_PRESSED, TBSTATE_ENABLED, TBSTATE_HIDDEN, TBSTATE_INDETERMINATE,
    TBSTATE_WRAP, TBSTATE_ELLIPSES, TBSTATE_MARKED);
    
  ButtonStyles: array[TToolButtonStyle] of Word = (TBSTYLE_BUTTON, TBSTYLE_CHECK,
    TBSTYLE_DROPDOWN, TBSTYLE_SEP, TBSTYLE_SEP, BTNS_SHOWTEXT);

function TToolButton.GetButtonState: Byte;
begin
  Result := 0;
  if FDown then
    if Style = tbsCheck then
    begin
      if Enabled then
        Result := Result or ButtonStates[tbsChecked]
    end
    else
      Result := Result or ButtonStates[tbsPressed];
  if (Enabled or FEnableDropdown) and ((FToolBar = nil) or FToolBar.Enabled) then
    Result := Result or ButtonStates[tbsEnabled];
  if not Visible and not (csDesigning in ComponentState) then
    Result := Result or ButtonStates[tbsHidden];
  if (FIndeterminate or FEnableDropdown) then
    Result := Result or ButtonStates[tbsIndeterminate];
  if FWrap then
    Result := Result or ButtonStates[tbsWrap];
  if FMarked then
    Result := Result or ButtonStates[tbsMarked];
end;

procedure TToolButton.SetAutoSize(Value: Boolean);
begin
  if Value <> AutoSize then
  begin
    FAutoSize := Value;
    UpdateControl;
    if not (csLoading in ComponentState) and (FToolBar <> nil) and
      (FToolBar.ShowCaptions or (FToolBar.AllowTextButtons and (FStyle = tbsTextButton))) then
    begin
      FToolBar.FButtonWidth := 0;
      FToolBar.FButtonHeight := 0;
      FToolBar.RecreateButtons;
    end;
  end;
end;

procedure TToolButton.SetButtonState(State: Byte);
begin
  FDown := State and (TBSTATE_CHECKED or TBSTATE_PRESSED) <> 0;
  Enabled := State and TBSTATE_ENABLED <> 0;
  if not (csDesigning in ComponentState) then
    Visible := State and TBSTATE_HIDDEN = 0;
  FIndeterminate := not FDown and (State and TBSTATE_INDETERMINATE <> 0);
  FWrap := State and TBSTATE_WRAP <> 0;
  FMarked := State and TBSTATE_MARKED <> 0;
end;

procedure TToolButton.SetToolBar(AToolBar: TToolBar);
begin
  if FToolBar <> AToolBar then
  begin
    if FToolBar <> nil then
      FToolBar.RemoveButton(Self);
    Parent := AToolBar;
    if AToolBar <> nil then
      AToolBar.InsertButton(Self);
  end;
end;

procedure TToolButton.CMVisibleChanged(var Message: TMessage);
var
  Button: TTBButton;
begin
  if not (csDesigning in ComponentState) and (FToolBar <> nil) then
  begin
    with FToolBar do
    begin
      if not (csLoading in ComponentState) then
        HandleNeeded; // Changing visibility requires the toolbar to have a handle
      if Perform(TB_GETBUTTON, Index, Button) <> 0 then
        Perform(TB_HIDEBUTTON, Button.idCommand, MakeLong(Ord(not Self.Visible), 0));
      { Force a resize to occur }
      if AutoSize then
        AdjustSize;
    end;
    UpdateControl;
    FToolBar.RepositionButtons(Index);
  end;
end;

procedure TToolButton.CMEnabledChanged(var Message: TMessage);
begin
  if (FToolBar <> nil) and not FEnableDropdown then
  begin
    FToolBar.Perform(TB_ENABLEBUTTON, Index, LPARAM(Ord(Enabled)));
    if not((csLoading in ComponentState) or (FToolBar.FUpdateCount > 0)) then
    begin
      FToolBar.BeginUpdate;
      try
        FToolBar.UpdateItem2(_TB_SETBUTTONINFO, Index, Index)
      finally
        FToolBar.EndUpdate;
      end;
    end;
  end;
end;

procedure TToolButton.CMHitTest(var Message: TCMHitTest);
begin
  Message.Result := Ord(not (Style in [tbsDivider, tbsSeparator]) or (DragKind = dkDock));
end;

procedure TToolButton.SetDown(Value: Boolean);
const
  DownMessage: array[Boolean] of Integer = (TB_PRESSBUTTON, TB_CHECKBUTTON);
begin
  if Value <> FDown then
  begin
    FDown := Value;
    if FToolBar <> nil then
    begin
      FToolBar.Perform(DownMessage[Style = tbsCheck], Index, MakeLong(Ord(Value), 0));
      FToolBar.UpdateButtonStates;
    end;
  end;
end;

procedure TToolButton.SetDropdownMenu(Value: TPopupMenu);
begin
  if Value <> FDropdownMenu then
  begin
    FDropdownMenu := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

procedure TToolButton.SetGrouped(Value: Boolean);
begin
  if FGrouped <> Value then
  begin
    FGrouped := Value;
    UpdateControl;
  end;
end;

procedure TToolButton.SetImageIndex(Value: TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    if FToolBar <> nil then
    begin
      RefreshControl;
      FToolBar.Perform(TB_CHANGEBITMAP, Index, LPARAM(Value));
      if FToolBar.Transparent or FToolBar.Flat then Invalidate;
      if not (csLoading in ComponentState) and (Style = tbsTextButton) then
        FToolBar.RecreateButtons;
    end;
  end;
end;

procedure TToolButton.SetMarked(Value: Boolean);
begin
  if FMarked <> Value then
  begin
    FMarked := Value;
    if FToolBar <> nil then
      FToolBar.Perform(TB_MARKBUTTON, Index, LPARAM(Ord(Value)));
  end;
end;

procedure TToolButton.SetIndeterminate(Value: Boolean);
begin
  if FIndeterminate <> Value then
  begin
    if Value then SetDown(False);
    FIndeterminate := Value;
    if FToolBar <> nil then
      FToolBar.Perform(TB_INDETERMINATE, Index, LPARAM(Ord(Value)));
  end;
end;

procedure TToolButton.SetMenuItem(Value: TMenuItem);
begin
  { Copy all appropriate values from menu item }
  if Value <> nil then
  begin
    if FMenuItem <> Value then
      Value.FreeNotification(Self);
    Action := Value.Action;
    Caption := Value.Caption;
    Down := Value.Checked;
    Enabled := Value.Enabled;
    Hint := Value.Hint;
    ImageIndex := Value.ImageIndex;
    Visible := Value.Visible;
  end;
  FMenuItem := Value;
end;

procedure TToolButton.SetStyle(Value: TToolButtonStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Invalidate;
    if not (csLoading in ComponentState) and (FToolBar <> nil) then
    begin
      if FToolBar.ShowCaptions or (FToolBar.AllowTextButtons and (FStyle = tbsTextButton)) then
      begin
        FToolBar.FButtonWidth := 0;
        FToolBar.FButtonHeight := 0;
        FToolBar.RecreateButtons
      end
      else
      begin
        if Style in [tbsDivider, tbsSeparator] then
          RefreshControl
        else
        if Style = tbsDropDown then
          FToolbar.RecreateButtons
        else
          UpdateControl;
        FToolBar.ResizeButtons;
        FToolbar.RepositionButtons(Index);
      end;
      FToolBar.AdjustSize;
    end;
  end;
end;

procedure TToolButton.SetWrap(Value: Boolean);
begin
  if FWrap <> Value then
  begin
    FWrap := Value;
    if FToolBar <> nil then
      RefreshControl;
  end;
end;

procedure TToolButton.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TToolButton.EndUpdate;
begin
  Dec(FUpdateCount);
end;

function TToolButton.GetIndex: Integer;
begin
  if FToolBar <> nil then
    Result := FToolBar.FButtons.IndexOf(Self)
  else
    Result := -1;
end;

function TToolButton.IsWidthStored: Boolean;
begin
  Result := Style in [tbsSeparator, tbsDivider];
end;

procedure TToolButton.RefreshControl;
begin
  if (FToolBar <> nil) and FToolBar.RefreshButton(Index) then
  begin
                             
{    R := BoundsRect;
    R.Left := 0;
    ValidateRect(FToolBar.Handle, @R);
    R.Bottom := R.Top;
    R.Top := 0;
    R.Right := FToolBar.ClientWidth;
    ValidateRect(FToolBar.Handle, @R);}
  end;
end;

procedure TToolButton.UpdateControl;
begin
  if FToolBar <> nil then FToolBar.UpdateButton(Index);
end;

function TToolButton.CheckMenuDropdown: Boolean;
begin
  Result := not (csDesigning in ComponentState) and ((DropdownMenu <> nil) and
    DropdownMenu.AutoPopup or (MenuItem <> nil)) and (FToolBar <> nil) and
    FToolBar.CheckMenuDropdown(Self);
end;

function TToolButton.IsCheckedStored: Boolean;
begin
  Result := (ActionLink = nil) or not TToolButtonActionLink(ActionLink).IsCheckedLinked;
end;

function TToolButton.IsImageIndexStored: Boolean;
begin
  Result := (ActionLink = nil) or not TToolButtonActionLink(ActionLink).IsImageIndexLinked;
end;

procedure TToolButton.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      if not CheckDefaults or not Self.Down then
        Self.Down := Checked;
      if not CheckDefaults or (Self.ImageIndex = -1) then
        Self.ImageIndex := ImageIndex;
    end;
  if Sender is TControlAction then
    with TControlAction(Sender) do
    begin
      if not CheckDefaults or (Self.PopupMenu = nil) then
        Self.PopupMenu := PopupMenu;
      if not CheckDefaults or (Self.DropdownMenu = nil) then
        Self.DropdownMenu := DropdownMenu;
      if not CheckDefaults or not Self.EnableDropdown then
        Self.EnableDropdown := EnableDropdown;
    end;
end;

function TToolButton.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TToolButtonActionLink;
end;

procedure TToolButton.AssignTo(Dest: TPersistent);
begin
  inherited AssignTo(Dest);
  if Dest is TCustomAction then
    with TCustomAction(Dest) do
    begin
      Checked := Self.Down;
      ImageIndex := Self.ImageIndex;
    end;
end;

procedure TToolButton.ValidateContainer(AComponent: TComponent);
var
  W: Integer;
begin
  inherited ValidateContainer(AComponent);
  { Update non-stored Width and Height if inserting into TToolBar }
  if (csLoading in ComponentState) and (AComponent is TToolBar) then
  begin
    if Style in [tbsDivider, tbsSeparator] then
      W := Width else
      W := TToolBar(AComponent).ButtonWidth;
    SetBounds(Left, Top, W, TToolBar(AComponent).ButtonHeight);
  end;
end;

procedure TToolButton.SetEnableDropdown(Value: Boolean);
begin
  if FEnableDropdown <> Value then
  begin
    FEnableDropdown := Value;
    if not Enabled and (FToolbar <> nil) then
      if FEnableDropdown then
        FToolBar.Perform(TB_ENABLEBUTTON, Index, LPARAM(Ord(True)))
      else
        FToolbar.Perform(TB_ENABLEBUTTON, Index, LPARAM(Ord(False)));
  end;
end;

{ TToolBarEnumerator }

constructor TToolBarEnumerator.Create(AToolBar: TToolBar);
begin
  inherited Create;
  FIndex := -1;
  FToolBar := AToolBar;
end;

function TToolBarEnumerator.GetCurrent: TToolButton;
begin
  Result := FToolBar.Buttons[FIndex];
end;

function TToolBarEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FToolBar.ButtonCount - 1;
  if Result then
    Inc(FIndex);
end;

{ TToolBar }

class constructor TToolBar.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TToolBar, TToolBarStyleHook);
end;

constructor TToolBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csDoubleClicks, csMenuEvents, csSetCaption, csGestures];
  Width := 150;
  Height := 29;
  Align := alTop;
  EdgeBorders := [];
  FButtonWidth := 23;
  FButtonHeight := 22;
  FCustomizable := False;
  FCustomizing := False;
  FNewStyle := True;
  FWrapable := True;
  FButtons := TList.Create;
{$IFDEF CLR}
  FButtonHashTable := HashTable.Create;
{$ENDIF}
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FDisabledImageChangeLink := TChangeLink.Create;
  FDisabledImageChangeLink.OnChange := DisabledImageListChange;
  FHotImageChangeLink := TChangeLink.Create;
  FHotImageChangeLink.OnChange := HotImageListChange;
  FNullBitmap := TBitmap.Create;
  with FNullBitmap do
  begin
    Width := 1;
    Height := 1;
    Canvas.Brush.Color := clBtnFace;
    Canvas.FillRect(Rect(0,0,1,1));
  end;
  FloatingDockSiteClass := TToolDockForm;
  { The default value for Transparent now depends on if you have
    Themes turned on or off (this only works on XP) }
  FTransparent := StyleServices.Enabled;

  FBitmap := TBitmap.Create;
  GradientStartColor := clWindow;
  GradientEndColor := GetShadowColor(clBtnFace, -25);
  HotTrackColor := $00EFD3C6;
  Flat := True;
  GradientDrawingOptions := [gdoHotTrack, gdoGradient];
  GradientDirection := gdVertical;
  DrawingStyle := dsNormal;
  FLastQueryDeleteIndex := -1;
end;

class destructor TToolBar.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TToolBar, TToolBarStyleHook);
end;

destructor TToolBar.Destroy;
var
  I: Integer;
begin
  FBitmap.Free;
  FNullBitmap.Free;
  FHotImageChangeLink.Free;
  FDisabledImageChangeLink.Free;
  FImageChangeLink.Free;
  for I := 0 to FButtons.Count - 1 do
    if TControl(FButtons[I]) is TToolButton then
      TToolButton(FButtons[I]).FToolBar := nil;
  FButtons.Free;
  FCanvas.Free;
{$IFDEF CLR}
  FButtonHashTable.Free;
{$ENDIF}
  inherited Destroy;
end;

procedure TToolBar.CreateParams(var Params: TCreateParams);
const
  DefaultStyles = CCS_NOPARENTALIGN or CCS_NOMOVEY or CCS_NORESIZE or CCS_NODIVIDER;
  ListStyles: array[Boolean] of DWORD = (0, TBSTYLE_LIST);
  FlatStyles: array[Boolean] of DWORD = (0, TBSTYLE_FLAT);
  FlatOnXp: array[Boolean] of DWORD = (0, TBSTYLE_FLAT);
  TransparentStyles: array[Boolean] of DWORD = (0, TBSTYLE_TRANSPARENT);
  CustomizeStyles: array[Boolean] of DWORD = (0, CCS_ADJUSTABLE);
begin
  FNewStyle := InitCommonControl(ICC_BAR_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, TOOLBARCLASSNAME);
  with Params do
  begin
    Style := Style or DefaultStyles or FlatStyles[FFlat] or ListStyles[FList] or
      TransparentStyles[FTransparent] or CustomizeStyles[FCustomizable] or
      FlatOnXp[StyleServices.Enabled];
    //! WINBUG: Without this style the toolbar has a two pixel margin above
    //! the buttons when ShowCaptions = True.
    if ShowCaptions or AllowTextButtons then
      Style := Style or TBSTYLE_TRANSPARENT;//!
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TToolBar.CreateWnd;
var
  DisplayDC: HDC;
  SaveFont, StockFont: HFONT;
  TxtMetric: TTextMetric;
  CurStyle: Cardinal;
begin
  inherited CreateWnd;
  { Maintain backward compatibility with IE3 which always draws drop-down arrows
    for buttons in which Style = tbsDropDown. }
  if GetComCtlVersion >= ComCtlVersionIE4 then
  begin
    CurStyle := Perform(TB_GETEXTENDEDSTYLE, 0, 0) or TBSTYLE_EX_DRAWDDARROWS;
    if GetComCtlVersion >= ComCtlVersionIE501 then
    begin
      if FHideClippedButtons then
        CurStyle := CurStyle or TBSTYLE_EX_HIDECLIPPEDBUTTONS
      else
        CurStyle := CurStyle and not TBSTYLE_EX_HIDECLIPPEDBUTTONS;
      if FAllowTextButtons and FList then
        CurStyle := CurStyle or TBSTYLE_EX_MIXEDBUTTONS
      else
        CurStyle := CurStyle and not TBSTYLE_EX_MIXEDBUTTONS;
    end;
    Perform(TB_SETEXTENDEDSTYLE, 0, LPARAM(CurStyle));
  end;

  FOldHandle := 0;
  StockFont := GetStockObject(SYSTEM_FONT);
  if StockFont <> 0 then
  begin
    DisplayDC := GetDC(0);
    if (DisplayDC <> 0) then
    begin
      SaveFont := SelectObject(DisplayDC, StockFont);
      if (GetTextMetrics(DisplayDC, TxtMetric)) then
        with TxtMetric do
          FHeightMargin := tmHeight - tmInternalLeading - tmExternalLeading + 1;
      SelectObject(DisplayDC, SaveFont);
      ReleaseDC(0, DisplayDC);
    end;
  end;
  RecreateButtons;
  Invalidate;
end;

procedure TToolBar.UpdateStyleElements;
begin
  Invalidate;
end;

procedure TToolBar.CreateButtons(NewWidth, NewHeight: Integer);

  function ToolButtonVisible: Boolean;
  var
    I: Integer;
    Control: TControl;
  begin
    for I := 0 to FButtons.Count - 1 do
    begin
      Control := TControl(FButtons[I]);
      if (Control is TToolButton) and ((csDesigning in ComponentState) or
        Control.Visible) and not (TToolButton(Control).Style in
        [tbsSeparator, tbsDivider]) then
      begin
        Result := True;
        Exit;
      end;
    end;
    Result := False;
  end;

var
  ImageWidth, ImageHeight: Integer;
  I: Integer;
begin
  BeginUpdate;
  try
    HandleNeeded;
{$IFDEF CLR}
    Perform(TB_BUTTONSTRUCTSIZE, Marshal.SizeOf(TypeOf(TTBButton)), 0);
{$ELSE}
    Perform(TB_BUTTONSTRUCTSIZE, SizeOf(TTBButton), 0);
{$ENDIF}
    Perform(TB_SETINDENT, FIndent, 0);
    if FImages <> nil then
    begin
      ImageWidth := FImages.Width;
      ImageHeight := FImages.Height;
    end
    else if FDisabledImages <> nil then
    begin
      ImageWidth := FDisabledImages.Width;
      ImageHeight := FDisabledImages.Height;
    end
    else if FHotImages <> nil then
    begin
      ImageWidth := FHotImages.Width;
      ImageHeight := FHotImages.Height;
    end
    else
    begin
      ImageWidth := 0;
      ImageHeight := 0;
    end;
    Perform(TB_SETBITMAPSIZE, 0, MakeLParam(ImageWidth, ImageHeight));
                               
    { Adjust the working height if there is a visible TToolButton whose caption
      height is automatically added by the common control. }
//    if ShowCaptions and ToolButtonVisible then Dec(NewHeight, FHeightMargin);
    { Prevent toolbar from setting default button size }
    if NewWidth <= 0 then NewWidth := 1;
    if NewHeight <= 0 then NewHeight := 1;
    Perform(TB_SETBUTTONSIZE, 0, MakeLParam(NewWidth, NewHeight));
    FButtonWidth := NewWidth;
    FButtonHeight := NewHeight;
  finally
    EndUpdate;
  end;
  { Retrieve current button sizes }
  for I := 0 to InternalButtonCount - 1 do
    Perform(TB_DELETEBUTTON, 0, 0);
  UpdateButtons;
  UpdateImages;
  GetButtonSize(FButtonWidth, FButtonHeight);
end;

procedure TToolBar.RepositionButton(Index: Integer);
var
  TBButton: TTBButton;
  Button: TControl;
  R: TRect;
  AdjustY: Integer;
begin
  if (csLoading in ComponentState) or (Perform(TB_GETBUTTON, Index, TBButton) = 0) then
    Exit;

  // If a non ToolButton control's Visible doesn't match
  // the internal button's state it needs to be refreshed
{$IFDEF CLR}
  Button := TControl(FButtonHashTable.Item[TObject(TBButton.dwData)]);
{$ELSE}
  Button := TControl(TBButton.dwData);
{$ENDIF}
  if not (Button is TToolButton) then
    if Button.Visible <> ((TBButton.fsState and TBSTATE_HIDDEN) = 0) then
      RefreshButton(Index);

  if Perform(TB_GETITEMRECT, Index, R) <> 0 then
  begin
    if Button is TToolButton then
      TToolButton(Button).BeginUpdate;
    try
      if not (Button is TToolButton) then
        with Button do
        begin
          if Button is TWinControl then
            HandleNeeded;
          { Check for a control that doesn't size and center it }
          BoundsRect := R;
          if Height < R.Bottom - R.Top then
          begin
            AdjustY := (R.Bottom - R.Top - Height) div 2;
            SetBounds(R.Left, R.Top + AdjustY, R.Right - R.Left, Height);
          end;
        end
      else
        Button.BoundsRect := R;
    finally
      if Button is TToolButton then
        TToolButton(Button).EndUpdate;
    end;
  end;
end;

procedure TToolBar.RepositionButtons(Index: Integer);
var
  I: Integer;
begin
  if (csLoading in ComponentState) or (FUpdateCount > 0) then Exit;
  BeginUpdate;
  try
    for I := InternalButtonCount - 1 downto Index do RepositionButton(I);
  finally
    EndUpdate;
  end;
end;

procedure TToolBar.GetButtonSize(var AWidth, AHeight: Integer);
var
  LastIndex: Integer;
  R: TRect;
  TBButton: TTBButton;
begin
  if HandleAllocated then
  begin
    if GetComCtlVersion >= ComCtlVersionIE3 then
    begin
      LastIndex := Perform(TB_GETBUTTONSIZE, 0, 0);
      AHeight := LastIndex shr 16;
      AWidth := LastIndex and $FFFF;
    end
    else
    begin
      LastIndex := InternalButtonCount - 1;
      if LastIndex < 0 then Exit;
      while (LastIndex >= 0) and
        (Perform(TB_GETBUTTON, LastIndex, TBButton) <> 0) and
        (TBButton.fsStyle and TBSTYLE_SEP <> 0) do
        Dec(LastIndex);
      if LastIndex < 0 then
      begin
        if Perform(TB_GETITEMRECT, 0, R) <> 0 then
          AHeight := R.Bottom - R.Top;
        Exit;
      end;
      if Perform(TB_GETITEMRECT, LastIndex, R) <> 0 then
      begin
        AHeight := R.Bottom - R.Top;
        AWidth := R.Right - R.Left;
      end;
    end;
  end;
end;

procedure TToolBar.SetButtonHeight(Value: Integer);
begin
  if Value <> FButtonHeight then
  begin
    FButtonHeight := Value;
    if (StyleServices.Enabled = True) and Showing then
      RecreateWnd;
    RecreateButtons;
  end;
end;

procedure TToolBar.SetButtonWidth(Value: Integer);
begin
  if Value <> FButtonWidth then
  begin
    FButtonWidth := Value;
    if (StyleServices.Enabled = True) and Showing then
      RecreateWnd;
    RecreateButtons;
  end;
end;

procedure TToolBar.InsertButton(Control: TControl);
var
  FromIndex, ToIndex: Integer;
begin
  if Control is TToolButton then TToolButton(Control).FToolBar := Self;
  if not (csLoading in Control.ComponentState) then
  begin
    FromIndex := FButtons.IndexOf(Control);
    if FromIndex >= 0 then
      ToIndex := ReorderButton(Fromindex, Control.Left, Control.Top)
    else
    begin
      ToIndex := ButtonIndex(FromIndex, Control.Left, Control.Top);
      FButtons.Insert(ToIndex, Control);
      UpdateItem(_TB_INSERTBUTTON, ToIndex, ToIndex);
    end;
  end
  else
  begin
    ToIndex := FButtons.Add(Control);
    UpdateButton(ToIndex);
  end;
  if Wrapable then
    RepositionButtons(0)
  else
    RepositionButtons(ToIndex);
  RecreateButtons;
end;

procedure TToolBar.RemoveButton(Control: TControl);
var
  I, Pos: Integer;
begin
  I := FButtons.IndexOf(Control);
  if I >= 0 then
  begin
    if Control is TToolButton then
      TToolButton(Control).FToolBar := nil;
    Pos := FButtons.Remove(Control);
    if FCustomizing and not FRestoring then
      Exit;
{$IFDEF CLR}
    FButtonHashTable.Remove(TObject(Control.GetHashCode));
{$ENDIF}
    Perform(TB_DELETEBUTTON, Pos, 0);
    ResizeButtons;
    if Wrapable then
      RepositionButtons(0)
    else
      RepositionButtons(Pos);
    RecreateButtons;
  end;
end;

function TToolBar.UpdateItem(Message, FromIndex, ToIndex: Integer): Boolean;
const
  CImageNone = -2;
var
  Control: TControl;
  Button: TTBButton;
  CaptionText: string;
{$IFNDEF CLR}
  Len: Integer;
  Buffer: array [0..4095] of Char;
{$ENDIF}
begin
  Control := TControl(FButtons[FromIndex]);
  if Control is TToolButton then
    with TToolButton(Control) do
    begin
{$IFNDEF CLR}
      FillChar(Button, SizeOf(Button), 0);
{$ENDIF}
      if Style in [tbsSeparator, tbsDivider] then
      begin
        Button.iBitmap := Width;
        Button.idCommand := FromIndex;
      end
      else
      begin
        if ImageIndex < 0 then
          Button.iBitmap := CImageNone
        else
          Button.iBitmap := ImageIndex;
        Button.idCommand := FromIndex;
      end;
      with Button do
      begin
        fsStyle := ButtonStyles[Style];
        if AutoSize and (GetComCtlVersion >= ComCtlVersionIE4) then
          fsStyle := fsStyle or TBSTYLE_AUTOSIZE;
      end;
      Button.fsState := GetButtonState;
      if FGrouped then Button.fsStyle := Button.fsStyle or TBSTYLE_GROUP;
{$IFDEF CLR}
      Button.dwData := Control.GetHashCode;
      // Add to hashtable to allow access to the actual Button
      // object from the TBButton struct
      if not FButtonHashTable.ContainsValue(Control) then
        FButtonHashTable.Add(TObject(Button.dwData), Control);
      if ShowCaptions or (AllowTextButtons and (Style = tbsTextButton)) then
      begin
        if Caption <> '' then
          CaptionText := Caption + #0#0
        else
          { Common control requries at least a space is used when showing button
            captions.  If any one button's caption is empty (-1) then none of
            the buttons' captions will not be displayed. }
          CaptionText := ' '#0#0;
        { TB_ADDSTRING requires two null terminators }
        Button.iString := Self.Perform(_TB_ADDSTRING, 0, CaptionText);
{$ELSE}
      Button.dwData := LPARAM(Control);
      if ShowCaptions or (AllowTextButtons and (Style = tbsTextButton)) then
      begin
        if Caption <> '' then
          CaptionText := Caption
        else
          { Common control requries at least a space is used when showing button
            captions.  If any one button's caption is empty (-1) then none of
            the buttons' captions will not be displayed. }
          CaptionText := ' ';
        StrPLCopy(Buffer, CaptionText, Length(Buffer));
        { TB_ADDSTRING requires two null terminators }
        Len := Length(CaptionText);
        if Len >= Length(Buffer) - 2 then
        begin
          Len := Length(Buffer) - 2;
          Buffer[Len] := #0;
        end;
        Buffer[Len + 1] := #0;
        Button.iString := Self.Perform(TB_ADDSTRING, 0, LPARAM(@Buffer));
{$ENDIF}
      end
      else
        Button.iString := -1;
    end
  else
  begin
{$IFNDEF CLR}
    FillChar(Button, SizeOf(Button), 0);
{$ENDIF}
    Button.fsStyle := ButtonStyles[tbsSeparator];
    Button.iBitmap := Control.Width;
    Button.idCommand := -1;
    if not Control.Visible and not (csDesigning in Control.ComponentState) then
      Button.fsState := Button.fsState or ButtonStates[tbsHidden];
{$IFDEF CLR}
    Button.dwData := Control.GetHashCode;
    // Add to hashtable to allow access to the actual Button
    // object from the TBButton struct
    if not FButtonHashTable.ContainsValue(Control) then
      FButtonHashTable.Add(TObject(Button.dwData), Control);
{$ELSE}
    Button.dwData := LPARAM(Control);
{$ENDIF}
    Button.iString := -1;
  end;
  Result := Self.Perform(Message, ToIndex, Button) <> 0;
  // If more than 2^16 strings are TB_ADDSTRING-ed to the tool bar's string
  // pool, the Windows API assumes iString is a pointer to a null terminated
  // string, not an index in the string pool.  Therefore we have to recreate
  // the toolbar to reset the string pool so the strings display propperly.
  if Button.iString >= 65536 then
    RecreateWnd;
end;

function TToolBar.UpdateItem2(Message, FromIndex, ToIndex: Integer): Boolean;
var
  Control: TControl;
  Button: TTBButtonInfo;
  CaptionText: string;
{$IFDEF CLR}
  Buffer: IntPtr;
{$ELSE}
  Len: Integer;
  Buffer: array [0..4095] of Char;
{$ENDIF}
begin
  try
    Control := TControl(FButtons[FromIndex]);
{$IFDEF CLR}
    Button.cbSize := Marshal.SizeOf(Button);
{$ELSE}
    FillChar(Button, SizeOf(Button), 0);
    Button.cbSize := SizeOf(Button);
{$ENDIF}
    if Control is TToolButton then
      with TToolButton(Control) do
      begin
        Button.dwMask := TBIF_STATE or TBIF_STYLE or TBIF_LPARAM or TBIF_COMMAND
          or TBIF_SIZE;
        if Style in [tbsSeparator, tbsDivider] then
        begin
          Button.idCommand := FromIndex;
        end
        else
        begin
          Button.dwMask := Button.dwMask or TBIF_IMAGE;
          if ImageIndex < 0 then
            Button.iImage := -2 else
            Button.iImage := ImageIndex;
          Button.idCommand := FromIndex;
        end;
        with Button do
        begin
          cx := Width;
          fsStyle := ButtonStyles[Style];
          if AutoSize then fsStyle := fsStyle or TBSTYLE_AUTOSIZE;
          if Grouped then Button.fsStyle := Button.fsStyle or TBSTYLE_GROUP;
        end;
        Button.fsState := GetButtonState;
{$IFDEF CLR}
        Button.lParam := Control.GetHashCode;
        if ShowCaptions or (AllowTextButtons and (Style = tbsTextButton)) then
        begin
          if Caption <> '' then
            CaptionText := Caption + #0#0
          else
            { Common control requries at least a space is used when showing button
              captions.  If any one button's caption is empty (-1) then none of
              the buttons' captions will not be displayed. }
            CaptionText := ' '#0#0;
          { TB_ADDSTRING requires two null terminators }
          Button.pszText := Marshal.StringToHGlobalAuto(CaptionText);
          Button.cchText := Length(CaptionText);
          Button.dwMask := Button.dwMask or TBIF_TEXT;
{$ELSE}
        Button.lParam := LPARAM(Control);
        if ShowCaptions or (AllowTextButtons and (Style = tbsTextButton)) then
        begin
          if Caption <> '' then
            CaptionText := Caption
          else
            { Common control requries at least a space is used when showing button
              captions.  If any one button's caption is empty (-1) then none of
              the buttons' captions will not be displayed. }
            CaptionText := ' ';
  
          StrPLCopy(Buffer, CaptionText, Length(Buffer));
          { TB_ADDSTRING requires two null terminators }
          Len := Length(CaptionText);
          if Len >= Length(Buffer) - 2 then
          begin
            Len := Length(Buffer) - 2;
            Buffer[Len] := #0;
          end;
          Buffer[Len + 1] := #0;
          //Button.iString := Self.Perform(TB_ADDSTRING, 0, Longint(@Buffer));
          Button.pszText := Buffer;
          Button.cchText := Length(CaptionText);
          Button.dwMask := Button.dwMask or TBIF_TEXT;
{$ENDIF}
        end
        else
        begin
          Button.pszText := nil;
          Button.cchText := 0;
        end;
                                   
        {if Style in [tbsSeparator, tbsDivider] then
        begin
          with Button do
          begin
            if Visible then
            begin
              dwMask := TBIF_STYLE or TBIF_STATE or TBIF_LPARAM;
              fsState := TBSTATE_ENABLED or TBSTATE_WRAP;
              fsStyle := TBSTYLE_BUTTON;
            end;
          end;
        end;}
      end
    else
    begin
      Button.dwMask := TBIF_TEXT or TBIF_STATE or TBIF_STYLE or TBIF_LPARAM or
        TBIF_COMMAND or TBIF_SIZE;
      Button.fsStyle := ButtonStyles[tbsSeparator];
      Button.cx := Control.Width;
      Button.idCommand := -1;
      Button.pszText := nil;
      Button.cchText := 0;
{$IFDEF CLR}
      Button.lParam := Control.GetHashCode;
    end;
    Result := Self.Perform(Message, ToIndex, Button) <> 0;
  finally
    if Buffer <> nil then
      Marshal.FreeHGlobal(Buffer);
  end;
{$ELSE}
      Button.lParam := LPARAM(Control);
    end;
    Result := Self.Perform(Message, ToIndex, LPARAM(@Button)) <> 0;
  finally
  end;
{$ENDIF}
end;

function TToolBar.RefreshButton(Index: Integer): Boolean;
var
  Style: Longint;
begin
  if not (csLoading in ComponentState) and (FUpdateCount = 0) then
  begin
    BeginUpdate;
    try
      Style := GetWindowLong(Handle, GWL_STYLE);
      SetWindowLong(Handle, GWL_STYLE, Style and not WS_VISIBLE);
      try
        Result := (Index < InternalButtonCount) and
          UpdateItem(TB_DELETEBUTTON, Index, Index) and
          UpdateItem(_TB_INSERTBUTTON, Index, Index);
      finally
        SetWindowLong(Handle, GWL_STYLE, Style);
      end;
    finally
      EndUpdate;
    end;
  end
  else
    Result := False;
end;

procedure TToolBar.UpdateButton(Index: Integer);
var
  Style: Longint;
begin
  if (csLoading in ComponentState) or (FUpdateCount > 0) then Exit;
  BeginUpdate;
  try
    HandleNeeded;
    Style := GetWindowLong(Handle, GWL_STYLE);
    SetWindowLong(Handle, GWL_STYLE, Style and not WS_VISIBLE);
    try
      if Index < InternalButtonCount then
        UpdateItem2(_TB_SETBUTTONINFO, Index, Index)
      else
        UpdateItem(_TB_INSERTBUTTON, Index, Index);
    finally
      SetWindowLong(Handle, GWL_STYLE, Style);
    end;
  finally
    EndUpdate;
  end;
end;

procedure TToolBar.UpdateButtons;
var
  I: Integer;
  Count: Integer;
  Style: Longint;
begin
  BeginUpdate;
  try
    HandleNeeded;
    Style := GetWindowLong(Handle, GWL_STYLE);
    SetWindowLong(Handle, GWL_STYLE, Style and not WS_VISIBLE);
    try
      Count := InternalButtonCount;
      for I := 0 to FButtons.Count - 1 do
      begin
        if I < Count then
          UpdateItem2(_TB_SETBUTTONINFO, I, I)
        else
          UpdateItem(_TB_INSERTBUTTON, I, I);
      end;
    finally
      SetWindowLong(Handle, GWL_STYLE, Style);
    end;
  finally
    EndUpdate;
  end;
  RepositionButtons(0);
end;

procedure TToolBar.UpdateButtonState(Index: Integer);
var
  TBButton: TTBButton;
{$IFDEF CLR}
  ToolButton: TToolButton;
{$ENDIF}
begin
  if (Perform(TB_GETBUTTON, Index, TBButton) <> 0) then
  begin
{$IFDEF CLR}
    ToolButton := TToolButton(FButtonHashTable.Item[TObject(TBButton.dwData)]); 
    with ToolButton do
{$ELSE}
    with TToolButton(TBButton.dwData) do
{$ENDIF}
    begin
      SetButtonState(TBButton.fsState);
      Self.Perform(TB_SETSTATE, Index, MakeLong(GetButtonState, 0));
    end;
  end;
end;

procedure TToolBar.UpdateButtonStates;
var
  I: Integer;
begin
  for I := 0 to FButtons.Count - 1 do
    if TControl(FButtons[I]) is TToolButton then
      UpdateButtonState(I);
end;

procedure TToolBar.SetShowCaptions(Value: Boolean);
begin
  if FShowCaptions <> Value then
  begin
    FShowCaptions := Value;
    if not (csLoading in ComponentState) then
      RecreateWnd;
    AdjustSize;
  end;
end;

procedure TToolBar.SetAllowTextButtons(Value: Boolean);
begin
  if FAllowTextButtons <> Value then
  begin
    FAllowTextButtons := Value;
    if FAllowTextButtons then // Text buttons only allowed in list mode
      FList := True;
    if not (csLoading in ComponentState) then
      RecreateWnd;
    AdjustSize;
  end;
end;

function TToolBar.GetButton(Index: Integer): TToolButton;
begin
  Result := TToolButton(FButtons[Index]);
end;

function TToolBar.GetButtonCount: Integer;
begin
  Result := FButtons.Count;
end;

function TToolBar.GetEnumerator: TToolBarEnumerator;
begin
  Result := TToolBarEnumerator.Create(Self);
end;

function TToolBar.GetRowCount: Integer;
begin
  Result := Perform(TB_GETROWS, 0, 0);
end;

procedure TToolBar.SetList(Value: Boolean);
begin
  if FList <> Value then
  begin
    FList := Value;
    if not FList then // Text only buttons only allowed in list mode
      FAllowTextButtons := False;
    RecreateWnd;
  end;
end;

procedure TToolBar.SetFlat(Value: Boolean);
begin
  if FFlat <> Value then
  begin
    FFlat := Value;
    RecreateWnd;
  end;
end;

procedure TToolBar.SetTransparent(Value: Boolean);
begin
  if FTransparent <> Value then
  begin
    FTransparent := Value;
    RecreateWnd;
  end;
  FTransparentSet := True;
end;

procedure TToolBar.SetWrapable(Value: Boolean);
begin
  if FWrapable <> Value then
  begin
    FWrapable := Value;
    if AutoSize then
      AdjustSize;
    if (gdoGradient in GradientDrawingOptions) and HandleAllocated then
      Repaint;
  end;
end;

procedure TToolBar.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
  begin
    if AComponent = FImages then Images := nil;
    if AComponent = FHotImages then HotImages := nil;
    if AComponent = FDisabledImages then DisabledImages := nil;
    if AComponent = FMenu then Menu := nil;
  end;
end;

procedure TToolBar.LoadImages(AImages: TCustomImageList);
var
  AddBitmap: TTBAddBitmap;
  ReplaceBitmap: TTBReplaceBitmap;
  NewHandle: HBITMAP;

  function GetImageBitmap(ImageList: TCustomImageList): HBITMAP;
  var
    I: Integer;
    Bitmap: TBitmap;
    R: TRect;
  begin
    Bitmap := TBitmap.Create;
    try
      Bitmap.Width := ImageList.Width * ImageList.Count;
      Bitmap.Height := ImageList.Height;
      R := Rect(0,0,Width,Height);
      with Bitmap.Canvas do
      begin
        Brush.Color := clBtnFace;
        FillRect(R);
      end;
      for I := 0 to ImageList.Count - 1 do
        ImageList_Draw(ImageList.Handle, I, Bitmap.Canvas.Handle,
          I * ImageList.Width, 0, ILD_TRANSPARENT);
      Result := Bitmap.ReleaseHandle;
    finally
      Bitmap.Free;
    end;
  end;

begin
  if AImages <> nil then
    NewHandle := GetImageBitmap(AImages)
  else
    with TBitmap.Create do
    try
      Assign(FNullBitmap);
      NewHandle := ReleaseHandle;
    finally
      Free;
    end;
  if FOldHandle = 0 then
  begin
    AddBitmap.hInst := 0;
    AddBitmap.nID := NewHandle;
{$IFDEF CLR}
    Perform(TB_ADDBITMAP, ButtonCount, AddBitmap);
{$ELSE}
    Perform(TB_ADDBITMAP, ButtonCount, LPARAM(@AddBitmap));
{$ENDIF}
  end
  else
  begin
    with ReplaceBitmap do
    begin
      hInstOld := 0;
      nIDOld := FOldHandle;
      hInstNew := 0;
      nIDNew := NewHandle;
      nButtons := ButtonCount;
    end;
{$IFDEF CLR}
    Perform(TB_REPLACEBITMAP, 0, ReplaceBitmap);
{$ELSE}
    Perform(TB_REPLACEBITMAP, 0, LPARAM(@ReplaceBitmap));
{$ENDIF}
    if FOldHandle <> 0 then DeleteObject(FOldHandle);
  end;
  FOldHandle := NewHandle;
end;

procedure TToolBar.UpdateImages;
begin
  if FNewStyle then
  begin
    if FImages <> nil then SetImageList(FImages.Handle);
    if FDisabledImages <> nil then SetDisabledImageList(FDisabledImages.Handle);
    if FHotImages <> nil then SetHotImageList(FHotImages.Handle);
  end
  else
    if HandleAllocated then LoadImages(FImages);
end;

procedure TToolBar.ImageListChange(Sender: TObject);
begin
  if HandleAllocated and (Sender = Images) then RecreateButtons;
end;

procedure TToolBar.SetImageList(Value: HImageList);
begin
  if HandleAllocated then Perform(TB_SETIMAGELIST, 0, Value);
  Invalidate;
end;

procedure TToolBar.SetImages(Value: TCustomImageList);

  function HasDropDownButton: Boolean;
  var
    Button: TToolButton;
  begin
    Result := False;
    for Button in Self do
      if Button.Style = tbsDropDown then
      begin
        Result := True;
        Exit;
      end;
  end;

begin
  if FImages <> nil then FImages.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if FImages <> nil then
  begin
    FImages.RegisterChanges(FImageChangeLink);
    FImages.FreeNotification(Self);
  end
  else
    SetImageList(0);

  // Work around issue with a manifested ToolBars increasing in size
  // when a drop down button is present and tool buttons are added/deleted
  if StyleServices.Enabled and HandleAllocated and HasDropDownButton then
    RecreateWnd
  else
    RecreateButtons;
end;

procedure TToolBar.DisabledImageListChange(Sender: TObject);
begin
  if HandleAllocated and (Sender = DisabledImages) then RecreateButtons;
end;

procedure TToolBar.SetDisabledImageList(Value: HImageList);
begin
  if HandleAllocated then
    Perform(TB_SETDISABLEDIMAGELIST, 0, Value);
  Invalidate;
end;

procedure TToolBar.SetDisabledImages(Value: TCustomImageList);
begin
  if FDisabledImages <> nil then FDisabledImages.UnRegisterChanges(FDisabledImageChangeLink);
  FDisabledImages := Value;
  if FDisabledImages <> nil then
  begin
    FDisabledImages.RegisterChanges(FDisabledImageChangeLink);
    FDisabledImages.FreeNotification(Self);
  end
  else
    SetDisabledImageList(0);
  RecreateButtons;
end;

procedure TToolBar.HotImageListChange(Sender: TObject);
begin
  if HandleAllocated and (Sender = HotImages) then RecreateButtons;
end;

procedure TToolBar.SetHotImageList(Value: HImageList);
begin
  if HandleAllocated then
    Perform(TB_SETHOTIMAGELIST, 0, Value);
  Invalidate;
end;

procedure TToolBar.SetHotImages(Value: TCustomImageList);
begin
  if FHotImages <> nil then FHotImages.UnRegisterChanges(FHotImageChangeLink);
  FHotImages := Value;
  if FHotImages <> nil then
  begin
    FHotImages.RegisterChanges(FHotImageChangeLink);
    FHotImages.FreeNotification(Self);
  end
  else
    SetHotImageList(0);
  RecreateButtons;
end;

procedure TToolBar.SetIndent(Value: Integer);
begin
  if FIndent <> Value then
  begin
    FIndent := Value;
    RecreateWnd;
  end;
end;

procedure TToolBar.SetMenu(const Value: TMainMenu);
var
  I: Integer;
begin
  if FMenu = Value then exit;
  if csAcceptsControls in ControlStyle then
  begin
    ControlStyle := [csCaptureMouse, csClickEvents,
      csDoubleClicks, csMenuEvents, csSetCaption, csGestures];
    RecreateWnd;
  end;
  ShowCaptions := True;
  if Assigned(FMenu) then
    for I := ButtonCount - 1 downto 0 do
      Buttons[I].Free;
       
  if Assigned(FMenu) then
    FMenu.RemoveFreeNotification(Self);
  FMenu := Value;
  if not Assigned(FMenu) then exit;
  FMenu.FreeNotification(Self);

  for I := ButtonCount to FMenu.Items.Count - 1 do
  begin
    with TToolButton.Create(Self) do
    try
      AutoSize := True;
      Grouped := True;
      Parent := Self;
      Buttons[I].MenuItem := FMenu.Items[I];
    except
      Free;
      raise;
    end;
  end;
  { Copy attributes from each menu item }
  for I := 0 to FMenu.Items.Count - 1 do
    Buttons[i].MenuItem := FMenu.Items[I];
end;

procedure TToolBar.RecreateButtons;
begin
  if ([csLoading, csDestroying] * ComponentState = []) or HandleAllocated then
  begin
    CreateButtons(FButtonWidth, FButtonHeight);
    ResizeButtons;
  end;
end;

procedure TToolBar.WMCaptureChanged(var Message: TMessage);
begin
  inherited;
  if FInMenuLoop and FCaptureChangeCancels then CancelMenu;
end;

procedure TToolBar.WMKeyDown(var Message: TWMKeyDown);
var
  Item: Integer;
  Button: TToolButton;
  P: TPoint;
begin
  if FInMenuLoop then
  begin
    Item := Perform(TB_GETHOTITEM, 0, 0);
    case Message.CharCode of
      VK_RETURN, VK_DOWN:
        begin
          if (Item > -1) and (Item < FButtons.Count) then
          begin
            Button := TToolButton(FButtons[Item]);
            P := Button.ClientToScreen(Point(1, 1));
            ClickButton(Button);
          end;
          { Prevent default processing }
          if Message.CharCode = VK_DOWN then Exit;
        end;
      VK_ESCAPE: CancelMenu;
    end;
  end;
  inherited;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TToolBar.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  Control: TControl;
begin
  if Assigned(Menu) then exit;
  for I := 0 to FButtons.Count - 1 do
    Proc(TComponent(FButtons[I]));
  for I := 0 to ControlCount - 1 do
  begin
    Control := Controls[I];
    if (Control.Owner = Root) and (FButtons.IndexOf(Control) = -1) then
      Proc(Control);
  end;
end;

procedure TToolBar.Loaded;
var
  I: Integer;
begin
  RecreateButtons;
  { Make sure we dock controls after streaming }
  for I := 0 to ControlCount - 1 do
    Controls[I].HostDockSite := Self;
  inherited Loaded;
  ResizeButtons;
  RepositionButtons(0);
end;

procedure TToolBar.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TToolBar.EndUpdate;
begin
  Dec(FUpdateCount);
end;

procedure TToolBar.ResizeButtons;
begin
  if not (csLoading in ComponentState) and HandleAllocated then
  begin
    Perform(TB_AUTOSIZE, 0, 0);
    if AutoSize then AdjustSize;
  end;
end;

function TToolBar.InternalButtonCount: Integer;
begin
  Result := Perform(TB_BUTTONCOUNT, 0, 0);
end;

function TToolBar.ButtonIndex(OldIndex, ALeft, ATop: Integer): Integer;
var
  Dist, Tmp, Head, Tail: Integer;
  Control: TControl;
begin
  if (OldIndex >= 0) and (FButtons.Count <= 1) then
  begin
    Result := OldIndex;
    Exit;
  end;
  { Find row closest to ATop }
  Result := 0;
  if FButtons.Count = 0 then Exit;
  Tmp := 0;
  Head := 0;
  Tail := 0;
  Dist := MaxInt;
  while (Dist > 0) and (Result < FButtons.Count) do
  begin
    if Result <> OldIndex then
    begin
      Control := TControl(FButtons[Result]);
      if (Control is TToolButton) and TToolButton(Control).Wrap or
        (Result = FButtons.Count - 1) then
      begin
        if Abs(ATop - Control.Top) < Dist then
        begin
          Dist := Abs(ATop - Control.Top);
          Head := Tmp;
          Tail := Result;
        end;
        Tmp := Result + 1;
      end;
    end
    else
      Tail := Result;
    Inc(Result);
  end;
  { Find button on Row closest to ALeft }
  for Result := Head to Tail do
    if (Result <> OldIndex) and (ALeft <= TControl(FButtons[Result]).Left) then
      Break;
  { Return old position if new position is last on the row and old position
    was already the last on the row. }
  if (Result = OldIndex + 1) and (OldIndex in [Head..Tail]) then
    Result := OldIndex;
end;

function TToolBar.ReorderButton(OldIndex, ALeft, ATop: Integer): Integer;
var
  Control: TControl;
begin
  Result := ButtonIndex(OldIndex, ALeft, ATop);
  if Result <> OldIndex then
  begin
    { If we are inserting to the right of our deletion then account for shift }
    if OldIndex < Result then Dec(Result);
    Control := TControl(FButtons[OldIndex]);
    FButtons.Delete(OldIndex);
    FButtons.Insert(Result, Control);
    BeginUpdate;
    try
{$IFDEF CLR}
      FButtonHashTable.Remove(TObject(Control.GetHashCode));
{$ENDIF}
      Perform(TB_DELETEBUTTON, OldIndex, 0);
      UpdateItem(_TB_INSERTBUTTON, Result, Result);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TToolBar.AdjustControl(Control: TControl);
var
  I, Pos: Integer;
  R: TRect;
  Reordered, NeedsUpdate: Boolean;
begin
  Pos := FButtons.IndexOf(Control);
  if Pos = -1 then
    Exit;
  Reordered := ReorderButton(Pos, Control.Left, Control.Top) <> Pos;
  NeedsUpdate := False;
  if Reordered then
  begin
    I := FButtons.IndexOf(Control);
    if I < Pos then Pos := I;
  end
  else
    if Perform(TB_GETITEMRECT, Pos, R) <> 0 then
    begin
      NeedsUpdate := Control.Width <> R.Right - R.Left;
      Reordered := NeedsUpdate;
    end;
  if (csDesigning in ComponentState) and (Control.Height <> ButtonHeight) then
    ButtonHeight := Control.Height
  else
    if Reordered then
    begin
      if NeedsUpdate then
        RefreshButton(Pos);
      ResizeButtons;
      RepositionButtons(0);
    end
    else
      RepositionButton(Pos);
end;

procedure TToolBar.AlignControls(AControl: TControl; var Rect: TRect);
begin
  if FUpdateCount > 0 then Exit;
  if AControl = nil then
    RepositionButtons(0)
  else
    if not (AControl is TToolButton) then
      AdjustControl(AControl);
end;

procedure TToolBar.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  if not isDpiChange then
    ScaleControls(M, D);
  ButtonWidth := MulDiv(ButtonWidth, M, D);
  ButtonHeight := MulDiv(ButtonHeight, M, D);
  inherited ChangeScale(M, D, isDpiChange);
end;

procedure TToolBar.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if not Transparent then
    inherited
  else
    DefaultHandler(Message);
end;

procedure TToolBar.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  if FInMenuLoop then
    Message.Result := DLGC_WANTARROWS;
end;

{ Need to read/write caption ourselves - default wndproc seems to discard it. }

procedure TToolBar.WMGetText(var Message: TWMGetText);
{$IFDEF CLR}
var
  S: string;
begin
  with Message do
  begin
    S := FCaption;
    if Length(FCaption) > TextMax - 1 then
      SetLength(S, TextMax - 1);
    Text := S;
    Result := Length(S);
  end;
{$ELSE}
begin
  with Message do
    Result := StrLen(StrLCopy(PChar(Text), PChar(FCaption), TextMax - 1));
{$ENDIF}
end;

procedure TToolBar.WMGetTextLength(var Message: TWMGetTextLength);
begin
  Message.Result := Length(FCaption);
end;

procedure TToolBar.WMSetText(var Message: TWMSetText);
begin
{$IFDEF CLR}
  FCaption := Message.Text;
{$ELSE}
  with Message do
    SetString(FCaption, Text, StrLen(Text));
{$ENDIF}
end;

procedure TToolBar.WMNotifyFormat(var Message: TWMNotifyFormat);
begin
  with Message do
    Result := DefWindowProc(Handle, Msg, From, Command);
end;

procedure TToolBar.WMSize(var Message: TWMSize);
var
  W, H: Integer;
begin
  inherited;
  if not AutoSize then
  begin
    W := Width;
    H := Height;
    WrapButtons(W, H);
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TToolBar.WMSysChar(var Message: TWMSysChar);
var
  Form: TCustomForm;
begin
  { Default wndproc doesn't re-route WM_SYSCHAR messages to parent. }
  Form := GetParentForm(Self);
  if Form <> nil then
  begin
    Form.Dispatch(Message);
    Exit;
  end
  else
    inherited;
end;

procedure TToolBar.WMWindowPosChanged(var Message: TWMWindowPosChanged);
var
  R: TRect;
  NcX, NcY: Integer;
  Rgn1, Rgn2: HRgn;
begin
  { Erase only what's been uncovered when toolbar is flat - avoid flicker }
  if Flat and HandleAllocated and (Parent <> nil) then
  begin
    GetWindowRect(Handle, R);
    NcX := R.Right - R.Left - ClientWidth;
    NcY := R.Bottom - R.Top - ClientHeight;
    Rgn1 := CreateRectRgn(0, 0, Width - NcX, Height - NcY);
    with Message.WindowPos{$IFNDEF CLR}^{$ENDIF} do
      Rgn2 := CreateRectRgn(0, 0, cx - NcY, cy - NcY);
    CombineRgn(Rgn1, Rgn2, Rgn1, RGN_XOR);
    GetRgnBox(Rgn1, R);
    { Allow a 2 pixel buffer }
    Dec(R.Left, 2);
    DeleteObject(Rgn1);
    DeleteObject(Rgn2);
    inherited;
    RedrawWindow(Handle, R, 0, RDW_INVALIDATE or RDW_ERASE);
  end
  else
    inherited;
end;

procedure TToolBar.WMWindowPosChanging(var Message: TWMWindowPosChanging);
const
  BackgroundValid = SWP_NOSIZE or SWP_NOMOVE;
var
  R: TRect;
begin
  { Invalidate old background when toolbar is flat and is about to be moved }
  if Transparent and (Message.WindowPos.flags and BackgroundValid <> BackgroundValid) and
    (Parent <> nil) and Parent.HandleAllocated then
  begin
    R := BoundsRect;
    InvalidateRect(Parent.Handle, R, True);
  end;
  inherited;
end;

function TToolBar.WrapButtons(var NewWidth, NewHeight: Integer): Boolean;
var
  Index, NcX, NcY: Integer;
  Vertical: Boolean;
  PrevSize, CurrSize: TPoint;
  R: TRect;
  WrapStates: TBits;

  procedure CalcSize(var CX, CY: Integer);
  var
    IsWrapped: Boolean;
    I, Tmp, X, Y, HeightChange, LWidth: Integer;
    Control: TControl;
    LRect: TRect;
  begin
    CX := 0;
    CY := 0;
    X := Indent;
    Y := 0;
    for I := 0 to FButtons.Count - 1 do
    begin
      Control := TControl(FButtons[I]);
      LWidth := Control.Width;
      if (csDesigning in ComponentState) or Control.Visible then
      begin
        if (Control is TToolButton) and (I < FButtons.Count - 1) then
          if WrapStates <> nil then
            IsWrapped := WrapStates[I]
          else
            IsWrapped := TToolButton(Control).Wrap
        else
          IsWrapped := False;
        if Control is TToolButton and
          (TToolButton(Control).Style in [tbsSeparator, tbsDivider]) then
        begin
          { Store the change in height, from the current row to the next row
            after wrapping, in HeightChange. THe IE4 version of comctl32
            considers this height to be the width the last separator on the
            current row - prior versions of comctl32 consider this height to be
            2/3 the width the last separator. }
          HeightChange := LWidth;
          if (GetComCtlVersion < ComCtlVersionIE4) or not Flat and
            (GetComCtlVersion >= ComCtlVersionIE401) then
            HeightChange := HeightChange * 2 div 3;
          if IsWrapped and (I < FButtons.Count - 1) then
          begin
            Tmp := Y + ButtonHeight + HeightChange;
            if Tmp > CY then
              CY := Tmp;
          end
          else
          begin
            Tmp := X + LWidth;
            if Tmp > CX then
              CX := Tmp;
          end;
          if IsWrapped then
            Inc(Y, HeightChange);
        end
        else
        begin
          if (Control is TToolButton) and
             (TToolButton(Control).Style in [tbsDropDown]) then
            if Perform(TB_GETRECT, I, LRect) <> 0 then
              LWidth := LRect.Right - LRect.Left
            else
              Inc(LWidth, 13);

          Tmp := X + LWidth;
          if Tmp > CX then
            CX := Tmp;
          Tmp := Y + ButtonHeight;
          if Tmp > CY then
            CY := Tmp;
        end;
        if IsWrapped then
        begin
          X := Indent;
          Inc(Y, ButtonHeight);
        end
        else
          Inc(X, LWidth);
      end;
    end;
    { Adjust for 2 pixel top margin when not flat style buttons }
    if (CY > 0) and not Flat then
      Inc(CY, 2);
  end;

  function WrapHorz(CX: Integer): Integer;
  var
    I, J, X: Integer;
    Control: TControl;
    Found: Boolean;
  begin
    Result := 1;
    X := Indent;
    I := 0;
    while I < FButtons.Count do
    begin
      Control := TControl(FButtons[I]);
      if Control is TToolButton then
        WrapStates[I] := False;
      if (csDesigning in ComponentState) or Control.Visible then
      begin
        if (X + Control.Width > CX) and (not (Control is TToolButton) or
          not (TToolButton(Control).Style in [tbsDivider, tbsSeparator])) then
        begin
          Found := False;
          for J := I downto 0 do
            if TControl(FButtons[J]) is TToolButton then
              with TToolButton(FButtons[J]) do
                if ((csDesigning in ComponentState) or Visible) and
                  (Style in [tbsSeparator, tbsDivider]) then
                begin
                  if not WrapStates[J] then
                  begin
                    Found := True;
                    I := J;
                    X := Indent;
                    WrapStates[J] := True;
                    Inc(Result);
                  end;
                  Break;
                end;
          if not Found then
          begin
            for J := I - 1 downto 0 do
              if TControl(FButtons[J]) is TToolButton then
                with TToolButton(FButtons[J]) do
                  if (csDesigning in ComponentState) or Visible then
                  begin
                    if not WrapStates[J] then
                    begin
                      Found := True;
                      I := J;
                      X := Indent;
                      WrapStates[J] := True;
                      Inc(Result);
                    end;
                    Break;
                  end;
            if not Found then
              Inc(X, Control.Width);
          end;
        end
        else
          Inc(X, Control.Width);
      end;
      Inc(I);
    end;
  end;

  function WrapSizeVert(var CX, CY: Integer): Integer;
  var
    HorzSize, VertSize, Size, PrevSize: TPoint;
  begin
    PrevSize := Point(-1,-1);
    Size := Point(0,0);
    Result := 0;
    WrapHorz(0);
    CalcSize(VertSize.X, VertSize.Y);
    WrapHorz(MaxInt);
    CalcSize(HorzSize.X, HorzSize.Y);
    while VertSize.X < HorzSize.X do
    begin
      PrevSize := Size;
      Size.X := (VertSize.X + HorzSize.X) div 2;
      Result := WrapHorz(Size.X);
      CalcSize(Size.X, Size.Y);
      if CY < Size.Y then
      begin
        if (VertSize.X = Size.X) and (VertSize.Y = Size.Y) then
        begin
          Result := WrapHorz(HorzSize.X);
          Break;
        end;
        VertSize := Size;
      end
      else if CY > Size.Y then
      begin
        HorzSize := Size;
        if (PrevSize.X = Size.X) and (PrevSize.Y = Size.Y) then Break;
      end
      else
        Break;
    end;
  end;

  function WrapSizeHorz(var CX, CY: Integer): Integer;
  var
    HorzRows, VertRows, Min, Mid, Max: Integer;
    HorzSize: TPoint;
  begin
    Result := 0;
    Min := 0;
    Max := CX;
    HorzRows := WrapHorz(Max);
    VertRows := WrapHorz(0);
    if HorzRows <> VertRows then
      while Min < Max do
      begin
        Mid := (Min + Max) div 2;
        VertRows := WrapHorz(Mid);
        if VertRows = HorzRows then
          Max := Mid
        else
        begin
          if Min = Mid then
          begin
            WrapHorz(Max);
            Break;
          end;
          Min := Mid;
        end;
      end;
    CalcSize(HorzSize.X, HorzSize.Y);
    WrapHorz(HorzSize.X);
  end;

begin
  Result := True;
  if HandleAllocated then
  begin
    Index := InternalButtonCount - 1;
    if (Index >= 0) or not (csDesigning in ComponentState) then
    begin
      WrapStates := nil;
      PrevSize.X := ClientWidth;
      PrevSize.Y := ClientHeight;
      { Calculate non-client border size }
      NcX := Width - PrevSize.X;
      NcY := Height - PrevSize.Y;
      { Remember previous size for comparison }
      R.BottomRight := PrevSize;
      CalcSize(PrevSize.X, PrevSize.Y);
      { Get current window size minus the non-client borders }
      CurrSize := Point(NewWidth - NcX, NewHeight - NcY);

      { Decide best way to calculate layout }
      if Align <> alNone then
        Vertical := Align in [alLeft, alRight]
      else
        Vertical := Abs(CurrSize.X - R.Right) < Abs(CurrSize.Y - R.Bottom);
      if Wrapable then
      begin
        WrapStates := TBits.Create;
        try
          WrapStates.Size := FButtons.Count;
          if Vertical then
            WrapSizeVert(CurrSize.X, CurrSize.Y)
          else
            WrapSizeHorz(CurrSize.X, CurrSize.Y);
          { CurrSize now has optimium dimensions }
          CalcSize(CurrSize.X, CurrSize.Y);
          if (Vertical or (Align = alNone)) and (CurrSize.X <> PrevSize.X) or
            (CurrSize.Y <> PrevSize.Y) then
          begin
            { Enforce changes to Wrap property }
            for Index := 0 to WrapStates.Size - 1 do
              if TControl(FButtons[Index]) is TToolButton then
                TToolButton(FButtons[Index]).Wrap := WrapStates[Index];
            RepositionButtons(0);
          end
          else
            { Overwrite any changes to buttons' Wrap property }
            UpdateButtonStates;
        finally
          WrapStates.Free;
        end;
      end
      else
        { CurrSize now has optimium dimensions }
        CalcSize(CurrSize.X, CurrSize.Y);
      if AutoSize and (Align <> alClient) then
      begin
        if Vertical or (Align = alNone) then
          NewWidth := CurrSize.X + NcX;
        if not Vertical or (Align = alNone) then
          NewHeight := CurrSize.Y + NcY;
      end;
    end;
  end;
end;

function TToolBar.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := WrapButtons(NewWidth, NewHeight);
end;

{$IFDEF CLR}
procedure TToolBar.ControlChange(Inserting: Boolean; Child: TControl);
begin
  inherited;
  if Inserting then
    InsertButton(Child)
  else
    RemoveButton(Child);
end;
{$ELSE}
procedure TToolBar.CMControlChange(var Message: TCMControlChange);
begin
  inherited;
  with Message do
    if Inserting then
      InsertButton(Control)
    else
      RemoveButton(Control);
end;
{$ENDIF}

procedure TToolBar.CNChar(var Message: TWMChar);
begin
  { We got here through the installed ToolMenuKeyHook }
  if FInMenuLoop and not (csDesigning in ComponentState) then
    with Message do
      if Perform(CM_DIALOGCHAR, CharCode, KeyData) <> 0 then
        Result := 1;
end;

procedure TToolBar.CMDialogChar(var Message: TCMDialogChar);

  function ContainsActiveControl: Boolean;
  var
    F: TCustomForm;
  begin
    F := GetParentForm(Self, False);
    if (F <> nil) and (Screen.ActiveControl <> nil) then
      Result := (F = Screen.ActiveControl) or F.ContainsControl(Screen.ActiveControl)
    else
      Result := False;
  end;

var
  Button: TToolButton;
begin
  if Enabled and Showing and (ShowCaptions or AllowTextButtons) and ContainsActiveControl then
  begin
    Button := FindButtonFromAccel(Message.CharCode);
    if (Button <> nil) and (not AllowTextButtons or (Button.Style = tbsTextButton)) then
    begin
      { Display a drop-down menu after hitting the accelerator key if IE3
        is installed. Otherwise, fire the OnClick event for IE4. We do this
        because the IE4 version of the drop-down metaphor is more complete,
        allowing the user to click a button OR drop-down its menu. }
      if ((Button.Style <> tbsDropDown) or (GetComCtlVersion < ComCtlVersionIE4)) and
        ((Button.DropdownMenu <> nil) or (Button.MenuItem <> nil)) then
        TrackMenu(Button)
      else
        Button.Click;
      Message.Result := 1;
      Exit;
    end;
  end;
  inherited;
end;

procedure TToolBar.CMDockNotification(var Message: TCMDockNotification);
begin
  inherited;
  // Ensure that any dockhost invalidation is properly relayed on to
  // outer dock hosts.
  if (Message.NotifyRec.ClientMsg = CM_INVALIDATEDOCKHOST) then
    InvalidateDockHostSite(Boolean(Message.NotifyRec.MsgLParam));
end;

procedure TToolBar.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Broadcast(Message);
end;

procedure TToolBar.CMColorChanged(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TToolBar.CMParentColorChanged(var Message: TMessage);
begin
  inherited;
  { If toolbar is transparent then repaint when parent changes color }
  if Transparent then Invalidate;
end;

procedure TToolBar.CNSysKeyDown(var Message: TWMSysKeyDown);
begin
  inherited;
  if (Message.CharCode = VK_MENU) then
    CancelMenu;
end;

procedure TToolBar.CMSysFontChanged(var Message: TMessage);
begin
  inherited;
  if not Screen.UpdatingAllFonts then
    RecreateWnd;
end;

procedure TToolBar.CMSysFontsAllChanged(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TToolBar.CNDropDownClosed(var Message: TMessage);
begin
  ClearTempMenu;
  FMenuDropped := False;
  if (GetComCtlVersion = ComCtlVersionIE5) and (FMenuButton <> nil)
    then FMenuButton.Invalidate;
  FCaptureChangeCancels := True;
end;

procedure TToolBar.CNNotify(var Message: TWMNotifyTLB);
var
  Button: TToolButton;
  DefaultDraw: Boolean;
  CustomDrawn: Boolean;
  R: TRect;
  Flags: TTBCustomDrawFlags;
  LogFont: TLogFont;
{$IFDEF CLR}
  NMTB: TNMToolBar;
  TBCustomDraw: TNMTBCustomDraw;
{$ELSE}
  NMTB: PNMToolBar;
  TBCustomDraw: PNMTBCustomDraw;
{$ENDIF}
begin
  with Message do
    case NMHdr.code of
      TBN_DROPDOWN:
        begin
          NMTB := NMToolBar;
          with NMTB{$IFNDEF CLR}^{$ENDIF} do
          begin
            { We can safely assume that a TBN_DROPDOWN message was generated by a
              TToolButton and not any TControl. }
            if Perform(TB_GETBUTTON, iItem, tbButton) <> 0 then
            begin
{$IFDEF CLR}
              Button := TToolButton(FButtonHashTable.Item[TObject(tbButton.dwData)]);
{$ELSE}
              Button := TToolButton(tbButton.dwData);
{$ENDIF}
              if Button <> nil then
                Button.CheckMenuDropDown;
            end;
          end;
{$IFDEF CLR}
          NMToolBar := NMTB;
{$ENDIF}
        end;
      NM_CUSTOMDRAW:
        begin
          TBCustomDraw := NMTBCustomDraw;
          with TBCustomDraw{$IFNDEF CLR}^{$ENDIF} do
          try
            FCanvas.Lock;
            Result := CDRF_DODEFAULT;
            if (nmcd.dwDrawStage and CDDS_ITEM) = 0 then
            begin
              R := ClientRect;
              case nmcd.dwDrawStage of
                CDDS_PREPAINT:
                  begin
                    CustomDrawn := IsCustomDrawn(dtControl, cdPrePaint);
                    if CustomDrawn or (DrawingStyle = dsGradient) then
                    begin
                      try
                        FCanvas.Handle := nmcd.hdc;
                        FCanvas.Font := Font;
                        FCanvas.Brush := Brush;
                        if CustomDrawn then
                          DefaultDraw := CustomDraw(R, cdPrePaint)
                        else
                          DefaultDraw := GradientDrawToolBar(R);
                        if not DefaultDraw then
                        begin
                          Result := CDRF_SKIPDEFAULT;
                          Exit;
                        end;
                        clrText := ColorToRGB(FCanvas.Font.Color);
                        clrBtnFace := ColorToRGB(FCanvas.Brush.Color);
                      finally
                        FCanvas.Handle := 0;
                      end;
                    end;
                    if IsCustomDrawn(dtItem, cdPrePaint) or
                       IsCustomDrawn(dtItem, cdPreErase) or
                       IsCustomDrawn(dtItem, cdPreErase) or
                       (DrawingStyle = dsGradient) then
                      Result := Result or CDRF_NOTIFYITEMDRAW;
                    if IsCustomDrawn(dtItem, cdPostPaint) then
                      Result := Result or CDRF_NOTIFYPOSTPAINT;
                    if IsCustomDrawn(dtItem, cdPostErase) then
                      Result := Result or CDRF_NOTIFYPOSTERASE;
                  end;
                CDDS_POSTPAINT:
                  if IsCustomDrawn(dtControl, cdPostPaint) then
                    CustomDraw(R, cdPostPaint);
                CDDS_PREERASE:
                  if IsCustomDrawn(dtControl, cdPreErase) then
                    CustomDraw(R, cdPreErase);
                CDDS_POSTERASE:
                  if IsCustomDrawn(dtControl, cdPostErase) then
                    CustomDraw(R, cdPostErase);
              end;
{$IFDEF CLR}
              // write changes back to Message
              NMTBCustomDraw := TBCustomDraw;
{$ENDIF}
            end else
            begin
              Button := nil;
              if Integer(nmcd.dwItemSpec) < FButtons.Count then
              Button := Buttons[nmcd.dwItemSpec];
            if Button = nil then Exit;
              case nmcd.dwDrawStage of
                CDDS_ITEMPREPAINT:
                  begin
                    try
                      FCanvas.Handle := nmcd.hdc;
                      FCanvas.Font := Self.Font;
                      FCanvas.Brush := Self.Brush;
                      FCanvas.Font.OnChange := CanvasChanged;
                      FCanvas.Brush.OnChange := CanvasChanged;
                      FCanvasChanged := False;
                      Flags := [];
                      DefaultDraw := CustomDrawButton(Button,
                        TCustomDrawState(Word(nmcd.uItemState)), cdPrePaint, Flags);
                    if DefaultDraw and (DrawingStyle = dsGradient) then
                    begin
                      Flags := [];
                      DefaultDraw := GradientDrawButton(Button,
                                      TCustomDrawState(Word(nmcd.uItemState)),
                                      Flags);
                    end;
                      if tbNoEdges in Flags then
                        Result := Result or TBCDRF_NOEDGES;
                      if tbHiliteHotTrack in Flags then
                    begin
                        Result := Result or TBCDRF_HILITEHOTTRACK;
                      // clrHighlightHotTrack := HotTrackColor; // should we set this?
                    end;
                      if tbNoOffset in Flags then
                        Result := Result or TBCDRF_NOOFFSET;
                      if tbNoMark in Flags then
                        Result := Result or TBCDRF_NOMARK;
                      if tbNoEtchedEffect in Flags then
                        Result := Result or TBCDRF_NOETCHEDEFFECT;
                      clrText := ColorToRGB(FCanvas.Font.Color);
                      clrBtnFace := ColorToRGB(FCanvas.Brush.Color);
                      if not DefaultDraw then
                      begin
                        Result := Result or CDRF_SKIPDEFAULT;
                        Exit;
                      end
                      else
                      if FCanvasChanged then
                      begin
                        FCanvasChanged := False;
                        FCanvas.Font.OnChange := nil;
                        FCanvas.Brush.OnChange := nil;
{$IFDEF CLR}
                        if GetObject(FCanvas.Font.Handle, Marshal.SizeOf(LogFont), LogFont) <> 0 then
{$ELSE}
                        if GetObject(FCanvas.Font.Handle, SizeOf(LogFont), @LogFont) <> 0 then
{$ENDIF}
                        begin
                          FCanvas.Handle := 0;  // disconnect from hdc
                          // don't delete the stock font
                          FOurFont := CreateFontIndirect(LogFont);
                          FStockFont := SelectObject(nmcd.hdc, FOurFont);
                          Result := Result or CDRF_NEWFONT;
{$IFDEF CLR}
                          // write changes back to Message
                          NMTBCustomDraw := TBCustomDraw;
{$ENDIF}
                        end;
                      end;
                      if IsCustomDrawn(dtItem, cdPostPaint) then
                        Result := Result or CDRF_NOTIFYPOSTPAINT;
                    finally
                      FCanvas.Handle := 0;
                    end;
                  end;
                CDDS_ITEMPOSTPAINT:
                begin
                  try
                    FCanvas.Handle := nmcd.hdc;
                    FCanvas.Font := Self.Font;
                    FCanvas.Brush := Self.Brush;
                    if Button <> nil then
                      CustomDrawButton(Button, TCustomDrawState(Word(nmcd.uItemState)),
                        cdPostPaint, Flags);
                  finally
                    FCanvas.Handle := 0;
                  end;
                  //release the font we may have loaned during item drawing.
                  if (FOurFont <> 0) and (FStockFont <> 0) then
                  begin
                    SelectObject(nmcd.hdc, FStockFont);
                    DeleteObject(FOurFont);
                    FOurFont := 0;
                    FStockFont := 0;
                  end;
                end;
                CDDS_ITEMPREERASE:
                  if Button <> nil then
                    CustomDrawButton(Button, TCustomDrawState(Word(nmcd.uItemState)),
                      cdPreErase, Flags);
                CDDS_ITEMPOSTERASE:
                  if Button <> nil then
                    CustomDrawButton(Button, TCustomDrawState(Word(nmcd.uItemState)),
                      cdPostErase, Flags);
              end;
            end;
          finally
            FCanvas.Unlock;
          end;
        end;
      TBN_QUERYINSERT:
        with NMToolbar{$IFNDEF CLR}^{$ENDIF} do
        begin
          if not FCustomizing and (iItem = FLastQueryDeleteIndex) then
            // See comment about dragging buttons below...
            Result := 0
          else
          begin
            Result := Integer(DoQueryInsert(iItem));
            if (tbButton.dwData = 0) and (tbButton.fsStyle = ButtonStyles[tbsSeparator]) then
            begin
              Button := TToolButton.Create(Owner);
              Button.Style := tbsSeparator;
              FButtons.Insert(iItem, Button);
              Inc(FSeparators);
            end;
          end;
          FLastQueryDeleteIndex := -1;
        end;
      TBN_QUERYDELETE:
        with NMToolbar{$IFNDEF CLR}^{$ENDIF} do
        begin
          Result := Integer(DoQueryDelete(iItem));
          // Dragging a button holding the SHIFT key and dropping it
          // in it's original place will cause the ToolBar to insert
          // an extra "garbage" button. This causes an AV when the buttons
          // are recreated from the ToolBar. When the customize dialog isn't
          // showing, track the last index of TBN_QUERYDELETE so it can be
          // ignored when the TBN_QUERYINSERT notification is handled.
          if not FCustomizing then
            FLastQueryDeleteIndex := iItem;
        end;
      TBN_GETBUTTONINFOA, TBN_GETBUTTONINFOW:
        begin
          NMTB := NMToolBar;
          if FCustomizing then
          begin
            Result := Integer(DoGetButton(NMTB{$IFNDEF CLR}^{$ENDIF}));
{$IFDEF CLR}
            NMToolBar := NMTB;
{$ENDIF}
          end;
        end;
      TBN_DELETINGBUTTON:
        if FCustomizing and not FRestoring and Assigned(FOnCustomizeDelete) then
        begin
          Button := TToolButton(FButtons[NMToolbar.iItem]);
          FOnCustomizeDelete(Self, Button);
        end;
      TBN_BEGINADJUST:
        begin
          FCustomizing := True;
          FSeparators := 0;
          if Assigned(FOnCustomizing) then
            FOnCustomizing(Self);
          if not FRestoring then
            SaveButtons(True);
        end;
      TBN_ENDADJUST:
        begin
          if not FRestoring then
          begin
            RecreateButtonsFromToolbar;
            FCustomizing := False;
          end
          else
          if Assigned(FOnCustomizeReset) then
            FOnCustomizeReset(Self);
          FRestoring := False;
        end;
      TBN_TOOLBARCHANGE:
        begin
          if not FCustomizing then //Buttons were dragged holding SHIFT key down.
            RecreateButtonsFromToolbar;
          if Assigned(FOnCustomized) then
            FOnCustomized(Self);
        end;
      TBN_RESET:
        begin
          FRestoring := True;
          SaveButtons(False);
          RecreateButtonsFromToolbar;
          FRestoring := False;
        end;
    end;
end;

procedure TToolBar.RecreateButtonsFromToolbar;
var
  I: Integer;
  ButtonInfo: TTBBUTTON;
  Button: TToolButton;
  TBButtonCount: Integer;
begin
  TBButtonCount := SendMessage(Handle, TB_BUTTONCOUNT, 0, 0);
  FButtons.Clear;
  for I := 0 to TBButtonCount - 1 do
  begin
    SendGetStructMessage(Handle, TB_GETBUTTON, I, ButtonInfo);
    if ButtonInfo.dwData = 0 then
    begin
      Button := TToolButton.Create(Owner);
      Button.Style := tbsSeparator;
{$IFDEF CLR}
      // Add to hashtable to allow access to the actual Button
      // object from the TBButton struct
      if not FButtonHashTable.ContainsValue(Button) then
        FButtonHashTable.Add(TObject(Button.GetHashCode), Button);
      ButtonInfo.dwData := Button.GetHashCode;
{$ELSE}
      ButtonInfo.dwData := UIntPtr(Button);
{$ENDIF}
      Button.FToolbar := Self;
      SendMessage(Handle, TB_DELETEBUTTON, I, 0);
      SendStructMessage(Handle, _TB_INSERTBUTTON, I, ButtonInfo);
{$IFDEF CLR}
    end
    else
      Button := TToolButton(FButtonHashTable.Item[TObject(ButtonInfo.dwData)]);
    FButtons.Add(Button);
{$ELSE}
    end;
    FButtons.Add(Pointer(ButtonInfo.dwData));
{$ENDIF}
  end;
  RecreateButtons;
end;

type
  TControlAccess = class(TControl);

procedure TToolBar.WndProc(var Message: TMessage);
var
  Control: TControl;
  CapControl: TControl;
  Msg: TMsg;
{$IFDEF CLR}
  MouseMsg: TWMMouse;
{$ENDIF}

  function IsToolButtonMouseMsg(var Message: TWMMouse): Boolean;
  begin
    if GetCapture = Handle then
    begin
      CapControl := GetCaptureControl;
      if (CapControl <> nil) and (CapControl.Parent <> Self) then
        CapControl := nil;
    end
    else
      CapControl := nil;
    Control := ControlAtPos(SmallPointToPoint(Message.Pos), False);
    Result := (Control <> nil) and (Control is TToolButton) and
      not Control.Dragging;
  end;

  procedure SendDropdownMsg(Button: TToolButton);
  var
    Msg: TNMToolBar;
  begin
{$IFNDEF CLR}
    FillChar(Msg, SizeOf(Msg), 0);
{$ENDIF}
    with Msg, hdr do
    begin
      hwndFrom := Handle;
      idFrom := Handle;
      code := TBN_DROPDOWN;
      iItem := Button.Index;
    end;
    SendStructMessage(Handle, WM_NOTIFY, Handle, Msg);
  end;

begin
  if not (csDesigning in ComponentState) then
  begin
    case Message.Msg of
      WM_MOUSEMOVE:
        begin
          { Call default wndproc to get buttons to repaint when Flat = True. }
{$IFDEF CLR}
          MouseMsg := TWMMouse.Create(Message);
          if IsToolButtonMouseMsg(MouseMsg) then
{$ELSE}
          if IsToolButtonMouseMsg(TWMMouse(Message)) then
{$ENDIF}
          begin
            { Prevent painting of flat buttons when they are dock clients }
            if TControlAccess(Control).DragMode <> dmAutomatic then
              DefaultHandler(Message);
          end
          else
            DefaultHandler(Message);
        end;
      WM_LBUTTONUP:
        begin
          { Update button states after a click. }
{$IFDEF CLR}
          MouseMsg := TWMMouse.Create(Message);
          if IsToolButtonMouseMsg(MouseMsg) then
{$ELSE}
          if IsToolButtonMouseMsg(TWMMouse(Message)) then
{$ENDIF}
          begin
            DefaultHandler(Message);
            if (CapControl = Control) or (Control is TToolButton) then
            begin
              with TToolButton(Control) do
                if Down and Grouped and AllowAllUp and (Style = tbsCheck) then
                  Down := False;
              UpdateButtonStates;
            end
            else
              if (CapControl is TToolButton) or (TToolButton(Control).Style = tbsDropDown) then
                Exit;
          end;
        end;
      WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
        begin
{$IFDEF CLR}
          MouseMsg := TWMMouse.Create(Message);
          if IsToolButtonMouseMsg(MouseMsg) then
{$ELSE}
          if IsToolButtonMouseMsg(TWMMouse(Message)) then
{$ENDIF}
          begin
            { Check if mouse is clicked on a drop-down button's arrow (for IE4+
              the arrow is within 13 pixels from the right, for IE3 there is no
              distinction - the entire button is used).  If an arrow click is
              detected then don't process this mouse event - a TBN_DROPDOWN
              notification will be created for us by the default wndproc. }
            with TToolButton(Control) do
            begin
              { Allow IsControlMouseMsg to deliver message to button.
                This causes the clicking to happen. }
              if FInMenuLoop and Self.MouseCapture then
                MouseCapture := True;
              { When the style is tbsDropDown, and we have IE4+, we need
                to subtract the drop down button width of 14 pixels, otherwise
                it will cause the drop down menu to "stick" down }
              if (Style <> tbsDropDown) or
                 (GetComCtlVersion >= ComCtlVersionIE4) and
{$IFDEF CLR}
                 (MouseMsg.XPos < Left + Width - 14) then
{$ELSE}
                 (TWMMouse(Message).XPos < Left + Width - 14) then
{$ENDIF}
                inherited WndProc(Message);
            end;
            if not Control.Dragging then
              DefaultHandler(Message);

            if (TToolButton(Control).Style <> tbsDropDown) and
              ((TToolButton(Control).DropdownMenu <> nil) or
              (TToolButton(Control).MenuItem <> nil)) then
            begin
              try
                SendDropDownMsg(TToolButton(Control));
              finally
                { Here we remove WM_LBUTTONDOWN message sent and instead dispatch
                  it as a WM_LBUTTONUP to get a Click fired. }
                Msg.Message := 0;
                if PeekMessage(Msg, Handle, WM_LBUTTONDOWN, WM_LBUTTONDOWN,
                  PM_REMOVE) and (Msg.Message = WM_QUIT) then
                  PostQuitMessage(Msg.WParam)
                else
                begin
                  Message.Msg := WM_LBUTTONUP;
                  Dispatch(Message);
                end;
              end;
            end;
            Exit;
          end;
        end;
    end
  end;
  inherited WndProc(Message);
end;

procedure TToolBar.FlipChildren(AllLevels: Boolean);
begin { do not flip controls }
end;

function TToolBar.FindButtonFromAccel(Accel: Word): TToolButton;
var
  I: Integer;
begin
  for I := 0 to FButtons.Count - 1 do
    if TControl(FButtons[I]) is TToolButton then
    begin
      Result := TToolButton(FButtons[I]);
      if Result.Visible and Result.Enabled and IsAccel(Accel, Result.Caption) then
        Exit;
    end;
  Result := nil;
end;

{ CustomDraw support }

function TToolBar.IsCustomDrawn(Target: TCustomDrawTarget;
  Stage: TCustomDrawStage): Boolean;
begin
  if Stage = cdPrePaint then
  begin
    if Target = dtItem then
      Result := Assigned(FOnCustomDrawButton) or Assigned(FOnAdvancedCustomDrawButton)
    else if Target = dtControl then
      Result := Assigned(FOnCustomDraw) or Assigned(FOnAdvancedCustomDraw) or
        Assigned(FOnCustomDrawButton) or Assigned(FOnAdvancedCustomDrawButton)
    else
      Result := False;
  end
  else
  begin
    if Target = dtItem then
      Result := Assigned(FOnCustomDrawButton) or Assigned(FOnAdvancedCustomDrawButton)
    else if Target = dtControl then
      Result := Assigned(FOnAdvancedCustomDraw) or Assigned(FOnAdvancedCustomDrawButton)
    else
      Result := False;
  end;
end;

function TToolBar.CustomDraw(const ARect: TRect; Stage: TCustomDrawStage): Boolean;
begin
  Result := True;
  if (Stage = cdPrePaint) and Assigned(FOnCustomDraw) then
    FOnCustomDraw(Self, ARect, Result);
  if Assigned(FOnAdvancedCustomDraw) then
    FOnAdvancedCustomDraw(Self, ARect, Stage, Result);
end;

function TToolBar.CustomDrawButton(Button: TToolButton; State: TCustomDrawState;
  Stage: TCustomDrawStage; var Flags: TTBCustomDrawFlags): Boolean;
begin
  Result := True;
  if (Stage = cdPrePaint) and Assigned(FOnCustomDrawButton) then
    FOnCustomDrawButton(Self, Button, State, Result);
  if Assigned(FOnAdvancedCustomDrawButton) then
    FOnAdvancedCustomDrawButton(Self, button, State, Stage, Flags, Result);
end;

procedure TToolBar.CanvasChanged(Sender: TObject);
begin
  FCanvasChanged := True;
end;

function TToolBar.GradientDrawButton(Button: TToolButton; State: TCustomDrawState;
  var Flags: TTBCustomDrawFlags): Boolean;
const
  cInset = 4;
var
  FillColor: TColor;
  EdgeColor: TColor;
  R: TRect;
  X: Integer;
  Y: Integer;
  Str: string;
  ImageList: TCustomImageList;
begin
  Result := False;
  FBitmap.Canvas.Pen.Assign(Canvas.Pen);
  FBitmap.Canvas.Brush.Assign(Canvas.Brush);
  FBitmap.Canvas.Font.Assign(Canvas.Font);
  ImageList := nil;

  if gdoGradient in GradientDrawingOptions then
  begin
    FBitmap.SetSize(Width, Height);
    GradientFillCanvas(FBitmap.Canvas, FGradientStartColor, FGradientEndColor,
      ClientRect, GradientDirection);
    FBitmap.Canvas.CopyRect(Rect(0, 0, Button.Width, Button.Height),
      FBitmap.Canvas, Button.BoundsRect);
    FBitmap.SetSize(Button.Width, Button.Height);
  end
  else
  begin
    FBitmap.SetSize(Button.Width, Button.Height);
    FBitmap.Canvas.Brush.Color := Button.Color;
    FBitmap.Canvas.Brush.Style := bsSolid;
    FBitmap.Canvas.FillRect(FBitmap.Canvas.ClipRect);
  end;

  if (Button.Style = tbsButton) or (Button.Style = tbsCheck) or
     (Button.Style = tbsDropDown) or (Button.Style = tbsTextButton) then
  begin
    if cdsHot in State then
      ImageList := HotImages;
    if not Button.Enabled then
      ImageList := DisabledImages;
    if ImageList = nil then
      ImageList := Images;

    if (cdsHot in State) or (Button.Down and Button.Enabled) then
    begin
      if (gdoHotTrack in GradientDrawingOptions) then
      begin
        FillColor := HotTrackColor;
        if cdsSelected in State then
          FillColor := GetShadowColor(FillColor, -25);
        EdgeColor := GetShadowColor(FillColor);

        R := Rect(0, 0, Button.Width, Button.Height);

        FBitmap.Canvas.Brush.Color := EdgeColor;
        if Button.Style = tbsDropDown then
          Dec(R.Right, cDropDownWidth - (FBitmap.Canvas.Pen.Width div 2));

        FBitmap.Canvas.FillRect(R);
        InflateRect(R, -FBitmap.Canvas.Pen.Width, -FBitmap.Canvas.Pen.Width);
        FBitmap.Canvas.Brush.Color := FillColor;
        FBitmap.Canvas.FillRect(R);
        InflateRect(R, FBitmap.Canvas.Pen.Width, FBitmap.Canvas.Pen.Width);

        if Button.Style = tbsDropDown then
        begin
          R.Left := R.Right;
          Inc(R.Right, cDropDownWidth - (FBitmap.Canvas.Pen.Width div 2));
          FBitmap.Canvas.Brush.Color := EdgeColor;
          FBitmap.Canvas.FillRect(R);
          InflateRect(R, -FBitmap.Canvas.Pen.Width, -FBitmap.Canvas.Pen.Width);
          FBitmap.Canvas.Brush.Color := FillColor;
          FBitmap.Canvas.FillRect(R);
        end;
      end
      else
      begin
        if Button.Down then
        begin
          FillColor := cl3DDkShadow;
          EdgeColor := cl3DLight;
        end
        else
        begin
          FillColor := cl3DLight;
          EdgeColor := cl3DDkShadow;
        end;

        R := Rect(0, 0, Button.Width, Button.Height);

        Frame3D(FBitmap.Canvas, R, FillColor, EdgeColor, Canvas.Pen.Width);

        if Button.Style = tbsDropDown then
        begin
          FBitmap.Canvas.MoveTo(R.Right - cDropDownWidth, 0);
          FBitmap.Canvas.LineTo(R.Right - cDropDownWidth, Button.Height);
        end;
      end;
    end;

    if (ImageList <> nil) and (Button.ImageIndex >= 0) and (Button.ImageIndex < ImageList.Count) or
       ((ImageList <> nil) and (Button.Style = tbsTextButton)) then
    begin
      if (ShowCaptions and List) or (AllowTextButtons and (Button.Style = tbsTextButton)) then
        X := cInset
      else
      begin
        X := (Button.Width - ImageList.Width) div 2;
        if Button.Style = tbsDropDown then
          Dec(X, cDropDownWidth div 2);
      end;
      if (List and not AllowTextButtons) or
         (AllowTextButtons and (Button.Style = tbsTextButton)) then
        Y := (Button.Height - ImageList.Height) div 2
      else
        Y := cInset;

      ImageList.Draw(FBitmap.Canvas, X, Y, Button.ImageIndex,
        dsTransparent, itImage, Button.Enabled or (csDesigning in ComponentState) or
        (not Button.Enabled and (ImageList = DisabledImages)));
    end;

    if (Button.Style = tbsDropDown) then
    begin
      X := Button.Width - ((cDropDownWidth div 2) + (cDropDownWidth div 4));
      Y := Button.Height div 2;

      FBitmap.Canvas.Pen.Color := Button.Font.Color;
      if not Button.Enabled then
        FBitmap.Canvas.Pen.Color := clGrayText;

      FBitmap.Canvas.Brush.Style := bsSolid;
      DrawArrow(FBitmap.Canvas, sdDown, Point(X, Y), cDropDownWidth div 4);
    end;

    if (ShowCaptions and not AllowTextButtons) or
       (AllowTextButtons and (Button.Style = tbsTextButton)) then
    begin
      FBitmap.Canvas.Brush.Style := bsClear;
      if (ImageList <> nil) and List and ((Button.Style <> tbsTextButton) or
         ((Button.Style = tbsTextButton) and (Button.ImageIndex <> -1))) then
        R.Left := ImageList.Width
      else
        R.Left := 0;
      R.Right := Button.Width;

      Str := Button.Caption;

      if Button.Style = tbsDropDown then
        Dec(R.Right, cDropDownWidth - (FBitmap.Canvas.Pen.Width div 2));
      if (not List) and (ImageList <> nil) then
        R.Top := ImageList.Height + cInset
      else
        R.Top := (Button.Height div 2) - (FBitmap.Canvas.TextHeight(Str) div 2);
      R.Bottom := R.Top + FBitmap.Canvas.TextHeight(Str);

      FBitmap.Canvas.Font.Color := Button.Font.Color;
      if not Button.Enabled then
        FBitmap.Canvas.Font.Color := clGrayText;

      DrawText(FBitmap.Canvas.Handle, Str, Length(Str), R,
        DT_END_ELLIPSIS or DT_NOCLIP or DT_VCENTER or DT_CENTER);
    end;
  end;

  Canvas.Draw(Button.Left, Button.Top, FBitmap);
end;

function TToolBar.GradientDrawToolBar(const ARect: TRect): Boolean;
begin
  Result := True;
  if gdoGradient in GradientDrawingOptions then
    GradientFillCanvas(Canvas, FGradientStartColor, FGradientEndColor,
      ARect, GradientDirection);
end;

procedure TToolBar.SetGradientDrawingOptions(Value: TTBGradientDrawingOptions);
begin
  if Value <> FGradientDrawingOptions then
  begin
    FGradientDrawingOptions := Value;
    if HandleAllocated then
    Repaint;
  end;
end;

procedure TToolBar.SetDrawingStyle(Value: TTBDrawingStyle);
begin
  if Value <> FDrawingStyle then
  begin
    FDrawingStyle := Value;
    if HandleAllocated then
    Repaint;
  end;
end;

procedure TToolBar.SetGradientEndColor(Value: TColor);
begin
  if Value <> FGradientEndColor then
  begin
    FGradientEndColor := Value;
    if HandleAllocated then
    Repaint;
  end;
end;

procedure TToolBar.SetGradientStartColor(Value: TColor);
begin
  if Value <> FGradientStartColor then
  begin
    FGradientStartColor := Value;
    if HandleAllocated then
    Repaint;
  end;
end;

function TToolBar.Perform(Msg: Cardinal; WParam: WPARAM; var LParam: TTBButton): LRESULT;
begin
{$IFDEF CLR}
  Result := inherited Perform(Msg, WParam, LParam);
{$ELSE}
  Result := inherited Perform(Msg, WParam, Winapi.Windows.LPARAM(@LParam));
{$ENDIF}
end;

function TToolBar.IsGradientEndColorStored: Boolean;
begin
  Result := FGradientEndColor <> GetShadowColor(clBtnFace, -25);
end;

{ Toolbar menu support }

{$IFDEF CLR}
function ToolMenuGetMsgHook(Code: Integer; WParam: WPARAM;
  lParam: LPARAM): LRESULT; forward;
{$ENDIF}

var
  ToolMenuHook: HHOOK;
  InitDone: Boolean = False;
  MenuToolBar, MenuToolBar2: TToolBar;
  MenuButtonIndex: Integer;
  LastMenuItem: TMenuItem;
  LastMousePos: TPoint;
  StillModal: Boolean;
{$IFDEF CLR}
  ToolMenuHookProc: TFNMsgHookProc = ToolMenuGetMsgHook;
{$ENDIF}

{$IFDEF CLR}
function ToolMenuGetMsgHook(Code: Integer; WParam: WPARAM;
  lParam: LPARAM): LRESULT;
{$ELSE}
function ToolMenuGetMsgHook(Code: Integer; WParam: Longint; var Msg: TMsg): Longint; stdcall;
{$ENDIF}
const
  RightArrowKey: array[Boolean] of Word = (VK_LEFT, VK_RIGHT);
  LeftArrowKey: array[Boolean] of Word = (VK_RIGHT, VK_LEFT);
var
  P: TPoint;
  Target: TControl;
  Item: Integer;
  FindKind: TFindItemKind;
  ParentMenu: TMenu;
{$IFDEF CLR}
  Msg: TMsg;
{$ENDIF}

  function FindButton(Forward: Boolean): TToolButton;
  var
    ToolBar: TToolBar;
    I, J, Count: Integer;
  begin
    ToolBar := MenuToolBar;
    if ToolBar <> nil then
    begin
      J := MenuButtonIndex;
      I := J;
      Count := ToolBar.ButtonCount;
      if Forward then
        repeat
          if I = Count - 1 then
            I := 0
          else
            Inc(I);
          Result := ToolBar.Buttons[I];
          if Result.Visible and Result.Enabled and Result.Grouped then
            Exit;
        until I = J
      else
        repeat
          if I = 0 then
            I := Count - 1
          else
            Dec(I);
          Result := ToolBar.Buttons[I];
          if Result.Visible and Result.Enabled and Result.Grouped then
            Exit;
        until I = J;
    end;
    Result := nil;
  end;

begin
{$IFDEF CLR}
  Msg := TMsg(Marshal.PtrToStructure(lParam, TypeOf(TMsg)));
{$ENDIF}
  if LastMenuItem <> nil then
  begin
    ParentMenu := LastMenuItem.GetParentMenu;
    if ParentMenu <> nil then
    begin
      if ParentMenu.IsRightToLeft then
{$IFDEF CLR}
        if Msg.WParam = VK_LEFT then
        begin
          Msg.WParam := VK_RIGHT;
          with Marshal do
            WriteInt32(lParam, Longint(OffsetOf(TypeOf(TMsg), 'wParam')), Msg.WParam);
        end
        else
          if Msg.WParam = VK_RIGHT then
          begin
            Msg.WParam := VK_LEFT;
            with Marshal do
              WriteInt32(lParam, Longint(OffsetOf(TypeOf(TMsg), 'wParam')), Msg.WParam);
          end;
{$ELSE}
        if Msg.WParam = VK_LEFT then
          Msg.WParam := VK_RIGHT
        else 
          if Msg.WParam = VK_RIGHT then
          Msg.WParam := VK_LEFT;
{$ENDIF}
    end;
  end;
{$IFDEF CLR}
  Result := CallNextHookEx(ToolMenuHook, Code, WParam, lParam);
{$ELSE}
  Result := CallNextHookEx(ToolMenuHook, Code, WParam, LPARAM(@Msg));
{$ENDIF}
  if Result <> 0 then
    Exit;
  if (Code = MSGF_MENU) then
  begin
    Target := nil;
    if not InitDone then
    begin
      InitDone := True;
      PostMessage(Msg.Hwnd, WM_KEYDOWN, VK_DOWN, 0);
    end;
    case Msg.Message of
      WM_MENUSELECT:
        begin
          if (HiWord(Msg.WParam) = $FFFF) and (Msg.LParam = 0) then
          begin
            if not StillModal then
              MenuToolBar.CancelMenu;
            Exit;
          end
          else
            StillModal := False;
          FindKind := fkCommand;
          if HiWord(Msg.WParam) and MF_POPUP <> 0 then
            FindKind := fkHandle;
          if FindKind = fkHandle then
            Item := GetSubMenu(Msg.LParam, LoWord(Msg.WParam))
          else
            Item := LoWord(Msg.WParam);
          LastMenuItem := MenuToolBar.FTempMenu.FindItem(Item, FindKind);
        end;
      WM_SYSKEYDOWN:
        if Msg.WParam = VK_MENU then
        begin
          MenuToolBar.CancelMenu;
          Exit;
        end;
      WM_KEYDOWN:
        if Msg.WParam = VK_RETURN then
          MenuToolBar.FMenuResult := True
        else
          if Msg.WParam = VK_ESCAPE then
            StillModal := True
          else
            if LastMenuItem <> nil then
            begin
              if (Msg.WParam = VK_RIGHT) and (LastMenuItem.Count = 0) then
                Target := FindButton(True)
              else
                if (Msg.WParam = VK_LEFT) and (LastMenuItem.GetParentComponent is TPopupMenu) then
                  Target := FindButton(False)
                else
                  Target := nil;
              if Target <> nil then
                P := Target.ClientToScreen(Point(0, 0));
            end;
      WM_MOUSEMOVE:
        begin
          P := Msg.pt;
          if (P.X <> LastMousePos.X) or (P.Y <> LastMousePos.Y) then
          begin
            Target := FindDragTarget(P, False);
            LastMousePos := P;
          end;
        end;
    end;
    if (Target <> nil) and (Target is TToolButton) then
    begin
      with TToolButton(Target) do
        if (Index <> MenuButtonIndex) and Grouped and (Parent <> nil) and
          Parent.HandleAllocated then
        begin
          StillModal := True;
          MenuToolBar.FCaptureChangeCancels := False;
          MenuToolBar.ClickButton(TToolButton(Target));
          MenuToolBar.ClickButton(TToolButton(Target));
        end;
    end;
  end;
end;

procedure InitToolMenuHooks;
begin
  StillModal := False;
  GetCursorPos(LastMousePos);
  if ToolMenuHook = 0 then
{$IFDEF CLR}
    ToolMenuHook := SetWindowsHookEx(WH_MSGFILTER, ToolMenuHookProc, 0,
      GetCurrentThreadID);
{$ELSE}
    ToolMenuHook := SetWindowsHookEx(WH_MSGFILTER, @ToolMenuGetMsgHook, 0,
      GetCurrentThreadID);
{$ENDIF}
end;

procedure ReleaseToolMenuHooks;
begin
  if ToolMenuHook <> 0 then
    UnhookWindowsHookEx(ToolMenuHook);
  ToolMenuHook := 0;
  LastMenuItem := nil;
  MenuToolBar := nil;
  MenuButtonIndex := -1;
  InitDone := False;
end;

procedure ReleaseToolMenuKeyHooks; forward;
{$IFDEF CLR}
function ToolMenuKeyMsgHook(Code: Integer; WParam: WPARAM;
  lParam: LPARAM): LRESULT; forward;
{$ENDIF}

var
  ToolMenuKeyHook: HHOOK;
{$IFDEF CLR}
  ToolMenuKeyHookProc: TFNMsgHookProc = ToolMenuKeyMsgHook;
{$ENDIF}

{$IFNDEF CLR}
function ToolMenuKeyMsgHook(Code: Integer; WParam: Longint; var Msg: TMsg): Longint; stdcall;
{$ELSE}
function ToolMenuKeyMsgHook(Code: Integer; WParam: WPARAM;
  lParam: LPARAM): LRESULT;
var
  Msg: TMsg;
{$ENDIF}
begin
{$IFDEF CLR}
  Msg := TMsg(Marshal.PtrToStructure(lParam, TypeOf(TMsg)));
{$ENDIF}
  if (Code = HC_ACTION) then
  begin
    if Msg.Message = CM_DEACTIVATE then
      MenuToolBar2.CancelMenu
    else
      if Msg.message = WM_COMMAND then
        ReleaseToolMenuKeyHooks
      else
      begin
        if (ToolMenuHook = 0) and ((Msg.Message = WM_CHAR) or
        (Msg.Message = WM_KEYDOWN) or (Msg.Message = WM_KEYUP) or
        (Msg.Message = WM_SYSKEYDOWN) or (Msg.Message = WM_SYSKEYUP)) then
          Msg.hwnd := MenuToolBar2.Handle;
{$IFDEF CLR}
        Marshal.StructureToPtr(TObject(Msg), lParam, False);
{$ENDIF}
      end;
  end;
{$IFDEF CLR}
  Result := CallNextHookEx(ToolMenuKeyHook, Code, WParam, lParam)
{$ELSE}
  Result := CallNextHookEx(ToolMenuKeyHook, Code, WParam, LPARAM(@Msg))
{$ENDIF}
end;

procedure InitToolMenuKeyHooks;
begin
  if ToolMenuKeyHook = 0 then
{$IFDEF CLR}
    ToolMenuKeyHook := SetWindowsHookEx(WH_GETMESSAGE, ToolMenuKeyHookProc, 0,
      GetCurrentThreadID);
{$ELSE}
    ToolMenuKeyHook := SetWindowsHookEx(WH_GETMESSAGE, @ToolMenuKeyMsgHook, 0,
      GetCurrentThreadID);
{$ENDIF}
end;

procedure ReleaseToolMenuKeyHooks;
begin
  if ToolMenuKeyHook <> 0 then
    UnhookWindowsHookEx(ToolMenuKeyHook);
  ToolMenuKeyHook := 0;
  MenuToolBar2 := nil;
end;

procedure TToolBar.ClearTempMenu;
var
  I: Integer;
  Item: TMenuItem;
begin
  if (FButtonMenu <> nil) and (FMenuButton <> nil) and
    (FMenuButton.MenuItem <> nil) and (FTempMenu <> nil) then
  begin
    for I := FTempMenu.Items.Count - 1 downto 0 do
    begin
      Item := FTempMenu.Items[I];
      FTempMenu.Items.Delete(I);
      FButtonMenu.Insert(0, Item);
    end;
    FTempMenu.Free;
    FTempMenu := nil;
    FMenuButton := nil;
    FButtonMenu := nil;
  end;
end;

function TToolBar.CheckMenuDropdown(Button: TToolButton): Boolean;
var
  Hook: Boolean;
  Menu: TMenu;
  Item: TMenuItem;
  I: Integer;
  ParentMenu: TMenu;
  APoint: TPoint;
  LMonitor: TMonitor;
begin
  Result := False;
  if Button = nil then
    Exit;
  FCaptureChangeCancels := False;
  try
    if Button.DropdownMenu <> nil then
      FTempMenu := Button.DropdownMenu
    else if Button.MenuItem <> nil then
    begin
      Button.MenuItem.Click;
      ClearTempMenu;
      FTempMenu := TPopupMenu.Create(Self);
      ParentMenu := Button.MenuItem.GetParentMenu;
      if ParentMenu <> nil then
        FTempMenu.BiDiMode := ParentMenu.BiDiMode;
      FTempMenu.HelpContext := Button.MenuItem.HelpContext;
      FTempMenu.TrackButton := tbLeftButton;
      Menu := Button.MenuItem.GetParentMenu;
      if Menu <> nil then
        FTempMenu.Images := Menu.Images;
      FButtonMenu := Button.MenuItem;
      for I := FButtonMenu.Count - 1 downto 0 do
      begin
        Item := FButtonMenu.Items[I];
        FButtonMenu.Delete(I);
        FTempMenu.Items.Insert(0, Item);
      end;
    end
    else
      Exit;
    SendCancelMode(nil);
    FTempMenu.PopupComponent := Self;
    Hook := Button.Grouped or (Button.MenuItem <> nil);
    if Hook then
    begin
      MenuButtonIndex := Button.Index;
      MenuToolBar := Self;
      InitToolMenuHooks;
    end;
    Perform(TB_SETHOTITEM, WPARAM(-1), 0);
    try
      APoint := Button.ClientToScreen(Point(0, Button.ClientHeight));
      if FTempMenu.IsRightToLeft then
        Inc(APoint.X, Button.Width);
      FMenuDropped := True;
      LMonitor := Screen.MonitorFromPoint(APoint);
      if (LMonitor <> nil) and
         ((GetSystemMetrics(SM_CYMENU) * FTempMenu.Items.Count) + APoint.Y > LMonitor.Height) then
        Dec(APoint.Y, Button.Height);
      if GetComCtlVersion = ComCtlVersionIE5 then
        Button.Invalidate;
      FTempMenu.Popup(APoint.X, APoint.Y);
    finally
      if Hook then ReleaseToolMenuHooks;
    end;
    FMenuButton := Button;
    if StillModal then
      Perform(TB_SETHOTITEM, Button.Index, 0);
    Result := True;
  finally
    PostMessage(Handle, CN_DROPDOWNCLOSED, 0, 0);
  end;
end;

procedure TToolBar.WMSysCommand(var Message: TWMSysCommand);

  function IsMenuBar: Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to FButtons.Count - 1 do
      if (TControl(FButtons[I]) is TToolButton)
      and Assigned(TToolButton(FButtons[I]).MenuItem) then
      begin
        Result := True;
        Break;
      end;
  end;

var
  Button: TToolButton;
begin
  { Enter menu loop if only the Alt key is pressed -- ignore Alt-Space and let
    the default processing show the system menu. }
  if not FInMenuLoop and Enabled and Showing and (ShowCaptions or AllowTextButtons) and IsMenuBar then
    with Message do
      if (CmdType and $FFF0 = SC_KEYMENU) and (Key <> VK_SPACE) and
        (Key <> Word('-')) and (GetCapture = 0) then
      begin
        if Key = 0 then
          Button := nil else
          Button := FindButtonFromAccel(Key);
        if (Key = 0) or ((Button <> nil) and (not AllowTextButtons or (Button.ImageIndex > -1))) then
        begin
          TrackMenu(Button);
          Result := 1;
          Exit;
        end;
      end;
end;

procedure TToolBar.ClickButton(Button: TToolButton);
var
  P: TPoint;
  SmallPt: TSmallPoint;
begin
  FCaptureChangeCancels := False;
  P := Button.ClientToScreen(Point(0, 0));
  SmallPt := PointToSmallPoint(ScreenToClient(P));
  with SmallPt do
    PostMessage(Handle, WM_LBUTTONDOWN, MK_LBUTTON, MakeLong(X, Y));
end;

procedure TToolBar.InitMenu(Button: TToolButton);
begin
  Perform(TB_SETANCHORHIGHLIGHT, 1, 0);
  MenuToolBar2 := Self;
  MouseCapture := True;
  InitToolMenuKeyHooks;
  if Button <> nil then
  begin
    Perform(TB_SETHOTITEM, Button.Index, 0);
    ClickButton(Button);
  end
  else
    Perform(TB_SETHOTITEM, 0, 0);
  if Button = nil then
    FCaptureChangeCancels := True;
end;

procedure TToolBar.CancelMenu;
begin
  if FInMenuLoop then
  begin
    ReleaseToolMenuKeyHooks;
    MouseCapture := False;
    Perform(TB_SETANCHORHIGHLIGHT, 0, 0);
  end;
  FInMenuLoop := False;
  FCaptureChangeCancels := False;
  Perform(TB_SETHOTITEM, WPARAM(-1), 0);
end;

function TToolBar.TrackMenu(Button: TToolButton): Boolean;
begin
  { Already in menu loop - click button to drop-down menu }
  if FInMenuLoop then
  begin
    if Button <> nil then
    begin
      ClickButton(Button);
      Result := True;
    end
    else
      Result := False;
    Exit;
  end;

  InitMenu(Button);
  try
    FInMenuLoop := True;
    repeat
      Application.HandleMessage;
      if Application.Terminated then
        FInMenuLoop := False;
    until not FInMenuLoop;

  finally
    CancelMenu;
  end;
  Result := FMenuResult;
end;

procedure TToolBar.CMFontChanged(var Message: TMessage);
begin
  if HandleAllocated and (FShowCaptions or FAllowTextButtons) then
  begin
    Perform(WM_SETFONT, Font.Handle, 0);
    if not (csLoading in ComponentState) then
      RecreateWnd;
  end;
  NotifyControls(CM_PARENTFONTCHANGED);
end;

procedure TToolBar.SetCustomizable(const Value: Boolean);
begin
  if Value <> FCustomizable then
  begin
    FCustomizable := Value;
    RecreateWnd;
  end;
end;

function TToolBar.DoGetButton(var NMToolbar: TNMToolbar): Boolean;
const
  MaxLen = 128;
var
  NewButton: TControl;
  NewToolButton: TToolButton;
  Title: string;
{$IFDEF CLR}
  Buffer: TBytes;
{$ELSE}
  Buffer: array[0..MaxLen] of Char;
{$ENDIF}
begin
  NewButton := nil;
  if (NMToolbar.iItem >= FButtons.Count) then
  begin
    Result := Assigned(FOnCustomizeNewButton);
    if Result then
    begin
      NewToolButton := nil;
      FOnCustomizeNewButton(Self,
        NMToolbar.iItem - FButtons.Count + FSeparators, NewToolButton);
      NewButton := TControl(NewToolButton);
      Result := NewButton <> nil;
      if Result then
      begin
        NewToolButton.FToolbar := Self;
        if FButtons.IndexOf(NewToolButton) = -1 then
        begin
          FButtons.Insert(NMToolbar.iItem, NewToolButton);
          if Assigned(FOnCustomizeAdded) then
            FOnCustomizeAdded(Self, NewToolButton);
        end;
      end;
    end;
  end
  else
  begin
    NewButton := TControl(FButtons[NMToolbar.iItem]);
    Result := NewButton is TToolButton;
  end;

  if Result then
    with NMToolbar, NewButton as TToolButton do
    begin
{$IFDEF CLR}
      if Style in [tbsSeparator, tbsDivider] then
        Title := SSeparator + #0#0
      else
        Title := Caption + #0#0;

      Buffer := PlatformBytesOf(Title);
      if Length(Buffer) > MaxLen * Marshal.SystemDefaultCharSize then
        SetLength(Buffer, MaxLen * Marshal.SystemDefaultCharSize);
      Marshal.Copy(Buffer, 0, pszText, Length(Buffer));
      cchText := Length(Buffer) div Marshal.SystemDefaultCharSize;
      if ShowCaptions or (AllowTextButtons and (FStyle = tbsTextButton)) then
        tbButton.iString := Self.Perform(_TB_ADDSTRING, 0, Title)
      else
        tbButton.iString := -1;
      tbButton.idCommand := Index;
      tbButton.iBitmap := ImageIndex;
      tbButton.fsStyle := ButtonStyles[Style];
      tbButton.fsState := GetButtonState;
      tbButton.dwData := NewButton.GetHashCode;
      // Add to hashtable to allow access to the actual Button
      // object from the TBButton struct
      if not FButtonHashTable.ContainsValue(NewButton) then
        FButtonHashTable.Add(TObject(tbButton.dwData), NewButton);
{$ELSE}
      if Style in [tbsSeparator, tbsDivider] then
        Title := SSeparator
      else
        Title := Caption;
      StrLCopy(pszText, PChar(Title), MaxLen);
      cchText := StrLen(pszText);
      StrLCopy(Buffer, PChar(Title), MaxLen);
      Buffer[Length(Title) + 1] := #0;
      if ShowCaptions or (AllowTextButtons and (FStyle = tbsTextButton)) then
        tbButton.iString := Self.Perform(TB_ADDSTRING, 0, LPARAM(@Buffer))
      else
        tbButton.iString := -1;
      tbButton.idCommand := Index;
      tbButton.iBitmap := ImageIndex;
      tbButton.fsStyle := ButtonStyles[Style];
      tbButton.fsState := GetButtonState;
      tbButton.dwData := UIntPtr(NewButton);
{$ENDIF}
      // If more than 2^16 strings are TB_ADDSTRING-ed to the tool bar's string
      // pool, the Windows API assumes iString is a pointer to a null terminated
      // string, not an index in the string pool.  Therefore we have to recreate
      // the toolbar to reset the string pool so the strings display propperly.
      if tbButton.iString >= 65536 then
        RecreateWnd;
   end;
end;

function TToolBar.DoQueryDelete(Index: Integer): Boolean;
begin
  Result := True;
  if Assigned(FOnCustomizeCanDelete) then
    FOnCustomizeCanDelete(Self, Index, Result);
end;

function TToolBar.DoQueryInsert(Index: Integer): Boolean;
begin
  Result := True;
  if Assigned(FOnCustomizeCanInsert) then
    FOnCustomizeCanInsert(Self, Index, Result);
end;

procedure TToolBar.SaveButtons(Save: Boolean);
var
  SP: TTBSaveParams;
begin
  SP.hkr := THandle(HKEY_CURRENT_USER);
{$IFDEF CLR}
  SP.pszSubKey := FCustomizeKeyName;
  SP.pszValueName := FCustomizeValueName;
{$ELSE}
  SP.pszSubKey := PChar(FCustomizeKeyName);
  SP.pszValueName := PChar(FCustomizeValueName);
{$ENDIF}
  SendStructMessage(Handle, _TB_SAVERESTORE, WPARAM(Save), SP)
end;

procedure TToolBar.SetHideClippedButtons(const Value: Boolean);
begin
  if FHideClippedButtons <> Value then
  begin
    FHideClippedButtons := Value;
    RecreateWnd;
  end;
end;

procedure TToolBar.SetGradientDirection(Value: TGradientDirection);
begin
  if FGradientDirection <> Value then
  begin
    FGradientDirection := Value;
    if HandleAllocated then
      Repaint;
  end;
end;

procedure TToolBar.Resize;
begin
  inherited Resize;
  if (gdoGradient in GradientDrawingOptions) and HandleAllocated then
    Repaint;
end;

procedure TToolBar.SetAutoSize(Value: Boolean);
begin
  inherited SetAutoSize(Value);
  if (gdoGradient in GradientDrawingOptions) and HandleAllocated then
    Repaint;
end;

{ TCoolBand }

constructor TCoolBand.Create(Collection: TCollection);
begin
  // Prevent the owning collection from performing
  // an update until the CoolBand has been fully created.
  TCoolBands(Collection).FCreatingBand := True;
  inherited Create(Collection);
  FWidth := 40;
  FBreak := True;
  FColor := clBtnFace;
  FFixedBackground := True;
  FImageIndex := -1;
  FMinHeight := 25;
  FParentColor := True;
  FParentBitmap := True;
  FBitmap := TBitmap.Create;
  FBitmap.OnChange := BitmapChanged;
  FVisible := True;
  FDDB := TBitmap.Create;
{$IFDEF CLR}
  // Add to hashtable to prevent premature garbage collection, and allow
  // access to the actual CoolBand object from the ReBarBandInfo struct
  TCoolBands(Collection).FCoolBandHashTable.Add(TObject(GetHashCode), Self);
{$ENDIF}
  // Previously the inherited constructor was called at this point, which
  // implicitly caused the owning collection to perform an update.
  TCoolBands(Collection).FCreatingBand := False;
  TCoolBands(Collection).Update(nil);
  ParentColorChanged;
  ParentBitmapChanged;
end;

destructor TCoolBand.Destroy;
var
  AControl: TWinControl;
begin
  FDDB.Free;
  FBitmap.Free;
  AControl := Control;
  FControl := nil;
{$IFDEF CLR}
  TCoolBands(Collection).FCoolBandHashTable.Remove(TObject(GetHashCode));
{$ENDIF}
  inherited Destroy;
  if (AControl <> nil) and not (csDestroying in AControl.ComponentState) and
    AControl.HandleAllocated then
  begin
    AControl.BringToFront;
    AControl.Perform(CM_SHOWINGCHANGED, 0, 0);
  end;
end;

procedure TCoolBand.Assign(Source: TPersistent);

  function FindControl(AControl: TWinControl): TWinControl;
  begin
    if AControl <> nil then
      Result := CoolBar.Owner.FindComponent(AControl.Name) as TWinControl
    else
      Result := nil;
  end;

begin
  if Source is TCoolBand then
  begin
    Bitmap := TCoolBand(Source).Bitmap;
    Break := TCoolBand(Source).Break;
    Color := TCoolBand(Source).Color;
    FixedBackground := TCoolBand(Source).FixedBackground;
    FixedSize := TCoolBand(Source).FixedSize;
    HorizontalOnly := TCoolBand(Source).HorizontalOnly;
    ImageIndex := TCoolBand(Source).ImageIndex;
    MinHeight := TCoolBand(Source).MinHeight;
    MinWidth := TCoolBand(Source).MinWidth;
    ParentBitmap := TCoolBand(Source).ParentBitmap;
    ParentColor := TCoolBand(Source).ParentColor;
    Text := TCoolBand(Source).Text;
    Visible := TCoolBand(Source).Visible;
    Width := TCoolBand(Source).Width;
    Control := FindControl(TCoolBand(Source).Control);
  end
  else inherited Assign(Source);
end;

procedure TCoolBand.ChangeScale(M, D: Integer);
begin
  FMinHeight := MulDiv(FMinHeight, M, D);
  FMinWidth := MulDiv(FMinWidth, M, D);
  Width := MulDiv(Width, M, D);
end;

function TCoolBand.GetDisplayName: string;
begin
  Result := FText;
  if Result = '' then Result := inherited GetDisplayName;
end;

function TCoolBand.GetVisible: Boolean;
begin
  Result := FVisible and (not CoolBar.Vertical or not FHorizontalOnly);
end;

function TCoolBand.CoolBar: TCoolBar;
begin
  Result := TCoolBands(Collection).FCoolBar;
end;

procedure TCoolBand.ParentColorChanged;
begin
  if FParentColor then
  begin
    SetColor(CoolBar.Color);
    FParentColor := True;
  end;
end;

procedure TCoolBand.ParentBitmapChanged;
begin
  BitmapChanged(Self);
end;

procedure TCoolBand.BitmapChanged(Sender: TObject);
begin
  if not ParentBitmap then
  begin
    FDDB.Assign(FBitmap);
    if not FDDB.Empty then FDDB.HandleType := bmDDB;
  end
  else
    FDDB.Assign(nil);
  Changed(False);
end;

procedure TCoolBand.SetBitmap(Value: TBitmap);
begin
  FParentBitmap := False;
  FBitmap.Assign(Value);
  Changed(True);
end;

function TCoolBand.GetHeight: Integer;
begin
  Result := CoolBar.GetRowHeight(Index);
end;

procedure TCoolBand.SetBorderStyle(Value: TBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    Changed(False);
  end;
end;

procedure TCoolBand.SetBreak(Value: Boolean);
begin
  if FBreak <> Value then
  begin
    FBreak := Value;
    Changed(False);
  end;
end;

procedure TCoolBand.SetFixedSize(Value: Boolean);
begin
  if FFixedSize <> Value then
  begin
    if Value then
    begin
      FBreak := False;
      FFixedSize := True;
      Changed(True);
    end
    else
    begin
      FFixedSize := False;
      Changed(False);
    end;
  end;
end;

procedure TCoolBand.SetMinHeight(Value: Integer);
begin
  if FMinHeight <> Value then
  begin
    FMinHeight := Value;
    Changed(False);
  end;
end;

procedure TCoolBand.SetMinWidth(Value: Integer);
begin
  if FMinWidth <> Value then
  begin
    FMinWidth := Value;
    Changed(FixedSize);
  end;
end;

procedure TCoolBand.SetVisible(Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Changed(True);
  end;
end;

procedure TCoolBand.SetHorizontalOnly(Value: Boolean);
begin
  if FHorizontalOnly <> Value then
  begin
    FHorizontalOnly := Value;
    Changed(CoolBar.Vertical);
  end;
end;

procedure TCoolBand.SetImageIndex(Value: TImageIndex);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    Changed(False);
  end;
end;

procedure TCoolBand.SetFixedBackground(Value: Boolean);
begin
  if FFixedBackground <> Value then
  begin
    FFixedBackground := Value;
    Changed(False);
  end;
end;

procedure TCoolBand.SetColor(Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    FParentColor := False;
    Changed(False);
  end;
end;

procedure TCoolBand.SetControl(Value: TWinControl);
var
  Band: TCoolBand;
  PrevControl: TWinControl;
begin
  if FControl <> Value then
  begin
    if Value <> nil then
    begin
      Band := TCoolBands(Collection).FindBand(Value);
      if (Band <> nil) and (Band <> Self) then Band.SetControl(nil);
    end;
    PrevControl := FControl;
    FControl := Value;
    if Value <> nil then Value.FreeNotification(CoolBar);
    Changed(True);
    if PrevControl <> nil then PrevControl.Perform(CM_SHOWINGCHANGED, 0, 0);
  end;
end;

procedure TCoolBand.SetText(const Value: string);
begin
  if FText <> Value then
  begin
    FText := Value;
    Changed(True);
  end;
end;

function TCoolBand.IsColorStored: Boolean;
begin
  Result := not ParentColor;
end;

procedure TCoolBand.SetParentColor(Value: Boolean);
begin
  if FParentColor <> Value then
  begin
    FParentColor := Value;
    Changed(False);
  end;
end;

function TCoolBand.IsBitmapStored: Boolean;
begin
  Result := not ParentBitmap;
end;

procedure TCoolBand.SetParentBitmap(Value: Boolean);
begin
  if FParentBitmap <> Value then
  begin
    FParentBitmap := Value;
    ParentBitmapChanged;
  end;
end;

procedure TCoolBand.SetWidth(Value: Integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    Changed(False);
  end;
end;

{ TCoolBands }

constructor TCoolBands.Create(CoolBar: TCoolBar);
begin
  inherited Create(TCoolBand);
  FCoolBar := CoolBar;
  FCreatingBand := False;
{$IFDEF CLR}
  FCoolBandHashTable := HashTable.Create;
{$ENDIF}
end;

destructor TCoolBands.Destroy;
begin
{$IFDEF CLR}
  FCoolBandHashTable.Free;
{$ENDIF}
  inherited Destroy;
end;

function TCoolBands.Add: TCoolBand;
begin
  Result := TCoolBand(inherited Add);
end;

function TCoolBands.FindBand(AControl: TControl): TCoolBand;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := TCoolBand(inherited GetItem(I));
    if Result.FControl = AControl then Exit;
  end;
  Result := nil;
end;

function TCoolBands.HaveGraphic: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Count - 1 do
    if not Items[I].FDDB.Empty then
    begin
      Result := True;
      Exit;
    end;
end;

function TCoolBands.GetItem(Index: Integer): TCoolBand;
begin
  Result := TCoolBand(inherited GetItem(Index));
end;

function TCoolBands.GetOwner: TPersistent;
begin
  Result := FCoolBar;
end;

procedure TCoolBands.SetItem(Index: Integer; Value: TCoolBand);
begin
  inherited SetItem(Index, Value);
end;

procedure TCoolBands.Update(Item: TCollectionItem);
begin
  if not FCreatingBand then
  begin
    if (Item <> nil) then
      FCoolBar.UpdateBand(Item.Index)
    else
      FCoolBar.UpdateBands;
  end;
end;

{ TToolButtonActionLink }

procedure TToolButtonActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TToolButton;
end;

function TToolButtonActionLink.IsCheckedLinked: Boolean;
begin
  Result := inherited IsCheckedLinked and
    (FClient.Down = TCustomAction(Action).Checked);
end;

function TToolButtonActionLink.IsDropdownMenuLinked: Boolean;
begin
  Result := inherited IsDropdownMenuLinked and
    (FClient.DropdownMenu = TCustomControlAction(Action).DropdownMenu);
end;

function TToolButtonActionLink.IsEnableDropdownLinked: Boolean;
begin
  Result := inherited IsEnableDropdownLinked and
    (FClient.EnableDropdown = TCustomControlAction(Action).EnableDropdown);
end;

function TToolButtonActionLink.IsImageIndexLinked: Boolean;
begin
  Result := inherited IsImageIndexLinked and
    (FClient.ImageIndex = TCustomAction(Action).ImageIndex);
end;

procedure TToolButtonActionLink.SetChecked(Value: Boolean);
begin
  if IsCheckedLinked then FClient.Down := Value;
end;

procedure TToolButtonActionLink.SetDropdownMenu(Value: TPopupMenu);
begin
  if IsDropdownMenuLinked then FClient.DropdownMenu := Value;
end;

procedure TToolButtonActionLink.SetEnableDropdown(Value: Boolean);
begin
  if IsEnableDropdownLinked then FClient.EnableDropdown := Value;
end;

procedure TToolButtonActionLink.SetImageIndex(Value: Integer);
begin
  if IsImageIndexLinked then FClient.ImageIndex := Value;
end;

{ TToolBarDragDockObject }

function TToolBarDockObject.GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor;
begin
  if Accepted then Result := crDrag
  else Result := crNoDrop;
end;

procedure TToolBarDockObject.AdjustDockRect(ARect: TRect);
var
  CX, CY: Integer;
begin
  { Adjust DockRect so that its upper left corner is under mouse cursor }
  inherited AdjustDockRect(ARect);
  with DockRect do
  begin
    CX := DragPos.X - Left;
    CY := DragPos.Y - Top;
    DockRect := Rect(Left + CX, Top + CY, Right + CX, Bottom + CY);
  end;
end;

function TToolBarDockObject.ToolDockImage(Erase: Boolean): Boolean;
var
  DesktopWindow: HWND;
  DC: HDC;
  OldBrush: HBrush;
  DrawRect: TRect;
  PenSize: Integer;
  ToolBar: TToolBar;
  FromIndex, ToIndex: Integer;
  Pos: TPoint;

  function IndexOfControl: Integer;
  begin
    for Result := 0 to TToolBar(DragTarget).ButtonCount - 1 do
      if TToolBar(DragTarget).Buttons[Result] = Control then Exit;
    Result := -1;
  end;

begin
  { Find toolbar rect }
  if not Erase or (TObject(DragTarget) is TToolBar) then
  begin
    ToolBar := TToolBar(DragTarget);
    if Control.Parent = ToolBar then
      FromIndex := IndexOfControl else
      FromIndex := -1;
    Pos := ToolBar.ScreenToClient(DockRect.TopLeft);
    ToIndex := ToolBar.ButtonIndex(FromIndex, Pos.X, Pos.Y);
    DrawRect := DockRect;
    if ToIndex >= 0 then
    begin
      if ToolBar.ButtonCount = 0 then
        Pos := Point(0, 0)
      else
        if ToIndex = ToolBar.ButtonCount then
          with ToolBar.Buttons[ToIndex-1] do
            Pos := Point(Left + Width, Top)
        else
          with ToolBar.Buttons[ToIndex] do
            Pos := Point(Left, Top);
      with DrawRect do
        DrawRect := Bounds(Pos.X, Pos.Y, Right - Left, Bottom - Top);
      MapWindowPoints(ToolBar.Handle, 0, DrawRect, 2);
    end;
    Result := not Cancelling and EqualRect(DrawRect, FEraseDockRect);
  end
  else
    Result := False;

  { Only erase when DrawRect differs }
  if Erase then
  begin
    if Result then Exit;
    DrawRect := FEraseDockRect;
  end
  else
  begin
    DockRect := DrawRect;
    Result := not Result;
    if not Result then Exit;
    FEraseDockRect := DrawRect;
  end;

  PenSize := FrameWidth;
  DesktopWindow := GetDesktopWindow;
  DC := GetDCEx(DesktopWindow, 0, DCX_CACHE or DCX_LOCKWINDOWUPDATE);
  try
    OldBrush := SelectObject(DC, Brush.Handle);
    with DrawRect do
    begin
      PatBlt(DC, Left + PenSize, Top, Right - Left - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Right - PenSize, Top + PenSize, PenSize, Bottom - Top - PenSize, PATINVERT);
      PatBlt(DC, Left, Bottom - PenSize, Right - Left - PenSize, PenSize, PATINVERT);
      PatBlt(DC, Left, Top, PenSize, Bottom - Top - PenSize, PATINVERT);
    end;
    SelectObject(DC, OldBrush);
  finally
    ReleaseDC(DesktopWindow, DC);
  end;
end;

procedure TToolBarDockObject.DrawDragDockImage;
begin
  if TObject(DragTarget) is TToolBar then
  begin
    FErase := True;
    ToolDockImage(False);
  end
  else
  begin
    FEraseDockRect := Rect(0,0,0,0);
    inherited DrawDragDockImage;
  end;
end;

procedure TToolBarDockObject.EraseDragDockImage;
begin
  if FErase then
  begin
    FErase := False;
    ToolDockImage(True);
  end
  else
    inherited EraseDragDockImage;
end;

{ TCoolBar }

const
  GripSizeIE3 = 8;
  GripSizeIE4 = 5;
  ControlMargin = 4;
  BandBorderSize = 2;
  IDMask = $7FFFFFFF;
  SoftBreakMask = $80000000;
  { Results for HitTest }
  RBHT_NONE = RBHT_CLIENT or RBHT_NOWHERE;

{$IFNDEF CLR}
{$HINTS OFF}
function SizeOfReBarBandInfo: Integer;
var
  ReBarBandInfo: TReBarBandInfo;
begin
  if GetComCtlVersion >= $60001 then
    Result := Sizeof(ReBarBandInfo)
  else
    // Platforms prior to Vista do not support the fields rcChevronLocation & uChevronState
    Result := SizeOf(TReBarBandInfo) - SizeOf(ReBarBandInfo.rcChevronLocation) -
      SizeOf(ReBarBandInfo.uChevronState);
end;
{$HINTS ON}
{$ENDIF}

class constructor TCoolBar.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCoolBar, TCoolBarStyleHook);
end;

constructor TCoolBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents, csOpaque,
    csDoubleClicks, csGestures];
  Width := 150;
  Height := 75;
  Align := alTop;
  ParentColor := True;
  ParentFont := True;
  FBandBorderStyle := bsSingle;
  FBandMaximize := bmClick;
  FBitmap := TBitmap.Create;
  FBitmap.OnChange := BitmapChanged;
  FCaptionFont := TFont.Create;
  FShowText := True;
  FDDB := TBitmap.Create;
  FBands := TCoolBands.Create(Self);
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
end;

class destructor TCoolBar.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCoolBar, TCoolBarStyleHook);
end;

destructor TCoolBar.Destroy;
begin
  FBands.Free;
  FImageChangeLink.Free;
  FDDB.Free;
  FCaptionFont.Free;
  FBitmap.Free;
  inherited Destroy;
end;

procedure TCoolBar.CreateParams(var Params: TCreateParams);
const
  DefaultStyles = CCS_NOPARENTALIGN or CCS_NOMOVEY or CCS_NORESIZE or CCS_NODIVIDER;
  BandBorderStyles: array[TBorderStyle] of DWORD = (0, RBS_BANDBORDERS);
  FixedStyles: array[Boolean] of DWORD = (0, RBS_FIXEDORDER);
  HeightStyles: array[Boolean] of DWORD = (RBS_VARHEIGHT, 0);
  VerticalStyles: array[Boolean] of DWORD = (0, CCS_VERT);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, REBARCLASSNAME);
  with Params do
  begin
    Style := Style or DefaultStyles or BandBorderStyles[FBandBorderStyle] or
      FixedStyles[FFixedOrder] or HeightStyles[FFixedSize] or
      VerticalStyles[FVertical];
    if BandMaximize = bmDblClick then Style := Style or RBS_DBLCLKTOGGLE;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW) or
      CS_DBLCLKS;
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCoolBar.CreateWnd;
begin
  inherited CreateWnd;
  FCaptionFont.Handle := GetCaptionFont;
  FCaptionFontHeight := GetCaptionFontHeight;
  if not (csLoading in ComponentState) then UpdateBands;
end;

procedure TCoolBar.Loaded;
begin
  inherited Loaded;
  UpdateBands;
end;

procedure TCoolBar.RefreshControl(Band: TCoolBand);
var
  NewWidth, NewMinHeight, CaptionSize, W, H: Integer;
  DoUpdate: Boolean;

  function IsBandCurrent: Boolean;
  var
    BandInfo: TReBarBandInfo;
  begin
{$IFDEF CLR}
    BandInfo.cbSize := Marshal.SizeOf(TypeOf(TReBarBandInfo));
    BandInfo.fMask := RBBIM_CHILD;
    Result := TWinControl(Band.Control).HandleAllocated and
      (Perform(_RB_GETBANDINFO, Band.FID and IDMask, BandInfo) <> 0) and
      (BandInfo.hwndChild = TWinControl(Band.Control).Handle);
{$ELSE}
    FillChar(BandInfo, SizeOfReBarBandInfo, 0);
    BandInfo.cbSize := SizeOfReBarBandInfo;
    BandInfo.fMask := RBBIM_CHILD;
    Result := TWinControl(Band.Control).HandleAllocated and
      (Perform(RB_GETBANDINFO_PRE_IE4, Band.FID and IDMask, LPARAM(@BandInfo)) <> 0) and
      (BandInfo.hwndChild = TWinControl(Band.Control).Handle);
{$ENDIF}
  end;

begin
  { Refresh band if control has moved/resized }
  if (Band <> nil) and (Band.Control <> nil) then
  begin
    // The following line can be removed to prevent the band's visible state
    // from being synchronized with the control.
    Band.Visible := Band.Control.Visible;
    BeginUpdate;
    try
      CaptionSize := GetCaptionSize(Band);
      if Vertical then
      begin
        W := Band.Control.Height;
        H := Band.Control.Width;
      end
      else
      begin
        W := Band.Control.Width;
        H := Band.Control.Height;
      end;
      NewWidth := W + CaptionSize + ControlMargin;
      if StyleServices.Enabled then
        Inc(NewWidth);
      NewMinHeight := H;
      if (NewWidth <> Band.Width) or (NewMinHeight <> Band.MinHeight) or
        not IsBandCurrent then
      begin
        DoUpdate := True;
        if Band.FixedSize or FixedOrder and (Band.FID and IDMask = 0) then
          Dec(NewWidth, ControlMargin);
        Band.Width := NewWidth;
        Band.MinHeight := NewMinHeight;
      end
      else DoUpdate := False;
    finally
      EndUpdate;
    end;
    if DoUpdate then
    begin
      Bands.Update(Band);
      ReadBands;
    end;
  end;
end;

procedure TCoolBar.ScaleForPPI(NewPPI: Integer);
//var
//  I: Integer;
begin
  inherited ScaleForPPI(NewPPI);
//  InternalChangeScale(NewPPI, FCurrentPPI);
//  for I := 0 to FBands.Count - 1 do
//  begin
//    if FBands[I].Control <> nil then
//      FBands[I].Control.ScaleForPPI(NewPPI);
//  end;
end;

procedure TCoolBar.AlignControls(AControl: TControl; var Rect: TRect);
var
  I: Integer;
begin
  if not (csDestroying in ComponentState) and (FUpdateCount = 0) and
    ((AControl = nil) and (Bands.Count > 0) or (AControl is TWinControl)) then
  begin
    ReadBands;
    if AControl = nil then
    begin
      for I := 0 to FBands.Count - 1 do
        RefreshControl(FBands[I]);
    end
    else RefreshControl(FBands.FindBand(TWinControl(AControl)));
  end;
end;

procedure TCoolBar.Change;
var
  Form: TCustomForm;
begin
  if csDesigning in ComponentState then
  begin
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.Designer <> nil) then Form.Designer.Modified;
  end;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCoolBar.ChangeScale(M, D: Integer; isDpiChange: Boolean);
var
  I: Integer;
begin
  FCaptionFontHeight := MulDiv(FCaptionFontHeight, M, D);
  FCaptionFont.Height := MulDiv(FCaptionFont.Height, M, D);
  for I := 0 to FBands.Count - 1 do
  begin
    FBands[I].ChangeScale(M, D);
    RefreshControl(FBands[I]);
  end;
  inherited ChangeScale(M, D, isDpiChange);
end;

function TCoolBar.GetAlign: TAlign;
begin
  Result := inherited Align;
end;

{ Coolbars take their text font from Windows' caption font minus any bold
  characteristics it may have. }
function TCoolBar.GetCaptionFont: HFONT;
var
  NonClientMetrics: TNonClientMetrics;
{$IFDEF CLR}
  Buffer: IntPtr;
  BufSize: Cardinal;
{$ENDIF}
begin
{$IFDEF CLR}
  BufSize := Marshal.SizeOf(TypeOf(TNonClientMetrics));
  Buffer := Marshal.AllocHGlobal(BufSize);
  with NonClientMetrics do
    try
      Marshal.WriteInt32(Buffer, BufSize); // fill in the cbSize field
      if not SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, Buffer, 0) then
        GetObject(GetStockObject(SYSTEM_FONT), Marshal.SizeOf(lfCaptionFont), lfCaptionFont)
      else
        NonClientMetrics := TNonClientMetrics(Marshal.PtrToStructure(Buffer,
          TypeOf(TNonClientMetrics)));
      { Remove any bold styles }
      lfCaptionFont.lfWeight := FW_NORMAL;
      Result := CreateFontIndirect(lfCaptionFont)
    finally
      Marshal.FreeHGlobal(Buffer);
    end;
{$ELSE}
  NonClientMetrics.cbSize := TNonClientMetrics.SizeOf;
  if not SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    GetObject(GetStockObject(SYSTEM_FONT), SizeOf(NonClientMetrics.lfCaptionFont), @NonClientMetrics.lfCaptionFont);
  { Remove any bold styles }
  NonClientMetrics.lfCaptionFont.lfWeight := FW_NORMAL;
  Result := CreateFontIndirect(NonClientMetrics.lfCaptionFont)
{$ENDIF}
end;

function TCoolBar.GetCaptionFontHeight: Integer;
var
  TxtMetric: TTextMetric;
begin
  Result := 0;
  if HandleAllocated then
    with TControlCanvas.Create do
    try
      Control := Self;
      Font := FCaptionFont;
      if (GetTextMetrics(Handle, TxtMetric)) then
        Result := TxtMetric.tmHeight;
    finally
      Free;
    end;
end;

{ Return height/width (depending on Vertical property) of coolbar grip area }
function TCoolBar.GetCaptionSize(Band: TCoolBand): Integer;
var
  Text: string;
  Adjust, DesignText: Boolean;
begin
  Result := 0;
  Adjust := False;
  if (Band <> nil) and ((csDesigning in ComponentState) or Band.Visible) then
  begin
    DesignText := (csDesigning in ComponentState) and
      (Band.Control = nil) and (Band.Text = '');
    if ShowText or DesignText then
    begin
      if DesignText then
        Text := Band.DisplayName
      else
        Text := Band.Text;
      if Text <> '' then
      begin
        Adjust := True;
        if Vertical then
          Result := FCaptionFontHeight
        else
          with TControlCanvas.Create do
          try
            Control := Self;
            Font := FCaptionFont;
            Result := TextWidth(Text)
          finally
            Free;
          end;
      end;
    end;
    if Band.ImageIndex >= 0 then
    begin
      if Adjust then Inc(Result, 2);
      if FImages <> nil then
      begin
        Adjust := True;
        if Vertical then
          Inc(Result, FImages.Height)
        else
          Inc(Result, FImages.Width)
      end
      else if not Adjust then
        Inc(Result, ControlMargin);
    end;
    if Adjust then Inc(Result, ControlMargin);
    if (not FixedOrder or (Band.FID and IDMask > 0)) and not Band.FixedSize then
    begin
      Inc(Result, ControlMargin);
{$IFNDEF CLR}
      { The grip size in IE4 is 3 pixels narrower than IE3 }
      if GetComCtlVersion < ComCtlVersionIE4 then
        Inc(Result, GripSizeIE3)
      else
{$ENDIF}
      Inc(Result, GripSizeIE4);
    end;
  end;
end;

procedure TCoolBar.SetAlign(Value: TAlign);
var
  PrevAlign, NewAlign: TAlign;
begin
  PrevAlign := inherited Align;
  inherited Align := Value;
  NewAlign := inherited Align;
  if not (csReading in ComponentState) then
    if NewAlign <> PrevAlign then
      case NewAlign of
        alLeft, alRight: Vertical := True;
        alTop, alBottom: Vertical := False;
      end;
end;

procedure TCoolBar.SetBands(Value: TCoolBands);
begin
  FBands.Assign(Value);
end;

procedure TCoolBar.SetBandBorderStyle(Value: TBorderStyle);
begin
  if FBandBorderStyle <> Value then
  begin
    FBandBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TCoolBar.SetBandMaximize(Value: TCoolBandMaximize);
begin
  if FBandMaximize <> Value then
  begin
    FBandMaximize := Value;
    RecreateWnd;
  end;
end;

procedure TCoolBar.SetFixedSize(Value: Boolean);
begin
  if FFixedSize <> Value then
  begin
    FFixedSize := Value;
    RecreateWnd;
  end;
end;

procedure TCoolBar.SetFixedOrder(Value: Boolean);
begin
  if FFixedOrder <> Value then
  begin
    FFixedOrder := Value;
    RecreateWnd;
  end;
end;

procedure TCoolBar.ImageListChange(Sender: TObject);
begin
  if HandleAllocated and (Sender = Images) then
    if Images.HandleAllocated then
      SetImageList(Images.Handle)
    else
      SetImageList(0);
end;

procedure TCoolBar.SetImageList(Value: HImageList);
var
  BarInfo: TReBarInfo;
begin
  if HandleAllocated then
  begin
    if Value = 0 then
      RecreateWnd
    else
    begin
{$IFDEF CLR}
      BarInfo.cbSize := Marshal.SizeOf(TypeOf(TReBarInfo));
{$ELSE}
      BarInfo.cbSize := SizeOf(TReBarInfo);
{$ENDIF}
      BarInfo.fMask := RBIM_IMAGELIST;
      BarInfo.himl := Value;
{$IFDEF CLR}
      Perform(RB_SETBARINFO, 0, BarInfo);
{$ELSE}
      Perform(RB_SETBARINFO, 0, LPARAM(@BarInfo));
{$ENDIF}
      Invalidate;
    end;
  end;
end;

procedure TCoolBar.SetImages(Value: TCustomImageList);
begin
  if FImages <> nil then FImages.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if FImages <> nil then
  begin
    FImages.RegisterChanges(FImageChangeLink);
    FImages.FreeNotification(Self);
    SetImageList(FImages.Handle);
  end
  else SetImageList(0);
end;

procedure TCoolBar.SetShowText(Value: Boolean);
begin
  if FShowText <> Value then
  begin
    FShowText := Value;
    if not (csLoading in ComponentState) then UpdateBands;
  end;
end;

procedure TCoolBar.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  Band: TCoolBand;
begin
  inherited Notification(AComponent, Operation);
  if not (csDestroying in ComponentState) and (Operation = opRemove) then
  begin
    if (AComponent is TWinControl) then
    begin
      Band := Bands.FindBand(TControl(AComponent));
      if Band <> nil then Band.FControl := nil;
    end
    else if AComponent = FImages then Images := nil;
  end;
end;

procedure TCoolBar.FlipChildren(AllLevels: Boolean);
begin
  { do not flip controls }
end;

function TCoolBar.GetPalette: HPALETTE;
begin
  if not FDDB.Empty then
    Result := FDDB.Palette
  else
    Result := inherited GetPalette;
end;

procedure TCoolBar.BitmapChanged(Sender: TObject);
var
  I: Integer;
begin
  FDDB.Assign(FBitmap);
  if not FDDB.Empty then FDDB.HandleType := bmDDB;
  for I := 0 to FBands.Count - 1 do Bands[I].ParentBitmapChanged;
  if HandleAllocated then
    RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE or RDW_ALLCHILDREN);
end;

procedure TCoolBar.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TCoolBar.EndUpdate;
begin
  Dec(FUpdateCount);
end;

function TCoolBar.IsAutoSized: Boolean;
begin
  Result := AutoSize and ((Vertical and (Align in [alNone, alLeft, alRight])) or
    not Vertical and (Align in [alNone, alTop, alBottom]));
end;

function TCoolBar.IsBackgroundDirty: Boolean;
begin
  Result := HandleAllocated and not IsAutoSized;
end;

procedure TCoolBar.SetBitmap(Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TCoolBar.SetVertical(Value: Boolean);
begin
  if FVertical <> Value then
  begin
    FVertical := Value;
    RecreateWnd;
    if not (csLoading in ComponentState) then
    begin
      if HandleAllocated then
        RedrawWindow(Handle, nil, 0, RDW_FRAME or RDW_ERASE or RDW_INVALIDATE);
    end;
  end;
end;

function TCoolBar.UpdateItem(Message, FromIndex, ToIndex: Integer): Boolean;
const
  RBBS_GRIPPERALWAYS = $00000080; // IE4 style: always show the gripper
  RBBS_NOGRIPPER = $00000100;     // IE4 style: never show the gripper
  BorderStyles: array[TBorderStyle] of DWORD = (0, RBBS_CHILDEDGE);
  BreakStyles: array[Boolean] of DWORD = (0, RBBS_BREAK);
  FixedBmpStyles: array[Boolean] of DWORD = (0, RBBS_FIXEDBMP);
  FixedSizeStyles: array[Boolean] of DWORD = (0, RBBS_FIXEDSIZE);
  GripperStyles: array[Boolean] of DWORD = (RBBS_GRIPPERALWAYS, RBBS_NOGRIPPER);
var
  BandInfo: TReBarBandInfo;
  Band: TCoolBand;
  WasFocused, DesignText: Boolean;
  Text: string;
begin
  Result := False;
  if HandleAllocated then
  begin
    Band := Bands[FromIndex];
    { Make sure child control is properly parented by coolbar and visible
      according to band's visible property }
    if Band.Control <> nil then
      with Band.Control do
      begin
        WasFocused := Focused;
        BeginUpdate;
        try
          Parent := Self;
        finally
          EndUpdate;
        end;
        // The following line can be removed to prevent the control's visible
        // state from being synchronized with the band.
          Visible := Band.Visible;
      end
    else
      WasFocused := False;
    if not (csDesigning in ComponentState) and not Band.Visible then Exit;
{$IFDEF CLR}
    with BandInfo do
    begin
      cbSize := Marshal.SizeOf(TypeOf(TReBarBandInfo));
      wID := Band.GetHashCode;
{$ELSE}
    FillChar(BandInfo, SizeOf(BandInfo), 0);
    with BandInfo do
    begin
      cbSize := SizeOfReBarBandInfo;
      wID := Band.ID + 1;  // Force wID > 0
{$ENDIF}
      { Assign background color }
      if Band.ParentColor then
        clrBack := ColorToRGB(Color)
      else
        clrBack := ColorToRGB(Band.Color);
      { Assign basic styles }
      with Band do
      begin
        fStyle := BreakStyles[Break] or FixedSizeStyles[FixedSize] or
          BorderStyles[BorderStyle] or FixedBmpStyles[FixedBackground];
        { Here we attempt to make IE4 behave like IE3 in regards to when the
          grip on bands are displayed: never on the first band when FixedOrder
          is True, and never on a band in which FixedSize is True; otherwise,
          always show the grip. }
        if GetComCtlVersion >= ComCtlVersionIE4 then
          fStyle := fStyle or GripperStyles[FixedOrder and (FromIndex = 0) or
            FixedSize];
      end;
      fMask := RBBIM_STYLE or RBBIM_COLORS or RBBIM_SIZE or RBBIM_BACKGROUND or
         RBBIM_IMAGE or RBBIM_ID;
      { Assign background bitmap }
      if Band.ParentBitmap then
        hbmBack := FDDB.Handle
      else
        hbmBack := Band.FDDB.Handle;
      iImage := Band.ImageIndex;
      { Assign child control }
      if (Band.Control <> nil) and
        (Band.Control.Visible or (csDesigning in ComponentState)) then
        hwndChild := Band.Control.Handle;
      cx := Band.Width;
      { Assign minimum child width from child control's current width if band
        is fixed in size and a MinWidth value hasn't already been set }
      if Band.FixedSize and (Band.MinWidth <= 0) and (Band.Control <> nil) then
        if Vertical then
          cxMinChild := Band.Control.Height
        else
          cxMinChild := Band.Control.Width
      else
        cxMinChild := Band.MinWidth;
{$IFNDEF CLR}
      if GetComCtlVersion < ComCtlVersionIE401 then
      begin
        //WINBUG: COMCTL32.DLL is off by 4 pixels in its sizing logic.  Whatever
        //  is specified as the minimum size, the system rebar will allow that band
        //  to be 4 actual pixels smaller!  That's why we add 4 to the size here.
        Inc(cxMinChild, 4);
      end;
{$ENDIF}
      cyMinChild := Band.MinHeight;
      fMask := fMask or RBBIM_CHILD or RBBIM_CHILDSIZE;
      { Assign text to band }
      DesignText := (csDesigning in ComponentState) and
        (Band.Control = nil) and (Band.Text = '');
      if ShowText or DesignText then
      begin
        if DesignText then
          Text := Band.DisplayName
        else
          Text := Band.Text;
{$IFDEF CLR}
        lpText := Text;
{$ELSE}
        lpText := PChar(Text);
{$ENDIF}
        fMask := fMask or RBBIM_TEXT;
      end;
    end;
    { Add/insert band }
{$IFDEF CLR}
    Result := Perform(Message, ToIndex, BandInfo) <> 0;
{$ELSE}
    Result := Perform(Message, ToIndex, LPARAM(@BandInfo)) <> 0;
{$ENDIF}
    { Update focus }
    if WasFocused then
      with Band.Control do
        if Handle <> 0 then Winapi.Windows.SetFocus(Handle);
  end;
end;

function TCoolBar.ReadBands: Boolean;
const
  { IE4 support }
  RB_GETRECT = (WM_USER + 9); // Get a band's bounding rectangle
var
  I: Longword;
  NewWidth, NewIndex: Integer;
  ClientSize, RowSize, BorderSize: Longword;
  BandInfo: TReBarBandInfo;
  NewBreak: Boolean;
  R: TRect;
  Resize: Boolean;
begin
  Result := False;
  if HandleAllocated and (FUpdateCount = 0) then
  begin
    { Retrieve current band settings }
{$IFDEF CLR}
    BandInfo.cbSize := Marshal.SizeOf(TypeOf(TReBarBandInfo));
{$ELSE}
    FillChar(BandInfo, SizeOfReBarBandInfo, 0);
    BandInfo.cbSize := SizeOfReBarBandInfo;
{$ENDIF}
    BandInfo.fMask := RBBIM_STYLE or RBBIM_SIZE or RBBIM_ID;
    BeginUpdate;
    try
      I := 0;
      NewIndex := 0;
      if BandBorderStyle = bsSingle then
        BorderSize := BandBorderSize
      else
        BorderSize := 0;
      { Compute row size vs. client size as we iterate to determine "soft"
        breaks between rows }
      if Vertical then
        ClientSize := ClientHeight
      else
        ClientSize := ClientWidth;
      RowSize := 0;
      while (I < FBands.FVisibleCount) and (NewIndex < FBands.Count) do
      begin
        { Get info from coolbar about visible band }
{$IFDEF CLR}
        if (Perform(_RB_GETBANDINFO, I, BandInfo) <> 0) and
{$ELSE}
        if (Perform(RB_GETBANDINFO_PRE_IE4, I, LPARAM(@BandInfo)) <> 0) and
{$ENDIF}
          (BandInfo.wID <> 0) then
        begin
          { Find opening for visible band }
          if not (csDesigning in ComponentState) then
            for NewIndex := NewIndex to FBands.Count - 1 do
              if FBands[NewIndex].Visible then Break;
{$IFDEF CLR}
          with BandInfo, TCoolBand(FBands.FCoolBandHashTable.Item[TObject(wID)]) do
{$ELSE}
//          with BandInfo, TCoolBand(wID) do
            with BandInfo, TCoolBand(Bands.FindItemID(wID - 1)) do
{$ENDIF}
          begin
            { Determine width of band by calling RB_GETRECT if we're in IE4.
              Otherwise, cx returns a valid value. }
{$IFNDEF CLR}
            if (GetComCtlVersion >= ComCtlVersionIE4) then 
{$ENDIF}
              if (Perform(RB_GETRECT, I, R) <> 0) then
                cx := R.Right - R.Left;
            NewWidth := cx;
            NewBreak := fStyle and RBBS_BREAK <> 0;
            if NewBreak or (I = 0) then
              RowSize := cx
            else
              Inc(RowSize, cx + BorderSize);
            if RowSize > ClientSize then
            begin
              RowSize := cx;
              FID := SoftBreakMask or I;
            end
            else
              FID := I;
            Resize := Break <> NewBreak;
            if Resize or (Index <> NewIndex) or (Width <> NewWidth) then
            begin
              Result := True;
              Break := NewBreak;
              { Exchange bands }
              FBands[NewIndex].Index := Index;
              Index := NewIndex;
              Width := NewWidth;
            end;
          end;
        end;
        Inc(I);
        Inc(NewIndex);
      end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TCoolBar.UpdateBand(Index: Integer);
begin
  if HandleAllocated and (FUpdateCount = 0) then
    UpdateItem(_RB_SETBANDINFO, Index, Bands[Index].FID and IDMask)
end;

procedure TCoolBar.UpdateBands;
var
  I, BandCount: Integer;
  WindowLocked: Boolean;
begin
  if HandleAllocated and (FUpdateCount = 0) then
  begin
    BeginUpdate;
    WindowLocked := LockWindowUpdate(GetDesktopWindow);
    try
      BandCount := Perform(RB_GETBANDCOUNT, 0, 0);
      for I := 0 to BandCount - 1 do
        Perform(RB_DELETEBAND, 0, 0);
      if FixedOrder then
        { Add bands from first to last }
        for I := 0 to Bands.Count - 1 do
          UpdateItem(_RB_INSERTBAND, I, -1)
      else
        { Add bands from last to first }
        for I := Bands.Count - 1 downto 0 do
          UpdateItem(_RB_INSERTBAND, I, 0);
      if FImages <> nil then SetImageList(FImages.Handle);
      { Coolbar doesn't automatically redraw window when we remove the last band }
      if BandCount > Perform(RB_GETBANDCOUNT, 0, 0) then
        Invalidate;
    finally
      if WindowLocked then LockWindowUpdate(0);
      EndUpdate;
    end;
    FBands.FVisibleCount := Perform(RB_GETBANDCOUNT, 0, 0);
    ReadBands;
    if AutoSize then AdjustSize;
  end;
end;

{ Return height of row for given band }
function TCoolBar.GetRowHeight(Index: Integer): Integer;
const
  ChildEdgeSize = 4;
var
  Last, I, Size, TmpSize: Integer;
  DesignText: Boolean;
  Band: TCoolBand;
  Text: string;
begin
  Result := 0;
  Last := FBands.Count - 1;
  if FixedSize then
    Index := 0
  else
  begin
    { Find last band in row }
    I := Index;
    while I < Last do
      if ((csDesigning in ComponentState) or FBands[I+1].Visible) and
        (FBands[I+1].Break or (FBands[I+1].FID and SoftBreakMask <> 0)) then
        Break
      else
        Inc(I);
    Last := I;
    { Find first band in row }
    while Index > 0 do
      if ((csDesigning in ComponentState) or FBands[Index].Visible) and
        (FBands[Index].Break or (FBands[Index].FID and SoftBreakMask <> 0)) then
        Break
      else
        Dec(Index);
  end;
  { Compute maximum band size between Index and Last }
  for I := Index to Last do
  begin
    Band := FBands[I];
    if (csDesigning in ComponentState) or Band.Visible then
    begin
      { Calc control size }
      if Band.Control <> nil then
      begin
        Size := Band.MinHeight;
        if Band.BorderStyle = bsNone then Dec(Size, ChildEdgeSize);
      end
      else Size := 0;
      { Calc text size }
      DesignText := (csDesigning in ComponentState) and
        (Band.Control = nil) and (Band.Text = '');
      if ShowText or DesignText then
      begin
        if DesignText then
          Text := Band.DisplayName
        else
          Text := Band.Text;
        if Text <> '' then
          if Vertical then
              with TControlCanvas.Create do
              try
                Control := Self;
                Font := FCaptionFont;
                TmpSize := TextWidth(Text);
              finally
                Free;
              end
          else
            TmpSize := FCaptionFontHeight
        else
          TmpSize := 0;
        if TmpSize > Size then
          Size := TmpSize;
      end;
      { Calc image size }
      if (Images <> nil) and (Band.ImageIndex >= 0) then
      begin
        if Vertical then
          TmpSize := Images.Height
        else
          TmpSize := Images.Width;
        if TmpSize > Size then
          Size := TmpSize;
      end;
      { Adjust for child edges }
      Inc(Size, ChildEdgeSize);
      { Remember max value }
      if Size > Result then
        Result := Size;
    end;
  end;
end;

function TCoolBar.PtInGripRect(const Pos: TPoint; var Band: TCoolBand): Integer;
{$IFDEF CLR}
var
  I: Integer;
  HitTestInfo: TRBHitTestInfo;
  BandInfo: TReBarBandInfo;
begin
  HitTestInfo.pt := Pos;
  I := Perform(RB_HITTEST, 0, HitTestInfo);
  BandInfo.cbSize := Marshal.SizeOf(TypeOf(TReBarBandInfo));
  BandInfo.fMask := RBBIM_ID;
  if (Perform(_RB_GETBANDINFO, I, BandInfo) <> 0) and
    (BandInfo.wID <> 0) then
    Band := TCoolBand(FBands.FCoolBandHashTable.Item[TObject(BandInfo.wID)])
  else
    Band := nil;
  Result := HitTestInfo.flags;
{$ELSE}
var
  I, PosX, PosY, X, Y: Integer;
  PrevWidth, RowHeight, BorderSize: Integer;
  HitTestInfo: TRBHitTestInfo;
  BandInfo: TReBarBandInfo;
begin
  if GetComCtlVersion >= ComCtlVersionIE4 then
  begin
    HitTestInfo.pt := Pos;
    I := Perform(RB_HITTEST, 0, LPARAM(@HitTestInfo));
    FillChar(BandInfo, SizeOfReBarBandInfo, 0);
    BandInfo.cbSize := SizeOfReBarBandInfo;
    BandInfo.fMask := RBBIM_ID;
    if (Perform(RB_GETBANDINFO_PRE_IE4, I, LPARAM(@BandInfo)) <> 0) and
      (BandInfo.wID <> 0) then
//      Band := TCoolBand(BandInfo.wID) else
      Band := TCoolBand(Bands.FindItemID(BandInfo.wID - 1)) else
      Band := nil;
    Result := HitTestInfo.flags;
    Exit;
  end
  else if FBands.FVisibleCount > 0 then
  begin
    Band := nil;
    if Vertical then
    begin
      PosX := Pos.Y;
      PosY := Pos.X;
    end
    else
    begin
      PosX := Pos.X;
      PosY := Pos.Y;
    end;
    X := 0;
    Y := 0;
    PrevWidth := 0;
    RowHeight := 0;
    if BandBorderStyle = bsSingle then
      BorderSize := BandBorderSize
    else
      BorderSize := 0;
    for I := 0 to FBands.Count - 1 do
    begin
      Band := FBands[I];
      if (csDesigning in ComponentState) or Band.Visible then
      begin
        if (Band.FID and IDMask = 0) or (Band.Break or
          (Band.FID and SoftBreakMask <> 0)) then
        begin
          X := 0;
          if Band.FID and IDMask > 0 then
            Inc(Y, RowHeight + BorderSize);
          RowHeight := GetRowHeight(I);
        end
        else
          Inc(X, PrevWidth);
        PrevWidth := Band.Width + BorderSize;
        if (PosX < X) or (PosX > X + Band.Width) or (PosY < Y) or
          (PosY > Y + RowHeight) then Continue;
        { Find hittest area }
        if not Band.FixedSize and (not FixedOrder or
          (Band.FID and IDMask > 0)) and (PosX <= X + GetCaptionSize(Band)) then
        begin
          { The grip size in IE4 is 3 pixels narrower than IE3 }
          if (PosX > X + GripSizeIE3) or (GetComCtlVersion >= ComCtlVersionIE4) and
            (PosX > X + GripSizeIE4) then
            Result := RBHT_CAPTION
          else
            Result := RBHT_GRABBER;
          Exit;
        end
        else
          System.Break;
      end;
    end;
  end;
  Result := RBHT_CLIENT;
{$ENDIF}
end;

procedure TCoolBar.WMCaptureChanged(var Message: TMessage);
begin
  inherited;
  { Synchronize band properties - something may have changed }
  PostMessage(Handle, CN_BANDCHANGE + 1, 0, 0)
end;

procedure TCoolBar.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if not StyleServices.Enabled and (IsBackgroundDirty or (IsAutoSized and (Bands.Count = 0))) then
    inherited;
  DefaultHandler(Message);
end;

procedure TCoolBar.WMLButtonDown(var Message: TWMLButtonDown);
var
  Band: TCoolBand;
begin
  if PtInGripRect(SmallPointToPoint(Message.Pos), Band) and RBHT_NONE = 0 then
    FTrackDrag := Message.Pos;
  inherited;
end;

procedure TCoolBar.WMLButtonUp(var Message: TWMLButtonUp);
begin
  if not (csDesigning in ComponentState) and (BandMaximize <> bmNone) or
    (FTrackDrag.X < Message.XPos - 1) or (FTrackDrag.X > Message.XPos + 1) or
    (FTrackDrag.Y < Message.YPos - 1) or (FTrackDrag.Y > Message.YPos + 1) then
    inherited
  else
    MouseCapture := False;
end;

procedure TCoolBar.WMNotifyFormat(var Message: TWMNotifyFormat);
begin
  with Message do
    Result := DefWindowProc(Handle, Msg, From, Command);
end;

procedure TCoolBar.WMSetCursor(var Message: TWMSetCursor);
var
  P: TPoint;
  Band: TCoolBand;
  Grip: Integer;
begin
  { Ignore default processing since it's flawed when coolbar is vertical }
  with Message do
    if (CursorWnd = Handle) and (Smallint(HitTest) = HTCLIENT) then
    begin
      Result := 1;
      P := SmallPoint(GetMessagePos);
      Winapi.Windows.ScreenToClient(CursorWnd, P);
      Grip := PtInGripRect(P, Band);
      if Grip and RBHT_NONE = 0 then
      begin
        if Grip = RBHT_CAPTION then
          Winapi.Windows.SetCursor(Screen.Cursors[crHandPoint])
        else if Vertical then
          Winapi.Windows.SetCursor(Screen.Cursors[crSizeNS])
        else Winapi.Windows.SetCursor(Screen.Cursors[crSizeWE]);
      end
      else Winapi.Windows.SetCursor(Screen.Cursors[crDefault]);
    end
    else inherited;
end;

procedure TCoolBar.WMSize(var Message: TWMSize);
begin
  inherited;
end;

procedure TCoolBar.WndProc(var Message: TMessage);
begin
  if (csDesigning in ComponentState) then
    case Message.Msg of
      WM_MOUSEMOVE, WM_LBUTTONDBLCLK, WM_RBUTTONDBLCLK:
        begin
          { Enabled csDesignInteractive temporarily so that we may handle the
            design-time dragging of bands }
          ControlStyle := ControlStyle + [csDesignInteractive];
          try
            inherited WndProc(Message);
          finally
            ControlStyle := ControlStyle - [csDesignInteractive];
          end;
          Exit;
        end;
      { We just dragged a band - disable any drag events }
      WM_LBUTTONUP: MouseCapture := False;
    end;
  case Message.Msg of
    CN_BANDCHANGE + 1:
      Message.Msg := CN_BANDCHANGE;
    WM_PARENTNOTIFY:
      { A child control may have performed a RecreateWnd.  Make sure the bands
        are referring to current window handle values. }
      if Message.WParam and $FFFF = WM_CREATE then
        UpdateBands;
  end;
  inherited WndProc(Message);
end;

procedure TCoolBar.CMColorChanged(var Message: TMessage);
var
  I: Integer;
begin
  inherited;
  if FBands <> nil then
    for I := 0 to FBands.Count - 1 do Bands[I].ParentColorChanged;
  if HandleAllocated then
    RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE or RDW_FRAME);
end;

{$IFDEF CLR}
procedure TCoolBar.ControlChange(Inserting: Boolean; Child: TControl);
var
  Band: TCoolBand;
begin
  if FUpdateCount = 0 then
  begin
    { Can only accept TWinControl descendents }
    if not (csLoading in ComponentState) and (Child is TWinControl) then
      if Inserting then
        with Bands.Add do SetControl(TWinControl(Child))
      else
      begin
        Band := Bands.FindBand(Child);
        if Band <> nil then Band.Free;
      end;
  end;
end;
{$ELSE}
procedure TCoolBar.CMControlChange(var Message: TCMControlChange);
var
  Band: TCoolBand;
begin
  if FUpdateCount = 0 then
  begin
    { Can only accept TWinControl descendents }
    if not (csLoading in ComponentState) and (Message.Control is TWinControl) then
      if Message.Inserting then
        with Bands.Add do SetControl(TWinControl(Message.Control))
      else
      begin
        Band := Bands.FindBand(Message.Control);
        if Band <> nil then Band.Free;
      end;
  end;
end;
{$ENDIF}

procedure TCoolBar.CMDesignHitTest(var Message: TCMDesignHitTest);
var
  Band: TCoolBand;
begin
  if not (csDesignInteractive in ControlStyle) and
    (PtInGripRect(SmallPointToPoint(Message.Pos), Band) and RBHT_NONE = 0) then
    Message.Result := 1 else
    inherited;
end;

procedure TCoolBar.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) then
  begin
    Message.Msg := WM_SYSCOLORCHANGE;
    DefaultHandler(Message);
  end;
end;

procedure TCoolBar.CMSysFontChanged(var Message: TMessage);
begin
  inherited;
  if not Screen.UpdatingAllFonts then
    RecreateWnd;
end;

procedure TCoolBar.CMSysFontsAllChanged(var Message: TMessage);
begin
  inherited;
  RecreateWnd;
end;

procedure TCoolBar.CMWinIniChange(var Message: TWMWinIniChange);
begin
  inherited;
  FCaptionFont.Handle := GetCaptionFont;
  FCaptionFontHeight := GetCaptionFontHeight;
end;

procedure TCoolBar.CNBandChange(var Message: TMessage);
begin
  if ReadBands then Change;
end;

procedure TCoolBar.CNNotify(var Message: TWMNotify);
begin
  if (Message.NMHdr.code = RBN_HEIGHTCHANGE) then
    if IsAutoSized and (ComponentState * [csLoading, csDestroying] = []) then
    begin
      ReadBands;
      BeginUpdate;
      try
        if AutoSize then AdjustSize;
      finally
        EndUpdate;
      end;
    end
    else if IsBackgroundDirty then
      Invalidate;
end;

function TCoolBar.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;

  function GetDisplaySize: Integer;
  var
    I, RowCount: Integer;
  begin
    Result := 0;
    RowCount := 0;
    for I := 0 to FBands.Count - 1 do
      with FBands[I] do
        if ((csDesigning in ComponentState) or Visible) and
          ((FID and IDMask = 0) or (Break or (FID and SoftBreakMask <> 0))) then
        begin
          Inc(RowCount);
          Inc(Result, GetRowHeight(I));
        end;
    if (RowCount > 1) and (BandBorderStyle = bsSingle) then
      Inc(Result, (RowCount - 1) * BandBorderSize);
  end;

begin
  Result := False;
  if HandleAllocated and (IsAutoSized and ((FBands.Count > 0) or
    not (csDesigning in ComponentState))) then
      if Vertical and (Align in [alNone, AlLeft, alRight]) then
      begin
        Result := True;
        NewWidth := GetDisplaySize + Width - ClientWidth;
      end
      else if not Vertical and (Align in [alNone, alTop, alBottom]) then
      begin
        Result := True;
        NewHeight := GetDisplaySize + Height - ClientHeight;
      end;
end;

function TCoolBar.HitTest(const Pos: TPoint): TCoolBand;
begin
  PtInGripRect(Pos, Result);
end;

procedure TCoolBar.PaintWindow(DC: HDC);
begin
  Perform(WM_ERASEBKGND, DC, 0);
  inherited;
end;

{ TMonthCalColors }

const
  ColorIndex: array[0..5] of Integer = (MCSC_BACKGROUND, MCSC_TEXT,
    MCSC_TITLEBK, MCSC_TITLETEXT, MCSC_MONTHBK, MCSC_TRAILINGTEXT);

constructor TMonthCalColors.Create(AOwner: TCommonCalendar);
begin
  inherited Create;
  Owner := AOwner;
  FBackColor := clWindow;
  FTextColor := clWindowText;
  FTitleBackColor := clActiveCaption;
  FTitleTextColor := clWhite;
  FMonthBackColor := clWhite;
  FTrailingTextColor := clInactiveCaptionText;
end;

procedure TMonthCalColors.Assign(Source: TPersistent);
var
  SourceName: string;
begin
  if Source = nil then SourceName := 'nil'
  else SourceName := Source.ClassName;
  if (Source = nil) or not (Source is TMonthCalColors) then
    raise EConvertError.CreateResFmt({$IFNDEF CLR}@{$ENDIF}SAssignError, [SourceName, ClassName]);
  FBackColor := TMonthCalColors(Source).BackColor;
  FTextColor := TMonthCalColors(Source).TextColor;
  FTitleBackColor := TMonthCalColors(Source).TitleBackColor;
  FTitleTextColor := TMonthCalColors(Source).TitleTextColor;
  FMonthBackColor := TMonthCalColors(Source).MonthBackColor;
  FTrailingTextColor := TMonthCalColors(Source).TrailingTextColor;
end;

procedure TMonthCalColors.SetColor(Index: Integer; Value: TColor);
begin
  case Index of
    0: FBackColor := Value;
    1: FTextColor := Value;
    2: FTitleBackColor := Value;
    3: FTitleTextColor := Value;
    4: FMonthBackColor := Value;
    5: FTrailingTextColor := Value;
  end;
  if Owner.HandleAllocated then
    Owner.MsgSetCalColors(ColorIndex[Index], ColorToRGB(Value));
end;

procedure TMonthCalColors.SetAllColors;
begin
  SetColor(0, FBackColor);
  SetColor(1, FTextColor);
  SetColor(2, FTitleBackColor);
  SetColor(3, FTitleTextColor);
  SetColor(4, FMonthBackColor);
  SetColor(5, FTrailingTextColor);
end;

{ TCommonCalendar }

constructor TCommonCalendar.Create(AOwner: TComponent);
begin
  CheckCommonControl(ICC_DATE_CLASSES);
  inherited Create(AOwner);
  FCalExceptionClass := ECommonCalendarError;
  FShowToday := True;
  FShowTodayCircle := True;
  ControlStyle := [csOpaque, csClickEvents, csDoubleClicks, csReflector, csGestures];
  FCalColors := TDateTimeColors.Create(Self);
  FDateTime := Now;
  FFirstDayOfWeek := dowLocaleDefault;
  FMaxSelectRange := 31;
  FMonthDelta := 1;
  FMaxDate := 0.0;
  FMinDate := 0.0;
end;

destructor TCommonCalendar.Destroy;
begin
  inherited Destroy;
  FCalColors.Free;
end;

procedure TCommonCalendar.BoldDays(Days: array of LongWord; var MonthBoldInfo: LongWord);
var
  I: LongWord;
begin
  MonthBoldInfo := 0;
  for I := Low(Days) to High(Days) do
    if (Days[I] > 0) and (Days[I] < 32) then
      MonthBoldInfo := MonthBoldInfo or ($00000001 shl (Days[I] - 1));
end;

procedure TCommonCalendar.CheckEmptyDate;
begin
  // do nothing
end;

procedure TCommonCalendar.CheckValidDate(Value: TDate);
begin
  if (FMaxDate <> 0.0) and (Value > FMaxDate) then
    raise CalExceptionClass.CreateFmt(SDateTimeMax, [DateToStr(FMaxDate)]);
  if (FMinDate <> 0.0) and (Value < FMinDate) then
    raise CalExceptionClass.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCommonCalendar.CreateWnd;
begin
  inherited CreateWnd;
  FCalColors.SetAllColors;
  SetRange(FMinDate, FMaxDate);
  SetMaxSelectRange(FMaxSelectRange);
  SetMonthDelta(FMonthDelta);
  SetFirstDayOfWeek(FFirstDayOfWeek);
  if FMultiSelect then
    SetSelectedRange(FDateTime, FEndDate)
  else
    SetDateTime(FDateTime);
end;

function TCommonCalendar.GetCalStyles: DWORD;
const
  ShowTodayFlags: array[Boolean] of DWORD = (MCS_NOTODAY, 0);
  ShowTodayCircleFlags: array[Boolean] of DWORD = (MCS_NOTODAYCIRCLE, 0);
  WeekNumFlags: array[Boolean] of DWORD = (0, MCS_WEEKNUMBERS);
  MultiSelFlags: array[Boolean] of DWORD = (0, MCS_MULTISELECT);
begin
  Result := MCS_DAYSTATE or ShowTodayFlags[FShowToday] or
    ShowTodayCircleFlags[FShowTodayCircle] or WeekNumFlags[FWeekNumbers] or
    MultiSelFlags[FMultiSelect];
end;

function TCommonCalendar.DoStoreEndDate: Boolean;
begin
  Result := FMultiSelect;
end;

function TCommonCalendar.DoStoreMaxDate: Boolean;
begin
  Result := FMaxDate <> 0.0;
end;

function TCommonCalendar.DoStoreMinDate: Boolean;
begin
  Result := FMinDate <> 0.0;
end;

function TCommonCalendar.GetDate: TDate;
begin
  Result := TDate(FDateTime);
end;

procedure TCommonCalendar.SetCalColors(Value: TDateTimeColors);
begin
  if FCalColors <> Value then FCalColors.Assign(Value);
end;

procedure TCommonCalendar.SetDate(Value: TDate);
var
  LDateTime: TDateTime;
begin
  LDateTime := Value;
  ReplaceTime(LDateTime, FDateTime);
  if LDateTime = 0.0 then
    CheckEmptyDate;
  try
    CheckValidDate(Trunc(LDateTime));
    SetDateTime(LDateTime);
  except
    SetDateTime(FDateTime);
    raise;
  end;
end;

procedure TCommonCalendar.SetDateTime(Value: TDateTime);
var
  ST: TSystemTime;
begin
  DateTimeToSystemTime(Value, ST);
  if FMultiSelect then
    SetSelectedRange(Value, FEndDate)
  else begin
    if HandleAllocated then
      if not MsgSetDateTime(ST) then
        raise ECommonCalendarError.CreateRes({$IFNDEF CLR}@{$ENDIF}SFailSetCalDateTime);
    FDateTime := Value;
  end;
end;

procedure TCommonCalendar.SetEndDate(Value: TDate);
var
  TruncValue: TDate;
begin
  TruncValue := Trunc(Value);
  if Trunc(FEndDate) <> TruncValue then
  begin
    Value := TruncValue + 0.0;
    if Value = 0.0 then CheckEmptyDate;
    SetSelectedRange(Date, TruncValue);
  end;
end;

procedure TCommonCalendar.SetFirstDayOfWeek(Value: TCalDayOfWeek);
var
  DOWFlag: Integer;
{$IFDEF CLR}
  Buffer: StringBuilder;
{$ELSE}
  A: array[0..1] of char;
{$ENDIF}
begin
  if HandleAllocated then
  begin
    if Value = dowLocaleDefault then
    begin
{$IFDEF CLR}
      Buffer := StringBuilder.Create(2);
      GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, Buffer, Buffer.Capacity);
      DOWFlag := Ord(Buffer.Chars[0]) - Ord('0');
{$ELSE}
      GetLocaleInfo(LOCALE_USER_DEFAULT, LOCALE_IFIRSTDAYOFWEEK, A, SizeOf(A));
      DOWFlag := Ord(A[0]) - Ord('0');
{$ENDIF}
    end
    else
      DOWFlag := Ord(Value);
    if CalendarHandle <> 0 then
      MonthCal_SetFirstDayOfWeek(CalendarHandle, DOWFlag);
  end;
  FFirstDayOfWeek := Value;
end;

procedure TCommonCalendar.SetMaxDate(Value: TDate);
begin
  if (FMinDate <> 0.0) and (Value < FMinDate) then
    raise CalExceptionClass.CreateFmt(SDateTimeMin, [DateToStr(FMinDate)]);
  if FMaxDate <> Value then
  begin
    ReplaceTime(TDateTime(Value), TDateTime(EncodeTime(23, 59, 59, 0)));
    SetRange(FMinDate, Value);
    FMaxDate := Value;
  end;
end;

procedure TCommonCalendar.SetMaxSelectRange(Value: Integer);
begin
  if FMultiSelect and HandleAllocated then
    if not MonthCal_SetMaxSelCount(CalendarHandle, Value) then
      raise ECommonCalendarError.CreateRes({$IFNDEF CLR}@{$ENDIF}SFailSetCalMaxSelRange);
  FMaxSelectRange := Value;
end;

procedure TCommonCalendar.SetMinDate(Value: TDate);
begin
  if (FMaxDate <> 0.0) and (Value > FMaxDate) then
    raise CalExceptionClass.CreateFmt(SDateTimeMax, [DateToStr(FMaxDate)]);
  if FMinDate <> Value then
  begin
    SetRange(Value, FMaxDate);
    FMinDate := Value;
  end;
end;

procedure TCommonCalendar.SetMonthDelta(Value: Integer);
begin
  if HandleAllocated and (CalendarHandle <> 0) then
    MonthCal_SetMonthDelta(CalendarHandle, Value);
  FMonthDelta := Value;
end;

procedure TCommonCalendar.SetMultiSelect(Value: Boolean);
begin
  if FMultiSelect <> Value then
  begin
    FMultiSelect := Value;
    if Value then FEndDate := FDateTime
    else FEndDate := 0.0;
    RecreateWnd;
  end;
end;

procedure TCommonCalendar.SetRange(MinVal, MaxVal: TDate);
var
  Flags: DWORD;
  TruncDate, TruncEnd, TruncMin, TruncMax: Int64;
  STA: TSystemTimeRangeArray;
begin
  Flags := 0;
  TruncMin := Trunc(MinVal);
  TruncMax := Trunc(MaxVal);
  TruncDate := Trunc(FDateTime);
  TruncEnd := Trunc(FEndDate);
  if TruncMin <> 0 then
  begin
    if TruncDate < TruncMin then SetDate(MinVal);
    if TruncEnd < TruncMin then SetEndDate(MinVal);
    Flags := Flags or GDTR_MIN;
    DateTimeToSystemTime(TruncMin, STA[0]);
  end;
  if TruncMax <> 0 then
  begin
    if TruncDate > TruncMax then SetDate(MaxVal);
    if (TruncEnd > TruncMax) or (TruncEnd = 0) then SetEndDate(MaxVal);
    Flags := Flags or GDTR_MAX;
    DateTimeToSystemTime(MaxVal, STA[1]);
  end;
  if HandleAllocated then
    if not MsgSetRange(Flags, STA) then
      raise ECommonCalendarError.CreateRes({$IFNDEF CLR}@{$ENDIF}SFailSetCalMinMaxRange);
end;

procedure TCommonCalendar.SetSelectedRange(Date, EndDate: TDate);
var
  DateArray: TSystemTimeRangeArray;
begin
  if not FMultiSelect then
    SetDateTime(Date)
  else
  begin
    DateTimeToSystemTime(Date, DateArray[0]);
    DateTimeToSystemTime(EndDate, DateArray[1]);
    if HandleAllocated then
      if not MonthCal_SetSelRange(Handle, {$IFNDEF CLR}@{$ENDIF}DateArray) then
        raise ECommonCalendarError.CreateRes({$IFNDEF CLR}@{$ENDIF}SFailsetCalSelRange);
    FDateTime := Date;
  end;
  FEndDate := EndDate;
end;

procedure TCommonCalendar.SetShowToday(Value: Boolean);
begin
  if FShowToday <> Value then
  begin
    FShowToday := Value;
    SetComCtlStyle(Self, MCS_NOTODAY, not Value);
  end;
end;

procedure TCommonCalendar.SetShowTodayCircle(Value: Boolean);
begin
  if FShowTodayCircle <> Value then
  begin
    FShowTodayCircle := Value;
    SetComCtlStyle(Self, MCS_NOTODAYCIRCLE, not Value);
  end;
end;

procedure TCommonCalendar.SetWeekNumbers(Value: Boolean);
begin
  if FWeekNumbers <> Value then
  begin
    FWeekNumbers := Value;
    SetComCtlStyle(Self, MCS_WEEKNUMBERS, Value);
  end;
end;

function IsBlankSysTime(const ST: TSystemTime): Boolean;
{$IFDEF CLR}
begin
  with ST do
    Result := (wYear = 0) and (wMonth = 0) and (wDayOfWeek = 0) and (wDay = 0) and
      (wHour = 0) and (wMinute = 0) and (wSecond = 0) and (wMilliseconds = 0);
{$ELSE}
type
  TFast = array [0..3] of DWORD;
begin
  Result := (TFast(ST)[0] or TFast(ST)[1] or TFast(ST)[2] or TFast(ST)[3]) = 0;
{$ENDIF}
end;

{ TMonthCalendar }

constructor TMonthCalendar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCalExceptionClass := EMonthCalError;
  Width := 191;
  Height := 154;
end;

procedure TMonthCalendar.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if HandleAllocated and (GetWindowTheme(Handle) = 0) and AutoSize then
    Perform(WM_SIZE, 0, 0);
end;

procedure TMonthCalendar.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if (seClient in StyleElements) and TStyleManager.IsCustomStyleActive and
     (Message.DC <> 0) then
  begin
    StyleServices.DrawParentBackground(Handle, Message.DC, nil, False);
    Message.Result := 1;
  end
  else
    inherited;
end;

procedure TMonthCalendar.CreateWnd;
var
  MCTextColor, MCBGColor, MCTrailingTextColor: TColor;
begin
  inherited;
  if (seClient in StyleElements) and TStyleManager.IsCustomStyleActive then
  begin
    if Winapi.uxTheme.GetWindowTheme(Handle) <> 0 then
      Winapi.uxTheme.SetWindowTheme(Handle, '', '');
    MCBGColor := StyleServices.GetSystemColor(clWindow);
    MCTextColor := StyleServices.GetSystemColor(clWindowText);
    MonthCal_SetColor(Handle, MCSC_BACKGROUND, MCBGColor);
    MonthCal_SetColor(Handle, MCSC_MONTHBK, MCBGColor);
    MonthCal_SetColor(Handle, MCSC_TEXT, MCTextColor);
    if not StyleServices.GetElementColor(StyleServices.GetElementDetails(teEditTextDisabled),
      ecTextColor, MCTrailingTextColor) then
      MCTrailingTextColor := MCTextColor;
    MonthCal_SetColor(Handle, MCSC_TRAILINGTEXT, MCTrailingTextColor);
    MonthCal_SetColor(Handle, MCSC_TITLEBK,
       StyleServices.GetSystemColor(clHighLight));
    MonthCal_SetColor(Handle, MCSC_TITLETEXT,
       StyleServices.GetSystemColor(clHighLightText));
  end;
end;

procedure TMonthCalendar.CNNotify(var Message: TWMNotifyMC);
var
  ST: TSystemTime;
  I, MonthNo, YearNo: Integer;
{$IFDEF CLR}
  DayState: TNMDayState;
  CurState: TMonthDayStateArray;
{$ELSE}
  DayState: PNMDayState;
  CurState: PMonthDayState;
{$ENDIF}
begin
  with Message, NMHdr{$IFNDEF CLR}^{$ENDIF} do
  begin
    case code of
      MCN_GETDAYSTATE:
        begin
          DayState := NMDayState;
          with DayState{$IFNDEF CLR}^{$ENDIF} do
          begin
{$IFDEF CLR}
            SetLength(CurState, cDayState);
{$ELSE}
            FillChar(prgDayState^, cDayState * SizeOf(TMonthDayState), 0);
{$ENDIF}
            if Assigned(FOnGetMonthInfo) or Assigned(FOnGetMonthBoldInfo) then
            begin
{$IFDEF CLR}
              CurState := TMonthDayStateArray(NativeBufToArray(prgDayState, CurState));
{$ELSE}
              CurState := prgDayState;
{$ENDIF}
              YearNo := stStart.wYear;
              for I := 0 to cDayState - 1 do
              begin
                MonthNo := stStart.wMonth + I;
                if MonthNo > 12 then
                begin
                  MonthNo := MonthNo - 12;
                  YearNo := stStart.wYear + 1;
                end;
                if Assigned(FOnGetMonthInfo) then
                  FOnGetMonthInfo(Self, MonthNo, CurState[I]);
                if Assigned(FOnGetMonthBoldInfo) then
                  FOnGetMonthBoldInfo(Self, MonthNo, YearNo, CurState[I]);
              end;
            end;
{$IFDEF CLR}
            prgDayState := ArrayToNativeBuf(CurState, prgDayState);
            NmDayState := DayState;
{$ENDIF}
          end;
        end;
      MCN_SELECT, MCN_SELCHANGE:
        with NMSelChange{$IFNDEF CLR}^{$ENDIF} do
        begin
          ST := stSelStart;
          if not IsBlankSysTime(ST) then
            FDateTime := SystemTimeToDateTime(ST);
          if FMultiSelect then
          begin
            ST := stSelEnd;
            if not IsBlankSysTime(ST) then
              FEndDate := SystemTimeToDateTime(ST);
          end;
        end;
    end;
  end;
  inherited;
end;

procedure TMonthCalendar.ConstrainedResize(var MinWidth, MinHeight, MaxWidth,
  MaxHeight: Integer);
var
  R: TRect;
  CtlMinWidth, CtlMinHeight: Integer;
begin
  if HandleAllocated then
  begin
    MonthCal_GetMinReqRect(Handle, R);
    with R do
    begin
      CtlMinHeight := Bottom - Top;
      CtlMinWidth := Right - Left;
    end;
    if MinHeight < CtlMinHeight then MinHeight := CtlMinHeight;
    if MinWidth < CtlMinWidth then MinWidth := CtlMinWidth;
  end;
  inherited ConstrainedResize(MinWidth, MinHeight, MaxWidth, MaxHeight);
end;

procedure TMonthCalendar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, MONTHCAL_CLASS);
  with Params do
  begin
    Style := Style or GetCalStyles;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW) or
      CS_DBLCLKS;
  end;
end;

function TMonthCalendar.GetCalendarHandle: HWND;
begin
  Result := Handle;
end;

function TMonthCalendar.MsgSetCalColors(ColorIndex: Integer; ColorValue: TColor): Boolean;
begin
  Result := True;
  if HandleAllocated then
    Result := MonthCal_SetColor(Handle, ColorIndex, ColorValue) <> DWORD($FFFFFFFF);
end;

function TMonthCalendar.MsgSetDateTime(Value: TSystemTime): Boolean;
begin
  Result := True;
  if HandleAllocated then
    Result := MonthCal_SetCurSel(Handle, Value);
end;

function TMonthCalendar.MsgSetRange(Flags: Integer; SysTime: TSystemTimeRangeArray): Boolean;
begin
  Result := True;
  if HandleAllocated then
    if Flags <> 0 then Result := MonthCal_SetRange(Handle, Flags, {$IFNDEF CLR}@{$ENDIF}SysTime);
end;

{$IFNDEF CLR}
function TMonthCalendar.MsgSetRange(Flags: Integer; SysTime: PSystemTime; Unused: Integer = 0): Boolean;
begin
  Result := True;
  if HandleAllocated then
    if Flags <> 0 then Result := MonthCal_SetRange(Handle, Flags, SysTime);
end;
{$ENDIF}

function TMonthCalendar.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
var
  R: TRect;
begin
  if HandleAllocated then
  begin
    Result := True;
    Perform(MCM_GETMINREQRECT, 0, R);
    with R do
    begin
      NewWidth := Right - Left;
      NewHeight := Bottom - Top;
    end;
  end
  else Result := False;
end;

{ TDateTimePicker }

class constructor TDateTimePicker.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TDateTimePicker, TDateTimePickerStyleHook);
end;

constructor TDateTimePicker.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCalExceptionClass := EDateTimeError;
  FChanging := False;
  DateTimeToSystemTime(FDateTime, FLastChange);
  FShowCheckbox := False;
  FChecked := True;
  ControlStyle := ControlStyle + [csFixedHeight, csReflector];
  Color := clWindow;
  ParentColor := False;
  TabStop := True;
  Width := 186;
  AdjustHeight;
  FCalAlignment := dtaLeft;
  FDateFormat := dfShort;
  FDateMode := dmComboBox;
  FKind := dtkDate;
  FParseInput := false;
end;

class destructor TDateTimePicker.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TDateTimePicker, TDateTimePickerStyleHook);
end;

procedure TDateTimePicker.AdjustHeight;
var
  DC: HDC;
  SaveFont: HFont;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  try
    GetTextMetrics(DC, SysMetrics);
    SaveFont := SelectObject(DC, Font.Handle);
    GetTextMetrics(DC, Metrics);
    SelectObject(DC, SaveFont);
  finally
    ReleaseDC(0, DC);
  end;
  Height := Metrics.tmHeight + (GetSystemMetrics(SM_CYBORDER) * 8);
end;

procedure TDateTimePicker.CheckEmptyDate;
begin
  if not FShowCheckbox then
    raise EDateTimeError.CreateRes({$IFNDEF CLR}@{$ENDIF}SNeedAllowNone);
  FChecked := False;
  Invalidate;
end;

procedure TDateTimePicker.CreateParams(var Params: TCreateParams);
const
  Formats: array[TDTDateFormat] of DWORD = (DTS_SHORTDATEFORMAT,
    DTS_LONGDATEFORMAT);
var

  ACalAlignment: TDTCalAlignment;
begin
  inherited CreateParams(Params);
  CreateSubClass(Params, DATETIMEPICK_CLASS);
  with Params do
  begin
    if FDateMode = dmUpDown then Style := Style or DTS_UPDOWN;
    if FKind = dtkTime then
      Style := Style or DTS_TIMEFORMAT
    else
      Style := Style or Formats[FDateFormat];
    ACalAlignment := FCalAlignment;
    if UseRightToLeftAlignment then
      if ACalAlignment = dtaLeft then
        ACalAlignment := dtaRight
      else
        ACalAlignment := dtaLeft;
    if ACalAlignment = dtaRight then Style := Style or DTS_RIGHTALIGN;
    if FParseInput then Style := Style or DTS_APPCANPARSE;
    if FShowCheckbox then Style := Style or DTS_SHOWNONE;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

function TDateTimePicker.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True
  else if ID = TObserverMapping.ControlValueID then
    Result := True;
end;

procedure TDateTimePicker.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TDateTimePicker.CreateWnd;
var
  LChecked: Boolean;
begin
  LChecked := FChecked;
  inherited CreateWnd;
  SetChecked(LChecked);
  if Length(FFormat) > 0 then
    DateTime_SetFormat(Handle, FFormat);
end;

procedure TDateTimePicker.CMColorChanged(var Message: TMessage);
begin
  inherited;
  InvalidateRect(Handle, nil, True);
end;

procedure TDateTimePicker.CMExit(var Message: TCMExit);
begin
  try
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      TLinkObservers.EditLinkUpdate(Observers);
    if Observers.IsObserving(TObserverMapping.ControlValueID) then
      TLinkObservers.ControlValueUpdate(Observers);
  except
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDateTimePicker.CMFontChanged(var Message: TMessage);
begin
  inherited;
  AdjustHeight;
  InvalidateRect(Handle, nil, True);
end;

procedure TDateTimePicker.CNNotify(var Message: TWMNotifyDT);

  function ObserversBeforeChange: Boolean;
  begin
    Result := True;
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
      if TLinkObservers.EditLinkEdit(Observers) then
        TLinkObservers.EditLinkModified(Observers)
      else
        Result := False;
  end;

  function ObserversAfterChange: Boolean;
  begin
    Result := True;
    if Observers.IsObserving(TObserverMapping.EditLinkID) then
    begin
      if TLinkObservers.EditLinkIsEditing(Observers) then
      begin
        TLinkObservers.EditLinkTrackUpdate(Observers);
      end
      else
      begin
        TLinkObservers.EditLinkReset(Observers); // Revert change
        Result := False;
      end;
    end;
    if Result and Observers.IsObserving(TObserverMapping.ControlValueID) then
    begin
      TLinkObservers.ControlValueModified(Observers);
      TLinkObservers.ControlValueTrackUpdate(Observers);
    end;
  end;

var
  DT: TDateTime;
  AllowChange: Boolean;
  UserString: string;
{$IFDEF CLR}
  DateTimeString: TNMDateTimeString;
{$ELSE}
  DateTimeString: PNMDateTimeString;
{$ENDIF}
begin
  with Message, NMHdr{$IFNDEF CLR}^{$ENDIF} do
  begin
    Result := 0;
    case code of
      DTN_CLOSEUP:
        begin
          FDroppedDown := False;
          SetDate(SystemTimeToDateTime(FLastChange));
          if Assigned(FOnCloseUp) then
            FOnCloseUp(Self);
        end;
      DTN_DATETIMECHANGE:
        begin
          with NMDateTimeChange{$IFNDEF CLR}^{$ENDIF} do
          begin
            if FDroppedDown and (dwFlags = GDT_VALID) then
            begin
              if ObserversBeforeChange then
              begin
                FLastChange := st;
                FDateTime := SystemTimeToDateTime(FLastChange);
              end;
            end
            else
            begin
              if FShowCheckbox and (dwFlags = GDT_NONE) then
                FChecked := False
              else
                if dwFlags = GDT_VALID then
                begin
                  if ObserversBeforeChange then
                  begin
                    FLastChange := st;
                    FChanging := True;
                    try
                      DT := SystemTimeToDateTime(st);
                      if Kind = dtkDate then
                        SetDate(DT)
                      else
                        SetTime(DT);
                    finally
                      FChanging := False;
                    end;
                  end;
                  if FShowCheckbox then
                    FChecked := True;
                end;
              end;
            if ObserversAfterChange then
              Change;
          end;
        end;
      DTN_DROPDOWN:
        begin
          DateTimeToSystemTime(Date, FLastChange);
          FDroppedDown := True;
          if Assigned(FOnDropDown) then
            FOnDropDown(Self);
        end;
      DTN_USERSTRINGA, DTN_USERSTRINGW:
        begin
          DateTimeString := NMDateTimeString;
          with DateTimeString{$IFNDEF CLR}^{$ENDIF} do
          begin
{$IFDEF CLR}
            UserString := Marshal.PtrToStringAuto(pszUserString);
{$ELSE}
            UserString := pszUserString;
{$ENDIF}
            DT := StrToDateTime(UserString);
            if Assigned(FOnUserInput) then
            begin
              AllowChange := True;
              FOnUserInput(Self, UserString, DT, AllowChange);
              dwFlags := Ord(not AllowChange);
            end
            else
              dwFlags := Ord(False);
            DateTimeToSystemTime(DT, st);
          end;
{$IFDEF CLR}
          NMDateTimeString := DateTimeString;
{$ENDIF}
        end;
    else
      inherited;
    end;
  end;
end;

function TDateTimePicker.GetCalendarHandle: HWND;
begin
  Result := DateTime_GetMonthCal(Handle);
end;

function TDateTimePicker.GetTime: TTime;
begin
  Result := TTime(FDateTime);
end;

function TDateTimePicker.MsgSetCalColors(ColorIndex: Integer; ColorValue: TColor): Boolean;
begin
  Result := True;
  if HandleAllocated then
    Result := DateTime_SetMonthCalColor(Handle, ColorIndex, ColorValue) <> DWORD($FFFFFFFF);
end;

function TDateTimePicker.MsgSetDateTime(Value: TSystemTime): Boolean;
begin
  Result := True;
  if HandleAllocated then
    if not FChanging then
    begin
      FChanging := True;
      try
        Result := DateTime_SetSystemTime(Handle, GDT_VALID, Value);
        if FShowCheckbox and not (csLoading in ComponentState) and
           not (csRecreating in ControlState) then
          FChecked := Result;
      finally
        FChanging := False;
      end;
    end;
end;

function TDateTimePicker.MsgSetRange(Flags: Integer; SysTime: TSystemTimeRangeArray): Boolean;
begin
  Result := True;
  if HandleAllocated then
    if Flags <> 0 then
      Result := DateTime_SetRange(Handle, Flags, {$IFNDEF CLR}@{$ENDIF}SysTime);
end;

{$IFNDEF CLR}
function TDateTimePicker.MsgSetRange(Flags: Integer; SysTime: PSystemTime; Unused: Integer = 0): Boolean;
begin
  Result := True;
  if HandleAllocated then
    if Flags <> 0 then
      Result := DateTime_SetRange(Handle, Flags, SysTime);
end;
{$ENDIF}

procedure TDateTimePicker.SetCalAlignment(Value: TDTCalAlignment);
begin
  if FCalAlignment <> Value then
  begin
    FCalAlignment := Value;
    if not (csDesigning in ComponentState) then
      SetComCtlStyle(Self, DTS_RIGHTALIGN, Value = dtaRight);
  end;
end;

procedure TDateTimePicker.SetChecked(Value: Boolean);
var
  ST: TSystemTime;
begin
  FChecked := Value;
  if FShowCheckbox then
  begin
    if Value then SetDateTime(FDateTime)
    else DateTime_SetSystemTime(Handle, GDT_NONE, ST);
    Invalidate;
  end;
end;

procedure TDateTimePicker.SetDateFormat(Value: TDTDateFormat);
begin
  if FDateFormat <> Value then
  begin
    FDateFormat := Value;
    RecreateWnd;
  end;
end;

procedure TDateTimePicker.SetDateMode(Value: TDTDateMode);
begin
  if FDateMode <> Value then
  begin
    FDateMode := Value;
    RecreateWnd;
  end;
end;

procedure TDateTimePicker.SetKind(Value: TDateTimeKind);
begin
  if FKind <> Value then
  begin
    FKind := Value;
    RecreateWnd;
  end;
end;

procedure TDateTimePicker.SetParseInput(Value: Boolean);
begin
  if FParseInput <> Value then
  begin
    FParseInput := Value;
    if not (csDesigning in ComponentState) then
      SetComCtlStyle(Self, DTS_APPCANPARSE, Value);
  end;
end;

procedure TDateTimePicker.SetShowCheckbox(Value: Boolean);
begin
  if FShowCheckbox <> Value then
  begin
    FShowCheckbox := Value;
    RecreateWnd;
  end;
end;

procedure TDateTimePicker.SetTime(Value: TTime);
var
  LDateTime: TDateTime;
begin
  if Abs(Frac(FDateTime)) <> Abs(Frac(Value)) then
  begin
    LDateTime := Value;
    ReplaceDate(LDateTime, FDateTime);
    if LDateTime = 0.0 then
    begin
      if not FShowCheckbox then
        raise EDateTimeError.CreateRes({$IFNDEF CLR}@{$ENDIF}SNeedAllowNone);
      FChecked := False;
      Invalidate;
    end
    else
      SetDateTime(LDateTime);
  end;
end;

procedure TDateTimePicker.SetFormat(const Value: string);
begin
  if FFormat <> Value then
  begin
    FFormat := Value;
    DateTime_SetFormat(Handle, FFormat);
  end;
end;

{ TPageScroller }

class constructor TPageScroller.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TPageScroller, TPageScrollerStyleHook);
end;

constructor TPageScroller.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 150;
  Height := 45;
  TabStop := True;
  ControlStyle := ControlStyle - [csCaptureMouse, csSetCaption] +
    [csAcceptsControls, csParentBackground, csPannable];
  FButtonSize := 12;
  FDragScroll := True;
  FAutoScroll := False;
end;

class destructor TPageScroller.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TPageScroller, TPageScrollerStyleHook);
end;

procedure TPageScroller.CreateParams(var Params: TCreateParams);
const
  OrientationStyle: array[TPageScrollerOrientation] of DWORD =
    (PGS_HORZ, PGS_VERT);
begin
  InitCommonControl(ICC_PAGESCROLLER_CLASS);
  inherited CreateParams(Params);
  CreateSubClass(Params, WC_PAGESCROLLER);
  with Params do
  begin
    if AutoScroll then Style := Style or PGS_AUTOSCROLL;
    if DragScroll then Style := Style or PGS_DRAGNDROP;
    Style := Style or OrientationStyle[Orientation];
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TPageScroller.CreateWnd;
begin
  inherited CreateWnd;
  Perform(CM_COLORCHANGED, 0, 0);
  if (FControl <> nil) then
    Perform(PGM_SETCHILD, 0, FControl.Handle);
  Perform(PGM_SETBUTTONSIZE, 0, ButtonSize);
  Perform(PGM_SETBORDER, 0, Margin);
  Perform(PGM_SETPOS, 0, Position);
  Perform(PGM_RECALCSIZE, 0, 0);
end;

function TPageScroller.GetButtonState(Button: TPageScrollerButton): TPageScrollerButtonState;
const
  ButtonPos: array[TPageScrollerButton] of Integer =
    (PGB_TOPORLEFT, PGB_BOTTOMORRIGHT);
begin
{$IFDEF CLR}
  case SendMessage(Handle, PGM_GETBUTTONSTATE, 0, ButtonPos[Button]).ToInt64 of
{$ELSE}
  case SendMessage(Handle, PGM_GETBUTTONSTATE, 0, ButtonPos[Button]) of
{$ENDIF}
    PGF_NORMAL: Result := bsNormal;
    PGF_GRAYED: Result := bsGrayed;
    PGF_DEPRESSED: Result := bsDepressed;
    PGF_HOT: Result := bsHot;
  else
    Result := bsInvisible;
  end;
end;

procedure TPageScroller.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Control) then Control := nil;
end;

procedure TPageScroller.Scroll(Shift: TShiftState; X, Y: Integer;
  Orientation: TPageScrollerOrientation; var Delta: Integer);
begin
  if Assigned(FOnScroll) then FOnScroll(Self, Shift, X, Y, Orientation, Delta);
end;

procedure TPageScroller.UpdatePreferredSize;
begin
  if Orientation = soHorizontal then
    FPreferredSize := Control.Width
  else
    FPreferredSize := Control.Height;
end;

procedure TPageScroller.SetAutoScroll(Value: Boolean);
begin
  if AutoScroll <> Value then
  begin
    FAutoScroll := Value;
    RecreateWnd;
  end;
end;

procedure TPageScroller.SetButtonSize(Value: Integer);
begin
  if ButtonSize <> Value then
  begin
    FButtonSize := Value;
    SendMessage(Handle, PGM_SETBUTTONSIZE, 0, Value);
    FButtonSize := Perform(PGM_GETBUTTONSIZE, 0, 0);
  end;
end;

procedure TPageScroller.DoSetControl(Value: TWinControl);
var
  ControlHandle: HWND;
begin
  FControl := Value;
  if csDestroying in ComponentState then Exit;
  ControlHandle := 0;
  if FControl <> nil then
  begin
    UpdatePreferredSize;
    FControl.FreeNotification(Self);
    FControl.Parent := Self;
    ControlHandle := FControl.Handle;
  end;
  if HandleAllocated then
  begin
    SendMessage(Handle, PGM_SETCHILD, 0, ControlHandle);
    SendMessage(Handle, PGM_RECALCSIZE, 0, 0);
  end;
end;

procedure TPageScroller.SetControl(Value: TWinControl);
var
  PrevControl: TWinControl;
begin
  if Control <> Value then
  begin
    PrevControl := FControl;
    DoSetControl(Value);
    if (PrevControl <> nil) and not (csDestroying in PrevControl.ComponentState) then
      PrevControl.Parent := Parent;
  end;
end;

procedure TPageScroller.SetDragScroll(Value: Boolean);
begin
  if DragScroll <> Value then
  begin
    FDragScroll := Value;
    RecreateWnd;
  end;
end;

procedure TPageScroller.SetMargin(Value: Integer);
begin
  if Margin <> Value then
  begin
    FMargin := Value;
    SendMessage(Handle, PGM_SETBORDER, 0, Value);
    FMargin := Perform(PGM_GETBORDER, 0, 0);
  end;
end;

procedure TPageScroller.SetOrientation(Value: TPageScrollerOrientation);
begin
  if Orientation <> Value then
  begin
    FOrientation := Value;
    RecreateWnd;
  end;
end;

procedure TPageScroller.SetPosition(Value: Integer);
begin
  if Position <> Value then
  begin
    FPosition := Value;
    SendMessage(Handle, PGM_SETPOS, 0, Value);
    Perform(PGM_RECALCSIZE, 0, 0);
    FPosition := Perform(PGM_GETPOS, 0, 0);
  end;
end;

procedure TPageScroller.AlignControls(AControl: TControl; var Rect: TRect);
begin
  if (csDesigning in ComponentState) or (AControl <> nil) and
    (AControl = Control) then
  begin
    inherited AlignControls(AControl, Rect);
    if Control <> nil then
    begin
      UpdatePreferredSize;
      { Prevent recursion for those controls that don't allow resizing }
      if (Orientation = soHorizontal) and (Control.Height = ClientHeight) or
        (Orientation = soVertical) and (Control.Width = ClientWidth) then
        Perform(PGM_RECALCSIZE, 0, 0);
    end;
  end;
  FPosition := Perform(PGM_GETPOS, 0, 0);
end;

procedure TPageScroller.WMNCHitTest(var Message: TWMNCHitTest);
begin
  with Message do
    if ControlCount = 0 then
      Result := HTCLIENT
    else
      inherited;
end;

procedure TPageScroller.CNNotify(var Message: TWMNotifyPS);
var
  Direction: TPageScrollerOrientation;
{$IFDEF CLR}
  PGCalcSize: TNMPGCalcSize;
  PGScroll: TNMPGScroll;
{$ELSE}
  PGCalcSize: PNMPGCalcSize;
  PGScroll: PNMPGScroll;
{$ENDIF}

  function KeysToShiftState(Keys: Word): TShiftState;
  begin
    Result := [ssLeft];
    if Keys and PGK_SHIFT <> 0 then Include(Result, ssShift);
    if Keys and PGK_CONTROL <> 0 then Include(Result, ssCtrl);
    if Keys and PGK_MENU <> 0 then Include(Result, ssAlt);
  end;

begin
  with Message do
    case NMHdr.code of
      PGN_CALCSIZE:
        if Control <> nil then
        begin
          PGCalcSize := NMPGCalcSize;
          with PGCalcSize{$IFNDEF CLR}^{$ENDIF} do
          begin
            if Orientation = soHorizontal then
            begin
              iWidth := FPreferredSize + 2 * BorderWidth;
              iHeight := Control.Height + 2 * BorderWidth;
            end
            else
            begin
              iWidth := Control.Width + 2 * BorderWidth;
              iHeight := FPreferredSize + 2 * BorderWidth;
            end;
          end;
{$IFDEF CLR}
          NMPGCalcSize := PGCalcSize;
{$ENDIF}
        end;
      PGN_SCROLL:
        begin
          PGScroll := NMPGScroll;
          with PGScroll{$IFNDEF CLR}^{$ENDIF} do
          begin
            if iDir in [PGF_SCROLLDOWN, PGF_SCROLLUP] then
            begin
              Direction := soVertical;
              if iDir = PGF_SCROLLUP then
                iScroll := -iScroll;
            end
            else
            begin
              Direction := soHorizontal;
              if iDir = PGF_SCROLLLEFT then
                iScroll := -iScroll;
            end;
            Scroll(KeysToShiftState(fwKeys), iXPos, iYPos, Direction, iScroll);
            { WINBUG: When scrolling right or down, if the first button isn't
              visible then the iScroll amount needs to be adjusted by the
              first button's size. }
            if iScroll > 0 then
            begin
              if (GetButtonState(sbFirst) = bsInvisible) then
                Inc(iScroll, ButtonSize);
            end;
            if iScroll < 0 then iScroll := -iScroll;
            if Orientation = soHorizontal then
              FPosition := iXPos + iScroll else
              FPosition := iYPos + iScroll;
          end;
{$IFDEF CLR}
          NMPGScroll := PGScroll;
{$ENDIF}
        end;
    end; 
end;

procedure TPageScroller.CMColorChanged(var Message: TMessage);
begin
  if HandleAllocated then
    SendMessage(Handle, PGM_SETBKCOLOR, 0, ColorToRGB(Color));
  inherited;
end;

{$IFDEF CLR}
procedure TPageScroller.ControlChange(Inserting: Boolean; Child: TControl);
begin
  { Can only accept TWinControl descendents }
  if not (csLoading in ComponentState) and (Child is TWinControl) then
  begin
    if Inserting then
      DoSetControl(TWinControl(Child));
  end;
end;
{$ELSE}
procedure TPageScroller.CMControlChange(var Message: TCMControlChange);
begin
  { Can only accept TWinControl descendents }
  if not (csLoading in ComponentState) and (Message.Control is TWinControl) then
  begin
    if Message.Inserting then
      DoSetControl(TWinControl(Message.Control));
  end;
end;
{$ENDIF}

{ TComboExItem }

procedure TComboExItem.Assign(Source: TPersistent);
begin
  if Source is TComboExItem then
  begin
    FSelectedImageIndex := TComboExItem(Source).SelectedImageIndex;
    FIndent := TComboExItem(Source).Indent;
    FOverlayImageIndex := TComboExItem(Source).OverlayImageIndex;
    FImageIndex := TComboExItem(Source).ImageIndex;
    FCaption := TComboExItem(Source).Caption;
    FData := TComboExItem(Source).Data;
  end
  else
    inherited Assign(Source);
end;

procedure TComboExItem.SetCaption(const Value: string);
begin
  inherited SetCaption(Value);
  TComboExItems(Collection).SetItem(Index);
  if (TComboExItems(Collection).SortType = Vcl.ListActns.stText) or
  (TComboExItems(Collection).SortType = Vcl.ListActns.stBoth) then
    TComboExItems(Collection).Sort;
end;

procedure TComboExItem.SetData(const Value: TCustomData);
begin
  inherited SetData(Value);
  TComboExItems(Collection).SetItem(Index);
  if (TComboExItems(Collection).SortType = Vcl.ListActns.stData) or
  (TComboExItems(Collection).SortType = Vcl.ListActns.stBoth) then
    TComboExItems(Collection).Sort;
end;

procedure TComboExItem.SetDisplayName(const Value: string);
begin
  inherited SetDisplayName(Value);
  TComboExItems(Collection).SetItem(Index);
end;

procedure TComboExItem.SetImageIndex(const Value: TImageIndex);
begin
  if (FSelectedImageIndex = -1) or (FSelectedImageIndex = ImageIndex) then
    FSelectedImageIndex := Value;
  inherited SetImageIndex(Value);
  TComboExItems(Collection).SetItem(Index);
end;

procedure TComboExItem.SetIndex(Value: Integer);
begin
  inherited SetIndex(Value);
  TComboExItems(Collection).SetItem(Value);
end;

procedure TComboExItem.SetOverlayImageIndex(const Value: TImageIndex);
begin
  FOverlayImageIndex := Value;
  TComboExItems(Collection).SetItem(Index);
end;

procedure TComboExItem.SetSelectedImageIndex(const Value: TImageIndex);
begin
  FSelectedImageIndex := Value;
  TComboExItems(Collection).SetItem(Index);
end;

{ TComboExItems }

function TComboExItems.Add: TComboExItem;
begin
  Result := TComboExItem(inherited Add);
end;

function TComboExItems.AddItem(const Caption: string; const ImageIndex,
  SelectedImageIndex, OverlayImageIndex, Indent: Integer;
  Data: TCustomData): TComboExItem;
begin
  Result := Add;
  Result.Caption := Caption;
  Result.ImageIndex := ImageIndex;
  Result.SelectedImageIndex := SelectedImageIndex;
  Result.OverlayImageIndex := OverlayImageIndex;
  Result.Indent := Indent;
  Result.Data := Data;
  SetItem(Result.Index);
end;

function TComboExItems.GetComboItem(const Index: Integer): TComboExItem;
begin
  Result := TComboExItem(Items[Index]);
end;

function TComboExItems.Insert(Index: Integer): TComboExItem;
var
  I : integer;
begin
  Result := TComboExItem(inherited Insert(Index));
  for I := Index to Count - 1 do
    SetItem(I);
end;

procedure TComboExItems.Notify(Item: TCollectionItem;
  Action: TCollectionNotification);
begin
  case Action of
    System.Classes.TCollectionNotification.cnAdded:
      with TComboExItem(Item) do
      begin
        FImageIndex := -1;
        FSelectedImageIndex := -1;
        FIndent := -1;
        FOverlayImageIndex := -1;
        FData := nil;
        FCaption := '';
      end;
    System.Classes.TCollectionNotification.cnExtracting:
      if not (csDestroying in TWinControl(Owner).ComponentState) then
        SendMessage(TWinControl(Owner).Handle, CBEM_DELETEITEM, Item.Index, 0);
  end;
end;

procedure TComboExItems.SetItem(const Index: Integer);
var
  AnItem: TComboBoxExItem;
  Insert: BOOL;
begin
{$IFNDEF CLR}
  FillChar(AnItem, SizeOf(TComboBoxExItem), 0);
{$ENDIF}
  AnItem.iItem := Index;
  AnItem.cchTextMax := 0;
  Insert := SendGetStructMessage(TWinControl(Owner).Handle,
    _CBEM_GETITEM, 0, AnItem, True) = 0;
  with AnItem, ComboItems[Index] do
  begin
    mask := CBEIF_TEXT or CBEIF_IMAGE or CBEIF_SELECTEDIMAGE or
      CBEIF_INDENT or CBEIF_LPARAM;
{$IFDEF CLR}
    pszText := Caption;
{$ELSE}
    pszText := PChar(Caption);
{$ENDIF}
    iItem := Index;
    cchTextMax := Length(Caption);
    iImage := ImageIndex;
    iSelectedImage := SelectedImageIndex;
    iOverlay := OverlayImageIndex;
    iIndent := Indent;
{$IFNDEF CLR}
    lParam := Winapi.Windows.LPARAM(Data);
{$ENDIF}
  end;
  if Insert then
    SendStructMessage(TWinControl(Owner).Handle, _CBEM_INSERTITEM, Index, AnItem)
  else
    SendStructMessage(TWinControl(Owner).Handle, _CBEM_SETITEM, Index, AnItem);
end;

{ TCustomComboBoxEx }

type
{$IFDEF CLR}
  TStringArray = array of string;
  TComboBoxExEnumerator = class(TInterfacedObject, IEnumString)
  private
    FItems: TComboExItems;
    FCurrentIndex: Integer;
  protected
    { IEnumString }
    function Clone(out enm: IEnumString): HResult;
    function Next(celt: Longint;
      [out, MarshalAs(UnmanagedType.LPArray, ArraySubType=UnmanagedType.LPWStr, SizeParamIndex = 0)]
      rgelt: TStringArray; out pceltFetched: Longint): HResult;
    function Reset: HResult;
    function Skip(celt: Longint): HResult;

    function GetString(Index: Integer): string;
    function GetCount: Integer;
  public
    constructor Create(Items: TComboExItems);
  end;
{$ELSE}
  TComboBoxExEnumerator = class(TInterfacedObject, IEnumString)
  private
    FItems: TComboExItems;
    FCurrentIndex: Integer;
    type
      TPtrArray = array[0..0] of Pointer;
  protected
    { IEnumString }
    function Clone(out enm: IEnumString): HRESULT; stdcall;
    function Next(celt: Integer; out elt; pceltFetched: PLongint): HRESULT;
      stdcall;
    function Reset: HRESULT; stdcall;
    function Skip(celt: Integer): HRESULT; stdcall;

    function GetString(Index: Integer): string;
    function GetCount: Integer;
  public
    constructor Create(Items: TComboExItems);
  end;
{$ENDIF}

{$IFDEF CLR}
procedure TComboExInstance.Finalize;
begin
  if Assigned(FHandle) then
  begin
    FreeObjectInstance(FHandle);
    FHandle := nil;
  end;
  inherited;
end;
{$ENDIF}

class constructor TCustomComboBoxEx.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomComboBoxEx, TComboBoxExStyleHook);
end;

constructor TCustomComboBoxEx.Create(AOwner: TComponent);
var
  LItemClass: TComboBoxExStringsClass;
begin
{$IFDEF CLR}
  CheckThreadingModel(System.Threading.ApartmentState.STA);
{$ENDIF}
  CheckCommonControl(ICC_USEREX_CLASSES);
  inherited Create(AOwner);
{$IFDEF CLR}
  FComboBoxExInstance := TComboExInstance.Create;
  FComboBoxExInstance.Handle := MakeObjectInstance(ComboExWndProc);
{$ELSE}
  FComboBoxExInstance := MakeObjectInstance(ComboExWndProc);
{$ENDIF}
  Assert(GetItemsClass.InheritsFrom(TComboBoxExStrings));
  LItemClass := TComboBoxExStringsClass(GetItemsClass);
  Items := LItemClass.Create(Self);
  TComboBoxExStrings(Items).ComboBox := Self;
  FItemsEx := TComboBoxExStrings(Items).FItems;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FStyle := csExDropDown;
  FAutoCompleteOptions := [acoAutoAppend];
end;

class destructor TCustomComboBoxEx.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomComboBoxEx, TComboBoxExStyleHook);
end;

destructor TCustomComboBoxEx.Destroy;
begin
  Items.Free;
  FreeAndNil(FImageChangeLink);
  if HandleAllocated then
    DestroyWindowHandle;
{$IFDEF CLR}
  if Assigned(FComboBoxExInstance) then
  begin
    FreeObjectInstance(FComboBoxExInstance.Handle);
    FComboBoxExInstance.Handle := nil;
    System.GC.SuppressFinalize(FComboBoxExInstance);
    FreeAndNil(FComboBoxExInstance);
  end;
{$ELSE}
  FreeObjectInstance(FComboBoxExInstance);
{$ENDIF}
  FreeAndNil(FMemStream);
  FAutoCompleteIntf := nil;
  inherited Destroy;
end;

procedure TCustomComboBoxEx.CNNotify(var Message: TWMNotify);
begin
  with Message do
    case NMHdr.code of
      CBEN_BEGINEDIT: if Assigned(FOnBeginEdit) then FOnBeginEdit(Self);
      CBEN_ENDEDIT  : if Assigned(FOnEndEdit) then FOnEndEdit(Self);
    else
      inherited;
    end;
end;

procedure TCustomComboBoxEx.CreateParams(var Params: TCreateParams);
const
  ComboBoxExStyles: array[TComboBoxExStyle] of DWORD = (
    CBS_DROPDOWN, CBS_SIMPLE, CBS_DROPDOWNLIST);
begin
  InitCommonControl(ICC_USEREX_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, WC_COMBOBOXEX);
  with Params do
  begin
    Style := Style or WS_TABSTOP or WS_VSCROLL or WS_CLIPCHILDREN or
      CCS_NORESIZE or CBS_AUTOHSCROLL or ComboBoxExStyles[Self.Style];
    ExStyle := ExStyle and not WS_EX_CLIENTEDGE;
    WindowClass.style := (WindowClass.style or CS_DBLCLKS) and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

procedure TCustomComboBoxEx.SetImages(const Value: TCustomImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if Images <> nil then
  begin
    Images.RegisterChanges(FImageChangeLink);
    Images.FreeNotification(Self);
    if HandleAllocated then
      PostMessage(Handle, CBEM_SETIMAGELIST, 0, Images.Handle);
  end
  else
  begin
    if HandleAllocated then
    begin
      Perform(CBEM_SETIMAGELIST, 0, 0);
      RecreateWnd;
    end;
  end;
end;

procedure TCustomComboBoxEx.ImageListChange(Sender: TObject);
begin
  if HandleAllocated then
    Perform(CBEM_SETIMAGELIST, 0, TCustomImageList(Sender).Handle);
end;

procedure TCustomComboBoxEx.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    CN_CTLCOLORMSGBOX..CN_CTLCOLORSTATIC:
      if not NewStyleControls and (Style < csExDropDownList) and (Parent <> nil) then
        Message.Result := Parent.Brush.Handle;
    else
      inherited WndProc(Message);
  end;
end;

procedure TCustomComboBoxEx.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FImages) then
    Images := nil; // must go through the setter
end;

procedure TCustomComboBoxEx.SetStyle(Value: TComboBoxExStyle);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    if Value = csExSimple then
      ControlStyle := ControlStyle - [csFixedHeight]
    else
      ControlStyle := ControlStyle + [csFixedHeight];
    if HandleAllocated then
      RecreateWnd;
  end;
end;

procedure TCustomComboBoxEx.CMParentColorChanged(var Message: TMessage);
begin
  inherited;
  if not NewStyleControls and (Style < csExDropDownList) then
    Invalidate;
end;

procedure TCustomComboBoxEx.CBGetEditSel(var Message: TMessage);
begin
  if FStyle in [csExSimple, csExDropDown] then
  begin
    HandleNeeded;
    SendMessage(FEditHandle, EM_GETSEL, Message.WParam, Message.LParam);
  end
  else
    inherited;
end;

procedure TCustomComboBoxEx.CBSetEditSel(var Message: TMessage);
begin
  if FStyle in [csExSimple, csExDropDown] then
  begin
    HandleNeeded;
    SendMessage(FEditHandle, EM_SETSEL, Message.LParamLo, Message.LParamHi);
  end
  else
    inherited;
end;

procedure TCustomComboBoxEx.CMColorChanged(var Message: TMessage);
var
  R: TRect;
begin
  inherited;
  if HandleAllocated and NewStyleControls then
  begin
    R := ClientRect;
    if FComboBoxExHandle <> 0 then
      InvalidateRect(FComboBoxExHandle, R, False);
    if FEditHandle <> 0 then
      InvalidateRect(FEditHandle, R, False);
  end;
end;

procedure TCustomComboBoxEx.WMLButtonDown(var Message: TWMLButtonDown);
var
  Form: TCustomForm;
begin
  if (DragMode = dmAutomatic) and (Style = csExDropDownList) and
      (Message.XPos < (Width - GetSystemMetrics(SM_CXHSCROLL))) then
  begin
    SetFocus;
    BeginDrag(False);
    Exit;
  end;
  inherited;
  if MouseCapture then
  begin
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.ActiveControl <> Self) then
      MouseCapture := False;
  end;
end;

procedure TCustomComboBoxEx.WMSetText(var Message: TWMSetText);
begin
  FEditText := Message.Text;
  if (FStyle = csExSimple) and (FEditHandle <> 0) then
  begin
    if GetEditText <> FEditText then
    begin
      SendMessage(FEditHandle, WM_SETTEXT, 0, LPARAM(PChar(FEditText)));
      SendMessage(FEditHandle, CM_TEXTCHANGED, 0, 0);
    end;
  end
  else
    inherited;
end;

procedure TCustomComboBoxEx.ComboExWndProc(var Message: TMessage);
var
  ACanvas: TCanvas;
  DC: HDC;
  R: TRect;
  IConX, IConY: Integer;
  PS: TPaintStruct;
begin
  if Message.Msg = WM_MOUSEWHEEL then
  begin
    WndProc(Message);
    if Message.Result = 1 then
      Exit;
  end;

  if Style = csExDropDown then
  begin
    case Message.Msg of
      WM_ERASEBKGND:
      begin
        FillRect(TWMEraseBkgnd(Message).DC, ClientRect, Brush.Handle);
        Message.Result := 1;
      end;

      WM_PAINT:
        begin
          ACanvas := TCanvas.Create;
          DC := TWMPaint(Message).DC;
          if DC <> 0 then
            ACanvas.Handle := DC
          else
            ACanvas.Handle := BeginPaint(FComboBoxExHandle, PS);
          try
            R := ClientRect;
            if (Images <> nil) and (ItemIndex <> -1) then
            begin
              IconX := 5;
              IconY := R.Top + R.Height div 2 - Images.Height div 2;
              if IconY < R.Top then IconY := R.Top;

              if (ItemsEx[ItemIndex].ImageIndex >= 0) and
                (ItemsEx[ItemIndex].ImageIndex < Images.Count) then
                Images.Draw(ACanvas, IconX, IconY,
                  ItemsEx[ItemIndex].ImageIndex, Enabled);
            end;
            TWMPaint(Message).DC := ACanvas.Handle;
            ComboWndProc(Message, FComboBoxExHandle, FComboBoxExDefProc);

          finally
            if DC = 0 then
              EndPaint(FComboBoxExHandle, PS);
            ACanvas.Handle := 0;
            ACanvas.Free;
          end;
        end;
    else
      ComboWndProc(Message, FComboBoxExHandle, FComboBoxExDefProc);
    end;
  end
  else
    ComboWndProc(Message, FComboBoxExHandle, FComboBoxExDefProc);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomComboBoxEx.CreateWnd;
var
  ChildHandle: THandle;
  I: Integer;
  StrEnum: IEnumString;
  EditHandle: THandle;
{$IFDEF CLR}
  AutoCompleteType: System.Type;
{$ENDIF}
begin
  inherited CreateWnd;
  FDropHandle := GetWindow(Handle, GW_CHILD);
  FComboBoxExHandle := FDropHandle;
  FComboBoxExDefProc := TWindowProcPtr(GetWindowLong(FComboBoxExHandle, GWL_WNDPROC));
{$IFDEF CLR}
  SetWindowLong(FComboBoxExHandle, GWL_WNDPROC, FComboBoxExInstance.Handle);
{$ELSE}
  SetWindowLong(FComboBoxExHandle, GWL_WNDPROC, LPARAM(FComboBoxExInstance));
{$ENDIF}
  if FStyle in [csExDropDown, csExSimple] then
  begin
    ChildHandle := GetWindow(GetWindow(Handle, GW_CHILD), GW_CHILD);
    if ChildHandle <> 0 then
    begin
      if FStyle = csExSimple then
      begin
        FListHandle := ChildHandle;
        FDefListProc := TWindowProcPtr(GetWindowLong(FListHandle, GWL_WNDPROC));
{$IFDEF CLR}
        SetWindowLong(FListHandle, GWL_WNDPROC, FListInstance);
{$ELSE}
        SetWindowLong(FListHandle, GWL_WNDPROC, LPARAM(FListInstance));
{$ENDIF}
        ChildHandle := GetWindow(ChildHandle, GW_HWNDNEXT);
      end;
      FEditHandle := ChildHandle;
      FDefEditProc := TWindowProcPtr(GetWindowLong(FEditHandle, GWL_WNDPROC));
{$IFDEF CLR}
      SetWindowLong(FEditHandle, GWL_WNDPROC, FEditInstance);
{$ELSE}
      SetWindowLong(FEditHandle, GWL_WNDPROC, LPARAM(FEditInstance));
{$ENDIF}
    end;
  end;
  if FStyle = csExSimple then
    Perform(WM_SETTEXT, 0, LPARAM(PChar(FEditText)));
  if NewStyleControls and (FEditHandle <> 0) then
    SendMessage(FEditHandle, EM_SETMARGINS, EC_LEFTMARGIN or EC_RIGHTMARGIN, 0);
  if FMemStream <> nil then
  begin
    ItemsEx.BeginUpdate;
    FReading := True;
    try
      ItemsEx.Assign(FMemStream);
      for I := 0 to ItemsEx.Count - 1 do
        ItemsEx.SetItem(I);
      FreeAndNil(FMemStream);
      Font := Font;
      ItemIndex := FSaveIndex;
    finally
      ItemsEx.EndUpdate;
      FReading := False;
    end;
  end;
  if Assigned(Images) then
    PostMessage(Handle, CBEM_SETIMAGELIST, 0, Images.Handle);
  SetStyleEx(StyleEx);

  FAutoCompleteIntf := nil;
{$IFDEF CLR}
  AutoCompleteType := System.Type.GetTypeFromCLSID(Guid.Create(CLSID_AutoComplete));
  FAutoCompleteIntf := Activator.CreateInstance(AutoCompleteType) as IAutoComplete;
{$ELSE}
  CoCreateInstance(CLSID_AutoComplete, nil, CLSCTX_INPROC_SERVER,
    IAutoComplete, FAutoCompleteIntf);
{$ENDIF}

  if FAutoCompleteIntf <> nil then
  begin
    EditHandle := SendMessage(Handle, CBEM_GETEDITCONTROL, 0, 0);
    if EditHandle <> 0 then
    begin
      StrEnum := TComboBoxExEnumerator.Create(FItemsEx);
      FAutoCompleteIntf.Init(EditHandle, StrEnum, nil, nil);
      UpdateAutoComplete;
    end;
  end;
end;

function TCustomComboBoxEx.GetItemCount: Integer;
begin
  Result := Items.Count;
end;

function TCustomComboBoxEx.GetItemsClass: TCustomComboBoxStringsClass;
begin
  Result := TComboBoxExStrings;
end;

function TCustomComboBoxEx.GetSelText: string;
begin
  Result := '';
  if FStyle < csExDropDownList then
    Result := Copy(Text, GetSelStart + 1, GetSelLength);
end;

procedure TCustomComboBoxEx.SetItemsEx(const Value: TComboExItems);
begin
  FItemsEx.Assign(Value);
end;

function TCustomComboBoxEx.GetActionLinkClass: TControlActionLinkClass;
begin
  Result := TComboBoxExActionLink;
end;

procedure TCustomComboBoxEx.SetStyleEx(const Value: TComboBoxExStyles);
const
  ComboExStyles: array[TComboBoxExStyleEx] of DWORD = (CBES_EX_CASESENSITIVE,
    CBES_EX_NOEDITIMAGE, CBES_EX_NOEDITIMAGEINDENT, CBES_EX_NOSIZELIMIT,
    CBES_EX_PATHWORDBREAKPROC);
var
  AStyle: DWORD;
  I: TComboBoxExStyleEx;
begin
  AStyle := 0;
  FStyleEx := Value;
  if HandleAllocated then
  begin
    for I := Low(TComboBoxExStyleEx) to High(TComboBoxExStyleEx) do
      if I in FStyleEx then
        AStyle := AStyle or ComboExStyles[I];
    SendMessage(Handle, CBEM_SETEXTENDEDSTYLE, 0, AStyle);
  end;
end;

function TCustomComboBoxEx.IsItemsExStored: Boolean;
begin
  Result := (Action = nil) or Assigned(Action) and not (Action is TCustomListAction);
end;

procedure TCustomComboBoxEx.ActionChange(Sender: TObject;
  CheckDefaults: Boolean);
begin
  inherited ActionChange(Sender, CheckDefaults);
  if Sender is TStaticListAction then
    with TStaticListAction(Sender) do
    begin
      if not CheckDefaults or (Self.Images = nil) then
        Self.Images := Images;
      if not CheckDefaults or (Self.ItemIndex <> -1) then
        Self.ItemIndex := ItemIndex;
    end;
end;

procedure TCustomComboBoxEx.SetDropDownCount(const Value: Integer);
begin
  inherited SetDropDownCount(Value);
  if ((ComponentState * [csLoading, csDesigning]) = []) and HandleAllocated then
    RecreateWnd;
end;

procedure TCustomComboBoxEx.SetSelText(const Value: string);
begin
  if FStyle in [csExSimple, csExDropDown] then
  begin
    HandleNeeded;
{$IFDEF CLR}
    if Assigned(Value) then
      SendTextMessage(FEditHandle, EM_REPLACESEL, 0, Value)
    else
      SendTextMessage(FEditHandle, EM_REPLACESEL, 0, '');
{$ELSE}
    SendMessage(FEditHandle, EM_REPLACESEL, 0, LPARAM(PChar(Value)));
{$ENDIF}
  end;
end;

function TCustomComboBoxEx.GetDropDownCount: Integer;
begin
  Result := inherited DropDownCount;
end;

function TCustomComboBoxEx.GetEditText: string;
var
  LBuffer: string;
begin
  Result := '';
  if FEditHandle <> 0 then
  begin
    SetLength(LBuffer, GetEditTextLength + 1);
    SetString(Result, PChar(LBuffer), GetWindowText(FEditHandle, PChar(LBuffer), Length(LBuffer)));
  end;
end;

function TCustomComboBoxEx.GetEditTextLength: integer;
begin
  Result := 0;
  if FEditHandle <> 0  then
    Result := SendMessage(FEditHandle, WM_GETTEXTLENGTH, 0, 0);
end;

function TCustomComboBoxEx.GetItemHt: Integer;
begin
  Result := Perform(CB_GETITEMHEIGHT, 0, 0); // returns 0 if Handle = 0
end;

procedure TCustomComboBoxEx.DestroyWnd;
begin
  if (ItemsEx.Count > 0) and (FMemStream = nil) and (csRecreating in ControlState) then
  begin
    FMemStream := TCollection.Create(TComboExItem);
    FMemStream.Assign(ItemsEx);
    FSaveIndex := ItemIndex;
  end;
  inherited DestroyWnd;
end;

function TCustomComboBoxEx.Focused: Boolean;
var
  FocusedWnd: HWND;
begin
  Result := False;
  if HandleAllocated then
  begin
    FocusedWnd := GetFocus;
    Result := (FocusedWnd <> 0) and((FocusedWnd = FEditHandle) or (FocusedWnd = FListHandle) or
              (FocusedWnd = FComboBoxExHandle));
  end;
end;

procedure TCustomComboBoxEx.KeyPress(var Key: Char);
var
  LItemIndex, Idx, I,
  FirstIndex, LastIndex: Integer;
begin
  inherited KeyPress(Key);
  if (Style <> csExDropDownList) or (Ord(Key) in [$00, VK_RETURN, VK_BACK, VK_ESCAPE, VK_TAB]) then
    Exit;

  LItemIndex := ItemIndex;
  Idx := LItemIndex;
  FirstIndex := 0;
  LastIndex := Items.Count - 1;

  if (LItemIndex >= 0) and (LItemIndex < LastIndex) and StartsText(Key, Items[LItemIndex]) then
    FirstIndex := LItemIndex + 1;

  repeat
    for I := FirstIndex to LastIndex do
    begin
      if StartsText(Key, Items[I]) then
      begin
        Idx := I;
        Break;
      end
    end;
    if FirstIndex > 0 then
    begin
      FirstIndex := 0;
      LastIndex := LItemIndex;
    end
    else
      Break;
  until LItemIndex <> Idx;

  if LItemIndex <> Idx then
  begin
    SendMessage(Handle, CB_SETCURSEL, Idx, 0);
    Text := Items[ItemIndex];
    Click;
    Select;
  end;

  Key := #0;
end;

procedure TCustomComboBoxEx.UpdateAutoComplete;
var
  Auto2: IAutoComplete2;
  ActualOptions: DWORD;
begin
  if HandleAllocated and (FAutoCompleteIntf <> nil) then
  begin
    if Supports(FAutoCompleteIntf, IAutoComplete2, Auto2) then
    begin
      if FAutoCompleteOptions = [] then
        Auto2.SetOptions(ACO_NONE)
      else
      begin
        ActualOptions := 0;
        if acoAutoSuggest in FAutoCompleteOptions then
          ActualOptions := ActualOptions or ACO_AUTOSUGGEST;
        if acoAutoAppend in FAutoCompleteOptions then
          ActualOptions := ActualOptions or ACO_AUTOAPPEND;
        if acoSearch in FAutoCompleteOptions then
          ActualOptions := ActualOptions or ACO_SEARCH;
        if acoFilterPrefixes in FAutoCompleteOptions then
          ActualOptions := ActualOptions or ACO_FILTERPREFIXES;
        if acoUseTab in FAutoCompleteOptions then
          ActualOptions := ActualOptions or ACO_USETAB;
        if acoUpDownKeyDropsList in FAutoCompleteOptions then
          ActualOptions := ActualOptions or ACO_UPDOWNKEYDROPSLIST;
        if acoRtlReading in FAutoCompleteOptions then
          ActualOptions := ActualOptions or ACO_RTLREADING;

        Auto2.SetOptions(ActualOptions);
      end;
    end
    else
      FAutoCompleteIntf.Enable(acoAutoSuggest in FAutoCompleteOptions);
  end;
end;

procedure TCustomComboBoxEx.SetAutoCompleteOptions(
  const Value: TAutoCompleteOptions);
begin
  if FAutoCompleteOptions <> Value then
  begin
    FAutoCompleteOptions := Value;
    UpdateAutoComplete;
  end;
end;

procedure TCustomComboBoxEx.WMGetText(var Message: TWMGetText);
begin
  case FStyle of
    csExSimple:
      Message.Result := StrLen(StrLCopy(PChar(Message.Text), PChar(GetEditText), Message.TextMax - 1));
    csExDropDownList:
      if ItemIndex <> -1 then
        Message.Result := StrLen(StrLCopy(PChar(Message.Text), PChar(Items[ItemIndex]), Message.TextMax - 1));
    else
      inherited;
  end;
end;


procedure TCustomComboBoxEx.WMGetTextLength(var Message: TWMGetTextLength);
begin
  case FStyle of
    csExSimple:
      Message.Result := GetEditTextLength;
    csExDropDownList:
      begin
        Message.Result := 0;
        if ItemIndex <> -1 then
          Message.Result := Length(Items[ItemIndex]);
      end
    else
      inherited;
  end;
end;

procedure TCustomComboBoxEx.WMHelp(var Message: TWMHelp);
{$IFDEF CLR}
var
  LHelpInfo: THelpInfo;
begin
  LHelpInfo := Message.HelpInfo;
  LHelpInfo.hItemHandle := Handle;
  Message.HelpInfo := LHelpInfo;
  inherited;
{$ELSE}
begin
  Message.HelpInfo^.hItemHandle := Handle;
  inherited;
{$ENDIF}
end;

{ TComboBoxEx }

class constructor TComboBoxEx.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TComboBoxEx, TComboBoxExStyleHook);
end;

class destructor TComboBoxEx.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TComboBoxEx, TComboBoxExStyleHook);
end;

{ TStatusBar }

class constructor TStatusBar.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TStatusBar, TStatusBarStyleHook);
end;

class destructor TStatusBar.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TStatusBar, TStatusBarStyleHook);
end;

function TStatusBar.GetOnDrawPanel: TDrawPanelEvent;
begin
{$IFDEF CLR}
  Result := Self.FOnDrawPanel;
{$ELSE}
  Result := TDrawPanelEvent(inherited OnDrawPanel);
{$ENDIF}
end;

procedure TStatusBar.SetOnDrawPanel(const Value: TDrawPanelEvent);
begin
{$IFDEF CLR}
  Self.FOnDrawPanel := Value;
  if Assigned(Value) then
    inherited OnDrawPanel := OnCustomDrawPanel
  else
    inherited OnDrawPanel := nil;
{$ELSE}
  inherited OnDrawPanel := TCustomDrawPanelEvent(Value);
{$ENDIF}
end;

{$IFDEF CLR}
procedure TStatusBar.OnCustomDrawPanel(StatusBar: TCustomStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Assigned(Self.FOnDrawPanel) and (StatusBar is TStatusBar) then
    Self.FOnDrawPanel(TStatusBar(StatusBar), Panel, Rect);
end;
{$ENDIF}

{ TComboBoxExStrings }

function TComboBoxExStrings.Add(const S: string): Integer;
begin
  with FItems.Add do
  begin
    Caption := S;
    Result := Index;
  end;
end;

function TComboBoxExStrings.AddObject(const S: string;
  AObject: TObject): Integer;
begin
  with FItems.Add do
  begin
    Caption := S;
    Data := AObject;
    Result := Index;
  end;
end;

procedure TComboBoxExStrings.Clear;
begin
  FItems.BeginUpdate;
  try
    FItems.Clear;
    if ComboBox.HandleAllocated then
      ComboBox.Perform(CM_RECREATEWND, 0, 0);
  finally
    FItems.EndUpdate;
  end;
end;

constructor TComboBoxExStrings.Create(Owner: TCustomComboboxEx);
begin
  inherited Create;
  FItems := GetItemsClass.Create(Owner, GetItemClass);
end;

destructor TComboBoxExStrings.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

procedure TComboBoxExStrings.Delete(Index: Integer);
begin
  FItems.Delete(Index);
end;

procedure TComboBoxExStrings.Exchange(Index1, Index2: Integer);
var
  Text: string;
  Image: Integer;
begin
  Text := ItemsEx[Index2].Caption;
  ItemsEx[Index2].Caption := ItemsEx[Index1].Caption;
  ItemsEx[Index1].Caption := Text;

  Image := ItemsEx[Index2].ImageIndex;
  ItemsEx[Index2].ImageIndex := ItemsEx[Index1].ImageIndex;
  ItemsEx[Index1].ImageIndex := Image;

  Image := TComboExItem(ItemsEx[Index2]).SelectedImageIndex;
  TComboExItem(ItemsEx[Index2]).SelectedImageIndex :=
    TComboExItem(ItemsEx[Index1]).SelectedImageIndex;
  TComboExItem(ItemsEx[Index1]).SelectedImageIndex := Image;

  Image := TComboExItem(ItemsEx[Index2]).OverlayImageIndex;
  TComboExItem(ItemsEx[Index2]).OverlayImageIndex :=
    TComboExItem(ItemsEx[Index1]).OverlayImageIndex;
  TComboExItem(ItemsEx[Index1]).OverlayImageIndex := Image;
end;

function TComboBoxExStrings.Get(Index: Integer): string;
begin
  Result := FItems[Index].Caption;
end;

function TComboBoxExStrings.GetCapacity: Integer;
begin
  Result := FItems.Count;
end;

function TComboBoxExStrings.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TComboBoxExStrings.GetObject(Index: Integer): TObject;
begin
  Result := TObject(FItems[Index].Data);
end;

function TComboBoxExStrings.IndexOf(const S: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FItems.Count - 1 do
    if AnsiCompareText(FItems[I].Caption, S) = 0 then
    begin
      Result := I;
      break;
    end;
end;

function TComboBoxExStrings.IndexOfName(const Name: string): Integer;
begin
  Result := IndexOf(Name);  // Simply forward this on to IndexOf
end;

procedure TComboBoxExStrings.Insert(Index: Integer; const S: string);
var
  AnItem: TComboExItem;
begin
  AnItem := FItems.Insert(Index);
  AnItem.Caption := S;
end;

procedure TComboBoxExStrings.Move(CurIndex, NewIndex: Integer);
begin
  FItems[CurIndex].Index := NewIndex;
end;

procedure TComboBoxExStrings.PutObject(Index: Integer; AObject: TObject);
begin
  FItems[Index].Data := AObject;
end;

procedure TComboBoxExStrings.SetItems(const Value: TComboExItems);
begin
  FItems.Assign(Value);
end;

procedure TComboBoxExStrings.SetUpdateState(Updating: Boolean);
begin
  if ComboBox.HandleAllocated then
  begin
    SendMessage(ComboBox.Handle, WM_SETREDRAW, Ord(not Updating), 0);
    if not Updating then
      ComboBox.Refresh;
  end;
end;

function TComboBoxExStrings.AddItem(const Caption: string;
  const ImageIndex, SelectedImageIndex, OverlayImageIndex, Indent: Integer;
  Data: TCustomData): TComboExItem;
begin
  Result := FItems.AddItem(Caption, ImageIndex, SelectedImageIndex,
    OverlayImageIndex, Indent, Data);
end;

function TComboBoxExStrings.GetSortType: TListItemsSortType;
begin
  Result := FItems.SortType;
end;

procedure TComboBoxExStrings.SetSortType(const Value: TListItemsSortType);
begin
  FItems.SortType := Value;
end;

function TComboBoxExStrings.GetItemsClass: TComboExItemsClass;
begin
  Result := TComboExItems;
end;

function TComboBoxExStrings.GetItemClass: TComboExItemClass;
begin
  Result := TComboExItem;
end;

{ THeaderControl }

class constructor THeaderControl.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(THeaderControl, THeaderStyleHook);
end;

class destructor THeaderControl.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(THeaderControl, THeaderStyleHook);
end;

function THeaderControl.GetOnDrawSection: TDrawSectionEvent;
begin
{$IFDEF CLR}
  Result := Self.FOnDrawSection;
{$ELSE}
  Result := TDrawSectionEvent(inherited OnDrawSection);
{$ENDIF}
end;

function THeaderControl.GetOnSectionClick: TSectionNotifyEvent;
begin
{$IFDEF CLR}
  Result := Self.FOnSectionClick;
{$ELSE}
  Result := TSectionNotifyEvent(inherited OnSectionClick);
{$ENDIF}
end;

function THeaderControl.GetOnSectionResize: TSectionNotifyEvent;
begin
{$IFDEF CLR}
  Result := Self.FOnSectionResize;
{$ELSE}
  Result := TSectionNotifyEvent(inherited OnSectionResize);
{$ENDIF}
end;

function THeaderControl.GetOnSectionTrack: TSectionTrackEvent;
begin
{$IFDEF CLR}
  Result := Self.FOnSectionTrack;
{$ELSE}
  Result := TSectionTrackEvent(inherited OnSectionTrack);
{$ENDIF}
end;

procedure THeaderControl.SetOnDrawSection(const Value: TDrawSectionEvent);
begin
{$IFDEF CLR}
  Self.FOnDrawSection := Value;
  if Assigned(Value) then
    inherited OnDrawSection := OnCustomDrawSection
  else
    inherited OnDrawSection := nil;
{$ELSE}
  inherited OnDrawSection := TCustomDrawSectionEvent(Value);
{$ENDIF}
end;

procedure THeaderControl.SetOnSectionClick(
  const Value: TSectionNotifyEvent);
begin
{$IFDEF CLR}
  Self.FOnSectionClick := Value;
  if Assigned(Value) then
    inherited OnSectionClick := OnCustomSectionClick
  else
    inherited OnSectionClick := nil;
{$ELSE}
  inherited OnSectionClick := TCustomSectionNotifyEvent(Value);
{$ENDIF}
end;

procedure THeaderControl.SetOnSectionResize(
  const Value: TSectionNotifyEvent);
begin
{$IFDEF CLR}
  Self.FOnSectionResize := Value;
  if Assigned(Value) then
    inherited OnSectionResize := OnCustomSectionResize
  else
    inherited OnSectionResize := nil;
{$ELSE}
  inherited OnSectionResize := TCustomSectionNotifyEvent(Value);
{$ENDIF}
end;

procedure THeaderControl.SetOnSectionTrack(
  const Value: TSectionTrackEvent);
begin
{$IFDEF CLR}
  Self.FOnSectionTrack := Value;
  if Assigned(Value) then
    inherited OnSectionTrack := OnCustomSectionTrack
  else
    inherited OnSectionTrack := nil;
{$ELSE}
  inherited OnSectionTrack := TCustomSectionTrackEvent(Value);
{$ENDIF}
end;

{$IFDEF CLR}
procedure THeaderControl.OnCustomDrawSection(HeaderControl: TCustomHeaderControl;
  Section: THeaderSection; const Rect: TRect; Pressed: Boolean);
begin
  if Assigned(Self.FOnDrawSection) and (HeaderControl is THeaderControl) then
    Self.FOnDrawSection(THeaderControl(HeaderControl), Section, Rect, Pressed);
end;

procedure THeaderControl.OnCustomSectionClick(HeaderControl: TCustomHeaderControl;
  Section: THeaderSection);
begin
  if Assigned(Self.FOnSectionClick) and (HeaderControl is THeaderControl) then
    Self.FOnSectionClick(THeaderControl(HeaderControl), Section);
end;

procedure THeaderControl.OnCustomSectionResize(HeaderControl: TCustomHeaderControl;
  Section: THeaderSection);
begin
  if Assigned(Self.FOnSectionResize) and (HeaderControl is THeaderControl) then
    Self.FOnSectionResize(THeaderControl(HeaderControl), Section);
end;

procedure THeaderControl.OnCustomSectionTrack(HeaderControl: TCustomHeaderControl;
  Section: THeaderSection; Width: Integer; State: TSectionTrackState);
begin
  if Assigned(Self.FOnSectionTrack) and (HeaderControl is THeaderControl) then
    Self.FOnSectionTrack(THeaderControl(HeaderControl), Section, Width, State);
end;
{$ENDIF}

{ TListViewActionLink }

procedure TListViewActionLink.AddItem(ACaption: string; AImageIndex: Integer;
  DataPtr: TCustomData);
begin
  with TCustomListView(FClient).Items.Add do
  begin
    ImageIndex := AImageIndex;
    Caption := ACaption;
    Data := DataPtr;
  end;
end;

procedure TListViewActionLink.AddItem(AnItem: TListControlItem);
begin
  with TCustomListView(FClient).Items.Add do
  begin
    ImageIndex := AnItem.ImageIndex;
    Caption := AnItem.Caption;
    Data := AnItem.Data;
  end;
end;

procedure TListViewActionLink.SetImages(Value: TCustomImageList);
begin
  if IsImagesLinked then
    (FClient as TCustomListView).SmallImages := Value
end;

{ TComboBoxExActionLink }

procedure TComboBoxExActionLink.AddItem(ACaption: string;
  AImageIndex: Integer; DataPtr: TCustomData);
begin
  with FClient as TCustomComboBoxEx do
    ItemsEx.AddItem(ACaption, AImageIndex, AImageIndex, -1, -1, DataPtr);
end;

procedure TComboBoxExActionLink.AddItem(AnItem: TListControlItem);
begin
  with FClient as TCustomComboBoxEx do
    ItemsEx.AddItem(AnItem.Caption, AnItem.ImageIndex, AnItem.ImageIndex, -1,
      -1, AnItem.Data);
end;

{ TComboBoxExEnumerator }

function TComboBoxExEnumerator.Clone(out enm: IEnumString): HRESULT;
var
  NewEnum: TComboBoxExEnumerator;
begin
  NewEnum := TComboBoxExEnumerator.Create(FItems);
  enm := NewEnum;
  NewEnum.FCurrentIndex := FCurrentIndex;
  Result := S_OK;
end;

constructor TComboBoxExEnumerator.Create(Items: TComboExItems);
begin
  inherited Create;
  FItems := Items;
end;

function TComboBoxExEnumerator.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TComboBoxExEnumerator.GetString(Index: Integer): string;
begin
  Result := FItems[Index].Caption;
end;

{$IFDEF CLR}
function TComboBoxExEnumerator.Next(celt: Longint; rgelt: TStringArray;
  out pceltFetched: Longint): HRESULT;
var
  I: Integer;
  TotalCount: Integer;
begin
  I := 0;
  TotalCount := GetCount;
  while (I < celt) and (FCurrentIndex < TotalCount) do
  begin
    rgelt[I] := GetString(FCurrentIndex);
    Inc(I);
    Inc(FCurrentIndex);
  end;
  pceltFetched := I;
  if I = celt then
    Result := S_OK
  else
    Result := S_FALSE;
end;
{$ELSE}
function TComboBoxExEnumerator.Next(celt: Integer; out elt;
  pceltFetched: PLongint): HRESULT;
var
  I: Integer;
  W: WideString;
  Size: Integer;
  TotalCount: Integer;
begin
  I := 0;
  TotalCount := GetCount;
  while (I < celt) and (FCurrentIndex < TotalCount) do
  begin
    W := GetString(FCurrentIndex);
    Size := Length(W) * SizeOf(WideChar);
    TPtrArray(elt)[I] := CoTaskMemAlloc(Size + SizeOf(WideChar));
    FillChar(TPtrArray(elt)[I]^, Size + SizeOf(WideChar), 0);
    CopyMemory(TPtrArray(elt)[I], PWideString(W), Size);
    Inc(I);
    Inc(FCurrentIndex);
  end;
  if pceltFetched <> nil then
    pceltFetched^ := I;
  if I = celt then
    Result := S_OK
  else
    Result := S_FALSE;
end;
{$ENDIF}

function TComboBoxExEnumerator.Reset: HRESULT;
begin
  FCurrentIndex := 0;
  Result := S_OK;
end;

function TComboBoxExEnumerator.Skip(celt: Longint): HRESULT;
var
  TotalCount: Integer;
begin
  TotalCount := GetCount;
  FCurrentIndex := FCurrentIndex + celt;
  if FCurrentIndex < TotalCount then
    Result := S_OK
  else
  begin
    FCurrentIndex := 0;
    Result := S_FALSE;
  end;
end;

{$IFDEF CLR}
procedure InitializeMessages;
begin
  if Marshal.SystemDefaultCharSize = 1 then
  begin
    _HDM_INSERTITEM := HDM_INSERTITEMA;
    _HDM_SETITEM := HDM_SETITEMA;

    _SB_SETTEXT := SB_SETTEXTA;

    _TCM_GETITEM := TCM_GETITEMA;
    _TCM_SETITEM := TCM_SETITEMA;
    _TCM_INSERTITEM := TCM_INSERTITEMA;

    _TB_SAVERESTORE := TB_SAVERESTOREA;
    _TB_ADDSTRING := TB_ADDSTRINGA;
    _TB_SETBUTTONINFO := TB_SETBUTTONINFOA;
    _TB_INSERTBUTTON := TB_INSERTBUTTONA;

    _CBEM_GETITEM := CBEM_GETITEMA;
    _CBEM_INSERTITEM := CBEM_INSERTITEMA;
    _CBEM_SETITEM := CBEM_SETITEMA;

    _ACM_OPEN := ACM_OPENA;

    _RB_INSERTBAND := RB_INSERTBANDA;
    _RB_SETBANDINFO := RB_SETBANDINFOA;
    _RB_GETBANDINFO := RB_GETBANDINFOA;
  end;
end;
{$ENDIF}


{ TListGroup }

constructor TListGroup.Create(Collection: TCollection);
var
  Group: TLVGroup;
begin
  FGroupID := TListGroups(Collection).NextGroupID;
  inherited Create(Collection);
  FState := [lgsNormal];
  FHeaderAlign := taLeftJustify;
  FFooterAlign := taLeftJustify;
  FTitleImage := -1;

  with Group do
  begin
    cbSize := SizeOf(Group);
    mask := LVGF_STATE or LVGF_GROUPID;
    iGroupID := FGroupID;
    state := LVGS_NORMAL;
  end;

  if TListGroups(Collection).Owner.HandleAllocated then
    ListView_InsertGroup(TListGroups(Collection).Owner.Handle, Index, Group);
end;

destructor TListGroup.Destroy;
var
  Groups: TListGroups;
  Items: TListItems;
  I: Integer;
begin
  Groups := TListGroups(Collection);
  if Groups.Owner.HandleAllocated then
    ListView_RemoveGroup(Groups.Owner.Handle, GroupID);

  Items := Groups.Owner.Items;
  if not Groups.Owner.OwnerData then
    for I := 0 to Items.Count - 1 do
      if Items[I].GroupID = GroupID then
        Items[I].GroupID := -1;

  inherited Destroy;
  Groups.UpdateGroups;
end;

procedure TListGroup.SetHeader(Value: string);
begin
  if FHeader <> Value then
  begin
    FHeader := Value;
    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      TListGroups(Collection).Owner.UpdateGroups;
  end;
end;

procedure TListGroup.SetFooter(Value: string);
begin
  if FFooter <> Value then
  begin
    FFooter := Value;
    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      TListGroups(Collection).Owner.UpdateGroups;
  end;
end;

procedure TListGroup.SetGroupID(Value: Integer);
var
  I: Integer;
  GroupItems: array of Integer;
begin
  SetLength(GroupItems, 0);

  if Value <> FGroupID then
  begin
    for I := 0 to TListGroups(Collection).Count - 1 do
    begin
      if TListGroups(Collection)[I].GroupID = Value then
        Exit;
    end;

    for I := 0 to TListGroups(Collection).Owner.Items.Count - 1 do
    begin
      if TListGroups(Collection).Owner.Items[I].GroupID = FGroupID then
      begin
        SetLength(GroupItems, Length(GroupItems) + 1);
        GroupItems[Length(GroupItems) - 1] := I;
      end;
    end;

    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      ListView_RemoveGroup(TListGroups(Collection).Owner.Handle, FGroupID);
    FGroupID := Value;
    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      TListGroups(Collection).Owner.UpdateGroups;

    for I := 0 to Length(GroupItems) - 1 do
    begin
      TListGroups(Collection).Owner.Items[GroupItems[I]].GroupID := FGroupID;
    end;
  end;
end;

function TListGroup.GetState: TListGroupStateSet;
var
  State: Cardinal;
begin
  Result := FState;
  if TListGroups(Collection).Owner.HandleAllocated then
  begin
    State := ListView_GetGroupState(TListGroups(Collection).Owner.Handle, GroupID, $FFFFFFFF);
    Result := Result - [lgsHidden, lgsCollapsed, lgsFocused, lgsSelected, lgsSubseted, lgsSubSetLinkFocused];

    if State and LVGS_HIDDEN <> 0 then
      Include(Result, lgsHidden);
    if State and LVGS_COLLAPSED <> 0 then
      Include(Result, lgsCollapsed);
    if State and LVGS_FOCUSED <> 0 then
      Include(Result, lgsFocused);
    if State and LVGS_SELECTED <> 0 then
      Include(Result, lgsSelected);
    if State and LVGS_SUBSETED <> 0 then
      Include(Result, lgsSubseted);
    if State and LVGS_SUBSETLINKFOCUSED <> 0 then
      Include(Result, lgsSubSetLinkFocused);

    FState := Result;
  end;
end;

procedure TListGroup.SetState(Value: TListGroupStateSet);
begin
  if FState <> Value then
  begin
    FState := Value;
    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      TListGroups(Collection).Owner.UpdateGroups;
  end;
end;

procedure TListGroup.SetHeaderAlign(Value: TAlignment);
begin
  if FHeaderAlign <> Value then
  begin
    FHeaderAlign := Value;
    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      TListGroups(Collection).Owner.UpdateGroups;
  end;
end;

procedure TListGroup.SetFooterAlign(Value: TAlignment);
begin
  if FFooterAlign <> Value then
  begin
    FFooterAlign := Value;
    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      TListGroups(Collection).Owner.UpdateGroups;
  end;
end;

procedure TListGroup.SetSubtitle(Value: string);
begin
  if FSubtitle <> Value then
  begin
    FSubtitle := Value;
    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      TListGroups(Collection).Owner.UpdateGroups;
  end;
end;

procedure TListGroup.SetTitleImage(Value: TImageIndex);
begin
  if FTitleImage <> Value then
  begin
    FTitleImage := Value;
    if not (csLoading in TListGroups(Collection).Owner.ComponentState) then
      TListGroups(Collection).Owner.UpdateGroups;
  end;
end;

procedure TListGroup.ReadDescriptionTop(Reader: TReader);
begin
  FDescriptionTop := Reader.ReadString;
end;

procedure TListGroup.ReadDescriptionBottom(Reader: TReader);
begin
  FDescriptionBottom := Reader.ReadString;
end;

procedure TListGroup.IgnoreInt(Reader: TReader);
begin
  Reader.ReadInteger;
end;

procedure TListGroup.IgnoreString(Reader: TReader);
begin
  Reader.ReadString;
end;

procedure TListGroup.DefineProperties(Filer: TFiler);
begin
  Filer.DefineProperty('ExtendedImage', IgnoreInt, nil, False);
  Filer.DefineProperty('SubsetTitle', IgnoreString, nil, False);

  Filer.DefineProperty('TopDescription', ReadDescriptionTop, nil, False);
  Filer.DefineProperty('BottomDescription', ReadDescriptionBottom, nil, False);
end;

function TListGroup.GetDisplayName: string;
begin
  Result := Header;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

procedure TListGroup.SetIndex(Value: Integer);
begin
  inherited;
end;

procedure TListGroup.Assign(Source: TPersistent);
var
  Group: TListGroup;
begin
  if Source is TListGroup then
  begin
    Group := TListGroup(Source);

    Header := Group.Header;
    Footer := Group.Footer;
    State := Group.State;
    HeaderAlign := Group.HeaderAlign;
    FooterAlign := Group.FooterAlign;
    Subtitle := Group.Subtitle;
    {TopDescription := Group.DescriptionTop;
    BottomDesription := Group.DescriptionBottom;
    TitleImage := Group.TitleImage;
    ExtendedImage := Group.ExtendedImage;
    SubsetTitle := Group.SubsetTitle;}
  end
  else
    inherited Assign(Source);
end;

{ TListGroups }

function TListGroups.GetItem(Index: Integer): TListGroup;
begin
  Result := TListGroup(inherited GetItem(Index));
end;

procedure TListGroups.SetItem(Index: Integer; Value: TListGroup);
begin
  inherited SetItem(Index, Value);
end;

function TListGroups.GetNextGroupID: Integer;
var
  I: Integer;
begin
  Result := 0;

  if Count = 0 then
    Exit;

  while True do
  begin
    for I := 0 to Count - 1 do
    begin
      if Items[I].GroupID = Result then
      begin
        Inc(Result);
        break;
      end
      else if I = Count - 1 then
      begin
        Exit;
      end;
    end;
  end;
end;

procedure TListGroups.UpdateGroups;
begin
  if not Owner.HandleAllocated then
    Exit;

  BeginUpdate;
  try
    Owner.UpdateGroups;
  finally
    EndUpdate;
  end;
end;

function TListGroups.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TListGroups.Update(Item: TCollectionItem);
begin
  if Item <> nil then
    Owner.UpdateGroup(Item.Index)
  else
    Owner.UpdateGroups;
end;

constructor TListGroups.Create(AOwner: TCustomListView);
begin
  inherited Create(TListGroup);
  FOwner := AOwner;
end;

function TListGroups.Add: TListGroup;
begin
  Result := TListGroup(inherited Add);
  UpdateGroups;
end;

function TListGroups.Owner: TCustomListView;
begin
  Result := FOwner;
end;

{$IFNDEF CLR}
procedure FreeConversionFormatList;
var
  I: Integer;
begin
  if ConversionFormatList = nil then Exit;
  ConversionFormatList.Remove(@RTFConversionFormat);
  ConversionFormatList.Remove(@TextConversionFormat);
  for I := 0 to ConversionFormatList.Count - 1 do
    Dispose(PConversionFormat(ConversionFormatList[I]));
  FreeAndNil(ConversionFormatList);
end;
{$ENDIF}


type
  TControlClass = class(TWinControl);

{ TTabControlStyleHook }

constructor TTabControlStyleHook.Create;
begin
  inherited;
  DoubleBuffered := True;
  OverridePaint := True;
  OverrideEraseBkgnd := True;
  FUpDownInstance := nil;
  FUpDownHandle := 0;
  FUpDownDefWndProc := nil;
  FUpDownLeftPressed := False;
  FUpDownRightPressed := False;
  FUpDownMouseOnLeft := False;
  FUpDownMouseOnRight := False;
end;

destructor TTabControlStyleHook.Destroy;
begin
  if FUpDownHandle <> 0 then
    SetWindowLong(FUpDownHandle, GWL_WNDPROC, IntPtr(FUpDownDefWndProc));
  FreeObjectInstance(FUpDownInstance);
  inherited;
end;

procedure TTabControlStyleHook.CNNotify(var Message: TWMNotify);
begin
  if (Message.NMHdr.Code = TCN_SELCHANGE) and (LongWord(Message.IDCtrl) = Handle) and (FUpDownHandle <> 0) then
    UpdateUpDownArea;
end;

procedure TTabControlStyleHook.WMParentNotify(var Message: TMessage);
begin
  if (FUpDownHandle = 0) and (seClient in Control.StyleElements) then
    HookUpDownControl;
end;

procedure TTabControlStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
  case Message.Msg of
    TCM_ADJUSTRECT:
     if (FUpDownHandle = 0) and (seClient in Control.StyleElements) then
       HookUpDownControl;
  end;
end;

procedure TTabControlStyleHook.HookUpDownControl;
begin
  if FUpDownHandle <> 0 then Exit;
  FUpDownHandle := FindWindowEx(Handle, 0, 'msctls_updown32', nil); // do not localize
  if FUpDownHandle <> 0 then
  begin
    FUpDownInstance := MakeObjectInstance(UpDownWndProc);
    FUpDownDefWndProc := Pointer(GetWindowLong(FUpDownHandle, GWL_WNDPROC));
    SetWindowLong(FUpDownHandle, GWL_WNDPROC, IntPtr(FUpDownInstance));
  end;
end;

procedure TTabControlStyleHook.UpdateUpDownArea;
var
  R, R1: TRect;
  P: TPoint;
begin
  if FUpDownHandle = 0 then
    Exit;
  GetWindowRect(FUpDownHandle, R);
  P := Control.ScreenToClient(Point(R.Left, R.Top));
  if TabPosition = tpTop then
  begin
    R1 := Rect(P.X, 0, P.X + R.Width, P.Y + R.Height + 5);
    RedrawWindow(Handle, R1, 0, RDW_INVALIDATE);
  end
  else
  begin
    R1 := Rect(P.X, P.Y - 5, P.X + R.Width, Control.Height);
    RedrawWindow(Handle, R1, 0, RDW_INVALIDATE);
  end;
end;

procedure TTabControlStyleHook.PaintUpDown(Canvas: TCanvas);
var
  Buffer: TBitmap;
  R, BoundsRect: TRect;
  DrawState: TThemedScrollBar;
  Details: TThemedElementDetails;
begin
  GetWindowRect(FUpDownHandle, BoundsRect);
  if (BoundsRect.Width = 0) or (BoundsRect.Height = 0) or not StyleServices.Available then
    Exit;
  {create buffer}
  Buffer := TBitMap.Create;
  try
    Buffer.Width := BoundsRect.Width;
    Buffer.Height := BoundsRect.Height;
    R := TRect.Create(0, 0, Buffer.Width, Buffer.Height);
                                          
    Buffer.Canvas.Brush.Color := StyleServices.ColorToRGB(clBtnFace);
    Buffer.Canvas.FillRect(R);
    {left button}
    R.Right := R.Left + R.Width div 2;
    if FUpDownLeftPressed then
       DrawState := tsArrowBtnLeftPressed
    else if FUpDownMouseOnLeft {and MouseInControl} then
      DrawState := tsArrowBtnLeftHot
    else
      DrawState := tsArrowBtnLeftNormal;
    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Buffer.Canvas.Handle, Details, R);
    {right button}
    R := TRect.Create(0, 0, Buffer.Width, Buffer.Height);
    R.Left := R.Right - R.Width div 2;
    if FUpDownRightPressed then
      DrawState := tsArrowBtnRightPressed
    else if FUpDownMouseOnRight {and MouseInControl} then
      DrawState :=  tsArrowBtnRightHot
    else
      DrawState :=  tsArrowBtnRightNormal;
    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Buffer.Canvas.Handle, Details, R);
    {draw buffer}
    Canvas.Draw(0, 0, Buffer);
  finally
    Buffer.Free;
  end;
end;

procedure TTabControlStyleHook.UpDownWndProc(var Msg: TMessage);
var
  FCallOldProc: Boolean;

  procedure WMLButtonDblClk(var Msg: TWMMouse);
  var
    R, R1: TRect;
  begin
    SendMessage(FUpDownHandle, WM_SETREDRAW, 0, 0);
    Msg.Result := CallWindowProc(FUpDownDefWndProc, FUpDownHandle,
      Msg.Msg, TMessage(Msg).WParam, TMessage(Msg).LParam);
    SendMessage(FUpDownHandle, WM_SETREDRAW, 1, 0);
    GetWindowRect(FUpDownHandle, R);
    R1 := Rect(0, 0, R.Width, R.Height);
    R1.Right := R1.Left +  R1.Width div 2;
    if R1.Contains(Point(Msg.XPos, Msg.YPos)) then
      FUpDownLeftPressed := True
    else
      FUpDownLeftPressed := False;
    R1 := Rect(0, 0, R.Width, R.Height);
    R1.Left := R1.Right - R1.Width div 2;
    if R1.Contains(Point(Msg.XPos, Msg.YPos)) then
      FUpDownRightPressed := True
    else
      FUpDownRightPressed := False;
    RedrawWindow(FUpDownHandle, nil, 0, RDW_INVALIDATE);
    FCallOldProc := False;
  end;

  procedure WMLButtonDown(var Msg: TWMMouse);
  begin
    WMLButtonDblClk(Msg);
  end;

  procedure WMLButtonUp(var Msg: TWMMouse);
  begin
    SendMessage(FUpDownHandle, WM_SETREDRAW, 0, 0);
    Msg.Result := CallWindowProc(FUpDownDefWndProc, FUpDownHandle,
      Msg.Msg, TMessage(Msg).WParam, TMessage(Msg).LParam);
    SendMessage(FUpDownHandle, WM_SETREDRAW, 1, 0);
    FUpDownLeftPressed := False;
    FUpDownRightPressed := False;
    RedrawWindow(FUpDownHandle, nil, 0, RDW_INVALIDATE);
    UpdateUpDownArea;
    FCallOldProc := False;
  end;

  procedure WMMouseMove(var Msg: TWMMouse);
  var
    R, R1: TRect;
    FOldUpDownMouseOnLeft, FOldUpDownMouseOnRight: Boolean;
  begin
    Msg.Result := CallWindowProc(FUpDownDefWndProc, FUpDownHandle,
      Msg.Msg, TMessage(Msg).WParam, TMessage(Msg).LParam);

    FOldUpDownMouseOnLeft := FUpDownMouseOnLeft;
    FOldUpDownMouseOnRight := FUpDownMouseOnRight;

    GetWindowRect(FUpDownHandle, R);

    R1 := Rect(0, 0, R.Width, R.Height);
    R1.Right := R1.Left +  R1.Width div 2;
    if R1.Contains(Point(Msg.XPos, Msg.YPos)) then
      FUpDownMouseOnLeft := True
    else
      FUpDownMouseOnLeft := False;
    R1 := Rect(0, 0, R.Width, R.Height);
    R1.Left := R1.Right - R1.Width div 2;
    if R1.Contains(Point(Msg.XPos, Msg.YPos)) then
      FUpDownMouseOnRight := True
    else
      FUpDownMouseOnRight := False;

    if (FOldUpDownMouseOnLeft <> FUpDownMouseOnLeft) or
       (FOldUpDownMouseOnRight <> FUpDownMouseOnRight) then
      RedrawWindow(FUpDownHandle, nil, 0, RDW_INVALIDATE);

    FCallOldProc := False;
  end;

  procedure WMMouseLeave(Msg: TMessage);
  begin
    FUpDownMouseOnLeft := False;
    FUpDownMouseOnRight := False;
    FUpDownLeftPressed := False;
    FUpDownRightPressed := False;
    RedrawWindow(FUpDownHandle, nil, 0, RDW_INVALIDATE);
  end;

  procedure WMPaint(Msg: TMessage);
  var
    DC: HDC;
    Canvas: TCanvas;
    PS: TPaintStruct;
  begin
    DC := Msg.WParam;
    Canvas := TCanvas.Create;
    if DC <> 0 then
      Canvas.Handle := DC
    else
      Canvas.Handle := BeginPaint(FUpDownHandle, PS);
    try
      PaintUpDown(Canvas);
    finally
      if DC = 0 then
        EndPaint(FUpDownHandle, PS);
      Canvas.Handle := 0;
      Canvas.Free;
    end;
    FCallOldProc := False;
  end;

begin
  FCallOldProc := True;
  case Msg.Msg of
    WM_MOUSELEAVE: WMMouseLeave(Msg);
    WM_LBUTTONDBLCLK: WMLButtonDblClk(TWMMouse(Msg));
    WM_LBUTTONDOWN: WMLButtonDown(TWMMouse(Msg));
    WM_LBUTTONUP: WMLButtonUp(TWMMouse(Msg));
    WM_MOUSEMOVE:  WMMouseMove(TWMMouse(Msg));
    WM_PAINT: WMPaint(Msg);
  end;
  if FCallOldProc then
    Msg.Result := CallWindowProc(FUpDownDefWndProc, FUpDownHandle,
      Msg.Msg, Msg.WParam, Msg.LParam);
end;

procedure TTabControlStyleHook.AngleTextOut(Canvas: TCanvas; Angle: Integer; X, Y: Integer; const Text: string);
var
  SaveIndex: Integer;
begin
  SaveIndex := SaveDC(Canvas.Handle);
  try
    SetBkMode(Canvas.Handle, TRANSPARENT);
    Canvas.Font.Orientation := Angle;
    Canvas.TextOut(X, Y, Text);
  finally
    RestoreDC(Canvas.Handle, SaveIndex);
  end;
end;

procedure TTabControlStyleHook.DrawTab(Canvas: TCanvas; Index: Integer);
var
  R, LayoutR, GlyphR: TRect;
  ImageWidth, ImageHeight, ImageStep, TX, TY: Integer;
  DrawState: TThemedTab;
  Details: TThemedElementDetails;
  ThemeTextColor: TColor;
  FImageIndex: Integer;
begin
  if Control is TCustomTabControl then
    FImageIndex := TCustomTabControl(Control).GetImageIndex(Index)
  else
    FImageIndex := Index;

  if (Images <> nil) and (FImageIndex < Images.Count) then
  begin
    ImageWidth := Images.Width;
    ImageHeight := Images.Height;
    ImageStep := 3;
  end
  else
  begin
    ImageWidth := 0;
    ImageHeight := 0;
    ImageStep := 0;
  end;

  R := TabRect[Index];
  if R.Left < 0 then Exit;

  if TabPosition in [tpTop, tpBottom] then
  begin
    if Index = TabIndex then
      InflateRect(R, 0, 2);
  end
  else if Index = TabIndex then
    Dec(R.Left, 2) else Dec(R.Right, 2);

  Canvas.Font.Assign(TCustomTabControl(Control).Font);
  LayoutR := R;
  DrawState := ttTabDontCare;
  case TabPosition of
    tpTop:
      begin
        if Index = TabIndex then
          DrawState := ttTabItemSelected
        else if (Index = FHotTabIndex) and MouseInControl then
          DrawState := ttTabItemHot
        else
          DrawState := ttTabItemNormal;
      end;
    tpLeft:
      begin
        if Index = TabIndex then
          DrawState := ttTabItemLeftEdgeSelected
        else if (Index = FHotTabIndex) and MouseInControl then
          DrawState := ttTabItemLeftEdgeHot
        else
          DrawState := ttTabItemLeftEdgeNormal;
      end;
    tpBottom:
      begin
        if Index = TabIndex then
          DrawState := ttTabItemBothEdgeSelected
        else if (Index = FHotTabIndex) and MouseInControl then
          DrawState := ttTabItemBothEdgeHot
        else
          DrawState := ttTabItemBothEdgeNormal;
      end;
    tpRight:
      begin
        if Index = TabIndex then
          DrawState := ttTabItemRightEdgeSelected
        else if (Index = FHotTabIndex) and MouseInControl then
          DrawState := ttTabItemRightEdgeHot
        else
          DrawState := ttTabItemRightEdgeNormal;
      end;
  end;

  if StyleServices.Available then
  begin
    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;

  { Image }

  if (Images <> nil) and (FImageIndex >= 0) and (FImageIndex < Images.Count) then
  begin
    GlyphR := LayoutR;
    case TabPosition of
      tpTop, tpBottom:
        begin
          GlyphR.Left := GlyphR.Left + ImageStep;
          GlyphR.Right := GlyphR.Left + ImageWidth;
          LayoutR.Left := GlyphR.Right;
          GlyphR.Top := GlyphR.Top + (GlyphR.Bottom - GlyphR.Top) div 2 - ImageHeight div 2;
          if (TabPosition = tpTop) and (Index = TabIndex) then
            OffsetRect(GlyphR, 0, -1)
          else if (TabPosition = tpBottom) and (Index = TabIndex) then
            OffsetRect(GlyphR, 0, 1);
        end;
      tpLeft:
        begin
          GlyphR.Bottom := GlyphR.Bottom - ImageStep;
          GlyphR.Top := GlyphR.Bottom - ImageHeight;
          LayoutR.Bottom := GlyphR.Top;
          GlyphR.Left := GlyphR.Left + (GlyphR.Right - GlyphR.Left) div 2 - ImageWidth div 2;
        end;
      tpRight:
        begin
          GlyphR.Top := GlyphR.Top + ImageStep;
          GlyphR.Bottom := GlyphR.Top + ImageHeight;
          LayoutR.Top := GlyphR.Bottom;
          GlyphR.Left := GlyphR.Left + (GlyphR.Right - GlyphR.Left) div 2 - ImageWidth div 2;
        end;
    end;
    if StyleServices.Available then
      StyleServices.DrawIcon(Canvas.Handle, Details, GlyphR, Images.Handle, FImageIndex);
  end;

  { Text }
  if StyleServices.Available then
  begin
    if (TabPosition = tpTop) and (Index = TabIndex) then
      OffsetRect(LayoutR, 0, -1)
    else if (TabPosition = tpBottom) and (Index = TabIndex) then
      OffsetRect(LayoutR, 0, 1);

    if TabPosition = tpLeft then
    begin
      TX := LayoutR.Left + (LayoutR.Right - LayoutR.Left) div 2 -
        Canvas.TextHeight(Tabs[Index]) div 2;
      TY := LayoutR.Top + (LayoutR.Bottom - LayoutR.Top) div 2 +
        Canvas.TextWidth(Tabs[Index]) div 2;
     if StyleServices.GetElementColor(Details, ecTextColor, ThemeTextColor) then
       Canvas.Font.Color := ThemeTextColor;
      AngleTextOut(Canvas, 900, TX, TY, Tabs[Index]);
    end
    else if TabPosition = tpRight then
    begin
      TX := LayoutR.Left + (LayoutR.Right - LayoutR.Left) div 2 +
        Canvas.TextHeight(Tabs[Index]) div 2;
      TY := LayoutR.Top + (LayoutR.Bottom - LayoutR.Top) div 2 -
        Canvas.TextWidth(Tabs[Index]) div 2;
      if StyleServices.GetElementColor(Details, ecTextColor, ThemeTextColor)
      then
        Canvas.Font.Color := ThemeTextColor;
      AngleTextOut(Canvas, -900, TX, TY, Tabs[Index]);
    end
    else
      DrawControlText(Canvas, Details, Tabs[Index], LayoutR, DT_VCENTER or DT_CENTER or DT_SINGLELINE  or DT_NOCLIP);
  end;
end;

procedure TTabControlStyleHook.WMEraseBkgnd(var Message: TMessage);
var
  Details: TThemedElementDetails;
begin
  if (Message.LParam = 1) and StyleServices.Available then
  begin
    Details := StyleServices.GetElementDetails(ttPane);
    StyleServices.DrawElement(HDC(Message.WParam), Details, Control.ClientRect);
  end;
  Message.Result := 1;
  Handled := True;
end;

procedure TTabControlStyleHook.PaintBackground(Canvas: TCanvas);
var
  Details: TThemedElementDetails;
begin
  if StyleServices.Available then
  begin
    Details := StyleServices.GetElementDetails(ttPane);
    StyleServices.DrawParentBackground(Handle, Canvas.Handle, Details, False);
  end;
end;

function TTabControlStyleHook.GetScrollOpposite: Boolean;
begin
  Result := False;
  if Control is TCustomTabControl then
    Result := TCustomTabControl(Control).ScrollOpposite;
end;

procedure TTabControlStyleHook.Paint(Canvas: TCanvas);
var
  R: TRect;
  I, SaveIndex: Integer;
  Details: TThemedElementDetails;
begin
  SaveIndex := SaveDC(Canvas.Handle);
  try
    R := DisplayRect;
    ExcludeClipRect(Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom);
    PaintBackground(Canvas);
  finally
    RestoreDC(Canvas.Handle, SaveIndex);
  end;

  { Draw tabs }
  for I := 0 to TabCount - 1 do
  begin
    if I = TabIndex then
      Continue;
    DrawTab(Canvas, I);
  end;

  { Draw body }
  if not ScrollOpposite then
  begin
    case TabPosition of
      tpTop: InflateRect(R, Control.Width - R.Right, Control.Height - R.Bottom);
      tpLeft: InflateRect(R, Control.Width - R.Right, Control.Height - R.Bottom);
      tpBottom: InflateRect(R, R.Left, R.Top);
      tpRight: InflateRect(R, R.Left, R.Top);
    end;
  end
  else
    InflateRect(R, 4, 4);

  if StyleServices.Available then
  begin
    Details := StyleServices.GetElementDetails(ttPane);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;

  { Draw active tab }
  if TabIndex >= 0 then
    DrawTab(Canvas, TabIndex);

end;

procedure TTabControlStyleHook.UpdateTabs(OldHotTab, HotTab: Integer);
var
  R: TRect;
begin
  if (OldHotTab >= 0) and (OldHotTab < TabCount) then
  begin
    R := TabRect[OldHotTab];
    InvalidateRect(Handle, @R, True);
  end;
  if (HotTab >= 0) and (HotTab < TabCount) then
  begin
    R := TabRect[HotTab];
    InvalidateRect(Handle, @R, True);
  end;
end;

procedure TTabControlStyleHook.CMMouseLeave(var Message: TMessage);
begin
  WMMouseMove(Message);
end;

procedure TTabControlStyleHook.WMMouseMove(var Message: TMessage);
var
  Index, OldIndex: Integer;
begin
  inherited;
  CallDefaultProc(Message);
  FMousePosition := mpNone;
  Index := IndexOfTabAt(TWMMouseMove(Message).XPos, TWMMouseMove(Message).YPos);
  if Index <> FHotTabIndex then
  begin
    OldIndex := FHotTabIndex;
    FHotTabIndex := Index;
    UpdateTabs(OldIndex, Index);
  end;
end;

function TTabControlStyleHook.GetImages: TCustomImageList;
begin
  Result := nil;
  if Control is TCustomTabControl then
    Result := TCustomTabControl(Control).Images;
end;

function TTabControlStyleHook.GetTabCount: Integer;
begin
  Result := SendMessage(Handle, TCM_GETITEMCOUNT, 0, 0);
end;

function TTabControlStyleHook.GetTabs(Index: Integer): string;
var
  TCItem: TTCItem;
  Buffer: array[0..254] of Char;
begin
  FillChar(TCItem, Sizeof(TCItem), 0);

  TCItem.mask := TCIF_TEXT;
  TCItem.pszText := @Buffer;
  TCItem.cchTextMax := SizeOf(Buffer);
  if SendMessageW(Handle, TCM_GETITEMW, Index, IntPtr(@TCItem)) <> 0 then
    Result := TCItem.pszText
  else
    Result := '';
end;

function TTabControlStyleHook.GetTabRect(Index: Integer): TRect;
begin
  Result := TRect.Empty;
  if (Control is TCustomTabControl) then
    Result := TCustomTabControl(Control).TabRect(Index)
  else if Handle <> 0 then
    TabCtrl_GetItemRect(Handle, Index, Result);
end;

function TTabControlStyleHook.GetTabPosition: TTabPosition;
begin
  Result := tpTop;
  if Control is TCustomTabControl then
    Result := TCustomTabControl(Control).TabPosition;
end;

function TTabControlStyleHook.GetTabIndex: Integer;
begin
  if Control is TCustomTabControl then
    Result := TCustomTabControl(Control).TabIndex
  else
    Result := SendMessage(Handle, TCM_GETCURSEL, 0, 0);
end;

function TTabControlStyleHook.GetDisplayRect: TRect;
begin
  Result := Rect(0, 0, 0, 0);
  if (Control <> nil) and (Control is TCustomTabControl) then
    Result := TCustomTabControl(Control).DisplayRect
  else
  begin
    Result := Control.ClientRect;
    SendMessage(Handle, TCM_ADJUSTRECT, 0, IntPtr(@Result));
    Inc(Result.Top, 2);
  end;
end;

function TTabControlStyleHook.IndexOfTabAt(X, Y: Integer): Integer;
var
  HitTest: TTCHitTestInfo;
begin
  if (Control <> nil) and (Control is TCustomTabControl) then
    Result := TCustomTabControl(Control).IndexOfTabAt(X, Y)
  else
  begin
    Result := -1;
    if Control.ClientRect.Contains(Point(X, Y)) then
      with HitTest do
      begin
        pt.X := X;
        pt.Y := Y;
        Result := TabCtrl_HitTest(Handle, @HitTest);
      end;
  end;
end;

{ TDateTimePickerStyleHook }

constructor TDateTimePickerStyleHook.Create;
begin
  inherited;
  OverrideEraseBkgnd := True;
  FDroppedDown := False;
  FMouseOnButton := False;
  FUpDownInstance := nil;
  FUpDownHandle := 0;
  FUpDownDefWndProc := nil;
  FUpDownUpPressed := False;
  FUpDownDownPressed := False;
  FUpDownMouseOnUp := False;
  FUpDownMouseOnDown := False;
  FInitBorderInfo := False;
end;

destructor TDateTimePickerStyleHook.Destroy;
begin
  if FUpDownHandle <> 0 then
    SetWindowLong(FUpDownHandle, GWL_WNDPROC, IntPtr(FUpDownDefWndProc));
  FreeObjectInstance(FUpDownInstance);
  inherited;
end;

function TDateTimePickerStyleHook.AcceptMessage(var Message: TMessage): Boolean;
begin
  Result := (seClient in Control.StyleElements) or
            (seBorder in Control.StyleElements);
end;

procedure TDateTimePickerStyleHook.PaintBackground(Canvas: TCanvas);
begin
  Canvas.Brush.Color := StyleServices.GetStyleColor(scEdit);
  Canvas.FillRect(Control.ClientRect);
end;

function TDateTimePickerStyleHook.GetChecked: Boolean;
var
  pdtpi: TDateTimePickerInfo;
begin
  if TOSVersion.Check(6) and TStyleManager.SystemStyle.Enabled then
  begin
    pdtpi.cbSize := SizeOf(TDateTimePickerInfo);
    DateTime_GetDateTimePickerInfo(Handle, pdtpi);
    Result := pdtpi.stateCheck > 0;
  end
  else
    Result := TDateTimePicker(Control).Checked;
end;

function TDateTimePickerStyleHook.GetShowCheckBox: Boolean;
begin
  Result := GetWindowLong(Handle, GWL_STYLE) and DTS_SHOWNONE = DTS_SHOWNONE;
end;

function TDateTimePickerStyleHook.GetButtonRect: TRect;
var
  pdtpi: TDateTimePickerInfo;
begin
  Result := Rect(2, 2, Control.Width - 2, Control.Height - 2);
  if TOSVersion.Check(6) and TStyleManager.SystemStyle.Enabled then
  begin
    pdtpi.cbSize := SizeOf(TDateTimePickerInfo);
    DateTime_GetDateTimePickerInfo(Handle, pdtpi);
    Result.Left := Result.Right - pdtpi.rcButton.Width + 1;
  end
  else
  begin
    if OverridePaintNC then
    begin
      Result := Rect(0, 0, Control.ClientWidth, Control.ClientHeight);
      Result.Left := Result.Right - GetSystemMetrics(SM_CXVSCROLL);
    end
    else
      Result.Left := Result.Right - GetSystemMetrics(SM_CXVSCROLL) - 1;
  end;
end;

procedure TDateTimePickerStyleHook.WMSetFocus(var Message: TMessage);
begin
  inherited;
  CallDefaultProc(Message);
  RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_UPDATENOW);
  Handled := True;
end;

procedure TDateTimePickerStyleHook.WndProc(var Message: TMessage);
var
  R1, R2: TRect;
begin
  // Reserved for potential updates
  inherited;
  case Message.Msg of
    WM_TIMER:
      if not TStyleManager.SystemStyle.Enabled then
      begin
        KillTimer(Handle, 1);
        SetRedraw(True);
        RedrawWindow(Handle, nil, 0,
          RDW_ERASE or RDW_INVALIDATE or RDW_UPDATENOW);
      end;
    WM_SIZE:
      if not FInitBorderInfo then
      begin
        if TStyleManager.SystemStyle.Enabled then
          OverridePaintNC := False
        else
          begin
            WinApi.Windows.GetWindowRect(Handle, R1);
            WinApi.Windows.GetClientRect(Handle, R2);
            OverridePaintNC := R1.Width <> R2.Width;
          end;
        FInitBorderInfo := True;
      end;
  end;
end;

procedure TDateTimePickerStyleHook.WMKillFocus(var Message: TMessage);
begin
  inherited;
  CallDefaultProc(Message);
  RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_UPDATENOW);
  Handled := True;
end;

procedure TDateTimePickerStyleHook.MouseEnter;
begin
  Invalidate;
end;

procedure TDateTimePickerStyleHook.MouseLeave;
begin
  inherited;
  if not FDroppedDown then
  begin
    FMouseOnButton := False;
    Invalidate;
  end;
end;

procedure TDateTimePickerStyleHook.CNNotify(var Message: TWMNotify);
var
  MCHandle, MCParentHandle: HWND;
  MCTextColor, MCBGColor, MCTrailingTextColor: TColor;
  MCWidth, MCHeight: Integer;
  MCRect: TRect;
  Buffer: TBitmap;
  I: Integer;
begin
  CallDefaultProc(TMessage(Message));

  with Message, NMHdr^ do
  begin
    Result := 0;
    case code of
      DTN_DATETIMECHANGE:
       begin
         RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_UPDATENOW);
       end;
      DTN_DROPDOWN:
        begin
          MCHandle := DateTime_GetMonthCal(Handle);
          if (MCHandle <> 0) and (seClient in Control.StyleElements) and
            (Winapi.uxTheme.GetWindowTheme(Handle) = 0) and
            (Winapi.uxTheme.GetWindowTheme(MCHandle) <> 0) then
          begin
            Winapi.uxTheme.SetWindowTheme(MCHandle, '', '');
            MCParentHandle := Winapi.Windows.GetParent(MCHandle);
            if MCParentHandle <> 0 then
            begin
              MCHeight := (Control.Height - 4) * 10;
              MCWidth := 1;
              for I := 1 to 7 do
                MCWidth := _Max(MCWidth, Length(FormatSettings.ShortDayNames[I]));
              if MCWidth = 1 then
                MCWidth := 3;
              Buffer := TBitmap.Create;
              try
                Buffer.Canvas.Font := TControlClass(Control).Font;
                MCWidth := (Buffer.Canvas.TextWidth('W') +
                 (MCWidth - 1) * Buffer.Canvas.TextWidth('w')) * 7 + 20;
              finally
                Buffer.Free;
              end;
              if MCWidth < MCHeight then
                MCWidth := MCHeight;
              Winapi.Windows.GetWindowRect(MCParentHandle, MCRect);
              Winapi.Windows.MoveWindow(MCParentHandle,
                MCRect.Left, MCRect.Top, MCWidth, MCHeight, False);
            end;
          end;
          if seClient in Control.StyleElements then
          begin
            MCBGColor := StyleServices.GetSystemColor(clWindow);
            MCTextColor := StyleServices.GetSystemColor(clWindowText);
            DateTime_SetMonthCalColor(Handle, MCSC_BACKGROUND, MCBGColor);
            DateTime_SetMonthCalColor(Handle, MCSC_MONTHBK, MCBGColor);
            DateTime_SetMonthCalColor(Handle, MCSC_TEXT, MCTextColor);

            if not StyleServices.GetElementColor(StyleServices.GetElementDetails(teEditTextDisabled),
              ecTextColor, MCTrailingTextColor) then
                MCTrailingTextColor := MCTextColor;
            DateTime_SetMonthCalColor(Handle, MCSC_TRAILINGTEXT, MCTrailingTextColor);

            DateTime_SetMonthCalColor(Handle, MCSC_TITLEBK,
              StyleServices.GetSystemColor(clHighLight));
            DateTime_SetMonthCalColor(Handle, MCSC_TITLETEXT,
              StyleServices.GetSystemColor(clHighLightText));
          end;
          FDroppedDown := True;
          RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_UPDATENOW);
          if not TStyleManager.SystemStyle.Enabled then
          begin
            SetRedraw(False);
            SetTimer(Handle, 1, 300, nil);
          end;
        end;
      DTN_CLOSEUP:
        begin
          FDroppedDown := False;
          FMouseOnButton := False;
          RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_UPDATENOW);
        end;
    end;
  end;
  Handled := True;
end;

procedure TDateTimePickerStyleHook.WMPaint(var Message: TMessage);
var
  DC: HDC;
  Canvas: TCanvas;
  PS: TPaintStruct;
  R: TRect;
  LDetails: TThemedElementDetails;
  LText: String;
begin
  // disable system theme if need
  if Winapi.uxTheme.GetWindowTheme(Handle) <> 0 then
    Winapi.uxTheme.SetWindowTheme(Handle, '', '');
  // draw control
  DC := Message.WParam;
  Canvas := TCanvas.Create;
  try
    if DC <> 0 then
      Canvas.Handle := DC
    else
      Canvas.Handle := BeginPaint(Control.Handle, PS);

    if not OverridePaintNC then PaintNC(Canvas);
    Paint(Canvas);

    if not OverridePaintNC then
    begin
      if DateMode = dmUpDown then
        R := Rect(2, 2, Control.Width - 2, Control.Height - 2)
      else
        R := Rect(2, 2, GetButtonRect.Left, Control.Height - 2);
    end
    else
    begin
      if DateMode = dmUpDown then
        R := Rect(0, 0, Control.ClientWidth, Control.ClientHeight)
      else
        R := Rect(0, 0, GetButtonRect.Left, Control.ClientHeight);
    end;
    if ShowCheckBox then R.Left := R.Height + 2;
    IntersectClipRect(Canvas.Handle, R.Left, R.Top, R.Right - 1, R.Bottom);
    Message.wParam := WPARAM(Canvas.Handle);
    if (seClient in Control.StyleElements) and
       (not Control.Focused or (ShowCheckBox and not GetChecked)) then
    begin
      LText := Text;
      if LText = '' then
        case TDateTimePicker(Control).Kind of
          dtkDate:
            case TDateTimePicker(Control).DateFormat of
              dfShort: LText := DateToStr(TDateTimePicker(Control).DateTime);
              dfLong: LText := FormatDateTime('dd mmmm yyyy', TDateTimePicker(Control).DateTime);
           end;
          dtkTime: LText := TimeToStr(TDateTimePicker(Control).DateTime);
        end;
      if ShowCheckBox and not GetChecked
      then
        LDetails := StyleServices.GetElementDetails(teEditTextDisabled)
      else
        LDetails := StyleServices.GetElementDetails(teEditTextNormal);

      if ShowCheckBox then InflateRect(R, -1, -1);

      if seFont in Control.StyleElements then
        DrawControlText(Canvas, LDetails, LText, R, DT_VCENTER or DT_LEFT)
      else
        begin
          Canvas.Brush.Style := bsClear;
          Canvas.Font.Assign(TDateTimePicker(Control).Font);
          DrawText(Canvas.Handle, LText, Length(LText), R, DT_VCENTER or DT_LEFT);
        end;
    end
    else
    begin
      NeedsDefaultPaint := True;
      try
        CallDefaultProc(Message);
      finally
        NeedsDefaultPaint := False;
      end;
    end;
    Message.WParam := DC;
    if DC = 0 then
      EndPaint(Control.Handle, PS);
  finally
    Canvas.Handle := 0;
    Canvas.Free;
  end;
  Handled := True;
end;

procedure TDateTimePickerStyleHook.PaintNC(Canvas: TCanvas);
var
  Details: TThemedElementDetails;
  R: TRect;
  SaveIndex: Integer;
begin
  if StyleServices.Available then
  begin
    if Control.Focused then
      Details := StyleServices.GetElementDetails(teEditBorderNoScrollFocused)
    else
    if MouseInControl then
      Details := StyleServices.GetElementDetails(teEditBorderNoScrollHot)
    else
    if Control.Enabled then
      Details := StyleServices.GetElementDetails(teEditBorderNoScrollNormal)
    else
      Details := StyleServices.GetElementDetails(teEditBorderNoScrollDisabled);
    R := Rect(0, 0, Control.Width, Control.Height);
    InflateRect(R, -2, -2);
    SaveIndex := SaveDC(Canvas.Handle);
    try
      ExcludeClipRect(Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom);
      StyleServices.DrawElement(Canvas.Handle, Details,
        Rect(0, 0, Control.Width, Control.Height));
    finally
      RestoreDC(Canvas.Handle, SaveIndex);
    end;
  end;
end;

procedure TDateTimePickerStyleHook.Paint(Canvas: TCanvas);
var
  R: TRect;
  BtnDrawState: TThemedComboBox;
  Details: TThemedElementDetails;
begin
  if ShowCheckBox then
  begin
    if not OverridePaintNC then
      R := Rect(2, 2, Control.Height - 2, Control.Height - 2)
    else
      R := Rect(0, 0, Control.ClientHeight, Control.ClientHeight);
    with Canvas do
    begin
      if (seClient in Control.StyleElements) and
         (not Control.Focused or (ShowCheckBox and not GetChecked))
      then
        Brush.Color := StyleServices.GetStyleColor(scEdit)
      else
        Brush.Color := clWindow;

      FillRect(R);
      if Checked then
        Details := StyleServices.GetElementDetails(tbCheckBoxCheckedNormal)
      else
        Details := StyleServices.GetElementDetails(tbCheckBoxUnCheckedNormal);
      StyleServices.DrawElement(Canvas.Handle, Details, R);
    end;
  end;
  if (DateMode = dmUpDown) or (Kind = dtkTime) then Exit;
  R := ButtonRect;
  if not Control.Enabled then
    BtnDrawState := tcDropDownButtonDisabled
  else if FDroppedDown then
    BtnDrawState := tcDropDownButtonPressed
  else if FMouseOnButton then
    BtnDrawState := tcDropDownButtonHot
  else
    BtnDrawState := tcDropDownButtonNormal;
  if StyleServices.Available and (R.Width > 0) then
    begin
      Details := StyleServices.GetElementDetails(BtnDrawState);
      StyleServices.DrawElement(Canvas.Handle, Details, R);
    end;
end;

procedure TDateTimePickerStyleHook.WMMouseMove(var Message: TWMMouse);
var
  P: TPoint;
  R: TRect;
  FOldMouseOnButton: Boolean;
begin
  CallDefaultProc(TMessage(Message));
  inherited;
  P := Point(Message.XPos, Message.YPos);
  FOldMouseOnButton := FMouseOnButton;
  if ButtonRect.Contains(P) then
    FMouseOnButton := True
  else
    FMouseOnButton := False;

  if FOldMouseOnButton <> FMouseOnButton then
  begin
    R := ButtonRect;
    InvalidateRect(Handle, @R, False);
  end;

  Handled := True;
end;

function TDateTimePickerStyleHook.GetKind: TDateTimeKind;
begin
  if GetWindowLong(Handle, GWL_STYLE) and DTS_TIMEFORMAT = DTS_TIMEFORMAT then
    Result := dtkTime
  else
    Result := dtkDate;
end;

function TDateTimePickerStyleHook.GetDateMode: TDTDateMode;
begin
  if GetWindowLong(Handle, GWL_STYLE) and DTS_UPDOWN = DTS_UPDOWN then
   Result := dmUpDown
 else
   Result := dmComboBox;
end;

procedure TDateTimePickerStyleHook.WMParentNotify(var Message: TWMParentNotify);
begin
  Handled := False;
  if DateMode = dmUpDown then
    with Message do
    if (Event = WM_CREATE) and (FUpDownHandle = 0) then
    begin
      FUpDownHandle := Message.ChildWnd;
      FUpDownInstance := MakeObjectInstance(UpDownWndProc);
      FUpDownDefWndProc := Pointer(GetWindowLong(FUpDownHandle, GWL_WNDPROC));
      SetWindowLong(FUpDownHandle, GWL_WNDPROC, IntPtr(FUpDownInstance));
    end;
end;

procedure TDateTimePickerStyleHook.PaintUpDown(Canvas: TCanvas);
var
  Buffer: TBitmap;
  R, BoundsRect: TRect;
  DrawState: TThemedScrollBar;
  Details: TThemedElementDetails;
begin
  GetWindowRect(FUpDownHandle, BoundsRect);
  if (BoundsRect.Width = 0) or (BoundsRect.Height = 0) or not StyleServices.Available then
    Exit;
  {create buffer}
  Buffer := TBitMap.Create;
  try
    Buffer.Width := BoundsRect.Width;
    Buffer.Height := BoundsRect.Height;
    R := TRect.Create(0, 0, Buffer.Width, Buffer.Height);
                                          
    Buffer.Canvas.Brush.Color := StyleServices.ColorToRGB(clBtnFace);
    Buffer.Canvas.FillRect(R);
    {left button}
    R.Bottom := R.Top + R.Height div 2;
    if FUpDownUpPressed then
       DrawState := tsArrowBtnUpPressed
    else if FUpDownMouseOnUp {and MouseInControl} then
      DrawState := tsArrowBtnUpHot
    else
      DrawState := tsArrowBtnUpNormal;
    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Buffer.Canvas.Handle, Details, R);
    {right button}
    R := TRect.Create(0, 0, Buffer.Width, Buffer.Height);
    R.Top := R.Bottom - R.Height div 2;
    if FUpDownDownPressed then
      DrawState := tsArrowBtnDownPressed
    else if FUpDownMouseOnDown {and MouseInControl} then
      DrawState :=  tsArrowBtnDownHot
    else
      DrawState :=  tsArrowBtnDownNormal;
    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Buffer.Canvas.Handle, Details, R);
    {draw buffer}
    Canvas.Draw(0, 0, Buffer);
  finally
    Buffer.Free;
  end;
end;

procedure TDateTimePickerStyleHook.UpDownWndProc(var Msg: TMessage);
var
  FCallOldProc: Boolean;

  procedure WMLButtonDblClk(var Msg: TWMMouse);
  var
    R, R1: TRect;
  begin
    SendMessage(FUpDownHandle, WM_SETREDRAW, 0, 0);
    Msg.Result := CallWindowProc(FUpDownDefWndProc, FUpDownHandle,
      Msg.Msg, TMessage(Msg).WParam, TMessage(Msg).LParam);
    SendMessage(FUpDownHandle, WM_SETREDRAW, 1, 0);
    GetWindowRect(FUpDownHandle, R);
    R1 := Rect(0, 0, R.Width, R.Height);
    R1.Bottom := R1.Top +  R1.Height div 2;
    if R1.Contains(Point(Msg.XPos, Msg.YPos)) then
      FUpDownUpPressed := True
    else
      FUpDownUpPressed := False;
    R1 := Rect(0, 0, R.Width, R.Height);
    R1.Top := R1.Bottom - R1.Height div 2;
    if R1.Contains(Point(Msg.XPos, Msg.YPos)) then
      FUpDownDownPressed := True
    else
      FUpDownDownPressed := False;
    RedrawWindow(FUpDownHandle, nil, 0, RDW_INVALIDATE);
    FCallOldProc := False;
  end;

  procedure WMLButtonDown(var Msg: TWMMouse);
  begin
    WMLButtonDblClk(Msg);
  end;

  procedure WMLButtonUp(var Msg: TWMMouse);
  begin
    SendMessage(FUpDownHandle, WM_SETREDRAW, 0, 0);
    Msg.Result := CallWindowProc(FUpDownDefWndProc, FUpDownHandle,
      Msg.Msg, TMessage(Msg).WParam, TMessage(Msg).LParam);
    SendMessage(FUpDownHandle, WM_SETREDRAW, 1, 0);
    FUpDownUpPressed := False;
    FUpDownDownPressed := False;
    RedrawWindow(FUpDownHandle, nil, 0, RDW_INVALIDATE);
    FCallOldProc := False;
  end;

  procedure WMMouseMove(var Msg: TWMMouse);
  var
    R, R1: TRect;
    FOldUpDownMouseOnUp, FOldUpDownMouseOnDown: Boolean;
  begin
    Msg.Result := CallWindowProc(FUpDownDefWndProc, FUpDownHandle,
      Msg.Msg, TMessage(Msg).WParam, TMessage(Msg).LParam);

    FOldUpDownMouseOnUp := FUpDownMouseOnUp;
    FOldUpDownMouseOnDown := FUpDownMouseOnDown;

    GetWindowRect(FUpDownHandle, R);

    R1 := Rect(0, 0, R.Width, R.Height);
    R1.Bottom := R1.Top +  R1.Height div 2;
    if R1.Contains(Point(Msg.XPos, Msg.YPos)) then
      FUpDownMouseOnUp := True
    else
      FUpDownMouseOnUp := False;
    R1 := Rect(0, 0, R.Width, R.Height);
    R1.Top := R1.Bottom - R1.Height div 2;
    if R1.Contains(Point(Msg.XPos, Msg.YPos)) then
      FUpDownMouseOnDown := True
    else
      FUpDownMouseOnDown := False;

    if (FOldUpDownMouseOnUp <> FUpDownMouseOnUp) or
       (FOldUpDownMouseOnDown <> FUpDownMouseOnDown) then
      RedrawWindow(FUpDownHandle, nil, 0, RDW_INVALIDATE);

    FCallOldProc := False;
  end;

  procedure WMMouseLeave(Msg: TMessage);
  begin
    FUpDownMouseOnUp := False;
    FUpDownMouseOnDown := False;
    FUpDownUpPressed := False;
    FUpDownDownPressed := False;
    RedrawWindow(FUpDownHandle, nil, 0, RDW_INVALIDATE);
  end;

  procedure WMPaint(Msg: TMessage);
  var
    DC: HDC;
    Canvas: TCanvas;
    PS: TPaintStruct;
  begin
    DC := Msg.WParam;
    Canvas := TCanvas.Create;
    if DC <> 0 then
      Canvas.Handle := DC
    else
      Canvas.Handle := BeginPaint(FUpDownHandle, PS);
    try
      PaintUpDown(Canvas);
    finally
      if DC = 0 then
        EndPaint(FUpDownHandle, PS);
      Canvas.Handle := 0;
      Canvas.Free;
    end;
    FCallOldProc := False;
  end;

begin
  FCallOldProc := True;
  case Msg.Msg of
    WM_MOUSELEAVE: WMMouseLeave(Msg);
    WM_LBUTTONDBLCLK: WMLButtonDblClk(TWMMouse(Msg));
    WM_LBUTTONDOWN: WMLButtonDown(TWMMouse(Msg));
    WM_LBUTTONUP: WMLButtonUp(TWMMouse(Msg));
    WM_MOUSEMOVE:  WMMouseMove(TWMMouse(Msg));
    WM_PAINT: WMPaint(Msg);
  end;
  if FCallOldProc then
    Msg.Result := CallWindowProc(FUpDownDefWndProc, FUpDownHandle,
      Msg.Msg, Msg.WParam, Msg.LParam);
end;


{ TTreeViewStyleHook }

type
  TWinControlClass = class(TWinControl);

constructor TTreeViewStyleHook.Create(AControl: TWinControl);
var
  LColor: TColor;
begin
  inherited;
  OverrideEraseBkgnd := True;
  with StyleServices do
  begin
    if not GetElementColor(GetElementDetails(ttItemNormal), ecTextColor, LColor) or
       (LColor = clNone) then
      LColor := GetSystemColor(clWindowText);
  end;
  if seFont in Control.StyleElements then
    FontColor := LColor
  else
    FontColor := TWinControlClass(Control).Font.Color;
  Brush.Color := StyleServices.GetStyleColor(scTreeView);
end;

procedure TTreeViewStyleHook.TVMSetBkColor(var Message: TMessage);
begin
  Message.LParam := LPARAM(ColorToRGB(Brush.Color));
  Handled := False;
end;

procedure TTreeViewStyleHook.TVMSetTextColor(var Message: TMessage);
begin
  Message.LParam := LPARAM(ColorToRGB(FontColor));
  Handled := False;
end;

procedure TTreeViewStyleHook.WMMouseMove(var Msg: TWMMouse);
var
  SF: TScrollInfo;
begin
  if VertSliderState = tsThumbBtnVertPressed then
  begin
    SF.fMask := SIF_ALL;
    SF.cbSize := SizeOf(SF);
    GetScrollInfo(Handle, SB_VERT, SF);
    ScrollPos := ScrollPos + (SF.nMax - SF.nMin) * ((Mouse.CursorPos.Y - PrevScrollPos) / VertTrackRect.Height);
    if ScrollPos < SF.nMin then
      ScrollPos := SF.nMin;
    if ScrollPos > SF.nMax then
      ScrollPos := SF.nMax;

    PrevScrollPos := Mouse.CursorPos.Y;
    if Control is TCustomTreeView then
    begin
      PostMessage(Handle, WM_VSCROLL, Integer(SmallPoint(SB_THUMBTRACK, Round(ScrollPos))), 0);
      SF.nPos := Round(ScrollPos);
      SF.nTrackPos := Round(ScrollPos);
      SetScrollInfo(Handle, SB_VERT, SF, True);
    end
    else
      PostMessage(Handle, WM_VSCROLL, Integer(SmallPoint(SB_THUMBPOSITION, Round(ScrollPos))), 0);
    PaintScroll;
    Handled := True;
    Exit;
  end;

  if HorzSliderState = tsThumbBtnHorzPressed then
  begin
    SF.fMask := SIF_ALL;
    SF.cbSize := SizeOf(SF);
    GetScrollInfo(Handle, SB_HORZ, SF);
    ScrollPos := ScrollPos + (SF.nMax - SF.nMin) * ((Mouse.CursorPos.X - PrevScrollPos) / HorzTrackRect.Width);
    if ScrollPos < SF.nMin then
      ScrollPos := SF.nMin;
    if ScrollPos > SF.nMax then
      ScrollPos := SF.nMax;

    PrevScrollPos := Mouse.CursorPos.X;

    if Control is TCustomTreeView then
    begin
      PostMessage(Handle, WM_HSCROLL, Integer(SmallPoint(SB_THUMBTRACK, Round(ScrollPos))), 0);
      SF.nPos := Round(ScrollPos);
      SF.nTrackPos := Round(ScrollPos);
      SetScrollInfo(Handle, SB_HORZ, SF, True);
    end
    else
      PostMessage(Handle, WM_HSCROLL, Integer(SmallPoint(SB_THUMBPOSITION, Round(ScrollPos))), 0);
    PaintScroll;
    Handled := True;
    Exit;
  end;

  if (HorzSliderState <> tsThumbBtnHorzPressed) and (HorzSliderState = tsThumbBtnHorzHot) then
  begin
    HorzSliderState := tsThumbBtnHorzNormal;
    PaintScroll;
  end;

  if (VertSliderState <> tsThumbBtnVertPressed) and (VertSliderState = tsThumbBtnVertHot) then
  begin
    VertSliderState := tsThumbBtnVertNormal;
    PaintScroll;
  end;

  if (HorzUpState <> tsArrowBtnLeftPressed) and (HorzUpState = tsArrowBtnLeftHot) then
  begin
    HorzUpState := tsArrowBtnLeftNormal;
    PaintScroll;
  end;

  if (HorzDownState <> tsArrowBtnRightPressed) and (HorzDownState =tsArrowBtnRightHot) then
  begin
    HorzDownState := tsArrowBtnRightNormal;
    PaintScroll;
  end;

  if (VertUpState <> tsArrowBtnUpPressed) and (VertUpState = tsArrowBtnUpHot) then
  begin
    VertUpState := tsArrowBtnUpNormal;
    PaintScroll;
  end;

  if (VertDownState <> tsArrowBtnDownPressed) and (VertDownState = tsArrowBtnDownHot) then
  begin
    VertDownState := tsArrowBtnDownNormal;
    PaintScroll;
  end;

  CallDefaultProc(TMessage(Msg));
  if LeftButtonDown then
    PaintScroll;
  Handled := True;
end;


procedure TTreeViewStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

{ TListViewStyleHook }

constructor TListViewStyleHook.Create;
var
  LColor: TColor;
begin
  inherited;
  OverrideEraseBkgnd := True;
  FHeaderInstance := MakeObjectInstance(HeaderWndProc);
  FHotSection := -1;
  FOldHotSection := -1;
  FPressedSection := -1;
  FHeaderHandle := 0;
  with StyleServices do
  begin
    if not GetElementColor(GetElementDetails(ttItemNormal), ecTextColor, LColor) or
       (LColor = clNone) then
      LColor := GetSystemColor(clWindowText);
  end;
  if seFont in Control.StyleElements then
    FontColor := LColor
  else
    FontColor := TWinControlClass(Control).Font.Color;
  if seClient in Control.StyleElements then
    Brush.Color := StyleServices.GetStyleColor(scListView)
  else
    Brush.Color := TWinControlClass(Control).Color;
end;

destructor TListViewStyleHook.Destroy;
begin
  if FHeaderHandle <> 0 then
    SetWindowLong(FHeaderHandle, GWL_WNDPROC, IntPtr(FDefHeaderProc));
  FreeObjectInstance(FHeaderInstance);
  inherited;
end;

procedure TListViewStyleHook.WMNotify(var Message: TWMNotify);
var
  H: HWnd;
begin
  H := GetWindow(Handle, GW_CHILD);
  if (H <> 0) and (FHeaderHandle = 0) then
  begin
    FHeaderHandle := H;
    FDefHeaderProc := Pointer(GetWindowLong(FHeaderHandle, GWL_WNDPROC));
    SetWindowLong(FHeaderHandle, GWL_WNDPROC, IntPtr(FHeaderInstance));
  end;
end;

procedure TListViewStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

procedure TListViewStyleHook.HeaderWndProc(var Message: TMessage);
var
  Info: THDHitTestInfo;
begin
  with Message do
  begin
    case Msg of
      WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
        begin
          Info.Point.X := TWMMouse(Message).XPos;
          Info.Point.Y := TWMMouse(Message).YPos;
          SendMessage(FHeaderHandle, HDM_HITTEST, 0, IntPtr(@Info));

          if (Info.Flags and HHT_ONDIVIDER = 0) and
             (Info.Flags and HHT_ONDIVOPEN = 0) then
            FPressedSection := Info.Item
          else
            FPressedSection := -1;
          RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
          FHeaderLBtnDown := True;
        end;
      WM_LBUTTONUP, WM_RBUTTONUP:
        begin
          FPressedSection := -1;
          RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
          FHeaderLBtnDown := False;
          PaintScroll;
        end;
      WM_MOUSEMOVE:
        if (FPressedSection = - 1) and FHeaderLBtnDown then
          PaintScroll
        else
        if FPressedSection = -1 then
        begin
          Info.Point.X := TWMMouse(Message).XPos;
          Info.Point.Y := TWMMouse(Message).YPos;
          SendMessage(FHeaderHandle, HDM_HITTEST, 0, IntPtr(@Info));
          if (Info.Flags and HHT_ONDIVIDER = 0) and
             (Info.Flags and HHT_ONDIVOPEN = 0) then
            FHotSection := Info.Item
          else
            FHotSection := -1;
          if FOldHotSection <> FHotSection then
          begin
            FOldHotSection := FHotSection;
            RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
          end;
        end;
      WM_MOUSELEAVE:
      begin
        if FHotSection <> -1 then
        begin
          FHotSection := -1;
          FOldHotSection := FHotSection;
          RedrawWindow(FHeaderHandle, nil, 0, RDW_INVALIDATE);
        end;
      end;
      WM_PAINT:
        begin
          PaintHeader(WParam);
          Exit;
        end;
      WM_ERASEBKGND:
        begin
          Result := 1;
          Exit;
        end;
      WM_NCDESTROY:
        begin
          Result := CallWindowProc(FDefHeaderProc, FHeaderHandle, Msg, WParam, LParam);
          FHeaderHandle := 0;
          FDefHeaderProc := nil;
          Exit;
        end;
    end;
    Result := CallWindowProc(FDefHeaderProc, FHeaderHandle, Msg, WParam, LParam);
  end;
end;

procedure TListViewStyleHook.LVMSetBkColor(var Message: TMessage);
begin
  Message.LParam := LPARAM(ColorToRGB(Brush.Color));
  Handled := False;
end;

procedure TListViewStyleHook.LVMSetTextBkColor(var Message: TMessage);
begin
  Message.LParam := LPARAM(ColorToRGB(Brush.Color));
  Handled := False;
end;

procedure TListViewStyleHook.LVMSetTextColor(var Message: TMessage);
begin
  Message.LParam := LPARAM(ColorToRGB(FontColor));
  Handled := False;
end;

procedure TListViewStyleHook.PaintHeader(DC: HDC);
var
  Canvas: TCanvas;
  R, HeaderR: TRect;
  PS: TPaintStruct;
  HeaderDC: HDC;
  I, ColumnIndex, RightOffset: Integer;
  SectionOrder: array of Integer;
  Item: THDItem;
  Buffer: array [0..255] of Char;
begin
  if DC = 0 then
    HeaderDC := BeginPaint(FHeaderHandle, PS)
  else
    HeaderDC := DC;
  try
    Canvas := TCanvas.Create;
    try
      Canvas.Handle := HeaderDC;
      RightOffset := 0;

      for I := 0 to Header_GetItemCount(FHeaderHandle) - 1 do
      begin
        SetLength(SectionOrder, Header_GetItemCount(FHeaderHandle));
        Header_GetOrderArray(FHeaderHandle, Header_GetItemCount(FHeaderHandle),
          Pointer(SectionOrder));
        ColumnIndex := SectionOrder[I];
        Header_GETITEMRECT(FHeaderHandle, ColumnIndex, @R);
        FillChar(Item, SizeOf(Item), 0);
        Item.Mask := HDI_TEXT;
        Item.pszText := @Buffer;
        Item.cchTextMax := Length(Buffer);
        Header_GetItem(FHeaderHandle, ColumnIndex, Item);
        DrawHeaderSection(Canvas, R, ColumnIndex, Item.pszText,
          FHotSection = ColumnIndex,
          FPressedSection = ColumnIndex, False);

        if RightOffset < R.Right then
          RightOffset := R.Right;
      end;

      GetWindowRect(FHeaderHandle, HeaderR);
      R := Rect(RightOffset, 0, HeaderR.Width + 2, HeaderR.Height);
      if not IsRectEmpty(R) then
        DrawHeaderSection(Canvas, R, -1, '', False, False, True);

      if DC <> 0 then
        ReleaseDC(FHeaderHandle, DC);
    finally
      Canvas.Handle := 0;
      Canvas.Free;
    end;
  finally
    if DC = 0  then
      EndPaint(FHeaderHandle, PS)
  end;
end;

procedure TListViewStyleHook.DrawHeaderSection(Canvas: TCanvas; R: TRect; Index: Integer;
  const Text: string; IsHot, IsPressed, IsBackground: Boolean);
var
  Flags, TextWidth: Integer;
  Item: THDItem;
  ImageList: HIMAGELIST;
  DrawState: TThemedHeader;
  IconWidth, IconHeight: Integer;
  Details: TThemedElementDetails;
  TempR: TRect;
begin
  FillChar(Item, SizeOf(Item), 0);
  Item.Mask := HDI_FORMAT;
  Header_GetItem(FHeaderHandle, Index, Item);
  if IsBackground then
    DrawState := thHeaderItemNormal
  else if IsPressed then
    DrawState := thHeaderItemPressed
  else
  if IsHot then
    DrawState := thHeaderItemHot
  else
    DrawState := thHeaderItemNormal;

  Details := StyleServices.GetElementDetails(DrawState);
  StyleServices.DrawElement(Canvas.Handle, Details, R);

  ImageList := SendMessage(FHeaderHandle, HDM_GETIMAGELIST, 0, 0);
  Item.Mask := HDI_FORMAT or HDI_IMAGE;
  InflateRect(R, -2, -2);
  Inc(R.Left, 3);
  Dec(R.Right, 3);
  IconWidth := 0;
  Flags := DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS;
  TempR := Rect(0, 0, 0, 0);     
  DrawControlText(Canvas, Details, Text, TempR, DT_SINGLELINE or DT_CALCRECT);
  TextWidth := TempR.Width;
  
  if Item.fmt and HDF_RIGHT = HDF_RIGHT then
    Flags := Flags or DT_RIGHT
  else
  if Item.fmt and HDF_CENTER = HDF_CENTER then
    Flags := Flags or DT_CENTER
  else
    Flags := Flags or DT_LEFT;

  if (ImageList <> 0) and Header_GetItem(FHeaderHandle, Index, Item) then
  begin
    if Item.fmt and HDF_IMAGE = HDF_IMAGE then
    begin
      ImageList_GetIconSize(ImageList, IconWidth, IconHeight);
      TempR := R;
      TempR.Top := R.Top + R.Height div 2 - IconHeight div 2;
      TempR.Bottom := TempR.Top + IconHeight;
      if Flags and DT_RIGHT = DT_RIGHT then      
      begin
        TempR.Left := R.Right - TextWidth - IconWidth - 10;
        if TempR.Left < R.Left then
        begin
          TempR.Left := R.Left;
          Inc(R.Left, IconWidth + 10);
        end;  
      end
      else
      if Flags and DT_CENTER = DT_CENTER then      
      begin
        TempR.Left := R.Left + R.Width div 2 - (TextWidth + IconWidth + 10) div 2;
        if TempR.Left < R.Left then
        begin
          TempR.Left := R.Left;
          Inc(R.Left, IconWidth + 10)
        end
        else 
          R.Left := TempR.Left + IconWidth + 10;
      end
      else
        Inc(R.Left, IconWidth + 10);
      ImageList_Draw(ImageList, Item.iImage, Canvas.Handle, TempR.Left, TempR.Top, ILD_TRANSPARENT);
    end;
  end;

  if IconWidth = 0 then Inc(R.Left, 2);

  DrawControlText(Canvas, Details, Text, R, Flags);
end;

procedure TListViewStyleHook.WMMouseMove(var Message: TWMMouse);
var
  SF: TScrollInfo;
  SPos: Integer;
  R: TRect;
begin
  if VertSliderState = tsThumbBtnVertPressed then
  begin
    SF.fMask := SIF_ALL;
    SF.cbSize := SizeOf(SF);
    GetScrollInfo(Handle, SB_VERT, SF);
    ScrollPos := ScrollPos + (SF.nMax - SF.nMin) * ((Mouse.CursorPos.Y - PrevScrollPos) / VertTrackRect.Height);

    PrevScrollPos := Mouse.CursorPos.Y;

    if Control is TCustomListView then
    begin
      PostMessage(Handle, WM_VSCROLL, Integer(SmallPoint(SB_THUMBTRACK, Round(ScrollPos))), 0);
      if TCustomListView(Control).ViewStyle = vsReport then
      begin
        if (Abs(ScrollPos - ListPos) >= 1) or
        ((ScrollPos = SF.nMin) and (ListPos <> ScrollPos)) or
        ((ScrollPos = SF.nMax) and (ListPos <> ScrollPos)) then
        begin
          if TCustomListView(Control).GroupView then
          begin
            SPos := Round(ScrollPos - ListPos);
            if SF.nPos + SPos < 0 then SPos := -SF.nPos;
          end
          else
            begin
              ListView_GetItemRect(Handle, 0, R, LVIR_BOUNDS);
              SPos := Round((ScrollPos - ListPos) * R.Height);
            end;
          ListView_Scroll(Handle, 0, SPos);
          ListPos := ScrollPos;
        end;
      end
      else
      begin
        if Abs(ScrollPos - ListPos) >= 1 then
        begin
          ListView_Scroll(Handle, 0, Round((ScrollPos - ListPos)));
          ListPos := ScrollPos;
        end;
      end;
    end
    else
      PostMessage(Handle, WM_VSCROLL, Integer(SmallPoint(SB_THUMBPOSITION, Round(ScrollPos))), 0);
    PaintScroll;
    Handled := True;
    Exit;
  end;

  if HorzSliderState = tsThumbBtnHorzPressed then
  begin
    SF.fMask := SIF_ALL;
    SF.cbSize := SizeOf(SF);
    GeTScrollInfo(Handle, SB_HORZ, SF);
    ScrollPos := ScrollPos + (SF.nMax - SF.nMin) * ((Mouse.CursorPos.X - PrevScrollPos) / HorzTrackRect.Width);
    if ScrollPos < SF.nMin then
      ScrollPos := SF.nMin;
    if ScrollPos > SF.nMax then
      ScrollPos := SF.nMax;

    PrevScrollPos := Mouse.CursorPos.X;

    if Control is TCustomListView then
    begin
      if TCustomListView(Control).ViewStyle = vsReport then
      begin
        if Abs(ScrollPos - ListPos) >= 1 then
        begin
          ListView_Scroll(Handle, Round((ScrollPos - ListPos)), 0);
          ListPos := ScrollPos;
        end;
      end
      else
      begin
        if Abs(ScrollPos - ListPos) >= 0.5 then
        begin
          ListView_Scroll(Handle, Round((ScrollPos - ListPos)), 0);
          ListPos := ScrollPos;
        end;
      end;
    end
    else
      PostMessage(Handle, WM_HSCROLL, Integer(SmallPoint(SB_THUMBPOSITION, Round(ScrollPos))), 0);
    PaintScroll;
    Handled := True;
    Exit;
  end;

  if (HorzSliderState <> tsThumbBtnHorzPressed) and (HorzSliderState = tsThumbBtnHorzHot) then
  begin
    HorzSliderState := tsThumbBtnHorzNormal;
    PaintScroll;
  end;

  if (VertSliderState <> tsThumbBtnVertPressed) and (VertSliderState = tsThumbBtnVertHot) then
  begin
    VertSliderState := tsThumbBtnVertNormal;
    PaintScroll;
  end;

  if (HorzUpState <> tsArrowBtnLeftPressed) and (HorzUpState = tsArrowBtnLeftHot) then
  begin
    HorzUpState := tsArrowBtnLeftNormal;
    PaintScroll;
  end;

  if (HorzDownState <> tsArrowBtnRightPressed) and (HorzDownState =tsArrowBtnRightHot) then
  begin
    HorzDownState := tsArrowBtnRightNormal;
    PaintScroll;
  end;

  if (VertUpState <> tsArrowBtnUpPressed) and (VertUpState = tsArrowBtnUpHot) then
  begin
    VertUpState := tsArrowBtnUpNormal;
    PaintScroll;
  end;

  if (VertDownState <> tsArrowBtnDownPressed) and (VertDownState = tsArrowBtnDownHot) then
  begin
    VertDownState := tsArrowBtnDownNormal;
    PaintScroll;
  end;

  CallDefaultProc(TMessage(Message));
  if LeftButtonDown then
    PaintScroll;
  Handled := True;
end;

{ TProgressBarStyleHook }

constructor TProgressBarStyleHook.Create;
begin
  inherited;
  OverridePaint := True;
  DoubleBuffered := True;
end;

function TProgressBarStyleHook.GetPercent: Single;
var
  LMin, LMax, LPos: Integer;
begin
  LMin := Min;
  LMax := Max;
  LPos := Position;
  if (LMin >= 0) and (LPos >= LMin) and (LMax >= LPos) and (LMax - LMin <> 0) then
    Result := (LPos - LMin) / (LMax - LMin)
  else
    Result := 0;
end;

function TProgressBarStyleHook.GetBarRect: TRect;
begin
  Result := TRect.Create(0, 0, Control.Width, Control.Height);
  InflateRect(Result, -BorderWidth, -BorderWidth);
end;

procedure TProgressBarStyleHook.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  Message.Result := 0;
  Handled := True;
end;

procedure TProgressBarStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

procedure TProgressBarStyleHook.PaintFrame(Canvas: TCanvas);
var
  R: TRect;
  Details: TThemedElementDetails;
begin
  if not StyleServices.Available then Exit;
  R := BarRect;
  if Orientation = pbHorizontal then
    Details := StyleServices.GetElementDetails(tpBar)
  else
    Details := StyleServices.GetElementDetails(tpBarVert);
  StyleServices.DrawElement(Canvas.Handle, Details, R);
end;

procedure TProgressBarStyleHook.PaintBar(Canvas: TCanvas);
var
  FillR, R: TRect;
  W, Pos: Integer;
  Details: TThemedElementDetails;
begin
  if not StyleServices.Available then
    Exit;
  R := BarRect;
  InflateRect(R, -1, -1);
  if Orientation = pbHorizontal then
    W := R.Width
  else
    W := R.Height;
  Pos := Round(W * GetPercent);
  FillR := R;
  if Orientation = pbHorizontal then
  begin
    FillR.Right := FillR.Left + Pos;
    Details := StyleServices.GetElementDetails(tpChunk);
  end
  else
  begin
    FillR.Top := FillR.Bottom - Pos;
    Details := StyleServices.GetElementDetails(tpChunkVert);
  end;
  StyleServices.DrawElement(Canvas.Handle, Details, FillR);
end;

procedure TProgressBarStyleHook.Paint(Canvas: TCanvas);
var
  Details: TThemedElementDetails;
begin
  if StyleServices.Available then
  begin
    Details.Element := teProgress;
    if StyleServices.HasTransparentParts(Details) then
      StyleServices.DrawParentBackground(Handle, Canvas.Handle, Details, False);
  end;
  PaintFrame(Canvas);
  PaintBar(Canvas);
end;

function TProgressBarStyleHook.GetMax: Integer;
begin
  Result := SendMessage(Handle, PBM_GetRange, 0, 0);
end;

function TProgressBarStyleHook.GetMin: Integer;
begin
  Result := SendMessage(Handle, PBM_GetRange, 1, 0);
end;

function TProgressBarStyleHook.GetOrientation: TProgressBarOrientation;
begin
  Result := pbHorizontal;
  if (Handle <> 0) and (GetWindowLong(Handle, GWL_STYLE) and PBS_VERTICAL = PBS_VERTICAL) then
    Result := pbVertical;
end;

function TProgressBarStyleHook.GetPosition: Integer;
begin
  Result := SendMessage(Handle, PBM_GETPOS, 0, 0);
end;

function TProgressBarStyleHook.GetBorderWidth: Integer;
begin
  Result := 0;
end;

{ TTrackBarStyleHook }

constructor TTrackBarStyleHook.Create;
begin
  inherited;
  OverridePaint := True;
  DoubleBuffered := True;
  FThumbPressed := False;
end;

function TTrackBarStyleHook.AcceptMessage(var Message: TMessage): Boolean;
begin
  Result := seClient in Control.StyleElements;
end;

procedure TTrackBarStyleHook.WMLButtonUp(var Message: TWMMouse);
begin
  if GetWindowLong(Handle, GWL_STYLE) and TBS_NOTHUMB = 0 then
  begin
    FThumbPressed := False;
    Invalidate;
  end;
end;

procedure TTrackBarStyleHook.WMLButtonDown(var Message: TWMMouse);
var
  R: TRect;
begin
  if GetWindowLong(Handle, GWL_STYLE) and TBS_NOTHUMB = 0 then
  begin
    SendMessage(Handle, TBM_GETTHUMBRECT, 0, IntPtr(@R));
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FThumbPressed := True;
    Invalidate;
  end;
end;

procedure TTrackBarStyleHook.CNHScroll(var Message: TWMHScroll);
begin
  Invalidate;
end;

procedure TTrackBarStyleHook.CNVScroll(var Message: TWMVScroll);
begin
  Invalidate;
end;

procedure TTrackBarStyleHook.WMMouseMove(var Message: TWMMouse);
var
  R: TRect;
  NewValue: Boolean;
begin
  if GetWindowLong(Handle, GWL_STYLE) and TBS_NOTHUMB = 0 then
  begin
    SendMessage(Handle, TBM_GETTHUMBRECT, 0, IntPtr(@R));
    NewValue := R.Contains(Point(Message.XPos, Message.YPos));
    if NewValue <> FMouseOnThumb then
    begin
      FMouseOnThumb := NewValue;
      Invalidate;
    end;
  end;
end;

procedure TTrackBarStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
  case Message.Msg  of
    TBM_SETPOS:
      Invalidate;
  end;
end;

procedure TTrackBarStyleHook.PaintBackground(Canvas: TCanvas);
var
  Details:  TThemedElementDetails;
begin
  if StyleServices.Available then
  begin
    Details.Element := teTrackBar;
    StyleServices.DrawParentBackground(Handle, Canvas.Handle, Details, False);
  end;
end;

procedure TTrackBarStyleHook.Paint(Canvas: TCanvas);
var
  R, R1, ThumbRect: TRect;
  WinStyle: Cardinal;
  Thumb: TThemedTrackBar;
  I, TickCount, TickStart, TickEnd, TickPos: Integer;
  Details: TThemedElementDetails;
begin
  if not StyleServices.Available then Exit;

  Thumb := ttbTrackBarDontCare;
  { Track }
  WinStyle := GetWindowLong(Handle, GWL_STYLE);
  SendMessage(Handle, TBM_GETCHANNELRECT, 0, IntPtr(@R));
  if WinStyle and TBS_VERT = 0 then
  begin
    Details := StyleServices.GetElementDetails(ttbTrack);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end
  else
  begin
    R1 := R;
    R.Left := R1.Top;
    R.Top := R1.Left;
    R.Right := R1.Bottom;
    R.Bottom := R1.Right;
    Details := StyleServices.GetElementDetails(ttbTrackVert);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;

  SendMessage(Handle, TBM_GETCHANNELRECT, 0, IntPtr(@R));
  SendMessage(Handle, TBM_GETTHUMBRECT, 0, IntPtr(@ThumbRect));

  // Ticks
  if WinStyle and TBS_NOTICKS = 0 then
  begin
    TickCount := SendMessage(Handle, TBM_GETNUMTICS, 0, 0);
                                                         
    Canvas.Pen.Color := StyleServices.GetSystemColor(clBtnText);

    // First
    if WinStyle and TBS_VERT = 0 then
    begin
      TickPos := R.Left + ThumbRect.Width div 2;
      if (WinStyle and TBS_TOP = TBS_TOP) or (WinStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(TickPos, R.Top - 7);
        Canvas.LineTo(TickPos, R.Top - 3);
      end;
      if (WinStyle and TBS_TOP = 0) or (WinStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(TickPos, R.Bottom + 3);
        Canvas.LineTo(TickPos, R.Bottom + 7);
      end;
      TickStart := TickPos;
    end
    else
    begin
      TickPos := R.Left + ThumbRect.Height div 2;
      if (WinStyle and TBS_TOP = TBS_TOP) or (WinStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(R.Top - 7, TickPos);
        Canvas.LineTo(R.Top - 3, TickPos);
      end;
      if (WinStyle and TBS_TOP = 0) or (WinStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(R.Bottom + 3, TickPos);
        Canvas.LineTo(R.Bottom + 7, TickPos);
      end;
      TickStart := TickPos;
    end;
    // last
    if WinStyle and TBS_VERT = 0 then
    begin
      TickPos := R.Right - ThumbRect.Width div 2 - 1;
      if (WinStyle and TBS_TOP = TBS_TOP) or (WinStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(TickPos, R.Top - 7);
        Canvas.LineTo(TickPos, R.Top - 3);
      end;
      if (WinStyle and TBS_TOP = 0) or (WinStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(TickPos, R.Bottom + 3);
        Canvas.LineTo(TickPos, R.Bottom + 7);
      end;
      TickEnd := TickPos;
    end
    else
    begin
      TickPos := R.Right - ThumbRect.Height div 2 - 1;
      if (WinStyle and TBS_TOP = TBS_TOP) or (WinStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(R.Top - 7, TickPos);
        Canvas.LineTo(R.Top - 3, TickPos);
      end;
      if (WinStyle and TBS_TOP = 0) or (WinStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(R.Bottom + 3, TickPos);
        Canvas.LineTo(R.Bottom + 7, TickPos);
      end;
      TickEnd := TickPos;
    end;
    for I := 1 to TickCount - 2 do
    begin
      TickPos := TickStart + Round((TickEnd - TickStart) * (I / (TickCount - 1)));
      if WinStyle and TBS_VERT = 0 then
      begin
        if (WinStyle and TBS_TOP = TBS_TOP) or (WinStyle and TBS_BOTH = TBS_BOTH) then
        begin
          Canvas.MoveTo(TickPos, R.Top - 6);
          Canvas.LineTo(TickPos, R.Top - 3);
        end;
        if (WinStyle and TBS_TOP = 0) or (WinStyle and TBS_BOTH = TBS_BOTH) then
        begin
          Canvas.MoveTo(TickPos, R.Bottom + 3);
          Canvas.LineTo(TickPos, R.Bottom + 6);
        end;
      end
      else
      begin
        if (WinStyle and TBS_TOP = TBS_TOP) or (WinStyle and TBS_BOTH = TBS_BOTH) then
        begin
          Canvas.MoveTo(R.Top - 6, TickPos);
          Canvas.LineTo(R.Top - 3, TickPos);
        end;
        if (WinStyle and TBS_TOP = 0) or (WinStyle and TBS_BOTH = TBS_BOTH) then
        begin
          Canvas.MoveTo(R.Bottom + 3, TickPos);
          Canvas.LineTo(R.Bottom + 6, TickPos);
        end;
      end;
    end;
  end;

  // Thumb
  if WinStyle and TBS_NOTHUMB = 0 then
  begin
    SendMessage(Handle, TBM_GETTHUMBRECT, 0, IntPtr(@R));
    if not Control.Enabled then
    begin
      if WinStyle and TBS_VERT = 0 then
      begin
       if WinStyle and TBS_BOTH = TBS_BOTH then
          Thumb := ttbThumbDisabled
        else
        if WinStyle and TBS_TOP = TBS_TOP then
          Thumb := ttbThumbTopDisabled
        else
        if WinStyle and TBS_BOTTOM = TBS_BOTTOM then
          Thumb := ttbThumbBottomDisabled;
      end
      else
      begin
        Thumb := ttbThumbRightDisabled;
        if WinStyle and TBS_TOP = TBS_TOP then
        Thumb := ttbThumbLeftDisabled else
        if WinStyle and TBS_BOTH = TBS_BOTH then
         Thumb := ttbThumbVertDisabled;
      end;
    end
    else if FThumbPressed then
    begin
      if WinStyle and TBS_VERT = 0 then
      begin
        if WinStyle and TBS_BOTH = TBS_BOTH then
          Thumb := ttbThumbPressed
        else
        if WinStyle and TBS_TOP = TBS_TOP then
          Thumb := ttbThumbTopPressed
        else
        if WinStyle and TBS_BOTTOM = TBS_BOTTOM then
          Thumb := ttbThumbBottomPressed;
      end
      else
      begin
        Thumb := ttbThumbRightPressed;
        if WinStyle and TBS_TOP = TBS_TOP then
        Thumb := ttbThumbLeftPressed else
        if WinStyle and TBS_BOTH = TBS_BOTH then
         Thumb := ttbThumbVertPressed;
      end;
    end
    else if FMouseOnThumb then
    begin
      if WinStyle and TBS_VERT = 0 then
      begin
        if WinStyle and TBS_BOTH = TBS_BOTH then
          Thumb := ttbThumbHot
        else
        if WinStyle and TBS_TOP = TBS_TOP then
          Thumb := ttbThumbTopHot
        else
        if WinStyle and TBS_BOTTOM = TBS_BOTTOM then
          Thumb := ttbThumbBottomHot;
      end
      else
      begin
        Thumb := ttbThumbRightHot;
        if WinStyle and TBS_TOP = TBS_TOP then
        Thumb := ttbThumbLeftHot else
        if WinStyle and TBS_BOTH = TBS_BOTH then
         Thumb := ttbThumbVertHot;
      end;
    end
    else
    begin
      if WinStyle and TBS_VERT = 0 then
      begin
         if WinStyle and TBS_BOTH = TBS_BOTH then
          Thumb := ttbThumbNormal
        else
        if WinStyle and TBS_TOP = TBS_TOP then
          Thumb := ttbThumbTopNormal
        else
        if WinStyle and TBS_BOTTOM = TBS_BOTTOM then
          Thumb := ttbThumbBottomNormal;
      end
      else
      begin
        Thumb := ttbThumbRightNormal;
        if WinStyle and TBS_TOP = TBS_TOP then
        Thumb := ttbThumbLeftNormal else
        if WinStyle and TBS_BOTH = TBS_BOTH then
         Thumb := ttbThumbVertNormal;
      end;
    end;

    Details := StyleServices.GetElementDetails(Thumb);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;

  if Focused then
    Canvas.DrawFocusRect(Control.ClientRect);
end;

{ TStatusBarStyleHook }

constructor TStatusBarStyleHook.Create;
begin
  inherited;
  OverridePaint := True;
  DoubleBuffered := True;
end;

procedure TStatusBarStyleHook.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1;
  Handled := True;
end;

procedure TStatusBarStyleHook.Paint(Canvas: TCanvas);
const
  AlignStyles: array [TAlignment] of Integer = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  R, R1: TRect;
  Res, Count, I: Integer;
  Idx, Flags: Cardinal;
  Details: TThemedElementDetails;
  LText: string;
  Borders: array [0..2] of Integer;
  SaveCanvas: TCanvas;
  ParentForm: TCustomForm;
  FDrawSizeGrip: Boolean;
begin
  if not StyleServices.Available then
    Exit;

  if Control.Parent is TCustomForm then
    ParentForm := TCustomForm(Control.Parent)
  else
    ParentForm := nil;

  Details := StyleServices.GetElementDetails(tsStatusRoot);
  StyleServices.DrawElement(Canvas.Handle, Details, Rect(0, 0, Control.Width, Control.Height));

  FDrawSizeGrip := (ParentForm <> nil) and not IsZoomed(ParentForm.Handle) and
    (GetWindowLong(Handle, GWL_STYLE) and SBARS_SIZEGRIP = SBARS_SIZEGRIP);

  if SendMessage(Handle, SB_ISSIMPLE, 0, 0) > 0 then
  begin
    R := Control.ClientRect;
    FillChar(Borders, SizeOf(Borders), 0);
    SendMessage(Handle, SB_GETBORDERS, 0, IntPtr(@Borders));
    R.Left := Borders[0] + Borders[2];
    R.Top := Borders[1];
    R.Bottom := R.Bottom - Borders[1];
    R.Right := Control.ClientWidth + 10;

    Details := StyleServices.GetElementDetails(tsPane);
    StyleServices.DrawElement(Canvas.Handle, Details, R);

    R1 := Control.ClientRect;
    R1.Left := R1.Right - 17;
    R1.Top := R1.Bottom - 17;
    if FDrawSizeGrip then
    begin
      Details := StyleServices.GetElementDetails(tsGripper);
      StyleServices.DrawElement(Canvas.Handle, Details, R1);
    end;
    Details := StyleServices.GetElementDetails(tsPane);
    SetLength(LText, Word(SendMessage(Handle, SB_GETTEXTLENGTH, 0, 0)));
    if Length(LText) > 0 then
    begin
     SendMessage(Handle, SB_GETTEXT, 0, IntPtr(@LText[1]));
     Flags := Control.DrawTextBiDiModeFlags(DT_LEFT);
     DrawControlText(Canvas, Details, LText, R, Flags);
    end;
  end
  else
  begin
    if Control is TStatusBar then
      Count := TStatusBar(Control).Panels.Count
    else
      Count := SendMessage(Handle, SB_GETPARTS, 0, 0);
    for I := 0 to Count - 1 do
    begin
      R := Rect(0, 0, 0, 0);
      SendMessage(Handle, SB_GETRECT, I, IntPtr(@R));
      if IsRectEmpty(R) then
        Exit;
      R1 := R;
      if I = Count - 1 then
        R1.Right := Control.ClientWidth + 10;
      Details := StyleServices.GetElementDetails(tsPane);
      StyleServices.DrawElement(Canvas.Handle, Details, R1);
      Details := StyleServices.GetElementDetails(tsPane);
      InflateRect(R, -1, -1);
      if Control is TCustomStatusBar then
        Flags := Control.DrawTextBiDiModeFlags(AlignStyles[TCustomStatusBar(Control).Panels[I].Alignment])
      else
        Flags := Control.DrawTextBiDiModeFlags(DT_LEFT);
      Idx := I;
      SetLength(LText, Word(SendMessage(Handle, SB_GETTEXTLENGTH, Idx, 0)));
      if Length(LText) > 0 then
      begin
        Res := SendMessage(Handle, SB_GETTEXT, Idx, IntPtr(@LText[1]));
        if (Res and SBT_OWNERDRAW = 0) then
          DrawControlText(Canvas, Details, LText, R, Flags)
        else
        if (Control is TCustomStatusBar) and Assigned(TCustomStatusBar(Control).OnDrawPanel) then
        begin
          SaveCanvas := TCustomStatusBar(Control).Canvas;
          TCustomStatusBar(Control).FCanvas := Canvas;
          try
            TCustomStatusBar(Control).OnDrawPanel(TCustomStatusBar(Control),
              TCustomStatusBar(Control).Panels[I], R);
          finally
            TCustomStatusBar(Control).FCanvas := SaveCanvas;
          end;
        end;
      end
      else if (Control is TCustomStatusBar) then
       if (TCustomStatusBar(Control).Panels[I].Style <> psOwnerDraw) then
         DrawControlText(Canvas, Details, TCustomStatusBar(Control).Panels[I].Text, R, Flags)
       else
         if Assigned(TCustomStatusBar(Control).OnDrawPanel) then
         begin
           SaveCanvas := TCustomStatusBar(Control).Canvas;
           TCustomStatusBar(Control).FCanvas := Canvas;
           try
             TCustomStatusBar(Control).OnDrawPanel(TCustomStatusBar(Control),
               TCustomStatusBar(Control).Panels[I], R);
           finally
             TCustomStatusBar(Control).FCanvas := SaveCanvas;
           end;
         end;
    end;

    if FDrawSizeGrip then
    begin
      R1 := Control.ClientRect;
      R1.Left := R1.Right - 17;
      R1.Top := R1.Bottom - 17;
      Details := StyleServices.GetElementDetails(tsGripper);
      StyleServices.DrawElement(Canvas.Handle, Details, R1);
    end;
  end;
end;

procedure TStatusBarStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

{ TToolBarStyleHook }

constructor TToolBarStyleHook.Create;
begin
  inherited;
  FImages := nil;
  OverridePaint := True;
  OverridePaintNC := True;
  DoubleBuffered := True;
  FHotButtonIndex := -1;
  FArrowDownButtonIndex := -1;
  FRuntimeThemesEnabled := TStyleManager.SystemStyle.Enabled;
end;

destructor TToolBarStyleHook.Destroy;
begin
  inherited;
  if FImages <> nil then
    FreeAndNil(FImages);
end;

procedure TToolBarStyleHook.MouseLeave;
begin
  if FHotButtonIndex <> -1 then
  begin
    FHotButtonIndex := -1;
    Invalidate;
  end;
end;

function TToolBarStyleHook.GetButtonCount: Integer;
begin
  Result := SendMessage(Handle, TB_BUTTONCOUNT, 0, 0);
end;

function TToolBarStyleHook.GetItemRect(Index: Integer): TRect;
begin
  Result := TRect.Empty;
  if not BOOL(SendMessage(Handle, TB_GETITEMRECT, Index, LPARAM(@Result))) then
    Result := TRect.Empty;
end;

function TToolBarStyleHook.GetItemInfo(Index: Integer; Text: PChar; TextLen: Integer): TTBButtonInfo;
var
  TB: TTBButton;
begin
  FillChar(TB, SizeOf(TB), 0);
  SendMessage(Handle, TB_GETBUTTON, Index, IntPtr(@TB));
  FillChar(Result, SizeOf(Result), 0);
  Result.cbSize := SizeOf(TTBButtonInfo);
  Result.dwMask := TBIF_STATE or TBIF_STYLE or TBIF_IMAGE or TBIF_TEXT;
  Result.cchText := TextLen;
  Result.pszText := Text;
  SendMessage(Handle, TB_GETBUTTONINFO, TB.idCommand, LPARAM(@Result));
  Result.fsStyle := TB.fsStyle;
  if not FRuntimeThemesEnabled then
    SendMessage(Handle, TB_GETBUTTONTEXT, TB.idCommand, LPARAM(Result.pszText));
end;

procedure TToolBarStyleHook.ApplyImageList;
var
  H: HIMAGELIST;
begin
  H := HIMAGELIST(SendMessage(Handle, TB_GETIMAGELIST, 0, 0));
  if (H <> 0) and (FImages = nil) then
  begin
    FImages := TImageList.Create(nil);
    FImages.ShareImages := True;
    FImages.Handle := H;
  end;
end;

procedure TToolBarStyleHook.WMSize(var Message: TWMSize);
begin
  if TToolBar(Control).EdgeBorders <> [] then InvalidateNC;
end;

procedure TToolBarStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
  case Message.Msg of
    TB_SETIMAGELIST:
      if FImages <> nil then
      begin
        FreeAndNil(FImages);
        RedrawWindow(Handle, nil, 0, RDW_INVALIDATE);
      end;
  end;
end;

procedure TToolBarStyleHook.PaintNC(Canvas: TCanvas);
var
  Details: TThemedElementDetails;
  R: TRect;
  SaveIndex: Integer;
begin
  if TToolBar(Control).BorderWidth <> 0 then
  begin
    SaveIndex := SaveDC(Canvas.Handle);
    try
      R := Rect(0, 0, Control.Width, Control.Height);
      InflateRect(R, -TToolBar(Control).BorderWidth * 2, -TToolBar(Control).BorderWidth * 2);
      if ebLeft in TToolBar(Control).EdgeBorders then
        Inc(R.Left, 2);
      if ebTop in TToolBar(Control).EdgeBorders then
        Inc(R.Top, 2);
      if ebRight in TToolBar(Control).EdgeBorders then
        Dec(R.Right, 2);
      if ebBottom in TToolBar(Control).EdgeBorders then
        Dec(R.Bottom, 2);
      ExcludeClipRect(Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom);
      Canvas.Brush.Color := StyleServices.GetSystemColor(clBtnFace);
      R := Rect(0, 0, Control.Width, Control.Height);
      Canvas.FillRect(R);
    finally
      RestoreDC(Canvas.Handle, SaveIndex);
    end;
  end;
  if TToolBar(Control).EdgeBorders <> [] then
  with Canvas do
  begin
    Details.Part := 0;
    Details.State := 0;
    Details.Element := teToolBar;
    R := Rect(0, 0, Control.Width, Control.Height);
    StyleServices.DrawEdge(Canvas.Handle, Details, R, [eeSunken], [efRect]);
    InflateRect(R, -1, -1);
    StyleServices.DrawEdge(Canvas.Handle, Details, R, [eeRaised], [efRect]);
  end;
end;

procedure TToolBarStyleHook.Paint(Canvas: TCanvas);

  function DropDownWidth(AButtonIndex: Integer): Integer;
  var
    R: TRect;
  begin
    if BOOL(SendMessage(Handle, TB_GETITEMDROPDOWNRECT, AButtonIndex, LPARAM(@R))) then
      Result := R.Right - R.Left
    else
      Result := 15; // default width when runtime themes are enabled
  end;

const
  BufSize = 255;
var
  Details, DropButtonDetails: TThemedElementDetails;
  R, R1, iRect, sRect: TRect;
  I: Integer;
  Info: TTBButtonInfo;
  ButtonState, DropButtonState: TThemedToolBar;
  ImageDrawed: Boolean;
  WStyle: Cardinal;
  LColor, LEndColor: TColor;
  DrawButtonFace: Boolean;
  Buffer: array [0..BufSize - 1] of Char;
  LStyle: TCustomStyleServices;
  LDropDownWidth: Integer;
begin
  LStyle := StyleServices;
  if not LStyle.Available then
    Exit;

  WStyle := GetWindowLong(Handle, GWL_STYLE);
  R := Rect(0, 0, Control.Width, Control.Height);
  {draw body}
  if TToolBar(Control).DrawingStyle = TTBdrawingStyle.dsNormal then
  begin
    Details.Element := teToolBar;
    Details.Part := 0;
    Details.State := 0;
    if LStyle.HasTransparentParts(Details) then
      LStyle.DrawParentBackground(Handle, Canvas.Handle, Details, False);
    LStyle.DrawElement(Canvas.Handle, Details, R);
  end
  else
  begin
    LColor := LStyle.GetStyleColor(scToolBarGradientBase);
    LEndColor := LStyle.GetStyleColor(scToolBarGradientEnd);
    GradientFillCanvas(Canvas, LColor, LEndColor, R, gdVertical);
  end;
  {draw buttons}
  ApplyImageList;
  for I := 0 to GetButtonCount - 1 do
  begin
    Info := GetItemInfo(I, @Buffer, BufSize);

    if Info.fsState and TBSTATE_HIDDEN = TBSTATE_HIDDEN then
      Continue;
    R := GetItemRect(I);

    if Info.fsStyle and BTNS_WHOLEDROPDOWN = BTNS_WHOLEDROPDOWN then
    begin
      ButtonState := ttbDropDownButtonNormal;
      if Info.fsState and TBSTATE_ENABLED = 0 then
        ButtonState := ttbDropDownButtonDisabled
      else if Info.fsState and TBSTATE_PRESSED = TBSTATE_PRESSED then
        ButtonState := ttbDropDownButtonPressed
      else if Info.fsState and TBSTATE_CHECKED = TBSTATE_CHECKED then
      begin
        if Info.fsState and TBSTATE_PRESSED = TBSTATE_PRESSED then
          ButtonState := ttbDropDownButtonCheckedHot
        else if (FHotButtonIndex = I) and MouseInControl then
          ButtonState := ttbDropDownButtonCheckedHot
        else
          ButtonState := ttbDropDownButtonChecked
      end
      else if (FHotButtonIndex = I) and MouseInControl then
        ButtonState := ttbDropDownButtonHot;
    end
    else
    begin
      ButtonState := ttbButtonNormal;
      if Info.fsState and TBSTATE_ENABLED = 0 then
        ButtonState := ttbButtonDisabled
      else if (Info.fsState and TBSTATE_PRESSED = TBSTATE_PRESSED) and not
              ((Info.fsStyle and TBSTYLE_DROPDOWN = TBSTYLE_DROPDOWN) and
              (FArrowDownButtonIndex = I)) then
        ButtonState := ttbButtonPressed
      else if Info.fsState and TBSTATE_CHECKED = TBSTATE_CHECKED then
      begin
        if Info.fsState and TBSTATE_PRESSED = TBSTATE_PRESSED then
          ButtonState := ttbButtonCheckedHot
        else if ((FHotButtonIndex = I) and MouseInControl) then
          ButtonState := ttbButtonCheckedHot
        else
          ButtonState := ttbButtonChecked
       end
       else if ((FHotButtonIndex = I) and MouseInControl)  or
               ((Info.fsStyle and TBSTYLE_DROPDOWN = TBSTYLE_DROPDOWN) and (FArrowDownButtonIndex = I)) then
         ButtonState := ttbButtonHot;
    end;

    DrawButtonFace := (TToolBar(Control).DrawingStyle = TTBDrawingStyle.dsNormal) or
      (Info.fsState and TBSTATE_PRESSED = TBSTATE_PRESSED) or
      (Info.fsState and TBSTATE_CHECKED = TBSTATE_CHECKED) or
      (MouseInControl and (FHotButtonIndex = I)) or (FArrowDownButtonIndex = I);

    { Face }
    Details := LStyle.GetElementDetails(ButtonState);
    ImageDrawed := True;
    if Info.fsStyle and TBSTYLE_CHECK = TBSTYLE_CHECK then
    begin
      if DrawButtonFace then
        LStyle.DrawElement(Canvas.Handle, Details, R);
    end
    else if Info.fsStyle and BTNS_WHOLEDROPDOWN = BTNS_WHOLEDROPDOWN then
      LStyle.DrawElement(Canvas.Handle, Details, R)
    else if Info.fsStyle and TBSTYLE_DROPDOWN = TBSTYLE_DROPDOWN then
    begin
      LDropDownWidth := DropDownWidth(I);
      R1 := R;
      R1.Right := R1.Right - LDropDownWidth;
      if DrawButtonFace then
        LStyle.DrawElement(Canvas.Handle, Details, R1);
      R1 := R;
      R1.Left := R1.Right - LDropDownWidth;

      if (FArrowDownButtonIndex = I) or (ButtonState = ttbButtonPressed) then
        DropButtonState := ttbSplitButtonDropDownPressed
      else if ButtonState = ttbButtonDisabled then
        DropButtonState := ttbSplitButtonDropDownDisabled
      else if ButtonState = ttbButtonHot then
        DropButtonState := ttbSplitButtonDropDownHot
      else
        DropButtonState := ttbSplitButtonDropDownNormal;

      if TToolBar(Control).DrawingStyle = dsGradient then
        case DropButtonState of
          ttbSplitButtonDropDownNormal,
          ttbSplitButtonDropDownDisabled,
          ttbButtonDisabled:
            DropButtonState := ttbDropDownButtonGlyphNormal;
        end;

      DropButtonDetails := LStyle.GetElementDetails(DropButtonState);
      LStyle.DrawElement(Canvas.Handle, DropButtonDetails, R1);

      R.Right := R.Right - LDropDownWidth;
    end
    else if Info.fsStyle and TBSTYLE_SEP = TBSTYLE_SEP then
    begin
      R1 := R;
      if TStyleManager.SystemStyle.Enabled then
        R1.Right := R1.Left + 4;
      if (Control is TToolBar) and not (TToolBar(Control).Wrapable) and
         (TToolBar(Control).Buttons[I].Wrap) then
      begin
        R1 := Rect(0, R1.CenterPoint.Y, Control.ClientWidth, R1.CenterPoint.Y + 2);
        Frame3D(Canvas, R1,
          StyleServices.GetSystemColor(clBtnShadow), StyleServices.GetSystemColor(clBtnHighLight), 1);
      end
      else
      begin
        Details := LStyle.GetElementDetails(ttbSeparatorNormal);
        LStyle.DrawElement(Canvas.Handle, Details, R1);
      end;
      ImageDrawed := False;
    end
    else if DrawButtonFace then
      LStyle.DrawElement(Canvas.Handle, Details, R);

    { Text and Image }
    if FImages <> nil then
    begin
      iRect := Rect(0, 0, FImages.Width, FImages.Height);
      RectCenter(iRect, R);
    end
    else
      iRect := Rect(0, 0, 0, 0);

    if (StrLen(Info.pszText) > 0) and not (Info.fsStyle and TBSTYLE_SEP = TBSTYLE_SEP) and
       (not (Control is TToolBar) or
       ((Control is TToolBar) and
       ((TToolBar(Control).ShowCaptions) or (TToolBar(Control).AllowTextButtons and
       (TToolBar(Control).Buttons[I].Style = tbsTextButton))))) then
    begin
      if (WStyle and TBSTYLE_LIST = TBSTYLE_LIST) then
      begin
        sRect := R;
        Canvas.Font := TControlClass(Control).Font;
        DrawText(Canvas.Handle, PChar(Info.pszText),
          Length(Info.pszText), sRect, DT_CENTER or DT_WORDBREAK or DT_CALCRECT);
        RectCenter(sRect, R);
        if ImageDrawed and (Info.iImage >= 0) and (FImages <> nil) then
        begin
          iRect := Rect(5, iRect.Top, FImages.Width + 5, iRect.Bottom);
          OffsetRect(iRect, R.Left, 0);
          sRect := Rect(iRect.Right + 3, sRect.Top, R.Right, sRect.Bottom);
        end;
        if DrawButtonFace then
          DrawControlText(Canvas, Details, Info.pszText, sRect, DT_LEFT or DT_WORDBREAK)
        else
        begin
          Canvas.Font.Color := StyleServices.GetSystemColor(clBtnText);
          SetBkMode(Canvas.Handle, Transparent);
          DrawText(Canvas.Handle, Info.pszText, Length(Info.pszText), sRect,
            DT_LEFT or DT_WORDBREAK);
        end;
      end
      else
      begin
        Canvas.Font := TControlClass(Control).Font;
        sRect := R;
        DrawText(Canvas.Handle, PChar(Info.pszText),
          Length(Info.pszText), sRect, DT_CENTER or DT_WORDBREAK or DT_CALCRECT);
        RectCenter(sRect, R);
        if ImageDrawed and (Info.iImage >= 0) and (FImages <> nil) then
        begin
          OffsetRect(sRect, 0, iRect.Height div 2);
          OffsetRect(iRect, 0, -sRect.Height div 2);
        end;
        if DrawButtonFace then
          DrawControlText(Canvas, Details, Info.pszText, sRect, DT_CENTER or DT_WORDBREAK)
        else
        begin
          Canvas.Font.Color := StyleServices.GetSystemColor(clBtnText);
          SetBkMode(Canvas.Handle, Transparent);
          DrawText(Canvas.Handle, Info.pszText, Length(Info.pszText), sRect,
            DT_CENTER or DT_WORDBREAK);
        end;
      end;
    end;

    if ImageDrawed and (Info.iImage >= 0) and (FImages <> nil) then
    begin
      if Control is TToolBar then
      begin
        if (Info.fsState and TBSTATE_ENABLED = 0) and (TToolBar(Control).DisabledImages <> nil) and
           (Info.iImage < TToolBar(Control).DisabledImages.Count) then
          TToolBar(Control).DisabledImages.Draw(Canvas, iRect.Left, iRect.Top, Info.iImage)
        else
        if (FHotButtonIndex = I) and (TToolBar(Control).HotImages <> nil) and
           (Info.iImage < TToolBar(Control).HotImages.Count) then
          TToolBar(Control).HotImages.Draw(Canvas, iRect.Left, iRect.Top, Info.iImage)
        else
          TToolBar(Control).Images.Draw(Canvas, iRect.Left, iRect.Top, Info.iImage,
            Info.fsState and TBSTATE_ENABLED = TBSTATE_ENABLED);
      end
      else
        ImageList_Draw(FImages.Handle, Info.iImage, Canvas.Handle, iRect.Left, iRect.Top, ILD_TRANSPARENT);
    end;
  end;

end;

procedure TToolBarStyleHook.WMNotify(var Message: TWMNotify);
begin
  if (Message.NMHdr.Code = TBN_DROPDOWN) and (LongWord(Message.IDCtrl) = Handle) then
  begin
    FArrowDownButtonIndex := PNMToolBar(Message.NMHdr).iItem;
    Invalidate;
    FHotButtonIndex := -1;
    CallDefaultProc(TMessage(Message));
    FArrowDownButtonIndex := -1;
    Invalidate;
    Handled := True;
  end;
end;

procedure TToolBarStyleHook.WMMouseMove(var Message: TWMMouse);
const
  BufSize = 255;
var
  I: Integer;
  Info: TTBButtonInfo;
  Buffer: array [0..BufSize - 1] of Char;
begin
  inherited;
  for I := 0 to GetButtonCount - 1 do
  begin
    if GetItemRect(I).Contains(Point(Message.XPos, Message.YPos)) then
    begin
      Info := GetItemInfo(I, @Buffer, BufSize);
      if Info.fsState and TBSTATE_ENABLED = TBSTATE_ENABLED then
      begin
        if FHotButtonIndex <> I then
          Invalidate;
        FHotButtonIndex := I;
        Exit;
      end;
    end;
  end;
  if FHotButtonIndex >= 0 then
  begin
    FHotButtonIndex := -1;
    Invalidate;
  end;
end;

procedure TToolBarStyleHook.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
  Handled := True;
end;

{ TUpDownStyleHook }

constructor TUpDownStyleHook.Create(AControl: TWinControl);
begin
  inherited;
  OverridePaint := True;
  DoubleBuffered := True;
end;

function TUpDownStyleHook.GetOrientation: TUDOrientation;
begin
  if (Control <> nil) and (Control is TUpDown) then
    Result := TUpDown(Control).Orientation
  else if Handle <> 0 then
  begin
    if GetWindowLong(Handle, GWL_STYLE) and UDS_HORZ = UDS_HORZ then
      Result := udHorizontal
    else
      Result := udVertical;
  end
  else
    Result := udVertical;
end;

procedure TUpDownStyleHook.Paint(Canvas: TCanvas);
var
  R: TRect;
  DrawState: TThemedScrollBar;
  Details: TThemedElementDetails;
begin
  if not StyleServices.Available then
    Exit;

  StyleServices.DrawParentBackground(Handle, Canvas.Handle, Details, False);

  if GetOrientation = udHorizontal then
  begin
    R := Control.ClientRect;
    R.Right := R.Left + R.Width div 2;
    if FLeftPressed then
      DrawState := tsArrowBtnLeftPressed
    else if FMouseOnLeft and MouseInControl then
      DrawState := tsArrowBtnLeftHot
    else
      DrawState := tsArrowBtnLeftNormal;

    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);

    R := Control.ClientRect;
    R.Left := R.Right - R.Width div 2;
    if FRightPressed then
      DrawState := tsArrowBtnRightPressed
    else if FMouseOnRight and MouseInControl then
      DrawState :=  tsArrowBtnRightHot
    else
      DrawState :=  tsArrowBtnRightNormal;

    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end
  else
  begin
    R := Control.ClientRect;
    R.Bottom := R.Top + R.Height div 2;
    if FLeftPressed then
      DrawState := tsArrowBtnUpPressed
    else if FMouseOnLeft and MouseInControl then
      DrawState := tsArrowBtnUpHot
    else
      DrawState := tsArrowBtnUpNormal;

    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);

    R := Control.ClientRect;
    R.Top := R.Bottom - R.Height div 2;

    if FRightPressed then
      DrawState := tsArrowBtnDownPressed
    else if FMouseOnRight and MouseInControl  then
      DrawState := tsArrowBtnDownHot
    else
      DrawState := tsArrowBtnDownNormal;

    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;
end;

procedure TUpDownStyleHook.WMLButtonDblClk(var Message: TWMMouse);
var
  R: TRect;
begin
  SetRedraw(False);
  CallDefaultProc(TMessage(Message));
  SetRedraw(True);
  if GetOrientation = udHorizontal then
  begin
    R := Control.ClientRect;
    R.Right := R.Left +  R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FLeftPressed := True
    else
      FLeftPressed := False;

    R := Control.ClientRect;
    R.Left := R.Right - R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FRightPressed := True
    else
      FRightPressed := False;
  end
  else
  begin
    R := Control.ClientRect;
    R.Bottom := R.Top + R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FLeftPressed := True
    else
      FLeftPressed := False;

    R := Control.ClientRect;
    R.Top := R.Bottom - R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FRightPressed := True
    else
      FRightPressed := False;
  end;
  Invalidate;
  Handled := True;
end;

procedure TUpDownStyleHook.WMLButtonDown(var Message: TWMMouse);
var
  R: TRect;
begin
  SetRedraw(False);
  CallDefaultProc(TMessage(Message));
  SetRedraw(True);

  if GetOrientation = udHorizontal then
  begin
    R := Control.ClientRect;
    R.Right := R.Left + R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FLeftPressed := True
    else
      FLeftPressed := False;

    R := Control.ClientRect;
    R.Left := R.Right - R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FRightPressed := True
    else
      FRightPressed := False;
  end
  else
  begin
    R := Control.ClientRect;
    R.Bottom := R.Top + R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FLeftPressed := True
    else
      FLeftPressed := False;

    R := Control.ClientRect;
    R.Top := R.Bottom - R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FRightPressed := True
    else
      FRightPressed := False;
  end;

  Invalidate;
  Handled := True;
end;

procedure TUpDownStyleHook.WMLButtonUp(var Message: TWMMouse);
begin
  SetRedraw(False);
  CallDefaultProc(TMessage(Message));
  SetRedraw(True);

  FLeftPressed := False;
  FRightPressed := False;
  Invalidate;

  Handled := True;
end;

procedure TUpDownStyleHook.WMMouseMove(var Message: TWMMouse);
var
  R: TRect;
  FOldMouseOnLeft, FOldMouseOnRight: Boolean;
begin
  inherited;
  CallDefaultProc(TMessage(Message));

  FOldMouseOnLeft := FMouseOnLeft;
  FOldMouseOnRight := FMouseOnRight;

  if GetOrientation = udHorizontal then
  begin
    R := Control.ClientRect;
    R.Right := R.Left + R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FMouseOnLeft := True
    else
      FMouseOnLeft := False;

    R := Control.ClientRect;
    R.Left := R.Right - R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FMouseOnRight := True
    else
      FMouseOnRight := False;
  end
  else
  begin
    R := Control.ClientRect;
    R.Bottom := R.Top + R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FMouseOnLeft := True
    else
      FMouseOnLeft := False;

    R := Control.ClientRect;
    R.Top := R.Bottom - R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FMouseOnRight := True
    else
      FMouseOnRight := False;
  end;

  if (FOldMouseOnLeft <> FMouseOnLeft) and (FOldMouseOnRight <> FMouseOnRight) then
    Invalidate;

  Handled := True;
end;

procedure TUpDownStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

procedure TUpDownStyleHook.MouseLeave;
begin
  FMouseOnLeft := False;
  FMouseOnRight := False;
  Invalidate;
end;

{ THeaderStyleHook }

constructor THeaderStyleHook.Create;
begin
  inherited;
  DoubleBuffered := True;
  OverridePaint := True;
  FHotSectionIndex := -1;
  FPressedSectionIndex := -1;
end;

procedure THeaderStyleHook.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
  Handled := True;
end;

procedure THeaderStyleHook.MouseLeave;
begin
  FHotSectionIndex := -1;
  Invalidate;
end;

procedure THeaderStyleHook.Paint(Canvas: TCanvas);
const
  BufSize = 255;
var
  R, HeaderR: TRect;
  I, ColumnIndex, RightOffset: Integer;
  Item: THDItem;
  Buffer: array [0..BufSize - 1] of Char;
begin
  RightOffset := 0;

  { Draw sections }
  for I := 0 to Header_GetItemCount(Handle) - 1 do
  begin
    ColumnIndex := I;
    Header_GETITEMRECT(Handle, ColumnIndex, @R);
    FillChar(Item, SizeOf(Item), 0);
    Item.Mask := HDI_TEXT;
    Item.pszText := @Buffer;
    Item.cchTextMax := BufSize;
    if Header_GetItem(Handle, ColumnIndex, Item) then
      DrawHeaderSection(Canvas, R, ColumnIndex, Item.pszText,
        FPressedSectionIndex = ColumnIndex, FHotSectionIndex = ColumnIndex, False);
    if RightOffset < R.Right then RightOffset := R.Right;
  end;

  { Draw background section }
  GetWindowRect(Handle, HeaderR);
  R := Rect(RightOffset, 0, HeaderR.Width + 2, HeaderR.Height);
  if not IsRectEmpty(R) then
    DrawHeaderSection(Canvas, R, -1, '', False, False, True);
end;


procedure THeaderStyleHook.DrawHeaderSection(Canvas: TCanvas; R: TRect; Index: Integer;
   const Text: string; IsPressed, IsHot, IsBackground: Boolean);
var
  Item: THDItem;
  Flags: Cardinal;
  ImageList: HIMAGELIST;
  DrawState: TThemedHeader;
  Details: TThemedElementDetails;
  IconX, IconY, IconWidth, IconHeight: Integer;
begin
  if not StyleServices.Available then Exit;

  FillChar(Item, SizeOf(Item), 0);
  Item.Mask := HDI_FORMAT;
  Header_GetItem(Handle, Index, Item);

  if IsBackground then
    DrawState := thHeaderItemNormal
   else if IsPressed then
     DrawState := thHeaderItemPressed
   else if IsHot and MouseInControl then
     DrawState := thHeaderItemHot
   else
     DrawState := thHeaderItemNormal;

  Details := StyleServices.GetElementDetails(DrawState);
  StyleServices.DrawElement(Canvas.Handle, Details, R);

  { Draw Image }
  ImageList := SendMessage(Handle, HDM_GETIMAGELIST, 0, 0);
  Item.Mask := HDI_FORMAT or HDI_IMAGE;
  InflateRect(R, -3, -3);
  if (ImageList <> 0) and Header_GetItem(Handle, Index, Item) and
     (Item.fmt and HDF_IMAGE = HDF_IMAGE) then
  begin
    ImageList_GetIconSize(ImageList, IconWidth, IconHeight);
    IconX := R.Left;
    IconY := R.Top + R.Height div 2 - IconHeight div 2;
    ImageList_Draw(ImageList, Item.iImage,
      Canvas.Handle, IconX, IconY, ILD_TRANSPARENT);
    Inc(R.Left, IconWidth + 3);
  end;

  { Draw Text }
  if Index < 0 then
    Flags := Control.DrawTextBiDiModeFlags(DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS)
  else if Item.fmt and HDF_RIGHT = HDF_RIGHT then
    Flags := Control.DrawTextBiDiModeFlags(DT_RIGHT or DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS)
  else if Item.fmt and HDF_CENTER = HDF_CENTER then
    Flags := Control.DrawTextBiDiModeFlags(DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS)
  else
    Flags := Control.DrawTextBiDiModeFlags(DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS);
  DrawControlText(Canvas, Details, Text, R, Flags);
end;

procedure THeaderStyleHook.WMLButtonDown(var Message: TWMMouse);
var
  Info: THDHitTestInfo;
begin
  CallDefaultProc(TMessage(Message));

  Info.Point.X := Message.XPos;
  Info.Point.Y := Message.YPos;
  SendMessage(Handle, HDM_HITTEST, 0, IntPtr(@Info));

  if (Info.Flags and HHT_ONDIVIDER = 0) and
     (Info.Flags and HHT_ONDIVOPEN = 0) then
    FPressedSectionIndex := Info.Item
  else
    FPressedSectionIndex := -1;

  RedrawWindow(Handle, nil, 0, RDW_INVALIDATE);
  Handled := True;
end;

procedure THeaderStyleHook.WMLButtonUp(var Message: TWMMouse);
begin
  CallDefaultProc(TMessage(Message));

  FPressedSectionIndex := -1;
  RedrawWindow(Handle, nil, 0, RDW_INVALIDATE);
  Handled := True;
end;

procedure THeaderStyleHook.WMRButtonUp(var Message: TWMMouse);
begin
  CallDefaultProc(TMessage(Message));

  FPressedSectionIndex := -1;
  RedrawWindow(Handle, nil, 0, RDW_INVALIDATE);
  Handled := True;
end;

procedure THeaderStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

procedure THeaderStyleHook.WMMouseMove(var Message: TWMMouse);
var
  OldHot: Integer;
  Info: THDHitTestInfo;
begin
  inherited;

  CallDefaultProc(TMessage(Message));

  OldHot := FHotSectionIndex;

  Info.Point.X := Message.XPos;
  Info.Point.Y := Message.YPos;
  SendMessage(Handle, HDM_HITTEST, 0, IntPtr(@Info));

  if (Info.Flags and HHT_ONDIVIDER = 0) and
     (Info.Flags and HHT_ONDIVOPEN = 0) then
    FHotSectionIndex := Info.Item
  else
    FHotSectionIndex := -1;

  if OldHot <> FHotSectionIndex then
    RedrawWindow(Handle, nil, 0, RDW_INVALIDATE);

  Handled := True;
end;

{ TCoolBarStyleHook }

constructor TCoolBarStyleHook.Create;
begin
  inherited;
  OverridePaint := True;
  OverridePaintNC := True;
end;

procedure TCoolBarStyleHook.PaintNC(Canvas: TCanvas);
var
  Details: TThemedElementDetails;
begin
  if not StyleServices.Available then Exit;
  if (Control is TCoolBar) and (TCoolBar(Control).EdgeBorders = []) then Exit;

  ExcludeClipRect(Canvas.Handle,
    2, 2, Control.Width - 2, Control.Height - 2);
  Canvas.Brush.Color := StyleServices.ColorToRGB(clBtnFace);
  Canvas.FillRect(Rect(0, 0, Control.Width, Control.Height));
  Details.Element := teToolBar;
  Details.Part := 0;
  StyleServices.DrawElement(Canvas.Handle,
    Details, Rect(0, 0, Control.Width, Control.Height));
end;

procedure TCoolBarStyleHook.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
  Handled := True;
end;

function TCoolBarStyleHook.GetBandCount: Integer;
begin
  Result := SendMessage(Handle, RB_GETBANDCOUNT, 0, 0);
end;

function TCoolBarStyleHook.GetBandText(Index: Integer): string;
const
  BufSize = 255;
var
  Info: TRebarBandInfo;
  Buffer: array [0..BufSize - 1] of Char;
begin
  FillChar(Info, SizeOf(Info), 0);
  Info.cbSize := SizeOfReBarBandInfo; // Size differs depending on OS and ComCtl32.dll version
  Info.fMask := RBBIM_TEXT;
  Info.lpText := @Buffer;
  Info.cch := BufSize;
  if BOOL(SendMessage(Handle, RB_GETBANDINFO, Index, IntPtr(@Info))) then
    Result := Info.lpText
  else
    Result := '';
end;

function TCoolBarStyleHook.GetBandRect(Index: Integer): TRect;
begin
  Result := Rect(0, 0, 0, 0);
  SendMessage(Handle, RB_GETRECT, Index, IntPtr(@Result));
  if (Control is TCoolBar) and TCoolBar(Control).Vertical then
  with TCoolBar(Control)  do
  begin
    Result.Top := Bands[Index].Control.Top;
    Result.Left :=  Bands[Index].Control.Left;
    Result.Bottom := Result.Top + Bands[Index].Control.Height;
    Result.Right := Result.Left + Bands[Index].Control.Width;
    Result.Top := Result.Top - GetBandBorder(Index).Top + 4;
  end;
end;

function TCoolBarStyleHook.GetBandBorder(Index: Integer): TRect;
begin
  SendMessage(Handle, RB_GETBANDBORDERS, Index, IntPtr(@Result));
end;

procedure TCoolBarStyleHook.Paint(Canvas: TCanvas);
var
  I, IX, IY: integer;
  R, Margin, LTextRect: TRect;
  S: string;
  Details: TThemedElementDetails;
  SaveIndex: Integer;
begin
  { Background }
  R := Rect(0, 0, Control.ClientWidth, Control.ClientHeight);
  InflateRect(R, 2, 2);
  Details.Element := teToolBar;
  Details.Part := 0;
  SaveIndex := SaveDC(Canvas.Handle);
  try
    if StyleServices.HasTransparentParts(Details) then
      StyleServices.DrawParentBackground(Handle, Canvas.Handle, Details, False);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  finally
    RestoreDC(SaveIndex, Canvas.Handle);
  end;
  { Bands }
  for I := 0 to GetBandCount - 1 do
  begin
    R := GetBandRect(I);
    Margin := GetBandBorder(I);
    InflateRect(R, 1, 1);
    if R.Top < 0 then R.Top := 0;
    if R.Left < 0 then R.Left := 0;
    if R.Right > Control.ClientRect.Right then
      R.Right := Control.ClientRect.Right;
    if R.Bottom > Control.ClientRect.Bottom then
      R.Bottom := Control.ClientRect.Bottom;
    {draw band}
    Details := StyleServices.GetElementDetails(trBand);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
    {draw text and image}
    if (Control is TCoolBar) and TCoolBar(Control).Vertical then
      LTextRect := Rect(R.Left, R.Top, R.Right, R.Top + Margin.Top)
    else
      LTextRect := Rect(R.Left + 10, R.Top, R.Left + Margin.Left, R.Bottom);

    if Control is TCoolBar then
      with TCoolBar(Control) do
      begin
        if (Images <> nil) and (Bands[I].ImageIndex < Images.Count) and
           (Bands[I].ImageIndex >= 0) then
        begin
          if not Vertical then
          begin
            IX := LTextRect.Left;
            IY := LTextRect.Top + LTextRect.Height div 2 - Images.Height div 2;
            Inc(LTextRect.Left, Images.Width + 3);
          end
          else
          begin
            IX := LTextRect.Left + LTextRect.Width div 2 - Images.Width div 2;
            IY := LTextRect.Top + 10;
            Inc(LTextRect.Top, Images.Height + 5);
          end;
          ImageList_Draw(Images.Handle, Bands[I].ImageIndex, Canvas.Handle,
            IX, IY, ILD_TRANSPARENT);
        end;
      end;

    S := GetBandText(I);
    if S <> '' then
      DrawControlText(Canvas, Details, S, LTextRect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
    {draw gripper}
    if (Control is TCoolBar) and TCoolBar(Control).Vertical then
    begin
      if RBS_BANDBORDERS and GetWindowLong(Handle, GWL_STYLE) = 0 then
        R := Rect(R.Left, R.Top, R.Right, R.Top + 4)
      else
        R := Rect(R.Left, R.Top + 3, R.Right, R.Top + 7);
      Details := StyleServices.GetElementDetails(trGripperVert);
    end
    else
    begin
      R := Rect(R.Left + 2, R.Top + 2, R.Left + 6, R.Bottom - 2);
      Details := StyleServices.GetElementDetails(trGripper);
    end;
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;
end;

procedure TCoolBarStyleHook.WMSize(var Message: TMessage);
begin
  CallDefaultProc(Message);
  Invalidate;
  Handled := True;
end;

procedure TCoolBarStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

{ TPageScrollerStyleHook }

constructor TPageScrollerStyleHook.Create(AControl: TWinControl);
begin
  inherited;
  OverridePaint := True;
end;

procedure TPageScrollerStyleHook.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
  Handled := True;
end;

procedure TPageScrollerStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

procedure TPageScrollerStyleHook.Paint(Canvas: TCanvas);
var
  Details: TThemedElementDetails;
begin
  Details.Element := teToolBar;
  StyleServices.DrawParentBackground(Handle, Canvas.Handle, Details, False);
end;

procedure TPageScrollerStyleHook.PGMSetBKColor(var Message: TMessage);
begin
  if StyleServices.Available then
    Message.LParam := StyleServices.ColorToRGB(clBtnFace);
end;

{ TComboBoxExStyleHook }

constructor TComboBoxExStyleHook.Create(AControl: TWinControl);
begin
  inherited;
  OverridePaint := False;
  OverridePaintNC := False;
  FDroppedDown := False;
  FTempItemIndex := -1;
  FComboBoxHandle := 0;
  FComboBoxInstance := MakeObjectInstance(ComboBoxWndProc);
  FDefComboBoxProc := nil;
end;

destructor TComboBoxExStyleHook.Destroy;
begin
  if FComboBoxHandle  <> 0 then
    SetWindowLong(FComboBoxHandle, GWL_WNDPROC, IntPtr(FDefComboBoxProc));
  FreeObjectInstance(FComboBoxInstance);
  inherited;
end;

procedure TComboBoxExStyleHook.WMParentNotify(var Message: TMessage);
begin
  if TStyleManager.SystemStyle.Enabled then inherited;
end;

procedure TComboBoxExStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

function TComboBoxExStyleHook.IsChildHandle(AHandle: HWnd): Boolean;
var
  FComboEditHandle: HWnd;
begin
  Result := inherited IsChildHandle(AHandle);
  if not Result then
  begin
    FComboEditHandle := SendMessage(Handle, CBEM_GETEDITCONTROL, 0, 0);
    Result := (FComboEditHandle <> 0) and (AHandle = FComboEditHandle);
  end;
end;

procedure TComboBoxExStyleHook.DoHotTrackTimer;
var
  P: TPoint;
  FWindowHandle: HWnd;
begin
  GetCursorPos(P);
  FWindowHandle := WindowFromPoint(P);
  if (FWindowHandle <> FComboBoxHandle) and not IsChildHandle(FWindowHandle) then
  begin
    StopHotTrackTimer;
    MouseInControl := False;
    MouseLeave;
  end;
end;

procedure TComboBoxExStyleHook.MouseLeave;
begin
  MouseOnButton := False;
  PaintComboBoxWnd;
end;

procedure TComboBoxExStyleHook.DrawListBoxItem(ADC: HDC; ARect: TRect; AIndex: Integer; ASelected: Boolean);
var
  Canvas: TCanvas;
  Offset: Integer;
  IconX, IconY: Integer;
  Buffer: TBitMap;
  LCaption: String;
  R: TRect;
  FIconIndex, FInternalImages, FInternalImageWidth,
  FInternalImageHeight, FInternalImagesCount: Integer;
begin
  if (AIndex < 0) or (AIndex >= TComboBoxEx(Control).ItemsEx.Count) then Exit;
  Canvas := TCanvas.Create;
  Canvas.Handle := ADC;
  Buffer := TBitmap.Create;
  Buffer.Width := ARect.Width;
  Buffer.Height := ARect.Height;
  try
    Buffer.Canvas.Font.Assign(TComboBoxEx(Control).Font);
    with Buffer.Canvas do
    begin
      // draw item background
      Brush.Style := bsSolid;
      if ASelected then
      begin
        Brush.Color := clHighLight;
        Font.Color := clHighLightText;
      end
      else
      begin
        if seClient in Control.StyleElements then
          Brush.Color := StyleServices.GetStyleColor(scComboBox)
        else
          Brush.Color := TWinControlClass(Control).Color;
        if seFont in Control.StyleElements then
          Font.Color := StyleServices.GetStyleFontColor(sfComboBoxItemNormal)
        else
          Font.Color := TWinControlClass(Control).Font.Color;
      end;
      FillRect(Rect(0, 0, Buffer.Width, Buffer.Height));
      Offset := TComboExItem(TComboBoxEx(Control).ItemsEx[AIndex]).Indent;
      if Offset > 0 then Offset := (Offset * 10) + 5
      else Offset := 5;
      // draw item image
      FInternalImages := SendMessage(Self.Handle, CBEM_GETIMAGELIST, 0, 0);
      if (TComboBoxEx(Control).Images <> nil) then
        with TComboBoxEx(Control) do
        begin
          IconX := Offset;
          IconY := Buffer.Height div 2 - Images.Height div 2;
          if IconY < 0 then IconY := 0;
          if (ItemsEx[AIndex].ImageIndex >= 0) and
             (ItemsEx[AIndex].ImageIndex < Images.Count) then
              Images.Draw(Buffer.Canvas, IconX, IconY,
              ItemsEx[AIndex].ImageIndex, True);
          Offset := Offset + Images.Width + 5;
        end
      else
       if FInternalImages > 0 then
         with TComboBoxEx(Control) do
         begin
           ImageList_GetIconSize(FInternalImages, FInternalImageWidth, FInternalImageHeight);
           FInternalImagesCount := ImageList_GetImageCount(FInternalImages);
           FIconIndex  := ItemsEx[AIndex].ImageIndex;
           if (FIconIndex  >= 0) and (FIconIndex  < FInternalImagesCount) then
           begin
             IconX := Offset;
             IconY := Buffer.Height div 2 - FInternalImageHeight div 2;
             if IconY < 0 then IconY := 0;
             ImageList_DrawEx(FInternalImages, FIconIndex, Buffer.Canvas.Handle,
               IconX,  IconY,  FInternalImageWidth,
               FInternalImageHeight, CLR_NONE, CLR_NONE, ILD_NORMAL);
             Offset := Offset  + FInternalImageWidth + 5;
           end;
         end;
      // draw item text
      R := Rect(Offset, 0, Buffer.Width, Buffer.Height);
      Buffer.Canvas.Brush.Style := bsClear;
      LCaption := TComboBoxEx(Control).ItemsEx[AIndex].Caption;
      if LCaption <> '' then
         DrawText(Buffer.Canvas.Handle, PWideChar(LCaption), Length(LCaption), R,
           DT_LEFT OR DT_VCENTER or DT_SINGLELINE);
    end;
    Canvas.Draw(ARect.Left, ARect.Top, Buffer);
  finally
    Buffer.Free;
    Canvas.Handle := 0;
    Canvas.Free;
  end;
end;

procedure TComboBoxExStyleHook.ComboBoxWndProc(var Msg: TMessage);
var
  FCallOldProc: Boolean;
  PS: TPaintStruct;
  DC, PaintDC: HDC;
  P: TPoint;
  FOldMouseOnButton: Boolean;
  R: TRect;
begin
  FCallOldProc := True;
  case Msg.Msg of
    WM_CTLCOLORLISTBOX:
     if (ListHandle = 0) and (Msg.LParam <> 0) and (ListBoxInstance = nil) then
       HookListBox(Msg.LParam);
    WM_DRAWITEM:
    begin
      with TWMDrawItem(Msg) do
      begin
        DrawListBoxItem(DrawItemStruct.hDC,
        DrawItemStruct.rcItem,
        DrawItemStruct.itemID,
        DrawItemStruct.itemState and ODS_SELECTED <> 0);
      end;
      FCallOldProc := False;
    end;
    WM_PAINT:
      begin
        DC := HDC(Msg.WParam);
        if DC <> 0 then
          PaintDC := DC
        else
          PaintDC := BeginPaint(FComboBoxHandle, PS);
        try
          DrawComboBox(PaintDC);
        finally
          if DC = 0 then
            EndPaint(FComboBoxHandle, PS);
        end;
        FCallOldProc := False;
      end;
    WM_MOUSEMOVE:
      begin
        if not MouseInControl then
        begin
          MouseInControl := True;
          StartHotTrackTimer;
          MouseEnter;
        end;
        P := Point(TWMMouse(Msg).XPos, TWMMouse(Msg).YPos);
        FOldMouseOnButton := MouseOnButton;
        R := ButtonRect;
        if R.Contains(P) then
          MouseOnButton := True
        else
          MouseOnButton := False;
        if FOldMouseOnButton <> MouseOnButton then
          InvalidateRect(FComboBoxHandle, @R, False);
     end;
  end;
  if FCallOldProc then
    with Msg do
      Result := CallWindowProc(FDefComboBoxProc, FComboBoxHandle, Msg, WParam, LParam);
end;

procedure TComboBoxExStyleHook.PaintComboBoxWnd;
begin
  RedrawWindow(FComboBoxHandle, nil, 0, RDW_INVALIDATE or RDW_UPDATENOW);
end;

procedure TComboBoxExStyleHook.WMNCPaint(var Message: TMessage);
begin
  if FComboBoxHandle = 0 then
    InitComboBoxWnd;
end;

procedure TComboBoxExStyleHook.WMCommand(var Message: TWMCommand);
begin
  CallDefaultProc(TMessage(Message));
  case Message.NotifyCode of
    CBN_SELCHANGE, CBN_SELENDOK,
    CBN_SETFOCUS, CBN_KILLFOCUS:
      PaintComboBoxWnd;
    CBN_DROPDOWN:
      begin
        FTempItemIndex := TCustomComboBoxEx(Control).ItemIndex;
        FDroppedDown := True;
        PaintComboBoxWnd;
      end;
     CBN_CLOSEUP:
      begin
        FDroppedDown := False;
        PaintComboBoxWnd;
      end;
  end;
  Handled := True;
end;

procedure TComboBoxExStyleHook.DrawComboBox(DC: HDC);
var
  Canvas: TCanvas;
  DrawState: TThemedComboBox;
  Details: TThemedElementDetails;
  R: TRect;
  BtnDrawState: TThemedComboBox;
  IconX, IconY: Integer;
  LCaption: string;
  Buffer: TBitmap;
  FIconIndex, FInternalImages, FInternalImageWidth,
  FInternalImageHeight, FInternalImagesCount: Integer;
  IIndex: Integer;
begin
  if not StyleServices.Available or (Control.Width = 0) or (Control.Height = 0) then
    Exit;

  if FDroppedDown then
    IIndex := FTempItemIndex
  else
    IIndex := TComboBoxEx(Control).ItemIndex;

  Canvas := TCanvas.Create;
  try
    Canvas.Handle := DC;
    Buffer := TBitMap.Create;
    try
      Buffer.Width := Control.Width;
      Buffer.Height := Control.Height;
      if not Control.Enabled then
        DrawState := tcBorderDisabled
      else
      if Control.Focused then
        DrawState := tcBorderFocused
      else if MouseInControl then
        DrawState := tcBorderHot
      else
        DrawState := tcBorderNormal;

      R := Rect(0, 0, Control.Width, Control.Height);
      Details := StyleServices.GetElementDetails(DrawState);
      StyleServices.DrawElement(Buffer.Canvas.Handle, Details, R);
      if not (seClient in Control.StyleElements) then
      begin
        R := Control.ClientRect;
        InflateRect(R, -3, -3);
        R.Right := ButtonRect.Left - 2;
        with Buffer.Canvas do
        begin
          Brush.Color := TWinControlClass(Control).Color;
          FillRect(R);
        end;
      end;
      if not Control.Enabled then
        BtnDrawState := tcDropDownButtonDisabled
      else if FDroppedDown then
        BtnDrawState := tcDropDownButtonPressed
      else if MouseOnButton then
        BtnDrawState := tcDropDownButtonHot
      else
        BtnDrawState := tcDropDownButtonNormal;

      if TCustomComboBoxEx(Control).Style <> csExSimple then
      begin
        Details := StyleServices.GetElementDetails(BtnDrawState);
        StyleServices.DrawElement(Buffer.Canvas.Handle, Details, ButtonRect);
      end;

      R := Control.ClientRect;
      InflateRect(R, -3, -3);
      R.Right := ButtonRect.Left - 2;
      Buffer.Canvas.Font.Assign(TComboBoxEx(Control).Font);
      if seFont in Control.StyleElements then
        if Control.Enabled then
          Buffer.Canvas.Font.Color := StyleServices.GetStyleFontColor(sfComboBoxItemNormal)
        else
          Buffer.Canvas.Font.Color := StyleServices.GetStyleFontColor(sfComboBoxItemDisabled);
      if TComboBoxEx(Control).Style = csExDropDownList then
      begin
         if TComboBoxEx(Control).Focused then
           with Buffer.Canvas do
           begin
             if IIndex <> -1 then
             begin
               Brush.Color := clHighLight;
               Brush.Style := bsSolid;
               FillRect(R);
               Font.Color := clHighLightText;
             end;
             DrawFocusRect(R);
           end
         else
           with Buffer.Canvas do
           begin
             Brush.Color := Self.Brush.Color;
             Brush.Style := bsSolid;
             FillRect(R);
           end;
      end;

      if TComboBoxEx(Control).Style <> csExSimple then
      begin
        // draw image
        FInternalImages := SendMessage(Handle, CBEM_GETIMAGELIST, 0, 0);
        if (TComboBoxEx(Control).Images <> nil) and
           (IIndex <> -1) then
          with TComboBoxEx(Control) do
          begin
            IconX := 5;
            IconY := R.Top + R.Height div 2 - Images.Height div 2;
            if IconY < R.Top then IconY := R.Top;

            if (ItemsEx[IIndex].ImageIndex >= 0) and
               (ItemsEx[IIndex].ImageIndex < Images.Count) then
              Images.Draw(Buffer.Canvas, IconX, IconY,
                ItemsEx[IIndex].ImageIndex, Control.Enabled);
            R.Left := IconX + IMages.Width + 5;
          end
        else
          if (FInternalImages > 0) and (IIndex <> -1) then
          with TComboBoxEx(Control) do
          begin
            FIconIndex := ItemsEx[IIndex].ImageIndex;
            ImageList_GetIconSize(FInternalImages, FInternalImageWidth, FInternalImageHeight);
            FInternalImagesCount := ImageList_GetImageCount(FInternalImages);
           if (FIconIndex >= 0) and (FIconIndex < FInternalImagesCount) then
            begin
              IconX := 5;
              IconY := R.Top + R.Height div 2 - FInternalImageHeight div 2;
              if IconY < R.Top then IconY := R.Top;
              ImageList_DrawEx(FInternalImages, FIconIndex, Buffer.Canvas.Handle,
                IconX,  IconY,  FInternalImageWidth,
              FInternalImageHeight, CLR_NONE, CLR_NONE, ILD_NORMAL);
               R.Left := IconX + FInternalImageWidth + 5;
             end;
          end
        else
          Inc(R.Left, 5);
        // draw text
        if (IIndex <> -1) then
        begin
          Buffer.Canvas.Brush.Style := bsClear;
          LCaption := TComboBoxEx(Control).ItemsEx[IIndex].Caption;
          if LCaption <> '' then
            DrawText(Buffer.Canvas.Handle, PWideChar(LCaption), Length(LCaption), R,
              DT_LEFT OR DT_VCENTER or DT_SINGLELINE);
        end;
      end;

      Canvas.Draw(0, 0, Buffer);
    finally
      Buffer.Free;
    end;
  finally
    Canvas.Handle := 0;
    Canvas.Free;
  end;
  Handled := True;
end;

procedure TComboBoxExStyleHook.InitComboBoxWnd;
begin
  if FComboBoxHandle = 0 then
  begin
    FComboBoxHandle := SendMessage(Handle, CBEM_GETCOMBOCONTROL, 0, 0);
    if FComboBoxHandle <> 0 then
    begin
      FDefComboBoxProc := Pointer(GetWindowLong(FComboBoxHandle, GWL_WNDPROC));
      SetWindowLong(FComboBoxHandle, GWL_WNDPROC, IntPtr(FComboBoxInstance));
    end;
  end;
end;

{ TRichEditStyleHook }

procedure TRichEditStyleHook.EMSetBkgndColor(var Message: TMessage);
begin
  if seClient in Control.StyleElements then
  begin
    Message.LParam := ColorToRGB(StyleServices.GetStyleColor(scEdit));
    Handled := False;
  end;
end;

procedure TRichEditStyleHook.EMSetCharFormat(var Message: TMessage);
type
  PCharFormat2 = ^TCharFormat2;
const
  TextColor: array[Boolean] of TStyleFont = (sfEditBoxTextDisabled, sfEditBoxTextNormal);
  BkColor: array[Boolean] of TStyleColor = (scEditDisabled, scEdit);
var
  Format: PCharFormat2;
begin
  Format := PCharFormat2(Message.LParam);
  if (seFont in Control.StyleElements) and (seClient in Control.StyleElements) and
     (Format.dwMask and CFM_COLOR = CFM_COLOR) then
  begin
    Format.crTextColor := ColorToRGB(StyleServices.GetStyleFontColor(TextColor[Control.Enabled]));
    Format.crBackColor := ColorToRGB(StyleServices.GetStyleColor(BkColor[Control.Enabled]));
    Format.dwEffects := Format.dwEffects and not CFE_AUTOCOLOR;
  end;
  Handled := False;
end;

procedure TRichEditStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
  case Message.Msg of
    WM_WINDOWPOSCHANGED:
      begin
        if TWMWindowPosChanged(Message).WindowPos^.flags and SWP_NOSIZE = 0 then
          PaintScroll;
      end;
    CN_NOTIFY:
      begin
        if TWMNotifyRE(Message).NMHdr.code = EN_SELCHANGE then
          PaintScroll;
      end;
  end;
end;

initialization
  ConversionFormatList := TList.Create;
{$IFDEF CLR}
  ConversionFormatList.Add(TObject(TextConversionFormat));
  ConversionFormatList.Add(TObject(RTFConversionFormat));
  InitializeMessages;
{$ELSE}
  ConversionFormatList.Add(@TextConversionFormat);
  ConversionFormatList.Add(@RTFConversionFormat);
{$ENDIF}

finalization
{$IFNDEF CLR}
  if ShellModule <> 0 then FreeLibrary(ShellModule);
  if FRichEditModule <> 0 then FreeLibrary(FRichEditModule);
  FreeConversionFormatList;
{$ENDIF}
end.


