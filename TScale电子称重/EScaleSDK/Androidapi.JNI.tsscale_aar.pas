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
//  生成时间：2020-10-27 16:28:04
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.tsscale_aar;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.libserial_release_aar,
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.tscale.tsscale.BuildConfig
  JCommonStatus = interface; //com.tscale.tsscale.CommonStatus
  JFileService = interface; //com.tscale.tsscale.FileService
  JJNIScale = interface; //com.tscale.tsscale.JNIScale
  JScale = interface; //com.tscale.tsscale.Scale
  JScaleSettings = interface; //com.tscale.tsscale.ScaleSettings
  JTADCallback = interface; //com.tscale.tsscale.TADCallback
  JTADMessage = interface; //com.tscale.tsscale.TADMessage
  JTADReadThread = interface; //com.tscale.tsscale.TADReadThread
  JTADScale = interface; //com.tscale.tsscale.TADScale
//  JTADWeight_1 = interface; //com.tscale.tsscale.TADWeight$1
  JTADWeight = interface; //com.tscale.tsscale.TADWeight
  JTADWriteThread = interface; //com.tscale.tsscale.TADWriteThread

// ===== Forward SuperClasses declarations =====

  JScaleClass = interface; //com.tscale.tsscale.Scale

// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{1F37AF33-710B-4F68-831E-DACCCF1CDFD2}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JBuildConfig; cdecl; //()V

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/tscale/tsscale/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{1DE0EE95-EE9B-47D6-A47B-6A9C0DC4C289}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JCommonStatusClass = interface(JObjectClass)
  ['{75775D27-8CCD-410D-B5B6-78B436BABC87}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/CommonStatus')]
  JCommonStatus = interface(JObject)
  ['{96876016-DABB-4855-9839-439F42FAB28B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommonStatus = class(TJavaGenericImport<JCommonStatusClass, JCommonStatus>) end;

  JFileServiceClass = interface(JObjectClass)
  ['{7D8AFECF-4DB0-4612-AA41-4E9B1F74D997}']
    { static Property Methods }

    { static Methods }
    {class} function read(filename: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} procedure write(filename: JString; text: JString); cdecl; //(Ljava/lang/String;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/FileService')]
  JFileService = interface(JObject)
  ['{CFFC9EEF-26B0-49C6-B2BC-C9E9519689EB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileService = class(TJavaGenericImport<JFileServiceClass, JFileService>) end;


  JScaleClass = interface(JObjectClass)
  ['{CC452AA0-AC07-498A-89E8-0EEA40EB8E41}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScale; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/Scale')]
  JScale = interface(JObject)
  ['{CED8763F-F704-4B0A-BC10-16FDC55CB256}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScale = class(TJavaGenericImport<JScaleClass, JScale>) end;


  JJNIScaleClass = interface(JScaleClass) // or JObjectClass // SuperSignature: com/tscale/tsscale/Scale
  ['{3A430EBC-F914-4384-879A-73EFB5659FB0}']
    { static Property Methods }

    { static Methods }
    {class} function getScale: JJNIScale; cdecl; overload; //()Lcom/tscale/tsscale/JNIScale;
    {class} function getScale(port: JString): JJNIScale; cdecl; overload; //(Ljava/lang/String;)Lcom/tscale/tsscale/JNIScale;
    {class} function getScale(port: JString; baudrate: Integer): JJNIScale; cdecl; overload; //(Ljava/lang/String;I)Lcom/tscale/tsscale/JNIScale;
    {class} function getLibraryLibraryVersion: JString; cdecl; //()Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/JNIScale')]
  JJNIScale = interface(JScale) // or JObject // SuperSignature: com/tscale/tsscale/Scale
  ['{C0D18D51-662E-4CFA-A35B-1AF47E51E7D3}']
    { Property Methods }

    { methods }
    procedure deleteScale; cdecl; //()V
    function readWeightContinuous(atype: Integer): JBoolean; cdecl; //(I)Ljava/lang/Boolean;
    function getStringNet: JString; cdecl; //()Ljava/lang/String;
    function tare: Boolean; cdecl; //()Z
    function tareWithStringResult: JString; cdecl; //()Ljava/lang/String;
    function zero: Boolean; cdecl; //()Z
    function setScaleMode(mode: Integer): Boolean; cdecl; //(I)Z
    function setFdnPtr(div1: Integer): Boolean; cdecl; //(I)Z
    function setBigFdnPtr(div2: Integer): Boolean; cdecl; //(I)Z
    function setMainUnitDeci(number: Integer): Boolean; cdecl; //(I)Z
    function setZeroTrackPtr(number: Integer): Boolean; cdecl; //(I)Z
    function setManualZeroRangePtr(number: Integer): Boolean; cdecl; //(I)Z
    function setAutoZeroRangePtr(number: Integer): Boolean; cdecl; //(I)Z
    function setZeroPoint: Boolean; cdecl; //()Z
    function setCalibration(weight: Single): Boolean; cdecl; //(F)Z
    function setMaxRange(weight: Integer): Boolean; cdecl; //(I)Z
    function setFirstRange(weight: Integer): Boolean; cdecl; //(I)Z
    function getStabFlag: Boolean; cdecl; //()Z
    function getTareFlag: Boolean; cdecl; //()Z
    function getZeroFlag: Boolean; cdecl; //()Z
    function getScaleVersion: JString; cdecl; //()Ljava/lang/String;
    function getInternalCount: Integer; cdecl; //()I
    function getStringTare: JString; cdecl; //()Ljava/lang/String;
    function voltage: JString; cdecl; //()Ljava/lang/String;
    procedure crcOpen; cdecl; //()V
    procedure crcClose; cdecl; //()V
    function clearTare: Boolean; cdecl; //()Z
    function getFloatNet: Single; cdecl; //()F
    function getFloatTare: Single; cdecl; //()F
    function getFloatGross: Single; cdecl; //()F
    function setGravityAcceleration(gravity: Double): Boolean; cdecl; //(D)Z
    function pretare(value: Double): JString; cdecl; //(D)Ljava/lang/String;
    function getStringUnit: JString; cdecl; //()Ljava/lang/String;
    function receiveWeightDataFrom(platform: Integer): Boolean; cdecl; //(I)Z
    function readParameters: JScaleSettings; cdecl; //()Lcom/tscale/tsscale/ScaleSettings;
    function setCallback(cb: JTADCallback): Boolean; cdecl; //(Lcom/tscale/tsscale/TADCallback;)Z
    procedure setQuickStableCount(count: Integer); cdecl; //(I)V

    { Property }
  end;

  TJJNIScale = class(TJavaGenericImport<JJNIScaleClass, JJNIScale>) end;


  JScaleSettingsClass = interface(JObjectClass)
  ['{17895C2E-C5FE-4BF8-A2E4-BC4817F593D8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScaleSettings; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/ScaleSettings')]
  JScaleSettings = interface(JObject)
  ['{3AA36483-32D1-468A-B176-5297520E84F5}']
    { Property Methods }

    { methods }
    function getMode: Integer; cdecl; //()I
    procedure setMode(mode: Integer); cdecl; //(I)V
    function getMax1: JString; cdecl; //()Ljava/lang/String;
    procedure setMax1(max1: JString); cdecl; //(Ljava/lang/String;)V
    function getMax2: JString; cdecl; //()Ljava/lang/String;
    procedure setMax2(max2: JString); cdecl; //(Ljava/lang/String;)V
    function getDiv1: Integer; cdecl; //()I
    procedure setDiv1(div1: Integer); cdecl; //(I)V
    function getDiv2: Integer; cdecl; //()I
    procedure setDiv2(div2: Integer); cdecl; //(I)V
    function getDecimal: Integer; cdecl; //()I
    procedure setDecimal(decimal: Integer); cdecl; //(I)V
    function getInitZero: Integer; cdecl; //()I
    procedure setInitZero(initZero: Integer); cdecl; //(I)V
    function getSemiAutoZero: Integer; cdecl; //()I
    procedure setSemiAutoZero(semiAutoZero: Integer); cdecl; //(I)V
    function getZeroTracking: Integer; cdecl; //()I
    procedure setZeroTracking(zeroTracking: Integer); cdecl; //(I)V

    { Property }
  end;

  TJScaleSettings = class(TJavaGenericImport<JScaleSettingsClass, JScaleSettings>) end;

  JTADCallbackClass = interface(JObjectClass)
  ['{645470B6-BF16-4DD6-A0AF-6509716827B3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/TADCallback')]
  JTADCallback = interface(IJavaInstance)
  ['{9E565059-9ECB-4303-8B67-11DFD025E1D9}']
    { Property Methods }

    { methods }
    procedure onQuickStable; cdecl; //()V
    procedure onWeightUpdate(P1: JTADWeight; P2: Boolean; P3: Boolean; P4: Boolean); cdecl; //(Lcom/tscale/tsscale/TADWeight;ZZZ)V
    procedure onCalibrationSwitchEvent; cdecl; //()V
    procedure onVoltageUpdate(P1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJTADCallback = class(TJavaGenericImport<JTADCallbackClass, JTADCallback>) end;

  JTADMessageClass = interface(JObjectClass)
  ['{5692C324-7D43-4E09-A698-C3C5C2CDCE53}']
    { static Property Methods }
    {class} function _GetCHECK_VERSION_NONE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetREAD_WEIGHT_CONTINUOUS: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetREAD_WEIGHT_STABLE_ONLY: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetREAD_WEIGHT_IMMEDIATELY: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetREAD_WEIGHT_STOP: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetZERO_STABLE_ONLY: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetZERO_IMMEDIATELY: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetTARE_STABLE_ONLY: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetTARE_CLEAR: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetTARE_IMMEDIATELY: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetTARE_READ: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetREAD_PARAMS: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetSCALE_SWITCH_MAIN_ONLY: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetSCALE_SWITCH_REMOTE_ONLY: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetSCALE_SWITCH_DUAL: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetCALIBRATION_EVENT: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetRANGE_MODE_SINGLE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetRANGE_MODE_DUAL_INTERVAL: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetRANGE_MODE_DUAL_RANGE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDECIMAL_0: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDECIMAL_1: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDECIMAL_2: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDECIMAL_3: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDECIMAL_4: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_2_1: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_2_2: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_2_5: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_2_10: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_2_20: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_1_1: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_1_2: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_1_5: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_1_10: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetDIVISION_1_20: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetZERO_TRACKING_OFF: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetZERO_TRACKING_0_5D: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetZERO_TRACKING_1D: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetZERO_TRACKING_2D: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetZERO_TRACKING_4D: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetAUTO_ZERO_0P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetAUTO_ZERO_2P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetAUTO_ZERO_4P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetAUTO_ZERO_10P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetAUTO_ZERO_20P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetAUTO_ZERO_50P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetAUTO_ZERO_100P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetMANUAL_ZERO_0P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetMANUAL_ZERO_2P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetMANUAL_ZERO_4P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetMANUAL_ZERO_10P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetMANUAL_ZERO_20P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetMANUAL_ZERO_50P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetMANUAL_ZERO_100P: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetVOLTAGE_STOP: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetVOLTAGE_START: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetVOLTAGE_READ: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetCRC_CLOSE: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetCRC_OPEN: Word;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //S
    {class} function _GetcrcFlag: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetcrcCloseFlag: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z

    { static Methods }

    { static Property }
    {class} property CHECK_VERSION_NONE: Word read _GetCHECK_VERSION_NONE;
    {class} property READ_WEIGHT_CONTINUOUS: Word read _GetREAD_WEIGHT_CONTINUOUS;
    {class} property READ_WEIGHT_STABLE_ONLY: Word read _GetREAD_WEIGHT_STABLE_ONLY;
    {class} property READ_WEIGHT_IMMEDIATELY: Word read _GetREAD_WEIGHT_IMMEDIATELY;
    {class} property READ_WEIGHT_STOP: Word read _GetREAD_WEIGHT_STOP;
    {class} property ZERO_STABLE_ONLY: Word read _GetZERO_STABLE_ONLY;
    {class} property ZERO_IMMEDIATELY: Word read _GetZERO_IMMEDIATELY;
    {class} property TARE_STABLE_ONLY: Word read _GetTARE_STABLE_ONLY;
    {class} property TARE_CLEAR: Word read _GetTARE_CLEAR;
    {class} property TARE_IMMEDIATELY: Word read _GetTARE_IMMEDIATELY;
    {class} property TARE_READ: Word read _GetTARE_READ;
    {class} property READ_PARAMS: Word read _GetREAD_PARAMS;
    {class} property SCALE_SWITCH_MAIN_ONLY: Word read _GetSCALE_SWITCH_MAIN_ONLY;
    {class} property SCALE_SWITCH_REMOTE_ONLY: Word read _GetSCALE_SWITCH_REMOTE_ONLY;
    {class} property SCALE_SWITCH_DUAL: Word read _GetSCALE_SWITCH_DUAL;
    {class} property CALIBRATION_EVENT: Word read _GetCALIBRATION_EVENT;
    {class} property RANGE_MODE_SINGLE: Word read _GetRANGE_MODE_SINGLE;
    {class} property RANGE_MODE_DUAL_INTERVAL: Word read _GetRANGE_MODE_DUAL_INTERVAL;
    {class} property RANGE_MODE_DUAL_RANGE: Word read _GetRANGE_MODE_DUAL_RANGE;
    {class} property DECIMAL_0: Word read _GetDECIMAL_0;
    {class} property DECIMAL_1: Word read _GetDECIMAL_1;
    {class} property DECIMAL_2: Word read _GetDECIMAL_2;
    {class} property DECIMAL_3: Word read _GetDECIMAL_3;
    {class} property DECIMAL_4: Word read _GetDECIMAL_4;
    {class} property DIVISION_2_1: Word read _GetDIVISION_2_1;
    {class} property DIVISION_2_2: Word read _GetDIVISION_2_2;
    {class} property DIVISION_2_5: Word read _GetDIVISION_2_5;
    {class} property DIVISION_2_10: Word read _GetDIVISION_2_10;
    {class} property DIVISION_2_20: Word read _GetDIVISION_2_20;
    {class} property DIVISION_1_1: Word read _GetDIVISION_1_1;
    {class} property DIVISION_1_2: Word read _GetDIVISION_1_2;
    {class} property DIVISION_1_5: Word read _GetDIVISION_1_5;
    {class} property DIVISION_1_10: Word read _GetDIVISION_1_10;
    {class} property DIVISION_1_20: Word read _GetDIVISION_1_20;
    {class} property ZERO_TRACKING_OFF: Word read _GetZERO_TRACKING_OFF;
    {class} property ZERO_TRACKING_0_5D: Word read _GetZERO_TRACKING_0_5D;
    {class} property ZERO_TRACKING_1D: Word read _GetZERO_TRACKING_1D;
    {class} property ZERO_TRACKING_2D: Word read _GetZERO_TRACKING_2D;
    {class} property ZERO_TRACKING_4D: Word read _GetZERO_TRACKING_4D;
    {class} property AUTO_ZERO_0P: Word read _GetAUTO_ZERO_0P;
    {class} property AUTO_ZERO_2P: Word read _GetAUTO_ZERO_2P;
    {class} property AUTO_ZERO_4P: Word read _GetAUTO_ZERO_4P;
    {class} property AUTO_ZERO_10P: Word read _GetAUTO_ZERO_10P;
    {class} property AUTO_ZERO_20P: Word read _GetAUTO_ZERO_20P;
    {class} property AUTO_ZERO_50P: Word read _GetAUTO_ZERO_50P;
    {class} property AUTO_ZERO_100P: Word read _GetAUTO_ZERO_100P;
    {class} property MANUAL_ZERO_0P: Word read _GetMANUAL_ZERO_0P;
    {class} property MANUAL_ZERO_2P: Word read _GetMANUAL_ZERO_2P;
    {class} property MANUAL_ZERO_4P: Word read _GetMANUAL_ZERO_4P;
    {class} property MANUAL_ZERO_10P: Word read _GetMANUAL_ZERO_10P;
    {class} property MANUAL_ZERO_20P: Word read _GetMANUAL_ZERO_20P;
    {class} property MANUAL_ZERO_50P: Word read _GetMANUAL_ZERO_50P;
    {class} property MANUAL_ZERO_100P: Word read _GetMANUAL_ZERO_100P;
    {class} property VOLTAGE_STOP: Word read _GetVOLTAGE_STOP;
    {class} property VOLTAGE_START: Word read _GetVOLTAGE_START;
    {class} property VOLTAGE_READ: Word read _GetVOLTAGE_READ;
    {class} property CRC_CLOSE: Word read _GetCRC_CLOSE;
    {class} property CRC_OPEN: Word read _GetCRC_OPEN;
    {class} property crcFlag: Boolean read _GetcrcFlag;
    {class} property crcCloseFlag: Boolean read _GetcrcCloseFlag;
  end;

  [JavaSignature('com/tscale/tsscale/TADMessage')]
  JTADMessage = interface(JObject)
  ['{E9B50337-CC7E-4BB6-AC24-46D43917DA4F}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJTADMessage = class(TJavaGenericImport<JTADMessageClass, JTADMessage>) end;

  JTADReadThreadClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{19406B59-1F20-4865-B475-C872B0B04C01}']
    { static Property Methods }

    { static Methods }
    {class} function init(sp: JSerial): JTADReadThread; cdecl; //(Lserial/Serial;)V

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/TADReadThread')]
  JTADReadThread = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{F3BED0E5-7B30-4136-A549-3BB24D7CE7E6}']
    { Property Methods }

    { methods }
    procedure start; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJTADReadThread = class(TJavaGenericImport<JTADReadThreadClass, JTADReadThread>) end;

  JTADScaleClass = interface(JObjectClass)
  ['{59D27795-C4E5-4FA2-8C63-F6475C22AD04}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/TADScale')]
  JTADScale = interface(JObject)
  ['{C1D252EE-B69F-4512-B06E-99CD629A80FF}']
    { Property Methods }

    { methods }
    function getWeight: JTADWeight; cdecl; //()Lcom/tscale/tsscale/TADWeight;
    function isStable: Boolean; cdecl; //()Z
    function isTared: Boolean; cdecl; //()Z
    function isZero: Boolean; cdecl; //()Z
    function getPlatform: Integer; cdecl; //()I
    function getWeightStr: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJTADScale = class(TJavaGenericImport<JTADScaleClass, JTADScale>) end;

//  JTADWeight_1Class = interface(JHashtableClass) // or JObjectClass // SuperSignature: java/util/Hashtable
//  ['{F6BFD3DA-3E9C-455F-AC4B-BB23FE77E526}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('com/tscale/tsscale/TADWeight$1')]
//  JTADWeight_1 = interface(JHashtable) // or JObject // SuperSignature: java/util/Hashtable
//  ['{4568F3A9-CB44-442E-BFD0-DCD2C10F3ABC}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJTADWeight_1 = class(TJavaGenericImport<JTADWeight_1Class, JTADWeight_1>) end;

  JTADWeightClass = interface(JObjectClass)
  ['{148C04CA-E220-4B5C-89F5-6EB5059656E0}']
    { static Property Methods }
    {class} function _GetGRAM: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //D
    {class} function _GetKILOGRAM: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //D
    {class} function _GetMILLIGRAM: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //D
    {class} function _GetPOUND: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //D
    {class} function _GetOUNCE: Double;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //D
    {class} function _GetcrcCloseTareFlag: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z

    { static Methods }

    { static Property }
    {class} property GRAM: Double read _GetGRAM;
    {class} property KILOGRAM: Double read _GetKILOGRAM;
    {class} property MILLIGRAM: Double read _GetMILLIGRAM;
    {class} property POUND: Double read _GetPOUND;
    {class} property OUNCE: Double read _GetOUNCE;
    {class} property crcCloseTareFlag: Boolean read _GetcrcCloseTareFlag;
  end;

  [JavaSignature('com/tscale/tsscale/TADWeight')]
  JTADWeight = interface(JObject)
  ['{E6C23E4C-5B2B-4423-9CD5-6699233D7A87}']
    { Property Methods }

    { methods }
    function getWeightString: JString; cdecl; //()Ljava/lang/String;
    function isStable: Boolean; cdecl; //()Z
    function isTared: Boolean; cdecl; //()Z
    function isZero: Boolean; cdecl; //()Z
    function isValidWeight: Boolean; cdecl; //()Z
    function getWeightInGram: Double; cdecl; //()D
    function getWeightInUnit(aunit: Double): Double; cdecl; //(D)D
    function getRawWeight: JString; cdecl; //()Ljava/lang/String;
    function unitToValue(aunit: JString): Double; cdecl; //(Ljava/lang/String;)D
    function getUnit: Double; cdecl; //()D
    function getUnitString: JString; cdecl; //()Ljava/lang/String;
    function valueToUnit(aunit: Double): JString; cdecl; //(D)Ljava/lang/String;

    { Property }
  end;

  TJTADWeight = class(TJavaGenericImport<JTADWeightClass, JTADWeight>) end;

  JTADWriteThreadClass = interface(JThreadClass) // or JObjectClass // SuperSignature: java/lang/Thread
  ['{86DBA856-E92A-4484-A3C9-DEA7DD1B0550}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/tscale/tsscale/TADWriteThread')]
  JTADWriteThread = interface(JThread) // or JObject // SuperSignature: java/lang/Thread
  ['{266DE538-A390-4EFD-8E6C-B4975E83BBE6}']
    { Property Methods }

    { methods }
    procedure start; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJTADWriteThread = class(TJavaGenericImport<JTADWriteThreadClass, JTADWriteThread>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JBuildConfig',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JCommonStatus',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JCommonStatus));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JFileService',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JFileService));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JJNIScale',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JJNIScale));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JScale',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JScale));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JScaleSettings',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JScaleSettings));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JTADCallback',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JTADCallback));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JTADMessage',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JTADMessage));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JTADReadThread',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JTADReadThread));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JTADScale',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JTADScale));
////  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JTADWeight_1',
////    TypeInfo(Androidapi.JNI.tsscale_aar.JTADWeight_1));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JTADWeight',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JTADWeight));
//  TRegTypes.RegisterType('Androidapi.JNI.tsscale_aar.JTADWriteThread',
//    TypeInfo(Androidapi.JNI.tsscale_aar.JTADWriteThread));
//end;
//
//
//initialization
//  RegisterTypes;

{$ENDIF}

end.
