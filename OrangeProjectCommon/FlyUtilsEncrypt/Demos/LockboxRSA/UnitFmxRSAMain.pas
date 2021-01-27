unit UnitFmxRSAMain;

//来源：史子荣 http://www.pefing.com

//请使用 开源的 LockBox 的 FMX 以上版本。
//https://github.com/TurboPack/LockBox

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2016-03-02　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

//所有的 Encoding 不赋值，默认就是 UTF8。
//解密过程有点慢，可能会导致无响应，建议用线程，但是请注意 同步 UI 操作。

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.EditBox, FMX.SpinBox,
  FMX.ListBox;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
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
    Label7: TLabel;
    ComboBox1: TComboBox;
    Label8: TLabel;
    AniIndicator1: TAniIndicator;
    Label9: TLabel;
    EditM: TEdit;
    CheckBoxHex: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
    procedure RSACallBack(Sender : TObject; var Abort : Boolean);
  end;

var
  Form1: TForm1;

implementation

uses
  LbRSA, LbAsym,
  System.NetEncoding, FlyUtils.CnXXX.Common;

{$R *.fmx}

function RSAEncryption(InStr,ModStr,KeyStr:String;
  StringEncoding: TEncoding; StringCRLFMode: TCRLFMode;
  KeyBit:TLbAsymKeySize;
  OnProgress : TLbProgressEvent = nil):String;
var
  StrBytes: TBytes;
  PublicKey: TLbRSAKey;
begin
  PublicKey := TLbRSAKey.Create(KeyBit);
  try
    PublicKey.ModulusAsString:=ModStr;
    PublicKey.ExponentAsString:=KeyStr;
    if StringCRLFMode <> rlNoChange then
    begin
      inStr := ChangCRLFType(inStr, StringCRLFMode);
    end;
    if StringEncoding = nil then
      StringEncoding := TEncoding.UTF8;
    StrBytes := TRSA.RSAEncryptBytes(
      StringEncoding.GetBytes(InStr), PublicKey, True);
    Result:= TEncoding.ANSI.GetString(StrBytes);
  finally
    PublicKey.Free;
  end;
end;

function RSADecryption(InStr,ModStr,KeyStr:String;
  ResultEncoding: TEncoding; ResultCRLFMode: TCRLFMode;
  KeyBit:TLbAsymKeySize;
  OnProgress : TLbProgressEvent = nil):String;
var
  StrBytes: TBytes;
  PrivateKey: TLbRSAKey;
begin
  PrivateKey := TLbRSAKey.Create(KeyBit);
  try
    PrivateKey.ModulusAsString:=ModStr;
    PrivateKey.ExponentAsString:=KeyStr;
    if ResultEncoding = nil then
      ResultEncoding := TEncoding.UTF8;
    StrBytes := TRSA.RSAEncryptBytes(
      TEncoding.ANSI.GetBytes(InStr), PrivateKey, False);
    try
      Result := ResultEncoding.GetString(StrBytes);
    except
      Result := '';
    end;
    //Result:=RSA.DecryptString(TEncoding.ANSI.GetString(HexToStr(InStr)));
    if ResultCRLFMode <> rlNoChange then
    begin
      Result := ChangCRLFType(Result, ResultCRLFMode);
    end;
  finally
    PrivateKey.Free;
  end;
end;

procedure TForm1.Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
begin
  ProgressBarMain.Max := Max;
  ProgressBarMain.Min := Min;
  ProgressBarMain.Value := Done;
  Application.ProcessMessages;
  Cancel := False;
end;

procedure TForm1.RSACallBack(Sender : TObject; var Abort : Boolean);
begin
  Application.ProcessMessages;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Str:TLbRSA;
begin
  Str := TLbRSA.Create(nil);
  Cursor := crHourglass;
  try
    Str.PrimeTestIterations := StrToIntDef('20', 20);
    Str.KeySize := TLbAsymKeySize(Combobox1.ItemIndex);
    Str.OnProgress := RSACallBack;
    //显示菊花。
    AniIndicator1.BringToFront;
    AniIndicator1.Visible := True;
    //转菊花。
    AniIndicator1.Enabled := True;
    Str.GenerateKeyPair;
    //隐藏菊花。
    AniIndicator1.Visible := False;
    AniIndicator1.Enabled := False;
    Edit2.Text  := Str.PublicKey.ExponentAsString;
    EditM.Text  := Str.PublicKey.ModulusAsString;
    Edit1.Text := Str.PrivateKey.ExponentAsString;
  finally
    Str.Free;
    Cursor := crDefault;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  TempBytes: TBytes;
begin
  //显示菊花。
  AniIndicator1.BringToFront;
  AniIndicator1.Visible := True;
  //转菊花。
  AniIndicator1.Enabled := True;
  try
    Case Combobox1.ItemIndex of
      0:
        Edit4.Text := RSAEncryption(Edit3.Text,EditM.Text,Edit2.Text,
          TEncoding.ANSI, rlCRLF, aks128);
      1:
        Edit4.Text := RSAEncryption(Edit3.Text,EditM.Text,Edit2.Text,
          TEncoding.ANSI, rlCRLF, aks256);
      2:
        Edit4.Text := RSAEncryption(Edit3.Text,EditM.Text,Edit2.Text,
          TEncoding.ANSI, rlCRLF, aks512);
      3:
        Edit4.Text := RSAEncryption(Edit3.Text,EditM.Text,Edit2.Text,
          TEncoding.ANSI, rlCRLF, aks768);
      4:
        Edit4.Text := RSAEncryption(Edit3.Text,EditM.Text,Edit2.Text,
          TEncoding.ANSI, rlCRLF, aks1024);
    end;
    if CheckBoxHex.IsChecked then
    begin
      TempBytes := System.NetEncoding.TNetEncoding.Base64.DecodeStringToBytes(Edit4.Text);
      Edit4.Text := StrToHex(TempBytes);
    end;
  finally
    //隐藏菊花。
    AniIndicator1.Visible := False;
    AniIndicator1.Enabled := False;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  TempBytes: TBytes;
  TempStr: string;
begin
  //显示菊花。
  AniIndicator1.BringToFront;
  AniIndicator1.Visible := True;
  //转菊花。
  AniIndicator1.Enabled := True;
  try
    TempStr := Edit4.Text;
    if CheckBoxHex.IsChecked then
    begin
      TempBytes := HexToStr(TempStr);
      TempStr := System.NetEncoding.TNetEncoding.Base64.EncodeBytesToString(TempBytes);
      TempStr := ChangCRLFType(TempStr, rlNONE);
    end;
    Case Combobox1.ItemIndex of
      0:
        Edit5.Text := RSADecryption(TempStr,EditM.Text,Edit1.Text,
          TEncoding.ANSI, rlCRLF, aks128);
      1:
        Edit5.Text := RSADecryption(TempStr,EditM.Text,Edit1.Text,
          TEncoding.ANSI, rlCRLF, aks256);
      2:
        Edit5.Text := RSADecryption(TempStr,EditM.Text,Edit1.Text,
          TEncoding.ANSI, rlCRLF, aks512);
      3:
        Edit5.Text := RSADecryption(TempStr,EditM.Text,Edit1.Text,
          TEncoding.ANSI, rlCRLF, aks768);
      4:
        Edit5.Text := RSADecryption(TempStr,EditM.Text,Edit1.Text,
          TEncoding.ANSI, rlCRLF, aks1024);
    end;
  finally
    //隐藏菊花。
    AniIndicator1.Visible := False;
    AniIndicator1.Enabled := False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ok: boolean;
begin
//  Application.FormFactor.Orientations :=
//    [TFormOrientation.soLandscape,
//    TFormOrientation.soPortrait,
//    TFormOrientation.soInvertedLandscape,
//    TFormOrientation.soInvertedPortrait];
  Application.FormFactor.Orientations :=
    [TFormOrientation.soLandscape];
  Combobox1.ItemIndex := 0;
end;

end.
