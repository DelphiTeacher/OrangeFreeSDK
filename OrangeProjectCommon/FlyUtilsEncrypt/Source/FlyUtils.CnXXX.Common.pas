(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2015-04-24　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)
unit FlyUtils.CnXXX.Common;

interface

uses
  System.SysUtils, System.Classes;

type
  TProcessProc = procedure (ProcMin, ProcMax, CurrDone: UInt64; var Cancel: Boolean);
  TOnProcessProc = procedure (Sender: TObject; ProcMin, ProcMax, CurrDone: UInt64; var Cancel: Boolean) of Object;

type
  TKeyBit = (kb128, kb192, kb256);
  TCRLFMode = (rlNoChange, rlCRLF, rlLF, rlCR, rlNONE);
  TPaddingMode = (pmZeroPadding, pmPKCS5or7Padding,
    pmISO10126, //aka pmPKCS7RandomPadding
    pmANSIX923,
    pmPKCS5or7RandomPadding, pmNoPadding);
  TCipherMode = (ECB, CBC,
    //http://blog.csdn.net/charleslei/article/details/48710293
    //http://blog.csdn.net/jerry81333/article/details/78336616
    CFB, //
    OFB, //
    CTR, //
    PCBC); //
  TStringMode = (smHex, smEncode, smNormal);

const
  HmacPadLen = 64;
//  C_PKCS5PaddingByteCount = 8;

const
{$IFDEF MSWINDOWS}
  DefaultCRLFMode: TCRLFMode = rlCRLF;
{$ELSE}
{$IFDEF MACOS}
  DefaultCRLFMode: TCRLFMode = rlLF;
{$ELSE}
{$IFDEF IOS}
  DefaultCRLFMode: TCRLFMode = rlLF;
{$ELSE}
  DefaultCRLFMode: TCRLFMode = rlLF;
{$ENDIF IOS}
{$ENDIF MACOS}
{$ENDIF MSWINDOWS}

  {
    TStringStream = class(TStream)
    private
    FDataString: string;
    FPosition: Integer;
    protected
    procedure SetSize(NewSize: Integer); override;
    public
    constructor Create(const AString: string);
    function Read(var Buffer; Count: Integer): Integer; override;
    function ReadString(Count: Integer): string;
    function Seek(Offset: Integer; Origin: Word): Integer; override;
    function Write(const Buffer; Count: Integer): Integer; override;
    procedure WriteString(const AString: string);
    property DataString: string read FDataString;
    end;
  }
/// <summary>
///  StrToHex aka BytesToHex、Bytes2Hex、Str2Hex
/// </summary>
function StrToHex(const Value: TBytes): string; //aka BytesToHex
/// <summary>
///  HexToStr aka HexToBytes、Hex2Bytes、Hex2Str
/// </summary>
function HexToStr(const Value: string): TBytes; //aka HexToBytes

function ChangCRLFType(const Value: string; CRLFMode: TCRLFMode): string;


function MarshaledAString2TBytes(const Str: MarshaledAString): TBytes;
function TBytes2MarshaledAString(const Bytes: TBytes): MarshaledAString;
function TBytes2TBytes(const Bytes: TBytes): TBytes;

function EncodeBase64Bytes(const InputBytes: TBytes): string;
function DecodeBase64Bytes(const InputString: string): Tbytes;

function HexToBase64(const InHex: string): string;
function Base64ToHex(const InBase64: string): string;

procedure MoveAndPad(const Source; var Dest; MoveCount, PadCount: NativeInt);

function StrToHexByEncoding(const Value: string; AEncoding: TEncoding = nil): string;
function HexToStrByEncoding(const Hex: string; AEncoding: TEncoding = nil): string;

implementation
uses
  System.NetEncoding;

function StrToHex(const Value: TBytes): string;
var
  Length: Integer;
  OutBytes: TBytes;
begin
  Length  := System.Length(Value) shl 1;
  SetLength(OutBytes, Length);
  System.Classes.BinToHex(Value, 0, OutBytes, 0, Length shr 1);
  Result := TEncoding.ASCII.GetString(OutBytes);
end;

function HexToStr(const Value: string): TBytes;
var
  Length: Integer;
  InBytes: TBytes;
begin
  InBytes := TEncoding.ASCII.GetBytes(Value);
  Length  := System.Length(InBytes) shr 1;
  SetLength(Result, Length);
  System.Classes.HexToBin(InBytes, 0, Result, 0, Length);
end;

function StrToHexByEncoding(const Value: string; AEncoding: TEncoding = nil): string;
var
  Length: Integer;
  InBytes, OutBytes: TBytes;
begin
  if AEncoding = nil then
    InBytes := TEncoding.UTF8.GetBytes(Value)
  else
    InBytes := AEncoding.GetBytes(Value);
  Length  := System.Length(InBytes) shl 1;
  SetLength(OutBytes, Length);
  System.Classes.BinToHex(InBytes, 0, OutBytes, 0, Length shr 1);
  Result := TEncoding.ASCII.GetString(OutBytes);
end;

function HexToStrByEncoding(const Hex: string; AEncoding: TEncoding = nil): string;
var
  Length: Integer;
  InBytes, OutBytes: TBytes;
begin
  InBytes := TEncoding.ASCII.GetBytes(Hex);
  Length  := System.Length(InBytes) shr 1;
  SetLength(OutBytes, Length);
  System.Classes.HexToBin(InBytes, 0, OutBytes, 0, Length);
  if AEncoding = nil then
    Result := TEncoding.UTF8.GetString(OutBytes)
  else
    Result := AEncoding.GetString(OutBytes);
end;

procedure MoveAndPad(const Source; var Dest; MoveCount, PadCount: NativeInt);
var
  APByte : PByte;
begin
  APByte := Addr(Dest);
  Move(APByte[MoveCount], Dest, MoveCount);
  Move(Source, APByte[MoveCount], PadCount);
end;

function Base64ToHex(const InBase64: string): string;
begin
  Result := StrToHex(DecodeBase64Bytes(InBase64));
end;

function HexToBase64(const InHex: string): string;
begin
  Result := EncodeBase64Bytes(HexToStr(InHex));
end;

function EncodeBase64Bytes(const InputBytes: TBytes): string;
begin
  Result := TNetEncoding.Base64.EncodeBytesToString(InputBytes);
end;

function DecodeBase64Bytes(const InputString: string): Tbytes;
begin
  Result := TNetEncoding.Base64.DecodeStringToBytes(InputString);
end;

function TBytes2TBytes(const Bytes: TBytes): TBytes;
begin
  Result := Bytes;
  SetLength(Result, Length(MarshaledAString(Bytes)));
end;

function MarshaledAString2TBytes(const Str: MarshaledAString): TBytes;
begin
  Result := TBytes(Str);
  SetLength(Result, Length(Str));
end;

function TBytes2MarshaledAString(const Bytes: TBytes): MarshaledAString;
begin
  Result := MarshaledAString(Bytes);
end;


{
  constructor TStringStream.Create(const AString: string);
  begin
  inherited Create;
  FDataString := AString;
  end;

  function TStringStream.Read(var Buffer; Count: Integer): Integer;
  begin
  Result := Length(FDataString) - FPosition;
  if Result > Count then Result := Count;
  Move(PAnsiChar(@FDataString[FPosition + SizeOf(Char)])^, Buffer, Result * SizeOf(Char));
  Inc(FPosition, Result);
  end;

  function TStringStream.Write(const Buffer; Count: Integer): Integer;
  begin
  Result := Count;
  SetLength(FDataString, (FPosition + Result));
  Move(Buffer, PAnsiChar(@FDataString[FPosition + SizeOf(Char)])^, Result * SizeOf(Char));
  Inc(FPosition, Result);
  end;

  function TStringStream.Seek(Offset: Integer; Origin: Word): Integer;
  begin
  case Origin of
  soFromBeginning: FPosition := Offset;
  soFromCurrent: FPosition := FPosition + Offset;
  soFromEnd: FPosition := Length(FDataString) - Offset;
  end;
  if FPosition > Length(FDataString) then
  FPosition := Length(FDataString)
  else if FPosition < 0 then FPosition := 0;
  Result := FPosition;
  end;

  function TStringStream.ReadString(Count: Integer): string;
  var
  Len: Integer;
  begin
  Len := Length(FDataString) - FPosition;
  if Len > Count then Len := Count;
  SetString(Result, PAnsiChar(@FDataString[FPosition + SizeOf(Char)]), Len);
  Inc(FPosition, Len);
  end;

  procedure TStringStream.WriteString(const AString: string);
  begin
  Write(PAnsiChar(AString)^, Length(AString));
  end;

  procedure TStringStream.SetSize(NewSize: Integer);
  begin
  SetLength(FDataString, NewSize);
  if FPosition > NewSize then FPosition := NewSize;
  end;
}

function ChangCRLFType(const Value: string; CRLFMode: TCRLFMode): string;
var
  HasCRLF: Boolean;
begin
  Result := Value;
  if CRLFMode = rlNoChange then
    exit;
  HasCRLF := Pos(#10, Result) > 0;
  if not HasCRLF then
  begin
    HasCRLF := Pos(#13, Result) > 0;
  end;
  if HasCRLF then
  begin
    Result := StringReplace(Result, #13#10, #10, [rfReplaceAll]);
    Result := StringReplace(Result, #10#13, #10, [rfReplaceAll]);
    Result := StringReplace(Result, #13, #10, [rfReplaceAll]);
    if CRLFMode = rlCRLF then
    begin
      Result := StringReplace(Result, #10, #13#10, [rfReplaceAll]);
    end
    else if CRLFMode = rlCR then
    begin
      Result := StringReplace(Result, #10, #13, [rfReplaceAll]);
    end
    else if CRLFMode = rlNONE then
    begin
      Result := StringReplace(Result, #10, '', [rfReplaceAll]);
    end;
  end;
end;

//function StrToHex(const Value: TBytes): string;
//var
//  I: Integer;
//begin
//  Result := '';
//  for I := 0 to Length(Value) - 1 do
//    Result := Result + IntToHex(Ord(Value[I]), 2);
//end;
//
//function HexToStr(const Value: string): TBytes;
//var
//  Len,
//  I: Integer;
//begin
//  Len := (Length(Value) div 2) + (Length(Value) mod 2);
//  SetLength(Result, Len);
////  for I := 0 to Len do
////    Result[I] := #0;
////  Result[Len] := #0;
//  Len := (Length(Value) div 2);
//  for I := 0 to Len -1 do
//  begin
//    //Copy based 1
//    Byte(Result[I]) := Byte(StrToInt('0x' + Copy(Value, I * 2 + 1, 2)));
//  end;
//end;

end.
