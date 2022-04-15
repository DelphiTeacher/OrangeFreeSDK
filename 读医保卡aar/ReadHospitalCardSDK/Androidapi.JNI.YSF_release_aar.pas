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
//  生成时间：2021-12-14 12:22:20
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

  JHifondCardInterface = interface; //com.hifond.cardlibrary.card.HifondCardInterface
  JCardCheckResult = interface; //com.hifond.cardlibrary.card.vo.CardCheckResult
  JHiCardServer_1 = interface; //com.ysf.card.HiCardServer$1
  JHiCardServer_2 = interface; //com.ysf.card.HiCardServer$2
  JHiCardServer_3 = interface; //com.ysf.card.HiCardServer$3
  JHiCardServer_4 = interface; //com.ysf.card.HiCardServer$4
  JHiCardServer_5 = interface; //com.ysf.card.HiCardServer$5
  JHiCardServer_6 = interface; //com.ysf.card.HiCardServer$6
  JHiCardServer_7 = interface; //com.ysf.card.HiCardServer$7
  JHiCardServer_8 = interface; //com.ysf.card.HiCardServer$8
  JHiCardServer_CardThread_1 = interface; //com.ysf.card.HiCardServer$CardThread$1
  JHiCardServer_CardThread = interface; //com.ysf.card.HiCardServer$CardThread
  JHiCardServer = interface; //com.ysf.card.HiCardServer
  JHiUpdateServer_1 = interface; //com.ysf.card.HiUpdateServer$1
  JHiUpdateServer = interface; //com.ysf.card.HiUpdateServer
  JCardCommandUtil = interface; //com.ysf.card.util.CardCommandUtil
  JFastJsonUtil = interface; //com.ysf.card.util.FastJsonUtil
  JBuildConfig = interface; //com.ysf.ysfso.BuildConfig

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JHifondCardInterfaceClass = interface(JObjectClass)
  ['{41E78245-7567-4D81-8744-FA029622C5A2}']
    { static Property Methods }
    {class} function _GetmContext: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHifondCardInterface; cdecl; overload;
    {class} procedure init(context: JContext; devPort: JString; charsetName: JString); cdecl; overload;
    {class} procedure init(context: JContext; devPort: JString); cdecl; overload;
    {class} procedure openModule; cdecl; overload;
    {class} procedure openModule(atype: JString); cdecl; overload;
    {class} procedure openModule(atype: JString; addr: JString; pwd: JString); cdecl; overload;
    {class} procedure openModule(atype: JString; addr: JString; pwd: JString; m1Tag: JString); cdecl; overload;
    {class} procedure closeModule; cdecl;
    {class} procedure close; cdecl;
    {class} procedure checkPSAM(code: Integer); cdecl;
    {class} procedure checkHexVersion; cdecl;
    {class} procedure checkModule; cdecl;
    {class} procedure readSAM; cdecl;
    {class} procedure updateHex(filePath: JString); cdecl;

    { static Property }
    {class} property mContext: JContext read _GetmContext;
  end;

  [JavaSignature('com/hifond/cardlibrary/card/HifondCardInterface')]
  JHifondCardInterface = interface(JObject)
  ['{BD3128D6-7F4D-4CA3-A83F-019EC7C56530}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHifondCardInterface = class(TJavaGenericImport<JHifondCardInterfaceClass, JHifondCardInterface>) end;

  JCardCheckResultClass = interface(JObjectClass)
  ['{0B91DCCE-D0CE-45C5-8CDD-8401F8684506}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCardCheckResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/hifond/cardlibrary/card/vo/CardCheckResult')]
  JCardCheckResult = interface(JObject)
  ['{D19E7F10-FDB1-4BD0-9ED5-61B6D271A786}']
    { Property Methods }

    { methods }
    function getPSam: JString; cdecl;
    procedure setpSam(pSam: JString); cdecl;
    function getCommand: JString; cdecl;
    procedure setCommand(command: JString); cdecl;
    function getHexCommand: JString; cdecl;
    procedure setHexCommand(hexCommand: JString); cdecl;
    function getModuleInfo: JString; cdecl;
    procedure setModuleInfo(moduleInfo: JString); cdecl;
    function getHexInfo: JString; cdecl;
    procedure setHexInfo(hexInfo: JString); cdecl;
    function getResultCode: JString; cdecl;
    procedure setResultCode(resultCode: JString); cdecl;
    function getCheckType: Integer; cdecl;
    procedure setCheckType(checkType: Integer); cdecl;
    function getSAMID: JString; cdecl;
    procedure setSAMID(SAMID: JString); cdecl;

    { Property }
  end;

  TJCardCheckResult = class(TJavaGenericImport<JCardCheckResultClass, JCardCheckResult>) end;

  JHiCardServer_1Class = interface(JObjectClass)
  ['{86DD80A8-0DB0-43BD-A42D-890C69A462C9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$1')]
  JHiCardServer_1 = interface(JObject)
  ['{064618B1-C35E-4BA5-8D44-5D563D18A3AB}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_1 = class(TJavaGenericImport<JHiCardServer_1Class, JHiCardServer_1>) end;

  JHiCardServer_2Class = interface(JObjectClass)
  ['{9C966A16-E408-431E-AB13-73B1C16B0BB8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$2')]
  JHiCardServer_2 = interface(JObject)
  ['{A2FA33DE-4374-4A84-BD2A-9D5D05FC8C83}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_2 = class(TJavaGenericImport<JHiCardServer_2Class, JHiCardServer_2>) end;

  JHiCardServer_3Class = interface(JObjectClass)
  ['{28DC143E-75D6-4183-B7D4-408D8B382734}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$3')]
  JHiCardServer_3 = interface(JObject)
  ['{4E1F003D-3CCD-450D-AF21-93B640128C85}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_3 = class(TJavaGenericImport<JHiCardServer_3Class, JHiCardServer_3>) end;

  JHiCardServer_4Class = interface(JObjectClass)
  ['{210993AE-9A80-450D-8D5B-A7FE1563789A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$4')]
  JHiCardServer_4 = interface(JObject)
  ['{0897240B-BB43-42EB-939C-0F0B88B96A31}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_4 = class(TJavaGenericImport<JHiCardServer_4Class, JHiCardServer_4>) end;

  JHiCardServer_5Class = interface(JObjectClass)
  ['{0CCD8859-DF34-40EA-B9AB-59BC1C142458}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$5')]
  JHiCardServer_5 = interface(JObject)
  ['{4BEBAA98-FFD3-4DD2-A08A-5C8D5E423B64}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_5 = class(TJavaGenericImport<JHiCardServer_5Class, JHiCardServer_5>) end;

  JHiCardServer_6Class = interface(JObjectClass)
  ['{8F2F1B08-B8B1-4F64-B1D2-A39F937032F8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$6')]
  JHiCardServer_6 = interface(JObject)
  ['{34421CA1-5CEA-4189-A0D9-EA60B8D99931}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_6 = class(TJavaGenericImport<JHiCardServer_6Class, JHiCardServer_6>) end;

  JHiCardServer_7Class = interface(JObjectClass)
  ['{3E6A3895-F148-404D-B9DF-507B84C4B863}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$7')]
  JHiCardServer_7 = interface(JObject)
  ['{D5BD90EE-A7D9-4A71-91E2-4ED7834BD5EE}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_7 = class(TJavaGenericImport<JHiCardServer_7Class, JHiCardServer_7>) end;

  JHiCardServer_8Class = interface(JObjectClass)
  ['{A0EC4874-2D52-41A9-B2DB-6732F404B3AF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$8')]
  JHiCardServer_8 = interface(JObject)
  ['{E568A32D-CC9A-4F6F-A98C-5DDE1568817B}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_8 = class(TJavaGenericImport<JHiCardServer_8Class, JHiCardServer_8>) end;

  JHiCardServer_CardThread_1Class = interface(JObjectClass)
  ['{36B1A544-885E-413F-AF82-2112977062A8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$CardThread$1')]
  JHiCardServer_CardThread_1 = interface(JObject)
  ['{C2ED49AA-7D8E-4192-BDD8-6F407ABE44FE}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiCardServer_CardThread_1 = class(TJavaGenericImport<JHiCardServer_CardThread_1Class, JHiCardServer_CardThread_1>) end;

  JHiCardServer_CardThreadClass = interface(JObjectClass)
  ['{552B21FA-ABDA-4BB5-9E38-10C565CE3DCC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiCardServer$CardThread')]
  JHiCardServer_CardThread = interface(JObject)
  ['{AE047EFB-BADE-4041-A7CA-3EAD9F8525C6}']
    { Property Methods }

    { methods }
    procedure startCardFind; cdecl;

    { Property }
  end;

  TJHiCardServer_CardThread = class(TJavaGenericImport<JHiCardServer_CardThreadClass, JHiCardServer_CardThread>) end;

  JHiCardServerClass = interface(JServiceClass) // or JObjectClass
  ['{3360E6E2-ADCF-442F-9548-9F9EA3E17983}']
    { static Property Methods }
    {class} function _GetCARD_FIND_OPEN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_FIND_CLOSE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetINTENT_EXTRA_CARDTYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_CHECK: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_HEX_VERSION: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_SAMID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_UPDATE_HEX: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_ADDR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_PASS: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetM1_TAG: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCARD_PSAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetdevPort: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetmCharsetName: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiCardServer; cdecl;
    {class} function bitmapToBase64(bitmap: JBitmap): JString; cdecl;
    {class} procedure main(args: TJavaObjectArray<JString>); cdecl;

    { static Property }
    {class} property CARD_FIND_OPEN: JString read _GetCARD_FIND_OPEN;
    {class} property CARD_FIND_CLOSE: JString read _GetCARD_FIND_CLOSE;
    {class} property INTENT_EXTRA_CARDTYPE: JString read _GetINTENT_EXTRA_CARDTYPE;
    {class} property CARD_CHECK: JString read _GetCARD_CHECK;
    {class} property CARD_HEX_VERSION: JString read _GetCARD_HEX_VERSION;
    {class} property CARD_SAMID: JString read _GetCARD_SAMID;
    {class} property CARD_UPDATE_HEX: JString read _GetCARD_UPDATE_HEX;
    {class} property M1_ADDR: JString read _GetM1_ADDR;
    {class} property M1_PASS: JString read _GetM1_PASS;
    {class} property M1_TAG: JString read _GetM1_TAG;
    {class} property CARD_PSAM: JString read _GetCARD_PSAM;
    {class} property devPort: JString read _GetdevPort;
    {class} property mCharsetName: JString read _GetmCharsetName;
  end;

  [JavaSignature('com/ysf/card/HiCardServer')]
  JHiCardServer = interface(JService) // or JObject
  ['{4DAF893A-9A8E-41D3-BC7B-1E60E6E91B41}']
    { Property Methods }

    { methods }
    function onBind(intent: JIntent): JIBinder; cdecl;
    procedure onCreate; cdecl;
    function onStartCommand(intent: JIntent; flags: Integer; startId: Integer): Integer; cdecl;
    procedure sendCardCheckResult(result: JCardCheckResult); cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJHiCardServer = class(TJavaGenericImport<JHiCardServerClass, JHiCardServer>) end;

  JHiUpdateServer_1Class = interface(JObjectClass)
  ['{8AAC282B-F4BA-4894-9DE0-39A45CF37CC6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ysf/card/HiUpdateServer$1')]
  JHiUpdateServer_1 = interface(JObject)
  ['{450A4881-E07E-4F10-BCBF-F4ED5E8289A2}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJHiUpdateServer_1 = class(TJavaGenericImport<JHiUpdateServer_1Class, JHiUpdateServer_1>) end;

  JHiUpdateServerClass = interface(JServiceClass) // or JObjectClass
  ['{18CEB7B4-6254-435A-A492-A37BDAAE1673}']
    { static Property Methods }
    {class} function _GetdevPort: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHiUpdateServer; cdecl;

    { static Property }
    {class} property devPort: JString read _GetdevPort;
  end;

  [JavaSignature('com/ysf/card/HiUpdateServer')]
  JHiUpdateServer = interface(JService) // or JObject
  ['{D0DA6207-9963-4595-88B1-09BF88D51E4A}']
    { Property Methods }

    { methods }
    function onBind(intent: JIntent): JIBinder; cdecl;
    procedure onCreate; cdecl;
    function onStartCommand(intent: JIntent; flags: Integer; startId: Integer): Integer; cdecl;
    function sendPacket(data: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJHiUpdateServer = class(TJavaGenericImport<JHiUpdateServerClass, JHiUpdateServer>) end;

  JCardCommandUtilClass = interface(JObjectClass)
  ['{64EB6DED-E546-4FB2-B2BE-44279F07474B}']
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
    {class} function _GetCMD_CARD_ABCDE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CLOSE_MAGNETIC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
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
    {class} function _GetCMD_SAM: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_START_CARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CLOSE_CARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_QUERY_CARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_JC: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_FJ: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_CT: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_SCAN: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_IDCARD: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_ALL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_CARD_B: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_HEX_UPDATE_START: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_HEX_UPDATE_END: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_3: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_4: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_APDU_1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_APDU_2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_APDU_3: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_APDU_4: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_DOWN_1: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_DOWN_2: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_DOWN_3: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCMD_PSAM_CARD_DOWN_4: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JCardCommandUtil; cdecl;
    {class} function getCmd(cmd: JString): JString; cdecl;
    {class} function proofGroupData(data: TJavaArray<Byte>): TJavaObjectArray<JString>; cdecl;
    {class} function isALegalByte(data: TJavaArray<Byte>): Boolean; cdecl;
    {class} function isALegalData(data: TJavaArray<Byte>): Boolean; cdecl;
    {class} function isEnd(data: TJavaArray<Byte>): Boolean; cdecl;
    {class} function byteMergerAll(values: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function getLenInt(hexByte: JString): Integer; cdecl;
    {class} function bytes4ToInt(src: TJavaArray<Byte>): Integer; cdecl;
    {class} function getLenStr(data: Integer): JString; cdecl;
    {class} function intToBytes4L(res: Integer): TJavaArray<Byte>; cdecl;
    {class} function getBCC(data: JString): JString; cdecl; overload;
    {class} function getBCC_Low(data: JString): JString; cdecl; overload;
    {class} function getBCC(data: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function getBCC_Low(data: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function bytes2HexStr(src: TJavaArray<Byte>; dec: Integer; length: Integer): JString; cdecl; overload;
    {class} function bytes2HexStr(src: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function hexStr2bytes(hex: JString): TJavaArray<Byte>; cdecl;

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
    {class} property CMD_CARD_ABCDE: JString read _GetCMD_CARD_ABCDE;
    {class} property CMD_CLOSE_MAGNETIC: JString read _GetCMD_CLOSE_MAGNETIC;
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
    {class} property CMD_SAM: JString read _GetCMD_SAM;
    {class} property CMD_START_CARD: JString read _GetCMD_START_CARD;
    {class} property CMD_CLOSE_CARD: JString read _GetCMD_CLOSE_CARD;
    {class} property CMD_QUERY_CARD: JString read _GetCMD_QUERY_CARD;
    {class} property CMD_CARD_JC: JString read _GetCMD_CARD_JC;
    {class} property CMD_CARD_FJ: JString read _GetCMD_CARD_FJ;
    {class} property CMD_CARD_CT: JString read _GetCMD_CARD_CT;
    {class} property CMD_CARD_SCAN: JString read _GetCMD_CARD_SCAN;
    {class} property CMD_CARD_IDCARD: JString read _GetCMD_CARD_IDCARD;
    {class} property CMD_CARD_ALL: JString read _GetCMD_CARD_ALL;
    {class} property CMD_CARD_B: JString read _GetCMD_CARD_B;
    {class} property CMD_HEX_UPDATE_START: JString read _GetCMD_HEX_UPDATE_START;
    {class} property CMD_HEX_UPDATE_END: JString read _GetCMD_HEX_UPDATE_END;
    {class} property CMD_PSAM_CARD_1: JString read _GetCMD_PSAM_CARD_1;
    {class} property CMD_PSAM_CARD_2: JString read _GetCMD_PSAM_CARD_2;
    {class} property CMD_PSAM_CARD_3: JString read _GetCMD_PSAM_CARD_3;
    {class} property CMD_PSAM_CARD_4: JString read _GetCMD_PSAM_CARD_4;
    {class} property CMD_PSAM_APDU_1: JString read _GetCMD_PSAM_APDU_1;
    {class} property CMD_PSAM_APDU_2: JString read _GetCMD_PSAM_APDU_2;
    {class} property CMD_PSAM_APDU_3: JString read _GetCMD_PSAM_APDU_3;
    {class} property CMD_PSAM_APDU_4: JString read _GetCMD_PSAM_APDU_4;
    {class} property CMD_PSAM_CARD_DOWN_1: JString read _GetCMD_PSAM_CARD_DOWN_1;
    {class} property CMD_PSAM_CARD_DOWN_2: JString read _GetCMD_PSAM_CARD_DOWN_2;
    {class} property CMD_PSAM_CARD_DOWN_3: JString read _GetCMD_PSAM_CARD_DOWN_3;
    {class} property CMD_PSAM_CARD_DOWN_4: JString read _GetCMD_PSAM_CARD_DOWN_4;
  end;

  [JavaSignature('com/ysf/card/util/CardCommandUtil')]
  JCardCommandUtil = interface(JObject)
  ['{F534BBFF-D090-43CB-A42B-865EBDF495BF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCardCommandUtil = class(TJavaGenericImport<JCardCommandUtilClass, JCardCommandUtil>) end;

  JFastJsonUtilClass = interface(JObjectClass)
  ['{1C206E09-E9E3-45AF-A68C-E8879D73E798}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFastJsonUtil; cdecl;
    {class} function toJson(obj: JObject): JString; cdecl;
//    {class} function fromJson(str: JString; clazz: JClass): JObject; cdecl; overload;
//    {class} function fromJson(bytes: TJavaArray<Byte>; clazz: JClass): JObject; cdecl; overload;
//    {class} function fromJson(bytes: TJavaArray<Byte>; clazz: JClass; encoding: JString): JObject; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/ysf/card/util/FastJsonUtil')]
  JFastJsonUtil = interface(JObject)
  ['{33BC7050-55CC-43DC-B994-BF2F417BEA13}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFastJsonUtil = class(TJavaGenericImport<JFastJsonUtilClass, JFastJsonUtil>) end;

  JBuildConfigClass = interface(JObjectClass)
  ['{DAE0975D-0E75-4AB0-9981-8CF6718EF0D7}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/ysf/ysfso/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{CA430DA3-4F61-409B-ADF5-38F73BA6AF36}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

{$ENDIF}

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHifondCardInterface',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHifondCardInterface));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JCardCheckResult',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JCardCheckResult));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_1',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_1));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_2',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_2));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_3',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_3));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_4',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_4));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_5',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_5));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_6',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_6));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_7',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_7));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_8',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_8));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_CardThread_1',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_CardThread_1));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer_CardThread',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer_CardThread));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiCardServer',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiCardServer));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiUpdateServer_1',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiUpdateServer_1));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JHiUpdateServer',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JHiUpdateServer));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JCardCommandUtil',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JCardCommandUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JFastJsonUtil',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JFastJsonUtil));
//  TRegTypes.RegisterType('Androidapi.JNI.YSF_release_aar.JBuildConfig',
//    TypeInfo(Androidapi.JNI.YSF_release_aar.JBuildConfig));
//end;
//
//
//initialization
//  RegisterTypes;

end.
