unit UnitAESSHA256KeyMain;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2015-04-24　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Edit,
  FMX.Layouts, FMX.Memo, FMX.ScrollBox, FMX.Controls.Presentation;

type
  TFormMain = class(TForm)
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Memo2: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    RadioButton_Ansi: TRadioButton;
    RadioButton_Wide: TRadioButton;
    RadioButton_UTF8: TRadioButton;
    Popup1: TPopup;
    Label2: TLabel;
    ProgressBarMain: TProgressBar;
    CheckBoxCBC: TCheckBox;
    RadioButton128: TRadioButton;
    RadioButton192: TRadioButton;
    RadioButton256: TRadioButton;
    CheckBoxPKCS: TCheckBox;
    RadioButtonHex: TRadioButton;
    RadioButton64: TRadioButton;
    Label3: TLabel;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  FlyUtils.CnXXX.Common,
  FlyUtils.AES,
  System.Hash,
  System.NetEncoding;

function AESEncryptStrToBase64(Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil; KeyBit: TKeyBit = kb128;
  InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
begin
  Result := EncodeBase64Bytes(AESEncryptStr(Value, Key, StrEncoding, KeyEncoding, KeyBit, InitVectorStr,
    APaddingMode, CBCMode, ValueCRLFMode,
    KeyCRLFMode, OnProcessProc, ProcessProc));
end;

function AESDecryptStrFromBase64(StrHex, Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
begin
  Result := AESDecryptStr(DecodeBase64Bytes(StrHex), Key, ResultEncoding, KeyEncoding, KeyBit,
    InitVectorStr, APaddingMode, CBCMode, ResultCRLFMode,
    KeyCRLFMode, OnProcessProc, ProcessProc);
end;

procedure TFormMain.Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
begin
  ProgressBarMain.Max := Max;
  ProgressBarMain.Min := Min;
  ProgressBarMain.Value := Done;
  Application.ProcessMessages;
  Cancel := False;
end;

procedure TFormMain.Button2Click(Sender: TObject);
var
  KeyBit: TKeyBit;
  APaddingMode: TPaddingMode;
  KeyBytes, IvBytes, OutBytes: TBytes;
begin
  KeyBit := TKeyBit.kb128;
  if RadioButton192.IsChecked then  KeyBit := TKeyBit.kb192;
  if RadioButton256.IsChecked then  KeyBit := TKeyBit.kb256;
  APaddingMode := TPaddingMode.pmZeroPadding;
  if CheckBoxPKCS.IsChecked then
    APaddingMode := TPaddingMode.pmPKCS5or7Padding;
  KeyBytes := THashSHA2.GetHashBytes(Edit1.Text, THashSHA2.TSHA2Version.SHA256);
    IvBytes := TEncoding.ANSI.GetBytes(Edit2.Text);
  if RadioButton_Ansi.IsChecked then
  begin
    OutBytes := AESEncryptStr_BytesKey(Memo1.Text.Trim, KeyBytes, IvBytes, TEncoding.ANSI,
      KeyBit, APaddingMode, True);
  end;
  if RadioButton_Wide.IsChecked then
  begin
    OutBytes := AESEncryptStr_BytesKey(Memo1.Text.Trim, KeyBytes, IvBytes, TEncoding.Unicode,
      KeyBit, APaddingMode, True);
  end;
  if RadioButton_UTF8.IsChecked then
  begin
    OutBytes := AESEncryptStr_BytesKey(Memo1.Text.Trim, KeyBytes, IvBytes, TEncoding.UTF8,
      KeyBit, APaddingMode, True);
  end;
  if RadioButtonHex.IsChecked then
  begin
    Memo2.Text := StrToHex(OutBytes);
  end
  else
  begin
    Memo2.Text := TNetEncoding.Base64.EncodeBytesToString(OutBytes);
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
var
  KeyBit: TKeyBit;
  APaddingMode: TPaddingMode;
  KeyBytes, IvBytes, InBytes: TBytes;
begin
  KeyBit := TKeyBit.kb128;
  if RadioButton192.IsChecked then  KeyBit := TKeyBit.kb192;
  if RadioButton256.IsChecked then  KeyBit := TKeyBit.kb256;
  APaddingMode := TPaddingMode.pmZeroPadding;
  if CheckBoxPKCS.IsChecked then
    APaddingMode := TPaddingMode.pmPKCS5or7RandomPadding;
  KeyBytes := THashSHA2.GetHashBytes(Edit1.Text, THashSHA2.TSHA2Version.SHA256);
    IvBytes := TEncoding.ANSI.GetBytes(Edit2.Text);
  if RadioButtonHex.IsChecked then
  begin
    InBytes := HexToStr(Memo2.Text.Trim);
  end
  else
  begin
    InBytes := TNetEncoding.Base64.DecodeStringToBytes(Memo2.Text.Trim);
  end;
  if RadioButton_Ansi.IsChecked then
  begin
    Memo1.Text := AESDecryptStr_BytesKey(IvBytes, KeyBytes, IvBytes, TEncoding.ANSI,
      KeyBit, APaddingMode, True);
  end;
  if RadioButton_Wide.IsChecked then
  begin
    Memo1.Text := AESDecryptStr_BytesKey(IvBytes, KeyBytes, IvBytes, TEncoding.Unicode,
      KeyBit, APaddingMode, True);
  end;
  if RadioButton_UTF8.IsChecked then
  begin
    Memo1.Text := AESDecryptStr_BytesKey(IvBytes, KeyBytes, IvBytes, TEncoding.UTF8,
      KeyBit, APaddingMode, True);
  end;
end;

end.
