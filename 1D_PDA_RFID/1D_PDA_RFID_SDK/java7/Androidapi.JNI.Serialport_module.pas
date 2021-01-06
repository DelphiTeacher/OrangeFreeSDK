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
//  生成时间：2020/12/26 20:54:16
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
  ['{4B78E6AE-0947-4FBA-B1E2-BB8D49D4F490}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JModuleManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/ModuleManager')]
  JModuleManager = interface(JObject)
  ['{5BCCD471-7800-4C94-829D-C7956C1F1912}']
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
  ['{1921E619-8F7C-46AB-81BD-38B6AB8C80B5}']
    { static Property Methods }

    { static Methods }
    {class} function init(device: JFile; baudrate: Integer; flags: Integer): JSerialPort; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPort')]
  JSerialPort = interface(JObject)
  ['{BDDD7A58-ACE9-47D9-B173-B35D86A4D0BC}']
    { Property Methods }

    { methods }
    function getInputStream: JInputStream; cdecl;
    function getOutputStream: JOutputStream; cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJSerialPort = class(TJavaGenericImport<JSerialPortClass, JSerialPort>) end;

  JSerialPortFinder_DriverClass = interface(JObjectClass)
  ['{E22711CD-4A41-4A1E-9D45-1DF1EC8B99F7}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JSerialPortFinder; name: JString; root: JString): JSerialPortFinder_Driver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPortFinder$Driver')]
  JSerialPortFinder_Driver = interface(JObject)
  ['{F57B983A-D387-4734-9189-2D3D8524C8A4}']
    { Property Methods }

    { methods }
//    function getDevices: JVector; cdecl;
    function getName: JString; cdecl;

    { Property }
  end;

  TJSerialPortFinder_Driver = class(TJavaGenericImport<JSerialPortFinder_DriverClass, JSerialPortFinder_Driver>) end;

  JSerialPortFinderClass = interface(JObjectClass)
  ['{562DA220-3D70-4F56-8CAA-7AF98FCD234E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSerialPortFinder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/nativec/tools/SerialPortFinder')]
  JSerialPortFinder = interface(JObject)
  ['{051791E5-D30A-42FE-875E-99056D73B7D1}']
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
