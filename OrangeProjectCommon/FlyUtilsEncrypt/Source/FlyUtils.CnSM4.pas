{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     中国人自己的开放源码第三方开发包                         }
{                   (C)Copyright 2001-2015 CnPack 开发组                       }
{                   ------------------------------------                       }
{                                                                              }
{            本开发包是开源的自由软件，您可以遵照 CnPack 的发布协议来修        }
{        改和重新发布这一程序。                                                }
{                                                                              }
{            发布这一开发包的目的是希望它有用，但没有任何担保。甚至没有        }
{        适合特定目的而隐含的担保。更详细的情况请参阅 CnPack 发布协议。        }
{                                                                              }
{            您应该已经和开发包一起收到一份 CnPack 发布协议的副本。如果        }
{        还没有，可访问我们的网站：                                            }
{                                                                              }
{            网站地址：http://www.cnpack.org                                   }
{            电子邮件：master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2015-08-06　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

unit FlyUtils.CnSM4;

{* |<PRE>
================================================================================
* 软件名称：开发包基础库
* 单元名称：国产分组密码算法SM4单元
* 单元作者：刘啸（liuxiao@cnpack.org)
* 备    注：参考国密算法公开文档 SM4 Encryption alogrithm
*           并参考移植goldboar的C代码
* 开发平台：Windows 7 + Delphi 5.0
* 兼容测试：PWin9X/2000/XP/7 + Delphi 5/6
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id$
* 修改记录：2014.09.25 V1.0
*               移植并创建单元
================================================================================
|</PRE>}

interface

//{$I CnPack.inc}

uses
  System.SysUtils, System.Classes, FlyUtils.CnXXX.Common;

const
  SM4_ENCRYPT = 1;
  SM4_DECRYPT = 0;

  SM4_KEYSIZE = 16;
  SM4_BLOCKSIZE = 16;

type
  TSM4Context = packed record
    Mode: Integer;              {!<  encrypt/decrypt   }
    Sk: array[0..SM4_KEYSIZE * 2 - 1] of UInt32;  {!<  SM4 subkeys       }
  end;

procedure SM4SetKeyEnc(var Ctx: TSM4Context; const Key: TBytes);
{* 使用密钥 Key 进行 SM4 加密初始化
 |<PRE>
  Ctx      SM4 context to be initialized
  Key      16-byte secret key
 |</PRE>}

procedure SM4SetKeyDec(var Ctx: TSM4Context; const Key: TBytes);
{* 使用密钥 Key 进行 SM4 解密初始化
 |<PRE>
  Ctx      SM4 context to be initialized
  Key      16-byte secret key
 |</PRE>}

procedure SM4CryptEcb(var Ctx: TSM4Context; const EncryptMode: Boolean;
  const InStream, OutStream: TStream; const ByteCount: UInt64;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
{* SM4-ECB block encryption/decryption
 |<PRE>
  Ctx      SM4 context
  Mode     SM4_ENCRYPT or SM4_DECRYPT
 |</PRE>}

procedure SM4CryptCbc(var Ctx: TSM4Context; const EncryptMode: Boolean;
  const Iv: TBytes;
  const InStream, OutStream: TStream; const ByteCount: UInt64;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
{* SM4-CBC buffer encryption/decryption
 |<PRE>
  Ctx      SM4 context
  Mode     SM4_ENCRYPT or SM4_DECRYPT
  Iv       16-byte initialization vector (updated after use)
 |</PRE>}

procedure SM4EncryptStream_BytesKey(const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  KeyBytes: TBytes; IvBytes: TBytes;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

procedure SM4DecryptStream_BytesKey(const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  KeyBytes: TBytes; IvBytes: TBytes;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

procedure SM4EncryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  Key: string; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

procedure SM4DecryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  Key: string; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);

function SM4EncryptStr(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TBytes;
{ * 传入明文与加密 Key，SM4 加密返回密文，
  注：由于密文可能含有扩展 Base64 字符，因此在 DELPHI 2009 或以上版本中，请用
  TBytes 类型的变量接收返回值，以避免出现多余的 Unicode 转换而导致解密出错
}

function SM4DecryptStr(const Str: TBytes; const Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入密文与加密 Key，SM4 解密返回明文 }

function SM4EncryptStrToHex(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入明文与加密 Key，SM4 加密返回转换成十六进制的密文 }

function SM4DecryptStrFromHex(const StrHex, Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
{ * 传入十六进制的密文与加密 Key，SM4 解密返回明文 }


implementation

// uses FMX.Dialogs;

function SM4EncryptStrToHex(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
begin
  Result := StrToHex(SM4EncryptStr(Value, Key, StrEncoding, KeyEncoding, InitVectorStr,
    APaddingMode, CBCMode, ValueCRLFMode,
    KeyCRLFMode, OnProcessProc, ProcessProc));
end;

function SM4DecryptStrFromHex(const StrHex, Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
begin
  Result := SM4DecryptStr(HexToStr(StrHex), Key, ResultEncoding, KeyEncoding,
    InitVectorStr, APaddingMode, CBCMode, ResultCRLFMode,
    KeyCRLFMode, OnProcessProc, ProcessProc);
end;

function SM4EncryptStr(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TBytes;
var
  //TestByte: Byte;
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
      SM4EncryptStream(InStream, OutStream, 0, Key, KeyEncoding, InitVectorStr,
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

function SM4DecryptStr(const Str: TBytes; const Key: string;
  ResultEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
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
      SM4DecryptStream(InStream, OutStream, 0, Key, KeyEncoding, InitVectorStr,
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

type
  PUInt32 = ^UInt32;

const
  SBoxTable: array[0..SM4_KEYSIZE - 1] of array[0..SM4_KEYSIZE - 1] of Byte = (
    ($D6, $90, $E9, $FE, $CC, $E1, $3D, $B7, $16, $B6, $14, $C2, $28, $FB, $2C, $05),
    ($2B, $67, $9A, $76, $2A, $BE, $04, $C3, $AA, $44, $13, $26, $49, $86, $06, $99),
    ($9C, $42, $50, $F4, $91, $EF, $98, $7A, $33, $54, $0B, $43, $ED, $CF, $AC, $62),
    ($E4, $B3, $1C, $A9, $C9, $08, $E8, $95, $80, $DF, $94, $FA, $75, $8F, $3F, $A6),
    ($47, $07, $A7, $FC, $F3, $73, $17, $BA, $83, $59, $3C, $19, $E6, $85, $4F, $A8),
    ($68, $6B, $81, $B2, $71, $64, $DA, $8B, $F8, $EB, $0F, $4B, $70, $56, $9D, $35),
    ($1E, $24, $0E, $5E, $63, $58, $D1, $A2, $25, $22, $7C, $3B, $01, $21, $78, $87),
    ($D4, $00, $46, $57, $9F, $D3, $27, $52, $4C, $36, $02, $E7, $A0, $C4, $C8, $9E),
    ($EA, $BF, $8A, $D2, $40, $C7, $38, $B5, $A3, $F7, $F2, $CE, $F9, $61, $15, $A1),
    ($E0, $AE, $5D, $A4, $9B, $34, $1A, $55, $AD, $93, $32, $30, $F5, $8C, $B1, $E3),
    ($1D, $F6, $E2, $2E, $82, $66, $CA, $60, $C0, $29, $23, $AB, $0D, $53, $4E, $6F),
    ($D5, $DB, $37, $45, $DE, $FD, $8E, $2F, $03, $FF, $6A, $72, $6D, $6C, $5B, $51),
    ($8D, $1B, $AF, $92, $BB, $DD, $BC, $7F, $11, $D9, $5C, $41, $1F, $10, $5A, $D8),
    ($0A, $C1, $31, $88, $A5, $CD, $7B, $BD, $2D, $74, $D0, $12, $B8, $E5, $B4, $B0),
    ($89, $69, $97, $4A, $0C, $96, $77, $7E, $65, $B9, $F1, $09, $C5, $6E, $C6, $84),
    ($18, $F0, $7D, $EC, $3A, $DC, $4D, $20, $79, $EE, $5F, $3E, $D7, $CB, $39, $48)
  );

  FK: array[0..3] of UInt32 = ($3B1BAC6, $56AA3350, $677D9197, $B27022DC);

  CK: array[0..SM4_KEYSIZE * 2 - 1] of UInt32 = (
    $00070E15, $1C232A31, $383F464D, $545B6269,
    $70777E85, $8C939AA1, $A8AFB6BD, $C4CBD2D9,
    $E0E7EEF5, $FC030A11, $181F262D, $343B4249,
    $50575E65, $6C737A81, $888F969D, $A4ABB2B9,
    $C0C7CED5, $DCE3EAF1, $F8FF060D, $141B2229,
    $30373E45, $4C535A61, $686F767D, $848B9299,
    $A0A7AEB5, $BCC3CAD1, $D8DFE6ED, $F4FB0209,
    $10171E25, $2C333A41, $484F565D, $646B7279 );

procedure GetULongBe(var N: UInt32; B: array of byte; I: Integer);
var
  D: UInt32;
begin
  D := (UInt32(B[I]) shl 24) or (UInt32(B[I + 1]) shl 16) or
    (UInt32(B[I + 2]) shl 8) or (UInt32(B[I + 3]));
  N := D;
end;

procedure PutULongBe(N: UInt32; var B: array of byte; I: Integer);
begin
  B[I] := N shr 24;
  B[I + 1] := N shr 16;
  B[I + 2] := N shr 8;
  B[I + 3] := N;
end;

function SM4Shl(X: UInt32; N: Integer): UInt32;
begin
  Result := (X and $FFFFFFFF) shl N;
end;

function ROTL(X: UInt32; N: Integer): UInt32;
begin
  Result := SM4Shl(X, N) or (X shr (32 - N));
end;

procedure Swap(var A: UInt32; var B: UInt32);
var
  T: UInt32;
begin
  T := A;
  A := B;
  B := T;
end;

function SM4SBox(Inch: Byte): Byte;
var
  PTable: Pointer;
begin
  PTable := @(SboxTable[0][0]);
  Result := PByte(Integer(PTable) + Inch)^;
end;

function SM4Lt(Ka: UInt32): UInt32;
var
  BB: UInt32;
  A: array[0..3] of Byte;
  B: array[0..3] of Byte;
begin
  BB := 0;
  PutULongBe(Ka, A, 0);
  B[0] := SM4SBox(A[0]);
  B[1] := SM4SBox(A[1]);
  B[2] := SM4SBox(A[2]);
  B[3] := SM4SBox(A[3]);
  GetULongBe(BB, B, 0);

  Result := BB xor (ROTL(BB, 2)) xor (ROTL(BB, 10)) xor (ROTL(BB, 18))
    xor (ROTL(BB, 24));
end;

function SM4F(X0: UInt32; X1: UInt32; X2: UInt32; X3: UInt32; RK: UInt32): UInt32;
begin
  Result := X0 xor SM4Lt(X1 xor X2 xor X3 xor RK);
end;

function SM4CalciRK(Ka: UInt32): UInt32;
var
  BB: UInt32;
  A: array[0..3] of Byte;
  B: array[0..3] of Byte;
begin
  PutULongBe(Ka, A, 0);
  B[0] := SM4SBox(A[0]);
  B[1] := SM4SBox(A[1]);
  B[2] := SM4SBox(A[2]);
  B[3] := SM4SBox(A[3]);
  GetULongBe(BB, B, 0);
  Result := BB xor ROTL(BB, 13) xor ROTL(BB, 23);
end;

// SK Points to 32 UInt32 Array; Key Points to 16 Byte Array
procedure SM4SetKey(SK: PUInt32; Key: TBytes);
var
  MK: array[0..3] of UInt32;
  K: array[0..35] of UInt32;
  I: Integer;
begin
  GetULongBe(MK[0], Key, 0);
  GetULongBe(MK[1], Key, 4);
  GetULongBe(MK[2], Key, 8);
  GetULongBe(MK[3], Key, 12);

  K[0] := MK[0] xor FK[0];
  K[1] := MK[1] xor FK[1];
  K[2] := MK[2] xor FK[2];
  K[3] := MK[3] xor FK[3];

  for I := 0 to 31 do
  begin
    K[I + 4] := K[I] xor SM4CalciRK(K[I + 1] xor K[I+2] xor K[I + 3] xor CK[I]);
    (PUInt32(Integer(SK) + I * SizeOf(UInt32)))^ := K[I + 4];
  end;
end;

// SK Points to 32 UInt32 Array; Input/Output Points to 16 Byte Array
procedure SM4OneRound(SK: PUInt32; Input: TBytes; Output: TBytes);
var
  I: Integer;
  UlBuf: array[0..35] of UInt32;
begin
  FillChar(UlBuf, SizeOf(UlBuf), 0);

  GetULongBe(UlBuf[0], Input, 0);
  GetULongBe(UlBuf[1], Input, 4);
  GetULongBe(UlBuf[2], Input, 8);
  GetULongBe(UlBuf[3], Input, 12);

  for I := 0 to 31 do
  begin
    UlBuf[I + 4] := SM4F(UlBuf[I], UlBuf[I + 1], UlBuf[I + 2], UlBuf[I + 3],
      (PUInt32(Integer(SK) + I * SizeOf(UInt32)))^);
  end;

  PutULongBe(UlBuf[35], Output, 0);
  PutULongBe(UlBuf[34], Output, 4);
  PutULongBe(UlBuf[33], Output, 8);
  PutULongBe(UlBuf[32], Output, 12);
end;

procedure SM4SetKeyEnc(var Ctx: TSM4Context; const Key: TBytes);
begin
  Ctx.Mode := SM4_ENCRYPT;
  SM4SetKey(@(Ctx.Sk[0]), Key);
end;

procedure SM4SetKeyDec(var Ctx: TSM4Context; const Key: TBytes);
var
  I: Integer;
begin
  Ctx.Mode := SM4_DECRYPT;
  SM4SetKey(@(Ctx.Sk[0]), Key);

  for I := 0 to SM4_KEYSIZE - 1 do
    Swap(Ctx.Sk[I], Ctx.Sk[31 - I]);
end;

procedure SM4CryptEcb(var Ctx: TSM4Context; const EncryptMode: Boolean;
  const InStream, OutStream: TStream; const ByteCount: UInt64;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  Cancel: Boolean;
  ReadCount, PaddingCount,
  StreamByteCount,
  ProcMin, ProcMax, CurrDone: UInt64;
  Input, Output: TBytes;
  SizeToDelete,
  OldPosition,
  ProcessCount,
  BufLen,
  I: Integer;
  TestByte: Byte;
begin
  if InStream = nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream = nil then
    raise Exception.Create('Error: OutStream is nil.');
  Cancel := False;
  if ByteCount = 0 then
  begin
    InStream.Position := 0;
    StreamByteCount := InStream.Size;
  end
  else
  begin
    StreamByteCount := InStream.Size - InStream.Position;
    if ByteCount < StreamByteCount then
      StreamByteCount := ByteCount;
  end;

  if EncryptMode then
  begin
    PaddingCount := SM4_BLOCKSIZE - StreamByteCount mod SM4_BLOCKSIZE;
    if (APaddingMode = TPaddingMode.pmZeroPadding) then
    begin
      if PaddingCount = SM4_BLOCKSIZE then
        PaddingCount := 0;
    end;
  end
  else
  begin
    PaddingCount := 0;
  end;
  ProcessCount := StreamByteCount + PaddingCount;

  BufLen := ProcessCount;
  ProcMin := 0;
  ProcMax := ProcessCount;
  CurrDone := 0;
  Cancel := False;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then
    exit;

  OldPosition := OutStream.Position;

  ReadCount := 0;
  SetLength(Input, SM4_BLOCKSIZE);
  SetLength(Output, SM4_BLOCKSIZE);
  FillChar(Input[0], SM4_BLOCKSIZE, 0);
  FillChar(Output[0], SM4_BLOCKSIZE, 0);
  while ProcessCount > 0 do
  begin
    if ProcessCount >= SM4_BLOCKSIZE then
    begin
      BufLen := SM4_BLOCKSIZE;
    end;
    if (ReadCount + BufLen) > StreamByteCount then
    begin
      BufLen := StreamByteCount - ReadCount;
    end;
    if BufLen > 0 then
      InStream.Read(Input,  BufLen);
    if BufLen < 0 then BufLen := 0;
    ReadCount := ReadCount + SM4_BLOCKSIZE;
    if BufLen < SM4_BLOCKSIZE then
    begin
      // 尾部不足 16，补 PaddingCount
      if (APaddingMode = TPaddingMode.pmZeroPadding) then
      begin
        FillChar(Input[BufLen], SM4_BLOCKSIZE - BufLen, 0);
      end
      else if (APaddingMode = TPaddingMode.pmANSIX923) then
      begin
        if BufLen > 1 then
          FillChar(Input[BufLen], SM4_BLOCKSIZE - BufLen - 1, 0);
        Input[SM4_BLOCKSIZE - 1] := PaddingCount;
      end
      else if (APaddingMode = TPaddingMode.pmISO10126) then
      begin
        for I := BufLen to SM4_BLOCKSIZE - 2 do
        begin
          Input[I] := Random(255);
        end;
        Input[SM4_BLOCKSIZE - 1] := PaddingCount;
      end
      else
      begin
        FillChar(Input[BufLen], SM4_BLOCKSIZE - BufLen, PaddingCount);
        if (APaddingMode = TPaddingMode.pmPKCS5or7RandomPadding) and
          ((SM4_BLOCKSIZE - BufLen) > 3) then
        begin
          Input[BufLen + 1 + Random(SM4_BLOCKSIZE - BufLen - 2)] := Random(255);
        end;
      end;
    end;
    SM4OneRound(@(Ctx.Sk[0]), Input, Output);
    BufLen := SM4_BLOCKSIZE;
    if not EncryptMode then
    begin
      PaddingCount := 0;
      if (ReadCount >= StreamByteCount) then
      begin
        if (APaddingMode = TPaddingMode.pmZeroPadding) then
        begin
//bug report by [珠海]LEO(1505250187) 
          for I := SM4_BLOCKSIZE - 1 downto 0 do
          begin
            if Output[I] <> 0 then
            begin
              BufLen := I + 1;
              break;
            end;
          end;
        end
        else
        begin
          PaddingCount := Output[SM4_BLOCKSIZE - 1];
          if PaddingCount > SM4_BLOCKSIZE then PaddingCount := 0;
          if PaddingCount > 0 then
            BufLen := SM4_BLOCKSIZE - PaddingCount;
          if BufLen < 0 then BufLen := 0;
        end;
      end;
    end;
    if BufLen > 0 then
    begin
//bug report by [宁波]小卢(54927313
      if UniocdeLEMode and (BufLen mod 2 = 1) then
        inc(BufLen);
      OutStream.Write(Output, BufLen);
    end;
    Dec(ProcessCount, SM4_BLOCKSIZE);
    if Assigned(OnProcessProc) then
      OnProcessProc(nil, ProcMin, ProcMax, ReadCount, Cancel);
    if Assigned(ProcessProc) then
      ProcessProc(ProcMin, ProcMax, ReadCount, Cancel);
    if Cancel then
      exit;
  end;

  if not EncryptMode then
  begin
    TestByte := 0;
    SizeToDelete := 0;
    if (APaddingMode = TPaddingMode.pmZeroPadding) then
    begin
      OutStream.Seek(0, soFromEnd);
      CurrDone := ProcMax - 2;
      if Assigned(OnProcessProc) then
        OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
      if Assigned(ProcessProc) then
        ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
      while (TestByte = 0) and (OutStream.Position > OldPosition) do
      begin
        OutStream.Seek(-1, soFromCurrent);
        OutStream.Read(TestByte, 1);
        OutStream.Seek(-1, soFromCurrent);
        if TestByte = 0 then
          inc(SizeToDelete);
      end;
      CurrDone := ProcMax - 1;
      if Assigned(OnProcessProc) then
        OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
      if Assigned(ProcessProc) then
        ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
      if SizeToDelete > 0 then
        dec(SizeToDelete);
      OutStream.Position := OldPosition;
      if SizeToDelete > 0 then
        OutStream.Size := OutStream.Size - SizeToDelete;
    end;
    CurrDone := ProcMax;
    if Assigned(OnProcessProc) then
      OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
    if Assigned(ProcessProc) then
      ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  end;
end;

procedure SM4CryptCbc(var Ctx: TSM4Context; const EncryptMode: Boolean;
  const Iv: TBytes;
  const InStream, OutStream: TStream; const ByteCount: UInt64;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  Cancel: Boolean;
  ReadCount, PaddingCount,
  StreamByteCount,
  ProcMin, ProcMax, CurrDone: UInt64;
  Input, Output: TBytes;
  SizeToDelete,
  OldPosition,
  ProcessCount,
  BufLen,
  I: Integer;
  TestByte: Byte;
begin
  if InStream = nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream = nil then
    raise Exception.Create('Error: OutStream is nil.');

  Cancel := False;
  if ByteCount = 0 then
  begin
    InStream.Position := 0;
    StreamByteCount := InStream.Size;
  end
  else
  begin
    StreamByteCount := InStream.Size - InStream.Position;
    if ByteCount < StreamByteCount then
      StreamByteCount := ByteCount;
  end;

  if EncryptMode then
  begin
    PaddingCount := SM4_BLOCKSIZE - StreamByteCount mod SM4_BLOCKSIZE;
    if (APaddingMode = TPaddingMode.pmZeroPadding) then
    begin
      if PaddingCount = SM4_BLOCKSIZE then
        PaddingCount := 0;
    end;
  end
  else
  begin
    PaddingCount := 0;
  end;
  ProcessCount := StreamByteCount + PaddingCount;

  ProcMin := 0;
  BufLen := ProcessCount;
  ProcMax := ProcessCount;
  CurrDone := 0;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then
    exit;

  OldPosition := OutStream.Position;

  ReadCount := 0;
  SetLength(Input, SM4_BLOCKSIZE);
  SetLength(Output, SM4_BLOCKSIZE);
  FillChar(Input[0], SM4_BLOCKSIZE, 0);
  FillChar(Output[0], SM4_BLOCKSIZE, 0);
  if EncryptMode then
  begin
    while ProcessCount > 0 do
    begin
      if ProcessCount >= SM4_BLOCKSIZE then
      begin
        BufLen := SM4_BLOCKSIZE;
      end;
      if (ReadCount + BufLen) > StreamByteCount then
      begin
        BufLen := StreamByteCount - ReadCount;
      end;
      if BufLen > 0 then
        InStream.Read(Input,  BufLen);
      if BufLen < 0 then BufLen := 0;
      ReadCount := ReadCount + SM4_BLOCKSIZE;
      if BufLen < SM4_BLOCKSIZE then
      begin
        // 尾部不足 16，补 PaddingCount
        if (APaddingMode = TPaddingMode.pmZeroPadding) then
        begin
          FillChar(Input[BufLen], SM4_BLOCKSIZE - BufLen, 0);
        end
        else if (APaddingMode = TPaddingMode.pmANSIX923) then
      begin
        if BufLen > 1 then
          FillChar(Input[BufLen], SM4_BLOCKSIZE - BufLen - 1, 0);
        Input[SM4_BLOCKSIZE - 1] := PaddingCount;
      end
        else if (APaddingMode = TPaddingMode.pmISO10126) then
        begin
          for I := BufLen to SM4_BLOCKSIZE - 2 do
          begin
            Input[I] := Random(255);
          end;
          Input[SM4_BLOCKSIZE - 1] := PaddingCount;
        end
        else
        begin
          FillChar(Input[BufLen], SM4_BLOCKSIZE - BufLen, PaddingCount);
          if (APaddingMode = TPaddingMode.pmPKCS5or7RandomPadding) and
            ((SM4_BLOCKSIZE - BufLen) > 3) then
          begin
            Input[BufLen + 1 + Random(SM4_BLOCKSIZE - BufLen - 2)] := Random(255);
          end;
        end;
      end;
      for I := 0 to SM4_BLOCKSIZE - 1 do
      begin
        Output[I]:= Input[I] xor Iv[I];
      end;
      SM4OneRound(@(Ctx.Sk[0]), Output, Output);
      BufLen := SM4_BLOCKSIZE;
      if BufLen > 0 then
      begin
        OutStream.Write(Output, BufLen);
      end;
      Move(Output[0], Iv[0], 16);
      Dec(ProcessCount, SM4_BLOCKSIZE);
      if Assigned(OnProcessProc) then
        OnProcessProc(nil, ProcMin, ProcMax, ReadCount, Cancel);
      if Assigned(ProcessProc) then
        ProcessProc(ProcMin, ProcMax, ReadCount, Cancel);
      if Cancel then
        exit;
    end;
  end
  else
  begin
    while ProcessCount > 0 do
    begin
      if ProcessCount >= SM4_BLOCKSIZE then
      begin
        BufLen := SM4_BLOCKSIZE;
      end;
      if (ReadCount + BufLen) > StreamByteCount then
      begin
        BufLen := StreamByteCount - ReadCount;
      end;
      if BufLen > 0 then
        InStream.Read(Input,  BufLen);
      if BufLen < 0 then BufLen := 0;
      ReadCount := ReadCount + SM4_BLOCKSIZE;
      if BufLen < SM4_BLOCKSIZE then
      begin
        // 尾部不足 16，补 PaddingCount
        FillChar(Input[BufLen], SM4_BLOCKSIZE - BufLen, PaddingCount);
      end;
      SM4OneRound(@(Ctx.Sk[0]), Input, Output);
      for I := 0 to SM4_BLOCKSIZE - 1 do
      begin
        Output[I]:= Output[I] xor Iv[I];
      end;
      Move(Input[0], Iv[0], SM4_BLOCKSIZE);
      BufLen := SM4_BLOCKSIZE;
      if not EncryptMode then
      begin
        PaddingCount := 0;
        if (ReadCount >= StreamByteCount)  then
        begin
          if (APaddingMode = TPaddingMode.pmZeroPadding) then
          begin
//bug report by [珠海]LEO(1505250187) 
            for I := SM4_BLOCKSIZE - 1 downto 0 do
            begin
              if Output[I] <> 0 then
              begin
                BufLen := I + 1;
                break;
              end;
            end;
          end
          else
          begin
            PaddingCount := Output[SM4_BLOCKSIZE - 1];
            if PaddingCount > SM4_BLOCKSIZE then PaddingCount := 0;
            if PaddingCount > 0 then
              BufLen := SM4_BLOCKSIZE - PaddingCount;
            if BufLen < 0 then BufLen := 0;
          end;
        end;
      end;
      if BufLen > 0 then
      begin
//bug report by [宁波]小卢(54927313
      if UniocdeLEMode and (BufLen mod 2 = 1) then
        inc(BufLen);
        OutStream.Write(Output, BufLen);
      end;
      Dec(ProcessCount, SM4_BLOCKSIZE);
      if Assigned(OnProcessProc) then
        OnProcessProc(nil, ProcMin, ProcMax, ReadCount, Cancel);
      if Assigned(ProcessProc) then
        ProcessProc(ProcMin, ProcMax, ReadCount, Cancel);
      if Cancel then
        exit;
    end;
  end;

  if not EncryptMode then
  begin
    TestByte := 0;
    SizeToDelete := 0;
    if (APaddingMode = TPaddingMode.pmZeroPadding) then
    begin
      OutStream.Seek(0, soFromEnd);
      CurrDone := ProcMax - 2;
      if Assigned(OnProcessProc) then
        OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
      if Assigned(ProcessProc) then
        ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
      while (TestByte = 0) and (OutStream.Position > OldPosition) do
      begin
        OutStream.Seek(-1, soFromCurrent);
        OutStream.Read(TestByte, 1);
        OutStream.Seek(-1, soFromCurrent);
        if TestByte = 0 then
          inc(SizeToDelete);
      end;
      CurrDone := ProcMax - 1;
      if Assigned(OnProcessProc) then
        OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
      if Assigned(ProcessProc) then
        ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
      if SizeToDelete > 0 then
        dec(SizeToDelete);
      OutStream.Position := OldPosition;
      if SizeToDelete > 0 then
        OutStream.Size := OutStream.Size - SizeToDelete;
    end;
    CurrDone := ProcMax;
    if Assigned(OnProcessProc) then
      OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
    if Assigned(ProcessProc) then
      ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  end;
end;

procedure SM4EncryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  Key: string; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  ivBytes: TBytes;
  KeyBytes: TBytes;
begin
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  if KeyCRLFMode <> rlNoChange then
  begin
    Key := ChangCRLFType(Key, KeyCRLFMode);
  end;
  KeyBytes := KeyEncoding.GetBytes(Key);
  ivBytes := TEncoding.ANSI.GetBytes(InitVectorStr);
  SM4EncryptStream_BytesKey(InStream, OutStream, 0, KeyBytes, ivBytes,
        APaddingMode, CBCMode, KeyCRLFMode, UniocdeLEMode, OnProcessProc, ProcessProc);
end;

procedure SM4EncryptStream_BytesKey(const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  KeyBytes: TBytes; IvBytes: TBytes;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  Ctx: TSM4Context;
  J: Integer;
begin
  if InStream = nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream = nil then
    raise Exception.Create('Error: OutStream is nil.');
  J := Length(KeyBytes);
  if J < SM4_KEYSIZE then
  begin
    SetLength(KeyBytes, SM4_KEYSIZE);
    FillChar(KeyBytes[J], SM4_BLOCKSIZE - J, 0);
  end;
  SM4SetKeyEnc(Ctx, KeyBytes);
  if CBCMode then
  begin
    J := Length(ivBytes);
    if J < SM4_KEYSIZE then
    begin
      SetLength(ivBytes, SM4_KEYSIZE);
      FillChar(IvBytes[J], SM4_BLOCKSIZE - J, 0);
    end;
    SM4CryptCbc(Ctx, True, ivBytes, InStream, OutStream, 0, APaddingMode,
      UniocdeLEMode, OnProcessProc, ProcessProc);
  end
  else
  begin
    SM4CryptEcb(Ctx, True, InStream, OutStream, 0, APaddingMode,
      UniocdeLEMode, OnProcessProc, ProcessProc);
  end;
end;

procedure SM4DecryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  Key: string; KeyEncoding: TEncoding = nil;
  const InitVectorStr: string = '';
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  ivBytes: TBytes;
  KeyBytes: TBytes;
begin
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  if KeyCRLFMode <> rlNoChange then
  begin
    Key := ChangCRLFType(Key, KeyCRLFMode);
  end;
  KeyBytes := KeyEncoding.GetBytes(Key);
  ivBytes := TEncoding.ANSI.GetBytes(InitVectorStr);
  SM4DecryptStream_BytesKey(InStream, OutStream, 0, KeyBytes, ivBytes,
        APaddingMode, CBCMode, KeyCRLFMode, UniocdeLEMode, OnProcessProc, ProcessProc);
end;

procedure SM4DecryptStream_BytesKey(const InStream, OutStream: TStream;
  const ByteCount: UInt64;
  KeyBytes: TBytes; IvBytes: TBytes;
  APaddingMode: TPaddingMode = TPaddingMode.pmPKCS5or7RandomPadding; CBCMode: Boolean = True;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  Ctx: TSM4Context;
  J: Integer;
begin
  if InStream = nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream = nil then
    raise Exception.Create('Error: OutStream is nil.');
  J := Length(KeyBytes);
  if J < SM4_KEYSIZE then
  begin
    SetLength(KeyBytes, SM4_KEYSIZE);
    FillChar(KeyBytes[J], SM4_BLOCKSIZE - J, 0);
  end;
  SM4SetKeyDec(Ctx, KeyBytes);
  if CBCMode then
  begin
    J := Length(ivBytes);
    if J < SM4_KEYSIZE then
    begin
      SetLength(ivBytes, SM4_KEYSIZE);
      FillChar(ivBytes[J], SM4_BLOCKSIZE - J, 0);
    end;
    SM4CryptCbc(Ctx, False, ivBytes, InStream, OutStream, 0, APaddingMode,
      UniocdeLEMode, OnProcessProc, ProcessProc);
  end
  else
  begin
    SM4CryptEcb(Ctx, False, InStream, OutStream, 0, APaddingMode,
      UniocdeLEMode, OnProcessProc, ProcessProc);
  end;
end;

end.
