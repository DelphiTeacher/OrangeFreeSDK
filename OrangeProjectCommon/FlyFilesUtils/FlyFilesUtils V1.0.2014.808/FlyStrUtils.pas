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

function BytesAutoToString(const S: TBytes; const UnknowEncodeDefaultIsAnsi: Boolean = True): string; overload;
function BytesAutoToString(const S: MarshaledAString; const UnknowEncodeDefaultIsAnsi: Boolean = True): string; overload;
function StreamAutoToString(const aStream: TStream; const UnknowEncodeDefaultIsAnsi: Boolean = True): string;

function IsUTF8String(const s: MarshaledAString): Boolean; overload;
function IsUTF8String(const s: TBytes): Boolean; overload;

implementation

function BytesAutoToString(const S: TBytes; const UnknowEncodeDefaultIsAnsi: Boolean = True): string;
var
  aStream: TMemoryStream;
begin
  aStream := TMemoryStream.Create;
  try
    aStream.Write(S, Length(S));
    aStream.Position := 0;
    Result := StreamAutoToString(aStream, UnknowEncodeDefaultIsAnsi);
  finally
    FreeAndNil(aStream);
  end;
end;

function BytesAutoToString(const S: MarshaledAString; const UnknowEncodeDefaultIsAnsi: Boolean = True): string;
begin
  Result := BytesAutoToString(TBytes(S), UnknowEncodeDefaultIsAnsi);
end;

function StreamAutoToString(const aStream: TStream; const UnknowEncodeDefaultIsAnsi: Boolean = True): string;
var
  rs: TBytes;
  aByte: Byte;
  isFoundCode: Boolean;
  LastPosition: Int64;
  stream,
  uStream,
  AaStream: TStringStream;
  SSList: TStringList;
begin
  Result := '';
  if aStream = nil then exit;
  if aStream.Size <= 0 then exit;
  LastPosition := aStream.Position;
  if aByte = $1F then
  begin
    aStream.Read(aByte, 1);
    if aByte = $8B then
    begin
      aStream.Read(aByte, 1);
      if aByte = $08 then
      begin
        //Glib;
        LastPosition := aStream.Position;
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
    uStream := TStringStream.Create('', TEncoding.Unicode);
    try
      uStream.CopyFrom(aStream, 0);
      AaStream := TStringStream.Create('', TEncoding.ANSI);
      try
        aStream.Position := LastPosition;
        AaStream.CopyFrom(aStream, 0);
        if uStream.DataString <> AaStream.DataString then
        begin
          SetLength(rs, aStream.Size + 1);
          FillChar(rs[Low(string)], Length(rs), 0);
          aStream.Position := LastPosition;
          aStream.Read(rs, aStream.Size);
          //Move((@AaStream.Bytes[0])^, rs[Low(string)], Length(AaStream.Bytes));
          if IsUTF8String(rs) then
          begin
            stream := TStringStream.Create('', TEncoding.UTF8);
            try
              aStream.Position := LastPosition;
              stream.CopyFrom(aStream, 0);
              Result := stream.DataString;
            finally
              FreeAndNil(stream);
            end;
          end
          else if UnknowEncodeDefaultIsAnsi then
          begin
            Result := AaStream.DataString;
          end
          else
          begin
            Result := uStream.DataString;
          end;
        end
        else
        begin
          Result := uStream.DataString;
        end;
      finally
        FreeAndNil(AaStream);
      end;
    finally
      FreeAndNil(uStream);
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
