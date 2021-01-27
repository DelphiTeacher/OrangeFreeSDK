unit UnitFmxMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.EditBox, FMX.SpinBox,
  FlyUtils.ECC.FGInt, FlyUtils.ECC.ECGFp, FlyUtils.ECC.ECElGamal;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    SpinBox1: TSpinBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Button3: TButton;
    Button4: TButton;
    ProgressBarMain: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    { --------Private ECC--------- }
    ECC_a, ECC_b, ECC_p, ECC_n, ECC_h: TFGInt;
    ECC_y, ECC_g: TECPoint;
  public
    { Public declarations }
    procedure Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
  end;

var
  Form1: TForm1;

implementation

uses
  System.NetEncoding, FlyUtils.CnXXX.Common;

{$R *.fmx}

function StrRandom(const intLength: FixedUInt): string;
// 返回指定长度的随机字符串
const
  Str64: Array [0 .. 63] Of char = ('a', 'A', 'b', 'B', 'c', 'C', 'd', 'D',
    'e', 'E', 'f', 'F', 'g', 'G', 'h', 'H', 'i', 'I', 'j', 'J', 'k', 'K', 'l',
    'L', 'm', 'M', 'n', 'N', 'o', 'O', 'p', 'P', 'q', 'Q', 'r', 'R', 's', 'S',
    't', 'T', 'u', 'U', 'v', 'V', 'w', 'W', 'x', 'X', 'y', 'Y', 'z', 'Z', '0',
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '=');
var
  i: Integer;
begin
  Result := '';
  Randomize; // 初始随机数
  for i := 0 to intLength - 1 do
  begin
    Result := Result + Str64[Random(64)];
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text := StrRandom(Trunc(SpinBox1.Value));
end;

procedure TForm1.Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
begin
  ProgressBarMain.Max := Max;
  ProgressBarMain.Min := Min;
  ProgressBarMain.Value := Done;
  Application.ProcessMessages;
  Cancel := False;
end;

procedure TForm1.Button2Click(Sender: TObject);
Var
  x: TFGInt;
  Y1, Y2: string;
Begin
  if not(Length(Edit1.Text) > 0) then
    Exit;
  Edit4.Text := '';
  Edit5.Text := '';
  // x 私钥
  Base256StringToFGInt(Edit1.Text, x); // 随机生成私钥

  // y 公钥 y = x * g
  ECPointkmultiple(ECC_g, ECC_p, ECC_a, x, ECC_y);
  ECPointToECPointString(ECC_y, ECC_p, true, Y1);
  ConvertBase256to64(Y1, Y2);
  Edit2.Text := Y2; // 公钥
end;

procedure TForm1.Button3Click(Sender: TObject);
// 加密
var
  k: TFGInt;
  S, T: String;
  Y1: string;
begin
  if not(Length(Edit2.Text) > 0) then
    Exit;
  if not(Length(Edit3.Text) > 0) then
    Exit;

  // k 是随机参数 自已随便生成 客户端生成。服务端没有必要的
  // 主要是增加破解难度
  Base256StringToFGInt('AEfz32QSD', k);

//  S := TNetEncoding.Base64.EncodeBytesToString(
//   TEncoding.ANSI.GetBytes(Edit3.Text)); // 明文
  //新版本是 UTF8 的。
  S := TNetEncoding.Base64.Encode(Edit3.Text); // 明文
  ConvertBase64to256(Edit2.Text, Y1);
  ECPointStringToECPoint(Y1, ECC_p, ECC_a, ECC_b, ECC_y);
  ECElGamalEncrypt(S, ECC_p, ECC_a, ECC_b, k, ECC_g, ECC_y, true, T,
    nil, TCRLFMode.rlNoChange, Process); // 加密
  ConvertBase256to64(T, S);
  Edit4.Text := S; // 密文
  FGIntDestroy(k);
end;

procedure TForm1.Button4Click(Sender: TObject);
// 解密
var
  x: TFGInt;
  S, T: String;
begin
  if not(Length(Edit1.Text) > 0) then
    Exit;
  if not(Length(Edit2.Text) > 0) then
    Exit;
  if not(Length(Edit4.Text) > 0) then
    Exit;

  // x 私钥
  Base256StringToFGInt(Edit1.Text, x); // 读私钥
  S := '';
  ConvertBase64to256(Edit4.Text, T);
  ECElGamalDecrypt(T, ECC_p, ECC_a, ECC_b, x, S,
    nil, TCRLFMode.rlNoChange, Process); // 解密
//  Edit5.Text :=
//    TEncoding.ANSI.GetString(TNetEncoding.Base64.DecodeStringToBytes(S)); // 解密后的明文
  //新版本是 UTF8 的。
  Edit5.Text := TNetEncoding.Base64.Decode(S); // 解密后的明文
  FGIntDestroy(x);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ok: boolean;
begin
  Caption := '椭圆曲线ECC加密算法 delphi代码示例 作者：lah  QQ:112412387';
//  Application.FormFactor.Orientations :=
//    [TFormOrientation.soLandscape,
//    TFormOrientation.soPortrait,
//    TFormOrientation.soInvertedLandscape,
//    TFormOrientation.soInvertedPortrait];
  Application.FormFactor.Orientations :=
    [TFormOrientation.soLandscape];
  // 首先生成素数,这里注意参数ECC_p客户端与服务端要相同，这个随机数可以固定，
  // 破解这里没有意义的。
  Base256StringToFGInt('gxTHtzzzzznnn', ECC_p); // 随机
  ok := true;
  While ok Do
  Begin
    FindPrimeGoodCurveAndPoint(ECC_p, ECC_a, ECC_b, ECC_h, ECC_n, 50, ECC_g);
    IsECSuperSingular(ECC_p, ECC_a, ECC_b, ok);
    If ok Then
    Begin
      FGIntDestroy(ECC_a);
      FGIntDestroy(ECC_b);
      FGIntDestroy(ECC_h);
      FGIntDestroy(ECC_n);
      ECPointDestroy(ECC_g);
    End;
  End;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FGIntDestroy(ECC_a);
  FGIntDestroy(ECC_b);
  FGIntDestroy(ECC_h);
  FGIntDestroy(ECC_n);
  ECPointDestroy(ECC_g);
end;

end.
