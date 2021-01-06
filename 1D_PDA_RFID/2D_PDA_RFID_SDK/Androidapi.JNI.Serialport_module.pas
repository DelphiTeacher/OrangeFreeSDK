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
//  生成时间：2021/1/5 12:35:45
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.Serialport_module;

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
  ['{BFBF5F5B-F3A4-493A-B91A-6D7683D867DB}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JModuleManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/ModuleManager')]
  JModuleManager = interface(JObject)
  ['{5868A219-4C2F-4DE0-A298-D73566B4CC16}']
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
    procedure release; cdecl;

    { Property }
  end;

  TJModuleManager = class(TJavaGenericImport<JModuleManagerClass, JModuleManager>) end;

  JSerialPortClass = interface(JObjectClass)
  ['{BE623C15-1A6E-46D5-B005-D82134F9AD94}']
    { static Property Methods }

    { static Methods }
    {class} function init(device: JFile; baudrate: Integer; flags: Integer): JSerialPort; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPort')]
  JSerialPort = interface(JObject)
  ['{D8FE9591-C642-49A8-B786-EF1B7AE6296A}']
    { Property Methods }

    { methods }
    function getInputStream: JInputStream; cdecl;
    function getOutputStream: JOutputStream; cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJSerialPort = class(TJavaGenericImport<JSerialPortClass, JSerialPort>) end;

  JSerialPortFinder_DriverClass = interface(JObjectClass)
  ['{3131B81D-EE17-4BCB-A3C3-C152DD967D2E}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JSerialPortFinder; name: JString; root: JString): JSerialPortFinder_Driver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPortFinder$Driver')]
  JSerialPortFinder_Driver = interface(JObject)
  ['{95AB0E92-CF74-4459-ACAA-9A78F0487052}']
    { Property Methods }

    { methods }
//    function getDevices: JVector; cdecl;
//    function getName: JString; cdecl;

    { Property }
  end;

  TJSerialPortFinder_Driver = class(TJavaGenericImport<JSerialPortFinder_DriverClass, JSerialPortFinder_Driver>) end;

  JSerialPortFinderClass = interface(JObjectClass)
  ['{4A7EF419-FAFA-4AC0-B75A-E6D73394B8CE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSerialPortFinder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPortFinder')]
  JSerialPortFinder = interface(JObject)
  ['{F5FCF601-52CE-475B-B025-52D885CE3DC1}']
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
  TRegTypes.RegisterType('Androidapi.JNI.Serialport_module.JModuleManager',
    TypeInfo(Androidapi.JNI.Serialport_module.JModuleManager));
  TRegTypes.RegisterType('Androidapi.JNI.Serialport_module.JSerialPort',
    TypeInfo(Androidapi.JNI.Serialport_module.JSerialPort));
  TRegTypes.RegisterType('Androidapi.JNI.Serialport_module.JSerialPortFinder_Driver',
    TypeInfo(Androidapi.JNI.Serialport_module.JSerialPortFinder_Driver));
  TRegTypes.RegisterType('Androidapi.JNI.Serialport_module.JSerialPortFinder',
    TypeInfo(Androidapi.JNI.Serialport_module.JSerialPortFinder));
end;


initialization
  RegisterTypes;

end.
