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
//  生成时间：2018/1/22 上午 10:05:41
//  工具版本：1.0.2015.5.11
//
//====================================================
unit Androidapi.JNI.my_facebook_library;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.facebook;
//  Androidapi.JNI.com.facebook.login.LoginResult,
//  Androidapi.JNI.com.facebook.FacebookException,
//  Androidapi.JNI.com.facebook.FacebookCallback;


type
// ===== Forward declarations =====

  JBuildConfig = interface; //com.example.my_facebook_library.BuildConfig
//  JMyFacebookCallBackLoginResult_1 = interface; //com.example.my_facebook_library.MyFacebookCallBackLoginResult$1
  JMyFacebookCallBackLoginResult_MyLoginResultIntf = interface; //com.example.my_facebook_library.MyFacebookCallBackLoginResult$MyLoginResultIntf
  JMyFacebookCallBackLoginResult = interface; //com.example.my_facebook_library.MyFacebookCallBackLoginResult

// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{878F7811-F04E-4E00-AC3B-0B85EDDB1A86}']
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

  [JavaSignature('com/example/my_facebook_library/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{B2119119-79D5-46D9-9343-046DF91B797E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

//  JMyFacebookCallBackLoginResult_1Class = interface(JObjectClass)
//  ['{8634595F-2677-48FD-B26B-6DD6E280554B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/example/my_facebook_library/MyFacebookCallBackLoginResult$1')]
//  JMyFacebookCallBackLoginResult_1 = interface(JObject)
//  ['{8A703A68-EC33-4C06-97AC-F76E88C2D982}']
//    { Property Methods }
//
//    { methods }
//    procedure onSuccess(loginResult: JLoginResult); cdecl; overload;
//    procedure onCancel; cdecl;
//    procedure onError(e: JFacebookException); cdecl;
//    procedure onSuccess(P1: JObject); cdecl; overload;
//
//    { Property }
//  end;

//  TJMyFacebookCallBackLoginResult_1 = class(TJavaGenericImport<JMyFacebookCallBackLoginResult_1Class, JMyFacebookCallBackLoginResult_1>) end;

  JMyFacebookCallBackLoginResult_MyLoginResultIntfClass = interface(JObjectClass)
  ['{754CC3E6-A0E3-4E5A-B77A-7A3B08CBAFD3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/example/my_facebook_library/MyFacebookCallBackLoginResult$MyLoginResultIntf')]
  JMyFacebookCallBackLoginResult_MyLoginResultIntf = interface(IJavaInstance)
  ['{E20813BE-33D1-47B8-A0F4-7093BFDA645B}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: JLoginResult); cdecl;
    procedure onCancel; cdecl;
    procedure onError(P1: JFacebookException); cdecl;

    { Property }
  end;

  TJMyFacebookCallBackLoginResult_MyLoginResultIntf = class(TJavaGenericImport<JMyFacebookCallBackLoginResult_MyLoginResultIntfClass, JMyFacebookCallBackLoginResult_MyLoginResultIntf>) end;

  JMyFacebookCallBackLoginResultClass = interface(JObjectClass)
  ['{1B228028-2AD4-4B69-A566-F74DCE069C0B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMyFacebookCallBackLoginResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/example/my_facebook_library/MyFacebookCallBackLoginResult')]
  JMyFacebookCallBackLoginResult = interface(JObject)
  ['{3E1EC238-1A33-4EC3-A389-97F3B7316C4B}']
    { Property Methods }

    { methods }
    function GetLoginResult: JFacebookCallback; cdecl;
    procedure SetMyLoginResultIntf(AMyLoginResultIntf: JMyFacebookCallBackLoginResult_MyLoginResultIntf); cdecl;

    { Property }
  end;

  TJMyFacebookCallBackLoginResult = class(TJavaGenericImport<JMyFacebookCallBackLoginResultClass, JMyFacebookCallBackLoginResult>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.my_facebook_library.JBuildConfig', 
    TypeInfo(Androidapi.JNI.my_facebook_library.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.my_facebook_library.JMyFacebookCallBackLoginResult_1',
//    TypeInfo(Androidapi.JNI.my_facebook_library.JMyFacebookCallBackLoginResult_1));
  TRegTypes.RegisterType('Androidapi.JNI.my_facebook_library.JMyFacebookCallBackLoginResult_MyLoginResultIntf', 
    TypeInfo(Androidapi.JNI.my_facebook_library.JMyFacebookCallBackLoginResult_MyLoginResultIntf));
  TRegTypes.RegisterType('Androidapi.JNI.my_facebook_library.JMyFacebookCallBackLoginResult', 
    TypeInfo(Androidapi.JNI.my_facebook_library.JMyFacebookCallBackLoginResult));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.

