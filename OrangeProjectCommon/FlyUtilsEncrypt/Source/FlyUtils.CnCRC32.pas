unit FlyUtils.CnCRC32;

{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     中国人自己的开放源码第三方开发包                         }
{                   (C)Copyright 2001-2016 CnPack 开发组                       }
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

{* |<PRE>
================================================================================
* 软件名称：开发包基础库
* 单元名称：CRC32循环冗余校验单元
* 单元作者：周劲羽 (zjy@cnpack.org)
* 备    注：
* 开发平台：PWin2000Pro + Delphi 5.0
* 兼容测试：PWin9X/2000/XP + Delphi 5/6
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id$
* 修改记录：2015.06.12 V1.4
*               把汇编改写为 Pascal 以适应 64 位编译器
*           2009.08.21 V1.3
*               增加CRC64的支持
*           2009.07.31 V1.2
*               修正计算大文件CRC32不正确的问题，增加对大于4G文件的支持
*           2009.04.16 V1.1
*               修正一处计算有误的问题
*           2002.08.11 V1.0
*               创建单元
================================================================================
|</PRE>}

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　修改：爱吃猪头肉 & Flying Wang 2016-02-29　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　禁止发布到城通网盘。　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

//{$I CnPack.inc}

uses
  SysUtils,Classes, FlyUtils.CnXXX.Common;


//你们可以和原来的版本对比下，看看我到底改了什么。
//白痴们总是觉得 DELPHI 和别的语言不一样。
//但是，使用正确的代码，各种加密解密的结果都是一样的。

 //所有的 Encoding 不赋值，默认就是 UTF8。

function CRC32Calc(const OrgCRC32: UInt32; const Data; Len: UInt32): UInt32;
{* 计算 CRC32 值
 |<PRE>
   OrgCRC32: UInt32  - 起始 CRC32 值，默认可传 0
   const Data       - 要计算的数据块
   Len: UInt32       - 数据块长度
   Result: UInt32    - 返回 CRC32 计算结果
 |</PRE>}

procedure GetCRC32File(const FileName: string; var CRC32: UInt32;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil); overload;
function GetCRC32File(const FileName: string;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string; overload;

function GetCrc32StrToHex(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF; OrgCRC: LongInt = 8;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;

function CRC64Calc(const OrgCRC64: Int64; const Data; Len: UInt32): Int64;
{* 计算 CRC64 值
 |<PRE>
   OrgCRC64: Int64  - 起始 CRC64 值，默认可传 0
   const Data       - 要计算的数据块
   Len: UInt32       - 数据块长度
   Result: Int64    - 返回CRC64计算结果
 |</PRE>}

procedure GetCRC64File(const FileName: string; var CRC64: UInt64;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil); overload;
function GetCRC64File(const FileName: string;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string; overload;

function GetCrc64StrToHex(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF; OrgCRC: LongInt = 8;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;

implementation

const
  csBuff_Size = 4096;
  csCRC64 = $C96C5795D7870F42;

type
  // 文件缓冲区
  PBuff = ^TBuff;
  TBuff = array[0..csBuff_Size - 1] of Byte;

  // CRC32 表
  TCRC32Table = array[0..255] of UInt32;

  // CRC64 表
  TCRC64Table = array[0..255] of Int64;

var
  CRC32Table: TCRC32Table = (
    $00000000, $77073096, $EE0E612C, $990951BA,
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
    $B40BBE37, $C30C8EA1, $5A05DF1B, $2D02EF8D
  );

  CRC64Table: TCRC64Table;

// 生成 CRC32 表，现用常量直接代替
//procedure Make_CRC32Table;
//asm
//        PUSH    EBX
//        MOV     EDX, OFFSET CRC32Table
//
//        XOR     EBX, EBX
//@MakeCRC32Loop:
//        CMP     EBX, $100
//        JE      @MakeCRC32_Succ
//        MOV     EAX, EBX
//        MOV     ECX, 8
//@MakeLoop:
//        TEST    EAX, 1
//        JZ      @MakeIsZero
//        SHR     EAX, 1
//        XOR     EAX, $EDB88320
//        JMP     @MakeNext
//@MakeIsZero:
//        SHR     EAX, 1
//@MakeNext:
//        LOOP    @MakeLoop
//        MOV     UInt32 PTR [EDX], EAX
//        ADD     EDX, 4
//        INC     EBX
//        JMP     @MakeCRC32Loop
//
//@MakeCRC32_Succ:
//        POP     EBX
//        RET
//end;

// 计算 CRC32 值
function DoCRC32Calc(const OrgCRC32: UInt32; const Data; Len: UInt32): UInt32;
var
  P: PByte;
begin
  Result := OrgCRC32;
  if (@Data = nil) or (Len = 0) then
    Exit;

  P := PByte(@Data);
  while Len > 0 do
  begin
    Result := ((Result shr 8) and $FFFFFF) xor CRC32Table[(Result and $FF) xor P^];

    Inc(P);
    Dec(Len);
  end;
end;
//asm
//        OR      EDX, EDX   // Data = nil?
//        JE      @Exit
//        JECXZ   @Exit      // Len = 0?
//        PUSH    ESI
//        PUSH    EBX
//        MOV     ESI, OFFSET CRC32Table
//@Upd:
//        MOVZX   EBX, AL    // CRC32
//        XOR     BL, [EDX]
//        SHR     EAX, 8
//        AND     EAX, $00FFFFFF
//        XOR     EAX, [EBX * 4 + ESI]
//        INC     EDX
//        LOOP    @Upd
//        POP     EBX
//        POP     ESI
//@Exit:
//        RET
//end;

// 计算 CRC32 值
function CRC32Calc(const OrgCRC32: UInt32; const Data; Len: UInt32): UInt32;
begin
  Result := not OrgCRC32;
  Result := DoCRC32Calc(Result, Data, Len);
  Result := not Result;
end;

function InternalCRC32Stream(Stream: TStream; const ByteCount: UInt64; const BufSize: UInt32;
  var CRC32: UInt32; OrgCRC32: UInt32 = 0;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): Boolean;
var
  Buf: TBytes;
  BufLen: UInt32;
  Size: Int64;
  ReadBytes: UInt32;
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
  if Size = 0 then Exit;
  if Size < BufSize then BufLen := Size
  else BufLen := BufSize;

  CancelCalc := False;
  CRC32 := not OrgCRC32;
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
        CRC32 := DoCrc32Calc(CRC32, Buf[0], ReadBytes);
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
end;

procedure GetCRC32File(const FileName: string; var CRC32: UInt32;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    InternalCRC32Stream(Stream, 0, 65521, CRC32, 0, OnProcessProc, ProcessProc);
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
  ValueCRLFMode: TCRLFMode = rlCRLF; OrgCRC: LongInt = 8;
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
    InternalCRC32Stream(InStream, 0, InStream.Size, CRC32, OrgCRC, OnProcessProc, ProcessProc);
    Result := IntToHex(CRC32, 8);
  finally
    FreeAndNil(InStream);
  end;
end;

var
  IsMaked_CRC64Table : Boolean = False;

procedure Make_CRC64Table;
var
  I, J: Integer;
  Data: Int64;
begin
  if IsMaked_CRC64Table then exit;
  IsMaked_CRC64Table := True;
  for I := 0 to 255 do
  begin
    Data := I;
    for J := 0 to 7 do
    begin
      if (Data and 1) <> 0 then
        Data := Data shr 1 xor csCRC64
      else
        Data := Data shr 1;

      CRC64Table[I] := Data;
    end;
  end;
end;

function DoCRC64Calc(const OrgCRC64: Int64; const Data; Len: UInt32): Int64;
var
  I: Integer;
  DataAddr: PByte;
begin
 Make_CRC64Table;
  DataAddr := @Data;
  Result := OrgCRC64;

  for I := 0 to Len - 1 do
  begin
    Result := Result shr 8 xor
      CRC64Table[UInt32(Result) and $FF xor DataAddr^];
    Inc(DataAddr);
  end;
end;

// 计算 CRC64 值
function CRC64Calc(const OrgCRC64: Int64; const Data; Len: UInt32): Int64;
begin
  Result := not OrgCRC64;
  Result := DoCRC64Calc(Result, Data, Len);
  Result := not Result;
end;

function InternalCRC64Stream(Stream: TStream; const ByteCount: UInt64; const BufSize: UInt32;
  var CRC64: UInt64; OrgCRC64: UInt64 = 0;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): Boolean;
var
  Buf: TBytes;
  BufLen: UInt32;
  Size: Int64;
  ReadBytes: UInt32;
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
  if Size = 0 then Exit;
  if Size < BufSize then BufLen := Size
  else BufLen := BufSize;

  CancelCalc := False;
  CRC64 := not OrgCRC64;
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
        CRC64 := DoCrc64Calc(CRC64, Buf[0], ReadBytes);
        if Assigned(OnProcessProc) then
          OnProcessProc(nil, 0, Size, TotalBytes, CancelCalc);
        if Assigned(ProcessProc) then
          ProcessProc(0, Size, TotalBytes, CancelCalc);
        if CancelCalc then Exit;
      end;
    until (ReadBytes <= 0) or (TotalBytes >= Size);
    CRC64 := not CRC64;
    Result := True;
  finally
    SetLength(Buf, 0);
    //Stream.Position := SavePos;
  end;
end;

procedure GetCRC64File(const FileName: string; var CRC64: UInt64;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    InternalCRC64Stream(Stream, 0, 65521, CRC64, 0, OnProcessProc, ProcessProc);
  finally
    FreeAndNil(Stream);
  end;
end;

function GetCRC64File(const FileName: string;
  OnProcessProc: TOnProcessProc = nil; ProcessProc: TProcessProc = nil): string;
var
  CRC64: UInt64;
begin
  GetCRC64File(FileName,CRC64, OnProcessProc, ProcessProc);
  Result := IntToHex(CRC64, 8);
end;

function GetCrc64StrToHex(Value: string; StrEncoding: TEncoding = nil;
  ValueCRLFMode: TCRLFMode = rlCRLF; OrgCRC: LongInt = 8;
  OnProcessProc: TOnProcessProc = nil;
  ProcessProc: TProcessProc = nil): string;
var
  CRC64: UInt64;
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
    InternalCRC64Stream(InStream, 0, InStream.Size, CRC64, OrgCRC, OnProcessProc, ProcessProc);
    Result := IntToHex(CRC64, 8);
  finally
    FreeAndNil(InStream);
  end;
end;

initialization
//  Make_CRC32Table; // 初始化CRC32表

//  Make_CRC64Table; // 初始化CRC64表

end.
