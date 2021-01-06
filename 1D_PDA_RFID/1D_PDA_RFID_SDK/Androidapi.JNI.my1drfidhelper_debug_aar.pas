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
//  生成时间：2020/12/27 9:55:00
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.my1drfidhelper_debug_aar;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.xdl2d_RFID,
//  Androidapi.JNI.RFID_1DScanner,
  Androidapi.JNI.Serialport_module,
  Androidapi.JNI.JavaTypes;//,
//  Androidapi.JNI.com.rfid.rxobserver.bean.RXInventoryTag;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.my1drfidhelper.BuildConfig
  JMyRXObserver = interface; //com.ggggcexx.my1drfidhelper.MyRXObserver
  JMyRXObserverEvent = interface; //com.ggggcexx.my1drfidhelper.MyRXObserverEvent

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{D5A666C7-42E9-426F-AAA0-BE5A18CBCF76}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/ggggcexx/my1drfidhelper/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{9F3E00EC-000A-4087-8E18-C476544678A5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JMyRXObserverClass = interface(JRXObserverClass) // or JObjectClass
  ['{560CEA7C-EFB2-49C7-A831-00A55366C9C6}']
    { static Property Methods }
    {class} function _GetFEvent: JMyRXObserverEvent;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JMyRXObserver; cdecl;
    {class} procedure setMyRXObserverEvent(AEvent: JMyRXObserverEvent); cdecl;

    { static Property }
    {class} property FEvent: JMyRXObserverEvent read _GetFEvent;
  end;

  [JavaSignature('com/ggggcexx/my1drfidhelper/MyRXObserver')]
  JMyRXObserver = interface(JRXObserver) // or JObject
  ['{CB14C49A-66B6-4903-88C0-61F5EAC242EC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMyRXObserver = class(TJavaGenericImport<JMyRXObserverClass, JMyRXObserver>) end;

  JMyRXObserverEventClass = interface(JObjectClass)
  ['{F3C94B58-EC71-4CA8-9038-BBD66F7CB7E0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/my1drfidhelper/MyRXObserverEvent')]
  JMyRXObserverEvent = interface(IJavaInstance)
  ['{C8D3B473-B3C5-476A-AEFB-5E1914E112AF}']
    { Property Methods }

    { methods }
    procedure onInventoryTag(P1: JRXInventoryTag); cdecl;

    { Property }
  end;

  TJMyRXObserverEvent = class(TJavaGenericImport<JMyRXObserverEventClass, JMyRXObserverEvent>) end;

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.my1drfidhelper_debug_aar.JBuildConfig',
//    TypeInfo(Androidapi.JNI.my1drfidhelper_debug_aar.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.my1drfidhelper_debug_aar.JMyRXObserver',
//    TypeInfo(Androidapi.JNI.my1drfidhelper_debug_aar.JMyRXObserver));
//  TRegTypes.RegisterType('Androidapi.JNI.my1drfidhelper_debug_aar.JMyRXObserverEvent',
//    TypeInfo(Androidapi.JNI.my1drfidhelper_debug_aar.JMyRXObserverEvent));
//end;
//
//
//initialization
//  RegisterTypes;

end.
