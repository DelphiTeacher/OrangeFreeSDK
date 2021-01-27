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
    RadioButton128: TRadioButton;
    RadioButton192: TRadioButton;
    RadioButton256: TRadioButton;
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

const
  iv = '0102030405060708';

function TaoBaoAESEncryptStrToBase64(Value, Key: string; StrEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
var
  InStream, OutStream: TStringStream;
  IvBytes: TBytes;
  KeyBytes: TBytes;
  ResultBytes: TBytes;
  UniocdeLEMode: Boolean;
begin
  if ValueCRLFMode <> rlNoChange then
  begin
    Value := ChangCRLFType(Value, ValueCRLFMode);
  end;
  if StrEncoding = nil then
    StrEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(Value, StrEncoding, False);
  try
    InStream.Position := 0;
    OutStream := TStringStream.Create('', TEncoding.ANSI, False);
    try
      KeyBytes := TNetEncoding.Base64.DecodeStringToBytes(Key);
      IvBytes := TEncoding.ASCII.GetBytes(iv);
      UniocdeLEMode := (TEncoding.IsStandardEncoding(StrEncoding) and (StrEncoding = TEncoding.Unicode)) or
        (StrEncoding is TUnicodeEncoding and not (StrEncoding is TBigEndianUnicodeEncoding));
      AESEncryptStream_BytesKey(InStream, OutStream, 0, KeyBytes, IvBytes, KeyBit,
        APaddingMode, CBCMode, rlCRLF, UniocdeLEMode, OnProcessProc, ProcessProc);
      ResultBytes := OutStream.Bytes;
      // TStringStream.Bytes 太长，和实际不符。
      SetLength(ResultBytes, OutStream.Size);
      Result := EncodeBase64Bytes(ResultBytes);
    finally
      FreeAndNil(OutStream);
    end;
  finally
    FreeAndNil(InStream);
  end;
end;

function TaoBaoAESDecryptStrFromBase64(StrBase64, Key: string;
  ResultEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
var
  InStream, OutStream: TStringStream;
  IvBytes: TBytes;
  KeyBytes: TBytes;
  UniocdeLEMode: Boolean;
begin
  if ResultEncoding = nil then
    ResultEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(DecodeBase64Bytes(StrBase64));
  try
    OutStream := TStringStream.Create('', ResultEncoding, False);
    try
      KeyBytes := TNetEncoding.Base64.DecodeStringToBytes(Key);
      IvBytes := TEncoding.ASCII.GetBytes(iv);
      UniocdeLEMode := (TEncoding.IsStandardEncoding(ResultEncoding) and (ResultEncoding = TEncoding.Unicode)) or
        (ResultEncoding is TUnicodeEncoding and not (ResultEncoding is TBigEndianUnicodeEncoding));
      AESDecryptStream_BytesKey(InStream, OutStream, 0, KeyBytes, IvBytes, KeyBit,
        APaddingMode, CBCMode, rlCRLF, UniocdeLEMode, OnProcessProc, ProcessProc);
      OutStream.Position := 0;
      try
        Result := OutStream.DataString;
      except
        Result := '';
      end;
    finally
      FreeAndNil(OutStream);
    end;
  finally
    FreeAndNil(InStream);
  end;
  if ResultCRLFMode <> rlNoChange then
  begin
    Result := ChangCRLFType(Result, ResultCRLFMode);
  end;
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
begin
  KeyBit := TKeyBit.kb128;
  if RadioButton192.IsChecked then  KeyBit := TKeyBit.kb192;
  if RadioButton256.IsChecked then  KeyBit := TKeyBit.kb256;
  APaddingMode := TPaddingMode.pmPKCS5or7RandomPadding;
  if RadioButton_Ansi.IsChecked then
  begin
    Memo2.Text := TaoBaoAESEncryptStrToBase64(Memo1.Text.Trim, Edit1.Text, TEncoding.ANSI,
      KeyBit, APaddingMode, True,
      rlCRLF, Process);
  end;
  if RadioButton_Wide.IsChecked then
  begin
    Memo2.Text := TaoBaoAESEncryptStrToBase64(Memo1.Text.Trim, Edit1.Text, TEncoding.Unicode,
      KeyBit, APaddingMode, True,
      rlCRLF, Process);
  end;

  if RadioButton_UTF8.IsChecked then
  begin
    Memo2.Text := TaoBaoAESEncryptStrToBase64(Memo1.Text.Trim, Edit1.Text, TEncoding.UTF8,
      KeyBit, APaddingMode, True,
      rlCRLF, Process);
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
var
  KeyBit: TKeyBit;
  APaddingMode: TPaddingMode;
begin
  KeyBit := TKeyBit.kb128;
  if RadioButton192.IsChecked then  KeyBit := TKeyBit.kb192;
  if RadioButton256.IsChecked then  KeyBit := TKeyBit.kb256;
  APaddingMode := TPaddingMode.pmZeroPadding;
  APaddingMode := TPaddingMode.pmPKCS5or7RandomPadding;
  if RadioButton_Ansi.IsChecked then
  begin
    Memo1.Text := TaoBaoAESDecryptStrFromBase64(Memo2.Text.Trim, Edit1.Text, TEncoding.ANSI,
      KeyBit, APaddingMode, True,
      rlCRLF, Process);
  end;
  if RadioButton_Wide.IsChecked then
  begin
    Memo1.Text := TaoBaoAESDecryptStrFromBase64(Memo2.Text.Trim, Edit1.Text, TEncoding.Unicode,
      KeyBit, APaddingMode, True,
      rlCRLF, Process);
  end;

  if RadioButton_UTF8.IsChecked then
  begin
    Memo1.Text := TaoBaoAESDecryptStrFromBase64(Memo2.Text.Trim, Edit1.Text, TEncoding.UTF8,
      KeyBit, APaddingMode, True,
      rlCRLF, Process);
  end;
end;

end.
