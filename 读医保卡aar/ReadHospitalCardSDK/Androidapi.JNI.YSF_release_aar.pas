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
//  生成时间：2021-12-02 14:38:31
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
  Androidapi.JNI.JavaTypes;//,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.os.IBinder,
//  Androidapi.JNI.android.os.Parcel,
//  Androidapi.JNI.android.os.Message,
//  Androidapi.JNI.android.content.Intent,
//  Androidapi.JNI.android.graphics.Bitmap,
//  Androidapi.JNI.org.greenrobot.greendao.Property,
//  Androidapi.JNI.org.greenrobot.greendao.internal.DaoConfig,
//  Androidapi.JNI.org.greenrobot.greendao.database.Database,
//  Androidapi.JNI.android.database.Cursor,
//  Androidapi.JNI.android.database.sqlite.SQLiteDatabase,
//  Androidapi.JNI.android.database.sqlite.SQLiteDatabase_CursorFactory,
//  Androidapi.JNI.android.database.DatabaseErrorHandler,
//  Androidapi.JNI.org.greenrobot.greendao.database.StandardDatabase,
//  Androidapi.JNI.org.greenrobot.greendao.identityscope.IdentityScopeType,
//  Androidapi.JNI.org.greenrobot.greendao.AbstractDaoSession;


type

// ===== Forward declarations =====

//  Ja = interface; //com.a.a.a
//  Ja_001 = interface; //com.a.b.a
  JRAW2BMP = interface; //com.example.libdecodewlt.RAW2BMP
  JCardListenerReData = interface; //com.hifond.card.CardListenerReData
  JCardNative = interface; //com.hifond.card.CardNative
  JCardNativeReturnData = interface; //com.hifond.card.CardNativeReturnData
//  JCardNativeUtil_1 = interface; //com.hifond.cardlibrary.card.CardNativeUtil$1
  JCardNativeUtil_SingletonLoader = interface; //com.hifond.cardlibrary.card.CardNativeUtil$SingletonLoader
  JCardNativeUtil = interface; //com.hifond.cardlibrary.card.CardNativeUtil
  JHifondCardInterface = interface; //com.hifond.cardlibrary.card.HifondCardInterface
  JHifondConstants_CardType = interface; //com.hifond.cardlibrary.card.HifondConstants$CardType
  JHifondConstants = interface; //com.hifond.cardlibrary.card.HifondConstants
  JCardCheckResult = interface; //com.hifond.cardlibrary.card.vo.CardCheckResult
  JCardInfo = interface; //com.hifond.cardlibrary.card.vo.CardInfo
  JM1TagStringUtil = interface; //com.hifond.cardlibrary.card.vo.M1TagStringUtil
//  Ja_a_a = interface; //com.ysf.a.a.a$a$a
//  Ja_a = interface; //com.ysf.a.a.a$a
//  Ja_017 = interface; //com.ysf.a.a.a
//  Jb_a_a = interface; //com.ysf.a.a.b$a$a
//  Jb_a = interface; //com.ysf.a.a.b$a
//  Jb = interface; //com.ysf.a.a.b
//  Jc_a_a = interface; //com.ysf.a.a.c$a$a
//  Jc_a = interface; //com.ysf.a.a.c$a
//  Jc = interface; //com.ysf.a.a.c
  JBMIDataResult = interface; //com.ysf.card.entry.BMIDataResult
  JCardInParameter = interface; //com.ysf.card.entry.CardInParameter
  JHGResultBean = interface; //com.ysf.card.entry.HGResultBean
//  JHiAIDLCardServer_1 = interface; //com.ysf.card.server.HiAIDLCardServer$1
  JHiAIDLCardServer_InnerHandler = interface; //com.ysf.card.server.HiAIDLCardServer$InnerHandler
  JHiAIDLCardServer_ReadThread = interface; //com.ysf.card.server.HiAIDLCardServer$ReadThread
  JHiAIDLCardServer_SendingThread = interface; //com.ysf.card.server.HiAIDLCardServer$SendingThread
  JHiAIDLCardServer = interface; //com.ysf.card.server.HiAIDLCardServer
//  JHiCardServer_1 = interface; //com.ysf.card.server.HiCardServer$1
  JHiCardServer_InnerHandler = interface; //com.ysf.card.server.HiCardServer$InnerHandler
  JHiCardServer_ReadThread = interface; //com.ysf.card.server.HiCardServer$ReadThread
  JHiCardServer_SendingThread = interface; //com.ysf.card.server.HiCardServer$SendingThread
  JHiCardServer = interface; //com.ysf.card.server.HiCardServer
//  JHiLoCardServer_1 = interface; //com.ysf.card.server.HiLoCardServer$1
  JHiLoCardServer_ReadThread = interface; //com.ysf.card.server.HiLoCardServer$ReadThread
  JHiLoCardServer_SendingThread = interface; //com.ysf.card.server.HiLoCardServer$SendingThread
  JHiLoCardServer = interface; //com.ysf.card.server.HiLoCardServer
//  JHiMaibobServer_1 = interface; //com.ysf.card.server.HiMaibobServer$1
  JHiMaibobServer_ReadThread = interface; //com.ysf.card.server.HiMaibobServer$ReadThread
  JHiMaibobServer_SendingThread = interface; //com.ysf.card.server.HiMaibobServer$SendingThread
  JHiMaibobServer = interface; //com.ysf.card.server.HiMaibobServer
//  JHiNewCardServer_1 = interface; //com.ysf.card.server.HiNewCardServer$1
  JHiNewCardServer_InnerHandler = interface; //com.ysf.card.server.HiNewCardServer$InnerHandler
  JHiNewCardServer_ReadThread = interface; //com.ysf.card.server.HiNewCardServer$ReadThread
  JHiNewCardServer_SendingThread = interface; //com.ysf.card.server.HiNewCardServer$SendingThread
  JHiNewCardServer = interface; //com.ysf.card.server.HiNewCardServer
//  JHiSoCardServer_1 = interface; //com.ysf.card.server.HiSoCardServer$1
  JHiSoCardServer_InnerHandler = interface; //com.ysf.card.server.HiSoCardServer$InnerHandler
  JHiSoCardServer_ReadThread = interface; //com.ysf.card.server.HiSoCardServer$ReadThread
  JHiSoCardServer_SendingThread = interface; //com.ysf.card.server.HiSoCardServer$SendingThread
  JHiSoCardServer = interface; //com.ysf.card.server.HiSoCardServer
//  JHiUpdateHexServer_1 = interface; //com.ysf.card.server.HiUpdateHexServer$1
  JHiUpdateHexServer_InnerHandler = interface; //com.ysf.card.server.HiUpdateHexServer$InnerHandler
  JHiUpdateHexServer_ReadThread = interface; //com.ysf.card.server.HiUpdateHexServer$ReadThread
  JHiUpdateHexServer_SendingThread = interface; //com.ysf.card.server.HiUpdateHexServer$SendingThread
  JHiUpdateHexServer = interface; //com.ysf.card.server.HiUpdateHexServer
//  JHiXDLCardServer_1 = interface; //com.ysf.card.server.HiXDLCardServer$1
  JHiXDLCardServer_ReadThread = interface; //com.ysf.card.server.HiXDLCardServer$ReadThread
  JHiXDLCardServer_SendingThread = interface; //com.ysf.card.server.HiXDLCardServer$SendingThread
  JHiXDLCardServer = interface; //com.ysf.card.server.HiXDLCardServer
  JCardAnalyUtil = interface; //com.ysf.card.util.CardAnalyUtil
//  JDateUtil_1 = interface; //com.ysf.card.util.DateUtil$1
//  JDateUtil_2 = interface; //com.ysf.card.util.DateUtil$2
//  JDateUtil_3 = interface; //com.ysf.card.util.DateUtil$3
//  JDateUtil_4 = interface; //com.ysf.card.util.DateUtil$4
  JDateUtil = interface; //com.ysf.card.util.DateUtil
  JHexUpdateUtil = interface; //com.ysf.card.util.HexUpdateUtil
  JLibraryConstants_CardType = interface; //com.ysf.card.util.LibraryConstants$CardType
  JLibraryConstants = interface; //com.ysf.card.util.LibraryConstants
  JLoggerUtil = interface; //com.ysf.card.util.LoggerUtil
  JMD5Util = interface; //com.ysf.card.util.MD5Util
  JMyDateFileNameGenerator = interface; //com.ysf.card.util.MyDateFileNameGenerator
  JMyFlattener = interface; //com.ysf.card.util.MyFlattener
//  JCardReadCountDao_Properties = interface; //com.ysf.greendao.CardReadCountDao$Properties
//  JCardReadCountDao = interface; //com.ysf.greendao.CardReadCountDao
//  JCardsDao_Properties = interface; //com.ysf.greendao.CardsDao$Properties
//  JCardsDao = interface; //com.ysf.greendao.CardsDao
  JDatabaseContext = interface; //com.ysf.greendao.common.DatabaseContext
//  JDbOpenHelper = interface; //com.ysf.greendao.common.DbOpenHelper
//  JHifondDaoUtil_1 = interface; //com.ysf.greendao.common.HifondDaoUtil$1
  JHifondDaoUtil_SingletonLoader = interface; //com.ysf.greendao.common.HifondDaoUtil$SingletonLoader
  JHifondDaoUtil = interface; //com.ysf.greendao.common.HifondDaoUtil
//  JMigrationHelper = interface; //com.ysf.greendao.common.MigrationHelper
//  JDaoMaster_DevOpenHelper = interface; //com.ysf.greendao.DaoMaster$DevOpenHelper
//  JDaoMaster_OpenHelper = interface; //com.ysf.greendao.DaoMaster$OpenHelper
//  JDaoMaster = interface; //com.ysf.greendao.DaoMaster
//  JDaoSession = interface; //com.ysf.greendao.DaoSession
  JCardReadCount = interface; //com.ysf.greendao.entry.CardReadCount
  JCards = interface; //com.ysf.greendao.entry.Cards
  JModulesTable = interface; //com.ysf.greendao.entry.ModulesTable
//  JModulesTableDao_Properties = interface; //com.ysf.greendao.ModulesTableDao$Properties
//  JModulesTableDao = interface; //com.ysf.greendao.ModulesTableDao
  JSerialPort = interface; //com.ysf.serialporttool.SerialPort
  JSerialPortFinder_Driver = interface; //com.ysf.serialporttool.SerialPortFinder$Driver
  JSerialPortFinder = interface; //com.ysf.serialporttool.SerialPortFinder
//  JCardServer_1 = interface; //com.ysf.serialporttool.server.CardServer$1
  JCardServer_SendingThread = interface; //com.ysf.serialporttool.server.CardServer$SendingThread
  JCardServer = interface; //com.ysf.serialporttool.server.CardServer
//  JMyBaseServer_1 = interface; //com.ysf.serialporttool.server.MyBaseServer$1
  JMyBaseServer_ReadThread = interface; //com.ysf.serialporttool.server.MyBaseServer$ReadThread
  JMyBaseServer = interface; //com.ysf.serialporttool.server.MyBaseServer
  JByteUtil = interface; //com.ysf.serialporttool.util.ByteUtil
  JCardCommandUtil = interface; //com.ysf.serialporttool.util.CardCommandUtil
  JDevice = interface; //com.ysf.serialporttool.util.Device
  JDigitalTrans = interface; //com.ysf.serialporttool.util.DigitalTrans
  JDriver = interface; //com.ysf.serialporttool.util.Driver
  JFastJsonUtil = interface; //com.ysf.serialporttool.util.FastJsonUtil
//  JSerialPortFinder_111 = interface; //com.ysf.serialporttool.util.SerialPortFinder
  JSerialPortUtil_SingletonLoader = interface; //com.ysf.serialporttool.util.SerialPortUtil$SingletonLoader
  JSerialPortUtil = interface; //com.ysf.serialporttool.util.SerialPortUtil
  JStringUtil = interface; //com.ysf.serialporttool.util.StringUtil

// ===== Forward SuperClasses declarations =====
////


//  JaClass = interface(JObjectClass)
//  ['{667F6BD3-75D4-4A07-A95F-03CA73443D18}']
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
//  ['{F18163BA-361F-468E-B025-DAFA69010A31}']
//    { Property Methods }
//
//    { methods }
//    function a(P1: TJavaArray<Byte>; P2: JString; P3: TJavaArray<Byte>; P4: TJavaArray<Byte>; P5: TJavaArray<Byte>; P6: TJavaArray<Byte>; P7: TJavaArray<Byte>; P8: TJavaArray<Byte>; P9: TJavaArray<Byte>; P10: TJavaArray<Byte>; P11: TJavaArray<Byte>; P12: TJavaArray<Byte>; P13: TJavaArray<Byte>): Integer; cdecl; overload;
//    function a(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Integer; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  Ja_001Class = interface(JObjectClass)
//  ['{20BA9ED8-3FFF-4185-A501-25A8A5A657F1}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: TJavaArray<Byte>): TJavaArray<Integer>; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/a/b/a')]
//  Ja_001 = interface(JObject)
//  ['{2227B2A0-C006-4B0C-A19A-979CC3222E92}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa_001 = class(TJavaGenericImport<Ja_001Class, Ja_001>) end;

  JRAW2BMPClass = interface(JObjectClass)
  ['{A2C62A05-3F96-4B82-A90D-488C80339CAC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRAW2BMP; cdecl;
    {class} procedure BGR2BMP(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: JString); cdecl;
    {class} function HS_RAW2BMP(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/example/libdecodewlt/RAW2BMP')]
  JRAW2BMP = interface(JObject)
  ['{AA9FCA84-5EC0-48A1-B805-762823EE73F4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRAW2BMP = class(TJavaGenericImport<JRAW2BMPClass, JRAW2BMP>) end;

  JCardListenerReDataClass = interface(JObjectClass)
  ['{ED5FA9C1-73F1-4614-A86B-DB6D45F59A89}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardListenerReData; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/card/CardListenerReData')]
  JCardListenerReData = interface(JObject)
  ['{685EFCFC-8BAF-4C6B-BF83-6EC17F13436D}']
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
  ['{AFC86B17-3762-44D6-813A-055FBCB8893F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardNative; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/card/CardNative')]
  JCardNative = interface(JObject)
  ['{54044F7E-E4A4-4CE7-87DD-862DF3AEE842}']
    { Property Methods }

    { methods }
    function openSerial(P1: JString; P2: Integer): Integer; cdecl;
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

    { Property }
  end;

  TJCardNative = class(TJavaGenericImport<JCardNativeClass, JCardNative>) end;

  JCardNativeReturnDataClass = interface(JObjectClass)
  ['{1A502C2C-0FBF-4F59-B032-FE4C58D54592}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardNativeReturnData; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/card/CardNativeReturnData')]
  JCardNativeReturnData = interface(JObject)
  ['{EF5ACBBE-38A4-469D-875B-96A745B10A22}']
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
    function _Getexpire: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setexpire(aexpire: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    property expire: JString read _Getexpire write _Setexpire;
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
  end;

  TJCardNativeReturnData = class(TJavaGenericImport<JCardNativeReturnDataClass, JCardNativeReturnData>) end;

//  JCardNativeUtil_1Class = interface(JObjectClass)
//  ['{AA92B7B0-988F-4B53-A866-C56504DA7D4F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/hifond/cardlibrary/card/CardNativeUtil$1')]
//  JCardNativeUtil_1 = interface(JObject)
//  ['{C05DAF6B-4CD2-441B-B3CC-DE6AB0D358DF}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJCardNativeUtil_1 = class(TJavaGenericImport<JCardNativeUtil_1Class, JCardNativeUtil_1>) end;

  JCardNativeUtil_SingletonLoaderClass = interface(JObjectClass)
  ['{988E5BC8-0975-47C8-AF89-E18AA4918437}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/CardNativeUtil$SingletonLoader')]
  JCardNativeUtil_SingletonLoader = interface(JObject)
  ['{A3F29C24-8284-4EDA-8097-242B7E8BB922}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCardNativeUtil_SingletonLoader = class(TJavaGenericImport<JCardNativeUtil_SingletonLoaderClass, JCardNativeUtil_SingletonLoader>) end;

  JCardNativeUtilClass = interface(JObjectClass)
  ['{0B67B70E-7D70-4524-BB05-1EC8C9625067}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JCardNativeUtil; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/CardNativeUtil')]
  JCardNativeUtil = interface(JObject)
  ['{08CA3CE7-9749-4A47-98EA-7832EDA4EBB3}']
    { Property Methods }

    { methods }
    procedure openSerial; cdecl; overload;
    procedure openSerial(P1: JString; P2: Integer); cdecl; overload;
    procedure closeSerial; cdecl;
    procedure setLog(P1: Integer); cdecl;
    function sendcommsg(P1: JString): JString; cdecl;
    function startCardListener(P1: JString): JCardListenerReData; cdecl;
    function throughCard: JCardListenerReData; cdecl;
    function stopCardListener: Integer; cdecl;
    function getVersionName: JString; cdecl;
    function checkPSAM: JString; cdecl;
    function readChipCard(P1: Boolean): JCardNativeReturnData; cdecl;
    function readChipCardBJ: JCardNativeReturnData; cdecl;
    function readDGYH: JCardNativeReturnData; cdecl;
    function readSMYK: JCardNativeReturnData; cdecl;
    function readTSicardNingbo: JCardNativeReturnData; cdecl;
    function readBank: JCardNativeReturnData; cdecl;
    function readSXJC: JCardNativeReturnData; cdecl;
    function readSXJC1: JCardNativeReturnData; cdecl;
    function readIDCard: JCardNativeReturnData; cdecl;
    function readM1(P1: JString; P2: JString): JCardNativeReturnData; cdecl;
    function readM1Uid: JString; cdecl;

    { Property }
  end;

  TJCardNativeUtil = class(TJavaGenericImport<JCardNativeUtilClass, JCardNativeUtil>) end;

  JHifondCardInterfaceClass = interface(JObjectClass)
  ['{75E7449A-866F-4F0C-89D5-78999B333ADB}']
    { static Property Methods }
    {class} function _GetmContext: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHifondCardInterface; cdecl; overload;
    {class} procedure init(P1: JContext; P2: Integer; P3: JString); cdecl; overload;
    {class} procedure init(P1: JContext; P2: JString); cdecl; overload;
    {class} procedure init(P1: JContext); cdecl; overload;
    {class} procedure openModule; cdecl; overload;
    {class} procedure openModule(P1: JString); cdecl; overload;
    {class} procedure openModule(P1: JString; P2: JString; P3: JString); cdecl; overload;
    {class} procedure openModule(P1: JString; P2: JString; P3: JString; P4: JString); cdecl; overload;
    {class} procedure openModule(P1: JString; P2: JString; P3: JString; P4: JString; P5: Boolean); cdecl; overload;
    {class} procedure readUid; cdecl;
    {class} procedure closeModule; cdecl;
    {class} procedure checkHexVersion; cdecl;
    {class} function getSOVersionName: JString; cdecl;
    {class} procedure checkPSAM(P1: Integer); cdecl;
    {class} procedure checkModule; cdecl;
    {class} procedure updateHex(P1: JString); cdecl;

    { static Property }
    {class} property mContext: JContext read _GetmContext;
  end;

  [JavaSignature('com/hifond/cardlibrary/card/HifondCardInterface')]
  JHifondCardInterface = interface(JObject)
  ['{854032C8-6EFA-432E-8B48-122021FFA5F7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHifondCardInterface = class(TJavaGenericImport<JHifondCardInterfaceClass, JHifondCardInterface>) end;

  JHifondConstants_CardTypeClass = interface(JObjectClass)
  ['{1BDBE931-D5CD-405C-B480-4B1DD875BAB7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/HifondConstants$CardType')]
  JHifondConstants_CardType = interface(IJavaInstance)
  ['{4169EFD5-63AB-4FB6-91A9-10366D39BB5F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHifondConstants_CardType = class(TJavaGenericImport<JHifondConstants_CardTypeClass, JHifondConstants_CardType>) end;

  JHifondConstantsClass = interface(JObjectClass)
  ['{3CAB6BC9-1995-46B5-B458-FBECA5E506BB}']
    { static Property Methods }
    {class} function _GetLOG_TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_READ_SUCCESS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_READ_FAIL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECEIVER_SEND_PERMISSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECEIVER_ACTION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECEIVER_EXTRA_KEY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_JC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_FJ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_CT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_TXM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_SFZ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_JC_ZH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_FJ_ZH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_CT_ZH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_TXM_ZH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_SFZ_ZH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_OTHER_ZH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHifondConstants; cdecl;

    { static Property }
    {class} property LOG_TAG: JString read _GetLOG_TAG;
    {class} property CARD_READ_SUCCESS: JString read _GetCARD_READ_SUCCESS;
    {class} property CARD_READ_FAIL: JString read _GetCARD_READ_FAIL;
    {class} property RECEIVER_SEND_PERMISSION: JString read _GetRECEIVER_SEND_PERMISSION;
    {class} property RECEIVER_ACTION: JString read _GetRECEIVER_ACTION;
    {class} property RECEIVER_EXTRA_KEY: JString read _GetRECEIVER_EXTRA_KEY;
    {class} property CARD_JC: JString read _GetCARD_JC;
    {class} property CARD_FJ: JString read _GetCARD_FJ;
    {class} property CARD_CT: JString read _GetCARD_CT;
    {class} property CARD_TXM: JString read _GetCARD_TXM;
    {class} property CARD_SFZ: JString read _GetCARD_SFZ;
    {class} property CARD_JC_ZH: JString read _GetCARD_JC_ZH;
    {class} property CARD_FJ_ZH: JString read _GetCARD_FJ_ZH;
    {class} property CARD_CT_ZH: JString read _GetCARD_CT_ZH;
    {class} property CARD_TXM_ZH: JString read _GetCARD_TXM_ZH;
    {class} property CARD_SFZ_ZH: JString read _GetCARD_SFZ_ZH;
    {class} property CARD_OTHER_ZH: JString read _GetCARD_OTHER_ZH;
  end;

  [JavaSignature('com/hifond/cardlibrary/card/HifondConstants')]
  JHifondConstants = interface(JObject)
  ['{341DE05E-371E-4E00-A2CF-37D9F8DF60C4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHifondConstants = class(TJavaGenericImport<JHifondConstantsClass, JHifondConstants>) end;

  JCardCheckResultClass = interface(JObjectClass)
  ['{CB135DC4-1D58-460B-B328-4923FB1C9A8F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardCheckResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/vo/CardCheckResult')]
  JCardCheckResult = interface(JObject)
  ['{D8995FE6-B87D-4413-A666-5724DF532777}']
    { Property Methods }

    { methods }
    function getpSam1: JString; cdecl;
    procedure setpSam1(P1: JString); cdecl;
    function getpSam2: JString; cdecl;
    procedure setpSam2(P1: JString); cdecl;
    function getModuleInfo: JString; cdecl;
    procedure setModuleInfo(P1: JString); cdecl;
    function getHexInfo: JString; cdecl;
    procedure setHexInfo(P1: JString); cdecl;
    function getResultCode: JString; cdecl;
    procedure setResultCode(P1: JString); cdecl;
    function getCheckType: Integer; cdecl;
    procedure setCheckType(P1: Integer); cdecl;

    { Property }
  end;

  TJCardCheckResult = class(TJavaGenericImport<JCardCheckResultClass, JCardCheckResult>) end;

  JCardInfoClass = interface(JObjectClass)
  ['{54AD6A9E-8934-4984-87AA-8FAFAE39742C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardInfo; cdecl; overload;
    {class} function init(P1: JString; P2: JString): JCardInfo; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/vo/CardInfo')]
  JCardInfo = interface(JObject)
  ['{D17DF821-E251-4F58-8117-B56A9FD34E27}']
    { Property Methods }
    function _GetdistrictCode: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetdistrictCode(adistrictCode: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
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

  JM1TagStringUtilClass = interface(JObjectClass)
  ['{B4EEE057-DD05-4940-B128-250A038FA9F7}']
    { static Property Methods }
    {class} function _GetM1_WXZ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JM1TagStringUtil; cdecl;

    { static Property }
    {class} property M1_WXZ: JString read _GetM1_WXZ;
  end;

  [JavaSignature('com/hifond/cardlibrary/card/vo/M1TagStringUtil')]
  JM1TagStringUtil = interface(JObject)
  ['{36D91AF5-C997-496B-ACC8-EA070EC72568}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJM1TagStringUtil = class(TJavaGenericImport<JM1TagStringUtilClass, JM1TagStringUtil>) end;

//  Ja_a_aClass = interface(JObjectClass)
//  ['{FC607395-3B00-4E52-A137-898D6BD5A379}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/a$a$a')]
//  Ja_a_a = interface(JObject)
//  ['{2120DE2C-B789-444E-A8A5-0CBCFCB4F458}']
//    { Property Methods }
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//    procedure a(P1: JString); cdecl;
//
//    { Property }
//  end;
//
//  TJa_a_a = class(TJavaGenericImport<Ja_a_aClass, Ja_a_a>) end;

//  Ja_aClass = interface(JBinderClass) // or JObjectClass
//  ['{656BBD3A-D765-45AE-BC1D-EE64940FFB1B}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function a(P1: JIBinder): Ja; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/a$a')]
//  Ja_a = interface(JBinder) // or JObject
//  ['{851C69C1-1762-4425-980D-CE40B76CC129}']
//    { Property Methods }
//
//    { methods }
//    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJa_a = class(TJavaGenericImport<Ja_aClass, Ja_a>) end;

//  Ja_017Class = interface(JObjectClass)
//  ['{34B548CA-95E9-412E-978B-0E6B8388BE4F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/a')]
//  Ja_017 = interface(IJavaInstance)
//  ['{EDB96ED7-4D2B-42D6-B775-ED4623F84301}']
//    { Property Methods }
//
//    { methods }
//    procedure a(P1: JString); cdecl;
//
//    { Property }
//  end;
//
//  TJa_017 = class(TJavaGenericImport<Ja_017Class, Ja_017>) end;

//  Jb_a_aClass = interface(JObjectClass)
//  ['{5DA88616-C5F7-4290-BF13-ED4679D7C664}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/b$a$a')]
//  Jb_a_a = interface(JObject)
//  ['{9FE09804-F689-4ADE-9D01-72F20010BE69}']
//    { Property Methods }
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//    procedure updateHex(P1: JString); cdecl;
//    procedure registerCallBack(P1: Ja); cdecl;
//    procedure unregisterCallBack(P1: Ja); cdecl;
//
//    { Property }
//  end;
//
//  TJb_a_a = class(TJavaGenericImport<Jb_a_aClass, Jb_a_a>) end;

//  Jb_aClass = interface(JBinderClass) // or JObjectClass
//  ['{125BC822-E394-43E5-AD7E-37C7E2D30FB7}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb_a; cdecl;
//    {class} function asInterface(P1: JIBinder): Jb; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/b$a')]
//  Jb_a = interface(JBinder) // or JObject
//  ['{D8B9F22A-E28A-4077-8D46-B70F45358288}']
//    { Property Methods }
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  JbClass = interface(JObjectClass)
//  ['{60C9CCD4-50FE-47A5-A35B-35F7484CDBEC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/b')]
//  Jb = interface(IJavaInstance)
//  ['{97C3EAF8-3ADB-467A-A277-A9A240C11AD5}']
//    { Property Methods }
//
//    { methods }
//    procedure updateHex(P1: JString); cdecl;
//    procedure registerCallBack(P1: Ja); cdecl;
//    procedure unregisterCallBack(P1: Ja); cdecl;
//
//    { Property }
//  end;
//
//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

//  Jc_a_aClass = interface(JObjectClass)
//  ['{FA7B18EC-E5D4-4C7C-9801-3D6A547F2BF1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/c$a$a')]
//  Jc_a_a = interface(JObject)
//  ['{58FD055C-3076-4A06-83F4-DA32130AA78D}']
//    { Property Methods }
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//    procedure registerCallBack(P1: Ja); cdecl;
//    procedure unregisterCallBack(P1: Ja); cdecl;
//    procedure openModule(P1: JString); cdecl;
//    procedure closeModule; cdecl;
//    procedure queryModuleVersion; cdecl;
//
//    { Property }
//  end;
//
//  TJc_a_a = class(TJavaGenericImport<Jc_a_aClass, Jc_a_a>) end;

//  Jc_aClass = interface(JBinderClass) // or JObjectClass
//  ['{5E5DAEA8-5778-4A79-99BF-F8E8ACD04691}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jc_a; cdecl;
//    {class} function asInterface(P1: JIBinder): Jc; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/c$a')]
//  Jc_a = interface(JBinder) // or JObject
//  ['{07E5058D-BB2C-4142-AF78-B8F5A65C81D0}']
//    { Property Methods }
//
//    { methods }
//    function asBinder: JIBinder; cdecl;
//    function onTransact(P1: Integer; P2: JParcel; P3: JParcel; P4: Integer): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJc_a = class(TJavaGenericImport<Jc_aClass, Jc_a>) end;

//  JcClass = interface(JObjectClass)
//  ['{9696F71D-A535-48DF-8556-A88BB6830E09}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/a/a/c')]
//  Jc = interface(IJavaInstance)
//  ['{B5AC0C2F-D0C3-4107-8F6C-3A893F4ADC73}']
//    { Property Methods }
//
//    { methods }
//    procedure registerCallBack(P1: Ja); cdecl;
//    procedure unregisterCallBack(P1: Ja); cdecl;
//    procedure openModule(P1: JString); cdecl;
//    procedure closeModule; cdecl;
//    procedure queryModuleVersion; cdecl;
//
//    { Property }
//  end;
//
//  TJc = class(TJavaGenericImport<JcClass, Jc>) end;

  JBMIDataResultClass = interface(JObjectClass)
  ['{371364AA-8443-47FD-9043-308D977C0A71}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBMIDataResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/entry/BMIDataResult')]
  JBMIDataResult = interface(JObject)
  ['{2A0F3AC2-F2BB-4E57-83B8-BA193E956CEC}']
    { Property Methods }

    { methods }
    function getResultDev: JString; cdecl;
    procedure setResultDev(P1: JString); cdecl;
    function getTestDate: JString; cdecl;
    procedure setTestDate(P1: JString); cdecl;
    function getmHeight: JString; cdecl;
    procedure setmHeight(P1: JString); cdecl;
    function getmWeight: JString; cdecl;
    procedure setmWeight(P1: JString); cdecl;
    function getmBMI: JString; cdecl;
    procedure setmBMI(P1: JString); cdecl;
    function getResult: JString; cdecl;
    procedure setResult(P1: JString); cdecl;
    function getResultCode: JString; cdecl;
    procedure setResultCode(P1: JString); cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJBMIDataResult = class(TJavaGenericImport<JBMIDataResultClass, JBMIDataResult>) end;

  JCardInParameterClass = interface(JObjectClass)
  ['{8B45FEC8-F6C1-46CB-9785-2B1010B4D3EB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardInParameter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/entry/CardInParameter')]
  JCardInParameter = interface(JObject)
  ['{C7F38E4F-6B0D-4872-A577-2F83C386EBD2}']
    { Property Methods }

    { methods }
    function getStartCardType: JString; cdecl;
    procedure setStartCardType(P1: JString); cdecl;
    function getFj_addr: JString; cdecl;
    procedure setFj_addr(P1: JString); cdecl;
    function getFj_pwd: JString; cdecl;
    procedure setFj_pwd(P1: JString); cdecl;
    function getM1Tag: JString; cdecl;
    procedure setM1Tag(P1: JString); cdecl;
    function isPsam: Boolean; cdecl;
    procedure setPsam(P1: Boolean); cdecl;
    function isUID: Boolean; cdecl;
    procedure setUID(P1: Boolean); cdecl;

    { Property }
  end;

  TJCardInParameter = class(TJavaGenericImport<JCardInParameterClass, JCardInParameter>) end;

  JHGResultBeanClass = interface(JObjectClass)
  ['{D7E6E56C-2488-491B-8B1B-E70A570F558D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHGResultBean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/entry/HGResultBean')]
  JHGResultBean = interface(JObject)
  ['{96FC8E86-16EE-4DA0-8789-5236BB150762}']
    { Property Methods }

    { methods }
    function getResultDev: JString; cdecl;
    procedure setResultDev(P1: JString); cdecl;
    function toString: JString; cdecl;
    function getTestDate: JString; cdecl;
    procedure setTestDate(P1: JString); cdecl;
    function getSys: JString; cdecl;
    procedure setSys(P1: JString); cdecl;
    function getDia: JString; cdecl;
    procedure setDia(P1: JString); cdecl;
    function getPul: JString; cdecl;
    procedure setPul(P1: JString); cdecl;
    function getResult: JString; cdecl;
    procedure setResult(P1: JString); cdecl;
    function getResultCode: JString; cdecl;
    procedure setResultCode(P1: JString); cdecl;

    { Property }
  end;

  TJHGResultBean = class(TJavaGenericImport<JHGResultBeanClass, JHGResultBean>) end;

//  JHiAIDLCardServer_1Class = interface(Jc_aClass) // or JObjectClass
//  ['{E692A41F-23C7-4845-BF09-7148676A19E8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/server/HiAIDLCardServer$1')]
//  JHiAIDLCardServer_1 = interface(Jc_a) // or JObject
//  ['{DF0FC99A-FCD6-4F5A-8B7C-79F16569F6E2}']
//    { Property Methods }
//
//    { methods }
//    procedure registerCallBack(P1: Ja); cdecl;
//    procedure unregisterCallBack(P1: Ja); cdecl;
//    procedure openModule(P1: JString); cdecl;
//    procedure closeModule; cdecl;
//    procedure queryModuleVersion; cdecl;
//
//    { Property }
//  end;
//
//  TJHiAIDLCardServer_1 = class(TJavaGenericImport<JHiAIDLCardServer_1Class, JHiAIDLCardServer_1>) end;

  JHiAIDLCardServer_InnerHandlerClass = interface(JHandlerClass) // or JObjectClass
  ['{6040916F-7E82-4D60-9D1F-2E496F01AE27}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JHiAIDLCardServer; P2: JHiAIDLCardServer): JHiAIDLCardServer_InnerHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiAIDLCardServer$InnerHandler')]
  JHiAIDLCardServer_InnerHandler = interface(JHandler) // or JObject
  ['{FBC69809-4638-4641-BAB5-12DC751FD270}']
    { Property Methods }

    { methods }
    procedure handleMessage(P1: JMessage); cdecl;

    { Property }
  end;

  TJHiAIDLCardServer_InnerHandler = class(TJavaGenericImport<JHiAIDLCardServer_InnerHandlerClass, JHiAIDLCardServer_InnerHandler>) end;

  JHiAIDLCardServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{E94FC2A4-F025-4466-9BB5-421316CCA8E0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiAIDLCardServer$ReadThread')]
  JHiAIDLCardServer_ReadThread = interface(JThread) // or JObject
  ['{5823450C-1DCD-443E-97C8-18DB183EC080}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiAIDLCardServer_ReadThread = class(TJavaGenericImport<JHiAIDLCardServer_ReadThreadClass, JHiAIDLCardServer_ReadThread>) end;

  JHiAIDLCardServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{09369C18-9A38-40BA-8EAF-90E1998244DD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiAIDLCardServer$SendingThread')]
  JHiAIDLCardServer_SendingThread = interface(JThread) // or JObject
  ['{C7349B7F-6227-415D-A3F9-9FA26E58DA14}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiAIDLCardServer_SendingThread = class(TJavaGenericImport<JHiAIDLCardServer_SendingThreadClass, JHiAIDLCardServer_SendingThread>) end;

  JHiAIDLCardServerClass = interface(JServiceClass) // or JObjectClass
  ['{4D36108B-A08F-4C96-BAE2-4FA5BC5CFF40}']
    { static Property Methods }
    {class} function _GetHI_SO_CARD_SERVER_CHECK_MODULE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_PASM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_OPEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_CLOSE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CARDTYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PSAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CHECK_PSAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_ADDR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PWD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_M1TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetreadCardType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmModuleInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmHexInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiAIDLCardServer; cdecl;

    { static Property }
    {class} property HI_SO_CARD_SERVER_CHECK_MODULE: JString read _GetHI_SO_CARD_SERVER_CHECK_MODULE;
    {class} property HI_SO_CARD_SERVER_PASM: JString read _GetHI_SO_CARD_SERVER_PASM;
    {class} property HI_SO_CARD_SERVER_OPEN: JString read _GetHI_SO_CARD_SERVER_OPEN;
    {class} property HI_SO_CARD_SERVER_CLOSE: JString read _GetHI_SO_CARD_SERVER_CLOSE;
    {class} property INTENT_EXTRA_CARDTYPE: JString read _GetINTENT_EXTRA_CARDTYPE;
    {class} property INTENT_EXTRA_UID: JString read _GetINTENT_EXTRA_UID;
    {class} property INTENT_EXTRA_PSAM: JString read _GetINTENT_EXTRA_PSAM;
    {class} property INTENT_EXTRA_CHECK_PSAN: JString read _GetINTENT_EXTRA_CHECK_PSAN;
    {class} property INTENT_EXTRA_ADDR: JString read _GetINTENT_EXTRA_ADDR;
    {class} property INTENT_EXTRA_PWD: JString read _GetINTENT_EXTRA_PWD;
    {class} property INTENT_EXTRA_M1TAG: JString read _GetINTENT_EXTRA_M1TAG;
    {class} property readCardType: Integer read _GetreadCardType;
    {class} property mModuleInfo: JString read _GetmModuleInfo;
    {class} property mHexInfo: JString read _GetmHexInfo;
  end;

  [JavaSignature('com/ysf/card/server/HiAIDLCardServer')]
  JHiAIDLCardServer = interface(JService) // or JObject
  ['{EB7B39D9-DF99-40DA-B0DB-BFD36B0ECD8A}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    procedure sendCardCheckResult(P1: JCardCheckResult); cdecl;
    procedure sendCardData(P1: JCardInfo; P2: JString); cdecl;
    procedure readCardUUID(P1: JString; P2: JString); cdecl;
    procedure readCard(P1: JString); cdecl;
    procedure getCardUID; cdecl;
    procedure onDestroy; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;

    { Property }
  end;

  TJHiAIDLCardServer = class(TJavaGenericImport<JHiAIDLCardServerClass, JHiAIDLCardServer>) end;

//  JHiCardServer_1Class = interface(JObjectClass)
//  ['{F27A41ED-CF0F-4AB5-BDBA-8EADFA7FDA8D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/server/HiCardServer$1')]
//  JHiCardServer_1 = interface(JObject)
//  ['{250B49C8-2699-49DD-A4FF-0989D0B77AF8}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJHiCardServer_1 = class(TJavaGenericImport<JHiCardServer_1Class, JHiCardServer_1>) end;

  JHiCardServer_InnerHandlerClass = interface(JHandlerClass) // or JObjectClass
  ['{B2845604-487A-44F3-9BE9-DD24E5D65B07}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JHiCardServer; P2: JHiCardServer): JHiCardServer_InnerHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiCardServer$InnerHandler')]
  JHiCardServer_InnerHandler = interface(JHandler) // or JObject
  ['{4FCA3994-4C76-4E82-86E8-25EFAFA78B2A}']
    { Property Methods }

    { methods }
    procedure handleMessage(P1: JMessage); cdecl;

    { Property }
  end;

  TJHiCardServer_InnerHandler = class(TJavaGenericImport<JHiCardServer_InnerHandlerClass, JHiCardServer_InnerHandler>) end;

  JHiCardServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{8EFCAE3F-2A1E-4BD8-8671-985BEFC47F23}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiCardServer$ReadThread')]
  JHiCardServer_ReadThread = interface(JThread) // or JObject
  ['{EDEBA1FA-713E-4B7F-83C8-F4D271086BE8}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_ReadThread = class(TJavaGenericImport<JHiCardServer_ReadThreadClass, JHiCardServer_ReadThread>) end;

  JHiCardServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{BA7F2F0C-7C22-42CE-BEA3-6471EC65F975}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiCardServer$SendingThread')]
  JHiCardServer_SendingThread = interface(JThread) // or JObject
  ['{2A2F76AA-EA95-438D-A2C7-D5DA05735E6C}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_SendingThread = class(TJavaGenericImport<JHiCardServer_SendingThreadClass, JHiCardServer_SendingThread>) end;

  JHiCardServerClass = interface(JServiceClass) // or JObjectClass
  ['{E2FA13E9-5B46-407A-8CA4-F4B0977DA439}']
    { static Property Methods }
    {class} function _GetHI_SO_CARD_SERVER_CHECK_MODULE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_PASM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_OPEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_CLOSE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CARDTYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PSAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CHECK_PSAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_ADDR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PWD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_M1TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetreadCardType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmModuleInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmHexInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiCardServer; cdecl;

    { static Property }
    {class} property HI_SO_CARD_SERVER_CHECK_MODULE: JString read _GetHI_SO_CARD_SERVER_CHECK_MODULE;
    {class} property HI_SO_CARD_SERVER_PASM: JString read _GetHI_SO_CARD_SERVER_PASM;
    {class} property HI_SO_CARD_SERVER_OPEN: JString read _GetHI_SO_CARD_SERVER_OPEN;
    {class} property HI_SO_CARD_SERVER_CLOSE: JString read _GetHI_SO_CARD_SERVER_CLOSE;
    {class} property INTENT_EXTRA_CARDTYPE: JString read _GetINTENT_EXTRA_CARDTYPE;
    {class} property INTENT_EXTRA_UID: JString read _GetINTENT_EXTRA_UID;
    {class} property INTENT_EXTRA_PSAM: JString read _GetINTENT_EXTRA_PSAM;
    {class} property INTENT_EXTRA_CHECK_PSAN: JString read _GetINTENT_EXTRA_CHECK_PSAN;
    {class} property INTENT_EXTRA_ADDR: JString read _GetINTENT_EXTRA_ADDR;
    {class} property INTENT_EXTRA_PWD: JString read _GetINTENT_EXTRA_PWD;
    {class} property INTENT_EXTRA_M1TAG: JString read _GetINTENT_EXTRA_M1TAG;
    {class} property readCardType: Integer read _GetreadCardType;
    {class} property mModuleInfo: JString read _GetmModuleInfo;
    {class} property mHexInfo: JString read _GetmHexInfo;
  end;

  [JavaSignature('com/ysf/card/server/HiCardServer')]
  JHiCardServer = interface(JService) // or JObject
  ['{BA9A12FA-4A17-455B-96B4-6CA4946D1898}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    function proofGroupData(P1: TJavaArray<Byte>): TJavaObjectArray<JString>; cdecl;
    procedure sendCardCheckResult(P1: JCardCheckResult); cdecl;
    procedure sendCardData(P1: JCardInfo; P2: JString); cdecl;
    procedure readCardUUID(P1: JString; P2: JString); cdecl;
    procedure readCard(P1: JString); cdecl;
    procedure getCardUID; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJHiCardServer = class(TJavaGenericImport<JHiCardServerClass, JHiCardServer>) end;

//  JHiLoCardServer_1Class = interface(JObjectClass)
//  ['{3DDB5BDC-A306-4E73-B5FC-8D816EFF70B5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/server/HiLoCardServer$1')]
//  JHiLoCardServer_1 = interface(JObject)
//  ['{557DCE48-C1F6-413D-A2A3-FFA61F66B368}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJHiLoCardServer_1 = class(TJavaGenericImport<JHiLoCardServer_1Class, JHiLoCardServer_1>) end;

  JHiLoCardServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{3009FF03-7706-48BF-8BDC-73E918117EFD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiLoCardServer$ReadThread')]
  JHiLoCardServer_ReadThread = interface(JThread) // or JObject
  ['{A6B158F4-7EC5-49BD-BD35-A8E40C41A2EF}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiLoCardServer_ReadThread = class(TJavaGenericImport<JHiLoCardServer_ReadThreadClass, JHiLoCardServer_ReadThread>) end;

  JHiLoCardServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{0235C5CB-7F6B-419A-ABAC-4AB8D672B662}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiLoCardServer$SendingThread')]
  JHiLoCardServer_SendingThread = interface(JThread) // or JObject
  ['{7932A885-5E3A-40D1-B18D-C702874F5D63}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiLoCardServer_SendingThread = class(TJavaGenericImport<JHiLoCardServer_SendingThreadClass, JHiLoCardServer_SendingThread>) end;

  JHiLoCardServerClass = interface(JServiceClass) // or JObjectClass
  ['{8B4FEBE4-A888-40DB-AC2F-73DD7DC13AC7}']
    { static Property Methods }
    {class} function _GetHI_SO_CARD_SERVER_CHECK_MODULE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_PASM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_OPEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_CLOSE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CARDTYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PSAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CHECK_PSAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_ADDR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PWD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_M1TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetreadCardType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmModuleInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmHexInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiLoCardServer; cdecl;
    {class} function bitmapToBase64(P1: JBitmap): JString; cdecl;

    { static Property }
    {class} property HI_SO_CARD_SERVER_CHECK_MODULE: JString read _GetHI_SO_CARD_SERVER_CHECK_MODULE;
    {class} property HI_SO_CARD_SERVER_PASM: JString read _GetHI_SO_CARD_SERVER_PASM;
    {class} property HI_SO_CARD_SERVER_OPEN: JString read _GetHI_SO_CARD_SERVER_OPEN;
    {class} property HI_SO_CARD_SERVER_CLOSE: JString read _GetHI_SO_CARD_SERVER_CLOSE;
    {class} property INTENT_EXTRA_CARDTYPE: JString read _GetINTENT_EXTRA_CARDTYPE;
    {class} property INTENT_EXTRA_UID: JString read _GetINTENT_EXTRA_UID;
    {class} property INTENT_EXTRA_PSAM: JString read _GetINTENT_EXTRA_PSAM;
    {class} property INTENT_EXTRA_CHECK_PSAN: JString read _GetINTENT_EXTRA_CHECK_PSAN;
    {class} property INTENT_EXTRA_ADDR: JString read _GetINTENT_EXTRA_ADDR;
    {class} property INTENT_EXTRA_PWD: JString read _GetINTENT_EXTRA_PWD;
    {class} property INTENT_EXTRA_M1TAG: JString read _GetINTENT_EXTRA_M1TAG;
    {class} property readCardType: Integer read _GetreadCardType;
    {class} property mModuleInfo: JString read _GetmModuleInfo;
    {class} property mHexInfo: JString read _GetmHexInfo;
  end;

  [JavaSignature('com/ysf/card/server/HiLoCardServer')]
  JHiLoCardServer = interface(JService) // or JObject
  ['{45E317D7-6B4B-4537-A543-651BC59FC91E}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    procedure sendCardCheckResult(P1: JCardCheckResult); cdecl;
    procedure sendCardData(P1: JCardInfo; P2: JString); cdecl;
    procedure readCardUUID(P1: JString; P2: JString); cdecl;
    procedure readCard(P1: JString); cdecl;
    procedure getCardUID; cdecl;

    { Property }
  end;

  TJHiLoCardServer = class(TJavaGenericImport<JHiLoCardServerClass, JHiLoCardServer>) end;

//  JHiMaibobServer_1Class = interface(JObjectClass)
//  ['{B799376B-C8D0-4BEA-81C5-EA1EA183DD87}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/server/HiMaibobServer$1')]
//  JHiMaibobServer_1 = interface(JObject)
//  ['{8E4EB7CC-FD90-4CB5-A253-DA5A6DAC0A6A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJHiMaibobServer_1 = class(TJavaGenericImport<JHiMaibobServer_1Class, JHiMaibobServer_1>) end;

  JHiMaibobServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{F6B5FA59-A249-4CDE-8098-C295F710F3A4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiMaibobServer$ReadThread')]
  JHiMaibobServer_ReadThread = interface(JThread) // or JObject
  ['{775E3C7C-65B5-4810-B1F6-C25A7BC42CCE}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiMaibobServer_ReadThread = class(TJavaGenericImport<JHiMaibobServer_ReadThreadClass, JHiMaibobServer_ReadThread>) end;

  JHiMaibobServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{EC71EE47-B147-4418-AC33-3B01C6D3B093}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiMaibobServer$SendingThread')]
  JHiMaibobServer_SendingThread = interface(JThread) // or JObject
  ['{E5191167-BD5D-492A-A747-A85DE39FF9F7}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiMaibobServer_SendingThread = class(TJavaGenericImport<JHiMaibobServer_SendingThreadClass, JHiMaibobServer_SendingThread>) end;

  JHiMaibobServerClass = interface(JServiceClass) // or JObjectClass
  ['{D3C16757-C225-4C75-AB98-DE14737E5976}']
    { static Property Methods }
    {class} function _Getcontented_cmd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstart_cmd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getstop_cmd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getlock_cmd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _Getunlock_cmd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiMaibobServer; cdecl;
    {class} function getL06bHex(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function sendPacket(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function copyByte(P1: TJavaArray<Byte>; P2: Integer): TJavaArray<Byte>; cdecl;
    {class} procedure main(P1: TJavaObjectArray<JString>); cdecl;
    {class} procedure onDataDeal_checkModule(P1: TJavaArray<Byte>); cdecl;

    { static Property }
    {class} property contented_cmd: JString read _Getcontented_cmd;
    {class} property start_cmd: JString read _Getstart_cmd;
    {class} property stop_cmd: JString read _Getstop_cmd;
    {class} property lock_cmd: JString read _Getlock_cmd;
    {class} property unlock_cmd: JString read _Getunlock_cmd;
  end;

  [JavaSignature('com/ysf/card/server/HiMaibobServer')]
  JHiMaibobServer = interface(JService) // or JObject
  ['{162F3E3C-8A15-4DF6-B7EA-0C1C28979ACA}']
    { Property Methods }

    { methods }
    function onBind(P1: JIntent): JIBinder; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    procedure onCreate; cdecl;
    procedure onDestroy; cdecl;
    function getCardUID: TJavaArray<Byte>; cdecl;
    procedure sendCardData(P1: JHGResultBean); cdecl;

    { Property }
  end;

  TJHiMaibobServer = class(TJavaGenericImport<JHiMaibobServerClass, JHiMaibobServer>) end;

//  JHiNewCardServer_1Class = interface(JObjectClass)
//  ['{A4FF53E7-B6C4-4E32-B1F1-989B0BDBA9D7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/server/HiNewCardServer$1')]
//  JHiNewCardServer_1 = interface(JObject)
//  ['{CF6699D9-F3BF-4407-9462-90A13C0CE276}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJHiNewCardServer_1 = class(TJavaGenericImport<JHiNewCardServer_1Class, JHiNewCardServer_1>) end;

  JHiNewCardServer_InnerHandlerClass = interface(JHandlerClass) // or JObjectClass
  ['{F2B43352-EA01-4EFB-992B-F857472AC4CF}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JHiNewCardServer; P2: JHiNewCardServer): JHiNewCardServer_InnerHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiNewCardServer$InnerHandler')]
  JHiNewCardServer_InnerHandler = interface(JHandler) // or JObject
  ['{3EBFBF1F-5EC2-47BD-942B-29ACF5DA501E}']
    { Property Methods }

    { methods }
    procedure handleMessage(P1: JMessage); cdecl;

    { Property }
  end;

  TJHiNewCardServer_InnerHandler = class(TJavaGenericImport<JHiNewCardServer_InnerHandlerClass, JHiNewCardServer_InnerHandler>) end;

  JHiNewCardServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{CEBEC024-F025-4376-B6B1-61132D0C9B74}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiNewCardServer$ReadThread')]
  JHiNewCardServer_ReadThread = interface(JThread) // or JObject
  ['{E4E24519-43AD-48A4-931C-00C36382BE58}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiNewCardServer_ReadThread = class(TJavaGenericImport<JHiNewCardServer_ReadThreadClass, JHiNewCardServer_ReadThread>) end;

  JHiNewCardServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{6C99A1A4-47CD-4964-A320-CEA179F138D4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiNewCardServer$SendingThread')]
  JHiNewCardServer_SendingThread = interface(JThread) // or JObject
  ['{8FA79F4F-5E69-444B-8B61-93004580D2E5}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiNewCardServer_SendingThread = class(TJavaGenericImport<JHiNewCardServer_SendingThreadClass, JHiNewCardServer_SendingThread>) end;

  JHiNewCardServerClass = interface(JServiceClass) // or JObjectClass
  ['{6308AE24-FFB5-403F-88A6-F3DF1101DF9C}']
    { static Property Methods }
    {class} function _GetHI_SO_CARD_SERVER_CHECK_MODULE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_PASM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_OPEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_CLOSE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CARDTYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PSAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CHECK_PSAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_ADDR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PWD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_M1TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetreadCardType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmModuleInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmHexInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiNewCardServer; cdecl;

    { static Property }
    {class} property HI_SO_CARD_SERVER_CHECK_MODULE: JString read _GetHI_SO_CARD_SERVER_CHECK_MODULE;
    {class} property HI_SO_CARD_SERVER_PASM: JString read _GetHI_SO_CARD_SERVER_PASM;
    {class} property HI_SO_CARD_SERVER_OPEN: JString read _GetHI_SO_CARD_SERVER_OPEN;
    {class} property HI_SO_CARD_SERVER_CLOSE: JString read _GetHI_SO_CARD_SERVER_CLOSE;
    {class} property INTENT_EXTRA_CARDTYPE: JString read _GetINTENT_EXTRA_CARDTYPE;
    {class} property INTENT_EXTRA_UID: JString read _GetINTENT_EXTRA_UID;
    {class} property INTENT_EXTRA_PSAM: JString read _GetINTENT_EXTRA_PSAM;
    {class} property INTENT_EXTRA_CHECK_PSAN: JString read _GetINTENT_EXTRA_CHECK_PSAN;
    {class} property INTENT_EXTRA_ADDR: JString read _GetINTENT_EXTRA_ADDR;
    {class} property INTENT_EXTRA_PWD: JString read _GetINTENT_EXTRA_PWD;
    {class} property INTENT_EXTRA_M1TAG: JString read _GetINTENT_EXTRA_M1TAG;
    {class} property readCardType: Integer read _GetreadCardType;
    {class} property mModuleInfo: JString read _GetmModuleInfo;
    {class} property mHexInfo: JString read _GetmHexInfo;
  end;

  [JavaSignature('com/ysf/card/server/HiNewCardServer')]
  JHiNewCardServer = interface(JService) // or JObject
  ['{139C1AC7-A090-4AD0-B669-F4AF5178F9DF}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    procedure sendCardCheckResult(P1: JCardCheckResult); cdecl;
    procedure sendCardData(P1: JCardInfo; P2: JString); cdecl;
    procedure readCardUUID(P1: JString; P2: JString); cdecl;
    procedure readCard(P1: JString); cdecl;
    procedure getCardUID; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJHiNewCardServer = class(TJavaGenericImport<JHiNewCardServerClass, JHiNewCardServer>) end;

//  JHiSoCardServer_1Class = interface(JObjectClass)
//  ['{3D4EF84F-CD82-4634-8047-BD7820768AD5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/server/HiSoCardServer$1')]
//  JHiSoCardServer_1 = interface(JObject)
//  ['{93C2448E-6791-408E-BACF-CC143854D387}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJHiSoCardServer_1 = class(TJavaGenericImport<JHiSoCardServer_1Class, JHiSoCardServer_1>) end;

  JHiSoCardServer_InnerHandlerClass = interface(JHandlerClass) // or JObjectClass
  ['{80B8E3CD-6D73-4F19-840F-24DA99B950DC}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JHiSoCardServer; P2: JHiSoCardServer): JHiSoCardServer_InnerHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiSoCardServer$InnerHandler')]
  JHiSoCardServer_InnerHandler = interface(JHandler) // or JObject
  ['{EE13C305-A0EA-47AB-A634-32B12CDB1DB5}']
    { Property Methods }

    { methods }
    procedure handleMessage(P1: JMessage); cdecl;

    { Property }
  end;

  TJHiSoCardServer_InnerHandler = class(TJavaGenericImport<JHiSoCardServer_InnerHandlerClass, JHiSoCardServer_InnerHandler>) end;

  JHiSoCardServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{E9572D5A-E5F2-4C6A-9BA3-7302BE20CDC4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiSoCardServer$ReadThread')]
  JHiSoCardServer_ReadThread = interface(JThread) // or JObject
  ['{50375B5E-4B7D-4B42-9CF8-0D9DE2B2A520}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiSoCardServer_ReadThread = class(TJavaGenericImport<JHiSoCardServer_ReadThreadClass, JHiSoCardServer_ReadThread>) end;

  JHiSoCardServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{74D85C73-E99D-42DE-839E-FF55557B0CC4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiSoCardServer$SendingThread')]
  JHiSoCardServer_SendingThread = interface(JThread) // or JObject
  ['{98416385-DA4B-41F2-95F2-879ABB4C54BD}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiSoCardServer_SendingThread = class(TJavaGenericImport<JHiSoCardServer_SendingThreadClass, JHiSoCardServer_SendingThread>) end;

  JHiSoCardServerClass = interface(JServiceClass) // or JObjectClass
  ['{8D9EFE34-1FF0-469B-867D-E8B5F357616F}']
    { static Property Methods }
    {class} function _GetHI_SO_CARD_SERVER_CHECK_MODULE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_PASM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_OPEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_CLOSE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_BEEP: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CARDTYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PSAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CHECK_PSAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_ADDR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PWD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_M1TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetreadCardType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmModuleInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmHexInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiSoCardServer; cdecl;
    {class} procedure main(P1: TJavaObjectArray<JString>); cdecl;

    { static Property }
    {class} property HI_SO_CARD_SERVER_CHECK_MODULE: JString read _GetHI_SO_CARD_SERVER_CHECK_MODULE;
    {class} property HI_SO_CARD_SERVER_PASM: JString read _GetHI_SO_CARD_SERVER_PASM;
    {class} property HI_SO_CARD_SERVER_OPEN: JString read _GetHI_SO_CARD_SERVER_OPEN;
    {class} property HI_SO_CARD_SERVER_CLOSE: JString read _GetHI_SO_CARD_SERVER_CLOSE;
    {class} property HI_SO_CARD_SERVER_BEEP: JString read _GetHI_SO_CARD_SERVER_BEEP;
    {class} property INTENT_EXTRA_CARDTYPE: JString read _GetINTENT_EXTRA_CARDTYPE;
    {class} property INTENT_EXTRA_UID: JString read _GetINTENT_EXTRA_UID;
    {class} property INTENT_EXTRA_PSAM: JString read _GetINTENT_EXTRA_PSAM;
    {class} property INTENT_EXTRA_CHECK_PSAN: JString read _GetINTENT_EXTRA_CHECK_PSAN;
    {class} property INTENT_EXTRA_ADDR: JString read _GetINTENT_EXTRA_ADDR;
    {class} property INTENT_EXTRA_PWD: JString read _GetINTENT_EXTRA_PWD;
    {class} property INTENT_EXTRA_M1TAG: JString read _GetINTENT_EXTRA_M1TAG;
    {class} property readCardType: Integer read _GetreadCardType;
    {class} property mModuleInfo: JString read _GetmModuleInfo;
    {class} property mHexInfo: JString read _GetmHexInfo;
  end;

  [JavaSignature('com/ysf/card/server/HiSoCardServer')]
  JHiSoCardServer = interface(JService) // or JObject
  ['{CDEE91EA-0CAF-4502-9BD8-E5AE68B0165D}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    procedure sendCardCheckResult(P1: JCardCheckResult); cdecl;
    procedure sendCardData(P1: JCardInfo; P2: JString); cdecl;
    procedure readCardUUID(P1: JString; P2: JString); cdecl;
    procedure readCard(P1: JString); cdecl;
    procedure getCardUID; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJHiSoCardServer = class(TJavaGenericImport<JHiSoCardServerClass, JHiSoCardServer>) end;

//  JHiUpdateHexServer_1Class = interface(Jb_aClass) // or JObjectClass
//  ['{0414567F-DBCE-4DD0-B8AF-E7B8E365B69F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/server/HiUpdateHexServer$1')]
//  JHiUpdateHexServer_1 = interface(Jb_a) // or JObject
//  ['{0599097F-56A9-455A-BA16-3144E013FDAE}']
//    { Property Methods }
//
//    { methods }
//    procedure updateHex(P1: JString); cdecl;
//    procedure registerCallBack(P1: Ja); cdecl;
//    procedure unregisterCallBack(P1: Ja); cdecl;
//
//    { Property }
//  end;
//
//  TJHiUpdateHexServer_1 = class(TJavaGenericImport<JHiUpdateHexServer_1Class, JHiUpdateHexServer_1>) end;

  JHiUpdateHexServer_InnerHandlerClass = interface(JHandlerClass) // or JObjectClass
  ['{CC89B4B9-A8D7-4441-AA9F-468AC405B382}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JHiUpdateHexServer; P2: JHiUpdateHexServer): JHiUpdateHexServer_InnerHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiUpdateHexServer$InnerHandler')]
  JHiUpdateHexServer_InnerHandler = interface(JHandler) // or JObject
  ['{C1C5412C-57A7-4370-A49B-BFE0BFF33972}']
    { Property Methods }

    { methods }
    procedure handleMessage(P1: JMessage); cdecl;

    { Property }
  end;

  TJHiUpdateHexServer_InnerHandler = class(TJavaGenericImport<JHiUpdateHexServer_InnerHandlerClass, JHiUpdateHexServer_InnerHandler>) end;

  JHiUpdateHexServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{CDF4B4DB-6066-45E9-9C13-84F56015E821}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiUpdateHexServer$ReadThread')]
  JHiUpdateHexServer_ReadThread = interface(JThread) // or JObject
  ['{367BF875-9DAB-4B60-8FE3-D1D27AA07A24}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiUpdateHexServer_ReadThread = class(TJavaGenericImport<JHiUpdateHexServer_ReadThreadClass, JHiUpdateHexServer_ReadThread>) end;

  JHiUpdateHexServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{73C79FAC-5B2A-4DED-8B1A-4BA70156C827}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiUpdateHexServer$SendingThread')]
  JHiUpdateHexServer_SendingThread = interface(JThread) // or JObject
  ['{6DFE5C9B-138F-44FE-BAAF-AA825455AD9C}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiUpdateHexServer_SendingThread = class(TJavaGenericImport<JHiUpdateHexServer_SendingThreadClass, JHiUpdateHexServer_SendingThread>) end;

  JHiUpdateHexServerClass = interface(JServiceClass) // or JObjectClass
  ['{FCEE27A5-BC23-46E9-9A36-5F06A27458F6}']
    { static Property Methods }
    {class} function _GetHI_HEX_UPDATE_START: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_HEX_UPDATE_CLOSE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_FILEPATH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiUpdateHexServer; cdecl;

    { static Property }
    {class} property HI_HEX_UPDATE_START: JString read _GetHI_HEX_UPDATE_START;
    {class} property HI_HEX_UPDATE_CLOSE: JString read _GetHI_HEX_UPDATE_CLOSE;
    {class} property INTENT_EXTRA_FILEPATH: JString read _GetINTENT_EXTRA_FILEPATH;
  end;

  [JavaSignature('com/ysf/card/server/HiUpdateHexServer')]
  JHiUpdateHexServer = interface(JService) // or JObject
  ['{5873366B-8FF9-425B-A076-568813579008}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    procedure onDestroy; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    function sendPacket(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;

    { Property }
  end;

  TJHiUpdateHexServer = class(TJavaGenericImport<JHiUpdateHexServerClass, JHiUpdateHexServer>) end;

//  JHiXDLCardServer_1Class = interface(JObjectClass)
//  ['{CB03AB84-5B5A-403B-A453-5348BAB6A57B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/server/HiXDLCardServer$1')]
//  JHiXDLCardServer_1 = interface(JObject)
//  ['{2BF38714-35FF-4FD8-B5FE-9C6932236695}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJHiXDLCardServer_1 = class(TJavaGenericImport<JHiXDLCardServer_1Class, JHiXDLCardServer_1>) end;

  JHiXDLCardServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{BD6CEB70-EA53-4138-A02E-5F2664DE975F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiXDLCardServer$ReadThread')]
  JHiXDLCardServer_ReadThread = interface(JThread) // or JObject
  ['{F443EE8E-4D18-454B-8396-187713060D21}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiXDLCardServer_ReadThread = class(TJavaGenericImport<JHiXDLCardServer_ReadThreadClass, JHiXDLCardServer_ReadThread>) end;

  JHiXDLCardServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{BCA26999-B773-471C-9199-35D6D9B9ED53}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/server/HiXDLCardServer$SendingThread')]
  JHiXDLCardServer_SendingThread = interface(JThread) // or JObject
  ['{21564140-CDAE-4BDE-8A9B-A875589EC69B}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiXDLCardServer_SendingThread = class(TJavaGenericImport<JHiXDLCardServer_SendingThreadClass, JHiXDLCardServer_SendingThread>) end;

  JHiXDLCardServerClass = interface(JServiceClass) // or JObjectClass
  ['{8F7A6C39-52C7-42CE-BA46-81943AC969D8}']
    { static Property Methods }
    {class} function _GetHI_SO_CARD_SERVER_CHECK_MODULE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_PASM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_OPEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHI_SO_CARD_SERVER_CLOSE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CARDTYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PSAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CHECK_PSAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_ADDR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_PWD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_M1TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetreadCardType: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmModuleInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmHexInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiXDLCardServer; cdecl;
    {class} function bitmapToBase64(P1: JBitmap): JString; cdecl;

    { static Property }
    {class} property HI_SO_CARD_SERVER_CHECK_MODULE: JString read _GetHI_SO_CARD_SERVER_CHECK_MODULE;
    {class} property HI_SO_CARD_SERVER_PASM: JString read _GetHI_SO_CARD_SERVER_PASM;
    {class} property HI_SO_CARD_SERVER_OPEN: JString read _GetHI_SO_CARD_SERVER_OPEN;
    {class} property HI_SO_CARD_SERVER_CLOSE: JString read _GetHI_SO_CARD_SERVER_CLOSE;
    {class} property INTENT_EXTRA_CARDTYPE: JString read _GetINTENT_EXTRA_CARDTYPE;
    {class} property INTENT_EXTRA_UID: JString read _GetINTENT_EXTRA_UID;
    {class} property INTENT_EXTRA_PSAM: JString read _GetINTENT_EXTRA_PSAM;
    {class} property INTENT_EXTRA_CHECK_PSAN: JString read _GetINTENT_EXTRA_CHECK_PSAN;
    {class} property INTENT_EXTRA_ADDR: JString read _GetINTENT_EXTRA_ADDR;
    {class} property INTENT_EXTRA_PWD: JString read _GetINTENT_EXTRA_PWD;
    {class} property INTENT_EXTRA_M1TAG: JString read _GetINTENT_EXTRA_M1TAG;
    {class} property readCardType: Integer read _GetreadCardType;
    {class} property mModuleInfo: JString read _GetmModuleInfo;
    {class} property mHexInfo: JString read _GetmHexInfo;
  end;

  [JavaSignature('com/ysf/card/server/HiXDLCardServer')]
  JHiXDLCardServer = interface(JService) // or JObject
  ['{28E98D32-311D-4D30-A870-64F627A39FD0}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    procedure sendCardCheckResult(P1: JCardCheckResult); cdecl;
    procedure sendCardData(P1: JCardInfo; P2: JString); cdecl;
    procedure readCardUUID(P1: JString; P2: JString); cdecl;
    procedure readCard(P1: JString); cdecl;
    procedure getCardUID; cdecl;

    { Property }
  end;

  TJHiXDLCardServer = class(TJavaGenericImport<JHiXDLCardServerClass, JHiXDLCardServer>) end;

  JCardAnalyUtilClass = interface(JObjectClass)
  ['{B9E7A805-FF75-48C6-A03B-BDF3C978D85F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardAnalyUtil; cdecl;
    {class} function readFj: JString; cdecl;
    {class} function analysisFj(P1: JString; P2: JString; P3: JString): JCardInfo; cdecl;
    {class} procedure main(P1: TJavaObjectArray<JString>); cdecl;
    {class} function getMD5(P1: JMap): JString; cdecl;
    {class} function readCt(P1: TJavaArray<Byte>; P2: JString): JCardInfo; cdecl;
    {class} function cqetReadCard(P1: JString): JCardInfo; cdecl;
    {class} function createUUID: JString; cdecl;
    {class} function checkCardSex(P1: JString): JString; cdecl;
    {class} function getBitMapUrl: JString; cdecl;
    {class} procedure saveBitmap(P1: JBitmap; P2: JContext); cdecl;
    {class} function bitmapToBase64(P1: JBitmap): JString; cdecl;
    {class} function base64ToBitmap(P1: JString): JBitmap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/CardAnalyUtil')]
  JCardAnalyUtil = interface(JObject)
  ['{C5007F37-9E9B-47A8-BEB5-15607E2EB974}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCardAnalyUtil = class(TJavaGenericImport<JCardAnalyUtilClass, JCardAnalyUtil>) end;

//  JDateUtil_1Class = interface(JThreadLocalClass) // or JObjectClass
//  ['{E9732EE7-DA9D-441F-A303-78DCDF962ECB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/util/DateUtil$1')]
//  JDateUtil_1 = interface(JThreadLocal) // or JObject
//  ['{50A3F185-807B-464F-A153-EE5D58304697}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDateUtil_1 = class(TJavaGenericImport<JDateUtil_1Class, JDateUtil_1>) end;

//  JDateUtil_2Class = interface(JThreadLocalClass) // or JObjectClass
//  ['{A242CAE8-1093-44C8-9DE1-AC6FCE65A86B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/util/DateUtil$2')]
//  JDateUtil_2 = interface(JThreadLocal) // or JObject
//  ['{098D058A-1BA3-45D3-B8C9-844185CEA521}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDateUtil_2 = class(TJavaGenericImport<JDateUtil_2Class, JDateUtil_2>) end;

//  JDateUtil_3Class = interface(JThreadLocalClass) // or JObjectClass
//  ['{6E2D0F1E-005C-423D-9958-5A5F2B310433}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/util/DateUtil$3')]
//  JDateUtil_3 = interface(JThreadLocal) // or JObject
//  ['{49646362-E9EB-47E9-8951-BD0C99FDA5F9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDateUtil_3 = class(TJavaGenericImport<JDateUtil_3Class, JDateUtil_3>) end;

//  JDateUtil_4Class = interface(JThreadLocalClass) // or JObjectClass
//  ['{A179CC13-5697-4606-8529-CA411967B3E5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/card/util/DateUtil$4')]
//  JDateUtil_4 = interface(JThreadLocal) // or JObject
//  ['{C352A462-054F-48AF-8C07-CE5C768FE074}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDateUtil_4 = class(TJavaGenericImport<JDateUtil_4Class, JDateUtil_4>) end;

  JDateUtilClass = interface(JObjectClass)
  ['{D319565B-CE78-42EF-AC9F-62485C9152B3}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDateUtil; cdecl;
    {class} function getDateTime: JString; cdecl;
    {class} function getDate: JString; cdecl; overload;
    {class} function getDate(P1: JString): JDate; cdecl; overload;
    {class} function getDateYMD: JString; cdecl;
    {class} function getDateYMDHMS: JString; cdecl;
    {class} function differentDaysByMillisecond(P1: JDate; P2: JDate): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/DateUtil')]
  JDateUtil = interface(JObject)
  ['{BDED26CD-1B42-44E0-A9F3-7DB1E744E7D0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDateUtil = class(TJavaGenericImport<JDateUtilClass, JDateUtil>) end;

  JHexUpdateUtilClass = interface(JObjectClass)
  ['{F634AE90-09BE-4A6D-AE65-319C085D7F7B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHexUpdateUtil; cdecl;
    {class} function handleActionFoo(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function sendData(P1: JFileInputStream): TJavaArray<Byte>; cdecl;
    {class} function sscanf(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function chartoint(P1: Byte): Byte; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/HexUpdateUtil')]
  JHexUpdateUtil = interface(JObject)
  ['{55610F11-73B9-4B6B-BC93-13F09BD5A704}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHexUpdateUtil = class(TJavaGenericImport<JHexUpdateUtilClass, JHexUpdateUtil>) end;

  JLibraryConstants_CardTypeClass = interface(JObjectClass)
  ['{67C631EF-8FBF-4B99-B14F-5AFEB1BCF2B7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/LibraryConstants$CardType')]
  JLibraryConstants_CardType = interface(IJavaInstance)
  ['{5F5D66AF-36A5-439E-8D6D-4E73FFD32C04}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLibraryConstants_CardType = class(TJavaGenericImport<JLibraryConstants_CardTypeClass, JLibraryConstants_CardType>) end;

  JLibraryConstantsClass = interface(JObjectClass)
  ['{2290D488-EF75-4CC4-9423-0B1AA2057642}']
    { static Property Methods }
    {class} function _GetCARD_READ_SUCCESS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_READ_FAIL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECEIVER_ACTION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECEIVER_ACTION_CHECK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRECEIVER_EXTRA_KEY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_JC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_FJ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_CT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_TXM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_SFZ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_CARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_CSSY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_TX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_XYEY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_CZSY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_SZET: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_DCFFY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_HBXK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_AHSL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_ZZZX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_NON: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_XAYKT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_ZMD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCT_RSZY: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_BJT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_SJZDS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_JMJKK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_ZCET: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_DGYH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_BANK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_YIHE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_QIDAO: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_NINGBO: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_SMYK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfjAddr: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetfjPwd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOG_TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOG_FILE_DIR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSFZ_FILE_DIR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOWN_FILE_DIR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSQLITE_FILE_DIR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JLibraryConstants; cdecl;

    { static Property }
    {class} property CARD_READ_SUCCESS: JString read _GetCARD_READ_SUCCESS;
    {class} property CARD_READ_FAIL: JString read _GetCARD_READ_FAIL;
    {class} property RECEIVER_ACTION: JString read _GetRECEIVER_ACTION;
    {class} property RECEIVER_ACTION_CHECK: JString read _GetRECEIVER_ACTION_CHECK;
    {class} property RECEIVER_EXTRA_KEY: JString read _GetRECEIVER_EXTRA_KEY;
    {class} property CARD_JC: JString read _GetCARD_JC;
    {class} property CARD_FJ: JString read _GetCARD_FJ;
    {class} property CARD_CT: JString read _GetCARD_CT;
    {class} property CARD_TXM: JString read _GetCARD_TXM;
    {class} property CARD_SFZ: JString read _GetCARD_SFZ;
    {class} property M1_CARD: JString read _GetM1_CARD;
    {class} property M1_CSSY: JString read _GetM1_CSSY;
    {class} property M1_TX: JString read _GetM1_TX;
    {class} property M1_XYEY: JString read _GetM1_XYEY;
    {class} property M1_CZSY: JString read _GetM1_CZSY;
    {class} property M1_SZET: JString read _GetM1_SZET;
    {class} property M1_DCFFY: JString read _GetM1_DCFFY;
    {class} property M1_HBXK: JString read _GetM1_HBXK;
    {class} property M1_AHSL: JString read _GetM1_AHSL;
    {class} property M1_ZZZX: JString read _GetM1_ZZZX;
    {class} property M1_NON: JString read _GetM1_NON;
    {class} property M1_XAYKT: JString read _GetM1_XAYKT;
    {class} property M1_ZMD: JString read _GetM1_ZMD;
    {class} property CT_RSZY: JString read _GetCT_RSZY;
    {class} property M1_BJT: JString read _GetM1_BJT;
    {class} property M1_SJZDS: JString read _GetM1_SJZDS;
    {class} property M1_JMJKK: JString read _GetM1_JMJKK;
    {class} property M1_ZCET: JString read _GetM1_ZCET;
    {class} property M1_DGYH: JString read _GetM1_DGYH;
    {class} property M1_BANK: JString read _GetM1_BANK;
    {class} property M1_YIHE: JString read _GetM1_YIHE;
    {class} property M1_QIDAO: JString read _GetM1_QIDAO;
    {class} property M1_NINGBO: JString read _GetM1_NINGBO;
    {class} property M1_SMYK: JString read _GetM1_SMYK;
    {class} property M1TAG: JString read _GetM1TAG;
    {class} property fjAddr: JString read _GetfjAddr;
    {class} property fjPwd: JString read _GetfjPwd;
    {class} property LOG_TAG: JString read _GetLOG_TAG;
    {class} property LOG_FILE_DIR: JString read _GetLOG_FILE_DIR;
    {class} property SFZ_FILE_DIR: JString read _GetSFZ_FILE_DIR;
    {class} property DOWN_FILE_DIR: JString read _GetDOWN_FILE_DIR;
    {class} property SQLITE_FILE_DIR: JString read _GetSQLITE_FILE_DIR;
  end;

  [JavaSignature('com/ysf/card/util/LibraryConstants')]
  JLibraryConstants = interface(JObject)
  ['{E3DE835B-DC89-470A-BD90-0E231F849D4D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLibraryConstants = class(TJavaGenericImport<JLibraryConstantsClass, JLibraryConstants>) end;

  JLoggerUtilClass = interface(JObjectClass)
  ['{E7725A30-2C09-4BA5-A3AB-282EAC0F3317}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLoggerUtil; cdecl;
    {class} procedure i(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure w(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure e(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure json(P1: JString); cdecl;
    {class} procedure xml(P1: JString); cdecl;
    {class} procedure initXLog; cdecl;
    {class} procedure i_file(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure w_file(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure e_file(P1: JString; P2: TJavaObjectArray<JObject>); cdecl;
    {class} procedure json_file(P1: JString); cdecl;
    {class} procedure xml_file(P1: JString); cdecl;
    {class} procedure http_file(P1: JString); cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/LoggerUtil')]
  JLoggerUtil = interface(JObject)
  ['{FF6E4C4C-C249-4A45-8F96-359172FBDD68}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLoggerUtil = class(TJavaGenericImport<JLoggerUtilClass, JLoggerUtil>) end;

  JMD5UtilClass = interface(JObjectClass)
  ['{506ABFC2-FAEE-4F59-86BB-170FBB21FDEE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMD5Util; cdecl;
    {class} function md5EncodeToStr(P1: JString): JString; cdecl;
    {class} function md5EncodeToBytes(P1: JString): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/MD5Util')]
  JMD5Util = interface(JObject)
  ['{D256F9CD-E0F3-44CC-8662-7F90958CA4F7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMD5Util = class(TJavaGenericImport<JMD5UtilClass, JMD5Util>) end;

  JMyDateFileNameGeneratorClass = interface(JObjectClass)
  ['{0604F38F-2CAE-43AF-92F4-69564109F0B4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMyDateFileNameGenerator; cdecl;
    {class} function createLogFileName: JString; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/MyDateFileNameGenerator')]
  JMyDateFileNameGenerator = interface(JObject)
  ['{C6EC125D-EB1A-459F-BDAB-ADA708D4756E}']
    { Property Methods }

    { methods }
    function isFileNameChangeable: Boolean; cdecl;
    function generateFileName(P1: Integer; P2: Int64): JString; cdecl;

    { Property }
  end;

  TJMyDateFileNameGenerator = class(TJavaGenericImport<JMyDateFileNameGeneratorClass, JMyDateFileNameGenerator>) end;

  JMyFlattenerClass = interface(JObjectClass)
  ['{DE6E9FEB-F046-4E90-8CD0-E479D000585B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMyFlattener; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/MyFlattener')]
  JMyFlattener = interface(JObject)
  ['{4DD3F725-306E-496D-A99C-EA9B0A7FCAAD}']
    { Property Methods }

    { methods }
    function flatten(P1: Integer; P2: JString; P3: JString): JCharSequence; cdecl;

    { Property }
  end;

  TJMyFlattener = class(TJavaGenericImport<JMyFlattenerClass, JMyFlattener>) end;

//  JCardReadCountDao_PropertiesClass = interface(JObjectClass)
//  ['{3807DA79-3D76-4AF0-B275-61B90342B287}']
//    { static Property Methods }
//    {class} function _GetId: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCreDate: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCARD_FJ: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCARD_JC: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCARD_CT: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCARD_SCAN: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCARD_SFZ: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JCardReadCountDao_Properties; cdecl;
//
//    { static Property }
//    {class} property Id: JProperty read _GetId;
//    {class} property CreDate: JProperty read _GetCreDate;
//    {class} property CARD_FJ: JProperty read _GetCARD_FJ;
//    {class} property CARD_JC: JProperty read _GetCARD_JC;
//    {class} property CARD_CT: JProperty read _GetCARD_CT;
//    {class} property CARD_SCAN: JProperty read _GetCARD_SCAN;
//    {class} property CARD_SFZ: JProperty read _GetCARD_SFZ;
//  end;
//
//  [JavaSignature('com/ysf/greendao/CardReadCountDao$Properties')]
//  JCardReadCountDao_Properties = interface(JObject)
//  ['{7C45AD53-5974-4433-A021-7AE6F3E8571F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJCardReadCountDao_Properties = class(TJavaGenericImport<JCardReadCountDao_PropertiesClass, JCardReadCountDao_Properties>) end;
//
//  JCardReadCountDaoClass = interface(JAbstractDaoClass) // or JObjectClass
//  ['{960743B2-9A7E-4584-90ED-D69444CDB175}']
//    { static Property Methods }
//    {class} function _GetTABLENAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JDaoConfig): JCardReadCountDao; cdecl; overload;
//    {class} function init(P1: JDaoConfig; P2: JDaoSession): JCardReadCountDao; cdecl; overload;
//    {class} procedure createTable(P1: JDatabase; P2: Boolean); cdecl;
//    {class} procedure dropTable(P1: JDatabase; P2: Boolean); cdecl;
//
//    { static Property }
//    {class} property TABLENAME: JString read _GetTABLENAME;
//  end;
//
//  [JavaSignature('com/ysf/greendao/CardReadCountDao')]
//  JCardReadCountDao = interface(JAbstractDao) // or JObject
//  ['{AE136FD3-C694-4824-8835-316934D1D905}']
//    { Property Methods }
//
//    { methods }
//    function readKey(P1: JCursor; P2: Integer): JLong; cdecl; overload;
//    function readEntity(P1: JCursor; P2: Integer): JCardReadCount; cdecl; overload;
//    procedure readEntity(P1: JCursor; P2: JCardReadCount; P3: Integer); cdecl; overload;
//    function getKey(P1: JCardReadCount): JLong; cdecl; overload;
//    function hasKey(P1: JCardReadCount): Boolean; cdecl; overload;
//    function hasKey(P1: JObject): Boolean; cdecl; overload;
//    function getKey(P1: JObject): JObject; cdecl; overload;
//    procedure readEntity(P1: JCursor; P2: JObject; P3: Integer); cdecl; overload;
//    function readKey(P1: JCursor; P2: Integer): JObject; cdecl; overload;
//    function readEntity(P1: JCursor; P2: Integer): JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJCardReadCountDao = class(TJavaGenericImport<JCardReadCountDaoClass, JCardReadCountDao>) end;
//
//  JCardsDao_PropertiesClass = interface(JObjectClass)
//  ['{947EDFC8-FA24-444C-9EDC-0E102B7D94DF}']
//    { static Property Methods }
//    {class} function _GetId: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCardTyp: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCreDate: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetCreTime: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JCardsDao_Properties; cdecl;
//
//    { static Property }
//    {class} property Id: JProperty read _GetId;
//    {class} property CardTyp: JProperty read _GetCardTyp;
//    {class} property CreDate: JProperty read _GetCreDate;
//    {class} property CreTime: JProperty read _GetCreTime;
//  end;
//
//  [JavaSignature('com/ysf/greendao/CardsDao$Properties')]
//  JCardsDao_Properties = interface(JObject)
//  ['{A85F9D3A-255F-43A7-B4FF-2FB5C4E5EF42}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJCardsDao_Properties = class(TJavaGenericImport<JCardsDao_PropertiesClass, JCardsDao_Properties>) end;
//
//  JCardsDaoClass = interface(JAbstractDaoClass) // or JObjectClass
//  ['{1BE48662-4D2D-42C1-827D-E6109AA91B3E}']
//    { static Property Methods }
//    {class} function _GetTABLENAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JDaoConfig): JCardsDao; cdecl; overload;
//    {class} function init(P1: JDaoConfig; P2: JDaoSession): JCardsDao; cdecl; overload;
//    {class} procedure createTable(P1: JDatabase; P2: Boolean); cdecl;
//    {class} procedure dropTable(P1: JDatabase; P2: Boolean); cdecl;
//
//    { static Property }
//    {class} property TABLENAME: JString read _GetTABLENAME;
//  end;
//
//  [JavaSignature('com/ysf/greendao/CardsDao')]
//  JCardsDao = interface(JAbstractDao) // or JObject
//  ['{F0925DF8-09BF-4AD4-8197-12D6DA6CCEAB}']
//    { Property Methods }
//
//    { methods }
//    function readKey(P1: JCursor; P2: Integer): JLong; cdecl; overload;
//    function readEntity(P1: JCursor; P2: Integer): JCards; cdecl; overload;
//    procedure readEntity(P1: JCursor; P2: JCards; P3: Integer); cdecl; overload;
//    function getKey(P1: JCards): JLong; cdecl; overload;
//    function hasKey(P1: JCards): Boolean; cdecl; overload;
//    function hasKey(P1: JObject): Boolean; cdecl; overload;
//    function getKey(P1: JObject): JObject; cdecl; overload;
//    procedure readEntity(P1: JCursor; P2: JObject; P3: Integer); cdecl; overload;
//    function readKey(P1: JCursor; P2: Integer): JObject; cdecl; overload;
//    function readEntity(P1: JCursor; P2: Integer): JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJCardsDao = class(TJavaGenericImport<JCardsDaoClass, JCardsDao>) end;

  JDatabaseContextClass = interface(JContextWrapperClass) // or JObjectClass
  ['{54ACFFA8-6DAA-42A4-AAC7-65B88A220D8F}']
    { static Property Methods }
    {class} function _GetdbPath: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(P1: JContext; P2: JString): JDatabaseContext; cdecl;

    { static Property }
    {class} property dbPath: JString read _GetdbPath;
  end;

  [JavaSignature('com/ysf/greendao/common/DatabaseContext')]
  JDatabaseContext = interface(JContextWrapper) // or JObject
  ['{DB8CAC6A-863F-4C05-86BB-804B00099604}']
    { Property Methods }

    { methods }
    function getDatabasePath(P1: JString): JFile; cdecl;
    function openOrCreateDatabase(P1: JString; P2: Integer; P3: JSQLiteDatabase_CursorFactory): JSQLiteDatabase; cdecl; overload;
    function openOrCreateDatabase(P1: JString; P2: Integer; P3: JSQLiteDatabase_CursorFactory; P4: JDatabaseErrorHandler): JSQLiteDatabase; cdecl; overload;

    { Property }
  end;

  TJDatabaseContext = class(TJavaGenericImport<JDatabaseContextClass, JDatabaseContext>) end;

//  JDaoMaster_OpenHelperClass = interface(JDatabaseOpenHelperClass) // or JObjectClass
//  ['{428427C6-3684-4556-BBC8-136DA0F56079}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JString): JDaoMaster_OpenHelper; cdecl; overload;
//    {class} function init(P1: JContext; P2: JString; P3: JSQLiteDatabase_CursorFactory): JDaoMaster_OpenHelper; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/greendao/DaoMaster$OpenHelper')]
//  JDaoMaster_OpenHelper = interface(JDatabaseOpenHelper) // or JObject
//  ['{9DFF6379-7718-46E5-8AB7-46767E0DE95C}']
//    { Property Methods }
//
//    { methods }
//    procedure onCreate(P1: JDatabase); cdecl;
//
//    { Property }
//  end;
//
//  TJDaoMaster_OpenHelper = class(TJavaGenericImport<JDaoMaster_OpenHelperClass, JDaoMaster_OpenHelper>) end;
//
//  JDaoMaster_DevOpenHelperClass = interface(JDaoMaster_OpenHelperClass) // or JObjectClass
//  ['{7C8E25B2-B33B-45EA-8B2B-CDF88CC096CE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JString): JDaoMaster_DevOpenHelper; cdecl; overload;
//    {class} function init(P1: JContext; P2: JString; P3: JSQLiteDatabase_CursorFactory): JDaoMaster_DevOpenHelper; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/greendao/DaoMaster$DevOpenHelper')]
//  JDaoMaster_DevOpenHelper = interface(JDaoMaster_OpenHelper) // or JObject
//  ['{2AEEAC9A-221C-43E2-A00A-7A9AD2E4E33E}']
//    { Property Methods }
//
//    { methods }
//    procedure onUpgrade(P1: JDatabase; P2: Integer; P3: Integer); cdecl;
//
//    { Property }
//  end;
//
//  TJDaoMaster_DevOpenHelper = class(TJavaGenericImport<JDaoMaster_DevOpenHelperClass, JDaoMaster_DevOpenHelper>) end;
//
//  JDbOpenHelperClass = interface(JDaoMaster_DevOpenHelperClass) // or JObjectClass
//  ['{0EE92724-0FF0-4DEE-B038-30D518538ECC}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JContext; P2: JString): JDbOpenHelper; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/greendao/common/DbOpenHelper')]
//  JDbOpenHelper = interface(JDaoMaster_DevOpenHelper) // or JObject
//  ['{E03F3E72-4BD3-4795-8EAC-3ED4F01C0682}']
//    { Property Methods }
//
//    { methods }
//    procedure onUpgrade(P1: JDatabase; P2: Integer; P3: Integer); cdecl;
//
//    { Property }
//  end;
//
//  TJDbOpenHelper = class(TJavaGenericImport<JDbOpenHelperClass, JDbOpenHelper>) end;
//
//  JHifondDaoUtil_1Class = interface(JObjectClass)
//  ['{8335D790-F228-431A-B791-CA20937435A8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/greendao/common/HifondDaoUtil$1')]
//  JHifondDaoUtil_1 = interface(JObject)
//  ['{622DB9DA-8AB5-48FC-AE58-E9E9862F2CF4}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJHifondDaoUtil_1 = class(TJavaGenericImport<JHifondDaoUtil_1Class, JHifondDaoUtil_1>) end;

  JHifondDaoUtil_SingletonLoaderClass = interface(JObjectClass)
  ['{14F3B496-66D9-483C-A21F-B14B707468D4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/greendao/common/HifondDaoUtil$SingletonLoader')]
  JHifondDaoUtil_SingletonLoader = interface(JObject)
  ['{CBE3CCBD-7272-47D7-B546-CCF02A5A2610}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHifondDaoUtil_SingletonLoader = class(TJavaGenericImport<JHifondDaoUtil_SingletonLoaderClass, JHifondDaoUtil_SingletonLoader>) end;

  JHifondDaoUtilClass = interface(JObjectClass)
  ['{AD7B99DC-7D43-438F-BEE6-D8F49C0F1B01}']
    { static Property Methods }

    { static Methods }
    {class} procedure initDatabase(P1: JContext); cdecl;
    {class} function getInstance: JHifondDaoUtil; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/greendao/common/HifondDaoUtil')]
  JHifondDaoUtil = interface(JObject)
  ['{6F26DC3F-B0F2-4BCE-A8E9-BB16AC8867CA}']
    { Property Methods }

    { methods }
    procedure addReadCardData(P1: JCardInfo); cdecl;
    function queryCardRead(P1: JString): JCardReadCount; cdecl;
    function queryCards: JList; cdecl;
    procedure saveModuleAndHexInfo(P1: JString; P2: JString); cdecl;
    function getModules: JModulesTable; cdecl;
    procedure deleteModules; cdecl;
    procedure deleteCardRead; cdecl;
//    function getDaoSession: JDaoSession; cdecl;
    function getDb: JSQLiteDatabase; cdecl;

    { Property }
  end;

  TJHifondDaoUtil = class(TJavaGenericImport<JHifondDaoUtilClass, JHifondDaoUtil>) end;

//  JMigrationHelperClass = interface(JObjectClass)
//  ['{F84CF467-F355-4721-92EB-1308CBE5DCCA}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JMigrationHelper; cdecl;
//    {class} procedure migrate(P1: JSQLiteDatabase; P2: TJavaObjectArray<JClass>); cdecl; overload;
//    {class} procedure migrate(P1: JStandardDatabase; P2: TJavaObjectArray<JClass>); cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/greendao/common/MigrationHelper')]
//  JMigrationHelper = interface(JObject)
//  ['{FE198CAB-2F8A-43F6-BDB4-4612035DE632}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJMigrationHelper = class(TJavaGenericImport<JMigrationHelperClass, JMigrationHelper>) end;
//
//  JDaoMasterClass = interface(JAbstractDaoMasterClass) // or JObjectClass
//  ['{1A21DDB0-DA9A-4146-983C-CE03CA54445E}']
//    { static Property Methods }
//    {class} function _GetSCHEMA_VERSION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} procedure createAllTables(P1: JDatabase; P2: Boolean); cdecl;
//    {class} procedure dropAllTables(P1: JDatabase; P2: Boolean); cdecl;
//    {class} function newDevSession(P1: JContext; P2: JString): JDaoSession; cdecl;
//    {class} function init(P1: JSQLiteDatabase): JDaoMaster; cdecl; overload;
//    {class} function init(P1: JDatabase): JDaoMaster; cdecl; overload;
//
//    { static Property }
//    {class} property SCHEMA_VERSION: Integer read _GetSCHEMA_VERSION;
//  end;
//
//  [JavaSignature('com/ysf/greendao/DaoMaster')]
//  JDaoMaster = interface(JAbstractDaoMaster) // or JObject
//  ['{A68AE2BC-7AA6-48FB-9ACD-588B41FD3B19}']
//    { Property Methods }
//
//    { methods }
//    function newSession: JDaoSession; cdecl; overload;
//    function newSession(P1: JIdentityScopeType): JDaoSession; cdecl; overload;
//    function newSession(P1: JIdentityScopeType): JAbstractDaoSession; cdecl; overload;
//    function newSession: JAbstractDaoSession; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJDaoMaster = class(TJavaGenericImport<JDaoMasterClass, JDaoMaster>) end;
//
//  JDaoSessionClass = interface(JAbstractDaoSessionClass) // or JObjectClass
//  ['{76ADBF5A-E6A3-4AFF-8637-75D3F67B7EAB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(P1: JDatabase; P2: JIdentityScopeType; P3: JMap): JDaoSession; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/greendao/DaoSession')]
//  JDaoSession = interface(JAbstractDaoSession) // or JObject
//  ['{7A7425EF-2455-40F6-B348-2E91CB1076E4}']
//    { Property Methods }
//
//    { methods }
//    procedure clear; cdecl;
//    function getCardReadCountDao: JCardReadCountDao; cdecl;
//    function getCardsDao: JCardsDao; cdecl;
//    function getModulesTableDao: JModulesTableDao; cdecl;
//
//    { Property }
//  end;
//
//  TJDaoSession = class(TJavaGenericImport<JDaoSessionClass, JDaoSession>) end;

  JCardReadCountClass = interface(JObjectClass)
  ['{7D01BC2C-1BEB-4329-90E1-C58DE1061095}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: JString; P3: Integer; P4: Integer; P5: Integer; P6: Integer; P7: Integer): JCardReadCount; cdecl; overload;
    {class} function init: JCardReadCount; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/ysf/greendao/entry/CardReadCount')]
  JCardReadCount = interface(JObject)
  ['{D36E9A2D-A1F4-4305-B081-5107BC2C8370}']
    { Property Methods }

    { methods }
    function getId: Int64; cdecl;
    procedure setId(P1: Int64); cdecl;
    function getCreDate: JString; cdecl;
    procedure setCreDate(P1: JString); cdecl;
    function getCARD_FJ: Integer; cdecl;
    procedure setCARD_FJ(P1: Integer); cdecl;
    function getCARD_JC: Integer; cdecl;
    procedure setCARD_JC(P1: Integer); cdecl;
    function getCARD_CT: Integer; cdecl;
    procedure setCARD_CT(P1: Integer); cdecl;
    function getCARD_SCAN: Integer; cdecl;
    procedure setCARD_SCAN(P1: Integer); cdecl;
    function getCARD_SFZ: Integer; cdecl;
    procedure setCARD_SFZ(P1: Integer); cdecl;

    { Property }
  end;

  TJCardReadCount = class(TJavaGenericImport<JCardReadCountClass, JCardReadCount>) end;

  JCardsClass = interface(JObjectClass)
  ['{49FA14E2-4460-4252-9388-D81238A6A380}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: JString; P3: JString; P4: JString): JCards; cdecl; overload;
    {class} function init: JCards; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/ysf/greendao/entry/Cards')]
  JCards = interface(JObject)
  ['{3BA360CB-1995-49B7-AE29-9151A7F50781}']
    { Property Methods }

    { methods }
    function getId: Int64; cdecl;
    procedure setId(P1: Int64); cdecl;
    function getCardTyp: JString; cdecl;
    procedure setCardTyp(P1: JString); cdecl;
    function getCreDate: JString; cdecl;
    procedure setCreDate(P1: JString); cdecl;
    function getCreTime: JString; cdecl;
    procedure setCreTime(P1: JString); cdecl;

    { Property }
  end;

  TJCards = class(TJavaGenericImport<JCardsClass, JCards>) end;

  JModulesTableClass = interface(JObjectClass)
  ['{A4BA2D53-4ED5-4DD5-A873-CE0EB862197C}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: JString; P3: JString): JModulesTable; cdecl; overload;
    {class} function init: JModulesTable; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/ysf/greendao/entry/ModulesTable')]
  JModulesTable = interface(JObject)
  ['{7DA6E6AA-B2E8-406C-B640-0847BE175D09}']
    { Property Methods }

    { methods }
    function getId: Int64; cdecl;
    procedure setId(P1: Int64); cdecl;
    function getModule: JString; cdecl;
    procedure setModule(P1: JString); cdecl;
    function getHexInfo: JString; cdecl;
    procedure setHexInfo(P1: JString); cdecl;

    { Property }
  end;

  TJModulesTable = class(TJavaGenericImport<JModulesTableClass, JModulesTable>) end;

//  JModulesTableDao_PropertiesClass = interface(JObjectClass)
//  ['{294ECC62-45BD-4C45-9863-042B79532161}']
//    { static Property Methods }
//    {class} function _GetId: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetModule: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _GetHexInfo: JProperty;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: JModulesTableDao_Properties; cdecl;
//
//    { static Property }
//    {class} property Id: JProperty read _GetId;
//    {class} property Module: JProperty read _GetModule;
//    {class} property HexInfo: JProperty read _GetHexInfo;
//  end;
//
//  [JavaSignature('com/ysf/greendao/ModulesTableDao$Properties')]
//  JModulesTableDao_Properties = interface(JObject)
//  ['{BDC83883-00A1-4F48-A8A1-E929649F31BD}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJModulesTableDao_Properties = class(TJavaGenericImport<JModulesTableDao_PropertiesClass, JModulesTableDao_Properties>) end;
//
//  JModulesTableDaoClass = interface(JAbstractDaoClass) // or JObjectClass
//  ['{4CEC76D4-ADE4-485D-9006-5465FD3BEE58}']
//    { static Property Methods }
//    {class} function _GetTABLENAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init(P1: JDaoConfig): JModulesTableDao; cdecl; overload;
//    {class} function init(P1: JDaoConfig; P2: JDaoSession): JModulesTableDao; cdecl; overload;
//    {class} procedure createTable(P1: JDatabase; P2: Boolean); cdecl;
//    {class} procedure dropTable(P1: JDatabase; P2: Boolean); cdecl;
//
//    { static Property }
//    {class} property TABLENAME: JString read _GetTABLENAME;
//  end;
//
//  [JavaSignature('com/ysf/greendao/ModulesTableDao')]
//  JModulesTableDao = interface(JAbstractDao) // or JObject
//  ['{8C526D3B-BB35-44AF-BBC3-5B72BC1D49BB}']
//    { Property Methods }
//
//    { methods }
//    function readKey(P1: JCursor; P2: Integer): JLong; cdecl; overload;
//    function readEntity(P1: JCursor; P2: Integer): JModulesTable; cdecl; overload;
//    procedure readEntity(P1: JCursor; P2: JModulesTable; P3: Integer); cdecl; overload;
//    function getKey(P1: JModulesTable): JLong; cdecl; overload;
//    function hasKey(P1: JModulesTable): Boolean; cdecl; overload;
//    function hasKey(P1: JObject): Boolean; cdecl; overload;
//    function getKey(P1: JObject): JObject; cdecl; overload;
//    procedure readEntity(P1: JCursor; P2: JObject; P3: Integer); cdecl; overload;
//    function readKey(P1: JCursor; P2: Integer): JObject; cdecl; overload;
//    function readEntity(P1: JCursor; P2: Integer): JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJModulesTableDao = class(TJavaGenericImport<JModulesTableDaoClass, JModulesTableDao>) end;

  JSerialPortClass = interface(JObjectClass)
  ['{2A5CFB07-6F8F-4EBA-9775-77C06BB2FDC6}']
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
  ['{DB22EDE9-F556-4DBE-A987-DC984EBC0E20}']
    { Property Methods }

    { methods }
    function getInputStream: JInputStream; cdecl;
    function getOutputStream: JOutputStream; cdecl;
    procedure close; cdecl;

    { Property }
  end;

  TJSerialPort = class(TJavaGenericImport<JSerialPortClass, JSerialPort>) end;

  JSerialPortFinder_DriverClass = interface(JObjectClass)
  ['{B9FCAD58-D8F5-4BAB-917B-4C55F84B1A57}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JSerialPortFinder; P2: JString; P3: JString): JSerialPortFinder_Driver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/SerialPortFinder$Driver')]
  JSerialPortFinder_Driver = interface(JObject)
  ['{FFCBC9A5-CB11-425F-8216-8F1093410553}']
    { Property Methods }

    { methods }
//    function getDevices: JVector; cdecl;
    function getName: JString; cdecl;

    { Property }
  end;

  TJSerialPortFinder_Driver = class(TJavaGenericImport<JSerialPortFinder_DriverClass, JSerialPortFinder_Driver>) end;

  JSerialPortFinderClass = interface(JObjectClass)
  ['{643123B2-BA19-4E6F-A928-024253762F0A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSerialPortFinder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/SerialPortFinder')]
  JSerialPortFinder = interface(JObject)
  ['{3D732B6A-2027-4DC5-853B-D52971C7000A}']
    { Property Methods }

    { methods }
    function getAllDevices: TJavaObjectArray<JString>; cdecl;
    function getAllDevicesPath: TJavaObjectArray<JString>; cdecl;

    { Property }
  end;

  TJSerialPortFinder = class(TJavaGenericImport<JSerialPortFinderClass, JSerialPortFinder>) end;

//  JCardServer_1Class = interface(JObjectClass)
//  ['{1A97C537-D5DF-4ED2-BB8F-478E8A047D3F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/server/CardServer$1')]
//  JCardServer_1 = interface(JObject)
//  ['{C5910B9E-5294-413C-8C77-AF745095805A}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJCardServer_1 = class(TJavaGenericImport<JCardServer_1Class, JCardServer_1>) end;

  JCardServer_SendingThreadClass = interface(JThreadClass) // or JObjectClass
  ['{AF7F9327-75AD-49EC-9B31-28F12A14A29B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/server/CardServer$SendingThread')]
  JCardServer_SendingThread = interface(JThread) // or JObject
  ['{6236068C-F74F-4537-8A9C-212F65F52EB5}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJCardServer_SendingThread = class(TJavaGenericImport<JCardServer_SendingThreadClass, JCardServer_SendingThread>) end;

  JMyBaseServerClass = interface(JServiceClass) // or JObjectClass
  ['{3E5D4593-AEBF-455A-B0B8-0FF79F1B1D35}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMyBaseServer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/server/MyBaseServer')]
  JMyBaseServer = interface(JService) // or JObject
  ['{0916D987-8A1B-4960-BFC7-83696E7CB24B}']
    { Property Methods }

    { methods }
    function onBind(P1: JIntent): JIBinder; cdecl;
    procedure onCreate; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJMyBaseServer = class(TJavaGenericImport<JMyBaseServerClass, JMyBaseServer>) end;

  JCardServerClass = interface(JMyBaseServerClass) // or JObjectClass
  ['{5D9C5BEC-B013-47AF-BB96-D78536D3A4F7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardServer; cdecl;
    {class} procedure readCardUUID(P1: JString; P2: JString); cdecl;
    {class} procedure readCard(P1: JString); cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/server/CardServer')]
  JCardServer = interface(JMyBaseServer) // or JObject
  ['{1415862A-7CD5-4F99-BD19-6E69AD0C08F6}']
    { Property Methods }

    { methods }
    procedure onCreate; cdecl;
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer; cdecl;
    function onBind(P1: JIntent): JIBinder; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJCardServer = class(TJavaGenericImport<JCardServerClass, JCardServer>) end;

//  JMyBaseServer_1Class = interface(JObjectClass)
//  ['{7F75C74E-9A1F-46D1-9079-355D06ABA283}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/server/MyBaseServer$1')]
//  JMyBaseServer_1 = interface(JObject)
//  ['{0783C0B8-8F19-4CD2-81E0-7F45F40124C7}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJMyBaseServer_1 = class(TJavaGenericImport<JMyBaseServer_1Class, JMyBaseServer_1>) end;

  JMyBaseServer_ReadThreadClass = interface(JThreadClass) // or JObjectClass
  ['{4F4D1DBC-16BD-4558-B24D-8E1AD083D674}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/server/MyBaseServer$ReadThread')]
  JMyBaseServer_ReadThread = interface(JThread) // or JObject
  ['{77746F53-78FF-4931-926E-E903EB6B4A02}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJMyBaseServer_ReadThread = class(TJavaGenericImport<JMyBaseServer_ReadThreadClass, JMyBaseServer_ReadThread>) end;

  JByteUtilClass = interface(JObjectClass)
  ['{062D894D-2D74-4F3D-B93B-551E01EABD29}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteUtil; cdecl;
    {class} function bytes2HexStr(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function bytes2HexStr(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function hexStr2decimal(P1: JString): Int64; cdecl;
    {class} function decimal2fitHex(P1: Int64): JString; cdecl; overload;
    {class} function decimal2fitHex(P1: Int64; P2: Integer): JString; cdecl; overload;
    {class} function fitDecimalStr(P1: Integer; P2: Integer): JString; cdecl;
    {class} function str2HexString(P1: JString): JString; cdecl;
    {class} function hexStr2bytes(P1: JString): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/util/ByteUtil')]
  JByteUtil = interface(JObject)
  ['{D16C77D4-32B8-4706-887F-E043AD84C17C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteUtil = class(TJavaGenericImport<JByteUtilClass, JByteUtil>) end;

  JCardCommandUtilClass = interface(JObjectClass)
  ['{CB930329-A9CE-4F7B-BB24-82A4B3C4EE25}']
    { static Property Methods }
    {class} function _GetCMD_APP: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_BEEP: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_SN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CVN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_TON: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_BOOT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_IDFU: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_ODFU: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CardStatus: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_GetCardStatus: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_ADPU: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_ColdReset: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_WarmReset: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PowerDown: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_TypeAPowerOn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_TypeBPowerOn: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_ConteCtless_APDU: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_M1_AUTH: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_M1_Read: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_M1_Write: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_M1_Incval: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_M1_Decval: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_M1_LoadKey: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_M1_GetUID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_REQ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_SEL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_READ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_READ_EX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_UID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_Fcard: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_START_CARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CLOSE_CARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_QUERY_CARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_JC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_FJ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_CT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_SCAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_IDCARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_ALL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_HEX_UPDATE_START: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_HEX_UPDATE_END: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCardCommandUtil; cdecl;
    {class} function getCmd(P1: JString): JString; cdecl;
    {class} function proofGroupData(P1: TJavaArray<Byte>): TJavaObjectArray<JString>; cdecl;
    {class} function isALegalByte(P1: TJavaArray<Byte>): Boolean; cdecl;
    {class} function isALegalData(P1: TJavaArray<Byte>): Boolean; cdecl;
    {class} function isEnd(P1: TJavaArray<Byte>): Boolean; cdecl;
    {class} function byteMergerAll(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function getLenInt(P1: JString): Integer; cdecl;
    {class} function bytes4ToInt(P1: TJavaArray<Byte>): Integer; cdecl;
    {class} function getLenStr(P1: Integer): JString; cdecl;
    {class} function intToBytes4L(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function getBCC(P1: JString): JString; cdecl; overload;
    {class} function getBCC_Low(P1: JString): JString; cdecl; overload;
    {class} function getBCC(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function getBCC_Low(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function bytes2HexStr(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function bytes2HexStr(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function hexStr2bytes(P1: JString): TJavaArray<Byte>; cdecl;

    { static Property }
    {class} property CMD_APP: JString read _GetCMD_APP;
    {class} property CMD_BEEP: JString read _GetCMD_BEEP;
    {class} property CMD_SN: JString read _GetCMD_SN;
    {class} property CMD_CVN: JString read _GetCMD_CVN;
    {class} property CMD_TON: JString read _GetCMD_TON;
    {class} property CMD_BOOT: JString read _GetCMD_BOOT;
    {class} property CMD_IDFU: JString read _GetCMD_IDFU;
    {class} property CMD_ODFU: JString read _GetCMD_ODFU;
    {class} property CMD_CardStatus: JString read _GetCMD_CardStatus;
    {class} property CMD_GetCardStatus: JString read _GetCMD_GetCardStatus;
    {class} property CMD_ADPU: JString read _GetCMD_ADPU;
    {class} property CMD_ColdReset: JString read _GetCMD_ColdReset;
    {class} property CMD_WarmReset: JString read _GetCMD_WarmReset;
    {class} property CMD_PowerDown: JString read _GetCMD_PowerDown;
    {class} property CMD_TypeAPowerOn: JString read _GetCMD_TypeAPowerOn;
    {class} property CMD_TypeBPowerOn: JString read _GetCMD_TypeBPowerOn;
    {class} property CMD_ConteCtless_APDU: JString read _GetCMD_ConteCtless_APDU;
    {class} property CMD_M1_AUTH: JString read _GetCMD_M1_AUTH;
    {class} property CMD_M1_Read: JString read _GetCMD_M1_Read;
    {class} property CMD_M1_Write: JString read _GetCMD_M1_Write;
    {class} property CMD_M1_Incval: JString read _GetCMD_M1_Incval;
    {class} property CMD_M1_Decval: JString read _GetCMD_M1_Decval;
    {class} property CMD_M1_LoadKey: JString read _GetCMD_M1_LoadKey;
    {class} property CMD_M1_GetUID: JString read _GetCMD_M1_GetUID;
    {class} property CMD_REQ: JString read _GetCMD_REQ;
    {class} property CMD_SEL: JString read _GetCMD_SEL;
    {class} property CMD_READ: JString read _GetCMD_READ;
    {class} property CMD_READ_EX: JString read _GetCMD_READ_EX;
    {class} property CMD_UID: JString read _GetCMD_UID;
    {class} property CMD_Fcard: JString read _GetCMD_Fcard;
    {class} property CMD_START_CARD: JString read _GetCMD_START_CARD;
    {class} property CMD_CLOSE_CARD: JString read _GetCMD_CLOSE_CARD;
    {class} property CMD_QUERY_CARD: JString read _GetCMD_QUERY_CARD;
    {class} property CMD_CARD_JC: JString read _GetCMD_CARD_JC;
    {class} property CMD_CARD_FJ: JString read _GetCMD_CARD_FJ;
    {class} property CMD_CARD_CT: JString read _GetCMD_CARD_CT;
    {class} property CMD_CARD_SCAN: JString read _GetCMD_CARD_SCAN;
    {class} property CMD_CARD_IDCARD: JString read _GetCMD_CARD_IDCARD;
    {class} property CMD_CARD_ALL: JString read _GetCMD_CARD_ALL;
    {class} property CMD_HEX_UPDATE_START: JString read _GetCMD_HEX_UPDATE_START;
    {class} property CMD_HEX_UPDATE_END: JString read _GetCMD_HEX_UPDATE_END;
    {class} property CMD_PSAM_CARD_1: JString read _GetCMD_PSAM_CARD_1;
    {class} property CMD_PSAM_CARD_2: JString read _GetCMD_PSAM_CARD_2;
  end;

  [JavaSignature('com/ysf/serialporttool/util/CardCommandUtil')]
  JCardCommandUtil = interface(JObject)
  ['{3246207E-455D-455A-9554-809E005FE7AC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCardCommandUtil = class(TJavaGenericImport<JCardCommandUtilClass, JCardCommandUtil>) end;

  JDeviceClass = interface(JObjectClass)
  ['{9A9700DE-0FA9-4B82-AD82-1354B3045580}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JString; P3: JFile): JDevice; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/util/Device')]
  JDevice = interface(JObject)
  ['{1F25E3E7-6AA3-49D9-BF1A-E98A291FB3ED}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl;
    procedure setName(P1: JString); cdecl;
    function getRoot: JString; cdecl;
    procedure setRoot(P1: JString); cdecl;
    function getFile: JFile; cdecl;
    procedure setFile(P1: JFile); cdecl;

    { Property }
  end;

  TJDevice = class(TJavaGenericImport<JDeviceClass, JDevice>) end;

  JDigitalTransClass = interface(JObjectClass)
  ['{8CF85E63-CDCD-479A-B69B-BC7E2DF0F36D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDigitalTrans; cdecl;
    {class} function intToBytes4L(P1: Integer): TJavaArray<Byte>; cdecl;
    {class} function bytesToHexString(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function bytes2BinaryStr(P1: Byte): JString; cdecl;
    {class} procedure main(P1: TJavaObjectArray<JString>); cdecl;
    {class} function addZeroForNum(P1: JString; P2: Integer): JString; cdecl;
    {class} function hexStringToBytesForInv(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function &array(P1: JString): JString; cdecl;
    {class} function bytesToHexString(P1: Byte): JString; cdecl; overload;
    {class} function byteToHexString(P1: Byte): JString; cdecl;
    {class} function hexStringToBytes(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function hexStringToByte(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function StringToAsciiString(P1: JString): JString; cdecl;
    {class} function hexStringToString(P1: JString; P2: Integer): JString; cdecl;
    {class} function hexStringToAlgorism(P1: JString): Integer; cdecl;
    {class} function hexStringToBinary(P1: JString): JString; cdecl;
    {class} function AsciiStringToString(P1: JString): JString; cdecl;
    {class} function algorismToHEXString(P1: Int64; P2: Integer): JString; cdecl; overload;
    {class} function longalgorismToHEXString(P1: Int64; P2: Integer): JString; cdecl;
    {class} function bytetoString(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function binaryToAlgorism(P1: JString): Integer; cdecl;
    {class} function algorismToHEXString(P1: Integer): JString; cdecl; overload;
    {class} function patchHexString(P1: JString; P2: Integer): JString; cdecl;
    {class} function parseToInt(P1: JString; P2: Integer; P3: Integer): Integer; cdecl; overload;
    {class} function parseToInt(P1: JString; P2: Integer): Integer; cdecl; overload;
    {class} function hex2byte(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function byte2hex(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function copyByte(P1: JArrayList): TJavaArray<Byte>; cdecl;
    {class} function getTimeID: JString; cdecl;
    {class} function encrypt(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/util/DigitalTrans')]
  JDigitalTrans = interface(JObject)
  ['{BEA6052F-5F9F-40D7-B442-DECB66C285A1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDigitalTrans = class(TJavaGenericImport<JDigitalTransClass, JDigitalTrans>) end;

  JDriverClass = interface(JObjectClass)
  ['{0B2BBC2A-209E-43CE-A3E1-6AB5E325B546}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: JString; P2: JString): JDriver; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/util/Driver')]
  JDriver = interface(JObject)
  ['{82D52ADA-8CD4-4963-AC22-09748BDBCE75}']
    { Property Methods }

    { methods }
    function getDevices: JArrayList; cdecl;
    function getName: JString; cdecl;

    { Property }
  end;

  TJDriver = class(TJavaGenericImport<JDriverClass, JDriver>) end;

  JFastJsonUtilClass = interface(JObjectClass)
  ['{A2883F54-1F92-4818-860C-C831D1D93C34}']
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
  ['{7950271F-C811-4807-AAA2-EA27C459F7A3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFastJsonUtil = class(TJavaGenericImport<JFastJsonUtilClass, JFastJsonUtil>) end;

//  JSerialPortFinder_111Class = interface(JObjectClass)
//  ['{E4A51208-3BAB-4511-8D9C-CB9D91064BE6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JSerialPortFinder_111; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/ysf/serialporttool/util/SerialPortFinder')]
//  JSerialPortFinder_111 = interface(JObject)
//  ['{D42B956A-BA9B-4D01-BD87-D0EF9472EA4F}']
//    { Property Methods }
//
//    { methods }
//    function getDevices: JArrayList; cdecl;
//
//    { Property }
//  end;
//
//  TJSerialPortFinder_111 = class(TJavaGenericImport<JSerialPortFinder_111Class, JSerialPortFinder_111>) end;

  JSerialPortUtil_SingletonLoaderClass = interface(JObjectClass)
  ['{DB029722-EAFB-4CA1-9F29-AC9EBDC6BED5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/serialporttool/util/SerialPortUtil$SingletonLoader')]
  JSerialPortUtil_SingletonLoader = interface(JObject)
  ['{45268A32-EE10-4214-AE47-48FCB59B6F94}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSerialPortUtil_SingletonLoader = class(TJavaGenericImport<JSerialPortUtil_SingletonLoaderClass, JSerialPortUtil_SingletonLoader>) end;

  JSerialPortUtilClass = interface(JObjectClass)
  ['{8756087D-89B5-4269-8B9E-68D34198873D}']
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
  ['{2B0B8928-03F2-414E-8A1D-1DFED146C22C}']
    { Property Methods }

    { methods }
    function openSerialPort: JSerialPort; cdecl;
    procedure closeSerialPort; cdecl;

    { Property }
  end;

  TJSerialPortUtil = class(TJavaGenericImport<JSerialPortUtilClass, JSerialPortUtil>) end;

  JStringUtilClass = interface(JObjectClass)
  ['{08EB8E8F-8C86-4A36-B326-0C946AB7E06C}']
    { static Property Methods }
//    {class} function _GetcardNoPattern: JPattern;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JStringUtil; cdecl;
    {class} function isCardNo(P1: JString): Boolean; cdecl;
    {class} function hexStringToBytes(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function hexStringToBytesForInv(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function bytesToHexString(P1: TJavaArray<Byte>): JString; cdecl;
    {class} function readCardData(P1: TJavaArray<Byte>): TJavaObjectArray<JString>; cdecl;
    {class} function getEncoding(P1: JString): JString; cdecl;
    {class} function isEmpty(P1: JCharSequence): Boolean; cdecl;
    {class} function isNull(P1: JObject): Boolean; cdecl;
    {class} function isLetterDigitOrChinese(P1: JString): JString; cdecl;
    {class} function strToBoolean(P1: JString): Boolean; cdecl;
    {class} function numberToBooleanString(P1: JString): JString; cdecl;
    {class} function conversionVersion(P1: JString): JMap; cdecl;
    {class} function stringToMap(P1: JString): JHashMap; cdecl;
    {class} function checkCardSex(P1: JString): JString; cdecl;
    {class} function isMessyCode(P1: JString): Boolean; cdecl;
    {class} function isChinese(P1: Char): Boolean; cdecl;

    { static Property }
//    {class} property cardNoPattern: JPattern read _GetcardNoPattern;
  end;

  [JavaSignature('com/ysf/serialporttool/util/StringUtil')]
  JStringUtil = interface(JObject)
  ['{78090499-79DC-4166-A090-0AC12585B90A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJStringUtil = class(TJavaGenericImport<JStringUtilClass, JStringUtil>) end;


{$ENDIF}
implementation

end.

