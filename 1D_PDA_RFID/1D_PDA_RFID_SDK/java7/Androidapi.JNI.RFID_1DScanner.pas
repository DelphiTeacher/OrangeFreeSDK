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
//  生成时间：2020/12/26 20:54:11
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.RFID_1DScanner;

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
  ['{460A3D9E-DC4B-45D9-8FEF-812A1BDCC139}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/DataPackageParser')]
  JDataPackageParser = interface(IJavaInstance)
  ['{4546ED83-8197-48E9-9977-71B47A2DC3A0}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(P1: TJavaArray<Byte>; P2: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJDataPackageParser = class(TJavaGenericImport<JDataPackageParserClass, JDataPackageParser>) end;

  JDataPackageProcessClass = interface(JObjectClass) // or      JObservableClass
  ['{FCFBD2BF-BCF4-44C1-9622-2A9B2D9B9A29}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/DataPackageProcess')]
  JDataPackageProcess = interface(JObject) // or                JObservable
  ['{095C9AB2-C1EB-470B-BA67-445244AB5509}']
    { Property Methods }

    { methods }
    procedure analyData(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJDataPackageProcess = class(TJavaGenericImport<JDataPackageProcessClass, JDataPackageProcess>) end;

  JModuleConnectorClass = interface(JObjectClass)
  ['{46CCAE52-DFBE-4306-B576-D195DBFBEA5D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ModuleConnector')]
  JModuleConnector = interface(IJavaInstance)
  ['{4F0972EF-05CD-4291-98C2-BE46F204E38C}']
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
  ['{7D6F60E5-749C-4658-8BFB-1AD64A5C8C26}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JReaderHelper; ain: JInputStream; aout: JOutputStream; parser: JDataPackageParser; process: JDataPackageProcess): JReaderHelper_ReaderBase; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper$ReaderBase')]
  JReaderHelper_ReaderBase = interface(JObject)
  ['{6E19EA28-AD83-41A8-8EA6-EE5870B765C4}']
    { Property Methods }

    { methods }
    function IsAlive: Boolean; cdecl;
    procedure StartWait; cdecl;
    procedure signOut; cdecl;
    procedure registerObserver(observer: JObserver); cdecl;
    procedure unRegisterObserver(observer: JObserver); cdecl;
    procedure unRegisterObservers; cdecl;
    function sendBuffer(completeCMD: TJavaArray<Byte>): Integer; cdecl;

    { Property }
  end;

  TJReaderHelper_ReaderBase = class(TJavaGenericImport<JReaderHelper_ReaderBaseClass, JReaderHelper_ReaderBase>) end;


  JReaderHelper_1Class = interface(JReaderHelper_ReaderBaseClass) // or JObjectClass
  ['{EE9747C0-54B2-4899-8B5D-74A03F6181F1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper$1')]
  JReaderHelper_1 = interface(JReaderHelper_ReaderBase) // or JObject
  ['{991E1278-1F07-45EB-8507-3B8678F1C6B4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJReaderHelper_1 = class(TJavaGenericImport<JReaderHelper_1Class, JReaderHelper_1>) end;

  JReaderHelper_ReaderBase_WaitThreadClass = interface(JThreadClass) // or JObjectClass
  ['{CC464DE8-AF4C-4248-9156-786DAA28F4C4}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JReaderHelper_ReaderBase): JReaderHelper_ReaderBase_WaitThread; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper$ReaderBase$WaitThread')]
  JReaderHelper_ReaderBase_WaitThread = interface(JThread) // or JObject
  ['{8A08010F-0DD5-4AB3-949F-2EB65656580E}']
    { Property Methods }

    { methods }
    procedure run; cdecl;
    procedure signOut; cdecl;

    { Property }
  end;

  TJReaderHelper_ReaderBase_WaitThread = class(TJavaGenericImport<JReaderHelper_ReaderBase_WaitThreadClass, JReaderHelper_ReaderBase_WaitThread>) end;

  JReaderHelperClass = interface(JObjectClass)
  ['{134B931C-0F69-4037-A920-98DF5F3E4FDB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/module/interaction/ReaderHelper')]
  JReaderHelper = interface(JObject)
  ['{5411356E-3368-4E17-8008-1326EDAD9A94}']
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
  ['{32D42779-D173-433A-9B24-D47E207E30CB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/module/interaction/RXTXListener')]
  JRXTXListener = interface(IJavaInstance)
  ['{1DE32348-2EA0-428B-BCEE-AC5CD539BE5B}']
    { Property Methods }

    { methods }
    procedure reciveData(P1: TJavaArray<Byte>); cdecl;
    procedure sendData(P1: TJavaArray<Byte>); cdecl;
    procedure onLostConnect; cdecl;

    { Property }
  end;

  TJRXTXListener = class(TJavaGenericImport<JRXTXListenerClass, JRXTXListener>) end;

  JMessageTranClass = interface(JObjectClass)
  ['{4B1AD524-A171-442A-B10D-889D8BF127E4}']
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
  ['{70085F40-0BB3-43D4-8E9D-BA2803EAA8D0}']
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
  ['{4F4E0FB0-B232-4528-A717-C8CB40D67E84}']
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
  ['{7B6527FE-891F-452D-8C8C-86E7E97F924D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCMD = class(TJavaGenericImport<JCMDClass, JCMD>) end;

  JERRORClass = interface(JObjectClass)
  ['{3B2EAA2D-CD5E-48A8-A50F-6216D534E8D3}']
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
  ['{07B6863D-BA48-4BB9-9FD9-D20FFF580700}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJERROR = class(TJavaGenericImport<JERRORClass, JERROR>) end;

  JHEADClass = interface(JObjectClass)
  ['{9F668037-B540-40B2-AEA6-8F851F5A8BA4}']
    { static Property Methods }
    {class} function _GetHEAD: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHEAD; cdecl;

    { static Property }
    {class} property HEAD: Byte read _GetHEAD;
  end;

  [JavaSignature('com/rfid/config/HEAD')]
  JHEAD = interface(JObject)
  ['{36C77316-A6E3-439E-A706-D9BD875ED4A0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHEAD = class(TJavaGenericImport<JHEADClass, JHEAD>) end;

  JReaderConnectorClass = interface(JObjectClass)
  ['{881B985E-ECCA-42C9-B604-2C43A964E676}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderConnector; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderConnector')]
  JReaderConnector = interface(JObject)
  ['{465F5943-F0C1-4DF5-AF5B-BE7734E3759B}']
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
  ['{E88A62B1-AC2C-487E-B42E-D32917F4C5B6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderDataPackageParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderDataPackageParser')]
  JReaderDataPackageParser = interface(JObject)
  ['{439683BD-FEE5-46F6-961B-443A113398F4}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(btAryReceiveData: TJavaArray<Byte>; dataPackageProcess: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJReaderDataPackageParser = class(TJavaGenericImport<JReaderDataPackageParserClass, JReaderDataPackageParser>) end;

  JReaderDataPackageProcessClass = interface(JDataPackageProcessClass) // or JObjectClass
  ['{707EA080-AFC6-4CC9-B81C-9D22E4A13819}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/ReaderDataPackageProcess')]
  JReaderDataPackageProcess = interface(JDataPackageProcess) // or JObject
  ['{8D706B9B-5845-4DAC-A56C-A0021224F242}']
    { Property Methods }

    { methods }
    procedure analyData(btPackage: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJReaderDataPackageProcess = class(TJavaGenericImport<JReaderDataPackageProcessClass, JReaderDataPackageProcess>) end;

  JRFIDReaderHelperClass = interface(JReaderHelperClass) // or JObjectClass
  ['{5A433C58-0F7F-424F-A160-6060F0D0CD92}']
    { static Property Methods }

    { static Methods }
    {class} function getDefaultHelper: JRFIDReaderHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/RFIDReaderHelper')]
  JRFIDReaderHelper = interface(JReaderHelper) // or JObject
  ['{E9F19C96-25E3-460A-AE23-87A03F982A72}']
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
  ['{77B20AB2-C92A-4D04-BD15-185CC8F22B11}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventory6BTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventory6BTag')]
  JRXInventory6BTag = interface(JObject)
  ['{5FB7E2CC-2F69-41E7-8225-4728DDCD048C}']
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
  ['{46A69ACC-680A-4575-A76E-6D02619ED071}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag_RXFastSwitchAntInventoryTagEnd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag$RXFastSwitchAntInventoryTagEnd')]
  JRXInventoryTag_RXFastSwitchAntInventoryTagEnd = interface(JObject)
  ['{62642E1C-16AB-4994-BDCB-755682873CDC}']
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
  ['{2B47A24B-F89C-45A9-982A-4635C8439FB1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag_RXInventoryTagEnd; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag$RXInventoryTagEnd')]
  JRXInventoryTag_RXInventoryTagEnd = interface(JObject)
  ['{1D9CFB0B-D9E5-43A7-8DFA-5B9C84F648AA}']
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
  ['{3B3788CE-E26B-4431-A053-AD653537058F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXInventoryTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXInventoryTag')]
  JRXInventoryTag = interface(JObject)
  ['{D12A994B-5BA8-4F4D-A5EC-A2E08B639A6A}']
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
  ['{9280971A-3172-4659-9996-79A1648D14BB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXOperationTag; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/bean/RXOperationTag')]
  JRXOperationTag = interface(JObject)
  ['{1006BC75-A48C-4E93-B8EB-D5B3D0879813}']
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
  ['{4B9153CB-1B64-4899-B71B-1FEDDDBF6DFF}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: TJavaArray<Byte>): JReaderSetting_MaskMap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/ReaderSetting$MaskMap')]
  JReaderSetting_MaskMap = interface(JObject)
  ['{D257562B-CDB6-4729-8EE1-5285236321AD}']
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
  ['{3E577432-C9A7-4B30-8F86-CBD5932BDDBD}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JReaderSetting; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/ReaderSetting')]
  JReaderSetting = interface(JObject)
  ['{7F01BE0F-C3AE-41C1-BA5E-0D2113C78DDC}']
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
  ['{3E1D5E58-3902-47EC-B20E-7E7737074DD4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRXObserver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/rfid/rxobserver/RXObserver')]
  JRXObserver = interface(JObject)
  ['{46F9A2BC-6724-4C1C-98CE-BACD5F7EC66D}']
    { Property Methods }

    { methods }
//    procedure update(o: JObservable; arg: JObject); cdecl;

    { Property }
  end;

  TJRXObserver = class(TJavaGenericImport<JRXObserverClass, JRXObserver>) end;

  JMessageTran_024Class = interface(JObjectClass)
  ['{F864D488-7B62-4606-881A-ABD97E50E691}']
    { static Property Methods }

    { static Methods }
    {class} function init(btReadId: Byte; btCmd: Byte; cmdStatus: Byte; btAryData: TJavaArray<Byte>): JMessageTran_024; cdecl; overload;
    {class} function init(btAryTranData: TJavaArray<Byte>): JMessageTran_024; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/bean/MessageTran')]
  JMessageTran_024 = interface(JObject)
  ['{B297C304-9634-4281-8A90-70478B4CEE5A}']
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
  ['{B220078D-A3B5-49A1-9C8A-1981C5A36938}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JScannerSetting; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/bean/ScannerSetting')]
  JScannerSetting = interface(JObject)
  ['{1D67191E-A25F-43D2-8EBC-9CC937BA25A8}']
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
  ['{E96C8B50-D1E7-4075-8467-EE7EA521B3D8}']
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
  ['{39639070-3AA7-4B3E-B281-24650360FFD9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommand_PARAM = class(TJavaGenericImport<JCommand_PARAMClass, JCommand_PARAM>) end;

  JCommandClass = interface(JObjectClass)
  ['{D9D0C0BD-1E2A-45FF-AE3B-E194A61E419A}']
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
  ['{8D7A1C31-D96E-42D2-B8CC-5BA15845D3BD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommand = class(TJavaGenericImport<JCommandClass, JCommand>) end;

  JDATASRCClass = interface(JObjectClass)
  ['{6E4BC436-C7DC-4805-BB2A-48D104C7A370}']
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
  ['{664F6FAF-872C-4C46-A359-CC9E9528C9C2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDATASRC = class(TJavaGenericImport<JDATASRCClass, JDATASRC>) end;

  JODScannerConnectorClass = interface(JObjectClass)
  ['{48AE0D6A-5FB2-4F6D-B255-684D25CFC7A8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JODScannerConnector; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/ODScannerConnector')]
  JODScannerConnector = interface(JObject)
  ['{88E6A9E6-BF78-4962-9490-303D0EB9B43A}']
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
  ['{E05E4796-012C-4BD6-977A-309C5F1381E1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JODScannerDataPackageParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/ODScannerDataPackageParser')]
  JODScannerDataPackageParser = interface(JObject)
  ['{480E9102-7A2E-4358-A710-390850B9BD52}']
    { Property Methods }

    { methods }
    procedure runReceiveDataCallback(btAryReceiveData: TJavaArray<Byte>; dataPackageProcess: JDataPackageProcess); cdecl;

    { Property }
  end;

  TJODScannerDataPackageParser = class(TJavaGenericImport<JODScannerDataPackageParserClass, JODScannerDataPackageParser>) end;

  JODScannerDataPackageProcessClass = interface(JDataPackageProcessClass) // or JObjectClass
  ['{7CCF674E-D8CC-4245-A2F5-49DA7CA1FCC3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JODScannerDataPackageProcess; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/ODScannerDataPackageProcess')]
  JODScannerDataPackageProcess = interface(JDataPackageProcess) // or JObject
  ['{C6D301FC-954B-42C0-BCCE-8663F2712EC0}']
    { Property Methods }

    { methods }
    procedure analyData(btPackage: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJODScannerDataPackageProcess = class(TJavaGenericImport<JODScannerDataPackageProcessClass, JODScannerDataPackageProcess>) end;

  JODScannerHelperClass = interface(JReaderHelperClass) // or JObjectClass
  ['{6DFFD8A3-E976-4DDE-B052-E11F5EBAD860}']
    { static Property Methods }

    { static Methods }
    {class} function getDefaultHelper: JODScannerHelper; cdecl;

    { static Property }
  end;

  [JavaSignature('com/scanner1d/ODScannerHelper')]
  JODScannerHelper = interface(JReaderHelper) // or JObject
  ['{F6086AD2-3427-4EBC-923C-424413DC08DF}']
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

    { Property }
  end;

  TJODScannerHelper = class(TJavaGenericImport<JODScannerHelperClass, JODScannerHelper>) end;

  JConverterClass = interface(JObjectClass)
  ['{7779DB2D-3F77-427D-AB86-1CB43E87ECD2}']
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
  ['{C49F9D04-F073-4F32-8E55-04C0F408BB95}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConverter = class(TJavaGenericImport<JConverterClass, JConverter>) end;

  JStringToolClass = interface(JObjectClass)
  ['{9FA4C7D6-EB86-45C0-AA5E-CA3E4858CBA3}']
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
  ['{C9000B01-F2FB-4582-8EBF-9FB7D8651388}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringTool = class(TJavaGenericImport<JStringToolClass, JStringTool>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JDataPackageParser',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JDataPackageParser));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JDataPackageProcess',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JDataPackageProcess));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JModuleConnector',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JModuleConnector));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderHelper_1',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderHelper_1));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderHelper_ReaderBase_WaitThread',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderHelper_ReaderBase_WaitThread));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderHelper_ReaderBase',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderHelper_ReaderBase));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderHelper',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JRXTXListener',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JRXTXListener));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JMessageTran',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JMessageTran));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JCMD',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JCMD));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JERROR',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JERROR));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JHEAD',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JHEAD));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderConnector',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderConnector));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderDataPackageParser',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderDataPackageParser));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderDataPackageProcess',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderDataPackageProcess));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JRFIDReaderHelper',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JRFIDReaderHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JRXInventory6BTag',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JRXInventory6BTag));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JRXInventoryTag_RXFastSwitchAntInventoryTagEnd',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JRXInventoryTag_RXFastSwitchAntInventoryTagEnd));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JRXInventoryTag_RXInventoryTagEnd',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JRXInventoryTag_RXInventoryTagEnd));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JRXInventoryTag',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JRXInventoryTag));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JRXOperationTag',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JRXOperationTag));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderSetting_MaskMap',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderSetting_MaskMap));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JReaderSetting',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JReaderSetting));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JRXObserver',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JRXObserver));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JMessageTran_024',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JMessageTran_024));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JScannerSetting',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JScannerSetting));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JCommand_PARAM',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JCommand_PARAM));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JCommand',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JCommand));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JDATASRC',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JDATASRC));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JODScannerConnector',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JODScannerConnector));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JODScannerDataPackageParser',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JODScannerDataPackageParser));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JODScannerDataPackageProcess',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JODScannerDataPackageProcess));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JODScannerHelper',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JODScannerHelper));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JConverter',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JConverter));
  TRegTypes.RegisterType('Androidapi.JNI.RFID_1DScanner.JStringTool',
    TypeInfo(Androidapi.JNI.RFID_1DScanner.JStringTool));
end;


initialization
  RegisterTypes;

end.
