
//用于实现调用微信接口而不需要证书


//====================================================
//
//  转换来自JarOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932、396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//  QQ Group：165232328
//
//  生成时间：2018-03-22 12:47:11
//  工具版本：1.0.2018.1.26
//
//====================================================
unit Androidapi.JNI.httpclient;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes//,
//  Androidapi.JNI.javax.net.ssl.SSLSession,
//  Androidapi.JNI.Java.Security,
//  Androidapi.JNI.javax.net.ssl.SSLSocket,
//  Androidapi.JNI.org.apache.http.conn.scheme.SocketFactory,
//  Androidapi.JNI.java.net.Socket
  ;


type
// ===== Forward declarations =====

  JHttpSslNoCertGet = interface; //com.ggggcexx.httpclient.HttpSslNoCertGet
  JHTTPSTrustManager_1 = interface; //com.ggggcexx.httpclient.HTTPSTrustManager$1
  JHTTPSTrustManager = interface; //com.ggggcexx.httpclient.HTTPSTrustManager
  JTrustAllSSLSocketFactory_1 = interface; //com.ggggcexx.httpclient.TrustAllSSLSocketFactory$1
  JTrustAllSSLSocketFactory_TrustAllManager = interface; //com.ggggcexx.httpclient.TrustAllSSLSocketFactory$TrustAllManager
//  JTrustAllSSLSocketFactory = interface; //com.ggggcexx.httpclient.TrustAllSSLSocketFactory

// ===== Interface declarations =====

  JHttpSslNoCertGetClass = interface(JObjectClass)
  ['{9392E9FE-B6F9-4B0B-B860-D9CC6E95F69A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHttpSslNoCertGet; cdecl; //()V
    {class} function Get(path: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function Post(path: JString;content: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function GetReturnStream(path: JString): JInputStream; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function PostReturnStream(path: JString;content: JInputStream): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/httpclient/HttpSslNoCertGet')]
  JHttpSslNoCertGet = interface(JObject)
  ['{B9738F32-49CE-411B-8251-1A2CAFBEA9B2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHttpSslNoCertGet = class(TJavaGenericImport<JHttpSslNoCertGetClass, JHttpSslNoCertGet>) end;

  JHTTPSTrustManager_1Class = interface(JObjectClass)
  ['{F3BBA2FE-B372-4645-9730-BF2B76506E92}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/httpclient/HTTPSTrustManager$1')]
  JHTTPSTrustManager_1 = interface(JObject)
  ['{158474E5-5FD7-463F-8263-D342FE820E50}']
    { Property Methods }

    { methods }
//    function verify(arg0: JString; arg1: JSSLSession): Boolean; cdecl; //(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    { Property }
  end;

  TJHTTPSTrustManager_1 = class(TJavaGenericImport<JHTTPSTrustManager_1Class, JHTTPSTrustManager_1>) end;

  JHTTPSTrustManagerClass = interface(JObjectClass)
  ['{601A5ADB-0E5F-4B36-8B11-BF50E224A3FC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHTTPSTrustManager; cdecl; //()V
    {class} procedure allowAllSSL; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/httpclient/HTTPSTrustManager')]
  JHTTPSTrustManager = interface(JObject)
  ['{9A7B2E48-8B1B-4866-BBB8-2D056CFB14BB}']
    { Property Methods }

    { methods }
//    procedure checkClientTrusted(x509Certificates: TJavaObjectArray<JX509Certificate>; P2: JString); cdecl; //([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
//    procedure checkServerTrusted(x509Certificates: TJavaObjectArray<JX509Certificate>; P2: JString); cdecl; //([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
//    function isClientTrusted(chain: TJavaObjectArray<JX509Certificate>): Boolean; cdecl; //([Ljava/security/cert/X509Certificate;)Z
//    function isServerTrusted(chain: TJavaObjectArray<JX509Certificate>): Boolean; cdecl; //([Ljava/security/cert/X509Certificate;)Z
//    function getAcceptedIssuers: TJavaObjectArray<JX509Certificate>; cdecl; //()[Ljava/security/cert/X509Certificate;

    { Property }
  end;

  TJHTTPSTrustManager = class(TJavaGenericImport<JHTTPSTrustManagerClass, JHTTPSTrustManager>) end;

  JTrustAllSSLSocketFactory_1Class = interface(JObjectClass)
  ['{06D6C8CB-ADCF-4061-84C5-03306C0710C0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/httpclient/TrustAllSSLSocketFactory$1')]
  JTrustAllSSLSocketFactory_1 = interface(JObject)
  ['{7DEF1F04-278D-4A9C-B5DA-48F3018273DB}']
    { Property Methods }

    { methods }
    procedure verify(host: JString; cns: TJavaObjectArray<JString>; subjectAlts: TJavaObjectArray<JString>); cdecl; overload; //(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
//    procedure verify(host: JString; cert: JX509Certificate); cdecl; overload; //(Ljava/lang/String;Ljava/security/cert/X509Certificate;)V
//    procedure verify(host: JString; ssl: JSSLSocket); cdecl; overload; //(Ljava/lang/String;Ljavax/net/ssl/SSLSocket;)V
//    function verify(host: JString; session: JSSLSession): Boolean; cdecl; overload; //(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    { Property }
  end;

  TJTrustAllSSLSocketFactory_1 = class(TJavaGenericImport<JTrustAllSSLSocketFactory_1Class, JTrustAllSSLSocketFactory_1>) end;

  JTrustAllSSLSocketFactory_TrustAllManagerClass = interface(JObjectClass)
  ['{A7CAC680-C052-4F95-B6A1-FDA02358B8E1}']
    { static Property Methods }

    { static Methods }
//    {class} function init(P1: JTrustAllSSLSocketFactory): JTrustAllSSLSocketFactory_TrustAllManager; cdecl; //(Lcom/ggggcexx/httpclient/TrustAllSSLSocketFactory;)V

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/httpclient/TrustAllSSLSocketFactory$TrustAllManager')]
  JTrustAllSSLSocketFactory_TrustAllManager = interface(JObject)
  ['{1A72B9D0-B2AE-4210-8D4E-276146762FC7}']
    { Property Methods }

    { methods }
//    procedure checkClientTrusted(arg0: TJavaObjectArray<JX509Certificate>; arg1: JString); cdecl; //([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
//    procedure checkServerTrusted(arg0: TJavaObjectArray<JX509Certificate>; arg1: JString); cdecl; //([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
//    function getAcceptedIssuers: TJavaObjectArray<JX509Certificate>; cdecl; //()[Ljava/security/cert/X509Certificate;

    { Property }
  end;

  TJTrustAllSSLSocketFactory_TrustAllManager = class(TJavaGenericImport<JTrustAllSSLSocketFactory_TrustAllManagerClass, JTrustAllSSLSocketFactory_TrustAllManager>) end;

//  JTrustAllSSLSocketFactoryClass = interface(JSSLSocketFactoryClass) // or JObjectClass // SuperSignature: org/apache/http/conn/ssl/SSLSocketFactory
//  ['{8D0D3A12-1405-4607-BFC7-556D1895C005}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function getDefault: JSocketFactory; cdecl; //()Lorg/apache/http/conn/scheme/SocketFactory;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ggggcexx/httpclient/TrustAllSSLSocketFactory')]
//  JTrustAllSSLSocketFactory = interface(JSSLSocketFactory) // or JObject // SuperSignature: org/apache/http/conn/ssl/SSLSocketFactory
//  ['{FD762A9E-0F93-4C02-8A7B-6C94FFCDECF3}']
//    { Property Methods }
//
//    { methods }
//    function createSocket: JSocket; cdecl; overload; //()Ljava/net/Socket;
//    function createSocket(socket: JSocket; host: JString; port: Integer; autoClose: Boolean): JSocket; cdecl; overload; //(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
//
//    { Property }
//  end;
//
//  TJTrustAllSSLSocketFactory = class(TJavaGenericImport<JTrustAllSSLSocketFactoryClass, JTrustAllSSLSocketFactory>) end;

{$ENDIF}

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.httpclient.JHttpSslNoCertGet',
//    TypeInfo(Androidapi.JNI.httpclient.JHttpSslNoCertGet));
//  TRegTypes.RegisterType('Androidapi.JNI.httpclient.JHTTPSTrustManager_1',
//    TypeInfo(Androidapi.JNI.httpclient.JHTTPSTrustManager_1));
//  TRegTypes.RegisterType('Androidapi.JNI.httpclient.JHTTPSTrustManager',
//    TypeInfo(Androidapi.JNI.httpclient.JHTTPSTrustManager));
//  TRegTypes.RegisterType('Androidapi.JNI.httpclient.JTrustAllSSLSocketFactory_1',
//    TypeInfo(Androidapi.JNI.httpclient.JTrustAllSSLSocketFactory_1));
//  TRegTypes.RegisterType('Androidapi.JNI.httpclient.JTrustAllSSLSocketFactory_TrustAllManager',
//    TypeInfo(Androidapi.JNI.httpclient.JTrustAllSSLSocketFactory_TrustAllManager));
//  TRegTypes.RegisterType('Androidapi.JNI.httpclient.JTrustAllSSLSocketFactory',
//    TypeInfo(Androidapi.JNI.httpclient.JTrustAllSSLSocketFactory));
//end;
//
//
//initialization
//  RegisterTypes;

end.
