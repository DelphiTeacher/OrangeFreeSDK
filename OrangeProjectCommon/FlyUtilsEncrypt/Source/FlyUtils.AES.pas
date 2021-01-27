// http://bbs.2ccc.com/topic.asp?topicid=305495
(* ************************************************ *)
(* *)
(* Advanced Encryption Standard (AES) *)
(* Interface Unit v1.3.20131003 *)
(* *)
(* *)
(* Copyright (c) 2002 Jorlen Young *)
(* *)
(* *)
(* *)
(* 说明： *)
(* *)
(* 基于 ElASE.pas 单元封装 *)
(* *)
(* 这是一个 AES 加密算法的标准接口。 *)
(* *)
(* *)
(* 作者：杨泽晖      2004.12.04 *)
(* *)
(* 支持 128 / 192 / 256 位的密匙 *)
(* 默认情况下按照 128 位密匙操作 *)
(* *)
(* *)
(* Modify By 爱吃猪头肉 & Flying Wang 2013-10-01*)
(* *)
(* ************************************************ *)
{$H+}
unit FlyUtils.AES;

interface

uses
  System.SysUtils, System.Classes, System.Math,
  FlyUtils.AES.ElAES, FlyUtils.CnXXX.Common;

procedure AESEncryptStream_BytesKey(const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  const KeyBytes: TBytes;
  const IvBytes: TBytes;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

procedure AESDecryptStream_BytesKey(const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  const KeyBytes: TBytes;
  const IvBytes: TBytes;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);


procedure AESEncryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

procedure AESDecryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

function AESEncryptStr_BytesKey(const Value: string;
  const KeyBytes: TBytes;
  const IvBytes: TBytes;
  StrEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TBytes;

function AESDecryptStr_BytesKey(const Str: TBytes; const KeyBytes: TBytes; const IvBytes: TBytes;
  ResultEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;

function AESEncryptStr(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TBytes;
{ * 传入明文与加密 Key，AES 加密返回密文，
  注：由于密文可能含有扩展 Base64 字符，因此在 DELPHI 2009 或以上版本中，请用
  TBytes 类型的变量接收返回值，以避免出现多余的 Unicode 转换而导致解密出错
}

function AESDecryptStr(const Str: TBytes; const Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入密文与加密 Key，AES 解密返回明文 }

function AESEncryptStrToHex(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入明文与加密 Key，AES 加密返回转换成十六进制的密文 }

function AESDecryptStrFromHex(const StrHex, Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入十六进制的密文与加密 Key，AES 解密返回明文 }


implementation

// uses FMX.Dialogs;

function AESEncryptStrToHex(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil; KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
begin
  Result := StrToHex(AESEncryptStr(Value, Key, StrEncoding, KeyEncoding, KeyBit, InitVectorStr,
    APaddingMode, CBCMode, ValueCRLFMode,
    KeyCRLFMode, OnProcessProc, ProcessProc));
end;

function AESDecryptStrFromHex(const StrHex, Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
begin
  Result := AESDecryptStr(HexToStr(StrHex), Key, ResultEncoding, KeyEncoding, KeyBit,
    InitVectorStr, APaddingMode, CBCMode, ResultCRLFMode,
    KeyCRLFMode, OnProcessProc, ProcessProc);
end;

function AESEncryptStr_BytesKey(const Value: string; const KeyBytes: TBytes; const IvBytes: TBytes;
  StrEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TBytes;
var
  InStream, OutStream: TStringStream;
  FValue: string;
begin
  FValue := Value;
  if ValueCRLFMode <> rlNoChange then
  begin
    FValue := ChangCRLFType(FValue, ValueCRLFMode);
  end;
  if StrEncoding = nil then
    StrEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(FValue, StrEncoding, False);
  try
    InStream.Position := 0;
    OutStream := TStringStream.Create('', TEncoding.ANSI, False);
    try
      AESEncryptStream_BytesKey(InStream, OutStream, 0, KeyBytes, IvBytes, KeyBit,
        APaddingMode, CBCMode, KeyCRLFMode,
        (TEncoding.IsStandardEncoding(StrEncoding) and (StrEncoding = TEncoding.Unicode)) or
        (StrEncoding is TUnicodeEncoding and not (StrEncoding is TBigEndianUnicodeEncoding)),
        OnProcessProc, ProcessProc);
      Result := OutStream.Bytes;
      // TStringStream.Bytes 太长，和实际不符。
      SetLength(Result, OutStream.Size);
    finally
      FreeAndNil(OutStream);
    end;
  finally
    FreeAndNil(InStream);
  end;

end;

function AESDecryptStr_BytesKey(const Str: TBytes; const KeyBytes: TBytes; const IvBytes: TBytes;
  ResultEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
var
  InStream, OutStream: TStringStream;
begin
  if ResultEncoding = nil then
    ResultEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(Str);
  try
    OutStream := TStringStream.Create('', ResultEncoding, False);
    try
      AESDecryptStream_BytesKey(InStream, OutStream, 0, KeyBytes, IvBytes, KeyBit,
        APaddingMode, CBCMode, KeyCRLFMode,
        (TEncoding.IsStandardEncoding(ResultEncoding) and (ResultEncoding = TEncoding.Unicode)) or
        (ResultEncoding is TUnicodeEncoding and not (ResultEncoding is TBigEndianUnicodeEncoding)),
        OnProcessProc, ProcessProc);
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

function AESEncryptStr(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TBytes;
var
  InStream, OutStream: TStringStream;
  FValue: string;
begin
  FValue := Value;
  if ValueCRLFMode <> rlNoChange then
  begin
    FValue := ChangCRLFType(FValue, ValueCRLFMode);
  end;
  if StrEncoding = nil then
    StrEncoding := TEncoding.UTF8;
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(FValue, StrEncoding, False);
  try
    // if (InStream.Size > 0) then
    // begin
    // InStream.Seek(-1, soFromEnd);
    // InStream.Read(TestByte, 1);
    // if TestByte = 0 then
    // raise Exception.Create('Error: the last char is NULL char.');
    // end;
    InStream.Position := 0;
    OutStream := TStringStream.Create('', TEncoding.ANSI, False);
    try
      AESEncryptStream(InStream, OutStream, 0, Key, KeyEncoding, KeyBit, InitVectorStr,
        APaddingMode, CBCMode, KeyCRLFMode,
        (TEncoding.IsStandardEncoding(StrEncoding) and (StrEncoding = TEncoding.Unicode)) or
        (StrEncoding is TUnicodeEncoding and not (StrEncoding is TBigEndianUnicodeEncoding)),
        OnProcessProc, ProcessProc);
      // Result := GetMemory(OutStream.Size + 1);
      // Result[OutStream.Size] := #0;
      // Move(OutStream.Bytes[0], Result[0], OutStream.Size);
      Result := OutStream.Bytes;
      // TStringStream.Bytes 太长，和实际不符。
      SetLength(Result, OutStream.Size);
    finally
      FreeAndNil(OutStream);
    end;
  finally
    FreeAndNil(InStream);
  end;
end;

function AESDecryptStr(const Str: TBytes; const Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
var
  InStream, OutStream: TStringStream;
begin
  if ResultEncoding = nil then
    ResultEncoding := TEncoding.UTF8;
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(Str);
  try
    OutStream := TStringStream.Create('', ResultEncoding, False);
    try
      AESDecryptStream(InStream, OutStream, 0, Key, KeyEncoding, KeyBit, InitVectorStr,
        APaddingMode, CBCMode, KeyCRLFMode,
        (TEncoding.IsStandardEncoding(ResultEncoding) and (ResultEncoding = TEncoding.Unicode)) or
        (ResultEncoding is TUnicodeEncoding and not (ResultEncoding is TBigEndianUnicodeEncoding)),
        OnProcessProc, ProcessProc);
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


procedure AESEncryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  IvBytes: TBytes;
  KeyBytes: TBytes;
  FKey: string;
begin
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  FKey := Key;
  if KeyCRLFMode <> rlNoChange then
  begin
    FKey := ChangCRLFType(FKey, KeyCRLFMode);
  end;
  KeyBytes := KeyEncoding.GetBytes(FKey);
  IvBytes := TEncoding.ANSI.GetBytes(InitVectorStr);
  AESEncryptStream_BytesKey(InStream, OutStream, ByteCount, KeyBytes, IvBytes, KeyBit,
        APaddingMode, CBCMode, KeyCRLFMode, UniocdeLEMode, OnProcessProc, ProcessProc);
end;

{ --  流加密函数 默认按照 128 位密匙解密 -- }
procedure AESEncryptStream_BytesKey(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const KeyBytes: TBytes; const IvBytes: TBytes;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  AESKey128: TAESKey128;
  AESKey192: TAESKey192;
  AESKey256: TAESKey256;
  InitVector: TAESBuffer;
  I, J: Integer;
begin
  if InStream = nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream = nil then
    raise Exception.Create('Error: OutStream is nil.');
  I := Length(InitVector);
  FillChar(InitVector[0], I, 0);
  J := Length(IvBytes);
  J := Min(J, I);
  Move(IvBytes[0], InitVector[0], J);
    
  { --  128 位密匙最大长度为 16 个字符 -- }
  if KeyBit = kb128 then
  begin
    FillChar(AESKey128, SizeOf(AESKey128), 0);
    Move(PByte(KeyBytes)^, AESKey128, Min(SizeOf(AESKey128), Length(KeyBytes)));
    if CBCMode then
    begin
      EncryptAESStreamCBC(InStream, ByteCount, AESKey128, InitVector, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end
    else
    begin
      EncryptAESStreamECB(InStream, ByteCount, AESKey128, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end;
  end;
  { --  192 位密匙最大长度为 24 个字符 -- }
  if KeyBit = kb192 then
  begin
    FillChar(AESKey192, SizeOf(AESKey192), 0);
    Move(PByte(KeyBytes)^, AESKey192, Min(SizeOf(AESKey192), Length(KeyBytes)));
    if CBCMode then
    begin
      EncryptAESStreamCBC(InStream, ByteCount, AESKey192, InitVector, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end
    else
    begin
      EncryptAESStreamECB(InStream, ByteCount, AESKey192, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end;
  end;
  { --  256 位密匙最大长度为 32 个字符 -- }
  if KeyBit = kb256 then
  begin
    FillChar(AESKey256, SizeOf(AESKey256), 0);
    Move(PByte(KeyBytes)^, AESKey256, Min(SizeOf(AESKey256), Length(KeyBytes)));
    if CBCMode then
    begin
      EncryptAESStreamCBC(InStream, ByteCount, AESKey256, InitVector, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end
    else
    begin
      EncryptAESStreamECB(InStream, ByteCount, AESKey256, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end;
  end;
end;

procedure AESDecryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  KeyBit: TKeyBit = kb128;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  IvBytes: TBytes;
  KeyBytes: TBytes;
  FKey: string;
begin
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  FKey := Key;
  if KeyCRLFMode <> rlNoChange then
  begin
    FKey := ChangCRLFType(FKey, KeyCRLFMode);
  end;
  KeyBytes := KeyEncoding.GetBytes(FKey);
  IvBytes := TEncoding.ANSI.GetBytes(InitVectorStr);
  AESDecryptStream_BytesKey(InStream, OutStream, ByteCount, KeyBytes, IvBytes, KeyBit,
        APaddingMode, CBCMode, KeyCRLFMode, UniocdeLEMode, OnProcessProc, ProcessProc);
end;

{ --  流解密函数 默认按照 128 位密匙解密 -- }
procedure AESDecryptStream_BytesKey(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const KeyBytes: TBytes; const IvBytes: TBytes;
  KeyBit: TKeyBit = kb128;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  AESKey128: TAESKey128;
  AESKey192: TAESKey192;
  AESKey256: TAESKey256;
  InitVector: TAESBuffer;
  SizeToDelete,
  OldPosition,
  I, J: Integer;
  TestByte: Byte;
begin
  if InStream = nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream = nil then
    raise Exception.Create('Error: OutStream is nil.');
  I := Length(InitVector);
  FillChar(InitVector[0], I, 0);
  J := Length(IvBytes);
  J := Min(J, I);
  Move(IvBytes[0], InitVector[0], J);

  OldPosition := OutStream.Position;

  { --  128 位密匙最大长度为 16 个字符 -- }
  if KeyBit = kb128 then
  begin
    FillChar(AESKey128, SizeOf(AESKey128), 0);
    Move(PByte(KeyBytes)^, AESKey128, Min(SizeOf(AESKey128), Length(KeyBytes)));
    if CBCMode then
    begin
      DecryptAESStreamCBC(InStream, ByteCount, AESKey128, InitVector, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end
    else
    begin
      DecryptAESStreamECB(InStream, ByteCount, AESKey128, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end;
  end;
  { --  192 位密匙最大长度为 24 个字符 -- }
  if KeyBit = kb192 then
  begin
    FillChar(AESKey192, SizeOf(AESKey192), 0);
    Move(PByte(KeyBytes)^, AESKey192, Min(SizeOf(AESKey192), Length(KeyBytes)));
    if CBCMode then
    begin
      DecryptAESStreamCBC(InStream, ByteCount, AESKey192, InitVector, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end
    else
    begin
      DecryptAESStreamECB(InStream, ByteCount, AESKey192, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end;
  end;
  { --  256 位密匙最大长度为 32 个字符 -- }
  if KeyBit = kb256 then
  begin
    FillChar(AESKey256, SizeOf(AESKey256), 0);
    Move(PByte(KeyBytes)^, AESKey256, Min(SizeOf(AESKey256), Length(KeyBytes)));
    if CBCMode then
    begin
      DecryptAESStreamCBC(InStream, ByteCount, AESKey256, InitVector, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end
    else
    begin
      DecryptAESStreamECB(InStream, ByteCount, AESKey256, OutStream, APaddingMode,
        UniocdeLEMode, OnProcessProc, ProcessProc);
    end;
  end;
  TestByte := 0;
  SizeToDelete := 0;
   if (APaddingMode = TPaddingMode.pmZeroPadding) then
  begin
    OutStream.Seek(0, soFromEnd);
    while (TestByte = 0) and (OutStream.Position > OldPosition) do
    begin
      OutStream.Seek(-1, soFromCurrent);
      OutStream.Read(TestByte, 1);
      OutStream.Seek(-1, soFromCurrent);
      if TestByte = 0 then
        inc(SizeToDelete);
    end;
    if SizeToDelete > 0 then
      dec(SizeToDelete);
    OutStream.Position := OldPosition;
    if SizeToDelete > 0 then
      OutStream.Size := OutStream.Size - SizeToDelete;
  end;
end;

end.
