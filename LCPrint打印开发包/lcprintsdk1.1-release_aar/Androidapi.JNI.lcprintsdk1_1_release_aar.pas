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
//  生成时间：2024-04-24 16:00:54
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.lcprintsdk1_1_release_aar;

interface


uses
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
//  Androidapi.JNI.android.content.Context,
//  Androidapi.JNI.android.graphics.Bitmap,
  Androidapi.JNI.JavaTypes;



type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.example.lc_print_sdk.BuildConfig
  JPrintConfig_Align = interface; //com.example.lc_print_sdk.PrintConfig$Align
  JPrintConfig_BarCodeType = interface; //com.example.lc_print_sdk.PrintConfig$BarCodeType
  JPrintConfig_Density = interface; //com.example.lc_print_sdk.PrintConfig$Density
  JPrintConfig_FontSize = interface; //com.example.lc_print_sdk.PrintConfig$FontSize
  JPrintConfig_HRIPosition = interface; //com.example.lc_print_sdk.PrintConfig$HRIPosition
  JPrintConfig_IErrorCode = interface; //com.example.lc_print_sdk.PrintConfig$IErrorCode
  JPrintConfig_StateType = interface; //com.example.lc_print_sdk.PrintConfig$StateType
  JPrintConfig = interface; //com.example.lc_print_sdk.PrintConfig
  JPrintUtil_PrinterBinderListener = interface; //com.example.lc_print_sdk.PrintUtil$PrinterBinderListener
  JPrintUtil = interface; //com.example.lc_print_sdk.PrintUtil
  JSystemProperties = interface; //com.example.lc_print_sdk.SystemProperties

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{A5093824-EA29-4E39-B8BD-4A9A5E923A7F}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
  end;

  [JavaSignature('com/example/lc_print_sdk/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{50443941-5141-4219-A987-728FAF531D72}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JPrintConfig_AlignClass = interface(JObjectClass)
  ['{EA329B79-9BD8-4297-ABBC-566ACD082937}']
    { static Property Methods }
    {class} function _GetALIGN_CENTER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALIGN_LEFT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetALIGN_RIGHT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPrintConfig_Align; cdecl;

    { static Property }
    {class} property ALIGN_CENTER: Integer read _GetALIGN_CENTER;
    {class} property ALIGN_LEFT: Integer read _GetALIGN_LEFT;
    {class} property ALIGN_RIGHT: Integer read _GetALIGN_RIGHT;
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig$Align')]
  JPrintConfig_Align = interface(JObject)
  ['{1F2EDF87-A3A8-40C5-BAD4-F5EF0A128CE4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_Align = class(TJavaGenericImport<JPrintConfig_AlignClass, JPrintConfig_Align>) end;

  JPrintConfig_BarCodeTypeClass = interface(JObjectClass)
  ['{711A6000-2F87-4548-9C76-B278964FC952}']
    { static Property Methods }
    {class} function _GetTOP_TYPE_CODABAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_TYPE_CODE128: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_TYPE_CODE39: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_TYPE_CODE93: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_TYPE_EAN13: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_TYPE_EAN8: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_TYPE_ITF: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_TYPE_UPCA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_TYPE_UPCE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPrintConfig_BarCodeType; cdecl;

    { static Property }
    {class} property TOP_TYPE_CODABAR: Integer read _GetTOP_TYPE_CODABAR;
    {class} property TOP_TYPE_CODE128: Integer read _GetTOP_TYPE_CODE128;
    {class} property TOP_TYPE_CODE39: Integer read _GetTOP_TYPE_CODE39;
    {class} property TOP_TYPE_CODE93: Integer read _GetTOP_TYPE_CODE93;
    {class} property TOP_TYPE_EAN13: Integer read _GetTOP_TYPE_EAN13;
    {class} property TOP_TYPE_EAN8: Integer read _GetTOP_TYPE_EAN8;
    {class} property TOP_TYPE_ITF: Integer read _GetTOP_TYPE_ITF;
    {class} property TOP_TYPE_UPCA: Integer read _GetTOP_TYPE_UPCA;
    {class} property TOP_TYPE_UPCE: Integer read _GetTOP_TYPE_UPCE;
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig$BarCodeType')]
  JPrintConfig_BarCodeType = interface(JObject)
  ['{AE3C97FE-8C86-4747-BCD8-8D950B03D56F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_BarCodeType = class(TJavaGenericImport<JPrintConfig_BarCodeTypeClass, JPrintConfig_BarCodeType>) end;

  JPrintConfig_DensityClass = interface(JObjectClass)
  ['{44096D24-0B6D-4536-A70A-525A4638EA9F}']
    { static Property Methods }
    {class} function _GetTOP_GRAY_LARGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_MIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_SMALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_SUPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_XLARGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_XMIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_XSMALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_XSUPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_XXLARGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_GRAY_XXSUPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPrintConfig_Density; cdecl;

    { static Property }
    {class} property TOP_GRAY_LARGE: Integer read _GetTOP_GRAY_LARGE;
    {class} property TOP_GRAY_MIDDLE: Integer read _GetTOP_GRAY_MIDDLE;
    {class} property TOP_GRAY_SMALL: Integer read _GetTOP_GRAY_SMALL;
    {class} property TOP_GRAY_SUPER: Integer read _GetTOP_GRAY_SUPER;
    {class} property TOP_GRAY_XLARGE: Integer read _GetTOP_GRAY_XLARGE;
    {class} property TOP_GRAY_XMIDDLE: Integer read _GetTOP_GRAY_XMIDDLE;
    {class} property TOP_GRAY_XSMALL: Integer read _GetTOP_GRAY_XSMALL;
    {class} property TOP_GRAY_XSUPER: Integer read _GetTOP_GRAY_XSUPER;
    {class} property TOP_GRAY_XXLARGE: Integer read _GetTOP_GRAY_XXLARGE;
    {class} property TOP_GRAY_XXSUPER: Integer read _GetTOP_GRAY_XXSUPER;
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig$Density')]
  JPrintConfig_Density = interface(JObject)
  ['{0A74D9AC-3595-48C0-AC54-AF43F7A49111}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_Density = class(TJavaGenericImport<JPrintConfig_DensityClass, JPrintConfig_Density>) end;

  JPrintConfig_FontSizeClass = interface(JObjectClass)
  ['{CE3DD687-D914-4C27-9958-5619934B2C0C}']
    { static Property Methods }
    {class} function _GetTOP_FONT_SIZE_LARGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_FONT_SIZE_MIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_FONT_SIZE_SMALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_FONT_SIZE_SUPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_FONT_SIZE_XLARGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_FONT_SIZE_XMIDDLE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_FONT_SIZE_XSMALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTOP_FONT_SIZE_XSUPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPrintConfig_FontSize; cdecl;

    { static Property }
    {class} property TOP_FONT_SIZE_LARGE: Integer read _GetTOP_FONT_SIZE_LARGE;
    {class} property TOP_FONT_SIZE_MIDDLE: Integer read _GetTOP_FONT_SIZE_MIDDLE;
    {class} property TOP_FONT_SIZE_SMALL: Integer read _GetTOP_FONT_SIZE_SMALL;
    {class} property TOP_FONT_SIZE_SUPER: Integer read _GetTOP_FONT_SIZE_SUPER;
    {class} property TOP_FONT_SIZE_XLARGE: Integer read _GetTOP_FONT_SIZE_XLARGE;
    {class} property TOP_FONT_SIZE_XMIDDLE: Integer read _GetTOP_FONT_SIZE_XMIDDLE;
    {class} property TOP_FONT_SIZE_XSMALL: Integer read _GetTOP_FONT_SIZE_XSMALL;
    {class} property TOP_FONT_SIZE_XSUPER: Integer read _GetTOP_FONT_SIZE_XSUPER;
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig$FontSize')]
  JPrintConfig_FontSize = interface(JObject)
  ['{18059F6B-2159-48D8-8F6F-8E4B0A99EDE3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_FontSize = class(TJavaGenericImport<JPrintConfig_FontSizeClass, JPrintConfig_FontSize>) end;

  JPrintConfig_HRIPositionClass = interface(JObjectClass)
  ['{DE141EF2-BEF2-4CE1-B1D9-2B5DF7D6D10E}']
    { static Property Methods }
    {class} function _GetPOSITION_ABOVE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOSITION_BELOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOSITION_BOTH: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPOSITION_NONE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JPrintConfig_HRIPosition; cdecl;

    { static Property }
    {class} property POSITION_ABOVE: Integer read _GetPOSITION_ABOVE;
    {class} property POSITION_BELOW: Integer read _GetPOSITION_BELOW;
    {class} property POSITION_BOTH: Integer read _GetPOSITION_BOTH;
    {class} property POSITION_NONE: Integer read _GetPOSITION_NONE;
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig$HRIPosition')]
  JPrintConfig_HRIPosition = interface(JObject)
  ['{CCC2A243-7870-438B-86CD-568468084800}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_HRIPosition = class(TJavaGenericImport<JPrintConfig_HRIPositionClass, JPrintConfig_HRIPosition>) end;

  JPrintConfig_IErrorCodeClass = interface(JObjectClass)
  ['{7CD47893-E5E3-4CDB-AFA6-DC7236474D52}']
    { static Property Methods }
    {class} function _GetERROR_CMD: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DATA_INPUT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DATA_INVALID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DEV_BMARK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DEV_FEED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DEV_IS_BUSY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DEV_NOT_OPEN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DEV_NO_BATTERY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_DEV_PRINT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_GRAY_INVALID: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_NO_DATA: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_NO_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_BARCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_BITMAP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_BITMAP_WIDTH_OVERFLOW: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_DATA_MAC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_HOT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_ILLEGAL_ARGUMENT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_NOPAPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_QRCODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_TEXT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_PRINT_UNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_RESULT_EXIST: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetERROR_TIME_OUT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
//    {class} function init(this$0: JPrintConfig): JPrintConfig_IErrorCode; cdecl;

    { static Property }
    {class} property ERROR_CMD: Integer read _GetERROR_CMD;
    {class} property ERROR_DATA_INPUT: Integer read _GetERROR_DATA_INPUT;
    {class} property ERROR_DATA_INVALID: Integer read _GetERROR_DATA_INVALID;
    {class} property ERROR_DEV_BMARK: Integer read _GetERROR_DEV_BMARK;
    {class} property ERROR_DEV_FEED: Integer read _GetERROR_DEV_FEED;
    {class} property ERROR_DEV_IS_BUSY: Integer read _GetERROR_DEV_IS_BUSY;
    {class} property ERROR_DEV_NOT_OPEN: Integer read _GetERROR_DEV_NOT_OPEN;
    {class} property ERROR_DEV_NO_BATTERY: Integer read _GetERROR_DEV_NO_BATTERY;
    {class} property ERROR_DEV_PRINT: Integer read _GetERROR_DEV_PRINT;
    {class} property ERROR_GRAY_INVALID: Integer read _GetERROR_GRAY_INVALID;
    {class} property ERROR_NO_DATA: Integer read _GetERROR_NO_DATA;
    {class} property ERROR_NO_ERROR: Integer read _GetERROR_NO_ERROR;
    {class} property ERROR_PRINT_BARCODE: Integer read _GetERROR_PRINT_BARCODE;
    {class} property ERROR_PRINT_BITMAP: Integer read _GetERROR_PRINT_BITMAP;
    {class} property ERROR_PRINT_BITMAP_WIDTH_OVERFLOW: Integer read _GetERROR_PRINT_BITMAP_WIDTH_OVERFLOW;
    {class} property ERROR_PRINT_DATA_MAC: Integer read _GetERROR_PRINT_DATA_MAC;
    {class} property ERROR_PRINT_HOT: Integer read _GetERROR_PRINT_HOT;
    {class} property ERROR_PRINT_ILLEGAL_ARGUMENT: Integer read _GetERROR_PRINT_ILLEGAL_ARGUMENT;
    {class} property ERROR_PRINT_NOPAPER: Integer read _GetERROR_PRINT_NOPAPER;
    {class} property ERROR_PRINT_QRCODE: Integer read _GetERROR_PRINT_QRCODE;
    {class} property ERROR_PRINT_TEXT: Integer read _GetERROR_PRINT_TEXT;
    {class} property ERROR_PRINT_UNKNOWN: Integer read _GetERROR_PRINT_UNKNOWN;
    {class} property ERROR_RESULT_EXIST: Integer read _GetERROR_RESULT_EXIST;
    {class} property ERROR_TIME_OUT: Integer read _GetERROR_TIME_OUT;
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig$IErrorCode')]
  JPrintConfig_IErrorCode = interface(JObject)
  ['{F1905426-1E32-46CB-B355-4CBBB6DABD7F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_IErrorCode = class(TJavaGenericImport<JPrintConfig_IErrorCodeClass, JPrintConfig_IErrorCode>) end;

  JPrintConfig_StateTypeClass = interface(JObjectClass)
  ['{BD8F04B6-55AE-4A5D-AA01-4E9E80787ADD}']
    { static Property Methods }
    {class} function _GetCHECK_ALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_BMASK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_BUSY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_FEED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_PAPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_PRINT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_TEMP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
//    {class} function init(this$0: JPrintConfig): JPrintConfig_StateType; cdecl;

    { static Property }
    {class} property CHECK_ALL: Integer read _GetCHECK_ALL;
    {class} property CHECK_BMASK: Integer read _GetCHECK_BMASK;
    {class} property CHECK_BUSY: Integer read _GetCHECK_BUSY;
    {class} property CHECK_FEED: Integer read _GetCHECK_FEED;
    {class} property CHECK_PAPER: Integer read _GetCHECK_PAPER;
    {class} property CHECK_PRINT: Integer read _GetCHECK_PRINT;
    {class} property CHECK_TEMP: Integer read _GetCHECK_TEMP;
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig$StateType')]
  JPrintConfig_StateType = interface(JObject)
  ['{4C9F7E75-7F25-4241-8B39-222D6F19925B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_StateType = class(TJavaGenericImport<JPrintConfig_StateTypeClass, JPrintConfig_StateType>) end;

  JPrintConfigClass = interface(JObjectClass)
  ['{8A100BA7-4ED4-4ECE-AF5B-AF5067800434}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrintConfig; cdecl;

    { static Property }
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig')]
  JPrintConfig = interface(JObject)
  ['{E72DCEF5-FAED-4A68-8811-9B717C522B80}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig = class(TJavaGenericImport<JPrintConfigClass, JPrintConfig>) end;

  JPrintUtil_PrinterBinderListenerClass = interface(JObjectClass)
  ['{7E3A42AB-3CAE-414C-A413-0998B8B774BB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintUtil$PrinterBinderListener')]
  JPrintUtil_PrinterBinderListener = interface(IJavaInstance)
  ['{DD68A7B8-9CEB-4914-B883-B9B3046D94B6}']
    { Property Methods }

    { methods }
    procedure onPrintCallback(P1: Integer); cdecl;
    procedure onVersion(P1: JString); cdecl;

    { Property }
  end;

  TJPrintUtil_PrinterBinderListener = class(TJavaGenericImport<JPrintUtil_PrinterBinderListenerClass, JPrintUtil_PrinterBinderListener>) end;

  JPrintUtilClass = interface(JObjectClass)
  ['{D032AF11-FA3C-4FD1-98AC-753C85C18C7E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrintUtil; cdecl;
    {class} function getInstance(context: JContext): JPrintUtil; cdecl;
    {class} procedure setPrintEventListener(aListener: JPrintUtil_PrinterBinderListener); cdecl;
    {class} procedure removePrintListener(aListener: JPrintUtil_PrinterBinderListener); cdecl;
    {class} function getVersion: JString; cdecl;
    {class} procedure open; cdecl;
    {class} procedure close; cdecl;
    {class} procedure printConcentration(density: Integer); cdecl;
    {class} function getConcentration: Integer; cdecl;
    {class} procedure resetPrint; cdecl;
    {class} procedure printFontSize(fontSize: Integer); cdecl;
    {class} function getFontSize: Integer; cdecl;
    {class} procedure printTextBold(fontBold: Boolean); cdecl;
    {class} function isFontBold: Boolean; cdecl;
    {class} procedure printEnableMark(enable: Boolean); cdecl;
    {class} function isBlackLabel: Boolean; cdecl;
    {class} procedure setUnderLine(enable: Boolean); cdecl;
    {class} function isUnderLine: Boolean; cdecl;
    {class} procedure setFeedPaperSpace(space: Integer); cdecl;
    {class} function getFeedPaperSpace: Integer; cdecl;
    {class} procedure setUnwindPaperLen(length: Integer); cdecl;
    {class} function getUnwindPaperLen: Integer; cdecl;
    {class} procedure printText(offset: Integer; fontSize: Integer; isBold: Boolean; isUnderLine: Boolean; content: JString); cdecl; overload;
    {class} procedure printText(content: JString); cdecl; overload;
    {class} procedure printBarcode(offset: Integer; height: Integer; content: JString; barcodeType: Integer; hriPosition: Integer); cdecl; overload;
    {class} procedure printBarcode(height: Integer; content: JString; barcodeType: Integer); cdecl; overload;
    {class} procedure printQR(offset: Integer; height: Integer; content: JString); cdecl; overload;
    {class} procedure printQR(content: JString); cdecl; overload;
    {class} procedure printBitmap(offset: Integer; image: JBitmap); cdecl; overload;
    {class} procedure printBitmap(image: JBitmap); cdecl; overload;
    {class} procedure printBitmap(offset: Integer; imagePath: JString); cdecl; overload;
    {class} procedure printBitmap(imagePath: JString); cdecl; overload;
    {class} procedure printLine(lines: Integer); cdecl;
    {class} procedure start; cdecl;
    {class} procedure setReverse(reverse: Boolean); cdecl;
    {class} function isReverse: Boolean; cdecl;
    {class} function getSupportPrint: Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintUtil')]
  JPrintUtil = interface(JObject)
  ['{50306A53-0E47-4687-BD3E-E647BAE593EB}']
    { Property Methods }

    { methods }
    procedure printGoToNextMark(distance: Integer); cdecl; overload;
    procedure printGoToNextMark; cdecl; overload;
    procedure setPrintLineSpacing(spacing: Single); cdecl;
    function getPrintLineSpacing: Single; cdecl;

    { Property }
  end;

  TJPrintUtil = class(TJavaGenericImport<JPrintUtilClass, JPrintUtil>) end;

  JSystemPropertiesClass = interface(JObjectClass)
  ['{5D5A13B0-5FFE-47AB-8575-4ECA7D850031}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSystemProperties; cdecl;
    {class} function get(key: JString): JString; cdecl;
    {class} function getInt(key: JString; def: Integer): Integer; cdecl;
    {class} procedure &set(key: JString; value: JString); cdecl;
    {class} procedure addChangeCallback(callback: JRunnable); cdecl;
    {class} function getSdkVersion: Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/example/lc_print_sdk/SystemProperties')]
  JSystemProperties = interface(JObject)
  ['{67BECBAE-FBA9-4B74-BA48-E423C42C3A3D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSystemProperties = class(TJavaGenericImport<JSystemPropertiesClass, JSystemProperties>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JBuildConfig', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_Align', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_Align));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_BarCodeType', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_BarCodeType));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_Density', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_Density));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_FontSize', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_FontSize));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_HRIPosition', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_HRIPosition));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_IErrorCode', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_IErrorCode));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_StateType', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig_StateType));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintConfig));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintUtil_PrinterBinderListener', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintUtil_PrinterBinderListener));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintUtil', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JPrintUtil));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_1_release_aar.JSystemProperties', 
    TypeInfo(Androidapi.JNI.lcprintsdk1_1_release_aar.JSystemProperties));
end;


initialization
  RegisterTypes;

end.
