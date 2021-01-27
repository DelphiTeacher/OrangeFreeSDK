unit DES;

interface

uses
  SysUtils, Windows, System.Classes;

// CBC with PKCS
function TripleDESEncrypt(Src, Key, IV: TBytes): TBytes;
function TripleDESDecrypt(Src, Key, IV: TBytes): TBytes;

// CBC with PKCS
function DESEncrypt(Src, Key, IV: TBytes): TBytes;
function DESDecrypt(Src, Key, IV: TBytes): TBytes;

function DESEncryptHEX(StrHEX, KeyHEX, IVHEX: AnsiString): AnsiString;
function DESDecryptHEX(StrHEX, KeyHEX, IVHEX: AnsiString): AnsiString;

function String2Hex(const Buffer: AnsiString): AnsiString;
function Hex2String(const Buffer: AnsiString): AnsiString;

const
  gKEY = '5914060120041025';
  gIV =  '0080010203040506';

implementation

const
  BitIP: array [0 .. 63] of Byte = (57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43,
    35, 27, 19, 11, 3, 61, 53, 45, 37, 29, 21, 13, 5, 63, 55, 47, 39, 31, 23,
    15, 7, 56, 48, 40, 32, 24, 16, 8, 0, 58, 50, 42, 34, 26, 18, 10, 2, 60, 52,
    44, 36, 28, 20, 12, 4, 62, 54, 46, 38, 30, 22, 14, 6);

  BitCP: array [0 .. 63] of Byte = (39, 7, 47, 15, 55, 23, 63, 31, 38, 6, 46,
    14, 54, 22, 62, 30, 37, 5, 45, 13, 53, 21, 61, 29, 36, 4, 44, 12, 52, 20,
    60, 28, 35, 3, 43, 11, 51, 19, 59, 27, 34, 2, 42, 10, 50, 18, 58, 26, 33, 1,
    41, 9, 49, 17, 57, 25, 32, 0, 40, 8, 48, 16, 56, 24);

  BitExp: array [0 .. 47] of Integer = (31, 0, 1, 2, 3, 4, 3, 4, 5, 6, 7, 8, 7,
    8, 9, 10, 11, 12, 11, 12, 13, 14, 15, 16, 15, 16, 17, 18, 19, 20, 19, 20,
    21, 22, 23, 24, 23, 24, 25, 26, 27, 28, 27, 28, 29, 30, 31, 0);

  BitPM: array [0 .. 31] of Byte = (15, 6, 19, 20, 28, 11, 27, 16, 0, 14, 22,
    25, 4, 17, 30, 9, 1, 7, 23, 13, 31, 26, 2, 8, 18, 12, 29, 5, 21, 10, 3, 24);

  sBox: array [0 .. 7] of array [0 .. 63] of Byte = ((14, 4, 13, 1, 2, 15, 11,
    8, 3, 10, 6, 12, 5, 9, 0, 7, 0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5,
    3, 8, 4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0, 15, 12, 8, 2, 4,
    9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13),

    (15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10, 3, 13, 4, 7, 15, 2,
    8, 14, 12, 0, 1, 10, 6, 9, 11, 5, 0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6,
    9, 3, 2, 15, 13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9),

    (10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8, 13, 7, 0, 9, 3, 4, 6,
    10, 2, 8, 5, 14, 12, 11, 15, 1, 13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5,
    10, 14, 7, 1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12),

    (7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15, 13, 8, 11, 5, 6, 15,
    0, 3, 4, 7, 2, 12, 1, 10, 14, 9, 10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14,
    5, 2, 8, 4, 3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14),

    (2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9, 14, 11, 2, 12, 4, 7,
    13, 1, 5, 0, 15, 10, 3, 9, 8, 6, 4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6,
    3, 0, 14, 11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3),

    (12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11, 10, 15, 4, 2, 7, 12,
    9, 5, 6, 1, 13, 14, 0, 11, 3, 8, 9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1,
    13, 11, 6, 4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13),

    (4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1, 13, 0, 11, 7, 4, 9,
    1, 10, 14, 3, 5, 12, 2, 15, 8, 6, 1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8,
    0, 5, 9, 2, 6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12),

    (13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7, 1, 15, 13, 8, 10, 3,
    7, 4, 12, 5, 6, 11, 0, 14, 9, 2, 7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13,
    15, 3, 5, 8, 2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11));

  BitPMC1: array [0 .. 55] of Byte = (56, 48, 40, 32, 24, 16, 8, 0, 57, 49, 41,
    33, 25, 17, 9, 1, 58, 50, 42, 34, 26, 18, 10, 2, 59, 51, 43, 35, 62, 54, 46,
    38, 30, 22, 14, 6, 61, 53, 45, 37, 29, 21, 13, 5, 60, 52, 44, 36, 28, 20,
    12, 4, 27, 19, 11, 3);

  BitPMC2: array [0 .. 47] of Byte = (13, 16, 10, 23, 0, 4, 2, 27, 14, 5, 20, 9,
    22, 18, 11, 3, 25, 7, 15, 6, 26, 19, 12, 1, 40, 51, 30, 36, 46, 54, 29, 39,
    50, 44, 32, 47, 43, 48, 38, 55, 33, 52, 45, 41, 49, 35, 28, 31);

type
  TKeyByte = array [0 .. 5] of Byte;
  TDesMode = (dmEncry, dmDecry);
  TSubKey = array [0 .. 15] of TKeyByte;

procedure InitPermutation(var inData: array of Byte);
var
  newData: array [0 .. 7] of Byte;
  I: Integer;
begin
  FillChar(newData, 8, 0);
  for I := 0 to 63 do
    if (inData[BitIP[I] shr 3] and (1 shl (7 - (BitIP[I] and $07)))) <> 0 then
      newData[I shr 3] := newData[I shr 3] or (1 shl (7 - (I and $07)));
  for I := 0 to 7 do
    inData[I] := newData[I];
end;

procedure ConversePermutation(var inData: array of Byte);
var
  newData: array [0 .. 7] of Byte;
  I: Integer;
begin
  FillChar(newData, 8, 0);
  for I := 0 to 63 do
    if (inData[BitCP[I] shr 3] and (1 shl (7 - (BitCP[I] and $07)))) <> 0 then
      newData[I shr 3] := newData[I shr 3] or (1 shl (7 - (I and $07)));
  for I := 0 to 7 do
    inData[I] := newData[I];
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
  newData: array [0 .. 3] of Byte;
  I: Integer;
begin
  FillChar(newData, 4, 0);
  for I := 0 to 31 do
    if (inData[BitPM[I] shr 3] and (1 shl (7 - (BitPM[I] and $07)))) <> 0 then
      newData[I shr 3] := newData[I shr 3] or (1 shl (7 - (I and $07)));
  for I := 0 to 3 do
    inData[I] := newData[I];
end;

function Si(s, inByte: Byte): Byte;
var
  c: Byte;
begin
  c := (inByte and $20) or ((inByte and $1E) shr 1) or ((inByte and $01) shl 4);
  Result := (sBox[s][c] and $0F);
end;

procedure PermutationChoose1(inData: array of Byte; var outData: array of Byte);
var
  I: Integer;
begin
  FillChar(outData, 7, 0);
  for I := 0 to 55 do
    if (inData[BitPMC1[I] shr 3] and (1 shl (7 - (BitPMC1[I] and $07)))) <> 0
    then
      outData[I shr 3] := outData[I shr 3] or (1 shl (7 - (I and $07)));
end;

procedure PermutationChoose2(inData: array of Byte; var outData: array of Byte);
var
  I: Integer;
begin
  FillChar(outData, 6, 0);
  for I := 0 to 47 do
    if (inData[BitPMC2[I] shr 3] and (1 shl (7 - (BitPMC2[I] and $07)))) <> 0
    then
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
  bitDisplace: array [0 .. 15] of Byte = (1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2,
    2, 2, 2, 1);
var
  outData56: array [0 .. 6] of Byte;
  key28l: array [0 .. 3] of Byte;
  key28r: array [0 .. 3] of Byte;
  key56o: array [0 .. 6] of Byte;
  I: Integer;
begin
  PermutationChoose1(inKey, outData56);
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
    PermutationChoose2(key56o, outKey[I]);
  end;
end;

procedure Encry(inData, aSubKey: array of Byte; var outData: array of Byte);
var
  outBuf: array [0 .. 5] of Byte;
  buf: array [0 .. 7] of Byte;
  I: Integer;
begin
  Expand(inData, outBuf);
  for I := 0 to 5 do
    outBuf[I] := outBuf[I] xor aSubKey[I];
  buf[0] := outBuf[0] shr 2;
  buf[1] := ((outBuf[0] and $03) shl 4) or (outBuf[1] shr 4);
  buf[2] := ((outBuf[1] and $0F) shl 2) or (outBuf[2] shr 6);
  buf[3] := outBuf[2] and $3F;
  buf[4] := outBuf[3] shr 2;
  buf[5] := ((outBuf[3] and $03) shl 4) or (outBuf[4] shr 4);
  buf[6] := ((outBuf[4] and $0F) shl 2) or (outBuf[5] shr 6);
  buf[7] := outBuf[5] and $3F;
  for I := 0 to 7 do
    buf[I] := Si(I, buf[I]);
  for I := 0 to 3 do
    outBuf[I] := (buf[I * 2] shl 4) or buf[I * 2 + 1];
  Permutation(outBuf);
  for I := 0 to 3 do
    outData[I] := outBuf[I];
end;

procedure DesData(desMode: TDesMode; inData: array of Byte;
  var outData: array of Byte; subKey: TSubKey);
var
  I, j: Integer;
  temp, buf: array [0 .. 3] of Byte;
begin
  for I := 0 to 7 do
    outData[I] := inData[I];
  InitPermutation(outData);
  if desMode = dmEncry then
  begin
    for I := 0 to 15 do
    begin
      for j := 0 to 3 do
        temp[j] := outData[j];
      for j := 0 to 3 do
        outData[j] := outData[j + 4];
      Encry(outData, subKey[I], buf);
      for j := 0 to 3 do
        outData[j + 4] := temp[j] xor buf[j];
    end;
    for j := 0 to 3 do
      temp[j] := outData[j + 4];
    for j := 0 to 3 do
      outData[j + 4] := outData[j];
    for j := 0 to 3 do
      outData[j] := temp[j];
  end
  else if desMode = dmDecry then
  begin
    for I := 15 downto 0 do
    begin
      for j := 0 to 3 do
        temp[j] := outData[j];
      for j := 0 to 3 do
        outData[j] := outData[j + 4];
      Encry(outData, subKey[I], buf);
      for j := 0 to 3 do
        outData[j + 4] := temp[j] xor buf[j];
    end;
    for j := 0 to 3 do
      temp[j] := outData[j + 4];
    for j := 0 to 3 do
      outData[j + 4] := outData[j];
    for j := 0 to 3 do
      outData[j] := temp[j];
  end;
  ConversePermutation(outData);
end;

function TripleDESEncrypt(Src, Key, IV: TBytes): TBytes;
var
  KeyByte: array [0 .. 23] of Byte;
  SrcByte, OutByte, IVByte: array [0 .. 7] of Byte;
  I, j: Integer;
  subKey1, subKey2, subKey3: TSubKey;
begin
  FillChar(KeyByte, Length(KeyByte), 0);
  if Length(Key) < Length(KeyByte) then
    Move(Key[0], KeyByte[0], Length(Key))
  else
    Move(Key[0], KeyByte[0], Length(KeyByte));

  FillChar(IVByte, Length(IVByte), 0);
  if Length(IV) < Length(IVByte) then
    Move(IV[0], IVByte[0], Length(IV))
  else
    Move(IV[0], IVByte[0], Length(IVByte));

  if (Length(Src) mod 8) > 0 then
  begin
    // PKCS
    I := Length(Src);
    j := I + 8 - (I mod 8);
    SetLength(Src, j);
    j := j - I;
    FillMemory(@Src[I], j, j);
  end;

  MakeKey(Copy(Key, 0, 8), subKey1);
  MakeKey(Copy(Key, 8, 8), subKey2);
  MakeKey(Copy(Key, 16, 8), subKey3);
  SetLength(Result, 0);
  for I := 0 to Length(Src) div 8 - 1 do
  begin
    Move(Src[I * 8], SrcByte[0], Length(SrcByte));
    for j := 0 to 7 do
    begin
      SrcByte[j] := SrcByte[j] xor IVByte[j];
    end;
    // EDE
    DesData(dmEncry, SrcByte, OutByte, subKey1);
    DesData(dmDecry, OutByte, SrcByte, subKey2);
    DesData(dmEncry, SrcByte, OutByte, subKey3);
    Move(OutByte[0], IVByte[0], Length(SrcByte));
    SetLength(Result, Length(Result) + 8);
    Move(OutByte[0], Result[Length(Result) - 8], Length(OutByte));
  end;

end;

function TripleDESDecrypt(Src, Key, IV: TBytes): TBytes;
var
  KeyByte: array [0 .. 23] of Byte;
  SrcByte, OutByte, IVByte: array [0 .. 7] of Byte;
  I, j: Integer;
  subKey1, subKey2, subKey3: TSubKey;
begin

  if (Length(Src) mod 8) > 0 then
    raise Exception.Create('Error: The Src length must be a multiple of 8');

  FillChar(KeyByte, Length(KeyByte), 0);
  if Length(Key) < Length(KeyByte) then
    Move(Key[0], KeyByte[0], Length(Key))
  else
    Move(Key[0], KeyByte[0], Length(KeyByte));

  FillChar(IVByte, Length(IVByte), 0);
  if Length(IV) < Length(IVByte) then
    Move(IV[0], IVByte[0], Length(IV))
  else
    Move(IV[0], IVByte[0], Length(IVByte));

  MakeKey(Copy(Key, 16, 8), subKey1);
  MakeKey(Copy(Key, 8, 8), subKey2);
  MakeKey(Copy(Key, 0, 8), subKey3);
  SetLength(Result, 0);
  for I := 0 to Length(Src) div 8 - 1 do
  begin
    Move(Src[I * 8], SrcByte[0], Length(SrcByte));
    DesData(dmDecry, SrcByte, OutByte, subKey1);
    DesData(dmEncry, OutByte, SrcByte, subKey2);
    DesData(dmDecry, SrcByte, OutByte, subKey3);
    for j := 0 to 7 do
    begin
      OutByte[j] := OutByte[j] xor IVByte[j];
    end;
    Move(Src[I * 8], IVByte[0], Length(IVByte));
    SetLength(Result, Length(Result) + 8);
    Move(OutByte[0], Result[Length(Result) - 8], Length(OutByte));
  end;

  if Result[Length(Result) - 1] < 8 then
  begin
    // PKCS
    j := Result[Length(Result) - 1];
    SetLength(Src, j);
    FillChar(Src[0], Length(Src), j);
    if CompareMem(@Result[Length(Result) - j], @Src[0], j) then
      SetLength(Result, Length(Result) - j);
  end;

end;

function DESEncrypt(Src, Key, IV: TBytes): TBytes;
var
  SrcByte, OutByte, KeyByte, IVByte: array [0 .. 7] of Byte;
  I, j: Integer;
  subKey: TSubKey;
begin
  FillChar(KeyByte, Length(KeyByte), 0);
  if Length(Key) < Length(KeyByte) then
    Move(Key[0], KeyByte[0], Length(Key))
  else
    Move(Key[0], KeyByte[0], Length(KeyByte));

  FillChar(IVByte, Length(IVByte), 0);
  if Length(IV) < Length(IVByte) then
    Move(IV[0], IVByte[0], Length(IV))
  else
    Move(IV[0], IVByte[0], Length(IVByte));

  I := Length(Src) mod 8;
  if I = 0 then
    I := Length(Src)
  else
    I := Length(Src) + 8 - I;
  SetLength(Src, I);
  MakeKey(Copy(Key, 0, 8), subKey);
  SetLength(Result, 0);
  for I := 0 to Length(Src) div 8 - 1 do
  begin
    Move(Src[I * 8], SrcByte[0], Length(SrcByte));
    for j := 0 to 7 do
    begin
      SrcByte[j] := SrcByte[j] xor IVByte[j];
    end;
    DesData(dmEncry, SrcByte, OutByte, subKey);
    Move(OutByte[0], IVByte[0], Length(SrcByte));
    SetLength(Result, Length(Result) + 8);
    Move(OutByte[0], Result[Length(Result) - 8], Length(OutByte));
  end;
end;

function DESDecrypt(Src, Key, IV: TBytes): TBytes;
var
  SrcByte, OutByte, KeyByte, IVByte: array [0 .. 7] of Byte;
  I, j: Integer;
  subKey: TSubKey;
begin
  FillChar(KeyByte, Length(KeyByte), 0);
  if Length(Key) < Length(KeyByte) then
    Move(Key[0], KeyByte[0], Length(Key))
  else
    Move(Key[0], KeyByte[0], Length(KeyByte));

  FillChar(IVByte, Length(IVByte), 0);
  if Length(IV) < Length(IVByte) then
    Move(IV[0], IVByte[0], Length(IV))
  else
    Move(IV[0], IVByte[0], Length(IVByte));

  I := Length(Src) mod 8;
  if I = 0 then
    I := Length(Src)
  else
    I := Length(Src) + 8 - I;
  SetLength(Src, I);

  MakeKey(KeyByte, subKey);
  SetLength(Result, 0);
  for I := 0 to Length(Src) div 8 - 1 do
  begin
    Move(Src[I * 8], SrcByte[0], Length(SrcByte));
    DesData(dmDecry, SrcByte, OutByte, subKey);
    for j := 0 to 7 do
    begin
      OutByte[j] := OutByte[j] xor IVByte[j];
    end;
    Move(Src[I * 8], IVByte[0], Length(IVByte));
    SetLength(Result, Length(Result) + 8);
    Move(OutByte[0], Result[Length(Result) - 8], Length(OutByte));
  end;
end;

function StringHexToByte(Hex: AnsiString): Byte;
var
  I, Res: Byte;
  ch: Char;
begin
  if Length(Hex) <> 2 then
    raise Exception.Create('Error: not a Complete HEX String');
  Res := 0;
  for I := 0 to 1 do
  begin
    ch := Char(Hex[I + 1]);
    if (ch >= '0') and (ch <= '9') then
      Res := Res * 16 + Ord(ch) - Ord('0')
    else if (ch >= 'A') and (ch <= 'F') then
      Res := Res * 16 + Ord(ch) - Ord('A') + 10
    else if (ch >= 'a') and (ch <= 'f') then
      Res := Res * 16 + Ord(ch) - Ord('a') + 10
    else
      raise Exception.Create('Error: not a HEX String');
  end;
  Result := Res;
end;

function ByteToStringHex(InBytes: Byte): String;
begin
  Result := '1234';
  case InBytes div 16 of
    1:
      Result := '1';
    2:
      Result := '2';
    3:
      Result := '3';
    4:
      Result := '4';
    5:
      Result := '5';
    6:
      Result := '6';
    7:
      Result := '7';
    8:
      Result := '8';
    9:
      Result := '9';
    0:
      Result := '0';
    10:
      Result := 'A';
    11:
      Result := 'B';
    12:
      Result := 'C';
    13:
      Result := 'D';
    14:
      Result := 'E';
    15:
      Result := 'F';
  else
    raise Exception.Create('Error: not a HEX String');
  end;
  case InBytes mod 16 of
    1:
      Result := Result + '1';
    2:
      Result := Result + '2';
    3:
      Result := Result + '3';
    4:
      Result := Result + '4';
    5:
      Result := Result + '5';
    6:
      Result := Result + '6';
    7:
      Result := Result + '7';
    8:
      Result := Result + '8';
    9:
      Result := Result + '9';
    0:
      Result := Result + '0';
    10:
      Result := Result + 'A';
    11:
      Result := Result + 'B';
    12:
      Result := Result + 'C';
    13:
      Result := Result + 'D';
    14:
      Result := Result + 'E';
    15:
      Result := Result + 'F';
  else
    raise Exception.Create('Error: not a HEX String');
  end;
{$IFDEF DEBUG}
  // OutputDebugStringA(PAnsiChar(Str));
{$ENDIF}
end;

function DESEncryptHEX(StrHEX, KeyHEX, IVHEX: AnsiString): AnsiString;
var
  temp: AnsiString;
  I: Integer;
  InputBytes, Key, IV, OutputBytes: TBytes;
begin
  SetLength(InputBytes, Length(StrHEX) div 2);
  for I := 0 to Length(StrHEX) div 2 - 1 do
  begin
    temp := Copy(StrHEX, I * 2 + 1, 2);
    InputBytes[I] := StringHexToByte(temp);
  end;

  SetLength(Key, Length(KeyHEX) div 2);
  for I := 0 to Length(KeyHEX) div 2 - 1 do
  begin
    temp := Copy(KeyHEX, I * 2 + 1, 2);
    Key[I] := StringHexToByte(temp);
  end;

  SetLength(IV, Length(IVHEX) div 2);
  for I := 0 to Length(IVHEX) div 2 - 1 do
  begin
    temp := Copy(IVHEX, I * 2 + 1, 2);
    IV[I] := StringHexToByte(temp);
  end;

  Result := '';
  OutputBytes := TripleDESEncrypt(InputBytes, Key, IV);
  for I := 0 to Length(OutputBytes) - 1 do
  begin
    temp := AnsiString(ByteToStringHex(OutputBytes[I]));
    Result := Result + temp;
  end;
end;

function DESDecryptHEX(StrHEX, KeyHEX, IVHEX: AnsiString): AnsiString;
var
  temp: AnsiString;
  I: Integer;
  InputBytes, Key, IV, OutputBytes: TBytes;
begin
  SetLength(InputBytes, Length(StrHEX) div 2);
  for I := 0 to Length(StrHEX) div 2 - 1 do
  begin
    temp := Copy(StrHEX, I * 2 + 1, 2);
    InputBytes[I] := StringHexToByte(temp);
  end;

  SetLength(Key, Length(KeyHEX) div 2);
  for I := 0 to Length(KeyHEX) div 2 - 1 do
  begin
    temp := Copy(KeyHEX, I * 2 + 1, 2);
    Key[I] := StringHexToByte(temp);
  end;

  SetLength(IV, Length(IVHEX) div 2);
  for I := 0 to Length(IVHEX) div 2 - 1 do
  begin
    temp := Copy(IVHEX, I * 2 + 1, 2);
    IV[I] := StringHexToByte(temp);
  end;

  Result := '';
  OutputBytes := TripleDESDecrypt(InputBytes, Key, IV);
  for I := 0 to Length(OutputBytes) - 1 do
  begin
    temp := AnsiString(ByteToStringHex(OutputBytes[I]));
    Result := Result + temp;
  end;
end;

function String2Hex(const Buffer: AnsiString): AnsiString;
begin
  SetLength(Result, Length(Buffer) * 2);
  BinToHex(PAnsiChar(Buffer), PAnsiChar(Result), Length(Buffer));
end;

function Hex2String(const Buffer: AnsiString): AnsiString;
begin
  SetLength(Result, Length(Buffer) div 2);
  HexToBin(PAnsiChar(Buffer), PAnsiChar(Result), Length(Result));
end;

end.
