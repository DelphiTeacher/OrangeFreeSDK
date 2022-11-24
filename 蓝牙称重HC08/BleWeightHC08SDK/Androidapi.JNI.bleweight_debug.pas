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
//  生成时间：2022-11-24 10:58:30
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.bleweight_debug;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
//  Androidapi.JNI.com.hc.bluetoothlibrary.DeviceModule,
  Androidapi.JNI.bluetoothlibrary_debug,
  Androidapi.JNI.GraphicsContentViewText;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.bleweight.BuildConfig
//  JHoldBluetooth_1 = interface; //com.ggggcexx.bleweight.HoldBluetooth$1
  JHoldBluetooth_OnReadDataListener = interface; //com.ggggcexx.bleweight.HoldBluetooth$OnReadDataListener
  JHoldBluetooth_UpdateList = interface; //com.ggggcexx.bleweight.HoldBluetooth$UpdateList
  JHoldBluetooth = interface; //com.ggggcexx.bleweight.HoldBluetooth
  JStorage = interface; //com.ggggcexx.bleweight.Storage

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{11C1FF7A-AAE5-4807-89C4-533FE0A6509C}']
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

  [JavaSignature('com/ggggcexx/bleweight/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{41EFDC16-3487-4A4F-B6B2-07A06AE7D67E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

//  JHoldBluetooth_1Class = interface(JObjectClass)
//  ['{C9A7B503-6022-4756-BA2C-24864A1A7909}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/ggggcexx/bleweight/HoldBluetooth$1')]
//  JHoldBluetooth_1 = interface(JObject)
//  ['{A448607C-43B1-4A1E-AA92-7F3E7BC7D632}']
//    { Property Methods }
//
//    { methods }
//    procedure updateList(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
//    procedure connectSucceed(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
//    procedure updateEnd; cdecl; //()V
//    procedure updateMessyCode(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
//    procedure readData(mac: JString; data: TJavaArray<Byte>); cdecl; //(Ljava/lang/String;[B)V
//    procedure reading(isStart: Boolean); cdecl; //(Z)V
//    procedure errorDisconnect(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
//    procedure readNumber(number: Integer); cdecl; //(I)V
//    procedure readLog(className: JString; data: JString; lv: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
//    procedure readVelocity(velocity: Integer); cdecl; //(I)V
//
//    { Property }
//  end;

//  TJHoldBluetooth_1 = class(TJavaGenericImport<JHoldBluetooth_1Class, JHoldBluetooth_1>) end;

  JHoldBluetooth_OnReadDataListenerClass = interface(JObjectClass)
  ['{47848C73-7C65-4AE3-91CF-5E85BF187A4D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/bleweight/HoldBluetooth$OnReadDataListener')]
  JHoldBluetooth_OnReadDataListener = interface(IJavaInstance)
  ['{2E579B83-F5B0-4368-BAD9-C27D7A8703A4}']
    { Property Methods }

    { methods }
    procedure readData(P1: JString; P2: TJavaArray<Byte>); cdecl; //(Ljava/lang/String;[B)V
    procedure reading(P1: Boolean); cdecl; //(Z)V
    procedure connectSucceed; cdecl; //()V
    procedure errorDisconnect(P1: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure readNumber(P1: Integer); cdecl; //(I)V
    procedure readLog(P1: JString; P2: JString; P3: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    procedure readVelocity(P1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJHoldBluetooth_OnReadDataListener = class(TJavaGenericImport<JHoldBluetooth_OnReadDataListenerClass, JHoldBluetooth_OnReadDataListener>) end;

  JHoldBluetooth_UpdateListClass = interface(JObjectClass)
  ['{6B730971-3668-4C2B-990B-D9102FB0A138}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/bleweight/HoldBluetooth$UpdateList')]
  JHoldBluetooth_UpdateList = interface(IJavaInstance)
  ['{F7E70003-1824-492F-83A6-BDBA1545B12A}']
    { Property Methods }

    { methods }
    procedure update(P1: Boolean; P2: JDeviceModule); cdecl; //(ZLcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure updateMessyCode(P1: Boolean; P2: JDeviceModule); cdecl; //(ZLcom/hc/bluetoothlibrary/DeviceModule;)V

    { Property }
  end;

  TJHoldBluetooth_UpdateList = class(TJavaGenericImport<JHoldBluetooth_UpdateListClass, JHoldBluetooth_UpdateList>) end;

  JHoldBluetoothClass = interface(JObjectClass)
  ['{8127B85B-5A52-4175-BAAC-B3C9C7EE7994}']
    { static Property Methods }
    {class} function _GetDEVELOPMENT_MODE_KEY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function getInstance: JHoldBluetooth; cdecl; //()Lcom/ggggcexx/bleweight/HoldBluetooth;

    { static Property }
    {class} property DEVELOPMENT_MODE_KEY: JString read _GetDEVELOPMENT_MODE_KEY;
  end;

  [JavaSignature('com/ggggcexx/bleweight/HoldBluetooth')]
  JHoldBluetooth = interface(JObject)
  ['{B79C85AA-646E-4144-B399-0F998DFE8BDC}']
    { Property Methods }

    { methods }
    procedure initHoldBluetooth(context: JContext; updateList: JHoldBluetooth_UpdateList); cdecl; //(Landroid/content/Context;Lcom/ggggcexx/bleweight/HoldBluetooth$UpdateList;)V
    function bluetoothState: Boolean; cdecl; //()Z
    function scan(state: Boolean): Boolean; cdecl; //(Z)Z
    procedure stopScan; cdecl; //()V
    procedure sendData(deviceModule: JDeviceModule; data: TJavaArray<Byte>); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;[B)V
    procedure connect(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure disconnect(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    procedure tempDisconnect(deviceModule: JDeviceModule); cdecl; //(Lcom/hc/bluetoothlibrary/DeviceModule;)V
    function getConnectedArray: JList; cdecl; //()Ljava/util/List;
    procedure setOnReadListener(listener: JHoldBluetooth_OnReadDataListener); cdecl; //(Lcom/ggggcexx/bleweight/HoldBluetooth$OnReadDataListener;)V
    function isDevelopmentMode: Boolean; cdecl; //()Z
    procedure setDevelopmentMode(context: JContext); cdecl; //(Landroid/content/Context;)V

    { Property }
  end;

  TJHoldBluetooth = class(TJavaGenericImport<JHoldBluetoothClass, JHoldBluetooth>) end;

  JStorageClass = interface(JObjectClass)
  ['{7EBC53EE-4A79-40E3-82FE-253D06923F4F}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JStorage; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/bleweight/Storage')]
  JStorage = interface(JObject)
  ['{1FA14C06-3B2E-4064-9685-8E2D001272F3}']
    { Property Methods }

    { methods }
    procedure saveData(key: JString; value: Boolean); cdecl; overload; //(Ljava/lang/String;Z)V
    procedure saveData(key: JString; value: JString); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)V
    procedure saveWidth(value: Integer); cdecl; //(I)V
    procedure saveFirstTime; cdecl; //()V
    procedure saveInvalidAT; cdecl; //()V
    procedure saveCodedFormat(code: JString); cdecl; //(Ljava/lang/String;)V
    function getData(key: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
    function getDataString(key: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    function getWidth: Integer; cdecl; //()I
    function getFirstTime: Boolean; cdecl; //()Z
    function getInvalidAT: Boolean; cdecl; //()Z
    function getCodedFormat: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJStorage = class(TJavaGenericImport<JStorageClass, JStorage>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.bleweight_debug.JBuildConfig',
    TypeInfo(Androidapi.JNI.bleweight_debug.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.bleweight_debug.JHoldBluetooth_1',
//    TypeInfo(Androidapi.JNI.bleweight_debug.JHoldBluetooth_1));
  TRegTypes.RegisterType('Androidapi.JNI.bleweight_debug.JHoldBluetooth_OnReadDataListener',
    TypeInfo(Androidapi.JNI.bleweight_debug.JHoldBluetooth_OnReadDataListener));
  TRegTypes.RegisterType('Androidapi.JNI.bleweight_debug.JHoldBluetooth_UpdateList',
    TypeInfo(Androidapi.JNI.bleweight_debug.JHoldBluetooth_UpdateList));
  TRegTypes.RegisterType('Androidapi.JNI.bleweight_debug.JHoldBluetooth',
    TypeInfo(Androidapi.JNI.bleweight_debug.JHoldBluetooth));
  TRegTypes.RegisterType('Androidapi.JNI.bleweight_debug.JStorage',
    TypeInfo(Androidapi.JNI.bleweight_debug.JStorage));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
