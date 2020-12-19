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
//  生成时间：2020/12/13 20:35:32
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.os, 
  Androidapi.JNI.GraphicsContentViewText;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.sunmi.rfid.BuildConfig
  JCMD = interface; //com.sunmi.rfid.constant.CMD
  JParamCts = interface; //com.sunmi.rfid.constant.ParamCts
//  JDataParameter_1 = interface; //com.sunmi.rfid.entity.DataParameter$1
  JDataParameter = interface; //com.sunmi.rfid.entity.DataParameter
  JIReaderCall_Stub_Proxy = interface; //com.sunmi.rfid.IReaderCall$Stub$Proxy
  JIReaderCall_Stub = interface; //com.sunmi.rfid.IReaderCall$Stub
  JIReaderCall = interface; //com.sunmi.rfid.IReaderCall
  JIScanRFIDInterface_Stub_Proxy = interface; //com.sunmi.rfid.IScanRFIDInterface$Stub$Proxy
  JIScanRFIDInterface_Stub = interface; //com.sunmi.rfid.IScanRFIDInterface$Stub
  JIScanRFIDInterface = interface; //com.sunmi.rfid.IScanRFIDInterface
  JReaderCall = interface; //com.sunmi.rfid.ReaderCall
  JRFIDHelper_Call = interface; //com.sunmi.rfid.RFIDHelper$Call
  JRFIDHelper = interface; //com.sunmi.rfid.RFIDHelper
//  JRFIDManager_1 = interface; //com.sunmi.rfid.RFIDManager$1
  JRFIDManager_SingletonInstance = interface; //com.sunmi.rfid.RFIDManager$SingletonInstance
  JRFIDManager = interface; //com.sunmi.rfid.RFIDManager
  JServicesHelper = interface; //com.sunmi.rfid.ServicesHelper

// ===== Forward SuperClasses declarations =====

  JIReaderCall_StubClass = interface; //com.sunmi.rfid.IReaderCall$Stub

// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{DE9DDEA2-DC69-49DC-851F-6F69AD45D12A}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JBuildConfig; cdecl; //()V

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/sunmi/rfid/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{053068F3-766D-4AA0-BA8C-AE6E9B41A9CE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JCMDClass = interface(JObjectClass)
  ['{26A58E1D-3310-49BA-86AE-0908475B9D25}']
    { static Property Methods }
    {class} function _GetINVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetREAD_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetWRITE_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetLOCK_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetKILL_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetSET_ACCESS_EPC_MATCH: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetGET_ACCESS_EPC_MATCH: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetREAL_TIME_INVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetFAST_SWITCH_ANT_INVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetCUSTOMIZED_SESSION_TARGET_INVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetSET_IMPINJ_FAST_TID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetSET_AND_SAVE_IMPINJ_FAST_TID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetGET_IMPINJ_FAST_TID: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetISO18000_6B_INVENTORY: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetISO18000_6B_READ_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetISO18000_6B_WRITE_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetISO18000_6B_LOCK_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetISO18000_6B_QUERY_LOCK_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetGET_INVENTORY_BUFFER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetGET_AND_RESET_INVENTORY_BUFFER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetGET_INVENTORY_BUFFER_TAG_COUNT: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetRESET_INVENTORY_BUFFER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B

    { static Methods }
    {class} function init: JCMD; cdecl; //()V

    { static Property }
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
  end;

  [JavaSignature('com/sunmi/rfid/constant/CMD')]
  JCMD = interface(JObject)
  ['{C6BE25C6-C993-4B11-9D29-3ABEE12CE3F5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCMD = class(TJavaGenericImport<JCMDClass, JCMD>) end;

  JParamCtsClass = interface(JObjectClass)
  ['{628C511A-0F15-4730-88D0-53C4B9E3BE77}']
    { static Property Methods }
    {class} function _GetBROADCAST_UN_FOUND_READER: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBROADCAST_ON_LOST_CONNECT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBROADCAST_BATTER_LOW_ELEC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetSUCCESS: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetFAIL: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetFOUND_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetUPDATE_TAG: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetUN_CHECK_READER: Byte;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //B
    {class} function _GetANT_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetCOUNT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetREAD_RATE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetDATA_COUNT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetSTART_TIME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetEND_TIME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_PC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_EPC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_CRC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_RSSI: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_READ_COUNT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_FREQ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_TIME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_DATA: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_DATA_LEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_ANT_1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_ANT_2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_ANT_3: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_ANT_4: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetCOMMAND_DURATION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_ACCESS_EPC_MATCH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_MONZA_STATUS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetTAG_STATUS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBATTERY_REMAINING_PERCENT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JParamCts; cdecl; //()V

    { static Property }
    {class} property BROADCAST_UN_FOUND_READER: JString read _GetBROADCAST_UN_FOUND_READER;
    {class} property BROADCAST_ON_LOST_CONNECT: JString read _GetBROADCAST_ON_LOST_CONNECT;
    {class} property BROADCAST_BATTER_LOW_ELEC: JString read _GetBROADCAST_BATTER_LOW_ELEC;
    {class} property SUCCESS: Byte read _GetSUCCESS;
    {class} property FAIL: Byte read _GetFAIL;
    {class} property FOUND_TAG: Byte read _GetFOUND_TAG;
    {class} property UPDATE_TAG: Byte read _GetUPDATE_TAG;
    {class} property UN_CHECK_READER: Byte read _GetUN_CHECK_READER;
    {class} property ANT_ID: JString read _GetANT_ID;
    {class} property COUNT: JString read _GetCOUNT;
    {class} property READ_RATE: JString read _GetREAD_RATE;
    {class} property DATA_COUNT: JString read _GetDATA_COUNT;
    {class} property START_TIME: JString read _GetSTART_TIME;
    {class} property END_TIME: JString read _GetEND_TIME;
    {class} property TAG: JString read _GetTAG;
    {class} property TAG_UID: JString read _GetTAG_UID;
    {class} property TAG_PC: JString read _GetTAG_PC;
    {class} property TAG_EPC: JString read _GetTAG_EPC;
    {class} property TAG_CRC: JString read _GetTAG_CRC;
    {class} property TAG_RSSI: JString read _GetTAG_RSSI;
    {class} property TAG_READ_COUNT: JString read _GetTAG_READ_COUNT;
    {class} property TAG_FREQ: JString read _GetTAG_FREQ;
    {class} property TAG_TIME: JString read _GetTAG_TIME;
    {class} property TAG_DATA: JString read _GetTAG_DATA;
    {class} property TAG_DATA_LEN: JString read _GetTAG_DATA_LEN;
    {class} property TAG_ANT_1: JString read _GetTAG_ANT_1;
    {class} property TAG_ANT_2: JString read _GetTAG_ANT_2;
    {class} property TAG_ANT_3: JString read _GetTAG_ANT_3;
    {class} property TAG_ANT_4: JString read _GetTAG_ANT_4;
    {class} property COMMAND_DURATION: JString read _GetCOMMAND_DURATION;
    {class} property TAG_ACCESS_EPC_MATCH: JString read _GetTAG_ACCESS_EPC_MATCH;
    {class} property TAG_MONZA_STATUS: JString read _GetTAG_MONZA_STATUS;
    {class} property TAG_STATUS: JString read _GetTAG_STATUS;
    {class} property BATTERY_REMAINING_PERCENT: JString read _GetBATTERY_REMAINING_PERCENT;
  end;

  [JavaSignature('com/sunmi/rfid/constant/ParamCts')]
  JParamCts = interface(JObject)
  ['{11C6CDE5-8ED3-430B-B427-D8E53272F96B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJParamCts = class(TJavaGenericImport<JParamCtsClass, JParamCts>) end;

//  JDataParameter_1Class = interface(JObjectClass)
//  ['{CCA1C023-71F0-4734-A192-38CD92D816F6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/rfid/entity/DataParameter$1')]
//  JDataParameter_1 = interface(JObject)
//  ['{2DA98F63-F2AA-441D-8FFB-57AD1F73C1B2}']
//    { Property Methods }
//
//    { methods }
//    function createFromParcel(ain: JParcel): JDataParameter; cdecl; overload; //(Landroid/os/Parcel;)Lcom/sunmi/rfid/entity/DataParameter;
//    function newArray(size: Integer): TJavaObjectArray<JDataParameter>; cdecl; overload; //(I)[Lcom/sunmi/rfid/entity/DataParameter;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;
//
//    { Property }
//  end;

//  TJDataParameter_1 = class(TJavaGenericImport<JDataParameter_1Class, JDataParameter_1>) end;

  JDataParameterClass = interface(JObjectClass)
  ['{EA6862F1-DAC4-47F5-B53F-58302ABEAB31}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init: JDataParameter; cdecl; overload; //()V
    {class} function init(data: JDataParameter): JDataParameter; cdecl; overload; //(Lcom/sunmi/rfid/entity/DataParameter;)V
    {class} function init(map: JMap): JDataParameter; cdecl; overload; //(Ljava/util/Map;)V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/rfid/entity/DataParameter')]
  JDataParameter = interface(JObject)
  ['{0321F51E-2381-4D7F-B77D-5EA81DC226DB}']
    { Property Methods }

    { methods }
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function containsKey(key: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
    function containsValue(value: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function isEmpty: Boolean; cdecl; //()Z
    function get(key: JString): JObject; cdecl; //(Ljava/lang/String;)Ljava/lang/Object;
    function put(key: JString; value: JObject): JObject; cdecl; //(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    procedure clear; cdecl; //()V
    procedure remove(key: JString); cdecl; //(Ljava/lang/String;)V
    function size: Integer; cdecl; //()I
    procedure putAll(map: JMap); cdecl; overload; //(Ljava/util/Map;)V
    procedure putAll(map: JDataParameter); cdecl; overload; //(Lcom/sunmi/rfid/entity/DataParameter;)V
    function keySet: JSet; cdecl; //()Ljava/util/Set;
    function getBoolean(key: JString): Boolean; cdecl; overload; //(Ljava/lang/String;)Z
    function getBoolean(key: JString; defaultValue: Boolean): Boolean; cdecl; overload; //(Ljava/lang/String;Z)Z
    function getByte(key: JString): Byte; cdecl; overload; //(Ljava/lang/String;)B
    function getByte(key: JString; defaultValue: Byte): JByte; cdecl; overload; //(Ljava/lang/String;B)Ljava/lang/Byte;
    function getChar(key: JString): Char; cdecl; overload; //(Ljava/lang/String;)C
    function getChar(key: JString; defaultValue: Char): Char; cdecl; overload; //(Ljava/lang/String;C)C
    function getShort(key: JString): Word; cdecl; overload; //(Ljava/lang/String;)S
    function getShort(key: JString; defaultValue: Word): Word; cdecl; overload; //(Ljava/lang/String;S)S
    function getInt(key: JString): Integer; cdecl; overload; //(Ljava/lang/String;)I
    function getInt(key: JString; defaultValue: Integer): Integer; cdecl; overload; //(Ljava/lang/String;I)I
    function getLong(key: JString): Int64; cdecl; overload; //(Ljava/lang/String;)J
    function getLong(key: JString; defaultValue: Int64): Int64; cdecl; overload; //(Ljava/lang/String;J)J
    function getFloat(key: JString): Single; cdecl; overload; //(Ljava/lang/String;)F
    function getFloat(key: JString; defaultValue: Single): Single; cdecl; overload; //(Ljava/lang/String;F)F
    function getDouble(key: JString): Double; cdecl; overload; //(Ljava/lang/String;)D
    function getDouble(key: JString; defaultValue: Double): Double; cdecl; overload; //(Ljava/lang/String;D)D
    function getString(key: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    function getString(key: JString; defaultValue: JString): JString; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    function getCharSequence(key: JString): JCharSequence; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/CharSequence;
    function getCharSequence(key: JString; defaultValue: JCharSequence): JCharSequence; cdecl; overload; //(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    function getIntegerArrayList(key: JString): JArrayList; cdecl; //(Ljava/lang/String;)Ljava/util/ArrayList;
    function getStringArrayList(key: JString): JArrayList; cdecl; //(Ljava/lang/String;)Ljava/util/ArrayList;
    function getCharSequenceArrayList(key: JString): JArrayList; cdecl; //(Ljava/lang/String;)Ljava/util/ArrayList;
    function getBooleanArray(key: JString): TJavaArray<Boolean>; cdecl; //(Ljava/lang/String;)[Z
    function getByteArray(key: JString): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;)[B
    function getShortArray(key: JString): TJavaArray<Word>; cdecl; //(Ljava/lang/String;)[S
    function getCharArray(key: JString): TJavaArray<Char>; cdecl; //(Ljava/lang/String;)[C
    function getIntArray(key: JString): TJavaArray<Integer>; cdecl; //(Ljava/lang/String;)[I
    function getLongArray(key: JString): TJavaArray<Int64>; cdecl; //(Ljava/lang/String;)[J
    function getFloatArray(key: JString): TJavaArray<Single>; cdecl; //(Ljava/lang/String;)[F
    function getDoubleArray(key: JString): TJavaArray<Double>; cdecl; //(Ljava/lang/String;)[D
    function getStringArray(key: JString): TJavaObjectArray<JString>; cdecl; //(Ljava/lang/String;)[Ljava/lang/String;
    function getCharSequenceArray(key: JString): TJavaObjectArray<JCharSequence>; cdecl; //(Ljava/lang/String;)[Ljava/lang/CharSequence;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDataParameter = class(TJavaGenericImport<JDataParameterClass, JDataParameter>) end;

  JIReaderCall_Stub_ProxyClass = interface(JObjectClass)
  ['{50E1A590-0270-41C0-9FDC-16D7EA00FD41}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/IReaderCall$Stub$Proxy')]
  JIReaderCall_Stub_Proxy = interface(JObject)
  ['{0282DC5B-35AF-4EEE-B00A-646E4E447042}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    procedure onSuccess(cmd: Byte; params: JDataParameter); cdecl; //(BLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onTag(cmd: Byte; state: Byte; tag: JDataParameter); cdecl; //(BBLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onFiled(cmd: Byte; errorCode: Byte; msg: JString); cdecl; //(BBLjava/lang/String;)V

    { Property }
  end;

  TJIReaderCall_Stub_Proxy = class(TJavaGenericImport<JIReaderCall_Stub_ProxyClass, JIReaderCall_Stub_Proxy>) end;

  JIReaderCall_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{8ACD24FD-03B6-464C-ADBC-E006C02AAFF6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIReaderCall_Stub; cdecl; //()V
    {class} function asInterface(obj: JIBinder): JIReaderCall; cdecl; //(Landroid/os/IBinder;)Lcom/sunmi/rfid/IReaderCall;

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/IReaderCall$Stub')]
  JIReaderCall_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{C83761A8-449E-4499-ABE0-C1B72B6D9E39}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIReaderCall_Stub = class(TJavaGenericImport<JIReaderCall_StubClass, JIReaderCall_Stub>) end;

  JIReaderCallClass = interface(JObjectClass)
  ['{0F023254-D1A0-49AC-920F-290B81DFEA64}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/IReaderCall')]
  JIReaderCall = interface(IJavaInstance)
  ['{5FEE3250-5F5B-440A-840C-0174F20BB36F}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: Byte; P2: JDataParameter); cdecl; //(BLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onTag(P1: Byte; P2: Byte; P3: JDataParameter); cdecl; //(BBLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onFiled(P1: Byte; P2: Byte; P3: JString); cdecl; //(BBLjava/lang/String;)V

    { Property }
  end;

  TJIReaderCall = class(TJavaGenericImport<JIReaderCallClass, JIReaderCall>) end;

  JIScanRFIDInterface_Stub_ProxyClass = interface(JObjectClass)
  ['{CCB5ED2E-7C8D-4BCE-A901-DAE19A389889}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/IScanRFIDInterface$Stub$Proxy')]
  JIScanRFIDInterface_Stub_Proxy = interface(JObject)
  ['{F65F527F-C6C2-40E9-B523-5CD944970736}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    function getScanModel: Integer; cdecl; //()I
    procedure registerReaderCall(call: JIReaderCall); cdecl; //(Lcom/sunmi/rfid/IReaderCall;)V
    procedure unregisterReaderCall; cdecl; //()V
    procedure inventory(btRepeat: Byte); cdecl; //(B)V
    procedure realTimeInventory(btRepeat: Byte); cdecl; //(B)V
    procedure customizedSessionTargetInventory(btSession: Byte; btTarget: Byte; btSL: Byte; btPhase: Byte; btPowerSave: Byte; btRepeat: Byte); cdecl; //(BBBBBB)V
    procedure fastSwitchAntInventory(btA: Byte; btStayA: Byte; btB: Byte; btStayB: Byte; btC: Byte; btStayC: Byte; btD: Byte; btStayD: Byte; btInterval: Byte; btRepeat: Byte); cdecl; //(BBBBBBBBBB)V
    procedure readTag(btMemBank: Byte; btWordAdd: Byte; btWordCnt: Byte; btAryPassWord: TJavaArray<Byte>); cdecl; //(BBB[B)V
    procedure writeTag(btAryPassWord: TJavaArray<Byte>; btMemBank: Byte; btWordAdd: Byte; btWordCnt: Byte; btAryData: TJavaArray<Byte>); cdecl; //([BBBB[B)V
    procedure lockTag(btAryPassWord: TJavaArray<Byte>; btMemBank: Byte; btLockType: Byte); cdecl; //([BBB)V
    procedure killTag(btAryPassWord: TJavaArray<Byte>); cdecl; //([B)V
    procedure setAccessEpcMatch(btEpcLen: Byte; btAryEpc: TJavaArray<Byte>); cdecl; //(B[B)V
    procedure cancelAccessEpcMatch; cdecl; //()V
    procedure getAccessEpcMatch; cdecl; //()V
    procedure setImpinjFastTid(blnOpen: Boolean; blnSave: Boolean); cdecl; //(ZZ)V
    procedure getImpinjFastTid; cdecl; //()V
    procedure iso180006BInventory; cdecl; //()V
    procedure iso180006BReadTag(btAryUID: TJavaArray<Byte>; btWordAdd: Byte; btWordCnt: Byte); cdecl; //([BBB)V
    procedure iso180006BWriteTag(btAryUID: TJavaArray<Byte>; btWordAdd: Byte; btWordCnt: Byte; btAryBuffer: TJavaArray<Byte>); cdecl; //([BBB[B)V
    procedure iso180006BLockTag(btAryUID: TJavaArray<Byte>; btWordAdd: Byte); cdecl; //([BB)V
    procedure iso180006BQueryLockTag(btAryUID: TJavaArray<Byte>; btWordAdd: Byte); cdecl; //([BB)V
    procedure getInventoryBuffer; cdecl; //()V
    procedure getAndResetInventoryBuffer; cdecl; //()V
    procedure getInventoryBufferTagCount; cdecl; //()V
    procedure resetInventoryBuffer; cdecl; //()V

    { Property }
  end;

  TJIScanRFIDInterface_Stub_Proxy = class(TJavaGenericImport<JIScanRFIDInterface_Stub_ProxyClass, JIScanRFIDInterface_Stub_Proxy>) end;

  JIScanRFIDInterface_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{37A29A6E-0490-4339-A198-2652849A0DA3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIScanRFIDInterface_Stub; cdecl; //()V
    {class} function asInterface(obj: JIBinder): JIScanRFIDInterface; cdecl; //(Landroid/os/IBinder;)Lcom/sunmi/rfid/IScanRFIDInterface;

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/IScanRFIDInterface$Stub')]
  JIScanRFIDInterface_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{DA120F82-253E-4465-947A-002C5E3155B0}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIScanRFIDInterface_Stub = class(TJavaGenericImport<JIScanRFIDInterface_StubClass, JIScanRFIDInterface_Stub>) end;

  JIScanRFIDInterfaceClass = interface(JObjectClass)
  ['{31268AA4-C818-4B50-A1B1-4351EDF5BC88}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/IScanRFIDInterface')]
  JIScanRFIDInterface = interface(IJavaInstance)
  ['{F32071D6-035B-4A4F-BA1E-BC1AAB7EB0B9}']
    { Property Methods }

    { methods }
    function getScanModel: Integer; cdecl; //()I
    procedure registerReaderCall(P1: JIReaderCall); cdecl; //(Lcom/sunmi/rfid/IReaderCall;)V
    procedure unregisterReaderCall; cdecl; //()V
    procedure inventory(P1: Byte); cdecl; //(B)V
    procedure realTimeInventory(P1: Byte); cdecl; //(B)V
    procedure customizedSessionTargetInventory(P1: Byte; P2: Byte; P3: Byte; P4: Byte; P5: Byte; P6: Byte); cdecl; //(BBBBBB)V
    procedure fastSwitchAntInventory(P1: Byte; P2: Byte; P3: Byte; P4: Byte; P5: Byte; P6: Byte; P7: Byte; P8: Byte; P9: Byte; P10: Byte); cdecl; //(BBBBBBBBBB)V
    procedure readTag(P1: Byte; P2: Byte; P3: Byte; P4: TJavaArray<Byte>); cdecl; //(BBB[B)V
    procedure writeTag(P1: TJavaArray<Byte>; P2: Byte; P3: Byte; P4: Byte; P5: TJavaArray<Byte>); cdecl; //([BBBB[B)V
    procedure lockTag(P1: TJavaArray<Byte>; P2: Byte; P3: Byte); cdecl; //([BBB)V
    procedure killTag(P1: TJavaArray<Byte>); cdecl; //([B)V
    procedure setAccessEpcMatch(P1: Byte; P2: TJavaArray<Byte>); cdecl; //(B[B)V
    procedure cancelAccessEpcMatch; cdecl; //()V
    procedure getAccessEpcMatch; cdecl; //()V
    procedure setImpinjFastTid(P1: Boolean; P2: Boolean); cdecl; //(ZZ)V
    procedure getImpinjFastTid; cdecl; //()V
    procedure iso180006BInventory; cdecl; //()V
    procedure iso180006BReadTag(P1: TJavaArray<Byte>; P2: Byte; P3: Byte); cdecl; //([BBB)V
    procedure iso180006BWriteTag(P1: TJavaArray<Byte>; P2: Byte; P3: Byte; P4: TJavaArray<Byte>); cdecl; //([BBB[B)V
    procedure iso180006BLockTag(P1: TJavaArray<Byte>; P2: Byte); cdecl; //([BB)V
    procedure iso180006BQueryLockTag(P1: TJavaArray<Byte>; P2: Byte); cdecl; //([BB)V
    procedure getInventoryBuffer; cdecl; //()V
    procedure getAndResetInventoryBuffer; cdecl; //()V
    procedure getInventoryBufferTagCount; cdecl; //()V
    procedure resetInventoryBuffer; cdecl; //()V

    { Property }
  end;

  TJIScanRFIDInterface = class(TJavaGenericImport<JIScanRFIDInterfaceClass, JIScanRFIDInterface>) end;

  JReaderCallClass = interface(JIReaderCall_StubClass) // or JObjectClass // SuperSignature: com/sunmi/rfid/IReaderCall$Stub
  ['{F9B939A1-2FF7-4498-BC9F-EC1CBAECE83C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReaderCall; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/ReaderCall')]
  JReaderCall = interface(JIReaderCall_Stub) // or JObject // SuperSignature: com/sunmi/rfid/IReaderCall$Stub
  ['{C6984E0B-E7DD-4C54-AB7D-D618698BBDCC}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: Byte; P2: JDataParameter); cdecl; //(BLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onTag(P1: Byte; P2: Byte; P3: JDataParameter); cdecl; //(BBLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onFiled(P1: Byte; P2: Byte; P3: JString); cdecl; //(BBLjava/lang/String;)V

    { Property }
  end;

  TJReaderCall = class(TJavaGenericImport<JReaderCallClass, JReaderCall>) end;

  JRFIDHelper_CallClass = interface(JObjectClass)
  ['{32FB0412-5CDE-4FF5-8875-BA8BAB0A84CF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/RFIDHelper$Call')]
  JRFIDHelper_Call = interface(IJavaInstance)
  ['{CCB66A15-5164-4DF4-9DC0-592DAA2364B7}']
    { Property Methods }

    { methods }
    procedure run; cdecl; //()V

    { Property }
  end;

  TJRFIDHelper_Call = class(TJavaGenericImport<JRFIDHelper_CallClass, JRFIDHelper_Call>) end;

  JRFIDHelperClass = interface(JObjectClass)
  ['{AB5BF264-1F9F-4538-AD88-B98FD83FF346}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/RFIDHelper')]
  JRFIDHelper = interface(IJavaInstance)
  ['{C96F9880-230C-4F31-A41C-7B21339E92FB}']
    { Property Methods }

    { methods }
    function getScanModel: Integer; cdecl; //()I
    procedure registerReaderCall(P1: JReaderCall); cdecl; //(Lcom/sunmi/rfid/ReaderCall;)V
    procedure unregisterReaderCall; cdecl; //()V
    procedure inventory(P1: Byte); cdecl; //(B)V
    procedure realTimeInventory(P1: Byte); cdecl; //(B)V
    procedure customizedSessionTargetInventory(P1: Byte; P2: Byte; P3: Byte; P4: Byte; P5: Byte; P6: Byte); cdecl; //(BBBBBB)V
    procedure fastSwitchAntInventory(P1: Byte; P2: Byte; P3: Byte; P4: Byte; P5: Byte; P6: Byte; P7: Byte; P8: Byte; P9: Byte; P10: Byte); cdecl; //(BBBBBBBBBB)V
    procedure readTag(P1: Byte; P2: Byte; P3: Byte; P4: TJavaArray<Byte>); cdecl; //(BBB[B)V
    procedure writeTag(P1: TJavaArray<Byte>; P2: Byte; P3: Byte; P4: Byte; P5: TJavaArray<Byte>); cdecl; //([BBBB[B)V
    procedure lockTag(P1: TJavaArray<Byte>; P2: Byte; P3: Byte); cdecl; //([BBB)V
    procedure killTag(P1: TJavaArray<Byte>); cdecl; //([B)V
    procedure setAccessEpcMatch(P1: Byte; P2: TJavaArray<Byte>); cdecl; //(B[B)V
    procedure cancelAccessEpcMatch; cdecl; //()V
    procedure getAccessEpcMatch; cdecl; //()V
    procedure setImpinjFastTid(P1: Boolean; P2: Boolean); cdecl; //(ZZ)V
    procedure getImpinjFastTid; cdecl; //()V
    procedure iso180006BInventory; cdecl; //()V
    procedure iso180006BReadTag(P1: TJavaArray<Byte>; P2: Byte; P3: Byte); cdecl; //([BBB)V
    procedure iso180006BWriteTag(P1: TJavaArray<Byte>; P2: Byte; P3: Byte; P4: TJavaArray<Byte>); cdecl; //([BBB[B)V
    procedure iso180006BLockTag(P1: TJavaArray<Byte>; P2: Byte); cdecl; //([BB)V
    procedure iso180006BQueryLockTag(P1: TJavaArray<Byte>; P2: Byte); cdecl; //([BB)V
    procedure getInventoryBuffer; cdecl; //()V
    procedure getAndResetInventoryBuffer; cdecl; //()V
    procedure getInventoryBufferTagCount; cdecl; //()V
    procedure resetInventoryBuffer; cdecl; //()V

    { Property }
  end;

  TJRFIDHelper = class(TJavaGenericImport<JRFIDHelperClass, JRFIDHelper>) end;

//  JRFIDManager_1Class = interface(JObjectClass)
//  ['{BCC0E423-A827-424C-9217-8804F350B4A6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/rfid/RFIDManager$1')]
//  JRFIDManager_1 = interface(JObject)
//  ['{17653CE9-CFAA-40DC-AC4E-8A8EDE90FDFC}']
//    { Property Methods }
//
//    { methods }
//    procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl; //(Landroid/content/ComponentName;Landroid/os/IBinder;)V
//    procedure onServiceDisconnected(name: JComponentName); cdecl; //(Landroid/content/ComponentName;)V
//
//    { Property }
//  end;

//  TJRFIDManager_1 = class(TJavaGenericImport<JRFIDManager_1Class, JRFIDManager_1>) end;

  JRFIDManager_SingletonInstanceClass = interface(JObjectClass)
  ['{DFDFA80A-3106-48F1-A6A3-142565AEC819}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/RFIDManager$SingletonInstance')]
  JRFIDManager_SingletonInstance = interface(JObject)
  ['{4F5597E2-6D2C-41F9-BF4F-36652B6403B7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRFIDManager_SingletonInstance = class(TJavaGenericImport<JRFIDManager_SingletonInstanceClass, JRFIDManager_SingletonInstance>) end;

  JRFIDManagerClass = interface(JObjectClass)
  ['{01EE7D83-3077-440D-A706-1B6654F96F58}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JRFIDManager; cdecl; //()Lcom/sunmi/rfid/RFIDManager;

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/RFIDManager')]
  JRFIDManager = interface(JObject)
  ['{8616F46C-608C-4433-9F26-433296F449F2}']
    { Property Methods }

    { methods }
    procedure connect(context: JContext); cdecl; //(Landroid/content/Context;)V
    procedure disconnect; cdecl; //()V
    procedure setPrintLog(printLog: Boolean); cdecl; //(Z)V
    function getHelper: JRFIDHelper; cdecl; //()Lcom/sunmi/rfid/RFIDHelper;

    { Property }
  end;

  TJRFIDManager = class(TJavaGenericImport<JRFIDManagerClass, JRFIDManager>) end;

  JServicesHelperClass = interface(JObjectClass)
  ['{C1B800DE-3104-44FB-9916-229B2467BA49}']
    { static Property Methods }

    { static Methods }
    {class} function init(scan: JIScanRFIDInterface): JServicesHelper; cdecl; //(Lcom/sunmi/rfid/IScanRFIDInterface;)V

    { static Property }
  end;

  [JavaSignature('com/sunmi/rfid/ServicesHelper')]
  JServicesHelper = interface(JObject)
  ['{F1DB8903-B11E-4B38-929C-6F225234C9E4}']
    { Property Methods }

    { methods }
    function getScanModel: Integer; cdecl; //()I
    procedure registerReaderCall(call: JReaderCall); cdecl; //(Lcom/sunmi/rfid/ReaderCall;)V
    procedure unregisterReaderCall; cdecl; //()V
    procedure inventory(btRepeat: Byte); cdecl; //(B)V
    procedure realTimeInventory(btRepeat: Byte); cdecl; //(B)V
    procedure customizedSessionTargetInventory(btSession: Byte; btTarget: Byte; btSL: Byte; btPhase: Byte; btPowerSave: Byte; btRepeat: Byte); cdecl; //(BBBBBB)V
    procedure fastSwitchAntInventory(btA: Byte; btStayA: Byte; btB: Byte; btStayB: Byte; btC: Byte; btStayC: Byte; btD: Byte; btStayD: Byte; btInterval: Byte; btRepeat: Byte); cdecl; //(BBBBBBBBBB)V
    procedure readTag(btMemBank: Byte; btWordAdd: Byte; btWordCnt: Byte; btAryPassWord: TJavaArray<Byte>); cdecl; //(BBB[B)V
    procedure writeTag(btAryPassWord: TJavaArray<Byte>; btMemBank: Byte; btWordAdd: Byte; btWordCnt: Byte; btAryData: TJavaArray<Byte>); cdecl; //([BBBB[B)V
    procedure lockTag(btAryPassWord: TJavaArray<Byte>; btMemBank: Byte; btLockType: Byte); cdecl; //([BBB)V
    procedure killTag(btAryPassWord: TJavaArray<Byte>); cdecl; //([B)V
    procedure setAccessEpcMatch(btEpcLen: Byte; btAryEpc: TJavaArray<Byte>); cdecl; //(B[B)V
    procedure cancelAccessEpcMatch; cdecl; //()V
    procedure getAccessEpcMatch; cdecl; //()V
    procedure setImpinjFastTid(blnOpen: Boolean; blnSave: Boolean); cdecl; //(ZZ)V
    procedure getImpinjFastTid; cdecl; //()V
    procedure iso180006BInventory; cdecl; //()V
    procedure iso180006BReadTag(btAryUID: TJavaArray<Byte>; btWordAdd: Byte; btWordCnt: Byte); cdecl; //([BBB)V
    procedure iso180006BWriteTag(btAryUID: TJavaArray<Byte>; btWordAdd: Byte; btWordCnt: Byte; btAryBuffer: TJavaArray<Byte>); cdecl; //([BBB[B)V
    procedure iso180006BLockTag(btAryUID: TJavaArray<Byte>; btWordAdd: Byte); cdecl; //([BB)V
    procedure iso180006BQueryLockTag(btAryUID: TJavaArray<Byte>; btWordAdd: Byte); cdecl; //([BB)V
    procedure getInventoryBuffer; cdecl; //()V
    procedure getAndResetInventoryBuffer; cdecl; //()V
    procedure getInventoryBufferTagCount; cdecl; //()V
    procedure resetInventoryBuffer; cdecl; //()V

    { Property }
  end;

  TJServicesHelper = class(TJavaGenericImport<JServicesHelperClass, JServicesHelper>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JBuildConfig',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JCMD',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JCMD));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JParamCts',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JParamCts));
////  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JDataParameter_1',
////    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JDataParameter_1));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JDataParameter',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JDataParameter));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIReaderCall_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIReaderCall_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIReaderCall_Stub',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIReaderCall_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIReaderCall',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIReaderCall));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIScanRFIDInterface_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIScanRFIDInterface_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIScanRFIDInterface_Stub',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIScanRFIDInterface_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIScanRFIDInterface',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JIScanRFIDInterface));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JReaderCall',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JReaderCall));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDHelper_Call',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDHelper_Call));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDHelper',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDHelper));
////  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDManager_1',
////    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDManager_1));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDManager_SingletonInstance',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDManager_SingletonInstance));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDManager',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JRFIDManager));
//  TRegTypes.RegisterType('Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JServicesHelper',
//    TypeInfo(Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.JServicesHelper));
//end;
//
//
//initialization
//  RegisterTypes;

{$ENDIF}

end.
