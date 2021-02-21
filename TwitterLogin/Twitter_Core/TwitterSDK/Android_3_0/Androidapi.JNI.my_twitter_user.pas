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
//  生成时间：2018/1/22 15:24:43
//  工具版本：1.0.2015.5.11
//
//====================================================
unit Androidapi.JNI.my_twitter_user;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.classes;
//  Androidapi.JNI.com.twitter.sdk.android.core.Result,
//  Androidapi.JNI.com.twitter.sdk.android.core.TwitterException,
//  Androidapi.JNI.com.twitter.sdk.android.core.TwitterAuthToken,
//  Androidapi.JNI.com.twitter.sdk.android.core.Callback;


type
// ===== Forward declarations =====

  JMyTwitterSessionCallback_1 = interface; //com.twitter.my_library.MyTwitterSessionCallback$1
  JMyTwitterSessionCallback_MyCallBackTwitterSession = interface; //com.twitter.my_library.MyTwitterSessionCallback$MyCallBackTwitterSession
  JMyTwitterSessionCallback = interface; //com.twitter.my_library.MyTwitterSessionCallback

// ===== Interface declarations =====

  JMyTwitterSessionCallback_1Class = interface(JObjectClass)
  ['{78248A73-3256-405B-8808-52C826F55246}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/my_library/MyTwitterSessionCallback$1')]
  JMyTwitterSessionCallback_1 = interface(JObject)
  ['{5A67DDD2-8D61-4354-A1C4-6CFD3409D5A8}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJMyTwitterSessionCallback_1 = class(TJavaGenericImport<JMyTwitterSessionCallback_1Class, JMyTwitterSessionCallback_1>) end;

  JMyTwitterSessionCallback_MyCallBackTwitterSessionClass = interface(JObjectClass)
  ['{F56F3C59-2973-4A04-A32F-B18700175C87}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/my_library/MyTwitterSessionCallback$MyCallBackTwitterSession')]
  JMyTwitterSessionCallback_MyCallBackTwitterSession = interface(IJavaInstance)
  ['{88F0BBF4-DB05-4BBE-89B6-8689E0E87427}']
    { Property Methods }

    { methods }
    procedure success(P1: JResult; P2: Int64; P3: JString; P4: JTwitterAuthToken); cdecl;
    procedure failure; cdecl;

    { Property }
  end;

  TJMyTwitterSessionCallback_MyCallBackTwitterSession = class(TJavaGenericImport<JMyTwitterSessionCallback_MyCallBackTwitterSessionClass, JMyTwitterSessionCallback_MyCallBackTwitterSession>) end;

  JMyTwitterSessionCallbackClass = interface(JObjectClass)
  ['{DE9C9C1E-9DD5-4E3B-89C8-E8E90B809B5D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMyTwitterSessionCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/my_library/MyTwitterSessionCallback')]
  JMyTwitterSessionCallback = interface(JObject)
  ['{790DB35D-FF66-424F-8E49-4049D3B15CE9}']
    { Property Methods }
    function _Getcallback: JCallback;
    procedure _Setcallback(acallback: JCallback);

    { methods }
    function GetCallBack: JCallback; cdecl;
    procedure setmytwittersession(AFMyTwitterSession: JMyTwitterSessionCallback_MyCallBackTwitterSession); cdecl;

    { Property }
    property callback: JCallback read _Getcallback write _Setcallback;
  end;

  TJMyTwitterSessionCallback = class(TJavaGenericImport<JMyTwitterSessionCallbackClass, JMyTwitterSessionCallback>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.my_twitter_user.JMyTwitterSessionCallback_1', 
    TypeInfo(Androidapi.JNI.my_twitter_user.JMyTwitterSessionCallback_1));
  TRegTypes.RegisterType('Androidapi.JNI.my_twitter_user.JMyTwitterSessionCallback_MyCallBackTwitterSession', 
    TypeInfo(Androidapi.JNI.my_twitter_user.JMyTwitterSessionCallback_MyCallBackTwitterSession));
  TRegTypes.RegisterType('Androidapi.JNI.my_twitter_user.JMyTwitterSessionCallback', 
    TypeInfo(Androidapi.JNI.my_twitter_user.JMyTwitterSessionCallback));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
