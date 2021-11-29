﻿//====================================================
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
//  生成时间：2021-11-29 09:40:51
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.myysflibrary_debug;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes//,
//  Androidapi.JNI.android.app.Activity
  ;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.myysflibrary.BuildConfig
  JHelper = interface; //com.ggggcexx.myysflibrary.Helper

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{1DBA53DD-9665-49A0-8A67-39EE79097D23}']
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
  ['{A8AE66AC-3501-4356-9EE8-86E6738C52FC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JHelperClass = interface(JObjectClass)
  ['{F2C8142C-8B9C-49B7-8DAD-56B66A20037A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHelper; cdecl;
    {class} procedure initsdk(activity: JActivity); cdecl;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/myysflibrary/Helper')]
  JHelper = interface(JObject)
  ['{2CE96E97-D260-4B29-9C6B-2158CD2ECCA5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHelper = class(TJavaGenericImport<JHelperClass, JHelper>) end;

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.myysflibrary_debug.JBuildConfig',
//    TypeInfo(Androidapi.JNI.myysflibrary_debug.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.myysflibrary_debug.JHelper',
//    TypeInfo(Androidapi.JNI.myysflibrary_debug.JHelper));
//end;
//
//
//initialization
//  RegisterTypes;

end.
