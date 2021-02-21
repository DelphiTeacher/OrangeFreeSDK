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
//  生成时间：2018/1/16 19:46:52
//  工具版本：1.0.2015.5.11
//
//====================================================
unit Androidapi.JNI.my_callback_library;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes;
//  Androidapi.JNI.com.twitter.sdk.android.core.Result,
//  Androidapi.JNI.com.twitter.sdk.android.core.TwitterException,
//  Androidapi.JNI.com.twitter.sdk.android.core.Callback;


type
// ===== Forward declarations =====

  JCallbackTwitterSession_1 = interface; //CallbackTwitterSession$1
  JCallbackTwitterSession = interface; //CallbackTwitterSession
  JBuildConfig = interface; //com.example.my_callback_library.BuildConfig

// ===== Interface declarations =====

  JCallbackTwitterSession_1Class = interface(JObjectClass)
  ['{F5F334E4-32F6-4CFD-987C-60D1930B825F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('CallbackTwitterSession$1')]
  JCallbackTwitterSession_1 = interface(JObject)
  ['{1D9A0BE6-B75D-402A-8187-A09937C2354F}']
    { Property Methods }

    { methods }
//    procedure success(result: JResult); cdecl;
//    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJCallbackTwitterSession_1 = class(TJavaGenericImport<JCallbackTwitterSession_1Class, JCallbackTwitterSession_1>) end;

  JCallbackTwitterSessionClass = interface(JObjectClass)
  ['{E3E6C10F-62EF-4BC6-8928-BE646D4591E0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCallbackTwitterSession; cdecl;

    { static Property }
  end;

  [JavaSignature('CallbackTwitterSession')]
  JCallbackTwitterSession = interface(JObject)
  ['{87CB346C-FFB9-440E-A31D-58581454429B}']
    { Property Methods }

    { methods }
//    function getFTwitterResult: JCallback; cdecl;

    { Property }
  end;

  TJCallbackTwitterSession = class(TJavaGenericImport<JCallbackTwitterSessionClass, JCallbackTwitterSession>) end;

  JBuildConfigClass = interface(JObjectClass)
  ['{D7B622F2-536A-494D-A60A-C30E40127F28}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;
    {class} function _GetAPPLICATION_ID: JString;
    {class} function _GetBUILD_TYPE: JString;
    {class} function _GetFLAVOR: JString;
    {class} function _GetVERSION_CODE: Integer;
    {class} function _GetVERSION_NAME: JString;

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/example/my_callback_library/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{8D3A8D4F-D870-4D7C-ACC5-FE640F3A5F73}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.my_callback_library.JCallbackTwitterSession_1', 
    TypeInfo(Androidapi.JNI.my_callback_library.JCallbackTwitterSession_1));
  TRegTypes.RegisterType('Androidapi.JNI.my_callback_library.JCallbackTwitterSession', 
    TypeInfo(Androidapi.JNI.my_callback_library.JCallbackTwitterSession));
  TRegTypes.RegisterType('Androidapi.JNI.my_callback_library.JBuildConfig', 
    TypeInfo(Androidapi.JNI.my_callback_library.JBuildConfig));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
