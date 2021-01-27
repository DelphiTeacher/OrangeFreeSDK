{*******************************************************}
{                                                       }
{               Delphi Runtime Library                  }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.Rtti;

{$R-,T-,X+,H+,B-}

interface

{$WARN DUPLICATE_CTOR_DTOR OFF}
{$WARN IMMUTABLE_STRINGS ON}

uses
  System.Variants, System.TypInfo, System.SysUtils, System.Generics.Collections;

// Dcciosarm doesn't use VFP registers
{$IF defined(IOS) and defined(CPUARM32)}
  // Dcciosarm doesn't use VFP registers if XE6 or before
  {$IF (CompilerVersion < 28.0)}
    {$DEFINE ARM_NO_VFP_USE}
  {$ENDIF}
{$ENDIF}

{$HPPEMIT LEGACYHPP}
(*$HPPEMIT END '#include <SystemRtti.h>'*)

type
  EInsufficientRtti = class(Exception);
  EInvocationError = class(Exception);
  // Types not declared in interface section of unit have no qualified name
  // and can't be looked up by name.
  ENonPublicType = class(Exception);

  IValueData = interface
    function GetDataSize: Integer;
    // Will extract a *copy* of the internal data.
    procedure ExtractRawData(ABuffer: Pointer);
    procedure ExtractRawDataNoCopy(ABuffer: Pointer);
    function GetReferenceToRawData: Pointer;
  end;

  TValueData = record
    FTypeInfo: PTypeInfo;
    // FValueData vs old FHeapData:
    // FHeapData doubled as storage for interfaces. However, that was ambiguous
    // in the case of nil interface values: FTypeInfo couldn't be trusted
    // because it looked like the structure was uninitialized. Then, DataSize
    // would be 0.
    // FValueData is different: interfaces are always stored like strings etc.,
    // as a reference stored in a blob on the heap.
    FValueData: IValueData;
    case Integer of
      0: (FAsUByte: Byte);
      1: (FAsUWord: Word);
      2: (FAsULong: Cardinal);
      3: (FAsObject: Pointer);
      4: (FAsClass: TClass);
      5: (FAsSByte: ShortInt);
      6: (FAsSWord: SmallInt);
      7: (FAsSLong: Integer);
      8: (FAsSingle: Single);
      9: (FAsDouble: Double);
      10: (FAsExtended: Extended);
      11: (FAsComp: Comp);
      12: (FAsCurr: Currency);
      13: (FAsUInt64: UInt64);
      14: (FAsSInt64: Int64);
      15: (FAsMethod: TMethod);
      16: (FAsPointer: Pointer);
  end;

  [HPPGEN(HPPGenAttribute.mkNonPackage)]
  TValue = record
  private
    function GetIsEmpty: Boolean;
    function GetTypeInfo: PTypeInfo;
    function GetTypeKind: TTypeKind;
    function GetTypeDataProp: PTypeData;
    function GetDataSize: Integer;
    constructor Create(ATypeInfo: PTypeInfo);
    class function GetEmpty: TValue; static;
    procedure Get<T>(out Result: T);
  public
    // Easy in
    class operator Implicit(const Value: string): TValue;
    class operator Implicit(Value: Integer): TValue;
    class operator Implicit(Value: Cardinal): TValue;

    class operator Implicit(Value: Single): TValue;
    class operator Implicit(Value: Double): TValue;
    class operator Implicit(Value: Extended): TValue;
    class operator Implicit(Value: Currency): TValue;
    class operator Implicit(Value: Int64): TValue;
    class operator Implicit(Value: UInt64): TValue;
    class operator Implicit(Value: TObject): TValue;
    class operator Implicit(Value: TClass): TValue;
    class operator Implicit(Value: Boolean): TValue;
    class operator Implicit(const VarRec: TVarRec): TValue; inline;
    class function FromVariant(const Value: Variant): TValue; static;
    class function From<T>(const Value: T): TValue; static;
    class function FromOrdinal(ATypeInfo: PTypeInfo; AValue: Int64): TValue; static;
    class function FromArray(ArrayTypeInfo: PTypeInfo; const Values: array of TValue): TValue; static;
    class function FromVarRec(const VarRec: TVarRec): TValue; static;

    // Easy out
    property Kind: TTypeKind read GetTypeKind;
    property TypeInfo: PTypeInfo read GetTypeInfo;
    property TypeData: PTypeData read GetTypeDataProp;
    // Empty converts to all-zero for the corresponding type, but IsEmpty
    // will only return True for reference types (where 'nil' is logical)
    // and method pointers (where TMethod.Code equivalent is nil).
    // A typeless empty (like 'nil' literal) will also have 0 for DataSize.
    property IsEmpty: Boolean read GetIsEmpty;

    function IsObject: Boolean;
    function IsObjectInstance: Boolean;
    function AsObject: TObject;
    function IsInstanceOf(AClass: TClass): Boolean;

    function IsClass: Boolean;
    function AsClass: TClass;

    function IsOrdinal: Boolean;
    function AsOrdinal: Int64;
    function TryAsOrdinal(out AResult: Int64): Boolean;

    // TValue -> concrete type
    // IsType returns true if AsType or Cast would succeed
    // AsType / Cast are only for what would normally be implicit conversions in Delphi.
    function IsType<T>(const EmptyAsAnyType: Boolean = True): Boolean; overload;
    function IsType(ATypeInfo: PTypeInfo; const EmptyAsAnyType: Boolean = True): Boolean; overload;
    function AsType<T>(const EmptyAsAnyType: Boolean = True): T;
    function TryAsType<T>(out AResult: T; const EmptyAsAnyType: Boolean = True): Boolean;

    // TValue -> TValue conversions
    function Cast<T>(const EmptyAsAnyType: Boolean = True): TValue; overload;
    function Cast(ATypeInfo: PTypeInfo;  const EmptyAsAnyType: Boolean = True): TValue; overload;
    function TryCast(ATypeInfo: PTypeInfo; out AResult: TValue; const EmptyAsAnyType: Boolean = True): Boolean;

    function AsInteger: Integer;
    function AsBoolean: Boolean;
    function AsExtended: Extended;
    function AsInt64: Int64;
    function AsUInt64: UInt64;
    function AsInterface: IInterface;
    function AsString: string;
    function AsVariant: Variant;
    function AsCurrency: Currency;
    function IsArray: Boolean;
    /// <summary>
    ///    Returns a TVarRec instance suitable for passing to an "array of const" parameter such as with Format().
    /// </summary>
    function AsVarRec: TVarRec;

    function GetArrayLength: Integer;
    function GetArrayElement(Index: Integer): TValue;
    procedure SetArrayElement(Index: Integer; const AValue: TValue);

    // Low-level in
    class procedure Make(ABuffer: Pointer; ATypeInfo: PTypeInfo; out Result: TValue); overload; static;
    class procedure Make(AValue: NativeInt; ATypeInfo: PTypeInfo; out Result: TValue); overload; static;
    class procedure MakeWithoutCopy(ABuffer: Pointer; ATypeInfo: PTypeInfo; out Result: TValue; IsMoved: Boolean = False); overload; static;

    // Low-level out
    property DataSize: Integer read GetDataSize;
    procedure ExtractRawData(ABuffer: Pointer);
    // If internal data is something with lifetime management, this copies a
    // reference out *without* updating the reference count.
    procedure ExtractRawDataNoCopy(ABuffer: Pointer);
    function GetReferenceToRawData: Pointer;
    function GetReferenceToRawArrayElement(Index: Integer): Pointer;

    class property Empty: TValue read GetEmpty;

    function ToString: string;
  private
    FData: TValueData;
  end;

/// <summary>
///    Converts an "array of const" (aka. "array of TVarRec") into a dynamic array of TValue instances.
/// </summary>
function ArrayOfConstToTValueArray(const Params: array of const): TArray<TValue>;
/// <summary>
///    Converts a dynamic array of TValue instances to a dynamic array of TVarRec. This dynamic array is suitable for
///    passing to an "array of const" parameter. NOTE: The source array of TValue instances must remain valid while
///    the dynamic array of TVarRec instances is being used.
/// </summary>
function TValueArrayToArrayOfConst(const Params: array of TValue): TArray<TVarRec>;

type
  TRttiPackage = class;

  TRttiObject = class abstract
  private
    FHandle: Pointer;
    FRttiDataSize: Integer;
    [Weak] FPackage: TRttiPackage;
    [Weak] FParent: TRttiObject;
    FAttributeGetter: TFunc<TArray<TCustomAttribute>>;
  private
    // TRttiObject descendants should only be retrieved via an RTTI context.
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); virtual;
  public
    destructor Destroy; override;
    // The starting address of the raw data in the executable image for this RTTI.
    property Handle: Pointer read FHandle;
    // Size of data pointed to by Handle.
    property RttiDataSize: Integer read FRttiDataSize;
    property Parent: TRttiObject read FParent;
    property Package: TRttiPackage read FPackage;
    function GetAttributes: TArray<TCustomAttribute>; virtual;
  end;

  TRttiNamedObject = class(TRttiObject)
  private
    function GetName: string; virtual; abstract;
  public
    property Name: string read GetName;
  end;

  TRttiClass = class of TRttiObject;
  TRttiMethod = class;
  TRttiInstanceType = class;
  TRttiInterfaceType = class;
  TRttiOrdinalType = class;
  TRttiRecordType = class;
  TRttiField = class;
  TRttiProperty = class;
  TRttiIndexedProperty = class;
  TRttiSetType = class;
  TRttiPointerType = class;
  TRttiFloatType = class;

  TRttiType = class(TRttiNamedObject)
  private
    function GetName: string; override;
    function GetTypeKind: TTypeKind;
    function GetTypeData: PTypeData;
    function GetIsManaged: Boolean;
    function GetAsInstance: TRttiInstanceType;
    function GetAsOrdinal: TRttiOrdinalType;
    function GetAsRecord: TRttiRecordType;
    function GetIsInstance: Boolean;
    function GetIsOrdinal: Boolean;
    function GetIsRecord: Boolean;
    function GetHandle: PTypeInfo;
    function GetAsSet: TRttiSetType;
    function GetIsSet: Boolean;
    function GetIsHFA: Boolean; virtual;
    function GetHFAElementType: TRttiFloatType; virtual;
    function GetHFAElementCount: Integer; virtual;
    function GetTypeSize: Integer; virtual;
    function GetQualifiedName: string;
    function GetBaseType: TRttiType; virtual;
    function GetIsPublicType: Boolean;
    property TypeData: PTypeData read GetTypeData;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    function ToString: string; override;
    property Handle: PTypeInfo read GetHandle;
    // QualifiedName is only available on types declared in interface section of units;
    // i.e. IsPublicType is true.
    property QualifiedName: string read GetQualifiedName;
    property IsPublicType: Boolean read GetIsPublicType;
    property TypeKind: TTypeKind read GetTypeKind;
    // The size of a location (variable) of this type.
    property TypeSize: Integer read GetTypeSize;
    property IsManaged: Boolean read GetIsManaged;

    // To make writing query code easier, hoist some methods from descendants
    // into this type. These return elements flattened across the type hierarchy
    // in order from most derived to least derived.
    function GetMethods: TArray<TRttiMethod>; overload; virtual;
    function GetFields: TArray<TRttiField>; virtual;
    function GetProperties: TArray<TRttiProperty>; virtual;
    function GetIndexedProperties: TArray<TRttiIndexedProperty>; virtual;

    function GetMethod(const AName: string): TRttiMethod; virtual;
    function GetMethods(const AName: string): TArray<TRttiMethod>; overload; virtual;
    function GetField(const AName: string): TRttiField; virtual;
    function GetProperty(const AName: string): TRttiProperty; virtual;
    function GetIndexedProperty(const AName: string): TRttiIndexedProperty; virtual;

    function GetDeclaredMethods: TArray<TRttiMethod>; virtual;
    function GetDeclaredProperties: TArray<TRttiProperty>; virtual;
    function GetDeclaredFields: TArray<TRttiField>; virtual;
    function GetDeclaredIndexedProperties: TArray<TRttiIndexedProperty>; virtual;

    // The ancestor for types with ancestors.
    property BaseType: TRttiType read GetBaseType;

    property AsInstance: TRttiInstanceType read GetAsInstance;
    property IsInstance: Boolean read GetIsInstance;
    property AsOrdinal: TRttiOrdinalType read GetAsOrdinal;
    property IsOrdinal: Boolean read GetIsOrdinal;
    property AsRecord: TRttiRecordType read GetAsRecord;
    property IsRecord: Boolean read GetIsRecord;
    property IsSet: Boolean read GetIsSet;
    property AsSet: TRttiSetType read GetAsSet;

    /// <summary>Returns true if the reflected type is HFA.</summary>
    property IsHFA: Boolean read GetIsHFA;
    /// <summary>Return the element type of HFA, if IsHFA is true. Otherwise, Return NIL. </summary>
    property HFAElementType: TRttiFloatType read GetHFAElementType;
    /// <summary>Return the number of element type of HFA, if IsHFA is true. Otherwise, Return 0. </summary>
    property HFAElementCount: Integer read GetHFAElementCount;
  end;

  TRttiMember = class(TRttiNamedObject)
  private
    function GetParent: TRttiType;
    function GetVisibility: TMemberVisibility; virtual;
  public
    property Parent: TRttiType read GetParent;
    property Visibility: TMemberVisibility read GetVisibility;
  end;

  TRttiStructuredType = class abstract(TRttiType)
  end;

  TRttiField = class(TRttiMember)
  private
    function GetFieldType: TRttiType; virtual;
    function GetOffset: Integer; virtual;
  public
    property FieldType: TRttiType read GetFieldType;
    property Offset: Integer read GetOffset;

    function GetValue(Instance: Pointer): TValue; virtual;
    procedure SetValue(Instance: Pointer; const AValue: TValue); virtual;
    function ToString: string; override;
  end;

  TRttiManagedField = class(TRttiObject)
  private
    function GetFieldOffset: Integer;
    function GetFieldType: TRttiType;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    property FieldType: TRttiType read GetFieldType;
    property FieldOffset: Integer read GetFieldOffset;
  end;

  TRttiRecordType = class(TRttiStructuredType)
  private
    FMethOfs: PByte;
{$IF Defined(CPUARM64) or Defined(LINUX64)}
    FHFAElementType: TRttiFloatType;
    FHFAElementCount: Integer;
    FHFAHasInsufficientTypeInformation: Boolean;
{$ENDIF CPUARM64 or LINUX64}
    function GetManagedFields: TArray<TRttiManagedField>;
{$IF Defined(CPUARM64) or Defined(LINUX64)}
    procedure GetHFAElement;
    function GetIsHFA: Boolean; override;
    function GetHFAElementType: TRttiFloatType; override;
    function GetHFAElementCount: Integer; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
{$ENDIF CPUARM64 or LINUX64}
  protected
    function GetTypeSize: Integer; override;
{$IF Defined(CPUARM64) or Defined(LINUX64)}
    property HFAHasInsufficientTypeInformation: Boolean read FHFAHasInsufficientTypeInformation;
{$ENDIF CPUARM64}
  public
    function GetDeclaredFields: TArray<TRttiField>; override;
    function GetDeclaredMethods: TArray<TRttiMethod>; override;
    function GetAttributes: TArray<TCustomAttribute>; override;
    property ManagedFields: TArray<TRttiManagedField> read GetManagedFields;
  end;

  TRttiProperty = class(TRttiMember)
  private
    function GetPropertyType: TRttiType; virtual; abstract;
    function GetIsReadable: Boolean; virtual; abstract;
    function GetIsWritable: Boolean; virtual; abstract;
    function DoGetValue(Instance: Pointer): TValue; virtual; abstract;
    procedure DoSetValue(Instance: Pointer; const AValue: TValue); virtual; abstract;
  public
    property PropertyType: TRttiType read GetPropertyType;
    function GetValue(Instance: Pointer): TValue;
    procedure SetValue(Instance: Pointer; const AValue: TValue);
    property IsReadable: Boolean read GetIsReadable;
    property IsWritable: Boolean read GetIsWritable;
  end;

  PRecordTypeMethod = ^TRecordTypeMethod;

  TRecordTypeMethod = packed record
    Flags: Byte;
    Code: Pointer;
    NameLen: Byte;
   {Name: ShortString;}
   {Sig: TProcedureSignature;
    AttrData: TAttrData;}
  end;

  TRttiInstanceProperty = class(TRttiProperty)
  private
    function GetDefault: Integer; virtual;
    function GetIndex: Integer; virtual;
    function GetNameIndex: SmallInt; virtual;
    function GetPropertyType: TRttiType; override;
    function GetPropInfo: PPropInfo; virtual; abstract;
    function GetName: string; override;
    function GetIsReadable: Boolean; override;
    function GetIsWritable: Boolean; override;
    function DoGetValue(Instance: Pointer): TValue; override;
    procedure DoSetValue(Instance: Pointer; const AValue: TValue); override;
  public
    function ToString: string; override;
    property PropertyType: TRttiType read GetPropertyType;
    property Index: Integer read GetIndex;
    property Default: Integer read GetDefault;
    property NameIndex: SmallInt read GetNameIndex;
    property PropInfo: PPropInfo read GetPropInfo;
  end;

  TRttiParameter = class(TRttiNamedObject)
  private
    function GetFlags: TParamFlags; virtual; abstract;
    function GetParamType: TRttiType; virtual; abstract;
  public
    function ToString: string; override;
    property Flags: TParamFlags read GetFlags;
    // ParamType may be nil if it's an untyped var or const parameter.
    property ParamType: TRttiType read GetParamType;
  end;

  TDispatchKind = (dkStatic, dkVtable, dkDynamic, dkMessage, dkInterface);

  TMethodImplementationCallback = reference to procedure(
    UserData: Pointer;
    const Args: TArray<TValue>;
    out Result: TValue);

  [HPPGEN(HPPGenAttribute.mkFriend, 'DELPHICLASS TRttiMethod; DELPHICLASS TRawVirtualClass')]
  TMethodImplementation = class
{$IF Defined(CPUX86)}
  private const
    // give regs negative values to distinguish from stack offs
    regEAX = not 0;                   // -1
    regEDX = not 1;                   // -2
    regECX = not 2;                   // -3
    regFloat = not 3;                 // -4

    rsNone = 0;
    rsEAX = 1 shl not regEAX;         //  1
    rsEDX = 1 shl not regEDX;         //  2
    rsECX = 1 shl not regECX;         //  4
    rsAll = rsEAX or rsEDX or rsECX;  //  7

  private type
    TFloatReg = record
      case Integer of
        0: {ftSingle} (RegSingle: Single);
        1: {ftDouble} (RegDouble: Double);
        2: {ftExtended} (RegExtended: Extended);
        3: {ftComp} (RegComp: Comp);
        4: {ftCurr} (RegCurr: Currency);
        5: (
          Unused1, Unused2: Pointer;
          Unused3: Word; // limit of data used by Extended
          Kind: TFloatType);
    end;

    TInterceptFrame = record
      FP: TFloatReg;
      RegEAX: Pointer;
      RegEDX: Pointer;
      RegECX: Pointer;
 {$IFDEF PC_MAPPED_EXCEPTIONS}
      /// Fake return address for the unwinder to find to enable
      /// us to unwind the stack past an intercept thunk.
      FakeRA: Pointer;
      /// Number of bytes the callee must clear from the stack on
      /// an unwind
      BytesToPop: Integer;
 {$ENDIF PC_MAPPED_EXCEPTIONS}
      Impl: TMethodImplementation;
      PreviousFrame: Pointer;
      RetAddr: Pointer;
      Args: record end;
    end;

    TFirstStageIntercept = packed record
      PushEBP_55: Byte;
      MovEBP_ESP_1_89: Byte;
      MovEBP_ESP_2_E5: Byte;
      Push_68: Byte;
      PushVal: Pointer;
 {$IFDEF PC_MAPPED_EXCEPTIONS}
      /// Intruction to push the number of bytes to pop (BTP)
      BTP_Push_68: Byte;
      BTP_PushVal: Integer;
      /// Instruction to push the fake return addr for the unwinder to find.
      FakeRA_Push_68: Byte;
      FakeRA_PushVal: Pointer;
 {$ENDIF PC_MAPPED_EXCEPTIONS}
      JmpRel_E9: Byte;
      RelTarget: Integer; // relative to @JmpRel_E9
    end;
{$ELSEIF Defined(CPUX64)}
   private type

    {
      Thunk code:

      MOV RAX, SelfVal
      MOV R10, Target
      JMP R10           // absolute addresss
    }
    TFirstStageIntercept = packed record
      MovRAX_48: Byte;
      MovRAX_B8: Byte;
      SelfVal: Pointer;
      MovR10_49: Byte;
      MovR10_BA: Byte;
      Target: Pointer;
      JmpR10_49: Byte;
      JmpR10_FF: Byte;
      JmpR10_E2: Byte;
    end;
 {$IF Defined(WIN64)}
  private const
    // give regs negative values to distinguish from stack offs
    regRCX = not 0;
    regRDX = not 1;
    regR8  = not 2;
    regR9  = not 3;
    regXMM0 = not 4;
    regXMM1 = not 5;
    regXMM2 = not 6;
    regXMM3 = not 7;
    rsNone = 0;
    rsRCX  = 1 shl not regRCX;
    rsXMM0 = rsRCX;
    rsRDX  = 1 shl not regRDX;
    rsXMM1 = rsRDX;
    rsR8   = 1 shl not regR8;
    rsXMM2 = rsR8;
    rsR9   = 1 shl not regR9;
    rsXMM3 = rsR9;
    rsAll  = rsRCX or rsRDX or rsR8 or rsR9;
  private type
    TInterceptFrame = record
      RegXMM0: Pointer;
      RegXMM1: Pointer;
      RegXMM2: Pointer;
      RegXMM3: Pointer;
      PrevFrame: Pointer;
      RetAddr: Pointer;
      // Take advantage of the fact we're given space for parameters
      RegRCX: Pointer;
      RegRDX: Pointer;
      RegR8: Pointer;
      RegR9: Pointer;
      Args: record end;
    end;
 {$ELSEIF Defined(LINUX64)}
   private type
    TInterceptFrame = record
      RegXMM: array[0..7] of Double; // XMM0-XMM7, XMM0-XMM1 first/second out float   // offset 0-7     $0-$7
      RegR: array [0..5] of Int64;   // RDI, RSI, RDX, RCX, R8, R9                    // offset 8-13    $8-$D
      OutRAX: UInt64;                // RAX, return first integer                     // offset 14      $E
      OutRDX: UInt64;                // RDX, return second integer                    // offset 15      $F
      OutFPU: Extended;              // FPU, return extended                          // offset 16-17   $10-$11
      UseFPU: Int64;                 // Flag to check if FPU is used                  // offset 18      $12
      Filler: array [0..1] of Pointer;
      Args: record end;
    end;
 {$ELSEIF Defined(MACOS64)}
   private type
    TInterceptFrame = record
      RegXMM: array[0..7] of Double; // XMM0-XMM7, XMM0-XMM1 first/second out float   // offset 0-7     $0-$7
      RegR: array [0..5] of Int64;   // RDI, RSI, RDX, RCX, R8, R9                    // offset 8-13    $8-$D
      OutRAX: UInt64;                // RAX, return first integer                     // offset 14      $E
      OutRDX: UInt64;                // RDX, return second integer                    // offset 15      $F
      OutFPU: Extended;              // FPU, return extended                          // offset 16-17   $10-$11
      UseFPU: Int64;                 // Flag to check if FPU is used                  // offset 18      $12
      Filler: array [0..1] of Pointer;
      Args: record end;
    end;
 {$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Missing types for this CPU'}
 {$ENDIF}
{$ELSEIF Defined(CPUARM32)}
  private type
    TVFPRegisters = record
      case Integer of
        0: ( D: array[0..7] of Double ); // 8 * 8 =64
        1: ( S: array[0..15] of Single );
    end;

    { The Filler field is used to store intermediate jumps addresses
      between dispatch_first_stage_intercept->RawIntercept->rtti_raw_intercept,
      so we need 16 bytes:

        RawIntercept Stub  -> push R7, LR
        rtti_raw_intercept -> push R7, LR
    }
    TInterceptFrame = record
      RegFP: TVFPRegisters;
      Filler : array[0..3] of UInt32;
      RegLR,
      RegCR0,
      RegCR1,
      RegCR2,
      RegCR3: UInt32;
      Args: record end;
    end;

    TFirstStageIntercept = record
    end;
{$ELSEIF Defined(CPUARM64)}
  private type
    m128 = record
      case Integer of
        1: (Lo, Hi : UInt64);
        2: (LL, LH, HL, HH: UInt32);
    end;
    TInterceptFrame = record
//  [sp + 0 = Q0, +16 = Q1 ... +128 = X8, +136 = X0, +208 = old FP, +216 = LR ]
      RegFP : array[0..7] of m128;
      RegCR8 : UInt64;
      RegCR : array[0..7] of UInt64;
      Filler : array[0..2] of UInt64;
      Args: record end;
    end;
    TFirstStageIntercept = record
    end;
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Missing types for this CPU'}
{$ENDIF}

  private type
    PInterceptFrame = ^TInterceptFrame;
    PFirstStageIntercept = ^TFirstStageIntercept;

    PParamLoc = ^TParamLoc;
    TParamLoc = record
      FTypeInfo: PTypeInfo;
      FByRefParam: Boolean;
      FConstant: Boolean;
      FOffset: Integer;
      constructor Create(AType: PTypeInfo; AByRef, AConstant: Boolean);
      function GetArgLoc(AFrame: PInterceptFrame): Pointer;
      procedure GetArg(AFrame: PInterceptFrame; out Value: TValue);
      procedure SetArg(AFrame: PInterceptFrame; const Value: TValue);
    end;

    // Represents all static information required to perform an invocation,
    // in easier to consume format than RTTI objects (stack layout etc.)
    TInvokeInfo = class
    private
{$IF Defined(CPUX86)}
      FCallerPopsStack: Boolean;
{$ENDIF}
{$IF Defined(CPUX86) or (Defined(CPUX64) and not Defined(MSWINDOWS))}
      FResultFP: TFloatType;
{$ENDIF}
      FHasSelf: Boolean; // needed for Pascal calling convention
      FStackSize: Integer;

      FParams: TArray<TParamLoc>;
      FResultLoc: TParamLoc;
      FParamList: TList<TParamLoc>;
      FReturnType: PTypeInfo;
      FCallConv: TCallConv;
      procedure SetReturnType(Value: PTypeInfo);
      procedure CheckNotSealed;
      procedure Seal;
      function LoadArguments(AFrame: PInterceptFrame): TArray<TValue>;
      procedure SaveArguments(AFrame: PInterceptFrame;
        const Args: TArray<TValue>; const Result: TValue);
    public
      constructor Create(ACallConv: TCallConv; AHasSelf: Boolean);
      destructor Destroy; override;
      function GetParamLocs: TArray<TParamLoc>;
      procedure AddParameter(AType: PTypeInfo; AByRef, AConstant: Boolean);
      property ReturnType: PTypeInfo read FReturnType write SetReturnType;
    end;

  strict private
    FStub: PFirstStageIntercept;
    FUserData: Pointer;
    FCallback: TMethodImplementationCallback;
  protected
    FInvokeInfo: TInvokeInfo;
    constructor Create(AUserData: Pointer; AInvokeInfo: TInvokeInfo;
      const ACallback: TMethodImplementationCallback); overload;
    procedure Intercept(AFrame: PInterceptFrame);
    function GetCodeAddress: Pointer;
  public
    // Constructor throws - don't create this way
    constructor Create; overload;
    destructor Destroy; override;
    property CodeAddress: Pointer read GetCodeAddress;
  end;

  TRttiMethod = class(TRttiMember)
  private
    FInvokeInfo: TMethodImplementation.TInvokeInfo;

    function GetIsConstructor: Boolean;
    function GetIsDestructor: Boolean;

    function GetMethodKind: TMethodKind; virtual; abstract;
    function GetCallingConvention: TCallConv; virtual; abstract;
    function GetReturnType: TRttiType; virtual; abstract;
    function GetDispatchKind: TDispatchKind; virtual;
    function GetHasExtendedInfo: Boolean; virtual;
    function GetVirtualIndex: SmallInt; virtual;
    function GetCodeAddress: Pointer; virtual;
    function GetIsClassMethod: Boolean; virtual;
    function GetIsStatic: Boolean; virtual;
    function DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue; virtual; abstract;
    function GetInvokeInfo: TMethodImplementation.TInvokeInfo;
  public
    destructor Destroy; override;
    function Invoke(Instance: TObject; const Args: array of TValue): TValue; overload;
    function Invoke(Instance: TClass; const Args: array of TValue): TValue; overload;
    function Invoke(Instance: TValue; const Args: array of TValue): TValue; overload;
    // Create an implementation of a method with this signature, which delegates
    // implementation to the passed-in callback.
    function CreateImplementation(AUserData: Pointer;
      const ACallback: TMethodImplementationCallback): TMethodImplementation;
    function GetParameters: TArray<TRttiParameter>; virtual; abstract;
    function ToString: string; override;
    property ReturnType: TRttiType read GetReturnType;
    property HasExtendedInfo: Boolean read GetHasExtendedInfo;
    property MethodKind: TMethodKind read GetMethodKind;
    property DispatchKind: TDispatchKind read GetDispatchKind;

    property IsConstructor: Boolean read GetIsConstructor;
    property IsDestructor: Boolean read GetIsDestructor;
    property IsClassMethod: Boolean read GetIsClassMethod;
    // Static: No 'Self' parameter
    property IsStatic: Boolean read GetIsStatic;

    // Vtable slot for virtual methods.
    // Message index for message methods (non-negative).
    // Dynamic index for dynamic methods (negative).
    property VirtualIndex: SmallInt read GetVirtualIndex;
    property CallingConvention: TCallConv read GetCallingConvention;
    property CodeAddress: Pointer read GetCodeAddress;
  end;

  TRttiIndexedProperty = class(TRttiMember)
  private
    FReadMethod: TRttiMethod;
    FWriteMethod: TRttiMethod;
    procedure GetAccessors;
    function GetPropertyType: TRttiType;
    function GetIsReadable: Boolean;
    function GetIsWritable: Boolean;
    function GetIsDefault: Boolean;
    function GetReadMethod: TRttiMethod;
    function GetWriteMethod: TRttiMethod;
    function GetHandle: PArrayPropInfo;
    function GetName: string; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetVisibility: TMemberVisibility; override;
  public
    property Handle: PArrayPropInfo read GetHandle;
    property PropertyType: TRttiType read GetPropertyType;
    property ReadMethod: TRttiMethod read GetReadMethod;
    property WriteMethod: TRttiMethod read GetWriteMethod;
    function GetValue(Instance: Pointer; const Args: array of TValue): TValue;
    procedure SetValue(Instance: Pointer; const Args: array of TValue; const Value: TValue);
    property IsReadable: Boolean read GetIsReadable;
    property IsWritable: Boolean read GetIsWritable;
    property IsDefault: Boolean read GetIsDefault;
    function ToString: string; override;
  end;

  TRttiInstanceType = class(TRttiStructuredType)
  private
    FProps: TArray<TRttiProperty>;
    FMeths: TArray<TRttiMethod>;
    FVirtCount: Word;
    FIndexedProps: TArray<TRttiIndexedProperty>;
    FClassTab: PVmtFieldClassTab;
    FReadPropData: Boolean;
    FReadMethData: Boolean;
    procedure ReadPropData;
    procedure ReadMethData;
    function GetBaseType: TRttiType; override;
    function GetBaseTyped: TRttiInstanceType;
    function GetMetaclassType: TClass;
    function GetDeclaringUnitName: string;
    function GetVmtSize: Integer;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    property BaseType: TRttiInstanceType read GetBaseTyped;
    property DeclaringUnitName: string read GetDeclaringUnitName;
    property MetaclassType: TClass read GetMetaclassType;

    function GetDeclaredProperties: TArray<TRttiProperty>; override;
    function GetDeclaredMethods: TArray<TRttiMethod>; override;
    function GetDeclaredFields: TArray<TRttiField>; override;
    function GetDeclaredIndexedProperties: TArray<TRttiIndexedProperty>; override;

    function GetDeclaredImplementedInterfaces: TArray<TRttiInterfaceType>;
    function GetImplementedInterfaces: TArray<TRttiInterfaceType>;

    // Members declared in this type only.
    function GetAttributes: TArray<TCustomAttribute>; override;
    property VmtSize: Integer read GetVmtSize;
  end;

  TRttiInterfaceType = class(TRttiStructuredType)
  private
    FMethods: TArray<TRttiMethod>;
    FTotalMethodCount: Integer;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetIntfFlags: TIntfFlags;
    function GetDeclaringUnitName: string;
    function GetBaseType: TRttiType; override;
    function GetBaseTyped: TRttiInterfaceType;
    function GetGUID: TGUID;
  public
    property BaseType: TRttiInterfaceType read GetBaseTyped;
    property GUID: TGUID read GetGUID;
    property IntfFlags: TIntfFlags read GetIntfFlags;
    property DeclaringUnitName: string read GetDeclaringUnitName;

    function GetDeclaredMethods: TArray<TRttiMethod>; override;
  end;

                                                                                 
  TRttiOrdinalType = class(TRttiType)
  private
    function GetMaxValue: Integer; virtual;
    function GetMinValue: Integer; virtual;
    function GetOrdType: TOrdType;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  protected
    function GetTypeSize: Integer; override;
  public
    property OrdType: TOrdType read GetOrdType;
    property MinValue: Integer read GetMinValue;
    property MaxValue: Integer read GetMaxValue;
  end;

  TRttiInt64Type = class(TRttiType)
  private
    function GetMaxValue: Int64;
    function GetMinValue: Int64;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  protected
    function GetTypeSize: Integer; override;
  public
    property MinValue: Int64 read GetMinValue;
    property MaxValue: Int64 read GetMaxValue;
  end;

  TRttiInvokableType = class(TRttiType)
  private
    FProcSig: Pointer;
    function GetReturnType: TRttiType;
    function GetCallingConvention: TCallConv;
  public
    function Invoke(const ProcOrMeth: TValue; const Args: array of TValue): TValue; virtual; abstract;
    function GetParameters: TArray<TRttiParameter>;
    property ReturnType: TRttiType read GetReturnType;
    property CallingConvention: TCallConv read GetCallingConvention;
    function ToString: string; override;
  end;

  TRttiMethodType = class(TRttiInvokableType)
  private
    function GetMethodKind: TMethodKind;
    function GetTypeSize: Integer; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    function Invoke(const Callable: TValue; const Args: array of TValue): TValue; override;
    property MethodKind: TMethodKind read GetMethodKind;
    function ToString: string; override;
  end;

  TRttiProcedureType = class(TRttiInvokableType)
  private
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    function Invoke(const Callable: TValue; const Args: array of TValue): TValue; override;
    function GetAttributes: TArray<TCustomAttribute>; override;
  end;

  TRttiClassRefType = class(TRttiType)
  private
    function GetInstanceType: TRttiInstanceType;
    function GetMetaclassType: TClass;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    property InstanceType: TRttiInstanceType read GetInstanceType;
    property MetaclassType: TClass read GetMetaclassType;
  end;

                                                                                     
  TRttiEnumerationType = class(TRttiOrdinalType)
  private
    function GetMaxValue: Integer; override;
    function GetMinValue: Integer; override;
    function GetUnderlyingType: TRttiType;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    function GetNames: TArray<string>;
    class function GetName<T{: enum}>(AValue: T): string; reintroduce; static;
    class function GetValue<T{: enum}>(const AName: string): T; static;
    property UnderlyingType: TRttiType read GetUnderlyingType;
  end;

  TRttiSetType = class(TRttiType)
  private
    function GetElementType: TRttiType;
    function GetTypeSize: Integer; override;
    function GetByteOffset: Integer;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    property ElementType: TRttiType read GetElementType;
    property ByteOffset: Integer read GetByteOffset;
  end;

  TRttiStringKind = (skShortString, skAnsiString, skWideString, skUnicodeString);

  TRttiStringType = class(TRttiType)
  private
    function GetStringKind: TRttiStringKind;
    function GetTypeSize: Integer; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    property StringKind: TRttiStringKind read GetStringKind;
  end;

  TRttiAnsiStringType = class(TRttiStringType)
  private
    function GetCodePage: Word;
  public
    property CodePage: Word read GetCodePage;
  end;

  TRttiFloatType = class(TRttiType)
  private
    function GetFloatType: TFloatType;
    function GetTypeSize: Integer; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    property FloatType: TFloatType read GetFloatType;
  end;

  TRttiArrayType = class(TRttiType)
  private
{$IF Defined(CPUARM64) or Defined(LINUX64)}
    FHFAElementType: TRttiFloatType;
    FHFAElementCount: Integer;
{$ENDIF CPUARM64 or LINUX64}
    function GetTypeSize: Integer; override;
    function GetTotalElementCount: Integer;
    function GetElementType: TRttiType;
    function GetDimensionCount: Integer;
    function GetDimension(Index: Integer): TRttiType;
{$IF Defined(CPUARM64) or Defined(LINUX64)}
    procedure GetHFAElement;
    function GetIsHFA: Boolean; override;
    function GetHFAElementType: TRttiFloatType; override;
    function GetHFAElementCount: Integer; override;
{$ENDIF CPUARM64 or LINUX64}
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    property TotalElementCount: Integer read GetTotalElementCount;
    property ElementType: TRttiType read GetElementType;
    property DimensionCount: Integer read GetDimensionCount;
    property Dimensions[Index: Integer]: TRttiType read GetDimension;
  end;

                                                                                      
  TRttiDynamicArrayType = class(TRttiType)
  private
    function GetDeclaringUnitName: string;
    function GetElementSize: Integer;
    function GetElementType: TRttiType;
    function GetOleAutoVarType: TVarType;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    property ElementSize: Integer read GetElementSize;
    property ElementType: TRttiType read GetElementType;
    property OleAutoVarType: TVarType read GetOleAutoVarType;
    property DeclaringUnitName: string read GetDeclaringUnitName;
  end;

  TRttiPointerType = class(TRttiType)
  private
    function GetReferredType: TRttiType;
  public
    property ReferredType: TRttiType read GetReferredType;
    function GetAttributes: TArray<TCustomAttribute>; override;
  end;

  TRttiPackage = class(TRttiNamedObject)
  private
    FLock: TObject;
    FHandleToObject: TDictionary<Pointer,TRttiObject>;
    FBaseAddress: Pointer;

    function ReadObject(ARttiClass: TRttiClass; AParent: TRttiObject;
      var P: PByte): TRttiObject;
    function ReadObjectPointer(ARttiClass: TRttiClass; AParent: TRttiObject;
      P: Pointer): TRttiObject;
    function GetNameFromType(AType: TRttiType): string; virtual;

    function GetHandle: HINST;
  public
    destructor Destroy; override;
    property Handle: HINST read GetHandle;
    property BaseAddress: Pointer read FBaseAddress;
    function GetTypes: TArray<TRttiType>; virtual; abstract;
    function FindType(const AQualifiedName: string): TRttiType; virtual; abstract;
  end;

  TRttiContext = record
  private
    FContextToken: IInterface;
  private class var
    FGlobalContextCounter: Integer;
    FGlobalContextToken: IInterface;
  public
    class function Create: TRttiContext; static;
    procedure Free;

    class procedure KeepContext; static;
    class procedure DropContext; static;

    function GetType(ATypeInfo: Pointer): TRttiType; overload;
    function GetType(AClass: TClass): TRttiType; overload;
    function GetTypes: TArray<TRttiType>;
    function FindType(const AQualifiedName: string): TRttiType;
    function GetPackages: TArray<TRttiPackage>;
  end;

  TInterceptBeforeNotify = reference to procedure(Instance: TObject;
    Method: TRttiMethod; const Args: TArray<TValue>; out DoInvoke: Boolean;
    out Result: TValue);
  TInterceptAfterNotify = reference to procedure(Instance: TObject;
    Method: TRttiMethod; const Args: TArray<TValue>; var Result: TValue);
  TInterceptExceptionNotify = reference to procedure(Instance: TObject;
    Method: TRttiMethod; const Args: TArray<TValue>; out RaiseException: Boolean;
    TheException: Exception; out Result: TValue);

  TVirtualMethodInterceptor = class
  private type
    TExtraMethodInfo = (eiNormal, eiObjAddRef, eiObjRelease, eiFreeInstance);
    TInterceptInfo = class
    private
      FExtraMethodInfo: TExtraMethodInfo;
      FImpl: TMethodImplementation;
      FOriginalCode: Pointer;
      FProxyCode: Pointer;
      FMethod: TRttiMethod;
    public
      constructor Create(AOriginalCode: Pointer; AMethod: TRttiMethod;
        const ACallback: TMethodImplementationCallback;
        const ExtraMethodInfo: TExtraMethodInfo);
      destructor Destroy; override;
      property ExtraMethodInfo: TExtraMethodInfo read FExtraMethodInfo;
      property OriginalCode: Pointer read FOriginalCode;
      property ProxyCode: Pointer read FProxyCode;
      property Method: TRttiMethod read FMethod;
    end;

  private
    FContext: TRttiContext;
    FOriginalClass: TClass;
    FProxyClass: TClass;
    FProxyClassData: Pointer;
    FIntercepts: TObjectList<TInterceptInfo>;
    FImplementationCallback: TMethodImplementationCallback;
    FOnBefore: TInterceptBeforeNotify;
    FOnAfter: TInterceptAfterNotify;
    FOnException: TInterceptExceptionNotify;
    procedure CreateProxyClass;
    procedure RawCallback(UserData: Pointer; const Args: TArray<TValue>;
      out Result: TValue);
  protected
    procedure DoBefore(Instance: TObject; Method: TRttiMethod;
      const Args: TArray<TValue>; out DoInvoke: Boolean; out Result: TValue);
    procedure DoAfter(Instance: TObject; Method: TRttiMethod; const Args: TArray<TValue>;
      var Result: TValue);
    procedure DoException(Instance: TObject; Method: TRttiMethod;
      const Args: TArray<TValue>; out RaiseException: Boolean;
      TheException: Exception; out Result: TValue);
  public
    constructor Create(AClass: TClass);
    destructor Destroy; override;
    procedure Proxify(AInstance: TObject);
    procedure Unproxify(AInstance: TObject);
    property OriginalClass: TClass read FOriginalClass;
    property ProxyClass: TClass read FProxyClass;
    property OnBefore: TInterceptBeforeNotify read FOnBefore write FOnBefore;
    property OnAfter: TInterceptAfterNotify read FOnAfter write FOnAfter;
    property OnException: TInterceptExceptionNotify read FOnException write FOnException;
  end;

  ///
  ///  Provides a basis for dynamically creating instances that implement
  ///  interfaces.  The support here is extremely raw.  You create an instance
  ///  of a virtual class by handing it a vtable.  The vtable is a specialized
  ///  type defined here.  The vtable will be populated with slots that point
  ///  to small thunks that dispatch to user code.<p></p>
  ///
  ///  The basic usage model is to construct a virtual class with a vtable,
  ///  and a list of GUIDs of interfaces that the vtable matches.  Thus if
  ///  you have an interface declared to inherit a line of several parents,
  ///  the single vtable will represent each of the parent interfaces.<p></p>
  ///
  ///  The <code>TRawVirtualClass</code> implements <code>QueryInterface</code>,
  ///  <code>AddRef</code> and <code>Release</code> for the interface, so
  ///  that you can query an instance and get back a Delphi interface that can
  ///  be used as if it were any Delphi interface.<p></p>
  ///
  ///  Future improvements: support adding vtables to an existing instance.
  TRawVirtualClass = class(TInterfacedObject, IInterface)
  public
    type

    ///
    ///  The vtable type for the virtual class.  The client will construct
    ///  the vtable to contain whatever slots the client wants.  Slots can
    ///  be populated with specialized thunks that load some context information
    ///  and then dispatch to user code, or by addresses provided directly
    ///  by the user.
    TVTable = class
    const
      ///  Slots for QueryInterface, AddRef and Release are all reserved.
      RESERVED_VTABLE_SLOTS = 3;
    private
      ///  The actual vtable.
      FVTable: TArray<Pointer>;
      ///  Array of thunks that the vtable will point to.  The thunks
      ///  will dispatch to the client's code.
      FInterceptors: TArray<Pointer>;

      function GetVTable: TArray<Pointer>;

    protected
      ///
      ///  Create a vtable with the given number of method slots.  We will allocated
      ///  an addition 3 entries to fill in QueryInterface, AddRef and Release.
      ///  These will dispatch to the virtual class implementation, and cannot be
      ///  set by the client.
      constructor Create(MethodCount: Integer);

    public
      destructor Destroy; override;

      ///
      ///  Set a vtable slot to dispatch to the given procedure pointer.  The thunk
      ///  will execute a very raw dispatch to the procedure.  It will set up a stack
      ///  frame, and push the <code>Context</code> pointer onto the stack.<p></p>
      ///
      ///  The client is responsible for managing the lifetime of the <code>Context</code>.<p></p>
      ///
      ///  See <code>AllocateRawThunk</code> for more detail on the stack frame setup.<p></p>
      ///
      ///  <param name="Idx">Zero based index of the vtable slot to set.  This index
      ///  must be between 0 and the <code>MethodCount - 1</code> value used in
      ///  construction.</param>
      ///  <param name="Proc">Address that the thunk will dispatch to.</param>
      ///  <param name="Context">Pointer to user data that will be pushed
      ///  onto the stack by the thunk.</param>
      procedure SetVTableSlot(Idx: Integer; Proc: Pointer; Context: Pointer); overload;

      ///
      ///  Sets a vtable slot to the actual value of the <code>Proc</code> pointer,
      ///  with no thunk interceding.  Calls to the given vtable slot will land
      ///  directly at that address.
      procedure SetVTableSlot(Idx: Integer; Proc: Pointer); overload;

      ///  Use this property to get the actual vtable.  Typically, this will be used
      ///  by the virtual class instance.
      property VTable: TArray<pointer> read GetVTable;

      ///  Allocates a thunk.  The thunk will be executable, in process code that will
      ///  set up a stack frame, push the <code>Context</code> pointer, and jump to
      ///  <code>Proc</code>.  On x86, the frame will be a standard EBP frame.  When you
      ///  arrive at your code (<code>Proc</code>), the stack will look like this:
      ///  <code>
      ///    |             |  <--- EBP
      ///    | Return Addr |
      ///    | EBP         |
      ///    | Context     |  <--- ESP
      ///  </code><p></p>
      ///
      ///  In a PC Mapped regime, the stack will include two additional magic values:
      ///  <code>
      ///    |             |  <--- EBP
      ///    | Return Addr |
      ///    | EBP         |
      ///    | Context     |
      ///    | BytesToPop  |
      ///    | Thunk addr  |  <--- ESP
      ///  </code><p></p>
      ///
      ///  These values are used to clean up the stack in the event of an exception being
      ///  thrown past the thunk.  If your target procedure has callee cleanup semantics,
      ///  then you must create this thunk with the number of bytes that procedure would
      ///  clear off the stack if you want exception handling semantics to be maintained
      ///  properly.
      ///
      ///  OS X implementors note:  the stack will not be aligned properly.<p></p>
      ///
      class function AllocateRawThunk(Proc: Pointer; Context: Pointer; BytesToPop: Integer): Pointer; static;

      ///
      ///  Frees a thunk allocated with <code>AllocateRawThunk</code>.
      class procedure FreeRawThunk(Thunk: Pointer); static;
    end;

  private
    type
      ///  This record just allows us to have a deterministic way of getting back
      ///  to the instance of the <code>TRawVirtualClass</code> that implements
      ///  a given interface.
      BoundInterface = packed record
        ///  Obj will be set to Self.  This way, we can get to it from the interface ptr.
        Obj: Pointer;
        ///  When we do <code>QueryInterface</code>, we'll return the address of this
        ///  field.
        VTable: TArray<Pointer>;
      end;
      PBoundInterface = ^BoundInterface;
  var
    // N.B.:  If we expand this to support multiple interfaces, adding interfaces
    // to existing instances, then you have to be careful here.  You can't just use
    // an array of BoundInterface, because resizing the array may reallocate it,
    // and this would invalidate any interfaces that people have already made references
    // to.  It will have to be a linked list, and not a TList, either.  You have to make
    // sure that the BoundInterface records do not move in memory.
    FVTable: BoundInterface;
    FIIDs: TArray<TGUID>;    // GUIDs of the interfaces that we have vtables for
    function _AddRefFromIntf: Integer; stdcall;
    function _ReleaseFromIntf: Integer; stdcall;
    function _QIFromIntf(const IID: TGUID; out Obj): HResult; stdcall;

  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;

    ///
    ///  Finds the interface pointer for the given GUID.  This returns only pointers
    ///  to interfaces that are actual virtual interfaces added to this class.  It
    ///  does not follow the full semantics of QueryInterface, in which we delegate
    ///  to inherited versions if we don't find the interface locally.  This interface
    ///  is very special in that it returns the raw pointer of the interface, without
    ///  calling AddRef on the interface.  It's a very special case operation that
    ///  is useful only in extreme edge cases.  Because the pointer is not AddRefed,
    ///  you must be extremely careful with how you use the result, lest you
    ///  inadvertantly cause an object to be freed.  Returns <code>nil</code> if the
    ///  interface cannot be found locally.
    function FindInterface(IID: TGUID): Pointer;

    ///
    ///  Create instances of virtual classes by handing in a vtable, along with
    ///  a list of GUIDS that you know that vtable represents.
    constructor Create(Guids: TArray<TGUID>; VTable: TRawVirtualClass.TVTable); overload;

    destructor Destroy; override;

    ///
    ///  Given an interface that you <emphasis>know</emphasis> comes from a virtual
    ///  class, this method will return the instance of <code>TRawVirtualClass</code>
    ///  that implements that specific interface.  If you hand in an interface that
    ///  is not from a virtual class, you'll get back a reference to something, but
    ///  the contents will be undefined.
    class function GetInstanceFromInterface(Intf: Pointer): TRawVirtualClass; static;
  end;

  { TVirtualInterfaceInvokeEvent: Invoke Event for TVirtualMethodInterface.
    When a method of the Interface that is being virtualized is invoked, the
    OnInvoke event is fired. Implement this event handler to perform some
    action for invoked methods. }
  TVirtualInterfaceInvokeEvent = reference to procedure(Method: TRttiMethod;
    const Args: TArray<TValue>; out Result: TValue);

  { TVirtualInterface: Creates an implementation of an interface at runtime.
    All methods in the Interface are marshaled through a generic stub function
    that raises the OnInvoke event.}
  TVirtualInterface = class(TInterfacedObject, IInterface)

  private type
    { TImplInfo: Helper class that keeps a reference to the TRttiMethod metadata
      as well as the implemention of the stub function }
    TImplInfo = class
    private
      FImpl: TMethodImplementation;
      FMethod: TRttiMethod;
      function GetCodeAddress: Pointer;
        function GetVirtualIndex: SmallInt;
    public
      constructor Create(AMethod: TRttiMethod;
        const ACallback: TMethodImplementationCallback);
      destructor Destroy; override;
      property CodeAddress: Pointer read GetCodeAddress;
      property VirtualIndex: SmallInt read GetVirtualIndex;
    end;

  private
    VTable: PPointer;       // Constructed VTable for Interface
    FIID: TGUID;            // GUID of the Interface being implemented
    FContext: TRttiContext; // Local reference to Context so metadata doesn't expire
    FIntercepts: TObjectList<TImplInfo>;     // List of Implelmentation functions
    FOnInvoke: TVirtualInterfaceInvokeEvent; // Invoke Event
    { Functions for the generated VTable. When these are invoked, the Self
      pointer is pointing to the generated VTable. In order to access members
      of the TVirtualInterface class (such as the reference count), this pointer
      has to be adjusted before actually performing these actions}
    function _AddRefFromIntf: Integer; stdcall;
    function _ReleaseFromIntf: Integer; stdcall;
    function _QIFromIntf(const IID: TGUID; out Obj): HResult; stdcall;

    // Stub function called by all methods in the interface.
    procedure RawCallback(UserData: Pointer {TImplInfo}; const Args: TArray<TValue>;
      out Result: TValue); virtual;
    procedure ErrorProc;
  protected
    // IInterface methods. Make them virtual so derived classes can do their own
    // lifetime management if needed.
    function _AddRef: Integer; virtual; stdcall;
    function _Release: Integer; virtual; stdcall;
  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    { Create an instance of TVirtualInterface that implements the methods of
      an interface.  PIID is the PTypeInfo for the Interface that is to be
      implemented. The Interface must have TypeInfo ($M+). Either inherit from
      IInvokable, or enable TypeInfo for the interface. Because this is an
      TInterfacedObject, it is reference counted and it should not be Freed directly.
      }
    constructor Create(PIID: PTypeInfo); overload;
    constructor Create(PIID: PTypeInfo; InvokeEvent: TVirtualInterfaceInvokeEvent); overload;
    destructor Destroy; override;
    { OnInvoke: Event raised when a method of the implemented interface is called.
      Assign a OnInvoke handler to perform some action on invoked methods.}
    property OnInvoke: TVirtualInterfaceInvokeEvent read FOnInvoke write FOnInvoke;
  end;

function Invoke(CodeAddress: Pointer; const Args: TArray<TValue>;
  CallingConvention: TCallConv; AResultType: PTypeInfo; IsStatic: Boolean = False;
  IsConstructor: Boolean = False ): TValue;
function IsManaged(TypeInfo: PTypeInfo): Boolean;

type
  TGetArrayValueFunc = reference to function(AArrType: TRttiType): TValue;

{ These 2 functions convert TValue keeping TListHelper instance to/from TValue
  keeping TArray<T>. This is useful for JSON marshaling. These functions must
  be in sync with System.Generics.Collections.TListHelper layout. }
function GetArrayValueFromTListHelperValue(const ACtx: TRttiContext;
  const AListHelperValue: TValue; out ACount: Integer): TValue;
procedure SetTListHelperValueFromArrayValue(const ACtx: TRttiContext;
  var AListHelperValue: TValue; const AGetArrValFunc: TGetArrayValueFunc);

implementation

{ A note on locking protocol:

  Mutations to objects generally occur while holding the package lock
  (FPackage.FLock) for the owning package. Thus, it is not safe to
  mutate an object from another package while holding the current package lock;
  it could lead to deadlock. Similarly, package-owned objects constructors'
  run while the package lock is held.

  Pool initialization is protected by the pool lock, PoolLock.

  Attribute construction (possibly lazy) is controlled by the PoolLock,
  since attribute construction may involve instantiation of a TRttiType as
  an argument where that type lives in another package, which could lead
  to deadlock. So, attribute constructors should not start a new thread,
  attempt RTTI operations, and block on this new thread without anticipating
  deadlock; all attribute construction is serialized. }

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
{$ENDIF}
{$IFDEF POSIX}
  Posix.SysMman,
  Posix.Unistd,
  Posix.Dlfcn,
{$ENDIF POSIX}
{$IFDEF PC_MAPPED_EXCEPTIONS}
  System.Internal.Unwind,
{$ENDIF PC_MAPPED_EXCEPTIONS}
  System.SysConst,
  System.Hash,
  System.Types,
  System.Math,
  System.Generics.Defaults,
  System.RTLConsts;

{$IFDEF EXTERNALLINKER}
const
  RTLHelperLibName =
{$IF Defined(PIC) and Defined(LINUX)}
   'librtlhelper_PIC.a';
{$ELSE}
   'librtlhelper.a';
{$ENDIF}
{$ENDIF EXTERNALLINKER}

type
  PIntPtr = ^IntPtr;

type
  TPrivateHeap = class(TObject)
{$IFDEF POSIX}
  private type
    THeapItem = record
      Addr: PByte;
      Size: Cardinal;
    end;
  private
    FMMaped: TList<Pointer>;
    FFree: TList<THeapItem>;
    FAllocated: TList<THeapItem>;
{$ENDIF POSIX}
{$IFDEF MSWINDOWS}
  private
    FHandle: THandle;
    function GetHandle: THandle;
  public
    property Handle: THandle read GetHandle;
{$ENDIF MSWINDOWS}
  public
    constructor Create;
    destructor Destroy; override;
    procedure GetMem(var P{: pointer}; Size: DWORD); virtual;
    procedure FreeMem(P: pointer);
    function SizeOfMem(P: pointer): DWORD;
  end;

var
  FCodeHeap: TPrivateHeap;

function CodeHeap: TPrivateHeap;
var
  Temp: TPrivateHeap;
begin
  if FCodeHeap = nil then
  begin
    Temp := TPrivateHeap.Create;
    if AtomicCmpExchange(Pointer(FCodeHeap), Pointer(Temp), nil) = nil then
      Pointer(Temp) := nil // For ARC-based platforms this will ensure the local var doesn't affect the refcount
    else
      Temp.Free;
  end;
  Result := FCodeHeap;
end;

{ TPrivateHeap }

constructor TPrivateHeap.Create;
begin
{$IFDEF POSIX}
  FMMaped := TList<Pointer>.Create;
  FFree := TList<THeapItem>.Create;
  FAllocated := TList<THeapItem>.Create;
{$ENDIF}
end;

destructor TPrivateHeap.Destroy;
{$IFDEF POSIX}
var
  I: Integer;
{$ENDIF POSIX}
begin
{$IFDEF MSWINDOWS}
  if FHandle <> 0 then
  begin
    if not Winapi.Windows.HeapDestroy(FHandle) then
      RaiseLastOSError;
    FHandle := 0;
  end;
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
  FFree.Free;
  FAllocated.Free;
  for I := 0 to FMMaped.Count - 1 do
  begin
    if munmap(FMMaped[I], sysconf(_SC_PAGESIZE)) <> 0 then
      RaiseLastOSError;
{$IFDEF PC_MAPPED_EXCEPTIONS}
    // Make sure the unwinder doesn't track this block of memory anymore
    // for exceptions.
                                                              
    SysUnregisterIPLookup(NativeUInt(FMMaped[I]));
{$ENDIF PC_MAPPED_EXCEPTIONS}
  end;
  FMMaped.Free;
{$ENDIF POSIX}
  inherited Destroy;
end;

procedure TPrivateHeap.FreeMem(P: pointer);
{$IFDEF MSWINDOWS}
begin
  if not Winapi.Windows.HeapFree(Handle, 0, P) then
    RaiseLastOSError;
end;
{$ENDIF}
{$IFDEF POSIX}
var
  I : Integer;
  Item: THeapItem;
begin
  for I := 0 to FAllocated.Count - 1 do
  if FAllocated[I].Addr = P then
  begin
    Item := FAllocated[I];
    FAllocated.Delete(I);
    break;
  end;
  if Item.Addr = nil then raise Exception.CreateRes(@SArgumentInvalid);
  if (FFree.Count = 0) or (UIntPtr(P) < UIntPtr(FFree[0].Addr)) then
    FFree.Insert(0, Item)
  else if (FFree.Count > 0) and (UIntPtr(P) > UIntPtr(FFree[FFree.Count - 1].Addr)) then
    FFree.Add(Item)
  else
    for I := 1 to FFree.Count -1 do
      if UIntPtr(P) < UIntPtr(FFree[I].Addr) then
      begin
        FFree.Insert(I, Item);
        break;
      end;

  I := 0;
  while True do
  begin
    if I >= FFree.Count - 1 then break;
    if (FFree[I].Addr + FFree[I].size) = FFree[I+1].Addr then
    begin
      Item.Addr := FFree[I].Addr;
      Item.Size := FFree[I].Size + FFree[I+1].Size;
      FFree[I] := Item;
      FFree.Delete(I+1);
    end
    else
      Inc(I);
  end;
end;
{$ENDIF}

{$IFDEF MSWINDOWS}
function TPrivateHeap.GetHandle: THandle;
var
  Temp: THandle;
begin
  if FHandle = 0 then
begin
    Temp := Winapi.Windows.HeapCreate(0, 0, 0);
    if Temp = 0 then
      RaiseLastOSError;
    if AtomicCmpExchange(FHandle, Temp, 0) <> 0 then
      if not Winapi.Windows.HeapDestroy(Temp) then
        RaiseLastOSError;
  end;
  Result := FHandle;
end;
{$ENDIF MSWINDOWS}

{$IFDEF PC_MAPPED_EXCEPTIONS}
///
///  Called by the unwinder when unwinding the stack for an exception in the
///  PC Mapped environment.
function VirtualFrameUnwinder(Version: Integer; Actions: _Unwind_Action;
                              ExceptionObject: _Unwind_Exception;
                              Context: _Unwind_Context;
                              ImplementationData: Pointer) : _Unwind_Reason_Code; cdecl;
var
  P: _PUnwind_RegVal;
  PRetAddr: _PUnwind_RegVal;
  BytesToPop: Integer;
begin
  // Our thunks have a stack frame in them that we'll use to toss the frame.
  // In addition, they contain information about how many bytes the callee was
  // expected to clear off the stack.
  P := _PUnwind_RegVal(BorUnwind_GetGR(Context, _UW_REG_EBP));
  PRetAddr := _PUnwind_RegVal(_Unwind_RegVal(P) + SizeOf(Pointer));
  BytesToPop := PInteger(_Unwind_RegVal(P) - SizeOf(Pointer) * 2)^;
  BorUnwind_SetGR(Context, _UW_REG_EBP, P^);
  BorUnwind_SetGR(Context, _UW_REG_ESP, _Unwind_RegVal(P) + (SizeOf(Pointer) * 2) + NativeUInt(BytesToPop));
  BorUnwind_SetGR(Context, _UW_REG_EIP, PRetAddr^);
  Result := _URC_CONTINUE_UNWIND;
end;

///
///  Called by the unwinder to lookup the unwinder for a given PC Map address range.
///  In our case, we never have to search around the range at all for any information,
///  we just return our single generic unwinder, since all thunks look the same.
                                                              
function VirtualFrameLookup(Addr: NativeUInt; Context: Pointer): TFrameUnwinder; cdecl;
begin
  Result := @VirtualFrameUnwinder;
end;
{$ENDIF PC_MAPPED_EXCEPTIONS}

procedure TPrivateHeap.GetMem(var P{: pointer}; Size: DWORD);
{$IFDEF MSWINDOWS}
var
  ExistingFlags: DWORD;
begin
  Pointer(P) := Winapi.Windows.HeapAlloc(Handle, 0, Size);
  if Pointer(P) = nil then
    RaiseLastOSError;
  if not Winapi.Windows.VirtualProtect(Pointer(P), Size, PAGE_EXECUTE_READWRITE, @ExistingFlags) then
    RaiseLastOSError;
end;
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
var
  I, UseItem: Integer;
  FreeItem, NewItem: THeapItem;
  PageSize: LongInt;
begin
                                                               
  {$IF Defined(CPU64BITS)}
  Size := (Size + 15) and not 15;  // Always align to 16 bytes.
  {$ELSE}
  Size := (Size + 7) and not 7;    // Always align to 8 bytes.
  {$ENDIF}
  UseItem := -1;
  if FFree.Count > 0 then
    for I := 0 to FFree.Count -1 do
    begin
      if FFree[I].Size >= Size then
      begin
        FreeItem := FFree[I];
        UseItem := I;
        break;
      end;
    end;
  if UseItem = -1 then
  begin
    PageSize := sysconf(_SC_PAGESIZE);
    FreeItem.Addr := mmap(nil, PageSize, PROT_WRITE or PROT_EXEC,
                          MAP_PRIVATE or MAP_ANON, -1, 0);
{$IFDEF PC_MAPPED_EXCEPTIONS}
    // Register the address range of the block with the unwinder, so that
    // we can unwind the stack if an exception is thrown past our thunk.
                                                                
    SysRegisterIPLookupFunc(NativeUInt(FreeItem.Addr),
                            NativeUInt(FreeItem.Addr) + NativeUInt(PageSize - 1), nil, 0,
                            @VirtualFrameLookup);
{$ENDIF PC_MAPPED_EXCEPTIONS}
    if FreeItem.Addr = MAP_FAILED then
      RaiseLastOsError;
    FMMaped.Add(FreeItem.Addr);
    FreeItem.Size := sysconf(_SC_PAGESIZE);
    UseItem := FFree.Add(FreeItem);
  end;
  NewItem.Addr := FreeItem.Addr;
  NewItem.Size := Size;
  FreeItem.Addr := FreeItem.Addr + Size;
  FreeItem.Size := FreeItem.Size - Size;
  if FFree[UseItem].Size = 0 then
    FFree.Delete(UseItem)
  else
    FFree[UseItem] := FreeItem;
  FAllocated.Add(NewItem);
  Pointer(P) := NewItem.Addr;
end;
{$ENDIF}

function TPrivateHeap.SizeOfMem(P: pointer): DWORD;
{$IFDEF MSWINDOWS}
begin
  Result := HeapSize(Handle, 0, P);
  // HeapSize does not set GetLastError, but returns -1 if it fails
  if Result = SIZE_T(-1) then
    Result := 0;
end;
{$ENDIF MSWINDOWS}
{$IFDEF POSIX}
var
  Item: THeapItem;
begin
  Result := 0;
  for Item in FAllocated do
    if Item.Addr = P then
      Exit(Item.Size);
end;
{$ENDIF POSIX}

{ Loaded Module List versioning }

var
  ModListRemovals: Integer;

function GetModuleListVersion: Integer;
begin
  // Items are added to start, but may be removed from middle.
  Result := ModListRemovals xor Integer(LibModuleList);
end;

procedure OnUnloadModule(HInstance: HINST);
begin
  AtomicIncrement(ModListRemovals);
end;

                                                                                           
procedure SafeIntfAsg(const Value; out Location);
type
  PInterface = ^IInterface;
var
  old: Pointer;
begin
  PInterface(@Value)^._AddRef;
  old := AtomicExchange(PPointer(@Location)^, PPointer(@Value)^);
  if old <> nil then
    IInterface(old)._Release;
end;

var
  StringEqCmpCI: IEqualityComparer<string>;

function CaseInsensitiveStringEqualityComparer: IEqualityComparer<string>;
begin
  if StringEqCmpCI = nil then
  begin
    Result := TEqualityComparer<string>.Construct(
      SameText,
      function(const Text: string): Integer
      var
        upper: string;
      begin
        upper := AnsiUpperCase(Text);
        Result := THashBobJenkins.GetHashValue(Pointer(upper)^, Length(upper), 0);
      end);
    SafeIntfAsg(Result, StringEqCmpCI);
  end;
  Result := StringEqCmpCI;
end;

{ Finalizer, for destroying objects upon anonymous method scope destruction }

type
  IFinalizer = interface
    procedure Add(Obj: TObject);
  end;

  TFinalizer = class(TInterfacedObject, IFinalizer)
  private
    FItems: TArray<TObject>;
    FCount: Integer;
  public
    destructor Destroy; override;
    procedure Add(Obj: TObject);
  end;

{ TFinalizer }

destructor TFinalizer.Destroy;
var
  i: Integer;
begin
  for i := 0 to FCount - 1 do
    FItems[i].Free;
  inherited;
end;

procedure TFinalizer.Add(Obj: TObject);
var
  len: Integer;
begin
  len := Length(FItems);
  if len = 0 then
    SetLength(FItems, 4)
  else if len = FCount then
    SetLength(FItems, len * 2);
  FItems[FCount] := Obj;
  Inc(FCount);
end;

function MakeFinalizer: IFinalizer;
begin
  Result := TFinalizer.Create;
end;

{ Helpers }

function InsufficientRtti: Exception;
begin
  Result := EInsufficientRtti.CreateRes(@SInsufficientRtti);
end;

procedure CheckCodeAddress(code: Pointer);
begin
  if (code = nil) or (PPointer(code)^ = nil) then
    raise InsufficientRtti;
end;

type
  TListHelper = class
  public
    class function ToArray<T>(AList: TList<T>): TArray<T>;
  end;

  TArrayHelper = class
  public
    class function Concat<T>(const Args: array of TArray<T>): TArray<T>; static;
  end;

class function TListHelper.ToArray<T>(AList: TList<T>): TArray<T>;
var
  i: Integer;
begin
  SetLength(Result, AList.Count);
  for i := 0 to AList.Count - 1 do
    Result[i] := AList[i];
end;

class function TArrayHelper.Concat<T>(
  const Args: array of TArray<T>): TArray<T>;
var
  i, j, out, len: Integer;
begin
  len := 0;
  for i := 0 to High(Args) do
    len := len + Length(Args[i]);
  SetLength(Result, len);
  out := 0;
  for i := 0 to High(Args) do
    for j := 0 to High(Args[i]) do
    begin
      Result[out] := Args[i][j];
      Inc(out);
    end;
end;

function DerefPointer(p: Pointer): Pointer; inline;
begin
  Result := p;
  if Result <> nil then
    Result := PPointer(Result)^;
end;

{ Do-nothing interface implementation }

function NopRefCount(inst: Pointer): Integer; stdcall;
begin
  Result := -1;
end;

function NopQueryInterface(inst: Pointer; const IID: TGUID; out Obj): HResult; stdcall;
begin
  Result := E_NOINTERFACE;
end;

function NopRet0(inst: Pointer): Integer;
begin
  Result := 0;
end;

const
  Nop_Vtable: array[0..6] of Pointer =
  (
    @NopQueryInterface,
    @NopRefCount,
    @NopRefCount,
    @NopRet0, // function GetDataSize: Integer;
    @NopRet0, // procedure ExtractRawData(ABuffer: Pointer);
    @NopRet0, // procedure ExtractRawDataNoCopy(ABuffer: Pointer);
    @NopRet0 // function GetReferenceToRawData: Pointer;
  );
  Nop_Instance_Data: Pointer = @Nop_Vtable;
  Nop_Instance: Pointer = @Nop_Instance_Data;

function IsManaged(TypeInfo: PTypeInfo): Boolean;
var
  elTypePtr: PPTypeInfo;
begin
  if TypeInfo = nil then
    Exit(False);
  case TypeInfo^.Kind of
{$IFDEF AUTOREFCOUNT}
    tkClass,
{$ENDIF AUTOREFCOUNT}
    tkDynArray, tkUString, tkWString, tkLString, tkInterface, tkVariant,
    tkMethod, tkMRecord:
      Result := True;
    tkRecord:
      Result := GetTypeData(TypeInfo)^.ManagedFldCount > 0;
    tkArray:
      begin
        elTypePtr := GetTypeData(TypeInfo)^.ArrayData.ElType;
        Result := (elTypePtr <> nil) and IsManaged(elTypePtr^);
      end;
  else
    Result := False;
  end;
end;

procedure PushSelfFirst(CC: TCallConv; var argList: TArray<TValue>;
  var Index: Integer; const Value: TValue); inline;
begin
{$IFDEF CPUX86}
  if CC = ccPascal then Exit;
{$ENDIF CPUX86}
  argList[Index] := Value;
  Inc(Index);
end;

procedure PushSelfLast(CC: TCallConv; var argList: TArray<TValue>;
  var Index: Integer; const Value: TValue); inline;
begin
{$IFDEF CPUX86}
  if CC <> ccPascal then Exit;
  argList[Index] := Value;
{$ELSE !CPUX86}
                                                                                   
{$ENDIF CPUX86}
end;

// 0 => nil
// >0 => inline ok
// <0 => heap data
// Main purpose is to determine where & how much data to blit when copying in / out.
function GetInlineSize(TypeInfo: PTypeInfo): Integer;
begin
  if TypeInfo = nil then
    Exit(0);

  case TypeInfo^.Kind of
    tkInteger, tkEnumeration, tkChar, tkWChar:
      case GetTypeData(TypeInfo)^.OrdType of
        otSByte, otUByte: Exit(1);
        otSWord, otUWord: Exit(2);
        otSLong, otULong: Exit(4);
      else
        Exit(0);
      end;
    tkSet:
      begin
        Result := SizeOfSet(TypeInfo);
{$IF   SizeOf(Extended) > SizeOf(TMethod)}
        if Result > SizeOf(Extended) then
          Result := -Result;
{$ELSE SizeOf(Extended) <= SizeOf(TMethod)}
        if Result > SizeOf(TMethod) then
          Result := -Result;
{$ENDIF}
        Exit;
      end;
    tkFloat:
      case GetTypeData(TypeInfo)^.FloatType of
        ftSingle: Exit(4);
        ftDouble: Exit(8);
        ftExtended: Exit(SizeOf(Extended));
        ftComp: Exit(8);
        ftCurr: Exit(8);
      else
        Exit(0);
      end;
    tkClass:
{$IFDEF AUTOREFCOUNT}
      Exit(-SizeOf(Pointer));
{$ELSE  AUTOREFCOUNT}
      Exit(SizeOf(Pointer));
{$ENDIF AUTOREFCOUNT}
    tkClassRef: Exit(SizeOf(Pointer));
    tkMethod: Exit(SizeOf(TMethod));
    tkInt64: Exit(8);
    tkDynArray, tkUString, tkLString, tkWString, tkInterface: Exit(-SizeOf(Pointer));
{$IFNDEF NEXTGEN}
    tkString: Exit(-GetTypeData(TypeInfo)^.MaxLength - 1);
{$ENDIF !NEXTGEN}
    tkPointer: Exit(SizeOf(Pointer));
    tkProcedure: Exit(SizeOf(Pointer));
    tkRecord, tkMRecord: Exit(-GetTypeData(TypeInfo)^.RecSize);
    tkArray: Exit(-GetTypeData(TypeInfo)^.ArrayData.Size);
    tkVariant: Exit(-SizeOf(Variant));
  else
    Exit(0);
  end;
end;

function UseResultPointer(TypeInfo: PTypeInfo; IsConstructor: Boolean;CC: TCallConv): Boolean;
{$IF Defined(CPUARM64)}
var
  ctx: TRttiContext;
{$ENDIF}
begin
  if TypeInfo = nil then
    Exit(False);

  case TypeInfo^.Kind of
{$IFDEF AUTOREFCOUNT}
    tkClass:
      Result := not IsConstructor;
{$ENDIF AUTOREFCOUNT}
    tkInterface, tkMethod, tkDynArray, tkUString, tkLString, tkWString,
    tkString, tkVariant:
      Exit(True);
    tkRecord, tkMRecord:
{$IF Defined(CPUX64)}
{$IF Defined(MSWINDOWS)}
      case GetTypeData(TypeInfo)^.RecSize of
        1, 2, 4: Result := False;
        8: Result := IsManaged(TypeInfo);
      else
        Result := True;
      end;
{$ELSEIF Defined(LINUX64)}
      case GetTypeData(TypeInfo)^.RecSize of
        1..7: Result := False; // Managed-type spend a size of pointer.
        8..16: Result := IsManaged(TypeInfo);
      else
        Result := True;
      end;
{$ELSE}
      Result := not (GetTypeData(TypeInfo)^.RecSize in [1..16]);
{$ENDIF}
{$ELSEIF Defined(CPUX86)}
      case GetTypeData(TypeInfo)^.RecSize of
        1, 2: Result := False;
        4: Result := IsManaged(TypeInfo);
      else
        Result := True;
      end;
{$ELSEIF Defined(CPUARM32)}
      case GetTypeData(TypeInfo)^.RecSize of
{$IF Defined(ANDROID32) or Defined(LINUX)}
        1..4: Result := False;
{$ELSEIF Defined(IOS32)}
        1: Result := False;
{$ENDIF}
      else
        Result := True;
      end;
{$ELSEIF Defined(CPUARM64)}
      if ctx.GetType(TypeInfo).IsHFA then
        Result := False
      else
        case GetTypeData(TypeInfo)^.RecSize of
          1..7: Result := False; // Managed-type spend a size of pointer.
          8..16: Result := IsManaged(TypeInfo);
        else
          Result := True;
        end;
{$ENDIF CPU}
    tkArray:
{$IF     Defined(CPUX64) and Defined(Linux64)}
      Result := GetTypeData(TypeInfo)^.ArrayData.Size > 16;
{$ELSEIF Defined(CPUX64)}
      Result := not (GetTypeData(TypeInfo)^.ArrayData.Size in [1, 2, 4, 8]);
{$ELSEIF Defined(CPUX86) or Defined(CPUARM32)}
                                                                 
      Result := not (GetTypeData(TypeInfo)^.ArrayData.Size in [1, 2, 4]);
{$ELSEIF Defined(CPUARM64)}
      Result := GetTypeData(TypeInfo)^.ArrayData.Size > 16;
{$ENDIF CPU}
    tkSet:
      Result := SizeOfSet(TypeInfo) > SizeOf(NativeInt);
  else
    Result := False;
  end;
end;

{$IF Defined(CPUARM64) or Defined(LINUX64)}
procedure CheckHFA(const ARttiType: TRttiType; IsResult: Boolean);
begin
                                  
  if not ARttiType.IsHFA and (ARttiType.TypeKind = tkRecord) and
    ARttiType.AsRecord.HFAHasInsufficientTypeInformation
  then
    if IsResult then
      raise ENotImplemented.CreateFmt(SInsufficientTypeInformationResult,
        [ARttiType.Name])
    else
      raise ENotImplemented.CreateFmt(SInsufficientTypeInformation,
        [ARttiType.Name]);
end;
{$ENDIF CPUARM64 or LINUX64}

function PassByRef(TypeInfo: PTypeInfo; CC: TCallConv; IsConst: Boolean = False): Boolean;
{$IF not Defined(MSWINDOWS)}
var
  ctx: TRttiContext;
  rttiType: TRttiType;
{$ENDIF !MSWINDOWS}
begin
  if TypeInfo = nil then
    Exit(False);
  case TypeInfo^.Kind of
{$IF Defined(CPUX86)}
    tkArray:
      Result := GetTypeData(TypeInfo)^.ArrayData.Size > SizeOf(Pointer);                                                    
    tkRecord,
    tkMRecord:
      if (CC in [ccCdecl, ccStdCall, ccSafeCall]) and not IsConst then
        Result := False
      else
        Result := GetTypeData(TypeInfo)^.RecSize > SizeOf(Pointer);
    tkVariant: // like tkRecord, but hard-coded size
      Result := IsConst or not (CC in [ccCdecl, ccStdCall, ccSafeCall]);
{$ELSEIF Defined(CPUX64)}
{$IF Defined(MSWINDOWS)}
    tkArray:
      Result := GetTypeData(TypeInfo)^.ArrayData.Size > SizeOf(Pointer);                                                    
    tkRecord,
    tkMRecord:
      Result := not (GetTypeData(TypeInfo)^.RecSize in [1,2,4,8]);
    tkMethod,
    tkVariant:
      Result := True;
{$ELSE !MSWINDOWS} // Linux / OSX
    tkArray:
    begin
      rttiType := ctx.GetType(TypeInfo);
      {$IF Defined(LINUX64)}
      CheckHFA(rttiType, False);
      {$ENDIF}
      if rttiType.IsHFA then
        Result := CC in [ccReg, ccPascal]
      else
        Result := (GetTypeData(TypeInfo)^.ArrayData.Size > 16) or (CC in [ccReg, ccPascal]);
    end;
    tkRecord,
    tkMRecord:
    begin
{$IFDEF MACOS64}
      if (GetTypeData(TypeInfo)^.RecSize <= 16) then
        Result := False
      else 
{$ENDIF}
      if (CC in [ccReg, ccPascal]) or (GetTypeData(TypeInfo)^.RecSize > 16) then
        Result := True
      else
      begin
        rttiType := ctx.GetType(TypeInfo);
        {$IF Defined(LINUX64)}
        CheckHFA(rttiType, False);
        {$ENDIF}
        Result := False;
      end;
    end;
    tkMethod,
    tkVariant:
      Result := True;
{$ENDIF}
{$ELSEIF Defined(CPUARM32)}
    tkArray,
    tkRecord,
    tkMRecord:
      Result := CC in [ccReg, ccPascal];                                    
    tkMethod,
    tkVariant:
      Result := True;
{$ELSEIF Defined(CPUARM64)}
    tkArray:
      if ctx.GetType(TypeInfo).IsHFA then
        Result := CC in [ccReg, ccPascal]
      else
        Result := (GetTypeData(TypeInfo)^.ArrayData.Size > 16) or (CC in [ccReg, ccPascal]); // ARM64 use two-GPR to store 16bytes record
    tkRecord,
    tkMRecord:
      if ctx.GetType(TypeInfo).IsHFA then
        Result := CC in [ccReg, ccPascal]
      else
        Result := (GetTypeData(TypeInfo)^.RecSize > 16) or (CC in [ccReg, ccPascal]);
    tkMethod,
    tkVariant:
      Result := True;
{$ENDIF CPUTYPE}
{$IFNDEF NEXTGEN}
    tkString:
      Result := GetTypeData(TypeInfo)^.MaxLength > SizeOf(Pointer);                                                    
{$ENDIF !NEXTGEN}
    tkSet:
{$IF DEFINED(WIN64) or DEFINED(EXTERNALLINKER)}
      Result := SizeOfSet(TypeInfo) >= 5;
{$ELSE}
      Result := SizeOfSet(TypeInfo) > SizeOf(NativeInt);
{$ENDIF}
  else
    Result := False;
  end;
end;

procedure PassArg(Par: TRttiParameter; const ArgSrc: TValue;
  var ArgDest: TValue; CC: TCallConv);
begin
  if Par.ParamType = nil then
    ArgDest := TValue.From<Pointer>(ArgSrc.GetReferenceToRawData) // untyped var or const
  else if Par.Flags * [pfVar, pfOut] <> [] then
  begin
    if Par.ParamType.Handle <> ArgSrc.TypeInfo then
      raise EInvalidCast.CreateRes(@SByRefArgMismatch);
    ArgDest := TValue.From<Pointer>(ArgSrc.GetReferenceToRawData);
  end
  else if (pfConst in Par.Flags) and
    ((pfReference in Par.Flags) or PassByRef(Par.ParamType.Handle, CC, True)) then
  begin
    if TypeInfo(TValue) = Par.ParamType.Handle then
      ArgDest := TValue.From(ArgSrc)
    else
    begin
      if Par.ParamType.Handle <> ArgSrc.TypeInfo then
        raise EInvalidCast.CreateRes(@SByRefArgMismatch);
      ArgDest := TValue.From(ArgSrc.GetReferenceToRawData);
    end
  end
  else
    ArgDest := ArgSrc.Cast(Par.ParamType.Handle);
end;

function AllocReg(var Regs: UInt32): UInt32;
var
  newRegs: UInt32;
begin
  if Regs = 0 then
    Exit(0);
  newRegs := Regs and (Regs - 1); // clear lowest bit
  Result := Regs and not newRegs; // reveal bit cleared
  Regs := newRegs;
end;

function FreeRegCount(Regs: UInt32): UInt32;
begin
  Result := 0;
  while Regs <> 0 do
  begin
    if Regs and 1 <> 0 then
      Inc(Result);
    Regs := Regs shr 1;
  end;
end;

function Align4(Value: Integer): Integer;
begin
  Result := (Value + 3) and not 3;
end;

function Align8(Value: Integer): Integer;
begin
  Result := (Value + 7) and not 7;
end;

function Align16(Value: Integer): Integer;
begin
  Result := (Value + 15) and not 15;
end;

{ TValueDataImpl }

type
  TValueDataImpl = class(TInterfacedObject, IValueData)
  private
    FTypeInfo: PTypeInfo;
    FData: TArray<Byte>;
    FIsMoved: Boolean;
  public
    constructor Create(ABuffer: Pointer; ACount: Integer; ATypeInfo: PTypeInfo);
    constructor CreateEmpty(ACount: Integer; ATypeInfo: PTypeInfo);
    constructor CreateWithoutCopy(ABuffer: Pointer; ACount: Integer; ATypeInfo: PTypeInfo; IsMoved: Boolean);
    destructor Destroy; override;
    function GetDataSize: Integer;
    procedure ExtractRawData(ABuffer: Pointer);
    procedure ExtractRawDataNoCopy(ABuffer: Pointer);
    function GetReferenceToRawData: Pointer;
  end;

constructor TValueDataImpl.Create(ABuffer: Pointer; ACount: Integer; ATypeInfo: PTypeInfo);
begin
  CreateEmpty(ACount, ATypeInfo);
  if ABuffer <> nil then
    if IsManaged(ATypeInfo) then
      CopyArray(@FData[0], ABuffer, ATypeInfo, 1)
    else
      Move(ABuffer^, FData[0], ACount);
end;

constructor TValueDataImpl.CreateEmpty(ACount: Integer; ATypeInfo: PTypeInfo);
begin
  FTypeInfo := ATypeInfo;
  FIsMoved := False;
  SetLength(FData, ACount);
end;

constructor TValueDataImpl.CreateWithoutCopy(ABuffer: Pointer; ACount: Integer; ATypeInfo: PTypeInfo; IsMoved: Boolean);
begin
  CreateEmpty(ACount, ATypeInfo);
  FIsMoved := IsMoved;
  if ABuffer <> nil then
    Move(ABuffer^, FData[0], ACount);
end;

destructor TValueDataImpl.Destroy;
begin
  if IsManaged(FTypeInfo) and not FIsMoved then
    FinalizeArray(@FData[0], FTypeInfo, 1);
  inherited;
end;

function TValueDataImpl.GetDataSize: Integer;
begin
  Result := Length(FData);
end;

procedure TValueDataImpl.ExtractRawData(ABuffer: Pointer);
begin
  if IsManaged(FTypeInfo) then
    CopyArray(ABuffer, @FData[0], FTypeInfo, 1)
  else
    Move(FData[0], ABuffer^, Length(FData));
end;

procedure TValueDataImpl.ExtractRawDataNoCopy(ABuffer: Pointer);
begin
  Move(FData[0], ABuffer^, Length(FData));
end;

function TValueDataImpl.GetReferenceToRawData: Pointer;
begin
  Result := @FData[0];
end;

{ TValue }

constructor TValue.Create(ATypeInfo: PTypeInfo);
begin
  FData.FTypeInfo := ATypeInfo;
{$IF   SizeOf(Extended) > SizeOf(TMethod)}
  FData.FAsExtended := 0;
{$ELSE SizeOf(Extended) <= SizeOf(TMethod)}
  FData.FAsMethod.Code := nil;
  FData.FAsMethod.Data := nil;
{$ENDIF}
  FData.FValueData := nil; // we may be constructed in place of already-existing record
  Pointer(FData.FValueData) := Nop_Instance;
end;

class function TValue.From<T>(const Value: T): TValue;
begin
  Make(@Value, System.TypeInfo(T), Result);
end;

function TValue.IsType<T>(const EmptyAsAnyType: Boolean): Boolean;
begin
  Result := IsType(System.TypeInfo(T), EmptyAsAnyType);
end;

procedure TValue.Get<T>(out Result: T);
begin
  if FData.FTypeInfo = nil then
  begin
    FillChar(Pointer(@Result)^, SizeOf(T), 0);
    Exit;
  end;
  ExtractRawData(@Result);
end;

function TValue.TryAsType<T>(out AResult: T; const EmptyAsAnyType: Boolean): Boolean;
var
  val: TValue;
begin
  Result := TryCast(System.TypeInfo(T), val, EmptyAsAnyType);
  if Result then
    val.Get<T>(AResult);
end;

function TValue.AsType<T>(const EmptyAsAnyType: Boolean): T;
begin
  if not TryAsType<T>(Result, EmptyAsAnyType) then
    raise EInvalidCast.CreateRes(@SInvalidCast);
end;

function TValue.Cast<T>(const EmptyAsAnyType: Boolean): TValue;
begin
  if not TryCast(System.TypeInfo(T), Result, EmptyAsAnyType) then
    raise EInvalidCast.CreateRes(@SInvalidCast);
end;

function TValue.GetIsEmpty: Boolean;
begin
  // FTypeInfo = nil but FValueData <> nil => an initialized nil (e.g. TValue.Empty)
  // FValueData = nil => uninitialized, FTypeInfo is garbage
  if (FData.FTypeInfo = nil) or (FData.FValueData = nil) then
    Exit(True);
  case FData.FTypeInfo^.Kind of
{$IFDEF AUTOREFCOUNT}
    tkClass: Result := (FData.FValueData = nil) or
      (PPointer(FData.FValueData.GetReferenceToRawData)^ = nil);
{$ELSE  AUTOREFCOUNT}
    tkClass: Result := FData.FAsObject = nil;
{$ENDIF AUTOREFCOUNT}
    tkInterface: Result := PPointer(FData.FValueData.GetReferenceToRawData)^ = nil;
    tkMethod: Result := FData.FAsMethod.Code = nil;
    tkPointer, tkProcedure: Result := FData.FAsPointer = nil;
    tkDynArray: Result := GetArrayLength = 0;
    tkClassRef: Result := FData.FAsClass = nil;
  else
    Result := False;
  end;
end;

function TValue.GetTypeInfo: PTypeInfo;
begin
  Result := FData.FTypeInfo;
end;

function TValue.GetTypeKind: TTypeKind;
begin
  if (FData.FTypeInfo = nil) or (FData.FValueData = nil) then
    Result := tkUnknown
  else
    Result := FData.FTypeInfo^.Kind;
end;

function TValue.GetTypeDataProp: PTypeData;
begin
  if FData.FTypeInfo = nil then
    Exit(nil);
  Result := System.TypInfo.GetTypeData(FData.FTypeInfo);
end;

function TValue.GetDataSize: Integer;
begin
  if FData.FTypeInfo = nil then
    if (FData.FValueData = nil) or (Pointer(FData.FValueData) = Nop_Instance) then
      Exit(0)
    else
      Exit(IValueData(FData.FValueData).GetDataSize)
  else if FData.FValueData = nil then
    Exit(0) // uninitialized
  else
    case FData.FTypeInfo^.Kind of
      tkInteger, tkEnumeration, tkChar, tkWChar:
        case GetTypeData(FData.FTypeInfo)^.OrdType of
          otSByte, otUByte: Exit(1);
          otSWord, otUWord: Exit(2);
          otSLong, otULong: Exit(4);
        else
          Exit(0);
        end;
      tkSet:
        Exit(SizeOfSet(FData.FTypeInfo));
      tkFloat:
        case GetTypeData(FData.FTypeInfo)^.FloatType of
          ftSingle: Exit(4);
          ftDouble: Exit(8);
          ftExtended: Exit(SizeOf(Extended));
          ftComp: Exit(8);
          ftCurr: Exit(8);
        else
          Exit(0);
        end;
      tkClass, tkInterface, tkDynArray, tkWString, tkUString, tkLString,
        tkClassRef, tkPointer: Exit(SizeOf(Pointer));
      tkArray, tkRecord, tkMRecord, tkString: Exit(FData.FValueData.GetDataSize);
      tkProcedure: Exit(SizeOf(TProc));
      tkMethod: Exit(SizeOf(TMethod));
      tkInt64: Exit(8);
      tkVariant: Exit(SizeOf(Variant));
    else
      Exit(0);
    end;
end;

function GetValueStackSize(const AValue: TValue): Integer;
begin
  {$IFDEF MACOS}
  if (AValue.FData.FTypeInfo = nil) or (AValue.FData.FValueData = nil) then
    Exit(0);
  if (AValue.FData.FTypeInfo^.Kind = tkFloat) and
    (GetTypeData(AValue.FData.FTypeInfo)^.FloatType = ftExtended) then
    Exit(16);
  {$ENDIF MACOS }
  Result := Align4(AValue.DataSize);
end;

class function TValue.GetEmpty: TValue;
begin
  Result := TValue.Create(nil);
end;

class operator TValue.Implicit(const Value: string): TValue;
begin
  Result := TValue.Create(System.TypeInfo(string));
  Result.FData.FValueData := TValueDataImpl.Create(@Value, SizeOf(Value),
    System.TypeInfo(string));
end;

class operator TValue.Implicit(Value: Integer): TValue;
begin
  Result := TValue.Create(System.TypeInfo(Integer));
  Result.FData.FAsSLong := Value;
end;

class operator TValue.Implicit(Value: Cardinal): TValue;
begin
  Result := TValue.Create(System.TypeInfo(Cardinal));
  Result.FData.FAsULong := Value;
end;

class operator TValue.Implicit(Value: Single): TValue;
begin
  Result := TValue.Create(System.TypeInfo(Single));
  Result.FData.FAsSingle := Value;
end;

class operator TValue.Implicit(Value: Double): TValue;
begin
  Result := TValue.Create(System.TypeInfo(Double));
  Result.FData.FAsDouble := Value;
end;

class operator TValue.Implicit(Value: Extended): TValue;
begin
  Result := TValue.Create(System.TypeInfo(Extended));
  Result.FData.FAsExtended := Value;
end;

class operator TValue.Implicit(Value: Currency): TValue;
begin
  Result := TValue.Create(System.TypeInfo(Currency));
  Result.FData.FAsCurr := Value;
end;

class operator TValue.Implicit(Value: Int64): TValue;
begin
  Result := TValue.Create(System.TypeInfo(Int64));
  Result.FData.FAsSInt64 := Value;
end;

class operator TValue.Implicit(Value: UInt64): TValue;
begin
  Result := TValue.Create(System.TypeInfo(UInt64));
  Result.FData.FAsUInt64 := Value;
end;

class operator TValue.Implicit(Value: TObject): TValue;
var
  info: PTypeInfo;
begin
  if Value = nil then
    Exit(Empty);
  info := Value.ClassInfo;
  if info <> nil then
  begin
    Make(@Value, info, Result);
    Exit;
  end;
  Result := From<TObject>(Value);
end;

class operator TValue.Implicit(Value: TClass): TValue;
begin
  if Value = nil then
    Exit(Empty);
  Result := TValue.Create(System.TypeInfo(TClass));
  Result.FData.FAsClass := Value;
end;

class operator TValue.Implicit(Value: Boolean): TValue;
begin
  Result := TValue.Create(System.TypeInfo(Boolean));
  Result.FData.FAsUByte := Ord(Value);
end;

class function TValue.FromVariant(const Value: Variant): TValue;
begin
  case TVarData(Value).VType of
    varEmpty, varNull: Exit(Empty);
    varBoolean: Result := TVarData(Value).VBoolean;
    varShortInt: Result := TVarData(Value).VShortInt;
    varSmallint: Result := TVarData(Value).VSmallInt;
    varInteger: Result := TVarData(Value).VInteger;
    varSingle: Result := TVarData(Value).VSingle;
    varDouble: Result := TVarData(Value).VDouble;
    varCurrency: Result := TVarData(Value).VCurrency;
    varDate: Result := From<TDateTime>(TVarData(Value).VDate);
    varOleStr: Result := string(TVarData(Value).VOleStr);
    varDispatch: Result := From<IDispatch>(IDispatch(TVarData(Value).VDispatch));
    varError: Result := From<HRESULT>(TVarData(Value).VError);
    varUnknown: Result := From<IInterface>(IInterface(TVarData(Value).VUnknown));
    varByte: Result := TVarData(Value).VByte;
    varWord: Result := TVarData(Value).VWord;
    varUInt32: Result := TVarData(Value).VUInt32;
    varInt64: Result := TVarData(Value).VInt64;
    varUInt64: Result := TVarData(Value).VUInt64;
    varString: Result := string(RawByteString(TVarData(Value).VString));
    varUString: Result := UnicodeString(TVarData(Value).VUString);
  else
    raise EVariantTypeCastError.CreateRes(@SInvalidVarCast);
  end;
end;

class function TValue.FromVarRec(const VarRec: TVarRec): TValue;
begin
  case VarRec.VType of
    vtInteger: Result := VarRec.VInteger;
    vtBoolean: Result := VarRec.VBoolean;
    vtWideChar: Result := VarRec.VWideChar;
    vtInt64: Result := VarRec.VInt64^;
{$IF Declared(UTF8Char)}
    vtChar: Result := string(VarRec.VChar);
{$ENDIF}
{$IF Declared(PUTF8Char)}
    vtPChar: Result := string(VarRec.VPChar);
{$ENDIF}
    vtPWideChar: Result := string(VarRec.VPWideChar);
{$IF Declared(ShortString)}
    vtString: Result := string(VarRec.VString^);
{$ENDIF}
{$IF Declared(WideString)}
    vtWideString: Result := string(VarRec.VWideString);
{$ENDIF}
    vtAnsiString: Result := string(VarRec.VAnsiString);
    vtUnicodeString: Result := string(VarRec.VUnicodeString);
    vtObject: Result := TObject(VarRec.VObject);
    vtPointer: Result := VarRec.VPointer;
    vtInterface: Result := TValue.From<IInterface>(IInterface(VarRec.VInterface));
    vtClass: Result := VarRec.VClass;
    vtVariant: Result := TValue.FromVariant(VarRec.VVariant^);
    vtExtended: Result := VarRec.VExtended^;
    vtCurrency: Result := VarRec.VCurrency^;
  end;
end;

function TValue.IsObject: Boolean;
begin
  Result := IsEmpty or (FData.FTypeInfo^.Kind = tkClass);
end;

function TValue.IsObjectInstance: Boolean;
begin
  Result := (FData.FTypeInfo <> nil) and (FData.FTypeInfo^.Kind = tkClass)
end;

function TValue.AsObject: TObject;
begin
  if not IsObject then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  if IsEmpty then
    Result := nil
  else
  begin
{$IFDEF AUTOREFCOUNT}
    FData.FValueData.ExtractRawData(@Result);
{$ELSE  AUTOREFCOUNT}
    Result := TObject(FData.FAsObject);
{$ENDIF AUTOREFCOUNT}
  end;
end;

function TValue.IsInstanceOf(AClass: TClass): Boolean;
{$IFDEF AUTOREFCOUNT}
var
  obj: TObject;
begin
  if IsObject and (FData.FValueData <> nil) then
  begin
    FData.FValueData.ExtractRawData(@obj);
    Result := obj.InheritsFrom(AClass);
  end
  else
    Result := False;
end;
{$ELSE  AUTOREFCOUNT}
begin
  Result := IsObject and (FData.FAsObject <> nil) and TObject(FData.FAsObject).InheritsFrom(AClass);
end;
{$ENDIF AUTOREFCOUNT}

class function TValue.FromOrdinal(ATypeInfo: PTypeInfo; AValue: Int64): TValue;
begin
  if (ATypeInfo = nil) or not (ATypeInfo^.Kind in [tkInteger,
    tkChar, tkWChar, tkEnumeration, tkInt64]) then
    raise EInvalidCast.CreateRes(@SInvalidCast);

  TValue.Make(@AValue, ATypeInfo, Result);
end;

function _SkipShortString(P: Pointer): PByte; forward;

function GetDynArrayElType(ATypeInfo: PTypeInfo): PTypeInfo;
var
  ref: PPTypeInfo;
begin
  // Get real element type of dynamic array, even if it's array of array of etc.
  ref := GetTypeData(ATypeInfo).DynArrElType;
  if ref = nil then
    Exit(nil);
  Result := ref^;
end;

class function TValue.FromArray(ArrayTypeInfo: PTypeInfo; const Values: array of TValue): TValue;
  function MakeDynamic: TValue;
  var
    arr: Pointer;
    len: NativeInt;
    i, elSize: Integer;
    elLoc: PByte;
    elType: PTypeInfo;
  begin
    arr := nil;
    len := Length(Values);
    elSize := GetTypeData(ArrayTypeInfo)^.elSize;
    elType := GetDynArrayElType(ArrayTypeInfo);
    if elType = nil then // array elements have no typeinfo???
      raise EInsufficientRtti.CreateRes(@SInsufficientRtti);
    DynArraySetLength(arr, ArrayTypeInfo, 1, @len);
    try
      elLoc := arr;
      for i := 0 to High(Values) do
      begin
        Values[i].Cast(elType).ExtractRawData(elLoc);
        Inc(elLoc, elSize);
      end;
      TValue.Make(@arr, ArrayTypeInfo, Result); // makes copy of array
    finally
      DynArrayClear(arr, ArrayTypeInfo);
    end;
  end;

  function MakeStatic: TValue;
  var
    elLoc: PByte;
    elSize: Integer;
    elTypeRef: PPTypeInfo;
    i, elCount: Integer;
  begin
    TValue.Make(nil, ArrayTypeInfo, Result);
    elLoc := Result.GetReferenceToRawData;
    // If the target array is multidimensional, then Values could be either
    // of two things: a flattened list of ultimate elements, or an array of
    // arrays.
    // An array of arrays has a lot of redundant copying (=> inefficient), and
    // is harder to handle (static array typeinfo is not recursive for
    // each successive dimension, so can't easily call TValue.Cast).
    // So a flattened list of elements is the only thing supported for now.
    elCount := GetTypeData(ArrayTypeInfo)^.ArrayData.ElCount;
    if elCount <> Length(Values) then
      raise EArgumentException.Create('Values'); // do not localize
    elTypeRef := GetTypeData(ArrayTypeInfo)^.ArrayData.ElType;
    if (elTypeRef = nil) or (elTypeRef^ = nil) then
      raise EInsufficientRtti.CreateRes(@SInsufficientRtti);
    elSize := GetTypeData(ArrayTypeInfo)^.ArrayData.Size div elCount;
    Assert(elSize > 0);
    for i := 0 to elCount - 1 do
    begin
      Values[i].Cast(elTypeRef^).ExtractRawData(elLoc);
      Inc(elLoc, elSize);
    end;
  end;

begin
  case ArrayTypeInfo^.Kind of
    tkDynArray:
      Result := MakeDynamic;
    tkArray:
      Result := MakeStatic;
  else
    raise EArgumentException.Create('ArrayTypeInfo'); // do not localize
  end;
end;

function TValue.IsClass: Boolean;
begin
  Result := IsType<TClass>;
end;

function TValue.AsClass: TClass;
begin
  Result := AsType<TClass>;
end;

function TValue.IsOrdinal: Boolean;
begin
  Result := IsEmpty or
    ((TypeInfo <> nil) and
     (TypeInfo^.Kind in [tkInteger, tkChar, tkWChar, tkEnumeration, tkInt64]));
end;

function TValue.AsOrdinal: Int64;
begin
  if not TryAsOrdinal(Result) then
    raise EInvalidCast.CreateRes(@SInvalidCast);
end;

function TValue.TryAsOrdinal(out AResult: Int64): Boolean;
begin
  Result := IsOrdinal;
  if Result then
  begin
    AResult := 0;
    if not IsEmpty then
      case TypeInfo^.Kind of
        tkInteger,
        tkChar,
        tkWChar,
        tkEnumeration:
          case GetTypeData(TypeInfo)^.OrdType of
            otSByte: AResult := FData.FAsSByte;
            otUByte: AResult := FData.FAsUByte;
            otSWord: AResult := FData.FAsSWord;
            otUWord: AResult := FData.FAsUWord;
            otSLong: AResult := FData.FAsSLong;
            otULong: AResult := FData.FAsULong;
          end;
        tkInt64:
          AResult := FData.FAsSInt64;
      end;
  end;
end;

function TValue.IsType(ATypeInfo: PTypeInfo; const EmptyAsAnyType: Boolean): Boolean;
var
  unused: TValue;
begin
  Result := TryCast(ATypeInfo, unused, EmptyAsAnyType);
end;

function TValue.Cast(ATypeInfo: PTypeInfo; const EmptyAsAnyType: Boolean): TValue;
begin
  if not TryCast(ATypeInfo, Result, EmptyAsAnyType) then
    raise EInvalidCast.CreateRes(@SInvalidCast);
end;

function TValue.AsInteger: Integer;
begin
  if not IsEmpty then
  begin
    if FData.FTypeInfo = System.TypeInfo(Integer) then
      Exit(FData.FAsSLong)
    else if FData.FTypeInfo^.Kind = tkInteger then
      case GetTypeData(FData.FTypeInfo)^.OrdType of
        otSByte: Exit(FData.FAsSByte);
        otSWord: Exit(FData.FAsSWord);
        otSLong: Exit(FData.FAsSLong);
      else
          Exit(FData.FAsULong);
      end;
  end;
  Result := AsType<Integer>;
end;

function TValue.AsBoolean: Boolean;
begin
  if not IsEmpty and (FData.FTypeInfo = System.TypeInfo(Boolean)) then
    Exit(FData.FAsUByte <> 0)
  else
    Result := AsType<Boolean>;
end;

function TValue.AsExtended: Extended;
begin
  if not IsEmpty then
  begin
    if FData.FTypeInfo = System.TypeInfo(Extended) then
      Exit(FData.FAsExtended)
    else if FData.FTypeInfo^.Kind = tkFloat then
      case GetTypeData(FData.FTypeInfo)^.FloatType of
        ftSingle: Exit(FData.FAsSingle);
        ftDouble: Exit(FData.FAsDouble);
        ftExtended: Exit(FData.FAsExtended);
      end;
  end;
  Result := AsType<Extended>;
end;

function TValue.AsInt64: Int64;
begin
  if not IsEmpty then
  begin
    if FData.FTypeInfo = System.TypeInfo(Int64) then
      Exit(FData.FAsSInt64)
    else if FData.FTypeInfo = System.TypeInfo(UInt64) then
      Exit(FData.FAsUInt64)
    else if FData.FTypeInfo = System.TypeInfo(Cardinal) then
      Exit(FData.FAsULong)
    else if FData.FTypeInfo^.Kind = tkInteger then
      Exit(AsInteger);
  end;
  Result := AsType<Int64>;
end;

function TValue.AsUInt64: UInt64;
begin
  if not IsEmpty then
  begin
    if FData.FTypeInfo = System.TypeInfo(Int64) then
      Exit(FData.FAsSInt64)
    else if FData.FTypeInfo = System.TypeInfo(UInt64) then
      Exit(FData.FAsUInt64)
    else if FData.FTypeInfo = System.TypeInfo(Cardinal) then
      Exit(FData.FAsULong)
    else if FData.FTypeInfo^.Kind = tkInteger then
      Exit(AsInteger);
  end;
  Result := AsType<UInt64>;
end;

function TValue.AsInterface: IInterface;
begin
  if not IsEmpty and (FData.FTypeInfo^.Kind = tkInterface) then
    FData.FValueData.ExtractRawData(@Result)
  else
    Result := AsType<IInterface>;
end;

function TValue.AsString: string;
begin
  if not IsEmpty then
    case FData.FTypeInfo^.Kind of
{$IFNDEF NEXTGEN}
      tkString: Exit(UnicodeString(PShortString(GetReferenceToRawData)^));
      tkWString: Exit(UnicodeString(PWideString(GetReferenceToRawData)^));
{$ENDIF !NEXTGEN}
      tkLString: Exit(UnicodeString(PRawByteString(GetReferenceToRawData)^));
      tkUString: Exit(PUnicodeString(GetReferenceToRawData)^);
    end;
  Result := AsType<string>;
end;

function TValue.AsVariant: Variant;
begin
  Result := AsType<Variant>;
end;

function TValue.AsVarRec: TVarRec;
const
  TypeKindToVType: array[TTypeKind] of Byte = (
    $FF,         // tkUnknown,
    vtInteger,   // tkInteger,
    vtInteger,   // tkChar,
    vtInteger,   // tkEnumeration,
    vtExtended,  // tkFloat,
    vtUnicodeString, // tkString,
    vtInteger,   // tkSet,
    vtObject,    // tkClass,
    $FF,         // tkMethod,
    vtInteger,   // tkWChar,
    vtUnicodeString, // tkLString,
    vtUnicodeString, // tkWString,
    vtVariant,   // tkVariant,
    $FF,         // tkArray,
    $FF,         // tkRecord,
    vtInterface, // tkInterface,
    vtInt64,     // tkInt64,
    $FF,         // tkDynArray,
    vtUnicodeString, // tkUString,
    vtClass,     // tkClassRef,
    vtPointer,   // tkPointer,
    vtPointer,   // tkProcedure,
    $FF          // tkMRecord
    );
begin
  FillChar(Result, SizeOf(Result), 0);
  Result.VType := TypeKindToVType[Kind];
  case Kind of
    TTypeKind.tkInteger: Result.VInteger := AsInteger;
    TTypeKind.tkChar: Result.VChar := UTF8Char(AsInteger);
    TTypeKind.tkWChar: Result.VWideChar := WideChar(AsInteger);
    TTypeKind.tkFloat: Result.VExtended := GetReferenceToRawData;
    TTypeKind.tkString,
    TTypeKind.tkWString,
    TTypeKind.tkLString,
    TTypeKind.tkUString: Result.VUnicodeString := Pointer(AsString);
    TTypeKind.tkClass: Result.VObject := Pointer(AsObject);
    TTypeKind.tkInt64: Result.VInt64 := GetReferenceToRawData;
    TTypeKind.tkClassRef: Result.VClass := AsClass;
    TTypeKind.tkVariant: Result.VVariant := GetReferenceToRawData;
    TTypeKind.tkInterface: Result.VInterface := Pointer(AsInterface);
    TTypeKind.tkProcedure,
    TTypeKind.tkPointer: Result.VPointer := AsType<Pointer>;
    TTypeKind.tkEnumeration:
      begin
        if IsType<Boolean> then
        begin
          Result.VType := vtBoolean;
          Result.VBoolean := AsBoolean;
        end
        else
          Result.VInteger := AsInteger;
      end;
  else
    raise EInvalidCast.CreateRes(@SInvalidCast);
  end;
end;

function TValue.AsCurrency: Currency;
begin
  Result := AsType<Currency>;
end;

function TValue.IsArray: Boolean;
begin
  Result := (TypeInfo <> nil) and (TypeInfo^.Kind in [tkArray, tkDynArray]);
end;

function TValue.GetArrayLength: Integer;
begin
  if TypeInfo <> nil then
  begin
    if TypeInfo^.Kind = tkArray then
    begin
      Result := TypeData^.ArrayData.ElCount;
      Exit;
    end
    else if TypeInfo^.Kind = tkDynArray then
    begin
      Result := DynArraySize(PPointer(GetReferenceToRawData)^);
      Exit;
    end;
  end;

  raise EInvalidCast.CreateRes(@SInvalidCast);
end;

function GetArrayElType(ATypeInfo: PTypeInfo): PTypeInfo;
var
  ref: PPTypeInfo;
begin
  if ATypeInfo^.Kind = tkArray then
  begin
    ref := GetTypeData(ATypeInfo)^.ArrayData.ElType;
    if ref = nil then
      Result := nil
    else
      Result := ref^;
  end
  else if ATypeInfo^.Kind = tkDynArray then
    Exit(GetDynArrayElType(ATypeInfo))
  else
    Exit(nil);
end;

function TValue.GetArrayElement(Index: Integer): TValue;
begin
  if not IsArray then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  if (Index < 0) or (Index >= GetArrayLength) then
    raise EArgumentOutOfRangeException.Create('Index'); // do not localize

  TValue.Make(
    GetReferenceToRawArrayElement(Index),
    GetArrayElType(TypeInfo),
    Result);
end;

procedure TValue.SetArrayElement(Index: Integer; const AValue: TValue);
begin
  if not IsArray then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  if (Index < 0) or (Index >= GetArrayLength) then
    raise EArgumentOutOfRangeException.Create('Index'); // do not localize

  AValue.Cast(GetArrayElType(TypeInfo)).ExtractRawData(
    GetReferenceToRawArrayElement(Index));
end;

class procedure TValue.Make(ABuffer: Pointer;
  ATypeInfo: PTypeInfo; out Result: TValue);
var
  inlineSize: Integer;

  function GetClassInfo(AClass: TClass): PTypeInfo;
  begin
    if AClass = nil then
      Exit(ATypeInfo);
    Result := AClass.ClassInfo;
  end;

begin
  Result.FData.FTypeInfo := ATypeInfo;
  Result.FData.FValueData := IValueData(Nop_Instance);
  inlineSize := GetInlineSize(ATypeInfo);
  if inlineSize = 0 then
    Exit
  else if inlineSize > 0 then
  begin
    // Clear any bits smaller than source
{$IF   SizeOf(Extended) > SizeOf(TMethod)}
    Result.FData.FAsExtended := 0;
{$ELSE SizeOf(Extended) <= SizeOf(TMethod)}
    Result.FData.FAsMethod.Code := nil;
    Result.FData.FAsMethod.Data := nil;
{$ENDIF}
    if ABuffer <> nil then
      Move(ABuffer^, Result.FData.FAsUByte, inlineSize);

{$IFNDEF AUTOREFCOUNT}
    if ATypeInfo <> nil then
    begin
      // make a better-educated guess about type-info when we can
      case ATypeInfo^.Kind of
        tkClass:
          if Result.FData.FAsObject <> nil then
            Result.FData.FTypeInfo := GetClassInfo(TObject(Result.FData.FAsObject).ClassType);
      end;
    end;
{$ENDIF !AUTOREFCOUNT}

    Exit;
  end
  else
    Result.FData.FValueData := TValueDataImpl.Create(ABuffer, -inlineSize, ATypeInfo);
end;

class procedure TValue.Make(AValue: NativeInt; ATypeInfo: PTypeInfo;
  out Result: TValue);
var
  inlineSize: Integer;
begin
  Result.FData.FTypeInfo := ATypeInfo;
  Result.FData.FValueData := IValueData(Nop_Instance);
  inlineSize := GetInlineSize(ATypeInfo);
  if inlineSize > 0 then
    Result.FData.FAsPointer := Pointer(AValue)
  else
    Result.FData.FValueData := TValueDataImpl.Create(@AValue, SizeOf(AValue), ATypeInfo);
end;

class procedure TValue.MakeWithoutCopy(ABuffer: Pointer; ATypeInfo: PTypeInfo; out Result: TValue; IsMoved: Boolean);
var
  inlineSize: Integer;

  function GetClassInfo(AClass: TClass): PTypeInfo;
  begin
    if AClass = nil then
      Exit(ATypeInfo);
    Result := AClass.ClassInfo;
  end;

begin
  if not IsManaged(ATypeInfo) then
  begin
    Make(ABuffer, ATypeInfo, Result);
    Exit;
  end;
  Result.FData.FTypeInfo := ATypeInfo;
  inlineSize := GetInlineSize(ATypeInfo);
  Result.FData.FValueData := TValueDataImpl.CreateWithoutCopy(ABuffer, -inlineSize, ATypeInfo, IsMoved);
end;

procedure TValue.ExtractRawData(ABuffer: Pointer);
type
  PInterface = ^IInterface;
var
  inlineSize: Integer;
begin
  inlineSize := GetInlineSize(FData.FTypeInfo);
  if inlineSize = 0 then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  if inlineSize > 0 then
    Move(FData.FAsUByte, ABuffer^, inlineSize)
  else
    FData.FValueData.ExtractRawData(ABuffer);
end;

procedure TValue.ExtractRawDataNoCopy(ABuffer: Pointer);
var
  inlineSize: Integer;
begin
  inlineSize := GetInlineSize(FData.FTypeInfo);
  if inlineSize = 0 then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  if inlineSize > 0 then
    Move(FData.FAsUByte, ABuffer^, inlineSize)
  else
    FData.FValueData.ExtractRawDataNoCopy(ABuffer);
end;

function TValue.GetReferenceToRawData: Pointer;
var
  inlineSize: Integer;
begin
  inlineSize := GetInlineSize(FData.FTypeInfo);
  if inlineSize = 0 then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  if inlineSize > 0 then
    Result := @FData.FAsUByte
  else
    Result := FData.FValueData.GetReferenceToRawData;
end;

function TValue.GetReferenceToRawArrayElement(Index: Integer): Pointer;
var
  elSize: Integer;
begin
  if TypeInfo <> nil then
  begin
    if TypeInfo^.Kind = tkArray then
    begin
      with TypeData^.ArrayData do
        elSize := Size div ElCount;
      Result := PByte(GetReferenceToRawData) + Index * elSize;
      Exit;
    end
    else if TypeInfo^.Kind = tkDynArray then
    begin
      elSize := TypeData^.elSize;
      Result := PByte(PPointer(GetReferenceToRawData)^) + Index * elSize;
      Exit;
    end
  end;

  raise EInvalidCast.CreateRes(@SInvalidCast);
end;

function TValue.ToString: string;
begin
  if IsEmpty then
    Exit('(empty)'); // do not localize

  case FData.FTypeInfo^.Kind of
    tkUnknown: Result := '(unknown)'; // do not localize
    tkInteger:
      case GetTypeData(FData.FTypeInfo)^.OrdType of
        otSByte,
        otSWord,
        otSLong: Result := IntToStr(AsInt64);
        otUByte,
        otUWord,
        otULong: Result := UIntToStr(AsType<uint64>);
      end;
    tkChar: Result := string(AsType<UTF8Char>);
    tkEnumeration: Result := GetEnumName(FData.FTypeInfo, FData.FAsSLong);
    tkFloat:
      case GetTypeData(FData.FTypeInfo)^.FloatType of
        ftSingle: Result := FloatToStr(FData.FAsSingle);
        ftDouble:
        begin
          if FData.FTypeInfo = System.TypeInfo(TDate) then
            Result := DateToStr(FData.FAsDouble)
          else if FData.FTypeInfo = System.TypeInfo(TTime) then
            Result := TimeToStr(FData.FAsDouble)
          else if FData.FTypeInfo = System.TypeInfo(TDateTime) then
            Result := DateTimeToStr(FData.FAsDouble)
          else
            Result := FloatToStr(FData.FAsDouble);
        end;
        ftExtended: Result := FloatToStr(FData.FAsExtended);
        ftComp: Result := IntToStr(FData.FAsSInt64);
        ftCurr: Result := CurrToStr(FData.FAsCurr);
      end;
    tkString, tkLString, tkUString, tkWString: Result := AsType<string>;
    tkSet:
      Result := SetToString(FData.FTypeInfo, GetReferenceToRawData, True);
    tkClass:
{$IFDEF AUTOREFCOUNT}
      if FData.FValueData = nil then
{$ELSE  AUTOREFCOUNT}
      if FData.FAsObject = nil then
{$ENDIF AUTOREFCOUNT}
        Result := '(empty)' // do not localize
      else
        Result := Format('(%s @ %p)', [AsObject.ClassName, Pointer(AsObject)]); // do not localize

    tkMethod: Result := Format('(method code=%p, data=%p)', [FData.FAsMethod.Code, FData.FAsMethod.Data]); // do not localize
    tkWChar: Result := AsType<WideChar>;
    tkVariant: Result := '(variant)'; // do not localize
    tkArray: Result := '(array)'; // do not localize
    tkRecord, tkMRecord: Result := '(record)'; // do not localize
    tkProcedure: Result := Format('(procedure @ %p)', [Pointer(FData.FAsPointer)]); // do not localize
    tkPointer: Result := Format('(pointer @ %p)', [Pointer(FData.FAsPointer)]); // do not localize
    tkInterface: Result := Format('(interface @ %p)', [PPointer(FData.FValueData.GetReferenceToRawData)^]); // do not localize
    tkInt64:
      with GetTypeData(FData.FTypeInfo)^ do
        if MinInt64Value > MaxInt64Value then
          Result := UIntToStr(FData.FAsUInt64)
        else
          Result := IntToStr(FData.FAsSInt64);
    tkDynArray: Result := '(dynamic array)'; // do not localize
    tkClassRef:
      if FData.FAsClass = nil then
        Result := '(empty)' // do not localize
      else
        Result := Format('(class ''%s'' @ %p)', [FData.FAsClass.ClassName, Pointer(FData.FAsClass)]); // do not localize
  end;
end;

function ArrayOfConstToTValueArray(const Params: array of const): TArray<TValue>;
var
  I: Integer;
begin
  SetLength(Result, Length(Params));
  for I := Low(Result) to High(Result) do
    Result[I] := Params[I];
end;

function TValueArrayToArrayOfConst(const Params: array of TValue): TArray<TVarRec>;
var
  I: Integer;
begin
  SetLength(Result, Length(Params));
  for I := Low(Result) to High(Result) do
    Result[I] := Params[I].AsVarRec;
end;

type
  PListHelperCrack = ^TListHelperCrack;
  TListHelperCrack = record
  private
    FItems: Pointer;
    FCount: Integer;
    FTypeInfo: Pointer;
    [unsafe] FListObj: TObject;
  end;

function GetArrayValueFromTListHelperValue(const ACtx: TRttiContext;
  const AListHelperValue: TValue; out ACount: Integer): TValue;
var
  LpListHelper: PListHelperCrack;
begin
  if (AListHelperValue.TypeInfo <> TypeInfo(System.Generics.Collections.TListHelper)) or
     AListHelperValue.IsEmpty then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  LpListHelper := AListHelperValue.GetReferenceToRawData;
  TValue.Make(@LpListHelper^.FItems, LpListHelper^.FTypeInfo, Result);
  ACount := LpListHelper^.FCount;
end;

procedure SetTListHelperValueFromArrayValue(const ACtx: TRttiContext;
  var AListHelperValue: TValue; const AGetArrValFunc: TGetArrayValueFunc);
var
  LpListHelper: PListHelperCrack;
  LList: TObject;
  LArrType: TRttiType;
  LArrVal: TValue;
begin
  if (AListHelperValue.TypeInfo <> TypeInfo(System.Generics.Collections.TListHelper)) or
     AListHelperValue.IsEmpty or not Assigned(AGetArrValFunc) then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  LpListHelper := AListHelperValue.GetReferenceToRawData;
  // Call FListHelper.FListObj.Clear
  LList := LpListHelper^.FListObj;
  ACtx.GetType(LList.ClassInfo).GetMethod('Clear').Invoke(LList, []);
  // Get FListHelper.FTypeInfo
  LArrType := ACtx.GetType(LpListHelper^.FTypeInfo);
  // Get new array
  LArrVal := AGetArrValFunc(LArrType);
  // Set new array
  LpListHelper^.FItems := nil;
  DynArrayCopy(LpListHelper^.FItems, PPointer(LArrVal.GetReferenceToRawData)^, LArrType.Handle);
  LpListHelper^.FCount := LArrVal.GetArrayLength;
end;

// Type conversion

type
  TConvertFunc = function(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;

function ConvNone(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
begin
  AResult := ASource;
  Result := True;
end;

function ConvFail(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
begin
  Result := False;
end;

function ConvInt2Int(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  value: Integer;
begin
  // Careful about sign extension
  case GetTypeData(ASource.FData.FTypeInfo)^.OrdType of
    otSByte: value := ASource.FData.FAsSByte;
    otSWord: value := ASource.FData.FAsSWord;
    otSLong: value := ASource.FData.FAsSLong;
  else
      Cardinal(value) := ASource.FData.FAsULong;
  end;
                              
  TValue.Make(@value, ATarget, AResult);
  Result := True;
end;

function ConvInt2Float(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  value: Int64;
begin
  case GetTypeData(ASource.FData.FTypeInfo)^.OrdType of
    otSByte: value := ASource.FData.FAsSByte;
    otSWord: value := ASource.FData.FAsSWord;
    otSLong: value := ASource.FData.FAsSLong;
  else
      value := ASource.FData.FAsULong;
  end;

  case GetTypeData(ATarget)^.FloatType of
    ftSingle: AResult := TValue.From<Single>(value);
    ftDouble: AResult := TValue.From<Double>(value);
    ftExtended: AResult := TValue.From<Extended>(value);
    ftCurr: AResult := TValue.From<Currency>(value);
    ftComp: AResult := TValue.From<Comp>(value);
  end;
  Result := True;
end;

function ConvInt2Int64(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  value: Int64;
begin
  case GetTypeData(ASource.FData.FTypeInfo)^.OrdType of
    otSByte: value := ASource.FData.FAsSByte;
    otSWord: value := ASource.FData.FAsSWord;
    otSLong: value := ASource.FData.FAsSLong;
  else
      value := ASource.FData.FAsULong;
  end;
  TValue.Make(@value, ATarget, AResult);
  Result := True;
end;

function ConvChar2Str(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  value: Byte;
  rstr: RawByteString;
begin
  value := ASource.FData.FAsUByte;
  case ATarget^.Kind of
    tkChar: TValue.Make(NativeInt(value), ATarget, AResult);
    tkLString:
      begin
        SetAnsiString(@rstr, {$IFDEF NEXTGEN}PUTF8Char{$ELSE}PAnsiChar{$ENDIF}(@value), 1, ATarget^.TypeData.CodePage);
        TValue.Make(@rstr, ATarget, AResult);
      end;
{$IFDEF NEXTGEN}
{$ELSE !NEXTGEN}
    tkString: AResult := TValue.From<ShortString>(AnsiChar(value));
    tkWString: AResult := TValue.From<WideString>(WideString(AnsiChar(value)));
{$ENDIF NEXTGEN}
    tkUString: AResult := TValue.From<UnicodeString>(UnicodeString({$IFDEF NEXTGEN}UTF8Char{$ELSE}AnsiChar{$ENDIF}(value)));
  else
      Exit(False);
  end;
  Result := True;
end;

function ConvWChar2Str(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  value: WideChar;
  rstr: RawByteString;
begin
  value := WideChar(ASource.FData.FAsUWord);
  case ATarget^.Kind of
    tkWChar: TValue.Make(NativeInt(value), ATarget, AResult);
    tkLString:
      begin
        SetAnsiString(@rstr, PWideChar(string(value)), 1, ATarget^.TypeData.CodePage);
        TValue.Make(@rstr, ATarget, AResult);
      end;
{$IFDEF NEXTGEN}
{$ELSE}
    tkString: AResult := TValue.From<ShortString>(ShortString(String(value)));
    tkWString: AResult := TValue.From<WideString>(value);
{$ENDIF !NEXTGEN}
    tkUString: AResult := TValue.From<UnicodeString>(value);
  else
      Exit(False);
  end;
  Result := True;
end;

function ConvEnum2Enum(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;

  function GetEnumBaseType(ATypeInfo: PTypeInfo): PTypeInfo;
  var
    pResult: PPTypeInfo;
  begin
    if (ATypeInfo = nil) or (ATypeInfo^.Kind <> tkEnumeration) then
      Exit(nil);
    Result := ATypeInfo;
    while True do
    begin
      pResult := GetTypeData(Result)^.BaseType;
      if (pResult <> nil) and (pResult^ <> nil) and (pResult^ <> Result) then
        Result := pResult^
      else
        Break;
    end;
  end;

  function IsBoolType(ATypeInfo: PTypeInfo): Boolean;
  begin
    ATypeInfo := GetEnumBaseType(ATypeInfo);
    Result := (ATypeInfo = System.TypeInfo(Boolean)) or
      (ATypeInfo = System.TypeInfo(ByteBool)) or
      (ATypeInfo = System.TypeInfo(WordBool)) or
      (ATypeInfo = System.TypeInfo(LongBool));
    if not Result then
      if (ATypeInfo <> nil) and (ATypeInfo^.Kind = tkEnumeration) then
        with GetTypeData(ATypeInfo)^ do
          if (MinValue = 0) and (MaxValue = 1) then // match C++ bool
            Result := ATypeInfo.NameFld.ToString = 'bool';
  end;

var
  value: Integer;
  enumbasetype: PTypeInfo;
begin
                                   
  value := ASource.FData.FAsSLong;
  // Special case ByteBool, WordBool, LongBool because they are not enum subsets
  // but should be mutually convertible.
  if IsBoolType(ASource.FData.FTypeInfo) and IsBoolType(ATarget) then
  begin
    Result := True;
    enumbasetype := GetEnumBaseType(ATarget);
    if not ((enumbasetype = System.TypeInfo(ByteBool)) or
      (enumbasetype = System.TypeInfo(WordBool)) or
      (enumbasetype = System.TypeInfo(LongBool))) then
      value := Ord(value <> 0)
    else if value <> 0 then
        value := -1;
    TValue.Make(NativeInt(value), ATarget, AResult)
  end
  else
  begin
    Result := GetEnumBaseType(ASource.FData.FTypeInfo) = GetEnumBaseType(ATarget);
    if Result then
      TValue.Make(NativeInt(value), ATarget, AResult);
  end;
end;

function ConvFloat2Float(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
begin
  case GetTypeData(ASource.FData.FTypeInfo)^.FloatType of
    ftSingle:
      case GetTypeData(ATarget)^.FloatType of
        ftSingle: AResult := TValue.From<Single>(ASource.FData.FAsSingle);
        ftDouble: AResult := TValue.From<Double>(ASource.FData.FAsSingle);
        ftExtended: AResult := TValue.From<Extended>(ASource.FData.FAsSingle);
        ftComp: AResult := TValue.From<Comp>(ASource.FData.FAsSingle);
        ftCurr: AResult := TValue.From<Currency>(ASource.FData.FAsSingle);
      end;
    ftDouble:
      case GetTypeData(ATarget)^.FloatType of
        ftSingle: AResult := TValue.From<Single>(ASource.FData.FAsDouble);
        ftDouble: AResult := TValue.From<Double>(ASource.FData.FAsDouble);
        ftExtended: AResult := TValue.From<Extended>(ASource.FData.FAsDouble);
        ftComp: AResult := TValue.From<Comp>(ASource.FData.FAsDouble);
        ftCurr: AResult := TValue.From<Currency>(ASource.FData.FAsDouble);
      end;
    ftExtended:
      case GetTypeData(ATarget)^.FloatType of
        ftSingle: AResult := TValue.From<Single>(ASource.FData.FAsExtended);
        ftDouble: AResult := TValue.From<Double>(ASource.FData.FAsExtended);
        ftExtended: AResult := TValue.From<Extended>(ASource.FData.FAsExtended);
        ftComp: AResult := TValue.From<Comp>(ASource.FData.FAsExtended);
        ftCurr: AResult := TValue.From<Currency>(ASource.FData.FAsExtended);
      end;
    ftComp:
      case GetTypeData(ATarget)^.FloatType of
        ftSingle: AResult := TValue.From<Single>(ASource.FData.FAsComp);
        ftDouble: AResult := TValue.From<Double>(ASource.FData.FAsComp);
        ftExtended: AResult := TValue.From<Extended>(ASource.FData.FAsComp);
        ftComp: AResult := TValue.From<Comp>(ASource.FData.FAsComp);
        ftCurr: AResult := TValue.From<Currency>(ASource.FData.FAsComp);
      end;
    ftCurr:
      case GetTypeData(ATarget)^.FloatType of
        ftSingle: AResult := TValue.From<Single>(ASource.FData.FAsCurr);
        ftDouble: AResult := TValue.From<Double>(ASource.FData.FAsCurr);
        ftExtended: AResult := TValue.From<Extended>(ASource.FData.FAsCurr);
        ftComp: AResult := TValue.From<Comp>(ASource.FData.FAsCurr);
        ftCurr: AResult := TValue.From<Currency>(ASource.FData.FAsCurr);
      end;
    end;
  Result := True;
end;

function ConvStr2Str(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  value: UnicodeString;
  asRawByte: RawByteString;
{$IFNDEF NEXTGEN}
  asShort: ShortString;
  asWide: WideString;
{$ENDIF}
begin
  case ASource.FData.FTypeInfo^.Kind of
{$IFNDEF NEXTGEN}
    tkString: value := UnicodeString(PShortString(ASource.GetReferenceToRawData)^);
    tkWString: value := UnicodeString(PWideString(ASource.GetReferenceToRawData)^);
{$ENDIF}
    tkLString: value := UnicodeString(PRawByteString(ASource.GetReferenceToRawData)^);
    tkUString: value := UnicodeString(PUnicodeString(ASource.GetReferenceToRawData)^);
  end;

  case ATarget^.Kind of
{$IFNDEF NEXTGEN}
    tkString:
    begin
      asRawByte := AnsiString(value);
      if Length(asRawByte) > GetTypeData(ATarget)^.MaxLength then
        Exit(False);
      asShort := asRawByte;
      TValue.Make(@asShort, ATarget, AResult);
    end;

    tkWString:
    begin
      asWide := value;
      TValue.Make(@asWide, ATarget, AResult);
    end;

    tkChar:
    begin
      asRawByte := AnsiString(value);
      if Length(asRawByte) <> 1 then
        Exit(False);
      TValue.Make(PAnsiChar(asRawByte), ATarget, AResult);
    end;
{$ELSE}
    tkChar:
    begin
      asRawByte := UTF8String(value);
      if Length(asRawByte) <> 1 then
        Exit(False);
      TValue.Make(PUTF8Char(asRawByte), ATarget, AResult);
    end;
{$ENDIF}

    tkLString:
    begin
      SetAnsiString(@asRawByte, PWideChar(value), Length(value), GetTypeData(ATarget)^.CodePage);
      TValue.Make(@asRawByte, ATarget, AResult);
    end;

    tkUString: TValue.Make(@value, ATarget, AResult);

    tkWChar:
    begin
      if Length(value) <> 1 then
        Exit(False);
      TValue.Make(PChar(value), ATarget, AResult);
    end;
  end;
  Result := True;
end;

function ConvClass2Class(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  obj: TObject;
  cls: TClass;
begin
  obj := ASource.AsObject;
  cls := GetTypeData(ATarget)^.ClassType;
  Result := obj.InheritsFrom(cls);
  if Result then
    TValue.Make(IntPtr(obj), ATarget, AResult);
end;

function ConvClassRef2Self(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  src, dest: TClass;
begin
  ASource.ExtractRawData(@src);
  dest := GetTypeData(GetTypeData(ATarget)^.InstanceType^)^.ClassType;
  Result := (src = nil) or src.InheritsFrom(dest);
  if Result then
    TValue.Make(IntPtr(src), ATarget, AResult);
end;

function ConvClass2Intf(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  iid: TGUID;
  obj: Pointer;
{$IFDEF AUTOREFCOUNT}
  srcObj: TObject;
{$ENDIF AUTOREFCOUNT}
begin
  iid := GetTypeData(ATarget)^.Guid;
  if IsEqualGUID(iid, GUID_NULL) then
    Exit(False);
  // Future: consider instance -> interface conversion even without GUID
{$IFDEF AUTOREFCOUNT}
  ASource.FData.FValueData.ExtractRawData(@srcObj);
  Result := srcObj.GetInterface(iid, obj);
{$ELSE  AUTOREFCOUNT}
  Result := TObject(ASource.FData.FAsObject).GetInterface(iid, obj);
{$ENDIF AUTOREFCOUNT}
  if Result then
    TValue.MakeWithoutCopy(@obj, ATarget, AResult);
end;

function ConvIntf2Intf(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  src: Pointer;
  Parent: PTypeData;
begin
  Result := (ATarget = TypeInfo(IInterface)) or (ATarget = ASource.TypeInfo);
  if not Result then
  begin
    Parent := GetTypeData(ASource.TypeInfo);
    while (Parent <> nil) and (Parent.IntfParent <> nil) do
    begin
      if Parent.IntfParent^ = ATarget then
      begin
        Result := True;
        Break;
      end;
      Parent := GetTypeData(Parent.IntfParent^);
    end;
  end;

  if Result then
  begin
    ASource.ExtractRawDataNoCopy(@src);
    TValue.Make(@src, ATarget, AResult);
    Exit(True);
  end;
end;

function ConvInt642Int(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  signed: Int64;
  unsigned: UInt64;
begin
  if GetTypeData(ASource.FData.FTypeInfo)^.MinInt64Value >
    GetTypeData(ASource.FData.FTypeInfo)^.MaxInt64Value then
  begin
    unsigned := ASource.FData.FAsUInt64;
    case GetTypeData(ATarget)^.OrdType of
      otSByte: TValue.Make(NativeInt(Int8(unsigned)), ATarget, AResult);
      otSWord: TValue.Make(NativeInt(Int16(unsigned)), ATarget, AResult);
      otSLong: TValue.Make(NativeInt(Int32(unsigned)), ATarget, AResult);
      otUByte: TValue.Make(NativeInt(UInt8(unsigned)), ATarget, AResult);
      otUWord: TValue.Make(NativeInt(UInt16(unsigned)), ATarget, AResult);
      otULong: TValue.Make(NativeInt(UInt32(unsigned)), ATarget, AResult);
    end;
  end
  else
  begin
    signed := ASource.FData.FAsSInt64;
    case GetTypeData(ATarget)^.OrdType of
      otSByte: TValue.Make(NativeInt(Int8(signed)), ATarget, AResult);
      otSWord: TValue.Make(NativeInt(Int16(signed)), ATarget, AResult);
      otSLong: TValue.Make(NativeInt(Int32(signed)), ATarget, AResult);
      otUByte: TValue.Make(NativeInt(UInt8(signed)), ATarget, AResult);
      otUWord: TValue.Make(NativeInt(UInt16(signed)), ATarget, AResult);
      otULong: TValue.Make(NativeInt(UInt32(signed)), ATarget, AResult);
    end;
  end;
  Result := True;
end;

function ConvInt642Int64(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  signed: Int64;
  unsigned: UInt64;
begin
  if GetTypeData(ASource.FData.FTypeInfo)^.MinInt64Value >
    GetTypeData(ASource.FData.FTypeInfo)^.MaxInt64Value then
  begin
    unsigned := ASource.FData.FAsUInt64;
    if GetTypeData(ATarget)^.MinInt64Value > GetTypeData(ATarget)^.MaxInt64Value then
      AResult := TValue.From<UInt64>(unsigned)
    else
      AResult := TValue.From<Int64>(unsigned);
  end
  else
  begin
    signed := ASource.FData.FAsSInt64;
    if GetTypeData(ATarget)^.MinInt64Value > GetTypeData(ATarget)^.MaxInt64Value then
      AResult := TValue.From<UInt64>(signed)
    else
      AResult := TValue.From<Int64>(signed);
  end;
  Result := True;
end;

function ConvInt642Float(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  signed: Int64;
  unsigned: UInt64;
begin
  if GetTypeData(ASource.FData.FTypeInfo)^.MinInt64Value >
    GetTypeData(ASource.FData.FTypeInfo)^.MaxInt64Value then
  begin
    unsigned := ASource.FData.FAsUInt64;
    case GetTypeData(ATarget)^.FloatType of
      ftSingle: AResult := TValue.From<Single>(unsigned);
      ftDouble: AResult := TValue.From<Double>(unsigned);
      ftExtended: AResult := TValue.From<Extended>(unsigned);
      ftComp: AResult := TValue.From<Comp>(unsigned);
      ftCurr: AResult := TValue.From<Currency>(unsigned);
    end;
  end
  else
  begin
    signed := ASource.FData.FAsSInt64;
    case GetTypeData(ATarget)^.FloatType of
      ftSingle: AResult := TValue.From<Single>(signed);
      ftDouble: AResult := TValue.From<Double>(signed);
      ftExtended: AResult := TValue.From<Extended>(signed);
      ftComp: AResult := TValue.From<Comp>(signed);
      ftCurr: AResult := TValue.From<Currency>(signed);
    end;
  end;
  Result := True;
end;

function ConvFloat2Int(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  val: Int64;
begin
  Result := ASource.TypeData^.FloatType = ftComp;
  if not Result then
    Exit;
  val := ASource.FData.FAsSInt64; // comp always signed
  if ATarget^.Kind = tkInteger then
  begin
    with GetTypeData(ATarget)^ do
      if MinValue > MaxValue then // unsigned
        Result := (val >= Cardinal(MinValue)) and (val <= Cardinal(MaxValue))
      else
        Result := (val >= MinValue) and (val <= MaxValue);
  end
  else
  begin
    Assert(ATarget^.Kind = tkInt64);
    with GetTypeData(ATarget)^ do
      if MinInt64Value > MaxInt64Value then // unsigned
        Result := (val >= 0) and (UInt64(val) >= UInt64(MinInt64Value))
          and (UInt64(val) <= UInt64(MaxInt64Value))
      else
        Result := (val >= MinInt64Value) and (val <= MaxInt64Value)
  end;

  if Result then
    TValue.Make(@val, ATarget, AResult);
end;

function ConvFromVariant(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  TempVal: TValue;
  v: Variant;
begin
  v := ASource.AsVariant;
  case TVarData(v).VType of
    varEmpty, varNull: TempVal := TValue.Empty;
    varBoolean: TempVal := TVarData(v).VBoolean;
    varShortInt: TempVal := TVarData(v).VShortInt;
    varSmallint: TempVal := TVarData(v).VSmallInt;
    varInteger: TempVal := TVarData(v).VInteger;
    varSingle: TempVal := TVarData(v).VSingle;
    varDouble: TempVal := TVarData(v).VDouble;
    varCurrency: TempVal := TVarData(v).VCurrency;
    varDate: TempVal := TValue.From<TDateTime>(TVarData(v).VDate);
    varOleStr: TempVal := string(TVarData(v).VOleStr);
    varDispatch: TempVal := TValue.From<IDispatch>(IDispatch(TVarData(v).VDispatch));
    varError: TempVal := TValue.From<HRESULT>(TVarData(v).VError);
    varUnknown: TempVal := TValue.From<IInterface>(IInterface(TVarData(v).VUnknown));
    varByte: TempVal := TVarData(v).VByte;
    varWord: TempVal := TVarData(v).VWord;
    varUInt32: TempVal := TVarData(v).VUInt32;
    varInt64: TempVal := TVarData(v).VInt64;
    varUInt64: TempVal := TVarData(v).VUInt64;
{$IFNDEF NEXTGEN}
    varString: TempVal := string(AnsiString(TVarData(v).VString));
{$ENDIF !NEXTGEN}
    varUString: TempVal := UnicodeString(TVarData(v).VUString);
  else
    Exit(False);
  end;
  Result := TempVal.TryCast(ATarget, AResult);
end;

function Conv2Variant(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  v: Variant;
begin
  case ASource.Kind of
    tkInteger: v := ASource.AsInt64; // whole range including unsigned
{$IFDEF NEXTGEN}
    tkChar: v := UTF8String(ASource.AsType<UTF8Char>);
{$ELSE}
    tkChar: v := ASource.AsType<AnsiChar>;
{$ENDIF}
    tkFloat:
      if ASource.TypeInfo = System.TypeInfo(TDateTime) then
        v := TDateTime(ASource.AsExtended)
      else
        case ASource.TypeData^.FloatType of
          ftSingle, ftDouble, ftExtended: v := ASource.AsExtended;
          ftComp: v := ASource.FData.FAsComp;
          ftCurr: v := ASource.FData.FAsCurr;
        end;
    tkString, tkLString, tkWString, tkUString:
      v := ASource.AsString;
    tkWChar:
      v := WideChar(ASource.FData.FAsUWord);
    tkInt64:
      if ASource.TypeData^.MinInt64Value > ASource.TypeData^.MaxInt64Value then
        v := ASource.AsType<UInt64>
      else
        v := ASource.AsInt64;
    tkEnumeration:
        if ASource.IsType<Boolean> then
          v := ASource.AsBoolean
        else
          v := ASource.AsOrdinal;
{$IFNDEF NEXTGEN}
    tkClass:
      v := NativeInt(ASource.AsObject);
{$ENDIF !NEXTGEN}
    tkInterface:
      v := ASource.AsInterface;
  else
      Exit(False);
  end;

  if ATarget = TypeInfo(OleVariant) then
    AResult := TValue.From<OleVariant>(v)
  else
    AResult := TValue.From<Variant>(v);
  Result := True;
end;

function ConvVariant2Variant(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
begin
  if ASource.TypeInfo = ATarget then
    AResult := ASource
  else if ATarget = TypeInfo(OleVariant) then
    AResult := TValue.From<OleVariant>(ASource.AsType<Variant>)
  else
    AResult := TValue.From<Variant>(ASource.AsType<OleVariant>);
  Result := True;
end;

function ConvSet2Set(const ASource: TValue; ATarget: PTypeInfo; out AResult: TValue): Boolean;
var
  SrcMin, SrcMax,
  TrgMin, TrgMax: Integer;
begin
  Result := False;
                                                                       
  SrcMin := ASource.TypeData.CompType^.TypeData.MinValue;
  SrcMax := ASource.TypeData.CompType^.TypeData.MaxValue;
  TrgMin := ATarget.TypeData.CompType^.TypeData.MinValue;
  TrgMax := ATarget.TypeData.CompType^.TypeData.MaxValue;

  if (SrcMin = TrgMin) and (SrcMax = TrgMax) then
  begin
    TValue.Make(Asource.GetReferenceToRawData, ATarget, AResult);
    Result := true;
  end
end;

const
  Conversions: array[TTypeKind,TTypeKind] of TConvertFunc = ( // [source, target]
    // tkUnknown
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvNone, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkInteger
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvInt2Int, ConvFail, ConvFail, ConvInt2Float,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvInt2Int64, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkChar
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvNone, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvChar2Str, ConvFail, ConvFail, ConvFail, ConvChar2Str,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvChar2Str, ConvChar2Str, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvChar2Str, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkEnumeration
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvEnum2Enum, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkFloat
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFloat2Int, ConvFail, ConvFail, ConvFloat2Float,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFloat2Int, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkString
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvStr2Str, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvStr2Str, ConvFail, ConvFail, ConvFail, ConvStr2Str,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvStr2Str, ConvStr2Str, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvStr2Str, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkSet
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvSet2Set, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkClass
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvClass2Class, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvClass2Intf, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkMethod
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkWChar
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvWChar2Str, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvWChar2Str, ConvFail, ConvFail, ConvFail, ConvNone,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvWChar2Str, ConvWChar2Str, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvWChar2Str, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkLString
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvStr2Str, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvStr2Str, ConvFail, ConvFail, ConvFail, ConvStr2Str,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvStr2Str, ConvStr2Str, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvStr2Str, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkWString
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvStr2Str, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvStr2Str, ConvFail, ConvFail, ConvFail, ConvStr2Str,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvStr2Str, ConvStr2Str, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvStr2Str, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkVariant
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFromVariant, ConvFromVariant, ConvFromVariant, ConvFromVariant,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFromVariant, ConvFail, ConvFail, ConvFail, ConvFromVariant,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFromVariant, ConvFromVariant, ConvVariant2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFromVariant, ConvFail, ConvFromVariant, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkArray
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkRecord
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkInterface // TODO : (GUID search)
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvIntf2Intf, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkInt64
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvInt642Int, ConvFail, ConvFail, ConvInt642Float,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvInt642Int64, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkDynArray
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkUString
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvStr2Str, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvStr2Str, ConvFail, ConvFail, ConvFail, ConvStr2Str,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvStr2Str, ConvStr2Str, Conv2Variant, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvStr2Str, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkClassRef
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvClassRef2Self,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    ),
    // tkPointer
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvNone, ConvNone, ConvFail
    ),
    // tkProcedure
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvNone, ConvNone, ConvFail
    ),
    // tkMRecord
    (
      // tkUnknown, tkInteger, tkChar, tkEnumeration, tkFloat,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkString, tkSet, tkClass, tkMethod, tkWChar,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkLString, tkWString, tkVariant, tkArray, tkRecord,
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkInterface, tkInt64, tkDynArray, tkUString, tkClassRef
      ConvFail, ConvFail, ConvFail, ConvFail, ConvFail,
      // tkPointer, tkProcedure, tkMRecord
      ConvFail, ConvFail, ConvFail
    )
  );

function TValue.TryCast(ATypeInfo: PTypeInfo; out AResult: TValue; const EmptyAsAnyType: Boolean): Boolean;
var
  Size: Integer;
begin
  if EmptyAsAnyType and IsEmpty then
  begin
    // Empty value converts to all-zeros of the corresponding type, and always
    // succeeds. ATypeInfo being nil indicates a typeless nil.
    AResult := TValue.Empty;
    if ATypeInfo <> nil then
    begin
      Size := GetInlineSize(ATypeInfo);
      if Size < 0 then
        AResult.FData.FValueData := TValueDataImpl.CreateEmpty(-size, ATypeInfo);
      AResult.FData.FTypeInfo := ATypeInfo;
    end;
    Exit(True);
  end;
  if not EmptyAsAnyType and (FData.FTypeInfo = nil) then
    Exit(False);
  if FData.FTypeInfo = ATypeInfo then
  begin
    AResult := Self;
    Exit(True);
  end;
  if ATypeInfo = nil then
    Exit(False);
  if ATypeInfo = System.TypeInfo(TValue) then
  begin
    AResult := TValue.From<TValue>(Self);
    Exit(True);
  end;
  Result := Conversions[FData.FTypeInfo^.Kind, ATypeInfo^.Kind](Self, ATypeInfo, AResult);
end;

type
{$POINTERMATH ON}
  PVtablePtr = ^Pointer;
{$POINTERMATH OFF}
  PPVtable = ^PVtable;
  PVtable = ^TVtable;
  TVtable = array[0..MaxInt div SizeOf(Pointer) - 1] of Pointer;

{ Binary Scanner }

procedure PeekData(var P: PByte; var Data; Len: Integer);
begin
  Move(P^, Data, Len);
end;

procedure ReadData(var P: PByte; var Data; Len: Integer);
begin
  PeekData(P, Data, Len);
  Inc(P, Len);
end;

function ReadI16(var P: PByte): SmallInt;
begin
  ReadData(P, Result, SizeOf(Result));
end;

function ReadI32(var P: PByte): Integer;
begin
  ReadData(P, Result, SizeOf(Result));
end;

function ReadI8(var P: PByte): ShortInt;
begin
  ReadData(P, Result, SizeOf(Result));
end;

function ReadPointer(var P: PByte): Pointer;
begin
  ReadData(P, Result, SizeOf(Result));
end;

function ReadU16(var P: PByte): Word;
begin
  ReadData(P, Result, SizeOf(Result));
end;

function ReadU32(var P: PByte): Cardinal;
begin
  ReadData(P, Result, SizeOf(Result));
end;

function ReadU8(var P: PByte): Byte;
begin
  ReadData(P, Result, SizeOf(Result));
end;

// P points a length field of ShortString.
function _UTF8ToString(P: pointer): string;
var
  Len: Byte;
  Buf: Array of Byte;
begin
  Result := '';
                                     
  Len := PByte(P)^;
  if Len <> 0 then
  begin
    SetLength(Buf, Len+1);
    Move(PByte(P)^, Buf[0], Len+1);
    Result := UTF8ToString(Buf);
  end;
end;

function ReadShortString(var P: PByte): string;
var
  len: Integer;
begin
  Result := _UTF8ToString(P);
  len := ReadU8(P);
  Inc(P, len);
end;

procedure Skip(var P: PByte; ByteCount: Integer);
begin
  Inc(P, ByteCount);
end;

function PeekI16(var P: PByte): SmallInt;
begin
  PeekData(P, Result, SizeOf(Result));
end;

function PeekI32(var P: PByte): Integer;
begin
  PeekData(P, Result, SizeOf(Result));
end;

function PeekI8(var P: PByte): ShortInt;
begin
  PeekData(P, Result, SizeOf(Result));
end;

function PeekPointer(var P: PByte): Pointer;
begin
  PeekData(P, Result, SizeOf(Result));
end;

function PeekShortString(var P: PByte): string;
begin
{$IFNDEF NEXTGEN}
  Result := string(PShortString(P)^);
{$ELSE NEXTGEN}
  Result := string(MarshaledAString(P)^);
{$ENDIF !NEXTGEN}
end;

function PeekU16(var P: PByte): Word;
begin
  PeekData(P, Result, SizeOf(Result));
end;

function PeekU32(var P: PByte): Cardinal;
begin
  PeekData(P, Result, SizeOf(Result));
end;

function PeekU8(var P: PByte): Byte;
begin
  PeekData(P, Result, SizeOf(Result));
end;

// P points a length field of ShortString.
function _SkipShortString(P: Pointer): PByte;
begin
  Result := PByte(P) + PByte(P)^ + 1;
end;

function GetBitField(Value, Shift, Bits: Integer): Integer;
begin
  Result := (Value shr Shift) and ((1 shl Bits) - 1);
end;

{ TRttiPool }

function GetRttiClass(ATypeInfo: PTypeInfo): TRttiClass;
const
  Classes: array[TTypeKind] of TRttiClass = (
    // tkUnknown, tkInteger, tkChar, tkEnumeration,
    TRttiType, TRttiOrdinalType, TRttiOrdinalType, TRttiEnumerationType,
    // tkFloat, tkString, tkSet, tkClass,
    TRttiFloatType, TRttiStringType, TRttiSetType, TRttiInstanceType,
    // tkMethod, tkWChar, tkLString, tkWString,
    TRttiMethodType, TRttiOrdinalType, TRttiAnsiStringType, TRttiStringType,
    // tkVariant, tkArray, tkRecord, tkInterface,
    TRttiType, TRttiArrayType, TRttiRecordType, TRttiInterfaceType,
    // tkInt64, tkDynArray, tkUString, tkClassRef,
    TRttiInt64Type, TRttiDynamicArrayType, TRttiStringType, TRttiClassRefType,
    // tkPointer, tkProcedure, tkMRecord
    TRttiPointerType, TRttiProcedureType, TRttiRecordType
  );
begin
  Result := Classes[ATypeInfo^.Kind];
end;

type
  TRealPackage = class(TRttiPackage) // as opposed to orphan package
  private
    FTypeInfo: PPackageTypeInfo;
    FTypeToName: TDictionary<PTypeInfo,string>; // immutable, lazy ctor
    FNameToType: TDictionary<string,PTypeInfo>; // immutable, lazy ctor

    function GetName: string; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    procedure MakeTypeLookupTable;
    function GetNameFromType(AType: TRttiType): string; override;
  public
    destructor Destroy; override;
    function GetTypes: TArray<TRttiType>; override;
    function FindType(const AQualifiedName: string): TRttiType; override;
  end;

  { The Orphan package may be used for C++-defined types with type info but
    that don't have a Delphi-style containing package. }
  TOrphanPackage = class(TRttiPackage)
  public
    constructor Create; reintroduce;
    function GetName: string; override;
  public
    function GetTypes: TArray<TRttiType>; override;
    function FindType(const AQualifiedName: string): TRttiType; override;
  end;

  TRttiPool = class(TObject)
  private
    FLatestPackageList: TArray<TRttiPackage>;
    FOrphanPackage: TRttiPackage;
    FPackageVer: Integer;
    function GetPackageFor(AHandle: Pointer): TRttiPackage;
    function TypeOrNil(Value: PPTypeInfo): TRttiType;
    function ReadObject(ARttiClass: TRttiClass; AParent: TRttiObject;
      var P: PByte): TRttiObject; overload;
    function ReadObjectPointer(ARttiClass: TRttiClass; AParent: TRttiObject;
      P: Pointer): TRttiObject; overload;
    function GetPackageList: TArray<TRttiPackage>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetType(ATypeInfo: Pointer): TRttiType; overload;
    function GetType(AClass: TClass): TRttiType; overload;
    function GetTypes: TArray<TRttiType>;
    function GetPackages: TArray<TRttiPackage>;
    function FindType(const AQualifiedName: string): TRttiType;
  end;

const
{$IFDEF LINUX}
  PackageInfoFuncName = '_GetPackageInfoTable'; // do not localize
{$ELSE !LINUX}
  PackageInfoFuncName = '@GetPackageInfoTable'; // do not localize
{$ENDIF LINUX}

var
  { Reads and writes of the Pool variable during context creation / destruction
    are protected by PoolLock, but reads of the variable from other RTTI objects
    is not, because working with RTTI objects without at least one context being
    alive is an error. Keeping at least one context alive should keep the Pool
    variable valid.

    PoolRefCount is always protected by PoolLock. }
  Pool: TRttiPool;
  PoolRefCount: Integer;
  _PoolLock: TObject;

function PoolLock: TObject; inline;
begin
  if _PoolLock = nil then
    _PoolLock := TObject.Create;
  Result := _PoolLock
end;

class operator TValue.Implicit(const VarRec: TVarRec): TValue;
begin
  Result := TValue.FromVarRec(VarRec)
end;

{ TRttiPool }

constructor TRttiPool.Create;
begin
  FOrphanPackage := TOrphanPackage.Create;
end;

destructor TRttiPool.Destroy;
var
  i: Integer;
begin
  for i := 0 to Length(FLatestPackageList) - 1 do
    FLatestPackageList[i].Free;
  FOrphanPackage.Free;
  inherited;
end;

function TRttiPool.GetPackageList: TArray<TRttiPackage>;
                                                                                   
  function DoUpdate: TArray<TRttiPackage>;
  var
    count: Integer;

    procedure MoveOrCreatePackage(Lib: PLibModule);
    var
      i: Integer;
      p: PByte;
      pkg: TRttiPackage;
    begin
      pkg := nil;

      // Try already-loaded packages
      for i := 0 to count - 1 do
      begin
        if Result[i] = nil then
          Continue;
        if Result[i].Handle = Lib^.Instance then
          Exit;
      end;

      // Try previously loaded packages
      for i := 0 to Length(FLatestPackageList) - 1 do
      begin
        if FLatestPackageList[i] = nil then
          Continue;
        if FLatestPackageList[i].Handle <> Lib^.Instance then
          Continue;

        // Found
        pkg := FLatestPackageList[i];
        FLatestPackageList[i] := nil;
        Break;
      end;

      if pkg = nil then
      begin
        p := Pointer(Lib);
        pkg := TRealPackage.Create(nil, nil, p);
      end;

      Result[count] := pkg;
      Inc(count);
    end;

  var
    lib: PLibModule;
    i, ver: Integer;
  begin
    TMonitor.Enter(PoolLock);
    try
      lib := LibModuleList;
      ver := GetModuleListVersion;

      if FPackageVer = ver then
        Exit(FLatestPackageList);

      count := 0;
      while lib <> nil do
      begin
        if (lib^.TypeInfo <> nil) or
            (GetProcAddress(lib^.Instance, PackageInfoFuncName) <> nil) then
          Inc(count);
        lib := lib^.Next;
      end;
      SetLength(Result, count);

      count := 0;

      lib := LibModuleList;
      while lib <> nil do
      begin
        if (lib^.TypeInfo <> nil) or
            (GetProcAddress(lib^.Instance, PackageInfoFuncName) <> nil) then
          MoveOrCreatePackage(lib);
        lib := lib^.Next;
      end;

      for i := 0 to Length(FLatestPackageList) - 1 do
        FLatestPackageList[i].Free; // items moved into Result are already nil here

      SetLength(Result, count); // truncate to real count
      if count > 0 then
        TArray.Sort<TRttiPackage>(Result,
          TComparer<TRttiPackage>.Construct(
            function(const L, R: TRttiPackage): Integer
            begin
              if UIntPtr(L.BaseAddress) < UIntPtr(R.BaseAddress) then
                Result := -1
              else if UIntPtr(L.BaseAddress) > UIntPtr(R.BaseAddress) then
                Result := 1
              else
                Result := 0;
            end));
      FLatestPackageList := Result;
      FPackageVer := ver;
    finally
      TMonitor.Exit(PoolLock);
    end;
  end;
begin
  // You're playing with fire if you try to race package addition and removal
  // in particular against RTTI operations. Please don't do that.
  Result := FLatestPackageList;
  if FPackageVer = GetModuleListVersion then
    Exit;
  Result := DoUpdate;
end;

function TRttiPool.GetPackageFor(AHandle: Pointer): TRttiPackage;
var
  start, finish, sel: Integer;
  pl: TArray<TRttiPackage>;
begin
  pl := GetPackageList;
  start := 0;
  finish := Length(pl);
  while finish - start > 1 do
  begin
    sel := (start + finish) div 2;
    if UIntPtr(pl[sel].BaseAddress) <= UIntPtr(AHandle) then
      start := sel
    else
      finish := sel;
  end;
  if start < Length(pl) then
    Result := pl[start]
  else
    Result := FOrphanPackage;
end;

function TRttiPool.ReadObject(ARttiClass: TRttiClass;
  AParent: TRttiObject; var P: PByte): TRttiObject;
begin
  Result := GetPackageFor(P).ReadObject(ARttiClass, AParent, P);
end;

function TRttiPool.ReadObjectPointer(ARttiClass: TRttiClass; AParent: TRttiObject;
  P: Pointer): TRttiObject;
var
  pb: PByte;
begin
  pb := P;
  Result := ReadObject(ARttiClass, AParent, pb);
end;

function TRttiPool.GetType(ATypeInfo: Pointer): TRttiType;
begin
  if ATypeInfo = nil then
    Exit(nil);
  Result := TRttiType(ReadObjectPointer(TRttiType, nil, ATypeInfo));
end;

function TRttiPool.GetType(AClass: TClass): TRttiType;
begin
  if AClass.ClassInfo <> nil then
    Result := GetType(PTypeInfo(AClass.ClassInfo))
  else
    Result := nil;
end;

function TRttiPool.GetTypes: TArray<TRttiType>;
var
  i: Integer;
  pkgs: TArray<TRttiPackage>;
  types: TArray<TArray<TRttiType>>;
begin
  pkgs := GetPackageList;
  SetLength(types, Length(pkgs));
  for i := 0 to High(pkgs) do
    types[i] := pkgs[i].GetTypes;
  Result := TArrayHelper.Concat<TRttiType>(types);
end;

function TRttiPool.GetPackages: TArray<TRttiPackage>;
begin
  Result := Copy(GetPackageList);
end;

function TRttiPool.FindType(const AQualifiedName: string): TRttiType;
var
  r: TArray<TRttiPackage>;
  p: TRttiPackage;
begin
  r := GetPackageList;
  for p in r do
  begin
    Result := p.FindType(AQualifiedName);
    if Result <> nil then
      Exit;
  end;
  Result := nil;
end;

function TRttiPool.TypeOrNil(Value: PPTypeInfo): TRttiType;
begin
  if Value = nil then
    Exit(nil);
  Result := GetType(Value^);
end;

type
  TPoolToken = class(TInterfacedObject)
  public
    constructor Create;
    destructor Destroy; override;
  end;

constructor TPoolToken.Create;
begin
  TMonitor.Enter(PoolLock);
  try
    if Pool = nil then
    begin
      Pool := TRttiPool.Create;
      PoolRefCount := 1;
    end
    else
      Inc(PoolRefCount);
  finally
    TMonitor.Exit(PoolLock);
  end;
end;

destructor TPoolToken.Destroy;
begin
  TMonitor.Enter(PoolLock);
  try
    Dec(PoolRefCount);
    if PoolRefCount = 0 then
    begin
      Pool.Free;
      Pool := nil;
    end;
  finally
    TMonitor.Exit(PoolLock);
  end;
  inherited;
end;

type
  PInterface = ^IInterface;

procedure EnsurePoolToken(TokenRef: PInterface);
var
  sample: Pointer;

  procedure DoCreate;
  var
    tok: IInterface;
  begin
    tok := TRttiContext.FGlobalContextToken;
    if tok = nil then
      tok := TPoolToken.Create;
    if AtomicCmpExchange(PPointer(TokenRef)^, Pointer(tok), sample) = sample then
    begin
      // We won the race to initialize the TokenRef location, so
      // zero-out interface reference without decrementing reference count.
      PPointer(@tok)^ := nil;
    end;
  end;

begin
  sample := PPointer(TokenRef)^;
  if sample <> nil then
    Exit;
  DoCreate;
end;

{ Attribute Construction }

function ConstructAttributes(P: PByte): TArray<TCustomAttribute>;

  function ParseArgs(AttrType: TRttiInstanceType; Data: PByte; Len: Integer;
      const Params: TArray<TRttiParameter>): TArray<TValue>;

    function ReadUtf8Arg: UTF8String;
    var
      resLen: Integer;
    begin
      resLen := ReadU16(Data);
      SetString(Result, PUTF8Char(Data), resLen);
      Inc(Data, resLen);
      Dec(Len, resLen + SizeOf(Word));
    end;

{$IFNDEF NEXTGEN}
    function ReadShortString: ShortString;
    begin
      // *not* in UTF8 format
      Result[0] := AnsiChar(ReadU8(Data));
      Move(Data^, Result[1], Byte(Result[0]));
      Inc(Data, Byte(Result[0]));
      Dec(Len, Byte(Result[0]) + 1);
    end;
{$ENDIF !NEXTGEN}

  var
    i: Integer;
    size: Integer;
    p: Pointer;
  begin
    SetLength(Result, Length(Params));
    for i := 0 to Length(Params) - 1 do
    begin
      case Params[i].ParamType.TypeKind of
        tkPointer:
        begin
          p := PPointer(Data)^;
          if p = nil then
            Result[i] := TValue.Empty
          else
            if Params[i].ParamType.Handle = TypeInfo(PTypeInfo) then
              TValue.Make(IntPtr(PPTypeInfo(p)^), Params[i].ParamType.Handle, Result[i])
            else
              TValue.Make(@p, Params[i].ParamType.Handle, Result[i]);
          Dec(len, SizeOf(Pointer));
          Inc(Data, SizeOf(Pointer));
        end;

        tkClassRef:
        begin
          p := PPointer(Data)^;
          if p = nil then
            Result[i] := TValue.Empty
          else
          begin
            Assert(PPTypeInfo(p)^.Kind = tkClass);
            Result[i] := TValue(GetTypeData(PPTypeInfo(p)^)^.ClassType).Cast(Params[i].ParamType.Handle);
          end;
          Dec(len, SizeOf(Pointer));
          Inc(Data, SizeOf(Pointer));
        end;

        tkClass: // expected: TRttiType etc., accepting a TypeInfo reference.
        begin
          p := PPointer(Data)^;
          Result[i] := TValue(Pool.TypeOrNil(p)).Cast(Params[i].ParamType.Handle);
          Dec(len, SizeOf(Pointer));
          Inc(Data, SizeOf(Pointer));
        end;

{$IFNDEF NEXTGEN}
        tkString:
          Result[i] := TValue.From<ShortString>(ReadShortString).Cast(Params[i].ParamType.Handle);

        tkWString,
{$ENDIF !NEXTGEN}
        tkLString, tkUString:
          Result[i] := TValue.From<UTF8String>(ReadUtf8Arg).Cast(Params[i].ParamType.Handle);
      else
          size := Params[i].ParamType.TypeSize;
          Dec(len, size);
          TValue.Make(Data, Params[i].ParamType.Handle, Result[i]);
          Inc(Data, size);
        end;
    end;
    Assert(Len = 0);
  end;

  function FindCtor(AttrType: TRttiInstanceType; CtorAddr: Pointer): TRttiMethod;
  type
    PPPointer = ^PPointer;
  var
  {$IFDEF MSWINDOWS}
    p: PByte;
  {$ENDIF}
    Method: TRttiMethod;
    imp: Pointer;
  begin
    for Method in AttrType.GetMethods do
      if Method.CodeAddress = CtorAddr then
        Exit(Method);
                                             
    {$IF defined(MACOS) or defined(ANDROID) or defined(LINUX)}
    // no implementation yet for packages, unfortunately
    Exit(nil);
    {$ENDIF MACOS}

    {$IFDEF MSWINDOWS}
    p := CtorAddr;
    // expect a package (i.e. DLL) import
    Assert(p^ = $FF);
    Inc(p);
    Assert(p^ = $25);
    Inc(p);
    {$IFDEF CPUX64}
    // $FF $25 => indirect jump RIP-relative m32
    imp := PPointer((p + 4) + PInteger(p)^)^;
    {$ENDIF CPUX64}
    {$IFDEF CPUX86}
    // $FF $25 => indirect jump m32
    imp := PPPointer(p)^^;
    {$ENDIF CPUX86}
    {$ENDIF MSWINDOWS}

    for Method in attrType.GetMethods do
      if Method.CodeAddress = imp then
        Exit(Method);

    Result := nil;
  end;

  function ConstructAttribute(var P: PByte): TCustomAttribute;
  var
    attrType: TRttiInstanceType;
    paramLen: Word;
    paramData: Pointer;
    ctorAddr: Pointer;
    ctor: TRttiMethod;
  begin
    attrType := Pool.GetType(DerefPointer(ReadPointer(P))) as TRttiInstanceType;
    ctorAddr := ReadPointer(P);
    paramLen := ReadU16(P);
    paramData := P;
    Inc(P, paramLen);

    ctor := FindCtor(attrType, ctorAddr);
    if ctor = nil then
      Result := nil
    else
      Result := ctor.Invoke(attrType.MetaclassType,
        ParseArgs(attrType, paramData, paramLen, ctor.GetParameters)).AsType<TCustomAttribute>;
  end;

var
  list: TList<TCustomAttribute>;
  attr: TCustomAttribute;
  len: Integer;
  finish: PByte;
begin
  len := ReadU16(P);
  Dec(len, SizeOf(Word));
  if len = 0 then
    Exit(nil);
  finish := P + len;

  list := TList<TCustomAttribute>.Create;
  try
    while P < finish do
    begin
      attr := ConstructAttribute(P);
      if attr <> nil then
        list.Add(attr);
    end;
    Result := TListHelper.ToArray<TCustomAttribute>(list);
  finally
    list.Free;
  end;
end;

{ Lazy-instantiation of custom attributes }

function LazyLoadAttributes(var P: PByte): TFunc<TArray<TCustomAttribute>>;
  function MakeClosure(data: PByte): TFunc<TArray<TCustomAttribute>>;
  var
    // if data is nil, then "value" is valid (loaded); this is how the
    // closure avoids constructing attributes twice, on second and subsequent
    // calls
    value: TArray<TCustomAttribute>;
    finalizer: IFinalizer; // destroys CAs when result goes out of scope
  begin
    Result := function: TArray<TCustomAttribute>
    var
      ca: TCustomAttribute;
    begin
      if data = nil then
        Exit(Copy(value));

      TMonitor.Enter(PoolLock);
      try
        if data = nil then
          Exit(Copy(value));

        if PWord(data)^ = 2 then // should never be reached, unless image data modified
        begin
          value := nil;
          data := nil;
          Exit(nil);
        end;

        finalizer := TFinalizer.Create;
        value := ConstructAttributes(data);
        for ca in value do
          finalizer.Add(ca);
        data := nil;
        Result := Copy(value);
      finally
        TMonitor.Exit(PoolLock);
      end;
    end;
  end;

var
  size: Integer;
  data: PByte;
begin
  data := P;
  size := PWord(data)^;
  Inc(P, size);
  if size = 2 then // avoid creating closure when not needed
    Exit(nil);

  Result := MakeClosure(data);
end;

{ TRttiContext }

class function TRttiContext.Create: TRttiContext;
begin
  EnsurePoolToken(@Result.FContextToken);
end;

procedure TRttiContext.Free;
begin
  FContextToken := nil;
end;

function TRttiContext.GetType(ATypeInfo: Pointer): TRttiType;
begin
  EnsurePoolToken(@FContextToken);
  Result := Pool.GetType(ATypeInfo);
end;

class procedure TRttiContext.DropContext;
var
  CurrentContext: Pointer;
begin
  if AtomicDecrement(FGlobalContextCounter) = 0 then
  begin
    CurrentContext := Pointer(FGlobalContextToken);
    if AtomicCmpExchange(Pointer(FGlobalContextToken), nil, CurrentContext) = CurrentContext then
      IInterface(CurrentContext) := nil;
  end;
end;

function TRttiContext.FindType(const AQualifiedName: string): TRttiType;
begin
  EnsurePoolToken(@FContextToken);
  Result := Pool.FindType(AQualifiedName);
end;

function TRttiContext.GetType(AClass: TClass): TRttiType;
begin
  EnsurePoolToken(@FContextToken);
  Result := Pool.GetType(AClass);
end;

function TRttiContext.GetTypes: TArray<TRttiType>;
begin
  EnsurePoolToken(@FContextToken);
  Result := Pool.GetTypes;
end;

class procedure TRttiContext.KeepContext;
begin
  EnsurePoolToken(@FGlobalContextToken);
  AtomicIncrement(FGlobalContextCounter);
end;

function TRttiContext.GetPackages: TArray<TRttiPackage>;
begin
  EnsurePoolToken(@FContextToken);
  Result := Pool.GetPackages;
end;

{ TRttiPackage }

destructor TRttiPackage.Destroy;
begin
  FLock.Free;
  FreeAndNil(FHandleToObject);
  inherited;
end;

function TRttiPackage.GetHandle: HINST;
begin
  Result := HINST(inherited Handle);
end;

function TRttiPackage.GetNameFromType(AType: TRttiType): string;
begin
  Result := '';
end;

function TRttiPackage.ReadObject(ARttiClass: TRttiClass; AParent: TRttiObject;
  var P: PByte): TRttiObject;
var
  start: PByte;
begin
  TMonitor.Enter(FLock);
  try
    if FHandleToObject.TryGetValue(P, Result) then
    begin
      Inc(P, Result.RttiDataSize);
      Exit;
    end;
    if ARttiClass = TRttiType then
      ARttiClass := GetRttiClass(PTypeInfo(P));
    start := P;
    Result := ARttiClass.Create(Self, AParent, P);
    Result.FRttiDataSize := P - start;
  finally
    TMonitor.Exit(FLock);
  end;
end;

function TRttiPackage.ReadObjectPointer(ARttiClass: TRttiClass; AParent: TRttiObject; P: Pointer): TRttiObject;
var
  pb: PByte;
begin
  pb := P;
  Result := ReadObject(ARttiClass, AParent, pb);
end;

{ TRttiObject }

constructor TRttiObject.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  FParent := AParent;
  FHandle := P;
  FPackage := APackage;
  if APackage <> nil then // if we are a package, it will be nil
    APackage.FHandleToObject.Add(P, Self); // we are created under package lock
end;

destructor TRttiObject.Destroy;
begin
  if (FPackage <> nil) and (FPackage.FHandleToObject <> nil) then
  begin
    TMonitor.Enter(Package.FLock);
    try
      FPackage.FHandleToObject.ExtractPair(FHandle);
    finally
      TMonitor.Exit(Package.FLock);
    end;
  end;
  inherited;
end;

function TRttiObject.GetAttributes: TArray<TCustomAttribute>;
begin
  if not Assigned(FAttributeGetter) then
    Exit(nil);
  Result := FAttributeGetter;
end;

{ TRttiType }

constructor TRttiType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  if TypeKind = tkVariant then
  begin
    P := @TypeData^.AttrData;
    FAttributeGetter := LazyLoadAttributes(P);
  end;
end;

function TRttiType.GetAsInstance: TRttiInstanceType;
begin
  Result := Self as TRttiInstanceType;
end;

function TRttiType.GetAsOrdinal: TRttiOrdinalType;
begin
  Result := Self as TRttiOrdinalType;
end;

function TRttiType.GetAsRecord: TRttiRecordType;
begin
  Result := Self as TRttiRecordType;
end;

function TRttiType.GetAsSet: TRttiSetType;
begin
  Result := Self as TRttiSetType;
end;

function TRttiType.GetField(const AName: string): TRttiField;
var
  Field: TRttiField;
begin
  for Field in GetFields do
    if SameText(Field.Name, AName) then
      Exit(Field);

  Result := nil;
end;

function TRttiType.GetFields: TArray<TRttiField>;
var
  flat: TArray<TArray<TRttiField>>;
  t: TRttiType;
  depth: Integer;
begin
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    Inc(depth);
    t := t.BaseType;
  end;

  SetLength(flat, depth);
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    flat[depth] := t.GetDeclaredFields;
    Inc(depth);
    t := t.BaseType;
  end;

  Result := TArrayHelper.Concat<TRttiField>(flat);
end;

function TRttiType.GetHandle: PTypeInfo;
begin
  Result := PTypeInfo(inherited Handle);
end;

function TRttiType.GetIndexedProperties: TArray<TRttiIndexedProperty>;
var
  flat: TArray<TArray<TRttiIndexedProperty>>;
  t: TRttiType;
  depth: Integer;
begin
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    Inc(depth);
    t := t.BaseType;
  end;

  SetLength(flat, depth);
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    flat[depth] := t.GetDeclaredIndexedProperties;
    Inc(depth);
    t := t.BaseType;
  end;

  Result := TArrayHelper.Concat<TRttiIndexedProperty>(flat);
end;

function TRttiType.GetIndexedProperty(
  const AName: string): TRttiIndexedProperty;
var
  Prop: TRttiIndexedProperty;
begin
  for Prop in GetIndexedProperties do
    if SameText(Prop.Name, AName) then
      Exit(Prop);

  Result := nil;
end;

function TRttiType.GetIsInstance: Boolean;
begin
  Result := Self is TRttiInstanceType;
end;

function TRttiType.GetIsManaged: Boolean;
begin
  Result := System.Rtti.IsManaged(Handle);
end;

function TRttiType.GetIsOrdinal: Boolean;
begin
  Result := Self is TRttiOrdinalType;
end;

function TRttiType.GetIsRecord: Boolean;
begin
  Result := Self is TRttiRecordType;
end;

function TRttiType.GetIsSet: Boolean;
begin
  Result := Self is TRttiSetType;
end;

function TRttiType.GetIsHFA: Boolean;
begin
  Result := False;
end;

function TRttiType.GetHFAElementType: TRttiFloatType;
begin
  Result := nil;
end;

function TRttiType.GetHFAElementCount: Integer;
begin
  Result := 0;
end;

function TRttiType.GetMethod(const AName: string): TRttiMethod;
var
  Method: TRttiMethod;
begin
  for Method in GetMethods do
    if SameText(Method.Name, AName) then
      Exit(Method);

  Result := nil;
end;

function TRttiType.GetMethods(const AName: string): TArray<TRttiMethod>;
var
  ms: TArray<TRttiMethod>;
  m: TRttiMethod;
  len: Integer;
begin
  ms := GetMethods;
  len := 0;
  for m in ms do
    if SameText(m.Name, AName) then
      Inc(len);
  if len = 0 then
    Exit(nil);
  SetLength(Result, len);
  len := 0;
  for m in ms do
    if SameText(m.Name, AName) then
    begin
      Result[len] := m;
      Inc(len);
    end;
end;

function TRttiType.GetMethods: TArray<TRttiMethod>;
var
  flat: TArray<TArray<TRttiMethod>>;
  t: TRttiType;
  depth: Integer;
begin
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    Inc(depth);
    t := t.BaseType;
  end;

  SetLength(flat, depth);
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    flat[depth] := t.GetDeclaredMethods;
    Inc(depth);
    t := t.BaseType;
  end;

  Result := TArrayHelper.Concat<TRttiMethod>(flat);
end;

function TRttiType.GetName: string;
begin
  Result := Handle.NameFld.ToString;
end;

function TRttiType.GetProperties: TArray<TRttiProperty>;
var
  flat: TArray<TArray<TRttiProperty>>;
  t: TRttiType;
  depth: Integer;
begin
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    Inc(depth);
    t := t.BaseType;
  end;

  SetLength(flat, depth);
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    flat[depth] := t.GetDeclaredProperties;
    Inc(depth);
    t := t.BaseType;
  end;

  Result := TArrayHelper.Concat<TRttiProperty>(flat);
end;

function TRttiType.GetProperty(const AName: string): TRttiProperty;
var
  Prop: TRttiProperty;
begin
  for Prop in GetProperties do
    if SameText(Prop.Name, AName) then
      Exit(Prop);

  Result := nil;
end;

function TRttiType.GetDeclaredMethods: TArray<TRttiMethod>;
begin
  Exit(nil);
end;

function TRttiType.GetDeclaredProperties: TArray<TRttiProperty>;
begin
  Exit(nil);
end;

function TRttiType.GetDeclaredFields: TArray<TRttiField>;
begin
  Exit(nil);
end;

function TRttiType.GetDeclaredIndexedProperties: TArray<TRttiIndexedProperty>;
begin
  Exit(nil);
end;

function TRttiType.GetTypeData: PTypeData;
begin
  Result := System.TypInfo.GetTypeData(Handle);
end;

function TRttiType.GetTypeKind: TTypeKind;
begin
  Result := PTypeInfo(Handle)^.Kind;
end;

function TRttiType.GetTypeSize: Integer;
begin
  Result := SizeOf(Pointer);
end;

function TRttiType.ToString: string;
begin
  Result := Name;
end;

function TRttiType.GetQualifiedName: string;
begin
  Result := Package.GetNameFromType(Self);
  if Result = '' then
    raise ENonPublicType.CreateResFmt(@SNonPublicType, [Name]);
end;

function TRttiType.GetBaseType: TRttiType;
begin
  Result := nil;
end;

function TRttiType.GetIsPublicType: Boolean;
begin
  Result := Package.GetNameFromType(Self) <> '';
end;

{ TRttiInstanceMethodClassic }

type
  TRttiInstanceMethodClassic = class(TRttiMethod)
  private
    FTail: PVmtMethodEntryTail;
    FReturnType: PTypeInfo;
    FParams: TArray<TRttiParameter>;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;

    procedure CheckExtended;

    function GetMethodKind: TMethodKind; override;
    function GetCallingConvention: TCallConv; override;
    function GetReturnType: TRttiType; override;
    function GetHasExtendedInfo: Boolean; override;

    function GetName: string; override;
    function GetHandle: PVmtMethodEntry;
    function GetTailHandle: PVmtMethodEntryTail;
    function GetCodeAddress: Pointer; override;
    function DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue; override;
  public
    property Handle: PVmtMethodEntry read GetHandle;
    function GetParameters: TArray<TRttiParameter>; override;
    property TailHandle: PVmtMethodEntryTail read GetTailHandle;
  end;

  TRttiInstMethParameter = class(TRttiParameter)
  private
    FName: string;
    FFlags: TParamFlags;
    FParamType: PTypeInfo;
    FLocation: Word;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetName: string; override;
    function GetFlags: TParamFlags; override;
    function GetParamType: TRttiType; override;
  public
    property Location: Word read FLocation;
  end;

type
  TSpecialMethod = (
    smConstructor,
    smDestructor,
    smOperatorOverload);

const
  mfClassMethod = 1 shl 0;
  mfHasSelf = 1 shl 1;

  // Special methods reinterpret first two bits as TSpecialMethod.
  mfSpecial = 1 shl 2;
  mfSpecialShift = 0;
  mfSpecialBits = 2;

  // 2 bits for first 4 values of TDispatchKind
  mfDispatchKindShift = 3;
  mfDispatchKindBits = 2;

  // 2 bits for visibility
  mfVisibilityShift = 5;
  mfVisibilityBits = 2;

  mfAbstract = 1 shl 7;

{ TRttiInstanceMethodClassic }

constructor TRttiInstanceMethodClassic.Create(APackage: TRttiPackage; AParent: TRttiObject;
  var P: PByte);
var
  methEnd: PByte;
  i: Integer;
  LParent: TRttiObject;
begin
  LParent := AParent;
  if LParent is TRttiMethod then
    LParent := LParent.Parent;
  inherited Create(APackage, LParent, P);
  methEnd := p + Handle^.Len;
  p := PByte( Handle.Tail );
  if methEnd = p then
    Exit;
  Assert(methEnd > p);
  FTail := Pointer(p);

  Assert(FTail^.Version = 3);

  // Avoid lock priority problem by lazy-loading type
  Self.FReturnType := DerefPointer(FTail^.ResultType);
  SetLength(FParams, FTail^.ParamCount); // chopping of 'Self'

  LParent := Self;
  if AParent is TRttiMethod then
    LParent := AParent;
  p := PByte(@FTail^.ParamCount) + 1;
  for i := 0 to High(FParams) do // may include Self if not static
    FParams[i] := APackage.ReadObject(TRttiInstMethParameter, LParent, p) as TRttiInstMethParameter;
  // chop off result parameter - we infer it
  if (Length(FParams) > 0) and (pfResult in FParams[Length(FParams) - 1].Flags) then
    SetLength(FParams, Length(FParams) - 1);

  FAttributeGetter := LazyLoadAttributes(p);
end;

function TRttiInstanceMethodClassic.GetParameters: TArray<TRttiParameter>;
begin
  // Assume 'Self' is included
  // However, we might not have full info.
  Result := Copy(FParams, 1, Length(FParams) - 1);
end;

function TRttiInstanceMethodClassic.DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue;
var
  code: Pointer;
  argCount: Integer;
  argList: TArray<TValue>;
  parList: TArray<TRttiParameter>;
  i, currArg: Integer;
  cls: TClass;
begin
  parList := GetParameters;

  argCount := Length(Args);

  if argCount <> Length(parList) then
    raise EInvocationError.CreateRes(@SParameterCountMismatch);

  if IsConstructor then
    Inc(argCount);
  if not IsStatic then
    Inc(argCount);

  SetLength(argList, argCount);
  currArg := 0;
  cls := nil;

  // Classic = $METHODINFO ON. Static methods, constructors, destructors and
  // class methods shouldn't show up here.
  if not IsStatic then
  begin
    if IsClassMethod then
    begin
      cls := Instance.AsClass;
      PushSelfFirst(CallingConvention, argList, currArg, cls);
    end
    else
    begin
      cls := Instance.AsObject.ClassType;
      PushSelfFirst(CallingConvention, argList, currArg, Instance.AsObject);
    end;
  end;

  for i := 0 to Length(Args) - 1 do
  begin
    PassArg(parList[i], Args[i], argList[currArg], CallingConvention);
    Inc(currArg);
  end;

  if not IsStatic then
  begin
    if IsClassMethod then
      PushSelfLast(CallingConvention, argList, currArg, cls)
    else
      PushSelfLast(CallingConvention, argList, currArg, Instance.AsObject);
  end;

  case DispatchKind of
    dkVtable: code := PVtable(cls)^[VirtualIndex];
  else
    code := CodeAddress;
  end;

  CheckCodeAddress(code);

  if ReturnType <> nil then
    Result := System.Rtti.Invoke(code, argList, CallingConvention, ReturnType.Handle, IsStatic)
  else if IsConstructor then
    Result := System.Rtti.Invoke(code, argList, CallingConvention, parList[0].ParamType.Handle, IsStatic, True)
  else
    Result := System.Rtti.Invoke(code, argList, CallingConvention, nil); // Invoke returns TValue.Empty
end;

procedure TRttiInstanceMethodClassic.CheckExtended;
begin
  if not HasExtendedInfo then
    raise InsufficientRtti;
end;

function TRttiInstanceMethodClassic.GetMethodKind: TMethodKind;
begin
  if not HasExtendedInfo then
    Exit(mkProcedure);
  // {$METHODINFO ON} doesn't produce enough information to distinguish
  // effectively between class methods and instance methods.
  // Assume instance method for now.
  if ReturnType = nil then
    Result := mkProcedure
  else
    Result := mkFunction;
end;

function TRttiInstanceMethodClassic.GetCallingConvention: TCallConv;
begin
  Result := TailHandle^.CC;
end;

function TRttiInstanceMethodClassic.GetReturnType: TRttiType;
begin
  CheckExtended;
  Result := Pool.GetType(FReturnType);
end;

function TRttiInstanceMethodClassic.GetHasExtendedInfo: Boolean;
begin
  Result := FTail <> nil;
end;

function TRttiInstanceMethodClassic.GetName: string;
begin
  Result := Handle.NameFld.ToString;
end;

function TRttiInstanceMethodClassic.GetHandle: PVmtMethodEntry;
begin
  Result := inherited Handle;
end;

function TRttiInstanceMethodClassic.GetTailHandle: PVmtMethodEntryTail;
begin
  CheckExtended;
  Result := FTail;
end;

function TRttiInstanceMethodClassic.GetCodeAddress: Pointer;
begin
  Result := Handle^.CodeAddress;
  if (Result <> nil) and (PPointer(Result)^ = nil) then
    Exit(nil);
end;

{ TRttiInstanceMethodEx }

type
  TRttiInstanceMethodEx = class(TRttiMethod)
  private
    FInstanceMethod: TRttiInstanceMethodClassic;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;

    function GetVisibility: TMemberVisibility; override;
    function GetMethodKind: TMethodKind; override;
    function GetCallingConvention: TCallConv; override;
    function GetReturnType: TRttiType; override;
    function GetHasExtendedInfo: Boolean; override;
    function GetVirtualIndex: Smallint; override;
    function GetDispatchKind: TDispatchKind; override;
    function GetIsClassMethod: Boolean; override;
    function GetIsStatic: Boolean; override;
    function GetCodeAddress: Pointer; override;

    function GetName: string; override;
    function GetHandle: PVmtMethodExEntry;
    function DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue; override;
  public
    property Handle: PVmtMethodExEntry read GetHandle;

    function GetParameters: TArray<TRttiParameter>; override;
    function GetAttributes: TArray<TCustomAttribute>; override;
  end;

{ TRttiInstanceMethodEx }

constructor TRttiInstanceMethodEx.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  FInstanceMethod := APackage.ReadObjectPointer(TRttiInstanceMethodClassic,
    Self, Handle^.Entry) as TRttiInstanceMethodClassic;
  Inc(P, SizeOf(Handle^));
end;

function TRttiInstanceMethodEx.GetVisibility: TMemberVisibility;
begin
  Result := TMemberVisibility(GetBitField(Handle^.Flags, mfVisibilityShift, mfVisibilityBits));
end;

function TRttiInstanceMethodEx.GetMethodKind: TMethodKind;
begin
  if (Handle^.Flags and mfSpecial) <> 0 then
  begin
    case TSpecialMethod(GetBitField(Handle^.Flags, mfSpecialShift, mfSpecialBits)) of
      smConstructor: Result := mkConstructor;
      smDestructor: Result := mkDestructor;
      smOperatorOverload: Result := mkOperatorOverload;
    else
      Result := mkProcedure;
    end;
  end
  else
  begin
    if ((Handle^.Flags and mfHasSelf) = 0) or // static class method
        ((Handle^.Flags and mfClassMethod) <> 0) then
      if FInstanceMethod.ReturnType = nil then
        Result := mkClassProcedure
      else
        Result := mkClassFunction
    else
      if FInstanceMethod.ReturnType = nil then
        Result := mkProcedure
      else
        Result := mkFunction;
  end;
end;

function TRttiInstanceMethodEx.GetCallingConvention: TCallConv;
begin
  Result := FInstanceMethod.CallingConvention;
end;

function TRttiInstanceMethodEx.GetAttributes: TArray<TCustomAttribute>;
begin
  Result := FInstanceMethod.GetAttributes;
end;

function TRttiInstanceMethodEx.GetReturnType: TRttiType;
begin
  Result := FInstanceMethod.GetReturnType;
end;

function TRttiInstanceMethodEx.GetHasExtendedInfo: Boolean;
begin
  Result := FInstanceMethod.GetHasExtendedInfo;
end;

function TRttiInstanceMethodEx.GetVirtualIndex: Smallint;
begin
  Result := Handle^.VirtualIndex;
end;

function TRttiInstanceMethodEx.GetDispatchKind: TDispatchKind;
begin
  Result := TDispatchKind(GetBitField(
    Handle^.Flags, mfDispatchKindShift, mfDispatchKindBits));
end;

function TRttiInstanceMethodEx.GetIsClassMethod: Boolean;
begin
  Result := IsStatic or ((Handle^.Flags and (mfSpecial or mfClassMethod)) = mfClassMethod);
end;

function TRttiInstanceMethodEx.GetIsStatic: Boolean;
begin
  if (Handle^.Flags and mfSpecial) <> 0 then
    Result := TSpecialMethod(GetBitField(Handle^.Flags, mfSpecialShift, mfSpecialBits)) = smOperatorOverload
  else
    Result := (Handle^.Flags and mfHasSelf) = 0;
end;

function TRttiInstanceMethodEx.GetCodeAddress: Pointer;
begin
  Result := FInstanceMethod.CodeAddress;
end;

function TRttiInstanceMethodEx.GetName: string;
begin
  Result := FInstanceMethod.Name;
end;

function TRttiInstanceMethodEx.GetHandle: PVmtMethodExEntry;
begin
  Result := inherited Handle;
end;

function TRttiInstanceMethodEx.DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue;
var
  code: Pointer;
  argCount: Integer;
  argList: TArray<TValue>;
  parList: TArray<TRttiParameter>;
  i, currArg: Integer;
  cls: TClass;
  obj: TObject;
  alloc: Boolean;
begin
  parList := GetParameters;
  if Length(Args) <> Length(parList) then
    raise EInvocationError.CreateRes(@SParameterCountMismatch);

  argCount := Length(Args);
  if IsConstructor or IsDestructor then
    Inc(argCount);
  if not IsStatic then
    Inc(argCount);

  SetLength(argList, argCount);
  currArg := 0;
  cls := nil;

  alloc := True; // avoid warning
  obj := nil; // avoid warning

  if not IsStatic then
  begin
    // Two jobs: handle special methods like ctor/dtor, and
    // extract metaclass so that vtable lookups can occur.
    if IsConstructor then
    begin
      alloc := Instance.TryAsType<TClass>(cls); // flag: should allocate
      if alloc then
        obj := nil // not used
      else
      begin
        obj := Instance.AsObject;
        if obj <> nil then
          cls := obj.ClassType
        else
          cls := nil;
      end;
      if alloc then
        PushSelfFirst(CallingConvention, argList, currArg, cls)
      else
        PushSelfFirst(CallingConvention, argList, currArg, obj);
      argList[currArg] := alloc;
      Inc(currArg);
    end
    else if IsDestructor then
    begin
      cls := Instance.AsObject.ClassType;
      PushSelfFirst(CallingConvention, argList, currArg, Instance);
      argList[currArg] := True;
      Inc(currArg);
    end
    else if IsClassMethod then
    begin
      cls := Instance.AsClass;
      PushSelfFirst(CallingConvention, argList, currArg, Instance);
    end
    else
    begin
      cls := Instance.AsObject.ClassType;
      PushSelfFirst(CallingConvention, argList, currArg, Instance);
    end;

    // We are actually more strict than Delphi compiler/RTL here:
    if (cls <> nil) and not cls.InheritsFrom(TRttiInstanceType(Parent).MetaclassType) then
      raise EInvalidCast.CreateRes(@SInvalidCast);
  end;

  for i := 0 to Length(Args) - 1 do
  begin
    PassArg(parList[i], Args[i], argList[currArg], CallingConvention);
    Inc(currArg);
  end;

  if IsStatic then
    code := CodeAddress
  else
    case DispatchKind of
      dkVtable: code := PVtable(cls)^[VirtualIndex];
      dkDynamic: code := GetDynaMethod(cls, VirtualIndex);
    else
      code := CodeAddress;
    end;

  CheckCodeAddress(code);

  if not IsStatic then
  begin
    if IsConstructor then
    begin
      if alloc then
        PushSelfLast(CallingConvention, argList, currArg, cls)
      else
        PushSelfLast(CallingConvention, argList, currArg, obj);
    end
    else
      PushSelfLast(CallingConvention, argList, currArg, Instance);
  end;

  if ReturnType <> nil then
    Result := System.Rtti.Invoke(code, argList, CallingConvention, ReturnType.Handle, IsStatic)
  else if IsConstructor then
    Result := System.Rtti.Invoke(code, argList, CallingConvention, cls.ClassInfo, IsStatic, True)
  else
    Result := System.Rtti.Invoke(code, argList, CallingConvention, nil);
end;

function TRttiInstanceMethodEx.GetParameters: TArray<TRttiParameter>;
begin
  if IsStatic then
  begin
    Result := Copy(FInstanceMethod.FParams);
  end
  else
    Result := FInstanceMethod.GetParameters;
end;

type
  TRttiInstancePropertyClassic = class(TRttiInstanceProperty)
  private
    function GetPropInfo: PPropInfo; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetHandle: PPropInfo;
  public
    property Handle: PPropInfo read GetHandle;
  end;

  TRttiInstancePropertyEx = class(TRttiInstanceProperty)
  private
    function GetPropInfo: PPropInfo; override;
    function GetHandle: PPropInfoEx;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetVisibility: TMemberVisibility; override;
  public
    property Handle: PPropInfoEx read GetHandle;
  end;

  TRttiInstanceFieldClassic = class(TRttiField)
  private
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetName: string; override;
    function GetHandle: PVmtFieldEntry;
    function GetFieldType: TRttiType; override;
    function GetOffset: Integer; override;
    function GetParent: TRttiInstanceType;
  public
    property Handle: PVmtFieldEntry read GetHandle;
    property Parent: TRttiInstanceType read GetParent;
  end;

  TRttiInstanceFieldEx = class(TRttiField)
  private
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetName: string; override;
    function GetHandle: PFieldExEntry;
    function GetFieldType: TRttiType; override;
    function GetOffset: Integer; override;
    function GetVisibility: TMemberVisibility; override;
  public
    property Handle: PFieldExEntry read GetHandle;
  end;

{ TRttiInstanceType }

constructor TRttiInstanceType.Create(APackage: TRttiPackage; AParent: TRttiObject;
  var P: PByte);
var
  ft: PVmtFieldTable;
begin
  inherited;

  // ClassTab needed for loading classic published fields.
  ft := PPointer(PByte(MetaclassType) + vmtFieldTable)^;
  if ft <> nil then
    FClassTab := ft^.ClassTab;
end;

function TRttiInstanceType.GetAttributes: TArray<TCustomAttribute>;
begin
  if not FReadPropData then
    ReadPropData;
  Result := inherited GetAttributes;
end;

function TRttiInstanceType.GetBaseType: TRttiType;
begin
  Result := GetBaseTyped;
end;

function TRttiInstanceType.GetBaseTyped: TRttiInstanceType;
begin
  Result := Pool.TypeOrNil(TypeData^.ParentInfo) as TRttiInstanceType;
end;

function TRttiInstanceType.GetMetaclassType: TClass;
begin
  Result := TypeData^.ClassType;
end;

procedure TRttiInstanceType.ReadPropData;
var
  p: PByte;

  function ReadClassicProps: TArray<TRttiProperty>;
  var
    i: Integer;
  begin
    if p = nil then
      Exit(nil);
    SetLength(Result, ReadU16(p));
    for i := 0 to Length(Result) - 1 do
      Result[i] := Package.ReadObject(TRttiInstancePropertyClassic, Self, p) as TRttiProperty;
  end;

  function ReadExtendedProps: TArray<TRttiProperty>;
  var
    i: Integer;
  begin
    if p = nil then
      Exit(nil);
    SetLength(Result, ReadU16(p));
    for i := 0 to Length(Result) - 1 do
      Result[i] := Package.ReadObject(TRttiInstancePropertyEx, Self, p) as TRttiProperty;
  end;

  function SubtractClassic(const AClassic, AExtended: TArray<TRttiProperty>): TArray<TRttiProperty>;
  var
    list: TList<TRttiProperty>;

    function ContainsExtended(PropInfo: PPropInfo): Boolean;
    var
      i: Integer;
      p: TRttiProperty;
    begin
      for i := 0 to list.Count - 1 do
      begin
        p := list[i];
        if p is TRttiInstancePropertyEx then
          if TRttiInstanceProperty(p).PropInfo = PropInfo then
            Exit(True);
      end;
      Result := False;
    end;

  var
    i: Integer;
  begin
    list := TList<TRttiProperty>.Create;
    try
      list.AddRange(AExtended);
      for i := 0 to Length(AClassic) - 1 do
        if not ContainsExtended(TRttiInstanceProperty(AClassic[i]).PropInfo) then
          list.Add(AClassic[i]);

      Result := TListHelper.ToArray<TRttiProperty>(list);
    finally
      list.Free;
    end;
  end;

  function ReadIndexedProps: TArray<TRttiIndexedProperty>;
  var
    i: Integer;
  begin
    SetLength(Result, ReadU16(P));
    for i := 0 to High(Result) do
      Result[i] := Package.ReadObject(TRttiIndexedProperty, Self, p) as TRttiIndexedProperty;
  end;

var
  classic, ext: TArray<TRttiProperty>;
begin
  if FReadPropData then
    Exit;

  p := PByte(TypeData.PropData);

  TMonitor.Enter(Package.FLock);
  try
    classic := ReadClassicProps;
    ext := ReadExtendedProps;

    FProps := SubtractClassic(classic, ext);

    FAttributeGetter := LazyLoadAttributes(p);
    FIndexedProps := ReadIndexedProps;
    FReadPropData := True;
  finally
    TMonitor.Exit(Package.FLock);
  end;
end;

function TRttiInstanceType.GetDeclaredProperties: TArray<TRttiProperty>;
begin
  if not FReadPropData then
    ReadPropData;
  Result := Copy(FProps);
end;

function TRttiInstanceType.GetDeclaredMethods: TArray<TRttiMethod>;
begin
  if not FReadMethData then
    ReadMethData;
  Result := Copy(FMeths);
end;

procedure TRttiInstanceType.ReadMethData;
var
  p: PByte;

  function ReadClassicMeths: TArray<TRttiMethod>;
  var
    i: Integer;
    methLen: Integer;
    next: PByte;
  begin
    if p = nil then
      Exit(nil);
    SetLength(Result, ReadU16(p));
    for i := 0 to Length(Result) - 1 do
    begin
      methLen := PeekU16(p);
      next := p + methLen;
      Result[i] := Package.ReadObject(TRttiInstanceMethodClassic, Self, p) as TRttiInstanceMethodClassic;
      p := next;
    end;
  end;

  function ReadExtendedMeths: TArray<TRttiMethod>;
  var
    i: Integer;
  begin
    if p = nil then
      Exit(nil);
    SetLength(Result, ReadU16(p)); // TVmtMethodTable.ExCount
    for i := 0 to Length(Result) - 1 do
      Result[i] := Package.ReadObject(TRttiInstanceMethodEx, Self, p) as TRttiInstanceMethodEx;
  end;

  function SubtractClassic(const AClassic, AExtended: TArray<TRttiMethod>): TArray<TRttiMethod>;
  var
    list: TList<TRttiMethod>;

    function ContainsExtended(CodeAddress: Pointer): Boolean;
    var
      i: Integer;
      m: TRttiMethod;
    begin
      for i := 0 to list.Count - 1 do
      begin
        m := list[i];
        if m is TRttiInstanceMethodEx then
          if TRttiInstanceMethodEx(m).FInstanceMethod.CodeAddress = CodeAddress then
            Exit(True);
      end;
      Result := False;
    end;

  var
    i: Integer;
  begin
    list := TList<TRttiMethod>.Create;
    try
      list.AddRange(AExtended);
      for i := 0 to Length(AClassic) - 1 do
        if not ContainsExtended(TRttiInstanceMethodClassic(AClassic[i]).CodeAddress) then
          list.Add(AClassic[i]);

      Result := TListHelper.ToArray<TRttiMethod>(list);
    finally
      list.Free;
    end;
  end;

var
  classic, ext: TArray<TRttiMethod>;
begin
  if FReadMethData then
    Exit;

  TMonitor.Enter(Package.FLock);
  try
    p := PPointer(PByte(MetaclassType) + vmtMethodTable)^;

    if p = nil then
      Exit;

    classic := ReadClassicMeths;
    ext := ReadExtendedMeths;
    FVirtCount := ReadU16(p);

    FMeths := SubtractClassic(classic, ext);
    FReadMethData := True;
  finally
    TMonitor.Exit(Package.FLock);
  end;
end;

function TRttiInstanceType.GetDeclaredImplementedInterfaces: TArray<TRttiInterfaceType>;
var
  pi: PInterfaceTable;
  p: PByte;
  i: Integer;
begin
  pi := MetaclassType.GetInterfaceTable;

  if pi = nil then
    Exit(nil);

  p := @pi^.Entries[pi^.EntryCount];
  SetLength(Result, pi^.EntryCount);

  for i := 0 to pi.EntryCount - 1 do
    Result[i] := Pool.GetType(DerefPointer(ReadPointer(p))) as TRttiInterfaceType;
end;

function TRttiInstanceType.GetImplementedInterfaces: TArray<TRttiInterfaceType>;
var
  flat: TArray<TArray<TRttiInterfaceType>>;
  t: TRttiInstanceType;
  depth: Integer;
begin
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    Inc(depth);
    t := t.BaseType;
  end;

  SetLength(flat, depth);
  t := Self;
  depth := 0;
  while t <> nil do
  begin
    flat[depth] := t.GetDeclaredImplementedInterfaces;
    Inc(depth);
    t := t.BaseType;
  end;

  Result := TArrayHelper.Concat<TRttiInterfaceType>(flat);
end;

function TRttiInstanceType.GetDeclaredFields: TArray<TRttiField>;
var
  p: PByte;

  function ReadClassicFields: TArray<TRttiField>;
  var
    ft: PVmtFieldTable;
    i: Integer;
  begin
    ft := Pointer(p);
    SetLength(Result, ft^.Count);
    Inc(p, SizeOf(ft^));
    for i := 0 to Length(Result) - 1 do
      Result[i] := Package.ReadObject(TRttiInstanceFieldClassic, Self, p) as TRttiField;
  end;

  function ReadExtendedFields: TArray<TRttiField>;
  var
    i: Integer;
  begin
    SetLength(Result, ReadU16(p));
    for i := 0 to Length(Result) - 1 do
      Result[i] := Package.ReadObject(TRttiInstanceFieldEx, Self, p) as TRttiField;
    end;

  function SubtractClassic(const AClassic, AExtended: TArray<TRttiField>): TArray<TRttiField>;
  var
    list: TList<TRttiField>;

    function ContainsExtended(Offset: Integer): Boolean;
    var
      i: Integer;
      m: TRttiField;
    begin
      for i := 0 to list.Count - 1 do
      begin
        m := list[i];
        if (m is TRttiInstanceFieldEx) and (m.Offset = Offset) then
            Exit(True);
      end;
      Result := False;
    end;

  var
    i: Integer;
  begin
    list := TList<TRttiField>.Create;
    try
      list.AddRange(AExtended);
      for i := 0 to Length(AClassic) - 1 do
        if not ContainsExtended(AClassic[i].Offset) then
          list.Add(AClassic[i]);

      Result := TListHelper.ToArray<TRttiField>(list);
    finally
      list.Free;
    end;
  end;

var
  classic, ext: TArray<TRttiField>;
begin
  p := PPointer(PByte(MetaclassType) + vmtFieldTable)^;

  if p = nil then
    Exit(nil);

  classic := ReadClassicFields;
  ext := ReadExtendedFields;

  Result := SubtractClassic(classic, ext);
end;

function TRttiInstanceType.GetDeclaredIndexedProperties: TArray<TRttiIndexedProperty>;
begin
  if not FReadPropData then
    ReadPropData;
  Result := FIndexedProps;
end;

function TRttiInstanceType.GetDeclaringUnitName: string;
begin
  Result := TypeData.UnitNameFld.ToString;
end;

function TRttiInstanceType.GetVmtSize: Integer;
begin
  if not FReadMethData then
    ReadMethData;
  Result := FVirtCount * SizeOf(Pointer) - vmtSelfPtr;
end;

{ TRttiProperty }

function TRttiProperty.GetValue(Instance: Pointer): TValue;
begin
  if not IsReadable then
    raise EPropWriteOnly.Create(Name);
  Result := DoGetValue(Instance);
end;

procedure TRttiProperty.SetValue(Instance: Pointer; const AValue: TValue);
begin
  if not IsWritable then
    raise EPropReadOnly.Create(Name);
  DoSetValue(Instance, AValue);
end;

{ TRttiInstanceProperty }

const
  pfVisibilityShift = 0;
  pfVisibilityBits = 2;

function TRttiInstanceProperty.GetDefault: Integer;
begin
  Result := GetPropInfo^.Default;
end;

function TRttiInstanceProperty.GetIndex: Integer;
begin
  Result := GetPropInfo^.Index;
end;

function TRttiInstanceProperty.GetName: string;
begin
  Result := GetPropInfo.NameFld.ToString;
end;

function TRttiInstanceProperty.GetNameIndex: Smallint;
begin
  Result := GetPropInfo^.NameIndex;
end;

function TRttiInstanceProperty.GetPropertyType: TRttiType;
begin
  Result := Pool.TypeOrNil(GetPropInfo^.PropType);
end;

function TRttiInstanceProperty.GetIsReadable: Boolean;
begin
  Result := PropInfo^.GetProc <> nil;
end;

function TRttiInstanceProperty.GetIsWritable: Boolean;
begin
  Result := PropInfo^.SetProc <> nil;
end;

function TRttiInstanceProperty.DoGetValue(Instance: Pointer): TValue;
var
  getter: Pointer;
  code: Pointer;
  args: TArray<TValue>;
begin
  getter := PropInfo^.GetProc;
  if (IntPtr(getter) and PROPSLOT_MASK) = PROPSLOT_FIELD then
  begin
    // Field
    TValue.Make(PByte(Instance) + (IntPtr(getter) and (not PROPSLOT_MASK)),
      PropertyType.Handle, Result);
    Exit;
  end;

  if (IntPtr(getter) and PROPSLOT_MASK) = PROPSLOT_VIRTUAL then
  begin
    // Virtual dispatch, but with offset, not slot
    code := PPointer(PIntPtr(Instance)^ + SmallInt(IntPtr(getter)))^;
  end
  else
  begin
    // Static dispatch
    code := getter;
  end;

  CheckCodeAddress(code);

  if Index = Integer($80000000) then
  begin
    // no index
    SetLength(args, 1);
    args[0] := TObject(Instance);
    Result := Invoke(code, args, ccReg, PropertyType.Handle, False); // not static
  end
  else
  begin
    SetLength(args, 2);
    args[0] := TObject(Instance);
    args[1] := Index;
    Result := Invoke(code, args, ccReg, PropertyType.Handle, False); // not static
  end;
end;

procedure TRttiInstanceProperty.DoSetValue(Instance: Pointer; const AValue: TValue);
var
  setter: Pointer;
  code: Pointer;
  args: TArray<TValue>;
begin
  setter := PropInfo^.SetProc;
  if (IntPtr(setter) and PROPSLOT_MASK) = PROPSLOT_FIELD then
  begin
    // Field
    AValue.Cast(PropertyType.Handle).ExtractRawData(
      PByte(Instance) + (IntPtr(setter) and (not PROPSLOT_MASK)));
    Exit;
  end;

  if (IntPtr(setter) and PROPSLOT_MASK) = PROPSLOT_VIRTUAL then
  begin
    // Virtual dispatch, but with offset, not slot
    code := PPointer(PIntPtr(Instance)^ + SmallInt(IntPtr(setter)))^;
  end
  else
  begin
    // Static dispatch
    code := setter;
  end;

  CheckCodeAddress(code);

  if Index = Integer($80000000) then
  begin
    // no index
    SetLength(args, 2);
    args[0] := TObject(Instance);
    args[1] := AValue.Cast(PropertyType.Handle);
    Invoke(code, args, ccReg, nil);
  end
  else
  begin
    SetLength(args, 3);
    args[0] := TObject(Instance);
    args[1] := Index;
    args[2] := AValue.Cast(PropertyType.Handle);
    Invoke(code, args, ccReg, nil);
  end;
end;

function TRttiInstanceProperty.ToString: string;
begin
  Result := 'property ' + Name + ': ' + PropertyType.Name; // do not localize
end;

{ TRttiInstancePropertyClassic }

constructor TRttiInstancePropertyClassic.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte( Handle.Tail );
end;

function TRttiInstancePropertyClassic.GetHandle: PPropInfo;
begin
  Result := inherited Handle;
end;

function TRttiInstancePropertyClassic.GetPropInfo: PPropInfo;
begin
  Result := Handle;
end;

{ TRttiInstancePropertyEx }

constructor TRttiInstancePropertyEx.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := @Handle^.AttrData;
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiInstancePropertyEx.GetPropInfo: PPropInfo;
begin
  Result := Handle^.Info;
end;

function TRttiInstancePropertyEx.GetHandle: PPropInfoEx;
begin
  Result := inherited Handle;
end;

function TRttiInstancePropertyEx.GetVisibility: TMemberVisibility;
begin
  Result := TMemberVisibility(GetBitField(Handle^.Flags, pfVisibilityShift, pfVisibilityBits));
end;

{ TRttiOrdinalType }

constructor TRttiOrdinalType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte(@TypeData^.MaxValue) + SizeOf(TypeData^.MaxValue);
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiOrdinalType.GetMaxValue: Integer;
begin
  Result := TypeData^.MaxValue;
end;

function TRttiOrdinalType.GetMinValue: Integer;
begin
  Result := TypeData^.MinValue;
end;

function TRttiOrdinalType.GetOrdType: TOrdType;
begin
  Result := TypeData^.OrdType;
end;

function TRttiOrdinalType.GetTypeSize: Integer;
const
  Sizes: array[TOrdType] of Integer = (1, 1, 2, 2, 4, 4);
begin
  Result := Sizes[OrdType];
end;

{ TRttiInt64Type }

constructor TRttiInt64Type.Create(APackage: TRttiPackage; AParent: TRttiObject;
  var P: PByte);
begin
  inherited;
  P := @TypeData^.Int64AttrData;
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiInt64Type.GetTypeSize: Integer;
begin
  Result := SizeOf(Int64);
end;

function TRttiInt64Type.GetMaxValue: Int64;
begin
  Result := TypeData^.MaxInt64Value;
end;

function TRttiInt64Type.GetMinValue: Int64;
begin
  Result := TypeData^.MinInt64Value;
end;

{ TRttiClassRefType }

constructor TRttiClassRefType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := @TypeData^.ClassRefAttrData;
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiClassRefType.GetInstanceType: TRttiInstanceType;
begin
  Result := Pool.TypeOrNil(TypeData^.InstanceType) as TRttiInstanceType;
end;

function TRttiClassRefType.GetMetaclassType: TClass;
var
  p: PPTypeInfo;
begin
  p := TypeData^.InstanceType;
  if (p = nil) or (p^ = nil) then
    Exit(nil);
  Result := System.TypInfo.GetTypeData(p^)^.ClassType;
end;

{ TRttiEnumerationType }

function SkipEnumNameList(P: PByte; ACount: Integer): PByte;
begin
  while ACount > 0 do
  begin
    P := _SkipShortString(P);
    Dec(ACount);
  end;
  Result := P;
end;

constructor TRttiEnumerationType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := @TypeData^.NameList;
  // No name list if we are a subrange of another enumeration.
  if (TypeData^.BaseType = nil) or (DerefPointer(TypeData^.BaseType) = Handle) then
    P := SkipEnumNameList(P, MaxValue - MinValue + 1);
  // Unit name
  P := _SkipShortString(P);
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiEnumerationType.GetNames: TArray<string>;
var
  i: Integer;
  p: PByte;
begin
  SetLength(Result, MaxValue - MinValue + 1);
  if (TypeData^.BaseType = nil) or (DerefPointer(TypeData^.BaseType) = Handle) then
    p := @TypeData^.NameList
  else
    p := SkipEnumNameList(@System.TypInfo.GetTypeData(DerefPointer(TypeData^.BaseType))^.NameList, MinValue);
  for i := 0 to Length(Result) - 1 do
    Result[i] := ReadShortString(p);
end;

class function TRttiEnumerationType.GetName<T{: enum}>(AValue: T): string;
var
  v: Integer;
begin
  case PTypeInfo(TypeInfo(T))^.Kind of
    tkEnumeration:
      case System.TypInfo.GetTypeData(TypeInfo(T))^.OrdType of
        otUByte, otSByte: v := PByte(@AValue)^;
        otUWord, otSWord: v := PWord(@AValue)^;
        otULong, otSLong: v := PInteger(@AValue)^;
      end;
  else
    raise EInvalidCast.CreateRes(@SInvalidCast);
  end;
  Result := System.TypInfo.GetEnumName(TypeInfo(T), v);
end;

class function TRttiEnumerationType.GetValue<T{: enum}>(const AName: string): T;
var
  v: Integer;
begin
  case PTypeInfo(TypeInfo(T))^.Kind of
    tkEnumeration:
      case System.TypInfo.GetTypeData(TypeInfo(T))^.OrdType of
        otUByte, otSByte: PByte(@Result)^ := GetEnumValue(TypeInfo(T), AName);
        otUWord, otSWord: PWord(@Result)^ := GetEnumValue(TypeInfo(T), AName);
        otULong, otSLong: PInteger(@Result)^ := GetEnumValue(TypeInfo(T), AName);
      end;
  else
    raise EInvalidCast.CreateRes(@SInvalidCast);
  end;
end;

function TRttiEnumerationType.GetUnderlyingType: TRttiType;
begin
  Result := Pool.TypeOrNil(TypeData^.BaseType);
end;

function TRttiEnumerationType.GetMaxValue: Integer;
begin
  Result := TypeData^.MaxValue;
  if TypeData^.MinValue < 0 then // one of ByteBool/WordBool/LongBool
    Result := 1;
end;

function TRttiEnumerationType.GetMinValue: Integer;
begin
  Result := TypeData^.MinValue;
  if Result < 0 then // C bool
    Result := 0;
end;

{ TProcSig }

type
  TProcSig = class(TRttiObject)
  private
    function GetHandle: PProcedureSignature;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
    function HasInfo: Boolean;
    property Handle: PProcedureSignature read GetHandle;
    function GetParams: TArray<TRttiParameter>;
    function GetReturnType: TRttiType;
    function ToString: string; override;
  end;

  TProcParam = class(TRttiParameter)
  private
    function GetHandle: PProcedureParam;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetFlags: TParamFlags; override;
    function GetParamType: TRttiType; override;
    function GetName: string; override;
  public
    property Handle: PProcedureParam read GetHandle;
  end;

{ TProcSig }

constructor TProcSig.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
var
  i: Integer;
begin
  inherited;
  if not HasInfo then
  begin
    P := @Handle^.Flags;
    Inc(P);
  end
  else
  begin
    P := @Handle^.ParamCount;
    Inc(P);
    for i := 1 to Handle^.ParamCount do
    begin
                                           
      P := PByte(PProcedureParam(P).AttrData);
      Inc(P, PWord(P)^);
    end;
  end;
end;

function TProcSig.HasInfo: Boolean;
begin
  Result := Handle^.Flags <> 255;
end;

function TProcSig.ToString: string;
var
  params: TArray<TRttiParameter>;
  ret: TRttiType;
  i: Integer;
begin
  if not HasInfo then
    Exit('');
  Result := '';
  params := GetParams;
  if Length(params) > 0 then
  begin
    Result := '(';
    for i := 0 to Length(params) - 1 do
    begin
      Result := Result + params[i].ToString;
      if i < Length(params) - 1 then
        Result := Result + '; ';
    end;
    Result := Result + ')';
  end;
  ret := Pool.TypeOrNil(Handle^.ResultType);
  if ret <> nil then
    Result := Result + ': ' + ret.ToString;
end;

function TProcSig.GetHandle: PProcedureSignature;
begin
  Result := PProcedureSignature(inherited Handle);
end;

function TProcSig.GetReturnType: TRttiType;
begin
  if not HasInfo then
    Exit(nil);
  Result := Pool.TypeOrNil(Handle^.ResultType);
end;

function TProcSig.GetParams: TArray<TRttiParameter>;
var
  i: Integer;
  p: PByte;
begin
  if not HasInfo then
    Exit(nil);
  SetLength(Result, Handle^.ParamCount);
  p := @Handle^.ParamCount;
  Inc(p);
  for i := 0 to Handle^.ParamCount - 1 do
    Result[i] := Package.ReadObject(TProcParam, Self, p) as TRttiParameter;
end;

{ TProcParam }

constructor TProcParam.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte(Handle.AttrData);
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TProcParam.GetHandle: PProcedureParam;
begin
  Result := PProcedureParam(inherited Handle);
end;

function TProcParam.GetFlags: TParamFlags;
begin
  Result := TParamFlags(Handle^.Flags);
end;

function TProcParam.GetParamType: TRttiType;
begin
  Result := Pool.TypeOrNil(Handle^.ParamType);
end;

function TProcParam.GetName: string;
begin
  Result := Handle.NameFld.ToString;
end;

{ TRttiManagedField }

type
  PManagedField = ^TManagedField;

constructor TRttiManagedField.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := P + SizeOf(TManagedField);
end;

function TRttiManagedField.GetFieldOffset: Integer;
begin
  Result := PManagedField(FHandle)^.FldOffset;
end;

function TRttiManagedField.GetFieldType: TRttiType;
begin
  Result := Pool.TypeOrNil(PManagedField(FHandle)^.TypeRef);
end;

{ TRttiRecordField }

const
  ffVisibilityShift = 0;
  ffVisibilityBits = 2;

type
  TRttiRecordField = class(TRttiField)
  private
    function GetHandle: PRecordTypeField;
    function GetFieldType: TRttiType; override;
    function GetOffset: Integer; override;
    function GetName: string; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetVisibility: TMemberVisibility; override;
  public
    property Handle: PRecordTypeField read GetHandle;
  end;

{ TRttiRecordField }

constructor TRttiRecordField.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte(Handle.AttrData);
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiRecordField.GetVisibility: TMemberVisibility;
begin
  Result := TMemberVisibility(GetBitField(Handle^.Flags, ffVisibilityShift, ffVisibilityBits));
end;

function TRttiRecordField.GetHandle: PRecordTypeField;
begin
  Result := inherited Handle;
end;

function TRttiRecordField.GetFieldType: TRttiType;
begin
  Result := Pool.TypeOrNil(Handle^.Field.TypeRef);
end;

function TRttiRecordField.GetOffset: Integer;
begin
  Result := Handle^.Field.FldOffset;
end;

function TRttiRecordField.GetName: string;
begin
  Result := Handle.NameFld.ToString;
end;

{ TRttiRecordMethod }

type
  TRecMethodKind = (
    rmkMethod, // has self, but not included in signature
    rmkStaticMethod,
    rmkConstructor,
    rmkOperator);

const
  // TRecMethodFlags
	rmfKindShift = 0;
	rmfKindBits = 2;
	rmfVisibilityShift = 2;
	rmfVisibilityBits = 2;

type
  TRttiRecordMethod = class(TRttiMethod)
  private
    FSig: TProcSig;
    function GetName: string; override;
    function GetMethodKind: TMethodKind; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;

    function GetCallingConvention: TCallConv; override;
    function GetReturnType: TRttiType; override;
    function GetDispatchKind: TDispatchKind; override;
    function GetHasExtendedInfo: Boolean; override;
    function GetCodeAddress: Pointer; override;
    function GetIsClassMethod: Boolean; override;
    function GetIsStatic: Boolean; override;
    function GetVisibility: TMemberVisibility; override;
    function DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue; override;
  public
    function GetParameters: TArray<TRttiParameter>; override;
    property Signature: TProcSig read FSig;
  end;

{ TRttiRecordMethod }

constructor TRttiRecordMethod.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := _SkipShortString(@PRecordTypeMethod(P)^.NameLen);
  FSig := Package.ReadObject(TProcSig, Self, P) as TProcSig;
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiRecordMethod.GetCallingConvention: TCallConv;
begin
  Result := FSig.Handle^.CC;
end;

function TRttiRecordMethod.GetReturnType: TRttiType;
begin
  Result := FSig.GetReturnType;
end;

function TRttiRecordMethod.GetDispatchKind: TDispatchKind;
begin
  Result := dkStatic;
end;

function TRttiRecordMethod.GetHasExtendedInfo: Boolean;
begin
  Result := FSig.HasInfo;
end;

function TRttiRecordMethod.GetCodeAddress: Pointer;
begin
  Result := PRecordTypeMethod(Handle)^.Code;
end;

function TRttiRecordMethod.GetIsClassMethod: Boolean;
begin
  Result := GetMethodKind in [mkClassProcedure, mkClassFunction, mkOperatorOverload];
end;

function TRttiRecordMethod.GetIsStatic: Boolean;
begin
  Result := not (GetMethodKind in [mkProcedure, mkFunction]);
end;

function TRttiRecordMethod.GetVisibility: TMemberVisibility;
begin
  Result := TMemberVisibility(
    GetBitField(PRecordTypeMethod(Handle)^.Flags, rmfVisibilityShift, rmfVisibilityBits));
end;

function TRttiRecordMethod.DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue;
var
  argList: TArray<TValue>;
  parList: TArray<TRttiParameter>;
  i, currArg: Integer;
  inst: TValue;
begin
  if not IsStatic then
    if (Instance.Kind = tkPointer) and
      (
        ( // pointer to the record type
          (Instance.TypeData^.RefType <> nil) and
          (Instance.TypeData^.RefType^ = Parent.Handle)
        )
      or
        ( // untyped pointer (i.e. System.Pointer or equivalent)
          (Instance.TypeData^.RefType = nil) or
          (Instance.TypeData^.RefType^ = nil)
        )
      ) then
    begin
      // passed as is, a pointer
      inst := Instance;
    end
    else
    begin
      // pass a pointer to value inside Instance
      // beware that mutations are lost owing to copies
      if Instance.TypeInfo <> Parent.Handle then
        raise EInvalidCast.CreateRes(@SInvalidCast);
      inst := TValue.From(Instance.GetReferenceToRawData);
    end;

  parList := GetParameters;
  if Length(Args) <> Length(parList) then
    raise EInvocationError.CreateRes(@SParameterCountMismatch);

  if IsStatic then
    SetLength(argList, Length(Args))
  else
    SetLength(argList, Length(Args) + 1);

  currArg := 0;
  if not IsStatic then
    PushSelfFirst(CallingConvention, argList, currArg, inst);

  for i := 0 to Length(Args) - 1 do
  begin
    PassArg(parList[i], Args[i], argList[currArg], CallingConvention);
    Inc(currArg);
  end;

  if not IsStatic then
    PushSelfLast(CallingConvention, argList, currArg, inst);

  if ReturnType <> nil then
    Result := System.Rtti.Invoke(CodeAddress, argList, CallingConvention, ReturnType.Handle, IsStatic)
  else
    Result := System.Rtti.Invoke(CodeAddress, argList, CallingConvention, nil);
end;

function TRttiRecordMethod.GetParameters: TArray<TRttiParameter>;
begin
  Result := FSig.GetParams;
end;

function TRttiRecordMethod.GetMethodKind: TMethodKind;
begin
  case TRecMethodKind(GetBitField(PRecordTypeMethod(Handle)^.Flags, rmfKindShift, rmfKindBits)) of
    rmkMethod:
      if FSig.Handle^.ResultType = nil then
        Result := mkProcedure
      else
        Result := mkFunction;

    rmkStaticMethod:
      if FSig.Handle^.ResultType = nil then
        Result := mkClassProcedure
      else
        Result := mkClassFunction;

    rmkConstructor:
      Result := mkConstructor;

    rmkOperator:
      Result := mkOperatorOverload;
  else
    Result := mkProcedure; // unreachable
  end;
end;

function TRttiRecordMethod.GetName: string;
begin
  Result := _UTF8ToString(@PRecordTypeMethod(Handle)^.NameLen);
end;

{ TRttiRecordType }

{$IF Defined(CPUARM64) or Defined(LINUX64)}
constructor TRttiRecordType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  GetHFAElement;
end;
{$ENDIF CPUARM64 or LINUX64}

function TRttiRecordType.GetManagedFields: TArray<TRttiManagedField>;
var
  p: PByte;
  cnt: Integer;
  list: TList<TRttiManagedField>;
begin
  list := TList<TRttiManagedField>.Create;
  try
    p := @TypeData^.ManagedFldCount;
    cnt := ReadI32(p);
    while cnt > 0 do
    begin
      list.Add(Package.ReadObject(TRttiManagedField, Self, p) as TRttiManagedField);
      Dec(cnt);
    end;
    Result := TListHelper.ToArray<TRttiManagedField>(list);
  finally
    list.Free;
  end;
end;

function TRttiRecordType.GetDeclaredFields: TArray<TRttiField>;
var
  p: PByte;
  cnt, i: Integer;
  numOps: Byte;
begin
  p := @TypeData^.ManagedFldCount;
  cnt := ReadI32(p);
  Inc(p, SizeOf(TManagedField) * cnt);
  numOps := ReadU8(p);
  Inc(p, SizeOf(Pointer) * numOps);
  cnt := ReadI32(p);
  SetLength(Result, cnt);
  for i := 0 to cnt - 1 do
    Result[i] := Package.ReadObject(TRttiRecordField, Self, p) as TRttiRecordField;
  if not Assigned(FAttributeGetter) then
  begin
    TMonitor.Enter(Package.FLock);
    try
      FAttributeGetter := LazyLoadAttributes(p);
    finally
      TMonitor.Exit(Package.FLock);
    end;
  end
  else
    Inc(P, PWord(P)^);
  FMethOfs := p;
end;

function TRttiRecordType.GetDeclaredMethods: TArray<TRttiMethod>;
var
  p: PByte;
  cnt, i: Integer;
begin
  p := FMethOfs;
  if p = nil then
  begin
    GetFields;
    p := FMethOfs;
  end;
  cnt := ReadU16(p);
  SetLength(Result, cnt);
  for i := 0 to cnt - 1 do
    Result[i] := Package.ReadObject(TRttiRecordMethod, Self, p) as TRttiMethod;
end;

function TRttiRecordType.GetAttributes: TArray<TCustomAttribute>;
begin
  if not Assigned(FAttributeGetter) then
    GetFields;
  Result := inherited GetAttributes;
end;

function TRttiRecordType.GetTypeSize: Integer;
begin
  Result := TypeData^.RecSize;
end;

{$IF Defined(CPUARM64) or Defined(LINUX64)}
procedure TRttiRecordType.GetHFAElement;

  function CheckField(const [ref] F: TRttiType): Boolean;
  begin
    Result := (F.GetTypeKind = tkFloat) and ((F as TRttiFloatType).FloatType in [ftSingle, ftDouble]);
  end;

var
  ctx: TRttiContext;
  anAttribute: TCustomAttribute;
  aRecordFields: TArray<TRttiField>;
  aFieldType: TRttiType;
  ElementType: TRttiFloatType;
  ElementCount: Integer;
  ind: Integer;
begin
  FHFAHasInsufficientTypeInformation := False;

  for anAttribute in GetAttributes do
    if anAttribute is HFAAttribute then
    begin
      FHFAElementType := ctx.GetType(PPTypeInfo((anAttribute as HFAAttribute).ElementType)^) as TRttiFloatType;
      FHFAElementCount := (anAttribute as HFAAttribute).ElementCount;
      Exit;
    end;

  aRecordFields := GetDeclaredFields;
  if not(Length(aRecordFields) in [1..4]) then Exit;

  aFieldType := aRecordFields[0].FieldType;
  if (aFieldType = nil) or (aFieldType.FHandle = nil) then
  begin
                                    
    FHFAHasInsufficientTypeInformation := True;
    Exit;
  end;

  if CheckField(aFieldType) then
  begin
    ElementType := aFieldType as TRttiFloatType;
    ElementCount := 1;
  end
  else if aFieldType.IsHFA then
  begin
    ElementType := aFieldType.HFAElementType;
    ElementCount := aFieldType.HFAElementCount;
  end
  else
    Exit;

  ind := 1;
  while ind < Length(aRecordFields) do
  begin
    aFieldType := aRecordFields[ind].FieldType;

    if (aFieldType = nil) or (aFieldType.FHandle = nil) then
    begin
                                      
      FHFAHasInsufficientTypeInformation := True;
      Exit;
    end;

    if CheckField(aFieldType) then
    begin
      if ElementType <> aFieldType then
        Exit;
      Inc(ElementCount);
    end
    else if aFieldType.IsHFA then
    begin
      if ElementType <> aFieldType.HFAElementType then
        Exit;
      Inc(ElementCount, aFieldType.HFAElementCount);
    end
    else
      Exit;
    Inc(ind);
  end;

  if ElementCount in [1..4] then
  begin
    FHFAElementType := ElementType;
    FHFAElementCount := ElementCount;
  end;
end;

function TRttiRecordType.GetIsHFA: Boolean;
begin
  Result := FHFAElementType <> nil;
end;

function TRttiRecordType.GetHFAElementType: TRttiFloatType;
begin
  Result := FHFAElementType;
end;

function TRttiRecordType.GetHFAElementCount: Integer;
begin
  Result := FHFAElementCount;
end;
{$ENDIF CPUARM64 or LINUX64}

{ TRttiArrayType }

constructor TRttiArrayType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  p := @TypeData^.ArrayData.Dims[0];
  Inc(p, GetDimensionCount * SizeOf(Pointer));
  FAttributeGetter := LazyLoadAttributes(p);
{$IF Defined(CPUARM64) or Defined(LINUX64)}
  GetHFAElement;
{$ENDIF CPUARM64 or LINUX64}
end;

function TRttiArrayType.GetTypeSize: Integer;
begin
  Result := TypeData^.ArrayData.Size;
end;

function TRttiArrayType.GetTotalElementCount: Integer;
begin
  Result := TypeData^.ArrayData.ElCount;
end;

function TRttiArrayType.GetElementType: TRttiType;
begin
  Result := Pool.TypeOrNil(TypeData^.ArrayData.ElType);
end;

function TRttiArrayType.GetDimensionCount: Integer;
begin
  Result := TypeData^.ArrayData.DimCount;
end;

function TRttiArrayType.GetDimension(Index: Integer): TRttiType;
begin
  Result := Pool.TypeOrNil(TypeData^.ArrayData.Dims[Index]);
end;

{$IF Defined(CPUARM64) or Defined(LINUX64)}
procedure TRttiArrayType.GetHFAElement;
var
  elType: TRTTIType;
begin
  elType := ElementType;
  if (elType.TypeKind = tkFloat) and ((elType as TRTTIFloatType).FloatType in [ftSingle, ftDouble]) then
  begin
    if TotalElementCount in [1..4] then
    begin
      FHFAElementType := elType as TRTTIFloatType;
      FHFAElementCount := TotalElementCount;
    end;
  end
  else if elType.IsHFA then
  begin
    if TotalElementCount * elType.HFAElementCount in [1..4] then
    begin
      FHFAElementType := elType.HFAElementType;
      FHFAElementCount := TotalElementCount * elType.HFAElementCount;
    end;
  end;
end;

function TRttiArrayType.GetIsHFA: Boolean;
begin
  Result := FHFAElementType <> nil;
end;

function TRttiArrayType.GetHFAElementType: TRttiFloatType;
begin
  Result := FHFAElementType;
end;

function TRttiArrayType.GetHFAElementCount: Integer;
begin
  Result := FHFAElementCount;
end;
{$ENDIF CPUARM64 or LINUX64}

{ TRttiDynamicArrayType }

constructor TRttiDynamicArrayType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte( TypeData.DynArrAttrData );
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiDynamicArrayType.GetDeclaringUnitName: string;
begin
  Result := TypeData.DynUnitNameFld.ToString;
end;

function TRttiDynamicArrayType.GetElementSize: Integer;
begin
  Result := TypeData^.elSize;
end;

function TRttiDynamicArrayType.GetElementType: TRttiType;
begin
  Result := Pool.GetType(GetDynArrayElType(Handle));
end;

function TRttiDynamicArrayType.GetOleAutoVarType: TVarType;
begin
  Result := TypeData^.varType;
end;

{ TRttiPointerType }

function TRttiPointerType.GetReferredType: TRttiType;
begin
  Result := Pool.TypeOrNil(TypeData^.RefType);
end;

function TRttiPointerType.GetAttributes: TArray<TCustomAttribute>;
var
  p: PByte;
begin
  if not Assigned(FAttributeGetter) then
  begin
    TMonitor.Enter(Package.FLock);
    try
      if not Assigned(FAttributeGetter) then
      begin
        p := @TypeData^.PtrAttrData;
        FAttributeGetter := LazyLoadAttributes(p);
      end;
    finally
      TMonitor.Exit(Package.FLock);
    end;
  end;
  Result := inherited GetAttributes;
end;


{ TRttiInvokableType }

function TRttiInvokableType.GetReturnType: TRttiType;
begin
  if FProcSig = nil then
    Exit(nil);
  Result := TProcSig(FProcSig).GetReturnType;
end;

function TRttiInvokableType.GetCallingConvention: TCallConv;
begin
  if FProcSig = nil then
    Exit(ccReg);
  Result := TProcSig(FProcSig).Handle^.CC;
end;

function TRttiInvokableType.GetParameters: TArray<TRttiParameter>;
begin
  if FProcSig = nil then
    Exit(nil);
  Result := TProcSig(FProcSig).GetParams;
end;

function TRttiInvokableType.ToString: string;
var
  sig: string;
begin
  if FProcSig = nil then
    sig := ''
  else
    sig := TProcSig(FProcSig).ToString;
  if ReturnType = nil then
    Result := Name + ' = procedure' + sig // do not localize
  else
    Result := Name + ' = function' + sig; // do not localize
end;

{ TRttiMethodType }

constructor TRttiMethodType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
var
  cnt: Integer;
begin
  inherited;

  P := @TypeData^.ParamCount;
  cnt := ReadU8(P);
  while cnt > 0 do
  begin
    Inc(P, SizeOf(TParamFlags));
    P := _SkipShortString(P); // ParamName
    P := _SkipShortString(P); // ParamType
    Dec(cnt);
  end;
  if MethodKind = mkFunction then
  begin
    P := _SkipShortString(P); // PType
    Inc(P, SizeOf(Pointer)); // PTypeRef
  end;
  Inc(P, 1 + TypeData^.ParamCount * SizeOf(Pointer)); // CC + ParamRefs
  if PPointer(P)^ <> nil then
    FProcSig := Pointer(Package.ReadObjectPointer(TProcSig, Self, PPointer(P)^));
  Inc(P, SizeOf(Pointer)); // signature

  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiMethodType.Invoke(const Callable: TValue; const Args: array of TValue): TValue;
var
  meth: TMethod;
  argCount: Integer;
  argList: TArray<TValue>;
  parList: TArray<TRttiParameter>;
  i, currArg: Integer;
begin
  if not Callable.TryAsType<TMethod>(meth) then
    Callable.Cast(Handle).ExtractRawData(@meth);

  parList := GetParameters;
  if Length(Args) <> Length(parList) then
    raise EInvocationError.CreateRes(@SParameterCountMismatch);

  argCount := Length(Args);
  SetLength(argList, argCount + 1);

  currArg := 0;
  PushSelfFirst(CallingConvention, argList, currArg, meth.Data);

  for i := 0 to Length(Args) - 1 do
  begin
    PassArg(parList[i], Args[i], argList[currArg], CallingConvention);
    Inc(currArg);
  end;

  PushSelfLast(CallingConvention, argList, currArg, meth.Data);

  if ReturnType <> nil then
    Result := System.Rtti.Invoke(meth.Code, argList, CallingConvention, ReturnType.Handle, False) // not static
  else
    Result := System.Rtti.Invoke(meth.Code, argList, CallingConvention, nil);
end;

function TRttiMethodType.ToString: string;
begin
  Result := inherited ToString + ' of object'; // do not localize
end;

function TRttiMethodType.GetMethodKind: TMethodKind;
begin
  Result := TypeData^.MethodKind;
end;

function TRttiMethodType.GetTypeSize: Integer;
begin
  Result := SizeOf(TMethod);
end;

{ TRttiProcedureType }

constructor TRttiProcedureType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  if TypeData^.ProcSig <> nil then
    FProcSig := Pointer(Package.ReadObjectPointer(TProcSig, Self, TypeData^.ProcSig));
end;

function TRttiProcedureType.Invoke(const Callable: TValue; const Args: array of TValue): TValue;
var
  code: Pointer;
  argList: TArray<TValue>;
  parList: TArray<TRttiParameter>;
  i: Integer;
begin
  Callable.Cast(Handle).ExtractRawData(@code);
  parList := GetParameters;

  if Length(Args) <> Length(parList) then
    raise EInvocationError.CreateRes(@SParameterCountMismatch);

  SetLength(argList, Length(Args));

  for i := 0 to Length(Args) - 1 do
  begin
    if parList[i].ParamType = nil then
      argList[i] := TValue.From<Pointer>(Args[i].GetReferenceToRawData)
    else if parList[i].Flags * [pfVar, pfOut] <> [] then
    begin
      if parList[i].ParamType.Handle <> Args[i].TypeInfo then
        raise EInvalidCast.CreateRes(@SByRefArgMismatch);
      argList[i] := TValue.From<Pointer>(Args[i].GetReferenceToRawData);
    end
    else
      argList[i] := Args[i].Cast(parList[i].ParamType.Handle);
  end;

  if ReturnType <> nil then
    Result := System.Rtti.Invoke(code, argList, CallingConvention, ReturnType.Handle)                   
  else
    Result := System.Rtti.Invoke(code, argList, CallingConvention, nil);
end;

function TRttiProcedureType.GetAttributes: TArray<TCustomAttribute>;
var
  p: PByte;
begin
  if not Assigned(FAttributeGetter) then
  begin
    TMonitor.Enter(Package.FLock);
    try
      if not Assigned(FAttributeGetter) then
      begin
        p := @TypeData^.ProcAttrData;
        FAttributeGetter := LazyLoadAttributes(p);
      end;
    finally
      TMonitor.Exit(Package.FLock);
    end;
  end;
  Result := inherited;
end;

{ TRttiAnsiStringType }

function TRttiAnsiStringType.GetCodePage: Word;
begin
                                                                                              
{$IFNDEF NEXTGEN}
  Result := TypeData^.CodePage;
{$ELSE  NEXTGEN}
  Result := 0;
{$ENDIF NEXTGEN}
end;

{ TRttiStringType }

constructor TRttiStringType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  case TypeKind of
{$IFNDEF NEXTGEN}
    tkLString: P := PByte(@TypeData^.CodePage) + SizeOf(TypeData^.CodePage);
    tkString: P := PByte(@TypeData^.MaxLength) + SizeOf(TypeData^.MaxLength);
    tkWString,
{$ENDIF !NEXTGEN}
    tkUString: P := @TypeData^.AttrData;
  end;
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiStringType.GetStringKind: TRttiStringKind;
begin
  case TypeKind of
{$IFNDEF NEXTGEN}
    tkLString:
      Result := skAnsiString;
    tkWString:
      Result := skWideString;
    tkString:
      Result := skShortString;
{$ENDIF !NEXTGEN}
    tkUString:
      Result := skUnicodeString;
  else
    Assert(False);
    Result := skAnsiString;
  end;
end;

function TRttiStringType.GetTypeSize: Integer;
begin
{$IFNDEF NEXTGEN}
  if TypeKind = tkString then
    Result := TypeData^.MaxLength + 1
  else
{$ENDIF !NEXTGEN}
    Result := SizeOf(Pointer);
end;

{ TRttiFloatType }

constructor TRttiFloatType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte(@TypeData^.FloatType) + SizeOf(TypeData^.FloatType);
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiFloatType.GetFloatType: TFloatType;
begin
  Result := TypeData^.FloatType;
end;

function TRttiFloatType.GetTypeSize: Integer;
const
  Sizes: array[TFloatType] of Integer = (4, 8, SizeOf(Extended), 8, 8);
begin
  Result := Sizes[FloatType];
end;

procedure RaiseSafeCallError(ResultCode: HResult);
begin
  if Assigned(SafeCallErrorProc) then
    SafeCallErrorProc(ResultCode, ReturnAddress);
  System.Error(reSafeCallError);
end;

// If RegFlag doesn't have any bit, -1 is returned.

function RegFlagToIndex(RegFlag: UInt32): Integer;
begin
  Result := -1;
  while (RegFlag <> 0) do
  begin
    inc(Result);
    RegFlag := RegFlag shr 1;
  end;
end;

function RegDoubleFlagToIndex(RegFlag: UInt32): Integer;
begin
  Result := -1;
  while (RegFlag <> 0) do
  begin
    inc(Result);
    RegFlag := RegFlag shr 2;
  end;
end;

{ Raw invocation logic -- 4 CPU based versions follow -- }
{$IF Defined(CPUX86)} // Raw invocation logic ( 1 of 4 )
type
  TFloatReg = record
    case TFloatType of
      ftSingle: (RegSingle: Single);
      ftDouble: (RegDouble: Double);
      ftExtended: (RegExtended: Extended);
      ftComp: (RegComp: Comp);
      ftCurr: (RegCurr: Currency);
  end;

  PParamBlock = ^TParamBlock;
  TParamBlock = record
    RegEAX: Integer;
    RegEDX: Integer;
    RegECX: Integer;
    FP: TFloatReg;
    PopStack: byte;
    PopFP: TFloatType;
    StackData: PByte;
    StackDataSize: Integer;
  end;

                                                                                                         
procedure RawInvoke(CodeAddress: Pointer; ParamBlock: PParamBlock);
asm
      PUSH  EBP
      MOV   EBP, ESP

      PUSH  EAX // EBP - 4 = CodeAddress
      PUSH  EBX
      MOV   EBX, EDX // EBX = ParamBlock

      // Copy block to stack
      MOV   ECX, [EBX].TParamBlock.StackDataSize
      TEST  ECX, ECX
      JNZ   @@do_push
      NOP   // no branch opt
      JMP   @@skip_push

@@do_push:
{$IFDEF ALIGN_STACK}
      MOV   EAX, ECX
      AND   EAX, $F
      JZ    @@no_align
      SUB   EAX, 16
      ADD   ESP, EAX
@@no_align:
{$ENDIF ALIGN_STACK}
      // touch stack pages in case it needs to grow
      // while (count > 0) { touch(stack); stack -= 4096; count -= 4096; }
      MOV   EAX, ECX
      JMP   @@touch_loop_begin

@@touch_loop:
      MOV   [ESP],0
@@touch_loop_begin:
      SUB   ESP, 4096
      SUB   EAX, 4096
      JNS   @@touch_loop
      SUB   ESP, EAX

      MOV   EAX, [EBX].TParamBlock.StackData
      MOV   EDX, ESP
      CALL  Move // EAX=source, EDX=dest, ECX=count

@@skip_push:

      // Do call
      MOV   EAX, [EBX].TParamBlock.RegEAX
      MOV   EDX, [EBX].TParamBlock.RegEDX
      MOV   ECX, [EBX].TParamBlock.RegECX
      CALL  [EBP - 4]
      MOV   [EBX].TParamBlock.RegEAX, EAX
      MOV   [EBX].TParamBlock.RegEDX, EDX

      MOVSX EAX, BYTE PTR [EBX].TParamBlock.PopFP
      INC   EAX
      JNZ   @@do_fp_pop
      NOP
      JMP   @@done_fp_pop

@@do_fp_pop:
      DEC   EAX
      // ftSingle, ftDouble, ftExtended, ftComp, ftCurr
      JZ    @@single
      DEC   EAX
      JZ    @@double
      DEC   EAX
      JZ    @@extended

      // => currency or comp
      FISTP QWORD PTR [EBX].TParamBlock.FP.RegCurr
      JMP   @@done_fp_pop

@@single:
      FSTP  DWORD PTR [EBX].TParamBlock.FP.RegSingle
      JMP   @@done_fp_pop

@@double:
      FSTP  QWORD PTR [EBX].TParamBlock.FP.RegDouble
      JMP   @@done_fp_pop

@@extended:
      FSTP  TBYTE PTR [EBX].TParamBlock.FP.RegExtended

@@done_fp_pop:
      MOV   AL, [EBX].TParamBlock.PopStack // 0:no-pop 1: pop 2: pop - 4
      TEST  AL,AL
      JNZ   @@do_pop
      NOP
      JMP   @@done

@@do_pop:
      DEC   AL
      MOV   EAX,[EBX].TParamBlock.StackDataSize
      JZ    @@do_pop2
      SUB   EAX,4  // PopStack = 2. Caller already release the structure-ret pointer.
@@do_pop2:
      ADD   ESP,EAX

@@done:
{$IFDEF ALIGN_STACK}
      MOV   EAX, [EBX].TParamBlock.StackDataSize
      AND   EAX, $F
      JZ    @@no_realign
      SUB   EAX, 16
      SUB   ESP, EAX
@@no_realign:
{$ENDIF ALIGN_STACK}
      POP   EBX
      POP   EAX
      POP   EBP
end;

// CPUX86 raw invocation logic that expects:
// * CodeAddress calculated => no virtuals etc.
// * Arguments *exactly* match parameter types (no conversions)
// * Hidden arguments are included => c/dtor bool, array lengths
// * Managed return types are inferred - passed last as out by-ref arg
function Invoke(CodeAddress: Pointer; const Args: TArray<TValue>;
  CallingConvention: TCallConv; AResultType: PTypeInfo; IsStatic: Boolean; IsConstructor: Boolean): TValue;
const
  regNone = 0;
  regEAX = 1;
  regEDX = 2;
  regECX = 4;
  regAll = 7;

  function CalcStackSize(CC: TCallConv): Integer;
  var
    i: Integer;
  begin
    // Estimate maximum stack usage, assuming everything goes
    // on the stack with 4-byte alignment.
    Result := SizeOf(Pointer); // for potential managed return-value
    for i := 0 to Length(Args) - 1 do
      if PassByRef(Args[i].TypeInfo, CC) then
        Inc(Result, SizeOf(Pointer))
      else
        Inc(Result, Align4(Args[i].DataSize));
  end;

var
  block: TParamBlock;
  top: PByte;
  freeRegs: UInt32;

  procedure PutArg(const Arg: TValue);
  var
    dataSize, stackSize: Integer;
    reg: UInt32;
  begin
    dataSize := Arg.DataSize;
    stackSize := GetValueStackSize(Arg);
    if (dataSize in [1, 2, 4]) and not (Arg.Kind = tkFloat) then
    begin
      reg := AllocReg(freeRegs);
      if reg <> regNone then
      begin
        case reg of
          regEAX: Arg.ExtractRawDataNoCopy(@block.RegEAX);
          regEDX: Arg.ExtractRawDataNoCopy(@block.RegEDX);
          regECX: Arg.ExtractRawDataNoCopy(@block.RegECX);
        end;
        Exit;
      end;
    end;
    // No register => stack
    Dec(top, stackSize);
    Arg.ExtractRawDataNoCopy(top);
  end;

  procedure PutRefArg(const Loc: Pointer);
  var
    reg: UInt32;
  begin
    reg := AllocReg(freeRegs);
    if reg <> regNone then
    begin
      case reg of
        regEAX: Pointer(block.RegEAX) := Loc;
        regEDX: Pointer(block.RegEDX) := Loc;
        regECX: Pointer(block.RegECX) := Loc;
      end;
      Exit;
    end;
    Dec(top, SizeOf(Pointer));
    PPointer(top)^ := Loc;
  end;

var
  stackData: TArray<Byte>;
  i: Integer;
  argCnt: Integer;
begin
  FillChar(block, SizeOf(block), 0);
  SetLength(stackData, CalcStackSize(CallingConvention));
  top := @stackData[Length(stackData)];

  if CallingConvention = ccReg then
    freeRegs := regAll
  else
    freeRegs := regNone;

  if (CallingConvention = ccSafeCall) and (AResultType <> nil) then
  begin
    TValue.Make(nil, AResultType, Result);
    PutRefArg(Result.GetReferenceToRawData);
  end;

  argCnt := Length(Args);
  // Last argument is Self, but unfortunately, Result parameter (if any) needs
  // to come before Self. Self must be the *very* *last* item.
  if (CallingConvention = ccPascal) and not IsStatic then
    Dec(argCnt);

  if CallingConvention in [ccCdecl, ccStdCall, ccSafeCall] then
    for i := argCnt - 1 downto 0 do
      if PassByRef(Args[i].TypeInfo, CallingConvention) then
        PutRefArg(Args[i].GetReferenceToRawData)
      else
        PutArg(Args[i])
  else
    for i := 0 to argCnt - 1 do
      if PassByRef(Args[i].TypeInfo, CallingConvention) then
        PutRefArg(Args[i].GetReferenceToRawData)
      else
        PutArg(Args[i]);

  if (CallingConvention <> ccSafeCall) and UseResultPointer(AResultType, IsConstructor, CallingConvention) then
  begin
    TValue.Make(nil, AResultType, Result);
    PutRefArg(Result.GetReferenceToRawData);
  end;

  // Now that Result parameter (if any) is in place we can finally move Self in.
  if (CallingConvention = ccPascal) and not IsStatic then
    if PassByRef(Args[argCnt].TypeInfo, CallingConvention) then
      PutRefArg(Args[argCnt].GetReferenceToRawData)
    else
      PutArg(Args[argCnt]);

{$IFDEF MACOS}
  if CallingConvention = ccCdecl then
  begin
    block.PopStack := 1;  // Callee POP the stack.
    if (AResultType <> nil) and (AResultType^.Kind in [tkRecord, tkMRecord]) then
    begin
      case GetTypeData(AResultType)^.RecSize of
        0,1,2,4,8:
         {block.PopStack := 1}; // already initialized.
        else
          block.PopStack := 2;  // Callee POP the stack and struct-ret pointer.
      end;
    end;
  end
  else
    block.PopStack := 0; // Caller POP the stack.
{$ELSE !MACOS}
  if CallingConvention = ccCdecl then
    block.PopStack := 1  // Callee POP the stack.
  else
    block.PopStack := 0; // Caller POP the stack.
{$ENDIF MACOS}

  block.StackData := top;
  block.StackDataSize := PByte(@stackData[Length(stackData)]) - top;

  if (AResultType = nil) or (AResultType^.Kind <> tkFloat) then
    block.PopFP := TFloatType(-1)
  else
    block.PopFP := GetTypeData(AResultType)^.FloatType;

  RawInvoke(CodeAddress, @block);

  if (CallingConvention = ccSafeCall) and (block.RegEAX < 0)  then
    RaiseSafeCallError(block.RegEAX);

  if AResultType = nil then
     Result := TValue.Empty
  else
  if CallingConvention <> ccSafeCall then
  begin
    if UseResultPointer(AResultType, IsConstructor, CallingConvention) then
      // do nothing
    else if block.PopFP <> TFloatType(-1) then
      TValue.MakeWithoutCopy(@block.FP, AResultType, Result)
    else
      TValue.Make(@block.RegEAX, AResultType, Result);
  end;
end; // of CPUX86 Invoke

{$ELSEIF Defined(CPUX64)} // Raw invocation logic ( 2 of 4 )
{$IF Defined(MSWINDOWS)}
type
  PParamBlock = ^TParamBlock;
  TParamBlock = record
    RegRCX: Int64;
    RegRDX: Int64;
    RegR8: Int64;
    RegR9: Int64;
    StackData: PByte;
    StackDataSize: Integer;
    OutRAX: Int64;
    OutXMM0: Double;
  end;

procedure RawInvoke(CodeAddress: Pointer; ParamBlock: PParamBlock);
{$IFDEF ASSEMBLER}
  procedure InvokeError;
  begin
    raise EInvocationError.CreateRes(@SParameterCountExceeded);
  end;
asm
      .PARAMS 62 // There's actually room for 64, assembler is saving locals for CodeAddress & ParamBlock
      MOV     [RBP+$210], CodeAddress                                                 
      MOV     [RBP+$218], ParamBlock
      MOV     EAX, [ParamBlock].TParamBlock.StackDataSize
      TEST    EAX, EAX                                          
      JZ      @@skip_push
      CMP     EAX, 480 // (64-4) params * 8 bytes.
      JBE     @@valid_frame

      Call InvokeError
@@valid_frame:
      // All items on stack should be 16 byte aligned. Caller should
      // have handled that, just copy data here.
      MOV     RCX, [ParamBlock].TParamBlock.StackData
      LEA     RDX, [RBP+$20]
      MOVSX   R8,  EAX                                      
      CALL    Move     // RCX: source, RDX: dest, R8, count
      MOV     RDX, [RBP+$218]

@@skip_push:
      MOV     RCX, [RDX].TParamBlock.RegRCX
      MOV     R8,  [RDX].TParamBlock.RegR8
      MOV     R9,  [RDX].TParamBlock.RegR9

      MOVSD   XMM0,[RDX].TParamBlock.RegRCX
      MOVSD   XMM1,[RDX].TParamBlock.RegRDX
      MOVSD   XMM2,[RDX].TParamBlock.RegR8
      MOVSD   XMM3,[RDX].TParamBlock.RegR9

      MOV     RDX, [RDX].TParamBlock.RegRDX

      CALL    [RBP+$210]

      MOV     RDX, [RBP+$218]
      MOV     [RDX].TParamBlock.OutRAX, RAX
      MOVSD   [RDX].TParamBlock.OutXMM0, XMM0

end;
{$ELSE  ASSEMBLER}
begin
                                                                              
end;
{$ENDIF ASSEMBLER}

// CPUX64 raw invocation logic that expects:
// * CodeAddress calculated => no virtuals etc.
// * Arguments *exactly* match parameter types (no conversions)
// * Hidden arguments are included => c/dtor bool, array lengths
// * Managed return types are inferred - passed either first (IsStatic = True) or second (IsStatic = False)
function Invoke(CodeAddress: Pointer; const Args: TArray<TValue>;
  CallingConvention: TCallConv; AResultType: PTypeInfo; IsStatic: Boolean; IsConstructor: Boolean): TValue;
const
  regNone = 0;
  regRCX  = 1;
  regRDX  = 2;
  regR8   = 4;
  regR9   = 8;
  regAll  = 15;

  function CalcStackSize: Integer;
  var
    i: Integer;
  begin
    // Estimate maximum stack usage, assuming everything goes
    // on the stack with 4-byte alignment.
    Result := SizeOf(Pointer); // for potential managed return-value
    for i := 4 to Length(Args) - 1 do
      if PassByRef(Args[i].TypeInfo, CallingConvention) then
        Inc(Result, SizeOf(Pointer))
      else
        Inc(Result, Align8(Args[i].DataSize));
  end;

var
  stackData: TArray<Byte>;
  block: TParamBlock;
  top: PByte;
  freeRegs: UInt32;

  procedure PutArg(const Arg: TValue);
  var
    dataSize: Integer;
    reg: UInt32;
  begin
    dataSize := Arg.DataSize;
    if (dataSize in [1, 2, 4, 8]) then
    begin
      reg := AllocReg(freeRegs);
      if reg <> regNone then
      begin
        case reg of
          regRCX: Arg.ExtractRawDataNoCopy(@block.RegRCX);
          regRDX: Arg.ExtractRawDataNoCopy(@block.RegRDX);
          regR8: Arg.ExtractRawDataNoCopy(@block.RegR8);
          regR9: Arg.ExtractRawDataNoCopy(@block.RegR9);
        end;
        Exit;
      end;
    end;
    // No register => stack
    Arg.ExtractRawDataNoCopy(top);
    Inc(top, Align8(dataSize));
  end;

  procedure PutRefArg(const Loc: Pointer);
  var
    reg: UInt32;
  begin
    reg := AllocReg(freeRegs);
    if reg <> regNone then
    begin
      case reg of
        regRCX: Pointer(block.RegRCX) := Loc;
        regRDX: Pointer(block.RegRDX) := Loc;
        regR8: Pointer(block.RegR8) := Loc;
        regR9: Pointer(block.RegR9) := Loc;
      end;
      Exit;
    end;
    PPointer(top)^ := Loc;
    Inc(top, SizeOf(Pointer));
  end;

var
  i: Integer;
begin
  FillChar(block, SizeOf(block), 0);
  SetLength(stackData, CalcStackSize);
  top := @stackData[0];

  freeRegs := regAll;

  if (CallingConvention <> ccSafeCall) and IsStatic and UseResultPointer(AResultType, IsConstructor, CallingConvention) then
  begin
    TValue.Make(nil, AResultType, Result);
    PutRefArg(Result.GetReferenceToRawData);
  end;

  if Length(Args) > 0 then
    if PassByRef(Args[0].TypeInfo, CallingConvention) then
      PutRefArg(Args[0].GetReferenceToRawData)
    else
      PutArg(Args[0]);

  if (CallingConvention <> ccSafeCall) and not IsStatic and UseResultPointer(AResultType, IsConstructor, CallingConvention) then
  begin
    TValue.Make(nil, AResultType, Result);
    PutRefArg(Result.GetReferenceToRawData);
  end;

  for i := 1 to Length(Args) - 1 do
    if PassByRef(Args[i].TypeInfo, CallingConvention) then
      PutRefArg(Args[i].GetReferenceToRawData)
    else
      PutArg(Args[i]);

  if (CallingConvention = ccSafeCall) and (AResultType <> nil)  then
  begin
    TValue.Make(nil, AResultType, Result);
    PutRefArg(Result.GetReferenceToRawData);
  end;

  block.StackData := @stackData[0];
  block.StackDataSize := top - PByte(@stackData[0]);

  RawInvoke(CodeAddress, @block);

  if (CallingConvention = ccSafeCall) and (HResult(block.OutRAX) < 0) then
    RaiseSafeCallError(HResult(block.OutRAX));

  if AResultType = nil then
    Result := TValue.Empty
  else
  if CallingConvention <> ccSafeCall then
  begin
    if UseResultPointer(AResultType, IsConstructor, CallingConvention) then
      // do nothing
    else if (AResultType^.Kind = tkFloat) and
      (AResultType^.TypeData.FloatType in [ftSingle, ftDouble, ftExtended]) then
      TValue.MakeWithoutCopy(@block.OutXMM0, AResultType, Result)
    else
      TValue.Make(@block.OutRAX, AResultType, Result);
  end;
end; // of CPUX64 Invoke

{$ELSEIF Defined(LINUX64)}
const
  MaxXMMRegCount = 8;
type
  PParamBlock = ^TParamBlock;
  TParamBlock = record
    RegXMM: array [0..MaxXMMRegCount - 1] of Double; {XMM0-XMM7}
    RegR: array [0..5] of Int64;    {RDI, RSI, RDX, RCX, R8, R9}
    OutRAX: Int64;
    OutRDX: Int64;
    OutFPU: Extended;
    StackData: PByte;
    StackDataSize: Integer;
  end;

procedure RawInvoke(CodeAddress: Pointer; ParamBlock: PParamBlock);
  external RTLHelperLibName name 'rtti_raw_invoke';

type
  TStackHelper = record
    FBuffer: TArray<Byte>;
    FGrowSize: Cardinal;
    FTop: PByte;
    FSize: Cardinal;
    procedure InternalGrow(ANewSize: Cardinal);
    function CalcAlign(ASize, Align: Cardinal): Cardinal; inline;
    function GetInit: PByte;
  public
    { AGrowSize is the block size used to realloc the internal buffer  }
    class function Create(AGrowSize: Integer = 128): TStackHelper; static;
    { Alloc space in the stack, if Align > 0 the stack will be aligned to the given value
      Returns the previous pointer before to perform the alloc, so it can be used to store data }
    function Alloc(ASize: Cardinal; Align: Cardinal = 0): PByte;
    { Aligns the stack to the given value }
    procedure Align(A: Cardinal);
    { Current Stack Pointer }
    property Top: PByte read FTop;
    { Base Stack Pointer }
    property Init: PByte read GetInit;
    { Total size allocated }
    property Size: Cardinal read FSize write FSize;
  end;

  class function TStackHelper.Create(AGrowSize: Integer): TStackHelper;
  begin
    Result.FTop := nil;
    Result.FSize := 0;
    Result.FGrowSize := AGrowSize;
  end;

  procedure TStackHelper.InternalGrow(ANewSize: Cardinal);
  begin
    if ANewSize > (Length(FBuffer) + FGrowSize) then
      SetLength(FBuffer, ANewSize)
    else
      SetLength(FBuffer, (Length(FBuffer) + FGrowSize));
    FTop := PByte(NativeUInt(@FBuffer[0]) + FSize);
  end;

  function TStackHelper.Alloc(ASize: Cardinal; Align: Cardinal): PByte;
  var
    NewSize: Cardinal;
  begin
    NewSize := CalcAlign(FSize + ASize, Align);
    if NewSize > Length(FBuffer) then
      InternalGrow(NewSize);

    Result := FTop;
    FTop := PByte(NativeUInt(@FBuffer[0]) + NewSize);
    FSize := NewSize;
  end;

  function TStackHelper.CalcAlign(ASize, Align: Cardinal): Cardinal;
  begin
   if Align > 0 then
      Result := (ASize + (Align - 1)) and not (Align - 1)
    else
      Result := ASize; // no align
  end;

  function TStackHelper.GetInit: PByte;
  begin
    Result := @FBuffer[0]
  end;

  procedure TStackHelper.Align(A: Cardinal);
  begin
    Alloc(0, A);
  end;

function Invoke(CodeAddress: Pointer; const Args: TArray<TValue>; CallingConvention: TCallConv; AResultType: PTypeInfo; IsStatic: Boolean = False;
  IsConstructor: Boolean = False ): TValue;

var
  Block: TParamBlock;
  Stack: TStackHelper;
  FreeRRegs, FreeXMMregs: UInt32;
  RttiContext: TRttiContext;

  procedure PutRefArg(const Loc: Pointer); forward;
  procedure PutArg(const Arg: TValue);
  var
    i: Integer;
    DataSize: Integer;
    RttiType: TRttiType;
    Reg: UInt32;
    RegIndex: UInt32;
    NextReg: UInt32;
    NeededRegs: UInt32;
    Offset: Integer;
    tk: TTypeKind;
    src: Pointer;
    dst: Pointer;
  begin
    DataSize := Arg.DataSize;
    RttiType := RttiContext.GetType(Arg.TypeInfo);

    tk := Arg.GetTypeKind;

    // Single / Double
    if (tk = tkFloat) and (Arg.TypeData.FloatType in [ftSingle, ftDouble]) then
    begin
      Reg := AllocReg(FreeXMMregs);
      if Reg <> 0 then
      begin
        Arg.ExtractRawData(@Block.RegXMM[RegFlagToIndex(Reg)]);
        Exit;
      end;
    end
    // Extended
    else if (tk = tkFloat) and (Arg.TypeData.FloatType in [ftExtended]) then
    begin
      Stack.Align(16);
      Arg.ExtractRawDataNoCopy(Stack.Alloc(DataSize, 16));
      Exit;
    end

    // Integer and aggregates
    else if DataSize <= 16 then
    begin
      CheckHFA(RttiType, False);

      if RttiType.IsHFA then
      begin
        NeededRegs := RttiType.HFAElementCount;
        if RttiType.HFAElementType.FloatType = ftSingle then
          NeededRegs := (NeededRegs + 1) div 2;

        src := Arg.GetReferenceToRawData;
        Offset := 0;
        if RttiType.HFAElementType.FloatType = ftSingle then
        begin
          for i := 0 to NeededRegs - 1 do
          begin
            Reg := AllocReg(FreeXMMregs);
            if Reg <> 0 then
            begin
              RegIndex := RegFlagToIndex(Reg);
              dst := @Block.RegXMM[RegIndex];
            end
            else
              dst := Stack.Alloc(8, 8);
            Move((PByte(src) + Offset)^, dst^, Min(8, DataSize - Offset));
            Inc(Offset, 8);
          end;
        end
        else
        begin
          for i := 0 to NeededRegs - 1 do
          begin
            Reg := AllocReg(FreeXMMregs);
            if Reg <> 0 then
            begin
              RegIndex := RegFlagToIndex(Reg);
              dst := @Block.RegXMM[RegIndex];
            end
            else
              dst := Stack.Alloc(SizeOf(Double), SizeOf(Double));

            Move((PByte(src) + Offset)^, dst^, Min(SizeOf(Double), DataSize - Offset));
            Inc(Offset, SizeOf(Double));
          end;
        end;

        Exit;
      end
      else if (DataSize <= 8) then
      begin
        Reg := AllocReg(FreeRRegs);
        if Reg <> 0 then
        begin
          Arg.ExtractRawDataNoCopy(@Block.RegR[RegFlagToIndex(Reg)]);
          Exit;
        end;
      end
      else
      begin
        Reg := AllocReg(FreeRRegs);
        if Reg <> 0 then
        begin
          NextReg := AllocReg(FreeRRegs);
          if NextReg <> 0 then
          begin
            Arg.ExtractRawDataNoCopy(@Block.RegR[RegFlagToIndex(Reg)]);
            Exit;
          end;
        end;
      end;
    end;
    // No register => stack
    Arg.ExtractRawDataNoCopy(Stack.Alloc(DataSize, 8));
  end;

  procedure PutRefArg(const Loc: Pointer);
  var
    Reg: UInt32;
  begin
    Reg := AllocReg(FreeRRegs);
    if Reg <> 0 then
    begin
      Pointer(Block.RegR[RegFlagToIndex(Reg)]) := Loc;
      Exit;
    end;
    PPointer(Stack.Alloc(SizeOf(Pointer)))^ := Loc;
  end;

var
  i: Integer;
  RttiType: TRttiType;
  IsResultPointer: Boolean;
  sBuf: array [0..15] of UInt32; // for Single HFA result
  dBuf: array [0..7]  of UInt64; // for Double HFA result
begin
  FillChar(Block, SizeOf(Block), 0);
  Stack := TStackHelper.Create;

  FreeRRegs := $3F;
  FreeXMMRegs := $FF;

  RttiContext := TRttiContext.Create;
  try

    IsResultPointer := False;
    if (AResultType <> nil) then
    begin
      TValue.Make(nil, AResultType, Result);
      RttiType := RttiContext.GetType(AResultType);

      IsResultPointer := (CallingConvention <> ccSafeCall)
        and (UseResultPointer(AResultType, IsConstructor, CallingConvention)
        and not (RttiType.IsHFA and (Result.DataSize <= 16)));

      if IsResultPointer then
        PutRefArg(Result.GetReferenceToRawData);
    end
    else
      RttiType := nil;

    for I := 0 to Length(Args) - 1 do
      if PassByRef(Args[I].TypeInfo, CallingConvention) then
        PutRefArg(Args[I].GetReferenceToRawData)
      else
        PutArg(Args[I]);

    if (CallingConvention = ccSafeCall) and (AResultType <> nil)  then
    begin
      TValue.Make(nil, AResultType, Result);
      PutRefArg(Result.GetReferenceToRawData);
    end;

    // If the return parameter is Extended then it will be allocated in FPU stack
    // So put a dummy value to do a check in rtti_raw_invoke
    if (AResultType <> nil) and (AResultType^.Kind = tkFloat) and (AResultType.TypeData.FloatType in [ftExtended]) then
      block.OutFPU := 1;

    // Ensure the stack is aligned to 16
    Stack.Align(16);
    block.StackData := Stack.Init;
    block.StackDataSize := Stack.Size;

    RawInvoke(CodeAddress, @block);

    if (CallingConvention = ccSafeCall) and (HResult(block.OutRAX) < 0) then
      RaiseSafeCallError(HResult(block.OutRAX));

    if AResultType = nil then
      Result := TValue.Empty
    else
    if CallingConvention <> ccSafeCall then
    begin
      if (IsResultPointer) then
        // do nothing
      else
      if (AResultType^.Kind = tkFloat) and (AResultType^.TypeData.FloatType in [ftSingle, ftDouble]) then
        TValue.MakeWithoutCopy(@block.RegXMM[0], AResultType, Result)
      else if (AResultType^.Kind = tkFloat) and (AResultType^.TypeData.FloatType in [ftExtended]) then
        TValue.MakeWithoutCopy(@block.OutFPU, AResultType, Result)
      else
      begin
        if (Result.DataSize <= 16) then
        begin
          CheckHFA(RttiType, True);
        end;

        if RttiType.IsHFA and (Result.DataSize <= 16) then
        begin
          if RttiType.GetHFAElementType.FloatType = ftSingle then
          begin
            for i := 0 to Length(block.RegXMM) - 1 do
            begin
              Move(block.RegXMM[i], sBuf[i * 2], 8);
            end;
            TValue.MakeWithoutCopy(@sBuf[0], AResultType, Result);
          end
          else // Double
          begin
            for i := 0 to Length(block.RegXMM) - 1 do
            begin
              Move(block.RegXMM[i], dBuf[i], SizeOf(Double));
            end;
            TValue.MakeWithoutCopy(@dBuf[0], AResultType, Result);
          end;
        end
        else
          TValue.Make(@block.OutRAX, AResultType, Result);
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

{$ELSEIF Defined(MACOS64)}
const
  MaxXMMRegCount = 8;
type
  PParamBlock = ^TParamBlock;
  TParamBlock = record
    RegXMM: array [0..MaxXMMRegCount - 1] of Double; {XMM0-XMM7}
    RegR: array [0..5] of Int64;    {RDI, RSI, RDX, RCX, R8, R9}
    OutRAX: Int64;
    OutRDX: Int64;
    OutFPU: Extended;
    StackData: PByte;
    StackDataSize: Integer;
  end;

procedure RawInvoke(CodeAddress: Pointer; ParamBlock: PParamBlock);
  external RTLHelperLibName name 'rtti_raw_invoke';

type
  TStackHelper = record
    FBuffer: TArray<Byte>;
    FGrowSize: Cardinal;
    FTop: PByte;
    FSize: Cardinal;
    procedure InternalGrow(ANewSize: Cardinal);
    function CalcAlign(ASize, Align: Cardinal): Cardinal; inline;
    function GetInit: PByte;
  public
    { AGrowSize is the block size used to realloc the internal buffer  }
    class function Create(AGrowSize: Integer = 128): TStackHelper; static;
    { Alloc space in the stack, if Align > 0 the stack will be aligned to the given value
      Returns the previous pointer before to perform the alloc, so it can be used to store data }
    function Alloc(ASize: Cardinal; Align: Cardinal = 0): PByte;
    { Aligns the stack to the given value }
    procedure Align(A: Cardinal);
    { Current Stack Pointer }
    property Top: PByte read FTop;
    { Base Stack Pointer }
    property Init: PByte read GetInit;
    { Total size allocated }
    property Size: Cardinal read FSize write FSize;
  end;

  class function TStackHelper.Create(AGrowSize: Integer): TStackHelper;
  begin
    Result.FTop := nil;
    Result.FSize := 0;
    Result.FGrowSize := AGrowSize;
  end;

  procedure TStackHelper.InternalGrow(ANewSize: Cardinal);
  begin
    if ANewSize > (Length(FBuffer) + FGrowSize) then
      SetLength(FBuffer, ANewSize)
    else
      SetLength(FBuffer, (Length(FBuffer) + FGrowSize));
    FTop := PByte(NativeUInt(@FBuffer[0]) + FSize);
  end;

  function TStackHelper.Alloc(ASize: Cardinal; Align: Cardinal): PByte;
  var
    NewSize: Cardinal;
  begin
    NewSize := CalcAlign(FSize + ASize, Align);
    if NewSize > Length(FBuffer) then
      InternalGrow(NewSize);

    Result := FTop;
    FTop := PByte(NativeUInt(@FBuffer[0]) + NewSize);
    FSize := NewSize;
  end;

  function TStackHelper.CalcAlign(ASize, Align: Cardinal): Cardinal;
  begin
   if Align > 0 then
      Result := (ASize + (Align - 1)) and not (Align - 1)
    else
      Result := ASize; // no align
  end;

  function TStackHelper.GetInit: PByte;
  begin
    Result := @FBuffer[0]
  end;

  procedure TStackHelper.Align(A: Cardinal);
  begin
    Alloc(0, A);
  end;

function Invoke(CodeAddress: Pointer; const Args: TArray<TValue>; CallingConvention: TCallConv; AResultType: PTypeInfo; IsStatic: Boolean = False;
  IsConstructor: Boolean = False ): TValue;

var
  Block: TParamBlock;
  Stack: TStackHelper;
  FreeRRegs, FreeXMMregs: UInt32;
  RttiContext: TRttiContext;

  procedure PutRefArg(const Loc: Pointer); forward;
  procedure PutArg(const Arg: TValue);
  var
    i: Integer;
    DataSize: Integer;
    RttiType: TRttiType;
    Reg: UInt32;
    RegIndex: UInt32;
    NextReg: UInt32;
    NeededRegs: UInt32;
    Offset: Integer;
    tk: TTypeKind;
    src: Pointer;
    dst: Pointer;
  begin
    DataSize := Arg.DataSize;
    RttiType := RttiContext.GetType(Arg.TypeInfo);

    tk := Arg.GetTypeKind;

    // Single / Double
    if (tk = tkFloat) and (Arg.TypeData.FloatType in [ftSingle, ftDouble]) then
    begin
      Reg := AllocReg(FreeXMMregs);
      if Reg <> 0 then
      begin
        Arg.ExtractRawData(@Block.RegXMM[RegFlagToIndex(Reg)]);
        Exit;
      end;
    end
    // Extended
    else if (tk = tkFloat) and (Arg.TypeData.FloatType in [ftExtended]) then
    begin
      Stack.Align(16);
      Arg.ExtractRawDataNoCopy(Stack.Alloc(DataSize, 16));
      Exit;
    end

    // Integer and aggregates
    else if DataSize <= 16 then
    begin
//      CheckHFA(RttiType, False);

      if RttiType.IsHFA then
      begin
        NeededRegs := RttiType.HFAElementCount;
        if RttiType.HFAElementType.FloatType = ftSingle then
          NeededRegs := (NeededRegs + 1) div 2;

        src := Arg.GetReferenceToRawData;
        Offset := 0;
        if RttiType.HFAElementType.FloatType = ftSingle then
        begin
          for i := 0 to NeededRegs - 1 do
          begin
            Reg := AllocReg(FreeXMMregs);
            if Reg <> 0 then
            begin
              RegIndex := RegFlagToIndex(Reg);
              dst := @Block.RegXMM[RegIndex];
            end
            else
              dst := Stack.Alloc(8, 8);
            Move((PByte(src) + Offset)^, dst^, Min(8, DataSize - Offset));
            Inc(Offset, 8);
          end;
        end
        else
        begin
          for i := 0 to NeededRegs - 1 do
          begin
            Reg := AllocReg(FreeXMMregs);
            if Reg <> 0 then
            begin
              RegIndex := RegFlagToIndex(Reg);
              dst := @Block.RegXMM[RegIndex];
            end
            else
              dst := Stack.Alloc(SizeOf(Double), SizeOf(Double));

            Move((PByte(src) + Offset)^, dst^, Min(SizeOf(Double), DataSize - Offset));
            Inc(Offset, SizeOf(Double));
          end;
        end;

        Exit;
      end
      else if (DataSize <= 8) then
      begin
        Reg := AllocReg(FreeRRegs);
        if Reg <> 0 then
        begin
          Arg.ExtractRawDataNoCopy(@Block.RegR[RegFlagToIndex(Reg)]);
          Exit;
        end;
      end
      else
      begin
        Reg := AllocReg(FreeRRegs);
        if Reg <> 0 then
        begin
          NextReg := AllocReg(FreeRRegs);
          if NextReg <> 0 then
          begin
            Arg.ExtractRawDataNoCopy(@Block.RegR[RegFlagToIndex(Reg)]);
            Exit;
          end;
        end;
      end;
    end;
    // No register => stack
    Arg.ExtractRawDataNoCopy(Stack.Alloc(DataSize, 8));
  end;

  procedure PutRefArg(const Loc: Pointer);
  var
    Reg: UInt32;
  begin
    Reg := AllocReg(FreeRRegs);
    if Reg <> 0 then
    begin
      Pointer(Block.RegR[RegFlagToIndex(Reg)]) := Loc;
      Exit;
    end;
    PPointer(Stack.Alloc(SizeOf(Pointer)))^ := Loc;
  end;

var
  i: Integer;
  RttiType: TRttiType;
  IsResultPointer: Boolean;
  sBuf: array [0..15] of UInt32; // for Single HFA result
  dBuf: array [0..7]  of UInt64; // for Double HFA result
begin
  FillChar(Block, SizeOf(Block), 0);
  Stack := TStackHelper.Create;

  FreeRRegs := $3F;
  FreeXMMRegs := $FF;

  RttiContext := TRttiContext.Create;
  try

    IsResultPointer := False;
    if (AResultType <> nil) then
    begin
      TValue.Make(nil, AResultType, Result);
      RttiType := RttiContext.GetType(AResultType);

      IsResultPointer := (CallingConvention <> ccSafeCall)
        and (UseResultPointer(AResultType, IsConstructor, CallingConvention)
        and not (RttiType.IsHFA and (Result.DataSize <= 16)));

      if IsResultPointer then
        PutRefArg(Result.GetReferenceToRawData);
    end
    else
      RttiType := nil;

    for I := 0 to Length(Args) - 1 do
      if PassByRef(Args[I].TypeInfo, CallingConvention) then
        PutRefArg(Args[I].GetReferenceToRawData)
      else
        PutArg(Args[I]);

    if (CallingConvention = ccSafeCall) and (AResultType <> nil)  then
    begin
      TValue.Make(nil, AResultType, Result);
      PutRefArg(Result.GetReferenceToRawData);
    end;

    // If the return parameter is Extended then it will be allocated in FPU stack
    // So put a dummy value to do a check in rtti_raw_invoke
    if (AResultType <> nil) and (AResultType^.Kind = tkFloat) and (AResultType.TypeData.FloatType in [ftExtended]) then
      block.OutFPU := 1;

    // Ensure the stack is aligned to 16
    Stack.Align(16);
    block.StackData := Stack.Init;
    block.StackDataSize := Stack.Size;

    RawInvoke(CodeAddress, @block);

    if (CallingConvention = ccSafeCall) and (HResult(block.OutRAX) < 0) then
      RaiseSafeCallError(HResult(block.OutRAX));

    if AResultType = nil then
      Result := TValue.Empty
    else
    if CallingConvention <> ccSafeCall then
    begin
      if (IsResultPointer) then
        // do nothing
      else
      if (AResultType^.Kind = tkFloat) and (AResultType^.TypeData.FloatType in [ftSingle, ftDouble]) then
        TValue.MakeWithoutCopy(@block.RegXMM[0], AResultType, Result)
      else if (AResultType^.Kind = tkFloat) and (AResultType^.TypeData.FloatType in [ftExtended]) then
        TValue.MakeWithoutCopy(@block.OutFPU, AResultType, Result)
      else
      begin
//        if (Result.DataSize <= 16) then
//        begin
//          CheckHFA(RttiType, True);
//        end;

        if RttiType.IsHFA and (Result.DataSize <= 16) then
        begin
          if RttiType.GetHFAElementType.FloatType = ftSingle then
          begin
            for i := 0 to Length(block.RegXMM) - 1 do
            begin
              Move(block.RegXMM[i], sBuf[i * 2], 8);
            end;
            TValue.MakeWithoutCopy(@sBuf[0], AResultType, Result);
          end
          else // Double
          begin
            for i := 0 to Length(block.RegXMM) - 1 do
            begin
              Move(block.RegXMM[i], dBuf[i], SizeOf(Double));
            end;
            TValue.MakeWithoutCopy(@dBuf[0], AResultType, Result);
          end;
        end
        else
          TValue.Make(@block.OutRAX, AResultType, Result);
      end;
    end;
  finally
    RttiContext.Free;
  end;
end;

{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Missing invocation logic for CPU'}
{$ENDIF}

{$ELSEIF Defined(CPUARM32)} // Raw invocation logic ( 3 of 4 )

type
  PParamBlock = ^TParamBlock;
  TParamBlock = record
    RegCR : array[0..3] of Int32;

    StackData: PByte;
    StackDataSize: Integer;

    case Integer of
      0: ( RegD: array[0..7] of Double );
      1: ( RegS: array[0..15] of Single );
  end;

procedure RawInvoke(CodeAddress: Pointer; ParamBlock: PParamBlock);
  external RTLHelperLibName name {$IFDEF LINUX} '_' + {$ENDIF} 'rtti_raw_invoke';

{$IF not defined(IOS)}
  function AllocEvenReg(var Regs: UInt32): UInt32;
  begin
    Result := AllocReg(Regs);
    // If get a odd reg, alloc a reg again
    //  0002 - R1
    //  0008 - R3
    if (Result and ($2 + $8) <> 0) then
      Result := AllocReg(Regs);
  end;
{$ENDIF !IOS}

function Invoke(CodeAddress: Pointer; const Args: TArray<TValue>;
  CallingConvention: TCallConv; AResultType: PTypeInfo; IsStatic: Boolean; IsConstructor: Boolean): TValue;

  function CalcStackSize: Integer;
  var
    i: Integer;
    FreeCR,
    FreeVFP: Integer;
  begin
    // Estimate maximum stack usage, assuming everything goes
    // on the stack with 4-byte alignment.
    Result := SizeOf(Pointer); // for potential managed return-value
//    FreeCR := 4; // Number of core registers. R0 - R3
    FreeCR := 0; // Number of core registers. R0 - R3
    FreeVFP := 0; // Number of VFP(FP) registers. Default is 0
{$IFDEF ANDROID}
    if CallingConvention in [ccReg] then
      FreeVFP := 8; // D0-D7
{$ENDIF ANDROID}

    for i := 0 to Length(Args) - 1 do
      if PassByRef(Args[i].TypeInfo, CallingConvention) then
      begin
        if FreeCR > 0 then
          Dec(FreeCR) // use core register.
        else
          Inc(Result, SizeOf(Pointer))
      end
      else
      begin
        if Args[i].GetTypeKind = tkFloat then
        begin
          if FreeVFP > 0 then // use VFP register.
            Dec(FreeVFP)
          else
            Inc(Result, SizeOf(Double));
        end
        else if Args[i].GetTypeKind = tkInt64 then
        begin
          if FreeCR >= 2 then // use 2 core registers.
            Dec(FreeCR, 2)
          else if FreeCR = 1 then // use last register and stack
          begin
            FreeCR := 0;
            Inc(Result, SizeOf(Int32));
          end
          else
            Inc(Result, SizeOf(Int64));
        end
        else
        begin
          if (Args[i].DataSize <= 4) and (FreeCR > 0) then
            Dec(FreeCR)
          else
            Inc(Result, Align4(Args[i].DataSize));
        end;
      end;
  end;

const
  regNone = $00;
  regCRAll  = $0F;
  regFPRAll  = $FFFF;

var
  stackData: array of byte;
  block: TParamBlock;
  top: PByte;
  freeCRegs: UInt32;  // 4-core registers (32bit)
  freeFPRegs: UInt32; // 16-Single VFP registers (32bit)
                      //  8-Double VFP registers (64bit)
  src: PByte;

  function AllocDoubleReg: UInt32;
  var
    freeDoubleReg: Uint32;
  begin
    Result := 0;
    freeDoubleReg := freeFPRegs and $55555555; // remove odd FP registers.
    // no free Double register.
    if freeDoubleReg = 0 then Exit;
    // get a free single register at even index.
    Result := not(freeDoubleReg and (freeDoubleReg - 1)) and freeDoubleReg;
    // Remove two Single registers from FreeFPRegs;
    freeFPRegs := freeFPRegs and not( Result or Result shl 1);
  end;

  procedure PutArg(const Arg: TValue);
  var
    dataSize: Integer;
    reg,
    regL, regH: UInt32;
    L32, H32: UInt32;
    U64: UInt64;
  begin
    dataSize := Arg.DataSize;
    if (Arg.GetTypeKind = tkFloat) and (Arg.TypeData.FloatType in [ftSingle, ftDouble, ftExtended]) then
    begin
      if dataSize = 4 then // Single
      begin
        // First, allocate one single VFP register.
        reg := AllocReg(freeFPRegs);
        if reg <> 0 then
        begin
          Arg.ExtractRawData(@block.RegS[RegFlagToIndex(reg)]);
          Exit;
        end;
      end
      else if Arg.DataSize = 8 then // Double and Extended
      begin
        // First, allocate one Double VFP register.
        reg := AllocDoubleReg;
        if reg <> 0 then
        begin
          Arg.ExtractRawData(@block.RegD[RegDoubleFlagToIndex(reg)]);
          Exit;
        end;
      end;
    end
    else if (Arg.GetTypeKind in [tkRecord, tkMRecord]) or (Arg.GetTypeKind = tkArray) then
    begin
      src := Arg.GetReferenceToRawData;
      while datasize > 0 do
      begin
        reg := AllocReg(freeCRegs);
        if reg <> regNone then
        begin
          Move(src^, block.RegCR[RegFlagToIndex(reg)], 4);
        end
        else
        begin
          Move(src^, top^, 4);
          //Inc(top, Align4(dataSize));
          Inc(top, 4);
        end;
        Dec(dataSize, 4);
        Inc(Src, 4);
      end;
      Exit;
    end;

    if (dataSize in [1, 2, 4]) then
    begin
      reg := AllocReg(freeCRegs);
      if reg <> regNone then
      begin
        Arg.ExtractRawDataNoCopy(@block.RegCR[RegFlagToIndex(reg)]);
        Exit;
      end;
      Arg.ExtractRawDataNoCopy(top);
      Inc(top, Align4(dataSize));
    end
    else if dataSize = 8 then // 64bit data
    begin
      // Next, allocate two core register
      {$IFDEF IOS}
      regL := AllocReg(freeCRegs);
      {$ELSE}
      regL := AllocEvenReg(freeCRegs);
      {$ENDIF}
      regH := AllocReg(freeCRegs);
      if (Arg.GetTypeKind = tkFloat) then
      begin
        case Arg.TypeData.FloatType of
          ftSingle,
          ftDouble,
          ftExtended:
            PDouble(@U64)^ := Arg.AsExtended;
          ftComp,
          ftCurr:
            Arg.ExtractRawDataNoCopy(@U64);
        end;
      end
      else
        U64 := Arg.AsUInt64;
      L32 := U64 and $FFFFFFFF;
      H32 := (U64 shr 32) and $FFFFFFFF;
      if regL <> 0 then
      begin
        block.RegCR[ RegFlagToIndex(regL)] := L32;
        if regH <> 0 then
          block.RegCR[ RegFlagToIndex(regH)] := H32
        else // regH = 0;
        begin
          PCardinal(top)^ := H32;
          Inc(top, SizeOf(H32)); // 4
        end;
      end
      else // if regL = 0, regH also 0.
      begin
{$IF not defined(IOS)}
        if ((NativeInt(top) - NativeInt(@stackData[0])) mod 8) <> 0 then
          Inc(top, 4); // Set 8 byte align
{$ENDIF !IOS}
        PCardinal(top)^ := L32;
        Inc(top, SizeOf(L32)); // 4
        PCardinal(top)^ := H32;
        Inc(top, SizeOf(H32)); // 4
      end;
    end
    else
      Assert(False, 'somethig wrong');
  end;

  procedure PutRefArg(const Loc: Pointer);
  var
    reg: UInt32;
  begin
    reg := AllocReg(freeCRegs);
    if reg <> regNone then
    begin
      block.RegCR[ RegFlagToIndex(reg)] := UInt32(Loc);
      Exit;
    end;
    PPointer(top)^ := Loc;
    Inc(top, SizeOf(Pointer));
  end;

var
  i : integer;
begin
  FillChar(block, SizeOf(block), 0);
  SetLength(stackData, CalcStackSize);
  top := @stackData[0];

  freeCRegs := regCRAll;
  freeFPRegs := regNone;
{$IF not defined(ARM_NO_VFP_USE)}
  if CallingConvention in [ccReg] then
    freeFPRegs := regFPRAll;
{$ENDIF !ARM_NO_VFP_USE}

  if IsStatic then
  begin
    if (CallingConvention <> ccSafeCall) and UseResultPointer(AResultType, IsConstructor, CallingConvention) then
    begin
      TValue.Make(nil, AResultType, Result);
      PutRefArg(Result.GetReferenceToRawData);
    end;

    if Length(Args) > 0 then
      if PassByRef(Args[0].TypeInfo, CallingConvention) then
        PutRefArg(Args[0].GetReferenceToRawData)
      else
        PutArg(Args[0]);
  end
  else
  begin // not IsStatic / It class method

    // Put result first.
    if (CallingConvention <> ccSafeCall) and UseResultPointer(AResultType, IsConstructor, CallingConvention) then
    begin
      TValue.Make(nil, AResultType, Result);
      PutRefArg(Result.GetReferenceToRawData);
    end;

    // First arg is "self". place to 2nd.
    if Length(Args) > 0 then
      if PassByRef(Args[0].TypeInfo, CallingConvention) then
        PutRefArg(Args[0].GetReferenceToRawData)
      else
        PutArg(Args[0]);
  end;

  for i := 1 to Length(Args) - 1 do
    if PassByRef(Args[i].TypeInfo, CallingConvention) then
      PutRefArg(Args[i].GetReferenceToRawData)
    else
      PutArg(Args[i]);

  if (CallingConvention = ccSafeCall) and (AResultType <> nil)  then
  begin
    TValue.Make(nil, AResultType, Result);
    PutRefArg(Result.GetReferenceToRawData);
  end;

  block.StackData := @stackData[0];
  block.StackDataSize := top - PByte(@stackData[0]);

// From http://infocenter.arm.com/help/topic/com.arm.doc.ihi0042f/IHI0042F_aapcs.pdf
// 5.2.1.2 Stack constraints at a public interface
// The stack must also conform to the following constraint at a public interface:
//   SP mod 8 = 0. The stack must be double-word aligned.
//
// But for IOS: https://developer.apple.com/library/ios/documentation/Xcode/Conceptual/iPhoneOSABIReference/Articles/ARMv6FunctionCallingConventions.html
// The stack is 4-byte aligned at the point of function calls.
{$IF not defined(IOS)}
  if (block.StackDataSize mod 8) <> 0 then
    Inc(block.StackDataSize, 4); // Set 8 byte align
{$ENDIF !IOS}

  RawInvoke(CodeAddress, @block);

  if (CallingConvention = ccSafeCall) and (block.RegCR[0] < 0)  then
    RaiseSafeCallError(block.RegCR[0]);

  if AResultType = nil then
    Result := TValue.Empty
  else
  if CallingConvention <> ccSafeCall then
  begin
    if UseResultPointer(AResultType, IsConstructor, CallingConvention) then
      // do nothing
{$IF not defined(ARM_NO_VFP_USE)}
    else if (CallingConvention = ccReg) and
            (AResultType^.Kind = tkFloat) and
            (AResultType.TypeData.FloatType in [ftSingle, ftDouble, ftExtended]) then
      TValue.MakeWithoutCopy(@block.RegD[0], AResultType, Result)
{$ENDIF !ARM_NO_VFP_USE}
    else
      TValue.Make(@block.RegCR[0], AResultType, Result);
  end;
end;

{$ELSEIF Defined(CPUARM64)} // Raw invocation logic ( 4 of 4 )
type
  m128 = record
    case Integer of
      1: (Lo, Hi: UInt64);
      2: (LL, LH, HL, HH: UInt32);
  end align 16;

  PParamBlock = ^TParamBlock;
  TParamBlock = record
    RegX : array[0..7] of Int64;
    RegQ : array[0..7] of m128;
    RegX8: Int64;
    StackData: PByte;
    StackDataSize: Integer;
  end;

procedure RawInvoke(CodeAddress: Pointer; ParamBlock: PParamBlock);
  external RTLHelperLibName name 'rtti_raw_invoke';

function Invoke(CodeAddress: Pointer; const Args: TArray<TValue>;
  CallingConvention: TCallConv; AResultType: PTypeInfo; IsStatic: Boolean; IsConstructor: Boolean): TValue;

  function CalcStackSize: Integer;
  begin
    // Estimate maximum stack usage, assuming everything goes
    // on the stack with 16-bytes (SP mod 16 = 0) at public interface (CPPABI64 5.2.2.2)
    Result := SizeOf(Pointer); // for potential managed return-value
    // Dymmy allocation
    Result := Result + 128;
    Result := Align16(Result);
  end;

var
  ctx: TRTTIContext;
  stackData: array of byte;
  block: TParamBlock;
  top: PByte;
  nextGR: Integer;  // Next General-purpose Register Number. 8 (64bits) registers are avaulable.
  nextFR: Integer;  // Next Floating-point Register Number. 8 (128bits) registers are avaulable.
const
  maxRegister = 8;

  procedure PutArg(const Arg: TValue);
  var
    dataSize: Integer;
    i: Integer;
    src: PByte;
    T: TRttiType;
  begin
    dataSize := Arg.DataSize;
    T := ctx.GetType(Arg.TypeInfo);
    if (Arg.GetTypeKind = tkFloat) and (Arg.TypeData.FloatType in [ftSingle, ftDouble, ftExtended]) then
    begin
      Arg.ExtractRawData(@block.RegQ[nextFR]);
      Inc(nextFR);
      Exit;
    end
    else if T.IsHFA then
    begin
      src := Arg.GetReferenceToRawData;
      if nextFR + T.HFAElementCount <= maxRegister then
      begin
        if T.HFAElementType.FloatType = ftSingle then
        begin
          Assert(T.HFAElementType.TypeSize = sizeof(Single));
          Assert(SizeOf(Cardinal) = sizeof(Single));
          for i := 0 to T.HFAElementCount - 1 do
            block.RegQ[nextFR + i].LL := PCardinal(src + i * SizeOf(Single))^;
        end
        else
        begin
          Assert(T.HFAElementType.TypeSize = sizeof(Double));
          Assert(SizeOf(UInt64) = sizeof(Double));
          for i := 0 to T.HFAElementCount - 1 do
            block.RegQ[nextFR + i].Lo := PUInt64(src + i * SizeOf(Double))^;
        end;
        Inc(nextFR, T.HFAElementCount);
      end
      else
      begin
        nextFR := maxRegister;
        Move(src^, top^, T.HFAElementType.TypeSize * T.HFAElementCount);
        Inc(top, T.HFAElementType.TypeSize * T.HFAElementCount);
      end;
    end
    else if (Arg.GetTypeKind in [tkRecord, tkMRecord]) then
    begin
      src := Arg.GetReferenceToRawData;
      while datasize > 0 do
      begin
        if nextGR < maxRegister then
        begin
          Move(src^, block.RegX[nextGR], 8);
          Inc(nextGR);
        end
        else
        begin
          Move(src^, top^, 8);
          Inc(top, 8);
        end;
        Dec(dataSize, 8);
        Inc(Src, 8);
      end;
      Exit;
    end;

    if (dataSize in [1, 2, 4, 8]) then
    begin
      if nextGR < maxRegister then
      begin
        Arg.ExtractRawDataNoCopy(@block.RegX[nextGR]);
        Inc(nextGR);
      end
      else
      begin
        if dataSize = 8 then
          top := PByte((NativeUInt(top) + 7) and not 7)
        else if dataSize = 4 then
          top := PByte((NativeUInt(top) + 3) and not 3)
        else if dataSize = 2 then
          top := PByte((NativeUInt(top) + 1) and not 1);
        Arg.ExtractRawDataNoCopy(top);
        Inc(top, datasize);
      end;
    end
  end;

  procedure PutRefArg(const Loc: Pointer);
  begin
    if nextGR < maxRegister then
    begin
      block.RegX[nextGR] := UIntPtr(Loc);
      Inc(nextGR);
      Exit;
    end;
    PPointer(top)^ := Loc;
    Inc(top, SizeOf(Pointer));
  end;

var
  i : integer;
  T: TRttiType;
  sBuf: array of UInt32; // for Single HFA result
  dBuf: array of UInt64; // for Double HFA result
begin
  FillChar(block, SizeOf(block), 0);
  SetLength(stackData, CalcStackSize);
  top := @stackData[0];
  nextGR := 0;
  nextFR := 0;
  if IsStatic then
  begin
    // Put result first.
    if (CallingConvention <> ccSafeCall) and UseResultPointer(AResultType, IsConstructor, CallingConvention) then
    begin
      TValue.Make(nil, AResultType, Result);
      block.RegX8 := UIntPtr(Result.GetReferenceToRawData);
    end;
  end
  else
  begin // not IsStatic / class method
    // Put result first.
    if (CallingConvention <> ccSafeCall) and UseResultPointer(AResultType, IsConstructor, CallingConvention) then
    begin
      TValue.Make(nil, AResultType, Result);
      block.RegX8 := UIntPtr(Result.GetReferenceToRawData);
    end;
    // First arg is "self". place to 2nd.
  end;

  for i := 0 to Length(Args) - 1 do
  begin
    if PassByRef(Args[i].TypeInfo, CallingConvention) then
      PutRefArg(Args[i].GetReferenceToRawData)
    else
      PutArg(Args[i]);
  end;

  if (CallingConvention = ccSafeCall) and (AResultType <> nil)  then
  begin
    TValue.Make(nil, AResultType, Result);
    PutRefArg(Result.GetReferenceToRawData)
  end;

  block.StackData := @stackData[0];
  block.StackDataSize := Align16(top - PByte(@stackData[0]));
  RawInvoke(CodeAddress, @block);

  if (CallingConvention = ccSafeCall) and (HResult(block.RegX[0]) < 0)  then
    RaiseSafeCallError(HResult(block.RegX[0]));
  if AResultType = nil then
    Result := TValue.Empty
  else
  if CallingConvention <> ccSafeCall then
  begin
    T := ctx.GetType(AResultType);

    if UseResultPointer(AResultType, IsConstructor, CallingConvention) then
      // do nothing
    else if (AResultType^.Kind = tkFloat) and
            (AResultType.TypeData.FloatType in [ftSingle, ftDouble, ftExtended]) then
      TValue.MakeWithoutCopy(@block.RegQ[0], AResultType, Result)
    else if T.IsHFA then
    begin
      if T.GetHFAElementType.FloatType = ftSingle then
      begin
        SetLength(sBuf, 4);
        sBuf[0] := block.RegQ[0].LL;
        sBuf[1] := block.RegQ[1].LL;
        sBuf[2] := block.RegQ[2].LL;
        sBuf[3] := block.RegQ[3].LL;
        TValue.MakeWithoutCopy(@sBuf[0], AResultType, Result)
      end
      else // Double
      begin
        SetLength(dBuf, 4);
        dBuf[0] := block.RegQ[0].Lo;
        dBuf[1] := block.RegQ[1].Lo;
        dBuf[2] := block.RegQ[2].Lo;
        dBuf[3] := block.RegQ[3].Lo;
        TValue.MakeWithoutCopy(@dBuf[0], AResultType, Result)
      end;
    end
    else
      TValue.Make(@block.RegX[0], AResultType, Result);
  end;
end;

{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Missing invocation logic for CPU'}
{$ENDIF}

{ TRttiMethod }

destructor TRttiMethod.Destroy;
begin
  if FInvokeInfo <> nil then
    FInvokeInfo.Free;
  inherited;
end;

function TRttiMethod.CreateImplementation(AUserData: Pointer;
  const ACallback: TMethodImplementationCallback): TMethodImplementation;
begin
  Result := TMethodImplementation.Create(AUserData, GetInvokeInfo, ACallback);
end;

function TRttiMethod.GetCodeAddress: Pointer;
begin
  Result := nil;
end;

function TRttiMethod.GetDispatchKind: TDispatchKind;
begin
  Result := dkStatic;
end;

function TRttiMethod.GetHasExtendedInfo: Boolean;
begin
  Result := False;
end;

function TRttiMethod.GetInvokeInfo: TMethodImplementation.TInvokeInfo;
var
  p: TRttiParameter;
  Info: TMethodImplementation.TInvokeInfo;
begin
  if FInvokeInfo <> nil then
    Exit(FInvokeInfo);

  Info := TMethodImplementation.TInvokeInfo.Create(CallingConvention, not IsStatic);
  try
    if not IsStatic then
      if IsClassMethod then
        Info.AddParameter(TypeInfo(TClass), False, True)
      else
        Info.AddParameter(Parent.Handle, False, True);

    for p in GetParameters do
      if p.ParamType = nil then
        Info.AddParameter(nil, True, True)
      else
      begin
        // Two general cases for byref arguments:
        // const args that are large
        // and explicit byref (var or out).
        // Special case for x86, const Variant for cdecl and stdcall
        Info.AddParameter(p.ParamType.Handle,
          ([pfVar, pfOut] * p.Flags <> []) or
          PassByRef(p.ParamType.Handle, CallingConvention, pfConst in p.Flags),
          pfConst in p.Flags);
      end;

    if ReturnType <> nil then
      Info.ReturnType := ReturnType.Handle;
    Info.Seal;

    if AtomicCmpExchange(Pointer(FInvokeInfo), Pointer(Info), nil) = nil then
      Pointer(Info) := nil // for ARC-based plaforms this will ensure the local var doesn't affect the refcount
    else
      Info.Free;
  except
    Info.Free;
    raise;
  end;
  Result := FInvokeInfo;
end;

function TRttiMethod.GetIsClassMethod: Boolean;
begin
  Result := HasExtendedInfo and (MethodKind in [mkClassProcedure,
    mkClassFunction, mkClassConstructor, mkClassDestructor]);
end;

function TRttiMethod.GetIsConstructor: Boolean;
begin
  Result := HasExtendedInfo and (MethodKind = mkConstructor);
end;

function TRttiMethod.GetIsDestructor: Boolean;
begin
  Result := HasExtendedInfo and (MethodKind = mkDestructor);
end;

function TRttiMethod.GetIsStatic: Boolean;
begin
  Result := False;
end;

function TRttiMethod.GetVirtualIndex: Smallint;
begin
  Result := 0;
end;

function TRttiMethod.Invoke(Instance: TObject; const Args: array of TValue): TValue;
begin
  Result := DispatchInvoke(Instance, Args);
end;

function TRttiMethod.Invoke(Instance: TClass; const Args: array of TValue): TValue;
begin
  Result := DispatchInvoke(Instance, Args);
end;

function TRttiMethod.Invoke(Instance: TValue; const Args: array of TValue): TValue;
begin
  Result := DispatchInvoke(Instance, Args);
end;

function TRttiMethod.ToString: string;
const
  Kind: array[Boolean] of string = ('function ', 'procedure '); // do not localize
var
  paramList: TArray<TRttiParameter>;
  i: Integer;
begin
  Result := '';
  if not HasExtendedInfo then
  begin
    Result := '(basic) procedure ' + Name; // do not localize
    Exit;
  end;

  if IsClassMethod then
    Result := Result + 'class '; // do not localize

  if IsConstructor then
    Result := Result + 'constructor ' + Name // do not localize
  else if IsDestructor then
    Result := Result + 'destructor ' + Name // do not localize
  else if MethodKind = mkOperatorOverload then
    Result := Result + 'operator ' + Name // do not localize
  else
    Result := Result + Kind[ReturnType = nil] + Name;
  paramList := GetParameters;
  if Length(paramList) > 0 then
    Result := Result + '(';
  for i := 0 to Length(paramList) - 1 do
  begin
    if i > 0 then
      Result := Result + '; ';
    Result := Result + paramList[i].ToString;
  end;
  if Length(paramList) > 0 then
    Result := Result + ')';
  if ReturnType <> nil then
  begin
    Result := Result + ': ' + ReturnType.Name;
  end;
end;

{ TRttiParameter }

function TRttiParameter.ToString: string;
begin
  if pfOut in Flags then
    Result := 'out ' // do not localize
  else if pfConst in Flags then
    Result := 'const ' // do not localize
  else if pfVar in Flags then
    Result := 'var ' // do not localize
  else
    Result := '';
  Result := Result + Name;
  if ParamType <> nil then
    Result := Result + ': ' + ParamType.ToString;
end;

{ TRttiInstMethParameter }

constructor TRttiInstMethParameter.Create(APackage: TRttiPackage; AParent: TRttiObject;
  var P: PByte);
begin
  inherited;
  Self.FFlags := TParamFlags(ReadU8(P));
  Self.FParamType := DerefPointer(ReadPointer(P));
  Self.FLocation := ReadU16(P);
  Self.FName := ReadShortString(P);
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiInstMethParameter.GetName: string;
begin
  Result := FName;
end;

function TRttiInstMethParameter.GetFlags: TParamFlags;
begin
  Result := FFlags;
end;

function TRttiInstMethParameter.GetParamType: TRttiType;
begin
  Result := Pool.GetType(FParamType);
end;

{ TRttiMember }

function TRttiMember.GetParent: TRttiType;
begin
  Result := TRttiType(inherited Parent);
end;

function TRttiMember.GetVisibility: TMemberVisibility;
begin
  Result := mvPublic;
end;

{ TRttiField }

function TRttiField.GetFieldType: TRttiType;
begin
  Result := nil;
end;

function TRttiField.GetOffset: Integer;
begin
  Result := -MaxInt - 1;
end;

function TRttiField.GetValue(Instance: Pointer): TValue;
var
  ft: TRttiType;
begin
  ft := FieldType;
  if ft = nil then
    raise InsufficientRtti;
  TValue.Make(PByte(Instance) + Offset, ft.Handle, Result);
end;

procedure TRttiField.SetValue(Instance: Pointer; const AValue: TValue);
var
  ft: TRttiType;
begin
  ft := FieldType;
  if ft = nil then
    raise InsufficientRtti;
  AValue.Cast(ft.Handle).ExtractRawData(PByte(Instance) + Offset);
end;

function TRttiField.ToString: string;
var
  ft: TRttiType;
begin
  ft := FieldType;
  if ft = nil then
    Result := Name + ' @ ' + IntToHex(Offset, 2)
  else
    Result := Name + ': ' + ft.Name + ' @ ' + IntToHex(Offset, 2);
end;

{ TRttiInstanceFieldClassic }

constructor TRttiInstanceFieldClassic.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte(Handle.AttrData);
end;

function TRttiInstanceFieldClassic.GetName: string;
begin
  Result := Handle.NameFld.ToString;
end;

function TRttiInstanceFieldClassic.GetHandle: PVmtFieldEntry;
begin
  Result := inherited Handle;
end;

function TRttiInstanceFieldClassic.GetFieldType: TRttiType;
begin
  Result := Pool.GetType(Parent.FClassTab^.ClassRef[Handle^.TypeIndex]^);
end;

function TRttiInstanceFieldClassic.GetOffset: Integer;
begin
  Result := Handle^.FieldOffset;
end;

function TRttiInstanceFieldClassic.GetParent: TRttiInstanceType;
begin
  Result := TRttiInstanceType(inherited Parent);
end;

{ TRttiInstanceFieldEx }

constructor TRttiInstanceFieldEx.Create(APackage: TRttiPackage; AParent: TRttiObject;
  var P: PByte);
begin
  inherited;
  P := PByte( Handle.AttrData );
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiInstanceFieldEx.GetName: string;
begin
  Result := Handle.NameFld.ToString;
end;

function TRttiInstanceFieldEx.GetHandle: PFieldExEntry;
begin
  Result := inherited Handle;
end;

function TRttiInstanceFieldEx.GetOffset: Integer;
begin
  Result := Handle^.Offset;
end;

function TRttiInstanceFieldEx.GetFieldType: TRttiType;
begin
  Result := Pool.TypeOrNil(Handle^.TypeRef);
end;

function TRttiInstanceFieldEx.GetVisibility: TMemberVisibility;
begin
  Result := TMemberVisibility(GetBitField(Handle^.Flags, ffVisibilityShift, ffVisibilityBits));
end;

{ TRttiSetType }

constructor TRttiSetType.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte(@TypeData^.CompType) + SizeOf(TypeData^.CompType);
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiSetType.GetElementType: TRttiType;
begin
  Result := Pool.TypeOrNil(TypeData^.CompType);
end;

function TRttiSetType.GetTypeSize: Integer;
begin
  Result := SizeOfSet(PTypeInfo(Handle));
end;

function TRttiSetType.GetByteOffset: Integer;
begin
  Result := ByteOffsetOfSet(PTypeInfo(Handle));
end;

type
  TRttiIntfMethParameter = class(TRttiParameter)
  private
    FName: string;
    FFlags: TParamFlags;
    FParamType: PPTypeInfo;
    function GetName: string; override;
    function GetFlags: TParamFlags; override;
    function GetParamType: TRttiType; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
  public
  end;

  TRttiIntfMethod = class(TRttiMethod)
  private
    FTail: PIntfMethodEntryTail;
    FParameters: TArray<TRttiParameter>;
    FReturnType: PTypeInfo;
    FVirtualIndex: Integer;
    function GetMethodKind: TMethodKind; override;
    function GetCallingConvention: TCallConv; override;
    function GetReturnType: TRttiType; override;
    function GetHasExtendedInfo: Boolean; override;
    function GetVirtualIndex: Smallint; override;
    function GetDispatchKind: TDispatchKind; override;
    constructor Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte); override;
    function GetHandle: PIntfMethodEntry;
    function GetTailHandle: PIntfMethodEntryTail;
    function GetName: string; override;
    function DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue; override;
  public
    property Handle: PIntfMethodEntry read GetHandle;
    property TailHandle: PIntfMethodEntryTail read GetTailHandle;
    function GetParameters: TArray<TRttiParameter>; override;
  end;

{ TRttiInterfaceType }

constructor TRttiInterfaceType.Create(APackage: TRttiPackage; AParent: TRttiObject;
  var P: PByte);

  procedure GetMethods(var P: PByte);
  var
    i, hasRtti, methCnt, index: Integer;
  begin
    if BaseType <> nil then
      index := BaseType.FTotalMethodCount
    else
      index := 0;
    methCnt := ReadU16(P);
    FTotalMethodCount := index + methCnt;
    hasRtti := ReadU16(P);
    if hasRtti = $FFFF then
      Exit;
    SetLength(FMethods, methCnt);
    for i := 0 to methCnt - 1 do
    begin
      FMethods[i] := Package.ReadObject(TRttiIntfMethod, Self, P) as TRttiIntfMethod;
      TRttiIntfMethod(FMethods[i]).FVirtualIndex := index;
      Inc(index);
    end;
  end;

begin
  inherited;
  P := @TypeData^.IntfUnit;
  P := _SkipShortString(P);

  GetMethods(P);
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiInterfaceType.GetIntfFlags: TIntfFlags;
begin
  Result := TypeData^.IntfFlags;
end;

function TRttiInterfaceType.GetDeclaringUnitName: string;
begin
  Result :=  TypeData^.IntfUnitFld.ToString;
end;

function TRttiInterfaceType.GetBaseType: TRttiType;
begin
  Result := GetBaseTyped;
end;

function TRttiInterfaceType.GetBaseTyped: TRttiInterfaceType;
begin
  Result := Pool.TypeOrNil(TypeData^.IntfParent) as TRttiInterfaceType;
end;

function TRttiInterfaceType.GetGUID: TGUID;
begin
  Result := TypeData^.Guid;
end;

function TRttiInterfaceType.GetDeclaredMethods: TArray<TRttiMethod>;
begin
  Result := TArrayHelper.Concat<TRttiMethod>([FMethods]);
end;

{ TRttiIntfMethParameter }

constructor TRttiIntfMethParameter.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
begin
  inherited;
  FFlags := TParamFlags(ReadU8(P));
  FName := ReadShortString(P);
  P := _SkipShortString(P);
  FParamType := PPTypeInfo(ReadPointer(P));
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiIntfMethParameter.GetName: string;
begin
  Result := FName;
end;

function TRttiIntfMethParameter.GetFlags: TParamFlags;
begin
  Result := FFlags;
end;

function TRttiIntfMethParameter.GetParamType: TRttiType;
begin
  Result := Pool.TypeOrNil(FParamType);
end;

{ TRttiIntfMethod }

constructor TRttiIntfMethod.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
var
  i: Integer;
begin
  inherited;
  FTail := Handle.Tail;
  P := PByte(FTail);
  Inc(P, SizeOf(FTail^));
  // Due to mess of interface method table, we have little choice but to
  // read it all in right now.
  SetLength(FParameters, FTail^.ParamCount - 1);
  // Skip first parameter (Self) - not needed
  Package.ReadObject(TRttiIntfMethParameter, Self, P);
  for i := 0 to Length(FParameters) - 1 do
    FParameters[i] := Package.ReadObject(TRttiIntfMethParameter, Self, P) as TRttiParameter;
  if MethodKind = mkFunction then
  begin
    if P^ = 0 then
      Inc(P)
    else
    begin
      P := _SkipShortString(P);
      FReturnType := DerefPointer(ReadPointer(P));
    end;
  end;
  FAttributeGetter := LazyLoadAttributes(P);
end;

function TRttiIntfMethod.GetHandle: PIntfMethodEntry;
begin
  Result := inherited Handle;
end;

function TRttiIntfMethod.GetTailHandle: PIntfMethodEntryTail;
begin
  Result := FTail;
end;

function TRttiIntfMethod.GetName: string;
begin
  Result := Handle.NameFld.ToString;
end;

function TRttiIntfMethod.GetMethodKind: TMethodKind;
begin
  if FTail^.Kind = 0 then
    Result := mkProcedure
  else
    Result := mkFunction;
end;

function TRttiIntfMethod.GetCallingConvention: TCallConv;
begin
  Result := FTail^.CC;
end;

function TRttiIntfMethod.GetReturnType: TRttiType;
begin
  Result := Pool.GetType(FReturnType);
end;

function TRttiIntfMethod.GetHasExtendedInfo: Boolean;
begin
  Result := True;
end;

function TRttiIntfMethod.GetVirtualIndex: Smallint;
begin
  Result := FVirtualIndex;
end;

function TRttiIntfMethod.GetDispatchKind: TDispatchKind;
begin
  Result := dkInterface;
end;

function TRttiIntfMethod.DispatchInvoke(Instance: TValue; const Args: array of TValue): TValue;
var
  code: Pointer;
  argCount: Integer;
  argList: TArray<TValue>;
  parList: TArray<TRttiParameter>;
  i, currArg: Integer;
  inst: PPVtable;
begin
  parList := GetParameters;
  if Length(Args) <> Length(parList) then
    raise EInvocationError.CreateRes(@SParameterCountMismatch);

  argCount := Length(Args);
  SetLength(argList, argCount + 1);

  currArg := 0;
  inst := PPVtable(Instance.AsInterface);
  PushSelfFirst(CallingConvention, argList, currArg, Instance);

  for i := 0 to Length(Args) - 1 do
  begin
    PassArg(parList[i], Args[i], argList[currArg], CallingConvention);
    Inc(currArg);
  end;

  Assert(DispatchKind = dkInterface);
  code := inst^^[FVirtualIndex];
  CheckCodeAddress(code); // should never happen, I believe

  PushSelfLast(CallingConvention, argList, currArg, Instance);

  if ReturnType <> nil then
    Result := System.Rtti.Invoke(code, argList, CallingConvention, ReturnType.Handle)
  else
    Result := System.Rtti.Invoke(code, argList, CallingConvention, nil);
end;

function TRttiIntfMethod.GetParameters: TArray<TRttiParameter>;
begin
  Result := TArrayHelper.Concat<TRttiParameter>([FParameters]);
end;

{ TOrphanPackage }

constructor TOrphanPackage.Create;
begin
  FPackage := nil;
  FParent := nil;
  FHandle := Pointer(-1);
  FLock := TObject.Create;
  FHandleToObject := TObjectDictionary<Pointer,TRttiObject>.Create([doOwnsValues]);
end;

function TOrphanPackage.FindType(const AQualifiedName: string): TRttiType;
begin
  Result := nil;
end;

function TOrphanPackage.GetName: string;
begin
  Result := '(orphan package)';
end;

function TOrphanPackage.GetTypes: TArray<TRttiType>;
begin
  SetLength(Result, 0);
end;

{ TRealPackage }

constructor TRealPackage.Create(APackage: TRttiPackage; AParent: TRttiObject; var P: PByte);
var
  lib: PLibModule;
  pinfo: GetPackageInfoTable;
{$IFDEF POSIX}
  dlinfo: dl_info;
{$ENDIF POSIX}
begin
  // invariant: P = PLibModule for this package
  lib := PLibModule(P);
  // Make our Handle refer to HInstance rather than LibModule
  P := Pointer(lib^.Instance);
  inherited;
  FLock := TObject.Create;
  FTypeInfo := lib^.TypeInfo;
  if FTypeInfo = nil then
  begin
    pinfo := GetProcAddress(lib^.Instance, PackageInfoFuncName);
    FTypeInfo := @pinfo^.TypeInfo;
  end;
  {$IFDEF MSWINDOWS}
  FBaseAddress := Pointer(lib^.Instance);
  {$ENDIF MSWINDOWS}
  {$IFDEF POSIX}
  dladdr(UIntPtr(FTypeInfo), dlinfo);
  FBaseAddress := dlinfo.dli_fbase;
  {$ENDIF POSIX}
  FHandleToObject := TObjectDictionary<Pointer,TRttiObject>.Create([doOwnsValues]);
end;

destructor TRealPackage.Destroy;
begin
  FNameToType.Free;
  FTypeToName.Free;
  inherited;
end;

function TRealPackage.FindType(const AQualifiedName: string): TRttiType;
var
  h: PTypeInfo;
  o: TRttiObject;
begin
  MakeTypeLookupTable;
  if not FNameToType.TryGetValue(AQualifiedName, h) then
    Exit(nil);

  TMonitor.Enter(Flock);
  try
    if FHandleToObject.TryGetValue(h, o) then
      Exit(o as TRttiType);
  finally
    TMonitor.Exit(Flock);
  end;
  Result := ReadObjectPointer(TRttiType, nil, h) as TRttiType;
end;

function TRealPackage.GetName: string;
begin
  Result := GetModuleName(Handle);
end;

function TRealPackage.GetTypes: TArray<TRttiType>;

  function GetType(ATypeInfo: Pointer): TRttiType;
  begin
    if ATypeInfo = nil then
      Exit(nil);
    Result := TRttiType(ReadObjectPointer(TRttiType, nil, ATypeInfo));
  end;

var
  i, valid: Integer;
begin
  valid := 0;
  for i := 0 to FTypeInfo^.TypeCount - 1 do
    if (FTypeInfo^.TypeTable^[i] <> nil) and (NativeInt(FTypeInfo^.TypeTable^[i]) <> 1)
      and (PPointer(FTypeInfo^.TypeTable^[i])^ <> nil) then
      Inc(valid);
  SetLength(Result, valid);

  valid := 0;
  for i := 0 to FTypeInfo^.TypeCount - 1 do
    if (FTypeInfo^.TypeTable^[i] <> nil) and (NativeInt(FTypeInfo^.TypeTable^[i]) <> 1)
      and (PPointer(FTypeInfo^.TypeTable^[i])^ <> nil) then
    begin
      Result[valid] := GetType(PPTypeInfo(FTypeInfo^.TypeTable^[i])^);
      Inc(valid);
    end;
end;

function TRealPackage.GetNameFromType(AType: TRttiType): string;
begin
  MakeTypeLookupTable;
  FTypeToName.TryGetValue(AType.Handle, Result);
end;

procedure TRealPackage.MakeTypeLookupTable;
  function GetUnits: TArray<string>;
  var
    p: PByte;
    i: Integer;
  begin
    SetLength(Result, FTypeInfo^.UnitCount);
    p := Pointer(FTypeInfo^.UnitNames);
    for i := 0 to FTypeInfo^.UnitCount - 1 do
      Result[i] := ReadShortString(p);
  end;

  procedure DoMake;
  var
    units: TArray<string>;
    typeIter: PPTypeInfo;
    currUnit: Integer;
    typeName: string;
    i: Integer;
    nameToType: TDictionary<string,PTypeInfo>;
  begin
    TMonitor.Enter(Flock);
    try
      if FNameToType <> nil then // presumes double-checked locking ok
        Exit;

      units := GetUnits;
      currUnit := 0;
      nameToType := nil;
      try
        nameToType := TDictionary<string,PTypeInfo>.Create;
        FTypeToName := TDictionary<PTypeInfo,string>.Create;
        for i := 0 to FTypeInfo^.TypeCount - 1 do
        begin
          typeIter := FTypeInfo^.TypeTable^[i];
          if typeIter = nil then
            Continue;
          if IntPtr(typeIter) = 1 then
          begin
            // inter-unit boundary
            Inc(currUnit);
            Continue;
          end;
          if typeIter^ = nil then // linker broke or fixup eliminated.
            Continue;
          typeName := units[currUnit] + '.' + typeIter^^.NameFld.ToString;

          if not nameToType.ContainsKey(typeName) then
            nameToType.Add(typeName, typeIter^);
          if not FTypeToName.ContainsKey(typeIter^) then
            FTypeToName.Add(typeIter^, typeName);
        end;
      except
        nameToType.Free;
        FreeAndNil(FTypeToName);
        raise;
      end;

      FNameToType := nameToType;
    finally
      TMonitor.Exit(Flock);
    end;
  end;

begin
  if FNameToType <> nil then
    Exit;
  DoMake;
end;


{ TMethodImplementation.TInvokeInfo }

constructor TMethodImplementation.TInvokeInfo.Create(ACallConv: TCallConv; AHasSelf: Boolean);
begin
  FParamList := TList<TMethodImplementation.TParamLoc>.Create;
  FCallConv := ACallConv;
  FHasSelf := AHasSelf;
end;

destructor TMethodImplementation.TInvokeInfo.Destroy;
begin
  FParamList.Free;
  inherited;
end;

procedure TMethodImplementation.TInvokeInfo.AddParameter(AType: PTypeInfo;
  AByRef, AConstant: Boolean);
begin
  CheckNotSealed;
  FParamList.Add(TParamLoc.Create(AType, AByRef, AConstant));
end;

procedure TMethodImplementation.TInvokeInfo.CheckNotSealed;
begin
  Assert(FParamList <> nil, 'InvokeInfo is sealed');
end;

function TMethodImplementation.TInvokeInfo.LoadArguments(AFrame: PInterceptFrame): TArray<TValue>;
var
  i: Integer;
  locs: TArray<TParamLoc>;
begin
  locs := GetParamLocs;
  SetLength(Result, Length(locs));
  for i := 0 to Length(locs) - 1 do
    locs[i].GetArg(AFrame, Result[i]);
end;

procedure TMethodImplementation.TInvokeInfo.SaveArguments(AFrame: PInterceptFrame;
  const Args: TArray<TValue>; const Result: TValue);
var
  i: Integer;
  locs: TArray<TParamLoc>;
begin
  locs := GetParamLocs;
  for i := 0 to Length(locs) - 1 do
    if locs[i].FByRefParam and not locs[i].FConstant then
      locs[i].SetArg(AFrame, Args[i]);
  // Note: on x64, The RCX slot is overloaded for RAX for the result.
  // Because of this, byref arguments must be saved before the result overwrites this
  if FReturnType <> nil then
    FResultLoc.SetArg(AFrame, Result.Cast(FReturnType));
{$IF defined(CPUX64) and defined(Linux64)}
  // This flag will be checked in rtti_raw_intercept
  if FResultFP in [ftExtended, ftCurr] then
    AFrame^.UseFPU := 1
  else
    AFrame^.UseFPU := 0;
{$ENDIF}
{$IFDEF CPUX86}
  AFrame^.FP.Kind := FResultFP;
{$ENDIF CPUX86}
end;

function GetParamSize(TypeInfo: PTypeInfo): Integer;
begin
  if TypeInfo = nil then
    Exit(0);

  case TypeInfo^.Kind of
    tkInteger, tkEnumeration, tkChar, tkWChar:
      case GetTypeData(TypeInfo)^.OrdType of
        otSByte, otUByte: Exit(1);
        otSWord, otUWord: Exit(2);
        otSLong, otULong: Exit(4);
      else
        Exit(0);
      end;
    tkSet:
      begin
        Result := SizeOfSet(TypeInfo);
        if Result > SizeOf(NativeInt) then
          Result := -Result;
      end;
    tkFloat:
      case GetTypeData(TypeInfo)^.FloatType of
        ftSingle: Exit(4);
        ftDouble: Exit(8);
        ftExtended: Exit(SizeOf(Extended));
        ftComp: Exit(8);
        ftCurr: Exit(8);
      else
        Exit(0);
      end;
    tkClass, tkClassRef: Exit(SizeOf(Pointer));
    tkInterface: Exit(-SizeOf(Pointer));
    tkMethod: Exit(SizeOf(TMethod));
    tkInt64: Exit(8);
    tkDynArray, tkUString, tkLString, tkWString: Exit(-SizeOf(Pointer));
{$IFNDEF NEXTGEN}
    tkString: Exit(GetTypeData(TypeInfo)^.MaxLength + 1);
{$ENDIF !NEXTGEN}
    tkPointer, tkProcedure: Exit(SizeOf(Pointer));
    tkRecord, tkMRecord:
      if IsManaged(TypeInfo) then
        Exit(-GetTypeData(TypeInfo)^.RecSize)
      else
        Exit(GetTypeData(TypeInfo)^.RecSize);
    tkArray: Exit(GetTypeData(TypeInfo)^.ArrayData.Size);
    tkVariant: Exit(-SizeOf(Variant));
  else
    Exit(0);
  end;
end;


function TMethodImplementation.TInvokeInfo.GetParamLocs: TArray<TParamLoc>;
begin
  Assert(FParamList = nil, 'TInvokeInfo wasn''t sealed'); // DO NOT LOCALIZE
  Result := FParams;
end;

procedure TMethodImplementation.TInvokeInfo.Seal;
{$IF Defined(CPUX64)}
{$IF Defined(WIN64)}
var
  top: Integer;
  freeRegs: UInt32;

  procedure PutArg(var Param: TParamLoc);
  var
    dataSize: Integer;
    reg: UInt32;
  begin
    if Param.FByRefParam then
      dataSize := SizeOf(Pointer)
    else
    begin
      dataSize := GetParamSize(Param.FTypeInfo);
      if dataSize < 0 then
        dataSize := SizeOf(Pointer);
    end;
    if dataSize in [1, 2, 4, 8] then
    begin
      reg := AllocReg(freeRegs);
      if reg <> rsNone then
      begin
        if (not Param.FByRefParam)
        and (Param.FTypeInfo <> nil)
        and (Param.FTypeInfo^.Kind = tkFloat)
        and (Param.FTypeInfo.TypeData.FloatType in [ftSingle, ftDouble, ftExtended]) then
          case reg of
            rsXMM0: Param.FOffset := regXMM0;
            rsXMM1: Param.FOffset := regXMM1;
            rsXMM2: Param.FOffset := regXMM2;
            rsXMM3: Param.FOffset := regXMM3;
          end
        else
          case reg of
            rsRCX: Param.FOffset := regRCX;
            rsRDX: Param.FOffset := regRDX;
            rsR8:  Param.FOffset := regR8;
            rsR9:  Param.FOffset := regR9;
          end;
        Exit;
      end;
    end;
    Param.FOffset := top;
    Inc(top, Align8(dataSize));                                                                   
  end;

var
  I: Integer;
  p: PParamLoc;
begin
  top := 0;
  freeRegs := rsAll;
  // The RCX slot is overloaded for RAX for the result.
  // Assume Result is in RAX, it will be reset later if it is not.
  FResultLoc.FOffset := regRCX;

  SetLength(FParams, FParamList.Count);

  if FHasSelf and (FParamList.Count > 0) then
  begin
    p := @FParams[0];
    p^ := FParamList[0];
    PutArg(p^);
  end;
  if (FReturnType <> nil) then
  begin
    if IsManaged(FReturnType) or ((FReturnType^.Kind in [tkRecord, tkMRecord]) and
      (not (GetTypeData(FReturnType)^.RecSize in [1, 2, 4, 8]))) then
    begin
      FResultLoc := TParamLoc.Create(FReturnType, True, False);
      PutArg(FResultLoc);
    end;
  end;
  if not FHasSelf and (FParamList.Count > 0) then
  begin
    p := @FParams[0];
    p^ := FParamList[0];
    PutArg(p^);
  end;
  for I := 1 to FParamList.Count -1 do
  begin
    p := @FParams[I];
    p^ := FParamList[I];
    PutArg(p^);
  end;
  FStackSize := top;

  FParamList.Free;
  FParamList := nil;
end;
{$ELSEIF Defined(Linux64)}
var
  NextGR: Integer;  // Next General-purpose Register Number. 8 (64bits) registers are available.
  NextFR: Integer;  // Next Floating-point Register Number. 8 (128bits) registers are available.
  Stack: TStackHelper;
const
  maxGRegister = 6;
  maxFRegister = 8;

  procedure PutArg(var Param: TParamLoc);
  var
    DataSize: Integer;
  begin
    if Param.FByRefParam then
      DataSize := SizeOf(Pointer)
    else
    begin
      DataSize := GetParamSize(Param.FTypeInfo);
      if DataSize < 0 then
        DataSize := SizeOf(Pointer);
      if assigned(Param.FTypeInfo) then
      begin
        // Single/Double
        if (Param.FTypeInfo.Kind = tkFloat) and
           (Param.FTypeInfo.TypeData.FloatType in [ftSingle, ftDouble]) then
        begin
          if NextFR < maxFRegister then
          begin
            Param.FOffset := $10000000 + NextFR;
            Inc(NextFR);
            Exit;
          end;
        end
        // Extended
        else if (Param.FTypeInfo.Kind = tkFloat) and
                (Param.FTypeInfo.TypeData.FloatType in [ftExtended]) then
        begin
            Stack.Align(16);
            Param.FOffset := Stack.Size;
            Stack.Alloc(DataSize, 16);
            Exit;
        end
        // Record
        else if Param.FTypeInfo.Kind in [tkRecord, tkMRecord] then
        begin
          if (datasize > 16) or (FCallConv in [ccReg, ccPascal]) then
          begin
            datasize := SizeOf(Pointer);
            Param.FByRefParam := True;
          end
          else
          begin
            datasize := Align8(datasize);
            if (maxGRegister - nextGR) * SizeOf(NativeUInt) > DataSize then
            begin
              Param.FOffset := $10000008 + NextGR;
              Inc(nextGR, (DataSize + SizeOf(NativeUInt) - 1) div SizeOf(NativeUInt));
            end
            else
            begin
              nextGR := maxGRegister; // C.11
              Param.FOffset := Stack.Size;
              Stack.Alloc(DataSize, 8);
            end;
            Exit;
          end;
        end;
      end;
    end;

    if (dataSize in [1, 2, 4, 8]) then
    begin
      if nextGR < maxGRegister then
      begin
        Param.FOffset := $10000008 + nextGR;
        Inc(nextGR);
        Exit;
      end;
      Param.FOffset := Stack.Size;
      Stack.Alloc(DataSize, 8);
    end
    else
      Assert(False, 'somethig wrong');
  end;

var
  I: Integer;
  p: PParamLoc;
begin
  NextGR := 0;
  NextFR := 0;

  Stack := TStackHelper.Create;

  FResultLoc := TParamLoc.Create(FReturnType, False, False);
  FResultLoc.FOffset := $1000000E; // OutRAX

  SetLength(FParams, FParamList.Count);

  if (FReturnType <> nil) then
  begin
    if (FReturnType^.Kind = tkFloat) then
    begin
      case FReturnType^.TypeData.FloatType of
        ftSingle,
        ftDouble:
          FResultLoc.FOffset := $10000000;  // XMM0
        ftExtended:
          begin
            FResultFP := ftExtended; // mark to pop the fpu
            FResultLoc.FOffset := $10000010;  // OutFPU
          end;
        ftComp,
        ftCurr:
          FResultLoc.FOffset := $1000000E;  // RAX
      end;
    end
    else if IsManaged(FReturnType) or ((FReturnType^.Kind in [tkRecord, tkMREcord]) and
            (GetTypeData(FReturnType)^.RecSize > 16)) then
    begin
      FResultLoc := TParamLoc.Create(FReturnType, True, False);
      PutArg(FResultLoc);
    end;
  end;
  for I := 0 to FParamList.Count -1 do
  begin
    p := @FParams[I];
    p^ := FParamList[I];
    PutArg(p^);
  end;
  FStackSize := Stack.Size;
  FParamList.Free;
  FParamList := nil;
end;
{$ELSEIF Defined(MACOS64)}
var
  NextGR: Integer;  // Next General-purpose Register Number. 6 (64bits) registers are available.
  NextFR: Integer;  // Next Floating-point Register Number. 8 (128bits) registers are available.
  Stack: TStackHelper;
const
  maxGRegister = 6;
  maxFRegister = 8;

  procedure PutArg(var Param: TParamLoc);
  var
    DataSize: Integer;
  begin
    if Param.FByRefParam then
      DataSize := SizeOf(Pointer)
    else
    begin
      DataSize := GetParamSize(Param.FTypeInfo);
      if DataSize < 0 then
        DataSize := SizeOf(Pointer);
      if assigned(Param.FTypeInfo) then
      begin
        // Single/Double
        if (Param.FTypeInfo.Kind = tkFloat) and
           (Param.FTypeInfo.TypeData.FloatType in [ftSingle, ftDouble]) then
        begin
          if NextFR < maxFRegister then
          begin
            Param.FOffset := $10000000 + NextFR;
            Inc(NextFR);
            Exit;
          end;
        end
        // Extended
        else if (Param.FTypeInfo.Kind = tkFloat) and
                (Param.FTypeInfo.TypeData.FloatType in [ftExtended]) then
        begin
            Stack.Align(16);
            Param.FOffset := Stack.Size;
            Stack.Alloc(DataSize, 16);
            Exit;
        end
        // Record
        else if Param.FTypeInfo.Kind in [tkRecord, tkMRecord] then
        begin
          if (datasize > 16) then
          begin
            datasize := SizeOf(Pointer);
            Param.FByRefParam := True;
          end
          else
          begin
            datasize := Align8(datasize);
            if (maxGRegister - nextGR) * SizeOf(NativeUInt) > DataSize then
            begin
              Param.FOffset := $10000008 + NextGR;
              Inc(nextGR, (DataSize + SizeOf(NativeUInt) - 1) div SizeOf(NativeUInt));
            end
            else
            begin
              nextGR := maxGRegister; // C.11
              Param.FOffset := Stack.Size;
              Stack.Alloc(DataSize, 8);
            end;
            Exit;
          end;
        end;
      end;
    end;

    if (dataSize in [1, 2, 4, 8]) then
    begin
      if nextGR < maxGRegister then
      begin
        Param.FOffset := $10000008 + nextGR;
        Inc(nextGR);
        Exit;
      end;
      Param.FOffset := Stack.Size;
      Stack.Alloc(DataSize, 8);
    end
    else
      Assert(False, 'somethig wrong');
  end;

var
  I: Integer;
  p: PParamLoc;
begin
  NextGR := 0;
  NextFR := 0;

  Stack := TStackHelper.Create;

  FResultLoc := TParamLoc.Create(FReturnType, False, False);
  FResultLoc.FOffset := $1000000E; // OutRAX

  SetLength(FParams, FParamList.Count);

  if (FReturnType <> nil) then
  begin
    if (FReturnType^.Kind = tkFloat) then
    begin
      case FReturnType^.TypeData.FloatType of
        ftSingle,
        ftDouble:
          FResultLoc.FOffset := $10000000;  // XMM0
        ftExtended:
          begin
            FResultFP := ftExtended; // mark to pop the fpu
            FResultLoc.FOffset := $10000010;  // OutFPU
          end;
        ftComp,
        ftCurr:
          FResultLoc.FOffset := $1000000E;  // RAX
      end;
    end
    else if IsManaged(FReturnType) or ((FReturnType^.Kind in [tkRecord, tkMRecord]) and
            (GetTypeData(FReturnType)^.RecSize > 16)) then
    begin
      FResultLoc := TParamLoc.Create(FReturnType, True, False);
      PutArg(FResultLoc);
    end;
  end;
  for I := 0 to FParamList.Count -1 do
  begin
    p := @FParams[I];
    p^ := FParamList[I];
    PutArg(p^);
  end;
  FStackSize := Stack.Size;
  FParamList.Free;
  FParamList := nil;
end;
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Method not implemented for CPU'}
{$ENDIF}

// of CPUX64 TMethodImplementation.TInvokeInfo.Seal implementation
{$ELSEIF Defined(CPUX86)}
var
  top: Integer;
  freeRegs: UInt32;

  procedure PutArg(var Param: TParamLoc);
  var
    dataSize: Integer;
    reg: UInt32;
    isFloat: Boolean;
  begin
    if Param.FByRefParam then
      dataSize := SizeOf(Pointer)
    else
    begin
      dataSize := GetParamSize(Param.FTypeInfo);
      if dataSize < 0 then
        if FCallConv in [ccCdecl, ccStdCall, ccSafeCall] then
          dataSize := -dataSize
        else
          dataSize := 4;
    end;

    isFloat := (Param.FTypeInfo <> nil) and (Param.FTypeInfo^.Kind = tkFloat);

    if Param.FByRefParam or ((dataSize in [1, 2, 4]) and not isFloat) then
    begin
      reg := AllocReg(freeRegs);
      if reg <> rsNone then
      begin
        // We grow stack allocations downwards, so invert register values
        // again
        case reg of
          rsEAX: Param.FOffset := not regEAX;
          rsEDX: Param.FOffset := not regEDX;
          rsECX: Param.FOffset := not regECX;
        end;
        Exit;
      end;
    end;
    // No register => stack
    Dec(top, Align4(dataSize));
    Param.FOffset := top;
  end;

  procedure PutRefArg(var Param: TParamLoc);
  var
    reg: UInt32;
  begin
    Param.FByRefParam := True;
    reg := AllocReg(freeRegs);
    if reg <> rsNone then
    begin
      case reg of
        rsEAX: Param.FOffset := not regEAX;
        rsEDX: Param.FOffset := not regEDX;
        rsECX: Param.FOffset := not regECX;
      end;
      Exit;
    end;
    Dec(top, SizeOf(Pointer));
    Param.FOffset := top;
  end;

var
  i: Integer;
  p: PParamLoc;
begin
  // Relative top of stack
  top := 0;

  if FCallConv = ccReg then
    freeRegs := rsAll
  else
    freeRegs := rsNone;

  if (FCallConv = ccSafeCall) and (FReturnType <> nil) then
  begin
    FResultLoc := TParamLoc.Create(FReturnType, True, False);
    PutRefArg(FResultLoc);
  end;

  SetLength(FParams, FParamList.Count);

  if FCallConv in [ccCdecl, ccStdCall, ccSafeCall] then
  begin
    for i := FParamList.Count - 1 downto 0 do
    begin
      p := @FParams[i];
      p^ := FParamList[i];

      // Consider: always PutArg, but test PassByRef for second evaluation.
      if PassByRef(p^.FTypeInfo, FCallConv) then
        PutRefArg(p^)
      else
        PutArg(p^);
    end
  end
  else
  begin
    for i := 0 to FParamList.Count - 1 do
    begin
      // ccPascal passes Self last.
      if (not FHasSelf) or (FCallConv <> ccPascal) or (i <> 0) then
      begin
        p := @FParams[i];
        p^ := FParamList[i];

        if PassByRef(p^.FTypeInfo, FCallConv) then
          PutRefArg(p^)
        else
          PutArg(p^);
      end;
    end;
    if FHasSelf and (FCallConv = ccPascal) and (FParamList.Count > 0) then
    begin
      p := @FParams[0];
      p^ := FParamList[0];

      if PassByRef(p^.FTypeInfo, FCallConv) then
        PutRefArg(p^)
      else
        PutArg(p^);
    end;
  end;

  if (FCallConv <> ccSafeCall) then
  begin
    if IsManaged(FReturnType) or PassByRef(FReturnType, FCallConv) then
    begin
      FResultLoc := TParamLoc.Create(FReturnType, True, False);
      PutRefArg(FResultLoc);
    end
    else
    begin
      FResultLoc := TParamLoc.Create(FReturnType, False, False);
      FResultLoc.FOffset := not regEAX;
    end;
  end;

  FCallerPopsStack := FCallConv = ccCdecl;
  FStackSize := -top;

  if (FReturnType <> nil) and (FReturnType^.Kind = tkFloat) then
  begin
    FResultFP := GetTypeData(FReturnType)^.FloatType;
    FResultLoc.FOffset := not regFloat;
  end
  else
    FResultFP := TFloatType(-1);

  // Adjust offsets
  for i := 0 to Length(FParams) - 1 do
  begin
    if FParams[i].FOffset >= 0 then // params in regs => convert to neg offsets
      FParams[i].FOffset := not FParams[i].FOffset
    else
      Inc(FParams[i].FOffset, -top);
  end;
  // Adjust return value offset
  if FReturnType <> nil then
    if FResultLoc.FOffset >= 0 then
      FResultLoc.FOffset := not FResultLoc.FOffset
    else
      Inc(FResultLoc.FOffset, -top);

  FParamList.Free;
  FParamList := nil;
end; // of CPUX86 TMethodImplementation.TInvokeInfo.Seal implementation

{$ELSEIF Defined(CPUARM32)}
const
  regNone = $00;
  regCRAll  = $0F;
  regFPRAll  = $FFFF;

var
  top : integer;
  freeCRegs: UInt32;  // 4-core registers (32bit)
  freeFPRegs: UInt32; // 16-Single VFP registers (32bit)
                      //  8-Double VFP registers (64bit)

  function AllocDoubleReg: UInt32;
  var
    freeDoubleReg: Uint32;
  begin
    Result := 0;
    freeDoubleReg := freeFPRegs and $55555555; // remove odd FP registers.
    // no free Double register.
    if freeDoubleReg = 0 then Exit;
    // get a free single register at even index.
    Result := not(freeDoubleReg and (freeDoubleReg - 1)) and freeDoubleReg;
    // Remove two Single registers from FreeFPRegs;
    freeFPRegs := freeFPRegs and not( Result or Result shl 1);
  end;

  // Convert from register flag to core register offset value
  function ToCoreRegisterOffset(const regFlag: UInt32): integer;
  begin
    result := RegFlagToIndex(regFlag) or $10000000;
    // CR0 : 10000000
    // CR3 : 10000003
  end;

  // Convert from register flag to FP register offset value
  function ToSingleFPRegisterOffset(const regFlag: UInt32): integer;
  begin
    result := RegFlagToIndex(regFlag) or $10000010;
    // VFP S00 : 10000010
    // VFP S15 : 1000001F
  end;

  function ToDoubleFPRegisterOffset(const regFlag: UInt32): integer;
  begin
    result := RegDoubleFlagToIndex(regFlag) or $10000020;
    // VFP D0 : 10000020
    // VFP D7 : 10000027
  end;

  procedure PutArg(var Param: TParamLoc);
  var
    dataSize: Integer;
    reg,
    regL, regH: UInt32;
  begin
    if Param.FByRefParam then
      dataSize := SizeOf(Pointer)
    else
    begin
      dataSize := GetParamSize(Param.FTypeInfo);
      if dataSize < 0 then
        dataSize := SizeOf(Pointer);
      if assigned(Param.FTypeInfo) then
      begin
        if (Param.FTypeInfo.Kind = tkFloat) and
           (Param.FTypeInfo.TypeData.FloatType in [ftSingle, ftDouble, ftExtended]) then
        begin
          if dataSize = 4 then // Single
          begin
            reg := AllocReg(freeFPRegs);
            if reg <> 0 then
            begin
              Param.FOffset := ToSingleFPRegisterOffset(reg);
              Exit;
            end;
          end
          else if dataSize = 8 then // Double
          begin
            // First, allocate one Double VFP register.
            reg := AllocDoubleReg;
            if reg <> 0 then
            begin
              Param.FOffset := ToDoubleFPRegisterOffset(reg);
              Exit;
            end;
          end
          else
            Assert(False, 'Unknwon float type');
        end
        else if Param.FTypeInfo.Kind in [tkRecord, tkMRecord] then
        begin
          assert( FCallConv <> ccReg );
          // allocate first 4bytes, and keep it
          reg := AllocReg(freeCRegs);
          if reg <> regNone then
            Param.FOffset := ToCoreRegisterOffset(reg)
          else
          begin
            Param.FOffset := top;
            Inc(top, 4);
          end;
          Dec(dataSize, 4);
          // reserve rest of record block.
          while (datasize > 0) and (freeCRegs <> 0) do
          begin
            reg := AllocReg(freeCRegs);
            if reg = regNone then Inc(top, 4);
            Dec(dataSize, 4);
          end;
          while (datasize > 0) do
          begin
            Inc(top, 4);
            Dec(dataSize, 4);
          end;
          Exit;
        end;
      end;
    end;

    if (dataSize in [1, 2, 4]) then
    begin
      reg := AllocReg(freeCRegs);
      if reg <> regNone then
      begin
        Param.FOffset := ToCoreRegisterOffset(reg);
        Exit;
      end;
      Param.FOffset := top;
      Inc(top, 4);
    end
    else if dataSize = 8 then // 64bit data
    begin
      // Next, allocate two core register
      {$IFDEF IOS}
      regL := AllocReg(freeCRegs);
      {$ELSE}
      regL := AllocEvenReg(freeCRegs);
      {$ENDIF}
      regH := AllocReg(freeCRegs);
      if regL <> 0 then
        Param.FOffset := ToCoreRegisterOffset(regL)
      else
      begin
        Param.FOffset := top;
        Inc(top, 4);
      end;
      if regH = 0 then
        Inc(top, 4);
    end
    else
      Assert(False, 'somethig wrong');
  end;

var
  I: Integer;
  p: PParamLoc;
begin
  top := 0;
  freeCRegs := regCRAll;
  freeFPRegs := regNone;

{$IF not defined(ARM_NO_VFP_USE)}
  if FCallConv in [ccReg] then
    freeFPRegs := regFPRAll;
{$ENDIF !ARM_NO_VFP_USE}

  FResultLoc := TParamLoc.Create(FReturnType, False, False);
  FResultLoc.FOffset := ToCoreRegisterOffset($0001); // CR00 as Result register

  SetLength(FParams, FParamList.Count);

  if (FReturnType <> nil) then
  begin
    if IsManaged(FReturnType) or ((FReturnType^.Kind in [tkRecord, tkMRecord]) and
      (not (GetTypeData(FReturnType)^.RecSize in [1]))) then
    begin
      FResultLoc := TParamLoc.Create(FReturnType, True, False);
      PutArg(FResultLoc);
    end;
  end;
  for I := 0 to FParamList.Count -1 do
  begin
    p := @FParams[I];
    p^ := FParamList[I];
    PutArg(p^);
  end;
  FStackSize := top;

  FParamList.Free;
  FParamList := nil;
end; // of CPUARM32 TMethodImplementation.TInvokeInfo.Seal implementation

{$ELSEIF Defined(CPUARM64)}
var
  top : integer;
  nextGR: Integer;  // Next General-purpose Register Number. 8 (64bits) registers are avaulable.
  nextFR: Integer;  // Next Floating-point Register Number. 8 (128bits) registers are avaulable.
const
  maxRegister = 8;

  procedure PutArg(var Param: TParamLoc);
  var
    dataSize: Integer;
  begin
    if Param.FByRefParam then
      dataSize := SizeOf(Pointer)
    else
    begin
      dataSize := GetParamSize(Param.FTypeInfo);
      if dataSize < 0 then
        dataSize := SizeOf(Pointer);
      if assigned(Param.FTypeInfo) then
      begin
        if (Param.FTypeInfo.Kind = tkFloat) and
           (Param.FTypeInfo.TypeData.FloatType in [ftSingle, ftDouble, ftExtended]) then
        begin
          if nextFR < maxRegister then
          begin
            Param.FOffset := $10000010 + nextFR;
            Inc(nextFR);
            Exit;
          end;
        end
        else if Param.FTypeInfo.Kind in [tkRecord, tkMRecord] then
        begin
          if (datasize > 16) or (FCallConv in [ccReg, ccPascal]) then  // B.3
          begin
            datasize := SizeOf(Pointer);
            Param.FByRefParam := True;
          end
          else
          begin
            Assert(datasize <= 16);
            datasize := Align8(datasize); // B.4
            if (maxRegister - nextGR) * SizeOf(NativeUInt) > dataSize then // C.10
            begin
              Param.FOffset := $10000000 + nextGR;
              Inc(nextGR, (dataSize + SizeOf(NativeUInt) - 1) div SizeOf(NativeUInt));
            end
            else
            begin
              nextGR := maxRegister; // C.11
              Param.FOffset := top;
              Inc(top, dataSize); // Need align
            end;
            Exit;
          end;
        end;
      end;
    end;

    if (dataSize in [1, 2, 4, 8]) then
    begin
      if nextGR < maxRegister then
      begin
        Param.FOffset := $10000000 + nextGR;
        Inc(nextGR);
        Exit;
      end;
     if dataSize = 8 then
        top := ((top + 7) and not 7)
      else if dataSize = 4 then
        top := ((top + 3) and not 3)
      else if dataSize = 2 then
        top := ((top + 1) and not 1);
      Param.FOffset := top;
      Inc(top, dataSize);
    end
    else
      Assert(False, 'somethig wrong');
  end;

var
  I: Integer;
  p: PParamLoc;
begin
  top := 0;
  nextGR := 0;
  nextFR :=0;

  FResultLoc := TParamLoc.Create(FReturnType, False, False);
  FResultLoc.FOffset := $10000000; // CR00 as Result register

  SetLength(FParams, FParamList.Count);

  if (FReturnType <> nil) then
  begin
    if IsManaged(FReturnType) or ((FReturnType^.Kind in [tkRecord, tkMRecord]) and
      (GetTypeData(FReturnType)^.RecSize > 16)) then
    begin
      FResultLoc := TParamLoc.Create(FReturnType, True, False);
//      PutArg(FResultLoc);
// In this case, ARM64 will use X8
      FResultLoc.FOffset := $10000008;
    end;
  end;
  for I := 0 to FParamList.Count -1 do
  begin
    p := @FParams[I];
    p^ := FParamList[I];
    PutArg(p^);
  end;
  FStackSize := top;
  FParamList.Free;
  FParamList := nil;
end; // of CPUARM64 TMethodImplementation.TInvokeInfo.Seal implementation
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Method not implemented for CPU'}
{$ENDIF}

procedure TMethodImplementation.TInvokeInfo.SetReturnType(Value: PTypeInfo);
begin
  CheckNotSealed;
  FReturnType := Value;
end;

{ TMethodImplementation.TParamLoc }

constructor TMethodImplementation.TParamLoc.Create(AType: PTypeInfo;
  AByRef, AConstant: Boolean);
begin
  FTypeInfo := AType;
  FByRefParam := AByRef;
  FConstant := AConstant;
  FOffset := 0;
end;

procedure TMethodImplementation.TParamLoc.GetArg(AFrame: PInterceptFrame;
  out Value: TValue);
var
  loc: Pointer;
begin
  loc := GetArgLoc(AFrame);
  if FTypeInfo = nil then
    TValue.Make(@loc, TypeInfo(Pointer), Value)
  else
    TValue.Make(loc, FTypeInfo, Value);
end;

function TMethodImplementation.TParamLoc.GetArgLoc(AFrame: PInterceptFrame): Pointer;
{$IF Defined(CPUX64)}
{$IF Defined(WIN64)}
begin
  case FOffset of
    regRCX:  Result := @AFrame^.RegRCX;
    regRDX:  Result := @AFrame^.RegRDX;
    regR8:   Result := @AFrame^.RegR8;
    regR9:   Result := @AFrame^.RegR9;
    regXMM0: Result := @AFrame^.RegXMM0;
    regXMM1: Result := @AFrame^.RegXMM1;
    regXMM2: Result := @AFrame^.RegXMM2;
    regXMM3: Result := @AFrame^.RegXMM3;
  else
    Result := @PByte(@AFrame^.Args)[FOffset];
  end;

  if FByRefParam then
    Result := PPointer(Result)^;
end;
{$ELSEIF Defined(Linux64) or Defined(OSX64)}
begin
  case FOffset of
    $10000000..$10000007:                         // XMM0-XMM7
      Result := @AFrame^.RegXMM[FOffset and $F];
    $10000008..$1000000D:                         // RDI, RSI, RDX, RCX, R8, R9
      Result := @AFrame^.RegR[FOffset and 7];
    $1000000E:
      Result := @AFrame^.OutRAX;                  // RAX, if size = 16 will include OutRDX
    $10000010:
      Result := @AFrame^.OutFPU;
  else
    Result := @PByte(@AFrame^.Args)[FOffset];     // Stack
  end;

  if FByRefParam then
    Result := PPointer(Result)^;
end;
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Method not implemented for CPU'}
{$ENDIF}
{$ELSEIF Defined(CPUX86)}
begin
  case FOffset of
    regEAX: Result := @AFrame^.RegEAX;
    regEDX: Result := @AFrame^.RegEDX;
    regECX: Result := @AFrame^.RegECX;
    regFloat:
    begin
      Result := @AFrame^.FP.RegSingle;
    end;
  else
    Result := @PByte(@AFrame^.Args)[FOffset];
  end;

  if FByRefParam then
    Result := PPointer(Result)^;
end;

{$ELSEIF Defined(CPUARM32)}
begin
  case FOffset of
    $10000000: Result := @AFrame^.RegCR0;
    $10000001: Result := @AFrame^.RegCR1;
    $10000002: Result := @AFrame^.RegCR2;
    $10000003: Result := @AFrame^.RegCR3;

    $10000010..$1000001F: // S0..S15
      Result := @AFrame^.RegFP.S[FOffset and $F];
    $10000020..$10000027: // D0..D7
      Result := @AFrame^.RegFP.D[FOffset and $7];
  else
    Result := @PByte(@AFrame^.Args)[FOffset];
  end;

  if FByRefParam then
    Result := PPointer(Result)^;
end;
{$ELSEIF Defined(CPUARM64)}
begin
  case FOffset of
    $10000000..$10000007:
      Result := @AFrame^.RegCR[FOffset and $F];
    $10000008:
      Result := @AFrame^.RegCR8;

    $10000010..$10000017: // Q0..Q7
      Result := @AFrame^.RegFP[FOffset and $F];
  else
    Result := @PByte(@AFrame^.Args)[FOffset];
  end;

  if FByRefParam then
    Result := PPointer(Result)^;
end;
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Method not implemented for CPU'}
{$ENDIF}

procedure TMethodImplementation.TParamLoc.SetArg(AFrame: PInterceptFrame;
  const Value: TValue);
begin
  if FTypeInfo <> nil then
    Value.Cast(FTypeInfo).ExtractRawData(GetArgLoc(AFrame))
  else
    Value.ExtractRawData(GetArgLoc(AFrame));
end;

procedure RawIntercept;
{$IF Defined(CPUX86)}
asm
  // Upon entry:
  //
  // [original arguments]
  // [return address]
  // [frame pointer]            <-- EBP
  // [method impl]              <-- ESP (no PC_MAPPED_EXCEPTIONS)
  // [Bytes To Pop]                     (PC_MAPPED_EXCEPTIONS only)
  // [Fake return addr]         <-- ESP (PC_MAPPED_EXCEPTIONS only)
  PUSH ECX
  PUSH EDX
  PUSH EAX
  SUB ESP, TYPE TFloatReg
  MOV EDX, ESP
  MOV EAX, [EBP-4]

  // Record for stack @ESP now:
  //
  //  TInterceptFrame = record
  //    FP: TFloatReg;
  //    RegEAX: Pointer;
  //    RegEDX: Pointer;
  //    RegECX: Pointer;
  //    FakeRA: Pointer (PC_MAPPED_EXCEPTIONS only)
  //    BytesToPop: Pointer (PC_MAPPED_EXCEPTIONS only)
  //    Implementation: TMethodImplementation;
  //    PreviousFrame: Pointer;
  //    RetAddr: Pointer;
  //    Args: record end;
  //  end;
{$IFDEF ALIGN_STACK}
//  SUB  ESP, 4
{$ENDIF ALIGN_STACK}
  CALL TRttiMethod.TMethodImplementation.Intercept
{$IFDEF ALIGN_STACK}
//  ADD  ESP, 4
{$ENDIF ALIGN_STACK}

  // Now:
  //
  // [original arguments]
  // [return address]
  // [frame pointer]            <-- EBP
  // [TProxyClassInfo instance]
  // [invoke info]
  // [ECX]
  // [EDX]
  // [EAX]                      <-- ESP

  MOV ECX, ESP // ECX: PInterceptFrame

  MOV ESP, EBP
  POP EBP

  // ESP pointing at return address
  POP EAX // pop return address...
  MOV EAX, [ECX].TMethodImplementation.TInterceptFrame.Impl
  MOV EDX, [EAX].TMethodImplementation.FInvokeInfo
  MOVZX EAX, BYTE PTR [EDX].TMethodImplementation.TInvokeInfo.FCallerPopsStack
  TEST EAX,EAX
  JNZ @@no_pop
  MOV EAX, [EDX].TMethodImplementation.TInvokeInfo.FStackSize
  ADD ESP, EAX // ...and arguments

@@no_pop:
  // Push floating-point arguments on FP stack as needed
  MOVSX EAX, BYTE PTR [ECX].TMethodImplementation.TInterceptFrame.FP.Kind
  INC EAX
  JNZ @@do_fp_push
  NOP
  JMP @@done_fp_push

@@do_fp_push:
  DEC EAX
  // ftSingle, ftDouble, ftExtended, ftComp, ftCurr
  JZ @@single
  DEC EAX
  JZ @@double
  DEC EAX
  JZ @@extended

  // => currency or comp
  FILD QWORD PTR [ECX].TMethodImplementation.TInterceptFrame.FP.RegCurr
  JMP @@done_fp_push

@@single:
  FLD DWORD PTR [ECX].TMethodImplementation.TInterceptFrame.FP.RegSingle
  JMP @@done_fp_push

@@double:
  FLD QWORD PTR [ECX].TMethodImplementation.TInterceptFrame.FP.RegDouble
  JMP @@done_fp_push

@@extended:
  FLD TBYTE PTR [ECX].TMethodImplementation.TInterceptFrame.FP.RegExtended

@@done_fp_push:
  MOV EAX, DWORD PTR [ECX].TMethodImplementation.TInterceptFrame.RegEAX
  MOV EDX, DWORD PTR [ECX].TMethodImplementation.TInterceptFrame.RegEDX

  // RTTI

  JMP [ECX].TMethodImplementation.TInterceptFrame.RetAddr
end; // of CPUX86 RawIntercept implementation
{$ELSEIF Defined(CPUX64)}
{$IF Defined(MSWINDOWS)}
{$IFDEF ASSEMBLER}
var
  // TInterceptFrame floating registers in reverse order to keep growing offsets
    regXMM3,
    regXMM2,
    regXMM1,
    regXMM0: Pointer;
asm
    .PARAMS 2

    MOVSD regXMM0, XMM0
    MOVSD regXMM1, XMM1
    MOVSD regXMM2, XMM2
    MOVSD regXMM3, XMM3

    MOV   [RSP+$50], RCX // Save RCX, RDX, R8, R9 in their shadow
    MOV   [RSP+$58], RDX // space
    MOV   [RSP+$60], R8
    MOV   [RSP+$68], R9

    MOV   RCX, RAX
    LEA   RDX, [RSP+$20]
    CALL  TRttiMethod.TMethodImplementation.Intercept

    MOV   RAX,  [RSP+$50] // Overload RCX and RAX
    MOVSD XMM0, [RSP+$50] // Returned floating types are stored in XMM0
end; // of CPUX64 RawIntercept implementation
{$ELSE  ASSEMBLER}
begin
                                                                                 
end;
{$ENDIF ASSEMBLER}
{$ELSE !MSWINDOWS} // Linux
  external RTLHelperLibName name 'rtti_raw_intercept';
{$ENDIF !MSWINDOWS}

{$ELSEIF Defined(CPUARM)}
  external RTLHelperLibName name {$IFDEF LINUX} '_' + {$ENDIF} 'rtti_raw_intercept';
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Method not implemented for CPU'}
{$ENDIF}

{$IFDEF CPUX86}
var
  _CodeHeap : TPrivateHeap;
{$ENDIF CPUX86}

function AllocFirstStageIntercept(Proc: Pointer; PushVal: Pointer; BytesToPop: Integer): TMethodImplementation.PFirstStageIntercept;
{$IF Defined(CPUX64)}
begin
  CodeHeap.GetMem(Result, SizeOf(Result^));
  Result^.MovRAX_48 := $48;
  Result^.MovRAX_B8 := $B8;
  Result^.SelfVal := PushVal;
  Result^.MovR10_49 := $49;
  Result^.MovR10_BA := $BA;
  Result^.Target := Proc;
  Result^.JmpR10_49 := $49;
  Result^.JmpR10_FF := $FF;
  Result^.JmpR10_E2 := $E2;
end;
{$ELSEIF Defined(CPUX86)}
begin
  _CodeHeap := CodeHeap;
  _CodeHeap.GetMem(Result, SizeOf(Result^) * 2);

  // Setting up stack frame before pushing arguments should make stack unwinding
  // easier for everyone.
  Result^.PushEBP_55 := $55;
  Result^.MovEBP_ESP_1_89 := $89;
  Result^.MovEBP_ESP_2_E5 := $E5;
  Result^.Push_68 := $68;
  Result^.PushVal := PushVal;
{$IFDEF PC_MAPPED_EXCEPTIONS}
  // In the PC Mapped environment, if an exception is thrown past this thunk, we have
  // to play a trick.  The target of this thunk will be unwound by the normal stack
  // unwind process, but this thunk will confuse the unwinder.  To deal with that,
  // we trick the unwinder.  We push a fake return address, which is just the address
  // of this thunk onto the stack before we jump to the thunk target.  The unwinder
  // will then have that fake return address to look up in the PC Map tables.  The
  // private heap will have registered an unwinder for all the memory blocks that
  // it allocates for thunks.  So the unwinder will end up calling the frame unwind
  // function that we provided when we allocated the thunk's memory, and that personality
  // function will handle getting the unwinder past this frame.
  Result^.FakeRA_Push_68 := $68;
  Result^.FakeRA_PushVal := Result;
  Result^.BTP_Push_68 := $68;
  Result^.BTP_PushVal := BytesToPop;
{$ENDIF PC_MAPPED_EXCEPTIONS}
  Result^.JmpRel_E9 := $E9;
  Result^.RelTarget := IntPtr(Proc) -
//  Result^.RelTarget := NativeInt(@RawIntercept) -
    (Integer(@Result^.JmpRel_E9) + 1 + 4); // 1 (jmp) + rel32
end;
{$ELSEIF Defined(CPUARM) and Defined(LINUX)}
begin
                                                                                                                    
  CodeHeap.GetMem(Result, SizeOf(Result^));
//  Result^.MovRAX_48 := $48;
//  Result^.MovRAX_B8 := $B8;
//  Result^.SelfVal := PushVal;
//  Result^.JmpRel_E9 := $E9;
//  Result^.RelTarget := NativeInt(@RawIntercept) -
//  Result^.RelTarget := IntPtr(Proc) -
//    (IntPtr(@Result^.JmpRel_E9) + 1 + 4); // 1 (jmp) + rel32
end;
{$ELSEIF Defined(CPUARM) and (Defined(ANDROID) or Defined(IOS))}
     cdecl; external RTLHelperLibName name 'allocate_first_stage_intercept';
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Method not implemented for CPU'}
{$ENDIF}

procedure FreeIntercept(AIntercept: TMethodImplementation.PFirstStageIntercept);
{$IF ((Defined(CPUX86) or Defined(CPUX64)) and (Defined(LINUX) or Defined(MSWINDOWS) or Defined(MACOS))) or (Defined(CPUARM) and Defined(LINUX))}
begin
  CodeHeap.FreeMem(AIntercept);
end;
{$ELSEIF Defined(CPUARM) and (Defined(Android) or Defined(IOS))}
     cdecl; external RTLHelperLibName name 'free_first_stage_intercept';
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Method not implemented for CPU'}
{$ENDIF}

{ TMethodImplementation }

constructor TMethodImplementation.Create;
begin
  raise EInvalidOpException.CreateRes(@SVarNotImplemented);
end;

constructor TMethodImplementation.Create(AUserData: Pointer; AInvokeInfo: TInvokeInfo;
  const ACallback: TMethodImplementationCallback);
var
  BytesToPop: Integer;
begin
  BytesToPop := 0;
{$IFDEF CPUX86}
  if not AInvokeInfo.FCallerPopsStack then
    BytesToPop := AInvokeInfo.FStackSize;
{$ENDIF CPUX86}
  FStub := AllocFirstStageIntercept(@RawIntercept, Pointer(Self), BytesToPop);
  FInvokeInfo := AInvokeInfo;
  FUserData := AUserData;
  FCallback := ACallback;
end;

destructor TMethodImplementation.Destroy;
begin
  if FStub <> nil then
    FreeIntercept(FStub);
  inherited;
end;

function TMethodImplementation.GetCodeAddress: Pointer;
begin
  Result := Pointer(FStub);
end;

{ This function has been added to be used from .s .c files in order to avoid use mangled names}
procedure TMethodImplementationIntercept(const obj:TMethodImplementation; AFrame: Pointer); cdecl;
begin
  obj.Intercept(AFrame);
end;
exports TMethodImplementationIntercept;

procedure TMethodImplementation.Intercept(AFrame: PInterceptFrame);
var
  args: TArray<TValue>;
  result: TValue;
begin
  args := FInvokeInfo.LoadArguments(AFrame);
  try
    if Assigned(FCallback) then
      FCallback(FUserData, args, result);
  finally
    FInvokeInfo.SaveArguments(AFrame, args, result);
  end;
end;

{ TVirtualMethodInterceptor }

constructor TVirtualMethodInterceptor.Create(AClass: TClass);
begin
  FOriginalClass := AClass;
  FIntercepts := TObjectList<TInterceptInfo>.Create(True);
  FImplementationCallback := RawCallback;

  CreateProxyClass;
end;

type
  PProxyClassData = ^TProxyClassData;
  TProxyClassData = record
    SelfPtr: TClass;
    IntfTable: Pointer;
    AutoTable: Pointer;
    InitTable: Pointer;
    TypeInfo: PTypeInfo;
    FieldTable: Pointer;
    MethodTable: Pointer;
    DynamicTable: Pointer;
{$IFNDEF NEXTGEN}
    ClassName: PShortString;
{$ELSE NEXTGEN}
    ClassName: MarshaledAString;
{$ENDIF NEXTGEN}
    InstanceSize: Integer;
    Parent: ^TClass;
  end;

procedure TVirtualMethodInterceptor.CreateProxyClass;

  function GetExtraMethodInfo(m: TRttiMethod): TExtraMethodInfo;
  var
    methodName: string;
  begin
    methodName := m.Name;
    // The following conditions are tested by caller.
    // m.DispatchKind is dkVtable
    // m.MethodKind is mkFunction or mkProcedure
    if methodName = 'FreeInstance' then
      Result:= eiFreeInstance
{$IFDEF AUTOREFCOUNT}
    else if methodName = '__ObjAddRef' then
      Result:= eiObjAddRef
    else if methodName = '__ObjRelease' then
      Result:= eiObjRelease
{$ENDIF AUTOREFCOUNT}
    else
      Result:= eiNormal;
  end;

var
  t: TRttiType;
  m: TRttiMethod;
  size, classOfs: Integer;
  ii: TInterceptInfo;
  extraMInfo: TExtraMethodInfo;
begin
  t := FContext.GetType(FOriginalClass);
  size := (t as TRttiInstanceType).VmtSize;
  classOfs := -vmtSelfPtr;
  FProxyClassData := AllocMem(size);
  FProxyClass := TClass(PByte(FProxyClassData) + classOfs);
  Move((PByte(FOriginalClass) - classOfs)^, FProxyClassData^, size);
  PProxyClassData(FProxyClassData)^.Parent := @FOriginalClass;
  PProxyClassData(FProxyClassData)^.SelfPtr := FProxyClass;

  for m in t.GetMethods do
  begin
    if m.DispatchKind <> dkVtable then
      Continue;
    if not (m.MethodKind in [mkFunction, mkProcedure]) then
      Continue;
    if not m.HasExtendedInfo then
      Continue;
    extraMInfo := GetExtraMethodInfo(m);
{$IFDEF AUTOREFCOUNT}
    if extraMInfo in [eiObjAddRef, eiObjRelease] then
      Continue;
{$ENDIF AUTOREFCOUNT}
    ii := TInterceptInfo.Create(PVtablePtr(FOriginalClass)[m.VirtualIndex],
      m, FImplementationCallback, extraMInfo);
    FIntercepts.Add(ii);
    PVtablePtr(FProxyClass)[m.VirtualIndex] := ii.ProxyCode;
  end;
end;

destructor TVirtualMethodInterceptor.Destroy;
begin
  FIntercepts.Free;
  FreeMem(FProxyClassData);
  inherited;
end;

procedure TVirtualMethodInterceptor.DoAfter(Instance: TObject;
  Method: TRttiMethod; const Args: TArray<TValue>; var Result: TValue);
begin
  if Assigned(FOnAfter) then
    FOnAfter(Instance, Method, Args, Result);
end;

procedure TVirtualMethodInterceptor.DoBefore(Instance: TObject;
  Method: TRttiMethod; const Args: TArray<TValue>; out DoInvoke: Boolean;
  out Result: TValue);
begin
  if Assigned(FOnBefore) then
    FOnBefore(Instance, Method, Args, DoInvoke, Result);
end;

procedure TVirtualMethodInterceptor.DoException(Instance: TObject;
  Method: TRttiMethod; const Args: TArray<TValue>; out RaiseException: Boolean;
  TheException: Exception; out Result: TValue);
begin
  if Assigned(FOnException) then
    FOnException(Instance, Method, Args, RaiseException, TheException, Result);
end;

procedure TVirtualMethodInterceptor.Proxify(AInstance: TObject);
begin
  if PPointer(AInstance)^ <> OriginalClass then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  PPointer(AInstance)^ := ProxyClass;
end;

procedure TVirtualMethodInterceptor.Unproxify(AInstance: TObject);
begin
  if PPointer(AInstance)^ <> ProxyClass then
    raise EInvalidCast.CreateRes(@SInvalidCast);
  PPointer(AInstance)^ := OriginalClass;
end;

procedure TVirtualMethodInterceptor.RawCallback(UserData: Pointer;
  const Args: TArray<TValue>; out Result: TValue);

  procedure PascalShiftSelfLast(cc: TCallConv);
{$IFDEF CPUX86}
  var
    receiver: array[1..SizeOf(TValue)] of Byte;
  begin
    if cc <> ccPascal then Exit;
    Move(Args[0], receiver, SizeOf(TValue));
    Move(Args[1], Args[0], SizeOf(TValue) * (Length(Args) - 1));
    Move(receiver, Args[Length(Args) - 1], SizeOf(TValue));
  end;
{$ELSE !CPUX86}
  begin
                                                                             
  end;
{$ENDIF !CPUX86}

  procedure PascalShiftSelfFirst(cc: TCallConv);
{$IFDEF CPUX86}
  var
    receiver: array[1..SizeOf(TValue)] of Byte;
  begin
    if cc <> ccPascal then Exit;
    Move(Args[Length(Args) - 1], receiver, SizeOf(TValue));
    Move(Args[0], Args[1], SizeOf(TValue) * (Length(Args) - 1));
    Move(receiver, Args[0], SizeOf(TValue));
  end;
{$ELSE !CPUX86}
  begin
                                                                             
  end;
{$ENDIF !CPUX86}

var
  inst: TObject;
  ii: TInterceptInfo;
  argList: TArray<TValue>;
  parList: TArray<TRttiParameter>;
  i: Integer;
  go: Boolean;
begin
  ii := TInterceptInfo(UserData);
  inst := Args[0].AsObject;

  SetLength(argList, Length(Args) - 1);
  for i := 1 to Length(Args) - 1 do
    argList[i - 1] := Args[i];
  try
    go := True;
    DoBefore(inst, ii.Method, argList, go, Result);
    if go then
    begin
      try
        parList := ii.Method.GetParameters;
        for i := 1 to Length(Args) - 1 do
        begin
{$IF     defined(CPUX86)}
          if (parList[i-1].ParamType <> nil) and (
               ((ii.Method.CallingConvention in [ccCdecl, ccStdCall, ccSafeCall]) and (pfConst in parList[i-1].Flags) and (parList[i-1].ParamType.TypeKind = tkVariant))
            or ((pfConst in parList[i - 1].Flags) and (parList[i - 1].ParamType.TypeSize > SizeOf(Pointer)) and (parList[i-1].ParamType.TypeKind <> TTypeKind.tkFloat))
            or ([pfVar, pfOut] * parList[i - 1].Flags <> [])) then
{$ELSEIF defined(CPUX64)}
{$IF defined(MSWINDOWS)}
          if (parList[i-1].ParamType <> nil) and (
               ((pfConst in parList[i - 1].Flags) and (parList[i - 1].ParamType.TypeSize > SizeOf(Pointer)))
            or ([pfVar, pfOut] * parList[i - 1].Flags <> [])) then
{$ELSE !MSWINDOWS} // Linux
          if (parList[i-1].ParamType <> nil) and (
               ((ii.Method.CallingConvention in [ccReg]) and (parList[i - 1].ParamType.TypeKind in [tkRecord, tkMRecord]))
            or ([pfVar, pfOut] * parList[i - 1].Flags <> [])) then
{$ENDIF !MSWINDOWS}
{$ELSEIF defined(CPUARM)}
          if (parList[i-1].ParamType <> nil) and (
               ((ii.Method.CallingConvention in [ccReg]) and (parList[i - 1].ParamType.TypeKind in [tkRecord, tkMRecord]))
            or ([pfVar, pfOut] * parList[i - 1].Flags <> [])) then
{$ELSE OTHERCPU}
  {$MESSAGE Fatal 'Missing RawCallback logic for CPU'}
{$ENDIF}
            Args[i] := argList[i - 1].GetReferenceToRawData
          else
            Args[i] := argList[i - 1];
        end;

        PascalShiftSelfLast(ii.Method.CallingConvention);
        try
          if ii.Method.ReturnType <> nil then
            Result := Invoke(ii.OriginalCode, Args, ii.Method.CallingConvention, ii.Method.ReturnType.Handle)
          else
            Result := Invoke(ii.OriginalCode, Args, ii.Method.CallingConvention, nil);
        finally
          PascalShiftSelfFirst(ii.Method.CallingConvention);
        end;
      except
        on e: Exception do
        begin
          DoException(inst, ii.Method, argList, go, e, Result);
          if go then
            raise;
        end;
      end;
      if ii.ExtraMethodInfo = eiFreeInstance then
      begin
         Pointer(inst) := nil;
{$IFDEF AUTOREFCOUNT}
        Pointer(Args[0].FData.FValueData.GetReferenceToRawData^) := nil;
{$ENDIF AUTOREFCOUNT}
      end;
      DoAfter(inst, ii.Method, argList, Result);
    end;
  finally
    // Set modified by-ref arguments
    for i := 1 to Length(Args) - 1 do
      Args[i] := argList[i - 1];
  end;
end;

{ TVirtualMethodInterceptor.TInterceptInfo }

constructor TVirtualMethodInterceptor.TInterceptInfo.Create(AOriginalCode: Pointer; AMethod: TRttiMethod;
  const ACallback: TMethodImplementationCallback;
  const ExtraMethodInfo: TExtraMethodInfo);
begin
  FImpl := AMethod.CreateImplementation(Pointer(Self), ACallback);
  FOriginalCode := AOriginalCode;
  FProxyCode := FImpl.CodeAddress;
  FMethod := AMethod;
  FExtraMethodInfo := ExtraMethodInfo;
end;

destructor TVirtualMethodInterceptor.TInterceptInfo.Destroy;
begin
  FImpl.Free;
  inherited;
end;

{ TRawVirtualClass.TVTable }

constructor TRawVirtualClass.TVTable.Create(MethodCount: Integer);
var
  SlotCount: Integer;
begin
//  SlotCount := GetMethodCount + RESERVED_VTABLE_SLOTS;
  SlotCount := MethodCount + RESERVED_VTABLE_SLOTS;
  SetLength(FInterceptors, MethodCount);
  SetLength(FVTable, SlotCount);
  FVTable[0] := @TRawVirtualClass._QIFromIntf;
  FVTable[1] := @TRawVirtualClass._AddRefFromIntf;
  FVTable[2] := @TRawVirtualClass._ReleaseFromIntf;
end;

destructor TRawVirtualClass.TVTable.Destroy;
begin
end;

function TRawVirtualClass.TVTable.GetVTable: TArray<pointer>;
begin
  Result := FVTable;
end;

procedure TRawVirtualClass.TVTable.SetVTableSlot(Idx: Integer; Proc: Pointer; Context: Pointer);
begin
  if Assigned(FInterceptors[Idx]) then
    FreeIntercept(TMethodImplementation.PFirstStageIntercept(FInterceptors[Idx]));
                                                                                      
  // we'll have to change the SetVTableSlot API to include a count of bytes to pop for callee
  // cleanup vtable slot entries.
  FInterceptors[Idx] := AllocFirstStageIntercept(Proc, Context, 0);
  FVTable[Idx + RESERVED_VTABLE_SLOTS] := Pointer(FInterceptors[Idx]);
end;

procedure TRawVirtualClass.TVTable.SetVTableSlot(Idx: Integer; Proc: Pointer);
begin
  if Assigned(FInterceptors[Idx]) then
  begin
    FreeIntercept(TMethodImplementation.PFirstStageIntercept(FInterceptors[Idx]));
    FInterceptors[Idx] := nil;
  end;
  FVTable[Idx + RESERVED_VTABLE_SLOTS] := Proc;
end;

class function TRawVirtualClass.TVTable.AllocateRawThunk(Proc: Pointer; Context: Pointer; BytesToPop: Integer): Pointer;
begin
  Result := Pointer(AllocFirstStageIntercept(Proc, Context, BytesToPop));
end;

class procedure TRawVirtualClass.TVTable.FreeRawThunk(Thunk: Pointer);
begin
  FreeIntercept(TMethodImplementation.PFirstStageIntercept(Thunk));
end;

{ TRawVirtualClass }

constructor TRawVirtualClass.Create(Guids: TArray<TGUID>; VTable: TRawVirtualClass.TVTable);
begin
  FIIDs := Guids;
  FVTable.Obj := Pointer(Self);
  FVTable.VTable := VTable.VTable;
end;

destructor TRawVirtualClass.Destroy;
begin
                                                                    
  inherited Destroy;
end;

function TRawVirtualClass._AddRefFromIntf: Integer; stdcall;
begin
  Result := TRawVirtualClass(GetInstanceFromInterface(Pointer(Self)))._AddRef;
end;

function TRawVirtualClass._ReleaseFromIntf: Integer; stdcall;
begin
  Result := TRawVirtualClass(GetInstanceFromInterface(Pointer(Self)))._Release;
end;

function TRawVirtualClass._QIFromIntf(const IID: TGUID; out Obj): HResult; stdcall;
begin
  Result := TRawVirtualClass(GetInstanceFromInterface(Pointer(Self))).QueryInterface(IID, Obj);
end;

function TRawVirtualClass.FindInterface(IID: TGUID): Pointer;
var
  I: Integer;
begin
  for I := 0 to Length(FIIDs) - 1 do
    if IID = FIIDs[I] then
      Exit(@FVTable.VTable);
  Result := nil;
end;

function TRawVirtualClass.QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
var
  P: Pointer;
begin
  P := FindInterface(IID);
  if Assigned(P) then
  begin
    _AddRef;
    Pointer(Obj) := P;
    Exit(S_OK);
  end;
  Result := inherited;
end;

class function TRawVirtualClass.GetInstanceFromInterface(Intf: Pointer): TRawVirtualClass;
var
  Bound: PBoundInterface;
begin
  // The interface was stored in a BoundInterface record, so that we could
  // do pointer math to get back to a pointer to the instance that holds it.
  Bound := PBoundInterface(PByte(Intf) - SizeOf(Pointer));
  Result := TRawVirtualClass(Bound^.Obj);
end;

{ TVirtualInterface }

constructor TVirtualInterface.Create(PIID: PTypeInfo);
var
  Methods: TArray<TRttiMethod>;
  Method: TRttiMethod;
  Typ: TRttiType;
  MaxIndex, I: Integer;
begin
  FIntercepts := TObjectList<TImplInfo>.Create(True);
  Typ := FContext.GetType(PIID);
  FIID := TRttiInterfaceType(Typ).GUID;
                              
  Methods := Typ.GetMethods;
  MaxIndex := 2;  // Is this the best way to do this?
  for Method in Methods do
  begin
    if MaxIndex < Method.VirtualIndex then
      MaxIndex := Method.VirtualIndex;
    FIntercepts.Add(TImplInfo.Create(Method, RawCallBack));
  end;

  VTable := AllocMem(SizeOf(Pointer)* (MaxIndex+1));
  PVtablePtr(VTable)[0] := @TVirtualInterface._QIFromIntf;
  PVtablePtr(VTable)[1] := @TVirtualInterface._AddRefFromIntf;
  PVtablePtr(VTable)[2] := @TVirtualInterface._ReleaseFromIntf;
  for I := 0 to FIntercepts.Count-1 do
    PVtablePtr(VTable)[FIntercepts[I].VirtualIndex] := FIntercepts[I].CodeAddress;
  for I := 3 to MaxIndex do
    if PVtablePtr(VTable)[I] = nil then
      PVtablePtr(VTable)[I] := @TVirtualInterface.ErrorProc;
end;

constructor TVirtualInterface.Create(PIID: PTypeInfo;
  InvokeEvent: TVirtualInterfaceInvokeEvent);
begin
  Create(PIID);
  FOnInvoke := InvokeEvent;
end;

destructor TVirtualInterface.Destroy;
begin
  if VTable <> nil then
    FreeMem(VTable);
  FIntercepts.Free;
  inherited;
end;

procedure TVirtualInterface.RawCallback(UserData: Pointer;
  const Args: TArray<TValue>; out Result: TValue);
begin
  if Assigned(FOnInvoke) then
    FOnInvoke(TImplInfo(UserData).FMethod, Args, Result);
end;

procedure TVirtualInterface.ErrorProc;
begin
  raise InsufficientRtti;
end;

function TVirtualInterface._AddRefFromIntf: Integer;
begin
  Result := TVirtualInterface(PByte(Self) -
    (PByte(@Self.VTable) - PByte(Self)))._AddRef;
end;

function TVirtualInterface._ReleaseFromIntf: Integer;
begin
  Result := TVirtualInterface(PByte(Self) -
    (PByte(@Self.VTable) - PByte(Self)))._Release;
end;

function TVirtualInterface._QIFromIntf(const IID: TGUID; out Obj): HResult;
begin
  Result := TVirtualInterface(PByte(Self) -
    (PByte(@Self.VTable) - PByte(Self))).QueryInterface(IID, Obj);
end;

function TVIrtualInterface._AddRef: Integer;
begin
  Result := inherited
end;

function TVIrtualInterface._Release: Integer;
begin
  Result := inherited
end;

function TVirtualInterface.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if iid = FIID then
  begin
    _AddRef;
    Pointer(Obj) := @VTable;
    Result := S_OK;
  end
  else
    Result := inherited
end;

{ TVirtualInterface.TImplInfo }

constructor TVirtualInterface.TImplInfo.Create(AMethod: TRttiMethod;
  const ACallback: TMethodImplementationCallback);
begin
  FImpl := AMethod.CreateImplementation(Pointer(Self), ACallback);
  FMethod := AMethod;
end;

destructor TVirtualInterface.TImplInfo.Destroy;
begin
  FImpl.Free;
  inherited;
end;

function TVirtualInterface.TImplInfo.GetCodeAddress: Pointer;
begin
  Result := FImpl.CodeAddress;
end;

function TVirtualInterface.TImplInfo.GetVirtualIndex: SmallInt;
begin
  Result := FMethod.VirtualIndex;
end;

{ TRttiIndexedProperty }

const
  pafIsDefault = 1 shl 0;
  pafVisibilityShift = 1;
  pafVisibilityBits = 2;

constructor TRttiIndexedProperty.Create(APackage: TRttiPackage;
  AParent: TRttiObject; var P: PByte);
begin
  inherited;
  P := PByte( Handle.AttrData );
  FAttributeGetter := LazyLoadAttributes(P);
end;

procedure TRttiIndexedProperty.GetAccessors;
var
  x: TArray<TRttiMethod>;
  i, count: Integer;
begin
  if (Handle^.ReadIndex = $FFFF) and (Handle^.WriteIndex = $FFFF) then
    exit;

  x := Parent.GetDeclaredMethods;
  i := 0;
  count := 0;
  while i < Length(x) do
  begin
    if x[i] is TRttiInstanceMethodEx then
    begin
      if i <> count then
        x[count] := x[i];
      Inc(count);
    end;
    Inc(i)
  end;
  if Handle^.ReadIndex <> $FFFF then
    FReadMethod := x[Handle^.ReadIndex];
  if Handle^.WriteIndex <> $FFFF then
    FWriteMethod := x[Handle^.WriteIndex];
end;

function TRttiIndexedProperty.GetReadMethod: TRttiMethod;
begin
  if Handle^.ReadIndex = $FFFF then
    Result := nil
  else
  begin
    if FReadMethod = nil then
      GetAccessors;
    Result := FReadMethod;
  end;
end;

function TRttiIndexedProperty.GetWriteMethod: TRttiMethod;
begin
  if Handle^.WriteIndex = $FFFF then
    Result := nil
  else
  begin
    if FWriteMethod = nil then
      GetAccessors;
    Result := FWriteMethod;
  end;
end;

function TRttiIndexedProperty.GetHandle: PArrayPropInfo;
begin
  Result := PArrayPropInfo(inherited Handle);
end;

function TRttiIndexedProperty.GetIsDefault: Boolean;
begin
  Result := (Handle^.Flags and pafIsDefault) <> 0;
end;

function TRttiIndexedProperty.GetIsReadable: Boolean;
begin
  Result := Handle^.ReadIndex <> $FFFF;
end;

function TRttiIndexedProperty.GetIsWritable: Boolean;
begin
  Result := Handle^.WriteIndex <> $FFFF;
end;

function TRttiIndexedProperty.GetName: string;
begin
  Result := Handle.NameFld.ToString;
end;

function TRttiIndexedProperty.GetPropertyType: TRttiType;
var
  p: TArray<TRttiParameter>;
begin
  GetAccessors;
  if FReadMethod <> nil then
    Result := FReadMethod.ReturnType
  else if FWriteMethod <> nil then
  begin
    p := FWriteMethod.GetParameters;
    Result := p[Length(p) - 1].ParamType;
  end
  else
    Result := nil;
end;

function TRttiIndexedProperty.GetValue(Instance: Pointer;
  const Args: array of TValue): TValue;
var
  getter: TRttiMethod;
begin
  getter := ReadMethod;
  if getter = nil then
    raise EPropWriteOnly.Create(Name);
  if getter.IsStatic or getter.IsClassMethod then
    Result := getter.Invoke(TClass(Instance), Args)
  else
    Result := getter.Invoke(TObject(Instance), Args);
end;

function TRttiIndexedProperty.GetVisibility: TMemberVisibility;
begin
  Result := TMemberVisibility(
    GetBitField(Handle^.Flags, pafVisibilityShift, pafVisibilityBits));
end;

procedure TRttiIndexedProperty.SetValue(Instance: Pointer;
  const Args: array of TValue; const Value: TValue);
var
  setter: TRttiMethod;
  argsV: TArray<TValue>;
  i: Integer;
begin
  setter := WriteMethod;
  if setter = nil then
    raise EPropReadOnly.Create(Name);
  SetLength(argsV, Length(Args) + 1);
  for i := 0 to High(Args) do
    argsV[i] := Args[i];
  argsV[Length(Args)] := Value;
  if setter.IsStatic or setter.IsClassMethod then
    setter.Invoke(TClass(Instance), argsV)
  else
    setter.Invoke(TObject(Instance), argsV);
end;

function TRttiIndexedProperty.ToString: string;
var
  m: TRttiMethod;
  p: TArray<TRttiParameter>;
  i: Integer;
begin
  Result := 'property ' + Name + '[';
  m := ReadMethod;
  if m <> nil then
  begin
    p := m.GetParameters;
    for i := 0 to Length(p) - 2 do
      Result := Result + p[i].ToString + ', ';
    Result := Result + p[Length(p) - 1].ToString;
  end
  else
  begin
    m := WriteMethod;
    if m = nil then
      Exit(Result + ']');
    p := m.GetParameters;
    for i := 0 to Length(p) - 3 do
      Result := Result + p[i].ToString + ', ';
    Result := Result + p[Length(p) - 2].ToString;
  end;
  Result := Result + ']: ';
  if m.ReturnType <> nil then // getter
    Result := Result + m.ReturnType.ToString
  else // setter
    Result := Result + p[Length(p) - 1].ToString;
end;

initialization
  RegisterWeakRefTypeInfo(TypeInfo(TValue), System.HasWeakRef(TValue), 0);
  AddModuleUnloadProc(OnUnloadModule);
  PoolLock;
finalization
  _PoolLock.Free;
  RemoveModuleUnloadProc(OnUnloadModule);
  FCodeHeap.Free;
end.

