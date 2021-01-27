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
    EditN: TEdit;
    Label3: TLabel;
    EditE: TEdit;
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
    EditD: TEdit;
    CheckBoxHex: TCheckBox;
    RadioButtonANSI: TRadioButton;
    RadioButtonUTF8: TRadioButton;
    CheckBoxLittleEndien: TCheckBox;
    CheckBoxOpenSSLMode: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FWasAborted: Boolean;
    procedure OnRSAProgress( Sender: TObject; BitsProcessed, TotalBits: int64; var doAbort: boolean);
    procedure OnGenerateAsymetricKeyPairProgress(
      Sender: TObject; CountPrimalityTests: integer;
      var doAbort: boolean);
  public
    { Public declarations }
    procedure Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
    procedure RSACallBack(Sender : TObject; var Abort : Boolean);
  end;

var
  Form1: TForm1;

implementation

uses
  uTPLb_RSA_Engine, uTPLb_Asymetric, uTPLb_HugeCardinal,
  uTPLb_HugeCardinalUtils, uTPLb_MemoryStreamPool,
  uTPLb_StreamUtils, uTPLb_RSA_Primitives, uTPLb_BlockCipher,
  uTPLb_CryptographicLibrary,
  FlyUtils.LcokBox3.Common,
  uTPLb_Codec,
  System.NetEncoding, FlyUtils.CnXXX.Common;

{$R *.fmx}

//const
//  RSA_512_SampleKey1: string =
//    'QAAAADfRWmA3nhVOOvqB0CLoy1lvP6VwuPRY0gYMtGjS+G3vPVZG/adCkgcAuhduuzR' +
//    'af42JCz75O8vrSS66owu2OWRAAAAA0YnbSszKdiN+s9zNiJizwIjK11cvNISf3jmFqB' +
//    'iDCVKojcmJbnPEPsAbUlHx1oqpI4EpQuooNIC/3eELq0gZFAMAAAABAAE=';
//
//function RSAEncryption(const InStr, EStr, NStr, DStr: string;
//  StringEncoding: TEncoding; StringCRLFMode: TCRLFMode;
//  KeyBitLength: Integer;
//  APool: IMemoryStreamPool;
//  var WasAborted: Boolean;
//  IsBase64: Boolean;
//  OnProgress : uTPLb_HugeCardinal.TProgress = nil): string;
//var
//  Lib: TCryptographicLibrary;
//  Codec: TCodec;
//  AKey: TRSAKeyPair;
//  PlainText, Ciphertext, Recon: TMemoryStream;
//  AStream: TMemoryStream;
//  ABytesStream: TBytesStream;
//  FInStr: string;
//  InBytes: TBytes;
//  n, e, d, Totient: THugeCardinal;
//  Count1: Integer;
//  p, q, dp, dq, qinv: THugeCardinal;
//begin
//  FInStr := InStr;
//  if StringCRLFMode <> rlNoChange then
//  begin
//    FInStr := ChangCRLFType(FInStr, StringCRLFMode);
//  end;
//  if StringEncoding = nil then
//    StringEncoding := TEncoding.UTF8;
//  InBytes := StringEncoding.GetBytes(FInStr);
//  AStream := TMemoryStream.Create;
//  PlainText := TMemoryStream.Create;
//  Ciphertext := TMemoryStream.Create;
//  ABytesStream := TBytesStream.Create;
//  try
//    Lib := TCryptographicLibrary.Create( nil);
//    Codec := TCodec.Create( nil);
//    AKey := TRSAKeyPair.CreateEmpty;
//    try
//      Codec.CryptoLibrary := Lib;
//      Codec.StreamCipherId := 'native.RSA';
//      Codec.AsymetricKeySizeInBits := KeyBitLength;
//      AStream.Clear;
//      LockBox3RSAHexToStream(NStr, AStream);
//      AStream.Position := 0;
//      AKey.F_RSA_n := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, LittleEndien, AStream, APool));
//      AStream.Clear;
//      LockBox3RSAHexToStream(EStr, AStream);
//      AStream.Position := 0;
//      AKey.F_RSA_e := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, LittleEndien, AStream, APool));
//      //AKey.F_RSA_d := NewWrap(THugeCardinal.CreateSimple(KeyBitLength));
//      AStream.Clear;
//      LockBox3RSAHexToStream(DStr, AStream);
//      AStream.Position := 0;
//      AKey.F_RSA_d := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, LittleEndien, AStream, APool));
//      AStream.Clear;
//      StoreRSAKeyPairPartsToStream([PartN, PartE, PartD], AKey, AStream);
//      AStream.Position := 0;
//      Codec.InitFromStream(AStream);
//
//      Totient := nil; n := nil; e := nil; d := nil; p := nil; q := nil; dp := nil; dq := nil; qinv := nil;
//      Count1 := 0;
//      Compute_RSA_Fundamentals_2Factors(KeyBitLength, StandardExponent, n, e, d, Totient,
//        p, q, dp, dq, qinv,
//        OnProgress, nil,
//        20, // 1 .. 20; 20 is good.
//        APool, Count1, WasAborted);
//
////      AStream.Clear;
////      Base64_to_stream(TEncoding.ANSI.GetBytes(RSA_512_SampleKey1), AStream);
////      AStream.Position := 0;
////      Codec.InitFromStream(AStream);
////      AStream.Clear;
////      AKey.F_RSA_n := (Codec.Key as TRSAKeyPair).F_RSA_n;
////      AKey.F_RSA_e := (Codec.Key as TRSAKeyPair).F_RSA_e;
////      AKey.F_RSA_d := (Codec.Key as TRSAKeyPair).F_RSA_d;
//
//
//      AKey.F_RSA_n := NewWrap(n);
//      AKey.F_RSA_e := NewWrap(e);
//      //AKey.F_RSA_d := NewWrap(d);
//
//      FInStr := d.AsHexString;
//
//      AStream.Clear;
//      LockBox3RSAHexToStream(FInStr, AStream);
//      AStream.Position := 0;
//      AKey.F_RSA_d := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, LittleEndien, AStream, APool));
//
//      AStream.Clear;
//      StoreRSAKeyPairPartsToStream([PartN, PartE, PartD], AKey, AStream);
//      AStream.Position := 0;
//      Codec.InitFromStream(AStream);
//
//      Codec.EncryptAnsiString(InStr, Result);
//      Codec.DecryptAnsiString(FInStr, Result);
//
//
//      PlainText.Clear;
//      Plaintext.Write(InBytes[0], Length(InBytes));
//      PlainText.Position := 0;
//      Ciphertext.Clear;
//      Codec.EncryptStream(Plaintext, Ciphertext);
//
//      Codec.Reset;
//      PlainText.Clear;
//      Ciphertext.Position := 0;
//      Codec.DecryptStream(Plaintext, Ciphertext);
//
//      ABytesStream.Clear;
//      Ciphertext.Position := 0;
//      if IsBase64 then
//      begin
//        TNetEncoding.Base64.Encode(Ciphertext, ABytesStream);
//        Result := TEncoding.ASCII.GetString(ABytesStream.Bytes);
//      end
//      else
//      begin
//        ABytesStream.CopyFrom(Ciphertext, 0);
//        Result := StrToHex(ABytesStream.Bytes);
//      end;
//    finally
//      FreeAndNil(AKey);
//      FreeAndNil(Codec);
//      FreeAndNil(Lib);
//    end;
//  finally
//    FreeAndNil(AStream);
//    FreeAndNil(PlainText);
//    FreeAndNil(Ciphertext);
//    FreeAndNil(ABytesStream);
//  end;
//end;

function RSAEncryption(const InStr, EStr, NStr: string;
  StringEncoding: TEncoding; StringCRLFMode: TCRLFMode;
  APool: IMemoryStreamPool;
  var WasAborted: Boolean;
  IsBase64: Boolean;
  IsOpenSSLMode: Boolean;
  Order: TByteOrder = TByteOrder.LittleEndien;
  OnProgress : uTPLb_HugeCardinal.TProgress = nil): string;
var
  Lib: TCryptographicLibrary;
  Codec: TCodec;
  AKey: TRSAKeyPair;
  PlainText, Ciphertext, Recon: TMemoryStream;
  AStream: TMemoryStream;
  ABytesStream: TBytesStream;
  FInStr: string;
  InBytes: TBytes;
begin
  FInStr := InStr;
  if StringCRLFMode <> rlNoChange then
  begin
    FInStr := ChangCRLFType(FInStr, StringCRLFMode);
  end;
  if StringEncoding = nil then
    StringEncoding := TEncoding.UTF8;
  InBytes := StringEncoding.GetBytes(FInStr);
  AStream := TMemoryStream.Create;
  PlainText := TMemoryStream.Create;
  Ciphertext := TMemoryStream.Create;
  ABytesStream := TBytesStream.Create;
  try
    Lib := TCryptographicLibrary.Create( nil);
    Codec := TCodec.Create( nil);
    AKey := TRSAKeyPair.CreateEmpty;
    try
      Codec.CryptoLibrary := Lib;
      Codec.StreamCipherId := 'native.RSA';
      Codec.AsymetricKeySizeInBits := 128; //有密码的时候，这个无意义。
      if IsOpenSSLMode then
      begin
        Codec.AdvancedOptions2 := Codec.AdvancedOptions2 + [TSymetricEncryptionOption.optOpenSSL_CompatibilityMode];
      end;

      AStream.Clear;
      LockBox3RSAHexToStream(NStr, AStream, Order);
      AStream.Position := 0;
      AKey.F_RSA_n := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, TByteOrder.LittleEndien, AStream, APool));
      AStream.Clear;
      LockBox3RSAHexToStream(EStr, AStream, Order);
      AStream.Position := 0;
      AKey.F_RSA_e := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, TByteOrder.LittleEndien, AStream, APool));
      AKey.F_RSA_d := NewWrap(THugeCardinal.CreateSimple(AKey.F_RSA_n.Value.BitLength));
      AStream.Clear;
      StoreRSAKeyPairPartsToStream([PartN, PartE, PartD], AKey, AStream);
      AStream.Position := 0;
      Codec.InitFromStream(AStream);

      PlainText.Clear;
      Plaintext.Write(InBytes[0], Length(InBytes));
      PlainText.Position := 0;
      Ciphertext.Clear;
      Codec.EncryptStream(Plaintext, Ciphertext);

//      Codec.Reset;
//      PlainText.Clear;
//      Ciphertext.Position := 0;
//      Codec.DecryptStream(Plaintext, Ciphertext);

      ABytesStream.Clear;
      Ciphertext.Position := 0;
      if IsBase64 then
      begin
        TNetEncoding.Base64.Encode(Ciphertext, ABytesStream);
        Result := TEncoding.ASCII.GetString(ABytesStream.Bytes);
      end
      else
      begin
        ABytesStream.CopyFrom(Ciphertext, 0);
        Result := StrToHex(ABytesStream.Bytes);
      end;
    finally
      FreeAndNil(AKey);
      FreeAndNil(Codec);
      FreeAndNil(Lib);
    end;
  finally
    FreeAndNil(AStream);
    FreeAndNil(PlainText);
    FreeAndNil(Ciphertext);
    FreeAndNil(ABytesStream);
  end;
end;

function RSADecryption(InStr, DStr, NStr: string;
  ResultEncoding: TEncoding; ResultCRLFMode: TCRLFMode;
  APool: IMemoryStreamPool;
  var WasAborted: Boolean;
  IsBase64: Boolean;
  IsOpenSSLMode: Boolean;
  Order: TByteOrder = TByteOrder.LittleEndien;
  OnProgress : uTPLb_HugeCardinal.TProgress = nil): string;
var
  Lib: TCryptographicLibrary;
  Codec: TCodec;
  AKey: TRSAKeyPair;
  PlainText, Ciphertext, Recon: TMemoryStream;
  AStream: TMemoryStream;
  ABytesStream: TBytesStream;
  InBytes: TBytes;
begin
  if ResultEncoding = nil then
    ResultEncoding := TEncoding.UTF8;
  AStream := TMemoryStream.Create;
  PlainText := TMemoryStream.Create;
  Ciphertext := TMemoryStream.Create;
  ABytesStream := TBytesStream.Create;
  try
    Lib := TCryptographicLibrary.Create( nil);
    Codec := TCodec.Create( nil);
    AKey := TRSAKeyPair.CreateEmpty;
    try
      Codec.CryptoLibrary := Lib;
      Codec.StreamCipherId := 'native.RSA';
      Codec.AsymetricKeySizeInBits := 128; //有密码的时候，这个无意义。
      if IsOpenSSLMode then
      begin
        Codec.AdvancedOptions2 := Codec.AdvancedOptions2 + [TSymetricEncryptionOption.optOpenSSL_CompatibilityMode];
      end;

      AStream.Clear;
      LockBox3RSAHexToStream(NStr, AStream, Order);
      AStream.Position := 0;
      AKey.F_RSA_n := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, TByteOrder.LittleEndien, AStream, APool));
      AKey.F_RSA_e := NewWrap(THugeCardinal.CreateSimple(AKey.F_RSA_n.Value.BitLength));
      AStream.Clear;
      LockBox3RSAHexToStream(DStr, AStream, Order);
      AStream.Position := 0;
      AKey.F_RSA_d := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, TByteOrder.LittleEndien, AStream, APool));
      AStream.Clear;
      StoreRSAKeyPairPartsToStream([PartN, PartE, PartD], AKey, AStream);
      AStream.Position := 0;
      Codec.InitFromStream(AStream);

      Ciphertext.Clear;
      if IsBase64 then
      begin
        InBytes := TNetEncoding.Base64.DecodeStringToBytes(InStr);
      end
      else
      begin
        InBytes := HexToStr(InStr);
      end;
      Ciphertext.Write(InBytes[0], Length(InBytes));
      Ciphertext.Position := 0;
      PlainText.Clear;
      Codec.DecryptStream(Plaintext, Ciphertext);
      ABytesStream.Clear;
      Plaintext.Position := 0;
      ABytesStream.CopyFrom(PlainText, 0);
      Result := ResultEncoding.GetString(ABytesStream.Bytes);
      if ResultCRLFMode <> rlNoChange then
      begin
        Result := ChangCRLFType(Result, ResultCRLFMode);
      end;
    finally
      FreeAndNil(AKey);
      FreeAndNil(Codec);
      FreeAndNil(Lib);
    end;
  finally
    FreeAndNil(AStream);
    FreeAndNil(PlainText);
    FreeAndNil(Ciphertext);
    FreeAndNil(ABytesStream);
  end;
end;
procedure TForm1.OnRSAProgress(
  Sender: TObject; BitsProcessed, TotalBits: int64; var doAbort: boolean);
begin
 Application.ProcessMessages
//  if FdoAbort then
//    doAbort := True
end;

procedure TForm1.OnGenerateAsymetricKeyPairProgress(
      Sender: TObject; CountPrimalityTests: integer;
      var doAbort: boolean);
begin
 Application.ProcessMessages
//  if FdoAbort then
//    doAbort := True
end;

procedure TForm1.Process(Sender: TObject; Min, Max, Done: UInt64; var Cancel: Boolean);
begin
  FWasAborted := False;
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
  KeyBitLength: Integer;
//  n, e, d, Totient: THugeCardinal;
//  Count1: Integer;
//  p, q, dp, dq, qinv: THugeCardinal;
//  APool: IMemoryStreamPool;
  ARSA_Engine: TRSA_Engine;
  AKey: TAsymetricKeyPair;
  //AStream: TMemoryStream;
begin
  Cursor := crHourglass;
  try
    //显示菊花。
    AniIndicator1.BringToFront;
    AniIndicator1.Visible := True;
    //转菊花。
    AniIndicator1.Enabled := True;
    ARSA_Engine := TRSA_Engine.Create;
    try
      KeyBitLength := StrToIntDef(ComboBox1.Selected.Text, 128);
      AKey := nil;
      try
        ARSA_Engine.GenerateAsymetricKeyPair(KeyBitLength, Self, OnGenerateAsymetricKeyPairProgress, AKey, FWasAborted);
        //隐藏菊花。
        AniIndicator1.Visible := False;
        AniIndicator1.Enabled := False;
        EditN.Text := (AKey as TRSAKeyPair).F_RSA_n.Value.AsHexString;
        EditE.Text := (AKey as TRSAKeyPair).F_RSA_e.Value.AsHexString;
        EditD.Text := (AKey as TRSAKeyPair).F_RSA_d.Value.AsHexString;
        if not CheckBoxLittleEndien.IsChecked then
        begin
          EditN.Text := HexStrChangeByteOrder(EditN.Text);
          EditE.Text := HexStrChangeByteOrder(EditE.Text);
          EditD.Text := HexStrChangeByteOrder(EditD.Text);
        end;
//        EditE.Text := (AKey as TRSAKeyPair).F_RSA_n.Value.BitLength.ToString;
//        AStream := TMemoryStream.Create;
//        AStream.Clear;
//        LockBox3RSAHexToStream(EditN.Text, AStream);
//        AStream.Position := 0;
//        (AKey as TRSAKeyPair).F_RSA_n := NewWrap(THugeCardinal.CreateFromStreamIn(AStream.Size * 8, TByteOrder.LittleEndien, AStream, APool));
//        EditD.Text := (AKey as TRSAKeyPair).F_RSA_n.Value.BitLength.ToString;
//        FreeAndNil(AStream);
      finally
        if AKey <> nil then
          FreeAndNil(AKey);
      end;
    finally
      FreeAndNil(ARSA_Engine);
    end;
  finally
    Cursor := crDefault;
  end;

//  GreatestPassCount := 0;
//  Cursor := crHourglass;
//  try
//    //显示菊花。
//    AniIndicator1.BringToFront;
//    AniIndicator1.Visible := True;
//    //转菊花。
//    AniIndicator1.Enabled := True;
//    Totient := nil; n := nil; e := nil; d := nil; p := nil; q := nil; dp := nil; dq := nil; qinv := nil;
//    APool := NewPool;
//    try
//      Count1 := 0;
//      KeyBitLength := StrToIntDef(ComboBox1.Selected.Text, 128);
//      Compute_RSA_Fundamentals_2Factors(KeyBitLength, StandardExponent, n, e, d, Totient,
//        p, q, dp, dq, qinv,
//       OnRSAProgress, nil,
//       20, // 1 .. 20; 20 is good.
//       APool, Count1, FWasAborted);
//      if (not FWasAborted) and (not Validate_RSA_Fundamentals( n, e, d, Totient)) then
//      begin
//        ShowMessage('Failed to generate RSA key pair.');
//        exit;
//      end;
//      //隐藏菊花。
//      AniIndicator1.Visible := False;
//      AniIndicator1.Enabled := False;
//      EditN.Text := n.AsHexString;
//      EditE.Text := e.AsHexString;
//      EditD.Text := d.AsHexString;
//    finally
//      if Totient <> nil then
//        FreeAndNil(Totient);
//      if n <> nil then
//        FreeAndNil(n);
//      if e <> nil then
//        FreeAndNil(e);
//      if d <> nil then
//        FreeAndNil(d);
//      if p <> nil then
//        FreeAndNil(p);
//      if q <> nil then
//        FreeAndNil(q);
//      if dp <> nil then
//        FreeAndNil(dp);
//      if dq <> nil then
//        FreeAndNil(dq);
//      if qinv <> nil then
//        FreeAndNil(qinv);
//    end;
//  finally
//    Cursor := crDefault;
//  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  TempBytes: TBytes;
  AEncoding: TEncoding;
  Order: TByteOrder;
  KeyBitLength: Integer;
  APool: IMemoryStreamPool;
begin
  AEncoding := TEncoding.ANSI;
  if RadioButtonUTF8.IsChecked then
    AEncoding := TEncoding.UTF8;
  Order := TByteOrder.BigEndien;
  if CheckBoxLittleEndien.IsChecked then
    Order := TByteOrder.LittleEndien;
  KeyBitLength := StrToIntDef(ComboBox1.Selected.Text, 128);
  if KeyBitLength < 512 then
  begin
    ShowMessage('Min BitCount is 512');
    exit;
  end;
  //显示菊花。
  AniIndicator1.BringToFront;
  AniIndicator1.Visible := True;
  //转菊花。
  AniIndicator1.Enabled := True;
  try
    APool := NewPool;
    Edit4.Text := RSAEncryption(Edit3.Text, EditE.Text, EditN.Text,
      AEncoding, rlCRLF, APool, FWasAborted, not CheckBoxHex.IsChecked, CheckBoxOpenSSLMode.IsChecked,
      Order, OnRSAProgress);
  finally
    //隐藏菊花。
    AniIndicator1.Visible := False;
    AniIndicator1.Enabled := False;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  TempBytes: TBytes;
  AEncoding: TEncoding;
  Order: TByteOrder;
  KeyBitLength: Integer;
  APool: IMemoryStreamPool;
begin
  AEncoding := TEncoding.ANSI;
  if RadioButtonUTF8.IsChecked then
    AEncoding := TEncoding.UTF8;
  Order := TByteOrder.BigEndien;
  if CheckBoxLittleEndien.IsChecked then
    Order := TByteOrder.LittleEndien;
  KeyBitLength := StrToIntDef(ComboBox1.Selected.Text, 128);
  if KeyBitLength < 512 then
  begin
    ShowMessage('Min BitCount is 512');
    exit;
  end;
  //显示菊花。
  AniIndicator1.BringToFront;
  AniIndicator1.Visible := True;
  //转菊花。
  AniIndicator1.Enabled := True;
  try
    APool := NewPool;
    Edit5.Text := RSADecryption(Edit4.Text, EditD.Text, EditN.Text,
      AEncoding, rlCRLF, APool, FWasAborted, not CheckBoxHex.IsChecked, CheckBoxOpenSSLMode.IsChecked,
      Order, OnRSAProgress);
  finally
    //隐藏菊花。
    AniIndicator1.Visible := False;
    AniIndicator1.Enabled := False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  Application.FormFactor.Orientations :=
//    [TFormOrientation.soLandscape,
//    TFormOrientation.soPortrait,
//    TFormOrientation.soInvertedLandscape,
//    TFormOrientation.soInvertedPortrait];
  Application.FormFactor.Orientations :=
    [TFormOrientation.soLandscape];
  Combobox1.ItemIndex := 2;
end;

end.
