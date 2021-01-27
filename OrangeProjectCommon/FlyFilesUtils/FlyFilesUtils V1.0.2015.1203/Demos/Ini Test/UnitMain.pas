unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.IniFiles,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, System.IOUtils, FMX.Layouts, FMX.Memo, FMX.ScrollBox,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    Rectangle1: TRectangle;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    FIniFile: TIniFile;
    FIniFileName: string;
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
begin
  if RadioButton2.IsChecked then
    FIniFile := TIniFile.Create(FIniFileName, TEncoding.Unicode)
  else
    FIniFile := TIniFile.Create(FIniFileName, TEncoding.ANSI);
  try
    FIniFile.WriteString('test', 'test',
      FormatDateTime('YYYY-MM-DD HH:NN:SS.ZZZ', Now));
    FIniFile.WriteString('cn', 'Text','中文字符串');
    FIniFile.WriteString('中文', '日期',
      FormatDateTime('YYYY年MM月DD日 HH时NN分SS秒ZZZ毫秒', Now));
    //FIniFile.UpdateFile;
  finally
    FreeAndNil(FIniFile);
  end;
  MemoAdd('保存好了，文件名是：' + sLineBreak + FIniFileName);
  MemoAdd('注意重新安装 APK，这个文件会被删除。');
  MemoAdd('解决办法很简单，换个地方保存。');
  MemoAdd('');
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  if RadioButton2.IsChecked then
    FIniFile := TIniFile.Create(FIniFileName, TEncoding.Unicode)
  else
    FIniFile := TIniFile.Create(FIniFileName, TEncoding.ANSI);
  try
    MemoAdd('[test]test 读到的数据是：' + sLineBreak +
      FIniFile.ReadString('test', 'test', ''));
    MemoAdd('');
    MemoAdd('[cn]Text 读到的数据是：' + sLineBreak +
      FIniFile.ReadString('cn', 'Text', ''));
    MemoAdd('');
    MemoAdd('[中文]日期 读到的数据是：' + sLineBreak +
      FIniFile.ReadString('中文', '日期', ''));
    MemoAdd('');
    MemoAdd('');
  finally
    FreeAndNil(FIniFile);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if RadioButton2.IsChecked then
    Memo1.Lines.LoadFromFile(FIniFileName, TEncoding.Unicode)
  else
    Memo1.Lines.LoadFromFile(FIniFileName, TEncoding.ANSI);
  MemoAdd('文件名是：' + sLineBreak + FIniFileName);
  MemoAdd('');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if FileExists(FIniFileName) then
  begin
    DeleteFile(FIniFileName);
    MemoAdd('文件已成功删除。');
  end
  else
  begin
    MemoAdd('文件不存在或已删除。');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FIniFile := nil;
  FIniFileName := IncludeTrailingPathDelimiter(System.IOUtils.TPath.GetDocumentsPath) + 'my.ini';
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if Assigned(FIniFile) then
  begin
    FreeAndNil(FIniFile);
  end;
end;

end.
