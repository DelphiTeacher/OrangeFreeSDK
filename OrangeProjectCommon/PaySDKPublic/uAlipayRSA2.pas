//copyright delphiteacher QQ:452330643
//2015-08-08
//未经授权,严禁出售赠送或转上他人使用
//
unit uAlipayRSA2;


interface


//用于低版本Delphi,调用PayHelp.dll来实现RSA加密
//{$DEFINE USE_DLL_MODE}


//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
{$IFNDEF FMX}
{$IFNDEF VCL}
{$I FrameWork.inc}
{$ENDIF}
{$ENDIF}




uses
  SysUtils,
  StrUtils,

//  uBaseLog,
  {$IF CompilerVersion >= 30.0}//XE10
  NetEncoding,
  {$ELSE}
//  MD5_D7,
  {$IFEND}



  SyncObjs,
  uPayPublic,


  {$IFDEF IN_ORANGESDK}
  //在OrangeSDK包里面
  uFileCommon_Copy,
  {$ELSE}
  //在OrangeUI里面
  uFileCommon,
  {$ENDIF}


  //默认需要RSA签名方法
  {$IFDEF MSWINDOWS}
//      {$IFDEF USE_DLL_MODE}//用于低版本Delphi
      {$IF CompilerVersion >= 30.0}//XE10
      Leo.Cipher.SSL.OpenSSL,
      Leo.Cipher.RSAMethod,
      {$ELSE}
      {$IFEND}
  {$ENDIF}


  {$IFDEF IOS}
  Macapi.Helpers,
  iOSapi.Foundation,


  IdURI,
  IdSSLOpenSSLHeaders,
    {$IF CompilerVersion >= 34.0}//D10.4
    IdSSLOpenSSLHeaders_static_D10_4,
    {$ELSE}
    IdSSLOpenSSLHeaders_static,
    {$ENDIF}
  {$ENDIF IOS}


  {$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.alipaySDK,
  Androidapi.JNI.Java.Security_D10_1,
//  Androidapi.JNI.Java.Security,
  {$ENDIF ANDROID}

  Classes;



{$IFDEF IOS}
const
  //要用到SSL里面的签名函数
  SSL_LIB_name         = 'libssl.a'; {Do not Localize}
{$ENDIF IOS}


const
  LineBreak=#10;




//默认需要RSA签名方法

//签名
function RSASign(ARSARSAPrivateKey:String;APayOrderInfo:String):String;
function RSASign2(ARSARSAPrivateKey:String;APayOrderInfo:String):String;



{$IFDEF IOS}
function RSASign_IOS(ARSARSAPrivateKey:String;APayOrderInfo:String):String;
function RSASign2_IOS(ARSARSAPrivateKey:String;APayOrderInfo:String):String;
{$ENDIF IOS}

{$IFDEF ANDROID}
function RSASign_Android(ARSARSAPrivateKey:String;APayOrderInfo:String):String;
function RSASign2_Android(ARSARSAPrivateKey:String;APayOrderInfo:String):String;
{$ENDIF ANDROID}

{$IFDEF MSWINDOWS}
function RSASign_Windows(ARSARSAPrivateKey:String;APayOrderInfo:String):String;
function RSASign2_Windows(ARSARSAPrivateKey:String;APayOrderInfo:String):String;
{$ENDIF}





//{$IFDEF USE_DLL_MODE}//用于低版本Delphi
{$IF CompilerVersion >= 30.0}//XE10
{$ELSE}
  //用于低版本Delphi
  function LEO_RSASign_Windows_By_File:Boolean;
    external 'PayHelp_D10_1.dll' name 'LEO_RSASign_Windows_By_File';
  function LEO_RSASign2_Windows_By_File:Boolean;
    external 'PayHelp_D10_1.dll' name 'LEO_RSASign2_Windows_By_File';

  function RSASign_Windows_By_DLL(ARSARSAPrivateKey:AnsiString;APayOrderInfo:AnsiString):AnsiString;
  function RSASign2_Windows_By_DLL(ARSARSAPrivateKey:AnsiString;APayOrderInfo:AnsiString):AnsiString;

{$IFEND}




implementation

var
  RSALock:TCriticalSection;



//{$IFDEF USE_DLL_MODE}
{$IF CompilerVersion >= 30.0}//XE10
{$ELSE}
  function RSASign_Windows_By_DLL(ARSARSAPrivateKey:AnsiString;APayOrderInfo:AnsiString):AnsiString;
  var
    ARSAPrivateKeyStream:TMemoryStream;
    APayOrderInfoStream:TMemoryStream;
    ARSAResultStream:TMemoryStream;
    AApplicationDir:String;

    ARSARSAPrivateKey_UTF8:UTF8String;
    APayOrderInfo_UTF8:UTF8String;
  begin
    Result:='';

    AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

    ARSAPrivateKeyStream:=TMemoryStream.Create;
    APayOrderInfoStream:=TMemoryStream.Create;
    ARSAResultStream:=TMemoryStream.Create;
    RSALock.Enter;
    try

        ARSARSAPrivateKey_UTF8:=AnsiToUTF8(ARSARSAPrivateKey);
        APayOrderInfo_UTF8:=AnsiToUTF8(APayOrderInfo);

        if ARSARSAPrivateKey_UTF8[Length(ARSARSAPrivateKey_UTF8)]=#0 then
        begin
          ARSAPrivateKeyStream.WriteBuffer(PAnsiChar(ARSARSAPrivateKey_UTF8)^,Length(ARSARSAPrivateKey_UTF8)-1);
          APayOrderInfoStream.WriteBuffer(PAnsiChar(APayOrderInfo_UTF8)^,Length(APayOrderInfo_UTF8)-1);
        end
        else
        begin
          ARSAPrivateKeyStream.WriteBuffer(PAnsiChar(ARSARSAPrivateKey_UTF8)^,Length(ARSARSAPrivateKey_UTF8));
          APayOrderInfoStream.WriteBuffer(PAnsiChar(APayOrderInfo_UTF8)^,Length(APayOrderInfo_UTF8));
        end;

        ARSAPrivateKeyStream.Position:=0;
        APayOrderInfoStream.Position:=0;

        ARSAPrivateKeyStream.SaveToFile(AApplicationDir+'ARSAPrivateKey.txt');
        APayOrderInfoStream.SaveToFile(AApplicationDir+'APayOrderInfo.txt');


        if LEO_RSASign_Windows_By_File then
        begin
          ARSAResultStream.LoadFromFile(AApplicationDir+'ARSAResult.txt');

          SetLength(Result,ARSAResultStream.Size);
          ARSAResultStream.Read(Result[1],ARSAResultStream.Size)
        end;

    finally
      RSALock.Leave;
      FreeAndNil(ARSAPrivateKeyStream);
      FreeAndNil(APayOrderInfoStream);
      FreeAndNil(ARSAResultStream);
    end;
  end;

  function RSASign2_Windows_By_DLL(ARSARSAPrivateKey:AnsiString;APayOrderInfo:AnsiString):AnsiString;
  var
    ARSAPrivateKeyStream:TMemoryStream;
    APayOrderInfoStream:TMemoryStream;
    ARSAResultStream:TMemoryStream;
    AApplicationDir:String;

    ARSARSAPrivateKey_UTF8:UTF8String;
    APayOrderInfo_UTF8:UTF8String;
  begin
    Result:='';

    AApplicationDir:=ExtractFilePath(GetModuleName(HInstance));

    ARSAPrivateKeyStream:=TMemoryStream.Create;
    APayOrderInfoStream:=TMemoryStream.Create;
    ARSAResultStream:=TMemoryStream.Create;
    RSALock.Enter;
    try


        ARSARSAPrivateKey_UTF8:=AnsiToUTF8(ARSARSAPrivateKey);
        APayOrderInfo_UTF8:=AnsiToUTF8(APayOrderInfo);

        if ARSARSAPrivateKey_UTF8[Length(ARSARSAPrivateKey_UTF8)]=#0 then
        begin
          ARSAPrivateKeyStream.WriteBuffer(PAnsiChar(ARSARSAPrivateKey_UTF8)^,Length(ARSARSAPrivateKey_UTF8)-1);
          APayOrderInfoStream.WriteBuffer(PAnsiChar(APayOrderInfo_UTF8)^,Length(APayOrderInfo_UTF8)-1);
        end
        else
        begin
          ARSAPrivateKeyStream.WriteBuffer(PAnsiChar(ARSARSAPrivateKey_UTF8)^,Length(ARSARSAPrivateKey_UTF8));
          APayOrderInfoStream.WriteBuffer(PAnsiChar(APayOrderInfo_UTF8)^,Length(APayOrderInfo_UTF8));
        end;



        ARSAPrivateKeyStream.Position:=0;
        APayOrderInfoStream.Position:=0;

        ARSAPrivateKeyStream.SaveToFile(AApplicationDir+'ARSAPrivateKey.txt');
        APayOrderInfoStream.SaveToFile(AApplicationDir+'APayOrderInfo.txt');

        if LEO_RSASign2_Windows_By_File then
        begin
          ARSAResultStream.LoadFromFile(AApplicationDir+'ARSAResult.txt');


          SetLength(Result,ARSAResultStream.Size);
          ARSAResultStream.Read(Result[1],ARSAResultStream.Size)
        end;

    finally
      RSALock.Leave;
      FreeAndNil(ARSAPrivateKeyStream);
      FreeAndNil(APayOrderInfoStream);
      FreeAndNil(ARSAResultStream);
    end;
  end;
{$IFEND}




{$IFDEF IOS}

//IOS下RSA加密需要的函数
//unsigned char *SHA(const unsigned char *d, size_t n, unsigned char *md);
function SHA1(const d:MarshaledAString;n:Integer;md:MarshaledAString): MarshaledAString cdecl;
  external SSL_LIB_NAME name 'SHA1';
function SHA256(const d:MarshaledAString;n:Integer;md:MarshaledAString): MarshaledAString cdecl;
  external SSL_LIB_NAME name 'SHA256';


//int RSA_sign(int type, const unsigned char *m, unsigned int m_length,
//	unsigned char *sigret, unsigned int *sign_len, RSA *rsa);
function RSA_sign(_type : Integer; const m : MarshaledAString; m_length : cardinal;
      sigret : MarshaledAString; sign_len : Pcardinal; const rsa : PRSA) : Integer; cdecl;
  external SSL_LIB_NAME name 'RSA_sign';

//void	BIO_free_all(BIO *a);
procedure BIO_free_all(a:PBIO); cdecl;
  external SSL_LIB_NAME name 'BIO_free_all';

//int rsa_sign_with_private_key_pem(char *message, int message_length
//                                  , unsigned char *signature, unsigned int *signature_length
//                                  , char *private_key_file_path)
function rsa1_sign_with_private_key_pem(
                                       //需要签名的字符串
                                       msg:MarshaledAString;
                                       message_length:integer;
                                       //返回的签名
                                       signature:MarshaledAString;
                                       signature_length:Pcardinal;
                                       //私钥文件路径
                                       private_key_file_path:MarshaledAString):Boolean;
var
  asha1:Array [0..19] of Byte;
  success:Boolean;
  bio_private:PBIO;
  rsa_private:PRSA;
  rsa_sign_valid:Integer;
begin

    //获取到哈希值
//    unsigned char sha1[20];
//  Result := TNetEncoding.Base64.EncodeBytesToString(THashSHA1.GetHMACAsBytes(AData, AKey));
//    SHA1((unsigned char *)message, message_length, sha1);
    SHA1(msg, message_length, MarshaledAString(@asha1[0]));
//    asha1:=THashSHA1.GetHMACAsBytes(string(msg), AKey);
//    SHA1(msg, message_length, asha1);


    //根据私钥生成PRSA
    success := False;
//    BIO *bio_private = NULL;
    bio_private:=nil;
//    RSA *rsa_private = NULL;
    rsa_private:=nil;
    bio_private := BIO_new(BIO_s_file());
    BIO_read_filename(bio_private, private_key_file_path);
    rsa_private := PEM_read_bio_RSAPrivateKey(bio_private, nil, nil, nil);


    if (rsa_private <> nil) then
    begin
      if (1 = RSA_check_key(rsa_private)) then
      begin
        rsa_sign_valid := RSA_sign(NID_sha1
                        , MarshaledAString(@asha1[0]), 20
                        , signature, signature_length
                        , rsa_private);
        if (1 = rsa_sign_valid) then
        begin
          success := True;
        end;
      end;
      BIO_free_all(bio_private);
    end
    else
    begin
      //uBaseLog.OutputDebugString('OrangeUI rsa_private read error : private key is NULL');
    end;

    result:= success;
end;



function rsa2_sign_with_private_key_pem(msg:MarshaledAString;
                                       message_length:integer;
                                       signature:MarshaledAString;
                                       signature_length:Pcardinal;
                                       private_key_file_path:MarshaledAString):Boolean;
var
  asha256:Array [0..31] of Byte;//RSA256固定32位哈希值
  success:Boolean;
  bio_private:PBIO;
  rsa_private:PRSA;
  rsa_sign_valid:Integer;
begin

    //生成哈希值
//    unsigned char sha1[20];
//  Result := TNetEncoding.Base64.EncodeBytesToString(THashSHA1.GetHMACAsBytes(AData, AKey));
//    SHA1((unsigned char *)message, message_length, sha1);
    SHA256(msg, message_length, MarshaledAString(@asha256[0]));
//    asha1:=THashSHA1.GetHMACAsBytes(string(msg), AKey);
//    SHA1(msg, message_length, asha1);



    //读取私钥
    success := False;
//    BIO *bio_private = NULL;
    bio_private:=nil;
//    RSA *rsa_private = NULL;
    rsa_private:=nil;
    bio_private := BIO_new(BIO_s_file());
    BIO_read_filename(bio_private, private_key_file_path);
    rsa_private := PEM_read_bio_RSAPrivateKey(bio_private, nil, nil, nil);


    if (rsa_private <> nil) then
    begin
      if (1 = RSA_check_key(rsa_private)) then
      begin
        rsa_sign_valid := RSA_sign(672//参考得出的RSA256的值
                        , MarshaledAString(@asha256[0]), 32
                        , signature, signature_length
                        , rsa_private);
        if (1 = rsa_sign_valid) then
        begin
          success := True;
        end;
      end;
      BIO_free_all(bio_private);
    end
    else
    begin
      //uBaseLog.OutputDebugString('OrangeUI rsa_private read error : private key is NULL');
    end;

    result:= success;
end;

function StrLength(const Str: PByte): Integer;
const
  chZERO: Byte = 0;
begin
  Result:=0;
  while PByte(Str+Result)^<>chZERO do
  begin

    Inc(Result);
  end;
end;


function RSASign_IOS(ARSARSAPrivateKey:String;APayOrderInfo:String): String;
var
  content:NSString;
  msg:MarshaledAString;
  msglen:Integer;
  privateKeyStringStream:TStringStream;
  sign:Array[0..255] of Byte;
  sign_len:Int64;
  private_key_file_path:String;
  NSprivate_key_file_path:NSString;
var
  ABase64Stream:TStringStream;
  AMemoryStream:TMemoryStream;
begin

  Result:='';

  //uBaseLog.OutputDebugString('OrangeUI Alipay BeginSign');
	//在Document文件夹下创建私钥文件
  private_key_file_path:=GetApplicationPath+'AlixPay-RSARSAPrivateKey';
  privateKeyStringStream:=TStringStream.Create('',TEncoding.UTF8);
  try
    privateKeyStringStream.WriteString(
        '-----BEGIN PRIVATE KEY-----'+LineBreak
        +ARSARSAPrivateKey+LineBreak
        +'-----END PRIVATE KEY-----'
        );
    //把密钥写入文件
    privateKeyStringStream.Position:=0;
    privateKeyStringStream.SaveToFile(private_key_file_path);
  finally
    privateKeyStringStream.Free;
  end;

  content:=NSStr(APayOrderInfo);

  msg:=content.cStringUsingEncoding(NSUTF8StringEncoding);
  msglen:=StrLength(PByte(@msg[0]));
  //uBaseLog.OutputDebugString('OrangeUI Sign StrLen msglen '+IntToStr(msglen));


  NSprivate_key_file_path:=NSStr(private_key_file_path);
  sign_len:=0;
  if rsa1_sign_with_private_key_pem(msg,msglen,MarshaledAString(@sign[0]),@sign_len,NSprivate_key_file_path.UTF8String) then
  begin
      //uBaseLog.OutputDebugString('OrangeUI Sign Succ');
      //uBaseLog.OutputDebugString('OrangeUI Sign sign_len '+IntToStr(sign_len));



      //取得签名后字符串的Base64
      AMemoryStream:=TMemoryStream.Create;
      AMemoryStream.SetSize(sign_len);
      AMemoryStream.WriteBuffer(sign[0],sign_len);
      AMemoryStream.Position:=0;
      ABase64Stream:=TStringStream.Create();
      TNetEncoding.Base64.Encode(AMemoryStream,ABase64Stream);

      //生成订单请求
//      Result:=FuncUrlEncode(ReplaceStr(ABase64Stream.DataString,#10,''));

      //D7
      Result:=FuncUrlEncode(StringReplace(ABase64Stream.DataString,#10,'', [rfReplaceAll]));



      ABase64Stream.Free;
      AMemoryStream.Free;



  end
  else
  begin
    //uBaseLog.OutputDebugString('OrangeUI Sign Fail');
  end;

end;

function RSASign2_IOS(ARSARSAPrivateKey:String;APayOrderInfo:String): String;
var
  content:NSString;
  msg:MarshaledAString;
  msglen:Integer;
  privateKeyStringStream:TStringStream;
  sign:Array[0..1000] of Byte;
  sign_len:Int64;
  private_key_file_path:String;
  NSprivate_key_file_path:NSString;
var
  ABase64Stream:TStringStream;
  AMemoryStream:TMemoryStream;
begin

  Result:='';

  //uBaseLog.OutputDebugString('OrangeUI Alipay BeginSign');
	//在Document文件夹下创建私钥文件
  private_key_file_path:=GetApplicationPath+'AlixPay-RSARSAPrivateKey';
  privateKeyStringStream:=TStringStream.Create('',TEncoding.UTF8);
  try
    privateKeyStringStream.WriteString(
        '-----BEGIN PRIVATE KEY-----'+LineBreak
        +ARSARSAPrivateKey+LineBreak
        +'-----END PRIVATE KEY-----'
        );
    //把密钥写入文件
    privateKeyStringStream.Position:=0;
    privateKeyStringStream.SaveToFile(private_key_file_path);
  finally
    privateKeyStringStream.Free;
  end;

  content:=NSStr(APayOrderInfo);




  msg:=content.cStringUsingEncoding(NSUTF8StringEncoding);
  msglen:=StrLength(PByte(@msg[0]));
  //uBaseLog.OutputDebugString('OrangeUI Sign StrLen msglen '+IntToStr(msglen));


  NSprivate_key_file_path:=NSStr(private_key_file_path);
  sign_len:=0;
  if rsa2_sign_with_private_key_pem(msg,msglen,
        MarshaledAString(@sign[0]),@sign_len,
        NSprivate_key_file_path.UTF8String) then
  begin
      //uBaseLog.OutputDebugString('OrangeUI Sign Succ');
      //uBaseLog.OutputDebugString('OrangeUI Sign sign_len '+IntToStr(sign_len));



      //取得签名后字符串的Base64
      AMemoryStream:=TMemoryStream.Create;
      AMemoryStream.SetSize(sign_len);
      AMemoryStream.WriteBuffer(sign[0],sign_len);
      AMemoryStream.Position:=0;
      ABase64Stream:=TStringStream.Create();
      TNetEncoding.Base64.Encode(AMemoryStream,ABase64Stream);

      //生成订单请求
//      Result:=FuncUrlEncode(ReplaceStr(ABase64Stream.DataString,#10,''));

      //D7
      Result:=FuncUrlEncode(StringReplace(ABase64Stream.DataString,#10,'', [rfReplaceAll]));


      ABase64Stream.Free;
      AMemoryStream.Free;



  end
  else
  begin
    //uBaseLog.OutputDebugString('OrangeUI Sign Fail');
  end;

end;
{$ENDIF IOS}


function RSASign(ARSARSAPrivateKey:String;APayOrderInfo: String): String;
begin
  Result:='';

  {$IFDEF ANDROID}
  Result:=RSASign_Android(ARSARSAPrivateKey,APayOrderInfo);
  {$ENDIF ANDROID}

  {$IFDEF IOS}
  Result:=RSASign_IOS(ARSARSAPrivateKey,APayOrderInfo);
  {$ENDIF IOS}

  {$IFDEF MSWINDOWS}
  Result:=RSASign_Windows(ARSARSAPrivateKey,APayOrderInfo);
  {$ENDIF}

end;
function RSASign2(ARSARSAPrivateKey:String;APayOrderInfo: String): String;
begin
  Result:='';

  {$IFDEF ANDROID}
  Result:=RSASign2_Android(ARSARSAPrivateKey,APayOrderInfo);
  {$ENDIF ANDROID}

  {$IFDEF IOS}
  Result:=RSASign2_IOS(ARSARSAPrivateKey,APayOrderInfo);
  {$ENDIF IOS}

  {$IFDEF MSWINDOWS}
  Result:=RSASign2_Windows(ARSARSAPrivateKey,APayOrderInfo);
  {$ENDIF}

end;


{$IFDEF ANDROID}
function RSASign_Android(ARSARSAPrivateKey:String;APayOrderInfo:String): String;
var
  keyf:JKeyFactory;
  priKey:JPrivateKey;
  signature:Jsecurity_Signature;
  content:JString;
  signed:TJavaArray<Byte>;
  priPKCS8:JPKCS8EncodedKeySpec;
  encodedKey: TJavaArray<Byte>;
var
  ABase64Stream:TStringStream;
  AMemoryStream:TMemoryStream;
begin


  //先把私钥Base64解码
  ABase64Stream:=TStringStream.Create;
  AMemoryStream:=TMemoryStream.Create;
  try

    ABase64Stream.WriteString(ARSARSAPrivateKey);
    ABase64Stream.Position:=0;
    TNetEncoding.Base64.Decode(ABase64Stream,AMemoryStream);

    //将私钥读取出来
    encodedKey := TJavaArray<Byte>.Create(AMemoryStream.Size);
    AMemoryStream.Position:=0;
    AMemoryStream.ReadBuffer(encodedKey.Data^, AMemoryStream.Size);
  finally
    ABase64Stream.Free;
    AMemoryStream.Free;
  end;



  //要签名的串
  content:=StringToJString(APayOrderInfo);

  //FPayOrderInfo用RSA签名
  priPKCS8:=TJPKCS8EncodedKeySpec.JavaClass.init(encodedKey);
  keyf:=TJKeyFactory.JavaClass.getInstance(StringToJString('RSA'));
  priKey:=keyf.generatePrivate(priPKCS8 as JKeySpec);
  signature:=TJsecurity_Signature.JavaClass.getInstance(StringToJString('SHA1WithRSA'));
  signature.initSign(priKey);
  signature.update(content.getBytes(StringToJString('UTF-8')));


  //签名后的字符串
  signed:=signature.sign;


  //取得签名后字符串的Base64
  AMemoryStream:=TMemoryStream.Create;
  AMemoryStream.SetSize(Int64(signed.Length));
  AMemoryStream.WriteBuffer(signed.Data^,signed.Length);
  AMemoryStream.Position:=0;
  ABase64Stream:=TStringStream.Create();
  TNetEncoding.Base64.Encode(AMemoryStream,ABase64Stream);


  //生成订单请求
//  Result:=FuncUrlEncode(ReplaceStr(ABase64Stream.DataString,#10,''));

  //D7
  Result:=FuncUrlEncode(StringReplace(ABase64Stream.DataString,#10,'', [rfReplaceAll]));



  ABase64Stream.Free;
  AMemoryStream.Free;


end;

function RSASign2_Android(ARSARSAPrivateKey:String;APayOrderInfo:String): String;
var
  keyf:JKeyFactory;
  priKey:JPrivateKey;
  signature:Jsecurity_Signature;
  content:JString;
  signed:TJavaArray<Byte>;
  priPKCS8:JPKCS8EncodedKeySpec;
  encodedKey: TJavaArray<Byte>;
var
  ABase64Stream:TStringStream;
  AMemoryStream:TMemoryStream;
begin


  //先把私钥Base64解码
  ABase64Stream:=TStringStream.Create;
  AMemoryStream:=TMemoryStream.Create;
  try

    ABase64Stream.WriteString(ARSARSAPrivateKey);
    ABase64Stream.Position:=0;
    TNetEncoding.Base64.Decode(ABase64Stream,AMemoryStream);

    //将私钥读取出来
    encodedKey := TJavaArray<Byte>.Create(AMemoryStream.Size);
    AMemoryStream.Position:=0;
    AMemoryStream.ReadBuffer(encodedKey.Data^, AMemoryStream.Size);
  finally
    ABase64Stream.Free;
    AMemoryStream.Free;
  end;



  //要签名的串
  content:=StringToJString(APayOrderInfo);

  //FPayOrderInfo用RSA签名
  priPKCS8:=TJPKCS8EncodedKeySpec.JavaClass.init(encodedKey);
  keyf:=TJKeyFactory.JavaClass.getInstance(StringToJString('RSA'));
  priKey:=keyf.generatePrivate(priPKCS8 as JKeySpec);
  signature:=TJsecurity_Signature.JavaClass.getInstance(StringToJString('SHA256WithRSA'));
  signature.initSign(priKey);
  signature.update(content.getBytes(StringToJString('UTF-8')));


  //签名后的字符串
  signed:=signature.sign;


  //取得签名后字符串的Base64
  AMemoryStream:=TMemoryStream.Create;
  AMemoryStream.SetSize(Int64(signed.Length));
  AMemoryStream.WriteBuffer(signed.Data^,signed.Length);
  AMemoryStream.Position:=0;
  ABase64Stream:=TStringStream.Create();
  TNetEncoding.Base64.Encode(AMemoryStream,ABase64Stream);


  //生成订单请求
//  Result:=FuncUrlEncode(ReplaceStr(ABase64Stream.DataString,#10,''));

  //D7
  Result:=FuncUrlEncode(ReplaceStr(ABase64Stream.DataString,#10,''));



  ABase64Stream.Free;
  AMemoryStream.Free;



end;
{$ENDIF ANDROID}





{$IFDEF MSWINDOWS}
function RSASign_Windows(ARSARSAPrivateKey:String;APayOrderInfo:String): String;
begin

//  {$IFDEF USE_DLL_MODE}
  {$IF CompilerVersion >= 30.0}//XE10
  Result:=TLEOOpenSSLCipher.RSASignWith(rwmSha1,
                        APayOrderInfo,
                        TEncoding.UTF8,
                          '-----BEGIN PRIVATE KEY-----'+LineBreak
                          +ARSARSAPrivateKey
                          +LineBreak
                          +'-----END PRIVATE KEY-----'
                        );
  {$ELSE}
  Result:=RSASign_Windows_By_DLL(ARSARSAPrivateKey,APayOrderInfo);
  {$IFEND}

//  Result:=FuncUrlEncode(ReplaceStr(Result,#13#10,''));

  //D7
  Result:=FuncUrlEncode(StringReplace(Result,#13#10,'', [rfReplaceAll]));

end;

function RSASign2_Windows(ARSARSAPrivateKey:String;APayOrderInfo:String): String;
begin
//  {$IFDEF USE_DLL_MODE}
  {$IF CompilerVersion >= 30.0}//XE10
  Result:=TLEOOpenSSLCipher.RSASignWith(rwmSha256,
                        APayOrderInfo,
                        TEncoding.UTF8,
                          '-----BEGIN PRIVATE KEY-----'+LineBreak
                          +ARSARSAPrivateKey
                          +LineBreak
                          +'-----END PRIVATE KEY-----'
                        );
  {$ELSE}
  Result:=RSASign2_Windows_By_DLL(ARSARSAPrivateKey,APayOrderInfo);
  {$IFEND}
//  Result:=FuncUrlEncode(ReplaceStr(Result,#13#10,''));

  //D7
  Result:=FuncUrlEncode(StringReplace(Result,#13#10,'', [rfReplaceAll]));


end;
{$ENDIF}


initialization
  RSALock:=TCriticalSection.Create;


finalization
  FreeAndNil(RSALock);


end.
