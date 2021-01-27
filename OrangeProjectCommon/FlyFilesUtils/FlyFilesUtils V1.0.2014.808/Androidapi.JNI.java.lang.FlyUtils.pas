//====================================================
//
//  转换来自JavaOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932
//      396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//
//  生成时间：2015-4-28 17:25:05
//  工具版本：1.0.2014.12.24
//
//====================================================
unit Androidapi.JNI.java.lang.FlyUtils;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
{$IF CompilerVersion >= 29.0} // >= XE8
  Androidapi.JNI.Java.Net,
{$ENDIF}
  Androidapi.JNI.Java.Security;


type
// ===== Forward declarations =====

  JType = interface; //android.renderscript.Type
  JFlyUtils_Class = interface; //java.lang.Class
  JSystem = interface; //java.lang.System
  JSecurityManager = interface; //java.lang.SecurityManager
  JConsole = interface; //java.io.Console
{$IF CompilerVersion < 29.0} // < XE8
  JConstructor = interface; //java.lang.reflect.Constructor
  JField = interface; //java.lang.reflect.Field
  JMethod = interface; //java.lang.reflect.Method
  JTypeVariable = interface; //java.lang.reflect.TypeVariable
  JPackage = interface; //java.lang.Package
  JGenericDeclaration = interface; //java.lang.reflect.GenericDeclaration
{$ENDIF}

// ===== Interface declarations =====

  JTypeClass = interface(JObjectClass)
  ['{AE093C16-8ABD-4C36-AC1E-05DE438976C2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('java/lang/reflect/Type')]
  JType = interface(IJavaInstance)
  ['{7E9537F2-022C-4C7C-A50B-F629B5E3D0CD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJType = class(TJavaGenericImport<JTypeClass, JType>) end;

{$IF CompilerVersion < 29.0} // < XE8


  JPackageClass = interface(JObjectClass)
  ['{7961CCAE-08CA-4F8B-A6DD-C420D8E24A33}']
    { static Property Methods }

    { static Methods }
    {class} function getPackage(P1: JString): JPackage; cdecl; //(Ljava/lang/String;)Ljava/lang/Package;
    {class} function getPackages: TJavaObjectArray<JPackage>; cdecl; //()[Ljava/lang/Package;

    { static Property }
  end;

  [JavaSignature('java/lang/Package')]
  JPackage = interface(JObject)
  ['{BEA09B55-E894-4A25-8529-95C161AB9B05}']
    { Property Methods }

    { methods }
    function getAnnotation(annotationType: Jlang_Class): JAnnotation; cdecl; //(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    function getAnnotations: TJavaObjectArray<JAnnotation>; cdecl; //()[Ljava/lang/annotation/Annotation;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl; //()[Ljava/lang/annotation/Annotation;
    function isAnnotationPresent(annotationType: Jlang_Class): Boolean; cdecl; //(Ljava/lang/Class;)Z
    function getImplementationTitle: JString; cdecl; //()Ljava/lang/String;
    function getImplementationVendor: JString; cdecl; //()Ljava/lang/String;
    function getImplementationVersion: JString; cdecl; //()Ljava/lang/String;
    function getName: JString; cdecl; //()Ljava/lang/String;
    function getSpecificationTitle: JString; cdecl; //()Ljava/lang/String;
    function getSpecificationVendor: JString; cdecl; //()Ljava/lang/String;
    function getSpecificationVersion: JString; cdecl; //()Ljava/lang/String;
    function hashCode: Integer; cdecl; //()I
    function isCompatibleWith(version: JString): Boolean; cdecl; //(Ljava/lang/String;)Z
    function isSealed: Boolean; cdecl; overload; //()Z
//    function isSealed(url: JURL): Boolean; cdecl; overload; //(Ljava/net/URL;)Z
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJPackage = class(TJavaGenericImport<JPackageClass, JPackage>) end;

  JGenericDeclarationClass = interface(JObjectClass)
  ['{D3D22E60-C803-4FCE-93CD-719A79A2E425}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('java/lang/reflect/GenericDeclaration')]
  JGenericDeclaration = interface(IJavaInstance)
  ['{CC820425-F30A-4EB2-89FD-7CB83349294D}']
    { Property Methods }

    { methods }
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl; //()[Ljava/lang/reflect/TypeVariable;

    { Property }
  end;

  TJGenericDeclaration = class(TJavaGenericImport<JGenericDeclarationClass, JGenericDeclaration>) end;

  JTypeVariableClass = interface(JObjectClass)
  ['{B5D5E485-317D-4529-A59F-1552A50B5503}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('java/lang/reflect/TypeVariable')]
  JTypeVariable = interface(IJavaInstance)
  ['{1C87F121-3BA5-49A2-A9A7-04FFBF9083FF}']
    { Property Methods }

    { methods }
    function getBounds: TJavaObjectArray<JType>; cdecl; //()[Ljava/lang/reflect/Type;
    function getGenericDeclaration: JGenericDeclaration; cdecl; //()Ljava/lang/reflect/GenericDeclaration;
    function getName: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJTypeVariable = class(TJavaGenericImport<JTypeVariableClass, JTypeVariable>) end;

  JMethodClass = interface(JObjectClass)
  ['{A9E201A9-5D3B-40D4-B6CA-626167DE586E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('java/lang/reflect/Method')]
  JMethod = interface(JObject)
  ['{42145B9A-F4E7-42A4-8733-87F1EDC3BECB}']
    { Property Methods }

    { methods }
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl; //()[Ljava/lang/reflect/TypeVariable;
    function toGenericString: JString; cdecl; //()Ljava/lang/String;
    function getGenericParameterTypes: TJavaObjectArray<JType>; cdecl; //()[Ljava/lang/reflect/Type;
    function getGenericExceptionTypes: TJavaObjectArray<JType>; cdecl; //()[Ljava/lang/reflect/Type;
    function getGenericReturnType: JType; cdecl; //()Ljava/lang/reflect/Type;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl; //()[Ljava/lang/annotation/Annotation;
    function getAnnotation(annotationType: Jlang_Class): JAnnotation; cdecl; //(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    function isAnnotationPresent(annotationType: Jlang_Class): Boolean; cdecl; //(Ljava/lang/Class;)Z
    function getParameterAnnotations: TJavaArray<TJavaObjectArray<JAnnotation>>; cdecl; //()[[Ljava/lang/annotation/Annotation;
    function isVarArgs: Boolean; cdecl; //()Z
    function isBridge: Boolean; cdecl; //()Z
    function isSynthetic: Boolean; cdecl; //()Z
    function getDefaultValue: JObject; cdecl; //()Ljava/lang/Object;
    function equals(aobject: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function getDeclaringClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getExceptionTypes: TJavaObjectArray<Jlang_Class>; cdecl; //()[Ljava/lang/Class;
    function getModifiers: Integer; cdecl; //()I
    function getName: JString; cdecl; //()Ljava/lang/String;
    function getParameterTypes: TJavaObjectArray<Jlang_Class>; cdecl; //()[Ljava/lang/Class;
    function getReturnType: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function hashCode: Integer; cdecl; //()I
    function invoke(receiver: JObject; args: TJavaObjectArray<JObject>): JObject; cdecl; //(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJMethod = class(TJavaGenericImport<JMethodClass, JMethod>) end;

  JFieldClass = interface(JObjectClass)
  ['{A384F32B-B5D9-4544-AEDC-C406AC35D826}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('java/lang/reflect/Field')]
  JField = interface(JObject)
  ['{77489B33-947D-4A4E-B80A-C90F6D629D53}']
    { Property Methods }

    { methods }
    function isSynthetic: Boolean; cdecl; //()Z
    function toGenericString: JString; cdecl; //()Ljava/lang/String;
    function isEnumConstant: Boolean; cdecl; //()Z
    function getGenericType: JType; cdecl; //()Ljava/lang/reflect/Type;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl; //()[Ljava/lang/annotation/Annotation;
    function getAnnotation(annotationType: Jlang_Class): JAnnotation; cdecl; //(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    function isAnnotationPresent(annotationType: Jlang_Class): Boolean; cdecl; //(Ljava/lang/Class;)Z
    function equals(aobject: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function get(aobject: JObject): JObject; cdecl; //(Ljava/lang/Object;)Ljava/lang/Object;
    function getBoolean(aobject: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function getByte(aobject: JObject): Byte; cdecl; //(Ljava/lang/Object;)B
    function getChar(aobject: JObject): Char; cdecl; //(Ljava/lang/Object;)C
    function getDeclaringClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDouble(aobject: JObject): Double; cdecl; //(Ljava/lang/Object;)D
    function getFloat(aobject: JObject): Single; cdecl; //(Ljava/lang/Object;)F
    function getInt(aobject: JObject): Integer; cdecl; //(Ljava/lang/Object;)I
    function getLong(aobject: JObject): Int64; cdecl; //(Ljava/lang/Object;)J
    function getModifiers: Integer; cdecl; //()I
    function getName: JString; cdecl; //()Ljava/lang/String;
    function getShort(aobject: JObject): Word; cdecl; //(Ljava/lang/Object;)S
    function getType: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function hashCode: Integer; cdecl; //()I
    procedure &set(aobject: JObject; value: JObject); cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)V
    procedure setBoolean(aobject: JObject; value: Boolean); cdecl; //(Ljava/lang/Object;Z)V
    procedure setByte(aobject: JObject; value: Byte); cdecl; //(Ljava/lang/Object;B)V
    procedure setChar(aobject: JObject; value: Char); cdecl; //(Ljava/lang/Object;C)V
    procedure setDouble(aobject: JObject; value: Double); cdecl; //(Ljava/lang/Object;D)V
    procedure setFloat(aobject: JObject; value: Single); cdecl; //(Ljava/lang/Object;F)V
    procedure setInt(aobject: JObject; value: Integer); cdecl; //(Ljava/lang/Object;I)V
    procedure setLong(aobject: JObject; value: Int64); cdecl; //(Ljava/lang/Object;J)V
    procedure setShort(aobject: JObject; value: Word); cdecl; //(Ljava/lang/Object;S)V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJField = class(TJavaGenericImport<JFieldClass, JField>) end;

  JConstructorClass = interface(JObjectClass)
  ['{3CF8324D-3B41-4A00-87DD-05038578B974}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('java/lang/reflect/Constructor')]
  JConstructor = interface(JObject)
  ['{62674265-DF7B-42CF-9FB7-C4601EE492CD}']
    { Property Methods }

    { methods }
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl; //()[Ljava/lang/reflect/TypeVariable;
    function toGenericString: JString; cdecl; //()Ljava/lang/String;
    function getGenericParameterTypes: TJavaObjectArray<JType>; cdecl; //()[Ljava/lang/reflect/Type;
    function getGenericExceptionTypes: TJavaObjectArray<JType>; cdecl; //()[Ljava/lang/reflect/Type;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl; //()[Ljava/lang/annotation/Annotation;
    function getAnnotation(annotationType: Jlang_Class): JAnnotation; cdecl; //(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    function isAnnotationPresent(annotationType: Jlang_Class): Boolean; cdecl; //(Ljava/lang/Class;)Z
    function getParameterAnnotations: TJavaArray<TJavaObjectArray<JAnnotation>>; cdecl; //()[[Ljava/lang/annotation/Annotation;
    function isVarArgs: Boolean; cdecl; //()Z
    function isSynthetic: Boolean; cdecl; //()Z
    function equals(aobject: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function getDeclaringClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getExceptionTypes: TJavaObjectArray<Jlang_Class>; cdecl; //()[Ljava/lang/Class;
    function getModifiers: Integer; cdecl; //()I
    function getName: JString; cdecl; //()Ljava/lang/String;
    function getParameterTypes: TJavaObjectArray<Jlang_Class>; cdecl; //()[Ljava/lang/Class;
    function hashCode: Integer; cdecl; //()I
    function newInstance(args: TJavaObjectArray<JObject>): JObject; cdecl; //([Ljava/lang/Object;)Ljava/lang/Object;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJConstructor = class(TJavaGenericImport<JConstructorClass, JConstructor>) end;

{$ENDIF}


  JFlyUtils_ClassClass = interface(JObjectClass)
  ['{109B6A5D-1921-4E7A-94B6-A53F9C860D19}']
    { static Property Methods }

    { static Methods }
    {class} function forName(P1: JString): JFlyUtils_Class; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/Class;
    {class} function forName(shouldInitialize: JString; classLoader: Boolean; P3: JClassLoader): JFlyUtils_Class; cdecl; overload; //(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    { static Property }
  end;

  [JavaSignature('java/lang/Class')]
  JFlyUtils_Class = interface(JObject)
  ['{77648F7B-3726-4129-BFC8-CC1E593323E4}']
    { Property Methods }

    { methods }
    function getClasses: TJavaObjectArray<JFlyUtils_Class>; cdecl; //()[Ljava/lang/Class;
    function getAnnotation(annotationType: JFlyUtils_Class): JAnnotation; cdecl; //(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    function getAnnotations: TJavaObjectArray<JAnnotation>; cdecl; //()[Ljava/lang/annotation/Annotation;
    function getCanonicalName: JString; cdecl; //()Ljava/lang/String;
    function getClassLoader: JClassLoader; cdecl; //()Ljava/lang/ClassLoader;
    function getComponentType: JFlyUtils_Class; cdecl; //()Ljava/lang/Class;
    function getConstructor(parameterTypes: TJavaObjectArray<JFlyUtils_Class>): JConstructor; cdecl; //([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    function getConstructors: TJavaObjectArray<JConstructor>; cdecl; //()[Ljava/lang/reflect/Constructor;
    function getDeclaredAnnotations: TJavaObjectArray<JAnnotation>; cdecl; //()[Ljava/lang/annotation/Annotation;
    function getDeclaredClasses: TJavaObjectArray<JFlyUtils_Class>; cdecl; //()[Ljava/lang/Class;
    function getDeclaredConstructor(parameterTypes: TJavaObjectArray<JFlyUtils_Class>): JConstructor; cdecl; //([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    function getDeclaredConstructors: TJavaObjectArray<JConstructor>; cdecl; //()[Ljava/lang/reflect/Constructor;
    function getDeclaredField(name: JString): JField; cdecl; //(Ljava/lang/String;)Ljava/lang/reflect/Field;
    function getDeclaredFields: TJavaObjectArray<JField>; cdecl; //()[Ljava/lang/reflect/Field;
    function getDeclaredMethod(name: JString; parameterTypes: TJavaObjectArray<JFlyUtils_Class>): JMethod; cdecl; //(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    function getDeclaredMethods: TJavaObjectArray<JMethod>; cdecl; //()[Ljava/lang/reflect/Method;
    function getDeclaringClass: JFlyUtils_Class; cdecl; //()Ljava/lang/Class;
    function getEnclosingClass: JFlyUtils_Class; cdecl; //()Ljava/lang/Class;
    function getEnclosingConstructor: JConstructor; cdecl; //()Ljava/lang/reflect/Constructor;
    function getEnclosingMethod: JMethod; cdecl; //()Ljava/lang/reflect/Method;
    function getEnumConstants: TJavaObjectArray<JObject>; cdecl; //()[Ljava/lang/Object;
    function getField(name: JString): JField; cdecl; //(Ljava/lang/String;)Ljava/lang/reflect/Field;
    function getFields: TJavaObjectArray<JField>; cdecl; //()[Ljava/lang/reflect/Field;
    function getGenericInterfaces: TJavaObjectArray<JType>; cdecl; //()[Ljava/lang/reflect/Type;
    function getGenericSuperclass: JType; cdecl; //()Ljava/lang/reflect/Type;
    function getInterfaces: TJavaObjectArray<JFlyUtils_Class>; cdecl; //()[Ljava/lang/Class;
    function getMethod(name: JString; parameterTypes: TJavaObjectArray<JFlyUtils_Class>): JMethod; cdecl; overload; //(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    function getMethod(name: JString): JMethod; cdecl; overload;
    function getMethods: TJavaObjectArray<JMethod>; cdecl; //()[Ljava/lang/reflect/Method;
    function getModifiers: Integer; cdecl; //()I
    function getName: JString; cdecl; //()Ljava/lang/String;
    function getSimpleName: JString; cdecl; //()Ljava/lang/String;
{$IF CompilerVersion >= 29.0} // >= XE8
    function getProtectionDomain: JProtectionDomain; cdecl; //()Ljava/security/ProtectionDomain;
    function getResource(resourceName: JString): JURL; cdecl; //(Ljava/lang/String;)Ljava/net/URL;
{$ENDIF}
    function getResourceAsStream(resourceName: JString): JInputStream; cdecl; //(Ljava/lang/String;)Ljava/io/InputStream;
    function getSigners: TJavaObjectArray<JObject>; cdecl; //()[Ljava/lang/Object;
    function getSuperclass: JFlyUtils_Class; cdecl; //()Ljava/lang/Class;
    function getTypeParameters: TJavaObjectArray<JTypeVariable>; cdecl; //()[Ljava/lang/reflect/TypeVariable;
    function isAnnotation: Boolean; cdecl; //()Z
    function isAnnotationPresent(annotationType: JFlyUtils_Class): Boolean; cdecl; //(Ljava/lang/Class;)Z
    function isAnonymousClass: Boolean; cdecl; //()Z
    function isArray: Boolean; cdecl; //()Z
    function isAssignableFrom(P1: JFlyUtils_Class): Boolean; cdecl; //(Ljava/lang/Class;)Z
    function isEnum: Boolean; cdecl; //()Z
    function isInstance(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function isInterface: Boolean; cdecl; //()Z
    function isLocalClass: Boolean; cdecl; //()Z
    function isMemberClass: Boolean; cdecl; //()Z
    function isPrimitive: Boolean; cdecl; //()Z
    function isSynthetic: Boolean; cdecl; //()Z
    function newInstance: JObject; cdecl; //()Ljava/lang/Object;
    function toString: JString; cdecl; //()Ljava/lang/String;
    function getPackage: JPackage; cdecl; //()Ljava/lang/Package;
    function desiredAssertionStatus: Boolean; cdecl; //()Z
    function asSubclass(c: JFlyUtils_Class): JFlyUtils_Class; cdecl; //(Ljava/lang/Class;)Ljava/lang/Class;
    function cast(obj: JObject): JObject; cdecl; //(Ljava/lang/Object;)Ljava/lang/Object;

    { Property }
  end;

  TJFlyUtils_Class = class(TJavaGenericImport<JFlyUtils_ClassClass, JFlyUtils_Class>) end;

  JConsoleClass = interface(JObjectClass)
  ['{F09B2F08-3529-4626-8090-8370F35D6920}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('java/io/Console')]
  JConsole = interface(JObject)
  ['{E3DA168F-E3CC-4721-816C-1ADDBB0D1FDF}']
    { Property Methods }

    { methods }
    procedure flush; cdecl; //()V
    function format(format: JString; args: TJavaObjectArray<JObject>): JConsole; cdecl; //(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/Console;
    function printf(format: JString; args: TJavaObjectArray<JObject>): JConsole; cdecl; //(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/Console;
{$IF CompilerVersion >= 28.0} // >= XE7
    function reader: JReader; cdecl; //()Ljava/io/Reader;
{$ENDIF}
    function readLine: JString; cdecl; overload; //()Ljava/lang/String;
    function readLine(format: JString; args: TJavaObjectArray<JObject>): JString; cdecl; overload; //(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    function readPassword: TJavaArray<Char>; cdecl; overload; //()[C
    function readPassword(format: JString; args: TJavaObjectArray<JObject>): TJavaArray<Char>; cdecl; overload; //(Ljava/lang/String;[Ljava/lang/Object;)[C
    function writer: JPrintWriter; cdecl; //()Ljava/io/PrintWriter;

    { Property }
  end;

  TJConsole = class(TJavaGenericImport<JConsoleClass, JConsole>) end;

  JSecurityManagerClass = interface(JObjectClass)
  ['{0F6962C3-5F73-4A7E-8236-F060293478EF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSecurityManager; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('java/lang/SecurityManager')]
  JSecurityManager = interface(JObject)
  ['{CAF0C3A1-0079-4675-91B7-6F87264537EC}']
    { Property Methods }

    { methods }
    procedure checkAccept(host: JString; port: Integer); cdecl; //(Ljava/lang/String;I)V
    procedure checkAccess(thread: JThread); cdecl; overload; //(Ljava/lang/Thread;)V
    procedure checkAccess(group: JThreadGroup); cdecl; overload; //(Ljava/lang/ThreadGroup;)V
    procedure checkConnect(host: JString; port: Integer); cdecl; overload; //(Ljava/lang/String;I)V
    procedure checkConnect(host: JString; port: Integer; context: JObject); cdecl; overload; //(Ljava/lang/String;ILjava/lang/Object;)V
    procedure checkCreateClassLoader; cdecl; //()V
    procedure checkDelete(afile: JString); cdecl; //(Ljava/lang/String;)V
    procedure checkExec(cmd: JString); cdecl; //(Ljava/lang/String;)V
    procedure checkExit(status: Integer); cdecl; //(I)V
    procedure checkLink(libName: JString); cdecl; //(Ljava/lang/String;)V
    procedure checkListen(port: Integer); cdecl; //(I)V
    procedure checkMemberAccess(cls: Jlang_Class; atype: Integer); cdecl; //(Ljava/lang/Class;I)V
{$IF CompilerVersion >= 29.0} // >= XE8
    procedure checkMulticast(maddr: JInetAddress); cdecl; overload; //(Ljava/net/InetAddress;)V
    procedure checkMulticast(maddr: JInetAddress; ttl: Byte); cdecl; overload; //Deprecated //(Ljava/net/InetAddress;B)V
{$ENDIF}
    procedure checkPackageAccess(packageName: JString); cdecl; //(Ljava/lang/String;)V
    procedure checkPackageDefinition(packageName: JString); cdecl; //(Ljava/lang/String;)V
    procedure checkPropertiesAccess; cdecl; //()V
    procedure checkPropertyAccess(key: JString); cdecl; //(Ljava/lang/String;)V
    procedure checkRead(fd: JFileDescriptor); cdecl; overload; //(Ljava/io/FileDescriptor;)V
    procedure checkRead(afile: JString); cdecl; overload; //(Ljava/lang/String;)V
    procedure checkRead(afile: JString; context: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;)V
    procedure checkSecurityAccess(target: JString); cdecl; //(Ljava/lang/String;)V
    procedure checkSetFactory; cdecl; //()V
    function checkTopLevelWindow(window: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    procedure checkSystemClipboardAccess; cdecl; //()V
    procedure checkAwtEventQueueAccess; cdecl; //()V
    procedure checkPrintJobAccess; cdecl; //()V
    procedure checkWrite(fd: JFileDescriptor); cdecl; overload; //(Ljava/io/FileDescriptor;)V
    procedure checkWrite(afile: JString); cdecl; overload; //(Ljava/lang/String;)V
    function getInCheck: Boolean; cdecl; //Deprecated //()Z
    function getThreadGroup: JThreadGroup; cdecl; //()Ljava/lang/ThreadGroup;
    function getSecurityContext: JObject; cdecl; //()Ljava/lang/Object;
{$IF CompilerVersion >= 29.0} // >= XE8
    procedure checkPermission(permission: JPermission); cdecl; overload; //(Ljava/security/Permission;)V
    procedure checkPermission(permission: JPermission; context: JObject); cdecl; overload; //(Ljava/security/Permission;Ljava/lang/Object;)V
{$ENDIF}

    { Property }
  end;

  TJSecurityManager = class(TJavaGenericImport<JSecurityManagerClass, JSecurityManager>) end;

  JSystemClass = interface(JObjectClass)
  ['{DFEEE39D-4C35-4477-A1FD-A3CDAB0C4523}']
    { static Property Methods }
    {class} function _Getin: JInputStream; //Ljava/io/InputStream;
    {class} function _Getout: JPrintStream; //Ljava/io/PrintStream;
    {class} function _Geterr: JPrintStream; //Ljava/io/PrintStream;

    { static Methods }
    {class} procedure setIn(P1: JInputStream); cdecl; //(Ljava/io/InputStream;)V
    {class} procedure setOut(P1: JPrintStream); cdecl; //(Ljava/io/PrintStream;)V
    {class} procedure setErr(P1: JPrintStream); cdecl; //(Ljava/io/PrintStream;)V
    {class} procedure arraycopy(P1: JObject; P2: Integer; P3: JObject; P4: Integer; P5: Integer); cdecl; //(Ljava/lang/Object;ILjava/lang/Object;II)V
    {class} function currentTimeMillis: Int64; cdecl; //()J
    {class} function nanoTime: Int64; cdecl; //()J
    {class} procedure exit(P1: Integer); cdecl; //(I)V
    {class} procedure gc; cdecl; //()V
    {class} function getenv(P1: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function getenv: JMap; cdecl; overload; //()Ljava/util/Map;
    {class} function inheritedChannel: JChannel; cdecl; //()Ljava/nio/channels/Channel;
{$IF CompilerVersion >= 29.0} // >= XE8
    {class} function getProperties: JProperties; cdecl; //()Ljava/util/Properties;
{$ENDIF}
    {class} function getProperty(P1: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function getProperty(defaultValue: JString; P2: JString): JString; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function setProperty(value: JString; P2: JString): JString; cdecl; //(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    {class} function clearProperty(P1: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function console: JConsole; cdecl; //()Ljava/io/Console;
    {class} function getSecurityManager: JSecurityManager; cdecl; //()Ljava/lang/SecurityManager;
    {class} function identityHashCode(P1: JObject): Integer; cdecl; //(Ljava/lang/Object;)I
    {class} function lineSeparator: JString; cdecl; //()Ljava/lang/String;
    {class} procedure load(P1: JString); cdecl; //(Ljava/lang/String;)V
    {class} procedure loadLibrary(P1: JString); cdecl; //(Ljava/lang/String;)V
    {class} procedure runFinalization; cdecl; //()V
    {class} procedure runFinalizersOnExit(P1: Boolean); cdecl; //Deprecated //(Z)V
{$IF CompilerVersion >= 29.0} // >= XE8
    {class} procedure setProperties(P1: JProperties); cdecl; //(Ljava/util/Properties;)V
{$ENDIF}
    {class} procedure setSecurityManager(P1: JSecurityManager); cdecl; //(Ljava/lang/SecurityManager;)V
    {class} function mapLibraryName(P1: JString): JString; cdecl; //(Ljava/lang/String;)Ljava/lang/String;

    { static Property }
    {class} property &in: JInputStream read _Getin;
    {class} property &out: JPrintStream read _Getout;
    {class} property err: JPrintStream read _Geterr;
  end;

  [JavaSignature('java/lang/System')]
  JSystem = interface(JObject)
  ['{860EADEF-9EC2-4005-8451-38C8E744EC61}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSystem = class(TJavaGenericImport<JSystemClass, JSystem>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.java.lang.FlyUtils.JFlyUtils_Class',
    TypeInfo(Androidapi.JNI.java.lang.FlyUtils.JFlyUtils_Class));
  TRegTypes.RegisterType('Androidapi.JNI.java.lang.FlyUtils.JSystem',
    TypeInfo(Androidapi.JNI.java.lang.FlyUtils.JSystem));
  TRegTypes.RegisterType('Androidapi.JNI.java.lang.FlyUtils.JSecurityManager',
    TypeInfo(Androidapi.JNI.java.lang.FlyUtils.JSecurityManager));
  TRegTypes.RegisterType('Androidapi.JNI.java.lang.FlyUtils.JConsole',
    TypeInfo(Androidapi.JNI.java.lang.FlyUtils.JConsole));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
