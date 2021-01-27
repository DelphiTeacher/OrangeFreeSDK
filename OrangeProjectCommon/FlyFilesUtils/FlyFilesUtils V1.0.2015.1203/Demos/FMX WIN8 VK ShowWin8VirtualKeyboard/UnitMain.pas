unit UnitMain;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2013-10-16　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　代码是用 XE4UP1 做的，可能需要修改下才  　　　  *)
(*  能用到其他版本上　　　　　  　　　　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)


interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.VirtualKeyboard, FMX.Platform,
  FMX.Platform.Win,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Edit, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TFormMain = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button2Exit(Sender: TObject);
    procedure Button4Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  Winapi.ShlObj,
  System.Win.Registry;

var
  FExeName: string;
  FWndClassName: string;
  FEnableRedirection: Boolean;
type
  TvkbState = (None, Hidden, Shown);

Function GetSystemDrivePath: WideString;
var
  Len: Cardinal;
begin
  Len := 0;
  SetString(Result, nil, Len);
  Len := Winapi.Windows.GetWindowsDirectoryW(PWideChar(Result), Len);
  SetString(Result, nil, Len);
  if Winapi.Windows.GetWindowsDirectoryW(PWideChar(Result), Len) <> 0 then
  begin
    SetLength(Result, StrLen(PWideChar(Result)));
    Result := IncludeTrailingPathDelimiter(ExtractFileDrive(Result));
  end;
end;

Function GetLongPathName(Const Path: WideString; isCanNil: Boolean = False): WideString;
var
  Len: Cardinal;
begin
  Len := 0;
  SetString(Result, nil, Len);
  Len := GetLongPathNameW(PWideChar(Path), PWideChar(Result), Len);
  SetString(Result, nil, Len);
  if GetLongPathNameW(PWideChar(Path), PWideChar(Result), Len) <> 0 then
  begin
    SetLength(Result, StrLen(PWideChar(Result)));
  end
  else
  begin
    if isCanNil then
    begin
      Result := '';
    end
    else
    begin
      Result := Path;
    end;
  end;
end;

Function ExpandEnvironment(const FileName: WideString): WideString;
var
  Len: Integer;
  FileNameStr: WideString;
begin
  if Trim(FileName) <> '' then
  begin
    FileNameStr := FileName;
    Result := FileNameStr;
    Len := 0;
    SetString(Result, nil, Len);
    Len := ExpandEnvironmentStringsW(PWideChar(FileNameStr), PWideChar(Result), Len div 2) * 2;
    SetString(Result, nil, Len);
    if ExpandEnvironmentStringsW(PWideChar(FileNameStr), PWideChar(Result), Len div 2) <> 0 then
    begin
      SetLength(Result, StrLen(PWideChar(Result)));
      FileNameStr := Result;
    end;
  end;
  Result := GetLongPathName(Result);
  Result := IncludeTrailingPathDelimiter(Result);
end;

type
    TWow64DisableWow64FsRedirection = function(out Wow64FsEnableRedirection: LongBool): LongBool; stdcall;
    TWow64RevertWow64FsRedirection = function(var Wow64FsEnableRedirection: LongBool): LongBool; stdcall;
var
   Wow64DisableWow64FsRedirection: TWow64DisableWow64FsRedirection;
   Wow64RevertWow64FsRedirection: TWow64RevertWow64FsRedirection;
   RedirectLoaded: Boolean;

function RedirectLoad: Boolean;
var H: HModule;
begin
  if not RedirectLoaded then
  begin
    H := GetModuleHandle('kernel32.dll');
    if H <> 0 then
    begin
      @Wow64DisableWow64FsRedirection := GetProcAddress(H, 'Wow64DisableWow64FsRedirection');
      @Wow64RevertWow64FsRedirection := GetProcAddress(H, 'Wow64RevertWow64FsRedirection');
    end
    else
    begin
      @Wow64DisableWow64FsRedirection := nil;
      @Wow64RevertWow64FsRedirection := nil;
    end;
    RedirectLoaded := True;
  end;
  Result := (@Wow64DisableWow64FsRedirection <> nil) and (@Wow64RevertWow64FsRedirection <> nil);
end;

procedure Wow64DisableRedirection(var EnableRedirection: Boolean);
var
  Wow64FsEnableRedirection: LongBool;
begin
  if RedirectLoad then
  begin
    Wow64DisableWow64FsRedirection(Wow64FsEnableRedirection);
    EnableRedirection := Wow64FsEnableRedirection;
  end
  else
    EnableRedirection := False;
end;

procedure Wow64EnableRedirection(var EnableRedirection: Boolean);
var
  Wow64FsEnableRedirection: LongBool;
begin
  if RedirectLoad then
  begin
    Wow64FsEnableRedirection := EnableRedirection;
    Wow64RevertWow64FsRedirection(Wow64FsEnableRedirection);
    EnableRedirection := Wow64FsEnableRedirection;
  end
  else
    EnableRedirection := False;
end;

function vkbHandle: HWND;
begin
  Result := Winapi.Windows.FindWindow(PChar(FWndClassName), nil);
end;

function vkbState: TvkbState;
var
  H: HWND;
begin
  H := vkbHandle;
  if (H <> INVALID_HANDLE_VALUE) and (H <> 0) then
  begin
    if (not IsWindowVisible(H)) or (IsIconic(H)) then
      Result := TvkbState.Hidden
    else
    begin
      Result := TvkbState.Shown;
      if GetActiveWindow <> H then
      begin
        Result := TvkbState.Hidden
      end;
    end;
  end
  else
  begin
    Result := TvkbState.None;
  end;
end;

function IsvkbShowned: Boolean;
begin
  Result := vkbState = TvkbState.Shown;
end;

function IsWOW64: BOOL ;
begin
  Result := False;
  if GetProcAddress(GetModuleHandle(kernel32), 'IsWow64Process') <> nil then
    IsWow64Process(GetCurrentProcess, Result);
end;

function GetWin8VKExeName: string;
var
  S: string;
  ExeName: string;
begin
  Result := '';
  S := GetSystemDrivePath + 'Program Files';
  S := IncludeTrailingPathDelimiter(S) + 'Common Files';
  S := IncludeTrailingPathDelimiter(S);
  ExeName := S + 'microsoft shared\ink\TabTip.exe';
  if not FileExists(ExeName) then
  begin
    S := ExpandEnvironment('%CommonProgramFiles%');
    S := IncludeTrailingPathDelimiter(S);
    ExeName := S + 'microsoft shared\ink\TabTip.exe';
  end;
  if not FileExists(FExeName) and IsWOW64 then
  begin
    S := ExpandEnvironment('%CommonProgramFiles%');
    S := StringReplace(S, ' (x86)', '', [rfIgnoreCase]);
    S := IncludeTrailingPathDelimiter(S);
    ExeName := S + 'microsoft shared\ink\TabTip.exe';
  end;
  if FileExists(ExeName) then
    Result := ExeName;
end;

function IsCanUseWin8VK: Boolean;
begin
  Result := FileExists(GetWin8VKExeName);
end;

procedure ShowWin8VirtualKeyboard(FormHandle: HWND; AutoShowWin8VK: Boolean = True);
var
  FInst: HINST;
  L: integer;
  S: string;
  N: integer;
  H: HWND;
begin
//  with TRegistry.Create do
//  try
//    RootKey := HKEY_CLASSES_ROOT;
//    if OpenKeyReadOnly('CLSID\{054AAE20-4BEA-4347-8A35-64A533254A9D}\LocalServer32') then
//    begin
//      try
//        FExeName := ReadString('');
//      finally
//        CloseKey;
//      end;
//    end
//    else
    if AutoShowWin8VK then    
    begin
      FExeName := GetWin8VKExeName;
    end;
//  finally
//    free;
//  end;
  if AutoShowWin8VK and FileExists(FExeName) then
  begin
    S := FExeName;
    FWndClassName := 'IPTip_Main_Window';
  end
  else
  begin
    S := '';
    SetLength(S, MAX_PATH);
    L := GetSystemDirectory(PChar(S), MAX_PATH);
    SetLength(S, L);
    S := IncludeTrailingPathDelimiter(S);
    FExeName := 'osk.exe';
    FExeName := S + FExeName;
    FWndClassName := 'OSKMainClass';
    //这种模式 FormHandle 必须是 fmx 窗体 或者 vcl edit(这个不确定) 的 Handle。
  end;
  FInst := 0;
  if FileExists(FExeName) then
  begin
    Wow64DisableRedirection(FEnableRedirection);
    try
      FInst := ShellExecute(FormHandle, 'open', PChar(FExeName), nil, PChar(ExtractFileDir(FExeName)),
                              SW_SHOWNOACTIVATE);
      if FInst <= 32 then
      begin
      end
      else
      begin
        N := 0;
        while (N < 100) and (vkbState = TvkbState.None) do
        begin
          inc(N);
          Sleep(40);
        end;
        if N >= 100 then
        begin
          FInst := 0;
          exit;
        end;
      end;
      //if (FormHandle <> 0) and not AutoShowWin8VK then
      if (FormHandle <> 0) then
      begin
        Application.ProcessMessages;
        H := vkbHandle;
        SetActiveWindow(H);
        SetFocus(H);
        Sleep(400);
        Application.ProcessMessages;
        SetActiveWindow(FormHandle);
        SetFocus(FormHandle);
        Application.ProcessMessages;
      end;
    finally
      Wow64EnableRedirection(FEnableRedirection);
    end;
  end;
end;

procedure HideWin8VirtualKeyboard;
var
  H: HWND;
begin
  H := vkbHandle;
  if (H <> INVALID_HANDLE_VALUE) and (H <> 0) then
    PostMessage(H, WM_SYSCOMMAND, SC_CLOSE, 0);
end;


//下面是使用。
var IsButtonClick: Boolean = False;

procedure TFormMain.Button1Click(Sender: TObject);
begin
  if IsvkbShowned then
  begin
    Edit1.SetFocus;
    exit;
  end;
  IsButtonClick := True;
  Edit1.SetFocus;
  ShowWin8VirtualKeyboard(FormToHWND(Self), CheckBox1.IsChecked);
end;

procedure TFormMain.Button2Click(Sender: TObject);
begin
  HideWin8VirtualKeyboard;
  IsButtonClick := True;
end;

procedure TFormMain.Button2Exit(Sender: TObject);
begin
  IsButtonClick := False;
end;

procedure TFormMain.Button3Click(Sender: TObject);
var
  VKbSvc: IFMXVirtualKeyboardService;
begin
  if CheckBox1.IsChecked and IsCanUseWin8VK then
  begin
    if IsvkbShowned then
    begin
      Edit1.SetFocus;
      exit;
    end;
    IsButtonClick := True;
    Edit1.SetFocus;
    ShowWin8VirtualKeyboard(FormToHWND(Self), CheckBox1.IsChecked);
  end
  else if (TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(VKbSvc))) then
  begin
    IsButtonClick := True;
    Edit1.SetFocus;
    //Win7 下 此处有 bug 无法正常的输入。
    VKbSvc.ShowVirtualKeyboard(Edit1);
    //等显示出来，再点一下这个按钮的代码。才能正常的工作。
  end;
end;

procedure TFormMain.Button4Click(Sender: TObject);
var
  VKbSvc: IFMXVirtualKeyboardService;
begin
  IsButtonClick := True;
  if CheckBox1.IsChecked and IsCanUseWin8VK then
  begin
    HideWin8VirtualKeyboard;
  end
  else if (TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(VKbSvc))) then
  begin
    VKbSvc.HideVirtualKeyboard;
  end;
end;

procedure TFormMain.Button4Exit(Sender: TObject);
begin
  IsButtonClick := False;
end;

procedure TFormMain.Edit1Enter(Sender: TObject);
begin
  if IsButtonClick then Exit;
  if IsvkbShowned then exit;
  if not CheckBox1.IsChecked then exit;
  IsButtonClick := False;
  //这会导致关了虚拟键盘还会自动打开。
  ShowWin8VirtualKeyboard(FormToHWND(Self), CheckBox1.IsChecked);
  Edit1.SetFocus;
end;

procedure TFormMain.Edit1Exit(Sender: TObject);
begin
  if IsButtonClick then Exit;
  if not CheckBox1.IsChecked then exit;
  IsButtonClick := False;
  HideWin8VirtualKeyboard;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  HideWin8VirtualKeyboard;
end;

end.
