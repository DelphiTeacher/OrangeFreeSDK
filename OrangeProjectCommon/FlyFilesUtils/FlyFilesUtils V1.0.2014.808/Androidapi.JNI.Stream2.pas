unit Androidapi.JNI.Stream2;

(* ************************************************ *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　设计：爱吃猪头肉 & Flying Wang 2013-11-07　　 *)
(*　　　　　　上面的版权声明请不要移除。　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ************************************************ *)

interface

uses 
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;

type

  {Class forward declarations}
  JInputStreamReader = interface;
  JOutputStreamWriter = interface;
  JBufferedReader = interface;
  JBufferedWriter = interface;
{$IF CompilerVersion < 28.0} // < XE7
  JReader = interface;
{$ENDIF}
  JFileReader = interface;
  JFileWriter = interface;


{$IF CompilerVersion < 28.0} // < XE7
JReaderClass = interface(JObjectClass)
['{13734C0F-17EA-4132-B17E-8B8DBD24709D}']
end;

[JavaSignature('java/io/Reader')]
JReader = interface(JObject)
['{EA0970BF-9E21-47C6-BC7D-3E392B8030B2}']
  {Methods}
  procedure close; cdecl;
  procedure mark(readlimit: Integer); cdecl;
  function markSupported: Boolean; cdecl;
  function read: Integer; cdecl; overload;
  function read(buffer: TJavaArray<Byte>): Integer; cdecl; overload;
  function read(buffer: TJavaArray<Byte>; offset: Integer; length: Integer): Integer; cdecl; overload;
  function ready: Boolean; cdecl;
  procedure reset; cdecl; cdecl;
  function skip(byteCount: Int64): Int64; cdecl;
//  function read(target: JCharBuffer): Integer; cdecl; overload;
end;
TJReader = class(TJavaGenericImport<JReaderClass, JReader>) end;

{$ENDIF}

JInputStreamReaderClass = interface(JObjectClass)
['{D9D61C01-AE21-46E4-BDBE-5F4F41D73B93}']
  {Property Methods}
  {Methods}
  function init(ins: JInputStream): JInputStreamReader; cdecl; overload;
  function init(ins: JInputStream; charsetName: JString): JInputStreamReader; cdecl; overload;
//  function init(ins: JInputStream; dec: JCharsetDecoder): JInputStreamReader; cdecl; overload;
//  function init(ins: JInputStream; charset: JCharset): JInputStreamReader; cdecl; overload;
  {Properties}
end;

[JavaSignature('java/io/InputStreamReader')]
JInputStreamReader = interface(JReader)
['{A9FB0E9D-EBAB-4040-A64B-DE8C8FD3F176}']
  {Methods}
  procedure close; cdecl;
  function getEncoding: JString; cdecl;
  function read: Integer; cdecl; overload;
  function read(buffer: TJavaArray<Byte>; offset: Integer; length: Integer): Integer; cdecl; overload;
  function ready: Boolean; cdecl;
end;
TJInputStreamReader = class(TJavaGenericImport<JInputStreamReaderClass, JInputStreamReader>) end;

JOutputStreamWriterClass = interface(JObjectClass)
['{85F2F46C-4CE0-44CC-B000-1968F3C9E0C9}']
  {Property Methods}
  {Methods}
  function init(os: JOutputStream): JOutputStreamWriter; cdecl; overload;
  function init(os: JOutputStream; charsetName: JString): JOutputStreamWriter; cdecl; overload;
//  function init(os: JOutputStream; dec: JCharsetDecoder): JOutputStreamWriter; cdecl; overload;
//  function init(os: JOutputStream; charset: JCharset): JOutputStreamWriter; cdecl; overload;
  {Properties}
end;

[JavaSignature('java/io/OutputStreamWriter')]
JOutputStreamWriter = interface(JWriter)
['{ED87031D-BA60-468B-8C66-31F77B70C1DE}']
  {Methods}
  procedure close; cdecl;
  procedure flush; cdecl;
  function getEncoding: JString; cdecl;
  procedure write(oneByte: Integer); cdecl; overload;
  procedure write(buffer: TJavaArray<Byte>; offset: Integer; length: Integer); cdecl; overload;
  procedure write(str: JString; offset: Integer; count: Integer); cdecl; overload;
  function checkError: Boolean; cdecl;
end;
TJOutputStreamWriter = class(TJavaGenericImport<JOutputStreamWriterClass, JOutputStreamWriter>) end;


JBufferedReaderClass = interface(JObjectClass)
['{CF91A733-57ED-4734-9703-7BA4DE31F82A}']
  {Property Methods}
  {Methods}
  function init(inr: JReader): JBufferedReader; cdecl; overload;
  function init(inr: JReader; size: Integer): JBufferedReader; cdecl; overload;
  {Properties}
end;

[JavaSignature('java/io/BufferedReader')]
JBufferedReader = interface(JReader)
['{69F1BD5A-1B1F-4675-B2F3-0188FC2CAB23}']
  {Methods}
  procedure close; cdecl;
  procedure mark(readlimit: Integer); cdecl;
  function markSupported: Boolean; cdecl;
  procedure chompNewline; cdecl;
  function readLine: JString; cdecl;
  function read: Integer; cdecl; overload;
  function read(buffer: TJavaArray<Byte>; offset: Integer; length: Integer): Integer; cdecl; overload;
  function ready: Boolean; cdecl;
  procedure reset; cdecl; cdecl;
  function skip(byteCount: Int64): Int64; cdecl;
end;
TJBufferedReader = class(TJavaGenericImport<JBufferedReaderClass, JBufferedReader>) end;

JBufferedWriterClass = interface(JObjectClass)
['{A46FC0D3-88EA-4960-A5CE-D6CFD9928269}']
  {Property Methods}
  {Methods}
  function init(out: JWriter): JBufferedWriter; cdecl; overload;
  function init(out: JWriter; size: Integer): JBufferedWriter; cdecl; overload;
  {Properties}
end;

[JavaSignature('java/io/BufferedWriter')]
JBufferedWriter = interface(JWriter)
['{4932920E-DFCC-46E7-A8F7-2848B61406F8}']
  {Methods}
  procedure close; cdecl;
  procedure flush; cdecl;
  procedure newLine; cdecl;
  procedure write(oneByte: Integer); cdecl; overload;
  procedure write(buffer: TJavaArray<Byte>; offset: Integer; length: Integer); cdecl; overload;
  procedure write(str: JString; offset: Integer; count: Integer); cdecl; overload;
  function checkError: Boolean; cdecl;
end;
TJBufferedWriter = class(TJavaGenericImport<JBufferedWriterClass, JBufferedWriter>) end;

JFileReaderClass = interface(JObjectClass)
['{2FFD693B-5848-4A07-8755-3B7D32091229}']
  {Property Methods}
  {Methods}
  function init(afile: JFile): JFileReader; cdecl; overload;
  function init(fd: JFileDescriptor): JFileReader; cdecl; overload;
  function init(filename: JString): JFileReader; cdecl; overload;
  {Properties}
end;

[JavaSignature('java/io/FileReader')]
JFileReader = interface(JInputStreamReader)
['{C82322A5-EE43-4544-BAD7-DE41543F9EA9}']
  {Methods}
end;
TJFileReader = class(TJavaGenericImport<JFileReaderClass, JFileReader>) end;

JFileWriterClass = interface(JObjectClass)
['{66F0DA8E-9A61-48FE-B401-CA6E38585485}']
  {Property Methods}
  {Methods}
  function init(afile: JFile): JFileWriter; cdecl; overload;
  function init(afile: JFile; append: Boolean): JFileWriter; cdecl; overload;
  function init(fd: JFileDescriptor): JFileWriter; cdecl; overload;
  function init(filename: JString): JFileWriter; cdecl; overload;
  function init(filename: JString; append: Boolean): JFileWriter; cdecl; overload;
  {Properties}
end;

[JavaSignature('java/io/FileWriter')]
JFileWriter = interface(JOutputStreamWriter)
['{18EF0D14-3CD4-4F43-85B5-4C76C4C71A30}']
  {Methods}
end;
TJFileWriter = class(TJavaGenericImport<JFileWriterClass, JFileWriter>) end;

implementation

begin

end.


