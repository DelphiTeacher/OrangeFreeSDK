unit uWxpayHttps_Common;

interface


//用于低版本Delphi
//低版本的IndySSL支持的版本太低,不稳定
//因此是需要调用PayHelp.dll来实现
//{$DEFINE USE_DLL_MODE}



//{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MSWINDOWS) }
//  {$DEFINE FMX}
//{$ENDIF}

//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}




uses
  SysUtils,
  Classes,

  {$IFDEF FMX}
  FMX.Types,
  {$ENDIF}


  {$IFDEF IOS}
    //默认是要的
    //SSL
    //IOS下使用SSL静态库,生成预付单号
    {$IF CompilerVersion >= 34.0}//D10.4
    IdSSLOpenSSLHeaders_static_D10_4,
    {$ELSE}
    IdSSLOpenSSLHeaders_static,
    {$ENDIF}
  {$ENDIF IOS}


  {$IF CompilerVersion >= 30.0}//XE10
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  {$IFEND}



  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  {$IFDEF IN_ORANGESDK}
  {$ELSE}
  {$ENDIF}
  {$IFDEF IN_ORANGESDK}
  uBaseLog_Copy,
  {$ELSE}
  uBaseLog,
  {$ENDIF}

  IdSSLOpenSSL,
  IdSSLOpenSSLHeaders,

  IdIOHandler,
  IdIOHandlerSocket;




//IOS+Windows Indy SLL,但是在Android上容易发生SSL.so不存在的问题
function WeichatHttpsGet_Indy(AUrl:String):String;overload;
function WeichatHttpsGet_Indy(AUrl:String;AResponseStream:TStream):Boolean;overload;

function WeichatHttpsPost_Indy(AUrl:String;AContent:String):String;overload;
function WeichatHttpsPost_Indy(AUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;



{$IFNDEF USE_DLL_MODE}//高版本Delphi

    //IOS+Windows Indy SLL,但是在Android上容易发生SSL.so不存在的问题
    function DoWeichatHttpsGet_Indy(AUrl:String):String;overload;
    function DoWeichatHttpsGet_Indy(AUrl:String;AResponseStream:TStream):Boolean;overload;

    function DoWeichatHttpsPost_Indy(AUrl:String;AContent:String):String;overload;
    function DoWeichatHttpsPost_Indy(AUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;


    //用NetHttpClient会提示要求证书,在Android上面
    //支持Windows,IOS上获取微信的个人信息,
    {$IF CompilerVersion>=21.0}
    function WeichatHttpsGet_NetHttpClient(AUrl:String):String;overload;
    function WeichatHttpsGet_NetHttpClient(AUrl:String;AResponseStream:TStream):Boolean;overload;
    function WeichatHttpsPost_NetHttpClient(AUrl:String;AContent:String):String;overload;
    function WeichatHttpsPost_NetHttpClient(AUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;
    {$IFEND}



    {$IFDEF MSWINDOWS}
    function WeichatHttpsGet_Indy_ByFile(AUrl:PAnsiChar):Boolean;
    function WeichatHttpsPost_Indy_ByFile(AUrl:PAnsiChar):Boolean;

    function WeichatHttpsPost_Indy_NeedCert_OnWindows(
                                      AUrl:String;
                                      AContent:String;
                                      ACertFilePath:String;
                                      AKeyFilePath:String):String;
    {$ENDIF}

{$ENDIF}



{$IFDEF USE_DLL_MODE}//低版本Delphi
    function WeichatHttpsGet_Indy_ByFile(AUrl:PAnsiChar):Boolean;
      external 'PayHelp.dll' name 'WeichatHttpsGet_Indy_ByFile';
    function WeichatHttpsPost_Indy_ByFile(AUrl:PAnsiChar):Boolean;
      external 'PayHelp.dll' name 'WeichatHttpsPost_Indy_ByFile';

    function DoWeichatHttpsGet_Indy_By_DLL(AUrl:AnsiString):AnsiString;overload;
    function DoWeichatHttpsGet_Indy_By_DLL(AUrl:AnsiString;AResponseStream:TStream):Boolean;overload;

    function DoWeichatHttpsPost_Indy_By_DLL(AUrl:AnsiString;AContent:AnsiString):AnsiString;overload;
    function DoWeichatHttpsPost_Indy_By_DLL(AUrl:AnsiString;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;
{$ENDIF}


implementation


function WeichatHttpsGet_Indy(AUrl:String):String;
begin
  {$IFDEF USE_DLL_MODE}//用于低版本Delphi
  Result:=DoWeichatHttpsGet_Indy_By_DLL(AUrl);
  {$ELSE}
  Result:=DoWeichatHttpsGet_Indy(AUrl);
  {$ENDIF}
end;

function WeichatHttpsGet_Indy(AUrl:String;AResponseStream:TStream):Boolean;
begin
  {$IFDEF USE_DLL_MODE}//用于低版本Delphi
  Result:=DoWeichatHttpsGet_Indy_By_DLL(AUrl,AResponseStream);
  {$ELSE}
  Result:=DoWeichatHttpsGet_Indy(AUrl,AResponseStream);
  {$ENDIF}
end;

function WeichatHttpsPost_Indy(AUrl:String;AContent:String):String;
begin
  {$IFDEF USE_DLL_MODE}//用于低版本Delphi
  Result:=DoWeichatHttpsPost_Indy_By_DLL(AUrl,AContent);
  {$ELSE}
  Result:=DoWeichatHttpsPost_Indy(AUrl,AContent);
  {$ENDIF}
end;

function WeichatHttpsPost_Indy(AUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;
begin
  {$IFDEF USE_DLL_MODE}//用于低版本Delphi
  Result:=DoWeichatHttpsPost_Indy_By_DLL(AUrl,ARequestStream,AResponseStream);
  {$ELSE}
  Result:=DoWeichatHttpsPost_Indy(AUrl,ARequestStream,AResponseStream);
  {$ENDIF}
end;





{$IFNDEF USE_DLL_MODE}


{$IFDEF MSWINDOWS}
//用于SSL证书验证,仅用于Windows
type
  TSSLCertificateProcess=class
    function DoSSLIOHandlerSocketOpenSSLVerifyPeer(Certificate: TIdX509; AOk: Boolean;
      ADepth, AError: Integer): Boolean;
    function DoSSLIOHandlerSocketOpenSSLVerifyPeer_D2007(Certificate: TIdX509; AOk: Boolean): Boolean;
  end;


{ TSSLCertificateProcess }

function TSSLCertificateProcess.DoSSLIOHandlerSocketOpenSSLVerifyPeer(Certificate: TIdX509;
  AOk: Boolean; ADepth, AError: Integer): Boolean;
begin
  Result:=True;
end;

function TSSLCertificateProcess.DoSSLIOHandlerSocketOpenSSLVerifyPeer_D2007(Certificate: TIdX509;
  AOk: Boolean): Boolean;
begin
  Result:=True;
end;

function WeichatHttpsPost_Indy_NeedCert_OnWindows(
                                  AUrl:String;
                                  AContent:String;
                                  ACertFilePath:String;
                                  AKeyFilePath:String):String;
var
  APackageStream:TStringStream;
  AResponseStream:TStringStream;
  AIdHttp:TIdHttp;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
  ASSLCertificateProcess:TSSLCertificateProcess;
begin
  Result:='';
  ASSLCertificateProcess:=TSSLCertificateProcess.Create;
  IdSSLIOHandlerSocketOpenSSL1:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode := [sslvrfPeer];
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method     := sslvTLSv1;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile   := ACertFilePath;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile    := AKeyFilePath;
  {$IF CompilerVersion<21.0}
  IdSSLIOHandlerSocketOpenSSL1.OnVerifyPeer := ASSLCertificateProcess.DoSSLIOHandlerSocketOpenSSLVerifyPeer_D2007;
  {$ELSE}
  IdSSLIOHandlerSocketOpenSSL1.OnVerifyPeer := ASSLCertificateProcess.DoSSLIOHandlerSocketOpenSSLVerifyPeer;
  {$IFEND}


  
  AIdHttp:=TIdHttp.Create(nil);
  AIdHttp.IOHandler:=IdSSLIOHandlerSocketOpenSSL1;
  try

    //生成XML包
    APackageStream:=TStringStream.Create(AContent{$IF CompilerVersion>=21.0},TEncoding.UTF8{$IFEND});
    AResponseStream:=TStringStream.Create(''{$IF CompilerVersion>=21.0},TEncoding.UTF8{$IFEND});
    try

      AIdHttp.Post(AUrl,
                    APackageStream,
                    AResponseStream);

      Result:=AResponseStream.DataString;

    finally
      FreeAndNil(APackageStream);
      FreeAndNil(AResponseStream);
    end;

  finally
    FreeAndNil(ASSLCertificateProcess);
    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    FreeAndNil(AIdHttp);
  end;
end;

function WeichatHttpsGet_Indy_ByFile(AUrl:PAnsiChar):Boolean;
var
  AIdHttp:TIdHttp;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
  AResponseStream:TMemoryStream;
  AApplicationDir:String;
begin

  Result:=False;

  AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));


  IdSSLIOHandlerSocketOpenSSL1:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  AIdHttp:=TIdHttp.Create(nil);
  AIdHttp.IOHandler:=IdSSLIOHandlerSocketOpenSSL1;
  AResponseStream:=TMemoryStream.Create;
  try

      //生成XML包
      AIdHttp.Get(AUrl,AResponseStream);

      AResponseStream.Position:=0;
      AResponseStream.SaveToFile(AApplicationDir+'AResponseStream.txt');

      Result:=True;
  finally
    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    FreeAndNil(AIdHttp);
    FreeAndNil(AResponseStream);
  end;
end;

function WeichatHttpsPost_Indy_ByFile(AUrl:PAnsiChar):Boolean;
var
  ARequestStream:TMemoryStream;
  AResponseStream:TMemoryStream;
  AApplicationDir:String;
begin
  Result:=False;

  AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

  if FileExists(AApplicationDir+'ARequestStream.txt') then
  begin
      ARequestStream:=TMemoryStream.Create;
      AResponseStream:=TMemoryStream.Create;
      try
        ARequestStream.LoadFromFile(AApplicationDir+'ARequestStream.txt');
        ARequestStream.Position:=0;

        Result:=DoWeichatHttpsPost_Indy(AUrl,ARequestStream,AResponseStream);

        AResponseStream.Position:=0;
        AResponseStream.SaveToFile(AApplicationDir+'AResponseStream.txt');
      finally
        FreeAndNil(ARequestStream);
        FreeAndNil(AResponseStream);
      end;
  end;

end;
{$ENDIF MSWINDOWS}


function DoWeichatHttpsGet_Indy(AUrl:String):String;
var
  AResponseStream:TStringStream;
  AIdHttp:TIdHttp;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
begin

  Result:='';
  IdSSLIOHandlerSocketOpenSSL1:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  AIdHttp:=TIdHttp.Create(nil);
  AIdHttp.IOHandler:=IdSSLIOHandlerSocketOpenSSL1;
    AResponseStream:=TStringStream.Create(''{$IF CompilerVersion>=21.0},TEncoding.UTF8{$IFEND});
  try
    try

        AIdHttp.Get(AUrl,AResponseStream);

        AResponseStream.Position:=0;
        Result:=AResponseStream.DataString;
    except
      on E:Exception do
      begin
        HandleException(E,'OrangeUI DoWeichatHttpsGet_Indy '+E.Message);
      end;
    end;

  finally
      FreeAndNil(AResponseStream);
    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    FreeAndNil(AIdHttp);
  end;
end;

function DoWeichatHttpsGet_Indy(AUrl:String;AResponseStream:TStream):Boolean;
var
  AIdHttp:TIdHttp;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
begin

  Result:=False;
  IdSSLIOHandlerSocketOpenSSL1:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  AIdHttp:=TIdHttp.Create(nil);
  AIdHttp.IOHandler:=IdSSLIOHandlerSocketOpenSSL1;
  try
    try

      AIdHttp.Get(AUrl,AResponseStream);
      AResponseStream.Position:=0;

      Result:=True;
    except
      on E:Exception do
      begin
        HandleException(E,'OrangeUI DoWeichatHttpsGet_Indy '+E.Message);
      end;
    end;
  finally
    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    FreeAndNil(AIdHttp);
  end;
end;

function DoWeichatHttpsPost_Indy(AUrl:String;AContent:String):String;
var
  APackageStream:TStringStream;
  AResponseStream:TStringStream;
  AIdHttp:TIdHttp;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
begin

  Result:='';
  IdSSLIOHandlerSocketOpenSSL1:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  AIdHttp:=TIdHttp.Create(nil);
  AIdHttp.IOHandler:=IdSSLIOHandlerSocketOpenSSL1;
  try
    APackageStream:=TStringStream.Create(AContent{$IF CompilerVersion>=21.0},TEncoding.UTF8{$IFEND});
    AResponseStream:=TStringStream.Create(''{$IF CompilerVersion>=21.0},TEncoding.UTF8{$IFEND});
    try

        APackageStream.Position:=0;
        DoWeichatHttpsPost_Indy(AUrl,APackageStream,AResponseStream);

        AResponseStream.Position:=0;
        Result:=AResponseStream.DataString;
    finally
      FreeAndNil(APackageStream);
      FreeAndNil(AResponseStream);
    end;


  finally
    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    FreeAndNil(AIdHttp);
  end;
end;

function DoWeichatHttpsPost_Indy(AUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;
var
  AIdHttp:TIdHttp;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
begin

  Result:=False;
  IdSSLIOHandlerSocketOpenSSL1:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  AIdHttp:=TIdHttp.Create(nil);
  AIdHttp.IOHandler:=IdSSLIOHandlerSocketOpenSSL1;
  try

    ARequestStream.Position:=0;
    AIdHttp.Post(AUrl,ARequestStream,AResponseStream);

    AResponseStream.Position:=0;

    Result:=True;
  finally
    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    FreeAndNil(AIdHttp);
  end;
end;

{$IF CompilerVersion>=21.0}
function WeichatHttpsGet_NetHttpClient(AUrl:String):String;
var
  AResponseStream:TStringStream;
  ANetHttpClient:TNetHttpClient;
begin

  Result:='';

  ANetHttpClient:=TNetHttpClient.Create(nil);
  try

    //生成XML包
    AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
    try
      ANetHttpClient.Get(AUrl,AResponseStream);
      Result:=AResponseStream.DataString;
    finally
      FreeAndNil(AResponseStream);
    end;

  finally
    FreeAndNil(ANetHttpClient);
  end;
end;

function WeichatHttpsGet_NetHttpClient(AUrl:String;AResponseStream:TStream):Boolean;
var
  ANetHttpClient:TNetHttpClient;
  IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
begin

  Result:=False;
  IdSSLIOHandlerSocketOpenSSL1:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  ANetHttpClient:=TNetHttpClient.Create(nil);
  try
    ANetHttpClient.Get(AUrl,AResponseStream);
    Result:=True;
  finally
    FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
    FreeAndNil(ANetHttpClient);
  end;
end;

function WeichatHttpsPost_NetHttpClient(AUrl:String;AContent:String):String;
var
  APackageStream:TStringStream;
  AResponseStream:TStringStream;
  ANetHttpClient:TNetHttpClient;
begin

  Result:='';

  ANetHttpClient:=TNetHttpClient.Create(nil);
  try
    APackageStream:=TStringStream.Create(AContent,TEncoding.UTF8);
    AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
    try
      ANetHttpClient.Post(AUrl,APackageStream,AResponseStream);

      Result:=AResponseStream.DataString;
    finally
      FreeAndNil(APackageStream);
      FreeAndNil(AResponseStream);
    end;


  finally
    FreeAndNil(ANetHttpClient);
  end;
end;

function WeichatHttpsPost_NetHttpClient(AUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;
var
  ANetHttpClient:TNetHttpClient;
begin

  Result:=False;

  ANetHttpClient:=TNetHttpClient.Create(nil);
  try
    ARequestStream.Position:=0;
    ANetHttpClient.Post(AUrl,ARequestStream,AResponseStream);

    AResponseStream.Position:=0;
    Result:=True;
  finally
    FreeAndNil(ANetHttpClient);
  end;
end;
{$IFEND}

{$ENDIF}



{$IFDEF USE_DLL_MODE}
function DoWeichatHttpsGet_Indy_By_DLL(AUrl:AnsiString):AnsiString;
var
  AFileStream:TFileStream;
  AReponseStream:TStringStream;

  AApplicationDir:String;
begin
  Result:='';

  AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

  if WeichatHttpsGet_Indy_ByFile(PAnsiChar(AUrl)) then
  begin
      AReponseStream:=TStringStream.Create('');
      AFileStream:=TFileStream.Create(AApplicationDir+'AResponseStream.txt',fmOpenRead or fmShareDenyNone);
      try
        AReponseStream.CopyFrom(AFileStream,AFileStream.Size);

        AReponseStream.Position:=0;
        Result:=AReponseStream.DataString;
      finally
        FreeAndNil(AReponseStream);
        FreeAndNil(AFileStream);
      end;
  end;
end;

function DoWeichatHttpsGet_Indy_By_DLL(AUrl:AnsiString;AResponseStream:TStream):Boolean;
var
  AFileStream:TFileStream;
  AApplicationDir:String;
begin
  Result:=False;

  AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

  if WeichatHttpsGet_Indy_ByFile(PAnsiChar(AUrl)) then
  begin
    AFileStream:=TFileStream.Create(AApplicationDir+'AResponseStream.txt',fmOpenRead or fmShareDenyNone);
    try
      AResponseStream.Position:=0;
      AResponseStream.CopyFrom(AFileStream,AFileStream.Size);

      AResponseStream.Position:=0;
      Result:=True;
    finally
      FreeAndNil(AFileStream);
    end;
  end;
end;

function DoWeichatHttpsPost_Indy_By_DLL(AUrl:AnsiString;AContent:AnsiString):AnsiString;
var
  ARequestStream:TStringStream;
  AFileStream:TFileStream;
  AResponseStream:TStringStream;
  AApplicationDir:String;
  AUTF8Str:UTF8String;
begin
  Result:='';

  AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

  ARequestStream:=TStringStream.Create('');
  try
  AFileStream:=TFileStream.Create(AApplicationDir+'ARequestStream.txt',fmCreate or fmOpenWrite);
  try
    ARequestStream.Position:=0;
    //UTF8编码过的一下
    AUTF8Str:=AnsiToUTF8(AContent);
    ARequestStream.WriteBuffer(AUTF8Str[1],Length(AUTF8Str));
    ARequestStream.Position:=0;

    AFileStream.CopyFrom(ARequestStream,ARequestStream.Size);
  finally
    FreeAndNil(AFileStream);
  end;


  if WeichatHttpsPost_Indy_ByFile(PAnsiChar(AUrl)) then
  begin
      AResponseStream:=TStringStream.Create('');
      AFileStream:=TFileStream.Create(AApplicationDir+'AResponseStream.txt',fmOpenRead or fmShareDenyNone);
      try
          AResponseStream.Position:=0;
          AResponseStream.CopyFrom(AFileStream,AFileStream.Size);

          Result:=AResponseStream.DataString;
      finally
        FreeAndNil(AResponseStream);
        FreeAndNil(AFileStream);
      end;
  end;

  finally
    FreeAndNil(ARequestStream);
  end;

end;

function DoWeichatHttpsPost_Indy_By_DLL(AUrl:AnsiString;ARequestStream:TStream;AResponseStream:TStream):Boolean;
var
  AMemoryStream:TMemoryStream;
  AFileStream:TFileStream;
  AApplicationDir:String;
begin
  Result:=False;

  AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

  AMemoryStream:=TMemoryStream.Create;
  try
    ARequestStream.Position:=0;
    AMemoryStream.CopyFrom(ARequestStream,ARequestStream.Size);
    AMemoryStream.Position:=0;
    AMemoryStream.SaveToFile(AApplicationDir+'ARequestStream.txt');
  finally
    FreeAndNil(AMemoryStream);
  end;


  if WeichatHttpsPost_Indy_ByFile(PAnsiChar(AUrl)) then
  begin
      AFileStream:=TFileStream.Create(AApplicationDir+'AResponseStream.txt',fmOpenRead or fmShareDenyNone);
      try
        AResponseStream.Position:=0;
        AResponseStream.CopyFrom(AFileStream,AFileStream.Size);

        AResponseStream.Position:=0;
        Result:=True;
      finally
        FreeAndNil(AFileStream);
      end;
  end;
end;
{$ENDIF}



end.
