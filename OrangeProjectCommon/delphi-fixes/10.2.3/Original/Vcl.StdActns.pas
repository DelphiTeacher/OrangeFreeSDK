{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.StdActns;

{$H+,X+}

interface

uses Winapi.Windows, Winapi.ShlObj, System.SysUtils, System.Classes, Vcl.ActnList, Vcl.StdCtrls, Vcl.Forms, Vcl.Dialogs;

type

{ Hint actions }

  THintAction = class(TCustomAction)
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Hint;
  end;

{ Edit actions }

  TEditAction = class(TAction)
  private
    FControl: TCustomEdit;
    procedure SetControl(Value: TCustomEdit);
  protected
    function GetControl(Target: TObject): TCustomEdit; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    property Control: TCustomEdit read FControl write SetControl;
  end;

  TEditCut = class(TEditAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TEditCopy = class(TEditAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TEditPaste = class(TEditAction)
  public
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TEditSelectAll = class(TEditAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  end;

  TEditUndo = class(TEditAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  end;

  TEditDelete = class(TEditAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    { UpdateTarget is required because TEditAction.UpdateTarget specifically
      checks to see if the action is TEditCut or TEditCopy }
    procedure UpdateTarget(Target: TObject); override;
  end;

{ MDI Window actions }

  TWindowAction = class(TAction)
  private
    FForm: TCustomForm;
    procedure SetForm(Value: TCustomForm);
  protected
    function GetForm(Target: TObject): TForm; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    property Form: TCustomForm read FForm write SetForm;
  end;

  TWindowClose = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  end;

  TWindowCascade = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TWindowTileHorizontal = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TWindowTileVertical = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TWindowMinimizeAll = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TWindowArrange = class(TWindowAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

{ Help actions }

  THelpAction = class(TAction)
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
  end;

  THelpContents = class(THelpAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  THelpTopicSearch = class(THelpAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  THelpOnHelp = class(THelpAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
  end;

  THelpContextAction = class(THelpAction)
  public
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
  end;

{ TCommonDialogAction }

  TCommonDialogClass = class of TCommonDialog;

  TCommonDialogAction = class(TCustomAction)
  private
    FExecuteResult: Boolean;
    FOnAccept: TNotifyEvent;
    FOnCancel: TNotifyEvent;
    FBeforeExecute: TNotifyEvent;
  protected
    FDialog: TCommonDialog;
    procedure DoAccept; virtual;
    procedure DoCancel; virtual;
    function GetDialogClass: TCommonDialogClass; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetupDialog; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    property ExecuteResult: Boolean read FExecuteResult;
    property BeforeExecute: TNotifyEvent read FBeforeExecute write FBeforeExecute;
    property OnAccept: TNotifyEvent read FOnAccept write FOnAccept;
    property OnCancel: TNotifyEvent read FOnCancel write FOnCancel;
  end;

{ File Actions }

  TFileAction = class(TCommonDialogAction)
  private
    function GetFileName: TFileName;
    procedure SetFileName(const Value: TFileName);
  protected
    function GetDialog: TOpenDialog;
    property FileName: TFileName read GetFileName write SetFileName;
  end;

  TFileOpen = class(TFileAction)
  private
    FUseDefaultApp: Boolean;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Caption;
    property Dialog: TOpenDialog read GetDialog;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property UseDefaultApp: Boolean read FUseDefaultApp write FUseDefaultApp default False;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

  TFileOpenWith = class(TFileOpen)
  private
    FFileName: TFileName;
    FAfterOpen: TNotifyEvent;
  public
    procedure ExecuteTarget(Target: TObject); override;
  published
    property FileName: TFileName read FFileName write FFileName;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property BeforeExecute;
    property AfterOpen: TNotifyEvent read FAfterOpen write FAfterOpen;
    property OnUpdate;
  end;

  TFileSaveAs = class(TFileAction)
  private
    function GetSaveDialog: TSaveDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Caption;
    property Dialog: TSaveDialog read GetSaveDialog;
    property Enabled;
    property HelpContext;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

  TFilePrintSetup = class(TCommonDialogAction)
  private
    function GetDialog: TPrinterSetupDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  published
    property Caption;
    property Dialog: TPrinterSetupDialog read GetDialog;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

  TFilePageSetup = class(TCommonDialogAction)
  private
    function GetDialog: TPageSetupDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  published
    property Caption;
    property Dialog: TPageSetupDialog read GetDialog;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

  TFileExit = class(TCustomAction)
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Caption;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property OnHint;
    property OnUpdate;
  end;

{ Search Actions }

  TSearchAction = class(TCommonDialogAction)
  protected
    FControl: TCustomEdit;
    FFindFirst: Boolean;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure Search(Sender: TObject); virtual;
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  end;

  TSearchFind = class(TSearchAction)
  private
    function GetFindDialog: TFindDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  published
    property Caption;
    property Dialog: TFindDialog read GetFindDialog;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

  TSearchReplace = class(TSearchAction)
  private
    procedure Replace(Sender: TObject);
    function GetReplaceDialog: TReplaceDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  public
    procedure ExecuteTarget(Target: TObject); override;
    { UpdateTarget is required To check the readonly property }
    procedure UpdateTarget(Target: TObject); override;
  published
    property Caption;
    property Dialog: TReplaceDialog read GetReplaceDialog;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

  TSearchFindFirst = class(TSearchFind)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TSearchFindNext = class(TCustomAction)
  private
    FSearchFind: TSearchFind;
  public
    constructor Create(AOwner: TComponent); override;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property Caption;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property SearchFind: TSearchFind read FSearchFind write FSearchFind;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property OnHint;
    property OnUpdate;
  end;

{ TFontEdit }

  TFontEdit = class(TCommonDialogAction)
  private
    function GetDialog: TFontDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  published
    property Caption;
    property Dialog: TFontDialog read GetDialog;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

{ TColorSelect }

  TColorSelect = class(TCommonDialogAction)
  private
    function GetDialog: TColorDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  published
    property Caption;
    property Dialog: TColorDialog read GetDialog;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

{ TPrintDlg }

  TPrintDlg = class(TCommonDialogAction)
  private
    function GetDialog: TPrintDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
  published
    property Caption;
    property Dialog: TPrintDialog read GetDialog;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    property OnAccept;
    property OnCancel;
    property OnHint;
    property OnUpdate;
  end;

{ TBrowseForFolder }

  TBrowseForFolder = class;
  TBrowseForFolderOption = (bifBrowseForComputer, bifBrowseForPrinter, bifBrowseIncludeFiles,
    bifBrowseIncludeURLS, bifDontGoBelowDomain, bifEditBox, bifNewDialogStyle, bifNoNewFolderButton,
    bifNoTranslateTargets, bifReturnFSAncestors, bifReturnOnlyFSDirs,
    bifShareable, bifStatusText, bifUAHint, bifUseNewUI, bifValidate);

  TBrowseOptions = set of TBrowseForFolderOption;

  /// <summary> Options available to customize the select directory dialog using IFileDialog </summary>
  TBrowseForFolderOptionEx = (bifeHidePinnedPlaces, bifeNoDereferenceLinks, bifeForceShowHidden, bifeAllowMultiselect);
  /// <summary> Set of options to customize the select directory dialog using IFileDialog </summary>
  TBrowseOptionsEx = set of TBrowseForFolderOptionEx;

  TBrowseForFolderCallbackEvent = procedure(Sender: TBrowseForFolder; Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM; var Result: Integer) of object;

  TBrowseForFolder = class(TCommonDialogAction)
  private
    FBrowseOptions: TBrowseOptions;
    FBrowseOptionsEx: TBrowseOptionsEx;
    FFolder: string;
    FFolders: TArray<string>;
    FOnCallback: TBrowseForFolderCallbackEvent;
    FOnValidate: TBrowseForFolderCallbackEvent;
    FRootDir: string;
    FDialogCaption: string;
{$IF DEFINED(CLR)}
    FCallbackDelegate: TFNBFFCallBack;
{$ENDIF}
    FUseFileDialog: Boolean;
    FFolderNameLabel: string;
    FOkButtonLabel: string;
    procedure SetBrowseOptions(const Value: TBrowseOptions);
    function GetDialogCaption: string;
    function GetFolder: string;
    function GetRootDir: string;
    procedure SetFolder(Value: string);
    function GetFolders(Index: Integer): string;
    function GetSelectionCount: Integer;
    procedure SetRootDir(Value: string);
{$IF DEFINED(CLR)}
    function BrowseCallbackProc(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer;
{$ENDIF}
    procedure ExecuteIFileDialog;
  protected
    function GetDialogClass: TCommonDialogClass; override;
    function DoCallback(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer;
    function DoValidate(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer;
  public
    procedure ExecuteTarget(Target: TObject); override;
    property Folder: string read GetFolder write SetFolder;
    /// <summary> Returns the selected folders when bifeAllowMultiselect is enabled. </summary>
    property Folders[Index: Integer]: string read GetFolders;
    /// <summary> Returns the number of selected folders when bifeAllowMultiselect is enabled. </summary>
    property SelectionCount: Integer read GetSelectionCount;
  published
    property Caption;
    property DialogCaption: string read GetDialogCaption write FDialogCaption;
    property BrowseOptions: TBrowseOptions read FBrowseOptions write SetBrowseOptions;
    /// <summary> Set of options to customize the select directory dialog using IFileDialog.
    ///  This applies only when UseFileDialog is set and system supports IFileDialog interface (Windows Vista or later). </summary>
    property BrowseOptionsEx: TBrowseOptionsEx read FBrowseOptionsEx write FBrowseOptionsEx;
    property Enabled;
    property HelpContext;
    property HelpKeyword;
    property HelpType;
    property Hint;
    property ImageIndex;
    property RootDir: string read GetRootDir write SetRootDir;
    property ShortCut;
    property SecondaryShortCuts;
    property Visible;
    property BeforeExecute;
    /// <summary> Enables the use of IFileDialog interface (when supported) rather than ShBrowseForFolder. </summary>
    property UseFileDialog: Boolean read FUseFileDialog write FUseFileDialog default False;
    /// <summary> Allows to customize the dialog folder name label when using IFileDialog.
    ///  This applies only when UseFileDialog is set and system supports IFileDialog interface (Windows Vista or later). </summary>
    property FolderNameLabel: string read FFolderNameLabel write FFolderNameLabel;
    /// <summary> Allows to customize the dialog Ok button caption when using IFileDialog.
    ///  This applies only when UseFileDialog is set and system supports IFileDialog interface (Windows Vista or later). </summary>
    property OkButtonLabel: string read FOkButtonLabel write FOkButtonLabel;
    property OnCallback: TBrowseForFolderCallbackEvent read FOnCallback write FOnCallback;
    property OnValidate: TBrowseForFolderCallbackEvent read FOnValidate write FOnValidate;
    property OnAccept;
    property OnCancel;
    property OnHint;
  end;

implementation

uses
{$IF DEFINED(CLR)}
  System.Runtime.InteropServices, System.Threading,
  System.Security.Permissions, System.IO,
{$ELSE}
  Vcl.Clipbrd,
{$ENDIF}
  Winapi.ActiveX, Winapi.Messages, Winapi.ShellAPI, System.StrUtils, Vcl.Consts, Winapi.RichEdit, Vcl.ComCtrls;

{ THintAction }

constructor THintAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DisableIfNoHandler := False;
end;

{ TEditAction }

destructor TEditAction.Destroy;
begin
  if Assigned(FControl) then
    FControl.RemoveFreeNotification(Self);
  inherited;
end;

function TEditAction.GetControl(Target: TObject): TCustomEdit;
begin
  { We could hard cast Target as a TCustomEdit since HandlesTarget "should" be
    called before ExecuteTarget and UpdateTarget, however, we're being safe. }
  Result := Target as TCustomEdit;
end;

function TEditAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := ((Control <> nil) and (Target = Control) or
    (Control = nil) and (Target is TCustomEdit)) and TCustomEdit(Target).Focused;
end;

procedure TEditAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Control) then Control := nil;
end;

procedure TEditAction.UpdateTarget(Target: TObject);
begin
  if (Self is TEditCut) then
    Enabled := (GetControl(Target).SelLength > 0) and not GetControl(Target).ReadOnly
  else if (Self is TEditCopy) then
    Enabled := (GetControl(Target).SelLength > 0);
end;

procedure TEditAction.SetControl(Value: TCustomEdit);
begin
  if Value <> FControl then
  begin
    FControl := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

{ TEditCopy }

procedure TEditCopy.ExecuteTarget(Target: TObject);
begin
  GetControl(Target).CopyToClipboard;
end;

{ TEditCut }

procedure TEditCut.ExecuteTarget(Target: TObject);
begin
  GetControl(Target).CutToClipboard;
end;

{ TEditPaste }

procedure TEditPaste.ExecuteTarget(Target: TObject);
begin
  GetControl(Target).PasteFromClipboard;
end;

procedure TEditPaste.UpdateTarget(Target: TObject);
begin
{$IF DEFINED(CLR)}
  Enabled := (IsClipboardFormatAvailable(CF_TEXT) or
             IsClipboardFormatAvailable(CF_UNICODETEXT)) and
             not GetControl(Target).ReadOnly;
{$ELSE}
  Enabled := Clipboard.HasFormat(CF_TEXT) and not GetControl(Target).ReadOnly;
{$ENDIF}
end;

{ TEditSelectAll }

procedure TEditSelectAll.ExecuteTarget(Target: TObject);
begin
  GetControl(Target).SelectAll;
end;

procedure TEditSelectAll.UpdateTarget(Target: TObject);
begin
  Enabled := Length(GetControl(Target).Text) > 0;
end;

{ TEditUndo }

procedure TEditUndo.ExecuteTarget(Target: TObject);
begin
  GetControl(Target).Undo;
end;

procedure TEditUndo.UpdateTarget(Target: TObject);
begin
  Enabled := GetControl(Target).CanUndo and not GetControl(Target).ReadOnly;
end;

{ TEditDelete }

procedure TEditDelete.ExecuteTarget(Target: TObject);
begin
  GetControl(Target).ClearSelection;
end;

procedure TEditDelete.UpdateTarget(Target: TObject);
begin
  Enabled := (GetControl(Target).SelLength > 0) and not GetControl(Target).ReadOnly;
end;

{ TWindowAction }

function TWindowAction.GetForm(Target: TObject): TForm;
begin
  { We could hard cast Target as a TForm since HandlesTarget "should" be called
    before ExecuteTarget and UpdateTarget, however, we're being safe. }
  Result := (Target as TForm);
end;

function TWindowAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := ((Form <> nil) and (Target = Form) or
    (Form = nil) and (Target is TForm)) and
    (TForm(Target).FormStyle = fsMDIForm);
end;

procedure TWindowAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Form) then Form := nil;
end;

procedure TWindowAction.UpdateTarget(Target: TObject);
begin
  Enabled := GetForm(Target).MDIChildCount > 0;
end;

procedure TWindowAction.SetForm(Value: TCustomForm);
begin
  if Value <> FForm then
  begin
    FForm := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

constructor TWindowAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DisableIfNoHandler := False;
  Enabled := csDesigning in ComponentState;
end;

{ TWindowClose }

procedure TWindowClose.ExecuteTarget(Target: TObject);
begin
  with GetForm(Target) do
    if ActiveMDIChild <> nil then ActiveMDIChild.Close;
end;

procedure TWindowClose.UpdateTarget(Target: TObject);
begin
  Enabled := GetForm(Target).ActiveMDIChild <> nil;
end;

{ TWindowCascade }

procedure TWindowCascade.ExecuteTarget(Target: TObject);
begin
  GetForm(Target).Cascade;
end;

{ TWindowTileHorizontal }

procedure DoTile(Form: TForm; TileMode: TTileMode);
const
  TileParams: array[TTileMode] of Word = (MDITILE_HORIZONTAL, MDITILE_VERTICAL);
begin
  if (Form.FormStyle = fsMDIForm) and (Form.ClientHandle <> 0) then
    SendMessage(Form.ClientHandle, WM_MDITILE, TileParams[TileMode], 0);
end;

procedure TWindowTileHorizontal.ExecuteTarget(Target: TObject);
begin
  DoTile(GetForm(Target), tbHorizontal);
end;

{ TWindowTileVertical }

procedure TWindowTileVertical.ExecuteTarget(Target: TObject);
begin
  DoTile(GetForm(Target), tbVertical);
end;

{ TWindowMinimizeAll }

procedure TWindowMinimizeAll.ExecuteTarget(Target: TObject);
var
  I: Integer;
begin
  { Must be done backwards through the MDIChildren array }
  with GetForm(Target) do
    for I := MDIChildCount - 1 downto 0 do
      MDIChildren[I].WindowState := wsMinimized;
end;

{ TWindowArrange }

procedure TWindowArrange.ExecuteTarget(Target: TObject);
begin
  GetForm(Target).ArrangeIcons;
end;

{ THelpAction }

constructor THelpAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DisableIfNoHandler := False;
  Enabled := csDesigning in ComponentState;
end;

function THelpAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := True;
end;

procedure THelpAction.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(Application) and (Application.CurrentHelpFile <> '');
end;

{ THelpContents }

procedure THelpContents.ExecuteTarget(Target: TObject);
begin
  Application.HelpCommand(HELP_FINDER, 0);
end;

{ THelpTopicSearch }

procedure THelpTopicSearch.ExecuteTarget(Target: TObject);
{$IF DEFINED(CLR)}
var
  Mem: IntPtr;
begin
  Mem := Marshal.StringToHGlobalAuto('');
  try
    Application.HelpCommand(HELP_FINDER, UIntPtr(Mem));
  finally
    Marshal.FreeHGlobal(Mem);
  end;
end;
{$ELSE}
begin
  Application.HelpCommand(HELP_FINDER, UIntPtr(PChar('')));
end;
{$ENDIF}

{ THelpOnHelp }

procedure THelpOnHelp.ExecuteTarget(Target: TObject);
{$IF DEFINED(CLR)}
var
  Mem: IntPtr;
begin
  Mem := Marshal.StringToHGlobalAuto('');
  try
    Application.HelpCommand(HELP_HELPONHELP, UIntPtr(Mem));
  finally
    Marshal.FreeHGlobal(Mem);
  end;
end;
{$ELSE}
begin
  Application.HelpCommand(HELP_HELPONHELP, UIntPtr(PChar('')));
end;
{$ENDIF}

{ THelpContextAction }

procedure THelpContextAction.ExecuteTarget(Target: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, Screen.ActiveControl.HelpContext);
end;

procedure THelpContextAction.UpdateTarget(Target: TObject);
begin
  Enabled := Assigned(Screen) and Assigned(Screen.ActiveControl) and
    (Screen.ActiveControl.HelpContext <> 0);
end;

{ TCommonDialogAction }

constructor TCommonDialogAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SetupDialog;
  DisableIfNoHandler := False;
  Enabled := True;
end;

destructor TCommonDialogAction.Destroy;
begin
  if Assigned(FDialog) then
    FDialog.RemoveFreeNotification(Self);
  inherited;
end;

procedure TCommonDialogAction.DoAccept;
begin
  if Assigned(FOnAccept) then FOnAccept(Self);
end;

procedure TCommonDialogAction.DoCancel;
begin
  if Assigned(FOnCancel) then FOnCancel(Self);
end;

procedure TCommonDialogAction.ExecuteTarget(Target: TObject);
begin
  FExecuteResult := False;
  if Assigned(FDialog) then
  begin
    if Assigned(FBeforeExecute) then
      FBeforeExecute(Self);
    FExecuteResult := FDialog.Execute;
    if FExecuteResult then
      DoAccept
    else
      DoCancel;
  end;
end;

function TCommonDialogAction.GetDialogClass: TCommonDialogClass;
begin
  Result := nil;
end;

function TCommonDialogAction.Handlestarget(Target: TObject): Boolean;
begin
  Result := True;
end;

procedure TCommonDialogAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if not (csDestroying in ComponentState) and (Operation = opRemove) and
     (AComponent = FDialog) then
    SetupDialog;
end;

procedure TCommonDialogAction.SetupDialog;
var
  DialogClass: TCommonDialogClass;
begin
  DialogClass := GetDialogClass;
  if Assigned(DialogClass) then
  begin
    FDialog := DialogClass.Create(Self); 
    FDialog.Name := Copy(DialogClass.ClassName, 2, Length(DialogClass.ClassName));
    FDialog.SetSubComponent(True);
    FDialog.FreeNotification(Self);
  end;
end;

{ TFileAction }

function TFileAction.GetDialog: TOpenDialog;
begin
  Result := TOpenDialog(FDialog);
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TFileAction.GetFileName: TFileName;
begin
  Result := GetDialog.FileName;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
procedure TFileAction.SetFileName(const Value: TFileName);
begin
  GetDialog.FileName := Value;
end;

{ TFileOpen }

constructor TFileOpen.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDialog.Name := 'OpenDialog';
end;

[FileIOPermission(SecurityAction.LinkDemand, Unrestricted=True)]
procedure TFileOpen.ExecuteTarget(Target: TObject);
begin
  inherited ExecuteTarget(Target);
  if FExecuteResult and FUseDefaultApp then
{$IF DEFINED(CLR)}
    ShellExecute(0, nil, Dialog.FileName, nil, nil, SW_SHOW)
{$ELSE}
    ShellExecute(0, nil, PChar(Dialog.FileName), nil, nil, SW_SHOW)
{$ENDIF}
end;

function TFileOpen.GetDialogClass: TCommonDialogClass;
begin
  Result := TOpenDialog;
end;

{ TFileOpenWith }

[FileIOPermission(SecurityAction.LinkDemand, Unrestricted=True)]
procedure TFileOpenWith.ExecuteTarget(Target: TObject);
begin
  if (Length(FFileName) = 0) or not FileExists(FFileName) then
  begin
    inherited;
    FFileName := Dialog.FileName;
  end
  else
    FExecuteResult := True;
  if FExecuteResult then
{$IF DEFINED(CLR)}
    ShellExecute(0, 'open', 'rundll32.exe',                     { do not localize}
      Format('shell32.dll,OpenAs_RunDLL %s', [FFileName]), nil, { do not localize}
      SW_SHOW);
{$ELSE}
    ShellExecute(0, 'open', 'rundll32.exe',                            { do not localize}
      PChar(Format('shell32.dll,OpenAs_RunDLL %s', [FFileName])), nil, { do not localize}
      SW_SHOW);
{$ENDIF}
  if Assigned(FAfterOpen) then
    FAfterOpen(Self);
end;

{ TFileSaveAs }

constructor TFileSaveAs.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDialog.Name := 'SaveDialog';
end;

function TFileSaveAs.GetDialogClass: TCommonDialogClass;
begin
  Result := TSaveDialog;
end;

function TFileSaveAs.GetSaveDialog: TSaveDialog;
begin
  Result := TSaveDialog(FDialog);
end;

{ TFilePrintSetup }

function TFilePrintSetup.GetDialog: TPrinterSetupDialog;
begin
  Result := TPrinterSetupDialog(FDialog);
end;

function TFilePrintSetup.GetDialogClass: TCommonDialogClass;
begin
  Result := TPrinterSetupDialog;
end;

{ TFilePageSetup }

function TFilePageSetup.GetDialog: TPageSetupDialog;
begin
  Result := TPageSetupDialog(FDialog);
end;

function TFilePageSetup.GetDialogClass: TCommonDialogClass;
begin
  Result := TPageSetupDialog;
end;

{ TFileExit }

procedure TFileExit.ExecuteTarget(Target: TObject);
begin
  if Assigned(Application.MainForm) then
  begin
    Application.HelpCommand(HELP_QUIT, 0);
    Application.MainForm.Close;
  end;
end;

function TFileExit.HandlesTarget(Target: TObject): Boolean;
begin
  Result := True;
end;

{$IF DEFINED(CLR)}
// WParam points to a structure
function SendWPStructMessage(Handle: HWND; Msg: UINT; const WParam; LParam: LPARAM): LRESULT;
var
  Buffer: IntPtr;
begin
  Buffer := Marshal.AllocHGlobal(Marshal.SizeOf(TypeOf(TObject(WParam))));
  try
    Marshal.StructureToPtr(TObject(WParam), Buffer, False);
    Result := SendMessage(Handle, Msg, THandle(Buffer), LParam);
  finally
    Marshal.DestroyStructure(Buffer, TypeOf(WParam));
    Marshal.FreeHGlobal(Buffer);
  end;
end;
{$ENDIF}

function RichEditTextLength(EditControl: TCustomEdit): Integer;
var
  LGetTextLengthEx: TGetTextLengthEx;
begin
  LGetTextLengthEx.flags := GTL_DEFAULT;
  LGetTextLengthEx.codepage := 1200; // Unicode
{$IF DEFINED(CLR)}
  Result := SendWPStructMessage(EditControl.Handle, EM_GETTEXTLENGTHEX, LGetTextLengthEx, 0);
{$ELSE}
  Result := SendMessage(EditControl.Handle, EM_GETTEXTLENGTHEX, WPARAM(@LGetTextLengthEx), 0);
{$ENDIF}
end;

{$IF DEFINED(CLR)}
procedure GetEditTextBuf(EditControl: TCustomEdit; Size: Integer; var Buffer: string);
{$ELSE}
procedure GetEditTextBuf(EditControl: TCustomEdit; Size: Integer; Buffer: PChar);
{$ENDIF}
var
  LGetTextEx: TGetTextEx;
{$IF DEFINED(CLR)}
  LString: IntPtr;
{$ENDIF}
begin
  if EditControl is TCustomRichEdit then
  begin
    LGetTextEx.cb := (Size + 1) * SizeOf(Char);
    LGetTextEx.flags := GT_DEFAULT;
    LGetTextEx.codepage := 1200; // Unicode
    LGetTextEx.lpDefaultChar := nil;
    LGetTextEx.lpUsedDefChar := nil;
{$IF DEFINED(CLR)}
    LString := Marshal.AllocHGlobal(LGetTextEx.cb);
    try
      SendWPStructMessage(EditControl.Handle, EM_GETTEXTEX, LGetTextEx, LPARAM(LString));
      Buffer := Marshal.PtrToStringUni(LString);
    finally
      Marshal.FreeHGlobal(LString);
    end;
  end
  else
    Buffer := EditControl.Text;
{$ELSE}
    SendMessage(EditControl.Handle, EM_GETTEXTEX, WPARAM(@LGetTextEx), LPARAM(Buffer));
  end
  else
    EditControl.GetTextBuf(Buffer, Size + 1);
{$ENDIF}
end;


{ SearchEdit scans the text of a TCustomEdit-derived component for a given
  search string.  The search starts at the current caret position in the
  control unless FindFirst is true then the search starts at the beginning.
  The Options parameter determines whether the search runs forward
  (frDown) or backward from the caret position, whether or not the text
  comparison is case sensitive, and whether the matching string must be a
  whole word.  If text is already selected in the control, the search starts
  at the 'far end' of the selection (SelStart if searching backwards, SelEnd
  if searching forwards).  If a match is found, the control's text selection
  is changed to select the found text and the function returns True.  If no
  match is found, the function returns False. }

function SearchEdit(EditControl: TCustomEdit; const SearchString: String;
  Options: TFindOptions; FindFirst: Boolean = False): Boolean;
var
  Size: Integer;
  SearchOptions: TStringSearchOptions;
{$IF DEFINED(CLR)}
  P: Integer;
  Buffer: string;
{$ELSE}
  Buffer, P: PChar;
{$ENDIF}
begin
  Result := False;
  if (Length(SearchString) = 0) then Exit;
  if EditControl is TCustomRichEdit then
    Size := RichEditTextLength(EditControl)
  else
    Size := EditControl.GetTextLen;
  if (Size = 0) then Exit;

  SearchOptions := [];
  if frDown in Options then
    Include(SearchOptions, soDown);
  if frMatchCase in Options then
    Include(SearchOptions, soMatchCase);
  if frWholeWord in Options then
    Include(SearchOptions, soWholeWord);

{$IF DEFINED(CLR)}
  GetEditTextBuf(EditControl, Size + 1, Buffer);
  if FindFirst then
    P := SearchBuf(Buffer, 1, EditControl.SelLength, SearchString, SearchOptions)
  else
    P := SearchBuf(Buffer, EditControl.SelStart + 1, EditControl.SelLength, SearchString, SearchOptions);
  if P <> -1 then
  begin
    EditControl.SelStart := P - 1;
    EditControl.SelLength := Length(SearchString);
    Result := True;
  end;
{$ELSE}
  Buffer := StrAlloc(Size + 1);
  try
    GetEditTextBuf(EditControl, Size + 1, Buffer);
    if FindFirst then
      P := SearchBuf(Buffer, Size, 0, EditControl.SelLength, SearchString, SearchOptions)
    else
      P := SearchBuf(Buffer, Size, EditControl.SelStart, EditControl.SelLength, SearchString, SearchOptions);
    if P <> nil then
    begin
      EditControl.SelStart := P - Buffer;
      EditControl.SelLength := Length(SearchString);
      Result := True;
    end;
  finally
    StrDispose(Buffer);
  end;
{$ENDIF}
end;

{ TSearchAction }

constructor TSearchAction.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TFindDialog(FDialog).OnFind := Search;
  FFindFirst := False;
end;

destructor TSearchAction.Destroy;
begin
  if Assigned(FControl) then
    FControl.RemoveFreeNotification(Self);
  inherited;
end;

procedure TSearchAction.ExecuteTarget(Target: TObject);
begin
  FControl := TCustomEdit(Target);
  if Assigned(FControl) then
    FControl.FreeNotification(Self);
  inherited ExecuteTarget(Target);
end;

function TSearchAction.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Screen.ActiveControl is TCustomEdit;
  if not Result then
    Enabled := False;
end;

procedure TSearchAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FControl) then
    FControl := nil;
end;

procedure TSearchAction.Search(Sender: TObject);
begin
  // FControl gets set in ExecuteTarget
  if Assigned(FControl) then
    if not SearchEdit(FControl, TFindDialog(FDialog).FindText,
       TFindDialog(FDialog).Options, FFindFirst) then
      ShowMessage(Format(STextNotFound, [TFindDialog(FDialog).FindText]));
end;

procedure TSearchAction.UpdateTarget(Target: TObject);
begin
  Enabled := Target is TCustomEdit and (TCustomEdit(Target).GetTextLen > 0);
end;

{ TSearchFind }

function TSearchFind.GetDialogClass: TCommonDialogClass;
begin
  Result := TFindDialog;
end;

function TSearchFind.GetFindDialog: TFindDialog;
begin
  Result := TFindDialog(FDialog);
end;

{ TSearchReplace }

procedure TSearchReplace.ExecuteTarget(Target: TObject);
begin
  inherited ExecuteTarget(Target);
  TReplaceDialog(FDialog).OnReplace := Replace;
end;

function TSearchReplace.GetDialogClass: TCommonDialogClass;
begin
  Result := TReplaceDialog;
end;

function TSearchReplace.GetReplaceDialog: TReplaceDialog;
begin
  Result := TReplaceDialog(FDialog);
end;

procedure TSearchReplace.Replace(Sender: TObject);
var
  Found: Boolean;
  FoundCount: Integer;
begin
  // FControl gets set in ExecuteTarget
  Found := False;
  FoundCount := 0;
  if Assigned(FControl) then
    with Sender as TReplaceDialog do
    begin
      if (Length(FControl.SelText) > 0) and
         (not (frReplaceAll in Dialog.Options) and
         (AnsiCompareText(FControl.SelText, FindText) = 0) or
         (frReplaceAll in Dialog.Options) and (FControl.SelText = FindText)) then
      begin
        FControl.SelText := ReplaceText;
        SearchEdit(FControl, Dialog.FindText, Dialog.Options, FFindFirst);
        if not (frReplaceAll in Dialog.Options) then exit;
      end;
      repeat
        Found := SearchEdit(FControl, Dialog.FindText, Dialog.Options, FFindFirst);
        if Found then
        begin
          FControl.SelText := ReplaceText;
          Inc(FoundCount);
        end;
      until not Found or not (frReplaceAll in Dialog.Options);
    end;
  if not Found and (FoundCount = 0) then
    ShowMessage(Format(STextNotFound, [Dialog.FindText]));
end;

procedure TSearchReplace.UpdateTarget(Target: TObject);
begin
  Enabled := (Target is TCustomEdit) and not TCustomEdit(Target).ReadOnly and (TCustomEdit(Target).GetTextLen > 0);
end;

{ TSearchFindFirst }

constructor TSearchFindFirst.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFindFirst := True;
end;

{ TSearchFindNext }

constructor TSearchFindNext.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DisableIfNoHandler := False;
end;

procedure TSearchFindNext.ExecuteTarget(Target: TObject);
begin
  FSearchFind.FControl := TCustomEdit(Target);
  if not Assigned(FSearchFind) then exit;
  FSearchFind.Search(Target);
end;

function TSearchFindNext.HandlesTarget(Target: TObject): Boolean;
begin
  Result := Assigned(FSearchFind) and FSearchFind.Enabled and
    (Length(TFindDialog(FSearchFind.Dialog).FindText) <> 0);
  Enabled := Result;
end;

procedure TSearchFindNext.UpdateTarget(Target: TObject);
begin
  if Assigned(FSearchFind) then
    Enabled := FSearchFind.Enabled and (Length(TFindDialog(FSearchFind.Dialog).FindText) <> 0)
  else
    Enabled := False;
end;

{ TFontEdit }

function TFontEdit.GetDialog: TFontDialog;
begin
  Result := TFontDialog(FDialog);
end;

function TFontEdit.GetDialogClass: TCommonDialogClass;
begin
  Result := TFontDialog;
end;

{ TColorSelect }

function TColorSelect.GetDialog: TColorDialog;
begin
  Result := TColorDialog(FDialog);
end;

function TColorSelect.GetDialogClass: TCommonDialogClass;
begin
  Result := TColorDialog;
end;

{ TPrintDlg }

function TPrintDlg.GetDialog: TPrintDialog;
begin
  Result := TPrintDialog(FDialog);
end;

function TPrintDlg.Getdialogclass: TCommonDialogClass;
begin
  Result := TPrintDialog;
end;

{ TBrowseForFolder }

{$IF DEFINED(CLR)}
function TBrowseForFolder.BrowseCallbackProc(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer;
begin
  if (uMsg = BFFM_VALIDATEFAILEDA) or (uMsg = BFFM_VALIDATEFAILEDW) then
    Result := DoValidate(Wnd, uMsg, lParam, lpData)
  else
    Result := DoCallback(Wnd, uMsg, lParam, lpData);
end;
{$ENDIF}

{$IF NOT DEFINED(CLR)}
function BrowseCallbackProc(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer stdcall;
begin
  if uMsg = BFFM_VALIDATEFAILED then
    Result := TBrowseForFolder(lpData).DoValidate(Wnd, uMsg, lParam, lpData)
  else
    Result := TBrowseForFolder(lpData).DoCallback(Wnd, uMsg, lParam, lpData);
end;
{$ENDIF}

function TBrowseForFolder.DoCallback(Wnd: HWND; uMsg: UINT; lParam, lpData: LPARAM): Integer;
var
  Rect: TRect;
  Monitor: TMonitor;
begin
  Result := 0;
  if uMsg = BFFM_INITIALIZED then
  begin
    Monitor := Screen.MonitorFromWindow(Application.MainForm.Handle);
    GetWindowRect(Wnd, Rect);
    SetWindowPos(Wnd, 0, (Monitor.Width - (Rect.Right - Rect.Left)) div 2,
      (Monitor.Height - (Rect.Bottom - Rect.Top)) div 2, 0, 0, SWP_NOSIZE or SWP_NOZORDER);
    if FFolder <> '' then
{$IF DEFINED(CLR)}
    begin
      if Marshal.SystemDefaultCharSize = 1 then
        SendTextMessage(Wnd, BFFM_SETSELECTIONA, Windows.WPARAM(True), FFolder)
      else
        SendTextMessage(Wnd, BFFM_SETSELECTIONW, Windows.WPARAM(True), FFolder);
    end;
{$ELSE}
      SendMessage(Wnd, BFFM_SETSELECTION, Winapi.Windows.WPARAM(True), Winapi.Windows.LPARAM(PChar(FFolder)));
{$ENDIF}
  end;
  if Assigned(FOnCallback) then
    FOnCallback(Self, Wnd, uMsg, lParam, lpData, Result)
  else
    Result := 0;
end;

function TBrowseForFolder.DoValidate(Wnd: HWND; uMsg: UINT; lParam,
  lpData: LPARAM): Integer;
begin
  if Assigned(FOnValidate) then
    FOnValidate(Self, Wnd, uMsg, lParam, lpData, Result)
  else
    Result := 0;
end;

[FileIOPermission(SecurityAction.LinkDemand, Unrestricted=True)]
procedure TBrowseForFolder.ExecuteTarget(Target: TObject);
const
  BrowseOptionsConsts: array[TBrowseForFolderOption] of UINT = (
    BIF_BROWSEFORCOMPUTER, BIF_BROWSEFORPRINTER, BIF_BROWSEINCLUDEFILES,
    BIF_BROWSEINCLUDEURLS, BIF_DONTGOBELOWDOMAIN, BIF_EDITBOX, BIF_NEWDIALOGSTYLE,
    BIF_NONEWFOLDERBUTTON, BIF_NOTRANSLATETARGETS, BIF_RETURNFSANCESTORS,
    BIF_RETURNONLYFSDIRS, BIF_SHAREABLE, BIF_STATUSTEXT, BIF_UAHINT, BIF_USENEWUI,
    BIF_VALIDATE);
{$IF DEFINED(CLR)}
var
  RootItemIDList, ItemIDList: IntPtr;
  BrowseInfo: TBrowseInfo;
  DisplayName: array[0..MAX_PATH] of Char;
  I: TBrowseForFolderOption;
  ShellMalloc: IMalloc;
  IDesktopFolder: IShellFolder;
  Buffer: IntPtr;
  Root: string;
  Eaten, Flags: LongWord;
  WindowList: TObject;
  OldErrorMode: Cardinal;
begin
  FExecuteResult := False;
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
  begin
    Buffer := Marshal.AllocHGlobal(MAX_PATH);
    try
      RootItemIDList := nil;
      Root := FRootDir;
      if Length(Root) <> 0 then
      begin
        SHGetDesktopFolder(IDesktopFolder);
        IDesktopFolder.ParseDisplayName(Application.Handle, nil,
          Root, Eaten, RootItemIDList, Flags);
      end;
      if not Assigned(FCallbackDelegate) then
        FCallbackDelegate := @BrowseCallbackProc;
      with BrowseInfo do
      begin
        hwndOwner := Application.Handle;
        pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := DialogCaption;
        lpfn := FCallbackDelegate;
        lParam := 0;
        for I := Low(TBrowseForFolderOption) to HIgh(TBrowseForFolderOption) do
          if I in BrowseOptions then
            ulFlags := ulFlags or BrowseOptionsConsts[I];
      end;
      WindowList := DisableTaskWindows(0);
      OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
      try
        ItemIDList := ShBrowseForFolder(BrowseInfo);
      finally
        SetErrorMode(OldErrorMode);
        EnableTaskWindows(WindowList);
      end;
      FExecuteResult :=  ItemIDList <> nil;
      if FExecuteResult then
      begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        FFolder := Marshal.PtrToStringAuto(Buffer);
        DoAccept
      end
      else
        DoCancel;
    finally
      Marshal.FreeHGlobal(Buffer);
    end;
  end;
end;
{$ELSE}
var
  RootItemIDList, ItemIDList: PItemIDList;
  BrowseInfo: TBrowseInfo;
  DisplayName: array[0..MAX_PATH] of Char;
  I: TBrowseForFolderOption;
  ShellMalloc: IMalloc;
  IDesktopFolder: IShellFolder;
  Buffer: PChar;
  Root: WideString;
  Eaten, Flags: LongWord;
  WindowList: Pointer;
  OldErrorMode: Cardinal;
begin
  FExecuteResult := False;
  if Assigned(FBeforeExecute) then
    FBeforeExecute(Self);

  if (TOSVersion.Major >= 5) and UseFileDialog then
    ExecuteIFileDialog
  else
  begin
    if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then
    begin
      Buffer := ShellMalloc.Alloc(MAX_PATH * SizeOf(Char));
      try
        RootItemIDList := nil;
        Root := WideString(FRootDir);
        if Root <> '' then
        begin
          SHGetDesktopFolder(IDesktopFolder);
          IDesktopFolder.ParseDisplayName(Application.Handle, nil,
            POleStr(Root), Eaten, RootItemIDList, Flags);
        end;
        FillChar(BrowseInfo, SizeOf(TBrowseInfo), 0);
        with BrowseInfo do
        begin
          hwndOwner := Application.Handle;
          pidlRoot := RootItemIDList;
          pszDisplayName := @DisplayName;
          lpszTitle := PChar(DialogCaption);
          lpfn := @BrowseCallbackProc;
          lParam :=  Winapi.Windows.LPARAM(Self);
          for I := Low(TBrowseForFolderOption) to High(TBrowseForFolderOption) do
            if I in BrowseOptions then
              ulFlags := ulFlags or Cardinal(BrowseOptionsConsts[I]);
        end;
        WindowList := DisableTaskWindows(0);
        OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
        try
          ItemIDList := ShBrowseForFolder(BrowseInfo);
        finally
          SetErrorMode(OldErrorMode);
          EnableTaskWindows(WindowList);
        end;
        FExecuteResult := ItemIDList <> nil;
        if FExecuteResult then
        begin
          ShGetPathFromIDList(ItemIDList, Buffer);
          ShellMalloc.Free(ItemIDList);
          FFolder := Buffer;
          DoAccept
        end
        else
          DoCancel;
      finally
        ShellMalloc.Free(Buffer);
      end;
    end;
  end;
end;
{$ENDIF}

procedure TBrowseForFolder.ExecuteIFileDialog;
var
  LOptions: TFileDialogOptions;
  LFileDialog: TFileOpenDialog;
  LSelectedItemCount, I, LIndex: Cardinal;
  LShellItem: IShellItem;
  LShellItemName: PWideChar;
begin
  LOptions := [fdoPickFolders, fdoForceFileSystem];
  if bifeHidePinnedPlaces in BrowseOptionsEx then
    LOptions := LOptions + [fdoHidePinnedPlaces];
  if bifeNoDereferenceLinks in BrowseOptionsEx then
    LOptions := LOptions + [fdoNoDereferenceLinks];
  if bifeForceShowHidden in BrowseOptionsEx then
    LOptions := LOptions + [fdoForceShowHidden];
  if bifeAllowMultiselect in BrowseOptionsEx then
    LOptions := LOptions + [fdoAllowMultiselect];

  LFileDialog := TFileOpenDialog.Create(nil);
  try
    LFileDialog.Options := LOptions;
    if FDialogCaption <> '' then
      LFileDialog.Title := FDialogCaption;
    if Folder <> '' then
      LFileDialog.DefaultFolder := Folder;
    if FolderNameLabel <> '' then
      LFileDialog.FileNameLabel := FolderNameLabel;
    if OkButtonLabel <> '' then
      LFileDialog.OkButtonLabel := OkButtonLabel;

    FExecuteResult := LFileDialog.Execute;
    if FExecuteResult then
    begin
      if bifeAllowMultiselect in BrowseOptionsEx then
      begin
        if Succeeded(LFileDialog.ShellItems.GetCount(LSelectedItemCount)) then
        begin
          SetLength(FFolders, LSelectedItemCount);
          LIndex := 0;
          for I := 0 to LSelectedItemCount - 1 do
          begin
            if Succeeded(LFileDialog.ShellItems.GetItemAt(I, LShellItem)) and Succeeded(LShellItem.GetDisplayName(SIGDN_FILESYSPATH, LShellItemName)) then
            begin
              FFolders[LIndex] := LShellItemName;
              Inc(LIndex);
            end
            else
              SetLength(FFolders, Length(FFolders) - 1)
          end;
        end;
      end
      else
      begin
        SetLength(FFolders, 1);
        FFolders[0] := LFileDialog.FileName;
      end;

      if Length(FFolders) > 0 then
        FFolder := FFolders[0]
      else
        FFolder := '';

      DoAccept;
    end
    else
      DoCancel;
  finally
    LFileDialog.Free;
  end;
end;


function TBrowseForFolder.GetDialogCaption: string;
begin
  Result := FDialogCaption;
  if Length(Result) = 0 then
    Result := Caption;
end;

function TBrowseForFolder.GetDialogClass: TCommonDialogClass;
begin
  Result := nil;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TBrowseForFolder.GetFolder: string;
begin
  Result := FFolder;
end;

function TBrowseForFolder.GetFolders(Index: Integer): string;
begin
  Result := FFolders[Index]
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
function TBrowseForFolder.GetRootDir: string;
begin
  Result := FRootDir;
end;

function TBrowseForFolder.GetSelectionCount: Integer;
begin
  Result := Length(FFolders);
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
procedure TBrowseForFolder.SetFolder(Value: string);
begin
  if Value <> FFolder then
    FFolder := Value;
end;

[FileIOPermission(SecurityAction.Demand, Unrestricted=True)]
procedure TBrowseForFolder.SetRootDir(Value: string);
begin
  if Value <> FRootDir then
    FRootDir := Value;
end;

procedure TBrowseForFolder.SetBrowseOptions(const Value: TBrowseOptions);
begin
  FBrowseOptions := Value;
  if bifBrowseIncludeURLs in Value then
  begin
    Include(FBrowseOptions, bifUseNewUI);
    Include(FBrowseOptions, bifBrowseIncludeFiles);
  end;
  if bifShareable in Value then
    Include(FBrowseOptions, bifNewDialogStyle);
end;

end.
