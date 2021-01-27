{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.Dialogs;

{$R-,T-,H+,X+}

interface

uses
{$IF DEFINED(CLR)}
  System.ComponentModel.Design.Serialization, WinUtils,
{$ENDIF}
{$IF DEFINED(LINUX)}
  WinUtils,
{$ENDIF}
  Winapi.Windows, Winapi.Messages, System.SysUtils, Winapi.CommDlg, Vcl.Printers,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  Winapi.ShlObj, Winapi.CommCtrl, Vcl.ComCtrls, System.UITypes;

const


(*$HPPEMIT '#include <objbase.h>' *)
(*$HPPEMIT '#include <ShObjIdl.h>' *)
(*$HPPEMIT '' *)
(*$HPPEMIT '// Alias records for C++ code that cannot compile in STRICT mode yet.' *)
(*$HPPEMIT '#if defined(_VCL_ALIAS_RECORDS)' *)
(*$HPPEMIT '#if !defined(STRICT)' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TSaveDialog@Execute$qqrpv"="@Vcl@Dialogs@TSaveDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TColorDialog@Execute$qqrpv"="@Vcl@Dialogs@TColorDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TPrintDialog@Execute$qqrpv"="@Vcl@Dialogs@TPrintDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TFindDialog@Execute$qqrpv"="@Vcl@Dialogs@TFindDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TPageSetupDialog@Execute$qqrpv"="@Vcl@Dialogs@TPageSetupDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TFontDialog@Execute$qqrpv"="@Vcl@Dialogs@TFontDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TCommonDialog@Execute$qqrpv"="@Vcl@Dialogs@TCommonDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TOpenDialog@Execute$qqrpv"="@Vcl@Dialogs@TOpenDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '  #pragma alias "@Vcl@Dialogs@TPrinterSetupDialog@Execute$qqrpv"="@Vcl@Dialogs@TPrinterSetupDialog@Execute$qqrp6HWND__"' *)
(*$HPPEMIT '#endif' *)
(*$HPPEMIT '#endif' *)


{ Maximum number of custom colors in color dialog }

  MaxCustomColors = 16;

{ TOpenDialog }
  ofReadOnly = System.UITypes.TOpenOption.ofReadOnly;
  ofOverwritePrompt = System.UITypes.TOpenOption.ofOverwritePrompt;
  ofHideReadOnly = System.UITypes.TOpenOption.ofHideReadOnly;
  ofNoChangeDir = System.UITypes.TOpenOption.ofNoChangeDir;
  ofShowHelp = System.UITypes.TOpenOption.ofShowHelp;
  ofNoValidate = System.UITypes.TOpenOption.ofNoValidate;
  ofAllowMultiSelect = System.UITypes.TOpenOption.ofAllowMultiSelect;
  ofExtensionDifferent = System.UITypes.TOpenOption.ofExtensionDifferent;
  ofPathMustExist = System.UITypes.TOpenOption.ofPathMustExist;
  ofFileMustExist = System.UITypes.TOpenOption.ofFileMustExist;
  ofCreatePrompt = System.UITypes.TOpenOption.ofCreatePrompt;
  ofShareAware = System.UITypes.TOpenOption.ofShareAware;
  ofNoReadOnlyReturn = System.UITypes.TOpenOption.ofNoReadOnlyReturn;
  ofNoTestFileCreate = System.UITypes.TOpenOption.ofNoTestFileCreate;
  ofNoNetworkButton = System.UITypes.TOpenOption.ofNoNetworkButton;
  ofNoLongNames = System.UITypes.TOpenOption.ofNoLongNames;
  ofOldStyleDialog = System.UITypes.TOpenOption.ofOldStyleDialog;
  ofNoDereferenceLinks = System.UITypes.TOpenOption.ofNoDereferenceLinks;
  ofEnableIncludeNotify = System.UITypes.TOpenOption.ofEnableIncludeNotify;
  ofEnableSizing = System.UITypes.TOpenOption.ofEnableSizing;
  ofDontAddToRecent = System.UITypes.TOpenOption.ofDontAddToRecent;
  ofForceShowHidden = System.UITypes.TOpenOption.ofForceShowHidden;

  ofExNoPlacesBar = System.UITypes.TOpenOptionEx.ofExNoPlacesBar;

{ TPrintDialog }
  prAllPages	= System.UITypes.TPrintRange.prAllPages;
  prSelection	= System.UITypes.TPrintRange.prSelection;
  prPageNums	= System.UITypes.TPrintRange.prPageNums;

  poPrintToFile	= System.UITypes.TPrintDialogOption.poPrintToFile;
  poPageNums	= System.UITypes.TPrintDialogOption.poPageNums;
  poSelection	= System.UITypes.TPrintDialogOption.poSelection;
  poWarning	= System.UITypes.TPrintDialogOption.poWarning;
  poHelp	= System.UITypes.TPrintDialogOption.poHelp;
  poDisablePrintToFile	= System.UITypes.TPrintDialogOption.poDisablePrintToFile;

{ TPageSetupDialog }
  psoDefaultMinMargins	= System.UITypes.TPageSetupDialogOption.psoDefaultMinMargins;
  psoDisableMargins	= System.UITypes.TPageSetupDialogOption.psoDisableMargins;
  psoDisableOrientation	= System.UITypes.TPageSetupDialogOption.psoDisableOrientation;
  psoDisablePagePainting	= System.UITypes.TPageSetupDialogOption.psoDisablePagePainting;
  psoDisablePaper	= System.UITypes.TPageSetupDialogOption.psoDisablePaper;
  psoDisablePrinter	= System.UITypes.TPageSetupDialogOption.psoDisablePrinter;
  psoMargins	= System.UITypes.TPageSetupDialogOption.psoMargins;
  psoMinMargins	= System.UITypes.TPageSetupDialogOption.psoMinMargins;
  psoShowHelp	= System.UITypes.TPageSetupDialogOption.psoShowHelp;
  psoWarning	= System.UITypes.TPageSetupDialogOption.psoWarning;
  psoNoNetworkButton	= System.UITypes.TPageSetupDialogOption.psoNoNetworkButton;

  pkDotMatrix	= System.UITypes.TPrinterKind.pkDotMatrix;
  pkHPPCL	= System.UITypes.TPrinterKind.pkHPPCL;

  ptEnvelope	= System.UITypes.TPageType.ptEnvelope;
  ptPaper	= System.UITypes.TPageType.ptPaper;

  pmDefault	= System.UITypes.TPageMeasureUnits.pmDefault;
  pmMillimeters	= System.UITypes.TPageMeasureUnits.pmMillimeters;
  pmInches	= System.UITypes.TPageMeasureUnits.pmInches;

{ Message dialog }
  mtWarning	= System.UITypes.TMsgDlgType.mtWarning;
  mtError	= System.UITypes.TMsgDlgType.mtError;
  mtInformation	= System.UITypes.TMsgDlgType.mtInformation;
  mtConfirmation	= System.UITypes.TMsgDlgType.mtConfirmation;
  mtCustom	= System.UITypes.TMsgDlgType.mtCustom;

  mbYes	= System.UITypes.TMsgDlgBtn.mbYes;
  mbNo	= System.UITypes.TMsgDlgBtn.mbNo;
  mbOK	= System.UITypes.TMsgDlgBtn.mbOK;
  mbCancel	= System.UITypes.TMsgDlgBtn.mbCancel;
  mbAbort	= System.UITypes.TMsgDlgBtn.mbAbort;
  mbRetry	= System.UITypes.TMsgDlgBtn.mbRetry;
  mbIgnore	= System.UITypes.TMsgDlgBtn.mbIgnore;
  mbAll	= System.UITypes.TMsgDlgBtn.mbAll;
  mbNoToAll	= System.UITypes.TMsgDlgBtn.mbNoToAll;
  mbYesToAll	= System.UITypes.TMsgDlgBtn.mbYesToAll;
  mbHelp	= System.UITypes.TMsgDlgBtn.mbHelp;
  mbClose	= System.UITypes.TMsgDlgBtn.mbClose;

type

{ TCommonDialog }

  [RootDesignerSerializerAttribute('', '', False)]
  TCommonDialog = class(TComponent)
  private
    FCtl3D: Boolean;
    FHelpContext: THelpContext;
    FHandle: HWnd;
    FRedirector: TWinControl;
    FTemplateModule: HINST;
    FOnClose: TNotifyEvent;
    FOnShow: TNotifyEvent;
{$IF DEFINED(CLR)}
    FDefWndProc: IntPtr;
    FObjectInstance: TFNWndProc;
    FTemplate: string;
                                                                            
    FDialogHookDelegate: TFNCommDlgHook;
    class constructor Create;
{$ELSE}
    FDefWndProc: Pointer;
    FObjectInstance: Pointer;
    FTemplate: PChar;
{$ENDIF}
    procedure WMDestroy(var Message: TWMDestroy); message WM_DESTROY;
    procedure WMInitDialog(var Message: TWMInitDialog); message WM_INITDIALOG;
    procedure WMNCDestroy(var Message: TWMNCDestroy); message WM_NCDESTROY;
    procedure MainWndProc(var Message: TMessage);
{$IF DEFINED(CLR)}
  strict private
    class var
      FHelpMsg: Cardinal;
{$ENDIF}
  protected
    procedure DoClose; dynamic;
    procedure DoShow; dynamic;
    procedure WndProc(var Message: TMessage); virtual;
    function GetHandle: HWND; virtual;
    function MessageHook(var Msg: TMessage): Boolean; virtual;
{$IF DEFINED(CLR)}
    function LaunchDialog(DialogData: IntPtr): Bool; virtual;
    function TaskModalDialog(DialogData: IntPtr): Bool; virtual;
    class property HelpMsg: Cardinal read FHelpMsg write FHelpMsg;
    property Template: string read FTemplate write FTemplate;
{$ELSE}
    function TaskModalDialog(DialogFunc: Pointer; var DialogData): Bool; virtual;
    property Template: PChar read FTemplate write FTemplate;
{$ENDIF}
    property TemplateModule: HINST read FTemplateModule write FTemplateModule;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; overload; virtual;
    function Execute(ParentWnd: HWND): Boolean; overload; virtual; abstract;
{$IF DEFINED(CLR)}
    function DialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR;
    procedure DefaultHandler(var Message); virtual;
{$ELSE}
    procedure DefaultHandler(var Message); override;
{$ENDIF}
    property Handle: HWnd read GetHandle;
  published
    property Ctl3D: Boolean read FCtl3D write FCtl3D default True;
    property HelpContext: THelpContext read FHelpContext write FHelpContext default 0;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
  end;

{ TOpenDialog }

  TOpenOption = System.UITypes.TOpenOption;
  {$NODEFINE TOpenOption}
  TOpenOptions = System.UITypes.TOpenOptions;
  {$NODEFINE TOpenOptions}
  TOpenOptionEx = System.UITypes.TOpenOptionEx;
  {$NODEFINE TOpenOptionEx}
  TOpenOptionsEx = System.UITypes.TOpenOptionsEx;
  {$NODEFINE TOpenOptionsEx}

  {$HPPEMIT OPENNAMESPACE}
  {$HPPEMIT 'using System::Uitypes::TOpenOption;'}
  {$HPPEMIT 'using System::Uitypes::TOpenOptions;'}
  {$HPPEMIT 'using System::Uitypes::TOpenOptionEx;'}
  {$HPPEMIT 'using System::Uitypes::TOpenOptionsEx;'}
  {$HPPEMIT CLOSENAMESPACE}


  TFileEditStyle = (fsEdit, fsComboBox);
  TOFNotifyEx = type Winapi.CommDlg.TOFNotifyEx;
  (*$NODEFINE TOFNotifyEx *)
  (*$HPPEMIT 'namespace Vcl { '*)
  (*$HPPEMIT 'namespace Dialogs { '*)
  (*$HPPEMIT '#if defined(_DELPHI_STRING_UNICODE)' *)
  (*$HPPEMIT 'typedef _OFNOTIFYEXW TOFNotifyEx;' *)
  (*$HPPEMIT '#else' *)
  (*$HPPEMIT 'typedef _OFNOTIFYEXA TOFNotifyEx;' *)
  (*$HPPEMIT '#endif' *)
  (*$HPPEMIT '}' *)
  (*$HPPEMIT '}' *)

  TIncludeItemEvent = procedure (const OFN: TOFNotifyEx; var Include: Boolean) of object;

  TOpenDialog = class(TCommonDialog)
  private
    FHistoryList: TStrings;
    FOptions: TOpenOptions;
    FFilter: string;
    FFilterIndex: Integer;
    FCurrentFilterIndex: Integer;
    FInitialDir: string;
    FTitle: string;
    FDefaultExt: string;
    FFileName: TFileName;
    FFiles: TStrings;
    FFileEditStyle: TFileEditStyle;
    FOnSelectionChange: TNotifyEvent;
    FOnFolderChange: TNotifyEvent;
    FOnTypeChange: TNotifyEvent;
    FOnCanClose: TCloseQueryEvent;
    FOnIncludeItem: TIncludeItemEvent;
    FOptionsEx: TOpenOptionsEx;
    FInternalWrapper: TObject;
{$IF DEFINED(CLR)}
    FExplorerHookDelegate: TFNCommDlgHook;
{$ENDIF}
    function GetFileName: TFileName;
    function GetFiles: TStrings;
    function GetFilterIndex: Integer;
    function GetInitialDir: string;
    procedure ReadFileEditStyle(Reader: TReader);
    procedure SetFileName(Value: TFileName);
    procedure SetHistoryList(Value: TStrings);
    procedure SetInitialDir(const Value: string);
  protected
    function CanClose(var OpenFileName: TOpenFileName): Boolean;
    function DoCanClose: Boolean; dynamic;
    procedure DoSelectionChange; dynamic;
    procedure DoFolderChange; dynamic;
    procedure DoTypeChange; dynamic;
    procedure DoIncludeItem(const OFN: TOFNotifyEx; var Include: Boolean); dynamic;
    procedure DefineProperties(Filer: TFiler); override;
    procedure GetFileNames(var OpenFileName: TOpenFileName);
    function GetHandle: HWND; override;
    function GetStaticRect: TRect; virtual;
    procedure WndProc(var Message: TMessage); override;
{$IF DEFINED(CLR)}
    function LaunchDialog(DialogData: IntPtr): Bool; override;
{$ELSE}
    function DoExecute(Func: Pointer): Bool; overload;
    function DoExecute(Func: Pointer; ParentWnd: HWND): Bool; overload;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute(ParentWnd: HWND): Boolean; override;
{$IF DEFINED(CLR)}
    function ExplorerHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR;
{$ENDIF}
    property FileEditStyle: TFileEditStyle read FFileEditStyle write FFileEditStyle;
    property Files: TStrings read GetFiles;
    property HistoryList: TStrings read FHistoryList write SetHistoryList;
  published
    property DefaultExt: string read FDefaultExt write FDefaultExt;
    property FileName: TFileName read GetFileName write SetFileName;
    property Filter: string read FFilter write FFilter;
    property FilterIndex: Integer read GetFilterIndex write FFilterIndex default 1;
    property InitialDir: string read GetInitialDir write SetInitialDir;
    property Options: TOpenOptions read FOptions write FOptions default [ofHideReadOnly, ofEnableSizing];
    property OptionsEx: TOpenOptionsEx read FOptionsEx write FOptionsEx default [];
    property Title: string read FTitle write FTitle;
    property OnCanClose: TCloseQueryEvent read FOnCanClose write FOnCanClose;
    property OnFolderChange: TNotifyEvent read FOnFolderChange write FOnFolderChange;
    property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;
    property OnTypeChange: TNotifyEvent read FOnTypeChange write FOnTypeChange;
    property OnIncludeItem: TIncludeItemEvent read FOnIncludeItem write FOnIncludeItem;
  end;

{ TSaveDialog }

  TSaveDialog = class(TOpenDialog)
{$IF DEFINED(CLR)}
  protected
    function LaunchDialog(DialogData: IntPtr): Bool; override;
{$ENDIF}
  public
    function Execute(ParentWnd: HWND): Boolean; override;
  end;

{ TColorDialog }

  TColorDialogOption = (cdFullOpen, cdPreventFullOpen, cdShowHelp,
    cdSolidColor, cdAnyColor);
  TColorDialogOptions = set of TColorDialogOption;

{$IF NOT DEFINED(CLR)}
  TCustomColors = array[0..MaxCustomColors - 1] of Longint;
{$ENDIF}

  TColorDialog = class(TCommonDialog)
  private
    FColor: TColor;
    FOptions: TColorDialogOptions;
    FCustomColors: TStrings;
    procedure SetCustomColors(Value: TStrings);
{$IF DEFINED(CLR)}
  protected
    function LaunchDialog(DialogData: IntPtr): Bool; override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute(ParentWnd: HWND): Boolean; override;
  published
    property Color: TColor read FColor write FColor default clBlack;
    property Ctl3D default True;
    property CustomColors: TStrings read FCustomColors write SetCustomColors;
    property Options: TColorDialogOptions read FOptions write FOptions default [];
  end;

{ TFontDialog }

  TFontDialogOption = (fdAnsiOnly, fdTrueTypeOnly, fdEffects,
    fdFixedPitchOnly, fdForceFontExist, fdNoFaceSel, fdNoOEMFonts,
    fdNoSimulations, fdNoSizeSel, fdNoStyleSel,  fdNoVectorFonts,
    fdShowHelp, fdWysiwyg, fdLimitSize, fdScalableOnly, fdApplyButton);
  TFontDialogOptions = set of TFontDialogOption;

  TFontDialogDevice = (fdScreen, fdPrinter, fdBoth);

  TFDApplyEvent = procedure(Sender: TObject; Wnd: HWND) of object;

  TFontDialog = class(TCommonDialog)
  private
    FFont: TFont;
    FDevice: TFontDialogDevice;
    FOptions: TFontDialogOptions;
    FOnApply: TFDApplyEvent;
    FMinFontSize: Integer;
    FMaxFontSize: Integer;
    FFontCharsetModified: Boolean;
    FFontColorModified: Boolean;
{$IF DEFINED(CLR)}
    FFontHookDelegate: TFNCommDlgHook;
{$ENDIF}
    procedure DoApply(Wnd: HWND);
    procedure SetFont(Value: TFont);
    procedure UpdateFromLogFont(const LogFont: TLogFont);
  protected
    procedure Apply(Wnd: HWND); dynamic;
    procedure WndProc(var Message: TMessage); override;
{$IF DEFINED(CLR)}
    function LaunchDialog(DialogData: IntPtr): Bool; override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute(ParentWnd: HWND): Boolean; override;
{$IF DEFINED(CLR)}
    function FontDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR;
{$ENDIF}
  published
    property Font: TFont read FFont write SetFont;
    property Device: TFontDialogDevice read FDevice write FDevice default fdScreen;
    property MinFontSize: Integer read FMinFontSize write FMinFontSize default 0;
    property MaxFontSize: Integer read FMaxFontSize write FMaxFontSize default 0;
    property Options: TFontDialogOptions read FOptions write FOptions default [fdEffects];
    property OnApply: TFDApplyEvent read FOnApply write FOnApply;
  end;

{ TPrinterSetupDialog }

  TPrinterSetupDialog = class(TCommonDialog)
{$IF DEFINED(CLR)}
  protected
    function LaunchDialog(DialogData: IntPtr): Bool; override;
{$ENDIF}
  public
    function Execute(ParentWnd: HWND): Boolean; override;
  end;

{ TPrintDialog }

  TPrintRange = System.UITypes.TPrintRange;
  {$NODEFINE TPrintRange}
  TPrintDialogOption = System.UITypes.TPrintDialogOption;
  {$NODEFINE TPrintDialogOption}
  TPrintDialogOptions = System.UITypes.TPrintDialogOptions;
  {$NODEFINE TPrintDialogOptions}

  {$HPPEMIT OPENNAMESPACE}
  {$HPPEMIT 'using System::Uitypes::TPrintRange;'}
  {$HPPEMIT 'using System::Uitypes::TPrintDialogOption;'}
  {$HPPEMIT 'using System::Uitypes::TPrintDialogOptions;'}
  {$HPPEMIT CLOSENAMESPACE}

  TPrintDialog = class(TCommonDialog)
  private
    FFromPage: Integer;
    FToPage: Integer;
    FCollate: Boolean;
    FOptions: TPrintDialogOptions;
    FPrintToFile: Boolean;
    FPrintRange: TPrintRange;
    FMinPage: Integer;
    FMaxPage: Integer;
    FCopies: Integer;
    procedure SetNumCopies(Value: Integer);
{$IF DEFINED(CLR)}
  protected
    function LaunchDialog(DialogData: IntPtr): Bool; override;
{$ENDIF}
  public
    function Execute(ParentWnd: HWND): Boolean; override;
  published
    property Collate: Boolean read FCollate write FCollate default False;
    property Copies: Integer read FCopies write SetNumCopies default 0;
    property FromPage: Integer read FFromPage write FFromPage default 0;
    property MinPage: Integer read FMinPage write FMinPage default 0;
    property MaxPage: Integer read FMaxPage write FMaxPage default 0;
    property Options: TPrintDialogOptions read FOptions write FOptions default [];
    property PrintToFile: Boolean read FPrintToFile write FPrintToFile default False;
    property PrintRange: TPrintRange read FPrintRange write FPrintRange default prAllPages;
    property ToPage: Integer read FToPage write FToPage default 0;
  end;

  TPrinterOrientation = Vcl.Printers.TPrinterOrientation;  // required for Form Designer
  (*$NODEFINE  TPrinterOrientation *)                  // Avoid C++ Ambiguity
  (*$HPPEMIT  'namespace Vcl { namespace Dialogs { using Vcl::Printers::TPrinterOrientation; } }' *)

  TPageSetupDialogOption = System.UITypes.TPageSetupDialogOption;
  {$NODEFINE TPageSetupDialogOption}
  TPageSetupDialogOptions = System.UITypes.TPageSetupDialogOptions;
  {$NODEFINE TPageSetupDialogOptions}

  TPrinterKind = System.UITypes.TPrinterKind;
  {$NODEFINE TPrinterKind}

  TPageType = System.UITypes.TPageType;
  {$NODEFINE TPageType}

  TPageMeasureUnits = System.UITypes.TPageMeasureUnits;
  {$NODEFINE TPageMeasureUnits}

  {$HPPEMIT OPENNAMESPACE}
  {$HPPEMIT 'using System::Uitypes::TPageSetupDialogOption;'}
  {$HPPEMIT 'using System::Uitypes::TPageSetupDialogOptions;'}
  {$HPPEMIT 'using System::Uitypes::TPrinterKind;'}
  {$HPPEMIT 'using System::Uitypes::TPageType;'}
  {$HPPEMIT 'using System::Uitypes::TPageMeasureUnits;'}
  {$HPPEMIT CLOSENAMESPACE}

  TPageSetupBeforePaintEvent = procedure (Sender: TObject; const PaperSize: SmallInt;
    const Orientation: TPrinterOrientation; const PageType: TPageType;
    var DoneDrawing: Boolean) of object;
  TPaintPageEvent = procedure(Sender: TObject; Canvas: TCanvas; PageRect: TRect;
    var DoneDrawing: Boolean) of object;

  { TPageSetupDialog }

  TPageSetupDialog = class(TCommonDialog)
  private
    FOptions: TPageSetupDialogOptions;
    FMinMarginLeft: Integer;
    FMinMarginTop: Integer;
    FMinMarginRight: Integer;
    FMinMarginBottom: Integer;
    FMarginLeft: Integer;
    FMarginTop: Integer;
    FMarginRight: Integer;
    FMarginBottom: Integer;
    FPageWidth: Integer;
    FPageHeight: Integer;
    FPageSetupDlgRec: TPageSetupDlg;
    FBeforePaint: TPageSetupBeforePaintEvent;
    FUnits: TPageMeasureUnits;
    FOnDrawRetAddress: TPaintPageEvent;
    FOnDrawMinMargin: TPaintPageEvent;
    FOnDrawEnvStamp: TPaintPageEvent;
    FOnDrawFullPage: TPaintPageEvent;
    FOnDrawGreekText: TPaintPageEvent;
    FOnDrawMargin: TPaintPageEvent;
{$IF DEFINED(CLR)}
  protected
    function LaunchDialog(DialogData: IntPtr): Bool; override;
    function PagePaint(Wnd: HWND; Message: UINT; wParam: WPARAM; lParam: LPARAM): UINT_PTR;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    function Execute(ParentWnd: HWND): Boolean; override;
    function GetDefaults: Boolean;
    property PageSetupDlgRec: TPageSetupDlg read FPageSetupDlgRec;
  published
    property MinMarginLeft: Integer read FMinMarginLeft write FMinMarginLeft;
    property MinMarginTop: Integer read FMinMarginTop write FMinMarginTop;
    property MinMarginRight: Integer read FMinMarginRight write FMinMarginRight;
    property MinMarginBottom: Integer read FMinMarginBottom write FMinMarginBottom;
    property MarginLeft: Integer read FMarginLeft write FMarginLeft;
    property MarginTop: Integer read FMarginTop write FMarginTop;
    property MarginRight: Integer read FMarginRight write FMarginRight;
    property MarginBottom: Integer read FMarginBottom write FMarginBottom;
    property Options: TPageSetupDialogOptions read FOptions write FOptions
      default [psoDefaultMinMargins];
    property PageWidth: Integer read FPageWidth write FPageWidth;
    property PageHeight: Integer read FPageHeight write FPageHeight;
    property Units: TPageMeasureUnits read FUnits write FUnits default pmDefault;
    property BeforePaint: TPageSetupBeforePaintEvent read FBeforePaint
      write FBeforePaint;
    property OnDrawFullPage: TPaintPageEvent read FOnDrawFullPage write FOnDrawFullPage;
    property OnDrawMinMargin: TPaintPageEvent read FOnDrawMinMargin write FOnDrawMinMargin;
    property OnDrawMargin: TPaintPageEvent read FOnDrawMargin write FOnDrawMargin;
    property OnDrawGreekText: TPaintPageEvent read FOnDrawGreekText write FOnDrawGreekText;
    property OnDrawEnvStamp: TPaintPageEvent read FOnDrawEnvStamp write FOnDrawEnvStamp;
    property OnDrawRetAddress: TPaintPageEvent read FOnDrawRetAddress write FOnDrawRetAddress;
  end;

{ TFindDialog }

  TFindOption = (frDown, frFindNext, frHideMatchCase, frHideWholeWord,
    frHideUpDown, frMatchCase, frDisableMatchCase, frDisableUpDown,
    frDisableWholeWord, frReplace, frReplaceAll, frWholeWord, frShowHelp);
  TFindOptions = set of TFindOption;

  TFindReplaceFunc = function(var FindReplace: TFindReplace): HWnd; {$IFNDEF CLR}stdcall;{$ENDIF}

{$IF DEFINED(CLR)}
  TFindDlgResources = class
  private
    FFindHandle: HWnd;
    FFindReplacePtr: IntPtr;
    FObjectInstance: TFNWndProc;
  strict protected
    procedure Finalize; override;
  end;
{$ENDIF}

  TFindDialog = class(TCommonDialog)
  private
    FOptions: TFindOptions;
    FPosition: TPoint;
    FOnFind: TNotifyEvent;
    FOnReplace: TNotifyEvent;
{$IF DEFINED(CLR)}
    FResources: TFindDlgResources;
    FOldWindowLong: IntPtr;
    FFindText: string;
    FReplaceText: string;
    FFRDH: TFNCommDlgHook;
    FFRWP: TFNWndProc;
    class constructor Create;
{$ELSE}
    FFindReplaceFunc: TFindReplaceFunc;
    FFindHandle: HWnd;
    FFindReplace: TFindReplace;
    FFindText: array[0..255] of Char;
    FReplaceText: array[0..255] of Char;
{$ENDIF}
    function GetFindText: string;
    function GetLeft: Integer;
    function GetPosition: TPoint;
    function GetReplaceText: string;
    function GetTop: Integer;
    procedure SetFindText(const Value: string);
    procedure SetLeft(Value: Integer);
    procedure SetPosition(const Value: TPoint);
    procedure SetReplaceText(const Value: string);
    procedure SetTop(Value: Integer);
    property ReplaceText: string read GetReplaceText write SetReplaceText;
    property OnReplace: TNotifyEvent read FOnReplace write FOnReplace;
{$IF DEFINED(CLR)}
  strict private
    class var
      FFindMsg: Cardinal;
{$ENDIF}
  protected
    function MessageHook(var Msg: TMessage): Boolean; override;
    procedure Find; dynamic;
    procedure Replace; dynamic;
{$IF DEFINED(CLR)}
    function LaunchDialog(DialogData: IntPtr): Bool; override;
{$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseDialog;
    function Execute(ParentWnd: HWND): Boolean; override;
{$IF DEFINED(CLR)}
    function FindReplaceDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR;
    function FindReplaceWndProc(Wnd: HWND; Msg: UINT; WParam: WPARAM; LParam: LPARAM): LRESULT;
{$ENDIF}
    property Left: Integer read GetLeft write SetLeft;
    property Position: TPoint read GetPosition write SetPosition;
    property Top: Integer read GetTop write SetTop;
  published
    property FindText: string read GetFindText write SetFindText;
    property Options: TFindOptions read FOptions write FOptions default [frDown];
    property OnFind: TNotifyEvent read FOnFind write FOnFind;
  end;

{ TReplaceDialog }

  TReplaceDialog = class(TFindDialog)
{$IF DEFINED(CLR)}
  protected
    function LaunchDialog(DialogData: IntPtr): Bool; override;
{$ELSE}
  public
    constructor Create(AOwner: TComponent); override;
{$ENDIF}
  published
    property ReplaceText;
    property OnReplace;
  end;

{ TCustomFileDialog }

  EPlatformVersionException = class(Exception);

  TFileDialogOption = (fdoOverWritePrompt, fdoStrictFileTypes,
    fdoNoChangeDir, fdoPickFolders, fdoForceFileSystem,
    fdoAllNonStorageItems, fdoNoValidate, fdoAllowMultiSelect,
    fdoPathMustExist, fdoFileMustExist, fdoCreatePrompt,
    fdoShareAware, fdoNoReadOnlyReturn, fdoNoTestFileCreate,
    fdoHideMRUPlaces, fdoHidePinnedPlaces, fdoNoDereferenceLinks,
    fdoDontAddToRecent, fdoForceShowHidden, fdoDefaultNoMiniMode,
    fdoForcePreviewPaneOn);
  TFileDialogOptions = set of TFileDialogOption;

  TFileDialogOverwriteResponse = (forDefault = FDEOR_DEFAULT,
    forAccept = FDEOR_ACCEPT, forRefuse = FDEOR_REFUSE);
  TFileDialogShareViolationResponse = (fsrDefault = FDESVR_DEFAULT,
    fsrAccept = FDESVR_ACCEPT, fsrRefuse = FDESVR_REFUSE);

  TFileDialogCloseEvent = procedure(Sender: TObject; var CanClose: Boolean) of object;
  TFileDialogFolderChangingEvent = procedure(Sender: TObject; var CanChange: Boolean) of object;
  TFileDialogOverwriteEvent = procedure(Sender: TObject;
    var Response: TFileDialogOverwriteResponse) of object;
  TFileDialogShareViolationEvent = procedure(Sender: TObject;
    var Response: TFileDialogShareViolationResponse) of object;

  TFileTypeItem = class(TCollectionItem)
  private
    FDisplayName: string;
    FDisplayNameWStr: LPCWSTR;
    FFileMask: string;
    FFileMaskWStr: LPCWSTR;
    function GetDisplayNameWStr: LPCWSTR;
    function GetFileMaskWStr: LPCWSTR;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property DisplayNameWStr: LPCWSTR read GetDisplayNameWStr;
    property FileMaskWStr: LPCWSTR read GetFileMaskWStr;
  published
    property DisplayName: string read FDisplayName write FDisplayName;
    property FileMask: string read FFileMask write FFileMask;
  end;

  TFileTypeItems = class(TCollection)
  private
    function GetItem(Index: Integer): TFileTypeItem;
    procedure SetItem(Index: Integer; const Value: TFileTypeItem);
  public
    function Add: TFileTypeItem;
    function FilterSpecArray: TComdlgFilterSpecArray;
    property Items[Index: Integer]: TFileTypeItem read GetItem write SetItem; default;
  end;

  TFavoriteLinkItem = class(TCollectionItem)
  private
    FLocation: string;
  protected
    function GetDisplayName: string; override;
  published
    property Location: string read FLocation write FLocation;
  end;

  TFavoriteLinkItems = class;

  TFavoriteLinkItemsEnumerator = class
  private
    FIndex: Integer;
    FCollection: TFavoriteLinkItems;
  public
    constructor Create(ACollection: TFavoriteLinkItems);
    function GetCurrent: TFavoriteLinkItem;
    function MoveNext: Boolean;
    property Current: TFavoriteLinkItem read GetCurrent;
  end;

  TFavoriteLinkItems = class(TCollection)
  private
    function GetItem(Index: Integer): TFavoriteLinkItem;
    procedure SetItem(Index: Integer; const Value: TFavoriteLinkItem);
  public
    function Add: TFavoriteLinkItem;
    function GetEnumerator: TFavoriteLinkItemsEnumerator;
    property Items[Index: Integer]: TFavoriteLinkItem read GetItem write SetItem; default;
  end;

  TCustomFileDialog = class(TComponent)
  private
    FClientGuid: string;
    FDefaultExtension: string;
    FDefaultFolder: string;
    FDialog: IFileDialog;
    FFavoriteLinks: TFavoriteLinkItems;
    FFileName: TFileName;
    FFileNameLabel: string;
    FFiles: TStrings;
    FFileTypeIndex: Cardinal;
    FFileTypes: TFileTypeItems;
    FHandle: HWnd;
    FOkButtonLabel: string;
    FOptions: TFileDialogOptions;
    FShellItem: IShellItem;
    FShellItems: IShellItemArray;
    FTitle: string;
    FOnExecute: TNotifyEvent;
    FOnFileOkClick: TFileDialogCloseEvent;
    FOnFolderChange: TNotifyEvent;
    FOnFolderChanging: TFileDialogFolderChangingEvent;
    FOnOverwrite: TFileDialogOverwriteEvent;
    FOnSelectionChange: TNotifyEvent;
    FOnShareViolation: TFileDialogShareViolationEvent;
    FOnTypeChange: TNotifyEvent;
    FActualFolder: TFileName;
    function GetDefaultFolder: string;
    function GetFileName: TFileName;
    function GetFiles: TStrings;
    procedure GetWindowHandle;
    procedure SetClientGuid(const Value: string);
    procedure SetDefaultFolder(const Value: string);
    procedure SetFavoriteLinks(const Value: TFavoriteLinkItems);
    procedure SetFileName(const Value: TFileName);
    procedure SetFileTypes(const Value: TFileTypeItems);
    procedure SaveActualFolder(Sender: TObject);
  strict protected
    function CreateFileDialog: IFileDialog; virtual; abstract;
    procedure DoOnExecute; dynamic;
    function DoOnFileOkClick: Boolean; dynamic;
    procedure DoOnFolderChange; dynamic;
    function DoOnFolderChanging: Boolean; dynamic;
    procedure DoOnOverwrite(var Response: TFileDialogOverwriteResponse); dynamic;
    procedure DoOnSelectionChange; dynamic;
    procedure DoOnShareViolation(var Response: TFileDialogShareViolationResponse); dynamic;
    procedure DoOnTypeChange; dynamic;
    function GetFileNames(Items: IShellItemArray): HResult; dynamic;
    function GetItemName(Item: IShellItem; var ItemName: TFileName): HResult; dynamic;
    function GetResults: HResult; virtual;
  protected
    function FileOkClick: HResult; dynamic;
    function FolderChange: HResult; dynamic;
    function FolderChanging(psiFolder: IShellItem): HResult; dynamic;
    function Overwrite(psiFile: IShellItem; var Response: Cardinal): HResult; dynamic;
    function SelectionChange: HResult; dynamic;
    function ShareViolation(psiFile: IShellItem; var Response: Cardinal): HResult; dynamic;
    function TypeChange: HResult; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; overload; virtual;
    function Execute(ParentWnd: HWND): Boolean; overload; virtual;
    property ClientGuid: string read FClientGuid write SetClientGuid;
    property DefaultExtension: string read FDefaultExtension write FDefaultExtension;
    property DefaultFolder: string read GetDefaultFolder write SetDefaultFolder;
    property Dialog: IFileDialog read FDialog;
    property FavoriteLinks: TFavoriteLinkItems read FFavoriteLinks write SetFavoriteLinks;
    property FileName: TFileName read GetFileName write SetFileName;
    property FileNameLabel: string read FFileNameLabel write FFileNameLabel;
    property Files: TStrings read GetFiles;
    property FileTypes: TFileTypeItems read FFileTypes write SetFileTypes;
    property FileTypeIndex: Cardinal read FFileTypeIndex write FFileTypeIndex default 1;
    property Handle: HWnd read FHandle;
    property OkButtonLabel: string read FOkButtonLabel write FOkButtonLabel;
    property Options: TFileDialogOptions read FOptions write FOptions;
    property ShellItem: IShellItem read FShellItem;
    property ShellItems: IShellItemArray read FShellItems;
    property Title: string read FTitle write FTitle;
    property OnExecute: TNotifyEvent read FOnExecute write FOnExecute;
    property OnFileOkClick: TFileDialogCloseEvent read FOnFileOkClick write FOnFileOkClick;
    property OnFolderChange: TNotifyEvent read FOnFolderChange write FOnFolderChange;
    property OnFolderChanging: TFileDialogFolderChangingEvent read FOnFolderChanging write FOnFolderChanging;
    property OnOverwrite: TFileDialogOverwriteEvent read FOnOverwrite write FOnOverwrite;
    property OnSelectionChange: TNotifyEvent read FOnSelectionChange write FOnSelectionChange;
    property OnShareViolation: TFileDialogShareViolationEvent read FOnShareViolation write FOnShareViolation;
    property OnTypeChange: TNotifyEvent read FOnTypeChange write FOnTypeChange;
  end;

{ TFileOpenDialog }

  TCustomFileOpenDialog = class(TCustomFileDialog)
  strict protected
    function CreateFileDialog: IFileDialog; override;
    function GetResults: HResult; override;
  protected
    function SelectionChange: HResult; override;
  end;

  TFileOpenDialog = class(TCustomFileOpenDialog)
  published
    property ClientGuid;
    property DefaultExtension;
    property DefaultFolder;
    property FavoriteLinks;
    property FileName;
    property FileNameLabel;
    property FileTypes;
    property FileTypeIndex;
    property OkButtonLabel;
    property Options;
    property Title;
    property OnExecute;
    property OnFileOkClick;
    property OnFolderChange;
    property OnFolderChanging;
    property OnSelectionChange;
    property OnShareViolation;
    property OnTypeChange;
  end platform;

{ TFileSaveDialog }

  TCustomFileSaveDialog = class(TCustomFileDialog)
  strict protected
    function CreateFileDialog: IFileDialog; override;
  end;

  TFileSaveDialog = class(TCustomFileSaveDialog)
  published
    property ClientGuid;
    property DefaultExtension;
    property DefaultFolder;
    property FavoriteLinks;
    property FileName;
    property FileNameLabel;
    property FileTypes;
    property FileTypeIndex;
    property OkButtonLabel;
    property Options;
    property Title;
    property OnExecute;
    property OnFileOkClick;
    property OnFolderChange;
    property OnFolderChanging;
    property OnOverwrite;
    property OnSelectionChange;
    property OnShareViolation;
    property OnTypeChange;
  end platform;

{ TTaskDialog }

const
  tdiNone = 0;
  tdiWarning = 1;
  tdiError = 2;
  tdiInformation = 3;
  tdiShield = 4;

type
  TCustomTaskDialog = class;

  TTaskDialogFlag = (tfEnableHyperlinks, tfUseHiconMain,
    tfUseHiconFooter, tfAllowDialogCancellation,
    tfUseCommandLinks, tfUseCommandLinksNoIcon,
    tfExpandFooterArea, tfExpandedByDefault,
    tfVerificationFlagChecked, tfShowProgressBar,
    tfShowMarqueeProgressBar, tfCallbackTimer,
    tfPositionRelativeToWindow, tfRtlLayout,
    tfNoDefaultRadioButton, tfCanBeMinimized);
  TTaskDialogFlags = set of TTaskDialogFlag;

  TTaskDialogCommonButton = (tcbOk, tcbYes, tcbNo, tcbCancel, tcbRetry, tcbClose);
  TTaskDialogCommonButtons = set of TTaskDialogCommonButton;

  TTaskDialogIcon = Low(Integer)..High(Integer);

  TProgressBarState = Vcl.ComCtrls.TProgressBarState; // for compatibility

  TTaskDialogProgressBar = class(TPersistent)
  private
    FClient: TCustomTaskDialog;
    FMarqueeSpeed: Cardinal;
    FMax: Integer;
    FMin: Integer;
    FPosition: Integer;
    FState: TProgressBarState;
    procedure SetMarqueeSpeed(const Value: Cardinal);
    procedure SetMax(const Value: Integer);
    procedure SetMin(const Value: Integer);
    procedure SetPosition(const Value: Integer);
    procedure SetState(const Value: TProgressBarState);
  public
    constructor Create(AClient: TCustomTaskDialog);
    procedure Initialize;
  published
    property MarqueeSpeed: Cardinal read FMarqueeSpeed write SetMarqueeSpeed default 0;
    property Max: Integer read FMax write SetMax default 100;
    property Min: Integer read FMin write SetMin default 0;
    property Position: Integer read FPosition write SetPosition default 0;
    property State: TProgressBarState read FState write SetState default pbsNormal;
  end;

  TTaskDialogBaseButtonItem = class(TCollectionItem)
  private
    FCaption: string;
    FClient: TCustomTaskDialog;
    FEnabled: Boolean;
    FModalResult: TModalResult;
    FTextWStr: LPCWSTR;
    function GetDefault: Boolean;
    function GetTextWStr: LPCWSTR;
    procedure SetCaption(const Value: string);
    procedure SetDefault(const Value: Boolean);
    procedure SetEnabled(const Value: Boolean);
  strict protected
    procedure DoButtonClick; virtual;
    procedure DoSetEnabled; virtual;
    function GetButtonText: string; virtual;
    property Client: TCustomTaskDialog read FClient;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Click;
    procedure SetInitialState; virtual;
    property ModalResult: TModalResult read FModalResult write FModalResult;
    property TextWStr: LPCWSTR read GetTextWStr;
  published
    property Caption: string read FCaption write SetCaption;
    property Default: Boolean read GetDefault write SetDefault default False;
    property Enabled: Boolean read FEnabled write SetEnabled default True;
  end;

  TTaskDialogButtonItem = class(TTaskDialogBaseButtonItem)
  private
    FCommandLinkHint: string;
    FElevationRequired: Boolean;
    procedure DoSetElevationRequired;
    procedure SetElevationRequired(const Value: Boolean);
  strict protected
    function GetButtonText: string; override;
  public
    constructor Create(Collection: TCollection); override;
    procedure SetInitialState; override;
  published
    property CommandLinkHint: string read FCommandLinkHint write FCommandLinkHint;
    property ElevationRequired: Boolean read FElevationRequired write SetElevationRequired default False;
    property ModalResult;
  end;

  TTaskDialogRadioButtonItem = class(TTaskDialogBaseButtonItem)
  strict protected
    procedure DoButtonClick; override;
    procedure DoSetEnabled; override;
  public
    constructor Create(Collection: TCollection); override;
  end;

  TTaskDialogButtonList = array of TTaskDialogButton;

  TTaskDialogButtons = class;

  TTaskDialogButtonsEnumerator = class
  private
    FIndex: Integer;
    FCollection: TTaskDialogButtons;
  public
    constructor Create(ACollection: TTaskDialogButtons);
    function GetCurrent: TTaskDialogBaseButtonItem;
    function MoveNext: Boolean;
    property Current: TTaskDialogBaseButtonItem read GetCurrent;
  end;

  TTaskDialogButtons = class(TOwnedCollection)
  private
    FButtonList:  TTaskDialogButtonList;
    FButtonListPtr: PTaskDialogButton;
    FDefaultButton: TTaskDialogBaseButtonItem;
    function GetItem(Index: Integer): TTaskDialogBaseButtonItem;
    procedure SetDefaultButton(const Value: TTaskDialogBaseButtonItem);
    procedure SetItem(Index: Integer; const Value: TTaskDialogBaseButtonItem);
  public
    destructor Destroy; override;
    function Add: TTaskDialogBaseButtonItem;
    function Buttons: PTaskDialogButton;
    function FindButton(AModalResult: TModalResult): TTaskDialogBaseButtonItem;
    function GetEnumerator: TTaskDialogButtonsEnumerator;
    procedure SetInitialState; dynamic;
    property DefaultButton: TTaskDialogBaseButtonItem read FDefaultButton write SetDefaultButton;
    property Items[Index: Integer]: TTaskDialogBaseButtonItem read GetItem write SetItem; default;
  end;

  TTaskDlgClickEvent = procedure(Sender: TObject; ModalResult: TModalResult; var CanClose: Boolean) of object;
  TTaskDlgTimerEvent = procedure(Sender: TObject; TickCount: Cardinal; var Reset: Boolean) of object;

  TCustomTaskDialog = class(TComponent)
  private
    FButton: TTaskDialogButtonItem;
    FButtons: TTaskDialogButtons;
    FCaption: string;
    FCommonButtons: TTaskDialogCommonButtons;
    FCustomFooterIcon: TIcon;
    FCustomMainIcon: TIcon;
    FDefaultButton: TTaskDialogCommonButton;
    FExpandButtonCaption: string;
    FExpanded: Boolean;
    FExpandedText: string;
    FFlags: TTaskDialogFlags;
    FFooterIcon: TTaskDialogIcon;
    FFooterText: string;
    FHandle: HWND;
    FHelpContext: Integer;
    FMainIcon: TTaskDialogIcon;
    FModalResult: TModalResult;
    FProgressBar: TTaskDialogProgressBar;
    FRadioButton: TTaskDialogRadioButtonItem;
    FRadioButtons: TTaskDialogButtons;
    FText: string;
    FTitle: string;
    FURL: string;
    FVerificationText: string;
    FOnButtonClicked: TTaskDlgClickEvent;
    FOnDialogConstructed: TNotifyEvent;
    FOnDialogCreated: TNotifyEvent;
    FOnDialogDestroyed: TNotifyEvent;
    FOnExpanded: TNotifyEvent;
    FOnHyperlinkClicked: TNotifyEvent;
    FOnNavigated: TNotifyEvent;
    FOnRadioButtonClicked: TNotifyEvent;
    FOnTimer: TTaskDlgTimerEvent;
    FOnVerificationClicked: TNotifyEvent;
    procedure SetButtons(const Value: TTaskDialogButtons);
    procedure SetExpandedText(const Value: string);
    procedure SetFooterIcon(const Value: TTaskDialogIcon);
    procedure SetFooterText(const Value: string);
    procedure SetFlags(const Value: TTaskDialogFlags);
    procedure SetMainIcon(const Value: TTaskDialogIcon);
    procedure SetRadioButtons(const Value: TTaskDialogButtons);
    procedure SetText(const Value: string);
    procedure SetTitle(const Value: string);
    procedure SetCustomFooterIcon(const Value: TIcon);
    procedure SetCustomMainIcon(const Value: TIcon);
  strict protected
    function DoExecute(ParentWnd: HWND): Boolean; dynamic;
    procedure DoOnButtonClicked(AModalResult: Integer; var CanClose: Boolean); dynamic;
    procedure DoOnDialogContructed; dynamic;
    procedure DoOnDialogCreated; dynamic;
    procedure DoOnDialogDestroyed; dynamic;
    procedure DoOnExpandButtonClicked(Expanded: Boolean); dynamic;
    procedure DoOnHelp; dynamic;
    procedure DoOnHyperlinkClicked(const AURL: string); dynamic;
    procedure DoOnNavigated; dynamic;
    procedure DoOnRadioButtonClicked(ButtonID: Integer); dynamic;
    procedure DoOnTimer(TickCount: Cardinal; var Reset: Boolean); dynamic;
    procedure DoOnVerificationClicked(Checked: Boolean); dynamic;
    procedure ShowHelpException(E: Exception); dynamic;
  protected
    function CallbackProc(hwnd: HWND; msg: UINT; wParam: WPARAM;
      lParam: LPARAM; lpRefData: LONG_PTR): HResult; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean; overload; dynamic;
    function Execute(ParentWnd: HWND): Boolean; overload; dynamic;
    property Button: TTaskDialogButtonItem read FButton write FButton;
    property Buttons: TTaskDialogButtons read FButtons write SetButtons;
    property Caption: string read FCaption write FCaption;
    property CommonButtons: TTaskDialogCommonButtons read FCommonButtons write FCommonButtons default [tcbOk, tcbCancel];
    property CustomFooterIcon: TIcon read FCustomFooterIcon write SetCustomFooterIcon;
    property CustomMainIcon: TIcon read FCustomMainIcon write SetCustomMainIcon;
    property DefaultButton: TTaskDialogCommonButton read FDefaultButton write FDefaultButton default tcbOk;
    property ExpandButtonCaption: string read FExpandButtonCaption write FExpandButtonCaption;
    property Expanded: Boolean read FExpanded;
    property ExpandedText: string read FExpandedText write SetExpandedText;
    property Flags: TTaskDialogFlags read FFlags write SetFlags default [tfAllowDialogCancellation];
    property FooterIcon: TTaskDialogIcon read FFooterIcon write SetFooterIcon default tdiNone;
    property FooterText: string read FFooterText write SetFooterText;
    property Handle: HWND read FHandle;
    property HelpContext: Integer read FHelpContext write FHelpContext default 0;
    property MainIcon: TTaskDialogIcon read FMainIcon write SetMainIcon default tdiInformation;
    property ModalResult: TModalResult read FModalResult write FModalResult;
    property ProgressBar: TTaskDialogProgressBar read FProgressBar write FProgressBar;
    property RadioButton: TTaskDialogRadioButtonItem read FRadioButton;
    property RadioButtons: TTaskDialogButtons read FRadioButtons write SetRadioButtons;
    property Text: string read FText write SetText;
    property Title: string read FTitle write SetTitle;
    property URL: string read FURL;
    property VerificationText: string read FVerificationText write FVerificationText;
    property OnButtonClicked: TTaskDlgClickEvent read FOnButtonClicked write FOnButtonClicked;
    property OnDialogConstructed: TNotifyEvent read FOnDialogConstructed write FOnDialogConstructed;
    property OnDialogCreated: TNotifyEvent read FOnDialogCreated write FOnDialogCreated;
    property OnDialogDestroyed: TNotifyEvent read FOnDialogDestroyed write FOnDialogDestroyed;
    property OnExpanded: TNotifyEvent read FOnExpanded write FOnExpanded;
    property OnHyperlinkClicked: TNotifyEvent read FOnHyperlinkClicked write FOnHyperlinkClicked;
    property OnNavigated: TNotifyEvent read FOnNavigated write FOnNavigated;
    property OnRadioButtonClicked: TNotifyEvent read FOnRadioButtonClicked write FOnRadioButtonClicked;
    property OnTimer: TTaskDlgTimerEvent read FOnTimer write FOnTimer;
    property OnVerificationClicked: TNotifyEvent read FOnVerificationClicked write FOnVerificationClicked;
  end;

  TTaskDialog = class(TCustomTaskDialog)
  published
    property Buttons;
    property Caption;
    property CommonButtons;
    property CustomFooterIcon;
    property CustomMainIcon;
    property DefaultButton;
    property ExpandButtonCaption;
    property ExpandedText;
    property Flags;
    property FooterIcon;
    property FooterText;
    property HelpContext;
    property MainIcon;
    property ProgressBar;
    property RadioButtons;
    property Text;
    property Title;
    property VerificationText;
    property OnButtonClicked;
    property OnDialogConstructed;
    property OnDialogCreated;
    property OnDialogDestroyed;
    property OnExpanded;
    property OnHyperlinkClicked;
    property OnNavigated;
    property OnRadioButtonClicked;
    property OnTimer;
    property OnVerificationClicked;
  end platform;

{ Message dialog }

type

  TMsgDlgType = System.UITypes.TMsgDlgType;
  {$NODEFINE TMsgDlgType}

  TMsgDlgBtn = System.UITypes.TMsgDlgBtn;
  {$NODEFINE TMsgDlgBtn}
  TMsgDlgButtons = System.UITypes.TMsgDlgButtons;
  {$NODEFINE TMsgDlgButtons}

  {$HPPEMIT OPENNAMESPACE}
  {$HPPEMIT 'using System::Uitypes::TMsgDlgBtn;'}
  {$HPPEMIT 'using System::Uitypes::TMsgDlgButtons;'}
  {$HPPEMIT 'using System::Uitypes::TMsgDlgType;'}
  {$HPPEMIT CLOSENAMESPACE}


const
  mbYesNo = [mbYes, mbNo];
  mbYesNoCancel = [mbYes, mbNo, mbCancel];
  mbYesAllNoAllCancel = [mbYes, mbYesToAll, mbNo, mbNoToAll, mbCancel];
  mbOKCancel = [mbOK, mbCancel];
  mbAbortRetryIgnore = [mbAbort, mbRetry, mbIgnore];
  mbAbortIgnore = [mbAbort, mbIgnore];

function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons): TForm; overload;
function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; DefaultButton: TMsgDlgBtn): TForm; overload;

function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer; overload; inline;
function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer; overload; inline;

function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): Integer; overload; inline;
function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  DefaultButton: TMsgDlgBtn): Integer; overload; inline;

function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer; overload;
function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string; DefaultButton: TMsgDlgBtn): Integer; overload;

{ TaskDialog based Message dialogs }

function TaskMessageDlg(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer; overload; inline;
function TaskMessageDlg(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer; overload; inline;

function TaskMessageDlgPos(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): Integer; overload; inline;
function TaskMessageDlgPos(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  DefaultButton: TMsgDlgBtn): Integer; overload; inline;

function TaskMessageDlgPosHelp(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer; overload;
function TaskMessageDlgPosHelp(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string; DefaultButton: TMsgDlgBtn): Integer; overload;

procedure ShowMessage(const Msg: string);
procedure ShowMessageFmt(const Msg: string; Params: array of const);
procedure ShowMessagePos(const Msg: string; X, Y: Integer);

type
  TInputCloseQueryEvent = procedure (Sender: TObject; const Values: array of string; var CanClose: Boolean) of object;
  TInputCloseQueryFunc = reference to function (const Values: array of string): Boolean;

{ Input dialog }

function InputBox(const ACaption, APrompt, ADefault: string): string;
function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; CloseQueryFunc: TInputCloseQueryFunc = nil): Boolean; overload;
function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; CloseQueryEvent: TInputCloseQueryEvent; Context: TObject = nil): Boolean; overload;
function InputQuery(const ACaption, APrompt: string; var Value: string): Boolean; overload;

function PromptForFileName(var AFileName: string; const AFilter: string = '';
  const ADefaultExt: string = ''; const ATitle: string = '';
  const AInitialDir: string = ''; SaveDialog: Boolean = False): Boolean;

{ Win98 and Win2k will default to the "My Documents" folder if the InitialDir
  property is empty and no files of the filtered type are contained in the
  current directory. Set this flag to True to force TOpenDialog and descendents
  to always open in the current directory when InitialDir is empty. (Same
  behavior as setting InitialDir to '.') }
var
  ForceCurrentDirectory: Boolean = False;
  UseLatestCommonDialogs: Boolean = True;

implementation

uses
{$IF DEFINED(CLR)}
  System.Runtime.InteropServices, System.Collections, System.Threading,
  System.Drawing.Printing, System.Security.Permissions, System.IO,
  Types,
{$ENDIF}
{$IF DEFINED(MSWINDOWS)}
  System.WideStrUtils, System.IOUtils,
{$ENDIF}
  System.Types,
  Winapi.UxTheme,
  Vcl.ExtCtrls, Vcl.Consts, Winapi.Dlgs, System.Math, Vcl.Themes, Winapi.ActiveX, System.StrUtils, Winapi.MultiMon, System.HelpIntfs;

{ Private globals }

var
  Comctl32FileVersion: Cardinal = Cardinal(-1);

{$IF NOT DEFINED(CLR)}
var
  CreationControl: TCommonDialog = nil;
  HelpMsg: Cardinal;
  FindMsg: Cardinal;
  WndProcPtrAtom: TAtom = 0;
{$ENDIF}

{$IF DEFINED(CLR)}
type
  TPath = Path;
{$ENDIF}

{ Helper function to determine owning window }

function ApplicationMainHandle: HWND; 
begin
  if Application.MainFormOnTaskBar and (Application.MainForm <> nil) then
    Result := Application.MainFormHandle
  else
    Result := Application.Handle;
end;

{ Center the given window on the screen }

procedure CenterWindow(Wnd: HWnd);
var
  Rect: TRect;
  Monitor: TMonitor;
begin
  GetWindowRect(Wnd, Rect);
  if Application.MainForm <> nil then
  begin
    if Assigned(Screen.ActiveForm) then
      Monitor := Screen.ActiveForm.Monitor
    else
      Monitor := Application.MainForm.Monitor;
  end
  else
    Monitor := Screen.PrimaryMonitor;
  SetWindowPos(Wnd, 0,
    Monitor.Left + ((Monitor.Width - Rect.Right + Rect.Left) div 2),
    Monitor.Top + ((Monitor.Height - Rect.Bottom + Rect.Top) div 3),
    0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;

{ Generic dialog hook. Centers the dialog on the screen in response to
  the WM_INITDIALOG message }

{$IF DEFINED(CLR)}
function TCommonDialog.DialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR;
begin
  Result := 0;
  if Msg = WM_INITDIALOG then
  begin
    CenterWindow(Wnd);
    FHandle := Wnd;
    FDefWndProc := SetWindowLong(Wnd, GWL_WNDPROC, FObjectInstance);
    CallWindowProc(FObjectInstance, Wnd, Msg, WParam, LParam);
  end;
end;
{$ELSE}
function DialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR; stdcall;
begin
  Result := 0;
  if Msg = WM_INITDIALOG then
  begin
    CenterWindow(Wnd);
    CreationControl.FHandle := Wnd;
    CreationControl.FDefWndProc := Pointer(SetWindowLong(Wnd, GWL_WNDPROC,
      IntPtr(CreationControl.FObjectInstance)));
    CallWindowProc(CreationControl.FObjectInstance, Wnd, Msg, WParam, LParam);
    CreationControl := nil;
  end;
end;
{$ENDIF}

{ TRedirectorWindow }
{ A redirector window is used to put the find/replace dialog into the
  ownership chain of a form, but intercept messages that CommDlg.dll sends
  exclusively to the find/replace dialog's owner.  TRedirectorWindow
  creates its hidden window handle as owned by the target form, and the
  find/replace dialog handle is created as owned by the redirector.  The
  redirector wndproc forwards all messages to the find/replace component.
}

type
  TRedirectorWindow = class(TWinControl)
  private
    FCommonDialog: TCommonDialog;
    FFormHandle: THandle;
    procedure CMRelease(var Message); message CM_Release;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WndProc(var Message: TMessage); override;
  end;

procedure TRedirectorWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := WS_VISIBLE or WS_POPUP;
    WndParent := FFormHandle;
  end;
end;

procedure TRedirectorWindow.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);
  with Message do
  begin
    if (Result = 0) and (Msg <> CM_RELEASE) and Assigned(FCommonDialog) then
      Result := LRESULT(FCommonDialog.MessageHook(Message));
    if (Result = 0) and (Msg = WM_SETFOCUS) and (FFormHandle <> 0) then
      Result := SendMessage(FFormHandle, WM_SETFOCUS, wParam, lParam);
  end;
end;

procedure TRedirectorWindow.CMRelease(var Message);
begin
  Free;
end;

{ TCommonDialog }

{$IF DEFINED(CLR)}
class constructor TCommonDialog.Create;
begin
  HelpMsg := RegisterWindowMessage(HelpMsgString);
end;
{$ENDIF}

constructor TCommonDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCtl3D := True;
{$IF DEFINED(CLR)}
  FDialogHookDelegate := @DialogHook;
{$ELSE}
  FObjectInstance := MakeObjectInstance(MainWndProc);
{$ENDIF}
end;

destructor TCommonDialog.Destroy;
begin
{$IF NOT DEFINED(CLR)}
  if FObjectInstance <> nil then FreeObjectInstance(FObjectInstance);
{$ENDIF}
  if Assigned(FRedirector) then
  begin
    TRedirectorWindow(FRedirector).FCommonDialog := nil;
    FreeAndNil(FRedirector);
  end;
  inherited Destroy;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TCommonDialog.Execute: Boolean;
var
  ParentWnd: HWND;
begin
  if Application.ModalPopupMode <> pmNone then
  begin
    ParentWnd := Application.ActiveFormHandle;
    if ParentWnd = 0 then
      ParentWnd := ApplicationMainHandle;
  end
  else
    ParentWnd := ApplicationMainHandle;
  Result := Execute(ParentWnd);
end;

function TCommonDialog.GetHandle: HWND;
begin
  Result := FHandle;
end;

function TCommonDialog.MessageHook(var Msg: TMessage): Boolean;
begin
  Result := False;
  if (Cardinal(Msg.Msg) = Cardinal(HelpMsg)) and (FHelpContext <> 0) then
  begin
    Application.HelpContext(FHelpContext);
    Result := True;
  end;
end;

[SecurityPermission(SecurityAction.InheritanceDemand, UnmanagedCode=True)]
procedure TCommonDialog.DefaultHandler(var Message);
begin
  if FHandle <> 0 then
{$IF DEFINED(CLR)}
    with UnwrapMessage(TObject(Message)) do
      Result := CallWindowProc(FDefWndProc, FHandle, Msg, WParam, LParam);
{$ELSE}
    with TMessage(Message) do
      Result := CallWindowProc(FDefWndProc, FHandle, Msg, WParam, LParam)
  else inherited DefaultHandler(Message);
{$ENDIF}
end;

procedure TCommonDialog.MainWndProc(var Message: TMessage);
begin
  try
    WndProc(Message);
  except
    Application.HandleException(Self);
  end;
end;

[SecurityPermission(SecurityAction.InheritanceDemand, UnmanagedCode=True)]
procedure TCommonDialog.WndProc(var Message: TMessage);
begin
  Dispatch(Message);
end;

procedure TCommonDialog.WMDestroy(var Message: TWMDestroy);
begin
  inherited;
  DoClose;
end;

procedure TCommonDialog.WMInitDialog(var Message: TWMInitDialog);
begin
  { Called only by non-explorer style dialogs }
  DoShow;
  { Prevent any further processing }
  Message.Result := 0;
end;

procedure TCommonDialog.WMNCDestroy(var Message: TWMNCDestroy);
begin
  inherited;
  FHandle := 0;
end;

{$IF DEFINED(CLR)}
function TCommonDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  Result := False;
end;
{$ENDIF}

{$IF DEFINED(CLR)}
function TCommonDialog.TaskModalDialog(DialogData: IntPtr): Bool;
{$ELSE}
function TCommonDialog.TaskModalDialog(DialogFunc: Pointer; var DialogData): Bool;
type
  TDialogFunc = function(var DialogData): Bool stdcall;
  TDialogStruct = record
    cbSize: Integer;
    hwndOwner: HWND;
  end;
{$ENDIF}
var
  ActiveWindow: HWnd;
  FocusState: TFocusState;
{$IF DEFINED(CLR)}
  WindowList: TObject;
{$ELSE}
  WindowList: Pointer;
{$IFDEF CPUX86}
  FPUControlWord: Word;
{$ENDIF}
{$ENDIF}
begin
  ActiveWindow := Application.ActiveFormHandle;
{$IF DEFINED(CLR)}
  WindowList := DisableTaskWindows(HWND(Marshal.ReadIntPtr(DialogData, Sizeof(Integer))));
{$ELSE}
  WindowList := DisableTaskWindows(TDialogStruct(DialogData).hwndOwner);
{$ENDIF}
  FocusState := SaveFocusState;
  try
{$IF DEFINED(CLR)}
    FObjectInstance := MakeObjectInstance(MainWndProc);
    try
      try
        Result := LaunchDialog(DialogData);
      finally
        FHandle := 0;
      end;
    finally
      FreeObjectInstance(FObjectInstance);
      FObjectInstance := nil;
    end;
{$ELSE}
{$IFDEF CPUX86}
    asm
      // Avoid FPU control word change in NETRAP.dll, NETAPI32.dll, etc
      FNSTCW  FPUControlWord
    end;
{$ENDIF}
    try
      CreationControl := Self;
      Result := TDialogFunc(DialogFunc)(DialogData);
    finally
{$IFDEF CPUX86}
      asm
        FNCLEX
        FLDCW FPUControlWord
      end;
{$ENDIF}
    end;
{$ENDIF}
  finally
    EnableTaskWindows(WindowList);
    SetActiveWindow(ActiveWindow);
    RestoreFocusState(FocusState);
    FreeAndNil(FRedirector);
  end;
end;

procedure TCommonDialog.DoClose;
begin
  if Assigned(FOnClose) then FOnClose(Self);
end;

procedure TCommonDialog.DoShow;
begin
  if Assigned(FOnShow) then FOnShow(Self);
end;

{ Vista support }

type
  TFileDialogWrapper = class(TObject)
  private
    procedure AssignFileTypes;
    procedure AssignOptions;
    function GetFileName: TFileName;
    function GetHandle: HWND;
    procedure HandleShareViolation(Sender: TObject;
      var Response: TFileDialogShareViolationResponse);
    procedure OnFileOkEvent(Sender: TObject; var CanClose: Boolean);
    procedure OnFolderChangeEvent(Sender: TObject);
    procedure OnSelectionChangeEvent(Sender: TObject);
    procedure OnTypeChangeEvent(Sender: TObject);
  protected
    FFileDialog: TCustomFileDialog;
    FOpenDialog: TOpenDialog;
    function CreateFileDialog: TCustomFileDialog; virtual; abstract;
  public
    constructor Create(OpenDialog: TOpenDialog);
    destructor Destroy; override;
    function Execute(ParentWnd: HWND): Boolean;
    property FileName: TFileName read GetFileName;
    property Handle: HWND read GetHandle;
  end;

  TFileOpenDialogWrapper = class(TFileDialogWrapper)
  private
    procedure OnExecuteEvent(Sender: TObject);
  protected
    function CreateFileDialog: TCustomFileDialog; override;
  end;

  TFileSaveDialogWrapper = class(TFileDialogWrapper)
  protected
    function CreateFileDialog: TCustomFileDialog; override;
  end;

{ TFileDialogWrapper }

constructor TFileDialogWrapper.Create(OpenDialog: TOpenDialog);
begin
  inherited Create;
  FOpenDialog := OpenDialog;
  FFileDialog := CreateFileDialog;
end;

destructor TFileDialogWrapper.Destroy;
begin
  FFileDialog.Free;
  inherited;
end;

procedure TFileDialogWrapper.AssignFileTypes;
var
  I, J: Integer;
  FilterStr: string;
begin
  FilterStr := FOpenDialog.Filter;
  J := 1;
  I := AnsiPos('|', FilterStr);
  while I <> 0 do
    with FFileDialog.Filetypes.Add do
    begin
      DisplayName := Copy(FilterStr, J, I - J);
      if not SysLocale.FarEast then
        J := PosEx('|', FilterStr, I + 1)
      else
      begin
        J := AnsiPos('|', Copy(FilterStr, I + 1, MAXINT));
        if J <> 0 then
          J := J + (I + 1) - 1;
      end;
      if J = 0 then
        J := Length(FilterStr) + 1;
      FileMask := Copy(FilterStr, I + 1, J - I - 1);
      Inc(J);

      if not SysLocale.FarEast then
        I := PosEx('|', FilterStr, J)
      else
      begin
        I := AnsiPos('|', Copy(FilterStr, J, MAXINT));
        if I <> 0 then
          I := I + J - 1
        else if J < Length(FilterStr) then
          I := Length(FilterStr) + 1;
      end;
    end;
end;

procedure TFileDialogWrapper.AssignOptions;
const
  CDialogOptionsMap: array[TOpenOption] of TFileDialogOptions = (
    [] {ofReadOnly}, [fdoOverWritePrompt], [] {ofHideReadOnly},
    [fdoNoChangeDir], [] {ofShowHelp}, [fdoNoValidate], [fdoAllowMultiSelect],
    [fdoStrictFileTypes], [fdoPathMustExist], [fdoFileMustExist],
    [fdoCreatePrompt], [fdoShareAware], [fdoNoReadOnlyReturn],
    [fdoNoTestFileCreate], [] {ofNoNetworkButton}, [] {ofNoLongNames},
    [] {ofOldStyleDialog}, [fdoNoDereferenceLinks], [] {ofEnableIncludeNotify},
    [] {ofEnableSizing}, [fdoDontAddToRecent], [fdoForceShowHidden]);
var
  LOption: TOpenOption;
begin
  for LOption := Low(LOption) to High(LOption) do
    if LOption in FOpenDialog.Options then
      FFileDialog.Options := FFileDialog.Options + CDialogOptionsMap[LOption];
  if ofExNoPlacesBar in FOpenDialog.OptionsEx then
    FFileDialog.Options := FFileDialog.Options + [fdoHidePinnedPlaces];
end;

function TFileDialogWrapper.Execute(ParentWnd: HWND): Boolean;
begin
  FFileDialog.DefaultExtension := FOpenDialog.DefaultExt;
  FFileDialog.DefaultFolder := FOpenDialog.InitialDir;
  FFileDialog.FileName := FOpenDialog.FileName;
  FFileDialog.FileTypeIndex := FOpenDialog.FilterIndex;
  FFileDialog.Title := FOpenDialog.Title;
  if Assigned(FOpenDialog.OnCanClose) then
    FFileDialog.OnFileOkClick := OnFileOkEvent;
  if Assigned(FOpenDialog.OnFolderChange) then
    FFileDialog.OnFolderChange := OnFolderChangeEvent;
  if Assigned(FOpenDialog.OnSelectionChange) then
    FFileDialog.OnSelectionChange := OnSelectionChangeEvent;
  if Assigned(FOpenDialog.OnTypeChange) then
    FFileDialog.OnTypeChange := OnTypeChangeEvent;
  // TOpenDialog/TSaveDialog ignore sharing violations when ofShareAware
  // is set. Assign an event handler to mimic that behavior.
  if ofShareAware in FOpenDialog.Options then
    FFileDialog.OnShareViolation := HandleShareViolation;
  AssignFileTypes;
  AssignOptions;

  // Set FInternalWrapper after initialization to make sure correct properties
  // are read from FOpenDialog.
  FOpenDialog.FInternalWrapper := Self;
  try
    Result := FFileDialog.Execute(ParentWnd);
  finally
    FOpenDialog.FInternalWrapper := nil;
  end;
  if Result then
  begin
    FOpenDialog.FileName := FFileDialog.FileName;
    FOpenDialog.Files.Assign(FFileDialog.Files);
    FOpenDialog.FilterIndex := FFileDialog.FileTypeIndex;
  end;
end;

function TFileDialogWrapper.GetFileName: TFileName;
begin
  Result := FFileDialog.FileName;
end;

function TFileDialogWrapper.GetHandle: HWND;
begin
  Result := FFileDialog.Handle;
end;

procedure TFileDialogWrapper.HandleShareViolation(Sender: TObject;
  var Response: TFileDialogShareViolationResponse);
begin
  Response := fsrAccept;
end;

procedure TFileDialogWrapper.OnFileOkEvent(Sender: TObject; var CanClose: Boolean);
begin
  with FOpenDialog do
  begin
    FileName := FFileDialog.FileName;
    Files.Assign(FFileDialog.Files);
  end;
  FOpenDialog.OnCanClose(FOpenDialog, CanClose);
end;

procedure TFileDialogWrapper.OnFolderChangeEvent(Sender: TObject);
begin
  with FOpenDialog do
  begin
    FileName := FFileDialog.FileName;
    OnFolderChange(FOpenDialog);
  end;
end;

procedure TFileDialogWrapper.OnSelectionChangeEvent(Sender: TObject);
begin
  with FOpenDialog do
  begin
    FileName := FFileDialog.FileName;
    Files.Assign(FFileDialog.Files);
    OnSelectionChange(FOpenDialog);
  end;
end;

procedure TFileDialogWrapper.OnTypeChangeEvent(Sender: TObject);
begin
  with FOpenDialog do
  begin
    FilterIndex := FFileDialog.FileTypeIndex;
    OnTypeChange(FOpenDialog);
  end;
end;

{ TFileOpenDialogWrapper }

function TFileOpenDialogWrapper.CreateFileDialog: TCustomFileDialog;
begin
  Result := TFileOpenDialog.Create(nil);
  Result.OnExecute := OnExecuteEvent;
end;

procedure TFileOpenDialogWrapper.OnExecuteEvent(Sender: TObject);
var
  LOptions: Cardinal;
begin
  if FOpenDialog.ClassName = 'TOpenPictureDialog' then // do not localize
  begin
    FFileDialog.Dialog.GetOptions(LOptions);
    LOptions := LOptions or FOS_FORCEPREVIEWPANEON;
    FFileDialog.Dialog.SetOptions(LOptions);
  end;
end;

{ TFileSaveDialogWrapper }

function TFileSaveDialogWrapper.CreateFileDialog: TCustomFileDialog;
begin
  Result := TFileSaveDialog.Create(nil);
end;

{ Open and Save dialog routines }

{$IF DEFINED(CLR)}
function TOpenDialog.ExplorerHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR;
var
  Hdr: TNMHdr;
begin
  Result := 0;
  if Msg = WM_INITDIALOG then
  begin
    FHandle := Wnd;
    FDefWndProc := SetWindowLong(Wnd, GWL_WNDPROC, FObjectInstance);
    CallWindowProc(FObjectInstance, Wnd, Msg, WParam, LParam);
  end
  else if (Msg = WM_NOTIFY) then
  begin
    Hdr := TNMHdr(Marshal.PtrToStructure(IntPtr(LParam), TypeOf(TNMHdr)));
    if Hdr.code = CDN_INITDONE then
      CenterWindow(GetWindowLong(Wnd, GWL_HWNDPARENT));
  end;
end;
{$ELSE}
function ExplorerHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR; stdcall;
begin
  Result := 0;
  if Msg = WM_INITDIALOG then
  begin
    CreationControl.FHandle := Wnd;
    CreationControl.FDefWndProc := Pointer(SetWindowLong(Wnd, GWL_WNDPROC,
      IntPtr(CreationControl.FObjectInstance)));
    CallWindowProc(CreationControl.FObjectInstance, Wnd, Msg, WParam, LParam);
    CreationControl := nil;
  end
  else if (Msg = WM_NOTIFY) then
  if (POFNotify(LParam)^.hdr.code = CDN_INITDONE) then
    CenterWindow(GetWindowLong(Wnd, GWL_HWNDPARENT));
end;
{$ENDIF}

{ TOpenDialog }

constructor TOpenDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHistoryList := TStringList.Create;
  FOptions := [ofHideReadOnly, ofEnableSizing];
  FOptionsEx := [];
  FFiles := TStringList.Create;
  FFilterIndex := 1;
  FFileEditStyle := fsEdit;
  FInternalWrapper := nil;
{$IF DEFINED(CLR)}
  FExplorerHookDelegate := @ExplorerHook;
{$ENDIF}
end;

destructor TOpenDialog.Destroy;
begin
  FFiles.Free;
  FHistoryList.Free;
  inherited Destroy;
end;

function TOpenDialog.CanClose(var OpenFileName: TOpenFileName): Boolean;
begin
  GetFileNames(OpenFileName);
  Result := DoCanClose;
  FFiles.Clear;
end;

procedure TOpenDialog.WndProc(var Message: TMessage);
var
  Index: Integer;
  Include: Boolean;
{$IF DEFINED(CLR)}
  LOFNotify: TOFNotify;
  LOFNotifyEx: TOFNotifyEx;
  LOpenFileName: TOpenFileName;
{$ELSE}
  LOFNotify: POFNotify;
  LOFNotifyEx: POFNotifyEx;
  LOpenFileName: POpenFileName;
{$ENDIF}
begin
  Message.Result := 0;
  { If not ofOldStyleDialog then DoShow on CDN_INITDONE, not WM_INITDIALOG }
  if (Message.Msg = WM_INITDIALOG) and not (ofOldStyleDialog in Options) then Exit
  else if (Message.Msg = WM_NOTIFY) then
  begin
{$IF DEFINED(CLR)}
    LOFNotify := TOFNotify(Marshal.PtrToStructure(IntPtr(Message.lParam), TypeOf(TOFNotify)));
{$ELSE}
    LOFNotify := POFNotify(Message.LParam);
{$ENDIF}
    case (LOFNotify.hdr.code) of
      CDN_FILEOK:
        begin
{$IF DEFINED(CLR)}
          LOpenFileName := TOpenFileName(Marshal.PtrToStructure(IntPtr(LOFNotify.lpOFN),
            TypeOf(TOpenFileName)));
{$ELSE}
          LOpenFileName := LOFNotify^.lpOFN;
{$ENDIF}
          if not CanClose(LOpenFileName{$IFNDEF CLR}^{$ENDIF}) then
          begin
            Message.Result := 1;
            SetWindowLong(Handle, DWL_MSGRESULT, Message.Result);
            Exit;
          end;
        end;
      CDN_INITDONE: DoShow;
      CDN_SELCHANGE: DoSelectionChange;
      CDN_FOLDERCHANGE: DoFolderChange;
      CDN_TYPECHANGE:
        begin
{$IF DEFINED(CLR)}
          LOpenFileName := TOpenFileName(Marshal.PtrToStructure(IntPtr(LOFNotify.lpOFN),
            TypeOf(TOpenFileName)));
{$ELSE}
          LOpenFileName := LOFNotify^.lpOFN;
{$ENDIF}
          Index := LOpenFileName.nFilterIndex;
          if Index <> FCurrentFilterIndex then
          begin
            FCurrentFilterIndex := Index;
            DoTypeChange;
          end;
        end;
      CDN_INCLUDEITEM:
        if Message.LParam <> 0 then
        begin
{$IF DEFINED(CLR)}
          LOFNotifyEx := TOFNotifyEx(Marshal.PtrToStructure(IntPtr(Message.LParam),
            TypeOf(TOFNotifyEx)));
{$ELSE}
          LOFNotifyEx := POFNotifyEx(Message.LParam);
{$ENDIF}
          Include := True;
          DoIncludeItem(TOFNotifyEx(LOFNotifyEx{$IFNDEF CLR}^{$ENDIF}), Include);
          Message.Result := Byte(Include);
        end;
    end;
  end;
  inherited WndProc(Message);
end;

function TOpenDialog.DoCanClose: Boolean;
begin
  Result := True;
  if Assigned(FOnCanClose) then FOnCanClose(Self, Result);
end;

procedure TOpenDialog.DoSelectionChange;
begin
  if Assigned(FOnSelectionChange) then FOnSelectionChange(Self);
end;

procedure TOpenDialog.DoFolderChange;
begin
  if Assigned(FOnFolderChange) then FOnFolderChange(Self);
end;

procedure TOpenDialog.DoTypeChange;
begin
  if Assigned(FOnTypeChange) then FOnTypeChange(Self);
end;

procedure TOpenDialog.ReadFileEditStyle(Reader: TReader);
begin
  { Ignore FileEditStyle }
  Reader.ReadIdent;
end;

procedure TOpenDialog.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('FileEditStyle', ReadFileEditStyle, nil, False);
end;

{$IF DEFINED(CLR)}
function TOpenDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  Result := GetOpenFileName(DialogData);
end;
{$ENDIF}

procedure TOpenDialog.GetFileNames(var OpenFileName: TOpenFileName);
var
  Separator: Char;

{$IF DEFINED(CLR)}
  function ExtractFileName(Str: IntPtr; Idx, MaxPos: Integer; var Name: TFileName): Integer;
  var
    C: Char;
  begin
    Name := '';
    Result := Idx;
    while Result < MaxPos do
    begin
      if Marshal.SystemDefaultCharSize = 1 then
        C := Char(Marshal.ReadByte(Str, Result))
      else
        C := Char(Marshal.ReadInt16(Str, Result));
      if (C = Separator) or (C = #0) then // the end of this string
      begin
        if Result = Idx then
          Result := MaxPos
        else
          Inc(Result, Marshal.SystemDefaultCharSize);
        Exit;
      end;
      Name := Name + C;
      Inc(Result, Marshal.SystemDefaultCharSize);
    end;
  end;
{$ELSE}
  function ExtractFileName(P: PChar; var S: TFilename): PChar;
  begin
    Result := AnsiStrScan(P, Separator);
    if Result = nil then
    begin
      S := P;
      Result := StrEnd(P);
    end
    else
    begin
      SetString(S, P, Result - P);
      Inc(Result);
    end;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
  procedure ExtractFileNames(buffer: IntPtr; maxLen: Integer);
  var
    DirName, FileName: TFileName;
    Pos: Integer;
  begin
    Pos := 0;
    Pos := ExtractFileName(buffer, Pos, maxLen, DirName);
    Pos := ExtractFileName(buffer, Pos, maxLen, FileName);
    if FileName = '' then
      FFiles.Add(DirName)
    else
    begin
      if DirName[Length(DirName)] <> '\' then
        DirName := DirName + '\';
      repeat
        if (FileName[1] <> '\') and ((Length(FileName) <= 3) or
          (FileName[2] <> ':') or (FileName[3] <> '\')) then
          FileName := DirName + FileName;
        FFiles.Add(FileName);
        Pos := ExtractFileName(buffer, Pos, maxLen, FileName);
      until FileName = '';
    end;
  end;
{$ELSE}
  procedure ExtractFileNames(P: PChar);
  var
    DirName, FileName: TFilename;
  begin
    P := ExtractFileName(P, DirName);
    P := ExtractFileName(P, FileName);
    if FileName = '' then
      FFiles.Add(DirName)
    else
    begin
      if AnsiLastChar(DirName)^ <> '\' then
        DirName := DirName + '\';
      repeat
        if (FileName[1] <> '\') and ((Length(FileName) <= 3) or
          (FileName[2] <> ':') or (FileName[3] <> '\')) then
          FileName := DirName + FileName;
        FFiles.Add(FileName);
        P := ExtractFileName(P, FileName);
      until FileName = '';
    end;
  end;
{$ENDIF}

begin
  Separator := #0;
  if (ofAllowMultiSelect in FOptions) and
    ((ofOldStyleDialog in FOptions) or not NewStyleControls) then
    Separator := ' ';
  with OpenFileName do
  begin
    if ofAllowMultiSelect in FOptions then
    begin
{$IF DEFINED(CLR)}
      ExtractFileNames(lpstrFile, nMaxFile);
{$ELSE}
      ExtractFileNames(lpstrFile);
{$ENDIF}
      FFileName := FFiles[0];
    end else
    begin
{$IF DEFINED(CLR)}
      FFileName := Marshal.PtrToStringAuto(lpstrFile);
{$ELSE}
      ExtractFileName(lpstrFile, FFileName);
{$ENDIF}
      FFiles.Add(FFileName);
    end;
  end;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TOpenDialog.GetFiles: TStrings;
begin
  Result := FFiles;
end;

function TOpenDialog.GetStaticRect: TRect;
begin
  if FHandle <> 0 then
  begin
    if not (ofOldStyleDialog in Options) then
    begin
      GetWindowRect(GetDlgItem(FHandle, stc32), Result);
      MapWindowPoints(0, FHandle, Result, 2);
    end
    else GetClientRect(FHandle, Result)
  end
  else Result := Rect(0,0,0,0);
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TOpenDialog.GetFileName: TFileName;
{$IF DEFINED(CLR)}
var
  S: String;
  P: Integer;
begin
  if NewStyleControls and (FHandle <> 0) then
  begin
    SendGetTextMessage(GetParent(FHandle), CDM_GETFILEPATH, MAX_PATH, S, MAX_PATH, False);
    P := Pos(#0, S);
    if P > 0 then
      Result := Copy(S, 1, P - 1)
    else
      Result := S;
  end
  else
    Result := FFileName;
end;
{$ELSE}
var
  Path: array[0..MAX_PATH] of Char;
begin
  if FInternalWrapper <> nil then
    Result := TFileDialogWrapper(FInternalWrapper).FileName
  else if NewStyleControls and (FHandle <> 0) then
  begin
    SendMessage(GetParent(FHandle), CDM_GETFILEPATH, Length(Path), LPARAM(@Path));
    Result := StrPas(Path);
  end
  else Result := FFileName;
end;
{$ENDIF}

function TOpenDialog.GetFilterIndex: Integer;
begin
  if FHandle <> 0 then
    Result := FCurrentFilterIndex
  else
    Result := FFilterIndex;
end;

function TOpenDialog.GetHandle: HWND;
begin
  if FInternalWrapper <> nil then
    Result := TFileDialogWrapper(FInternalWrapper).Handle
  else
    Result := inherited GetHandle;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TOpenDialog.GetInitialDir: string;
begin
  Result := FInitialDir;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
procedure TOpenDialog.SetFileName(Value: TFileName);
begin
  if Value <> FFileName then
    FFileName := Value;
end;

procedure TOpenDialog.SetHistoryList(Value: TStrings);
begin
  FHistoryList.Assign(Value);
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
procedure TOpenDialog.SetInitialDir(const Value: string);
var
  L: Integer;
begin
  L := Length(Value);
  if (L > 1) and IsPathDelimiter(Value, L)
    and not IsDelimiter(':', Value, L - 1) then Dec(L);
  FInitialDir := Copy(Value, 1, L);
end;

{$IFDEF LINUX}
function DRIVE_GetRoot(Drive: Integer): PChar; cdecl; external 'libwine.borland.so' name 'DRIVE_GetRoot';

function FixFileName(const FileName: string): string;
var
  Root: string;
  I: Integer;
begin
  if (Length(FileName) > 2) and (FileName[2] = ':') then
  begin
    Result := Copy(FileName, 3, MaxInt);
    Root := DRIVE_GetRoot(Ord(UpCase(FileName[1])) - Ord('A'));
    if IsPathDelimiter(Root, Length(Root)) then
      Delete(Root, Length(Root) - 1, 1);
    Result := Root + PathDelim + Result;
  end else Result := FileName;
  for I := 1 to Length(Result) do
    if Result[I] = '\' then Result[I] := PathDelim;
end;
{$ENDIF}
{$IFDEF WIN32}
function FixFileName(const FileName: string): string;
begin
  Result := FileName;
end;
{$ENDIF}

{$IF NOT DEFINED(CLR)}
function TOpenDialog.DoExecute(Func: Pointer): Bool;
var
  ParentWnd: HWND;
begin
  if Application.ModalPopupMode <> pmNone then
  begin
    ParentWnd := Application.ActiveFormHandle;
    if ParentWnd = 0 then
      ParentWnd := ApplicationMainHandle;
  end
  else
    ParentWnd := ApplicationMainHandle;
  Result := DoExecute(Func, ParentWnd);
end;
{$ENDIF}

{$IF NOT DEFINED(CLR)}
function TOpenDialog.Execute(ParentWnd: HWND): Boolean;
begin
  Result := DoExecute(@GetOpenFileName, ParentWnd);
end;
{$ENDIF}

function IsNewCommonCtrl: Boolean; inline;
const
  ComCtlVersionIE6 = $00060000;
begin
  if Comctl32FileVersion = Cardinal(-1) then
    Comctl32FileVersion := GetFileVersion(comctl32);
  Result := Comctl32FileVersion >= ComCtlVersionIE6;
end;

                                                 
{$IF DEFINED(CLR)}
[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TOpenDialog.Execute(ParentWnd: HWND): Boolean;
const
  MultiSelectBufferSize = High(Word) - 16;
  OpenOptions: array [TOpenOption] of DWORD = (
    OFN_READONLY, OFN_OVERWRITEPROMPT, OFN_HIDEREADONLY,
    OFN_NOCHANGEDIR, OFN_SHOWHELP, OFN_NOVALIDATE, OFN_ALLOWMULTISELECT,
    OFN_EXTENSIONDIFFERENT, OFN_PATHMUSTEXIST, OFN_FILEMUSTEXIST,
    OFN_CREATEPROMPT, OFN_SHAREAWARE, OFN_NOREADONLYRETURN,
    OFN_NOTESTFILECREATE, OFN_NONETWORKBUTTON, OFN_NOLONGNAMES,
    OFN_EXPLORER, OFN_NODEREFERENCELINKS, OFN_ENABLEINCLUDENOTIFY,
    OFN_ENABLESIZING, OFN_DONTADDTORECENT, OFN_FORCESHOWHIDDEN);
  OpenOptionsEx: array [TOpenOptionEx] of DWORD = (OFN_EX_NOPLACESBAR);
var
  Option: TOpenOption;
  OptionEx: TOpenOptionEx;
  OpenFilename: TOpenFilename;

  function AllocFilterStr(const S: string): string;
  var
    SepPos: Integer;
  begin
    Result := '';
    if S <> '' then
    begin
      Result := S + #0;  // double null terminators
      SepPos := Pos('|', Result) - 1;
      while SepPos >= 0 do
      begin
        Result[SepPos + 1] := #0; // adjust because OP strings are 1-offset
        Inc(SepPos);
        SepPos := PosEx('|', Result, SepPos + 1) - 1;
      end;
    end;
    Result := Result + #0; // add final null terminator
  end;

var
  TempFilter, TempExt: string;
  TempFilename: TBytes;
  Mem: IntPtr;
  I: Integer;
  FileDialogWrapper: TFileDialogWrapper;
begin
  if (Win32MajorVersion >= 6) and UseLatestCommonDialogs and
     not (TStyleManager.IsCustomStyleActive and (shDialogs in TStyleManager.SystemHooks)) and
     IsNewCommonCtrl and (Template = '') and IsAppThemed and
     not (Assigned(FOnIncludeItem) or Assigned(FOnClose) or Assigned(FOnShow)) then
  begin
    // This requires Windows Vista or later
                                                                                        
    if ClassName <> 'TSavePictureDialog' then // Do not localize
      FileDialogWrapper := TFileOpenDialogWrapper.Create(Self)
    else
      FileDialogWrapper := TFileSaveDialogWrapper.Create(Self);
    try
      Result := FileDialogWrapper.Execute(ParentWnd);
    finally
      FileDialogWrapper.Free;
    end;
    Exit;
  end;

  CheckThreadingModel(System.Threading.ApartmentState.STA);
  FFiles.Clear;
  with OpenFilename do
  begin
    if (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) or { Win2k }
    ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and (Win32MajorVersion >= 4) and (Win32MinorVersion >= 90)) then { WinME }
    begin
      lStructSize := Marshal.SizeOf(TypeOf(TOpenFilename));
      pvReserved := nil;
      dwReserved := 0;
    end
    else
      lStructSize := Marshal.SizeOf(TypeOf(TOpenFilename)) -
        (SizeOf(DWORD) shl 1) - SizeOf(IntPtr); { subtract size of added fields }
    hInstance := WinUtils.HInstance;
    TempFilter := AllocFilterStr(FFilter);
    lpstrFilter := TempFilter;
    lpstrCustomFilter := nil;
    nFilterIndex := FFilterIndex;
    FCurrentFilterIndex := FFilterIndex;
    lpstrFileTitle := nil;
    nMaxFileTitle := 0;
    if (FInitialDir = '') and ForceCurrentDirectory then
      lpstrInitialDir := '.'
    else
      lpstrInitialDir := FInitialDir;
    lpstrTitle := FTitle;
    Flags := OFN_ENABLEHOOK;
    FlagsEx := 0;

    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or OpenOptions[Option];
    if NewStyleControls then
    begin
      Flags := Flags xor OFN_EXPLORER;
      if (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) or { Win2k }
      ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and (Win32MajorVersion >= 4) and (Win32MinorVersion >= 90)) then { WinME }
        for OptionEx := Low(OptionEx) to High(OptionEx) do
          if OptionEx in FOptionsEx then
            FlagsEx := FlagsEx or OpenOptionsEx[OptionEx];
    end
    else
      Flags := Flags and not OFN_EXPLORER;
    nFileOffset := 0;
    nFileExtension := 0;
    lCustData := 0;
    TempExt := FDefaultExt;
    if (TempExt = '') and (Flags and OFN_EXPLORER = 0) then
    begin
      TempExt := ExtractFileExt(FFilename);
      Delete(TempExt, 1, 1);
    end;
    if TempExt <> '' then
      lpstrDefExt := TempExt
    else
      lpstrDefExt := '';
    if (ofOldStyleDialog in Options) or not NewStyleControls then
      lpfnHook := FDialogHookDelegate
    else
      lpfnHook := FExplorerHookDelegate;
    if Length(Template) > 0 then
    begin
      Flags := Flags or OFN_ENABLETEMPLATE;
      lpTemplateName := Template;
      if FTemplateModule <> 0 then
        hInstance := FTemplateModule;
    end;
    if Application.ModalPopupMode <> pmNone then
    begin
      FRedirector := TRedirectorWindow.Create(nil);
      with TRedirectorWindow(FRedirector) do
      begin
        FCommonDialog := Self;
        FFormHandle := ParentWnd;
      end;
      hWndOwner := FRedirector.Handle;
    end
    else
      hWndOwner := Application.Handle;
    if ofAllowMultiSelect in FOptions then
      nMaxFile := MultiSelectBufferSize else
      nMaxFile := MAX_PATH;
    TempFileName := PlatformBytesOf(FFileName);
  end;
  Mem := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TOpenFilename)));
  try
    OpenFileName.lpstrFile := Marshal.AllocHGlobal(Integer(OpenFileName.nMaxFile + 1) * Marshal.SystemDefaultCharSize);
    try
      Marshal.Copy(TempFileName, 0, OpenFileName.lpstrFile, Length(TempFileName));
      for I := Length(TempFileName) to OpenFileName.nMaxFile * Cardinal(Marshal.SystemDefaultCharSize) do
        Marshal.WriteByte(OpenFileName.lpstrFile, I, 0);
      Marshal.StructureToPtr(TObject(OpenFileName), Mem, False);
      Result := TaskModalDialog(Mem);
      if Result then
      begin
        OpenFileName := TOpenFilename(Marshal.PtrToStructure(Mem,
          TypeOf(TOpenFilename)));
        GetFileNames(OpenFilename);
        if (OpenFileName.Flags and OFN_EXTENSIONDIFFERENT) <> 0 then
          Include(FOptions, ofExtensionDifferent) else
          Exclude(FOptions, ofExtensionDifferent);
        if (OpenFileName.Flags and OFN_READONLY) <> 0 then
          Include(FOptions, ofReadOnly) else
          Exclude(FOptions, ofReadOnly);
        FFilterIndex := OpenFileName.nFilterIndex;
      end;
    finally
      Marshal.FreeHGlobal(OpenFileName.lpstrFile);
    end;
  finally
    // just in case....
    Marshal.WriteInt32(Mem,
      Integer(Marshal.OffsetOf(TypeOf(TOpenFilename), 'lpstrFile')), 0);
    Marshal.DestroyStructure(Mem, TypeOf(TOpenFilename));
    Marshal.FreeHGlobal(Mem);
  end;
end;
{$ELSE}
function TOpenDialog.DoExecute(Func: Pointer; ParentWnd: HWND): Bool;
const
  MultiSelectBufferSize = High(Word) - 16;
  OpenOptions: array [TOpenOption] of DWORD = (
    OFN_READONLY, OFN_OVERWRITEPROMPT, OFN_HIDEREADONLY,
    OFN_NOCHANGEDIR, OFN_SHOWHELP, OFN_NOVALIDATE, OFN_ALLOWMULTISELECT,
    OFN_EXTENSIONDIFFERENT, OFN_PATHMUSTEXIST, OFN_FILEMUSTEXIST,
    OFN_CREATEPROMPT, OFN_SHAREAWARE, OFN_NOREADONLYRETURN,
    OFN_NOTESTFILECREATE, OFN_NONETWORKBUTTON, OFN_NOLONGNAMES,
    OFN_EXPLORER, OFN_NODEREFERENCELINKS, OFN_ENABLEINCLUDENOTIFY,
    OFN_ENABLESIZING, OFN_DONTADDTORECENT, OFN_FORCESHOWHIDDEN);

  OpenOptionsEx: array [TOpenOptionEx] of DWORD = (OFN_EX_NOPLACESBAR);
var
  Option: TOpenOption;
  OptionEx: TOpenOptionEx;
  OpenFilename: TOpenFilename;

  function AllocFilterStr(const S: string): string;
  var
    P: PChar;
  begin
    Result := '';
    if S <> '' then
    begin
      Result := S + #0;  // double null terminators
      P := AnsiStrScan(PChar(Result), '|');
      while P <> nil do
      begin
        P^ := #0;
        Inc(P);
        P := AnsiStrScan(P, '|');
      end;
    end;
  end;

var
  FileDialogWrapper: TFileDialogWrapper;
  TempFilter, TempFilename, TempExt: string;
begin
  if (Win32MajorVersion >= 6) and UseLatestCommonDialogs and
     not (TStyleManager.IsCustomStyleActive and (shDialogs in TStyleManager.SystemHooks)) and
     IsNewCommonCtrl and (Template = nil) and IsAppThemed and
     not (Assigned(FOnIncludeItem) or Assigned(FOnClose) or Assigned(FOnShow)) then
  begin
    // This requires Windows Vista or later
    if Func = @GetOpenFileName then
      FileDialogWrapper := TFileOpenDialogWrapper.Create(Self)
    else
      FileDialogWrapper := TFileSaveDialogWrapper.Create(Self);

    try
      Result := FileDialogWrapper.Execute(ParentWnd);
    finally
      FileDialogWrapper.Free;
    end;
    Exit;
  end;

  FFiles.Clear;
  FillChar(OpenFileName, SizeOf(OpenFileName), 0);
  with OpenFilename do
  begin
    if (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) or { Win2k }
    ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and (Win32MajorVersion >= 4) and (Win32MinorVersion >= 90)) then { WinME }
      lStructSize := SizeOf(TOpenFilename)
    else
      lStructSize := SizeOf(TOpenFilename) - (SizeOf(DWORD) shl 1) - SizeOf(Pointer); { subtract size of added fields }

    hInstance := SysInit.HInstance;
    TempFilter := AllocFilterStr(FFilter);
    lpstrFilter := PChar(TempFilter);
    nFilterIndex := FFilterIndex;
    FCurrentFilterIndex := FFilterIndex;
    if ofAllowMultiSelect in FOptions then
      nMaxFile := MultiSelectBufferSize else
      nMaxFile := MAX_PATH;
    SetLength(TempFilename, nMaxFile + 2);
    lpstrFile := PChar(TempFilename);
    FillChar(lpstrFile^, (nMaxFile + 2) * SizeOf(Char), 0);
    StrLCopy(lpstrFile, PChar(FFileName), nMaxFile);
    if (FInitialDir = '') and ForceCurrentDirectory then
      lpstrInitialDir := '.'
    else
      lpstrInitialDir := PChar(FInitialDir);
    lpstrTitle := PChar(FTitle);
    Flags := OFN_ENABLEHOOK;
    FlagsEx := 0;

    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or OpenOptions[Option];
    if NewStyleControls then
    begin
      Flags := Flags xor OFN_EXPLORER;
      if (Win32MajorVersion >= 5) and (Win32Platform = VER_PLATFORM_WIN32_NT) or { Win2k }
      ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and (Win32MajorVersion >= 4) and (Win32MinorVersion >= 90)) then { WinME }
        for OptionEx := Low(OptionEx) to High(OptionEx) do
          if OptionEx in FOptionsEx then
            FlagsEx := FlagsEx or OpenOptionsEx[OptionEx];
    end
    else
      Flags := Flags and not OFN_EXPLORER;
    TempExt := FDefaultExt;
    if (TempExt = '') and (Flags and OFN_EXPLORER = 0) then
    begin
      TempExt := ExtractFileExt(FFilename);
      Delete(TempExt, 1, 1);
    end;
    if TempExt <> '' then lpstrDefExt := PChar(TempExt);
    if (ofOldStyleDialog in Options) or not NewStyleControls then
      lpfnHook := DialogHook
    else
      lpfnHook := ExplorerHook;

    if Template <> nil then
    begin
      Flags := Flags or OFN_ENABLETEMPLATE;
      lpTemplateName := Template;
      if FTemplateModule <> 0 then
        hInstance := FTemplateModule;
    end;
    if Application.ModalPopupMode <> pmNone then
    begin
      FRedirector := TRedirectorWindow.Create(nil);
      with TRedirectorWindow(FRedirector) do
      begin
        FCommonDialog := Self;
        FFormHandle := ParentWnd;
      end;
      hWndOwner := FRedirector.Handle;
    end
    else
      hWndOwner := ApplicationMainHandle;
    Result := TaskModalDialog(Func, OpenFileName);
    if Result then
    begin
      GetFileNames(OpenFilename);
      if (Flags and OFN_EXTENSIONDIFFERENT) <> 0 then
        Include(FOptions, ofExtensionDifferent) else
        Exclude(FOptions, ofExtensionDifferent);
      if (Flags and OFN_READONLY) <> 0 then
        Include(FOptions, ofReadOnly) else
        Exclude(FOptions, ofReadOnly);
      FFilterIndex := nFilterIndex;
    end;
  end;
end;
{$ENDIF}

procedure TOpenDialog.DoIncludeItem(const OFN: TOFNotifyEx; var Include: Boolean);
begin
  if Assigned(FOnIncludeItem) then FOnIncludeItem(OFN, Include);
end;

{ TSaveDialog }

{$IF DEFINED(CLR)}
function TSaveDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  Result := GetSaveFileName(DialogData);
end;
{$ENDIF}

function TSaveDialog.Execute(ParentWnd: HWND): Boolean;
{$IF DEFINED(CLR)}
var
  FileDialogWrapper: TFileDialogWrapper;
{$ENDIF}
begin
{$IF DEFINED(CLR)}
  if (Win32MajorVersion >= 6) and UseLatestCommonDialogs and
     not (TStyleManager.IsCustomStyleActive and (shDialogs in TStyleManager.SystemHooks)) and
     IsNewCommonCtrl and (Template = '') and
     not (Assigned(FOnIncludeItem) or Assigned(FOnClose) or Assigned(FOnShow)) then
  begin
    // This requires Windows Vista or later
    FileDialogWrapper := TFileSaveDialogWrapper.Create(Self);
    try
      Result := FileDialogWrapper.Execute(ParentWnd);
    finally
      FileDialogWrapper.Free;
    end;
  end
  else
    Result := inherited Execute(ParentWnd);
{$ELSE}
  Result := DoExecute(@GetSaveFileName, ParentWnd);
{$ENDIF}
end;

{ TColorDialog }

constructor TColorDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCustomColors := TStringList.Create;
end;

destructor TColorDialog.Destroy;
begin
  FCustomColors.Free;
  inherited Destroy;
end;

{$IF DEFINED(CLR)}
function TColorDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  Result := ChooseColor(DialogData);
end;
{$ENDIF}

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TColorDialog.Execute(ParentWnd: HWND): Boolean;
const
  DialogOptions: array[TColorDialogOption] of DWORD = (
    CC_FULLOPEN, CC_PREVENTFULLOPEN, CC_SHOWHELP, CC_SOLIDCOLOR,
    CC_ANYCOLOR);
  ColorPrefix = 'Color';
var
  ChooseColorRec: TChooseColor;
  Option: TColorDialogOption;
{$IF DEFINED(CLR)}
  CustomColorsArray, DialogData: IntPtr;
{$ELSE}
  CustomColorsArray: TCustomColors;
{$ENDIF}

  procedure GetCustomColorsArray;
  var
    I, Val: Integer;
  begin
    for I := 0 to MaxCustomColors - 1 do
    begin
{$IF DEFINED(CLR)}
      Val := Marshal.ReadInt32(CustomColorsArray, I * sizeof(Longint));
{$ELSE}
      Val := CustomColorsArray[I];
{$ENDIF}
      FCustomColors.Values[ColorPrefix + Char(Ord('A') + I)] :=
        Format('%.6x', [Val]);
    end;
  end;

{$IF DEFINED(CLR)}
  procedure SetCustomColorsArray;
  var
    Value: string;
    I: Integer;
  begin
    CustomColorsArray := Marshal.AllocHGlobal(MaxCustomColors * sizeof(Longint));
    for I := 0 to MaxCustomColors - 1 do
    begin
      Value := FCustomColors.Values[ColorPrefix + Char(Ord('A') + I)];
      if Value <> '' then
        Marshal.WriteInt32(CustomColorsArray, I * sizeof(Longint),
          StrToInt('$' + Value))
      else
        Marshal.WriteInt32(CustomColorsArray, I * sizeof(Longint), -1);
    end;
  end;
{$ELSE}
  procedure SetCustomColorsArray;
  var
    Value: string;
    I: Integer;
  begin
    for I := 0 to MaxCustomColors - 1 do
    begin
      Value := FCustomColors.Values[ColorPrefix + Char(Ord('A') + I)];
      if Value <> '' then
        CustomColorsArray[I] := StrToInt('$' + Value) else
        CustomColorsArray[I] := -1;
    end;
  end;
{$ENDIF}

{$IF DEFINED(CLR)}
  procedure FreeCustomColorsArray;
  begin
    Marshal.FreeHGlobal(CustomColorsArray);
  end;
{$ENDIF}

begin
  with ChooseColorRec do
  begin
    SetCustomColorsArray;
{$IF DEFINED(CLR)}
    try
      lStructSize := Marshal.SizeOf(TypeOf(ChooseColorRec));
      hInstance := WinUtils.HInstance;
      rgbResult := ColorToRGB(FColor);
      lpCustColors := CustomColorsArray;
      LCustData := 0;
{$ELSE}
      lStructSize := SizeOf(ChooseColorRec);
      hInstance := SysInit.HInstance;
      rgbResult := ColorToRGB(FColor);
    lpCustColors := @CustomColorsArray;
{$ENDIF}
      Flags := CC_RGBINIT or CC_ENABLEHOOK;
      for Option := Low(Option) to High(Option) do
        if Option in FOptions then
          Flags := Flags or DialogOptions[Option];
{$IF DEFINED(CLR)}
      lpTemplateName := Template;
      if Length(Template) > 0 then
      begin
{$ELSE}
      if Template <> nil then
      begin
        lpTemplateName := Template;
{$ENDIF}
        Flags := Flags or CC_ENABLETEMPLATE;
        if FTemplateModule <> 0 then
          hInstance := FTemplateModule;
      end;
{$IF DEFINED(CLR)}
      lpfnHook := FDialogHookDelegate;
{$ELSE}
      lpfnHook := DialogHook;
{$ENDIF}
      if Application.ModalPopupMode <> pmNone then
      begin
        FRedirector := TRedirectorWindow.Create(nil);
        with TRedirectorWindow(FRedirector) do
        begin
          FCommonDialog := Self;
          FFormHandle := ParentWnd;
        end;
        hWndOwner := FRedirector.Handle;
      end
      else
        hWndOwner := ApplicationMainHandle;
{$IF DEFINED(CLR)}
      DialogData := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TChooseColor)));
      try
        Marshal.StructureToPtr(TObject(ChooseColorRec), DialogData, False);
        Result := TaskModalDialog(DialogData);
        if Result then
        begin
          ChooseColorRec := TChooseColor(Marshal.PtrToStructure(DialogData,
            TypeOf(TChooseColor)));
          FColor := ChooseColorRec.rgbResult;
          GetCustomColorsArray;
        end;
      finally
        Marshal.DestroyStructure(DialogData, TypeOf(TChooseColor));
        Marshal.FreeHGlobal(DialogData);
      end;
    finally
      FreeCustomColorsArray;
    end;
{$ELSE}
      Result := TaskModalDialog(@ChooseColor, ChooseColorRec);
      if Result then
      begin
        FColor := rgbResult;
        GetCustomColorsArray;
      end;
{$ENDIF}
  end;
end;

procedure TColorDialog.SetCustomColors(Value: TStrings);
begin
  FCustomColors.Assign(Value);
end;

{ TFontDialog }

const
  IDAPPLYBTN = $402;

{$IF NOT DEFINED(CLR)}
var
  FontDialog: TFontDialog;
{$ENDIF}

{$IF DEFINED(CLR)}
function TFontDialog.FontDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR;
begin
  if (Msg = WM_COMMAND) and ((WParam and $FFFF) = IDAPPLYBTN) and
    (((WParam shr 16) and $FFFF) = BN_CLICKED) then
  begin
    DoApply(Wnd);
    Result := 1;
  end else
    Result := DialogHook(Wnd, Msg, wParam, lParam);
end;
{$ELSE}
function FontDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR; stdcall;
begin
  if (Msg = WM_COMMAND) and ((WParam and $FFFF) = IDAPPLYBTN) and
    (((WParam shr 16) and $FFFF) = BN_CLICKED) then
  begin
    FontDialog.DoApply(Wnd);
    Result := 1;
  end else
    Result := DialogHook(Wnd, Msg, wParam, lParam);
end;
{$ENDIF}

constructor TFontDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFont := TFont.Create;
  FOptions := [fdEffects];
{$IF DEFINED(CLR)}
  FFontHookDelegate := @FontDialogHook;
{$ENDIF}
end;

destructor TFontDialog.Destroy;
begin
  FFont.Free;
  inherited Destroy;
end;

procedure TFontDialog.WndProc(var Message: TMessage);
begin
  { Make sure we only take values from the color combobox and script combobox
    if they have been changed. }
  if (Message.Msg = WM_COMMAND) and (Message.WParamHi = CBN_SELENDOK) then
    if (Message.WParamLo = cmb4) then FFontColorModified := True
    else if (Message.WParamLo = cmb5) then FFontCharsetModified := True;
  inherited WndProc(Message);
end;

procedure TFontDialog.Apply(Wnd: HWND);
begin
  if Assigned(FOnApply) then FOnApply(Self, Wnd);
end;

const
  IDCOLORCMB = $473;

procedure TFontDialog.DoApply(Wnd: HWND);
var
  I: Integer;
  LogFont: TLogFont;
begin
  SendGetStructMessage(Wnd, WM_CHOOSEFONT_GETLOGFONT, 0, LogFont);
  UpdateFromLogFont(LogFont);
  I := SendDlgItemMessage(Wnd, IDCOLORCMB, CB_GETCURSEL, 0, 0);
  if I <> CB_ERR then
    Font.Color := SendDlgItemMessage(Wnd, IDCOLORCMB, CB_GETITEMDATA, I, 0);
  try
    Apply(Wnd);
  except
    Application.HandleException(Self);
  end;
end;

{$IF DEFINED(CLR)}
function TFontDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  Result := ChooseFont(DialogData);
end;
{$ENDIF}

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TFontDialog.Execute(ParentWnd: HWND): Boolean;
const
  FontOptions: array[TFontDialogOption] of DWORD = (
    CF_ANSIONLY, CF_TTONLY, CF_EFFECTS, CF_FIXEDPITCHONLY, CF_FORCEFONTEXIST,
    CF_NOFACESEL, CF_NOOEMFONTS, CF_NOSIMULATIONS, CF_NOSIZESEL,
    CF_NOSTYLESEL, CF_NOVECTORFONTS, CF_SHOWHELP,
    CF_WYSIWYG or CF_BOTH or CF_SCALABLEONLY, CF_LIMITSIZE,
    CF_SCALABLEONLY, CF_APPLY);
  Devices: array[TFontDialogDevice] of DWORD = (
    CF_SCREENFONTS, CF_PRINTERFONTS, CF_BOTH);
var
  ChooseFontRec: TChooseFont;
  LogFont: TLogFont;
  Option: TFontDialogOption;
  OriginalFaceName: string;
{$IF DEFINED(CLR)}
  Mem, DialogData: IntPtr;
{$ELSE}
  SaveFontDialog: TFontDialog;
{$ENDIF}
begin
  with ChooseFontRec do
  begin
{$IF DEFINED(CLR)}
    lStructSize := Marshal.SizeOf(TypeOf(ChooseFontRec));
{$ELSE}
    lStructSize := SizeOf(ChooseFontRec);
    lpLogFont := @LogFont;
    GetObject(Font.Handle, SizeOf(LogFont), @LogFont);
    OriginalFaceName := LogFont.lfFaceName;
{$ENDIF}
    hDC := 0;
    if FDevice <> fdScreen then hDC := Printer.Handle;
    Flags := Devices[FDevice] or (CF_INITTOLOGFONTSTRUCT or CF_ENABLEHOOK);
    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or FontOptions[Option];
    if Assigned(FOnApply) then Flags := Flags or CF_APPLY;
{$IF DEFINED(CLR)}
    lpTemplateName := Template;
    if Length(Template) > 0 then
    begin
{$ELSE}
    if Template <> nil then
    begin
      lpTemplateName := Template;
{$ENDIF}
      Flags := Flags or CF_ENABLETEMPLATE;
      if FTemplateModule <> 0 then
        hInstance := FTemplateModule;
    end;
    rgbColors := ColorToRGB(Font.Color);
    lCustData := 0;
{$IF DEFINED(CLR)}
    lpfnHook := FFontHookDelegate;
{$ELSE}
    lpfnHook := FontDialogHook;
{$ENDIF}
    nSizeMin := FMinFontSize;
    nSizeMax := FMaxFontSize;
    if nSizeMin > nSizeMax then Flags := Flags and (not CF_LIMITSIZE);
    if Application.ModalPopupMode <> pmNone then
    begin
      FRedirector := TRedirectorWindow.Create(nil);
      with TRedirectorWindow(FRedirector) do
      begin
        FCommonDialog := Self;
        FFormHandle := ParentWnd;
      end;
      hWndOwner := FRedirector.Handle;
    end
    else
      hWndOwner := ApplicationMainHandle;
    FFontColorModified := False;
    FFontCharsetModified := False;
{$IF DEFINED(CLR)}
    Mem := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TLogFont)));
    try
      GetObject(Font.Handle, Marshal.SizeOf(TypeOf(TLogFont)), LogFont);
      Marshal.StructureToPtr(TObject(LogFont), Mem, False);
      lpLogFont := Mem;
      OriginalFaceName := LogFont.lfFaceName;
      DialogData := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TChooseFont)));
      try
        Marshal.StructureToPtr(TObject(ChooseFontRec), DialogData, False);
        Result := TaskModalDialog(DialogData);
        if Result then
        begin
          ChooseFontRec := TChooseFont(Marshal.PtrToStructure(DialogData,
            TypeOf(TChooseFont)));
          LogFont := TLogFont(Marshal.PtrToStructure(Mem, TypeOf(TLogFont)));
          if CompareText(OriginalFaceName, LogFont.lfFaceName) <> 0 then
            FFontCharsetModified := True;
          UpdateFromLogFont(LogFont);
          if FFontColorModified then Font.Color := rgbColors;
        end;
      finally
        // zero out the logfont pointer, so we dont double-free it
        Marshal.WriteInt32(DialogData,
          Integer(Marshal.OffsetOf(TypeOf(TChooseFont), 'lpLogFont')), 0);
        Marshal.DestroyStructure(DialogData, TypeOf(TChooseFont));
        Marshal.FreeHGlobal(DialogData);
      end;
    finally
      Marshal.FreeHGlobal(Mem);
    end;
{$ELSE}
    SaveFontDialog := FontDialog;
    FontDialog := Self;
    Result := TaskModalDialog(@ChooseFont, ChooseFontRec);
    FontDialog := SaveFontDialog;
    if Result then
    begin
      if AnsiCompareText(OriginalFaceName, LogFont.lfFaceName) <> 0 then
        FFontCharsetModified := True;
      UpdateFromLogFont(LogFont);
      if FFontColorModified then Font.Color := rgbColors;
    end;
{$ENDIF}
  end;
end;

procedure TFontDialog.SetFont(Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TFontDialog.UpdateFromLogFont(const LogFont: TLogFont);
var
  Style: TFontStyles;
begin
  with LogFont do
  begin
    Font.Name := LogFont.lfFaceName;
    Font.Height := LogFont.lfHeight;
    if FFontCharsetModified then
      Font.Charset := TFontCharset(LogFont.lfCharSet);
    Style := [];
    with LogFont do
    begin
      if lfWeight > FW_REGULAR then Include(Style, fsBold);
      if lfItalic <> 0 then Include(Style, fsItalic);
      if lfUnderline <> 0 then Include(Style, fsUnderline);
      if lfStrikeOut <> 0 then Include(Style, fsStrikeOut);
    end;
    Font.Style := Style;
  end;
end;

{ Printer dialog routines }

procedure GetPrinter(var DeviceMode, DeviceNames: HGLOBAL);
{$IF DEFINED(CLR)}
var
  Device, Driver, Port: string;
  DevMode, Ptr: IntPtr;
  DevModeRec: TDeviceMode;
  Len, StructLen: Integer;
  OffsetInChars, OffsetInBytes: Word;
  Temp, Buffer: TBytes;
  DevNameRec: TDevNames;
begin
  Printer.GetPrinter(Device, Driver, Port, DevMode);
  if DevMode <> nil then
  begin
    // first convert DevMode to a global handle
    // note we dont know the size of this, so we allocate the max
    DeviceMode := GlobalAlloc(GHND, SizeOf(TDeviceMode) +
      (CCHDEVICENAME + CCHFORMNAME) * Marshal.SystemDefaultCharSize);
    Ptr := GlobalLock(DeviceMode);
    try
      DevModeRec := TDeviceMode(Marshal.PtrToStructure(DevMode, TypeOf(TDeviceMode)));
      Marshal.StructureToPtr(TObject(DevModeRec), Ptr, False);
    finally
      GlobalUnlock(DeviceMode);
    end;

    // now assemble DeviceNames

    // add null terminators
    Len := Length(Driver) + 1;
    SetLength(Driver, Len);
    Driver[Len] := #0;
    Len := Length(Device) + 1;
    SetLength(Device, Len);
    Device[Len] := #0;
    Len := Length(Port) + 1;
    SetLength(Port, Len);
    Port[Len] := #0;

    // allocate a buffer to hold the device names we will write to memory

    StructLen := (Length(Device) + Length(Driver) + Length(Port)) * Marshal.SystemDefaultCharSize;
    SetLength(Buffer, StructLen);

    // now fill buffer with the necessary bytes

    OffsetInBytes := 0;
    OffsetInChars := 0;
    // wDriverOffset and Driver string
    DevNameRec.wDriverOffset := OffsetInChars;
    Temp := PlatformBytesOf(Driver);
    Len := Length(Temp);
    System.Array.Copy(Temp, 0, Buffer, OffsetInBytes, Len);
    Inc(OffsetInBytes, Len);
    Inc(OffsetInChars, Len div Marshal.SystemDefaultCharSize);
    // wDeviceOffset and Device string
    DevNameRec.wDeviceOffset := OffsetInChars;
    Temp := PlatformBytesOf(Device);
    Len := Length(Temp);
    System.Array.Copy(Temp, 0, Buffer, OffsetInBytes, Len);
    Inc(OffsetInBytes, Len);
    Inc(OffsetInChars, Len div Marshal.SystemDefaultCharSize);
    // wOutputOffset and Port string
    DevNameRec.wOutputOffset := OffsetInChars;
    Temp := PlatformBytesOf(Port);
    System.Array.Copy(Temp, 0, Buffer, OffsetInBytes, Length(Temp));

    // finally, allocate DeviceNames and write the buffer

    DeviceNames := GlobalAlloc(GHND, StructLen + Marshal.SizeOf(TypeOf(TDevNames)));
    Ptr := GlobalLock(DeviceNames);
    try
      Marshal.StructureToPtr(TObject(DevNameRec), Ptr, False);
      Ptr := IntPtr(PByte(Ptr) + Marshal.SizeOf(TypeOf(TDevNames)));
      Marshal.Copy(Buffer, 0, Ptr, StructLen);
    finally
      GlobalUnlock(DeviceNames);
    end;
  end;
end;
{$ELSE}
var
  Device, Driver, Port: array[0..1023] of char;
  DevNames: PDevNames;
  Offset: PChar;
begin
  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
  if DeviceMode <> 0 then
  begin
    DeviceNames := GlobalAlloc(GHND, SizeOf(TDevNames) +
     (StrLen(Device) + StrLen(Driver) + StrLen(Port) + 3) * SizeOf(Char));
    DevNames := PDevNames(GlobalLock(DeviceNames));
    try
      Offset := PChar(PByte(DevNames) + SizeOf(TDevnames));
      with DevNames^ do
      begin
        wDriverOffset := Offset - PChar(DevNames);
        Offset := StrECopy(Offset, Driver) + 1;
        wDeviceOffset := Offset - PChar(DevNames);
        Offset := StrECopy(Offset, Device) + 1;
        wOutputOffset := Offset - PChar(DevNames);;
        StrCopy(Offset, Port);
      end;
    finally
      GlobalUnlock(DeviceNames);
    end;
  end;
end;
{$ENDIF}

procedure SetPrinter(DeviceMode, DeviceNames: HGLOBAL);
{$IF DEFINED(CLR)}
var
  Device, Driver, Port: string;
  Offset: Integer;
  DevNames, DevMode, Ptr: IntPtr;
  DevModeRec: TDeviceMode;
  DevNameRec: TDevNames;
begin
  try
    // first copy the DevMode
    DevMode := Marshal.AllocHGlobal(GlobalSize(DeviceMode));
    try
      Ptr := GlobalLock(DeviceMode);
      try
        DevModeRec := TDeviceMode(Marshal.PtrToStructure(Ptr, TypeOf(TDeviceMode)));
        Marshal.StructureToPtr(TObject(DevModeRec), DevMode, False);
      finally
        GlobalUnlock(DeviceMode);
      end;
    except
      Marshal.FreeHGlobal(DevMode);
      DevMode := nil;
    end;

    // now decipher the devicenames
    DevNames := GlobalLock(DeviceNames);
    try
      DevNameRec := TDevNames(Marshal.PtrToStructure(DevNames, TypeOf(TDevNames)));
      Offset := (DevNameRec.wDriverOffset * Marshal.SystemDefaultCharSize) + Integer(DevNames);
      Ptr := IntPtr.Create(Offset);
      Driver := Marshal.PtrToStringAuto(Ptr);
      Offset := (DevNameRec.wDeviceOffset * Marshal.SystemDefaultCharSize) + Integer(DevNames);
      Ptr := IntPtr.Create(Offset);
      Device := Marshal.PtrToStringAuto(Ptr);
      Offset := (DevNameRec.wOutputOffset * Marshal.SystemDefaultCharSize) + Integer(DevNames);
      Ptr := IntPtr.Create(Offset);
      Port := Marshal.PtrToStringAuto(Ptr);
    finally
      GlobalUnlock(DeviceNames);
    end;
    // pass the copied information to the printer
    Printer.SetPrinter(Device, Driver, Port, DevMode);
  finally
    GlobalFree(DeviceNames);
    GlobalFree(DeviceMode);
  end;
end;
{$ELSE}
var
  DevNames: PDevNames;
begin
  DevNames := PDevNames(GlobalLock(DeviceNames));
  try
    with DevNames^ do
      Printer.SetPrinter(PChar(DevNames) + wDeviceOffset,
        PChar(DevNames) + wDriverOffset,
        PChar(DevNames) + wOutputOffset, DeviceMode);
  finally
    GlobalUnlock(DeviceNames);
    GlobalFree(DeviceNames);
  end;
end;
{$ENDIF}

function CopyData(Handle: THandle): THandle;
{$IF DEFINED(CLR)}
var
  Temp: TDeviceMode;
  SrcPtr, DestPtr: IntPtr;
begin
  if Handle <> 0 then
  begin
    Result := GlobalAlloc(GHND, GlobalSize(Handle));
    if Result <> 0 then
    SrcPtr := GlobalLock(Handle);
    try
      DestPtr := GlobalLock(Result);
      try
        Temp := TDeviceMode(Marshal.PtrToStructure(SrcPtr, TypeOf(TDeviceMode)));
        Marshal.StructureToPtr(TObject(Temp), DestPtr, False);
      finally
        GlobalUnlock(Result);
      end;
    finally
      GlobalUnlock(Handle);
    end;
  end else
    Result := 0;
end;
{$ELSE}
var
  Src, Dest: PChar;
  Size: Integer;
begin
  if Handle <> 0 then
  begin
    Size := GlobalSize(Handle);
    Result := GlobalAlloc(GHND, Size);
    if Result <> 0 then
      try
        Src := GlobalLock(Handle);
        Dest := GlobalLock(Result);
        if (Src <> nil) and (Dest <> nil) then Move(Src^, Dest^, Size);
      finally
        GlobalUnlock(Handle);
        GlobalUnlock(Result);
      end
  end
  else Result := 0;
end;
{$ENDIF}

{ TPrinterSetupDialog }
{$IF DEFINED(CLR)}
function TPrinterSetupDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  Result := PrintDlg(DialogData);
end;
{$ENDIF}

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TPrinterSetupDialog.Execute(ParentWnd: HWND): Boolean;
{$IF DEFINED(CLR)}
var
  PrintDlgRec: TPrintDlg;
  DevHandle: THandle;
  DialogData: IntPtr;
begin
  with PrintDlgRec do
  begin
    lStructSize := Marshal.SizeOf(TypeOf(TPrintDlg));
    hInstance := WinUtils.HInstance;
    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);
    Flags := PD_ENABLESETUPHOOK or PD_PRINTSETUP;
    lpfnSetupHook := FDialogHookDelegate;
    if Application.ModalPopupMode <> pmNone then
    begin
      FRedirector := TRedirectorWindow.Create(nil);
      with TRedirectorWindow(FRedirector) do
      begin
        FCommonDialog := Self;
        FFormHandle := ParentWnd;
      end;
      hWndOwner := FRedirector.Handle;
    end
    else
      hWndOwner := Application.Handle;
  end;
  DialogData := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TPrintDlg)));
  try
    Marshal.StructureToPtr(TObject(PrintDlgRec), DialogData, False);
    Result := TaskModalDialog(DialogData);
    PrintDlgRec := TPrintDlg(Marshal.PtrToStructure(DialogData, TypeOf(TPrintDlg)));
  finally
    Marshal.DestroyStructure(DialogData, TypeOf(TPrintDlg));
    Marshal.FreeHGlobal(DialogData);
  end;
  with PrintDlgRec do
  begin
    if Result then
      SetPrinter(hDevMode, hDevNames)
    else begin
      if hDevMode <> 0 then
      begin
        GlobalFree(hDevMode);
        hDevMode := 0;
      end;
      if hDevNames <> 0 then
      begin
        GlobalFree(hDevNames);
        hDevNames := 0;
      end;
    end;
  end;
end;
{$ELSE}
var
  PrintDlgRec: TPrintDlg;
  DevHandle: THandle;
begin
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), 0);
  with PrintDlgRec do
  begin
    lStructSize := SizeOf(PrintDlgRec);
    hInstance := SysInit.HInstance;
    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);
    Flags := PD_ENABLESETUPHOOK or PD_PRINTSETUP;
    lpfnSetupHook := DialogHook;
    if Application.ModalPopupMode <> pmNone then
    begin
      FRedirector := TRedirectorWindow.Create(nil);
      with TRedirectorWindow(FRedirector) do
      begin
        FCommonDialog := Self;
        FFormHandle := ParentWnd;
      end;
      hWndOwner := FRedirector.Handle;
    end
    else
      hWndOwner := ApplicationMainHandle;
    Result := TaskModalDialog(@PrintDlg, PrintDlgRec);
    if Result then
      SetPrinter(hDevMode, hDevNames)
    else begin
      if hDevMode <> 0 then GlobalFree(hDevMode);
      if hDevNames <> 0 then GlobalFree(hDevNames);
    end;
  end;
end;
{$ENDIF}

{ TPrintDialog }

procedure TPrintDialog.SetNumCopies(Value: Integer);
begin
  FCopies := Value;
  Printer.Copies := Value;
end;

{$IF DEFINED(CLR)}
function TPrintDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  Result := PrintDlg(DialogData);
end;
{$ENDIF}

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
[PrintingPermission(SecurityAction.LinkDemand, Level=PrintingPermissionLevel.SafePrinting)]
function TPrintDialog.Execute(ParentWnd: HWND): Boolean;
const
  PrintRanges: array[TPrintRange] of Integer =
    (PD_ALLPAGES, PD_SELECTION, PD_PAGENUMS);
var
  PrintDlgRec: TPrintDlg;
  DevHandle: HGLOBAL;
{$IF DEFINED(CLR)}
  DialogData: IntPtr;
{$ENDIF}
begin
  with PrintDlgRec do
  begin
{$IF DEFINED(CLR)}
    lStructSize := Marshal.SizeOf(TypeOf(TPrintDlg));
    hInstance := WinUtils.HInstance;
{$ELSE} 
    FillChar(PrintDlgRec, SizeOf(PrintDlgRec), 0);
    lStructSize := SizeOf(PrintDlgRec);
    hInstance := SysInit.HInstance;
{$ENDIF}
    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);
    Flags := PrintRanges[FPrintRange] or (PD_ENABLEPRINTHOOK or
      PD_ENABLESETUPHOOK);
    if FCollate then Inc(Flags, PD_COLLATE);
    if not (poPrintToFile in FOptions) then Inc(Flags, PD_HIDEPRINTTOFILE);
    if not (poPageNums in FOptions) then Inc(Flags, PD_NOPAGENUMS);
    if not (poSelection in FOptions) then Inc(Flags, PD_NOSELECTION);
    if poDisablePrintToFile in FOptions then Inc(Flags, PD_DISABLEPRINTTOFILE);
    if FPrintToFile then Inc(Flags, PD_PRINTTOFILE);
    if poHelp in FOptions then Inc(Flags, PD_SHOWHELP);
    if not (poWarning in FOptions) then Inc(Flags, PD_NOWARNING);
{$IF DEFINED(CLR)}
    if Length(Template) > 0 then
{$ELSE}
    if Template <> nil then
{$ENDIF}
    begin
      Flags := Flags or PD_ENABLEPRINTTEMPLATE;
      lpPrintTemplateName := Template;
      if FTemplateModule <> 0 then
        hInstance := FTemplateModule;
    end;
    nFromPage := FFromPage;
    nToPage := FToPage;
    nMinPage := FMinPage;
    nMaxPage := FMaxPage;
{$IF DEFINED(CLR)}
    lpfnPrintHook := FDialogHookDelegate;
    lpfnSetupHook := FDialogHookDelegate;
{$ELSE}
    lpfnPrintHook := DialogHook;
    lpfnSetupHook := DialogHook;
{$ENDIF}
    if Application.ModalPopupMode <> pmNone then
    begin
      FRedirector := TRedirectorWindow.Create(nil);
      with TRedirectorWindow(FRedirector) do
      begin
        FCommonDialog := Self;
        FFormHandle := ParentWnd;
      end;
      hWndOwner := FRedirector.Handle;
    end
    else
      hWndOwner := ApplicationMainHandle;
  end;
{$IF DEFINED(CLR)}
  DialogData := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TPrintDlg)));
  try
    Marshal.StructureToPtr(TObject(PrintDlgRec), DialogData, False);
    Result := TaskModalDialog(DialogData);
    PrintDlgRec := TPrintDlg(Marshal.PtrToStructure(DialogData, TypeOf(TPrintDlg)));
  finally
    Marshal.DestroyStructure(DialogData, TypeOf(TPrintDlg));
    Marshal.FreeHGlobal(DialogData);
  end;
{$ELSE}
  Result := TaskModalDialog(@PrintDlg, PrintDlgRec);
{$ENDIF}
  with PrintDlgRec do
  begin
    if Result then
    begin
      SetPrinter(hDevMode, hDevNames);
      FCollate := Flags and PD_COLLATE <> 0;
      FPrintToFile := Flags and PD_PRINTTOFILE <> 0;
      if Flags and PD_SELECTION <> 0 then FPrintRange := prSelection else
        if Flags and PD_PAGENUMS <> 0 then FPrintRange := prPageNums else
          FPrintRange := prAllPages;
      FFromPage := nFromPage;
      FToPage := nToPage;
      if nCopies = 1 then
        Copies := Printer.Copies else
        Copies := nCopies;
    end
    else begin
      if hDevMode <> 0 then
      begin
        GlobalFree(hDevMode);
        hDevMode := 0;
      end;
      if hDevNames <> 0 then
      begin
        GlobalFree(hDevNames);
        hDevNames := 0;
      end;
    end;
  end;
end;

{ TPageSetupDialog }

{$IF NOT DEFINED(CLR)}
var
  PgSetupDlg: TPageSetupDialog;  // Used for page paint callback
{$ENDIF}

{$IF DEFINED(CLR)}
function TPageSetupDialog.PagePaint(Wnd: HWND; Message: UINT; wParam: WPARAM; lParam: LPARAM): UINT_PTR;
{$ELSE}
function PagePaint(Wnd: HWND; Message: UINT; wParam: WPARAM; lParam: LPARAM): UINT_PTR; stdcall;
{$ENDIF}
var
  DoneDrawing: Boolean;

  procedure CallPaintEvent(Event: TPaintPageEvent);
  var
    Canvas: TCanvas;
{$IF DEFINED(CLR)}
    Rect: TRect;
{$ENDIF}
  begin
    Canvas := TCanvas.Create;
    try
      Canvas.Handle := HDC(wParam);
      if Assigned(Event) then
      begin
{$IF DEFINED(CLR)}
        Rect := TRect(Marshal.PtrToStructure(IntPtr(lParam), TypeOf(TRect)));
        Event(self, Canvas, Rect, DoneDrawing);
{$ELSE}
        Event(PgSetupDlg, Canvas, PRect(lParam)^, DoneDrawing);
{$ENDIF}
      end;
    finally
      Canvas.Free;
    end;
  end;

const
  PageType: array[Boolean] of TPageType = (ptEnvelope, ptPaper);
  Orientation: array[Boolean] of TPrinterOrientation = (poPortrait, poLandscape);
begin
{$IF NOT DEFINED(CLR)}
  Result := UINT(False);
  if not Assigned(PgSetupDlg) then Exit; 
  with PgSetupDlg do
{$ENDIF}
  begin
    DoneDrawing := False;
    if Message = WM_PSD_PAGESETUPDLG then
    begin
      if Assigned(FBeforePaint) then
        // Constants used below are from WinAPI help on WM_PSD_PAGESETUPDLG
{$IF DEFINED(CLR)}
        BeforePaint(self, (wParam and $FFFF),
{$ELSE}
        BeforePaint(PgSetupDlg, (wParam and $FFFF),
{$ENDIF}
          Orientation[(wParam shr 16) in [$0001,$0003, $000B, $0019]],
          PageType[(wParam shr 16) > $000B], DoneDrawing);
    end
    else
      case Message of
        WM_PSD_FULLPAGERECT  : CallPaintEvent(FOnDrawFullPage);
        WM_PSD_MINMARGINRECT : CallPaintEvent(FOnDrawMinMargin);
        WM_PSD_MARGINRECT    : CallPaintEvent(FOnDrawMargin);
        WM_PSD_GREEKTEXTRECT : CallPaintEvent(FOnDrawGreekText);
        WM_PSD_ENVSTAMPRECT  : CallPaintEvent(FOnDrawEnvStamp);
        WM_PSD_YAFULLPAGERECT: CallPaintEvent(FOnDrawRetAddress);
      end;
  end;
  Result := UINT(DoneDrawing);
end;

constructor TPageSetupDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Options := [psoDefaultMinMargins];
  GetDefaults;
end;

{$IF DEFINED(CLR)}
function TPageSetupDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  Result := PageSetupDlg(DialogData);
end;
{$ENDIF}

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TPageSetupDialog.Execute(ParentWnd: HWND): Boolean;
var
{$IF DEFINED(CLR)}
  DialogData: IntPtr;
  LPagePaintHookDelegate: TFNCommDlgHook;
{$ELSE}
  DevHandle: THandle;
{$ENDIF}
begin
{$IF NOT DEFINED(CLR)}
  FillChar(FPageSetupDlgRec, SizeOf(PageSetupDlgRec), 0);
{$ENDIF}
  with FPageSetupDlgRec do
  begin
{$IF DEFINED(CLR)}
    lStructSize := Marshal.SizeOf(TypeOf(TPageSetupDlg));
{$ELSE}
    lStructSize := SizeOf(PageSetupDlgRec);
{$ENDIF}
    if Application.ModalPopupMode <> pmNone then
    begin
      FRedirector := TRedirectorWindow.Create(nil);
      with TRedirectorWindow(FRedirector) do
      begin
        FCommonDialog := Self;
        FFormHandle := ParentWnd;
      end;
      hWndOwner := FRedirector.Handle;
    end
    else
      hWndOwner := ApplicationMainHandle;
{$IF DEFINED(CLR)}
    hInstance := WinUtils.HInstance;
    {these must be 0 for the PSD_RETURNDEFAULT call to work}
                                                                   
//    GetPrinter(DevHandle, hDevNames);
//    hDevMode := CopyData(DevHandle);
    hDevNames := 0;
    hDevMode := 0;
{$ELSE}
    hInstance := SysInit.HInstance;
    GetPrinter(DevHandle, hDevNames);
    hDevMode := CopyData(DevHandle);
{$ENDIF}
    Flags := PSD_RETURNDEFAULT;
    PageSetupDlg(FPageSetupDlgRec);
    Flags := PSD_ENABLEPAGEPAINTHOOK or PSD_ENABLEPAGESETUPHOOK;
    case FUnits of
//    pmDefault    : Read from locale settings by the dialog
      pmInches     : Inc(Flags, PSD_INTHOUSANDTHSOFINCHES);
      pmMillimeters: Inc(Flags, PSD_INHUNDREDTHSOFMILLIMETERS);
    end;
    if psoDefaultMinMargins in FOptions then Inc(Flags, PSD_DEFAULTMINMARGINS);
    if psoDisableMargins in FOptions then Inc(Flags, PSD_DisableMargins);
    if psoDisableOrientation in FOptions then Inc(Flags, PSD_DISABLEORIENTATION);
    if psoDisablePagePainting in FOptions then
      Inc(Flags, PSD_DISABLEPAGEPAINTING)
    else
    begin
{$IF DEFINED(CLR)}
      LPagePaintHookDelegate := PagePaint; { TFNCommDlgHook }
      lpfnPagePaintHook := LPagePaintHookDelegate;
{$ELSE}
      PgSetupDlg := Self;
      lpfnPagePaintHook := PagePaint;
{$ENDIF}
    end;
    if psoDisablePaper in FOptions then Inc(Flags, PSD_DISABLEPAPER);
    if psoDisablePrinter in FOptions then Inc(Flags, PSD_DISABLEPRINTER);
    if psoMargins in FOptions then Inc(Flags, PSD_MARGINS);
    if psoMinMargins in FOptions then Inc(Flags, PSD_MINMARGINS);
    if psoShowHelp in FOptions then Inc(Flags, PSD_SHOWHELP);
    if not (psoWarning in FOptions) then Inc(Flags, PSD_NOWARNING);
    if psoNoNetworkButton in FOptions then Inc(Flags, PSD_NONETWORKBUTTON);
    ptPaperSize := Point(FPageWidth, FPageHeight);
    rtMinMargin := Rect(FMinMarginLeft, FMinMarginTop, FMinMarginRight, FMinMarginBottom);
    rtMargin := Rect(FMarginLeft, FMarginTop, FMarginRight, FMarginBottom);
{$IF DEFINED(CLR)}
    lpfnPageSetupHook := FDialogHookDelegate;
{$ELSE}
    lpfnPageSetupHook := DialogHook;
{$ENDIF}
  end;

{$IF DEFINED(CLR)}
  DialogData := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TPageSetupDlg)));
  try
    Marshal.StructureToPtr(TObject(FPageSetupDlgRec), DialogData, False);
    Result := TaskModalDialog(DialogData);
    FPageSetupDlgRec := TPageSetupDlg(Marshal.PtrToStructure(DialogData,
      TypeOf(TPageSetupDlg)));
  finally
    Marshal.DestroyStructure(DialogData, TypeOf(TPageSetupDlg));
    Marshal.FreeHGlobal(DialogData);
  end;
{$ELSE}
    Result := TaskModalDialog(@PageSetupDlg, FPageSetupDlgRec);
{$ENDIF}
  with FPageSetupDlgRec do
  begin
    if Result then
    begin
      PageWidth := ptPaperSize.x;
      PageHeight := ptPaperSize.y;
      MarginLeft := rtMargin.Left;
      MarginTop := rtMargin.Top;
      MarginRight := rtMargin.Right;
      MarginBottom := rtMargin.Bottom;
      SetPrinter(hDevMode, hDevNames)
    end
    else begin
      if hDevMode <> 0 then
      begin
        GlobalFree(hDevMode);
        hDevMode := 0;
      end;
      if hDevNames <> 0 then
      begin
        GlobalFree(hDevNames);
        hDevNames := 0;
      end;
     end;
  end;
end;

function TPageSetupDialog.GetDefaults: Boolean;
var
  PageSetupDlgRec: TPageSetupDlg;
begin
  Result := False;
  if Printer.Printers.Count = 0 then Exit;
{$IF NOT DEFINED(CLR)}
  FillChar(PageSetupDlgRec, SizeOf(PageSetupDlgRec), 0);
{$ENDIF}
  with PageSetupDlgRec do
  begin
{$IF DEFINED(CLR)}
    lStructSize := Marshal.SizeOf(TypeOf(TPageSetupDlg));
    hInstance := WinUtils.HInstance;
{$ELSE}
    lStructSize := SizeOf(PageSetupDlgRec);
    hInstance := SysInit.HInstance;
{$ENDIF}
    hwndOwner := ApplicationMainHandle;
    case FUnits of
//    pmDefault    : Read from locale settings by the dialog
      pmInches     : Inc(Flags, PSD_INTHOUSANDTHSOFINCHES);
      pmMillimeters: Inc(Flags, PSD_INHUNDREDTHSOFMILLIMETERS);
    end;
    if psoDefaultMinMargins in FOptions then Inc(Flags, PSD_DEFAULTMINMARGINS);
    if psoDisableMargins in FOptions then Inc(Flags, PSD_DISABLEMARGINS);
    if psoDisableOrientation in FOptions then Inc(Flags, PSD_DISABLEORIENTATION);
    if psoDisablePagePainting in FOptions then
      Inc(Flags, PSD_DISABLEPAGEPAINTING);
    if psoDisablePaper in FOptions then Inc(Flags, PSD_DISABLEPAPER);
    if psoDisablePrinter in FOptions then Inc(Flags, PSD_DISABLEPRINTER);
    ptPaperSize := Point(FPageWidth, FPageHeight);
    rtMinMargin := Rect(FMinMarginLeft, FMinMarginTop, FMinMarginRight, FMinMarginBottom);
    rtMargin := Rect(FMarginLeft, FMarginTop, FMarginRight, FMarginBottom);
{$IF DEFINED(CLR)}
    lpfnPageSetupHook := FDialogHookDelegate;
{$ELSE}
    lpfnPageSetupHook := DialogHook;
{$ENDIF}

    Flags := Flags or PSD_RETURNDEFAULT;
    hDevNames := 0;
    hDevMode := 0;
    Result := PageSetupDlg(PageSetupDlgRec);

    if Result then
    begin
      FPageWidth := ptPaperSize.x;
      FPageHeight := ptPaperSize.y;
      FMarginLeft := rtMargin.Left;
      FMarginTop := rtMargin.Top;
      FMarginRight := rtMargin.Right;
      FMarginBottom := rtMargin.Bottom;
      if hDevMode <> 0 then
      begin
        GlobalFree(hDevMode);
        hDevMode := 0;
      end;
      if hDevNames <> 0 then
      begin
        GlobalFree(hDevNames);
        hDevNames := 0;
      end;
    end;
  end;
end;

{ Find and Replace dialog routines }

{$IF DEFINED(CLR)}
procedure TFindDlgResources.Finalize;
var
  FR: TFindReplace;
begin
  if FFindHandle <> 0 then
  begin
    DestroyWindow(FFindHandle);
    FFindHandle := 0;
  end;
  if FFindReplacePtr <> nil then
  begin
    FR := TFindReplace(Marshal.PtrToStructure(FFindReplacePtr, TypeOf(TFindReplace)));
    if FR.lpstrFindWhat <> nil then
      Marshal.FreeHGlobal(FR.lpstrFindWhat);
    if FR.lpstrReplaceWith <> nil then
      Marshal.FreeHGlobal(FR.lpstrReplaceWith);
    Marshal.FreeHGlobal(FFindReplacePtr);
    FFindReplacePtr := nil;
  end;
  if Assigned(FObjectInstance) then
  begin
    FreeObjectInstance(FObjectInstance);
    FObjectInstance := nil;
  end;
end;
{$ENDIF}

{$IF DEFINED(CLR)}
function TFindDialog.FindReplaceWndProc(Wnd: HWND; Msg: UINT; WParam: WPARAM; LParam: LPARAM): LRESULT;
var
  FR: TFindReplace;
{$ELSE}
function FindReplaceWndProc(Wnd: HWND; Msg: Cardinal; WParam: WPARAM; LParam: LPARAM): LRESULT; stdcall;
//function FindReplaceWndProc(Wnd: HWND; Msg, WParam, LParam: Longint): Longint; stdcall;

function CallDefWndProc: LRESULT;
//  function CallDefWndProc: Longint;
  begin
    Result := CallWindowProc(Pointer(GetProp(Wnd,
      MakeIntAtom(WndProcPtrAtom))), Wnd, Msg, WParam, LParam);
  end;
{$ENDIF}
begin
  case Msg of
    WM_DESTROY:
      if Application.DialogHandle = Wnd then Application.DialogHandle := 0;
    WM_NCACTIVATE:
      if WParam <> 0 then
      begin
        if Application.DialogHandle = 0 then Application.DialogHandle := Wnd;
      end else
      begin
        if Application.DialogHandle = Wnd then Application.DialogHandle := 0;
      end;
    WM_NCDESTROY:
{$IF NOT DEFINED(CLR)}
      begin
        Result := CallDefWndProc;
        RemoveProp(Wnd, MakeIntAtom(WndProcPtrAtom));
        Exit;
      end;
{$ELSE}
      begin
        Result := CallWindowProc(FOldWindowLong, Wnd, Msg, WParam, LParam);
        // cleanup
        FResources.FFindHandle := 0;
        FOldWindowLong := IntPtr(Integer(0));
        if Assigned(FResources.FObjectInstance) then
        begin
          FreeObjectInstance(FResources.FObjectInstance);
          FResources.FObjectInstance := nil;
          FObjectInstance := nil;
        end;
        if FResources.FFindReplacePtr <> nil then
        begin
          FR := TFindReplace(Marshal.PtrToStructure(FResources.FFindReplacePtr,
             TypeOf(TFindReplace)));
          if FR.lpstrFindWhat <> nil then
          begin
            FindText := Marshal.PtrToStringAuto(FR.lpstrFindWhat);
            Marshal.FreeHGlobal(FR.lpstrFindWhat);
          end;
          if FR.lpstrReplaceWith <> nil then
          begin
            ReplaceText := Marshal.PtrToStringAuto(FR.lpstrReplaceWith);
            Marshal.FreeHGlobal(FR.lpstrReplaceWith);
          end;
          Marshal.FreeHGlobal(FResources.FFindReplacePtr);
          FResources.FFindReplacePtr := nil;
        end;
        System.GC.SuppressFinalize(FResources);
        FreeAndNil(FResources);
        Exit;
      end;
{$ENDIF}
   end;
{$IF DEFINED(CLR)}
   Result := CallWindowProc(FOldWindowLong, Wnd, Msg, WParam, LParam);
{$ELSE}
   Result := CallDefWndProc;
{$ENDIF}
end;

{$IF DEFINED(CLR)}
function TFindDialog.FindReplaceDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR;
{$ELSE}
function FindReplaceDialogHook(Wnd: HWnd; Msg: UINT; WParam: WPARAM; LParam: LPARAM): UINT_PTR; stdcall;
{$ENDIF}
begin
  Result := DialogHook(Wnd, Msg, wParam, lParam);
  if Msg = WM_INITDIALOG then
  begin
{$IF NOT DEFINED(CLR)}
    with TFindDialog(PFindReplace(LParam)^.lCustData) do
{$ENDIF}
    if (Left <> -1) or (Top <> -1) then
        SetWindowPos(Wnd, 0, Left, Top, 0, 0, SWP_NOACTIVATE or
          SWP_NOSIZE or SWP_NOZORDER);
{$IF DEFINED(CLR)}
    FOldWindowLong := SetWindowLong(Wnd, GWL_WNDPROC, FFRWP);
{$ELSE}
    SetProp(Wnd, MakeIntAtom(WndProcPtrAtom), GetWindowLong(Wnd, GWL_WNDPROC));
    SetWindowLong(Wnd, GWL_WNDPROC, IntPtr(@FindReplaceWndProc));
{$ENDIF}
    Result := 1;
  end;
end;

const
  FindOptions: array[TFindOption] of DWORD = (
    FR_DOWN, FR_FINDNEXT, FR_HIDEMATCHCASE, FR_HIDEWHOLEWORD,
    FR_HIDEUPDOWN, FR_MATCHCASE, FR_NOMATCHCASE, FR_NOUPDOWN, FR_NOWHOLEWORD,
    FR_REPLACE, FR_REPLACEALL, FR_WHOLEWORD, FR_SHOWHELP);

{ TFindDialog }

{$IF DEFINED(CLR)}
const FindReplaceStringLen = 256;

class constructor TFindDialog.Create;
begin
  FFindMsg := RegisterWindowMessage(FindMsgString);
end;
{$ENDIF}

constructor TFindDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOptions := [frDown];
  FPosition.X := -1;
  FPosition.Y := -1;
{$IF DEFINED(CLR)}
  FFindText := '';
  FReplaceText := '';
  FFRDH := @FindReplaceDialogHook;
  FFRWP := @FindReplaceWndProc;
{$ELSE}
  with FFindReplace do
  begin
    lStructSize := SizeOf(TFindReplace);
    hWndOwner := ApplicationMainHandle;
    hInstance := SysInit.HInstance;
    lpstrFindWhat := FFindText;
    wFindWhatLen := SizeOf(FFindText);
    lpstrReplaceWith := FReplaceText;
    wReplaceWithLen := SizeOf(FReplaceText);
    lCustData := LPARAM(Self);
    lpfnHook := FindReplaceDialogHook;
  end;
  FFindReplaceFunc := @Winapi.CommDlg.FindText;
{$ENDIF}
end;

{$IF DEFINED(CLR)}
function TFindDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  if Assigned(FResources) then
  begin
    FResources.FFindHandle := Winapi.CommDlg.FindText(DialogData);
    Result := FResources.FFindHandle <> 0;
  end else
    Result := False;
end;
{$ENDIF}

destructor TFindDialog.Destroy;
{$IF DEFINED(CLR)}
var
  FR: TFindReplace;
begin
  if Assigned(FResources) and (FResources.FFindHandle <> 0) then
  begin
    SendMessage(FResources.FFindHandle, WM_CLOSE, 0, 0);
    FResources.FFindHandle := 0;
  end;
  if Assigned(FResources) then
  begin
    if FResources.FFindReplacePtr <> nil then
    begin
      FR := TFindReplace(Marshal.PtrToStructure(FResources.FFindReplacePtr, TypeOf(TFindReplace)));
      if FR.lpstrFindWhat <> nil then
        Marshal.FreeHGlobal(FR.lpstrFindWhat);
      if FR.lpstrReplaceWith <> nil then
        Marshal.FreeHGlobal(FR.lpstrReplaceWith);
      Marshal.FreeHGlobal(FResources.FFindReplacePtr);
      FResources.FFindReplacePtr := nil;
    end;
    if Assigned(FResources.FObjectInstance) then
    begin
      FreeObjectInstance(FResources.FObjectInstance);
      FResources.FObjectInstance := nil;
      FObjectInstance := nil;
    end;
    System.GC.SuppressFinalize(FResources);
    FreeAndNil(FResources);
  end;
  inherited Destroy;
end;
{$ELSE}
begin
  if FFindHandle <> 0 then SendMessage(FFindHandle, WM_CLOSE, 0, 0);
  inherited Destroy;
end;
{$ENDIF}

procedure TFindDialog.CloseDialog;
begin
{$IF DEFINED(CLR)}
  if Assigned(FResources) and (FResources.FFindHandle <> 0) then
  with FResources do
{$ELSE}
  if FFindHandle <> 0 then 
{$ENDIF}
    PostMessage(FFindHandle, WM_CLOSE, 0, 0);
end;

{$IF DEFINED(CLR)}
function GetTopWindow(Wnd: HWND; Mem: LParam):Bool;
{$ELSE}
function GetTopWindow(Wnd: THandle; var ReturnVar: THandle):Bool; stdcall;
{$ENDIF}
var
  Test: TWinControl;
begin
  Test := FindControl(Wnd);
  Result := True;
  if Assigned(Test) and (Test is TForm) then
  begin
{$IF DEFINED(CLR)}
    Marshal.WriteInt32(IntPtr(Mem), Wnd);
{$ELSE}
    ReturnVar := Wnd;
{$ENDIF}
    Result := False;
  end;
end;

{$IF DEFINED(CLR)}
procedure WriteStringToPtr(Ptr: IntPtr; S: string);
var
  Bytes: TBytes;
begin
  if (Length(S) = 0) or (S[Length(S)] <> #0) then // make sure string is null terminated
    S := S + #0;
  Bytes := PlatformBytesOf(S);
  Marshal.Copy(Bytes, 0, Ptr, Length(Bytes));
end;
{$ENDIF}

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TFindDialog.Execute(ParentWnd: HWND): Boolean;
{$IF DEFINED(CLR)}
var
  Option: TFindOption;
  Mem: IntPtr;
  EnumProc: TFNWndEnumProc;
  FR : TFindReplace;
begin
  if not Assigned(FResources) then
    FResources := TFindDlgResources.Create;
  if FResources.FFindHandle <> 0 then
  begin
    BringWindowToTop(FResources.FFindHandle);
    Result := True;
  end else
  begin
    if not Assigned(FResources.FObjectInstance) then
    begin
      FResources.FObjectInstance := MakeObjectInstance(MainWndProc);
      FObjectInstance := FResources.FObjectInstance;
    end;
    with FR do
    begin
      lStructSize := Marshal.SizeOf(TypeOf(TFindReplace));
      hInstance := WinUtils.HInstance;
      lCustData := 0;
      lpfnHook := FFRDH;
      FRedirector := TRedirectorWindow.Create(nil);
      with TRedirectorWindow(FRedirector) do
      begin
        FCommonDialog := Self;
        EnumProc := @GetTopWindow; // save a reference to the delegate
        Mem := Marshal.AllocHGlobal(SizeOf(FFormHandle));
        try
          Marshal.WriteInt32(Mem, FFormHandle);
          EnumThreadWindows(GetCurrentThreadID, EnumProc, LPARAM(Mem));
          FFormHandle := Marshal.ReadInt32(Mem);
        finally
          Marshal.FreeHGlobal(Mem);
        end;
      end;
      hWndOwner := FRedirector.Handle;
      Flags := FR_ENABLEHOOK;
      for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        Flags := Flags or FindOptions[Option];
      if Length(Template) > 0 then
      begin
        Flags := Flags or FR_ENABLETEMPLATE;
        lpTemplateName := Template;
        if FTemplateModule <> 0 then
          hInstance := FTemplateModule;
      end;
      wFindWhatLen := FindReplaceStringLen * sizeOf(Char);
      wReplaceWithLen := wFindWhatLen;
      lpstrFindWhat := Marshal.AllocHGlobal(wFindWhatLen);
      try
        WriteStringToPtr(lpstrFindWhat, FFindText);
        lpstrReplaceWith := Marshal.AllocHGlobal(wReplaceWithLen);
        try
          WriteStringToPtr(lpstrReplaceWith, FReplaceText);
        except
          Marshal.FreeHGlobal(lpstrReplaceWith);
          lpstrReplaceWith := nil;
          raise;
        end;
      except
        Marshal.FreeHGlobal(lpstrFindWhat);
        lpstrFindWhat := nil;
        raise;
      end;
    end;
    FResources.FFindReplacePtr := Marshal.AllocHGlobal(FR.lStructSize);
    try
      Marshal.StructureToPtr(TObject(FR), FResources.FFindReplacePtr, False);
      Result := LaunchDialog(FResources.FFindReplacePtr);
    except
      if FResources.FFindReplacePtr <> nil then
      begin
        if FR.lpstrFindWhat <> nil then
          Marshal.FreeHGlobal(FR.lpstrFindWhat);
        if FR.lpstrReplaceWith <> nil then
          Marshal.FreeHGlobal(FR.lpstrReplaceWith);
        Marshal.FreeHGlobal(FResources.FFindReplacePtr);
        FResources.FFindReplacePtr := nil;
      end;
      raise;
    end;
  end;
end;
{$ELSE}
var
  Option: TFindOption;
begin
  if FFindHandle <> 0 then
  begin
    BringWindowToTop(FFindHandle);
    Result := True;
  end else
  begin
    FFindReplace.Flags := FR_ENABLEHOOK;
    FFindReplace.lpfnHook := FindReplaceDialogHook;
    FRedirector := TRedirectorWindow.Create(nil);
    with TRedirectorWindow(FRedirector) do
    begin
      FCommonDialog := Self;
      EnumThreadWindows(GetCurrentThreadID, @GetTopWindow, LPARAM(@FFormHandle));
    end;
    FFindReplace.hWndOwner := FRedirector.Handle;
    for Option := Low(Option) to High(Option) do
      if Option in FOptions then
        FFindReplace.Flags := FFindReplace.Flags or FindOptions[Option];
    if Template <> nil then
    begin
      FFindReplace.Flags := FFindReplace.Flags or FR_ENABLETEMPLATE;
      FFindReplace.lpTemplateName := Template;
    end;
    CreationControl := Self;
    FFindHandle := FFindReplaceFunc(FFindReplace);
    Result := FFindHandle <> 0;
  end;
end;
{$ENDIF}

procedure TFindDialog.Find;
begin
  if Assigned(FOnFind) then FOnFind(Self);
end;

function TFindDialog.GetFindText: string;
begin
  Result := FFindText;
end;

function TFindDialog.GetLeft: Integer;
begin
  Result := Position.X;
end;

function TFindDialog.GetPosition: TPoint;
var
  Rect: TRect;
begin
  Result := FPosition;
{$IF DEFINED(CLR)}
  if Assigned(FResources) and (FResources.FFindHandle <> 0) then
  with FResources do
{$ELSE}
  if FFindHandle <> 0 then
{$ENDIF}
  begin
    GetWindowRect(FFindHandle, Rect);
    Result := Rect.TopLeft;
  end;
end;

function TFindDialog.GetReplaceText: string;
begin
  Result := FReplaceText;
end;

function TFindDialog.GetTop: Integer;
begin
  Result := Position.Y;
end;

function TFindDialog.MessageHook(var Msg: TMessage): Boolean;
var
  Option: TFindOption;
  Rect: TRect;
{$IF DEFINED(CLR)}
  FFindReplace: TFindReplace;
{$ENDIF}
begin
  Result := inherited MessageHook(Msg);
  if not Result then
{$IF DEFINED(CLR)}
    if (Cardinal(Msg.Msg) = FFindMsg) then
    begin
      FFindReplace := TFindReplace(Marshal.PtrToStructure(IntPtr(Msg.LParam),
        Typeof(TFindReplace)));
      FFindText := Marshal.PtrToStringAuto(FFindReplace.lpstrFindWhat);
      FReplaceText := Marshal.PtrToStringAuto(FFindReplace.lpstrReplaceWith);
{$ELSE}
    if (Msg.Msg = FindMsg) and (Pointer(Msg.LParam) = @FFindReplace) then
    begin
{$ENDIF}
      FOptions := [];
      for Option := Low(Option) to High(Option) do
        if (FFindReplace.Flags and FindOptions[Option]) <> 0 then
          Include(FOptions, Option);
      if (FFindReplace.Flags and FR_FINDNEXT) <> 0 then
        Find
      else
      if (FFindReplace.Flags and (FR_REPLACE or FR_REPLACEALL)) <> 0 then
        Replace
      else
      if (FFindReplace.Flags and FR_DIALOGTERM) <> 0 then
      begin
{$IF DEFINED(CLR)}
        if Assigned(FResources) then
        with FResources do
{$ENDIF}
        begin
          GetWindowRect(FFindHandle, Rect);
          FPosition := Rect.TopLeft;
          FFindHandle := 0;
        end;
        PostMessage(FRedirector.Handle,CM_RELEASE,0,0); // free redirector later
        FRedirector := nil;
      end;
      Result := True;
    end;
  end;

procedure TFindDialog.Replace;
begin
  if Assigned(FOnReplace) then FOnReplace(Self);
end;

procedure TFindDialog.SetFindText(const Value: string);
begin
{$IF DEFINED(CLR)}
  FFindText := Value;
{$ELSE}
  StrLCopy(FFindText, PChar(Value), Length(FFindText) - 1);
{$ENDIF}
end;

procedure TFindDialog.SetLeft(Value: Integer);
begin
  SetPosition(Point(Value, Top));
end;

procedure TFindDialog.SetPosition(const Value: TPoint);
begin
  if (FPosition.X <> Value.X) or (FPosition.Y <> Value.Y) then
  begin
    FPosition := Value;
{$IF DEFINED(CLR)}
    if Assigned(FResources) and (FResources.FFindHandle <> 0) then
    with FResources do
{$ELSE}
    if FFindHandle <> 0 then
{$ENDIF}
      SetWindowPos(FFindHandle, 0, Value.X, Value.Y, 0, 0,
        SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
  end;
end;

procedure TFindDialog.SetReplaceText(const Value: string);
begin
{$IF DEFINED(CLR)}
  FReplaceText := Value;
{$ELSE}
  StrLCopy(FReplaceText, PChar(Value), Length(FReplaceText) - 1);
{$ENDIF}
end;

procedure TFindDialog.SetTop(Value: Integer);
begin
  SetPosition(Point(Left, Value));
end;

{ TReplaceDialog }

{$IF DEFINED(CLR)}
function TReplaceDialog.LaunchDialog(DialogData: IntPtr): Bool;
begin
  if Assigned(FResources) then
  begin
    FResources.FFindHandle := CommDlg.ReplaceText(DialogData);
    Result := FResources.FFindHandle <> 0;
  end else
    Result := False;
end;
{$ELSE}
constructor TReplaceDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFindReplaceFunc := Winapi.CommDlg.ReplaceText;
end;
{$ENDIF}

{ Utility functions }

function AllocCoTaskMemStr(const S: string): LPCWSTR;
{$IF NOT DEFINED(CLR)}
var
  Len: Integer;
{$ENDIF}
begin
{$IF DEFINED(CLR)}
  Result := Marshal.StringToCoTaskMemUni(S);
{$ELSE}
  Len := Length(S);
  Result := CoTaskMemAlloc((Len * SizeOf(WideChar)) + SizeOf(WideChar));
  Result := WStrPLCopy(Result, S, Len);
{$ENDIF}
end;

procedure FreeCoTaskMemStr(const S: LPCWSTR); inline;
begin
{$IF DEFINED(CLR)}
    Marshal.FreeCoTaskMem(S);
{$ELSE}
    CoTaskMemFree(S);
{$ENDIF}
end;

function WStrPtrToString(const S: LPCWSTR): string; inline;
begin
{$IF DEFINED(CLR)}
  Result := Marshal.PtrToStringUni(S);
{$ELSE}
  Result := S;
{$ENDIF}
end;

{ TFileDialogFileType }

constructor TFileTypeItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FDisplayNameWStr := nil;
  FFileMaskWStr := nil;
end;

destructor TFileTypeItem.Destroy;
begin
  if FDisplayNameWStr <> nil then
    FreeCoTaskMemStr(FDisplayNameWStr);
  if FFileMaskWStr <> nil then
    FreeCoTaskMemStr(FFileMaskWStr);
  inherited;
end;

function TFileTypeItem.GetDisplayNameWStr: LPCWSTR;
begin
  if FDisplayNameWStr <> nil then
    FreeCoTaskMemStr(FDisplayNameWStr);
  FDisplayNameWStr := AllocCoTaskMemStr(FDisplayName);
  Result := FDisplayNameWStr;
end;

function TFileTypeItem.GetDisplayName: string;
begin
  if FDisplayName <> '' then
    Result := FDisplayName
  else
    Result := inherited GetDisplayName;
end;

function TFileTypeItem.GetFileMaskWStr: LPCWSTR;
begin
  if FFileMaskWStr <> nil then
    FreeCoTaskMemStr(FFileMaskWStr);
  FFileMaskWStr := AllocCoTaskMemStr(FFileMask);
  Result := FFileMaskWStr;
end;

{ TFileDialogFileTypes }

function TFileTypeItems.Add: TFileTypeItem;
begin
  Result := TFileTypeItem(inherited Add);
end;

function TFileTypeItems.FilterSpecArray: TComdlgFilterSpecArray;
var
  I: Integer;
begin
  SetLength(Result, Count);
  for I := 0 to Count - 1 do
  begin
    Result[I].pszName := Items[I].DisplayNameWStr;
    Result[I].pszSpec := Items[I].FileMaskWStr;
  end;
end;

function TFileTypeItems.GetItem(Index: Integer): TFileTypeItem;
begin
  Result := TFileTypeItem(inherited GetItem(Index));
end;

procedure TFileTypeItems.SetItem(Index: Integer; const Value: TFileTypeItem);
begin
  inherited SetItem(Index, Value);
end;

{ TFilePlacesEnumerator }

constructor TFavoriteLinkItemsEnumerator.Create(ACollection: TFavoriteLinkItems);
begin
  inherited Create;
  FIndex := -1;
  FCollection := ACollection;
end;

function TFavoriteLinkItemsEnumerator.GetCurrent: TFavoriteLinkItem;
begin
  Result := FCollection[FIndex];
end;

function TFavoriteLinkItemsEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCollection.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TFilePlaceItem }

function TFavoriteLinkItem.GetDisplayName: string;
begin
  if FLocation <> '' then
    Result := FLocation
  else
    Result := inherited GetDisplayName;
end;

{ TFilePlaces }

function TFavoriteLinkItems.Add: TFavoriteLinkItem;
begin
  Result := TFavoriteLinkItem(inherited Add);
end;

function TFavoriteLinkItems.GetEnumerator: TFavoriteLinkItemsEnumerator;
begin
  Result := TFavoriteLinkItemsEnumerator.Create(Self);
end;

function TFavoriteLinkItems.GetItem(Index: Integer): TFavoriteLinkItem;
begin
  Result := TFavoriteLinkItem(inherited GetItem(Index));
end;

procedure TFavoriteLinkItems.SetItem(Index: Integer; const Value: TFavoriteLinkItem);
begin
  inherited SetItem(Index, Value);
end;

{ TFileDialogEvents }

type
  TFileDialogEvents = class(TInterfacedObject, IFileDialogEvents)
  private
    FFileDialog: TCustomFileDialog;
    FRetrieveHandle: Boolean;
  public
    constructor Create(AFileDialog: TCustomFileDialog);
    { IFileDialogEvents }
    function OnFileOk(const pfd: IFileDialog): HResult; {$IFNDEF CLR}stdcall;{$ENDIF}
    function OnFolderChanging(const pfd: IFileDialog;
      const psiFolder: IShellItem): HResult; {$IFNDEF CLR}stdcall;{$ENDIF}
    function OnFolderChange(const pfd: IFileDialog): HResult; {$IFNDEF CLR}stdcall;{$ENDIF}
    function OnSelectionChange(const pfd: IFileDialog): HResult; {$IFNDEF CLR}stdcall;{$ENDIF}
    function OnShareViolation(const pfd: IFileDialog; const psi: IShellItem;
      out pResponse: DWORD): HResult; {$IFNDEF CLR}stdcall;{$ENDIF}
    function OnTypeChange(const pfd: IFileDialog): HResult; {$IFNDEF CLR}stdcall;{$ENDIF}
    function OnOverwrite(const pfd: IFileDialog; const psi: IShellItem;
      out pResponse: DWORD): HResult; {$IFNDEF CLR}stdcall;{$ENDIF}
  end;

constructor TFileDialogEvents.Create(AFileDialog: TCustomFileDialog);
begin
  inherited Create;
  FFileDialog := AFileDialog;
  FRetrieveHandle := True;
end;

function TFileDialogEvents.OnFileOk(const pfd: IFileDialog): HResult;
begin
  if Assigned(FFileDialog.OnFileOkClick) then
    Result := FFileDialog.FileOkClick
  else
    Result := E_NOTIMPL;
end;

function TFileDialogEvents.OnFolderChange(const pfd: IFileDialog): HResult;
begin
  if Assigned(FFileDialog.OnFolderChange) then
    Result := FFileDialog.FolderChange
  else
    Result := E_NOTIMPL;
end;

function TFileDialogEvents.OnFolderChanging(const pfd: IFileDialog;
  const psiFolder: IShellItem): HResult;
begin
  if Assigned(FFileDialog.OnFolderChanging) then
    Result := FFileDialog.FolderChanging(psiFolder)
  else
    Result := E_NOTIMPL;
end;

function TFileDialogEvents.OnOverwrite(const pfd: IFileDialog;
  const psi: IShellItem; out pResponse: DWORD): HResult;
begin
  if Assigned(FFileDialog.OnOverwrite) then
    Result := FFileDialog.Overwrite(psi, pResponse)
  else
    Result := E_NOTIMPL;
end;

function TFileDialogEvents.OnSelectionChange(const pfd: IFileDialog): HResult;
begin
  // OnSelectionChange is called when the dialog is opened, use this
  // to retrieve the window handle if OnTypeChange wasn't triggered.
  if FRetrieveHandle then
  begin
    FFileDialog.GetWindowHandle;
    FRetrieveHandle := False;
  end;

  if Assigned(FFileDialog.OnSelectionChange) then
    Result := FFileDialog.SelectionChange
  else
    Result := E_NOTIMPL;
end;

function TFileDialogEvents.OnShareViolation(const pfd: IFileDialog;
  const psi: IShellItem; out pResponse: DWORD): HResult;
begin
  if Assigned(FFileDialog.OnShareViolation) then
    Result := FFileDialog.ShareViolation(psi, pResponse)
  else
    Result := E_NOTIMPL;
end;

function TFileDialogEvents.OnTypeChange(const pfd: IFileDialog): HResult;
begin
  // OnTypeChange is supposed to always be called when the dialog is
  // opened. In reality it isn't called if you don't assign any FileTypes.
  // Use this to retrieve the window handle, if it's called.
  if FRetrieveHandle then
  begin
    FFileDialog.GetWindowHandle;
    FRetrieveHandle := False;
  end;

  Result := FFileDialog.TypeChange
end;

{ TCustomFileDialog }

constructor TCustomFileDialog.Create(AOwner: TComponent);
begin
  inherited;
  FFiles := TStringList.Create;
  FFileTypeIndex := 1;
  FFileTypes := TFileTypeItems.Create(TFileTypeItem);
  FHandle := 0;
  FOptions := [];
  FFavoriteLinks := TFavoriteLinkItems.Create(TFavoriteLinkItem);
  FShellItem := nil;
  FShellItems := nil;
end;

destructor TCustomFileDialog.Destroy;
begin
  FFiles.Free;
  FFileTypes.Free;
  FFavoriteLinks.Free;
  FShellItem := nil;
  FShellItems := nil;
  inherited;
end;

procedure TCustomFileDialog.DoOnExecute;
begin
  if Assigned(FOnExecute) then
    FOnExecute(Self);
end;

function TCustomFileDialog.DoOnFileOkClick: Boolean;
begin
  Result := True;
  if Assigned(FOnFileOkClick) then
    FOnFileOkClick(Self, Result);
end;

procedure TCustomFileDialog.DoOnFolderChange;
begin
  if Assigned(FOnFolderChange) then
    FOnFolderChange(Self);
end;

function TCustomFileDialog.DoOnFolderChanging: Boolean;
begin
  Result := True;
  if Assigned(FOnFolderChanging) then
    FOnFolderChanging(Self, Result);
end;

procedure TCustomFileDialog.DoOnOverwrite(var Response: TFileDialogOverwriteResponse);
begin
  if Assigned(FOnOverwrite) then
    FOnOverwrite(Self, Response);
end;

procedure TCustomFileDialog.DoOnSelectionChange;
begin
  if Assigned(FOnSelectionChange) then
    FOnSelectionChange(Self);
end;

procedure TCustomFileDialog.DoOnShareViolation(var Response: TFileDialogShareViolationResponse);
begin
  if Assigned(FOnShareViolation) then
    FOnShareViolation(Self, Response);
end;

procedure TCustomFileDialog.DoOnTypeChange;
begin
  if Assigned(FOnTypeChange) then
    FOnTypeChange(Self);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TCustomFileDialog.Execute: Boolean;
var
  ParentWnd: HWND;
  SaveHooks: TStyleManager.TSystemHooks;
begin
  if Application.ModalPopupMode <> pmNone then
  begin
    ParentWnd := Application.ActiveFormHandle;
    if ParentWnd = 0 then
      ParentWnd := Application.Handle;
  end
  else
    ParentWnd := Application.Handle;
  SaveHooks := TStyleManager.SystemHooks;
  TStyleManager.SystemHooks := [];
  Result := Execute(ParentWnd);
  TStyleManager.SystemHooks := SaveHooks;
end;

procedure TCustomFileDialog.SaveActualFolder(Sender: TObject);
begin
  FActualFolder := FFileName;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TCustomFileDialog.Execute(ParentWnd: HWND): Boolean;
const
  CDialogOptions: array[TFileDialogOption] of DWORD = (
    FOS_OVERWRITEPROMPT, FOS_STRICTFILETYPES, FOS_NOCHANGEDIR,
    FOS_PICKFOLDERS, FOS_FORCEFILESYSTEM, FOS_ALLNONSTORAGEITEMS,
    FOS_NOVALIDATE, FOS_ALLOWMULTISELECT, FOS_PATHMUSTEXIST,
    FOS_FILEMUSTEXIST, FOS_CREATEPROMPT, FOS_SHAREAWARE,
    FOS_NOREADONLYRETURN, FOS_NOTESTFILECREATE, FOS_HIDEMRUPLACES,
    FOS_HIDEPINNEDPLACES, FOS_NODEREFERENCELINKS, FOS_DONTADDTORECENT,
    FOS_FORCESHOWHIDDEN, FOS_DEFAULTNOMINIMODE, FOS_FORCEPREVIEWPANEON);
var
  LWindowList: TTaskWindowList;
  LFocusState: TFocusState;
  LPlace: TFavoriteLinkItem;
  LShellItem: IShellItem;
  LAdviseCookie: Cardinal;
  LDialogOptions: Cardinal;
  LDialogEvents: TFileDialogEvents;
  LDialogOption: TFileDialogOption;
  SaveHooks: TStyleManager.TSystemHooks;
begin
  if Win32MajorVersion < 6 then
    raise EPlatformVersionException.CreateResFmt({$IFNDEF CLR}@{$ENDIF}SWindowsVistaRequired, [ClassName]);

  Result := False;
  FDialog := CreateFileDialog;
  if FDialog <> nil then
    try
      with FDialog do
      begin
        // ClientGuid, DefaultExt, FileName, Title, OkButtonLabel, FileNameLabel
        if FClientGuid <> '' then
          SetClientGuid(StringToGUID(FClientGuid));
        if FDefaultExtension <> '' then
          SetDefaultExtension({$IFNDEF CLR}PWideChar{$ENDIF}(FDefaultExtension));
        if FFileName <> '' then
          SetFileName({$IFNDEF CLR}PWideChar{$ENDIF}(FFileName));
        if FFileNameLabel <> '' then
          SetFileNameLabel({$IFNDEF CLR}PWideChar{$ENDIF}(FFileNameLabel));
        if FOkButtonLabel <> '' then
          SetOkButtonLabel({$IFNDEF CLR}PWideChar{$ENDIF}(FOkButtonLabel));
        if FTitle <> '' then
          SetTitle({$IFNDEF CLR}PWideChar{$ENDIF}(FTitle));

        // DefaultFolder
        if FDefaultFolder <> '' then
        begin
          if Succeeded(SHCreateItemFromParsingName({$IFNDEF CLR}PWideChar{$ENDIF}(FDefaultFolder),
             nil, StringToGUID(SID_IShellItem), LShellItem)) then
            SetFolder(LShellItem);
        end;

        // FileTypes, FileTypeIndex
        if FFileTypes.Count > 0 then
        begin
          FDialog.SetFileTypes(FFileTypes.Count, FFileTypes.FilterSpecArray);
          SetFileTypeIndex(FFileTypeIndex);
        end;

        // Options
        LDialogOptions := 0;
        for LDialogOption in Options do
          LDialogOptions := LDialogOptions or CDialogOptions[LDialogOption];
        SetOptions(LDialogOptions);

        // Additional Places
        for LPlace in FFavoriteLinks do
          if Succeeded(SHCreateItemFromParsingName({$IFNDEF CLR}PWideChar{$ENDIF}(LPlace.Location),
             nil, StringToGUID(SID_IShellItem), LShellItem)) then
            AddPlace(LShellItem, FDAP_BOTTOM);

        // Show dialog and get results
        DoOnExecute;
        LWindowList := DisableTaskWindows(ParentWnd);
        LFocusState := SaveFocusState;
        SaveHooks := TStyleManager.SystemHooks;
        TStyleManager.SystemHooks := [];
        try
          LDialogEvents := TFileDialogEvents.Create(Self);
          Advise(LDialogEvents, LAdviseCookie);
          if (fdoPickFolders in FOptions) and (Win32MajorVersion = 6) and (Win32MinorVersion = 0) then // Vista and Windows Server 2008 bug
            OnFolderChange := SaveActualFolder;
          try
            Result := Succeeded(Show(ParentWnd));
            if Result then
              Result := Succeeded(GetResults);
          finally
            Unadvise(LAdviseCookie);
          end;
        finally
          EnableTaskWindows(LWindowList);
          SetActiveWindow(ParentWnd);
          RestoreFocusState(LFocusState);
          TStyleManager.SystemHooks := SaveHooks;
        end;
      end;
    finally
      FDialog := nil;
    end;
end;

function TCustomFileDialog.FileOkClick: HResult;
const
  CResults: array[Boolean] of HResult = (S_FALSE, S_OK);
begin
  Result := GetResults;
  if Succeeded(Result) then
    Result := CResults[DoOnFileOkClick];
  Files.Clear;
end;

function TCustomFileDialog.FolderChange: HResult;
begin
  FFileName := '';
  Result := FDialog.GetFolder(FShellItem);
  if Succeeded(Result) then
  begin
    Result := GetItemName(FShellItem, FFileName);
    if Succeeded(Result) then
      DoOnFolderChange;
  end;
  FShellItem := nil;
end;

function TCustomFileDialog.FolderChanging(psiFolder: IShellItem): HResult;
const
  CResults: array[Boolean] of HResult = (S_FALSE, S_OK);
begin
  FFileName := '';
  FShellItem := psiFolder;
  Result := GetItemName(FShellItem, FFileName);
  if Succeeded(Result) then
    Result := CResults[DoOnFolderChanging];
  FShellItem := nil;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TCustomFileDialog.GetDefaultFolder: string;
begin
  Result := FDefaultFolder;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TCustomFileDialog.GetFileName: TFileName;
var
  LFileName: TFileName;
  pszFileName: LPCWSTR;
begin
  if (FDialog <> nil) and Succeeded(FDialog.GetFolder(FShellItem)) and
    Succeeded(GetItemName(FShellItem, LFileName)) then
    if FFiles.Count = 0 then
    begin
      if Succeeded(FDialog.GetFileName(pszFileName)) then
        try
          FFileName := TPath.Combine(LFileName, WStrPtrToString(pszFileName));
        finally
          FreeCoTaskMemStr(pszFileName);
        end
      else
        FFileName := ''
    end
    else
      FFileName := TPath.Combine(LFileName, FFiles[0]);
  Result := FFileName;
end;

function TCustomFileDialog.GetFileNames(Items: IShellItemArray): HResult;
var
  Count, I: Integer;
  ItemCount: Cardinal;
  LEnumerator: IEnumShellItems;
  LShellItems: array of IShellItem;
begin
  Files.Clear;
  Result := Items.EnumItems(LEnumerator);
  if Succeeded(Result) then
  begin
    Result := Items.GetCount(ItemCount);
    if Succeeded(Result) then
    begin
      SetLength(LShellItems, ItemCount);
      Result := LEnumerator.Next(ItemCount, LShellItems{$IFNDEF CLR}[0]{$ENDIF},
        {$IFNDEF CLR}@{$ENDIF}Count);
      if Succeeded(Result) then
        for I := 0 to Count - 1 do
        begin
          GetItemName(LShellItems[I], FFileName);
          Files.Add(FFileName);
        end;
    end;
    if Files.Count > 0 then
      FFileName := Files[0];
  end;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TCustomFileDialog.GetFiles: TStrings;
begin
  Result := FFiles;
end;

function TCustomFileDialog.GetItemName(Item: IShellItem; var ItemName: TFileName): HResult;
var
  pszItemName: LPCWSTR;
begin
  Result := Item.GetDisplayName(SIGDN_FILESYSPATH, pszItemName);
  if Failed(Result) then
    Result := Item.GetDisplayName(SIGDN_NORMALDISPLAY, pszItemName);
  if Succeeded(Result) then
  try
    ItemName := WStrPtrToString(pszItemName);
  finally
    FreeCoTaskMemStr(pszItemName);
  end;
end;

function TCustomFileDialog.GetResults: HResult;
begin
  Result := FDialog.GetResult(FShellItem);
  if Succeeded(Result) then
  begin
    Result := GetItemName(FShellItem, FFileName);
    //Patch for Vista and Windows Server 2008 bug
    if (fdoPickFolders in FOptions) and (Win32MajorVersion = 6) and (Win32MinorVersion = 0) then
    begin
      if not TDirectory.Exists(FFileName) then
          FFileName := FActualFolder;
    end;
    FFiles.Clear;
    FFiles.Add(FFileName);
  end;
end;

procedure TCustomFileDialog.GetWindowHandle;
var
  LOleWindow: IOleWindow;
begin
  if Supports(FDialog, IOleWindow, LOleWindow) then
    LOleWindow.GetWindow(FHandle);
end;

function TCustomFileDialog.Overwrite(psiFile: IShellItem; var Response: Cardinal): HResult;
var
  LResponse: TFileDialogOverwriteResponse;
begin
  FFileName := '';
  LResponse := forAccept;
  FShellItem := psiFile;
  Result := GetItemName(FShellItem, FFileName);
  if Succeeded(Result) then
    DoOnOverwrite(LResponse);
  Response := Cardinal(LResponse);
  FShellItem := nil;
end;

function TCustomFileDialog.SelectionChange: HResult;
begin
  FFileName := '';
  Result := FDialog.GetCurrentSelection(FShellItem);
  if Succeeded(Result) then
  begin
    Result := GetItemName(FShellItem, FFileName);
    if Succeeded(Result) then
      DoOnSelectionChange;
  end;
  FShellItem := nil;
end;

procedure TCustomFileDialog.SetClientGuid(const Value: string);
begin
  if Value <> FClientGuid then
  begin
    if Value <> '' then
      StringToGUID(Value);
    FClientGuid := Value;
  end;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
procedure TCustomFileDialog.SetDefaultFolder(const Value: string);
begin
  if FDefaultFolder <> Value then
    FDefaultFolder := Value;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
procedure TCustomFileDialog.SetFileName(const Value: TFileName);
begin
  if Value <> FFileName then
    FFileName := Value;
end;

procedure TCustomFileDialog.SetFileTypes(const Value: TFileTypeItems);
begin
  if Value <> nil then
    FFileTypes.Assign(Value);
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
procedure TCustomFileDialog.SetFavoriteLinks(const Value: TFavoriteLinkItems);
begin
  if Value <> nil then
    FFavoriteLinks.Assign(Value);
end;

function TCustomFileDialog.ShareViolation(psiFile: IShellItem;
  var Response: Cardinal): HResult;
var
  LResponse: TFileDialogShareViolationResponse;
begin
  FFileName := '';
  LResponse := fsrAccept;
  FShellItem := psiFile;
  Result := GetItemName(FShellItem, FFileName);
  if Succeeded(Result) then
    DoOnShareViolation(LResponse);
  Response := Cardinal(LResponse);
  FShellItem := nil;
end;

function TCustomFileDialog.TypeChange: HResult;
begin
  Result := FDialog.GetFileTypeIndex(FFileTypeIndex);
  if Assigned(FOnTypeChange) and Succeeded(Result) then
    DoOnTypeChange;
end;

{ TCustomFileOpenDialog }

function TCustomFileOpenDialog.CreateFileDialog: IFileDialog;
var
  LGuid: TGUID;
begin
{$IF DEFINED(CLR)}
  LGuid := Guid.Create(CLSID_FileOpenDialog);
{$ELSE}
  LGuid := CLSID_FileOpenDialog;
{$ENDIF}
  CoCreateInstance(LGuid, nil, CLSCTX_INPROC_SERVER,
    StringToGUID(SID_IFileOpenDialog), Result);
end;

function TCustomFileOpenDialog.GetResults: HResult;
begin
  if not (fdoAllowMultiSelect in Options) then
    Result := inherited GetResults
  else
  begin
    Result := (Dialog as IFileOpenDialog).GetResults(FShellItems);
    if Succeeded(Result) then
      Result := GetFileNames(FShellItems);
  end;
end;

function TCustomFileOpenDialog.SelectionChange: HResult;
begin
  if not (fdoAllowMultiSelect in Options) then
    Result := inherited SelectionChange
  else
  begin
    Result := (Dialog as IFileOpenDialog).GetSelectedItems(FShellItems);
    if Succeeded(Result) then
    begin
      Result := GetFileNames(FShellItems);
      if Succeeded(Result) then
      begin
        Dialog.GetCurrentSelection(FShellItem);
        DoOnSelectionChange;
      end;
      FShellItems := nil;
    end;
  end;
end;

{ TCustomFileSaveDialog }

function TCustomFileSaveDialog.CreateFileDialog: IFileDialog;
var
  LGuid: TGUID;
begin
{$IF DEFINED(CLR)}
  LGuid := Guid.Create(CLSID_FileSaveDialog);
{$ELSE}
  LGuid := CLSID_FileSaveDialog;
{$ENDIF}
  CoCreateInstance(LGuid, nil, CLSCTX_INPROC_SERVER,
    StringToGUID(SID_IFileSaveDialog), Result);
end;

{ TTaskDialogProgressBar }

constructor TTaskDialogProgressBar.Create(AClient: TCustomTaskDialog);
begin
  inherited Create;
  FClient := AClient;
  FMax := 100;
  FMin := 0;
  FPosition := 0;
  FMarqueeSpeed := 0;
  FState := pbsNormal;
end;

procedure TTaskDialogProgressBar.SetMax(const Value: Integer);
begin
  if Value <> FMax then
  begin
    if Value < FMin then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [Classname]);
    FMax := Value;
    if (FClient.Handle <> 0) and not (tfShowMarqueeProgressBar in FClient.Flags) then
      SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_RANGE, 0, MakeLParam(FMin, FMax));
  end;
end;

procedure TTaskDialogProgressBar.SetMin(const Value: Integer);
begin
  if Value <> FMin then
  begin
    if Value > FMax then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [Classname]);
    FMin := Value;
    if (FClient.Handle <> 0) and not (tfShowMarqueeProgressBar in FClient.Flags) then
      SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_RANGE, 0, MakeLParam(FMin, FMax));
  end;
end;

procedure TTaskDialogProgressBar.SetPosition(const Value: Integer);
begin
  if Value <> FPosition then
  begin
    if (Value < 0) or (Value > High(Word)) then
      raise Exception.CreateResFmt({$IFNDEF CLR}@{$ENDIF}SOutOfRange, [0, High(Word)]);
    FPosition := Value;
    if (FClient.Handle <> 0) and not (tfShowMarqueeProgressBar in FClient.Flags) then
      SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_POS, FPosition, 0);
  end;
end;

const
  ProgressBarStates: array[TProgressBarState] of Integer = (PBST_NORMAL, PBST_ERROR, PBST_PAUSED);

procedure TTaskDialogProgressBar.SetState(const Value: TProgressBarState);
begin
  if Value <> FState then
  begin
    FState := Value;
    if (FClient.Handle <> 0) then
      SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_STATE, ProgressBarStates[FState], 0);
  end;
end;

procedure TTaskDialogProgressBar.SetMarqueeSpeed(const Value: Cardinal);
begin
  if Value <> FMarqueeSpeed then
  begin
    FMarqueeSpeed := Value;
    if (FClient.Handle <> 0) and (tfShowMarqueeProgressBar in FClient.Flags) then
      SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_MARQUEE, WPARAM(BOOL(True)), FMarqueeSpeed);
  end;
end;

procedure TTaskDialogProgressBar.Initialize;
begin
  SendMessage(FClient.Handle, TDM_SET_MARQUEE_PROGRESS_BAR,
    WPARAM(BOOL((tfShowMarqueeProgressBar in FClient.Flags))), 0);
  if (tfShowMarqueeProgressBar in FClient.Flags) then
    SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_MARQUEE, WPARAM(BOOL(True)), FMarqueeSpeed)
  else
  begin
    SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_RANGE, 0, MakeLParam(FMin, FMax));
    SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_POS, FPosition, 0);
  end;
  SendMessage(FClient.Handle, TDM_SET_PROGRESS_BAR_STATE, ProgressBarStates[FState], 0);
end;

{ TTaskDialogButton }

constructor TTaskDialogBaseButtonItem.Create(Collection: TCollection);
begin
  inherited;
  FCaption := '';
  FClient := TCustomtaskDialog(Collection.Owner);
  FEnabled := True;
  FModalResult := ID + 100; // Avoid mrNone..mrYesToAll and IDOK..IDCONTINUE
  FTextWStr := nil;
end;

destructor TTaskDialogBaseButtonItem.Destroy;
begin
  if FTextWStr <> nil then
    FreeCoTaskMemStr(FTextWStr);
  inherited;
end;

procedure TTaskDialogBaseButtonItem.DoButtonClick;
begin
  if FClient.Handle <> 0 then
    SendMessage(FClient.Handle, TDM_CLICK_BUTTON, FModalResult, 0);
end;

procedure TTaskDialogBaseButtonItem.DoSetEnabled;
begin
  if FClient.Handle <> 0 then
    SendMessage(FClient.Handle, TDM_ENABLE_BUTTON, FModalResult, LPARAM(FEnabled))
end;

procedure TTaskDialogBaseButtonItem.Click;
begin
  DoButtonClick;
end;

function TTaskDialogBaseButtonItem.GetButtonText: string;
begin
  Result := FCaption;
end;

function TTaskDialogBaseButtonItem.GetDefault: Boolean;
begin
  Result := TTaskDialogButtons(Collection).DefaultButton = Self;
end;

function TTaskDialogBaseButtonItem.GetDisplayName: string;
begin
  Result := FCaption;
  if Result = '' then
    Result := inherited GetDisplayName;
end;

function TTaskDialogBaseButtonItem.GetTextWStr: LPCWSTR;
var
  LText: string;
begin
  LText := GetButtonText;
  if FTextWStr <> nil then
    FreeCoTaskMemStr(FTextWStr);
  FTextWStr := AllocCoTaskMemStr(LText);
  Result := FTextWStr;
end;

procedure TTaskDialogBaseButtonItem.SetCaption(const Value: string);
begin
  if Value <> FCaption then
  begin
    if Value = '' then
      raise Exception.CreateRes({$IFNDEF CLR}@{$ENDIF}SInvalidTaskDlgButtonCaption);
    FCaption := Value;
  end;
end;

procedure TTaskDialogBaseButtonItem.SetDefault(const Value: Boolean);
begin
  if Value then
    TTaskDialogButtons(Collection).DefaultButton := Self
  else if TTaskDialogButtons(Collection).DefaultButton = Self then
    TTaskDialogButtons(Collection).DefaultButton := nil;
end;

procedure TTaskDialogBaseButtonItem.SetEnabled(const Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    DoSetEnabled;
  end;
end;

procedure TTaskDialogBaseButtonItem.SetInitialState;
begin
  if not FEnabled then
    DoSetEnabled;
end;

{ TTaskDialogButtonItem }

constructor TTaskDialogButtonItem.Create(Collection: TCollection);
begin
  inherited;
  Caption := Format(STaskDlgButtonCaption, [ID + 1]);
  FElevationRequired := False;
end;

procedure TTaskDialogButtonItem.DoSetElevationRequired;
begin
  if Client.Handle <> 0 then
    SendMessage(Client.Handle, TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE,
      ModalResult, LPARAM(FElevationRequired))
end;

function TTaskDialogButtonItem.GetButtonText: string;
begin
  if (FCommandLinkHint <> '') and ((tfUseCommandLinks in Client.Flags) or
     (tfUseCommandLinksNoIcon in Client.Flags)) then
    Result := Caption + #10 + FCommandLinkHint
  else
    Result := inherited GetButtonText;
end;

procedure TTaskDialogButtonItem.SetElevationRequired(const Value: Boolean);
begin
  if Value <> FElevationRequired then
  begin
    FElevationRequired := Value;
    DoSetElevationRequired;
  end;
end;

procedure TTaskDialogButtonItem.SetInitialState;
begin
  inherited;
  if FElevationRequired then
    DoSetElevationRequired
end;

{ TTaskDialogRadioButtonItem }

constructor TTaskDialogRadioButtonItem.Create(Collection: TCollection);
begin
  inherited;
  Caption := Format(STaskDlgRadioButtonCaption, [ID + 1]);
end;

procedure TTaskDialogRadioButtonItem.DoButtonClick;
begin
  if Client.Handle <> 0 then
    SendMessage(Client.Handle, TDM_CLICK_RADIO_BUTTON, ModalResult, 0);
end;

procedure TTaskDialogRadioButtonItem.DoSetEnabled;
begin
  if Client.Handle <> 0 then
    SendMessage(Client.Handle, TDM_ENABLE_RADIO_BUTTON, ModalResult, LPARAM(Enabled))
end;

{ TTaskDialogButtonsEnumerator }

constructor TTaskDialogButtonsEnumerator.Create(ACollection: TTaskDialogButtons);
begin
  inherited Create;
  FIndex := -1;
  FCollection := ACollection;
end;

function TTaskDialogButtonsEnumerator.GetCurrent: TTaskDialogBaseButtonItem;
begin
  Result := FCollection[FIndex];
end;

function TTaskDialogButtonsEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCollection.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TTaskDialogButtons }

destructor TTaskDialogButtons.Destroy;
begin
{$IF DEFINED(CLR)}
  if FButtonListPtr <> nil then
    Marshal.FreeHGlobal(FButtonListPtr);
{$ENDIF}
  inherited;
end;

function TTaskDialogButtons.Add: TTaskDialogBaseButtonItem;
begin
  Result := TTaskDialogBaseButtonItem(inherited Add);
end;

function TTaskDialogButtons.Buttons: PTaskDialogButton;
var
  I: Integer;
begin
  SetLength(FButtonList, Count);
  for I := 0 to Count - 1 do
  begin
    FButtonList[I].nButtonID := Items[I].ModalResult;
    FButtonList[I].pszButtonText := Items[I].TextWStr;
  end;
{$IF DEFINED(CLR)}
  if FButtonListPtr <> nil then
    Marshal.FreeHGlobal(FButtonListPtr);
  FButtonListPtr := ArrayToNativeBuf(FButtonList);
{$ELSE}
  FButtonListPtr := @FButtonList[0];
{$ENDIF}
  Result := FButtonListPtr;
end;

function TTaskDialogButtons.FindButton(AModalResult: TModalResult): TTaskDialogBaseButtonItem;
var
  LButton: TTaskDialogBaseButtonItem;
begin
  Result := nil;
  for LButton in Self do
    if LButton.ModalResult = AModalResult then
    begin
      Result := LButton;
      Exit;
    end;
end;

function TTaskDialogButtons.GetEnumerator: TTaskDialogButtonsEnumerator;
begin
  Result := TTaskDialogButtonsEnumerator.Create(Self);
end;

function TTaskDialogButtons.GetItem(Index: Integer): TTaskDialogBaseButtonItem;
begin
  Result := TTaskDialogBaseButtonItem(inherited GetItem(Index));
end;

procedure TTaskDialogButtons.SetDefaultButton(const Value: TTaskDialogBaseButtonItem);
begin
  if Value <> FDefaultButton then
    FDefaultButton := Value;
end;

procedure TTaskDialogButtons.SetInitialState;
var
  LButton: TTaskDialogBaseButtonItem;
begin
  for LButton in Self do
    LButton.SetInitialState;
end;

procedure TTaskDialogButtons.SetItem(Index: Integer; const Value: TTaskDialogBaseButtonItem);
begin
  inherited SetItem(Index, Value);
end;

{ TCustomTaskDialog }

constructor TCustomTaskDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FButtons := TTaskDialogButtons.Create(Self, TTaskDialogButtonItem);
  FCommonButtons := [tcbOk, tcbCancel];
  FCustomFooterIcon := TIcon.Create;
  FCustomMainIcon := TIcon.Create;
  FDefaultButton := tcbOk;
  FFlags := [tfAllowDialogCancellation];
  FFooterIcon := tdiNone;
  FHandle := 0;
  FMainIcon := tdiInformation;
  FProgressBar := TTaskDialogProgressBar.Create(Self);
  FRadioButtons := TTaskDialogButtons.Create(Self, TTaskDialogRadioButtonItem);
end;

destructor TCustomTaskDialog.Destroy;
begin
  FButtons.Free;
  FCustomFooterIcon.Free;
  FCustomMainIcon.Free;
  FProgressBar.Free;
  FRadioButtons.Free;
  inherited;
end;

function TCustomTaskDialog.CallbackProc(hwnd: HWND; msg: UINT; wParam: WPARAM;
  lParam: LPARAM; lpRefData: LONG_PTR): HResult;
var
  LCanClose, LReset: Boolean;
begin
  Result := S_OK;
  case msg of
    TDN_BUTTON_CLICKED:
      begin
        LCanClose := True;
        DoOnButtonClicked(wParam, LCanClose);
        if not LCanClose then
          Result := S_FALSE;
      end;
    TDN_CREATED:
      DoOnDialogCreated;
    TDN_DESTROYED:
      DoOnDialogDestroyed;
    TDN_DIALOG_CONSTRUCTED:
      begin
        FHandle := hwnd;
        FButtons.SetInitialState;
        FRadioButtons.SetInitialState;
        FProgressBar.Initialize;
        DoOnDialogContructed;
      end;
    TDN_EXPANDO_BUTTON_CLICKED:
      DoOnExpandButtonClicked(BOOL(wParam));
    TDN_HELP:
      DoOnHelp;
    TDN_HYPERLINK_CLICKED:
      DoOnHyperlinkClicked(WStrPtrToString(LPCWSTR(lParam)));
    TDN_NAVIGATED:
      DoOnNavigated;
    TDN_RADIO_BUTTON_CLICKED:
      DoOnRadioButtonClicked(wParam);
    TDN_TIMER:
      begin
        LReset := False;
        DoOnTimer(wParam, LReset);
        if LReset then
          Result := S_FALSE;
      end;
    TDN_VERIFICATION_CLICKED:
      DoOnVerificationClicked(wParam = 1);
  end;
end;

{$IF NOT DEFINED(CLR)}
function TaskDialogCallbackProc(hwnd: HWND; msg: UINT; wParam: WPARAM;
  lParam: LPARAM; lpRefData: LONG_PTR): HResult; stdcall;
begin
  Result := TCustomTaskDialog(Pointer(lpRefData)).CallbackProc(hwnd, msg,
    wparam, lparam, 0);
end;
{$ENDIF}

type
{$IF DEFINED(CLR)}
  TTaskDlgIconMapType = Integer;
{$ELSE}
  TTaskDlgIconMapType = PWideChar;
{$ENDIF}

const
  CTaskDlgIcons: array[tdiNone..tdiShield] of TTaskDlgIconMapType = (
{$IF DEFINED(CLR)}
    0,
{$ELSE}
    nil,
{$ENDIF}
    TD_WARNING_ICON, TD_ERROR_ICON, TD_INFORMATION_ICON, TD_SHIELD_ICON);

function TCustomTaskDialog.DoExecute(ParentWnd: HWND): Boolean;
const
  CTaskDlgFlags: array[TTaskDialogFlag] of Cardinal = (
    TDF_Enable_Hyperlinks, TDF_Use_Hicon_Main,
    tdf_Use_Hicon_Footer, TDF_ALLOW_DIALOG_CANCELLATION,
    TDF_USE_COMMAND_LINKS, TDF_USE_COMMAND_LINKS_NO_ICON,
    TDF_EXPAND_FOOTER_AREA, TDF_EXPANDED_BY_DEFAULT,
    TDF_VERIFICATION_FLAG_CHECKED, TDF_SHOW_PROGRESS_BAR,
    TDF_SHOW_MARQUEE_PROGRESS_BAR, TDF_CALLBACK_TIMER,
    TDF_POSITION_RELATIVE_TO_WINDOW, TDF_RTL_LAYOUT,
    TDF_NO_DEFAULT_RADIO_BUTTON, TDF_CAN_BE_MINIMIZED);

  CTaskDlgCommonButtons: array[TTaskDialogCommonButton] of Cardinal = (
    TDCBF_OK_BUTTON, TDCBF_YES_BUTTON, TDCBF_NO_BUTTON,
    TDCBF_CANCEL_BUTTON, TDCBF_RETRY_BUTTON, TDCBF_CLOSE_BUTTON);

  CTaskDlgDefaultButtons: array[TTaskDialogCommonButton] of Integer = (
    IDOK, IDYES, IDNO, IDCANCEL, IDRETRY, IDCLOSE);

var
  LWindowList: TTaskWindowList;
  LModalResult: Integer;
  LRadioButton: Integer;
  LFlag: TTaskDialogFlag;
  LFocusState: TFocusState;
  LVerificationChecked: LongBool;
  LTaskDialog: TTaskDialogConfig;
  LCommonButton: TTaskDialogCommonButton;
begin
  if Win32MajorVersion < 6 then
    raise EPlatformVersionException.CreateResFmt({$IFNDEF CLR}@{$ENDIF}SWindowsVistaRequired, [ClassName]);

{$IF NOT DEFINED(CLR)}
  FillChar(LTaskDialog, SizeOf(LTaskDialog), 0);
{$ENDIF}
  with LTaskDialog do
  begin
    // Set Size, Parent window, Flags
    cbSize := SizeOf(LTaskDialog);
    hwndParent := ParentWnd;
    dwFlags := 0;
    for LFlag := Low(TTaskDialogFlag) to High(TTaskDialogFlag) do
      if LFlag in FFlags then
        dwFlags := dwFlags or CTaskDlgFlags[LFlag];

    // Set CommonButtons
    dwCommonButtons := 0;
    for LCommonButton := Low(TTaskDialogCommonButton) to High(TTaskDialogCommonButton) do
      if LCommonButton in FCommonButtons then
        dwCommonButtons := dwCommonButtons or CTaskDlgCommonButtons[LCommonButton];

    // Set Content, MainInstruction, Title, MainIcon, DefaultButton
    if FText <> '' then
      pszContent := {$IFNDEF CLR}PWideChar{$ENDIF}(FText);
    if FTitle <> '' then
      pszMainInstruction := {$IFNDEF CLR}PWideChar{$ENDIF}(FTitle);
    if FCaption <> '' then
      pszWindowTitle := {$IFNDEF CLR}PWideChar{$ENDIF}(FCaption);
    if tfUseHiconMain in FFlags then
      hMainIcon := FCustomMainIcon.Handle
    else
    begin
      if FMainIcon in [tdiNone..tdiShield] then
        pszMainIcon := LPCWSTR(CTaskDlgIcons[FMainIcon])
      else
        pszMainIcon := LPCWSTR(MakeIntResourceW(Word(FMainIcon)));
    end;
    nDefaultButton := CTaskDlgDefaultButtons[FDefaultButton];

    // Set Footer, FooterIcon
    if FFooterText <> '' then
      pszFooter := {$IFNDEF CLR}PWideChar{$ENDIF}(FFooterText);
    if tfUseHiconFooter in FFlags then
      hFooterIcon := FCustomFooterIcon.Handle
    else
    begin
      if FFooterIcon in [tdiNone..tdiShield] then
        pszFooterIcon := LPCWSTR(CTaskDlgIcons[FFooterIcon])
      else
        pszFooterIcon := LPCWSTR(MakeIntResourceW(Word(FFooterIcon)));
    end;

    // Set VerificationText, ExpandedInformation, CollapsedControlText
    if FVerificationText <> '' then
      pszVerificationText := {$IFNDEF CLR}PWideChar{$ENDIF}(FVerificationText);
    if FExpandedText <> '' then
      pszExpandedInformation := {$IFNDEF CLR}PWideChar{$ENDIF}(FExpandedText);
    if FExpandButtonCaption <> '' then
      pszCollapsedControlText := {$IFNDEF CLR}PWideChar{$ENDIF}(FExpandButtonCaption);

    // Set Buttons
    cButtons := FButtons.Count;
    if cButtons > 0 then
      pButtons := FButtons.Buttons;
    if FButtons.DefaultButton <> nil then
      nDefaultButton := FButtons.DefaultButton.ModalResult;

    // Set RadioButtons
    cRadioButtons := FRadioButtons.Count;
    if cRadioButtons > 0 then
      pRadioButtons := FRadioButtons.Buttons;
    if not (tfNoDefaultRadioButton in FFlags) and (FRadioButtons.DefaultButton <> nil) then
      nDefaultRadioButton := FRadioButtons.DefaultButton.ModalResult;

    // Prepare callback
{$IF DEFINED(CLR)}
    pfCallBack := @CallbackProc;
{$ELSE}
    lpCallbackData := LONG_PTR(Self);
    pfCallback := @TaskDialogCallbackProc;
{$ENDIF}
  end;

  LWindowList := DisableTaskWindows(ParentWnd);
  LFocusState := SaveFocusState;
  try
    Result := TaskDialogIndirect(LTaskDialog, {$IFNDEF CLR}@{$ENDIF}LModalResult,
      {$IFNDEF CLR}@{$ENDIF}LRadioButton, {$IFNDEF CLR}@{$ENDIF}LVerificationChecked) = S_OK;
    FModalResult := LModalResult;
    if Result then
    begin
      FButton := TTaskDialogButtonItem(FButtons.FindButton(FModalResult));
      FRadioButton := TTaskDialogRadioButtonItem(FRadioButtons.FindButton(LRadioButton));
      if LVerificationChecked then
        Include(FFlags, tfVerificationFlagChecked)
      else
        Exclude(FFlags, tfVerificationFlagChecked);
    end;
  finally
    EnableTaskWindows(LWindowList);
    SetActiveWindow(ParentWnd);
    RestoreFocusState(LFocusState);
  end;
end;

procedure TCustomTaskDialog.DoOnButtonClicked(AModalResult: Integer; var CanClose: Boolean);
begin
  if Assigned(FOnButtonClicked) then
  begin
    FButton := TTaskDialogButtonItem(FButtons.FindButton(AModalResult));
    FOnButtonClicked(Self, AModalResult, CanClose);
  end;
end;

procedure TCustomTaskDialog.DoOnDialogCreated;
begin
  if Assigned(FOnDialogCreated) then
    FOnDialogCreated(Self);
end;

procedure TCustomTaskDialog.DoOnDialogDestroyed;
begin
  if Assigned(FOnDialogDestroyed) then
    FOnDialogDestroyed(Self);
end;

procedure TCustomTaskDialog.DoOnDialogContructed;
begin
  if Assigned(FOnDialogConstructed) then
    FOnDialogConstructed(Self);
end;

procedure TCustomTaskDialog.DoOnExpandButtonClicked(Expanded: Boolean);
begin
  if Assigned(FOnExpanded) then
  begin
    FExpanded := Expanded;
    FOnExpanded(Self);
  end;
end;

procedure TCustomTaskDialog.DoOnHelp;
begin
  if FHelpContext <> 0 then
  try
    Application.HelpContext(FHelpContext);
  except
    on E: Exception do
      ShowHelpException(E);
  end;
end;

procedure TCustomTaskDialog.DoOnHyperlinkClicked(const AURL: string);
begin
  if Assigned(FOnHyperlinkClicked) then
  begin
    FURL := AURL;
    FOnHyperlinkClicked(Self);
  end;
end;

procedure TCustomTaskDialog.DoOnNavigated;
begin
  if Assigned(FOnNavigated) then
    FOnNavigated(Self);
end;

procedure TCustomTaskDialog.DoOnRadioButtonClicked(ButtonID: Integer);
begin
  if Assigned(FOnRadioButtonClicked) then
  begin
    FRadioButton := TTaskDialogRadioButtonItem(FRadioButtons.FindButton(ButtonID));
    FOnRadioButtonClicked(Self);
  end;
end;

procedure TCustomTaskDialog.DoOnTimer(TickCount: Cardinal; var Reset: Boolean);
begin
  if Assigned(FOnTimer) then
    FOnTimer(Self, TickCount, Reset);
end;

procedure TCustomTaskDialog.DoOnVerificationClicked(Checked: Boolean);
begin
  if Assigned(FOnVerificationClicked) then
  begin
    if Checked then
      Include(FFlags, tfVerificationFlagChecked)
    else
      Exclude(FFlags, tfVerificationFlagChecked);
    FOnVerificationClicked(Self);
  end;
end;

function TCustomTaskDialog.Execute: Boolean;
var
  LParentWnd: HWND;
begin
  if Assigned(Screen.ActiveForm) and (Screen.ActiveForm.FormStyle <> fsMDIChild) then
    LParentWnd := Screen.ActiveForm.Handle
  else
  begin
    LParentWnd := Application.ActiveFormHandle;
    if LParentWnd = 0 then
      LParentWnd := Application.Handle;
  end;
  Result := Execute(LParentWnd);
end;

function TCustomTaskDialog.Execute(ParentWnd: HWND): Boolean;
begin
  FModalResult := 0;
  Result := DoExecute(ParentWnd);
end;

procedure TCustomTaskDialog.SetButtons(const Value: TTaskDialogButtons);
begin
  if Value <> FButtons then
    FButtons.Assign(Value);
end;

procedure TCustomTaskDialog.SetCustomFooterIcon(const Value: TIcon);
begin
  if Value <> FCustomFooterIcon then
    FCustomFooterIcon.Assign(Value);
end;

procedure TCustomTaskDialog.SetCustomMainIcon(const Value: TIcon);
begin
  if Value <> FCustomMainIcon then
    FCustomMainIcon.Assign(Value);
end;

procedure TCustomTaskDialog.SetExpandedText(const Value: string);
begin
  if Value <> FExpandedText then
  begin
    FExpandedText := Value;
    if FHandle <> 0 then
      SendTextMessage(FHandle, TDM_UPDATE_ELEMENT_TEXT, TDE_EXPANDED_INFORMATION, FExpandedText);
  end;
end;

procedure TCustomTaskDialog.SetFlags(const Value: TTaskDialogFlags);
begin
  if Value <> FFlags then
  begin
    if (tfVerificationFlagChecked in FFlags) <> (tfVerificationFlagChecked in Value) and
       (FHandle <> 0) then
      SendMessage(FHandle, TDM_CLICK_VERIFICATION,
        WPARAM((tfVerificationFlagChecked in Value)), LPARAM(False));
    FFlags := Value;
  end;
end;

procedure TCustomTaskDialog.SetFooterIcon(const Value: TTaskDialogIcon);
begin
  if Value <> FFooterIcon then
  begin
    FFooterIcon := Value;
    if FHandle <> 0 then
      SendMessage(FHandle, TDM_UPDATE_ICON, TDIE_ICON_FOOTER, LPARAM(CTaskDlgIcons[FFooterIcon]));
  end;
end;

procedure TCustomTaskDialog.SetFooterText(const Value: string);
begin
  if Value <> FFooterText then
  begin
    FFooterText := Value;
    if FHandle <> 0 then
      SendTextMessage(FHandle, TDM_UPDATE_ELEMENT_TEXT, TDE_FOOTER, FFooterText);
  end;
end;

procedure TCustomTaskDialog.SetMainIcon(const Value: TTaskDialogIcon);
begin
  if Value <> FMainIcon then
  begin
    FMainIcon := Value;
    if FHandle <> 0 then
      SendMessage(FHandle, TDM_UPDATE_ICON, TDIE_ICON_MAIN, LPARAM(CTaskDlgIcons[FMainIcon]));
  end;
end;

procedure TCustomTaskDialog.SetRadioButtons(const Value: TTaskDialogButtons);
begin
  if Value <> FRadioButtons then
    FRadioButtons.Assign(Value);
end;

procedure TCustomTaskDialog.SetText(const Value: string);
begin
  if Value <> FText then
  begin
    FText := Value;
    if FHandle <> 0 then
      SendTextMessage(FHandle, TDM_UPDATE_ELEMENT_TEXT, TDE_CONTENT, FText);
  end;
end;

procedure TCustomTaskDialog.SetTitle(const Value: string);
begin
  if Value <> FTitle then
  begin
    FTitle := Value;
    if FHandle <> 0 then
      SendTextMessage(FHandle, TDM_UPDATE_ELEMENT_TEXT, TDE_MAIN_INSTRUCTION, FTitle);
  end;
end;

procedure TCustomTaskDialog.ShowHelpException(E: Exception);
var
  Msg: string;
  Flags: Integer;
  SubE: Exception;
begin
  Flags := MB_OK or MB_ICONSTOP;
  if Application.UseRightToLeftReading then
    Flags := Flags or MB_RTLREADING;
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
  if (Msg <> '') and (Msg[Length(Msg)] > '.') then
    Msg := Msg + '.';
{$IF DEFINED(CLR)}
  MessageBox(FHandle, Msg, Application.Title, Flags);
{$ELSE}
  MessageBox(FHandle, PChar(Msg), PChar(Application.Title), Flags);
{$ENDIF}
end;

{ Message dialog }

function GetAveCharSize(Canvas: TCanvas): TPoint;
{$IF DEFINED(CLR)}
var
  I: Integer;
  Buffer: string;
  Size: TSize;
begin
  SetLength(Buffer, 52);
  for I := 0 to 25 do Buffer[I + 1] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 27] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, Size);
  Result.X := Size.cx div 52;
  Result.Y := Size.cy;
end;
{$ELSE}
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;
{$ENDIF}

type
  TMessageForm = class(TForm)
  private
    Message: TLabel;
    procedure HelpButtonClick(Sender: TObject);
  protected
    procedure CustomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WriteToClipBoard(Text: String);
    function GetFormText: String;
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
  end;

constructor TMessageForm.CreateNew(AOwner: TComponent; Dummy: Integer = 0);
begin
  inherited CreateNew(AOwner, Dummy);
  Font.Assign(Screen.MessageFont);
end;

procedure TMessageForm.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TMessageForm.CustomKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = Word('C')) then
  begin
    Beep;
    WriteToClipBoard(GetFormText);
  end;
end;

procedure TMessageForm.WriteToClipBoard(Text: String);
var
  Data: THandle;
{$IF DEFINED(CLR)}
  DataPtr: IntPtr;
  Buffer: TBytes;
{$ELSE}
  DataPtr: Pointer;
{$ENDIF}
begin
  if OpenClipBoard(0) then
  begin
    try
                            
{$IF DEFINED(CLR)}
      Buffer := PlatformBytesOf(Text);
      SetLength(Buffer, Length(Buffer) + Marshal.SystemDefaultCharSize);
      Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, Length(Buffer));
{$ELSE}
      Data := GlobalAlloc(GMEM_MOVEABLE+GMEM_DDESHARE, ByteLength(Text) + SizeOf(Char));
{$ENDIF}
      try
        DataPtr := GlobalLock(Data);
        try
{$IF DEFINED(CLR)}
          Marshal.Copy(Buffer, 0, DataPtr, Length(Buffer));
{$ELSE}
          Move(PChar(Text)^, DataPtr^, ByteLength(Text) + SizeOf(Char));
          EmptyClipBoard;
          SetClipboardData(CF_UNICODETEXT, Data);
{$ENDIF}
        finally
          GlobalUnlock(Data);
        end;
{$IF DEFINED(CLR)}
        EmptyClipBoard;
        if Marshal.SystemDefaultCharSize > 1 then
          SetClipboardData(CF_UNICODETEXT, Data)
        else
          SetClipboardData(CF_TEXT, Data)
{$ENDIF}
      except
        GlobalFree(Data);
        raise;
      end;
    finally
      CloseClipBoard;
    end;
  end
  else
    raise Exception.CreateRes({$IFNDEF CLR}@{$ENDIF}SCannotOpenClipboard);
end;

function TMessageForm.GetFormText: String;
var
  DividerLine, ButtonCaptions: string;
  I: integer;
begin
  DividerLine := StringOfChar('-', 27) + sLineBreak;
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TButton then
      ButtonCaptions := ButtonCaptions + TButton(Components[I]).Caption +
        StringOfChar(' ', 3);
  ButtonCaptions := StringReplace(ButtonCaptions,'&','', [rfReplaceAll]);
  Result := Format('%s%s%s%s%s%s%s%s%s%s', [DividerLine, Caption, sLineBreak,
    DividerLine, Message.Caption, sLineBreak, DividerLine, ButtonCaptions,
    sLineBreak, DividerLine]);
end;

var
{$IF DEFINED(CLR)}
  Captions: array[TMsgDlgType] of string = (SMsgDlgWarning, SMsgDlgError,
    SMsgDlgInformation, SMsgDlgConfirm, '');
  IconIDs: array[TMsgDlgType] of Integer = (IDI_EXCLAMATION, IDI_HAND,
    IDI_ASTERISK, IDI_QUESTION, -1);
  ButtonCaptions: array[TMsgDlgBtn] of string = (
    SMsgDlgYes, SMsgDlgNo, SMsgDlgOK, SMsgDlgCancel, SMsgDlgAbort,
    SMsgDlgRetry, SMsgDlgIgnore, SMsgDlgAll, SMsgDlgNoToAll, SMsgDlgYesToAll,
    SMsgDlgHelp, SMsgDlgClose);
{$ELSE}
  Captions: array[TMsgDlgType] of Pointer = (@SMsgDlgWarning, @SMsgDlgError,
    @SMsgDlgInformation, @SMsgDlgConfirm, nil);
  IconIDs: array[TMsgDlgType] of PChar = (IDI_EXCLAMATION, IDI_HAND,
    IDI_ASTERISK, IDI_QUESTION, nil);
  ButtonCaptions: array[TMsgDlgBtn] of Pointer = (
    @SMsgDlgYes, @SMsgDlgNo, @SMsgDlgOK, @SMsgDlgCancel, @SMsgDlgAbort,
    @SMsgDlgRetry, @SMsgDlgIgnore, @SMsgDlgAll, @SMsgDlgNoToAll, @SMsgDlgYesToAll,
    @SMsgDlgHelp, @SMsgDlgClose);
{$ENDIF}
  ButtonNames: array[TMsgDlgBtn] of string = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help', 'Close');
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll,
    mrYesToAll, 0, mrClose);
  ButtonWidths : array[TMsgDlgBtn] of Integer;  // initialized to zero

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; DefaultButton: TMsgDlgBtn): TForm;
const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcHorzSpacing = 10;
  mcVertSpacing = 10;
  mcButtonWidth = 50;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
var
  DialogUnits: TPoint;
  HorzMargin, VertMargin, HorzSpacing, VertSpacing, ButtonWidth,
  ButtonHeight, ButtonSpacing, ButtonCount, ButtonGroupWidth,
  IconTextWidth, IconTextHeight, X, ALeft: Integer;
  B, CancelButton: TMsgDlgBtn;
{$IF DEFINED(CLR)}
  IconID: Integer;
{$ELSE}
  IconID: PChar;
{$ENDIF}
  TextRect: TRect;
  LButton: TButton;
begin
  Result := TMessageForm.CreateNew(Application);
  with Result do
  begin
    Font := Screen.MessageFont;
    BiDiMode := Application.BiDiMode;
    BorderStyle := bsDialog;
    Canvas.Font := Font;
    KeyPreview := True;
    PopupMode := pmAuto;
    Position := poDesigned;
    OnKeyDown := TMessageForm(Result).CustomKeyDown;
    DialogUnits := GetAveCharSize(Canvas);
    HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
    VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
    HorzSpacing := MulDiv(mcHorzSpacing, DialogUnits.X, 4);
    VertSpacing := MulDiv(mcVertSpacing, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(mcButtonWidth, DialogUnits.X, 4);
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
    begin
      if B in Buttons then
      begin
        if ButtonWidths[B] = 0 then
        begin
          TextRect := Rect(0,0,0,0);
          Winapi.Windows.DrawText( canvas.handle,
{$IF DEFINED(CLR)}
            ButtonCaptions[B], -1,
{$ELSE}
            PChar(LoadResString(ButtonCaptions[B])), -1,
{$ENDIF}
            TextRect, DT_CALCRECT or DT_LEFT or DT_SINGLELINE or
            DrawTextBiDiModeFlagsReadingOnly);
          with TextRect do ButtonWidths[B] := Right - Left + 8;
        end;
        if ButtonWidths[B] > ButtonWidth then
          ButtonWidth := ButtonWidths[B];
      end;
    end;
    ButtonHeight := MulDiv(mcButtonHeight, DialogUnits.Y, 8);
    ButtonSpacing := MulDiv(mcButtonSpacing, DialogUnits.X, 4);
    SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
    DrawText(Canvas.Handle, Msg, Length(Msg)+1, TextRect,
      DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK or
      DrawTextBiDiModeFlagsReadingOnly);
    IconID := IconIDs[DlgType];
    IconTextWidth := TextRect.Right;
    IconTextHeight := TextRect.Bottom;
{$IF DEFINED(CLR)}
    if DlgType <> mtCustom then
{$ELSE}
    if IconID <> nil then
{$ENDIF}
    begin
      Inc(IconTextWidth, 32 + HorzSpacing);
      if IconTextHeight < 32 then IconTextHeight := 32;
    end;
    ButtonCount := 0;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then Inc(ButtonCount);
    ButtonGroupWidth := 0;
    if ButtonCount <> 0 then
      ButtonGroupWidth := ButtonWidth * ButtonCount +
        ButtonSpacing * (ButtonCount - 1);
    ClientWidth := Max(IconTextWidth, ButtonGroupWidth) + HorzMargin * 2;
    ClientHeight := IconTextHeight + ButtonHeight + VertSpacing +
      VertMargin * 2;
    Left := (Screen.Width div 2) - (Width div 2);
    Top := (Screen.Height div 2) - (Height div 2);
    if DlgType <> mtCustom then
{$IF DEFINED(CLR)}
      Caption := Captions[DlgType] else
      Caption := Application.Title;
    if DlgType <> mtCustom then
{$ELSE}
      Caption := LoadResString(Captions[DlgType]) else
      Caption := Application.Title;
    if IconID <> nil then
{$ENDIF}
      with TImage.Create(Result) do
      begin
        Name := 'Image';
        Parent := Result;
        Picture.Icon.Handle := LoadIcon(0, IconID);
        AutoSize := True;
        SetBounds(HorzMargin, VertMargin, 32, 32);
      end;
    TMessageForm(Result).Message := TLabel.Create(Result);
    with TMessageForm(Result).Message do
    begin
      Name := 'Message';
      Parent := Result;
      WordWrap := True;
      Caption := Msg;
      BoundsRect := TextRect;
      BiDiMode := Result.BiDiMode;
      ALeft := IconTextWidth - TextRect.Right + HorzMargin;
      if UseRightToLeftAlignment then
        ALeft := Result.ClientWidth - ALeft - Width;
      SetBounds(ALeft, VertMargin,
        TextRect.Right, TextRect.Bottom);
    end;
    if mbCancel in Buttons then CancelButton := mbCancel else
      if mbNo in Buttons then CancelButton := mbNo else
        CancelButton := mbOk;
    X := (ClientWidth - ButtonGroupWidth) div 2;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then
      begin
        LButton := TButton.Create(Result);
        with LButton do
        begin
          Name := ButtonNames[B];
          Parent := Result;
{$IF DEFINED(CLR)}
          Caption := ButtonCaptions[B];
{$ELSE}
          Caption := LoadResString(ButtonCaptions[B]);
{$ENDIF}
          ModalResult := ModalResults[B];
          if B = DefaultButton then
          begin
            Default := True;
            ActiveControl := LButton;
          end;
          if B = CancelButton then
            Cancel := True;
          SetBounds(X, IconTextHeight + VertMargin + VertSpacing,
            ButtonWidth, ButtonHeight);
          Inc(X, ButtonWidth + ButtonSpacing);
          if B = mbHelp then
            OnClick := TMessageForm(Result).HelpButtonClick;
        end;
      end;
  end;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function CreateMessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons): TForm;
var
  DefaultButton: TMsgDlgBtn;
begin
  if mbOk in Buttons then DefaultButton := mbOk else
    if mbYes in Buttons then DefaultButton := mbYes else
      DefaultButton := mbRetry;
  Result := CreateMessageDialog(Msg, DlgType, Buttons, DefaultButton);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;
begin
  Result := MessageDlgPosHelp(Msg, DlgType, Buttons, HelpCtx, -1, -1, '');
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer; overload;
begin
  Result := MessageDlgPosHelp(Msg, DlgType, Buttons, HelpCtx, -1, -1, '', DefaultButton);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TaskMessageDlg(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;
begin
  Result := TaskMessageDlgPosHelp(Title, Msg, DlgType, Buttons, HelpCtx, -1, -1, '');
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TaskMessageDlg(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; DefaultButton: TMsgDlgBtn): Integer; overload;
begin
  Result := TaskMessageDlgPosHelp(Title, Msg, DlgType, Buttons, HelpCtx,
    -1, -1, '', DefaultButton);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): Integer;
begin
  Result := MessageDlgPosHelp(Msg, DlgType, Buttons, HelpCtx, X, Y, '');
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function MessageDlgPos(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  DefaultButton: TMsgDlgBtn): Integer; overload;
begin
  Result := MessageDlgPosHelp(Msg, DlgType, Buttons, HelpCtx, X, Y, '', DefaultButton);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TaskMessageDlgPos(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): Integer;
begin
  Result := TaskMessageDlgPosHelp(Title, Msg, DlgType, Buttons, HelpCtx, X, Y, '');
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TaskMessageDlgPos(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  DefaultButton: TMsgDlgBtn): Integer; overload;
begin
  Result := TaskMessageDlgPosHelp(Title, Msg, DlgType, Buttons, HelpCtx,
    X, Y, '', DefaultButton);
end;

function DoMessageDlgPosHelp(MessageDialog: TForm; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer;
begin
  with MessageDialog do
    try
      HelpContext := HelpCtx;
      HelpFile := HelpFileName;
      if X >= 0 then Left := X;
      if Y >= 0 then Top := Y;
      if (Y < 0) and (X < 0) then Position := poScreenCenter;
      Result := ShowModal;
    finally
      Free;
    end;
end;

{ Forward declarations for TaskDialog based implementations }

function DoTaskMessageDlgPosHelp(const Instruction, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer; overload; forward;

function DoTaskMessageDlgPosHelp(const Instruction, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string; DefaultButton: TMsgDlgBtn): Integer; overload; forward;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer;
begin
  if TOSVersion.Check(6) and UseLatestCommonDialogs and
     IsNewCommonCtrl and StyleServices.IsSystemStyle then
    Result := DoTaskMessageDlgPosHelp('', Msg, DlgType, Buttons,
      HelpCtx, X, Y, HelpFileName)
  else
    Result := DoMessageDlgPosHelp(CreateMessageDialog(Msg, DlgType, Buttons),
      HelpCtx, X, Y, HelpFileName);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function MessageDlgPosHelp(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string; DefaultButton: TMsgDlgBtn): Integer; overload;
begin
  if TOSVersion.Check(6) and UseLatestCommonDialogs and
     IsNewCommonCtrl and StyleServices.IsSystemStyle then
    Result := DoTaskMessageDlgPosHelp('', Msg, DlgType, Buttons,
      HelpCtx, X, Y, HelpFileName, DefaultButton)
  else
    Result := DoMessageDlgPosHelp(CreateMessageDialog(Msg, DlgType, Buttons, DefaultButton),
      HelpCtx, X, Y, HelpFileName);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TaskMessageDlgPosHelp(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer;
begin
  if (Win32MajorVersion >= 6) and IsNewCommonCtrl then
    Result := DoTaskMessageDlgPosHelp(Title, Msg, DlgType, Buttons,
      HelpCtx, X, Y, HelpFileName)
  else
    Result := DoMessageDlgPosHelp(CreateMessageDialog(Msg, DlgType, Buttons),
      HelpCtx, X, Y, HelpFileName);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function TaskMessageDlgPosHelp(const Title, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string; DefaultButton: TMsgDlgBtn): Integer;
begin
  if (Win32MajorVersion >= 6) and IsNewCommonCtrl then
    Result := DoTaskMessageDlgPosHelp(Title, Msg, DlgType, Buttons,
      HelpCtx, X, Y, HelpFileName, DefaultButton)
  else
    Result := DoMessageDlgPosHelp(CreateMessageDialog(Msg, DlgType, Buttons, DefaultButton),
      HelpCtx, X, Y, HelpFileName);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
procedure ShowMessage(const Msg: string);
begin
  ShowMessagePos(Msg, -1, -1);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
procedure ShowMessageFmt(const Msg: string; Params: array of const);
begin
  ShowMessage(Format(Msg, Params));
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
procedure ShowMessagePos(const Msg: string; X, Y: Integer);
begin
  MessageDlgPos(Msg, mtCustom, [mbOK], 0, X, Y);
end;

{ TaskDialog based message dialog; requires Windows Vista or later }

type
  TTaskMessageDialog = class(TCustomTaskDialog)
  private
    FHelpFile: string;
    FParentWnd: HWND;
    FPosition: TPoint;
  strict protected
    procedure DoOnButtonClicked(AModalResult: Integer; var CanClose: Boolean); override;
    procedure DoOnDialogCreated; override;
    procedure DoOnHelp; override;
  public
    function Execute(ParentWnd: HWND): Boolean; overload; override;
    property HelpFile: string read FHelpFile write FHelpFile;
    property Position: TPoint read FPosition write FPosition;
  end;

const
  tdbHelp = -1;

procedure TTaskMessageDialog.DoOnButtonClicked(AModalResult: Integer;
  var CanClose: Boolean);
begin
  if AModalResult = tdbHelp then
  begin
    CanClose := False;
    DoOnHelp;
  end;
end;

procedure TTaskMessageDialog.DoOnDialogCreated;
var
  Rect: TRect;
  LX, LY: Integer;
  LHandle: HMONITOR;
  LMonitorInfo: TMonitorInfo;
begin
  LX := Position.X;
  LY := Position.Y;
  LHandle := MonitorFromWindow(FParentWnd, MONITOR_DEFAULTTONEAREST);
  LMonitorInfo.cbSize := SizeOf(LMonitorInfo);
  if ((LX < 0) or (LY < 0)) and GetMonitorInfo(LHandle, {$IFNDEF CLR}@{$ENDIF}LMonitorInfo) then
    with LMonitorInfo do
    begin
      GetWindowRect(Handle, Rect);
      if LX = -1 then
        LX := ((rcWork.Right - rcWork.Left) - (Rect.Right - Rect.Left)) div 2 + rcWork.Left;
      if LY = -1 then
        LY := ((rcWork.Bottom - rcWork.Top) - (Rect.Bottom - Rect.Top)) div 2 + rcWork.Top;
    end;
  SetWindowPos(Handle, 0, LX, LY, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;

procedure TTaskMessageDialog.DoOnHelp;
var
  LHelpFile: string;
  LHelpSystem: IHelpSystem;
begin
  if HelpContext <> 0 then
  begin
    if FHelpFile = '' then
      LHelpFile := Application.HelpFile
    else
      LHelpFile := HelpFile;
    if System.HelpIntfs.GetHelpSystem(LHelpSystem) then
    try
      LHelpSystem.Hook(Application.Handle, LHelpFile, HELP_CONTEXT, HelpContext);
    except
      on E: Exception do
        ShowHelpException(E);
    end;
  end;
end;

function TTaskMessageDialog.Execute(ParentWnd: HWND): Boolean;
begin
  FParentWnd := ParentWnd;
  Result := inherited Execute(ParentWnd);
end;

function DoTaskMessageDlgPosHelp(const Instruction, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string; DefaultButton: TMsgDlgBtn): Integer;
const
  IconMap: array[TMsgDlgType] of TTaskDialogIcon = (tdiWarning, tdiError,
    tdiInformation, tdiInformation, tdiNone);
  LModalResults: array[TMsgDlgBtn] of Integer = (mrYes, mrNo, mrOk, mrCancel,
    mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll, mrYesToAll, tdbHelp, mrClose);
var
  DlgBtn: TMsgDlgBtn;
  LTaskDialog: TTaskMessageDialog;
begin
  Application.ModalStarted;
  LTaskDialog := TTaskMessageDialog.Create(nil);
  try
    // Assign buttons
    for DlgBtn := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if DlgBtn in Buttons then
        with LTaskDialog.Buttons.Add do
        begin
{$IF DEFINED(CLR)}
          Caption := ButtonCaptions[DlgBtn];
{$ELSE}
          Caption := LoadResString(ButtonCaptions[DlgBtn]);
{$ENDIF}
          if DlgBtn = DefaultButton then
            Default := True;
          ModalResult := LModalResults[DlgBtn];
        end;

    // Set dialog properties
    with LTaskDialog do
    begin
      if DlgType <> mtCustom then
{$IF DEFINED(CLR)}
        Caption := Captions[DlgType]
{$ELSE}
        Caption := LoadResString(Captions[DlgType])
{$ENDIF}
      else
        Caption := Application.Title;
      CommonButtons := [];
      if Application.UseRightToLeftReading then
        Flags := Flags + [tfRtlLayout];
      HelpContext := HelpCtx;
      HelpFile := HelpFileName;
      MainIcon :=  IconMap[DlgType];
      Position := Point(X, Y);
      Text := Msg;
      Title := Instruction;
    end;

    // Show dialog and return result
    Result := mrNone;
    if LTaskDialog.Execute then
      Result := LTaskDialog.ModalResult;
  finally
    LTaskDialog.Free;
    Application.ModalFinished;
  end;
end;

function DoTaskMessageDlgPosHelp(const Instruction, Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer;
  const HelpFileName: string): Integer;
var
  DefaultButton: TMsgDlgBtn;
begin
  if mbOk in Buttons then DefaultButton := mbOk else
    if mbYes in Buttons then DefaultButton := mbYes else
      DefaultButton := mbRetry;
  Result := DoTaskMessageDlgPosHelp(Instruction, Msg, DlgType, Buttons, HelpCtx,
    X, Y, HelpFileName, DefaultButton);
end;

type
  TInputQueryForm = class(TForm)
  public
    FCloseQueryFunc: TFunc<Boolean>;
    function CloseQuery: Boolean; override;
  end;

function TInputQueryForm.CloseQuery: Boolean;
begin
  Result := (ModalResult = mrCancel) or (not Assigned(FCloseQueryFunc)) or FCloseQueryFunc();
end;

{ Input dialog }

function GetTextBaseline(AControl: TControl; ACanvas: TCanvas): Integer;
var
  tm: TTextMetric;
  ClientRect: TRect;
  Ascent: Integer;
begin
  ClientRect := AControl.ClientRect;
  GetTextMetrics(ACanvas.Handle, tm);
  Ascent := tm.tmAscent + 1;
  Result := ClientRect.Top + Ascent;
  Result := AControl.Parent.ScreenToClient(AControl.ClientToScreen(TPoint.Create(0, Result))).Y - AControl.Top;
end;

function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; CloseQueryFunc: TInputCloseQueryFunc): Boolean;
var
  I, J: Integer;
  Form: TInputQueryForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  PromptCount, CurPrompt: Integer;
  MaxPromptWidth: Integer;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;

  function GetPromptCaption(const ACaption: string): string;
  begin
    if (Length(ACaption) > 1) and (ACaption[1] < #32) then
      Result := Copy(ACaption, 2, MaxInt)
    else
      Result := ACaption;
  end;

  function GetMaxPromptWidth(Canvas: TCanvas): Integer;
  var
    I: Integer;
    LLabel: TLabel;
  begin
    Result := 0;
    // Use a TLabel rather than an API such as GetTextExtentPoint32 to
    // avoid differences in handling characters such as line breaks.
    LLabel := TLabel.Create(nil);
    try
      for I := 0 to PromptCount - 1 do
      begin
        LLabel.Caption := GetPromptCaption(APrompts[I]);
        Result := Max(Result, LLabel.Width + DialogUnits.X);
      end;
    finally
      LLabel.Free;
    end;
  end;

  function GetPasswordChar(const ACaption: string): Char;
  begin
    if (Length(ACaption) > 1) and (ACaption[1] < #32) then
      Result := '*'
    else
      Result := #0;
  end;

begin
  if Length(AValues) < Length(APrompts) then
    raise EInvalidOperation.CreateRes(@SPromptArrayTooShort);
  PromptCount := Length(APrompts);
  if PromptCount < 1 then
    raise EInvalidOperation.CreateRes(@SPromptArrayEmpty);
  Result := False;
  Form := TInputQueryForm.CreateNew(Application);
  with Form do
    try
      FCloseQueryFunc :=
        function: Boolean
        var
          I, J: Integer;
          LValues: array of string;
          Control: TControl;
        begin
          Result := True;
          if Assigned(CloseQueryFunc) then
          begin
            SetLength(LValues, PromptCount);
            J := 0;
            for I := 0 to Form.ControlCount - 1 do
            begin
              Control := Form.Controls[I];
              if Control is TEdit then
              begin
                LValues[J] := TEdit(Control).Text;
                Inc(J);
              end;
            end;
            Result := CloseQueryFunc(LValues);
          end;
        end;
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      MaxPromptWidth := GetMaxPromptWidth(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180 + MaxPromptWidth, DialogUnits.X, 4);
      PopupMode := pmAuto;
      Position := poScreenCenter;
      CurPrompt := MulDiv(8, DialogUnits.Y, 8);
      Edit := nil;
      for I := 0 to PromptCount - 1 do
      begin
        Prompt := TLabel.Create(Form);
        with Prompt do
        begin
          Parent := Form;
          Caption := GetPromptCaption(APrompts[I]);
          Left := MulDiv(8, DialogUnits.X, 4);
          Top := CurPrompt;
          Constraints.MaxWidth := MaxPromptWidth;
          WordWrap := True;
        end;
        Edit := TEdit.Create(Form);
        with Edit do
        begin
          Parent := Form;
          PasswordChar := GetPasswordChar(APrompts[I]);
          Left := Prompt.Left + MaxPromptWidth;
          Top := Prompt.Top + Prompt.Height - DialogUnits.Y -
            (GetTextBaseline(Edit, Canvas) - GetTextBaseline(Prompt, Canvas));
          Width := Form.ClientWidth - Left - MulDiv(8, DialogUnits.X, 4);
          MaxLength := 255;
          Text := AValues[I];
          SelectAll;
          Prompt.FocusControl := Edit;
        end;
        CurPrompt := Edit.Top + Edit.Height + 5;
      end;
      ButtonTop := Edit.Top + Edit.Height + 15;
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgOK;
        ModalResult := mrOk;
        Default := True;
        SetBounds(Form.ClientWidth - (ButtonWidth + MulDiv(8, DialogUnits.X, 4)) * 2, ButtonTop, ButtonWidth, ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgCancel;
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(Form.ClientWidth - (ButtonWidth + MulDiv(8, DialogUnits.X, 4)), ButtonTop, ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        J := 0;
        for I := 0 to ControlCount - 1 do
          if Controls[I] is TEdit then
          begin
            Edit := TEdit(Controls[I]);
            AValues[J] := Edit.Text;
            Inc(J);
          end;
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;

function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string; CloseQueryEvent: TInputCloseQueryEvent; Context: TObject): Boolean;
begin
  Result := InputQuery(ACaption, APrompts, AValues,
    function (const Values: array of string): Boolean
    begin
      Result := True;
      CloseQueryEvent(Context, Values, Result);
    end)
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function InputQuery(const ACaption, APrompt: string; var Value: string): Boolean;
var
  Values: array[0..0] of string;
begin
  Values[0] := Value;
  Result := InputQuery(ACaption, [APrompt], Values);
  if Result then
    Value := Values[0];
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function InputBox(const ACaption, APrompt, ADefault: string): string;
begin
  Result := ADefault;
  InputQuery(ACaption, APrompt, Result);
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.SafeSubWindows)]
function PromptForFileName(var AFileName: string; const AFilter: string = '';
  const ADefaultExt: string = ''; const ATitle: string = '';
  const AInitialDir: string = ''; SaveDialog: Boolean = False): Boolean;
var
  Dialog: TOpenDialog;
begin
  if SaveDialog then
  begin
    Dialog := TSaveDialog.Create(nil);
    Dialog.Options := Dialog.Options + [ofOverwritePrompt];
  end
  else
    Dialog := TOpenDialog.Create(nil);
  with Dialog do
  try
    Title := ATitle;
    DefaultExt := ADefaultExt;
    if AFilter = '' then
      Filter := SDefaultFilter else
      Filter := AFilter;
    InitialDir := AInitialDir;
    FileName := AFileName;
    Result := Execute;
    if Result then
      AFileName := FileName;
  finally
    Free;
  end;
end;

type
  TDefaultLoginCredentials = class sealed
    class procedure LoginEvent(Sender: TObject; Callback: TLoginCredentialService.TLoginEvent; var Success: Boolean);
    class procedure LoginEventUsrPw(Sender: TObject; Callback: TLoginCredentialService.TLoginEvent; var Success: Boolean);
  end;

class procedure TDefaultLoginCredentials.LoginEvent(Sender: TObject; Callback: TLoginCredentialService.TLoginEvent; var Success: Boolean);
var
  Values: TArray<string>;
begin
  SetLength(Values, 3);
  Success := InputQuery(SLogin, [SUsername, #31 + SPassword, SDomain], Values,
    function (const Values: array of string): Boolean
    begin
      Result := True;
      Callback(Sender, Values[0], Values[1], Values[2], Result);
    end);
end;

class procedure TDefaultLoginCredentials.LoginEventUsrPw(Sender: TObject; Callback: TLoginCredentialService.TLoginEvent; var Success: Boolean);
var
  Values: TArray<string>;
begin
  SetLength(Values, 2);
  Success := InputQuery(SLogin, [SUsername, #31 + SPassword], Values,
    function (const Values: array of string): Boolean
    begin
      Result := True;
      Callback(Sender, Values[0], Values[1], '', Result);
    end);
end;

{ Initialization and cleanup }

{$IF NOT DEFINED(CLR)}
procedure InitGlobals;
var
  AtomText: array[0..31] of Char;
begin
  HelpMsg := RegisterWindowMessage(HelpMsgString);
  FindMsg := RegisterWindowMessage(FindMsgString);
  WndProcPtrAtom := GlobalAddAtom(StrFmt(AtomText,
    'WndProcPtr%.8X%.8X', [HInstance, GetCurrentThreadID]));
end;

initialization
  InitGlobals;
  StartClassGroup(TControl);
  ActivateClassGroup(TControl);
  GroupDescendentsWith(TCommonDialog, TControl);
  GroupDescendentsWith(TCustomFileDialog, TControl);
  TLoginCredentialService.RegisterLoginHandler(TLoginCredentialService.Default, TDefaultLoginCredentials.LoginEventUsrPw);
  TLoginCredentialService.RegisterLoginHandler(TLoginCredentialService.DefaultUsrPwDm, TDefaultLoginCredentials.LoginEvent);
  TLoginCredentialService.RegisterLoginHandler(TLoginCredentialService.DefaultUsrPw, TDefaultLoginCredentials.LoginEventUsrPw);
finalization
  TLoginCredentialService.UnregisterLoginHandler(TLoginCredentialService.DefaultUsrPw, TDefaultLoginCredentials.LoginEventUsrPw);
  TLoginCredentialService.UnregisterLoginHandler(TLoginCredentialService.DefaultUsrPwDm, TDefaultLoginCredentials.LoginEvent);
  TLoginCredentialService.UnregisterLoginHandler(TLoginCredentialService.Default, TDefaultLoginCredentials.LoginEventUsrPw);
  if WndProcPtrAtom <> 0 then GlobalDeleteAtom(WndProcPtrAtom);
{$ENDIF}
end.
