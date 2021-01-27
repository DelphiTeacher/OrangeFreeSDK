unit FlyUtils.CRC32;

interface

uses
  SysUtils,Classes, FlyUtils.CnXXX.Common;

// 来源未知。


(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2016-02-29　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

//你们可以和原来的版本对比下，看看我到底改了什么。
//白痴们总是觉得 DELPHI 和别的语言不一样。
//但是，使用正确的代码，各种加密解密的结果都是一样的。

 //所有的 Encoding 不赋值，默认就是 UTF8。

procedure GetCRC32File(const FileName: string; var CRC32: UInt32;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil); overload;
function GetCRC32File(const FileName: string;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string; overload;

function GetCrc32StrToHex(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF; Seed: LongInt = 8;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
   
implementation

const  //Crc32表
  Table: Array[0..255] of UInt32 =
  ( $00000000,  $77073096, $EE0E612C, $990951BA,
    $076DC419, $706AF48F, $E963A535, $9E6495A3,
    $0EDB8832, $79DCB8A4, $E0D5E91E, $97D2D988,
    $09B64C2B, $7EB17CBD, $E7B82D07, $90BF1D91,
    $1DB71064, $6AB020F2, $F3B97148, $84BE41DE,
    $1ADAD47D, $6DDDE4EB, $F4D4B551, $83D385C7,
    $136C9856, $646BA8C0, $FD62F97A, $8A65C9EC,
    $14015C4F, $63066CD9, $FA0F3D63, $8D080DF5,
    $3B6E20C8, $4C69105E, $D56041E4, $A2677172,
    $3C03E4D1, $4B04D447, $D20D85FD, $A50AB56B,
    $35B5A8FA, $42B2986C, $DBBBC9D6, $ACBCF940,
    $32D86CE3, $45DF5C75, $DCD60DCF, $ABD13D59,
    $26D930AC, $51DE003A, $C8D75180, $BFD06116,
    $21B4F4B5, $56B3C423, $CFBA9599, $B8BDA50F,
    $2802B89E, $5F058808, $C60CD9B2, $B10BE924,
    $2F6F7C87, $58684C11, $C1611DAB, $B6662D3D,
    $76DC4190, $01DB7106, $98D220BC, $EFD5102A,
    $71B18589, $06B6B51F, $9FBFE4A5, $E8B8D433,
    $7807C9A2, $0F00F934, $9609A88E, $E10E9818,
    $7F6A0DBB, $086D3D2D, $91646C97, $E6635C01,
    $6B6B51F4, $1C6C6162, $856530D8, $F262004E,
    $6C0695ED, $1B01A57B, $8208F4C1, $F50FC457,
    $65B0D9C6, $12B7E950, $8BBEB8EA, $FCB9887C,
    $62DD1DDF, $15DA2D49, $8CD37CF3, $FBD44C65,
    $4DB26158, $3AB551CE, $A3BC0074, $D4BB30E2,
    $4ADFA541, $3DD895D7, $A4D1C46D, $D3D6F4FB,
    $4369E96A, $346ED9FC, $AD678846, $DA60B8D0,
    $44042D73, $33031DE5, $AA0A4C5F, $DD0D7CC9,
    $5005713C, $270241AA, $BE0B1010, $C90C2086,
    $5768B525, $206F85B3, $B966D409, $CE61E49F,
    $5EDEF90E, $29D9C998, $B0D09822, $C7D7A8B4,
    $59B33D17, $2EB40D81, $B7BD5C3B, $C0BA6CAD,
    $EDB88320, $9ABFB3B6, $03B6E20C, $74B1D29A,
    $EAD54739, $9DD277AF, $04DB2615, $73DC1683,
    $E3630B12, $94643B84, $0D6D6A3E, $7A6A5AA8,
    $E40ECF0B, $9309FF9D, $0A00AE27, $7D079EB1,
    $F00F9344, $8708A3D2, $1E01F268, $6906C2FE,
    $F762575D, $806567CB, $196C3671, $6E6B06E7,
    $FED41B76, $89D32BE0, $10DA7A5A, $67DD4ACC,
    $F9B9DF6F, $8EBEEFF9, $17B7BE43, $60B08ED5,
    $D6D6A3E8, $A1D1937E, $38D8C2C4, $4FDFF252,
    $D1BB67F1, $A6BC5767, $3FB506DD, $48B2364B,
    $D80D2BDA, $AF0A1B4C, $36034AF6, $41047A60,
    $DF60EFC3, $A867DF55, $316E8EEF, $4669BE79,
    $CB61B38C, $BC66831A, $256FD2A0, $5268E236,
    $CC0C7795, $BB0B4703, $220216B9, $5505262F,
    $C5BA3BBE, $B2BD0B28, $2BB45A92, $5CB36A04,
    $C2D7FFA7, $B5D0CF31, $2CD99E8B, $5BDEAE1D,
    $9B64C2B0, $EC63F226, $756AA39C, $026D930A,
    $9C0906A9, $EB0E363F, $72076785, $05005713,
    $95BF4A82, $E2B87A14, $7BB12BAE, $0CB61B38,
    $92D28E9B, $E5D5BE0D, $7CDCEFB7, $0BDBDF21,
    $86D3D2D4, $F1D4E242, $68DDB3F8, $1FDA836E,
    $81BE16CD, $F6B9265B, $6FB077E1, $18B74777,
    $88085AE6, $FF0F6A70, $66063BCA, $11010B5C,
    $8F659EFF, $F862AE69, $616BFFD3, $166CCF45,
    $A00AE278, $D70DD2EE, $4E048354, $3903B3C2,
    $A7672661, $D06016F7, $4969474D, $3E6E77DB,
    $AED16A4A, $D9D65ADC, $40DF0B66, $37D83BF0,
    $A9BCAE53, $DEBB9EC5, $47B2CF7F, $30B5FFE9,
    $BDBDF21C, $CABAC28A, $53B39330, $24B4A3A6,
    $BAD03605, $CDD70693, $54DE5729, $23D967BF,
    $B3667A2E, $C4614AB8, $5D681B02, $2A6F2B94,
    $B40BBE37, $C30C8EA1, $5A05DF1B, $2D02EF8D);


function InternalCRC32Stream(Stream: TStream; const ByteCount: UInt64; const BufSize: UInt32;
  var CRC32: UInt32; Seed: LongInt = 8;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): Boolean;
var
  Buf: TBytes;
  BufLen: UInt32;
  Size: Int64;
  ReadBytes: UInt32;
  TotalBytes: Int64;
  //SavePos: Int64;
  CancelCalc: Boolean;
  i: Integer;
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
  if Size = 0 then Exit;
  if Size < BufSize then BufLen := Size
  else BufLen := BufSize;

  CancelCalc := False;
  CRC32 := Seed;
  {$I-}
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
        for i := 0 to ReadBytes - 1 do
          CRC32 := (CRC32 shr 8) xor Table[Buf[i] xor (CRC32 and $000000FF)];
        if Assigned(OnProcessProc) then
          OnProcessProc(nil, 0, Size, TotalBytes, CancelCalc);
        if Assigned(ProcessProc) then
          ProcessProc(0, Size, TotalBytes, CancelCalc);
        if CancelCalc then Exit;
      end;
    until (ReadBytes <= 0) or (TotalBytes >= Size);
    CRC32 := not CRC32;
    Result := True;
  finally
    SetLength(Buf, 0);
    //Stream.Position := SavePos;
  end;
  {$I+}
end;


procedure GetCRC32File(const FileName: string; var CRC32: UInt32;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    InternalCRC32Stream(Stream, 0, 65521, CRC32, $FFFFFFFF, OnProcessProc, ProcessProc);
  finally
    FreeAndNil(Stream);
  end;
end;

function GetCRC32File(const FileName: string;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
var
  CRC32: UInt32;
begin
  GetCRC32File(FileName,CRC32, OnProcessProc, ProcessProc);
  Result := IntToHex(CRC32, 8);
end;

function GetCrc32StrToHex(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF; Seed: LongInt = 8;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
var
  CRC32: UInt32;
  InStream: TStringStream;
begin
  if ValueCRLFMode <> rlNoChange then
  begin
    Value := ChangCRLFType(Value, ValueCRLFMode);
  end;
  if StrEncoding = nil then
    StrEncoding := TEncoding.UTF8;
  InStream := TStringStream.Create(Value, StrEncoding, False);
  try
    InStream.Position := 0;
    InternalCRC32Stream(InStream, 0, InStream.Size, CRC32, Seed, OnProcessProc, ProcessProc);
    Result := IntToHex(CRC32, 8);
  finally
    FreeAndNil(InStream);
  end;
end;


end.
