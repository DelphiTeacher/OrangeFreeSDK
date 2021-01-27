unit UnitAESMain;

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
    CheckBoxHexKey: TCheckBox;
    CheckBoxHexIV: TCheckBox;
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
  System.NetEncoding,
  FlyUtils.AES, FlyUtils.CnXXX.Common;

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
  KeyStr,IvStr: string;
begin
  KeyBit := TKeyBit.kb128;
  if RadioButton192.IsChecked then  KeyBit := TKeyBit.kb192;
  if RadioButton256.IsChecked then  KeyBit := TKeyBit.kb256;
  APaddingMode := TPaddingMode.pmZeroPadding;
  if CheckBoxPKCS.IsChecked then
    APaddingMode := TPaddingMode.pmPKCS5or7RandomPadding;
  KeyStr := Edit1.Text;
  if CheckBoxHexKey.IsChecked then
    KeyStr := HexToStrByEncoding(KeyStr, TEncoding.ANSI);
  IvStr := Edit2.Text;
  if CheckBoxHexIV.IsChecked then
    IvStr := HexToStrByEncoding(IvStr, TEncoding.ANSI);
  if RadioButtonHex.IsChecked then
  begin
    if RadioButton_Ansi.IsChecked then
    begin
      Memo2.Text := AESEncryptStrToHex(Memo1.Text.Trim, KeyStr, TEncoding.ANSI, TEncoding.UTF8,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;
    if RadioButton_Wide.IsChecked then
    begin
      Memo2.Text := AESEncryptStrToHex(Memo1.Text.Trim, KeyStr, TEncoding.Unicode, TEncoding.UTF8,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;

    if RadioButton_UTF8.IsChecked then
    begin
      Memo2.Text := AESEncryptStrToHex(Memo1.Text.Trim, KeyStr, TEncoding.UTF8, TEncoding.UTF8,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;
  end
  else
  begin
    if RadioButton_Ansi.IsChecked then
    begin
      Memo2.Text := AESEncryptStrToBase64(Memo1.Text.Trim, KeyStr, TEncoding.ANSI, TEncoding.UTF8,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;
    if RadioButton_Wide.IsChecked then
    begin
      Memo2.Text := AESEncryptStrToBase64(Memo1.Text.Trim, KeyStr, TEncoding.Unicode, TEncoding.UTF8,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;

    if RadioButton_UTF8.IsChecked then
    begin
      Memo2.Text := AESEncryptStrToBase64(Memo1.Text.Trim, KeyStr, TEncoding.UTF8, TEncoding.UTF8,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
var
  KeyBit: TKeyBit;
  APaddingMode: TPaddingMode;
  KeyStr,IvStr: string;
begin
  KeyBit := TKeyBit.kb128;
  if RadioButton192.IsChecked then  KeyBit := TKeyBit.kb192;
  if RadioButton256.IsChecked then  KeyBit := TKeyBit.kb256;
  APaddingMode := TPaddingMode.pmZeroPadding;
  if CheckBoxPKCS.IsChecked then
    APaddingMode := TPaddingMode.pmPKCS5or7RandomPadding;
  KeyStr := Edit1.Text;
  if CheckBoxHexKey.IsChecked then
    KeyStr := HexToStrByEncoding(KeyStr, TEncoding.ANSI);
  IvStr := Edit2.Text;
  if CheckBoxHexIV.IsChecked then
    IvStr := HexToStrByEncoding(IvStr, TEncoding.ANSI);
  if RadioButtonHex.IsChecked then
  begin
    if RadioButton_Ansi.IsChecked then
    begin
      Memo1.Text := AESDecryptStrFromHex(Memo2.Text.Trim, KeyStr, TEncoding.ANSI, TEncoding.ANSI,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;
    if RadioButton_Wide.IsChecked then
    begin
      Memo1.Text := AESDecryptStrFromHex(Memo2.Text.Trim, KeyStr, TEncoding.Unicode, TEncoding.ANSI,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;

    if RadioButton_UTF8.IsChecked then
    begin
      Memo1.Text := AESDecryptStrFromHex(Memo2.Text.Trim, KeyStr, TEncoding.UTF8, TEncoding.ANSI,
        KeyBit, IvStr, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;
  end
  else
  begin
    if RadioButton_Ansi.IsChecked then
    begin
      Memo1.Text := AESDecryptStrFromBase64(Memo2.Text.Trim, KeyStr, TEncoding.ANSI, TEncoding.ANSI,
        KeyBit, Edit2.Text, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;
    if RadioButton_Wide.IsChecked then
    begin
      Memo1.Text := AESDecryptStrFromBase64(Memo2.Text.Trim, KeyStr, TEncoding.Unicode, TEncoding.ANSI,
        KeyBit, Edit2.Text, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;

    if RadioButton_UTF8.IsChecked then
    begin
      Memo1.Text := AESDecryptStrFromBase64(Memo2.Text.Trim, KeyStr, TEncoding.UTF8, TEncoding.ANSI,
        KeyBit, Edit2.Text, APaddingMode, CheckBoxCBC.IsChecked,
        rlCRLF, rlCRLF, Process);
    end;
  end;
end;

end.
