{******************************************************************}
{          MD5 Hashsum Evaluation Unit For Borland Delphi          }
{                                                                  }
{          Copyright ? 2002 by Dimka Maslov                        }
{          E-mail:   mail@endimus.com,                             }
{          Web-site: http://www.endimus.com                        }
{                                                                  }
{         Derived from the RSA Data Security, Inc.                 }
{         MD5 Message-Digest Algorithm described in RFC 1321       }
{         http://www.faqs.org/rfcs/rfc1321.html                    }
{******************************************************************}


unit MD5_D7;


interface


uses Windows, SysUtils, Classes;

type
  UTF8String = AnsiString;

  function AnsiToWide(const S: AnsiString): WideString;
  function WideToUTF8(const WS: WideString): UTF8String;
  function AnsiToUTF8(const S: AnsiString): UTF8String;
  function UTF8ToWide(const US: UTF8String): WideString;
  function WideToAnsi(const WS: WideString): AnsiString;
  function UTF8ToAnsi(const S: UTF8String): AnsiString;

type
{ The TMD5Digest record is the type of results of
  the MD5 hashsum evaluation functions. The contents
  of a record may be used as four 32-bit integer values
  or as an array of 16 bytes }
 PMD5Digest = ^TMD5Digest;
 TMD5Digest = record
  case Integer of
   0: (A, B, C, D: LongInt);
   1: (v: array [0..15] of Byte);
 end;


{ The MD5String function evaluates the MD5 hashsum for
  a string. The S parameter specifies a string to
  evaluate hashsum }
procedure MD5String(const S: ansistring;PMD5:PMD5Digest);


{ The MD5File function evaluates the MD5 hashsum for
  a file. The FileName parameter specifies the name
  of a file to evaluate hashsum }
procedure MD5File(const FileName: string;PMD5:PMD5Digest);


{ The MD5Stream function evaluates the MD5 hashsum for
  a stream. The Stream parameters specifies the
  TStream descendant class object to evaluate hashsum }
procedure MD5Stream(const Stream: TStream;PMD5:PMD5Digest);


{ The MD5Buffer function evaluates the MD5 hashsum for
  any memory buffer. The Buffer parameters specifies a
  buffer to evaluate hashsum. The Size parameter specifies
  the size (in bytes) of a buffer }
procedure MD5Buffer(const Buffer; Size: Integer;PMD5:PMD5Digest);


{ The MD5DigestToStr function converts the result of
  a hashsum evaluation function into a string of
  hexadecimal digits }
function MD5DigestToStr(const Digest: TMD5Digest): string;


{ The MD5DigestCompare function compares two
  TMD5Digest record variables. This function returns
  TRUE if parameters are equal or FALSE otherwise }
function MD5DigestCompare(const Digest1, Digest2: TMD5Digest): Boolean;


function StrMD5Encode(AStr: ansistring): string;
function MD5En(AStr: ansistring): string;


implementation


//unit util_utf8;
//
//interface
//
//uses Windows;
//

//implementation

function AnsiToWide(const S: AnsiString): WideString;
var
  len: integer;
  ws: WideString;
begin
  Result:='';
  if (Length(S) = 0) then
    exit;
  len:=MultiByteToWideChar(CP_ACP, 0, PAnsiChar(s), -1, nil, 0);
  SetLength(ws, len);
  MultiByteToWideChar(CP_ACP, 0, PAnsiChar(s), -1, PWideChar(ws), len);
  Result:=ws;
end;

function WideToUTF8(const WS: WideString): UTF8String;
var
  len: integer;
  us: UTF8String;
begin
  Result:='';
  if (Length(WS) = 0) then
    exit;
  len:=WideCharToMultiByte(CP_UTF8, 0, PWideChar(WS), -1, nil, 0, nil, nil);
  SetLength(us, len);
  WideCharToMultiByte(CP_UTF8, 0, PWideChar(WS), -1, PAnsiChar(us), len, nil, nil);
  Result:=us;
end;

function AnsiToUTF8(const S: AnsiString): UTF8String;
begin
  Result:=WideToUTF8(AnsiToWide(S));
end;

function UTF8ToWide(const US: UTF8String): WideString;
var
  len: integer;
  ws: WideString;
begin
  Result:='';
  if (Length(US) = 0) then
    exit;
  len:=MultiByteToWideChar(CP_UTF8, 0, PAnsiChar(US), -1, nil, 0);
  SetLength(ws, len);
  MultiByteToWideChar(CP_UTF8, 0, PAnsiChar(US), -1, PWideChar(ws), len);
  Result:=ws;
end;

function WideToAnsi(const WS: WideString): AnsiString;
var
  len: integer;
  s: AnsiString;
begin
  Result:='';
  if (Length(WS) = 0) then
    exit;
  len:=WideCharToMultiByte(CP_ACP, 0, PWideChar(WS), -1, nil, 0, nil, nil);
  SetLength(s, len);
  WideCharToMultiByte(CP_ACP, 0, PWideChar(WS), -1, PAnsiChar(s), len, nil, nil);
  Result:=s;
end;

function UTF8ToAnsi(const S: UTF8String): AnsiString;
begin
  Result:=WideToAnsi(UTF8ToWide(S));
end;


//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////


{
Copyright (C) 1991-2, RSA Data Security, Inc. Created 1991. All
rights reserved.


License to copy and use this software is granted provided that it
is identified as the "RSA Data Security, Inc. MD5 Message-Digest
Algorithm" in all material mentioning or referencing this software
or this function.


License is also granted to make and use derivative works provided
that such works are identified as "derived from the RSA Data
Security, Inc. MD5 Message-Digest Algorithm" in all material
mentioning or referencing the derived work.


RSA Data Security, Inc. makes no representations concerning either
the merchantability of this software or the suitability of this
software for any particular purpose. It is provided "as is"
without express or implied warranty of any kind.


These notices must be retained in any copies of any part of this
documentation and/or software.
}




type
 UINT4 = LongWord;


 PArray4UINT4 = ^TArray4UINT4;
 TArray4UINT4 = array [0..3] of UINT4;
 PArray2UINT4 = ^TArray2UINT4;
 TArray2UINT4 = array [0..1] of UINT4;
 PArray16Byte = ^TArray16Byte;
 TArray16Byte = array [0..15] of Byte;
 PArray64Byte = ^TArray64Byte;
 TArray64Byte = array [0..63] of Byte;


 PByteArray = ^TByteArray;
 TByteArray = array [0..0] of Byte;


 PUINT4Array = ^TUINT4Array;
 TUINT4Array = array [0..0] of UINT4;


 PMD5Context = ^TMD5Context;
 TMD5Context = record
   state: TArray4UINT4;
   count: TArray2UINT4;
   buffer: TArray64Byte;
 end;


const
  S11 = 7;
  S12 = 12;
  S13 = 17;
  S14 = 22;
  S21 = 5;
  S22 = 9;
  S23 = 14;
  S24 = 20;
  S31 = 4;
  S32 = 11;
  S33 = 16;
  S34 = 23;
  S41 = 6;
  S42 = 10;
  S43 = 15;
  S44 = 21;


var
 Padding : TArray64Byte =
 ($80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);




function _F(x, y, z: UINT4): UINT4;
begin
 Result := (((x) and (y)) or ((not x) and (z)));
end;


function _G(x, y, z: UINT4): UINT4;
begin
 Result := (((x) and (z)) or ((y) and (not z)));
end;


function _H(x, y, z: UINT4): UINT4;
begin
 Result := ((x) xor (y) xor (z));
end;


function _I(x, y, z: UINT4): UINT4;
begin
 Result := ((y) xor ((x) or ( not z)));
end;


function ROTATE_LEFT(x, n: UINT4): UINT4;
begin
 Result := (((x) shl (n)) or ((x) shr (32-(n))));
end;


procedure FF(var a: UINT4; b, c, d, x, s, ac: UINT4);
begin
  a := a + _F(b, c, d) + x + ac;
  a := ROTATE_LEFT (a, s);
  a := a + b;
end;


procedure GG(var a: UINT4; b, c, d, x, s, ac: UINT4);
begin
 a := a + _G(b, c, d) + x + ac;
 a := ROTATE_LEFT(a, s);
 a := a + b;
end;


procedure HH(var a: UINT4; b, c, d, x, s, ac: UINT4);
begin
 a := a + _H(b, c, d) + x + ac;
 a := ROTATE_LEFT(a, s);
 a := a + b;
end;


procedure II(var a: UINT4; b, c, d, x, s, ac: UINT4);
begin
 a := a + _I(b, c, d) + x + ac;
 a := ROTATE_LEFT(a, s);
 a := a + b;
end;


procedure MD5Encode(Output: PByteArray; Input: PUINT4Array; Len: LongWord);
var
 i, j: LongWord;
begin
 j:=0;
 i:=0;
 while j < Len do  begin
  output[j] := Byte(input[i] and $ff);
  output[j+1] := Byte((input[i] shr 8) and $ff);
  output[j+2] := Byte((input[i] shr 16) and $ff);
  output[j+3] := Byte((input[i] shr 24) and $ff);
  Inc(j, 4);
  Inc(i);
 end;
end;


procedure MD5Decode(Output: PUINT4Array; Input: PByteArray; Len: LongWord);
var
 i, j: LongWord;
begin
 j:=0;
 i:=0;
 while j < Len do begin
  Output[i] := UINT4(input[j]) or (UINT4(input[j+1]) shl 8) or
   (UINT4(input[j+2]) shl 16) or ( UINT4(input[j+3]) shl 24);
  Inc(j, 4);
  Inc(i);
 end;
end;


procedure MD5_memcpy(Output: PByteArray; Input: PByteArray; Len: LongWord);
begin
 Move(Input^, Output^, Len);
end;


procedure MD5_memset(Output: PByteArray; Value: Integer; Len: LongWord);
begin
 FillChar(Output^, Len, Byte(Value));
end;


procedure MD5Transform(State: PArray4UINT4; Buffer: PArray64Byte);
var
 a, b, c, d: UINT4;
 x : array[0..15] of UINT4;
begin
 a:=State[0]; b:=State[1]; c:=State[2]; d:=State[3];
 MD5Decode(PUINT4Array(@x), PByteArray(Buffer), 64);


 FF (a, b, c, d, x[ 0], S11, $d76aa478);
 FF (d, a, b, c, x[ 1], S12, $e8c7b756);
 FF (c, d, a, b, x[ 2], S13, $242070db);
 FF (b, c, d, a, x[ 3], S14, $c1bdceee);
 FF (a, b, c, d, x[ 4], S11, $f57c0faf);
 FF (d, a, b, c, x[ 5], S12, $4787c62a);
 FF (c, d, a, b, x[ 6], S13, $a8304613);
 FF (b, c, d, a, x[ 7], S14, $fd469501);
 FF (a, b, c, d, x[ 8], S11, $698098d8);
 FF (d, a, b, c, x[ 9], S12, $8b44f7af);
 FF (c, d, a, b, x[10], S13, $ffff5bb1);
 FF (b, c, d, a, x[11], S14, $895cd7be);
 FF (a, b, c, d, x[12], S11, $6b901122);
 FF (d, a, b, c, x[13], S12, $fd987193);
 FF (c, d, a, b, x[14], S13, $a679438e);
 FF (b, c, d, a, x[15], S14, $49b40821);


 GG (a, b, c, d, x[ 1], S21, $f61e2562);
 GG (d, a, b, c, x[ 6], S22, $c040b340);
 GG (c, d, a, b, x[11], S23, $265e5a51);
 GG (b, c, d, a, x[ 0], S24, $e9b6c7aa);
 GG (a, b, c, d, x[ 5], S21, $d62f105d);
 GG (d, a, b, c, x[10], S22,  $2441453);
 GG (c, d, a, b, x[15], S23, $d8a1e681);
 GG (b, c, d, a, x[ 4], S24, $e7d3fbc8);
 GG (a, b, c, d, x[ 9], S21, $21e1cde6);
 GG (d, a, b, c, x[14], S22, $c33707d6);
 GG (c, d, a, b, x[ 3], S23, $f4d50d87);


 GG (b, c, d, a, x[ 8], S24, $455a14ed);
 GG (a, b, c, d, x[13], S21, $a9e3e905);
 GG (d, a, b, c, x[ 2], S22, $fcefa3f8);
 GG (c, d, a, b, x[ 7], S23, $676f02d9);
 GG (b, c, d, a, x[12], S24, $8d2a4c8a);


 HH (a, b, c, d, x[ 5], S31, $fffa3942);
 HH (d, a, b, c, x[ 8], S32, $8771f681);
 HH (c, d, a, b, x[11], S33, $6d9d6122);
 HH (b, c, d, a, x[14], S34, $fde5380c);
 HH (a, b, c, d, x[ 1], S31, $a4beea44);
 HH (d, a, b, c, x[ 4], S32, $4bdecfa9);
 HH (c, d, a, b, x[ 7], S33, $f6bb4b60);
 HH (b, c, d, a, x[10], S34, $bebfbc70);
 HH (a, b, c, d, x[13], S31, $289b7ec6);
 HH (d, a, b, c, x[ 0], S32, $eaa127fa);
 HH (c, d, a, b, x[ 3], S33, $d4ef3085);
 HH (b, c, d, a, x[ 6], S34,  $4881d05);
 HH (a, b, c, d, x[ 9], S31, $d9d4d039);
 HH (d, a, b, c, x[12], S32, $e6db99e5);
 HH (c, d, a, b, x[15], S33, $1fa27cf8);
 HH (b, c, d, a, x[ 2], S34, $c4ac5665);


 II (a, b, c, d, x[ 0], S41, $f4292244);
 II (d, a, b, c, x[ 7], S42, $432aff97);
 II (c, d, a, b, x[14], S43, $ab9423a7);
 II (b, c, d, a, x[ 5], S44, $fc93a039);
 II (a, b, c, d, x[12], S41, $655b59c3);
 II (d, a, b, c, x[ 3], S42, $8f0ccc92);
 II (c, d, a, b, x[10], S43, $ffeff47d);
 II (b, c, d, a, x[ 1], S44, $85845dd1);
 II (a, b, c, d, x[ 8], S41, $6fa87e4f);
 II (d, a, b, c, x[15], S42, $fe2ce6e0);
 II (c, d, a, b, x[ 6], S43, $a3014314);
 II (b, c, d, a, x[13], S44, $4e0811a1);
 II (a, b, c, d, x[ 4], S41, $f7537e82);
 II (d, a, b, c, x[11], S42, $bd3af235);
 II (c, d, a, b, x[ 2], S43, $2ad7d2bb);
 II (b, c, d, a, x[ 9], S44, $eb86d391);


 Inc(State[0], a);
 Inc(State[1], b);
 Inc(State[2], c);
 Inc(State[3], d);


 MD5_memset (PByteArray(@x), 0, SizeOf (x));
end;




procedure MD5Init(var Context: TMD5Context);
begin
 FillChar(Context, SizeOf(Context), 0);
 Context.state[0] := $67452301;
 Context.state[1] := $efcdab89;
 Context.state[2] := $98badcfe;
 Context.state[3] := $10325476;
end;


procedure MD5Update(var Context: TMD5Context; Input: PByteArray; InputLen: LongWord);
var
 i, index, partLen: LongWord;


begin
 index := LongWord( (context.count[0] shr 3) and $3F);
 Inc(Context.count[0], UINT4(InputLen) shl 3);
 if Context.count[0] < UINT4(InputLen) shl 3 then Inc(Context.count[1]);
 Inc(Context.count[1], UINT4(InputLen) shr 29);
 partLen := 64 - index;
 if inputLen >= partLen then begin
  MD5_memcpy(PByteArray(@Context.buffer[index]), Input, PartLen);
  MD5Transform(@Context.state, @Context.buffer);
  i := partLen;
  while i + 63 < inputLen do begin
   MD5Transform(@Context.state, PArray64Byte(@Input[i]));
   Inc(i, 64);
  end;
  index := 0;
 end else i:=0;
 MD5_memcpy(PByteArray(@Context.buffer[index]), PByteArray(@Input[i]), inputLen - i);
end;

procedure MD5Final(Digest: PMD5Digest; var Context: TMD5Context);
var
 bits: array [0..7] of Byte;
 index, padLen: LongWord;
begin
 MD5Encode(PByteArray(@bits), PUINT4Array(@Context.count), 8);
 index := LongWord( (Context.count[0] shr 3) and $3F);
 if index < 56 then padLen := 56 - index else padLen := 120 - index;
 MD5Update(Context, PByteArray(@PADDING), padLen);
 MD5Update(Context, PByteArray(@Bits), 8);
 MD5Encode(PByteArray(Digest), PUINT4Array(@Context.state), 16);
 MD5_memset(PByteArray(@Context), 0, SizeOf(Context));
end;


function MD5DigestToStr(const Digest: TMD5Digest): string;
var
 i: Integer;
begin
 Result:='';
 for i:=0 to 15 do Result:=Result+IntToHex(Digest.v[i], 2);
end;


procedure MD5String(const S: ansistring;PMD5:PMD5Digest);
begin
  MD5Buffer(PAnsiChar(S)^, Length(S),PMD5);
end;


procedure MD5File(const FileName: string;PMD5:PMD5Digest);
var
  F: TFileStream;
begin
  F:=TFileStream.Create(FileName, fmOpenRead);
  try
    MD5Stream(F,PMD5);
  finally
    F.Free;
  end;
end;


procedure MD5Stream(const Stream: TStream;PMD5:PMD5Digest);
var
 Context: TMD5Context;
 Buffer: array[0..4095] of Byte;
 Size: Integer;
 ReadBytes : Integer;
 TotalBytes : Integer;
 SavePos: Integer;
begin
 MD5Init(Context);
 Size:=Stream.Size;
 SavePos:=Stream.Position;
 TotalBytes:=0;
 try
  Stream.Seek(0, soFromBeginning);
  repeat
   ReadBytes:=Stream.Read(Buffer, SizeOf(Buffer));
   Inc(TotalBytes, ReadBytes);
   MD5Update(Context, @Buffer, ReadBytes);
  until (ReadBytes = 0) or (TotalBytes = Size);
 finally
  Stream.Seek(SavePos, soFromBeginning);
 end;
 MD5Final(PMD5, Context);
end;


procedure MD5Buffer(const Buffer; Size: Integer;PMD5:PMD5Digest);
var
  Context: TMD5Context;
begin
  MD5Init(Context);
  MD5Update(Context, PByteArray(@Buffer), Size);
  MD5Final(PMD5, Context);
end;


function MD5DigestCompare(const Digest1, Digest2: TMD5Digest): Boolean;
begin
  Result:=False;
  if Digest1.A <> Digest2.A then Exit;
  if Digest1.B <> Digest2.B then Exit;
  if Digest1.C <> Digest2.C then Exit;
  if Digest1.D <> Digest2.D then Exit;
  Result:=True;
end;

function MD5En(AStr: ansistring): string;
begin
  Result:=StrMD5Encode(AStr);
end;

function StrMD5Encode(AStr: ansistring): string;
var
    md5: TMD5Digest;
    AUTF8Str:UTF8String;
//    AStringStream:TStringStream;
begin
  //�ַ�����Ҫʹ��UTF-8����

//  AStr:=
//    'appid=wx8e8f30be080c6177&auth_code=555555555555555555555555555'
//    +'&body=�ٹ�԰&detail=���ϵ�ˮ��&mch_id=1487423322'
//    +'&nonce_str=wn714q3v875u4hd3snyfpfcmfcogr2le&out_trade_no=20180720133537537-8437'
//    +'&spbill_create_ip=192.168.1.1&total_fee=10&key=13857563773wangnengdelphiteacher';
  //��ȷ�ļ��������ο�
  //  //'4DE015B3F79341717572DA26146FFAA6'



    AUTF8Str:=AnsiToUTF8(AStr);
    MD5Buffer(PAnsiChar(AUTF8Str)^, Length(AUTF8Str)-1,@md5);


//�����ķ�ʽ
//    AStringStream:=TStringStream.Create(AStr,TEncoding.UTF8);
//    AStringStream.Position:=0;
//    try
//      AStringStream.Position:=0;
//      MD5Stream(AStringStream, @md5);
//    finally
//      FreeAndNil(AStringStream);
//    end;



//      MD5String(AStr, @md5);



      Result := MD5DigestToStr(md5);

end;




end.
