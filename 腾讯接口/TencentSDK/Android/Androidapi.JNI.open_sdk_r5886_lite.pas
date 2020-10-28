//====================================================
//
//  转换来自JavaOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932
//      396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//
//  生成时间：2017/10/24 15:55:34
//  工具版本：1.0.2015.5.11
//
//====================================================
unit Androidapi.JNI.open_sdk_r5886_lite;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Webkit,
  Androidapi.JNI.Net,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Support,
//  Androidapi.JNI.org.json.JSONObject,
//  Androidapi.JNI.java.net.MalformedURLException,
//  Androidapi.JNI.org.json.JSONException,
//  Androidapi.JNI.org.apache.http.conn.ConnectTimeoutException,
//  Androidapi.JNI.java.net.SocketTimeoutException,
  Androidapi.JNI.Media,
//  Androidapi.JNI.java.text.SimpleDateFormat,
  Androidapi.JNI.Java.Security;
//  Androidapi.JNI.java.net.Socket,
//  Androidapi.JNI.org.apache.http.client.HttpClient;


type
// ===== Forward declarations =====

//  Ja = interface; //com.tencent.connect.a.a
//  Ja_1 = interface; //com.tencent.connect.auth.a$1
//  Ja_2 = interface; //com.tencent.connect.auth.a$2
//  Ja_3 = interface; //com.tencent.connect.auth.a$3
//  Ja_a_1 = interface; //com.tencent.connect.auth.a$a$1
//  Ja_a = interface; //com.tencent.connect.auth.a$a
//  Ja_b = interface; //com.tencent.connect.auth.a$b
//  Ja_c = interface; //com.tencent.connect.auth.a$c
//  Ja_d = interface; //com.tencent.connect.auth.a$d
//  Ja = interface; //com.tencent.connect.auth.a
//  JAuthAgent_1_1 = interface; //com.tencent.connect.auth.AuthAgent$1$1
//  JAuthAgent_1 = interface; //com.tencent.connect.auth.AuthAgent$1
//  JAuthAgent_a = interface; //com.tencent.connect.auth.AuthAgent$a
//  JAuthAgent_b_1 = interface; //com.tencent.connect.auth.AuthAgent$b$1
//  JAuthAgent_b_2 = interface; //com.tencent.connect.auth.AuthAgent$b$2
//  JAuthAgent_b_3 = interface; //com.tencent.connect.auth.AuthAgent$b$3
//  JAuthAgent_b_a = interface; //com.tencent.connect.auth.AuthAgent$b$a
//  JAuthAgent_b = interface; //com.tencent.connect.auth.AuthAgent$b
//  JAuthAgent_c = interface; //com.tencent.connect.auth.AuthAgent$c
  JAuthAgent = interface; //com.tencent.connect.auth.AuthAgent
//  Jb_a = interface; //com.tencent.connect.auth.b$a
//  Jb = interface; //com.tencent.connect.auth.b
//  Jc = interface; //com.tencent.connect.auth.c
  JQQToken = interface; //com.tencent.connect.auth.QQToken
//  JAssistActivity_1 = interface; //com.tencent.connect.common.AssistActivity$1
  JAssistActivity = interface; //com.tencent.connect.common.AssistActivity
//  JBaseApi_TempRequestListener_1 = interface; //com.tencent.connect.common.BaseApi$TempRequestListener$1
  JBaseApi_TempRequestListener = interface; //com.tencent.connect.common.BaseApi$TempRequestListener
  JBaseApi = interface; //com.tencent.connect.common.BaseApi
  JConstants = interface; //com.tencent.connect.common.Constants
  JUIListenerManager_ApiTask = interface; //com.tencent.connect.common.UIListenerManager$ApiTask
  JUIListenerManager = interface; //com.tencent.connect.common.UIListenerManager
//  Ja_1 = interface; //com.tencent.connect.share.a$1
//  Ja_2 = interface; //com.tencent.connect.share.a$2
//  Ja_3 = interface; //com.tencent.connect.share.a$3
//  Ja_4 = interface; //com.tencent.connect.share.a$4
//  Ja = interface; //com.tencent.connect.share.a
//  JQQShare_1 = interface; //com.tencent.connect.share.QQShare$1
//  JQQShare_2 = interface; //com.tencent.connect.share.QQShare$2
  JQQShare = interface; //com.tencent.connect.share.QQShare
//  JQzonePublish_1 = interface; //com.tencent.connect.share.QzonePublish$1
//  JQzonePublish_2 = interface; //com.tencent.connect.share.QzonePublish$2
  JQzonePublish = interface; //com.tencent.connect.share.QzonePublish
//  JQzoneShare_1 = interface; //com.tencent.connect.share.QzoneShare$1
  JQzoneShare = interface; //com.tencent.connect.share.QzoneShare
  JUserInfo = interface; //com.tencent.connect.UserInfo
//  Ja = interface; //com.tencent.open.a.a
//  Jb = interface; //com.tencent.open.a.b
//  Jc = interface; //com.tencent.open.a.c
//  Jd_a = interface; //com.tencent.open.a.d$a
//  Jd_b = interface; //com.tencent.open.a.d$b
//  Jd_c = interface; //com.tencent.open.a.d$c
//  Jd_d = interface; //com.tencent.open.a.d$d
//  Jd = interface; //com.tencent.open.a.d
//  Je = interface; //com.tencent.open.a.e
//  Jf = interface; //com.tencent.open.a.f
//  Jg = interface; //com.tencent.open.a.g
//  Jh = interface; //com.tencent.open.a.h
//  Ji = interface; //com.tencent.open.a.i
//  Ja_a = interface; //com.tencent.open.a$a
//  Ja_b = interface; //com.tencent.open.a$b
//  Ja = interface; //com.tencent.open.a
//  Ja = interface; //com.tencent.open.b.a
//  Jb = interface; //com.tencent.open.b.b
//  Jc = interface; //com.tencent.open.b.c
//  Jd = interface; //com.tencent.open.b.d
//  Je = interface; //com.tencent.open.b.e
//  Jf = interface; //com.tencent.open.b.f
//  Jg_1 = interface; //com.tencent.open.b.g$1
//  Jg_2 = interface; //com.tencent.open.b.g$2
//  Jg_3 = interface; //com.tencent.open.b.g$3
//  Jg_4 = interface; //com.tencent.open.b.g$4
//  Jg_5 = interface; //com.tencent.open.b.g$5
//  Jg_6 = interface; //com.tencent.open.b.g$6
//  Jg = interface; //com.tencent.open.b.g
//  Jb_1 = interface; //com.tencent.open.b$1
//  Jb = interface; //com.tencent.open.b
//  Ja_a = interface; //com.tencent.open.c.a$a
//  Ja = interface; //com.tencent.open.c.a
//  Jb = interface; //com.tencent.open.c.b
//  Jc = interface; //com.tencent.open.c.c
//  Jc_1 = interface; //com.tencent.open.c$1
//  Jc_a = interface; //com.tencent.open.c$a
//  Jc_b = interface; //com.tencent.open.c$b
//  Jc_c = interface; //com.tencent.open.c$c
//  Jc_d = interface; //com.tencent.open.c$d
//  Jc = interface; //com.tencent.open.c
  JSocialApi = interface; //com.tencent.open.SocialApi
//  JSocialApiIml_a = interface; //com.tencent.open.SocialApiIml$a
  JSocialApiIml = interface; //com.tencent.open.SocialApiIml
  JSocialConstants = interface; //com.tencent.open.SocialConstants
//  JTDialog_1 = interface; //com.tencent.open.TDialog$1
  JTDialog_FbWebViewClient = interface; //com.tencent.open.TDialog$FbWebViewClient
  JTDialog_JsListener = interface; //com.tencent.open.TDialog$JsListener
  JTDialog_OnTimeListener = interface; //com.tencent.open.TDialog$OnTimeListener
  JTDialog_THandler = interface; //com.tencent.open.TDialog$THandler
  JTDialog = interface; //com.tencent.open.TDialog
//  Ja_1 = interface; //com.tencent.open.utils.a$1
//  Ja_a = interface; //com.tencent.open.utils.a$a
//  Ja = interface; //com.tencent.open.utils.a
//  Jb_1 = interface; //com.tencent.open.utils.b$1
//  Jb_2 = interface; //com.tencent.open.utils.b$2
//  Jb = interface; //com.tencent.open.utils.b
//  Jc = interface; //com.tencent.open.utils.c
//  Jd = interface; //com.tencent.open.utils.d
//  Je_1 = interface; //com.tencent.open.utils.e$1
//  Je = interface; //com.tencent.open.utils.e
//  Jf = interface; //com.tencent.open.utils.f
//  Jg = interface; //com.tencent.open.utils.g
//  Jh_1 = interface; //com.tencent.open.utils.h$1
//  Jh_a_1 = interface; //com.tencent.open.utils.h$a$1
//  Jh_a = interface; //com.tencent.open.utils.h$a
//  Jh = interface; //com.tencent.open.utils.h
//  JHttpUtils_1 = interface; //com.tencent.open.utils.HttpUtils$1
//  JHttpUtils_a = interface; //com.tencent.open.utils.HttpUtils$a
//  JHttpUtils_b = interface; //com.tencent.open.utils.HttpUtils$b
//  JHttpUtils_c = interface; //com.tencent.open.utils.HttpUtils$c
  JHttpUtils_HttpStatusException = interface; //com.tencent.open.utils.HttpUtils$HttpStatusException
  JHttpUtils_NetworkUnavailableException = interface; //com.tencent.open.utils.HttpUtils$NetworkUnavailableException
  JHttpUtils = interface; //com.tencent.open.utils.HttpUtils
//  Ji_a = interface; //com.tencent.open.utils.i$a
//  Ji = interface; //com.tencent.open.utils.i
//  Jj = interface; //com.tencent.open.utils.j
//  Jk = interface; //com.tencent.open.utils.k
//  Ja = interface; //com.tencent.open.web.security.a
//  Jb = interface; //com.tencent.open.web.security.b
//  Jc = interface; //com.tencent.open.web.security.c
  JJniInterface = interface; //com.tencent.open.web.security.JniInterface
  JSecureJsInterface = interface; //com.tencent.open.web.security.SecureJsInterface
  JAuthActivity = interface; //com.tencent.tauth.AuthActivity
  JIRequestListener = interface; //com.tencent.tauth.IRequestListener
  JIUiListener = interface; //com.tencent.tauth.IUiListener
  JTencent = interface; //com.tencent.tauth.Tencent
  JUiError = interface; //com.tencent.tauth.UiError

// ===== Interface declarations =====

//  JaClass = interface(JObjectClass)
//  ['{85B80E83-0055-43A5-8A83-2C4B6478897E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: JQQToken): Boolean; cdecl; overload;
//    {class} procedure b(P1: JContext; P2: JQQToken); cdecl;
//    {class} procedure c(P1: JContext; P2: JQQToken); cdecl;
//    {class} procedure d(P1: JContext; P2: JQQToken); cdecl;
//    {class} procedure a(P1: JContext; P2: JQQToken; P3: JString; P4: TJavaObjectArray<JString>); cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/a/a')]
//  Ja = interface(JObject)
//  ['{78492AE4-E2CA-40BE-BDF6-AFD6993BA6AA}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  Ja_1Class = interface(JObjectClass)
//  ['{38938685-5C14-423B-93A8-60D4BCBC0784}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a$1')]
//  Ja_1 = interface(JObject)
//  ['{A72E4BCD-4643-490F-8774-C82258434BE9}']
//    { Property Methods }
//
//    { methods }
//    function onLongClick(P1: JView): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJa_1 = class(TJavaGenericImport<Ja_1Class, Ja_1>) end;

//  Ja_2Class = interface(JObjectClass)
//  ['{BF1440C5-6EAF-4E94-B956-AF9D82D517D1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a$2')]
//  Ja_2 = interface(JObject)
//  ['{DE24973C-D444-4E5C-AC6F-F56F327DA3C8}']
//    { Property Methods }
//
//    { methods }
//    function onTouch(P1: JView; P2: JMotionEvent): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJa_2 = class(TJavaGenericImport<Ja_2Class, Ja_2>) end;

//  Ja_3Class = interface(JObjectClass)
//  ['{1D4DF90C-863A-4E2C-84B2-B4405E6E6853}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a$3')]
//  Ja_3 = interface(JObject)
//  ['{76F4AE5F-2C31-487F-86B5-4A66A602D88B}']
//    { Property Methods }
//
//    { methods }
//    procedure onDismiss(P1: JDialogInterface); cdecl;
//
//    { Property }
//  end;

//  TJa_3 = class(TJavaGenericImport<Ja_3Class, Ja_3>) end;

//  Ja_a_1Class = interface(JObjectClass)
//  ['{8ED2FEA0-B7C8-41DA-BC6F-5EA6FC333782}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a$a$1')]
//  Ja_a_1 = interface(JObject)
//  ['{3077F0E4-8918-4621-B0A2-9FBF3CA31483}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJa_a_1 = class(TJavaGenericImport<Ja_a_1Class, Ja_a_1>) end;

//  Ja_aClass = interface(JObjectClass)
//  ['{6B174957-F01C-4D48-9E70-E8A542FA8AE0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a$a')]
//  Ja_a = interface(JObject)
//  ['{92818E26-19CC-4336-9ED9-A80D09DD9F61}']
//    { Property Methods }
//
//    { methods }
//    function shouldOverrideUrlLoading(P1: JWebView; P2: JString): Boolean; cdecl;
//    procedure onReceivedError(P1: JWebView; P2: Integer; P3: JString; P4: JString); cdecl;
//    procedure onPageStarted(P1: JWebView; P2: JString; P3: JBitmap); cdecl;
//    procedure onPageFinished(P1: JWebView; P2: JString); cdecl;
//    procedure onReceivedSslError(P1: JWebView; P2: JSslErrorHandler; P3: JSslError); cdecl;
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_bClass = interface(JObjectClass)
//  ['{2EA0D14F-D892-4CFF-ACD3-14A1848A4E74}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: JString; P3: JString; P4: JString; P5: JIUiListener): Ja_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a$b')]
//  Ja_b = interface(JObject)
//  ['{D0583BB5-369D-479B-B51F-FA2866A2A0DF}']
//    { Property Methods }
//
//    { methods }
//    procedure onComplete(P1: JObject); cdecl;
//    procedure onError(P1: JUiError); cdecl;
//    procedure onCancel; cdecl;
//
//    { Property }
//  end;

//  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

//  Ja_cClass = interface(JObjectClass)
//  ['{530E77B9-3039-48E8-A2FA-089A85206D9F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: Ja_b; P3: JLooper): Ja_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a$c')]
//  Ja_c = interface(JObject)
//  ['{768D7FCF-68DB-4C79-A300-CDF055BFBF0D}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJa_c = class(TJavaGenericImport<Ja_cClass, Ja_c>) end;

//  Ja_dClass = interface(JObjectClass)
//  ['{607C714F-595B-4EED-860C-856F4E2E51F0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Ja; P2: JString): Ja_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a$d')]
//  Ja_d = interface(JObject)
//  ['{E555586D-4132-4337-AD58-F736D86B1766}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJa_d = class(TJavaGenericImport<Ja_dClass, Ja_d>) end;

//  JaClass = interface(JObjectClass)
//  ['{4180BDD6-13CE-4777-9C3B-8836E19DF56D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JString; P3: JString; P4: JIUiListener; P5: JQQToken): Ja; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/a')]
//  Ja = interface(JObject)
//  ['{9340DD3B-080D-46B4-8901-EF7D5FEDA116}']
//    { Property Methods }
//
//    { methods }
//    procedure onBackPressed; cdecl;
//    procedure a(P1: JString; P2: JString); cdecl;
//    procedure dismiss; cdecl;
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JAuthAgent_1_1Class = interface(JObjectClass)
//  ['{BD4362C4-874E-4821-940B-098D781658E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$1$1')]
//  JAuthAgent_1_1 = interface(JObject)
//  ['{0A67737A-3D2C-4C7E-9A6D-4FECF0365FF8}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJAuthAgent_1_1 = class(TJavaGenericImport<JAuthAgent_1_1Class, JAuthAgent_1_1>) end;

//  JAuthAgent_1Class = interface(JObjectClass)
//  ['{C4A0C895-6411-4077-8C85-815E24E37E22}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$1')]
//  JAuthAgent_1 = interface(JObject)
//  ['{F6F9D307-E607-4246-9868-9E7CA1C199FD}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJAuthAgent_1 = class(TJavaGenericImport<JAuthAgent_1Class, JAuthAgent_1>) end;

//  JAuthAgent_aClass = interface(JObjectClass)
//  ['{0229EF6E-AAD8-46B1-87B1-BD9B2773D8BB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JAuthAgent; P2: JIUiListener): JAuthAgent_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$a')]
//  JAuthAgent_a = interface(JObject)
//  ['{298C9079-F9D7-4E7A-9190-0648D5D0E54C}']
//    { Property Methods }
//
//    { methods }
//    procedure onComplete(P1: JObject); cdecl;
//    procedure onError(P1: JUiError); cdecl;
//    procedure onCancel; cdecl;
//
//    { Property }
//  end;

//  TJAuthAgent_a = class(TJavaGenericImport<JAuthAgent_aClass, JAuthAgent_a>) end;

//  JAuthAgent_b_1Class = interface(JObjectClass)
//  ['{74F3F412-77F7-4E46-9FF4-98CBDB46B6E8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$b$1')]
//  JAuthAgent_b_1 = interface(JObject)
//  ['{ABEE4DA5-25E5-4C65-91ED-B448BAF48263}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJAuthAgent_b_1 = class(TJavaGenericImport<JAuthAgent_b_1Class, JAuthAgent_b_1>) end;

//  JAuthAgent_b_2Class = interface(JObjectClass)
//  ['{B93BF2D0-D615-42AC-ADEE-EF1DC29F2856}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$b$2')]
//  JAuthAgent_b_2 = interface(JObject)
//  ['{F7E0404A-45EC-4FDC-B41F-983BEE03A2C6}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(P1: JView); cdecl;
//
//    { Property }
//  end;

//  TJAuthAgent_b_2 = class(TJavaGenericImport<JAuthAgent_b_2Class, JAuthAgent_b_2>) end;

//  JAuthAgent_b_3Class = interface(JObjectClass)
//  ['{5B051961-1935-4E92-A4D8-579BE8BB453F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$b$3')]
//  JAuthAgent_b_3 = interface(JObject)
//  ['{185D60AC-6A95-488F-86CE-DE99FA59A941}']
//    { Property Methods }
//
//    { methods }
//    procedure onCancel(P1: JDialogInterface); cdecl;
//
//    { Property }
//  end;

//  TJAuthAgent_b_3 = class(TJavaGenericImport<JAuthAgent_b_3Class, JAuthAgent_b_3>) end;

//  JAuthAgent_b_aClass = interface(JObjectClass)
//  ['{8D91F9E4-6671-46F3-B56E-EAB5B165DAD7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$b$a')]
//  JAuthAgent_b_a = interface(JObject)
//  ['{4A029318-5340-4985-9F1F-1DBB6CB0CBD0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJAuthAgent_b_a = class(TJavaGenericImport<JAuthAgent_b_aClass, JAuthAgent_b_a>) end;

//  JAuthAgent_bClass = interface(JObjectClass)
//  ['{12A2B003-8A38-4C0C-A72D-63AFB3C824B8}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JAuthAgent; P2: JIUiListener): JAuthAgent_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$b')]
//  JAuthAgent_b = interface(JObject)
//  ['{C66A1FFD-B45F-4D94-884F-FFA337E6CF02}']
//    { Property Methods }
//
//    { methods }
//    procedure onComplete(P1: JObject); cdecl;
//    procedure onError(P1: JUiError); cdecl;
//    procedure onCancel; cdecl;
//
//    { Property }
//  end;

//  TJAuthAgent_b = class(TJavaGenericImport<JAuthAgent_bClass, JAuthAgent_b>) end;

//  JAuthAgent_cClass = interface(JObjectClass)
//  ['{CBC0A2F6-43FD-404B-A5A2-77A4F9D713ED}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JAuthAgent; P2: JContext; P3: JIUiListener; P4: Boolean; P5: Boolean): JAuthAgent_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/AuthAgent$c')]
//  JAuthAgent_c = interface(JObject)
//  ['{3D4D50EE-FC3C-4E21-9F3B-C7A2810D548C}']
//    { Property Methods }
//
//    { methods }
//    procedure onComplete(P1: JObject); cdecl;
//    procedure onError(P1: JUiError); cdecl;
//    procedure onCancel; cdecl;
//
//    { Property }
//  end;

//  TJAuthAgent_c = class(TJavaGenericImport<JAuthAgent_cClass, JAuthAgent_c>) end;

  JAuthAgentClass = interface(JObjectClass)
  ['{0F0C60B5-4469-4BD4-9C9B-DB7EC7A3D7FC}']
    { static Property Methods }
    {class} function _GetSECURE_LIB_X86_FILE_NAME: JString;
    {class} function _GetSECURE_LIB_X86_64_FILE_NAME: JString;
    {class} function _GetSECURE_LIB_ARM_FILE_NAME: JString;
    {class} function _GetSECURE_LIB_ARM64_FILE_NAME: JString;
    {class} function _GetSECURE_LIB_FILE_NAME: JString;
    {class} function _GetSECURE_LIB_NAME: JString;

    { static Methods }
    {class} function init(P1: JQQToken): JAuthAgent; cdecl;

    { static Property }
    {class} property SECURE_LIB_X86_FILE_NAME: JString read _GetSECURE_LIB_X86_FILE_NAME;
    {class} property SECURE_LIB_X86_64_FILE_NAME: JString read _GetSECURE_LIB_X86_64_FILE_NAME;
    {class} property SECURE_LIB_ARM_FILE_NAME: JString read _GetSECURE_LIB_ARM_FILE_NAME;
    {class} property SECURE_LIB_ARM64_FILE_NAME: JString read _GetSECURE_LIB_ARM64_FILE_NAME;
    {class} property SECURE_LIB_FILE_NAME: JString read _GetSECURE_LIB_FILE_NAME;
    {class} property SECURE_LIB_NAME: JString read _GetSECURE_LIB_NAME;
  end;

  [JavaSignature('com/tencent/connect/auth/AuthAgent')]
  JAuthAgent = interface(JObject)
  ['{37401DFF-A89F-4DA5-BFD9-A01C31F54E77}']
    { Property Methods }

    { methods }
    function doLogin(P1: JActivity; P2: JString; P3: JIUiListener): Integer; cdecl; overload;
    function doLogin(P1: JActivity; P2: JString; P3: JIUiListener; P4: Boolean; P5: JFragment): Integer; cdecl; overload;
    procedure releaseResource; cdecl;

    { Property }
  end;

  TJAuthAgent = class(TJavaGenericImport<JAuthAgentClass, JAuthAgent>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{F747B7CC-09A6-41C1-9F74-CA9019DA3CA9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/b$a')]
//  Jb_a = interface(JObject)
//  ['{4D04AE8A-0FE3-4456-909F-22AA67F634C1}']
//    { Property Methods }
//    function _Geta: JIUiListener;
//    procedure _Seta(aa: JIUiListener);
//    function _Getb: Ja;
//    procedure _Setb(ab: Ja);
//    function _Getc: JString;
//    procedure _Setc(ac: JString);
//
//    { methods }
//
//    { Property }
//    property a: JIUiListener read _Geta write _Seta;
//    property b: Ja read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//  end;

//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  JbClass = interface(JObjectClass)
//  ['{9BA67D5B-A2E5-4FC6-A0F8-E347BB8B0D38}']
//    { static Property Methods }
//    {class} function _Geta: Jb;
//
//    { static Methods }
//    {class} function init: Jb; cdecl;
//    {class} function a: Jb; cdecl; overload;
//    {class} function b: Integer; cdecl;
//
//    { static Property }
//    {class} property a: Jb read _Geta;
//  end;

//  [JavaSignature('com/tencent/connect/auth/b')]
//  Jb = interface(JObject)
//  ['{5E09482D-224F-43E8-A22D-C1D46BBFF699}']
//    { Property Methods }
//    function _Getb: JHashMap;
//    procedure _Setb(ab: JHashMap);
//    function _Getc: JString;
//    procedure _Setc(ac: JString);
//
//    { methods }
//    function a(P1: Jb_a): JString; cdecl; overload;
//    function c: JString; cdecl;
//
//    { Property }
//    property b: JHashMap read _Getb write _Setb;
//    property c: JString read _Getc write _Setc;
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{EA121152-C4FB-4408-857E-CFFAD65F2B86}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString; P2: JContext): Jc; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/auth/c')]
//  Jc = interface(JObject)
//  ['{E4DD1697-067C-4365-BF16-C2DFD801B56A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JActivity; P2: JString; P3: JIUiListener): Integer; cdecl; overload;
//    function a(P1: JActivity; P2: JString; P3: JIUiListener; P4: JString): Integer; cdecl; overload;
//    function a(P1: JFragment; P2: JString; P3: JIUiListener; P4: JString): Integer; cdecl; overload;
//    function a(P1: JActivity; P2: JString; P3: JIUiListener; P4: JString; P5: JString; P6: JString): Integer; cdecl; overload; //Deprecated
//    function b(P1: JActivity; P2: JString; P3: JIUiListener): Integer; cdecl; overload;
//    procedure a; cdecl; overload;
//    procedure a(P1: JIUiListener); cdecl; overload;
//    function b: JQQToken; cdecl; overload;
//    procedure a(P1: JString; P2: JString); cdecl; overload;
//    function c: Boolean; cdecl;
//    procedure a(P1: JContext; P2: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

  JQQTokenClass = interface(JObjectClass)
  ['{9EF3637E-CB30-4740-AAB5-E6891026586D}']
    { static Property Methods }
    {class} function _GetAUTH_WEB: Integer;
    {class} function _GetAUTH_QQ: Integer;
    {class} function _GetAUTH_QZONE: Integer;

    { static Methods }
    {class} function init(P1: JString): JQQToken; cdecl;

    { static Property }
    {class} property AUTH_WEB: Integer read _GetAUTH_WEB;
    {class} property AUTH_QQ: Integer read _GetAUTH_QQ;
    {class} property AUTH_QZONE: Integer read _GetAUTH_QZONE;
  end;

  [JavaSignature('com/tencent/connect/auth/QQToken')]
  JQQToken = interface(JObject)
  ['{F7C4AB55-A816-4C96-B9C7-D6DE3B7EC639}']
    { Property Methods }

    { methods }
    function isSessionValid: Boolean; cdecl;
    function getAppId: JString; cdecl;
    procedure setAppId(P1: JString); cdecl;
    function getAccessToken: JString; cdecl;
    procedure setAccessToken(P1: JString; P2: JString); cdecl;
    function getOpenId: JString; cdecl;
    procedure setOpenId(P1: JString); cdecl;
    function getAuthSource: Integer; cdecl;
    procedure setAuthSource(P1: Integer); cdecl;
    function getExpireTimeInSecond: Int64; cdecl;

    { Property }
  end;

  TJQQToken = class(TJavaGenericImport<JQQTokenClass, JQQToken>) end;

//  JAssistActivity_1Class = interface(JObjectClass)
//  ['{B9215151-E80F-4527-AD8E-DA633D89B968}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/common/AssistActivity$1')]
//  JAssistActivity_1 = interface(JObject)
//  ['{8C8BBACF-A6F6-44BE-9B34-EB4E8B8C7EC9}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJAssistActivity_1 = class(TJavaGenericImport<JAssistActivity_1Class, JAssistActivity_1>) end;

  JAssistActivityClass = interface(JObjectClass)
  ['{3722A241-F13E-48C0-BDD6-BDCB51E78442}']
    { static Property Methods }
    {class} function _GetEXTRA_INTENT: JString;

    { static Methods }
    {class} function init: JAssistActivity; cdecl;
    {class} function getAssistActivityIntent(P1: JContext): JIntent; cdecl;

    { static Property }
    {class} property EXTRA_INTENT: JString read _GetEXTRA_INTENT;
  end;

  [JavaSignature('com/tencent/connect/common/AssistActivity')]
  JAssistActivity = interface(JObject)
  ['{3D1761FA-249F-43EF-93A2-D7773306FB51}']
    { Property Methods }

    { methods }
    procedure setResultData(P1: Integer; P2: JIntent); cdecl;

    { Property }
  end;

  TJAssistActivity = class(TJavaGenericImport<JAssistActivityClass, JAssistActivity>) end;

//  JBaseApi_TempRequestListener_1Class = interface(JObjectClass)
//  ['{340B0172-BEE4-4709-A50C-49E362C6856A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/common/BaseApi$TempRequestListener$1')]
//  JBaseApi_TempRequestListener_1 = interface(JObject)
//  ['{39110172-DAA9-473B-AC97-CEA7244843B5}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJBaseApi_TempRequestListener_1 = class(TJavaGenericImport<JBaseApi_TempRequestListener_1Class, JBaseApi_TempRequestListener_1>) end;

  JBaseApi_TempRequestListenerClass = interface(JObjectClass)
  ['{53F60466-855A-4AF3-96BC-E45E75B7C585}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JBaseApi; P2: JIUiListener): JBaseApi_TempRequestListener; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/connect/common/BaseApi$TempRequestListener')]
  JBaseApi_TempRequestListener = interface(JObject)
  ['{E2FD3269-26B8-42D0-AEC7-A6D872B92EDF}']
    { Property Methods }

    { methods }
    procedure onComplete(P1: JJSONObject); cdecl;
    procedure onIOException(P1: JIOException); cdecl;
//    procedure onMalformedURLException(P1: JMalformedURLException); cdecl;
//    procedure onJSONException(P1: JJSONException); cdecl;
//    procedure onConnectTimeoutException(P1: JConnectTimeoutException); cdecl;
//    procedure onSocketTimeoutException(P1: JSocketTimeoutException); cdecl;
    procedure onNetworkUnavailableException(P1: JHttpUtils_NetworkUnavailableException); cdecl;
    procedure onHttpStatusException(P1: JHttpUtils_HttpStatusException); cdecl;
    procedure onUnknowException(P1: JException); cdecl;

    { Property }
  end;

  TJBaseApi_TempRequestListener = class(TJavaGenericImport<JBaseApi_TempRequestListenerClass, JBaseApi_TempRequestListener>) end;

  JBaseApiClass = interface(JObjectClass)
  ['{AD99C89D-A7F7-48B9-973F-3E9955F97C38}']
    { static Property Methods }
    {class} function _GetregisterChannel: JString;
    {class} function _GetinstallChannel: JString;
    {class} function _GetbusinessId: JString;
    {class} function _GetisOEM: Boolean;

    { static Methods }
//    {class} function init(P1: Jc; P2: JQQToken): JBaseApi; cdecl; overload;
    {class} function init(P1: JQQToken): JBaseApi; cdecl; overload;

    { static Property }
    {class} property registerChannel: JString read _GetregisterChannel;
    {class} property installChannel: JString read _GetinstallChannel;
    {class} property businessId: JString read _GetbusinessId;
    {class} property isOEM: Boolean read _GetisOEM;
  end;

  [JavaSignature('com/tencent/connect/common/BaseApi')]
  JBaseApi = interface(JObject)
  ['{C710A477-40EA-41BA-AA8C-BE0CBE547C60}']
    { Property Methods }

    { methods }
    procedure releaseResource; cdecl;

    { Property }
  end;

  TJBaseApi = class(TJavaGenericImport<JBaseApiClass, JBaseApi>) end;

  JConstantsClass = interface(JObjectClass)
  ['{9E8BC3A7-109E-4265-9466-EB7A2E25249E}']
    { static Property Methods }
    {class} function _GetDEFAULT_UIN: JString;
    {class} function _GetPACKAGE_QZONE: JString;
    {class} function _GetPACKAGE_QQ: JString;
    {class} function _GetPACKAGE_QQ_PAD: JString;
    {class} function _GetPACKAGE_TIM: JString;
    {class} function _GetPACKAGE_QIM: JString;
    {class} function _GetQQ_APPID: JString;
    {class} function _GetSIGNATRUE_QZONE: JString;
    {class} function _GetSDK_VERSION: JString;
    {class} function _GetSDK_QUA: JString;
    {class} function _GetSDK_VERSION_STRING: JString;
    {class} function _GetSDK_VERSION_REPORT: JString;
    {class} function _GetSDK_BUILD: JString;
    {class} function _GetPARAM_ACCESS_TOKEN: JString;
    {class} function _GetPARAM_KEY_STR: JString;
    {class} function _GetPARAM_KEY_TYPE: JString;
    {class} function _GetPARAM_PLATFORM: JString;
    {class} function _GetSOURCE_QZONE: JString;
    {class} function _GetSOURCE_QQ: JString;
    {class} function _GetDEFAULT_PF: JString;
    {class} function _GetFLAG_DEBUG: Boolean;
    {class} function _GetLOGIN_INFO: JString;
    {class} function _GetPARAM_CLIENT_ID: JString;
    {class} function _GetPARAM_APP_ID: JString;
    {class} function _GetPARAM_CONSUMER_KEY: JString;
    {class} function _GetPARAM_OPEN_ID: JString;
    {class} function _GetPARAM_HOPEN_ID: JString;
    {class} function _GetPARAM_PLATFORM_ID: JString;
    {class} function _GetKEY_REQUEST_CODE: JString;
    {class} function _GetPREFERENCE_PF: JString;
    {class} function _GetPARAM_SCOPE: JString;
    {class} function _GetPARAM_EXPIRES_IN: JString;
    {class} function _GetERROR_IO: Integer;
    {class} function _GetERROR_URL: Integer;
    {class} function _GetERROR_JSON: Integer;
    {class} function _GetERROR_PARAM: Integer;
    {class} function _GetERROR_UNKNOWN: Integer;
    {class} function _GetERROR_CONNECTTIMEOUT: Integer;
    {class} function _GetERROR_SOCKETTIMEOUT: Integer;
    {class} function _GetERROR_HTTPSTATUS_ERROR: Integer;
    {class} function _GetERROR_NETWORK_UNAVAILABLE: Integer;
    {class} function _GetERROR_FILE_EXISTED: Integer;
    {class} function _GetERROR_NO_SDCARD: Integer;
    {class} function _GetERROR_LOCATION_TIMEOUT: Integer;
    {class} function _GetERROR_LOCATION_VERIFY_FAILED: Integer;
    {class} function _GetERROR_QQVERSION_LOW: Integer;
    {class} function _GetMSG_LOCATION_TIMEOUT_ERROR: JString;
    {class} function _GetMSG_LOCATION_VERIFY_ERROR: JString;
    {class} function _GetMSG_IO_ERROR: JString;
    {class} function _GetMSG_URL_ERROR: JString;
    {class} function _GetMSG_JSON_ERROR: JString;
    {class} function _GetMSG_SHARE_TYPE_ERROR: JString;
    {class} function _GetMSG_PUBLISH_VIDEO_ERROR: JString;
    {class} function _GetMSG_PARAM_NULL_ERROR: JString;
    {class} function _GetMSG_PARAM_ERROR: JString;
    {class} function _GetMSG_PARAM_QQ_VERSION_ERROR: JString;
    {class} function _GetMSG_PARAM_TITLE_NULL_ERROR: JString;
    {class} function _GetMSG_PARAM_IMAGE_ERROR: JString;
    {class} function _GetMSG_PARAM_TARGETURL_NULL_ERROR: JString;
    {class} function _GetMSG_PARAM_TARGETURL_ERROR: JString;
    {class} function _GetMSG_PARAM_IMAGE_URL_FORMAT_ERROR: JString;
    {class} function _GetMSG_PARAM_IMAGE_URL_MUST_BE_LOCAL: JString;
    {class} function _GetMSG_PARAM_APPSHARE_TOO_LOW: JString;
    {class} function _GetMSG_PARAM_VERSION_TOO_LOW: JString;
    {class} function _GetMSG_UNKNOWN_ERROR: JString;
    {class} function _GetMSG_CONNECTTIMEOUT_ERROR: JString;
    {class} function _GetMSG_SOCKETTIMEOUT_ERROR: JString;
    {class} function _GetMSG_IMAGE_ERROR: JString;
    {class} function _GetMSG_OPEN_BROWSER_ERROR: JString;
    {class} function _GetMSG_SHARE_NOSD_ERROR: JString;
    {class} function _GetMSG_SHARE_GETIMG_ERROR: JString;
    {class} function _GetMSG_SHARE_TO_QQ_ERROR: JString;
    {class} function _GetMSG_NO_SDCARD: JString;
    {class} function _GetMSG_NOT_CALL_ON_MAIN_THREAD: JString;
    {class} function _GetHTTP_GET: JString;
    {class} function _GetHTTP_POST: JString;
    {class} function _GetKEY_PARAMS: JString;
    {class} function _GetKEY_ACTION: JString;
    {class} function _GetKEY_RESPONSE: JString;
    {class} function _GetKEY_ERROR_CODE: JString;
    {class} function _GetKEY_ERROR_MSG: JString;
    {class} function _GetKEY_ERROR_DETAIL: JString;
    {class} function _GetKEY_APP_NAME: JString;
    {class} function _GetCODE_REQUEST_MIN: Integer;
    {class} function _GetCODE_REQUEST_MAX: Integer;
    {class} function _GetUI_NONE: Integer;
    {class} function _GetUI_ACTIVITY: Integer;
    {class} function _GetUI_DIALOG: Integer;
    {class} function _GetUI_CHECK_TOKEN: Integer;
    {class} function _GetUI_DOWNLOAD_QQ: Integer;
    {class} function _GetACTIVITY_OK: Integer;
    {class} function _GetACTIVITY_CANCEL: Integer;
    {class} function _GetREQUEST_API: Integer;
    {class} function _GetREQUEST_LOGIN: Integer;
    {class} function _GetREQUEST_AVATER: Integer;
    {class} function _GetREQUEST_OLD_SHARE: Integer;
    {class} function _GetREQUEST_OLD_QZSHARE: Integer;
    {class} function _GetREQUEST_SOCIAL_API: Integer;
    {class} function _GetREQUEST_SOCIAL_H5: Integer;
    {class} function _GetREQUEST_APPBAR: Integer;
    {class} function _GetREQUEST_QQ_SHARE: Integer;
    {class} function _GetREQUEST_QZONE_SHARE: Integer;
    {class} function _GetREQUEST_QQ_FAVORITES: Integer;
    {class} function _GetREQUEST_SEND_TO_MY_COMPUTER: Integer;
    {class} function _GetREQUEST_SHARE_TO_TROOP_BAR: Integer;
    {class} function _GetMOBILEQQ_PACKAGE_NAME: JString;
    {class} function _GetCANCEL_URI: JString;
    {class} function _GetCLOSE_URI: JString;
    {class} function _GetDOWNLOAD_URI: JString;
    {class} function _GetVIA_REPORT_TYPE_SSO_LOGIN: JString;
    {class} function _GetVIA_REPORT_TYPE_SHARE_TO_QQ: JString;
    {class} function _GetVIA_REPORT_TYPE_SHARE_TO_QZONE: JString;
    {class} function _GetVIA_REPORT_TYPE_SET_AVATAR: JString;
    {class} function _GetVIA_REPORT_TYPE_JOININ_GROUP: JString;
    {class} function _GetVIA_REPORT_TYPE_MAKE_FRIEND: JString;
    {class} function _GetVIA_REPORT_TYPE_WPA_STATE: JString;
    {class} function _GetVIA_REPORT_TYPE_START_WAP: JString;
    {class} function _GetVIA_REPORT_TYPE_START_GROUP: JString;
    {class} function _GetVIA_REPORT_TYPE_BIND_GROUP: JString;
    {class} function _GetVIA_REPORT_TYPE_QQFAVORITES: JString;
    {class} function _GetVIA_REPORT_TYPE_DATALINE: JString;
    {class} function _GetVIA_REPORT_TYPE_SHARE_TO_TROOPBAR: JString;
    {class} function _GetVIA_RESULT_SUCCESS: JString;
    {class} function _GetVIA_RESULT_FAIL: JString;
    {class} function _GetVIA_ACT_TYPE_THREE: JString;
    {class} function _GetVIA_ACT_TYPE_FIVE: JString;
    {class} function _GetVIA_ACT_TYPE_SEVEN: JString;
    {class} function _GetVIA_ACT_TYPE_TWENTY_EIGHT: JString;
    {class} function _GetVIA_ACT_TYPE_EIGHTEEN: JString;
    {class} function _GetVIA_ACT_TYPE_NINETEEN: JString;
    {class} function _GetVIA_SHARE_TYPE_IMAGE_TEXT: JString;
    {class} function _GetVIA_SHARE_TYPE_IMAGE: JString;
    {class} function _GetVIA_SHARE_TYPE_MUSIC: JString;
    {class} function _GetVIA_SHARE_TYPE_APP: JString;
    {class} function _GetVIA_SHARE_TYPE_TEXT: JString;
    {class} function _GetVIA_SHARE_TYPE_INFO: JString;
    {class} function _GetVIA_SHARE_TYPE_PUBLISHMOOD: JString;
    {class} function _GetVIA_SHARE_TYPE_PUBLISHVIDEO: JString;
    {class} function _GetVIA_TO_TYPE_QQ_FRIEND: JString;
    {class} function _GetVIA_TO_TYPE_QQ_GROUP: JString;
    {class} function _GetVIA_TO_TYPE_QQ_DISCUSS_GROUP: JString;
    {class} function _GetVIA_TO_TYPE_QZONE: JString;
    {class} function _GetVIA_SET_AVATAR: JString;
    {class} function _GetVIA_SET_AVATAR_SUCCEED: JString;
    {class} function _GetVIA_WAP_STATE: JString;
    {class} function _GetVIA_START_WAP: JString;
    {class} function _GetVIA_JOIN_GROUP: JString;
    {class} function _GetVIA_MAKE_FRIEND: JString;
    {class} function _GetVIA_BIND_GROUP: JString;
    {class} function _GetVIA_SHARE_TO_QQ: JString;
    {class} function _GetVIA_SHARE_TO_QZONE: JString;
    {class} function _GetVIA_SHARE_TO_TROOPBAR: JString;
    {class} function _GetVIA_SSO_LOGIN: JString;
    {class} function _GetVIA_CALL_SOURCE_SQ: JString;
    {class} function _GetVIA_CALL_SOURCE_H5: JString;
    {class} function _GetVIA_SDK: JString;
    {class} function _GetSTR_EMPTY: JString;
    {class} function _GetVIA_NO_VALUE: JString;

    { static Methods }
    {class} function init: JConstants; cdecl;

    { static Property }
    {class} property DEFAULT_UIN: JString read _GetDEFAULT_UIN;
    {class} property PACKAGE_QZONE: JString read _GetPACKAGE_QZONE;
    {class} property PACKAGE_QQ: JString read _GetPACKAGE_QQ;
    {class} property PACKAGE_QQ_PAD: JString read _GetPACKAGE_QQ_PAD;
    {class} property PACKAGE_TIM: JString read _GetPACKAGE_TIM;
    {class} property PACKAGE_QIM: JString read _GetPACKAGE_QIM;
    {class} property QQ_APPID: JString read _GetQQ_APPID;
    {class} property SIGNATRUE_QZONE: JString read _GetSIGNATRUE_QZONE;
    {class} property SDK_VERSION: JString read _GetSDK_VERSION;
    {class} property SDK_QUA: JString read _GetSDK_QUA;
    {class} property SDK_VERSION_STRING: JString read _GetSDK_VERSION_STRING;
    {class} property SDK_VERSION_REPORT: JString read _GetSDK_VERSION_REPORT;
    {class} property SDK_BUILD: JString read _GetSDK_BUILD;
    {class} property PARAM_ACCESS_TOKEN: JString read _GetPARAM_ACCESS_TOKEN;
    {class} property PARAM_KEY_STR: JString read _GetPARAM_KEY_STR;
    {class} property PARAM_KEY_TYPE: JString read _GetPARAM_KEY_TYPE;
    {class} property PARAM_PLATFORM: JString read _GetPARAM_PLATFORM;
    {class} property SOURCE_QZONE: JString read _GetSOURCE_QZONE;
    {class} property SOURCE_QQ: JString read _GetSOURCE_QQ;
    {class} property DEFAULT_PF: JString read _GetDEFAULT_PF;
    {class} property FLAG_DEBUG: Boolean read _GetFLAG_DEBUG;
    {class} property LOGIN_INFO: JString read _GetLOGIN_INFO;
    {class} property PARAM_CLIENT_ID: JString read _GetPARAM_CLIENT_ID;
    {class} property PARAM_APP_ID: JString read _GetPARAM_APP_ID;
    {class} property PARAM_CONSUMER_KEY: JString read _GetPARAM_CONSUMER_KEY;
    {class} property PARAM_OPEN_ID: JString read _GetPARAM_OPEN_ID;
    {class} property PARAM_HOPEN_ID: JString read _GetPARAM_HOPEN_ID;
    {class} property PARAM_PLATFORM_ID: JString read _GetPARAM_PLATFORM_ID;
    {class} property KEY_REQUEST_CODE: JString read _GetKEY_REQUEST_CODE;
    {class} property PREFERENCE_PF: JString read _GetPREFERENCE_PF;
    {class} property PARAM_SCOPE: JString read _GetPARAM_SCOPE;
    {class} property PARAM_EXPIRES_IN: JString read _GetPARAM_EXPIRES_IN;
    {class} property ERROR_IO: Integer read _GetERROR_IO;
    {class} property ERROR_URL: Integer read _GetERROR_URL;
    {class} property ERROR_JSON: Integer read _GetERROR_JSON;
    {class} property ERROR_PARAM: Integer read _GetERROR_PARAM;
    {class} property ERROR_UNKNOWN: Integer read _GetERROR_UNKNOWN;
    {class} property ERROR_CONNECTTIMEOUT: Integer read _GetERROR_CONNECTTIMEOUT;
    {class} property ERROR_SOCKETTIMEOUT: Integer read _GetERROR_SOCKETTIMEOUT;
    {class} property ERROR_HTTPSTATUS_ERROR: Integer read _GetERROR_HTTPSTATUS_ERROR;
    {class} property ERROR_NETWORK_UNAVAILABLE: Integer read _GetERROR_NETWORK_UNAVAILABLE;
    {class} property ERROR_FILE_EXISTED: Integer read _GetERROR_FILE_EXISTED;
    {class} property ERROR_NO_SDCARD: Integer read _GetERROR_NO_SDCARD;
    {class} property ERROR_LOCATION_TIMEOUT: Integer read _GetERROR_LOCATION_TIMEOUT;
    {class} property ERROR_LOCATION_VERIFY_FAILED: Integer read _GetERROR_LOCATION_VERIFY_FAILED;
    {class} property ERROR_QQVERSION_LOW: Integer read _GetERROR_QQVERSION_LOW;
    {class} property MSG_LOCATION_TIMEOUT_ERROR: JString read _GetMSG_LOCATION_TIMEOUT_ERROR;
    {class} property MSG_LOCATION_VERIFY_ERROR: JString read _GetMSG_LOCATION_VERIFY_ERROR;
    {class} property MSG_IO_ERROR: JString read _GetMSG_IO_ERROR;
    {class} property MSG_URL_ERROR: JString read _GetMSG_URL_ERROR;
    {class} property MSG_JSON_ERROR: JString read _GetMSG_JSON_ERROR;
    {class} property MSG_SHARE_TYPE_ERROR: JString read _GetMSG_SHARE_TYPE_ERROR;
    {class} property MSG_PUBLISH_VIDEO_ERROR: JString read _GetMSG_PUBLISH_VIDEO_ERROR;
    {class} property MSG_PARAM_NULL_ERROR: JString read _GetMSG_PARAM_NULL_ERROR;
    {class} property MSG_PARAM_ERROR: JString read _GetMSG_PARAM_ERROR;
    {class} property MSG_PARAM_QQ_VERSION_ERROR: JString read _GetMSG_PARAM_QQ_VERSION_ERROR;
    {class} property MSG_PARAM_TITLE_NULL_ERROR: JString read _GetMSG_PARAM_TITLE_NULL_ERROR;
    {class} property MSG_PARAM_IMAGE_ERROR: JString read _GetMSG_PARAM_IMAGE_ERROR;
    {class} property MSG_PARAM_TARGETURL_NULL_ERROR: JString read _GetMSG_PARAM_TARGETURL_NULL_ERROR;
    {class} property MSG_PARAM_TARGETURL_ERROR: JString read _GetMSG_PARAM_TARGETURL_ERROR;
    {class} property MSG_PARAM_IMAGE_URL_FORMAT_ERROR: JString read _GetMSG_PARAM_IMAGE_URL_FORMAT_ERROR;
    {class} property MSG_PARAM_IMAGE_URL_MUST_BE_LOCAL: JString read _GetMSG_PARAM_IMAGE_URL_MUST_BE_LOCAL;
    {class} property MSG_PARAM_APPSHARE_TOO_LOW: JString read _GetMSG_PARAM_APPSHARE_TOO_LOW;
    {class} property MSG_PARAM_VERSION_TOO_LOW: JString read _GetMSG_PARAM_VERSION_TOO_LOW;
    {class} property MSG_UNKNOWN_ERROR: JString read _GetMSG_UNKNOWN_ERROR;
    {class} property MSG_CONNECTTIMEOUT_ERROR: JString read _GetMSG_CONNECTTIMEOUT_ERROR;
    {class} property MSG_SOCKETTIMEOUT_ERROR: JString read _GetMSG_SOCKETTIMEOUT_ERROR;
    {class} property MSG_IMAGE_ERROR: JString read _GetMSG_IMAGE_ERROR;
    {class} property MSG_OPEN_BROWSER_ERROR: JString read _GetMSG_OPEN_BROWSER_ERROR;
    {class} property MSG_SHARE_NOSD_ERROR: JString read _GetMSG_SHARE_NOSD_ERROR;
    {class} property MSG_SHARE_GETIMG_ERROR: JString read _GetMSG_SHARE_GETIMG_ERROR;
    {class} property MSG_SHARE_TO_QQ_ERROR: JString read _GetMSG_SHARE_TO_QQ_ERROR;
    {class} property MSG_NO_SDCARD: JString read _GetMSG_NO_SDCARD;
    {class} property MSG_NOT_CALL_ON_MAIN_THREAD: JString read _GetMSG_NOT_CALL_ON_MAIN_THREAD;
    {class} property HTTP_GET: JString read _GetHTTP_GET;
    {class} property HTTP_POST: JString read _GetHTTP_POST;
    {class} property KEY_PARAMS: JString read _GetKEY_PARAMS;
    {class} property KEY_ACTION: JString read _GetKEY_ACTION;
    {class} property KEY_RESPONSE: JString read _GetKEY_RESPONSE;
    {class} property KEY_ERROR_CODE: JString read _GetKEY_ERROR_CODE;
    {class} property KEY_ERROR_MSG: JString read _GetKEY_ERROR_MSG;
    {class} property KEY_ERROR_DETAIL: JString read _GetKEY_ERROR_DETAIL;
    {class} property KEY_APP_NAME: JString read _GetKEY_APP_NAME;
    {class} property CODE_REQUEST_MIN: Integer read _GetCODE_REQUEST_MIN;
    {class} property CODE_REQUEST_MAX: Integer read _GetCODE_REQUEST_MAX;
    {class} property UI_NONE: Integer read _GetUI_NONE;
    {class} property UI_ACTIVITY: Integer read _GetUI_ACTIVITY;
    {class} property UI_DIALOG: Integer read _GetUI_DIALOG;
    {class} property UI_CHECK_TOKEN: Integer read _GetUI_CHECK_TOKEN;
    {class} property UI_DOWNLOAD_QQ: Integer read _GetUI_DOWNLOAD_QQ;
    {class} property ACTIVITY_OK: Integer read _GetACTIVITY_OK;
    {class} property ACTIVITY_CANCEL: Integer read _GetACTIVITY_CANCEL;
    {class} property REQUEST_API: Integer read _GetREQUEST_API;
    {class} property REQUEST_LOGIN: Integer read _GetREQUEST_LOGIN;
    {class} property REQUEST_AVATER: Integer read _GetREQUEST_AVATER;
    {class} property REQUEST_OLD_SHARE: Integer read _GetREQUEST_OLD_SHARE;
    {class} property REQUEST_OLD_QZSHARE: Integer read _GetREQUEST_OLD_QZSHARE;
    {class} property REQUEST_SOCIAL_API: Integer read _GetREQUEST_SOCIAL_API;
    {class} property REQUEST_SOCIAL_H5: Integer read _GetREQUEST_SOCIAL_H5;
    {class} property REQUEST_APPBAR: Integer read _GetREQUEST_APPBAR;
    {class} property REQUEST_QQ_SHARE: Integer read _GetREQUEST_QQ_SHARE;
    {class} property REQUEST_QZONE_SHARE: Integer read _GetREQUEST_QZONE_SHARE;
    {class} property REQUEST_QQ_FAVORITES: Integer read _GetREQUEST_QQ_FAVORITES;
    {class} property REQUEST_SEND_TO_MY_COMPUTER: Integer read _GetREQUEST_SEND_TO_MY_COMPUTER;
    {class} property REQUEST_SHARE_TO_TROOP_BAR: Integer read _GetREQUEST_SHARE_TO_TROOP_BAR;
    {class} property MOBILEQQ_PACKAGE_NAME: JString read _GetMOBILEQQ_PACKAGE_NAME;
    {class} property CANCEL_URI: JString read _GetCANCEL_URI;
    {class} property CLOSE_URI: JString read _GetCLOSE_URI;
    {class} property DOWNLOAD_URI: JString read _GetDOWNLOAD_URI;
    {class} property VIA_REPORT_TYPE_SSO_LOGIN: JString read _GetVIA_REPORT_TYPE_SSO_LOGIN;
    {class} property VIA_REPORT_TYPE_SHARE_TO_QQ: JString read _GetVIA_REPORT_TYPE_SHARE_TO_QQ;
    {class} property VIA_REPORT_TYPE_SHARE_TO_QZONE: JString read _GetVIA_REPORT_TYPE_SHARE_TO_QZONE;
    {class} property VIA_REPORT_TYPE_SET_AVATAR: JString read _GetVIA_REPORT_TYPE_SET_AVATAR;
    {class} property VIA_REPORT_TYPE_JOININ_GROUP: JString read _GetVIA_REPORT_TYPE_JOININ_GROUP;
    {class} property VIA_REPORT_TYPE_MAKE_FRIEND: JString read _GetVIA_REPORT_TYPE_MAKE_FRIEND;
    {class} property VIA_REPORT_TYPE_WPA_STATE: JString read _GetVIA_REPORT_TYPE_WPA_STATE;
    {class} property VIA_REPORT_TYPE_START_WAP: JString read _GetVIA_REPORT_TYPE_START_WAP;
    {class} property VIA_REPORT_TYPE_START_GROUP: JString read _GetVIA_REPORT_TYPE_START_GROUP;
    {class} property VIA_REPORT_TYPE_BIND_GROUP: JString read _GetVIA_REPORT_TYPE_BIND_GROUP;
    {class} property VIA_REPORT_TYPE_QQFAVORITES: JString read _GetVIA_REPORT_TYPE_QQFAVORITES;
    {class} property VIA_REPORT_TYPE_DATALINE: JString read _GetVIA_REPORT_TYPE_DATALINE;
    {class} property VIA_REPORT_TYPE_SHARE_TO_TROOPBAR: JString read _GetVIA_REPORT_TYPE_SHARE_TO_TROOPBAR;
    {class} property VIA_RESULT_SUCCESS: JString read _GetVIA_RESULT_SUCCESS;
    {class} property VIA_RESULT_FAIL: JString read _GetVIA_RESULT_FAIL;
    {class} property VIA_ACT_TYPE_THREE: JString read _GetVIA_ACT_TYPE_THREE;
    {class} property VIA_ACT_TYPE_FIVE: JString read _GetVIA_ACT_TYPE_FIVE;
    {class} property VIA_ACT_TYPE_SEVEN: JString read _GetVIA_ACT_TYPE_SEVEN;
    {class} property VIA_ACT_TYPE_TWENTY_EIGHT: JString read _GetVIA_ACT_TYPE_TWENTY_EIGHT;
    {class} property VIA_ACT_TYPE_EIGHTEEN: JString read _GetVIA_ACT_TYPE_EIGHTEEN;
    {class} property VIA_ACT_TYPE_NINETEEN: JString read _GetVIA_ACT_TYPE_NINETEEN;
    {class} property VIA_SHARE_TYPE_IMAGE_TEXT: JString read _GetVIA_SHARE_TYPE_IMAGE_TEXT;
    {class} property VIA_SHARE_TYPE_IMAGE: JString read _GetVIA_SHARE_TYPE_IMAGE;
    {class} property VIA_SHARE_TYPE_MUSIC: JString read _GetVIA_SHARE_TYPE_MUSIC;
    {class} property VIA_SHARE_TYPE_APP: JString read _GetVIA_SHARE_TYPE_APP;
    {class} property VIA_SHARE_TYPE_TEXT: JString read _GetVIA_SHARE_TYPE_TEXT;
    {class} property VIA_SHARE_TYPE_INFO: JString read _GetVIA_SHARE_TYPE_INFO;
    {class} property VIA_SHARE_TYPE_PUBLISHMOOD: JString read _GetVIA_SHARE_TYPE_PUBLISHMOOD;
    {class} property VIA_SHARE_TYPE_PUBLISHVIDEO: JString read _GetVIA_SHARE_TYPE_PUBLISHVIDEO;
    {class} property VIA_TO_TYPE_QQ_FRIEND: JString read _GetVIA_TO_TYPE_QQ_FRIEND;
    {class} property VIA_TO_TYPE_QQ_GROUP: JString read _GetVIA_TO_TYPE_QQ_GROUP;
    {class} property VIA_TO_TYPE_QQ_DISCUSS_GROUP: JString read _GetVIA_TO_TYPE_QQ_DISCUSS_GROUP;
    {class} property VIA_TO_TYPE_QZONE: JString read _GetVIA_TO_TYPE_QZONE;
    {class} property VIA_SET_AVATAR: JString read _GetVIA_SET_AVATAR;
    {class} property VIA_SET_AVATAR_SUCCEED: JString read _GetVIA_SET_AVATAR_SUCCEED;
    {class} property VIA_WAP_STATE: JString read _GetVIA_WAP_STATE;
    {class} property VIA_START_WAP: JString read _GetVIA_START_WAP;
    {class} property VIA_JOIN_GROUP: JString read _GetVIA_JOIN_GROUP;
    {class} property VIA_MAKE_FRIEND: JString read _GetVIA_MAKE_FRIEND;
    {class} property VIA_BIND_GROUP: JString read _GetVIA_BIND_GROUP;
    {class} property VIA_SHARE_TO_QQ: JString read _GetVIA_SHARE_TO_QQ;
    {class} property VIA_SHARE_TO_QZONE: JString read _GetVIA_SHARE_TO_QZONE;
    {class} property VIA_SHARE_TO_TROOPBAR: JString read _GetVIA_SHARE_TO_TROOPBAR;
    {class} property VIA_SSO_LOGIN: JString read _GetVIA_SSO_LOGIN;
    {class} property VIA_CALL_SOURCE_SQ: JString read _GetVIA_CALL_SOURCE_SQ;
    {class} property VIA_CALL_SOURCE_H5: JString read _GetVIA_CALL_SOURCE_H5;
    {class} property VIA_SDK: JString read _GetVIA_SDK;
    {class} property STR_EMPTY: JString read _GetSTR_EMPTY;
    {class} property VIA_NO_VALUE: JString read _GetVIA_NO_VALUE;
  end;

  [JavaSignature('com/tencent/connect/common/Constants')]
  JConstants = interface(JObject)
  ['{2ED7CF91-48FF-4A66-9596-930D2BC4BA8C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConstants = class(TJavaGenericImport<JConstantsClass, JConstants>) end;

  JUIListenerManager_ApiTaskClass = interface(JObjectClass)
  ['{88A0ADB8-3035-4C83-815E-7EDCC34D0B0E}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JUIListenerManager; P2: Integer; P3: JIUiListener): JUIListenerManager_ApiTask; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/connect/common/UIListenerManager$ApiTask')]
  JUIListenerManager_ApiTask = interface(JObject)
  ['{23EE449B-5E13-4487-A1C0-93F9E783A2EF}']
    { Property Methods }
    function _GetmRequestCode: Integer;
    procedure _SetmRequestCode(amRequestCode: Integer);
    function _GetmListener: JIUiListener;
    procedure _SetmListener(amListener: JIUiListener);

    { methods }

    { Property }
    property mRequestCode: Integer read _GetmRequestCode write _SetmRequestCode;
    property mListener: JIUiListener read _GetmListener write _SetmListener;
  end;

  TJUIListenerManager_ApiTask = class(TJavaGenericImport<JUIListenerManager_ApiTaskClass, JUIListenerManager_ApiTask>) end;

  JUIListenerManagerClass = interface(JObjectClass)
  ['{4AFBF414-2967-464F-B619-2C6A079D8897}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JUIListenerManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/connect/common/UIListenerManager')]
  JUIListenerManager = interface(JObject)
  ['{EDAEAAAD-41A1-4808-A763-F5E965F7B934}']
    { Property Methods }

    { methods }
    function setListenerWithRequestcode(P1: Integer; P2: JIUiListener): JObject; cdecl;
    function setListnerWithAction(P1: JString; P2: JIUiListener): JObject; cdecl;
    function getListnerWithRequestCode(P1: Integer): JIUiListener; cdecl;
    function getListnerWithAction(P1: JString): JIUiListener; cdecl;
    procedure handleDataToListener(P1: JIntent; P2: JIUiListener); cdecl;
    function onActivityResult(P1: Integer; P2: Integer; P3: JIntent; P4: JIUiListener): Boolean; cdecl;

    { Property }
  end;

  TJUIListenerManager = class(TJavaGenericImport<JUIListenerManagerClass, JUIListenerManager>) end;

//  Ja_1Class = interface(JObjectClass)
//  ['{CDC13ADF-620E-4974-A6EF-2255A18008A0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/a$1')]
//  Ja_1 = interface(JObject)
//  ['{4317A7DF-6721-417E-ACF6-13D074E74B52}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJa_1 = class(TJavaGenericImport<Ja_1Class, Ja_1>) end;

//  Ja_2Class = interface(JObjectClass)
//  ['{983C2533-FF1D-42A8-9D87-F0D42157382B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/a$2')]
//  Ja_2 = interface(JObject)
//  ['{B220ADA0-A970-4771-B112-795D72A55EA5}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJa_2 = class(TJavaGenericImport<Ja_2Class, Ja_2>) end;

//  Ja_3Class = interface(JObjectClass)
//  ['{A39325CC-5FE3-4CAC-8029-1B5A8F0F46FB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/a$3')]
//  Ja_3 = interface(JObject)
//  ['{A6D485F7-DD09-47C2-840F-F1408CEF7B11}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJa_3 = class(TJavaGenericImport<Ja_3Class, Ja_3>) end;

//  Ja_4Class = interface(JObjectClass)
//  ['{E966A786-56EC-4E9A-A8AE-01BF45258D12}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/a$4')]
//  Ja_4 = interface(JObject)
//  ['{BA044B73-0745-4759-A510-228632D5243C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJa_4 = class(TJavaGenericImport<Ja_4Class, Ja_4>) end;

//  JaClass = interface(JObjectClass)
//  ['{563DADF8-917C-43DA-844C-310B85C0B581}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} procedure a(P1: JContext; P2: JString; P3: Jc); cdecl; overload;
//    {class} procedure a(P1: JContext; P2: JArrayList; P3: Jc); cdecl; overload;
//    {class} function a(P1: JString; P2: Integer): JBitmap; cdecl; overload;
//    {class} function a(P1: JBitmapFactory_Options; P2: Integer; P3: Integer): Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/a')]
//  Ja = interface(JObject)
//  ['{AE155C56-B8AE-44E9-A316-B71146FDFA1D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JQQShare_1Class = interface(JObjectClass)
//  ['{17E536A3-7E94-4A12-837F-521F6154EA9E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/QQShare$1')]
//  JQQShare_1 = interface(JObject)
//  ['{7FA9D937-AF39-4BEB-A37D-4B12028F1FD1}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: JString); cdecl; overload;
//    procedure a(P1: Integer; P2: JArrayList); cdecl; overload;
//
//    { Property }
//  end;

//  TJQQShare_1 = class(TJavaGenericImport<JQQShare_1Class, JQQShare_1>) end;

//  JQQShare_2Class = interface(JObjectClass)
//  ['{A0AAD1C3-651C-446F-96C3-1B0F20CA8170}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/QQShare$2')]
//  JQQShare_2 = interface(JObject)
//  ['{CA86178E-A9DF-4257-98FD-AC323F777AEA}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: JString); cdecl; overload;
//    procedure a(P1: Integer; P2: JArrayList); cdecl; overload;
//
//    { Property }
//  end;

//  TJQQShare_2 = class(TJavaGenericImport<JQQShare_2Class, JQQShare_2>) end;

  JQQShareClass = interface(JObjectClass)
  ['{105D12A1-8311-4F7C-BB6C-88830A146409}']
    { static Property Methods }
    {class} function _GetQQ_SHARE_TITLE_MAX_LENGTH: Integer;
    {class} function _GetQQ_SHARE_SUMMARY_MAX_LENGTH: Integer;
    {class} function _GetSHARE_TO_QQ_IMAGE_URL: JString;
    {class} function _GetSHARE_TO_QQ_IMAGE_LOCAL_URL: JString;
    {class} function _GetSHARE_TO_QQ_TITLE: JString;
    {class} function _GetSHARE_TO_QQ_SUMMARY: JString;
    {class} function _GetSHARE_TO_QQ_SITE: JString;
    {class} function _GetSHARE_TO_QQ_TARGET_URL: JString;
    {class} function _GetSHARE_TO_QQ_APP_NAME: JString;
    {class} function _GetSHARE_TO_QQ_AUDIO_URL: JString;
    {class} function _GetSHARE_TO_QQ_KEY_TYPE: JString;
    {class} function _GetSHARE_TO_QQ_EXT_STR: JString;
    {class} function _GetSHARE_TO_QQ_EXT_INT: JString;
    {class} function _GetSHARE_TO_QQ_FLAG_QZONE_AUTO_OPEN: Integer;
    {class} function _GetSHARE_TO_QQ_FLAG_QZONE_ITEM_HIDE: Integer;
    {class} function _GetSHARE_TO_QQ_TYPE_DEFAULT: Integer;
    {class} function _GetSHARE_TO_QQ_TYPE_AUDIO: Integer;
    {class} function _GetSHARE_TO_QQ_TYPE_IMAGE: Integer;
    {class} function _GetSHARE_TO_QQ_TYPE_APP: Integer;

    { static Methods }
    {class} function init(P1: JContext; P2: JQQToken): JQQShare; cdecl;

    { static Property }
    {class} property QQ_SHARE_TITLE_MAX_LENGTH: Integer read _GetQQ_SHARE_TITLE_MAX_LENGTH;
    {class} property QQ_SHARE_SUMMARY_MAX_LENGTH: Integer read _GetQQ_SHARE_SUMMARY_MAX_LENGTH;
    {class} property SHARE_TO_QQ_IMAGE_URL: JString read _GetSHARE_TO_QQ_IMAGE_URL;
    {class} property SHARE_TO_QQ_IMAGE_LOCAL_URL: JString read _GetSHARE_TO_QQ_IMAGE_LOCAL_URL;
    {class} property SHARE_TO_QQ_TITLE: JString read _GetSHARE_TO_QQ_TITLE;
    {class} property SHARE_TO_QQ_SUMMARY: JString read _GetSHARE_TO_QQ_SUMMARY;
    {class} property SHARE_TO_QQ_SITE: JString read _GetSHARE_TO_QQ_SITE;
    {class} property SHARE_TO_QQ_TARGET_URL: JString read _GetSHARE_TO_QQ_TARGET_URL;
    {class} property SHARE_TO_QQ_APP_NAME: JString read _GetSHARE_TO_QQ_APP_NAME;
    {class} property SHARE_TO_QQ_AUDIO_URL: JString read _GetSHARE_TO_QQ_AUDIO_URL;
    {class} property SHARE_TO_QQ_KEY_TYPE: JString read _GetSHARE_TO_QQ_KEY_TYPE;
    {class} property SHARE_TO_QQ_EXT_STR: JString read _GetSHARE_TO_QQ_EXT_STR;
    {class} property SHARE_TO_QQ_EXT_INT: JString read _GetSHARE_TO_QQ_EXT_INT;
    {class} property SHARE_TO_QQ_FLAG_QZONE_AUTO_OPEN: Integer read _GetSHARE_TO_QQ_FLAG_QZONE_AUTO_OPEN;
    {class} property SHARE_TO_QQ_FLAG_QZONE_ITEM_HIDE: Integer read _GetSHARE_TO_QQ_FLAG_QZONE_ITEM_HIDE;
    {class} property SHARE_TO_QQ_TYPE_DEFAULT: Integer read _GetSHARE_TO_QQ_TYPE_DEFAULT;
    {class} property SHARE_TO_QQ_TYPE_AUDIO: Integer read _GetSHARE_TO_QQ_TYPE_AUDIO;
    {class} property SHARE_TO_QQ_TYPE_IMAGE: Integer read _GetSHARE_TO_QQ_TYPE_IMAGE;
    {class} property SHARE_TO_QQ_TYPE_APP: Integer read _GetSHARE_TO_QQ_TYPE_APP;
  end;

  [JavaSignature('com/tencent/connect/share/QQShare')]
  JQQShare = interface(JObject)
  ['{61AE7E8C-2ED0-4560-ACA6-9FED0DBF8D86}']
    { Property Methods }
    function _GetmViaShareQQType: JString;
    procedure _SetmViaShareQQType(amViaShareQQType: JString);

    { methods }
    procedure shareToQQ(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure releaseResource; cdecl;

    { Property }
    property mViaShareQQType: JString read _GetmViaShareQQType write _SetmViaShareQQType;
  end;

  TJQQShare = class(TJavaGenericImport<JQQShareClass, JQQShare>) end;

//  JQzonePublish_1Class = interface(JObjectClass)
//  ['{A6AFF752-E7F2-4198-97A9-ED91AFB88B3D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/QzonePublish$1')]
//  JQzonePublish_1 = interface(JObject)
//  ['{6C2950B8-F931-40D2-B484-C931A3709FAF}']
//    { Property Methods }
//
//    { methods }
//    procedure onPrepared(P1: JMediaPlayer); cdecl;
//
//    { Property }
//  end;

//  TJQzonePublish_1 = class(TJavaGenericImport<JQzonePublish_1Class, JQzonePublish_1>) end;

//  JQzonePublish_2Class = interface(JObjectClass)
//  ['{9043A7F7-CF19-4F21-BDA0-D1D515E0ED08}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/QzonePublish$2')]
//  JQzonePublish_2 = interface(JObject)
//  ['{BB5AE804-3CEF-46CC-807E-BA550F08A3CB}']
//    { Property Methods }
//
//    { methods }
//    function onError(P1: JMediaPlayer; P2: Integer; P3: Integer): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJQzonePublish_2 = class(TJavaGenericImport<JQzonePublish_2Class, JQzonePublish_2>) end;

  JQzonePublishClass = interface(JObjectClass)
  ['{7036569C-FACF-44C5-A7EC-A0BAE2198B37}']
    { static Property Methods }
    {class} function _GetPUBLISH_TO_QZONE_KEY_TYPE: JString;
    {class} function _GetPUBLISH_TO_QZONE_TYPE_PUBLISHMOOD: Integer;
    {class} function _GetPUBLISH_TO_QZONE_TYPE_PUBLISHVIDEO: Integer;
    {class} function _GetPUBLISH_TO_QZONE_IMAGE_URL: JString;
    {class} function _GetPUBLISH_TO_QZONE_SUMMARY: JString;
    {class} function _GetPUBLISH_TO_QZONE_VIDEO_PATH: JString;
    {class} function _GetPUBLISH_TO_QZONE_VIDEO_DURATION: JString;
    {class} function _GetPUBLISH_TO_QZONE_VIDEO_SIZE: JString;
    {class} function _GetPUBLISH_TO_QZONE_APP_NAME: JString;
    {class} function _GetHULIAN_EXTRA_SCENE: JString;
    {class} function _GetHULIAN_CALL_BACK: JString;
    {class} function _GetPUBLISH_TO_QZONE_EXTMAP: JString;

    { static Methods }
    {class} function init(P1: JContext; P2: JQQToken): JQzonePublish; cdecl;

    { static Property }
    {class} property PUBLISH_TO_QZONE_KEY_TYPE: JString read _GetPUBLISH_TO_QZONE_KEY_TYPE;
    {class} property PUBLISH_TO_QZONE_TYPE_PUBLISHMOOD: Integer read _GetPUBLISH_TO_QZONE_TYPE_PUBLISHMOOD;
    {class} property PUBLISH_TO_QZONE_TYPE_PUBLISHVIDEO: Integer read _GetPUBLISH_TO_QZONE_TYPE_PUBLISHVIDEO;
    {class} property PUBLISH_TO_QZONE_IMAGE_URL: JString read _GetPUBLISH_TO_QZONE_IMAGE_URL;
    {class} property PUBLISH_TO_QZONE_SUMMARY: JString read _GetPUBLISH_TO_QZONE_SUMMARY;
    {class} property PUBLISH_TO_QZONE_VIDEO_PATH: JString read _GetPUBLISH_TO_QZONE_VIDEO_PATH;
    {class} property PUBLISH_TO_QZONE_VIDEO_DURATION: JString read _GetPUBLISH_TO_QZONE_VIDEO_DURATION;
    {class} property PUBLISH_TO_QZONE_VIDEO_SIZE: JString read _GetPUBLISH_TO_QZONE_VIDEO_SIZE;
    {class} property PUBLISH_TO_QZONE_APP_NAME: JString read _GetPUBLISH_TO_QZONE_APP_NAME;
    {class} property HULIAN_EXTRA_SCENE: JString read _GetHULIAN_EXTRA_SCENE;
    {class} property HULIAN_CALL_BACK: JString read _GetHULIAN_CALL_BACK;
    {class} property PUBLISH_TO_QZONE_EXTMAP: JString read _GetPUBLISH_TO_QZONE_EXTMAP;
  end;

  [JavaSignature('com/tencent/connect/share/QzonePublish')]
  JQzonePublish = interface(JObject)
  ['{64EE592F-30B8-406F-930E-FE385E87081E}']
    { Property Methods }

    { methods }
    procedure publishToQzone(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;

    { Property }
  end;

  TJQzonePublish = class(TJavaGenericImport<JQzonePublishClass, JQzonePublish>) end;

//  JQzoneShare_1Class = interface(JObjectClass)
//  ['{F6621615-CAE2-43C5-AB24-F6EC59CD9FB2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/connect/share/QzoneShare$1')]
//  JQzoneShare_1 = interface(JObject)
//  ['{424CB7FD-82B7-4330-A84B-38491D96CBA7}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: JString); cdecl; overload;
//    procedure a(P1: Integer; P2: JArrayList); cdecl; overload;
//
//    { Property }
//  end;

//  TJQzoneShare_1 = class(TJavaGenericImport<JQzoneShare_1Class, JQzoneShare_1>) end;

  JQzoneShareClass = interface(JObjectClass)
  ['{15C905A4-E002-4AB9-B445-9BEB2D6BD678}']
    { static Property Methods }
    {class} function _GetSHARE_TO_QZONE_KEY_TYPE: JString;
    {class} function _GetSHARE_TO_QZONE_TYPE_NO_TYPE: Integer;
    {class} function _GetSHARE_TO_QZONE_TYPE_IMAGE_TEXT: Integer;
    {class} function _GetSHARE_TO_QZONE_TYPE_IMAGE: Integer;
    {class} function _GetSHARE_TO_QZONE_TYPE_APP: Integer;
    {class} function _GetSHARE_TO_QQ_IMAGE_URL: JString;
    {class} function _GetSHARE_TO_QQ_IMAGE_LOCAL_URL: JString;
    {class} function _GetSHARE_TO_QQ_TITLE: JString;
    {class} function _GetSHARE_TO_QQ_SUMMARY: JString;
    {class} function _GetSHARE_TO_QQ_SITE: JString;
    {class} function _GetSHARE_TO_QQ_TARGET_URL: JString;
    {class} function _GetSHARE_TO_QQ_APP_NAME: JString;
    {class} function _GetSHARE_TO_QQ_AUDIO_URL: JString;
    {class} function _GetSHARE_TO_QQ_EXT_STR: JString;
    {class} function _GetSHARE_TO_QQ_EXT_INT: JString;
    {class} function _GetSHARE_TO_QZONE_EXTMAP: JString;

    { static Methods }
    {class} function init(P1: JContext; P2: JQQToken): JQzoneShare; cdecl;

    { static Property }
    {class} property SHARE_TO_QZONE_KEY_TYPE: JString read _GetSHARE_TO_QZONE_KEY_TYPE;
    {class} property SHARE_TO_QZONE_TYPE_NO_TYPE: Integer read _GetSHARE_TO_QZONE_TYPE_NO_TYPE;
    {class} property SHARE_TO_QZONE_TYPE_IMAGE_TEXT: Integer read _GetSHARE_TO_QZONE_TYPE_IMAGE_TEXT;
    {class} property SHARE_TO_QZONE_TYPE_IMAGE: Integer read _GetSHARE_TO_QZONE_TYPE_IMAGE;
    {class} property SHARE_TO_QZONE_TYPE_APP: Integer read _GetSHARE_TO_QZONE_TYPE_APP;
    {class} property SHARE_TO_QQ_IMAGE_URL: JString read _GetSHARE_TO_QQ_IMAGE_URL;
    {class} property SHARE_TO_QQ_IMAGE_LOCAL_URL: JString read _GetSHARE_TO_QQ_IMAGE_LOCAL_URL;
    {class} property SHARE_TO_QQ_TITLE: JString read _GetSHARE_TO_QQ_TITLE;
    {class} property SHARE_TO_QQ_SUMMARY: JString read _GetSHARE_TO_QQ_SUMMARY;
    {class} property SHARE_TO_QQ_SITE: JString read _GetSHARE_TO_QQ_SITE;
    {class} property SHARE_TO_QQ_TARGET_URL: JString read _GetSHARE_TO_QQ_TARGET_URL;
    {class} property SHARE_TO_QQ_APP_NAME: JString read _GetSHARE_TO_QQ_APP_NAME;
    {class} property SHARE_TO_QQ_AUDIO_URL: JString read _GetSHARE_TO_QQ_AUDIO_URL;
    {class} property SHARE_TO_QQ_EXT_STR: JString read _GetSHARE_TO_QQ_EXT_STR;
    {class} property SHARE_TO_QQ_EXT_INT: JString read _GetSHARE_TO_QQ_EXT_INT;
    {class} property SHARE_TO_QZONE_EXTMAP: JString read _GetSHARE_TO_QZONE_EXTMAP;
  end;

  [JavaSignature('com/tencent/connect/share/QzoneShare')]
  JQzoneShare = interface(JObject)
  ['{D7C64ED8-1D10-4F8C-8B8B-CD73D4863D3F}']
    { Property Methods }
    function _GetmViaShareQzoneType: JString;
    procedure _SetmViaShareQzoneType(amViaShareQzoneType: JString);

    { methods }
    procedure shareToQzone(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure releaseResource; cdecl;

    { Property }
    property mViaShareQzoneType: JString read _GetmViaShareQzoneType write _SetmViaShareQzoneType;
  end;

  TJQzoneShare = class(TJavaGenericImport<JQzoneShareClass, JQzoneShare>) end;

  JUserInfoClass = interface(JObjectClass)
  ['{0D3AEB51-B3AE-417E-8A96-3E42E5C22AE4}']
    { static Property Methods }
    {class} function _GetGRAPH_OPEN_ID: JString;

    { static Methods }
    {class} function init(P1: JContext; P2: JQQToken): JUserInfo; cdecl; overload;
//    {class} function init(P1: JContext; P2: Jc; P3: JQQToken): JUserInfo; cdecl; overload;

    { static Property }
    {class} property GRAPH_OPEN_ID: JString read _GetGRAPH_OPEN_ID;
  end;

  [JavaSignature('com/tencent/connect/UserInfo')]
  JUserInfo = interface(JObject)
  ['{4D8DBEFF-B17A-47C8-AF63-CA078927BBD1}']
    { Property Methods }

    { methods }
    procedure getUserInfo(P1: JIUiListener); cdecl;
    procedure getOpenId(P1: JIUiListener); cdecl;

    { Property }
  end;

  TJUserInfo = class(TJavaGenericImport<JUserInfoClass, JUserInfo>) end;

//  JaClass = interface(JObjectClass)
//  ['{158876E0-2162-4638-AE1E-17B858CBB810}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jb): Ja; cdecl; overload;
//    {class} function init(P1: Integer; P2: Boolean; P3: Jh; P4: Jb): Ja; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/a')]
//  Ja = interface(JObject)
//  ['{A8426011-D0FF-402A-A69F-29E835D9B3EC}']
//    { Property Methods }
//
//    { methods }
//    procedure a; cdecl; overload;
//    procedure b; cdecl;
//    function handleMessage(P1: JMessage): Boolean; cdecl;
//    function c: Jb; cdecl;
//    procedure a(P1: Jb); cdecl; overload;
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JbClass = interface(JObjectClass)
//  ['{FF902AAC-DBB6-43C3-B376-808F849C6296}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JFile; P2: Integer; P3: Integer; P4: Integer; P5: JString; P6: Int64; P7: Integer; P8: JString; P9: Int64): Jb; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/b')]
//  Jb = interface(JObject)
//  ['{DCA94728-AF22-44AB-9F89-2A0B2E413B88}']
//    { Property Methods }
//
//    { methods }
//    function a: JFile; cdecl; overload;
//    function b: JFile; cdecl; overload;
//    function c: JString; cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//    procedure a(P1: Integer); cdecl; overload;
//    procedure b(P1: Integer); cdecl; overload;
//    function d: Integer; cdecl; overload;
//    procedure c(P1: Integer); cdecl; overload;
//    procedure a(P1: Int64); cdecl; overload;
//    function e: JFile; cdecl;
//    procedure a(P1: JFile); cdecl; overload;
//    function f: Integer; cdecl;
//    procedure d(P1: Integer); cdecl; overload;
//    procedure b(P1: JString); cdecl; overload;
//    procedure b(P1: Int64); cdecl; overload;
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{772130D8-FF07-482B-BC7E-3B25538E8D0A}']
//    { static Property Methods }
//    {class} function _Geta: Integer;
//    {class} function _Getb: Integer;
//    {class} function _Getc: JString;
//    {class} function _Getd: JString;
//    {class} function _Gete: JString;
//    {class} function _Getf: Int64;
//    {class} function _Getg: Integer;
//    {class} function _Geth: Integer;
//    {class} function _Geti: Integer;
//    {class} function _Getj: JString;
//    {class} function _Getk: JString;
//    {class} function _Getl: JString;
//    {class} function _Getm: Integer;
//    {class} function _Getn: Int64;
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: Integer read _Geta;
//    {class} property b: Integer read _Getb;
//    {class} property c: JString read _Getc;
//    {class} property d: JString read _Getd;
//    {class} property e: JString read _Gete;
//    {class} property f: Int64 read _Getf;
//    {class} property g: Integer read _Getg;
//    {class} property h: Integer read _Geth;
//    {class} property i: Integer read _Geti;
//    {class} property j: JString read _Getj;
//    {class} property k: JString read _Getk;
//    {class} property l: JString read _Getl;
//    {class} property m: Integer read _Getm;
//    {class} property n: Int64 read _Getn;
//  end;

//  [JavaSignature('com/tencent/open/a/c')]
//  Jc = interface(JObject)
//  ['{167B7119-97E0-48BF-83B3-CADFA16D0C37}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  Jd_aClass = interface(JObjectClass)
//  ['{ADE23AB6-1AF9-480F-A42A-B437BF473561}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: Integer; P2: Integer): Boolean; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/d$a')]
//  Jd_a = interface(JObject)
//  ['{D66C5340-0265-4BB5-9188-1C54C5482A6A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_a = class(TJavaGenericImport<Jd_aClass, Jd_a>) end;

//  Jd_bClass = interface(JObjectClass)
//  ['{22D9AA4E-12C6-418F-B881-9703FE693A50}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Boolean; cdecl;
//    {class} function b: Jd_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/d$b')]
//  Jd_b = interface(JObject)
//  ['{C984FAA4-E34C-4F8B-8376-0384ABA87280}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_b = class(TJavaGenericImport<Jd_bClass, Jd_b>) end;

//  Jd_cClass = interface(JObjectClass)
//  ['{F487FFF9-5C5F-4F5B-A010-DB4CCF783C4B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd_c; cdecl;
//    {class} function b(P1: JFile): Jd_c; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/d$c')]
//  Jd_c = interface(JObject)
//  ['{7C2DC79E-056F-4786-AFCA-3B4D8FD8DE5B}']
//    { Property Methods }
//
//    { methods }
//    function a: JFile; cdecl; overload;
//    procedure a(P1: JFile); cdecl; overload;
//    function b: Int64; cdecl; overload;
//    procedure a(P1: Int64); cdecl; overload;
//    function c: Int64; cdecl;
//    procedure b(P1: Int64); cdecl; overload;
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJd_c = class(TJavaGenericImport<Jd_cClass, Jd_c>) end;

//  Jd_dClass = interface(JObjectClass)
//  ['{0B6CE4D9-0E47-4087-AC74-1DF690EA9A73}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): JSimpleDateFormat; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/d$d')]
//  Jd_d = interface(JObject)
//  ['{06C1F8A9-AEE9-4E94-91E4-099F940ED6AE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd_d = class(TJavaGenericImport<Jd_dClass, Jd_d>) end;

//  JdClass = interface(JObjectClass)
//  ['{0A810039-9D8D-4BDB-87AA-BF28990098E3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/d')]
//  Jd = interface(JObject)
//  ['{EF825C6F-79BC-4EEE-821B-8C89CC557D03}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  JeClass = interface(JObjectClass)
//  ['{71DDBEB1-E60B-4DC4-A872-C0D6859B82CE}']
//    { static Property Methods }
//    {class} function _Geta: Je;
//
//    { static Methods }
//    {class} function init: Je; cdecl;
//
//    { static Property }
//    {class} property a: Je read _Geta;
//  end;

//  [JavaSignature('com/tencent/open/a/e')]
//  Je = interface(JObject)
//  ['{FFE4183B-A480-44B9-AA35-76797C440229}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  JfClass = interface(JObjectClass)
//  ['{61EE64D1-512C-4672-9470-0A83B5956F0B}']
//    { static Property Methods }
//    {class} function _Geta: Jf;
//
//    { static Methods }
//    {class} function a: Jf; cdecl; overload;
//    {class} procedure a(P1: JString; P2: JString); cdecl; overload;
//    {class} procedure b(P1: JString; P2: JString); cdecl; overload;
//    {class} procedure a(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
//    {class} procedure c(P1: JString; P2: JString); cdecl;
//    {class} procedure d(P1: JString; P2: JString); cdecl;
//    {class} procedure e(P1: JString; P2: JString); cdecl;
//    {class} procedure b(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
//    {class} procedure b; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jf read _Geta;
//  end;

//  [JavaSignature('com/tencent/open/a/f')]
//  Jf = interface(JObject)
//  ['{79F09138-7CBA-414B-BDE9-1D8F220DAFE8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  JgClass = interface(JObjectClass)
//  ['{9758E850-ACF4-4E2F-8C8A-526B708A3D5C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jg; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/g')]
//  Jg = interface(JObject)
//  ['{55B8C2C2-D1F4-455A-A1DB-428E6A25F07A}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Integer; cdecl; overload;
//    procedure a(P1: JWriter; P2: TJavaArray<Char>); cdecl; overload;
//    function a: Integer; cdecl; overload;
//    procedure b; cdecl;
//    function iterator: JIterator; cdecl;
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  JhClass = interface(JObjectClass)
//  ['{45789A98-0E6C-4C44-B2E3-30E8BEF91018}']
//    { static Property Methods }
//    {class} function _Geta: Jh;
//
//    { static Methods }
//    {class} function init: Jh; cdecl;
//
//    { static Property }
//    {class} property a: Jh read _Geta;
//  end;

//  [JavaSignature('com/tencent/open/a/h')]
//  Jh = interface(JObject)
//  ['{01C3EB34-090C-4B39-B806-5224C75B6DFC}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: Integer): JString; cdecl; overload;
//    function a(P1: Integer; P2: JThread; P3: Int64; P4: JString; P5: JString; P6: JThrowable): JString; cdecl; overload;
//
//    { Property }
//  end;

//  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

//  JiClass = interface(JObjectClass)
//  ['{9D1D4D41-8CFB-4CA0-B91A-972657DB1779}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ji; cdecl; overload;
//    {class} function init(P1: Integer; P2: Boolean; P3: Jh): Ji; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a/i')]
//  Ji = interface(JObject)
//  ['{9D71798C-DDDE-4D67-8A9C-3B3DB8EA753B}']
//    { Property Methods }
//
//    { methods }
//    procedure b(P1: Integer; P2: JThread; P3: Int64; P4: JString; P5: JString; P6: JThrowable); cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//    function d: Boolean; cdecl;
//    procedure a(P1: Boolean); cdecl; overload;
//    function e: Jh; cdecl;
//    procedure a(P1: Jh); cdecl; overload;
//
//    { Property }
//  end;

//  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

//  Ja_aClass = interface(JObjectClass)
//  ['{D3A5AE06-331C-40C0-9C03-247E0534E2E6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JWebView; P2: Int64; P3: JString): Ja_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a$a')]
//  Ja_a = interface(JObject)
//  ['{D4D693F1-23A9-48DB-B255-21C0304092CF}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JObject); cdecl; overload;
//    procedure a; cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_bClass = interface(JObjectClass)
//  ['{987631E8-FF07-48F8-9532-E35154F76DB2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja_b; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a$b')]
//  Ja_b = interface(JObject)
//  ['{1EF112E8-95FA-4FB2-A3CB-5440FA47F0CC}']
//    { Property Methods }
//
//    { methods }
//    procedure call(P1: JString; P2: JList; P3: Ja_a); cdecl;
//    function customCallback: Boolean; cdecl;
//
//    { Property }
//  end;

//  TJa_b = class(TJavaGenericImport<Ja_bClass, Ja_b>) end;

//  JaClass = interface(JObjectClass)
//  ['{CF1054F4-B4DE-43C2-8965-41636C9A0574}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/a')]
//  Ja = interface(JObject)
//  ['{B89AB2F0-55FB-4F62-88AF-43CBCBD5D07E}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Ja_b; P2: JString); cdecl; overload;
//    procedure a(P1: JString; P2: JString; P3: JList; P4: Ja_a); cdecl; overload;
//    function a(P1: JWebView; P2: JString): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JaClass = interface(JObjectClass)
//  ['{5A890D6D-DD8D-4E6C-91A5-0FE9BC2A9B12}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext): JString; cdecl;
//    {class} function b(P1: JContext): JString; cdecl;
//    {class} function c(P1: JContext): JString; cdecl;
//    {class} function d(P1: JContext): Integer; cdecl;
//    {class} function e(P1: JContext): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/a')]
//  Ja = interface(JObject)
//  ['{0F7B7E3A-44D3-435C-A02D-707A97CAC903}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JbClass = interface(JObjectClass)
//  ['{34F95E4F-C008-4F43-9E12-4DCAEDDD71A9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JBundle): Jb; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/b')]
//  Jb = interface(JObject)
//  ['{FDA11295-ECB3-4444-929B-8E6FD5FCAFEC}']
//    { Property Methods }
//    function _Geta: JHashMap;
//    procedure _Seta(aa: JHashMap);
//
//    { methods }
//
//    { Property }
//    property a: JHashMap read _Geta write _Seta;
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{97934F1A-E908-4FB8-90C2-63E70859BAD6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl; overload;
//    {class} function a(P1: JContext): JString; cdecl; overload;
//    {class} function b: JString; cdecl; overload;
//    {class} function b(P1: JContext): JString; cdecl; overload;
//    {class} function c(P1: JContext): JString; cdecl;
//    {class} function d(P1: JContext): JString; cdecl;
//    {class} function e(P1: JContext): JString; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/c')]
//  Jc = interface(JObject)
//  ['{5D461689-FF3D-416D-9124-8C67AB3A9EB2}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JdClass = interface(JObjectClass)
//  ['{E246BF6F-7C66-4F6C-A4FE-71925C5C1860}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jd; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/d')]
//  Jd = interface(JObject)
//  ['{9F8DD988-B863-4B06-ADDA-A05842DA7B56}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString); cdecl; overload;
//    procedure a(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString; P8: JString); cdecl; overload;
//    procedure a(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString; P8: JString; P9: JString; P10: JString); cdecl; overload;
//    procedure a(P1: Integer; P2: JString; P3: JString; P4: JString; P5: JString; P6: JLong; P7: Integer; P8: Integer; P9: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  JeClass = interface(JObjectClass)
//  ['{0DF9E85A-0BC7-4A3D-88AB-2CB54568B380}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): Integer; cdecl; overload;
//    {class} function a: Integer; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/e')]
//  Je = interface(JObject)
//  ['{4CF592CA-9A9F-433A-8FB0-81ADFF1FD295}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  JfClass = interface(JObjectClass)
//  ['{E736FD4D-1619-40D8-BDBB-A4D01978A976}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jf; cdecl; overload;
//    {class} function init(P1: JContext): Jf; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/f')]
//  Jf = interface(JObject)
//  ['{93E6A59A-1A64-4AB4-9327-7BA0A2B3DBF5}']
//    { Property Methods }
//
//    { methods }
//    procedure onCreate(P1: JSQLiteDatabase); cdecl;
//    procedure onUpgrade(P1: JSQLiteDatabase; P2: Integer; P3: Integer); cdecl;
//    function a(P1: JString): JList; cdecl; overload;
//    procedure a(P1: JString; P2: JList); cdecl; overload;
//    procedure b(P1: JString); cdecl;
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  Jg_1Class = interface(JObjectClass)
//  ['{D76C2222-D8C3-4A90-A78F-F3B093B3B108}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/g$1')]
//  Jg_1 = interface(JObject)
//  ['{FEC75E7A-DED6-40F7-A02E-38283866D0C5}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJg_1 = class(TJavaGenericImport<Jg_1Class, Jg_1>) end;

//  Jg_2Class = interface(JObjectClass)
//  ['{0259E926-F774-4A32-8F5D-A94592CE4FF0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/g$2')]
//  Jg_2 = interface(JObject)
//  ['{E6D67FB4-B6D9-43D0-9C26-EF0219FAB3C6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_2 = class(TJavaGenericImport<Jg_2Class, Jg_2>) end;

//  Jg_3Class = interface(JObjectClass)
//  ['{D0897C8A-ECFB-40C7-9F44-61D10F7567E3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/g$3')]
//  Jg_3 = interface(JObject)
//  ['{EC073FAA-C43D-4CFA-AF69-CB6DE3345897}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_3 = class(TJavaGenericImport<Jg_3Class, Jg_3>) end;

//  Jg_4Class = interface(JObjectClass)
//  ['{CCEE2C25-EAB1-4718-B0D0-C51D05AE29D8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/g$4')]
//  Jg_4 = interface(JObject)
//  ['{486C1BFE-244D-4BB4-8A7B-A43FCAA7039A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_4 = class(TJavaGenericImport<Jg_4Class, Jg_4>) end;

//  Jg_5Class = interface(JObjectClass)
//  ['{7A19472B-F679-4A56-936C-9D2EFE31E906}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/g$5')]
//  Jg_5 = interface(JObject)
//  ['{B3278A00-53A0-4FF0-945B-D3BDA6CF35CF}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_5 = class(TJavaGenericImport<Jg_5Class, Jg_5>) end;

//  Jg_6Class = interface(JObjectClass)
//  ['{6CBC0C89-8A5D-4628-BAFB-E05EA379828B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/g$6')]
//  Jg_6 = interface(JObject)
//  ['{EC65F831-3D5F-4280-9C4F-A296168EB008}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJg_6 = class(TJavaGenericImport<Jg_6Class, Jg_6>) end;

//  JgClass = interface(JObjectClass)
//  ['{08F0551B-145D-4E76-B315-659C7743FBA3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: Jg; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b/g')]
//  Jg = interface(JObject)
//  ['{43DC4C0E-2F71-442E-8C01-3A86200F4BEF}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JBundle; P2: JString; P3: Boolean); cdecl; overload;
//    procedure a(P1: JString; P2: Int64; P3: Int64; P4: Int64; P5: Integer); cdecl; overload;
//    procedure a(P1: JString; P2: Int64; P3: Int64; P4: Int64; P5: Integer; P6: JString; P7: Boolean); cdecl; overload;
//    procedure a(P1: JString; P2: JString; P3: JBundle; P4: Boolean); cdecl; overload;
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  Jb_1Class = interface(JObjectClass)
//  ['{D3B51611-7A62-4C91-B179-5478D1A42053}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b$1')]
//  Jb_1 = interface(JObject)
//  ['{57C93F9B-3334-442D-B071-D57CD81FD1C0}']
//    { Property Methods }
//
//    { methods }
//    function onConsoleMessage(P1: JConsoleMessage): Boolean; cdecl; overload;
//    procedure onConsoleMessage(P1: JString; P2: Integer; P3: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJb_1 = class(TJavaGenericImport<Jb_1Class, Jb_1>) end;

//  JbClass = interface(JObjectClass)
//  ['{B9245858-76BE-4EEA-B403-F6B7083E8D72}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: Integer): Jb; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/b')]
//  Jb = interface(JObject)
//  ['{904B9142-6599-4E10-979A-1F620F8D6B5D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  Ja_aClass = interface(JObjectClass)
//  ['{A6D257C6-68B4-4F74-8157-FC7E5149AEBE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c/a$a')]
//  Ja_a = interface(IJavaInstance)
//  ['{7D3FAA9C-EC95-425E-AB48-6509E5785358}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer); cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  JaClass = interface(JObjectClass)
//  ['{9D4C9D47-31DA-4C77-B4C6-773144B4FBF1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Ja; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c/a')]
//  Ja = interface(JObject)
//  ['{625E4B20-5BFC-462F-B9AD-C38BB867C05C}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Ja_a); cdecl;
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JbClass = interface(JObjectClass)
//  ['{F6AD8E22-DD64-45E4-94E8-BF1A1C1F0190}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext): Jb; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c/b')]
//  Jb = interface(JObject)
//  ['{01BD1737-949A-49AD-A0F4-8B96DA837A30}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{1A6A363E-0F60-4EB6-A3FC-ECDF8A747EDF}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;
//
//    { static Methods }
//    {class} function init(P1: JContext): Jc; cdecl;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//  end;

//  [JavaSignature('com/tencent/open/c/c')]
//  Jc = interface(JObject)
//  ['{78809C59-1C2D-4F69-9519-2B477BBCBE6A}']
//    { Property Methods }
//
//    { methods }
//    function dispatchKeyEvent(P1: JKeyEvent): Boolean; cdecl;
//    function onKeyDown(P1: Integer; P2: JKeyEvent): Boolean; cdecl;
//    function onCreateInputConnection(P1: JEditorInfo): JInputConnection; cdecl;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  Jc_1Class = interface(JObjectClass)
//  ['{BEC75B1F-756A-4449-B16F-6CCF3674760E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c$1')]
//  Jc_1 = interface(JObject)
//  ['{28D8C3A3-B4C7-4CAD-AC36-D1F8192029E3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_1 = class(TJavaGenericImport<Jc_1Class, Jc_1>) end;

//  Jc_aClass = interface(JObjectClass)
//  ['{4382ACDF-BA4E-4414-A56B-152615C3005D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c$a')]
//  Jc_a = interface(JObject)
//  ['{E60D5A72-A199-4C84-990D-2BF07A2CCEBE}']
//    { Property Methods }
//
//    { methods }
//    function shouldOverrideUrlLoading(P1: JWebView; P2: JString): Boolean; cdecl;
//    procedure onReceivedError(P1: JWebView; P2: Integer; P3: JString; P4: JString); cdecl;
//    procedure onPageStarted(P1: JWebView; P2: JString; P3: JBitmap); cdecl;
//    procedure onPageFinished(P1: JWebView; P2: JString); cdecl;
//
//    { Property }
//  end;

//  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

//  Jc_bClass = interface(JObjectClass)
//  ['{1BE927BB-6541-4D16-918E-BB7806193070}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c$b')]
//  Jc_b = interface(JObject)
//  ['{7B60B907-0352-4BDF-946F-592A8377D273}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJc_b = class(TJavaGenericImport<Jc_bClass, Jc_b>) end;

//  Jc_cClass = interface(JObjectClass)
//  ['{F63FC46A-7951-496F-9456-7C59243F8924}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JString; P3: JString; P4: JString; P5: JIUiListener): Jc_c; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c$c')]
//  Jc_c = interface(JObject)
//  ['{7A3B4A5C-400F-4FAE-8893-F9DC0ACACB50}']
//    { Property Methods }
//
//    { methods }
//    procedure onComplete(P1: JObject); cdecl;
//    procedure onError(P1: JUiError); cdecl;
//    procedure onCancel; cdecl;
//
//    { Property }
//  end;

//  TJc_c = class(TJavaGenericImport<Jc_cClass, Jc_c>) end;

//  Jc_dClass = interface(JObjectClass)
//  ['{3098F7AD-FB4B-45C3-B179-358C8BAB6390}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Jc; P2: Jc_c; P3: JLooper): Jc_d; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c$d')]
//  Jc_d = interface(JObject)
//  ['{DE5127C7-DD90-48EB-A48F-F9273CDB26A3}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJc_d = class(TJavaGenericImport<Jc_dClass, Jc_d>) end;

//  JcClass = interface(JObjectClass)
//  ['{FFBC66CC-D3C6-45EE-BAC7-7B74CB6D5FCA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JString; P3: JString; P4: JIUiListener; P5: JQQToken): Jc; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/c')]
//  Jc = interface(JObject)
//  ['{54A02316-A36A-43ED-8DEB-45870AA59BDF}']
//    { Property Methods }
//
//    { methods }
//    procedure onBackPressed; cdecl;
//    procedure a(P1: Integer); cdecl; overload;
//    procedure a; cdecl; overload;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

  JSocialApiClass = interface(JObjectClass)
  ['{DF19C4BB-457F-45BA-8BD1-CE4802EC986B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JQQToken): JSocialApi; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/open/SocialApi')]
  JSocialApi = interface(JObject)
  ['{93DEDA3A-A4F1-4417-B37B-9F016471EDA8}']
    { Property Methods }

    { methods }
    procedure invite(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure story(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure gift(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure ask(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;

    { Property }
  end;

  TJSocialApi = class(TJavaGenericImport<JSocialApiClass, JSocialApi>) end;

//  JSocialApiIml_aClass = interface(JObjectClass)
//  ['{6563CEE1-0B91-40CB-8619-73B7473982E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/SocialApiIml$a')]
//  JSocialApiIml_a = interface(JObject)
//  ['{EF58F634-8F52-460B-B4E5-C3189C6090E0}']
//    { Property Methods }
//
//    { methods }
//    procedure onComplete(P1: JObject); cdecl;
//    procedure onError(P1: JUiError); cdecl;
//    procedure onCancel; cdecl;
//
//    { Property }
//  end;

//  TJSocialApiIml_a = class(TJavaGenericImport<JSocialApiIml_aClass, JSocialApiIml_a>) end;

  JSocialApiImlClass = interface(JObjectClass)
  ['{751B31F5-E75C-48CA-A7B5-80B0BBAEBDD6}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JQQToken): JSocialApiIml; cdecl; overload;
//    {class} function init(P1: Jc; P2: JQQToken): JSocialApiIml; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/tencent/open/SocialApiIml')]
  JSocialApiIml = interface(JObject)
  ['{D312B8D7-933C-4AAF-BCEE-1FE10A5C8CD8}']
    { Property Methods }

    { methods }
    procedure gift(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure ask(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure invite(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure story(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure writeEncryToken(P1: JContext); cdecl;

    { Property }
  end;

  TJSocialApiIml = class(TJavaGenericImport<JSocialApiImlClass, JSocialApiIml>) end;

  JSocialConstantsClass = interface(JObjectClass)
  ['{08108DEC-356C-4395-A127-238EA4E2A630}']
    { static Property Methods }
    {class} function _GetPARAM_APP_ID: JString;
    {class} function _GetPARAM_OPEN_ID: JString;
    {class} function _GetPARAM_HOPEN_ID: JString;
    {class} function _GetPARAM_SOURCE: JString;
    {class} function _GetPARAM_ACT: JString;
    {class} function _GetPARAM_CONSUMER_KEY: JString;
    {class} function _GetPARAM_APP_ICON: JString;
    {class} function _GetPARAM_APP_DESC: JString;
    {class} function _GetPARAM_APP_CUSTOM: JString;
    {class} function _GetPARAM_IMG_DATA: JString;
    {class} function _GetPARAM_EXCLUDE: JString;
    {class} function _GetPARAM_SPECIFIED: JString;
    {class} function _GetPARAM_ONLY: JString;
    {class} function _GetPARAM_RECEIVER: JString;
    {class} function _GetPARAM_TITLE: JString;
    {class} function _GetPARAM_COMMENT: JString;
    {class} function _GetPARAM_SUMMARY: JString;
    {class} function _GetPARAM_APPNAME: JString;
    {class} function _GetPARAM_IMAGE: JString;
    {class} function _GetPARAM_IMAGE_URL: JString;
    {class} function _GetPARAM_TARGET_URL: JString;
    {class} function _GetPARAM_APP_SOURCE: JString;
    {class} function _GetPARAM_URL: JString;
    {class} function _GetPARAM_TYPE: JString;
    {class} function _GetPARAM_PLAY_URL: JString;
    {class} function _GetPARAM_SHARE_URL: JString;
    {class} function _GetPARAM_AVATAR_URI: JString;
    {class} function _GetPARAM_IMG_URL: JString;
    {class} function _GetPARAM_SEND_MSG: JString;
    {class} function _GetPARAM_TYPE_ID: JString;
    {class} function _GetPARAM_ENCRY_EOKEN: JString;
    {class} function _GetPARAM_SEND_IMG: JString;
    {class} function _GetPARAM_REC_IMG: JString;
    {class} function _GetPARAM_REC_IMG_DESC: JString;
    {class} function _GetACTION_STORY: JString;
    {class} function _GetACTION_INVITE: JString;
    {class} function _GetACTION_CHALLENGE: JString;
    {class} function _GetACTION_BRAG: JString;
    {class} function _GetACTION_ASK: JString;
    {class} function _GetACTION_GIFT: JString;
    {class} function _GetACTION_GRADE: JString;
    {class} function _GetACTION_CHECK_TOKEN: JString;
    {class} function _GetACTION_VOICE: JString;
    {class} function _GetACTION_REACTIVE: JString;
    {class} function _GetACTIVITY_ASK_GIFT: JString;
    {class} function _GetACTIVITY_CHALLENGE: JString;
    {class} function _GetACTIVITY_BRAG: JString;
    {class} function _GetACTIVITY_INVITE: JString;
    {class} function _GetACTIVITY_STORY: JString;
    {class} function _GetACTIVITY_GRADE: JString;
    {class} function _GetACTIVITY_VOICE: JString;
    {class} function _GetACTIVITY_CHECK_FUNCTION: JString;
    {class} function _GetACTIVITY_REACTIVE: JString;
    {class} function _GetACTIVITY_FRIEND_CHOOSER: JString;
    {class} function _GetTYPE_REQUEST: JString;
    {class} function _GetTYPE_FREEGIFT: JString;
    {class} function _GetTYPE_REACTIVE: JString;

    { static Methods }
    {class} function init: JSocialConstants; cdecl;

    { static Property }
    {class} property PARAM_APP_ID: JString read _GetPARAM_APP_ID;
    {class} property PARAM_OPEN_ID: JString read _GetPARAM_OPEN_ID;
    {class} property PARAM_HOPEN_ID: JString read _GetPARAM_HOPEN_ID;
    {class} property PARAM_SOURCE: JString read _GetPARAM_SOURCE;
    {class} property PARAM_ACT: JString read _GetPARAM_ACT;
    {class} property PARAM_CONSUMER_KEY: JString read _GetPARAM_CONSUMER_KEY;
    {class} property PARAM_APP_ICON: JString read _GetPARAM_APP_ICON;
    {class} property PARAM_APP_DESC: JString read _GetPARAM_APP_DESC;
    {class} property PARAM_APP_CUSTOM: JString read _GetPARAM_APP_CUSTOM;
    {class} property PARAM_IMG_DATA: JString read _GetPARAM_IMG_DATA;
    {class} property PARAM_EXCLUDE: JString read _GetPARAM_EXCLUDE;
    {class} property PARAM_SPECIFIED: JString read _GetPARAM_SPECIFIED;
    {class} property PARAM_ONLY: JString read _GetPARAM_ONLY;
    {class} property PARAM_RECEIVER: JString read _GetPARAM_RECEIVER;
    {class} property PARAM_TITLE: JString read _GetPARAM_TITLE;
    {class} property PARAM_COMMENT: JString read _GetPARAM_COMMENT;
    {class} property PARAM_SUMMARY: JString read _GetPARAM_SUMMARY;
    {class} property PARAM_APPNAME: JString read _GetPARAM_APPNAME;
    {class} property PARAM_IMAGE: JString read _GetPARAM_IMAGE;
    {class} property PARAM_IMAGE_URL: JString read _GetPARAM_IMAGE_URL;
    {class} property PARAM_TARGET_URL: JString read _GetPARAM_TARGET_URL;
    {class} property PARAM_APP_SOURCE: JString read _GetPARAM_APP_SOURCE;
    {class} property PARAM_URL: JString read _GetPARAM_URL;
    {class} property PARAM_TYPE: JString read _GetPARAM_TYPE;
    {class} property PARAM_PLAY_URL: JString read _GetPARAM_PLAY_URL;
    {class} property PARAM_SHARE_URL: JString read _GetPARAM_SHARE_URL;
    {class} property PARAM_AVATAR_URI: JString read _GetPARAM_AVATAR_URI;
    {class} property PARAM_IMG_URL: JString read _GetPARAM_IMG_URL;
    {class} property PARAM_SEND_MSG: JString read _GetPARAM_SEND_MSG;
    {class} property PARAM_TYPE_ID: JString read _GetPARAM_TYPE_ID;
    {class} property PARAM_ENCRY_EOKEN: JString read _GetPARAM_ENCRY_EOKEN;
    {class} property PARAM_SEND_IMG: JString read _GetPARAM_SEND_IMG;
    {class} property PARAM_REC_IMG: JString read _GetPARAM_REC_IMG;
    {class} property PARAM_REC_IMG_DESC: JString read _GetPARAM_REC_IMG_DESC;
    {class} property ACTION_STORY: JString read _GetACTION_STORY;
    {class} property ACTION_INVITE: JString read _GetACTION_INVITE;
    {class} property ACTION_CHALLENGE: JString read _GetACTION_CHALLENGE;
    {class} property ACTION_BRAG: JString read _GetACTION_BRAG;
    {class} property ACTION_ASK: JString read _GetACTION_ASK;
    {class} property ACTION_GIFT: JString read _GetACTION_GIFT;
    {class} property ACTION_GRADE: JString read _GetACTION_GRADE;
    {class} property ACTION_CHECK_TOKEN: JString read _GetACTION_CHECK_TOKEN;
    {class} property ACTION_VOICE: JString read _GetACTION_VOICE;
    {class} property ACTION_REACTIVE: JString read _GetACTION_REACTIVE;
    {class} property ACTIVITY_ASK_GIFT: JString read _GetACTIVITY_ASK_GIFT;
    {class} property ACTIVITY_CHALLENGE: JString read _GetACTIVITY_CHALLENGE;
    {class} property ACTIVITY_BRAG: JString read _GetACTIVITY_BRAG;
    {class} property ACTIVITY_INVITE: JString read _GetACTIVITY_INVITE;
    {class} property ACTIVITY_STORY: JString read _GetACTIVITY_STORY;
    {class} property ACTIVITY_GRADE: JString read _GetACTIVITY_GRADE;
    {class} property ACTIVITY_VOICE: JString read _GetACTIVITY_VOICE;
    {class} property ACTIVITY_CHECK_FUNCTION: JString read _GetACTIVITY_CHECK_FUNCTION;
    {class} property ACTIVITY_REACTIVE: JString read _GetACTIVITY_REACTIVE;
    {class} property ACTIVITY_FRIEND_CHOOSER: JString read _GetACTIVITY_FRIEND_CHOOSER;
    {class} property TYPE_REQUEST: JString read _GetTYPE_REQUEST;
    {class} property TYPE_FREEGIFT: JString read _GetTYPE_FREEGIFT;
    {class} property TYPE_REACTIVE: JString read _GetTYPE_REACTIVE;
  end;

  [JavaSignature('com/tencent/open/SocialConstants')]
  JSocialConstants = interface(JObject)
  ['{EEB3A8C1-DF06-49D6-B255-43AFA1A83DE2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSocialConstants = class(TJavaGenericImport<JSocialConstantsClass, JSocialConstants>) end;

//  JTDialog_1Class = interface(JObjectClass)
//  ['{EC00C44F-5E1B-46BA-9573-AF62A5705205}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/TDialog$1')]
//  JTDialog_1 = interface(JObject)
//  ['{1B703701-9D9C-4C3C-A9F2-AB83097EAB73}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJTDialog_1 = class(TJavaGenericImport<JTDialog_1Class, JTDialog_1>) end;

  JTDialog_FbWebViewClientClass = interface(JObjectClass)
  ['{0A2DC337-359B-486A-ADAA-C150E264B113}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/tencent/open/TDialog$FbWebViewClient')]
  JTDialog_FbWebViewClient = interface(JObject)
  ['{BF4F9D7C-FCCA-4F6E-8C7E-3C8E2DD7D84B}']
    { Property Methods }

    { methods }
    function shouldOverrideUrlLoading(P1: JWebView; P2: JString): Boolean; cdecl;
    procedure onReceivedError(P1: JWebView; P2: Integer; P3: JString; P4: JString); cdecl;
    procedure onPageStarted(P1: JWebView; P2: JString; P3: JBitmap); cdecl;
    procedure onPageFinished(P1: JWebView; P2: JString); cdecl;

    { Property }
  end;

  TJTDialog_FbWebViewClient = class(TJavaGenericImport<JTDialog_FbWebViewClientClass, JTDialog_FbWebViewClient>) end;

  JTDialog_JsListenerClass = interface(JObjectClass)
  ['{450B6124-8C2F-44F9-B8AE-9BE4959B920C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/tencent/open/TDialog$JsListener')]
  JTDialog_JsListener = interface(JObject)
  ['{62C8B7F1-1AED-4089-8B5B-A168710E4112}']
    { Property Methods }

    { methods }
    procedure onAddShare(P1: JString); cdecl;
    procedure onInvite(P1: JString); cdecl;
    procedure onCancelAddShare(P1: JString); cdecl;
    procedure onCancelLogin; cdecl;
    procedure onCancelInvite; cdecl;
    procedure onComplete(P1: JString); cdecl;
    procedure onCancel(P1: JString); cdecl;
    procedure showMsg(P1: JString); cdecl;
    procedure onLoad(P1: JString); cdecl;

    { Property }
  end;

  TJTDialog_JsListener = class(TJavaGenericImport<JTDialog_JsListenerClass, JTDialog_JsListener>) end;

  JTDialog_OnTimeListenerClass = interface(JObjectClass)
  ['{B6826144-489D-401A-B875-AE3F00FBC748}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext; P2: JString; P3: JString; P4: JString; P5: JIUiListener): JTDialog_OnTimeListener; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/open/TDialog$OnTimeListener')]
  JTDialog_OnTimeListener = interface(JObject)
  ['{1A775458-961A-4FDE-A987-62D477CE30F9}']
    { Property Methods }

    { methods }
    procedure onComplete(P1: JObject); cdecl;
    procedure onError(P1: JUiError); cdecl;
    procedure onCancel; cdecl;

    { Property }
  end;

  TJTDialog_OnTimeListener = class(TJavaGenericImport<JTDialog_OnTimeListenerClass, JTDialog_OnTimeListener>) end;

  JTDialog_THandlerClass = interface(JObjectClass)
  ['{ADBD943E-4F8D-4DA5-9E6A-4657D1F9565B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JTDialog; P2: JTDialog_OnTimeListener; P3: JLooper): JTDialog_THandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/open/TDialog$THandler')]
  JTDialog_THandler = interface(JObject)
  ['{84F46068-A95A-4FAE-A8AE-31D02BAF97DB}']
    { Property Methods }

    { methods }
    procedure handleMessage(P1: JMessage); cdecl;

    { Property }
  end;

  TJTDialog_THandler = class(TJavaGenericImport<JTDialog_THandlerClass, JTDialog_THandler>) end;

  JTDialogClass = interface(JObjectClass)
  ['{F499DE3E-DB7A-47D7-A75B-52D3AF98D1D1}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JContext; P2: JString; P3: JString; P4: JIUiListener; P5: JQQToken): JTDialog; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/open/TDialog')]
  JTDialog = interface(JObject)
  ['{D5CE0F44-6FB9-4D22-B872-8485B6515C9A}']
    { Property Methods }

    { methods }
    procedure onBackPressed; cdecl;

    { Property }
  end;

  TJTDialog = class(TJavaGenericImport<JTDialogClass, JTDialog>) end;

//  Ja_1Class = interface(JObjectClass)
//  ['{5289EB0A-A729-4A05-8EBB-1F445EC4B713}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/a$1')]
//  Ja_1 = interface(JObject)
//  ['{A692B407-1D43-49A9-92F5-9F04C46BD83A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa_1 = class(TJavaGenericImport<Ja_1Class, Ja_1>) end;

//  Ja_aClass = interface(JObjectClass)
//  ['{077BB5EC-A9CD-45A3-9CA1-639DC96A1734}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/a$a')]
//  Ja_a = interface(JObject)
//  ['{0CC791B2-D7FB-4E7C-BCC6-ED97C109F5C6}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;

//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  JaClass = interface(JObjectClass)
//  ['{747838AF-0431-4603-95AC-A0ED23717BC5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JFile; P2: JString): JString; cdecl; overload;
//    {class} function a(P1: JFile): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/a')]
//  Ja = interface(JObject)
//  ['{1E84B634-9B1E-4109-B3B9-11563DADD54B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  Jb_1Class = interface(JObjectClass)
//  ['{B0FEF1E8-07E1-482C-82D1-00B1956B2EAE}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/b$1')]
//  Jb_1 = interface(JObject)
//  ['{637C743E-8F85-46FD-B6F2-26E1874528BA}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;

//  TJb_1 = class(TJavaGenericImport<Jb_1Class, Jb_1>) end;

//  Jb_2Class = interface(JObjectClass)
//  ['{CA0E10DC-53A4-4BD3-B1B1-9884C9BE04DB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/b$2')]
//  Jb_2 = interface(JObject)
//  ['{B07C3734-1446-4D01-8123-464A04F9F444}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJb_2 = class(TJavaGenericImport<Jb_2Class, Jb_2>) end;

//  JbClass = interface(JObjectClass)
//  ['{8D3EFF69-80F7-48EE-82A7-FC34FE0EDAB9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JActivity): Jb; cdecl;
//    {class} function a(P1: JString): JBitmap; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/b')]
//  Jb = interface(JObject)
//  ['{87DF84DC-74BF-49B5-97FA-F71DF0A89705}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: Jc); cdecl; overload;
//    function a(P1: JBitmap; P2: JString): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{53EF0C4F-FA1D-466F-871B-1A2BE353590F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/c')]
//  Jc = interface(IJavaInstance)
//  ['{740B4B31-E4F1-4657-86AD-DCA3BB60DDF6}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: Integer; P2: JString); cdecl; overload;
//    procedure a(P1: Integer; P2: JArrayList); cdecl; overload;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

//  JdClass = interface(JObjectClass)
//  ['{D2AC4C32-5D7F-4E3F-99D4-1C5CB5201595}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JContext; cdecl; overload;
//    {class} procedure a(P1: JContext); cdecl; overload;
//    {class} function b: JString; cdecl;
//    {class} function c: JFile; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/d')]
//  Jd = interface(JObject)
//  ['{A0B9A015-8264-4578-8433-139A038BDD72}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

//  Je_1Class = interface(JObjectClass)
//  ['{A5CE863F-E6CE-4033-809F-09F3D30CE1B7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/e$1')]
//  Je_1 = interface(JObject)
//  ['{37ED8555-58AA-49D4-A332-9D2E6FEF3CF4}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJe_1 = class(TJavaGenericImport<Je_1Class, Je_1>) end;

//  JeClass = interface(JObjectClass)
//  ['{5BAC9D0C-908F-4F2C-93BF-8AC3A249368F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: JString): Je; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/e')]
//  Je = interface(JObject)
//  ['{7A204A1F-AF4B-4308-BDF9-E41C24A22B30}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JString): Integer; cdecl; overload;
//    function b(P1: JString): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

//  JfClass = interface(JObjectClass)
//  ['{4B71D6CC-3C64-465A-9177-B1C4BB870107}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jf; cdecl;
//    {class} function a: Jf; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/f')]
//  Jf = interface(JObject)
//  ['{6684C69A-A509-44DB-B04B-7A25AC63F9A4}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: JContext; P2: JString): JString; cdecl; overload;
//
//    { Property }
//  end;

//  TJf = class(TJavaGenericImport<JfClass, Jf>) end;

//  JgClass = interface(JObjectClass)
//  ['{C2077A55-F034-41D3-B894-6B7719BBE1CD}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JContext; P2: JString): JString; cdecl; overload;
//    {class} function a(P1: JString; P2: JString): Integer; cdecl; overload;
//    {class} function a(P1: JContext; P2: JString; P3: JString): Boolean; cdecl; overload;
//    {class} function b(P1: JContext; P2: JString): JString; cdecl;
//    {class} function a(P1: JContext; P2: JIntent): Boolean; cdecl; overload;
//    {class} function a(P1: JContext): JString; cdecl; overload;
//    {class} function c(P1: JContext; P2: JString): Integer; cdecl;
//    {class} function d(P1: JContext; P2: JString): Integer; cdecl;
//    {class} function e(P1: JContext; P2: JString): Integer; cdecl;
//    {class} function a(P1: JString; P2: JString; P3: Integer): Boolean; cdecl; overload;
//    {class} function a(P1: JString): Integer; cdecl; overload;
//    {class} function a(P1: Integer): JString; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/g')]
//  Jg = interface(JObject)
//  ['{4990E4E3-8C83-42FF-8625-C75B12CD8940}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJg = class(TJavaGenericImport<JgClass, Jg>) end;

//  Jh_1Class = interface(JObjectClass)
//  ['{2892322D-5552-46E1-AB5F-95C01B29603D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/h$1')]
//  Jh_1 = interface(JObject)
//  ['{B0BD15F1-D448-414E-AB02-C0E835630074}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh_1 = class(TJavaGenericImport<Jh_1Class, Jh_1>) end;

//  Jh_a_1Class = interface(JObjectClass)
//  ['{BB488478-172B-45FD-BBFA-35A1B60EF418}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/h$a$1')]
//  Jh_a_1 = interface(JObject)
//  ['{37108839-6A99-4E06-A5F9-32CB04E21669}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJh_a_1 = class(TJavaGenericImport<Jh_a_1Class, Jh_a_1>) end;

//  Jh_aClass = interface(JObjectClass)
//  ['{76D38379-8718-4E2C-8DEF-EFA1C0EBFCA0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/h$a')]
//  Jh_a = interface(JObject)
//  ['{9B312DEA-6042-40C4-B046-4EBFDDAEBBCD}']
//    { Property Methods }
//
//    { methods }
//    procedure execute(P1: JRunnable); cdecl;
//
//    { Property }
//  end;

//  TJh_a = class(TJavaGenericImport<Jh_aClass, Jh_a>) end;

//  JhClass = interface(JObjectClass)
//  ['{1FCF0C90-6284-4E55-AACC-E1C29951C167}']
//    { static Property Methods }
//    {class} function _Geta: JExecutor;
//
//    { static Methods }
//    {class} function init: Jh; cdecl;
//    {class} function a: JHandler; cdecl; overload;
//    {class} procedure a(P1: JRunnable); cdecl; overload;
//    {class} function b: JExecutor; cdecl;
//
//    { static Property }
//    {class} property a: JExecutor read _Geta;
//  end;

//  [JavaSignature('com/tencent/open/utils/h')]
//  Jh = interface(JObject)
//  ['{5BA61955-AE98-4736-B6C7-63A48BC5F272}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJh = class(TJavaGenericImport<JhClass, Jh>) end;

//  JHttpUtils_1Class = interface(JObjectClass)
//  ['{5587F85B-15C8-4685-8EBC-8BE799C2BB84}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/HttpUtils$1')]
//  JHttpUtils_1 = interface(JObject)
//  ['{88150DFD-7A90-497B-A6A8-D579A089BA5F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;

//  TJHttpUtils_1 = class(TJavaGenericImport<JHttpUtils_1Class, JHttpUtils_1>) end;

//  JHttpUtils_aClass = interface(JObjectClass)
//  ['{604DA443-6BF5-46BF-AE36-1229F7C4CBC1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JKeyStore): JHttpUtils_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/HttpUtils$a')]
//  JHttpUtils_a = interface(JObject)
//  ['{7371A3A5-9195-42F5-B67E-7F240F109865}']
//    { Property Methods }
//
//    { methods }
//    function createSocket(P1: JSocket; P2: JString; P3: Integer; P4: Boolean): JSocket; cdecl; overload;
//    function createSocket: JSocket; cdecl; overload;
//
//    { Property }
//  end;

//  TJHttpUtils_a = class(TJavaGenericImport<JHttpUtils_aClass, JHttpUtils_a>) end;

//  JHttpUtils_bClass = interface(JObjectClass)
//  ['{4166A96A-1A75-4C49-A901-5477CDA0B08D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/HttpUtils$b')]
//  JHttpUtils_b = interface(JObject)
//  ['{FE6C6137-884E-431D-A981-CA1F61BCE670}']
//    { Property Methods }
//
//    { methods }
//    procedure checkClientTrusted(P1: TJavaObjectArray<JX509Certificate>; P2: JString); cdecl;
//    procedure checkServerTrusted(P1: TJavaObjectArray<JX509Certificate>; P2: JString); cdecl;
//    function getAcceptedIssuers: TJavaObjectArray<JX509Certificate>; cdecl;
//
//    { Property }
//  end;

//  TJHttpUtils_b = class(TJavaGenericImport<JHttpUtils_bClass, JHttpUtils_b>) end;

//  JHttpUtils_cClass = interface(JObjectClass)
//  ['{9A42A6A9-DF81-4F7C-9F49-0C899F4023A7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/HttpUtils$c')]
//  JHttpUtils_c = interface(JObject)
//  ['{6CB6E3CF-F854-4964-8ECB-CF6134E81874}']
//    { Property Methods }
//    function _Geta: JString;
//    procedure _Seta(aa: JString);
//    function _Getb: Integer;
//    procedure _Setb(ab: Integer);
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Integer read _Getb write _Setb;
//  end;

//  TJHttpUtils_c = class(TJavaGenericImport<JHttpUtils_cClass, JHttpUtils_c>) end;

  JHttpUtils_HttpStatusExceptionClass = interface(JObjectClass)
  ['{FBB4BA4D-A97D-4F26-A519-44FDA28F57B8}']
    { static Property Methods }
    {class} function _GetERROR_INFO: JString;

    { static Methods }
    {class} function init(P1: JString): JHttpUtils_HttpStatusException; cdecl;

    { static Property }
    {class} property ERROR_INFO: JString read _GetERROR_INFO;
  end;

  [JavaSignature('com/tencent/open/utils/HttpUtils$HttpStatusException')]
  JHttpUtils_HttpStatusException = interface(JObject)
  ['{5CB8CF04-F10E-44C9-B3B6-69B3C28C25E5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHttpUtils_HttpStatusException = class(TJavaGenericImport<JHttpUtils_HttpStatusExceptionClass, JHttpUtils_HttpStatusException>) end;

  JHttpUtils_NetworkUnavailableExceptionClass = interface(JObjectClass)
  ['{83397A6F-B361-418C-9213-2B7F7AF3CB55}']
    { static Property Methods }
    {class} function _GetERROR_INFO: JString;

    { static Methods }
    {class} function init(P1: JString): JHttpUtils_NetworkUnavailableException; cdecl;

    { static Property }
    {class} property ERROR_INFO: JString read _GetERROR_INFO;
  end;

  [JavaSignature('com/tencent/open/utils/HttpUtils$NetworkUnavailableException')]
  JHttpUtils_NetworkUnavailableException = interface(JObject)
  ['{8C44CF4C-B75A-4EEA-AB7E-FD2D0C003FF8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHttpUtils_NetworkUnavailableException = class(TJavaGenericImport<JHttpUtils_NetworkUnavailableExceptionClass, JHttpUtils_NetworkUnavailableException>) end;

  JHttpUtilsClass = interface(JObjectClass)
  ['{7D56AB3E-1789-4A16-B49F-03E316BD9481}']
    { static Property Methods }

    { static Methods }
    {class} function request(P1: JQQToken; P2: JContext; P3: JString; P4: JBundle; P5: JString): JJSONObject; cdecl;
    {class} procedure requestAsync(P1: JQQToken; P2: JContext; P3: JString; P4: JBundle; P5: JString; P6: JIRequestListener); cdecl;
    {class} function getErrorCodeFromException(P1: JIOException): Integer; cdecl;
//    {class} function openUrl2(P1: JContext; P2: JString; P3: JString; P4: JBundle): Ji_a; cdecl;
//    {class} function getHttpClient(P1: JContext; P2: JString; P3: JString): JHttpClient; cdecl;
    {class} function encodeUrl(P1: JBundle): JString; cdecl;
    {class} function encodePostBody(P1: JBundle; P2: JString): JString; cdecl;
//    {class} function getProxy(P1: JContext): JHttpUtils_c; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/open/utils/HttpUtils')]
  JHttpUtils = interface(JObject)
  ['{9E04422B-63F4-48F4-8B1F-8E5CC459001B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHttpUtils = class(TJavaGenericImport<JHttpUtilsClass, JHttpUtils>) end;

//  Ji_aClass = interface(JObjectClass)
//  ['{C49598CC-565A-4553-8EB1-EAA28F6F7FA3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JString; P2: Integer): Ji_a; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/i$a')]
//  Ji_a = interface(JObject)
//  ['{F371F632-B614-47B8-89AA-AB40E9C70593}']
//    { Property Methods }
//    function _Geta: JString;
//    procedure _Seta(aa: JString);
//    function _Getb: Int64;
//    procedure _Setb(ab: Int64);
//    function _Getc: Int64;
//    procedure _Setc(ac: Int64);
//
//    { methods }
//
//    { Property }
//    property a: JString read _Geta write _Seta;
//    property b: Int64 read _Getb write _Setb;
//    property c: Int64 read _Getc write _Setc;
//  end;

//  TJi_a = class(TJavaGenericImport<Ji_aClass, Ji_a>) end;

//  JiClass = interface(JObjectClass)
//  ['{99C5B205-1DC1-4B00-B031-6C01D653353E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): JBundle; cdecl; overload;
//    {class} function a(P1: JJSONObject; P2: JString): JJSONObject; cdecl; overload;
//    {class} function b(P1: JString): JBundle; cdecl; overload;
//    {class} function c(P1: JString): JJSONObject; cdecl; overload;
//    {class} function d(P1: JString): JJSONObject; cdecl; overload;
//    {class} function a: JString; cdecl; overload;
//    {class} function e(P1: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JContext; P2: JString): Boolean; cdecl; overload;
//    {class} function f(P1: JString): JString; cdecl; overload;
//    {class} function b: Boolean; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a(P1: JContext): JString; cdecl; overload;
//    {class} function g(P1: JString): Boolean; cdecl; overload;
//    {class} function h(P1: JString): Boolean; cdecl;
//    {class} function a(P1: JString; P2: Integer; P3: JString; P4: JString): JString; cdecl; overload;
//    {class} function b(P1: JContext): Boolean; cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString): JBundle; cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString; P8: JString; P9: JString; P10: JString; P11: JString; P12: JString): JBundle; cdecl; overload;
//    {class} function a(P1: JString; P2: JString; P3: JString; P4: JString; P5: JString; P6: JString; P7: JString; P8: JString; P9: JString): JBundle; cdecl; overload;
//    {class} function c(P1: JContext): JString; cdecl; overload;
//    {class} procedure b(P1: JContext; P2: JString); cdecl; overload;
//    {class} function c(P1: JContext; P2: JString): JString; cdecl; overload;
//    {class} function d(P1: JContext; P2: JString): JString; cdecl; overload;
//    {class} function e(P1: JContext; P2: JString): JString; cdecl; overload;
//    {class} function i(P1: JString): TJavaArray<Byte>; cdecl;
//    {class} function d(P1: JContext): Boolean; cdecl; overload;
//    {class} function f(P1: JContext; P2: JString): Boolean; cdecl; overload;
//    {class} function g(P1: JContext; P2: JString): Boolean; cdecl; overload;
//    {class} function a(P1: JContext; P2: Boolean): Boolean; cdecl; overload;
//    {class} function e(P1: JContext): Boolean; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/i')]
//  Ji = interface(JObject)
//  ['{F3A29A2D-EDDF-445F-BAD4-5CC955646B96}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJi = class(TJavaGenericImport<JiClass, Ji>) end;

//  JjClass = interface(JObjectClass)
//  ['{672183B6-0302-4C8A-ADF3-B195D2D898D1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: Int64): Jj; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/j')]
//  Jj = interface(JObject)
//  ['{D4602497-3FBF-414D-B903-C10EE7602F86}']
//    { Property Methods }
//
//    { methods }
//    function equals(P1: JObject): Boolean; cdecl;
//    function a: TJavaArray<Byte>; cdecl;
//    function b: Int64; cdecl;
//    function hashCode: Integer; cdecl;
//
//    { Property }
//  end;

//  TJj = class(TJavaGenericImport<JjClass, Jj>) end;

//  JkClass = interface(JObjectClass)
//  ['{4EF3215D-DA25-4BBA-88F5-AB655A4A4B45}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: TJavaArray<Byte>): Jk; cdecl; overload;
//    {class} function init(P1: TJavaArray<Byte>; P2: Integer): Jk; cdecl; overload;
//    {class} function init(P1: Integer): Jk; cdecl; overload;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/utils/k')]
//  Jk = interface(JObject)
//  ['{66F521E9-FF89-42B3-B049-68AC668E86C3}']
//    { Property Methods }
//
//    { methods }
//    function equals(P1: JObject): Boolean; cdecl;
//    function a: TJavaArray<Byte>; cdecl;
//    function b: Integer; cdecl;
//    function hashCode: Integer; cdecl;
//
//    { Property }
//  end;

//  TJk = class(TJavaGenericImport<JkClass, Jk>) end;

//  JaClass = interface(JObjectClass)
//  ['{DFFFF828-AEBF-4051-97AF-84B0770CE075}']
//    { static Property Methods }
//    {class} function _Geta: JString;
//    {class} function _Getb: Boolean;
//    {class} function _Getc: Boolean;
//
//    { static Methods }
//    {class} function init(P1: JInputConnection; P2: Boolean): Ja; cdecl;
//
//    { static Property }
//    {class} property a: JString read _Geta;
//    {class} property b: Boolean read _Getb;
//    {class} property c: Boolean read _Getc;
//  end;

//  [JavaSignature('com/tencent/open/web/security/a')]
//  Ja = interface(JObject)
//  ['{6017E54D-A75B-4718-8E3F-515FF983E6DB}']
//    { Property Methods }
//
//    { methods }
//    function setComposingText(P1: JCharSequence; P2: Integer): Boolean; cdecl;
//    function commitText(P1: JCharSequence; P2: Integer): Boolean; cdecl;
//    function sendKeyEvent(P1: JKeyEvent): Boolean; cdecl;
//
//    { Property }
//  end;

//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  JbClass = interface(JObjectClass)
//  ['{1FE7F668-E1EA-48D0-A002-55C52E7BB5D0}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/web/security/b')]
//  Jb = interface(JObject)
//  ['{6123DEAD-49EA-4403-9159-C19FB69293D4}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString; P2: JString; P3: JList; P4: Ja_a); cdecl; overload;
//    function a(P1: JWebView; P2: JString): Boolean; cdecl; overload;
//
//    { Property }
//  end;

//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{CA71914A-48FF-4ABA-9574-45C0A5D7E02C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JWebView; P2: Int64; P3: JString; P4: JString): Jc; cdecl;
//
//    { static Property }
//  end;

//  [JavaSignature('com/tencent/open/web/security/c')]
//  Jc = interface(JObject)
//  ['{CF4C4498-6ACC-4738-8FAF-2D3F462052FF}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JObject); cdecl; overload;
//    procedure a; cdecl; overload;
//    procedure a(P1: JString); cdecl; overload;
//
//    { Property }
//  end;

//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

  JJniInterfaceClass = interface(JObjectClass)
  ['{DB7C5A06-C7FA-4224-BD84-210CB3C27E0F}']
    { static Property Methods }
    {class} function _GetisJniOk: Boolean;

    { static Methods }
    {class} function init: JJniInterface; cdecl;
    {class} procedure loadSo; cdecl;
    {class} function getPWDKeyToMD5(P1: JString): JString; cdecl;
    {class} function insetTextToArray(P1: Integer; P2: JString; P3: Integer): Boolean; cdecl;
    {class} function BackSpaceChar(P1: Boolean; P2: Integer): Boolean; cdecl;
    {class} function clearAllPWD: Boolean; cdecl;

    { static Property }
    {class} property isJniOk: Boolean read _GetisJniOk;
  end;

  [JavaSignature('com/tencent/open/web/security/JniInterface')]
  JJniInterface = interface(JObject)
  ['{932B8DAA-7E6A-4640-92BA-487A8633A2AC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJniInterface = class(TJavaGenericImport<JJniInterfaceClass, JJniInterface>) end;

  JSecureJsInterfaceClass = interface(JObjectClass)
  ['{0F77B55C-235E-42D0-BC16-B6A1C3E9155B}']
    { static Property Methods }
    {class} function _GetisPWDEdit: Boolean;

    { static Methods }
    {class} function init: JSecureJsInterface; cdecl;

    { static Property }
    {class} property isPWDEdit: Boolean read _GetisPWDEdit;
  end;

  [JavaSignature('com/tencent/open/web/security/SecureJsInterface')]
  JSecureJsInterface = interface(JObject)
  ['{EFD85DF8-7CD1-46B3-99C4-9841065D4494}']
    { Property Methods }

    { methods }
    function customCallback: Boolean; cdecl;
    procedure curPosFromJS(P1: JString); cdecl;
    procedure isPasswordEdit(P1: JString); cdecl;
    procedure clearAllEdit; cdecl;
    function getMD5FromNative: JString; cdecl;

    { Property }
  end;

  TJSecureJsInterface = class(TJavaGenericImport<JSecureJsInterfaceClass, JSecureJsInterface>) end;

  JAuthActivityClass = interface(JObjectClass)
  ['{B094296D-C9B8-4392-8768-A2829D62FC63}']
    { static Property Methods }
    {class} function _GetACTION_KEY: JString;
    {class} function _GetACTION_SHARE_PRIZE: JString;

    { static Methods }
    {class} function init: JAuthActivity; cdecl;

    { static Property }
    {class} property ACTION_KEY: JString read _GetACTION_KEY;
    {class} property ACTION_SHARE_PRIZE: JString read _GetACTION_SHARE_PRIZE;
  end;

  [JavaSignature('com/tencent/tauth/AuthActivity')]
  JAuthActivity = interface(JObject)
  ['{6F1A2E23-F467-43C2-BA10-5CAFECBFF6E9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAuthActivity = class(TJavaGenericImport<JAuthActivityClass, JAuthActivity>) end;

  JIRequestListenerClass = interface(JObjectClass)
  ['{0322D7C2-5EC1-464D-8547-2E3612E7E59B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/tencent/tauth/IRequestListener')]
  JIRequestListener = interface(IJavaInstance)
  ['{AC94DD79-993A-4C62-B047-96BD6ED28D5A}']
    { Property Methods }

    { methods }
    procedure onComplete(P1: JJSONObject); cdecl;
    procedure onIOException(P1: JIOException); cdecl;
//    procedure onMalformedURLException(P1: JMalformedURLException); cdecl;
    procedure onJSONException(P1: JJSONException); cdecl;
//    procedure onConnectTimeoutException(P1: JConnectTimeoutException); cdecl;
//    procedure onSocketTimeoutException(P1: JSocketTimeoutException); cdecl;
    procedure onNetworkUnavailableException(P1: JHttpUtils_NetworkUnavailableException); cdecl;
    procedure onHttpStatusException(P1: JHttpUtils_HttpStatusException); cdecl;
    procedure onUnknowException(P1: JException); cdecl;

    { Property }
  end;

  TJIRequestListener = class(TJavaGenericImport<JIRequestListenerClass, JIRequestListener>) end;

  JIUiListenerClass = interface(JObjectClass)
  ['{F0A84783-4A16-4A4E-8A76-C48EE8B044C3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/tencent/tauth/IUiListener')]
  JIUiListener = interface(IJavaInstance)
  ['{E6FFBEB1-AA79-41A9-8755-0F64B6636ED6}']
    { Property Methods }

    { methods }
    procedure onComplete(P1: JObject); cdecl;
    procedure onError(P1: JUiError); cdecl;
    procedure onCancel; cdecl;

    { Property }
  end;

  TJIUiListener = class(TJavaGenericImport<JIUiListenerClass, JIUiListener>) end;

  JTencentClass = interface(JObjectClass)
  ['{85768349-A1BB-45E2-9645-B1B7979F8C44}']
    { static Property Methods }
    {class} function _GetREQUEST_LOGIN: Integer;

    { static Methods }
    {class} function createInstance(P1: JString; P2: JContext): JTencent; cdecl;
    {class} function onActivityResultData(P1: Integer; P2: Integer; P3: JIntent; P4: JIUiListener): Boolean; cdecl;
    {class} procedure handleResultData(P1: JIntent; P2: JIUiListener); cdecl;

    { static Property }
    {class} property REQUEST_LOGIN: Integer read _GetREQUEST_LOGIN;
  end;

  [JavaSignature('com/tencent/tauth/Tencent')]
  JTencent = interface(JObject)
  ['{8630E8E4-A318-4AAB-8F1D-624C4CB18D0F}']
    { Property Methods }

    { methods }
    function login(P1: JActivity; P2: JString; P3: JIUiListener): Integer; cdecl; overload;
    function login(P1: JFragment; P2: JString; P3: JIUiListener): Integer; cdecl; overload;
    function loginServerSide(P1: JActivity; P2: JString; P3: JIUiListener): Integer; cdecl; overload;
    function loginServerSide(P1: JFragment; P2: JString; P3: JIUiListener): Integer; cdecl; overload;
    function loginWithOEM(P1: JActivity; P2: JString; P3: JIUiListener; P4: JString; P5: JString; P6: JString): Integer; cdecl;
    procedure logout(P1: JContext); cdecl;
    function reAuth(P1: JActivity; P2: JString; P3: JIUiListener): Integer; cdecl;
    procedure reportDAU; cdecl;
    procedure checkLogin(P1: JIUiListener); cdecl;
    function invite(P1: JActivity; P2: JBundle; P3: JIUiListener): Integer; cdecl;
    function story(P1: JActivity; P2: JBundle; P3: JIUiListener): Integer; cdecl;
    function gift(P1: JActivity; P2: JBundle; P3: JIUiListener): Integer; cdecl;
    function ask(P1: JActivity; P2: JBundle; P3: JIUiListener): Integer; cdecl;
    procedure requestAsync(P1: JString; P2: JBundle; P3: JString; P4: JIRequestListener; P5: JObject); cdecl;
    function request(P1: JString; P2: JBundle; P3: JString): JJSONObject; cdecl;
    procedure shareToQQ(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure shareToQzone(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure publishToQzone(P1: JActivity; P2: JBundle; P3: JIUiListener); cdecl;
    procedure releaseResource; cdecl;
    function onActivityResult(P1: Integer; P2: Integer; P3: JIntent): Boolean; cdecl; //Deprecated
    function isSessionValid: Boolean; cdecl;
    function getAppId: JString; cdecl;
    function getAccessToken: JString; cdecl;
    function getExpiresIn: Int64; cdecl;
    function getOpenId: JString; cdecl;
    procedure handleLoginData(P1: JIntent; P2: JIUiListener); cdecl; //Deprecated
    procedure setAccessToken(P1: JString; P2: JString); cdecl;
    procedure setOpenId(P1: JString); cdecl;
    function isReady: Boolean; cdecl;
    function getQQToken: JQQToken; cdecl;
    function isSupportSSOLogin(P1: JActivity): Boolean; cdecl;

    { Property }
  end;

  TJTencent = class(TJavaGenericImport<JTencentClass, JTencent>) end;

  JUiErrorClass = interface(JObjectClass)
  ['{3292A1EA-5BD1-4308-933D-4DBB6CD43442}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Integer; P2: JString; P3: JString): JUiError; cdecl;

    { static Property }
  end;

  [JavaSignature('com/tencent/tauth/UiError')]
  JUiError = interface(JObject)
  ['{7E4A583C-2B5A-4621-9A73-E0FDB2E1C673}']
    { Property Methods }
    function _GeterrorCode: Integer;
    procedure _SeterrorCode(aerrorCode: Integer);
    function _GeterrorMessage: JString;
    procedure _SeterrorMessage(aerrorMessage: JString);
    function _GeterrorDetail: JString;
    procedure _SeterrorDetail(aerrorDetail: JString);

    { methods }

    { Property }
    property errorCode: Integer read _GeterrorCode write _SeterrorCode;
    property errorMessage: JString read _GeterrorMessage write _SeterrorMessage;
    property errorDetail: JString read _GeterrorDetail write _SeterrorDetail;
  end;

  TJUiError = class(TJavaGenericImport<JUiErrorClass, JUiError>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_2',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_2));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_3',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_3));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_a_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_a_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_b',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_b));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_c',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_c));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_d',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_d));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_1_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_1_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b_2',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b_2));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b_3',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b_3));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_b));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_c',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent_c));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthAgent));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQQToken',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQQToken));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAssistActivity_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAssistActivity_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAssistActivity',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAssistActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JBaseApi_TempRequestListener_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JBaseApi_TempRequestListener_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JBaseApi_TempRequestListener',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JBaseApi_TempRequestListener));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JBaseApi',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JBaseApi));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JConstants',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JConstants));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JUIListenerManager_ApiTask',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JUIListenerManager_ApiTask));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JUIListenerManager',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JUIListenerManager));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_2',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_2));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_3',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_3));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_4',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_4));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQQShare_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQQShare_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQQShare_2',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQQShare_2));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQQShare',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQQShare));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQzonePublish_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQzonePublish_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQzonePublish_2',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQzonePublish_2));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQzonePublish',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQzonePublish));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQzoneShare_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQzoneShare_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JQzoneShare',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JQzoneShare));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JUserInfo',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JUserInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jd_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jd_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jd_b',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jd_b));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jd_c',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jd_c));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jd_d',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jd_d));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jd',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jd));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Je',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Je));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jf',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jf));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jh',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jh));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ji',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ji));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_b',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_b));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jd',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jd));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Je',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Je));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jf',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jf));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg_2',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg_2));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg_3',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg_3));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg_4',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg_4));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg_5',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg_5));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg_6',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg_6));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc_b',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc_b));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc_c',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc_c));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc_d',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc_d));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JSocialApi',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JSocialApi));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JSocialApiIml_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JSocialApiIml_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JSocialApiIml',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JSocialApiIml));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JSocialConstants',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JSocialConstants));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JTDialog_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JTDialog_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JTDialog_FbWebViewClient',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JTDialog_FbWebViewClient));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JTDialog_JsListener',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JTDialog_JsListener));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JTDialog_OnTimeListener',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JTDialog_OnTimeListener));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JTDialog_THandler',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JTDialog_THandler));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JTDialog',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JTDialog));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb_2',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb_2));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jd',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jd));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Je_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Je_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Je',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Je));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jf',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jf));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jg',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jg));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jh_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jh_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jh_a_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jh_a_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jh_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jh_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jh',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jh));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_1',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_1));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_b',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_b));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_c',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_c));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_HttpStatusException',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_HttpStatusException));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_NetworkUnavailableException',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils_NetworkUnavailableException));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JHttpUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ji_a',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ji_a));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ji',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ji));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jj',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jj));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jk',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jk));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Ja',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Ja));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jb',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jb));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.Jc',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.Jc));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JJniInterface',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JJniInterface));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JSecureJsInterface',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JSecureJsInterface));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JAuthActivity',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JAuthActivity));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JIRequestListener',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JIRequestListener));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JIUiListener',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JIUiListener));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JTencent',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JTencent));
//  TRegTypes.RegisterType('Androidapi.JNI.open_sdk_r5886_lite.JUiError',
//    TypeInfo(Androidapi.JNI.open_sdk_r5886_lite.JUiError));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.

