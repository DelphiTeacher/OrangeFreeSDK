unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, System.IOUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses FlyFilesUtils;

procedure TForm1.Button1Click(Sender: TObject);
var
  AFileName: string;
begin
  AFileName := IncludeTrailingPathDelimiter(System.IOUtils.TPath.GetDocumentsPath)+ '99.png';
  AFileName := GetCaseSensitiveFileName(AFileName, System.IOUtils.TPath.GetDocumentsPath);
  Image1.Bitmap.Clear(TAlphaColorRec.White);
{$IF CompilerVersion >= 28.0} // >= XE7
  Image1.Bitmap.LoadFromFile(AFileName);
{$ELSE}
  Image1.Bitmap.LoadFromFile(AFileName, 0);
{$ENDIF}
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  AFileName: string;
begin
  AFileName := IncludeTrailingPathDelimiter(System.IOUtils.TPath.GetDocumentsPath) + 'AAA' + PathDelim + '64street.png';
  AFileName := GetCaseSensitiveFileName(AFileName);
  Image1.Bitmap.Clear(TAlphaColorRec.White);
{$IF CompilerVersion >= 28.0} // >= XE7
  Image1.Bitmap.LoadFromFile(AFileName);
{$ELSE}
  Image1.Bitmap.LoadFromFile(AFileName, 0);
{$ENDIF}
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  AFileName: string;
begin
  AFileName := IncludeTrailingPathDelimiter(System.IOUtils.TPath.GetDocumentsPath) + 'Pngs' + PathDelim + '99lstwra.png';
  AFileName := GetCaseSensitiveFileName(AFileName);
{$IF CompilerVersion >= 28.0} // >= XE7
  Image1.Bitmap.LoadFromFile(AFileName);
{$ELSE}
  Image1.Bitmap.LoadFromFile(AFileName, 0);
{$ENDIF}
end;

end.
