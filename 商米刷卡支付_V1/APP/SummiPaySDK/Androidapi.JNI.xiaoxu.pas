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
//  生成时间：2018-05-30 12:49:19
//  工具版本：1.0.2018.1.26
//
//====================================================
unit Androidapi.JNI.xiaoxu;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
  Androidapi.JNI.os, 
  Androidapi.JNI.GraphicsContentViewText;


type
// ===== Forward declarations =====

  JPayServiceProvider_Stub_Proxy = interface; //com.sunmi.payservice.aidl.PayServiceProvider$Stub$Proxy
  JPayServiceProvider_Stub = interface; //com.sunmi.payservice.aidl.PayServiceProvider$Stub
  JPayServiceProvider = interface; //com.sunmi.payservice.aidl.PayServiceProvider
  JAidlConstants_CardType = interface; //com.sunmi.payservice.hardware.aidl.AidlConstants$CardType
  JAidlConstants_LedLight = interface; //com.sunmi.payservice.hardware.aidl.AidlConstants$LedLight
  JAidlConstants_SysParam = interface; //com.sunmi.payservice.hardware.aidl.AidlConstants$SysParam
  JAidlConstants = interface; //com.sunmi.payservice.hardware.aidl.AidlConstants
  JPayCardInfo_1 = interface; //com.sunmi.payservice.hardware.aidl.bean.PayCardInfo$1
  JPayCardInfo = interface; //com.sunmi.payservice.hardware.aidl.bean.PayCardInfo
  JHardwareOpt_Stub_Proxy = interface; //com.sunmi.payservice.hardware.aidl.HardwareOpt$Stub$Proxy
  JHardwareOpt_Stub = interface; //com.sunmi.payservice.hardware.aidl.HardwareOpt$Stub
  JHardwareOpt = interface; //com.sunmi.payservice.hardware.aidl.HardwareOpt
  JReadCardCallback_Stub_Proxy = interface; //com.sunmi.payservice.hardware.aidl.ReadCardCallback$Stub$Proxy
  JReadCardCallback_Stub = interface; //com.sunmi.payservice.hardware.aidl.ReadCardCallback$Stub
  JReadCardCallback = interface; //com.sunmi.payservice.hardware.aidl.ReadCardCallback
  JLogUtils = interface; //com.sunmi.payservice.utils.LogUtils
  JBuildConfig = interface; //sunmi.payservicelib.BuildConfig
  JSunmiPayService_1 = interface; //sunmi.payservicelib.SunmiPayService$1
  JSunmiPayService_2 = interface; //sunmi.payservicelib.SunmiPayService$2
  JSunmiPayService_ConnCallback = interface; //sunmi.payservicelib.SunmiPayService$ConnCallback
  JSunmiPayService_SingletonHolder = interface; //sunmi.payservicelib.SunmiPayService$SingletonHolder
  JSunmiPayService = interface; //sunmi.payservicelib.SunmiPayService

// ===== Interface declarations =====

  JPayServiceProvider_Stub_ProxyClass = interface(JObjectClass)
  ['{B63160EA-3BFD-4FC9-B3AB-8669E9C40FB2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/aidl/PayServiceProvider$Stub$Proxy')]
  JPayServiceProvider_Stub_Proxy = interface(JObject)
  ['{9E40EBC0-44FB-4038-9540-D915BE8B02C6}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    function getServiceStatus: Integer; cdecl; //()I
    function getHardwareOpt: JHardwareOpt; cdecl; //()Lcom/sunmi/payservice/hardware/aidl/HardwareOpt;

    { Property }
  end;

  TJPayServiceProvider_Stub_Proxy = class(TJavaGenericImport<JPayServiceProvider_Stub_ProxyClass, JPayServiceProvider_Stub_Proxy>) end;

  JPayServiceProvider_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{CB91C4DA-C8DE-43D3-93C7-60CBD06C9117}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPayServiceProvider_Stub; cdecl; //()V
    {class} function asInterface(iin: JIBinder): JPayServiceProvider; cdecl; //(Landroid/os/IBinder;)Lcom/sunmi/payservice/aidl/PayServiceProvider;

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/aidl/PayServiceProvider$Stub')]
  JPayServiceProvider_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{089EEE9F-FEF3-4C04-80E6-6CCF970D61EE}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJPayServiceProvider_Stub = class(TJavaGenericImport<JPayServiceProvider_StubClass, JPayServiceProvider_Stub>) end;

  JPayServiceProviderClass = interface(JObjectClass)
  ['{3910C054-9446-48E5-B6BD-11DD9B8572FD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/aidl/PayServiceProvider')]
  JPayServiceProvider = interface(IJavaInstance)
  ['{4BAF4D03-5BDA-4479-A61B-9AFB00C583DA}']
    { Property Methods }

    { methods }
    function getServiceStatus: Integer; cdecl; //()I
    function getHardwareOpt: JHardwareOpt; cdecl; //()Lcom/sunmi/payservice/hardware/aidl/HardwareOpt;

    { Property }
  end;

  TJPayServiceProvider = class(TJavaGenericImport<JPayServiceProviderClass, JPayServiceProvider>) end;

  JAidlConstants_CardTypeClass = interface(JObjectClass)
  ['{9F026572-28F0-4C8D-A185-7100E2632E02}']
    { static Property Methods }
    {class} function _GetMAG: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetIC: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetNFC: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetMIFARE: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetPSAM0: Integer; cdecl; //>=XE8{IFEND} //I

    { static Methods }
    {class} function init: JAidlConstants_CardType; cdecl; //()V

    { static Property }
    {class} property MAG: Integer read _GetMAG;
    {class} property IC: Integer read _GetIC;
    {class} property NFC: Integer read _GetNFC;
    {class} property MIFARE: Integer read _GetMIFARE;
    {class} property PSAM0: Integer read _GetPSAM0;
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/AidlConstants$CardType')]
  JAidlConstants_CardType = interface(JObject)
  ['{7E2232B1-5CB9-4BF9-B82A-587462BF264E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_CardType = class(TJavaGenericImport<JAidlConstants_CardTypeClass, JAidlConstants_CardType>) end;

  JAidlConstants_LedLightClass = interface(JObjectClass)
  ['{9F020F95-9B3D-453A-96C4-F2419A313814}']
    { static Property Methods }
    {class} function _GetRED_LIGHT: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetYELLOW_LIGHT: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetBLUE_LIGHT: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetGREEN_LIGHT: Integer; cdecl; //>=XE8{IFEND} //I

    { static Methods }
    {class} function init: JAidlConstants_LedLight; cdecl; //()V

    { static Property }
    {class} property RED_LIGHT: Integer read _GetRED_LIGHT;
    {class} property YELLOW_LIGHT: Integer read _GetYELLOW_LIGHT;
    {class} property BLUE_LIGHT: Integer read _GetBLUE_LIGHT;
    {class} property GREEN_LIGHT: Integer read _GetGREEN_LIGHT;
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/AidlConstants$LedLight')]
  JAidlConstants_LedLight = interface(JObject)
  ['{1A65122E-5BDE-4503-8B55-DD2AB935466B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_LedLight = class(TJavaGenericImport<JAidlConstants_LedLightClass, JAidlConstants_LedLight>) end;

  JAidlConstants_SysParamClass = interface(JObjectClass)
  ['{7F380A14-9CB1-43CF-8DE1-81424BCCBA53}']
    { static Property Methods }
    {class} function _GetSDK_VERSION: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetHARDWARE_VERSION: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetFIRMWARE_VERSION: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetSN: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetPN: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetTUSN: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetDEVICE_CODE: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetDEVICE_MODEL: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JAidlConstants_SysParam; cdecl; //()V

    { static Property }
    {class} property SDK_VERSION: JString read _GetSDK_VERSION;
    {class} property HARDWARE_VERSION: JString read _GetHARDWARE_VERSION;
    {class} property FIRMWARE_VERSION: JString read _GetFIRMWARE_VERSION;
    {class} property SN: JString read _GetSN;
    {class} property PN: JString read _GetPN;
    {class} property TUSN: JString read _GetTUSN;
    {class} property DEVICE_CODE: JString read _GetDEVICE_CODE;
    {class} property DEVICE_MODEL: JString read _GetDEVICE_MODEL;
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/AidlConstants$SysParam')]
  JAidlConstants_SysParam = interface(JObject)
  ['{722D57BE-2C86-4B59-B5EC-24E39F5A8EA0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants_SysParam = class(TJavaGenericImport<JAidlConstants_SysParamClass, JAidlConstants_SysParam>) end;

  JAidlConstantsClass = interface(JObjectClass)
  ['{0E5486C0-BAC8-4BF4-920B-4136A2E12442}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAidlConstants; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/AidlConstants')]
  JAidlConstants = interface(JObject)
  ['{B7AAF95F-4305-42D1-B14B-509F0628B261}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAidlConstants = class(TJavaGenericImport<JAidlConstantsClass, JAidlConstants>) end;

  JPayCardInfo_1Class = interface(JObjectClass)
  ['{74BF6B9F-E1F2-4D8A-80F9-95BFDD0AA549}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/bean/PayCardInfo$1')]
  JPayCardInfo_1 = interface(JObject)
  ['{41450DE8-9A82-4096-8FE2-95AF1495578C}']
    { Property Methods }

    { methods }
    function createFromParcel(source: JParcel): JPayCardInfo; cdecl; overload; //(Landroid/os/Parcel;)Lcom/sunmi/payservice/hardware/aidl/bean/PayCardInfo;
    function newArray(size: Integer): TJavaObjectArray<JPayCardInfo>; cdecl; overload; //(I)[Lcom/sunmi/payservice/hardware/aidl/bean/PayCardInfo;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload; //(I)[Ljava/lang/Object;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload; //(Landroid/os/Parcel;)Ljava/lang/Object;

    { Property }
  end;

  TJPayCardInfo_1 = class(TJavaGenericImport<JPayCardInfo_1Class, JPayCardInfo_1>) end;

  JPayCardInfoClass = interface(JObjectClass)
  ['{EF9A524C-3B5A-48D3-88BF-86F3A368AC4E}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator; cdecl; //>=XE8{IFEND} //Landroid/os/Parcelable$Creator;

    { static Methods }
    {class} function init: JPayCardInfo; cdecl; //()V

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/bean/PayCardInfo')]
  JPayCardInfo = interface(JObject)
  ['{BA87BD7C-6DF0-4282-9397-4FC3C7810F74}']
    { Property Methods }
    function _GetcardType: Integer; cdecl; //>=XE8{IFEND} //I
    procedure _SetcardType(acardType: Integer); cdecl; //>=XE8{IFEND} //(I)V
    function _Gettrack1: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    procedure _Settrack1(atrack1: JString); cdecl; //>=XE8{IFEND} //(Ljava/lang/String;)V
    function _Gettrack2: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    procedure _Settrack2(atrack2: JString); cdecl; //>=XE8{IFEND} //(Ljava/lang/String;)V
    function _Gettrack3: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    procedure _Settrack3(atrack3: JString); cdecl; //>=XE8{IFEND} //(Ljava/lang/String;)V
    function _Getuuid: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    procedure _Setuuid(auuid: JString); cdecl; //>=XE8{IFEND} //(Ljava/lang/String;)V
    function _Getatr: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    procedure _Setatr(aatr: JString); cdecl; //>=XE8{IFEND} //(Ljava/lang/String;)V
    function _GetcardNo: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    procedure _SetcardNo(acardNo: JString); cdecl; //>=XE8{IFEND} //(Ljava/lang/String;)V

    { methods }
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl; //(Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
    property cardType: Integer read _GetcardType write _SetcardType;
    property track1: JString read _Gettrack1 write _Settrack1;
    property track2: JString read _Gettrack2 write _Settrack2;
    property track3: JString read _Gettrack3 write _Settrack3;
    property uuid: JString read _Getuuid write _Setuuid;
    property atr: JString read _Getatr write _Setatr;
    property cardNo: JString read _GetcardNo write _SetcardNo;
  end;

  TJPayCardInfo = class(TJavaGenericImport<JPayCardInfoClass, JPayCardInfo>) end;

  JHardwareOpt_Stub_ProxyClass = interface(JObjectClass)
  ['{151396EA-7223-426A-8A91-7E795DFFF9A1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/HardwareOpt$Stub$Proxy')]
  JHardwareOpt_Stub_Proxy = interface(JObject)
  ['{BA570FE8-A3D5-490D-AE00-107A94922D8E}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    function getSysParam(key: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    function buzzerOnDevice(times: Integer): Integer; cdecl; //(I)I
    function ledStatusOnDevice(ledIndex: Integer; ledStatus: Integer): Integer; cdecl; //(II)I
    procedure checkCard(cardType: Integer; callback: JReadCardCallback; timeOut: Integer); cdecl; //(ILcom/sunmi/payservice/hardware/aidl/ReadCardCallback;I)V
    procedure cancelCheckCard; cdecl; //()V
    function smartCardExchange(cardType: Integer; apduSend: TJavaArray<Byte>; apduRecv: TJavaArray<Byte>): Integer; cdecl; //(I[B[B)I
    function cardOff(cardType: Integer): Integer; cdecl; //(I)I
    function mifareAuth(keyType: Integer; block: Integer; key: TJavaArray<Byte>): Integer; cdecl; //(II[B)I
    function mifareReadBlock(block: Integer; blockData: TJavaArray<Byte>): Integer; cdecl; //(I[B)I
    function mifareWriteBlock(block: Integer; blockData: TJavaArray<Byte>): Integer; cdecl; //(I[B)I
    function mifareIncValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl; //(I[B)I
    function mifareDecValue(block: Integer; value: TJavaArray<Byte>): Integer; cdecl; //(I[B)I

    { Property }
  end;

  TJHardwareOpt_Stub_Proxy = class(TJavaGenericImport<JHardwareOpt_Stub_ProxyClass, JHardwareOpt_Stub_Proxy>) end;

  JHardwareOpt_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{65ECAE66-1701-48A9-95DE-C0F3B266FCA1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHardwareOpt_Stub; cdecl; //()V
    {class} function asInterface(iin: JIBinder): JHardwareOpt; cdecl; //(Landroid/os/IBinder;)Lcom/sunmi/payservice/hardware/aidl/HardwareOpt;

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/HardwareOpt$Stub')]
  JHardwareOpt_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{54EF948F-FCCB-473C-A8FE-CAC857FE974B}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJHardwareOpt_Stub = class(TJavaGenericImport<JHardwareOpt_StubClass, JHardwareOpt_Stub>) end;

  JHardwareOptClass = interface(JObjectClass)
  ['{86DAAAD6-DE84-46BA-AEC9-368DE08A3B9B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/HardwareOpt')]
  JHardwareOpt = interface(IJavaInstance)
  ['{AA870E00-3923-41CD-9A6D-2F05344628B1}']
    { Property Methods }

    { methods }
    function getSysParam(P1: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    function buzzerOnDevice(P1: Integer): Integer; cdecl; //(I)I
    function ledStatusOnDevice(P1: Integer; P2: Integer): Integer; cdecl; //(II)I
    procedure checkCard(P1: Integer; P2: JReadCardCallback; P3: Integer); cdecl; //(ILcom/sunmi/payservice/hardware/aidl/ReadCardCallback;I)V
    procedure cancelCheckCard; cdecl; //()V
    function smartCardExchange(P1: Integer; P2: TJavaArray<Byte>; P3: TJavaArray<Byte>): Integer; cdecl; //(I[B[B)I
    function cardOff(P1: Integer): Integer; cdecl; //(I)I
    function mifareAuth(P1: Integer; P2: Integer; P3: TJavaArray<Byte>): Integer; cdecl; //(II[B)I
    function mifareReadBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; //(I[B)I
    function mifareWriteBlock(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; //(I[B)I
    function mifareIncValue(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; //(I[B)I
    function mifareDecValue(P1: Integer; P2: TJavaArray<Byte>): Integer; cdecl; //(I[B)I

    { Property }
  end;

  TJHardwareOpt = class(TJavaGenericImport<JHardwareOptClass, JHardwareOpt>) end;

  JReadCardCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{29607424-0887-48FC-98D9-9920C4D9D503}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/ReadCardCallback$Stub$Proxy')]
  JReadCardCallback_Stub_Proxy = interface(JObject)
  ['{F51FC815-3F46-477D-A5A5-B2A20E1C0875}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    procedure onStartCheckCard; cdecl; //()V
    procedure onCardDetected(cardInfo: JPayCardInfo); cdecl; //(Lcom/sunmi/payservice/hardware/aidl/bean/PayCardInfo;)V
    procedure onError(code: Integer; amessage: JString); cdecl; //(ILjava/lang/String;)V

    { Property }
  end;

  TJReadCardCallback_Stub_Proxy = class(TJavaGenericImport<JReadCardCallback_Stub_ProxyClass, JReadCardCallback_Stub_Proxy>) end;

  JReadCardCallback_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{FBA3522E-C3FE-4051-8A1F-AD0C65CD0A59}']
    { static Property Methods }

    { static Methods }
    {class} function init: JReadCardCallback_Stub; cdecl; //()V
    {class} function asInterface(iin: JIBinder): JReadCardCallback; cdecl; //(Landroid/os/IBinder;)Lcom/sunmi/payservice/hardware/aidl/ReadCardCallback;

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/ReadCardCallback$Stub')]
  JReadCardCallback_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{F922A003-37E9-486C-8FB8-7A43488347CF}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJReadCardCallback_Stub = class(TJavaGenericImport<JReadCardCallback_StubClass, JReadCardCallback_Stub>) end;

  JReadCardCallbackClass = interface(JObjectClass)
  ['{44BF0601-BA8C-47DC-938D-E9F2D98FE984}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/payservice/hardware/aidl/ReadCardCallback')]
  JReadCardCallback = interface(IJavaInstance)
  ['{329ED646-3D7E-404E-B90C-5F5171699F3B}']
    { Property Methods }

    { methods }
    procedure onStartCheckCard; cdecl; //()V
    procedure onCardDetected(P1: JPayCardInfo); cdecl; //(Lcom/sunmi/payservice/hardware/aidl/bean/PayCardInfo;)V
    procedure onError(P1: Integer; P2: JString); cdecl; //(ILjava/lang/String;)V

    { Property }
  end;

  TJReadCardCallback = class(TJavaGenericImport<JReadCardCallbackClass, JReadCardCallback>) end;

  JLogUtilsClass = interface(JObjectClass)
  ['{2217E033-574D-4ACD-AA2A-315BE2BB6280}']
    { static Property Methods }
    {class} function _GetVERBOSE: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetDEBUG: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetINFO: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetWARN: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetERROR: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetNOTHING: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetLEVEL: Integer; cdecl; //>=XE8{IFEND} //I

    { static Methods }
    {class} function init: JLogUtils; cdecl; //()V
    {class} procedure setLevel(P1: Integer); cdecl; //(I)V
    {class} procedure v(msg: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure d(msg: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure i(msg: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure w(msg: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V
    {class} procedure e(msg: JString; P2: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
    {class} property VERBOSE: Integer read _GetVERBOSE;
    {class} property DEBUG: Integer read _GetDEBUG;
    {class} property INFO: Integer read _GetINFO;
    {class} property WARN: Integer read _GetWARN;
    {class} property ERROR: Integer read _GetERROR;
    {class} property NOTHING: Integer read _GetNOTHING;
    {class} property LEVEL: Integer read _GetLEVEL;
  end;

  [JavaSignature('com/sunmi/payservice/utils/LogUtils')]
  JLogUtils = interface(JObject)
  ['{17D580C1-2682-4143-97A6-C6F9A4E2DAAA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLogUtils = class(TJavaGenericImport<JLogUtilsClass, JLogUtils>) end;

  JBuildConfigClass = interface(JObjectClass)
  ['{E77E6227-2B4D-4130-8A7C-240EE3FBFFC4}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean; cdecl; //>=XE8{IFEND} //Z
    {class} function _GetAPPLICATION_ID: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetFLAVOR: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;
    {class} function _GetVERSION_CODE: Integer; cdecl; //>=XE8{IFEND} //I
    {class} function _GetVERSION_NAME: JString; cdecl; //>=XE8{IFEND} //Ljava/lang/String;

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

  [JavaSignature('sunmi/payservicelib/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{428FF976-30FE-49ED-BB90-EEDCA426E278}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JSunmiPayService_1Class = interface(JObjectClass)
  ['{6E07FADA-E010-46F7-A4D4-B007C915712E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('sunmi/payservicelib/SunmiPayService$1')]
  JSunmiPayService_1 = interface(JObject)
  ['{D5AE4860-9FF5-4EBA-BAC1-41B1BDE397CF}']
    { Property Methods }

    { methods }
    procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl; //(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    procedure onServiceDisconnected(name: JComponentName); cdecl; //(Landroid/content/ComponentName;)V

    { Property }
  end;

  TJSunmiPayService_1 = class(TJavaGenericImport<JSunmiPayService_1Class, JSunmiPayService_1>) end;

  JSunmiPayService_2Class = interface(JObjectClass)
  ['{05A41B4D-A3CA-437E-B2C4-C9586E594ABC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('sunmi/payservicelib/SunmiPayService$2')]
  JSunmiPayService_2 = interface(JObject)
  ['{03BBA4A0-EC32-4865-9E80-087670971DD5}']
    { Property Methods }

    { methods }
    procedure run; cdecl; //()V

    { Property }
  end;

  TJSunmiPayService_2 = class(TJavaGenericImport<JSunmiPayService_2Class, JSunmiPayService_2>) end;

  JSunmiPayService_ConnCallbackClass = interface(JObjectClass)
  ['{EE56F980-F1EF-45DE-904C-001D8B67E1E1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('sunmi/payservicelib/SunmiPayService$ConnCallback')]
  JSunmiPayService_ConnCallback = interface(IJavaInstance)
  ['{3DEF52E9-10FC-4C38-AD35-79FA5B788377}']
    { Property Methods }

    { methods }
    procedure onServiceConnected; cdecl; //()V
    procedure onServiceDisconnected; cdecl; //()V

    { Property }
  end;

  TJSunmiPayService_ConnCallback = class(TJavaGenericImport<JSunmiPayService_ConnCallbackClass, JSunmiPayService_ConnCallback>) end;

  JSunmiPayService_SingletonHolderClass = interface(JObjectClass)
  ['{D577E3EF-7ADD-4FC1-BF71-7E24E4DD9387}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('sunmi/payservicelib/SunmiPayService$SingletonHolder')]
  JSunmiPayService_SingletonHolder = interface(JObject)
  ['{32712AE4-C705-408E-868C-9B57E770C850}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiPayService_SingletonHolder = class(TJavaGenericImport<JSunmiPayService_SingletonHolderClass, JSunmiPayService_SingletonHolder>) end;

  JSunmiPayServiceClass = interface(JObjectClass)
  ['{3C84862F-CC80-495A-897B-D7A6E96BD031}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JSunmiPayService; cdecl; //()Lsunmi/payservicelib/SunmiPayService;

    { static Property }
  end;

  [JavaSignature('sunmi/payservicelib/SunmiPayService')]
  JSunmiPayService = interface(JObject)
  ['{496E25A1-A953-45B0-BACA-72CAA82E8CB4}']
    { Property Methods }
    function _GetmHardwareOpt: JHardwareOpt; cdecl; //>=XE8{IFEND} //Lcom/sunmi/payservice/hardware/aidl/HardwareOpt;
    procedure _SetmHardwareOpt(amHardwareOpt: JHardwareOpt); cdecl; //>=XE8{IFEND} //(Lcom/sunmi/payservice/hardware/aidl/HardwareOpt;)V

    { methods }
    procedure connectPayService(context: JContext; connCallback: JSunmiPayService_ConnCallback); cdecl; //(Landroid/content/Context;Lsunmi/payservicelib/SunmiPayService$ConnCallback;)V
    procedure unbindPayService(context: JContext); cdecl; //(Landroid/content/Context;)V

    { Property }
    property mHardwareOpt: JHardwareOpt read _GetmHardwareOpt write _SetmHardwareOpt;
  end;

  TJSunmiPayService = class(TJavaGenericImport<JSunmiPayServiceClass, JSunmiPayService>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JPayServiceProvider_Stub_Proxy', 
    TypeInfo(Androidapi.JNI.xiaoxu.JPayServiceProvider_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JPayServiceProvider_Stub', 
    TypeInfo(Androidapi.JNI.xiaoxu.JPayServiceProvider_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JPayServiceProvider', 
    TypeInfo(Androidapi.JNI.xiaoxu.JPayServiceProvider));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JAidlConstants_CardType', 
    TypeInfo(Androidapi.JNI.xiaoxu.JAidlConstants_CardType));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JAidlConstants_LedLight', 
    TypeInfo(Androidapi.JNI.xiaoxu.JAidlConstants_LedLight));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JAidlConstants_SysParam', 
    TypeInfo(Androidapi.JNI.xiaoxu.JAidlConstants_SysParam));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JAidlConstants', 
    TypeInfo(Androidapi.JNI.xiaoxu.JAidlConstants));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JPayCardInfo_1', 
    TypeInfo(Androidapi.JNI.xiaoxu.JPayCardInfo_1));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JPayCardInfo', 
    TypeInfo(Androidapi.JNI.xiaoxu.JPayCardInfo));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JHardwareOpt_Stub_Proxy', 
    TypeInfo(Androidapi.JNI.xiaoxu.JHardwareOpt_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JHardwareOpt_Stub', 
    TypeInfo(Androidapi.JNI.xiaoxu.JHardwareOpt_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JHardwareOpt', 
    TypeInfo(Androidapi.JNI.xiaoxu.JHardwareOpt));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JReadCardCallback_Stub_Proxy', 
    TypeInfo(Androidapi.JNI.xiaoxu.JReadCardCallback_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JReadCardCallback_Stub', 
    TypeInfo(Androidapi.JNI.xiaoxu.JReadCardCallback_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JReadCardCallback', 
    TypeInfo(Androidapi.JNI.xiaoxu.JReadCardCallback));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JLogUtils', 
    TypeInfo(Androidapi.JNI.xiaoxu.JLogUtils));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JBuildConfig', 
    TypeInfo(Androidapi.JNI.xiaoxu.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JSunmiPayService_1', 
    TypeInfo(Androidapi.JNI.xiaoxu.JSunmiPayService_1));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JSunmiPayService_2', 
    TypeInfo(Androidapi.JNI.xiaoxu.JSunmiPayService_2));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JSunmiPayService_ConnCallback', 
    TypeInfo(Androidapi.JNI.xiaoxu.JSunmiPayService_ConnCallback));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JSunmiPayService_SingletonHolder', 
    TypeInfo(Androidapi.JNI.xiaoxu.JSunmiPayService_SingletonHolder));
  TRegTypes.RegisterType('Androidapi.JNI.xiaoxu.JSunmiPayService', 
    TypeInfo(Androidapi.JNI.xiaoxu.JSunmiPayService));
end;


initialization
  RegisterTypes;

end.
