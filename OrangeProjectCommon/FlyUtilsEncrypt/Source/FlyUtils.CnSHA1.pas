unit FlyUtils.CnSHA1;

{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     中国人自己的开放源码第三方开发包                         }
{                   (C)Copyright 2001-2016 CnPack 开发组                       }
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

{* |<PRE>
================================================================================
* 软件名称：开发包基础库
* 单元名称：SHA1算法单元
* 单元作者：刘啸（Liu Xiao）
* 备    注：
* 开发平台：PWin2000Pro + Delphi 5.0
* 兼容测试：PWin9X/2000/XP + Delphi 5/6
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id: CnSHA1.pas 426 2010-02-09 07:01:49Z liuxiao $
* 修改记录：2015.08.14 V1.2
*               汇编切换至 Pascal 以支持跨平台
*           2014.10.22 V1.1
*               加入 HMAC 方法
*           2010.07.14 V1.0
*               创建单元。从网上佚名代码移植而来，加入部分功能
================================================================================
|</PRE>}

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2016-02-29　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)


interface

//{$I CnPack.inc}

{$OVERFLOWCHECKS OFF}
{$RANGECHECKS OFF}

uses
  SysUtils,Classes, FlyUtils.CnXXX.Common;

//你们可以和原来的版本对比下，看看我到底改了什么。
//白痴们总是觉得 DELPHI 和别的语言不一样。
//但是，使用正确的代码，各种加密解密的结果都是一样的。
// 如果您不喜欢 HEX 格式，您可以 返回 BASE64 格式。
// 在 XE7 上，可以 uses System.NetEncoding
// 调用 System.NetEncoding.Base64.Encode(使用 Tbytes 版本的参数);

const
  DefaultSHA1BufSize = 4096 * 1024;

var
  BufSizeForString: UInt32 = DefaultSHA1BufSize;

type
  TSHA1Digest = array[0..19] of Byte;

  TSHA1Context = record
    Hash: array[0..4] of UInt32;
    Hi, Lo: UInt32;
    Buffer: array[0..63] of Byte;
    Index: Integer;
    Ipad: array[0..HmacPadLen - 1] of Byte;      {!< HMAC: inner padding        }
    Opad: array[0..HmacPadLen - 1] of Byte;      {!< HMAC: outer padding        }
  end;

function SHA1Buffer(const Buffer; Count: UInt32): TSHA1Digest;
{* 对数据块进行SHA1转换
 |<PRE>
   const Buffer     - 要计算的数据块
   Count: UInt32  - 数据块长度
 |</PRE>}

function SHA1(const Input: TBytes; BufLen: UInt32): TSHA1Digest;

procedure SHA1Init(var Context: TSHA1Context);

procedure SHA1Update(var Context: TSHA1Context; const Buffer: array of Byte; Len: Integer);

procedure SHA1Final(var Context: TSHA1Context; var Digest: TSHA1Digest);

function SHA1Print(const Digest: TSHA1Digest): string;
{* 以十六进制格式输出SHA1计算值
 |<PRE>
   Digest: TSHA1Digest  - 指定的SHA1计算值
 |</PRE>}

function SHA1Match(const D1, D2: TSHA1Digest): Boolean;
{* 比较两个SHA1计算值是否相等
 |<PRE>
   D1: TSHA1Digest   - 需要比较的SHA1计算值
   D2: TSHA1Digest   - 需要比较的SHA1计算值
 |</PRE>}

function SHA1DigestToStr(aDig: TSHA1Digest): string;
{* SHA1计算值转 string
 |<PRE>
   aDig: TSHA1Digest   - 需要转换的SHA1计算值
 |</PRE>}

procedure SHA1HmacInit(var Ctx: TSHA1Context; const Key: TBytes; KeyLength: Integer);

procedure SHA1HmacUpdate(var Ctx: TSHA1Context; const Input: array of Byte; Length: UInt32);

procedure SHA1HmacFinal(var Ctx: TSHA1Context; var Output: TSHA1Digest);

procedure SHA1Hmac(const Key: TBytes; KeyLength: Integer; const Input: TBytes;
  Length: UInt32; var Output: TSHA1Digest);
{* Hash-based Message Authentication Code (based on SHA1) }


 //所有的 Encoding 不赋值，默认就是 UTF8。

function SHA1Stream_BytesKey(const Stream: TStream; const ByteCount: UInt64;
  HmacKeyBytes: TBytes;
  const BufSize: UInt32 = DefaultSHA1BufSize;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSHA1Digest;

function SHA1Stream(const Stream: TStream; const ByteCount: UInt64;
  const BufSize: UInt32 = DefaultSHA1BufSize;
  HmacMode: Boolean = False; HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSHA1Digest;
{* 对指定流数据进行SHA1转换
 |<PRE>
   Stream: TStream  - 要计算的流内容
   CallBack: TSHA1CalcProgressFunc - 进度回调函数，默认为空
 |</PRE>}

function SHA1File(const FileName: string;
  const BufSize: UInt32 = DefaultSHA1BufSize;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSHA1Digest;
{* 对指定文件数据进行SHA1转换
 |<PRE>
   FileName: string  - 要计算的文件名
   CallBack: TSHA1CalcProgressFunc - 进度回调函数，默认为空
 |</PRE>}

function SHA1String(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): TSHA1Digest;
{* 传入明文与加密 Key，SHA1 加密返回密文，
   注：由于密文可能含有扩展 ASCII 字符，因此在 DELPHI 2009 或以上版本中，请用
   TBytes 类型的变量接收返回值，以避免出现多余的 Unicode 转换而导致解密出错
   }

function SHA1StringToHex(const Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
{ * 传入明文与加密 Key，SHA1 加密返回转换成十六进制的密文 }


implementation

const
  MAX_FILE_SIZE = 512 * 1024 * 1024;
  // If file size <= this size (bytes), using Mapping, else stream

{$R-}

function LRot16(X: Word; c: Integer): Word; assembler;
begin
  Result := X shl (c and 15) + X shr (16 - c and 15);
//        mov     ecx, &c
//        mov     ax, &X
//        rol     ax, cl
//        mov     &Result, ax
end;

function RRot16(X: Word; c: Integer): Word; assembler;
begin
  Result := X shr (c and 15) + X shl (16 - c and 15);
//        mov     ecx, &c
//        mov     ax, &X
//        ror     ax, cl
//        mov     &Result, ax
end;

function LRot32(X: UInt32; c: Integer): UInt32; register; assembler;
begin
  Result := X shl (c and 31) + X shr (32 - c and 31);
//        mov     ecx, edx
//        rol     eax, cl
end;

function RRot32(X: UInt32; c: Integer): UInt32; register; assembler;
begin
  Result := X shr (c and 31) + X shl (32 - c and 31);
//        mov     ecx, edx
//        ror     eax, cl
end;

procedure XorBlock(I1, I2, O1: array of byte; Len: Integer);
var
  i: Integer;
begin
  for i := 0 to Len - 1 do
    O1[i] := I1[i] xor I2[i];
end;

procedure IncBlock(P: array of byte; Len: Integer);
begin
  Inc(P[Len - 1]);
  if (P[Len - 1] = 0) and (Len > 1) then
    IncBlock(P, Len - 1);
end;

function F1(x, y, z: UInt32): UInt32;
begin
  Result := z xor (x and (y xor z));
end;

function F2(x, y, z: UInt32): UInt32;
begin
  Result := x xor y xor z;
end;

function F3(x, y, z: UInt32): UInt32;
begin
  Result := (x and y) or (z and (x or y));
end;

function RB(A: UInt32): UInt32;
begin
  Result := (A shr 24) or ((A shr 8) and $FF00) or ((A shl 8) and $FF0000) or (A shl 24);
end;

procedure SHA1Compress(var Data: TSHA1Context);
var
  A, B, C, D, E, T: UInt32;
  W: array[0..79] of UInt32;
  i: Integer;
begin
  Move(Data.Buffer[0], W[0], Sizeof(Data.Buffer));
  for i := 0 to 15 do
    W[i] := RB(W[i]);
  for i := 16 to 79 do
    W[i] := LRot32(W[i - 3] xor W[i - 8] xor W[i - 14] xor W[i - 16], 1);
  A := Data.Hash[0];
  B := Data.Hash[1];
  C := Data.Hash[2];
  D := Data.Hash[3];
  E := Data.Hash[4];
  for i := 0 to 19 do
  begin
    T := LRot32(A, 5) + F1(B, C, D) + E + W[i] + $5A827999;
    E := D;
    D := C;
    C := LRot32(B, 30);
    B := A;
    A := T;
  end;
  for i := 20 to 39 do
  begin
    T := LRot32(A, 5) + F2(B, C, D) + E + W[i] + $6ED9EBA1;
    E := D;
    D := C;
    C := LRot32(B, 30);
    B := A;
    A := T;
  end;
  for i := 40 to 59 do
  begin
    T := LRot32(A, 5) + F3(B, C, D) + E + W[i] + $8F1BBCDC;
    E := D;
    D := C;
    C := LRot32(B, 30);
    B := A;
    A := T;
  end;
  for i := 60 to 79 do
  begin
    T := LRot32(A, 5) + F2(B, C, D) + E + W[i] + $CA62C1D6;
    E := D;
    D := C;
    C := LRot32(B, 30);
    B := A;
    A := T;
  end;
  Data.Hash[0] := Data.Hash[0] + A;
  Data.Hash[1] := Data.Hash[1] + B;
  Data.Hash[2] := Data.Hash[2] + C;
  Data.Hash[3] := Data.Hash[3] + D;
  Data.Hash[4] := Data.Hash[4] + E;
  FillChar(W, Sizeof(W), 0);
  FillChar(Data.Buffer, Sizeof(Data.Buffer), 0);
end;

procedure SHA1InitAndClear(var Ctx: TSHA1Context);
begin
  FillChar(Ctx.Ipad, SizeOf(Ctx.Ipad), 0);
  FillChar(Ctx.Opad, SizeOf(Ctx.Opad), 0);
  SHA1Init(Ctx);
end;

procedure SHA1Init(var Context: TSHA1Context);
begin
  Context.Hi := 0;
  Context.Lo := 0;
  Context.Index := 0;
  FillChar(Context.Buffer, Sizeof(Context.Buffer), 0);
  Context.Hash[0] := $67452301;
  Context.Hash[1] := $EFCDAB89;
  Context.Hash[2] := $98BADCFE;
  Context.Hash[3] := $10325476;
  Context.Hash[4] := $C3D2E1F0;
end;

procedure SHA1UpdateLen(var Context: TSHA1Context; Len: Integer);
var
  i, k: UInt32;
begin
  for k := 0 to 7 do
  begin
    i := Context.Lo;
    Inc(Context.Lo, Len);
    if Context.Lo < i then
      Inc(Context.Hi);
  end;
end;

procedure SHA1Update(var Context: TSHA1Context; const Buffer: array of Byte; Len: Integer);
//type
//  PByte = ^Byte;
var
  I: Integer;
begin
  SHA1UpdateLen(Context, Len);
  I := 0;
  while Len > 0 do
  begin
    Context.Buffer[Context.Index] := Buffer[I];
    Inc(I);
    Inc(Context.Index);
    Dec(Len);
    if Context.Index >= 64 then
    begin
      Context.Index := 0;
      SHA1Compress(Context);
    end;
  end;
end;

procedure SHA1Final(var Context: TSHA1Context; var Digest: TSHA1Digest);
type
  PUInt32 = ^UInt32;
begin
  Context.Buffer[Context.Index] := $80;
  if Context.Index >= 56 then
    SHA1Compress(Context);
  PUInt32(@Context.Buffer[56])^ := RB(Context.Hi);
  PUInt32(@Context.Buffer[60])^ := RB(Context.Lo);
//  Context.Buffer[56] := WordRec(LongRec(RB(Context.Hi)).Lo).Lo;
//  Context.Buffer[57] := WordRec(LongRec(RB(Context.Hi)).Lo).Hi;
//  Context.Buffer[58] := WordRec(LongRec(RB(Context.Hi)).Hi).Lo;
//  Context.Buffer[59] := WordRec(LongRec(RB(Context.Hi)).Hi).Hi;
//  Context.Buffer[60] := WordRec(LongRec(RB(Context.Lo)).Lo).Lo;
//  Context.Buffer[61] := WordRec(LongRec(RB(Context.Lo)).Lo).Hi;
//  Context.Buffer[62] := WordRec(LongRec(RB(Context.Lo)).Hi).Lo;
//  Context.Buffer[63] := WordRec(LongRec(RB(Context.Lo)).Hi).Hi;
  SHA1Compress(Context);
  Context.Hash[0] := RB(Context.Hash[0]);
  Context.Hash[1] := RB(Context.Hash[1]);
  Context.Hash[2] := RB(Context.Hash[2]);
  Context.Hash[3] := RB(Context.Hash[3]);
  Context.Hash[4] := RB(Context.Hash[4]);
  Move(Context.Hash[0], Digest[0], Sizeof(Digest));
  SHA1Init(Context);
  //FillChar(Context, Sizeof(Context), 0); // delete for Hmac;
end;

// 对数据块进行SHA1转换
function SHA1Buffer(const Buffer; Count: UInt32): TSHA1Digest;
var
  Context: TSHA1Context;
begin
  SHA1InitAndClear(Context);
  SHA1Update(Context, TBytes(Buffer), Count);
  SHA1Final(Context, Result);
end;

function SHA1(const Input: TBytes; BufLen: UInt32): TSHA1Digest;
var
  Context: TSHA1Context;
begin
  SHA1InitAndClear(Context);
  SHA1Update(Context, Input, BufLen);
  SHA1Final(Context, Result);
end;

// 以十六进制格式输出SHA1计算值
function SHA1Print(const Digest: TSHA1Digest): string;
var
  I: Byte;
const
  Digits: array[0..15] of Char = ('0', '1', '2', '3', '4', '5', '6', '7',
                                  '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
begin
  Result := '';
  for I := 0 to 19 do
//    Result := Result + {$IFDEF UNICODE}string{$ENDIF}(Digits[(Digest[I] shr 4) and $0f] +
//      Digits[Digest[I] and $0f]);
    Result := Result + IntToHex(Ord(Digest[I]), 2);
end;

// 比较两个SHA1计算值是否相等
function SHA1Match(const D1, D2: TSHA1Digest): Boolean;
var
  I: Byte;
begin
  I := 0;
  Result := TRUE;
  while Result and (I < 20) do
  begin
    Result := D1[I] = D2[I];
    Inc(I);
  end;
end;

// SHA1计算值转 string
function SHA1DigestToStr(aDig: TSHA1Digest): string;
var
  I: Integer;
begin
  SetLength(Result, 20);
  for I := 1 to 20 do
    Result[Low(Result) + I - 1] := Chr(aDig[I - 1]);
end;

procedure SHA1HmacInit(var Ctx: TSHA1Context; const Key: TBytes; KeyLength: Integer);
var
  I: Integer;
  Sum: TSHA1Digest;
begin
  if KeyLength > HmacPadLen then
  begin
    Sum := SHA1(Key, KeyLength);
    KeyLength := SizeOf(Sum);
//    Key := @Sum;
    Move(Sum[0], Key[0], Sizeof(Sum));
  end;

  FillChar(Ctx.Ipad, SizeOf(Ctx.Ipad), 0);
  FillChar(Ctx.Opad, SizeOf(Ctx.Opad), 0);
  FillChar(Ctx.Ipad, HmacPadLen, $36);
  FillChar(Ctx.Opad, HmacPadLen, $5C);

  for I := 0 to KeyLength - 1 do
  begin
    Ctx.Ipad[I] := Byte(Ctx.Ipad[I] xor Byte(Key[I]));
    Ctx.Opad[I] := Byte(Ctx.Opad[I] xor Byte(Key[I]));
  end;

  SHA1Init(Ctx);
  SHA1Update(Ctx, Ctx.Ipad, HmacPadLen);
end;

procedure SHA1HmacUpdate(var Ctx: TSHA1Context; const Input: array of Byte; Length: UInt32);
begin
  SHA1Update(Ctx, Input, Length);
end;

procedure SHA1HmacFinal(var Ctx: TSHA1Context; var Output: TSHA1Digest);
var
  Len: Integer;
  TmpBuf: TSHA1Digest;
begin
  Len := Sizeof(TmpBuf);
  SHA1Final(Ctx, TmpBuf);
  SHA1Init(Ctx);
  SHA1Update(Ctx, Ctx.Opad, HmacPadLen);
  SHA1Update(Ctx, TmpBuf, Len);
  SHA1Final(Ctx, Output);
end;

//procedure SHA1HmacFinal(var Ctx: TSHA1Context; var Output: TSHA1Digest);
//var
//  Len: Integer;
//  TmpBuf: TSHA1Digest;
//begin
//  Len := 32;
//  SHA1Final(Ctx, TmpBuf);
//  SHA1Init(Ctx);
//  SHA1Update(Ctx, Ctx.Opad, 64);
//  SHA1Update(Ctx, TmpBuf, Len);
//  SHA1Final(Ctx, Output);
//end;

procedure SHA1Hmac(const Key: TBytes; KeyLength: Integer; const Input: TBytes;
  Length: UInt32; var Output: TSHA1Digest);
var
  Ctx: TSHA1Context;
begin
  SHA1HmacInit(Ctx, Key, KeyLength);
  SHA1HmacUpdate(Ctx, Input, Length);
  SHA1HmacFinal(Ctx, Output);
end;


function InternalSHA1Stream(Stream: TStream; const ByteCount: UInt64; const BufSize: UInt32;
  var D: TSHA1Digest; HmacKeyBytes: TBytes;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): Boolean;
var
  Context: TSHA1Context;
  Buf: TBytes;
  BufLen: Cardinal;
  Size: Int64;
  ReadBytes: Cardinal;
  TotalBytes: Int64;
//  SavePos: Int64;
  CancelCalc: Boolean;
begin
  Result := False;
  if ByteCount = 0 then
  begin
    Stream.Position := 0;
    Size := Stream.Size;
  end
  else
  begin
    Size := Stream.Size - Stream.Position;
    if ByteCount < Size then
      Size := ByteCount;
  end;
  //SavePos := Stream.Position;
  TotalBytes := 0;
  if Size = 0 then
  begin
    if HmacMode then
      SHA1HmacInit(Context, HmacKeyBytes, Length(HmacKeyBytes))
    else
      SHA1InitAndClear(Context);
    SHA1Update(Context, [], 0);
    SHA1Final(Context, D);
    exit;
  end;
  if Size < BufSize then BufLen := Size
  else BufLen := BufSize;

  CancelCalc := False;
  if HmacMode then
    SHA1HmacInit(Context, HmacKeyBytes, Length(HmacKeyBytes))
  else
    SHA1InitAndClear(Context);
  SetLength(Buf, BufLen);
  FillChar(Buf[0], BufLen, 0);
  try
    repeat
      if TotalBytes > Size - BufLen then
      begin
        BufLen := Size - TotalBytes;
      end;
      ReadBytes := Stream.Read(Buf, BufLen);
      if ReadBytes <> 0 then
      begin
        Inc(TotalBytes, ReadBytes);
        if HmacMode then
          SHA1HmacUpdate(Context, Buf, ReadBytes)
        else
          SHA1Update(Context, Buf, ReadBytes);
        if Assigned(OnProcessProc) then
          OnProcessProc(nil, 0, Size, TotalBytes, CancelCalc);
        if Assigned(ProcessProc) then
          ProcessProc(0, Size, TotalBytes, CancelCalc);
        if CancelCalc then Exit;
      end;
    until (ReadBytes <= 0) or (TotalBytes >= Size);
    if HmacMode then
      SHA1HmacFinal(Context, D)
    else
      SHA1Final(Context, D);
    Result := True;
  finally
    SetLength(Buf, 0);
    //Stream.Position := SavePos;
  end;
end;

//----------------------------------------------------------------
// 用户API函数实现
//----------------------------------------------------------------

// 对指定文件数据进行SHA1转换
function SHA1File(const FileName: string;
  const BufSize: UInt32 = DefaultSHA1BufSize;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSHA1Digest;
var
  Stream: TStream;
begin
  // 大于 2G 的文件可能 Map 失败，采用流方式循环处理
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := SHA1Stream(Stream, 0, DefaultSHA1BufSize,
      HmacMode, HmacKey, KeyEncoding, rlNoChange, OnProcessProc, ProcessProc);
  finally
    Stream.Free;
  end;
end;

function SHA1Stream_BytesKey(const Stream: TStream; const ByteCount: UInt64;
  HmacKeyBytes: TBytes;
  const BufSize: UInt32 = DefaultSHA1BufSize;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSHA1Digest;
begin
  InternalSHA1Stream(Stream, ByteCount, BufSize, Result, HmacKeyBytes,
    HmacMode, OnProcessProc, ProcessProc);
end;

// 对指定流进行SHA1计算
function SHA1Stream(const Stream: TStream; const ByteCount: UInt64;
  const BufSize: UInt32 = DefaultSHA1BufSize;
  HmacMode: Boolean = False; HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSHA1Digest;
var
  HmacKeyBytes: TBytes;
begin
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  if KeyCRLFMode <> rlNoChange then
  begin
    HmacKey := ChangCRLFType(HmacKey, KeyCRLFMode);
  end;
  HmacKeyBytes := KeyEncoding.GetBytes(HmacKey);
  InternalSHA1Stream(Stream, ByteCount, BufSize, Result, HmacKeyBytes,
    HmacMode, OnProcessProc, ProcessProc);
end;

function SHA1StringToHex(const Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
begin
  Result := SHA1Print(SHA1String(Value, StrEncoding,
    ValueCRLFMode, HmacMode, HmacKey, KeyEncoding, KeyCRLFMode, OnProcessProc, ProcessProc));
end;

function SHA1String(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): TSHA1Digest;
var
//  TestByte: Byte;
  InStream: TStringStream;
//  Context: TSHA1Context;
//  Input: TBytes;
begin
  if ValueCRLFMode <> rlNoChange then
  begin
    Value := ChangCRLFType(Value, ValueCRLFMode);
  end;
  if StrEncoding = nil then
    StrEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(Value, StrEncoding, False);
  try
//    if (InStream.Size > 0) then
//    begin
//      InStream.Seek(-1, soFromEnd);
//      InStream.Read(TestByte, 1);
//      if TestByte = 0 then
//        raise Exception.Create('Error: the last char is NULL char.');
//    end;
    InStream.Position := 0;
    Result := SHA1Stream(InStream, 0, DefaultSHA1BufSize,
      HmacMode, HmacKey, KeyEncoding, KeyCRLFMode, OnProcessProc, ProcessProc);
  finally
    FreeAndNil(InStream);
  end;
end;

end.
