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
//  生成时间：2020/12/26 21:08:58
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.Serialport-module;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JModuleManager = interface; //com.nativec.tools.ModuleManager
  JSerialPort = interface; //com.nativec.tools.SerialPort
  JSerialPortFinder_Driver = interface; //com.nativec.tools.SerialPortFinder$Driver
  JSerialPortFinder = interface; //com.nativec.tools.SerialPortFinder

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JModuleManagerClass = interface(JObjectClass)
  ['{81714CD0-1B95-4C77-9A79-8B3BFA12CB35}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JModuleManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/ModuleManager')]
  JModuleManager = interface(JObject)
  ['{63E8A3EB-1110-41E7-863B-B116486B77F5}']
    { Property Methods }

    { methods }
    function getUHFStatus: Boolean; cdecl;
    function setUHFStatus(flag: Boolean): Boolean; cdecl;
    function getScanStatus: Boolean; cdecl;
    function setScanStatus(flag: Boolean): Boolean; cdecl;
    function setUHFAction(flag: Boolean): Boolean; cdecl;
    function getUHFAction: Boolean; cdecl;
    function setScanAction(flag: Boolean): Boolean; cdecl;
    function getScanAction: Boolean; cdecl;
    function release: Boolean; cdecl;

    { Property }
  end;

  TJModuleManager = class(TJavaGenericImport<JModuleManagerClass, JModuleManager>) end;

  JSerialPortClass = interface(JObjectClass)
  ['{4BE33125-68D2-46E7-9BA9-B1D89A256F6C}']
    { static Property Methods }

    { static Methods }
    {class} function init(device: JFile; baudrate: Integer; flags: Integer): JSerialPort; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPort')]
  JSerialPort = interface(JObject)
  ['{68F9EDD7-AD79-4329-AC99-5115C93B52AC}']
    { Property Methods }

    { methods }
    function getInputStream: JInputStream; cdecl;
    function getOutputStream: JOutputStream; cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJSerialPort = class(TJavaGenericImport<JSerialPortClass, JSerialPort>) end;

  JSerialPortFinder_DriverClass = interface(JObjectClass)
  ['{1037CC1D-E68D-4FFB-9E75-755293E6FB25}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JSerialPortFinder; name: JString; root: JString): JSerialPortFinder_Driver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPortFinder$Driver')]
  JSerialPortFinder_Driver = interface(JObject)
  ['{AA98E014-9771-4D88-A9A6-0B82EF97FC0F}']
    { Property Methods }

    { methods }
    function getDevices: JVector; cdecl;
    function getName: JString; cdecl;

    { Property }
  end;

  TJSerialPortFinder_Driver = class(TJavaGenericImport<JSerialPortFinder_DriverClass, JSerialPortFinder_Driver>) end;

  JSerialPortFinderClass = interface(JObjectClass)
  ['{647F8959-FD87-43EE-890E-0684D6235AD3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSerialPortFinder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPortFinder')]
  JSerialPortFinder = interface(JObject)
  ['{A80B7F96-8FC5-4119-A806-021D55B643DE}']
    { Property Methods }

    { methods }
    function getAllDevices: TJavaObjectArray<JString>; cdecl;
    function getAllDevicesPath: TJavaObjectArray<JString>; cdecl;

    { Property }
  end;

  TJSerialPortFinder = class(TJavaGenericImport<JSerialPortFinderClass, JSerialPortFinder>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.Serialport-module.JModuleManager', 
    TypeInfo(Androidapi.JNI.Serialport-module.JModuleManager));
  TRegTypes.RegisterType('Androidapi.JNI.Serialport-module.JSerialPort', 
    TypeInfo(Androidapi.JNI.Serialport-module.JSerialPort));
  TRegTypes.RegisterType('Androidapi.JNI.Serialport-module.JSerialPortFinder_Driver', 
    TypeInfo(Androidapi.JNI.Serialport-module.JSerialPortFinder_Driver));
  TRegTypes.RegisterType('Androidapi.JNI.Serialport-module.JSerialPortFinder', 
    TypeInfo(Androidapi.JNI.Serialport-module.JSerialPortFinder));
end;


initialization
  RegisterTypes;

end.
