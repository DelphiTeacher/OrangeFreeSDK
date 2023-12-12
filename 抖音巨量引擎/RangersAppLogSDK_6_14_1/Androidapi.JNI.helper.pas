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
//  生成时间：2023-07-01 13:46:47
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.helper;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.RangersAppLog_Lite_cn_6_14_1_aar;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //net.plonline.mylibrary.BuildConfig
  JHelper = interface; //net.plonline.mylibrary.Helper

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{E7E5A8CF-CCF8-4A4F-9530-7B12099AE29C}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
  end;

  [JavaSignature('net/plonline/mylibrary/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{66CF04F2-5F5B-4D77-8B68-A6140CC241A7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JHelperClass = interface(JObjectClass)
  ['{6957EEC1-8CA9-4516-B4A4-FC5A68B57A6C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHelper; cdecl;
    {class} procedure initAppLog(context: JContext; config: JInitConfig); cdecl;

    { static Property }
  end;

  [JavaSignature('net/plonline/mylibrary/Helper')]
  JHelper = interface(JObject)
  ['{EE3310E0-D99D-4510-A8FD-114A4178EB77}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHelper = class(TJavaGenericImport<JHelperClass, JHelper>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.helper.JBuildConfig', 
    TypeInfo(Androidapi.JNI.helper.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.helper.JHelper', 
    TypeInfo(Androidapi.JNI.helper.JHelper));
end;


initialization
  RegisterTypes;

end.
