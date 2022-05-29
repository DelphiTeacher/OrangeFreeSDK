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
//  生成时间：2020/12/19 14:50:04
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.sunmi_printer_all;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.GraphicsContentViewText,
//  Androidapi.JNI.android.os.IBinder,
//  Androidapi.JNI.android.os.Parcel,
//  Androidapi.JNI.android.content.ComponentName,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.graphics.Bitmap,
//  Androidapi.JNI.android.os.Parcelable_Creator,
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.sunmi.library.BuildConfig
  JExceptionConst = interface; //com.sunmi.peripheral.printer.ExceptionConst
  JICallback_Stub_Proxy = interface; //com.sunmi.peripheral.printer.ICallback$Stub$Proxy
  JICallback_Stub = interface; //com.sunmi.peripheral.printer.ICallback$Stub
  JICallback = interface; //com.sunmi.peripheral.printer.ICallback
  JILcdCallback_Stub_Proxy = interface; //com.sunmi.peripheral.printer.ILcdCallback$Stub$Proxy
  JILcdCallback_Stub = interface; //com.sunmi.peripheral.printer.ILcdCallback$Stub
  JILcdCallback = interface; //com.sunmi.peripheral.printer.ILcdCallback
  JInnerLcdCallback = interface; //com.sunmi.peripheral.printer.InnerLcdCallback
  JInnerPrinterCallback = interface; //com.sunmi.peripheral.printer.InnerPrinterCallback
  JInnerPrinterException = interface; //com.sunmi.peripheral.printer.InnerPrinterException
  JInnerPrinterManager_1 = interface; //com.sunmi.peripheral.printer.InnerPrinterManager$1
  JInnerPrinterManager_SingletonContainer = interface; //com.sunmi.peripheral.printer.InnerPrinterManager$SingletonContainer
  JInnerPrinterManager = interface; //com.sunmi.peripheral.printer.InnerPrinterManager
  JInnerResultCallbcak = interface; //com.sunmi.peripheral.printer.InnerResultCallbcak
//  JInnerTaxCallback = interface; //com.sunmi.peripheral.printer.InnerTaxCallback
  JITax_Stub_Proxy = interface; //com.sunmi.peripheral.printer.ITax$Stub$Proxy
  JITax_Stub = interface; //com.sunmi.peripheral.printer.ITax$Stub
  JITax = interface; //com.sunmi.peripheral.printer.ITax
  JSunmiPrinterService_Stub_Proxy = interface; //com.sunmi.peripheral.printer.SunmiPrinterService$Stub$Proxy
  JSunmiPrinterService_Stub = interface; //com.sunmi.peripheral.printer.SunmiPrinterService$Stub
  JSunmiPrinterService = interface; //com.sunmi.peripheral.printer.SunmiPrinterService
  JTransBean_1 = interface; //com.sunmi.peripheral.printer.TransBean$1
  JTransBean = interface; //com.sunmi.peripheral.printer.TransBean
  JWoyouConsts = interface; //com.sunmi.peripheral.printer.WoyouConsts

// ===== Forward SuperClasses declarations =====

  JILcdCallback_StubClass = interface; //com.sunmi.peripheral.printer.ILcdCallback$Stub
  JICallback_StubClass = interface; //com.sunmi.peripheral.printer.ICallback$Stub
  JITax_StubClass = interface; //com.sunmi.peripheral.printer.ITax$Stub

// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{03F5F63A-B66D-4F5F-B7BB-8E00886ECE5A}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/sunmi/library/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{66E4EDCE-3EFB-4852-9814-EF500C5D39E2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JExceptionConstClass = interface(JObjectClass)
  ['{3138BD90-B58E-4B2C-BA4F-FCF8D49290EC}']
    { static Property Methods }
    {class} function _GetIP_SYSTEM_CALL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIP_INVALID_CALL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIP_MODEL_CALL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetIP_VERSION_CALL: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JExceptionConst; cdecl;

    { static Property }
    {class} property IP_SYSTEM_CALL: JString read _GetIP_SYSTEM_CALL;
    {class} property IP_INVALID_CALL: JString read _GetIP_INVALID_CALL;
    {class} property IP_MODEL_CALL: JString read _GetIP_MODEL_CALL;
    {class} property IP_VERSION_CALL: JString read _GetIP_VERSION_CALL;
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ExceptionConst')]
  JExceptionConst = interface(JObject)
  ['{9CB5EBFE-FD1F-44F0-AA71-505B57759CC9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExceptionConst = class(TJavaGenericImport<JExceptionConstClass, JExceptionConst>) end;

  JICallback_Stub_ProxyClass = interface(JObjectClass)
  ['{60161FC8-33DE-4442-B444-A577676FECDE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ICallback$Stub$Proxy')]
  JICallback_Stub_Proxy = interface(JObject)
  ['{7402ACDA-1A3B-4150-901A-3988D27FA0B4}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onRunResult(isSuccess: Boolean); cdecl;
    procedure onReturnString(result: JString); cdecl;
    procedure onRaiseException(code: Integer; msg: JString); cdecl;
    procedure onPrintResult(code: Integer; msg: JString); cdecl;

    { Property }
  end;

  TJICallback_Stub_Proxy = class(TJavaGenericImport<JICallback_Stub_ProxyClass, JICallback_Stub_Proxy>) end;

  JICallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{51661395-C99E-48E9-A2E6-0500B087BDEF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JICallback_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JICallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ICallback$Stub')]
  JICallback_Stub = interface(JBinder) // or JObject
  ['{9588E39F-22C6-479E-AFB5-2D5358437989}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJICallback_Stub = class(TJavaGenericImport<JICallback_StubClass, JICallback_Stub>) end;

  JICallbackClass = interface(JObjectClass)
  ['{F71C3AB4-0552-46D2-9FE1-CD25734F77D9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ICallback')]
  JICallback = interface(IJavaInstance)
  ['{E7C11D94-3369-4243-A229-AB4A08B7708D}']
    { Property Methods }

    { methods }
    procedure onRunResult(P1: Boolean); cdecl;
    procedure onReturnString(P1: JString); cdecl;
    procedure onRaiseException(P1: Integer; P2: JString); cdecl;
    procedure onPrintResult(P1: Integer; P2: JString); cdecl;

    { Property }
  end;

  TJICallback = class(TJavaGenericImport<JICallbackClass, JICallback>) end;

  JILcdCallback_Stub_ProxyClass = interface(JObjectClass)
  ['{D4AE0DBE-14F7-4ECF-B727-6FD34D887692}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ILcdCallback$Stub$Proxy')]
  JILcdCallback_Stub_Proxy = interface(JObject)
  ['{5766B9E9-C59C-4DC5-9258-115BF6915D6D}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onRunResult(show: Boolean); cdecl;

    { Property }
  end;

  TJILcdCallback_Stub_Proxy = class(TJavaGenericImport<JILcdCallback_Stub_ProxyClass, JILcdCallback_Stub_Proxy>) end;

  JILcdCallback_StubClass = interface(JBinderClass) // or JObjectClass
  ['{A61CE90A-CE8A-47E5-A593-771DEB111C14}']
    { static Property Methods }

    { static Methods }
    {class} function init: JILcdCallback_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JILcdCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ILcdCallback$Stub')]
  JILcdCallback_Stub = interface(JBinder) // or JObject
  ['{3CCF1537-0A36-4211-9126-2C59D1880CE8}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJILcdCallback_Stub = class(TJavaGenericImport<JILcdCallback_StubClass, JILcdCallback_Stub>) end;

  JILcdCallbackClass = interface(JObjectClass)
  ['{31A2669F-AC9A-4407-9AAA-47277821BBDC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ILcdCallback')]
  JILcdCallback = interface(IJavaInstance)
  ['{6ED73A46-0D38-4E56-95B8-4D2C08F68B9C}']
    { Property Methods }

    { methods }
    procedure onRunResult(P1: Boolean); cdecl;

    { Property }
  end;

  TJILcdCallback = class(TJavaGenericImport<JILcdCallbackClass, JILcdCallback>) end;

  JInnerLcdCallbackClass = interface(JILcdCallback_StubClass) // or JObjectClass
  ['{640E4145-DF73-47A7-AB5D-F7B3BD7F48FE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JInnerLcdCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/InnerLcdCallback')]
  JInnerLcdCallback = interface(JILcdCallback_Stub) // or JObject
  ['{1116060D-55C7-42D7-834A-4EFDD6E8EE40}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInnerLcdCallback = class(TJavaGenericImport<JInnerLcdCallbackClass, JInnerLcdCallback>) end;

  JInnerPrinterCallbackClass = interface(JObjectClass)
  ['{93D7F27F-B7B0-4EAA-9898-1A693921349A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JInnerPrinterCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/InnerPrinterCallback')]
  JInnerPrinterCallback = interface(JObject)
  ['{FA7DD5BB-00A7-40FF-8DCB-19E8D11939E3}']
    { Property Methods }

    { methods }
    procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl;
    procedure onServiceDisconnected(name: JComponentName); cdecl;

    { Property }
  end;

  TJInnerPrinterCallback = class(TJavaGenericImport<JInnerPrinterCallbackClass, JInnerPrinterCallback>) end;

  JInnerPrinterExceptionClass = interface(JRemoteExceptionClass) // or JObjectClass
  ['{FEA31C79-1329-4752-A640-2F09C4CB91AC}']
    { static Property Methods }

    { static Methods }
    {class} function init(amessage: JString): JInnerPrinterException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/InnerPrinterException')]
  JInnerPrinterException = interface(JRemoteException) // or JObject
  ['{1366F323-44B1-47BF-8C79-1E48514ED80E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInnerPrinterException = class(TJavaGenericImport<JInnerPrinterExceptionClass, JInnerPrinterException>) end;

  JInnerPrinterManager_1Class = interface(JObjectClass)
  ['{D45C6E45-79DC-419E-9742-C0CF54CAB90B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/InnerPrinterManager$1')]
  JInnerPrinterManager_1 = interface(JObject)
  ['{D3FF28D1-F730-4F1F-B07F-110C2B181159}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInnerPrinterManager_1 = class(TJavaGenericImport<JInnerPrinterManager_1Class, JInnerPrinterManager_1>) end;

  JInnerPrinterManager_SingletonContainerClass = interface(JObjectClass)
  ['{8EE60276-EC13-4151-B070-D556C588E456}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/InnerPrinterManager$SingletonContainer')]
  JInnerPrinterManager_SingletonContainer = interface(JObject)
  ['{EAD631B6-F5EE-45AF-9AD9-7338D1887AA5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInnerPrinterManager_SingletonContainer = class(TJavaGenericImport<JInnerPrinterManager_SingletonContainerClass, JInnerPrinterManager_SingletonContainer>) end;

  JInnerPrinterManagerClass = interface(JObjectClass)
  ['{1C4152F7-A36A-4F06-8C8C-3B0E74590010}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JInnerPrinterManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/InnerPrinterManager')]
  JInnerPrinterManager = interface(JObject)
  ['{BE4D59B9-C270-42D8-A119-7BB80DC5EA9D}']
    { Property Methods }

    { methods }
    function bindService(mContext: JContext; callback: JInnerPrinterCallback): Boolean; cdecl;
    procedure unBindService(mContext: JContext; callback: JInnerPrinterCallback); cdecl;
    function hasPrinter(sunmiPrinterService: JSunmiPrinterService): Boolean; cdecl;

    { Property }
  end;

  TJInnerPrinterManager = class(TJavaGenericImport<JInnerPrinterManagerClass, JInnerPrinterManager>) end;

  JInnerResultCallbcakClass = interface(JICallback_StubClass) // or JObjectClass
  ['{03B4EF7E-9DA7-48A0-925A-5034F8FEC51D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JInnerResultCallbcak; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/InnerResultCallbcak')]
  JInnerResultCallbcak = interface(JICallback_Stub) // or JObject
  ['{1CAD0BE5-4C97-4D24-AE5C-252CB1080AB5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInnerResultCallbcak = class(TJavaGenericImport<JInnerResultCallbcakClass, JInnerResultCallbcak>) end;

//  JInnerTaxCallbackClass = interface(JITax_StubClass) // or JObjectClass
//  ['{158D5384-CB5F-4062-9558-376B21A05788}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JInnerTaxCallback; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/sunmi/peripheral/printer/InnerTaxCallback')]
//  JInnerTaxCallback = interface(JITax_Stub) // or JObject
//  ['{6985CF5D-C12D-4433-A0BC-7A1F4D6C3651}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJInnerTaxCallback = class(TJavaGenericImport<JInnerTaxCallbackClass, JInnerTaxCallback>) end;

  JITax_Stub_ProxyClass = interface(JObjectClass)
  ['{8E22285A-2264-4714-A712-ED759944A199}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ITax$Stub$Proxy')]
  JITax_Stub_Proxy = interface(JObject)
  ['{DE857789-0B0A-4FB1-9485-EB0E71C8F445}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure onDataResult(data: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJITax_Stub_Proxy = class(TJavaGenericImport<JITax_Stub_ProxyClass, JITax_Stub_Proxy>) end;

  JITax_StubClass = interface(JBinderClass) // or JObjectClass
  ['{305EFC67-D28A-4105-9DDE-E74D7A1AF709}']
    { static Property Methods }

    { static Methods }
    {class} function init: JITax_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JITax; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ITax$Stub')]
  JITax_Stub = interface(JBinder) // or JObject
  ['{F4A412CF-7B5B-448B-B541-458C380EB404}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJITax_Stub = class(TJavaGenericImport<JITax_StubClass, JITax_Stub>) end;

  JITaxClass = interface(JObjectClass)
  ['{88F7BBB4-6634-4E38-AFD5-F392BB4685CA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/ITax')]
  JITax = interface(IJavaInstance)
  ['{0F6851CE-6F5F-4514-971B-66D31E69688F}']
    { Property Methods }

    { methods }
    procedure onDataResult(P1: TJavaArray<Byte>); cdecl;

    { Property }
  end;

  TJITax = class(TJavaGenericImport<JITaxClass, JITax>) end;

  JSunmiPrinterService_Stub_ProxyClass = interface(JObjectClass)
  ['{1DA6DC4F-72F8-4C53-B51B-864C745260B4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/SunmiPrinterService$Stub$Proxy')]
  JSunmiPrinterService_Stub_Proxy = interface(JObject)
  ['{85246A0F-C7EE-449F-AFD4-0DFFB554E689}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getInterfaceDescriptor: JString; cdecl;
    procedure updateFirmware; cdecl;
    function getFirmwareStatus: Integer; cdecl;
    function getServiceVersion: JString; cdecl;
    procedure printerInit(callback: JICallback); cdecl;
    procedure printerSelfChecking(callback: JICallback); cdecl;
    function getPrinterSerialNo: JString; cdecl;
    function getPrinterVersion: JString; cdecl;
    function getPrinterModal: JString; cdecl;
    procedure getPrintedLength(callback: JICallback); cdecl;
    procedure lineWrap(n: Integer; callback: JICallback); cdecl;
    procedure sendRAWData(data: TJavaArray<Byte>; callback: JICallback); cdecl;
    procedure setAlignment(alignment: Integer; callback: JICallback); cdecl;
    procedure setFontName(typeface: JString; callback: JICallback); cdecl;
    procedure setFontSize(fontsize: Single; callback: JICallback); cdecl;
    procedure printText(text: JString; callback: JICallback); cdecl;
    procedure printTextWithFont(text: JString; typeface: JString; fontsize: Single; callback: JICallback); cdecl;
    procedure printColumnsText(colsTextArr: TJavaObjectArray<JString>; colsWidthArr: TJavaArray<Integer>; colsAlign: TJavaArray<Integer>; callback: JICallback); cdecl;
    procedure printBitmap(bitmap: JBitmap; callback: JICallback); cdecl;
    procedure printBarCode(data: JString; symbology: Integer; height: Integer; width: Integer; textposition: Integer; callback: JICallback); cdecl;
    procedure printQRCode(data: JString; modulesize: Integer; errorlevel: Integer; callback: JICallback); cdecl;
    procedure printOriginalText(text: JString; callback: JICallback); cdecl;
    procedure commitPrint(transbean: TJavaObjectArray<JTransBean>; callback: JICallback); cdecl;
    procedure commitPrinterBuffer; cdecl;
    procedure cutPaper(callback: JICallback); cdecl;
    function getCutPaperTimes: Integer; cdecl;
    procedure openDrawer(callback: JICallback); cdecl;
    function getOpenDrawerTimes: Integer; cdecl;
    procedure enterPrinterBuffer(clean: Boolean); cdecl;
    procedure exitPrinterBuffer(commit: Boolean); cdecl;
    procedure tax(data: TJavaArray<Byte>; callback: JITax); cdecl;
    procedure getPrinterFactory(callback: JICallback); cdecl;
    procedure clearBuffer; cdecl;
    procedure commitPrinterBufferWithCallback(callback: JICallback); cdecl;
    procedure exitPrinterBufferWithCallback(commit: Boolean; callback: JICallback); cdecl;
    procedure printColumnsString(colsTextArr: TJavaObjectArray<JString>; colsWidthArr: TJavaArray<Integer>; colsAlign: TJavaArray<Integer>; callback: JICallback); cdecl;
    function updatePrinterState: Integer; cdecl;
    procedure sendLCDCommand(flag: Integer); cdecl;
    procedure sendLCDString(astring: JString; callback: JILcdCallback); cdecl;
    procedure sendLCDBitmap(bitmap: JBitmap; callback: JILcdCallback); cdecl;
    function getPrinterMode: Integer; cdecl;
    function getPrinterBBMDistance: Integer; cdecl;
    procedure printBitmapCustom(bitmap: JBitmap; atype: Integer; callback: JICallback); cdecl;
    function getForcedDouble: Integer; cdecl;
    function isForcedAntiWhite: Boolean; cdecl;
    function isForcedBold: Boolean; cdecl;
    function isForcedUnderline: Boolean; cdecl;
    function getForcedRowHeight: Integer; cdecl;
    function getFontName: Integer; cdecl;
    procedure sendLCDDoubleString(topText: JString; bottomText: JString; callback: JILcdCallback); cdecl;
    function getPrinterPaper: Integer; cdecl;
    function getDrawerStatus: Boolean; cdecl;
    procedure sendLCDFillString(astring: JString; size: Integer; fill: Boolean; callback: JILcdCallback); cdecl;
    procedure sendLCDMultiString(text: TJavaObjectArray<JString>; align: TJavaArray<Integer>; callback: JILcdCallback); cdecl;
    function getPrinterDensity: Integer; cdecl;
    procedure print2DCode(data: JString; symbology: Integer; modulesize: Integer; errorlevel: Integer; callback: JICallback); cdecl;
    procedure autoOutPaper(callback: JICallback); cdecl;
    procedure setPrinterStyle(key: Integer; value: Integer); cdecl;
    procedure labelLocate; cdecl;
    procedure labelOutput; cdecl;

    { Property }
  end;

  TJSunmiPrinterService_Stub_Proxy = class(TJavaGenericImport<JSunmiPrinterService_Stub_ProxyClass, JSunmiPrinterService_Stub_Proxy>) end;

  JSunmiPrinterService_StubClass = interface(JBinderClass) // or JObjectClass
  ['{67E0A109-8FF1-48E4-ABBA-D4A9376B7FE1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSunmiPrinterService_Stub; cdecl;
    {class} function asInterface(obj: JIBinder): JSunmiPrinterService; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/SunmiPrinterService$Stub')]
  JSunmiPrinterService_Stub = interface(JBinder) // or JObject
  ['{2DBDC18A-E712-4223-BD3E-611E70D20F87}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl;

    { Property }
  end;

  TJSunmiPrinterService_Stub = class(TJavaGenericImport<JSunmiPrinterService_StubClass, JSunmiPrinterService_Stub>) end;

  JSunmiPrinterServiceClass = interface(JObjectClass)
  ['{80E26C98-3C83-48E0-A27D-B604B4F4A0C0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/SunmiPrinterService')]
  JSunmiPrinterService = interface(IJavaInstance)
  ['{73055A78-09BE-4F1B-91E5-2D8CBB9DEE07}']
    { Property Methods }

    { methods }
    procedure updateFirmware; cdecl;
    function getFirmwareStatus: Integer; cdecl;
    function getServiceVersion: JString; cdecl;
    procedure printerInit(P1: JICallback); cdecl;
    procedure printerSelfChecking(P1: JICallback); cdecl;
    function getPrinterSerialNo: JString; cdecl;
    function getPrinterVersion: JString; cdecl;
    function getPrinterModal: JString; cdecl;
    procedure getPrintedLength(P1: JICallback); cdecl;
    procedure lineWrap(P1: Integer; P2: JICallback); cdecl;
    procedure sendRAWData(P1: TJavaArray<Byte>; P2: JICallback); cdecl;
    procedure setAlignment(P1: Integer; P2: JICallback); cdecl;
    procedure setFontName(P1: JString; P2: JICallback); cdecl;
    procedure setFontSize(P1: Single; P2: JICallback); cdecl;
    procedure printText(P1: JString; P2: JICallback); cdecl;
    procedure printTextWithFont(P1: JString; P2: JString; P3: Single; P4: JICallback); cdecl;
    procedure printColumnsText(P1: TJavaObjectArray<JString>; P2: TJavaArray<Integer>; P3: TJavaArray<Integer>; P4: JICallback); cdecl;
    procedure printBitmap(P1: JBitmap; P2: JICallback); cdecl;
    procedure printBarCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JICallback); cdecl;
    procedure printQRCode(P1: JString; P2: Integer; P3: Integer; P4: JICallback); cdecl;
    procedure printOriginalText(P1: JString; P2: JICallback); cdecl;
    procedure commitPrint(P1: TJavaObjectArray<JTransBean>; P2: JICallback); cdecl;
    procedure commitPrinterBuffer; cdecl;
    procedure cutPaper(P1: JICallback); cdecl;
    function getCutPaperTimes: Integer; cdecl;
    procedure openDrawer(P1: JICallback); cdecl;
    function getOpenDrawerTimes: Integer; cdecl;
    procedure enterPrinterBuffer(P1: Boolean); cdecl;
    procedure exitPrinterBuffer(P1: Boolean); cdecl;
    procedure tax(P1: TJavaArray<Byte>; P2: JITax); cdecl;
    procedure getPrinterFactory(P1: JICallback); cdecl;
    procedure clearBuffer; cdecl;
    procedure commitPrinterBufferWithCallback(P1: JICallback); cdecl;
    procedure exitPrinterBufferWithCallback(P1: Boolean; P2: JICallback); cdecl;
    procedure printColumnsString(P1: TJavaObjectArray<JString>; P2: TJavaArray<Integer>; P3: TJavaArray<Integer>; P4: JICallback); cdecl;
    function updatePrinterState: Integer; cdecl;
    procedure sendLCDCommand(P1: Integer); cdecl;
    procedure sendLCDString(P1: JString; P2: JILcdCallback); cdecl;
    procedure sendLCDBitmap(P1: JBitmap; P2: JILcdCallback); cdecl;
    function getPrinterMode: Integer; cdecl;
    function getPrinterBBMDistance: Integer; cdecl;
    procedure printBitmapCustom(P1: JBitmap; P2: Integer; P3: JICallback); cdecl;
    function getForcedDouble: Integer; cdecl;
    function isForcedAntiWhite: Boolean; cdecl;
    function isForcedBold: Boolean; cdecl;
    function isForcedUnderline: Boolean; cdecl;
    function getForcedRowHeight: Integer; cdecl;
    function getFontName: Integer; cdecl;
    procedure sendLCDDoubleString(P1: JString; P2: JString; P3: JILcdCallback); cdecl;
    function getPrinterPaper: Integer; cdecl;
    function getDrawerStatus: Boolean; cdecl;
    procedure sendLCDFillString(P1: JString; P2: Integer; P3: Boolean; P4: JILcdCallback); cdecl;
    procedure sendLCDMultiString(P1: TJavaObjectArray<JString>; P2: TJavaArray<Integer>; P3: JILcdCallback); cdecl;
    function getPrinterDensity: Integer; cdecl;
    procedure print2DCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: JICallback); cdecl;
    procedure autoOutPaper(P1: JICallback); cdecl;
    procedure setPrinterStyle(P1: Integer; P2: Integer); cdecl;
    procedure labelLocate; cdecl;
    procedure labelOutput; cdecl;

    { Property }
  end;

  TJSunmiPrinterService = class(TJavaGenericImport<JSunmiPrinterServiceClass, JSunmiPrinterService>) end;

  JTransBean_1Class = interface(JObjectClass)
  ['{D470A039-A7A7-4A1D-83EF-390A702D991A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/peripheral/printer/TransBean$1')]
  JTransBean_1 = interface(JObject)
  ['{68461A04-721D-4139-BE48-6CFBC0BBC1F0}']
    { Property Methods }

    { methods }
    function createFromParcel(source: JParcel): JTransBean; cdecl; overload;
    function newArray(size: Integer): TJavaObjectArray<JTransBean>; cdecl; overload;
//    function newArray(this: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(this: JParcel): JObject; cdecl; overload;

    { Property }
  end;

  TJTransBean_1 = class(TJavaGenericImport<JTransBean_1Class, JTransBean_1>) end;

  JTransBeanClass = interface(JObjectClass)
  ['{3C62F076-202C-4D77-8CF1-BA6FB47E1BAA}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JTransBean; cdecl; overload;
    {class} function init(source: JParcel): JTransBean; cdecl; overload;
    {class} function init(atype: Byte; text: JString; data: TJavaArray<Byte>): JTransBean; cdecl; overload;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/sunmi/peripheral/printer/TransBean')]
  JTransBean = interface(JObject)
  ['{FC2521ED-4D11-4102-B510-12EB82936493}']
    { Property Methods }

    { methods }
    function getType: Byte; cdecl;
    procedure setType(atype: Byte); cdecl;
    function getText: JString; cdecl;
    procedure setText(text: JString); cdecl;
    function getData: TJavaArray<Byte>; cdecl;
    procedure setData(data: TJavaArray<Byte>); cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(dest: JParcel; flags: Integer); cdecl;

    { Property }
  end;

  TJTransBean = class(TJavaGenericImport<JTransBeanClass, JTransBean>) end;

  JWoyouConstsClass = interface(JObjectClass)
  ['{1FF3C546-105E-4FA6-9558-4E5E5D42A67F}']
    { static Property Methods }
    {class} function _GetENABLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDISABLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_DOUBLE_WIDTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_DOUBLE_HEIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_BOLD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_UNDERLINE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_ANTI_WHITE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_STRIKETHROUGH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_ILALIC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENABLE_INVERT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_TEXT_RIGHT_SPACING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_RELATIVE_POSITION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_ABSOLUATE_POSITION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_LINE_SPACING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_LEFT_SPACING: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSET_STRIKETHROUGH_STYLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property ENABLE: Integer read _GetENABLE;
    {class} property DISABLE: Integer read _GetDISABLE;
    {class} property ENABLE_DOUBLE_WIDTH: Integer read _GetENABLE_DOUBLE_WIDTH;
    {class} property ENABLE_DOUBLE_HEIGHT: Integer read _GetENABLE_DOUBLE_HEIGHT;
    {class} property ENABLE_BOLD: Integer read _GetENABLE_BOLD;
    {class} property ENABLE_UNDERLINE: Integer read _GetENABLE_UNDERLINE;
    {class} property ENABLE_ANTI_WHITE: Integer read _GetENABLE_ANTI_WHITE;
    {class} property ENABLE_STRIKETHROUGH: Integer read _GetENABLE_STRIKETHROUGH;
    {class} property ENABLE_ILALIC: Integer read _GetENABLE_ILALIC;
    {class} property ENABLE_INVERT: Integer read _GetENABLE_INVERT;
    {class} property SET_TEXT_RIGHT_SPACING: Integer read _GetSET_TEXT_RIGHT_SPACING;
    {class} property SET_RELATIVE_POSITION: Integer read _GetSET_RELATIVE_POSITION;
    {class} property SET_ABSOLUATE_POSITION: Integer read _GetSET_ABSOLUATE_POSITION;
    {class} property SET_LINE_SPACING: Integer read _GetSET_LINE_SPACING;
    {class} property SET_LEFT_SPACING: Integer read _GetSET_LEFT_SPACING;
    {class} property SET_STRIKETHROUGH_STYLE: Integer read _GetSET_STRIKETHROUGH_STYLE;
  end;

  [JavaSignature('com/sunmi/peripheral/printer/WoyouConsts')]
  JWoyouConsts = interface(IJavaInstance)
  ['{2249D916-7D19-41F1-87BC-A32BE6948EE3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJWoyouConsts = class(TJavaGenericImport<JWoyouConstsClass, JWoyouConsts>) end;

implementation

//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JBuildConfig',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JExceptionConst',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JExceptionConst));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JICallback_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JICallback_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JICallback_Stub',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JICallback_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JICallback',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JICallback));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JILcdCallback_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JILcdCallback_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JILcdCallback_Stub',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JILcdCallback_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JILcdCallback',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JILcdCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JInnerLcdCallback',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JInnerLcdCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JInnerPrinterCallback',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JInnerPrinterCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JInnerPrinterException',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JInnerPrinterException));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JInnerPrinterManager_1',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JInnerPrinterManager_1));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JInnerPrinterManager_SingletonContainer',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JInnerPrinterManager_SingletonContainer));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JInnerPrinterManager',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JInnerPrinterManager));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JInnerResultCallbcak',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JInnerResultCallbcak));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JInnerTaxCallback',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JInnerTaxCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JITax_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JITax_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JITax_Stub',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JITax_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JITax',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JITax));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JSunmiPrinterService_Stub_Proxy',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JSunmiPrinterService_Stub_Proxy));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JSunmiPrinterService_Stub',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JSunmiPrinterService_Stub));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JSunmiPrinterService',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JSunmiPrinterService));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JTransBean_1',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JTransBean_1));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JTransBean',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JTransBean));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmi_printer_all.JWoyouConsts',
//    TypeInfo(Androidapi.JNI.sunmi_printer_all.JWoyouConsts));
//end;
//
//
//initialization
//  RegisterTypes;

end.
