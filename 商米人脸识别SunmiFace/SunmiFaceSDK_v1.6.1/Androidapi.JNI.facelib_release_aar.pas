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
//  生成时间：2021-06-27 10:16:46
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.facelib_release_aar;

interface

{$IFDEF ANDROID}

uses
  Androidapi.JNIBridge,
//  Androidapi.JNI.android.content.Context,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

//  Ja = interface; //a.a.a.a
//  Jb_a = interface; //a.a.a.b$a
//  Jb = interface; //a.a.a.b
  JSunmiFaceAge = interface; //com.sunmi.facelib.SunmiFaceAge
  JSunmiFaceAuth = interface; //com.sunmi.facelib.SunmiFaceAuth
  JSunmiFaceCompareResult = interface; //com.sunmi.facelib.SunmiFaceCompareResult
  JSunmiFaceConfigParam = interface; //com.sunmi.facelib.SunmiFaceConfigParam
  JSunmiFaceDBIdInfo = interface; //com.sunmi.facelib.SunmiFaceDBIdInfo
  JSunmiFaceDBRecord = interface; //com.sunmi.facelib.SunmiFaceDBRecord
  JSunmiFaceFeature = interface; //com.sunmi.facelib.SunmiFaceFeature
  JSunmiFaceGender = interface; //com.sunmi.facelib.SunmiFaceGender
  JSunmiFaceGenderType = interface; //com.sunmi.facelib.SunmiFaceGenderType
  JSunmiFaceImage = interface; //com.sunmi.facelib.SunmiFaceImage
  JSunmiFaceImageFeatures = interface; //com.sunmi.facelib.SunmiFaceImageFeatures
  JSunmiFaceLib = interface; //com.sunmi.facelib.SunmiFaceLib
  JSunmiFaceLibConstants = interface; //com.sunmi.facelib.SunmiFaceLibConstants
  JSunmiFaceLibJNI = interface; //com.sunmi.facelib.SunmiFaceLibJNI
  JSunmiFaceLivenessMode = interface; //com.sunmi.facelib.SunmiFaceLivenessMode
  JSunmiFaceLmk = interface; //com.sunmi.facelib.SunmiFaceLmk
  JSunmiFaceMode = interface; //com.sunmi.facelib.SunmiFaceMode
  JSunmiFacePose = interface; //com.sunmi.facelib.SunmiFacePose
  JSunmiFaceRect = interface; //com.sunmi.facelib.SunmiFaceRect
  JSunmiFaceSDK = interface; //com.sunmi.facelib.SunmiFaceSDK
  JSunmiFaceStatusCode = interface; //com.sunmi.facelib.SunmiFaceStatusCode
  JSWIGTYPE_p_float = interface; //com.sunmi.facelib.SWIGTYPE_p_float
  JSWIGTYPE_p_p_void = interface; //com.sunmi.facelib.SWIGTYPE_p_p_void
  JSWIGTYPE_p_unsigned_char = interface; //com.sunmi.facelib.SWIGTYPE_p_unsigned_char
  JSWIGTYPE_p_void = interface; //com.sunmi.facelib.SWIGTYPE_p_void

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====



//  JaClass = interface(JObjectClass)
//  ['{D92B1A4B-17E7-47C4-8DF5-0882CD1DED3A}']
//    { static Property Methods }
//    {class} function _Geta: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getb: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getc: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getd: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Gete: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getf: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    {class} function _Getg: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Ja; cdecl;
//
//    { static Property }
//    {class} property a: Boolean read _Geta;
//    {class} property b: JString read _Getb;
//    {class} property c: JString read _Getc;
//    {class} property d: JString read _Getd;
//    {class} property e: JString read _Gete;
//    {class} property f: Integer read _Getf;
//    {class} property g: JString read _Getg;
//  end;
//
//  [JavaSignature('a/a/a/a')]
//  Ja = interface(JObject)
//  ['{A722E56F-8731-4D88-A7CB-683C10BDBF28}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJa = class(TJavaGenericImport<JaClass, Ja>) end;

//  Jb_aClass = interface(JObjectClass)
//  ['{0F6C3E07-B48C-4095-9591-CD8CD2F6E513}']
//    { static Property Methods }
//    {class} function _Geta: Jb;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { static Methods }
//    {class} function init: Jb_a; cdecl; overload;
//    {class} function a: Jb; cdecl;
//    {class} function init: Jb_a; cdecl; overload;
//
//    { static Property }
//    {class} property a: Jb read _Geta;
//  end;
//
//  [JavaSignature('a/a/a/b$a')]
//  Jb_a = interface(JObject)
//  ['{85CCB6A7-CE4B-4244-A775-FD69DFDFAF75}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJb_a = class(TJavaGenericImport<Jb_aClass, Jb_a>) end;

//  JbClass = interface(JObjectClass)
//  ['{7778A9BE-F515-4620-A84C-D30ADBED1F2F}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: Jb; cdecl;
//    {class} function b: Jb; cdecl; overload;
//    {class} function c: JString; cdecl; overload;
//    {class} function b(P1: JContext): JString; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('a/a/a/b')]
//  Jb = interface(JObject)
//  ['{BC09854A-83DF-4A09-8968-0FA033E8B234}']
//    { Property Methods }
//    function _Geta: JSWIGTYPE_p_void;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//    procedure _Seta(aa: JSWIGTYPE_p_void);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
//
//    { methods }
//    function a: JString; cdecl; overload;
//    function b(P1: JString): Integer; cdecl; overload;
//    function a(P1: JContext; P2: JString): Integer; cdecl; overload;
//    function a(P1: JContext): JString; cdecl; overload;
//    function a(P1: Integer): JString; cdecl; overload;
//    function b(P1: JSunmiFaceConfigParam): Integer; cdecl; overload;
//    function a(P1: JSunmiFaceConfigParam): Integer; cdecl; overload;
//    function a(P1: JSunmiFaceFeature): JSunmiFaceDBRecord; cdecl; overload;
//    function a(P1: JSunmiFaceDBRecord): Integer; cdecl; overload;
//    function a(P1: JSunmiFaceImage; P2: JSunmiFaceImageFeatures): Integer; cdecl; overload;
//    function a(P1: JSunmiFaceDBRecord; P2: JSunmiFaceDBIdInfo): Integer; cdecl; overload;
//    function a(P1: JSunmiFaceFeature; P2: JSunmiFaceFeature; P3: JSunmiFaceCompareResult): Integer; cdecl; overload;
//    function a(P1: JSunmiFaceImageFeatures): Integer; cdecl; overload;
//    function c(P1: JString): Integer; cdecl; overload;
//    function a(P1: JString): Integer; cdecl; overload;
//
//    { Property }
//    property a: JSWIGTYPE_p_void read _Geta write _Seta;
//  end;
//
//  TJb = class(TJavaGenericImport<JbClass, Jb>) end;

  JSunmiFaceAgeClass = interface(JObjectClass)
  ['{15C3BA33-3CC8-41F2-B08B-49C1A57A403B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceAge; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceAge): Int64; cdecl;
    {class} function init: JSunmiFaceAge; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceAge')]
  JSunmiFaceAge = interface(JObject)
  ['{22BAC246-5DDD-446C-A81B-FC3CCDB004F8}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setClassification(P1: Integer); cdecl;
    function getClassification: Integer; cdecl;
    procedure setScore(P1: Single); cdecl;
    function getScore: Single; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceAge = class(TJavaGenericImport<JSunmiFaceAgeClass, JSunmiFaceAge>) end;

  JSunmiFaceAuthClass = interface(JObjectClass)
  ['{53375B4B-7610-44B0-966A-D4FCF7DA6812}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSunmiFaceAuth; cdecl; overload;
    {class} function a(P1: JContext): JString; cdecl; overload;
    {class} function a(P1: JContext; P2: JSWIGTYPE_p_void; P3: JString): Integer; cdecl; overload;
    {class} function getFingerprintNative(P1: JContext): JString; cdecl;
    {class} function SunmiFaceVerifyLicenseNative(P1: JContext; P2: Int64; P3: JString): Integer; cdecl;
//    {class} function init: JSunmiFaceAuth; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceAuth')]
  JSunmiFaceAuth = interface(JObject)
  ['{82A3733B-9F9A-447D-BD65-D4F8B36A3368}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceAuth = class(TJavaGenericImport<JSunmiFaceAuthClass, JSunmiFaceAuth>) end;

  JSunmiFaceCompareResultClass = interface(JObjectClass)
  ['{1A4134FA-178F-4E69-9993-8F95BC7BF654}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceCompareResult; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceCompareResult): Int64; cdecl;
    {class} function init: JSunmiFaceCompareResult; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceCompareResult')]
  JSunmiFaceCompareResult = interface(JObject)
  ['{8FAE1E38-FC44-429F-A2EE-9CEC165D2232}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setIsMatched(P1: Boolean); cdecl;
    function getIsMatched: Boolean; cdecl;
    procedure setDistance(P1: Single); cdecl;
    function getDistance: Single; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceCompareResult = class(TJavaGenericImport<JSunmiFaceCompareResultClass, JSunmiFaceCompareResult>) end;

  JSunmiFaceConfigParamClass = interface(JObjectClass)
  ['{94BF9D16-5B48-473E-A995-3020510EE6DA}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceConfigParam; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceConfigParam): Int64; cdecl;
    {class} function init: JSunmiFaceConfigParam; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceConfigParam')]
  JSunmiFaceConfigParam = interface(JObject)
  ['{D2915EBE-047B-4720-839E-88AAE8B647F8}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setThreadNum(P1: Integer); cdecl;
    function getThreadNum: Integer; cdecl;
    procedure setDistanceThreshold(P1: Single); cdecl;
    function getDistanceThreshold: Single; cdecl;
    procedure setYawThreshold(P1: Single); cdecl;
    function getYawThreshold: Single; cdecl;
    procedure setPitchThreshold(P1: Single); cdecl;
    function getPitchThreshold: Single; cdecl;
    procedure setRollThreshold(P1: Single); cdecl;
    function getRollThreshold: Single; cdecl;
    procedure setMinFaceSize(P1: Integer); cdecl;
    function getMinFaceSize: Integer; cdecl;
    procedure setImageQualityThreshold(P1: Single); cdecl;
    function getImageQualityThreshold: Single; cdecl;
    procedure setMinLuminance(P1: Integer); cdecl;
    function getMinLuminance: Integer; cdecl;
    procedure setMaxLuminance(P1: Integer); cdecl;
    function getMaxLuminance: Integer; cdecl;
    procedure setRgbLivenessThreshold(P1: Single); cdecl;
    function getRgbLivenessThreshold: Single; cdecl;
    procedure setDepthLivenessThreshold(P1: Single); cdecl;
    function getDepthLivenessThreshold: Single; cdecl;
    procedure setNirLivenessThreshold(P1: Single); cdecl;
    function getNirLivenessThreshold: Single; cdecl;
    procedure setDepthXOffset(P1: Integer); cdecl;
    function getDepthXOffset: Integer; cdecl;
    procedure setDepthYOffset(P1: Integer); cdecl;
    function getDepthYOffset: Integer; cdecl;
    procedure setNirXOffset(P1: Integer); cdecl;
    function getNirXOffset: Integer; cdecl;
    procedure setNirYOffset(P1: Integer); cdecl;
    function getNirYOffset: Integer; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceConfigParam = class(TJavaGenericImport<JSunmiFaceConfigParamClass, JSunmiFaceConfigParam>) end;

  JSunmiFaceDBIdInfoClass = interface(JObjectClass)
  ['{70249FCE-A4B2-483F-8DAC-3810034ABCDF}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceDBIdInfo; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceDBIdInfo): Int64; cdecl;
    {class} function init: JSunmiFaceDBIdInfo; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceDBIdInfo')]
  JSunmiFaceDBIdInfo = interface(JObject)
  ['{B0B87E1B-A534-4FE1-9D98-2597CC68CA57}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setId(P1: JString); cdecl;
    function getId: JString; cdecl;
    procedure setName(P1: JString); cdecl;
    function getName: JString; cdecl;
    procedure setIsMatched(P1: Boolean); cdecl;
    function getIsMatched: Boolean; cdecl;
    procedure setDistance(P1: Single); cdecl;
    function getDistance: Single; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceDBIdInfo = class(TJavaGenericImport<JSunmiFaceDBIdInfoClass, JSunmiFaceDBIdInfo>) end;

  JSunmiFaceDBRecordClass = interface(JObjectClass)
  ['{2B55C8C9-BE2E-4152-B07A-7F9355E2CE5B}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceDBRecord; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceDBRecord): Int64; cdecl;
    {class} function init: JSunmiFaceDBRecord; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceDBRecord')]
  JSunmiFaceDBRecord = interface(JObject)
  ['{327DEDE1-C1E2-465A-875F-92E57290EB2B}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setId(P1: JString); cdecl;
    function getId: JString; cdecl;
    procedure setName(P1: JString); cdecl;
    function getName: JString; cdecl;
    procedure setImgId(P1: JString); cdecl;
    function getImgId: JString; cdecl;
    procedure setFeature(P1: TJavaArray<Single>); cdecl;
    function getFeature: TJavaArray<Single>; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceDBRecord = class(TJavaGenericImport<JSunmiFaceDBRecordClass, JSunmiFaceDBRecord>) end;

  JSunmiFaceFeatureClass = interface(JObjectClass)
  ['{00EB153A-DCE4-48E5-A91A-650592A5CD07}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceFeature; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceFeature): Int64; cdecl;
    {class} function init: JSunmiFaceFeature; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceFeature')]
  JSunmiFaceFeature = interface(JObject)
  ['{193CAFEC-5A53-441D-B041-07A48397467E}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setFaceRect(P1: JSunmiFaceRect); cdecl;
    function getFaceRect: JSunmiFaceRect; cdecl;
    procedure setRgbLivenessScore(P1: Single); cdecl;
    function getRgbLivenessScore: Single; cdecl;
    procedure setNirLivenessScore(P1: Single); cdecl;
    function getNirLivenessScore: Single; cdecl;
    procedure setDepthLivenessScore(P1: Single); cdecl;
    function getDepthLivenessScore: Single; cdecl;
    procedure setFeature(P1: TJavaArray<Single>); cdecl;
    function getFeature: TJavaArray<Single>; cdecl;
    procedure setLandmark(P1: JSunmiFaceLmk); cdecl;
    function getLandmark: JSunmiFaceLmk; cdecl;
    procedure setPose(P1: JSunmiFacePose); cdecl;
    function getPose: JSunmiFacePose; cdecl;
    procedure setAge(P1: JSunmiFaceAge); cdecl;
    function getAge: JSunmiFaceAge; cdecl;
    procedure setGender(P1: JSunmiFaceGender); cdecl;
    function getGender: JSunmiFaceGender; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceFeature = class(TJavaGenericImport<JSunmiFaceFeatureClass, JSunmiFaceFeature>) end;

  JSunmiFaceGenderClass = interface(JObjectClass)
  ['{596B3FFF-0A75-4E12-8BE0-23964922CAE5}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceGender; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceGender): Int64; cdecl;
    {class} function init: JSunmiFaceGender; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceGender')]
  JSunmiFaceGender = interface(JObject)
  ['{F66CC5AF-2E9D-4A08-9D12-C48E865CFEE9}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setClassification(P1: Integer); cdecl;
    function getClassification: Integer; cdecl;
    procedure setScore(P1: Single); cdecl;
    function getScore: Single; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceGender = class(TJavaGenericImport<JSunmiFaceGenderClass, JSunmiFaceGender>) end;

  JSunmiFaceGenderTypeClass = interface(JObjectClass)
  ['{4AE6E89F-9880-48BE-AF47-18E1B4935F07}']
    { static Property Methods }
    {class} function _GetFACE_ATTR_FEMALE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_ATTR_MALE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSunmiFaceGenderType; cdecl;

    { static Property }
    {class} property FACE_ATTR_FEMALE: Integer read _GetFACE_ATTR_FEMALE;
    {class} property FACE_ATTR_MALE: Integer read _GetFACE_ATTR_MALE;
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceGenderType')]
  JSunmiFaceGenderType = interface(JObject)
  ['{41492D49-2B45-4349-8C8B-B08685E5E13E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceGenderType = class(TJavaGenericImport<JSunmiFaceGenderTypeClass, JSunmiFaceGenderType>) end;

  JSunmiFaceImageClass = interface(JObjectClass)
  ['{B551A3BC-BA24-4D29-8263-D664BDBBB163}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceImage; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceImage): Int64; cdecl;
    {class} function init: JSunmiFaceImage; cdecl; overload;
    {class} function init(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): JSunmiFaceImage; cdecl; overload;
    {class} function init(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: Integer; P10: Integer): JSunmiFaceImage; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceImage')]
  JSunmiFaceImage = interface(JObject)
  ['{89D2F154-4770-4202-A0B6-C6BB41F33891}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setBuf(P1: JSWIGTYPE_p_unsigned_char); cdecl;
    function getBuf: JSWIGTYPE_p_unsigned_char; cdecl;
    procedure setBufLen(P1: Integer); cdecl;
    function getBufLen: Integer; cdecl;
    procedure setImgW(P1: Integer); cdecl;
    function getImgW: Integer; cdecl;
    procedure setImgH(P1: Integer); cdecl;
    function getImgH: Integer; cdecl;
    procedure setMaxFaceCount(P1: Integer); cdecl;
    function getMaxFaceCount: Integer; cdecl;
    procedure setDepthBuf(P1: JSWIGTYPE_p_unsigned_char); cdecl;
    function getDepthBuf: JSWIGTYPE_p_unsigned_char; cdecl;
    procedure setDepthBufLen(P1: Integer); cdecl;
    function getDepthBufLen: Integer; cdecl;
    procedure setDepthImgW(P1: Integer); cdecl;
    function getDepthImgW: Integer; cdecl;
    procedure setDepthImgH(P1: Integer); cdecl;
    function getDepthImgH: Integer; cdecl;
    procedure setNirBuf(P1: JSWIGTYPE_p_unsigned_char); cdecl;
    function getNirBuf: JSWIGTYPE_p_unsigned_char; cdecl;
    procedure setNirBufLen(P1: Integer); cdecl;
    function getNirBufLen: Integer; cdecl;
    procedure setNirImgW(P1: Integer); cdecl;
    function getNirImgW: Integer; cdecl;
    procedure setNirImgH(P1: Integer); cdecl;
    function getNirImgH: Integer; cdecl;
    procedure setPredictMode(P1: Integer); cdecl;
    function getPredictMode: Integer; cdecl;
    procedure setLivenessMode(P1: Integer); cdecl;
    function getLivenessMode: Integer; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceImage = class(TJavaGenericImport<JSunmiFaceImageClass, JSunmiFaceImage>) end;

  JSunmiFaceImageFeaturesClass = interface(JObjectClass)
  ['{D03C0454-C356-4A60-B813-931CD3097B80}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceImageFeatures; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceImageFeatures): Int64; cdecl;
    {class} function init: JSunmiFaceImageFeatures; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceImageFeatures')]
  JSunmiFaceImageFeatures = interface(JObject)
  ['{77A507DB-C393-45C4-B83D-C22B548F62A7}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setFeatures(P1: JSunmiFaceFeature); cdecl;
    function getFeatures: JSunmiFaceFeature; cdecl;
    procedure setFeaturesCount(P1: Integer); cdecl;
    function getFeaturesCount: Integer; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceImageFeatures = class(TJavaGenericImport<JSunmiFaceImageFeaturesClass, JSunmiFaceImageFeatures>) end;


  JSWIGTYPE_p_floatClass = interface(JObjectClass)
  ['{78878EFA-CA00-4AA8-B0D7-4B8CE968C7CA}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSWIGTYPE_p_float; cdecl; overload;
    {class} function init: JSWIGTYPE_p_float; cdecl; overload;
    {class} function getCPtr(P1: JSWIGTYPE_p_float): Int64; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SWIGTYPE_p_float')]
  JSWIGTYPE_p_float = interface(JObject)
  ['{0FB2E452-0CEC-4944-8222-4CC7CB3AEBDF}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
  end;

  TJSWIGTYPE_p_float = class(TJavaGenericImport<JSWIGTYPE_p_floatClass, JSWIGTYPE_p_float>) end;
//
  JSWIGTYPE_p_p_voidClass = interface(JObjectClass)
  ['{4AB5CE9D-0BE6-439E-96C1-BC75ACC131A2}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSWIGTYPE_p_p_void; cdecl; overload;
    {class} function init: JSWIGTYPE_p_p_void; cdecl; overload;
    {class} function getCPtr(P1: JSWIGTYPE_p_p_void): Int64; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SWIGTYPE_p_p_void')]
  JSWIGTYPE_p_p_void = interface(JObject)
  ['{FCC9BB36-C1DD-4ED1-BD01-8A5AE9A786FC}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
  end;

  TJSWIGTYPE_p_p_void = class(TJavaGenericImport<JSWIGTYPE_p_p_voidClass, JSWIGTYPE_p_p_void>) end;
//
  JSWIGTYPE_p_unsigned_charClass = interface(JObjectClass)
  ['{AE07F22E-3A75-43FC-88B4-560AC11E8792}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSWIGTYPE_p_unsigned_char; cdecl; overload;
    {class} function init: JSWIGTYPE_p_unsigned_char; cdecl; overload;
    {class} function getCPtr(P1: JSWIGTYPE_p_unsigned_char): Int64; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SWIGTYPE_p_unsigned_char')]
  JSWIGTYPE_p_unsigned_char = interface(JObject)
  ['{8FC2CF80-C0E7-456F-8C58-7EFC87C87A39}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
  end;

  TJSWIGTYPE_p_unsigned_char = class(TJavaGenericImport<JSWIGTYPE_p_unsigned_charClass, JSWIGTYPE_p_unsigned_char>) end;
//
  JSWIGTYPE_p_voidClass = interface(JObjectClass)
  ['{3E65B085-E915-4210-9E8D-7571E87C2376}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSWIGTYPE_p_void; cdecl; overload;
    {class} function init: JSWIGTYPE_p_void; cdecl; overload;
    {class} function getCPtr(P1: JSWIGTYPE_p_void): Int64; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SWIGTYPE_p_void')]
  JSWIGTYPE_p_void = interface(JObject)
  ['{AB0456FF-023A-4206-9EE7-AFD28AB1C046}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
  end;

  TJSWIGTYPE_p_void = class(TJavaGenericImport<JSWIGTYPE_p_voidClass, JSWIGTYPE_p_void>) end;



  JSunmiFaceLibClass = interface(JObjectClass)
  ['{EF387CAD-9D94-4465-8ED7-85BA002C9B00}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSunmiFaceLib; cdecl;
    {class} function newPVoid: JSWIGTYPE_p_p_void; cdecl;
    {class} function copyPVoid(P1: JSWIGTYPE_p_void): JSWIGTYPE_p_p_void; cdecl;
    {class} procedure deletePVoid(P1: JSWIGTYPE_p_p_void); cdecl;
    {class} procedure pVoidAssign(P1: JSWIGTYPE_p_p_void; P2: JSWIGTYPE_p_void); cdecl;
    {class} function pVoidValue(P1: JSWIGTYPE_p_p_void): JSWIGTYPE_p_void; cdecl;
    {class} function newCharArray(P1: Integer): JSWIGTYPE_p_unsigned_char; cdecl;
    {class} procedure deleteCharArray(P1: JSWIGTYPE_p_unsigned_char); cdecl;
    {class} function charArrayGetItem(P1: JSWIGTYPE_p_unsigned_char; P2: Integer): Word; cdecl;
    {class} procedure charArraySetItem(P1: JSWIGTYPE_p_unsigned_char; P2: Integer; P3: Word); cdecl;
    {class} function newFloatArray(P1: Integer): JSWIGTYPE_p_float; cdecl;
    {class} procedure deleteFloatArray(P1: JSWIGTYPE_p_float); cdecl;
    {class} function floatArrayGetItem(P1: JSWIGTYPE_p_float; P2: Integer): Single; cdecl;
    {class} procedure floatArraySetItem(P1: JSWIGTYPE_p_float; P2: Integer; P3: Single); cdecl;
    {class} function SunmiFaceGetVersion: JString; cdecl;
    {class} function SunmiFaceCreate(P1: JSWIGTYPE_p_p_void): Integer; cdecl;
    {class} function SunmiFaceInit(P1: JSWIGTYPE_p_void; P2: JString): Integer; cdecl;
    {class} function SunmiFaceGetErrorString(P1: Integer): JString; cdecl;
    {class} function SunmiFaceSetConfig(P1: JSWIGTYPE_p_void; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} function SunmiFaceGetConfig(P1: JSWIGTYPE_p_void; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} function SunmiFaceRelease(P1: JSWIGTYPE_p_void): Integer; cdecl;
    {class} function SunmiFaceGetImageFeatures(P1: JSWIGTYPE_p_void; P2: JSunmiFaceImage; P3: JSunmiFaceImageFeatures): Integer; cdecl;
    {class} function SunmiFaceCompare1v1(P1: JSWIGTYPE_p_void; P2: JSunmiFaceFeature; P3: JSunmiFaceFeature; P4: JSunmiFaceCompareResult): Integer; cdecl;
    {class} function SunmiFaceReleaseImageFeatures(P1: JSunmiFaceImageFeatures): Integer; cdecl;
    {class} function SunmiFaceInitDB(P1: JSWIGTYPE_p_void; P2: JString): Integer; cdecl;
    {class} function SunmiFaceAddDBRecord(P1: JSWIGTYPE_p_void; P2: JSunmiFaceDBRecord): Integer; cdecl;
    {class} function SunmiFaceSearchDB(P1: JSWIGTYPE_p_void; P2: JSunmiFaceDBRecord; P3: JSunmiFaceDBIdInfo): Integer; cdecl;
    {class} function SunmiFaceDeleteDBRecord(P1: JSWIGTYPE_p_void; P2: JString): Integer; cdecl;
    {class} function newSunmiFaceFeatureArray(P1: Integer): JSunmiFaceFeature; cdecl;
    {class} procedure deleteSunmiFaceFeatureArray(P1: JSunmiFaceFeature); cdecl;
    {class} function SunmiFaceFeatureArrayGetItem(P1: JSunmiFaceFeature; P2: Integer): JSunmiFaceFeature; cdecl;
    {class} procedure SunmiFaceFeatureArraySetItem(P1: JSunmiFaceFeature; P2: Integer; P3: JSunmiFaceFeature); cdecl;
    {class} function newSunmiFaceLmkArray(P1: Integer): JSunmiFaceLmk; cdecl;
    {class} procedure deleteSunmiFaceLmkArray(P1: JSunmiFaceLmk); cdecl;
    {class} function SunmiFaceLmkArrayGetItem(P1: JSunmiFaceLmk; P2: Integer): JSunmiFaceLmk; cdecl;
    {class} procedure SunmiFaceLmkArraySetItem(P1: JSunmiFaceLmk; P2: Integer; P3: JSunmiFaceLmk); cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceLib')]
  JSunmiFaceLib = interface(JObject)
  ['{7C1B4F16-51AA-4036-95DB-3171F66E4E02}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceLib = class(TJavaGenericImport<JSunmiFaceLibClass, JSunmiFaceLib>) end;

  JSunmiFaceLibConstantsClass = interface(JObjectClass)
  ['{9A963514-B73D-4D28-8DD1-26B698E93979}']
    { static Property Methods }
    {class} function _GetSUNMI_FACE_FEATURE_LEN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUNMI_FACE_ID_LEN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUNMI_FACE_NAME_LEN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUNMI_FACE_IMG_ID_LEN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSUNMI_FACE_LANDMARK_LEN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property SUNMI_FACE_FEATURE_LEN: Integer read _GetSUNMI_FACE_FEATURE_LEN;
    {class} property SUNMI_FACE_ID_LEN: Integer read _GetSUNMI_FACE_ID_LEN;
    {class} property SUNMI_FACE_NAME_LEN: Integer read _GetSUNMI_FACE_NAME_LEN;
    {class} property SUNMI_FACE_IMG_ID_LEN: Integer read _GetSUNMI_FACE_IMG_ID_LEN;
    {class} property SUNMI_FACE_LANDMARK_LEN: Integer read _GetSUNMI_FACE_LANDMARK_LEN;
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceLibConstants')]
  JSunmiFaceLibConstants = interface(IJavaInstance)
  ['{CE6789A4-5789-41CD-9D94-D1EAF090FA53}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceLibConstants = class(TJavaGenericImport<JSunmiFaceLibConstantsClass, JSunmiFaceLibConstants>) end;

  JSunmiFaceLibJNIClass = interface(JObjectClass)
  ['{85A9A7A8-BAA8-4F00-AFD6-8ADB9A1FA0FA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSunmiFaceLibJNI; cdecl; overload;
    {class} function new_p_void: Int64; cdecl;
    {class} function copy_p_void(P1: Int64): Int64; cdecl;
    {class} procedure delete_p_void(P1: Int64); cdecl;
    {class} procedure p_void_assign(P1: Int64; P2: Int64); cdecl;
    {class} function p_void_value(P1: Int64): Int64; cdecl;
    {class} function new_charArray(P1: Integer): Int64; cdecl;
    {class} procedure delete_charArray(P1: Int64); cdecl;
    {class} function charArray_getitem(P1: Int64; P2: Integer): Word; cdecl;
    {class} procedure charArray_setitem(P1: Int64; P2: Integer; P3: Word); cdecl;
    {class} function new_floatArray(P1: Integer): Int64; cdecl;
    {class} procedure delete_floatArray(P1: Int64); cdecl;
    {class} function floatArray_getitem(P1: Int64; P2: Integer): Single; cdecl;
    {class} procedure floatArray_setitem(P1: Int64; P2: Integer; P3: Single); cdecl;
    {class} procedure SunmiFaceRect_x1__set(P1: Int64; P2: JSunmiFaceRect; P3: Single); cdecl;
    {class} function SunmiFaceRect_x1__get(P1: Int64; P2: JSunmiFaceRect): Single; cdecl;
    {class} procedure SunmiFaceRect_y1__set(P1: Int64; P2: JSunmiFaceRect; P3: Single); cdecl;
    {class} function SunmiFaceRect_y1__get(P1: Int64; P2: JSunmiFaceRect): Single; cdecl;
    {class} procedure SunmiFaceRect_x2__set(P1: Int64; P2: JSunmiFaceRect; P3: Single); cdecl;
    {class} function SunmiFaceRect_x2__get(P1: Int64; P2: JSunmiFaceRect): Single; cdecl;
    {class} procedure SunmiFaceRect_y2__set(P1: Int64; P2: JSunmiFaceRect; P3: Single); cdecl;
    {class} function SunmiFaceRect_y2__get(P1: Int64; P2: JSunmiFaceRect): Single; cdecl;
    {class} procedure SunmiFaceRect_score__set(P1: Int64; P2: JSunmiFaceRect; P3: Single); cdecl;
    {class} function SunmiFaceRect_score__get(P1: Int64; P2: JSunmiFaceRect): Single; cdecl;
    {class} function new_SunmiFaceRect: Int64; cdecl;
    {class} procedure delete_SunmiFaceRect(P1: Int64); cdecl;
    {class} procedure SunmiFaceLmk_x__set(P1: Int64; P2: JSunmiFaceLmk; P3: Single); cdecl;
    {class} function SunmiFaceLmk_x__get(P1: Int64; P2: JSunmiFaceLmk): Single; cdecl;
    {class} procedure SunmiFaceLmk_y__set(P1: Int64; P2: JSunmiFaceLmk; P3: Single); cdecl;
    {class} function SunmiFaceLmk_y__get(P1: Int64; P2: JSunmiFaceLmk): Single; cdecl;
    {class} function new_SunmiFaceLmk: Int64; cdecl;
    {class} procedure delete_SunmiFaceLmk(P1: Int64); cdecl;
    {class} procedure SunmiFaceImage_buf__set(P1: Int64; P2: JSunmiFaceImage; P3: Int64); cdecl;
    {class} function SunmiFaceImage_buf__get(P1: Int64; P2: JSunmiFaceImage): Int64; cdecl;
    {class} procedure SunmiFaceImage_buf_len__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_buf_len__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_img_w__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_img_w__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_img_h__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_img_h__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_max_face_count__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_max_face_count__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_depth_buf__set(P1: Int64; P2: JSunmiFaceImage; P3: Int64); cdecl;
    {class} function SunmiFaceImage_depth_buf__get(P1: Int64; P2: JSunmiFaceImage): Int64; cdecl;
    {class} procedure SunmiFaceImage_depth_buf_len__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_depth_buf_len__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_depth_img_w__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_depth_img_w__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_depth_img_h__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_depth_img_h__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_nir_buf__set(P1: Int64; P2: JSunmiFaceImage; P3: Int64); cdecl;
    {class} function SunmiFaceImage_nir_buf__get(P1: Int64; P2: JSunmiFaceImage): Int64; cdecl;
    {class} procedure SunmiFaceImage_nir_buf_len__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_nir_buf_len__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_nir_img_w__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_nir_img_w__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_nir_img_h__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_nir_img_h__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_predict_mode__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_predict_mode__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} procedure SunmiFaceImage_liveness_mode__set(P1: Int64; P2: JSunmiFaceImage; P3: Integer); cdecl;
    {class} function SunmiFaceImage_liveness_mode__get(P1: Int64; P2: JSunmiFaceImage): Integer; cdecl;
    {class} function new_SunmiFaceImage__SWIG_0: Int64; cdecl;
    {class} function new_SunmiFaceImage__SWIG_1(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): Int64; cdecl;
    {class} function new_SunmiFaceImage__SWIG_2(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: TJavaArray<Byte>; P5: Integer; P6: Integer; P7: TJavaArray<Byte>; P8: Integer; P9: Integer; P10: Integer): Int64; cdecl;
    {class} procedure delete_SunmiFaceImage(P1: Int64); cdecl;
    {class} procedure SunmiFacePose_pitch__set(P1: Int64; P2: JSunmiFacePose; P3: Single); cdecl;
    {class} function SunmiFacePose_pitch__get(P1: Int64; P2: JSunmiFacePose): Single; cdecl;
    {class} procedure SunmiFacePose_yaw__set(P1: Int64; P2: JSunmiFacePose; P3: Single); cdecl;
    {class} function SunmiFacePose_yaw__get(P1: Int64; P2: JSunmiFacePose): Single; cdecl;
    {class} procedure SunmiFacePose_roll__set(P1: Int64; P2: JSunmiFacePose; P3: Single); cdecl;
    {class} function SunmiFacePose_roll__get(P1: Int64; P2: JSunmiFacePose): Single; cdecl;
    {class} function new_SunmiFacePose: Int64; cdecl;
    {class} procedure delete_SunmiFacePose(P1: Int64); cdecl;
    {class} procedure SunmiFaceAge_classification__set(P1: Int64; P2: JSunmiFaceAge; P3: Integer); cdecl;
    {class} function SunmiFaceAge_classification__get(P1: Int64; P2: JSunmiFaceAge): Integer; cdecl;
    {class} procedure SunmiFaceAge_score__set(P1: Int64; P2: JSunmiFaceAge; P3: Single); cdecl;
    {class} function SunmiFaceAge_score__get(P1: Int64; P2: JSunmiFaceAge): Single; cdecl;
    {class} function new_SunmiFaceAge: Int64; cdecl;
    {class} procedure delete_SunmiFaceAge(P1: Int64); cdecl;
    {class} procedure SunmiFaceGender_classification__set(P1: Int64; P2: JSunmiFaceGender; P3: Integer); cdecl;
    {class} function SunmiFaceGender_classification__get(P1: Int64; P2: JSunmiFaceGender): Integer; cdecl;
    {class} procedure SunmiFaceGender_score__set(P1: Int64; P2: JSunmiFaceGender; P3: Single); cdecl;
    {class} function SunmiFaceGender_score__get(P1: Int64; P2: JSunmiFaceGender): Single; cdecl;
    {class} function new_SunmiFaceGender: Int64; cdecl;
    {class} procedure delete_SunmiFaceGender(P1: Int64); cdecl;
    {class} procedure SunmiFaceFeature_face_rect__set(P1: Int64; P2: JSunmiFaceFeature; P3: Int64; P4: JSunmiFaceRect); cdecl;
    {class} function SunmiFaceFeature_face_rect__get(P1: Int64; P2: JSunmiFaceFeature): Int64; cdecl;
    {class} procedure SunmiFaceFeature_rgb_liveness_score__set(P1: Int64; P2: JSunmiFaceFeature; P3: Single); cdecl;
    {class} function SunmiFaceFeature_rgb_liveness_score__get(P1: Int64; P2: JSunmiFaceFeature): Single; cdecl;
    {class} procedure SunmiFaceFeature_nir_liveness_score__set(P1: Int64; P2: JSunmiFaceFeature; P3: Single); cdecl;
    {class} function SunmiFaceFeature_nir_liveness_score__get(P1: Int64; P2: JSunmiFaceFeature): Single; cdecl;
    {class} procedure SunmiFaceFeature_depth_liveness_score__set(P1: Int64; P2: JSunmiFaceFeature; P3: Single); cdecl;
    {class} function SunmiFaceFeature_depth_liveness_score__get(P1: Int64; P2: JSunmiFaceFeature): Single; cdecl;
    {class} procedure SunmiFaceFeature_feature__set(P1: Int64; P2: JSunmiFaceFeature; P3: TJavaArray<Single>); cdecl;
    {class} function SunmiFaceFeature_feature__get(P1: Int64; P2: JSunmiFaceFeature): TJavaArray<Single>; cdecl;
    {class} procedure SunmiFaceFeature_landmark__set(P1: Int64; P2: JSunmiFaceFeature; P3: Int64; P4: JSunmiFaceLmk); cdecl;
    {class} function SunmiFaceFeature_landmark__get(P1: Int64; P2: JSunmiFaceFeature): Int64; cdecl;
    {class} procedure SunmiFaceFeature_pose__set(P1: Int64; P2: JSunmiFaceFeature; P3: Int64; P4: JSunmiFacePose); cdecl;
    {class} function SunmiFaceFeature_pose__get(P1: Int64; P2: JSunmiFaceFeature): Int64; cdecl;
    {class} procedure SunmiFaceFeature_age__set(P1: Int64; P2: JSunmiFaceFeature; P3: Int64; P4: JSunmiFaceAge); cdecl;
    {class} function SunmiFaceFeature_age__get(P1: Int64; P2: JSunmiFaceFeature): Int64; cdecl;
    {class} procedure SunmiFaceFeature_gender__set(P1: Int64; P2: JSunmiFaceFeature; P3: Int64; P4: JSunmiFaceGender); cdecl;
    {class} function SunmiFaceFeature_gender__get(P1: Int64; P2: JSunmiFaceFeature): Int64; cdecl;
    {class} function new_SunmiFaceFeature: Int64; cdecl;
    {class} procedure delete_SunmiFaceFeature(P1: Int64); cdecl;
    {class} procedure SunmiFaceImageFeatures_features__set(P1: Int64; P2: JSunmiFaceImageFeatures; P3: Int64; P4: JSunmiFaceFeature); cdecl;
    {class} function SunmiFaceImageFeatures_features__get(P1: Int64; P2: JSunmiFaceImageFeatures): Int64; cdecl;
    {class} procedure SunmiFaceImageFeatures_features_count__set(P1: Int64; P2: JSunmiFaceImageFeatures; P3: Integer); cdecl;
    {class} function SunmiFaceImageFeatures_features_count__get(P1: Int64; P2: JSunmiFaceImageFeatures): Integer; cdecl;
    {class} function new_SunmiFaceImageFeatures: Int64; cdecl;
    {class} procedure delete_SunmiFaceImageFeatures(P1: Int64); cdecl;
    {class} procedure SunmiFaceConfigParam_thread_num__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Integer); cdecl;
    {class} function SunmiFaceConfigParam_thread_num__get(P1: Int64; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} procedure SunmiFaceConfigParam_distance_threshold__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Single); cdecl;
    {class} function SunmiFaceConfigParam_distance_threshold__get(P1: Int64; P2: JSunmiFaceConfigParam): Single; cdecl;
    {class} procedure SunmiFaceConfigParam_yaw_threshold__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Single); cdecl;
    {class} function SunmiFaceConfigParam_yaw_threshold__get(P1: Int64; P2: JSunmiFaceConfigParam): Single; cdecl;
    {class} procedure SunmiFaceConfigParam_pitch_threshold__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Single); cdecl;
    {class} function SunmiFaceConfigParam_pitch_threshold__get(P1: Int64; P2: JSunmiFaceConfigParam): Single; cdecl;
    {class} procedure SunmiFaceConfigParam_roll_threshold__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Single); cdecl;
    {class} function SunmiFaceConfigParam_roll_threshold__get(P1: Int64; P2: JSunmiFaceConfigParam): Single; cdecl;
    {class} procedure SunmiFaceConfigParam_min_face_size_set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Integer); cdecl;
    {class} function SunmiFaceConfigParam_min_face_size_get(P1: Int64; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} procedure SunmiFaceConfigParam_image_quality_threshold__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Single); cdecl;
    {class} function SunmiFaceConfigParam_image_quality_threshold__get(P1: Int64; P2: JSunmiFaceConfigParam): Single; cdecl;
    {class} procedure SunmiFaceConfigParam_min_luminance__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Integer); cdecl;
    {class} function SunmiFaceConfigParam_min_luminance__get(P1: Int64; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} procedure SunmiFaceConfigParam_max_luminance__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Integer); cdecl;
    {class} function SunmiFaceConfigParam_max_luminance__get(P1: Int64; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} procedure SunmiFaceConfigParam_rgb_liveness_threshold__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Single); cdecl;
    {class} function SunmiFaceConfigParam_rgb_liveness_threshold__get(P1: Int64; P2: JSunmiFaceConfigParam): Single; cdecl;
    {class} procedure SunmiFaceConfigParam_depth_liveness_threshold__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Single); cdecl;
    {class} function SunmiFaceConfigParam_depth_liveness_threshold__get(P1: Int64; P2: JSunmiFaceConfigParam): Single; cdecl;
    {class} procedure SunmiFaceConfigParam_nir_liveness_threshold__set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Single); cdecl;
    {class} function SunmiFaceConfigParam_nir_liveness_threshold__get(P1: Int64; P2: JSunmiFaceConfigParam): Single; cdecl;
    {class} procedure SunmiFaceConfigParam_depth_x_offset_set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Integer); cdecl;
    {class} function SunmiFaceConfigParam_depth_x_offset_get(P1: Int64; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} procedure SunmiFaceConfigParam_depth_y_offset_set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Integer); cdecl;
    {class} function SunmiFaceConfigParam_depth_y_offset_get(P1: Int64; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} procedure SunmiFaceConfigParam_nir_x_offset_set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Integer); cdecl;
    {class} function SunmiFaceConfigParam_nir_x_offset_get(P1: Int64; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} procedure SunmiFaceConfigParam_nir_y_offset_set(P1: Int64; P2: JSunmiFaceConfigParam; P3: Integer); cdecl;
    {class} function SunmiFaceConfigParam_nir_y_offset_get(P1: Int64; P2: JSunmiFaceConfigParam): Integer; cdecl;
    {class} function new_SunmiFaceConfigParam: Int64; cdecl;
    {class} procedure delete_SunmiFaceConfigParam(P1: Int64); cdecl;
    {class} procedure SunmiFaceCompareResult_is_matched__set(P1: Int64; P2: JSunmiFaceCompareResult; P3: Boolean); cdecl;
    {class} function SunmiFaceCompareResult_is_matched__get(P1: Int64; P2: JSunmiFaceCompareResult): Boolean; cdecl;
    {class} procedure SunmiFaceCompareResult_distance__set(P1: Int64; P2: JSunmiFaceCompareResult; P3: Single); cdecl;
    {class} function SunmiFaceCompareResult_distance__get(P1: Int64; P2: JSunmiFaceCompareResult): Single; cdecl;
    {class} function new_SunmiFaceCompareResult: Int64; cdecl;
    {class} procedure delete_SunmiFaceCompareResult(P1: Int64); cdecl;
    {class} procedure SunmiFaceDBRecord_id__set(P1: Int64; P2: JSunmiFaceDBRecord; P3: JString); cdecl;
    {class} function SunmiFaceDBRecord_id__get(P1: Int64; P2: JSunmiFaceDBRecord): JString; cdecl;
    {class} procedure SunmiFaceDBRecord_name__set(P1: Int64; P2: JSunmiFaceDBRecord; P3: JString); cdecl;
    {class} function SunmiFaceDBRecord_name__get(P1: Int64; P2: JSunmiFaceDBRecord): JString; cdecl;
    {class} procedure SunmiFaceDBRecord_img_id__set(P1: Int64; P2: JSunmiFaceDBRecord; P3: JString); cdecl;
    {class} function SunmiFaceDBRecord_img_id__get(P1: Int64; P2: JSunmiFaceDBRecord): JString; cdecl;
    {class} procedure SunmiFaceDBRecord_feature__set(P1: Int64; P2: JSunmiFaceDBRecord; P3: TJavaArray<Single>); cdecl;
    {class} function SunmiFaceDBRecord_feature__get(P1: Int64; P2: JSunmiFaceDBRecord): TJavaArray<Single>; cdecl;
    {class} function new_SunmiFaceDBRecord: Int64; cdecl;
    {class} procedure delete_SunmiFaceDBRecord(P1: Int64); cdecl;
    {class} procedure SunmiFaceDBIdInfo_id__set(P1: Int64; P2: JSunmiFaceDBIdInfo; P3: JString); cdecl;
    {class} function SunmiFaceDBIdInfo_id__get(P1: Int64; P2: JSunmiFaceDBIdInfo): JString; cdecl;
    {class} procedure SunmiFaceDBIdInfo_name__set(P1: Int64; P2: JSunmiFaceDBIdInfo; P3: JString); cdecl;
    {class} function SunmiFaceDBIdInfo_name__get(P1: Int64; P2: JSunmiFaceDBIdInfo): JString; cdecl;
    {class} procedure SunmiFaceDBIdInfo_is_matched__set(P1: Int64; P2: JSunmiFaceDBIdInfo; P3: Boolean); cdecl;
    {class} function SunmiFaceDBIdInfo_is_matched__get(P1: Int64; P2: JSunmiFaceDBIdInfo): Boolean; cdecl;
    {class} procedure SunmiFaceDBIdInfo_distance__set(P1: Int64; P2: JSunmiFaceDBIdInfo; P3: Single); cdecl;
    {class} function SunmiFaceDBIdInfo_distance__get(P1: Int64; P2: JSunmiFaceDBIdInfo): Single; cdecl;
    {class} function new_SunmiFaceDBIdInfo: Int64; cdecl;
    {class} procedure delete_SunmiFaceDBIdInfo(P1: Int64); cdecl;
    {class} function SunmiFaceGetVersion: JString; cdecl;
    {class} function SunmiFaceCreate(P1: Int64): Integer; cdecl;
    {class} function SunmiFaceInit(P1: Int64; P2: JString): Integer; cdecl;
    {class} function SunmiFaceGetErrorString(P1: Integer): JString; cdecl;
    {class} function SunmiFaceSetConfig(P1: Int64; P2: Int64; P3: JSunmiFaceConfigParam): Integer; cdecl;
    {class} function SunmiFaceGetConfig(P1: Int64; P2: Int64; P3: JSunmiFaceConfigParam): Integer; cdecl;
    {class} function SunmiFaceRelease(P1: Int64): Integer; cdecl;
    {class} function SunmiFaceGetImageFeatures(P1: Int64; P2: Int64; P3: JSunmiFaceImage; P4: Int64; P5: JSunmiFaceImageFeatures): Integer; cdecl;
    {class} function SunmiFaceCompare1v1(P1: Int64; P2: Int64; P3: JSunmiFaceFeature; P4: Int64; P5: JSunmiFaceFeature; P6: Int64; P7: JSunmiFaceCompareResult): Integer; cdecl;
    {class} function SunmiFaceReleaseImageFeatures(P1: Int64; P2: JSunmiFaceImageFeatures): Integer; cdecl;
    {class} function SunmiFaceInitDB(P1: Int64; P2: JString): Integer; cdecl;
    {class} function SunmiFaceAddDBRecord(P1: Int64; P2: Int64; P3: JSunmiFaceDBRecord): Integer; cdecl;
    {class} function SunmiFaceSearchDB(P1: Int64; P2: Int64; P3: JSunmiFaceDBRecord; P4: Int64; P5: JSunmiFaceDBIdInfo): Integer; cdecl;
    {class} function SunmiFaceDeleteDBRecord(P1: Int64; P2: JString): Integer; cdecl;
    {class} function new_SunmiFaceFeatureArray(P1: Integer): Int64; cdecl;
    {class} procedure delete_SunmiFaceFeatureArray(P1: Int64; P2: JSunmiFaceFeature); cdecl;
    {class} function SunmiFaceFeatureArray_getitem(P1: Int64; P2: JSunmiFaceFeature; P3: Integer): Int64; cdecl;
    {class} procedure SunmiFaceFeatureArray_setitem(P1: Int64; P2: JSunmiFaceFeature; P3: Integer; P4: Int64; P5: JSunmiFaceFeature); cdecl;
    {class} function new_SunmiFaceLmkArray(P1: Integer): Int64; cdecl;
    {class} procedure delete_SunmiFaceLmkArray(P1: Int64; P2: JSunmiFaceLmk); cdecl;
    {class} function SunmiFaceLmkArray_getitem(P1: Int64; P2: JSunmiFaceLmk; P3: Integer): Int64; cdecl;
    {class} procedure SunmiFaceLmkArray_setitem(P1: Int64; P2: JSunmiFaceLmk; P3: Integer; P4: Int64; P5: JSunmiFaceLmk); cdecl;
//    {class} function init: JSunmiFaceLibJNI; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceLibJNI')]
  JSunmiFaceLibJNI = interface(JObject)
  ['{9739F1EB-988A-4561-8758-3F2B7CDF2AA3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceLibJNI = class(TJavaGenericImport<JSunmiFaceLibJNIClass, JSunmiFaceLibJNI>) end;

  JSunmiFaceLivenessModeClass = interface(JObjectClass)
  ['{D53107B7-A899-4B0C-A4D6-70BCB53ED9DD}']
    { static Property Methods }
    {class} function _GetLivenessMode_None: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLivenessMode_RGB: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLivenessMode_NIR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLivenessMode_Depth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSunmiFaceLivenessMode; cdecl;

    { static Property }
    {class} property LivenessMode_None: Integer read _GetLivenessMode_None;
    {class} property LivenessMode_RGB: Integer read _GetLivenessMode_RGB;
    {class} property LivenessMode_NIR: Integer read _GetLivenessMode_NIR;
    {class} property LivenessMode_Depth: Integer read _GetLivenessMode_Depth;
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceLivenessMode')]
  JSunmiFaceLivenessMode = interface(JObject)
  ['{9F91BE9A-4B8E-42B9-9497-231A0473535B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceLivenessMode = class(TJavaGenericImport<JSunmiFaceLivenessModeClass, JSunmiFaceLivenessMode>) end;

  JSunmiFaceLmkClass = interface(JObjectClass)
  ['{9FA9B45F-D4AE-4844-B3FE-C79A77E2BE71}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceLmk; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceLmk): Int64; cdecl;
    {class} function init: JSunmiFaceLmk; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceLmk')]
  JSunmiFaceLmk = interface(JObject)
  ['{C7971A20-AEE3-4CF4-B345-41C517E8C43B}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setX(P1: Single); cdecl;
    function getX: Single; cdecl;
    procedure setY(P1: Single); cdecl;
    function getY: Single; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceLmk = class(TJavaGenericImport<JSunmiFaceLmkClass, JSunmiFaceLmk>) end;

  JSunmiFaceModeClass = interface(JObjectClass)
  ['{AA8812DB-C7D8-421C-8A22-D44B1DB82C9C}']
    { static Property Methods }
    {class} function _GetPredictMode_None: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPredictMode_Detect: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPredictMode_Feature: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPredictMode_Age: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPredictMode_Gender: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSunmiFaceMode; cdecl;

    { static Property }
    {class} property PredictMode_None: Integer read _GetPredictMode_None;
    {class} property PredictMode_Detect: Integer read _GetPredictMode_Detect;
    {class} property PredictMode_Feature: Integer read _GetPredictMode_Feature;
    {class} property PredictMode_Age: Integer read _GetPredictMode_Age;
    {class} property PredictMode_Gender: Integer read _GetPredictMode_Gender;
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceMode')]
  JSunmiFaceMode = interface(JObject)
  ['{BDB94781-C024-4023-AA98-54E06CD65317}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceMode = class(TJavaGenericImport<JSunmiFaceModeClass, JSunmiFaceMode>) end;

  JSunmiFacePoseClass = interface(JObjectClass)
  ['{BCE61739-3C60-4DBD-9DA1-EAB0C67720AF}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFacePose; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFacePose): Int64; cdecl;
    {class} function init: JSunmiFacePose; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFacePose')]
  JSunmiFacePose = interface(JObject)
  ['{20B1B81C-C5B9-4984-9EC6-A8A94CE56DD8}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setPitch(P1: Single); cdecl;
    function getPitch: Single; cdecl;
    procedure setYaw(P1: Single); cdecl;
    function getYaw: Single; cdecl;
    procedure setRoll(P1: Single); cdecl;
    function getRoll: Single; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFacePose = class(TJavaGenericImport<JSunmiFacePoseClass, JSunmiFacePose>) end;

  JSunmiFaceRectClass = interface(JObjectClass)
  ['{0E007813-9D7C-44A1-8219-7C80A896D567}']
    { static Property Methods }

    { static Methods }
    {class} function init(P1: Int64; P2: Boolean): JSunmiFaceRect; cdecl; overload;
    {class} function getCPtr(P1: JSunmiFaceRect): Int64; cdecl;
    {class} function init: JSunmiFaceRect; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceRect')]
  JSunmiFaceRect = interface(JObject)
  ['{CCD18BA1-21C1-4C30-BDEB-58CF95D07072}']
    { Property Methods }
    function _GetswigCPtr: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCPtr(aswigCPtr: Int64);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetswigCMemOwn: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetswigCMemOwn(aswigCMemOwn: Boolean);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    procedure delete; cdecl;
    procedure setX1(P1: Single); cdecl;
    function getX1: Single; cdecl;
    procedure setY1(P1: Single); cdecl;
    function getY1: Single; cdecl;
    procedure setX2(P1: Single); cdecl;
    function getX2: Single; cdecl;
    procedure setY2(P1: Single); cdecl;
    function getY2: Single; cdecl;
    procedure setScore(P1: Single); cdecl;
    function getScore: Single; cdecl;

    { Property }
    property swigCPtr: Int64 read _GetswigCPtr write _SetswigCPtr;
    property swigCMemOwn: Boolean read _GetswigCMemOwn write _SetswigCMemOwn;
  end;

  TJSunmiFaceRect = class(TJavaGenericImport<JSunmiFaceRectClass, JSunmiFaceRect>) end;

  JSunmiFaceSDKClass = interface(JObjectClass)
  ['{22A01F25-CD38-4506-9FEA-4BEDA48E7678}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSunmiFaceSDK; cdecl; overload;
    {class} function getVersion: JString; cdecl;
    {class} function init(P1: JString): Integer; cdecl; overload;
    {class} function verifyLicense(P1: JContext; P2: JString): Integer; cdecl;
    {class} function getDeviceFingerprint(P1: JContext): JString; cdecl;
    {class} function getErrorString(P1: Integer): JString; cdecl;
    {class} function setConfig(P1: JSunmiFaceConfigParam): Integer; cdecl;
    {class} function getConfig(P1: JSunmiFaceConfigParam): Integer; cdecl;
    {class} function faceFeature2FaceDBRecord(P1: JSunmiFaceFeature): JSunmiFaceDBRecord; cdecl;
    {class} function addDBRecord(P1: JSunmiFaceDBRecord): Integer; cdecl;
    {class} function getImageFeatures(P1: JSunmiFaceImage; P2: JSunmiFaceImageFeatures): Integer; cdecl;
    {class} function searchDB(P1: JSunmiFaceDBRecord; P2: JSunmiFaceDBIdInfo): Integer; cdecl;
    {class} function compare1v1(P1: JSunmiFaceFeature; P2: JSunmiFaceFeature; P3: JSunmiFaceCompareResult): Integer; cdecl;
    {class} function releaseImageFeatures(P1: JSunmiFaceImageFeatures): Integer; cdecl;
    {class} function initDB(P1: JString): Integer; cdecl;
    {class} function deleteDBRecord(P1: JString): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceSDK')]
  JSunmiFaceSDK = interface(JObject)
  ['{A21A2E28-2059-48D3-92F5-D818924C5C7B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceSDK = class(TJavaGenericImport<JSunmiFaceSDKClass, JSunmiFaceSDK>) end;

  JSunmiFaceStatusCodeClass = interface(JObjectClass)
  ['{B6561094-13AF-4E36-86BC-0387B7E0530C}']
    { static Property Methods }
    {class} function _GetFACE_CODE_OK: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_UNINIT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_EMPTY_IMAGE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_NO_MODEL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_CONFIG_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_BAD_ILLUMINATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_POSE_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_SMALL_FACE_SIZE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_LOW_IMAGE_QUALITY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_NOT_LIVENESS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_LICENSE_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_LICENSE_EXPIRED: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_FACE_DB_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_IMAGE_ID_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFACE_CODE_OTHER_ERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JSunmiFaceStatusCode; cdecl;

    { static Property }
    {class} property FACE_CODE_OK: Integer read _GetFACE_CODE_OK;
    {class} property FACE_CODE_UNINIT: Integer read _GetFACE_CODE_UNINIT;
    {class} property FACE_CODE_EMPTY_IMAGE: Integer read _GetFACE_CODE_EMPTY_IMAGE;
    {class} property FACE_CODE_NO_MODEL: Integer read _GetFACE_CODE_NO_MODEL;
    {class} property FACE_CODE_CONFIG_ERROR: Integer read _GetFACE_CODE_CONFIG_ERROR;
    {class} property FACE_CODE_BAD_ILLUMINATION: Integer read _GetFACE_CODE_BAD_ILLUMINATION;
    {class} property FACE_CODE_POSE_ERROR: Integer read _GetFACE_CODE_POSE_ERROR;
    {class} property FACE_CODE_SMALL_FACE_SIZE: Integer read _GetFACE_CODE_SMALL_FACE_SIZE;
    {class} property FACE_CODE_LOW_IMAGE_QUALITY: Integer read _GetFACE_CODE_LOW_IMAGE_QUALITY;
    {class} property FACE_CODE_NOT_LIVENESS: Integer read _GetFACE_CODE_NOT_LIVENESS;
    {class} property FACE_CODE_LICENSE_ERROR: Integer read _GetFACE_CODE_LICENSE_ERROR;
    {class} property FACE_CODE_LICENSE_EXPIRED: Integer read _GetFACE_CODE_LICENSE_EXPIRED;
    {class} property FACE_CODE_FACE_DB_ERROR: Integer read _GetFACE_CODE_FACE_DB_ERROR;
    {class} property FACE_CODE_IMAGE_ID_ERROR: Integer read _GetFACE_CODE_IMAGE_ID_ERROR;
    {class} property FACE_CODE_OTHER_ERROR: Integer read _GetFACE_CODE_OTHER_ERROR;
  end;

  [JavaSignature('com/sunmi/facelib/SunmiFaceStatusCode')]
  JSunmiFaceStatusCode = interface(JObject)
  ['{DD4D42CA-CD85-4161-8A8D-9D0F32507A65}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSunmiFaceStatusCode = class(TJavaGenericImport<JSunmiFaceStatusCodeClass, JSunmiFaceStatusCode>) end;



{$ENDIF}
implementation

end.

