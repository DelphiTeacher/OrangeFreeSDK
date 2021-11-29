﻿//====================================================
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
//  生成时间：2021-11-26 15:13:53
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.YSF_release_aar;

interface
{$IFDEF ANDROID}

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes//,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.os.IBinder,
//  Androidapi.JNI.android.content.Intent,
//  Androidapi.JNI.android.os.Message,
//  Androidapi.JNI.android.graphics.Bitmap
  ;


type

// ===== Forward declarations =====

//  Ja = interface; //com.a.a.a
  JRAW2BMP = interface; //com.example.libdecodewlt.RAW2BMP
  JCardListenerReData = interface; //com.hifond.card.CardListenerReData
  JCardNative = interface; //com.hifond.card.CardNative
  JCardNativeReturnData = interface; //com.hifond.card.CardNativeReturnData
//  JCardNativeUtil_1 = interface; //com.hifond.cardlibrary.card.CardNativeUtil$1
  JCardNativeUtil_SingletonLoader = interface; //com.hifond.cardlibrary.card.CardNativeUtil$SingletonLoader
  JCardNativeUtil = interface; //com.hifond.cardlibrary.card.CardNativeUtil
  JHifondCardInterface = interface; //com.hifond.cardlibrary.card.HifondCardInterface
  JCardCheckResult = interface; //com.hifond.cardlibrary.card.vo.CardCheckResult
  JCardInfo = interface; //com.hifond.cardlibrary.card.vo.CardInfo
//  JHiLoCardServer_a = interface; //com.ysf.card.HiLoCardServer$a
//  JHiLoCardServer_b = interface; //com.ysf.card.HiLoCardServer$b
  JHiLoCardServer = interface; //com.ysf.card.HiLoCardServer
//  JHiUpdateHexServer_a = interface; //com.ysf.card.HiUpdateHexServer$a
//  JHiUpdateHexServer_b = interface; //com.ysf.card.HiUpdateHexServer$b
//  JHiUpdateHexServer_c = interface; //com.ysf.card.HiUpdateHexServer$c
  JHiUpdateHexServer = interface; //com.ysf.card.HiUpdateHexServer
//  Ja_1 = interface; //com.ysf.card.tool.a$1
//  Ja_2 = interface; //com.ysf.card.tool.a$2
//  Ja_3 = interface; //com.ysf.card.tool.a$3
//  Ja_4 = interface; //com.ysf.card.tool.a$4
//  Ja_022 = interface; //com.ysf.card.tool.a
//  Jb = interface; //com.ysf.card.tool.b
//  Jc = interface; //com.ysf.card.tool.c
  JCardDecipherUtil = interface; //com.ysf.card.tool.CardDecipherUtil
//  Jd = interface; //com.ysf.card.tool.d
  JLoggerUtil = interface; //com.ysf.card.tool.LoggerUtil
  JSerialPort = interface; //com.ysf.serialporttool.SerialPort
//  Ja_029 = interface; //com.ysf.serialporttool.util.a
//  Jb_030 = interface; //com.ysf.serialporttool.util.b
//  Jc_031 = interface; //com.ysf.serialporttool.util.c
//  Jd_032 = interface; //com.ysf.serialporttool.util.d
//  Je = interface; //com.ysf.serialporttool.util.e
  JFastJsonUtil = interface; //com.ysf.serialporttool.util.FastJsonUtil
//  JSerialPortUtil_a = interface; //com.ysf.serialporttool.util.SerialPortUtil$a
  JSerialPortUtil = interface; //com.ysf.serialporttool.util.SerialPortUtil

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====



//  JaClass = interface(JObjectClass)
//  ['{E761A90F-5C57-486D-8585-028059118119}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Ja; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/a/a/a')]
//  Ja = interface(JObject)
//  ['{9A5F45F3-88F7-42FC-8488-39A9D5D72D1A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

  JRAW2BMPClass = interface(JObjectClass)
  ['{DEDE08B9-46C2-4557-B549-C916BDB73922}']
    { static Property Methods }

    { static Methods }
    {class} procedure a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: JString); cdecl;
    {class} function HS_RAW2BMP(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/example/libdecodewlt/RAW2BMP')]
  JRAW2BMP = interface(JObject)
  ['{C7786C44-214A-4548-80C1-C8EA9F2E1DDD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRAW2BMP = class(TJavaGenericImport<JRAW2BMPClass, JRAW2BMP>) end;

  JCardListenerReDataClass = interface(JObjectClass)
  ['{8680B042-FCF8-4DA7-8AAF-B8F862632699}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardListenerReData; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/card/CardListenerReData')]
  JCardListenerReData = interface(JObject)
  ['{E714C547-7862-46FE-A081-098BDF10DB7D}']
    { Property Methods }
    function _GetresultCode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetresultCode(aresultCode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetresultCardType: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetresultCardType(aresultCardType: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetresultData: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetresultData(aresultData: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property resultCode: Integer read _GetresultCode write _SetresultCode;
    property resultCardType: JString read _GetresultCardType write _SetresultCardType;
    property resultData: JString read _GetresultData write _SetresultData;
  end;

  TJCardListenerReData = class(TJavaGenericImport<JCardListenerReDataClass, JCardListenerReData>) end;

  JCardNativeClass = interface(JObjectClass)
  ['{AE64C0F3-C1DD-4DBD-B68B-84411CB9DBDE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardNative; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/card/CardNative')]
  JCardNative = interface(JObject)
  ['{719B6193-C2C3-466E-8063-8ADF857C7A82}']
    { Property Methods }

    { methods }
    function openSerial(P1: JString; P2: Integer): Integer; cdecl; overload;
    function openSerial(P1: JString): Integer; cdecl; overload;
    function closeSerial: Integer; cdecl;
    function startCardListener(P1: JString): JCardListenerReData; cdecl;
    function throughCard: JCardListenerReData; cdecl;
    function stopCardListener: Integer; cdecl;
    function readM1(P1: JString; P2: JString): JCardNativeReturnData; cdecl;
    function readM1UID: JCardNativeReturnData; cdecl;
    function readChipCard(P1: Boolean): JCardNativeReturnData; cdecl;
    function readDGyh: JCardNativeReturnData; cdecl;
    function readXM4442: JCardNativeReturnData; cdecl;
    function readChipCardBJ: JCardNativeReturnData; cdecl;
    function readIDCard: JCardNativeReturnData; cdecl;
    function readIDCard2: JCardNativeReturnData; cdecl;
    function readSXJC: JCardNativeReturnData; cdecl;
    function readSXJC1: JCardNativeReturnData; cdecl;
    function checkMoudle: JCardNativeReturnData; cdecl;
    function checkPSAM: JCardNativeReturnData; cdecl;
    function getVersionName: JCardNativeReturnData; cdecl;
    function getHexVersionInfo: JCardNativeReturnData; cdecl;
    function updateHex(P1: JString; P2: JString): JCardNativeReturnData; cdecl;
    procedure setLog(P1: Integer); cdecl;
    function sendcommsg(P1: JString): JString; cdecl;
    function readTSicardNingbo: JCardNativeReturnData; cdecl;
    function readBank: JCardNativeReturnData; cdecl;
    function readJINAN4442: JCardNativeReturnData; cdecl;

    { Property }
  end;

  TJCardNative = class(TJavaGenericImport<JCardNativeClass, JCardNative>) end;

  JCardNativeReturnDataClass = interface(JObjectClass)
  ['{FA4193EE-E767-4BA5-80FC-09B7ABC080FF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardNativeReturnData; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/card/CardNativeReturnData')]
  JCardNativeReturnData = interface(JObject)
  ['{1C0C70BD-AA2B-4670-BABB-FBB239CB5272}']
    { Property Methods }
    function _GetresultCode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetresultCode(aresultCode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeterrorMsg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeterrorMsg(aerrorMsg: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcardNo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcardNo(acardNo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetidCardNo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetidCardNo(aidCardNo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getname: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setname(aname: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getsex: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setsex(asex: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getnation: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setnation(anation: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getbirthday: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setbirthday(abirthday: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getaddress: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setaddress(aaddress: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetexpireDate: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetexpireDate(aexpireDate: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeteffectDate: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeteffectDate(aeffectDate: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getdepartment: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdepartment(adepartment: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetidCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetidCode(aidCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetdistrictCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdistrictCode(adistrictCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getssckey: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setssckey(assckey: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcomputerNo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcomputerNo(acomputerNo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsReset: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsReset(asReset: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsATR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsATR(asATR: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsVersion: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsVersion(asVersion: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetsIssu: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsIssu(asIssu: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetcomputerId: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetcomputerId(acomputerId: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetbmpFile: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetbmpFile(abmpFile: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property resultCode: Integer read _GetresultCode write _SetresultCode;
    property errorMsg: JString read _GeterrorMsg write _SeterrorMsg;
    property cardNo: JString read _GetcardNo write _SetcardNo;
    property idCardNo: JString read _GetidCardNo write _SetidCardNo;
    property name: JString read _Getname write _Setname;
    property sex: JString read _Getsex write _Setsex;
    property nation: JString read _Getnation write _Setnation;
    property birthday: JString read _Getbirthday write _Setbirthday;
    property address: JString read _Getaddress write _Setaddress;
    property expireDate: JString read _GetexpireDate write _SetexpireDate;
    property effectDate: JString read _GeteffectDate write _SeteffectDate;
    property department: JString read _Getdepartment write _Setdepartment;
    property idCode: JString read _GetidCode write _SetidCode;
    property districtCode: JString read _GetdistrictCode write _SetdistrictCode;
    property ssckey: JString read _Getssckey write _Setssckey;
    property computerNo: JString read _GetcomputerNo write _SetcomputerNo;
    property sReset: JString read _GetsReset write _SetsReset;
    property sATR: JString read _GetsATR write _SetsATR;
    property sVersion: JString read _GetsVersion write _SetsVersion;
    property sIssu: JString read _GetsIssu write _SetsIssu;
    property computerId: JString read _GetcomputerId write _SetcomputerId;
    property bmpFile: TJavaArray<Byte> read _GetbmpFile write _SetbmpFile;
  end;

  TJCardNativeReturnData = class(TJavaGenericImport<JCardNativeReturnDataClass, JCardNativeReturnData>) end;

//  JCardNativeUtil_1Class = interface(JObjectClass)
//  ['{A2EFAEB6-30F4-4E93-AD6D-14C0EFB266E7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/hifond/cardlibrary/card/CardNativeUtil$1')]
//  JCardNativeUtil_1 = interface(JObject)
//  ['{DDDA46DC-A035-4B51-B585-9409F7451EAB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJCardNativeUtil_1 = class(TJavaGenericImport<JCardNativeUtil_1Class, JCardNativeUtil_1>) end;

  JCardNativeUtil_SingletonLoaderClass = interface(JObjectClass)
  ['{A0AEA010-923E-4D7B-847B-E7AB99E45235}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/CardNativeUtil$SingletonLoader')]
  JCardNativeUtil_SingletonLoader = interface(JObject)
  ['{AA89F082-2825-448E-8279-AF609CAFEC66}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCardNativeUtil_SingletonLoader = class(TJavaGenericImport<JCardNativeUtil_SingletonLoaderClass, JCardNativeUtil_SingletonLoader>) end;

  JCardNativeUtilClass = interface(JObjectClass)
  ['{4ABF1338-77C5-4CEF-A29E-60EB7D5FF868}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JCardNativeUtil; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/CardNativeUtil')]
  JCardNativeUtil = interface(JObject)
  ['{6B0C99B3-EEDC-4957-A9E4-1A34D33537CB}']
    { Property Methods }

    { methods }
    procedure openSerial; cdecl; overload;
    function openSerial(P1: JString; P2: Integer): Integer; cdecl; overload;
    procedure closeSerial; cdecl;
    procedure setLog(P1: Integer); cdecl;
    function sendcommsg(P1: JString): JString; cdecl;
    function startCardListener(P1: JString): JCardListenerReData; cdecl;
    function throughCard: JCardListenerReData; cdecl;
    function stopCardListener: Integer; cdecl;
    function getVersionName: JString; cdecl;
    function checkPSAM: JString; cdecl;
    function read4442: JCardNativeReturnData; cdecl;
    function readChipCard(P1: Boolean): JCardNativeReturnData; cdecl;
    function readChipCardBJ: JCardNativeReturnData; cdecl;
    function readDGYH: JCardNativeReturnData; cdecl;
    function readSMYK: JCardNativeReturnData; cdecl;
    function readTSicardNingbo: JCardNativeReturnData; cdecl;
    function readBank: JCardNativeReturnData; cdecl;
    function readSXJC: JCardNativeReturnData; cdecl;
    function readSXJC1: JCardNativeReturnData; cdecl;
    function readIDCard2: JCardNativeReturnData; cdecl;
    function readM1(P1: JString; P2: JString): JCardNativeReturnData; cdecl;
    function readM1Uid: JString; cdecl;

    { Property }
  end;

  TJCardNativeUtil = class(TJavaGenericImport<JCardNativeUtilClass, JCardNativeUtil>) end;

  JHifondCardInterfaceClass = interface(JObjectClass)
  ['{9E3E9B15-7ACB-42CE-AFCA-220861A787B0}']
    { static Property Methods }
    {class} function _GetmContext: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHifondCardInterface; cdecl; overload;
    {class} procedure init(P1: JContext; P2: Integer; P3: JString); cdecl; overload;
    {class} procedure initSerialPort(P1: JContext; P2: Integer; P3: JString); cdecl;
    {class} procedure openSerialPort; cdecl;
    {class} procedure init(P1: JContext; P2: JString); cdecl; overload;
    {class} procedure init(P1: JContext); cdecl; overload;
    {class} procedure openModule; cdecl; overload;
    {class} procedure openModule(P1: JString); cdecl; overload;
    {class} procedure openModule(P1: JString; P2: JString; P3: JString); cdecl; overload;
    {class} procedure openModule(P1: JString; P2: JString; P3: JString; P4: JString); cdecl; overload;
    {class} procedure openModule(P1: JString; P2: JString; P3: JString; P4: JString; P5: Boolean); cdecl; overload;
    {class} procedure closeModule; cdecl;
    {class} procedure checkPSAM(P1: Integer); cdecl;
    {class} procedure checkHexVersion; cdecl;
    {class} function getSOVersionName: JString; cdecl;
    {class} procedure checkModule; cdecl;
    {class} procedure readSAM; cdecl;
    {class} procedure readUid; cdecl;
    {class} procedure updateHex(P1: JString); cdecl;

    { static Property }
    {class} property mContext: JContext read _GetmContext;
  end;

  [JavaSignature('com/hifond/cardlibrary/card/HifondCardInterface')]
  JHifondCardInterface = interface(JObject)
  ['{2A38599B-67B8-421F-A640-D5E9EA563CB5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHifondCardInterface = class(TJavaGenericImport<JHifondCardInterfaceClass, JHifondCardInterface>) end;

  JCardCheckResultClass = interface(JObjectClass)
  ['{2D26D3AA-23FC-4A0A-89AA-CEF8D5F315CB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardCheckResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/vo/CardCheckResult')]
  JCardCheckResult = interface(JObject)
  ['{F64BFDC8-50EA-484A-8A7C-1FF284E98C31}']
    { Property Methods }

    { methods }
    function getPSam: JString; cdecl;
    procedure setpSam(P1: JString); cdecl;
    function getCommand: JString; cdecl;
    procedure setCommand(P1: JString); cdecl;
    function getHexCommand: JString; cdecl;
    procedure setHexCommand(P1: JString); cdecl;
    function getModuleInfo: JString; cdecl;
    procedure setModuleInfo(P1: JString); cdecl;
    function getHexInfo: JString; cdecl;
    procedure setHexInfo(P1: JString); cdecl;
    function getResultCode: JString; cdecl;
    procedure setResultCode(P1: JString); cdecl;
    function getCheckType: Integer; cdecl;
    procedure setCheckType(P1: Integer); cdecl;
    function getSAMID: JString; cdecl;
    procedure setSAMID(P1: JString); cdecl;

    { Property }
  end;

  TJCardCheckResult = class(TJavaGenericImport<JCardCheckResultClass, JCardCheckResult>) end;

  JCardInfoClass = interface(JObjectClass)
  ['{F86F0BA0-1A63-46B6-BA43-9B6746E6CC97}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardInfo; cdecl; overload;
    {class} function init(P1: JString; P2: JString): JCardInfo; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/vo/CardInfo')]
  JCardInfo = interface(JObject)
  ['{51B71657-1615-439B-8AE0-4D784BEB0AC7}']
    { Property Methods }
    function _GetdistrictCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdistrictCode(adistrictCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function getBankNo: JString; cdecl;
    procedure setBankNo(P1: JString); cdecl;
    function getDepartment: JString; cdecl;
    procedure setDepartment(P1: JString); cdecl;
    function getEffectDate: JString; cdecl;
    procedure setEffectDate(P1: JString); cdecl;
    function getExpireDate: JString; cdecl;
    procedure setExpireDate(P1: JString); cdecl;
    function getCardType: JString; cdecl;
    procedure setCardType(P1: JString); cdecl;
    function getDistrictCode: JString; cdecl;
    procedure setDistrictCode(P1: JString); cdecl;
    function getCardNo: JString; cdecl;
    procedure setCardNo(P1: JString); cdecl;
    function getCardName: JString; cdecl;
    procedure setCardName(P1: JString); cdecl;
    function getNation: JString; cdecl;
    procedure setNation(P1: JString); cdecl;
    function getIdCardNo: JString; cdecl;
    procedure setIdCardNo(P1: JString); cdecl;
    function getDeviceId: JString; cdecl;
    procedure setDeviceId(P1: JString); cdecl;
    function getComputerId: JString; cdecl;
    procedure setComputerId(P1: JString); cdecl;
    function getSocialSecurityCardNo: JString; cdecl;
    procedure setSocialSecurityCardNo(P1: JString); cdecl;
    function getSocialSecurityPwd: JString; cdecl;
    procedure setSocialSecurityPwd(P1: JString); cdecl;
    function getSex: JString; cdecl;
    procedure setSex(P1: JString); cdecl;
    function getResultCode: JString; cdecl;
    procedure setResultCode(P1: JString); cdecl;
    function getCardNoSN: JString; cdecl;
    procedure setCardNoSN(P1: JString); cdecl;
    function getUuid: JString; cdecl;
    procedure setUuid(P1: JString); cdecl;
    function getUid: JString; cdecl;
    procedure setUid(P1: JString); cdecl;
    function getBackup01: JString; cdecl;
    procedure setBackup01(P1: JString); cdecl;
    function getCardTypeZH: JString; cdecl;
    procedure setCardTypeZH(P1: JString); cdecl;
    function getAddress: JString; cdecl;
    procedure setAddress(P1: JString); cdecl;
    function toString: JString; cdecl;

    { Property }
    property districtCode: JString read _GetdistrictCode write _SetdistrictCode;
  end;

  TJCardInfo = class(TJavaGenericImport<JCardInfoClass, JCardInfo>) end;

//  JHiLoCardServer_aClass = interface(JThreadClass) // or JObjectClass
//  ['{DE48B6F9-21B2-4F46-A2A1-DC65B0A1DA22}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/HiLoCardServer$a')]
//  JHiLoCardServer_a = interface(JThread) // or JObject
//  ['{39BB2F08-9415-4789-B831-8702462065A2}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJHiLoCardServer_a = class(TJavaGenericImport<JHiLoCardServer_aClass, JHiLoCardServer_a>) end;

//  JHiLoCardServer_bClass = interface(JThreadClass) // or JObjectClass
//  ['{3F8DBF09-BB31-4910-A77F-D3173A9A38B0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/HiLoCardServer$b')]
//  JHiLoCardServer_b = interface(JThread) // or JObject
//  ['{160D8458-C674-4B62-9168-86BC54AF5BFC}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJHiLoCardServer_b = class(TJavaGenericImport<JHiLoCardServer_bClass, JHiLoCardServer_b>) end;

  JHiLoCardServerClass = interface(JServiceClass) // or JObjectClass
  ['{E84D1AB1-5FF2-4150-99B9-E25BF7F729B0}']
    { static Property Methods }
    {class} function _Getc: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiLoCardServer; cdecl;

    { static Property }
    {class} property c: Integer read _Getc;
    {class} property d: JString read _Getd;
    {class} property e: JString read _Gete;
  end;

  [JavaSignature('com/ysf/card/HiLoCardServer')]
  JHiLoCardServer = interface(JService) // or JObject
  ['{03CF68B0-B787-4701-AA53-98FC72463229}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJHiLoCardServer = class(TJavaGenericImport<JHiLoCardServerClass, JHiLoCardServer>) end;

//  JHiUpdateHexServer_aClass = interface(JHandlerClass) // or JObjectClass
//  ['{48E991A7-D746-464A-874F-E73AF7BE947D}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JHiUpdateHexServer; P2: JHiUpdateHexServer): JHiUpdateHexServer_a; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/HiUpdateHexServer$a')]
//  JHiUpdateHexServer_a = interface(JHandler) // or JObject
//  ['{435493F6-1223-499D-9701-A31CA7BD6FF3}']
//    { Property Methods }
//
//    { methods }
//    procedure handleMessage(P1: JMessage); cdecl;
//
//    { Property }
//  end;
//
//  TJHiUpdateHexServer_a = class(TJavaGenericImport<JHiUpdateHexServer_aClass, JHiUpdateHexServer_a>) end;

//  JHiUpdateHexServer_bClass = interface(JThreadClass) // or JObjectClass
//  ['{56431A1F-C9F7-4870-814B-C7E1AA4D3388}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/HiUpdateHexServer$b')]
//  JHiUpdateHexServer_b = interface(JThread) // or JObject
//  ['{2B6E9842-7C75-4096-980D-9BE4C8192259}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJHiUpdateHexServer_b = class(TJavaGenericImport<JHiUpdateHexServer_bClass, JHiUpdateHexServer_b>) end;

//  JHiUpdateHexServer_cClass = interface(JThreadClass) // or JObjectClass
//  ['{E723AAD9-226D-4896-874B-72325C00282A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/HiUpdateHexServer$c')]
//  JHiUpdateHexServer_c = interface(JThread) // or JObject
//  ['{0A757D24-C46A-4428-8E37-B588C901510E}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJHiUpdateHexServer_c = class(TJavaGenericImport<JHiUpdateHexServer_cClass, JHiUpdateHexServer_c>) end;

  JHiUpdateHexServerClass = interface(JServiceClass) // or JObjectClass
  ['{4C6E7024-51EF-4740-AAF2-99DEA2BC550F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHiUpdateHexServer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiUpdateHexServer')]
  JHiUpdateHexServer = interface(JService) // or JObject
  ['{759FD90E-CBD3-4B24-B6D5-F5552086A289}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    procedure onDestroy; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;

    { Property }
  end;

  TJHiUpdateHexServer = class(TJavaGenericImport<JHiUpdateHexServerClass, JHiUpdateHexServer>) end;

//  Ja_1Class = interface(JThreadLocalClass) // or JObjectClass
//  ['{AC68DFBC-3442-4270-8FC0-F174539F7E32}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/tool/a$1')]
//  Ja_1 = interface(JThreadLocal) // or JObject
//  ['{D3770406-F65B-43EF-872C-4D0F1034E5FD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_1 = class(TJavaGenericImport<Ja_1Class, Ja_1>) end;

//  Ja_2Class = interface(JThreadLocalClass) // or JObjectClass
//  ['{E34F76BB-E978-4BAB-853C-FFE9BFEC76E1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/tool/a$2')]
//  Ja_2 = interface(JThreadLocal) // or JObject
//  ['{BF441917-B945-45FE-93E9-59CD2114C9E3}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_2 = class(TJavaGenericImport<Ja_2Class, Ja_2>) end;

//  Ja_3Class = interface(JThreadLocalClass) // or JObjectClass
//  ['{419B4148-ABE7-4EE8-9432-FF425199CB0A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/tool/a$3')]
//  Ja_3 = interface(JThreadLocal) // or JObject
//  ['{584B3C0C-A5BA-48EB-B606-EF93318B6EA1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_3 = class(TJavaGenericImport<Ja_3Class, Ja_3>) end;

//  Ja_4Class = interface(JThreadLocalClass) // or JObjectClass
//  ['{51118096-135A-4EE9-B5ED-2D6B1E9E7C46}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/tool/a$4')]
//  Ja_4 = interface(JThreadLocal) // or JObject
//  ['{FD3AFD5F-1A86-455E-9780-D7FAD26A5553}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_4 = class(TJavaGenericImport<Ja_4Class, Ja_4>) end;

//  Ja_022Class = interface(JObjectClass)
//  ['{8DC4DEB9-A857-4DA3-96BC-D5522EDDEA82}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a: JString; cdecl;
//    {class} function b: JString; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/tool/a')]
//  Ja_022 = interface(JObject)
//  ['{3122E541-9051-456B-B74A-EDC7CAF46DE1}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_022 = class(TJavaGenericImport<Ja_022Class, Ja_022>) end;

//  JbClass = interface(JObjectClass)
//  ['{6AFE799F-DB9C-42A3-A1CC-B91DE52113A3}']
//    { static Property Methods }
//    {class} function _Geta: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//
//    { static Property }
//    {class} property a: JString read _Geta;
//    {class} property b: JString read _Getb;
//    {class} property c: JString read _Getc;
//    {class} property d: JString read _Getd;
//    {class} property e: JString read _Gete;
//  end;
//
//  [JavaSignature('com/ysf/card/tool/b')]
//  Jb = interface(JObject)
//  ['{4EFB5286-CBCC-4886-83CA-D8B0D98D7230}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  JcClass = interface(JObjectClass)
//  ['{C0596896-1B73-47E8-8907-0D573A2B0C0C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/tool/c')]
//  Jc = interface(JObject)
//  ['{336C91C2-D673-4C87-A9BF-8C624DAF5F03}']
//    { Property Methods }
//
//    { methods }
//    function isFileNameChangeable: Boolean; cdecl;
//    function generateFileName(P1: Integer; P2: Int64): JString; cdecl;
//
//    { Property }
//  end;
//
//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

  JCardDecipherUtilClass = interface(JObjectClass)
  ['{92796AE1-0822-4E06-8F8F-F465FC9B5F0C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardDecipherUtil; cdecl;
    {class} function readFj: JString; cdecl;
    {class} function analy4442(P1: JString): JCardInfo; cdecl;
    {class} function deCardNo(P1: JString; P2: JString): JString; cdecl; overload;
    {class} function deCardNo(P1: JString): JString; cdecl; overload;
    {class} function analysisFj(P1: JString; P2: JString; P3: JString): JCardInfo; cdecl;
    {class} function getMD5(P1: JMap): JString; cdecl;
    {class} function readCt(P1: TJavaArray<Byte>; P2: JString): JCardInfo; cdecl;
    {class} function createUUID: JString; cdecl;
    {class} function checkCardSex(P1: JString): JString; cdecl;
    {class} function getBitMapUrl: JString; cdecl;
    {class} procedure saveBitmap(P1: JBitmap; P2: JContext); cdecl;
    {class} function uc4BytesToInt(P1: TJavaArray<Byte>; P2: Integer): Int64; cdecl;
    {class} function GenSAMID(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function bitmapToBase64(P1: JBitmap): JString; cdecl;
    {class} function base64ToBitmap(P1: JString): JBitmap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/tool/CardDecipherUtil')]
  JCardDecipherUtil = interface(JObject)
  ['{4A940554-52CB-4A08-990A-13A62DFA4EE1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCardDecipherUtil = class(TJavaGenericImport<JCardDecipherUtilClass, JCardDecipherUtil>) end;

//  JdClass = interface(JObjectClass)
//  ['{8AC2F210-E18C-4C0B-8B2F-ADDF121D06A4}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jd; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/tool/d')]
//  Jd = interface(JObject)
//  ['{081B5FB7-D71B-476F-8318-9174C007E411}']
//    { Property Methods }
//
//    { methods }
//    function flatten(P1: Integer; P2: JString; P3: JString): JCharSequence; cdecl;
//
//    { Property }
//  end;
//
//  TJd = class(TJavaGenericImport<JdClass, Jd>) end;

  JLoggerUtilClass = interface(JObjectClass)
  ['{B7CF348D-DAC7-4C62-840F-7094BAAC7828}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLoggerUtil; cdecl;
    {class} procedure initXLog; cdecl;
    {class} procedure initLogger; cdecl;
    {class} procedure i_file(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure i(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure e_file(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure e(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/tool/LoggerUtil')]
  JLoggerUtil = interface(JObject)
  ['{38C05BB6-E0F0-420A-B6C1-1EB278E292AE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLoggerUtil = class(TJavaGenericImport<JLoggerUtilClass, JLoggerUtil>) end;

  JSerialPortClass = interface(JObjectClass)
  ['{0BCC5814-FE0C-478A-99E4-DA6B09AA88D4}']
    { static Property Methods }

    { static Methods }
    {class} procedure setSuPath(P1: JString); cdecl;
    {class} function init(P1: JFile; P2: Integer; P3: Integer): JSerialPort; cdecl; overload;
    {class} function init(P1: JString; P2: Integer; P3: Integer): JSerialPort; cdecl; overload;
    {class} function init(P1: JFile; P2: Integer): JSerialPort; cdecl; overload;
    {class} function init(P1: JString; P2: Integer): JSerialPort; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/SerialPort')]
  JSerialPort = interface(JObject)
  ['{956C67B2-9583-4F34-9D7A-F0AD5C00D6A1}']
    { Property Methods }

    { methods }
    function getInputStream: JInputStream; cdecl;
    function getOutputStream: JOutputStream; cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJSerialPort = class(TJavaGenericImport<JSerialPortClass, JSerialPort>) end;

//  Ja_029Class = interface(JObjectClass)
//  ['{8EF37376-97DB-411C-ABC0-21712C9F2065}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): TJavaArray<Byte>; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/util/a')]
//  Ja_029 = interface(JObject)
//  ['{D56F0FD0-167C-4977-822F-9E4810353442}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_029 = class(TJavaGenericImport<Ja_029Class, Ja_029>) end;

//  Jb_030Class = interface(JObjectClass)
//  ['{C556BC92-3328-43B4-BDEF-057CE385A025}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): JString; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/util/b')]
//  Jb_030 = interface(JObject)
//  ['{41F82142-2300-4392-A54F-34B4B4CD6951}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJb_030 = class(TJavaGenericImport<Jb_030Class, Jb_030>) end;

//  Jc_031Class = interface(JObjectClass)
//  ['{F7667E37-8602-427D-B2D3-D1267FFF02E5}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function a(P1: Byte): JString; cdecl; overload;
//    {class} function a(P1: JString): TJavaArray<Byte>; cdecl; overload;
//    {class} function b(P1: JString): JString; cdecl;
//    {class} function c(P1: JString): JString; cdecl;
//    {class} function a(P1: Integer): JString; cdecl; overload;
//    {class} function a(P1: JArrayList): TJavaArray<Byte>; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/util/c')]
//  Jc_031 = interface(JObject)
//  ['{0B43B94D-4D35-47CE-85AF-C489C2312D44}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJc_031 = class(TJavaGenericImport<Jc_031Class, Jc_031>) end;

//  Jd_032Class = interface(JObjectClass)
//  ['{56F94154-BFE9-4B60-A5FF-62D19159C98E}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JString): TJavaArray<Byte>; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/util/d')]
//  Jd_032 = interface(JObject)
//  ['{3B93CE0A-2B26-4DC9-8B7B-5C23031B7F2C}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJd_032 = class(TJavaGenericImport<Jd_032Class, Jd_032>) end;

//  JeClass = interface(JObjectClass)
//  ['{03C05451-DE0D-45B3-B7A2-B07F86A3D6E0}']
//    { static Property Methods }
//    {class} function _Geta: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function a(P1: JString): TJavaArray<Byte>; cdecl; overload;
//    {class} function b(P1: JString): TJavaArray<Byte>; cdecl; overload;
//    {class} function a(P1: TJavaArray<Byte>): JString; cdecl; overload;
//    {class} function b(P1: TJavaArray<Byte>): TJavaObjectArray<JString>; cdecl; overload;
//    {class} function c(P1: JString): JString; cdecl;
//    {class} function a(P1: JCharSequence): Boolean; cdecl; overload;
//    {class} function d(P1: JString): JString; cdecl;
//
//    { static Property }
//    {class} property a: JPattern read _Geta;
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/util/e')]
//  Je = interface(JObject)
//  ['{BD0B1A33-753A-4168-9AE1-59A477673354}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJe = class(TJavaGenericImport<JeClass, Je>) end;

  JFastJsonUtilClass = interface(JObjectClass)
  ['{72F9B570-900B-4C7A-A12D-BE1F4DAE78AC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFastJsonUtil; cdecl;
    {class} function toJson(P1: JObject): JString; cdecl;
//    {class} function fromJson(P1: JString; P2: JClass): JObject; cdecl; overload;
//    {class} function fromJson(P1: TJavaArray<Byte>; P2: JClass): JObject; cdecl; overload;
//    {class} function fromJson(P1: TJavaArray<Byte>; P2: JClass; P3: JString): JObject; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/util/FastJsonUtil')]
  JFastJsonUtil = interface(JObject)
  ['{5E03C5D1-8FD8-44D6-9BDD-90E3DDA78405}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFastJsonUtil = class(TJavaGenericImport<JFastJsonUtilClass, JFastJsonUtil>) end;

//  JSerialPortUtil_aClass = interface(JObjectClass)
//  ['{DA8BBDB1-2145-488E-90D8-7A5C9631220D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/util/SerialPortUtil$a')]
//  JSerialPortUtil_a = interface(JObject)
//  ['{B40E337C-BC87-4D6C-98EC-63C34943E54B}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJSerialPortUtil_a = class(TJavaGenericImport<JSerialPortUtil_aClass, JSerialPortUtil_a>) end;

  JSerialPortUtilClass = interface(JObjectClass)
  ['{D1FD8B2F-5F52-44B4-B2F4-C801AECD62A3}']
    { static Property Methods }
    {class} function _Getbaudrate: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getport: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSerialPortUtil; cdecl;
    {class} function getInstance: JSerialPortUtil; cdecl;

    { static Property }
    {class} property baudrate: Integer read _Getbaudrate;
    {class} property port: JString read _Getport;
  end;

  [JavaSignature('com/ysf/serialporttool/util/SerialPortUtil')]
  JSerialPortUtil = interface(JObject)
  ['{434B0908-1D51-4A4B-8571-9109FB8372E8}']
    { Property Methods }

    { methods }
    function openSerialPort: JSerialPort; cdecl;
    procedure closeSerialPort; cdecl;

    { Property }
  end;

  TJSerialPortUtil = class(TJavaGenericImport<JSerialPortUtilClass, JSerialPortUtil>) end;


{$ENDIF}
implementation

end.

