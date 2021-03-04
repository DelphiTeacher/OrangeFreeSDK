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
//  生成时间：2018/1/23 15:44:05
//  工具版本：1.0.2015.5.11
//
//====================================================
unit Androidapi.JNI.my_twitter_UserInformation;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.classes;
//  Androidapi.JNI.com.twitter.sdk.android.core.Result,
//  Androidapi.JNI.com.twitter.sdk.android.core.TwitterException,
//  Androidapi.JNI.com.twitter.sdk.android.core.models.User,
//  Androidapi.JNI.GraphicsContentViewText,
//  Androidapi.JNI.com.twitter.sdk.android.core.TwitterSession,
//  Androidapi.JNI.com.twitter.sdk.android.core.Callback;


type
// ===== Forward declarations =====

  JMyCallUser_1 = interface; //my_twitter_getuser.MyCallUser$1
  JMyCallUser_2 = interface; //my_twitter_getuser.MyCallUser$2
  JMyCallUser_CallbackWrapper = interface; //my_twitter_getuser.MyCallUser$CallbackWrapper
  JMyCallUser_GetMyInfo = interface; //my_twitter_getuser.MyCallUser$GetMyInfo
  JMyCallUser = interface; //my_twitter_getuser.MyCallUser

// ===== Interface declarations =====

  JMyCallUser_1Class = interface(JObjectClass)
  ['{C7C4258A-4FC5-46D5-B596-2ED83707A053}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('my_twitter_getuser/MyCallUser$1')]
  JMyCallUser_1 = interface(JObject)
  ['{5E7011C5-B530-4F38-A7C4-6A1EF32DA3C7}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJMyCallUser_1 = class(TJavaGenericImport<JMyCallUser_1Class, JMyCallUser_1>) end;

  JMyCallUser_2Class = interface(JObjectClass)
  ['{7CDEC9B6-ECE4-407E-A87F-2FDE2D690B1F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('my_twitter_getuser/MyCallUser$2')]
  JMyCallUser_2 = interface(JObject)
  ['{21BFE7E5-BD48-4330-9ACB-5055CE7485A1}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJMyCallUser_2 = class(TJavaGenericImport<JMyCallUser_2Class, JMyCallUser_2>) end;

  JMyCallUser_CallbackWrapperClass = interface(JObjectClass)
  ['{F15EB553-0F33-459E-8D72-5232EA7140DF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('my_twitter_getuser/MyCallUser$CallbackWrapper')]
  JMyCallUser_CallbackWrapper = interface(JObject)
  ['{EF06BB32-0D83-49A9-946C-867D3C1A68D7}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJMyCallUser_CallbackWrapper = class(TJavaGenericImport<JMyCallUser_CallbackWrapperClass, JMyCallUser_CallbackWrapper>) end;

  JMyCallUser_GetMyInfoClass = interface(JObjectClass)
  ['{D3D8780E-C124-4483-A8D5-315D38167EE8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('my_twitter_getuser/MyCallUser$GetMyInfo')]
  JMyCallUser_GetMyInfo = interface(IJavaInstance)
  ['{1E9B1A0A-917E-4208-98E0-0F6823001450}']
    { Property Methods }

    { methods }
    procedure success(P1: JUser); cdecl;
    procedure failure; cdecl;

    { Property }
  end;

  TJMyCallUser_GetMyInfo = class(TJavaGenericImport<JMyCallUser_GetMyInfoClass, JMyCallUser_GetMyInfo>) end;

  JMyCallUserClass = interface(JObjectClass)
  ['{E5F72E53-567B-4319-A8A1-204C14DCE291}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMyCallUser; cdecl;

    { static Property }
  end;

  [JavaSignature('my_twitter_getuser/MyCallUser')]
  JMyCallUser = interface(JObject)
  ['{4787E1DA-4956-4C9C-B6D9-0789EB68F434}']
    { Property Methods }

    { methods }
    procedure setmyuserinfo(AFGetMyInfo: JMyCallUser_GetMyInfo); cdecl;
    procedure requestUserInfo(context: JContext; session: JTwitterSession); cdecl;
    procedure requestMyInfo(session: JTwitterSession; callback: JCallback); cdecl;

    { Property }
  end;

  TJMyCallUser = class(TJavaGenericImport<JMyCallUserClass, JMyCallUser>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.my_twitter_UserInformation.JMyCallUser_1', 
    TypeInfo(Androidapi.JNI.my_twitter_UserInformation.JMyCallUser_1));
  TRegTypes.RegisterType('Androidapi.JNI.my_twitter_UserInformation.JMyCallUser_2', 
    TypeInfo(Androidapi.JNI.my_twitter_UserInformation.JMyCallUser_2));
  TRegTypes.RegisterType('Androidapi.JNI.my_twitter_UserInformation.JMyCallUser_CallbackWrapper', 
    TypeInfo(Androidapi.JNI.my_twitter_UserInformation.JMyCallUser_CallbackWrapper));
  TRegTypes.RegisterType('Androidapi.JNI.my_twitter_UserInformation.JMyCallUser_GetMyInfo', 
    TypeInfo(Androidapi.JNI.my_twitter_UserInformation.JMyCallUser_GetMyInfo));
  TRegTypes.RegisterType('Androidapi.JNI.my_twitter_UserInformation.JMyCallUser', 
    TypeInfo(Androidapi.JNI.my_twitter_UserInformation.JMyCallUser));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
