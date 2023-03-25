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
//  生成时间：2022-05-09 14:48:39
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.image_2_0_10_release_aar;

interface

uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.jingchen.jcimagesdk.BuildConfig
  JImageParam = interface; //com.jingchen.jcimagesdk.ImageParam
  JJcImageSdkApi = interface; //com.jingchen.jcimagesdk.JcImageSdkApi

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{09575A32-E325-4F86-9314-95430642A2FB}']
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

  [JavaSignature('com/jingchen/jcimagesdk/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{55125872-8EDB-4FA5-8528-700442758D8A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JImageParamClass = interface(JObjectClass)
  ['{EC10724C-2220-4727-B5E3-FE8970C5010D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JImageParam; cdecl;

    { static Property }
  end;

  [JavaSignature('com/jingchen/jcimagesdk/ImageParam')]
  JImageParam = interface(JObject)
  ['{3E3FA691-33F5-4491-B038-F43E408A064B}']
    { Property Methods }
    function _Getdata: TJavaArray<Byte>;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setdata(adata: TJavaArray<Byte>);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getchannels: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setchannels(achannels: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getwidth: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setwidth(awidth: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getheight: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setheight(aheight: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getx: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setx(ax: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Gety: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Sety(ay: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetefontSize: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetefontSize(aefontSize: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeterrorCode: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeterrorCode(aerrorCode: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GeterrorInfo: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SeterrorInfo(aerrorInfo: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property data: TJavaArray<Byte> read _Getdata write _Setdata;
    property channels: Integer read _Getchannels write _Setchannels;
    property width: Integer read _Getwidth write _Setwidth;
    property height: Integer read _Getheight write _Setheight;
    property x: Integer read _Getx write _Setx;
    property y: Integer read _Gety write _Sety;
    property efontSize: Integer read _GetefontSize write _SetefontSize;
    property errorCode: Integer read _GeterrorCode write _SeterrorCode;
    property errorInfo: JString read _GeterrorInfo write _SeterrorInfo;
  end;

  TJImageParam = class(TJavaGenericImport<JImageParamClass, JImageParam>) end;

  JJcImageSdkApiClass = interface(JObjectClass)
  ['{EC8B7AA9-6408-486A-9429-16A9B5249323}']
    { static Property Methods }

    { static Methods }
    {class} function init: JJcImageSdkApi; cdecl;
    {class} function drawBitmap(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer; P6: Integer): TJavaArray<Byte>; cdecl;
    {class} function imageMarginPro(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl;
    {class} function imageCrop(P1: JString; P2: Integer; P3: Integer; P4: Integer; P5: Integer): TJavaArray<Byte>; cdecl;
    {class} function thresholdImageProcess(P1: JString; P2: Boolean; P3: Double; P4: Integer; P5: Boolean): TJavaArray<Byte>; cdecl;
    {class} function gradientImageProcess(P1: JString; P2: Double; P3: Boolean): TJavaArray<Byte>; cdecl;
    {class} function initImageProcessingDefault(P1: JString; P2: JString): Integer; cdecl;
    {class} function generatePrintPreviewImage(P1: JString; P2: Single; P3: Single; P4: Integer): JImageParam; cdecl;
    {class} function mmToInch(P1: Single): Single; cdecl;
    {class} function inchToMm(P1: Single): Single; cdecl;
    {class} function getDisplayMultiple(P1: Single; P2: Integer): Single; cdecl;
    {class} function mmToPixel(P1: Single; P2: Single): Integer; cdecl;
    {class} function pixelToMm(P1: Integer; P2: Single): Single; cdecl;
    {class} function generatePrintData(P1: JString; P2: JString): JImageParam; cdecl;
    {class} function generateTextPreviewImage(P1: JString; P2: Single; P3: Single): JImageParam; cdecl;
    {class} function generateTimePreviewImage(P1: JString; P2: Single; P3: Single): JImageParam; cdecl;
    {class} function generateSerialNumberPreviewImage(P1: JString; P2: Single; P3: Single): JImageParam; cdecl;
    {class} function generateBarcodePreviewImage(P1: JString; P2: Single): JImageParam; cdecl;
    {class} function generateQrCodePreviewImage(P1: JString; P2: Single): JImageParam; cdecl;
    {class} function generateLinePreviewImage(P1: JString; P2: Single): JImageParam; cdecl;
    {class} function generateGraphPreviewImage(P1: JString; P2: Single): JImageParam; cdecl;
    {class} function generateImagePreviewImage(P1: JString; P2: TJavaArray<Byte>; P3: Int64; P4: Single): JImageParam; cdecl;
    {class} function generateTablePreviewImage(P1: JString; P2: Single; P3: Single): JImageParam; cdecl;
    {class} function barcodeFormatCheck(P1: Integer; P2: JString): Integer; cdecl;
    {class} function qrcodeFormatCheck(P1: Integer; P2: JString): Integer; cdecl;
    {class} procedure createImg(P1: TJavaArray<Byte>; P2: Int64; P3: Int64; P4: Integer; P5: JString); cdecl;
    {class} procedure getVersion; cdecl;
    {class} procedure isLogInfo(P1: Boolean); cdecl;
    {class} procedure InitDrawingBoard(P1: Single; P2: Single; P3: Integer; P4: JString); cdecl;
    {class} procedure DrawLableText(P1: Single; P2: Single; P3: Single; P4: Single; P5: JString; P6: JString; P7: Single; P8: Integer; P9: Integer; P10: Integer; P11: Integer; P12: Single; P13: Single; P14: TJavaArray<Boolean>); cdecl;
    {class} procedure DrawLableBarCode(P1: Single; P2: Single; P3: Single; P4: Single; P5: Integer; P6: JString; P7: Single; P8: Integer; P9: Single; P10: Integer); cdecl;
    {class} procedure DrawLableQrCode(P1: Single; P2: Single; P3: Single; P4: Single; P5: JString; P6: Integer; P7: Integer); cdecl;
    {class} procedure DrawLableLine(P1: Single; P2: Single; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: TJavaArray<Single>); cdecl;
    {class} procedure DrawLableGraph(P1: Single; P2: Single; P3: Single; P4: Single; P5: Integer; P6: Integer; P7: Single; P8: Single; P9: Integer; P10: TJavaArray<Single>); cdecl;
    {class} procedure DrawLableImage(P1: JString; P2: Single; P3: Single; P4: Single; P5: Single; P6: Integer; P7: Integer; P8: Single); cdecl;
    {class} function GenerateLableJson: TJavaArray<Byte>; cdecl;

    { static Property }
  end;

  [JavaSignature('com/jingchen/jcimagesdk/JcImageSdkApi')]
  JJcImageSdkApi = interface(JObject)
  ['{AB16C185-C211-4979-A97C-8929EA4C7D11}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJcImageSdkApi = class(TJavaGenericImport<JJcImageSdkApiClass, JJcImageSdkApi>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.image_2_0_10_release_aar.JBuildConfig', 
    TypeInfo(Androidapi.JNI.image_2_0_10_release_aar.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.image_2_0_10_release_aar.JImageParam', 
    TypeInfo(Androidapi.JNI.image_2_0_10_release_aar.JImageParam));
  TRegTypes.RegisterType('Androidapi.JNI.image_2_0_10_release_aar.JJcImageSdkApi', 
    TypeInfo(Androidapi.JNI.image_2_0_10_release_aar.JJcImageSdkApi));
end;


initialization
  RegisterTypes;

end.
