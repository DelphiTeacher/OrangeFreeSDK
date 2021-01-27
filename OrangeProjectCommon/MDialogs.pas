{
   Mobile Dialogs

   Delphi Version: Delphi XE5 Version 19.0.13476.4176

   By: flcop(zylove619@hotmail.com)
}


unit MDialogs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.IOUtils, System.StrUtils, System.Generics.Collections, System.Generics.Defaults,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,  FMX.Platform,
  FMX.ListView.Types, FMX.StdCtrls, FMX.Objects, FMX.ListView, FMX.Layouts, FMX.VirtualKeyboard,
  FMX.Memo, FMX.Edit, FMX.ExtCtrls, FMX.Ani, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Controls.Presentation

  ,System.Messaging   //FMX.Messages,

  ;

type
  TMOpenDialog = class(TForm)
    LVList: TListView;
    AniIndicator: TAniIndicator;
    SaveInput: TCalloutRectangle;
    PBFilter: TPopupBox;
    ESaveName: TEdit;
    RHeader: TRectangle;
    TextRoot: TText;
    BRoot: TRectangle;
    BDirUp: TRectangle;
    TextDir: TText;
    RPath: TRectangle;
    TextPath: TText;
    ROpt: TRectangle;
    ROK: TRectangle;
    Text2: TText;
    RCancel: TRectangle;
    Text3: TText;
    Text4: TText;
    Text5: TText;
    Rectangle1: TRectangle;
    Text1: TText;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    TextEmpty: TText;
    Image5: TImage;
    ImageFile: TImage;
    ImageFolder: TImage;
    FloatAnimation1: TFloatAnimation;
    procedure LVListItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure BRootClick(Sender: TObject);
    procedure BDirUpClick(Sender: TObject);
    procedure BRootMouseEnter(Sender: TObject);
    procedure BRootMouseLeave(Sender: TObject);
    procedure ROKClick(Sender: TObject);
    procedure RCancelClick(Sender: TObject);
    procedure ESaveNameMouseEnter(Sender: TObject);
  private type
    TListType = (ltDirectory, ltFile);
  private
    FItemSelectTimer: TTimer;
    FBusy: Boolean;
    FListType: TListType;
    FCurrentDir: string;
    FResultProc: TProc<Boolean, string, Integer>;
    FMultiSelect: Boolean;
    FTitle: string;
    FFileNameComparer: IComparer<string>;
    FFileNameFilter: TFunc<string, Boolean>;
    FFilter: string;
    FFilterList: TStringList;
    FFMXVirtualKeyboardService: IFMXVirtualKeyboardService;
    procedure SetListType(const Value: TListType);
    function GetListArray(const ADir: string; AListType: TListType): TStringDynArray;
    procedure ListDirectories(const ADir: string);
    procedure ListFiles(const AParentDir: string);
    procedure AddItemsToView(const AItems: TStringDynArray; AListType: TListType);
    function WithDelimiter(ADir: string): string;
    function WithoutDelimiter(ADir: string): string;
    procedure LS(const ADir: string);
    procedure DoTimerSelectItem(Sender: TObject);
    procedure SetIndicator(AShow: Boolean);
    function GetFileNameComparer: IComparer<string>;
    function GetFileNameFilter: TFunc<string, Boolean>;
    function DoFilter(AStr: string): Boolean;
    function GetItemType(AItem: TListViewItem): TListType;
    class constructor Create;
    class destructor Destroy;
  protected
    procedure Resize; override;
    procedure DoClose(var CloseAction: TCloseAction); override;
    procedure DoShow; override;
    procedure VirtualKeyboardChangeHandler(const Sender: TObject; const Msg: System.Messaging.TMessage); override;
    procedure DoFileNameFiler(var AArray: TStringDynArray; AFilterProc: TFunc<string, Boolean>); virtual;
    function GetDefaultDir: string; virtual;
    function GetDefaultRootDir: string; virtual;
    function GetFileName: string; virtual;
    procedure DirChanged; virtual;
    procedure DoConfirm; virtual;
    procedure DoCancel; virtual;
    procedure SetFilter(const Value: string); virtual;
    procedure DoDirUp; virtual;
    procedure DoDirToRoot; virtual;
    procedure SetItemImage(const AItem: TListViewItem); virtual;
  public
    class var InitialDir: string;
    class var BMPList: TDictionary<string, TBitmap>;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute(const AResultProc: TProc<Boolean, string, Integer>);
    property ListType: TListType read FListType write SetListType;
    property FileName: string read GetFileName;
    property Title: string read FTitle write FTitle;
    property FileNameComparer: IComparer<string> read GetFileNameComparer write FFileNameComparer;
    property Filter: string read FFilter write SetFilter;
    property FileFilter: TFunc<string, Boolean> read GetFileNameFilter write FFileNameFilter;
    property MultiSelect: Boolean read FMultiSelect write FMultiSelect;
  end;

  TMSaveDialogClass = class of TMOpenDialog;

  TMSaveDialog = class(TMOpenDialog)
  protected
    function GetFileName: string; override;
    procedure DoConfirm; override;
    procedure DoShow; override;
    procedure SetFilter(const Value: string); override;
  end;

var
  GlabelRequestCode:Integer;

procedure GetFileOpenDialog(AResultProc: TProc<Boolean, string, Integer>;const RequestCode: Integer; const AInitialDir: string = '';
          const AFilter: string = ''; AMultiSelect: Boolean = False; AFileFilter: TFunc<string, Boolean> = nil;
          AFileNameComparer: IComparer<string> = nil);

procedure GetFileSaveDialog(AResultProc: TProc<Boolean, string, Integer>; const AInitialDir: string = '';
          const AFilter: string = ''; AFileFilter: TFunc<string, Boolean> = nil; AFileNameComparer: IComparer<string> = nil);


procedure GetSelectDirectoryDialog(AResultProc: TProc<Boolean, string, Integer>;const RequestCode: Integer; const AInitialDir: string = '';
          const AFilter: string = ''; AFileFilter: TFunc<string, Boolean> = nil; AFileNameComparer: IComparer<string> = nil);

implementation

{$R *.fmx}

function GetDialog(AClass: TMSaveDialogClass; const AInitialDir: string; const AFilter: string;
         AFileFilter: TFunc<string, Boolean>; AFileNameComparer: IComparer<string>): TMOpenDialog;
begin
  Result := AClass.Create(nil);
  with Result do
  begin
    if not AInitialDir.Trim.IsEmpty then
      InitialDir := AInitialDir;

    FCurrentDir := InitialDir;  //后面加的   第一次打开指定路径

    Filter := AFilter;
    FileFilter := AFileFilter;
    FileNameComparer := AFileNameComparer;
  end;
end;

procedure GetFileOpenDialog(AResultProc: TProc<Boolean, string, Integer>;const RequestCode: Integer;
          const AInitialDir: string;const AFilter: string;
          AMultiSelect: Boolean; AFileFilter: TFunc<string, Boolean>;
          AFileNameComparer: IComparer<string>);
begin
  GlabelRequestCode:=RequestCode;
  if Assigned(AResultProc) then
    with GetDialog(TMOpenDialog, AInitialDir, AFilter, AFileFilter, AFileNameComparer) do
    begin
      MultiSelect := AMultiSelect;
      Execute(AResultProc);
    end;
end;

procedure GetFileSaveDialog(AResultProc: TProc<Boolean, string, Integer>; const AInitialDir: string;
          const AFilter: string; AFileFilter: TFunc<string, Boolean>; AFileNameComparer: IComparer<string>);
begin
  if Assigned(AResultProc) then
    with GetDialog(TMSaveDialog, AInitialDir, AFilter, AFileFilter, AFileNameComparer) do
      Execute(AResultProc);
end;

procedure GetSelectDirectoryDialog(AResultProc: TProc<Boolean, string, Integer>;const RequestCode: Integer;
          const AInitialDir: string;
          const AFilter: string; AFileFilter: TFunc<string, Boolean>; AFileNameComparer: IComparer<string>);
begin
  GlabelRequestCode:=RequestCode;
  if Assigned(AResultProc) then
    with GetDialog(TMOpenDialog, AInitialDir, AFilter, AFileFilter, AFileNameComparer) do
    begin
      ListType := TListType.ltDirectory;
      Execute(AResultProc);
    end;
end;

{ TMOpenDialog }

procedure TMOpenDialog.AddItemsToView(const AItems: TStringDynArray;
  AListType: TListType);
var
  LItem: string;
  LListItem: TListViewItem;
begin
  if not Assigned(AItems) then
    Exit;
  for LItem in AItems do
  begin
    LListItem := LVList.Items.Add;
    with LListItem do
    begin
      Text := ExtractRelativePath(FCurrentDir, LItem);
      Tag := Ord(AListType);
      Accessory := TAccessoryType.More;
      if AListType = ltDirectory then
        Objects.AccessoryObject.Visible := False
      else
      begin
        if MultiSelect then
          Objects.AccessoryObject.AccessoryType := TAccessoryType.Checkmark;
        Objects.AccessoryObject.Visible := False;
      end;
      SetItemImage(LListItem);
    end;
  end;
end;

procedure TMOpenDialog.SetIndicator(AShow: Boolean);
begin
  with AniIndicator do
  begin
    if AShow then
    begin
      Position.X := (LVList.Width - Width) / 2;
      Position.Y := (LVList.Height - Height) / 2;
    end;
    Visible := AShow;
    Enabled := AShow;
  end;
end;

procedure TMOpenDialog.SetItemImage(const AItem: TListViewItem);
begin
  { BMPList }
  if GetItemType(AItem) = ltDirectory then
    AItem.BitmapRef := ImageFolder.Bitmap
  else
    AItem.BitmapRef := ImageFile.Bitmap;
end;

procedure TMOpenDialog.BDirUpClick(Sender: TObject);
begin
  DoDirUp;
end;

procedure TMOpenDialog.BRootClick(Sender: TObject);
begin
  DoDirToRoot;
end;

procedure TMOpenDialog.BRootMouseEnter(Sender: TObject);
begin
  TFmxObject(Sender).AnimateColor('Fill.Color', TAlphaColorRec.Seagreen);
end;

procedure TMOpenDialog.BRootMouseLeave(Sender: TObject);
begin
  TFmxObject(Sender).AnimateColor('Fill.Color', $FF014051);
end;

class constructor TMOpenDialog.Create;
begin
  BMPList := TDictionary<string, TBitmap>.Create;
end;

constructor TMOpenDialog.Create(AOwner: TComponent);
begin
  inherited;
  FListType := ltFile;
  FullScreen := True;
  FMultiSelect := True;
  FFilterList := TStringList.Create;
  FMultiSelect := False;
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
     IInterface(FFMXVirtualKeyboardService));

  FItemSelectTimer := TTimer.Create(nil);
  FItemSelectTimer.Enabled := False;
  FItemSelectTimer.Interval := 180;
  FItemSelectTimer.OnTimer := DoTimerSelectItem;

  { 所有路径以分隔符结尾: 如 C:\, /mnt/sdcard/ }
  if not DirectoryExists(InitialDir) then
     InitialDir := GetDefaultDir()
  else
     InitialDir := WithDelimiter(InitialDir);

  FCurrentDir := InitialDir;
  with LVList do
  begin
    ItemAppearance.ItemAppearance := 'ImageListItem';
    ItemEditAppearanceName := 'ImageListItemShowCheck';
    EditMode := False;
    CanSwipeDelete := False;
    CanFocus := False;
  end;
end;

destructor TMOpenDialog.Destroy;
begin
  FItemSelectTimer.Free;
  FFilterList.Free;
  inherited;
end;

class destructor TMOpenDialog.Destroy;
begin
  BMPList.Free;
end;

procedure TMOpenDialog.DirChanged;
begin
  LVList.Selected := nil;
  TextPath.Text := FCurrentDir;
  BDirUp.Enabled := not SameText(FCurrentDir, GetDefaultRootDir);
  BRoot.Enabled := BDirUp.Enabled;
  TextEmpty.Visible := (LVList.ItemCount = 0);
end;

procedure TMOpenDialog.DoCancel;
begin
  ModalResult := mrCancel;
end;

procedure TMOpenDialog.DoClose(var CloseAction: TCloseAction);
begin
  inherited;
  CloseAction := TCloseAction.caFree;

  { 退出之前保证关闭虚拟键盘(如果有) }
  with ESaveName do
  begin
    if Assigned(ESaveName.Root) then
      ESaveName.Root.SetFocused(nil);
    ESaveName.Enabled := False;
    if Assigned(FFMXVirtualKeyboardService) then
      FFMXVirtualKeyboardService.HideVirtualKeyboard;
  end;
end;

procedure TMOpenDialog.DoDirToRoot;
var
  LDir: string;
begin
  if FItemSelectTimer.Enabled then
    Exit;
  try
    LDir := GetDefaultRootDir();
    LS(LDir);
  except
  end;
end;

procedure TMOpenDialog.DoDirUp;
var
  LParent: string;
begin
  if FItemSelectTimer.Enabled then
    Exit;
  try
    LParent := WithDelimiter(TDirectory.GetParent(WithoutDelimiter(FCurrentDir)));
    LS(LParent);
  except
  end;
end;

procedure TMOpenDialog.DoFileNameFiler(var AArray: TStringDynArray;
  AFilterProc: TFunc<string, Boolean>);
var
  LTemp: TList<string>;
  LTempStr: string;
begin
  if not Assigned(AArray) or not Assigned(AFilterProc) then
    Exit;
  LTemp := TList<string>.Create;
  try
    for LTempStr in AArray do
      if not AFilterProc(LTempStr) then
        LTemp.Add(LTempStr);
    AArray := TStringDynArray(LTemp.ToArray);
  finally
    LTemp.Free;
  end;
end;

procedure TMOpenDialog.DoConfirm;
begin
  if ( (FListType = ltFile) and (LVList.Selected <> nil)
       and (GetItemType(LVList.Items[LVList.Selected.Index]) = ltFile) )
       or
      (FListType = ltDirectory) then
    ModalResult := mrOK;
end;

procedure TMOpenDialog.DoShow;
begin
  inherited;
  LS(FCurrentDir);
end;

procedure TMOpenDialog.DoTimerSelectItem(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  LS(FCurrentDir);
end;

procedure TMOpenDialog.ESaveNameMouseEnter(Sender: TObject);
begin
{ Delphi XE5 Version 19.0.13476.4176
  Android: 有些输入法有隐藏键(如qq), 当虚拟键盘按下隐藏键后(不会触发
           VirtualKeyboardOnHide事件), 此时再点击编辑框，则再不会显示虚拟键盘,
           所以这里判断下在已经有焦点时，再次触发显示。
  IOS: 暂未测试  }

{$IFDEF ANDROID}
  if TEdit(Sender).IsFocused and Assigned(FFMXVirtualKeyboardService) then
    try
      FFMXVirtualKeyboardService.ShowVirtualKeyboard(TEdit(Sender));
    except
    end;
{$ENDIF}
end;

procedure TMOpenDialog.Execute(const AResultProc: TProc<Boolean, string, integer>);
var
  LResult: Boolean;
begin
  FResultProc := AResultProc;
  ShowModal(procedure (AModalResult: TModalResult)
            begin
              try
                LResult := AModalResult = mrOk;
                if Assigned(FResultProc) then
                begin
                  FResultProc(LResult, FileName, GlabelRequestCode);
                  if LResult then
                    InitialDir := FCurrentDir;
                end;
              finally
                { caFree }
                Close;
              end;
            end);
end;

function TMOpenDialog.DoFilter(AStr: string): Boolean;

  function ExtExist(const AExt: string): Boolean;
  begin
    with FFilterList do
      Result := (IndexOfName(AExt) > -1);
  end;

begin
  Result := False;
  if FileExists(AStr) and (FFilterList.Count > 0) then
    Result := not ExtExist(ExtractFileExt(ExtractFileName(AStr))) ;
end;

function TMOpenDialog.GetDefaultDir: string;
begin
  Result := WithDelimiter(System.IOUtils.TPath.GetPublicPath);
end;

function TMOpenDialog.GetDefaultRootDir: string;
begin
  Result := WithDelimiter(TDirectory.GetDirectoryRoot(GetDefaultDir));
end;

function TMOpenDialog.WithDelimiter(ADir: string): string;
begin
  Result := ADir;
  if RightStr(Result, 1) <> System.SysUtils.PathDelim then
    Result := Result + System.SysUtils.PathDelim;
end;

function TMOpenDialog.WithoutDelimiter(ADir: string): string;
begin
  Result := ADir;
  if RightStr(Result, 1) = System.SysUtils.PathDelim then
    Result := Copy(Result, 1, Result.Length - 1);
end;

function TMOpenDialog.GetFileNameComparer: IComparer<string>;
begin
  if not Assigned(FFileNameComparer) then
    FFileNameComparer :=
      TDelegatedComparer<string>.Create(
      function(const Left, Right: string): Integer
      begin
        Result := CompareStr(LowerCase(Left), LowerCase(Right));
      end);
  Result := FFileNameComparer;
end;

function TMOpenDialog.GetFileNameFilter: TFunc<string, Boolean>;
begin
  Result := FFileNameFilter;
end;

function TMOpenDialog.GetItemType(AItem: TListViewItem): TListType;
begin
  Result := TListType(AItem.Tag);
end;

function TMOpenDialog.GetFileName: string;
var
  I: Integer;
begin
  Result := '';
  if (FListType = ltDirectory) then
    Result := FCurrentDir
  else
  { ltfile }
  if Assigned(LVList.Selected) then
  begin
    if not FMultiSelect then
      Result := FCurrentDir + LVList.Items[LVList.Selected.Index].Text
    else
      with LVList do
      begin
        for I := 0 to Items.Count - 1 do
         { Is file and checked }
          if (GetItemType(Items[I]) = ltFile) and Items[I].Objects.AccessoryObject.Visible then
            Result := Result + (FCurrentDir + Items[I].Text) + ';';
      end;
  end;
end;

function TMOpenDialog.GetListArray(const ADir: string;
  AListType: TListType): TStringDynArray;
var
  LResult: TStringDynArray;
begin
  try
    case AListType of
      ltDirectory:
        LResult := TDirectory.GetDirectories(ADir);
      ltFile:
        begin
          LResult := TDirectory.GetFiles(ADir);
          DoFileNameFiler(LResult, DoFilter);
        end;
    end;
    if Assigned(LResult) then
    begin
      { do Filter }
      if Assigned(FFileNameFilter) then
        DoFileNameFiler(LResult, FFileNameFilter);

      { do Sort   }
      TArray.Sort<string>(LResult, GetFileNameComparer());
    end;
    Result := LResult;
  except
    Result := nil;
  end;
end;

procedure TMOpenDialog.ListDirectories(const ADir: string);
begin
  AddItemsToView(GetListArray(ADir, ltDirectory), ltDirectory);
end;

procedure TMOpenDialog.ListFiles(const AParentDir: string);
begin
  AddItemsToView(GetListArray(AParentDir, ltFile), ltFile);
end;

procedure TMOpenDialog.LS(const ADir: string);
begin
  if not DirectoryExists(ADir) then
    Exit;
  try
    SetIndicator(True);
    FCurrentDir := ADir;
    FBusy := True;
    with LVList do
    begin
      BeginUpdate;
//      ClearItems;
      LVList.Items.Clear;
      ListDirectories(FCurrentDir);
      if FListType = ltFile then
        ListFiles(FCurrentDir);
     EndUpdate;
     DirChanged;
    end;
  finally
    FBusy := False;
    SetIndicator(FBusy);
  end;
end;

procedure TMOpenDialog.LVListItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  LPath: string;
begin
 { 此事件在空Item区域点击也会触发 }
  if Assigned(AItem) and not FBusy then
  begin
    LPath := FCurrentDir + AItem.Text;
    case GetItemType(AItem) of
      ltDirectory:
        begin
          if not DirectoryExists(LPath) then
             Exit;
          SetIndicator(True);
          FCurrentDir := WithDelimiter(LPath);
          FItemSelectTimer.Enabled := True;
        end;
      ltFile:
        begin
          if FMultiSelect then
            with AItem.Objects.AccessoryObject do
               Visible := not Visible;
        end;
    end;
  end;
end;

procedure TMOpenDialog.RCancelClick(Sender: TObject);
begin
  DoCancel;
end;

procedure TMOpenDialog.Resize;
begin
  inherited;

  { Controls position Reset }
  ROK.Width := Width / 2;
  RCancel.Width := ROK.Width;

  with AniIndicator do
  begin
    Position.X := (LVList.Width - Width) / 2;
    Position.Y := (LVList.Height - Height) / 2;
  end;

  with SaveInput do
  begin
    Position.X := (Self.Width - Width) / 2;
    Position.Y := (Self.Height - Height) / 2;
  end;

end;

procedure TMOpenDialog.ROKClick(Sender: TObject);
begin
  DoConfirm;
end;

procedure TMOpenDialog.SetFilter(const Value: string);
begin
  { filter =.txt=文本文件|.bmp=BMP文件'; }
  FFilter := Value;
  if FFilter.Trim.IsEmpty then
    Exit;
  with FFilterList do
  begin
    Clear;
    Delimiter := '|' ;
    StrictDelimiter := True;
    DelimitedText := Value;
  end;
end;

procedure TMOpenDialog.SetListType(const Value: TListType);
begin
  if FListType <> Value then
    FListType := Value;
end;

procedure TMOpenDialog.VirtualKeyboardChangeHandler(const Sender: TObject;
  const Msg: System.Messaging.TMessage);
var
  LTop: Single;
begin
  inherited;
  with TVKStateChangeMessage(Msg) do
  begin
    { when show }
    if KeyboardVisible and not (KeyboardBounds.IsEmpty) then
    begin
      LTop := Height - KeyboardBounds.Height - SaveInput.Height;
      if LTop < 0 then
        LTop := 0;
      SaveInput.AnimateFloat('Position.Y', LTop);
    end else
      { when hide }
      SaveInput.AnimateFloat('Position.Y', (Self.Height - SaveInput.Height) / 2);
    Application.ProcessMessages;
  end;
end;

{ TMSaveDialog }

procedure TMSaveDialog.DoConfirm;
begin
  if not ESaveName.Text.Trim.IsEmpty then
    ModalResult := mrOk;
end;

procedure TMSaveDialog.DoShow;
begin
  inherited;
  SaveInput.Position.Y := Self.Height;
  SaveInput.Visible := True;
  ESaveName.Enabled := False;
  with TFloatAnimation.Create(SaveInput) do
  begin
    Parent := SaveInput;
    PropertyName := 'Position.Y';
    StartFromCurrent := True;
    Delay := 0.1;
    StopValue := (Self.Height - SaveInput.Height) / 2;
    Enabled := True;
    Application.ProcessMessages;
  end;
  ESaveName.Enabled := True;
end;

function TMSaveDialog.GetFileName: string;
begin
  Result := FCurrentDir + ESaveName.Text.Trim;
  if (FFilterList.Count > 0) then
    Result := Result + FFilterList.Names[PBFilter.ItemIndex];
end;

procedure TMSaveDialog.SetFilter(const Value: string);
var
  I: Integer;
begin
  inherited SetFilter(Value);

  with FFilterList do
  begin
    if (Count > 0) then
      for I := 0 to Count - 1 do
        PBFilter.Items.Add(ValueFromIndex[I])
    else
      PBFilter.Items.Add('所有文件');
    PBFilter.ItemIndex := 0;
  end;

end;

end.
