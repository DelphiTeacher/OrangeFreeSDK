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
//  生成时间：2021-11-29 10:12:16
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.myysflibrary;

interface


{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes//,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.os.IBinder,
//  Androidapi.JNI.android.content.Intent,
//  Androidapi.JNI.android.os.Message,
//  Androidapi.JNI.android.graphics.Bitmap
  ;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.myysflibrary.BuildConfig
  JHelper = interface; //com.ggggcexx.myysflibrary.Helper

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{7C962A5E-5724-49D5-BA0A-AD3C16F15E39}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/ggggcexx/myysflibrary/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{734A6217-9625-4157-AE86-03BA988B5819}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JHelperClass = interface(JObjectClass)
  ['{15D4B2DB-3195-4B87-812E-8B3D77B5200E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHelper; cdecl;
    {class} procedure initsdk(activity: JActivity; speed: Integer; device: JString); cdecl;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/myysflibrary/Helper')]
  JHelper = interface(JObject)
  ['{7CBB3B12-0F06-4B31-A810-523CEFFADCB7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHelper = class(TJavaGenericImport<JHelperClass, JHelper>) end;
{$ENDIF ANDROID}

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.myysflibrary.JBuildConfig',
//    TypeInfo(Androidapi.JNI.myysflibrary.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.myysflibrary.JHelper',
//    TypeInfo(Androidapi.JNI.myysflibrary.JHelper));
//end;
//
//
//initialization
//  RegisterTypes;

end.
