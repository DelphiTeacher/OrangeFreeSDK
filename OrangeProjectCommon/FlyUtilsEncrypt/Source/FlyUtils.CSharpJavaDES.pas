{ ****************************************************************************** }
// 下面是代码来源
// http://www.greensoftcode.net/techntxt/201111915391069590961
{ ****************************************************************************** }

(* ************************************************ *)
(* *)
(* 修改：爱吃猪头肉 & Flying Wang 2015-07-28 *)
(* 上面的版权声明请不要移除。 *)
(* *)
(* 禁止发布到城通网盘。 *)
(* *)
(* ************************************************ *)

unit FlyUtils.CSharpJavaDES;

// 你们可以和原来的版本对比下，看看我到底改了什么。
// 白痴们总是觉得 DELPHI 和别的语言不一样。
// 但是，使用正确的代码，各种加密解密的结果都是一样的。
//3DES 就是 用 2 个密码，加密 3 次，密码1，密码2，密码1.
//3DES3 就是用 3 个密码，加密 3 次。

interface

uses
  System.Classes, System.SysUtils, FlyUtils.CnXXX.Common;

// 所有的 Encoding 不赋值，默认就是 UTF8。
// Padding_Zero = False is PKCS5Padding
// 如果您不喜欢 HEX 格式，您可以 返回 BASE64 格式。
// 在 XE7 上，可以 uses System.NetEncoding
// 调用 System.NetEncoding.Base64.Encode(使用 Tbytes 版本的参数);
// key 和 iv 默认请设置一致。
// FeedbackByteCount 只支持 1 到 块大小。


procedure DESStream_BytesKey(const EncryptMode: Boolean;
  const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  const KeyBytes: TBytes; IvBytes: TBytes;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

procedure DESStream(const EncryptMode: Boolean;
  const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

function DESEncryptStr(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TBytes;
{ * 传入明文与加密 Key，DES 加密返回密文，
  注：由于密文可能含有扩展 Base64 字符，因此在 DELPHI 2009 或以上版本中，请用
  TBytes 类型的变量接收返回值，以避免出现多余的 Unicode 转换而导致解密出错
}

function DESDecryptStr(const Str: TBytes; const Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入密文与加密 Key，DES 解密返回明文 }

function DESEncryptStrToHex(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入明文与加密 Key，DES 加密返回转换成十六进制的密文 }

function DESDecryptStrFromHex(const StrHex, Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入十六进制的密文与加密 Key，DES 解密返回明文 }

implementation

// uses FMX.Dialogs;

const
  C_BlockSize = 8;

function DESEncryptStrToHex(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
begin
  Result := StrToHex(DESEncryptStr(Value, Key, StrEncoding, KeyEncoding, InitVectorStr,
    APaddingMode, CipherMode, FeedbackByteCount, ValueCRLFMode,
    KeyCRLFMode, OnProcessProc, ProcessProc));
end;

function DESDecryptStrFromHex(const StrHex, Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
begin
  Result := DESDecryptStr(HexToStr(StrHex), Key, ResultEncoding, KeyEncoding,
    InitVectorStr, APaddingMode, CipherMode, FeedbackByteCount, ResultCRLFMode,
    KeyCRLFMode, OnProcessProc, ProcessProc);
end;

function DESEncryptStr(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TBytes;
var
//  TestByte: Byte;
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
      DESStream(True, InStream, OutStream, 0, Key, KeyEncoding, InitVectorStr,
        APaddingMode, CipherMode, FeedbackByteCount, KeyCRLFMode,
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

function DESDecryptStr(const Str: TBytes; const Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
var
//  TestByte: Byte;
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
      DESStream(False, InStream, OutStream, 0, Key, KeyEncoding, InitVectorStr,
        APaddingMode, CipherMode, FeedbackByteCount, KeyCRLFMode,
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

type
  fdArray = array of UInt32;

  // des_createKeys
  // this takes as input a 64 bit key (even though only 56 bits are used)
  // as an array of 2 UInt32s, and returns 16 48 bit keys
procedure des_createKeys(KeyBytes: TBytes; var keys: fdArray);
const
  // declaring this locally speeds things up a bit
  pc2bytes0: array [0 .. 15] of UInt32 = (0, $4, $20000000, $20000004, $10000,
    $10004, $20010000, $20010004, $200, $204, $20000200, $20000204, $10200,
    $10204, $20010200, $20010204);
  pc2bytes1: array [0 .. 15] of UInt32 = (0, $1, $100000, $100001, $4000000,
    $4000001, $4100000, $4100001, $100, $101, $100100, $100101, $4000100,
    $4000101, $4100100, $4100101);
  pc2bytes2: array [0 .. 15] of UInt32 = (0, $8, $800, $808, $1000000, $1000008,
    $1000800, $1000808, 0, $8, $800, $808, $1000000, $1000008, $1000800,
    $1000808);
  pc2bytes3: array [0 .. 15] of UInt32 = (0, $200000, $8000000, $8200000, $2000,
    $202000, $8002000, $8202000, $20000, $220000, $8020000, $8220000, $22000,
    $222000, $8022000, $8222000);
  pc2bytes4: array [0 .. 15] of UInt32 = (0, $40000, $10, $40010, 0, $40000,
    $10, $40010, $1000, $41000, $1010, $41010, $1000, $41000, $1010, $41010);
  pc2bytes5: array [0 .. 15] of UInt32 = (0, $400, $20, $420, 0, $400, $20,
    $420, $2000000, $2000400, $2000020, $2000420, $2000000, $2000400, $2000020,
    $2000420);
  pc2bytes6: array [0 .. 15] of UInt32 = (0, $10000000, $80000, $10080000, $2,
    $10000002, $80002, $10080002, 0, $10000000, $80000, $10080000, $2,
    $10000002, $80002, $10080002);
  pc2bytes7: array [0 .. 15] of UInt32 = (0, $10000, $800, $10800, $20000000,
    $20010000, $20000800, $20010800, $20000, $30000, $20800, $30800, $20020000,
    $20030000, $20020800, $20030800);
  pc2bytes8: array [0 .. 15] of UInt32 = (0, $40000, 0, $40000, $2, $40002, $2,
    $40002, $2000000, $2040000, $2000000, $2040000, $2000002, $2040002,
    $2000002, $2040002);
  pc2bytes9: array [0 .. 15] of UInt32 = (0, $10000000, $8, $10000008, 0,
    $10000000, $8, $10000008, $400, $10000400, $408, $10000408, $400, $10000400,
    $408, $10000408);
  pc2bytes10: array [0 .. 15] of UInt32 = (0, $20, 0, $20, $100000, $100020,
    $100000, $100020, $2000, $2020, $2000, $2020, $102000, $102020,
    $102000, $102020);
  pc2bytes11: array [0 .. 15] of UInt32 = (0, $1000000, $200, $1000200, $200000,
    $1200000, $200200, $1200200, $4000000, $5000000, $4000200, $5000200,
    $4200000, $5200000, $4200200, $5200200);
  pc2bytes12: array [0 .. 15] of UInt32 = (0, $1000, $8000000, $8001000, $80000,
    $81000, $8080000, $8081000, $10, $1010, $8000010, $8001010, $80010, $81010,
    $8080010, $8081010);
  pc2bytes13: array [0 .. 15] of UInt32 = (0, $4, $100, $104, 0, $4, $100, $104,
    $1, $5, $101, $105, $1, $5, $101, $105);
  // now define the left shifts which need to be done
  shifts: array [0 .. 15] of UInt32 = (0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1,
    1, 1, 1, 0);
var
  lefttemp, righttemp, temp: UInt32;
  m, n, j, i: Integer;
  left, right: UInt32;
  iterations: Integer;
begin
  // how many iterations (1 for des, 3 for triple des)
  j := Length(KeyBytes);
  if j >= 24 then
    iterations := 3
  else
    iterations := 1;
  // stores the return keys
  n := 32 * iterations;
  SetLength(keys, n);
  n := C_BlockSize * iterations;
  SetLength(KeyBytes, n);
  FillChar(KeyBytes[j], n - j ,0);
  // other variables
  m := 0;
  n := 0;
  for j := 0 to iterations - 1 do // either 1 or 3 iterations
  begin
    left := (ord(KeyBytes[m + 0]) shl 24) or (ord(KeyBytes[m + 1]) shl 16) or
      (ord(KeyBytes[m + 2]) shl 8) or ord(KeyBytes[m + 3]);
    right := (ord(KeyBytes[m + 4]) shl 24) or (ord(KeyBytes[m + 5]) shl 16) or
      (ord(KeyBytes[m + 6]) shl 8) or ord(KeyBytes[m + 7]);
    m := m + C_BlockSize;
    temp := ((left shr 4) xor right) and $0F0F0F0F;
    right := right xor temp;
    left := left xor (temp shl 4);
    temp := ((right shr 16) xor left) and $0000FFFF;
    left := left xor temp;
    right := right xor (temp shl 16);
    temp := ((left shr 2) xor right) and $33333333;
    right := right xor temp;
    left := left xor (temp shl 2);
    temp := ((right shr 16) xor left) and $0000FFFF;
    left := left xor temp;
    right := right xor (temp shl 16);
    temp := ((left shr 1) xor right) and $55555555;
    right := right xor temp;
    left := left xor (temp shl 1);
    temp := ((right shr 8) xor left) and $00FF00FF;
    left := left xor temp;
    right := right xor (temp shl 8);
    temp := ((left shr 1) xor right) and $55555555;
    right := right xor temp;
    left := left xor (temp shl 1);
    // the right side needs to be shifted and to get the last four bits of the left side
    temp := (left shl 8) or ((right shr 20) and $000000F0);
    // left needs to be put upside down
    left := (right shl 24) or ((right shl 8) and $FF0000) or
      ((right shr 8) and $FF00) or ((right shr 24) and $F0);
    right := temp;
    // now go through and perform these shifts on the left and right keys
    for i := low(shifts) to high(shifts) do
    begin
      // shift the keys either one or two bits to the left
      if shifts[i] > 0 then
      begin
        left := (left shl 2) or (left shr 26);
        right := (right shl 2) or (right shr 26);
        // left := left shl 0;
        // right:= right shl 0;
      end
      else
      begin
        left := (left shl 1) or (left shr 27);
        right := (right shl 1) or (right shr 27);
        // left := left shl 0;
        // right:= right shl 0;
      end;
      left := left and $FFFFFFF0;
      right := right and $FFFFFFF0;
      // now apply PC-2, in such a way that E is easier when encrypting or decrypting
      // this conversion will look like PC-2 except only the last 6 bits of each byte are used
      // rather than 48 consecutive bits and the order of lines will be according to
      // how the S selection functions will be applied: S2, S4, S6, S8, S1, S3, S5, S7
      lefttemp := pc2bytes0[left shr 28] or pc2bytes1[(left shr 24) and $F] or
        pc2bytes2[(left shr 20) and $F] or pc2bytes3[(left shr 16) and $F] or
        pc2bytes4[(left shr 12) and $F] or pc2bytes5[(left shr 8) and $F] or
        pc2bytes6[(left shr 4) and $F];
      righttemp := pc2bytes7[right shr 28] or pc2bytes8[(right shr 24) and $F]
        or pc2bytes9[(right shr 20) and $F] or pc2bytes10[(right shr 16) and $F]
        or pc2bytes11[(right shr 12) and $F] or pc2bytes12[(right shr 8) and $F]
        or pc2bytes13[(right shr 4) and $F];
      temp := ((righttemp shr 16) xor lefttemp) and $0000FFFF;
      keys[n + 0] := lefttemp xor temp;
      keys[n + 1] := righttemp xor (temp shl 16);
      n := n + 2;
    end;
  end; // for each iterations
  // return the keys we've created
end; // end of des_createKeys

procedure DESStream(const EncryptMode: Boolean;
  const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = ''; APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
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
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  KeyBytes := KeyEncoding.GetBytes(FKey);
  IvBytes := TEncoding.ANSI.GetBytes(InitVectorStr);
  DESStream_BytesKey(EncryptMode, InStream, OutStream, ByteCount,
    KeyBytes, IvBytes, APaddingMode, CipherMode, FeedbackByteCount, UniocdeLEMode, OnProcessProc, ProcessProc);
end;

procedure DESStream_BytesKey(const EncryptMode: Boolean;
  const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  const KeyBytes: TBytes; IvBytes: TBytes;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  CipherMode: TCipherMode = TCipherMode.CBC;
  FeedbackByteCount: Integer = 16;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
const
  spfunction1: array [0 .. 63] of UInt32 = ($1010400, 0, $10000, $1010404,
    $1010004, $10404, $4, $10000, $400, $1010400, $1010404, $400, $1000404,
    $1010004, $1000000, $4, $404, $1000400, $1000400, $10400, $10400, $1010000,
    $1010000, $1000404, $10004, $1000004, $1000004, $10004, 0, $404, $10404,
    $1000000, $10000, $1010404, $4, $1010000, $1010400, $1000000, $1000000,
    $400, $1010004, $10000, $10400, $1000004, $400, $4, $1000404, $10404,
    $1010404, $10004, $1010000, $1000404, $1000004, $404, $10404, $1010400,
    $404, $1000400, $1000400, 0, $10004, $10400, 0, $1010004);
  spfunction2: array [0 .. 63] of UInt32 = ($80108020, $80008000, $8000,
    $108020, $100000, $20, $80100020, $80008020, $80000020, $80108020,
    $80108000, $80000000, $80008000, $100000, $20, $80100020, $108000, $100020,
    $80008020, 0, $80000000, $8000, $108020, $80100000, $100020, $80000020, 0,
    $108000, $8020, $80108000, $80100000, $8020, 0, $108020, $80100020, $100000,
    $80008020, $80100000, $80108000, $8000, $80100000, $80008000, $20,
    $80108020, $108020, $20, $8000, $80000000, $8020, $80108000, $100000,
    $80000020, $100020, $80008020, $80000020, $100020, $108000, 0, $80008000,
    $8020, $80000000, $80100020, $80108020, $108000);
  spfunction3: array [0 .. 63] of UInt32 = ($208, $8020200, 0, $8020008,
    $8000200, 0, $20208, $8000200, $20008, $8000008, $8000008, $20000, $8020208,
    $20008, $8020000, $208, $8000000, $8, $8020200, $200, $20200, $8020000,
    $8020008, $20208, $8000208, $20200, $20000, $8000208, $8, $8020208, $200,
    $8000000, $8020200, $8000000, $20008, $208, $20000, $8020200, $8000200, 0,
    $200, $20008, $8020208, $8000200, $8000008, $200, 0, $8020008, $8000208,
    $20000, $8000000, $8020208, $8, $20208, $20200, $8000008, $8020000,
    $8000208, $208, $8020000, $20208, $8, $8020008, $20200);
  spfunction4: array [0 .. 63] of UInt32 = ($802001, $2081, $2081, $80, $802080,
    $800081, $800001, $2001, 0, $802000, $802000, $802081, $81, 0, $800080,
    $800001, $1, $2000, $800000, $802001, $80, $800000, $2001, $2080, $800081,
    $1, $2080, $800080, $2000, $802080, $802081, $81, $800080, $800001, $802000,
    $802081, $81, 0, 0, $802000, $2080, $800080, $800081, $1, $802001, $2081,
    $2081, $80, $802081, $81, $1, $2000, $800001, $2001, $802080, $800081,
    $2001, $2080, $800000, $802001, $80, $800000, $2000, $802080);
  spfunction5: array [0 .. 63] of UInt32 = ($100, $2080100, $2080000, $42000100,
    $80000, $100, $40000000, $2080000, $40080100, $80000, $2000100, $40080100,
    $42000100, $42080000, $80100, $40000000, $2000000, $40080000, $40080000, 0,
    $40000100, $42080100, $42080100, $2000100, $42080000, $40000100, 0,
    $42000000, $2080100, $2000000, $42000000, $80100, $80000, $42000100, $100,
    $2000000, $40000000, $2080000, $42000100, $40080100, $2000100, $40000000,
    $42080000, $2080100, $40080100, $100, $2000000, $42080000, $42080100,
    $80100, $42000000, $42080100, $2080000, 0, $40080000, $42000000, $80100,
    $2000100, $40000100, $80000, 0, $40080000, $2080100, $40000100);
  spfunction6: array [0 .. 63] of UInt32 = ($20000010, $20400000, $4000,
    $20404010, $20400000, $10, $20404010, $400000, $20004000, $404010, $400000,
    $20000010, $400010, $20004000, $20000000, $4010, 0, $400010, $20004010,
    $4000, $404000, $20004010, $10, $20400010, $20400010, 0, $404010, $20404000,
    $4010, $404000, $20404000, $20000000, $20004000, $10, $20400010, $404000,
    $20404010, $400000, $4010, $20000010, $400000, $20004000, $20000000, $4010,
    $20000010, $20404010, $404000, $20400000, $404010, $20404000, 0, $20400010,
    $10, $4000, $20400000, $404010, $4000, $400010, $20004010, 0, $20404000,
    $20000000, $400010, $20004010);
  spfunction7: array [0 .. 63] of UInt32 = ($200000, $4200002, $4000802, 0,
    $800, $4000802, $200802, $4200800, $4200802, $200000, 0, $4000002, $2,
    $4000000, $4200002, $802, $4000800, $200802, $200002, $4000800, $4000002,
    $4200000, $4200800, $200002, $4200000, $800, $802, $4200802, $200800, $2,
    $4000000, $200800, $4000000, $200800, $200000, $4000802, $4000802, $4200002,
    $4200002, $2, $200002, $4000000, $4000800, $200000, $4200800, $802, $200802,
    $4200800, $802, $4000002, $4200802, $4200000, $200800, 0, $2, $4200802, 0,
    $200802, $4200000, $800, $4000002, $4000800, $800, $200002);
  spfunction8: array [0 .. 63] of UInt32 = ($10001040, $1000, $40000, $10041040,
    $10000000, $10001040, $40, $10000000, $40040, $10040000, $10041040, $41000,
    $10041000, $41040, $1000, $40, $10040000, $10000040, $10001000, $1040,
    $41000, $40040, $10040040, $10041000, $1040, 0, 0, $10040040, $10000040,
    $10001000, $41040, $40000, $41040, $40000, $10041000, $1000, $40, $10040040,
    $1000, $41040, $10001000, $40, $10000040, $10040000, $10040040, $10000000,
    $40000, $10001040, 0, $10041040, $40040, $10000040, $10040000, $10001000,
    $10001040, 0, $10041040, $41000, $41000, $1040, $1040, $40040, $10000000,
    $10041000);
var
  keys: fdArray;
  keyslen,
  m, i, j, k, PaddingCount: Integer;
  temp, temp2, right1, right2, left, left1, left2, right: UInt32;
  looping: array of Integer;
  cbcleft, cbcleft2, cbcright, cbcright2: UInt32;
  endloop, loopinc: Integer;
  len, iterations: Integer;
  // chunk: Integer;
  StrBytes, OutBytes: array [0 .. 7] of Byte;
  ReadCount,
  ProcessCount, ProcMin, ProcMax, CurrDone: UInt64;
  Cancel: Boolean;
  BufLen: Integer;
  PInt64_1, PInt64_2: PUInt64;
begin
  if InStream = nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream = nil then
    raise Exception.Create('Error: OutStream is nil.');
  Cancel := False;
  if ByteCount = 0 then
  begin
    InStream.Position := 0;
    ProcessCount := InStream.Size;
  end
  else
  begin
    ProcessCount := InStream.Size - InStream.Position;
    if ByteCount < ProcessCount then
      ProcessCount := ByteCount;
  end;
  if EncryptMode then
  begin
    // *********下面的是关键部分及对于c#补位( 待加密数据按照PKCS5规则进行补位。（缺7位补7个0x07，缺6位则补6个0x06，以次类推，如果正好8位，也需要补8个0x08）*********
    if (APaddingMode = TPaddingMode.pmNoPadding) and (
      not (CipherMode in [TCipherMode.ECB, TCipherMode.CBC, TCipherMode.PCBC])) then
    begin
      PaddingCount := 0;
    end
    else
    begin
      PaddingCount := C_BlockSize - ProcessCount mod C_BlockSize;
      if (APaddingMode = TPaddingMode.pmZeroPadding) then
      begin
        if PaddingCount = C_BlockSize then
          PaddingCount := 0;
      end;
    end;
  end
  else
  begin
    PaddingCount := 0;
  end;
  ProcMin := 0;
  ProcMax := ProcessCount + PaddingCount + 3;
  CurrDone := 0;
  Cancel := False;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then
    exit;

  j := Length(IvBytes);
  SetLength(IvBytes, C_BlockSize);
  if j < C_BlockSize then
    FillChar(IvBytes[j], C_BlockSize - j, 0);
  SetLength(keys, 0);
  des_createKeys(KeyBytes, keys);
  CurrDone := 1;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then
    exit;
  m := 0;
  cbcleft := 0;
  cbcleft2 := 0;
  cbcright := 0;
  cbcright2 := 0;
  // chunk := 0;
  len := ProcessCount + PaddingCount;
  keyslen := length(keys);
  if keyslen = 32 then
    iterations := 3
  else
    iterations := 9;
  if iterations = 3 then
  begin
    if EncryptMode or ( not (CipherMode in [TCipherMode.ECB, TCipherMode.CBC, TCipherMode.PCBC])) then
    begin
      SetLength(looping, 3);
      looping[0] := 0;
      looping[1] := 32;
      looping[2] := 2;
    end
    else
    begin
      SetLength(looping, 3);
      looping[0] := 30;
      looping[1] := -2;
      looping[2] := -2;
    end;
  end
  else
  begin
    if EncryptMode or ( not (CipherMode in [TCipherMode.ECB, TCipherMode.CBC, TCipherMode.PCBC])) then
    begin
      SetLength(looping, 9);
      looping[0] := 0;
      looping[1] := 32;
      looping[2] := 2;
      looping[3] := 62;
      looping[4] := 30;
      looping[5] := -2;
      looping[6] := 64;
      looping[7] := 96;
      looping[8] := 2;
    end
    else
    begin
      SetLength(looping, 9);
      looping[0] := 94;
      looping[1] := 62;
      looping[2] := -2;
      looping[3] := 32;
      looping[4] := 64;
      looping[5] := 2;
      looping[6] := 30;
      looping[7] := -2;
      looping[8] := -2;
    end;
  end;

  // store the result here
  if CipherMode in [TCipherMode.CBC, TCipherMode.PCBC] then // CBC mode (这里也是关键C#DES加密默认是CBC模式)
  begin
    cbcleft := (ord(IvBytes[0]) shl 24) or (ord(IvBytes[1]) shl 16) or
      (ord(IvBytes[2]) shl 8) or ord(IvBytes[3]);
    cbcright := (ord(IvBytes[4]) shl 24) or (ord(IvBytes[5]) shl 16) or
      (ord(IvBytes[6]) shl 8) or ord(IvBytes[7]);
  end;
  CurrDone := 2;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then
    exit;
  ReadCount := 0;
  // loop through each 64 bit chunk of the message
  while m < len do
  begin
    if (CipherMode in [TCipherMode.ECB, TCipherMode.CBC, TCipherMode.PCBC]) then
    begin
      BufLen := C_BlockSize;
    end
    else
    begin
      BufLen := FeedbackByteCount mod C_BlockSize;
      if BufLen = 0 then
        BufLen := C_BlockSize;
    end;
    if (ReadCount + BufLen) > ProcessCount then
    begin
      BufLen := ProcessCount - ReadCount;
    end;
    if BufLen > 0 then
      InStream.Read(StrBytes,  BufLen);
    if BufLen < 0 then BufLen := 0;
    ReadCount := ReadCount + BufLen;
    if (BufLen < C_BlockSize) then
    begin
      // 尾部不足 8，补 PaddingCount
      if (APaddingMode in [TPaddingMode.pmZeroPadding, TPaddingMode.pmNoPadding]) then
      begin
        FillChar(StrBytes[BufLen], C_BlockSize - BufLen, 0);
      end
      else if (APaddingMode = TPaddingMode.pmANSIX923) then
      begin
        if BufLen > 1 then
          FillChar(StrBytes[BufLen], C_BlockSize - BufLen - 1, 0);
        StrBytes[C_BlockSize - 1] := PaddingCount;
      end
      else if (APaddingMode = TPaddingMode.pmISO10126) then
      begin
        for I := BufLen to C_BlockSize - 2 do
        begin
          StrBytes[I] := Random(255);
        end;
        StrBytes[C_BlockSize - 1] := PaddingCount;
      end
      else
      begin
        FillChar(StrBytes[BufLen], C_BlockSize - BufLen, PaddingCount);
        if (APaddingMode = TPaddingMode.pmPKCS5or7RandomPadding) and
          ((C_BlockSize - BufLen) > 3) then
        begin
          StrBytes[BufLen + 1 + Random(C_BlockSize - BufLen - 2)] := Random(255);
        end;
      end;
    end;
    if (CipherMode in [TCipherMode.ECB, TCipherMode.CBC, TCipherMode.PCBC]) then
    begin
      left := (ord(StrBytes[0]) shl 24) or (ord(StrBytes[1]) shl 16) or
        (ord(StrBytes[2]) shl 8) or ord(StrBytes[3]);
      right := (ord(StrBytes[4]) shl 24) or (ord(StrBytes[5]) shl 16) or
        (ord(StrBytes[6]) shl 8) or ord(StrBytes[7]);
    end
    else
    begin
      left := (ord(IvBytes[0]) shl 24) or (ord(IvBytes[1]) shl 16) or
        (ord(IvBytes[2]) shl 8) or ord(IvBytes[3]);
      right := (ord(IvBytes[4]) shl 24) or (ord(IvBytes[5]) shl 16) or
        (ord(IvBytes[6]) shl 8) or ord(IvBytes[7]);
    end;
    m := m + C_BlockSize;
    // for Cipher Block Chaining mode, xor the message with the previous result
    if (CipherMode in [TCipherMode.CBC, TCipherMode.PCBC]) then
    begin
      if EncryptMode then
      begin
        left := left xor cbcleft;
        right := right xor cbcright;
      end
      else
      begin
        cbcleft2 := cbcleft;
        cbcright2 := cbcright;
        cbcleft := left;
        cbcright := right;
      end;
    end;
    // first each 64 but chunk of the message must be permuted according to IP
    temp := ((left shr 4) xor right) and $0F0F0F0F;
    right := right xor temp;
    left := left xor (temp shl 4);
    temp := ((left shr 16) xor right) and $0000FFFF;
    right := right xor temp;
    left := left xor (temp shl 16);
    temp := ((right shr 2) xor left) and $33333333;
    left := left xor temp;
    right := right xor (temp shl 2);
    temp := ((right shr 8) xor left) and $00FF00FF;
    left := left xor temp;
    right := right xor (temp shl 8);
    temp := ((left shr 1) xor right) and $55555555;
    right := right xor temp;
    left := left xor (temp shl 1);
    left := ((left shl 1) or (left shr 31));
    right := ((right shl 1) or (right shr 31));
    // do this either 1 or 3 times for each chunk of the message
    j := 0;
    while j < iterations do
    begin
      endloop := looping[j + 1];
      loopinc := looping[j + 2];
      // now go through and perform the encryption or decryption
      i := looping[j];
      while i <> endloop do
      begin
        if (i >= 0) and (i < keyslen) then
        begin
          right1 := right xor keys[i];
        end
        else
        begin
          right1 := right xor 0;
        end;
        if (i >= 0) and (i < keyslen - 1) then
        begin
          right2 := ((right shr 4) or (right shl 28)) xor keys[i + 1];
        end
        else
        begin
          right2 := ((right shr 4) or (right shl 28)) xor 0;
        end;
        // the result is attained by passing these bytes through the S selection functions
        temp := left;
        left := right;
        right := temp xor (spfunction2[(right1 shr 24) and $3F] or
          spfunction4[(right1 shr 16) and $3F] or spfunction6[(right1 shr 8) and
          $3F] or spfunction8[right1 and $3F] or spfunction1[(right2 shr 24) and
          $3F] or spfunction3[(right2 shr 16) and $3F] or
          spfunction5[(right2 shr 8) and $3F] or spfunction7[right2 and $3F]);
        i := i + loopinc;
      end;
      temp := left;
      left := right;
      right := temp; // unreverse left and right
      j := j + 3;
    end; // for either 1 or 3 iterations
    // move then each one bit to the right
    left := ((left shr 1) or (left shl 31));
    right := ((right shr 1) or (right shl 31));
    // now perform IP-1, which is IP in the opposite direction
    temp := ((left shr 1) xor right) and $55555555;
    right := right xor temp;
    left := left xor (temp shl 1);
    temp := ((right shr 8) xor left) and $00FF00FF;
    left := left xor temp;
    right := right xor (temp shl 8);
    temp := ((right shr 2) xor left) and $33333333;
    left := left xor temp;
    right := right xor (temp shl 2);
    temp := ((left shr 16) xor right) and $0000FFFF;
    right := right xor temp;
    left := left xor (temp shl 16);
    temp := ((left shr 4) xor right) and $0F0F0F0F;
    right := right xor temp;
    left := left xor (temp shl 4);
    // for Cipher Block Chaining mode, xor the message with the previous result
    if (CipherMode in [TCipherMode.CBC, TCipherMode.PCBC]) then
    begin
      if EncryptMode then
      begin
        cbcleft := left;
        cbcright := right;
      end
      else
      begin
        left := left xor cbcleft2;
        right := right xor cbcright2;
      end;
    end;
    OutBytes[0] := left shr 24;
    OutBytes[1] := (left shr 16) and $FF;
    OutBytes[2] := (left shr 8) and $FF;
    OutBytes[3] := left and $FF;
    OutBytes[4] := right shr 24;
    OutBytes[5] := (right shr 16) and $FF;
    OutBytes[6] := (right shr 8) and $FF;
    OutBytes[7] := right and $FF;
    if (CipherMode in [TCipherMode.ECB, TCipherMode.CBC, TCipherMode.PCBC]) then
    begin
      if (CipherMode = TCipherMode.PCBC) then
      begin
        if EncryptMode then
        begin
          PInt64_1 := Addr(OutBytes[0]);
        end
        else
        begin
          PInt64_1 := Addr(StrBytes[0]);
        end;
        PInt64_2 := Addr(IvBytes[0]);
        PInt64_2^ := PInt64_1^ xor PInt64_2^;
      end;
    end
    else
    begin
      if CipherMode = TCipherMode.OFB then
      begin
        MoveAndPad(OutBytes[0], IvBytes[0], C_BlockSize - BufLen, BufLen);
      end;
      if CipherMode = TCipherMode.CTR then
      begin
        PInt64_1 := Addr(IvBytes[0]);
        PInt64_1^ := PInt64_1^ + 1;
      end;
//      OutBytes[0] := OutBytes[0] xor StrBytes[0];
//      OutBytes[1] := OutBytes[1] xor StrBytes[1];
//      OutBytes[2] := OutBytes[2] xor StrBytes[2];
//      OutBytes[3] := OutBytes[3] xor StrBytes[3];
//      OutBytes[4] := OutBytes[4] xor StrBytes[4];
//      OutBytes[5] := OutBytes[5] xor StrBytes[5];
//      OutBytes[6] := OutBytes[6] xor StrBytes[6];
//      OutBytes[7] := OutBytes[7] xor StrBytes[0];
      PInt64_1 := Addr(OutBytes[0]);
      PInt64_2 := Addr(StrBytes[0]);
      PInt64_1^ := PInt64_1^ xor PInt64_2^;
      if CipherMode = TCipherMode.CFB then
      begin
        if EncryptMode then
        begin
          MoveAndPad(OutBytes[0], IvBytes[0], C_BlockSize - BufLen, BufLen);
        end
        else
        begin
          MoveAndPad(StrBytes[0], IvBytes[0], C_BlockSize - BufLen, BufLen);
        end;
      end;
    end;

    if (APaddingMode <> TPaddingMode.pmNoPadding) and (CipherMode in [TCipherMode.ECB, TCipherMode.CBC, TCipherMode.PCBC]) then
    begin
      BufLen := C_BlockSize;
      if not EncryptMode then
      begin
        PaddingCount := 0;
        if (ReadCount >= ProcessCount) then
        begin
          if (APaddingMode = TPaddingMode.pmZeroPadding) then
          begin
  //bug report by [珠海]LEO(1505250187)
            for I := 7 downto 0 do
            begin
              if OutBytes[I] <> 0 then
              begin
                BufLen := I + 1;
                break;
              end;
            end;
          end
          else
          begin
            PaddingCount := OutBytes[7];
            if PaddingCount > C_BlockSize then PaddingCount := 0;
            if PaddingCount > 0 then
              BufLen := C_BlockSize - PaddingCount;
            if BufLen < 0 then BufLen := 0;
          end;
        end;
      end;
    end;
    if BufLen > 0 then
    begin
//bug report by [宁波]小卢(54927313
      if UniocdeLEMode and (BufLen mod 2 = 1) then
        inc(BufLen);
      OutStream.Write(OutBytes, BufLen);
    end;
    if Assigned(OnProcessProc) then
      OnProcessProc(nil, ProcMin, ProcMax, m + 3, Cancel);
    if Assigned(ProcessProc) then
      ProcessProc(ProcMin, ProcMax, m + 3, Cancel);
    if Cancel then
      exit;
    // chunk := chunk + 8;
    // if chunk = 512 then
    // begin
    // chunk := 0;
    // end;
  end; // for every 8 characters, or 64 bits in the message

  SetLength(keys, 0);
end;

end.
