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
//  生成时间：2022-01-19 16:31:24
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.lcprintsdk1_0_release_aar;

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
  ['{F1134E73-D377-47CD-AB78-FCF968610223}']
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
  ['{29FDA1A1-5E4B-4166-B26B-3BC1F2BC2DC8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JPrintConfig_AlignClass = interface(JObjectClass)
  ['{4FC91C1D-82B3-476E-AF56-61BFF40DBBED}']
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
  ['{E3BDA8A8-6837-45A6-9B1F-B708A7B2D777}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_Align = class(TJavaGenericImport<JPrintConfig_AlignClass, JPrintConfig_Align>) end;

  JPrintConfig_BarCodeTypeClass = interface(JObjectClass)
  ['{3AE77DF9-FBF5-4610-9FB1-0E8E19C9A658}']
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
  ['{3CE0FC33-A997-4A05-B0A8-AA94433D6BFE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_BarCodeType = class(TJavaGenericImport<JPrintConfig_BarCodeTypeClass, JPrintConfig_BarCodeType>) end;

  JPrintConfig_DensityClass = interface(JObjectClass)
  ['{7D33C9C0-C3D6-4902-9EA7-F4A13F0E5C46}']
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
  ['{02D31D2A-7297-4AD8-AF75-A4B4A7CB59DC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_Density = class(TJavaGenericImport<JPrintConfig_DensityClass, JPrintConfig_Density>) end;

  JPrintConfig_FontSizeClass = interface(JObjectClass)
  ['{01825007-DDA1-4E25-B1BD-7B22029AF687}']
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
  ['{683984E2-B030-4781-8ADE-80BD54D22230}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_FontSize = class(TJavaGenericImport<JPrintConfig_FontSizeClass, JPrintConfig_FontSize>) end;

  JPrintConfig_HRIPositionClass = interface(JObjectClass)
  ['{95138946-5510-4B2C-B3BB-FE3934C08F7E}']
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
  ['{C0BED865-4531-41B2-92EC-B586B8704E9C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_HRIPosition = class(TJavaGenericImport<JPrintConfig_HRIPositionClass, JPrintConfig_HRIPosition>) end;

  JPrintConfig_IErrorCodeClass = interface(JObjectClass)
  ['{40EE36E7-8F21-4527-968A-D2F3B2F9DC4A}']
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
    {class} function init(this0: JPrintConfig): JPrintConfig_IErrorCode; cdecl;

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
  ['{272094BE-32FB-461A-8D2B-B55DDB9C744D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_IErrorCode = class(TJavaGenericImport<JPrintConfig_IErrorCodeClass, JPrintConfig_IErrorCode>) end;

  JPrintConfig_StateTypeClass = interface(JObjectClass)
  ['{3E412BE4-4754-4BA2-A526-EE542ED7DA1F}']
    { static Property Methods }
    {class} function _GetCHECK_ALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_BMASK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_BUSY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_FEED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_PAPER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_PRINT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHECK_TEMP: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(this0: JPrintConfig): JPrintConfig_StateType; cdecl;

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
  ['{42DF25F5-C438-44D5-9CA6-0F6D3BC06E77}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig_StateType = class(TJavaGenericImport<JPrintConfig_StateTypeClass, JPrintConfig_StateType>) end;

  JPrintConfigClass = interface(JObjectClass)
  ['{BDEB83A5-E146-474F-ACCB-55A286DDD83E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JPrintConfig; cdecl;

    { static Property }
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintConfig')]
  JPrintConfig = interface(JObject)
  ['{1D44D664-72E5-4C15-9321-71C879453105}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPrintConfig = class(TJavaGenericImport<JPrintConfigClass, JPrintConfig>) end;

  JPrintUtil_PrinterBinderListenerClass = interface(JObjectClass)
  ['{F5E21B64-4E2A-4875-BA51-7248740F21C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintUtil$PrinterBinderListener')]
  JPrintUtil_PrinterBinderListener = interface(IJavaInstance)
  ['{C2A94F98-077F-4A83-B8CE-C930A2C10E9A}']
    { Property Methods }

    { methods }
    procedure onPrintCallback(P1: Integer); cdecl;
    procedure onVersion(P1: JString); cdecl;

    { Property }
  end;

  TJPrintUtil_PrinterBinderListener = class(TJavaGenericImport<JPrintUtil_PrinterBinderListenerClass, JPrintUtil_PrinterBinderListener>) end;

  JPrintUtilClass = interface(JObjectClass)
  ['{C083FEE8-6D4D-4DCA-8B1E-7C51440E9EFB}']
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
    {class} function getsupportprint: Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/example/lc_print_sdk/PrintUtil')]
  JPrintUtil = interface(JObject)
  ['{186ED120-971D-482E-8EC3-9A75A1CAE46F}']
    { Property Methods }

    { methods }
    procedure printGoToNextMark(distance: Integer); cdecl; overload;
    procedure printGoToNextMark; cdecl; overload;
    procedure setLineSpacing(spacing: Single); cdecl;
    function getLineSpacing: Single; cdecl;

    { Property }
  end;

  TJPrintUtil = class(TJavaGenericImport<JPrintUtilClass, JPrintUtil>) end;

  JSystemPropertiesClass = interface(JObjectClass)
  ['{C8E6D457-2855-4BDA-80B0-9838B0B9AC81}']
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
  ['{3417DF01-CD76-468C-9F83-CD8AFC4B0F2B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSystemProperties = class(TJavaGenericImport<JSystemPropertiesClass, JSystemProperties>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JBuildConfig',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_Align',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_Align));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_BarCodeType',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_BarCodeType));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_Density',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_Density));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_FontSize',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_FontSize));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_HRIPosition',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_HRIPosition));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_IErrorCode',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_IErrorCode));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_StateType',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig_StateType));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintConfig));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintUtil_PrinterBinderListener',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintUtil_PrinterBinderListener));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintUtil',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JPrintUtil));
  TRegTypes.RegisterType('Androidapi.JNI.lcprintsdk1_0_release_aar.JSystemProperties',
    TypeInfo(Androidapi.JNI.lcprintsdk1_0_release_aar.JSystemProperties));
end;


initialization
  RegisterTypes;

end.
