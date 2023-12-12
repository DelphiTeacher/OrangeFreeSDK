unit uLinuxShell;

interface




{$IFDEF LINUX}
uses
  System.SysUtils,
  Posix.Base,
  Posix.Fcntl;

type
  TStreamHandle = pointer;

///  <summary>
///    Man Page: http://man7.org/linux/man-pages/man3/popen.3.html
///  </summary>
function popen(const command: MarshaledAString; const _type: MarshaledAString): TStreamHandle; cdecl; external libc name _PU + 'popen';

///  <summary>
///    Man Page: http://man7.org/linux/man-pages/man3/pclose.3p.html
///  </summary>
function pclose(filehandle: TStreamHandle): int32; cdecl; external libc name _PU + 'pclose';

///  <summary>
///    Man Page: http://man7.org/linux/man-pages/man3/fgets.3p.html
///  </summary>
function fgets(buffer: pointer; size: int32; Stream: TStreamHAndle): pointer; cdecl; external libc name _PU + 'fgets';

///  <summary>
///    Utility function to return a buffer of ASCII-Z data as a string.
///  </summary>
function BufferToString( Buffer: pointer; MaxSize: uint32 ): string;
function BufferLength( Buffer: pointer; MaxSize: uint32 ): uint32;

{$ENDIF}




implementation





{$IFDEF LINUX}
function BufferToString( Buffer: pointer; MaxSize: uint32 ): string;
var
  cursor: ^uint8;
  EndOfBuffer: nativeuint;
begin
  Result := '';
  if not assigned(Buffer) then begin
    exit;
  end;
  cursor := Buffer;
  EndOfBuffer := NativeUint(cursor) + MaxSize;
  while (NativeUint(cursor)<EndOfBuffer) and (cursor^<>0) do begin
    Result := Result + chr(cursor^);
  end;
end;

function BufferLength( Buffer: pointer; MaxSize: uint32 ): uint32;
var
  cursor: ^uint8;
  EndOfBuffer: nativeuint;
begin
  Result := 0;
  if not assigned(Buffer) then begin
    exit;
  end;
  cursor := Buffer;
  EndOfBuffer := NativeUint(cursor) + MaxSize;
  while (NativeUint(cursor)<EndOfBuffer) and (cursor^<>0) do begin
    Inc(Result);
    cursor := pointer( succ(NativeUInt(cursor)) );
  end;
end;
{$ENDIF}


//var
//  Handle: TStreamHandle;
//  Data: array[0..511] of uint8;

//begin
//  try
//    Handle := popen('/bin/ls -lart','r');
//    try
//      while fgets(@data[0],Sizeof(Data),Handle)<>nil do begin
//        Write(BufferToString(@Data[0],sizeof(Data)));
//      end;
//    finally
//      pclose(Handle);
//    end;
//  except
//    on E: Exception do
//      Writeln(E.ClassName, ': ', E.Message);
//  end;


end.
