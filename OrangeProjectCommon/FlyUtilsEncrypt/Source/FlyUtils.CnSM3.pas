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

unit FlyUtils.CnSM3;
{* |<PRE>
================================================================================
* 软件名称：开发包基础库
* 单元名称：国产散列算法SM3单元
* 单元作者：刘啸（liuxiao@cnpack.org)
* 备    注：参考国密算法公开文档《SM3 Cryptographic Hash Algorith》
*           http://www.oscca.gov.cn/UpFile/20101222141857786.pdf
*           并参考移植goldboar的C代码
* 开发平台：Windows 7 + Delphi 5.0
* 兼容测试：PWin9X/2000/XP/7 + Delphi 5/6
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id$
* 修改记录：2014.09.23 V1.0
*               移植并创建单元
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

uses
  System.Classes, System.SysUtils, FlyUtils.CnXXX.Common;

const
  DefaultSM3BufSize = 32;

var
  BufSizeForString: UInt32 = DefaultSM3BufSize;

type
  TMD3Count = array[0..1] of UInt32;
  TMD3State = array[0..8] of UInt32;
  TMD3Buffer = array[0..63] of byte;

type
  TSM3Context = record
    Total: TMD3Count;     {!< number of bytes processed  }
    State: TMD3State;     {!< intermediate digest state  }
    Buffer: TMD3Buffer;    {!< data block being processed }
    Ipad: array[0..HmacPadLen - 1] of byte;      {!< HMAC: inner padding        }
    Opad: array[0..HmacPadLen - 1] of byte;      {!< HMAC: outer padding        }
  end;
  PSM3Context = ^TSM3Context;

  TSM3Digest = array[0..31] of Byte;

procedure SM3Start(var Ctx: TSM3Context);

procedure SM3Update(var Ctx: TSM3Context; const Input: array of Byte; BufLen: UInt32);

procedure SM3Finish(var Ctx: TSM3Context; var Output: TSM3Digest);

function SM3(const Input: TBytes; BufLen: UInt32): TSM3Digest;
{* 对数据块进行 SM3 计算
 |<PRE>
   Input: TBytes  - 要计算的数据块
   BufLen: UInt32  - 数据块长度
 |</PRE>}

procedure SM3HmacStarts(var Ctx: TSM3Context; const Key: TBytes; KeyLength: Integer);

procedure SM3HmacUpdate(var Ctx: TSM3Context; const Input: array of Byte; BufLen: UInt32);

procedure SM3HmacFinish(var Ctx: TSM3Context; var Output: TSM3Digest);

procedure SM3Hmac(const Key: TBytes; KeyLength: Integer; const Input: TBytes;
  BufLen: UInt32; var Output: TSM3Digest);
{* Hash-based Message Authentication Code (based on SM3) }

function SM3Print(const Digest: TSM3Digest): string;
{* 以十六进制格式输出 SM3 计算值
 |<PRE>
   Digest: TSM3Digest  - 指定的 SM3 计算值
 |</PRE>}

function SM3Match(const D1, D2: TSM3Digest): Boolean;
{* 比较两个SM3计算值是否相等
 |<PRE>
   D1: TSM3Digest   - 需要比较的SM3计算值
   D2: TSM3Digest   - 需要比较的SM3计算值
 |</PRE>}

function SM3DigestToStr(aDig: TSM3Digest): string;
{* SM3计算值转 string
 |<PRE>
   aDig: TSM3Digest   - 需要转换的SM3计算值
 |</PRE>}


 //所有的 Encoding 不赋值，默认就是 UTF8。

function SM3Stream_BytesKey(const Stream: TStream; const ByteCount: UInt64;
  HmacKeyBytes: TBytes;
  const BufSize: UInt32 = DefaultSM3BufSize;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSM3Digest;

function SM3Stream(const Stream: TStream; const ByteCount: UInt64;
  const BufSize: UInt32 = DefaultSM3BufSize;
  HmacMode: Boolean = False; HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSM3Digest;
{* 对指定流数据进行SM3转换
 |<PRE>
   Stream: TStream  - 要计算的流内容
   CallBack: TSM3CalcProgressFunc - 进度回调函数，默认为空
 |</PRE>}

function SM3File(const FileName: string;
  const BufSize: UInt32 = DefaultSM3BufSize;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSM3Digest;
{* 对指定文件数据进行SM3转换
 |<PRE>
   FileName: string  - 要计算的文件名
   CallBack: TSM3CalcProgressFunc - 进度回调函数，默认为空
 |</PRE>}

function SM3String(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): TSM3Digest;
{* 传入明文与加密 Key，SM3 加密返回密文，
   注：由于密文可能含有扩展 ASCII 字符，因此在 DELPHI 2009 或以上版本中，请用
   TBytes 类型的变量接收返回值，以避免出现多余的 Unicode 转换而导致解密出错
   }

function SM3StringToHex(const Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
{ * 传入明文与加密 Key，SM3 加密返回转换成十六进制的密文 }

implementation

//uses FMX.Dialogs;

procedure GetULongBe(var N: UInt32; B: array of Byte; I: Integer);
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

function FF0(X, Y, Z: UInt32): UInt32;
begin
  Result := X xor Y xor Z;
end;

function FF1(X, Y, Z: UInt32): UInt32;
begin
  Result := (X and Y) or (Y and Z) or (X and Z);
end;

function GG0(X, Y, Z: UInt32): UInt32;
begin
  Result := X xor Y xor Z;
end;

function GG1(X, Y, Z: UInt32): UInt32;
begin
  Result := (X and Y) or ((not X) and Z);
end;

function SM3Shl(X: UInt32; N: Integer): UInt32;
begin
  Result := (X and $FFFFFFFF) shl N;
end;

function ROTL(X: UInt32; N: Integer): UInt32;
begin
  Result := SM3Shl(X, N) or (X shr (32 - N));
end;

function P0(X: UInt32): UInt32;
begin
  Result := X xor ROTL(X, 9) xor ROTL(X, 17);
end;

function P1(X: UInt32): UInt32;
begin
  Result := X xor ROTL(X, 15) xor ROTL(X, 23);
end;

procedure SM3StartAndClear(var Ctx: TSM3Context);
begin
  FillChar(Ctx.Buffer, SizeOf(Ctx.Buffer), 0);
  FillChar(Ctx.Ipad, SizeOf(Ctx.Ipad), 0);
  FillChar(Ctx.Opad, SizeOf(Ctx.Opad), 0);
  SM3Start(Ctx);
end;

procedure SM3Start(var Ctx: TSM3Context);
begin
  Ctx.Total[0] := 0;
  Ctx.Total[1] := 0;

  Ctx.State[0] := $7380166F;
  Ctx.State[1] := $4914B2B9;
  Ctx.State[2] := $172442D7;
  Ctx.State[3] := $DA8A0600;
  Ctx.State[4] := $A96F30BC;
  Ctx.State[5] := $163138AA;
  Ctx.State[6] := $E38DEE4D;
  Ctx.State[7] := $B0FB0E4E;
end;

// 一次处理 64byte 也就是512bit 数据块
procedure SM3Process(var Ctx: TSM3Context; Data: array of Byte; InputIndex: Integer);
var
  SS1, SS2, TT1, TT2: UInt32;
  W: array[0..67] of UInt32;
  W1: array[0..63] of UInt32;
  T: array[0..63] of UInt32;
  A, B, C, D, E, F, G, H: UInt32;
  Temp1, Temp2, Temp3, Temp4, Temp5: UInt32;
  J: Integer;
begin
  for J := 0 to 15 do
    T[J] := $79CC4519;
  for J := 16 to 63 do
    T[J] := $7A879D8A;
  if InputIndex < 0 then InputIndex := 0;

  GetULongBe(W[ 0], Data,  0 + InputIndex);
  GetULongBe(W[ 1], Data,  4 + InputIndex);
  GetULongBe(W[ 2], Data,  8 + InputIndex);
  GetULongBe(W[ 3], Data, 12 + InputIndex);
  GetULongBe(W[ 4], Data, 16 + InputIndex);
  GetULongBe(W[ 5], Data, 20 + InputIndex);
  GetULongBe(W[ 6], Data, 24 + InputIndex);
  GetULongBe(W[ 7], Data, 28 + InputIndex);
  GetULongBe(W[ 8], Data, 32 + InputIndex);
  GetULongBe(W[ 9], Data, 36 + InputIndex);
  GetULongBe(W[10], Data, 40 + InputIndex);
  GetULongBe(W[11], Data, 44 + InputIndex);
  GetULongBe(W[12], Data, 48 + InputIndex);
  GetULongBe(W[13], Data, 52 + InputIndex);
  GetULongBe(W[14], Data, 56 + InputIndex);
  GetULongBe(W[15], Data, 60 + InputIndex);

  for J := 16 to 67 do
  begin
    Temp1 := W[J - 16] xor W[J - 9];
    Temp2 := ROTL(W[J - 3], 15);
    Temp3 := Temp1 xor Temp2;
    Temp4 := P1(Temp3);
    Temp5 := ROTL(W[J - 13],7 ) xor W[J - 6];
    W[J] := Temp4 xor Temp5;
  end;

  for J := 0 to 63 do
    W1[J] := W[J] xor W[J + 4];

  // 已经处理好俩数组W/W1的值。

  A := Ctx.State[0];
  B := Ctx.State[1];
  C := Ctx.State[2];
  D := Ctx.State[3];
  E := Ctx.State[4];
  F := Ctx.State[5];
  G := Ctx.State[6];
  H := Ctx.State[7];

  for J := 0 to 15 do
  begin
    SS1 := ROTL((ROTL(A, 12) + E + ROTL(T[J], J)), 7);
    SS2 := SS1 xor ROTL(A, 12);
    TT1 := FF0(A, B, C) + D + SS2 + W1[J];
    TT2 := GG0(E, F, G) + H + SS1 + W[J];
    D := C;
    C := ROTL(B, 9);
    B := A;
    A := TT1;
    H := G;
    G := ROTL(F, 19);
    F := E;
    E := P0(TT2);
  end;

  for J := 16 to 63 do
  begin
    SS1 := ROTL((ROTL(A, 12) + E + ROTL(T[J], J)), 7);
    SS2 := SS1 xor ROTL(A, 12);
    TT1 := FF1(A, B, C) + D + SS2 + W1[J];
    TT2 := GG1(E, F, G) + H + SS1 + W[J];
    D := C;
    C := ROTL(B,9);
    B := A;
    A := TT1;
    H := G;
    G := ROTL(F,19);
    F := E;
    E := P0(TT2);
  end;

  Ctx.State[0] := Ctx.State[0] xor A;
  Ctx.State[1] := Ctx.State[1] xor B;
  Ctx.State[2] := Ctx.State[2] xor C;
  Ctx.State[3] := Ctx.State[3] xor D;
  Ctx.State[4] := Ctx.State[4] xor E;
  Ctx.State[5] := Ctx.State[5] xor F;
  Ctx.State[6] := Ctx.State[6] xor G;
  Ctx.State[7] := Ctx.State[7] xor H;

  // 本轮无误
end;

procedure SM3Update(var Ctx: TSM3Context; const Input: array of Byte; BufLen: UInt32);
var
  InputIndex,
  Fill, Left: UInt32;
begin
  if BufLen <= 0 then
    Exit;


  Left := Ctx.Total[0] and $3F;
  Fill := 64 - Left;

  Ctx.Total[0] := Ctx.Total[0] + BufLen;
  Ctx.Total[0] := Ctx.Total[0] and $FFFFFFFF;

  if Ctx.Total[0] < UInt32(BufLen) then
    Ctx.Total[1] := Ctx.Total[1] + 1;

  InputIndex := 0;
  if (Left <> 0) and (BufLen >= Fill) then
  begin
    Move(Input[InputIndex], Ctx.Buffer[Left], Fill);
    SM3Process(Ctx, Ctx.Buffer, 0);
    InputIndex := InputIndex + Fill;
    BufLen := BufLen - Fill;
    Left := 0;
  end;

  Fill := 64;
  while BufLen >= 64 do
  begin
    SM3Process(Ctx, Input, InputIndex);
    InputIndex := InputIndex + Fill;
    BufLen := BufLen - Fill;
  end;

  if BufLen > 0 then
    Move(Input[InputIndex], Ctx.Buffer[Left], BufLen);
end;

const
  SM3Padding: array[0..63] of Byte =
    (
      $80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    );

procedure SM3Finish(var Ctx: TSM3Context; var Output: TSM3Digest);
var
  Last, Padn: UInt32;
  High, Low: UInt32;
  MsgLen: array[0..7] of Byte;
begin
  High := (Ctx.Total[0] shr 29) or (Ctx.Total[1] shl 3);
  Low := Ctx.Total[0] shl 3;

  PutULongBe(High, MsgLen, 0);
  PutULongBe(Low, MsgLen, 4);

  Last := Ctx.Total[0] and $3F;
  if Last < 56 then
    Padn := 56 - Last
  else
    Padn := 120 - Last;

  SM3Update(Ctx, SM3Padding, Padn);
  SM3Update(Ctx, MsgLen, 8);

  PutULongBe( Ctx.State[0], Output,  0 );
  PutULongBe( Ctx.State[1], Output,  4 );
  PutULongBe( Ctx.State[2], Output,  8 );
  PutULongBe( Ctx.State[3], Output, 12 );
  PutULongBe( Ctx.State[4], Output, 16 );
  PutULongBe( Ctx.State[5], Output, 20 );
  PutULongBe( Ctx.State[6], Output, 24 );
  PutULongBe( Ctx.State[7], Output, 28 );
end;

function SM3(const Input: TBytes; BufLen: UInt32): TSM3Digest;
var
  Ctx: TSM3Context;
begin
  SM3StartAndClear(Ctx);
  SM3Update(Ctx, Input, BufLen);
  SM3Finish(Ctx, Result);
end;

procedure SM3HmacStarts(var Ctx: TSM3Context; const Key: TBytes; KeyLength: Integer);
var
  I: Integer;
  Sum: TSM3Digest;
begin
  if KeyLength > HmacPadLen then
  begin
    Sum := SM3(Key, KeyLength);
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

  SM3Start(Ctx);
  SM3Update(Ctx, Ctx.Ipad, HmacPadLen);
end;

procedure SM3HmacUpdate(var Ctx: TSM3Context; const Input: array of Byte; BufLen: UInt32);
begin
  SM3Update(Ctx, Input, BufLen);
end;

procedure SM3HmacFinish(var Ctx: TSM3Context; var Output: TSM3Digest);
var
  Len: Integer;
  TmpBuf: TSM3Digest;
begin
  Len := Sizeof(TmpBuf);
  SM3Finish(Ctx, TmpBuf);
  SM3Start(Ctx);
  SM3Update(Ctx, Ctx.Opad, HmacPadLen);
  SM3Update(Ctx, TmpBuf, Len);
  SM3Finish(Ctx, Output);
end;

procedure SM3Hmac(const Key: TBytes; KeyLength: Integer; const Input: TBytes;
  BufLen: UInt32; var Output: TSM3Digest);
var
  Ctx: TSM3Context;
begin
  SM3HmacStarts(Ctx, Key, KeyLength);
  SM3HmacUpdate(Ctx, Input, BufLen);
  SM3HmacFinish(Ctx, Output);
end;


function InternalSM3Stream(const Stream: TStream; const ByteCount: UInt64; const BufSize: UInt32;
  var D: TSM3Digest; HmacKeyBytes: TBytes;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): Boolean;
var
  Context: TSM3Context;
  Buf: TBytes;
  BufLen: FixedUInt;
  Size: Int64;
  ReadBytes: FixedUInt;
  TotalBytes: Int64;
  //SavePos: Int64;
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
      SM3HmacStarts(Context, HmacKeyBytes, Length(HmacKeyBytes))
    else
      SM3StartAndClear(Context);
    SM3Update(Context, [], 0);
    SM3Finish(Context, D);
    exit;
  end;
  if Size < BufSize then BufLen := Size
  else BufLen := BufSize;

  CancelCalc := False;
  if HmacMode then
    SM3HmacStarts(Context, HmacKeyBytes, Length(HmacKeyBytes))
  else
    SM3StartAndClear(Context);
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
          SM3HmacUpdate(Context, Buf, ReadBytes)
        else
          SM3Update(Context, Buf, ReadBytes);
        if Assigned(OnProcessProc) then
          OnProcessProc(nil, 0, Size, TotalBytes, CancelCalc);
        if Assigned(ProcessProc) then
          ProcessProc(0, Size, TotalBytes, CancelCalc);
        if CancelCalc then Exit;
      end;
    until (ReadBytes = 0) or (TotalBytes = Size);
    if HmacMode then
      SM3HmacFinish(Context, D)
    else
      SM3Finish(Context, D);
    Result := True;
  finally
    SetLength(Buf, 0);
    //Stream.Position := SavePos;
  end;
end;

//----------------------------------------------------------------
// 用户API函数实现
//----------------------------------------------------------------

// 对指定文件数据进行SM3转换
function SM3File(const FileName: string;
  const BufSize: UInt32 = DefaultSM3BufSize;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSM3Digest;
var
  Stream: TStream;
begin
  // 大于 2G 的文件可能 Map 失败，采用流方式循环处理
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := SM3Stream(Stream, 0, DefaultSM3BufSize,
      HmacMode, HmacKey, KeyEncoding, rlNoChange, OnProcessProc, ProcessProc);
  finally
    Stream.Free;
  end;
end;

function SM3Stream_BytesKey(const Stream: TStream; const ByteCount: UInt64;
  HmacKeyBytes: TBytes;
  const BufSize: UInt32 = DefaultSM3BufSize;
  HmacMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSM3Digest;
begin
  InternalSM3Stream(Stream, ByteCount, BufSize, Result, HmacKeyBytes,
    HmacMode, OnProcessProc, ProcessProc);
end;

// 对指定流进行SM3计算
function SM3Stream(const Stream: TStream; const ByteCount: UInt64;
  const BufSize: UInt32 = DefaultSM3BufSize;
  HmacMode: Boolean = False; HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): TSM3Digest;
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
  InternalSM3Stream(Stream, ByteCount, BufSize, Result, HmacKeyBytes,
    HmacMode, OnProcessProc, ProcessProc);
end;

// 以十六进制格式输出SM3计算值
function SM3Print(const Digest: TSM3Digest): string;
var
  I: byte;
const
  Digits: array[0..15] of Char = ('0', '1', '2', '3', '4', '5', '6', '7',
                                  '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
begin
  Result := '';
  for I := 0 to 31 do
//    Result := Result + {$IFDEF DELPHI12_UP}string{$ENDIF}(Digits[(Digest[I] shr 4) and $0f] +
//              Digits[Digest[I] and $0f]);
    Result := Result + IntToHex(Ord(Digest[I]), 2);
end;

// 比较两个SM3计算值是否相等
function SM3Match(const D1, D2: TSM3Digest): Boolean;
var
  I: byte;
begin
  I := 0;
  Result := TRUE;
  while Result and (I < 32) do
  begin
    Result := D1[I] = D2[I];
    Inc(I);
  end;
end;

// SM3计算值转 string
function SM3DigestToStr(aDig: TSM3Digest): string;
var
  I: Integer;
begin
  SetLength(Result, 32);
  for I := 1 to 32 do
    Result[Low(Result) + I - 1] := Chr(aDig[I - 1]);
end;

function SM3StringToHex(const Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
begin
  Result := SM3Print(SM3String(Value, StrEncoding,
    ValueCRLFMode, HmacMode, HmacKey, KeyEncoding, KeyCRLFMode, OnProcessProc, ProcessProc));
end;

function SM3String(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  HmacMode: Boolean = False; const HmacKey: string = ''; KeyEncoding: TEncoding = nil;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): TSM3Digest;
var
//  TestByte: Byte;
  InStream: TStringStream;
//  Context: TSM3Context;
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
    Result := SM3Stream(InStream, 0, DefaultSM3BufSize,
      HmacMode, HmacKey, KeyEncoding, KeyCRLFMode, OnProcessProc, ProcessProc);
  finally
    FreeAndNil(InStream);
  end;
end;


end.
