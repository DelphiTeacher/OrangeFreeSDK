unit OpenfileMain;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2015-09-13　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit;

type
  TFormMain = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Layout1: TLayout;
    Layout2: TLayout;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetFileName(const IsOK: Boolean; const FileName:string);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses FlyFilesUtils;

procedure TFormMain.GetFileName(const IsOK: Boolean; const FileName:string);
begin
  if IsOK then
  begin
    Label2.Text := '结果：' + FileName;
  end
  else
  begin
    Label2.Text := '结果：无';
  end;
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
  FileExt: string;
begin
  Error_NotFoundFileManager_Str := '没有找到文件管理器！';
  Label2.Text := '结果：';
  FileExt := Edit1.Text.Trim;
  if FileExt.Substring(0,1) = '.' then
    FileExt := FileExt.Substring(1);
{$IFDEF ANDROID}
  if not OpenFileDialog('选择文件', FileExt, GetFileName) then exit;
{$ENDIF ANDROID}
{$IF DEFINED(MSWINDOWS) OR DEFINED(MACOS)}
{$IF NOT defined(IOS)}
  OpenDialog1.Title := '选择文件';
  OpenDialog1.DefaultExt := FileExt;
  OpenDialog1.Filter := '指定的类型(*.' + FileExt + ')|*.' + FileExt + '|' +
    '所有文件(*.*)|*.*';
  if not OpenDialog1.Execute then exit;
  Label2.Text := '结果：' + OpenDialog1.FileName;
{$ENDIF}
{$ENDIF}
end;

end.
