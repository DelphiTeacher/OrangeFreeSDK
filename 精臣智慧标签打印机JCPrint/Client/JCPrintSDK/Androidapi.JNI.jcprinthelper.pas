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
//  生成时间：2022-05-29 16:18:34
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.jcprinthelper;

interface

uses
  Androidapi.JNI.Os,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,

//  {$IFDEF ANDROID}
//  FMX.Platform.Android,
//  Androidapi.JNIBridge,
//  Androidapi.JNI.Widget,
//
//
//  Androidapi.JNI.Net,
//  Androidapi.JNI.GraphicsContentViewText,
//  Androidapi.JNI.JavaTypes,
//  Androidapi.Helpers,
//  Androidapi.JNI.App,
//  FMX.Helpers.Android,
//    {$IF RTLVersion>=33}// 10.3+
//    System.Permissions, // 动态权限单元
//    {$ENDIF}
//  {$ENDIF}

  Androidapi.JNIBridge,
  Androidapi.JNI.print3_1_5_release_aar,
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.jcprinthelper.BuildConfig
  Jjcprinthelper_1 = interface; //com.ggggcexx.jcprinthelper.jcprinthelper$1
  Jjcprinthelper = interface; //com.ggggcexx.jcprinthelper.jcprinthelper

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{CA6556F2-3954-44CB-9945-C1CA82D7FF50}']
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

  [JavaSignature('com/ggggcexx/jcprinthelper/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{034C04D2-1698-4B3E-B5E4-BD04ACB48730}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  Jjcprinthelper_1Class = interface(JObjectClass)
  ['{2DA949FD-4C68-4800-BBFC-E53B66FB16D1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/jcprinthelper/jcprinthelper$1')]
  Jjcprinthelper_1 = interface(JObject)
  ['{44809078-B570-4B6F-9B27-166F65909DBF}']
    { Property Methods }

    { methods }
    procedure onProgress(pageIndex: Integer; quantityIndex: Integer; customData: JHashMap); cdecl;
    procedure onError(errorCode: Integer; printState: Integer); cdecl; overload;
    procedure onError(errorCode: Integer); cdecl; overload;
    procedure onBufferFree(pageIndex: Integer; bufferSize: Integer); cdecl;
    procedure onPause(isSuccess: Boolean); cdecl;
    procedure onCancelJob(isSuccess: Boolean); cdecl;

    { Property }
  end;

  TJjcprinthelper_1 = class(TJavaGenericImport<Jjcprinthelper_1Class, Jjcprinthelper_1>) end;

  JjcprinthelperClass = interface(JObjectClass)
  ['{08EF52BC-9820-4736-B3F3-20DB83CC96E5}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jjcprinthelper; cdecl;
    {class} procedure init_jcapi(api: JJCPrintApi; application: JApplication); cdecl;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/jcprinthelper/jcprinthelper')]
  Jjcprinthelper = interface(JObject)
  ['{F706038F-84B7-4655-A203-4298BB6DDB75}']
    { Property Methods }

    { methods }
    function getJson(context: JContext; fileName: JString): JString; cdecl;
    procedure test_print(api: JJCPrintApi); cdecl;

    { Property }
  end;

  TJjcprinthelper = class(TJavaGenericImport<JjcprinthelperClass, Jjcprinthelper>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.jcprinthelper.JBuildConfig', 
    TypeInfo(Androidapi.JNI.jcprinthelper.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.jcprinthelper.Jjcprinthelper_1', 
    TypeInfo(Androidapi.JNI.jcprinthelper.Jjcprinthelper_1));
  TRegTypes.RegisterType('Androidapi.JNI.jcprinthelper.Jjcprinthelper', 
    TypeInfo(Androidapi.JNI.jcprinthelper.Jjcprinthelper));
end;


initialization
  RegisterTypes;

end.
