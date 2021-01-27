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
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Popup1: TPopup;
    Label2: TLabel;
    ProgressBarMain: TProgressBar;
    RadioButton128: TRadioButton;
    RadioButton192: TRadioButton;
    RadioButton256: TRadioButton;
    CheckBoxCBC: TCheckBox;
    CheckBoxPKCS: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
  public
    { Public declarations }
    function GetKey: string;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
//  System.NetEncoding,
  FlyUtils.AES, FlyUtils.CnXXX.Common;

function AESDecryptFile(InFile, OutFile,Key: string; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): Boolean;
var
  InF, OutF: TFileStream;
begin
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;

  InF := TFileStream.Create(InFile, fmOpenRead or fmShareDenyWrite);
  try
    if FileExists(OutFile) then
      DeleteFile(OutFile);
    OutF := TFileStream.Create(OutFile, fmCreate);
    try
      AESDecryptStream(InF, OutF, 0, Key, KeyEncoding, KeyBit, InitVectorStr,
        APaddingMode, CBCMode, KeyCRLFMode,
        False,
        OnProcessProc, ProcessProc);
        Result := True;
    finally
      FreeAndNil(OutF);
    end;
  finally
    FreeAndNil(InF);
  end;
end;


function AESEncryptFile(InFile, OutFile, Key: string;
  KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): Boolean;
var
  InF, OutF: TFileStream;
begin

  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;

  InF := TFileStream.Create(InFile,fmOpenRead or fmShareDenyWrite);
  try
    if FileExists(OutFile) then
      DeleteFile(OutFile);
    OutF := TFileStream.Create(OutFile, fmCreate);
    try
      AESEncryptStream(InF, OutF, 0, Key, KeyEncoding, KeyBit, InitVectorStr,
        APaddingMode, CBCMode, KeyCRLFMode, False,
        OnProcessProc, ProcessProc);
       Result := True;
    finally
      FreeAndNil(OutF);
    end;
  finally
    FreeAndNil(InF);
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

const
  iv = '0102030405060708';

//function TFormMain.GetKey: string;
//var
//  A: TBytes;
//  I: Integer;
//begin
//  A := TNetEncoding.Base64.DecodeStringToBytes(Edit1.Text);
//  Result := '';
//  for I := Low(A) to High(A) do
//  begin
//    Result := Result + Char(A[I]);
//  end;
//
//end;

function TFormMain.GetKey: string;
begin
  Result := Edit1.Text.Trim;
end;

procedure TFormMain.Button2Click(Sender: TObject);
var
  KeyBit: TKeyBit;
  APaddingMode: TPaddingMode;
  Key: string;
begin
  Key := GetKey;
  KeyBit := TKeyBit.kb128;
  if RadioButton192.IsChecked then  KeyBit := TKeyBit.kb192;
  if RadioButton256.IsChecked then  KeyBit := TKeyBit.kb256;
  APaddingMode := TPaddingMode.pmZeroPadding;
  if CheckBoxPKCS.IsChecked then
    APaddingMode := TPaddingMode.pmPKCS5or7RandomPadding;
  AESEncryptFile('In.dat', 'NewOut.dat', Key, TEncoding.ASCII,
      KeyBit, iv, APaddingMode, CheckBoxCBC.IsChecked,
      rlCRLF, Process);
end;

procedure TFormMain.Button3Click(Sender: TObject);
var
  KeyBit: TKeyBit;
  APaddingMode: TPaddingMode;
  Key: string;
begin
  Key := GetKey;
  KeyBit := TKeyBit.kb128;
  if RadioButton192.IsChecked then  KeyBit := TKeyBit.kb192;
  if RadioButton256.IsChecked then  KeyBit := TKeyBit.kb256;
  APaddingMode := TPaddingMode.pmZeroPadding;
  if CheckBoxPKCS.IsChecked then
    APaddingMode := TPaddingMode.pmPKCS5or7RandomPadding;
  AESDecryptFile('NewOut.dat', 'NewIn.dat', Key, TEncoding.ASCII,
      KeyBit, iv, APaddingMode, CheckBoxCBC.IsChecked,
      rlCRLF, Process);
end;

end.
