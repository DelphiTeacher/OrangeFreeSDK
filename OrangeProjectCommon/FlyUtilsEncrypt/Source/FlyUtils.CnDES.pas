﻿{******************************************************************************}
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
(*　　修改：爱吃猪头肉 & Flying Wang 2015-04-24　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

unit FlyUtils.CnDES;
{* |<PRE>
================================================================================
* 软件名称：开发包基础库
* 单元名称：DES 算法单元
* 单元作者：匿名/佚名
* 备    注：由匿名作者搜集整理而来
* 开发平台：PWin2000Pro + Delphi 5.0
* 兼容测试：PWin9X/2000/XP + Delphi 5/6
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id$
* 修改记录：2008.05.30 V1.0
*               创建单元
*           2015-04-24
*  支持 FMX.
================================================================================
|</PRE>}


//你们可以和原来的版本对比下，看看我到底改了什么。
//白痴们总是觉得 DELPHI 和别的语言不一样。
//但是，使用正确的代码，各种加密解密的结果都是一样的。
// 如果您不喜欢 HEX 格式，您可以 返回 BASE64 格式。
// 在 XE7 上，可以 uses System.NetEncoding
// 调用 System.NetEncoding.Base64.Encode(使用 Tbytes 版本的参数);
//3DES 就是 用 2 个密码，加密 3 次，密码1，密码2，密码1.
//3DES3 就是用 3 个密码，加密 3 次。

interface

//{$I CnPack.inc}

uses
  System.Classes, System.SysUtils, FlyUtils.CnXXX.Common;

//所有的 Encoding 不赋值，默认就是 UTF8。

procedure DESEncryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil);
procedure DESDecryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil);

function DESEncryptStr(Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): TBytes;
{* 传入明文与加密 Key，DES 加密返回密文，
   注：由于密文可能含有扩展 ASCII 字符，因此在 DELPHI 2009 或以上版本中，请用
   TBytes 类型的变量接收返回值，以避免出现多余的 Unicode 转换而导致解密出错
   }

function DESDecryptStr(const Str: TBytes; Key: string; ResultEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
{* 传入密文与加密 Key，DES 解密返回明文}

function DESEncryptStrToHex(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
{* 传入明文与加密 Key，DES 加密返回转换成十六进制的密文}

function DESDecryptStrFromHex(const StrHex, Key: string; ResultEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
{* 传入十六进制的密文与加密 Key，DES 解密返回明文}


implementation

//uses FMX.Dialogs;

function Min(A, B: integer): integer;
begin
  if A < B then
    Result := A
  else
    Result := B;
end;

function DESEncryptStrToHex(const Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
begin
  Result := StrToHex(DESEncryptStr(Value, Key, StrEncoding, KeyEncoding,
    ValueCRLFMode, KeyCRLFMode, OnProcessProc, ProcessProc));
end;

function DESDecryptStrFromHex(const StrHex, Key: string; ResultEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
begin
  Result := DESDecryptStr(HexToStr(StrHex),Key, ResultEncoding, KeyEncoding,
    ResultCRLFMode, KeyCRLFMode, OnProcessProc, ProcessProc);
end;

function DESEncryptStr(Value, Key: string; StrEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): TBytes;
var
  InStream, OutStream: TStringStream;
begin
  if KeyCRLFMode <> rlNoChange then
  begin
    Key := ChangCRLFType(Key, KeyCRLFMode);
  end;
  if ValueCRLFMode <> rlNoChange then
  begin
    Value := ChangCRLFType(Value, ValueCRLFMode);
  end;
  if StrEncoding = nil then
    StrEncoding := TEncoding.UTF8;
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
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
    OutStream := TStringStream.Create('', TEncoding.ANSI, False);
    try
      DESEncryptStream(InStream, OutStream, 0, Key, KeyEncoding,
        (TEncoding.IsStandardEncoding(StrEncoding) and (StrEncoding = TEncoding.Unicode)) or
        (StrEncoding is TUnicodeEncoding and not (StrEncoding is TBigEndianUnicodeEncoding)),
        OnProcessProc, ProcessProc);
//      Result := GetMemory(OutStream.Size + 1);
//      Result[OutStream.Size] := #0;
//      Move(OutStream.Bytes[0], Result[0], OutStream.Size);
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

function DESDecryptStr(const Str: TBytes; Key: string; ResultEncoding: TEncoding = nil;
  KeyEncoding: TEncoding = nil;
  ResultCRLFMode: TCRLFMode = rlCRLF;
  KeyCRLFMode: TCRLFMode = rlCRLF;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
var
  InStream, OutStream: TStringStream;
begin
  if KeyCRLFMode <> rlNoChange then
  begin
    Key := ChangCRLFType(Key, KeyCRLFMode);
  end;
  if ResultEncoding = nil then
    ResultEncoding := TEncoding.UTF8;
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(Str);
  try
    OutStream := TStringStream.Create('', ResultEncoding, False);
    try
      DESDecryptStream(InStream, OutStream, 0, Key, KeyEncoding,
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

const
  BitIP: array[0..63] of Byte =
  (57, 49, 41, 33, 25, 17, 9, 1,
    59, 51, 43, 35, 27, 19, 11, 3,
    61, 53, 45, 37, 29, 21, 13, 5,
    63, 55, 47, 39, 31, 23, 15, 7,
    56, 48, 40, 32, 24, 16, 8, 0,
    58, 50, 42, 34, 26, 18, 10, 2,
    60, 52, 44, 36, 28, 20, 12, 4,
    62, 54, 46, 38, 30, 22, 14, 6);

  BitCP: array[0..63] of Byte =
  (39, 7, 47, 15, 55, 23, 63, 31,
    38, 6, 46, 14, 54, 22, 62, 30,
    37, 5, 45, 13, 53, 21, 61, 29,
    36, 4, 44, 12, 52, 20, 60, 28,
    35, 3, 43, 11, 51, 19, 59, 27,
    34, 2, 42, 10, 50, 18, 58, 26,
    33, 1, 41, 9, 49, 17, 57, 25,
    32, 0, 40, 8, 48, 16, 56, 24);

  BitExp: array[0..47] of Integer =
  (31, 0, 1, 2, 3, 4, 3, 4, 5, 6, 7, 8, 7, 8, 9, 10,
    11, 12, 11, 12, 13, 14, 15, 16, 15, 16, 17, 18, 19, 20, 19, 20,
    21, 22, 23, 24, 23, 24, 25, 26, 27, 28, 27, 28, 29, 30, 31, 0);

  BitPM: array[0..31] of Byte =
  (15, 6, 19, 20, 28, 11, 27, 16, 0, 14, 22, 25, 4, 17, 30, 9,
    1, 7, 23, 13, 31, 26, 2, 8, 18, 12, 29, 5, 21, 10, 3, 24);

  sBox: array[0..7] of array[0..63] of Byte =
  ((14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7,
    0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8,
    4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0,
    15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13),

    (15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10,
    3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5,
    0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15,
    13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9),

    (10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8,
    13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1,
    13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7,
    1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12),

    (7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15,
    13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9,
    10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4,
    3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14),

    (2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9,
    14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6,
    4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14,
    11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3),

    (12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11,
    10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8,
    9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6,
    4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13),

    (4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1,
    13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6,
    1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2,
    6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12),

    (13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7,
    1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2,
    7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8,
    2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11));

  BitPMC1: array[0..55] of Byte =
  (56, 48, 40, 32, 24, 16, 8,
    0, 57, 49, 41, 33, 25, 17,
    9, 1, 58, 50, 42, 34, 26,
    18, 10, 2, 59, 51, 43, 35,
    62, 54, 46, 38, 30, 22, 14,
    6, 61, 53, 45, 37, 29, 21,
    13, 5, 60, 52, 44, 36, 28,
    20, 12, 4, 27, 19, 11, 3);

  BitPMC2: array[0..47] of Byte =
  (13, 16, 10, 23, 0, 4,
    2, 27, 14, 5, 20, 9,
    22, 18, 11, 3, 25, 7,
    15, 6, 26, 19, 12, 1,
    40, 51, 30, 36, 46, 54,
    29, 39, 50, 44, 32, 47,
    43, 48, 38, 55, 33, 52,
    45, 41, 49, 35, 28, 31);

type
  TKeyByte = array[0..5] of Byte;
  TDesMode = (dmEncry, dmDecry);

var
  subKey: array[0..15] of TKeyByte;
  {
procedure InitPermutation(var inData: array of Byte);
procedure ConversePermutation(var inData: array of Byte);
procedure Expand(inData: array of Byte; var outData: array of Byte);
procedure Permutation(var inData: array of Byte);
function Si(s, inByte: Byte): Byte;
procedure PermutationChoose1(inData: array of Byte; var outData: array of Byte);
procedure PermutationChoose2(inData: array of Byte; var outData: array of Byte);
procedure CycleMove(var inData: array of Byte; bitMove: Byte);
procedure MakeKey(inKey: array of Byte; var outKey: array of TKeyByte);
procedure Encry(inData, subKey: array of Byte; var outData: array of Byte);
procedure DesData(desMode: TDesMode; inData: array of Byte; var outData: array
    of Byte);
function HexToInt(Hex: string): Integer; }

procedure InitPermutation(var inData: array of Byte);
var
  newData: array[0..7] of Byte;
  I: Integer;
begin
  FillChar(newData, 8, 0);
  for I := 0 to 63 do
    if (inData[BitIP[I] shr 3] and (1 shl (7 - (BitIP[I] and $07)))) <> 0 then
      newData[I shr 3] := newData[I shr 3] or (1 shl (7 - (I and $07)));
  for I := 0 to 7 do inData[I] := newData[I];
end;

procedure ConversePermutation(var inData: array of Byte);
var
  newData: array[0..7] of Byte;
  I: Integer;
begin
  FillChar(newData, 8, 0);
  for I := 0 to 63 do
    if (inData[BitCP[I] shr 3] and (1 shl (7 - (BitCP[I] and $07)))) <> 0 then
      newData[I shr 3] := newData[I shr 3] or (1 shl (7 - (I and $07)));
  for I := 0 to 7 do inData[I] := newData[I];
end;

procedure Expand(inData: array of Byte; var outData: array of Byte);
var
  I: Integer;
begin
  FillChar(outData, 6, 0);
  for I := 0 to 47 do
    if (inData[BitExp[I] shr 3] and (1 shl (7 - (BitExp[I] and $07)))) <> 0 then
      outData[I shr 3] := outData[I shr 3] or (1 shl (7 - (I and $07)));
end;

procedure Permutation(var inData: array of Byte);
var
  newData: array[0..3] of Byte;
  I: Integer;
begin
  FillChar(newData, 4, 0);
  for I := 0 to 31 do
    if (inData[BitPM[I] shr 3] and (1 shl (7 - (BitPM[I] and $07)))) <> 0 then
      newData[I shr 3] := newData[I shr 3] or (1 shl (7 - (I and $07)));
  for I := 0 to 3 do inData[I] := newData[I];
end;

function Si(s, inByte: Byte): Byte;
var
  c: Byte;
begin
  c := (inByte and $20) or ((inByte and $1E) shr 1) or
    ((inByte and $01) shl 4);
  Result := (sBox[s][c] and $0F);
end;

procedure PermutationChoose1(inData: array of Byte; var outData: array of Byte);
var
  I: Integer;
begin
  FillChar(outData, 7, 0);
  for I := 0 to 55 do
    if (inData[BitPMC1[I] shr 3] and (1 shl (7 - (BitPMC1[I] and $07)))) <> 0 then
      outData[I shr 3] := outData[I shr 3] or (1 shl (7 - (I and $07)));
end;

procedure PermutationChoose2(inData: array of Byte; var outData: array of Byte);
var
  I: Integer;
begin
  FillChar(outData, 6, 0);
  for I := 0 to 47 do
    if (inData[BitPMC2[I] shr 3] and (1 shl (7 - (BitPMC2[I] and $07)))) <> 0 then
      outData[I shr 3] := outData[I shr 3] or (1 shl (7 - (I and $07)));
end;

procedure cycleMove(var inData: array of Byte; bitMove: Byte);
var
  I: Integer;
begin
  for I := 0 to bitMove - 1 do
  begin
    inData[0] := (inData[0] shl 1) or (inData[1] shr 7);
    inData[1] := (inData[1] shl 1) or (inData[2] shr 7);
    inData[2] := (inData[2] shl 1) or (inData[3] shr 7);
    inData[3] := (inData[3] shl 1) or ((inData[0] and $10) shr 4);
    inData[0] := (inData[0] and $0F);
  end;
end;

procedure MakeKey(inKey: array of Byte; var outKey: array of TKeyByte);
const
  bitDisplace: array[0..15] of Byte =
  (1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1);
var
  outData56: array[0..6] of Byte;
  key28l: array[0..3] of Byte;
  key28r: array[0..3] of Byte;
  key56o: array[0..6] of Byte;
  I: Integer;
begin
  permutationChoose1(inKey, outData56);
  key28l[0] := outData56[0] shr 4;
  key28l[1] := (outData56[0] shl 4) or (outData56[1] shr 4);
  key28l[2] := (outData56[1] shl 4) or (outData56[2] shr 4);
  key28l[3] := (outData56[2] shl 4) or (outData56[3] shr 4);
  key28r[0] := outData56[3] and $0F;
  key28r[1] := outData56[4];
  key28r[2] := outData56[5];
  key28r[3] := outData56[6];
  for I := 0 to 15 do
  begin
    cycleMove(key28l, bitDisplace[I]);
    cycleMove(key28r, bitDisplace[I]);
    key56o[0] := (key28l[0] shl 4) or (key28l[1] shr 4);
    key56o[1] := (key28l[1] shl 4) or (key28l[2] shr 4);
    key56o[2] := (key28l[2] shl 4) or (key28l[3] shr 4);
    key56o[3] := (key28l[3] shl 4) or (key28r[0]);
    key56o[4] := key28r[1];
    key56o[5] := key28r[2];
    key56o[6] := key28r[3];
    permutationChoose2(key56o, outKey[I]);
  end;
end;

procedure Encry(inData, subKey: array of Byte; var outData: array of Byte);
var
  outBuf: array[0..5] of Byte;
  buf: array[0..7] of Byte;
  I: Integer;
begin
  expand(inData, outBuf);
  for I := 0 to 5 do outBuf[I] := outBuf[I] xor subKey[I];
  buf[0] := outBuf[0] shr 2;
  buf[1] := ((outBuf[0] and $03) shl 4) or (outBuf[1] shr 4);
  buf[2] := ((outBuf[1] and $0F) shl 2) or (outBuf[2] shr 6);
  buf[3] := outBuf[2] and $3F;
  buf[4] := outBuf[3] shr 2;
  buf[5] := ((outBuf[3] and $03) shl 4) or (outBuf[4] shr 4);
  buf[6] := ((outBuf[4] and $0F) shl 2) or (outBuf[5] shr 6);
  buf[7] := outBuf[5] and $3F;
  for I := 0 to 7 do buf[I] := si(I, buf[I]);
  for I := 0 to 3 do outBuf[I] := (buf[I * 2] shl 4) or buf[I * 2 + 1];
  permutation(outBuf);
  for I := 0 to 3 do outData[I] := outBuf[I];
end;

procedure DesData(desMode: TDesMode; inData: array of Byte; var outData: array
    of Byte);
var
  I, j: Integer;
  temp, buf: array[0..3] of Byte;
begin
  for I := 0 to 7 do outData[I] := inData[I];
  initPermutation(outData);
  if desMode = dmEncry then
  begin
    for I := 0 to 15 do
    begin
      for j := 0 to 3 do temp[j] := outData[j];
      for j := 0 to 3 do outData[j] := outData[j + 4];
      encry(outData, subKey[I], buf);
      for j := 0 to 3 do outData[j + 4] := temp[j] xor buf[j];
    end;
    for j := 0 to 3 do temp[j] := outData[j + 4];
    for j := 0 to 3 do outData[j + 4] := outData[j];
    for j := 0 to 3 do outData[j] := temp[j];
  end
  else if desMode = dmDecry then
  begin
    for I := 15 downto 0 do
    begin
      for j := 0 to 3 do temp[j] := outData[j];
      for j := 0 to 3 do outData[j] := outData[j + 4];
      encry(outData, subKey[I], buf);
      for j := 0 to 3 do outData[j + 4] := temp[j] xor buf[j];
    end;
    for j := 0 to 3 do temp[j] := outData[j + 4];
    for j := 0 to 3 do outData[j + 4] := outData[j];
    for j := 0 to 3 do outData[j] := temp[j];
  end;
  conversePermutation(outData);
end;

procedure DESEncryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil);
var
  KeyBytes: TBytes;
  StrByte, OutByte, KeyByte: array[0..7] of Byte;
  Count,
  ProcMin, ProcMax, CurrDone: UInt64;
  I, j: Integer;
  Cancel: Boolean;
begin
  if InStream= nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream= nil then
    raise Exception.Create('Error: OutStream is nil.');
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  Cancel := False;
//  Count := InStream.Size - InStream.Position;
  if ByteCount = 0 then
  begin
    InStream.Position := 0;
    Count := InStream.Size;
  end
  else Count := Min(ByteCount, InStream.Size - InStream.Position);
  ProcMin := 0;
  ProcMax := ((Count - 1) div 8) + 3;
  CurrDone := 0;
  Cancel := False;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
  KeyBytes := KeyEncoding.GetBytes(Key);
  j := Length(KeyBytes);
  FillChar(KeyByte[0], 8, 0);
  if j > 8 then j := 8;  
  Move(KeyBytes[0], KeyByte[0], j);
  CurrDone := 1;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
  makeKey(KeyByte, subKey);
  CurrDone := 2;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
  for I := 0 to (Count - 1) div 8 do
  begin
    for j := 0 to 7 do
    begin
      StrByte[j] := 0;
      if InStream.Position < InStream.Size then
        InStream.Read(StrByte[j], 1);
    end;
    desData(dmEncry, StrByte, OutByte);
    for j := 0 to 7 do
      OutStream.Write(OutByte[j], 1);
    if Assigned(OnProcessProc) then
      OnProcessProc(nil, ProcMin, ProcMax, I + 3, Cancel);
    if Assigned(ProcessProc) then
      ProcessProc(ProcMin, ProcMax, I + 3, Cancel);
    if Cancel then exit;
  end;
end;

procedure DESDecryptStream(const InStream, OutStream: TStream; const ByteCount: UInt64;
  const Key: string; KeyEncoding: TEncoding = nil;
  UniocdeLEMode: Boolean = False;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil);
var
  KeyBytes: TBytes;
  StrByte, OutByte, KeyByte: array[0..7] of Byte;
  Count,
  ProcMin, ProcMax, CurrDone: UInt64;
  I, J, K: Integer;
  Cancel: Boolean;
begin
  if InStream= nil then
    raise Exception.Create('Error: InStream is nil.');
  if OutStream= nil then
    raise Exception.Create('Error: OutStream is nil.');
  if KeyEncoding = nil then
    KeyEncoding := TEncoding.UTF8;
  Cancel := False;
//  Count := InStream.Size - InStream.Position;
  if ByteCount = 0 then
  begin
    InStream.Position := 0;
    Count := InStream.Size;
  end
  else Count := Min(ByteCount, InStream.Size - InStream.Position);
  ProcMin := 0;
  ProcMax := ((Count - 1) div 8) + 2;
  CurrDone := 0;
  Cancel := False;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
  KeyBytes := KeyEncoding.GetBytes(Key);
  j := Length(KeyBytes);
  FillChar(KeyByte[0], 8, 0);
  if j > 8 then j := 8;
  Move(KeyBytes[0], KeyByte[0], j);
  CurrDone := 1;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
  makeKey(KeyByte, subKey);
  CurrDone := 2;
  if Assigned(OnProcessProc) then
    OnProcessProc(nil, ProcMin, ProcMax, CurrDone, Cancel);
  if Assigned(ProcessProc) then
    ProcessProc(ProcMin, ProcMax, CurrDone, Cancel);
  if Cancel then exit;
  for I := 0 to (Count - 1) div 8 do
  begin
    for j := 0 to 7 do
    begin
      StrByte[j] := 0;
      if InStream.Position < InStream.Size then
        InStream.Read(StrByte[j], 1);
    end;
    desData(dmDecry, StrByte, OutByte);
    K := 8;
    if (I = ((Count - 1) div 8)) then
    begin
//bug report by [珠海]LEO(1505250187) 
        for J := 7 downto 0 do
        begin
          if OutByte[J] <> 0 then
          begin
            K := J + 1;
            break;
          end;
        end;
    end;
    if K > 0 then
    begin
//bug report by [宁波]小卢(54927313
      if UniocdeLEMode and (K mod 2 = 1) then
        inc(K);
      OutStream.Write(OutByte, K);
    end;
    if Assigned(OnProcessProc) then
      OnProcessProc(nil, ProcMin, ProcMax, I + 3, Cancel);
    if Assigned(ProcessProc) then
      ProcessProc(ProcMin, ProcMax, I + 3, Cancel);
    if Cancel then exit;
  end;
end;

end.
