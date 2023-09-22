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
//  生成时间：2023-07-24 13:48:16
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.mysunmipayv2;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.PayLib_release_1_4_65_aar;



type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.mysummipayv2.BuildConfig
  JMyReadCardCallbackClass = interface; //com.ggggcexx.mysummipayv2.MyReadCardCallbackClass
  JMyReadCardCallbackListener = interface; //com.ggggcexx.mysummipayv2.MyReadCardCallbackListener
  Jtest = interface; //com.ggggcexx.mysummipayv2.test
  JUtility = interface; //com.ggggcexx.mysummipayv2.Utility
  JByteUtil = interface; //com.sm.sdk.demo.utils.ByteUtil

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{90C30545-CB09-4F3B-B186-85C3C5D0FF7C}']
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

  [JavaSignature('com/ggggcexx/mysummipayv2/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{3DEAE5D9-048C-4B49-AD90-19D081C84BED}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JMyReadCardCallbackClassClass = interface(JCheckCardCallbackV2_StubClass) // or JObjectClass
  ['{62D3E6A4-5D41-4A33-8208-40EA4D8C813E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMyReadCardCallbackClass; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mysummipayv2/MyReadCardCallbackClass')]
  JMyReadCardCallbackClass = interface(JCheckCardCallbackV2_Stub) // or JObject
  ['{0A6D9CFF-6FEF-4D06-99B1-4ABB463E3A73}']
    { Property Methods }

    { methods }
    procedure setMyReadCardCallbackListener(AMyReadCardCallbackListener: JMyReadCardCallbackListener); cdecl;
    procedure findMagCard(info: JBundle); cdecl;
    procedure findICCard(atr: JString); cdecl;
    procedure findRFCard(uuid: JString); cdecl;
    procedure onError(code: Integer; amessage: JString); cdecl;
    procedure findICCardEx(info: JBundle); cdecl;
    procedure findRFCardEx(info: JBundle); cdecl;
    procedure onErrorEx(bundle: JBundle); cdecl;

    { Property }
  end;

  TJMyReadCardCallbackClass = class(TJavaGenericImport<JMyReadCardCallbackClassClass, JMyReadCardCallbackClass>) end;

  JMyReadCardCallbackListenerClass = interface(JObjectClass)
  ['{720E04D3-33A6-42EC-8378-1456F2108433}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mysummipayv2/MyReadCardCallbackListener')]
  JMyReadCardCallbackListener = interface(IJavaInstance)
  ['{6B6D5764-47A0-400D-ACB4-75F7F2E3FCBE}']
    { Property Methods }

    { methods }
    procedure findMagCard(P1: JBundle); cdecl;
    procedure findICCard(P1: JString); cdecl;
    procedure findRFCard(P1: JString); cdecl;
    procedure onError(P1: Integer; P2: JString); cdecl;
    procedure findICCardEx(P1: JBundle); cdecl;
    procedure findRFCardEx(P1: JBundle); cdecl;
    procedure onErrorEx(P1: JBundle); cdecl;

    { Property }
  end;

  TJMyReadCardCallbackListener = class(TJavaGenericImport<JMyReadCardCallbackListenerClass, JMyReadCardCallbackListener>) end;

  JtestClass = interface(JObjectClass)
  ['{E18D98BE-8631-4A71-9555-BD991F9691F3}']
    { static Property Methods }

    { static Methods }
    {class} function init: Jtest; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mysummipayv2/test')]
  Jtest = interface(JObject)
  ['{EEBA56F2-C1D2-4456-9F0D-EEECDAC4F797}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJtest = class(TJavaGenericImport<JtestClass, Jtest>) end;

  JUtilityClass = interface(JObjectClass)
  ['{581F3B14-5CF6-49C2-BCCA-389EFFFC1495}']
    { static Property Methods }

    { static Methods }
    {class} function bundle2String(bundle: JBundle): JString; cdecl; overload;
    {class} function bundle2String(bundle: JBundle; order: Integer): JString; cdecl; overload;
    {class} function null2String(str: JString): JString; cdecl;
    {class} function formatStr(format: JString; params: TJavaObjectArray<JObject>): JString; cdecl;
    {class} function checkHexValue(src: JString): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/mysummipayv2/Utility')]
  JUtility = interface(JObject)
  ['{E90B02B3-84DF-461C-A431-DA0E9279D6FF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUtility = class(TJavaGenericImport<JUtilityClass, JUtility>) end;

  JByteUtilClass = interface(JObjectClass)
  ['{8ACD59B2-902A-4D91-9CA7-93019C67C6CF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteUtil; cdecl;
    {class} function byte2PrintHex(raw: TJavaArray<Byte>; offset: Integer; count: Integer): JString; cdecl;
    {class} function bytes2HexStr(bytes: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function bytes2HexStr(src: TJavaArray<Byte>; offset: Integer; len: Integer): JString; cdecl; overload;
    {class} function hexStr2Bytes(hexStr: JString): TJavaArray<Byte>; cdecl;
    {class} function hexStr2Byte(hexStr: JString): Byte; cdecl;
    {class} function hexStr2Str(hexStr: JString): JString; cdecl;
    {class} function hexStr2AsciiStr(hexStr: JString): JString; cdecl;
    {class} function unsignedShort2IntBE(src: TJavaArray<Byte>; offset: Integer): Integer; cdecl;
    {class} function unsignedShort2IntLE(src: TJavaArray<Byte>; offset: Integer): Integer; cdecl;
    {class} function unsignedByte2Int(src: TJavaArray<Byte>; offset: Integer): Integer; cdecl;
    {class} function unsignedInt2IntBE(src: TJavaArray<Byte>; offset: Integer): Integer; cdecl;
    {class} function unsignedInt2IntLE(src: TJavaArray<Byte>; offset: Integer): Integer; cdecl;
    {class} function int2BytesBE(src: Integer): TJavaArray<Byte>; cdecl;
    {class} function int2BytesLE(src: Integer): TJavaArray<Byte>; cdecl;
    {class} function short2BytesBE(src: Word): TJavaArray<Byte>; cdecl;
    {class} function short2BytesLE(src: Word): TJavaArray<Byte>; cdecl;
    {class} function concatByteArrays(list: TJavaArray<Byte>): TJavaArray<Byte>; cdecl; overload;
    {class} function concatByteArrays(list: JList): TJavaArray<Byte>; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/sm/sdk/demo/utils/ByteUtil')]
  JByteUtil = interface(JObject)
  ['{B2A5460D-FB59-4813-9E03-25DC7A2DEC2D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteUtil = class(TJavaGenericImport<JByteUtilClass, JByteUtil>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.mysunmipayv2.JBuildConfig', 
    TypeInfo(Androidapi.JNI.mysunmipayv2.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.mysunmipayv2.JMyReadCardCallbackClass', 
    TypeInfo(Androidapi.JNI.mysunmipayv2.JMyReadCardCallbackClass));
  TRegTypes.RegisterType('Androidapi.JNI.mysunmipayv2.JMyReadCardCallbackListener', 
    TypeInfo(Androidapi.JNI.mysunmipayv2.JMyReadCardCallbackListener));
  TRegTypes.RegisterType('Androidapi.JNI.mysunmipayv2.Jtest', 
    TypeInfo(Androidapi.JNI.mysunmipayv2.Jtest));
  TRegTypes.RegisterType('Androidapi.JNI.mysunmipayv2.JUtility', 
    TypeInfo(Androidapi.JNI.mysunmipayv2.JUtility));
  TRegTypes.RegisterType('Androidapi.JNI.mysunmipayv2.JByteUtil', 
    TypeInfo(Androidapi.JNI.mysunmipayv2.JByteUtil));
end;


initialization
  RegisterTypes;

end.
