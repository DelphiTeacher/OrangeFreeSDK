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
//  生成时间：2020-10-27 16:27:33
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.libserial_release_aar;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
//  Androidapi.JNI.java.nio.charset.Charset,
//  Androidapi.JNI.java.nio.ByteBuffer,
  Androidapi.JNI.JavaTypes;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //serial.android.BuildConfig
  JByteSize = interface; //serial.ByteSize
  JFlowControl = interface; //serial.FlowControl
  JLog = interface; //serial.Log
  JParity = interface; //serial.Parity
  JPortInfo = interface; //serial.PortInfo
  JPortNotOpenedException = interface; //serial.PortNotOpenedException
//  JSerial_1 = interface; //serial.Serial$1
  JSerial_Builder = interface; //serial.Serial$Builder
  JSerial = interface; //serial.Serial
  JSerialException = interface; //serial.SerialException
  JSerialIOException = interface; //serial.SerialIOException
  JStopbits = interface; //serial.Stopbits
  JTimeout = interface; //serial.Timeout

// ===== Forward SuperClasses declarations =====


// ===== Interface declarations =====

  JBuildConfigClass = interface(JObjectClass)
  ['{877DC7F1-92B1-4F17-B797-B9A5A9655589}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

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

  [JavaSignature('serial/android/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{0830D0E4-6563-4B48-9BE3-E1867343E170}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JByteSizeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{B4B08F1D-FB5C-46C8-9CB5-0EEC98D9C63A}']
    { static Property Methods }
    {class} function _GetFiveBits: JByteSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/ByteSize;
    {class} function _GetSixBits: JByteSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/ByteSize;
    {class} function _GetSevenBits: JByteSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/ByteSize;
    {class} function _GetEightBits: JByteSize;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/ByteSize;

    { static Methods }
    {class} function values: TJavaObjectArray<JByteSize>; cdecl; //()[Lserial/ByteSize;
    {class} function valueOf(name: JString): JByteSize; cdecl; //(Ljava/lang/String;)Lserial/ByteSize;

    { static Property }
    {class} property FiveBits: JByteSize read _GetFiveBits;
    {class} property SixBits: JByteSize read _GetSixBits;
    {class} property SevenBits: JByteSize read _GetSevenBits;
    {class} property EightBits: JByteSize read _GetEightBits;
  end;

  [JavaSignature('serial/ByteSize')]
  JByteSize = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{FAB18686-4ACB-47E6-96F5-A60C315A2F47}']
    { Property Methods }
    function _GetbitLength: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _SetbitLength(abitLength: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }

    { Property }
    property bitLength: Integer read _GetbitLength write _SetbitLength;
  end;

  TJByteSize = class(TJavaGenericImport<JByteSizeClass, JByteSize>) end;

  JFlowControlClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{AF9BED63-A36B-4AA4-BC57-8E67B2FB61EC}']
    { static Property Methods }
    {class} function _GetNone: JFlowControl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/FlowControl;
    {class} function _GetSoftware: JFlowControl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/FlowControl;
    {class} function _GetHardware: JFlowControl;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/FlowControl;

    { static Methods }
    {class} function values: TJavaObjectArray<JFlowControl>; cdecl; //()[Lserial/FlowControl;
    {class} function valueOf(name: JString): JFlowControl; cdecl; //(Ljava/lang/String;)Lserial/FlowControl;

    { static Property }
    {class} property None: JFlowControl read _GetNone;
    {class} property Software: JFlowControl read _GetSoftware;
    {class} property Hardware: JFlowControl read _GetHardware;
  end;

  [JavaSignature('serial/FlowControl')]
  JFlowControl = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{BAE96BAB-2141-45AE-9A7B-1056CF17F4F3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFlowControl = class(TJavaGenericImport<JFlowControlClass, JFlowControl>) end;

  JLogClass = interface(JObjectClass)
  ['{F6F0A020-C0AB-4F7B-B172-7B5048C76E04}']
    { static Property Methods }
    {class} function _GetALL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetVERBOSE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEBUG: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetINFO: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetWARN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetERROR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetASSERT: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetNONE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function getApplicationTag: JString; cdecl; //()Ljava/lang/String;
    {class} procedure setApplicationTag(tag: JString); cdecl; //(Ljava/lang/String;)V
    {class} function getFilterLevel: Integer; cdecl; //()I
    {class} procedure setFilterLevel(level: Integer); cdecl; //(I)V
    {class} function v(msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;)I
    {class} function v(tag: JString; msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)I
    {class} function v(tag: JString; format: JString; args: TJavaObjectArray<JObject>): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I
    {class} function v(tag: JString; msg: JString; tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    {class} function d(msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;)I
    {class} function d(tag: JString; msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)I
    {class} function d(tag: JString; format: JString; args: TJavaObjectArray<JObject>): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I
    {class} function d(tag: JString; msg: JString; tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    {class} function i(msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;)I
    {class} function i(tag: JString; msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)I
    {class} function i(tag: JString; format: JString; args: TJavaObjectArray<JObject>): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I
    {class} function i(tag: JString; msg: JString; tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    {class} function w(msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;)I
    {class} function w(tag: JString; msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)I
    {class} function w(tag: JString; format: JString; args: TJavaObjectArray<JObject>): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I
    {class} function w(tag: JString; msg: JString; tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    {class} function isLoggable(tag: JString; level: Integer): Boolean; cdecl; //(Ljava/lang/String;I)Z
    {class} function w(tag: JString; tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Throwable;)I
    {class} function w(tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/Throwable;)I
    {class} function e(tag: JString; format: JString; args: TJavaObjectArray<JObject>): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)I
    {class} function e(msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;)I
    {class} function e(tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/Throwable;)I
    {class} function e(tag: JString; msg: JString): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)I
    {class} function e(msg: JString; tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Throwable;)I
    {class} function e(tag: JString; msg: JString; tr: JThrowable): Integer; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    {class} function getStackTraceString(tr: JThrowable): JString; cdecl; //(Ljava/lang/Throwable;)Ljava/lang/String;
    {class} function println(priority: Integer; tag: JString; msg: JString): Integer; cdecl; //(ILjava/lang/String;Ljava/lang/String;)I
    {class} procedure myAssert(condition: Boolean; amessage: JString); cdecl; //(ZLjava/lang/String;)V
    {class} function getCallerFrame: JStackTraceElement; cdecl; //()Ljava/lang/StackTraceElement;
    {class} function getCurrentFrame: JStackTraceElement; cdecl; //()Ljava/lang/StackTraceElement;
    {class} function getStackFrameAt(offset: Integer): JStackTraceElement; cdecl; //(I)Ljava/lang/StackTraceElement;

    { static Property }
    {class} property ALL: Integer read _GetALL;
    {class} property VERBOSE: Integer read _GetVERBOSE;
    {class} property DEBUG: Integer read _GetDEBUG;
    {class} property INFO: Integer read _GetINFO;
    {class} property WARN: Integer read _GetWARN;
    {class} property ERROR: Integer read _GetERROR;
    {class} property ASSERT: Integer read _GetASSERT;
    {class} property NONE: Integer read _GetNONE;
  end;

  [JavaSignature('serial/Log')]
  JLog = interface(JObject)
  ['{B3FF9953-A483-4234-8CC4-989930D41FB2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLog = class(TJavaGenericImport<JLogClass, JLog>) end;

  JParityClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{C2262EE9-AADF-406A-B06C-A6DCBE0EC7D9}']
    { static Property Methods }
    {class} function _GetNone: JParity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/Parity;
    {class} function _GetOdd: JParity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/Parity;
    {class} function _GetEven: JParity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/Parity;
    {class} function _GetMark: JParity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/Parity;
    {class} function _GetSpace: JParity;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/Parity;

    { static Methods }
    {class} function values: TJavaObjectArray<JParity>; cdecl; //()[Lserial/Parity;
    {class} function valueOf(name: JString): JParity; cdecl; //(Ljava/lang/String;)Lserial/Parity;

    { static Property }
    {class} property None: JParity read _GetNone;
    {class} property Odd: JParity read _GetOdd;
    {class} property Even: JParity read _GetEven;
    {class} property Mark: JParity read _GetMark;
    {class} property Space: JParity read _GetSpace;
  end;

  [JavaSignature('serial/Parity')]
  JParity = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{AED5AB6C-E976-465D-9268-F953EE3E6014}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJParity = class(TJavaGenericImport<JParityClass, JParity>) end;

  JPortInfoClass = interface(JObjectClass)
  ['{E8B9B951-89C4-4850-8ACF-49D2F2794895}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('serial/PortInfo')]
  JPortInfo = interface(JObject)
  ['{7B133B63-3529-40A3-9F2C-C56A968B9202}']
    { Property Methods }
    function _Getport: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setport(aport: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _Getdescription: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _Setdescription(adescription: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V
    function _GethardwareId: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    procedure _SethardwareId(ahardwareId: JString);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/lang/String;)V

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
    property port: JString read _Getport write _Setport;
    property description: JString read _Getdescription write _Setdescription;
    property hardwareId: JString read _GethardwareId write _SethardwareId;
  end;

  TJPortInfo = class(TJavaGenericImport<JPortInfoClass, JPortInfo>) end;

  JPortNotOpenedExceptionClass = interface(JIllegalStateExceptionClass) // or JObjectClass // SuperSignature: java/lang/IllegalStateException
  ['{054AD562-B1A3-4FD3-8F4D-EE14C876EDBF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('serial/PortNotOpenedException')]
  JPortNotOpenedException = interface(JIllegalStateException) // or JObject // SuperSignature: java/lang/IllegalStateException
  ['{21697442-910B-4E8A-B0E9-B212EF1E8BD4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPortNotOpenedException = class(TJavaGenericImport<JPortNotOpenedExceptionClass, JPortNotOpenedException>) end;

//  JSerial_1Class = interface(JObjectClass)
//  ['{1F2EF8A6-604C-4E87-853D-343BD2573300}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;

//  [JavaSignature('serial/Serial$1')]
//  JSerial_1 = interface(JObject)
//  ['{79BE928B-30D5-49B0-9F9A-A29BDA2EBF09}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;

//  TJSerial_1 = class(TJavaGenericImport<JSerial_1Class, JSerial_1>) end;

  JSerial_BuilderClass = interface(JObjectClass)
  ['{32B3B63A-4740-4BA4-9E53-25099624E4AB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSerial_Builder; cdecl; overload; //()V
    {class} function init(port: JString): JSerial_Builder; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(port: JString; baudrate: Integer): JSerial_Builder; cdecl; overload; //(Ljava/lang/String;I)V

    { static Property }
  end;

  [JavaSignature('serial/Serial$Builder')]
  JSerial_Builder = interface(JObject)
  ['{78D7711E-C7E2-4015-90A1-94EB283AC705}']
    { Property Methods }

    { methods }
    function setPort(port: JString): JSerial_Builder; cdecl; //(Ljava/lang/String;)Lserial/Serial$Builder;
    function setBaudrate(baudrate: Integer): JSerial_Builder; cdecl; //(I)Lserial/Serial$Builder;
    function setTimeout(timeout: JTimeout): JSerial_Builder; cdecl; //(Lserial/Timeout;)Lserial/Serial$Builder;
    function setBytesize(bytesize: JByteSize): JSerial_Builder; cdecl; //(Lserial/ByteSize;)Lserial/Serial$Builder;
    function setParity(parity: JParity): JSerial_Builder; cdecl; //(Lserial/Parity;)Lserial/Serial$Builder;
    function setStopbits(stopbits: JStopbits): JSerial_Builder; cdecl; //(Lserial/Stopbits;)Lserial/Serial$Builder;
    function setFlowcontrol(flowcontrol: JFlowControl): JSerial_Builder; cdecl; //(Lserial/FlowControl;)Lserial/Serial$Builder;
    function create: JSerial; cdecl; //()Lserial/Serial;

    { Property }
  end;

  TJSerial_Builder = class(TJavaGenericImport<JSerial_BuilderClass, JSerial_Builder>) end;

  JSerialClass = interface(JObjectClass)
  ['{D865539B-1752-462A-946A-630A2E7F1225}']
    { static Property Methods }
    {class} function _GetBAUDRATE_110: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_300: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_600: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_1200: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_2400: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_4800: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_9600: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_14400: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_28800: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_38400: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_56000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_57600: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_115200: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_128000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_153600: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_230400: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_256000: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_460800: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetBAUDRATE_921600: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetEOL_LF: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetEOL_CR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetEOL_CRLF: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetCHARSET_DEFAULT: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/nio/charset/Charset;
    {class} function _GetCHARSET_UTF8: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/nio/charset/Charset;
    {class} function _GetCHARSET_ISO_8859_1: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/nio/charset/Charset;
    {class} function _GetCHARSET_US_ASCII: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/nio/charset/Charset;
    {class} function _GetCHARSET_UTF16: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/nio/charset/Charset;
    {class} function _GetCHARSET_UTF16LE: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/nio/charset/Charset;
    {class} function _GetCHARSET_UTF16BE: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/nio/charset/Charset;

    { static Methods }
    {class} function listPorts: TJavaObjectArray<JPortInfo>; cdecl; //()[Lserial/PortInfo;

    { static Property }
    {class} property BAUDRATE_110: Integer read _GetBAUDRATE_110;
    {class} property BAUDRATE_300: Integer read _GetBAUDRATE_300;
    {class} property BAUDRATE_600: Integer read _GetBAUDRATE_600;
    {class} property BAUDRATE_1200: Integer read _GetBAUDRATE_1200;
    {class} property BAUDRATE_2400: Integer read _GetBAUDRATE_2400;
    {class} property BAUDRATE_4800: Integer read _GetBAUDRATE_4800;
    {class} property BAUDRATE_9600: Integer read _GetBAUDRATE_9600;
    {class} property BAUDRATE_14400: Integer read _GetBAUDRATE_14400;
    {class} property BAUDRATE_28800: Integer read _GetBAUDRATE_28800;
    {class} property BAUDRATE_38400: Integer read _GetBAUDRATE_38400;
    {class} property BAUDRATE_56000: Integer read _GetBAUDRATE_56000;
    {class} property BAUDRATE_57600: Integer read _GetBAUDRATE_57600;
    {class} property BAUDRATE_115200: Integer read _GetBAUDRATE_115200;
    {class} property BAUDRATE_128000: Integer read _GetBAUDRATE_128000;
    {class} property BAUDRATE_153600: Integer read _GetBAUDRATE_153600;
    {class} property BAUDRATE_230400: Integer read _GetBAUDRATE_230400;
    {class} property BAUDRATE_256000: Integer read _GetBAUDRATE_256000;
    {class} property BAUDRATE_460800: Integer read _GetBAUDRATE_460800;
    {class} property BAUDRATE_921600: Integer read _GetBAUDRATE_921600;
    {class} property EOL_LF: JString read _GetEOL_LF;
    {class} property EOL_CR: JString read _GetEOL_CR;
    {class} property EOL_CRLF: JString read _GetEOL_CRLF;
    {class} property CHARSET_DEFAULT: JCharset read _GetCHARSET_DEFAULT;
    {class} property CHARSET_UTF8: JCharset read _GetCHARSET_UTF8;
    {class} property CHARSET_ISO_8859_1: JCharset read _GetCHARSET_ISO_8859_1;
    {class} property CHARSET_US_ASCII: JCharset read _GetCHARSET_US_ASCII;
    {class} property CHARSET_UTF16: JCharset read _GetCHARSET_UTF16;
    {class} property CHARSET_UTF16LE: JCharset read _GetCHARSET_UTF16LE;
    {class} property CHARSET_UTF16BE: JCharset read _GetCHARSET_UTF16BE;
  end;

  [JavaSignature('serial/Serial')]
  JSerial = interface(JObject)
  ['{78F91D92-3816-40AD-B97B-D346BD6794E0}']
    { Property Methods }

    { methods }
    function isValid: Boolean; cdecl; //()Z
    procedure open; cdecl; //()V
    function isOpen: Boolean; cdecl; //()Z
    procedure close; cdecl; //()V
    function available: Integer; cdecl; //()I
    function waitReadable: Boolean; cdecl; //()Z
    procedure waitByteTimes(count: Integer); cdecl; //(I)V
    function read(buffer: TJavaArray<Byte>; offset: Integer; size: Integer): Integer; cdecl; overload; //([BII)I
    function read: TJavaArray<Byte>; cdecl; overload; //()[B
    function read(buffer: JByteBuffer; size: Integer): Integer; cdecl; overload; //(Ljava/nio/ByteBuffer;I)I
    function read(buffer: JStringBuilder; size: Integer; charset: JCharset): Integer; cdecl; overload; //(Ljava/lang/StringBuilder;ILjava/nio/charset/Charset;)I
    function read(size: Integer; charset: JCharset): JString; cdecl; overload; //(ILjava/nio/charset/Charset;)Ljava/lang/String;
    function readline(buffer: JStringBuilder; size: Integer; eol: JString): Integer; cdecl; overload; //(Ljava/lang/StringBuilder;ILjava/lang/String;)I
    function readline(size: Integer; eol: JString): JString; cdecl; overload; //(ILjava/lang/String;)Ljava/lang/String;
    function readlines(size: Integer; eol: JString): TJavaObjectArray<JString>; cdecl; //(ILjava/lang/String;)[Ljava/lang/String;
    function write(data: TJavaArray<Byte>; size: Integer): Integer; cdecl; overload; //([BI)I
    function write(s: JString): Integer; cdecl; overload; //(Ljava/lang/String;)I
    function getPort: JString; cdecl; //()Ljava/lang/String;
    procedure setPort(port: JString); cdecl; //(Ljava/lang/String;)V
    procedure setTimeout(inter_byte_timeout: Integer; read_timeout_constant: Integer; read_timeout_multiplier: Integer; write_timeout_constant: Integer; write_timeout_multiplier: Integer); cdecl; overload; //(IIIII)V
    function getTimeout: JTimeout; cdecl; //()Lserial/Timeout;
    procedure setTimeout(timeout: JTimeout); cdecl; overload; //(Lserial/Timeout;)V
    function getBaudrate: Integer; cdecl; //()I
    procedure setBaudrate(baudrate: Integer); cdecl; //(I)V
    function getBytesize: JByteSize; cdecl; //()Lserial/ByteSize;
    procedure setBytesize(bytesize: JByteSize); cdecl; //(Lserial/ByteSize;)V
    function getParity: JParity; cdecl; //()Lserial/Parity;
    procedure setParity(parity: JParity); cdecl; //(Lserial/Parity;)V
    function getStopbits: JStopbits; cdecl; //()Lserial/Stopbits;
    procedure setStopbits(stopbits: JStopbits); cdecl; //(Lserial/Stopbits;)V
    function getFlowcontrol: JFlowControl; cdecl; //()Lserial/FlowControl;
    procedure setFlowcontrol(flowcontrol: JFlowControl); cdecl; //(Lserial/FlowControl;)V
    procedure flush; cdecl; //()V
    procedure flushInput; cdecl; //()V
    procedure flushOutput; cdecl; //()V
    procedure sendBreak(duration: Integer); cdecl; //(I)V
    procedure setBreak(level: Boolean); cdecl; overload; //(Z)V
    procedure setBreak; cdecl; overload; //()V
    procedure setRTS(level: Boolean); cdecl; overload; //(Z)V
    procedure setRTS; cdecl; overload; //()V
    procedure setDTR(level: Boolean); cdecl; overload; //(Z)V
    procedure setDTR; cdecl; overload; //()V
    function waitForChange: Boolean; cdecl; //()Z
    function getCTS: Boolean; cdecl; //()Z
    function getDSR: Boolean; cdecl; //()Z
    function getRI: Boolean; cdecl; //()Z
    function getCD: Boolean; cdecl; //()Z

    { Property }
  end;

  TJSerial = class(TJavaGenericImport<JSerialClass, JSerial>) end;

  JSerialExceptionClass = interface(JRuntimeExceptionClass) // or JObjectClass // SuperSignature: java/lang/RuntimeException
  ['{14C3E947-88D9-497A-B52D-D95527EFEA62}']
    { static Property Methods }

    { static Methods }
    {class} function init(detailMessage: JString): JSerialException; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(detailMessage: JString; throwable: JThrowable): JSerialException; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Throwable;)V

    { static Property }
  end;

  [JavaSignature('serial/SerialException')]
  JSerialException = interface(JRuntimeException) // or JObject // SuperSignature: java/lang/RuntimeException
  ['{D59E95AC-2598-4F5D-94F8-C252ECFD5CFD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSerialException = class(TJavaGenericImport<JSerialExceptionClass, JSerialException>) end;

  JSerialIOExceptionClass = interface(JIOExceptionClass) // or JObjectClass // SuperSignature: java/io/IOException
  ['{D8B313B9-4F6E-43C1-A1B1-0F03CB574ED9}']
    { static Property Methods }

    { static Methods }
    {class} function init(detailMessage: JString): JSerialIOException; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(amessage: JString; cause: JThrowable): JSerialIOException; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Throwable;)V

    { static Property }
  end;

  [JavaSignature('serial/SerialIOException')]
  JSerialIOException = interface(JIOException) // or JObject // SuperSignature: java/io/IOException
  ['{DD719A05-9F73-48C5-858C-DBF7352511BA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSerialIOException = class(TJavaGenericImport<JSerialIOExceptionClass, JSerialIOException>) end;

  JStopbitsClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{C9291A68-6B25-4E95-B7CF-69D34AE96D63}']
    { static Property Methods }
    {class} function _GetOne: JStopbits;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/Stopbits;
    {class} function _GetTwo: JStopbits;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/Stopbits;
    {class} function _GetOnePointFive: JStopbits;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lserial/Stopbits;

    { static Methods }
    {class} function values: TJavaObjectArray<JStopbits>; cdecl; //()[Lserial/Stopbits;
    {class} function valueOf(name: JString): JStopbits; cdecl; //(Ljava/lang/String;)Lserial/Stopbits;

    { static Property }
    {class} property One: JStopbits read _GetOne;
    {class} property Two: JStopbits read _GetTwo;
    {class} property OnePointFive: JStopbits read _GetOnePointFive;
  end;

  [JavaSignature('serial/Stopbits')]
  JStopbits = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{9B5534CE-8E39-4928-AEFC-5C5726C8C36A}']
    { Property Methods }
    function _Getvalue: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    procedure _Setvalue(avalue: Integer);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(I)V

    { methods }

    { Property }
    property value: Integer read _Getvalue write _Setvalue;
  end;

  TJStopbits = class(TJavaGenericImport<JStopbitsClass, JStopbits>) end;

  JTimeoutClass = interface(JObjectClass)
  ['{166CA267-9011-429E-9714-907BB5178663}']
    { static Property Methods }
    {class} function _GetMAX: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init: JTimeout; cdecl; overload; //()V
    {class} function init(timeout: Integer): JTimeout; cdecl; overload; //(I)V
    {class} function init(inter_byte_timeout: Integer; read_timeout_constant: Integer; read_timeout_multiplier: Integer; write_timeout_constant: Integer; write_timeout_multiplier: Integer): JTimeout; cdecl; overload; //(IIIII)V
    {class} function simpleTimeout(timeout: Integer): JTimeout; cdecl; //(I)Lserial/Timeout;

    { static Property }
    {class} property MAX: Integer read _GetMAX;
  end;

  [JavaSignature('serial/Timeout')]
  JTimeout = interface(JObject)
  ['{157869D3-46A1-4634-A9FD-7E89C3D7610F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTimeout = class(TJavaGenericImport<JTimeoutClass, JTimeout>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


//procedure RegisterTypes;
//begin
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JBuildConfig',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JBuildConfig));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JByteSize',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JByteSize));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JFlowControl',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JFlowControl));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JLog',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JLog));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JParity',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JParity));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JPortInfo',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JPortInfo));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JPortNotOpenedException',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JPortNotOpenedException));
////  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JSerial_1',
////    TypeInfo(Androidapi.JNI.libserial_release_aar.JSerial_1));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JSerial_Builder',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JSerial_Builder));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JSerial',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JSerial));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JSerialException',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JSerialException));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JSerialIOException',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JSerialIOException));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JStopbits',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JStopbits));
//  TRegTypes.RegisterType('Androidapi.JNI.libserial_release_aar.JTimeout',
//    TypeInfo(Androidapi.JNI.libserial_release_aar.JTimeout));
//end;
//
//
//initialization
//  RegisterTypes;

{$ENDIF}

end.
