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
//  生成时间：2020-11-09 08:07:50
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.sunmiprinter;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.zxing_core_3_4_0,
//  Androidapi.JNI.com.google.zxing.BarcodeFormat,
//  Androidapi.JNI.com.google.zxing.common.BitMatrix,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os;


type

// ===== Forward declarations =====

  JICallback = interface; //com.sunmi.controller.ICallback
  JIV1Printer = interface; //com.sunmi.controller.IV1Printer
//  JV1Printer_1 = interface; //com.sunmi.impl.V1Printer$1
//  JV1Printer_10 = interface; //com.sunmi.impl.V1Printer$10
//  JV1Printer_11 = interface; //com.sunmi.impl.V1Printer$11
//  JV1Printer_12 = interface; //com.sunmi.impl.V1Printer$12
//  JV1Printer_13 = interface; //com.sunmi.impl.V1Printer$13
//  JV1Printer_14 = interface; //com.sunmi.impl.V1Printer$14
//  JV1Printer_15 = interface; //com.sunmi.impl.V1Printer$15
//  JV1Printer_16 = interface; //com.sunmi.impl.V1Printer$16
//  JV1Printer_17 = interface; //com.sunmi.impl.V1Printer$17
//  JV1Printer_18 = interface; //com.sunmi.impl.V1Printer$18
//  JV1Printer_19 = interface; //com.sunmi.impl.V1Printer$19
//  JV1Printer_2 = interface; //com.sunmi.impl.V1Printer$2
//  JV1Printer_20 = interface; //com.sunmi.impl.V1Printer$20
//  JV1Printer_21 = interface; //com.sunmi.impl.V1Printer$21
//  JV1Printer_22 = interface; //com.sunmi.impl.V1Printer$22
//  JV1Printer_3 = interface; //com.sunmi.impl.V1Printer$3
//  JV1Printer_4 = interface; //com.sunmi.impl.V1Printer$4
//  JV1Printer_5 = interface; //com.sunmi.impl.V1Printer$5
//  JV1Printer_6 = interface; //com.sunmi.impl.V1Printer$6
//  JV1Printer_7 = interface; //com.sunmi.impl.V1Printer$7
//  JV1Printer_8 = interface; //com.sunmi.impl.V1Printer$8
//  JV1Printer_9 = interface; //com.sunmi.impl.V1Printer$9
  JV1Printer = interface; //com.sunmi.impl.V1Printer
  JBitmapCreator_CharWithPos = interface; //com.sunmi.ui.BitmapCreator$CharWithPos
  JBitmapCreator = interface; //com.sunmi.ui.BitmapCreator
  JEasyFonts = interface; //com.sunmi.ui.EasyFonts
  JFontSourceProcessor = interface; //com.sunmi.ui.FontSourceProcessor
  JPrinterSet = interface; //com.sunmi.ui.PrinterSet
  JRawPrintInterface = interface; //com.sunmi.ui.RawPrintInterface
  JBytesUtil = interface; //com.sunmi.util.BytesUtil
  JLinkQueue_Node = interface; //com.sunmi.util.LinkQueue$Node
  JLinkQueue = interface; //com.sunmi.util.LinkQueue
  JPicFromPrintUtils = interface; //com.sunmi.util.PicFromPrintUtils
  JSingleThreadPoolManager = interface; //com.sunmi.util.SingleThreadPoolManager
  JThreadPoolManager = interface; //com.sunmi.util.ThreadPoolManager
  JICallback_Stub_Proxy = interface; //woyou.aidlservice.jiuiv5.ICallback$Stub$Proxy
  JICallback_Stub = interface; //woyou.aidlservice.jiuiv5.ICallback$Stub
  JICallback_039 = interface; //woyou.aidlservice.jiuiv5.ICallback
  JIWoyouService_Stub_Proxy = interface; //woyou.aidlservice.jiuiv5.IWoyouService$Stub$Proxy
  JIWoyouService_Stub = interface; //woyou.aidlservice.jiuiv5.IWoyouService$Stub
  JIWoyouService = interface; //woyou.aidlservice.jiuiv5.IWoyouService
  JIYmodemSPI_Stub_Proxy = interface; //woyou.aidlservice.jiuiv5.IYmodemSPI$Stub$Proxy
  JIYmodemSPI_Stub = interface; //woyou.aidlservice.jiuiv5.IYmodemSPI$Stub
  JIYmodemSPI = interface; //woyou.aidlservice.jiuiv5.IYmodemSPI

// ===== Forward SuperClasses declarations =====

  JICallback_StubClass = interface; //woyou.aidlservice.jiuiv5.ICallback$Stub

// ===== Interface declarations =====

  JICallbackClass = interface(JObjectClass)
  ['{F5E76F46-E3D8-449A-B9AD-2680444FA0D0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/controller/ICallback')]
  JICallback = interface(IJavaInstance)
  ['{806640C2-2F34-4969-AB75-CF9E2F26D9A2}']
    { Property Methods }

    { methods }
    procedure onRunResult(P1: Boolean); cdecl; //(Z)V
    procedure onReturnString(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure onRaiseException(P1: Integer; P2: JString); cdecl; //(ILjava/lang/String;)V

    { Property }
  end;

  TJICallback = class(TJavaGenericImport<JICallbackClass, JICallback>) end;

  JIV1PrinterClass = interface(JObjectClass)
  ['{6DD64B6F-22AC-4771-8883-7F8620136527}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/controller/IV1Printer')]
  JIV1Printer = interface(IJavaInstance)
  ['{FF2D61B9-07DA-4C5B-BC8B-F1C635C1F823}']
    { Property Methods }

    { methods }
    procedure setCallback(P1: JICallback); cdecl; //(Lcom/sunmi/controller/ICallback;)V
    procedure beginTransaction; cdecl; //()V
    procedure cancelTransaction; cdecl; //()V
    procedure commitTransaction; cdecl; //()V
    procedure printerInit; cdecl; //()V
    procedure printerSelfChecking; cdecl; //()V
    function getPrinterSerialNo: JString; cdecl; //()Ljava/lang/String;
    function getPrinterVersion: JString; cdecl; //()Ljava/lang/String;
    function getPrinterModal: JString; cdecl; //()Ljava/lang/String;
    procedure lineWrap(P1: Integer); cdecl; //(I)V
    procedure sendRAWData(P1: TJavaArray<Byte>); cdecl; //([B)V
    procedure setAlignment(P1: Integer); cdecl; //(I)V
    procedure setFontName(P1: JString); cdecl; overload; //(Ljava/lang/String;)V
    procedure setFontName(P1: JTypeface); cdecl; overload; //(Landroid/graphics/Typeface;)V
    procedure setFontSize(P1: Single); cdecl; //(F)V
    procedure printText(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure printTextWithFont(P1: JString; P2: JString; P3: Single); cdecl; //(Ljava/lang/String;Ljava/lang/String;F)V
    procedure printColumnsText(P1: TJavaObjectArray<JString>; P2: TJavaArray<Integer>; P3: TJavaArray<Integer>); cdecl; //([Ljava/lang/String;[I[I)V
    procedure printBitmap(P1: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    procedure printBarCode(P1: JString; P2: JBarcodeFormat; P3: Integer; P4: Integer); cdecl; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)V
    procedure printQRCode(P1: JString; P2: Integer); cdecl; //(Ljava/lang/String;I)V
    procedure printDoubleQRCode(P1: JString; P2: JString; P3: Integer); cdecl; //(Ljava/lang/String;Ljava/lang/String;I)V
    procedure printHorizontalLine(P1: Integer; P2: Integer); cdecl; //(II)V
    procedure printTypeHorizontalLine(P1: Integer); cdecl; //(I)V
    procedure printOriginalText(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure setPrintSpeed(P1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJIV1Printer = class(TJavaGenericImport<JIV1PrinterClass, JIV1Printer>) end;

//  JV1Printer_1Class = interface(JObjectClass)
//  ['{FA78DFB2-8D65-402F-9492-122D7333FDBB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$1')]
//  JV1Printer_1 = interface(JObject)
//  ['{E86E1D69-D596-4DD6-AD51-283A918DAB5B}']
//    { Property Methods }
//
//    { methods }
//    procedure onServiceDisconnected(name: JComponentName); cdecl; //(Landroid/content/ComponentName;)V
//    procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl; //(Landroid/content/ComponentName;Landroid/os/IBinder;)V
//
//    { Property }
//  end;

//  TJV1Printer_1 = class(TJavaGenericImport<JV1Printer_1Class, JV1Printer_1>) end;

//  JV1Printer_10Class = interface(JObjectClass)
//  ['{DD4164C1-12AA-4477-BA19-BE049D8ACF9A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$10')]
//  JV1Printer_10 = interface(JObject)
//  ['{2520B0F1-FEBE-4EF1-B78C-F0B8D80514A0}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_10 = class(TJavaGenericImport<JV1Printer_10Class, JV1Printer_10>) end;

//  JV1Printer_11Class = interface(JObjectClass)
//  ['{23359CF8-DD20-4204-BDDB-FC482C8F92F3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$11')]
//  JV1Printer_11 = interface(JObject)
//  ['{FC4F52D2-A384-42E2-A7C7-DE2638D32C01}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_11 = class(TJavaGenericImport<JV1Printer_11Class, JV1Printer_11>) end;

//  JV1Printer_12Class = interface(JObjectClass)
//  ['{C66137A4-2407-438E-BC96-BA8FB4CEC9A0}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$12')]
//  JV1Printer_12 = interface(JObject)
//  ['{3BEC43FA-EC33-4154-89CC-D1B248F77897}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_12 = class(TJavaGenericImport<JV1Printer_12Class, JV1Printer_12>) end;

//  JV1Printer_13Class = interface(JObjectClass)
//  ['{5C984A71-11AF-4D06-BA7F-F73B211C0C0C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$13')]
//  JV1Printer_13 = interface(JObject)
//  ['{B0206B83-3BBC-46F1-88CD-09B4AE4B14A5}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_13 = class(TJavaGenericImport<JV1Printer_13Class, JV1Printer_13>) end;

//  JV1Printer_14Class = interface(JObjectClass)
//  ['{A9D2FDC7-070B-47AA-A230-BC29A546D7C6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$14')]
//  JV1Printer_14 = interface(JObject)
//  ['{153E1C3A-AFF9-40E5-9D0D-C47CBFA05998}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_14 = class(TJavaGenericImport<JV1Printer_14Class, JV1Printer_14>) end;

//  JV1Printer_15Class = interface(JObjectClass)
//  ['{7343F04B-6D5B-42AC-BA25-9CFB49C46F6D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$15')]
//  JV1Printer_15 = interface(JObject)
//  ['{9BD41874-B378-4F04-BAD8-485DAC071B0D}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_15 = class(TJavaGenericImport<JV1Printer_15Class, JV1Printer_15>) end;

//  JV1Printer_16Class = interface(JObjectClass)
//  ['{154F36BD-2215-49C0-90ED-4282C3172B9F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$16')]
//  JV1Printer_16 = interface(JObject)
//  ['{6F5FDC53-F096-4B20-9818-C3AE60310BF5}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_16 = class(TJavaGenericImport<JV1Printer_16Class, JV1Printer_16>) end;

//  JV1Printer_17Class = interface(JObjectClass)
//  ['{D913D785-4319-45B4-8CDA-48138BD6941F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$17')]
//  JV1Printer_17 = interface(JObject)
//  ['{92BD6F9D-D9E6-4AFB-A827-532294E27105}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_17 = class(TJavaGenericImport<JV1Printer_17Class, JV1Printer_17>) end;

//  JV1Printer_18Class = interface(JObjectClass)
//  ['{206409E4-5EF7-424A-A63C-18F9053543F3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$18')]
//  JV1Printer_18 = interface(JObject)
//  ['{5468DB6E-E3AF-4AAD-8AA0-A6F522FFCA8A}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_18 = class(TJavaGenericImport<JV1Printer_18Class, JV1Printer_18>) end;

//  JV1Printer_19Class = interface(JObjectClass)
//  ['{3E0FEB30-E6BD-41D3-BD4A-185A7CD114C8}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$19')]
//  JV1Printer_19 = interface(JObject)
//  ['{B399962F-D835-458A-8BBE-C0FDD39D1788}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_19 = class(TJavaGenericImport<JV1Printer_19Class, JV1Printer_19>) end;

//  JV1Printer_2Class = interface(JObjectClass)
//  ['{927F0140-E53D-4975-B799-F45E2461E922}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$2')]
//  JV1Printer_2 = interface(JObject)
//  ['{6D1C40E2-DC68-4BD8-A4E7-D82F728E6D78}']
//    { Property Methods }
//
//    { methods }
//    procedure printBytes(bytes: TJavaArray<Byte>; callback: JICallback); cdecl; //([BLwoyou/aidlservice/jiuiv5/ICallback;)V
//
//    { Property }
//  end;

//  TJV1Printer_2 = class(TJavaGenericImport<JV1Printer_2Class, JV1Printer_2>) end;

//  JV1Printer_20Class = interface(JObjectClass)
//  ['{647890BA-86D5-48E4-AB2C-14E9AD110688}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$20')]
//  JV1Printer_20 = interface(JObject)
//  ['{B43F7E9F-F99C-4BE3-83EB-7FA3E634AF2E}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_20 = class(TJavaGenericImport<JV1Printer_20Class, JV1Printer_20>) end;

//  JV1Printer_21Class = interface(JObjectClass)
//  ['{CA8BEA07-2037-48E9-9DB6-C310564894ED}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$21')]
//  JV1Printer_21 = interface(JObject)
//  ['{3B3EC69A-003C-4829-BA24-571ECB9A5FB0}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_21 = class(TJavaGenericImport<JV1Printer_21Class, JV1Printer_21>) end;

//  JV1Printer_22Class = interface(JObjectClass)
//  ['{FA530F14-AB53-4A0F-B854-0DAA7B8FA082}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$22')]
//  JV1Printer_22 = interface(JObject)
//  ['{A8CF5572-A868-438E-B242-AF6BB291BA32}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_22 = class(TJavaGenericImport<JV1Printer_22Class, JV1Printer_22>) end;

//  JV1Printer_3Class = interface(JICallback_StubClass) // or JObjectClass // SuperSignature: woyou/aidlservice/jiuiv5/ICallback$Stub
//  ['{20EF6092-A838-45EA-8D7A-DB7D27CD3C0F}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$3')]
//  JV1Printer_3 = interface(JICallback_Stub) // or JObject // SuperSignature: woyou/aidlservice/jiuiv5/ICallback$Stub
//  ['{E54BEC63-75F2-4F40-8FB9-73B38263BC3B}']
//    { Property Methods }
//
//    { methods }
//    procedure onRunResult(isSuccess: Boolean); cdecl; //(Z)V
//    procedure onReturnString(result: JString); cdecl; //(Ljava/lang/String;)V
//    procedure onRaiseException(code: Integer; msg: JString); cdecl; //(ILjava/lang/String;)V
//
//    { Property }
//  end;

//  TJV1Printer_3 = class(TJavaGenericImport<JV1Printer_3Class, JV1Printer_3>) end;

//  JV1Printer_4Class = interface(JObjectClass)
//  ['{C2B05201-0538-4D76-924C-C423E498827C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$4')]
//  JV1Printer_4 = interface(JObject)
//  ['{D0A90D64-C140-48E8-AA66-E55133359E78}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_4 = class(TJavaGenericImport<JV1Printer_4Class, JV1Printer_4>) end;

//  JV1Printer_5Class = interface(JObjectClass)
//  ['{7553C65D-BE26-4156-9E90-3CD5AF17C561}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$5')]
//  JV1Printer_5 = interface(JObject)
//  ['{37B211EC-96D7-4D1E-9A12-EF568CBC211F}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_5 = class(TJavaGenericImport<JV1Printer_5Class, JV1Printer_5>) end;

//  JV1Printer_6Class = interface(JObjectClass)
//  ['{051FEB17-0958-4E13-B520-2E5A07A292E5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$6')]
//  JV1Printer_6 = interface(JObject)
//  ['{A387927E-60CE-4421-805E-BA06AE11D1BE}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_6 = class(TJavaGenericImport<JV1Printer_6Class, JV1Printer_6>) end;

//  JV1Printer_7Class = interface(JObjectClass)
//  ['{7CA93987-1ED0-493E-961F-3CB4CCD7FEBB}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$7')]
//  JV1Printer_7 = interface(JObject)
//  ['{28786C06-D4FD-47AF-A32C-C02188BF1B5B}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_7 = class(TJavaGenericImport<JV1Printer_7Class, JV1Printer_7>) end;

//  JV1Printer_8Class = interface(JObjectClass)
//  ['{B39BF75C-01C7-43A6-834A-BC49B918AB1E}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$8')]
//  JV1Printer_8 = interface(JObject)
//  ['{975265A8-3AAD-4F5D-93DB-DAEB663AE748}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_8 = class(TJavaGenericImport<JV1Printer_8Class, JV1Printer_8>) end;

//  JV1Printer_9Class = interface(JObjectClass)
//  ['{9EBD08DD-A192-43BD-9F4F-5E2ABDD5EECF}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/sunmi/impl/V1Printer$9')]
//  JV1Printer_9 = interface(JObject)
//  ['{FAD3A6B5-EFC0-4DB5-97C7-E8C203410754}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl; //()V
//
//    { Property }
//  end;

//  TJV1Printer_9 = class(TJavaGenericImport<JV1Printer_9Class, JV1Printer_9>) end;

  JV1PrinterClass = interface(JObjectClass)
  ['{D05CE0CE-130D-4826-A0C2-C5D43D25A1E8}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JV1Printer; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/sunmi/impl/V1Printer')]
  JV1Printer = interface(JObject)
  ['{465C7C36-C3C8-4D09-A711-290D851CD749}']
    { Property Methods }

    { methods }
    procedure setCallback(callback: JICallback); cdecl; //(Lcom/sunmi/controller/ICallback;)V
    procedure beginTransaction; cdecl; //()V
    procedure cancelTransaction; cdecl; //()V
    procedure commitTransaction; cdecl; //()V
    procedure printerInit; cdecl; //()V
    procedure printerSelfChecking; cdecl; //()V
    function getPrinterSerialNo: JString; cdecl; //()Ljava/lang/String;
    function getPrinterVersion: JString; cdecl; //()Ljava/lang/String;
    function getPrinterModal: JString; cdecl; //()Ljava/lang/String;
    procedure lineWrap(lines: Integer); cdecl; //(I)V
    procedure sendRAWData(data: TJavaArray<Byte>); cdecl; //([B)V
    procedure setAlignment(alignment: Integer); cdecl; //(I)V
    procedure setFontName(typeface: JTypeface); cdecl; overload; //(Landroid/graphics/Typeface;)V
    procedure setFontName(typeface: JString); cdecl; overload; //(Ljava/lang/String;)V
    procedure setFontSize(fontsize: Single); cdecl; //(F)V
    procedure printText(text: JString); cdecl; //(Ljava/lang/String;)V
    procedure printTextWithFont(text: JString; typeface: JString; fontsize: Single); cdecl; //(Ljava/lang/String;Ljava/lang/String;F)V
    procedure printColumnsText(colsTextArr: TJavaObjectArray<JString>; colsWidthArr: TJavaArray<Integer>; colsAlign: TJavaArray<Integer>); cdecl; //([Ljava/lang/String;[I[I)V
    procedure printBitmap(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    procedure printBarCode(data: JString; format: JBarcodeFormat; width: Integer; height: Integer); cdecl; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)V
    procedure printQRCode(data: JString; size: Integer); cdecl; //(Ljava/lang/String;I)V
    procedure printDoubleQRCode(leftUrl: JString; rightUrl: JString; size: Integer); cdecl; //(Ljava/lang/String;Ljava/lang/String;I)V
    procedure printHorizontalLine(size: Integer; atype: Integer); cdecl; //(II)V
    procedure printTypeHorizontalLine(atype: Integer); cdecl; //(I)V
    procedure printOriginalText(text: JString); cdecl; //(Ljava/lang/String;)V
    procedure setPrintSpeed(speed: Integer); cdecl; //(I)V

    { Property }
  end;

  TJV1Printer = class(TJavaGenericImport<JV1PrinterClass, JV1Printer>) end;

  JBitmapCreator_CharWithPosClass = interface(JObjectClass)
  ['{68848FA0-5EA8-47A7-929A-B46D35E6F6F0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/ui/BitmapCreator$CharWithPos')]
  JBitmapCreator_CharWithPos = interface(JObject)
  ['{BA35B541-8AF6-4E30-8A59-083818C7D419}']
    { Property Methods }
    function _Getchar_: Char;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //C
    procedure _Setchar_(achar_: Char);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(C)V
    function _Getx: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _Setx(ax: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _Getpaint: JPaint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/graphics/Paint;
    procedure _Setpaint(apaint: JPaint);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/graphics/Paint;)V
    function _GetoffsetY: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetoffsetY(aoffsetY: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetreversePrintingMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetreversePrintingMode(areversePrintingMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _Getwidth: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _Setwidth(awidth: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _Getheight: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _Setheight(aheight: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetprintCharWidth: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetprintCharWidth(aprintCharWidth: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetprintCharHeight: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetprintCharHeight(aprintCharHeight: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _Getchar_bitmap: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/graphics/Bitmap;
    procedure _Setchar_bitmap(achar_bitmap: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/graphics/Bitmap;)V
    function _Getchar_canvas: JCanvas;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/graphics/Canvas;
    procedure _Setchar_canvas(achar_canvas: JCanvas);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/graphics/Canvas;)V
    function _GetcurrentTimes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetcurrentTimes(acurrentTimes: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetisBitmap: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetisBitmap(aisBitmap: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V

    { methods }

    { Property }
    property char_: Char read _Getchar_ write _Setchar_;
    property x: Single read _Getx write _Setx;
    property paint: JPaint read _Getpaint write _Setpaint;
    property offsetY: Single read _GetoffsetY write _SetoffsetY;
    property reversePrintingMode: Boolean read _GetreversePrintingMode write _SetreversePrintingMode;
    property width: Single read _Getwidth write _Setwidth;
    property height: Single read _Getheight write _Setheight;
    property printCharWidth: Single read _GetprintCharWidth write _SetprintCharWidth;
    property printCharHeight: Single read _GetprintCharHeight write _SetprintCharHeight;
    property char_bitmap: JBitmap read _Getchar_bitmap write _Setchar_bitmap;
    property char_canvas: JCanvas read _Getchar_canvas write _Setchar_canvas;
    property currentTimes: Integer read _GetcurrentTimes write _SetcurrentTimes;
    property isBitmap: Boolean read _GetisBitmap write _SetisBitmap;
  end;

  TJBitmapCreator_CharWithPos = class(TJavaGenericImport<JBitmapCreator_CharWithPosClass, JBitmapCreator_CharWithPos>) end;

  JBitmapCreatorClass = interface(JObjectClass)
  ['{72A3F30C-BEB4-4882-A656-93E566B0C92C}']
    { static Property Methods }

    { static Methods }
    {class} function init(canvasWidth: Integer; rawPrinter: JRawPrintInterface; context: JContext): JBitmapCreator; cdecl; //(ILcom/sunmi/ui/RawPrintInterface;Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/sunmi/ui/BitmapCreator')]
  JBitmapCreator = interface(JObject)
  ['{F711F1CA-B737-415F-A654-59FBC37B37AA}']
    { Property Methods }

    { methods }
    function setFontName(fontname: JString): Boolean; cdecl; overload; //(Ljava/lang/String;)Z
    function setFontName(typeface: JTypeface): Boolean; cdecl; overload; //(Landroid/graphics/Typeface;)Z
    function setFontSize(size: Single): Boolean; cdecl; //(F)Z
    function getFontSize: Single; cdecl; //()F
    procedure setPrinterDefault(callback: JICallback); cdecl; //(Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure sendRAWData(command: TJavaArray<Byte>; callback: JICallback); cdecl; //([BLwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printText(s: JString; callback: JICallback); cdecl; overload; //(Ljava/lang/String;Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printOriginalText(s: JString; callback: JICallback); cdecl; //(Ljava/lang/String;Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printText(s: JString; fontname: JString; size: Single; callback: JICallback); cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;FLwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure setTextMode(command: Byte); cdecl; //(B)V
    procedure setCodeSystem(command: Byte); cdecl; //(B)V
    procedure printBitmap(bitmap: JBitmap; callback: JICallback); cdecl; //(Landroid/graphics/Bitmap;Lwoyou/aidlservice/jiuiv5/ICallback;)V

    { Property }
  end;

  TJBitmapCreator = class(TJavaGenericImport<JBitmapCreatorClass, JBitmapCreator>) end;

  JEasyFontsClass = interface(JObjectClass)
  ['{FC8F2DE3-ED75-4FA1-9F8F-70BBB489075A}']
    { static Property Methods }

    { static Methods }
    {class} function getTypefaceByName(name: JString; context: JContext): JTypeface; cdecl; //(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/Typeface;

    { static Property }
  end;

  [JavaSignature('com/sunmi/ui/EasyFonts')]
  JEasyFonts = interface(JObject)
  ['{BD1E20F9-E6CA-4A80-BB1A-BD538FF0FA21}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEasyFonts = class(TJavaGenericImport<JEasyFontsClass, JEasyFonts>) end;

  JFontSourceProcessorClass = interface(JObjectClass)
  ['{31D8A3F4-B566-4582-B7F0-AEF83FA40C83}']
    { static Property Methods }

    { static Methods }
    {class} function process(resource: Integer; context: JContext): JTypeface; cdecl; overload; //(ILandroid/content/Context;)Landroid/graphics/Typeface;
    {class} function process(fontname: JString; context: JContext): JTypeface; cdecl; overload; //(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/Typeface;

    { static Property }
  end;

  [JavaSignature('com/sunmi/ui/FontSourceProcessor')]
  JFontSourceProcessor = interface(JObject)
  ['{3A62D7AC-950E-4715-A6F1-898360400B7F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFontSourceProcessor = class(TJavaGenericImport<JFontSourceProcessorClass, JFontSourceProcessor>) end;

  JPrinterSetClass = interface(JObjectClass)
  ['{79520386-08CB-4783-AC76-BE4AE0C21D5F}']
    { static Property Methods }
    {class} function _Getdefault_textSize: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    {class} function _Getdefault_lineHight: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F

    { static Methods }
    {class} function init(printWidth: Single; context: JContext; typeface: JTypeface): JPrinterSet; cdecl; //(FLandroid/content/Context;Landroid/graphics/Typeface;)V

    { static Property }
    {class} property default_textSize: Single read _Getdefault_textSize;
    {class} property default_lineHight: Single read _Getdefault_lineHight;
  end;

  [JavaSignature('com/sunmi/ui/PrinterSet')]
  JPrinterSet = interface(JObject)
  ['{4AB8D12E-C3AF-492E-A8E0-BA2B974923BC}']
    { Property Methods }
    function _GetxLeftPadding: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetxLeftPadding(axLeftPadding: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetprintWidth: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetprintWidth(aprintWidth: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetxWorldLeftPadding: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetxWorldLeftPadding(axWorldLeftPadding: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetxWorldRigthPadding: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetxWorldRigthPadding(axWorldRigthPadding: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetlineHight: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetlineHight(alineHight: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GettextPaint: JPaint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/graphics/Paint;
    procedure _SettextPaint(atextPaint: JPaint);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/graphics/Paint;)V
    function _GetbackgroundPaint: JPaint;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/graphics/Paint;
    procedure _SetbackgroundPaint(abackgroundPaint: JPaint);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/graphics/Paint;)V
    function _GettextHeight: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SettextHeight(atextHeight: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GettextFont: JTypeface;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/graphics/Typeface;
    procedure _SettextFont(atextFont: JTypeface);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/graphics/Typeface;)V
    function _GetjustificationMode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetjustificationMode(ajustificationMode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetisFakeBoldText: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetisFakeBoldText(aisFakeBoldText: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetisUnderlineText: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetisUnderlineText(aisUnderlineText: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _GetTextTimesHight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetTextTimesHight(aTextTimesHight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetTextTimesWidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetTextTimesWidth(aTextTimesWidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetreversePrintingMode: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetreversePrintingMode(areversePrintingMode: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V
    function _Getchar_bitmap: JBitmap;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/graphics/Bitmap;
    procedure _Setchar_bitmap(achar_bitmap: JBitmap);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/graphics/Bitmap;)V
    function _Getchar_canvas: JCanvas;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Landroid/graphics/Canvas;
    procedure _Setchar_canvas(achar_canvas: JCanvas);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Landroid/graphics/Canvas;)V
    function _GetcurrentTimes: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetcurrentTimes(acurrentTimes: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V
    function _GetprintCharWidth: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetprintCharWidth(aprintCharWidth: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetprintCharHeight: Single;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //F
    procedure _SetprintCharHeight(aprintCharHeight: Single);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(F)V
    function _GetcodeSystem: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SetcodeSystem(acodeSystem: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GetisTextTimes: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    procedure _SetisTextTimes(aisTextTimes: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Z)V

    { methods }
    procedure refresh; cdecl; //()V
    function setTypeface(fontname: JString): Boolean; cdecl; overload; //(Ljava/lang/String;)Z
    function setTypeface(typeface: JTypeface): Boolean; cdecl; overload; //(Landroid/graphics/Typeface;)Z
    function setTextSize(size: Single): Boolean; cdecl; //(F)Z
    function getTextSize: Single; cdecl; //()F

    { Property }
    property xLeftPadding: Single read _GetxLeftPadding write _SetxLeftPadding;
    property printWidth: Single read _GetprintWidth write _SetprintWidth;
    property xWorldLeftPadding: Single read _GetxWorldLeftPadding write _SetxWorldLeftPadding;
    property xWorldRigthPadding: Single read _GetxWorldRigthPadding write _SetxWorldRigthPadding;
    property lineHight: Single read _GetlineHight write _SetlineHight;
    property textPaint: JPaint read _GettextPaint write _SettextPaint;
    property backgroundPaint: JPaint read _GetbackgroundPaint write _SetbackgroundPaint;
    property textHeight: Single read _GettextHeight write _SettextHeight;
    property textFont: JTypeface read _GettextFont write _SettextFont;
    property justificationMode: Integer read _GetjustificationMode write _SetjustificationMode;
    property isFakeBoldText: Boolean read _GetisFakeBoldText write _SetisFakeBoldText;
    property isUnderlineText: Boolean read _GetisUnderlineText write _SetisUnderlineText;
    property TextTimesHight: Integer read _GetTextTimesHight write _SetTextTimesHight;
    property TextTimesWidth: Integer read _GetTextTimesWidth write _SetTextTimesWidth;
    property reversePrintingMode: Boolean read _GetreversePrintingMode write _SetreversePrintingMode;
    property char_bitmap: JBitmap read _Getchar_bitmap write _Setchar_bitmap;
    property char_canvas: JCanvas read _Getchar_canvas write _Setchar_canvas;
    property currentTimes: Integer read _GetcurrentTimes write _SetcurrentTimes;
    property printCharWidth: Single read _GetprintCharWidth write _SetprintCharWidth;
    property printCharHeight: Single read _GetprintCharHeight write _SetprintCharHeight;
    property codeSystem: JString read _GetcodeSystem write _SetcodeSystem;
    property isTextTimes: Boolean read _GetisTextTimes write _SetisTextTimes;
  end;

  TJPrinterSet = class(TJavaGenericImport<JPrinterSetClass, JPrinterSet>) end;

  JRawPrintInterfaceClass = interface(JObjectClass)
  ['{17E681E5-3B6D-4D57-A46F-B5F0D0994F0F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/sunmi/ui/RawPrintInterface')]
  JRawPrintInterface = interface(IJavaInstance)
  ['{D8322B38-8015-4486-9C98-D65B634BCF92}']
    { Property Methods }

    { methods }
    procedure printBytes(P1: TJavaArray<Byte>; P2: JICallback); cdecl; //([BLwoyou/aidlservice/jiuiv5/ICallback;)V

    { Property }
  end;

  TJRawPrintInterface = class(TJavaGenericImport<JRawPrintInterfaceClass, JRawPrintInterface>) end;

  JBytesUtilClass = interface(JObjectClass)
  ['{2C3AF2F6-56FA-419C-947F-C19A7E34150A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBytesUtil; cdecl; //()V
    {class} function getBytesFromFile(f: JFile): TJavaArray<Byte>; cdecl; //(Ljava/io/File;)[B
    {class} function initBlackBlock(w: Integer): TJavaArray<Byte>; cdecl; overload; //(I)[B
    {class} function initBlackBlock(h: Integer; w: Integer): TJavaArray<Byte>; cdecl; overload; //(II)[B
    {class} function initGrayBlock(h: Integer; w: Integer): TJavaArray<Byte>; cdecl; //(II)[B
    {class} function initTable(h: Integer; w: Integer): TJavaArray<Byte>; cdecl; //(II)[B
    {class} function getGbk(paramString: JString): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;)[B
    {class} function setWH(mode: Integer): TJavaArray<Byte>; cdecl; //(I)[B
    {class} function setZoom(level: Integer): TJavaArray<Byte>; cdecl; //(I)[B
    {class} function setAlignCenter(align: Integer): TJavaArray<Byte>; cdecl; //(I)[B
    {class} function setBold(dist: Boolean): TJavaArray<Byte>; cdecl; //(Z)[B
    {class} function setCusorPosition(position: Integer): TJavaArray<Byte>; cdecl; //(I)[B
    {class} function PrintBarcode(stBarcode: JString): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;)[B
    {class} function CutPaper: TJavaArray<Byte>; cdecl; //()[B
    {class} function selfCheck: TJavaArray<Byte>; cdecl; //()[B
    {class} function getPrinterStatus: TJavaArray<Byte>; cdecl; //()[B
    {class} function getHexStringFromBytes(data: TJavaArray<Byte>): JString; cdecl; //([B)Ljava/lang/String;
    {class} function getPrintQRCode(code: JString; modulesize: Integer; errorlevel: Integer): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;II)[B
    {class} function getPrintDoubleQRCode(code1: JString; code2: JString; modulesize: Integer; errorlevel: Integer): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;Ljava/lang/String;II)[B
    {class} function getColumnsText(colsText: TJavaObjectArray<JString>; colsWidth: TJavaArray<Integer>; colsAlign: TJavaArray<Integer>; charWidth: Integer; columnPadding: Integer): TJavaArray<Byte>; cdecl; //([Ljava/lang/String;[I[III)[B
    {class} function getPrintBarCode(data: JString; symbology: Integer; height: Integer; width: Integer; textposition: Integer): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;IIII)[B
    {class} function getBytesFromBitMatrix(bits: JBitMatrix): TJavaArray<Byte>; cdecl; //(Lcom/google/zxing/common/BitMatrix;)[B
    {class} function getZXingQRCode(data: JString; size: Integer): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;I)[B
    {class} function getZXingBarCode(data: JString; format: JBarcodeFormat; width: Integer; height: Integer): TJavaArray<Byte>; cdecl; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)[B
    {class} function getTypeHorizontalLine(w: Integer; atype: Integer): TJavaArray<Byte>; cdecl; //(II)[B
    {class} function getHorizontalLine(w: Integer; size: Integer; atype: Integer): TJavaArray<Byte>; cdecl; //(III)[B

    { static Property }
  end;

  [JavaSignature('com/sunmi/util/BytesUtil')]
  JBytesUtil = interface(JObject)
  ['{D1638C7F-06E8-41CB-A3EE-78931CFA0A40}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBytesUtil = class(TJavaGenericImport<JBytesUtilClass, JBytesUtil>) end;

  JLinkQueue_NodeClass = interface(JObjectClass)
  ['{800329F3-DEFC-4CD2-9617-3A003D883F53}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JLinkQueue): JLinkQueue_Node; cdecl; overload; //(Lcom/sunmi/util/LinkQueue;)V
    {class} function init(this: JLinkQueue; data: JObject; P3: JLinkQueue_Node): JLinkQueue_Node; cdecl; overload; //(Lcom/sunmi/util/LinkQueue;Ljava/lang/Object;Lcom/sunmi/util/LinkQueue$Node;)V

    { static Property }
  end;

  [JavaSignature('com/sunmi/util/LinkQueue$Node')]
  JLinkQueue_Node = interface(JObject)
  ['{A00B1F39-8E19-4905-AE8D-214427CB955F}']
    { Property Methods }
    function _Getdata: JObject;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/Object;
    procedure _Setdata(adata: JObject);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/Object;)V
    function _Getnext: JLinkQueue_Node;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/sunmi/util/LinkQueue$Node;
    procedure _Setnext(anext: JLinkQueue_Node);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/sunmi/util/LinkQueue$Node;)V

    { methods }

    { Property }
    property data: JObject read _Getdata write _Setdata;
    property next: JLinkQueue_Node read _Getnext write _Setnext;
  end;

  TJLinkQueue_Node = class(TJavaGenericImport<JLinkQueue_NodeClass, JLinkQueue_Node>) end;

  JLinkQueueClass = interface(JObjectClass)
  ['{D090BC69-5F74-4BF2-B891-4E4B8607AC99}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLinkQueue; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/sunmi/util/LinkQueue')]
  JLinkQueue = interface(JObject)
  ['{08CE5FDA-EB52-43F8-A059-018F5155B12B}']
    { Property Methods }

    { methods }
    procedure r_push_queue(data: JObject); cdecl; //(Ljava/lang/Object;)V
    procedure l_push_queue(data: JObject); cdecl; //(Ljava/lang/Object;)V
    function l_pop_queue: JObject; cdecl; //()Ljava/lang/Object;
    procedure clear; cdecl; //()V
    function size: Integer; cdecl; //()I
    function isEmpty: Boolean; cdecl; //()Z
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLinkQueue = class(TJavaGenericImport<JLinkQueueClass, JLinkQueue>) end;

  JPicFromPrintUtilsClass = interface(JObjectClass)
  ['{A2B5652D-1C1C-4930-B10A-1125ED9E8438}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPicFromPrintUtils; cdecl; //()V
    {class} function realDraw2PxPoint(bit: JBitmap): TJavaArray<Byte>; cdecl; overload; //(Landroid/graphics/Bitmap;)[B
    {class} function realDraw2PxPoint(bit: JBitmap; alignment: Integer): TJavaArray<Byte>; cdecl; overload; //(Landroid/graphics/Bitmap;I)[B
    {class} function realDraw2PxPoint(bytes: TJavaArray<Byte>; alignment: Integer): TJavaArray<Byte>; cdecl; overload; //([BI)[B
    {class} function px2Byte(x: Integer; y: Integer; bit: JBitmap): Byte; cdecl; //(IILandroid/graphics/Bitmap;)B
    {class} function compressPic(bitmapOrg: JBitmap; newWidth: Integer; newHeight: Integer): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function compressWPic(bitmapOrg: JBitmap; newWidth: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function compressHPic(bitmapOrg: JBitmap; newHeight: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function compressPic(bitmapOrg: JBitmap): JBitmap; cdecl; overload; //(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function compressBitmap(bitmapOrg: JBitmap; newWidth: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function rasterDataFromBitmap(bm: JBitmap): TJavaArray<Byte>; cdecl; overload; //(Landroid/graphics/Bitmap;)[B
    {class} function rasterDataFromBitmap_gh(bm: JBitmap): TJavaArray<Byte>; cdecl; //(Landroid/graphics/Bitmap;)[B
    {class} function rasterDataFromBitmap(bm: JBitmap; alignment: Integer): TJavaArray<Byte>; cdecl; overload; //(Landroid/graphics/Bitmap;I)[B
    {class} function bytes2Bitmap(bytes: TJavaArray<Byte>): JBitmap; cdecl; //([B)Landroid/graphics/Bitmap;
    {class} function rasterDataFromBitmap(bytes: TJavaArray<Byte>; alignment: Integer): TJavaArray<Byte>; cdecl; overload; //([BI)[B
    {class} function doubleBitmap(bitmap1: JBitmap; bitmap2: JBitmap): JBitmap; cdecl; //(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    {class} function getGrayBitmapFromData(width: Integer; height: Integer): JBitmap; cdecl; //(II)Landroid/graphics/Bitmap;
    {class} function getBlackBitmapFromData(width: Integer; height: Integer; n: Integer): JBitmap; cdecl; //(III)Landroid/graphics/Bitmap;
    {class} function getTableBitmapFromData(rows: Integer; cols: Integer; size: Integer): JBitmap; cdecl; //(III)Landroid/graphics/Bitmap;
    {class} function createQRImage(url: JString; size: Integer): JBitmap; cdecl; //(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    {class} function createBarcodeImage(data: JString; format: JBarcodeFormat; width: Integer; height: Integer): JBitmap; cdecl; //(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Landroid/graphics/Bitmap;
    {class} function getLineBitmapFromData(size: Integer; width: Integer): JBitmap; cdecl; //(II)Landroid/graphics/Bitmap;

    { static Property }
  end;

  [JavaSignature('com/sunmi/util/PicFromPrintUtils')]
  JPicFromPrintUtils = interface(JObject)
  ['{76BE9C4E-1C91-4D40-9606-1883F521C410}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPicFromPrintUtils = class(TJavaGenericImport<JPicFromPrintUtilsClass, JPicFromPrintUtils>) end;

  JSingleThreadPoolManagerClass = interface(JObjectClass)
  ['{8A1E803F-0005-4AB9-BE41-62B24D72F174}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JSingleThreadPoolManager; cdecl; //()Lcom/sunmi/util/SingleThreadPoolManager;

    { static Property }
  end;

  [JavaSignature('com/sunmi/util/SingleThreadPoolManager')]
  JSingleThreadPoolManager = interface(JObject)
  ['{DE0E46C9-D788-4DE4-A60E-871A0838485E}']
    { Property Methods }

    { methods }
    procedure push(task: JRunnable); cdecl; //(Ljava/lang/Runnable;)V
    procedure shutdown; cdecl; //()V

    { Property }
  end;

  TJSingleThreadPoolManager = class(TJavaGenericImport<JSingleThreadPoolManagerClass, JSingleThreadPoolManager>) end;

  JThreadPoolManagerClass = interface(JObjectClass)
  ['{09263454-1ADA-444F-9163-6D0EF5130C7B}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JThreadPoolManager; cdecl; //()Lcom/sunmi/util/ThreadPoolManager;

    { static Property }
  end;

  [JavaSignature('com/sunmi/util/ThreadPoolManager')]
  JThreadPoolManager = interface(JObject)
  ['{0745B0BC-DB26-40D5-BF63-4BE0DAB20D7D}']
    { Property Methods }

    { methods }
    procedure executeTask(runnable: JRunnable); cdecl; //(Ljava/lang/Runnable;)V

    { Property }
  end;

  TJThreadPoolManager = class(TJavaGenericImport<JThreadPoolManagerClass, JThreadPoolManager>) end;

  JICallback_Stub_ProxyClass = interface(JObjectClass)
  ['{A25A0DE1-B2E3-4D4D-B0EB-505E103CD71E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/ICallback$Stub$Proxy')]
  JICallback_Stub_Proxy = interface(JObject)
  ['{CD780028-593F-4DB7-931B-304E1DA29A3E}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    procedure onRunResult(isSuccess: Boolean); cdecl; //(Z)V
    procedure onReturnString(result: JString); cdecl; //(Ljava/lang/String;)V
    procedure onRaiseException(code: Integer; msg: JString); cdecl; //(ILjava/lang/String;)V

    { Property }
  end;

  TJICallback_Stub_Proxy = class(TJavaGenericImport<JICallback_Stub_ProxyClass, JICallback_Stub_Proxy>) end;

  JICallback_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{C063400F-F1A0-4ED1-9588-C82BCA83D03E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JICallback_Stub; cdecl; //()V
    {class} function asInterface(obj: JIBinder): JICallback; cdecl; //(Landroid/os/IBinder;)Lwoyou/aidlservice/jiuiv5/ICallback;

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/ICallback$Stub')]
  JICallback_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{89D26F40-491C-46A2-AE61-E9F28CFC6D8F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJICallback_Stub = class(TJavaGenericImport<JICallback_StubClass, JICallback_Stub>) end;

  JICallback_039Class = interface(JObjectClass)
  ['{E4BD0CFA-31E2-49F3-9AD0-EAA40D679AD9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/ICallback')]
  JICallback_039 = interface(IJavaInstance)
  ['{9E563F90-CDD5-463C-9596-A394FB0D8D18}']
    { Property Methods }

    { methods }
    procedure onRunResult(P1: Boolean); cdecl; //(Z)V
    procedure onReturnString(P1: JString); cdecl; //(Ljava/lang/String;)V
    procedure onRaiseException(P1: Integer; P2: JString); cdecl; //(ILjava/lang/String;)V

    { Property }
  end;

  TJICallback_039 = class(TJavaGenericImport<JICallback_039Class, JICallback_039>) end;

  JIWoyouService_Stub_ProxyClass = interface(JObjectClass)
  ['{9414E7C5-544F-4E56-9F4B-80579664393C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/IWoyouService$Stub$Proxy')]
  JIWoyouService_Stub_Proxy = interface(JObject)
  ['{75D624E4-EC72-4768-9B6C-E381606BA7A2}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    procedure updateFirmware(buffer: TJavaArray<Byte>; size: Int64; P3: JString; filename: JIYmodemSPI); cdecl; //([BJLjava/lang/String;Lwoyou/aidlservice/jiuiv5/IYmodemSPI;)V
    function getFirmwareStatus: Integer; cdecl; //()I
    function getServiceVersion: JString; cdecl; //()Ljava/lang/String;
    procedure printerInit(callback: JICallback); cdecl; //(Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printerSelfChecking(callback: JICallback); cdecl; //(Lwoyou/aidlservice/jiuiv5/ICallback;)V
    function getPrinterSerialNo: JString; cdecl; //()Ljava/lang/String;
    function getPrinterVersion: JString; cdecl; //()Ljava/lang/String;
    function getPrinterModal: JString; cdecl; //()Ljava/lang/String;
    procedure getPrintedLength(callback: JICallback); cdecl; //(Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure lineWrap(n: Integer; callback: JICallback); cdecl; //(ILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure sendRAWData(data: TJavaArray<Byte>; callback: JICallback); cdecl; //([BLwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure setAlignment(alignment: Integer; callback: JICallback); cdecl; //(ILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure setFontName(typeface: JString; callback: JICallback); cdecl; //(Ljava/lang/String;Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure setFontSize(fontsize: Single; callback: JICallback); cdecl; //(FLwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printText(text: JString; callback: JICallback); cdecl; //(Ljava/lang/String;Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printTextWithFont(text: JString; typeface: JString; fontsize: Single; callback: JICallback); cdecl; //(Ljava/lang/String;Ljava/lang/String;FLwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printColumnsText(colsTextArr: TJavaObjectArray<JString>; colsWidthArr: TJavaArray<Integer>; colsAlign: TJavaArray<Integer>; callback: JICallback); cdecl; //([Ljava/lang/String;[I[ILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printBitmap(bitmap: JBitmap; callback: JICallback); cdecl; //(Landroid/graphics/Bitmap;Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printBarCode(data: JString; symbology: Integer; height: Integer; width: Integer; textposition: Integer; callback: JICallback); cdecl; //(Ljava/lang/String;IIIILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printQRCode(data: JString; modulesize: Integer; errorlevel: Integer; callback: JICallback); cdecl; //(Ljava/lang/String;IILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printOriginalText(text: JString; callback: JICallback); cdecl; //(Ljava/lang/String;Lwoyou/aidlservice/jiuiv5/ICallback;)V

    { Property }
  end;

  TJIWoyouService_Stub_Proxy = class(TJavaGenericImport<JIWoyouService_Stub_ProxyClass, JIWoyouService_Stub_Proxy>) end;

  JIWoyouService_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{D83B1383-C3E1-4BDC-B6E7-295EBA625E48}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIWoyouService_Stub; cdecl; //()V
    {class} function asInterface(obj: JIBinder): JIWoyouService; cdecl; //(Landroid/os/IBinder;)Lwoyou/aidlservice/jiuiv5/IWoyouService;

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/IWoyouService$Stub')]
  JIWoyouService_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{40B3C6F7-578E-4141-BA22-42BA326341AD}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIWoyouService_Stub = class(TJavaGenericImport<JIWoyouService_StubClass, JIWoyouService_Stub>) end;

  JIWoyouServiceClass = interface(JObjectClass)
  ['{F3F9E4DC-F4BD-41BE-ACC7-4BBE45C34D40}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/IWoyouService')]
  JIWoyouService = interface(IJavaInstance)
  ['{D6B22DCA-A424-4092-A28E-A22831AA8C2A}']
    { Property Methods }

    { methods }
    procedure updateFirmware(P1: TJavaArray<Byte>; P2: Int64; P3: JString; P4: JIYmodemSPI); cdecl; //([BJLjava/lang/String;Lwoyou/aidlservice/jiuiv5/IYmodemSPI;)V
    function getFirmwareStatus: Integer; cdecl; //()I
    function getServiceVersion: JString; cdecl; //()Ljava/lang/String;
    procedure printerInit(P1: JICallback); cdecl; //(Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printerSelfChecking(P1: JICallback); cdecl; //(Lwoyou/aidlservice/jiuiv5/ICallback;)V
    function getPrinterSerialNo: JString; cdecl; //()Ljava/lang/String;
    function getPrinterVersion: JString; cdecl; //()Ljava/lang/String;
    function getPrinterModal: JString; cdecl; //()Ljava/lang/String;
    procedure getPrintedLength(P1: JICallback); cdecl; //(Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure lineWrap(P1: Integer; P2: JICallback); cdecl; //(ILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure sendRAWData(P1: TJavaArray<Byte>; P2: JICallback); cdecl; //([BLwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure setAlignment(P1: Integer; P2: JICallback); cdecl; //(ILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure setFontName(P1: JString; P2: JICallback); cdecl; //(Ljava/lang/String;Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure setFontSize(P1: Single; P2: JICallback); cdecl; //(FLwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printText(P1: JString; P2: JICallback); cdecl; //(Ljava/lang/String;Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printTextWithFont(P1: JString; P2: JString; P3: Single; P4: JICallback); cdecl; //(Ljava/lang/String;Ljava/lang/String;FLwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printColumnsText(P1: TJavaObjectArray<JString>; P2: TJavaArray<Integer>; P3: TJavaArray<Integer>; P4: JICallback); cdecl; //([Ljava/lang/String;[I[ILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printBitmap(P1: JBitmap; P2: JICallback); cdecl; //(Landroid/graphics/Bitmap;Lwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printBarCode(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: JICallback); cdecl; //(Ljava/lang/String;IIIILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printQRCode(P1: JString; P2: Integer; P3: Integer; P4: JICallback); cdecl; //(Ljava/lang/String;IILwoyou/aidlservice/jiuiv5/ICallback;)V
    procedure printOriginalText(P1: JString; P2: JICallback); cdecl; //(Ljava/lang/String;Lwoyou/aidlservice/jiuiv5/ICallback;)V

    { Property }
  end;

  TJIWoyouService = class(TJavaGenericImport<JIWoyouServiceClass, JIWoyouService>) end;

  JIYmodemSPI_Stub_ProxyClass = interface(JObjectClass)
  ['{04659692-CDA8-4029-AA16-73385BBA2FA9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/IYmodemSPI$Stub$Proxy')]
  JIYmodemSPI_Stub_Proxy = interface(JObject)
  ['{DCC0E5F8-7D2B-4E86-877D-4506E61334AF}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function getInterfaceDescriptor: JString; cdecl; //()Ljava/lang/String;
    procedure sendPercent(percent: Single); cdecl; //(F)V
    procedure sendFinish(count: Integer); cdecl; //(I)V
    procedure onFinishYmodemDownload(flag: Boolean; msg: JString); cdecl; //(ZLjava/lang/String;)V

    { Property }
  end;

  TJIYmodemSPI_Stub_Proxy = class(TJavaGenericImport<JIYmodemSPI_Stub_ProxyClass, JIYmodemSPI_Stub_Proxy>) end;

  JIYmodemSPI_StubClass = interface(JBinderClass) // or JObjectClass // SuperSignature: android/os/Binder
  ['{A7D28F39-23A5-4A85-9C84-78D03828FE0F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIYmodemSPI_Stub; cdecl; //()V
    {class} function asInterface(obj: JIBinder): JIYmodemSPI; cdecl; //(Landroid/os/IBinder;)Lwoyou/aidlservice/jiuiv5/IYmodemSPI;

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/IYmodemSPI$Stub')]
  JIYmodemSPI_Stub = interface(JBinder) // or JObject // SuperSignature: android/os/Binder
  ['{73157F41-29F3-4926-89B8-A4D5E2484C24}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl; //()Landroid/os/IBinder;
    function onTransact(code: Integer; data: JParcel; reply: JParcel; flags: Integer): Boolean; cdecl; //(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    { Property }
  end;

  TJIYmodemSPI_Stub = class(TJavaGenericImport<JIYmodemSPI_StubClass, JIYmodemSPI_Stub>) end;

  JIYmodemSPIClass = interface(JObjectClass)
  ['{4D325E3E-91DC-4383-9BAA-2CF378619239}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('woyou/aidlservice/jiuiv5/IYmodemSPI')]
  JIYmodemSPI = interface(IJavaInstance)
  ['{3545C87D-7EC1-4A69-9A71-1572971C116F}']
    { Property Methods }

    { methods }
    procedure sendPercent(P1: Single); cdecl; //(F)V
    procedure sendFinish(P1: Integer); cdecl; //(I)V
    procedure onFinishYmodemDownload(P1: Boolean; P2: JString); cdecl; //(ZLjava/lang/String;)V

    { Property }
  end;

  TJIYmodemSPI = class(TJavaGenericImport<JIYmodemSPIClass, JIYmodemSPI>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JICallback', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JICallback));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JIV1Printer', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JIV1Printer));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_1', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_1));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_10', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_10));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_11', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_11));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_12', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_12));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_13', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_13));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_14', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_14));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_15', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_15));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_16', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_16));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_17', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_17));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_18', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_18));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_19', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_19));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_2', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_2));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_20', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_20));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_21', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_21));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_22', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_22));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_3', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_3));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_4', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_4));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_5', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_5));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_6', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_6));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_7', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_7));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_8', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_8));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer_9', 
//    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer_9));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JV1Printer', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JV1Printer));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JBitmapCreator_CharWithPos', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JBitmapCreator_CharWithPos));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JBitmapCreator', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JBitmapCreator));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JEasyFonts', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JEasyFonts));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JFontSourceProcessor', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JFontSourceProcessor));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JPrinterSet', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JPrinterSet));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JRawPrintInterface', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JRawPrintInterface));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JBytesUtil', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JBytesUtil));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JLinkQueue_Node', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JLinkQueue_Node));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JLinkQueue', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JLinkQueue));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JPicFromPrintUtils', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JPicFromPrintUtils));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JSingleThreadPoolManager', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JSingleThreadPoolManager));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JThreadPoolManager', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JThreadPoolManager));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JICallback_Stub_Proxy', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JICallback_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JICallback_Stub', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JICallback_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JICallback_039', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JICallback_039));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JIWoyouService_Stub_Proxy', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JIWoyouService_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JIWoyouService_Stub', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JIWoyouService_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JIWoyouService', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JIWoyouService));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JIYmodemSPI_Stub_Proxy', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JIYmodemSPI_Stub_Proxy));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JIYmodemSPI_Stub', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JIYmodemSPI_Stub));
  TRegTypes.RegisterType('Androidapi.JNI.sunmiprinter.JIYmodemSPI', 
    TypeInfo(Androidapi.JNI.sunmiprinter.JIYmodemSPI));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
