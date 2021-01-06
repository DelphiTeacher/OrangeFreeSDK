// https://quality.embarcadero.com/browse/RSP-24695

// android 7.1.x
// Project raised exception class EJNIException with message 'java.lang.NullPointerException:
// Attempt to invoke virtual method 'boolean java.lang.String.contains(java.lang.CharSequence)' on a null object reference

{ ******************************************************* }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2010-2018 Embarcadero Technologies, Inc. }
{ All rights reserved }
{ }
{ ******************************************************* }

unit Androidapi.JNIBridge;

interface

uses
  System.SysUtils, System.Rtti, System.TypInfo,
  System.Generics.Collections, Androidapi.Jni,
  Androidapi.JNIMarshal;

const
  IID_ILocalObject_Name = '{81DD0F8E-7E6C-4D63-BE42-EB691CAAE686}';
  IID_ILocalObject: TGUID = IID_ILocalObject_Name;

  IID_IJava_Name = '{2866B78E-2258-4DE6-A075-C37264E2C837}';
  IID_IJava: TGUID = IID_IJava_Name;
  IID_IJavaInstance_Name = '{E9063409-906F-4C8D-ABF2-E10318F8E72C}';

  IID_IJavaInstance: TGUID = IID_IJavaInstance_Name;
  IID_IJavaClass_Name = '{ABFF4754-6EC8-4B84-B541-4FC471500856}';
  IID_IJavaClass: TGUID = IID_IJavaClass_Name;

type
{$M+}
  ///
  /// All Java objects, whether local or imports must use this interface
  /// as the 'root' interface.  Local objects are Delphi implemented objects
  /// that implement some java protocol or interface.  Imports are
  /// java objects, created by the java runtime that have been
  /// wrapped in dynamically created interfaces for access from Delphi.
  ///
  /// Interfaces that describe Java class methods must derive from
  /// <code>IJavaClass</code>.  Interfaces that describe Java
  /// instance methods must derive from <code>IJavaInstance</code>.
  IJava = interface(IInterface)
    [IID_IJava_Name]
  end;

  ///
  /// Root interface describing Java classes.  All classes
  /// include the <code>inir</code> method.  Custom allocators
  /// may be defined by Java class interfaces in addition to
  /// this method.
  IJavaClass = interface(IJava)
    [IID_IJavaClass_Name]
  end;

  ///
  /// Root interface describing Java instance methods.
  IJavaInstance = interface(IJava)
    [IID_IJavaInstance_Name]
  end;
{$M-}

  ///
  /// Alias type to make reading this code a little easier.
  TRawVTable = TRawVirtualClass.TVTable;

  ///
  /// Java objects are accessed via interfaces.  This vtable object
  /// implements a Delphi vtable that will invoke the Java runtime
  /// for method calls.  These vtables will be used to construct
  /// <code>TJavaImport</code> objects, which are virtual classes.
  ///
  TJavaVTable = class(TRawVTable)
  private
    /// We hold on to this because the vtable entries will be pointing
    /// into it.
    FMethodInfoData: TArray<JNIMethodInvokeData>;

    /// See the <code>Guids</code> property.
    FGuids: TArray<TGUID>;

  protected
    ///
    /// When we construct the virtual class using this vtable, we need
    /// to give a list of guids that the vtable matches.  Since we are
    /// representing Java objects as a 'hiearchy' of interfaces,
    /// a single vtable can safely represent a swatch of Java
    /// interfaces.  We need to hold all those guids to allow us to
    /// manage casting up and down the hiearchy in Delphi code
    property Guids: TArray<TGUID> read FGuids;

    ///
    /// Creates a vtable for a Java object given the type info
    /// of the interface.  The vtable may be for a Java instance,
    /// or class.
    constructor Create(P: PTypeInfo; ClsID: Pointer; IsClassTable: Boolean);
  end;

  ///
  /// Exception thrown for various failures.  Most failures are due to incorrect
  /// type declarations, where a Delphi interface type for a Java type
  /// does not match.  Some are pure runtime issues.  The message and context
  /// of the exception will provide some diagnostic information.
  EJNI = class(Exception);

  ///
  /// Fatal exception issued when something sufficiently had happens that it is
  /// questionable about the state of the runtime.
  EJNIFatal = class(EJNI);

  ///
  /// Both import objects and local objects implement this interface.  We use it
  /// as a common means of getting to key data when dealing with marshaling parameters.
  ILocalObject = interface(IJava)
    [IID_ILocalObject_Name]
    /// Returns the Java instance ID of this object.
    function GetObjectID: Pointer;
  end;

  ///
  /// TJavaImport needs to hold relatively little, because the vast bulk of
  /// information required to invoke methods is actually referred to by
  /// the vtable thunks themselves.  The only thing needed from the import
  /// instances proper are the object and class ids.
  TJavaImport = class(TRawVirtualClass, ILocalObject)
  private
    FJNIObjectID: Pointer; // This can either be an instance or a class
  public
    ///
    /// <param name="ID">Java ID.  This can either be an instance or a class,
    /// depending on which we are creating.</param>
    /// <param name="VTable">The vtable that will be used for invoking methods.
    /// If this is a super-class reference, then it should be the appropriate
    /// vtable.</param>
    constructor Create(ID: Pointer; const VTable: TJavaVTable);
    destructor Destroy; override;
    function GetObjectID: Pointer; inline;
  end;

  ///
  /// A generic class that we use to make the declaration of Java
  /// object factories easier. In our model, we split the class methods
  /// and instance methods into two interfaces.  This class blends the
  /// two interfaces into one factory that can produce instances of Java
  /// objects, or provide a reference to a singleton instance representing
  /// the Java class.
  TJavaGenericImport<C: IJavaClass; T: IJavaInstance> = class
  strict private
    class var FInstanceVTable: TJavaVTable;
    class var FClassVTable: TJavaVTable;
    class var FJavaClass: C;
    class var FJNIClassID: Pointer;
    class function GetJavaClass: C; static;
    class function Alloc: T; overload; static;
  public
    class function Wrap(AJNIObjectID: Pointer): T; overload; static;
    class function Wrap(const AInstance: IJavaInstance): T; overload; static;

    ///
    /// Provides the Java class object for this type.  You can use the
    /// resulting interface to call Java class methods, rather than
    /// instance methods.
    class property JavaClass: C read GetJavaClass;

    ///
    /// Creates an instance of the object.  This may raise an <code>EJNI</code>
    /// exception, in the event that we were unable to create the meta-data for
    /// the class, or if there is an error in the Java runtime.  Both are
    /// usually due to errors in the type descriptions in the Java interface
    /// declarations.  Do not use this for instances that you want to call some
    /// custom constructor on.  This method will call the default 'init' constructor
    /// on the instance, which can be bad in some cases.
    class function Create: T; static;

    class function GetClsID: Pointer; static;
  end;

  TJavaLocal = class abstract(TInterfacedObject, ILocalObject, IJava)
  const
    DefaultProxyInterfaceName = 'com/embarcadero/rtl/ProxyInterface';
  private
    class var FProxyInterfaceName: string;
  private
    FObjectID: Pointer;
    FLocalRefObjectID: Pointer;
    class constructor Create;
    class function GetProxyInterfaceNameFromContext(AContext: JNIObject)
      : string; static;
  protected
    function GetObjectID: Pointer;
  public
    constructor Create;
    destructor Destroy; override;
    function hashCode: Integer; cdecl;
    function equals(Obj: Pointer): Boolean; reintroduce; overload; cdecl;
    function toString: JNIString; reintroduce; overload; cdecl;
    function getName: JNIString;
  end;

  ///
  /// This cache holds vtables for all Java
  /// import types.  A vtable in here might be for an Java class, or
  /// for an Java instance.  We create vtables on the fly, when they
  /// are requested.
  TVTableCache = class
  strict private
    class var VTables: TDictionary<PTypeInfo, TJavaVTable>;

    class constructor Create;

  protected
    ///
    /// The primary source for instance vtables.  If the vtable isn't present in
    /// the cache, we'll create it.  May throw an exception if the type
    /// info doesn't represent a valid Java type description.
    class function GetVTable(P: PTypeInfo; ClsID: Pointer;
      IsClassTable: Boolean): TJavaVTable;
  end;

  TClassLoader = class
  private
    LoadClassID: JNIMethodID;
    Instance: JNIObject;
    function CreateDefaultClassLoader: Boolean;
    function GetContextClassLoader(AJavaContext: JNIObject): JNIObject;

  public
    constructor Create;
    destructor Destroy; override;
    function LoadClass(const AClass: string): JNIClass; inline;
  end;

  TJavaValidate = class
  strict private
    class procedure ValidateTypeHierarchy(P: PTypeInfo; RequiredRoot: PTypeInfo;
      ErrMsg: PResStringRec); static;
  protected
    class procedure ValidateClassHierarchy(P: PTypeInfo); static;
    class procedure ValidateInstanceHierarchy(P: PTypeInfo); static;
  end;

  TJNIResolver = class
  private
    class var ClassRefCache: TDictionary<string, JNIClass>;
    class var ReturnValues: TDictionary<Pointer, TValue>;
    class var ReturnValuesJNIObject: TDictionary<Pointer, JNIObject>;
    { This values are cached, we use them to retrieve listener parameters }
    class var FIntMethodID: JNIMethodID;
    class var FCharMethodID: JNIMethodID;
    class var FBooleanMethodID: JNIMethodID;
    class var FLongMethodID: JNIMethodID;
    class var FShortMethodID: JNIMethodID;
    class var FByteMethodID: JNIMethodID;
    class var FFloatMethodID: JNIMethodID;
    class var FDoubleMethodID: JNIMethodID;
    class function GetBasicTypeMethodID(const ClassSig, ClassGetMethod,
      ClassGetMethodSig: string): JNIMethodID; static;
    class function InternalGetJavaClassID(const AClass: string)
      : JNIClass; static;
    class procedure AddReturnValue(Obj: Pointer; const AValue: TValue);
      overload; static;
    class procedure RemoveReturnValue(Obj: Pointer); static;
  public
    class threadvar JNIEnvRes: PJNIEnv;
    class var ClassLoader: TClassLoader;
    class function GetJNIEnv: PJNIEnv; static;
    class function GetJavaClassID(const AClass: string): JNIClass; static;
    class function GetJavaMethodID(AClass: JNIClass;
      const AMethod, AMethodSig: string; IsClassTable: Boolean = True)
      : JNIMethodID; static;
    class function GetJavaStaticMethodID(AClass: JNIClass;
      const AMethod, AMethodSig: string): JNIMethodID; static; inline;
    class function GetJavaStaticFieldID(AClass: JNIClass;
      const AField, AFieldSig: string): JNIFieldID; static; inline;
    class function GetJavaFieldID(AClass: JNIClass;
      const AField, AFieldSig: string): JNIFieldID; static; inline;
    class procedure DeleteLocalRef(AObject: JNIObject); static; inline;
    class procedure DeleteGlobalRef(AObject: JNIObject); static; inline;
    class procedure ExceptionCheck; static; inline;
    class function GetObjectRefType(AObject: JNIObject): JNIObjectRefType;
      static; inline;
    class function NewObject(AClass: JNIClass): JNIObject; static; inline;
    class function NewGlobalRef(AJNIObject: JNIObject): JNIObject;
      static; inline;
    class function GetObjectArrayElement(AArray: JNIObjectArray; Index: JNISize)
      : JNIObject; static; inline;
    class procedure SetObjectArrayElement(AArray: JNIObjectArray;
      Index: JNISize; const Val); static;
    class procedure SetRawObjectArrayElement(AArray: JNIObjectArray;
      Index: JNISize; const Val); static; inline;
    class function GetRawValueFromJInteger(AJInteger: JNIObject): Integer;
      static; inline;
    class function GetRawValueFromJBoolean(AJBoolean: JNIObject): Boolean;
      static; inline;
    class function GetRawValueFromJCharacter(AJCharacter: JNIObject): Char;
      static; inline;
    class function GetRawValueFromJLong(AJLong: JNIObject): Int64;
      static; inline;
    class function GetRawValueFromJShort(AJShort: JNIObject): SmallInt;
      static; inline;
    class function GetRawValueFromJByte(AJByte: JNIObject): ShortInt;
      static; inline;
    class function GetRawValueFromJDouble(AJDouble: JNIObject): Double;
      static; inline;
    class function GetRawValueFromJFloat(AJFloat: JNIObject): Single;
      static; inline;
    class function GetArrayLength(AJNIArray: JNIArray): JNISize; static; inline;
    /// <summary>Returns pointer on native java object</summary>
    class function JavaInstanceToID(const AJavaInstance: IJavaInstance)
      : Pointer; static; inline;
    /// <summary>Tests whether Java object is a instance of specified java class.</summary>
    class function IsInstanceOf(const AJavaInstance: IJavaInstance;
      const AClass: JNIClass): Boolean; static; inline;
    /// <summary>Tests whether two references refer to the same Java object</summary>
    class function IsSameObject(const AObject1, AObject2: IJavaInstance)
      : Boolean; static; inline;
    class constructor Create;
    class destructor Destroy;
  end;

  /// To create a java class we need the class signature
  JavaSignatureAttribute = class(TCustomAttribute)
  private
    FSignature: string;
  public
    constructor Create(const S: string);
    property Signature: string read FSignature;
  end;

  TJavaBasicArray = class
  private
    Handle: JNIArray;
    procedure ProcessArray(CreateArray: Boolean; Len: Integer;
      AHandle: Pointer); virtual; abstract;
    function GetArrayLength: JNISize; inline;
  protected
    FIsCopy: Boolean;
    FElementsAccessed: Boolean;
    FClassID: JNIClass;
  public
    class var Context: TRttiContext;
    class constructor Create;
    class destructor Destroy;
    function ToPointer: JNIArray; inline;
    procedure RefreshValues; virtual; abstract;
    procedure Sync; virtual; abstract;
    property Length: JNISize read GetArrayLength;
    property IsCopy: Boolean read FIsCopy;
    property ElementsAccessed: Boolean read FElementsAccessed;
  end;

  PJavaBasicArray = ^TJavaBasicArray;

  TJavaArray<T> = class(TJavaBasicArray)
  type
    PJavaArrayBaseType = ^T;
    TJavaArrayReleaser = procedure(Env: PJNIEnv; AArray: JNIArray;
      Elems: PJavaArrayBaseType; Mode: JNIInt); cdecl;
    TJavaArrayElementsGetter = function(Env: PJNIEnv; AArray: JNIArray;
      IsCopy: PJNIBoolean): Pointer; cdecl;
  private
    FArrayReleaser: TJavaArrayReleaser;
    FArrayGetter: TJavaArrayElementsGetter;
    FArrayElem: PJavaArrayBaseType;
    FBaseType: TRttiType;
    function GetItem(AIndex: Integer): T; virtual;
    procedure SetItem(AIndex: Integer; AValue: T); virtual;
    function GetArrayElem: PJavaArrayBaseType;
    procedure ProcessArray(CreateArray: Boolean; Len: Integer;
      AHandle: Pointer); override;
  public
    constructor Create(Len: Integer); overload;
    constructor Create; overload; // used in wrap functions, do not call
    destructor Destroy; override;
    procedure RefreshValues; override;
    procedure Sync; override;
    class function Wrap(const AnArray: TJavaBasicArray): TJavaArray<T>;
      static; inline;
    property Items[AIndex: Integer]: T read GetItem write SetItem; default;
    property Data: PJavaArrayBaseType read GetArrayElem;
  end;

  TJavaObjectArray<T> = class(TJavaArray<T>)
  private
    function GetItem(AIndex: Integer): T; override;
    procedure SetItem(AIndex: Integer; AValue: T); override;
  public
    function GetRawItem(AIndex: Integer): JNIObject;
    procedure SetRawItem(AIndex: Integer; AValue: JNIObject);
    class function Wrap(const AnArray: TJavaBasicArray): TJavaObjectArray<T>;
      static; inline;
  end;

  TJavaBiArray<T> = class(TJavaArray<T>)
  end;

  TJavaObjectBiArray<T> = class(TJavaArray<T>)
  end;

  TRegTypes = class
  protected
    class var RegTypes: TDictionary<string, PTypeInfo>;
    class constructor Create;
    class destructor Destroy;
  public
    class procedure RegisterType(const AQName: string; TI: PTypeInfo);
    class function GetType(const ATypeName: string): PTypeInfo;
  end;

  // Do not localize this block
const
  DefaultJConstructor = '<init>';
  DefaultJConstructorName = 'init';
  DefaultJConstructorSig = '()V';
  DefaultJGetter = '_Get';
  DefaultJSetter = '_Set';
  DefaultJSetterLength = 4;
  DefaultJGetterLength = 4;
  DexClassConstructorSig =
    '(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V';
  DexLoadClassMethod = 'loadClass';
  DexLoadClassSig = '(Ljava/lang/String;)Ljava/lang/Class;';
  ActClassLoader = 'loadClass';
  ActClassLoaderSig = '(Ljava/lang/String;)Ljava/lang/Class;';
  DexOutputDir = 'outdex';
  CreateProxyClassMethod = 'CreateProxyClass';
  CreateProxyClassSig = '(Ljava/lang/Class;J)Ljava/lang/Object;';
  GetClassLoaderMethod = 'getClassLoader';
  GetClassLoaderSig = '()Ljava/lang/ClassLoader;';

  JIntegerSig = 'java/lang/Integer';
  JIntegerGetMethod = 'intValue';
  JIntegerGetMethodSig = '()I';
  JCharSig = 'java/lang/Character';
  JCharGetMethod = 'charValue';
  JCharGetMethodSig = '()C';
  JBooleanSig = 'java/lang/Boolean';
  JBooleanGetMethod = 'booleanValue';
  JBooleanGetMethodSig = '()Z';
  JLongSig = 'java/lang/Long';
  JLongGetMethod = 'longValue';
  JLongGetMethodSig = '()J';
  JShortSig = 'java/lang/Short';
  JShortGetMethod = 'shortValue';
  JShortGetMethodSig = '()S';
  JByteSig = 'java/lang/Byte';
  JByteGetMethod = 'byteValue';
  JByteGetMethodSig = '()B';
  JFloatSig = 'java/lang/Float';
  JFloatGetMethod = 'floatValue';
  JFloatGetMethodSig = '()F';
  JDoubleSig = 'java/lang/Double';
  JDoubleGetMethod = 'doubleValue';
  JDoubleGetMethodSig = '()D';

  // Used by the ProxyInterface.java
function dispatchToNative(Env: PJNIEnv; This: JNIObject; Method: JNIString;
  Args: JNIObjectArray; DelphiObject: Int64): JNIObject; cdecl;
procedure cleanNative(Env: PJNIEnv; This: JNIObject;
  DelphiObject: Int64); cdecl;

// Used by Androidapi.JNIMarshal.pas
procedure WrapJNIReturn(ObjID: Pointer; ClsID: Pointer;
  ObjType: Pointer; out Obj);
function WrapJNIArray(ObjID: Pointer; ObjType: Pointer): TJavaBasicArray;
procedure XFormInterface(Src: Pointer; Dest: Pointer);
procedure XFormClass(Src: Pointer; Dest: Pointer);

type
  TBridgeHelper = class
  private
    class var FGetClassLock: TObject;
    class constructor Create;
    class destructor Destroy;
    // TJavaGenericImport
    class function GetInstanceVTable(var AVTable: TJavaVTable;
      ATypeInfo: PTypeInfo; ClsID: Pointer): TJavaVTable; static; inline;
    class procedure GetJavaClass(CTypeInfo, ITypeInfo: PTypeInfo;
      var AJavaClass: IJavaClass; var AClsID: Pointer;
      var AClassVTable: TJavaVTable); static;
    class procedure Wrap(P: Pointer; ITypeInfo: PTypeInfo;
      var JNIClassID: Pointer; var ATable: TJavaVTable; var Resp);
    class procedure WrapInstance(const I: IJavaInstance; ITypeInfo: PTypeInfo;
      var JNIClassID: Pointer; var ATable: TJavaVTable; var Resp);
    class procedure Alloc(var ClsID: Pointer; ITypeInfo: PTypeInfo;
      var AVTable: TJavaVTable; var Resp); static;
    class function GetClsID(var AClsID: Pointer; LTypeInfo: PTypeInfo)
      : Pointer; static;

    // TJavaArray
    class procedure ProcessArray(LInfo: PTypeInfo; const Context: TRttiContext;
      var FArrayReleaser: Pointer; var FArrayGetter: Pointer;
      var FBaseType: TRttiType; var Handle: JNIArray; var FClassID: JNIClass;
      CreateArray: Boolean; Len: Integer; AHandle: Pointer); static;
  end;

implementation

uses
  Androidapi.NativeActivity, Androidapi.Consts, Androidapi.IOUtils;

procedure DispatchToImport; cdecl; varargs;
  external 'librtlhelper.a' name 'DispatchToImport';

function GetClassSignature(const ClassType: TRttiType): Pointer;
var
  Attrs: TArray<TCustomAttribute>;
  Sig: JavaSignatureAttribute;
begin
  Attrs := ClassType.GetAttributes;
  if Length(Attrs) > 0 then
  begin
    Sig := JavaSignatureAttribute(Attrs[0]);
    Result := TJNIResolver.InternalGetJavaClassID(Sig.Signature);
  end
  else
    Result := nil;
end;

function FindMethod(const MethodName: string; const ClassType: TRttiType)
  : TRttiMethod;
var
  Methods: TArray<TRttiMethod>;
  LMethod: TRttiMethod;
begin
  Methods := ClassType.GetMethods;
  for LMethod in Methods do
    if CompareText(MethodName, LMethod.Name) = 0 then
      Exit(LMethod);

  Result := nil;
end;

function GetParamFromJSource(const APar: TRttiType;
  AJParameter: JNIObject): TValue;
begin
  case APar.TypeKind of
    tkEnumeration:
      Result := TValue.From<Boolean>(TJNIResolver.GetRawValueFromJBoolean
        (AJParameter));

    tkWChar:
      Result := TValue.From<Char>(TJNIResolver.GetRawValueFromJCharacter
        (AJParameter));

    tkInteger:
      begin
        if APar is TRttiOrdinalType then
        begin
          case APar.AsOrdinal.OrdType of
            otSByte, otUByte:
              Result := TValue.From<Byte>
                (TJNIResolver.GetRawValueFromJByte(AJParameter));
            otSWord, otUWord:
              Result := TValue.From<Word>
                (TJNIResolver.GetRawValueFromJShort(AJParameter));
            otSLong, otULong:
              Result := TValue.From<Integer>
                (TJNIResolver.GetRawValueFromJInteger(AJParameter));
          end
        end
        else
          Result := TValue.From<Integer>
            (TJNIResolver.GetRawValueFromJInteger(AJParameter));
      end;

    tkInt64:
      Result := TValue.From<Int64>(TJNIResolver.GetRawValueFromJLong
        (AJParameter));

    tkFloat:
      begin
        if APar is TRttiFloatType then
          case TRttiFloatType(APar).FloatType of
            ftSingle:
              Result := TValue.From<Single>
                (TJNIResolver.GetRawValueFromJFloat(AJParameter));
            ftDouble:
              Result := TValue.From<Double>
                (TJNIResolver.GetRawValueFromJDouble(AJParameter));
          end;
      end;

    tkClass:
      Result := WrapJNIArray(AJParameter, APar.Handle);

  else
    Result := TValue.From<Pointer>(AJParameter);
  end;
end;

// fix bug 2020.12.7  wnhoo
function GetJReturnFromValue(const RetValue: TValue; Method: TRttiMethod;
  DelphiObject: Pointer): JNIObject;
var
  AClass: JNIClass;
  ConstructorID: JNIMethodID;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;

  case RetValue.Kind of
    tkInteger:
      begin
        AClass := TJNIResolver.InternalGetJavaClassID(JIntegerSig);
        if AClass = nil then
          raise EJNIFatal.CreateResFmt(@SJNIClassNotFound, [JIntegerSig]);

        ConstructorID := TJNIResolver.GetJavaMethodID(AClass,
          DefaultJConstructor, '(I)V');
        Result := LJNIEnvRes^.NewObjectA(LJNIEnvRes, AClass, ConstructorID,
          PJNIValue(ArgsToJNIValues([RetValue.AsInteger])));
      end;

    tkEnumeration:
      begin
        AClass := TJNIResolver.InternalGetJavaClassID(JBooleanSig);
        if AClass = nil then
          raise EJNIFatal.CreateResFmt(@SJNIClassNotFound, [JBooleanSig]);

        ConstructorID := TJNIResolver.GetJavaMethodID(AClass,
          DefaultJConstructor, '(Z)V');
        Result := LJNIEnvRes^.NewObjectA(LJNIEnvRes, AClass, ConstructorID,
          PJNIValue(ArgsToJNIValues([RetValue.AsBoolean])));
      end;

    tkInterface:
      begin
        if RetValue.AsInterface <> nil then
        begin
          Result := (RetValue.AsInterface as ILocalObject).GetObjectID;
          TJNIResolver.AddReturnValue(DelphiObject, RetValue);
        end
        else
          Result := nil;
      end;

    tkClass:
      begin
        if RetValue.AsObject <> nil then
        begin
          Result := TJavaBasicArray(RetValue.AsObject).ToPointer;
          TJNIResolver.AddReturnValue(DelphiObject, RetValue);
        end
        else
          Result := nil;
      end;

    tkPointer:
      begin
        Result := TValueData(RetValue).FAsPointer;
      end;

  else
    begin
      Result := nil;
    end;
  end;
end;

procedure cleanNative(Env: PJNIEnv; This: JNIObject;
  DelphiObject: Int64); cdecl;
begin
  TJNIResolver.RemoveReturnValue(Pointer(DelphiObject));
end;

function dispatchToNative(Env: PJNIEnv; This: JNIObject; Method: JNIString;
  Args: JNIObjectArray; DelphiObject: Int64): JNIObject; cdecl;
var
  AObject: TJavaLocal;
  AContext: TRttiContext;
  MethodName: string;
  AType: TRttiType;
  LMethod: TRttiMethod;
  NewArgs: TArray<TValue>;
  I: Integer;
  APar: TRttiParameter;
  Params: TArray<TRttiParameter>;
  Wrapped: IInterface;
  SourcePar: JNIObject;
  JNIEnv: PJNIEnv;
  ClsID: JNIClass;
  RetValue: TValue;
begin
  Result := nil;
  AObject := TJavaLocal(Pointer(DelphiObject));
  JNIEnv := TJNIResolver.GetJNIEnv;
  MethodName := JNIStringToString(JNIEnv, Method);

  AContext := TRttiContext.Create;
  try
    AType := AContext.GetType(AObject.ClassInfo);
    if AType <> nil then
    begin
      LMethod := FindMethod(MethodName, AType);
      if LMethod <> nil then
      begin
        Params := LMethod.GetParameters;
        SetLength(NewArgs, Length(Params));
        for I := 0 to Length(Params) - 1 do
        begin
          APar := Params[I];
          SourcePar := JNIEnv^.GetObjectArrayElement(JNIEnv, Args, I);
          { if the paremeter is an interface, wrap it! }
          if (APar.ParamType.TypeKind = tkInterface) then
          begin
            ClsID := GetClassSignature(APar.ParamType);
            WrapJNIReturn(Pointer(SourcePar), ClsID,
              APar.ParamType.Handle, Wrapped);
            TValue.Make(@Wrapped, APar.ParamType.Handle, NewArgs[I]);
          end
          else
            NewArgs[I] := GetParamFromJSource(APar.ParamType, SourcePar);
        end;
        RetValue := LMethod.Invoke(AObject, NewArgs);
        if LMethod.ReturnType <> nil then
          Result := GetJReturnFromValue(RetValue, LMethod,
            Pointer(DelphiObject));
      end
      else
        raise EJNIFatal.CreateResFmt(@SJNIMethodNotFound, [MethodName]);
    end
    else
      raise EJNIFatal.CreateResFmt(@SJNIRTTINotAvailable, [MethodName]);

  finally
    AContext.Free;
  end;
end;

procedure XFormInterface(Src: Pointer; Dest: Pointer);
var
  Intf: IJava;
  LocalObject: ILocalObject;
begin
  if Pointer(Src^) = nil then
    PPointer(Dest)^ := nil
  else
  begin
    Intf := IJava(PPointer(Src)^);
    if Intf.QueryInterface(IID_ILocalObject, LocalObject) <> 0 then
      raise EJNIFatal.CreateRes(@SJNIInvokeError);
    PPointer(Dest)^ := LocalObject.GetObjectID;
  end;
end;

procedure XFormClass(Src: Pointer; Dest: Pointer);
var
  Arr: TJavaBasicArray;
begin
  if Pointer(Src^) = nil then
    PPointer(Dest)^ := nil
  else
  begin
    Arr := TJavaBasicArray(PPointer(Src)^);
    PPointer(Dest)^ := Arr.ToPointer;
    { if we returned FElements need to copy back changes before using the array }
    if Arr.FElementsAccessed and Arr.FIsCopy then
      Arr.Sync;
  end;
end;

procedure WrapJNIReturn(ObjID: Pointer; ClsID: Pointer;
  ObjType: Pointer; out Obj);
var
  Imp: TJavaImport;
  P: PTypeInfo;
  V: TJavaVTable;
begin
  if ObjID = nil then
    Pointer(Obj) := nil
  else
  begin
    P := ObjType;
    V := TVTableCache.GetVTable(P, ClsID, False);
    Imp := TJavaImport.Create(ObjID, V);
    TJNIResolver.DeleteLocalRef(ObjID);
    if Imp.QueryInterface(P.TypeData^.Guid, Obj) <> S_OK then
      raise EJNI.CreateResFmt(@SInternalBindingError,
        [string(PTypeInfo(ObjType)^.NameFld.toString)]);
  end;
end;

function WrapJNIArray(ObjID: Pointer; ObjType: Pointer): TJavaBasicArray;
var
  RetArray: TJavaBasicArray;
  AContext: TRttiContext;
  AType: TRttiType;
  BaseType: TRttiType;
  BaseName: string;
  CType: TClass;
  GlobalRef: JNIArray;
begin
  if ObjID = nil then
    Result := nil
  else
  begin
    AContext := TRttiContext.Create;
    try
      GlobalRef := TJNIResolver.NewGlobalRef(ObjID);
      if TJNIResolver.GetObjectRefType(ObjID) = JNILocalRefType then
        TJNIResolver.DeleteLocalRef(ObjID);
      AType := AContext.GetType(ObjType);
      CType := (AType as TRttiInstanceType).MetaclassType;
      RetArray := TJavaBasicArray(CType.Create);

      BaseName := AType.toString;
      BaseName := BaseName.Substring(BaseName.IndexOf('<') + 1);
      BaseName := BaseName.Substring(0, BaseName.IndexOf('>'));
      BaseType := AContext.FindType(BaseName);
      if BaseType = nil then
        BaseType := AContext.GetType(TRegTypes.GetType(BaseName));
      RetArray.FClassID := GetClassSignature(BaseType);

      RetArray.ProcessArray(False, 0, GlobalRef);
      if RetArray.FElementsAccessed and RetArray.FIsCopy then
        RetArray.RefreshValues;
      Result := RetArray;
    finally
      AContext.Free;
    end;
  end;
end;

{ JavaSignatureAttribute }

constructor JavaSignatureAttribute.Create(const S: string);
begin
  FSignature := S;
end;

{ TClassLoader }

function TClassLoader.GetContextClassLoader(AJavaContext: JNIObject): JNIObject;
var
  LJNIEnvRes: PJNIEnv;
  DclLoadclassID: JNIMethodID;
  ContextClass: JNIClass;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  // Get the default ClassLoader from the context
  ContextClass := LJNIEnvRes^.GetObjectClass(LJNIEnvRes, AJavaContext);
  DclLoadclassID := LJNIEnvRes^.GetMethodID(LJNIEnvRes, ContextClass,
    GetClassLoaderMethod, GetClassLoaderSig);
  if DclLoadclassID = nil then
    raise EJNIFatal.CreateResFmt(@SJNIMethodNotFound, [GetClassLoaderMethod]);
  Result := LJNIEnvRes^.CallObjectMethod(LJNIEnvRes, AJavaContext,
    DclLoadclassID);
  LJNIEnvRes^.DeleteLocalRef(LJNIEnvRes, ContextClass);
end;

function TClassLoader.CreateDefaultClassLoader: Boolean;
var
  LJNIEnvRes: PJNIEnv;
  clObject, clClass: JNIObject;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  // Get the default ClassLoader
  clObject := GetContextClassLoader(System.JavaContext);

  Instance := LJNIEnvRes^.NewGlobalRef(LJNIEnvRes, clObject);

  // Get the LoasClass method
  clClass := LJNIEnvRes^.GetObjectClass(LJNIEnvRes, clObject);
  LoadClassID := LJNIEnvRes^.GetMethodID(LJNIEnvRes, clClass, ActClassLoader,
    ActClassLoaderSig);

  // Delete Local Refs
  LJNIEnvRes^.DeleteLocalRef(LJNIEnvRes, clObject);
  LJNIEnvRes^.DeleteLocalRef(LJNIEnvRes, clClass);

  Result := True;
end;

constructor TClassLoader.Create;
begin
  CreateDefaultClassLoader;
end;

destructor TClassLoader.Destroy;
begin
  TJNIResolver.DeleteGlobalRef(Instance);
end;

function TClassLoader.LoadClass(const AClass: string): JNIClass;
var
  AClassStr: JNIObject;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  AClassStr := StringToJNIString(LJNIEnvRes, AClass);
  Result := LJNIEnvRes^.CallObjectMethodA(LJNIEnvRes, Instance, LoadClassID,
    PJNIValue(ArgsToJNIValues([AClassStr])));
  if LJNIEnvRes^.ExceptionCheck(LJNIEnvRes) = 1 then
    Result := nil;
  LJNIEnvRes^.DeleteLocalRef(LJNIEnvRes, AClassStr);
end;

{ TJNIResolver }

class procedure TJNIResolver.AddReturnValue(Obj: Pointer; const AValue: TValue);
begin
  TMonitor.Enter(ReturnValues);
  try
    ReturnValues.Add(Obj, AValue);
  finally
    TMonitor.Exit(ReturnValues);
  end;
end;

class constructor TJNIResolver.Create;
begin
  inherited;
  ClassRefCache := TDictionary<string, JNIClass>.Create;
  ReturnValues := TDictionary<Pointer, TValue>.Create;
  ReturnValuesJNIObject := TDictionary<Pointer, JNIObject>.Create;

  FCharMethodID := GetBasicTypeMethodID(JCharSig, JCharGetMethod,
    JCharGetMethodSig);
  FBooleanMethodID := GetBasicTypeMethodID(JBooleanSig, JBooleanGetMethod,
    JBooleanGetMethodSig);
  FIntMethodID := GetBasicTypeMethodID(JIntegerSig, JIntegerGetMethod,
    JIntegerGetMethodSig);
  FIntMethodID := GetBasicTypeMethodID(JIntegerSig, JIntegerGetMethod,
    JIntegerGetMethodSig);
  FLongMethodID := GetBasicTypeMethodID(JLongSig, JLongGetMethod,
    JLongGetMethodSig);
  FShortMethodID := GetBasicTypeMethodID(JShortSig, JShortGetMethod,
    JShortGetMethodSig);
  FByteMethodID := GetBasicTypeMethodID(JByteSig, JByteGetMethod,
    JByteGetMethodSig);
  FFloatMethodID := GetBasicTypeMethodID(JFloatSig, JFloatGetMethod,
    JFloatGetMethodSig);
  FDoubleMethodID := GetBasicTypeMethodID(JDoubleSig, JDoubleGetMethod,
    JDoubleGetMethodSig);
end;

class function TJNIResolver.GetJNIEnv: PJNIEnv;
begin
  if JNIEnvRes = nil then
    PJavaVM(System.JavaMachine)^.AttachCurrentThread(System.JavaMachine,
      @JNIEnvRes, nil);
  Result := JNIEnvRes;
end;

class function TJNIResolver.GetObjectArrayElement(AArray: JNIObjectArray;
  Index: JNISize): JNIObject;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.GetObjectArrayElement(LJNIEnvRes, AArray, Index);
end;

class function TJNIResolver.GetObjectRefType(AObject: JNIObject)
  : JNIObjectRefType;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.GetObjectRefType(LJNIEnvRes, AObject);
  ExceptionCheck;
end;

class function TJNIResolver.GetRawValueFromJBoolean
  (AJBoolean: JNIObject): Boolean;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.CallBooleanMethod(LJNIEnvRes, AJBoolean,
    FBooleanMethodID).ToBoolean;
end;

class function TJNIResolver.GetRawValueFromJCharacter
  (AJCharacter: JNIObject): Char;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.CallCharMethod(LJNIEnvRes, AJCharacter, FCharMethodID);
end;

class function TJNIResolver.GetRawValueFromJInteger
  (AJInteger: JNIObject): Integer;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.CallIntMethod(LJNIEnvRes, AJInteger, FIntMethodID);
end;

class function TJNIResolver.GetRawValueFromJLong(AJLong: JNIObject): Int64;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.CallLongMethod(LJNIEnvRes, AJLong, FLongMethodID);
end;

class function TJNIResolver.GetRawValueFromJShort(AJShort: JNIObject): SmallInt;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.CallShortMethod(LJNIEnvRes, AJShort, FShortMethodID);
end;

class function TJNIResolver.InternalGetJavaClassID(const AClass: string)
  : JNIClass;
var
  LocalRef: JNIObject;
begin
  TMonitor.Enter(ClassRefCache);
  try
    if not ClassRefCache.TryGetValue(AClass, Result) then
    begin
      LocalRef := TJNIResolver.GetJavaClassID(AClass);
      if LocalRef <> nil then
      begin
        Result := TJNIResolver.NewGlobalRef(LocalRef);
        TJNIResolver.DeleteLocalRef(LocalRef);
        ClassRefCache.Add(AClass, Result);
      end;
    end;
  finally
    TMonitor.Exit(ClassRefCache);
  end;
end;

class function TJNIResolver.JavaInstanceToID(const AJavaInstance
  : IJavaInstance): Pointer;
var
  LocalObject: ILocalObject;
begin
  if Supports(AJavaInstance, ILocalObject, LocalObject) then
    Result := LocalObject.GetObjectID
  else
    Result := nil;
end;

class function TJNIResolver.GetRawValueFromJByte(AJByte: JNIObject): ShortInt;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.CallByteMethod(LJNIEnvRes, AJByte, FByteMethodID);
end;

class function TJNIResolver.GetRawValueFromJFloat(AJFloat: JNIObject): Single;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.CallFloatMethod(LJNIEnvRes, AJFloat, FFloatMethodID);
end;

class function TJNIResolver.GetRawValueFromJDouble(AJDouble: JNIObject): Double;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.CallDoubleMethod(LJNIEnvRes, AJDouble, FDoubleMethodID);
end;

class function TJNIResolver.NewGlobalRef(AJNIObject: JNIObject): JNIObject;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.NewGlobalRef(LJNIEnvRes, AJNIObject);
end;

class function TJNIResolver.NewObject(AClass: JNIClass): JNIObject;
var
  ConstructorID: JNIMethodID;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  ConstructorID := LJNIEnvRes^.GetMethodID(LJNIEnvRes, AClass,
    DefaultJConstructor, DefaultJConstructorSig);
  // default constructor name & signature
  Result := LJNIEnvRes^.NewObject(LJNIEnvRes, AClass, ConstructorID);
  HandleJNIException(LJNIEnvRes);
end;

class procedure TJNIResolver.RemoveReturnValue(Obj: Pointer);
begin
  TMonitor.Enter(ReturnValuesJNIObject);
  try
    ReturnValuesJNIObject.Remove(Obj);
  finally
    TMonitor.Exit(ReturnValuesJNIObject);
  end;
  TMonitor.Enter(ReturnValues);
  try
    ReturnValues.Remove(Obj);
  finally
    TMonitor.Exit(ReturnValues);
  end;
end;

class function TJNIResolver.IsInstanceOf(const AJavaInstance: IJavaInstance;
  const AClass: JNIClass): Boolean;
var
  LJNIEnvRes: PJNIEnv;
  ID: JNIObject;
begin
  if AJavaInstance = nil then
    Result := False
  else
  begin
    LJNIEnvRes := TJNIResolver.GetJNIEnv;
    ID := JavaInstanceToID(AJavaInstance);
    Result := LJNIEnvRes^.IsInstanceOf(LJNIEnvRes, ID, AClass) = JNI_TRUE;
  end;
end;

class function TJNIResolver.IsSameObject(const AObject1,
  AObject2: IJavaInstance): Boolean;
var
  LJNIEnvRes: PJNIEnv;
  ID1, ID2: Pointer;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  ID1 := JavaInstanceToID(AObject1);
  ID2 := JavaInstanceToID(AObject2);
  Result := LJNIEnvRes^.IsSameObject(LJNIEnvRes, ID1, ID2) = JNI_TRUE;
end;

class procedure TJNIResolver.SetObjectArrayElement(AArray: JNIObjectArray;
  Index: JNISize; const Val);
var
  ObjID: Pointer;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  if Pointer(Val) = nil then
    ObjID := nil
  else
    ObjID := (TInterfacedObject(Val) as ILocalObject).GetObjectID;
  LJNIEnvRes^.SetObjectArrayElement(LJNIEnvRes, AArray, Index, ObjID);
end;

class procedure TJNIResolver.SetRawObjectArrayElement(AArray: JNIObjectArray;
  Index: JNISize; const Val);
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  LJNIEnvRes^.SetObjectArrayElement(LJNIEnvRes, AArray, Index, Pointer(Val));
end;

class function TJNIResolver.GetArrayLength(AJNIArray: JNIArray): JNISize;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := LJNIEnvRes^.GetArrayLength(LJNIEnvRes, AJNIArray);
  ExceptionCheck;
end;

class function TJNIResolver.GetBasicTypeMethodID(const ClassSig, ClassGetMethod,
  ClassGetMethodSig: string): JNIMethodID;
var
  AClass: JNIClass;
begin
  AClass := TJNIResolver.InternalGetJavaClassID(ClassSig);
  if AClass = nil then
    raise EJNIFatal.CreateResFmt(@SJNIClassNotFound, [ClassSig]);
  Result := TJNIResolver.GetJavaMethodID(AClass, ClassGetMethod,
    ClassGetMethodSig);
  if Result = nil then
    raise EJNIFatal.CreateResFmt(@SJNIMethodNotFound,
      [ClassSig + ':' + ClassGetMethod]);
end;

class function TJNIResolver.GetJavaClassID(const AClass: string): JNIClass;
var
  LTemp: UTF8String;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  LTemp := UTF8String(AClass);
  Result := LJNIEnvRes^.FindClass(LJNIEnvRes, MarshaledAString(LTemp));
  if Result = nil then
  begin
    ExceptionCheck;
    if ClassLoader = nil then
      ClassLoader := TClassLoader.Create;
    Result := ClassLoader.LoadClass(AClass);
    if Result = nil then
      ExceptionCheck;
  end;
end;

class function TJNIResolver.GetJavaMethodID(AClass: JNIClass;
  const AMethod, AMethodSig: string; IsClassTable: Boolean): JNIMethodID;
var
  LUTF8StrSig: UTF8String;
  LUTF8StrMethod: UTF8String;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  if IsClassTable and (AMethod = DefaultJConstructorName) then
    LUTF8StrMethod := UTF8String(DefaultJConstructor)
  else
    LUTF8StrMethod := UTF8String(AMethod);

  LUTF8StrSig := UTF8String(AMethodSig);

  Result := LJNIEnvRes^.GetMethodID(LJNIEnvRes, AClass,
    MarshaledAString(LUTF8StrMethod), MarshaledAString(LUTF8StrSig));
  if Result = nil then
    ExceptionCheck;
end;

class function TJNIResolver.GetJavaStaticMethodID(AClass: JNIClass;
  const AMethod, AMethodSig: string): JNIMethodID;
var
  LUTF8StrSig: UTF8String;
  LUTF8StrMethod: UTF8String;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  LUTF8StrSig := UTF8String(AMethodSig);
  LUTF8StrMethod := UTF8String(AMethod);
  Result := LJNIEnvRes^.GetStaticMethodID(LJNIEnvRes, AClass,
    MarshaledAString(LUTF8StrMethod), MarshaledAString(LUTF8StrSig));
  if Result = nil then
    ExceptionCheck;
end;

class function TJNIResolver.GetJavaStaticFieldID(AClass: JNIClass;
  const AField, AFieldSig: string): JNIFieldID;
var
  LUTF8StrSig: UTF8String;
  LUTF8StrField: UTF8String;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  LUTF8StrSig := UTF8String(AFieldSig);
  LUTF8StrField := UTF8String(AField);
  Result := LJNIEnvRes^.GetStaticFieldID(LJNIEnvRes, AClass,
    MarshaledAString(LUTF8StrField), MarshaledAString(LUTF8StrSig));
  if Result = nil then
    ExceptionCheck;
end;

class function TJNIResolver.GetJavaFieldID(AClass: JNIClass;
  const AField, AFieldSig: string): JNIFieldID;
var
  LUTF8StrSig: UTF8String;
  LUTF8StrField: UTF8String;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  LUTF8StrSig := UTF8String(AFieldSig);
  LUTF8StrField := UTF8String(AField);
  Result := LJNIEnvRes^.GetFieldID(LJNIEnvRes, AClass,
    MarshaledAString(LUTF8StrField), MarshaledAString(LUTF8StrSig));
  if Result = nil then
    ExceptionCheck;
end;

class procedure TJNIResolver.DeleteLocalRef(AObject: JNIObject);
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  LJNIEnvRes^.DeleteLocalRef(LJNIEnvRes, AObject);
  ExceptionCheck;
end;

class procedure TJNIResolver.DeleteGlobalRef(AObject: JNIObject);
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  LJNIEnvRes^.DeleteGlobalRef(LJNIEnvRes, AObject);
  ExceptionCheck;
end;

class destructor TJNIResolver.Destroy;
var
  ToDelete: JNIClass;
begin
  if ClassLoader <> nil then
    ClassLoader.Free;
  if ClassRefCache <> nil then
  begin
    for ToDelete in ClassRefCache.Values do
      TJNIResolver.DeleteGlobalRef(ToDelete);
    ClassRefCache.Free;
  end;
  if ReturnValues <> nil then
    ReturnValues.Free;
  if ReturnValuesJNIObject <> nil then
    ReturnValuesJNIObject.Free;
  inherited;
end;

class procedure TJNIResolver.ExceptionCheck;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  if LJNIEnvRes^.ExceptionCheck(LJNIEnvRes) = 1 then
    LJNIEnvRes^.ExceptionClear(LJNIEnvRes);
end;

///
/// Call this whenever you go to look up RTTI for something and you couldn't
/// find it.  Note that you should only do this for cases where you reasonably
/// believe that the user passed in the right sort of type, and you just can't
/// find the RTTI for it, with the probably cause being that the user forgot to
/// include {$M+}.  Don't call this if you were hoping to find a method in
/// a class, and it wasn't there, possibly because the user forgot to put it there.
///
/// <param name="Name">Name of the type we couldn't find RTTI for</param>
procedure NoRtti(Name: string);
begin
  raise EJNI.CreateResFmt(@SJNIRTTINotAvailable, [Name]);
end;

function BuildBasicImportMarshalingInfo(const Method: TRttiMethod;
  var Ops: TArray<TMarshalOp>): Integer;
var
  Size, Cnt: Integer;
  Param: TRttiParameter;
begin
  Size := 0;
  Cnt := 0;
  SetLength(Ops, 20); // Max 20 params
  for Param in Method.GetParameters do
  begin
    if (Param.ParamType.TypeKind = tkInterface) then
    begin
      Ops[Cnt].Size := 4;
      Ops[Cnt].Kind := moJNIObject;
    end
    else
    begin
      if (Param.ParamType.TypeKind = tkClass) then
      begin
        Ops[Cnt].Size := 4;
        Ops[Cnt].Kind := moJNIArray;
      end
      else
      begin
        Ops[Cnt].Size := Param.ParamType.TypeSize;
        Ops[Cnt].Kind := moCopy;
      end;
    end;
    Size := Size + Ops[Cnt].Size;
    Inc(Cnt);
  end;
  SetLength(Ops, Cnt); // Adjust params
  Result := Size;
end;

function MangleType(const AType: TRttiType): string; forward;

function MangleGenericType(const AType: TRttiType): string;
var
  BaseName: string;
  Context: TRttiContext;
  ArrType: TRttiType;
begin
  BaseName := AType.toString;
  BaseName := BaseName.Substring(BaseName.IndexOf('<') + 1);
  BaseName := BaseName.Substring(0, BaseName.IndexOf('>'));
  Result := BaseName;

  Context := TRttiContext.Create;
  try
    ArrType := Context.FindType(BaseName);
    if ArrType = nil then
      ArrType := Context.GetType(TRegTypes.GetType(BaseName));
    Result := '[' + MangleType(ArrType);
  finally
    Context.Free;
  end;
end;

function MangleType(const AType: TRttiType): string;
var
  Attrs: TArray<TCustomAttribute>;
  SigAttr: JavaSignatureAttribute;
  OrdType: TRttiOrdinalType;
begin
  Result := '';

  case AType.TypeKind of
    tkEnumeration:
      Result := 'Z'; // Boolean type

    tkWChar:
      Result := 'C';

    tkInteger:
      begin
        if AType.IsOrdinal then
        begin
          OrdType := AType.AsOrdinal;
          case OrdType.OrdType of
            otSWord, otUWord:
              Result := 'S';
            otUByte, otSByte:
              Result := 'B';
            otSLong, otULong:
              Result := 'I';
          end
        end
        else
          Result := 'I';
      end;

    tkInt64:
      Result := 'J';

    tkClass: // We use tkClass to detect array types
      Result := MangleGenericType(AType);

    tkInterface:
      begin
        Attrs := AType.GetAttributes; // We need the class signature
        if Length(Attrs) > 0 then
        begin
          SigAttr := JavaSignatureAttribute(Attrs[0]);
          Result := 'L' + SigAttr.Signature + ';';
        end;
      end;

    tkFloat:
      begin
        case TRttiFloatType(AType).FloatType of
          ftSingle:
            Result := 'F';
          ftDouble:
            Result := 'D';
        end
      end
  end;
end;

function GetMethodSignature(const Method: TRttiMethod): string;
var
  Param: TRttiParameter;
begin
  Result := '(';
  for Param in Method.GetParameters do
    Result := Result + MangleType(Param.ParamType);
  Result := Result + ')';

  if (Method.ReturnType <> nil) and (Method.Name <> DefaultJConstructorName)
  then
    Result := Result + MangleType(Method.ReturnType)
  else
    Result := Result + 'V';
end;

function RttiTypeToPlain(const AType: TRttiType): TRetKind;
var
  OrdType: TRttiOrdinalType;
begin
  Result := rkInt;
  case AType.TypeKind of
    tkEnumeration:
      Result := rkBoolean; // Boolean type

    tkWChar:
      Result := rkChar;

    tkInteger:
      begin
        if AType.IsOrdinal then
        begin
          OrdType := AType.AsOrdinal;
          case OrdType.OrdType of
            otUByte, otSByte:
              Result := rkByte;
            otSWord, otUWord:
              Result := rkShort;
            otSLong, otULong:
              Result := rkInt;
          end
        end
        else
          Result := rkInt;
      end;

    tkInt64:
      Result := rkLong;

    tkClass: // We use tkClass to detect array types
      Result := rkInstance;

    tkInterface:
      Result := rkObject;

    tkFloat:
      begin
        case TRttiFloatType(AType).FloatType of
          ftSingle:
            Result := rkFloat;
          ftDouble:
            Result := rkDouble;
        end
      end
  end;
end;

function MethodIDFor(const Method: TRttiMethod; ClsID: Pointer;
  IsClassTable: Boolean): JNIMethodID;
var
  MethodSig: string;
begin
  MethodSig := GetMethodSignature(Method);
  if IsClassTable and (Method.Name <> DefaultJConstructorName) then
    Result := TJNIResolver.GetJavaStaticMethodID(ClsID, Method.Name, MethodSig)
  else
    Result := TJNIResolver.GetJavaMethodID(ClsID, Method.Name, MethodSig,
      IsClassTable);
end;

{ This function allow to overcome Google bug on JNI layer on Android < 3.0. We can't get class constants values }
{ unless you specify the exact class when the constant is declared, not an inherited one. }
function FindStaticFieldID(const Method: TRttiMethod; const PropType: TRttiType;
  var ClsID: Pointer): Pointer;
const
  ClassSufixLength = 5; // 'Class' suffix
var
  LParent: TRttiType;
  LMethod: TRttiMethod;
  LClsID: Pointer;
  LContext: TRttiContext;
  AType: TRttiType;
begin
  Result := nil;
  LParent := Method.Parent;
  LMethod := nil;
  while (LParent <> nil) and (LMethod = nil) do
  begin
    LMethod := LParent.GetMethod(Method.Name);
    if LMethod = nil then
      LParent := LParent.BaseType;
  end;
  if (LMethod <> nil) and (LParent <> nil) and (LParent.IsPublicType) then
  begin
    LContext := TRttiContext.Create;
    try
      AType := LContext.FindType(LParent.QualifiedName.Substring(0,
        LParent.QualifiedName.Length - ClassSufixLength));
      if AType <> nil then
      begin
        LClsID := GetClassSignature(AType);
        if LClsID <> nil then
        begin
          ClsID := LClsID;
          Result := TJNIResolver.GetJavaStaticFieldID(ClsID,
            Method.Name.Substring(DefaultJGetterLength), MangleType(PropType));
        end;
      end;

    finally
      LContext.Free;
    end;
  end;
end;

function MethodIDForProperty(const Method: TRttiMethod; var ClsID: Pointer;
  IsClassTable: Boolean; var MethodKind: TMethodKind; var RetKind: TRetKind;
  var JavaType: PTypeInfo; var RetClsID: Pointer): Pointer;
var
  Params: TArray<TRttiParameter>;
  PropType: TRttiType;
begin
  if Method.MethodKind = mkProcedure then // Setter
  begin
    if IsClassTable then
      MethodKind := mkClassPropertySetMethod
    else
      MethodKind := mkPropertySetMethod;
    JavaType := nil;
    Params := Method.GetParameters;
    if Length(Params) = 1 then
      PropType := Params[0].ParamType
    else
      raise EJNIFatal.CreateResFmt(@SJNIInvalidSetter,
        [Method.QualifiedClassName]);
  end
  else
  begin // Getter
    if IsClassTable then
      MethodKind := mkClassPropertyGetMethod
    else
      MethodKind := mkPropertyGetMethod;
    if Method.ReturnType <> nil then
    begin
      PropType := Method.ReturnType;
      JavaType := PropType.Handle;
      RetClsID := GetClassSignature(PropType);
    end
    else
      raise EJNIFatal.CreateResFmt(@SJNIInvalidGetter,
        [Method.QualifiedClassName]);
  end;
  RetKind := RttiTypeToPlain(PropType);
  if IsClassTable then
  begin
    Result := TJNIResolver.GetJavaStaticFieldID(ClsID,
      Method.Name.Substring(DefaultJGetterLength), MangleType(PropType));
    if (Result = nil) and (TOSVersion.Major < 4) then
      Result := FindStaticFieldID(Method, PropType, ClsID);
  end
  else
    Result := TJNIResolver.GetJavaFieldID(ClsID,
      Method.Name.Substring(DefaultJGetterLength), MangleType(PropType));
end;

function IsSetterOrGetter(const Method: TRttiMethod): Boolean;
var
  Prefix: string;
begin
  Prefix := Method.Name.Substring(0, DefaultJSetter.Length);
  if (Prefix.CompareText(Prefix, DefaultJSetter) = 0) or
    (Prefix.CompareText(Prefix, DefaultJGetter) = 0) then
    Result := True
  else
    Result := False;
end;

function BuildJNIMethodInvokeData(const Method: TRttiMethod; ClsID: Pointer;
  IsClassTable: Boolean): JNIMethodInvokeData;
begin
  if IsSetterOrGetter(Method) then
    Result.MethodID := MethodIDForProperty(Method, ClsID, IsClassTable,
      Result.MethodType, Result.RetKind, Result.JavaType, Result.RetClsID)
  else
  begin
    Result.MethodID := MethodIDFor(Method, ClsID, IsClassTable);
    if IsClassTable then
      Result.MethodType := mkClassMethod
    else
      Result.MethodType := mkObjectMethod;

    if Method.ReturnType <> nil then
    begin
      Result.RetKind := RttiTypeToPlain(Method.ReturnType);
      if (Method.ReturnType.TypeKind = tkInterface) or
        (Method.ReturnType.TypeKind = tkClass) then
      begin
        Result.JavaType := Method.ReturnType.Handle;
        Result.RetClsID := GetClassSignature(Method.ReturnType);
      end
      else
        Result.JavaType := nil;
      if IsClassTable and (Method.Name = DefaultJConstructorName) then
        Result.RetKind := rkConstructor;
    end
    else
      Result.RetKind := rkVoid;
  end;
  BuildBasicImportMarshalingInfo(Method, Result.Params);
  Result.Size := Length(Result.Params) * 8;
  if Result.Size = 0 then
    Result.Size := 8;
  Result.Instance := ClsID;
end;

procedure GetMethodsInVTableOrder(const RttiType: TRttiType;
  const Methods: TList<TRttiMethod>); overload;
var
  BaseType: TRttiType;
  Method: TRttiMethod;
begin
  BaseType := RttiType.BaseType;
  if BaseType <> nil then
    GetMethodsInVTableOrder(BaseType, Methods);
  for Method in RttiType.GetDeclaredMethods do
    Methods.Add(Method);
end;

function GetMethodsInVTableOrder(const RttiType: TRttiType)
  : TList<TRttiMethod>; overload;
begin
  Result := TList<TRttiMethod>.Create;
  GetMethodsInVTableOrder(RttiType, Result);
end;

function BuildInvokeData(P: PTypeInfo; ClsID: Pointer; IsClassTable: Boolean)
  : TArray<JNIMethodInvokeData>;
var
  Method: TRttiMethod;
  RttiType: TRttiType;
  Context: TRttiContext;
  List: TList<JNIMethodInvokeData>;
  Methods: TList<TRttiMethod>;
begin
  Context := TRttiContext.Create;
  try
    RttiType := Context.GetType(P);
    if RttiType = nil then
      NoRtti(string(P^.NameFld.toString));

    Methods := GetMethodsInVTableOrder(RttiType);
    List := TList<JNIMethodInvokeData>.Create;
    try

      for Method in Methods do
        List.Add(BuildJNIMethodInvokeData(Method, ClsID, IsClassTable));

      Result := List.ToArray;
    finally
      List.Free;
    end;

  finally
    Methods.Free;
    Context.Free;
  end;
end;

constructor TJavaVTable.Create(P: PTypeInfo; ClsID: Pointer;
  IsClassTable: Boolean);
var
  I: Integer;
  GuidCount: Integer;
  Parent: PTypeInfo;
  function GetParent(P: PTypeInfo): PTypeInfo;
  var
    PP: PPTypeInfo;
  begin
    PP := GetTypeData(P).IntfParent;
    if PP <> nil then
      Result := PP^
    else
      Result := nil;
  end;

begin
  FMethodInfoData := BuildInvokeData(P, ClsID, IsClassTable);
  inherited Create(Length(FMethodInfoData));
  Parent := GetParent(P);
  GuidCount := 1;
  while Parent <> nil do
  begin
    Inc(GuidCount);
    Parent := GetParent(Parent);
  end;

  SetLength(FGuids, GuidCount);

  for I := 0 to GuidCount - 1 do
  begin
    FGuids[I] := GetTypeData(P)^.Guid;
    P := GetParent(P);
  end;

  for I := 0 to Length(FMethodInfoData) - 1 do
    SetVTableSlot(I, @DispatchToImport, @FMethodInfoData[I]);
end;

{ TJavaImport }

function TJavaImport.GetObjectID: Pointer;
begin
  Result := FJNIObjectID;
end;

constructor TJavaImport.Create(ID: Pointer; const VTable: TJavaVTable);
begin
  inherited Create(VTable.Guids, VTable);
  if ID <> nil then
    FJNIObjectID := TJNIResolver.NewGlobalRef(ID)
  else
    FJNIObjectID := nil;
end;

destructor TJavaImport.Destroy;
begin
  TJNIResolver.DeleteGlobalRef(GetObjectID);
end;

{ TJavaGenericImport }

class procedure TBridgeHelper.GetJavaClass(CTypeInfo, ITypeInfo: PTypeInfo;
  var AJavaClass: IJavaClass; var AClsID: Pointer;
  var AClassVTable: TJavaVTable);
var
  ClassImport: TJavaImport;
  Context: TRttiContext;
  RttiType: TRttiType;
  Attrs: TArray<TCustomAttribute>;
  SigAttr: JavaSignatureAttribute;
begin
  if AJavaClass = nil then
  begin
    TMonitor.Enter(FGetClassLock);
    // weird case when 2 threads try to access to the java class at the same time and the class is not initializated
    try
      if AJavaClass = nil then
      begin
        TJavaValidate.ValidateClassHierarchy(CTypeInfo);
        TJavaValidate.ValidateInstanceHierarchy(ITypeInfo);
        Context := TRttiContext.Create;
        try
          RttiType := Context.GetType(ITypeInfo);
          Attrs := RttiType.GetAttributes; // We need the class signature
          if Length(Attrs) > 0 then
          begin
            SigAttr := JavaSignatureAttribute(Attrs[0]);
            AClsID := TJNIResolver.InternalGetJavaClassID(SigAttr.Signature);
            if AClsID = nil then
              raise EJNI.CreateResFmt(@SJNIClassNotFound,
                [ITypeInfo^.NameFld.toString]);
            AClassVTable := TVTableCache.GetVTable(CTypeInfo, AClsID, True);
            ClassImport := TJavaImport.Create(AClsID, AClassVTable);
            if ClassImport.QueryInterface(GetTypeData(CTypeInfo)^.Guid,
              AJavaClass) <> 0 then
              raise EJNI.CreateResFmt(@SInternalBindingError,
                [ITypeInfo^.NameFld.toString]);
          end;
        finally
          Context.Free;
        end;
      end;
    finally
      TMonitor.Exit(FGetClassLock);
    end;
  end;
end;

class function TJavaGenericImport<C, T>.GetJavaClass: C;
begin
  TBridgeHelper.GetJavaClass(TypeInfo(C), TypeInfo(T), IJavaClass(FJavaClass),
    FJNIClassID, FClassVTable);
  Result := FJavaClass;
end;

class constructor TBridgeHelper.Create;
begin
  FGetClassLock := TObject.Create;
end;

class destructor TBridgeHelper.Destroy;
begin
  FGetClassLock.Free;
end;

class function TBridgeHelper.GetClsID(var AClsID: Pointer;
  LTypeInfo: PTypeInfo): Pointer;
var
  Context: TRttiContext;
  ClassType: TRttiType;
  Attrs: TArray<TCustomAttribute>;
  SigAttr: JavaSignatureAttribute;
begin
  if AClsID = nil then
  begin
    Context := TRttiContext.Create;
    try
      ClassType := Context.GetType(LTypeInfo);
      Attrs := ClassType.GetAttributes; // We need the class signature
      if Length(Attrs) > 0 then
      begin
        SigAttr := JavaSignatureAttribute(Attrs[0]);
        AClsID := TJNIResolver.InternalGetJavaClassID(SigAttr.Signature);
      end;
    finally
      Context.Free;
    end;
  end;
  Result := AClsID;
end;

class function TJavaGenericImport<C, T>.GetClsID: Pointer;
begin
  Result := TBridgeHelper.GetClsID(FJNIClassID, TypeInfo(T));
end;

class function TBridgeHelper.GetInstanceVTable(var AVTable: TJavaVTable;
  ATypeInfo: PTypeInfo; ClsID: Pointer): TJavaVTable;
begin
  if AVTable = nil then
    AVTable := TVTableCache.GetVTable(ATypeInfo, ClsID, False);
  Result := AVTable;
end;

class procedure TBridgeHelper.Alloc(var ClsID: Pointer; ITypeInfo: PTypeInfo;
  var AVTable: TJavaVTable; var Resp);
var
  Obj: TJavaImport;
  LJNIObj: Pointer;
begin
  GetClsID(ClsID, ITypeInfo); // Update ClsID if it's nil

  LJNIObj := TJNIResolver.NewObject(ClsID);
  try
    GetInstanceVTable(AVTable, ITypeInfo, ClsID); // Update AVTable if it's nil
    Obj := TJavaImport.Create(LJNIObj, AVTable);
  finally
    TJNIResolver.DeleteLocalRef(LJNIObj);
  end;

  if Obj.QueryInterface(GetTypeData(ITypeInfo)^.Guid, Resp) <> 0 then
    raise EJNI.CreateResFmt(@SInternalBindingError,
      [string(ITypeInfo^.NameFld.toString)]);
end;

class function TJavaGenericImport<C, T>.Alloc: T;
begin
  TBridgeHelper.Alloc(FJNIClassID, TypeInfo(T), FInstanceVTable, Result);
end;

class procedure TBridgeHelper.Wrap(P: Pointer; ITypeInfo: PTypeInfo;
  var JNIClassID: Pointer; var ATable: TJavaVTable; var Resp);
var
  Obj: TJavaImport;
begin
  if P = nil then
    Pointer(Resp) := nil
  else
  begin
    GetClsID(JNIClassID, ITypeInfo); // Update JNIClassID if it's nil
    GetInstanceVTable(ATable, ITypeInfo, JNIClassID);
    // Update AVTable if it's nil
    Obj := TJavaImport.Create(P, ATable);
    if Obj.QueryInterface(GetTypeData(ITypeInfo)^.Guid, Resp) <> 0 then
      raise EJNI.CreateResFmt(@SInternalBindingError,
        [ITypeInfo^.NameFld.toString]);
  end;
end;

class function TJavaGenericImport<C, T>.Wrap(AJNIObjectID: Pointer): T;
begin
  TBridgeHelper.Wrap(AJNIObjectID, TypeInfo(T), FJNIClassID,
    FInstanceVTable, Result)
end;

class procedure TBridgeHelper.WrapInstance(const I: IJavaInstance;
  ITypeInfo: PTypeInfo; var JNIClassID: Pointer; var ATable: TJavaVTable;
  var Resp);
begin
  Wrap((I as ILocalObject).GetObjectID, ITypeInfo, JNIClassID, ATable, Resp);
end;

class function TJavaGenericImport<C, T>.Wrap(const AInstance: IJavaInstance): T;
begin
  TBridgeHelper.WrapInstance(AInstance, TypeInfo(T), FJNIClassID,
    FInstanceVTable, Result);
end;

class function TJavaGenericImport<C, T>.Create: T;
begin
  Result := Alloc;
end;

{ TVTableCache }

class constructor TVTableCache.Create;
begin
  VTables := TDictionary<PTypeInfo, TJavaVTable>.Create;
end;

class function TVTableCache.GetVTable(P: PTypeInfo; ClsID: Pointer;
  IsClassTable: Boolean): TJavaVTable;
begin
  TMonitor.Enter(VTables);
  try
    if not VTables.ContainsKey(P) then
    begin
      Result := TJavaVTable.Create(P, ClsID, IsClassTable);
      VTables.Add(P, Result);
    end
    else
      Result := VTables.Items[P];
  finally
    TMonitor.Exit(VTables);
  end;
end;

{ TJavaArray<T> }

class procedure TBridgeHelper.ProcessArray(LInfo: PTypeInfo;
  const Context: TRttiContext; var FArrayReleaser: Pointer;
  var FArrayGetter: Pointer; var FBaseType: TRttiType; var Handle: JNIArray;
  var FClassID: JNIClass; CreateArray: Boolean; Len: Integer; AHandle: Pointer);
var
  AType: TRttiType;
  JNIEnv: PJNIEnv;
  LocalRef: JNIArray;
begin
  AType := Context.GetType(LInfo);
  JNIEnv := TJNIResolver.GetJNIEnv;
  FArrayReleaser := nil;
  FBaseType := AType;
  case AType.TypeKind of
    tkEnumeration:
      begin
        if CreateArray then
          Handle := JNIEnv^.NewBooleanArray(JNIEnv, Len)
        else
          Handle := AHandle;
        FArrayGetter := @JNIEnv^.GetBooleanArrayElements;
        FArrayReleaser := @JNIEnv^.ReleaseBooleanArrayElements;
      end;

    tkWChar:
      begin
        if CreateArray then
          Handle := JNIEnv^.NewCharArray(JNIEnv, Len)
        else
          Handle := AHandle;
        FArrayGetter := @JNIEnv^.GetCharArrayElements;
        FArrayReleaser := @JNIEnv^.ReleaseCharArrayElements;
      end;

    tkInteger:
      begin
        if AType.IsOrdinal then
        begin
          case AType.AsOrdinal.OrdType of
            otSByte, otUByte:
              begin
                if CreateArray then
                  Handle := JNIEnv^.NewByteArray(JNIEnv, Len)
                else
                  Handle := AHandle;
                FArrayGetter := @JNIEnv^.GetByteArrayElements;
                FArrayReleaser := @JNIEnv^.ReleaseByteArrayElements;
              end;
            otSWord, otUWord:
              begin
                if CreateArray then
                  Handle := JNIEnv^.NewShortArray(JNIEnv, Len)
                else
                  Handle := AHandle;
                FArrayGetter := @JNIEnv^.GetShortArrayElements;
                FArrayReleaser := @JNIEnv^.ReleaseShortArrayElements;
              end;
            otSLong, otULong:
              begin
                if CreateArray then
                  Handle := JNIEnv^.NewIntArray(JNIEnv, Len)
                else
                  Handle := AHandle;
                FArrayGetter := @JNIEnv^.GetIntArrayElements;
                FArrayReleaser := @JNIEnv^.ReleaseIntArrayElements;
              end;
          end
        end
        else
        begin
          if CreateArray then
            Handle := JNIEnv^.NewIntArray(JNIEnv, Len)
          else
            Handle := AHandle;
          FArrayGetter := @JNIEnv^.GetIntArrayElements;
          FArrayReleaser := @JNIEnv^.ReleaseIntArrayElements;
        end;
      end;

    tkInt64:
      begin
        if CreateArray then
          Handle := JNIEnv^.NewLongArray(JNIEnv, Len)
        else
          Handle := AHandle;
        FArrayGetter := @JNIEnv^.GetLongArrayElements;
        FArrayReleaser := @JNIEnv^.ReleaseLongArrayElements;
      end;

    tkInterface:
      begin
        if CreateArray then
        begin
          FClassID := GetClassSignature(AType); // We need the class signature
          Handle := JNIEnv^.NewObjectArray(JNIEnv, Len, FClassID, nil);
        end
        else
          Handle := AHandle;
      end;

    tkFloat:
      begin
        case TRttiFloatType(AType).FloatType of
          ftSingle:
            begin
              if CreateArray then
                Handle := JNIEnv^.NewFloatArray(JNIEnv, Len)
              else
                Handle := AHandle;
              FArrayGetter := @JNIEnv^.GetFloatArrayElements;
              FArrayReleaser := @JNIEnv^.ReleaseFloatArrayElements;
            end;

          ftDouble:
            begin
              if CreateArray then
                Handle := JNIEnv^.NewDoubleArray(JNIEnv, Len)
              else
                Handle := AHandle;
              FArrayGetter := @JNIEnv^.GetDoubleArrayElements;
              FArrayReleaser := @JNIEnv^.ReleaseDoubleArrayElements;
            end;
        end;
      end
  end;
  if CreateArray then
  begin
    LocalRef := Handle;
    Handle := TJNIResolver.NewGlobalRef(LocalRef);
    TJNIResolver.DeleteLocalRef(LocalRef);
  end;
end;

procedure TJavaArray<T>.ProcessArray(CreateArray: Boolean; Len: Integer;
  AHandle: Pointer);
begin
  FArrayElem := nil;
  TBridgeHelper.ProcessArray(TypeInfo(T), Context, @FArrayReleaser,
    @FArrayGetter, FBaseType, Handle, FClassID, CreateArray, Len, AHandle);
end;

procedure TJavaArray<T>.RefreshValues;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  if (FArrayElem <> nil) and Assigned(FArrayReleaser) then
    FArrayReleaser(LJNIEnvRes, Handle, FArrayElem, JNI_ABORT);

  if Assigned(FArrayGetter) then
    FArrayElem := FArrayGetter(LJNIEnvRes, Handle, @FIsCopy);
end;

constructor TJavaArray<T>.Create(Len: Integer);
begin
  inherited Create;

  ProcessArray(True, Len, nil);
end;

constructor TJavaArray<T>.Create;
begin
  inherited;
end;

destructor TJavaArray<T>.Destroy;
begin
  if (FArrayElem <> nil) and Assigned(FArrayReleaser) then
    FArrayReleaser(TJNIResolver.GetJNIEnv, Handle, FArrayElem, 0);
  TJNIResolver.DeleteGlobalRef(Handle);
  inherited;
end;

function TJavaArray<T>.GetArrayElem: PJavaArrayBaseType;
begin
  if FArrayElem = nil then
    FArrayElem := FArrayGetter(TJNIResolver.GetJNIEnv, Handle, @FIsCopy);
  FElementsAccessed := True;
  Result := FArrayElem;
end;

function TJavaArray<T>.GetItem(AIndex: Integer): T;
var
  AElem: PJavaArrayBaseType;
  NewElem: Pointer;
begin
  AElem := GetArrayElem;
  Inc(AElem, AIndex);
  Result := AElem^;
end;

procedure TJavaArray<T>.SetItem(AIndex: Integer; AValue: T);
var
  AElem: PJavaArrayBaseType;
begin
  AElem := GetArrayElem;
  Inc(AElem, AIndex);
  AElem^ := AValue;
end;

procedure TJavaArray<T>.Sync;
begin
  if (FArrayElem <> nil) and Assigned(FArrayReleaser) then
  begin
    FArrayReleaser(TJNIResolver.GetJNIEnv, Handle, FArrayElem, 0);
    FArrayElem := nil;
  end;
end;

class function TJavaArray<T>.Wrap(const AnArray: TJavaBasicArray)
  : TJavaArray<T>;
begin
  Result := TJavaArray<T>(WrapJNIArray(AnArray.ToPointer,
    TypeInfo(TJavaArray<T>)));
end;

{ TJavaBasicArray }

class constructor TJavaBasicArray.Create;
begin
  Context := TRttiContext.Create;
end;

class destructor TJavaBasicArray.Destroy;
begin
  Context.Free;
  Inherited;
end;

function TJavaBasicArray.GetArrayLength: JNISize;
begin
  Result := TJNIResolver.GetArrayLength(Handle);
end;

function TJavaBasicArray.ToPointer: JNIArray;
begin
  Result := Handle;
end;

{ TJavaObjectArray<T> }

function TJavaObjectArray<T>.GetItem(AIndex: Integer): T;
var
  AObject: JNIObject;
begin
  AObject := TJNIResolver.GetObjectArrayElement(Handle, AIndex);
  WrapJNIReturn(AObject, FClassID, FBaseType.Handle, Result);
end;

function TJavaObjectArray<T>.GetRawItem(AIndex: Integer): JNIObject;
begin
  Result := TJNIResolver.GetObjectArrayElement(Handle, AIndex);
end;

procedure TJavaObjectArray<T>.SetItem(AIndex: Integer; AValue: T);
begin
  TJNIResolver.SetObjectArrayElement(Handle, AIndex, AValue);
end;

procedure TJavaObjectArray<T>.SetRawItem(AIndex: Integer; AValue: JNIObject);
begin
  TJNIResolver.SetRawObjectArrayElement(Handle, AIndex, AValue);
end;

class function TJavaObjectArray<T>.Wrap(const AnArray: TJavaBasicArray)
  : TJavaObjectArray<T>;
begin
  Result := TJavaObjectArray<T>(WrapJNIArray(AnArray.ToPointer,
    TypeInfo(TJavaObjectArray<T>)));
end;

{ TRegTypes }

class constructor TRegTypes.Create;
begin
  RegTypes := TDictionary<string, PTypeInfo>.Create;
end;

class destructor TRegTypes.Destroy;
begin
  if RegTypes <> nil then
    RegTypes.Free;
end;

class procedure TRegTypes.RegisterType(const AQName: string; TI: PTypeInfo);
begin
  RegTypes.AddOrSetValue(AQName, TI);
end;

class function TRegTypes.GetType(const ATypeName: string): PTypeInfo;
begin
  if RegTypes.ContainsKey(ATypeName) then
    Result := RegTypes[ATypeName]
  else
    Result := nil;
end;

procedure RegisterdispatchToNative(Cls: JNIClass); inline;
var
  Exp: JNINativeMethod;
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Exp.Name := 'dispatchToNative';
  Exp.Signature := '(Ljava/lang/String;[Ljava/lang/Object;J)Ljava/lang/Object;';
  Exp.FnPtr := @Androidapi.JNIBridge.dispatchToNative;

  LJNIEnvRes^.RegisterNatives(LJNIEnvRes, Cls, PJNINativeMethod(@Exp), 1);

  Exp.Name := 'cleanNative';
  Exp.Signature := '(J)V';
  Exp.FnPtr := @Androidapi.JNIBridge.cleanNative;

  LJNIEnvRes^.RegisterNatives(LJNIEnvRes, Cls, PJNINativeMethod(@Exp), 1);
end;

{ TJavaLocal }

constructor TJavaLocal.Create;
var
  AContext: TRttiContext;
  AType: TRttiType;
  AInstance: TRttiInstanceType;
  Interfaces: TArray<TRttiInterfaceType>;
  AInterface: TRttiInterfaceType;
  ClsID: JNIClass;
  ProxyClass: JNIClass;
  ProxyConstructor: JNIMethodID;
  CreateProxyClass: JNIMethodID;
  AJNIObject: JNIObject;
  AJNIEnv: PJNIEnv;
begin
  inherited;
  AContext := TRttiContext.Create;
  try
    AType := AContext.GetType(Self.ClassInfo);
    AInstance := AType.AsInstance;
    Interfaces := AInstance.GetDeclaredImplementedInterfaces;
    if Length(Interfaces) > 0 then
    begin
      // Need first declared interface
      AInterface := Interfaces[0];
      ClsID := GetClassSignature(AInterface);
      ProxyClass := TJNIResolver.InternalGetJavaClassID(FProxyInterfaceName);
      if ProxyClass = nil then
        raise EJNIFatal.CreateResFmt(@SJNIClassNotFound, [FProxyInterfaceName]);
      ProxyConstructor := TJNIResolver.GetJavaMethodID(ProxyClass,
        DefaultJConstructor, DefaultJConstructorSig);
      CreateProxyClass := TJNIResolver.GetJavaMethodID(ProxyClass,
        CreateProxyClassMethod, CreateProxyClassSig);
      AJNIEnv := TJNIResolver.GetJNIEnv;
      AJNIObject := nil;
      FLocalRefObjectID := nil;
      try
        AJNIObject := AJNIEnv^.NewObject(AJNIEnv, ProxyClass, ProxyConstructor);
        HandleJNIException(AJNIEnv);
        FLocalRefObjectID := AJNIEnv^.CallObjectMethodA(AJNIEnv, AJNIObject,
          CreateProxyClass, PJNIValue(ArgsToJNIValues([ClsID, Int64(Self)])));
        HandleJNIException(AJNIEnv);
        FObjectID := AJNIEnv^.NewGlobalRef(AJNIEnv, FLocalRefObjectID);
      finally
        if FLocalRefObjectID <> nil then
          AJNIEnv^.DeleteLocalRef(AJNIEnv, FLocalRefObjectID);
        if AJNIObject <> nil then
          AJNIEnv^.DeleteLocalRef(AJNIEnv, AJNIObject);
      end;
    end
    else
      raise EJNIFatal.CreateResFmt(@SJNINoInterface, [AType.toString]);

  finally
    AContext.Free;
  end;
end;

class constructor TJavaLocal.Create;
var
  ProxyClass: JNIClass;
  ProxyConstructor: JNIMethodID;
begin
  if System.DelphiActivity <> nil then
    FProxyInterfaceName := DefaultProxyInterfaceName
  else
    FProxyInterfaceName := GetProxyInterfaceNameFromContext(System.JavaContext);

  ProxyClass := TJNIResolver.InternalGetJavaClassID(FProxyInterfaceName);
  if ProxyClass = nil then
    raise EJNIFatal.CreateResFmt(@SJNIClassNotFound, [FProxyInterfaceName]);

  ProxyConstructor := TJNIResolver.GetJavaMethodID(ProxyClass,
    DefaultJConstructor, DefaultJConstructorSig);
  if ProxyConstructor = nil then
    ProxyConstructor := TJNIResolver.GetJavaMethodID(ProxyClass,
      DefaultJConstructor, DefaultJConstructorSig, False);
  if ProxyConstructor = nil then
    raise EJNIFatal.CreateResFmt(@SJNIMethodNotFound,
      [FProxyInterfaceName + '.' + DefaultJConstructor]);

  RegisterdispatchToNative(ProxyClass);
end;

destructor TJavaLocal.Destroy;
begin
  TJNIResolver.DeleteGlobalRef(FObjectID);

  inherited;
end;

function TJavaLocal.GetObjectID: Pointer;
begin
  Result := FObjectID;
end;

class function TJavaLocal.GetProxyInterfaceNameFromContext
  (AContext: JNIObject): string;
var
  Env: PJNIEnv;
  Clazz: JNIClass;
  JavaClazz: JNIClass;
  MethodID: JNIMethodID;
  JNIClassName: JNIObject;
begin
  PJavaVM(System.JavaMachine)^.AttachCurrentThread(System.JavaMachine,
    @Env, nil);
  Clazz := Env^.GetObjectClass(Env, AContext);
  JavaClazz := Env^.FindClass(Env, 'java/lang/Class');
  MethodID := Env^.GetMethodID(Env, JavaClazz, 'getName',
    '()Ljava/lang/String;');
  JNIClassName := Env^.CallObjectMethod(Env, Clazz, MethodID);

  Result := JNIStringToString(Env, JNIClassName).Replace('.', '/') +
    'ProxyInterface';
  Env^.DeleteLocalRef(Env, JNIClassName);
  Env^.DeleteLocalRef(Env, JavaClazz);
  Env^.DeleteLocalRef(Env, Clazz);
end;

function TJavaLocal.equals(Obj: Pointer): Boolean;
var
  LJNIEnvRes: PJNIEnv;
begin
  LJNIEnvRes := TJNIResolver.GetJNIEnv;
  Result := Boolean(LJNIEnvRes^.IsSameObject(LJNIEnvRes, Obj, FObjectID));
end;

function TJavaLocal.getName: JNIString;
begin
  Result := StringToJNIString(TJNIResolver.GetJNIEnv, ClassName);
end;

function TJavaLocal.hashCode: Integer;
begin
  Result := Integer(Self);
end;

function TJavaLocal.toString: JNIString;
begin
  Result := StringToJNIString(TJNIResolver.GetJNIEnv, ClassName);
end;

{ TJavaValidate }

class procedure TJavaValidate.ValidateClassHierarchy(P: PTypeInfo);
begin
  TJavaValidate.ValidateTypeHierarchy(P, TypeInfo(IJavaClass), @SBadJNIClass);
end;

class procedure TJavaValidate.ValidateInstanceHierarchy(P: PTypeInfo);
begin
  TJavaValidate.ValidateTypeHierarchy(P, TypeInfo(IJavaInstance),
    @SBadJNIInstance);
end;

procedure CheckForRtti(P: PTypeInfo);
var
  MethodTable: PIntfMethodTable;
begin
  MethodTable := GetTypeData(P).IntfMethods;
  if (MethodTable^.Count > 0) and (MethodTable^.RttiCount = $FFFF) then
    NoRtti(string(P^.NameFld.toString));
end;

class procedure TJavaValidate.ValidateTypeHierarchy(P, RequiredRoot: PTypeInfo;
  ErrMsg: PResStringRec);
var
  PP: PPTypeInfo;
  procedure BadType;
  begin
    raise EJNI.CreateResFmt(ErrMsg, [string(P^.NameFld.toString)]);
  end;

begin
  if P^.Kind <> tkInterface then
    BadType;
  while P <> nil do
  begin
    CheckForRtti(P);
    if P = RequiredRoot then
      Exit;
    PP := GetTypeData(P).IntfParent;
    if PP <> nil then
      P := PP^
    else
      P := nil;
  end;
  BadType;
end;

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('System.Boolean', TypeInfo(System.Boolean));
  TRegTypes.RegisterType('System.Char', TypeInfo(System.Char));
  TRegTypes.RegisterType('System.WideChar', TypeInfo(System.WideChar));
  TRegTypes.RegisterType('System.ShortInt', TypeInfo(System.ShortInt));
  TRegTypes.RegisterType('System.SmallInt', TypeInfo(System.SmallInt));
  TRegTypes.RegisterType('System.Integer', TypeInfo(System.Integer));
  TRegTypes.RegisterType('System.Byte', TypeInfo(System.Byte));
  TRegTypes.RegisterType('System.Word', TypeInfo(System.Word));
  TRegTypes.RegisterType('System.Pointer', TypeInfo(System.Pointer));
  TRegTypes.RegisterType('System.LongInt', TypeInfo(System.LongInt));
  TRegTypes.RegisterType('System.Cardinal', TypeInfo(System.Cardinal));
  TRegTypes.RegisterType('System.LongWord', TypeInfo(System.LongWord));
  TRegTypes.RegisterType('System.Int64', TypeInfo(System.Int64));
  TRegTypes.RegisterType('System.UInt64', TypeInfo(System.UInt64));
  TRegTypes.RegisterType('System.NativeInt', TypeInfo(System.NativeInt));
  TRegTypes.RegisterType('System.NativeUInt', TypeInfo(System.NativeUInt));
  TRegTypes.RegisterType('System.Single', TypeInfo(System.Single));
  TRegTypes.RegisterType('System.Extended80', TypeInfo(System.Extended80));
  TRegTypes.RegisterType('System.Extended', TypeInfo(System.Extended));
  TRegTypes.RegisterType('System.Double', TypeInfo(System.Double));
  TRegTypes.RegisterType('System.Real', TypeInfo(System.Real));
  TRegTypes.RegisterType('System.Comp', TypeInfo(System.Comp));
  TRegTypes.RegisterType('System.Currency', TypeInfo(System.Currency));
  TRegTypes.RegisterType('System.ByteBool', TypeInfo(System.ByteBool));
  TRegTypes.RegisterType('System.WordBool', TypeInfo(System.WordBool));
  TRegTypes.RegisterType('System.LongBool', TypeInfo(System.LongBool));
  TRegTypes.RegisterType('System.string', TypeInfo(System.string));
  TRegTypes.RegisterType('System.UnicodeString',
    TypeInfo(System.UnicodeString));
end;

initialization

RegisterTypes;

end.


