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
//  生成时间：2021-06-28 14:07:53
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.mysunmifacelibrary_debug_aar;

interface
{$IFDEF ANDROID}

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.facelib_release_aar,
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.mysunmifacelibrary.BuildConfig
  Jmysunmifacehelper = interface; //com.ggggcexx.mysunmifacelibrary.mysunmifacehelper

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{0DDCDB2B-E555-4160-BCF9-54292E3067F6}']
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

  [JavaSignature('com/ggggcexx/mysunmifacelibrary/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{C93B77C2-3FDB-4C23-A461-6B4F42382D4A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JmysunmifacehelperClass = interface(JObjectClass)
  ['{4B90ECE2-1881-4309-9EB4-40BDF29D756D}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jmysunmifacehelper; cdecl;
    {class} function init_by_config_path(AConfigFilePath: JString): Integer; cdecl;
    {class} function getPixelsBGR(image: JBitmap): TJavaArray<Byte>; cdecl;
    {class} function addFeature(id: JString; name: JString; bitmap: JBitmap): Boolean; cdecl;
    {class} function RecFeature(bitmap: JBitmap): JSunmiFaceDBIdInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mysunmifacelibrary/mysunmifacehelper')]
  Jmysunmifacehelper = interface(JObject)
  ['{3549F9F8-E002-4270-9161-7017297DBE5C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJmysunmifacehelper = class(TJavaGenericImport<JmysunmifacehelperClass, Jmysunmifacehelper>) end;

{$ENDIF ANDROID}

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.mysunmifacelibrary_debug_aar.JBuildConfig',
//    TypeInfo(Androidapi.JNI.mysunmifacelibrary_debug_aar.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.mysunmifacelibrary_debug_aar.Jmysunmifacehelper',
//    TypeInfo(Androidapi.JNI.mysunmifacelibrary_debug_aar.Jmysunmifacehelper));
//end;
//
//
//initialization
//  RegisterTypes;

end.
