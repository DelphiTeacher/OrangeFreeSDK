unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, System.IOUtils,
  FlyFilesUtils, FMX.Layouts, FMX.Memo, FMX.ScrollBox, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure MemoAdd(AText: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.MemoAdd(AText: string);
begin
  Memo1.Lines.Add(AText);
  Memo1.GoToTextEnd;
  Application.ProcessMessages;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  TempStr,
  AFileName: string;
begin
  AFileName := GetSDCardPath(0);
  if isPathCanUseNow(AFileName) then
  begin

  end
  else
  begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add(AFileName + ' 不可用');
    Memo1.GoToTextEnd;
    exit;
  end;
  TempStr := '';
{$IFDEF ANDROID}
  TempStr := TempStr + 'ExternalStorage      : ' + GetExternalStoragePath + sLineBreak;
  TempStr := TempStr + 'InnerStorage         : ' + GetInnerStoragePath + sLineBreak;
  TempStr := TempStr + 'ExterStorage         : ' + GetExterStoragePath + sLineBreak;
  TempStr := TempStr + 'GetVolumePaths       : ' + sLineBreak + GetVolumePaths.Trim + sLineBreak;
  TempStr := TempStr + ''+ sLineBreak;
{$ENDIF}
  TempStr := TempStr + 'IsPadOrPC            : ' + BoolToStr(IsPadOrPC, True) + sLineBreak;
  TempStr := TempStr + 'GetTotalSpaceSize    : ' + GetTotalSpaceSize(AFileName).ToString + sLineBreak;
  TempStr := TempStr + 'GetAvailableSpaceSize: ' + GetAvailableSpaceSize(AFileName).ToString + sLineBreak;
  TempStr := TempStr + 'GetFreeSpaceSize     : ' + GetFreeSpaceSize(AFileName).ToString + sLineBreak;
  TempStr := TempStr + 'GetTotalMemorySize   : ' + GetTotalMemorySize.ToString + sLineBreak;
  TempStr := TempStr + 'GetFreeMemorySize    : ' + GetFreeMemorySize.ToString + sLineBreak;
  AFileName := AFileName + '1.txt';
  //ShowMessage(AFileName);
  with TStringList.Create do
  try
    LineBreak := #13#10;
    Add(TempStr);
    Add('1.txt: ' + AFileName);
    Add('GetAppPath: ' + GetAppPath);
    Add('');
    Add('System.IOUtils.TPath.GetXXX List.');
    Add('GetRandomFileName: ' + System.IOUtils.TPath.GetRandomFileName);
    Add('GetTempFileName: ' + System.IOUtils.TPath.GetTempFileName);
    Add('GetTempPath: ' + System.IOUtils.TPath.GetTempPath);
    Add('GetHomePath: ' + System.IOUtils.TPath.GetHomePath);
    Add('GetDocumentsPath: ' + System.IOUtils.TPath.GetDocumentsPath);
    Add('GetSharedDocumentsPath: ' + System.IOUtils.TPath.GetSharedDocumentsPath);
    Add('GetLibraryPath: ' + System.IOUtils.TPath.GetLibraryPath);
    Add('GetCachePath: ' + System.IOUtils.TPath.GetCachePath);
    Add('GetPublicPath: ' + System.IOUtils.TPath.GetPublicPath);
    Add('GetPicturesPath: ' + System.IOUtils.TPath.GetPicturesPath);
    Add('GetSharedPicturesPath: ' + System.IOUtils.TPath.GetSharedPicturesPath);
    Add('GetCameraPath: ' + System.IOUtils.TPath.GetCameraPath);
    Add('GetSharedCameraPath: ' + System.IOUtils.TPath.GetSharedCameraPath);
    Add('GetMusicPath: ' + System.IOUtils.TPath.GetMusicPath);
    Add('GetSharedMusicPath: ' + System.IOUtils.TPath.GetSharedMusicPath);
    Add('GetMoviesPath: ' + System.IOUtils.TPath.GetMoviesPath);
    Add('GetSharedMoviesPath: ' + System.IOUtils.TPath.GetSharedMoviesPath);
    Add('GetAlarmsPath: ' + System.IOUtils.TPath.GetAlarmsPath);
    Add('GetSharedAlarmsPath: ' + System.IOUtils.TPath.GetSharedAlarmsPath);
    Add('GetDownloadsPath: ' + System.IOUtils.TPath.GetDownloadsPath);
    Add('GetSharedDownloadsPath: ' + System.IOUtils.TPath.GetSharedDownloadsPath);
    Add('GetRingtonesPath: ' + System.IOUtils.TPath.GetRingtonesPath);
    Add('GetSharedRingtonesPath: ' + System.IOUtils.TPath.GetSharedRingtonesPath);
{$IFDEF ANDROID}
    if GetIsExternalStorageRemovable then
    begin
      Add('此卡是 外置卡');
    end
    else
    begin
      Add('此卡是 内置卡');
    end;
{$ENDIF}
    Add('');
    SaveToFile(AFileName, TEncoding.UTF8);
  finally
    free;
  end;
  Memo1.Lines.Clear;
  Memo1.Lines.LoadFromFile(AFileName);
  Memo1.GoToTextEnd;
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  TempStr,
  AFileName: string;
begin
  AFileName := GetSDCardPath(1);
  if isPathCanUseNow(AFileName) then
  begin

  end
  else
  begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add(AFileName + ' 不可用');
    Memo1.GoToTextEnd;
    exit;
  end;
  TempStr := '';
  TempStr := TempStr + 'GetTotalSpaceSize    : ' + GetTotalSpaceSize(AFileName).ToString + sLineBreak;
  TempStr := TempStr + 'GetAvailableSpaceSize: ' + GetAvailableSpaceSize(AFileName).ToString + sLineBreak;
  TempStr := TempStr + 'GetFreeSpaceSize     : ' + GetFreeSpaceSize(AFileName).ToString + sLineBreak;
  AFileName := AFileName + '2.txt';
  with TStringList.Create do
  try
    LineBreak := #13#10;
    Add(TempStr);
    Add(AFileName);
{$IFDEF ANDROID}
    if not GetIsExternalStorageRemovable then
    begin
      Add('此卡是 外置卡');
    end
    else
    begin
      Add('此卡是 内置卡');
    end;
{$ENDIF}
    Add('');
    SaveToFile(AFileName, TEncoding.UTF8);
  finally
    free;
  end;
  Memo1.Lines.Clear;
  Memo1.Lines.LoadFromFile(AFileName);
  Memo1.GoToTextEnd;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  TempStr,
  AFileName: string;
begin
  AFileName := GetSDCardPath(UsbDiskIndex);
  if isPathCanUseNow(AFileName) then
  begin

  end
  else
  begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add(AFileName + ' 不可用');
    Memo1.GoToTextEnd;
    exit;
  end;
  TempStr := '';
  TempStr := TempStr + 'GetTotalSpaceSize    : ' + GetTotalSpaceSize(AFileName).ToString + sLineBreak;
  TempStr := TempStr + 'GetAvailableSpaceSize: ' + GetAvailableSpaceSize(AFileName).ToString + sLineBreak;
  TempStr := TempStr + 'GetFreeSpaceSize     : ' + GetFreeSpaceSize(AFileName).ToString + sLineBreak;
  AFileName := AFileName + '3.txt';
  with TStringList.Create do
  try
    LineBreak := #13#10;
    Add(TempStr);
    Add(AFileName);
    SaveToFile(AFileName, TEncoding.UTF8);
  finally
    free;
  end;
  Memo1.Lines.Clear;
  Memo1.Lines.LoadFromFile(AFileName);
  Memo1.GoToTextEnd;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  BuildFileListInAPath(GetSDCardPath + '*', faAnyFile, Memo1.Lines, False);
  Memo1.GoToTextEnd;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
{$IFDEF ANDROID}
    if GetIsExternalStorageRemovable then
    begin
      Button1.Text := '在外置卡(TF or sd0)上建立 1.TXT';
      Button2.Text := '在内置卡(sdcard1)上建立 2.TXT';
    end
    else
    begin
      Button1.Text := '在内置卡(手机存储,sd0)上建立 1.TXT';
      Button2.Text := '在外置卡(TF or sd1)上建立 2.TXT';
    end;
{$ENDIF}
end;

end.
