unit UntMain;
{ * |<PRE>
  ================================================================================
  * 软件名称：ECC加密算法是一种非对称加密算法。
  * 单元名称：
  * 过程名：
  * 函数名：
  * uses其它单元：
  * 作者：    lah
  * 制作目的： ECC加密解密字符串
  * 实现原理：
  * 创建时间：2007-11-18 (2010-9-26做了兼容delphi2010的修改)
  * 备    注：这是参照网上的一个实例修改的 参考网页：http://www.submanifold.be
  * 开发平台：Microsoft Wiondows XP Pro Service Pack 3 +
  Embarcadero Delphi 2010 Version 14.0.3593.25826
  * 兼容测试：Win2K、Win2003 Server
  * 修改记录：
  ================================================================================
  |</PRE> }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, EncdDecd, FlyUtils.ECC.FGInt, FlyUtils.ECC.ECGFp, FlyUtils.ECC.ECElGamal;

type
  TFrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button3: TButton;
    Button4: TButton;
    Edit6: TEdit;
    UpDown1: TUpDown;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { --------Private ECC--------- }
    ECC_a, ECC_b, ECC_p, ECC_n, ECC_h: TFGInt;
    ECC_y, ECC_g: TECPoint;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
var
  ok: boolean;
begin
  Self.Caption := '椭圆曲线ECC加密算法 delphi代码示例 作者：lah  QQ:112412387';
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

procedure TFrmMain.Button1Click(Sender: TObject);
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

  S := EncodeString(Edit3.Text); // 明文
  ConvertBase64to256(Edit2.Text, Y1);
  ECPointStringToECPoint(Y1, ECC_p, ECC_a, ECC_b, ECC_y);
  ECElGamalEncrypt(S, ECC_p, ECC_a, ECC_b, k, ECC_g, ECC_y, true, T); // 加密
  ConvertBase256to64(T, S);
  Edit4.Text := S; // 密文
  FGIntDestroy(k);
end;

procedure TFrmMain.Button2Click(Sender: TObject);
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
  ECElGamalDecrypt(T, ECC_p, ECC_a, ECC_b, x, S); // 解密
  Edit5.Text := DecodeString(S); // 解密后的明文
  FGIntDestroy(x);
end;

procedure TFrmMain.Button3Click(Sender: TObject);
begin
  Edit1.Text := StrRandom(StrToInt(Edit6.Text));
end;

procedure TFrmMain.Button4Click(Sender: TObject);
Var
  x: TFGInt;
  Y1, Y2: string;
Begin
  if not(Length(Edit1.Text) > 0) then
    Exit;
  Edit4.Clear;
  Edit5.Clear;
  // x 私钥
  Base256StringToFGInt(Edit1.Text, x); // 随机生成私钥

  // y 公钥 y = x * g
  ECPointkmultiple(ECC_g, ECC_p, ECC_a, x, ECC_y);
  ECPointToECPointString(ECC_y, ECC_p, true, Y1);
  ConvertBase256to64(Y1, Y2);
  Edit2.Text := Y2; // 公钥
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FGIntDestroy(ECC_a);
  FGIntDestroy(ECC_b);
  FGIntDestroy(ECC_h);
  FGIntDestroy(ECC_n);
  ECPointDestroy(ECC_g);
end;

end.
