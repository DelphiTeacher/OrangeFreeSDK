unit FlyUtils.DetectUTF8Encoding;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2014-11-08　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses
  System.SysUtils;

type
  TEncodeType = (etUSASCII, etUTF8, etANSI);

const
  sUTF8BOMString: array[1..3] of Byte = ($EF, $BB, $BF);

function IsUTF8String(const s: MarshaledAString): Boolean; overload;
function IsUTF8String(const s: TBytes): Boolean; overload;

function DetectUTF8Encoding(const s: TBytes): TEncodeType;

function HasUTF8BOM(const S: TBytes) : boolean; overload;
function HasUTF8BOM(const S: MarshaledAString) : boolean; overload;

/// <summary>
///  如果 AStr 真正的编码是 UTF8 的。那么就返回一个 真正的 string 类型的 字符串，否则返回空。
///  适用于 HTTP FTP 等环境。
///  不保证正确性。
///  感谢问题的来源 http://tieba.baidu.com/p/3968566445
/// </summary>
function IsUTF8CodeStringAndGetString(AStr: string): string;

implementation

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
  Result := DetectUTF8Encoding(s) = etUTF8;
end;
//Copy From System.WideStrUtils end

function IsUTF8String(const s: MarshaledAString): Boolean;
begin
  Result := DetectUTF8Encoding(TBytes(s)) = etUTF8;
end;

end.
