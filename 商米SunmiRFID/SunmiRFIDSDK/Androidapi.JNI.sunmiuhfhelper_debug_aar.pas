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
//  生成时间：2020/12/16 16:11:49
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.sunmiuhfhelper_debug_aar;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar;
//  Androidapi.JNI.com.sunmi.rfid.entity.DataParameter;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.ggggcexx.sunmiuhfhelper.BuildConfig
  JMyIReaderCall = interface; //com.ggggcexx.sunmiuhfhelper.MyIReaderCall
  JMyReaderCall = interface; //com.ggggcexx.sunmiuhfhelper.MyReaderCall

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{F632F200-0601-4570-8FCA-CDE8FDBA194F}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetLIBRARY_PACKAGE_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JBuildConfig; cdecl; //()V

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
  end;

  [JavaSignature('com/ggggcexx/sunmiuhfhelper/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{EAAF9548-B6C0-4B30-9A96-0CAE1EC77E4A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JMyIReaderCallClass = interface(JObjectClass)
  ['{1027C1E2-6DE7-439B-B266-8A93A55BCF16}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/ggggcexx/sunmiuhfhelper/MyIReaderCall')]
  JMyIReaderCall = interface(IJavaInstance)
  ['{DBC2C878-9DB0-4C79-890F-6CC2BB6C7342}']
    { Property Methods }

    { methods }
    procedure onSuccess(P1: Byte; P2: JDataParameter); cdecl; //(BLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onTag(P1: Byte; P2: Byte; P3: JDataParameter); cdecl; //(BBLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onFiled(P1: Byte; P2: Byte; P3: JString); cdecl; //(BBLjava/lang/String;)V

    { Property }
  end;

  TJMyIReaderCall = class(TJavaGenericImport<JMyIReaderCallClass, JMyIReaderCall>) end;

  JMyReaderCallClass = interface(JReaderCallClass) // or JObjectClass // SuperSignature: com/sunmi/rfid/ReaderCall
  ['{03B9DFDC-14CB-446F-B206-142C7F99BDEC}']
    { static Property Methods }
    {class} function _GetFMyIReaderCall: JMyIReaderCall;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/ggggcexx/sunmiuhfhelper/MyIReaderCall;

    { static Methods }
    {class} function init: JMyReaderCall; cdecl; //()V
    {class} procedure setMyIReaderCall(AMyIReaderCall: JMyIReaderCall); cdecl; //(Lcom/ggggcexx/sunmiuhfhelper/MyIReaderCall;)V

    { static Property }
    {class} property FMyIReaderCall: JMyIReaderCall read _GetFMyIReaderCall;
  end;

  [JavaSignature('com/ggggcexx/sunmiuhfhelper/MyReaderCall')]
  JMyReaderCall = interface(JReaderCall) // or JObject // SuperSignature: com/sunmi/rfid/ReaderCall
  ['{988B66F4-0FC8-47D6-B700-7BAE147E19E9}']
    { Property Methods }

    { methods }
    procedure onSuccess(cmd: Byte; params: JDataParameter); cdecl; //(BLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onTag(cmd: Byte; state: Byte; tag: JDataParameter); cdecl; //(BBLcom/sunmi/rfid/entity/DataParameter;)V
    procedure onFiled(cmd: Byte; errorCode: Byte; msg: JString); cdecl; //(BBLjava/lang/String;)V

    { Property }
  end;

  TJMyReaderCall = class(TJavaGenericImport<JMyReaderCallClass, JMyReaderCall>) end;

{$ENDIF}
implementation
//{$IFDEF ANDROID}
//
//
//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiuhfhelper_debug_aar.JBuildConfig',
//    TypeInfo(Androidapi.JNI.sunmiuhfhelper_debug_aar.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiuhfhelper_debug_aar.JMyIReaderCall',
//    TypeInfo(Androidapi.JNI.sunmiuhfhelper_debug_aar.JMyIReaderCall));
//  TRegTypes.RegisterType('Androidapi.JNI.sunmiuhfhelper_debug_aar.JMyReaderCall',
//    TypeInfo(Androidapi.JNI.sunmiuhfhelper_debug_aar.JMyReaderCall));
//end;
//
//
//initialization
//  RegisterTypes;
//
//{$ENDIF}

end.
