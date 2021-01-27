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

{******************************************************************************}
{        该单元基于Ronald L. Rivest的MD5.pas改写，以下是MD5.pas的声明：        }
{ -----------------------------------------------------------------------------}
{                                                                              }
{                                 MD5 Message-Digest for Delphi 4              }
{                                                                              }
{                                 Delphi 4 Unit implementing the               }
{                      RSA Data Security, Inc. MD5 Message-Digest Algorithm    }
{                                                                              }
{                          Implementation of Ronald L. Rivest's RFC 1321       }
{                                                                              }
{                      Copyright ?1997-1999 Medienagentur Fichtner & Meyer     }
{                                  Written by Matthias Fichtner                }
{                                                                              }
{ -----------------------------------------------------------------------------}
{        See RFC 1321 for RSA Data Security's copyright and license notice!    }
{ -----------------------------------------------------------------------------}
{        The latest release of md5.pas will always be available from           }
{        the distribution site at: http://www.fichtner.net/delphi/md5/         }
{ -----------------------------------------------------------------------------}
{                       Please send questions, bug reports and suggestions     }
{                      regarding this code to: mfichtner@fichtner-meyer.com    }
{ -----------------------------------------------------------------------------}
{                        This code is provided "as is" without express or      }
{                     implied warranty of any kind. Use it at your own risk.   }
{******************************************************************************}

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2015-08-05　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

unit FlyUtils.CnMD5;
{* |<PRE>
================================================================================
* 软件名称：开发包基础库
* 单元名称：MD5算法单元
* 单元作者：何清（QSoft） hq.com@263.net; http://qsoft.51.net
* 备    注：
* 开发平台：PWin2000Pro + Delphi 5.0
* 兼容测试：PWin9X/2000/XP + Delphi 5/6
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id$
* 修改记录：2014.11.14 V1.2
*               汇编切换至 Pascal 以支持跨平台
*           2003.09.18 V1.1
*               好不容易找到了该单元原作者的版权声明
*           2003.09.18 V1.0
*               创建单元
================================================================================
|</PRE>}


//你们可以和原来的版本对比下，看看我到底改了什么。
//白痴们总是觉得 DELPHI 和别的语言不一样。
//但是，使用正确的代码，各种加密解密的结果都是一样的。
// 如果您不喜欢 HEX 格式，您可以 返回 BASE64 格式。
// 在 XE7 上，可以 uses System.NetEncoding
// 调用 System.NetEncoding.Base64.Encode(使用 Tbytes 版本的参数);

interface

//{$I CnPack.inc}

{$OVERFLOWCHECKS OFF}
{$RANGECHECKS OFF}

uses
  System.Classes, System.SysUtils, FlyUtils.CnXXX.Common;

const
  DefaultMD5BufSize = 32 * 1024;

var
  BufSizeForString: UInt32 = DefaultMD5BufSize;

type
  TMD5Count = array[0..1] of UInt32;
  TMD5State = array[0..3] of UInt32;
  TMD5Block = array[0..15] of UInt32;
  TMD5CBits = array[0..7] of byte;
  TMD5Digest = array[0..15] of byte;
  TMD5Buffer = array[0..63] of byte;

  TMD5Context = record
    State   : TMD5State;
    Count   : TMD5Count;
    Buffer  : TMD5Buffer;
    Ipad: array[0..HmacPadLen - 1] of Byte;      {!< HMAC: inner padding        }
    Opad: array[0..HmacPadLen - 1] of Byte;      {!< HMAC: outer padding        }
  end;

procedure MD5Init(var Context: TMD5Context);
procedure MD5Update(var Context: TMD5Context; Input: array of Byte; Length: UInt32);
procedure MD5Final(var Context: TMD5Context; var Digest: TMD5Digest);

function MD5(const Input: TBytes; BufLen: UInt32): TMD5Digest;


procedure MD5HmacInit(var Ctx: TMD5Context; const Key: TBytes; KeyLength: Integer);

procedure MD5HmacUpdate(var Ctx: TMD5Context; Input: array of Byte; Length: UInt32);

procedure MD5HmacFinal(var Ctx: TMD5Context; var Output: TMD5Digest);

procedure MD5Hmac(const Key: TBytes; KeyLength: Integer; const Input: TBytes;
  Length: UInt32; var Output: TMD5Digest);
{* Hash-based Message Authentication Code (based on MD5) }

//----------------------------------------------------------------
// 用户API函数定义
//----------------------------------------------------------------

function MD5Buffer(const Buffer; Count: UInt32): TMD5Digest;
{* 对数据块进行MD5转换
 |<PRE>
   const Buffer     - 要计算的数据块
   Count: UInt32  - 数据块长度
 |</PRE>}

function MD5Print(const Digest: TMD5Digest): string;
{* 以十六进制格式输出MD5计算值
 |<PRE>
   Digest: TMD5Digest  - 指定的MD5计算值
 |</PRE>}

function MD5Match(const D1, D2: TMD5Digest): Boolean;
{* 比较两个MD5计算值是否相等
 |<PRE>
   D1: TMD5Digest   - 需要比较的MD5计算值
   D2: TMD5Digest   - 需要比较的MD5计算值
 |</PRE>}

function MD5DigestToStr(aDig: TMD5Digest): string;
{* MD5计算值转 string
 |<PRE>
   aDig: TMD5Digest   - 需要转换的MD5计算值
 |</PRE>}

//所有的 Encoding 不赋值，默认就是 UTF8。

function MD5Stream_BytesKey(const Stream: TStream; const ByteCount: UInt64;
  const HmacKeyBytes: TBytes;
  const BufSize: UInt32 = DefaultMD5BufSize;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TMD5Digest;

function MD5Stream(const Stream: TStream; const ByteCount: UInt64;
  const BufSize: UInt32 = DefaultMD5BufSize;
  HmacMode: Boolean = False; HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TMD5Digest;
{* 对指定流数据进行MD5转换
 |<PRE>
   Stream: TStream  - 要计算的流内容
   CallBack: TMD5CalcProgressFunc - 进度回调函数，默认为空
 |</PRE>}

function MD5File(const FileName: string;
  const BufSize: UInt32 = DefaultMD5BufSize;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TMD5Digest;
{* 对指定文件数据进行MD5转换
 |<PRE>
   FileName: string  - 要计算的文件名
   CallBack: TMD5CalcProgressFunc - 进度回调函数，默认为空
 |</PRE>}

function MD5String(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): TMD5Digest;
{* 传入明文与加密 Key，MD5 加密返回密文，
   注：由于密文可能含有扩展 ASCII 字符，因此在 DELPHI 2009 或以上版本中，请用
   TBytes 类型的变量接收返回值，以避免出现多余的 Unicode 转换而导致解密出错
   }

function MD5StringToHex(const Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
{ * 传入明文与加密 Key，MD5 加密返回转换成十六进制的密文 }

implementation

//uses FMX.Dialogs;

type
  PUInt32 = ^UInt32;

var
  PADDING: TMD5Buffer = (
    $80, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00
  );

function F(x, y, z: UInt32): UInt32;
begin
  Result := (x and y) or ((not x) and z);
//  AND EDX, EAX
//  NOT EAX
//  AND EAX, ECX
//  OR EAX, EDX
end;

function G(x, y, z: UInt32): UInt32;
begin
  Result := (x and z) or (y and (not z));
//  AND EAX, ECX
//  NOT ECX
//  AND EDX, ECX
//  OR EAX, EDX
end;

function H(x, y, z: UInt32): UInt32;
begin
  Result := x xor y xor z;
//  XOR EAX, EDX
//  XOR EAX, ECX
end;

function I(x, y, z: UInt32): UInt32;
begin
  Result := y xor (x or (not z));
//  NOT ECX
//  OR EAX, ECX
//  XOR EAX, EDX
end;


procedure ROT(var x: UInt32; n: BYTE);
begin
  x := (x shl n) or (x shr (32 - n));
//  PUSH EBX
//  MOV CL, $20
//  SUB CL, DL
//  MOV EBX, [EAX]
//  SHR EBX, CL
//  MOV ECX, EDX
//  MOV EDX, [EAX]
//  SHL EDX, CL
//  OR EBX, EDX
//  MOV [EAX], EBX
//  POP EBX
end;

procedure FF(var a: UInt32; b, c, d, x: UInt32; s: BYTE; ac: UInt32);
begin
  Inc(a, F(b, c, d) + x + ac);
  ROT(a, s);
  Inc(a, b);
end;

procedure GG(var a: UInt32; b, c, d, x: UInt32; s: BYTE; ac: UInt32);
begin
  Inc(a, G(b, c, d) + x + ac);
  ROT(a, s);
  Inc(a, b);
end;

procedure HH(var a: UInt32; b, c, d, x: UInt32; s: BYTE; ac: UInt32);
begin
  Inc(a, H(b, c, d) + x + ac);
  ROT(a, s);
  Inc(a, b);
end;

procedure II(var a: UInt32; b, c, d, x: UInt32; s: BYTE; ac: UInt32);
begin
  Inc(a, I(b, c, d) + x + ac);
  ROT(a, s);
  Inc(a, b);
end;

// Encode Count bytes at Source into (Count / 4) UInt32s at Target
procedure Encode(Source, Target: pointer; Count: UInt32);
var
  S: PByte;
  T: PUInt32;
  I: UInt32;
begin
  S := Source;
  T := Target;
  for I := 1 to Count div 4 do
  begin
    T^ := S^;
    Inc(S);
    T^ := T^ or (S^ shl 8);
    Inc(S);
    T^ := T^ or (S^ shl 16);
    Inc(S);
    T^ := T^ or (S^ shl 24);
    Inc(S);
    Inc(T);
  end;
end;

// Decode Count UInt32s at Source into (Count * 4) Bytes at Target
procedure Decode(Source, Target: pointer; Count: UInt32);
var
  S: PUInt32;
  T: PByte;
  I: UInt32;
begin
  S := Source;
  T := Target;
  for I := 1 to Count do
  begin
    T^ := S^ and $ff;
    Inc(T);
    T^ := (S^ shr 8) and $ff;
    Inc(T);
    T^ := (S^ shr 16) and $ff;
    Inc(T);
    T^ := (S^ shr 24) and $ff;
    Inc(T);
    Inc(S);
  end;
end;

// Transform State according to first 64 bytes at Buffer
procedure Transform(Buffer: pointer; var State: TMD5State);
var
  a, b, c, d: UInt32;
  Block: TMD5Block;
begin
  Encode(Buffer, @Block, 64);
  a := State[0];
  b := State[1];
  c := State[2];
  d := State[3];
  FF (a, b, c, d, Block[ 0],  7, $d76aa478);
  FF (d, a, b, c, Block[ 1], 12, $e8c7b756);
  FF (c, d, a, b, Block[ 2], 17, $242070db);
  FF (b, c, d, a, Block[ 3], 22, $c1bdceee);
  FF (a, b, c, d, Block[ 4],  7, $f57c0faf);
  FF (d, a, b, c, Block[ 5], 12, $4787c62a);
  FF (c, d, a, b, Block[ 6], 17, $a8304613);
  FF (b, c, d, a, Block[ 7], 22, $fd469501);
  FF (a, b, c, d, Block[ 8],  7, $698098d8);
  FF (d, a, b, c, Block[ 9], 12, $8b44f7af);
  FF (c, d, a, b, Block[10], 17, $ffff5bb1);
  FF (b, c, d, a, Block[11], 22, $895cd7be);
  FF (a, b, c, d, Block[12],  7, $6b901122);
  FF (d, a, b, c, Block[13], 12, $fd987193);
  FF (c, d, a, b, Block[14], 17, $a679438e);
  FF (b, c, d, a, Block[15], 22, $49b40821);
  GG (a, b, c, d, Block[ 1],  5, $f61e2562);
  GG (d, a, b, c, Block[ 6],  9, $c040b340);
  GG (c, d, a, b, Block[11], 14, $265e5a51);
  GG (b, c, d, a, Block[ 0], 20, $e9b6c7aa);
  GG (a, b, c, d, Block[ 5],  5, $d62f105d);
  GG (d, a, b, c, Block[10],  9,  $2441453);
  GG (c, d, a, b, Block[15], 14, $d8a1e681);
  GG (b, c, d, a, Block[ 4], 20, $e7d3fbc8);
  GG (a, b, c, d, Block[ 9],  5, $21e1cde6);
  GG (d, a, b, c, Block[14],  9, $c33707d6);
  GG (c, d, a, b, Block[ 3], 14, $f4d50d87);
  GG (b, c, d, a, Block[ 8], 20, $455a14ed);
  GG (a, b, c, d, Block[13],  5, $a9e3e905);
  GG (d, a, b, c, Block[ 2],  9, $fcefa3f8);
  GG (c, d, a, b, Block[ 7], 14, $676f02d9);
  GG (b, c, d, a, Block[12], 20, $8d2a4c8a);
  HH (a, b, c, d, Block[ 5],  4, $fffa3942);
  HH (d, a, b, c, Block[ 8], 11, $8771f681);
  HH (c, d, a, b, Block[11], 16, $6d9d6122);
  HH (b, c, d, a, Block[14], 23, $fde5380c);
  HH (a, b, c, d, Block[ 1],  4, $a4beea44);
  HH (d, a, b, c, Block[ 4], 11, $4bdecfa9);
  HH (c, d, a, b, Block[ 7], 16, $f6bb4b60);
  HH (b, c, d, a, Block[10], 23, $bebfbc70);
  HH (a, b, c, d, Block[13],  4, $289b7ec6);
  HH (d, a, b, c, Block[ 0], 11, $eaa127fa);
  HH (c, d, a, b, Block[ 3], 16, $d4ef3085);
  HH (b, c, d, a, Block[ 6], 23,  $4881d05);
  HH (a, b, c, d, Block[ 9],  4, $d9d4d039);
  HH (d, a, b, c, Block[12], 11, $e6db99e5);
  HH (c, d, a, b, Block[15], 16, $1fa27cf8);
  HH (b, c, d, a, Block[ 2], 23, $c4ac5665);
  II (a, b, c, d, Block[ 0],  6, $f4292244);
  II (d, a, b, c, Block[ 7], 10, $432aff97);
  II (c, d, a, b, Block[14], 15, $ab9423a7);
  II (b, c, d, a, Block[ 5], 21, $fc93a039);
  II (a, b, c, d, Block[12],  6, $655b59c3);
  II (d, a, b, c, Block[ 3], 10, $8f0ccc92);
  II (c, d, a, b, Block[10], 15, $ffeff47d);
  II (b, c, d, a, Block[ 1], 21, $85845dd1);
  II (a, b, c, d, Block[ 8],  6, $6fa87e4f);
  II (d, a, b, c, Block[15], 10, $fe2ce6e0);
  II (c, d, a, b, Block[ 6], 15, $a3014314);
  II (b, c, d, a, Block[13], 21, $4e0811a1);
  II (a, b, c, d, Block[ 4],  6, $f7537e82);
  II (d, a, b, c, Block[11], 10, $bd3af235);
  II (c, d, a, b, Block[ 2], 15, $2ad7d2bb);
  II (b, c, d, a, Block[ 9], 21, $eb86d391);
  Inc(State[0], a);
  Inc(State[1], b);
  Inc(State[2], c);
  Inc(State[3], d);
end;

procedure MD5InitAndClear(var Ctx: TMD5Context);
begin
  FillChar(Ctx.Ipad, SizeOf(Ctx.Ipad), 0);
  FillChar(Ctx.Opad, SizeOf(Ctx.Opad), 0);
  MD5Init(Ctx);
end;

// Initialize given Context
procedure MD5Init(var Context: TMD5Context);
begin
  with Context do
  begin
    State[0] := $67452301;
    State[1] := $efcdab89;
    State[2] := $98badcfe;
    State[3] := $10325476;
    Count[0] := 0;
    Count[1] := 0;
    FillChar(Buffer, SizeOf(TMD5Buffer), 0);
  end;
end;

// Update given Context to include Length bytes of Input
procedure MD5Update(var Context: TMD5Context; Input: array of Byte; Length: UInt32);
var
  Index: UInt32;
  PartLen: UInt32;
  I: UInt32;
begin
  with Context do
  begin
    Index := (Count[0] shr 3) and $3f;
    Inc(Count[0], Length shl 3);
    if Count[0] < (Length shl 3) then Inc(Count[1]);
    Inc(Count[1], Length shr 29);
  end;
  if Index > 64 then Index := 64;
  

  PartLen := 64 - Index;
  if Length >= PartLen then
  begin
    Move(Input[0], Context.Buffer[Index], PartLen);
    Transform(@Context.Buffer, Context.State);
    I := PartLen;
    while I + 63 < Length do
    begin
      Transform(@Input[I], Context.State);
      Inc(I, 64);
    end;
    Index := 0;
  end
  else I := 0;
  PartLen := Length - I;
  if PartLen > 0 then
  begin
    Move(Input[I], Context.Buffer[Index], PartLen);
  end;
end;

// Finalize given Context, create Digest and zeroize Context
procedure MD5Final(var Context: TMD5Context; var Digest: TMD5Digest);
var
  Bits: TMD5CBits;
  Index: UInt32;
  PadLen: UInt32;
begin
  Decode(@Context.Count, @Bits, 2);
  Index := (Context.Count[0] shr 3) and $3f;
//  if Index < 0 then Index := 0;
  if Index < 56 then
    PadLen := 56 - Index
  else
    PadLen := 120 - Index;
  if PadLen > 64 then PadLen := 64;
//  if PadLen < 0 then PadLen := 0;
  MD5Update(Context, PADDING, PadLen);
  MD5Update(Context, Bits, 8);
  Decode(@Context.State, @Digest, 4);
  MD5Init(Context);
//  FillChar(Context, SizeOf(TMD5Context), 0); // delete for Hmac;
end;

function MD5(const Input: TBytes; BufLen: UInt32): TMD5Digest;
var
  Context: TMD5Context;
begin
  MD5InitAndClear(Context);
  MD5Update(Context, Input, BufLen);
  MD5Final(Context, Result);
end;

procedure MD5HmacInit(var Ctx: TMD5Context; const Key: TBytes; KeyLength: Integer);
var
  I: Integer;
  Sum: TMD5Digest;
begin
  if KeyLength > HmacPadLen then
  begin
    Sum := MD5(Key, KeyLength);
    KeyLength := SizeOf(Sum);
//    Key := @Sum;
    Move(Sum[0], Key[0], Sizeof(Sum));
  end;

  FillChar(Ctx.Ipad, SizeOf(Ctx.Ipad), 0);
  FillChar(Ctx.Opad, SizeOf(Ctx.Opad), 0);
  FillChar(Ctx.Ipad, HmacPadLen, $36);
  FillChar(Ctx.Opad, HmacPadLen, $5C);
//
  for I := 0 to KeyLength - 1 do
  begin
    Ctx.Ipad[I] := Byte(Ctx.Ipad[I] xor Byte(Key[I]));
    Ctx.Opad[I] := Byte(Ctx.Opad[I] xor Byte(Key[I]));
  end;

////http://www.ietf.org/rfc/rfc2104.txt
//  Move(Key[0], Ctx.Ipad[0], KeyLength);
//  Move(Key[0], Ctx.Opad[0], KeyLength);
//  for I := 0 to HmacPadLen -1 do
//  begin
//    Ctx.Ipad[I] := Ctx.Ipad[I] xor $36;
//    Ctx.Opad[I] := Ctx.Opad[I] xor $5C;
//  end;

  MD5Init(Ctx);
  MD5Update(Ctx, Ctx.Ipad, HmacPadLen);
end;

procedure MD5HmacUpdate(var Ctx: TMD5Context; Input: array of Byte; Length: UInt32);
begin
  MD5Update(Ctx, Input, Length);
end;

procedure MD5HmacFinal(var Ctx: TMD5Context; var Output: TMD5Digest);
var
  Len: Integer;
  TmpBuf: TMD5Digest;
begin
  Len := Sizeof(TmpBuf);
  MD5Final(Ctx, TmpBuf);
  MD5Init(Ctx);
  MD5Update(Ctx, Ctx.Opad, HmacPadLen);
  MD5Update(Ctx, TmpBuf, Len);
  MD5Final(Ctx, Output);
end;

procedure MD5Hmac(const Key: TBytes; KeyLength: Integer; const Input: TBytes;
  Length: UInt32; var Output: TMD5Digest);
var
  Ctx: TMD5Context;
begin
  MD5HmacInit(Ctx, Key, KeyLength);
  MD5HmacUpdate(Ctx, Input, Length);
  MD5HmacFinal(Ctx, Output);
end;

function InternalMD5Stream(Stream: TStream; const ByteCount: UInt64; const BufSize: UInt32;
  var D: TMD5Digest; HmacKeyBytes: TBytes;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): Boolean;
var
  Context: TMD5Context;
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
      MD5HmacInit(Context, HmacKeyBytes, Length(HmacKeyBytes))
    else
      MD5InitAndClear(Context);
    MD5Update(Context, [], 0);;
    MD5Final(Context, D);
    exit;
  end;
  if Size < BufSize then BufLen := Size
  else BufLen := BufSize;

  CancelCalc := False;
  if HmacMode then
    MD5HmacInit(Context, HmacKeyBytes, Length(HmacKeyBytes))
  else
    MD5InitAndClear(Context);
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
          MD5HmacUpdate(Context, Buf, ReadBytes)
        else
          MD5Update(Context, Buf, ReadBytes);
        if Assigned(OnProcessProc) then
          OnProcessProc(nil, 0, Size, TotalBytes, CancelCalc);
        if Assigned(ProcessProc) then
          ProcessProc(0, Size, TotalBytes, CancelCalc);
        if CancelCalc then Exit;
      end;
    until (ReadBytes <= 0) or (TotalBytes >= Size);
    if HmacMode then
      MD5HmacFinal(Context, D)
    else
      MD5Final(Context, D);
    Result := True;
  finally
    SetLength(Buf, 0);
    //Stream.Position := SavePos;
  end;
end;

//----------------------------------------------------------------
// 用户API函数实现
//----------------------------------------------------------------

// 对数据块进行MD5转换
function MD5Buffer(const Buffer; Count: UInt32): TMD5Digest;
var
  Context: TMD5Context;
begin
  MD5Init(Context);
  MD5Update(Context, TBytes(Buffer), Count);
  MD5Final(Context, Result);
end;

// 以十六进制格式输出MD5计算值
function MD5Print(const Digest: TMD5Digest): string;
var
  I: byte;
const
  Digits: array[0..15] of Char = ('0', '1', '2', '3', '4', '5', '6', '7',
                                  '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
begin
  Result := '';
  for I := 0 to 15 do
//    Result := Result + {$IFDEF DELPHI12_UP}string{$ENDIF}(Digits[(Digest[I] shr 4) and $0f] +
//              Digits[Digest[I] and $0f]);
    Result := Result + IntToHex(Ord(Digest[I]), 2);
end;

// 比较两个MD5计算值是否相等
function MD5Match(const D1, D2: TMD5Digest): Boolean;
var
  I: byte;
begin
  I := 0;
  Result := TRUE;
  while Result and (I < 16) do
  begin
    Result := D1[I] = D2[I];
    Inc(I);
  end;
end;

// MD5计算值转 string
function MD5DigestToStr(aDig: TMD5Digest): string;
var
  I: Integer;
begin
  SetLength(Result, 16);
  for I := 1 to 16 do
    Result[Low(Result) + I - 1] := Chr(aDig[I - 1]);
end;

function MD5Stream_BytesKey(const Stream: TStream; const ByteCount: UInt64;
  const HmacKeyBytes: TBytes;
  const BufSize: UInt32 = DefaultMD5BufSize;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TMD5Digest;
begin
  InternalMD5Stream(Stream, ByteCount, BufSize, Result, HmacKeyBytes,
    HmacMode, OnProcessProc, ProcessProc);
end;

// 对指定文件数据进行SHA1转换
function MD5File(const FileName: string;
  const BufSize: UInt32 = DefaultMD5BufSize;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TMD5Digest;
var
  Stream: TStream;
begin
  // 大于 2G 的文件可能 Map 失败，采用流方式循环处理
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := MD5Stream(Stream, 0, DefaultMD5BufSize,
      HmacMode, HmacKey, KeyEncoding, rlNoChange, OnProcessProc, ProcessProc);
  finally
    Stream.Free;
  end;
end;

// 对指定流进行MD5计算
function MD5Stream(const Stream: TStream; const ByteCount: UInt64;
  const BufSize: UInt32 = DefaultMD5BufSize;
  HmacMode: Boolean = False; HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TMD5Digest;
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
  InternalMD5Stream(Stream, ByteCount, BufSize, Result, HmacKeyBytes,
    HmacMode, OnProcessProc, ProcessProc);
end;

function MD5StringToHex(const Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
begin
  Result := MD5Print(MD5String(Value, StrEncoding,
    ValueCRLFMode, HmacMode, HmacKey, KeyEncoding, KeyCRLFMode, OnProcessProc, ProcessProc));
end;

function MD5String(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): TMD5Digest;
var
  InStream: TStringStream;
//  Context: TMD5Context;
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
    Result := MD5Stream(InStream, 0, DefaultMD5BufSize,
      HmacMode, HmacKey, KeyEncoding, KeyCRLFMode, OnProcessProc, ProcessProc);
  finally
    FreeAndNil(InStream);
  end;
end;

end.
