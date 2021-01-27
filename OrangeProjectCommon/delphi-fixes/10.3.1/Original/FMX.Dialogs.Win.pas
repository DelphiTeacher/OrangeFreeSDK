{*******************************************************}
{                                                       }
{             Delphi FireMonkey Platform                }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Dialogs.Win;

interface

{$SCOPEDENUMS ON}

uses
  Winapi.ShlObj, Winapi.Windows, System.UITypes, System.SysUtils, System.Classes, System.Generics.Collections,
  FMX.Dialogs;

type
  EPlatformVersionException = class(Exception);

  TFileDialogShareViolationResponse = (Default = FDESVR_DEFAULT, Accept = FDESVR_ACCEPT, Refuse = FDESVR_REFUSE);

  TFileDialogOption = (OverWritePrompt, StrictFileTypes, NoChangeDir, PickFolders, ForceFileSystem, AllNonStorageItems,
    NoValidate, AllowMultiSelect, PathMustExist, FileMustExist, CreatePrompt, ShareAware, NoReadOnlyReturn,
    NoTestFileCreate, HideMRUPlaces, HidePinnedPlaces, NoDereferenceLinks, DontAddToRecent, ForceShowHidden,
    DefaultNoMiniMode, ForcePreviewPaneOn);
  TFileDialogOptions = set of TFileDialogOption;

  TFileDialogCloseEvent = procedure(Sender: TObject; var CanClose: Boolean) of object;

  TFileTypeItem = class(TCollectionItem)
  private
    FDisplayName: string;
    FFileMask: string;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
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
    FHandle: HWND;
    FOkButtonLabel: string;
    FOptions: TFileDialogOptions;
    FShellItem: IShellItem;
    FShellItems: IShellItemArray;
    FTitle: string;
    FOnExecute: TNotifyEvent;
    FOnFileOkClick: TFileDialogCloseEvent;
    FActualFolder: TFileName;
    function GetDefaultFolder: string;
    function GetFileName: TFileName;
    function GetFiles: TStrings;
    procedure SetClientGuid(const Value: string);
    procedure SetDefaultFolder(const Value: string);
    procedure SetFavoriteLinks(const Value: TFavoriteLinkItems);
    procedure SetFileName(const Value: TFileName);
    procedure SetFileTypes(const Value: TFileTypeItems);
  strict protected
    function CreateFileDialog: IFileDialog; virtual; abstract;
    procedure DoOnExecute; dynamic;
    function DoOnFileOkClick: Boolean; dynamic;
    function GetFileNames(Items: IShellItemArray): HResult; dynamic;
    function GetItemName(Item: IShellItem; var ItemName: TFileName): HResult; dynamic;
    function GetResults: HResult; virtual;
  protected
    function FileOkClick: HResult; dynamic;
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
    property Handle: HWND read FHandle;
    property OkButtonLabel: string read FOkButtonLabel write FOkButtonLabel;
    property Options: TFileDialogOptions read FOptions write FOptions;
    property ShellItem: IShellItem read FShellItem;
    property ShellItems: IShellItemArray read FShellItems;
    property Title: string read FTitle write FTitle;
    property OnExecute: TNotifyEvent read FOnExecute write FOnExecute;
    property OnFileOkClick: TFileDialogCloseEvent read FOnFileOkClick write FOnFileOkClick;
  end;

  { TFileOpenDialog }

  TCustomFileOpenDialog = class(TCustomFileDialog)
  strict protected
    function CreateFileDialog: IFileDialog; override;
    function GetResults: HResult; override;
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
  end;

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
  end;

  TFileDialogWrapper = class(TObject)
  private
    procedure AssignFileTypes;
    procedure AssignOptions;
    function GetFileName: TFileName;
    function GetFiles: TStrings;
    function GetHandle: HWND;
    procedure OnFileOkEvent(Sender: TObject; var CanClose: Boolean);
  protected
    FFileDialog: TCustomFileDialog;
    FOpenDialog: TOpenDialog;
    function CreateFileDialog: TCustomFileDialog; virtual; abstract;
  public
    constructor Create(const OpenDialog: TOpenDialog);
    destructor Destroy; override;
    function Execute(ParentWnd: HWND; AType: TDialogType = TDialogType.Standard): Boolean;
    property FileName: TFileName read GetFileName;
    property Files: TStrings read GetFiles;
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

implementation

uses
  Winapi.Messages, Winapi.CommDlg, Winapi.CommCtrl, Winapi.ActiveX, System.IOUtils, System.StrUtils, System.Variants,
  FMX.Platform, FMX.Consts, FMX.Forms, FMX.Printer, FMX.Dialogs.Default, FMX.Printer.Win, FMX.Helpers.Win,
  FMX.Platform.Win, FMX.DialogHelper, FMX.Types;

{ TFileDialogFileType }

constructor TFileTypeItem.Create(Collection: TCollection);
begin
  inherited;
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

{ TFileTypeItem }

function TFileTypeItem.GetDisplayName: string;
begin
  if FDisplayName <> '' then
    Result := FDisplayName
  else
    Result := inherited GetDisplayName;
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
    Result[I].pszName := PChar(Items[I].DisplayName);
    Result[I].pszSpec := PChar(Items[I].FileMask);
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

function TCustomFileDialog.Execute: Boolean;
begin
  Result := Execute();
end;

function TCustomFileDialog.Execute(ParentWnd: HWND): Boolean;
const
  CDialogOptions: array [TFileDialogOption] of DWORD = (FOS_OVERWRITEPROMPT, FOS_STRICTFILETYPES, FOS_NOCHANGEDIR,
    FOS_PICKFOLDERS, FOS_FORCEFILESYSTEM, FOS_ALLNONSTORAGEITEMS, FOS_NOVALIDATE, FOS_ALLOWMULTISELECT,
    FOS_PATHMUSTEXIST, FOS_FILEMUSTEXIST, FOS_CREATEPROMPT, FOS_SHAREAWARE, FOS_NOREADONLYRETURN, FOS_NOTESTFILECREATE,
    FOS_HIDEMRUPLACES, FOS_HIDEPINNEDPLACES, FOS_NODEREFERENCELINKS, FOS_DONTADDTORECENT, FOS_FORCESHOWHIDDEN,
    FOS_DEFAULTNOMINIMODE, FOS_FORCEPREVIEWPANEON);
var
  LPlace: TFavoriteLinkItem;
  LShellItem: IShellItem;
  LDialogOptions: Cardinal;
  LDialogOption: TFileDialogOption;
begin
  if Win32MajorVersion < 6 then
    raise EPlatformVersionException.CreateResFmt(@SWindowsVistaRequired, [ClassName]);

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
          SetDefaultExtension(PChar(FDefaultExtension));
        if FFileName <> '' then
          SetFileName(PChar(FFileName));
        if FFileNameLabel <> '' then
          SetFileNameLabel(PChar(FFileNameLabel));
        if FOkButtonLabel <> '' then
          SetOkButtonLabel(PChar(FOkButtonLabel));
        if FTitle <> '' then
          SetTitle(PChar(FTitle));

        // DefaultFolder
        if FDefaultFolder <> '' then
        begin
          if Succeeded(SHCreateItemFromParsingName(PChar(FDefaultFolder), nil,
            StringToGUID(SID_IShellItem), LShellItem)) then
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
          if Succeeded(SHCreateItemFromParsingName(PChar(LPlace.Location), nil,
            StringToGUID(SID_IShellItem), LShellItem)) then
            AddPlace(LShellItem, FDAP_BOTTOM);

        // Show dialog and get results
        DoOnExecute;
        try
          Result := Succeeded(Show(ParentWnd));
          if Result then
            Result := Succeeded(GetResults);
        finally
          SetActiveWindow(ParentWnd);
        end;
      end;
    finally
      FDialog := nil;
    end;
end;

function TCustomFileDialog.FileOkClick: HResult;
const
  CResults: array [Boolean] of HResult = (S_FALSE, S_OK);
begin
  Result := GetResults;
  if Succeeded(Result) then
    Result := CResults[DoOnFileOkClick];
  Files.Clear;
end;

function TCustomFileDialog.GetDefaultFolder: string;
begin
  Result := FDefaultFolder;
end;

function TCustomFileDialog.GetFileName: TFileName;
var
  LFileName: TFileName;
  pszFileName: LPCWSTR;
begin
  if (FDialog <> nil) and Succeeded(FDialog.GetFolder(FShellItem)) and Succeeded(GetItemName(FShellItem, LFileName))
  then
    if FFiles.Count = 0 then
    begin
      if Succeeded(FDialog.GetFileName(pszFileName)) then
        try
          FFileName := TPath.Combine(LFileName, pszFileName);
        finally
          CoTaskMemFree(pszFileName);
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
      Result := LEnumerator.Next(ItemCount, LShellItems[0], @Count);
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
      ItemName := pszItemName;
    finally
      CoTaskMemFree(pszItemName);
    end;
end;

function TCustomFileDialog.GetResults: HResult;
begin
  Result := FDialog.GetResult(FShellItem);
  if Succeeded(Result) then
  begin
    Result := GetItemName(FShellItem, FFileName);
    // Patch for Vista and Windows Server 2008 bug
    if (TFileDialogOption.PickFolders in FOptions) and (Win32MajorVersion = 6) and (Win32MinorVersion = 0) then
    begin
      if not TDirectory.Exists(FFileName) then
        FFileName := FActualFolder;
    end;
    FFiles.Clear;
    FFiles.Add(FFileName);
  end;
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

procedure TCustomFileDialog.SetDefaultFolder(const Value: string);
begin
  if FDefaultFolder <> Value then
    FDefaultFolder := Value;
end;

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

procedure TCustomFileDialog.SetFavoriteLinks(const Value: TFavoriteLinkItems);
begin
  if Value <> nil then
    FFavoriteLinks.Assign(Value);
end;

{ TFileDialogWrapper }

constructor TFileDialogWrapper.Create(const OpenDialog: TOpenDialog);
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
    with FFileDialog.FileTypes.Add do
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
  CDialogOptionsMap: array [TOpenOption] of TFileDialogOptions = ([] { ReadOnly } , [TFileDialogOption.OverWritePrompt],
    [] { HideReadOnly } , [TFileDialogOption.NoChangeDir], [] { ShowHelp } , [TFileDialogOption.NoValidate],
    [TFileDialogOption.AllowMultiSelect], [TFileDialogOption.StrictFileTypes], [TFileDialogOption.PathMustExist],
    [TFileDialogOption.FileMustExist], [TFileDialogOption.CreatePrompt], [TFileDialogOption.ShareAware],
    [TFileDialogOption.NoReadOnlyReturn], [TFileDialogOption.NoTestFileCreate], [] { NoNetworkButton } ,
    [] { NoLongNames } , [] { OldStyleDialog } , [TFileDialogOption.NoDereferenceLinks], [] { EnableIncludeNotify } ,
    [] { EnableSizing } , [TFileDialogOption.DontAddToRecent], [TFileDialogOption.ForceShowHidden]);
var
  LOption: TOpenOption;
begin
  for LOption := Low(LOption) to High(LOption) do
    if LOption in FOpenDialog.Options then
      FFileDialog.Options := FFileDialog.Options + CDialogOptionsMap[LOption];
  if TOpenOptionEx.ofExNoPlacesBar in FOpenDialog.OptionsEx then
    FFileDialog.Options := FFileDialog.Options + [TFileDialogOption.HidePinnedPlaces];
end;

function TFileDialogWrapper.Execute(ParentWnd: HWND; AType: TDialogType): Boolean;
begin
  FFileDialog.DefaultExtension := FOpenDialog.DefaultExt;
  FFileDialog.DefaultFolder := FOpenDialog.InitialDir;
  FFileDialog.FileName := FOpenDialog.FileName;
  FFileDialog.FileTypeIndex := FOpenDialog.FilterIndex;
  FFileDialog.Title := FOpenDialog.Title;
  if Assigned(FOpenDialog.OnCanClose) then
    FFileDialog.OnFileOkClick := OnFileOkEvent;
  AssignFileTypes;
  AssignOptions;

  if AType = TDialogType.Directory then
    FFileDialog.Options := FFileDialog.Options + [TFileDialogOption.PickFolders];

  Result := FFileDialog.Execute(ParentWnd);
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

function TFileDialogWrapper.GetFiles: TStrings;
begin
  Result := FFileDialog.Files;
end;

function TFileDialogWrapper.GetHandle: HWND;
begin
  Result := FFileDialog.Handle;
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

{ TCustomFileOpenDialog }

function TCustomFileOpenDialog.CreateFileDialog: IFileDialog;
var
  LGuid: TGUID;
begin
  LGuid := CLSID_FileOpenDialog;
  CoCreateInstance(LGuid, nil, CLSCTX_INPROC_SERVER, StringToGUID(SID_IFileOpenDialog), Result);
end;

function TCustomFileOpenDialog.GetResults: HResult;
begin
  if not (TFileDialogOption.AllowMultiSelect in Options) then
    Result := inherited GetResults
  else
  begin
    Result := (Dialog as IFileOpenDialog).GetResults(FShellItems);
    if Succeeded(Result) then
      Result := GetFileNames(FShellItems);
  end;
end;

{ TCustomFileSaveDialog }

function TCustomFileSaveDialog.CreateFileDialog: IFileDialog;
var
  LGuid: TGUID;
begin
  LGuid := CLSID_FileSaveDialog;
  CoCreateInstance(LGuid, nil, CLSCTX_INPROC_SERVER, StringToGUID(SID_IFileSaveDialog), Result);
end;

type
  TFMXDialogService = class(TInterfacedObject, IFMXDialogService, IFMXDialogServiceSync, IFMXDialogServiceAsync)
  public const
    MsgCaptions: array [TMsgDlgType] of string = (SMsgDlgWarning, SMsgDlgError, SMsgDlgInformation, SMsgDlgConfirm, '');
    MsgIcons: array [TMsgDlgType] of UINT = (MB_ICONWARNING, MB_ICONERROR, MB_ICONINFORMATION, MB_ICONQUESTION, 0);
  private type
    TDialogData = record
      Dialog: HWND;
      Buttons: array [idOK .. idContinue] of HWND;
      CustomButtons: array [idOK .. idContinue] of HWND;
      Rects: array [idOK .. idContinue] of TRect;
      MsgDlgButtons: TMsgDlgButtons;
    end;
    PDialogData = ^TDialogData;
  strict private
    class var FCurrent: TFMXDialogService;
    class function GetCurrent: TFMXDialogService; static;
  private
    FOldHook: HHOOK;
    FFont: HFONT;
    FHookList: TList<TDialogData>;
    function GetCount: Integer;
    function GetFont: HFONT;
    { IFMXDialogService }
    function DialogOpenFiles(const ADialog: TOpenDialog; var AFiles: TStrings; AType: TDialogType): Boolean;
    function DialogPrint(var ACollate, APrintToFile: Boolean; var AFromPage, AToPage, ACopies: Integer;
      AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange; AOptions: TPrintDialogOptions): Boolean;
    function PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF; AUnits: TPageMeasureUnits;
      AOptions: TPageSetupDialogOptions): Boolean;
    function DialogPageSetup(var AMargin, AMinMargin: TRect; var APaperSize: TPointF; var AUnits: TPageMeasureUnits;
      AOptions: TPageSetupDialogOptions): Boolean;
    function DialogSaveFiles(const ADialog: TOpenDialog; var AFiles: TStrings): Boolean;
    function DialogPrinterSetup: Boolean;
    function GetHWND: HWND;
    function MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AX, AY: Integer; const AHelpCtx: THelpContext;
      const AHelpFileName: string): Integer; overload;
    procedure MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AX, AY: Integer; const AHelpCtx: THelpContext; const AHelpFileName: string;
      const ACloseDialogProc: TInputCloseDialogProc); overload;
    function InputQuery(const ACaption: string; const APrompts: array of string; var AValues: array of string;
      const ACloseQueryFunc: TInputCloseQueryFunc = nil): Boolean; overload;
    procedure InputQuery(const ACaption: string; const APrompts, ADefaultValues: array of string;
      const ACloseQueryProc: TInputCloseQueryProc); overload;

    { IFMXDialogServiceSync }
    /// <summary>Show a simple message box with an 'Ok' button to close it.</summary>
    procedure ShowMessageSync(const AMessage: string);
    /// <summary>Shows custom message dialog with specified buttons on it.</summary>
    function MessageDialogSync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext): Integer;
    /// <summary>Shows an input message dialog with the specified promps and values on it. Values are modified within it.</summary>
    function InputQuerySync(const ACaption: string; const APrompts: array of string; var AValues: array of string): Boolean;

    { IFMXDialogServiceAsync }
    /// <summary>Show a simple message box with an 'Ok' button to close it.</summary>
    procedure ShowMessageAsync(const AMessage: string); overload;
    /// <summary>Show a simple message box with an 'Ok' button to close it.</summary>
    procedure ShowMessageAsync(const AMessage: string; const ACloseDialogProc: TInputCloseDialogProc); overload;
    /// <summary>Show a simple message box with an 'Ok' button to close it.</summary>
    procedure ShowMessageAsync(const AMessage: string; const ACloseDialogEvent: TInputCloseDialogEvent;
      const AContext: TObject = nil); overload;

    /// <summary>Shows custom message dialog with specified buttons on it.</summary>
    procedure MessageDialogAsync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext; const ACloseDialogProc: TInputCloseDialogProc); overload;
    /// <summary>Shows custom message dialog with specified buttons on it.</summary>
    procedure MessageDialogAsync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
      const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext; const ACloseDialogEvent: TInputCloseDialogEvent;
      const AContext: TObject = nil); overload;

    /// <summary>Shows an input message dialog with the specified promps and values on it. Values are modified within it.</summary>
    procedure InputQueryAsync(const ACaption: string; const APrompts: array of string; const ADefaultValues: array of string;
      const ACloseQueryProc: TInputCloseQueryProc); overload;
    /// <summary>Shows an input message dialog with the specified promps and values on it. Values are modified within it.</summary>
    procedure InputQueryAsync(const ACaption: string; const APrompts: array of string; const ADefaultValues: array of string;
      const ACloseQueryEvent: TInputCloseQueryWithResultEvent; const AContext: TObject = nil); overload;

  public
    destructor Destroy; override;
    class property Current: TFMXDialogService read GetCurrent;
    property Font: HFONT read GetFont;
    property OldHook: HHOOK read FOldHook;
    function NeedInit: Boolean;
    function InitLastData(const ADialog: HWND): Boolean;
    function GetData(const ADialog: HWND; var AData: TDialogData): Boolean;
    function SetData(const ADialog: HWND; const AData: TDialogData): Boolean;
    procedure BeginHook(const AMsgDlgButtons: TMsgDlgButtons);
    function ConvertResult(const ModalResult: Integer): Integer;
    procedure EndHook;
  end;

{ TFMXDialogService }

destructor TFMXDialogService.Destroy;
begin
  FreeAndNil(FHookList);
  if FOldHook <> 0 then
    UnhookWindowsHookEx(FOldHook);
  if FFont <> 0 then
    DeleteObject(FFont);
  inherited;
end;

class function TFMXDialogService.GetCurrent: TFMXDialogService;
begin
  if FCurrent = nil then
    FCurrent := TFMXDialogService.Create;
  Result := FCurrent;
end;

function DialogHook(Wnd: HWND; Msg: UINT; WParam: WParam; LParam: LParam): UINT_PTR; stdcall;
begin
  Result := 0;
end;

procedure GetFileNames(var OpenFileName: TOpenFilenameW; var AFileName: TFileName; var AFiles: TStrings;
  AOptions: TOpenOptions);
var
  Separator: Char;

  function ExtractFileName(P: PChar; var S: TFileName): PChar;
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

  procedure ExtractFileNames(P: PChar);
  var
    DirName, FileName: TFileName;
  begin
    P := ExtractFileName(P, DirName);
    P := ExtractFileName(P, FileName);
    if FileName = '' then
      AFiles.Add(DirName)
    else
    begin
      DirName := IncludeTrailingPathDelimiter(DirName);
      repeat
        if (FileName[1] <> TPath.DirectorySeparatorChar) and ((Length(FileName) <= 3) or
          (FileName[2] <> TPath.VolumeSeparatorChar) or (FileName[3] <> TPath.DirectorySeparatorChar)) then
          FileName := DirName + FileName;
        AFiles.Add(FileName);
        P := ExtractFileName(P, FileName);
      until FileName = '';
    end;
  end;

begin
  Separator := #0;
  if (TOpenOption.ofAllowMultiSelect in AOptions) and (TOpenOption.ofOldStyleDialog in AOptions) then
    Separator := ' ';
  if TOpenOption.ofAllowMultiSelect in AOptions then
  begin
    ExtractFileNames(OpenFileName.lpstrFile);
    AFileName := AFiles[0];
  end
  else
  begin
    ExtractFileName(OpenFileName.lpstrFile, AFileName);
    AFiles.Add(AFileName);
  end;
end;

function TFMXDialogService.DialogOpenFiles(const ADialog: TOpenDialog; var AFiles: TStrings;
  AType: TDialogType): Boolean;
const
  FileNameBufferLen = High(Word) - 16;
  OpenOptions: array [TOpenOption] of DWORD = (OFN_READONLY, OFN_OVERWRITEPROMPT, OFN_HIDEREADONLY, OFN_NOCHANGEDIR,
    OFN_SHOWHELP, OFN_NOVALIDATE, OFN_ALLOWMULTISELECT, OFN_EXTENSIONDIFFERENT, OFN_PATHMUSTEXIST, OFN_FILEMUSTEXIST,
    OFN_CREATEPROMPT, OFN_SHAREAWARE, OFN_NOREADONLYRETURN, OFN_NOTESTFILECREATE, OFN_NONETWORKBUTTON, OFN_NOLONGNAMES,
    OFN_EXPLORER, OFN_NODEREFERENCELINKS, OFN_ENABLEINCLUDENOTIFY, OFN_ENABLESIZING, OFN_DONTADDTORECENT,
    OFN_FORCESHOWHIDDEN);
var
  OpenFile: TOpenFilenameW;
  FileDialogWrapper: TFileDialogWrapper;
  FileNameBuffer: PChar;
  FileNameBufferSize: Integer;
  InitialDir, Filter, DefaultExt: string;
  FileName: TFileName;
  Option: TOpenOption;
  WindowList: Pointer;
  OwnerHwnd: HWND;

  function AllocFilterStr(const S: string): string;
  var
    SepPos: Integer;
    SB: TStringBuilder;
  begin
    Result := '';
    if S <> '' then
    begin
      Result := S + #0; // double null terminators
      SB := TStringBuilder.Create(Result);
      try
        SepPos := Result.IndexOf('|');
        while SepPos >= 0 do
        begin
          SB.Chars[SepPos] := #0; // adjust because OP strings are 1-offset
          Result := SB.ToString;
          Inc(SepPos);
          SepPos := Result.IndexOf('|', SepPos);
        end;
        Result := SB.ToString + #0; // add final null terminator
      finally
        SB.Free;
      end;
    end;
  end;

begin
  OwnerHwnd := GetHWND;

  if Win32MajorVersion >= 6 then
  begin
    // This requires Windows Vista or later
    FileDialogWrapper := TFileOpenDialogWrapper.Create(ADialog);
    try
      WindowList := nil;
      try
        WindowList := DisableTaskWindows(OwnerHwnd);
        Result := FileDialogWrapper.Execute(OwnerHwnd, AType);
        if Result then
          AFiles.Assign(FileDialogWrapper.Files);
      finally
        EnableTaskWindows(WindowList);
      end;
    finally
      FileDialogWrapper.Free;
    end;
    Exit;
  end;

  InitialDir := ADialog.InitialDir;
  DefaultExt := ADialog.DefaultExt;
  Filter := AllocFilterStr(ADialog.Filter);
  FileName := ADialog.FileName;
  if (FileName <> '') and (FileName[Length(FileName)] = PathDelim) then
  begin
    // if the filename contains a directory, set the initial directory
    // and clear
    InitialDir := string(FileName).Substring(0, string(FileName).Length - 1);
    FileName := '';
  end;

  if (DefaultExt = '') or (DefaultExt = null) then
    DefaultExt := '*';

  FileNameBuffer := AllocMem(FileNameBufferLen * SizeOf(Char) + 2);

  if Length(FileName) > FileNameBufferLen then
    FileNameBufferSize := FileNameBufferLen
  else
    FileNameBufferSize := Length(FileName);

  Move(PChar(FileName)^, FileNameBuffer^, FileNameBufferSize * SizeOf(Char));

  if (Filter = '') or (Filter = null) then
    Filter := 'All File Types(*.*)' + #0 + '*.*' + #0 + #0; // Default -> avoid empty combobox

  AFiles.Clear;

  FillChar(OpenFile, SizeOf(OpenFile), 0);
  OpenFile.hInstance := hInstance;
  OpenFile.lStructSize := SizeOf(OpenFile);
  OpenFile.hWndOwner := OwnerHwnd;

  OpenFile.nFilterIndex := 0;

  OpenFile.lpstrFile := FileNameBuffer;
  OpenFile.lpstrFilter := PChar(Filter);
  if ADialog.Title <> '' then
    OpenFile.lpstrTitle := PChar(ADialog.Title);
  OpenFile.lpstrInitialDir := PChar(InitialDir);
  OpenFile.lpstrDefExt := PChar(DefaultExt);
  OpenFile.lpstrFile := FileNameBuffer;

  OpenFile.nMaxFile := FileNameBufferLen + 1; // Size in TCHARs
  OpenFile.nFilterIndex := ADialog.FilterIndex;

  OpenFile.Flags := OFN_EXPLORER;
  for Option := Low(Option) to High(Option) do
    if Option in ADialog.Options then
      OpenFile.Flags := OpenFile.Flags or OpenOptions[Option];

  if TOpenOption.ofOldStyleDialog in ADialog.Options then
  begin
    OpenFile.Flags := OpenFile.Flags and (not OFN_EXPLORER);
    OpenFile.lpfnHook := DialogHook;
    OpenFile.Flags := OpenFile.Flags or OFN_ENABLEHOOK;
  end;

  WindowList := nil;
  try
    WindowList := DisableTaskWindows(OpenFile.hWndOwner);
    Result := GetOpenFileNameW(OpenFile);
  finally
    EnableTaskWindows(WindowList);
  end;

  if Result then
  begin
    FileName := FileNameBuffer;
    GetFileNames(OpenFile, FileName, AFiles, ADialog.Options);
    ADialog.FileName := FileName;
    if (OpenFile.Flags and OFN_EXTENSIONDIFFERENT) <> 0 then
      ADialog.Options := ADialog.Options + [TOpenOption.ofExtensionDifferent]
    else
      ADialog.Options := ADialog.Options - [TOpenOption.ofExtensionDifferent];
    if (OpenFile.Flags and OFN_READONLY) <> 0 then
      ADialog.Options := ADialog.Options + [TOpenOption.ofReadOnly]
    else
      ADialog.Options := ADialog.Options - [TOpenOption.ofReadOnly];
    ADialog.FilterIndex := OpenFile.nFilterIndex;
  end;
  FreeMem(FileNameBuffer);
end;

function TFMXDialogService.DialogSaveFiles(const ADialog: TOpenDialog; var AFiles: TStrings): Boolean;
const
  FileNameBufferLen = 1000;
  OpenOptions: array [TOpenOption] of DWORD = (OFN_READONLY, OFN_OVERWRITEPROMPT, OFN_HIDEREADONLY, OFN_NOCHANGEDIR,
    OFN_SHOWHELP, OFN_NOVALIDATE, OFN_ALLOWMULTISELECT, OFN_EXTENSIONDIFFERENT, OFN_PATHMUSTEXIST, OFN_FILEMUSTEXIST,
    OFN_CREATEPROMPT, OFN_SHAREAWARE, OFN_NOREADONLYRETURN, OFN_NOTESTFILECREATE, OFN_NONETWORKBUTTON, OFN_NOLONGNAMES,
    OFN_EXPLORER, OFN_NODEREFERENCELINKS, OFN_ENABLEINCLUDENOTIFY, OFN_ENABLESIZING, OFN_DONTADDTORECENT,
    OFN_FORCESHOWHIDDEN);
var
  SaveFile: TOpenFilenameW;
  FileDialogWrapper: TFileDialogWrapper;
  FileNameBuffer: PChar;
  FileNameBufferSize: Integer;
  InitialDir, Filter, DefaultExt: string;
  FileName: TFileName;
  Option: TOpenOption;
  WindowList: Pointer;
  OwnerHwnd: HWND;

  function AllocFilterStr(const S: string): string;
  var
    SepPos: Integer;
    SB: TStringBuilder;
  begin
    Result := '';
    if S <> '' then
    begin
      Result := S + #0; // double null terminators
      SB := TStringBuilder.Create(Result);
      try
        SepPos := Result.IndexOf('|');
        while SepPos >= 0 do
        begin
          SB.Chars[SepPos] := #0; // adjust because OP strings are 1-offset
          Result := SB.ToString;
          Inc(SepPos);
          SepPos := Result.IndexOf('|', SepPos);
        end;
        Result := SB.ToString + #0; // add final null terminator
      finally
        SB.Free;
      end;
    end;
  end;

begin
  OwnerHwnd := GetHWND;

  if Win32MajorVersion >= 6 then
  begin
    // This requires Windows Vista or later
    FileDialogWrapper := TFileSaveDialogWrapper.Create(ADialog);
    try
      WindowList := nil;
      try
        WindowList := DisableTaskWindows(OwnerHwnd);
        Result := FileDialogWrapper.Execute(OwnerHwnd);
        if Result then
          AFiles.Assign(FileDialogWrapper.Files);
      finally
        EnableTaskWindows(WindowList);
      end;
    finally
      FileDialogWrapper.Free;
    end;
    Exit;
  end;

  InitialDir := ADialog.InitialDir;
  DefaultExt := ADialog.DefaultExt;
  Filter := AllocFilterStr(ADialog.Filter);
  if (ADialog.FileName <> '') and (ADialog.FileName[Length(ADialog.FileName)] = PathDelim) then
  begin
    // if the filename contains a directory, set the initial directory
    // and clear the filename
    InitialDir := ExcludeTrailingPathDelimiter(ADialog.FileName);
    ADialog.FileName := '';
  end;
  if (DefaultExt = '') or (DefaultExt = null) then
    DefaultExt := '*';

  FileNameBuffer := AllocMem(FileNameBufferLen * 2 + 2);

  if Length(ADialog.FileName) > FileNameBufferLen then
    FileNameBufferSize := FileNameBufferLen
  else
    FileNameBufferSize := Length(ADialog.FileName);

  Move(PChar(ADialog.FileName)^, FileNameBuffer^, FileNameBufferSize * 2);

  if (Filter = '') or (Filter = null) then
    Filter := 'All File Types(*.*)' + #0 + '*.*' + #0 + #0;
  // Default -> avoid empty combobox

  AFiles.Clear;

  FillChar(SaveFile, SizeOf(SaveFile), 0);
  SaveFile.hInstance := hInstance;
  SaveFile.lStructSize := SizeOf(SaveFile);
  SaveFile.nFilterIndex := 0;
  SaveFile.hWndOwner := OwnerHwnd;

  SaveFile.lpstrFile := FileNameBuffer;
  SaveFile.lpstrFilter := PChar(Filter);
  if ADialog.Title <> '' then
    SaveFile.lpstrTitle := PChar(ADialog.Title);
  SaveFile.lpstrInitialDir := PChar(InitialDir);
  SaveFile.lpstrDefExt := PChar(DefaultExt);
  SaveFile.lpstrFile := FileNameBuffer;

  SaveFile.nMaxFile := FileNameBufferLen + 1; // Size in TCHARs
  SaveFile.nFilterIndex := ADialog.FilterIndex;

  SaveFile.Flags := OFN_EXPLORER;
  for Option := Low(Option) to High(Option) do
    if Option in ADialog.Options then
      SaveFile.Flags := SaveFile.Flags or OpenOptions[Option];
  if TOpenOption.ofAllowMultiSelect in ADialog.Options then
    SaveFile.Flags := SaveFile.Flags or OFN_ALLOWMULTISELECT;
  WindowList := nil;
  try
    WindowList := DisableTaskWindows(SaveFile.hWndOwner);
    Result := GetSaveFileName(SaveFile);
  finally
    EnableTaskWindows(WindowList);
  end;

  if Result then
    FileName := FileNameBuffer;
  GetFileNames(SaveFile, FileName, AFiles, ADialog.Options);
  ADialog.FileName := FileName;
  if (SaveFile.Flags and OFN_EXTENSIONDIFFERENT) <> 0 then
    ADialog.Options := ADialog.Options + [TOpenOption.ofExtensionDifferent]
  else
    ADialog.Options := ADialog.Options - [TOpenOption.ofExtensionDifferent];
  if (SaveFile.Flags and OFN_READONLY) <> 0 then
    ADialog.Options := ADialog.Options + [TOpenOption.ofReadOnly]
  else
    ADialog.Options := ADialog.Options - [TOpenOption.ofReadOnly];
  ADialog.FilterIndex := SaveFile.nFilterIndex;
  FreeMem(FileNameBuffer);
end;

procedure GetPrinter(var DeviceMode, DeviceNames: HGLOBAL);
var
  Device, Driver, Port: array [0 .. 1023] of Char;
  DevNames: PDevNames;
  Offset: PChar;
begin
  (Printer as TPrinterWin).GetPrinter(Device, Driver, Port, DeviceMode);
  if DeviceMode <> 0 then
  begin
    DeviceNames := GlobalAlloc(GHND, SizeOf(TDevNames) + (StrLen(Device) + StrLen(Driver) + StrLen(Port) + 3) *
      SizeOf(Char));
    DevNames := PDevNames(GlobalLock(DeviceNames));
    try
      Offset := PChar(PByte(DevNames) + SizeOf(TDevNames));
      DevNames^.wDriverOffset := Offset - PChar(DevNames);
      Offset := StrECopy(Offset, Driver) + 1;
      DevNames^.wDeviceOffset := Offset - PChar(DevNames);
      Offset := StrECopy(Offset, Device) + 1;
      DevNames^.wOutputOffset := Offset - PChar(DevNames);;
      StrCopy(Offset, Port);
    finally
      GlobalUnlock(DeviceNames);
    end;
  end;
end;

procedure SetPrinter(DeviceMode, DeviceNames: HGLOBAL);
var
  DevNames: PDevNames;
begin
  DevNames := PDevNames(GlobalLock(DeviceNames));
  try
    (Printer as TPrinterWin).SetPrinter(PChar(DevNames) + DevNames^.wDeviceOffset,
      PChar(DevNames) + DevNames^.wDriverOffset, PChar(DevNames) + DevNames^.wOutputOffset, DeviceMode);
  finally
    GlobalUnlock(DeviceNames);
    GlobalFree(DeviceNames);
  end;
end;

function CopyData(Handle: THandle): THandle;
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
        if (Src <> nil) and (Dest <> nil) then
          Move(Src^, Dest^, Size);
      finally
        GlobalUnlock(Handle);
        GlobalUnlock(Result);
      end
  end
  else
    Result := 0;
end;

function TFMXDialogService.DialogPrint(var ACollate, APrintToFile: Boolean; var AFromPage, AToPage, ACopies: Integer;
  AMinPage, AMaxPage: Integer; var APrintRange: TPrintRange; AOptions: TPrintDialogOptions): Boolean;
const
  PrintRanges: array [TPrintRange] of Integer = (PD_ALLPAGES, PD_SELECTION, PD_PAGENUMS);
var
  PrintDlgRec: TPrintDlg;
  DevHandle: HGLOBAL;
  WindowList: Pointer;
begin
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), 0);
  PrintDlgRec.hInstance := hInstance;
  PrintDlgRec.lStructSize := SizeOf(PrintDlgRec);

  PrintDlgRec.hWndOwner := GetHWND;

  GetPrinter(DevHandle, PrintDlgRec.hDevNames);
  PrintDlgRec.hDevMode := CopyData(DevHandle);
  PrintDlgRec.Flags := PrintRanges[APrintRange];
  if ACollate then
    Inc(PrintDlgRec.Flags, PD_COLLATE);
  if not (TPrintDialogOption.poPrintToFile in AOptions) then
    Inc(PrintDlgRec.Flags, PD_HIDEPRINTTOFILE);
  if not (TPrintDialogOption.poPageNums in AOptions) then
    Inc(PrintDlgRec.Flags, PD_NOPAGENUMS);
  if not (TPrintDialogOption.poSelection in AOptions) then
    Inc(PrintDlgRec.Flags, PD_NOSELECTION);
  if TPrintDialogOption.poDisablePrintToFile in AOptions then
    Inc(PrintDlgRec.Flags, PD_DISABLEPRINTTOFILE);
  if APrintToFile then
    Inc(PrintDlgRec.Flags, PD_PRINTTOFILE);
  if TPrintDialogOption.poHelp in AOptions then
    Inc(PrintDlgRec.Flags, PD_SHOWHELP);
  if not (TPrintDialogOption.poWarning in AOptions) then
    Inc(PrintDlgRec.Flags, PD_NOWARNING);
  PrintDlgRec.nFromPage := AFromPage;
  PrintDlgRec.nToPage := AToPage;
  PrintDlgRec.nMinPage := AMinPage;
  PrintDlgRec.nMaxPage := AMaxPage;
  WindowList := nil;
  try
    WindowList := DisableTaskWindows(PrintDlgRec.hWndOwner);
    Result := PrintDlg(PrintDlgRec);
  finally
    EnableTaskWindows(WindowList);
  end;

  if Result then
  begin
    SetPrinter(PrintDlgRec.hDevMode, PrintDlgRec.hDevNames);
    ACollate := PrintDlgRec.Flags and PD_COLLATE <> 0;
    APrintToFile := PrintDlgRec.Flags and PD_PRINTTOFILE <> 0;
    if PrintDlgRec.Flags and PD_SELECTION <> 0 then
      APrintRange := TPrintRange.prSelection
    else if PrintDlgRec.Flags and PD_PAGENUMS <> 0 then
      APrintRange := TPrintRange.prPageNums
    else
      APrintRange := TPrintRange.prAllPages;
    AFromPage := PrintDlgRec.nFromPage;
    AToPage := PrintDlgRec.nToPage;
  end
  else
  begin
    if PrintDlgRec.hDevMode <> 0 then
    begin
      GlobalFree(PrintDlgRec.hDevMode);
      PrintDlgRec.hDevMode := 0;
    end;
    if PrintDlgRec.hDevNames <> 0 then
    begin
      GlobalFree(PrintDlgRec.hDevNames);
      PrintDlgRec.hDevNames := 0;
    end;
  end;
end;

function TFMXDialogService.DialogPrinterSetup: Boolean;
var
  PrintDlgRec: TPrintDlg;
  DevHandle: THandle;
  WindowList: Pointer;
begin
  FillChar(PrintDlgRec, SizeOf(PrintDlgRec), 0);
  PrintDlgRec.lStructSize := SizeOf(PrintDlgRec);
  PrintDlgRec.hInstance := SysInit.hInstance;
  GetPrinter(DevHandle, PrintDlgRec.hDevNames);
  PrintDlgRec.hDevMode := CopyData(DevHandle);
  PrintDlgRec.Flags := PD_PRINTSETUP;

  PrintDlgRec.hWndOwner := GetHWND;
  WindowList := nil;
  try
    WindowList := DisableTaskWindows(PrintDlgRec.hWndOwner);
    Result := PrintDlg(PrintDlgRec);
  finally
    EnableTaskWindows(WindowList);
  end;

  if Result then
    SetPrinter(PrintDlgRec.hDevMode, PrintDlgRec.hDevNames)
  else
  begin
    if PrintDlgRec.hDevMode <> 0 then
      GlobalFree(PrintDlgRec.hDevMode);
    if PrintDlgRec.hDevNames <> 0 then
      GlobalFree(PrintDlgRec.hDevNames);
  end;
end;

function TFMXDialogService.PageSetupGetDefaults(var AMargin, AMinMargin: TRect; var APaperSize: TPointF;
  AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
var
  PageSetupDlgRec: TPageSetupDlg;
  WindowList: Pointer;
begin
  Result := False;
  if TPrinterWin(Printer).Count = 0 then
    Exit;

  FillChar(PageSetupDlgRec, SizeOf(PageSetupDlgRec), 0);
  PageSetupDlgRec.lStructSize := SizeOf(PageSetupDlgRec);
  PageSetupDlgRec.hInstance := SysInit.hInstance;
  case AUnits of
    // pmDefault    : Read from locale settings by the dialog
    TPageMeasureUnits.pmInches:
      Inc(PageSetupDlgRec.Flags, PSD_INTHOUSANDTHSOFINCHES);
    TPageMeasureUnits.pmMillimeters:
      Inc(PageSetupDlgRec.Flags, PSD_INHUNDREDTHSOFMILLIMETERS);
  end;
  if TPageSetupDialogOption.psoDefaultMinMargins in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DEFAULTMINMARGINS);
  if TPageSetupDialogOption.psoDisableMargins in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEMARGINS);
  if TPageSetupDialogOption.psoDisableOrientation in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEORIENTATION);
  if TPageSetupDialogOption.psoDisablePagePainting in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEPAGEPAINTING);
  if TPageSetupDialogOption.psoDisablePaper in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEPAPER);
  if TPageSetupDialogOption.psoDisablePrinter in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEPRINTER);

  PageSetupDlgRec.ptPaperSize.X := Round(APaperSize.X);
  PageSetupDlgRec.ptPaperSize.Y := Round(APaperSize.Y);
  PageSetupDlgRec.rtMinMargin.Left := AMinMargin.Left;
  PageSetupDlgRec.rtMinMargin.Top := AMinMargin.Top;
  PageSetupDlgRec.rtMinMargin.Right := AMinMargin.Right;
  PageSetupDlgRec.rtMinMargin.Bottom := AMinMargin.Bottom;
  PageSetupDlgRec.rtMargin.Left := AMargin.Left;
  PageSetupDlgRec.rtMargin.Top := AMargin.Top;
  PageSetupDlgRec.rtMargin.Right := AMargin.Right;
  PageSetupDlgRec.rtMargin.Bottom := AMargin.Bottom;

  PageSetupDlgRec.Flags := PageSetupDlgRec.Flags or PSD_RETURNDEFAULT;
  PageSetupDlgRec.hDevNames := 0;
  PageSetupDlgRec.hDevMode := 0;

  PageSetupDlgRec.hWndOwner := GetHWND;
  WindowList := nil;
  try
    WindowList := DisableTaskWindows(PageSetupDlgRec.hWndOwner);
    Result := PageSetupDlg(PageSetupDlgRec);
  finally
    EnableTaskWindows(WindowList);
  end;

  if Result then
  begin
    APaperSize.X := PageSetupDlgRec.ptPaperSize.X;
    APaperSize.Y := PageSetupDlgRec.ptPaperSize.Y;
    AMargin.Left := PageSetupDlgRec.rtMargin.Left;
    AMargin.Top := PageSetupDlgRec.rtMargin.Top;
    AMargin.Right := PageSetupDlgRec.rtMargin.Right;
    AMargin.Bottom := PageSetupDlgRec.rtMargin.Bottom;
    if PageSetupDlgRec.hDevMode <> 0 then
    begin
      GlobalFree(PageSetupDlgRec.hDevMode);
      PageSetupDlgRec.hDevMode := 0;
    end;
    if PageSetupDlgRec.hDevNames <> 0 then
    begin
      GlobalFree(PageSetupDlgRec.hDevNames);
      PageSetupDlgRec.hDevNames := 0;
    end;
  end;
end;

function TFMXDialogService.DialogPageSetup(var AMargin, AMinMargin: TRect; var APaperSize: TPointF;
  var AUnits: TPageMeasureUnits; AOptions: TPageSetupDialogOptions): Boolean;
var
  PageSetupDlgRec: TPageSetupDlg;
  DevHandle: THandle;
  WindowList: Pointer;
begin
  FillChar(PageSetupDlgRec, SizeOf(PageSetupDlgRec), 0);
  PageSetupDlgRec.lStructSize := SizeOf(PageSetupDlgRec);
  PageSetupDlgRec.hInstance := SysInit.hInstance;
  GetPrinter(DevHandle, PageSetupDlgRec.hDevNames);
  PageSetupDlgRec.hDevMode := CopyData(DevHandle);

  PageSetupDlgRec.hWndOwner := GetHWND;

  case AUnits of
    TPageMeasureUnits.pmInches:
      Inc(PageSetupDlgRec.Flags, PSD_INTHOUSANDTHSOFINCHES);
    TPageMeasureUnits.pmMillimeters:
      Inc(PageSetupDlgRec.Flags, PSD_INHUNDREDTHSOFMILLIMETERS);
  end;
  if TPageSetupDialogOption.psoDefaultMinMargins in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DEFAULTMINMARGINS);
  if TPageSetupDialogOption.psoDisableMargins in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEMARGINS);
  if TPageSetupDialogOption.psoDisableOrientation in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEORIENTATION);
  if TPageSetupDialogOption.psoDisablePagePainting in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEPAGEPAINTING);
  if TPageSetupDialogOption.psoDisablePaper in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEPAPER);
  if TPageSetupDialogOption.psoDisablePrinter in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_DISABLEPRINTER);
  if TPageSetupDialogOption.psoMargins in AOptions then
  begin
    Inc(PageSetupDlgRec.Flags, PSD_MARGINS);
    PageSetupDlgRec.rtMargin.Left := AMargin.Left;
    PageSetupDlgRec.rtMargin.Top := AMargin.Top;
    PageSetupDlgRec.rtMargin.Right := AMargin.Right;
    PageSetupDlgRec.rtMargin.Bottom := AMargin.Bottom;
  end;
  if TPageSetupDialogOption.psoMinMargins in AOptions then
  begin
    Inc(PageSetupDlgRec.Flags, PSD_MINMARGINS);
    PageSetupDlgRec.rtMinMargin.Left := AMinMargin.Left;
    PageSetupDlgRec.rtMinMargin.Top := AMinMargin.Top;
    PageSetupDlgRec.rtMinMargin.Right := AMinMargin.Right;
    PageSetupDlgRec.rtMinMargin.Bottom := AMinMargin.Bottom;
  end;
  if TPageSetupDialogOption.psoShowHelp in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_SHOWHELP);
  if not (TPageSetupDialogOption.psoWarning in AOptions) then
    Inc(PageSetupDlgRec.Flags, PSD_NOWARNING);
  if TPageSetupDialogOption.psoNoNetworkButton in AOptions then
    Inc(PageSetupDlgRec.Flags, PSD_NONETWORKBUTTON);

  // Set the user defined margins and page size
  // ptPaperSize.X := APaperSize.X;
  // ptPaperSize.Y := APaperSize.Y;
  WindowList := nil;
  try
    WindowList := DisableTaskWindows(PageSetupDlgRec.hWndOwner);
    Result := PageSetupDlg(PageSetupDlgRec);
  finally
    EnableTaskWindows(WindowList);
  end;

  if Result then
  begin
    APaperSize.X := PageSetupDlgRec.ptPaperSize.X;
    APaperSize.Y := PageSetupDlgRec.ptPaperSize.Y;
    AMargin.Left := PageSetupDlgRec.rtMargin.Left;
    AMargin.Top := PageSetupDlgRec.rtMargin.Top;
    AMargin.Right := PageSetupDlgRec.rtMargin.Right;
    AMargin.Bottom := PageSetupDlgRec.rtMargin.Bottom;
    SetPrinter(PageSetupDlgRec.hDevMode, PageSetupDlgRec.hDevNames)
  end
  else
  begin
    if PageSetupDlgRec.hDevMode <> 0 then
    begin
      GlobalFree(PageSetupDlgRec.hDevMode);
      PageSetupDlgRec.hDevMode := 0;
    end;
    if PageSetupDlgRec.hDevNames <> 0 then
    begin
      GlobalFree(PageSetupDlgRec.hDevNames);
      PageSetupDlgRec.hDevNames := 0;
    end;
  end;
end;

function EnumButtons(Wnd: HWND; Data: TFMXDialogService.PDialogData): BOOL; stdcall;
const
  MaxStrLen = 64;
var
  PStr: PChar;
  I: Integer;
begin
  PStr := StrAlloc(MaxStrLen);
  try
    GetClassName(Wnd, PStr, MaxStrLen);
    if string.Compare(PStr, WC_BUTTON, [coIgnoreCase]) = 0 then
    begin
      I := GetWindowLong(Wnd, GWL_ID);
      if (I >= Low(Data.Buttons)) and (I <= High(Data.Buttons)) then
      begin
        Data.Buttons[I] := Wnd;
        GetWindowRect(Wnd, Data.Rects[I]);
        Winapi.Windows.ScreenToClient(Data.Dialog, Data.Rects[I].TopLeft);
        Winapi.Windows.ScreenToClient(Data.Dialog, Data.Rects[I].BottomRight);
      end;
    end;
  finally
    StrDispose(PStr);
  end;
  Result := True;
end;

function MessageDialogHook(nCode: Integer; AwParam: WParam; AlParam: LParam): LRESULT; stdcall;
const
  HideButtonFlafs = SWP_NOZORDER or SWP_NOACTIVATE or SWP_NOSENDCHANGING or SWP_SHOWWINDOW;

  procedure HideRetry(const Data: TFMXDialogService.TDialogData);
  var
    R: TRect;
  begin
    ShowWindow(Data.Buttons[IDRETRY], SW_HIDE);
    R := Data.Rects[IDRETRY];
    SetWindowPos(Data.Buttons[IDABORT], HWND_NOTOPMOST, R.Left, R.Top, R.Width, R.Height, HideButtonFlafs);
  end;

  function GetButtonText(const Data: TFMXDialogService.TDialogData; const Id: Integer): string;
  var
    L: Integer;
    Wnd: HWND;
  begin
    Result := '';
    if (Id >= Low(Data.Buttons)) and (Id <= High(Data.Buttons)) then
    begin
      if Data.Buttons[Id] <> 0 then
        Wnd := Data.Buttons[Id]
      else
        Wnd := Data.CustomButtons[Id];
      if Wnd <> 0 then
      begin
        L := GetWindowTextLength(Wnd);
        SetLength(Result, L + 1);
        GetWindowText(Wnd, PChar(Result), L + 1);
        SetLength(Result, L);
      end;
    end;
  end;

  procedure SetButtonText(const Data: TFMXDialogService.TDialogData; const Id: Integer; const Caption: string);
  begin
    if (Id >= Low(Data.Buttons)) and (Id <= High(Data.Buttons)) then
    begin
      if Data.Buttons[Id] <> 0 then
        SetWindowText(Data.Buttons[Id], PChar(Caption));
      if Data.CustomButtons[Id] <> 0 then
        SetWindowText(Data.CustomButtons[Id], PChar(Caption));
    end;
  end;

  function TextSize(const Wnd: HWND; const S: string): TRect;
  var
    DC: HDC;
    OldFont: HFONT;
  begin
    DC := GetDc(Wnd);
    try
      OldFont := SelectObject(DC, TFMXDialogService.Current.Font);
      try
        Result := TRect.Create(0, 0, 2000, 2000);
        DrawText(DC, PChar(S), -1, Result, DT_CALCRECT);
      finally
        SelectObject(DC, OldFont);
      end;
    finally
      ReleaseDC(Wnd, DC);
    end;
  end;

  procedure SetButtonRect(var Data: TFMXDialogService.TDialogData; const Id, Padding, Margin: Integer; var R: TRect);
  var
    Wnd: HWND;
  begin
    if (Id >= Low(Data.CustomButtons)) and (Id <= High(Data.CustomButtons)) then
    begin
      if Data.Buttons[Id] <> 0 then
        Wnd := Data.Buttons[Id]
      else
        Wnd := Data.CustomButtons[Id];
      if Wnd <> 0 then
      begin
        R.Right := R.Left + TextSize(Wnd, GetButtonText(Data, Id)).Width + Padding;
        R.Offset(-R.Width - Margin, 0);
        SetWindowPos(Wnd, HWND_NOTOPMOST, R.Left, R.Top, R.Width, R.Height, HideButtonFlafs);
        Data.Rects[Id] := R;
      end;
    end;
  end;

  function CreateButton(var Data: TFMXDialogService.TDialogData; const Id: Integer; const Caption: string): Boolean;
  var
    I: Integer;
    LStyle, LExStyle, LParent, L: NativeInt;
  begin
    Result := False;
    if (Id >= Low(Data.CustomButtons)) and (Id <= High(Data.CustomButtons)) then
    begin
      LStyle := 0;
      LExStyle := 0;
      LParent := 0;
      for I := Low(Data.Buttons) to High(Data.Buttons) do
        if Data.Buttons[I] <> 0 then
        begin
          LStyle := GetWindowLong(Data.Buttons[I], GWL_STYLE) and (not BS_DEFPUSHBUTTON);
          LExStyle := GetWindowLong(Data.Buttons[I], GWL_EXSTYLE);
          LParent := GetWindowLong(Data.Buttons[I], GWL_HWNDPARENT);
          Break;
        end;
      if LParent <> 0 then
      begin
        Data.CustomButtons[Id] := CreateWindowEx(LExStyle, WC_BUTTON, PChar(Caption), LStyle, 0, Id * 22, 60, 20,
          LParent, 0, hInstance, nil);
        SetWindowLong(Data.CustomButtons[Id], GWL_ID, Id);
        L := 0;
        SendMessage(Data.CustomButtons[Id], WM_SETFONT, TFMXDialogService.Current.Font, L);
      end;
    end;
  end;

var
  Data: TFMXDialogService.TDialogData;
  I, Padding, Margin: Integer;
  R: TRect;
begin
  case nCode of
    HCBT_ACTIVATE:
      begin
        if TFMXDialogService.Current.InitLastData(AwParam) and TFMXDialogService.Current.GetData(AwParam, Data) then
        begin
          if Data.MsgDlgButtons * mbAbortIgnore = mbAbortIgnore then
            HideRetry(Data)
          else if Data.MsgDlgButtons * mbYesAllNoAllCancel = mbYesAllNoAllCancel then
          begin
            R := TextSize(Data.Buttons[IDYES], GetButtonText(Data, Data.Buttons[IDYES]));
            Padding := (Data.Rects[IDYES].Height - R.Height) div 2;
            Margin := Data.Rects[IDNO].Left - Data.Rects[IDYES].Left - Data.Rects[IDNO].Width;
            CreateButton(Data, IDRETRY, Translate(SMsgDlgYestoAll));
            CreateButton(Data, IDIGNORE, Translate(SMsgDlgNoToAll));
            SetButtonText(Data, IDYES, Translate(SMsgDlgYes));
            SetButtonText(Data, IDNO, Translate(SMsgDlgNO));
            SetButtonText(Data, IDCANCEL, Translate(SMsgDlgCancel));
            SetButtonText(Data, IDHELP, Translate(SMsgDlgHelp));
            R := Data.Rects[IDCANCEL];
            R.Left := R.Right + Margin;
            SetButtonRect(Data, IDCANCEL, Padding, Margin, R);
            SetButtonRect(Data, IDIGNORE, Padding, Margin, R);
            SetButtonRect(Data, IDNO, Padding, Margin, R);
            SetButtonRect(Data, IDRETRY, Padding, Margin, R);
            SetButtonRect(Data, IDYES, Padding, Margin, R);
            TFMXDialogService.Current.SetData(AwParam, Data);
          end;
        end;
      end;
    HCBT_DESTROYWND:
      if TFMXDialogService.Current.GetData(AwParam, Data) then
      begin
        for I := Low(Data.CustomButtons) to High(Data.CustomButtons) do
          if Data.CustomButtons[I] <> 0 then
          begin
            DestroyWindow(Data.CustomButtons[I]);
            Data.CustomButtons[I] := 0;
          end;
        TFMXDialogService.Current.SetData(AwParam, Data);
      end;
  end;
  Result := CallNextHookEx(TFMXDialogService.Current.OldHook, nCode, AwParam, AlParam);
end;

procedure TFMXDialogService.BeginHook(const AMsgDlgButtons: TMsgDlgButtons);
var
  Rec: TDialogData;
begin
  if GetCount = 0 then
    FOldHook := SetWindowsHookEx(WH_CBT, @MessageDialogHook, 0, GetCurrentThreadId);
  if FOldHook <> 0 then
  begin
    if FHookList = nil then
      FHookList := TList<TDialogData>.Create;
    FillChar(Rec, SizeOf(Rec), 0);
    Rec.MsgDlgButtons := AMsgDlgButtons;
    FHookList.Add(Rec);
  end;
end;

procedure TFMXDialogService.EndHook;
begin
  if GetCount > 0 then
  begin
    FHookList.Delete(FHookList.Count - 1);
    if GetCount = 0 then
    begin
      if FOldHook <> 0 then
      begin
        UnhookWindowsHookEx(FOldHook);
        FOldHook := 0;
      end;
      if FFont <> 0 then
      begin
        CheckWinapiResult(DeleteObject(FFont));
        FFont := 0;
      end;
    end;
  end;
end;

function TFMXDialogService.ConvertResult(const ModalResult: Integer): Integer;
begin
  Result := ModalResult;
  if (GetCount > 0) and (FHookList[GetCount - 1].MsgDlgButtons * mbYesAllNoAllCancel = mbYesAllNoAllCancel) then
  begin
    case ModalResult of
      IDRETRY:
        Result := mrYesToAll;
      IDIGNORE:
        Result := mrNoToAll;
    end;
  end;
end;

function TFMXDialogService.GetCount: Integer;
begin
  if FHookList <> nil then
    Result := FHookList.Count
  else
    Result := 0;
end;

function TFMXDialogService.NeedInit: Boolean;
begin
  Result := (GetCount > 0) and (FHookList[GetCount - 1].Dialog = 0);
end;

function TFMXDialogService.InitLastData(const ADialog: HWND): Boolean;
var
  Data: TDialogData;
begin
  Result := (ADialog <> 0) and (ADialog <> INVALID_HANDLE_VALUE) and NeedInit;
  if Result then
  begin
    Data := FHookList[GetCount - 1];
    Data.Dialog := ADialog;
    EnumChildWindows(Data.Dialog, @EnumButtons, LParam(@Data));
    FHookList[GetCount - 1] := Data;
  end;
end;

function TFMXDialogService.GetData(const ADialog: HWND; var AData: TDialogData): Boolean;
var
  I: Integer;
begin
  if (ADialog <> 0) and (ADialog <> INVALID_HANDLE_VALUE) then
    for I := GetCount - 1 downto 0 do
      if FHookList[I].Dialog = ADialog then
      begin
        AData := FHookList[I];
        Exit(True);
      end;
  Result := False;
end;

function TFMXDialogService.GetFont: HFONT;
var
  NonClientMetrics: TNonClientMetrics;
  Siz: Integer;
begin
  if FFont = 0 then
  begin
    Siz := NonClientMetrics.SizeOf;
    FillChar(NonClientMetrics, Siz, 0);
    NonClientMetrics.cbSize := Siz;
    CheckWinapiResult(SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0));
    FFont := CheckWinapiHandle(CreateFontIndirect(NonClientMetrics.lfMessageFont));
  end;
  Result := FFont;
end;

function TFMXDialogService.GetHWND: HWND;
begin
  if (Screen <> nil) and (Screen.ActiveForm <> nil) then
    Result := FormToHWND(Screen.ActiveForm)
  else
    Result := ApplicationHWND;
end;

function TFMXDialogService.SetData(const ADialog: HWND; const AData: TDialogData): Boolean;
var
  I: Integer;
  Data: TDialogData;
begin
  if (ADialog <> 0) and (ADialog <> INVALID_HANDLE_VALUE) then
    for I := GetCount - 1 downto 0 do
      if FHookList[I].Dialog = ADialog then
      begin
        Data := AData;
        Data.Dialog := ADialog;
        FHookList[I] := Data;
        Exit(True);
      end;
  Result := False;
end;

function TFMXDialogService.MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const ADefaultButton: TMsgDlgBtn; const AX, AY: Integer; const AHelpCtx: THelpContext;
  const AHelpFileName: string): Integer;
var
  Params: tagMSGBOXPARAMSW;
  LButtons: TMsgDlgButtons;
begin
  FillChar(Params, SizeOf(Params), 0);
  Params.cbSize := SizeOf(Params);
  Params.hInstance := hInstance;
  Params.hWndOwner := GetHWND;
  Params.dwContextHelpId := AHelpCtx;
  if ADialogType <> TMsgDlgType.mtCustom then
    Params.lpszCaption := PChar(Translate(MsgCaptions[ADialogType]))
  else
    Params.lpszCaption := PChar(Application.Title);
  Params.lpszText := PChar(AMessage);

  LButtons := AButtons - [TMsgDlgBtn.mbHelp];
  if LButtons = [TMsgDlgBtn.mbOK] then
  begin
    Params.dwStyle := MB_OK;
    case ADefaultButton of
      TMsgDlgBtn.mbHelp:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON2;
    end;
  end
  else if LButtons = mbOkCancel then
  begin
    Params.dwStyle := MB_OKCANCEL;
    case ADefaultButton of
      TMsgDlgBtn.mbCancel:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON2;
      TMsgDlgBtn.mbHelp:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON3;
    end;
  end
  else if (LButtons = mbYesAllNoAllCancel) or (LButtons = mbYesNoCancel) then
  begin
    Params.dwStyle := MB_YESNOCANCEL;
    case ADefaultButton of
      TMsgDlgBtn.mbNo:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON2;
      TMsgDlgBtn.mbCancel:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON3;
      TMsgDlgBtn.mbHelp:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON4;
    end;
  end
  else if (LButtons = mbAbortRetryIgnore) or (LButtons = mbAbortIgnore) then
  begin
    Params.dwStyle := MB_ABORTRETRYIGNORE;
    case ADefaultButton of
      TMsgDlgBtn.mbRetry:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON2;
      TMsgDlgBtn.mbCancel:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON3;
      TMsgDlgBtn.mbHelp:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON4;
    end;
  end
  else if (LButtons = mbYesNo) then
  begin
    Params.dwStyle := MB_YESNO;
    case ADefaultButton of
      TMsgDlgBtn.mbNo:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON2;
      TMsgDlgBtn.mbHelp:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON3;
    end;
  end
  else if (LButtons = [TMsgDlgBtn.mbRetry, TMsgDlgBtn.mbCancel]) then
  begin
    Params.dwStyle := MB_RETRYCANCEL;
    case ADefaultButton of
      TMsgDlgBtn.mbCancel:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON2;
      TMsgDlgBtn.mbHelp:
        Params.dwStyle := Params.dwStyle or MB_DEFBUTTON3;
    end;
  end;
  if TMsgDlgBtn.mbHelp in AButtons then
    Params.dwStyle := Params.dwStyle or MB_HELP;

  Params.dwStyle := Params.dwStyle or MsgIcons[ADialogType];

  if (LButtons = mbYesAllNoAllCancel) or (LButtons = mbAbortIgnore) then
  begin
    TFMXDialogService.Current.BeginHook(AButtons);
    try
      Result := MessageBoxIndirect(Params);
      Result := TFMXDialogService.Current.ConvertResult(Result);
    finally
      TFMXDialogService.Current.EndHook;
    end;
  end
  else
    Result := MessageBoxIndirect(Params);
end;

procedure TFMXDialogService.MessageDialog(const AMessage: string; const ADialogType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const ADefaultButton: TMsgDlgBtn; const AX, AY: Integer; const AHelpCtx: THelpContext;
  const AHelpFileName: string; const ACloseDialogProc: TInputCloseDialogProc);
var
  LRESULT: TModalResult;
begin
  LRESULT := MessageDialog(AMessage, ADialogType, AButtons, ADefaultButton, AX, AY, AHelpCtx, AHelpFileName);
  if Assigned(ACloseDialogProc) then
    ACloseDialogProc(LRESULT);
end;

procedure TFMXDialogService.InputQuery(const ACaption: string; const APrompts, ADefaultValues: array of string;
  const ACloseQueryProc: TInputCloseQueryProc);
var
  Result: TModalResult;
  LValues: array of string;
  I: Integer;
begin
  Result := mrCancel;
  SetLength(LValues, Length(ADefaultValues));
  for I := Low(ADefaultValues) to High(ADefaultValues) do
    LValues[I] := ADefaultValues[I];
  if InputQuery(ACaption, APrompts, LValues) then
    Result := mrOk;
  if Assigned(ACloseQueryProc) then
    ACloseQueryProc(Result, LValues);
end;

function TFMXDialogService.InputQuery(const ACaption: string; const APrompts: array of string;
  var AValues: array of string; const ACloseQueryFunc: TInputCloseQueryFunc): Boolean;
begin
  Result := DefaultInputQuery(ACaption, APrompts, AValues, ACloseQueryFunc);
end;

{ IFMXDialogServiceSync }
procedure TFMXDialogService.ShowMessageSync(const AMessage: string);
begin
   MessageDialogSync(AMessage, TMsgDlgType.mtCustom, [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0);
end;

function TFMXDialogService.MessageDialogSync(const AMessage: string; const ADialogType: TMsgDlgType;
  const AButtons: TMsgDlgButtons; const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext): Integer;
begin
  MessageDialogCheckInUIThread;
  Result := MessageDialog(AMessage, ADialogType, AButtons, ADefaultButton, 0,0, 0, '');
end;

function TFMXDialogService.InputQuerySync(const ACaption: string; const APrompts: array of string; var AValues: array of string): Boolean;
var
  LResult: Boolean;
  LValues: array of string;
begin
  MessageDialogCheckInUIThread;
  TDialogHelper.InputQuery(ACaption, APrompts, AValues,
    procedure(const AResult: TModalResult; const Values: array of string)
    begin
      LResult := AResult = mrOk;
      SetLength(LValues, Length(Values));
      TArray.Copy<String>(Values, LValues, Length(Values));
    end,
    True);
  Result := LResult;
  TArray.Copy<String>(LValues, AValues, Length(AValues));
end;

{ IFMXDialogServiceAsync }

procedure TFMXDialogService.ShowMessageAsync(const AMessage: string);
var
  LProc: TInputCloseDialogProc;
begin
  LProc := nil;
  ShowMessageAsync(AMessage, LProc);
end;

procedure TFMXDialogService.ShowMessageAsync(const AMessage: string; const ACloseDialogProc: TInputCloseDialogProc);
begin
  MessageDialogCheckInUIThread;
  TDialogHelper.ShowMessage(AMessage, ACloseDialogProc, False);
end;

procedure TFMXDialogService.ShowMessageAsync(const AMessage: string; const ACloseDialogEvent: TInputCloseDialogEvent;
      const AContext: TObject);
begin
  ShowMessageAsync(AMessage,
    procedure(const AResult: TModalResult)
    begin
      if Assigned(ACloseDialogEvent) then
        ACloseDialogEvent(AContext, AResult);
    end);
end;

procedure TFMXDialogService.MessageDialogAsync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
  const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext; const ACloseDialogProc: TInputCloseDialogProc);
begin
  MessageDialogCheckInUIThread;
  TDialogHelper.MessageDialog(AMessage, ADialogType, AButtons, ADefaultButton, AHelpCtx, ACloseDialogProc, False);
end;

procedure TFMXDialogService.MessageDialogAsync(const AMessage: string; const ADialogType: TMsgDlgType; const AButtons: TMsgDlgButtons;
  const ADefaultButton: TMsgDlgBtn; const AHelpCtx: THelpContext; const ACloseDialogEvent: TInputCloseDialogEvent;
  const AContext: TObject);
begin
  MessageDialogAsync(AMessage, ADialogType, AButtons, ADefaultButton, AHelpCtx,
    procedure(const AResult: TModalResult)
    begin
      if Assigned(ACloseDialogEvent) then
        ACloseDialogEvent(AContext, AResult);
    end);
end;

procedure TFMXDialogService.InputQueryAsync(const ACaption: string; const APrompts: array of string;
  const ADefaultValues: array of string; const ACloseQueryProc: TInputCloseQueryProc);
begin
  MessageDialogCheckInUIThread;
  TDialogHelper.InputQuery(ACaption, APrompts, ADefaultValues, ACloseQueryProc, False);
end;

procedure TFMXDialogService.InputQueryAsync(const ACaption: string; const APrompts: array of string;
  const ADefaultValues: array of string; const ACloseQueryEvent: TInputCloseQueryWithResultEvent; const AContext: TObject);
begin
  InputQueryAsync(ACaption, APrompts, ADefaultValues,
    procedure(const AResult: TModalResult; const AValues: array of string)
    begin
      if Assigned(ACloseQueryEvent) then
        ACloseQueryEvent(AContext, AResult, AValues);
    end);
end;

initialization
  TPlatformServices.Current.AddPlatformService(IFMXDialogService, TFMXDialogService.Current);
  TPlatformServices.Current.AddPlatformService(IFMXDialogServiceSync, TFMXDialogService.Current);
  TPlatformServices.Current.AddPlatformService(IFMXDialogServiceAsync, TFMXDialogService.Current);
end.
