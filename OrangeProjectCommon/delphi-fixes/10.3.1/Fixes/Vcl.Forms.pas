(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2018-11-23　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.3.1(10.3 Release 1)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)
//https://quality.embarcadero.com/browse/RSP-21669

{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.Forms;

{$HPPEMIT LEGACYHPP}
{$P+,S-,W-,R-,T-,H+,X+}
{$C PRELOAD}
{$WARN SYMBOL_PLATFORM OFF}

{$HPPEMIT '#ifndef _WIN64'}
{$HPPEMIT '#pragma link "dwmapi.lib"'}
{$HPPEMIT '#endif //_WIN64'}

{$IFDEF CPUX64}
  {$DEFINE PUREPASCAL}
{$ENDIF CPUX64}

interface

uses
{$IFDEF CLR}
  System.ComponentModel.Design.Serialization, System.Security.Permissions, System.Security,
{$ENDIF}
{$IFDEF LINUX}
  WinUtils, libc,
{$ENDIF}
  System.Messaging,
  Winapi.Messages, Winapi.Windows, System.UITypes, System.SysUtils, System.Classes,
  System.Actions, Vcl.Graphics, Vcl.Menus, Vcl.Controls, Winapi.Imm, Vcl.ActnList,
  Winapi.MultiMon, System.HelpIntfs, Winapi.DwmApi, Vcl.Themes, System.Win.TaskbarCore,
  Winapi.ShellScaling;

(*$HPPEMIT '#if defined(_VCL_ALIAS_RECORDS)' *)
{$IFDEF UNICODE}
(*$HPPEMIT '#if defined(UNICODE)' *)
(*$HPPEMIT '#pragma alias "@Vcl@Forms@TApplication@MessageBoxW$qqrpxbt1i"="@Vcl@Forms@TApplication@MessageBox$qqrpxbt1i"' *)
(*$HPPEMIT '#else' *)
(*$HPPEMIT '#pragma alias "@Vcl@Forms@TApplication@MessageBoxA$qqrpxbt1i"="@Vcl@Forms@TApplication@MessageBox$qqrpxbt1i"' *)
(*$HPPEMIT '#endif' *)
{$ELSE}
(*$HPPEMIT '#if defined(UNICODE)' *)
(*$HPPEMIT '#pragma alias "@Vcl@Forms@TApplication@MessageBoxW$qqrpxct1i"="@Vcl@Forms@TApplication@MessageBox$qqrpxct1i"' *)
(*$HPPEMIT '#else' *)
(*$HPPEMIT '#pragma alias "@Vcl@Forms@TApplication@MessageBoxA$qqrpxct1i"="@Vcl@Forms@TApplication@MessageBox$qqrpxct1i"' *)
(*$HPPEMIT '#endif' *)
{$ENDIF}
(*$HPPEMIT '#endif' *)

const
  caNone        = System.UITypes.TCloseAction.caNone;
  caHide        = System.UITypes.TCloseAction.caHide;
  caFree        = System.UITypes.TCloseAction.caFree;
  caMinimize    = System.UITypes.TCloseAction.caMinimize;

{ TScrollingWinControl }
  wsNormal     = System.UITypes.TWindowState.wsNormal;
  wsMinimized  = System.UITypes.TWindowState.wsMinimized;
  wsMaximized  = System.UITypes.TWindowState.wsMaximized;

  biSystemMenu = System.UITypes.TBorderIcon.biSystemMenu;
  biMinimize   = System.UITypes.TBorderIcon.biMinimize;
  biMaximize   = System.UITypes.TBorderIcon.biMaximize;
  biHelp       = System.UITypes.TBorderIcon.biHelp;

type

{ Forward declarations }

  TScrollingWinControl = class;
  TCustomForm = class;
  TForm = class;
  TMonitor = class;

{ TControlScrollBar }

  TScrollBarKind = (sbHorizontal, sbVertical);
  TScrollBarInc = 1..32767;
  TScrollBarStyle = (ssRegular, ssFlat, ssHotTrack);

  TControlScrollBar = class(TPersistent)
  private
    FControl: TScrollingWinControl;
    FIncrement: TScrollBarInc;
    FPageIncrement: TScrollbarInc;
    FPosition: Integer;
    FRange: Integer;
    FCalcRange: Integer;
    FKind: TScrollBarKind;
    FMargin: Word;
    FVisible: Boolean;
    FTracking: Boolean;
    FScaled: Boolean;
    FSmooth: Boolean;
    FDelay: Integer;
    FButtonSize: Integer;
    FColor: TColor;
    FParentColor: Boolean;
    FSize: Integer;
    FStyle: TScrollBarStyle;
    FThumbSize: Integer;
    FPageDiv: Integer;
    FLineDiv: Integer;
    FUpdateNeeded: Boolean;
    constructor Create(AControl: TScrollingWinControl; AKind: TScrollBarKind);
    procedure CalcAutoRange;
    function ControlSize(ControlSB, AssumeSB: Boolean): Integer;
    procedure DoSetRange(Value: Integer);
    function GetScrollPos: Integer;
    function NeedsScrollBarVisible: Boolean;
    function IsIncrementStored: Boolean;
    procedure ScrollMessage(var Msg: TWMScroll);
    procedure SetButtonSize(Value: Integer);
    procedure SetColor(Value: TColor);
    procedure SetParentColor(Value: Boolean);
    procedure SetPosition(Value: Integer);
    procedure SetRange(Value: Integer);
    procedure SetSize(Value: Integer);
    procedure SetStyle(Value: TScrollBarStyle);
    procedure SetThumbSize(Value: Integer);
    procedure SetVisible(Value: Boolean);
    function IsRangeStored: Boolean;
    procedure Update(ControlSB, AssumeSB: Boolean);
  protected
    procedure Scale(M, D: Integer);
  public
    procedure Assign(Source: TPersistent); override;
    procedure ChangeBiDiPosition;
    property Kind: TScrollBarKind read FKind;
    function IsScrollBarVisible: Boolean;
    property ScrollPos: Integer read GetScrollPos;
  published
    property ButtonSize: Integer read FButtonSize write SetButtonSize default 0;
    property Color: TColor read FColor write SetColor default clBtnHighlight;
    property Increment: TScrollBarInc read FIncrement write FIncrement stored IsIncrementStored default 8;
    property Margin: Word read FMargin write FMargin default 0;
    property ParentColor: Boolean read FParentColor write SetParentColor default True;
    property Position: Integer read FPosition write SetPosition default 0;
    property Range: Integer read FRange write SetRange stored IsRangeStored default 0;
    property Smooth: Boolean read FSmooth write FSmooth default False;
    property Size: Integer read FSize write SetSize default 0;
    property Style: TScrollBarStyle read FStyle write SetStyle default ssRegular;
    property ThumbSize: Integer read FThumbSize write SetThumbSize default 0;
    property Tracking: Boolean read FTracking write FTracking default False;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

{ TScrollingWinControl }

  TWindowState = System.UITypes.TWindowState;
  {$NODEFINE TWindowState}
  {$HPPEMIT OPENNAMESPACE}
  {$HPPEMIT 'using System::Uitypes::TWindowState;'}
  {$HPPEMIT CLOSENAMESPACE}

  TScrollingWinControl = class(TWinControl)
  private
    FAutoRangeCount: Integer;
    FAutoScroll: Boolean;
    FHorzScrollBar: TControlScrollBar;
    FPanPoint: TPoint;
    FUpdatingScrollBars: Boolean;
    FVertScrollBar: TControlScrollBar;
    procedure CalcAutoRange;
    procedure ScaleScrollBars(M, D: Integer);
    procedure SetAutoScroll(Value: Boolean);
    procedure SetHorzScrollBar(Value: TControlScrollBar);
    procedure SetVertScrollBar(Value: TControlScrollBar);
    procedure UpdateScrollBars;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMHScroll(var Message: TWMHScroll); message WM_HSCROLL;
    procedure WMVScroll(var Message: TWMVScroll); message WM_VSCROLL;
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
  protected
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure AlignControls(AControl: TControl; var ARect: TRect); override;
    function AutoScrollEnabled: Boolean; virtual;
    procedure AutoScrollInView(AControl: TControl); virtual;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DoFlipChildren; override;
    procedure DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean); override;
    procedure DoGetGestureOptions(var Gestures: TInteractiveGestures;
      var Options: TInteractiveGestureOptions); override;
    function IsTouchPropertyStored(AProperty: TTouchProperty): Boolean; override;
    property AutoScroll: Boolean read FAutoScroll write SetAutoScroll default False;
    procedure Resizing(State: TWindowState); virtual;
    procedure SendChangeScaleMessage(M, D: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DisableAutoRange;
    procedure EnableAutoRange;
    procedure ScrollInView(AControl: TControl);
  published
    property OnAlignInsertBefore;
    property OnAlignPosition;
    property HorzScrollBar: TControlScrollBar read FHorzScrollBar write SetHorzScrollBar;
    property VertScrollBar: TControlScrollBar read FVertScrollBar write SetVertScrollBar;
  end;

{ TScrollBox }

  TFormBorderStyle = (bsNone, bsSingle, bsSizeable, bsDialog, bsToolWindow,
    bsSizeToolWin);
  TBorderStyle = bsNone..bsSingle;

  TScrollBox = class(TScrollingWinControl)
  private
    FBorderStyle: TBorderStyle;
    class constructor Create;
    class destructor Destroy;
    procedure SetBorderStyle(Value: TBorderStyle);
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure PaintWindow(DC: HDC); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Align;
    property Anchors;
    property AutoScroll default True;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Constraints;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Color nodefault;
    property Ctl3D;
    property Font;
    property Padding;
    property ParentBiDiMode;
    property ParentBackground default False;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property Visible;
    property StyleElements;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
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
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

{ TCustomFrame }

  TCustomFrame = class(TScrollingWinControl)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure PaintWindow(DC: HDC); override;
    procedure SetParent(AParent: TWinControl); override;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  end;

  TCustomFrameClass = class of TCustomFrame;

{ TFrame }

  TFrame = class(TCustomFrame)
  published
    property Align;
    property Anchors;
    property AutoScroll;
    property AutoSize;
    property BiDiMode;
    property Constraints;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Color nodefault;
    property Ctl3D;
    property Font;
    property Padding;
    property ParentBackground default True;
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
    property Touch;
    property Visible;
    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
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
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

{ IDesignerHook }

  IDesignerHook = interface(IDesignerNotify)
{$IF NOT DEFINED(CLR)}
    ['{1E431DA5-2BEA-4DE7-A330-CC45FD2FB1EC}']
{$ENDIF}
    function GetCustomForm: TCustomForm;
    procedure SetCustomForm(Value: TCustomForm);
    function GetIsControl: Boolean;
    procedure SetIsControl(Value: Boolean);
    function IsDesignMsg(Sender: TControl; var Message: TMessage): Boolean;
    procedure PaintGrid;
    procedure PaintMenu;
    procedure ValidateRename(AComponent: TComponent; const CurName, NewName: string);
    function UniqueName(const BaseName: string): string;
    function GetRoot: TComponent;
    property IsControl: Boolean read GetIsControl write SetIsControl;
    property Form: TCustomForm read GetCustomForm write SetCustomForm;
  end;

{ IOleForm }

  IOleForm = interface
{$IF NOT DEFINED(CLR)}
    ['{CD02E1C1-52DA-11D0-9EA6-0020AF3D82DA}']
{$ENDIF}
    procedure OnDestroy;
    procedure OnResize;
  end;

{ TCustomForm }

{$IF DEFINED(CLR)}
  THelpEventData = TObject;
{$ELSE}
  THelpEventData = NativeInt;
{$ENDIF}

  TPopupWnd = record
    ID: Integer;                                                    
    ControlWnd: HWND;
  end;
  TPopupWndArray = array of TPopupWnd;

  TBorderIcon = System.UITypes.TBorderIcon;
  {$NODEFINE TBorderIcon}
  TBorderIcons = System.UITypes.TBorderIcons;
  {$NODEFINE TBorderIcons}

  {$HPPEMIT OPENNAMESPACE}
  {$HPPEMIT 'using System::Uitypes::TBorderIcon;'}
  {$HPPEMIT 'using System::Uitypes::TBorderIcons;'}
  {$HPPEMIT CLOSENAMESPACE}

  TFormStyle = (fsNormal, fsMDIChild, fsMDIForm, fsStayOnTop);
  TPosition = (poDesigned, poDefault, poDefaultPosOnly, poDefaultSizeOnly,
    poScreenCenter, poDesktopCenter, poMainFormCenter, poOwnerFormCenter);
  TDefaultMonitor = (dmDesktop, dmPrimary, dmMainForm, dmActiveForm);
  TPrintScale = (poNone, poProportional, poPrintToFit);
  TShowAction = (saIgnore, saRestore, saMinimize, saMaximize);
  TTileMode = (tbHorizontal, tbVertical);
  TCloseAction = System.UITypes.TCloseAction;
  {$NODEFINE TCloseAction}
  {$HPPEMIT OPENNAMESPACE}
  {$HPPEMIT 'using System::Uitypes::TCloseAction;'}
  {$HPPEMIT CLOSENAMESPACE}
  TCloseEvent = procedure(Sender: TObject; var Action: TCloseAction) of object;
  TCloseQueryEvent = procedure(Sender: TObject;
    var CanClose: Boolean) of object;
  TFormState = set of (fsCreating, fsVisible, fsShowing, fsModal,
    fsCreatedMDIChild, fsActivated);
  TShortCutEvent = procedure (var Msg: TWMKey; var Handled: Boolean) of object;
  THelpEvent = function(Command: Word; Data: THelpEventData; var CallHelp: Boolean): Boolean of object;
  TMonitorDpiChangedEvent = procedure(Sender: TObject; OldDPI: Integer; NewDPI: Integer) of object;
  TPopupMode = (pmNone, pmAuto, pmExplicit);

  TGlassFrame = class(TPersistent)
  private
    FClient: TCustomForm;
    FEnabled: Boolean;
    FLeft: Integer;
    FTop: Integer;
    FRight: Integer;
    FBottom: Integer;
    FOnChange: TNotifyEvent;
    FSheetOfGlass: Boolean;
    procedure SetEnabled(Value: Boolean);
    procedure SetExtendedFrame(Index: Integer; Value: Integer);
    procedure SetSheetOfGlass(Value: Boolean);
  protected
    procedure Change; virtual;
  public
    constructor Create(Client: TCustomForm);
    procedure Assign(Source: TPersistent); override;
    function FrameExtended: Boolean;
    function IntersectsControl(Control: TControl): Boolean;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default False;
    property Left: Integer index 0 read FLeft write SetExtendedFrame default 0;
    property Top: Integer index 1 read FTop write SetExtendedFrame default 0;
    property Right: Integer index 2 read FRight write SetExtendedFrame default 0;
    property Bottom: Integer index 3 read FBottom write SetExtendedFrame default 0;
    property SheetOfGlass: Boolean read FSheetOfGlass write SetSheetOfGlass default False;
  end;

{$IF DEFINED(CLR)}
  {IMDIForm is an interface for accessing MDI-related methods
   of a TCustomForm instance. }
  IMDIForm = interface
    function GetFormStyle: TFormStyle;
    function get_ActiveMDIChild: TForm;
    function get_MDIChildCount: Integer;
    function get_MDIChildren(I: Integer): TForm;
    property ActiveMDIChild: TForm read get_ActiveMDIChild;
    property MDIChildCount: Integer read get_MDIChildCount;
    property MDIChildren[I: Integer]: TForm read get_MDIChildren;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
  TCustomForm = class(TScrollingWinControl, IMDIForm, IServiceProvider)
{$ELSE}
  TCustomForm = class(TScrollingWinControl)
{$ENDIF}
  private
    FTaskbarHandler: TTaskbarHandler;
    FActiveControl: TWinControl;
    FFocusedControl: TWinControl;
    FBorderIcons: TBorderIcons;
    FBorderStyle: TFormBorderStyle;
    FWindowState: TWindowState;
    FShowAction: TShowAction;
    FKeyPreview: Boolean;
    FActive: Boolean;
    FFormStyle: TFormStyle;
    FPosition: TPosition;
    FDefaultMonitor: TDefaultMonitor;
    FTileMode: TTileMode;
    FDropTarget: Boolean;
    FPrintScale: TPrintScale;
    FCanvas: TControlCanvas;
    FHelpFile: string;
    FIcon: TIcon;
    FInCMParentBiDiModeChanged: Boolean;
    FMenu: TMainMenu;
    FModalResult: TModalResult;
    FDesigner: IDesignerHook;
    FWindowMenu: TMenuItem;
    FPixelsPerInch: Integer;
    FScaled: Boolean;
    FObjectMenuItem: TMenuItem;
    FOleForm: IOleForm;
    FClientWidth: Integer;
    FClientHeight: Integer;
    FTextHeight: Integer;
    FDefClientProc: TFarProc;
    FActiveOleControl: TWinControl;
    FSavedBorderStyle: TFormBorderStyle;
    FOnActivate: TNotifyEvent;
    FOnAfterMonitorDpiChanged: TMonitorDpiChangedEvent;
    FOnBeforeMonitorDpiChanged: TMonitorDpiChangedEvent;
    FOnClose: TCloseEvent;
    FOnCloseQuery: TCloseQueryEvent;
    FOnDeactivate: TNotifyEvent;
    FOnHelp: THelpEvent;
    FOnHide: TNotifyEvent;
    FOnPaint: TNotifyEvent;
    FOnShortCut: TShortCutEvent;
    FOnShow: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FAlphaBlend: Boolean;
    FAlphaBlendValue: Byte;
    FPopupChildren: TList;
    FPopupMode: TPopupMode;
    FPopupParent: TCustomForm;
    FRecreateChildren: TList;
    FPopupWnds: TPopupWndArray;
    FInternalPopupParent: TCustomForm;
    FInternalPopupParentWnd: HWND;
    FScreenSnap: Boolean;
    FSnapBuffer: Integer;
    FTransparentColor: Boolean;
    FTransparentColorValue: TColor;
    FCreatingMainForm: Boolean;
    FGlassFrame: TGlassFrame;
    FRefreshGlassFrame: Boolean;
{$IF DEFINED(CLR)}
    FClientHandle: THWndWrapper;
{$ELSE}
    FOldCreateOrder: Boolean;
    FClientHandle: HWND;
    FClientInstance: TFarProc;
{$ENDIF}
    class constructor Create;
    class destructor Destroy;
    procedure RefreshMDIMenu;
    function GetCanvas: TCanvas;
    function GetIconHandle: HICON;
    function GetLeft: Integer;
    function GetMonitor: TMonitor;
    function GetPixelsPerInch: Integer;
    function GetPopupChildren: TList;
    function GetRecreateChildren: TList;
    function GetScaled: Boolean;
    function GetTextHeight: Integer;
    function GetTop: Integer;
    procedure IconChanged(Sender: TObject);
    function IsAutoScrollStored: Boolean;
    function IsClientSizeStored: Boolean;
    function IsForm: Boolean;
    function IsFormSizeStored: Boolean;
    function IsIconStored: Boolean;
    procedure MergeMenu(MergeState: Boolean);
    procedure ReadIgnoreFontProperty(Reader: TReader);
    procedure ReadTextHeight(Reader: TReader);
    procedure SetActive(Value: Boolean);
    procedure SetActiveControl(Control: TWinControl);
    procedure SetBorderIcons(Value: TBorderIcons);
    procedure SetBorderStyle(Value: TFormBorderStyle);
    procedure SetClientHeight(Value: Integer);
    procedure SetClientWidth(Value: Integer);
    procedure SetDesigner(ADesigner: IDesignerHook);
    procedure SetFormStyle(Value: TFormStyle);
    procedure SetTaskbarHandler(Value: TTaskbarHandler);
    procedure SetIcon(Value: TIcon);
    procedure SetLeft(Value: Integer);
    procedure SetMenu(Value: TMainMenu);
    procedure SetPixelsPerInch(Value: Integer);
    procedure SetPosition(Value: TPosition);
    procedure SetPopupMode(Value: TPopupMode);
    procedure SetScaled(Value: Boolean);
    procedure SetTop(Value: Integer);
    procedure SetVisible(Value: Boolean);
    procedure SetWindowFocus;
    procedure SetWindowMenu(Value: TMenuItem);
    procedure SetObjectMenuItem(Value: TMenuItem);
    procedure SetWindowState(Value: TWindowState);
    procedure SetWindowToMonitor;
    procedure ScaleForPPIRect(NewPPI: Integer; NewRect: PRect);
    procedure ScaleConstraints(M, D: Integer; SizeChanged: Boolean);
    procedure ScaleNormalSize(M, D: Integer);
    procedure WritePixelsPerInch(Writer: TWriter);
    procedure WriteTextHeight(Writer: TWriter);
    function NormalColor: TColor;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMIconEraseBkgnd(var Message: TWMEraseBkgnd); message WM_ICONERASEBKGND;
    procedure WMQueryDragIcon(var Message: TWMQueryDragIcon); message WM_QUERYDRAGICON;
    procedure WMNCCreate(var Message: TWMNCCreate); message WM_NCCREATE;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown(var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMDestroy(var Message: TWMDestroy); message WM_DESTROY;
    procedure WMCommand(var Message: TWMCommand); message WM_COMMAND;
    procedure WMInitMenuPopup(var Message: TWMInitMenuPopup); message WM_INITMENUPOPUP;
    procedure WMMenuChar(var Message: TWMMenuChar); message WM_MENUCHAR;
    procedure WMMenuSelect(var Message: TWMMenuSelect); message WM_MENUSELECT;
    procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
    procedure WMClose(var Message: TWMClose); message WM_CLOSE;
    procedure WMQueryEndSession(var Message: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMShowWindow(var Message: TWMShowWindow); message WM_SHOWWINDOW;
    procedure WMMDIActivate(var Message: TWMMDIActivate); message WM_MDIACTIVATE;
    procedure WMNextDlgCtl(var Message: TWMNextDlgCtl); message WM_NEXTDLGCTL;
    procedure WMEnterMenuLoop(var Message: TMessage); message WM_ENTERMENULOOP;
    procedure WMHelp(var Message: TWMHelp); message WM_HELP;
    procedure WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMSettingChange(var Message: TMessage); message WM_SETTINGCHANGE;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMGestureNotify(var Message: TWMGestureNotify); message WM_GESTURENOTIFY;
    procedure WMDwmSendIconicLivePreviewBitmap(var Message: TMessage); message WM_DWMSENDICONICLIVEPREVIEWBITMAP;
    procedure WMDwmSendIconicThumbnail(var Message: TMessage); message WM_DWMSENDICONICTHUMBNAIL;
    procedure WMDpiChanged(var Message: TWMDpi); message WM_DPICHANGED;
    procedure CMActivate(var Message: TCMActivate); message CM_ACTIVATE;
    procedure CMAppSysCommand(var Message: TMessage); message CM_APPSYSCOMMAND;
    procedure CMBiDiModeChanged(var Message: TMessage); message CM_BIDIMODECHANGED;
    procedure CMDeactivate(var Message: TCMDeactivate); message CM_DEACTIVATE;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMMenuChanged(var Message: TMessage); message CM_MENUCHANGED;
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
    procedure CMIconChanged(var Message: TMessage); message CM_ICONCHANGED;
    procedure CMRelease(var Message: TMessage); message CM_RELEASE;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMUIActivate(var Message); message CM_UIACTIVATE;
    procedure CMParentBiDiModeChanged(var Message: TMessage); message CM_PARENTBIDIMODECHANGED;
    procedure CMParentFontChanged(var Message: TCMParentFontChanged); message CM_PARENTFONTCHANGED;
    procedure CMPopupHwndDestroy(var Message: TCMPopupHWndDestroy); message CM_POPUPHWNDDESTROY;
    procedure CMUpdateActions(var Message: TMessage); message CM_UPDATEACTIONS;
    procedure CMIsShortCut(var Message: TWMKey); message CM_ISSHORTCUT;
    procedure SetActiveOleControl(Control: TWinControl);
    procedure SetLayeredAttribs;
    procedure SetAlphaBlend(const Value: Boolean);
    procedure SetAlphaBlendValue(const Value: Byte);
    procedure SetTransparentColor(const Value: Boolean);
    procedure SetTransparentColorValue(const Value: TColor);
    procedure InitAlphaBlending(var Params: TCreateParams);
    procedure SetGlassFrame(const Value: TGlassFrame);
    procedure UpdateGlassFrame(Sender: TObject);
    procedure UpdateGlassFrameControls(const Rect: TRect);
{$IF DEFINED(CLR)}
    function GetClientHandle: HWND;
    function GetFormStyle: TFormStyle;
    procedure IgnoreIdent(Reader: TReader);
    function ActionExecute(Action: TBasicAction): Boolean;
    function ActionUpdate(Action: TBasicAction): Boolean;
{$ELSE}
    procedure CMActionExecute(var Message: TMessage); message CM_ACTIONEXECUTE;
    procedure CMActionUpdate(var Message: TMessage); message CM_ACTIONUPDATE;
{$ENDIF}
{$IF DEFINED(CLR)}
  strict protected
    function GetService(AType: System.Type): TObject; override;
{$ENDIF}
  protected
    FFormState: TFormState;
    procedure Activate; dynamic;
    procedure ActiveChanged; dynamic;
    procedure AlignControls(AControl: TControl; var Rect: TRect); override;
    procedure BeginAutoDrag; override;
    procedure ChangeScale(M, D: Integer; isDpiChange: Boolean); override;
    procedure ClientWndProc(var Message: TMessage); virtual;
    procedure CloseModal;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure Deactivate; dynamic;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DestroyHandle; override;
    procedure DestroyWindowHandle; override;
    procedure DoClose(var Action: TCloseAction); dynamic;
    procedure DoCreate; virtual;
    procedure DoDestroy; virtual;
    procedure DoHide; dynamic;
    procedure DoShow; dynamic;
    procedure DoThumbButtonNotify(ItemID: Word); virtual;
    procedure DoWindowPreviewRequest; virtual;
    procedure DoThumbPreviewRequest(APreviewHeight, APreviewWidth: Word); virtual;
    procedure GetBorderIconStyles(var Style, ExStyle: Cardinal); dynamic;
    procedure GetBorderStyles(var Style, ExStyle, ClassStyle: Cardinal); dynamic;
    function GetClientRect: TRect; override;
    function GetFloating: Boolean; override;
    function GetInternalTextHeight: Integer;
    function GetOwnerWindow: HWND; dynamic;
    function HandleCreateException: Boolean; dynamic;
    procedure InitializeNewForm; dynamic;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Paint; dynamic;
    procedure PaintWindow(DC: HDC); override;
    function PaletteChanged(Foreground: Boolean): Boolean; override;
    function GetDesignDpi: Integer; override;
    /// <summary>
    /// Checks if there is a change in dpi and perform the necessary changes to scale all
    /// the controls for the new dpi
    /// </summary>
    procedure ScaleForCurrentDpi; virtual;
    procedure ReadState(Reader: TReader); override;
    procedure RequestAlign; override;
    procedure SetChildOrder(Child: TComponent; Order: Integer); override;
    procedure SetParentBiDiMode(Value: Boolean); override;
    procedure DoDock(NewDockSite: TWinControl; var ARect: TRect); override;
    procedure SetParent(AParent: TWinControl); override;
    procedure UpdateActions; virtual;
    procedure UpdateWindowState;
    procedure ValidateRename(AComponent: TComponent;
      const CurName, NewName: string); override;
    procedure VisibleChanging; override;
    procedure WndProc(var Message: TMessage); override;
    procedure Resizing(State: TWindowState); override;
    function get_ActiveMDIChild: TForm;
    function get_MDIChildCount: Integer;
    function get_MDIChildren(I: Integer): TForm;
{$IF NOT DEFINED(CLR)}
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
{$ENDIF}
    property ActiveMDIChild: TForm read get_ActiveMDIChild;
    property AlphaBlend: Boolean read FAlphaBlend write SetAlphaBlend;
    property AlphaBlendValue: Byte read FAlphaBlendValue write SetAlphaBlendValue;
    property BorderIcons: TBorderIcons read FBorderIcons write SetBorderIcons stored IsForm
      default [biSystemMenu, biMinimize, biMaximize];
    property AutoScroll stored IsAutoScrollStored;
    property ClientHeight write SetClientHeight stored IsClientSizeStored;
    property ClientWidth write SetClientWidth stored IsClientSizeStored;
    property TransparentColor: Boolean read FTransparentColor write SetTransparentColor;
    property TransparentColorValue: TColor read FTransparentColorValue write SetTransparentColorValue;
    property Ctl3D default True;
    property DefaultMonitor: TDefaultMonitor read FDefaultMonitor write FDefaultMonitor
      stored IsForm default dmActiveForm;
    property HorzScrollBar stored IsForm;
    property Icon: TIcon read FIcon write SetIcon stored IsIconStored;
    property MDIChildCount: Integer read get_MDIChildCount;
    property MDIChildren[I: Integer]: TForm read get_MDIChildren;
    property ObjectMenuItem: TMenuItem read FObjectMenuItem write SetObjectMenuItem
      stored IsForm;
    property PixelsPerInch: Integer read GetPixelsPerInch write SetPixelsPerInch
      stored False;
    property ParentFont default False;
    property PopupMenu stored IsForm;
    property PopupChildren: TList read GetPopupChildren;
    property Position: TPosition read FPosition write SetPosition stored IsForm
      default poDefaultPosOnly;
    property PrintScale: TPrintScale read FPrintScale write FPrintScale stored IsForm
      default poProportional;
    property Scaled: Boolean read GetScaled write SetScaled stored IsForm default True;
    property TileMode: TTileMode read FTileMode write FTileMode default tbHorizontal;
    property VertScrollBar stored IsForm;
    property Visible write SetVisible default False;
    property WindowMenu: TMenuItem read FWindowMenu write SetWindowMenu stored IsForm;
{$IF DEFINED(CLR)}
    property ClientHandle: HWND read GetClientHandle;
    property FormStyle: TFormStyle read GetFormStyle write SetFormStyle
      stored IsForm default fsNormal;
{$ELSE}
    property ClientHandle: HWND read FClientHandle;
    property FormStyle: TFormStyle read FFormStyle write SetFormStyle
      stored IsForm default fsNormal;
    property Height stored IsFormSizeStored;
    property OldCreateOrder: Boolean read FOldCreateOrder write FOldCreateOrder;
    property Width stored IsFormSizeStored;
{$ENDIF}
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate stored IsForm;
    property OnAfterMonitorDpiChanged: TMonitorDpiChangedEvent read FOnAfterMonitorDpiChanged write FOnAfterMonitorDpiChanged stored IsForm;
    property OnBeforeMonitorDpiChanged: TMonitorDpiChangedEvent read FOnBeforeMonitorDpiChanged write FOnBeforeMonitorDpiChanged stored IsForm;
    property OnCanResize stored IsForm;
    property OnClick stored IsForm;
    property OnClose: TCloseEvent read FOnClose write FOnClose stored IsForm;
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery
      stored IsForm;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate stored IsForm;
    property OnDblClick stored IsForm;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy stored IsForm;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate stored IsForm;
    property OnDragDrop stored IsForm;
    property OnDragOver stored IsForm;
    property OnHelp: THelpEvent read FOnHelp write FOnHelp;
    property OnHide: TNotifyEvent read FOnHide write FOnHide stored IsForm;
    property OnKeyDown stored IsForm;
    property OnKeyPress stored IsForm;
    property OnKeyUp stored IsForm;
    property OnMouseActivate stored IsForm;
    property OnMouseDown stored IsForm;
    property OnMouseMove stored IsForm;
    property OnMouseUp stored IsForm;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint stored IsForm;
    property OnResize stored IsForm;
    property OnShortCut: TShortCutEvent read FOnShortCut write FOnShortCut;
    property OnShow: TNotifyEvent read FOnShow write FOnShow stored IsForm;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer  = 0); virtual;
    destructor Destroy; override;
    procedure ScaleForPPI(NewPPI: Integer); override;
    procedure Close;
    function CloseQuery: Boolean; virtual;
    procedure DefaultHandler(var Message); override;
    procedure DefocusControl(Control: TWinControl; Removing: Boolean);
    procedure Dock(NewDockSite: TWinControl; ARect: TRect); override;
    procedure FocusControl(Control: TWinControl);
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function GetFormImage: TBitmap;
    procedure Hide;
    function IsShortCut(var Message: TWMKey): Boolean; dynamic;
    procedure MakeFullyVisible(AMonitor: TMonitor = nil);
    procedure MouseWheelHandler(var Message: TMessage); override;
    procedure Print;
    procedure RecreateAsPopup(AWindowHandle: HWND);
    procedure Release;
    procedure SendCancelMode(Sender: TControl);
    procedure SetFocus; override;
    function SetFocusedControl(Control: TWinControl): Boolean; virtual;
    procedure Show;
    function ShowModal: Integer; virtual;
    function WantChildKey(Child: TControl; var Message: TMessage): Boolean; virtual;
    procedure set_PopupParent(Value: TCustomForm);
{$IF DEFINED(CLR)}
    function GetRootDesigner: IDesignerNotify; override;
    function get_PopupParent: TCustomForm;
{$ELSE}
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
{$ENDIF}
    property Active: Boolean read FActive;
    property ActiveControl: TWinControl read FActiveControl write SetActiveControl
      stored IsForm;
    property Action;
    property ActiveOleControl: TWinControl read FActiveOleControl write SetActiveOleControl;
    property BorderStyle: TFormBorderStyle read FBorderStyle write SetBorderStyle
      stored IsForm default bsSizeable;
    property Canvas: TCanvas read GetCanvas;
    property Caption stored IsForm;
    property Color nodefault;
    property Designer: IDesignerHook read FDesigner write SetDesigner;
    property DropTarget: Boolean read FDropTarget write FDropTarget;
    property Font;
    property FormState: TFormState read FFormState;
    property GlassFrame: TGlassFrame read FGlassFrame write SetGlassFrame;
    property HelpFile: string read FHelpFile write FHelpFile;
    property KeyPreview: Boolean read FKeyPreview write FKeyPreview
      stored IsForm default False;
    property Menu: TMainMenu read FMenu write SetMenu stored IsForm;
    property ModalResult: TModalResult read FModalResult write FModalResult;
    property Monitor: TMonitor read GetMonitor;
    property OleFormObject: IOleForm read FOleForm write FOleForm;
    property PopupMode: TPopupMode read FPopupMode write SetPopupMode default pmNone;
    property ScreenSnap: Boolean read FScreenSnap write FScreenSnap default False;
    property SnapBuffer: Integer read FSnapBuffer write FSnapBuffer;
    property WindowState: TWindowState read FWindowState write SetWindowState
      stored IsForm default wsNormal;
{$IF DEFINED(CLR)}
                                                                   
    property Height stored IsFormSizeStored;
    property PopupParent: TCustomForm read get_PopupParent write set_PopupParent;
    property Width stored IsFormSizeStored;
{$ELSE}
    property PopupParent: TCustomForm read FPopupParent write set_PopupParent;
{$ENDIF}
    property TaskbarHandler: TTaskbarHandler read FTaskbarHandler write SetTaskbarHandler;
  published
    property Left: Integer read GetLeft write SetLeft;
    property Top: Integer read GetTop write SetTop;
  end;

  TCustomFormClass = class of TCustomForm;

  { TCustomActiveForm }

  TActiveFormBorderStyle = (afbNone, afbSingle, afbSunken, afbRaised);

  TCustomActiveForm = class(TCustomForm)
  private
    FAxBorderStyle: TActiveFormBorderStyle;
    procedure SetAxBorderStyle(Value: TActiveFormBorderStyle);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
    function WantChildKey(Child: TControl; var Message: TMessage): Boolean; override;
    property Visible;
  published
    property ActiveControl;
    property Anchors;
    property AutoScroll;
    property AutoSize;
    property AxBorderStyle: TActiveFormBorderStyle read FAxBorderStyle
      write SetAxBorderStyle default afbSingle;
    property BorderWidth;
    property Caption stored True;
    property Color;
    property Constraints;
    property Font;
    property Height stored True;
    property HorzScrollBar;
    property KeyPreview;
    property Padding;
{$IF NOT DEFINED(CLR)}
    property OldCreateOrder;
{$ENDIF}
    property PixelsPerInch;
    property PopupMenu;
    property PrintScale;
    property Scaled;
    property ShowHint;
    property VertScrollBar;
    property Width stored True;
    property OnActivate;
    property OnAfterMonitorDpiChanged;
    property OnBeforeMonitorDpiChanged;
    property OnClick;
    property OnCreate;
    property OnContextPopup;
    property OnDblClick;
    property OnDestroy;
    property OnDeactivate;
    property OnDragDrop;
    property OnDragOver;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnPaint;
  end;

{ TForm }

  TForm = class(TCustomForm)
  strict private
    class constructor Create;
    class destructor Destroy;
  public
    procedure ArrangeIcons;
    procedure Cascade;
    procedure Next;
    procedure Previous;
    procedure Tile;
    property ActiveMDIChild;
    property ClientHandle;
    property DockManager;
    property MDIChildCount;
    property MDIChildren;
    property TileMode;
  published
    property Action;
    property ActiveControl;
    property Align;
    property AlphaBlend default False;
    property AlphaBlendValue default 255;
    property Anchors;
    property AutoScroll;
    property AutoSize;
    property BiDiMode;
    property BorderIcons;
    property BorderStyle;
    property BorderWidth;
    property Caption;
    property ClientHeight;
    property ClientWidth;
    property Color;
    property TransparentColor default False;
    property TransparentColorValue default 0;
    property Constraints;
    property Ctl3D;
    property UseDockManager;
    property DefaultMonitor;
    property DockSite;
    property DoubleBuffered default False;
    property DragKind;
    property DragMode;
    property Enabled;
    property ParentFont default False;
    property Font;
    property FormStyle;
    property GlassFrame;
    property Height;
    property HelpFile;
    property HorzScrollBar;
    property Icon;
    property KeyPreview;
    property Padding;
    property Menu;
{$IF NOT DEFINED(CLR)}
    property OldCreateOrder;
{$ENDIF}
    property ObjectMenuItem;
    property ParentBiDiMode;
    property PixelsPerInch;
    property PopupMenu;
    property PopupMode;
    property PopupParent;
    property Position;
    property PrintScale;
    property Scaled;
    property ScreenSnap default False;
    property ShowHint;
    property SnapBuffer default 10;
    property Touch;
    property TipMode;
    property VertScrollBar;
    property Visible;
    property Width;
    property WindowState;
    property WindowMenu;
    property StyleElements;
    property OnActivate;
    property OnAfterMonitorDpiChanged;
    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnBeforeMonitorDpiChanged;
    property OnCanResize;
    property OnClick;
    property OnClose;
    property OnCloseQuery;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnCreate;
    property OnDblClick;
    property OnDestroy;
    property OnDeactivate;
    property OnDockDrop;
    property OnDockOver;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnGesture;
    property OnGetSiteInfo;
    property OnHide;
    property OnHelp;
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
    property OnPaint;
    property OnResize;
    property OnShortCut;
    property OnShow;
    property OnStartDock;
    property OnUnDock;
  end;

  TFormClass = class of TForm;

{ TCustomDockForm }

  TCustomDockForm = class(TCustomForm)
  private
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown(var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure CMDockNotification(var Message: TCMDockNotification); message CM_DOCKNOTIFICATION;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
{$IF NOT DEFINED(CLR)}
    procedure CMControlListChange(var Message: TMessage); message CM_CONTROLLISTCHANGE;
    procedure CMUnDockClient(var Message: TCMUnDockClient); message CM_UNDOCKCLIENT;
{$ENDIF}
  protected
    procedure DoAddDockClient(Client: TControl; const ARect: TRect); override;
    procedure DoRemoveDockClient(Client: TControl); override;
    procedure GetSiteInfo(Client: TControl; var InfluenceRect: TRect;
      MousePos: TPoint; var CanDock: Boolean); override;
    procedure Loaded; override;
{$IF DEFINED(CLR)}
    function UndockClient(NewTarget, Client: TControl): Boolean; override;
    procedure ControlListChange(Inserting: Boolean; Child: TControl); override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    property AutoScroll default False;
    property BorderStyle default bsSizeToolWin;
    property FormStyle default fsStayOnTop;
  published
    property PixelsPerInch;
  end;

{ TMonitor }

  TMonitor = class(TObject)
  private
    FHandle: HMONITOR;
    FMonitorNum: Integer;
    function GetLeft: Integer;
    function GetHeight: Integer;
    function GetTop: Integer;
    function GetWidth: Integer;
    function GetBoundsRect: TRect;
    function GetWorkareaRect: TRect;
    function GetPrimary: Boolean;
    function GetPixelsPerInch: Integer;
  public
    property Handle: HMONITOR read FHandle;
    property MonitorNum: Integer read FMonitorNum;
    property Left: Integer read GetLeft;
    property Height: Integer read GetHeight;
    property Top: Integer read GetTop;
    property Width: Integer read GetWidth;
    property BoundsRect: TRect read GetBoundsRect;
    property WorkareaRect: TRect read GetWorkareaRect;
    property Primary: Boolean read GetPrimary;
    property PixelsPerInch: Integer read GetPixelsPerInch;
  end;

{ TScreen }

{$IF DEFINED(CLR)}
  TCursorRec = class
    Next: TCursorRec;
    Index: Integer;
    Handle: HCURSOR;
  end;
  TCursorRecType = TCursorRec;

  TCursorInfo = class
  private
    FList: TCursorRec;
    FDefaultCursor: HCursor;
  strict protected
    procedure Finalize; override;
  end;
{$ELSE}
  PCursorRec = ^TCursorRec;
  TCursorRec = record
    Next: PCursorRec;
    Index: Integer;
    Handle: HCURSOR;
  end;
  TCursorRecType = PCursorRec;
{$ENDIF}

  TMonitorDefaultTo = (mdNearest, mdNull, mdPrimary);

  [RootDesignerSerializerAttribute('', '', False)]
  TScreen = class(TComponent)
  private
    FFonts: TStrings;
    FImes: TStrings;
    FDefaultIme: string;
    FDefaultKbLayout: HKL;
    FPixelsPerInch: Integer;
    FCursor: TCursor;
    FCursorCount: Integer;
    FForms: TList;
    FCustomForms: TList;
    FDataModules: TList;
    FMonitors: TList;
    FActiveControl: TWinControl;
    FActiveCustomForm: TCustomForm;
    FActiveForm: TForm;
    FLastActiveControl: TWinControl;
    FLastActiveCustomForm: TCustomForm;
    FFocusedForm: TCustomForm;
    FSaveFocusedList: TList;
    FHintFont: TFont;
    FIconFont: TFont;
    FMenuFont: TFont;
    FMessageFont: TFont;
    FCaptionFont: TFont;
    FAlignLevel: Word;
    FControlState: TControlState;
    FOnActiveControlChange: TNotifyEvent;
    FOnActiveFormChange: TNotifyEvent;
{$IF DEFINED(CLR)}
    FCursorList: TCursorInfo;
{$ELSE}
    FCursorList: PCursorRec;
    FDefaultCursor: HCURSOR;
{$ENDIF}
    FUpdatingAllFonts: Boolean;
    procedure AlignForm(AForm: TCustomForm);
    procedure AlignForms(AForm: TCustomForm; var Rect: TRect);
    procedure AddDataModule(DataModule: TDataModule);
    procedure AddForm(AForm: TCustomForm);
    procedure ClearMonitors;
    procedure CreateCursors;
    procedure DeleteCursor(Index: Integer);
    procedure DestroyCursors;
    function FindMonitor(Handle: HMONITOR): TMonitor;
    procedure IconFontChanged(Sender: TObject);
    function GetCustomFormCount: Integer;
    function GetCustomForms(Index: Integer): TCustomForm;
    function GetCursors(Index: Integer): HCURSOR;
    function GetDataModule(Index: Integer): TDataModule;
    function GetDataModuleCount: Integer;
    function GetDefaultIME: String;
    function GetDesktopTop: Integer;
    function GetDesktopLeft: Integer;
    function GetDesktopHeight: Integer;
    function GetDesktopWidth: Integer;
    function GetDesktopRect: TRect;
    function GetWorkAreaRect: TRect;
    function GetWorkAreaHeight: Integer;
    function GetWorkAreaLeft: Integer;
    function GetWorkAreaTop: Integer;
    function GetWorkAreaWidth: Integer;
    function GetImes: TStrings;
    function GetHeight: Integer;
    function GetMonitor(Index: Integer): TMonitor;
    function GetMonitorCount: Integer;
    procedure GetMonitors;
    function GetFonts: TStrings;
    function GetForm(Index: Integer): TForm;
    function GetFormCount: Integer;
    procedure GetMetricSettings;
    function GetWidth: Integer;
    procedure InsertCursor(Index: Integer; Handle: HCURSOR);
    procedure RemoveDataModule(DataModule: TDataModule);
    procedure RemoveForm(AForm: TCustomForm);
    procedure SetCaptionFont(Value: TFont);
    procedure SetCursors(Index: Integer; Handle: HCURSOR);
    procedure SetCursor(Value: TCursor);
    procedure SetHintFont(Value: TFont);
    procedure SetIconFont(Value: TFont);
    procedure SetMenuFont(Value: TFont);
    procedure SetMessageFont(Value: TFont);
    procedure UpdateLastActive;
    function GetPrimaryMonitor: TMonitor;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DisableAlign;
    procedure EnableAlign;
    function MonitorFromPoint(const Point: TPoint;
      MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor;
    function MonitorFromRect(const Rect: TRect;
      MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor;
    function MonitorFromWindow(const Handle: THandle;
      MonitorDefault: TMonitorDefaultTo = mdNearest): TMonitor;
    procedure Realign; inline;
    procedure ResetFonts;
    property ActiveControl: TWinControl read FActiveControl;
    property ActiveCustomForm: TCustomForm read FActiveCustomForm;
    property ActiveForm: TForm read FActiveForm;
    property CustomFormCount: Integer read GetCustomFormCount;
    property CustomForms[Index: Integer]: TCustomForm read GetCustomForms;
    property CursorCount: Integer read FCursorCount;
    property Cursor: TCursor read FCursor write SetCursor;
    property Cursors[Index: Integer]: HCURSOR read GetCursors write SetCursors;
    property DataModules[Index: Integer]: TDataModule read GetDataModule;
    property DataModuleCount: Integer read GetDataModuleCount;
    property FocusedForm: TCustomForm read FFocusedForm write FFocusedForm;
    property SaveFocusedList: TList read FSaveFocusedList;
    property MonitorCount: Integer read GetMonitorCount;
    property Monitors[Index: Integer]: TMonitor read GetMonitor;
    property DesktopRect: TRect read GetDesktopRect;
    property DesktopHeight: Integer read GetDesktopHeight;
    property DesktopLeft: Integer read GetDesktopLeft;
    property DesktopTop: Integer read GetDesktopTop;
    property DesktopWidth: Integer read GetDesktopWidth;
    property WorkAreaRect: TRect read GetWorkAreaRect;
    property WorkAreaHeight: Integer read GetWorkAreaHeight;
    property WorkAreaLeft: Integer read GetWorkAreaLeft;
    property WorkAreaTop: Integer read GetWorkAreaTop;
    property WorkAreaWidth: Integer read GetWorkAreaWidth;
    property HintFont: TFont read FHintFont write SetHintFont;
    property IconFont: TFont read FIconFont write SetIconFont;
    property MenuFont: TFont read FMenuFont write SetMenuFont;
    property MessageFont: TFont read FMessageFont write SetMessageFont;
    property CaptionFont: TFont read FCaptionFont write SetCaptionFont;
    property Fonts: TStrings read GetFonts;
    property FormCount: Integer read GetFormCount;
    property Forms[Index: Integer]: TForm read GetForm;
    property Imes: TStrings read GetImes;
    property DefaultIme: string read GetDefaultIme;
    property DefaultKbLayout: HKL read FDefaultKbLayout;
    property Height: Integer read GetHeight;
    property PixelsPerInch: Integer read FPixelsPerInch;
    property PrimaryMonitor: TMonitor read GetPrimaryMonitor;
    property Width: Integer read GetWidth;
    property OnActiveControlChange: TNotifyEvent
      read FOnActiveControlChange write FOnActiveControlChange;
    property OnActiveFormChange: TNotifyEvent
      read FOnActiveFormChange write FOnActiveFormChange;
    property UpdatingAllFonts: Boolean read FUpdatingAllFonts;
  end;

{ TApplication }

  TTimerMode = (tmShow, tmHide);

{$IF NOT DEFINED(CLR)}
  PHintInfo = Vcl.Controls.PHintInfo deprecated 'Use Vcl.Controls.PHintInfo';
  {$EXTERNALSYM PHintInfo}
  THintInfo = Vcl.Controls.THintInfo deprecated 'Use Vcl.Controls.THintInfo';
  {$EXTERNALSYM THintInfo}

  (*$HPPEMIT 'namespace Vcl {'*)
  (*$HPPEMIT 'namespace Controls {'*)
  (*$HPPEMIT '  struct THintInfo;'*)
  (*$HPPEMIT '};'*)
  (*$HPPEMIT 'namespace Forms {'*)
  (*$HPPEMIT '  using Controls::THintInfo;'*)
  (*$HPPEMIT '};'*)
  (*$HPPEMIT '};'*)
{$ENDIF}

{$IF DEFINED(CLR)}
  TCMHintShowPause = class(TCMObjectMsg)
  public
    property WasActive: Bool read GetWParamBool write SetWParamBool;
    property Pause: LPARAM read GetLParam write SetLParam;
  end;
{$ELSE}
  TCMHintShowPause = record
    Msg: Cardinal;
    MsgFiller: TDWordFiller;
    WasActive: Integer;
    WasActiveFiller: TDWordFiller;
    Pause: PInteger;
    Result: LRESULT;
  end;
{$ENDIF}

  TPopupForm = record
    FormID: Integer;
    Form: TCustomForm;
    WasPopup: Boolean;
  end;
  TPopupFormArray = array of TPopupForm;

  TMessageEvent = procedure (var Msg: TMsg; var Handled: Boolean) of object;
  TExceptionEvent = procedure (Sender: TObject; E: Exception) of object;
  TGetHandleEvent = procedure(var Handle: HWND) of object;
  TIdleEvent = procedure (Sender: TObject; var Done: Boolean) of object;
  TShowHintEvent = procedure (var HintStr: string; var CanShow: Boolean;
    var HintInfo: Vcl.Controls.THintInfo) of object;
  TWindowHook = function (var Message: TMessage): Boolean of object;
  TSettingChangeEvent = procedure (Sender: TObject; Flag: Integer; const Section: string; var Result: Longint) of object;

  // Used for calling DisableTaskWindows and EnableTaskWindows
{$IF DEFINED(CLR)}
  TTaskWindowList = TObject;
{$ELSE}
  TTaskWindowList = Pointer;
{$ENDIF}

{$IF DEFINED(CLR)}
  TApplicationResources = class(TObject)
  private
    FHandle: HWND;
    FPopupControlWnd: HWND;
    FObjectInstance: TFNWndProc;
  strict protected
    procedure Finalize; override;
    procedure FreeHandles; virtual;
  public
    destructor Destroy; override;
  end;
{$ENDIF}

  [RootDesignerSerializerAttribute('', '', False)]
  TApplication = class(TComponent)
  private type
    TBiDiKeyboard = record
      private
        BiDiKeyboard, NonBiDiKeyboard: string;
        BiDiKeyboardHKL, NonBiDiKeyboardHKL: HKL;
      public
        procedure SetBiDiKeyboard(const Value: string);
        procedure SetNonBiDiKeyboard(const Value: string);
        function GetBidiKeyboard: string; inline;
        function GetNonBidiKeyboard: string; inline;
        procedure ApplyBiDiKeyboardLayout;
        procedure ApplyNonBiDiKeyboardLayout;
    end;
  private
    FAppIconic: Boolean;
    FBiDiMode: TBiDiMode;
    FBiDiKeyboard: TBiDiKeyboard;
    FDefaultFont: TFont;
    FMainForm: TForm;
    FMouseControl: TControl;
    FHelpSystem : IHelpSystem;
    FHelpFile: string;
    FHint: string;
    FHintActive: Boolean;
    FUpdateFormatSettings: Boolean;
    FUpdateMetricSettings: Boolean;
    FShowMainForm: Boolean;
    FHintColor: TColor;
    FHintControl: TControl;
    FHintCursorRect: TRect;
    FHintHidePause: Integer;
    FHintPause: Integer;
    FHintShortCuts: Boolean;
    FHintShortPause: Integer;
    FHintWindow: THintWindow;
    FShowHint: Boolean;
    FTimerMode: TTimerMode;
    FTimerHandle: UIntPtr;
    FTitle: string;
    FTopMostList: TList;
    FTopMostLevel: Integer;
    FPopupOwners: TList;
    FPopupLevel: Integer;
    FIcon: TIcon;
    FTerminate: Boolean;
    FActive: Boolean;
    FAllowTesting: Boolean;
    FTestLib: THandle;
    FHandleCreated: Boolean;
    FRunning: Boolean;
    FWindowHooks: TList;
    FWindowList: TTaskWindowList;
    FDialogHandle: HWnd;
    FAutoDragDocking: Boolean;
    FActionUpdateDelay: Integer;
    FModalLevel: Integer;
    FCurrentPopupID: Integer;
    FPopupForms: TPopupFormArray;
    FModalPopupMode: TPopupMode;
    FCreatingMainForm: Boolean;
    FEnumAllWindowsOnActivateHint: Boolean;
    FMainFormOnTaskBar: Boolean;
    FLastActivePopup: HWND;
    FOwnedAppWnds: array of HWND;
    FInitialMainFormState: TWindowState;
    FOnActionExecute: TActionEvent;
    FOnActionUpdate: TActionEvent;
    FOnException: TExceptionEvent;
    FOnGetActiveFormHandle: TGetHandleEvent;
    FOnGetMainFormHandle: TGetHandleEvent;
    FOnMessage: TMessageEvent;
    FOnModalBegin: TNotifyEvent;
    FOnModalEnd: TNotifyEvent;
    FOnHelp: THelpEvent;
    FOnHint: TNotifyEvent;
    FOnIdle: TIdleEvent;
    FOnDeactivate: TNotifyEvent;
    FOnActivate: TNotifyEvent;
    FOnMinimize: TNotifyEvent;
    FOnRestore: TNotifyEvent;
    FOnShortCut: TShortCutEvent;
    FOnShowHint: TShowHintEvent;
    FOnSettingChange: TSettingChangeEvent;
{$IF DEFINED(CLR)}
    FResources: TApplicationResources;
    FOnShutDown : TNotifyEvent;
{$ELSE}
    FHandle: HWnd;
    FObjectInstance: Pointer;
    FPopupControlWnd: HWnd;
{$ENDIF}
    FNeedToUninitialize: Boolean;
    FIsMetropolisUI: Boolean;
    FDisabledStateBeforeMinimize: Boolean;
    function CheckIniChange(var Message: TMessage): Boolean;
    procedure DefaultFontChanged(Sender: TObject);
    procedure DoActionIdle;
    function DoMouseIdle: TControl;
    procedure DoNormalizeTopMosts(IncludeMain: Boolean);
    function DoOnHelp(Command: Word; Data: THelpEventData; var CallHelp: Boolean): Boolean;
    procedure DoShowOwnedPopups(Show: Boolean);
    function GetBiDiKeyboard: string;
    function GetNonBiDiKeyboard: string;
    function GetCurrentHelpFile: string;
    function GetDialogHandle: HWND;
    function GetActiveFormHandle: HWND;
    function GetMainFormHandle: HWND;
    function GetExeName: string;
    function GetIconHandle: HICON;
    function GetTitle: string;
    procedure HintTimerExpired;
    procedure IconChanged(Sender: TObject);
    function InvokeHelp(Command: Word; Data: NativeInt): Boolean;
    procedure InternalRestore;
    procedure NotifyForms(Msg: Word; WParam: WPARAM = 0; LParam: LPARAM = 0);
    procedure PopupControlProc(var Message: TMessage);
    function ProcessMessage(var Msg: TMsg): Boolean;
    procedure RestoreWindowStateBeforeMinimize(AHandle: HWND; ADisablingWindows: Boolean);
    procedure SetBiDiMode(Value: TBiDiMode);
    procedure SetBiDiKeyboard(const Value: string); inline;
    procedure SetNonBiDiKeyboard(const Value: string); inline;
    procedure SetDefaultFont(Value: TFont);
    procedure SetDialogHandle(Value: HWnd);
    procedure SetHandle(Value: HWnd);
    procedure SetHint(const Value: string);
    procedure SetHintColor(Value: TColor);
    procedure SetIcon(Value: TIcon);
    procedure SetMainFormOnTaskBar(const Value: Boolean);
    procedure SetShowHint(Value: Boolean);
    procedure SetTitle(const Value: string);
    procedure SettingChange(var Message: TWMSettingChange);
    function CheckMetricSettings(const Message: TWMSettingChange): Boolean;
    function CheckFormatSettings(const Message: TWMSettingChange): Boolean;
    procedure StartHintTimer(Value: UINT; TimerMode: TTimerMode);
    procedure StopHintTimer;
    procedure StoreWindowStateBeforeMinimize(AHandle: HWND);
    procedure WndProc(var Message: TMessage);
    procedure UpdateVisible;
    function  ValidateHelpSystem: Boolean;
    procedure WakeMainThread(Sender: TObject);
{$IF DEFINED(CLR)}
    function DispatchActionCall(Execute: Boolean; Action: TBasicAction): Boolean;
    function GetHandle: HWND;
    function GetPopupControlWnd: HWND;
{$ELSE}
    function DispatchAction(Msg: Longint; Action: TBasicAction): Boolean;
{$ENDIF}
  protected
    procedure Idle(const Msg: TMsg);
                                             
{$IF DEFINED(CLR)}
  public
{$ENDIF}
    function IsDlgMsg(var Msg: TMsg): Boolean;
    function IsHintMsg(var Msg: TMsg): Boolean;
    function IsKeyMsg(var Msg: TMsg): Boolean;
    function IsMDIMsg(var Msg: TMsg): Boolean;
    function IsShortCut(var Message: TWMKey): Boolean;
    function IsPreProcessMessage(var Msg: TMsg): Boolean;
{$IF DEFINED(CLR)}
    function DispatchAction(Execute: Boolean; Action: TBasicAction): Boolean; overLoad;
    function DispatchAction(Execute: Boolean; Action: TBasicAction; EnabledCheck: Boolean): Boolean; overload;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ActivateHint(CursorPos: TPoint);
    procedure ApplyBiDiKeyboardLayout;
    procedure ApplyNonBiDiKeyboardLayout;
    function AddPopupForm(APopupForm: TCustomForm): Integer;
    procedure BringToFront;
    procedure ControlDestroyed(Control: TControl);
    procedure CancelHint;
    procedure CreateForm(InstanceClass: TComponentClass; var Reference);
    procedure CreateHandle;
    procedure DoApplicationIdle;
    function ExecuteAction(Action: TBasicAction): Boolean; reintroduce;
    procedure HandleException(Sender: TObject);
    procedure HandleMessage;
    function HelpCommand(Command: Integer; Data: NativeInt): Boolean;
    function HelpContext(Context: THelpContext): Boolean;
    function HelpJump(const JumpID: string): Boolean;
    function HelpKeyword(const Keyword: string): Boolean;
    function HelpShowTableOfContents: Boolean;
    procedure HideHint;
    procedure HintMouseMessage(Control: TControl; var Message: TMessage);
    procedure HookMainWindow(Hook: TWindowHook);
    procedure HookSynchronizeWakeup;
    procedure Initialize;
    function IsRightToLeft: Boolean;
    procedure Minimize;
    procedure ModalStarted;
    procedure ModalFinished;
    procedure NormalizeAllTopMosts;
    procedure NormalizeTopMosts;
    procedure ProcessMessages;
    procedure RemovePopupForm(APopupForm: TCustomForm);
    procedure Restore;
    procedure RestoreTopMosts;
    procedure Run;
    procedure ShowException(E: Exception);
    procedure Terminate;
    procedure UnhookMainWindow(Hook: TWindowHook);
    procedure UnhookSynchronizeWakeup;
    function UpdateAction(Action: TBasicAction): Boolean; reintroduce;
    function UseRightToLeftAlignment: Boolean;
    function UseRightToLeftReading: Boolean;
    function UseRightToLeftScrollBar: Boolean;
    procedure UseMetropolisUI;
{$IF DEFINED(CLR)}
    function MessageBox(const Text, Caption: string; Flags: Longint = MB_OK): Integer;
{$ELSE}
    function MessageBox(const Text, Caption: PChar; Flags: Longint = MB_OK): Integer;
{$ENDIF}
    property Active: Boolean read FActive;
    property ActionUpdateDelay: Integer read FActionUpdateDelay write FActionUpdateDelay default 0;
    property ActiveFormHandle: HWND read GetActiveFormHandle;
    property AllowTesting: Boolean read FAllowTesting write FAllowTesting;
    property AutoDragDocking: Boolean read FAutoDragDocking write FAutoDragDocking default True;
    property HelpSystem: IHelpSystem read FHelpSystem;
    property CurrentHelpFile: string read GetCurrentHelpFile;
    property DefaultFont: TFont read FDefaultFont write SetDefaultFont;
    property DialogHandle: HWnd read GetDialogHandle write SetDialogHandle;
    property EnumAllWindowsOnActivateHint: Boolean read FEnumAllWindowsOnActivateHint write FEnumAllWindowsOnActivateHint;
    property ExeName: string read GetExeName;
    property HelpFile: string read FHelpFile write FHelpFile;
    property Hint: string read FHint write SetHint;
    property HintColor: TColor read FHintColor write SetHintColor;
    property HintHidePause: Integer read FHintHidePause write FHintHidePause;
    property HintPause: Integer read FHintPause write FHintPause;
    property HintShortCuts: Boolean read FHintShortCuts write FHintShortCuts;
    property HintShortPause: Integer read FHintShortPause write FHintShortPause;
    property Icon: TIcon read FIcon write SetIcon;
    property IsMetropolisUI: Boolean read FIsMetropolisUI;
    property MainForm: TForm read FMainForm;
    property MainFormHandle: HWND read GetMainFormHandle;
    property MainFormOnTaskBar: Boolean read FMainFormOnTaskBar write SetMainFormOnTaskBar;
    property ModalLevel: Integer read FModalLevel;
    property ModalPopupMode: TPopupMode read FModalPopupMode write FModalPopupMode default pmNone;
    property BiDiMode: TBiDiMode read FBiDiMode
      write SetBiDiMode default bdLeftToRight;
    property BiDiKeyboard: string read GetBiDiKeyboard write SetBiDiKeyboard;
    property NonBiDiKeyboard: string read GetNonBiDiKeyboard write SetNonBiDiKeyboard;
    property ShowHint: Boolean read FShowHint write SetShowHint;
    property ShowMainForm: Boolean read FShowMainForm write FShowMainForm;
    property Terminated: Boolean read FTerminate;
    property Title: string read GetTitle write SetTitle;
    property UpdateFormatSettings: Boolean read FUpdateFormatSettings
      write FUpdateFormatSettings;
    property UpdateMetricSettings: Boolean read FUpdateMetricSettings
      write FUpdateMetricSettings;
    property OnActionExecute: TActionEvent read FOnActionExecute write FOnActionExecute;
    property OnActionUpdate: TActionEvent read FOnActionUpdate write FOnActionUpdate;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnException: TExceptionEvent read FOnException write FOnException;
    property OnGetActiveFormHandle: TGetHandleEvent read FOnGetActiveFormHandle
      write FOnGetActiveFormHandle;
    property OnGetMainFormHandle: TGetHandleEvent read FOnGetMainFormHandle
      write FOnGetMainFormHandle;
    property OnIdle: TIdleEvent read FOnIdle write FOnIdle;
    property OnHelp: THelpEvent read FOnHelp write FOnHelp;
    property OnHint: TNotifyEvent read FOnHint write FOnHint;
    property OnMessage: TMessageEvent read FOnMessage write FOnMessage;
    property OnMinimize: TNotifyEvent read FOnMinimize write FOnMinimize;
    property OnModalBegin: TNotifyEvent read FOnModalBegin write FOnModalBegin;
    property OnModalEnd: TNotifyEvent read FOnModalEnd write FOnModalEnd;
    property OnRestore: TNotifyEvent read FOnRestore write FOnRestore;
    property OnShowHint: TShowHintEvent read FOnShowHint write FOnShowHint;
    property OnShortCut: TShortCutEvent read FOnShortCut write FOnShortCut;
    property OnSettingChange: TSettingChangeEvent read FOnSettingChange write FOnSettingChange;
{$IF DEFINED(CLR)}
    property Handle: HWnd read GetHandle write SetHandle;
    property PopupControlWnd: HWND read GetPopupControlWnd;
    property OnShutDown: TNotifyEvent read FOnShutDown write FOnShutDown;
{$ELSE}
    property Handle: HWnd read FHandle write SetHandle;
    property PopupControlWnd: HWND read FPopupControlWnd;
{$ENDIF}
  end;

{ Global objects }

var
  Application: TApplication;
  Screen: TScreen;
  HintWindowClass: THintWindowClass = THintWindow;
{$IF NOT DEFINED(CLR)}
  Ctl3DBtnWndProc: Pointer = nil;  { obsolete }
  Ctl3DDlgFramePaint: function(Window: HWnd; Msg, wParam, lParam: Longint): Longint stdcall = nil; { obsolete }
  Ctl3DCtlColorEx: function(Window: HWnd; Msg, wParam, lParam: Longint): Longint stdcall = nil; { obsolete }
{$ENDIF}

function GetParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;
function ValidParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;

function DisableTaskWindows(ActiveWindow: HWnd): TTaskWindowList;
procedure EnableTaskWindows(WindowList: TTaskWindowList);

{$IF NOT DEFINED(CLR)}
function  Subclass3DWnd(Wnd: HWnd): Boolean;     deprecated;  { obsolete }
procedure Subclass3DDlg(Wnd: HWnd; Flags: Word); deprecated;  { obsolete }
procedure SetAutoSubClass(Enable: Boolean);      deprecated;  { obsolete }

procedure DoneCtl3D;                             deprecated;  { obsolete }
procedure InitCtl3D;                             deprecated;  { obsolete }
{$ENDIF}

function IsAccel(VK: Word; const Str: string): Boolean;

function KeysToShiftState(Keys: Word): TShiftState;
function KeyDataToShiftState(KeyData: Longint): TShiftState;
function KeyboardStateToShiftState(const KeyboardState: TKeyboardState): TShiftState; overload;
function KeyboardStateToShiftState: TShiftState; overload;

function ForegroundTask: Boolean;

type
{$IF DEFINED(CLR)}
  TFocusState = type Integer;
{$ELSE}
  TFocusState = type Pointer;
{$ENDIF}

function SaveFocusState: TFocusState;
procedure RestoreFocusState(FocusState: TFocusState);
{$IF DEFINED(CLR)}
function GetNonClientMetrics(var NCM: TNonClientMetrics): Boolean; deprecated 'Use SystemParametersInfo instead';
{$ENDIF}

type
  [SuppressUnmanagedCodeSecurity]
  TSetLayeredWindowAttributes = function (Hwnd: THandle; crKey: COLORREF;
    bAlpha: Byte; dwFlags: DWORD): Boolean; {$IFNDEF CLR}stdcall;{$ENDIF}

var
  SetLayeredWindowAttributes: TSetLayeredWindowAttributes = nil;
{$IF DEFINED(CLR)}
  SupportsLayeredWindowAttributes: Boolean = False deprecated 'Use "if Assigned(Forms.SetLayeredWindowAttributes) then"';
{$ENDIF}
{$IF DEFINED(CLR)}
  { DisableManagedWaitMessageCalls must be set to True if TApplication.Idle is
    called from the native STA main thread. Otherwise the call to WaitMessage
    can end in a deadlock if an MTA thread calls a method of a COM object that
    was created in the STA main thread. This is only necessary if your main
    VCL module interops with the VCL.NET. }
  DisableManagedWaitMessageCalls: Boolean = False;
{$ENDIF}

type
  TScrollingStyleHook = class(TMouseTrackControlStyleHook)
  strict private type
    {$REGION 'TScrollWindow'}
    TScrollWindow = class(TWinControl)
    strict private
      FStyleHook: TScrollingStyleHook;
      FVertical: Boolean;
      procedure WMNCHitTest(var Msg: TWMNCHitTest); message WM_NCHITTEST;
      procedure WMEraseBkgnd(var Msg: TMessage); message WM_ERASEBKGND;
      procedure WMPaint(var Msg: TWMPaint); message WM_PAINT;
    strict protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure WndProc(var Message: TMessage); override;
    public
      constructor Create(AOwner: TComponent); override;
      property StyleHook: TScrollingStyleHook read FStyleHook write FStyleHook;
      property Vertical: Boolean read FVertical write FVertical;
    end;
    {$ENDREGION}
  strict private
    FHorzDownState: TThemedScrollBar;
    FHorzScrollWnd: TScrollWindow;
    FHorzSliderState: TThemedScrollBar;
    FHorzUpState: TThemedScrollBar;
    FLeftButtonDown: Boolean;
    FListPos: Single;
    FPrevScrollPos: Integer;
    FScrollPos: Single;
    FVertDownState: TThemedScrollBar;
    FVertScrollWnd: TScrollWindow;
    FVertSliderState: TThemedScrollBar;
    FVertUpState: TThemedScrollBar;
    FInitingScrollBars: Boolean;
    function GetHorzDownButtonRect: TRect;
    function GetHorzScrollRect: TRect;
    function GetHorzSliderRect: TRect;
    function GetHorzTrackRect: TRect;
    function GetHorzUpButtonRect: TRect;
    function GetParentBounds: TRect;
    function GetVertDownButtonRect: TRect;
    function GetVertScrollRect: TRect;
    function GetVertSliderRect: TRect;
    function GetVertTrackRect: TRect;
    function GetVertUpButtonRect: TRect;
    function IsPopupWindow: Boolean;
    procedure InitScrollBars;
    procedure InitScrollState;
    procedure UpdateScroll;
    procedure CMVisibleChanged(var Msg: TMessage); message CM_VISIBLECHANGED;
    procedure WMKeyDown(var Msg: TMessage); message WM_KEYDOWN;
    procedure WMKeyUp(var Msg: TMessage); message WM_KEYUP;
    procedure WMLButtonDown(var Msg: TWMMouse); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Msg: TWMMouse); message WM_LBUTTONUP;
    procedure WMNCLButtonDown(var Msg: TWMMouse); message WM_NCLBUTTONDOWN;
    procedure WMNCMouseMove(var Msg: TWMMouse); message WM_NCMOUSEMOVE;
    procedure WMNCLButtonUp(var Msg: TWMMouse); message WM_NCLBUTTONUP;
    procedure WMMouseMove(var Msg: TWMMouse); message WM_MOUSEMOVE;
    procedure WMMouseWheel(var Msg: TMessage); message WM_MOUSEWHEEL;
    procedure WMVScroll(var Msg: TMessage); message WM_VSCROLL;
    procedure WMHScroll(var Msg: TMessage); message WM_HSCROLL;
    procedure WMSize(var Msg: TMessage); message WM_SIZE;
    procedure WMMove(var Msg: TMessage); message WM_MOVE;
    procedure WMCaptureChanged(var Msg: TMessage); message WM_CAPTURECHANGED;
    procedure WMNCLButtonDblClk(var Msg: TWMMouse); message WM_NCLBUTTONDBLCLK;
    procedure WMWindowPosChanged(var Msg: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMShowWindow(var Msg: TWMShowWindow); message WM_SHOWWINDOW;
    procedure WMClose(var Msg: TWMCLOSE); message WM_CLOSE;
  strict protected
    procedure DrawBorder; virtual;
    procedure DrawHorzScroll(DC: HDC); virtual;
    procedure DrawVertScroll(DC: HDC); virtual;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure PaintScroll; virtual;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure MouseLeave; override;
    procedure WndProc(var Message: TMessage); override;
    property HorzDownButtonRect: TRect read GetHorzDownButtonRect;
    property HorzDownState: TThemedScrollBar read FHorzDownState write FHorzDownState;
    property HorzScrollRect: TRect read GetHorzScrollRect;
    property HorzSliderRect: TRect read GetHorzSliderRect;
    property HorzSliderState: TThemedScrollBar read FHorzSliderState write FHorzSliderState;
    property HorzTrackRect: TRect read GetHorzTrackRect;
    property HorzUpButtonRect: TRect read GetHorzUpButtonRect;
    property HorzUpState: TThemedScrollBar read FHorzUpState write FHorzUpState;
    property LeftButtonDown: Boolean read FLeftButtonDown;
    property ListPos: Single read FListPos write FListPos;
    property ParentBounds: TRect read GetParentBounds;
    property PrevScrollPos: Integer read FPrevScrollPos write FPrevScrollPos;
    property ScrollPos: Single read FScrollPos write FScrollPos;
    property VertDownButtonRect: TRect read GetVertDownButtonRect;
    property VertDownState: TThemedScrollBar read FVertDownState write FVertDownState;
    property VertScrollRect: TRect read GetVertScrollRect;
    property VertSliderRect: TRect read GetVertSliderRect;
    property VertSliderState: TThemedScrollBar read FVertSliderState write FVertSliderState;
    property VertTrackRect: TRect read GetVertTrackRect;
    property VertUpButtonRect: TRect read GetVertUpButtonRect;
    property VertUpState: TThemedScrollBar read FVertUpState write FVertUpState;
  public
    constructor Create(AControl: TWinControl); override;
    destructor Destroy; override;
  end;

  TFormStyleHook = class(TMouseTrackControlStyleHook)
  strict private type
    {$REGION 'TMainMenuBarStyleHook'}
    TMainMenuBarStyleHook = class
    strict private type
      TMenuBarButton = record
        Index: Integer;
        State: TThemedWindow;
        ItemRect: TRect;
      end;
    public type
      TMenuBarItem = record
        Index: Integer;
        State: TThemedMenu;
        MenuItem: TMenuItem;
        ItemRect: TRect;
      end;
    strict private
      class var FCurrentMenuItem: TMenuItem;
      class var FMenuBarHook: TMainMenuBarStyleHook;
      class function PopupMenuHook(Code: Integer; WParam: WPARAM; var Msg: TMsg): LRESULT; stdcall; static;
    strict private
      FActiveItem: Integer;
      FBoundsRect: TRect;
      FEnterWithKeyboard: Boolean;
      FFormHook: TFormStyleHook;
      FIcon: TIcon;
      FIconHandle: HICON;
      FInMenuLoop: Boolean;
      FItemCount: Integer;
      FItems: array of TMenuBarItem;
      FHotMDIButton, FOldMDIHotButton: Integer;
      FMDIButtons: array[0..2] of TMenuBarButton;
      FMDIChildSysMenuActive: Boolean;
      FMDIChildSystemMenuTracking: Boolean;
      FMenuActive: Boolean;
      FMenuHook: HHOOK;
      FMenuPush: Boolean;
      FMouseInMainMenu: Boolean;
      FMustActivateMDIChildSysMenu: Boolean;
      FMustActivateMenuItem: Boolean;
      FMustActivateSysMenu: Boolean;
      FOldActiveItem: Integer;
      FOldCursorPos: TPoint;
      FPressedMDIButton: Integer;
      FSelectFirstItem: Boolean;
      FShowMDIButtons: Boolean;
      FSysMenuActive: Boolean;
      FSystemMenuTracking: Boolean;
      function CanFindPriorItem(AMenuItem: TMenuItem): Boolean;
      function CanFindNextItem(AMenuItem: TMenuItem): Boolean;
      function CanTrackMDISystemMenu: Boolean;
      function CanTrackSystemMenu: Boolean;
      procedure DrawItem(AItem: TMenuBarItem; ACanvas: TCanvas);
      function FindFirstMenuItem(AUpdateMenu: Boolean): Integer;
      function FindFirstRightMenuItem(AUpdateMenu: Boolean): Integer;
      function FindHotKeyItem(CharCode: Integer; AUpdateMenu: Boolean): Integer;
      function FindItem(Value: NativeUInt; Kind: TFindItemKind): TMenuItem;
      function FindNextMenuItem(AUpdateMenu: Boolean): Integer;
      function FindPriorMenuItem(AUpdateMenu: Boolean): Integer;
      function GetIcon: TIcon;
      function GetIconFast: TIcon;
      function GetMenuItemWidth(AMenuItem: TMenuItem; ACanvas: TCanvas): Integer;
      function GetTrackMenuPos(AItem: TMenuBarItem): TPoint;
      procedure HookMenus;
      function IsSubMenuItem(AMenuItem: TMenuItem): Boolean;
      function ItemFromCursorPos: Integer;
      function ItemFromPoint(X, Y: Integer): Integer;
      function MainMenu: TMainMenu;
      procedure MenuExit;
      function MDIButtonFromPoint(X, Y: Integer): Integer;
      procedure MDIChildClose;
      procedure MDIChildMinimize;
      procedure MDIChildRestore;
      procedure SetBoundsRect(const ABoundsRect: TRect);
      procedure SetShowMDIButtons(Value: Boolean);
      procedure TrackMenuFromItem;
      procedure UnHookMenus;
      function GetSystemMetrics(nIndex: Integer): Integer;
    public
      constructor Create(FormHook: TFormStyleHook);
      destructor Destroy; override;
      function CheckHotKeyItem(ACharCode: Word): Boolean;
      function GetMenuHeight(AWidth: Integer): Integer;
      procedure Invalidate;
      procedure MenuEnter(ATrackMenu: Boolean);
      procedure MouseDown(X, Y: Integer);
      procedure MouseMove(X, Y: Integer);
      procedure MouseUp(X, Y: Integer);
      procedure Paint(Canvas: TCanvas);
      procedure ProcessMenuLoop(ATrackMenu: Boolean);
      procedure TrackSystemMenu;
      procedure TrackMDIChildSystemMenu;
      property BoundsRect: TRect read FBoundsRect write SetBoundsRect;
      property InMenuLoop: Boolean read FInMenuLoop write FInMenuLoop;
      property EnterWithKeyboard: Boolean read FEnterWithKeyboard write FEnterWithKeyboard;
      property MenuActive: Boolean read FMenuActive write FMenuActive;
      property MustActivateMDIChildSysMenu: Boolean read FMustActivateMDIChildSysMenu write FMustActivateMDIChildSysMenu;
      property MustActivateSysMenu: Boolean read FMustActivateSysMenu write FMustActivateSysMenu;
      property MustActivateMenuItem: Boolean read FMustActivateMenuItem write FMustActivateMenuItem;
      property ShowMDIButtons: Boolean read FShowMDIButtons write SetShowMDIButtons;
      property MouseInMainMenu: Boolean read FMouseInMainMenu;
    end;
    {$ENDREGION}
  strict private const
    WM_NCUAHDRAWCAPTION = $00AE;
  strict private
    FCaptionRect: TRect;
    FChangeSizeCalled: Boolean;
    FChangeVisibleChildHandle: HWND;
    FCloseButtonRect: TRect;
    FFormActive: Boolean;
    FHotButton: Integer;
    FHeight: Integer;
    FHelpButtonRect: TRect;
    FIcon: TIcon;
    FIconHandle: HICON;
    FMainMenuBarHook: TMainMenuBarStyleHook;
    FMaxButtonRect: TRect;
    FMDIClientInstance: Pointer;
    FMDIHorzScrollBar: TWinControl; { TScrollBar }
    FMDIPrevClientProc: Pointer;
    FMDIScrollSizeBox: TWinControl;
    FMDIStopHorzScrollBar: Boolean;
    FMDIStopVertScrollBar: Boolean;
    FMDIVertScrollBar: TWinControl; { TScrollBar }
    FMinButtonRect: TRect;
    FLeft: Integer;
    FNeedsUpdate: Boolean;
    FOldHorzSrollBarPosition: Integer;
    FOldVertSrollBarPosition: Integer;
    FPressedButton: Integer;
    FRegion: HRGN;
    FStopCheckChildMove: Boolean;
    FSysMenuButtonRect: TRect;
    FTop: Integer;
    FWidth: Integer;
    FCaptionEmulation: Boolean;
    FRestoring: Boolean;
    FRestoringConstraints: TSizeConstraints;
    FStretchedCaptionInc: Integer;
    procedure AdjustMDIScrollBars;
    procedure ChangeSize;
    function IsStyleBorder: Boolean;
    function GetBorderSize: TRect;
    function GetForm: TCustomForm; inline;
    function GetIconFast: TIcon;
    function GetIcon: TIcon;
    function GetFormIcon(AForm: TCustomForm): TIcon;
    function GetHitTest(P: TPoint): Integer;
    procedure GetMDIScrollInfo(SetRange: Boolean);
    function GetMDIWorkArea: TRect;
    function GetRegion: HRgn;
    procedure InitMDIScrollBars;
    function MDIChildMaximized: Boolean;
    procedure MDIHorzScroll(Offset: Integer);
    procedure MDIVertScroll(Offset: Integer);
    function NormalizePoint(P: TPoint): TPoint;
    procedure UpdateForm;
    procedure OnMDIHScroll(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer);
    procedure OnMDIVScroll(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer);
    procedure CMDialogChar(var Message: TWMKey); message CM_DIALOGCHAR;
    procedure CMMenuChanged(var Message: TMessage); message CM_MENUCHANGED;
    procedure WMInitMenu(var Message: TMessage); message WM_INITMENU;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCActivate(var Message: TMessage); message WM_NCACTIVATE;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
    procedure WMSize(var Message: TWMSIZE); message WM_SIZE;
    procedure WMMove(var Message: TWMMOVE); message WM_MOVE;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCMouseMove(var Message: TWMNCHitMessage); message WM_NCMOUSEMOVE;
    procedure WMNCLButtonDown(var Message: TWMNCHitMessage); message WM_NCLBUTTONDOWN;
    procedure WMNCRButtonDown(var Message: TWMNCHitMessage); message WM_NCRBUTTONDOWN;
    procedure WMNCLButtonUp(var Message: TWMNCHitMessage); message WM_NCLBUTTONUP;
    procedure WMNCRButtonUp(var Message: TWMNCHitMessage); message WM_NCRBUTTONUP;
    procedure WMNCLButtonDblClk(var Message: TWMNCHitMessage); message WM_NCLBUTTONDBLCLK;
    procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
    procedure WMNCUAHDrawCaption(var Message: TMessage); message WM_NCUAHDRAWCAPTION;
    procedure WMShowWindow(var Message: TWMShowWindow); message WM_SHOWWINDOW;
    procedure WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMSetText(var Message: TMessage); message WM_SETTEXT;
    procedure WMMDIChildMove(var Message: TMessage); message WM_MDICHILDMOVE;
    procedure WMMDIChildClose(var Message: TMessage); message WM_MDICHILDCLOSE;
    procedure WMSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure WMDestroy(var Message: TMessage); message WM_DESTROY;
  strict protected
    procedure Close; virtual;
    procedure Help; virtual;
    procedure Maximize; virtual;
    procedure MDIClientWndProc(var Message: TMessage); virtual;
    procedure Minimize; virtual;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure Restore; virtual;
    procedure WndProc(var Message: TMessage); override;
    property Form: TCustomForm read GetForm;
  public
    constructor Create(AControl: TWinControl); override;
    destructor Destroy; override;
    procedure Invalidate; override;
    property Handle;
  end;

  TScrollBoxStyleHook = class(TScrollingStyleHook)
  strict protected
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AControl: TWinControl); override;
  end;

  TChangeScaleMessage = class(System.Messaging.TMessage)
  private
    FSender: TComponent;
    FM, FD: Integer;
  public
    property D: Integer read FD;
    property M: Integer read FM;
    property Sender: TComponent read FSender;
    constructor Create(ASender: TComponent; AM, AD: Integer);
  end;

implementation

uses
{$IF DEFINED(CLR)}
  System.Runtime.InteropServices, System.Text, System.IO,
  System.Threading, WinUtils,
{$ELSE}
  Winapi.FlatSB,
{$ENDIF}
  Winapi.ActiveX, System.Math, System.RTLConsts, Winapi.CommCtrl, System.Types,
  Vcl.Printers, Vcl.Consts, Vcl.StdActns, Vcl.StdCtrls,
  Winapi.UxTheme, Winapi.ShlObj;

var
  FocusMessages: Boolean = True;
  FocusCount: Integer = 0;

{ RM_TaskbarCreated is a registered window message that the OS sends to
  top-level windows of running UI interactive services when a new user logs
  onto the local workstation desktop.
  VCL listens for this message to send around color, font, and settings
  change notifications to controls in the app so that UI interactive
  service apps built with VCL will conform to the new user's UI preferences. }
var
  RM_TaskbarCreated: DWORD;
  RM_TaskBarButtonCreated: DWORD;
// If the Application's window handle isn't being used for min/maximize
// as a result of the Application.MainFormOnTaskBar property use AppIconic instead.
function IsIconic(const hWnd: HWND): BOOL;
begin
  if hWnd = Application.Handle then
    Result := Application.FAppIconic
  else
    Result := Winapi.Windows.IsIconic(hWnd);
end;

// The focus state is just the focus count for now. To save having to allocate
// anything, I just map the Integer to the TFocusState.
function SaveFocusState: TFocusState;
begin
  Result := TFocusState(FocusCount);
end;

procedure RestoreFocusState(FocusState: TFocusState);
begin
  FocusCount := Integer(FocusState);
end;

const
  DefHintColor = clInfoBk;  { default hint window color }
  DefHintPause = 500;       { default pause before hint window displays (ms) }
  DefHintShortPause = 0;    { default reshow pause to 0, was DefHintPause div 10 }
  DefHintHidePause = DefHintPause * 5;

procedure ShowMDIClientEdge(ClientHandle: THandle; ShowEdge: Boolean);
var
  Style: Longint;
begin
  if ClientHandle <> 0 then
  begin
    Style := GetWindowLong(ClientHandle, GWL_EXSTYLE);
    if ShowEdge then
      if Style and WS_EX_CLIENTEDGE = 0 then
        Style := Style or WS_EX_CLIENTEDGE
      else
        Exit
    else if Style and WS_EX_CLIENTEDGE <> 0 then
      Style := Style and not WS_EX_CLIENTEDGE
    else
      Exit;
    SetWindowLong(ClientHandle, GWL_EXSTYLE, Style);
    SetWindowPos(ClientHandle, 0, 0,0,0,0, SWP_FRAMECHANGED or SWP_NOACTIVATE or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
  end;
end;

procedure ChangeAppWindow(const Handle: THandle; const SetAppWindow, RestoreVisibility: Boolean);
var
  Style: Integer;
  WasVisible, WasIconic: Boolean;
begin
  Style := GetWindowLong(Handle, GWL_EXSTYLE);
  if (SetAppWindow and (Style and WS_EX_APPWINDOW = 0)) or
     (not SetAppWindow and (Style and WS_EX_APPWINDOW = WS_EX_APPWINDOW)) then
  begin
    WasIconic := Winapi.Windows.IsIconic(Handle);
    WasVisible := IsWindowVisible(Handle);
    if WasVisible or WasIconic then
      ShowWindow(Handle, SW_HIDE);
    if SetAppWindow then
      SetWindowLong(Handle, GWL_EXSTYLE, Style or WS_EX_APPWINDOW)
    else
      SetWindowLong(Handle, GWL_EXSTYLE, Style and not WS_EX_APPWINDOW);
    if (RestoreVisibility and WasVisible) or WasIconic then
    begin
      if WasIconic then
        ShowWindow(Handle, SW_MINIMIZE)
      else
        ShowWindow(Handle, SW_SHOW);
    end;
  end;
end;

{ Task window management }

type
{$IF DEFINED(CLR)}
  TTaskWindow = class
    Next: TTaskWindow;
    Window: HWnd;
  end;
  TTaskWindowType = TTaskWindow;
{$ELSE}
  PTaskWindow = ^TTaskWindow;
  TTaskWindow = record
    Next: PTaskWindow;
    Window: HWnd;
  end;
  TTaskWindowType = PTaskWindow;
{$ENDIF}

var
  TaskActiveWindow: HWnd = 0;
  TaskFirstWindow: HWnd = 0;
  TaskFirstTopMost: HWnd = 0;
  DisablingWindows: Boolean = False;
  TaskWindowList: TTaskWindowType = nil;

procedure DoneApplication;
begin
  with Application do
  begin
    if Handle <> 0 then
{$IF DEFINED(CLR)}
      ShowOwnedPopups(Handle, False);
    CancelHint;
{$ELSE}
      DoShowOwnedPopups(False);
{$ENDIF}
    ShowHint := False;
    Destroying;
    DestroyComponents;
{$IF DEFINED(CLR)}
    if FTestLib <> 0 then
    begin
      FreeLibrary(FTestLib);
      FTestLib := 0;
    end;
    if (Handle <> 0) and FHandleCreated then
      if NewStyleControls then SendMessage(Handle, WM_SETICON, ICON_BIG, 0);
    FreeAndNil(FIcon);
    FreeAndNil(Screen);
    FreeAndNil(Mouse);
    UnhookMainWindow(CheckIniChange);
{$ENDIF}
  end;
end;

function DoDisableWindow(Window: HWnd; Data: LPARAM): Bool; {$IFNDEF CLR}stdcall;{$ENDIF}
var
  P: TTaskWindowType;
begin
  if (Window <> TaskActiveWindow) and IsWindowVisible(Window) and
    IsWindowEnabled(Window) then
  begin
{$IF DEFINED(CLR)}
    P := TTaskWindow.Create;
{$ELSE}
    New(P);
{$ENDIF}
    P.Next := TaskWindowList;
    P.Window := Window;
    TaskWindowList := P;
    EnableWindow(Window, False);
  end;
  Result := True;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
function DisableTaskWindows(ActiveWindow: HWnd): TTaskWindowList;
var
  SaveActiveWindow: HWND;
  SaveWindowList: TTaskWindowType;
  EnumProc: TFNWndEnumProc; // keep a reference to the delegate!

  procedure ProcessWMEnableMessages;
  var
    Msg: TMsg;
  begin
    while PeekMessage(Msg, 0, WM_ENABLE, WM_ENABLE, PM_REMOVE) do
      DispatchMessage(Msg);
  end;

begin
  { The following is to work-around an issue with WindowsXP that causes
    disabled windows to be re-enabled if the application doesn't process
    messages for a certain timeout period.  Windows posts a WM_ENABLE message
    that tells the window to re-enable, so unless we process that message,
    we don't know that it is about to be re-enabled so DoDisableWindow will
    ignore the window since it thinks it is still disabled.  So when the app
    begins to process messages again, the WM_ENABLE is allowed through and the
    window is then re-enabled causing dialogs to show behind other windows. }
                                                                                       
//  ProcessWMEnableMessages;
  SaveActiveWindow := TaskActiveWindow;
  SaveWindowList := TaskWindowList;
  TaskActiveWindow := ActiveWindow;
  TaskWindowList := nil;
  EnumProc := @DoDisableWindow;
  try
    DisablingWindows := True;
    try
      EnumThreadWindows(GetCurrentThreadID, EnumProc, 0);
      Result := TaskWindowList;
    except
      EnableTaskWindows(TaskWindowList);
      raise;
    end;
  finally
    DisablingWindows := False;
    TaskWindowList := SaveWindowList;
    TaskActiveWindow := SaveActiveWindow;
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure EnableTaskWindows(WindowList: TTaskWindowList);
var
  P: TTaskWindowType;
begin
{$IF DEFINED(CLR)}
  P := TTaskWindow(WindowList);
  while P <> nil do
  begin
    if IsWindow(P.Window) then EnableWindow(P.Window, True);
    P := P.Next;
  end;
{$ELSE}
  while WindowList <> nil do
  begin
    P := WindowList;
    if IsWindow(P^.Window) then EnableWindow(P^.Window, True);
    WindowList := P^.Next;
    Dispose(P);
  end;
{$ENDIF}
end;

function DoFindWindow(Window: HWnd; Param: LPARAM): Bool; {$IFNDEF CLR}stdcall;{$ENDIF}
begin
  if (Window <> TaskActiveWindow) and (Window <> Application.Handle) and
    IsWindowVisible(Window) and IsWindowEnabled(Window) then
    if GetWindowLong(Window, GWL_EXSTYLE) and WS_EX_TOPMOST = 0 then
    begin
      if TaskFirstWindow = 0 then TaskFirstWindow := Window;
    end else
    begin
      if TaskFirstTopMost = 0 then TaskFirstTopMost := Window;
    end;
  Result := True;
end;

function FindTopMostWindow(ActiveWindow: HWnd): HWnd;
var
  EnumProc: TFNWndEnumProc; // keep a reference to the delegate!
begin
  TaskActiveWindow := ActiveWindow;
  TaskFirstWindow := 0;
  TaskFirstTopMost := 0;
  EnumProc := @DoFindWindow;
  EnumThreadWindows(GetCurrentThreadID, EnumProc, 0);
  if TaskFirstWindow <> 0 then
    Result := TaskFirstWindow else
    Result := TaskFirstTopMost;
end;

function SendFocusMessage(Window: HWnd; Msg: Word): Boolean;
var
  Count: Integer;
begin
  Count := FocusCount;
  SendMessage(Window, Msg, 0, 0);
  Result := FocusCount = Count;
end;

{ Check if this is the active Windows task }

type
{$IF DEFINED(CLR)}
  TCheckTaskInfo = class
    FocusWnd: HWnd;
    Found: Boolean;
    function CheckTaskWindow(Window: HWND; Data: LPARAM): Bool;
    function CheckTaskWindowAll(Window: HWND; Data: LPARAM): Bool;
  end;
{$ELSE}
  PCheckTaskInfo = ^TCheckTaskInfo;
  TCheckTaskInfo = record
    FocusWnd: HWnd;
    Found: Boolean;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
function TCheckTaskInfo.CheckTaskWindow(Window: HWND; Data: LPARAM): Bool;
begin
  Result := True;
  if FocusWnd = Window then
  begin
    Result := False;
    Found := True;
  end;
end;

function TCheckTaskInfo.CheckTaskWindowAll(Window: HWND; Data: LPARAM): Bool;
var
 WinProcessId: DWORD;
begin
  Result := True;
  GetWindowThreadProcessId(Window, WinProcessId);
  if (FocusWnd = Window) and (GetCurrentProcessId = WinProcessId) then
  begin
    Result := False;
    Found := True;
  end;
end;
{$ELSE}
function CheckTaskWindow(Window: HWnd; Data: LPARAM): Bool; stdcall;
begin
  Result := True;
  if PCheckTaskInfo(Data)^.FocusWnd = Window then
  begin
    Result := False;
    PCheckTaskInfo(Data)^.Found := True;
  end;
end;

function CheckTaskWindowAll(Window: HWnd; Data: LPARAM): Bool; stdcall;
var
 WinProcessId: DWORD;
begin
  Result := True;
  GetWindowThreadProcessId(Window, @WinProcessId);
  if (PCheckTaskInfo(Data)^.FocusWnd = Window) and
     (GetCurrentProcessId = WinProcessId) then
  begin
    Result := False;
    PCheckTaskInfo(Data)^.Found := True;
  end;
end;
{$ENDIF}

{$IF DEFINED(CLR)}
function ForegroundTaskCheck(CheckAll: Boolean): Boolean;
var
  Info: TCheckTaskInfo;
  EnumProc: TFNWndEnumProc; // keep a reference to the delegate!
begin
  Info := TCheckTaskInfo.Create;
  Info.FocusWnd := GetActiveWindow;
  Info.Found := False;
  EnumProc := Info.CheckTaskWindow;
  EnumThreadWindows(GetCurrentThreadID, EnumProc, 0);
  Result := Info.Found;
end;
{$ELSE}
function ForegroundTaskCheck(CheckAll: Boolean): Boolean;
var
  Info: TCheckTaskInfo;
begin
  Info.FocusWnd := GetActiveWindow;
  Info.Found := False;
  if (CheckAll) then
    EnumWindows(@CheckTaskWindowAll, Winapi.Windows.LPARAM(@Info))
  else
    EnumThreadWindows(GetCurrentThreadID, @CheckTaskWindow, Winapi.Windows.LPARAM(@Info));
  Result := Info.Found;
end;
{$ENDIF}

function ForegroundTask: Boolean;
begin
 Result := ForegroundTaskCheck(False);
end;

function FindGlobalComponent(const Name: string): TComponent;
var
  I: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
  begin
    Result := Screen.Forms[I];
    if not (csInline in Result.ComponentState) and
      (CompareText(Name, Result.Name) = 0) then Exit;
  end;
  for I := 0 to Screen.DataModuleCount - 1 do
  begin
    Result := Screen.DataModules[I];
    if CompareText(Name, Result.Name) = 0 then Exit;
  end;
  Result := nil;
end;

{$IF NOT DEFINED(CLR)}
{ CTL3D32.DLL support for NT 3.51 has been removed.  Ctl3D properties of
  VCL controls use extended window style flags on Win95 and later OS's.  }

procedure InitCtl3D;
begin
end;

procedure DoneCtl3D;
begin
end;

function Subclass3DWnd(Wnd: HWnd): Boolean;
begin
  Result := False;
end;

procedure Subclass3DDlg(Wnd: HWnd; Flags: Word);
begin
end;

procedure SetAutoSubClass(Enable: Boolean);
begin
end;

{ Allocate an object instance }

function MakeObjectInstance(Method: TWndMethod): Pointer;
begin
{$IFDEF LINUX}
  Result := WinUtils.MakeObjectInstance(Method);
{$ENDIF}
{$IFDEF MSWINDOWS}
  Result := System.Classes.MakeObjectInstance(Method);
{$ENDIF}
end;

{ Free an object instance }

procedure FreeObjectInstance(ObjectInstance: Pointer);
begin
{$IFDEF LINUX}
  WinUtils.FreeObjectInstance(ObjectInstance);
{$ENDIF}
{$IFDEF MSWINDOWS}
  System.Classes.FreeObjectInstance(ObjectInstance);
{$ENDIF}
end;

function AllocateHWnd(Method: TWndMethod): HWND;
begin
{$IFDEF LINUX}
  Result := WinUtils.AllocateHWnd(Method);
{$ENDIF}
{$IFDEF MSWINDOWS}
  Result := System.Classes.AllocateHWnd(Method);
{$ENDIF}
end;

procedure DeallocateHWnd(Wnd: HWND);
begin
{$IFDEF LINUX}
  WinUtils.DeallocateHWnd(Wnd);
{$ENDIF}
{$IFDEF MSWINDOWS}
  System.Classes.DeallocateHWnd(Wnd);
{$ENDIF}
end;
{$ENDIF}

{ Utility mapping functions }

{ Convert mouse message to TMouseButton }

function KeysToShiftState(Keys: Word): TShiftState;
begin
  Result := [];
  if Keys and MK_SHIFT <> 0 then Include(Result, ssShift);
  if Keys and MK_CONTROL <> 0 then Include(Result, ssCtrl);
  if Keys and MK_LBUTTON <> 0 then Include(Result, ssLeft);
  if Keys and MK_RBUTTON <> 0 then Include(Result, ssRight);
  if Keys and MK_MBUTTON <> 0 then Include(Result, ssMiddle);
  if GetKeyState(VK_MENU) < 0 then Include(Result, ssAlt);
end;

{ Convert keyboard message data to TShiftState }

function KeyDataToShiftState(KeyData: Longint): TShiftState;
const
  AltMask = $20000000;
{$IFDEF LINUX}
  CtrlMask = $10000000;
  ShiftMask = $08000000;
{$ENDIF}
begin
  Result := [];
  if GetKeyState(VK_SHIFT) < 0 then Include(Result, ssShift);
  if GetKeyState(VK_CONTROL) < 0 then Include(Result, ssCtrl);
  if KeyData and AltMask <> 0 then Include(Result, ssAlt);
end;

{ Convert GetKeyboardState output to TShiftState }

function KeyboardStateToShiftState(const KeyboardState: TKeyboardState): TShiftState;
begin
  Result := [];
  if KeyboardState[VK_SHIFT] and $80 <> 0 then Include(Result, ssShift);
  if KeyboardState[VK_CONTROL] and $80 <> 0 then Include(Result, ssCtrl);
  if KeyboardState[VK_MENU] and $80 <> 0 then Include(Result, ssAlt);
  if KeyboardState[VK_LBUTTON] and $80 <> 0 then Include(Result, ssLeft);
  if KeyboardState[VK_RBUTTON] and $80 <> 0 then Include(Result, ssRight);
  if KeyboardState[VK_MBUTTON] and $80 <> 0 then Include(Result, ssMiddle);
end;

{ Calls GetKeyboardState and converts output to TShiftState }

function KeyboardStateToShiftState: TShiftState; overload;
var
  KeyState: TKeyBoardState;
begin
  GetKeyboardState(KeyState);
  Result := KeyboardStateToShiftState(KeyState);
end;

function IsAccel(VK: Word; const Str: string): Boolean;
begin
  Result := CompareText(Char(VK), GetHotKey(Str), loUserLocale) = 0;
end;

{ Form utility functions }

function GetRealParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;
begin
  while (TopForm or not (Control is TCustomForm)) and (Control.Parent <> nil) do
    Control := Control.Parent;
  if Control is TCustomForm then
    Result := TCustomForm(Control) else
    Result := nil;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
function GetParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;
begin
  // Override the "TopForm" parameter if the control passed in is in design mode
  // This makes controls calling this function operate correctly when the designer
  // is embedded
  if csDesigning in Control.ComponentState then
    TopForm := False;
  Result := GetRealParentForm(Control, TopForm);
end;

function ValidParentForm(Control: TControl; TopForm: Boolean = True): TCustomForm;
begin
  Result := GetParentForm(Control, TopForm);
  if Result = nil then
    InvalidControlOperation(@SParentRequired, Control);
end;

{ TControlScrollBar }

constructor TControlScrollBar.Create(AControl: TScrollingWinControl;
  AKind: TScrollBarKind);
begin
  inherited Create;
  FControl := AControl;
  FKind := AKind;
  FPageIncrement := 80;
  FIncrement := FPageIncrement div 10;
  FVisible := True;
  FDelay := 10;
  FLineDiv := 4;
  FPageDiv := 12;
  FColor := clBtnHighlight;
  FParentColor := True;
  FUpdateNeeded := True;
end;

function TControlScrollBar.IsIncrementStored: Boolean;
begin
  Result := not Smooth;
end;

procedure TControlScrollBar.Assign(Source: TPersistent);
begin
  if Source is TControlScrollBar then
  begin
    Visible := TControlScrollBar(Source).Visible;
    Range := TControlScrollBar(Source).Range;
    Position := TControlScrollBar(Source).Position;
    Increment := TControlScrollBar(Source).Increment;
    Exit;
  end;
  inherited Assign(Source);
end;

procedure TControlScrollBar.ChangeBiDiPosition;
begin
  if Kind = sbHorizontal then
    if IsScrollBarVisible then
      if not FControl.UseRightToLeftScrollBar then
        Position := 0
      else
        Position := Range;
end;

procedure TControlScrollBar.CalcAutoRange;
var
  I: Integer;
  NewRange, AlignMargin: Integer;

  procedure ProcessHorz(Control: TControl);
  begin
    if Control.Visible then
      case Control.Align of
        alLeft, alNone:
          if (Control.Align = alLeft) or (Control.Anchors * [akLeft, akRight] = [akLeft]) then
            NewRange := Max(NewRange, Position + Control.Left + Control.Width);
        alRight: Inc(AlignMargin, Control.Width);
      end;
  end;

  procedure ProcessVert(Control: TControl);
  begin
    if Control.Visible then
      case Control.Align of
        alTop, alNone:
          if (Control.Align = alTop) or (Control.Anchors * [akTop, akBottom] = [akTop]) then
            NewRange := Max(NewRange, Position + Control.Top + Control.Height);
        alBottom: Inc(AlignMargin, Control.Height);
      end;
  end;

begin
  if FControl.FAutoScroll then
  begin
    if FControl.AutoScrollEnabled then
    begin
      NewRange := 0;
      AlignMargin := 0;
      for I := 0 to FControl.ControlCount - 1 do
        if Kind = sbHorizontal then
          ProcessHorz(FControl.Controls[I]) else
          ProcessVert(FControl.Controls[I]);
      DoSetRange(NewRange + AlignMargin + Margin);
    end
    else DoSetRange(0);
  end;
end;

function TControlScrollBar.IsScrollBarVisible: Boolean;
var
  Style: Longint;
begin
  Style := WS_HSCROLL;
  if Kind = sbVertical then Style := WS_VSCROLL;
  Result := (Visible) and
            (GetWindowLong(FControl.Handle, GWL_STYLE) and Style <> 0);
end;

function TControlScrollBar.ControlSize(ControlSB, AssumeSB: Boolean): Integer;
var
  BorderAdjust: Integer;

  function ScrollBarVisible(Code: Word): Boolean;
  var
    Style: Longint;
  begin
    Style := WS_HSCROLL;
    if Code = SB_VERT then Style := WS_VSCROLL;
    Result := GetWindowLong(FControl.Handle, GWL_STYLE) and Style <> 0;
  end;

  function Adjustment(Code, Metric: Word): Integer;
  begin
    Result := 0;
    if not ControlSB then
      if AssumeSB and not ScrollBarVisible(Code) then
        Result := -(GetSystemMetrics(Metric) - BorderAdjust)
      else if not AssumeSB and ScrollBarVisible(Code) then
        Result := GetSystemMetrics(Metric) - BorderAdjust;
  end;

begin
  BorderAdjust := Integer(GetWindowLong(FControl.Handle, GWL_STYLE) and
    (WS_BORDER or WS_THICKFRAME) <> 0);
  if Kind = sbVertical then
    Result := FControl.ClientHeight + Adjustment(SB_HORZ, SM_CXHSCROLL) else
    Result := FControl.ClientWidth + Adjustment(SB_VERT, SM_CYVSCROLL);
end;

function TControlScrollBar.GetScrollPos: Integer;
begin
  Result := 0;
  if Visible then Result := Position;
end;

function TControlScrollBar.NeedsScrollBarVisible: Boolean;
begin
  Result := FRange > ControlSize(False, False);
end;

procedure TControlScrollBar.Scale(M, D: Integer);
begin
  If (not FScaled) or (M = D) then
    Exit;

  FRange := MulDiv(Range, M, D);
  FCalcRange := MulDiv(FCalcRange, M, D);
  FPosition  := MulDiv(Position, M, D);
end;

procedure TControlScrollBar.ScrollMessage(var Msg: TWMScroll);
var
  Incr, FinalIncr, Count: Integer;
  CurrentTime, StartTime, ElapsedTime: DWORD;

  function GetRealScrollPosition: Integer;
  var
    SI: TScrollInfo;
    Code: Integer;
  begin
{$IF DEFINED(CLR)}
    SI.cbSize := Marshal.SizeOf(TypeOf(TScrollInfo));
{$ELSE}
    SI.cbSize := SizeOf(TScrollInfo);
{$ENDIF}
    SI.fMask := SIF_TRACKPOS;
    Code := SB_HORZ;
    if FKind = sbVertical then Code := SB_VERT;
    Result := Msg.Pos;
{$IF DEFINED(CLR)}
    if GetScrollInfo(FControl.Handle, Code, SI) then
{$ELSE}
    if FlatSB_GetScrollInfo(FControl.Handle, Code, SI) then
{$ENDIF}
      Result := SI.nTrackPos;
  end;

begin
  with Msg do
  begin
    if FSmooth and (ScrollCode in [SB_LINEUP, SB_LINEDOWN, SB_PAGEUP, SB_PAGEDOWN]) then
    begin
      case ScrollCode of
        SB_LINEUP, SB_LINEDOWN:
          begin
            Incr := FIncrement div FLineDiv;
            FinalIncr := FIncrement mod FLineDiv;
            Count := FLineDiv;
          end;
        SB_PAGEUP, SB_PAGEDOWN:
          begin
            Incr := FPageIncrement;
            FinalIncr := Incr mod FPageDiv;
            Incr := Incr div FPageDiv;
            Count := FPageDiv;
          end;
      else
        Count := 0;
        Incr := 0;
        FinalIncr := 0;
      end;
      CurrentTime := 0;
      while Count > 0 do
      begin
        StartTime := GetCurrentTime;
        ElapsedTime := StartTime - CurrentTime;
        if ElapsedTime < DWORD(FDelay) then
          Sleep(DWORD(FDelay) - ElapsedTime);
        CurrentTime := StartTime;
        case ScrollCode of
          SB_LINEUP: SetPosition(FPosition - Incr);
          SB_LINEDOWN: SetPosition(FPosition + Incr);
          SB_PAGEUP: SetPosition(FPosition - Incr);
          SB_PAGEDOWN: SetPosition(FPosition + Incr);
        end;
        FControl.Update;
        Dec(Count);
      end;
      if FinalIncr > 0 then
      begin
        case ScrollCode of
          SB_LINEUP: SetPosition(FPosition - FinalIncr);
          SB_LINEDOWN: SetPosition(FPosition + FinalIncr);
          SB_PAGEUP: SetPosition(FPosition - FinalIncr);
          SB_PAGEDOWN: SetPosition(FPosition + FinalIncr);
        end;
      end;
    end
    else
      case ScrollCode of
        SB_LINEUP: SetPosition(FPosition - FIncrement);
        SB_LINEDOWN: SetPosition(FPosition + FIncrement);
        SB_PAGEUP: SetPosition(FPosition - ControlSize(True, False));
        SB_PAGEDOWN: SetPosition(FPosition + ControlSize(True, False));
        SB_THUMBPOSITION:
            if FCalcRange > 32767 then
              SetPosition(GetRealScrollPosition) else
              SetPosition(Pos);
        SB_THUMBTRACK:
          if Tracking then
            if FCalcRange > 32767 then
              SetPosition(GetRealScrollPosition) else
              SetPosition(Pos);
        SB_TOP: SetPosition(0);
        SB_BOTTOM: SetPosition(FCalcRange);
        SB_ENDSCROLL: begin end;
      end;
  end;
end;

procedure TControlScrollBar.SetButtonSize(Value: Integer);
const
  SysConsts: array[TScrollBarKind] of Integer = (SM_CXHSCROLL, SM_CXVSCROLL);
var
  NewValue: Integer;
begin
  if Value <> ButtonSize then
  begin
    NewValue := Value;
    if NewValue = 0 then
      Value := GetSystemMetrics(SysConsts[Kind]);
    FButtonSize := Value;
    FUpdateNeeded := True;
    FControl.UpdateScrollBars;
    if NewValue = 0 then
      FButtonSize := 0;
  end;
end;

procedure TControlScrollBar.SetColor(Value: TColor);
begin
  if Value <> Color then
  begin
    FColor := Value;
    FParentColor := False;
    FUpdateNeeded := True;
    FControl.UpdateScrollBars;
  end;
end;

procedure TControlScrollBar.SetParentColor(Value: Boolean);
begin
  if ParentColor <> Value then
  begin
    FParentColor := Value;
    if Value then Color := clBtnHighlight;
  end;
end;

procedure TControlScrollBar.SetPosition(Value: Integer);
var
  Code: Word;
  Form: TCustomForm;
  OldPos: Integer;
begin
  if csReading in FControl.ComponentState then
    FPosition := Value
  else
  begin
    if Value > FCalcRange then Value := FCalcRange
    else if Value < 0 then Value := 0;
    if Kind = sbHorizontal then
      Code := SB_HORZ else
      Code := SB_VERT;
    if Value <> FPosition then
    begin
      OldPos := FPosition;
      FPosition := Value;
      if Kind = sbHorizontal then
        FControl.ScrollBy(OldPos - Value, 0) else
        FControl.ScrollBy(0, OldPos - Value);
      if csDesigning in FControl.ComponentState then
      begin
        Form := GetParentForm(FControl, False);
        if (Form <> nil) and (Form.Designer <> nil) then Form.Designer.Modified;
      end;
    end;
{$IF DEFINED(CLR)}
    if Windows.GetScrollPos(FControl.Handle, Code) <> FPosition then
      Windows.SetScrollPos(FControl.Handle, Code, FPosition, True);
{$ELSE}
    if FlatSB_GetScrollPos(FControl.Handle, Code) <> FPosition then
      FlatSB_SetScrollPos(FControl.Handle, Code, FPosition, True);
{$ENDIF}
  end;
end;

procedure TControlScrollBar.SetSize(Value: Integer);
const
  SysConsts: array[TScrollBarKind] of Integer = (SM_CYHSCROLL, SM_CYVSCROLL);
var
  NewValue: Integer;
begin
  if Value <> Size then
  begin
    NewValue := Value;
    if NewValue = 0 then
      Value := GetSystemMetrics(SysConsts[Kind]);
    FSize := Value;
    FUpdateNeeded := True;
    FControl.UpdateScrollBars;
    if NewValue = 0 then
      FSize := 0;
  end;
end;

procedure TControlScrollBar.SetStyle(Value: TScrollBarStyle);
begin
  if Style <> Value then
  begin
    FStyle := Value;
    FUpdateNeeded := True;
    FControl.UpdateScrollBars;
  end;
end;

procedure TControlScrollBar.SetThumbSize(Value: Integer);
begin
  if Value <> ThumbSize then
  begin
    FThumbSize := Value;
    FUpdateNeeded := True;
    FControl.UpdateScrollBars;
  end;
end;

procedure TControlScrollBar.DoSetRange(Value: Integer);
begin
  FRange := Value;
  if FRange < 0 then FRange := 0;
  FControl.UpdateScrollBars;
end;

procedure TControlScrollBar.SetRange(Value: Integer);
begin
  FControl.FAutoScroll := False;
  FScaled := True;
  DoSetRange(Value);
end;

function TControlScrollBar.IsRangeStored: Boolean;
begin
  Result := not FControl.AutoScroll;
end;

procedure TControlScrollBar.SetVisible(Value: Boolean);
begin
  FVisible := Value;
  FControl.UpdateScrollBars;
end;

procedure TControlScrollBar.Update(ControlSB, AssumeSB: Boolean);
{$IF NOT DEFINED(CLR)}
type
  TPropKind = (pkStyle, pkButtonSize, pkThumbSize, pkSize, pkBkColor);
const
  Props: array[TScrollBarKind, TPropKind] of Integer = (
    { Horizontal }
    (WSB_PROP_HSTYLE, WSB_PROP_CXHSCROLL, WSB_PROP_CXHTHUMB, WSB_PROP_CYHSCROLL,
     WSB_PROP_HBKGCOLOR),
    { Vertical }
    (WSB_PROP_VSTYLE, WSB_PROP_CYVSCROLL, WSB_PROP_CYVTHUMB, WSB_PROP_CXVSCROLL,
     WSB_PROP_VBKGCOLOR));
  Kinds: array[TScrollBarKind] of Integer = (WSB_PROP_HSTYLE, WSB_PROP_VSTYLE);
  Styles: array[TScrollBarStyle] of Integer = (FSB_REGULAR_MODE,
    FSB_ENCARTA_MODE, FSB_FLAT_MODE);
{$ENDIF}
var
  Code: Word;
  ScrollInfo: TScrollInfo;

{$IF NOT DEFINED(CLR)}
procedure UpdateScrollProperties(Redraw: Boolean);
  begin
    FlatSB_SetScrollProp(FControl.Handle, Props[Kind, pkStyle], Styles[Style], Redraw);
    if ButtonSize > 0 then
      FlatSB_SetScrollProp(FControl.Handle, Props[Kind, pkButtonSize], ButtonSize, False);
    if ThumbSize > 0 then
      FlatSB_SetScrollProp(FControl.Handle, Props[Kind, pkThumbSize], ThumbSize, False);
    if Size > 0 then
      FlatSB_SetScrollProp(FControl.Handle, Props[Kind, pkSize], Size, False);
    FlatSB_SetScrollProp(FControl.Handle, Props[Kind, pkBkColor],
      ColorToRGB(Color), False);
  end;
{$ENDIF}

begin
  FCalcRange := 0;
  Code := SB_HORZ;
  if Kind = sbVertical then Code := SB_VERT;
  if Visible then
  begin
    FCalcRange := Range - ControlSize(ControlSB, AssumeSB);
    if FCalcRange < 0 then FCalcRange := 0;
  end;
{$IF DEFINED(CLR)}
  ScrollInfo.cbSize := Marshal.SizeOf(TypeOf(ScrollInfo));
{$ELSE}
  ScrollInfo.cbSize := SizeOf(ScrollInfo);
{$ENDIF}
  ScrollInfo.fMask := SIF_ALL;
  ScrollInfo.nMin := 0;
  if FCalcRange > 0 then
    ScrollInfo.nMax := Range else
    ScrollInfo.nMax := 0;
  ScrollInfo.nPage := ControlSize(ControlSB, AssumeSB) + 1;
  ScrollInfo.nPos := FPosition;
  ScrollInfo.nTrackPos := FPosition;
  FUpdateNeeded := False;
{$IF NOT DEFINED(CLR)}
  UpdateScrollProperties(FUpdateNeeded);
  FlatSB_SetScrollInfo(FControl.Handle, Code, ScrollInfo, True);
{$ELSE}
  SetScrollInfo(FControl.Handle, Code, ScrollInfo, True);
{$ENDIF}
  SetPosition(FPosition);
  FPageIncrement := (ControlSize(True, False) * 9) div 10;
  if Smooth then FIncrement := FPageIncrement div 10;
end;

{ TScrollingWinControl }

constructor TScrollingWinControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csNeedsBorderPaint];
  FHorzScrollBar := TControlScrollBar.Create(Self, sbHorizontal);
  FVertScrollBar := TControlScrollBar.Create(Self, sbVertical);
  FAutoScroll := False;
  Touch.InteractiveGestures := [igPan, igPressAndTap];
  Touch.InteractiveGestureOptions := [igoPanInertia,
    igoPanSingleFingerHorizontal, igoPanSingleFingerVertical,
    igoParentPassthrough];
end;

destructor TScrollingWinControl.Destroy;
begin
  FreeAndNil(FHorzScrollBar);
  FreeAndNil(FVertScrollBar);
  inherited Destroy;
end;

procedure TScrollingWinControl.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params.WindowClass do
    style := style and not (CS_HREDRAW or CS_VREDRAW);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TScrollingWinControl.CreateWnd;
begin
  inherited CreateWnd;
{$IF NOT DEFINED(CLR)}
  //! Scroll bars don't move to the Left side of a TScrollingWinControl when the
  //! WS_EX_LEFTSCROLLBAR flag is set and InitializeFlatSB is called.
  //! A call to UnInitializeFlatSB does nothing.
  if not SysLocale.MiddleEast and
     not CheckWin32Version(5, 1) then
    InitializeFlatSB(Handle);
{$ENDIF}
  UpdateScrollBars;
end;

procedure TScrollingWinControl.AlignControls(AControl: TControl; var ARect: TRect);
begin
  CalcAutoRange;
  inherited AlignControls(AControl, ARect);
end;

function TScrollingWinControl.AutoScrollEnabled: Boolean;
begin
  Result := not AutoSize and not (DockSite and UseDockManager);
end;

procedure TScrollingWinControl.DoFlipChildren;
var
  Loop: Integer;
  TheWidth: Integer;
  ScrollBarActive: Boolean;
  FlippedList: TList;
begin
  FlippedList := TList.Create;
  try
    TheWidth := ClientWidth;
    with HorzScrollBar do begin
      ScrollBarActive := (IsScrollBarVisible) and (TheWidth < Range);
      if ScrollBarActive then
      begin
        TheWidth := Range;
        Position := 0;
      end;
    end;

    for Loop := 0 to ControlCount - 1 do with Controls[Loop] do
    begin
      FlippedList.Add(Controls[Loop]);
      Left := TheWidth - Width - Left;
    end;

    { Allow controls that have associations to realign themselves }
    for Loop := 0 to FlippedList.Count - 1 do
      TControl(FlippedList[Loop]).Perform(CM_ALLCHILDRENFLIPPED, 0, 0);

    if ScrollBarActive then
      HorzScrollBar.ChangeBiDiPosition;
  finally
     FlippedList.Free;
  end;
end;

procedure TScrollingWinControl.DoGesture(const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiPan then
  begin
    Handled := True;
    if gfBegin in EventInfo.Flags then
      FPanPoint := EventInfo.Location
    else
    begin
      HorzScrollBar.Position := HorzScrollBar.Position - (EventInfo.Location.X - FPanPoint.X);
      VertScrollBar.Position := VertScrollBar.Position - (EventInfo.Location.Y - FPanPoint.Y);
      FPanPoint := EventInfo.Location
                                           
    end;
  end;
end;

procedure TScrollingWinControl.DoGetGestureOptions(
  var Gestures: TInteractiveGestures; var Options: TInteractiveGestureOptions);
begin
  inherited DoGetGestureOptions(Gestures, Options);
  if (igPan in Gestures) and
    not VertScrollBar.IsScrollBarVisible and
    not HorzScrollBar.IsScrollBarVisible then
    Gestures := Gestures - [igPan];
end;

procedure TScrollingWinControl.CalcAutoRange;
begin
  if FAutoRangeCount <= 0 then
  begin
    HorzScrollBar.CalcAutoRange;
    VertScrollBar.CalcAutoRange;
  end;
end;

procedure TScrollingWinControl.SetAutoScroll(Value: Boolean);
begin
  if FAutoScroll <> Value then
  begin
    FAutoScroll := Value;
    if Value then CalcAutoRange else
    begin
      HorzScrollBar.Range := 0;
      VertScrollBar.Range := 0;
    end;
  end;
end;

procedure TScrollingWinControl.SetHorzScrollBar(Value: TControlScrollBar);
begin
  FHorzScrollBar.Assign(Value);
end;

procedure TScrollingWinControl.SetVertScrollBar(Value: TControlScrollBar);
begin
  FVertScrollBar.Assign(Value);
end;

procedure TScrollingWinControl.UpdateScrollBars;
begin
  if not FUpdatingScrollBars and HandleAllocated then
    try
      FUpdatingScrollBars := True;
      if FVertScrollBar.NeedsScrollBarVisible then
      begin
        FHorzScrollBar.Update(False, True);
        FVertScrollBar.Update(True, False);
      end
      else if FHorzScrollBar.NeedsScrollBarVisible then
      begin
        FVertScrollBar.Update(False, True);
        FHorzScrollBar.Update(True, False);
      end
      else
      begin
        FVertScrollBar.Update(False, False);
        FHorzScrollBar.Update(True, False);
      end;
    finally
      FUpdatingScrollBars := False;
      if sfHandleMessages in StyleServices.Flags then
        SendMessage(Handle, WM_NCPAINT, 0, 0);
    end;
end;

procedure TScrollingWinControl.AutoScrollInView(AControl: TControl);
begin
  if (AControl <> nil) and not (csLoading in AControl.ComponentState) and
    not (csLoading in ComponentState) and not (csDestroying in ComponentState) then
    ScrollInView(AControl);
end;

procedure TScrollingWinControl.DisableAutoRange;
begin
  Inc(FAutoRangeCount);
end;

procedure TScrollingWinControl.EnableAutoRange;
begin
  if FAutoRangeCount > 0 then
  begin
    Dec(FAutoRangeCount);
    if (FAutoRangeCount = 0) and (FHorzScrollBar.Visible or
      FVertScrollBar.Visible) then CalcAutoRange;
  end;
end;

function TScrollingWinControl.IsTouchPropertyStored(AProperty: TTouchProperty): Boolean;
begin
  Result := inherited IsTouchPropertyStored(AProperty);
  case AProperty of
    tpInteractiveGestures:
      Result := Touch.InteractiveGestures <> [igPan, igPressAndTap];
    tpInteractiveGestureOptions:
      Result := Touch.InteractiveGestureOptions <> [igoPanInertia,
        igoPanSingleFingerHorizontal, igoPanSingleFingerVertical,
        igoParentPassthrough];
  end;
end;

procedure TScrollingWinControl.ScrollInView(AControl: TControl);
var
  Rect: TRect;
begin
  if AControl = nil then Exit;
  Rect := AControl.ClientRect;
  Dec(Rect.Left, HorzScrollBar.Margin);
  Inc(Rect.Right, HorzScrollBar.Margin);
  Dec(Rect.Top, VertScrollBar.Margin);
  Inc(Rect.Bottom, VertScrollBar.Margin);
  Rect.TopLeft := ScreenToClient(AControl.ClientToScreen(Rect.TopLeft));
  Rect.BottomRight := ScreenToClient(AControl.ClientToScreen(Rect.BottomRight));
  if Rect.Left < 0 then
    with HorzScrollBar do Position := Position + Rect.Left
  else if Rect.Right > ClientWidth then
  begin
    if Rect.Right - Rect.Left > ClientWidth then
      Rect.Right := Rect.Left + ClientWidth;
    with HorzScrollBar do Position := Position + Rect.Right - ClientWidth;
  end;
  if Rect.Top < 0 then
    with VertScrollBar do Position := Position + Rect.Top
  else if Rect.Bottom > ClientHeight then
  begin
    if Rect.Bottom - Rect.Top > ClientHeight then
      Rect.Bottom := Rect.Top + ClientHeight;
    with VertScrollBar do Position := Position + Rect.Bottom - ClientHeight;
  end;
end;

procedure TScrollingWinControl.ScaleScrollBars(M, D: Integer);
begin
  if M <> D then
  begin
    if not (csLoading in ComponentState) then
    begin
      HorzScrollBar.FScaled := True;
      VertScrollBar.FScaled := True;
    end;

    if not FAutoScroll then
    begin
      HorzScrollBar.Scale(M, D);
      VertScrollBar.Scale(M, D);
    end;
  end;
  HorzScrollBar.FScaled := False;
  VertScrollBar.FScaled := False;
end;

procedure TScrollingWinControl.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  ScaleScrollBars(M, D);
  inherited ChangeScale(M, D, isDpiChange);
end;

procedure TScrollingWinControl.Resizing(State: TWindowState);
begin
  // Overridden by TCustomFrame
end;

procedure TScrollingWinControl.WMSize(var Message: TWMSize);
var
  NewState: TWindowState;
  SaveUpdatingScrollBars: Boolean;
begin
  Inc(FAutoRangeCount);
  try
    inherited;
    NewState := wsNormal;
{$IF DEFINED(CLR)}
    case Message.SizeType.ToInt64 of
{$ELSE}
    case Message.SizeType of
{$ENDIF}
      SIZENORMAL: NewState := wsNormal;
      SIZEICONIC: NewState := wsMinimized;
      SIZEFULLSCREEN: NewState := wsMaximized;
    end;
    Resizing(NewState);
  finally
    Dec(FAutoRangeCount);
  end;
  SaveUpdatingScrollBars := FUpdatingScrollBars;
  FUpdatingScrollBars := True;
  try
    CalcAutoRange;
  finally
    FUpdatingScrollBars := SaveUpdatingScrollBars;
  end;
  if FHorzScrollBar.Visible or FVertScrollBar.Visible then
    UpdateScrollBars;
end;

procedure TScrollingWinControl.WMHScroll(var Message: TWMHScroll);
begin
  if (Message.ScrollBar = 0) and FHorzScrollBar.Visible then
    FHorzScrollBar.ScrollMessage(Message) else
    inherited;
end;

procedure TScrollingWinControl.WMVScroll(var Message: TWMVScroll);
begin
  if (Message.ScrollBar = 0) and FVertScrollBar.Visible then
    FVertScrollBar.ScrollMessage(Message) else
    inherited;
end;

procedure TScrollingWinControl.AdjustClientRect(var Rect: TRect);
begin
  Rect := Bounds(-HorzScrollBar.Position, -VertScrollBar.Position,
    Max(HorzScrollBar.Range, ClientWidth), Max(ClientHeight,
    VertScrollBar.Range));
  inherited AdjustClientRect(Rect);
end;

procedure TScrollingWinControl.CMBiDiModeChanged(var Message: TMessage);
var
  Save: Integer;
begin
  Save := Message.WParam;
  try
    { prevent inherited from calling Invalidate & RecreateWnd }
    if not (Self is TScrollBox) then Message.wParam := 1;
    inherited;
  finally
    Message.wParam := Save;
  end;
  if HandleAllocated then
  begin
    HorzScrollBar.ChangeBiDiPosition;
    UpdateScrollBars;
  end;
end;

procedure TScrollingWinControl.SendChangeScaleMessage(M, D: Integer);
begin
  if M <> D then
    TMessageManager.DefaultManager.SendMessage(Self,
      TChangeScaleMessage.Create(Self, M, D));
end;

{ TScrollBox }

class constructor TScrollBox.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TScrollBox, TScrollBoxStyleHook);
end;

constructor TScrollBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csDoubleClicks, csPannable, csGestures];
  AutoScroll := True;
  Width := 185;
  Height := 41;
  FBorderStyle := bsSingle;
end;

class destructor TScrollBox.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TScrollBox, TScrollBoxStyleHook);
end;

procedure TScrollBox.CMVisibleChanged(var Message: TMessage);
begin
  inherited;
  if Visible then
    UpdateScrollBars;
end;

procedure TScrollBox.CreateParams(var Params: TCreateParams);
const
  BorderStyles: array[TBorderStyle] of DWORD = (0, WS_BORDER);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or BorderStyles[FBorderStyle];
    if NewStyleControls and Ctl3D and (FBorderStyle = bsSingle) then
    begin
      Style := Style and not WS_BORDER;
      ExStyle := ExStyle or WS_EX_CLIENTEDGE;
    end;
  end;
end;

procedure TScrollBox.SetBorderStyle(Value: TBorderStyle);
begin
  if Value <> FBorderStyle then
  begin
    FBorderStyle := Value;
    RecreateWnd;
  end;
end;

procedure TScrollBox.WMNCHitTest(var Message: TWMNCHitTest);
begin
  DefaultHandler(Message);
end;

procedure TScrollBox.CMCtl3DChanged(var Message: TMessage);
begin
  if NewStyleControls and (FBorderStyle = bsSingle) then RecreateWnd;
  inherited;
end;

procedure TScrollBox.PaintWindow(DC: HDC);
begin
  //  Do nothing
end;

{ TCustomFrame }

constructor TCustomFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csDoubleClicks, csParentBackground, csPannable, csGestures];
  if (ClassType <> TFrame) and not (csDesignInstance in ComponentState) then
  begin
    if not InitInheritedComponent(Self, TFrame) then
      raise EResNotFound.CreateFmt(SResNotFound, [ClassName]);
  end
  else
  begin
    Width := 320;
    Height := 240;
  end;
end;

procedure TCustomFrame.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if Parent = nil then
    Params.WndParent := Application.Handle;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomFrame.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  OwnedComponent: TComponent;
begin
  inherited GetChildren(Proc, Root);
  if Root = Self then
    for I := 0 to ComponentCount - 1 do
    begin
      OwnedComponent := Components[I];
      if not OwnedComponent.HasParent then Proc(OwnedComponent);
    end;
end;

procedure TCustomFrame.PaintWindow(DC: HDC);
begin
  // Paint a grid if designing a frame that paints its own background
  if (csDesigning in ComponentState) and (Parent is TForm) then
    with TForm(Parent) do
      if (Designer <> nil) and (Designer.GetRoot = Self) and
        (not StyleServices.Enabled or not Self.ParentBackground) then
        Designer.PaintGrid
end;

procedure TCustomFrame.ChangeScale(M, D: Integer; isDpiChange: Boolean);
begin
  SendChangeScaleMessage(M, D);
  inherited;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomFrame.SetParent(AParent: TWinControl);
var
  LRecreate: Boolean;
begin
  LRecreate := HandleAllocated;
  if LRecreate then
    UpdateRecreatingFlag(True);
  try
    if (Parent = nil) and LRecreate then
      DestroyHandle;
    inherited;
  finally
    if LRecreate then
      UpdateRecreatingFlag(False);
  end;
end;

{ TCustomActiveForm }

constructor TCustomActiveForm.Create(AOwner: TComponent);
begin
  FAxBorderStyle := afbSingle;
  inherited Create(AOwner);
  BorderStyle := bsNone;
  BorderIcons := [];
  TabStop := True;
end;

procedure TCustomActiveForm.SetAxBorderStyle(Value: TActiveFormBorderStyle);
begin
  if FAxBorderStyle <> Value then
  begin
    FAxBorderStyle := Value;
    if not (csDesigning in ComponentState) then RecreateWnd;
  end;
end;

procedure TCustomActiveForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if not (csDesigning in ComponentState) then
    with Params do
    begin
      Style := Style and not WS_CAPTION;
      case FAxBorderStyle of
        afbNone: ;// do nothing
        afbSingle: Style := Style or WS_BORDER;
        afbSunken: ExStyle := ExStyle or WS_EX_CLIENTEDGE;
        afbRaised:
          begin
            Style := Style or WS_DLGFRAME;
            ExStyle := ExStyle or WS_EX_WINDOWEDGE;
          end;
      end;
    end;
end;

function TCustomActiveForm.WantChildKey(Child: TControl; var Message: TMessage): Boolean;
begin
  Result := ((Message.Msg = WM_CHAR) and (Message.WParam = VK_TAB)) or
    (Child.Perform(CN_BASE + Message.Msg, Message.WParam,
      Message.LParam) <> 0);
end;

{ TCustomForm }

class constructor TCustomForm.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TCustomForm, TFormStyleHook);
end;

constructor TCustomForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IF DEFINED(CLR)}
  GlobalNameSpace.AcquireWriterLock(MaxInt);
{$ELSE}
  GlobalNameSpace.BeginWrite;
{$ENDIF}
  try
    FCreatingMainForm := Application.FCreatingMainForm;
    if FCreatingMainForm then
      Application.FCreatingMainForm := False;

    InitializeNewForm;
    if (ClassType <> TForm) and not (csDesigning in ComponentState) then
    begin
      Include(FFormState, fsCreating);
      try
        DisableAlign;
        if not InitInheritedComponent(Self, TForm) then
          raise EResNotFound.CreateFmt(SResNotFound, [ClassName]);
      finally
        Exclude(FFormState, fsCreating);
        EnableAlign;
      end;
{$IF NOT DEFINED(CLR)}
      if OldCreateOrder then
{$ENDIF}
        DoCreate;
    end;
  finally
{$IF DEFINED(CLR)}
    GlobalNameSpace.ReleaseWriterLock;
{$ELSE}
    GlobalNameSpace.EndWrite;
{$ENDIF}
  end;
  ControlStyle := ControlStyle + [csPaintBlackOpaqueOnGlass];
end;

class destructor TCustomForm.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TCustomForm, TFormStyleHook);
end;

{$IF NOT DEFINED(CLR)}
procedure TCustomForm.AfterConstruction;
begin
  if not OldCreateOrder then DoCreate;
  if fsActivated in FFormState then
  begin
    Activate;
    Exclude(FFormState, fsActivated);
  end;
end;
{$ENDIF}

procedure TCustomForm.InitializeNewForm;
begin
  ControlStyle := [csAcceptsControls, csCaptureMouse, csClickEvents,
    csSetCaption, csDoubleClicks, csPannable, csGestures];
  Left := 0;
  Top := 0;
  Width := 320;
  Height := 240;
  FScaled := True;
  FIcon := TIcon.Create;
  FIcon.Width := GetSystemMetrics(SM_CXSMICON);
  FIcon.Height := GetSystemMetrics(SM_CYSMICON);
  FIcon.OnChange := IconChanged;
  FPosition := poDefaultPosOnly;
  FCanvas := TControlCanvas.Create;
  FCanvas.Control := Self;
  FBorderIcons := [biSystemMenu, biMinimize, biMaximize];
  FBorderStyle := bsSizeable;
  FWindowState := wsNormal;
  FDefaultMonitor := dmActiveForm;
  FInCMParentBiDiModeChanged := False;
  FPixelsPerInch := Screen.PixelsPerInch;
  FGlassFrame := TGlassFrame.Create(Self);
  FGlassFrame.OnChange := UpdateGlassFrame;
  FRefreshGlassFrame := False;
  FPrintScale := poProportional;
  FloatingDockSiteClass := TWinControlClass(ClassType);
  FAlphaBlendValue := 255;
  FTransparentColorValue := 0;
  Visible := False;
  ParentColor := False;
  ParentFont := False;
  ParentDoubleBuffered := False;
  Ctl3D := True;
  Screen.AddForm(Self);
  FSnapBuffer := 10;
end;

constructor TCustomForm.CreateNew(AOwner: TComponent; Dummy: Integer = 0);
begin
  inherited Create(AOwner);
  InitializeNewForm;
end;

{$IF NOT DEFINED(CLR)}
procedure TCustomForm.BeforeDestruction;
begin
  GlobalNameSpace.BeginWrite;
  Destroying;
  Screen.FSaveFocusedList.Remove(Self);
  RemoveFixupReferences(Self, '');
  if FOleForm <> nil then FOleForm.OnDestroy;
  if (FormStyle <> fsMDIChild) and not (fsShowing in FFormState) then Hide;
  if not OldCreateOrder then DoDestroy;
end;
{$ENDIF}

destructor TCustomForm.Destroy;
{$IF DEFINED(CLR)}
var
  Locked: Boolean;
{$ENDIF}
begin
{$IF DEFINED(CLR)}
  Locked := False;
  if not (csDestroying in ComponentState) then
  begin
    Locked := True;
    GlobalNameSpace.AcquireWriterLock(MaxInt);
    Destroying;
  end;
{$ELSE}
  Application.RemovePopupForm(Self);
  if not (csDestroying in ComponentState) then GlobalNameSpace.BeginWrite;
{$ENDIF}
  try
{$IF DEFINED(CLR)}
    Screen.FSaveFocusedList.Remove(Self);
    RemoveFixupReferences(Self, '');
    if Assigned(FOleForm) then
      FOleForm.OnDestroy;
    if (FormStyle <> fsMDIChild) and not (fsShowing in FFormState) then Hide;
{$ELSE}
    if OldCreateOrder then
{$ENDIF}
    DoDestroy;
    MergeMenu(False);
    if HandleAllocated then DestroyWindowHandle;
    Screen.RemoveForm(Self);
    FreeAndNil(FCanvas);
    FreeAndNil(FIcon);
    FreeAndNil(FPopupChildren);
    FreeAndNil(FRecreateChildren);
    FreeAndNil(FGlassFrame);
    inherited Destroy;
  finally
{$IF DEFINED(CLR)}
    if Locked then GlobalNameSpace.ReleaseWriterLock;
{$ELSE}
    GlobalNameSpace.EndWrite;
{$ENDIF}
  end;
end;

procedure TCustomForm.DoCreate;
begin
  if Assigned(FOnCreate) then
  try
    FOnCreate(Self);
  except
    if not HandleCreateException then
      raise;
  end;
  if fsVisible in FFormState then Visible := True;
end;

procedure TCustomForm.DoDestroy;
begin
  if Assigned(FOnDestroy) then
  try
    FOnDestroy(Self);
  except
    Application.HandleException(Self);
  end;
end;

procedure TCustomForm.Loaded;
var
  Control: TWinControl;
begin
  ScaleForCurrentDpi;
  inherited Loaded;
  if (ActiveControl <> nil) and ((Parent = nil) or not (csDesigning in ComponentState)) then
  begin
    Control := ActiveControl;
    FActiveControl := nil;
    if Control.CanFocus then SetActiveControl(Control);
  end;
  if ParentFont then
  begin
    Font.Assign(Application.DefaultFont);
    ParentFont := True;
  end;
  if FGlassFrame.FrameExtended then
    UpdateGlassFrame(nil);
end;

procedure TCustomForm.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  I: Integer;
begin
  inherited Notification(AComponent, Operation);
  case Operation of
    opInsert:
      begin
        if not (csLoading in ComponentState) and (Menu = nil) and
          (AComponent.Owner = Self) and (AComponent is TMainMenu) then
          Menu := TMainMenu(AComponent);
      end;
    opRemove:
      begin
        if Menu = AComponent then Menu := nil;
        if WindowMenu = AComponent then WindowMenu := nil;
        if ObjectMenuItem = AComponent then ObjectMenuItem := nil;
        if PopupParent = AComponent then PopupParent := nil;
        if TaskbarHandler = AComponent then TaskbarHandler := nil;
        if Assigned(FPopupChildren) then
        begin
          I := FPopupChildren.IndexOf(AComponent);
          if I >= 0 then
          begin
            FPopupChildren.Delete(I);
            AComponent.RemoveFreeNotification(Self);
          end;
        end;
        if Assigned(FRecreateChildren) then
        begin
          I := FRecreateChildren.IndexOf(AComponent);
          if I >= 0 then
          begin
            FRecreateChildren.Delete(I);
            AComponent.RemoveFreeNotification(Self);
          end;
        end;
        if FInternalPopupParent = AComponent then FInternalPopupParent := nil;
{$IF NOT DEFINED(CLR)}
        if FActiveOleControl = AComponent then FActiveOleControl := nil;
{$ENDIF}
        if FTaskbarHandler = AComponent then FTaskbarHandler := nil;
      end;
  end;
  if FDesigner <> nil then
    FDesigner.Notification(AComponent, Operation);
end;

function TCustomForm.GetDesignDpi: Integer;
begin
  Result := FPixelsPerInch;
end;

procedure TCustomForm.ScaleForPPI(NewPPI: Integer);
begin
  ScaleForPPIRect(NewPPI, nil);
end;

procedure TCustomForm.ScaleConstraints(M, D: Integer; SizeChanged: Boolean);
begin
  if M = D then Exit;

  with Constraints do
    if SizeChanged xor (M > D) then
    begin
      if MaxWidth > 0 then
        MaxWidth := MulDiv(MaxWidth, M, D);
      if MaxHeight > 0 then
        MaxHeight := MulDiv(MaxHeight, M, D);
    end
    else
    begin
      if MinWidth > 0 then
        MinWidth := MulDiv(MinWidth, M, D);
      if MinHeight > 0 then
        MinHeight := MulDiv(MinHeight, M, D);
    end;
end;

procedure TCustomForm.ScaleNormalSize(M, D: Integer);
var
  WindowPlacement: TWindowPlacement;
begin
  if WindowState = wsMaximized then
  begin
    WindowPlacement.length := SizeOf(WindowPlacement);
    if GetWindowPlacement(Handle, @WindowPlacement) then
    begin
      WindowPlacement.rcNormalPosition.Right := WindowPlacement.rcNormalPosition.Left
        + MulDiv(WindowPlacement.rcNormalPosition.Width, M, D);
      WindowPlacement.rcNormalPosition.Bottom := WindowPlacement.rcNormalPosition.Top
        + MulDiv(WindowPlacement.rcNormalPosition.Height, M, D);
      SetWindowPlacement(Handle, @WindowPlacement);
    end;
  end;
end;

procedure TCustomForm.ScaleForPPIRect(NewPPI: Integer; NewRect: PRect);
var
  LCurrentPixelsPerInch: Integer;
  I: Integer;
  PriorHeight: Integer;
begin
  if NewPPI < 30 then
    Exit;

  if FCurrentPPI = 0 then
    LCurrentPixelsPerInch := FPixelsPerInch
  else
    LCurrentPixelsPerInch := FCurrentPPI;

  if LCurrentPixelsPerInch <> NewPPI then
  begin
    SendChangeScaleMessage(NewPPI, LCurrentPixelsPerInch);

    ScaleScrollBars(NewPPI, LCurrentPixelsPerInch);
    ScaleControlsForDpi(NewPPI);
    ScaleConstraints(NewPPI, LCurrentPixelsPerInch, False);

    if NewRect = nil then
    begin
      if (sfWidth in ScalingFlags) or (sfHeight in ScalingFlags) then
      begin
        if sfWidth in ScalingFlags then
          FClientWidth := MulDiv(FClientWidth, NewPPI, LCurrentPixelsPerInch);
        if sfHeight in ScalingFlags then
          FClientHeight := MulDiv(FClientHeight, NewPPI, LCurrentPixelsPerInch);
        if FClientWidth > 0 then inherited ClientWidth := FClientWidth;
        if FClientHeight > 0 then inherited ClientHeight := FClientHeight;
      end
      else if IsClientSizeStored then
      begin
        PriorHeight := ClientHeight;
        ClientWidth := MulDiv(ClientWidth, NewPPI, LCurrentPixelsPerInch);
        ClientHeight := MulDiv(PriorHeight, NewPPI, LCurrentPixelsPerInch);
      end;
      if sfDesignSize in ScalingFlags then
      begin
        FDesignSize.X := MulDiv(FDesignSize.X, NewPPI, LCurrentPixelsPerInch);
        FDesignSize.Y := MulDiv(FDesignSize.Y, NewPPI, LCurrentPixelsPerInch);
      end;
    end
    else
      SetBounds(NewRect^.Left, NewRect^.Top, NewRect^.Width, NewRect^.Height);

    if not ParentFont then
      Font.Height := MulDiv(Font.Height, NewPPI, LCurrentPixelsPerInch);
    ScaleConstraints(NewPPI, LCurrentPixelsPerInch, True);

    for I := 0 to MDIChildCount - 1 do
      MDIChildren[I].ScaleForPPI(NewPPI);
    FCurrentPPI := NewPPI;
    Realign;
    ScaleNormalSize(NewPPI, LCurrentPixelsPerInch);
  end
  else
  begin
    if FClientWidth > 0 then inherited ClientWidth := FClientWidth;
    if FClientHeight > 0 then inherited ClientHeight := FClientHeight;
  end;
end;

function ShouldScale(const self: TCustomForm): Boolean;
  // this is just to make code more readable
                                                                                  
begin
  Result := self.FScaled and not (csDesigning in self.ComponentState)
    and ((self.Owner = nil) or not (LowerCase(self.Owner.ClassName) = 'teditwindow'))  // we are not in an edit window
    and ((self.Parent = nil) or not (csDesigning in self.Parent.ComponentState) or not (csFreeNotification in self.Parent.ComponentState));
end;

procedure TCustomForm.ScaleForCurrentDpi;
var
  LCurrentPixelsPerInch: Integer;
begin
  DisableAlign;
  try
    LCurrentPixelsPerInch := FCurrentPPI;
    if ShouldScale(self) then
      ScaleForPPI(GetCurrentPPIScreen)
    else
      ScaleForPPI(FCurrentPPI);

    ScalingFlags := [];
    if LCurrentPixelsPerInch = FCurrentPPI then
    begin   // if we havent scaled force to change scaling flags
      { Forces all ScalingFlags to [] }
      ScaleScrollBars(1, 1);
      ScaleControls(1, 1);
    end;
    Perform(CM_PARENTBIDIMODECHANGED, 0, 0);
  finally
    EnableAlign;
  end;
end;

procedure TCustomForm.ReadState(Reader: TReader);
begin
{$IF NOT DEFINED(CLR)}
  if ClassParent = TForm then
    FOldCreateOrder := not ModuleIsCpp;
{$ENDIF}
  DisableAlign;
  try
    inherited ReadState(Reader);
  finally
    EnableAlign;
  end;
end;

procedure TCustomForm.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('PixelsPerInch', nil, WritePixelsPerInch, not IsControl);
  Filer.DefineProperty('TextHeight', ReadTextHeight, WriteTextHeight, not IsControl);
  Filer.DefineProperty('IgnoreFontProperty', ReadIgnoreFontProperty, nil, False);
{$IF DEFINED(CLR)}
  Filer.DefineProperty('OldCreateOrder', IgnoreIdent, nil, False);
{$ENDIF}
end;

procedure TCustomForm.ReadIgnoreFontProperty(Reader: TReader);
begin   // reroute BCB IgnoreFontProperty to use VCL locale font solution
  if Reader.ReadBoolean then
    ParentFont := True;
end;

{$IF DEFINED(CLR)}
procedure TCustomForm.IgnoreIdent(Reader: TReader);
begin
  Reader.ReadIdent;
end;
{$ENDIF}

procedure TCustomForm.ReadTextHeight(Reader: TReader);
begin
  FTextHeight := Reader.ReadInteger;
end;

procedure TCustomForm.WriteTextHeight(Writer: TWriter);
begin
  Writer.WriteInteger(GetTextHeight);
end;

procedure TCustomForm.WritePixelsPerInch(Writer: TWriter);
begin
  Writer.WriteInteger(GetPixelsPerInch);
end;

{$IF DEFINED(CLR)}
function TCustomForm.GetService(AType: System.Type): TObject;
begin
  Result := inherited GetService(AType);
  if Result = nil then
    if AType.IsAssignableFrom(Self.GetType) then
      Result := Self
    else if FDesigner <> nil then
      Result := FDesigner.GetService(AType);
end;
{$ENDIF}

function TCustomForm.GetLeft: Integer;
begin
  if (csDesigning in ComponentState) and (Parent <> nil) then
    Result := SmallInt((DesignInfo and $FFFF0000) shr 16)
  else
    Result := inherited Left;
end;

function TCustomForm.GetTop: Integer;
begin
  if (csDesigning in ComponentState) and (Parent <> nil) then
    Result := SmallInt(DesignInfo and $0000FFFF)
  else
    Result := inherited Top;
end;

function TCustomForm.GetTextHeight: Integer;
begin
  Result := Canvas.TextHeight('0');
end;

procedure TCustomForm.BeginAutoDrag;
begin
  { Do nothing }
end;

procedure TCustomForm.ChangeScale(M, D: Integer; isDpiChange: Boolean);
var
  PriorHeight: Integer;
begin
  SendChangeScaleMessage(M, D);

  ScaleScrollBars(M, D);
  ScaleControls(M, D);
  ScaleConstraints(M, D, False);

  if IsClientSizeStored then
  begin
    PriorHeight := ClientHeight;
    ClientWidth := MulDiv(ClientWidth, M, D);
    ClientHeight := MulDiv(PriorHeight, M, D);
  end;
  if not ParentFont then
    Font.Height := MulDiv(Font.Height, M, D);
  ScaleConstraints(M, D, True);
end;

procedure TCustomForm.IconChanged(Sender: TObject);
begin
  if NewStyleControls then
  begin
    if HandleAllocated and (BorderStyle <> bsDialog) then
      SendMessage(Handle, WM_SETICON, ICON_BIG, GetIconHandle);
  end else
    if IsIconic(Handle) then Invalidate;
end;

function TCustomForm.IsClientSizeStored: Boolean;
begin
  Result := not IsFormSizeStored;
end;

function TCustomForm.IsFormSizeStored: Boolean;
begin
  Result := AutoScroll or (HorzScrollBar.Range <> 0) or (VertScrollBar.Range <> 0);
end;

function TCustomForm.IsAutoScrollStored: Boolean;
begin
  Result := IsForm and
    (AutoScroll = (BorderStyle in [bsSizeable, bsSizeToolWin]));
end;

procedure TCustomForm.DoClose(var Action: TCloseAction);
begin
  if Assigned(FOnClose) then FOnClose(Self, Action);
end;

procedure TCustomForm.DoHide;
begin
  if Assigned(FOnHide) then FOnHide(Self);
end;

procedure TCustomForm.DoShow;
begin
  if Assigned(FOnShow) then FOnShow(Self);
end;

procedure TCustomForm.DoThumbButtonNotify(ItemID: Word);
begin
  if FTaskbarHandler <> nil then
    FTaskbarHandler.DoThumbButtonNotify(ItemID);
end;

procedure TCustomForm.DoWindowPreviewRequest;
begin
  if FTaskbarHandler <> nil then
    FTaskbarHandler.DoWindowPreviewRequest;
end;

procedure TCustomForm.DoThumbPreviewRequest(APreviewHeight, APreviewWidth: Word);
begin
  if FTaskbarHandler <> nil then
    FTaskbarHandler.DoThumbPreviewRequest(APreviewHeight, APreviewWidth);
end;

function TCustomForm.GetClientRect: TRect;
begin
  if IsIconic(Handle) then
  begin
    SetRect(Result, 0, 0, 0, 0);
    AdjustWindowRectEx(Result, GetWindowLong(Handle, GWL_STYLE),
      Menu <> nil, GetWindowLong(Handle, GWL_EXSTYLE));
    SetRect(Result, 0, 0,
      Width - Result.Right + Result.Left,
      Height - Result.Bottom + Result.Top);
  end else
    Result := inherited GetClientRect;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomForm.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  OwnedComponent: TComponent;
begin
  inherited GetChildren(Proc, Root);
  if Root = Self then
    for I := 0 to ComponentCount - 1 do
    begin
      OwnedComponent := Components[I];
      if not OwnedComponent.HasParent then Proc(OwnedComponent);
    end;
end;

function TCustomForm.GetOwnerWindow: HWND;
begin
  if WindowHandle <> 0 then
    Result := GetWindow(WindowHandle, GW_OWNER)
  else
    Result := 0;
end;

function TCustomForm.GetFloating: Boolean;
begin
  Result := (inherited GetFloating) or
            ((HostDockSite = nil) and (FloatingDockSiteClass = ClassType));
end;

function TCustomForm.GetInternalTextHeight: Integer;
begin
  Result := FTextHeight;
end;

procedure TCustomForm.SetChildOrder(Child: TComponent; Order: Integer);
var
  I, J: Integer;
begin
  if Child is TControl then
    inherited SetChildOrder(Child, Order)
  else
  begin
    Dec(Order, ControlCount);
    J := -1;
    for I := 0 to ComponentCount - 1 do
      if not Components[I].HasParent then
      begin
        Inc(J);
        if J = Order then
        begin
          Child.ComponentIndex := I;
          Exit;
        end;
      end;
  end;
end;

procedure TCustomForm.SetParentBiDiMode(Value: Boolean);
begin
  if ParentBiDiMode <> Value then
  begin
    inherited;
    { if there is no parent, then the parent is Application }
    if Parent = nil then
      Perform(CM_PARENTBIDIMODECHANGED, 0, 0);
  end;
end;

procedure TCustomForm.SetClientWidth(Value: Integer);
begin
  if csReadingState in ControlState then
  begin
    FClientWidth := Value;
    ScalingFlags := ScalingFlags + [sfWidth];
  end else inherited ClientWidth := Value;
end;

procedure TCustomForm.SetClientHeight(Value: Integer);
begin
  if csReadingState in ControlState then
  begin
    FClientHeight := Value;
    ScalingFlags := ScalingFlags + [sfHeight];
  end else inherited ClientHeight := Value;
end;

procedure TCustomForm.SetVisible(Value: Boolean);
var
  LChanged: Boolean;
begin
  if fsCreating in FFormState then
    if Value then
      Include(FFormState, fsVisible) else
      Exclude(FFormState, fsVisible)
  else
  begin
    LChanged := Visible <> Value;
    if Value and LChanged then SetWindowToMonitor;
    inherited Visible := Value;
    if (TaskbarHandler <> nil) and LChanged and not(csDestroying in ComponentState) then
      if Value then
        Perform(RM_TaskBarButtonCreated, 0, 0)
      else
        TaskbarHandler.UnregisterTab;
  end;
end;

procedure TCustomForm.VisibleChanging;
begin
  if (FormStyle = fsMDIChild) and Visible and (Parent = nil) then
    raise EInvalidOperation.Create(SMDIChildNotVisible);
end;

function TCustomForm.WantChildKey(Child: TControl; var Message: TMessage): Boolean;
begin
  Result := False;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomForm.SetParent(AParent: TWinControl);
var
  LRecreate: Boolean;
begin
  if (Parent <> AParent) and (AParent <> Self) then
  begin
    LRecreate := Parent = nil;
    if LRecreate then
      UpdateRecreatingFlag(True);
    try
      if LRecreate then
        DestroyHandle;
      if not (csDesigning in ComponentState) then
        FActiveControl := nil;
      FFocusedControl := nil;
      inherited SetParent(AParent);
      if Parent = nil then UpdateControlState;
    finally
      if LRecreate then
        UpdateRecreatingFlag(False);
    end;
  end;
end;

procedure TCustomForm.ValidateRename(AComponent: TComponent;
  const CurName, NewName: string);
begin
  inherited ValidateRename(AComponent, CurName, NewName);
  if FDesigner <> nil then
    FDesigner.ValidateRename(AComponent, CurName, NewName);
end;

{$IF NOT DEFINED(CLR)}
type
  TMenuItemAccess = class(TMenuItem);
{$ENDIF}

procedure TCustomForm.WndProc(var Message: TMessage);
var
  FocusHandle: HWND;
  SaveIndex: Integer;
  MenuItem: TMenuItem;
  Canvas: TCanvas;
  DC: HDC;
  LControl: TWinControl;
  ParentWnd: HWND;
  ParentForm: TCustomForm;
  WasMinimized: Boolean;
{$IF DEFINED(CLR)}
  MeasureMsg: TWMMeasureItem;
  MeasureInfo: TMeasureItemStruct;
  LItemHeight, LItemWidth: Integer;
  PosMsg: TWMWindowPosChanging;
  Changed: Boolean;
  WindowPos: TWindowPos;
{$ELSE}
  WindowPos: PWindowPos;
{$ENDIF}
begin
  with Message do
    case Msg of
      WM_SYSCOMMAND:
        if ((WParam and $FFF0 = SC_RESTORE) or ((WParam and $FFF0 = SC_MAXIMIZE) and Application.FAppIconic)) and
           (Self = Application.MainForm) and Application.MainFormOnTaskBar then
        begin
          WasMinimized := Winapi.Windows.IsIconic(Application.MainForm.Handle);
          inherited;
          if WasMinimized then
            Application.InternalRestore;
          Exit;
        end;
      WM_ACTIVATE, WM_SETFOCUS, WM_KILLFOCUS:
        begin
          if not FocusMessages then Exit;
          if (Msg = WM_SETFOCUS) and not (csDesigning in ComponentState) then
          begin
            FocusHandle := 0;
            if FormStyle = fsMDIForm then
            begin
              if ActiveMDIChild <> nil then FocusHandle := ActiveMDIChild.Handle;
            end
            else if (FActiveControl <> nil) and (FActiveControl <> Self) then
              FocusHandle := FActiveControl.Handle;
            if FocusHandle <> 0 then
            begin
              Winapi.Windows.SetFocus(FocusHandle);
              Exit;
            end;
          end;
        end;
      CM_SETACTIVECONTROL:
        begin
          ParentWnd := HWND(Message.WParam);
          LControl := nil;
          while (ParentWnd <> 0) and (LControl = nil) do
          begin
            LControl := FindControl(ParentWnd);
            ParentWnd := GetParent(ParentWnd);
          end;
          if LControl <> nil then
          begin
                                       
{$IF DEFINED(CLR)}
            ParentForm := GetParentForm(LControl, False);
            if (FActiveControl <> LControl) and
              ((ParentForm = Self) or (ParentForm <> Screen.FActiveCustomForm)) then
              ParentForm.SetFocusedControl(LControl);
{$ELSE}
            ParentForm := GetParentForm(LControl);
            if ((FActiveControl <> LControl) or (LControl <> Screen.FActiveControl)) and
               (ParentForm <> nil) and
               ((ParentForm = Self) or (ParentForm <> Screen.FActiveCustomForm)) then
            begin
              if (ParentForm.ActiveControl <> nil) and (ParentForm.ActiveControl <> LControl) then
                ParentForm.ActiveControl.PerForm(WM_KILLFOCUS, 0, 0);
              ParentForm.SetFocusedControl(LControl);
            end;
{$ENDIF}
          end;
        end;
      CM_EXIT:
        if HostDockSite <> nil then DeActivate;
      CM_ENTER:
        if HostDockSite <> nil then Activate;
      WM_WINDOWPOSCHANGING:
        if ([csLoading, csDesigning] * ComponentState = [csLoading]) then
        begin
{$IF DEFINED(CLR)}
          Changed := False;
          PosMsg := TWMWindowPosChanging.Create(Message);
          WindowPos := PosMsg.WindowPos;
{$ELSE}
          WindowPos := PWindowPos(Message.lParam);
{$ENDIF}
          if (Position in [poDefault, poDefaultPosOnly]) and
            (WindowState <> wsMaximized) then
          begin
            with WindowPos{$IFNDEF CLR}^{$ENDIF} do flags := flags or SWP_NOMOVE;
{$IF DEFINED(CLR)}
            Changed := True;
{$ENDIF}
          end;
          if (Position in [poDefault, poDefaultSizeOnly]) and
            (BorderStyle in [bsSizeable, bsSizeToolWin]) then
          begin
            with WindowPos{$IFNDEF CLR}^{$ENDIF} do flags := flags or SWP_NOSIZE;
{$IF DEFINED(CLR)}
            Changed := True;
{$ENDIF}
          end;
{$IF DEFINED(CLR)}
          if Changed then
            PosMsg.WindowPos := WindowPos;
{$ENDIF}
        end;
      WM_DRAWITEM:
{$IF DEFINED(CLR)}
        with TWMDrawItem.Create(Message).DrawItemStruct do
{$ELSE}
        with PDrawItemStruct(Message.LParam)^ do
{$ENDIF}
          if (CtlType = ODT_MENU) and Assigned(Menu) and not IsVclControl(HWndItem) then
          begin
            MenuItem := Menu.FindItem(itemID, fkCommand);
            if MenuItem <> nil then
            begin
              Canvas := TControlCanvas.Create;
              with Canvas do
              try
                SaveIndex := SaveDC(hDC);
                try
                  Handle := hDC;
                  Font := Screen.MenuFont;
                  Vcl.Menus.DrawMenuItem(MenuItem, Canvas, rcItem,
                    TOwnerDrawState(LoWord(itemState)));
                finally
                  Handle := 0;
                  RestoreDC(hDC, SaveIndex)
                end;
              finally
                Free;
              end;
              Exit;
            end;
          end;
      WM_MEASUREITEM:
      begin
{$IF DEFINED(CLR)}
        MeasureMsg := TWMMeasureItem.Create(Message);
        MeasureInfo := MeasureMsg.MeasureItemStruct;
        with MeasureInfo do
{$ELSE}
        with PMeasureItemStruct(Message.LParam)^ do
{$ENDIF}
          if (CtlType = ODT_MENU) and Assigned(Menu) then
          begin
            MenuItem := Menu.FindItem(itemID, fkCommand);
            if MenuItem <> nil then
            begin
              DC := GetWindowDC(Handle);
              try
                Canvas := TControlCanvas.Create;
                with Canvas do
                try
                  SaveIndex := SaveDC(DC);
                  try
                    Handle := DC;
                    Font := Screen.MenuFont;
{$IF DEFINED(CLR)}
                    LItemHeight := itemHeight;
                    LItemWidth := itemWidth;
                    (MenuItem as IMenuItem).MeasureItem(Canvas, LItemWidth, LItemHeight);
                    itemHeight := LItemHeight;
                    itemWidth := LItemWidth;
{$ELSE}
                    TMenuItemAccess(MenuItem).MeasureItem(Canvas,
                      Integer(itemWidth), Integer(itemHeight));
{$ENDIF}
                  finally
                    Handle := 0;
                    RestoreDC(DC, SaveIndex);
                  end;
                finally
                  Canvas.Free;
                end;
              finally
                ReleaseDC(Handle, DC);
              end;
{$IF DEFINED(CLR)}
              MeasureMsg.MeasureItemStruct := MeasureInfo;
{$ENDIF}
              Exit;
            end;
          end;
        end;
      WM_DWMCOMPOSITIONCHANGED,
      WM_DWMNCRENDERINGCHANGED:
        UpdateGlassFrame(nil);
      CM_CUSTOMSTYLECHANGED:
        begin
          LControl := ActiveControl;
          Perform(WM_SETREDRAW, Winapi.Windows.WPARAM(LongBool(False)), 0);
          Perform(CM_RECREATEWND, 0, 0);
          Message.Msg := CM_STYLECHANGED;
          Broadcast(Message);
          if LControl <> nil then
            SetActiveControl(LControl);
        end;
    else if Cardinal(Message.Msg) = RM_TaskbarCreated then
      begin
        Perform(CM_WININICHANGE, 0, 0);
        Perform(CM_SYSCOLORCHANGE, 0, 0);
        Perform(CM_SYSFONTCHANGED, 0, 0);
        Perform(CM_PARENTCOLORCHANGED, 0, 0);
        Perform(CM_PARENTFONTCHANGED, 0, 0);
        Perform(CM_PARENTBIDIMODECHANGED, 0, 0);
        Perform(CM_PARENTDOUBLEBUFFEREDCHANGED, 0, 0);
      end
    else if Cardinal(Message.Msg) = RM_TaskBarButtonCreated then
      begin
        if FTaskbarHandler <> nil then
        begin
          TaskbarHandler.Initialize;
          TaskbarHandler.CheckApplyChanges;
        end;
      end;
    end;
  inherited WndProc(Message);
end;

{$IF DEFINED(CLR)}
function TCustomForm.GetClientHandle: HWND;
begin
  if Assigned(FClientHandle) then
    Result := FClientHandle.Handle
  else
    Result := 0;
end;
{$ENDIF}

procedure TCustomForm.ClientWndProc(var Message: TMessage);

  procedure Default;
  begin
    with Message do
      Result := CallWindowProc(FDefClientProc, ClientHandle, Msg, wParam, lParam);
  end;

  function MaximizedChildren: Boolean;
  var
    I: Integer;
  begin
    for I := 0 to MDIChildCount - 1 do
      if MDIChildren[I].WindowState = wsMaximized then
      begin
        Result := True;
        Exit;
      end;
    Result := False;
  end;

var
  LDC: HDC;
  PS: TPaintStruct;
  R: TRect;
{$IF DEFINED(CLR)}
  PaintMsg: TWMPaint;
{$ENDIF}
begin
  with Message do
    case Msg of
      WM_NCHITTEST:
        begin
          Default;
          if Result = HTCLIENT then Result := HTTRANSPARENT;
        end;
      WM_ERASEBKGND:
        begin
          LDC := TWMEraseBkGnd(Message).DC;
          FillRect(LDC, ClientRect, Brush.Handle);
          { Erase the background at the location of an MDI client window }
          if (FormStyle = fsMDIForm) and (ClientHandle <> 0) then
          begin
            Winapi.Windows.GetClientRect(ClientHandle, R);
            FillRect(LDC, R, Brush.Handle);
          end;
          Result := 1;
        end;
      $3F://!
        begin
          Default;
          if FFormStyle = fsMDIForm then
            ShowMDIClientEdge(ClientHandle, (MDIChildCount = 0) or
              not MaximizedChildren);
        end;
      WM_PAINT:
        begin
{$IF DEFINED(CLR)}
          PaintMsg := TWMPaint.Create(Message);
          with PaintMsg do
{$ELSE}
          with TWMPaint(Message) do
{$ENDIF}
          begin
            LDC := DC;
            if LDC = 0 then
              DC := BeginPaint(ClientHandle, PS);
            try
              if LDC = 0 then
              begin
                GetWindowRect(ClientHandle, R);
                R.TopLeft := ScreenToClient(R.TopLeft);
                MoveWindowOrg(DC, -R.Left, -R.Top);
              end;
{$IF DEFINED(CLR)}
              PaintHandler(PaintMsg);
{$ELSE}
              PaintHandler(TWMPaint(Message));
{$ENDIF}
            finally
              if LDC = 0 then
                EndPaint(ClientHandle, PS);
            end;
          end;
        end;
    else
      Default;
    end;
end;

procedure TCustomForm.AlignControls(AControl: TControl; var Rect: TRect);
var
  R: TRect;
begin
  inherited AlignControls(AControl, Rect);
  if ClientHandle <> 0 then
  begin
    with Rect do
      SetWindowPos(ClientHandle, HWND_BOTTOM, Left, Top, Right - Left,
        Bottom - Top, SWP_NOZORDER + SWP_NOACTIVATE);
    if FormStyle = fsMDIForm then
      if Winapi.Windows.GetClientRect(ClientHandle, R) then
        InvalidateRect(ClientHandle, nil, True);
  end;
  if (csGlassPaint in ControlState) and not (csLoading in ComponentState) then
    UpdateGlassFrameControls(System.Types.Rect(FGlassFrame.Left, FGlassFrame.Top,
      ClientWidth - FGlassFrame.Right, ClientHeight - FGlassFrame.Bottom));
end;

procedure TCustomForm.CMBiDiModeChanged(var Message: TMessage);
var
  ExStyle: DWORD;
  Loop: Integer;
begin
  inherited;
  { inherited does not call RecreateWnd, so we need to call SetWindowLong }
  if HandleAllocated then
  begin
    ExStyle := DWORD(GetWindowLong(Handle, GWL_EXSTYLE))and (not WS_EX_RIGHT) and
      (not WS_EX_RTLREADING) and (not WS_EX_LEFTSCROLLBAR);
    AddBiDiModeExStyle(ExStyle);
    SetWindowLong(Handle, GWL_EXSTYLE, ExStyle);
  end;
  { Menus derive from TComponent, so we need to update them here. We cannot
    use FMenu because forms can have many menus. }
  for Loop := 0 to ComponentCount - 1 do
    if Components[Loop] is TMenu then
      TMenu(Components[Loop]).ParentBiDiModeChanged;
end;

procedure TCustomForm.CMParentBiDiModeChanged(var Message: TMessage);
begin
  { Prevent needless recursion }
  if FInCMParentBiDiModeChanged then Exit;
  FInCMParentBiDiModeChanged := True;
  try
    if ParentBiDiMode then
    begin
      { if there is no parent, then the parent is Application }
      if Parent = nil then
        BiDiMode := Application.BiDiMode
      else
        BiDiMode := Parent.BiDiMode;
      ParentBiDiMode := True;
    end;
  finally
    FInCMParentBiDiModeChanged := False;
  end;
end;

procedure TCustomForm.CMPopupHwndDestroy(var Message: TCMPopupHWndDestroy);
var
  Index: Integer;
begin
  if (FindControl(Message.PopupFormInfo.PopupWnd) = nil) or not Message.PopupFormInfo.IsPopup then
  begin
    Index := Length(FPopupWnds);
    SetLength(FPopupWnds, Index + 1);
    FPopupWnds[Index].ID := Message.PopupFormInfo.PopupID;
    FPopupWnds[Index].ControlWnd := Message.PopupControlWnd;
  end;
end;

procedure TCustomForm.SetDesigner(ADesigner: IDesignerHook);
begin
  FDesigner := ADesigner;
end;

procedure TCustomForm.GetBorderIconStyles(var Style, ExStyle: Cardinal);
var
  LIcons: TBorderIcons;
  LBorderStyle: TFormBorderStyle;
begin
  // Clear existing border icon styles
  Style := Style and not (WS_MINIMIZEBOX or WS_MAXIMIZEBOX or WS_SYSMENU);
  ExStyle := ExStyle and not WS_EX_CONTEXTHELP;

  // Account for special casses with MDI children
  LBorderStyle := FBorderStyle;
  if (FormStyle = fsMDIChild) and (LBorderStyle in [bsNone, bsDialog]) then
    LBorderStyle := bsSizeable;

  // Adjust icons based on border style
  LIcons := FBorderIcons;
  case LBorderStyle of
    bsNone: LIcons := [];
    bsDialog: LIcons := LIcons * [biSystemMenu, biHelp];
    bsToolWindow,
    bsSizeToolWin: LIcons := LIcons * [biSystemMenu];
  end;

  // Set border icon styles
  if LBorderStyle in [bsSingle, bsSizeable, bsNone] then
  begin
    if (FormStyle <> fsMDIChild) or (biSystemMenu in LIcons) then
    begin
      if biMinimize in LIcons then Style := Style or WS_MINIMIZEBOX;
      if biMaximize in LIcons then Style := Style or WS_MAXIMIZEBOX;
    end;
  end;
  if biSystemMenu in LIcons then Style := Style or WS_SYSMENU;
  if biHelp in LIcons then ExStyle := ExStyle or WS_EX_CONTEXTHELP;
end;

procedure TCustomForm.SetBorderIcons(Value: TBorderIcons);
var
  LStyle, LExStyle: Cardinal;
begin
  if FBorderIcons <> Value then
  begin
    FBorderIcons := Value;
    if HandleAllocated and (not (csDesigning in ComponentState) or
      ((csDesigning in ComponentState) and (Parent <> nil))) then
    begin
      if not ((FFormStyle = fsMDIChild) and (FWindowState = wsMaximized)) then
      begin
        LStyle := GetWindowLong(Handle, GWL_STYLE);
        LExStyle := GetWindowLong(Handle, GWL_EXSTYLE);
        GetBorderIconStyles(LStyle, LExStyle);

        SetWindowLong(Handle, GWL_STYLE, LStyle);
        SetWindowLong(Handle, GWL_EXSTYLE, LExStyle);
        SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or SWP_NOMOVE or
          SWP_NOZORDER or SWP_NOSIZE or SWP_NOACTIVATE);
      end
      else
        RecreateWnd; // SetWindowLong doesn't remove icons for MDI children
    end;
  end;
end;

procedure TCustomForm.GetBorderStyles(var Style, ExStyle, ClassStyle: Cardinal);
var
  LBorderStyle: TFormBorderStyle;
begin
  // Clear existing border styles
  Style := Style and not (WS_POPUP or WS_CAPTION or WS_BORDER or WS_THICKFRAME or WS_DLGFRAME or DS_MODALFRAME);
  ExStyle := ExStyle and not (WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE or WS_EX_TOOLWINDOW);
  ClassStyle := ClassStyle and not (CS_SAVEBITS or CS_BYTEALIGNWINDOW);

  // Account for special casses with MDI children
  LBorderStyle := FBorderStyle;
  if (FormStyle = fsMDIChild) and (LBorderStyle in [bsNone, bsDialog]) then
    LBorderStyle := bsSizeable;

  // Set new border styles
  case LBorderStyle of
    bsNone:
      if (Parent = nil) and (ParentWindow = 0) then
        Style := Style or WS_POPUP;
    bsSingle, bsToolWindow:
      Style := Style or (WS_CAPTION or WS_BORDER);
    bsSizeable, bsSizeToolWin:
      Style := Style or (WS_CAPTION or WS_THICKFRAME);
    bsDialog:
      begin
        if (csDesigning in ComponentState) and (Parent <> nil) then
          Style := Style or WS_CAPTION
        else
          Style := Style or WS_POPUP or WS_CAPTION;
        ExStyle := ExStyle or WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE;
        if not NewStyleControls then
          Style := Style or WS_DLGFRAME or DS_MODALFRAME;
        ClassStyle := ClassStyle or CS_DBLCLKS or CS_SAVEBITS or CS_BYTEALIGNWINDOW;
      end;
  end;
  if (LBorderStyle in [bsToolWindow, bsSizeToolWin]) and (FormStyle <> fsMDIChild) then
    ExStyle := ExStyle or WS_EX_TOOLWINDOW;
end;

procedure TCustomForm.SetBorderStyle(Value: TFormBorderStyle);
var
  LStyle, LExStyle, LClassStyle: Cardinal;
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    AutoScroll := AutoScroll and (FBorderStyle in [bsSizeable, bsSizeToolWin]);
    if HandleAllocated and (not (csDesigning in ComponentState) or
      ((csDesigning in ComponentState) and (Parent <> nil))) then
    begin
      LStyle := GetWindowLong(Handle, GWL_STYLE);
      LExStyle := GetWindowLong(Handle, GWL_EXSTYLE);
      LClassStyle := GetClassLong(Handle, GCL_STYLE);

      GetBorderStyles(LStyle, LExStyle, LClassStyle);
      GetBorderIconStyles(LStyle, LExStyle);

      SetWindowLong(Handle, GWL_STYLE, LStyle);
      SetWindowLong(Handle, GWL_EXSTYLE, LExStyle);
      SetClassLong(Handle, GCL_STYLE, LClassStyle);

      if HandleAllocated then
      begin
        // Update icon on window frame
        if NewStyleControls then
          if BorderStyle <> bsDialog then
            SendMessage(Handle, WM_SETICON, ICON_BIG, GetIconHandle)
          else
            SendMessage(Handle, WM_SETICON, ICON_BIG, 0);

        // Reset system menu based on new border style
        GetSystemMenu(Handle, True);
        Perform(WM_NCCREATE, 0, 0);
      end;

      SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or SWP_NOMOVE or
        SWP_NOZORDER or SWP_NOSIZE or SWP_NOACTIVATE);
      Invalidate;
    end;
  end;
end;

procedure TCustomForm.Dock(NewDockSite: TWinControl; ARect: TRect);
var
  PrevDockSite, PrevParent: TWinControl;
begin
  PrevParent := Parent;
  PrevDockSite := HostDockSite;
  inherited Dock(NewDockSite, ARect);
  if (Parent <> nil) and (Parent = PrevParent) and
    (PrevDockSite <> HostDockSite) then RecreateWnd;
end;

procedure TCustomForm.DoDock(NewDockSite: TWinControl; var ARect: TRect);
begin
  if (NewDockSite <> HostDockSite) and
    ((NewDockSite = nil) or Floating) then
    if NewDockSite = nil then
      FBorderStyle := FSavedBorderStyle
    else begin
      FSavedBorderStyle := BorderStyle;
      FBorderStyle := bsNone;
    end;
  inherited DoDock(NewDockSite, ARect);
end;

{$IF DEFINED(CLR)}
function TCustomForm.GetFormStyle: TFormStyle;
begin
  Result := FFormStyle;
end;
{$ENDIF}

function TCustomForm.get_ActiveMDIChild: TForm;
begin
  Result := nil;
  if (FormStyle = fsMDIForm) and (ClientHandle <> 0) then
    Result := TForm(FindControl(SendMessage(ClientHandle, WM_MDIGETACTIVE, 0,
      0)));
end;

function TCustomForm.get_MDIChildCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  if (FormStyle = fsMDIForm) and (ClientHandle <> 0) then
    for I := 0 to Screen.FormCount - 1 do
      if Screen.Forms[I].FormStyle = fsMDIChild then Inc(Result);
end;

function TCustomForm.get_MDIChildren(I: Integer): TForm;
var
  J: Integer;
begin
  if (FormStyle = fsMDIForm) and (ClientHandle <> 0) then
    for J := 0 to Screen.FormCount - 1 do
    begin
      Result := Screen.Forms[J];
      if Result.FormStyle = fsMDIChild then
      begin
        Dec(I);
        if I < 0 then Exit;
      end;
    end;
  Result := nil;
end;

{$IF DEFINED(CLR)}
type
  TMonitorEnumerator = class
    FList: TList;
    FEnumProc: TMonitorEnumProc; // reference to the delegate so the garbage collector doesnt free it
    constructor Create(List: TLIst);
    function EnumMonitorsProc(hm: HMONITOR; dc: HDC;
      [in] var r: TRect; Data: LPARAM): Boolean;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
constructor TMonitorEnumerator.Create(List: TList);
begin
  inherited Create;
  FList := List;
  FEnumProc := @EnumMonitorsProc;
end;
{$ENDIF}

{$IF DEFINED(CLR)}
function TMonitorEnumerator.EnumMonitorsProc(hm: HMONITOR; dc: HDC;
  [in] var r: TRect; Data: LPARAM): Boolean;
{$ELSE}
function EnumMonitorsProc(hm: HMONITOR; dc: HDC; r: PRect; Data: Pointer): Boolean; stdcall;
{$ENDIF}
var
  M: TMonitor;
{$IF NOT DEFINED(CLR)}
  FList: TList;
{$ENDIF}
begin
{$IF NOT DEFINED(CLR)}
  FList := TList(Data);
{$ENDIF}
  M := TMonitor.Create;
  M.FHandle := hm;
  M.FMonitorNum := FList.Count;
  FList.Add(M);
  Result := True;
end;

function TCustomForm.GetMonitor: TMonitor;
var
  HM: HMonitor;
  I: Integer;
begin
  Result := nil;
  HM := MonitorFromWindow(Handle, MONITOR_DEFAULTTONEAREST);
                                            
{$IF DEFINED(CLR)}
  if HM = 0 then
    RaiseLastWin32Error;
{$ENDIF}
  for I := 0 to Screen.MonitorCount - 1 do
    if Screen.Monitors[I].Handle = HM then
    begin
      Result := Screen.Monitors[I];
      Exit;
    end;

  //if we get here, the Monitors array has changed, so we need to clear and reinitialize it
  Screen.GetMonitors;
  for I := 0 to Screen.MonitorCount - 1 do
    if Screen.Monitors[I].Handle = HM then
    begin
      Result := Screen.Monitors[I];
      Exit;
    end;
end;

function TCustomForm.GetCanvas: TCanvas;
begin
  Result := FCanvas;
end;

procedure TCustomForm.SetIcon(Value: TIcon);
begin
  FIcon.Assign(Value);
end;

function TCustomForm.IsForm: Boolean;
begin
  Result := not IsControl;
end;

function TCustomForm.IsIconStored: Boolean;
begin
  Result := IsForm and (Icon.Handle <> 0);
end;

procedure TCustomForm.SetFormStyle(Value: TFormStyle);
const
  HWND_STYLE: array[Boolean] of HWND = (HWND_NOTOPMOST, HWND_TOPMOST);
var
  OldStyle: TFormStyle;
  LRecreate: Boolean;
begin
  if FFormStyle <> Value then
  begin
    if ((Value = fsNormal) and (FFormStyle = fsStayOnTop)) or
       ((Value = fsStayOnTop) and (FFormStyle = fsNormal)) then
    begin
      FFormStyle := Value;
      if not (csDesigning in ComponentState) and HandleAllocated then
        SetWindowPos(Handle, HWND_STYLE[FFormStyle = fsStayOnTop], 0, 0, 0, 0,
          SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOOWNERZORDER);
    end
    else
    begin
      if (Value = fsMDIChild) and (Position = poDesigned) then
        Position := poDefault;
      LRecreate := not (csDesigning in ComponentState);
      if LRecreate then
        UpdateRecreatingFlag(True);
      try
        if LRecreate then DestroyHandle;
        OldStyle := FFormStyle;
        FFormStyle := Value;
        if ((Value = fsMDIForm) or (OldStyle = fsMDIForm)) and not Ctl3d then
          Color := NormalColor;
        if LRecreate then UpdateControlState;
        if Value = fsMDIChild then Visible := True;
      finally
        if LRecreate then
          UpdateRecreatingFlag(False);
      end;
    end;
  end;
end;

procedure TCustomForm.SetTaskbarHandler(Value: TTaskbarHandler);
begin
  if Value <> FTaskbarHandler then
  begin
    if FTaskbarHandler <> nil then
      FTaskbarHandler.RemoveFreeNotification(Self);
    FTaskbarHandler := Value;
    if FTaskbarHandler <> nil then
      FTaskbarHandler.FreeNotification(Self);
  end;
end;

procedure TCustomForm.RefreshMDIMenu;
var
  MenuHandle, WindowMenuHandle: HMenu;
  Redraw: Boolean;
begin
  if (FormStyle = fsMDIForm) and (ClientHandle <> 0) then
  begin
    MenuHandle := 0;
    if Menu <> nil then MenuHandle := Menu.Handle;
    WindowMenuHandle := 0;
    if WindowMenu <> nil then WindowMenuHandle := WindowMenu.Handle;
    Redraw := Winapi.Windows.GetMenu(Handle) <> MenuHandle;
    SendMessage(ClientHandle, WM_MDISETMENU, MenuHandle, WindowMenuHandle);
    if Redraw then DrawMenuBar(Handle);
  end;
end;

procedure TCustomForm.SetObjectMenuItem(Value: TMenuItem);
begin
  FObjectMenuItem := Value;
  if Value <> nil then
  begin
    Value.FreeNotification(Self);
    Value.Enabled := False;
  end;
end;

procedure TCustomForm.SetWindowMenu(Value: TMenuItem);
begin
  if FWindowMenu <> Value then
  begin
    FWindowMenu := Value;
    if Value <> nil then Value.FreeNotification(Self);
    RefreshMDIMenu;
  end;
end;

procedure TCustomForm.SetMenu(Value: TMainMenu);
var
  I: Integer;
begin
  if Value <> nil then
    for I := 0 to Screen.FormCount - 1 do
      if (Screen.Forms[I].Menu = Value) and (Screen.Forms[I] <> Self) then
        raise EInvalidOperation.CreateFmt(sDuplicateMenus, [Value.Name]);
  if FMenu <> nil then FMenu.WindowHandle := 0;
  if (csDestroying in ComponentState) or
    ((Value <> nil) and (csDestroying in Value.ComponentState)) then
    Value := nil;
  FMenu := Value;
  if Value <> nil then Value.FreeNotification(Self);
  if (Value <> nil) and ((csDesigning in ComponentState) or
   (BorderStyle <> bsDialog)) then
  begin
    if not (Menu.AutoMerge or (FormStyle = fsMDIChild)) or
      (csDesigning in ComponentState) then
    begin
      if HandleAllocated then
      begin
        if (Winapi.Windows.GetMenu(Handle) <> Menu.Handle) and
           (not TStyleManager.IsCustomStyleActive or
           ((TStyleManager.FormBorderStyle = fbsSystemStyle) or not (seBorder in StyleElements)))
        then
          Winapi.Windows.SetMenu(Handle, Menu.Handle);
        Value.WindowHandle := Handle;
      end;
    end
    else if FormStyle <> fsMDIChild then
      if HandleAllocated then Winapi.Windows.SetMenu(Handle, 0);
  end
  else if HandleAllocated then Winapi.Windows.SetMenu(Handle, 0);
  if Active then MergeMenu(True);
  RefreshMDIMenu;

  if (FDesigner <> nil) and (csDesigning in ComponentState) and
    (Parent <> nil) then
  begin
    SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE or
      SWP_NOACTIVATE or SWP_NOZORDER or SWP_DRAWFRAME);
    Perform(WM_NCPAINT, 0, 0);
    Perform(WM_PAINT, 0, 0);
  end;
end;

function TCustomForm.GetPixelsPerInch: Integer;
begin
                                                                                                                                       
  if not FScaled then
    Result := Screen.PixelsPerInch
  else
    Result := FPixelsPerInch;
end;

function TCustomForm.GetPopupChildren: TList;
begin
  if not Assigned(FPopupChildren) then
    FPopupChildren := TList.Create;
  Result := FPopupChildren;
end;

{$IF DEFINED(CLR)}
[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
function TCustomForm.get_PopupParent: TCustomForm;
begin
  Result := FPopupParent;
end;
{$ENDIF}

function TCustomForm.GetRecreateChildren: TList;
begin
  if not Assigned(FRecreateChildren) then
    FRecreateChildren := TList.Create;
  Result := FRecreateChildren;
end;

procedure TCustomForm.SetPixelsPerInch(Value: Integer);
begin
  if (Value <> FPixelsPerInch) and (Value >= 36) then                                                      
    FPixelsPerInch := Value;
end;

procedure TCustomForm.SetPosition(Value: TPosition);
begin
  if FPosition <> Value then
  begin
    FPosition := Value;
    if not (csDesigning in ComponentState) then RecreateWnd;
  end;
end;

procedure TCustomForm.SetPopupMode(Value: TPopupMode);
begin
  if Value <> FPopupMode then
  begin
    FPopupMode := Value;
    if (Value = pmAuto) and Assigned(FPopupParent) then
      PopupParent := nil;
    FInternalPopupParent := nil;
    FInternalPopupParentWnd := 0;
    if HandleAllocated and not (csDesigning in ComponentState) then
      RecreateWnd;
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomForm.set_PopupParent(Value: TCustomForm);
begin
  if (Value <> FPopupParent) and (Value <> Self) then
  begin
    if FPopupParent <> nil then
      FPopupParent.RemoveFreeNotification(Self);
    FPopupParent := Value;
    if Value <> nil then
    begin
      Value.FreeNotification(Self);
      FPopupMode := pmExplicit;
    end;
    FInternalPopupParent := nil;
    FInternalPopupParentWnd := 0;
    if HandleAllocated and not (csDesigning in ComponentState) then
      RecreateWnd;
  end;
end;

function TCustomForm.GetScaled: Boolean;
begin
  Result := FScaled;
end;

procedure TCustomForm.SetScaled(Value: Boolean);
begin
  if Value <> FScaled then
    FScaled := Value;
end;

procedure TCustomForm.CMColorChanged(var Message: TMessage);
begin
  inherited;
  if FCanvas <> nil then
  begin
    FCanvas.Brush.Color := Color;
    Perform(CM_BORDERCHANGED, 0, 0);
  end;
end;

function TCustomForm.NormalColor: TColor;
begin
  Result := clWindow;
  if FormStyle = fsMDIForm then Result := clAppWorkSpace;
end;

procedure TCustomForm.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  if Ctl3D then
  begin
     if Color = NormalColor then Color := clBtnFace
  end
  else if Color = clBtnFace then Color := NormalColor;
end;

procedure TCustomForm.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if FCanvas <> nil then FCanvas.Font := Font;
end;

procedure TCustomForm.CMMenuChanged(var Message: TMessage);
begin
  RefreshMDIMenu;
  SetMenu(FMenu);
end;

procedure TCustomForm.SetWindowState(Value: TWindowState);
const
  ShowCommands: array[TWindowState] of Integer =
    (SW_SHOWNORMAL, SW_MINIMIZE, SW_SHOWMAXIMIZED);
begin
  if FWindowState <> Value then
  begin
    FWindowState := Value;
    if not (csDesigning in ComponentState) then
    begin
      if Showing then
        ShowWindow(Handle, ShowCommands[Value])
      else if HandleAllocated and (FWindowState = wsMaximized) then
        SetWindowLong(Handle, GWL_STYLE,
          GetWindowLong(Handle, GWL_STYLE) or WS_MAXIMIZE);
    end;
  end;
end;

procedure TCustomForm.SetWindowToMonitor;
var
  AppMon, WinMon: HMONITOR;
  I, J: Integer;
  ALeft, ATop: Integer;
  LRect: TRect;
begin
    if (FDefaultMonitor <> dmDesktop) and (Application.MainForm <> nil) then
    begin
      AppMon := 0;
      if FDefaultMonitor = dmMainForm then
        AppMon := Application.MainForm.Monitor.Handle
      else if (FDefaultMonitor = dmActiveForm) and (Screen.ActiveCustomForm <> nil) then
        AppMon := Screen.ActiveCustomForm.Monitor.Handle
      else if FDefaultMonitor = dmPrimary then
        AppMon := Screen.PrimaryMonitor.Handle;
      WinMon := Monitor.Handle;
      for I := 0 to Screen.MonitorCount - 1 do
        if (Screen.Monitors[I].Handle = AppMon) then
          if (AppMon <> WinMon) then
          begin
            for J := 0 to Screen.MonitorCount - 1 do
            begin
              if (Screen.Monitors[J].Handle = WinMon) then
              begin
                if FPosition = poScreenCenter then
                begin
                  LRect := Screen.Monitors[I].WorkareaRect;
                  SetBounds(LRect.Left + ((RectWidth(LRect) - Width) div 2),
                    LRect.Top + ((RectHeight(LRect) - Height) div 2), Width, Height);
                end
                else
                if FPosition = poMainFormCenter then
                begin
                  SetBounds(Screen.Monitors[I].Left + ((Screen.Monitors[I].Width - Width) div 2),
                    Screen.Monitors[I].Top + ((Screen.Monitors[I].Height - Height) div 2),
                     Width, Height)
                end
                else
                begin
                  ALeft := Screen.Monitors[I].Left + Left - Screen.Monitors[J].Left;
                  if ALeft + Width > Screen.Monitors[I].Left + Screen.Monitors[I].Width then
                    ALeft := Screen.Monitors[I].Left + Screen.Monitors[I].Width - Width;
                  ATop := Screen.Monitors[I].Top + Top - Screen.Monitors[J].Top;
                  if ATop + Height > Screen.Monitors[I].Top + Screen.Monitors[I].Height then
                    ATop := Screen.Monitors[I].Top + Screen.Monitors[I].Height - Height;
                  SetBounds(ALeft, ATop, Width, Height);
                end;
              end;
            end;
          end
          else
          begin
            if FPosition = poScreenCenter then
            begin
              LRect := Screen.Monitors[I].WorkareaRect;
              SetBounds(LRect.Left + ((RectWidth(LRect) - Width) div 2),
                LRect.Top + ((RectHeight(LRect) - Height) div 2), Width, Height);
            end;
          end;
    end;
end;

function GetNonToolWindowPopupParent(WndParent: HWND): HWND;
begin
  Result := GetParent(WndParent);
  while (Result <> 0) and (GetWindowLong(Result, GWL_EXSTYLE) and WS_EX_TOOLWINDOW = WS_EX_TOOLWINDOW) do
    Result := GetParent(Result);
  if Result = 0 then
  begin
    if Assigned(Application.MainForm) and
       (GetWindowLong(Application.MainForm.Handle, GWL_EXSTYLE) and WS_EX_TOOLWINDOW = 0) then
      Result := Application.MainForm.Handle
    else
      Result := Application.Handle;
  end;
end;

procedure TCustomForm.CreateParams(var Params: TCreateParams);
var
  LRect: TRect;
  LParent: TCustomForm;
  CreateStyle: TFormBorderStyle;
  LPopupMode: TPopupMode;
begin
  inherited CreateParams(Params);
  InitAlphaBlending(Params);
  with Params do
  begin
    if (Parent = nil) and (ParentWindow = 0) then
    begin
      LParent := nil;
      if csDesigning in ComponentState then
        LPopupMode := pmExplicit
      else if (fsModal in FormState) and (FPopupMode = pmNone) then
        LPopupMode := pmAuto
      else if FormStyle = fsNormal then
        LPopupMode := FPopupMode
      else
        LPopupMode := pmNone;
      if (FInternalPopupParent = nil) and (FInternalPopupParentWnd = 0) then
        case LPopupMode of
          pmNone:
            begin
              if Application.MainFormOnTaskBar then
              begin
                // FCreatingMainForm is True when the MainForm is
                // being created, Self = Application.MainForm during CM_RECREATEWND.
                if FCreatingMainForm or (Self = Application.MainForm) then
                  WndParent := 0
                else
                  if Assigned(Application.MainForm) and Application.MainForm.HandleAllocated then
                  begin
                    WndParent := Application.MainFormHandle;
                    if WndParent = Application.MainForm.Handle then
                    begin
                      if Application.MainForm.PopupChildren.IndexOf(Self) < 0 then
                        Application.MainForm.PopupChildren.Add(Self);
                      FreeNotification(Application.MainForm);
                    end;
                  end
                  else
                    WndParent := Application.Handle;
              end
              else
              begin
                WndParent := Application.Handle;
                SetWindowLong(WndParent, GWL_EXSTYLE, GetWindowLong(WndParent, GWL_EXSTYLE) and not WS_EX_TOOLWINDOW);
              end;
            end;
          pmAuto:
            begin
              if FCreatingMainForm then
                WndParent := 0 // A main form can't be parented to another form
              else
                WndParent := Application.ActiveFormHandle;
              if (WndParent <> 0) and (IsIconic(WndParent) or not IsWindowVisible(WndParent) or
                not IsWindowEnabled(WndParent)) then
                WndParent := 0;
              if (WndParent <> 0) and
                 (GetWindowLong(WndParent, GWL_EXSTYLE) and WS_EX_TOOLWINDOW = WS_EX_TOOLWINDOW) then
                WndParent := GetNonToolWindowPopupParent(WndParent);
              if (WndParent <> 0) and (Screen.ActiveForm <> nil) and
                (Screen.ActiveForm.WindowHandle = WndParent) then
                LParent := Screen.ActiveForm
              else if WndParent = 0 then
                if Application.MainFormOnTaskBar then
                begin
                  // FCreatingMainForm is True when the MainForm is
                  // being created, Self = Application.MainForm during CM_RECREATEWND.
                  if FCreatingMainForm or (Self = Application.MainForm) then
                    WndParent := 0
                  else
                    if Assigned(Application.MainForm) and Application.MainForm.HandleAllocated then
                    begin
                      WndParent := Application.MainFormHandle;
                      if WndParent = Application.MainForm.Handle then
                      begin
                        if Application.MainForm.PopupChildren.IndexOf(Self) < 0 then
                          Application.MainForm.PopupChildren.Add(Self);
                        FreeNotification(Application.MainForm);
                      end;
                    end
                    else
                      WndParent := Application.Handle;
                end
                else
                begin
                  WndParent := Application.Handle;
                  SetWindowLong(WndParent, GWL_EXSTYLE, GetWindowLong(WndParent, GWL_EXSTYLE) and not WS_EX_TOOLWINDOW);
                end;
            end;
          pmExplicit:
            begin
              if Assigned(FPopupParent) and not (csDesigning in ComponentState) then
              begin
                WndParent := FPopupParent.Handle;
                LParent := FPopupParent;
              end
              else
                WndParent := Application.MainFormHandle;
                if (WndParent <> 0) and (Application.MainForm <> nil) and
                  (Application.MainForm.WindowHandle = WndParent) then
                  LParent := Application.MainForm
                else if WndParent = 0 then
                begin
                  WndParent := Application.Handle;
                  if not Application.MainFormOnTaskBar then
                    SetWindowLong(WndParent, GWL_EXSTYLE, GetWindowLong(WndParent, GWL_EXSTYLE) and not WS_EX_TOOLWINDOW);
                end;
            end;
        end
      else if FInternalPopupParentWnd <> 0 then
        WndParent := FInternalPopupParentWnd
      else
      begin
        LParent := FInternalPopupParent;
        WndParent := FInternalPopupParent.Handle;
      end;
      if Assigned(LParent) then
      begin
        if LParent.PopupChildren.IndexOf(Self) < 0 then
          LParent.PopupChildren.Add(Self);
        FreeNotification(LParent);
        FInternalPopupParent := LParent;
      end else if WndParent <> Application.Handle then
        FInternalPopupParentWnd := WndParent;
      Style := Style and not (WS_CHILD or WS_GROUP or WS_TABSTOP);
    end;
    WindowClass.style := CS_DBLCLKS;
    if (csDesigning in ComponentState) and (Parent = nil) then
      Style := Style or (WS_CAPTION or WS_THICKFRAME or WS_MINIMIZEBOX or
        WS_MAXIMIZEBOX or WS_SYSMENU)
    else
    begin
      if (not(csDesigning in ComponentState) or (Parent = nil)) and (FPosition in [poDefault, poDefaultPosOnly, poScreenCenter]) then
      begin
        X := Integer(CW_USEDEFAULT);
        Y := Integer(CW_USEDEFAULT);
      end;

      GetBorderStyles(Style, ExStyle, WindowClass.Style);
      CreateStyle := FBorderStyle;
      if (FormStyle = fsMDIChild) and (CreateStyle in [bsNone, bsDialog]) then
        CreateStyle := bsSizeable;
      if (CreateStyle in [bsSizeable, bsSizeToolWin]) and
         (not(csDesigning in ComponentState) or (Parent = nil)) and
         (FPosition in [poDefault, poDefaultSizeOnly]) then
        begin
          Width := Integer(CW_USEDEFAULT);
          Height := Integer(CW_USEDEFAULT);
        end;
      if CreateStyle in [bsSingle, bsSizeable, bsNone] then
      begin
        if not (csDesigning in ComponentState) then
          if FWindowState = wsMinimized then
          begin
            if Application.MainFormOnTaskBar and FCreatingMainForm then
              // Delay minimizing the mainform until TApplication.Run
              Application.FInitialMainFormState := wsMinimized
            else
              Style := Style or WS_MINIMIZE;
          end else
            if FWindowState = wsMaximized then Style := Style or WS_MAXIMIZE;
      end
      else
        FWindowState := wsNormal;
      if csInline in ComponentState then
        Style := Style and not WS_CAPTION;
      if FormStyle = fsMDIChild then
{$IF DEFINED(CLR)}
        WndProc := @DefMDIChildProc;
{$ELSE}
        WindowClass.lpfnWndProc := @DefMDIChildProc;
{$ENDIF}
      GetBorderIconStyles(Style, ExStyle);
      if Application.MainFormOnTaskBar and (FCreatingMainForm or
         (((csDesigning in ComponentState) or (csRecreating in ControlState)) and
         (FormStyle <> fsMDIChild) and (Self = Application.MainForm))) then
        ExStyle := ExStyle or WS_EX_APPWINDOW;

      if IsClientSizeStored and (FWindowState = wsMaximized) then
      begin
        // Ensure correct size when form is restored from maximized state
        LRect := Rect(0, 0, FClientWidth, FClientHeight);
        if AdjustWindowRectEx(LRect, Style, FMenu <> nil, ExStyle) then
        begin
          Width := LRect.Right - LRect.Left;
          Height := LRect.Bottom - LRect.Top;
        end;
      end;
    end;
  end;
end;

{$IF DEFINED(CLR)}
type
  TMDIClientWrapper = class(THWndWrapper)
  private
    FControlHandle: THWndWrapper;
    FNotifyDelegate: TFinalizeHWNDNotify;
  strict protected
    procedure FinalizeNotify(Handle: HWND);
    procedure Finalize; override;
  public
    constructor Create(ControlHandle: THWndWrapper);
  end;

constructor TMDIClientWrapper.Create(ControlHandle: THWndWrapper);
begin
  inherited Create;
  FNotifyDelegate := @FinalizeNotify;
  ControlHandle.RegisterFinalizeNotify(FNotifyDelegate);
  FControlHandle := ControlHandle;
end;

procedure TMDIClientWrapper.Finalize;
begin
  if Assigned(FControlHandle) then
  begin
    if FControlHandle.Handle <> 0 then
      FControlHandle.UnregisterFinalizeNotify(FNotifyDelegate);
    FControlHandle := nil;
  end;
  Handle := 0;
  inherited;
end;

procedure TMDIClientWrapper.FinalizeNotify(Handle: HWND);
begin
  if self.Handle <> 0 then
  begin
    CallNotifies;
    self.Handle := 0;
  end;
  FControlHandle := nil;
end;
{$ENDIF}

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomForm.CreateWnd;
var
  I: Integer;
  ClientCreateStruct: TClientCreateStruct;
begin
  inherited CreateWnd;
  if NewStyleControls then
    if BorderStyle <> bsDialog then
      SendMessage(Handle, WM_SETICON, ICON_BIG, GetIconHandle) else
      SendMessage(Handle, WM_SETICON, ICON_BIG, 0);
  if not (csDesigning in ComponentState) then
    case FormStyle of
      fsMDIForm:
        begin
          with ClientCreateStruct do
          begin
            idFirstChild := $FF00;
            hWindowMenu := 0;
            if FWindowMenu <> nil then hWindowMenu := FWindowMenu.Handle;
          end;
{$IF DEFINED(CLR)}
          FClientHandle := TMDIClientWrapper.Create(FHandle);
          FClientHandle.Handle := Windows.CreateWindowEx(WS_EX_CLIENTEDGE,
            'MDICLIENT', '', WS_CHILD or WS_VISIBLE or WS_GROUP or WS_TABSTOP or
            WS_CLIPCHILDREN or WS_HSCROLL or WS_VSCROLL or WS_CLIPSIBLINGS or
            MDIS_ALLCHILDSTYLES, 0, 0, ClientWidth, ClientHeight, Handle, 0,
            HInstance, ClientCreateStruct);
          FClientHandle.FObjInstance := MakeObjectInstance(ClientWndProc);
          FDefClientProc := SetWindowLong(ClientHandle, GWL_WNDPROC, FClientHandle.FObjInstance);
{$ELSE}
          FClientHandle := Winapi.Windows.CreateWindowEx(WS_EX_CLIENTEDGE, 'MDICLIENT',
            nil, WS_CHILD or WS_VISIBLE or WS_GROUP or WS_TABSTOP or
            WS_CLIPCHILDREN or WS_HSCROLL or WS_VSCROLL or WS_CLIPSIBLINGS or
            MDIS_ALLCHILDSTYLES, 0, 0, ClientWidth, ClientHeight, Handle, 0,
            HInstance, @ClientCreateStruct);
          FClientInstance := MakeObjectInstance(ClientWndProc);
          FDefClientProc := Pointer(GetWindowLong(FClientHandle, GWL_WNDPROC));
          SetWindowLong(FClientHandle, GWL_WNDPROC, IntPtr(FClientInstance));
{$ENDIF}
        end;
      fsStayOnTop:
        SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or
          SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOOWNERZORDER);
    end;
  if Assigned(FRecreateChildren) then
  begin
    for I := 0 to FRecreateChildren.Count - 1 do
      TCustomForm(FRecreateChildren[I]).UpdateControlState;
    FRecreateChildren.Clear;
  end;
  for I := Low(FPopupWnds) to High(FPopupWnds) do
    SendMessage(FPopupWnds[I].ControlWnd, CM_CREATEPOPUP, FPopupWnds[I].ID, WindowHandle);
  SetLength(FPopupWnds, 0);
  if not (csLoading in ComponentState) and FGlassFrame.FrameExtended then
    UpdateGlassFrame(nil);
  // need to adjust control's anchors with custom styles
  if not (csLoading in ComponentState) and TStyleManager.IsCustomStyleActive then
    Realign;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomForm.CreateWindowHandle(const Params: TCreateParams);
var
  CreateStruct: TMDICreateStruct;
  NewParams: TCreateParams;
begin
  if (FormStyle = fsMDIChild) and not (csDesigning in ComponentState) then
  begin
    if (Application.MainForm = nil) or
      (Application.MainForm.ClientHandle = 0) then
      raise EInvalidOperation.Create(SNoMDIForm);
    with CreateStruct do
    begin
      szClass := Params.WinClassName;
      szTitle := Params.Caption;
      hOwner := THandle(HInstance);
      X := Params.X;
      Y := Params.Y;
      cX := Params.Width;
      cY := Params.Height;
      style := Params.Style;
      lParam := THandle(Params.Param);
    end;
    WindowHandle := SendStructMessage(Application.MainForm.ClientHandle,
      WM_MDICREATE, 0, CreateStruct);
    Include(FFormState, fsCreatedMDIChild);
  end
  else
  begin
    NewParams := Params;
    NewParams.ExStyle := NewParams.ExStyle and not WS_EX_LAYERED;
    inherited CreateWindowHandle(NewParams);
                               
{$IF DEFINED(CLR)}
    if WindowHandle = 0 then
      RaiseLastWin32Error;
{$ENDIF}
    Exclude(FFormState, fsCreatedMDIChild);
  end;
  SetLayeredAttribs;
end;

type
{$IF DEFINED(CLR)}
  TDestroyPopups = class
    FOwner: HWND;
    function DestroyPopupWindow(Window: HWND; Data: LPARAM): BOOL;
  end;
{$ELSE}
  PDestroyPopupData = ^TDestroyPopupData;
  TDestroyPopupData = record
    Owner: HWND;
    Recreating: Boolean;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
                           
function TDestroyPopups.DestroyPopupWindow(Window: HWND; Data: LPARAM): BOOL;
begin
  if (Window <> FOwner) and (FindControl(Window) = nil) and
    (GetWindow(Window, GW_OWNER) = FOwner) then
    SendMessage(Window, CM_DESTROYHANDLE, Data, 0);
  Result := True;
end;
{$ELSE}
function DestroyPopupWindow(Window: HWND; Data: PDestroyPopupData): BOOL; stdcall;
begin
  if (Window <> Data^.Owner) and (FindControl(Window) = nil) and
    (GetWindow(Window, GW_OWNER) = Data^.Owner) then
    SendMessage(Window, CM_DESTROYHANDLE, Byte(Data^.Recreating), 0);
  Result := True;
end;
{$ENDIF}

procedure TCustomForm.DestroyHandle;
var
  I: Integer;
  LRecreateChildren: TList;
{$IF DEFINED(CLR)}
  DestroyPopups: TDestroyPopups;
{$ELSE}
  LData: TDestroyPopupData;
{$ENDIF}
begin
  if WindowHandle <> 0 then
  begin
    if Assigned(FPopupChildren) then
    begin
      LRecreateChildren := GetRecreateChildren;
      for I := 0 to FPopupChildren.Count - 1 do
      begin
        if (csRecreating in ControlState) then
          TCustomForm(FPopupChildren[I]).UpdateRecreatingFlag(True);
        try
          LRecreateChildren.Add(FPopupChildren[I]);
          TCustomForm(FPopupChildren[I]).DestroyHandle;
        finally
          if (csRecreating in ControlState) then
            TCustomForm(FPopupChildren[I]).UpdateRecreatingFlag(False);
        end;
      end;
    end;
{$IF DEFINED(CLR)}
    DestroyPopups := TDestroyPopups.Create;
    DestroyPopups.FOwner := WindowHandle;
    EnumThreadWindows(GetCurrentThreadID, DestroyPopups.DestroyPopupWindow,
      Byte(csRecreating in ControlState));
{$ELSE}
    LData.Owner := WindowHandle;
    LData.Recreating := csRecreating in ControlState;
    EnumThreadWindows(GetCurrentThreadID, @DestroyPopupWindow, Winapi.Windows.LPARAM(@LData));
{$ENDIF}
  end;
  inherited DestroyHandle;
end;

procedure TCustomForm.DestroyWindowHandle;
begin
  if fsCreatedMDIChild in FFormState then
  begin
    if ((sfHandleMessages) in TStyleManager.Flags) then
      TStyleManager.Notification(snControlDestroyed, Self);
    SendMessage(Application.MainForm.ClientHandle, WM_MDIDESTROY, Handle, 0);
  end
  else
    inherited DestroyWindowHandle;
{$IF DEFINED(CLR)}
  if Assigned(FClientHandle) then
    FClientHandle.Handle := 0;
{$ELSE}
  FClientHandle := 0;
{$ENDIF}
end;

procedure TCustomForm.DefaultHandler(var Message);
begin
  if ClientHandle <> 0 then
{$IF DEFINED(CLR)}
    with UnwrapMessage(TObject(Message)) do
{$ELSE}
    with TMessage(Message) do
{$ENDIF}
      if Msg = WM_SIZE then
        Result := DefWindowProc(Handle, Msg, wParam, lParam) else
        Result := DefFrameProc(Handle, ClientHandle, Msg, wParam, lParam)
  else
    inherited DefaultHandler(Message)
end;

procedure TCustomForm.SetActiveControl(Control: TWinControl);
begin
  if FActiveControl <> Control then
  begin
    if not ((Control = nil) or (csDesigning in ComponentState) or ((Control <> Self) and
      (GetRealParentForm(Control) = Self) and ((csLoading in ComponentState) or
        Control.CanFocus))) then
      raise EInvalidOperation.Create(SCannotFocus);
    FActiveControl := Control;
    if not (csLoading in ComponentState) then
    begin
      if FActive then SetWindowFocus;
      ActiveChanged;
    end;
  end;
end;

procedure TCustomForm.SetActiveOleControl(Control: TWinControl);
begin
  if FActiveOleControl <> Control then
  begin
    FActiveOleControl := Control;
{$IF NOT DEFINED(CLR)}
    if Control <> nil then Control.FreeNotification(Self);
{$ENDIF}
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomForm.DefocusControl(Control: TWinControl; Removing: Boolean);
begin
  if Removing and Control.ContainsControl(FFocusedControl) then
    FFocusedControl := Control.Parent;
  if Control.ContainsControl(FActiveControl) then SetActiveControl(nil);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomForm.FocusControl(Control: TWinControl);
var
  WasActive: Boolean;
begin
  WasActive := FActive;
  if WasActive and (FormStyle = fsMDIChild) and (Control <> nil) and
     (Control = ActiveControl) and Control.HandleAllocated and not Control.Focused then
  begin
    { Synchronize Windows's focus with VCL's focus }
    Winapi.Windows.SetFocus(Control.Handle);
  end;
  SetActiveControl(Control);
  if not WasActive then SetFocus;
end;

[UIPermission(SecurityAction.InheritanceDemand, Window=UIPermissionWindow.AllWindows),
UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
function TCustomForm.SetFocusedControl(Control: TWinControl): Boolean;
var
  FocusHandle: HWnd;
  TempControl: TWinControl;
begin
  Result := False;
  Inc(FocusCount);
  if FDesigner = nil then
    if Control <> Self then
      FActiveControl := Control else
      FActiveControl := nil;
  Screen.FActiveControl := Control;
  Screen.FActiveCustomForm := Self;
  Screen.FCustomForms.Remove(Self);
  Screen.FCustomForms.Insert(0, Self);
  if Self is TForm then
  begin
    Screen.FActiveForm := TForm(Self);
    Screen.FForms.Remove(Self);
    Screen.FForms.Insert(0, Self);
  end
  else Screen.FActiveForm := nil;
  if not (csFocusing in Control.ControlState) then
  begin
    Control.ControlState := Control.ControlState + [csFocusing];
    try
      if Screen.FFocusedForm <> Self then
      begin
        if Screen.FFocusedForm <> nil then
        begin
          if not (csDestroying in Screen.FFocusedForm.ComponentState) then
            FocusHandle := Screen.FFocusedForm.Handle
          else
            FocusHandle := 0;
          Screen.FFocusedForm := nil;
          if (FocusHandle <> 0) and not SendFocusMessage(FocusHandle, CM_DEACTIVATE) then
            Exit;
        end;
        Screen.FFocusedForm := Self;
        if not SendFocusMessage(Handle, CM_ACTIVATE) then Exit;
      end;
      if FFocusedControl = nil then FFocusedControl := Self;
      if FFocusedControl <> Control then
      begin
        while (FFocusedControl <> nil) and not
          FFocusedControl.ContainsControl(Control) do
        begin
          FocusHandle := FFocusedControl.Handle;
          FFocusedControl := FFocusedControl.Parent;
          if not SendFocusMessage(FocusHandle, CM_EXIT) then Exit;
        end;
        while FFocusedControl <> Control do
        begin
          TempControl := Control;
          while TempControl.Parent <> FFocusedControl do
            TempControl := TempControl.Parent;
          FFocusedControl := TempControl;
          if not SendFocusMessage(TempControl.Handle, CM_ENTER) then Exit;
        end;
        TempControl := Control.Parent;
        if not (csDesigning in Control.ComponentState) then
          while TempControl <> nil do
          begin
            if TempControl is TScrollingWinControl then
              TScrollingWinControl(TempControl).AutoScrollInView(Control);
            TempControl := TempControl.Parent;
          end;
{$IF DEFINED(CLR)}
        FocusChanged(Control);
{$ELSE}
        Perform(CM_FOCUSCHANGED, 0, Winapi.Windows.LPARAM(Control));
{$ENDIF}
        if (FActiveOleControl <> nil) and (FActiveOleControl <> Control) then
          FActiveOleControl.Perform(CM_UIDEACTIVATE, 0, 0);
      end;
    finally
      Control.ControlState := Control.ControlState - [csFocusing];
    end;
    Screen.UpdateLastActive;
    Result := True;
  end;
end;

procedure TCustomForm.ActiveChanged;
begin
end;

procedure TCustomForm.SetWindowFocus;
var
  FocusControl: TWinControl;
begin
  if (FActiveControl <> nil) and (FDesigner = nil) then
    FocusControl := FActiveControl
  else if (Parent <> nil) and (FDesigner = nil) then
  begin
    FocusControl := FindNextControl(nil, True, True, False);
    if FocusControl = nil then
      FocusControl := Self;
  end else
    FocusControl := Self;
  Winapi.Windows.SetFocus(FocusControl.Handle);
  if GetFocus = FocusControl.Handle then
    FocusControl.Perform(CM_UIACTIVATE, 0, 0);
end;

type
  TButtonControlProxy = class(TButtonControl);

procedure TCustomForm.SetActive(Value: Boolean);

  procedure SetWindowFocusToButtonControl;
  var
    ActiveButtonControl: TButtonControlProxy;
    OldClicksDisabled: Boolean;
  begin
    ActiveButtonControl := TButtonControlProxy(ActiveControl);
    OldClicksDisabled := ActiveButtonControl.ClicksDisabled;
    try
      ActiveButtonControl.ClicksDisabled := True;
      SetWindowFocus;
    finally
      ActiveButtonControl.ClicksDisabled:= OldClicksDisabled;
    end;
  end;

begin
  FActive := Value;
  if FActiveOleControl <> nil then
    FActiveOleControl.Perform(CM_DOCWINDOWACTIVATE, Ord(Value), 0);
  if Value then
  begin
    if (ActiveControl = nil) and not (csDesigning in ComponentState) then
      ActiveControl := FindNextControl(nil, True, True, False);
    MergeMenu(True);
    if ActiveControl is TButtonControl then
      SetWindowFocusToButtonControl
    else
      SetWindowFocus;
    if (TaskbarHandler <> nil) and Value then
      TaskbarHandler.ActivateTab;
  end;
end;

procedure TCustomForm.SendCancelMode(Sender: TControl);
{$IF DEFINED(CLR)}
var
  Msg: TCMCancelMode;
{$ENDIF}
begin
  if Active and (ActiveControl <> nil) then
{$IF DEFINED(CLR)}
  begin
    Msg := TCMCancelMode.Create;
    Msg.Sender := Sender;
    ActiveControl.Perform(CM_CANCELMODE, 0, Msg.OriginalMessage.LParam);
    FreeAndNil(Msg);
  end;
{$ELSE}
    ActiveControl.Perform(CM_CANCELMODE, 0, Winapi.Windows.LPARAM(Sender));
{$ENDIF}
  if (FormStyle = fsMDIForm) and (ActiveMDIChild <> nil) then
    ActiveMDIChild.SendCancelMode(Sender);
end;

procedure TCustomForm.MergeMenu(MergeState: Boolean);
var
  AMergeMenu: TMainMenu;
begin
  if not (fsModal in FFormState) and
    (Application.MainForm <> nil) and
    (Application.MainForm.Menu <> nil) and
    (Application.MainForm <> Self) and
    ((FormStyle = fsMDIChild) or (Application.MainForm.FormStyle <> fsMDIForm)) then
  begin
    AMergeMenu := nil;
    if not (csDesigning in ComponentState) and (Menu <> nil) and
      (Menu.AutoMerge or (FormStyle = fsMDIChild)) then AMergeMenu := Menu;
    with Application.MainForm.Menu do
      if MergeState then Merge(AMergeMenu) else Unmerge(AMergeMenu);
  end;
end;

procedure DoNestedActivation(Msg: Cardinal; Control: TWinControl; Form: TCustomForm);
begin
  if Control = nil then Exit;
  { Find the closest parent which is a form }
  while (Control.Parent <> nil) and not (Control is TCustomForm) do
    Control := Control.Parent;
  if Assigned(Control) and (Control <> Form) then
    SendMessage(Control.Handle, Msg, 0, 0)
end;

procedure TCustomForm.Activate;
begin
  DoNestedActivation(CM_ACTIVATE, ActiveControl, Self);
  if Assigned(FOnActivate) then FOnActivate(Self);
end;

procedure TCustomForm.Deactivate;
begin
  DoNestedActivation(CM_DEACTIVATE, ActiveControl, Self);
  if Assigned(FOnDeactivate) then FOnDeactivate(Self);
end;

procedure TCustomForm.Paint;
begin
  if Assigned(FOnPaint) then FOnPaint(Self);
end;

function TCustomForm.GetIconHandle: HICON;
begin
  Result := FIcon.Handle;
  if Result = 0 then Result := Application.GetIconHandle;
end;

procedure TCustomForm.PaintWindow(DC: HDC);
var
  LClientRect: TRect;
  SaveIndex: Integer;
begin
  FCanvas.Lock;
  try
    FCanvas.Handle := DC;
    try
      SaveIndex := SaveDC(DC);
      try
        with FGlassFrame do
        begin
          if FrameExtended or ((FDesigner <> nil) and Enabled) then
          begin
            LClientRect := ClientRect;
            if not SheetOfGlass and not FRefreshGlassFrame then
              ExcludeClipRect(DC, Left, Top, LClientRect.Right - Right, LClientRect.Bottom - Bottom)
            else
              FRefreshGlassFrame := False;

            if FDesigner = nil then
              FillRect(FCanvas.Handle, LClientRect, GetStockObject(BLACK_BRUSH))
            else
            begin
              FCanvas.Brush.Color := clActiveCaption;
              FCanvas.Brush.Style := bsBDiagonal;
              SetBkColor(FCanvas.Handle, ColorToRGB(Color));
              FCanvas.FillRect(LClientRect);
            end;
          end;
        end;
      finally
        RestoreDC(DC, SaveIndex);
      end;
      if FDesigner <> nil then
        FDesigner.PaintGrid
      else
        Paint;
    finally
      FCanvas.Handle := 0;
    end;
  finally
    FCanvas.Unlock;
  end;
end;

function TCustomForm.PaletteChanged(Foreground: Boolean): Boolean;
var
  I: Integer;
  Active, Child: TForm;
begin
  Result := False;
  Active := ActiveMDIChild;
  if Assigned(Active) then
    Result := Active.PaletteChanged(Foreground);
  for I := 0 to MDIChildCount-1 do
  begin
    if Foreground and Result then Exit;
    Child := MDIChildren[I];
    if Active = Child then Continue;
    Result := Child.PaletteChanged(Foreground) or Result;
  end;
  if Foreground and Result then Exit;
  Result := inherited PaletteChanged(Foreground);
end;

procedure TCustomForm.WMPaint(var Message: TWMPaint);
var
  DC: HDC;
  PS: TPaintStruct;
begin
  if not IsIconic(Handle) then
  begin
    ControlState := ControlState + [csCustomPaint];
    inherited;
    ControlState := ControlState - [csCustomPaint];
  end
  else
  begin
    DC := BeginPaint(Handle, PS);
    DrawIcon(DC, 0, 0, GetIconHandle);
    EndPaint(Handle, PS);
  end;
end;

procedure TCustomForm.WMNCPaint(var Message: TWMNCPaint);
begin
  inherited;
  if (FDesigner <> nil) and (Parent <> nil) then FDesigner.PaintMenu;
end;

procedure TCustomForm.WMIconEraseBkgnd(var Message: TWMIconEraseBkgnd);
begin
  if FormStyle = fsMDIChild then
  if (FormStyle = fsMDIChild) and not (csDesigning in ComponentState) then
    FillRect(Message.DC, ClientRect, Application.MainForm.Brush.Handle)
  else inherited;
end;

procedure TCustomForm.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  if not IsIconic(Handle) then inherited else
  begin
    Message.Msg := WM_ICONERASEBKGND;
    DefaultHandler(Message);
  end;
end;

procedure TCustomForm.WMQueryDragIcon(var Message: TWMQueryDragIcon);
begin
  Message.Result := GetIconHandle;
end;

procedure TCustomForm.WMNCCreate(var Message: TWMNCCreate);

  procedure ModifySystemMenu;
  var
    SysMenu: HMENU;
  begin
    if (FBorderStyle <> bsNone) and (biSystemMenu in FBorderIcons) and
      (FormStyle <> fsMDIChild) then
    begin
      { Modify the system menu to look more like it's s'pose to }
      SysMenu := GetSystemMenu(Handle, False);
      if FBorderStyle = bsDialog then
      begin
        { Make the system menu look like a dialog which has only
          Move and Close }
        DeleteMenu(SysMenu, SC_TASKLIST, MF_BYCOMMAND);
        DeleteMenu(SysMenu, 7, MF_BYPOSITION);
        DeleteMenu(SysMenu, 5, MF_BYPOSITION);
        DeleteMenu(SysMenu, SC_MAXIMIZE, MF_BYCOMMAND);
        DeleteMenu(SysMenu, SC_MINIMIZE, MF_BYCOMMAND);
        DeleteMenu(SysMenu, SC_SIZE, MF_BYCOMMAND);
        DeleteMenu(SysMenu, SC_RESTORE, MF_BYCOMMAND);
      end else
      begin
        { Else just disable the Minimize and Maximize items if the
          corresponding FBorderIcon is not present }
        if not (biMinimize in FBorderIcons) then
          EnableMenuItem(SysMenu, SC_MINIMIZE, MF_BYCOMMAND or MF_GRAYED);
        if not (biMaximize in FBorderIcons) then
          EnableMenuItem(SysMenu, SC_MAXIMIZE, MF_BYCOMMAND or MF_GRAYED);
      end;
    end;
  end;

var
  PDA: PROCESS_DPI_AWARENESS;
  DLLHandle: HModule;
  pEnableNonClientDpiScaling: function (h: THandle): BOOL; stdcall;
begin
  inherited;
  SetMenu(FMenu);
  if not (csDesigning in ComponentState) then
  begin
    ModifySystemMenu;
    if Scaled and CheckWin32Version(10,0) and (GetProcessDpiAwareness(0, PDA) = S_OK) then
    begin
      if PDA <> PROCESS_DPI_UNAWARE then
      begin
        DLLHandle := SafeLoadLibrary(Winapi.Windows.user32);
        if DLLHandle <> 0 then
        try
          pEnableNonClientDpiScaling := GetProcAddress(DLLHandle, 'EnableNonClientDpiScaling');
          if Assigned(pEnableNonClientDpiScaling) then
            pEnableNonClientDpiScaling(WindowHandle);
        finally
          FreeLibrary(DLLHandle);
        end;
      end;
    end;
  end;
end;

procedure TCustomForm.WMNCHitTest(var Message: TWMNCHitTest);
begin
  if (csDesigning in ComponentState) and (Parent <> nil) then
    DefaultHandler(Message)
  else
    inherited;
end;

procedure TCustomForm.WMNCLButtonDown(var Message: TWMNCLButtonDown);
begin
  if (Message.HitTest = HTCAPTION) and (DragKind = dkDock) and not
    (csDesigning in ComponentState) and not IsIconic(Handle) then
  begin
    { Activate window since we override WM_NCLBUTTON behavior }
    SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or SWP_NOMOVE or
      SWP_NOSIZE);
{$IF DEFINED(CLR)}
    PostMessage(Handle, WM_NCLBUTTONUP, UnwrapMessage(Message).WParam,
      UnwrapMessage(Message).LParam);
{$ELSE}
    PostMessage(Handle, WM_NCLBUTTONUP, TMessage(Message).WParam,
      TMessage(Message).LParam);
{$ENDIF}
    if Active then BeginDrag(not Floating);
  end
  else
    inherited;
end;

procedure TCustomForm.WMDestroy(var Message: TWMDestroy);
var
  I: Integer;
  OwnerWnd: HWND;
  LRecreateChildren: TList;
  PopupFormInfo: TPopupFormInfo;
{$IF DEFINED(CLR)}
  Mem: IntPtr;
{$ENDIF}
begin
  if (csRecreating in ControlState) and Assigned(FPopupChildren) then
  begin
    LRecreateChildren := GetRecreateChildren;
    for I := 0 to FPopupChildren.Count - 1 do
      if TCustomForm(FPopupChildren[I]).HandleAllocated then
        if LRecreateChildren.IndexOf(FPopupChildren[I]) < 0 then
          LRecreateChildren.Add(FPopupChildren[I]);
  end;
  if FInternalPopupParent <> nil then
  begin
    if (FInternalPopupParent.GetRecreateChildren.IndexOf(Self) < 0) and
      (FInternalPopupParent.GetPopupChildren.IndexOf(Self) > -1) then
      FInternalPopupParent.GetRecreateChildren.Add(Self);
  end else
  begin
    if not (csDestroying in ComponentState) then
    begin
      OwnerWnd := GetOwnerWindow;
      if (OwnerWnd <> 0) and (OwnerWnd <> Application.Handle) then
      begin
        PopupFormInfo.PopupID := Application.AddPopupForm(Self);
        PopupFormInfo.PopupWnd := WindowHandle;
        PopupFormInfo.IsPopup := FInternalPopupParentWnd <> 0;
{$IF DEFINED(CLR)}
        Mem := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TPopupFormInfo)));
        try
          Marshal.StructureToPtr(TObject(PopupFormInfo), Mem, False);
          SendMessage(OwnerWnd, CM_POPUPHWNDDESTROY, WPARAM(Mem), LPARAM(Application.PopupControlWnd));
        finally
          Marshal.FreeHGlobal(Mem);
        end;
{$ELSE}
        SendMessage(OwnerWnd, CM_POPUPHWNDDESTROY, Winapi.Windows.WPARAM(@PopupFormInfo),
          Winapi.Windows.LPARAM(Application.PopupControlWnd));
{$ENDIF}
      end;
    end;
    FInternalPopupParentWnd := 0;
  end;
  if NewStyleControls then SendMessage(Handle, WM_SETICON, ICON_BIG, 0);
  if (FMenu <> nil) and (FormStyle <> fsMDIChild) then
  begin
    Winapi.Windows.SetMenu(Handle, 0);
    FMenu.WindowHandle := 0;
  end;
  inherited;
end;

procedure TCustomForm.WMCommand(var Message: TWMCommand);
begin
  with Message do
  begin
    if NotifyCode = THBN_CLICKED then
      DoThumbButtonNotify(ItemID)
    else if (Ctl <> 0) or (Menu = nil) or not Menu.DispatchCommand(ItemID) then
      inherited;
  end;
end;

procedure TCustomForm.WMInitMenuPopup(var Message: TWMInitMenuPopup);
begin
  if FMenu <> nil then FMenu.DispatchPopup(Message.MenuPopup);
end;

procedure TCustomForm.WMMenuChar(var Message: TWMMenuChar);
begin
  if (Menu <> nil) then
  begin
    Menu.ProcessMenuChar(Message);
    if Message.Result = MNC_IGNORE then
      // if we don't know what to do with it, give the default handler a try
      // Specifically, this covers odd MDI system hotkeys, like Alt+Minus
      inherited;
  end
  else
    inherited;
end;

procedure TCustomForm.WMMenuSelect(var Message: TWMMenuSelect);
var
  MenuItem: TMenuItem;
  ID: Integer;
  FindKind: TFindItemKind;
begin
  if FMenu <> nil then
    with Message do
    begin
      MenuItem := nil;
      if (MenuFlag <> $FFFF) or (IDItem <> 0) then
      begin
        FindKind := fkCommand;
        ID := IDItem;
        if MenuFlag and MF_POPUP <> 0 then
        begin
          FindKind := fkHandle;
          ID := GetSubMenu(Menu, ID);
        end;
        MenuItem := FMenu.FindItem(ID, FindKind);
      end;
      if MenuItem <> nil then
        Application.Hint := GetLongHint(MenuItem.Hint) else
        Application.Hint := '';
    end;
end;

procedure TCustomForm.WMActivate(var Message: TWMActivate);
begin
                                       
{$IF NOT DEFINED(CLR)}
  if not (GetWindowLong(Handle, GWL_STYLE) and WS_CHILD = WS_CHILD) then
{$ENDIF}
  if (FormStyle <> fsMDIForm) or (csDesigning in ComponentState) then
    SetActive(Message.Active <> WA_INACTIVE);
end;

procedure TCustomForm.Resizing(State: TWindowState);
begin
  if not (csDesigning in ComponentState) and not (csRecreating in ControlState) then
    FWindowState := State;
  if State <> wsMinimized then
    RequestAlign;
  if FOleForm <> nil then FOleForm.OnResize;
end;

procedure TCustomForm.WMClose(var Message: TWMClose);
begin
  Close;
end;

procedure TCustomForm.WMQueryEndSession(var Message: TWMQueryEndSession);
begin
  {Note: this used to call CallTerminateProcs and allow
   them to stop the application from terminating. In the
   VCL, this was only used by TComServer. }
  Message.Result := Winapi.Windows.LRESULT(CloseQuery);
end;

procedure TCustomForm.CMAppSysCommand(var Message: TMessage);
{$IF NOT DEFINED(CLR)}
type
  PWMSysCommand = ^TWMSysCommand;
{$ENDIF}
begin
  Message.Result := 0;
  if (csDesigning in ComponentState) or (FormStyle = fsMDIChild) or
   (Menu = nil) or Menu.AutoMerge then
{$IF DEFINED(CLR)}
    with TWMSysCommand.Create(Message) do
{$ELSE}
    with PWMSysCommand(Message.lParam)^ do
{$ENDIF}
    begin
      SendCancelMode(nil);
      if SendAppMessage(CM_APPSYSCOMMAND, CmdType, Key) <> 0 then
        Message.Result := 1;
    end;
end;

procedure TCustomForm.WMSysCommand(var Message: TWMSysCommand);
{$IF DEFINED(CLR)}
var
  LMessage: TMessage;
{$ENDIF}
begin
  with Message do
  begin
    if (CmdType and $FFF0 = SC_MINIMIZE) and (Application.MainForm = Self) then
    begin
{$IF DEFINED(CLR)}
      LMessage := OriginalMessage;
      Application.WndProc(LMessage)
{$ELSE}
      Application.WndProc(TMessage(Message))
{$ENDIF}
    end
    else if (CmdType and $FFF0 <> SC_MOVE) or (csDesigning in ComponentState) or
      (Align = alNone) or (WindowState = wsMinimized) then
      inherited;
    if ((CmdType and $FFF0 = SC_MINIMIZE) or (CmdType and $FFF0 = SC_RESTORE)) and
      not (csDesigning in ComponentState) and (Align <> alNone) then
      RequestAlign;
  end;
end;

procedure TCustomForm.WMShowWindow(var Message: TWMShowWindow);
const
  ShowCommands: array[saRestore..saMaximize] of Integer =
    (SW_SHOWNOACTIVATE, SW_SHOWMINNOACTIVE, SW_SHOWMAXIMIZED);
begin
  with Message do
{$IF DEFINED(CLR)}
    case Status.ToInt64 of
{$ELSE}
    case Status of
{$ENDIF}
      SW_PARENTCLOSING:
        begin
          if IsIconic(Handle) then FShowAction := saMinimize else
            if IsZoomed(Handle) then FShowAction := saMaximize else
              FShowAction := saRestore;
          inherited;
        end;
      SW_PARENTOPENING:
        if FShowAction <> saIgnore then
        begin
          ShowWindow(Handle, ShowCommands[FShowAction]);
          FShowAction := saIgnore;
          // This occurs when MainFormOnTaskbar is False
          // and the ShowDesktop button is clicked.
          if Self = Application.MainForm then
            Application.FAppIconic := False;
          Application.DoShowOwnedPopups(True);
        end;
    else
      inherited;
    end;
end;

procedure TCustomForm.WMMDIActivate(var Message: TWMMDIActivate);
var
  IsActive: Boolean;
begin
  inherited;
  if FormStyle = fsMDIChild then
  begin
    IsActive := Message.ActiveWnd = Handle;
    SetActive(IsActive);
    if IsActive and (csPalette in Application.MainForm.ControlState) then
      Application.MainForm.PaletteChanged(True);
  end;
end;

procedure TCustomForm.WMNextDlgCtl(var Message: TWMNextDlgCtl);
begin
  with Message do
    if Handle then
      Winapi.Windows.SetFocus(CtlFocus) else
      SelectNext(FActiveControl, not BOOL(CtlFocus), True);
end;

procedure TCustomForm.WMEnterMenuLoop(var Message: TMessage);
begin
  SendCancelMode(nil);
  inherited;
end;

procedure TCustomForm.WMHelp(var Message: TWMHelp);

  function GetMenuHelpContext(Menu: TMenu): Integer;
  begin
    Result := 0;
    if Menu = nil then Exit;
    Result := Menu.GetHelpContext(Message.HelpInfo.iCtrlID, True);
    if Result = 0 then
      Result := Menu.GetHelpContext(Message.HelpInfo.hItemHandle, False);
  end;

  function ControlHasHelp(const Control: TWinControl) : Boolean;
  begin
    Result := False;
    if (Control.HelpType = htContext) and (Control.HelpContext <> 0)
      then Result := True
    else if (Control.HelpType = htKeyword) and (Control.HelpKeyword <> '') then
      Result := True;
  end;

  procedure GetHelpInfo(const Control: TWinControl; var HType: THelpType; var ContextID: Integer; var Keyword: String);
  begin
    if Control.HelpType = htContext then
    begin
      HType := htContext;
      ContextID := Control.HelpContext;
    end else
    begin
      HType := htKeyword;
      Keyword := Control.HelpKeyword;
    end;
  end;

var
  Control: TWinControl;
  ContextID: Integer;
  HType: THelpType;
  Keyword: String;
  Pt: TPoint;
begin
  if csDesigning in ComponentState then
    Exit
  else
  begin
    with Message.HelpInfo{$IFNDEF CLR}^{$ENDIF} do
    begin
      if iContextType = HELPINFO_WINDOW then
      begin
        Control := FindControl(hItemHandle);
        while (Control <> nil) and ( not ControlHasHelp(Control)) do
          Control := Control.Parent;
        if Control = nil then Exit;
        GetHelpInfo(Control, HType, ContextID, Keyword);
        Pt := Control.ClientToScreen(Point(0, 0));
      end
      else  { Message.HelpInfo.iContextType = HELPINFO_MENUITEM }
      begin
        HType := htContext;
        ContextID := GetMenuHelpContext(FMenu);
        if ContextID = 0 then
          ContextID := GetMenuHelpContext(PopupMenu);
        Pt := ClientToScreen(Point(0,0));
      end;
    end;
    if (biHelp in BorderIcons) and (HType = htContext) then
    begin
      Application.HelpCommand(HELP_SETPOPUP_POS, PointToLParam(Pt));
      Application.HelpCommand(HELP_CONTEXTPOPUP, ContextID);
    end
    else
    begin
      if HType = htContext then
        Application.HelpContext(ContextID)
      else if HType = htKeyword then
        Application.HelpKeyword(Keyword);
    end;
  end;
end;

procedure TCustomForm.WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
var
{$IF DEFINED(CLR)}
  LMinMaxInfo: TMinMaxInfo;
{$ELSE}
  LMinMaxInfo: PMinMaxInfo;
{$ENDIF}
begin
  if not (csReading in ComponentState) then
  begin
    LMinMaxInfo := Message.MinMaxInfo;
    with LMinMaxInfo{$IFNDEF CLR}^{$ENDIF}, Constraints do
    begin
      with ptMinTrackSize do
      begin
        if MinWidth > 0 then X := MinWidth;
        if MinHeight > 0 then Y := MinHeight;
      end;
      with ptMaxTrackSize do
      begin
        if MaxWidth > 0 then X := MaxWidth;
        if MaxHeight > 0 then Y := MaxHeight;
      end;
      ConstrainedResize(ptMinTrackSize.X, ptMinTrackSize.Y, ptMaxTrackSize.X,
        ptMaxTrackSize.Y);
{$IF DEFINED(CLR)}
      Message.MinMaxInfo := LMinMaxInfo;
{$ENDIF}
    end;
  end;
  inherited;
end;

procedure TCustomForm.WMWindowPosChanging(var Message: TWMWindowPosChanging);
const
  SWP_STATECHANGED = $8000;  // Undocumented

  procedure HandleEdge(var Edge: Integer; SnapToEdge: Integer;
    SnapDistance: Integer = 0);
  begin
    if (Abs(Edge + SnapDistance - SnapToEdge) < FSnapBuffer) then
      Edge := SnapToEdge - SnapDistance;
  end;

var
  DeltaY, DeltaX: Integer;
  LClientRect, RefreshRect, LRect: TRect;
{$IF DEFINED(CLR)}
  WindowPos: TWindowPos;
{$ELSE}
  WindowPos: PWindowPos;
{$ENDIF}
begin
  WindowPos := Message.WindowPos;
  if (WindowPos.Flags and SWP_STATECHANGED) = SWP_STATECHANGED then
    UpdateWindowState;
  if FScreenSnap and ((Parent = nil) or not (csDesigning in ComponentState)) and
    ((WindowPos.X <> 0) or (WindowPos.Y <> 0)) and
    ((WindowPos.cx = Width) and (WindowPos.cy = Height)) then
  begin
    LRect := Monitor.WorkareaRect;
    HandleEdge(WindowPos.x, LRect.Left, 0);
    HandleEdge(WindowPos.y, LRect.Top, 0);
    HandleEdge(WindowPos.x, LRect.Right, Width);
    HandleEdge(WindowPos.y, LRect.Bottom, Height);
{$IF DEFINED(CLR)}
    Message.WindowPos := WindowPos;
{$ENDIF}
  end;
  inherited;
  with FGlassFrame do
    if FrameExtended and not SheetOfGlass and (Visible or (csDesigning in ComponentState)) then
    begin
      if (WindowPos.cx <> 0) or (WindowPos.cy <> 0) then
      begin
        DeltaX := WindowPos.cx - Width;
        DeltaY := WindowPos.cy - Height;
        if (DeltaX <> 0) or (DeltaY <> 0) then
        begin
          LClientRect := ClientRect;
          RefreshRect := Rect(Left, Top, LClientRect.Right - Right, LClientRect.Bottom - Bottom);

          if (RefreshRect.Bottom <= Top) and (DeltaY > 0) then
          begin
            RefreshRect.Bottom := RefreshRect.Top - DeltaY;
            RefreshRect.Top := Bottom;
            FRefreshGlassFrame := True;
          end
          else
          begin
            if DeltaY > 0 then
              Inc(RefreshRect.Bottom, DeltaY);
            if RefreshRect.Bottom < RefreshRect.Top then
                RefreshRect.Bottom := RefreshRect.Top;
          end;

          if (RefreshRect.Right < Left) and (DeltaX > 0) then
          begin
            RefreshRect.Left := RefreshRect.Right - DeltaX;
            RefreshRect.Right := Left;
            FRefreshGlassFrame := True;
          end
          else
          begin
            if DeltaX > 0 then
              Inc(RefreshRect.Right, DeltaX);
            if RefreshRect.Right < RefreshRect.Left then
              RefreshRect.Right := RefreshRect.Left;
          end;

          InvalidateRect(Handle, RefreshRect, False);
        end;
      end;
    end;
end;

procedure TCustomForm.WMNCCalcSize(var Message: TWMNCCalcSize);
var
{$IF DEFINED(CLR)}
  NCCalcSizeParams: TNCCalcSizeParams;
{$ELSE}
  NCCalcSizeParams: PNCCalcSizeParams;
{$ENDIF}
begin
  inherited;

  if (csDesigning in ComponentState) and (Parent <> nil) and
     (Menu <> nil) and (Menu.Items <> nil) and (Menu.Items.Count > 0) then
  begin
    NCCalcSizeParams := Message.CalcSize_Params;
{$IF DEFINED(CLR)}
    Inc(NCCalcSizeParams.rgrc0.Top, GetSystemMetrics(SM_CYMENU));
    Message.CalcSize_Params := NCCalcSizeParams;
{$ELSE}
    Inc(NCCalcSizeParams.rgrc[0].Top, GetSystemMetrics(SM_CYMENU));
{$ENDIF}
  end;
end;

procedure TCustomForm.WMGestureNotify(var Message: TWMGestureNotify);
begin
  inherited
end;

procedure TCustomForm.WMDwmSendIconicLivePreviewBitmap(var Message: TMessage);
begin
  inherited;
  DoWindowPreviewRequest;
end;

procedure TCustomForm.WMDwmSendIconicThumbnail(var Message: TMessage);
begin
  inherited;
  DoThumbPreviewRequest(Message.LParamLo, Message.lParamHi);
end;

procedure TCustomForm.WMDpiChanged(var Message: TWMDpi);
var
  OldPPI: Integer;
begin
  if not (csDesigning in ComponentState) then
  begin
    if (Message.YDpi = 0) or not Scaled then
    begin
      if (Application.MainForm <> nil) and (Application.MainForm.Scaled) then
        FCurrentPpi := Application.MainForm.PixelsPerInch
      else
        Exit;
    end;

    if (Message.YDpi <> FCurrentPpi) and Scaled then
    begin
      if Assigned(FOnBeforeMonitorDpiChanged) then
        FOnBeforeMonitorDpiChanged(Self, FCurrentPPI, Message.YDpi);
      OldPPI := FCurrentPPI;
      ScaleForPPIRect(Message.YDpi, Message.ScaledRect);
      FCurrentPPI := Message.YDpi;
      if Assigned(FOnAfterMonitorDpiChanged) then
        FOnAfterMonitorDpiChanged(Self, OldPPI, FCurrentPPI);
    end;
    Message.Result := 0;
  end;
end;

procedure TCustomForm.CMActivate(var Message: TCMActivate);
begin
  if not (csReading in ComponentState) then
    Activate else
    Include(FFormState, fsActivated);
end;

procedure TCustomForm.CMDeactivate(var Message: TCMDeactivate);
begin
  if not (csReading in ComponentState) then
    Deactivate else
    Exclude(FFormState, fsActivated);
end;

procedure TCustomForm.CMDialogKey(var Message: TCMDialogKey);
begin
  if GetKeyState(VK_MENU) >= 0 then
    with Message do
      case CharCode of
        VK_TAB:
          if GetKeyState(VK_CONTROL) >= 0 then
          begin
            SelectNext(FActiveControl, GetKeyState(VK_SHIFT) >= 0, True);
            Result := 1;
            Exit;
          end;
        VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN:
          begin
            if FActiveControl <> nil then
            begin
{$IF DEFINED(CLR)}
              (FActiveControl.Parent as IWinControl).SelectNext(FActiveControl,
{$ELSE}
              TForm(FActiveControl.Parent).SelectNext(FActiveControl,
{$ENDIF}
                (CharCode = VK_RIGHT) or (CharCode = VK_DOWN), False);
              Result := 1;
            end;
            Exit;
          end;
      end;
  inherited;
end;

procedure TCustomForm.CMShowingChanged(var Message: TMessage);
const
  ShowCommands: array[TWindowState] of Integer =
    (SW_SHOWNORMAL, SW_SHOWMINNOACTIVE, SW_SHOWMAXIMIZED);
var
  LRect: TRect;
  X, Y: Integer;
  NewActiveWindow: HWnd;
  CenterForm: TCustomForm;
  WindowPlacement: TWindowPlacement;
begin
  if not (csDesigning in ComponentState) and (fsShowing in FFormState) then
    raise EInvalidOperation.Create(SVisibleChanged);
  Application.UpdateVisible;
  Include(FFormState, fsShowing);
  try
    if not (csDesigning in ComponentState) then
    begin
      if Showing then
      begin
        try
          DoShow;
        except
          Application.HandleException(Self);
        end;
        if (FPosition = poScreenCenter) or
           ((FPosition in [poScreenCenter, poMainFormCenter, poOwnerFormCenter]) and (FormStyle = fsMDIChild)) then
        begin
          if FormStyle = fsMDIChild then
          begin
            X := (Application.MainForm.ClientWidth - Width) div 2;
            Y := (Application.MainForm.ClientHeight - Height) div 2;
            LRect := Application.MainForm.ClientRect;
          end else
          begin
            LRect := Monitor.WorkAreaRect;
            X := LRect.Left + (LRect.Width - Width) div 2;
            Y := LRect.Top + (LRect.Height - Height) div 2;
          end;
          if X < LRect.Left then
            X := LRect.Left;
          if Y < LRect.Top then
            Y := LRect.Top;
          SetBounds(X, Y, Width, Height);
          if Visible then SetWindowToMonitor;
        end
        else if FPosition in [poMainFormCenter, poOwnerFormCenter] then
        begin
          CenterForm := Application.MainForm;
          if (FPosition = poOwnerFormCenter) and (Owner is TCustomForm) then
            CenterForm := TCustomForm(Owner);
          if WindowState = wsMaximized then
          begin
            ClientWidth := FClientWidth;
            ClientHeight := FClientHeight;
          end;
          if Assigned(CenterForm) and (CenterForm <> Self) then
          begin
            X := ((CenterForm.Width - Width) div 2) + CenterForm.Left;
            Y := ((CenterForm.Height - Height) div 2) + CenterForm.Top;
            LRect := CenterForm.Monitor.WorkAreaRect;
          end else
          begin
            X := (Screen.Width - Width) div 2;
            Y := (Screen.Height - Height) div 2;
            LRect := Screen.DesktopRect;
          end;
          if X < LRect.Left then
            X := LRect.Left;
          if Y < LRect.Top then
            Y := LRect.Top;
          if (WindowState = wsMaximized) and HandleAllocated then
          begin
            Left := X;
            Top := Y;
            WindowPlacement.Length := SizeOf(WindowPlacement);
            GetWindowPlacement(WindowHandle, WindowPlacement);
            WindowPlacement.rcNormalPosition := BoundsRect;
            SetWindowPlacement(WindowHandle, WindowPlacement);
          end
          else
            SetBounds(X, Y, Width, Height);
          if Visible then SetWindowToMonitor;
        end
        else if FPosition = poDesktopCenter then
        begin
          if FormStyle = fsMDIChild then
          begin
            X := (Application.MainForm.ClientWidth - Width) div 2;
            Y := (Application.MainForm.ClientHeight - Height) div 2;
          end else
          begin
            X := ((Screen.DesktopWidth div 2) + Screen.DesktopLeft - (Width div 2));
            Y := ((Screen.DesktopHeight div 2) + Screen.DesktopTop - (Height div 2));
          end;
          if X < Screen.DesktopLeft then X := Screen.DesktopLeft;
          if Y < Screen.DesktopTop then Y := Screen.DesktopTop;
          SetBounds(X, Y, Width, Height);
        end;
        FPosition := poDesigned;
        if FormStyle = fsMDIChild then
        begin
          { Fake a size message to get MDI to behave }
          if FWindowState = wsMaximized then
          begin
            SendMessage(Application.MainForm.ClientHandle, WM_MDIRESTORE, Handle, 0);
            ShowWindow(Handle, SW_SHOWMAXIMIZED);
          end
          else
          begin
            ShowWindow(Handle, ShowCommands[FWindowState]);
            CallWindowProc(@DefMDIChildProc, Handle, WM_SIZE, SIZE_RESTORED,
              Width or (Height shl 16));
            BringToFront;
          end;
          SendMessage(Application.MainForm.ClientHandle,
            WM_MDIREFRESHMENU, 0, 0);
        end
        else
          ShowWindow(Handle, ShowCommands[FWindowState]);
      end else
      begin
        try
          DoHide;
        except
          Application.HandleException(Self);
        end;
        if Screen.ActiveForm = Self then
          MergeMenu(False);
        if FormStyle = fsMDIChild then
          DestroyHandle
        else if fsModal in FFormState then
          SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_HIDEWINDOW or
            SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE)
        else
        begin
          NewActiveWindow := 0;
          if (GetActiveWindow = Handle) and not IsIconic(Handle) then
            NewActiveWindow := FindTopMostWindow(Handle);
          if NewActiveWindow <> 0 then
          begin
            SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_HIDEWINDOW or
              SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE);
            SetActiveWindow(NewActiveWindow);
          end
          else
            ShowWindow(Handle, SW_HIDE);
        end;
      end;
    end else if (csDesigning in ComponentState) and (Parent <> nil) and Showing then
      ShowWindow(Handle, SW_SHOWNORMAL);
  finally
    Exclude(FFormState, fsShowing);
  end;
end;

procedure TCustomForm.CMIconChanged(var Message: TMessage);
begin
  if FIcon.Handle = 0 then IconChanged(nil);
end;

procedure TCustomForm.CMRelease;
begin
  Free;
end;

procedure TCustomForm.CMTextChanged(var Message: TMessage);
begin
  inherited;
  if (FormStyle = fsMDIChild) and (Application.MainForm <> nil) and
    (Application.MainForm.ClientHandle <> 0) then
    SendMessage(Application.MainForm.ClientHandle, WM_MDIREFRESHMENU, 0, 0);
end;

procedure TCustomForm.CMUIActivate(var Message);
begin
  inherited;
end;

procedure TCustomForm.CMParentFontChanged(var Message: TCMParentFontChanged);
begin
  if ParentFont then
    if Message.wParam <> 0 then
      Font.Assign(Message.Font)
    else
    begin
      Font.Assign(Application.DefaultFont);
      ParentFont := True;
    end;
end;

procedure TCustomForm.CMIsShortCut(var Message: TWMKey);
begin
  if IsShortCut(Message) then
    Message.Result := 1
  else
    Message.Result := 0;
end;

procedure TCustomForm.CMUpdateActions(var Message: TMessage);
begin
  UpdateActions;
end;

procedure TCustomForm.Close;
var
  CloseAction: TCloseAction;
begin
  if fsModal in FFormState then
    ModalResult := mrCancel
  else
    if CloseQuery then
    begin
      if FormStyle = fsMDIChild then
        if biMinimize in BorderIcons then
          CloseAction := caMinimize else
          CloseAction := caNone
      else
        CloseAction := caHide;
      DoClose(CloseAction);
      if CloseAction <> caNone then
        if Application.MainForm = Self then Application.Terminate
        else if CloseAction = caHide then Hide
        else if CloseAction = caMinimize then WindowState := wsMinimized
        else Release;
    end;
end;

function TCustomForm.CloseQuery: Boolean;
var
  I: Integer;
begin
  if FormStyle = fsMDIForm then
  begin
    Result := False;
    for I := 0 to MDIChildCount - 1 do
      if not MDIChildren[I].CloseQuery then Exit;
  end;
  Result := True;
  if Assigned(FOnCloseQuery) then FOnCloseQuery(Self, Result);
end;

procedure TCustomForm.CloseModal;
var
  CloseAction: TCloseAction;
begin
  try
    CloseAction := caNone;
    if CloseQuery then
    begin
      CloseAction := caHide;
      DoClose(CloseAction);
    end;
    case CloseAction of
      caNone: ModalResult := 0;
      caFree: Release;
    end;
  except
    ModalResult := 0;
    Application.HandleException(Self);
  end;
end;

                                          
function TCustomForm.GetFormImage: TBitmap;
{$IF DEFINED(CLR)}
var
  Ofs: Integer;
  DC, MemDC: HDC;
  MemBitmap, OldBitmap: HBITMAP;
begin
  if GetWindowLong(Handle, GWL_STYLE) and WS_BORDER <> 0 then
    Ofs := -1  // Don't draw form border
  else
    Ofs := 0;  // There is no border
  DC := GetDC(0);
  MemBitmap := CreateCompatibleBitmap(DC, ClientWidth, ClientHeight);
  ReleaseDC(0, DC);
  MemDC := CreateCompatibleDC(0);
  OldBitmap := SelectObject(MemDC, MemBitmap);
  try
    PaintTo(MemDC, Ofs, Ofs);
    Result := TBitmap.Create;
    Result.Width := ClientWidth;
    Result.Height := ClientHeight;
    BitBlt(Result.Canvas.Handle, 0, 0, ClientWidth, ClientHeight, MemDC, 0, 0, SRCCOPY);
  finally
    SelectObject(MemDC, OldBitmap);
    DeleteDC(MemDC);
    DeleteObject(MemBitmap);
  end;
{$ELSE}
var
  Ofs: Integer;
begin
  Result := TBitmap.Create;
  try
    Result.Width := ClientWidth;
    Result.Height := ClientHeight;
    Result.Canvas.Brush := Brush;
    Result.Canvas.FillRect(ClientRect);
    Result.Canvas.Lock;
    try
      if GetWindowLong(Handle, GWL_STYLE) and WS_BORDER <> 0 then
        Ofs := -1  // Don't draw form border
      else
        Ofs := 0;  // There is no border
      PaintTo(Result.Canvas.Handle, Ofs, Ofs);
    finally
      Result.Canvas.Unlock;
    end;
  except
    Result.Free;
    raise;
  end;
{$ENDIF}
end;

procedure TCustomForm.Print;
var
  FormImage: TBitmap;
  InfoSize: DWORD;
  ImageSize: DWORD;
  Bits: HBITMAP;
  DIBWidth, DIBHeight: Longint;
  PrintWidth, PrintHeight: Longint;
{$IF DEFINED(CLR)}
  LBuffer: IntPtr;
  Info: TBitmapInfo;
  Image: TBytes;
{$ELSE}
  Info: PBitmapInfo;
  Image: Pointer;
{$ENDIF}
begin
  Printer.BeginDoc;
  try
    FormImage := GetFormImage;
    Canvas.Lock;
    try
      { Paint bitmap to the printer }
      with Printer, Canvas do
      begin
        Bits := FormImage.Handle;
        GetDIBSizes(Bits, InfoSize, ImageSize);
{$IF DEFINED(CLR)}
        LBuffer := Marshal.AllocHGlobal(InfoSize);
        try
          SetLength(Image, ImageSize);
          GetDIB(Bits, 0, LBuffer, Image);
          Info := TBitmapInfo(Marshal.PtrToStructure(LBuffer, TypeOf(TBitmapInfo)));
{$ELSE}
        Info := AllocMem(InfoSize);
        try
          Image := AllocMem(ImageSize);
          try
            GetDIB(Bits, 0, Info^, Image^);
{$ENDIF}
          with Info.bmiHeader do
          begin
            DIBWidth := biWidth;
            DIBHeight := biHeight;
          end;
          case PrintScale of
            poProportional:
              begin
                PrintWidth := MulDiv(DIBWidth, GetDeviceCaps(Handle,
                  LOGPIXELSX), PixelsPerInch);
                PrintHeight := MulDiv(DIBHeight, GetDeviceCaps(Handle,
                  LOGPIXELSY), PixelsPerInch);
              end;
            poPrintToFit:
              begin
                PrintWidth := MulDiv(DIBWidth, PageHeight, DIBHeight);
                if PrintWidth < PageWidth then
                  PrintHeight := PageHeight
                else
                begin
                  PrintWidth := PageWidth;
                  PrintHeight := MulDiv(DIBHeight, PageWidth, DIBWidth);
                end;
              end;
          else
            PrintWidth := DIBWidth;
            PrintHeight := DIBHeight;
          end;
{$IF DEFINED(CLR)}
          Marshal.StructureToPtr(TObject(Info), LBuffer, True);
          StretchDIBits(Canvas.Handle, 0, 0, PrintWidth, PrintHeight, 0, 0,
            DIBWidth, DIBHeight, Image, LBuffer, DIB_RGB_COLORS, SRCCOPY);
        finally
          Marshal.FreeHGlobal(LBuffer);
{$ELSE}
            StretchDIBits(Canvas.Handle, 0, 0, PrintWidth, PrintHeight, 0, 0,
              DIBWidth, DIBHeight, Image, Info^, DIB_RGB_COLORS, SRCCOPY);
          finally
            FreeMem(Image, ImageSize);
          end;
        finally
          FreeMem(Info, InfoSize);
{$ENDIF}
        end;
      end;
    finally
      Canvas.Unlock;
      FormImage.Free;
    end;
  finally
    Printer.EndDoc;
  end;
end;

procedure TCustomForm.Hide;
begin
  Visible := False;
end;

procedure TCustomForm.Show;
begin
  Visible := True;
  BringToFront;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TCustomForm.SetFocus;
begin
  if not FActive then
  begin
    if not (Visible and Enabled) then
      { Consider the case of the embedded form designer, where the form will
        not be visible, but the handle will be allocated, and the designing state
        will be set. }
      if not ((csDesigning in ComponentState) and (HandleAllocated)) then
      raise EInvalidOperation.Create(SCannotFocus);
    SetWindowFocus;
  end;
end;

procedure TCustomForm.RecreateAsPopup(AWindowHandle: HWND);
begin
  FInternalPopupParentWnd := AWindowHandle;
  FInternalPopupParent := nil;
  if HandleAllocated then
    RecreateWnd
  else
    UpdateControlState;
end;

procedure TCustomForm.Release;
begin
  PostMessage(Handle, CM_RELEASE, 0, 0);
end;

function TCustomForm.ShowModal: Integer;
var
  WindowList: TTaskWindowList;
  LSaveFocusState: TFocusState;
  SaveCursor: TCursor;
  SaveCount: Integer;
  ActiveWindow: HWnd;
begin
  CancelDrag;
  if Visible or not Enabled or (fsModal in FFormState) or
    (FormStyle = fsMDIChild) then
    raise EInvalidOperation.Create(SCannotShowModal);
  if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
  ReleaseCapture;
  Application.ModalStarted;
  try
    { RecreateWnd could change the active window }
    ActiveWindow := GetActiveWindow;
    Include(FFormState, fsModal);
    if (PopupMode = pmNone) and (Application.ModalPopupMode <> pmNone) then
    begin
      RecreateWnd;
      HandleNeeded;
      { The active window might have become invalid, refresh it }
      if (ActiveWindow = 0) or not IsWindow(ActiveWindow) then
        ActiveWindow := GetActiveWindow;
    end;
    LSaveFocusState := SaveFocusState;
    Screen.SaveFocusedList.Insert(0, Screen.FocusedForm);
    Screen.FocusedForm := Self;
    SaveCursor := Screen.Cursor;
    Screen.Cursor := crDefault;
    SaveCount := Screen.CursorCount;
    WindowList := DisableTaskWindows(0);
    try
      Show;
      try
        SendMessage(Handle, CM_ACTIVATE, 0, 0);
        ModalResult := 0;
        repeat
          Application.HandleMessage;
          if Application.Terminated then ModalResult := mrCancel else
            if ModalResult <> 0 then CloseModal;
        until ModalResult <> 0;
        Result := ModalResult;
        SendMessage(Handle, CM_DEACTIVATE, 0, 0);
        if GetActiveWindow <> Handle then ActiveWindow := 0;
      finally
        Hide;
      end;
    finally
      if Screen.CursorCount = SaveCount then
        Screen.Cursor := SaveCursor
      else Screen.Cursor := crDefault;
      EnableTaskWindows(WindowList);
      if Screen.SaveFocusedList.Count > 0 then
      begin
        Screen.FocusedForm := TCustomForm(Screen.SaveFocusedList.First);
        Screen.SaveFocusedList.Remove(Screen.FocusedForm);
      end else Screen.FocusedForm := nil;
      { ActiveWindow might have been destroyed and using it as active window will
        force Windows to activate another application }
      if (ActiveWindow <> 0) and not IsWindow(ActiveWindow) then
        ActiveWindow := FindTopMostWindow(0);
      if ActiveWindow <> 0 then
        SetActiveWindow(ActiveWindow);
      RestoreFocusState(LSaveFocusState);
      Exclude(FFormState, fsModal);
    end;
  finally
    Application.ModalFinished;
  end;
end;

procedure TCustomForm.UpdateActions;
var
  I: Integer;

  procedure TraverseClients(Container: TWinControl);
  var
    I: Integer;
    Control: TControl;
  begin
    if Container.Showing and not (csDesigning in Container.ComponentState) then
      for I := 0 to Container.ControlCount - 1 do
      begin
        Control := Container.Controls[I];
        if (csActionClient in Control.ControlStyle) and Control.Visible then
            Control.InitiateAction;
        if (Control is TWinControl) and (TWinControl(Control).ControlCount > 0) then
          TraverseClients(TWinControl(Control));
      end;
  end;

begin
  if (csDesigning in ComponentState) or not Showing then Exit;
  { Update form }
  InitiateAction;
  { Update main menu's top-most items }
  if Menu <> nil then
    for I := 0 to Menu.Items.Count - 1 do
      with Menu.Items[I] do
        if Visible then InitiateAction;
  { Update any controls }
  TraverseClients(Self);
end;

procedure TCustomForm.UpdateWindowState;
var
  Placement: TWindowPlacement;
begin
  if HandleAllocated then
  begin
    Placement.length := SizeOf(TWindowPlacement);
    GetWindowPlacement(Handle, Placement);
    case Placement.showCmd of
      SW_SHOWMINIMIZED: FWindowState := wsMinimized;
      SW_SHOWMAXIMIZED: FWindowState := wsMaximized;
    else
      FWindowState := wsNormal;
    end;
  end;
end;

procedure TCustomForm.RequestAlign;
begin
  if Parent = nil then
    Screen.AlignForm(Self)
  else if not (csDesigning in ComponentState) then
    inherited RequestAlign;
end;

procedure TCustomForm.WMSettingChange(var Message: TMessage);
begin
  inherited;
  if Message.WParam = SPI_SETWORKAREA then
    RequestAlign;
end;

{$IF DEFINED(CLR)}
function TCustomForm.ActionExecute(Action: TBasicAction): Boolean;
{$ELSE}
procedure TCustomForm.CMActionExecute(var Message: TMessage);
{$ENDIF}

  function ProcessExecute(Control: TControl): Boolean;
  begin
    Result := (Control <> nil) and
{$IF DEFINED(CLR)}
      Control.ExecuteAction(Action);
{$ELSE}
      Control.ExecuteAction(TBasicAction(Message.LParam));
{$ENDIF}
  end;

  function TraverseClients2(Container: TWinControl): Boolean;
  var
    I: Integer;
    Control: TControl;
  begin
    if Container.Showing then
      for I := 0 to Container.ControlCount - 1 do
      begin
        Control := Container.Controls[I];
        if Control.Visible and ProcessExecute(Control) or
          (Control is TWinControl) and (TWinControl(Control).ControlCount > 0) and
          TraverseClients2(TWinControl(Control)) then
        begin
          Result := True;
          Exit;
        end;
      end;
    Result := False;
  end;

begin
{$IF DEFINED(CLR)}
  if (csDesigning in ComponentState) or not Showing then
    Result := False
  else
    { Find a target for given Action }
    Result :=  ProcessExecute(ActiveControl) or ProcessExecute(Self) or
      TraverseClients2(Self);
{$ELSE}
  if (csDesigning in ComponentState) or not Showing then Exit;
  { Find a target for given Command (Message.LParam). }
  if ProcessExecute(ActiveControl) or ProcessExecute(Self) or
    TraverseClients2(Self) then
    Message.Result := 1;
{$ENDIF}
end;

{$IF DEFINED(CLR)}
function TCustomForm.ActionUpdate(Action: TBasicAction): Boolean;
{$ELSE}
procedure TCustomForm.CMActionUpdate(var Message: TMessage);
{$ENDIF}

  function ProcessUpdate(Control: TControl): Boolean;
  begin
    Result := (Control <> nil) and
{$IF DEFINED(CLR)}
      Control.UpdateAction(Action);
{$ELSE}
      Control.UpdateAction(TBasicAction(Message.LParam));
{$ENDIF}
  end;

  function TraverseClients3(Container: TWinControl): Boolean;
  var
    I: Integer;
    Control: TControl;
  begin
    if Container.Showing and not (csDesigning in Container.ComponentState) then
      for I := 0 to Container.ControlCount - 1 do
      begin
        Control := Container.Controls[I];
        if Control.Visible and ProcessUpdate(Control) or
          (Control is TWinControl) and (TWinControl(Control).ControlCount > 0) and
           TraverseClients3(TWinControl(Control)) then
        begin
          Result := True;
          Exit;
        end;
      end;
    Result := False;
  end;

begin
{$IF DEFINED(CLR)}
  if (csDesigning in ComponentState) or not Showing then
    Result := False
  else
    { Find a target for given Action }
    Result :=  ProcessUpdate(ActiveControl) or ProcessUpdate(Self) or
      TraverseClients3(Self);
{$ELSE}
  if (csDesigning in ComponentState) or not Showing then Exit;
  { Find a target for given Command (Message.LParam). }
  if ProcessUpdate(ActiveControl) or ProcessUpdate(Self) or
    TraverseClients3(Self) then
    Message.Result := 1;
{$ENDIF}
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
function TCustomForm.IsShortCut(var Message: TWMKey): Boolean;

  function DispatchShortCut(const Owner: TComponent) : Boolean;
  var
    I: Integer;
    Component: TComponent;
  begin
    Result := False;
    { Dispatch to all children }
    for I := 0 to Owner.ComponentCount - 1 do
    begin
      Component := Owner.Components[I];
      if Component is TCustomActionList then
      begin
        if TCustomActionList(Component).IsShortCut(Message) then
        begin
          Result := True;
          Exit;
        end
      end
      else
      begin
        Result := DispatchShortCut(Component);
        if Result then
          Break;
      end;
    end;
  end;

begin
  Result := False;
  if Assigned(FOnShortCut) then FOnShortCut(Message, Result);
  Result := Result or (Menu <> nil) and (Menu.WindowHandle <> 0) and
    Menu.IsShortCut(Message) or DispatchShortCut(Self);
end;

{$IF NOT DEFINED(CLR)}
function TCustomForm.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // Route the QueryInterface through the Designer first
  if (Designer = nil) or (Designer.QueryInterface(IID, Obj) <> 0) then
    Result := inherited QueryInterface(IID, Obj)
  else
    Result := 0;
end;
{$ENDIF}

procedure TCustomForm.MouseWheelHandler(var Message: TMessage);
begin
  inherited MouseWheelHandler(Message);
end;

function TCustomForm.HandleCreateException: Boolean;
begin
  Application.HandleException(Self);
  Result := True;
end;

procedure TCustomForm.SetLayeredAttribs;
const
  cUseAlpha: array [Boolean] of Integer = (0, LWA_ALPHA);
  cUseColorKey: array [Boolean] of Integer = (0, LWA_COLORKEY);
var
  AStyle: Integer;
begin
  if not (csDesigning in ComponentState) and
    (Assigned(SetLayeredWindowAttributes)) and HandleAllocated then
  begin
    AStyle := GetWindowLong(Handle, GWL_EXSTYLE);
    if FAlphaBlend or FTransparentColor then
    begin
      if (AStyle and WS_EX_LAYERED) = 0 then
        SetWindowLong(Handle, GWL_EXSTYLE, AStyle or WS_EX_LAYERED);
      SetLayeredWindowAttributes(Handle, ColorToRGB(FTransparentColorValue), FAlphaBlendValue,
        cUseAlpha[FAlphaBlend] or cUseColorKey[FTransparentColor]);
    end
    else
    begin
      SetWindowLong(Handle, GWL_EXSTYLE, AStyle and not WS_EX_LAYERED);
      RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN);
    end;
  end;
end;

procedure TCustomForm.SetAlphaBlend(const Value: Boolean);
begin
  if FAlphaBlend <> Value then
  begin
    FAlphaBlend := Value;
    SetLayeredAttribs;
  end;
end;

procedure TCustomForm.SetAlphaBlendValue(const Value: Byte);
begin
  if FAlphaBlendValue <> Value then
  begin
    FAlphaBlendValue := Value;
    SetLayeredAttribs;
  end;
end;

procedure TCustomForm.SetTransparentColorValue(const Value: TColor);
begin
  if FTransparentColorValue <> Value then
  begin
    FTransparentColorValue := Value;
    SetLayeredAttribs;
  end;
end;

procedure TCustomForm.SetTransparentColor(const Value: Boolean);
begin
  if FTransparentColor <> Value then
  begin
    FTransparentColor := Value;
    if FTransparentColor and FGlassFrame.Enabled then
      FGlassFrame.Enabled := False; // GlassFrame and TransparentColor are mutually exclusive
    SetLayeredAttribs;
  end;
end;

procedure TCustomForm.InitAlphaBlending(var Params: TCreateParams);
begin
  if not (csDesigning in ComponentState) and (Assigned(SetLayeredWindowAttributes)) then
    if FAlphaBlend or FTransparentColor then
      Params.ExStyle := Params.ExStyle or WS_EX_LAYERED;
end;

procedure TCustomForm.MakeFullyVisible(AMonitor: TMonitor);
var
  ALeft: Integer;
  ATop: Integer;
begin
  if AMonitor = nil then
    AMonitor := Monitor;
  ALeft := Left;
  ATop := Top;
  if Left + Width > AMonitor.WorkAreaRect.Right then
    ALeft := AMonitor.WorkAreaRect.Right - Width;
  if Left < AMonitor.WorkAreaRect.Left then
    ALeft := AMonitor.WorkAreaRect.Left;
  if Top + Height > AMonitor.WorkAreaRect.Bottom then
    ATop := AMonitor.WorkAreaRect.Bottom - Height;
  if Top < AMonitor.WorkAreaRect.Top then
    ATop := AMonitor.WorkAreaRect.Top;
  SetBounds(ALeft, ATop, Width, Height);
end;

{$IF DEFINED(CLR)}
function TCustomForm.GetRootDesigner: IDesignerNotify;
begin
  if (csDesigning in ComponentState) and (FDesigner is IDesignerNotify) then
    Result := FDesigner as IDesignerNotify
  else
    Result := nil;
end;
{$ENDIF}

procedure TCustomForm.SetLeft(Value: Integer);
begin
  if (csDesigning in ComponentState) and (Parent <> nil) then
  begin
    DesignInfo := (DesignInfo and $0000FFFF) or (Value shl 16);
    if not (csLoading in ComponentState) and (Position <> poDefaultSizeOnly) then
      Position := poDesigned;
  end else
    inherited Left := Value;
end;

procedure TCustomForm.SetTop(Value: Integer);
begin
  if (csDesigning in ComponentState) and (Parent <> nil) then
  begin
    DesignInfo := (DesignInfo and $FFFF0000) or (Cardinal(Value) and $FFFF);
    if not (csLoading in ComponentState) and (Position <> poDefaultSizeOnly) then
      Position := poDesigned;
  end else
    inherited Top := Value;
end;

procedure TCustomForm.SetGlassFrame(const Value: TGlassFrame);
begin
  FGlassFrame.Assign(Value);
end;

procedure TCustomForm.UpdateGlassFrame(Sender: TObject);
var
  LMargins: TElementMargins;
begin
  if DwmCompositionEnabled and HandleAllocated then
  begin
    with LMargins, FGlassFrame do
    begin
      if Enabled then
      begin
        if not SheetOfGlass then
        begin
          cxLeftWidth := Left;
          cxRightWidth := Right;
          cyTopHeight := Top;
          cyBottomHeight := Bottom;
        end
        else
        begin
          cxLeftWidth := -1;
          cxRightWidth := -1;
          cyTopHeight := -1;
          cyBottomHeight := -1;
        end;
        if not (csDesigning in ComponentState) then
          ControlState := ControlState + [csGlassPaint];
      end
      else
      begin
        ControlState := ControlState - [csGlassPaint];
{$IF NOT DEFINED(CLR)}
        FillChar(LMargins, SizeOf(LMargins), 0);
{$ENDIF}
      end;
    end;
    if (csDesigning in ComponentState) then
      InvalidateRect(Handle, nil, True)
    else
    begin
      DwmExtendFrameIntoClientArea(Handle, LMargins);
      Invalidate;
    end;
  end
  else
  begin
    ControlState := ControlState - [csGlassPaint];
    if (csDesigning in ComponentState) then
      InvalidateRect(Handle, nil, True)
  end;
end;

function ContainsRect(const OuterRect, InnerRect: TRect): Boolean; inline;
begin
  with InnerRect do
    Result := (Left >= OuterRect.Left) and (Right <= OuterRect.Right) and
              (Top >= OuterRect.Top) and (Bottom <= OuterRect.Bottom);
end;

procedure TCustomForm.UpdateGlassFrameControls(const Rect: TRect);

  procedure DoUpdateControls(AControl: TWinControl);
  var
    I: Integer;
    LRect: TRect;
    LControl: TControl;
  begin
    for I := 0 to AControl.ControlCount - 1 do
    begin
      LControl := AControl.Controls[I];
      if not FGlassFrame.SheetOfGlass then
      begin
        LRect := LControl.ClientRect;
        LRect.TopLeft := LControl.ClientToParent(LRect.TopLeft, Self);
        LRect.BottomRight := LControl.ClientToParent(LRect.BottomRight, Self);
      end;

      if FGlassFrame.SheetOfGlass or not ContainsRect(Rect, LRect) then
      begin
        if not (csGlassPaint in LControl.ControlState) then
          LControl.ControlState := LControl.ControlState + [csGlassPaint];
      end
      else
        if (csGlassPaint in LControl.ControlState) then
          LControl.ControlState := LControl.ControlState - [csGlassPaint];

      if LControl is TWinControl then
        DoUpdateControls(TWinControl(LControl));
    end;
  end;

begin
  if not (csDesigning in ComponentState) and DwmCompositionEnabled then
    DoUpdateControls(Self);
end;

{ TForm }

class constructor TForm.Create;
begin
  TCustomStyleEngine.RegisterStyleHook(TForm, TFormStyleHook);
end;

class destructor TForm.Destroy;
begin
  TCustomStyleEngine.UnRegisterStyleHook(TForm, TFormStyleHook);
end;

procedure TForm.Tile;
const
  TileParams: array[TTileMode] of Word = (MDITILE_HORIZONTAL, MDITILE_VERTICAL);
begin
  if (FFormStyle = fsMDIForm) and (ClientHandle <> 0) then
    SendMessage(ClientHandle, WM_MDITILE, TileParams[FTileMode], 0);
end;

procedure TForm.Cascade;
begin
  if (FFormStyle = fsMDIForm) and (ClientHandle <> 0) then
    SendMessage(ClientHandle, WM_MDICASCADE, 0, 0);
end;

procedure TForm.ArrangeIcons;
begin
  if (FFormStyle = fsMDIForm) and (ClientHandle <> 0) then
    SendMessage(ClientHandle, WM_MDIICONARRANGE, 0, 0);
end;

procedure TForm.Next;
begin
  if (FFormStyle = fsMDIForm) and (ClientHandle <> 0) then
    SendMessage(ClientHandle, WM_MDINEXT, 0, 0);
end;

procedure TForm.Previous;
begin
  if (FormStyle = fsMDIForm) and (ClientHandle <> 0) then
    SendMessage(ClientHandle, WM_MDINEXT, 0, 1);
end;

{ TCustomDockForm }

constructor TCustomDockForm.Create(AOwner: TComponent);
begin
  CreateNew(AOwner, 0);
  Position := poDesigned;
  AutoScroll := False;
  BorderStyle := bsSizeToolWin;
  DockSite := True;
  FormStyle := fsStayOnTop;
end;

procedure TCustomDockForm.DoAddDockClient(Client: TControl; const ARect: TRect);
var
  S: string;
  I: Integer;
begin
  if DockClientCount = 1 then
  begin
    { Use first docked control }
{$IF DEFINED(CLR)}
    S := Client.GetText;
    begin
{$ELSE}
    with Client do
    begin
      SetString(S, nil, GetTextLen + 1);
      GetTextBuf(PChar(S), Length(S));
{$ENDIF}
      { Search for first CR/LF and end string there }
      for I := 1 to Length(S) do
        if CharInSet(S[I], [#13, #10]) then
        begin
          SetLength(S, I - 1);
          Break;
        end;
    end;
    Caption := S;
  end;
  inherited DoAddDockClient(Client, ARect);
  Client.Align := alClient;
  if not (csLoading in ComponentState) then
    Visible := True;
end;

procedure TCustomDockForm.DoRemoveDockClient(Client: TControl);
begin
  inherited DoRemoveDockClient(Client);
  if DockClientCount = 0 then Release;
end;

procedure TCustomDockForm.Loaded;
var
  I: Integer;
begin
  { Make sure we dock controls after streaming }
  for I := 0 to ControlCount - 1 do
    Controls[I].Dock(Self, ClientRect);
  inherited Loaded;
end;

procedure TCustomDockForm.GetSiteInfo(Client: TControl;
  var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
begin
  CanDock := DockClientCount = 0;
end;

procedure TCustomDockForm.WMNCHitTest(var Message: TWMNCHitTest);
begin
  inherited;
  if not (csDesigning in ComponentState) and (Message.Result = HTCLIENT) then
    Message.Result := HTCAPTION;
end;

procedure TCustomDockForm.WMNCLButtonDown(var Message: TWMNCLButtonDown);
begin
  if (Message.HitTest = HTCAPTION) and (DragKind <> dkDock) and not
    (csDesigning in ComponentState) and not IsIconic(Handle) and
    (DockClientCount > 0) then
  begin
    { Activate window since we override WM_NCLBUTTON behavior }
    SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or SWP_NOMOVE or
      SWP_NOSIZE);
{$IF DEFINED(CLR)}
    PostMessage(Handle, WM_NCLBUTTONUP, UnwrapMessage(Message).WParam,
      UnwrapMessage(Message).LParam);
{$ELSE}
    PostMessage(Handle, WM_NCLBUTTONUP, TMessage(Message).WParam,
      TMessage(Message).LParam);
{$ENDIF}
    if Active then DockClients[0].BeginDrag(True);
  end
  else
    inherited;
end;

{$IF DEFINED(CLR)}
procedure TCustomDockForm.ControlListChange(Inserting: Boolean; Child: TControl);
begin
  inherited;
  if not Inserting then
  begin
    UndockClient(nil, Child);
    if Child.HostDockSite = Self then
      Child.Dock(NullDockSite, Child.BoundsRect);
  end;
end;
{$ELSE}
procedure TCustomDockForm.CMControlListChange(var Message: TMessage);
begin
  inherited;
  if Message.LParam = 0 then
  begin
    Perform(CM_UNDOCKCLIENT, 0, Message.WParam);
    if TControl(Message.WParam).HostDockSite = Self then
      TControl(Message.WParam).Dock(NullDockSite, TControl(Message.WParam).BoundsRect);
  end;
end;
{$ENDIF}

procedure TCustomDockForm.CMDockNotification(var Message: TCMDockNotification);
var
  S: string;
  I: Integer;
begin
  inherited;
  case Message.NotifyRec.ClientMsg of
    CM_VISIBLECHANGED: Visible := Message.Client.Visible;
    WM_SETTEXT:
      begin
{$IF DEFINED(CLR)}
        S := Message.Client.GetText;
{$ELSE}
        SetString(S, nil, Message.Client.GetTextLen + 1);
        Message.Client.GetTextBuf(PChar(S), Length(S));
{$ENDIF}
        { Search for first CR/LF and end string there }
        for I := 1 to Length(S) do
          if CharInSet(S[I], [#13, #10]) then
          begin
            SetLength(S, I - 1);
            Break;
          end;
        Caption := S;
      end;
  end;
end;

{$IF DEFINED(CLR)}
function TCustomDockForm.UndockClient(NewTarget, Client: TControl): Boolean;
begin
  Result := inherited UndockClient(NewTarget, Client);
  Client.Align := alNone;
end;
{$ELSE}
procedure TCustomDockForm.CMUnDockClient(var Message: TCMUnDockClient);
begin
  inherited;
  Message.Client.Align := alNone;
end;
{$ENDIF}

procedure TCustomDockForm.CMVisibleChanged(var Message: TMessage);
var
  I: Integer;
begin
  inherited;
  if not (csDestroying in ComponentState) then
    for I := 0 to DockClientCount - 1 do
      DockClients[I].Visible := Visible;
end;

{ TMonitor }

function TMonitor.GetLeft: Integer;
begin
  Result := BoundsRect.Left;
end;

function TMonitor.GetHeight: Integer;
begin
  with BoundsRect do
    Result := Bottom - Top;
end;

function TMonitor.GetTop: Integer;
begin
  Result := BoundsRect.Top;
end;

function TMonitor.GetWidth: Integer;
begin
  with BoundsRect do
    Result := Right - Left;
end;

function TMonitor.GetBoundsRect: TRect;
var
  MonInfo: TMonitorInfo;
begin
{$IF DEFINED(CLR)}
  MonInfo.cbSize := Marshal.SizeOf(TypeOf(MonInfo));
{$ELSE}
  MonInfo.cbSize := SizeOf(MonInfo);
{$ENDIF}
  GetMonitorInfo(FHandle, {$IFNDEF CLR}@{$ENDIF}MonInfo);
  Result := MonInfo.rcMonitor;
end;

function TMonitor.GetWorkareaRect: TRect;
var
  MonInfo: TMonitorInfo;
begin
{$IF DEFINED(CLR)}
  MonInfo.cbSize := Marshal.SizeOf(TypeOf(MonInfo));
{$ELSE}
  MonInfo.cbSize := SizeOf(MonInfo);
{$ENDIF}
  GetMonitorInfo(FHandle, {$IFNDEF CLR}@{$ENDIF}MonInfo);
  Result := MonInfo.rcWork;
end;

function TMonitor.GetPrimary: Boolean;
var
  MonInfo: TMonitorInfo;
begin
{$IF DEFINED(CLR)}
  MonInfo.cbSize := Marshal.SizeOf(TypeOf(MonInfo));
{$ELSE}
  MonInfo.cbSize := SizeOf(MonInfo);
{$ENDIF}
  GetMonitorInfo(FHandle, {$IFNDEF CLR}@{$ENDIF}MonInfo);
  Result := (MonInfo.dwFlags and MONITORINFOF_PRIMARY) <> 0;
end;

function TMonitor.GetPixelsPerInch: Integer;
var
  Ydpi: Cardinal;
  Xdpi: Cardinal;
  DC: HDC;
begin
  if CheckWin32Version(6,3) then
  begin
    if GetDpiForMonitor(FHandle, TMonitorDpiType.MDT_EFFECTIVE_DPI, Ydpi, Xdpi) = S_OK then
      Result := Ydpi
    else
      Result := 0;
  end
  else
  begin
    DC := GetDC(0);
    Result := GetDeviceCaps(DC, LOGPIXELSY);
    ReleaseDC(0, DC);
  end;
end;

{ TCursorInfo }

{$IF DEFINED(CLR)}
procedure TCursorInfo.Finalize;
var
  P, Next: TCursorRec;
  Hdl: HCURSOR;
begin
  P := FList;
  while P <> nil do
  begin
    if ((P.Index >= crSqlWait) and (P.Index <= crDrag)) or
      (P.Index = crHandPoint) or (P.Index > 0) then
      DestroyCursor(P.Handle);
    Next := P.Next;
    P := Next;
  end;
  FList := nil;
  Hdl := LoadCursor(0, IDC_ARROW);
  if Hdl <> FDefaultCursor then
  begin
    DestroyCursor(FDefaultCursor);
    FDefaultCursor := Hdl;
  end;
end;
{$ENDIF}

{ TScreen }

const
{$IF DEFINED(CLR)}
  IDC_NODROP =    32767;
  IDC_DRAG   =    32766;
  IDC_HSPLIT =    32765;
  IDC_VSPLIT =    32764;
  IDC_MULTIDRAG = 32763;
  IDC_SQLWAIT =   32762;
{$ELSE}
  IDC_NODROP =    PChar(32767);
  IDC_DRAG   =    PChar(32766);
  IDC_HSPLIT =    PChar(32765);
  IDC_VSPLIT =    PChar(32764);
  IDC_MULTIDRAG = PChar(32763);
  IDC_SQLWAIT =   PChar(32762);
{$ENDIF}

{$IF DEFINED(CLR)}
type
  TFontEnumerator = class
    FStrings: TStrings;
    FEnumProc: TFNFontEnumProc;
    constructor Create(Strings: TStrings);
    function EnumFontsProc([in] var LogFont: TLogFont; [in] var TextMetric: TTextMetric;
      FontType: DWORD; Data: LPARAM): Integer;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
constructor TFontEnumerator.Create(Strings: TStrings);
begin
  inherited Create;
  FStrings := Strings;
  FEnumProc := @EnumFontsProc;
end;

function TFontEnumerator.EnumFontsProc([in] var LogFont: TLogFont;
  [in] var TextMetric: TTextMetric; FontType: DWORD; Data: LPARAM): Integer;
var
  Temp: string;
begin
  Temp := LogFont.lfFaceName;
  if (FStrings.Count = 0) or (FStrings[FStrings.Count-1] <> Temp) then
    FStrings.Add(Temp);
  Result := 1;
end;
{$ENDIF}

{$IF NOT DEFINED(CLR)}
function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
var
  S: TStrings;
  Temp: string;
begin
  S := TStrings(Data);
  Temp := LogFont.lfFaceName;
  if (S.Count = 0) or (AnsiCompareText(S[S.Count-1], Temp) <> 0) then
    S.Add(Temp);
  Result := 1;
end;
{$ENDIF}

constructor TScreen.Create(AOwner: TComponent);
var
  DC: HDC;
begin
  inherited Create(AOwner);
  System.Classes.AddDataModule := AddDataModule;
  System.Classes.RemoveDataModule := RemoveDataModule;
  CreateCursors;
  FDefaultKbLayout := GetKeyboardLayout(0);
  FForms := TList.Create;
  FCustomForms := TList.Create;
  FDataModules := TList.Create;
  FMonitors := TList.Create;
  FSaveFocusedList := TList.Create;
  DC := GetDC(0);
  FPixelsPerInch := GetDeviceCaps(DC, LOGPIXELSY);
  ReleaseDC(0, DC);
{$IF DEFINED(CLR)}
  EnumDisplayMonitors(0, nil, TMonitorEnumerator.Create(FMonitors).FEnumProc, 0);
{$ELSE}
  EnumDisplayMonitors(0, nil, @EnumMonitorsProc, Winapi.Windows.LPARAM(FMonitors));
{$ENDIF}
  FIconFont := TFont.Create;
  FMenuFont := TFont.Create;
  FHintFont := TFont.Create;
  FMessageFont := TFont.Create;
  FCaptionFont := TFont.Create;
  GetMetricSettings;
  FIconFont.OnChange := IconFontChanged;
  FMenuFont.OnChange := IconFontChanged;
  FHintFont.OnChange := IconFontChanged;
  FMessageFont.OnChange := IconFontChanged;
  FCaptionFont.OnChange := IconFontChanged;
end;

destructor TScreen.Destroy;
var
  I: Integer;
begin
  FreeAndNil(FMessageFont);
  FreeAndNil(FHintFont);
  FreeAndNil(FMenuFont);
  FreeAndNil(FIconFont);
  FreeAndNil(FCaptionFont);
  FreeAndNil(FDataModules);
  FreeAndNil(FCustomForms);
  FreeAndNil(FForms);
  FreeAndNil(FFonts);
  FreeAndNil(FImes);
  FreeAndNil(FSaveFocusedList);
  if FMonitors <> nil then
    for I := 0 to FMonitors.Count - 1 do
      TMonitor(FMonitors[I]).Free;
  FreeAndNil(FMonitors);
  DestroyCursors;
  System.Classes.AddDataModule := nil;
  System.Classes.RemoveDataModule := nil;
  inherited Destroy;
end;

function TScreen.GetHeight: Integer;
begin
  Result := GetSystemMetrics(SM_CYSCREEN);
end;

function TScreen.GetWidth: Integer;
begin
  Result := GetSystemMetrics(SM_CXSCREEN);
end;

function TScreen.GetDesktopTop: Integer;
begin
  Result := GetSystemMetrics(SM_YVIRTUALSCREEN);
end;

function TScreen.GetDesktopLeft: Integer;
begin
  Result := GetSystemMetrics(SM_XVIRTUALSCREEN);
end;

function TScreen.GetDesktopHeight: Integer;
begin
  Result := GetSystemMetrics(SM_CYVIRTUALSCREEN);
end;

function TScreen.GetDesktopWidth: Integer;
begin
  Result := GetSystemMetrics(SM_CXVIRTUALSCREEN);
end;

function TScreen.GetMonitor(Index: Integer): TMonitor;
begin
  Result := TMonitor(FMonitors[Index]);
end;

function TScreen.GetMonitorCount: Integer;
begin
  if FMonitors.Count = 0 then
    Result := GetSystemMetrics(SM_CMONITORS)
  else
    Result := FMonitors.Count;
end;

function TScreen.GetForm(Index: Integer): TForm;
begin
  Result := TForm(FForms[Index]);
end;

function TScreen.GetFormCount: Integer;
begin
  Result := FForms.Count;
end;

function TScreen.GetCustomForms(Index: Integer): TCustomForm;
begin
  Result := TCustomForm(FCustomForms[Index]);
end;

function TScreen.GetCustomFormCount: Integer;
begin
  Result := FCustomForms.Count;
end;

procedure TScreen.UpdateLastActive;
begin
  if FLastActiveCustomForm <> FActiveCustomForm then
  begin
    FLastActiveCustomForm := FActiveCustomForm;
    if Assigned(FOnActiveFormChange) then FOnActiveFormChange(Self);
  end;
  if FLastActiveControl <> FActiveControl then
  begin
    FLastActiveControl := FActiveControl;
    if Assigned(FOnActiveControlChange) then FOnActiveControlChange(Self);
  end;
end;

procedure TScreen.AddForm(AForm: TCustomForm);
begin
  FCustomForms.Add(AForm);
  if AForm is TForm then
  begin
    FForms.Add(AForm);
    Application.UpdateVisible;
  end;
end;

procedure TScreen.RemoveForm(AForm: TCustomForm);
begin
  FCustomForms.Remove(AForm);
  FForms.Remove(AForm);
  Application.UpdateVisible;
  if (FCustomForms.Count = 0) and (Application.FHintWindow <> nil) then
    Application.FHintWindow.ReleaseHandle;
end;

procedure TScreen.AddDataModule(DataModule: TDataModule);
begin
  FDataModules.Add(DataModule);
end;

procedure TScreen.RemoveDataModule(DataModule: TDataModule);
begin
  FDataModules.Remove(DataModule);
end;

{$IFDEF LINUX}
function LoadCursorResData(hInstance: HINST; const IconName: string): HICON;
var
  ResInfo: HRSRC;
  ResHandle: HGLOBAL;
  ResData, Data: PChar;
begin
  Result := 0;
  ResInfo := FindResource(hInstance, PChar(IconName), RT_RCDATA);
  if ResInfo <> 0 then
  begin
    ResHandle := LoadResource(hInstance, ResInfo);
    if ResHandle <> 0 then
    begin
      ResData := LockResource(ResHandle);
      Data := AllocMem(SizeOfResource(hInstance, ResInfo));
      try
        Inc(ResData, SizeOf(Graphics.TCursorOrIcon));
        PSmallPoint(Data).X := PIconRec(ResData).Reserved1;
        PSmallPoint(Data).Y := PIconRec(ResData).Reserved2;
        Inc(Data, SizeOf(TSmallPoint));
        Inc(ResData, SizeOf(TIconRec));
        Move(ResData^, Data^, SizeOfResource(hInstance, ResInfo) - SizeOf(TCursorOrIcon) - SizeOf(TIconRec));
        Dec(Data, SizeOf(TSmallPoint));
        Result := CreateIconFromResource(PByte(Data), SizeOfResource(hInstance, ResInfo) -
          SizeOf(TCursorOrIcon) - SizeOf(TIconRec) + SizeOf(TSmallPoint), False, $00030000);
      finally
        FreeMem(Data);
      end;
    end;
  end;
end;
{$ENDIF}

procedure TScreen.CreateCursors;
const
{$IF DEFINED(CLR)}
  CursorMap: array[crSizeAll..crArrow] of Integer = (
{$ELSE}
  CursorMap: array[crSizeAll..crArrow] of PChar = (
{$ENDIF}
    IDC_SIZEALL, IDC_HAND, IDC_HELP, IDC_APPSTARTING, IDC_NO, IDC_SQLWAIT,
    IDC_MULTIDRAG, IDC_VSPLIT, IDC_HSPLIT, IDC_NODROP, IDC_DRAG, IDC_WAIT,
    IDC_UPARROW, IDC_SIZEWE, IDC_SIZENWSE, IDC_SIZENS, IDC_SIZENESW, IDC_SIZEALL,
    IDC_IBEAM, IDC_CROSS, IDC_ARROW);
var
  I: Integer;
{$IFNDEF LINUX}
  Instance: THandle;
{$ENDIF}
begin
{$IF DEFINED(CLR)}
  FCursorList := TCursorInfo.Create;
  FCursorList.FDefaultCursor := LoadCursor(0, IDC_ARROW);
{$ELSE}
  FDefaultCursor := LoadCursor(0, IDC_ARROW);
{$ENDIF}
  for I := Low(CursorMap) to High(CursorMap) do
  begin
    if (I >= crSqlWait) and (I <= crDrag) then
{$IFDEF LINUX}
      InsertCursor(I, LoadCursorResData(HInstance, 'C' + IntToStr(Integer(CursorMap[I]))))
    else
      InsertCursor(I, LoadCursor(0, CursorMap[I]));
{$ENDIF}
{$IF DEFINED(CLR) OR DEFINED(MSWINDOWS)}
      Instance := THandle(HInstance) else
      Instance := 0;
    InsertCursor(I, LoadCursor(Instance, CursorMap[I]));
{$ENDIF}
  end;
end;

procedure TScreen.DestroyCursors;
var
  P, Next: TCursorRecType;
  Hdl: HCURSOR;
begin
{$IF DEFINED(CLR)}
  if FCursorList = nil then Exit;
  P := FCursorList.FList;
{$ELSE}
  P := FCursorList;
{$ENDIF}
  while P <> nil do
  begin
    if ((P.Index >= crSqlWait) and (P.Index <= crDrag)) or
      (P.Index = crHandPoint) or (P.Index > 0) then
      DestroyCursor(P.Handle);
    Next := P.Next;
{$IF NOT DEFINED(CLR)}
    Dispose(P);
{$ENDIF}
    P := Next;
  end;
{$IF DEFINED(CLR)}
  FCursorList.FList := nil;
  Hdl := LoadCursor(0, IDC_ARROW);
  if Hdl <> FCursorList.FDefaultCursor then
  begin
    DestroyCursor(FCursorList.FDefaultCursor);
    FCursorList.FDefaultCursor := Hdl;
  end;
  FCursorList := nil;
{$ELSE}
  Hdl := LoadCursor(0, IDC_ARROW);
  if Hdl <> FDefaultCursor then
    DestroyCursor(FDefaultCursor);
{$ENDIF}
end;

procedure TScreen.DeleteCursor(Index: Integer);
var
  P, Q: TCursorRecType;
begin
{$IF DEFINED(CLR)}
  if FCursorList = nil then Exit;
  P := FCursorList.FList;
{$ELSE}
  P := FCursorList;
{$ENDIF}
  Q := nil;
  while (P <> nil) and (P.Index <> Index) do
  begin
    Q := P;
    P := P.Next;
  end;
  if P <> nil then
  begin
    DestroyCursor(P.Handle);
    if Q = nil then
{$IF DEFINED(CLR)}
      FCursorList.FList := P.Next
{$ELSE}
      FCursorList := P.Next
{$ENDIF}
    else
      Q.Next := P.Next;
{$IF NOT DEFINED(CLR)}
    Dispose(P);
{$ENDIF}
  end;
end;

function TScreen.FindMonitor(Handle: HMONITOR): TMonitor;

  function DoFindMonitor: TMonitor;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to MonitorCount - 1 do
      if Monitors[I].Handle = Handle then
      begin
        Result := Monitors[I];
        Break;
      end;
  end;

begin
  Result := DoFindMonitor;
  if Result = nil then
  begin
    // If we didn't find the monitor, rebuild the list (it may have changeed)
    GetMonitors;
    Result := DoFindMonitor;
  end;
end;

procedure TScreen.InsertCursor(Index: Integer; Handle: HCURSOR);
var
  P: TCursorRecType;
begin
{$IF DEFINED(CLR)}
  if FCursorList = nil then
    FCursorList := TCursorInfo.Create;
  P := TCursorRec.Create;
  P.Next := FCursorList.FList;
  P.Index := Index;
  P.Handle := Handle;
  FCursorList.FList := P;
{$ELSE}
  New(P);
  P^.Next := FCursorList;
  P^.Index := Index;
  P^.Handle := Handle;
  FCursorList := P;
{$ENDIF}
end;

function TScreen.GetImes: TStrings;
const
  KbLayoutRegkeyFmt = 'System\CurrentControlSet\Control\Keyboard Layouts\%.8x';  // do not localize
  KbLayoutRegSubkey = 'layout text'; // do not localize
var
  TotalKbLayout, I, Bufsize: Integer;
  KbList: array[0..63] of HKL;
  qKey: HKey;
{$IF DEFINED(CLR)}
  ImeFileName: StringBuilder;
{$ELSE}
  ImeFileName: array [Byte] of Char;
  RegKey: array [0..63] of Char;
{$ENDIF}
begin
  if FImes = nil then
  begin
    FImes := TStringList.Create;
    FDefaultIme := '';
    TotalKbLayout := GetKeyboardLayoutList(64, KbList);

    for I := 0 to TotalKbLayout - 1 do
    begin
      if Imm32IsIME(KbList[I]) then
      begin
{$IF DEFINED(CLR)}
        if RegOpenKeyEx(HKEY_LOCAL_MACHINE,
//          Format(KbLayoutRegKeyFmt, [Int64(KbList[I])]), 0, KEY_READ,
        //fix by flying wang.
          Format(KbLayoutRegKeyFmt, [Int32(KbList[I])]), 0, KEY_READ,
          qKey) = ERROR_SUCCESS then
        try
          ImeFileName := StringBuilder.Create(256);
          Bufsize := ImeFileName.Capacity;
          if RegQueryValueEx(qKey, KbLayoutRegSubKey, nil, nil,
               ImeFileName, Bufsize) = ERROR_SUCCESS then
          begin
            FImes.AddObject(ImeFileName.ToString, TObject(KbList[I]));
            if KbList[I] = FDefaultKbLayout then
              FDefaultIme := ImeFileName.ToString;
{$ELSE}
        if RegOpenKeyEx(HKEY_LOCAL_MACHINE,
//          StrFmt(RegKey, KbLayoutRegKeyFmt, [KbList[I]]), 0, KEY_READ,
        //fix by flying wang.
          StrFmt(RegKey, KbLayoutRegKeyFmt, [Int32(KbList[I])]), 0, KEY_READ,
          qKey) = ERROR_SUCCESS then
        try
          Bufsize := sizeof(ImeFileName);
          if RegQueryValueEx(qKey, KbLayoutRegSubKey, nil, nil,
               @ImeFileName, @Bufsize) = ERROR_SUCCESS then
          begin
            FImes.AddObject(ImeFileName, TObject(KbList[I]));
            if KbList[I] = FDefaultKbLayout then
              FDefaultIme := ImeFileName;
{$ENDIF}
          end;
        finally
          RegCloseKey(qKey);
        end;
      end;
    end;
    TStringList(FImes).Duplicates := dupIgnore;
    TStringList(FImes).Sorted := TRUE;
  end;
  Result := FImes;
end;

function TScreen.GetDefaultIme: String;
begin
  GetImes;  // load Ime list, find default
  Result := FDefaultIme;
end;

procedure TScreen.IconFontChanged(Sender: TObject);
begin
  Application.NotifyForms(CM_SYSFONTCHANGED);
  if (Sender = FHintFont) and Assigned(Application) and Application.ShowHint then
  begin
    Application.ShowHint := False;
    Application.ShowHint := True;
  end;
end;

function TScreen.GetDataModule(Index: Integer): TDataModule;
begin
  Result := TDataModule(FDataModules[Index]);
end;

function TScreen.GetDataModuleCount: Integer;
begin
  Result := FDataModules.Count;
end;

function TScreen.GetCursors(Index: Integer): HCURSOR;
var
  P: TCursorRecType;
begin
  Result := 0;
{$IF DEFINED(CLR)}
  if FCursorList = nil then Exit;
  if Index <> crNone then
  begin
    P := FCursorList.FList;
    while (P <> nil) and (P.Index <> Index) do P := P.Next;
    if P = nil then Result := FCursorList.FDefaultCursor else Result := P.Handle;
  end;
{$ELSE}
  if Index <> crNone then
  begin
    P := FCursorList;
    while (P <> nil) and (P^.Index <> Index) do P := P^.Next;
    if P = nil then Result := FDefaultCursor else Result := P^.Handle;
  end;
{$ENDIF}
end;

procedure TScreen.SetCursor(Value: TCursor);
var
  P: TPoint;
  Handle: HWND;
  Code: Longint;
begin
  if Value <> Cursor then
  begin
    FCursor := Value;
    if Value = crDefault then
    begin
      { Reset the cursor to the default by sending a WM_SETCURSOR to the
        window under the cursor }
      GetCursorPos(P);
      Handle := WindowFromPoint(P);
      if (Handle <> 0) and
        (GetWindowThreadProcessId(Handle, nil) = GetCurrentThreadId) then
      begin
        Code := SendMessage(Handle, WM_NCHITTEST, 0, PointToLParam(P));
        SendMessage(Handle, WM_SETCURSOR, Handle, MakeLong(Code, WM_MOUSEMOVE));
        Exit;
      end;
    end;
    Winapi.Windows.SetCursor(Cursors[Value]);
  end;
  Inc(FCursorCount);
end;

procedure TScreen.SetCursors(Index: Integer; Handle: HCURSOR);
begin
{$IF DEFINED(CLR)}
  if FCursorList = nil then
    FCursorList := TCursorInfo.Create;
  if Index = crDefault then
    if Handle = 0 then
      FCursorList.FDefaultCursor := LoadCursor(0, IDC_ARROW)
    else
      FCursorList.FDefaultCursor := Handle
{$ELSE}
  if Index = crDefault then
    if Handle = 0 then
      FDefaultCursor := LoadCursor(0, IDC_ARROW)
    else
      FDefaultCursor := Handle
{$ENDIF}
  else if Index <> crNone then
  begin
    DeleteCursor(Index);
    if Handle <> 0 then InsertCursor(Index, Handle);
  end;
end;

procedure TScreen.SetHintFont(Value: TFont);
begin
  FHintFont.Assign(Value);
end;

procedure TScreen.SetIconFont(Value: TFont);
begin
  FIconFont.Assign(Value);
end;

procedure TScreen.SetMenuFont(Value: TFont);
begin
  FMenuFont.Assign(Value);
end;

procedure TScreen.SetMessageFont(Value: TFont);
begin
  FMessageFont.Assign(Value);
end;

procedure TScreen.SetCaptionFont(Value: TFont);
begin
  FCaptionFont.Assign(Value);
end;

{$IF DEFINED(CLR)}
function GetNonClientMetrics(var NCM: TNonClientMetrics): Boolean;
begin
  NCM.cbSize := Marshal.SizeOf(TypeOf(TNonClientMetrics));
  Result := SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, NCM, 0);
end;
{$ENDIF}

procedure TScreen.GetMetricSettings;
var
  LSize: Cardinal;
  LogFont: TLogFont;
  NonClientMetrics: TNonClientMetrics;
  SaveShowHint: Boolean;
begin
  SaveShowHint := False;
  if Assigned(Application) then SaveShowHint := Application.ShowHint;
  FUpdatingAllFonts := True;
  try
    if Assigned(Application) then Application.ShowHint := False;
{$IF DEFINED(CLR)}
    LSize := Marshal.SizeOf(TypeOf(TLogFont));
{$ELSE}
    LSize := SizeOf(TLogFont);
{$ENDIF}
    if SystemParametersInfo(SPI_GETICONTITLELOGFONT, LSize, {$IFNDEF CLR}@{$ENDIF}LogFont, 0) then
      FIconFont.Handle := CreateFontIndirect(LogFont)
    else
      FIconFont.Handle := GetStockObject(SYSTEM_FONT);
{$IF DEFINED(CLR)}
    LSize := Marshal.SizeOf(TypeOf(TNonClientMetrics));
{$ELSE}
    LSize := TNonClientMetrics.SizeOf;
{$ENDIF}
    NonClientMetrics.cbSize := LSize;
    if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, {$IFNDEF CLR}@{$ENDIF}NonClientMetrics, 0) then
    begin
      FHintFont.Handle := CreateFontIndirect(NonClientMetrics.lfStatusFont);
      FMenuFont.Handle := CreateFontIndirect(NonClientMetrics.lfMenuFont);
      FMessageFont.Handle := CreateFontIndirect(NonClientMetrics.lfMessageFont);
      FCaptionFont.Handle := CreateFontIndirect(NonClientMetrics.lfCaptionFont);
    end else
    begin
      FHintFont.Size := 8;
      FMenuFont.Handle := GetStockObject(SYSTEM_FONT);
      FMessageFont.Handle := GetStockObject(SYSTEM_FONT);
      FCaptionFont.Handle := GetStockObject(SYSTEM_FONT);
    end;
    FHintFont.Color := clInfoText;
    FMenuFont.Color := clMenuText;
    FMessageFont.Color := clWindowText;
  finally
    FUpdatingAllFonts := False;
    if Assigned(Screen) then
      Application.NotifyForms(CM_SYSFONTSALLCHANGED);
    if Assigned(Application) then Application.ShowHint := SaveShowHint;
  end;
end;

procedure TScreen.DisableAlign;
begin
  Inc(FAlignLevel);
end;

procedure TScreen.EnableAlign;
begin
  Dec(FAlignLevel);
  if (FAlignLevel = 0) and (csAlignmentNeeded in FControlState) then Realign;
end;

procedure TScreen.Realign;
begin
  AlignForm(nil);
end;

procedure TScreen.AlignForms(AForm: TCustomForm; var Rect: TRect);
var
  AlignList: TList;

  function InsertBefore(C1, C2: TCustomForm; AAlign: TAlign): Boolean;
  begin
    Result := False;
    case AAlign of
      alTop: Result := C1.Top < C2.Top;
      alBottom: Result := (C1.Top + C1.Height) > (C2.Top + C2.Height);
      alLeft: Result := C1.Left < C2.Left;
      alRight: Result := (C1.Left + C1.Width) > (C2.Left + C2.Width);
    end;
  end;

  procedure DoPosition(Form: TCustomForm; AAlign: TAlign);
  var
    NewLeft, NewTop, NewWidth, NewHeight: Integer;
  begin
    with Rect do
    begin
      NewWidth := Right - Left;
      if (NewWidth < 0) or (AAlign in [alLeft, alRight]) then
        NewWidth := Form.Width;
      NewHeight := Bottom - Top;
      if (NewHeight < 0) or (AAlign in [alTop, alBottom]) then
        NewHeight := Form.Height;
      if (AAlign = alTop) and (Form.WindowState = wsMaximized) then
      begin
        NewLeft := Form.Left;
        NewTop := Form.Top;
        NewWidth := GetSystemMetrics(SM_CXMAXIMIZED);
      end
      else
      begin
        NewLeft := Left;
        NewTop := Top;
      end;
      case AAlign of
        alTop: Inc(Top, NewHeight);
        alBottom:
          begin
            Dec(Bottom, NewHeight);
            NewTop := Bottom;
          end;
        alLeft: Inc(Left, NewWidth);
        alRight:
          begin
            Dec(Right, NewWidth);
            NewLeft := Right;
          end;
      end;
    end;
    Form.SetBounds(NewLeft, NewTop, NewWidth, NewHeight);
    if Form.WindowState = wsMaximized then
    begin
      Dec(NewWidth, NewLeft);
      Dec(NewHeight, NewTop);
    end;
    { Adjust client rect if Form didn't resize as we expected }
    if (Form.Width <> NewWidth) or (Form.Height <> NewHeight) then
      with Rect do
        case AAlign of
          alTop: Dec(Top, NewHeight - Form.Height);
          alBottom: Inc(Bottom, NewHeight - Form.Height);
          alLeft: Dec(Left, NewWidth - Form.Width);
          alRight: Inc(Right, NewWidth - Form.Width);
          alClient:
            begin
              Inc(Right, NewWidth - Form.Width);
              Inc(Bottom, NewHeight - Form.Height);
            end;
        end;
  end;

  procedure DoAlign(AAlign: TAlign);
  var
    I, J: Integer;
    Form: TCustomForm;
  begin
    AlignList.Clear;
    if (AForm <> nil) and (AForm.Parent = nil) and
      not (csDesigning in AForm.ComponentState) and
      AForm.Visible and (AForm.Align = AAlign) and
      (AForm.WindowState <> wsMinimized) then
      AlignList.Add(AForm);
    for I := 0 to CustomFormCount - 1 do
    begin
      Form := TCustomForm(CustomForms[I]);
      if (Form.Parent = nil) and (Form.Align = AAlign) and
        not (csDesigning in Form.ComponentState) and
        Form.Visible and (Form.WindowState <> wsMinimized) then
      begin
        if Form = AForm then Continue;
        J := 0;
        while (J < AlignList.Count) and not InsertBefore(Form,
          TCustomForm(AlignList[J]), AAlign) do Inc(J);
        AlignList.Insert(J, Form);
      end;
    end;
    for I := 0 to AlignList.Count - 1 do
      DoPosition(TCustomForm(AlignList[I]), AAlign);
  end;

  function AlignWork: Boolean;
  var
    I: Integer;
  begin
    Result := True;
    for I := CustomFormCount - 1 downto 0 do
      with TCustomForm(CustomForms[I]) do
        if (Parent = nil) and not (csDesigning in ComponentState) and
          (Align <> alNone) and Visible and (WindowState <> wsMinimized) then Exit;
    Result := False;
  end;

begin
  if AlignWork then
  begin
    AlignList := TList.Create;
    try
      DoAlign(alTop);
      DoAlign(alBottom);
      DoAlign(alLeft);
      DoAlign(alRight);
      DoAlign(alClient);
    finally
      AlignList.Free;
    end;
  end;
end;

procedure TScreen.AlignForm(AForm: TCustomForm);
var
  Rect: TRect;
begin
  if FAlignLevel <> 0 then
    Include(FControlState, csAlignmentNeeded)
  else
  begin
    DisableAlign;
    try
      SystemParametersInfo(SPI_GETWORKAREA, 0, Rect, 0);
      AlignForms(AForm, Rect);
    finally
      Exclude(FControlState, csAlignmentNeeded);
      EnableAlign;
    end;
  end;
end;

function TScreen.GetFonts: TStrings;
var
  DC: HDC;
  LFont: TLogFont;
begin
  if FFonts = nil then
  begin
    FFonts := TStringList.Create;
    DC := GetDC(0);
    try
      FFonts.Add('Default');
{$IF DEFINED(CLR)}
      LFont.lfCharset := DEFAULT_CHARSET;
      EnumFontFamiliesEx(DC, LFont, TFontEnumerator.Create(FFonts).FEnumProc, 0, 0);
{$ELSE}
      FillChar(LFont, sizeof(LFont), 0);
      LFont.lfCharset := DEFAULT_CHARSET;
      EnumFontFamiliesEx(DC, LFont, @EnumFontsProc, Winapi.Windows.LPARAM(FFonts), 0);
{$ENDIF}
      TStringList(FFonts).Sorted := TRUE;
    finally
      ReleaseDC(0, DC);
    end;
  end;
  Result := FFonts;
end;

procedure TScreen.ResetFonts;
begin
  FreeAndNil(FFonts);
end;

{ Hint functions }

function GetHint(Control: TControl): string;
begin
  while Control <> nil do
    if Control.Hint = '' then
      Control := Control.Parent
    else
    begin
      Result := Control.Hint;
      Exit;
    end;
  Result := '';
end;

function GetHintControl(Control: TControl): TControl;
begin
  Result := Control;
  while (Result <> nil) and not Result.ShowHint do Result := Result.Parent;
  if (Result <> nil) and (csDesigning in Result.ComponentState) then Result := nil;
end;

{$IF DEFINED(CLR)}
procedure HintTimerProc(Wnd: HWnd; Msg: UINT; TimerID: UINT_PTR; SysTime: DWORD);
{$ELSE}
procedure HintTimerProc(Wnd: HWnd; Msg: UINT; TimerID: UINT_PTR; SysTime: DWORD); stdcall;
{$ENDIF}
begin
  if Application <> nil then
  try
    Application.HintTimerExpired;
  except
    Application.HandleException(Application);
  end;
end;

{ DLL specific hint routines - Only executed in the context of a DLL to
  simulate hooks the .EXE has in the message loop }
{$IF DEFINED(CLR)}
type
  THintDoneEvent = class(TObject)
  private
    FHandle: THandle;
  strict protected
    procedure Finalize; override;
  public
    constructor Create;
    property Handle: THandle read FHandle;
  end;

constructor THintDoneEvent.Create;
begin
  inherited;
  FHandle := CreateEvent(nil, False, False, '');
end;

procedure THintDoneEvent.Finalize;
begin
  CloseHandle(FHandle);
end;
{$ENDIF}

var
  HintThreadID: DWORD;
{$IF DEFINED(CLR)}
  HintDoneEvent: THintDoneEvent;
{$ELSE}
  HintDoneEvent: THandle;
{$ENDIF}

{$IF DEFINED(CLR)}
function HintMouseThread(Param: IntPtr): DWORD;
var
  P: TPoint;
begin
  HintThreadID := GetCurrentThreadID;
  while WaitForSingleObject(HintDoneEvent.Handle, 100) = WAIT_TIMEOUT do
  begin
    if (Application <> nil) and (Application.FHintControl <> nil) then
    begin
      GetCursorPos(P);
      if FindVCLWindow(P) = nil then
        Application.CancelHint;
    end;
  end;
  Result := 0;
end;
{$ELSE}
procedure HintMouseThread(Param: Integer); stdcall;
var
  P: TPoint;
begin
  HintThreadID := GetCurrentThreadID;
  while WaitForSingleObject(HintDoneEvent, 100) = WAIT_TIMEOUT do
  begin
    if (Application <> nil) and (Application.FHintControl <> nil) then
    begin
      GetCursorPos(P);
      if FindVCLWindow(P) = nil then
        Application.CancelHint;
    end;
  end;
end;
{$ENDIF}

var
  HintHook: HHOOK;
  HintThread: THandle;

{$IF DEFINED(CLR)}
function HintGetMsgHook(nCode: Integer; wParam: WParam; LParam: LPARAM): LRESULT;
var
  Msg: TMsg;
begin
  Result := CallNextHookEx(HintHook, nCode, wParam, lParam);
  if (nCode >= 0) and (Application <> nil) then
  begin
    Msg := TMsg(Marshal.PtrToStructure(LParam, TypeOf(TMsg)));
    Application.IsHintMsg(Msg);
  end;
end;
{$ELSE}
function HintGetMsgHook(nCode: Integer; wParam: WParam; LParam: LPARAM): LRESULT; stdcall;
begin
  Result := CallNextHookEx(HintHook, nCode, WParam, LParam);
  if (nCode >= 0) and (Application <> nil) then
    Application.IsHintMsg(PMsg(LParam)^);
end;
{$ENDIF}

// save references to the delegates to protect from garbage collector
const
  HintTimerDelegate: TFNTimerProc = @HintTimerProc;
  HintThreadDelegate: TFNThreadStartRoutine = @HintMouseThread;
  HintHookDelegate: TFNHookProc = HintGetMsgHook;

procedure HookHintHooks;
var
  ThreadID: DWORD;
begin
  if not Application.FRunning then
  begin
    if HintHook = 0 then
      HintHook := SetWindowsHookEx(WH_GETMESSAGE, HintHookDelegate, 0, GetCurrentThreadID);
{$IF DEFINED(CLR)}
    if HintDoneEvent = nil then
      HintDoneEvent := THintDoneEvent.Create;
{$ELSE}
    if HintDoneEvent = 0 then
      HintDoneEvent := CreateEvent(nil, False, False, nil);
{$ENDIF}
    if HintThread = 0 then
      HintThread := CreateThread(nil, 1000, HintThreadDelegate, nil, 0, ThreadID);
  end;
end;

procedure UnhookHintHooks;
{$IF DEFINED(CLR)}
begin
  if HintHook <> 0 then UnhookWindowsHookEx(HintHook);
  HintHook := 0;
  if HintThread <> 0 then
  begin
    SetEvent(HintDoneEvent.Handle);
    if GetCurrentThreadId <> HintThreadID then
      WaitForSingleObject(HintThread, INFINITE);
    CloseHandle(HintThread);
  end;
end;
{$ELSE}
var
  LHintThread: THandle;
begin
  if HintHook <> 0 then UnhookWindowsHookEx(HintHook);
  HintHook := 0;
  LHintThread := THandle(InterlockedExchangePointer(Pointer(HintThread), nil));
  if LHintThread <> 0 then
  begin
    SetEvent(HintDoneEvent);
    if GetCurrentThreadId <> HintThreadID then
      while MsgWaitForMultipleObjects(1, LHintThread, False, INFINITE, QS_ALLINPUT) <> WAIT_OBJECT_0 do
        Application.HandleMessage;
    CloseHandle(LHintThread);
  end;
end;
{$ENDIF}

function GetAnimation: Boolean;
var
  Info: TAnimationInfo;
begin
{$IF DEFINED(CLR)}
  Info.cbSize := Marshal.SizeOf(TypeOf(TAnimationInfo));
{$ELSE}
  Info.cbSize := SizeOf(TAnimationInfo);
{$ENDIF}
  if SystemParametersInfo(SPI_GETANIMATION, Info.cbSize, {$IFNDEF CLR}@{$ENDIF}Info, 0) then
    Result := Info.iMinAnimate <> 0 else
    Result := False;
end;

procedure SetAnimation(Value: Boolean);
var
  Info: TAnimationInfo;
begin
{$IF DEFINED(CLR)}
  Info.cbSize := Marshal.SizeOf(TypeOf(TAnimationInfo));
{$ELSE}
  Info.cbSize := SizeOf(TAnimationInfo);
{$ENDIF}
  Info.iMinAnimate := Integer(BOOL(Value));
  SystemParametersInfo(SPI_SETANIMATION, Info.cbSize, {$IFNDEF CLR}@{$ENDIF}Info, 0);
end;

procedure ShowWinNoAnimate(Handle: HWnd; CmdShow: Integer);
var
  Animation: Boolean;
begin
  Animation := GetAnimation;
  if Animation then SetAnimation(False);
  ShowWindow(Handle, CmdShow);
  if Animation then SetAnimation(True);
end;

function TScreen.GetDesktopRect: TRect;
begin
  Result := Bounds(DesktopLeft, DesktopTop, DesktopWidth, DesktopHeight);
end;

function TScreen.GetWorkAreaHeight: Integer;
begin
  with WorkAreaRect do
    Result := Bottom - Top;
end;

function TScreen.GetWorkAreaLeft: Integer;
begin
  Result := WorkAreaRect.Left;
end;

function TScreen.GetWorkAreaRect: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, Result, 0);
end;

function TScreen.GetWorkAreaTop: Integer;
begin
  Result := WorkAreaRect.Top;
end;

function TScreen.GetWorkAreaWidth: Integer;
begin
  with WorkAreaRect do
    Result := Right - Left;
end;

const
  MonitorDefaultFlags: array[TMonitorDefaultTo] of DWORD = (MONITOR_DEFAULTTONEAREST,
    MONITOR_DEFAULTTONULL, MONITOR_DEFAULTTOPRIMARY);

function TScreen.MonitorFromPoint(const Point: TPoint;
  MonitorDefault: TMonitorDefaultTo): TMonitor;
begin
  Result := FindMonitor(Winapi.MultiMon.MonitorFromPoint(Point,
    MonitorDefaultFlags[MonitorDefault]));
end;

function TScreen.MonitorFromRect(const Rect: TRect;
  MonitorDefault: TMonitorDefaultTo): TMonitor;
begin
  Result := FindMonitor(Winapi.MultiMon.MonitorFromRect({$IFNDEF CLR}@{$ENDIF}Rect,
    MonitorDefaultFlags[MonitorDefault]));
end;

function TScreen.MonitorFromWindow(const Handle: THandle;
  MonitorDefault: TMonitorDefaultTo): TMonitor;
begin
  Result := FindMonitor(Winapi.MultiMon.MonitorFromWindow(Handle,
    MonitorDefaultFlags[MonitorDefault]));
end;

procedure TScreen.ClearMonitors;
var
  I: Integer;
begin
  for I := 0 to FMonitors.Count - 1 do
    TMonitor(FMonitors[I]).Free;
  Screen.FMonitors.Clear;
end;

procedure TScreen.GetMonitors;
begin
  ClearMonitors;
{$IF DEFINED(CLR)}
                                         
  EnumDisplayMonitors(0, nil, TMonitorEnumerator.Create(Screen.FMonitors).FEnumProc, 0);
{$ELSE}
  EnumDisplayMonitors(0, nil, @EnumMonitorsProc, Winapi.Windows.LPARAM(Screen.FMonitors));
{$ENDIF}
end;

function TScreen.GetPrimaryMonitor: TMonitor;

  function DoGetPrimaryMonitor: TMonitor;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to MonitorCount - 1 do
      if Monitors[I].Primary then
      begin
        Result := Monitors[I];
        Break;
      end;
  end;

begin
  Result := DoGetPrimaryMonitor;
  if Result = nil then
  begin
    { If we didn't find the primary monitor, reset the display and try
      again (it may have changeed) }
    GetMonitors;
    Result := DoGetPrimaryMonitor;
  end;
end;

{ TApplicationResources }

{$IF DEFINED(CLR)}
procedure TApplicationResources.Finalize;
begin
  FreeHandles;
  inherited;
end;

procedure TApplicationResources.FreeHandles;
begin
  if GetCapture <> 0 then  {Just in case the global Mouse free hasnt done this}
    ReleaseCapture;
  if FHandle <> 0 then
  begin
    DestroyWindow(FHandle);
    FHandle := 0;
  end;
  if FPopupControlWnd <> 0 then
  begin
    DeallocateHWnd(FPopupControlWnd);
    FPopupControlWnd := 0;
  end;
  if Assigned(FObjectInstance) then
  begin
    FreeObjectInstance(@FObjectInstance);
    FObjectInstance := nil;
  end;
end;

destructor TApplicationResources.Destroy;
begin
  FreeHandles;
  System.GC.SuppressFinalize(Self);
  inherited Destroy;
end;
{$ENDIF}

{ TApplication }

{$IF NOT DEFINED(CLR)}
var
  WindowClass: TWndClass = (
    style: 0;
    lpfnWndProc: @DefWindowProc;
    cbClsExtra: 0;
    cbWndExtra: 0;
    hInstance: 0;
    hIcon: 0;
    hCursor: 0;
    hbrBackground: 0;
    lpszMenuName: nil;
    lpszClassName: 'TApplication');
{$ENDIF}

procedure TApplication.TBiDiKeyboard.SetBiDiKeyboard(const Value: string);
begin
  if Value = '' then
    BiDiKeyboardHKL := 0
  else
  if not SameText(Value, BiDiKeyboard)  then
    BiDiKeyboardHKL := LoadKeyBoardLayout(Value, 0);

  BiDiKeyboard := Value;
end;

procedure TApplication.TBiDiKeyboard.SetNonBiDiKeyboard(const Value: string);
begin
  if Value = '' then
    NonBiDiKeyboardHKL := 0
  else
  if not SameText(Value, NonBiDiKeyboard) then
    NonBiDiKeyboardHKL := LoadKeyBoardLayout(Value, 0);

  NonBiDiKeyboard := Value;
end;

function TApplication.TBiDiKeyboard.GetBiDiKeyboard: string;
begin
  Result := BiDiKeyboard;
end;

function TApplication.TBiDiKeyboard.GetNonBiDiKeyboard: string;
begin
  Result := NonBiDiKeyboard;
end;

procedure TApplication.TBiDiKeyboard.ApplyBiDiKeyboardLayout;
begin
  if BiDiKeyboardHKL <> 0 then
    ActivateKeyBoardLayout(BiDiKeyboardHKL, 0);
end;

procedure TApplication.TBiDiKeyboard.ApplyNonBiDiKeyboardLayout;
begin
  if NonBiDiKeyboardHKL <> 0 then
    ActivateKeyBoardLayout(NonBiDiKeyboardHKL, 0);
end;

constructor TApplication.Create(AOwner: TComponent);
var
{$IF DEFINED(CLR)}
  SB: System.Text.StringBuilder;
  P: Integer;
  C: Char;
{$ELSE}
  P: PChar;
  ModuleName: array[0..255] of Char;
{$ENDIF}
begin
  inherited Create(AOwner);
  if not IsLibrary then
    FNeedToUninitialize := Succeeded(OleInitialize(nil));
  if not Assigned(System.Classes.ApplicationHandleException) then
    System.Classes.ApplicationHandleException := HandleException;
  if not Assigned(System.Classes.ApplicationShowException) then
    System.Classes.ApplicationShowException := ShowException;
  FBiDiMode := bdLeftToRight;
  FDefaultFont := TFont.Create;
  FDefaultFont.OnChange := DefaultFontChanged;
  FTopMostList := TList.Create;
  FWindowHooks := TList.Create;
  FHintControl := nil;
  FHintWindow := nil;
  FHintColor := DefHintColor;
  FHintPause := DefHintPause;
  FHintShortCuts := True;
  FHintShortPause := DefHintShortPause;
  FHintHidePause := DefHintHidePause;
  FShowHint := False;
  FActive := True;
  FAutoDragDocking := True;
  FIcon := TIcon.Create;
{$IF DEFINED(CLR) or Defined(MSWINDOWS)}
  FIcon.Handle := LoadIcon(MainInstance, 'MAINICON');
{$ENDIF}
  Icon.OnChange := IconChanged;
{$IF DEFINED(CLR)}
  FResources := TApplicationResources.Create;
  SB := System.Text.StringBuilder.Create(256);
  GetModuleFileName(MainInstance, SB, SB.Capacity);
  FTitle := ExtractFileName(SB.ToString);
  P := Pos('.', FTitle);
  if P >= 1 then
    SetLength(FTitle, P - 1);
  if Length(FTitle) > 1 then
  begin
    C := FTitle[1];
    FTitle := LowerCase(FTitle);
    FTitle[1] := C;
  end;
  FResources.FPopupControlWnd := AllocateHWnd(PopupControlProc);
{$ELSE}
  FPopupOwners := TList.Create;
  GetModuleFileName(MainInstance, ModuleName, Length(ModuleName));
  P := AnsiStrRScan(ModuleName, '\');
  if P <> nil then
    StrCopy(ModuleName, P + 1);
  P := AnsiStrScan(ModuleName, '.');
  if P <> nil then
    P^ := #0;
  CharLower(CharNext(ModuleName));
  FTitle := ModuleName;
  FPopupControlWnd := AllocateHWnd(PopupControlProc);
{$ENDIF}
  FModalPopupMode := pmNone;
  if not IsLibrary then CreateHandle;
  UpdateFormatSettings := True;
  UpdateMetricSettings := True;
  FShowMainForm := True;
  FAllowTesting := True;
  FCreatingMainForm := False;
  FInitialMainFormState := wsNormal;
  FLastActivePopup := 0;
  FMainFormOnTaskBar := False;
  FTestLib := 0;
  ValidateHelpSystem;
  HookSynchronizeWakeup;
  FDisabledStateBeforeMinimize := False;
end;

destructor TApplication.Destroy;
{$IF DEFINED(CLR)}
begin
  UnhookSynchronizeWakeup;
  if Assigned(Classes.ApplicationHandleException) and
   DelegatesEqual(@Classes.ApplicationHandleException,
    @HandleException) then
    Classes.ApplicationHandleException := nil;
  if Assigned(Classes.ApplicationShowException) and
   DelegatesEqual(@Classes.ApplicationShowException,
    @ShowException) then
    Classes.ApplicationShowException := nil;
  FActive := False;
  FreeAndNil(FPopupOwners);
  inherited Destroy;
  FResources.Free;
  if FHelpSystem <> nil then FHelpSystem := nil;
  FreeAndNil(FWindowHooks);
  FreeAndNil(FTopMostList);
  FreeAndNil(FDefaultFont);
  if FNeedToUninitialize then OleUninitialize;
{$ELSE}
type
  TExceptionEvent = procedure (E: Exception) of object;
var
  P: TNotifyEvent;
  E: TExceptionEvent;
begin
  UnhookSynchronizeWakeup;
  P := HandleException;
  if @P = @System.Classes.ApplicationHandleException then
    System.Classes.ApplicationHandleException := nil;
  E := ShowException;
  if @E = @System.Classes.ApplicationShowException then
    System.Classes.ApplicationShowException := nil;
  if FTestLib <> 0 then
    FreeLibrary(FTestLib);
  FActive := False;
  CancelHint;
  ShowHint := False;
  inherited Destroy;
  if FPopupControlWnd <> 0 then
    DeallocateHWnd(FPopupControlWnd);
  UnhookMainWindow(CheckIniChange);
  if (FHandle <> 0) and FHandleCreated then
  begin
    if NewStyleControls then
      SendMessage(FHandle, WM_SETICON, ICON_BIG, 0);
    if TOSVersion.Check(5, 1) then
      WTSUnRegisterSessionNotification(FHandle);
    if TOSVersion.Check(6, 0) then
      BufferedPaintUnInit;
    DestroyWindow(FHandle);
  end;
  if FHelpSystem <> nil then FHelpSystem := nil;
  if FObjectInstance <> nil then FreeObjectInstance(FObjectInstance);
  FWindowHooks.Free;
  FTopMostList.Free;
  FPopupOwners.Free;
  FIcon.Free;
  FreeAndNil(FDefaultFont);
  if FNeedToUninitialize then OleUninitialize;
{$ENDIF}
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TApplication.CreateHandle;
var
  LHandle: HWND;
  SysMenu: HMenu;
{$IF DEFINED(CLR)}
  TempClass: TWndClassInfo;
  WindowClass: TWndClass;
{$ELSE}
  TempClass: TWndClass;
{$ENDIF}
begin
{$IF DEFINED(CLR)}
  if not FHandleCreated and not IsConsole then
  begin
    if not Assigned(FResources) then
      FResources := TApplicationResources.Create;
    FResources.FObjectInstance := MakeObjectInstance(WndProc);
    WindowClass.lpszMenuName := '';
    WindowClass.lpszClassName := 'TApplication';
{$ELSE}
{$IFDEF MSWINDOWS}
  if not FHandleCreated and not IsConsole then
{$ENDIF}
{$IFDEF LINUX}
  if not FHandleCreated then
{$ENDIF}
  begin
    FObjectInstance := MakeObjectInstance(WndProc);
{$ENDIF}
    WindowClass.lpfnWndProc := @DefWindowProc;
    if not GetClassInfo(HInstance, WindowClass.lpszClassName, TempClass) then
    begin
      WindowClass.hInstance := HInstance;
      if Winapi.Windows.RegisterClass(WindowClass) = 0 then
        raise EOutOfResources.Create(SWindowClass);
    end;
    LHandle := CreateWindowEx(WS_EX_TOOLWINDOW, WindowClass.lpszClassName, {$IFNDEF CLR}PChar{$ENDIF}(FTitle),
      WS_POPUP or WS_CAPTION or WS_CLIPSIBLINGS or WS_SYSMENU
      or WS_MINIMIZEBOX,
      GetSystemMetrics(SM_CXSCREEN) div 2,
      GetSystemMetrics(SM_CYSCREEN) div 2,
      0, 0, 0, 0, HInstance, nil);
{$IF DEFINED(CLR)}
    FResources.FHandle := LHandle;
{$ELSE}
    FHandle := LHandle;
{$ENDIF}
    FHandleCreated := True;
    if TOSVersion.Check(5, 1) then
      WTSRegisterSessionNotification(LHandle, NOTIFY_FOR_THIS_SESSION);
    if TOSVersion.Check(6, 0) then
      BufferedPaintInit;
{$IF DEFINED(CLR)}
    SetWindowLong(Handle, GWL_WNDPROC, @FResources.FObjectInstance);
{$ELSE}
    SetWindowLong(FHandle, GWL_WNDPROC, LPARAM(FObjectInstance));
{$ENDIF}
    if NewStyleControls then
    begin
      SendMessage(Handle, WM_SETICON, ICON_BIG, LPARAM(GetIconHandle));
      SetClassLong(Handle, GCL_HICON, LPARAM(GetIconHandle));
    end;
    SysMenu := GetSystemMenu(Handle, False);
    DeleteMenu(SysMenu, SC_MAXIMIZE, MF_BYCOMMAND);
    DeleteMenu(SysMenu, SC_SIZE, MF_BYCOMMAND);
    if NewStyleControls then DeleteMenu(SysMenu, SC_MOVE, MF_BYCOMMAND);
  end;
end;

{$IF DEFINED(CLR)}
function TApplication.GetHandle: HWND;
begin
  if Assigned(FResources) then
    Result := FResources.FHandle
  else
    Result := 0;
end;

function TApplication.GetPopupControlWnd: HWND;
begin
  if Assigned(FResources) then
    Result := FResources.FPopupControlWnd
  else
    Result := 0;
end;
{$ENDIF}

procedure TApplication.ControlDestroyed(Control: TControl);
begin
  if FMainForm = Control then FMainForm := nil;
  if FMouseControl = Control then FMouseControl := nil;
  if Screen.FActiveControl = Control then Screen.FActiveControl := nil;
  if Screen.FActiveCustomForm = Control then
  begin
    Screen.FActiveCustomForm := nil;
    Screen.FActiveForm := nil;
  end;
  if Screen.FFocusedForm = Control then Screen.FFocusedForm := nil;
  if FHintControl = Control then FHintControl := nil;
  Screen.UpdateLastActive;
end;

type
{$IF DEFINED(CLR)}
  TTopMostEnumInfo = class
    TopWindow: HWND;
    IncludeMain: Boolean;
    function GetTopMostWindows(Handle: HWND; Info: LParam): BOOL;
  end;
{$ELSE}
  PTopMostEnumInfo = ^TTopMostEnumInfo;
  TTopMostEnumInfo = record
    TopWindow: HWND;
    IncludeMain: Boolean;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
function TTopMostEnumInfo.GetTopMostWindows(Handle: HWND; Info: LParam): BOOL;
var
  LAppHandle: HWND;
begin
  Result := True;
  if Application.MainFormOnTaskBar and (Application.MainForm <> nil) then
    LAppHandle := Application.MainForm.Handle
  else
    LAppHandle := Application.Handle;

  if Assigned(Application) and (GetWindow(Handle, GW_OWNER) = LAppHandle) then
    if (GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_TOPMOST <> 0) and
       ((Application.MainForm = nil) or IncludeMain or
       (not (csDestroying in Application.MainForm.ComponentState) and (Handle <> Application.MainForm.Handle))) then
      Application.FTopMostList.Add(TObject(Handle))
    else
    begin
      TopWindow := Handle;
      Result := False;
    end;
end;
{$ELSE}
function GetTopMostWindows(Handle: HWND; Info: Pointer): BOOL; stdcall;
var
  LAppHandle: HWND;
begin
  Result := True;
  if Application.MainFormOnTaskBar and (Application.MainForm <> nil) then
    LAppHandle := Application.MainForm.Handle
  else
    LAppHandle := Application.Handle;

  if Assigned(Application) and (GetWindow(Handle, GW_OWNER) = LAppHandle) then
    if (GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_TOPMOST <> 0) and
       ((Application.MainForm = nil) or PTopMostEnumInfo(Info)^.IncludeMain or
       (not (csDestroying in Application.MainForm.ComponentState) and (Handle <> Application.MainForm.Handle))) then
      Application.FTopMostList.Add(Pointer(Handle))
    else
    begin
      PTopMostEnumInfo(Info)^.TopWindow := Handle;
      Result := False;
    end;
end;
{$ENDIF}

procedure TApplication.DoNormalizeTopMosts(IncludeMain: Boolean);
var
  I: Integer;
  Info: TTopMostEnumInfo;
{$IF DEFINED(CLR)}
  EnumProc: TFNWndEnumProc; // keep a reference to the delegate
{$ENDIF}
begin
  if Handle <> 0 then
  begin
    if FTopMostLevel = 0 then
    begin
{$IF DEFINED(CLR)}
      Info := TTopMostEnumInfo.Create;
      Info.TopWindow := Handle;
      Info.IncludeMain := IncludeMain;
      EnumProc := Info.GetTopMostWindows;
      Winapi.Windows.EnumWindows(EnumProc, 0);
{$ELSE}
      Info.TopWindow := Handle;
      Info.IncludeMain := IncludeMain;
      EnumWindows(@GetTopMostWindows, Winapi.Windows.LPARAM(@Info));
{$ENDIF}
      if FTopMostList.Count <> 0 then
      begin
        Info.TopWindow := GetWindow(Info.TopWindow, GW_HWNDPREV);
        if GetWindowLong(Info.TopWindow, GWL_EXSTYLE) and WS_EX_TOPMOST <> 0 then
          Info.TopWindow := HWND_NOTOPMOST;
        for I := FTopMostList.Count - 1 downto 0 do
          SetWindowPos(HWND(FTopMostList[I]), Info.TopWindow, 0, 0, 0, 0,
            SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOOWNERZORDER);
      end;
    end;
    Inc(FTopMostLevel);
  end;
end;

procedure TApplication.ModalStarted;
begin
  Inc(FModalLevel);
  if (FModalLevel = 1) and Assigned(FOnModalBegin) then
    FOnModalBegin(Self);
end;

procedure TApplication.ModalFinished;
begin
  Dec(FModalLevel);
  if (FModalLevel = 0) and Assigned(FOnModalEnd) then
    FOnModalEnd(Self);
end;

procedure TApplication.NormalizeTopMosts;
begin
  DoNormalizeTopMosts(False);
end;

procedure TApplication.NormalizeAllTopMosts;
begin
  DoNormalizeTopMosts(True);
end;

procedure TApplication.RemovePopupForm(APopupForm: TCustomForm);
var
  I: Integer;
begin
  for I := Low(FPopupForms) to High(FPopupForms) do
    if FPopupForms[I].Form = APopupForm then
    begin
      FPopupForms[I].Form := nil;
      FPopupForms[I].FormID := -1;
      Exit;
    end;
end;

procedure TApplication.RestoreTopMosts;
var
  I: Integer;
begin
  if (Handle <> 0) and (FTopMostLevel > 0) then
  begin
    Dec(FTopMostLevel);
    if FTopMostLevel = 0 then
    begin
      for I := FTopMostList.Count - 1 downto 0 do
        SetWindowPos(HWND(FTopMostList[I]), HWND_TOPMOST, 0, 0, 0, 0,
          SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOOWNERZORDER);
      FTopMostList.Clear;
    end;
  end;
end;

procedure TApplication.RestoreWindowStateBeforeMinimize(AHandle: HWND; ADisablingWindows: Boolean);
begin
  if FDisabledStateBeforeMinimize and IsWindowEnabled(AHandle) then
  begin
    if ADisablingWindows then
      DisablingWindows := True;
    try
      EnableWindow(AHandle, False);
    finally
      if ADisablingWindows then
        DisablingWindows := False;
    end;
    FDisabledStateBeforeMinimize := False;
  end;
end;

{$IF DEFINED(CLR)}
type
  TPopupOwnerEnumInfo = class
    function GetPopupOwnerWindows(Handle: HWND; Info: LParam): BOOL;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
function TPopupOwnerEnumInfo.GetPopupOwnerWindows(Handle: HWND; Info: LParam): BOOL;
{$ELSE}
function GetPopupOwnerWindows(Handle: HWND; Info: Pointer): BOOL; stdcall;
{$ENDIF}
var
  LOwner: HWND;
  Pid: DWORD;
begin
  Result := True;
  LOwner := GetWindow(Handle, GW_OWNER);
  if (LOwner <> 0) and (LOwner <> Application.Handle) then
    GetWindowThreadProcessId(LOwner, Pid)
  else
    Pid := 0;
{$IF DEFINED(CLR)}
  if (Pid = GetCurrentProcessId) and (Application.FPopupOwners.IndexOf(TObject(LOwner)) < 0) then
    Application.FPopupOwners.Add(TObject(LOwner));
{$ELSE}
  if (Pid = GetCurrentProcessId) and (Application.FPopupOwners.IndexOf(Pointer(LOwner)) < 0) then
    Application.FPopupOwners.Add(Pointer(LOwner));
{$ENDIF}

  if (LOwner <> 0) and (Handle <> Application.Handle) and (LOwner = Application.Handle) and
     (Handle <> HWND(Info)) and IsWindowVisible(Handle) then
  begin
    SetLength(Application.FOwnedAppWnds, Length(Application.FOwnedAppWnds) + 1);
    Application.FOwnedAppWnds[Length(Application.FOwnedAppWnds) - 1] := Handle;
  end;
end;

procedure TApplication.DoShowOwnedPopups(Show: Boolean);
var
  I: Integer;
{$IF DEFINED(CLR)}
  Info: TPopupOwnerEnumInfo;
  EnumProc: TFNWndEnumProc; // keep a reference to the delegate
{$ENDIF}
begin
  if Application.Handle <> 0 then
  begin
{$IF DEFINED(CLR)}
    if not Assigned(FPopupOwners) then
      FPopupOwners := TList.Create;
{$ENDIF}
    if not Show then
    begin
      if FPopupLevel = 0 then
      begin
{$IF DEFINED(CLR)}
        Info := TPopupOwnerEnumInfo.Create;
        EnumProc := Info.GetPopupOwnerWindows;
        Winapi.Windows.EnumWindows(EnumProc, MainFormHandle);
{$ELSE}
        EnumWindows(@GetPopupOwnerWindows, MainFormHandle);
{$ENDIF}
        if (MainForm <> nil) and Application.MainFormOnTaskBar then
          for I := High(FOwnedAppWnds) downto Low(FOwnedAppWnds) do
            ShowWindow(FOwnedAppWnds[I], SW_HIDE);
        for I := FPopupOwners.Count - 1 downto 0 do
          ShowOwnedPopups(HWND(FPopupOwners[I]), Show);
      end;
      Inc(FPopupLevel);
    end else if FPopupLevel > 0 then
    begin
      Dec(FPopupLevel);
      if FPopupLevel = 0 then
      begin
        if (MainForm <> nil) and Application.MainFormOnTaskBar then
          for I := High(FOwnedAppWnds) downto Low(FOwnedAppWnds) do
            ShowWindow(FOwnedAppWnds[I], SW_SHOW);
        for I := FPopupOwners.Count - 1 downto 0 do
          ShowOwnedPopups(HWND(FPopupOwners[I]), Show);
         FPopupOwners.Clear;
        SetLength(FOwnedAppWnds, 0);
      end;
    end;
  end;
end;

function TApplication.IsRightToLeft: Boolean;
begin
  Result := SysLocale.MiddleEast and (FBiDiMode <> bdLeftToRight);
end;

function TApplication.UseRightToLeftReading: Boolean;
begin
  Result := SysLocale.MiddleEast and (FBiDiMode <> bdLeftToRight);
end;

function TApplication.UseRightToLeftAlignment: Boolean;
begin
  Result := SysLocale.MiddleEast and (FBiDiMode = bdRightToLeft);
end;

function TApplication.UseRightToLeftScrollBar: Boolean;
begin
  Result := SysLocale.MiddleEast and
            (FBiDiMode in [bdRightToLeft, bdRightToLeftNoAlign]);
end;

procedure TApplication.UseMetropolisUI;
begin
  FIsMetropolisUI := True;
end;

function TApplication.CheckIniChange(var Message: TMessage): Boolean;
var
  RMTaskbarCreated, SettingChange: Boolean;
begin
  Result := False;
  RMTaskbarCreated := Cardinal(Message.Msg) = RM_TaskbarCreated;
  SettingChange := Cardinal(Message.Msg) = WM_SETTINGCHANGE;
  if RMTaskbarCreated or SettingChange then
  begin
    if UpdateFormatSettings then
      if RMTaskbarCreated or
         (SettingChange and CheckFormatSettings(TWMSettingChange(Message))) then
      begin
        SetThreadLocale(LOCALE_USER_DEFAULT);
        GetFormatSettings;
      end;

    if UpdateMetricSettings then
      if RMTaskbarCreated or
         (SettingChange and CheckMetricSettings(TWMSettingChange(Message))) then
        Screen.GetMetricSettings;

    if RMTaskbarCreated then
    begin
      Screen.ResetFonts;
      if MainFormOnTaskBar then
      begin
        // Force updates to taskbar button and task manager list
        ChangeAppWindow(Handle, True, True);
        ChangeAppWindow(Handle, False, True);
      end;
    end;
  end;
end;

procedure TApplication.SettingChange(var Message: TWMSettingChange);
var
  LResult: Integer;
begin
  if Assigned(FOnSettingChange) then
    with Message do
    begin
      LResult := Result;
      FOnSettingChange(Self, Flag, Section, LResult);
      Result := LResult;
    end;
end;

function TApplication.CheckMetricSettings(const Message: TWMSettingChange): Boolean;
begin
  Result := not ((Message.Section <> nil) and ((StrComp(Message.Section, 'Policy') = 0) or
   (StrComp(Message.Section, 'Windows') = 0) or
   (StrComp(Message.Section, '') = 0) and (Message.Flag = SPI_SETDESKWALLPAPER)));
end;

function TApplication.CheckFormatSettings(const Message: TWMSettingChange): Boolean;
begin
  Result := (Message.Section <> nil) and (StrComp(Message.Section, 'intl') = 0);
end;

procedure TApplication.WndProc(var Message: TMessage);
var
  I: Integer;
  LMessage: TMessage;
  SaveFocus, TopWindow: HWnd;
  ActivateMsg: TWMActivateApp;
  EnableMsg: TWMEnable;
  EndSessionMsg: TWMEndSession;
{$IF DEFINED(CLR)}
  KeyMsg: TWMKey;
  SettingMsg: TWMSettingChange;
{$ENDIF}

  procedure Default;
  begin
    with Message do
      Result := DefWindowProc(Handle, Msg, WParam, LParam);
  end;

  procedure DrawAppIcon;
  var
    DC: HDC;
    PS: TPaintStruct;
  begin
    with Message do
    begin
      DC := BeginPaint(Handle, PS);
      DrawIcon(DC, 0, 0, GetIconHandle);
      EndPaint(Handle, PS);
    end;
  end;

begin
  try
    Message.Result := 0;
    for I := 0 to FWindowHooks.Count - 1 do
      if TWindowHook(FWindowHooks[I]{$IFNDEF CLR}^{$ENDIF})(Message) then Exit;
    CheckIniChange(Message);
    with Message do
      case Msg of
        WM_SYSCOMMAND:
          case WParam and $FFF0 of
            SC_MINIMIZE: Minimize;
            SC_RESTORE: Restore;
          else
            Default;
          end;
        WM_SIZE:
          if WParam = SIZE_MINIMIZED then
            FAppIconic := True;
        WM_CLOSE:
          if MainForm <> nil then MainForm.Close;
        WM_PAINT:
          if IsIconic(Handle) then DrawAppIcon else Default;
        WM_ERASEBKGND:
          begin
            Message.Msg := WM_ICONERASEBKGND;
            Default;
          end;
        WM_QUERYDRAGICON:
          Result := GetIconHandle;
        WM_SETFOCUS:
          begin
            PostMessage(Handle, CM_ENTER, 0, 0);
            Default;
          end;
        WM_ACTIVATEAPP:
          begin
            Default;
            ActivateMsg := TWMActivateApp(Message);
            FActive := ActivateMsg.Active;
            if FActive then
            begin
              if FMainFormOnTaskBar and FAppIconic then
                FAppIconic := False;
              RestoreTopMosts;
              PostMessage(Handle, CM_ACTIVATE, 0, 0);
            end
            else
            begin
              NormalizeTopMosts;
              PostMessage(Handle, CM_DEACTIVATE, 0, 0);
            end;
          end;
        WM_ENABLE:
          begin
            EnableMsg := TWMEnable(Message);
            if EnableMsg.Enabled then
            begin
              if not DisablingWindows then
              begin
                RestoreTopMosts;
                if FWindowList <> nil then
                begin
                  EnableTaskWindows(FWindowList);
                  FWindowList := nil;
                end;
              end;
              Default;
            end else
            begin
              Default;
              if (FWindowList = nil) and not DisablingWindows then
                FWindowList := DisableTaskWindows(Handle);
              NormalizeAllTopMosts;
            end;
          end;
        WM_CTLCOLORMSGBOX..WM_CTLCOLORSTATIC:
          Result := SendMessage(LParam, CN_BASE + Msg, WParam, LParam);
        WM_ENDSESSION:
          begin
            EndSessionMsg := TWMEndSession(Message);
            EndSessionMsg.Result := 0;

            // when the main form is minimized, the forms of the application
            // do not receive this message because TApplication is the first
            // to receive it and in turn it calls Halt()
            if Assigned(MainForm) and (MainForm.WindowState = wsMinimized) then
              NotifyForms(WM_ENDSESSION, WParam, LParam);

            if EndSessionMsg.EndSession then
            begin
              Application.Terminate;
              Halt;
            end;
          end;
        WM_QUERYENDSESSION:
          Message.Result := 1;
{$IF NOT DEFINED(CLR)}
        CM_ACTIONEXECUTE, CM_ACTIONUPDATE:
          Message.Result := Ord(DispatchAction(Message.Msg, TBasicAction(Message.LParam)));
{$ENDIF}
        CM_APPKEYDOWN:
        begin
{$IF DEFINED(CLR)}
          KeyMsg := TWMKey.Create(Message);
          if IsShortCut(KeyMsg) then Result := 1;
{$ELSE}
          if IsShortCut(TWMKey(Message)) then Result := 1;
{$ENDIF}
        end;
        CM_APPSYSCOMMAND:
          if MainForm <> nil then
            with MainForm do
              if (Handle <> 0) and IsWindowEnabled(Handle) and
                IsWindowVisible(Handle) then
              begin
                FocusMessages := False;
                SaveFocus := GetFocus;
                Winapi.Windows.SetFocus(Handle);
                Perform(WM_SYSCOMMAND, WParam, LParam);
                Winapi.Windows.SetFocus(SaveFocus);
                FocusMessages := True;
                Result := 1;
              end;
        CM_ACTIVATE:
          begin
            if Assigned(FOnActivate) then
              FOnActivate(Self);
            if Assigned(Application.MainForm) and Application.MainFormOnTaskBar and
               not IsWindowEnabled(Application.MainForm.Handle) and
               (FLastActivePopup <> MainForm.Handle) then
              Winapi.Windows.SetFocus(FLastActivePopup);
            FLastActivePopup := 0;
          end;
        CM_DEACTIVATE:
          begin
            FLastActivePopup := GetLastActivePopup(Handle);
            if Assigned(FOnDeactivate) then FOnDeactivate(Self);
          end;
        CM_ENTER:
          if not IsIconic(Handle) and (GetFocus = Handle) then
          begin
            TopWindow := FindTopMostWindow(0);
            if TopWindow <> 0 then Winapi.Windows.SetFocus(TopWindow);
          end;
        WM_HELP,
        CM_INVOKEHELP: InvokeHelp(WParam, LParam);
{$IF NOT DEFINED(CLR)}
        CM_WINDOWHOOK:
          if wParam = 0 then
            HookMainWindow(TWindowHook(Pointer(LParam)^)) else
            UnhookMainWindow(TWindowHook(Pointer(LParam)^));
{$ENDIF}
        CM_DIALOGHANDLE:
          if wParam = 1 then
            Result := FDialogHandle
          else
            FDialogHandle := lParam;
        WM_SETTINGCHANGE:
          begin
            Mouse.SettingChanged(wParam);
{$IF DEFINED(CLR)}
            SettingMsg := TWMSettingChange.Create(Message);
            SettingChange(SettingMsg);
{$ELSE}
            SettingChange(TWMSettingChange(Message));
{$ENDIF}
            Default;
          end;
        WM_FONTCHANGE:
          begin
            Screen.ResetFonts;
            Default;
          end;
        WM_THEMECHANGED:
          begin
            StyleServices.ApplyThemeChange;
            LMessage.Msg := CM_STYLECHANGED;
            LMessage.WParam := 0;
            LMessage.LParam := 0;
            LMessage.Result := 0;
            for I := 0 to Screen.FormCount - 1 do
              Screen.Forms[I].Broadcast(LMessage);
          end;
        CM_INPUTLANGCHANGE:
          begin
            NotifyForms(CM_INPUTLANGCHANGE, WParam, LParam);
          end;

        WM_NULL:
          CheckSynchronize;

        WM_WTSSESSION_CHANGE:
          Screen.GetMonitors;
      else
        Default;
      end;
  except
    HandleException(Self);
  end;
end;

function TApplication.GetIconHandle: HICON;
begin
  Result := Icon.Handle;
  if Result = 0 then Result := LoadIcon(0, IDI_APPLICATION);
end;

procedure TApplication.Minimize;
begin
  if not IsIconic(Handle) then
  begin
    NormalizeTopMosts;
    if not MainFormOnTaskBar then
      SetActiveWindow(Handle); // WM_ACTIVATEAPP can set AppIconic to False
    FAppIconic := True;        // Set AppIconic here just to be safe
    DoShowOwnedPopups(False);
    if FMainFormOnTaskBar then
    begin
      if FMainForm <> nil then
      begin
        StoreWindowStateBeforeMinimize(FMainForm.Handle);
        FMainForm.WindowState := wsMinimized
      end
      else
        FInitialMainFormState := wsMinimized;
    end
    else
    begin
      StoreWindowStateBeforeMinimize(Handle);
      if (FMainForm <> nil) and (ShowMainForm or FMainForm.Visible)
         and IsWindowEnabled(FMainForm.Handle) then
      begin
        SetWindowPos(Handle, FMainForm.Handle, FMainForm.Left, FMainForm.Top,
          FMainForm.Width, 0, SWP_SHOWWINDOW);
        DefWindowProc(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
      end
      else
        ShowWinNoAnimate(Handle, SW_MINIMIZE);
    end;
    if Assigned(FOnMinimize) then FOnMinimize(Self);
  end;
end;

procedure TApplication.Restore;
begin
  if IsIconic(Handle) then
  begin
    FAppIconic := False;
    SetActiveWindow(Handle);
    if (FMainForm <> nil) then
      if FMainFormOnTaskBar then
      begin
        ShowWindow(FMainForm.Handle, SW_RESTORE);
        RestoreWindowStateBeforeMinimize(FMainForm.Handle, False);
      end
      else
      begin
        if (ShowMainForm or FMainForm.Visible) and IsWindowEnabled(FMainForm.Handle) then
          DefWindowProc(Handle, WM_SYSCOMMAND, SC_RESTORE, 0)
        else
          ShowWinNoAnimate(Handle, SW_RESTORE);
        SetWindowPos(Handle, HWND_TOP, GetSystemMetrics(SM_CXSCREEN) div 2,
          GetSystemMetrics(SM_CYSCREEN) div 2, 0, 0, SWP_SHOWWINDOW);
        RestoreWindowStateBeforeMinimize(Handle, True);
      end;
    if (FMainForm <> nil) and (FMainForm.FWindowState = wsMinimized) and
      not FMainForm.Visible then
    begin
      FMainForm.WindowState := wsNormal;
      FMainForm.Show;
    end;
    RestoreTopMosts;
    DoShowOwnedPopups(True);
    if Screen.ActiveControl <> nil then
      Winapi.Windows.SetFocus(Screen.ActiveControl.Handle);
    if Assigned(FOnRestore) then FOnRestore(Self);
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeTopLevelWindows)]
procedure TApplication.BringToFront;
var
  LHandle, TopWindow: HWnd;
begin
  if MainFormOnTaskBar and Assigned(FMainForm) then
    LHandle := FMainForm.Handle
  else
    LHandle := Handle;
  if LHandle <> 0 then
  begin
    TopWindow := GetLastActivePopup(LHandle);
    if (TopWindow <> 0) and (TopWindow <> Handle) and
      IsWindowVisible(TopWindow) and IsWindowEnabled(TopWindow) then
      SetForegroundWindow(TopWindow);
  end;
end;

function TApplication.GetTitle: string;
var
{$IF DEFINED(CLR)}
  Buffer: StringBuilder;
{$ELSE}
  Buffer: array[0..255] of Char;
{$ENDIF}
begin
  if FHandleCreated and not MainFormOnTaskBar then
  begin
{$IF DEFINED(CLR)}
    Buffer := StringBuilder.Create(256);
    GetWindowText(Handle, Buffer, Buffer.Capacity);
    Result := Buffer.ToString;
{$ELSE}
    SetString(Result, Buffer, GetWindowText(FHandle, Buffer, Length(Buffer)));
{$ENDIF}
    if Length(Result) = 0 then
      Result := FTitle;
  end
  else
    Result := FTitle;
end;

procedure TApplication.SetIcon(Value: TIcon);
begin
  Icon.Assign(Value);
end;

procedure TApplication.SetBiDiMode(Value: TBiDiMode);
var
  Loop: Integer;
begin
  if FBiDiMode <> Value then
  begin
    FBiDiMode := Value;
    with Screen do
      for Loop := 0 to FormCount-1 do
        Forms[Loop].Perform(CM_PARENTBIDIMODECHANGED, 0, 0);
  end;
end;

function TApplication.GetBiDiKeyboard: string;
begin
  Result := FBiDiKeyboard.GetBiDiKeyboard;
end;

function TApplication.GetNonBiDiKeyboard: string;
begin
  Result := FBiDiKeyboard.GetNonBiDiKeyboard;
end;

procedure TApplication.SetBiDiKeyboard(const Value: string);
begin
  FBiDiKeyboard.SetBiDiKeyboard(Value);
end;

procedure TApplication.SetNonBiDiKeyboard(const Value: string);
begin
 FBiDiKeyboard.SetNonBiDiKeyboard(Value);
end;

procedure TApplication.SetDefaultFont(Value: TFont);
begin
  FDefaultFont.Assign(Value);
end;

procedure TApplication.SetTitle(const Value: string);
begin
  if FTitle <> Value then
  begin
    if FHandleCreated then
      if MainFormOnTaskBar then
        SetWindowText(Handle, nil)
      else
        SetWindowText(Handle, Value);
    FTitle := Value;
  end;
end;

procedure TApplication.SetHandle(Value: HWnd);
begin
  if not FHandleCreated and (Value <> Handle) then
  begin
    if Handle <> 0 then UnhookMainWindow(CheckIniChange);
{$IF DEFINED(CLR)}
    if not Assigned(FResources) then
      FResources := TApplicationResources.Create;
    FResources.FHandle := Value;
{$ELSE}
    FHandle := Value;
{$ENDIF}
    if Value <> 0 then HookMainWindow(CheckIniChange);
  end;
end;

function TApplication.IsDlgMsg(var Msg: TMsg): Boolean;
begin
  Result := False;
  if FDialogHandle <> 0 then
{$IF DEFINED(CLR)}
    Result := IsDialogMessage(FDialogHandle, Msg);
{$ELSE}
    if IsWindowUnicode(Msg.hwnd) then
      Result := IsDialogMessageW(FDialogHandle, Msg)
    else
      Result := IsDialogMessageA(FDialogHandle, Msg);
{$ENDIF}
end;

function TApplication.IsMDIMsg(var Msg: TMsg): Boolean;
begin
  Result := False;
  if (MainForm <> nil) and (MainForm.FormStyle = fsMDIForm) and
     (Screen.ActiveForm <> nil) and (Screen.ActiveForm.FormStyle = fsMDIChild) then
    Result := TranslateMDISysAccel(MainForm.ClientHandle, Msg);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
function TApplication.IsKeyMsg(var Msg: TMsg): Boolean;
var
  Wnd: HWND;
  WndProcessID, ProcessID: Cardinal;
begin
  Result := False;
  with Msg do
    if (Message >= WM_KEYFIRST) and (Message <= WM_KEYLAST) then
    begin
      Wnd := GetCapture;
      if Wnd = 0 then
      begin
        Wnd := HWnd;
        if (MainForm <> nil) and (Wnd = MainForm.ClientHandle) then
          Wnd := MainForm.Handle
        else
        begin
          // Find the nearest VCL component.  Non-VCL windows wont know what
          // to do with CN_BASE offset messages anyway.
          // TOleControl.WndProc needs this for TranslateAccelerator
          while not IsVCLControl(Wnd) and (Wnd <> 0) do
            Wnd := GetParent(Wnd);
          if Wnd = 0 then Wnd := HWnd;
        end;
{$IF DEFINED(CLR)}
        if SendMessage(Wnd, CN_BASE + Message, WParam, LParam) <> 0 then
{$ELSE}
        if IsWindowUnicode(Wnd) then
        begin
          if SendMessageW(Wnd, CN_BASE + Message, WParam, LParam) <> 0 then
            Result := True;
        end else if SendMessageA(Wnd, CN_BASE + Message, WParam, LParam) <> 0 then
{$ENDIF}
          Result := True;
      end
      else
      begin
        GetWindowThreadProcessId(Wnd, WndProcessId);
        GetWindowThreadProcessId(Handle, ProcessId);
        if (WndProcessID = ProcessID) then
          if SendMessage(Wnd, CN_BASE + Message, WParam, LParam) <> 0 then
            Result := True;
      end;
    end;
end;

function TApplication.IsHintMsg(var Msg: TMsg): Boolean;
begin
  Result := False;
  if (FHintWindow <> nil) and FHintWindow.IsHintMsg(Msg) then
    CancelHint;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
function TApplication.IsShortCut(var Message: TWMKey): Boolean;
begin
  Result := False;
  if Assigned(FOnShortCut) then FOnShortCut(Message, Result);
  Result := Result or (MainForm <> nil) and IsWindowEnabled(MainForm.Handle) and
    MainForm.IsShortCut(Message)
end;

procedure TApplication.PopupControlProc(var Message: TMessage);
var
  I: Integer;
  CreatePopup: TCMCreatePopup;
begin
  case Message.Msg of
    CM_CREATEPOPUP:
      begin
        CreatePopup := TCMCreatePopup(Message);
        for I := Low(FPopupForms) to High(FPopupForms) do
          if (FPopupForms[I].FormID = CreatePopup.PopupID) and
            (FPopupForms[I].Form <> nil) then
          begin
            if FPopupForms[I].WasPopup then
              FPopupForms[I].Form.RecreateAsPopup(CreatePopup.OwnerWnd)
            else
            begin
              FPopupForms[I].Form.HandleNeeded;
              FPopupForms[I].Form.UpdateControlState;
            end;
            Exit;
          end;
      end;
    else
      with Message do
        Result := DefWindowProc({$IFDEF CLR}FResources.{$ENDIF}FPopupControlWnd,
          Msg, wParam, lParam);
  end;
end;

[SecurityPermission(SecurityAction.LinkDemand, UnmanagedCode=True)]
function TApplication.ProcessMessage(var Msg: TMsg): Boolean;
var
  Handled: Boolean;
  Unicode: Boolean;
  MsgExists: Boolean;
begin
  Result := False;
  if PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE) then
  begin
    Unicode := (Msg.hwnd = 0) or IsWindowUnicode(Msg.hwnd);
    if Unicode then
      MsgExists := PeekMessageW(Msg, 0, 0, 0, PM_REMOVE)
    else
      MsgExists := PeekMessageA(Msg, 0, 0, 0, PM_REMOVE);

    if MsgExists then
    begin
      Result := True;
      if Msg.Message <> WM_QUIT then
      begin
        Handled := False;
        if Assigned(FOnMessage) then FOnMessage(Msg, Handled);
        if not IsPreProcessMessage(Msg) and not IsHintMsg(Msg) and
          not Handled and not IsMDIMsg(Msg) and
          not IsKeyMsg(Msg) and not IsDlgMsg(Msg) then
        begin
          TranslateMessage(Msg);
          if Unicode then
            DispatchMessageW(Msg)
          else
            DispatchMessageA(Msg);
        end;
      end
      else
      begin
  {$IF DEFINED(CLR)}
        if Assigned(FOnShutDown) then FOnShutDown(self);
        DoneApplication;
  {$ENDIF}
        FTerminate := True;
      end;
    end;
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TApplication.ProcessMessages;
var
  Msg: TMsg;
begin
  while ProcessMessage(Msg) do {loop};
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TApplication.HandleMessage;
var
  Msg: TMsg;
begin
  if not ProcessMessage(Msg) then Idle(Msg);
end;

procedure TApplication.HookMainWindow(Hook: TWindowHook);
{$IF DEFINED(CLR)}
begin
  FWindowHooks.Add(TObject(@Hook));
{$ELSE}
var
  WindowHook: ^TWindowHook;
begin
  if not FHandleCreated then
   begin
    if FHandle <> 0 then
      SendMessage(FHandle, CM_WINDOWHOOK, 0, Winapi.Windows.LPARAM(@@Hook));
  end else
  begin
    FWindowHooks.Expand;
    New(WindowHook);
    WindowHook^ := Hook;
    FWindowHooks.Add(WindowHook);
  end;
{$ENDIF}
end;

procedure TApplication.UnhookMainWindow(Hook: TWindowHook);
{$IF DEFINED(CLR)}
var
  I: Integer;
  WindowHook: TWindowHook;
begin
  for I := 0 to FWindowHooks.Count - 1 do
  begin
    WindowHook := TWindowHook(FWindowHooks[I]);
    if Delegate(@WindowHook).Equals(TObject(@Hook)) then
    begin
      FWindowHooks.Delete(I);
      Break;
    end;
  end;
{$ELSE}
var
  I: Integer;
  WindowHook: ^TWindowHook;
begin
  if not FHandleCreated then
  begin
    if FHandle <> 0 then
      SendMessage(FHandle, CM_WINDOWHOOK, 1, Winapi.Windows.LPARAM(@@Hook));
  end else
    for I := 0 to FWindowHooks.Count - 1 do
    begin
      WindowHook := FWindowHooks[I];
      if (TMethod(WindowHook^).Code = TMethod(Hook).Code) and
        (TMethod(WindowHook^).Data = TMethod(Hook).Data) then
      begin
        Dispose(WindowHook);
        FWindowHooks.Delete(I);
        Break;
      end;
    end;
{$ENDIF}
end;

procedure TApplication.Initialize;
begin
  { This used to call InitProc, which was only used for COM and CORBA.
    Neither is used with the .NET version }
{$IF NOT DEFINED(CLR)}
  if InitProc <> nil then TProcedure(InitProc);
{$ENDIF}
end;

procedure TApplication.CreateForm(InstanceClass: TComponentClass; var Reference);
var
  Instance: TComponent;
begin
  // Set flag that TCustomForm constructor can read, so it knows if it's being
  // created as a main form or not (required when MainFormOnTaskbar is True)
  FCreatingMainForm := (FMainForm = nil) and InstanceClass.InheritsFrom(TForm);
  Instance := nil;
  try
{$IF DEFINED(CLR)}
    Instance := InstanceClass.Create(Self);
    Reference := Instance;
{$ELSE}
    Instance := TComponent(InstanceClass.NewInstance);
    TComponent(Reference) := Instance;
    try
      Instance.Create(Self);
    except
      TComponent(Reference) := nil;
      Instance := nil;
      raise;
    end;
{$ENDIF}

    if (FMainForm = nil) and (Instance is TForm) then
    begin
      TForm(Instance).HandleNeeded;
      FMainForm := TForm(Instance);
      if MainFormOnTaskBar then
        SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_NOACTIVATE);
      ChangeAppWindow(Handle, not MainFormOnTaskBar, not MainFormOnTaskBar);
    end;
  finally
    if (FMainForm = nil) and (Instance is TForm) then
      TForm(Instance).FCreatingMainForm := False;
  end;
end;

procedure TApplication.Run;
begin
  FRunning := True;
  try
{$IF NOT DEFINED(CLR)}
    AddExitProc(DoneApplication);
{$ENDIF}
    if FMainForm <> nil then
    begin
      case CmdShow of
        SW_SHOWMINNOACTIVE:
          begin
            FInitialMainFormState := wsMinimized;
            FMainForm.FWindowState := wsMinimized;
          end;
        SW_SHOWMAXIMIZED: MainForm.WindowState := wsMaximized;
      end;
      if FShowMainForm then
        if (FMainForm.FWindowState = wsMinimized) or (FInitialMainFormState = wsMinimized) then
        begin
          Minimize;
          if (FInitialMainFormState = wsMinimized) then
            FMainForm.Show;
        end else
          FMainForm.Visible := True;
      repeat
        try
          HandleMessage;
        except
          HandleException(Self);
        end;
      until Terminated;
    end;
  finally
    FRunning := False;
  end;
end;

procedure TApplication.Terminate;
begin
  // We used to call CallTerminateProcs to allow them to abort the termination.
{$IF NOT DEFINED(CLR)}
  if CallTerminateProcs then
{$ENDIF}
    PostQuitMessage(0);
end;

{$IF NOT DEFINED(CLR)}
function IsClass(Obj: TObject; Cls: TClass): Boolean;
var
  Parent: TClass;
begin
  Parent := Obj.ClassType;
  while (Parent <> nil) and (Parent.ClassName <> Cls.ClassName) do
    Parent := Parent.ClassParent;
  Result := Parent <> nil;
end;
{$ENDIF}

procedure TApplication.HandleException(Sender: TObject);
var
  O: TObject;
begin
  if GetCapture <> 0 then SendMessage(GetCapture, WM_CANCELMODE, 0, 0);
  O := ExceptObject;
{$IF DEFINED(CLR)}
  if O is Exception then
  begin
    if not (O is EAbort) then
      if Assigned(FOnException) then
{$ELSE}
  if IsClass(O, Exception) then
  begin
    if not IsClass(O, EAbort) then
      if Assigned(FOnException) then
{$ENDIF}
        FOnException(Sender, Exception(O))
      else
        ShowException(Exception(O));
  end else
{$IF DEFINED(CLR)}
    SysUtils.ShowException(O, nil);
{$ELSE}
    System.SysUtils.ShowException(O, ExceptAddr);
{$ENDIF}
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
{$IF DEFINED(CLR)}
function TApplication.MessageBox(const Text, Caption: string; Flags: Longint): Integer;
{$ELSE}
function TApplication.MessageBox(const Text, Caption: PChar; Flags: Longint): Integer;
{$ENDIF}
var
  ActiveWindow, TaskActiveWindow: HWnd;
  MBMonitor, AppMonitor: HMonitor;
  MonInfo: TMonitorInfo;
  Rect: TRect;
  FocusState: TFocusState;
  WindowList: TTaskWindowList;
begin
  ActiveWindow := ActiveFormHandle;
  if ActiveWindow = 0 then
    TaskActiveWindow := Handle
  else
    TaskActiveWindow := ActiveWindow;
  MBMonitor := MonitorFromWindow(ActiveWindow, MONITOR_DEFAULTTONEAREST);
  AppMonitor := MonitorFromWindow(Handle, MONITOR_DEFAULTTONEAREST);
  if MBMonitor <> AppMonitor then
  begin
{$IF DEFINED(CLR)}
    MonInfo.cbSize := Marshal.SizeOf(TypeOf(TMonitorInfo));
{$ELSE}
    MonInfo.cbSize := Sizeof(TMonitorInfo);
{$ENDIF}
    GetMonitorInfo(MBMonitor, {$IFNDEF CLR}@{$ENDIF}MonInfo);
    GetWindowRect(Handle, Rect);
    SetWindowPos(Handle, 0,
      MonInfo.rcMonitor.Left + ((MonInfo.rcMonitor.Right - MonInfo.rcMonitor.Left) div 2),
      MonInfo.rcMonitor.Top + ((MonInfo.rcMonitor.Bottom - MonInfo.rcMonitor.Top) div 2),
      0, 0, SWP_NOACTIVATE or SWP_NOREDRAW or SWP_NOSIZE or SWP_NOZORDER);
  end;
  WindowList := DisableTaskWindows(ActiveWindow);
  FocusState := SaveFocusState;
  if UseRightToLeftReading then Flags := Flags or MB_RTLREADING;
  try
    Result := Winapi.Windows.MessageBox(TaskActiveWindow, Text, Caption, Flags);
  finally
    if MBMonitor <> AppMonitor then
      SetWindowPos(Handle, 0,
        Rect.Left + ((Rect.Right - Rect.Left) div 2),
        Rect.Top + ((Rect.Bottom - Rect.Top) div 2),
        0, 0, SWP_NOACTIVATE or SWP_NOREDRAW or SWP_NOSIZE or SWP_NOZORDER);
    EnableTaskWindows(WindowList);
    SetActiveWindow(ActiveWindow);
    RestoreFocusState(FocusState);
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
procedure TApplication.ShowException(E: Exception);
var
  Msg: string;
  SubE: Exception;
begin
  Msg := E.Message;
  while True do
  begin
    SubE := E.GetBaseException;
    if SubE <> E then
    begin
      E := SubE;
      if E.Message <> '' then
        Msg := E.Message;
    end
    else
      Break;
  end;
  if (Msg <> '') and (Msg[Length(Msg)] > '.') then Msg := Msg + '.';
{$IF DEFINED(CLR)}
  MessageBox(Msg, GetTitle,
{$ELSE}
  MessageBox(PChar(Msg), PChar(GetTitle),
{$ENDIF}
     MB_OK + MB_ICONSTOP);
end;

function TApplication.InvokeHelp(Command: Word; Data: NativeInt): Boolean;
var
  CallHelp: Boolean;
  HelpHandle: HWND;
  ActiveForm: TCustomForm;
{$IF DEFINED(CLR)}
  LCmdStr: string;
{$ENDIF}
begin
  ActiveForm := nil;
  CallHelp := True;
{$IF DEFINED(CLR)}
  case Command of
    HELP_COMMAND,
    HELP_KEY,
    HELP_PARTIALKEY:
      if Data <> 0 then
      begin
        LCmdStr := Marshal.PtrToStringAnsi(IntPtr.Create(Data));
        Result := DoOnHelp(Command, THelpEventData(LCmdStr), CallHelp);
      end
      else
        Result := DoOnHelp(Command, THelpEventData(''), CallHelp);
    HELP_CONTEXT,
    HELP_CONTEXTPOPUP,
    HELP_SETCONTENTS:
      Result := DoOnHelp(Command, THelpEventData(THelpContext(Data)), CallHelp);
  else
    Result := DoOnHelp(Command, THelpEventData(Data), CallHelp);
  end;
{$ELSE}
  Result := DoOnHelp(Command, Data, CallHelp);
{$ENDIF}

  if not Result then
  begin
    ActiveForm := Screen.ActiveCustomForm;
    if Assigned(ActiveForm) and (csDesigning in ActiveForm.ComponentState) then
      CallHelp := False;
    if Assigned(ActiveForm) and (ActiveForm.TabOrder = -1) and (ActiveForm.Visible = False) and
       (not Assigned(ActiveForm.ActiveControl)) then
        CallHelp := False;
  end;

  if CallHelp then
  begin
    if Assigned(ActiveForm) and ActiveForm.HandleAllocated and (ActiveForm.FHelpFile <> '') then
    begin
      HelpHandle := ActiveForm.Handle;
      if ValidateHelpSystem then
                                                                   
        Result := HelpSystem.Hook(HelpHandle, ActiveForm.FHelpFile, Command, Data);
    end
    else
    if FHelpFile <> '' then
    begin
      HelpHandle := Handle;
      if FMainForm <> nil then HelpHandle := FMainForm.Handle;
                                                                   
      if ValidateHelpSystem then Result := HelpSystem.Hook(HelpHandle, FHelpFile, Command, Data);
    end
    else
      if not FHandleCreated then
        PostMessage(Handle, CM_INVOKEHELP, Command, Data);
  end;
end;

function TApplication.DoOnHelp(Command: Word; Data: THelpEventData; var CallHelp: Boolean): Boolean;
var
  ActiveForm: TCustomForm;
begin
  Result := False;
  CallHelp := True;
  ActiveForm := nil;

  { If the active control is on an embedded form, try it's OnHelp first. }
  if Screen.ActiveControl <> nil then
  begin
    ActiveForm := GetParentForm(Screen.ActiveControl, False);
    if Assigned(ActiveForm) and Assigned(ActiveForm.FOnHelp) then
      Result := ActiveForm.FOnHelp(Command, Data, CallHelp);
  end;

  if not Result then
  begin
    { Next, try the Screen.ActiveCustomForm, it not already tried }
    if (Screen.ActiveCustomForm <> nil) and (Screen.ActiveCustomForm <> ActiveForm) then
    begin
      ActiveForm := Screen.ActiveCustomForm;
      if Assigned(ActiveForm) and Assigned(ActiveForm.FOnHelp) then
        Result := ActiveForm.FOnHelp(Command, Data, CallHelp)
    end;
    { Try the application hook }
    if (not Result) and Assigned(FOnHelp) then
      Result := FOnHelp(Command, Data, CallHelp);
  end;
end;

function TApplication.HelpKeyword(const Keyword: string): Boolean;
var
  CallHelp: Boolean;
begin
{$IF DEFINED(CLR)}
  Result := DoOnHelp(HELP_COMMAND, THelpEventData(Keyword), CallHelp);
{$ELSE}
  Result := DoOnHelp(HELP_COMMAND, THelpEventData(PChar(Keyword)), CallHelp);
{$ENDIF}
  if CallHelp then
  begin
    if ValidateHelpSystem then
    begin
      { We have to asume ShowHelp worked }
      Result := True;
      HelpSystem.ShowHelp(Keyword, GetCurrentHelpFile);
    end
    else
      Result := False;
  end;
end;

function TApplication.HelpContext(Context: THelpContext): Boolean;
var
  CallHelp: Boolean;
begin
{$IF DEFINED(CLR)}
  Result := DoOnHelp(HELP_CONTEXT, THelpEventData(THelpContext(Context)), CallHelp);
{$ELSE}
  Result := DoOnHelp(HELP_CONTEXT, Context, CallHelp);
{$ENDIF}
  if CallHelp then
  begin
    if ValidateHelpSystem then
    begin
      { We have to assume ShowHelp worked }
      Result := True;
      HelpSystem.ShowContextHelp(Context, GetCurrentHelpFile);
    end
    else
      Result := False;
  end;
end;

function TApplication.HelpCommand(Command: Integer; Data: NativeInt): Boolean;
begin
  Result := InvokeHelp(Command, Data);
end;

function TApplication.HelpJump(const JumpID: string): Boolean;
var
  CallHelp: Boolean;
begin
{$IF DEFINED(CLR)}
  Result := DoOnHelp(HELP_COMMAND, THelpEventData(JumpID), CallHelp);
{$ELSE}
  Result := DoOnHelp(HELP_COMMAND, THelpEventData(PChar(JumpID)), CallHelp);
{$ENDIF}
  if CallHelp then
  begin
    if ValidateHelpSystem then
    begin
      { We have to assume ShowHelp worked }
      Result := True;
      HelpSystem.ShowTopicHelp(JumpID, GetCurrentHelpFile);
    end
    else
      Result := False;
  end;
end;

function TApplication.HelpShowTableOfContents: Boolean;
begin
  Result := ValidateHelpSystem;
  if Result then
    Result := HelpSystem.Hook(Handle, GetCurrentHelpFile, HELP_CONTENTS, 0);
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TApplication.GetExeName: string;
begin
  Result := ParamStr(0);
end;

procedure TApplication.SetShowHint(Value: Boolean);
begin
  if FShowHint <> Value then
  begin
    FShowHint := Value;
    if FShowHint then
    begin
      if Assigned(HintWindowClass) then
      begin
        FHintWindow := HintWindowClass.Create(Self);
        FHintWindow.Color := FHintColor;
      end;
    end
    else
    begin
      FHintWindow.Free;
      FHintWindow := nil;
    end;
  end;
end;

procedure TApplication.SetHintColor(Value: TColor);
begin
  if FHintColor <> Value then
  begin
    FHintColor := Value;
    if FHintWindow <> nil then
      FHintWindow.Color := FHintColor;
  end;
end;

procedure TApplication.DefaultFontChanged(Sender: TObject);
begin
  NotifyForms(CM_PARENTFONTCHANGED);
end;

procedure TApplication.DoActionIdle;
var
  I: Integer;
begin
  for I := 0 to Screen.CustomFormCount - 1 do
    with Screen.CustomForms[I] do
      if HandleAllocated and IsWindowVisible(Handle) and
        IsWindowEnabled(Handle) then
        UpdateActions;
end;

function TApplication.DoMouseIdle: TControl;
var
  P: TPoint;
begin
  GetCursorPos(P);
  Result := FindDragTarget(P, True);
  if FMouseControl <> Result then
    FMouseControl := Result;
end;

var
  IdleTimerHandle: UIntPtr;
  IdleTimerDelegate: TFNTimerProc;

{$IF DEFINED(CLR)}
procedure IdleTimerProc(Wnd: HWnd; Msg: UINT; TimerID: UINT_PTR; SysTime: DWORD);
{$ELSE}
procedure IdleTimerProc(Wnd: HWnd; Msg: UINT; TimerID: UINT_PTR; SysTime: DWORD); stdcall;
{$ENDIF}
begin
  if Application <> nil then
  try
    KillTimer(0, IdleTimerHandle);
    IdleTimerHandle := 0;
    Application.DoActionIdle;
  except
    Application.HandleException(Application);
  end;
end;

procedure TApplication.Idle(const Msg: TMsg);
var
  Control: TControl;
  Done: Boolean;
begin
  Control := DoMouseIdle;
  if FShowHint and (FMouseControl = nil) then
    CancelHint;
  Application.Hint := GetLongHint(GetHint(Control));
  Done := True;
  try
    if Assigned(FOnIdle) then FOnIdle(Self, Done);
    if Done then
      if FActionUpdateDelay <= 0 then
        DoActionIdle
      else
        if IdleTimerHandle = 0 then
        begin
          // Constantly assigning to the IdleTimerDelegate causes a
          // memory allocation, and alot of TFNTimerProc's appear in Gen0 because of this.
          // Only assign the delgate once; that is all that is needed.
          if not Assigned(IdleTimerDelegate) then
            IdleTimerDelegate := @IdleTimerProc;
          IdleTimerHandle := SetTimer(0, 0, FActionUpdateDelay, IdleTimerDelegate);
          if IdleTimerHandle = 0 then
            DoActionIdle
        end;
  except
    HandleException(Self);
  end;
{$IF DEFINED(CLR)}
  if (System.Threading.Thread.CurrentThread = MainThread) and CheckSynchronize then
{$ENDIF}
{$IFDEF MSWINDOWS}
  if (GetCurrentThreadID = MainThreadID) and CheckSynchronize then
{$ENDIF}
{$IFDEF LINUX}
  if (Libc.GetCurrentThreadID = MainThreadID) and CheckSynchronize then
{$ENDIF}
    Done := False;
{$IF DEFINED(CLR)}
  if not DisableManagedWaitMessageCalls then
{$ENDIF}
    if Done then WaitMessage;
end;

procedure TApplication.DoApplicationIdle;
var
  Msg: TMsg;
begin
  Msg.message := 0;
  Msg.hwnd := 0;
  Msg.wParam := 0;
  Msg.lParam := 0;
  Idle(Msg);
end;

procedure TApplication.NotifyForms(Msg: Word; WParam: WPARAM = 0; LParam: LPARAM = 0);
var
  I: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
    Screen.Forms[I].Perform(Msg, WParam, LParam);
end;

procedure TApplication.IconChanged(Sender: TObject);
begin
  if NewStyleControls then
  begin
    SendMessage(Handle, WM_SETICON, ICON_BIG, GetIconHandle);
    SetClassLong(Handle, GCL_HICON, GetIconHandle);
  end
  else
    if IsIconic(Handle) then InvalidateRect(Handle, nil, True);
  NotifyForms(CM_ICONCHANGED);
end;

procedure TApplication.SetHint(const Value: string);
begin
  if FHint <> Value then
  begin
    FHint := Value;
    if Assigned(FOnHint) then
      FOnHint(Self)
    else
      { Fire THintAction to anyone interested }
      with THintAction.Create(Self) do
      begin
        Hint := Value;
        try
          Execute;
        finally
          Free;
        end;
      end;
  end;
end;

var
  AppVisible: Boolean = False;

procedure TApplication.UpdateVisible;

  procedure SetVisible(Value: Boolean);
  const
    ShowFlags: array[Boolean] of Word = (
      SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_HIDEWINDOW,
      SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_SHOWWINDOW);
  begin
    // Dont auto-update visibility if somebody else has hidden app window
    if (IsWindowVisible(Handle) = AppVisible) and (AppVisible <> Value) then
    begin
      if MainFormOnTaskBar and not AppVisible then
        SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_NOACTIVATE);
      SetWindowPos(Handle, 0, 0, 0, 0, 0, ShowFlags[Value]);
      AppVisible := Value;
    end;
  end;

var
  I: Integer;
  Form: TForm;
begin
  if Handle <> 0 then
  begin
    for I := 0 to Screen.FormCount - 1 do
    begin
      Form := Screen.Forms[I];
      if Form.Visible and ((Form.ParentWindow = 0) or not Form.HandleAllocated or
        not IsChild(Form.Handle, Form.ParentWindow)) then
      begin
        SetVisible(True);
        Exit;
      end;
    end;
    SetVisible(False);
  end;
end;

function TApplication.ValidateHelpSystem: Boolean;
begin
  if FHelpSystem = nil then
    System.HelpIntfs.GetHelpSystem(FHelpSystem);

  Result := FHelpSystem <> nil;
end;

{ Hint window processing }

procedure TApplication.StartHintTimer(Value: UINT; TimerMode: TTimerMode);
begin
  StopHintTimer;
  FTimerHandle := SetTimer(0, 0, Value, HintTimerDelegate);
  FTimerMode := TimerMode;
  if FTimerHandle = 0 then CancelHint;
end;

procedure TApplication.StopHintTimer;
begin
  if FTimerHandle <> 0 then
  begin
    KillTimer(0, FTimerHandle);
    FTimerHandle := 0;
  end;
end;

procedure TApplication.StoreWindowStateBeforeMinimize(AHandle: HWND);
begin
  FDisabledStateBeforeMinimize := not IsWindowEnabled(AHandle);
  if FDisabledStateBeforeMinimize then
    EnableWindow(AHandle, True);
end;

procedure TApplication.HintMouseMessage(Control: TControl; var Message: TMessage);
var
  NewHintControl: TControl;
  Pause: Integer;
  WasHintActive: Boolean;
  P: TPoint;
  MouseMsg: TWMMouse;
{$IF DEFINED(CLR)}
  PauseMsg: TMessage;
{$ENDIF}
begin
  MouseMsg := TWMMouse(Message);
  NewHintControl := GetHintControl(FindDragTarget(Control.ClientToScreen(SmallPointToPoint(MouseMsg.Pos)), True));
  if (NewHintControl = nil) or not NewHintControl.ShowHint then
    CancelHint
  else
  begin
    if (NewHintControl <> FHintControl) or
      (not FHintCursorRect.Contains(Control.ClientToScreen(SmallPointToPoint(MouseMsg.Pos)))) then
    begin
      WasHintActive := FHintActive;
      if WasHintActive then
        Pause := FHintShortPause else
        Pause := FHintPause;
{$IF DEFINED(CLR)}
      PauseMsg := TMessage.Create(CM_HINTSHOWPAUSE, Ord(WasHintActive), Pause);
      if Assigned(NewHintControl) then
        NewHintControl.WindowProc(PauseMsg);
{$ELSE}
      NewHintControl.Perform(CM_HINTSHOWPAUSE, Ord(WasHintActive), Winapi.Windows.LPARAM(@Pause));
{$ENDIF}
      { Show hint immediately if no pause }
      if WasHintActive and (Pause = 0) then
      begin
        FHintActive := WasHintActive;
        FHintControl := NewHintControl;
        GetCursorPos(P);
        ActivateHint(P);
      end
      else
      begin
        CancelHint;
        FHintActive := WasHintActive;
        FHintControl := NewHintControl;
{$IF DEFINED(CLR)}
        StartHintTimer(PauseMsg.LParam, tmShow);
{$ELSE}
        StartHintTimer(Pause, tmShow);
{$ENDIF}
      end;
    end;
  end;
end;

procedure TApplication.HintTimerExpired;
var
  P: TPoint;
begin
  StopHintTimer;
  case FTimerMode of
    tmHide:
      HideHint;
    tmShow:
      begin
        GetCursorPos(P);
        ActivateHint(P);
      end;
  end;
end;

procedure TApplication.HideHint;
begin
  if (FHintWindow <> nil) and (FHintWindow.HandleAllocated) then
  begin
    if IsWindowVisible(FHintWindow.Handle) then
      if FHintWindow.ShouldHideHint then
      begin
        ShowWindow(FHintWindow.Handle, SW_HIDE);
        { Keep visible in sync with the actual visible-ness of the property }
        FHintWindow.Visible := False;
      end
      else
      begin
        { Restart the timer, since we want hide hint to be called again }
        StartHintTimer(FHintHidePause, tmHide)
      end;
  end;
end;

procedure TApplication.CancelHint;
begin
{$IF DEFINED(CLR)}
  if FHintControl <> nil then
  begin
    FHintControl := nil;
{$ELSE}
  if InterlockedExchangePointer(Pointer(FHintControl), nil) <> nil then
  begin
{$ENDIF}
    HideHint;
    FHintActive := False;
    UnhookHintHooks;
    StopHintTimer;
  end;
end;

procedure TApplication.ActivateHint(CursorPos: TPoint);
var
  ClientOrigin, ParentOrigin: TPoint;
  HintInfo: Vcl.Controls.THintInfo;
  CanShow: Boolean;
  HintWinRect: TRect;
  Delta: Integer;

  { Return number of scanlines between the scanline containing cursor hotspot
    and the last scanline included in the cursor mask. }
  function GetCursorHeightMargin: Integer;
{$IF DEFINED(CLR)}
  begin
    Result := GetSystemMetrics(SM_CYCURSOR);
  end;
{$ELSE}
  var
    IconInfo: TIconInfo;
    BitmapInfoSize, BitmapBitsSize, ImageSize: DWORD;
    Bitmap: PBitmapInfoHeader;
    Bits: Pointer;
    BytesPerScanline: Integer;

                                                                                                                                 
      function FindScanline(Source: Pointer; MaxLen: Cardinal;
        Value: Cardinal): Cardinal;
{$IFDEF PUREPASCAL}
      var
        P: PByte;
      begin
        P := Source;
        Result := MaxLen;
        while (Result > 0) and (P^ = Value) do
        begin
          Inc(P);
          Dec(Result);
        end;
      end;
{$ELSE !PUREPASCAL}
{$IFDEF CPUX86}
      asm
              PUSH    ECX
              MOV     ECX,EDX
              MOV     EDX,EDI
              MOV     EDI,EAX
              POP     EAX
              REPE    SCASB
              MOV     EAX,ECX
              MOV     EDI,EDX
      end;
{$ENDIF CPUX86}
{$ENDIF !PUREPASCAL}

  begin
    { Default value is entire icon height }
    Result := GetSystemMetrics(SM_CYCURSOR);
    if GetIconInfo(GetCursor, IconInfo) then
    try
      GetDIBSizes(IconInfo.hbmMask, BitmapInfoSize, BitmapBitsSize);
      Bitmap := AllocMem(BitmapInfoSize + BitmapBitsSize);
      try
      Bits := Pointer(PByte(Bitmap) + BitmapInfoSize);
      if GetDIB(IconInfo.hbmMask, 0, Bitmap^, Bits^) and
        (Bitmap^.biBitCount = 1) then
      begin
        { Point Bits to the end of this bottom-up bitmap }
        with Bitmap^ do
        begin
          BytesPerScanline := ((biWidth * biBitCount + 31) and not 31) div 8;
          ImageSize := biWidth * BytesPerScanline;
          Bits := Pointer(PByte(Bits) + BitmapBitsSize - ImageSize);
          { Use the width to determine the height since another mask bitmap
            may immediately follow }
          Result := FindScanline(Bits, ImageSize, $FF);
          { In case the and mask is blank, look for an empty scanline in the
            xor mask. }
          if (Result = 0) and (biHeight >= 2 * biWidth) then
            Result := FindScanline(Pointer(PByte(Bits) - ImageSize),
            ImageSize, $00);
          Result := Result div BytesPerScanline;
        end;
        Dec(Result, IconInfo.yHotSpot);
        Result := System.Math.Max(Result, 1)
      end;
      finally
        FreeMem(Bitmap, BitmapInfoSize + BitmapBitsSize);
      end;
    finally
      if IconInfo.hbmColor <> 0 then DeleteObject(IconInfo.hbmColor);
      if IconInfo.hbmMask <> 0 then DeleteObject(IconInfo.hbmMask);
    end;
  end;
{$ENDIF}

  procedure ValidateHintWindow(HintClass: THintWindowClass);
  begin
    if HintClass = nil then HintClass := HintWindowClass;
    if (FHintWindow = nil) or (FHintWindow.ClassType <> HintClass) then
    begin
      FHintWindow.Free;
      FHintWindow := HintClass.Create(Self);
    end;
  end;

  function MultiLineWidth(const Value: string): Integer;
{$IF DEFINED(CLR)}
  var
    W: Integer;
    P, Start, L: Integer;
    S: string;
  begin
    Result := 0;
    L := Length(Value);
    P := 1;
    if Value <> '' then
      while P <= L do
      begin
        Start := P;
        while (P <= L) and (not (CharInSet(Value[P], [#10, #13]))) do
          Inc(P);
        S := Copy(Value, Start, P - Start);
        W := FHintWindow.Canvas.TextWidth(S);
        if W > Result then
          Result := W;
        if P <= L then
          if Value[P] = WideChar(#13) then Inc(P);
        if P <= L then
          if Value[P] = WideChar(#10) then Inc(P);
      end;
{$ELSE}
  var
    W: Integer;
    P, Start: PChar;
    S: string;
  begin
    Result := 0;
    P := Pointer(Value);
    if P <> nil then
      while P^ <> #0 do
      begin
        Start := P;
        while not CharInSet(P^, [#0, #10, #13]) do
          P := StrNextChar(P);
        SetString(S, Start, P - Start);
        W := FHintWindow.Canvas.TextWidth(S);
        if W > Result then
          Result := W;
        if P^ = #13 then Inc(P);
        if P^ = #10 then Inc(P);
      end;
{$ENDIF}
  end;

{$IF DEFINED(CLR)}
var
  HintInfoMsg: TCMHintInfo;
{$ENDIF}
begin
  FHintActive := False;
  HintInfo.ReshowTimeout := 0;
  if FShowHint and (FHintControl <> nil) and ForegroundTaskCheck(EnumAllWindowsOnActivateHint) and
    (FHintControl = GetHintControl(FindDragTarget(CursorPos, True))) and
    (FHintControl.CustomHint = nil) then
  begin
    HintInfo.HintControl := FHintControl;
    HintInfo.HintPos := CursorPos;
    Inc(HintInfo.HintPos.Y, GetCursorHeightMargin);
    HintInfo.HintMaxWidth := Screen.Width;
    HintInfo.HintColor := FHintColor;
    HintInfo.CursorRect := FHintControl.BoundsRect;
    ClientOrigin := FHintControl.ClientOrigin;
    ParentOrigin.X := 0;
    ParentOrigin.Y := 0;
    if FHintControl.Parent <> nil then
      ParentOrigin := FHintControl.Parent.ClientOrigin
    else if (FHintControl is TWinControl) and
      (TWinControl(FHintControl).ParentWindow <> 0) then
      Winapi.Windows.ClientToScreen(TWinControl(FHintControl).ParentWindow, ParentOrigin);
    OffsetRect(HintInfo.CursorRect, ParentOrigin.X - ClientOrigin.X,
      ParentOrigin.Y - ClientOrigin.Y);
    HintInfo.CursorPos := FHintControl.ScreenToClient(CursorPos);
    HintInfo.HintStr := GetShortHint(GetHint(FHintControl));
    HintInfo.HideTimeout := FHintHidePause;
    HintInfo.HintWindowClass := HintWindowClass;
    HintInfo.HintData := nil;
{$IF DEFINED(CLR)}
    HintInfo.ReshowTimeout := 0;
    HintInfoMsg := TCMHintInfo.Create;
    HintInfoMsg.HintInfo := HintInfo;
    CanShow := FHintControl.Perform(CM_HINTSHOW, HintInfoMsg) = 0;
    HintInfo := HintInfoMsg.HintInfo;
{$ELSE}
    CanShow := FHintControl.Perform(CM_HINTSHOW, 0, Winapi.Windows.LPARAM(@HintInfo)) = 0;
{$ENDIF}
    if CanShow and Assigned(FOnShowHint) then
      FOnShowHint(HintInfo.HintStr, CanShow, HintInfo);
    FHintActive := CanShow and (FHintControl <> nil);
    if FHintActive and (HintInfo.HintStr <> '') then
    begin
      ValidateHintWindow(HintInfo.HintWindowClass);
      { make the hint have the same BiDiMode as the activating control }
      FHintWindow.BiDiMode := FHintControl.BiDiMode;
      { calculate the width of the hint based on HintStr and MaxWidth }
      with HintInfo do
        HintWinRect := FHintWindow.CalcHintRect(HintMaxWidth, HintStr, HintData);
      OffsetRect(HintWinRect, HintInfo.HintPos.X, HintInfo.HintPos.Y);
      if FHintWindow.UseRightToLeftAlignment then
        with HintWinRect do
        begin
          Delta := MultiLineWidth(HintInfo.HintStr) + 5;
          Dec(Left, Delta);
          Dec(Right, Delta);
        end;

      { Convert the client's rect to screen coordinates }
{$IF DEFINED(CLR)}
      with HintInfo, FHintControl do
{$ELSE}
      with HintInfo do
{$ENDIF}
      begin
        FHintCursorRect.TopLeft := FHintControl.ClientToScreen(CursorRect.TopLeft);
        FHintCursorRect.BottomRight := FHintControl.ClientToScreen(CursorRect.BottomRight);
      end;

      FHintWindow.Color := HintInfo.HintColor;
      FHintWindow.ActivateHintData(HintWinRect, HintInfo.HintStr, HintInfo.HintData);
      HookHintHooks;
      if HintInfo.ReshowTimeout > 0 then
        StartHintTimer(HintInfo.ReshowTimeout, tmShow)
      else
        StartHintTimer(HintInfo.HideTimeout, tmHide);
      Exit;
    end;
  end;
  if HintInfo.ReshowTimeout > 0 then
    StartHintTimer(HintInfo.ReshowTimeout, tmShow)
  else
    CancelHint;
end;

procedure TApplication.ApplyBiDiKeyboardLayout;
begin
  FBiDiKeyboard.ApplyBiDiKeyboardLayout;
end;

procedure TApplication.ApplyNonBiDiKeyboardLayout;
begin
  FBiDiKeyboard.ApplyNonBiDiKeyboardLayout;
end;

function TApplication.AddPopupForm(APopupForm: TCustomForm): Integer;
var
  I: Integer;
begin
  I := Low(FPopupForms);
  while I < Length(FPopupForms) do
  begin
    if FPopupForms[I].Form = APopupForm then
    begin
      Result := FPopupForms[I].FormID;
      Exit;
    end else if FPopupForms[I].FormID = -1 then
      Break;
    Inc(I);
  end;
  Result := FCurrentPopupID;
  Inc(FCurrentPopupID);
  if I >= Length(FPopupForms) then
  begin
    I := Length(FPopupForms);
    SetLength(FPopupForms, I + 1);
  end;
  FPopupForms[I].FormID := Result;
  FPopupForms[I].Form := APopupForm;
  FPopupForms[I].WasPopup := APopupForm.FInternalPopupParentWnd <> 0;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TApplication.GetCurrentHelpFile: string;
var
  ActiveForm: TCustomForm;
begin
  ActiveForm := Screen.ActiveCustomForm;
  if Assigned(ActiveForm) and (ActiveForm.FHelpFile <> '') then
    Result := ActiveForm.HelpFile
  else
    Result := HelpFile;
end;

function TApplication.GetDialogHandle: HWND;
begin
  if not FHandleCreated then
    Result := SendMessage(Handle, CM_DIALOGHANDLE, 1, 0)
  else
    Result := FDialogHandle;
end;

procedure TApplication.SetDialogHandle(Value: HWND);
begin
  if not FHandleCreated then
    SendMessage(Handle, CM_DIALOGHANDLE, 0, Value);
  FDialogHandle := Value;
end;

function TApplication.GetActiveFormHandle: HWND;
begin
  Result := 0;
  if Assigned(FOnGetActiveFormHandle) then
    FOnGetActiveFormHandle(Result);
  if Result = 0 then
    Result := GetActiveWindow;
  if Result = 0 then
    Result := GetLastActivePopup(Handle);
end;

function TApplication.GetMainFormHandle: HWND;
begin
  Result := 0;
  if Assigned(FOnGetMainFormHandle) then
    FOnGetMainFormHandle(Result);
  if (Result = 0) and Assigned(FMainForm) then
    Result := FMainForm.Handle;
end;

{$IF DEFINED(CLR)}
function TApplication.DispatchActionCall(Execute: Boolean; Action: TBasicAction): Boolean;
var
  Form: TCustomForm;
begin
  Result := False;
  Form := Screen.ActiveForm;
  if Form <> nil then
  begin
    if Execute then
      Result := Form.ActionExecute(Action) or
        (MainForm <> Form) and (MainForm <> nil) and
        MainForm.ActionExecute(Action)
    else
      Result := Form.ActionUpdate(Action) or
        (MainForm <> Form) and (MainForm <> nil) and
        MainForm.ActionUpdate(Action)
  end;
end;
{$ENDIF}

{$IF DEFINED(CLR)}
function TApplication.DispatchAction(Execute: Boolean; Action: TBasicAction): Boolean;
begin
  Result := DispatchActionCall(Execute, Action);
  { Disable action if no "user" handler is available }
  if not Result and (Action is TCustomAction) and TCustomAction(Action).Enabled and
      TCustomAction(Action).DisableIfNoHandler then
    TCustomAction(Action).Enabled := Assigned(Action.OnExecute);
end;
{$ELSE}
function TApplication.DispatchAction(Msg: Longint; Action: TBasicAction): Boolean;
var
  Form: TCustomForm;
begin
  Form := Screen.ActiveCustomForm;
  Result := (Form <> nil) and (Form.Perform(Msg, 0, Winapi.Windows.LPARAM(Action)) = 1) or
    (MainForm <> Form) and (MainForm <> nil) and
    (MainForm.Perform(Msg, 0, Winapi.Windows.LPARAM(Action)) = 1);
  { Disable action if no "user" handler is available }
  if not Result and (Action is TCustomAction) and TCustomAction(Action).Enabled and
     TCustomAction(Action).DisableIfNoHandler and
     not (csDesigning in Action.ComponentState) then
    TCustomAction(Action).Enabled := Assigned(Action.OnExecute);
end;
{$ENDIF}

{$IF DEFINED(CLR)}
function TApplication.DispatchAction(Execute: Boolean; Action: TBasicAction; EnabledCheck: Boolean): Boolean;
begin
  if EnabledCheck then
    Result := DispatchAction(Execute, Action)
  else
    Result := DispatchActionCall(Execute, Action);
end;
{$ENDIF}

function TApplication.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := False;
  if Assigned(FOnActionExecute) then FOnActionExecute(Action, Result);
end;

function TApplication.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := False;
  if Assigned(FOnActionUpdate) then FOnActionUpdate(Action, Result);
end;

procedure InitProcs;
var
  ModH: HMODULE;
begin
  ModH := GetModuleHandle(User32);
  if ModH <> 0 then
{$IF DEFINED(CLR)}
    BindProcAddress(SetLayeredWindowAttributes, TypeOf(TSetLayeredWindowAttributes),
      ModH, 'SetLayeredWindowAttributes');
    SupportsLayeredWindowAttributes := Assigned(SetLayeredWindowAttributes);
{$ELSE}
    @SetLayeredWindowAttributes := GetProcAddress(ModH, 'SetLayeredWindowAttributes');
{$ENDIF}
end;

procedure TApplication.WakeMainThread(Sender: TObject);
begin
  PostMessage(Handle, WM_NULL, 0, 0);
end;

procedure TApplication.HookSynchronizeWakeup;
begin
  System.Classes.WakeMainThread := WakeMainThread;
end;

procedure TApplication.UnhookSynchronizeWakeup;
begin
  System.Classes.WakeMainThread := nil;
end;

[SecurityPermission(SecurityAction.LinkDemand, UnmanagedCode=True)]
function TApplication.IsPreProcessMessage(var Msg: TMsg): Boolean;
var
  Wnd: HWND;
  Control: TWinControl;
begin
  Result := False;
  Wnd := GetCapture;
  if Wnd = 0 then
  begin
    Wnd := Msg.hwnd;
    if (MainForm <> nil) and (Wnd = MainForm.ClientHandle) then
      Control := MainForm
    else
    begin
      Control := FindControl(Wnd);
      while Control = nil do
      begin
        Wnd := GetParent(Wnd);
        if Wnd <> 0 then
          Control := FindControl(Wnd)
        else
          Break;
      end;
    end;
    if Control <> nil then
      Result := Control.PreProcessMessage(Msg);
  end;
end;

// Allow a MainForm which is functioning as the TaskBar button for the application
// to properly handle restoring the application
procedure TApplication.InternalRestore;
begin
  FAppIconic := False;
  if (Screen.ActiveForm <> FMainForm) and (FMainForm <> nil) and (FMainForm.FormStyle <> fsMDIForm) then
    ShowWinNoAnimate(FMainForm.Handle, SW_RESTORE);
  SetActiveWindow(Handle);
  RestoreWindowStateBeforeMinimize(FMainForm.Handle, False);
  RestoreTopMosts;
  DoShowOwnedPopups(True);
  if Screen.ActiveControl <> nil then
    Winapi.Windows.SetFocus(Screen.ActiveControl.Handle);
  if Assigned(FOnRestore) then FOnRestore(Self);
end;

procedure TApplication.SetMainFormOnTaskBar(const Value: Boolean);
var
  ActivateFrm: Boolean;
begin
  if Value <> FMainFormOnTaskBar then
  begin
    FMainFormOnTaskBar := Value;
    if (FMainForm <> nil) and FMainForm.HandleAllocated and
       not (csDesigning in FMainForm.ComponentState) and
       not (csReading in FMainForm.ComponentState) then
    begin
      if Value then
      begin
        ChangeAppWindow(Handle, False, False);
        ChangeAppWindow(FMainForm.Handle, True, FMainForm.Visible);
      end
      else
      begin
        ActivateFrm := GetForeGroundWindow = FMainForm.Handle;
        ChangeAppWindow(FMainForm.Handle, False, FMainForm.Visible);
        // Restore the TApplication window's taskbar style
        ChangeAppWindow(Handle, True, True);
        if ActivateFrm then
          SetForeGroundWindow(FMainForm.Handle);
      end;
      // Recreate Main form to ensure correct owner
      FMainForm.Perform(CM_RECREATEWND, 0, 0);
    end;

    // Prevent TApplication Window from appearing in Task Manager's Application list
    if Value then
    begin
      SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) or WS_EX_TOOLWINDOW);
      SetWindowText(Handle, nil)
    end
    else
    begin
      SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle, GWL_EXSTYLE) and not WS_EX_TOOLWINDOW);
      SetWindowText(Handle, FTitle);
    end;
  end;
end;

{ TGlassFrame }

constructor TGlassFrame.Create(Client: TCustomForm);
begin
  inherited Create;
  FClient := Client;
  FLeft := 0;
  FTop := 0;
  FRight := 0;
  FBottom := 0;
  FSheetOfGlass := False;
end;

procedure TGlassFrame.Assign(Source: TPersistent);
begin
  if Source is TGlassFrame then
  begin
    FEnabled := TGlassFrame(Source).Enabled;
    FLeft := TGlassFrame(Source).Left;
    FTop := TGlassFrame(Source).Top;
    FRight := TGlassFrame(Source).Right;
    FBottom := TGlassFrame(Source).Bottom;
    FSheetOfGlass := TGlassFrame(Source).SheetOfGlass;
    Change;
  end else
    inherited Assign(Source);
end;

procedure TGlassFrame.Change;
begin
  if not (csLoading in FClient.ComponentState) then
  begin
    if Assigned(FOnChange) then
      FOnChange(Self);
    FClient.UpdateGlassFrameControls(System.Types.Rect(Left, Top,
      FClient.ClientWidth - Right, FClient.ClientHeight - Bottom));
  end;
end;

function TGlassFrame.FrameExtended: Boolean;
begin
  Result := FEnabled and DwmCompositionEnabled and TStyleManager.ActiveStyle.IsSystemStyle and
    (FSheetOfGlass or (Left <> 0) or (Top <> 0) or (Right <> 0) or (Bottom <> 0));
end;

function TGlassFrame.IntersectsControl(Control: TControl): Boolean;
var
  ControlRect: TRect;
  NonGlassRect: TRect;
begin
  Result := False;
  if FEnabled and DwmCompositionEnabled then
  begin
    Result := FSheetOfGlass;
    if not Result then
    begin
      ControlRect := Control.ClientRect;
      ControlRect.TopLeft := Control.ClientToParent(ControlRect.TopLeft, FClient);
      ControlRect.BottomRight := Control.ClientToParent(ControlRect.BottomRight, FClient);
      NonGlassRect := FClient.ClientRect;
      NonGlassRect := Rect(FLeft, FTop, NonGlassRect.Right - FRight,
        NonGlassRect.Bottom - FBottom);
      Result := not (NonGlassRect.Contains(ControlRect.TopLeft) and
        NonGlassRect.Contains(ControlRect.BottomRight));
    end;
  end;
end;

procedure TGlassFrame.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    if FEnabled and FClient.TransparentColor then
      FClient.TransparentColor := False;  // GlassFrame and TransparentColor are mutually exclusive
    Change;
  end;
end;

procedure TGlassFrame.SetExtendedFrame(Index: Integer; Value: Integer);
begin
  case Index of
    0:
      if Value <> FLeft then
      begin
        FLeft := Value;
        if Value = -1 then
          FSheetOfGlass := True;
      end;
    1:
      if Value <> FTop then
      begin
        FTop := Value;
        if Value = -1 then
          FSheetOfGlass := True;
      end;
    2:
      if Value <> FRight then
      begin
        FRight := Value;
        if Value = -1 then
          FSheetOfGlass := True;
      end;
    3:
      if Value <> FBottom then
      begin
        FBottom := Value;
        if Value = -1 then
          FSheetOfGlass := True;
      end;
    else
      Exit;
  end;
  Change;
end;

procedure TGlassFrame.SetSheetOfGlass(Value: Boolean);
begin
  if (Value <> FSheetOfGlass) and not
     (FSheetOfGlass and ((FLeft = -1) or (FTop = -1) or (FRight = -1) or (FBottom = -1))) then
  begin
    FSheetOfGlass := Value;
    Change;
  end;
end;

{ TScrollingStyleHook.TScrollWindow }

constructor TScrollingStyleHook.TScrollWindow.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle := ControlStyle + [csOverrideStylePaint];
  FStyleHook := nil;
end;

procedure TScrollingStyleHook.TScrollWindow.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style or WS_CHILDWINDOW or WS_CLIPCHILDREN or WS_CLIPSIBLINGS;
  Params.ExStyle := Params.ExStyle or WS_EX_NOPARENTNOTIFY;
  Params.WindowClass.style := Params.WindowClass.style;
  if (FStyleHook <> nil) and FStyleHook.IsPopupWindow then
    Params.ExStyle := Params.ExStyle or WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
end;

procedure TScrollingStyleHook.TScrollWindow.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  Msg.Result := HTTRANSPARENT;
end;

procedure TScrollingStyleHook.TScrollWindow.WMPaint(var Msg: TWMPaint);
var
  PS: TPaintStruct;
  DC: HDC;
begin
  BeginPaint(Handle, PS);
  try
    if (FStyleHook <> nil) and
       (FStyleHook.Control.Width > 0) and
       (FStyleHook.Control.Height > 0) then
    begin
      DC := GetWindowDC(Handle);
      try
        if FVertical then
        begin
          with FStyleHook.VertScrollRect do
            MoveWindowOrg(DC, -Left, -Top);
          FStyleHook.DrawVertScroll(DC);
        end
        else
        begin
          with FStyleHook.HorzScrollRect do
            MoveWindowOrg(DC, -Left, -Top);
          FStyleHook.DrawHorzScroll(DC);
        end;
      finally
        ReleaseDC(Handle, DC);
      end;
    end;
  finally
    EndPaint(Handle, PS);
  end;
end;

procedure TScrollingStyleHook.TScrollWindow.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

procedure TScrollingStyleHook.TScrollWindow.WMEraseBkgnd(var Msg: TMessage);
begin
  Msg.Result := 1;
end;

{ TScrollingStyleHook }

constructor TScrollingStyleHook.Create(AControl: TWinControl);
begin
  inherited;
  OverridePaintNC := True;
  FVertScrollWnd := nil;
  FHorzScrollWnd := nil;
  FInitingScrollBars := False;
end;

destructor TScrollingStyleHook.Destroy;
begin
  FInitingScrollBars := True;
  if FVertScrollWnd <> nil then
  begin
    FVertScrollWnd.StyleHook := nil;
    FreeAndNil(FVertScrollWnd);
  end;
  if FHorzScrollWnd <> nil then
  begin
    FHorzScrollWnd.StyleHook := nil;
    FreeAndNil(FHorzScrollWnd);
  end;
  FInitingScrollBars := False;
  inherited;
end;

function TScrollingStyleHook.IsPopupWindow;
begin
  Result := (GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_TOOLWINDOW = WS_EX_TOOLWINDOW) or
            (GetWindowLong(Handle, GWL_STYLE) and WS_POPUP = WS_POPUP);
end;

procedure TScrollingStyleHook.InitScrollBars;
var
  R, WRect: TRect;
begin
  if FInitingScrollBars then Exit;

  FInitingScrollBars := True;

  InitScrollState;

  FVertScrollWnd := TScrollWindow.CreateParented(GetParent(Control.Handle));
  FVertScrollWnd.StyleHook := Self;
  FVertScrollWnd.Vertical := True;
  R := VertScrollRect;
  if (Control.BiDiMode = bdRightToLeft) and not IsRectEmpty(R) then
  begin
    OffsetRect(R, -R.Left, 0);
    if HasBorder then
      if HasClientEdge then
        OffsetRect(R, 2, 0)
      else
        OffsetRect(R, 1, 0);
  end;
  with R do
   if IsPopupWindow then
   begin
     WinApi.Windows.GetWindowRect(Control.Handle, WRect);
     SetWindowPos(FVertScrollWnd.Handle, HWND_TOPMOST,
       WRect.Left + Left,WRect.Top + Top,
         Right - Left, Bottom - Top, SWP_NOREDRAW);
   end
   else
     SetWindowPos(FVertScrollWnd.Handle, HWND_TOP, Control.Left + Left, Control.Top + Top,
       Right - Left, Bottom - Top, SWP_NOREDRAW);

  if IsRectEmpty(VertScrollRect) then
    ShowWindow(FVertScrollWnd.Handle, SW_HIDE)
  else
    ShowWindow(FVertScrollWnd.Handle, SW_SHOW);

  FHorzScrollWnd := TScrollWindow.CreateParented(GetParent(Control.Handle));
  FHorzScrollWnd.StyleHook := Self;
  FHorzScrollWnd.Vertical := False;

  R := HorzScrollRect;
  if (Control.BiDiMode = bdRightToLeft) and not IsRectEmpty(VertScrollRect) then
    OffsetRect(R, VertScrollRect.Width, 0);
  with R do
    if IsPopupWindow then
    begin
      WinApi.Windows.GetWindowRect(Control.Handle, WRect);
      SetWindowPos(FHorzScrollWnd.Handle, HWND_TOPMOST,
        WRect.Left + Left, WRect.Top + Top,
          Right - Left, Bottom - Top, SWP_NOREDRAW);
    end
    else
      SetWindowPos(FHorzScrollWnd.Handle, HWND_TOP, Control.Left + Left, Control.Top + Top,
        Right - Left, Bottom - Top, SWP_NOREDRAW);

  if IsRectEmpty(HorzScrollRect) then
    ShowWindow(FHorzScrollWnd.Handle, SW_HIDE)
  else
    ShowWindow(FHorzScrollWnd.Handle, SW_SHOW);

  FInitingScrollBars := False;
end;


procedure TScrollingStyleHook.MouseLeave;
begin
  inherited;
  if VertSliderState = tsThumbBtnVertHot then
    FVertSliderState := tsThumbBtnVertNormal;

  if FHorzSliderState = tsThumbBtnHorzHot then
    FHorzSliderState := tsThumbBtnHorzNormal;

  if FVertUpState = tsArrowBtnUpHot then
    FVertUpState := tsArrowBtnUpNormal;

  if FVertDownState = tsArrowBtnDownHot then
    FVertDownState := tsArrowBtnDownNormal;

  if FHorzUpState = tsArrowBtnLeftHot then
    FHorzUpState := tsArrowBtnLeftNormal;

  if FHorzDownState = tsArrowBtnRightHot then
    FHorzDownState := tsArrowBtnRightNormal;

  PaintScroll;
end;

procedure TScrollingStyleHook.PaintNC(Canvas: TCanvas);
begin
  if FInitingScrollBars then Exit;
  inherited;
  DrawBorder;
  if FVertScrollWnd = nil then
    InitScrollBars;
  UpdateScroll;
  PaintScroll;
end;

procedure TScrollingStyleHook.InitScrollState;
begin
  FVertSliderState := tsThumbBtnVertNormal;
  FVertUpState := tsArrowBtnUpNormal;
  FVertDownState := tsArrowBtnDownNormal;
  FHorzSliderState := tsThumbBtnHorzNormal;
  FHorzUpState := tsArrowBtnLeftNormal;
  FHorzDownState := tsArrowBtnRightNormal;
end;

procedure TScrollingStyleHook.UpdateScroll;
var
  R, WRect: TRect;
begin
  if ((FVertScrollWnd <> nil) and not FVertScrollWnd.HandleAllocated) or
     ((FHorzScrollWnd <> nil) and not FHorzScrollWnd.HandleAllocated)
   then
  begin
    if FVertScrollWnd <> nil then
      FreeAndNil(FVertScrollWnd);
    if FHorzScrollWnd <> nil then
      FreeAndNil(FHorzScrollWnd);
    InitScrollBars;
    Exit;
  end;
  if (FVertScrollWnd <> nil) and FVertScrollWnd.HandleAllocated then
  begin
    R := VertScrollRect;
    if (Control.BiDiMode = bdRightToLeft) and not IsRectEmpty(R) then
    begin
      OffsetRect(R, -R.Left, 0);
      if HasBorder then
        if HasClientEdge then
          OffsetRect(R, 2, 0)
        else
          OffsetRect(R, 1, 0);
    end;

    if IsRectEmpty(R) then
      ShowWindow(FVertScrollWnd.Handle, SW_HIDE)
    else
    begin
      ShowWindow(FVertScrollWnd.Handle, SW_SHOW);
      with R do
        if IsPopupWindow then
        begin
          WinApi.Windows.GetWindowRect(Control.Handle, WRect);
          SetWindowPos(FVertScrollWnd.Handle, HWND_TOPMOST,
            WRect.Left + Left, WRect.Top + Top,
              Right - Left, Bottom - Top, SWP_SHOWWINDOW);
        end
        else
          SetWindowPos(FVertScrollWnd.Handle, HWND_TOP, Control.Left + Left,
           Control.Top + Top, Right - Left, Bottom - Top, SWP_SHOWWINDOW);
    end
  end;
  if (FHorzScrollWnd <> nil) and FHorzScrollWnd.HandleAllocated then
  begin
    R := HorzScrollRect;
    if (Control.BiDiMode = bdRightToLeft) and not IsRectEmpty(VertScrollRect) then
      OffsetRect(R, VertScrollRect.Width, 0);
    if IsRectEmpty(R) then
      ShowWindow(FHorzScrollWnd.Handle, SW_HIDE)
    else
    begin
      ShowWindow(FHorzScrollWnd.Handle, SW_SHOW);
      with R do
        if IsPopupWindow then
        begin
          WinApi.Windows.GetWindowRect(Control.Handle, WRect);
          SetWindowPos(FHorzScrollWnd.Handle, HWND_TOPMOST, WRect.Left + Left,
            WRect.Top + Top, Right - Left, Bottom - Top, SWP_SHOWWINDOW);
        end
        else
          SetWindowPos(FHorzScrollWnd.Handle, HWND_TOP, Control.Left + Left,
            Control.Top + Top, Right - Left, Bottom - Top, SWP_SHOWWINDOW);
    end;
  end;
end;

procedure TScrollingStyleHook.DrawVertScroll(DC: HDC);
var
  B: TBitmap;
  Details: TThemedElementDetails;
  R: TRect;
begin
  if Handle = 0 then Exit;
  if DC = 0 then Exit;

  if (VertScrollRect.Width > 0) and (VertScrollRect.Height > 0) then
  begin
    B := TBitmap.Create;
    try
      B.Width := VertScrollRect.Width;
      B.Height := VertScrollRect.Height;
      MoveWindowOrg(B.Canvas.Handle, -VertScrollRect.Left, -VertScrollRect.Top);
      if StyleServices.Available then
      begin
        R := VertScrollRect;
        R.Top := VertUpButtonRect.Bottom;
        R.Bottom := VertDownButtonRect.Top;
        if (R.Height > 0) and (R.Width > 0) then
        begin
          Details := StyleServices.GetElementDetails(tsUpperTrackVertNormal);
          StyleServices.DrawElement(B.Canvas.Handle, Details, R);
        end;

        if (VertSliderRect.Height > 0) and (VertSliderRect.Width > 0) then
        begin
          Details := StyleServices.GetElementDetails(VertSliderState);
          StyleServices.DrawElement(B.Canvas.Handle, Details, VertSliderRect);
        end;

        if VertSliderRect.Height <> 0 then
          Details := StyleServices.GetElementDetails(FVertUpState)
        else
          Details := StyleServices.GetElementDetails(tsArrowBtnUpDisabled);
        StyleServices.DrawElement(B.Canvas.Handle, Details, VertUpButtonRect);

        if VertSliderRect.Height <> 0 then
          Details := StyleServices.GetElementDetails(FVertDownState)
        else
          Details := StyleServices.GetElementDetails(tsArrowBtnDownDisabled);
        StyleServices.DrawElement(B.Canvas.Handle, Details, VertDownButtonRect);
      end;
      MoveWindowOrg(B.Canvas.Handle, VertScrollRect.Left, VertScrollRect.Top);
      with VertScrollRect do
        BitBlt(DC, Left, Top, B.Width, B.Height, B.Canvas.Handle, 0, 0, SRCCOPY);
    finally
      B.Free;
    end;
  end;
end;

procedure TScrollingStyleHook.DrawHorzScroll(DC: HDC);
var
  B: TBitmap;
  Details: TThemedElementDetails;
  R: TRect;
begin
  if Handle = 0 then Exit;
  if DC = 0 then Exit;

  if (HorzScrollRect.Height > 0) and (HorzScrollRect.Width > 0) then
  begin
    B := TBitmap.Create;
    try
      B.Width := HorzScrollRect.Width;
      B.Height := HorzScrollRect.Height;
      MoveWindowOrg(B.Canvas.Handle, -HorzScrollRect.Left, -HorzScrollRect.Top);
      if StyleServices.Available then
      begin
        R := HorzScrollRect;
        R.Left := HorzUpButtonRect.Right;
        R.Right := HorzDownButtonRect.Left;
        if (R.Height > 0) and (R.Width > 0) then
        begin
          Details := StyleServices.GetElementDetails(tsUpperTrackHorzNormal);
          StyleServices.DrawElement(B.Canvas.Handle, Details, R);
        end;

        if (HorzSliderRect.Height > 0) and (HorzSliderRect.Width > 0) then
        begin
          Details := StyleServices.GetElementDetails(FHorzSliderState);
          StyleServices.DrawElement(B.Canvas.Handle, Details, HorzSliderRect);
        end;

        if HorzSliderRect.Height > 0 then
          Details := StyleServices.GetElementDetails(FHorzUpState)
        else
          Details := StyleServices.GetElementDetails(tsArrowBtnLeftDisabled);
        StyleServices.DrawElement(B.Canvas.Handle, Details, HorzUpButtonRect);

        if HorzSliderRect.Height > 0 then
          Details := StyleServices.GetElementDetails(FHorzDownState)
        else
          Details := StyleServices.GetElementDetails(tsArrowBtnRightDisabled);
        StyleServices.DrawElement(B.Canvas.Handle, Details, HorzDownButtonRect);
      end;
      MoveWindowOrg(B.Canvas.Handle, HorzScrollRect.Left, HorzScrollRect.Top);
      with HorzScrollRect do
        BitBlt(DC, Left, Top, B.Width, B.Height,
          B.Canvas.Handle, 0, 0, SRCCOPY);
    finally
      B.Free;
    end;
  end;
end;

function TScrollingStyleHook.GetVertDownButtonRect: TRect;
begin
  Result := VertScrollRect;
  if Result.Height > 0 then
    Result.Top := Result.Bottom - Min(GetSystemMetrics(SM_CYVTHUMB), Result.Height div 2)
  else
    Result := Rect(0, 0, 0, 0);
end;

function TScrollingStyleHook.GetVertScrollRect: TRect;
var
  P: TPoint;
  BarInfo: TScrollBarInfo;
begin
  BarInfo.cbSize := SizeOf(BarInfo);
  GetScrollBarInfo(Handle, Integer(OBJID_VSCROLL), BarInfo);
  if STATE_SYSTEM_INVISIBLE and BarInfo.rgstate[0] <> 0 then
    Result := Rect(0, 0, 0, 0)
  else
  begin
    P := BarInfo.rcScrollBar.TopLeft;
    ScreenToClient(Handle, P);
    Result.TopLeft := P;
    P := BarInfo.rcScrollBar.BottomRight;
    ScreenToClient(Handle, P);
    P.X := Result.Left + GetSystemMetrics(SM_CXVSCROLL);
    Result.BottomRight := P;
    if HasBorder then
      if HasClientEdge then
         OffsetRect(Result, 2, 2)
       else
         OffsetRect(Result, 1, 1);
  end;
end;

function TScrollingStyleHook.GetVertSliderRect: TRect;
var
  P: TPoint;
  BarInfo: TScrollBarInfo;
  ThumbSize, ScrollSize, MinSize: Integer;
  SizeRatio: Single;
  SF: TScrollInfo;
begin
  BarInfo.cbSize := SizeOf(BarInfo);
  GetScrollBarInfo(Handle, Integer(OBJID_VSCROLL), BarInfo);
  if (STATE_SYSTEM_INVISIBLE and BarInfo.rgstate[0] <> 0) or
     (STATE_SYSTEM_UNAVAILABLE and BarInfo.rgstate[0] <> 0) then
    Result := Rect(0, 0, 0, 0)
  else
  begin
    P := BarInfo.rcScrollBar.TopLeft;
    ScreenToClient(Handle, P);
    Result.TopLeft := P;
    P := BarInfo.rcScrollBar.BottomRight;
    ScreenToClient(Handle, P);
    ThumbSize := GetSystemMetrics(SM_CXHTHUMB);
    P.X := Result.Left + ThumbSize;
    Result.BottomRight := P;
    Result.Top := BarInfo.xyThumbTop + 0;
    Result.Bottom := BarInfo.xyThumbBottom + 0;
    if HasBorder then
      if HasClientEdge then
        OffsetRect(Result, 2, 2)
      else
        OffsetRect(Result, 1, 1);

    if ThumbSize <> BarInfo.rcScrollBar.Width then
    begin
      SF.fMask := SIF_ALL;
      SF.cbSize := SizeOf(SF);
      GetScrollInfo(Handle, SB_VERT, SF);
      if SF.nPage = 0 then
      begin
        ScrollSize := VertScrollRect.Height - BarInfo.rcScrollBar.Width * 3;
        if ScrollSize > 0 then
        begin
          SizeRatio := (Result.Top - VertScrollRect.Top - BarInfo.rcScrollBar.Width) / ScrollSize;
          Result.Top := VertTrackRect.Top + Trunc((VertTrackRect.Height - ThumbSize) * SizeRatio);
          Result.Bottom := Result.Top + ThumbSize;
        end;
      end
      else
      begin
        ScrollSize := VertScrollRect.Height - BarInfo.rcScrollBar.Width * 2;
        if ScrollSize > 0 then
        begin
          SizeRatio := VertTrackRect.Height / ScrollSize;
          ThumbSize := Trunc(Result.Height * SizeRatio);
          MinSize := GetSystemMetrics(SM_CXHTHUMB) div 2;
          if ThumbSize < MinSize then
          begin
            ThumbSize := MinSize;
            ScrollSize := ScrollSize - Result.Height;
            if ScrollSize > 0 then
            begin
              SizeRatio := (Result.Top - VertScrollRect.Top - BarInfo.rcScrollBar.Width) / ScrollSize;
              Result.Top := VertTrackRect.Top + Trunc((VertTrackRect.Height - ThumbSize) * SizeRatio);
              Result.Bottom := Result.Top + ThumbSize;
            end;
          end
          else
          begin
            SizeRatio := (Result.Top - VertScrollRect.Top - BarInfo.rcScrollBar.Width) / ScrollSize;
            Result.Top := VertTrackRect.Top + Trunc(VertTrackRect.Height * SizeRatio);
            Result.Bottom := Result.Top + ThumbSize;
          end;
        end;
      end;
    end;

  end;
end;

function TScrollingStyleHook.GetVertTrackRect: TRect;
begin
  Result := VertScrollRect;
  if Result.Width > 0 then
  begin
    Result.Top := Result.Top + GetSystemMetrics(SM_CYVTHUMB);
    Result.Bottom := Result.Bottom - GetSystemMetrics(SM_CYVTHUMB);
  end
  else
    Result := Rect(0, 0, 0, 0);
end;

function TScrollingStyleHook.GetVertUpButtonRect: TRect;
begin
  Result := VertScrollRect;
  if Result.Height > 0 then
    Result.Bottom := Result.Top + Min(GetSystemMetrics(SM_CYVTHUMB), Result.Height div 2)
  else
    Result := Rect(0, 0, 0, 0);
end;

function TScrollingStyleHook.GetHorzDownButtonRect: TRect;
begin
  Result := HorzScrollRect;
  if Result.Width > 0 then
    Result.Left := Result.Right - Min(GetSystemMetrics(SM_CXHTHUMB), Result.Width div 2)
  else
    Result := Rect(0, 0, 0, 0);
end;

function TScrollingStyleHook.GetHorzScrollRect: TRect;
var
  P: TPoint;
  BarInfo: TScrollBarInfo;
begin
  BarInfo.cbSize := SizeOf(BarInfo);
  GetScrollBarInfo(Handle, Integer(OBJID_HSCROLL), BarInfo);
  if STATE_SYSTEM_INVISIBLE and BarInfo.rgstate[0] <> 0 then
    Result := Rect(0, 0, 0, 0)
  else
  begin
    P := BarInfo.rcScrollBar.TopLeft;
    ScreenToClient(Handle, P);
    Result.TopLeft := P;
    P := BarInfo.rcScrollBar.BottomRight;
    ScreenToClient(Handle, P);
    P.Y := Result.Top + GetSystemMetrics(SM_CYHSCROLL);
    Result.BottomRight := P;
    if HasBorder then
      if HasClientEdge then
        OffsetRect(Result, 2, 2)
      else
        OffsetRect(Result, 1, 1);
  end;
end;

function TScrollingStyleHook.GetHorzSliderRect: TRect;
var
  P: TPoint;
  BarInfo: TScrollBarInfo;
  ThumbSize, ScrollSize, MinSize: Integer;
  SizeRatio: Single;
  SF: TScrollInfo;
begin
  BarInfo.cbSize := SizeOf(BarInfo);
  GetScrollBarInfo(Handle, Integer(OBJID_HSCROLL), BarInfo);
  if (STATE_SYSTEM_INVISIBLE and BarInfo.rgstate[0] <> 0) or
     (STATE_SYSTEM_UNAVAILABLE and BarInfo.rgstate[0] <> 0) then
    Result := TRect.Create(0, 0, 0, 0)
  else
  begin
    P := BarInfo.rcScrollBar.TopLeft;
    ScreenToClient(Handle, P);
    Result.TopLeft := P;
    P := BarInfo.rcScrollBar.BottomRight;
    ScreenToClient(Handle, P);
    ThumbSize := GetSystemMetrics(SM_CYVTHUMB);
    P.Y := Result.Top + ThumbSize;
    Result.BottomRight := P;
    Result.Left := BarInfo.xyThumbTop + 0;
    Result.Right := BarInfo.xyThumbBottom + 0;
    if HasBorder then
      if HasClientEdge then
        OffsetRect(Result, 2, 2)
      else
        OffsetRect(Result, 1, 1);

    if ThumbSize <> BarInfo.rcScrollBar.Height then
    begin
      SF.fMask := SIF_ALL;
      SF.cbSize := SizeOf(SF);
      GetScrollInfo(Handle, SB_HORZ, SF);
      if SF.nPage = 0 then
      begin
        ScrollSize := HorzScrollRect.Width - BarInfo.rcScrollBar.Height * 3;
        if ScrollSize > 0 then
        begin
          SizeRatio := (Result.Left - HorzScrollRect.Left - BarInfo.rcScrollBar.Height) / ScrollSize;
          Result.Left := HorzTrackRect.Left + Trunc((HorzTrackRect.Width - ThumbSize) * SizeRatio);
          Result.Right := Result.Left + ThumbSize;
        end;
      end
      else
      begin
        ScrollSize := HorzScrollRect.Width - BarInfo.rcScrollBar.Height * 2;
        if ScrollSize > 0 then
        begin
          SizeRatio := HorzTrackRect.Width / ScrollSize;
          ThumbSize := Trunc(Result.Width * SizeRatio);
          MinSize := GetSystemMetrics(SM_CYVTHUMB) div 2;
          if ThumbSize < MinSize then
          begin
            ThumbSize := MinSize;
            ScrollSize := ScrollSize - Result.Width;
            if ScrollSize > 0 then
            begin
              SizeRatio := (Result.Left - HorzScrollRect.Left - BarInfo.rcScrollBar.Height) / ScrollSize;
              Result.Left := HorzTrackRect.Left + Trunc((HorzTrackRect.Width - ThumbSize) * SizeRatio);
              Result.Right := Result.Left + ThumbSize;
            end;
          end
          else
          begin
            SizeRatio := (Result.Left - HorzScrollRect.Left - BarInfo.rcScrollBar.Height) / ScrollSize;
            Result.Left := HorzTrackRect.Left + Trunc(HorzTrackRect.Width * SizeRatio);
            Result.Right := Result.Left + ThumbSize;
          end;
        end;
      end;
    end;

  end;
end;

function TScrollingStyleHook.GetHorzTrackRect: TRect;
begin
  Result := HorzScrollRect;
  if Result.Width > 0 then
  begin
    Result.Left := Result.Left + GetSystemMetrics(SM_CXHTHUMB);
    Result.Right := Result.Right - GetSystemMetrics(SM_CXHTHUMB);
  end
  else
    Result := Rect(0, 0, 0, 0);
end;

function TScrollingStyleHook.GetHorzUpButtonRect: TRect;
begin
  Result := HorzScrollRect;
  if Result.Width > 0 then
    Result.Right := Result.Left + Min(GetSystemMetrics(SM_CXHTHUMB), Result.Width div 2)
  else
    Result := Rect(0, 0, 0, 0);
end;

procedure TScrollingStyleHook.DrawBorder;
begin
  if StyleServices.Available then
    StyleServices.PaintBorder(Control, True);
end;

procedure TScrollingStyleHook.PaintScroll;
begin
  if FInitingScrollBars then Exit;
  if FVertScrollWnd <> nil then
    FVertScrollWnd.Repaint;
  if FHorzScrollWnd <> nil then
    FHorzScrollWnd.Repaint;
end;

procedure TScrollingStyleHook.WMHScroll(var Msg: TMessage);
begin
  CallDefaultProc(TMessage(Msg));
  PaintScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.WMVScroll(var Msg: TMessage);
begin
  CallDefaultProc(TMessage(Msg));
  PaintScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.WMMouseWheel(var Msg: TMessage);
begin
  CallDefaultProc(TMessage(Msg));
  PaintScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.WMCaptureChanged(var Msg: TMessage);
begin
  if FVertUpState = tsArrowBtnUpPressed then
  begin
    FVertUpState := tsArrowBtnUpNormal;
    PaintScroll;
  end;

  if FVertDownState = tsArrowBtnDownPressed then
  begin
    FVertDownState := tsArrowBtnDownNormal;
    PaintScroll;
  end;

  if FHorzUpState = tsArrowBtnLeftPressed then
  begin
    FHorzUpState := tsArrowBtnLeftNormal;
    PaintScroll;
  end;

  if FHorzDownState = tsArrowBtnRightPressed then
  begin
    FHorzDownState := tsArrowBtnRightNormal;
    PaintScroll;
  end;

  CallDefaultProc(TMessage(Msg));
  Handled := True;
end;

procedure TScrollingStyleHook.WMNCLButtonDown(var Msg: TWMMouse);
var
  P: TPoint;
  SF: TScrollInfo;
begin

  P := Point(Msg.XPos, Msg.YPos);
  ScreenToClient(Handle, P);

  if HasBorder then
    if HasClientEdge then
    begin
      P.X := P.X + 2;
      P.Y := P.Y + 2;
    end
    else
    begin
      P.X := P.X + 1;
      P.Y := P.Y + 1;
    end;

  if (VertTrackRect.Height > 0) and VertSliderRect.Contains(P) then
  begin
    FLeftButtonDown := True;
    SF.fMask := SIF_ALL;
    SF.cbSize := SizeOf(SF);
    GetScrollInfo(Handle, SB_VERT, SF);
    FListPos := SF.nPos;
    FScrollPos := SF.nPos;
    FPrevScrollPos := Mouse.CursorPos.Y;
    FVertSliderState := tsThumbBtnVertPressed;
    PaintScroll;
    SetCapture(Handle);
    Handled := True;
    Exit;
  end;

  if (HorzTrackRect.Width > 0) and HorzSliderRect.Contains(P) then
  begin
    FLeftButtonDown := True;
    SF.fMask := SIF_ALL;
    SF.cbSize := SizeOf(SF);
    GetScrollInfo(Handle, SB_HORZ, SF);
    FListPos := SF.nPos;
    FScrollPos := SF.nPos;
    FPrevScrollPos := Mouse.CursorPos.X;
    FHorzSliderState :=  tsThumbBtnHorzPressed;
    PaintScroll;
    SetCapture(Handle);
    Handled := True;
    Exit;
  end;

  if VertDownButtonRect.Contains(P) and (VertSliderRect.Height > 0) then
    FVertDownState := tsArrowBtnDownPressed;

  if VertUpButtonRect.Contains(P) and (VertSliderRect.Height > 0) then
    FVertUpState := tsArrowBtnUpPressed;

  if HorzDownButtonRect.Contains(P) and (HorzSliderRect.Width > 0)  then
    FHorzDownState := tsArrowBtnRightPressed;

  if HorzUpButtonRect.Contains(P) and (HorzSliderRect.Width > 0) then
    FHorzUpState := tsArrowBtnLeftPressed;

  PaintScroll;
end;

procedure TScrollingStyleHook.WMNCLButtonDblClk(var Msg: TWMMouse);
begin
  WMNCLButtonDown(Msg);
end;

procedure TScrollingStyleHook.WMNCLButtonUp(var Msg: TWMMouse);
var
  P: TPoint;
begin
  P := Point(Msg.XPos, Msg.YPos);
  ScreenToClient(Handle, P);

  if HasBorder then
    if HasClientEdge then
    begin
      P.X := P.X + 2;
      P.Y := P.Y + 2;
    end
    else
    begin
      P.X := P.X + 1;
      P.Y := P.Y + 1;
    end;

  if VertSliderState =  tsThumbBtnVertPressed then
  begin
    FLeftButtonDown := False;
    FVertSliderState := tsThumbBtnVertNormal;
    PaintScroll;
    Handled := True;
    Exit;
  end;

  if FHorzSliderState = tsThumbBtnHorzPressed then
  begin
    FLeftButtonDown := False;
    FHorzSliderState := tsThumbBtnHorzNormal;
    PaintScroll;
    Handled := True;
    Exit;
  end;

  if VertSliderRect.Height > 0 then
    if VertDownButtonRect.Contains(P) then
      FVertDownState := tsArrowBtnDownHot
    else
      FVertDownState := tsArrowBtnDownNormal;

  if VertSliderRect.Height > 0 then
    if VertUpButtonRect.Contains(P) then
      FVertUpState := tsArrowBtnUpHot
    else
      FVertUpState := tsArrowBtnUpNormal;

  if HorzSliderRect.Width > 0 then
    if HorzDownButtonRect.Contains(P) then
      FHorzDownState := tsArrowBtnRightHot
    else
      FHorzDownState := tsArrowBtnRightNormal;

  if HorzSliderRect.Width > 0 then
    if HorzUpButtonRect.Contains(P) then
      FHorzUpState := tsArrowBtnLeftHot
    else
      FHorzUpState := tsArrowBtnLeftNormal;

  CallDefaultProc(TMessage(Msg));
  if (HorzSliderRect.Width > 0) or (VertSliderRect.Height > 0) then
    PaintScroll;
  Handled := True;
end;


procedure TScrollingStyleHook.WMNCMouseMove(var Msg: TWMMouse);
var
  P: TPoint;
  MustUpdateScroll: Boolean;
begin
  inherited;
  P := Point(Msg.XPos, Msg.YPos);
  ScreenToClient(Handle, P);

  if HasBorder then
    if HasClientEdge then
    begin
      P.X := P.X + 2;
      P.Y := P.Y + 2;
    end
    else
    begin
      P.X := P.X + 1;
      P.Y := P.Y + 1;
    end;

  MustUpdateScroll := False;

  if VertSliderRect.Height > 0 then
  if VertSliderRect.Contains(P) and (VertSliderState = tsThumbBtnVertNormal) then
  begin
    FVertSliderState := tsThumbBtnVertHot;
    MustUpdateScroll := True;
  end
  else
    if not VertSliderRect.Contains(P) and (VertSliderState = tsThumbBtnVertHot) then
    begin
      FVertSliderState := tsThumbBtnVertNormal;
      MustUpdateScroll := True;
    end;

  if HorzSliderRect.Width > 0 then
    if HorzSliderRect.Contains(P) and (FHorzSliderState = tsThumbBtnHorzNormal) then
    begin
      FHorzSliderState := tsThumbBtnHorzHot;
      MustUpdateScroll := True;
    end
    else
      if not HorzSliderRect.Contains(P) and (FHorzSliderState = tsThumbBtnHorzHot) then
      begin
        FHorzSliderState := tsThumbBtnHorzNormal;
        MustUpdateScroll := True;
      end;

  if VertSliderRect.Height > 0 then
    if VertDownButtonRect.Contains(P) and (FVertDownState = tsArrowBtnDownNormal) then
    begin
      FVertDownState := tsArrowBtnDownHot;
      MustUpdateScroll := True;
    end
    else
      if not VertDownButtonRect.Contains(P) and (FVertDownState = tsArrowBtnDownHot) then
      begin
        FVertDownState := tsArrowBtnDownNormal;
        MustUpdateScroll := True;
      end;

  if VertSliderRect.Height > 0 then
    if VertUpButtonRect.Contains(P) and (FVertUpState = tsArrowBtnUpNormal) then
    begin
      FVertUpState := tsArrowBtnUpHot;
      MustUpdateScroll := True;
    end
    else if not VertUpButtonRect.Contains(P) and (FVertUpState = tsArrowBtnUpHot) then
    begin
      FVertUpState := tsArrowBtnUpNormal;
      MustUpdateScroll := True;
    end;

  if HorzSliderRect.Width > 0 then
    if HorzDownButtonRect.Contains(P) and (FHorzDownState = tsArrowBtnRightNormal) then
    begin
      FHorzDownState := tsArrowBtnRightHot;
      MustUpdateScroll := True;
    end
    else if not HorzDownButtonRect.Contains(P) and (FHorzDownState = tsArrowBtnRightHot) then
    begin
      FHorzDownState := tsArrowBtnRightNormal;
      MustUpdateScroll := True;
    end;

  if HorzSliderRect.Width > 0 then
    if HorzUpButtonRect.Contains(P) and (FHorzUpState = tsArrowBtnLeftNormal) then
    begin
      FHorzUpState := tsArrowBtnLeftHot;
      MustUpdateScroll := True;
    end
    else if not HorzUpButtonRect.Contains(P) and (FHorzUpState = tsArrowBtnLeftHot) then
    begin
      FHorzUpState := tsArrowBtnLeftNormal;
      MustUpdateScroll := True;
    end;

  if MustUpdateScroll then
    PaintScroll;
end;

procedure TScrollingStyleHook.WMLButtonUp(var Msg: TWMMouse);
begin
  if VertSliderState = tsThumbBtnVertPressed then
  begin
    PostMessage(Handle, WM_VSCROLL, Integer(SmallPoint(SB_THUMBPOSITION, Round(FScrollPos))), 0);
    FLeftButtonDown := False;
    FVertSliderState := tsThumbBtnVertNormal;
    PaintScroll;
    Handled := True;
    ReleaseCapture;
    PostMessage(Handle, WM_VSCROLL, Integer(SmallPoint(SB_ENDSCROLL, 0)), 0);
    Exit;
  end;

  if FHorzSliderState = tsThumbBtnHorzPressed then
  begin
    PostMessage(Handle, WM_HSCROLL, Integer(SmallPoint(SB_THUMBPOSITION, Round(FScrollPos))), 0);
    FLeftButtonDown := False;
    FHorzSliderState := tsThumbBtnHorzNormal;
    PaintScroll;
    Handled := True;
    ReleaseCapture;
    PostMessage(Handle, WM_HSCROLL, Integer(SmallPoint(SB_ENDSCROLL, 0)), 0);
    Exit;
  end;

  if FVertUpState = tsArrowBtnUpPressed then
    FVertUpState := tsArrowBtnUpNormal;

  if FVertDownState = tsArrowBtnDownPressed then
    FVertDownState := tsArrowBtnDownNormal;

  if FHorzUpState = tsArrowBtnLeftPressed then
    FHorzUpState := tsArrowBtnLeftNormal;

  if FHorzDownState = tsArrowBtnRightPressed then
    FHorzDownState := tsArrowBtnRightNormal;

  FLeftButtonDown := False;
  PaintScroll;
end;

procedure TScrollingStyleHook.WMMouseMove(var Msg: TWMMouse);
var
  SF: TScrollInfo;
begin
  inherited;

  if VertSliderState = tsThumbBtnVertPressed then
  begin
    SF.fMask := SIF_ALL;
    SF.cbSize := SizeOf(SF);
    GetScrollInfo(Handle, SB_VERT, SF);
    if SF.nPos <> Round(FScrollPos) then FScrollPos := SF.nPos;

    FScrollPos := FScrollPos + (SF.nMax - SF.nMin) * ((Mouse.CursorPos.Y - FPrevScrollPos) / VertTrackRect.Height);
    if FScrollPos < SF.nMin then FScrollPos := SF.nMin;
    if FScrollPos > SF.nMax then FScrollPos := SF.nMax;
    if SF.nPage <> 0 then
      if Round(FScrollPos) > SF.nMax - Integer(SF.nPage) + 1 then
        FScrollPos := SF.nMax - Integer(SF.nPage) + 1;
    FPrevScrollPos := Mouse.CursorPos.Y;
    SF.nPos := Round(FScrollPos);

    SetScrollInfo(Handle, SB_VERT, SF, False);
    PostMessage(Handle, WM_VSCROLL, Integer(SmallPoint(SB_THUMBTRACK, Round(FScrollPos))), 0);

    PaintScroll;
    Handled := True;
    Exit;
  end;

  if FHorzSliderState = tsThumbBtnHorzPressed then
  begin
    SF.fMask := SIF_ALL;
    SF.cbSize := SizeOf(SF);
    GetScrollInfo(Handle, SB_HORZ, SF);
    if SF.nPos <> Round(FScrollPos) then FScrollPos := SF.nPos;

    FScrollPos := FScrollPos + (SF.nMax - SF.nMin) * ((Mouse.CursorPos.X - FPrevScrollPos) / HorzTrackRect.Width);
    if FScrollPos < SF.nMin then FScrollPos := SF.nMin;
    if FScrollPos > SF.nMax then FScrollPos := SF.nMax;
    if SF.nPage <> 0 then
      if Round(FScrollPos) > SF.nMax - Integer(SF.nPage) + 1 then
        FScrollPos := SF.nMax - Integer(SF.nPage) + 1;
    FPrevScrollPos := Mouse.CursorPos.X;
    SF.nPos := Round(FScrollPos);

    SetScrollInfo(Handle, SB_HORZ, SF, False);
    PostMessage(Handle, WM_HSCROLL, Integer(SmallPoint(SB_THUMBTRACK, Round(FScrollPos))), 0);

    PaintScroll;
    Handled := True;
    Exit;
  end;

  if (FHorzSliderState <> tsThumbBtnHorzPressed) and (FHorzSliderState = tsThumbBtnHorzHot) then
  begin
    FHorzSliderState := tsThumbBtnHorzNormal;
    PaintScroll;
  end;

  if (VertSliderState <> tsThumbBtnVertPressed) and (VertSliderState = tsThumbBtnVertHot) then
  begin
    FVertSliderState := tsThumbBtnVertNormal;
    PaintScroll;
  end;

  if (FHorzUpState <> tsArrowBtnLeftPressed) and (FHorzUpState = tsArrowBtnLeftHot) then
  begin
    FHorzUpState := tsArrowBtnLeftNormal;
    PaintScroll;
  end;

  if (FHorzDownState <> tsArrowBtnRightPressed) and (FHorzDownState =tsArrowBtnRightHot) then
  begin
    FHorzDownState := tsArrowBtnRightNormal;
    PaintScroll;
  end;

  if (FVertUpState <> tsArrowBtnUpPressed) and (FVertUpState = tsArrowBtnUpHot) then
  begin
    FVertUpState := tsArrowBtnUpNormal;
    PaintScroll;
  end;

  if (FVertDownState <> tsArrowBtnDownPressed) and (FVertDownState = tsArrowBtnDownHot) then
  begin
    FVertDownState := tsArrowBtnDownNormal;
    PaintScroll;
  end;

  CallDefaultProc(TMessage(Msg));
  if FLeftButtonDown then
    PaintScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.WMKeyDown(var Msg: TMessage);
begin
  CallDefaultProc(TMessage(Msg));
  PaintScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.WMKeyUp(var Msg: TMessage);
begin
  CallDefaultProc(TMessage(Msg));
  PaintScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.WMLButtonDown(var Msg: TWMMouse);
begin
  CallDefaultProc(TMessage(Msg));
  PaintScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.Paint(Canvas: TCanvas);
begin
  PaintScroll;
end;

procedure TScrollingStyleHook.PaintBackground(Canvas: TCanvas);
begin
  inherited PaintBackground(Canvas);
  PaintScroll;
end;

function TScrollingStyleHook.GetParentBounds: TRect;
begin
  if (Control <> nil) and (Control.Parent <> nil) then
    Result := Control.Parent.BoundsRect
  else if Handle <> 0 then
    GetWindowRect(Control.ParentWindow, Result)
  else
    Result := TRect.Empty;
end;

procedure TScrollingStyleHook.WMClose(var Msg: TWMCLOSE);
begin
  Handled := True;
end;

procedure TScrollingStyleHook.WMShowWindow(var Msg: TWMShowWindow);
begin
  CallDefaultProc(TMessage(Msg));

  if (FVertScrollWnd <> nil) and FVertScrollWnd.HandleAllocated then
    if Msg.Show then
      ShowWindow(FVertScrollWnd.Handle, SW_SHOW)
    else
      ShowWindow(FVertScrollWnd.Handle, SW_HIDE);

  if (FHorzScrollWnd <> nil) and FHorzScrollWnd.HandleAllocated then
    if Msg.Show then
      ShowWindow(FHorzScrollWnd.Handle, SW_SHOW)
    else
      ShowWindow(FHorzScrollWnd.Handle, SW_HIDE);

  Handled := True;
end;

procedure TScrollingStyleHook.WMWindowPosChanged;
begin
  CallDefaultProc(TMessage(Msg));
  if Msg.WindowPos.Flags and SWP_HIDEWINDOW = SWP_HIDEWINDOW then
  begin
    if FVertScrollWnd <> nil then
      ShowWindow(FVertScrollWnd.Handle, SW_HIDE);
    if FHorzScrollWnd <> nil then
      ShowWindow(FHorzScrollWnd.Handle, SW_HIDE);
  end
  else
    if IsWindowVisible(Control.Handle) then
      UpdateScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
end;

procedure TScrollingStyleHook.CMVisibleChanged(var Msg: TMessage);
begin
  if Control.HandleAllocated then
  begin
    if FVertScrollWnd <> nil then
      if (Control.Visible) then
        ShowWindow(FVertScrollWnd.Handle, SW_SHOW)
      else
        ShowWindow(FVertScrollWnd.Handle, SW_HIDE);

    if FHorzScrollWnd <> nil then
      if (Control.Visible) then
        ShowWindow(FHorzScrollWnd.Handle, SW_SHOW)
      else
        ShowWindow(FHorzScrollWnd.Handle, SW_HIDE);
  end;
  Handled := False;
end;

procedure TScrollingStyleHook.WMMove(var Msg: TMessage);
begin
  CallDefaultProc(TMessage(Msg));
  if (FVertScrollWnd <> nil) or (FHorzScrollWnd <> nil) then
    SetWindowPos(Handle, 0,0,0,0,0, SWP_FRAMECHANGED or SWP_NOACTIVATE or
      SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
  UpdateScroll;
  Handled := True;
end;

procedure TScrollingStyleHook.WMSize(var Msg: TMessage);
begin
  CallDefaultProc(TMessage(Msg));
  UpdateScroll;
  Handled := True;
end;

{ TFormStyleHook.TMainMenuBarStyleHook }

                                
function RectVCenter(var R: TRect; Bounds: TRect): TRect;
begin
  OffsetRect(R, -R.Left, -R.Top);
  OffsetRect(R, 0, (Bounds.Height - R.Height) div 2);
  OffsetRect(R, Bounds.Left, Bounds.Top);

  Result := R;
end;

constructor TFormStyleHook.TMainMenuBarStyleHook.Create(FormHook: TFormStyleHook);
begin
  FFormHook := FormHook;
  FBoundsRect := Rect(0, 0, 0, 0);
  FIcon := nil;
  FItemCount := 0;
  FMenuActive := False;
  FMenuPush := False;
  FActiveItem := -1;
  FOldActiveItem := -1;
  FMouseInMainMenu := False;
  FMenuBarHook := nil;
  FOldCursorPos := Point(-1, -1);
  FEnterWithKeyboard := False;
  FSystemMenuTracking := False;
  FMDIChildSystemMenuTracking := False;
  FShowMDIButtons := False;
  FHotMDIButton := -1;
  FPressedMDIButton := -1;
  FOldMDIHotButton := -1;
  FMustActivateSysMenu := False;
  FMustActivateMenuItem := False;
  FMustActivateMDIChildSysMenu := False;
  FSysMenuActive := False;
  FMDIChildSysMenuActive := False;
end;

destructor TFormStyleHook.TMainMenuBarStyleHook.Destroy;
begin
  if FIcon <> nil then
    FreeAndNil(FIcon);
  inherited;
end;

function TFormStyleHook.TMainMenuBarStyleHook.GetSystemMetrics(nIndex: Integer): Integer;
begin
  Result := FFormHook.GetSystemMetrics(nIndex);
end;

function TFormStyleHook.TMainMenuBarStyleHook.GetIconFast: TIcon;
begin
  if (FIcon = nil) or (FIconHandle = 0) then
    Result := GetIcon
  else
    Result := FIcon;
end;

function TFormStyleHook.TMainMenuBarStyleHook.GetIcon: TIcon;
begin
  if not CanTrackMDISystemMenu then
  begin
    Result := nil;
    Exit;
  end;

 if FIcon = nil then
   FIcon := FFormHook.GetFormIcon(FFormHook.Form.ActiveMDIChild);

  Result := FIcon;
end;


function TFormStyleHook.TMainMenuBarStyleHook.CanTrackMDISystemMenu: Boolean;
begin
  Result := (FFormHook.Form.FormStyle = fsMDIForm) and
            (FFormHook.Form.ActiveMDIChild <> nil) and
            (biSystemMenu in FFormHook.Form.ActiveMDIChild.BorderIcons);
end;

function TFormStyleHook.TMainMenuBarStyleHook.CanTrackSystemMenu: Boolean;
begin
  Result := (biSystemMenu in FFormHook.Form.BorderIcons) and
    (FFormHook.Form.BorderStyle <> bsNone);
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.SetShowMDIButtons(Value: Boolean);
begin
  if FShowMDIButtons <> Value then
  begin
    FShowMDIButtons := Value;
    FHotMDIButton := -1;
    FPressedMDIButton := -1;
    FOldMDIHotButton := -1;
    if not Value and (FIcon <> nil) then
      FreeAndNil(FIcon);
    Invalidate;
  end;
end;

function TFormStyleHook.TMainMenuBarStyleHook.IsSubMenuItem(AMenuItem: TMenuItem): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to FItemCount - 1 do
   if AMenuItem.Parent = FItems[I].MenuItem then
     Exit(False);
end;

function TFormStyleHook.TMainMenuBarStyleHook.CanFindPriorItem(AMenuItem: TMenuItem): Boolean;
begin
  Result := (AMenuItem = nil) or not IsSubMenuItem(AMenuItem);
end;

function TFormStyleHook.TMainMenuBarStyleHook.CanFindNextItem(AMenuItem: TMenuItem): Boolean;
begin
  Result := (AMenuItem = nil) or (AMenuItem.Count = 0);
end;

function TFormStyleHook.TMainMenuBarStyleHook.FindItem(Value: NativeUInt; Kind: TFindItemKind): TMenuItem;
begin
  Result := MainMenu.FindItem(Value, Kind);
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.MenuEnter;
begin
  HideCaret(0);
  FMDIChildSysMenuActive := False;
  FSysMenuActive := False;
  if not ATrackMenu then
    FindFirstMenuItem(True);
  ProcessMenuLoop(ATrackMenu);
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.MenuExit;
begin
  ShowCaret(0);
  FInMenuLoop := False;
  FMenuPush := False;
  FMenuActive := False;
  FEnterWithKeyboard := False;
  FMDIChildSysMenuActive := False;
  FSysMenuActive := False;
  if (FActiveItem <> -1) and
     (WindowFromPoint(Mouse.CursorPos) = FFormHook.Handle) and
     (ItemFromCursorPos <> -1) then
  begin
    FActiveItem := ItemFromCursorPos;
    FOldActiveItem := FActiveItem;
  end
  else
  begin
    FActiveItem := -1;
    FOldActiveItem := -1;
  end;
  Invalidate;
end;

function TFormStyleHook.TMainMenuBarStyleHook.CheckHotKeyItem(ACharCode: Word): Boolean;
var
  I: Integer;
begin
  Result := False;
  I := FindHotKeyItem(ACharCode, True);
  if (I <> -1) and (FActiveItem = I) then
  begin
    Result := True;
    if FItems[FActiveItem].MenuItem.Count = 0 then
    begin
      MenuExit;
      if FItems[I].MenuItem.GetParentMenu <> nil then
        FItems[I].MenuItem.GetParentMenu.DispatchCommand(FItems[I].MenuItem.Command);
    end
    else
    begin
      FEnterWithKeyboard := True;
      TrackMenuFromItem;
    end;
  end;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.ProcessMenuLoop;
var
  Msg: TMsg;
  FDispatchMessage: Boolean;
  I: Integer;
begin
  if FInMenuLoop then
    Exit;
  FInMenuLoop := True;

  repeat
    if ATrackMenu then
      TrackMenuFromItem;

    FDispatchMessage := False;

    if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
      case Msg.message of
        WM_MOUSEMOVE:
          begin
          end;
        WM_SYSKEYDOWN:
         begin
           if Msg.wParam = VK_MENU then
           begin
             FInMenuLoop := False;
             FDispatchMessage := True;
           end;
         end;
        WM_QUIT:
          begin
            FInMenuLoop := False;
            PostQuitMessage(Msg.wParam);
          end;
        WM_CLOSE, CM_RELEASE:
          begin
            FInMenuLoop := False;
            FDispatchMessage := True;
          end;
        WM_KEYDOWN:
          begin
            if not FEnterWithKeyboard then
            begin
              FEnterWithKeyboard := True;
              Invalidate;
            end;
            I := FindHotKeyItem(Msg.WParam, True);
            if (I <> -1) and (FActiveItem = I) then
            begin
              if FItems[FActiveItem].MenuItem.Count = 0 then
              begin
                MenuExit;
                if FItems[I].MenuItem.GetParentMenu <> nil then
                  FItems[I].MenuItem.GetParentMenu.DispatchCommand(FItems[I].MenuItem.Command);
              end
              else
                TrackMenuFromItem;
            end
            else
              case Msg.WParam of
                VK_ESCAPE:
                  MenuExit;
                VK_RIGHT:
                  if FFormHook.Control.BiDiMode = bdRightToLeft then
                    FindPriorMenuItem(True)
                  else
                    FindNextMenuItem(True);
                VK_LEFT:
                  if FFormHook.Control.BiDiMode = bdRightToLeft then
                    FindNextMenuItem(True)
                  else
                    FindPriorMenuItem(True);
                VK_RETURN, VK_DOWN:
                  if FMDIChildSysMenuActive then
                  begin
                    MenuExit;
                    TrackMDIChildSystemMenu;
                  end
                  else if FSysMenuActive then
                  begin
                    MenuExit;
                    TrackSystemMenu;
                  end
                  else if FActiveItem <> -1 then
                  begin
                    if FItems[FActiveItem].MenuItem.Count = 0 then
                    begin
                      I := FActiveItem;
                      MenuExit;
                      if FItems[I].MenuItem.GetParentMenu <> nil then
                        FItems[I].MenuItem.GetParentMenu.DispatchCommand(FItems[I].MenuItem.Command);
                    end
                    else
                      TrackMenuFromItem;
                  end;
              end;
            end;
        WM_LBUTTONDOWN, WM_RBUTTONDOWN, WM_MBUTTONDOWN,
        WM_NCLBUTTONDOWN, WM_NCRBUTTONDOWN, WM_NCMBUTTONDOWN,
        WM_LBUTTONUP, WM_RBUTTONUP, WM_MBUTTONUP,
        WM_NCLBUTTONUP, WM_NCRBUTTONUP, WM_NCMBUTTONUP,
        WM_ACTIVATE, WM_NCACTIVATE, WM_SETFOCUS, WM_KILLFOCUS,
        WM_CANCELMODE:
          begin
            FInMenuLoop := False;
            FDispatchMessage := True;
          end;
         else
           DispatchMessage(Msg);
      end;

  until not FInMenuLoop;

  if not FMustActivateMenuItem then
  begin
    MenuExit;
    if (Msg.Message = WM_NCLBUTTONDOWN) and (FActiveItem <> -1) then
      FDispatchMessage := False;
  end;
  if FDispatchMessage then
    DispatchMessage(Msg);
end;

function TFormStyleHook.TMainMenuBarStyleHook.FindFirstMenuItem;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FItemCount - 1 do
  begin
    if FItems[I].MenuItem.Visible and FItems[I].MenuItem.Enabled then
    begin
      Result := I;
      if AUpdateMenu then
      begin
        FActiveItem := I;
        Invalidate;
      end;
      Break;
    end;
  end;
end;

function TFormStyleHook.TMainMenuBarStyleHook.FindFirstRightMenuItem;
var
  I: Integer;
begin
  Result := -1;
  for I := FItemCount - 1 downto 0 do
  begin
    if FItems[I].MenuItem.Visible and FItems[I].MenuItem.Enabled then
    begin
      Result := I;
      if AUpdateMenu then
      begin
        FActiveItem := I;
        Invalidate;
      end;
      Break;
    end;
  end;
end;

function TFormStyleHook.TMainMenuBarStyleHook.FindHotKeyItem;
var
  i: Integer;
begin
  Result := -1;
  for I := 0 to FItemCount - 1 do
  begin
    if FItems[I].MenuItem.Visible and FItems[I].MenuItem.Enabled and
       IsAccel(CharCode, FItems[I].MenuItem.Caption) then
    begin
      Result := I;
      if AUpdateMenu then
      begin
        FActiveItem := I;
        Invalidate;
      end;
      Break;
    end;
  end;
end;

function TFormStyleHook.TMainMenuBarStyleHook.FindNextMenuItem;
var
  I, J: Integer;
begin
  Result := -1;
  if FActiveItem = -1 then J := 0 else  J := FActiveItem + 1;
  for I := J to FItemCount - 1 do
  begin
    if FItems[I].MenuItem.Visible and FItems[I].MenuItem.Enabled then
    begin
      Result := I;
      if AUpdateMenu then
      begin
        FActiveItem := I;
        Invalidate;
      end;
      Break;
    end;
  end;

  if (Result = -1) and not CanTrackSystemMenu then
    Result := FindFirstMenuItem(AUpdateMenu)
  else if (Result = -1) and CanTrackSystemMenu and not FMenuPush then
  begin
    if not FSysMenuActive and not FMDIChildSysMenuActive then
    begin
      FSysMenuActive := True;
      FMDIChildSysMenuActive := False;
      if AUpdateMenu then
        Invalidate;
    end
    else if CanTrackMDISystemMenu and not FMDIChildSysMenuActive then
    begin
      FSysMenuActive := False;
      FMDIChildSysMenuActive := True;
      if AUpdateMenu then
        Invalidate;
    end
    else
    begin
      FSysMenuActive := False;
      FMDIChildSysMenuActive := False;
      Result := FindFirstMenuItem(AUpdateMenu);
    end;
  end
  else if (Result = -1) and FMenuPush then
  begin
    if CanTrackSystemMenu and AUpdateMenu then
    begin
      MenuExit;
      TrackSystemMenu;
    end
    else if CanTrackMDISystemMenu and AUpdateMenu then
    begin
      MenuExit;
      TrackMDIChildSystemMenu;
    end
    else if FMenuHook = 0 then
      Result := FindFirstMenuItem(AUpdateMenu);
  end;
end;

function TFormStyleHook.TMainMenuBarStyleHook.FindPriorMenuItem;
var
  I, J: Integer;
begin
  Result := -1;
  if FActiveItem = -1 then
    J := FItemCount
  else
    J := FActiveItem - 1;

  for I := J downto 0 do
  begin
    if FItems[I].MenuItem.Visible and FItems[I].MenuItem.Enabled then
    begin
      Result := I;
      if AUpdateMenu then
      begin
        FActiveItem := I;
        Invalidate;
      end;
      Break;
    end;
  end;

  if (Result = -1) and not CanTrackSystemMenu then
    Result := FindFirstRightMenuItem(AUpdateMenu)
  else if (Result = -1) and CanTrackSystemMenu and not FMenuPush then
  begin
    if CanTrackMDISystemMenu and not FMDIChildSysMenuActive
       and not FSysMenuActive then
    begin
      FSysMenuActive := False;
      FMDIChildSysMenuActive := True;
      if AUpdateMenu then
        Invalidate;
    end
    else if not FSysMenuActive then
    begin
      FSysMenuActive := True;
      FMDIChildSysMenuActive := False;
      if AUpdateMenu then
        Invalidate;
    end
    else
    begin
      FSysMenuActive := False;
      FMDIChildSysMenuActive := False;
      Result := FindFirstRightMenuItem(AUpdateMenu);
    end;
  end
  else if (Result = -1) and FMenuPush then
  begin
    if CanTrackMDISystemMenu and AUpdateMenu then
    begin
      MenuExit;
      TrackMDIChildSystemMenu;
    end
    else if CanTrackSystemMenu and AUpdateMenu then
    begin
      MenuExit;
      TrackSystemMenu;
    end
    else if FMenuHook = 0 then
      Result := FindFirstRightMenuItem(AUpdateMenu);
  end;
end;

function TFormStyleHook.TMainMenuBarStyleHook.GetTrackMenuPos(AItem: TMenuBarItem): TPoint;
var
  RightPoint: TPoint;
begin
  Result := Point(AItem.ItemRect.Left, AItem.ItemRect.Top + AItem.ItemRect.Height);
  Result.X := Result.X + FFormHook.FLeft + FBoundsRect.Left;
  Result.Y := Result.Y + FFormHook.FTop + FBoundsRect.Top;
  RightPoint := Point(Result.X + AItem.ItemRect.Width, Result.Y);
  if Screen.MonitorFromPoint(Result) <> Screen.MonitorFromPoint(RightPoint)
  then
    begin
      if FFormHook.Control.BiDiMode <> bdRightToLeft then
        Result.X := Screen.MonitorFromPoint(RightPoint).WorkareaRect.Left
      else
        Result.X := Screen.MonitorFromPoint(Result).WorkareaRect.Right -
          AItem.ItemRect.Width - 1;
    end;
  if FFormHook.Control.BiDiMode = bdRightToLeft then
    Result.X := Result.X + AItem.ItemRect.Width;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.HookMenus;
begin
  FSelectFirstItem := True;
  FMenuBarHook := Self;
  FCurrentMenuItem := nil;
  if FMenuHook = 0 then
    FMenuHook := SetWindowsHookEx(WH_MSGFILTER, @PopupMenuHook, 0,
      GetCurrentThreadID);
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.UnHookMenus;
begin
  if FMenuHook <> 0 then
    UnhookWindowsHookEx(FMenuHook);
  FMenuBarHook := nil;
  FCurrentMenuItem := nil;
  FMenuHook := 0;
  FSelectFirstItem := False;
end;

function TFormStyleHook.TMainMenuBarStyleHook.ItemFromCursorPos: Integer;
var
  P: TPoint;
begin
  P := Mouse.CursorPos;
  P.X := P.X - FFormHook.FLeft - FBoundsRect.Left;
  P.Y := P.Y - FFormHook.FTop - FBoundsRect.Top;
  Result := ItemFromPoint(P.X, P.Y);
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.MDIChildClose;
begin
  if (FFormHook.Form.ActiveMDIChild <> nil) then
    SendMessage(FFormHook.Form.ActiveMDIChild.Handle,
      WM_SYSCOMMAND, SC_CLOSE, 0);
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.MDIChildRestore;
begin
  if (FFormHook.Form.ActiveMDIChild <> nil) then
    SendMessage(FFormHook.Form.ActiveMDIChild.Handle,
      WM_SYSCOMMAND, SC_RESTORE, 0);
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.MDIChildMinimize;
begin
  if (FFormHook.Form.ActiveMDIChild <> nil) then
    SendMessage(FFormHook.Form.ActiveMDIChild.Handle,
      WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

function TFormStyleHook.TMainMenuBarStyleHook.MDIButtonFromPoint(X, Y: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to 2 do
    if FMDIButtons[I].ItemRect.Contains(Point(X, Y)) then
      Exit(FMDIButtons[I].Index);
end;

function TFormStyleHook.TMainMenuBarStyleHook.ItemFromPoint(X, Y: Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FItemCount - 1 do
    if FItems[I].MenuItem.Visible and FItems[I].MenuItem.Enabled and
       FItems[I].ItemRect.Contains(Point(X, Y)) then
      Exit(FItems[I].Index);
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.Invalidate;
begin
  FFormHook.InvalidateNC;
end;

function TFormStyleHook.TMainMenuBarStyleHook.MainMenu: TMainMenu;
begin
  if FFormHook.Form.FormStyle = fsMDIChild then
  begin
    Result := nil;
    Exit;
  end;
  Result := FFormHook.Form.Menu;
end;

function TFormStyleHook.TMainMenuBarStyleHook.GetMenuHeight(AWidth: Integer): Integer;

function GetItemCount(AMenu, AChildMenu: TMainMenu): Integer;

procedure Insert(APos: Integer; var ACount: Integer; AItem: TMenuItem);
var
  I: Integer;
begin
  Inc(ACount);
  if APos = ACount - 1 then
    FItems[APos].MenuItem := AItem
  else
  begin
    for I := ACount - 1 downto APos + 1 do
      FItems[I].MenuItem := FItems[I - 1].MenuItem;
    FItems[APos].MenuItem := AItem;
  end;
end;

function CanAddItem(AItem: TMenuItem): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to AChildMenu.Items.Count - 1 do
    if AItem.GroupIndex = AChildMenu.Items[I].GroupIndex then
    begin
      Result := False;
      Break;
    end;
end;

var
  I, J, Count, Index: Integer;
begin
  if AMenu = nil then
    Exit(0);

  if AChildMenu <> nil then
  begin
    Count := AMenu.Items.Count + AChildMenu.Items.Count;
    SetLength(FItems, Count);
    Result := AChildMenu.Items.Count;
    {add items from child menu}
    for I := 0 to Result - 1 do
      FItems[I].MenuItem := AChildMenu.Items[I];
    {add items from menu}
    for I := AMenu.Items.Count - 1 downto 0 do
      if CanAddItem(AMenu.Items[I]) then
      begin
        Index := -1;
        for J := 0 to Result - 1 do
          if AMenu.Items[I].GroupIndex <= FItems[J].MenuItem.GroupIndex then
          begin
            Index := J;
            Break;
          end;
        if Index = -1 then Index := Result;
        Insert(Index, Result, AMenu.Items[I]);
      end;
  end
  else
  begin
    {add items from menu}
    Result := AMenu.Items.Count;
    SetLength(FItems, Result);
    for I := 0 to Result - 1 do
      FItems[I].MenuItem := AMenu.Items[I];
  end;
end;

var
  Buffer: TBitmap;
  I, LHeight: Integer;
  LWidth, LButtonWidth: Integer;
  LIconDraw: Boolean;
  FMenu, FChildMenu: TMainMenu;
begin
  Result := GetSystemMetrics(SM_CYMENU);
  if MainMenu = nil then
    Exit;

  if FShowMDIButtons then
    LButtonWidth := Result * 3
  else
    LButtonWidth := 0;

  {get menu}
  FMenu := MainMenu;
  {get mdi child menu}
  FChildMenu := nil;
  if FFormHook.Form.FormStyle = fsMDIForm then
    with FFormHook.Form do
      if (ActiveMDIChild <> nil) and (ActiveMDIChild.Menu <> nil) and
         (ActiveMDIChild.Menu.Items.Count > 0) and
         (ActiveMDIChild.Handle <> FFormHook.FChangeVisibleChildHandle) then
        FChildMenu := ActiveMDIChild.Menu;

  {initialize array of items}
  FItemCount := GetItemCount(FMenu, FChildMenu);

  {calculation sizes}
  Buffer := TBitMap.Create;
  try
    Buffer.Canvas.Font.Assign(Screen.MenuFont);
    if CheckPerMonitorV2SupportForWindow(FFormHook.Form.Handle) then
      Buffer.Canvas.Font.Height := MulDiv(Buffer.Canvas.Font.Height,
        FFormHook.Form.CurrentPPI, Screen.PixelsPerInch);

    LIconDraw := FShowMDIButtons and CanTrackMDISystemMenu;
    if LIconDraw then
      LHeight := GetSystemMetrics(SM_CYMENU)
    else
      LHeight := 0;
    for I := 0 to FItemCount  - 1 do
    begin
      LWidth := GetMenuItemWidth(FItems[I].MenuItem, Buffer.Canvas);
      LHeight := LHeight + LWidth;
      if (LHeight > AWidth) and (LHeight <> 0) then
      begin
        LHeight := LWidth;
        Result := Result + GetSystemMetrics(SM_CYMENU);
      end;
    end;
  finally
    Buffer.Free;
  end;
  if (LButtonWidth <> 0) and (LHeight + LButtonWidth > AWidth) then
    Result := Result + GetSystemMetrics(SM_CYMENU);
end;

function TFormStyleHook.TMainMenuBarStyleHook.GetMenuItemWidth(AMenuItem: TMenuItem; ACanvas: TCanvas): Integer;
var
  R: TRect;
begin
  if (AMenuItem.GetParentMenu = nil) or not AMenuItem.Visible then
    Exit(0);

  R := Rect(0, 0, 0, 0);
  DrawText(ACanvas.Handle, PChar(AMenuItem.Caption), Length(AMenuItem.Caption), R, DT_CALCRECT);
  Result := R.Width + 10;
  if (AMenuItem.GetParentMenu.Images <> nil) and (AMenuItem.ImageIndex >= 0) and
     (AMenuItem.ImageIndex < AMenuItem.GetParentMenu.Images.Count) then
    Result := Result + MainMenu.Images.Width + 6;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.DrawItem(AItem: TMenuBarItem; ACanvas: TCanvas);
var
  Details: TThemedElementDetails;
  SaveIndex: Integer;
  LWidth, LHeight: Integer;
  R: TRect;
  LTextColor: TColor;
  ItemMainMenu: TMenu;
  LStyle: TCustomStyleServices;
begin
  if AItem.MenuItem.GetParentMenu = nil then
    Exit;

  LStyle := StyleServices;
  ItemMainMenu := AItem.MenuItem.GetParentMenu;
  {check item state}
  if FActiveItem = AItem.Index then
  begin
    if FMenuPush then
      AItem.State := tmMenuBarItemPushed
    else if not FSysMenuActive and not FMDIChildSysMenuActive then
      AItem.State := tmMenuBarItemHot
    else
      AItem.State := tmMenuBarItemNormal;
  end
  else if AItem.MenuItem.Enabled then
    AItem.State := tmMenuBarItemNormal
  else
    AItem.State := tmMenuBarItemDisabled;
  Details := LStyle.GetElementDetails(AItem.State);
  {draw item body}
  SaveIndex := SaveDC(ACanvas.Handle);
  try
    LStyle.DrawElement(ACanvas.Handle, Details, AItem.ItemRect);
  finally
    RestoreDC(ACanvas.Handle, SaveIndex);
  end;
  R := AItem.ItemRect;
  if FFormHook.Control.BiDiMode <> bdRightToLeft then
    Inc(R.Left, 5)
  else
    Dec(R.Right, 5);
  {draw item image}
  if (ItemMainMenu.Images <> nil) and (AItem.MenuItem.ImageIndex >= 0) and
     (AItem.MenuItem.ImageIndex < MainMenu.Images.Count) then
  begin
    if FFormHook.Control.BiDiMode <> bdRightToLeft then
      LWidth := R.Left
    else
      LWidth := R.Right - ItemMainMenu.Images.Width;
    LHeight := R.Top + R.Height div  2 - ItemMainMenu.Images.Height div 2;
    ImageList_Draw(MainMenu.Images.Handle, AItem.MenuItem.ImageIndex,
      ACanvas.Handle, LWidth, LHeight, ILD_TRANSPARENT);
    if FFormHook.Control.BiDiMode <> bdRightToLeft then
      R.Left := R.Left + ItemMainMenu.Images.Width + 3
    else
      R.Right := R.Right - ItemMainMenu.Images.Width - 3;
  end;
  {draw item text}
  if LStyle.GetElementColor(Details, ecTextColor, LTextColor) then
    ACanvas.Font.Color := TColor(LTextColor);
  if (FMenuPush or FMenuActive) and FEnterWithKeyboard then
    DrawText(ACanvas.Handle, PChar(AItem.MenuItem.Caption), Length(AItem.MenuItem.Caption),
      R, FFormHook.Control.DrawTextBiDiModeFlags(DT_LEFT or DT_VCENTER or DT_SINGLELINE))
  else
    DrawText(ACanvas.Handle, PChar(AItem.MenuItem.Caption), Length(AItem.MenuItem.Caption),
      R, FFormHook.Control.DrawTextBiDiModeFlags(DT_LEFT or DT_VCENTER or DT_HIDEPREFIX or DT_SINGLELINE));
end;


type
  TMenuItemClass = class(TMenuItem);

procedure TFormStyleHook.TMainMenuBarStyleHook.Paint(Canvas: TCanvas);

function GetItemCount(AMenu, AMergedMenu: TMainMenu): Integer;

procedure Insert(APos: Integer; var ACount: Integer; AItem: TMenuItem);
var
  I: Integer;
begin
  Inc(ACount);
  if APos = ACount - 1 then
    FItems[APos].MenuItem := AItem
  else
  begin
    for I := ACount - 1 downto APos + 1 do
      FItems[I].MenuItem := FItems[I - 1].MenuItem;
    FItems[APos].MenuItem := AItem;
  end;
end;

function CanAddItem(AItem: TMenuItem): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to AMergedMenu.Items.Count - 1 do
    if AItem.GroupIndex = AMergedMenu.Items[I].GroupIndex then
    begin
      Result := False;
      Break;
    end;
end;

var
  I, J, Count, Index: Integer;
begin
  if AMenu = nil then
    Exit(0);

  if AMergedMenu <> nil then
  begin
    Count := AMenu.Items.Count + AMergedMenu.Items.Count;
    SetLength(FItems, Count);
    Result := AMergedMenu.Items.Count;
    {add items from child menu}
    for I := 0 to Result - 1 do
      FItems[I].MenuItem := AMergedMenu.Items[I];
    {add items from menu}
    for I := AMenu.Items.Count - 1 downto 0 do
      if CanAddItem(AMenu.Items[I]) then
      begin
        Index := -1;
        for J := 0 to Result - 1 do
          if AMenu.Items[I].GroupIndex <= FItems[J].MenuItem.GroupIndex then
          begin
            Index := J;
            Break;
          end;
        if Index = -1 then Index := Result;
        Insert(Index, Result, AMenu.Items[I]);
      end;
  end
  else
  begin
    {add items from menu}
    Result := AMenu.Items.Count;
    SetLength(FItems, Result);
    for I := 0 to Result - 1 do
      FItems[I].MenuItem := AMenu.Items[I];
  end;
end;

function IsRightJustify(AMenu: HMenu; AIndex: Integer): Boolean;
var
  Info: TMenuItemInfo;
begin
  FillChar(Info, SizeOf(Info), 0);
  Info.cbSize := SizeOf(TMenuItemInfo);
  Info.fMask := MIIM_TYPE;
  GetMenuItemInfo(AMenu, FItems[AIndex].MenuItem.Command, False, Info);
  Result := Info.fType and MFT_RIGHTJUSTIFY = MFT_RIGHTJUSTIFY;
end;

var
  Details: TThemedElementDetails;
  Buffer: TBitMap;
  FMenu, FMergedMenu: TMainMenu;
  I, X, Y, W, BW: Integer;
  SaveIndex: Integer;
  FIconDraw, FRightAlign: Boolean;
  LStyle: TCustomStyleServices;
  FMerged: TMenuItem;
  RX: Integer;
  FPrevIndex: Integer;
begin
  if (FBoundsRect.Width = 0) or (FBoundsRect.Height = 0) then
    Exit;

  LStyle := StyleServices;
  if not LStyle.Available then
    Exit;

  {get main menu}
  FMenu := MainMenu;
  if FMenu = nil then
    Exit;

  {get merged menu}
  FMergedMenu := nil;

  FMerged := TMenuItemClass(FFormHook.Form.Menu.Items).Merged;
  if (FMerged <> nil) and (FMerged.Count > 0) and (FMerged.GetParentMenu is TMainMenu) then
    FMergedMenu := TMainMenu(FMerged.GetParentMenu);

  Buffer := TBitMap.Create;
  try
    Buffer.SetSize(FBoundsRect.Width, FBoundsRect.Height);
    {draw menu bar}
    SaveIndex := SaveDC(Buffer.Canvas.Handle);
    try
      Details := LStyle.GetElementDetails(tmMenuBarBackgroundActive);
      LStyle.DrawElement(Buffer.Canvas.Handle, Details,
      Rect(0, 0, Buffer.Width, Buffer.Height));
    finally
      RestoreDC(Buffer.Canvas.Handle, SaveIndex);
    end;
    Buffer.Canvas.Font.Assign(Screen.MenuFont);

    if CheckPerMonitorV2SupportForWindow(FFormHook.Form.Handle) then
      Buffer.Canvas.Font.Height := MulDiv(Buffer.Canvas.Font.Height,
        FFormHook.Form.CurrentPPI, Screen.PixelsPerInch);

    Buffer.Canvas.Brush.Style := bsClear;
    {draw mdi child icon}
    FIconDraw := FShowMDIButtons and CanTrackMDISystemMenu;
    if FIconDraw then
      DrawIconEx(Buffer.Canvas.Handle, 2, 2, GetIconFast.Handle, 0, 0, 0, 0, DI_NORMAL);

    {initialize array of items}
    FItemCount := GetItemCount(FMenu, FMergedMenu);

    {draw items}
    FRightAlign := FFormHook.Control.BiDiMode = bdRightToLeft;
    BW := GetSystemMetrics(SM_CYMENU);
    Y := 0;
    if FShowMDIButtons then
      RX := FBoundsRect.Width - BW * 3
    else
      RX := FBoundsRect.Width;
    if not FRightAlign then
    begin
      if FIconDraw then
        X := BW
      else
        X := 0;
    end
    else
      X := RX;

    for I := 0 to FItemCount - 1 do
    begin
      FItems[I].Index := I;
      W := GetMenuItemWidth(FItems[I].MenuItem, Buffer.Canvas);
      if W = 0 then
      begin
        FItems[I].ItemRect := Rect(0, 0, 0, 0);
        Continue;
      end;
      if not FRightAlign then
      begin
        FItems[I].ItemRect.Left := X;
        FItems[I].ItemRect.Right := FItems[I].ItemRect.Left + W;
        if (FItems[I].ItemRect.Right > FBoundsRect.Width) and (X <> 0) then
        begin
          Y := Y + GetSystemMetrics(SM_CYMENU);
          FItems[I].ItemRect.Left := 0;
          FItems[I].ItemRect.Right := W;
        end;
        X := FItems[I].ItemRect.Right;
      end
      else
      begin
        FItems[I].ItemRect.Left := X - W;
        FItems[I].ItemRect.Right := FItems[I].ItemRect.Left + W;
        if (FItems[I].ItemRect.Left < 0) and (X <> 0) then
        begin
          Y := Y + GetSystemMetrics(SM_CYMENU);
          if FShowMDIButtons then
            FItems[I].ItemRect.Right := FBoundsRect.Width - BW * 3
          else
            FItems[I].ItemRect.Right := FBoundsRect.Width;
          FItems[I].ItemRect.Left := FItems[I].ItemRect.Right - W;
        end;
        X := FItems[I].ItemRect.Left;
      end;
      FItems[I].ItemRect.Top := Y;
      FItems[I].ItemRect.Bottom := FItems[I].ItemRect.Top + GetSystemMetrics(SM_CYMENU);
    end;

    if not FRightAlign then
    begin
      FPrevIndex := -1;
      for I := FItemCount - 1 downto 0 do
        if IsRightJustify(FMenu.Handle, I) then
        begin
          FItems[I].Index := I;
          W := FItems[I].ItemRect.Width;
          if (W > 0) and ((FPrevIndex = -1) or
             ((FPrevIndex >= 0) and (FItems[I].ItemRect.Top = FItems[FPrevIndex].ItemRect.Top))) then
          begin
            FItems[I].ItemRect.Left := RX - W;
            FItems[I].ItemRect.Right := RX;
            RX := FItems[I].ItemRect.Left;
            FPrevIndex := I;
          end;
        end;
    end;

    for I := 0 to FItemCount - 1 do
      if FItems[I].ItemRect.Width > 0 then
        DrawItem(FItems[I], Buffer.Canvas);

    {draw mdi buttons}
    X := Buffer.Width;
    Y := Buffer.Height - BW;
    if FShowMDIButtons then
    begin
      for I := 0 to 2 do
      begin
        FMDIButtons[I].Index := I;
        case I of
          0:
            begin
              if (I = FHotMDIButton) and (I = FPressedMDIButton) then
                FMDIButtons[I].State := twMDICloseButtonPushed
              else if (I = FHotMDIButton) then
                FMDIButtons[I].State := twMDICloseButtonHot
              else
                FMDIButtons[I].State := twMDICloseButtonNormal;
            end;
          1:
            begin
              if (I = FHotMDIButton) and (I = FPressedMDIButton) then
                FMDIButtons[I].State := twMDIRestoreButtonPushed
              else if (I = FHotMDIButton) then
                FMDIButtons[I].State := twMDIRestoreButtonHot
              else
                FMDIButtons[I].State := twMDIRestoreButtonNormal;
            end;

         2:
            begin
              if (I = FHotMDIButton) and (I = FPressedMDIButton) then
                FMDIButtons[I].State := twMDIMinButtonPushed
              else if (I = FHotMDIButton) then
                FMDIButtons[I].State := twMDIMinButtonHot
              else
                FMDIButtons[I].State := twMDIMinButtonNormal;
            end;
        end;
        FMDIButtons[I].ItemRect := Rect(X - BW, Y, X, Y + BW);
        Details := LStyle.GetElementDetails(FMDIButtons[I].State);
        LStyle.DrawElement(Buffer.Canvas.Handle, Details,
          FMDIButtons[I].ItemRect);
        X := X - BW;
      end;
    end;
    {draw buffer}
    Canvas.Draw(FBoundsRect.Left, FBoundsRect.Top, Buffer);
  finally
    Buffer.Free;
  end;
end;

class function TFormStyleHook.TMainMenuBarStyleHook.PopupMenuHook(Code: Integer; WParam: WPARAM; var Msg: TMsg): LRESULT;
var
  FItem: Integer;
  FFindItemKind: TFindItemKind;
  P: TPoint;
  FOldActiveItem: Integer;
  I: Integer;
  CanFindItem: Boolean;
begin
  if (FMenuBarHook = nil) or
     ((FMenuBarHook <> nil) and (FMenuBarHook.MainMenu = nil)) then
    Exit(0);
  Result := CallNextHookEx(FMenuBarHook.FMenuHook, Code, WParam, IntPtr(@Msg));
  if Result <> 0 then
    Exit;

  if FMenuBarHook.FSelectFirstItem then
  begin
    FMenuBarHook.FSelectFirstItem := False;
    if not (shMenus in TStyleManager.SystemHooks) and
       (Msg.Message <> WM_MENUSELECT) and FMenuBarHook.FEnterWithKeyboard then
       PostMessage(Msg.Hwnd, WM_KEYDOWN, VK_DOWN, 0);
    if (shMenus in TStyleManager.SystemHooks) and (GetKeyState(VK_LBUTTON) < 0) then
      PostMessage(Msg.Hwnd, $01EE, 0, 0);
  end;

  if Code = MSGF_MENU then
    case Msg.Message of
      WM_MOUSEMOVE:
        if (WindowFromPoint(Mouse.CursorPos) = FMenuBarHook.FFormHook.Handle) and
           not FMenuBarHook.FMustActivateMenuItem then
        begin
          P := Mouse.CursorPos;
          P.X := P.X - FMenuBarHook.FFormHook.Control.Left -
            FMenuBarHook.FBoundsRect.Left;
          P.Y := P.Y - FMenuBarHook.FFormHook.Control.Top -
            FMenuBarHook.FBoundsRect.Top;
          FOldActiveItem := FMenuBarHook.FActiveItem;
          FMenuBarHook.MouseMove(P.X, P.Y);
          if (FOldActiveItem <> FMenuBarHook.FActiveItem) and
             (FMenuBarHook.FActiveItem <> -1) then
          begin
            P := Mouse.CursorPos;
            FMenuBarHook.FMustActivateMenuItem := True;
            PostMessage(FMenuBarHook.FFormHook.Handle, WM_NCLBUTTONDOWN, MK_LBUTTON,
              Integer(PointToSmallPoint(P))); // 64-bit safe Integer cast
          end;
        end;
      WM_SYSKEYDOWN:
        if Msg.wParam = VK_MENU then
        begin
           FMenuBarHook.FMustActivateMenuItem := False;
           FMenuBarHook.MenuExit;
         end;
      WM_MENUSELECT:
        begin
          FFindItemKind := fkCommand;
          if (Msg.WParam shr 16) and MF_POPUP <> 0 then
            FFindItemKind := fkHandle;
          if FFindItemKind = fkHandle then
            FItem := GetSubMenu(HMENU(Msg.LParam), LoWord(Msg.WParam))
          else
            FItem := LoWord(Msg.WParam);
          FCurrentMenuItem := FMenuBarHook.FindItem(FItem, FFindItemKind);
        end;
      WM_KEYDOWN:
        begin
          if  FMenuBarHook.FFormHook.Control.BidiMode = bdRightToLeft then
          begin
            if Msg.WParam = VK_RIGHT then Msg.WParam := VK_LEFT else
              if Msg.WParam = VK_LEFT then Msg.WParam := VK_RIGHT;
          end;

          CanFindItem := False;

          if Msg.WParam = VK_RIGHT then
             CanFindItem := FMenuBarHook.CanFindNextItem(FCurrentMenuItem)
          else if Msg.WParam = VK_LEFT then
             CanFindItem := FMenuBarHook.CanFindPriorItem(FCurrentMenuItem);

          case Msg.WParam of
            VK_RIGHT:
             if CanFindItem then
             begin
               FMenuBarHook.FEnterWithKeyboard := True;
               if FMenuBarHook.FSystemMenuTracking and
                  FMenuBarHook.CanTrackMDISystemMenu then
               begin
                 P := Mouse.CursorPos;
                 FMenuBarHook.FMustActivateMDIChildSysMenu := True;
                 EndMenu;
                 PostMessage(FMenuBarHook.FFormHook.Handle, WM_NCLBUTTONDOWN, MK_LBUTTON,
                   Integer(PointToSmallPoint(P))); // 64-bit safe Integer cast
                 Exit;
               end
               else
                 if not FMenuBarHook.FSystemMenuTracking then
                   I := FMenuBarHook.FindNextMenuItem(False)
                 else
                   I := FMenuBarHook.FindFirstMenuItem(False);

               if I <> -1 then
               begin
                 FMenuBarHook.FActiveItem := I;
                 P := Mouse.CursorPos;
                 FMenuBarHook.FMustActivateMenuItem := True;
                 EndMenu;
                 PostMessage(FMenuBarHook.FFormHook.Handle, WM_NCLBUTTONDOWN, MK_LBUTTON,
                   Integer(PointToSmallPoint(P)));
               end
               else if not FMenuBarHook.FSystemMenuTracking then
               begin
                 P := Mouse.CursorPos;
                 FMenuBarHook.FMustActivateSysMenu := True;
                 EndMenu;
                 PostMessage(FMenuBarHook.FFormHook.Handle, WM_NCLBUTTONDOWN, MK_LBUTTON,
                   Integer(PointToSmallPoint(P))); // 64-bit safe Integer cast
               end;
             end;
           VK_LEFT:
           if CanFindItem then
             begin
               FMenuBarHook.FEnterWithKeyboard := True;
               if FMenuBarHook.FMDIChildSystemMenuTracking
               then
                 I := -1
               else if not FMenuBarHook.FSystemMenuTracking then
                 I := FMenuBarHook.FindPriorMenuItem(False)
               else
                 I := FMenuBarHook.FindFirstRightMenuItem(False);

               if I <> -1 then
               begin
                 FMenuBarHook.FActiveItem := I;
                 P := Mouse.CursorPos;
                 FMenuBarHook.FMustActivateMenuItem := True;
                 EndMenu;
                 PostMessage(FMenuBarHook.FFormHook.Handle, WM_NCLBUTTONDOWN, MK_LBUTTON,
                   Integer(PointToSmallPoint(P))); // 64-bit safe Integer cast
               end
               else if FMenuBarHook.CanTrackMDISystemMenu and
                    not FMenuBarHook.FMDIChildSystemMenuTracking then
               begin
                 P := Mouse.CursorPos;
                 FMenuBarHook.FMustActivateMDIChildSysMenu := True;
                 EndMenu;
                 PostMessage(FMenuBarHook.FFormHook.Handle, WM_NCLBUTTONDOWN, MK_LBUTTON,
                   Integer(PointToSmallPoint(P))); // 64-bit safe Integer cast
               end
               else if not FMenuBarHook.FSystemMenuTracking then
               begin
                 P := Mouse.CursorPos;
                 FMenuBarHook.FMustActivateSysMenu := True;
                 EndMenu;
                 PostMessage(FMenuBarHook.FFormHook.Handle, WM_NCLBUTTONDOWN, MK_LBUTTON,
                   Integer(PointToSmallPoint(P))); // 64-bit safe Integer cast
               end;
             end;
         end;
       end;
    end;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.SetBoundsRect(const ABoundsRect: TRect);
begin
  FBoundsRect := ABoundsRect;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.MouseUp(X, Y: Integer);
begin
  FActiveItem := ItemFromPoint(X, Y);
  if FActiveItem <> -1 then
  begin
    Invalidate;
    if FItems[FActiveItem].MenuItem.Count = 0 then
      MainMenu.DispatchCommand(FItems[FActiveItem].MenuItem.Command);
  end;

  if FShowMDIButtons then
  begin
    FHotMDIButton := MDIButtonFromPoint(X, Y);
    if (FHotMDIButton <> -1) and (FPressedMDIButton = FHotMDIButton) then
    begin
      FPressedMDIButton := -1;
      Invalidate;
      case FMDIButtons[FHotMDIButton].Index of
        0: MDIChildClose;
        1: MDIChildRestore;
        2: MDIChildMinimize;
      end;
    end
    else
      FPressedMDIButton := -1;
  end;
end;


procedure TFormStyleHook.TMainMenuBarStyleHook.MouseDown(X, Y: Integer);
begin

  FActiveItem := ItemFromPoint(X, Y);
  if FActiveItem <> -1 then
    MenuEnter(True)
  else
  begin
    if FShowMDIButtons and CanTrackMDISystemMenu and Rect(0, 0,
       GetSystemMetrics(SM_CYMENU), GetSystemMetrics(SM_CYMENU)).Contains(Point(X, Y)) then
      TrackMDIChildSystemMenu;
  end;

  if FShowMDIButtons then
  begin
    FHotMDIButton := MDIButtonFromPoint(X, Y);
    FPressedMDIButton := FHotMDIButton;
    if FPressedMDIButton <> -1 then
      Invalidate;
  end;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.MouseMove(X, Y: Integer);
begin
  if FMustActivateMenuItem  or ((FOldCursorPos = Mouse.CursorPos) and (FMenuActive or FMenuPush)) then
    Exit;

  FOldCursorPos := Mouse.CursorPos;

  FMouseInMainMenu := not ((X < 0) or (Y < 0));
  if FMenuPush then
  begin
    if ItemFromPoint(X, Y) <> -1 then
      FActiveItem := ItemFromPoint(X, Y);
  end
  else
    FActiveItem := ItemFromPoint(X, Y);

  if FActiveItem <> FOldActiveItem then
  begin
    Invalidate;
    FOldActiveItem := FActiveItem;
    if FMenuPush and  (FMenuHook = 0) and (FItems[FActiveItem].MenuItem.Count <> 0) then
      TrackMenuFromItem;
  end;

  if FShowMDIButtons then
  begin
    FHotMDIButton := MDIButtonFromPoint(X, Y);
    if FHotMDIButton <> FOldMDIHotButton then
    begin
      Invalidate;
      FOldMDIHotButton := FHotMDIButton;
    end;
    if FHotMDIButton = -1 then FPressedMDIButton := -1;
  end;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.TrackMDIChildSystemMenu;
var
  X, Y: Integer;
  Child: TCustomForm;
  P: TPoint;
  R: TRect;
begin
  FMDIChildSysMenuActive := False;
  FSysMenuActive := False;
  if FFormHook.Form.FormStyle <> fsMDIForm then
    Exit;

  Child := FFormHook.Form.ActiveMDIChild;
  if Child = nil then
    Exit;

  FMDIChildSystemMenuTracking := True;
  if Child.WindowState = wsMaximized then
  begin
    X := FFormHook.FLeft + FBoundsRect.Left;
    Y := FFormHook.FTop + FBoundsRect.Bottom;
  end
  else
  begin
    P := FFormHook.Control.ClientToScreen(Point(0, 0));
    R := FFormHook.GetMDIWorkArea;
    X := P.X + R.Left + Child.Left + FBoundsRect.Left;
    Y := P.Y + R.Top + Child.Top + FBoundsRect.Top;
  end;
  HookMenus;
  SendMessage(Child.Handle, $313, 0, MakeLong(X, Y));
  UnHookMenus;
  FMDIChildSystemMenuTracking := False;
  Invalidate;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.TrackSystemMenu;
var
  X, Y: Integer;
  LeftPoint, RightPoint: TPoint;
begin
  FMDIChildSysMenuActive := False;
  FSysMenuActive := False;
  FSystemMenuTracking := True;
  X := FFormHook.FLeft + FBoundsRect.Left;
  Y := FFormHook.FTop + FBoundsRect.Top;
  LeftPoint := Point(X, Y);
  RightPoint := Point(X + 50, Y);
  if Screen.MonitorFromPoint(LeftPoint) <> Screen.MonitorFromPoint(RightPoint)
  then
    X := Screen.MonitorFromPoint(RightPoint).WorkareaRect.Left;
  HookMenus;
  SendMessage(FFormHook.Handle, $313, 0, MakeLong(X, Y));
  UnHookMenus;
  FSystemMenuTracking := False;
  Invalidate;
end;

procedure TFormStyleHook.TMainMenuBarStyleHook.TrackMenuFromItem;
var
  P: TPoint;
  Cmd: Bool;
  FItem: TMenuItem;
begin
  FMDIChildSysMenuActive := False;
  FSysMenuActive := False;
  FMenuPush := True;
  Invalidate;
  if FItems[FActiveItem].MenuItem.Count = 0 then
    Exit;
  P := GetTrackMenuPos(FItems[FActiveItem]);

  HookMenus;
  if FFormHook.Control.BiDiMode <> bdRightToLeft then
    Cmd := TrackPopupMenu(FItems[FActiveItem].MenuItem.Handle,
      TPM_LEFTBUTTON  or TPM_RIGHTBUTTON or TPM_RETURNCMD or TPM_NOANIMATION,
        P.X, P.Y, 0, FFormHook.Handle, nil)
  else
    Cmd := TrackPopupMenu(FItems[FActiveItem].MenuItem.Handle,
      TPM_LEFTBUTTON  or TPM_RIGHTBUTTON or TPM_RETURNCMD or TPM_NOANIMATION or TPM_RIGHTALIGN,
        P.X, P.Y, 0, FFormHook.Handle, nil);
  UnHookMenus;

  FMenuPush := False;

  if Cmd then
  begin
    FItem := FindItem(IntPtr(Cmd), fkCommand);
    if FItem <> nil then
      FItem.GetParentMenu.DispatchCommand(FItem.Command)
    else
      PostMessage(FFormHook.Handle, WM_COMMAND, WParam(Cmd), 0);
    MenuExit;
  end
  else if not FMustActivateMenuItem then
  begin
    FMenuActive := True;
    FInMenuLoop := False;
    ProcessMenuLoop(False);
  end;

  Invalidate;
end;

{ TFormStyleHook }

constructor TFormStyleHook.Create(AControl: TWinControl);
begin
  inherited;
  FocusUpdate := False;
  FStretchedCaptionInc := 0;

  if seClient in Form.StyleElements then
    OverrideEraseBkgnd := True;

  if IsStyleBorder then
    OverridePaintNC := True;

  FMainMenuBarHook := nil;
  FMDIHorzScrollBar := nil;
  FMDIVertScrollBar := nil;
  FMDIScrollSizeBox := nil;
  FMDIClientInstance := nil;
  FMDIPrevClientProc := nil;
  FChangeVisibleChildHandle := 0;
  FStopCheckChildMove := False;
  FOldHorzSrollBarPosition := 0;
  FOldVertSrollBarPosition := 0;

  FMDIStopHorzScrollBar := False;
  FMDIStopVertScrollBar := False;

  MouseInNCArea := True;
  FFormActive := False;
  FChangeSizeCalled := False;
  FRegion := 0;
  FLeft := Control.Left;
  FTop := Control.Top;
  FWidth := Control.Width;
  FHeight := Control.Height;
  FNeedsUpdate := True;
  FIcon := nil;
  FIconHandle := 0;
  FHotButton := 0;
  FPressedButton := 0;
  FCaptionEmulation := False;
  FRestoring := False;
end;

destructor TFormStyleHook.Destroy;
begin
  if FIcon <> nil then
    FreeAndNil(FIcon);

  if FMDIClientInstance <> nil then
  begin
    SetWindowLong(TForm(Control).ClientHandle, GWL_WNDPROC, IntPtr(FMDIPrevClientProc));
    FreeObjectInstance(FMDIClientInstance);
  end;

  if FMainMenuBarHook <> nil then
    FreeAndNil(FMainMenuBarHook);
  if FMDIHorzScrollBar <> nil then
    FreeAndNil(FMDIHorzScrollBar);
  if FMDIVertScrollBar <> nil then
    FreeAndNil(FMDIVertScrollBar);
  if FMDIScrollSizeBox <> nil then
    FreeAndNil(FMDIScrollSizeBox);
  inherited;
end;

function TFormStyleHook.IsStyleBorder: Boolean;
begin
  Result := (TStyleManager.FormBorderStyle = fbsCurrentStyle) and (seBorder in Form.StyleElements);
end;

procedure TFormStyleHook.Invalidate;
begin
  // Prevent ancestor's Invalidate from executing
end;

procedure TFormStyleHook.MDIHorzScroll(Offset: Integer);
var
  I: Integer;
begin
  FStopCheckChildMove := True;
  try
    for I := 0 to Form.MDIChildCount -1 do
      if Form.MDIChildren[I].Visible then
        Form.MDIChildren[I].Left := Form.MDIChildren[I].Left + Offset;
  finally
    FStopCheckChildMove := False;
  end;
  GetMDIScrollInfo(False);
end;

procedure TFormStyleHook.MDIVertScroll(Offset: Integer);
var
  I: Integer;
begin
  FStopCheckChildMove := True;
  try
    for I := 0 to Form.MDIChildCount -1 do
      if Form.MDIChildren[I].Visible then
        Form.MDIChildren[I].Top := Form.MDIChildren[I].Top + Offset;
  finally
    FStopCheckChildMove := False;
  end;
  GetMDIScrollInfo(False);
end;

procedure TFormStyleHook.OnMDIHScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
var
  Offset: Integer;
begin
  if (FMDIStopHorzScrollBar) or (ScrollCode <> scEndScroll) then
    Exit;

  Offset := TScrollBar(FMDIHorzScrollBar).Position - FOldHorzSrollBarPosition;
  if Offset <> 0 then
    MDIHorzScroll(-Offset);
  FOldHorzSrollBarPosition := TScrollBar(FMDIHorzScrollBar).Position;
end;

procedure TFormStyleHook.OnMDIVScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
var
  Offset: Integer;
begin
  if (FMDIStopVertScrollBar) or (ScrollCode <> scEndScroll) then
    Exit;

  Offset := TScrollBar(FMDIVertScrollBar).Position - FOldVertSrollBarPosition;
  if Offset <> 0 then
    MDIVertScroll(-Offset);
  FOldVertSrollBarPosition := TScrollBar(FMDIVertScrollBar).Position;
end;

function TFormStyleHook.MDIChildMaximized: Boolean;
begin
  Result := (Form.ActiveMDIChild <> nil) and
    (Form.ActiveMDIChild.WindowState = wsMaximized);
end;

procedure TFormStyleHook.GetMDIScrollInfo(SetRange: Boolean);
var
  I, MinX, MinY, MaxX, MaxY, HPage, VPage: Integer;
  R, MDIR, MDICLR: TRect;
  ReCalcInfo: Boolean;
  LHorzScrollVisible, LVertScrollVisible: Boolean;
  LMDIHorzScrollBar: TScrollBar;
  LMDIVertScrollBar: TScrollBar;
begin
  LMDIHorzScrollBar := TScrollBar(FMDIHorzScrollBar);
  LMDIVertScrollBar := TScrollBar(FMDIVertScrollBar);
  if (LMDIHorzScrollBar = nil) or (LMDIVertScrollBar = nil) then
    Exit;

  if (not (LMDIVertScrollBar.HandleAllocated)) or
     (not LMDIHorzScrollBar.HandleAllocated) then
    Exit;

  if MDIChildMaximized then
  begin
    if IsWindowVisible(LMDIHorzScrollBar.Handle) then
      ShowWindow(LMDIHorzScrollBar.Handle, SW_HIDE);
    if IsWindowVisible(LMDIVertScrollBar.Handle) then
      ShowWindow(LMDIVertScrollBar.Handle, SW_HIDE);
    if IsWindowVisible(FMDIScrollSizeBox.Handle) then
      ShowWindow(FMDIScrollSizeBox.Handle, SW_HIDE);
    Exit;
  end;

  ReCalcInfo := False;
  R := GetMDIWorkArea;

  MinX := MaxInt;
  MinY := MaxInt;
  MaxX := -MaxInt;
  MaxY := -MaxInt;

  for I := 0 to Form.MDIChildCount -1 do
   if (Form.MDIChildren[I].Visible) and
      (Form.MDIChildren[I].Handle <> FChangeVisibleChildHandle) then
     with Form do
     begin
       GetWindowRect(MDIChildren[I].Handle, MDIR);
       GetWindowRect(TForm(Control).ClientHandle, MDICLR);
       OffsetRect(MDIR, -MDICLR.Left, -MDICLR.Top);
       if MinX > MDIR.Left then
         MinX := MDIR.Left;
       if MinY > MDIR.Top then
         MinY := MDIR.Top;
       if MaxX < MDIR.Left + MDIR.Width then
         MaxX := MDIR.Left + MDIR.Width;
       if MaxY < MDIR.Top + MDIR.Height then
         MaxY := MDIR.Top + MDIR.Height;
     end;

  LHorzScrollVisible := (MinX < 0) or (MaxX > R.Width);
  LVertScrollVisible := (MinY < 0) or (MaxY > R.Height);

  if LVertScrollVisible and not LHorzScrollVisible then
    LHorzScrollVisible := (MinX < 0) or (MaxX > R.Width - LMDIVertScrollBar.Width);

  if LHorzScrollVisible and not LVertScrollVisible then
    LVertScrollVisible := (MinY < 0) or (MaxY > R.Height - LMDIHorzScrollBar.Height);

  if LHorzScrollVisible and not IsWindowVisible(LMDIHorzScrollBar.Handle) then
  begin
    SetWindowPos(LMDIHorzScrollBar.Handle, HWND_TOP,
      R.Left, R.Bottom - LMDIHorzScrollBar.Height,
      R.Width, LMDIHorzScrollBar.Height, SWP_SHOWWINDOW);
    ShowWindow(LMDIHorzScrollBar.Handle, SW_SHOW);
    ReCalcInfo := True;
  end
  else if not LHorzScrollVisible and IsWindowVisible(LMDIHorzScrollBar.Handle) then
  begin
    ShowWindow(LMDIHorzScrollBar.Handle, SW_HIDE);
    ReCalcInfo := True;
  end;

  if LVertScrollVisible and not IsWindowVisible(LMDIVertScrollBar.Handle) then
  begin
    if LHorzScrollVisible
    then
      SetWindowPos(LMDIVertScrollBar.Handle, HWND_TOP,
        R.Right - LMDIVertScrollBar.Width,
        R.Top, LMDIVertScrollBar.Width, R.Height - LMDIHorzScrollBar.Height, SWP_SHOWWINDOW)
    else
      SetWindowPos(LMDIVertScrollBar.Handle, HWND_TOP,
        R.Right - LMDIVertScrollBar.Width,
        R.Top, LMDIVertScrollBar.Width, R.Height, SWP_SHOWWINDOW);
    ShowWindow(LMDIVertScrollBar.Handle, SW_SHOW);
    ReCalcInfo := True;
  end
  else if not LVertScrollVisible and IsWindowVisible(LMDIVertScrollBar.Handle) then
  begin
    ShowWindow(LMDIVertScrollBar.Handle, SW_HIDE);
    ReCalcInfo := True;
  end;

  HPage := R.Width;
  VPage := R.Height;

  AdjustMDIScrollBars;

  if IsWindowVisible(LMDIHorzScrollBar.Handle) then
  begin
    if MinX > 0 then
      MinX := 0;
    if MaxX < R.Width then
      MaxX := R.Width;
    if SetRange then
    begin
      FMDIStopHorzScrollBar := True;
      if IsWindowVisible(LMDIVertScrollBar.Handle) then
        LMDIHorzScrollBar.PageSize := HPage - LMDIVertScrollBar.Width
      else
        LMDIHorzScrollBar.PageSize := HPage;
      LMDIHorzScrollBar.SetParams(-MinX, 0, MaxX - MinX - 1);
      FOldHorzSrollBarPosition := LMDIHorzScrollBar.Position;
      FMDIStopHorzScrollBar := False;
    end;
    LMDIHorzScrollBar.LargeChange := LMDIHorzScrollBar.PageSize;
  end;

  if IsWindowVisible(LMDIVertScrollBar.Handle) then
  begin
    if MinY > 0 then
      MinY := 0;
    if MaxY < R.Height then
      MaxY := R.Height;
    if SetRange then
    begin
      FMDIStopVertScrollBar := True;
      if IsWindowVisible(LMDIHorzScrollBar.Handle) then
        LMDIVertScrollBar.PageSize := VPage - LMDIHorzScrollBar.Height
      else
        LMDIVertScrollBar.PageSize := VPage;
      LMDIVertScrollBar.SetParams(-MinY, 0, MaxY - MinY - 1);
      FOldVertSrollBarPosition := LMDIVertScrollBar.Position;
      FMDIStopVertScrollBar := False;
    end;
    LMDIVertScrollBar.LargeChange := LMDIVertScrollBar.PageSize;
  end;

  if (not IsWindowVisible(LMDIHorzScrollBar.Handle)) and
     (not IsWindowVisible(LMDIVertScrollBar.Handle)) then ReCalcInfo := False;

  if IsWindowVisible(LMDIHorzScrollBar.Handle) and IsWindowVisible(LMDIVertScrollBar.Handle) and
     not IsWindowVisible(FMDIScrollSizeBox.Handle) then
  begin
    SetWindowPos(FMDIScrollSizeBox.Handle, HWND_TOP,
      R.Right - LMDIVertScrollBar.Width, R.Bottom - LMDIHorzScrollBar.Height,
      LMDIVertScrollBar.Width, LMDIHorzScrollBar.Height, SWP_SHOWWINDOW);
    ShowWindow(FMDIScrollSizeBox.Handle, SW_SHOW);
  end
  else if not IsWindowVisible(LMDIHorzScrollBar.Handle) or not IsWindowVisible(LMDIVertScrollBar.Handle) and
     IsWindowVisible(FMDIScrollSizeBox.Handle) then
    ShowWindow(FMDIScrollSizeBox.Handle, SW_HIDE);

  if ReCalcInfo then
    GetMDIScrollInfo(SetRange);
end;

procedure TFormStyleHook.InitMDIScrollBars;
begin
  if FMDIHorzScrollBar = nil then
  begin
    FMDIHorzScrollBar := TScrollBar.CreateParented(Control.Handle);
    with TScrollBar(FMDIHorzScrollBar) do
    begin
      Kind := sbHorizontal;
      OnScroll := OnMDIHScroll;
      SetWindowPos(FMDIHorzScrollBar.Handle, HWND_TOP,
        0, 0, 0, GetSystemMetrics(SM_CYHSCROLL), SWP_NOREDRAW);
      ShowWindow(FMDIHorzScrollBar.Handle, SW_HIDE);
    end;
  end;

  if FMDIVertScrollBar = nil then
  begin
    FMDIVertScrollBar := TScrollBar.CreateParented(Control.Handle);
    with TScrollBar(FMDIVertScrollBar) do
    begin
      Kind := sbVertical;
      OnScroll := OnMDIVScroll;
      SetWindowPos(FMDIVertScrollBar.Handle, HWND_TOP,
        0, 0, GetSystemMetrics(SM_CXVSCROLL), 0, SWP_NOREDRAW);
      ShowWindow(FMDIVertScrollBar.Handle, SW_HIDE);
    end;
  end;

  if FMDIScrollSizeBox = nil
  then
    begin
      FMDIScrollSizeBox := TScrollBarStyleHook.TScrollWindow.CreateParented(Control.Handle);
      with TScrollBarStyleHook.TScrollWindow(FMDIScrollSizeBox) do
      begin
        SizeBox := True;
        SetWindowPos(FMDIScrollSizeBox.Handle, HWND_TOP,
          0, 0, GetSystemMetrics(SM_CXVSCROLL), GetSystemMetrics(SM_CYHSCROLL), SWP_NOREDRAW);
        ShowWindow(FMDIScrollSizeBox.Handle, SW_HIDE);
      end;
    end;
end;

procedure TFormStyleHook.AdjustMDIScrollBars;
var
  R: TRect;
begin
  R := GetMDIWorkArea;

  if (FMDIHorzScrollBar <> nil) and IsWindowVisible(FMDIHorzScrollBar.Handle)
  then
    begin
      if (FMDIVertScrollBar <> nil) and IsWindowVisible(FMDIVertScrollBar.Handle) then
        SetWindowPos(FMDIHorzScrollBar.Handle, HWND_TOP, R.Left,
          R.Bottom - FMDIHorzScrollBar.Height, R.Width - FMDIVertScrollBar.Width, FMDIHorzScrollBar.Height, SWP_SHOWWINDOW)
      else
        SetWindowPos(FMDIHorzScrollBar.Handle, HWND_TOP, R.Left,
          R.Bottom - FMDIHorzScrollBar.Height, R.Width, FMDIHorzScrollBar.Height, SWP_SHOWWINDOW);
    end;

  if (FMDIVertScrollBar <> nil) and IsWindowVisible(FMDIVertScrollBar.Handle) then
  begin
    if (FMDIHorzScrollBar <> nil) and IsWindowVisible(FMDIHorzScrollBar.Handle)
    then
      SetWindowPos(FMDIVertScrollBar.Handle, HWND_TOP,
        R.Right - FMDIVertScrollBar.Width,
        R.Top, FMDIVertScrollBar.Width, R.Height - FMDIHorzScrollBar.Height, SWP_SHOWWINDOW)
    else
      SetWindowPos(FMDIVertScrollBar.Handle, HWND_TOP,
        R.Right - FMDIVertScrollBar.Width,
        R.Top, FMDIVertScrollBar.Width, R.Height, SWP_SHOWWINDOW)
  end;

  if (FMDIScrollSizeBox <> nil) and IsWindowVisible(FMDIScrollSizeBox.Handle) and
     (FMDIVertScrollBar <> nil) and IsWindowVisible(FMDIVertScrollBar.Handle) and
     (FMDIHorzScrollBar <> nil) and IsWindowVisible(FMDIHorzScrollBar.Handle) then
    SetWindowPos(FMDIScrollSizeBox.Handle, HWND_TOP,
      R.Right - FMDIVertScrollBar.Width, R.Bottom - FMDIHorzScrollBar.Height,
      FMDIVertScrollBar.Width, FMDIHorzScrollBar.Height, SWP_SHOWWINDOW);
end;

function TFormStyleHook.GetMDIWorkArea: TRect;
var
  P: TPoint;
begin
  Result := Control.ClientRect;
  if TForm(Control).ClientHandle <> 0 then
  begin
    GetWindowRect(TForm(Control).ClientHandle, Result);
    P := Control.ClientToScreen(Point(0, 0));
    OffsetRect(Result, -P.X, -P.Y);
  end;
end;

procedure TFormStyleHook.MDIClientWndProc(var Message: TMessage);
var
  FCallOldProc: Boolean;
  R: TRect;
  Details: TThemedElementDetails;
begin
  FCallOldProc := True;
  case Message.Msg of
    WM_NCACTIVATE:
      begin
        if TForm(Control).ActiveMDIChild <> nil then
          SendMessage(TForm(Control).ActiveMDIChild.Handle,
            Message.Msg, Message.wParam, Message.LParam);
        FCallOldProc := False;
        Message.Result := 1;
      end;
    WM_NCCALCSIZE:
      FCallOldProc := False;
   WM_NCPAINT:
      FCallOldProc := False;
    WM_ERASEBKGND:
      if StyleServices.Available then
      begin
        Details.Element := teWindow;
        Details.Part := 0;
        R := Rect(0, 0, TForm(Control).ClientWidth, TForm(Control).ClientHeight);
        if StyleServices.Available then
          StyleServices.DrawElement(Message.wParam, Details, R);
        FCallOldProc := False;
      end;
  end;

  if FCallOldProc then
    with Message do
      Result := CallWindowProc(FMDIPrevClientProc, Form.ClientHandle,
        Msg, wParam, lParam);
end;

procedure TFormStyleHook.PaintBackground(Canvas: TCanvas);
var
  Details: TThemedElementDetails;
  R: TRect;
begin
  if StyleServices.Available then
  begin
    Details.Element := teWindow;
    Details.Part := 0;
    R := Rect(0, 0, Control.ClientWidth, Control.ClientHeight);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;
end;

function TFormStyleHook.GetBorderSize: TRect;
var
  Size: TSize;
  Details: TThemedElementDetails;
  Detail: TThemedWindow;
begin
  Result := Rect(0, 0, 0, 0);
  if Form.BorderStyle = bsNone then Exit;
  FStretchedCaptionInc := 0;
  if not StyleServices.Available then Exit;
  {caption height}
  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
    Detail := twCaptionActive
  else
    Detail := twSmallCaptionActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementSize(0, Details, esActual, Size);
  Result.Top := Size.cy;
  if (Screen.PixelsPerInch > 96) or CheckPerMonitorV2SupportForWindow(Handle) then
  begin
    Result.Top := MulDiv(Result.Top, Form.CurrentPPI, 96);
    FStretchedCaptionInc := Result.Top - Size.cy;
  end;
  {left border width}
  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
    Detail := twFrameLeftActive
  else
    Detail := twSmallFrameLeftActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementSize(0, Details, esActual, Size);
  Result.Left := Size.cx;
  {right border width}
  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
    Detail := twFrameRightActive
  else
    Detail := twSmallFrameRightActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementSize(0, Details, esActual, Size);
  Result.Right := Size.cx;
  {bottom border height}
  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
    Detail := twFrameBottomActive
  else
    Detail := twSmallFrameBottomActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementSize(0, Details, esActual, Size);
  Result.Bottom := Size.cy;
end;

function TFormStyleHook.GetForm: TCustomForm;
begin
  Result := TCustomForm(Control);
end;

function TFormStyleHook.NormalizePoint(P: TPoint): TPoint;
var
  WindowPos, ClientPos: TPoint;
  HandleParent: HWnd;
begin
  if (Form.FormStyle = fsMDIChild) or (Form.Parent <> nil) then
  begin
    HandleParent := GetParent(Control.Handle);
    WindowPos := Point(FLeft, FTop);
    ClientToScreen(HandleParent, WindowPos);
    ClientPos := Point(0, 0);
    ClientToScreen(Handle, ClientPos);
    Result := P;
    ScreenToClient(Handle, Result);
    Inc(Result.X, ClientPos.X - WindowPos.X);
    Inc(Result.Y, ClientPos.Y - WindowPos.Y);
  end
  else
  begin
    WindowPos := Point(FLeft, FTop);
    ClientPos := Point(0, 0);
    ClientToScreen(Handle, ClientPos);
    Result := P;
    ScreenToClient(Handle, Result);
    Inc(Result.X, ClientPos.X - WindowPos.X);
    Inc(Result.Y, ClientPos.Y - WindowPos.Y);
  end;
end;

function TFormStyleHook.GetHitTest(P: TPoint): Integer;
var
  FBorderSize: TRect;
  FTopLeftRect,  FTopRightRect,
  FBottomLeftRect, FBottomRightRect,
  FTopRect, FLeftRect, FRightRect, FBottomRect, FHitCaptionRect: TRect;
begin
  Result := HTCLIENT;
  if Form.BorderStyle = bsNone then
  begin
    if (FMainMenuBarHook <> nil) and FMainMenuBarHook.BoundsRect.Contains(P) then
      Exit(HTMENU)
    else
      Exit;
  end;

  FBorderSize := GetBorderSize;
  FHitCaptionRect := FCaptionRect;
  FHitCaptionRect.Top := FBorderSize.Left;
  FBorderSize.Top := FHitCaptionRect.Top;

  {check buttons}
  if (FMainMenuBarHook <> nil) and FMainMenuBarHook.BoundsRect.Contains(P) then
    Exit(HTMENU)
  else if FHitCaptionRect.Contains(P) then
    Exit(HTCAPTION)
  else if FCloseButtonRect.Contains(P) then
    Exit(HTCLOSE)
  else if FMaxButtonRect.Contains(P) then
    Exit(HTMAXBUTTON)
  else if FMinButtonRect.Contains(P) then
    Exit(HTMINBUTTON)
  else if FHelpButtonRect.Contains(P) then
    Exit(HTHELP)
  else if FSysMenuButtonRect.Contains(P) then
    Exit(HTSYSMENU);

  {check window state}
  if (Form.WindowState = wsMaximized) or
     (Form.WindowState = wsMinimized) then
    Exit;

  {check border}
  if (Form.BorderStyle = bsDialog) or
     (Form.BorderStyle = bsSingle) or
     (Form.BorderStyle = bsToolWindow) then
  begin
    if Rect(FBorderSize.Left, FBorderSize.Top,
       FWidth - FBorderSize.Right, FHeight - FBorderSize.Bottom).Contains(P) then
      Exit(HTCLIENT)
    else
      Exit(HTBORDER);
  end;

  FTopLeftRect := Rect(0, 0, FBorderSize.Left, FBorderSize.Top);
  FTopRightRect := Rect(FWidth - FBorderSize.Right, 0, FWidth, FBorderSize.Top);
  FBottomLeftRect := Rect(0, FHeight - FBorderSize.Bottom, FBorderSize.Left, FHeight);
  FBottomRightRect := Rect(FWidth - FBorderSize.Right, FHeight - FBorderSize.Bottom,
    FWidth, FHeight);
  FTopRect := Rect(FTopLeftRect.Right, 0, FTopRightRect.Left, FBorderSize.Top);
  FLeftRect := Rect(0, FTopLeftRect.Bottom, FBorderSize.Left, FBottomLeftRect.Top);
  FRightRect := Rect(FWidth - FBorderSize.Right, FTopRightRect.Bottom, FWidth, FBottomRightRect.Top);
  FBottomRect := Rect(FBottomLeftRect.Right, FHeight - FBorderSize.Bottom, FBottomRightRect.Left, FHeight);

  if FTopLeftRect.Contains(P) then
    Result := HTTOPLEFT
  else if FTopRightRect.Contains(P) then
    Result := HTTOPRIGHT
  else if FBottomLeftRect.Contains(P) then
    Result := HTBOTTOMLEFT
   else if FBottomRightRect.Contains(P) then
    Result := HTBOTTOMRIGHT
  else if FLeftRect.Contains(P) then
    Result := HTLEFT
  else if FRightRect.Contains(P) then
    Result := HTRIGHT
  else if FBottomRect.Contains(P) then
    Result := HTBOTTOM
  else if FTopRect.Contains(P) then
    Result := HTTOP;
end;

procedure TFormStyleHook.CMDialogChar(var Message: TWMKey);

  function CheckHotKeyItem: Boolean;

    function CheckMenu(AMenu: TMainMenu): Boolean;
    var
      I: Integer;
    begin
      Result := False;
      for I := 0 to AMenu.Items.Count - 1 do
      if IsAccel(Message.CharCode, AMenu.Items[I].Caption) then
         Exit(True);
    end;

  begin
    Result := False;
    if Application.MainForm.Menu <> nil then
       Result := CheckMenu(Application.MainForm.Menu);
    if not Result and (Form.Menu <> nil) then
      Result := CheckMenu(Form.Menu);
  end;

begin
  if (FMainMenuBarHook <> nil) and
     (KeyDataToShiftState(Message.KeyData) = [ssAlt]) and
     FMainMenuBarHook.CheckHotKeyItem(Message.CharCode) then
  begin
    Message.Result := 1;
    Handled := True;
  end
  else
  if (Form.FormStyle = fsMDIChild) and
     (KeyDataToShiftState(Message.KeyData) = [ssAlt]) then
  begin
    CallDefaultProc(TMessage(Message));
    if (Message.Result = 0) and CheckHotKeyItem then
    begin
      SendMessage(Application.MainForm.Handle, CM_DIALOGCHAR,
        TMessage(Message).wParam, TMessage(Message).lParam);
    end;
    Handled := True;
  end;
end;

procedure TFormStyleHook.WMSetText(var Message: TMessage);
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;
  Form.DefaultHandler(Message);
  InvalidateNC;
  Handled := True;
end;

procedure TFormStyleHook.WMMDIChildClose(var Message: TMessage);

function IsAnyMDIChildMaximized: Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Form.MDIChildCount - 1 do
    if (FChangeVisibleChildHandle <> Form.MDIChildren[I].Handle) and
       (Form.MDIChildren[I].Visible) and
       (Form.MDIChildren[I].WindowState = wsMaximized) then
    begin
      Result := True;
      Break;
    end;
end;

begin
  FChangeVisibleChildHandle := Message.WParam;
  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) then
  begin
    if IsAnyMDIChildMaximized and not FMainMenuBarHook.ShowMDIButtons then
      FMainMenuBarHook.ShowMDIButtons := True
    else if not IsAnyMDIChildMaximized and FMainMenuBarHook.ShowMDIButtons then
      FMainMenuBarHook.ShowMDIButtons := False;
    InvalidateNC;
  end;
  GetMDIScrollInfo(True);
end;

procedure TFormStyleHook.WMDestroy(var Message: TMessage);
begin
 if not (csRecreating in Form.ControlState) and (Form.FormStyle = fsMDIChild) then
   PostMessage(Application.MainForm.Handle, WM_MDICHILDCLOSE, 0, 0);
end;

procedure TFormStyleHook.WMSysCommand(var Message: TMessage);
begin
  if IsStyleBorder then
    case Message.WParam  of
      SC_RESTORE:
        begin
          FRestoring := True;
          FRestoringConstraints := Form.Constraints;
        end;
      SC_CLOSE:
        if Form.FormStyle = fsMDIChild then
         PostMessage(Application.MainForm.Handle, WM_MDICHILDCLOSE,
           Winapi.Windows.WPARAM(Form.Handle), 0);
      SC_MINIMIZE:
        if Form.FormStyle = fsMDIChild then
         FFormActive := False;
      SC_KEYMENU:
       begin
         if TMainMenuBarStyleHook(FMainMenuBarHook) <> nil then
         begin
           if TWMSYSCOMMAND(Message).Key = VK_SPACE then
             FMainMenuBarHook.TrackSystemMenu
           else
           begin
             FMainMenuBarHook.MenuActive := True;
             FMainMenuBarHook.EnterWithKeyboard := True;
             FMainMenuBarHook.MenuEnter(False);
           end;
           Handled := True;
         end;
       end;
    end;
end;

procedure TFormStyleHook.WMInitMenu(var Message: TMessage);
begin
  if (WPARAM(GetMenu(Control.Handle)) = Message.wParam) and IsStyleBorder then
    SetMenu(Control.Handle, 0);
end;

procedure TFormStyleHook.CMMenuChanged(var Message: TMessage);
begin
  if IsStyleBorder then
  begin
    if GetMenu(Control.Handle) <> 0 then
      SetMenu(Control.Handle, 0);
     Handled := True;
  end;
end;

procedure TFormStyleHook.WMNCHitTest(var Message: TWMNCHitTest);
var
  P: TPoint;
begin
  if IsStyleBorder then
  begin
    P := NormalizePoint(Point(Message.XPos, Message.YPos));
    Message.Result := GetHitTest(P);
    Handled := True;
  end;
end;

procedure TFormStyleHook.WMNCCalcSize(var Message: TWMNCCalcSize);
var
  Params: PNCCalcSizeParams;
  R, MenuRect: TRect;
  MenuHeight: Integer;
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;
  {check menu info}
  if (Form.FormStyle = fsMDIChild) then
    TMainMenuBarStyleHook(FMainMenuBarHook) := nil
  else if (Form.Menu <> nil) and not Form.Menu.AutoMerge and
          (Form.Menu.Items.Count > 0) and (TMainMenuBarStyleHook(FMainMenuBarHook) = nil) then
    TMainMenuBarStyleHook(FMainMenuBarHook) := TFormStyleHook.TMainMenuBarStyleHook.Create(Self)
  else if ((Form.Menu = nil) or
          ((Form.Menu <> nil) and (Form.Menu.Items.Count = 0))) and
          (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) then
    TMainMenuBarStyleHook(FMainMenuBarHook) := nil;
  {calc NC info}
  if (Message.CalcValidRects and (Form.BorderStyle <> bsNone)) or
     ((Form.BorderStyle = bsNone) and (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil))
  then
  begin
    R := GetBorderSize;

    if TMainMenuBarStyleHook(FMainMenuBarHook) <> nil then
    begin
      MenuHeight := FMainMenuBarHook.GetMenuHeight(FWidth - R.Left - R.Right);
      MenuRect := Rect(R.Left, R.Top, FWidth - R.Right, R.Top + MenuHeight);
      FMainMenuBarHook.BoundsRect := MenuRect;
    end
    else
      MenuHeight := 0;
    Params := Message.CalcSize_Params;
    with Params^.rgrc[0] do
    begin
      Inc(Left, R.Left);
      Inc(Top, R.Top + MenuHeight);
      Dec(Right, R.Right);
      Dec(Bottom, R.Bottom);
      if Form.BorderWidth <> 0 then
      begin
        Inc(Left, Form.BorderWidth);
        Inc(Top, Form.BorderWidth);
        Dec(Right, Form.BorderWidth);
        Dec(Bottom, Form.BorderWidth);
      end;
    end;
    Handled := True;
  end
  else
  if Message.CalcValidRects and (Form.BorderStyle = bsNone) and
     (Form.FormStyle = fsMDIChild) and (Form.WindowState <> wsMaximized) then
    Handled := True;
end;

function TFormStyleHook.GetIconFast: TIcon;
begin
  if (FIcon = nil) or (FIconHandle = 0) then
    Result := GetIcon
  else
    Result := FIcon;
end;

function TFormStyleHook.GetFormIcon(AForm: TCustomForm): TIcon;
var
  IconX, IconY: Integer;
  TmpHandle: THandle;
  Loaded: Boolean;
begin
  if AForm = nil then Exit(nil);

  Result := TIcon.Create;
  Loaded := False;
  if AForm.Icon.Handle <> 0 then
    TmpHandle := Form.Icon.Handle
  else
  if Application.Icon.Handle <> 0 then
    TmpHandle := Application.Icon.Handle
  else
  begin
    TmpHandle := LoadIcon(0, IDI_APPLICATION);
    Loaded := True;
  end;

  IconX := GetSystemMetrics(SM_CXSMICON);
  if IconX = 0 then
    IconX := GetSystemMetrics(SM_CXSIZE);
  IconY := GetSystemMetrics(SM_CYSMICON);
  if IconY = 0 then
    IconY := GetSystemMetrics(SM_CYSIZE);

  Result.Handle := CopyImage(TmpHandle, IMAGE_ICON, IconX, IconY, LR_COPYFROMRESOURCE);

  if Loaded then
    DestroyIcon(TmpHandle);
end;

function TFormStyleHook.GetIcon: TIcon;
begin
  if FIcon = nil then
    FIcon := GetFormIcon(Form);
  Result := FIcon;
end;

procedure TFormStyleHook.PaintNC(Canvas: TCanvas);
var
  Details, CaptionDetails, IconDetails: TThemedElementDetails;
  Detail: TThemedWindow;
  R, R1, R2, DrawRect, ButtonRect, TextRect: TRect;
  CaptionBuffer, Buffer: TBitmap;
  FButtonState: TThemedWindow;
  TextFormat: TTextFormat;
  LText: string;
  TextTopOffset: Integer;
  PPI: Integer;
  Size: TSize;

  procedure DrawStretchBitmap(ABitmap: TBitmap; ACanvas: TCanvas; ARect: TRect);
  var
    R1, R2: TRect;
    Margin: Integer;
  begin
    Margin := ABitmap.Height div 3;
    R1 := Rect(0, 0, ABitmap.Width, Margin);
    R2 := Rect(ARect.Left, ARect.Top, ARect.Right, ARect.Top + Margin);
    ACanvas.CopyRect(R2, ABitmap.Canvas, R1);
    R1 := Rect(0, Margin, ABitmap.Width, ABitmap.Height - Margin);
    R2 := Rect(ARect.Left, ARect.Top + Margin, ARect.Right, ARect.Bottom - Margin);
    ACanvas.CopyRect(R2, ABitmap.Canvas, R1);
    R1 := Rect(0, ABitmap.Height - Margin, ABitmap.Width, ABitmap.Height);
    R2 := Rect(ARect.Left, ARect.Bottom - Margin, ARect.Right, ARect.Bottom);
    ACanvas.CopyRect(R2, ABitmap.Canvas, R1);
  end;

  function GetTopOffset: Integer;
  var
    P: TPoint;
  begin
    if Form.WindowState = wsMaximized then
    begin
      P.X := Form.Left + Form.Width div 2;
      P.Y := Form.Top + Form.Height div 2;
      Result := Screen.MonitorFromPoint(P).WorkareaRect.Top;
      if Form.Top < Result then
        Result := Result - Form.Top else Result := 0;
    end
    else
      Result := 0;
  end;

  procedure CorrectRightButtonRect(var AButtonRect: TRect);
  var
    TopOffset, RightOffset, H: Integer;
    BS: TRect;
  begin
    if ((FStretchedCaptionInc > 0) or ((Form.WindowState = wsMaximized) and (Form.FormStyle <> fsMDIChild))) and (ButtonRect.Width > 0) then
    begin
      BS := GetBorderSize;
      TopOffset := GetTopOffset;
      if (Form.WindowState <> wsMaximized) and (FStretchedCaptionInc > 0) then
      begin
        H := ButtonRect.Height;
        ButtonRect.Top := (CaptionBuffer.Height - H) div 2;
        ButtonRect.Bottom := ButtonRect.Top + H;
      end;

      RightOffset := -BS.Right;
      if ButtonRect.Top < TopOffset then
      begin
        if FStretchedCaptionInc > 0 then
        begin
          H := ButtonRect.Height;
          OffsetRect(ButtonRect, RightOffset, 0);
          ButtonRect.Top := TopOffset + (CaptionBuffer.Height - H - TopOffset) div 2 - 1;
          ButtonRect.Bottom := ButtonRect.Top + H;
          if ButtonRect.Bottom > CaptionBuffer.Height then
            OffsetRect(ButtonRect, 0, CaptionBuffer.Height - ButtonRect.Bottom);
        end
        else
        begin
          TopOffset := TopOffset - ButtonRect.Top;
          OffsetRect(ButtonRect, RightOffset, TopOffset);
          TopOffset := ButtonRect.Bottom - BS.Top;
          if TopOffset > 0 then
            OffsetRect(ButtonRect, 0, -TopOffset);
        end;
      end;
    end;
  end;

  procedure CorrectLeftButtonRect(var AButtonRect: TRect);
  var
    TopOffset, LeftOffset, H: Integer;
    BS: TRect;
  begin
    if ((FStretchedCaptionInc > 0) or ((Form.WindowState = wsMaximized) and (Form.FormStyle <> fsMDIChild))) and (ButtonRect.Width > 0) then
    begin
      BS := GetBorderSize;
      TopOffset := GetTopOffset;
      if (Form.WindowState <> wsMaximized) and (FStretchedCaptionInc > 0) then
      begin
        H := ButtonRect.Height;
        ButtonRect.Top := (CaptionBuffer.Height - H) div 2;
        ButtonRect.Bottom := ButtonRect.Top + H;
      end;
      LeftOffset := BS.Left;
      if ButtonRect.Top < TopOffset then
      begin
        if FStretchedCaptionInc > 0 then
        begin
          H := ButtonRect.Height;
          OffsetRect(ButtonRect, LeftOffset, 0);
          ButtonRect.Top := TopOffset + (CaptionBuffer.Height - H - TopOffset) div 2 - 1;
          ButtonRect.Bottom := ButtonRect.Top + H;
          if ButtonRect.Bottom > CaptionBuffer.Height then
            OffsetRect(ButtonRect, 0, CaptionBuffer.Height - ButtonRect.Bottom);
        end
        else
        begin
          TopOffset := TopOffset - ButtonRect.Top;
          OffsetRect(ButtonRect, LeftOffset, TopOffset);
          TopOffset := ButtonRect.Bottom - BS.Top;
          if TopOffset > 0 then
            OffsetRect(ButtonRect, 0, -TopOffset);
        end;
      end;
    end;
  end;

  procedure DrawBorder;

    function CheckRectInRect(const R1: TRect; var R2: TRect): Boolean;
    begin
      if R2.Top < R1.Top then R2.Top := R1.Top;
      if R2.Bottom > R1.Bottom then R2.Bottom := R1.Bottom;
      if R2.Left < R1.Left then R2.Left := R1.Left;
      if R2.Bottom > R1.Bottom then R2.Bottom := R1.Bottom;
      Result := (R2.Top <= R2.Bottom) and (R2.Left <= R2.Right);
    end;

  var
    BSize: TRect;
  begin
    if Form.BorderWidth = 0 then Exit;
    Canvas.Brush.Color := StyleServices.GetStyleColor(scWindow);
    Canvas.Brush.Style := bsSolid;
    if Form.BorderStyle = bsNone then
      BSize := Rect(0, 0, 0, 0)
    else
      BSize := GetBorderSize;
    R := Rect(BSize.Left, BSize.Top, FWidth - BSize.Right, FHeight - BSize.Bottom);
    if TMainMenuBarStyleHook(FMainMenuBarHook) <> nil then
      Inc(R.Top, FMainMenuBarHook.GetMenuHeight(FWidth - BSize.Left - BSize.Right));

    DrawRect := Rect(R.Left, R.Top, R.Left + Form.BorderWidth, R.Bottom);
    if CheckRectInRect(R, DrawRect) then Canvas.FillRect(DrawRect);

    DrawRect := Rect(R.Right - Form.BorderWidth, R.Top, R.Right, R.Bottom);
    if CheckRectInRect(R, DrawRect) then Canvas.FillRect(DrawRect);

    DrawRect := Rect(R.Left + Form.BorderWidth, R.Top,
                     R.Right - Form.BorderWidth, R.Top + Form.BorderWidth);
    if CheckRectInRect(R, DrawRect) then Canvas.FillRect(DrawRect);

    DrawRect := Rect(R.Left + Form.BorderWidth, R.Bottom - Form.BorderWidth,
                     R.Right - Form.BorderWidth, R.Bottom);
    if CheckRectInRect(R, DrawRect) then Canvas.FillRect(DrawRect);
  end;

begin
  if Form.BorderStyle = bsNone then
  begin
    if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) then
      FMainMenuBarHook.Paint(Canvas);
    DrawBorder;
    Exit;
  end;

  if FStretchedCaptionInc > 0 then
  begin
    if CheckPerMonitorV2SupportForWindow(Form.Handle) then
      PPI := Form.CurrentPPI
    else
      PPI := Screen.PixelsPerInch;
  end
  else
    PPI := 0;

  {init some parameters}
  FCloseButtonRect := Rect(0, 0, 0, 0);
  FMaxButtonRect := Rect(0, 0, 0, 0);
  FMinButtonRect := Rect(0, 0, 0, 0);
  FHelpButtonRect := Rect(0, 0, 0, 0);
  FSysMenuButtonRect := Rect(0, 0, 0, 0);
  FCaptionRect := Rect(0, 0, 0, 0);

  if not StyleServices.Available then
    Exit;
  R := GetBorderSize;

  {draw caption}

  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
  begin
    if FFormActive then
      Detail := twCaptionActive
    else
      Detail := twCaptionInActive
  end
  else
  begin
   if FFormActive then
      Detail := twSmallCaptionActive
    else
      Detail := twSmallCaptionInActive
  end;
  CaptionBuffer := TBitmap.Create;
  CaptionBuffer.SetSize(FWidth, R.Top);

  {draw caption border}
  DrawRect := Rect(0, 0, CaptionBuffer.Width, CaptionBuffer.Height);
  Details := StyleServices.GetElementDetails(Detail);
  if FStretchedCaptionInc > 0 then
  begin
    StyleServices.GetElementSize(0, Details, esActual, Size);
    Buffer := TBitmap.Create;
    try
      Buffer.Width := CaptionBuffer.Width;
      Buffer.Height := Size.cy;
      R2 := Rect(0, 0, Buffer.Width, Buffer.Height);
      StyleServices.DrawElement(Buffer.Canvas.Handle, Details, R2);
      DrawStretchBitmap(Buffer, CaptionBuffer.Canvas, DrawRect);
    finally
      Buffer.Free;
    end;
  end
  else
    StyleServices.DrawElement(CaptionBuffer.Canvas.Handle, Details, DrawRect);

  TextRect := DrawRect;
  CaptionDetails := Details;
  TextTopOffset := 3;

  {draw icon}
  if (biSystemMenu in Form.BorderIcons) and
     (Form.BorderStyle <> bsDialog) and
     (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
  begin
    IconDetails := StyleServices.GetElementDetails(twSysButtonNormal);
    if not StyleServices.GetElementContentRect(0, IconDetails, DrawRect, ButtonRect) then
      ButtonRect := Rect(0, 0, 0, 0);

    R1 := ButtonRect;

    if not StyleServices.HasElementFixedPosition(Details) then
    begin
      CorrectLeftButtonRect(ButtonRect);
      TextTopOffset := Abs(R1.Top - ButtonRect.Top);
      if TextTopOffset > R.Top then TextTopOffset := 3;
    end
    else
      TextTopOffset := 0;

    R1 := Rect(0, 0, GetSystemMetrics(SM_CXSMICON), GetSystemMetrics(SM_CYSMICON));
    RectVCenter(R1, ButtonRect);
    if ButtonRect.Width > 0 then
      DrawIconEx(CaptionBuffer.Canvas.Handle, R1.Left, R1.Top, GetIconFast.Handle, 0, 0, 0, 0, DI_NORMAL);

    TextRect.Left := ButtonRect.Left + R1.Width + 5;
    FSysMenuButtonRect := Rect(ButtonRect.Left, ButtonRect.Top,
      ButtonRect.Left + R1.Width, ButtonRect.Top + R1.Height);
  end
  else
    Inc(TextRect.Left, R.Left);

  {draw buttons}
  if (biSystemMenu in Form.BorderIcons) then
  begin
    if (Form.BorderStyle <> bsToolWindow) and
       (Form.BorderStyle <> bsSizeToolWin) then
    begin
      if (FPressedButton = HTCLOSE) and (FHotButton = HTCLOSE) then
        FButtonState := twCloseButtonPushed
      else if FHotButton = HTCLOSE then
        FButtonState := twCloseButtonHot
      else
        if FFormActive then
          FButtonState := twCloseButtonNormal
        else
          FButtonState := twCloseButtonDisabled;
     end
    else
    begin
      if (FPressedButton = HTCLOSE) and (FHotButton = HTCLOSE) then
        FButtonState := twSmallCloseButtonPushed
      else if FHotButton = HTCLOSE then
        FButtonState := twSmallCloseButtonHot
      else
        if FFormActive then
          FButtonState := twSmallCloseButtonNormal
        else
          FButtonState := twSmallCloseButtonDisabled;
    end;

    Details := StyleServices.GetElementDetails(FButtonState);
    if not StyleServices.GetElementContentRect(0, Details, DrawRect, ButtonRect) then
      ButtonRect := Rect(0, 0, 0, 0);

    if not StyleServices.HasElementFixedPosition(Details) then
      CorrectRightButtonRect(ButtonRect);

    if ButtonRect.Width > 0 then
      StyleServices.DrawElement(CaptionBuffer.Canvas.Handle, Details, ButtonRect);

    if ButtonRect.Left > 0 then
      TextRect.Right := ButtonRect.Left;
    FCloseButtonRect := ButtonRect;
  end;

  if (biMaximize in Form.BorderIcons) and
     (biSystemMenu in Form.BorderIcons) and
     (Form.BorderStyle <> bsDialog) and
     (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
  begin
    if Form.WindowState = wsMaximized then
    begin
      if (FPressedButton = HTMAXBUTTON) and (FHotButton = HTMAXBUTTON) then
        FButtonState := twRestoreButtonPushed
      else if FHotButton = HTMAXBUTTON then
        FButtonState := twRestoreButtonHot
      else
      if FFormActive then
        FButtonState := twRestoreButtonNormal
      else
        FButtonState := twRestoreButtonDisabled;
    end
    else
    begin
      if (FPressedButton = HTMAXBUTTON) and (FHotButton = HTMAXBUTTON) then
        FButtonState := twMaxButtonPushed
      else if FHotButton = HTMAXBUTTON then
        FButtonState := twMaxButtonHot
      else
      if FFormActive then
        FButtonState := twMaxButtonNormal
      else
        FButtonState := twMaxButtonDisabled;
    end;
    Details := StyleServices.GetElementDetails(FButtonState);

    if not StyleServices.GetElementContentRect(0, Details, DrawRect, ButtonRect) then
      ButtonRect := Rect(0, 0, 0, 0);

    if not StyleServices.HasElementFixedPosition(Details) then
     CorrectRightButtonRect(ButtonRect);

    if ButtonRect.Width > 0 then
      StyleServices.DrawElement(CaptionBuffer.Canvas.Handle, Details, ButtonRect);
    if ButtonRect.Left > 0 then
      TextRect.Right := ButtonRect.Left;
    FMaxButtonRect := ButtonRect;
  end;

  if (biMinimize in Form.BorderIcons) and
     (biSystemMenu in Form.BorderIcons) and
     (Form.BorderStyle <> bsDialog) and
     (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
  begin
    if Form.WindowState = wsMinimized then
    begin
      if (FPressedButton = HTMINBUTTON) and (FHotButton = HTMINBUTTON) then
        FButtonState := twRestoreButtonPushed
      else if FHotButton = HTMINBUTTON then
        FButtonState := twRestoreButtonHot
      else
      if FFormActive then
        FButtonState := twRestoreButtonNormal
      else
        FButtonState := twRestoreButtonDisabled;
    end
    else
    begin
      if (FPressedButton = HTMINBUTTON) and (FHotButton = HTMINBUTTON) then
        FButtonState := twMinButtonPushed
      else if FHotButton = HTMINBUTTON then
        FButtonState := twMinButtonHot
      else
        if FFormActive then
          FButtonState := twMinButtonNormal
        else
          FButtonState := twMinButtonDisabled;
    end;

    Details := StyleServices.GetElementDetails(FButtonState);

    if not StyleServices.GetElementContentRect(0,
       StyleServices.GetElementDetails(twMinButtonNormal), DrawRect, ButtonRect) then
      ButtonRect := Rect(0, 0, 0, 0);

    if not StyleServices.HasElementFixedPosition(Details) then
      CorrectRightButtonRect(ButtonRect);

    if ButtonRect.Width > 0 then
      StyleServices.DrawElement(CaptionBuffer.Canvas.Handle, Details, ButtonRect);
    if ButtonRect.Left > 0 then TextRect.Right := ButtonRect.Left;
    FMinButtonRect := ButtonRect;
  end;

  if (biHelp in Form.BorderIcons) and (biSystemMenu in Form.BorderIcons) and
     ((not (biMaximize in Form.BorderIcons) and
     not (biMinimize in Form.BorderIcons)) or (Form.BorderStyle = bsDialog))
  then
  begin
    if (FPressedButton = HTHELP) and (FHotButton = HTHELP) then
      FButtonState := twHelpButtonPushed
    else if FHotButton = HTHELP then
      FButtonState := twHelpButtonHot
    else
    if FFormActive then
      FButtonState := twHelpButtonNormal
    else
      FButtonState := twHelpButtonDisabled;
    Details := StyleServices.GetElementDetails(FButtonState);

    if not StyleServices.GetElementContentRect(0, Details, DrawRect, ButtonRect) then
      ButtonRect := Rect(0, 0, 0, 0);

    if not StyleServices.HasElementFixedPosition(Details) then
      CorrectRightButtonRect(ButtonRect);

    if ButtonRect.Width > 0 then
      StyleServices.DrawElement(CaptionBuffer.Canvas.Handle, Details, ButtonRect);

    if ButtonRect.Left > 0 then
      TextRect.Right := ButtonRect.Left;
    FHelpButtonRect := ButtonRect;
  end;

  {draw text}
  TextFormat := [tfLeft, tfSingleLine, tfVerticalCenter];
  if Control.UseRightToLeftReading then
    Include(TextFormat, tfRtlReading);
  // Important: Must retrieve Text prior to calling DrawText as it causes
  // CaptionBuffer.Canvas to free its handle, making the outcome of the call
  // to DrawText dependent on parameter evaluation order.
  LText := Text;

  if (Form.WindowState = wsMaximized) and (Form.FormStyle <> fsMDIChild) and
     (TextTopOffset <> 0) and (biSystemMenu in Form.BorderIcons) then
  begin
    MoveWindowOrg(CaptionBuffer.Canvas.Handle, 0, TextTopOffset);
    StyleServices.DrawText(CaptionBuffer.Canvas.Handle, CaptionDetails, LText, TextRect, TextFormat, clNone, PPI);
    MoveWindowOrg(CaptionBuffer.Canvas.Handle, 0, -TextTopOffset);
  end
  else
  begin
    if not (biSystemMenu in Form.BorderIcons) then
      Inc(TextRect.Left, R.Left);
    if FStretchedCaptionInc > 0 then
    begin
      if Form.WindowState = wsMaximized then
        TextTopOffset := GetTopOffset
      else  
        TextTopOffset := FStretchedCaptionInc div 2;
      MoveWindowOrg(CaptionBuffer.Canvas.Handle, 0, TextTopOffset);
    end;
    StyleServices.DrawText(CaptionBuffer.Canvas.Handle, CaptionDetails, LText, TextRect, TextFormat, clNone, PPI);
    if FStretchedCaptionInc > 0 then
      MoveWindowOrg(CaptionBuffer.Canvas.Handle, 0, -TextTopOffset);
  end;
  FCaptionRect := TextRect;

  {draw caption buffer}

  Canvas.Draw(0, 0, CaptionBuffer);
  CaptionBuffer.Free;

  {draw menubar}
  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and
     (FMainMenuBarHook.BoundsRect.Right < FWidth - R.Right)
  then
    FMainMenuBarHook.BoundsRect := Rect(FMainMenuBarHook.BoundsRect.Left, FMainMenuBarHook.BoundsRect.Top,
      FWidth - R.Right, FMainMenuBarHook.BoundsRect.Bottom);

  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) then
    FMainMenuBarHook.Paint(Canvas);

  {draw left border}

  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
  begin
    if FFormActive then
      Detail := twFrameLeftActive
    else
      Detail := twFrameLeftInActive
  end
  else
  begin
    if FFormActive then
      Detail := twSmallFrameLeftActive
    else
      Detail := twSmallFrameLeftInActive
  end;
  DrawRect := Rect(0, R.Top, R.Left, FHeight - R.Bottom);
  Details := StyleServices.GetElementDetails(Detail);

  if DrawRect.Bottom - DrawRect.Top > 0 then
    StyleServices.DrawElement(Canvas.Handle, Details, DrawRect);

  {draw right border}
  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
  begin
    if FFormActive then
      Detail := twFrameRightActive
    else
      Detail := twFrameRightInActive
  end
  else
  begin
   if FFormActive then
      Detail := twSmallFrameRightActive
    else
      Detail := twSmallFrameRightInActive
  end;
  DrawRect := Rect(FWidth - R.Right, R.Top, FWidth, FHeight - R.Bottom);
  Details := StyleServices.GetElementDetails(Detail);

  if DrawRect.Bottom - DrawRect.Top > 0 then
    StyleServices.DrawElement(Canvas.Handle, Details, DrawRect);

  {draw Bottom border}
  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
  begin
    if FFormActive then
      Detail := twFrameBottomActive
    else
      Detail := twFrameBottomInActive
  end
  else
  begin
   if FFormActive then
      Detail := twSmallFrameBottomActive
    else
      Detail := twSmallFrameBottomInActive
  end;
  DrawRect := Rect(0, FHeight - R.Bottom, FWidth, FHeight);
  Details := StyleServices.GetElementDetails(Detail);

  if DrawRect.Bottom - DrawRect.Top > 0 then
    StyleServices.DrawElement(Canvas.Handle, Details, DrawRect);

  DrawBorder;
end;

procedure TFormStyleHook.WMNCACTIVATE(var Message: TMessage);
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;

  FFormActive := Message.WParam > 0;

  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and FMainMenuBarHook.InMenuLoop then
    FMainMenuBarHook.InMenuLoop := False;

  if (Form.FormStyle = fsMDIChild) then
  begin
    if (Form.FormStyle = fsMDIChild) and (Win32MajorVersion >=6) then
      SetRedraw(False);

    CallDefaultProc(Message);

    if (Form.FormStyle = fsMDIChild) and (Win32MajorVersion >=6) then
    begin
      SetRedraw(True);
      if not (csDestroying in Control.ComponentState) and
         not (csLoading in Control.ComponentState) then
        RedrawWindow(Handle, nil, 0, RDW_INVALIDATE + RDW_ALLCHILDREN + RDW_UPDATENOW);
    end;
  end
  else
    Message.Result := 1;

  if Form.ClientHandle <> 0 then
    PostMessage(TForm(Control).ClientHandle, WM_NCACTIVATE, Message.WParam, Message.LParam);

  if (Form.BorderStyle <> bsNone) and
     not ((Form.FormStyle = fsMDIChild) and
     (Form.WindowState = wsMaximized)) then
    InvalidateNC;

  Handled := True;
end;

function TFormStyleHook.GetRegion: HRgn;
var
  WR, R, R1, ScrR: TRect;
  Details: TThemedElementDetails;
  Detail: TThemedWindow;
  P: TPoint;
  LeftOffset, TopOffset, RightOffset, BottomOffset: Integer;
begin
  Result := 0;
  if not StyleServices.Available then
    Exit;
  R := Rect(0, 0, FWidth, FHeight);
  if (Form.BorderStyle <> bsToolWindow) and
     (Form.BorderStyle <> bsSizeToolWin) then
    Detail := twCaptionActive
  else
    Detail := twSmallCaptionActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementRegion(Details, R, Result);
  if (Form.WindowState = wsMaximized) and (Form.FormStyle <> fsMDIChild) and
     (Form.BorderStyle <> bsNone) then
  begin
    P.X := FLeft + FWidth div 2;
    P.Y := FTop + FHeight div 2;
    WR := Screen.WorkAreaRect;
    R := Screen.MonitorFromPoint(P).WorkareaRect;
    R1 := Screen.MonitorFromPoint(P).BoundsRect;
    ScrR := Rect(R1.Left, R1.Top, R1.Left + R1.Right, R1.Top + R1.Bottom);
    LeftOffset := 0;
    TopOffset := 0;
    RightOffset := 0;
    BottomOffset := 0;

    if (R.Top <> R1.Top) and (R.Top > 0) and (FTop < 0) and (Abs(FTop) < 100) then
      TopOffset := Abs(FTop)
    else
    if (FTop < R.Top) and (R.Top - FTop < 100) then
      TopOffset := R.Top - FTop
    else
    if (FTop < ScrR.Top) and (ScrR.Top - FTop < 100) then
      TopOffset := ScrR.Top - FTop
    else
    if (FTop < WR.Top) and (WR.Top - FTop < 100) then
      TopOffset := WR.Top - FTop;

    if (R.Left <> R1.Left) and (R.Left > 0) and (FLeft < 0) and (Abs(FLeft) < 100)  then
      LeftOffset := Abs(FLeft)
    else
    if (FLeft < R.Left) and (R.Left - FLeft < 100) then
      LeftOffset := R.Left - FLeft
    else
    if (FLeft < ScrR.Left) and (ScrR.Left - FLeft < 100) then
      LeftOffset := ScrR.Left - FLeft
    else
    if (FLeft < WR.Left) and (WR.Left - FLeft < 100) then
      LeftOffset := WR.Left - FLeft;

    if (FLeft + FWidth > R.Right) and (FLeft + FWidth - R.Right < 100) then
      RightOffset := FLeft + FWidth - R.Right
    else
    if (FLeft + FWidth > ScrR.Right) and (FLeft + FWidth - ScrR.Right < 100) then
      RightOffset := FLeft + FWidth - ScrR.Right
    else
    if (FLeft + FWidth > WR.Right) and (FLeft + FWidth - WR.Right < 100) then
      RightOffset := FLeft + FWidth - WR.Right;

    if (FTop + FHeight > R.Bottom) and (FTop + FHeight - R.Bottom < 100) then
      BottomOffset := FTop + FHeight - R.Bottom
    else
    if (FTop + FHeight > ScrR.Bottom) and (FTop + FHeight - ScrR.Bottom < 100) then
      BottomOffset := FTop + FHeight - ScrR.Bottom
    else
    if (FTop + FHeight > WR.Bottom) and (FTop + FHeight - WR.Bottom < 100) then
      BottomOffset := FTop + FHeight - WR.Bottom;

     if (LeftOffset <> 0) or (RightOffset <> 0) or
        (TopOffset <> 0) or (BottomOffset <> 0)
     then
       SetRectRgn(Result, LeftOffset, TopOffset,
         FWidth - RightOffset, FHeight - BottomOffset);
  end;
end;

procedure TFormStyleHook.ChangeSize;
var
  R: TRect;
begin
  FChangeSizeCalled := True;
  try
    if IsIconic(Handle) then
    begin
      R := GetBorderSize;
      FHeight := R.Top + R.Bottom;
    end;
    if Form.BorderStyle <> bsNone then
    begin
      FRegion := GetRegion;
      SetWindowRgn(Handle, FRegion, True);
    end
    else
      if (Form.BorderStyle = bsNone) and (Form.FormStyle = fsMDIChild)
         and (Form.WindowState <> wsMaximized) then
      begin
        FRegion := CreateRectRgn(0, 0, FWidth, FHeight);
        SetWindowRgn(Handle, FRegion, True);
      end
      else
        if (Form.BorderStyle = bsNone) and (FRegion <> 0) then
        begin
          SetWindowRgn(Handle, 0, True);
          FRegion := 0;
        end;
  finally
    FChangeSizeCalled := False;
  end;
end;

procedure TFormStyleHook.WMMove(var Message: TWMMOVE);
begin
  if Form.FormStyle = fsMDIChild then
  begin
    CallDefaultProc(TMessage(Message));
    SendMessage(Application.MainForm.Handle, WM_MDICHILDMOVE, 0, 0);
    Handled := True;
  end;
end;

procedure TFormStyleHook.WMMDIChildMove(var Message: TMessage);
begin
  if (Form.FormStyle = fsMDIForm) and not FStopCheckChildMove then
  begin
    FChangeVisibleChildHandle := Message.WParam;
    GetMDIScrollInfo(True);
    FChangeVisibleChildHandle := 0;
    if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and IsStyleBorder then
    begin
                               
      if MDIChildMaximized and not FMainMenuBarHook.ShowMDIButtons then
        FMainMenuBarHook.ShowMDIButtons := True
      else if not MDIChildMaximized and FMainMenuBarHook.ShowMDIButtons then
        FMainMenuBarHook.ShowMDIButtons := False;
    end;
    Handled := True;
  end;
end;

procedure TFormStyleHook.WMSize(var Message: TWMSize);
begin
  if IsIconic(Handle) and (Application.MainForm.Handle <> Handle) and IsStyleBorder then
    InvalidateNC;

  if (FMDIClientInstance <> nil) then
  begin
    CallDefaultProc(TMessage(Message));
    GetMDIScrollInfo(True);
    Handled := True;
    Exit;
  end;

  if Form.FormStyle = fsMDIChild then
  begin
    CallDefaultProc(TMessage(Message));
    SendMessage(Application.MainForm.Handle, WM_MDICHILDMOVE, 0, 0);
    if IsIconic(Handle) and IsStyleBorder then
      InvalidateNC;
    Handled := True;
  end;

end;

procedure TFormStyleHook.WMWindowPosChanging(var Message: TWMWindowPosChanging);
var
  Changed: Boolean;
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;

  CallDefaultProc(TMessage(Message));

  if (Message.WindowPos^.flags and SWP_SHOWWINDOW <> 0) and FNeedsUpdate then
  begin
    FNeedsUpdate := False;
    if (Control is TForm) and (TForm(Control).FormStyle = fsMDIForm) and (FMDIClientInstance = nil) then
    begin
      FMDIPrevClientProc := Pointer(GetWindowLong(TForm(Control).ClientHandle, GWL_WNDPROC));
      FMDIClientInstance := MakeObjectInstance(MDIClientWndProc);
      SetWindowLong(TForm(Control).ClientHandle, GWL_WNDPROC, IntPtr(FMDIClientInstance));
      InitMDIScrollBars;
      AdjustMDIScrollBars;
    end;
    if IsStyleBorder and not TStyleManager.SystemStyle.Enabled and (GetWindowLong(Handle, GWL_STYLE) and WS_CAPTION <> 0) and
       not (Form.FormStyle = fsMDIChild) then
    begin
      FCaptionEmulation := True;
      SetWindowLong(Handle, GWL_STYLE,
           GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION);
    end;
  end;

  Handled := True;
  Changed := False;

  if FChangeSizeCalled then
  begin
    if FRestoring then
    begin
      FRestoring := False;
      if (FRestoringConstraints.MinHeight <> 0) or
         (FRestoringConstraints.MinWidth <> 0) or
         (FRestoringConstraints.MaxWidth <> 0) or
         (FRestoringConstraints.MaxHeight <> 0) then
        Form.Constraints := FRestoringConstraints;
    end;
    Exit;
  end;

  if (Message.WindowPos^.flags and SWP_NOSIZE = 0) or
     (Message.WindowPos^.flags and SWP_NOMOVE = 0) then
  begin
    if (Message.WindowPos^.flags and SWP_NOMOVE = 0) then
    begin
      FLeft := Message.WindowPos^.x;
      FTop := Message.WindowPos^.y;
    end;
    if (Message.WindowPos^.flags and SWP_NOSIZE = 0) then
    begin
      Changed := ((Message.WindowPos^.cx <> FWidth) or (Message.WindowPos^.cy <> FHeight)) and
                 (Message.WindowPos^.flags and SWP_NOSIZE = 0);
      FWidth := Message.WindowPos^.cx;
      FHeight := Message.WindowPos^.cy;
    end;
  end;

  if (Message.WindowPos^.flags and SWP_FRAMECHANGED  <> 0) then
    Changed := True;

  if Changed then
  begin
    ChangeSize;
    if Form.BorderStyle <> bsNone then
      InvalidateNC;
  end;
end;

procedure TFormStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
  case Message.Msg of
    WM_WINDOWPOSCHANGED:
      if IsStyleBorder and (Form.WindowState = wsMaximized) then
        with TWMWindowPosChanged(Message) do
          if (WindowPos^.flags and SWP_NOSIZE = 0) or
             (WindowPos^.flags and SWP_NOMOVE = 0) then
          begin
            if (WindowPos^.flags and SWP_NOMOVE = 0) then
            begin
              FLeft := WindowPos^.x;
              FTop := WindowPos^.y;
            end;
            if (WindowPos^.flags and SWP_NOSIZE = 0) then
            begin
              FWidth := WindowPos^.cx;
              FHeight := WindowPos^.cy;
            end;
          end;
  end;
end;

procedure TFormStyleHook.UpdateForm;
begin
  if Form.BorderStyle = bsNone then Exit;
                                                    
  Control.Width := Control.Width - 1;
  Control.Width := Control.Width + 1;
end;

procedure TFormStyleHook.WMNCMouseMove(var Message: TWMNCHitMessage);
var
  P: TPoint;
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;

  inherited;

  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and (Message.HitTest = HTMENU) then
  begin
    P := NormalizePoint(Point(Message.XCursor, Message.YCursor));
    P.X := P.X - FMainMenuBarHook.BoundsRect.Left;
    P.Y := P.Y - FMainMenuBarHook.BoundsRect.Top;
    FMainMenuBarHook.MouseMove(P.X, P.Y);
    Handled := True;
  end
  else if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and FMainMenuBarHook.MouseInMainMenu and (Message.HitTest <> HTMENU) then
    FMainMenuBarHook.MouseMove(-1, -1);


  if (Message.HitTest = HTCLOSE) or (Message.HitTest = HTMAXBUTTON) or
     (Message.HitTest = HTMINBUTTON) or (Message.HitTest = HTHELP) then
  begin
    if FHotButton <> Message.HitTest then
    begin
      FHotButton := Message.HitTest;
      InvalidateNC;
    end;
    Message.Result := 0;
    Message.Msg := WM_NULL;
    Handled := True;
  end
  else if FHotButton <> 0 then
   begin
     FHotButton := 0;
     InvalidateNC;
   end;
end;

procedure TFormStyleHook.WMNCRButtonDown(var Message: TWMNCHitMessage);
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;

  inherited;
  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and (Message.HitTest = HTMENU) then
    Handled := True;
end;

procedure TFormStyleHook.WMNCLButtonDown(var Message: TWMNCHitMessage);
var
  P: TPoint;
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;

  inherited;

  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and FMainMenuBarHook.MustActivateMDIChildSysMenu then
  begin
    FMainMenuBarHook.InMenuLoop := False;
    FMainMenuBarHook.MustActivateMDIChildSysMenu := False;
    FMainMenuBarHook.TrackMDIChildSystemMenu;
    Handled := True;
    Exit;
  end;

  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and FMainMenuBarHook.MustActivateSysMenu then
  begin
    FMainMenuBarHook.InMenuLoop := False;
    FMainMenuBarHook.MustActivateSysMenu := False;
    FMainMenuBarHook.TrackSystemMenu;
    Handled := True;
    Exit;
  end;

  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and FMainMenuBarHook.MustActivateMenuItem then
  begin
    FMainMenuBarHook.InMenuLoop := False;
    FMainMenuBarHook.MustActivateMenuItem := False;
    FMainMenuBarHook.ProcessMenuLoop(True);
    Handled := True;
    Exit;
  end;

  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and (Message.HitTest = HTMENU) then
  begin
    P := NormalizePoint(Point(Message.XCursor, Message.YCursor));
    P.X := P.X - FMainMenuBarHook.BoundsRect.Left;
    P.Y := P.Y - FMainMenuBarHook.BoundsRect.Top;
    FMainMenuBarHook.MouseDown(P.X, P.Y);
    Handled := True;
  end;

  if (Message.HitTest = HTCLOSE) or (Message.HitTest = HTMAXBUTTON) or
     (Message.HitTest = HTMINBUTTON) or (Message.HitTest = HTHELP) then
  begin
    FPressedButton := Message.HitTest;
    InvalidateNC;
    Message.Result := 0;
    Message.Msg := WM_NULL;
    Handled := True;
  end;

end;

procedure TFormStyleHook.WMNCRButtonUp(var Message: TWMNCHitMessage);
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;

  // call system menu
  if (Message.HitTest = HTCAPTION) and FCaptionEmulation then
  begin
    SendMessage(Handle, $313, 0,
      MakeLong(Message.XCursor, Message.YCursor));
  end;
end;

procedure TFormStyleHook.WMNCLButtonUp(var Message: TWMNCHitMessage);
var
  FWasPressedButton: Integer;
  P: TPoint;
begin
  if not IsStyleBorder then
  begin
    Handled := False;
    Exit;
  end;

  FWasPressedButton := FPressedButton;

  if FPressedButton <> 0 then
  begin
    FPressedButton := 0;
    InvalidateNC;
  end;

  if (TMainMenuBarStyleHook(FMainMenuBarHook) <> nil) and (Message.HitTest = HTMENU) then
  begin
    P := NormalizePoint(Point(Message.XCursor, Message.YCursor));
    P.X := P.X - FMainMenuBarHook.BoundsRect.Left;
    P.Y := P.Y - FMainMenuBarHook.BoundsRect.Top;
    FMainMenuBarHook.MouseUp(P.X, P.Y);
    Handled := True;
  end;

  if (Message.HitTest = HTTOP) or (Message.HitTest = HTBOTTOM) or (Message.HitTest = HTLEFT) or
     (Message.HitTest = HTRIGHT) or (Message.HitTest = HTCAPTION) or (Message.HitTest = HTTOPLEFT) or
     (Message.HitTest = HTTOPRIGHT) or (Message.HitTest = HTBOTTOMRIGHT) or
     (Message.HitTest = HTBOTTOMLEFT) or (Message.HitTest = HTSYSMENU) then
  begin
    Exit;
  end;

  if FWasPressedButton = FHotButton then
    if Message.HitTest = HTCLOSE then
      Close
    else if (Message.HitTest = HTMAXBUTTON) and (biMaximize in Form.BorderIcons) then
    begin
      if Form.WindowState <> wsMaximized then
        Maximize
      else
        Restore;
    end
    else if (Message.HitTest = HTMINBUTTON) and (biMinimize in Form.BorderIcons) then
    begin
      if Form.WindowState <> wsMinimized then
        Minimize
      else
        Restore;
    end
    else if (Message.HitTest = HTHELP) and (biHelp in Form.BorderIcons) then
      Help;

  Message.Result := 0;
  Message.Msg := WM_NULL;
  Handled := True;
end;

procedure TFormStyleHook.WMNCLButtonDblClk(var Message: TWMNCHitMessage);
begin
  inherited;

  if (Message.HitTest = HTTOP) or (Message.HitTest = HTBOTTOM) or (Message.HitTest = HTLEFT) or
     (Message.HitTest = HTRIGHT) or (Message.HitTest = HTCAPTION) or (Message.HitTest = HTTOPLEFT) or
     (Message.HitTest = HTTOPRIGHT) or (Message.HitTest = HTBOTTOMRIGHT) or (Message.HitTest = HTBOTTOMLEFT) then
  begin
    Exit;
  end;

  Message.Result := 0;
  Message.Msg := WM_NULL;
  Handled := True;
end;

procedure TFormStyleHook.MouseEnter;
begin
  inherited;
  FPressedButton := 0;
end;

procedure TFormStyleHook.MouseLeave;
begin
  inherited;
  if FHotButton <> 0 then
  begin
    FHotButton := 0;
    FPressedButton := 0;
    if Form.BorderStyle <> bsNone then
      InvalidateNC;
  end;
  if TMainMenuBarStyleHook(FMainMenuBarHook) <> nil then
    FMainMenuBarHook.MouseMove(-1, -1);
end;

procedure TFormStyleHook.WMActivate(var Message: TWMActivate);
begin
  if IsStyleBorder then
  begin
    CallDefaultProc(TMessage(Message));
    FFormActive := Message.Active > 0;
    Handled := True;
  end;
end;

 procedure TFormStyleHook.WMNCUAHDrawCaption(var Message: TMessage);
 begin
   if IsStyleBorder then
   begin
     InvalidateNC;
     Handled := True;
   end;
 end;

procedure TFormStyleHook.Close;
begin
  if Handle <> 0 then
    SendMessage(Handle, WM_SYSCOMMAND, SC_CLOSE, 0);
end;

procedure TFormStyleHook.Restore;
begin
  FPressedButton := 0;
  FHotButton := 0;

  if Handle <> 0 then
    SendMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
end;

procedure TFormStyleHook.Maximize;
begin
  if Handle <> 0 then
  begin
    FPressedButton := 0;
    FHotButton := 0;

    if IsZoomed(Handle) then
      SendMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0)
    else
      SendMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  end;
end;

procedure TFormStyleHook.Minimize;
begin
  if Handle <> 0 then
  begin
    FPressedButton := 0;
    FHotButton := 0;
    if IsIconic(Handle) then
      SendMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0)
    else
      SendMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
   end;
end;

procedure TFormStyleHook.Help;
begin
  SendMessage(Handle, WM_SYSCOMMAND, SC_CONTEXTHELP, 0)
end;

procedure TFormStyleHook.WMShowWindow(var Message: TWMShowWindow);
begin
  if Message.Show and FNeedsUpdate then
  begin
    FNeedsUpdate := False;
    if (Control is TForm) and (TForm(Control).FormStyle = fsMDIForm) and (FMDIClientInstance = nil) then
    begin
      FMDIPrevClientProc := Pointer(GetWindowLong(TForm(Control).ClientHandle, GWL_WNDPROC));
      FMDIClientInstance := MakeObjectInstance(MDIClientWndProc);
      SetWindowLong(TForm(Control).ClientHandle, GWL_WNDPROC, IntPtr(FMDIClientInstance));
      InitMDIScrollBars;
      AdjustMDIScrollBars;
    end;
    if IsStyleBorder and not TStyleManager.SystemStyle.Enabled and (GetWindowLong(Handle, GWL_STYLE) and WS_CAPTION <> 0) and
       not (Form.FormStyle = fsMDIChild) then
    begin
      FCaptionEmulation := True;
      SetWindowLong(Handle, GWL_STYLE,
           GetWindowLong(Handle, GWL_STYLE) and not WS_CAPTION);
    end;
    UpdateForm;
  end;
end;

procedure TFormStyleHook.WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
var
  R: TRect;
  MM: PMinMaxInfo;
begin
  if IsStyleBorder then
  begin
    CallDefaultProc(TMessage(Message));
    R := GetBorderSize;
    MM := Message.MinMaxInfo;
    MM^.ptMinTrackSize.y := R.Top + R.Bottom;
    Handled := True;
  end;
end;

{ TScrollBoxStyleHook }

type
  TWinControlClassHook = class(TWinControl);

constructor TScrollBoxStyleHook.Create(AControl: TWinControl);
begin
  inherited;
  OverrideEraseBkgnd := True;
  if seClient in Control.StyleElements then
    Brush.Color := StyleServices.GetStyleColor(scPanel)
  else
    Brush.Color :=  TWinControlClassHook(Control).Color;
end;

procedure TScrollBoxStyleHook.WndProc(var Message: TMessage);
begin
  // Reserved for potential updates
  inherited;
  case Message.Msg of
    WM_VSCROLL, WM_HSCROLL:
     if TWMScroll(Message).ScrollCode = SB_ENDSCROLL then
       SetWindowPos(Handle, 0,0,0,0,0, SWP_FRAMECHANGED or SWP_NOACTIVATE or
         SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
  end;
end;

constructor TChangeScaleMessage.Create(ASender: TComponent; AM, AD: Integer);
begin
  inherited Create;
  FSender := ASender;
  FM := AM;
  FD := AD;
end;

initialization
  InitProcs;
  RM_TaskBarCreated := RegisterWindowMessage('TaskbarCreated');
  RM_TaskBarButtonCreated := RegisterWindowMessage('TaskbarButtonCreated');
  System.Classes.RegisterFindGlobalComponentProc(FindGlobalComponent);
  IdleTimerHandle := 0;

{$IF NOT DEFINED(CLR)}
finalization
  if Application <> nil then
    DoneApplication;
  if HintDoneEvent <> 0 then
    CloseHandle(HintDoneEvent);
  System.Classes.UnregisterFindGlobalComponentProc(FindGlobalComponent);
{$ENDIF}

end.
