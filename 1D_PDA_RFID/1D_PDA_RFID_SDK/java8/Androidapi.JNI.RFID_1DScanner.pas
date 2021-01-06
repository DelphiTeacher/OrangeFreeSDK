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
//  生成时间：2020/12/26 21:08:52
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.RFID-1DScanner;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JDataPackageParser = interface; //com.module.interaction.DataPackageParser
  JDataPackageProcess = interface; //com.module.interaction.DataPackageProcess
  JModuleConnector = interface; //com.module.interaction.ModuleConnector
  JReaderHelper_1 = interface; //com.module.interaction.ReaderHelper$1
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
  JMessageTran_024 = interface; //com.scanner1d.bean.MessageTran
  JScannerSetting = interface; //com.scanner1d.bean.ScannerSetting
  JCommand_PARAM = interface; //com.scanner1d.config.Command$PARAM
  JCommand = interface; //com.scanner1d.config.Command
  JDATASRC = interface; //com.scanner1d.config.DATASRC
  JODScannerConnector = interface; //com.scanner1d.ODScannerConnector
  JODScannerDataPackageParser = interface; //com.scanner1d.ODScannerDataPackageParser
  JODScannerDataPackageProcess = interface; //com.scanner1d.ODScannerDataPackageProcess
  JODScannerHelper = interface; //com.scanner1d.ODScannerHelper
  JConverter = interface; //com.util.Converter
  JStringTool = interface; //com.util.StringTool

// ===== Forward SuperClasses declarations =====

  JReaderHelper_ReaderBaseClass = interface; //com.module.interaction.ReaderHelper$ReaderBase
  JDataPackageProcessClass = interface; //com.module.interaction.DataPackageProcess
  JReaderHelperClass = interface; //com.module.interaction.ReaderHelper

// ===== Interface declarations =====

  JDataPackageParserClass = interface(JObjectClass)
  ['{54FABC98-8C31-4630-B2E1-F32416D96C74}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/DataPackageParser')]
  JDataPackageParser = interface(IJavaInstance)
  ['{DFAA3BC7-29DC-4188-BC94-D4B9C0F17CCF}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(P1: TJavaArray<Byte>; P2: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJDataPackageParser = class(TJavaGenericImport<JDataPackageParserClass, JDataPackageParser>) end;

  JDataPackageProcessClass = interface(JObservableClass) // or JObjectClass
  ['{6557A4B7-B4E4-40D5-BE96-85F5550863A3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/DataPackageProcess')]
  JDataPackageProcess = interface(JObservable) // or JObject
  ['{D6B53B51-F3D1-479A-9F22-26A8172EC326}']
    { Property Methods }

    { methods }
    procedure analyData(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJDataPackageProcess = class(TJavaGenericImport<JDataPackageProcessClass, JDataPackageProcess>) end;

  JModuleConnectorClass = interface(JObjectClass)
  ['{788196B0-F184-4F8D-90BE-210D86C2AB3A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ModuleConnector')]
  JModuleConnector = interface(IJavaInstance)
  ['{064884B1-7363-472F-8FEB-D1EBDFF38E17}']
    { Property Methods }

    { methods }
    function connectCom(P1: JString; P2: Integer): Boolean; cdecl;
    function connect(P1: JString; P2: Integer): Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    procedure disConnect; cdecl;

    { Property }
  end;

  TJModuleConnector = class(TJavaGenericImport<JModuleConnectorClass, JModuleConnector>) end;

  JReaderHelper_1Class = interface(JReaderHelper_ReaderBaseClass) // or JObjectClass
  ['{FCBF0508-AE6B-4B33-96C9-A527C1CA3C50}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper$1')]
  JReaderHelper_1 = interface(JReaderHelper_ReaderBase) // or JObject
  ['{6B3423EC-D94D-4D4F-9A47-BCB09EA08A79}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReaderHelper_1 = class(TJavaGenericImport<JReaderHelper_1Class, JReaderHelper_1>) end;

  JReaderHelper_ReaderBase_WaitThreadClass = interface(JThreadClass) // or JObjectClass
  ['{62496026-3D3F-44C8-B3B3-B6F08A64198C}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JReaderHelper_ReaderBase): JReaderHelper_ReaderBase_WaitThread; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper$ReaderBase$WaitThread')]
  JReaderHelper_ReaderBase_WaitThread = interface(JThread) // or JObject
  ['{AFAE34E9-38AD-4DBE-B478-1DAC44F09C10}']
    { Property Methods }

    { methods }
    procedure run; cdecl;
    procedure signOut; cdecl;

    { Property }
  end;

  TJReaderHelper_ReaderBase_WaitThread = class(TJavaGenericImport<JReaderHelper_ReaderBase_WaitThreadClass, JReaderHelper_ReaderBase_WaitThread>) end;

  JReaderHelper_ReaderBaseClass = interface(JObjectClass)
  ['{D3805EC1-812D-4106-91B8-D9A3533B07A8}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JReaderHelper; ain: JInputStream; aout: JOutputStream; parser: JDataPackageParser; process: JDataPackageProcess): JReaderHelper_ReaderBase; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper$ReaderBase')]
  JReaderHelper_ReaderBase = interface(JObject)
  ['{6509C1C9-4ABD-4270-8DB7-77525C62A535}']
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

  JReaderHelperClass = interface(JObjectClass)
  ['{CF72E329-D814-494F-AA4A-C5F0BAAE9DBE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper')]
  JReaderHelper = interface(JObject)
  ['{F816F3AE-C9CA-46E1-8178-9A17F0149FA1}']
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
  ['{FC7F4512-11CB-48FE-94FE-F237C388B2C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/RXTXListener')]
  JRXTXListener = interface(IJavaInstance)
  ['{82822189-3A68-440E-A8C9-0FFAC94D6D96}']
    { Property Methods }

    { methods }
    procedure reciveData(P1: TJavaArray<Byte>); cdecl;
    procedure sendData(P1: TJavaArray<Byte>); cdecl;
    procedure onLostConnect; cdecl;

    { Property }
  end;

  TJRXTXListener = class(TJavaGenericImport<JRXTXListenerClass, JRXTXListener>) end;

  JMessageTranClass = interface(JObjectClass)
  ['{989C8264-B9E5-4A63-8A36-BBEC6E278166}']
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
  ['{A85F4B78-DE28-4FCB-88A8-AE447642AFDE}']
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
  ['{6A613758-284F-4416-9A00-0B511A2E7522}']
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
  ['{1BD1F5B8-E1AD-452B-9BED-7418C2357DB7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCMD = class(TJavaGenericImport<JCMDClass, JCMD>) end;

  JERRORClass = interface(JObjectClass)
  ['{277ADD0D-C4BC-4B33-976C-CF13F4C4F55B}']
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
  ['{F26FD984-F808-431F-9E0E-A5770DD1F274}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJERROR = class(TJavaGenericImport<JERRORClass, JERROR>) end;

  JHEADClass = interface(JObjectClass)
  ['{469D5C58-D25D-4FB0-A598-CBF7A3D44F61}']
    { static Property Methods }
    {class} function _GetHEAD: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHEAD; cdecl;

    { static Property }
    {class} property HEAD: Byte read _GetHEAD;
  end;

  [JavaSignature('com/rfid/config/HEAD')]
  JHEAD = interface(JObject)
  ['{475A01F9-C068-4649-A1FF-926C1CCBD66D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHEAD = class(TJavaGenericImport<JHEADClass, JHEAD>) end;

  JReaderConnectorClass = interface(JObjectClass)
  ['{B270AA57-C5D3-4C60-BBB6-90C454D69B23}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderConnector; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderConnector')]
  JReaderConnector = interface(JObject)
  ['{44A24227-BBB6-4B3F-95F9-1D7207C60521}']
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
  ['{45AE3EE4-5680-499F-A100-54A74DDBB1F3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderDataPackageParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderDataPackageParser')]
  JReaderDataPackageParser = interface(JObject)
  ['{704D5B16-7D34-4B7D-B9AA-C3258686CB1C}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(btAryReceiveData: TJavaArray<Byte>; dataPackageProcess: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJReaderDataPackageParser = class(TJavaGenericImport<JReaderDataPackageParserClass, JReaderDataPackageParser>) end;

  JReaderDataPackageProcessClass = interface(JDataPackageProcessClass) // or JObjectClass
  ['{EB1388D1-6B22-4F51-B1CD-B0EBECE66D9A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderDataPackageProcess')]
  JReaderDataPackageProcess = interface(JDataPackageProcess) // or JObject
  ['{61804A88-1F76-4628-839E-D9C01FC0D8DE}']
    { Property Methods }

    { methods }
    procedure analyData(btPackage: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJReaderDataPackageProcess = class(TJavaGenericImport<JReaderDataPackageProcessClass, JReaderDataPackageProcess>) end;

  JRFIDReaderHelperClass = interface(JReaderHelperClass) // or JObjectClass
  ['{979AAF4E-B446-40D2-91B7-B4B67DBF2293}']
    { static Property Methods }

    { static Methods }
    {class} function getDefaultHelper: JRFIDReaderHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/RFIDReaderHelper')]
  JRFIDReaderHelper = interface(JReaderHelper) // or JObject
  ['{C5372AF9-77AB-4522-A045-C0A9E7CCBD8A}']
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
  ['{684A0E31-3764-4A7A-BE76-58ECEB3486C6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventory6BTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventory6BTag')]
  JRXInventory6BTag = interface(JObject)
  ['{72B38D4F-CC9A-406E-B21B-B328C55D87AD}']
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
  ['{CD43594A-448E-4676-9453-B660B219C51B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag_RXFastSwitchAntInventoryTagEnd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag$RXFastSwitchAntInventoryTagEnd')]
  JRXInventoryTag_RXFastSwitchAntInventoryTagEnd = interface(JObject)
  ['{0EF4544D-DB54-4ECE-AD7E-BEC89CD22335}']
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
  ['{5A6D1DA1-F451-4C11-9D4E-7C313A4F13E6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag_RXInventoryTagEnd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag$RXInventoryTagEnd')]
  JRXInventoryTag_RXInventoryTagEnd = interface(JObject)
  ['{9A9108AD-C1B6-46A9-B843-F49EEE9032A7}']
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
  ['{05A517F3-929E-430A-BB44-5093C6B79F6C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag')]
  JRXInventoryTag = interface(JObject)
  ['{43D6F0C9-69E1-42B9-8944-DC37412412A7}']
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
  ['{04E29D76-8023-4CEF-A1DE-7B7A64E70935}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXOperationTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXOperationTag')]
  JRXOperationTag = interface(JObject)
  ['{C745D1D3-7700-4E44-8A56-E5E3F02EDFA3}']
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
  ['{197EADF2-2521-4506-92B7-59D07E17DD48}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: TJavaArray<Byte>): JReaderSetting_MaskMap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/ReaderSetting$MaskMap')]
  JReaderSetting_MaskMap = interface(JObject)
  ['{2081BE60-D23F-4BA0-8045-1D2D1F1BFCCF}']
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
  ['{3225BF7B-0821-49CB-95C2-BFB15F69FB28}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JReaderSetting; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/ReaderSetting')]
  JReaderSetting = interface(JObject)
  ['{6A20FE78-FD9E-49D6-A696-3F80A50B124D}']
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
  ['{8037AE0F-959D-471E-8918-352904723876}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXObserver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/RXObserver')]
  JRXObserver = interface(JObject)
  ['{5BA1DD70-3634-4E02-9CC9-015BF40EBA71}']
    { Property Methods }

    { methods }
    procedure update(o: JObservable; arg: JObject); cdecl;

    { Property }
  end;

  TJRXObserver = class(TJavaGenericImport<JRXObserverClass, JRXObserver>) end;

  JMessageTran_024Class = interface(JObjectClass)
  ['{0226FF49-1B7A-4737-96A9-D40B2134BCD1}']
    { static Property Methods }

    { static Methods }
    {class} function init(btReadId: Byte; btCmd: Byte; cmdStatus: Byte; btAryData: TJavaArray<Byte>): JMessageTran_024; cdecl; overload;
    {class} function init(btAryTranData: TJavaArray<Byte>): JMessageTran_024; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/bean/MessageTran')]
  JMessageTran_024 = interface(JObject)
  ['{86DB7E5E-9346-4FC6-A18D-6CF64CF0C007}']
    { Property Methods }

    { methods }
    function getAryTranData: TJavaArray<Byte>; cdecl;
    function getAryData: TJavaArray<Byte>; cdecl;
    function getReadId: Byte; cdecl;
    function getCmd: Byte; cdecl;
    function checkSum(btAryBuffer: TJavaArray<Byte>; nStartPos: Integer; nLen: Integer): TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJMessageTran_024 = class(TJavaGenericImport<JMessageTran_024Class, JMessageTran_024>) end;

  JScannerSettingClass = interface(JObjectClass)
  ['{6A4CA49D-8D40-4E25-AFAA-3BFA4E49A95F}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JScannerSetting; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/bean/ScannerSetting')]
  JScannerSetting = interface(JObject)
  ['{B44B416B-3E73-4230-A3D0-897AD7CA5C94}']
    { Property Methods }
    function _GetmBtReadId: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmBtReadId(amBtReadId: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmTimeOut: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmTimeOut(amTimeOut: Byte);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetmDecoderVersion: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetmDecoderVersion(amDecoderVersion: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property mBtReadId: Byte read _GetmBtReadId write _SetmBtReadId;
    property mTimeOut: Byte read _GetmTimeOut write _SetmTimeOut;
    property mDecoderVersion: TJavaArray<Byte> read _GetmDecoderVersion write _SetmDecoderVersion;
  end;

  TJScannerSetting = class(TJavaGenericImport<JScannerSettingClass, JScannerSetting>) end;

  JCommand_PARAMClass = interface(JObjectClass)
  ['{250ABC23-5F1C-44B8-8CEA-2CC537C28281}']
    { static Property Methods }
    {class} function _GetPARAM_STATUS: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBEEPER_VOLUME: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBEEPER_TONE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLASER_ON_TIME: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAIM_DURATION: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_ANGLE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOWER_MODE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRIGGER_MODE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTIME_OUT_BETWEEN_SAME_SYMBOL: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBEEP_AFTER_GOOD_DECODE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRANSMIT_NO_READ_MESSAGE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_SCANNING: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_PASS_THROUGH: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLINEAR_CODE_TYPE_SECURITY_LEVELS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBI_DIRECTIONAL_REDUNDANCY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPREFIX: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUFFIX1: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUFFIX2: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBAUD_RATE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARITY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSOFTWARE_HANDSHAKING: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDECODE_DATA_PACKAGE_FORMAT: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHOST_SERIAL_RESPONSE_TIME_OUT: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTOP_BIT_SELECT: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTERCHARACTER_DELAY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHOST_CHARACTER_TIME_OUT: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDECODE_EVENT: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBOOT_UP_EVENT: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAMETER_EVENT: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_TRAN_FORMAT: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_TRAN_FORMAT_VALUE: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCommand_PARAM; cdecl;

    { static Property }
    {class} property PARAM_STATUS: TJavaArray<Byte> read _GetPARAM_STATUS;
    {class} property BEEPER_VOLUME: Byte read _GetBEEPER_VOLUME;
    {class} property BEEPER_TONE: Byte read _GetBEEPER_TONE;
    {class} property LASER_ON_TIME: Byte read _GetLASER_ON_TIME;
    {class} property AIM_DURATION: Byte read _GetAIM_DURATION;
    {class} property SCAN_ANGLE: Byte read _GetSCAN_ANGLE;
    {class} property POWER_MODE: Byte read _GetPOWER_MODE;
    {class} property TRIGGER_MODE: Byte read _GetTRIGGER_MODE;
    {class} property TIME_OUT_BETWEEN_SAME_SYMBOL: Byte read _GetTIME_OUT_BETWEEN_SAME_SYMBOL;
    {class} property BEEP_AFTER_GOOD_DECODE: Byte read _GetBEEP_AFTER_GOOD_DECODE;
    {class} property TRANSMIT_NO_READ_MESSAGE: Byte read _GetTRANSMIT_NO_READ_MESSAGE;
    {class} property PARAMETER_SCANNING: Byte read _GetPARAMETER_SCANNING;
    {class} property PARAMETER_PASS_THROUGH: TJavaArray<Byte> read _GetPARAMETER_PASS_THROUGH;
    {class} property LINEAR_CODE_TYPE_SECURITY_LEVELS: Byte read _GetLINEAR_CODE_TYPE_SECURITY_LEVELS;
    {class} property BI_DIRECTIONAL_REDUNDANCY: Byte read _GetBI_DIRECTIONAL_REDUNDANCY;
    {class} property PREFIX: Byte read _GetPREFIX;
    {class} property SUFFIX1: Byte read _GetSUFFIX1;
    {class} property SUFFIX2: Byte read _GetSUFFIX2;
    {class} property BAUD_RATE: Byte read _GetBAUD_RATE;
    {class} property PARITY: Byte read _GetPARITY;
    {class} property SOFTWARE_HANDSHAKING: Byte read _GetSOFTWARE_HANDSHAKING;
    {class} property DECODE_DATA_PACKAGE_FORMAT: Byte read _GetDECODE_DATA_PACKAGE_FORMAT;
    {class} property HOST_SERIAL_RESPONSE_TIME_OUT: Byte read _GetHOST_SERIAL_RESPONSE_TIME_OUT;
    {class} property STOP_BIT_SELECT: Byte read _GetSTOP_BIT_SELECT;
    {class} property INTERCHARACTER_DELAY: Byte read _GetINTERCHARACTER_DELAY;
    {class} property HOST_CHARACTER_TIME_OUT: Byte read _GetHOST_CHARACTER_TIME_OUT;
    {class} property DECODE_EVENT: TJavaArray<Byte> read _GetDECODE_EVENT;
    {class} property BOOT_UP_EVENT: TJavaArray<Byte> read _GetBOOT_UP_EVENT;
    {class} property PARAMETER_EVENT: TJavaArray<Byte> read _GetPARAMETER_EVENT;
    {class} property SCAN_TRAN_FORMAT: Byte read _GetSCAN_TRAN_FORMAT;
    {class} property SCAN_TRAN_FORMAT_VALUE: TJavaArray<Byte> read _GetSCAN_TRAN_FORMAT_VALUE;
  end;

  [JavaSignature('com/scanner1d/config/Command$PARAM')]
  JCommand_PARAM = interface(JObject)
  ['{0BC42C1C-B01B-4031-986E-3E8A3CC167E3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommand_PARAM = class(TJavaGenericImport<JCommand_PARAMClass, JCommand_PARAM>) end;

  JCommandClass = interface(JObjectClass)
  ['{41C78B43-470E-454E-B045-CB6376F34F64}']
    { static Property Methods }
    {class} function _GetTestCmd: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHOST_MODE_SET: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_ACK: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_NCK: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWAKEUP: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAM_SEND: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAM_REQUEST: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPARAM_DEFAULT: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDECODE_DATA: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAIM_OFF: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAIM_ON: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBEEP: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBEEP_VALUE: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCAPABILITIES_REQUEST: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREQUEST_REVISION: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREPLY_REVISION: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBATCH_REQUEST: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHANGE_ALL_CODE_TYPES: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLUSH_QUEUE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetILLUMINATION_OFF: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetILLUMINATION_ON: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLED_OFF: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLED_ON: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTART_DECODE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSTOP_DECODE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_DISABLE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCAN_ENABLE: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSLEEP: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCommand; cdecl;

    { static Property }
    {class} property TestCmd: TJavaArray<Byte> read _GetTestCmd;
    {class} property HOST_MODE_SET: TJavaArray<Byte> read _GetHOST_MODE_SET;
    {class} property CMD_ACK: Byte read _GetCMD_ACK;
    {class} property CMD_NCK: Byte read _GetCMD_NCK;
    {class} property WAKEUP: Byte read _GetWAKEUP;
    {class} property PARAM_SEND: Byte read _GetPARAM_SEND;
    {class} property PARAM_REQUEST: Byte read _GetPARAM_REQUEST;
    {class} property PARAM_DEFAULT: Byte read _GetPARAM_DEFAULT;
    {class} property DECODE_DATA: Byte read _GetDECODE_DATA;
    {class} property AIM_OFF: Byte read _GetAIM_OFF;
    {class} property AIM_ON: Byte read _GetAIM_ON;
    {class} property BEEP: Byte read _GetBEEP;
    {class} property BEEP_VALUE: TJavaArray<Byte> read _GetBEEP_VALUE;
    {class} property CAPABILITIES_REQUEST: Byte read _GetCAPABILITIES_REQUEST;
    {class} property REQUEST_REVISION: Byte read _GetREQUEST_REVISION;
    {class} property REPLY_REVISION: Byte read _GetREPLY_REVISION;
    {class} property BATCH_REQUEST: Byte read _GetBATCH_REQUEST;
    {class} property CHANGE_ALL_CODE_TYPES: Byte read _GetCHANGE_ALL_CODE_TYPES;
    {class} property FLUSH_QUEUE: Byte read _GetFLUSH_QUEUE;
    {class} property ILLUMINATION_OFF: Byte read _GetILLUMINATION_OFF;
    {class} property ILLUMINATION_ON: Byte read _GetILLUMINATION_ON;
    {class} property LED_OFF: Byte read _GetLED_OFF;
    {class} property LED_ON: Byte read _GetLED_ON;
    {class} property START_DECODE: Byte read _GetSTART_DECODE;
    {class} property STOP_DECODE: Byte read _GetSTOP_DECODE;
    {class} property SCAN_DISABLE: Byte read _GetSCAN_DISABLE;
    {class} property SCAN_ENABLE: Byte read _GetSCAN_ENABLE;
    {class} property SLEEP: Byte read _GetSLEEP;
  end;

  [JavaSignature('com/scanner1d/config/Command')]
  JCommand = interface(JObject)
  ['{D3CE8FD1-F0DD-41C1-B385-49484085DFE9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommand = class(TJavaGenericImport<JCommandClass, JCommand>) end;

  JDATASRCClass = interface(JObjectClass)
  ['{58D81061-683F-4648-A48F-124C2F933A66}']
    { static Property Methods }
    {class} function _GetHOST: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSCANNER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDATASRC; cdecl;

    { static Property }
    {class} property HOST: Byte read _GetHOST;
    {class} property SCANNER: Byte read _GetSCANNER;
  end;

  [JavaSignature('com/scanner1d/config/DATASRC')]
  JDATASRC = interface(JObject)
  ['{497E2643-ECA7-402F-8816-707A4E6A3BB1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDATASRC = class(TJavaGenericImport<JDATASRCClass, JDATASRC>) end;

  JODScannerConnectorClass = interface(JObjectClass)
  ['{E2DF6C47-381B-468F-9DC1-231BC635D0B2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JODScannerConnector; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/ODScannerConnector')]
  JODScannerConnector = interface(JObject)
  ['{C2C71C59-D90F-4BE2-8B8A-E2E91690B0E5}']
    { Property Methods }

    { methods }
    function connectCom(port: JString; baud: Integer): Boolean; cdecl;
    function connect(host: JString; port: Integer): Boolean; cdecl;
    function isConnected: Boolean; cdecl;
    procedure disConnect; cdecl;

    { Property }
  end;

  TJODScannerConnector = class(TJavaGenericImport<JODScannerConnectorClass, JODScannerConnector>) end;

  JODScannerDataPackageParserClass = interface(JObjectClass)
  ['{5651F4D0-8E23-4BBB-9C61-87B2F99B1574}']
    { static Property Methods }

    { static Methods }
    {class} function init: JODScannerDataPackageParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/ODScannerDataPackageParser')]
  JODScannerDataPackageParser = interface(JObject)
  ['{A1BDD14F-B3D8-447B-9106-E90B9B0456AD}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(btAryReceiveData: TJavaArray<Byte>; dataPackageProcess: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJODScannerDataPackageParser = class(TJavaGenericImport<JODScannerDataPackageParserClass, JODScannerDataPackageParser>) end;

  JODScannerDataPackageProcessClass = interface(JDataPackageProcessClass) // or JObjectClass
  ['{74EF542F-C964-4AE6-B002-89BB917C14B2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JODScannerDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/ODScannerDataPackageProcess')]
  JODScannerDataPackageProcess = interface(JDataPackageProcess) // or JObject
  ['{3467B99C-3B41-4627-A10D-C5F2BA7B435C}']
    { Property Methods }

    { methods }
    procedure analyData(btPackage: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJODScannerDataPackageProcess = class(TJavaGenericImport<JODScannerDataPackageProcessClass, JODScannerDataPackageProcess>) end;

  JODScannerHelperClass = interface(JReaderHelperClass) // or JObjectClass
  ['{989DC652-83B9-4EEB-99DB-D393931F2395}']
    { static Property Methods }

    { static Methods }
    {class} function getDefaultHelper: JODScannerHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/ODScannerHelper')]
  JODScannerHelper = interface(JReaderHelper) // or JObject
  ['{8FF3B428-1B92-4246-B4BD-FB5FBFC07E06}']
    { Property Methods }

    { methods }
    procedure signOut; cdecl;
    procedure setRunFlag(flag: Boolean); cdecl;
    function sendBuffer(btAryBuf: TJavaArray<Byte>): Integer; cdecl;
    procedure init; cdecl;
    function reset(status: Byte): Integer; cdecl;
    function getPreSuffix(status: Byte): Integer; cdecl;
    function getRevision: Integer; cdecl;
    function getSerialcapabilities: Integer; cdecl;
    function getTimeOut: Integer; cdecl;
    function getParameters(paramList: TJavaArray<Byte>; status: Byte): Integer; cdecl;
    function getAllParameters(status: Byte): Integer; cdecl;
    function setTimeOut(time: Byte; status: Byte): Integer; cdecl;
    function setPowerMode(flag: Boolean; status: Byte): Integer; cdecl;
    function setLedOff: Integer; cdecl;
    function setLedOn: Integer; cdecl;
    function flushTranQueue: Integer; cdecl;
    function sendACK: Integer; cdecl;
    function sendNCK: Integer; cdecl;
    function setHandshaking(flag: Boolean; status: Byte): Integer; cdecl;
    function wakeUp: Integer; cdecl;
    function setDisableAllCodeTypes: Integer; cdecl;
    function requestBuffData: Integer; cdecl; //Deprecated
    function setAimOn: Integer; cdecl; //Deprecated
    function setAimOff: Integer; cdecl; //Deprecated
    function setScanDisable: Integer; cdecl;
    function setScanEnable: Integer; cdecl;
    function setSleep: Integer; cdecl;
    function setBeep(beepStyle: Byte; status: Byte): Integer; cdecl; //Deprecated
    function setPreSuffix(flag: Byte; status: Byte): Integer; cdecl;
    function setDecodeFormat(flag: Boolean; status: Byte): Integer; cdecl;
    function startScan: Integer; cdecl;
    function stopScan: Integer; cdecl;
    function setParameters(paramList: TJavaArray<Byte>; status: Byte): Integer; cdecl;
    procedure defaultSetting; cdecl;

    { Property }
  end;

  TJODScannerHelper = class(TJavaGenericImport<JODScannerHelperClass, JODScannerHelper>) end;

  JConverterClass = interface(JObjectClass)
  ['{71205AEA-2701-49C4-B2BC-D2F05463C1B6}']
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
  ['{E2E308A3-51DD-4CB9-887A-91AFB5D46405}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConverter = class(TJavaGenericImport<JConverterClass, JConverter>) end;

  JStringToolClass = interface(JObjectClass)
  ['{5D85B2A6-AD6A-44DF-8E83-D6D0DF8F9D12}']
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
  ['{FB3182E2-0A2B-4426-BA41-EC887E482E73}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringTool = class(TJavaGenericImport<JStringToolClass, JStringTool>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JDataPackageParser', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JDataPackageParser));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JDataPackageProcess', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JDataPackageProcess));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JModuleConnector', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JModuleConnector));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderHelper_1', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderHelper_1));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderHelper_ReaderBase_WaitThread', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderHelper_ReaderBase_WaitThread));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderHelper_ReaderBase', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderHelper_ReaderBase));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderHelper', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JRXTXListener', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JRXTXListener));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JMessageTran', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JMessageTran));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JCMD', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JCMD));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JERROR', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JERROR));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JHEAD', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JHEAD));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderConnector', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderConnector));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderDataPackageParser', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderDataPackageParser));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderDataPackageProcess', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderDataPackageProcess));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JRFIDReaderHelper', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JRFIDReaderHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JRXInventory6BTag', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JRXInventory6BTag));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JRXInventoryTag_RXFastSwitchAntInventoryTagEnd', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JRXInventoryTag_RXFastSwitchAntInventoryTagEnd));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JRXInventoryTag_RXInventoryTagEnd', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JRXInventoryTag_RXInventoryTagEnd));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JRXInventoryTag', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JRXInventoryTag));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JRXOperationTag', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JRXOperationTag));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderSetting_MaskMap', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderSetting_MaskMap));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JReaderSetting', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JReaderSetting));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JRXObserver', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JRXObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JMessageTran_024', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JMessageTran_024));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JScannerSetting', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JScannerSetting));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JCommand_PARAM', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JCommand_PARAM));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JCommand', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JCommand));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JDATASRC', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JDATASRC));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JODScannerConnector', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JODScannerConnector));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JODScannerDataPackageParser', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JODScannerDataPackageParser));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JODScannerDataPackageProcess', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JODScannerDataPackageProcess));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JODScannerHelper', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JODScannerHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JConverter', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JConverter));
  TRegTypes.RegisterType('Androidapi.JNI.RFID-1DScanner.JStringTool', 
    TypeInfo(Androidapi.JNI.RFID-1DScanner.JStringTool));
end;


initialization
  RegisterTypes;

end.
