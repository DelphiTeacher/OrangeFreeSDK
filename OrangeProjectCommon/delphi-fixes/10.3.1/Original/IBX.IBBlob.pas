{$A8} {$R-}
{*************************************************************}
{                                                             }
{       Embarcadero Delphi Visual Component Library           }
{       InterBase Express core components                     }
{                                                             }
{       Copyright (c) 1998-2017 Embarcadero Technologies, Inc.}
{              All rights reserved                            }
{                                                             }
{    InterBase Express is based in part on the product        }
{    Free IB Components, written by Gregory H. Deatz for      }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.          }
{    Free IB Components is used under license.                }
{                                                             }
{    Additional code created by Jeff Overcash and used        }
{    with permission.                                         }
{*************************************************************}
unit IBX.IBBlob;

interface

uses
  System.SysUtils, System.Classes, IBX.IBHeader, IBX.IBExternals, Data.DB,
  IBX.IBDatabase, IBX.IBIntf;

const
  DefaultBlobSegmentSize = 16 * 1024;

type
  { TIBBlobStream }
  TIBBlobStream = class(TStream)
  private
    FBase: TIBBase;
    FBlobID: TISC_QUAD;
    FBlobMaxSegmentSize,
    FBlobNumSegments,
    FBlobSize: Long;
    FBlobType: Short;  { 0 = segmented, 1 = streamed }
    FBuffer: PByte;
    FBlobInitialized: Boolean;
    FHandle: TISC_BLOB_HANDLE;
    FMode: TBlobStreamMode;
    FModified: Boolean;
    FPosition: Long;
  protected
    procedure CloseBlob;
    procedure CreateBlob;
    procedure EnsureBlobInitialized;
    procedure GetBlobInfo;
    function GetDatabase: TIBDatabase;
    function GetDBHandle: PISC_DB_HANDLE;
    function GetTransaction: TIBTransaction;
    function GetTRHandle: PISC_TR_HANDLE;
    procedure OpenBlob;
    procedure SetBlobID(Value: TISC_QUAD);
    procedure SetDatabase(Value: TIBDatabase);
    procedure SetMode(Value: TBlobStreamMode);
    procedure SetTransaction(Value: TIBTransaction);
  public
    constructor Create();
    destructor Destroy; override;
    function Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
    procedure Cancel;
    procedure CheckReadable;
    procedure CheckWritable;
    procedure Finalize;
    procedure LoadFromFile(Filename: string);
    procedure LoadFromStream(Stream: TStream);
    function Read(var Buffer; Count: Longint): Longint; override;
    procedure SaveToFile(Filename: string);
    procedure SaveToStream(Stream: TStream);
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    procedure SetSize(NewSize: Longint); override;
    procedure Truncate;
    function Write(const Buffer; Count: Longint): Longint; override;
    property Handle: TISC_BLOB_HANDLE read FHandle;
    property BlobID: TISC_QUAD read FBlobID write SetBlobID;
    property BlobMaxSegmentSize: Long read FBlobMaxSegmentSize;
    property BlobNumSegments: Long read FBlobNumSegments;
    property BlobSize: Long read FBlobSize;
    property BlobType: Short read FBlobType;
    property Database: TIBDatabase read GetDatabase write SetDatabase;
    property DBHandle: PISC_DB_HANDLE read GetDBHandle;
    property Mode: TBlobStreamMode read FMode write SetMode;
    property Modified: Boolean read FModified;
    property Transaction: TIBTransaction read GetTransaction write SetTransaction;
    property TRHandle: PISC_TR_HANDLE read GetTRHandle;
  end;

  procedure GetBlobInfo(hBlobHandle: PISC_BLOB_HANDLE; var NumSegments, MaxSegmentSize,
                       TotalSize: Long; var BlobType: Short; GDSLibrary : IGDSLibrary);
  procedure ReadBlob(hBlobHandle: PISC_BLOB_HANDLE; Buffer: PByte; BlobSize: Long;
                     GDSLibrary : IGDSLibrary);
  procedure WriteBlob(hBlobHandle: PISC_BLOB_HANDLE; Buffer: PByte; BlobSize: Long;
                      GDSLibrary : IGDSLibrary);

implementation

uses IBX.IB, IBX.IBErrorCodes, IBX.IBCustomDataSet;

procedure GetBlobInfo(hBlobHandle: PISC_BLOB_HANDLE; var NumSegments, MaxSegmentSize,
                      TotalSize: Long; var BlobType: Short; GDSLibrary : IGDSLibrary);
var
  items: array[0..3] of Byte;
  results: array[0..99] of Byte;
  i, item_length: Integer;
  item: Integer;
begin
  items[0] := Byte(isc_info_blob_num_segments);
  items[1] := Byte(isc_info_blob_max_segment);
  items[2] := Byte(isc_info_blob_total_length);
  items[3] := Byte(isc_info_blob_type);

  if GDSLibrary.isc_blob_info(StatusVector, hBlobHandle, 4, @items[0], SizeOf(results),
                    @results[0]) > 0 then
    IBDatabaseError(GDSLibrary);

  i := 0;
  while (i < SizeOf(results)) and (results[i] <> Byte(isc_info_end)) do
  begin
    item := Integer(results[i]);
    Inc(i);
    item_length := GDSLibrary.isc_vax_integer(@results[i], 2);
    Inc(i, 2);
    case item of
      isc_info_blob_num_segments:
        NumSegments := GDSLibrary.isc_vax_integer(@results[i], item_length);
      isc_info_blob_max_segment:
        MaxSegmentSize := GDSLibrary.isc_vax_integer(@results[i], item_length);
      isc_info_blob_total_length:
        TotalSize := GDSLibrary.isc_vax_integer(@results[i], item_length);
      isc_info_blob_type:
        BlobType := GDSLibrary.isc_vax_integer(@results[i], item_length);
    end;
    Inc(i, item_length);
  end;
end;

procedure ReadBlob(hBlobHandle: PISC_BLOB_HANDLE; Buffer: PByte; BlobSize: Long;
                   GDSLibrary : IGDSLibrary);
var
  CurPos: Long;
  BytesRead, SegLen: UShort;
  LocalBuffer: PByte;
begin
  CurPos := 0;
  LocalBuffer := Buffer;
  SegLen := UShort(DefaultBlobSegmentSize);
  while (CurPos < BlobSize) do
  begin
    if (CurPos + SegLen > BlobSize) then
      SegLen := BlobSize - CurPos;
    if not ((GDSLibrary.isc_get_segment(StatusVector, hBlobHandle, @BytesRead, SegLen,
                             LocalBuffer) = 0) or
            (StatusVectorArray[1] = isc_segment)) then
      IBDatabaseError(GDSLibrary);
    Inc(LocalBuffer, BytesRead);
    Inc(CurPos, BytesRead);
    BytesRead := 0;
  end;
end;

procedure WriteBlob(hBlobHandle: PISC_BLOB_HANDLE; Buffer: PByte;
  BlobSize: Long; GDSLibrary : IGDSLibrary);
var
  CurPos, SegLen: Long;
begin
  CurPos := 0;
  SegLen := DefaultBlobSegmentSize;
  while (CurPos < BlobSize) do
  begin
    if (CurPos + SegLen > BlobSize) then
      SegLen := BlobSize - CurPos;
     if GDSLibrary.isc_put_segment(StatusVector, hBlobHandle, SegLen,
         PByte(@Buffer[CurPos])) > 0 then
      IBDatabaseError(GDSLibrary);
    Inc(CurPos, SegLen);
  end;
end;


{ TIBBlobStream }
constructor TIBBlobStream.Create();
begin
  inherited Create;
  FBase := TIBBase.Create(Self);
  FBuffer := nil;
  FBlobSize := 0;
end;

destructor TIBBlobStream.Destroy;
begin
  if (FHandle <> nil) and
     (Call(FBase.Database.GDSLibrary.isc_close_blob(StatusVector, @FHandle), False) > 0) then
    IBDataBaseError(FBase.Database.GDSLibrary);
  FBase.DisposeOf;
  FBase := nil;
  SetSize(0);
  inherited Destroy;
end;

function TIBBlobStream.Call(ErrCode: ISC_STATUS; RaiseError: Boolean): ISC_STATUS;
begin
  result := 0;
  if Transaction <> nil then
    result := Transaction.Call(ErrCode, RaiseError)
  else
    if RaiseError and (ErrCode > 0) then
      IBDataBaseError(FBase.Database.GDSLibrary);
end;

procedure TIBBlobStream.CheckReadable;
begin
  if FMode = bmWrite then
    IBError(ibxeBlobCannotBeRead, [nil]);
end;

procedure TIBBlobStream.CheckWritable;
begin
  if FMode = bmRead then
    IBError(ibxeBlobCannotBeWritten, [nil]);
end;

procedure TIBBlobStream.CloseBlob;
begin
  Finalize;
  if (FHandle <> nil) and
     (Call(FBase.Database.GDSLibrary.isc_close_blob(StatusVector, @FHandle), False) > 0) then
    IBDataBaseError(FBase.Database.GDSLibrary);
end;

procedure TIBBlobStream.CreateBlob;
begin
  CheckWritable;
  FBlobID.gds_quad_high := 0;
  FBlobID.gds_quad_low := 0;
  Truncate;
end;

procedure TIBBlobStream.EnsureBlobInitialized;
begin
  if not FBlobInitialized then
    case FMode of
      bmWrite:
        CreateBlob;
      bmReadWrite: begin
        if (FBlobID.gds_quad_high = 0) and
           (FBlobID.gds_quad_low = 0) then
          CreateBlob
        else
          OpenBlob;
      end;
      else
        OpenBlob;
    end;
  FBlobInitialized := True;
end;

procedure TIBBlobStream.Finalize;
begin
  if (not FBlobInitialized) or (FMode = bmRead) then
    exit;
  { need to start writing to a blob, create one }
  Call(FBase.Database.GDSLibrary.isc_create_blob2(StatusVector, DBHandle, TRHandle, @FHandle, @FBlobID,
                       0, nil), True);
  IBX.IBBlob.WriteBlob(@FHandle, FBuffer, FBlobSize, FBase.Database.GDSLibrary);
  Call(FBase.Database.GDSLibrary.isc_close_blob(StatusVector, @FHandle), True);
  FModified := False;
end;

procedure TIBBlobStream.GetBlobInfo;
var
  iBlobSize: Long;
begin
  IBX.IBBlob.GetBlobInfo(@FHandle, FBlobNumSegments, FBlobMaxSegmentSize,
    iBlobSize, FBlobType, FBase.Database.GDSLibrary);
  SetSize(iBlobSize);
end;

function TIBBlobStream.GetDatabase: TIBDatabase;
begin
  result := FBase.Database;
end;

function TIBBlobStream.GetDBHandle: PISC_DB_HANDLE;
begin
  result := FBase.DBHandle;
end;

function TIBBlobStream.GetTransaction: TIBTransaction;
begin
  result := FBase.Transaction;
end;

function TIBBlobStream.GetTRHandle: PISC_TR_HANDLE;
begin
  result := FBase.TRHandle;
end;

procedure TIBBlobStream.LoadFromFile(Filename: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TIBBlobStream.LoadFromStream(Stream: TStream);
begin
  CheckWritable;
  EnsureBlobInitialized;
  Stream.Position := 0;
  SetSize(Stream.Size);
  if FBlobSize <> 0 then
    Stream.ReadBuffer(FBuffer^, FBlobSize);
  FModified := True;
end;

procedure TIBBlobStream.OpenBlob;
begin
  CheckReadable;
  Call(FBase.Database.GDSLibrary.isc_open_blob2(StatusVector, DBHandle, TRHandle, @FHandle,
                     @FBlobID, 0, nil), True);
  try
    GetBlobInfo;
    SetSize(FBlobSize);
    IBX.IBBlob.ReadBlob(@FHandle, FBuffer, FBlobSize, FBase.Database.GDSLibrary);
  except
    Call(FBase.Database.GDSLibrary.isc_close_blob(StatusVector, @FHandle), False);
    raise;
  end;
  Call(FBase.Database.GDSLibrary.isc_close_blob(StatusVector, @FHandle), True);
end;

function TIBBlobStream.Read(var Buffer; Count: Longint): Longint;
begin
  CheckReadable;
  EnsureBlobInitialized;
  if (Count <= 0) then
  begin
    result := 0;
    exit;
  end;
  if (FPosition + Count > FBlobSize) then
    result := FBlobSize - FPosition
  else
    result := Count;
  Move(FBuffer[FPosition], Buffer, result);
  Inc(FPosition, Result);
end;

procedure TIBBlobStream.SaveToFile(Filename: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TIBBlobStream.SaveToStream(Stream: TStream);
begin
  CheckReadable;
  EnsureBlobInitialized;
  if FBlobSize <> 0 then
  begin
    Seek(0, soFromBeginning);
    Stream.WriteBuffer(FBuffer^, FBlobSize);
  end;
end;

function TIBBlobStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  EnsureBlobInitialized;
  case Origin of
    soFromBeginning     : FPosition := Offset;
    soFromCurrent	: Inc(FPosition, Offset);
    soFromEnd           : FPosition := FBlobSize + Offset;
  end;
  result := FPosition;
end;

procedure TIBBlobStream.SetBlobID(Value: TISC_QUAD);
begin
  System.Move(Value, FBlobID, SizeOf(TISC_QUAD));
  FBlobInitialized := False;
end;

procedure TIBBlobStream.SetDatabase(Value: TIBDatabase);
begin
  FBase.Database := Value;
  FBlobInitialized := False;
end;

procedure TIBBlobStream.SetMode(Value: TBlobStreamMode);
begin
  FMode := Value;
  FBlobInitialized := False;
end;

procedure TIBBlobStream.SetSize(NewSize: Longint);
begin
  if (NewSize <> FBlobSize) then
  begin
    if Assigned(FBuffer) then
      ReallocMem(FBuffer, NewSize)
    else
      GetMem(FBuffer, NewSize);
    FBlobSize := NewSize;
    if NewSize = 0 then
      FBuffer := nil;
  end;
end;

procedure TIBBlobStream.SetTransaction(Value: TIBTransaction);
begin
  FBase.Transaction := Value;
  FBlobInitialized := False;
end;

procedure TIBBlobStream.Truncate;
begin
  SetSize(0);
end;

function TIBBlobStream.Write(const Buffer; Count: Longint): Longint;
begin
  CheckWritable;
  EnsureBlobInitialized;
  result := Count;
  if Count <= 0 then
    exit;
  if (FPosition + Count > FBlobSize) then
    SetSize(FPosition + Count);
  Move(Buffer, FBuffer[FPosition], Count);
  Inc(FPosition, Count);
  FModified := True;
end;

procedure TIBBlobStream.Cancel;
begin
  if (not FBlobInitialized) or (FMode = bmRead) then
    exit;
  if FModified then
    OpenBlob;
  FModified := False;
end;

end.
