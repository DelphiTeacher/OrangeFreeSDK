unit MakeImageCode;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,uImageCode,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects;

type
  TForm1 = class(TForm)
    lblNum: TLabel;
    BtnRandom: TButton;
    ImgCode: TImage;
    BtnImage: TButton;
    procedure BtnRandomClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnImageClick(Sender: TObject);
  private
    { Private declarations }
    FImageCode:TImageCode;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.BtnImageClick(Sender: TObject);
begin
  Self.ImgCode.Bitmap:=FImageCode.CreateBitmap;
end;

procedure TForm1.BtnRandomClick(Sender: TObject);
begin
  Self.lblNum.Text:=FImageCode.GetImageCode;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FImageCode:=TImageCode.Create;
end;

end.
