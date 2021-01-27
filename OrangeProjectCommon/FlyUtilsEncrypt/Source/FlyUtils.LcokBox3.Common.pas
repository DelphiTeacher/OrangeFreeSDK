(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2017-11-27　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)
unit FlyUtils.LcokBox3.Common;

interface

uses
  System.SysUtils, System.Classes,
  uTPLb_HugeCardinal, uTPLb_RSA_Engine;

type
  THugeCardinalWrap = class( TInterfacedObject, IHugeCardinalWrap)
  private
    FValue: THugeCardinal;
    function Value: THugeCardinal;
    procedure Burn;
    function  IsZero: boolean;
  public
    constructor Create( Value1: THugeCardinal);
    destructor Destroy; override;
  end;

function NewWrap( Value1: THugeCardinal): IHugeCardinalWrap;
procedure StoreRSAKeyPairPartsToStream(const Parts: RSAKeyStorePartSet; AKey: TRSAKeyPair; Store: TStream);
procedure LockBox3RSAHexToStream(const InHexStr: string; AStream: TStream; Order: TByteOrder = TByteOrder.LittleEndien);
function HexStrChangeByteOrder(const InHexStr: string): string;

implementation
uses
  System.NetEncoding;

function HexStrChangeByteOrder(const InHexStr: string): string;
var
  ALow,
  AHigh,
  Len: Integer;
  I: Integer;
  FInHexStr: string;
begin
  Result := '';
  FInHexStr := InHexStr;
  Len := Length(FInHexStr);
  if Len mod 2 = 1 then
  begin
    FInHexStr := '0' + FInHexStr;
    Inc(Len);
  end;
  ALow := Low(FInHexStr);
  AHigh := High(FInHexStr);
  for I := AHigh downto ALow do
  begin
    if I Mod 2 = 0 then
    begin
      Result := Result + FInHexStr[I - 1] + FInHexStr[I];
    end;
  end;
  if Result.Chars[0] = '0' then
  begin
    Result := Result.Substring(1);
  end;
end;

procedure LockBox3RSAHexToStream(const InHexStr: string; AStream: TStream; Order: TByteOrder = TByteOrder.LittleEndien);
var
  AByte: Byte;
  I, Len: Integer;
  FInHexStr: string;
begin
  if AStream = nil then exit;
  FInHexStr := InHexStr;
  Len := Length(FInHexStr);
  if Len mod 2 = 1 then
  begin
    FInHexStr := '0' + FInHexStr;
    Inc(Len);
  end;

  Len := (Length(FInHexStr) div 2) + (Length(FInHexStr) mod 2);
  if Order = TByteOrder.LittleEndien then
  begin
    for I := Len - 1 downto 0 do
    begin
      AByte := Byte(StrToInt('0x' + Copy(FInHexStr, I * 2 + 1, 2)));
      AStream.Write(AByte, 1);
    end;
  end
  else
  begin
    for I := 0 to Len - 1 do
    begin
      AByte := Byte(StrToInt('0x' + Copy(FInHexStr, I * 2 + 1, 2)));
      AStream.Write(AByte, 1);
    end;
  end;
end;

function StoreHugeCardinal_Primitive(
  Number: THugeCardinal; StoreStream: TStream): boolean;
// Stores the number in the stream using the cannonical format.
// Returns True if the Number was assigned.
var
  L: cardinal;
begin
  Result := ( Number <> nil );
  if result then
    L := (Number.BitLength + 7) div 8
  else
    L := 0;
  if ( StoreStream = nil ) then exit;
  StoreStream.WriteBuffer( L, SizeOf( L));
  if L > 0 then
    Number.StreamOut( TByteOrder.LittleEndien, StoreStream, L)
end;

procedure StoreRSAKeyPairPartsToStream(const Parts: RSAKeyStorePartSet; AKey: TRSAKeyPair; Store: TStream);
var
  iVersion: integer;
  pBuffer: TBytes;
begin
  if AKey = nil then exit;
  if Store = nil then exit;
  pBuffer := TEncoding.UTF8.GetBytes(RSAKeySig);
  Store.WriteBuffer(pBuffer, Length(pBuffer));
  iVersion := RSAKeyStoreVersion;
  Store.WriteBuffer( iVersion, SizeOf( iVersion));
  Store.WriteBuffer( Parts, SizeOf( Parts));
  if (PartN in Parts) and (AKey.F_RSA_n <> nil) then
    StoreHugeCardinal_Primitive(AKey.F_RSA_n.Value, Store);
  if (PartE in Parts) and (AKey.F_RSA_e <> nil)  then
    StoreHugeCardinal_Primitive(AKey.F_RSA_e.Value, Store);
  if (PartD in Parts) and (AKey.F_RSA_d <> nil)  then
    StoreHugeCardinal_Primitive(AKey.F_RSA_d.Value, Store);
  if (PartCRT in Parts) and
    (AKey.F_RSA_p <> nil) and (AKey.F_RSA_q <> nil) and (AKey.F_RSA_dp <> nil)
    and (AKey.F_RSA_dq <> nil) and (AKey.F_RSA_qinv <> nil)  then
  begin
    StoreHugeCardinal_Primitive(AKey.F_RSA_p.Value, Store);
    StoreHugeCardinal_Primitive(AKey.F_RSA_q.Value, Store);
    StoreHugeCardinal_Primitive(AKey.F_RSA_dp.Value, Store);
    StoreHugeCardinal_Primitive(AKey.F_RSA_dq.Value, Store);
    StoreHugeCardinal_Primitive(AKey.F_RSA_qinv.Value, Store)
  end;
end;

function NewWrap( Value1: THugeCardinal): IHugeCardinalWrap;
begin
  Result := THugeCardinalWrap.Create( Value1)
end;

{ THugeCardinalWrap }

procedure THugeCardinalWrap.Burn;
begin
  if ( FValue <> nil ) then
    FValue.Burn
end;

constructor THugeCardinalWrap.Create( Value1: THugeCardinal);
begin
  FValue := Value1
end;

destructor THugeCardinalWrap.Destroy;
begin
  FValue.Free;
  inherited
end;

function THugeCardinalWrap.IsZero: boolean;
begin
  Result := (not assigned( FValue)) or FValue.isZero
end;

function THugeCardinalWrap.Value: THugeCardinal;
begin
  Result := FValue
end;

end.
