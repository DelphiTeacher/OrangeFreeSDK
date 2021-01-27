unit uTaoBaoAuth;

interface

uses
  Windows,
  SysUtils,
  Classes,
  StrUtils,
  DateUtils,
  Dialogs,
  Forms,
  Controls,
  XMLIntf,
  XMLDoc,
  ActiveX,
  Variants,
  ExtCtrls,
  EncdDecd,
//  SuperObject,
  uTaoBaoAPIParam,
  uTaoBaoPublic,
  IdHash,
  IdHMACSHA1,
  IdGlobal,
  IdHashMessageDigest;


type
  //签名算法类型
  TSignType=(stHMAC_SHA1);
  //API的调用方式,使用Json还是Xml文档
  TCallAPIFormat=(cpsJson,cpsXml);
  TCallAPIHTTPRequestMethod=(rmGet,rmPost);
  TCallAPIHTTPRequestMethods=set of TCallAPIHTTPRequestMethod;

const
  //签名算法类型名称
  Const_SignTypeNames:array [TSignType] of String=('HMAC-SHA1');
  Const_CallAPIFormatNames:array [TCallAPIFormat] of String=('JSON','XML');
  Const_CallAPIHTTPRequestMethods:array [TCallAPIHTTPRequestMethod] of String=('GET','POST');

type
  THttpControl=class
  private
    //临界区
    FHttpLock:TRTLCriticalSection;
  public
    procedure Lock;
    procedure UnLock;
    constructor Create;virtual;
    destructor Destroy;override;
    function Get(const HttpUrl:String;const TempFileName:String):String;virtual;abstract;
    function Post(const HttpUrl:String;const TempFileName:String):String;virtual;abstract;
  end;



//{$IFDEF VER210}
//MD5算法
//function EncryptMD5(Input:String):String;
function EncryptHMAC_SHA1(Key:String;Input:String):String;
//{$ELSE}
////MD5算法
//function EncryptMD5(Input:WideString):String;
//{$ENDIF}

implementation

//{$IFDEF VER210}
//MD5算法
//function EncryptMD5(Input:String):String;
//var
//  StringStream:TStringStream;
//  AMD5:TIdHashMessageDigest5;
//begin
//  AMD5:=TIdHashMessageDigest5.Create;
//  StringStream:=TStringStream.Create(Input,65001);
//  try
//    Result:=AMD5.HashStreamAsHex(StringStream);
//  finally
//    StringStream.Free;
//  end;
//end;

function EncryptHMAC_SHA1(Key:String;Input:String):String;
var
  AStringStream:TStringStream;
  AHMACSHA1:TIdHMACSHA1;
  ABuffer:TIdBytes;
  AResult:TIdBytes;
  AInputStream:TMemoryStream;
  AResultStream:TStringStream;
begin
  AHMACSHA1:=TIdHMACSHA1.Create;
  AStringStream:=TStringStream.Create(Input,65001);
  AInputStream:=TMemoryStream.Create;
  AResultStream:=TStringStream.Create('',65001);
  try
    AStringStream.Position:=0;
    SetLength(ABuffer,AStringStream.Size);

    AHMACSHA1.Key:=ToBytes(Key);
    AStringStream.Read(ABuffer[0],AStringStream.Size);

    AResult:=AHMACSHA1.HashValue(ABuffer);

    AInputStream.Write(AResult[0],Length(AResult));
    AInputStream.Position:=0;
    EncodeStream(AInputStream,AResultStream);


    Result:=AResultStream.DataString;
  finally
    AStringStream.Free;
    AInputStream.Free;
    AResultStream.Free;
    AHMACSHA1.Free;
  end;
end;

//{$ELSE}
////MD5算法
//function EncryptMD5(Input:WideString):String;
//var
//  UTF8Stream:TMemoryStream;
//  AMD5:TIdHashMessageDigest5;
//  LW:T4x4LongWordRecord;
//  PAnsi:PAnsiChar;
//  PWide:PWideChar;
//  LI:Integer;
//  L:Integer;
//begin
//  AMD5:=TIdHashMessageDigest5.Create;
//  LI:=Length(Input);
//  PAnsi:=GetMemory(LI*2);
//  ZeroMemory(PAnsi,LI*2);
//  PWide:=GetMemory(LI*2);
//  ZeroMemory(PWide,LI*2);
//
//  CopyMemory(PWide,@Input[1],LI*2);
//  L:=WideCharToMultiByte(65001,0,
//              PWide,LI,
//              PAnsi,LI*2,
//              nil,nil);
//
//  UTF8Stream:=TMemoryStream.Create;
//  try
//    UTF8Stream.Write(PAnsi^,L);
//    UTF8Stream.Position:=0;
//
//    LW:=AMD5.HashValue(UTF8Stream);
//    Result:=AMD5.AsHex(LW);
//
//  finally
//    UTF8Stream.Free;
//    FreeMemory(PAnsi);
//    FreeMemory(PWide);
//  end;
//end;
//{$ENDIF}



{ THttpControl }

constructor THttpControl.Create;
begin
  InitializeCriticalSection(FHttpLock);
end;

destructor THttpControl.Destroy;
begin
  DeleteCriticalSection(FHttpLock);
  inherited;
end;

procedure THttpControl.Lock;
begin
  EnterCriticalSection(FHttpLock);
end;

procedure THttpControl.UnLock;
begin
  LeaveCriticalSection(FHttpLock);
end;



end.


