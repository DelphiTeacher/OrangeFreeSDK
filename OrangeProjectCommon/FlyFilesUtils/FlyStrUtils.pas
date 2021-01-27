unit FlyStrUtils;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2014-11-08　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses
  System.SysUtils, System.Classes;

type
  TEncodeType = (etUSASCII, etUTF8, etANSI);
{ UTF8 Byte Order Mark. }
const
  sUTF8BOMString: array[1..3] of Byte = ($EF, $BB, $BF);
function DetectUTF8Encoding(const s: TBytes): TEncodeType;
function HasExtendCharacter(const s: TBytes): Boolean;
function HasUTF8BOM(S : TStream) : boolean; overload;
function HasUTF8BOM(const S: TBytes) : boolean; overload;
function HasUTF8BOM(const S: MarshaledAString) : boolean; overload;

function BytesAutoToString(const S: TBytes; UnknowEncodeDefaultIsAnsi: Boolean = True;
  NoGZipMode: Boolean = False): string; overload;
function BytesAutoToString(const S: MarshaledAString; UnknowEncodeDefaultIsAnsi: Boolean = True;
  NoGZipMode: Boolean = False): string; overload;
function StreamAutoToString(const aStream: TStream; UnknowEncodeDefaultIsAnsi: Boolean = True;
  NoGZipMode: Boolean = False): string;

function IsUTF8String(const s: MarshaledAString): Boolean; overload;
function IsUTF8String(const s: TBytes): Boolean; overload;

function BytesToHex(Value: TBytes): string;
function HexToBytes(Value: string): TBytes;

/// <summary>
///  如果 AStr 真正的编码是 UTF8 的。那么就返回一个 真正的 string 类型的 字符串，否则返回空。
///  适用于 HTTP FTP 等环境。
///  不保证正确性。
///  感谢问题的来源 http://tieba.baidu.com/p/3968566445
/// </summary>
function IsUTF8CodeStringAndGetString(AStr: string): string;

/// <summary>
///   字符串，对称可逆加密，加密结果不能完美显示建议用 ToHex 版本。
///    不使用 ToHex 无法处理中文。
///   来源：http://bbs.2ccc.com/topic.asp?topicid=492053
///   不知道算法的名字，就用日期表示了。
/// </summary>
function EnDecode_20140618(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string; overload;
function EnDecode_20140618(const Str: TBytes; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string; overload;
function Encode_20140618ToHex(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string;
function EnDecode_20140618ToBytes(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): TBytes; overload;
function EnDecode_20140618ToBytes(const Str: TBytes; Key: string;
  KeyEncoding: TEncoding = nil): TBytes; overload;
function HexDecodeToBytes(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): TBytes;
function HexDecodeToStr(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string;
/// <summary>
///   如果含有中文等非 ANSI 字符，不能用于还原，只能方便显示而已。
/// </summary>
function Encode_20140618ToAnsiStr(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string;

procedure DecompressZlibStream(AInStream, AOutStream : TStream; const AWindowBits : Integer);

procedure DecompressGZipStream(AInStream, AOutStream : TStream);

implementation

uses
  System.Zlib;


// 感谢 龟山 阿卍 提供 的 DEMO。
procedure DecompressZlibStream(AInStream, AOutStream : TStream; const AWindowBits : Integer);
var
  OldInPosition,
  OldOutPosition: UInt64;
  DecompressionStream: TDecompressionStream;
begin
  OldInPosition := AInStream.Position;
  try
    DecompressionStream := TDecompressionStream.Create(AInStream, AWindowBits);
    try
      OldOutPosition := AOutStream.Position;
      AOutStream.CopyFrom(DecompressionStream, DecompressionStream.Size);
      try
        AOutStream.Position := OldOutPosition;
      except
      end;
    finally
      FreeAndNil(DecompressionStream);
    end;
  finally
    try
      AInStream.Position := OldInPosition;
    except
    end;
  end;
end;

procedure DecompressGZipStream(AInStream, AOutStream : TStream);
begin
  DecompressZlibStream(AInStream, AOutStream, 15 + 16); // 31 bit wide window = gzip only mode
end;

function IsUTF8CodeStringAndGetString(AStr: string): string;
var
  aBytes: TBytes;
  I: Integer;
begin
  Result := '';
  SetLength(aBytes, Length(AStr));
  for I := 0 to Length(ABytes) - 1 do
  begin
    ABytes[I] := Byte(AStr[Low(AStr) + I]);
  end;
  if IsUTF8String(aBytes) then
    Result := TEncoding.UTF8.GetString(ABytes);
end;

function HexDecodeToStr(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string;
begin
  if StrEncoding = nil then StrEncoding := TEncoding.UTF8;
  Result := EnDecode_20140618(HexToBytes(Str), Key, KeyEncoding);
end;

function HexDecodeToBytes(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): TBytes;
begin
  if StrEncoding = nil then StrEncoding := TEncoding.UTF8;
  Result := EnDecode_20140618ToBytes(HexToBytes(Str), Key, KeyEncoding);
end;

function EnDecode_20140618ToBytesAndKeyBytes(const StrBytes, KeyBytes: TBytes): TBytes;
var
 I,j,k,t: Integer;
 ch: Byte;
 Tmp: array[0..9] of Byte;
 StrLen,
 KeyLen: Integer;
begin
  StrLen := Length(StrBytes);
  KeyLen := Length(KeyBytes);

  j := 1;
  SetLength(Result, StrLen);

  for I := Low(StrBytes) to High(StrBytes) do
  begin
    t := Ord(KeyBytes[j]);

    for k := 0 to 7 do
    begin
      Tmp[k] := (Integer(StrBytes[I]) and $1) xor (t and $1);
      StrBytes[I] := Byte(Integer(StrBytes[I]) shr 1);
      t := t shr 1;
    end;

    ch := 0;

    for k := 7 downto 0 do
      ch := 2 * ch + Tmp[k];

    Result[I] := ch;
    j := (j + 1) mod KeyLen;
  end;
end;

function EnDecode_20140618ToBytes(const Str: TBytes; Key: string;
  KeyEncoding: TEncoding = nil): TBytes; overload;
begin
  if KeyEncoding = nil then KeyEncoding := TEncoding.UTF8;
  Result := EnDecode_20140618ToBytesAndKeyBytes(Str, KeyEncoding.GetBytes(Key));
end;

function EnDecode_20140618ToBytes(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): TBytes;
begin
  if StrEncoding = nil then StrEncoding := TEncoding.UTF8;
  Result := EnDecode_20140618ToBytes(StrEncoding.GetBytes(Str), Key, KeyEncoding);
end;

function Encode_20140618ToHex(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string;
begin
  if StrEncoding = nil then StrEncoding := TEncoding.UTF8;
  Result := BytesToHex(EnDecode_20140618ToBytes(StrEncoding.GetBytes(Str), Key, KeyEncoding));
end;

function EnDecode_20140618(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string;
begin
  if StrEncoding = nil then StrEncoding := TEncoding.UTF8;
//  try
    Result := StrEncoding.GetString(EnDecode_20140618ToBytes(StrEncoding.GetBytes(Str), Key, KeyEncoding));
//  except
//    Result := '';
//  end;
end;

function Encode_20140618ToAnsiStr(const Str: string; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string;
begin
  if StrEncoding = nil then StrEncoding := TEncoding.UTF8;
  Result := TEncoding.ANSI.GetString(EnDecode_20140618ToBytes(StrEncoding.GetBytes(Str), Key, KeyEncoding));
end;

function EnDecode_20140618(const Str: TBytes; Key: string;
  StrEncoding: TEncoding = nil; KeyEncoding: TEncoding = nil): string;
begin
  if StrEncoding = nil then StrEncoding := TEncoding.UTF8;
//  try
    Result := StrEncoding.GetString(EnDecode_20140618ToBytes(Str, Key, KeyEncoding));
//  except
//    Result := '';
//  end;
end;

function BytesToHex(Value: TBytes): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to Length(Value) - 1 do
    Result := Result + IntToHex(Ord(Value[I]), 2);
end;

function HexToBytes(Value: string): TBytes;
var
  Len,
  I: Integer;
begin
  Len := (Length(Value) div 2) + (Length(Value) mod 2);
  SetLength(Result, Len);
//  for I := 0 to Len do
//    Result[I] := #0;
//  Result[Len] := #0;
  Len := (Length(Value) div 2);
  for I := 0 to Len -1 do
  begin
    //Copy based 1
    Byte(Result[I]) := Byte(StrToInt('0x' + Copy(Value, I * 2 + 1, 2)));
  end;
end;

function BytesAutoToString(const S: TBytes; UnknowEncodeDefaultIsAnsi: Boolean = True;
  NoGZipMode: Boolean = False): string;
var
  aStream: TMemoryStream;
begin
  aStream := TMemoryStream.Create;
  try
    aStream.Write(S, Length(S));
    aStream.Position := 0;
    Result := StreamAutoToString(aStream, UnknowEncodeDefaultIsAnsi, NoGZipMode);
  finally
    FreeAndNil(aStream);
  end;
end;

function BytesAutoToString(const S: MarshaledAString; UnknowEncodeDefaultIsAnsi: Boolean = True;
  NoGZipMode: Boolean = False): string;
begin
  Result := BytesAutoToString(TBytes(S), UnknowEncodeDefaultIsAnsi, NoGZipMode);
end;

function StreamAutoToString(const aStream: TStream; UnknowEncodeDefaultIsAnsi: Boolean = True;
  NoGZipMode: Boolean = False): string;
var
  rs: TBytes;
  aByte: Byte;
  isFoundCode: Boolean;
  Len,
  LastPosition: Int64;
  TempStream: TStringStream;
// uStream,
//  AaStream: TStringStream;
  GStream: TMemoryStream;
  SSList: TStringList;
begin
  Result := '';
  if aStream = nil then exit;
  if aStream.Size <= 0 then exit;
  LastPosition := aStream.Position;
  if not NoGZipMode then
  begin
    aStream.Read(aByte, 1);
    if aByte = $1F then
    begin
      aStream.Read(aByte, 1);
      if aByte = $8B then
      begin
        aStream.Read(aByte, 1);
        if aByte = $08 then
        begin
          //Glib;
          GStream := TMemoryStream.Create;
          try
            aStream.Position := LastPosition;
            DecompressGZipStream(aStream, GStream);
            aStream.Size := LastPosition;
            aStream.CopyFrom(GStream, GStream.Size);
            aStream.Position := LastPosition;
          finally
            FreeAndNil(GStream);
          end;
        end;
      end;
    end;
  end;
  aStream.Position := LastPosition;
  isFoundCode := False;
  aStream.Read(aByte, 1);
  if aByte = $FF then
  begin
    aStream.Read(aByte, 1);
    if aByte = $EF then
    begin
      isFoundCode := True;
    end;
  end
  else if aByte = $EF then
  begin
    aStream.Read(aByte, 1);
    if aByte = $BB then
    begin
      aStream.Read(aByte, 1);
      if aByte = $BF then
      begin
        isFoundCode := True;
      end;
    end
    else if aByte = $FF then
    begin
      isFoundCode := True;
    end;
  end;
  aStream.Position := LastPosition;

  if isFoundCode then
  begin
    //自动识别 BOM
    SSList := TStringList.Create;
    try
      SSList.LoadFromStream(aStream);
      Result := SSList.Text;
    finally
      FreeAndNil(SSList);
    end;
  end
  else
  begin
    //没有 BOM 猜吧。
    Len := aStream.Size - LastPosition;
    SetLength(rs, Len);
    //FillChar(rs[Low(string)], Length(rs), 0);
    aStream.Position := LastPosition;
    aStream.Read(rs, Len);
    if Len < 1 then
    begin
      Result := '';
    end
    else if (Len = 2) and (rs[1] = 0) then
    begin
      TempStream := TStringStream.Create('', TEncoding.Unicode);
      try
        aStream.Position := LastPosition;
        TempStream.CopyFrom(aStream, 0);
        Result := TempStream.DataString;
      finally
        FreeAndNil(TempStream);
      end;
    end
    else if (Len = 1) or IsUTF8String(rs) then
    begin
      TempStream := TStringStream.Create('', TEncoding.UTF8);
      try
        aStream.Position := LastPosition;
        TempStream.CopyFrom(aStream, 0);
        Result := TempStream.DataString;
      finally
        FreeAndNil(TempStream);
      end;
    end
    else
    begin
      if UnknowEncodeDefaultIsAnsi then
      begin

      end
      else
      begin
        TempStream := TStringStream.Create('', TEncoding.Unicode);
        try
          aStream.Position := LastPosition;
          try
            TempStream.CopyFrom(aStream, 0);
            Result := TempStream.DataString;
          finally
            FreeAndNil(TempStream);
          end;
        except
          UnknowEncodeDefaultIsAnsi := True;
        end;
      end;
      if UnknowEncodeDefaultIsAnsi then
      begin
        TempStream := TStringStream.Create('', TEncoding.ANSI);
        try
          aStream.Position := LastPosition;
          TempStream.CopyFrom(aStream, 0);
          Result := TempStream.DataString;
        finally
          FreeAndNil(TempStream);
        end;
      end;
//      uStream := TStringStream.Create('', TEncoding.Unicode);
//      try
//        uStream.CopyFrom(aStream, 0);
//        AaStream := TStringStream.Create('', TEncoding.ANSI);
//        try
//          aStream.Position := LastPosition;
//          AaStream.CopyFrom(aStream, 0);
//          if uStream.DataString <> AaStream.DataString then
//          begin
//            if UnknowEncodeDefaultIsAnsi then
//            begin
//              Result := AaStream.DataString;
//            end
//            else
//            begin
//              Result := uStream.DataString;
//            end;
//          end
//          else
//          begin
//            Result := uStream.DataString;
//          end;
//        finally
//          FreeAndNil(AaStream);
//        end;
//      finally
//        FreeAndNil(uStream);
//      end;
    end;
  end;
end;


//Copy From System.WideStrUtils
//----------------------------------------------------------
// If Stream has UTF8 BOM at the begin of stream, return TRUE.
// Stream's position doesn't change.
function HasUTF8BOM(S : TStream) : boolean; overload;
var
  SavePos : Int64;
  Buf : TBytes;
begin
  SetLength(Buf, 3);
  SavePos := S.Position;
  Result := False;
  try
    S.Seek(0, soBeginning);
    if S.Read(Buf, 3) = 3 then
      Result := (Buf[0] = Byte(sUTF8BOMString[1]))
        and (Buf[1] = Byte(sUTF8BOMString[2]))
        and (Buf[2] = Byte(sUTF8BOMString[3]));
  finally
    S.Position := SavePos;
  end;
end;

function HasUTF8BOM(const S: TBytes) : boolean; overload;
begin
  Result := False;
  if Length(S) < 3 then exit ;
  if S[1] <> sUTF8BOMString[1] then exit;
  if S[2] <> sUTF8BOMString[2] then exit;
  if S[3] <> sUTF8BOMString[3] then exit;
  Result := True;
end;

function HasUTF8BOM(const S: MarshaledAString) : boolean;
begin
  Result := HasUTF8BOM(TBytes(S));
end;


//----------------------------------------------------------
// if string contains extended character (non-ascii char), return true;
// if this function return true, It is better to add BOM head of file stream.
function HasExtendCharacter(const s: TBytes): Boolean;
var
  sp, endp : PByte; { PUTF8String }
begin
  sp := PByte(s);
  endp := sp + length(s); // point to NULL-terminater.

  Result := True;
  while sp < endp do
  begin
    if sp^ >= $80 then exit;
    inc(sp);
  end;
  Result := False;
end;

//----------------------------------------------------------
// Detect valid UTF8 sequence.
function DetectUTF8Encoding(const s: TBytes): TEncodeType;
var
  c : Byte;
  P, EndPtr: PByte;
begin
  Result := etUSASCII;
  P :=  PByte(s);
  EndPtr := P + Length(s);

  // skip leading US-ASCII part.
  while P < EndPtr do
  begin
    if P^ >= $80 then break;
    inc(P);
  end;

  // If all character is US-ASCII, done.
  if P = EndPtr then exit;

  while P < EndPtr do
  begin
    c := p^;
    case c of
      $00..$7F:
        inc(P);

      $C2..$DF:
        if (P+1 < EndPtr)
            and ((P+1)^ in [$80..$BF]) then
          Inc(P, 2)
        else
          break;

      $E0:
        if (P+2 < EndPtr)
            and ((P+1)^ in [$A0..$BF])
            and ((P+2)^ in [$80..$BF]) then
          Inc(P, 3)
        else
          break;

      $E1..$EF:
        if (P+2 < EndPtr)
            and ((P+1)^ in [$80..$BF])
            and ((P+2)^ in [$80..$BF]) then
          Inc(P, 3)
        else
          break;

      $F0:
        if (P+3 < EndPtr)
            and ((P+1)^ in [$90..$BF])
            and ((P+2)^ in [$80..$BF])
            and ((P+3)^ in [$80..$BF]) then
          Inc(P, 4)
        else
          break;

      $F1..$F3:
        if (P+3 < EndPtr)
            and ((P+1)^ in [$80..$BF])
            and ((P+2)^ in [$80..$BF])
            and ((P+3)^ in [$80..$BF]) then
          Inc(P, 4)
        else
          break;

      $F4:
        if (P+3 < EndPtr)
            and ((P+1)^ in [$80..$8F])
            and ((P+2)^ in [$80..$BF])
            and ((P+3)^ in [$80..$BF]) then
          Inc(P, 4)
        else
          break;
    else
      break;
    end;
  end;

  if P = EndPtr then Result := etUTF8
  else Result := etANSI;
end;


// if string contains real UTF8 character, return true.
function IsUTF8String(const s: TBytes): Boolean;
begin
  result := DetectUTF8Encoding(s) = etUTF8;
end;
//Copy From System.WideStrUtils end

function IsUTF8String(const s: MarshaledAString): Boolean;
begin
  Result := DetectUTF8Encoding(TBytes(s)) = etUTF8;
end;

end.
