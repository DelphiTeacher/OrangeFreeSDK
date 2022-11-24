//Code Fix By [金华]DelphiTeacher(452330643)

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
//  生成时间：2022-11-24 10:58:42
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.bluetoothlibrary_debug;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.GraphicsContentViewText, 
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Bluetooth;


type

// ===== Forward declarations =====

//  JAllBluetoothManage_1 = interface; //com.hc.bluetoothlibrary.AllBluetoothManage$1
//  JAllBluetoothManage_2 = interface; //com.hc.bluetoothlibrary.AllBluetoothManage$2
//  JAllBluetoothManage_3 = interface; //com.hc.bluetoothlibrary.AllBluetoothManage$3
//  JAllBluetoothManage_4 = interface; //com.hc.bluetoothlibrary.AllBluetoothManage$4
//  JAllBluetoothManage_5_1 = interface; //com.hc.bluetoothlibrary.AllBluetoothManage$5$1
//  JAllBluetoothManage_5_2 = interface; //com.hc.bluetoothlibrary.AllBluetoothManage$5$2
//  JAllBluetoothManage_5 = interface; //com.hc.bluetoothlibrary.AllBluetoothManage$5
  JAllBluetoothManage_State = interface; //com.hc.bluetoothlibrary.AllBluetoothManage$State
  JAllBluetoothManage = interface; //com.hc.bluetoothlibrary.AllBluetoothManage
//  JBleBluetoothManage_1 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$1
//  JBleBluetoothManage_10_1 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$10$1
//  JBleBluetoothManage_10 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$10
//  JBleBluetoothManage_2 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$2
//  JBleBluetoothManage_3 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$3
//  JBleBluetoothManage_4 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$4
//  JBleBluetoothManage_5 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$5
//  JBleBluetoothManage_6 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$6
//  JBleBluetoothManage_7 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$7
//  JBleBluetoothManage_8_1 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$8$1
//  JBleBluetoothManage_8 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$8
//  JBleBluetoothManage_9_1 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$9$1
//  JBleBluetoothManage_9_2 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$9$2
//  JBleBluetoothManage_9 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage$9
  JBleBluetoothManage = interface; //com.hc.bluetoothlibrary.bleBluetooth.BleBluetoothManage
//  JBluetoothLeService_1_1 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService$1$1
//  JBluetoothLeService_1_2 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService$1$2
//  JBluetoothLeService_1_3 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService$1$3
//  JBluetoothLeService_1 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService$1
//  JBluetoothLeService_2 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService$2
//  JBluetoothLeService_3 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService$3
//  JBluetoothLeService_4 = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService$4
  JBluetoothLeService_DownloadBinder = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService$DownloadBinder
  JBluetoothLeService = interface; //com.hc.bluetoothlibrary.bleBluetooth.BluetoothLeService
  JParseLeAdvData = interface; //com.hc.bluetoothlibrary.bleBluetooth.ParseLeAdvData
  JBuildConfig = interface; //com.hc.bluetoothlibrary.BuildConfig
//  JClassicBluetoothManage_1 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$1
//  JClassicBluetoothManage_10 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$10
//  JClassicBluetoothManage_11 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$11
//  JClassicBluetoothManage_2 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$2
//  JClassicBluetoothManage_3 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$3
//  JClassicBluetoothManage_4 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$4
//  JClassicBluetoothManage_5 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$5
//  JClassicBluetoothManage_6 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$6
//  JClassicBluetoothManage_7 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$7
//  JClassicBluetoothManage_8 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$8
//  JClassicBluetoothManage_9_1 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$9$1
//  JClassicBluetoothManage_9 = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage$9
  JClassicBluetoothManage = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClassicBluetoothManage
  JClsUtils = interface; //com.hc.bluetoothlibrary.classicBluetooth.ClsUtils
//  JPairReceiver_1 = interface; //com.hc.bluetoothlibrary.classicBluetooth.PairReceiver$1
//  JPairReceiver_2 = interface; //com.hc.bluetoothlibrary.classicBluetooth.PairReceiver$2
  JPairReceiver_PairCallback = interface; //com.hc.bluetoothlibrary.classicBluetooth.PairReceiver$PairCallback
  JPairReceiver = interface; //com.hc.bluetoothlibrary.classicBluetooth.PairReceiver
//  JTaskThread_1_1 = interface; //com.hc.bluetoothlibrary.classicBluetooth.TaskThread$1$1
//  JTaskThread_1_2 = interface; //com.hc.bluetoothlibrary.classicBluetooth.TaskThread$1$2
//  JTaskThread_1 = interface; //com.hc.bluetoothlibrary.classicBluetooth.TaskThread$1
  JTaskThread_WorkCallBack = interface; //com.hc.bluetoothlibrary.classicBluetooth.TaskThread$WorkCallBack
  JTaskThread = interface; //com.hc.bluetoothlibrary.classicBluetooth.TaskThread
  JDeviceModule = interface; //com.hc.bluetoothlibrary.DeviceModule
  JIBluetooth = interface; //com.hc.bluetoothlibrary.IBluetooth
  JDataMemory = interface; //com.hc.bluetoothlibrary.tootl.DataMemory
  JIDataCallback = interface; //com.hc.bluetoothlibrary.tootl.IDataCallback
  JIScanCallback = interface; //com.hc.bluetoothlibrary.tootl.IScanCallback
  JModuleParameters = interface; //com.hc.bluetoothlibrary.tootl.ModuleParameters
  JToolClass = interface; //com.hc.bluetoothlibrary.tootl.ToolClass

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

//  JAllBluetoothManage_1Class = interface(JObjectClass)
//  ['{DA9D723F-DED1-4156-A7F8-85AA499F9396}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage$1')]
//  JAllBluetoothManage_1 = interface(JObject)
//  ['{D086CE83-140C-4782-9583-DD409B537A3F}']
//    { Property Methods }
//
//    { methods }
//    procedure stopScan; cdecl; //()V
//    procedure updateRecycler(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
//
//    { Property }
//  end;

//  TJAllBluetoothManage_1 = class(TJavaGenericImport<JAllBluetoothManage_1Class, JAllBluetoothManage_1>) end;

//  JAllBluetoothManage_2Class = interface(JObjectClass)
//  ['{A1DFBF35-426A-445B-B218-63EDC5E63003}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage$2')]
//  JAllBluetoothManage_2 = interface(JObject)
//  ['{0551EE5F-4988-43C0-BA25-0469DF57CEE0}']
//    { Property Methods }
//
//    { methods }
//    procedure stopScan; cdecl; //()V
//    procedure updateRecycler(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
//
//    { Property }
//  end;

//  TJAllBluetoothManage_2 = class(TJavaGenericImport<JAllBluetoothManage_2Class, JAllBluetoothManage_2>) end;

//  JAllBluetoothManage_3Class = interface(JObjectClass)
//  ['{DE319C98-860E-4FD8-8B54-A50265437911}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage$3')]
//  JAllBluetoothManage_3 = interface(JObject)
//  ['{19E56612-823A-4818-90F8-3B06A3DF9014}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJAllBluetoothManage_3 = class(TJavaGenericImport<JAllBluetoothManage_3Class, JAllBluetoothManage_3>) end;

//  JAllBluetoothManage_4Class = interface(JObjectClass)
//  ['{890D642C-0D1E-48E6-A3B0-19042C3A38D5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage$4')]
//  JAllBluetoothManage_4 = interface(JObject)
//  ['{E2D2BDF2-B61B-4D40-BB7A-FEA6D347CD0D}']
//    { Property Methods }
//
//    { methods }
//    procedure stopScan; cdecl; //()V
//    procedure updateRecycler(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
//
//    { Property }
//  end;

//  TJAllBluetoothManage_4 = class(TJavaGenericImport<JAllBluetoothManage_4Class, JAllBluetoothManage_4>) end;

//  JAllBluetoothManage_5_1Class = interface(JObjectClass)
//  ['{D836306F-6B06-4AA4-A0F1-135B16EE0D33}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage$5$1')]
//  JAllBluetoothManage_5_1 = interface(JObject)
//  ['{99EB8D66-DAF3-4CFF-89FD-F73AC7D1DC52}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJAllBluetoothManage_5_1 = class(TJavaGenericImport<JAllBluetoothManage_5_1Class, JAllBluetoothManage_5_1>) end;

//  JAllBluetoothManage_5_2Class = interface(JObjectClass)
//  ['{58DAC15C-7838-4BE1-9892-B85B1CFBF06E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage$5$2')]
//  JAllBluetoothManage_5_2 = interface(JObject)
//  ['{757A617B-CA29-4019-AC81-7FD5EF9FC184}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJAllBluetoothManage_5_2 = class(TJavaGenericImport<JAllBluetoothManage_5_2Class, JAllBluetoothManage_5_2>) end;

//  JAllBluetoothManage_5Class = interface(JObjectClass)
//  ['{3CEBBDCA-DA3D-4730-ABEB-DB0EB8800079}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage$5')]
//  JAllBluetoothManage_5 = interface(JObject)
//  ['{773D7812-F1A2-4E2E-9795-7E2B75CFE375}']
//    { Property Methods }
//
//    { methods }
//    procedure readData(data: TJavaArray<Byte>; mac: JString); cdecl; //([BLjava/lang/String;)V
//    procedure connectionFail(mac: JString; cause: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
//    procedure connectionSucceed(mac: JString); cdecl; //(Ljava/lang/String;)V
//    procedure reading(isStart: Boolean); cdecl; //(Z)V
//    procedure errorDisconnect(mac: JString); cdecl; //(Ljava/lang/String;)V
//    procedure readNumber(number: Integer); cdecl; //(I)V
//    procedure readLog(className: JString; data: JString; lv: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
//    procedure readVelocity(velocity: Integer); cdecl; //(I)V
//
//    { Property }
//  end;

//  TJAllBluetoothManage_5 = class(TJavaGenericImport<JAllBluetoothManage_5Class, JAllBluetoothManage_5>) end;

  JAllBluetoothManage_StateClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{76C5127F-EF9E-4305-B2F1-8FFF17AA751A}']
    { static Property Methods }
    {class} function _Getrefresh: JAllBluetoothManage_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/hc/bluetoothlibrary/AllBluetoothManage$State;
    {class} function _Getleisure: JAllBluetoothManage_State;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/hc/bluetoothlibrary/AllBluetoothManage$State;

    { static Methods }
    {class} function values: TJavaObjectArray<JAllBluetoothManage_State>; cdecl; //()[Lcom/hc/bluetoothlibrary/AllBluetoothManage$State;
    {class} function valueOf(name: JString): JAllBluetoothManage_State; cdecl; //(Ljava/lang/String;)Lcom/hc/bluetoothlibrary/AllBluetoothManage$State;

    { static Property }
    {class} property refresh: JAllBluetoothManage_State read _Getrefresh;
    {class} property leisure: JAllBluetoothManage_State read _Getleisure;
  end;

  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage$State')]
  JAllBluetoothManage_State = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{9F3CC336-7586-4AAB-BAAB-CEC2D59A6B86}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAllBluetoothManage_State = class(TJavaGenericImport<JAllBluetoothManage_StateClass, JAllBluetoothManage_State>) end;

  JAllBluetoothManageClass = interface(JObjectClass)
  ['{FB1047A7-36A1-4887-A8FA-FAA1EF8C2529}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; iBluetooth: JIBluetooth): JAllBluetoothManage; cdecl; //(Landroid/content/Context;Lcom/hc/bluetoothlibrary/IBluetooth;)V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/AllBluetoothManage')]
  JAllBluetoothManage = interface(JObject)
  ['{AFF35822-C7CA-49FD-B2AB-2697E3BD9534}']
    { Property Methods }

    { methods }
    function mixScan: Boolean; cdecl; //()Z
    function bleScan: Boolean; cdecl; //()Z
    procedure stopScan; cdecl; //()V
    procedure connect(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure disconnect(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure sendData(deviceModule: JDeviceModule; data: TJavaArray<Byte>); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;[B)V
    function isStartBluetooth: Boolean; cdecl; //()Z

    { Property }
  end;

  TJAllBluetoothManage = class(TJavaGenericImport<JAllBluetoothManageClass, JAllBluetoothManage>) end;

//  JBleBluetoothManage_1Class = interface(JObjectClass)
//  ['{6FFC8DAC-BE11-4CA7-A5AC-C06B4343816A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$1')]
//  JBleBluetoothManage_1 = interface(JObject)
//  ['{290BE7F7-BFFA-4BD5-95C2-C127FA5403A4}']
//    { Property Methods }
//
//    { methods }
//    function handleMessage(msg: JMessage): Boolean; cdecl; //(Landroid/os/Message;)Z
//
//    { Property }
//  end;

//  TJBleBluetoothManage_1 = class(TJavaGenericImport<JBleBluetoothManage_1Class, JBleBluetoothManage_1>) end;

//  JBleBluetoothManage_10_1Class = interface(JObjectClass)
//  ['{A87AE12E-B20D-4342-86DC-B743B53E45C3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$10$1')]
//  JBleBluetoothManage_10_1 = interface(JObject)
//  ['{FD583DAF-28F0-459F-BC9C-DD56728B6099}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_10_1 = class(TJavaGenericImport<JBleBluetoothManage_10_1Class, JBleBluetoothManage_10_1>) end;

//  JBleBluetoothManage_10Class = interface(JScanCallbackClass) // or JObjectClass // SuperSignature: android/bluetooth/le/ScanCallback
//  ['{8A72CA68-D5A1-436E-AAEF-6C9BFCC18D05}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$10')]
//  JBleBluetoothManage_10 = interface(JScanCallback) // or JObject // SuperSignature: android/bluetooth/le/ScanCallback
//  ['{05C55542-242C-4A28-BE1C-3BE06620B481}']
//    { Property Methods }
//
//    { methods }
//    procedure onScanResult(callbackType: Integer; result: JScanResult); cdecl; //(ILandroid/bluetooth/le/ScanResult;)V
//    procedure onScanFailed(errorCode: Integer); cdecl; //(I)V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_10 = class(TJavaGenericImport<JBleBluetoothManage_10Class, JBleBluetoothManage_10>) end;

//  JBleBluetoothManage_2Class = interface(JObjectClass)
//  ['{4D681233-5C36-4289-B4C8-160009BD2CBF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$2')]
//  JBleBluetoothManage_2 = interface(JObject)
//  ['{86CFD6D6-B8FC-4A65-B019-9F0B05B8E92B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_2 = class(TJavaGenericImport<JBleBluetoothManage_2Class, JBleBluetoothManage_2>) end;

//  JBleBluetoothManage_3Class = interface(JObjectClass)
//  ['{3A9EE395-C21B-49CF-A05E-274DA12786E4}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$3')]
//  JBleBluetoothManage_3 = interface(JObject)
//  ['{BAD04962-D426-46FA-A9B2-96385A9974EA}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_3 = class(TJavaGenericImport<JBleBluetoothManage_3Class, JBleBluetoothManage_3>) end;

//  JBleBluetoothManage_4Class = interface(JObjectClass)
//  ['{328D0537-E8BD-4B50-BDC6-4472379C1B2C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$4')]
//  JBleBluetoothManage_4 = interface(JObject)
//  ['{368A3B0E-FD5E-4E8C-96A8-CE9BB4F6EB7B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_4 = class(TJavaGenericImport<JBleBluetoothManage_4Class, JBleBluetoothManage_4>) end;

//  JBleBluetoothManage_5Class = interface(JObjectClass)
//  ['{1A33780F-3301-4A8B-ABCF-7D47CD1239E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$5')]
//  JBleBluetoothManage_5 = interface(JObject)
//  ['{82778F0D-D819-494D-9D47-75BCE2E79791}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_5 = class(TJavaGenericImport<JBleBluetoothManage_5Class, JBleBluetoothManage_5>) end;

//  JBleBluetoothManage_6Class = interface(JObjectClass)
//  ['{6E4A786F-46DE-45EE-A179-3AB8A3AD9F4F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$6')]
//  JBleBluetoothManage_6 = interface(JObject)
//  ['{048D5439-3CF4-4615-952C-CE7CB1BCE349}']
//    { Property Methods }
//
//    { methods }
//    procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl; //(Landroid/content/ComponentName;Landroid/os/IBinder;)V
//    procedure onServiceDisconnected(name: JComponentName); cdecl; //(Landroid/content/ComponentName;)V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_6 = class(TJavaGenericImport<JBleBluetoothManage_6Class, JBleBluetoothManage_6>) end;

//  JBleBluetoothManage_7Class = interface(JObjectClass)
//  ['{81B3F79C-1131-49EF-96D9-C10DDB00BE38}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$7')]
//  JBleBluetoothManage_7 = interface(JObject)
//  ['{A3823550-3804-4D0C-9834-783712148C32}']
//    { Property Methods }
//
//    { methods }
//    function handleMessage(msg: JMessage): Boolean; cdecl; //(Landroid/os/Message;)Z
//
//    { Property }
//  end;

//  TJBleBluetoothManage_7 = class(TJavaGenericImport<JBleBluetoothManage_7Class, JBleBluetoothManage_7>) end;

//  JBleBluetoothManage_8_1Class = interface(JObjectClass)
//  ['{B7F77EA9-32A1-43C0-A967-BEB1362A8633}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$8$1')]
//  JBleBluetoothManage_8_1 = interface(JObject)
//  ['{C8B72917-43C0-4A37-BC8D-FFA4D4098639}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_8_1 = class(TJavaGenericImport<JBleBluetoothManage_8_1Class, JBleBluetoothManage_8_1>) end;

//  JBleBluetoothManage_8Class = interface(JObjectClass)
//  ['{16B7F57A-0D77-434A-BB69-C0F70290842E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$8')]
//  JBleBluetoothManage_8 = interface(JObject)
//  ['{5ABC01D2-542F-42C0-A251-33284ED04799}']
//    { Property Methods }
//
//    { methods }
//    procedure onLeScan(device: JBluetoothDevice; rssi: Integer; scanRecord: TJavaArray<Byte>); cdecl; //(Landroid/bluetooth/BluetoothDevice;I[B)V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_8 = class(TJavaGenericImport<JBleBluetoothManage_8Class, JBleBluetoothManage_8>) end;

//  JBleBluetoothManage_9_1Class = interface(JObjectClass)
//  ['{11ACFAD3-7E74-4481-84AA-2521686728DF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$9$1')]
//  JBleBluetoothManage_9_1 = interface(JObject)
//  ['{F30D2F5F-6C3A-4909-A018-AE5FD72A555C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_9_1 = class(TJavaGenericImport<JBleBluetoothManage_9_1Class, JBleBluetoothManage_9_1>) end;

//  JBleBluetoothManage_9_2Class = interface(JObjectClass)
//  ['{38452F81-BE97-47C0-8244-64E6654D4B14}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$9$2')]
//  JBleBluetoothManage_9_2 = interface(JObject)
//  ['{EF7176CB-3806-4356-915F-32733413007A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_9_2 = class(TJavaGenericImport<JBleBluetoothManage_9_2Class, JBleBluetoothManage_9_2>) end;

//  JBleBluetoothManage_9Class = interface(JScanCallbackClass) // or JObjectClass // SuperSignature: android/bluetooth/le/ScanCallback
//  ['{8B390B0E-CD09-4348-9CA7-D6A3BD9F5AE0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage$9')]
//  JBleBluetoothManage_9 = interface(JScanCallback) // or JObject // SuperSignature: android/bluetooth/le/ScanCallback
//  ['{410F2E65-C9DC-4E0F-BAE9-CA316CB32405}']
//    { Property Methods }
//
//    { methods }
//    procedure onScanResult(callbackType: Integer; result: JScanResult); cdecl; //(ILandroid/bluetooth/le/ScanResult;)V
//    procedure onScanFailed(errorCode: Integer); cdecl; //(I)V
//
//    { Property }
//  end;

//  TJBleBluetoothManage_9 = class(TJavaGenericImport<JBleBluetoothManage_9Class, JBleBluetoothManage_9>) end;

  JBleBluetoothManageClass = interface(JObjectClass)
  ['{C27446C1-3F51-48EE-932B-70643F760A28}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JBleBluetoothManage; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BleBluetoothManage')]
  JBleBluetoothManage = interface(JObject)
  ['{E6740648-2214-4833-BC87-74CD48EDA4F4}']
    { Property Methods }

    { methods }
    procedure scanBluetooth(iScanCallback: JIScanCallback); cdecl; overload; //(Lcom/hc/bluetoothlibrary/tootl/IScanCallback;)V
    procedure stopScan; cdecl; //()V
    procedure scanBluetooth(list: JList; P2: Boolean; iScanCallback: JIScanCallback); cdecl; overload; //(Ljava/util/List;ZLcom/hc/bluetoothlibrary/tootl/IScanCallback;)V
    procedure connectBluetooth(module: JDeviceModule; iDataCallback: JIDataCallback); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;Lcom/hc/bluetoothlibrary/tootl/IDataCallback;)V
    procedure disConnectBluetooth; cdecl; //()V
    function getMac: JString; cdecl; //()Ljava/lang/String;
    procedure sendData(data: TJavaArray<Byte>); cdecl; //([B)V

    { Property }
  end;

  TJBleBluetoothManage = class(TJavaGenericImport<JBleBluetoothManageClass, JBleBluetoothManage>) end;

//  JBluetoothLeService_1_1Class = interface(JObjectClass)
//  ['{1DA7864D-FF57-46BC-86C1-81C2F8FC809F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService$1$1')]
//  JBluetoothLeService_1_1 = interface(JObject)
//  ['{E94F9DEB-7833-4BBA-947A-2C26057CF914}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothLeService_1_1 = class(TJavaGenericImport<JBluetoothLeService_1_1Class, JBluetoothLeService_1_1>) end;

//  JBluetoothLeService_1_2Class = interface(JObjectClass)
//  ['{1894D462-2FBC-42CC-8E57-CB6F443B7C58}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService$1$2')]
//  JBluetoothLeService_1_2 = interface(JObject)
//  ['{EBDF1802-69B1-4C80-8663-9267B1F502F3}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothLeService_1_2 = class(TJavaGenericImport<JBluetoothLeService_1_2Class, JBluetoothLeService_1_2>) end;

//  JBluetoothLeService_1_3Class = interface(JObjectClass)
//  ['{7E52F257-1494-4923-9B4A-1B64FCD724BF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService$1$3')]
//  JBluetoothLeService_1_3 = interface(JObject)
//  ['{AFD30234-AB0D-4F92-9666-36DED9E1A155}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothLeService_1_3 = class(TJavaGenericImport<JBluetoothLeService_1_3Class, JBluetoothLeService_1_3>) end;

//  JBluetoothLeService_1Class = interface(JBluetoothGattCallbackClass) // or JObjectClass // SuperSignature: android/bluetooth/BluetoothGattCallback
//  ['{9CA7C120-ACA8-4BEA-9E0B-D1F922608E01}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService$1')]
//  JBluetoothLeService_1 = interface(JBluetoothGattCallback) // or JObject // SuperSignature: android/bluetooth/BluetoothGattCallback
//  ['{641E892F-D25A-4981-9AE1-ABD09FBB56D5}']
//    { Property Methods }
//
//    { methods }
//    procedure onConnectionStateChange(gatt: JBluetoothGatt; status: Integer; newState: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;II)V
//    procedure onCharacteristicWrite(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
//    procedure onDescriptorWrite(gatt: JBluetoothGatt; descriptor: JBluetoothGattDescriptor; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
//    procedure onServicesDiscovered(gatt: JBluetoothGatt; status: Integer); cdecl; //(Landroid/bluetooth/BluetoothGatt;I)V
//    procedure onCharacteristicChanged(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
//
//    { Property }
//  end;

//  TJBluetoothLeService_1 = class(TJavaGenericImport<JBluetoothLeService_1Class, JBluetoothLeService_1>) end;

//  JBluetoothLeService_2Class = interface(JObjectClass)
//  ['{75E822D7-EF8A-477A-A8B4-1F7BCFCD1842}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService$2')]
//  JBluetoothLeService_2 = interface(JObject)
//  ['{96FCF248-0A45-4B9E-8D3A-5573BBAE8E2F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothLeService_2 = class(TJavaGenericImport<JBluetoothLeService_2Class, JBluetoothLeService_2>) end;

//  JBluetoothLeService_3Class = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{4AF9301C-A919-4EC2-AC85-CFB71CDFAA85}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService$3')]
//  JBluetoothLeService_3 = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{4ABA31A5-3F2A-49DC-B84A-D7D528B682C0}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothLeService_3 = class(TJavaGenericImport<JBluetoothLeService_3Class, JBluetoothLeService_3>) end;

//  JBluetoothLeService_4Class = interface(JObjectClass)
//  ['{8636DF9F-AF35-4284-A210-299A98773985}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService$4')]
//  JBluetoothLeService_4 = interface(JObject)
//  ['{BDD6AEAA-EB8B-49F8-805C-D7DA65C787B5}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJBluetoothLeService_4 = class(TJavaGenericImport<JBluetoothLeService_4Class, JBluetoothLeService_4>) end;

  JBluetoothLeService_DownloadBinderClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{32A3F2C8-1762-418C-A2BC-6C68B769A22D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService$DownloadBinder')]
  JBluetoothLeService_DownloadBinder = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{876099F0-056F-4F4F-BC79-AA893EF5C8C6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBluetoothLeService_DownloadBinder = class(TJavaGenericImport<JBluetoothLeService_DownloadBinderClass, JBluetoothLeService_DownloadBinder>) end;

  JBluetoothLeServiceClass = interface(JServiceClass) // or JObjectClass // SuperSignature: android/app/Service
  ['{5B32F00D-C162-46FD-A3A5-D36B2ED7CA7A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBluetoothLeService; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/BluetoothLeService')]
  JBluetoothLeService = interface(JService) // or JObject // SuperSignature: android/app/Service
  ['{0E160B29-B2C9-4B52-9007-F606B04E6059}']
    { Property Methods }

    { methods }
    function onBind(intent: JIntent): JIBinder; cdecl; //(Landroid/content/Intent;)Landroid/os/IBinder;
    procedure onCreate; cdecl; //()V
    procedure onDestroy; cdecl; //()V
    procedure setNotification(gatt: JBluetoothGatt; characteristic: JBluetoothGattCharacteristic; enable: Boolean); cdecl; //(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;Z)V
    procedure log(str: JString); cdecl; overload; //(Ljava/lang/String;)V
    procedure log(str: JString; e: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V

    { Property }
  end;

  TJBluetoothLeService = class(TJavaGenericImport<JBluetoothLeServiceClass, JBluetoothLeService>) end;

  JParseLeAdvDataClass = interface(JObjectClass)
  ['{A542CFE2-8A0E-4D4F-ADB8-3B572443BE15}']
    { static Property Methods }
    {class} function _GetBLE_GAP_AD_TYPE_FLAGS: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_MORE_AVAILABLE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_COMPLETE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_32BIT_SERVICE_UUID_MORE_AVAILABLE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_32BIT_SERVICE_UUID_COMPLETE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_128BIT_SERVICE_UUID_MORE_AVAILABLE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_128BIT_SERVICE_UUID_COMPLETE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SHORT_LOCAL_NAME: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_COMPLETE_LOCAL_NAME: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_TX_POWER_LEVEL: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_CLASS_OF_DEVICE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SIMPLE_PAIRING_HASH_C: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SIMPLE_PAIRING_RANDOMIZER_R: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SECURITY_MANAGER_TK_VALUE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SECURITY_MANAGER_OOB_FLAGS: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SLAVE_CONNECTION_INTERVAL_RANGE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SOLICITED_SERVICE_UUIDS_16BIT: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SOLICITED_SERVICE_UUIDS_128BIT: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_SERVICE_DATA: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_PUBLIC_TARGET_ADDRESS: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_RANDOM_TARGET_ADDRESS: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_APPEARANCE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetBLE_GAP_AD_TYPE_MANUFACTURER_SPECIFIC_DATA: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S

    { static Methods }
    {class} function init: JParseLeAdvData; cdecl; //()V
    {class} function adv_report_parse(atype: Word; adv_data: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; //(S[B)[B
    {class} function getLocalName(adv_data: TJavaArray<Byte>): JString; cdecl; //([B)Ljava/lang/String;
    {class} function get16BitServiceUuids(adv_data: TJavaArray<Byte>): JList; cdecl; //([B)Ljava/util/List;
    {class} function getShort16(adv_data: TJavaArray<Byte>): JString; cdecl; //([B)Ljava/lang/String;
    {class} function decodeUuid128(adv_data: TJavaArray<Byte>; i: Integer): JUUID; cdecl; //([BI)Ljava/util/UUID;
    {class} function decodeUuid32(adv_data: TJavaArray<Byte>; i: Integer): Integer; cdecl; //([BI)I

    { static Property }
    {class} property BLE_GAP_AD_TYPE_FLAGS: Word read _GetBLE_GAP_AD_TYPE_FLAGS;
    {class} property BLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_MORE_AVAILABLE: Word read _GetBLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_MORE_AVAILABLE;
    {class} property BLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_COMPLETE: Word read _GetBLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_COMPLETE;
    {class} property BLE_GAP_AD_TYPE_32BIT_SERVICE_UUID_MORE_AVAILABLE: Word read _GetBLE_GAP_AD_TYPE_32BIT_SERVICE_UUID_MORE_AVAILABLE;
    {class} property BLE_GAP_AD_TYPE_32BIT_SERVICE_UUID_COMPLETE: Word read _GetBLE_GAP_AD_TYPE_32BIT_SERVICE_UUID_COMPLETE;
    {class} property BLE_GAP_AD_TYPE_128BIT_SERVICE_UUID_MORE_AVAILABLE: Word read _GetBLE_GAP_AD_TYPE_128BIT_SERVICE_UUID_MORE_AVAILABLE;
    {class} property BLE_GAP_AD_TYPE_128BIT_SERVICE_UUID_COMPLETE: Word read _GetBLE_GAP_AD_TYPE_128BIT_SERVICE_UUID_COMPLETE;
    {class} property BLE_GAP_AD_TYPE_SHORT_LOCAL_NAME: Word read _GetBLE_GAP_AD_TYPE_SHORT_LOCAL_NAME;
    {class} property BLE_GAP_AD_TYPE_COMPLETE_LOCAL_NAME: Word read _GetBLE_GAP_AD_TYPE_COMPLETE_LOCAL_NAME;
    {class} property BLE_GAP_AD_TYPE_TX_POWER_LEVEL: Word read _GetBLE_GAP_AD_TYPE_TX_POWER_LEVEL;
    {class} property BLE_GAP_AD_TYPE_CLASS_OF_DEVICE: Word read _GetBLE_GAP_AD_TYPE_CLASS_OF_DEVICE;
    {class} property BLE_GAP_AD_TYPE_SIMPLE_PAIRING_HASH_C: Word read _GetBLE_GAP_AD_TYPE_SIMPLE_PAIRING_HASH_C;
    {class} property BLE_GAP_AD_TYPE_SIMPLE_PAIRING_RANDOMIZER_R: Word read _GetBLE_GAP_AD_TYPE_SIMPLE_PAIRING_RANDOMIZER_R;
    {class} property BLE_GAP_AD_TYPE_SECURITY_MANAGER_TK_VALUE: Word read _GetBLE_GAP_AD_TYPE_SECURITY_MANAGER_TK_VALUE;
    {class} property BLE_GAP_AD_TYPE_SECURITY_MANAGER_OOB_FLAGS: Word read _GetBLE_GAP_AD_TYPE_SECURITY_MANAGER_OOB_FLAGS;
    {class} property BLE_GAP_AD_TYPE_SLAVE_CONNECTION_INTERVAL_RANGE: Word read _GetBLE_GAP_AD_TYPE_SLAVE_CONNECTION_INTERVAL_RANGE;
    {class} property BLE_GAP_AD_TYPE_SOLICITED_SERVICE_UUIDS_16BIT: Word read _GetBLE_GAP_AD_TYPE_SOLICITED_SERVICE_UUIDS_16BIT;
    {class} property BLE_GAP_AD_TYPE_SOLICITED_SERVICE_UUIDS_128BIT: Word read _GetBLE_GAP_AD_TYPE_SOLICITED_SERVICE_UUIDS_128BIT;
    {class} property BLE_GAP_AD_TYPE_SERVICE_DATA: Word read _GetBLE_GAP_AD_TYPE_SERVICE_DATA;
    {class} property BLE_GAP_AD_TYPE_PUBLIC_TARGET_ADDRESS: Word read _GetBLE_GAP_AD_TYPE_PUBLIC_TARGET_ADDRESS;
    {class} property BLE_GAP_AD_TYPE_RANDOM_TARGET_ADDRESS: Word read _GetBLE_GAP_AD_TYPE_RANDOM_TARGET_ADDRESS;
    {class} property BLE_GAP_AD_TYPE_APPEARANCE: Word read _GetBLE_GAP_AD_TYPE_APPEARANCE;
    {class} property BLE_GAP_AD_TYPE_MANUFACTURER_SPECIFIC_DATA: Word read _GetBLE_GAP_AD_TYPE_MANUFACTURER_SPECIFIC_DATA;
  end;

  [JavaSignature('com/hc/bluetoothlibrary/bleBluetooth/ParseLeAdvData')]
  JParseLeAdvData = interface(JObject)
  ['{3D802EF1-C3BF-410E-9D2F-BC903AD1FC93}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJParseLeAdvData = class(TJavaGenericImport<JParseLeAdvDataClass, JParseLeAdvData>) end;

  JBuildConfigClass = interface(JObjectClass)
  ['{D78B8416-0B68-44BB-9AB7-0BBB983516E2}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JBuildConfig; cdecl; //()V

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
  end;

  [JavaSignature('com/hc/bluetoothlibrary/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{D5B2B10C-3989-4641-AF9A-A1B7D1961BC4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

//  JClassicBluetoothManage_1Class = interface(JObjectClass)
//  ['{191BD9AA-1DA7-4376-B983-390010BB2E81}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$1')]
//  JClassicBluetoothManage_1 = interface(JObject)
//  ['{18395B05-3903-42B4-AAB9-8452BCAB6E43}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_1 = class(TJavaGenericImport<JClassicBluetoothManage_1Class, JClassicBluetoothManage_1>) end;

//  JClassicBluetoothManage_10Class = interface(JObjectClass)
//  ['{2731B2D0-050F-499E-9929-D9705924089D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$10')]
//  JClassicBluetoothManage_10 = interface(JObject)
//  ['{0230966C-C234-4E6C-8B8B-3A2B7939BED0}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_10 = class(TJavaGenericImport<JClassicBluetoothManage_10Class, JClassicBluetoothManage_10>) end;

//  JClassicBluetoothManage_11Class = interface(JObjectClass)
//  ['{7951447C-C7C7-436A-94DC-9B5C7DF2E10D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$11')]
//  JClassicBluetoothManage_11 = interface(JObject)
//  ['{4D43855E-7A12-4ED5-87E7-CD652E4E976F}']
//    { Property Methods }
//
//    { methods }
//    procedure onClick(dialog: JDialogInterface; which: Integer); cdecl; //(Landroid/content/DialogInterface;I)V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_11 = class(TJavaGenericImport<JClassicBluetoothManage_11Class, JClassicBluetoothManage_11>) end;

//  JClassicBluetoothManage_2Class = interface(JBroadcastReceiverClass) // or JObjectClass // SuperSignature: android/content/BroadcastReceiver
//  ['{94F14781-FC3B-42B1-A75C-5CB91A66714B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$2')]
//  JClassicBluetoothManage_2 = interface(JBroadcastReceiver) // or JObject // SuperSignature: android/content/BroadcastReceiver
//  ['{636CD467-9BCD-4C2F-9833-B133ACCDCB3C}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(context: JContext; intent: JIntent); cdecl; //(Landroid/content/Context;Landroid/content/Intent;)V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_2 = class(TJavaGenericImport<JClassicBluetoothManage_2Class, JClassicBluetoothManage_2>) end;

//  JClassicBluetoothManage_3Class = interface(JBroadcastReceiverClass) // or JObjectClass // SuperSignature: android/content/BroadcastReceiver
//  ['{6F6DD0AD-0FEA-426B-BC49-0E6EEAC49E11}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$3')]
//  JClassicBluetoothManage_3 = interface(JBroadcastReceiver) // or JObject // SuperSignature: android/content/BroadcastReceiver
//  ['{E385C116-3221-4A67-B956-4E087CE6A084}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(context: JContext; intent: JIntent); cdecl; //(Landroid/content/Context;Landroid/content/Intent;)V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_3 = class(TJavaGenericImport<JClassicBluetoothManage_3Class, JClassicBluetoothManage_3>) end;

//  JClassicBluetoothManage_4Class = interface(JBroadcastReceiverClass) // or JObjectClass // SuperSignature: android/content/BroadcastReceiver
//  ['{08EBD176-4304-4415-8C64-86AE9DF7ADF0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$4')]
//  JClassicBluetoothManage_4 = interface(JBroadcastReceiver) // or JObject // SuperSignature: android/content/BroadcastReceiver
//  ['{7A0B9DD7-6B3C-450A-8C97-8EA58C9ADF42}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(context: JContext; intent: JIntent); cdecl; //(Landroid/content/Context;Landroid/content/Intent;)V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_4 = class(TJavaGenericImport<JClassicBluetoothManage_4Class, JClassicBluetoothManage_4>) end;

//  JClassicBluetoothManage_5Class = interface(JObjectClass)
//  ['{4F7DD6E9-E319-406C-A0B3-459800358AAF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$5')]
//  JClassicBluetoothManage_5 = interface(JObject)
//  ['{B8EE632A-5996-43DF-9EB2-2B2BF63DDBAE}']
//    { Property Methods }
//
//    { methods }
//    procedure connect; cdecl; //()V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_5 = class(TJavaGenericImport<JClassicBluetoothManage_5Class, JClassicBluetoothManage_5>) end;

//  JClassicBluetoothManage_6Class = interface(JObjectClass)
//  ['{B089A544-E00A-4AF3-82C0-C4FC87A74ABB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$6')]
//  JClassicBluetoothManage_6 = interface(JObject)
//  ['{04313A42-CDDD-4C30-BB87-9BF0C5FD6FC5}']
//    { Property Methods }
//
//    { methods }
//    procedure succeed; cdecl; //()V
//    function work: Boolean; cdecl; //()Z
//    procedure error(e: JException); cdecl; //(Ljava/lang/Exception;)V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_6 = class(TJavaGenericImport<JClassicBluetoothManage_6Class, JClassicBluetoothManage_6>) end;

//  JClassicBluetoothManage_7Class = interface(JObjectClass)
//  ['{FBE78D72-5057-4394-ADDC-C020CB6DA9A6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$7')]
//  JClassicBluetoothManage_7 = interface(JObject)
//  ['{DB992B15-38D3-4AC1-AF03-EBD323F1C159}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_7 = class(TJavaGenericImport<JClassicBluetoothManage_7Class, JClassicBluetoothManage_7>) end;

//  JClassicBluetoothManage_8Class = interface(JObjectClass)
//  ['{9A09E8E4-6D91-4DE0-9D79-F01D8E983D6D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$8')]
//  JClassicBluetoothManage_8 = interface(JObject)
//  ['{576712A5-A151-4C46-9494-4328AAB20AB2}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_8 = class(TJavaGenericImport<JClassicBluetoothManage_8Class, JClassicBluetoothManage_8>) end;

//  JClassicBluetoothManage_9_1Class = interface(JObjectClass)
//  ['{1826D513-216B-47D0-B777-3AA412B142AF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$9$1')]
//  JClassicBluetoothManage_9_1 = interface(JObject)
//  ['{5729FEFF-24C6-484B-B639-7D93FF7BA380}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_9_1 = class(TJavaGenericImport<JClassicBluetoothManage_9_1Class, JClassicBluetoothManage_9_1>) end;

//  JClassicBluetoothManage_9Class = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{DCE2543F-CDC4-426A-94B0-5628E9646C0F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage$9')]
//  JClassicBluetoothManage_9 = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{399D70EF-EAB9-4776-9264-1CB7DA8C10AD}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJClassicBluetoothManage_9 = class(TJavaGenericImport<JClassicBluetoothManage_9Class, JClassicBluetoothManage_9>) end;

  JClassicBluetoothManageClass = interface(JObjectClass)
  ['{9B0D2A91-E9EA-4825-B42A-2C0095F1BDB9}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JClassicBluetoothManage; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClassicBluetoothManage')]
  JClassicBluetoothManage = interface(JObject)
  ['{27D13847-533D-4E19-AC08-B262271A7716}']
    { Property Methods }

    { methods }
    procedure scanBluetooth(iScanCallback: JIScanCallback); cdecl; //(Lcom/hc/bluetoothlibrary/tootl/IScanCallback;)V
    procedure stopScan; cdecl; //()V
    procedure connectBluetooth(address: JString; iDataCallback: JIDataCallback); cdecl; //(Ljava/lang/String;Lcom/hc/bluetoothlibrary/tootl/IDataCallback;)V
    procedure sendData(data: TJavaArray<Byte>); cdecl; //([B)V
    procedure disconnectBluetooth; cdecl; //()V
    function getMac: JString; cdecl; //()Ljava/lang/String;
    function getDevicesArray: JList; cdecl; //()Ljava/util/List;
    function startBluetooth: Boolean; cdecl; //()Z

    { Property }
  end;

  TJClassicBluetoothManage = class(TJavaGenericImport<JClassicBluetoothManageClass, JClassicBluetoothManage>) end;

  JClsUtilsClass = interface(JObjectClass)
  ['{1B5492D1-8C56-4C77-B574-25A8375217CB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JClsUtils; cdecl; //()V
    {class} function createBond(btClass: Jlang_Class; btDevice: JBluetoothDevice): Boolean; cdecl; //(Ljava/lang/Class;Landroid/bluetooth/BluetoothDevice;)Z
    {class} function removeBond(btClass: Jlang_Class; btDevice: JBluetoothDevice): Boolean; cdecl; //(Ljava/lang/Class;Landroid/bluetooth/BluetoothDevice;)Z
    {class} function setPin(btClass: Jlang_Class; btDevice: JBluetoothDevice; str: JString): Boolean; cdecl; //(Ljava/lang/Class;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)Z
    {class} function cancelPairingUserInput(btClass: Jlang_Class; device: JBluetoothDevice): Boolean; cdecl; //(Ljava/lang/Class;Landroid/bluetooth/BluetoothDevice;)Z
    {class} function cancelBondProcess(btClass: Jlang_Class; device: JBluetoothDevice): Boolean; cdecl; //(Ljava/lang/Class;Landroid/bluetooth/BluetoothDevice;)Z
    {class} procedure setPairingConfirmation(btClass: Jlang_Class; device: JBluetoothDevice; isConfirm: Boolean); cdecl; //(Ljava/lang/Class;Landroid/bluetooth/BluetoothDevice;Z)V
    {class} procedure printAllInform(clsShow: Jlang_Class); cdecl; //(Ljava/lang/Class;)V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/ClsUtils')]
  JClsUtils = interface(JObject)
  ['{C4A30E5C-94C9-4DAC-874B-234EACCCAFCA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJClsUtils = class(TJavaGenericImport<JClsUtilsClass, JClsUtils>) end;

//  JPairReceiver_1Class = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{375436E7-3CD0-4899-A3D1-FF25B3B3C369}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/PairReceiver$1')]
//  JPairReceiver_1 = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{351D1528-89CF-4E59-9888-833D2758CA97}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJPairReceiver_1 = class(TJavaGenericImport<JPairReceiver_1Class, JPairReceiver_1>) end;

//  JPairReceiver_2Class = interface(JTimerTaskClass) // or JObjectClass // SuperSignature: java/util/TimerTask
//  ['{1961E220-DBC4-497E-8A55-E93E8CAB844C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/PairReceiver$2')]
//  JPairReceiver_2 = interface(JTimerTask) // or JObject // SuperSignature: java/util/TimerTask
//  ['{AC0DC2F4-73F7-4360-A932-2762BD5B82B6}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJPairReceiver_2 = class(TJavaGenericImport<JPairReceiver_2Class, JPairReceiver_2>) end;

  JPairReceiver_PairCallbackClass = interface(JObjectClass)
  ['{9BD8C461-E657-4622-86FC-FAB48EA3CD23}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/PairReceiver$PairCallback')]
  JPairReceiver_PairCallback = interface(IJavaInstance)
  ['{F4AB54F5-726A-49F0-8F68-2F218141F6D6}']
    { Property Methods }

    { methods }
    procedure connect; cdecl; //()V

    { Property }
  end;

  TJPairReceiver_PairCallback = class(TJavaGenericImport<JPairReceiver_PairCallbackClass, JPairReceiver_PairCallback>) end;

  JPairReceiverClass = interface(JBroadcastReceiverClass) // or JObjectClass // SuperSignature: android/content/BroadcastReceiver
  ['{625EB651-C949-4235-A1AE-FD8F02A10D91}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; callback: JPairReceiver_PairCallback): JPairReceiver; cdecl; //(Landroid/content/Context;Lcom/hc/bluetoothlibrary/classicBluetooth/PairReceiver$PairCallback;)V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/PairReceiver')]
  JPairReceiver = interface(JBroadcastReceiver) // or JObject // SuperSignature: android/content/BroadcastReceiver
  ['{910C7A51-1186-4A91-AB70-D0363DDD8333}']
    { Property Methods }

    { methods }
    procedure onReceive(context: JContext; intent: JIntent); cdecl; //(Landroid/content/Context;Landroid/content/Intent;)V

    { Property }
  end;

  TJPairReceiver = class(TJavaGenericImport<JPairReceiverClass, JPairReceiver>) end;

//  JTaskThread_1_1Class = interface(JObjectClass)
//  ['{93F0F944-F070-46E4-BFB5-7737B34EF8B2}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/TaskThread$1$1')]
//  JTaskThread_1_1 = interface(JObject)
//  ['{38F88362-FF38-4D04-B927-823F9952823C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJTaskThread_1_1 = class(TJavaGenericImport<JTaskThread_1_1Class, JTaskThread_1_1>) end;

//  JTaskThread_1_2Class = interface(JObjectClass)
//  ['{AA84FA89-05F9-4537-998B-BBA38CD4EE1A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/TaskThread$1$2')]
//  JTaskThread_1_2 = interface(JObject)
//  ['{84B659FD-2F1A-4466-BB4D-A6C69763654C}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJTaskThread_1_2 = class(TJavaGenericImport<JTaskThread_1_2Class, JTaskThread_1_2>) end;

//  JTaskThread_1Class = interface(JObjectClass)
//  ['{2BE1105B-B232-479F-8DBE-B64A284FEF12}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/TaskThread$1')]
//  JTaskThread_1 = interface(JObject)
//  ['{49796F38-3F49-4D9A-AD44-82BC53E6DE2D}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJTaskThread_1 = class(TJavaGenericImport<JTaskThread_1Class, JTaskThread_1>) end;

  JTaskThread_WorkCallBackClass = interface(JObjectClass)
  ['{3F4D0C84-97A7-4EF6-B012-A48E7355CC58}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/TaskThread$WorkCallBack')]
  JTaskThread_WorkCallBack = interface(IJavaInstance)
  ['{CC0D56A5-7DB0-49F1-9D3C-ADAE582B208C}']
    { Property Methods }

    { methods }
    procedure succeed; cdecl; //()V
    function work: Boolean; cdecl; //()Z
    procedure error(P1: JException); cdecl; //(Ljava/lang/Exception;)V

    { Property }
  end;

  TJTaskThread_WorkCallBack = class(TJavaGenericImport<JTaskThread_WorkCallBackClass, JTaskThread_WorkCallBack>) end;

  JTaskThreadClass = interface(JObjectClass)
  ['{888A48D3-E6EB-43E1-81A4-73D5CAF2FB7E}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JTaskThread; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/classicBluetooth/TaskThread')]
  JTaskThread = interface(JObject)
  ['{586C944F-D29E-44E7-B197-4D29673ACAC9}']
    { Property Methods }

    { methods }
    procedure setWorkCall(call: JTaskThread_WorkCallBack); cdecl; //(Lcom/hc/bluetoothlibrary/classicBluetooth/TaskThread$WorkCallBack;)V

    { Property }
  end;

  TJTaskThread = class(TJavaGenericImport<JTaskThreadClass, JTaskThread>) end;

  JDeviceModuleClass = interface(JObjectClass)
  ['{EEB21B33-FDC8-4A46-A6DE-98032C74890B}']
    { static Property Methods }

    { static Methods }
//    {class} function init(device: JBluetoothDevice; rssi: Integer; name: JString; context: JContext; result: JScanResult): JDeviceModule; cdecl; overload; //(Landroid/bluetooth/BluetoothDevice;ILjava/lang/String;Landroid/content/Context;Landroid/bluetooth/le/ScanResult;)V
    {class} function init(name: JString; device: JBluetoothDevice): JDeviceModule; cdecl; overload; //(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;)V
    {class} function init(name: JString; device: JBluetoothDevice; beenConnected: Boolean; context: JContext; rssi: Integer): JDeviceModule; cdecl; overload; //(Ljava/lang/String;Landroid/bluetooth/BluetoothDevice;ZLandroid/content/Context;I)V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/DeviceModule')]
  JDeviceModule = interface(JObject)
  ['{4957F3F0-1C3B-46B0-8C80-F86DB87C6CC3}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl; //()Ljava/lang/String;
    function getOriginalName(context: JContext): JString; cdecl; //(Landroid/content/Context;)Ljava/lang/String;
    function getDevice: JBluetoothDevice; cdecl; //()Landroid/bluetooth/BluetoothDevice;
    function getMac: JString; cdecl; //()Ljava/lang/String;
    procedure setMessyCode(context: JContext); cdecl; //(Landroid/content/Context;)V
    procedure setRssi(rssi: Integer); cdecl; //(I)V
    procedure setUUID(service: JString; readWrite: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
    procedure setCollectModule(context: JContext; name: JString); cdecl; //(Landroid/content/Context;Ljava/lang/String;)V
    procedure isCollectName(context: JContext); cdecl; //(Landroid/content/Context;)V
    function getRssi: Integer; cdecl; //()I
    function isBLE: Boolean; cdecl; //()Z
    function isBeenConnected: Boolean; cdecl; //()Z
    function bluetoothType: JString; cdecl; //()Ljava/lang/String;
    function isCollect: Boolean; cdecl; //()Z
    function isHcModule(isCheck: Boolean; dataFilter: JString): Boolean; cdecl; //(ZLjava/lang/String;)Z
    function getReadWriteUUID: JString; cdecl; //()Ljava/lang/String;
    function getServiceUUID: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDeviceModule = class(TJavaGenericImport<JDeviceModuleClass, JDeviceModule>) end;

  JIBluetoothClass = interface(JObjectClass)
  ['{89F1A95B-C785-4323-91D8-9E95FBC784D6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/IBluetooth')]
  JIBluetooth = interface(IJavaInstance)
  ['{38E1319A-6278-4C6E-B919-B807C1E7638C}']
    { Property Methods }

    { methods }
    procedure updateList(P1: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure connectSucceed(P1: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure updateEnd; cdecl; //()V
    procedure updateMessyCode(P1: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure readData(P1: JString; P2: TJavaArray<Byte>); cdecl; //(Ljava/lang/String;[B)V
    procedure reading(P1: Boolean); cdecl; //(Z)V
    procedure errorDisconnect(P1: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure readNumber(P1: Integer); cdecl; //(I)V
    procedure readLog(P1: JString; P2: JString; P3: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    procedure readVelocity(P1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJIBluetooth = class(TJavaGenericImport<JIBluetoothClass, JIBluetooth>) end;

  JDataMemoryClass = interface(JObjectClass)
  ['{77E5D873-28FC-4147-ACA0-A8B2D38D87D2}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JDataMemory; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/tootl/DataMemory')]
  JDataMemory = interface(JObject)
  ['{F41BA3A3-18CD-4F4F-8E89-A97D21E2181B}']
    { Property Methods }

    { methods }
    procedure saveData(mac: JString; name: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
    function getData(mac: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    procedure saveCollectData(mac: JString; name: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
    function getCollectData(mac: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    procedure saveParameters(data: JString); cdecl; //(Ljava/lang/String;)V
    procedure saveModuleLevel(value: Integer); cdecl; //(I)V
    function getModuleLevel: Integer; cdecl; //()I
    function getParameters: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDataMemory = class(TJavaGenericImport<JDataMemoryClass, JDataMemory>) end;

  JIDataCallbackClass = interface(JObjectClass)
  ['{0AAB21A9-208D-4736-86D7-C89B1CA02AC9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/tootl/IDataCallback')]
  JIDataCallback = interface(IJavaInstance)
  ['{F1FF261D-0C33-4649-B5DE-1C9E99DC94CA}']
    { Property Methods }

    { methods }
    procedure readData(P1: TJavaArray<Byte>; P2: JString); cdecl; //([BLjava/lang/String;)V
    procedure connectionFail(P1: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
    procedure connectionSucceed(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure reading(P1: Boolean); cdecl; //(Z)V
    procedure errorDisconnect(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure readNumber(P1: Integer); cdecl; //(I)V
    procedure readLog(P1: JString; P2: JString; P3: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    procedure readVelocity(P1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJIDataCallback = class(TJavaGenericImport<JIDataCallbackClass, JIDataCallback>) end;

  JIScanCallbackClass = interface(JObjectClass)
  ['{F1925105-A37E-4B87-B421-514BDA1BC514}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/tootl/IScanCallback')]
  JIScanCallback = interface(IJavaInstance)
  ['{220E50CD-52B8-44AF-B931-F8F7E253B9FA}']
    { Property Methods }

    { methods }
    procedure stopScan; cdecl; //()V
    procedure updateRecycler(P1: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V

    { Property }
  end;

  TJIScanCallback = class(TJavaGenericImport<JIScanCallbackClass, JIScanCallback>) end;

  JModuleParametersClass = interface(JObjectClass)
  ['{9498E04B-58D9-428D-B4E7-72BBBFFE0CB9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JModuleParameters; cdecl; overload; //()V
    {class} procedure setParameters(state: Integer; bleReadBuff: Integer; classicReadBuff: Integer; bleTime: Integer; context: JContext); cdecl; //(IIIILandroid/content/Context;)V
    {class} procedure saveLevel(moduleLevel: Integer; context: JContext); cdecl; //(ILandroid/content/Context;)V
    {class} procedure init(context: JContext); cdecl; overload; //(Landroid/content/Context;)V
    {class} function addLevel: Integer; cdecl; //()I
    {class} function minusLevel: Integer; cdecl; //()I
    {class} function getTime: Integer; cdecl; //()I
    {class} function getState: Integer; cdecl; //()I
    {class} function getBleReadBuff: Integer; cdecl; //()I
    {class} function getClassicReadBuff: Integer; cdecl; //()I
    {class} function getLevel: Integer; cdecl; //()I
    {class} function system: Boolean; cdecl; //()Z

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/tootl/ModuleParameters')]
  JModuleParameters = interface(JObject)
  ['{1FC7728D-5585-4F6B-92C4-93776CBA6FD6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJModuleParameters = class(TJavaGenericImport<JModuleParametersClass, JModuleParameters>) end;

  JToolClassClass = interface(JObjectClass)
  ['{8B324712-764E-430F-8BC7-FFEDD99F8EE0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JToolClass; cdecl; //()V
    {class} function pattern(str: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
    {class} function analysis(data: JString; number: Integer; key: JString): JString; cdecl; //(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    {class} function isOpenGPS(context: JContext): Boolean; cdecl; //(Landroid/content/Context;)Z

    { static Property }
  end;

  [JavaSignature('com/hc/bluetoothlibrary/tootl/ToolClass')]
  JToolClass = interface(JObject)
  ['{28A0DC8F-EBD5-4078-A319-09AF7A435055}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJToolClass = class(TJavaGenericImport<JToolClassClass, JToolClass>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_2));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_3',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_3));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_4',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_4));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_5_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_5_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_5_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_5_2));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_5',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_5));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_State',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage_State));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JAllBluetoothManage));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_10_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_10_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_10',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_10));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_2));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_3',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_3));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_4',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_4));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_5',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_5));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_6',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_6));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_7',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_7));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_8_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_8_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_8',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_8));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_9_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_9_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_9_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_9_2));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_9',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage_9));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBleBluetoothManage));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_1_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_1_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_1_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_1_2));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_1_3',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_1_3));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_2));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_3',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_3));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_4',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_4));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_DownloadBinder',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService_DownloadBinder));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBluetoothLeService));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JParseLeAdvData',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JParseLeAdvData));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JBuildConfig',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_10',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_10));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_11',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_11));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_2));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_3',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_3));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_4',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_4));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_5',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_5));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_6',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_6));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_7',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_7));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_8',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_8));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_9_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_9_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_9',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage_9));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClassicBluetoothManage));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JClsUtils',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JClsUtils));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JPairReceiver_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JPairReceiver_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JPairReceiver_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JPairReceiver_2));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JPairReceiver_PairCallback',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JPairReceiver_PairCallback));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JPairReceiver',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JPairReceiver));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JTaskThread_1_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JTaskThread_1_1));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JTaskThread_1_2',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JTaskThread_1_2));
//  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JTaskThread_1',
//    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JTaskThread_1));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JTaskThread_WorkCallBack',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JTaskThread_WorkCallBack));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JTaskThread',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JTaskThread));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JDeviceModule',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JDeviceModule));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JIBluetooth',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JIBluetooth));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JDataMemory',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JDataMemory));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JIDataCallback',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JIDataCallback));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JIScanCallback',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JIScanCallback));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JModuleParameters',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JModuleParameters));
  TRegTypes.RegisterType('Androidapi.JNI.bluetoothlibrary_debug.JToolClass',
    TypeInfo(Androidapi.JNI.bluetoothlibrary_debug.JToolClass));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
