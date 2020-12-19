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
//  生成时间：2020/12/19 22:20:54
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.sunmi_helper;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.sunmi_printer_all;


type

// ===== Forward declarations =====

  JMyInnerPrinterCallback = interface; //com.ggggcexx.MyInnerPrinterCallback
  JMyInnerPrinterCallbackEvent = interface; //com.ggggcexx.MyInnerPrinterCallbackEvent

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JMyInnerPrinterCallbackClass = interface(JInnerPrinterCallbackClass) // or JObjectClass
  ['{30C6405E-C8C3-44FA-A28F-8F491C1CE7AA}']
    { static Property Methods }
    {class} function _Getgservice: JSunmiPrinterService;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getgevent: JMyInnerPrinterCallbackEvent;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JMyInnerPrinterCallback; cdecl;
    {class} procedure setMyInnerPrinterCallbackEvent(aevent: JMyInnerPrinterCallbackEvent); cdecl;

    { static Property }
    {class} property gservice: JSunmiPrinterService read _Getgservice;
    {class} property gevent: JMyInnerPrinterCallbackEvent read _Getgevent;
  end;

  [JavaSignature('com/ggggcexx/MyInnerPrinterCallback')]
  JMyInnerPrinterCallback = interface(JInnerPrinterCallback) // or JObject
  ['{F12F728C-7CAF-4D42-A2D4-FEFBFBB89049}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMyInnerPrinterCallback = class(TJavaGenericImport<JMyInnerPrinterCallbackClass, JMyInnerPrinterCallback>) end;

  JMyInnerPrinterCallbackEventClass = interface(JObjectClass)
  ['{2A16F867-DC58-42A0-85FF-487EA8399926}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/MyInnerPrinterCallbackEvent')]
  JMyInnerPrinterCallbackEvent = interface(IJavaInstance)
  ['{E91AFD2C-A103-4142-A687-EEFA313720B8}']
    { Property Methods }

    { methods }
    procedure onConnected(P1: JSunmiPrinterService); cdecl;
    procedure onDisconnected; cdecl;

    { Property }
  end;

  TJMyInnerPrinterCallbackEvent = class(TJavaGenericImport<JMyInnerPrinterCallbackEventClass, JMyInnerPrinterCallbackEvent>) end;

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_helper.JMyInnerPrinterCallback',
//    TypeInfo(Androidapi.JNI.sunmi_helper.JMyInnerPrinterCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_helper.JMyInnerPrinterCallbackEvent',
//    TypeInfo(Androidapi.JNI.sunmi_helper.JMyInnerPrinterCallbackEvent));
//end;
//
//
//initialization
//  RegisterTypes;

end.
