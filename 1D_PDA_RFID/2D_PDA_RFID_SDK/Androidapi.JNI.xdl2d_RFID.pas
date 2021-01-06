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
//  生成时间：2021/1/5 12:35:53
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.xdl2d_RFID;

interface

{$IFDEF ANDROID}

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JDataPackageParser = interface; //com.module.interaction.DataPackageParser
  JDataPackageProcess = interface; //com.module.interaction.DataPackageProcess
  JModuleConnector = interface; //com.module.interaction.ModuleConnector
//  JReaderHelper_1 = interface; //com.module.interaction.ReaderHelper$1
  JReaderHelper_ReaderBase_WaitThread = interface; //com.module.interaction.ReaderHelper$ReaderBase$WaitThread
  JReaderHelper_ReaderBase = interface; //com.module.interaction.ReaderHelper$ReaderBase
  JReaderHelper = interface; //com.module.interaction.ReaderHelper
  JRXTXListener = interface; //com.module.interaction.RXTXListener
  JMessageTran = interface; //com.rfid.bean.MessageTran
  JCMD = interface; //com.rfid.config.CMD
  JERROR = interface; //com.rfid.config.ERROR
  JHEAD = interface; //com.rfid.config.HEAD
  JReaderConnector = interface; //com.rfid.ReaderConnector
  JReaderDataPackageParser = interface; //com.rfid.ReaderDataPackageParser
  JReaderDataPackageProcess = interface; //com.rfid.ReaderDataPackageProcess
  JRFIDReaderHelper = interface; //com.rfid.RFIDReaderHelper
  JRXInventory6BTag = interface; //com.rfid.rxobserver.bean.RXInventory6BTag
  JRXInventoryTag_RXFastSwitchAntInventoryTagEnd = interface; //com.rfid.rxobserver.bean.RXInventoryTag$RXFastSwitchAntInventoryTagEnd
  JRXInventoryTag_RXInventoryTagEnd = interface; //com.rfid.rxobserver.bean.RXInventoryTag$RXInventoryTagEnd
  JRXInventoryTag = interface; //com.rfid.rxobserver.bean.RXInventoryTag
  JRXOperationTag = interface; //com.rfid.rxobserver.bean.RXOperationTag
  JReaderSetting_MaskMap = interface; //com.rfid.rxobserver.ReaderSetting$MaskMap
  JReaderSetting = interface; //com.rfid.rxobserver.ReaderSetting
  JRXObserver = interface; //com.rfid.rxobserver.RXObserver
  JConverter = interface; //com.util.Converter
  JStringTool = interface; //com.util.StringTool
  JQueryMessageTran = interface; //com.xdl2d.scanner.bean.QueryMessageTran
  JScannerSetting = interface; //com.xdl2d.scanner.bean.ScannerSetting
  JRXCallback = interface; //com.xdl2d.scanner.callback.RXCallback
  JCommand = interface; //com.xdl2d.scanner.config.Command
  JTDScannerConnector = interface; //com.xdl2d.scanner.TDScannerConnector
  JTDScannerDataPackageParser = interface; //com.xdl2d.scanner.TDScannerDataPackageParser
  JTDScannerDataPackageProcess = interface; //com.xdl2d.scanner.TDScannerDataPackageProcess
  JTDScannerHelper = interface; //com.xdl2d.scanner.TDScannerHelper

// ===== Forward SuperClasses declarations =====



  JDataPackageParserClass = interface(JObjectClass)
  ['{3AD7BA93-BA48-448F-84F8-283DC5FA87C0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/DataPackageParser')]
  JDataPackageParser = interface(IJavaInstance)
  ['{2896E0D6-8D7D-4C9A-B0AA-08256CCA7315}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(P1: TJavaArray<Byte>; P2: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJDataPackageParser = class(TJavaGenericImport<JDataPackageParserClass, JDataPackageParser>) end;

  JDataPackageProcessClass = interface(JObjectClass) // or JObjectClass
  ['{218157EA-DC0F-4F0C-ACA5-22A557DC6A65}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/DataPackageProcess')]
  JDataPackageProcess = interface(JObject) // or JObject
  ['{BBAA98C6-4F8D-4336-A98C-CA9EA49D094A}']
    { Property Methods }

    { methods }
    procedure analyData(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJDataPackageProcess = class(TJavaGenericImport<JDataPackageProcessClass, JDataPackageProcess>) end;

  JModuleConnectorClass = interface(JObjectClass)
  ['{71D1C77A-34E7-4512-BACA-9A47C6D378ED}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ModuleConnector')]
  JModuleConnector = interface(IJavaInstance)
  ['{7139BBEA-4720-402A-BFD1-02D793BAD363}']
    { Property Methods }

    { methods }
    function connectCom(P1: JString; P2: Integer): Boolean; cdecl;
    function connect(P1: JString; P2: Integer): Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    procedure disConnect; cdecl;

    { Property }
  end;

  TJModuleConnector = class(TJavaGenericImport<JModuleConnectorClass, JModuleConnector>) end;

  JReaderHelper_ReaderBaseClass = interface(JObjectClass)
  ['{025FB1BD-64A5-47DA-97FE-2E71BFD94133}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JReaderHelper; ain: JInputStream; aout: JOutputStream; parser: JDataPackageParser; process: JDataPackageProcess): JReaderHelper_ReaderBase; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper$ReaderBase')]
  JReaderHelper_ReaderBase = interface(JObject)
  ['{14596F5D-8E01-47E0-8F5F-9BE95FE179CD}']
    { Property Methods }

    { methods }
    function IsAlive: Boolean; cdecl;
    procedure StartWait; cdecl;
    function getDataPackageProcess: JDataPackageProcess; cdecl;
    procedure signOut; cdecl;
    procedure registerObserver(observer: JObserver); cdecl;
    procedure unRegisterObserver(observer: JObserver); cdecl;
    procedure unRegisterObservers; cdecl;
    function sendBuffer(completeCMD: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJReaderHelper_ReaderBase = class(TJavaGenericImport<JReaderHelper_ReaderBaseClass, JReaderHelper_ReaderBase>) end;

//  JReaderHelper_1Class = interface(JReaderHelper_ReaderBaseClass) // or JObjectClass
//  ['{82CE08DB-2663-4076-899D-264697856281}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/module/interaction/ReaderHelper$1')]
//  JReaderHelper_1 = interface(JReaderHelper_ReaderBase) // or JObject
//  ['{B84F1523-5D99-409D-B88E-620AD0D6E448}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJReaderHelper_1 = class(TJavaGenericImport<JReaderHelper_1Class, JReaderHelper_1>) end;

  JReaderHelper_ReaderBase_WaitThreadClass = interface(JThreadClass) // or JObjectClass
  ['{4D5AE4C1-2497-4E95-AE18-98117FCF4828}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JReaderHelper_ReaderBase): JReaderHelper_ReaderBase_WaitThread; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper$ReaderBase$WaitThread')]
  JReaderHelper_ReaderBase_WaitThread = interface(JThread) // or JObject
  ['{9428D2B5-19A1-4F4C-AFBF-66E14233339A}']
    { Property Methods }

    { methods }
    procedure run; cdecl;
    procedure signOut; cdecl;

    { Property }
  end;

  TJReaderHelper_ReaderBase_WaitThread = class(TJavaGenericImport<JReaderHelper_ReaderBase_WaitThreadClass, JReaderHelper_ReaderBase_WaitThread>) end;

  JReaderHelperClass = interface(JObjectClass)
  ['{67EEFB8B-BE3B-4853-B21C-165318D43B46}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper')]
  JReaderHelper = interface(JObject)
  ['{2C1DF0AC-6858-427D-814F-8F79F2389A19}']
    { Property Methods }

    { methods }
    procedure setReader(ain: JInputStream; aout: JOutputStream; parser: JDataPackageParser; process: JDataPackageProcess); cdecl;
    procedure registerObserver(observer: JObserver); cdecl;
    procedure unRegisterObserver(observer: JObserver); cdecl;
    procedure unRegisterObservers; cdecl;
    function isAlive: Boolean; cdecl;
    procedure startWith; cdecl;
    procedure signOut; cdecl;
    procedure setRXTXListener(listener: JRXTXListener); cdecl;
    function sendCommand(btCMDPackage: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJReaderHelper = class(TJavaGenericImport<JReaderHelperClass, JReaderHelper>) end;

  JRXTXListenerClass = interface(JObjectClass)
  ['{BD60C987-9592-4080-856F-FE062F1B0004}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/RXTXListener')]
  JRXTXListener = interface(IJavaInstance)
  ['{51A55EC3-0989-4566-BD3C-FE3600F7EC3A}']
    { Property Methods }

    { methods }
    procedure reciveData(P1: TJavaArray<Byte>); cdecl;
    procedure sendData(P1: TJavaArray<Byte>); cdecl;
    procedure onLostConnect; cdecl;

    { Property }
  end;

  TJRXTXListener = class(TJavaGenericImport<JRXTXListenerClass, JRXTXListener>) end;

  JMessageTranClass = interface(JObjectClass)
  ['{CF18AA32-085E-4285-ADD5-9B870CCC5999}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMessageTran; cdecl; overload;
    {class} function init(btReadId: Byte; btCmd: Byte; btAryData: TJavaArray<Byte>): JMessageTran; cdecl; overload;
    {class} function init(btReadId: Byte; btCmd: Byte): JMessageTran; cdecl; overload;
    {class} function init(btAryTranData: TJavaArray<Byte>): JMessageTran; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/rfid/bean/MessageTran')]
  JMessageTran = interface(JObject)
  ['{83DD2D60-0573-42F0-9EEE-D07026C9BE6F}']
    { Property Methods }

    { methods }
    function getAryTranData: TJavaArray<Byte>; cdecl;
    function getAryData: TJavaArray<Byte>; cdecl;
    function getReadId: Byte; cdecl;
    function getCmd: Byte; cdecl;
    function getPacketType: Byte; cdecl;
    function checkPacketType: Boolean; cdecl;
    function checkSum(btAryBuffer: TJavaArray<Byte>; nStartPos: Integer; nLen: Integer): Byte; cdecl;

    { Property }
  end;

  TJMessageTran = class(TJavaGenericImport<JMessageTranClass, JMessageTran>) end;

  JCMDClass = interface(JObjectClass)
  ['{95BD66AB-AF67-49FF-AAD1-BD539BA7E04F}']
    { static Property Methods }
    {class} function _GetRESET: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_UART_BAUDRATE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_FIRMWARE_VERSION: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_READER_ADDRESS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_WORK_ANTENNA: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_WORK_ANTENNA: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_OUTPUT_POWER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_OUTPUT_POWER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_FREQUENCY_REGION: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_FREQUENCY_REGION: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_BEEPER_MODE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_READER_TEMPERATURE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_GPIO_VALUE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWRITE_GPIO_VALUE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_ANT_CONNECTION_DETECTOR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_ANT_CONNECTION_DETECTOR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_TEMPORARY_OUTPUT_POWER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_READER_IDENTIFIER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_READER_IDENTIFIER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_RF_LINK_PROFILE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_RF_LINK_PROFILE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_RF_PORT_RETURN_LOSS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWRITE_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOCK_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetKILL_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_ACCESS_EPC_MATCH: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_ACCESS_EPC_MATCH: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAL_TIME_INVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAST_SWITCH_ANT_INVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCUSTOMIZED_SESSION_TARGET_INVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_IMPINJ_FAST_TID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_AND_SAVE_IMPINJ_FAST_TID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_IMPINJ_FAST_TID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO18000_6B_INVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO18000_6B_READ_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO18000_6B_WRITE_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO18000_6B_LOCK_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetISO18000_6B_QUERY_LOCK_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_INVENTORY_BUFFER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_AND_RESET_INVENTORY_BUFFER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetGET_INVENTORY_BUFFER_TAG_COUNT: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESET_INVENTORY_BUFFER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOPERATE_TAG_MASK: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCMD; cdecl;
    {class} function format(btCmd: Byte): JString; cdecl;

    { static Property }
    {class} property RESET: Byte read _GetRESET;
    {class} property SET_UART_BAUDRATE: Byte read _GetSET_UART_BAUDRATE;
    {class} property GET_FIRMWARE_VERSION: Byte read _GetGET_FIRMWARE_VERSION;
    {class} property SET_READER_ADDRESS: Byte read _GetSET_READER_ADDRESS;
    {class} property SET_WORK_ANTENNA: Byte read _GetSET_WORK_ANTENNA;
    {class} property GET_WORK_ANTENNA: Byte read _GetGET_WORK_ANTENNA;
    {class} property SET_OUTPUT_POWER: Byte read _GetSET_OUTPUT_POWER;
    {class} property GET_OUTPUT_POWER: Byte read _GetGET_OUTPUT_POWER;
    {class} property SET_FREQUENCY_REGION: Byte read _GetSET_FREQUENCY_REGION;
    {class} property GET_FREQUENCY_REGION: Byte read _GetGET_FREQUENCY_REGION;
    {class} property SET_BEEPER_MODE: Byte read _GetSET_BEEPER_MODE;
    {class} property GET_READER_TEMPERATURE: Byte read _GetGET_READER_TEMPERATURE;
    {class} property READ_GPIO_VALUE: Byte read _GetREAD_GPIO_VALUE;
    {class} property WRITE_GPIO_VALUE: Byte read _GetWRITE_GPIO_VALUE;
    {class} property SET_ANT_CONNECTION_DETECTOR: Byte read _GetSET_ANT_CONNECTION_DETECTOR;
    {class} property GET_ANT_CONNECTION_DETECTOR: Byte read _GetGET_ANT_CONNECTION_DETECTOR;
    {class} property SET_TEMPORARY_OUTPUT_POWER: Byte read _GetSET_TEMPORARY_OUTPUT_POWER;
    {class} property SET_READER_IDENTIFIER: Byte read _GetSET_READER_IDENTIFIER;
    {class} property GET_READER_IDENTIFIER: Byte read _GetGET_READER_IDENTIFIER;
    {class} property SET_RF_LINK_PROFILE: Byte read _GetSET_RF_LINK_PROFILE;
    {class} property GET_RF_LINK_PROFILE: Byte read _GetGET_RF_LINK_PROFILE;
    {class} property GET_RF_PORT_RETURN_LOSS: Byte read _GetGET_RF_PORT_RETURN_LOSS;
    {class} property INVENTORY: Byte read _GetINVENTORY;
    {class} property READ_TAG: Byte read _GetREAD_TAG;
    {class} property WRITE_TAG: Byte read _GetWRITE_TAG;
    {class} property LOCK_TAG: Byte read _GetLOCK_TAG;
    {class} property KILL_TAG: Byte read _GetKILL_TAG;
    {class} property SET_ACCESS_EPC_MATCH: Byte read _GetSET_ACCESS_EPC_MATCH;
    {class} property GET_ACCESS_EPC_MATCH: Byte read _GetGET_ACCESS_EPC_MATCH;
    {class} property REAL_TIME_INVENTORY: Byte read _GetREAL_TIME_INVENTORY;
    {class} property FAST_SWITCH_ANT_INVENTORY: Byte read _GetFAST_SWITCH_ANT_INVENTORY;
    {class} property CUSTOMIZED_SESSION_TARGET_INVENTORY: Byte read _GetCUSTOMIZED_SESSION_TARGET_INVENTORY;
    {class} property SET_IMPINJ_FAST_TID: Byte read _GetSET_IMPINJ_FAST_TID;
    {class} property SET_AND_SAVE_IMPINJ_FAST_TID: Byte read _GetSET_AND_SAVE_IMPINJ_FAST_TID;
    {class} property GET_IMPINJ_FAST_TID: Byte read _GetGET_IMPINJ_FAST_TID;
    {class} property ISO18000_6B_INVENTORY: Byte read _GetISO18000_6B_INVENTORY;
    {class} property ISO18000_6B_READ_TAG: Byte read _GetISO18000_6B_READ_TAG;
    {class} property ISO18000_6B_WRITE_TAG: Byte read _GetISO18000_6B_WRITE_TAG;
    {class} property ISO18000_6B_LOCK_TAG: Byte read _GetISO18000_6B_LOCK_TAG;
    {class} property ISO18000_6B_QUERY_LOCK_TAG: Byte read _GetISO18000_6B_QUERY_LOCK_TAG;
    {class} property GET_INVENTORY_BUFFER: Byte read _GetGET_INVENTORY_BUFFER;
    {class} property GET_AND_RESET_INVENTORY_BUFFER: Byte read _GetGET_AND_RESET_INVENTORY_BUFFER;
    {class} property GET_INVENTORY_BUFFER_TAG_COUNT: Byte read _GetGET_INVENTORY_BUFFER_TAG_COUNT;
    {class} property RESET_INVENTORY_BUFFER: Byte read _GetRESET_INVENTORY_BUFFER;
    {class} property OPERATE_TAG_MASK: Byte read _GetOPERATE_TAG_MASK;
  end;

  [JavaSignature('com/rfid/config/CMD')]
  JCMD = interface(JObject)
  ['{109CADA3-6694-4D38-9CD3-360CD789A490}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCMD = class(TJavaGenericImport<JCMDClass, JCMD>) end;

  JERRORClass = interface(JObjectClass)
  ['{C28692F8-A3C4-4519-B5EF-9BEA0AA2209B}']
    { static Property Methods }
    {class} function _GetSUCCESS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAIL: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMCU_RESET_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCW_ON_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetANTENNA_MISSING_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWRITE_FLASH_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREAD_FLASH_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_OUTPUT_POWER_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAG_INVENTORY_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAG_READ_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAG_WRITE_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAG_LOCK_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTAG_KILL_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNO_TAG_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINVENTORY_OK_BUT_ACCESS_FAIL: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUFFER_IS_EMPTY_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetACCESS_OR_PASSWORD_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_WORDCNT_TOO_LONG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_MEMBANK_OUT_OF_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_LOCK_REGION_OUT_OF_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_LOCK_ACTION_OUT_OF_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_READER_ADDRESS_INVALID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_ANTENNA_ID_OUT_OF_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_OUTPUT_POWER_OUT_OF_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_FREQUENCY_REGION_OUT_OF_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_BAUDRATE_OUT_OF_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_BEEPER_MODE_OUT_OF_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_EPC_MATCH_LEN_TOO_LONG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_EPC_MATCH_LEN_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_EPC_MATCH_MODE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_FREQUENCY_RANGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAIL_TO_GET_RN16_FROM_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_INVALID_DRM_MODE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPLL_LOCK_FAIL: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRF_CHIP_FAIL_TO_RESPONSE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAIL_TO_ACHIEVE_DESIRED_OUTPUT_POWER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOPYRIGHT_AUTHENTICATION_FAIL: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSPECTRUM_REGULATION_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetOUTPUT_POWER_TOO_LOW: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKONW_ERROR: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JERROR; cdecl;
    {class} function format(btErrorCode: Byte): JString; cdecl;

    { static Property }
    {class} property SUCCESS: Byte read _GetSUCCESS;
    {class} property FAIL: Byte read _GetFAIL;
    {class} property MCU_RESET_ERROR: Byte read _GetMCU_RESET_ERROR;
    {class} property CW_ON_ERROR: Byte read _GetCW_ON_ERROR;
    {class} property ANTENNA_MISSING_ERROR: Byte read _GetANTENNA_MISSING_ERROR;
    {class} property WRITE_FLASH_ERROR: Byte read _GetWRITE_FLASH_ERROR;
    {class} property READ_FLASH_ERROR: Byte read _GetREAD_FLASH_ERROR;
    {class} property SET_OUTPUT_POWER_ERROR: Byte read _GetSET_OUTPUT_POWER_ERROR;
    {class} property TAG_INVENTORY_ERROR: Byte read _GetTAG_INVENTORY_ERROR;
    {class} property TAG_READ_ERROR: Byte read _GetTAG_READ_ERROR;
    {class} property TAG_WRITE_ERROR: Byte read _GetTAG_WRITE_ERROR;
    {class} property TAG_LOCK_ERROR: Byte read _GetTAG_LOCK_ERROR;
    {class} property TAG_KILL_ERROR: Byte read _GetTAG_KILL_ERROR;
    {class} property NO_TAG_ERROR: Byte read _GetNO_TAG_ERROR;
    {class} property INVENTORY_OK_BUT_ACCESS_FAIL: Byte read _GetINVENTORY_OK_BUT_ACCESS_FAIL;
    {class} property BUFFER_IS_EMPTY_ERROR: Byte read _GetBUFFER_IS_EMPTY_ERROR;
    {class} property ACCESS_OR_PASSWORD_ERROR: Byte read _GetACCESS_OR_PASSWORD_ERROR;
    {class} property PARAMETER_INVALID: Byte read _GetPARAMETER_INVALID;
    {class} property PARAMETER_INVALID_WORDCNT_TOO_LONG: Byte read _GetPARAMETER_INVALID_WORDCNT_TOO_LONG;
    {class} property PARAMETER_INVALID_MEMBANK_OUT_OF_RANGE: Byte read _GetPARAMETER_INVALID_MEMBANK_OUT_OF_RANGE;
    {class} property PARAMETER_INVALID_LOCK_REGION_OUT_OF_RANGE: Byte read _GetPARAMETER_INVALID_LOCK_REGION_OUT_OF_RANGE;
    {class} property PARAMETER_INVALID_LOCK_ACTION_OUT_OF_RANGE: Byte read _GetPARAMETER_INVALID_LOCK_ACTION_OUT_OF_RANGE;
    {class} property PARAMETER_READER_ADDRESS_INVALID: Byte read _GetPARAMETER_READER_ADDRESS_INVALID;
    {class} property PARAMETER_INVALID_ANTENNA_ID_OUT_OF_RANGE: Byte read _GetPARAMETER_INVALID_ANTENNA_ID_OUT_OF_RANGE;
    {class} property PARAMETER_INVALID_OUTPUT_POWER_OUT_OF_RANGE: Byte read _GetPARAMETER_INVALID_OUTPUT_POWER_OUT_OF_RANGE;
    {class} property PARAMETER_INVALID_FREQUENCY_REGION_OUT_OF_RANGE: Byte read _GetPARAMETER_INVALID_FREQUENCY_REGION_OUT_OF_RANGE;
    {class} property PARAMETER_INVALID_BAUDRATE_OUT_OF_RANGE: Byte read _GetPARAMETER_INVALID_BAUDRATE_OUT_OF_RANGE;
    {class} property PARAMETER_BEEPER_MODE_OUT_OF_RANGE: Byte read _GetPARAMETER_BEEPER_MODE_OUT_OF_RANGE;
    {class} property PARAMETER_EPC_MATCH_LEN_TOO_LONG: Byte read _GetPARAMETER_EPC_MATCH_LEN_TOO_LONG;
    {class} property PARAMETER_EPC_MATCH_LEN_ERROR: Byte read _GetPARAMETER_EPC_MATCH_LEN_ERROR;
    {class} property PARAMETER_INVALID_EPC_MATCH_MODE: Byte read _GetPARAMETER_INVALID_EPC_MATCH_MODE;
    {class} property PARAMETER_INVALID_FREQUENCY_RANGE: Byte read _GetPARAMETER_INVALID_FREQUENCY_RANGE;
    {class} property FAIL_TO_GET_RN16_FROM_TAG: Byte read _GetFAIL_TO_GET_RN16_FROM_TAG;
    {class} property PARAMETER_INVALID_DRM_MODE: Byte read _GetPARAMETER_INVALID_DRM_MODE;
    {class} property PLL_LOCK_FAIL: Byte read _GetPLL_LOCK_FAIL;
    {class} property RF_CHIP_FAIL_TO_RESPONSE: Byte read _GetRF_CHIP_FAIL_TO_RESPONSE;
    {class} property FAIL_TO_ACHIEVE_DESIRED_OUTPUT_POWER: Byte read _GetFAIL_TO_ACHIEVE_DESIRED_OUTPUT_POWER;
    {class} property COPYRIGHT_AUTHENTICATION_FAIL: Byte read _GetCOPYRIGHT_AUTHENTICATION_FAIL;
    {class} property SPECTRUM_REGULATION_ERROR: Byte read _GetSPECTRUM_REGULATION_ERROR;
    {class} property OUTPUT_POWER_TOO_LOW: Byte read _GetOUTPUT_POWER_TOO_LOW;
    {class} property UNKONW_ERROR: Byte read _GetUNKONW_ERROR;
  end;

  [JavaSignature('com/rfid/config/ERROR')]
  JERROR = interface(JObject)
  ['{40F552A1-60E7-453D-B949-D29FE714FC50}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJERROR = class(TJavaGenericImport<JERRORClass, JERROR>) end;

  JHEADClass = interface(JObjectClass)
  ['{6738F70D-A79F-42A8-BE71-964A9EFCB814}']
    { static Property Methods }
    {class} function _GetHEAD: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHEAD; cdecl;

    { static Property }
    {class} property HEAD: Byte read _GetHEAD;
  end;

  [JavaSignature('com/rfid/config/HEAD')]
  JHEAD = interface(JObject)
  ['{E2A53D27-83B1-4FD4-9A25-B195E79C97D1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHEAD = class(TJavaGenericImport<JHEADClass, JHEAD>) end;

  JReaderConnectorClass = interface(JObjectClass)
  ['{1E6E9FC9-0B45-4453-B946-62AC01D456D9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderConnector; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderConnector')]
  JReaderConnector = interface(JObject)
  ['{E492CE79-2363-4D44-8F7F-AE3C88A4568C}']
    { Property Methods }

    { methods }
    function connectCom(port: JString; baud: Integer): Boolean; cdecl;
    function connect(host: JString; port: Integer): Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    procedure disConnect; cdecl;

    { Property }
  end;

  TJReaderConnector = class(TJavaGenericImport<JReaderConnectorClass, JReaderConnector>) end;

  JReaderDataPackageParserClass = interface(JObjectClass)
  ['{43F8B704-751C-43EA-9642-60705C00D673}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderDataPackageParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderDataPackageParser')]
  JReaderDataPackageParser = interface(JObject)
  ['{E7696300-6887-4AA8-945A-48E8A473F718}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(btAryReceiveData: TJavaArray<Byte>; dataPackageProcess: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJReaderDataPackageParser = class(TJavaGenericImport<JReaderDataPackageParserClass, JReaderDataPackageParser>) end;

  JReaderDataPackageProcessClass = interface(JDataPackageProcessClass) // or JObjectClass
  ['{319345C2-2A61-4EF4-BFA2-ECBD6D44E246}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderDataPackageProcess')]
  JReaderDataPackageProcess = interface(JDataPackageProcess) // or JObject
  ['{E141997E-2C62-4B92-ABB9-65948CF3C617}']
    { Property Methods }

    { methods }
    procedure analyData(btPackage: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJReaderDataPackageProcess = class(TJavaGenericImport<JReaderDataPackageProcessClass, JReaderDataPackageProcess>) end;

  JRFIDReaderHelperClass = interface(JReaderHelperClass) // or JObjectClass
  ['{695936A8-88E4-47FE-8B4C-8B590A19A99B}']
    { static Property Methods }

    { static Methods }
    {class} function getDefaultHelper: JRFIDReaderHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/RFIDReaderHelper')]
  JRFIDReaderHelper = interface(JReaderHelper) // or JObject
  ['{09400848-454E-4D2E-B430-D0DA0B092385}']
    { Property Methods }

    { methods }
    function reset(btReadId: Byte): Integer; cdecl;
    function setUartBaudrate(btReadId: Byte; nIndexBaudrate: Byte): Integer; cdecl;
    function getFirmwareVersion(btReadId: Byte): Integer; cdecl;
    function setReaderAddress(btReadId: Byte; btNewReadId: Byte): Integer; cdecl;
    function setWorkAntenna(btReadId: Byte; btWorkAntenna: Byte): Integer; cdecl;
    function getWorkAntenna(btReadId: Byte): Integer; cdecl;
    function setOutputPower(btReadId: Byte; btOutputPower: Byte): Integer; cdecl; overload;
    function setOutputPower(btReadId: Byte; btPower1: Byte; btPower2: Byte; btPower3: Byte; btPower4: Byte): Integer; cdecl; overload;
    function getOutputPower(btReadId: Byte): Integer; cdecl;
    function setFrequencyRegion(btReadId: Byte; btRegion: Byte; btStartRegion: Byte; btEndRegion: Byte): Integer; cdecl;
    function setUserDefineFrequency(btReadId: Byte; btFreqInterval: Byte; btChannelQuantity: Byte; nStartFreq: Integer): Integer; cdecl;
    function getFrequencyRegion(btReadId: Byte): Integer; cdecl;
    function setBeeperMode(btReadId: Byte; btMode: Byte): Integer; cdecl;
    function getReaderTemperature(btReadId: Byte): Integer; cdecl;
    function readGpioValue(btReadId: Byte): Integer; cdecl;
    function writeGpioValue(btReadId: Byte; btChooseGpio: Byte; btGpioValue: Byte): Integer; cdecl;
    function setAntConnectionDetector(btReadId: Byte; btDetectorStatus: Byte): Integer; cdecl;
    function getAntConnectionDetector(btReadId: Byte): Integer; cdecl;
    function setTemporaryOutputPower(btReadId: Byte; btRfPower: Byte): Integer; cdecl;
    function setReaderIdentifier(btReadId: Byte; btAryIdentifier: TJavaArray<Byte>): Integer; cdecl;
    function getReaderIdentifier(btReadId: Byte): Integer; cdecl;
    function setRfLinkProfile(btReadId: Byte; btProfile: Byte): Integer; cdecl;
    function getRfLinkProfile(btReadId: Byte): Integer; cdecl;
    function getRfPortReturnLoss(btReadId: Byte; btFrequency: Byte): Integer; cdecl;
    function inventory(btReadId: Byte; btRepeat: Byte): Integer; cdecl;
    function readTag(btReadId: Byte; btMemBank: Byte; btWordAdd: Byte; btWordCnt: Byte; btAryPassWord: TJavaArray<Byte>): Integer; cdecl;
    function writeTag(btReadId: Byte; btAryPassWord: TJavaArray<Byte>; btMemBank: Byte; btWordAdd: Byte; btWordCnt: Byte; btAryData: TJavaArray<Byte>): Integer; cdecl;
    function lockTag(btReadId: Byte; btAryPassWord: TJavaArray<Byte>; btMemBank: Byte; btLockType: Byte): Integer; cdecl;
    function killTag(btReadId: Byte; btAryPassWord: TJavaArray<Byte>): Integer; cdecl;
    function setAccessEpcMatch(btReadId: Byte; btEpcLen: Byte; btAryEpc: TJavaArray<Byte>): Integer; cdecl;
    function cancelAccessEpcMatch(btReadId: Byte): Integer; cdecl;
    function getAccessEpcMatch(btReadId: Byte): Integer; cdecl;
    function realTimeInventory(btReadId: Byte; btRepeat: Byte): Integer; cdecl;
    function fastSwitchAntInventory(btReadId: Byte; btA: Byte; btStayA: Byte; btB: Byte; btStayB: Byte; btC: Byte; btStayC: Byte; btD: Byte; btStayD: Byte; btInterval: Byte; btRepeat: Byte): Integer; cdecl;
    function customizedSessionTargetInventory(btReadId: Byte; btSession: Byte; btTarget: Byte; btRepeat: Byte): Integer; cdecl;
    function setImpinjFastTid(btReadId: Byte; blnOpen: Boolean; blnSave: Boolean): Integer; cdecl;
    function getImpinjFastTid(btReadId: Byte): Integer; cdecl;
    function iso180006BInventory(btReadId: Byte): Integer; cdecl;
    function iso180006BReadTag(btReadId: Byte; btAryUID: TJavaArray<Byte>; btWordAdd: Byte; btWordCnt: Byte): Integer; cdecl;
    function iso180006BWriteTag(btReadId: Byte; btAryUID: TJavaArray<Byte>; btWordAdd: Byte; btWordCnt: Byte; btAryBuffer: TJavaArray<Byte>): Integer; cdecl;
    function iso180006BLockTag(btReadId: Byte; btAryUID: TJavaArray<Byte>; btWordAdd: Byte): Integer; cdecl;
    function iso180006BQueryLockTag(btReadId: Byte; btAryUID: TJavaArray<Byte>; btWordAdd: Byte): Integer; cdecl;
    function getInventoryBuffer(btReadId: Byte): Integer; cdecl;
    function getAndResetInventoryBuffer(btReadId: Byte): Integer; cdecl;
    function getInventoryBufferTagCount(btReadId: Byte): Integer; cdecl;
    function resetInventoryBuffer(btReadId: Byte): Integer; cdecl;
    function setTagMask(btReadId: Byte; btMaskNo: Byte; btTarget: Byte; btAction: Byte; btMembank: Byte; btStartAdd: Byte; btMaskLen: Byte; maskValue: TJavaArray<Byte>): Integer; cdecl;
    function getTagMask(btReadId: Byte): Integer; cdecl;
    function clearTagMask(btReadId: Byte; btMaskNo: Byte): Integer; cdecl;
    function setTrigger(enable: Boolean): Integer; cdecl;

    { Property }
  end;

  TJRFIDReaderHelper = class(TJavaGenericImport<JRFIDReaderHelperClass, JRFIDReaderHelper>) end;

  JRXInventory6BTagClass = interface(JObjectClass)
  ['{B48193A3-4D7F-4B69-B13D-65002EECD4CA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventory6BTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventory6BTag')]
  JRXInventory6BTag = interface(JObject)
  ['{AD397409-DEF8-47B5-8A36-2B6B90B616F9}']
    { Property Methods }
    function _GetmAntID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmAntID(amAntID: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmUID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmUID(amUID: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property mAntID: Byte read _GetmAntID write _SetmAntID;
    property mUID: JString read _GetmUID write _SetmUID;
  end;

  TJRXInventory6BTag = class(TJavaGenericImport<JRXInventory6BTagClass, JRXInventory6BTag>) end;

  JRXInventoryTag_RXFastSwitchAntInventoryTagEndClass = interface(JObjectClass)
  ['{9F9F95AA-1976-4939-B564-CA438448C27D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag_RXFastSwitchAntInventoryTagEnd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag$RXFastSwitchAntInventoryTagEnd')]
  JRXInventoryTag_RXFastSwitchAntInventoryTagEnd = interface(JObject)
  ['{9E67BB1E-A138-457A-B5C0-1CE3F18F2CE3}']
    { Property Methods }
    function _GetmTotalRead: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTotalRead(amTotalRead: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmCommandDuration: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmCommandDuration(amCommandDuration: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property mTotalRead: Integer read _GetmTotalRead write _SetmTotalRead;
    property mCommandDuration: Integer read _GetmCommandDuration write _SetmCommandDuration;
  end;

  TJRXInventoryTag_RXFastSwitchAntInventoryTagEnd = class(TJavaGenericImport<JRXInventoryTag_RXFastSwitchAntInventoryTagEndClass, JRXInventoryTag_RXFastSwitchAntInventoryTagEnd>) end;

  JRXInventoryTag_RXInventoryTagEndClass = interface(JObjectClass)
  ['{99AF8954-8208-4721-BB62-693C213CDA50}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag_RXInventoryTagEnd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag$RXInventoryTagEnd')]
  JRXInventoryTag_RXInventoryTagEnd = interface(JObject)
  ['{AF0DDD34-8180-447D-8DC1-BAE23911DB4D}']
    { Property Methods }
    function _GetmCurrentAnt: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmCurrentAnt(amCurrentAnt: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmTagCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTagCount(amTagCount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmReadRate: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmReadRate(amReadRate: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmTotalRead: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTotalRead(amTotalRead: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcmd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcmd(acmd: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property mCurrentAnt: Integer read _GetmCurrentAnt write _SetmCurrentAnt;
    property mTagCount: Integer read _GetmTagCount write _SetmTagCount;
    property mReadRate: Integer read _GetmReadRate write _SetmReadRate;
    property mTotalRead: Integer read _GetmTotalRead write _SetmTotalRead;
    property cmd: Byte read _Getcmd write _Setcmd;
  end;

  TJRXInventoryTag_RXInventoryTagEnd = class(TJavaGenericImport<JRXInventoryTag_RXInventoryTagEndClass, JRXInventoryTag_RXInventoryTagEnd>) end;

  JRXInventoryTagClass = interface(JObjectClass)
  ['{606598C4-4B93-43E8-9737-E4103008C930}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag')]
  JRXInventoryTag = interface(JObject)
  ['{A07A0EC8-8847-408D-8070-82480B212C1A}']
    { Property Methods }
    function _GetstrPC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrPC(astrPC: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstrCRC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrCRC(astrCRC: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstrEPC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrEPC(astrEPC: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtAntId: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtAntId(abtAntId: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstrRSSI: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrRSSI(astrRSSI: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstrFreq: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrFreq(astrFreq: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmReadCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmReadCount(amReadCount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcmd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcmd(acmd: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property strPC: JString read _GetstrPC write _SetstrPC;
    property strCRC: JString read _GetstrCRC write _SetstrCRC;
    property strEPC: JString read _GetstrEPC write _SetstrEPC;
    property btAntId: Byte read _GetbtAntId write _SetbtAntId;
    property strRSSI: JString read _GetstrRSSI write _SetstrRSSI;
    property strFreq: JString read _GetstrFreq write _SetstrFreq;
    property mReadCount: Integer read _GetmReadCount write _SetmReadCount;
    property cmd: Byte read _Getcmd write _Setcmd;
  end;

  TJRXInventoryTag = class(TJavaGenericImport<JRXInventoryTagClass, JRXInventoryTag>) end;

  JRXOperationTagClass = interface(JObjectClass)
  ['{5165BF46-6A5A-4326-AE75-B740984C2D45}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXOperationTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXOperationTag')]
  JRXOperationTag = interface(JObject)
  ['{1373B9DF-7783-4C3D-A08E-65D5830BE413}']
    { Property Methods }
    function _GetstrPC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrPC(astrPC: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstrCRC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrCRC(astrCRC: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstrEPC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrEPC(astrEPC: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetstrData: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetstrData(astrData: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnDataLen: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnDataLen(anDataLen: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtAntId: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtAntId(abtAntId: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnOperateCount: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnOperateCount(anOperateCount: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getcmd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcmd(acmd: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property strPC: JString read _GetstrPC write _SetstrPC;
    property strCRC: JString read _GetstrCRC write _SetstrCRC;
    property strEPC: JString read _GetstrEPC write _SetstrEPC;
    property strData: JString read _GetstrData write _SetstrData;
    property nDataLen: Integer read _GetnDataLen write _SetnDataLen;
    property btAntId: Byte read _GetbtAntId write _SetbtAntId;
    property nOperateCount: Integer read _GetnOperateCount write _SetnOperateCount;
    property cmd: Byte read _Getcmd write _Setcmd;
  end;

  TJRXOperationTag = class(TJavaGenericImport<JRXOperationTagClass, JRXOperationTag>) end;

  JReaderSetting_MaskMapClass = interface(JObjectClass)
  ['{EEFD9FFE-23D5-44C7-B2FE-0B484DB9A6A1}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: TJavaArray<Byte>): JReaderSetting_MaskMap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/ReaderSetting$MaskMap')]
  JReaderSetting_MaskMap = interface(JObject)
  ['{B27CBC0C-9DA2-4549-BBD2-CAD01494D676}']
    { Property Methods }
    function _GetmMaskID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmMaskID(amMaskID: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmMaskQuantity: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmMaskQuantity(amMaskQuantity: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmTarget: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTarget(amTarget: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmAction: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmAction(amAction: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmMembank: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmMembank(amMembank: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmStartMaskAdd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmStartMaskAdd(amStartMaskAdd: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmMaskBitLen: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmMaskBitLen(amMaskBitLen: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmMaskValue: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmMaskValue(amMaskValue: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmTruncate: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTruncate(amTruncate: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function equals(obj: JObject): Boolean; cdecl;

    { Property }
    property mMaskID: Byte read _GetmMaskID write _SetmMaskID;
    property mMaskQuantity: Byte read _GetmMaskQuantity write _SetmMaskQuantity;
    property mTarget: Byte read _GetmTarget write _SetmTarget;
    property mAction: Byte read _GetmAction write _SetmAction;
    property mMembank: Byte read _GetmMembank write _SetmMembank;
    property mStartMaskAdd: Byte read _GetmStartMaskAdd write _SetmStartMaskAdd;
    property mMaskBitLen: Byte read _GetmMaskBitLen write _SetmMaskBitLen;
    property mMaskValue: TJavaArray<Byte> read _GetmMaskValue write _SetmMaskValue;
    property mTruncate: Byte read _GetmTruncate write _SetmTruncate;
  end;

  TJReaderSetting_MaskMap = class(TJavaGenericImport<JReaderSetting_MaskMapClass, JReaderSetting_MaskMap>) end;

  JReaderSettingClass = interface(JObjectClass)
  ['{14F8010E-6F13-4598-A514-6D05CEB12B3C}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JReaderSetting; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/ReaderSetting')]
  JReaderSetting = interface(JObject)
  ['{44EA541F-E2EC-48C7-AD48-1170FBCE4B9C}']
    { Property Methods }
    function _GetbtReadId: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtReadId(abtReadId: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtMajor: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtMajor(abtMajor: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtMinor: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtMinor(abtMinor: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtIndexBaudrate: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtIndexBaudrate(abtIndexBaudrate: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtPlusMinus: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtPlusMinus(abtPlusMinus: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtTemperature: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtTemperature(abtTemperature: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtAryOutputPower: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtAryOutputPower(abtAryOutputPower: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtWorkAntenna: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtWorkAntenna(abtWorkAntenna: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtDrmMode: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtDrmMode(abtDrmMode: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtRegion: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtRegion(abtRegion: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtFrequencyStart: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtFrequencyStart(abtFrequencyStart: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtFrequencyEnd: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtFrequencyEnd(abtFrequencyEnd: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtBeeperMode: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtBeeperMode(abtBeeperMode: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtGpio1Value: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtGpio1Value(abtGpio1Value: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtGpio2Value: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtGpio2Value(abtGpio2Value: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtGpio3Value: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtGpio3Value(abtGpio3Value: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtGpio4Value: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtGpio4Value(abtGpio4Value: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtAntDetector: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtAntDetector(abtAntDetector: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtMonzaStatus: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtMonzaStatus(abtMonzaStatus: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetblnMonzaStore: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetblnMonzaStore(ablnMonzaStore: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtAryReaderIdentifier: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtAryReaderIdentifier(abtAryReaderIdentifier: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtReturnLoss: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtReturnLoss(abtReturnLoss: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtImpedanceFrequency: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtImpedanceFrequency(abtImpedanceFrequency: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetnUserDefineStartFrequency: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetnUserDefineStartFrequency(anUserDefineStartFrequency: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtUserDefineFrequencyInterval: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtUserDefineFrequencyInterval(abtUserDefineFrequencyInterval: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtUserDefineChannelQuantity: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtUserDefineChannelQuantity(abtUserDefineChannelQuantity: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbtRfLinkProfile: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbtRfLinkProfile(abtRfLinkProfile: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmMatchEpcValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmMatchEpcValue(amMatchEpcValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property btReadId: Byte read _GetbtReadId write _SetbtReadId;
    property btMajor: Byte read _GetbtMajor write _SetbtMajor;
    property btMinor: Byte read _GetbtMinor write _SetbtMinor;
    property btIndexBaudrate: Byte read _GetbtIndexBaudrate write _SetbtIndexBaudrate;
    property btPlusMinus: Byte read _GetbtPlusMinus write _SetbtPlusMinus;
    property btTemperature: Byte read _GetbtTemperature write _SetbtTemperature;
    property btAryOutputPower: TJavaArray<Byte> read _GetbtAryOutputPower write _SetbtAryOutputPower;
    property btWorkAntenna: Byte read _GetbtWorkAntenna write _SetbtWorkAntenna;
    property btDrmMode: Byte read _GetbtDrmMode write _SetbtDrmMode;
    property btRegion: Byte read _GetbtRegion write _SetbtRegion;
    property btFrequencyStart: Byte read _GetbtFrequencyStart write _SetbtFrequencyStart;
    property btFrequencyEnd: Byte read _GetbtFrequencyEnd write _SetbtFrequencyEnd;
    property btBeeperMode: Byte read _GetbtBeeperMode write _SetbtBeeperMode;
    property btGpio1Value: Byte read _GetbtGpio1Value write _SetbtGpio1Value;
    property btGpio2Value: Byte read _GetbtGpio2Value write _SetbtGpio2Value;
    property btGpio3Value: Byte read _GetbtGpio3Value write _SetbtGpio3Value;
    property btGpio4Value: Byte read _GetbtGpio4Value write _SetbtGpio4Value;
    property btAntDetector: Byte read _GetbtAntDetector write _SetbtAntDetector;
    property btMonzaStatus: Byte read _GetbtMonzaStatus write _SetbtMonzaStatus;
    property blnMonzaStore: Boolean read _GetblnMonzaStore write _SetblnMonzaStore;
    property btAryReaderIdentifier: TJavaArray<Byte> read _GetbtAryReaderIdentifier write _SetbtAryReaderIdentifier;
    property btReturnLoss: Byte read _GetbtReturnLoss write _SetbtReturnLoss;
    property btImpedanceFrequency: Byte read _GetbtImpedanceFrequency write _SetbtImpedanceFrequency;
    property nUserDefineStartFrequency: Integer read _GetnUserDefineStartFrequency write _SetnUserDefineStartFrequency;
    property btUserDefineFrequencyInterval: Byte read _GetbtUserDefineFrequencyInterval write _SetbtUserDefineFrequencyInterval;
    property btUserDefineChannelQuantity: Byte read _GetbtUserDefineChannelQuantity write _SetbtUserDefineChannelQuantity;
    property btRfLinkProfile: Byte read _GetbtRfLinkProfile write _SetbtRfLinkProfile;
    property mMatchEpcValue: JString read _GetmMatchEpcValue write _SetmMatchEpcValue;
  end;

  TJReaderSetting = class(TJavaGenericImport<JReaderSettingClass, JReaderSetting>) end;

  JRXObserverClass = interface(JObjectClass)
  ['{9690B208-D5BB-4423-847D-061B75E09596}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXObserver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/RXObserver')]
  JRXObserver = interface(JObject)
  ['{C3AF0E8A-6D45-4209-ABC7-35FFC8008B3B}']
    { Property Methods }

    { methods }
//    procedure update(o: JObservable; arg: JObject); cdecl;

    { Property }
  end;

  TJRXObserver = class(TJavaGenericImport<JRXObserverClass, JRXObserver>) end;

  JConverterClass = interface(JObjectClass)
  ['{F9E9AC82-1F58-4D1F-A66D-1394BE25267D}']
    { static Property Methods }
    {class} function _GetLITTLE_ENDIAN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBIG_ENDIAN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JConverter; cdecl;
    {class} function getBytes(number: Integer; order: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function getBytes(number: Int64; order: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function getBytes(number: Word; order: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function byteToLong(b: TJavaArray<Byte>; order: Integer): Int64; cdecl;
    {class} function byteToInt(b: TJavaArray<Byte>; order: Integer): Integer; cdecl;
    {class} function byteToShort(b: TJavaArray<Byte>; order: Integer): Word; cdecl;
    {class} function byteToHex(i: Integer): Char; cdecl;

    { static Property }
    {class} property LITTLE_ENDIAN: Integer read _GetLITTLE_ENDIAN;
    {class} property BIG_ENDIAN: Integer read _GetBIG_ENDIAN;
  end;

  [JavaSignature('com/util/Converter')]
  JConverter = interface(JObject)
  ['{B4053F4E-84E5-4BDA-88A0-560B6E538A10}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConverter = class(TJavaGenericImport<JConverterClass, JConverter>) end;

  JStringToolClass = interface(JObjectClass)
  ['{B14F0753-48BC-425F-9D99-B7FD7AAE2EA4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JStringTool; cdecl;
    {class} function stringToByteArray(strHexValue: JString): TJavaArray<Byte>; cdecl;
    {class} function stringArrayToByteArray(strAryHex: TJavaObjectArray<JString>; nLen: Integer): TJavaArray<Byte>; cdecl;
    {class} function byteArrayToString(btAryHex: TJavaArray<Byte>; nIndex: Integer; nLen: Integer): JString; cdecl;
    {class} function stringToStringArray(strValue: JString; nLen: Integer): TJavaObjectArray<JString>; cdecl;
    {class} function getChars(bytes: TJavaArray<Byte>; encoding: JString): TJavaArray<Char>; cdecl; //Deprecated
    {class} function toASCIIString(hexString: JString): JString; cdecl; //Deprecated
    {class} function hexStringToASCIIString(hexString: JString): JString; cdecl;
    {class} function subBytes(bytes: TJavaArray<Byte>; start: Integer; aend: Integer): TJavaArray<Byte>; cdecl;
    {class} function subBytesContains(parentBytes: TJavaArray<Byte>; childBytes: TJavaArray<Byte>; startPosition: Integer): Integer; cdecl;
    {class} function hexStringToBytes(hexString: JString): TJavaArray<Byte>; cdecl;
    {class} function compareBytes(first: TJavaArray<Byte>; second: TJavaArray<Byte>): Boolean; cdecl;
    {class} function asciiStringToBytes(astring: JString): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/util/StringTool')]
  JStringTool = interface(JObject)
  ['{01CA68DA-7B6A-4D93-B8AF-E12FCF2F6484}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringTool = class(TJavaGenericImport<JStringToolClass, JStringTool>) end;

  JQueryMessageTranClass = interface(JObjectClass)
  ['{A50AEC27-F167-4C2F-BA2D-4D605D5CFAE2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JQueryMessageTran; cdecl; overload;
    {class} function init(rxData: TJavaArray<Byte>): JQueryMessageTran; cdecl; overload;
    {class} function checkSum(btAryBuffer: TJavaArray<Byte>; nStartPos: Integer; nLen: Integer): Byte; cdecl;
    {class} function buildQueryCMD(command: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/xdl2d/scanner/bean/QueryMessageTran')]
  JQueryMessageTran = interface(JObject)
  ['{1E0A68CF-C222-45CD-BE83-6CB69E4117FD}']
    { Property Methods }

    { methods }
    function getPrefix: TJavaArray<Byte>; cdecl;
    procedure setPrefix(prefix: TJavaArray<Byte>); cdecl;
    function getLens: TJavaArray<Byte>; cdecl;
    procedure setLens(lens: TJavaArray<Byte>); cdecl;
    function getType: Byte; cdecl;
    procedure setType(atype: Byte); cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    procedure setData(data: TJavaArray<Byte>); cdecl;
    function getAllData: TJavaArray<Byte>; cdecl;
    procedure setAllData(allData: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJQueryMessageTran = class(TJavaGenericImport<JQueryMessageTranClass, JQueryMessageTran>) end;

  JScannerSettingClass = interface(JObjectClass)
  ['{252E5EAA-45B9-41C3-AFAA-49E4E964D61B}']
    { static Property Methods }
    {class} function _GetDTAT_PREFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDTAT_SUFFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function newInstance: JScannerSetting; cdecl;

    { static Property }
    {class} property DTAT_PREFIX: JString read _GetDTAT_PREFIX;
    {class} property DTAT_SUFFIX: JString read _GetDTAT_SUFFIX;
  end;

  [JavaSignature('com/xdl2d/scanner/bean/ScannerSetting')]
  JScannerSetting = interface(JObject)
  ['{F9C38268-4ADA-4F46-BA99-6325839AFB6D}']
    { Property Methods }
    function _GetmReturnParameterValue: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmReturnParameterValue(amReturnParameterValue: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function defaultSettings: Boolean; cdecl;

    { Property }
    property mReturnParameterValue: JString read _GetmReturnParameterValue write _SetmReturnParameterValue;
  end;

  TJScannerSetting = class(TJavaGenericImport<JScannerSettingClass, JScannerSetting>) end;

  JRXCallbackClass = interface(JObjectClass)
  ['{D112D5D8-471F-40C5-9657-5F165CCD9DC5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/xdl2d/scanner/callback/RXCallback')]
  JRXCallback = interface(IJavaInstance)
  ['{2D32D65A-1071-4743-9FDB-7078958E83F8}']
    { Property Methods }

    { methods }
    procedure callback(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJRXCallback = class(TJavaGenericImport<JRXCallbackClass, JRXCallback>) end;

  JCommandClass = interface(JObjectClass)
  ['{49F9FE39-B7C0-478A-9176-CF4B9325B782}']
    { static Property Methods }
    {class} function _GetOPEN_CMD_SET_CODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLOSE_CMD_SET_CODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQUERY_CMD_SEND_PREFIX: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQUERY_CMD_SEND_TYPE: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQUERY_CMD_RETURN_PREFIX: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQUERY_CMD_RETURN_TYPE: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULTE_FACTORY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_VALUE_SYMBOL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_TRAIL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_CMD_PREFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPREFIX_CUSTOM_SET_CODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUFFIX_CUSTOM_SET_CODE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_APPEND_PRE_SUFFIX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCODE_ID_DISABLE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAIM_ID_DISABLE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTERMINAL_SYMBOL_DISABLE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_SET_SUCCESS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_SET_FAILD: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetASK: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREPLY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_INFORMATION: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSERIAL_NO: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetESN: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_OF_PRODUCTION: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBAUDRATE: TJavaObjectArray<JString>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCommand; cdecl;

    { static Property }
    {class} property OPEN_CMD_SET_CODE: JString read _GetOPEN_CMD_SET_CODE;
    {class} property CLOSE_CMD_SET_CODE: JString read _GetCLOSE_CMD_SET_CODE;
    {class} property QUERY_CMD_SEND_PREFIX: TJavaArray<Byte> read _GetQUERY_CMD_SEND_PREFIX;
    {class} property QUERY_CMD_SEND_TYPE: TJavaArray<Byte> read _GetQUERY_CMD_SEND_TYPE;
    {class} property QUERY_CMD_RETURN_PREFIX: TJavaArray<Byte> read _GetQUERY_CMD_RETURN_PREFIX;
    {class} property QUERY_CMD_RETURN_TYPE: TJavaArray<Byte> read _GetQUERY_CMD_RETURN_TYPE;
    {class} property DEFAULTE_FACTORY: JString read _GetDEFAULTE_FACTORY;
    {class} property SET_VALUE_SYMBOL: JString read _GetSET_VALUE_SYMBOL;
    {class} property CMD_TRAIL: JString read _GetCMD_TRAIL;
    {class} property SET_CMD_PREFIX: JString read _GetSET_CMD_PREFIX;
    {class} property PREFIX_CUSTOM_SET_CODE: JString read _GetPREFIX_CUSTOM_SET_CODE;
    {class} property SUFFIX_CUSTOM_SET_CODE: JString read _GetSUFFIX_CUSTOM_SET_CODE;
    {class} property ENABLE_APPEND_PRE_SUFFIX: JString read _GetENABLE_APPEND_PRE_SUFFIX;
    {class} property CODE_ID_DISABLE: JString read _GetCODE_ID_DISABLE;
    {class} property AIM_ID_DISABLE: JString read _GetAIM_ID_DISABLE;
    {class} property TERMINAL_SYMBOL_DISABLE: JString read _GetTERMINAL_SYMBOL_DISABLE;
    {class} property CMD_SET_SUCCESS: Byte read _GetCMD_SET_SUCCESS;
    {class} property CMD_SET_FAILD: Byte read _GetCMD_SET_FAILD;
    {class} property ASK: Byte read _GetASK;
    {class} property REPLY: Byte read _GetREPLY;
    {class} property VERSION_INFORMATION: TJavaArray<Byte> read _GetVERSION_INFORMATION;
    {class} property SERIAL_NO: TJavaArray<Byte> read _GetSERIAL_NO;
    {class} property ESN: TJavaArray<Byte> read _GetESN;
    {class} property DATA_OF_PRODUCTION: TJavaArray<Byte> read _GetDATA_OF_PRODUCTION;
    {class} property BAUDRATE: TJavaObjectArray<JString> read _GetBAUDRATE;
  end;

  [JavaSignature('com/xdl2d/scanner/config/Command')]
  JCommand = interface(JObject)
  ['{1B78B1C9-3218-443B-B08C-4E56FD6ED6F2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommand = class(TJavaGenericImport<JCommandClass, JCommand>) end;

  JTDScannerConnectorClass = interface(JObjectClass)
  ['{D0C583D1-DD98-439B-83EC-CBCC0C70ADCD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTDScannerConnector; cdecl;

    { static Property }
  end;

  [JavaSignature('com/xdl2d/scanner/TDScannerConnector')]
  JTDScannerConnector = interface(JObject)
  ['{7A8469B9-B33E-405A-9488-C964AB90BB50}']
    { Property Methods }

    { methods }
    function connectCom(port: JString; baud: Integer): Boolean; cdecl;
    function connect(host: JString; port: Integer): Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    procedure disConnect; cdecl;

    { Property }
  end;

  TJTDScannerConnector = class(TJavaGenericImport<JTDScannerConnectorClass, JTDScannerConnector>) end;

  JTDScannerDataPackageParserClass = interface(JObjectClass)
  ['{5B801FED-9917-4798-82EA-06073BCC4AE8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTDScannerDataPackageParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/xdl2d/scanner/TDScannerDataPackageParser')]
  JTDScannerDataPackageParser = interface(JObject)
  ['{DC6FED6B-1990-4294-8098-1DCC25AD554D}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(btAryReceiveData: TJavaArray<Byte>; dataPackageProcess: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJTDScannerDataPackageParser = class(TJavaGenericImport<JTDScannerDataPackageParserClass, JTDScannerDataPackageParser>) end;

  JTDScannerDataPackageProcessClass = interface(JDataPackageProcessClass) // or JObjectClass
  ['{DC2233AE-9249-4145-AF1C-26D571854421}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTDScannerDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/xdl2d/scanner/TDScannerDataPackageProcess')]
  JTDScannerDataPackageProcess = interface(JDataPackageProcess) // or JObject
  ['{BF5EEED0-4549-4F89-A825-20E7622BEF53}']
    { Property Methods }

    { methods }
    procedure analyData(btPackage: TJavaArray<Byte>); cdecl;
    procedure commandQueryValue(value: TJavaArray<Byte>); cdecl;
    procedure registQueryValue(callback: JRXCallback); cdecl;
    procedure commandSetStatus(status: Byte); cdecl;
    procedure registSetStatus(callback: JRXCallback); cdecl;
    procedure receive2DCodeData(data: TJavaArray<Byte>); cdecl;
    procedure regist2DCodeData(callback: JRXCallback); cdecl;

    { Property }
  end;

  TJTDScannerDataPackageProcess = class(TJavaGenericImport<JTDScannerDataPackageProcessClass, JTDScannerDataPackageProcess>) end;

  JTDScannerHelperClass = interface(JReaderHelperClass) // or JObjectClass
  ['{F29178E4-7887-49F7-B245-0D654D62005F}']
    { static Property Methods }

    { static Methods }
    {class} function getDefaultHelper: JTDScannerHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/xdl2d/scanner/TDScannerHelper')]
  JTDScannerHelper = interface(JReaderHelper) // or JObject
  ['{A53DA429-C7AF-4027-9607-3B63A182A35C}']
    { Property Methods }

    { methods }
    procedure signOut; cdecl;
    procedure setRunFlag(flag: Boolean); cdecl;
    function sendBuffer(btAryBuf: TJavaArray<Byte>): Integer; cdecl;
    procedure registQueryValue(callback: JRXCallback); cdecl;
    procedure registSetStatus(callback: JRXCallback); cdecl;
    procedure regist2DCodeData(callback: JRXCallback); cdecl;
    function reset: Integer; cdecl;
    function setScannerAttr(commandCode: TJavaArray<Byte>; parameter: TJavaArray<Byte>): Integer; cdecl; overload;
    function setScannerAttr(map: JMap): Integer; cdecl; overload;
    function queryScannerAttr(parameter: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJTDScannerHelper = class(TJavaGenericImport<JTDScannerHelperClass, JTDScannerHelper>) end;


{$ENDIF}


implementation

end.

