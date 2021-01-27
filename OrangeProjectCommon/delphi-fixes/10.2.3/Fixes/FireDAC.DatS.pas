(* ****************************************************** *)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　　修改：爱吃猪头肉 & Flying Wang 2018-06-04　　　 *)
(*　　　　　　　　上面的版权声明请不要移除。　　　　　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　　　    　　　　　禁止发布到城通网盘。　　　　  　　　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(*　仅支持 RAD10.2.3(10.2 Release 3)，其他版本请自行修改　*)
(*　　　　　　　　　　　　　　　　　　　　　　　　　　　　*)
(* ****************************************************** *)
//https://quality.embarcadero.com/browse/RSP-20662

{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{          FireDAC Local Data Storage classes           }
{                                                       }
{ Copyright(c) 2004-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}

unit FireDAC.DatS;

interface

uses
{$IFDEF MSWINDOWS}
  Winapi.Windows,
{$ENDIF}
  System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Error, FireDAC.Stan.Util, FireDAC.Stan.Consts,
    FireDAC.Stan.Option;

type
  TFDDatSObject = class;
  TFDDatSObjectClass = class of TFDDatSObject;
  TFDDatSNamedObject = class;
  TFDDatSList = class;
  TFDDatSNamedList = class;
  TFDDatSColumn = class;
  TFDDatSColumnList = class;
  TFDDatSColumnSublist = class;
  TFDDatSConstraintBase = class;
  TFDDatSConstraintList = class;
  TFDDatSUniqueConstraint = class;
  TFDDatSForeignKeyConstraint = class;
  TFDDatSCheckConstraint = class;
  TFDDatSRelation = class;
  TFDDatSRelationList = class;
  TFDDatSMechBase = class;
  TFDDatSViewMechList = class;
  TFDDatSMechSort = class;
  TFDDatSMechRowState = class;
  TFDDatSMechRange = class;
  TFDDatSMechDistinct = class;
  TFDDatSMechFilter = class;
  TFDDatSMechError = class;
  TFDDatSMechDetails = class;
  TFDDatSMechChilds = class;
  TFDDatSMechMaster = class;
  TFDDatSMechParent = class;
  TFDDatSRow = class;
  TFDDatSRowListBase = class;
  TFDDatSNestedRowList = class;
  TFDDatSTableRowList = class;
  TFDDatSViewRowList = class;
  TFDDatSView = class;
  TFDDatSViewList = class;
  TFDDatSAggregateValue = class;
  TFDDatSAggregate = class;
  TFDDatSAggregateList = class;
  TFDDatSTable = class;
  TFDDatSTableList = class;
  TFDDatSUpdatesJournal = class;
  TFDDatSManager = class;

  IFDDatSMechSort = interface;
  IFDDatSTableMetadataCallback = interface;
  IFDDatSTableDataCallback = interface;

  TFDDatSNotificationKind = (
    snObjectInserting, snObjectInserted, snObjectRemoving, snObjectRemoved,
    snColumnDefChanged, snObjectNameChanged, snMechanismStateChanged,
    snViewUpdated, snRowStateChanged, snRowErrorStateChanged);
  TFDDatSNotificationReason = (srMetaChange, srDataChange);

  TFDDatSColumnThings = set of (ctCalcs, ctExps, ctDefs, ctInvars, ctComp,
    ctAutoIncs, ctSerializing, ctLateSer, ctParentRef);

  TFDDatSColumnsCalculateEvent = procedure (ARow: TFDDatSRow) of object;

  TFDDatSMechanismKind = (mkFilter, mkSort, mkHasList, mkHasRow, mkPost);
  TFDDatSMechanismKinds = set of TFDDatSMechanismKind;

  TFDDatSRowVersion = (rvDefault, rvCurrent, rvOriginal, rvPrevious, rvProposed);
  TFDDatSRowState = (
    rsInitializing,
    rsDetached, rsInserted, rsDeleted, rsModified, rsUnchanged,
    rsEditing, rsCalculating, rsChecking, rsDestroying, rsForceWrite,
    rsImportingCurent, rsImportingOriginal, rsImportingProposed);
  TFDDatSRowStates = set of TFDDatSRowState;

  TFDDatSProcessNestedRowsMethod = procedure (ARow: TFDDatSRow) of object;

  TFDDatSConstraintRule = (crCascade, crRestrict, crNullify);
  TFDDatSConstraintARRule = (arNone, arCascade);

  TFDDatSViewState = (vsOutdated, vsProcessing);
  TFDDatSViewStates = set of TFDDatSViewState;

  TFDDatSViewCreator = (
    vcUser,
    vcUniqueConstraint, vcForeignKeyConstraint, vcChildRelation,
      vcDefaultView, vcErrorView, vcChangesView, vcSelectView,
    vcDataSetIndex, vcDataSetTempIndex, vcDataSetFilter, vsDataSetDelta);
  TFDDatSViewProcessRowStatus = (psAccepted, psRejected, psUnchanged);

  TFDDatSGroupPosition = (gpFirst, gpMiddle, gpLast);
  TFDDatSGroupPositions = set of TFDDatSGroupPosition;

  TFDCompareRowsProc = function (ARow1, ARow2: TFDDatSRow;
    AColumnCount: Integer; AOptions: TFDCompareDataOptions): Integer of object;

  TFDFilterRowEvent = function (AMech: TFDDatSMechFilter; ARow: TFDDatSRow;
    AVersion: TFDDatSRowVersion): Boolean of object;

  TFDDatSHandleMode = (lmStandard, lmMove, lmHavyMove, lmFetching,
    lmHavyFetching, lmDestroying, lmRefreshing, lmLoading, lmHavyLoading);
  PFDDatSLoadState = ^TFDDatSLoadState;
  TFDDatSLoadState = record
    FRestoreState: Boolean;
    FPrevMode: TFDDatSHandleMode;
    FViewsActive: Boolean;
    FConstraintsEnforce: Boolean;
    FSubStates: array of PFDDatSLoadState;
  end;
  TFDDatSLoadStates = array of TFDDatSLoadState;

  TFDDatSCheckTime = (ctAtEditEnd, ctAtColumnChange);

  TFDDatSNotifyParam = record
    FKind: TFDDatSNotificationKind;
    FReason: TFDDatSNotificationReason;
    FParam1, FParam2: NativeInt;
  end;
  PFDDatSNotifyParam = ^TFDDatSNotifyParam;

  PFDDataObject = ^TFDDatSObject;
  TFDDatSObject = class (TFDStorableObject)
  private
    {$IFDEF LINUX} [unsafe] {$ELSE} [weak] {$ENDIF} FOwner: TFDDatSObject;
    FLockNotificationCount: Word;
    // following fields must be in TFDDatSRow, but moved
    // here to pack FLockNotificationCount, FRowPriorState and
    // FRowState into double word
    FRowPriorState: TFDDatSRowState;
    FRowState: TFDDatSRowState;
    class function MetaCompareText(const AStr1, AStr2: String): Integer; static; inline;
  protected
    function GetList: TFDDatSList; virtual;
    function GetOwnerByClass(AClass: TFDDatSObjectClass): TFDDatSObject;
    function GetManager: TFDDatSManager; virtual;
    function GetTable: TFDDatSTable; virtual;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); virtual;
    procedure Notify(AParam: PFDDatSNotifyParam); overload; virtual;
    procedure Notify(AKind: TFDDatSNotificationKind;
      AReason: TFDDatSNotificationReason; AParam1, AParam2: NativeInt); overload;
    procedure LockNotification;
    procedure UnlockNotification;
    procedure DoListInserted; virtual;
    procedure DoListInserting; virtual;
    procedure DoListRemoved(ANewOwner: TFDDatSObject); virtual;
    procedure DoListRemoving; virtual;
    function GetIndex: Integer; virtual;
    class function GetClassPrefix: String; override;
  public
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); virtual;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; virtual;
    function IndexOf(AObj: TFDDatSObject): Integer; overload; virtual;
    property Index: Integer read GetIndex;
    property Owner: TFDDatSObject read FOwner;
    property List: TFDDatSList read GetList;
    property Manager: TFDDatSManager read GetManager;
    property Table: TFDDatSTable read GetTable;
  end;

  TFDDatSNamedObject = class (TFDDatSObject)
  private
    FName: String;
    FPrevName: String;
    function GetNamedList: TFDDatSNamedList;
    procedure SetName(const AValue: String);
    function GetDefaultName: String;
    function GetIsDefaultName: Boolean;
  protected
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
    property PrevName: String read FPrevName;
    property DefaultName: String read GetDefaultName;
    property IsDefaultName: Boolean read GetIsDefaultName;
  public
    constructor Create; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property Name: String read FName write SetName;
    property NamedList: TFDDatSNamedList read GetNamedList;
  end;

  TFDDatSBindedObject = class (TFDDatSNamedObject)
  private
    FSourceName: String;
    FSourceID: Integer;
  protected
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; override;
    procedure Assign(AObj: TFDDatSObject); override;
    property SourceName: String read FSourceName write FSourceName;
    property SourceID: Integer read FSourceID write FSourceID;
  end;

  TFDDatSList = class (TFDDatSObject)
  private
    FArray: array of TFDDatSObject;
    FCapacity, FCount: Integer;
    FOwnObjects: Boolean;
    FMinimumCapacity: Integer;
    function GetItemsI(AIndex: Integer): TFDDatSObject; inline;
    procedure SetCapacity(const AValue: Integer);
    procedure SetMinimumCapacity(const AValue: Integer);
  protected
    FDefaultReason: TFDDatSNotificationReason;
    procedure AddEx(AObj: TFDDatSObject);
    function AddObject(AObj: TFDDatSObject): Integer; inline;
    procedure AddObjectAt(AObj: TFDDatSObject; AIndex: Integer); virtual;
    procedure Notify(AParam: PFDDatSNotifyParam); override;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure Copy(ASource: TFDDatSList);
    class function GetObjectStyle: TFDStorageObjectStyle; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
    property Capacity: Integer read FCapacity write SetCapacity;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); override;
    procedure Clear; virtual;
    function ContainsObj(AObj: TFDDatSObject): Boolean;
    function IndexOf(AObj: TFDDatSObject): Integer; override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    function Remove(AObj: TFDDatSObject; ANotDestroy: Boolean = False): Integer;
    procedure RemoveAt(AIndex: Integer; ANotDestroy: Boolean = False); virtual;
    function MoveTo(AFromIndex, AToIndex: Integer): Boolean; virtual;
    property Count: Integer read FCount;
    property ItemsI[AIndex: Integer]: TFDDatSObject read GetItemsI; default;
    property OwnObjects: Boolean read FOwnObjects write FOwnObjects default False;
    property MinimumCapacity: Integer read FMinimumCapacity write SetMinimumCapacity default 0;
  end;

  TFDDatSNamedList = class (TFDDatSList)
  private
    FNamesIndex: TFDStringList;
    function GetItemsI(AIndex: Integer): TFDDatSNamedObject; inline;
    function Find(const AName: String; out AIndex: Integer): Boolean;
    function FindRealIndex(const AName: String; out AIndex: Integer): Boolean;
    procedure ErrorNameNotFound(const AName: String);
  protected
    procedure CheckUniqueName(const AName: String; ASelf: TFDDatSNamedObject);
    procedure Notify(AParam: PFDDatSNotifyParam); override;
    procedure AddObjectAt(AObj: TFDDatSObject; AIndex: Integer); override;
    class function GetObjectStyle: TFDStorageObjectStyle; override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    function ContainsName(const AName: String): Boolean;
    function IndexOfName(const AName: String): Integer;
    function ItemByName(const AName: String): TFDDatSNamedObject;
    procedure RemoveByName(const AName: String);
    function BuildUniqueName(const AName: String): String;
    property ItemsI[AIndex: Integer]: TFDDatSNamedObject read GetItemsI; default;
    property ItemsS[const AName: String]: TFDDatSNamedObject read ItemByName;
  end;

  TFDDatSBindedList = class (TFDDatSNamedList)
  private
    function GetItemsI(AIndex: Integer): TFDDatSBindedObject; inline;
  public
    function ItemByName(const AName: String): TFDDatSBindedObject;
    function IndexOfSourceID(AID: Integer): Integer;
    function IndexOfSourceName(const AName: String): Integer;
    property ItemsI[AIndex: Integer]: TFDDatSBindedObject read GetItemsI; default;
    property ItemsS[const AName: String]: TFDDatSBindedObject read ItemByName;
  end;

  TFDDatSColumn = class (TFDDatSBindedObject)
  private
    FIndex: Integer;
    FAttributes: TFDDataAttributes;
    FAutoIncrement: Boolean;
    FAutoIncrementSeed: Integer;
    FAutoIncrementStep: Integer;
    FCaption: String;
    FDataType: TFDDataType;
    FExpression: String;
    FOptions: TFDDataOptions;
    FPrecision: Integer;
    FSize: LongWord;
    FStorageSize: Integer;
    FEvaluator: IFDStanExpressionEvaluator;
    FScale: Integer;
    FSourceDataType: TFDDataType;
    FSourcePrecision: Integer;
    FSourceScale: Integer;
    FSourceSize: LongWord;
    FSourceDataTypeName: String;
    FOriginTabName: String;
    FOriginColName: String;
    FSourceGenerator: String;
    function GetCaption: String;
    function GetColumnList: TFDDatSColumnList;
    function GetReadOnly: Boolean;
    procedure SetAttributes(const AValue: TFDDataAttributes);
    procedure SetAutoIncrement(const AValue: Boolean);
    procedure SetAutoIncrementSeed(const AValue: Integer);
    procedure SetAutoIncrementStep(const AValue: Integer);
    procedure SetCaption(const AValue: String);
    procedure SetDataType(const AValue: TFDDataType);
    procedure SetExpression(const AValue: String);
    procedure SetEvaluator(const AValue: IFDStanExpressionEvaluator);
    procedure SetOptions(const AValue: TFDDataOptions);
    procedure SetPrecision(const AValue: Integer);
    procedure SetSize(const AValue: LongWord);
    procedure SetScale(const AValue: Integer);
    function GetNestedTable: TFDDatSTable;
    function GetParentColumn: TFDDatSColumn;
    function GetAllowDBNull: Boolean;
    procedure SetAllowDBNull(const AValue: Boolean);
    function GetUnique: Boolean;
    procedure SetUnique(const AValue: Boolean);
    procedure UpdateUniqueKey(AUnique: Boolean);
    procedure SetReadOnly(const AValue: Boolean);
    procedure DefinitionChanging(ALayoutChanging: Boolean);
    procedure SetServerAutoIncrement(const Value: Boolean);
    function GetDisplayWidth: Integer;
    procedure UpdateStorageSize;
    function GetStorageSize: Integer; inline;
    function GetServerAutoIncrement: Boolean;
    procedure SetSourceGenerator(const AValue: String);
    function GetActualCaption: String;
    function GetActualAttributes: TFDDataAttributes;
    function GetActualOptions: TFDDataOptions;
    function GetActualOriginColName: String;
    function GetActualGenerator: String;
  protected
    procedure DefinitionChanged(ALayoutChanged: Boolean);
    procedure Notify(AParam: PFDDatSNotifyParam); override;
    procedure DoListInserting; override;
    procedure DoListInserted; override;
    procedure DoListRemoving; override;
    function GetIndex: Integer; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    constructor Create(const AName: String; AType: TFDDataType = dtAnsiString;
      const AExpression: String = ''); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsAutoIncrementType(const AValue: TFDDataType): Boolean;
    // ro
    property ColumnList: TFDDatSColumnList read GetColumnList;
    property DisplayWidth: Integer read GetDisplayWidth;
    property Index: Integer read GetIndex;
    property NestedTable: TFDDatSTable read GetNestedTable;
    property ParentColumn: TFDDatSColumn read GetParentColumn;
    property StorageSize: Integer read GetStorageSize;
    property ActualCaption: String read GetActualCaption;
    property ActualOptions: TFDDataOptions read GetActualOptions;
    property ActualAttributes: TFDDataAttributes read GetActualAttributes;
    property ActualOriginTabName: String read FOriginTabName;
    property ActualOriginColName: String read GetActualOriginColName;
    property ActualGenerator: String read GetActualGenerator;
    // rw
    property AllowDBNull: Boolean read GetAllowDBNull write SetAllowDBNull
      default True;
    property Attributes: TFDDataAttributes read FAttributes write
      SetAttributes default [caAllowNull];
    property AutoIncrement: Boolean read FAutoIncrement write SetAutoIncrement
      default False;
    property ServerAutoIncrement: Boolean read GetServerAutoIncrement
      write SetServerAutoIncrement default False;
    property AutoIncrementSeed: Integer read FAutoIncrementSeed write
      SetAutoIncrementSeed default 1;
    property AutoIncrementStep: Integer read FAutoIncrementStep write
      SetAutoIncrementStep default 1;
    property Caption: String read GetCaption write SetCaption;
    property DataType: TFDDataType read FDataType write SetDataType
      default dtUnknown;
    property Expression: String read FExpression write SetExpression;
    property Evaluator: IFDStanExpressionEvaluator read FEvaluator write SetEvaluator;
    property Options: TFDDataOptions read FOptions write SetOptions
      default [coAllowNull, coInUpdate, coInWhere];
    property Precision: Integer read FPrecision write SetPrecision default 0;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property Scale: Integer read FScale write SetScale default 0;
    property Size: LongWord read FSize write SetSize default 50;
    property SourceDataType: TFDDataType read FSourceDataType write FSourceDataType;
    property SourcePrecision: Integer read FSourcePrecision write FSourcePrecision;
    property SourceScale: Integer read FSourceScale write FSourceScale;
    property SourceSize: LongWord read FSourceSize write FSourceSize;
    property SourceDataTypeName: String read FSourceDataTypeName
      write FSourceDataTypeName;
    property SourceDirectory: String read FSourceDataTypeName
      write FSourceDataTypeName;
    property SourceGenerator: String read FSourceGenerator
      write SetSourceGenerator;
    property OriginTabName: String read FOriginTabName write FOriginTabName;
    property OriginColName: String read FOriginColName write FOriginColName;
    property Unique: Boolean read GetUnique write SetUnique default False;
  end;

  TFDDatSTableExpressionDS = class(TInterfacedObject, IFDStanExpressionDataSource)
  private
    FTable: TFDDatSTable;
    FRow: TFDDatSRow;
  protected
    // IFDStanExpressionDataSource
    function GetVarIndex(const AName: String): Integer; virtual;
    function GetVarType(AIndex: Integer): TFDDataType; virtual;
    function GetVarScope(AIndex: Integer): TFDExpressionScopeKind; virtual;
    function GetVarData(AIndex: Integer): Variant; virtual;
    procedure SetVarData(AIndex: Integer; const AValue: Variant); virtual;
    function GetSubAggregateValue(AIndex: Integer): Variant; virtual;
    function GetPosition: Pointer; virtual;
    procedure SetPosition(AValue: Pointer); virtual;
    function GetRowNum: Integer; virtual;
    function GetDatabase: String; virtual;
    function GetUser: String; virtual;
  public
    constructor Create(ATable: TFDDatSTable);
  end;

  TFDArrayOfInteger = array of Integer;
  TFDArrayOfLongWord = array of LongWord;
  TFDArrayOfByte = array of Byte;
  TFDDatSColumnList = class (TFDDatSBindedList)
  private
    FAutoIncs: TFDArrayOfInteger;
    FDataOffsets: TFDArrayOfLongWord;
    FNullOffsets: TFDArrayOfLongWord;
    FNullMasks: TFDArrayOfByte;
    FFetchedSize: Integer;
    FInvariantMap: TFDArrayOfInteger;
    FInvariantSize: Integer;
    FInvariants: Integer;
    FParentRowRefCol: Integer;
    FParentCol: Integer;
    FHasThings: TFDDatSColumnThings;
    FOnCalcColumns: TFDDatSColumnsCalculateEvent;
    FInlineDataSize: Word;
    FInfoSize: Integer;
    function GetCurrValues(AIndex: Integer): Variant;
    function GetItemsI(AIndex: Integer): TFDDatSColumn; inline;
    procedure UpdateLayout;
    procedure SetInlineDataSize(const AValue: Word);
    function GetStorageSize: LongWord;
  protected
    procedure CheckUpdateLayout;
    procedure TerminateLayout;
    procedure Notify(AParam: PFDDatSNotifyParam); override;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure AddObjectAt(AObj: TFDDatSObject; AIndex: Integer); override;
    procedure FixAutoIncs(ARow: TFDDatSRow);
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor CreateForTable(ATable: TFDDatSTable);
    procedure Assign(AObj: TFDDatSObject); override;
    function Add(AObj: TFDDatSColumn): Integer; overload;
    function Add(const AName: String; AType: TFDDataType = dtAnsiString;
      const AExpression: String = ''): TFDDatSColumn; overload;
    procedure RemoveAt(AIndex: Integer; ANotDestroy: Boolean = False); override;
    function ColumnByName(const AName: String): TFDDatSColumn;
    property CurrValues[AIndex: Integer]: Variant read GetCurrValues;
    property ItemsI[AIndex: Integer]: TFDDatSColumn read GetItemsI; default;
    property ItemsS[const AName: String]: TFDDatSColumn read ColumnByName;
    property DataOffsets: TFDArrayOfLongWord read FDataOffsets;
    property NullOffsets: TFDArrayOfLongWord read FNullOffsets;
    property NullMasks: TFDArrayOfByte read FNullMasks;
    property ParentRowRefCol: Integer read FParentRowRefCol;
    property ParentCol: Integer read FParentCol;
    property StorageSize: LongWord read GetStorageSize;
    property HasThings: TFDDatSColumnThings read FHasThings;
    property OnCalcColumns: TFDDatSColumnsCalculateEvent read FOnCalcColumns
      write FOnCalcColumns;
    property InlineDataSize: Word read FInlineDataSize write SetInlineDataSize
      default C_FD_DefInlineDataSize;
  end;

  TFDDatSColumnSublist = class (TObject)
  private
    FArray: array of TFDDatSColumn;
    FNames: String;
    function GetCount: Integer; inline;
    function GetItemsI(AIndex: Integer): TFDDatSColumn; inline;
    procedure Add(ACol: TFDDatSColumn);
  public
    function HandleNotification(AParam: PFDDatSNotifyParam): Boolean;
    procedure Clear;
    procedure Fill(AObject: TFDDatSObject; const AFields: String;
      ACaseInsensitiveColumnList: TFDDatSColumnSublist = nil;
      ADescendingColumnList: TFDDatSColumnSublist = nil);
    function IndexOf(AColumn: TFDDatSColumn): Integer;
    function IndexOfName(const AName: String): Integer;
    function FindColumn(const AName: String): TFDDatSColumn;
    function Matches(AList: TFDDatSColumnSublist; ACount: Integer = -1): Boolean;
    property Count: Integer read GetCount;
    property ItemsI[AIndex: Integer]: TFDDatSColumn read GetItemsI; default;
    property ItemsS[const AName: String]: TFDDatSColumn read FindColumn;
    property Names: String read FNames;
  end;

  TFDDatSConstraintBase = class (TFDDatSNamedObject)
  private
    FEnforce: Boolean;
    FLastActualEnforce: Boolean;
    FMessage: String;
    FCheckTime: TFDDatSCheckTime;
    FRely: Boolean;
    function GetActualEnforce: Boolean;
    function GetConstraintList: TFDDatSConstraintList;
    procedure SetEnforce(const AValue: Boolean);
    procedure ResolveEnforce(const AName, AValue: String);
  protected
    procedure DoCheck(ARow: TFDDatSRow; AProposedState:
      TFDDatSRowState); virtual;
    procedure DoListInserted; override;
    procedure DoListRemoved(ANewOwner: TFDDatSObject); override;
    procedure DoEnforceUpdated; virtual;
    procedure EnforceUpdated;
    function CheckRow(ARow: TFDDatSRow): Boolean; virtual;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    procedure Check(ARow: TFDDatSRow; AProposedState: TFDDatSRowState;
      ATime: TFDDatSCheckTime);
    procedure CheckAll;
    property ActualEnforce: Boolean read GetActualEnforce;
    property ConstraintList: TFDDatSConstraintList read GetConstraintList;
    property Enforce: Boolean read FEnforce write SetEnforce default True;
    property Rely: Boolean read FRely write FRely default True;
    property CheckTime: TFDDatSCheckTime read FCheckTime write FCheckTime default ctAtEditEnd;
    property Message: String read FMessage write FMessage;
  end;

  TFDDatSConstraintList = class (TFDDatSNamedList)
  private
    FEnforce: Boolean;
    function GetItemsI(AIndex: Integer): TFDDatSConstraintBase; inline;
    procedure SetEnforce(const AValue: Boolean);
    procedure ResolveEnforce(const AName, AValue: String);
  protected
    procedure EnforceUpdated;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor CreateForTable(ATable: TFDDatSTable);
    procedure Assign(AObj: TFDDatSObject); override;
    function Add(AObj: TFDDatSConstraintBase): Integer; overload;
    // UK
    function AddUK(const AName: String; AColumn: TFDDatSColumn;
      APrimaryKey: Boolean = True): TFDDatSUniqueConstraint; overload;
    function AddUK(const AName: String; const AColumns: array of TFDDatSColumn;
      APrimaryKey: Boolean = True): TFDDatSUniqueConstraint; overload;
    function AddUK(const AName: String; const AColumnNames: String;
      APrimaryKey: Boolean = True): TFDDatSUniqueConstraint; overload;
    // FK
    function AddFK(const AName: String; APrimaryKeyColumn,
      AForeignKeyColumn: TFDDatSColumn): TFDDatSForeignKeyConstraint; overload;
    function AddFK(const AName: String; const APrimaryKeyColumns,
      AForeignKeyColumns: array of TFDDatSColumn): TFDDatSForeignKeyConstraint; overload;
    function AddFK(const AName: String; const AParentTableName, APrimaryKeyColumns,
      AForeignKeyColumns: String): TFDDatSForeignKeyConstraint; overload;
    function AddFK(const AName: String; AParentTable: TFDDatSTable;
      const APrimaryKeyColumns, AForeignKeyColumns: String): TFDDatSForeignKeyConstraint; overload;
    // CHK
    function AddChk(const AName, AExpression: String; const AMessage: String = '';
      ACheckTime: TFDDatSCheckTime = ctAtEditEnd): TFDDatSCheckConstraint; overload;
    procedure Check(ARow: TFDDatSRow; AProposedState: TFDDatSRowState;
      ATime: TFDDatSCheckTime);
    function ConstraintByName(const AName: String): TFDDatSConstraintBase;
    function FindUnique(const AFields: String): TFDDatSUniqueConstraint;
    function FindPrimaryKey: TFDDatSUniqueConstraint;
    procedure CheckAll;
    property Enforce: Boolean read FEnforce write SetEnforce default True;
    property ItemsI[AIndex: Integer]: TFDDatSConstraintBase read GetItemsI; default;
    property ItemsS[const AName: String]: TFDDatSConstraintBase read ConstraintByName;
  end;

  TFDDatSUniqueConstraint = class (TFDDatSConstraintBase)
  private
    FColumnNames: String;
    FColumns: TFDDatSColumnSublist;
    FOptions: TFDSortOptions;
    function GetColumnCount: Integer;
    function GetColumns(AIndex: Integer): TFDDatSColumn;
    procedure SetColumnNames(const AValue: String);
    procedure SetOptions(const AValue: TFDSortOptions);
    function GetIsPrimaryKey: Boolean;
    procedure SetIsPrimaryKey(const AValue: Boolean);
    function GetUniqueSortedView: TFDDatSView;
  protected
    procedure DoCheck(ARow: TFDDatSRow;
      AProposedState: TFDDatSRowState); override;
    procedure DoEnforceUpdated; override;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    constructor Create(AColumn: TFDDatSColumn;
      APrimaryKey: Boolean = False); overload;
    constructor Create(const AColumns: array of TFDDatSColumn;
      APrimaryKey: Boolean = False); overload;
    constructor Create(const AName: String; AColumn: TFDDatSColumn;
      APrimaryKey: Boolean = False); overload;
    constructor Create(const AName: String; const AColumns: array of TFDDatSColumn;
      APrimaryKey: Boolean = False); overload;
    constructor Create(const AName, AColumnNames: String;
      APrimaryKey: Boolean = False); overload;
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property ColumnNames: String read FColumnNames write SetColumnNames;
    property ColumnCount: Integer read GetColumnCount;
    property Columns[AIndex: Integer]: TFDDatSColumn read GetColumns;
    property Options: TFDSortOptions read FOptions write SetOptions default [soUnique];
    property IsPrimaryKey: Boolean read GetIsPrimaryKey write SetIsPrimaryKey;
  end;

  TFDDatSForeignKeyConstraint = class (TFDDatSConstraintBase)
  private
    FColumnNames: String;
    FColumns: TFDDatSColumnSublist;
    FDeleteRule: TFDDatSConstraintRule;
    FRelatedColumnNames: String;
    FRelatedColumns: TFDDatSColumnSublist;
    FRelatedTable: TFDDatSTable;
    FUpdateRule: TFDDatSConstraintRule;
    FParentMessage: String;
    FRelatedTableName: String;
    FCascadingRows: TFDObjList;
    FAcceptRejectRule: TFDDatSConstraintARRule;
    FFieldValueRequired: Boolean;
    FInsertRule: TFDDatSConstraintRule;
    FCascadeOriginal: Boolean;
    function GetColumnCount: Integer;
    function GetColumns(AIndex: Integer): TFDDatSColumn;
    function GetRelatedColumnCount: Integer;
    function GetRelatedColumns(AIndex: Integer): TFDDatSColumn;
    procedure SetColumnNames(const AValue: String);
    procedure SetRelatedColumnNames(const AValue: String);
    function GetChildSortedView: TFDDatSView;
    function GetMasterSortedView: TFDDatSView;
    procedure SetRelatedTableName(const AValue: String);
  protected
    function CheckRow(ARow: TFDDatSRow): Boolean; override;
    procedure DoCheck(ARow: TFDDatSRow; AProposedState:
      TFDDatSRowState); override;
    procedure DoInsertAssignParentValues(AParentRow, AChildRow: TFDDatSRow);
    procedure DoEnforceUpdated; override;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; override;
    constructor Create(AParentColumn, AChildColumn: TFDDatSColumn;
      ADeleteRule: TFDDatSConstraintRule = crCascade;
      AUpdateRule: TFDDatSConstraintRule = crRestrict); overload;
    constructor Create(const AParentColumns, AChildColumns: array of TFDDatSColumn;
      ADeleteRule: TFDDatSConstraintRule = crCascade;
      AUpdateRule: TFDDatSConstraintRule = crRestrict); overload;
    constructor Create(const AName: String; AParentColumn, AChildColumn: TFDDatSColumn;
      ADeleteRule: TFDDatSConstraintRule = crCascade;
      AUpdateRule: TFDDatSConstraintRule = crRestrict); overload;
    constructor Create(const AName: String; const AParentColumns, AChildColumns: array of TFDDatSColumn;
      ADeleteRule: TFDDatSConstraintRule = crCascade;
      AUpdateRule: TFDDatSConstraintRule = crRestrict); overload;
    constructor Create(const AName, AParentTableName, AParentColumnNames,
      AChildColumnNames: String;
      ADeleteRule: TFDDatSConstraintRule = crCascade;
      AUpdateRule: TFDDatSConstraintRule = crRestrict); overload;
    constructor Create(const AName: String; AParentTable: TFDDatSTable;
      const AParentColumnNames, AChildColumnNames: String;
      ADeleteRule: TFDDatSConstraintRule = crCascade;
      AUpdateRule: TFDDatSConstraintRule = crRestrict); overload;
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    // ro
    property ColumnCount: Integer read GetColumnCount;
    property Columns[AIndex: Integer]: TFDDatSColumn read GetColumns;
    property RelatedColumnCount: Integer read GetRelatedColumnCount;
    property RelatedColumns[AIndex: Integer]: TFDDatSColumn read GetRelatedColumns;
    property RelatedTable: TFDDatSTable read FRelatedTable;
    // rw
    property ColumnNames: String read FColumnNames write SetColumnNames;
    property DeleteRule: TFDDatSConstraintRule read FDeleteRule
      write FDeleteRule default crCascade;
    property InsertRule: TFDDatSConstraintRule read FInsertRule
      write FInsertRule default crCascade;
    property ParentMessage: String read FParentMessage write FParentMessage;
    property RelatedTableName: String read FRelatedTableName
      write SetRelatedTableName;
    property RelatedColumnNames: String read FRelatedColumnNames
      write SetRelatedColumnNames;
    property UpdateRule: TFDDatSConstraintRule read FUpdateRule
      write FUpdateRule default crCascade;
    property AcceptRejectRule: TFDDatSConstraintARRule read FAcceptRejectRule
      write FAcceptRejectRule default arCascade;
    property FieldValueRequired: Boolean read FFieldValueRequired
      write FFieldValueRequired default False;
    property CascadeOriginal: Boolean read FCascadeOriginal
      write FCascadeOriginal default False;
  end;

  TFDDatSCheckConstraint = class (TFDDatSConstraintBase)
  private
    FEvaluator: IFDStanExpressionEvaluator;
    FExpression: String;
    procedure SetExpression(const AValue: String);
  protected
    procedure DoCheck(ARow: TFDDatSRow; AProposedState:
      TFDDatSRowState); override;
    procedure DoEnforceUpdated; override;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create(const AExpression: string); overload;
    constructor Create(const AName, AExpression: string; const AMessage: String = '';
      ACheckTime: TFDDatSCheckTime = ctAtEditEnd); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property Expression: String read FExpression write SetExpression;
  end;

  TFDDatSRelation = class (TFDDatSNamedObject)
  private
    FChildColumnNames: String;
    FChildColumns: TFDDatSColumnSublist;
    FChildKeyConstraint: TFDDatSForeignKeyConstraint;
    FChildTable: TFDDatSTable;
    FNested: Boolean;
    FParentColumnNames: String;
    FParentColumns: TFDDatSColumnSublist;
    FParentKeyConstraint: TFDDatSUniqueConstraint;
    FParentTable: TFDDatSTable;
    FRefs: TFDRefCounter;
    FOwnConstraints: Boolean;
    function GetChildColumnCount: Integer;
    function GetChildColumns(AIndex: Integer): TFDDatSColumn;
    function GetIsDefined: Boolean;
    function GetParentColumnCount: Integer;
    function GetParentColumns(AIndex: Integer): TFDDatSColumn;
    function GetRelationList: TFDDatSRelationList;
    procedure FillChildColumns(ATable: Boolean);
    procedure SetChildColumnNames(const AValue: String);
    procedure SetChildTable(const AValue: TFDDatSTable);
    procedure SetChildKeyConstraint(const AValue: TFDDatSForeignKeyConstraint);
    procedure SetNested(const AValue: Boolean);
    procedure FillParentColumns(ATable: Boolean);
    procedure SetParentColumnNames(const AValue: String);
    procedure SetParentTable(const AValue: TFDDatSTable);
    procedure SetParentKeyConstraint(const AValue: TFDDatSUniqueConstraint);
    procedure Check;
    procedure ResolveReferences(const AName, AValue: String);
    function GetIsRefCounted: Boolean;
  protected
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; override;
    constructor Create(const ARelName: String; AParentColumn,
      AChildColumn: TFDDatSColumn; ANested: Boolean = False;
      ACreateConstraints: Boolean = True); overload;
    constructor Create(const ARelName: String; const AParentColumns,
      AChildColumns: array of TFDDatSColumn; ANested: Boolean = False;
      ACreateConstraints: Boolean = True); overload;
    constructor Create(const ARelName: String; const AParentColumnNames,
      AChildColumnNames: String; AParentTable, AChildTable: TFDDatSTable;
      ANested: Boolean = False;
      ACreateConstraints: Boolean = True); overload;
    constructor Create(const ARelName: String; APK: TFDDatSUniqueConstraint;
      AFK: TFDDatSForeignKeyConstraint); overload;
    destructor Destroy; override;
    function BuildChildKeyConstraint: TFDDatSForeignKeyConstraint;
    function BuildParentKeyConstraint: TFDDatSUniqueConstraint;
    procedure Assign(AObj: TFDDatSObject); override;
    procedure CountRef(AInit: Integer = 1);
    procedure AddRef;
    procedure RemRef;
    property IsRefCounted: Boolean read GetIsRefCounted;
    property ChildColumnCount: Integer read GetChildColumnCount;
    property ChildColumnNames: String read FChildColumnNames write
      SetChildColumnNames;
    property ChildColumns[AIndex: Integer]: TFDDatSColumn read
      GetChildColumns;
    property ChildKeyConstraint: TFDDatSForeignKeyConstraint read
      FChildKeyConstraint write SetChildKeyConstraint;
    property ChildTable: TFDDatSTable read FChildTable write SetChildTable;
    property IsDefined: Boolean read GetIsDefined;
    property Nested: Boolean read FNested write SetNested default False;
    property ParentColumnCount: Integer read GetParentColumnCount;
    property ParentColumnNames: String read FParentColumnNames write
      SetParentColumnNames;
    property ParentColumns[AIndex: Integer]: TFDDatSColumn read
      GetParentColumns;
    property ParentKeyConstraint: TFDDatSUniqueConstraint read
      FParentKeyConstraint write SetParentKeyConstraint;
    property ParentTable: TFDDatSTable read FParentTable write SetParentTable;
    property RelationList: TFDDatSRelationList read GetRelationList;
  end;

  TFDDatSRelationArray = array of TFDDatSRelation;

  TFDDatSRelationList = class (TFDDatSNamedList)
  private
    function GetItemsI(AIndex: Integer): TFDDatSRelation; inline;
  protected
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
  public
    constructor CreateForManager(AManager: TFDDatSManager);
    function Add(AObj: TFDDatSRelation): Integer; overload;
    function Add(const ARelName: String; AParentColumn, AChildColumn:
      TFDDatSColumn; ANested: Boolean = False;
      ACreateConstraints: Boolean = True): TFDDatSRelation; overload;
    function Add(AParentColumn, AChildColumn: TFDDatSColumn;
      ANested: Boolean = False; ACreateConstraints: Boolean = True):
      TFDDatSRelation; overload;
    function Add(const ARelName: String; const AParentColumns, AChildColumns:
      array of TFDDatSColumn; ANested: Boolean = False;
      ACreateConstraints: Boolean = True): TFDDatSRelation; overload;
    function Add(const ARelName: String; const AParentColumnNames,
      AChildColumnNames: String; AParentTable, AChildTable: TFDDatSTable;
      ANested: Boolean = False;
      ACreateConstraints: Boolean = True): TFDDatSRelation; overload;
    function Add(const AParentColumns, AChildColumns: array of TFDDatSColumn;
      ANested: Boolean = False;
      ACreateConstraints: Boolean = True): TFDDatSRelation; overload;
    function Add(const ARelName: String; APK: TFDDatSUniqueConstraint;
      AFK: TFDDatSForeignKeyConstraint): TFDDatSRelation; overload;
    function FindRelation(AParentTable, AChildTable: TFDDatSTable;
      AMBNested: Boolean): TFDDatSRelation; overload;
    function FindRelation(AParentTable: TFDDatSTable;
      AObjColumn: TFDDatSColumn): TFDDatSRelation; overload;
    function FindRelation(ANestedTable: TFDDatSTable): TFDDatSRelation; overload;
    function RelationByName(const AName: String): TFDDatSRelation;
    function GetRelationsForTable(AParentRelations: Boolean;
      ATable: TFDDatSTable): TFDDatSRelationArray;
    property ItemsI[AIndex: Integer]: TFDDatSRelation read GetItemsI; default;
    property ItemsS[const AName: String]: TFDDatSRelation read RelationByName;
  end;

  TFDDatSMechSortSource = (ssColumns, ssExpression, ssRowId);
  IFDDatSMechSort = interface (IUnknown)
    ['{3E9B315B-F456-4175-A864-B2573C4A2019}']
    // private
    function GetSortOptions: TFDSortOptions;
    function GetSortColumnList: TFDDatSColumnSublist;
    function GetSortDescendingColumnList: TFDDatSColumnSublist;
    function GetSortCaseInsensitiveColumnList: TFDDatSColumnSublist;
    function GetSortSource: TFDDatSMechSortSource;
    function GetSortedRows: TFDDatSRowListBase;
    // public
    procedure Sort(AList: TFDDatSRowListBase);
    function SortingOn(const AColumnNames: String;
      ARequiredOptions, AProhibitedOptions: TFDSortOptions): Boolean; overload;
    function SortingOn(AKeyColumnList: TFDDatSColumnSublist; AKeyColumnCount: Integer;
      ARequiredOptions, AProhibitedOptions: TFDSortOptions): Boolean; overload;
    function CompareRows(ARow1, ARow2: TFDDatSRow;
      AColumnCount: Integer; AOptions: TFDCompareDataOptions): Integer; overload;
    function CompareRows(ARow1, ARow2: TFDDatSRow;
      AColumnCount: Integer): Integer; overload;
    function Search(ARowList: TFDDatSRowListBase; AKeyRow: TFDDatSRow;
      AKeyColumnList, AKeyColumnList2: TFDDatSColumnSublist; AKeyColumnCount: Integer;
      AOptions: TFDLocateOptions; out AIndex: Integer; out AFound: Boolean;
      ARowVersion: TFDDatSRowVersion = rvDefault): Integer;
    procedure RemoveDuplicates(AList: TFDDatSRowListBase; AColumnCount: Integer);
    property SortOptions: TFDSortOptions read GetSortOptions;
    property SortColumnList: TFDDatSColumnSublist read GetSortColumnList;
    property SortDescendingColumnList: TFDDatSColumnSublist read GetSortDescendingColumnList;
    property SortCaseInsensitiveColumnList: TFDDatSColumnSublist read GetSortCaseInsensitiveColumnList;
    property SortSource: TFDDatSMechSortSource read GetSortSource;
    property SortedRows: TFDDatSRowListBase read GetSortedRows;
  end;

  TFDDatSMechBase = class (TFDDatSObject)
  private
    FPrevActualActive, FActive: Boolean;
    FLocator: Boolean;
    procedure SetActive(const AValue: Boolean);
    function GetView: TFDDatSView;
    function GetViewList: TFDDatSViewList;
    procedure ResolveActive(const AName, AValue: String);
  protected
    FKinds: TFDDatSMechanismKinds;
    function GetActualActive: Boolean; virtual;
    procedure DoListInserted; override;
    procedure DoListRemoving; override;
    procedure DoListRemoved(ANewOwner: TFDDatSObject); override;
    procedure DoActiveChanged; virtual;
    procedure CheckActiveChanged;
    function GetTable: TFDDatSTable; override;
    function GetRowsRange(var ARowList: TFDDatSRowListBase; out ABeginInd,
      AEndInd: Integer): Boolean; virtual;
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean; virtual;
    procedure PostProcess(AList: TFDDatSRowListBase); virtual;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    procedure Assign(AObj: TFDDatSObject); override;
    // ro
    property Table: TFDDatSTable read GetTable;
    property View: TFDDatSView read GetView;
    property ViewList: TFDDatSViewList read GetViewList;
    property ActualActive: Boolean read GetActualActive;
    property Kinds: TFDDatSMechanismKinds read FKinds;
    // rw
    property Active: Boolean read FActive write SetActive default False;
    property Locator: Boolean read FLocator write FLocator default False;
  end;
  TFDDatSMechBaseClass = class of TFDDatSMechBase;

  TFDDatSViewMechList = class (TFDDatSList)
  private
    function GetItemsI(AIndex: Integer): TFDDatSMechBase; inline;
  protected
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
  public
    constructor CreateForView(AView: TFDDatSView);
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean;
    function Add(AObj: TFDDatSMechBase): Integer;
    function AddSort(const AColumns: String; const ADescColumns: String = '';
      const ACaseInsColumns: String = ''; AOptions: TFDSortOptions = []): TFDDatSMechSort; overload;
    function AddSort(const AExpression: String; AOptions: TFDSortOptions): TFDDatSMechSort; overload;
    function AddDistinct(AColumnCount: Integer): TFDDatSMechDistinct; inline;
    function AddStates(AStates: TFDDatSRowStates = [rsInitializing, rsInserted,
      rsModified, rsUnchanged, rsEditing, rsCalculating, rsChecking]): TFDDatSMechRowState;
    function AddFilter(const AExpression: String; AOptions:
      TFDExpressionOptions = []; AEvent: TFDFilterRowEvent = nil): TFDDatSMechFilter;
    function AddError: TFDDatSMechError;
    function AddDetail(AParentRel: TFDDatSRelation;
      AParentRow: TFDDatSRow): TFDDatSMechDetails;
    procedure Clear; override;
    property ItemsI[AIndex: Integer]: TFDDatSMechBase read GetItemsI; default;
  end;

  TFDDatSMechSort = class (TFDDatSMechBase, IUnknown, IFDDatSMechSort)
  private
    FCaseInsensitiveColumnList: TFDDatSColumnSublist;
    FCaseInsensitiveColumns: String;
    FColumnList: TFDDatSColumnSublist;
    FColumns: String;
    FDescendingColumnList: TFDDatSColumnSublist;
    FDescendingColumns: String;
    FSortOptions: TFDSortOptions;
    FExpression: String;
    FEvaluator: IFDStanExpressionEvaluator;
    FSortSource: TFDDatSMechSortSource;
    FSortOptionsChanged: Boolean;
    FUniqueKey: TFDDatSUniqueConstraint;
    procedure SetCaseInsensitiveColumns(const AValue: String);
    procedure SetColumns(const AValue: String);
    procedure SetDescendingColumns(const AValue: String);
    procedure SetSortOptions(const AValue: TFDSortOptions);
    procedure SetExpression(const AValue: String);
    function CreateUniqueConstraint: TFDDatSUniqueConstraint;
    function MatchOptions(ARequiredOptions, AProhibitedOptions: TFDSortOptions): Boolean;
    function GetCompareDataOptions: TFDCompareDataOptions;
  protected
    procedure DoActiveChanged; override;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
    // IUnknown
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    // IFDDatSMechSortGS
    function GetSortOptions: TFDSortOptions;
    function GetSortColumnList: TFDDatSColumnSublist;
    function GetSortDescendingColumnList: TFDDatSColumnSublist;
    function GetSortCaseInsensitiveColumnList: TFDDatSColumnSublist;
    function GetSortSource: TFDDatSMechSortSource;
    function GetSortedRows: TFDDatSRowListBase;
    procedure Sort(AList: TFDDatSRowListBase);
    function SortingOn(const AColumnNames: String; ARequiredOptions,
      AProhibitedOptions: TFDSortOptions): Boolean; overload;
    function SortingOn(AKeyColumnList: TFDDatSColumnSublist; AKeyColumnCount: Integer;
      ARequiredOptions, AProhibitedOptions: TFDSortOptions): Boolean; overload;
    function CompareRows(ARow1, ARow2: TFDDatSRow;
      AColumnCount: Integer; AOptions: TFDCompareDataOptions): Integer; overload;
    function CompareRows(ARow1, ARow2: TFDDatSRow;
      AColumnCount: Integer): Integer; overload;
    function Search(ARowList: TFDDatSRowListBase; AKeyRow: TFDDatSRow;
      AKeyColumnList, AKeyColumnList2: TFDDatSColumnSublist; AKeyColumnCount: Integer;
      AOptions: TFDLocateOptions; out AIndex: Integer; out AFound: Boolean;
      ARowVersion: TFDDatSRowVersion = rvDefault): Integer;
    procedure RemoveDuplicates(AList: TFDDatSRowListBase; AColumnCount: Integer);
  public
    constructor Create; overload; override;
    constructor Create(const AColumns: String; const ADescColumns: String = '';
      const ACaseInsColumns: String = ''; AOptions: TFDSortOptions = []); overload;
    constructor Create(const AExpression: String; AOptions: TFDSortOptions); overload;
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property Expression: String read FExpression write SetExpression;
    property Columns: String read FColumns write SetColumns;
    property DescendingColumns: String read FDescendingColumns write SetDescendingColumns;
    property CaseInsensitiveColumns: String read FCaseInsensitiveColumns
      write SetCaseInsensitiveColumns;
    property SortOptions: TFDSortOptions read GetSortOptions write SetSortOptions default [];
    property SortColumnList: TFDDatSColumnSublist read GetSortColumnList;
    property SortDescendingColumnList: TFDDatSColumnSublist read GetSortDescendingColumnList;
    property SortCaseInsensitiveColumnList: TFDDatSColumnSublist read GetSortCaseInsensitiveColumnList;
    property SortSource: TFDDatSMechSortSource read FSortSource;
    property UniqueKey: TFDDatSUniqueConstraint read FUniqueKey;
  end;

  TFDDatSMechRowState = class (TFDDatSMechBase)
  private
    FRowStates: TFDDatSRowStates;
    procedure SetRowStates(const AValue: TFDDatSRowStates);
  protected
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean; override;
  public
    constructor Create; overload; override;
    constructor Create(AStates: TFDDatSRowStates); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property RowStates: TFDDatSRowStates read FRowStates write SetRowStates;
  end;

  TFDDatSMechRange = class (TFDDatSMechBase)
  private
    FBottom: TFDDatSRow;
    FTop: TFDDatSRow;
    FBottomExclusive: Boolean;
    FTopExclusive: Boolean;
    FSortMech: IFDDatSMechSort;
    FBottomColumnCount, FTopColumnCount: Integer;
    procedure SetBottom(const AValue: TFDDatSRow);
    procedure SetTop(const AValue: TFDDatSRow);
    procedure SetBottomExclusive(const AValue: Boolean);
    procedure SetTopExclusive(const AValue: Boolean);
    procedure SetSortMech(const AValue: IFDDatSMechSort);
    procedure SetBottomColumnCount(const AValue: Integer);
    procedure SetTopColumnCount(const AValue: Integer);
  protected
    FTopColumnList: TFDDatSColumnSublist;
    FBottomColumnList: TFDDatSColumnSublist;
    procedure DoActiveChanged; override;
    function NoRangeNoRecords: Boolean; virtual;
    function GetRowsRange(var ARowList: TFDDatSRowListBase; out ABeginInd,
      AEndInd: Integer): Boolean; override;
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property Bottom: TFDDatSRow read FBottom write SetBottom;
    property Top: TFDDatSRow read FTop write SetTop;
    property BottomExclusive: Boolean read FBottomExclusive write SetBottomExclusive default False;
    property TopExclusive: Boolean read FTopExclusive write SetTopExclusive default False;
    property SortMech: IFDDatSMechSort read FSortMech write SetSortMech;
    property BottomColumnCount: Integer read FBottomColumnCount write SetBottomColumnCount default -1;
    property TopColumnCount: Integer read FTopColumnCount write SetTopColumnCount default -1;
  end;

  TFDDatSMechDistinct = class (TFDDatSMechBase)
  private
    FSortMech: IFDDatSMechSort;
    FColumnCount: Integer;
    procedure SetSortMech(const AValue: IFDDatSMechSort);
    procedure SetColumnCount(const AValue: Integer);
  protected
    procedure DoActiveChanged; override;
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean; override;
    procedure PostProcess(AList: TFDDatSRowListBase); override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    constructor Create(AColumnCount: Integer); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property SortMech: IFDDatSMechSort read FSortMech write SetSortMech;
    property ColumnCount: Integer read FColumnCount write SetColumnCount default -1;
  end;

  TFDDatSMechFilter = class (TFDDatSMechBase)
  private
    FExpression: String;
    FOptions: TFDExpressionOptions;
    FEvaluator: IFDStanExpressionEvaluator;
    FOnFilterRow: TFDFilterRowEvent;
    procedure SetExpression(const AValue: String);
    procedure SetOptions(const AValue: TFDExpressionOptions);
    procedure SetOnFilterRow(const AValue: TFDFilterRowEvent);
  protected
    procedure DoActiveChanged; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean; override;
  public
    constructor Create; overload; override;
    constructor Create(const AExpression: String;
      AOptions: TFDExpressionOptions = []; AEvent: TFDFilterRowEvent = nil); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property Expression: String read FExpression write SetExpression;
    property Options: TFDExpressionOptions read FOptions write SetOptions default [];
    property OnFilterRow: TFDFilterRowEvent read FOnFilterRow write SetOnFilterRow;
  end;

  TFDDatSMechError = class (TFDDatSMechBase)
  protected
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean; override;
  public
    constructor Create; overload; override;
    constructor CreateErr(ADummy: Integer = 0);
  end;

  TFDDatSMechDetails = class (TFDDatSMechRange)
  private
    FParentRelation: TFDDatSRelation;
    FParentRow: TFDDatSRow;
    procedure SetParentRelation(const AValue: TFDDatSRelation);
    procedure SetParentRow(const AValue: TFDDatSRow);
    procedure ResolveReferences(const AName, AValue: String);
  protected
    function GetActualActive: Boolean; override;
    procedure DoActiveChanged; override;
    function NoRangeNoRecords: Boolean; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create(AParentRel: TFDDatSRelation;
      AParentRow: TFDDatSRow); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property ParentRelation: TFDDatSRelation read FParentRelation
      write SetParentRelation;
    property ParentRow: TFDDatSRow read FParentRow write SetParentRow;
  end;

  TFDDatSMechChilds = class (TFDDatSMechBase)
  private
    FParentRow: TFDDatSRow;
    FRefCol: Integer;
    FRefColType: TFDDataType;
    FRefRow: TFDDatSNestedRowList;
    procedure SetParentRow(const AValue: TFDDatSRow);
  protected
    procedure DoActiveChanged; override;
    function GetRowsRange(var ARowList: TFDDatSRowListBase; out ABeginInd,
      AEndInd: Integer): Boolean; override;
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean; override;
  public
    constructor Create; overload; override;
    constructor Create(AParentRow: TFDDatSRow); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    property ParentRow: TFDDatSRow read FParentRow write SetParentRow;
  end;

  TFDDatSMechMaster = class (TFDDatSMechRange)
  private
    FChildRelation: TFDDatSRelation;
    FChildRow: TFDDatSRow;
    procedure SetChildRelation(const AValue: TFDDatSRelation);
    procedure SetChildRow(const AValue: TFDDatSRow);
    procedure ResolveReferences(const AName, AValue: String);
  protected
    function GetActualActive: Boolean; override;
    procedure DoActiveChanged; override;
    function NoRangeNoRecords: Boolean; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create(AChildRel: TFDDatSRelation;
      AChildRow: TFDDatSRow); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    property ChildRelation: TFDDatSRelation read FChildRelation
      write SetChildRelation;
    property ChildRow: TFDDatSRow read FChildRow write SetChildRow;
  end;

  TFDDatSMechParent = class (TFDDatSMechBase)
  private
    FChildRow: TFDDatSRow;
    FParentRow: TFDDatSRowListBase;
    procedure SetChildRow(const AValue: TFDDatSRow);
  protected
    procedure DoActiveChanged; override;
    function GetActualActive: Boolean; override;
    function GetRowsRange(var ARowList: TFDDatSRowListBase;
      out ABeginInd, AEndInd: Integer): Boolean; override;
    function AcceptRow(ARow: TFDDatSRow; AVersion: TFDDatSRowVersion):
      Boolean; override;
  public
    constructor Create; overload; override;
    constructor Create(AChildRow: TFDDatSRow); overload;
    procedure Assign(AObj: TFDDatSObject); override;
    property ChildRow: TFDDatSRow read FChildRow write SetChildRow;
  end;

  PFDDataRowExtraInfo = ^TFDDatSRowExtraInfo;
  TFDDatSRowExtraInfo = packed record
    FCheckColumn: Integer;
    FCheckValue: PByte;
    FCheckLen: LongWord;
    FRowException: EFDException;
    FLockID: LongWord;
  end;

  PFDDatSCompareRowsCacheItem = ^TFDDatSCompareRowsCacheItem;
  TFDDatSCompareRowsCacheItem = record
    FpBuff: PByte;
    FLen: Integer;
    FOpts: TFDCompareDataOptions;
    FIsNull: Boolean;
    FInit: Boolean;
  end;
  TFDDatSCompareRowsCache = array of TFDDatSCompareRowsCacheItem;

  TFDDatSRow = class (TFDDatSObject)
  private
    FTable: TFDDatSTable;
    FpInfo: PByte;
    FpOriginal: PByte;
    FpCurrent: PByte;
    FpProposed: PByte;
    // following fields must be here, but moved to TFDDatSObject to pack
    // FLockNotificationCount, FRowPriorState and FRowState into double word
    // FRowPriorState: TFDDatSRowState;
    // RowState: TFDDatSRowState;
    FNextChange, FPriorChange: TFDDatSRow;
    FRowID, FChangeNumber: LongWord;
    FExtraInfo: PFDDataRowExtraInfo;
    function GetHasErrors: Boolean;
    function GetRowList: TFDDatSTableRowList;
    procedure CalculateColumns(ADefaults: Boolean);
    function CheckWrite(AColumn: Integer; AVersion: TFDDatSRowVersion): PByte;
    procedure InternalSetData(AColumn: Integer; AVersion: TFDDatSRowVersion;
      ABuff: Pointer; ADataLen: LongWord);
    procedure InternalInitComplexData(ABuffer: PByte);
    procedure AllocInvariants;
    procedure FreeInvariants;
    function InternalGetInvariantObject(AColumn: Integer): NativeInt;
    function GetInvariantObject(AColumn: Integer): TFDDatSObject; inline;
    procedure InternalSetInvariantObject(AColumn: Integer; AValue: NativeInt);
    procedure SetInvariantObject(AColumn: Integer; AObj: TFDDatSObject); inline;
    function GetParentRow: TFDDatSRow;
    procedure SetParentRow(const ARow: TFDDatSRow);
    function GetNestedRow(const AColumn: Integer): TFDDatSRow;
    procedure SetNestedRow(const AColumn: Integer; const ARow: TFDDatSRow);
    function GetNestedRows(const AColumn: Integer): TFDDatSNestedRowList;
    procedure ConstrainChildRow(AProposedState: TFDDatSRowState);
    procedure ConstrainParentRow(AProposedState: TFDDatSRowState);
    procedure CancelNestedRows;
    procedure ClearNestedRows;
    procedure AcceptNestedChanges;
    procedure ClearNestedErrors;
    procedure ProcessNestedRows(AMethod: TFDDatSProcessNestedRowsMethod);
    procedure RejectNestedChanges;
    procedure SetFetchedMarks(AOn: Boolean);
    function GetRowError: EFDException;
    function SetRowError(const AValue: EFDException): Boolean;
    procedure SetRowErrorPrc(const AValue: EFDException);
    procedure DoNRDelete(ARow: TFDDatSRow);
    procedure DoNREndModify(ARow: TFDDatSRow);
    procedure DoNRCancel(ARow: TFDDatSRow);
    procedure DoNRFree(ARow: TFDDatSRow);
    procedure DoNRAcceptChanges(ARow: TFDDatSRow);
    procedure DoNRClearErrors(ARow: TFDDatSRow);
    procedure DoNRRejectChanges(ARow: TFDDatSRow);
    procedure DoNRDetache(ARow: TFDDatSRow);
    function GetDataI(const AColumn: Integer): Variant;
    function GetDataO(AColumn: TFDDatSColumn): Variant;
    procedure CheckNoInfo;
    function GetRowInfo(AForce: Boolean): Pointer;
    function GetCheckInfo(ACheckColumn: Integer; out ACheckValue: PByte;
      out ACheckLen: LongWord): Boolean;
    procedure SetCheckInfo(ACheckColumn: Integer; ACheckValue: PByte;
      ACheckLen: Integer);
    function SkipConstraintCheck: Boolean;
    procedure CascadeAcceptReject(AAccept: Boolean);
    function GetDBLockID: LongWord;
    procedure InternalCalculateColumns(ADefaults: Boolean; ACols: TFDDatSColumnList);
    procedure InternalAssignDefaults(ACols: TFDDatSColumnList);
    procedure SaveRowVersion(const AStorage: IFDStanStorage; const AName: String;
      ABuff: PByte; ABuffKind: TFDDatSRowState);
    procedure LoadRowVersion(const AStorage: IFDStanStorage; const AName: String;
      var ABuff: PByte; ABuffKind: TFDDatSRowState);
    function GetDataS(const AColumn: String): Variant;
    function GetDataV(const AColumn: Variant): Variant;
    procedure SetDataI(const AColumn: Integer; const Value: Variant);
    procedure SetDataO(AColumn: TFDDatSColumn; const Value: Variant);
    procedure SetDataS(const AColumn: String; const Value: Variant);
    procedure SetDataV(const AColumn: Variant; const Value: Variant);
    function GetAsString(const AColumn: String): String;
    procedure SetAsString(const AColumn, AValue: String);
    procedure DoNREndEdit(ARow: TFDDatSRow);
    procedure DoNREndEditNoVer(ARow: TFDDatSRow);
    function CompareNulls(AIsNull1, AIsNull2: Boolean;
      AOptions: TFDCompareDataOptions): Integer;
    procedure DoPostListInserted;
  protected
    procedure DoListInserted; override;
    procedure DoListInserting; override;
    procedure DoListRemoved(ANewOwner: TFDDatSObject); override;
    procedure DoListRemoving; override;
    function AllocBuffer: PByte;
    procedure CleanupBuffer(ABuffer: PByte);
    procedure CopyBuffer(ADestination, ASource: PByte);
    procedure FreeBuffer(var ApBuffer: PByte);
    function GetBlobData(ABuffer: PByte; AColumn: Integer; var ApData: PByte;
      var ALen: Integer): Boolean;
    function GetBuffer(AVersion: TFDDatSRowVersion): PByte;
    function GetIsNull(ABuffer: PByte; AColumn: Integer): Boolean;
    function GetTable: TFDDatSTable; override;
    function GetManager: TFDDatSManager; override;
    function SetBlobData(ABuffer: PByte; AColumn: Integer; ApData: PByte;
      ALength: Integer; AForceNotNull: Boolean = False): PByte;
    procedure SetIsNull(ABuffer: PByte; AColumn: Integer; AValue: Boolean);
    procedure SetFetched(const AColumn: Integer; const AValue: Boolean);
    function GetFetched(const AColumn: Integer): Boolean;
    procedure RegisterChange;
    procedure UnregisterChange;
    class function GetStreamingName(const AStorage: IFDStanStorage): String; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
{$IFDEF FireDAC_DEBUG}
    class function NewInstance: TObject {$IFDEF AUTOREFCOUNT} unsafe {$ENDIF}; override;
    procedure FreeInstance; override;
{$ENDIF}
    constructor CreateForTable(ATable: TFDDatSTable; ASetToDefaults: Boolean);
    destructor Destroy; override;
    procedure AcceptChanges(AUseCascade: Boolean = True);
    procedure AssignDefaults;
    procedure BeginEdit;
    procedure CancelEdit;
    procedure CheckRowConstraints(AProposedState: TFDDatSRowState);
    procedure CheckColumnConstraints;
    procedure Clear(ASetColsToDefaults: Boolean);
    procedure ClearErrors;
    function CompareColumnVersions(AColumn: Integer;
      AVersion1, AVersion2: TFDDatSRowVersion): Boolean;
    function CompareColumnsVersions(AColumns: TFDDatSColumnSublist;
      AVersion1, AVersion2: TFDDatSRowVersion): Boolean;
    function CompareData(AColumn: Integer; ABuff1: Pointer; ADataLen1: Integer;
      ABuff2: Pointer; ADataLen2: Integer; AOptions: TFDCompareDataOptions):
      Integer;
    function CompareRows(AColumns, ADescendingColumns,
      ACaseInsensitiveColumns: TFDDatSColumnSublist; AColumnCount: Integer;
      ARow2: TFDDatSRow; AColumns2: TFDDatSColumnSublist;
      AVersion: TFDDatSRowVersion; AOptions: TFDCompareDataOptions;
      var ACache: TFDDatSCompareRowsCache): Integer; overload;
    function CompareRows(ARow2: TFDDatSRow; AVersion: TFDDatSRowVersion;
      AOptions: TFDCompareDataOptions): Integer; overload;
    function CompareRowsExp(const AEvaluator: IFDStanExpressionEvaluator;
      ARow2: TFDDatSRow; AVersion: TFDDatSRowVersion;
      AOptions: TFDCompareDataOptions): Integer;
    procedure Delete(ANotDestroy: Boolean = False);
    procedure EndEdit(ANoVersion: Boolean = False);
    procedure EndEditNested(ANoVersion: Boolean = False);
    procedure Erase;
    procedure ForceChange(ARowState: TFDDatSRowState);
    function GetChildRows(const AChildRelationName: String): TFDDatSView; overload;
    function GetChildRows(AChildTable: TFDDatSTable): TFDDatSView; overload;
    function GetChildRows(AChildRelation: TFDDatSRelation): TFDDatSView; overload;
    function GetParentRows(const AParentRelationName: String): TFDDatSView; overload;
    function GetParentRows(AParentTable: TFDDatSTable): TFDDatSView; overload;
    function GetParentRows(AParentRelation: TFDDatSRelation): TFDDatSView; overload;
    function GetData(const AColumnName: String;
      AVersion: TFDDatSRowVersion = rvDefault): Variant; overload;
    function GetData(const AColumn: Integer;
      AVersion: TFDDatSRowVersion = rvDefault): Variant; overload;
    function GetData(const AColumn: TFDDatSColumn;
      AVersion: TFDDatSRowVersion = rvDefault): Variant; overload;
    function GetData(const AColumn: Integer; AVersion: TFDDatSRowVersion; var
      ABuff: Pointer; ABuffLen: LongWord; var ADataLen: LongWord; AByVal:
      Boolean): Boolean; overload;
    function GetValues(const ANames: String): Variant;
    function HasVersion(AVersion: TFDDatSRowVersion): Boolean;
    procedure RejectChanges(AUseCascade: Boolean = True);
    procedure SetData(AColumn: Integer; const AValue: Variant); overload;
    procedure SetData(AColumn: TFDDatSColumn; const AValue: Variant); overload;
    procedure SetData(AColumn: Integer; ABuff: Pointer; ADataLen: LongWord); overload; inline;
    procedure SetValues(const AValues: array of Variant); overload;
    procedure SetValues(const ANames: String; const AValue: Variant); overload;
    function BeginDirectWriteBlob(AColumn, ABlobLen: Integer): PByte;
    procedure EndDirectWriteBlob(AColumn: Integer; AFinalBlobLen: Integer = -1);
    procedure BeginForceWrite;
    procedure EndForceWrite;
    procedure DBLock(ALockID: LongWord = $FFFFFFFF);
    procedure DBUnlock;
    function DumpCol(AColumn: Integer; AWithColNames: Boolean = False;
      AVersion: TFDDatSRowVersion = rvDefault): String;
    function DumpRow(AWithColNames: Boolean = False;
      AVersion: TFDDatSRowVersion = rvDefault): String; virtual;
    // R/O
    property DBLockID: LongWord read GetDBLockID;
    property NestedRows[const AColumn: Integer]: TFDDatSNestedRowList read GetNestedRows;
    property HasErrors: Boolean read GetHasErrors;
    property RowList: TFDDatSTableRowList read GetRowList;
{$WARNINGS OFF}
    property RowState: TFDDatSRowState read FRowState;
    property RowPriorState: TFDDatSRowState read FRowPriorState;
{$WARNINGS ON}
    property RowID: LongWord read FRowID;
    property ChangeNumber: LongWord read FChangeNumber;
    property Table: TFDDatSTable read FTable;
    // R/W
    property ParentRow: TFDDatSRow read GetParentRow write SetParentRow;
    property NestedRow[const AColumn: Integer]: TFDDatSRow read GetNestedRow write SetNestedRow;
    property Fetched[const AColumn: Integer]: Boolean read GetFetched write SetFetched;
    property RowError: EFDException read GetRowError write SetRowErrorPrc;
    property ValueI[const AColumn: Integer]: Variant read GetDataI write SetDataI;
    // The 'const' here gives error on C++Builder 2006
    property ValueO[{const} AColumn: TFDDatSColumn]: Variant read GetDataO write SetDataO;
    property ValueS[const AColumn: String]: Variant read GetDataS write SetDataS;
    property Value[const AColumn: Variant]: Variant read GetDataV write SetDataV; default;
    property AsString[const AColumn: String]: String read GetAsString write SetAsString;
  end;
  PFDDatSRow = ^TFDDatSRow;

  TFDDatSRowListBase = class (TFDDatSList)
  private
    function GetItemsI(AIndex: Integer): TFDDatSRow; inline;
    function GetLast: TFDDatSRow; inline;
    procedure InternalSort1(L, R: Integer; ACompareRowsProc: TFDCompareRowsProc;
      AOpts: TFDCompareDataOptions);
    procedure InternalSort2(L, H: Integer; ACompareRowsProc: TFDCompareRowsProc;
      AOpts: TFDCompareDataOptions);
    procedure InternalSort(L, R: Integer; ACompareRowsProc: TFDCompareRowsProc;
      AOpts: TFDCompareDataOptions);
  protected
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    class function GetStreamingName(const AStorage: IFDStanStorage): String; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; override;
    function Add(ARow: TFDDatSRow): Integer; inline;
    procedure AddAt(ARow: TFDDatSRow; AIndex: Integer);
    procedure Sort(ACompareRowsProc: TFDCompareRowsProc; AOpts: TFDCompareDataOptions);
    procedure CheckDuplicates(ACompareRowsProc: TFDCompareRowsProc; AOpts: TFDCompareDataOptions);
    procedure RemoveDuplicates(ACompareRowsProc: TFDCompareRowsProc; AColumnCount: Integer;
      AOpts: TFDCompareDataOptions);
    function GetValuesList(const AColumnName: String; const ADelimiter: String;
      const ANullName: String): String;
    function DumpCol(ACol: Integer; AWithColNames: Boolean = False): String; virtual;
    property ItemsI[AIndex: Integer]: TFDDatSRow read GetItemsI; default;
    property Last: TFDDatSRow read GetLast;
  end;

  TFDDatSNestedRowList = class (TFDDatSRowListBase)
  protected
    procedure AddObjectAt(AObj: TFDDatSObject; AIndex: Integer); override;
  public
    procedure RemoveAt(AIndex: Integer; ANotDestroy: Boolean = False); override;
    constructor CreateForRow(ARow: TFDDatSRow);
  end;

  TFDDatSRowListWithAggregates = class (TFDDatSRowListBase)
  private
    FAggregateValues: TFDPtrList;
    FAggregateSlots: TBits;
    FAggregateSlotAllocated: Integer;
    FAggregateSlotUsed: Integer;
  protected
    procedure RemoveAggregatesRow(ARowIndex: Integer);
    procedure AddAggregatesRow(ARowIndex: Integer);
    procedure DeleteAggregates;
    procedure ClearAggregate(AIndex: Integer);
    procedure DeleteAggregate(var AIndex: Integer);
    function AllocateAggregate: Integer;
    procedure AttachAggregate(ARowIndex, AValIndex: Integer; AObj: TFDDatSAggregateValue);
    function FetchAggregate(ARowIndex, AValIndex: Integer): TFDDatSAggregateValue;
    procedure DetachAggregate(ARowIndex, AValIndex: Integer);
    procedure AddObjectAt(AObj: TFDDatSObject; AIndex: Integer); override;
  public
    procedure RemoveAt(AIndex: Integer; ANotDestroy: Boolean = False); override;
    constructor Create; overload; override;
    destructor Destroy; override;
  end;

  TFDDatSAggregateValue = class (TObject)
  private
    FRefs: TFDRefCounter;
    FValue: Variant;
    FSubValues: TFDVariantArray;
    function GetRefs: Integer;
  protected
    procedure AddRef;
    procedure RemRef;
  public
    constructor Create(ASubAggregateCnt: Integer);
    constructor CreateCopy(AValue: TFDDatSAggregateValue);
    destructor Destroy; override;
    procedure Clear;
    property Value: Variant read FValue;
    property Refs: Integer read GetRefs;
  end;

  TFDDatSAggregateState = (agActual, agMinMax, agPrepared);
  TFDDatSAggregateStates = set of TFDDatSAggregateState;

  PFDDatSSubAggregate = ^TFDDatSSubAggregate;
  TFDDatSSubAggregate = record
    FKind: TFDAggregateKind;
    FValueIndex: Integer;
    FCountIndex: Integer;
  end;

  TFDDatSAggregate = class (TFDDatSNamedObject)
  private
    FExpression: String;
    FEvaluator: IFDStanExpressionEvaluator;
    FActive: Boolean;
    FGroupingLevel: Integer;
    FValueIndex: Integer;
    FState: TFDDatSAggregateStates;
    FSubAggregates: array of TFDDatSSubAggregate;
    FSubAggregateValues: Integer;
    FCurrentRow: Integer;
    FRefs: TFDRefCounter;
    FPrevActualActive: Boolean;
    function GetActualActive: Boolean;
    procedure SetActive(const AValue: Boolean);
    procedure SetExpression(const AValue: String);
    procedure SetGroupingLevel(const AValue: Integer);
    procedure IncAggVals(AKind: TFDAggregateKind;
      const AVal: Variant; var AAggVal, AAggCnt: Variant);
    procedure DecAggVals(AKind: TFDAggregateKind;
      const AVal: Variant; var AAggVal, AAggCnt: Variant);
    function GetSubAggregateValue(ASubAggregateIndex: Integer): Variant;
    function GetRows: TFDDatSRowListWithAggregates;
    function GetValue(ARowIndex: Integer): Variant;
    procedure SetEvaluatorToRow(ARows: TFDDatSRowListWithAggregates; ARowIndex: Integer);
    procedure ClearGroup(ARowIndex: Integer; var AGroupFrom, AGroupTo: Integer);
    procedure CalcGroup(AGroupFrom, AGroupTo, AExclude: Integer);
    procedure CalcAll;
    function GetSortMech: IFDDatSMechSort;
    function GetView: TFDDatSView;
    procedure CheckActiveChanged;
    procedure IncRow(ARows: TFDDatSRowListWithAggregates;
      ARowIndex: Integer; AVal: TFDDatSAggregateValue);
    procedure DecRow(ARows: TFDDatSRowListWithAggregates;
      ARowIndex: Integer; AVal: TFDDatSAggregateValue);
    function GetIsRefCounted: Boolean;
    function GetDataType: TFDDataType;
    procedure ResolveActive(const AName, AValue: String);
  protected
    procedure Prepare;
    procedure Unprepare;
    procedure RowInserted(ARowIndex: Integer);
    procedure RowDeleted(ARowIndex: Integer);
    procedure RowUpdated(ARowIndex, AOldRowIndex: Integer);
    procedure DoListInserted; override;
    procedure DoListRemoving; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    constructor Create(const AName, AExpression: String;
      AGroupingLevel: Integer = 0); overload;
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    procedure CountRef(AInit: Integer = 1);
    procedure AddRef;
    procedure RemRef;
    procedure Recalc;
    procedure Update;
    // ro
    property ActualActive: Boolean read GetActualActive;
    property SortMech: IFDDatSMechSort read GetSortMech;
    property Rows: TFDDatSRowListWithAggregates read GetRows;
    property View: TFDDatSView read GetView;
    property State: TFDDatSAggregateStates read FState;
    property DataType: TFDDataType read GetDataType;
    property Value[ARowIndex: Integer]: Variant read GetValue;
    property IsRefCounted: Boolean read GetIsRefCounted;
    // rw
    property Expression: String read FExpression write SetExpression;
    property GroupingLevel: Integer read FGroupingLevel write SetGroupingLevel default 0;
    property Active: Boolean read FActive write SetActive default False;
  end;

  TFDDatSAggregateList = class (TFDDatSNamedList)
  private
    function GetItemsI(AIndex: Integer): TFDDatSAggregate; inline;
  protected
    procedure RowInserted(ARowIndex: Integer);
    procedure RowDeleted(ARowIndex: Integer);
    procedure RowUpdated(ARowIndex, AOldRowIndex: Integer);
  public
    constructor CreateForView(AOwner: TFDDatSView);
    function Add(AObj: TFDDatSAggregate): Integer; overload;
    function Add(const AName, AExpression: String;
      AGroupingLevel: Integer = 0): TFDDatSAggregate; overload;
    function AggregateByName(const AName: String): TFDDatSAggregate;
    procedure Update;
    procedure Recalc;
    property ItemsI[AIndex: Integer]: TFDDatSAggregate read GetItemsI;
    property ItemsS[const AName: String]: TFDDatSAggregate read AggregateByName;
  end;

  TFDDatSViewRowList = class (TFDDatSRowListWithAggregates)
  public
    constructor CreateForView(AView: TFDDatSView);
  end;

  TFDDatSView = class (TFDDatSNamedObject)
  private
    FActive: Boolean;
    FPrevActualActive: Boolean;
    FMechanisms: TFDDatSViewMechList;
    FRows: TFDDatSRowListBase;
    FSourceView: TFDDatSView;
    FState: TFDDatSViewStates;
    FCreator: TFDDatSViewCreator;
    FRefs: TFDRefCounter;
    FAggregates: TFDDatSAggregateList;
    FSortingMechanism: IFDDatSMechSort;
    FProposedPosition: Integer;
    FLastUpdatePosition: Integer;
    FFindRow: TFDDatSRow;
    procedure CheckRebuild;
    procedure InvalidateRebuild;
    function GetActual: Boolean;
    function GetViewList: TFDDatSViewList;
    function ProcessRow(ARow: TFDDatSRow; var ANewPos, AOldPos: Integer;
      AAdding: Boolean): TFDDatSViewProcessRowStatus;
    procedure SetActive(const AValue: Boolean);
    procedure SetSourceView(const AValue: TFDDatSView);
    procedure UpdateSortingMechanism(AExcludeView: TFDDatSView);
    function GetGroupingLevel: Integer;
    function GetRowFilter: String;
    function GetRowStateFilter: TFDDatSRowStates;
    function GetSort: String;
    procedure SetRowFilter(const AValue: String);
    procedure SetRowStateFilter(const AValue: TFDDatSRowStates);
    procedure SetSort(const AValue: String);
    procedure CheckActiveChanged;
    function GetIsRefCounted: Boolean;
    function GetActualActive: Boolean;
    procedure DoRowAdded(ARow: TFDDatSRow);
    procedure DoRowChanged(ARow: TFDDatSRow);
    procedure DoRowDeleted(ARow: TFDDatSRow);
    procedure ResolveActive(const AName, AValue: String);
    function GetFindRow: TFDDatSRow;
  protected
    procedure DoListInserted; override;
    procedure DoListRemoving; override;
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    function GetTable: TFDDatSTable; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    constructor Create(ATable: TFDDatSTable; const AFilter: String = '';
      const ASort: String = ''; AStates: TFDDatSRowStates = []); overload;
    constructor Create(ATable: TFDDatSTable; const ABaseName: String;
      ACreator: TFDDatSViewCreator; ACountRef: Boolean = True); overload;
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    procedure CountRef(AInit: Integer = 1);
    procedure AddRef;
    procedure RemRef;
    procedure Clear;
    procedure Rebuild;
    function Search(AKeyRow: TFDDatSRow; AKeyColumnList,
      AKeyColumnList2: TFDDatSColumnSublist; AKeyColumnCount: Integer;
      AOptions: TFDLocateOptions; {$IFDEF LINUX} var {$ELSE} out {$ENDIF} AIndex: Integer; out AFound: Boolean;
      ARowVersion: TFDDatSRowVersion = rvDefault): Integer;
    function IndexOf(AKeyRow: TFDDatSRow; ARowVersion: TFDDatSRowVersion = rvDefault;
      APossibleIndex: Integer = -1): Integer; overload;
    function Find(const AValues: array of Variant;
      AOptions: TFDLocateOptions = []): Integer; overload;
    function Find(ARow: TFDDatSRow;
      AOptions: TFDLocateOptions = []): Integer; overload;
    function Find(const AValues: array of Variant; const AColumns: String;
      AOptions: TFDLocateOptions = []): Integer; overload;
    function Find(ARow: TFDDatSRow; const AColumns: String;
      AOptions: TFDLocateOptions = []): Integer; overload;
    function Locate(var ARowIndex: Integer; AGoForward: Boolean = True;
      ARestart: Boolean = False): Boolean;
    function GetGroupState(ARecordIndex, AGroupingLevel: Integer): TFDDatSGroupPositions;
    procedure DeleteAll(AAcceptChanges: Boolean = False);
    function GetMechanismByClass(AClass: TFDDatSMechBaseClass;
      AKind: TFDDatSMechanismKind): TFDDatSMechBase;
    // ro
    property ActualActive: Boolean read GetActualActive;
    property Actual: Boolean read GetActual;
    property SortingMechanism: IFDDatSMechSort read FSortingMechanism;
    property GroupingLevel: Integer read GetGroupingLevel;
    property Mechanisms: TFDDatSViewMechList read FMechanisms;
    property Rows: TFDDatSRowListBase read FRows;
    property ViewList: TFDDatSViewList read GetViewList;
    property Aggregates: TFDDatSAggregateList read FAggregates;
    property IsRefCounted: Boolean read GetIsRefCounted;
    // rw
    property Active: Boolean read FActive write SetActive;
    property Creator: TFDDatSViewCreator read FCreator write FCreator;
    property SourceView: TFDDatSView read FSourceView write SetSourceView;
    property RowFilter: String read GetRowFilter write SetRowFilter;
    property RowStateFilter: TFDDatSRowStates read GetRowStateFilter
      write SetRowStateFilter default [];
    property Sort: String read GetSort write SetSort;
    property ProposedPosition: Integer read FProposedPosition
      write FProposedPosition;
    property LastUpdatePosition: Integer read FLastUpdatePosition
      write FLastUpdatePosition;
  end;

  TFDDatSViewList = class (TFDDatSNamedList)
  private
    FActive: Boolean;
    function GetItemsI(AIndex: Integer): TFDDatSView; inline;
    procedure SetActive(const AValue: Boolean);
  protected
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
  public
    constructor CreateForTable(ATable: TFDDatSTable);
    procedure Assign(AObj: TFDDatSObject); override;
    function Add(AObj: TFDDatSView): Integer; overload;
    function Add(const AName: String): TFDDatSView; overload;
    procedure Clear; override;
    function ViewByName(const AName: String): TFDDatSView;
    function FindSortedView(const AColumns: String;
      ARequiredOptions, AProhibitedOptions: TFDSortOptions): TFDDatSView;
    procedure Rebuild;
    property ItemsI[AIndex: Integer]: TFDDatSView read GetItemsI; default;
    property ItemsS[const AName: String]: TFDDatSView read ViewByName;
    property Active: Boolean read FActive write SetActive;
  end;

  TFDDatSTableRowList = class (TFDDatSRowListWithAggregates)
  private
    FLastRowID: LongWord;
    FLastRowCount: Integer;
    FRowIDOrdered: Boolean;
    FResultSetNum: Integer;
  protected
    class function GetStreamingName(const AStorage: IFDStanStorage): String; override;
    procedure AddObjectAt(AObj: TFDDatSObject; AIndex: Integer); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor CreateForTable(ATable: TFDDatSTable);
    function Add(const AValues: array of Variant): TFDDatSRow; overload;
    procedure RemoveAt(AIndex: Integer; ANotDestroy: Boolean = False); override;
    function IndexOf(AObj: TFDDatSObject): Integer; overload; override;
    function IndexOf(ARowID: LongWord): Integer; overload;
    procedure Clear; override;
    function MoveTo(AFromIndex, AToIndex: Integer): Boolean; override;
    property Capacity;
    property ResultSetNum: Integer read FResultSetNum;
  end;

  IFDDatSTableMetadataCallback = interface (IUnknown)
    ['{3E9B315B-F456-4175-A864-B2573C4A2020}']
    procedure GetColumnOptions(AColumn: TFDDatSColumn; var AOptions: TFDDataOptions);
    procedure GetColumnAttributes(AColumn: TFDDatSColumn; var AAttributes: TFDDataAttributes);
    procedure GetColumnOrigin(AColumn: TFDDatSColumn; var AOrigin: String);
    procedure GetColumnGenerator(AColumn: TFDDatSColumn; var AGenerator: String);
    procedure GetColumnCaption(AColumn: TFDDatSColumn; var ACaption: String);
    procedure GetTableOrigin(var AOrigin: String);
    function GetOwner: TObject;
  end;

  IFDDatSTableDataCallback = interface (IUnknown)
    ['{3E9B315B-F456-4175-A864-B2573C4A2021}']
    procedure TableDataChanged(ARow: TFDDatSRow; AChangeKind: TFDDatSRowState);
  end;

  TFDDatSTable = class (TFDDatSBindedObject)
  private
    FColumns: TFDDatSColumnList;
    FConstraints: TFDDatSConstraintList;
    FDefaultView: TFDDatSView;
    FErrors: TFDDatSView;
    FChanges: TFDDatSView;
    FRows: TFDDatSTableRowList;
    FViews: TFDDatSViewList;
    FUpdates: TFDDatSUpdatesJournal;
    FUpdatesRegistry: Boolean;
    FDataHandleMode: TFDDatSHandleMode;
    FRefs: TFDRefCounter;
    FManager: TFDDatSManager;
    FLocale: TFDLocalID;
    FCaseSensitive: Boolean;
    FNested: Boolean;
    FMetadataCallback: IFDDatSTableMetadataCallback;
    FDataCallbacks: TInterfaceList;
    FRound2Scale: Boolean;
    FCheckPrecision: Boolean;
    FStrsTrim2Len: Boolean;
    FCheckNotNull: Boolean;
    FCheckReadOnly: Boolean;
    function GetBaseView(AStates: TFDDatSRowStates): TFDDatSView;
    function GetDefaultView: TFDDatSView;
    function GetFullView: TFDDatSView;
    function GetEnforceConstraints: Boolean; inline;
    function GetHasErrors: Boolean;
    function GetTableList: TFDDatSTableList;
    procedure SetEnforceConstraints(const AValue: Boolean);
    procedure SetMinimumCapacity(const AValue: Integer);
    function GetChanges2: TFDDatSView;
    procedure ImportBuffer(ASrcRow, ADestRow: TFDDatSRow;
      ASrcKind, ADestKind: TFDDatSRowState; const AColumnMap: TFDArrayOfInteger);
    function GetChildRelations: TFDDatSRelationArray;
    function GetParentRelations: TFDDatSRelationArray;
    procedure SetLocale(const AValue: TFDLocalID);
    procedure SetCaseSensitive(const AValue: Boolean);
    function GetPrimaryKey: String;
    procedure SetPrimaryKey(const AValue: String);
    function GetMinimumCapacity: Integer;
    function GetIsRefCounted: Boolean;
    procedure NotifyDataChanged(ARow: TFDDatSRow; AChangeKind: TFDDatSRowState);
    function GetActualOriginName: String;
    function GetRefCount: Integer;
    procedure ResolveEnforceConstraints(const AName, AValue: String);
    procedure ResolveInvars(const AName, AValue: String);
  protected
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    function GetTable: TFDDatSTable; override;
    function GetManager: TFDDatSManager; override;
    procedure DoListInserted; override;
    procedure DoListRemoving; override;
    procedure DoListRemoved(ANewOwner: TFDDatSObject); override;
    function FindRowByPK(ARow: TFDDatSRow): Integer;
    procedure CheckLayoutChanging;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    constructor Create(const AName: String); overload;
    destructor Destroy; override;
    procedure AddRef;
    procedure CountRef(AInit: Integer = 1);
    procedure RemRef;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    procedure AcceptChanges;
    procedure BeginLoadData(var AState: TFDDatSLoadState; ADataHandleMode: TFDDatSHandleMode = lmHavyMove);
    procedure Clear;
    function Compute(const AExpression, AFilter: String): Variant;
    function Copy: TFDDatSTable;
    procedure EndLoadData(var AState: TFDDatSLoadState);
    function GetChangesView(ARowStates: TFDDatSRowStates =
      [rsInserted, rsDeleted, rsModified]): TFDDatSView;
    function GetChanges(ARowStates: TFDDatSRowStates =
      [rsInserted, rsDeleted, rsModified]): TFDDatSTable;
    function GetErrors: TFDDatSView;
    function HasChanges(ARowStates: TFDDatSRowStates): Boolean;
    procedure MakeColumnMap(ASrcTab: TFDDatSTable; out AColumnMap: TFDArrayOfInteger);
    procedure ImportRow(ASrcRow: TFDDatSRow);
    procedure Import(ASrcRow, ADestRow: TFDDatSRow; const AColumnMap: TFDArrayOfInteger); overload;
    procedure Import(ASrcRow: TFDDatSRow; ADestRow: TFDDatSRow = nil); overload;
    procedure Import(ARowList: TFDDatSRowListBase); overload;
    procedure Import(AView: TFDDatSView); overload;
    procedure Import(ATable: TFDDatSTable); overload;
    procedure Merge(ATable: TFDDatSTable; AData: TFDMergeDataMode = dmDataMerge;
      AMeta: TFDMergeMetaMode = mmNone; AOptions: TFDMergeOptions = []);
    function LoadDataRow(const AValues: array of Variant; AAcceptChanges: Boolean = False): TFDDatSRow;
    function NewRow(ASetToDefaults: Boolean = True): TFDDatSRow; overload;
    function NewRow(ASetToDefaults: Boolean; const AParentRows: array of TFDDatSRow): TFDDatSRow; overload;
    function NewRow(const AValues: array of Variant; ASetToDefaults: Boolean = True): TFDDatSRow; overload;
    procedure RejectChanges;
    procedure Reset;
    function Select(const AFilter: String = ''; const ASort: String = '';
      AStates: TFDDatSRowStates = []): TFDDatSView;
    procedure AddDataCallback(const ACallback: IFDDatSTableDataCallback);
    procedure RemoveDataCallback(const ACallback: IFDDatSTableDataCallback;
      ARemoveLastOne: Boolean);
    procedure UpdateLayout; inline;
    procedure Setup(const AOptions: IFDStanOptions);
    // ro
    property Changes: TFDDatSView read GetChanges2;
    property ChildRelations: TFDDatSRelationArray read GetChildRelations;
    property Columns: TFDDatSColumnList read FColumns;
    property Constraints: TFDDatSConstraintList read FConstraints;
    property DataHandleMode: TFDDatSHandleMode read FDataHandleMode;
    property DefaultView: TFDDatSView read GetDefaultView;
    property FullView: TFDDatSView read GetFullView;
    property Errors: TFDDatSView read GetErrors;
    property HasErrors: Boolean read GetHasErrors;
    property ParentRelations: TFDDatSRelationArray read GetParentRelations;
    property Rows: TFDDatSTableRowList read FRows;
    property Manager: TFDDatSManager read FManager;
    property TableList: TFDDatSTableList read GetTableList;
    property Views: TFDDatSViewList read FViews;
    property Updates: TFDDatSUpdatesJournal read FUpdates;
    property UpdatesRegistry: Boolean read FUpdatesRegistry;
    property IsRefCounted: Boolean read GetIsRefCounted;
    property RefCount: Integer read GetRefCount;
    property ActualOriginName: String read GetActualOriginName;
    // rw
    property MetadataCallback: IFDDatSTableMetadataCallback read FMetadataCallback
      write FMetadataCallback;
    property CaseSensitive: Boolean read FCaseSensitive write SetCaseSensitive
      default True;
    property EnforceConstraints: Boolean read GetEnforceConstraints write
      SetEnforceConstraints default True;
    property Locale: TFDLocalID read FLocale write SetLocale default LOCALE_USER_DEFAULT;
    property MinimumCapacity: Integer read GetMinimumCapacity write SetMinimumCapacity
      default 0;
    property Nested: Boolean read FNested write FNested default False;
    property PrimaryKey: String read GetPrimaryKey write SetPrimaryKey;
    property Round2Scale: Boolean read FRound2Scale write FRound2Scale default False;
    property CheckPrecision: Boolean read FCheckPrecision write FCheckPrecision default False;
    property StrsTrim2Len: Boolean read FStrsTrim2Len write FStrsTrim2Len default False;
    property CheckNotNull: Boolean read FCheckNotNull write FCheckNotNull default True;
    property CheckReadOnly: Boolean read FCheckReadOnly write FCheckReadOnly default True;
  end;

  TFDDatSTableList = class (TFDDatSBindedList)
  private
    function GetItemsI(AIndex: Integer): TFDDatSTable; inline;
  public
    constructor CreateForManager(AManager: TFDDatSManager);
    function Add(AObj: TFDDatSTable): Integer; overload;
    function Add(const AName: String = ''): TFDDatSTable; overload;
    function TableByName(const AName: String): TFDDatSTable;
    property ItemsI[AIndex: Integer]: TFDDatSTable read GetItemsI; default;
    property ItemsS[const AName: String]: TFDDatSTable read TableByName;
  end;

  TFDDatSUpdatesJournal = class (TFDStorableObject)
  private
    FLocked: Integer;
    FChangeNumber: LongWord;
    {$IFDEF LINUX} [unsafe] {$ELSE} [weak] {$ENDIF} FOwner: TFDDatSObject;
    FFirstChange, FLastChange, FTmpNextRow: TFDDatSRow;
    procedure SetSavePoint(const AValue: LongWord);
    procedure AppendRow(ARow: TFDDatSRow);
    function GetLocked: Boolean;
  protected
    class function GetClassPrefix: String; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create(AOwner: TFDDatSObject); overload;
    procedure Lock;
    procedure Unlock;
    function RegisterRow(ARow: TFDDatSRow): Integer;
    procedure UnregisterRow(ARow: TFDDatSRow);
    procedure AcceptChanges(AOwner: TFDDatSObject = nil);
    procedure RejectChanges(AOwner: TFDDatSObject = nil);
    function HasChanges(AOwner: TFDDatSObject = nil): Boolean;
    function FirstChange(AOwner: TFDDatSObject = nil): TFDDatSRow;
    function NextChange(ACurRow: TFDDatSRow; AOwner: TFDDatSObject = nil): TFDDatSRow;
    function LastChange(AOwner: TFDDatSObject = nil): TFDDatSRow;
    function GetCount(AOwner: TFDDatSObject = nil): Integer;
    procedure Clear;
    property SavePoint: LongWord read FChangeNumber write SetSavePoint;
    property IsLocked: Boolean read GetLocked;
  end;

  TFDDatSTableArray = array of TFDDatSTable;

  TFDDatSManager = class (TFDDatSNamedObject)
  private
    FEnforceConstraints: Boolean;
    FRelations: TFDDatSRelationList;
    FTables: TFDDatSTableList;
    FUpdates: TFDDatSUpdatesJournal;
    FUpdatesRegistry: Boolean;
    FRefs: TFDRefCounter;
    FCaseSensitive: Boolean;
    FLocale: TFDLocalID;
    FRound2Scale: Boolean;
    FStrsTrim2Len: Boolean;
    FCheckNotNull: Boolean;
    FCheckReadOnly: Boolean;
    FCheckPrecision: Boolean;
    function GetHasErrors: Boolean;
    procedure SetEnforceConstraints(const AValue: Boolean);
    function GetRootTables: TFDDatSTableArray;
    procedure SetUpdatesRegistry(const AValue: Boolean);
    procedure SetCaseSensitive(const AValue: Boolean);
    procedure SetLocale(const AValue: TFDLocalID);
    procedure SetRound2Scale(const AValue: Boolean);
    procedure SetCheckPrecision(const AValue: Boolean);
    procedure SetStrsTrim2Len(const AValue: Boolean);
    function GetIsRefCounted: Boolean;
    function GetRefs: Integer;
    procedure SetCheckNotNull(const AValue: Boolean);
    procedure SetCheckReadOnly(const AValue: Boolean);
  protected
    procedure HandleNotification(AParam: PFDDatSNotifyParam); override;
    function GetManager: TFDDatSManager; override;
    procedure InternalSaveToStorage(const AStorage: IFDStanStorage); override;
    procedure InternalLoadFromStorage(const AStorage: IFDStanStorage); override;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure Assign(AObj: TFDDatSObject); override;
    function IsEqualTo(AObj: TFDDatSObject): Boolean; override;
    procedure CountRef(AInit: Integer = 1);
    procedure AddRef;
    procedure RemRef;
    procedure AcceptChanges;
    procedure BeginLoadData(var AStates: TFDDatSLoadStates;
      ADataHandleMode: TFDDatSHandleMode = lmHavyMove);
    procedure Clear;
    function Copy: TFDDatSManager;
    procedure EndLoadData(const AStates: TFDDatSLoadStates);
    function HasChanges(ARowStates: TFDDatSRowStates): Boolean;
    procedure LoadFromStorage(const AStorage: IFDStanStorage; AMergeData: TFDMergeDataMode;
      AMergeMeta: TFDMergeMetaMode; AOptions: TFDMergeOptions); overload;
    procedure Merge(AManager: TFDDatSManager; AData: TFDMergeDataMode = dmDataMerge;
      AMeta: TFDMergeMetaMode = mmNone; AOptions: TFDMergeOptions = []);
    procedure RejectChanges;
    procedure Reset;
    procedure Setup(const AOptions: IFDStanOptions);
    // ro
    property HasErrors: Boolean read GetHasErrors;
    property Relations: TFDDatSRelationList read FRelations;
    property Tables: TFDDatSTableList read FTables;
    property Updates: TFDDatSUpdatesJournal read FUpdates;
    property RootTables: TFDDatSTableArray read GetRootTables;
    property IsRefCounted: Boolean read GetIsRefCounted;
    property Refs: Integer read GetRefs;
    // rw
    property CaseSensitive: Boolean read FCaseSensitive write SetCaseSensitive
      default True;
    property EnforceConstraints: Boolean read FEnforceConstraints
      write SetEnforceConstraints default True;
    property Locale: TFDLocalID read FLocale write SetLocale default LOCALE_USER_DEFAULT;
    property UpdatesRegistry: Boolean read FUpdatesRegistry
      write SetUpdatesRegistry default False;
    property Round2Scale: Boolean read FRound2Scale write SetRound2Scale default False;
    property CheckPrecision: Boolean read FCheckPrecision write SetCheckPrecision default False;
    property StrsTrim2Len: Boolean read FStrsTrim2Len write SetStrsTrim2Len default False;
    property CheckNotNull: Boolean read FCheckNotNull write SetCheckNotNull default True;
    property CheckReadOnly: Boolean read FCheckReadOnly write SetCheckReadOnly default True;
  end;

var
  FDEmptyCC: TFDDatSCompareRowsCache;
{$IFDEF FireDAC_DEBUG}
  GRowsAlive: Integer = 0;
{$ENDIF}

implementation

uses
  System.SysUtils, System.TypInfo, System.Variants, Data.FmtBcd, Data.SqlTimSt,
    System.Generics.Defaults, System.Generics.Collections, System.Types, Data.DB,
  FireDAC.Stan.SQLTimeInt, FireDAC.Stan.Factory, FireDAC.Stan.ResStrs;

type
  TFDBlobData = record
    FData: PByte;
    FLength: Integer;
  end;
  PFDBlobData = ^TFDBlobData;

const
  C_AllViewRows = [rsInserted, rsModified, rsUnchanged,
    rsInitializing, rsEditing, rsCalculating, rsChecking];

{-------------------------------------------------------------------------------}
{- TFDDatSObject                                                               -}
{-------------------------------------------------------------------------------}
destructor TFDDatSObject.Destroy;
begin
  if (FOwner <> nil) and (FOwner is TFDDatSList) then
    TFDDatSList(FOwner).Remove(Self, True);
  FOwner := nil;
  FLockNotificationCount := 0;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
class function TFDDatSObject.MetaCompareText(const AStr1, AStr2: String): Integer;
begin
  Result := {$IFDEF FireDAC_NOLOCALE_META} CompareText {$ELSE} AnsiCompareText {$ENDIF}
    (AStr1, AStr2);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.Assign(AObj: TFDDatSObject);
begin
  // nothing
  ASSERT(False);
end;

{-------------------------------------------------------------------------------}
function TFDDatSObject.IndexOf(AObj: TFDDatSObject): Integer;
begin
  Result := -1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSObject.GetIndex: Integer;
begin
  if FOwner <> nil then
    Result := FOwner.IndexOf(Self)
  else
    Result := 0;
end;

{-------------------------------------------------------------------------------}
function TFDDatSObject.GetList: TFDDatSList;
begin
  Result := TFDDatSList(GetOwnerByClass(TFDDatSList));
end;

{-------------------------------------------------------------------------------}
function TFDDatSObject.GetOwnerByClass(AClass: TFDDatSObjectClass): TFDDatSObject;
begin
  ASSERT(AClass <> nil);
  Result := Owner;
  while (Result <> nil) and not Result.ClassType.InheritsFrom(AClass) do
    Result := Result.Owner;
end;

{-------------------------------------------------------------------------------}
function TFDDatSObject.GetManager: TFDDatSManager;
begin
  Result := TFDDatSManager(GetOwnerByClass(TFDDatSManager));
end;

{-------------------------------------------------------------------------------}
function TFDDatSObject.GetTable: TFDDatSTable;
begin
  Result := TFDDatSTable(GetOwnerByClass(TFDDatSTable));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
function TFDDatSObject.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := ((Self = nil) and (AObj = nil) or
    (Self <> nil) and (AObj <> nil) and (Self.ClassType = AObj.ClassType));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.LockNotification;
begin
  ASSERT(FLockNotificationCount < $FFFF);
  Inc(FLockNotificationCount);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.Notify(AKind: TFDDatSNotificationKind;
  AReason: TFDDatSNotificationReason; AParam1, AParam2: NativeInt);
var
  rParam: TFDDatSNotifyParam;
begin
  rParam.FKind := AKind;
  rParam.FReason := AReason;
  rParam.FParam1 := AParam1;
  rParam.FParam2 := AParam2;
  Notify(@rParam);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.Notify(AParam: PFDDatSNotifyParam);
begin
  if FLockNotificationCount = 0 then
    // MSGOPT second condition is only for optimization
    if (Owner <> nil) and (AParam^.FKind <> snObjectInserting) then
      Owner.Notify(AParam)
    else
      HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.UnlockNotification;
begin
  if FLockNotificationCount > 0 then
    Dec(FLockNotificationCount);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.DoListInserted;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.DoListInserting;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.DoListRemoved(ANewOwner: TFDDatSObject);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSObject.DoListRemoving;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
class function TFDDatSObject.GetClassPrefix: String;
begin
  Result := 'TFDDatS';
end;

{-------------------------------------------------------------------------------}
{- TFDDatSList                                                                 -}
{-------------------------------------------------------------------------------}
constructor TFDDatSList.Create;
begin
  inherited Create;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSList.Destroy;
begin
  LockNotification;
  Clear;
  SetLength(FArray, 0);
  FCount := 0;
  FCapacity := 0;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
function TFDDatSList.AddObject(AObj: TFDDatSObject): Integer;
begin
  Result := Count;
  AddObjectAt(AObj, -1);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.AddEx(AObj: TFDDatSObject);
begin
  try
    AddObjectAt(AObj, -1);
  except
    FDFree(AObj);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.AddObjectAt(AObj: TFDDatSObject; AIndex: Integer);
var
  oList: TFDDatSList;
  prevOwnObjects: Boolean;
begin
  ASSERT((AObj <> nil) and (
    not OwnObjects or
    (AObj.Owner = nil) or
    (AObj.Owner = Owner)
  ));
  ASSERT((AIndex >= -1) and (AIndex <= FCount));
  if OwnObjects then begin
    Notify(snObjectInserting, FDefaultReason, NativeInt(Self), NativeInt(AObj));
    if (AObj.Owner <> nil) and (AObj.Owner is TFDDatSList) then begin
      oList := TFDDatSList(AObj.Owner);
      prevOwnObjects := oList.OwnObjects;
      oList.OwnObjects := False;
      try
        oList.Remove(AObj);
      finally
        oList.OwnObjects := prevOwnObjects;
      end;
    end;
  end;
  if FCapacity = FCount then begin
    if FCapacity > 64 then
      Inc(FCapacity, FCapacity div 4)
    else if FCapacity > 8 then
      Inc(FCapacity, 16)
    else
      Inc(FCapacity, 4);
    SetLength(FArray, FCapacity);
  end;
  if (AIndex = -1) or (AIndex = FCount) then
    FArray[FCount] := AObj
  else begin
    Move(FArray[AIndex], FArray[AIndex + 1], (FCount - AIndex) * SizeOf(TFDDatSObject));
{$IFDEF AUTOREFCOUNT}
    Pointer(FArray[AIndex]) := nil;
{$ENDIF}
    FArray[AIndex] := AObj;
  end;
  Inc(FCount);
  if OwnObjects then begin
    AObj.FOwner := Self;
    Notify(snObjectInserted, FDefaultReason, NativeInt(Self), NativeInt(AObj));
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.Copy(ASource: TFDDatSList);
begin
  FArray := System.Copy(ASource.FArray);
  FCount := ASource.FCount;
  FCapacity := ASource.FCapacity;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.Assign(AObj: TFDDatSObject);
var
  i: Integer;
  oObj: TFDDatSObject;
begin
  ASSERT(FOwnObjects);
  Clear;
  if AObj is TFDDatSList then begin
    MinimumCapacity := TFDDatSList(AObj).MinimumCapacity;
    Capacity := TFDDatSList(AObj).Capacity;
    for i := 0 to TFDDatSList(AObj).Count - 1 do begin
      oObj := TFDDatSObjectClass(TFDDatSList(AObj).ItemsI[i].ClassType).Create;
      AddObject(oObj);
      oObj.Assign(TFDDatSList(AObj).ItemsI[i]);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.Clear;
begin
  if OwnObjects then
    while Count > 0 do
      RemoveAt(Count - 1)
  else
    FCount := 0;
  Capacity := MinimumCapacity;
end;

{-------------------------------------------------------------------------------}
function TFDDatSList.ContainsObj(AObj: TFDDatSObject): Boolean;
begin
  Result := IndexOf(AObj) <> -1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSList.GetItemsI(AIndex: Integer): TFDDatSObject;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := FArray[AIndex];
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.Notify(AParam: PFDDatSNotifyParam);
begin
  if AParam^.FParam1 = NativeInt(Self) then
    case AParam^.FKind of
    snObjectRemoving:
      TFDDatSObject(AParam^.FParam2).DoListRemoving;
    snObjectRemoved:
      TFDDatSObject(AParam^.FParam2).DoListRemoved(Owner);
    snObjectInserting:
      TFDDatSObject(AParam^.FParam2).DoListInserting;
    snObjectInserted:
      TFDDatSObject(AParam^.FParam2).DoListInserted;
    end;
  inherited Notify(AParam);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.HandleNotification(AParam: PFDDatSNotifyParam);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    FArray[i].HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
function TFDDatSList.IndexOf(AObj: TFDDatSObject): Integer;
begin
  ASSERT(AObj <> nil);
  Result := FDIndexOf(FArray, FCount, AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSList.IsEqualTo(AObj: TFDDatSObject): Boolean;
var
  i: Integer;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := (Count = TFDDatSList(AObj).Count);
    if Result then begin
      for i := 0 to Count - 1 do
        if not ItemsI[i].IsEqualTo(TFDDatSList(AObj).ItemsI[i]) then begin
          Result := False;
          Exit;
       end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSList.Remove(AObj: TFDDatSObject; ANotDestroy: Boolean = False): Integer;
begin
  Result := IndexOf(AObj);
  if Result <> -1 then
    RemoveAt(Result, ANotDestroy);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.RemoveAt(AIndex: Integer; ANotDestroy: Boolean = False);
var
  oObj: TFDDatSObject;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  oObj := FArray[AIndex];
  if OwnObjects then
    Notify(snObjectRemoving, FDefaultReason, NativeInt(Self), NativeInt(oObj));
{$IFDEF AUTOREFCOUNT}
  FArray[AIndex] := nil;
{$ENDIF}
  if FCount - AIndex - 1 > 0 then begin
    Move(FArray[AIndex + 1], FArray[AIndex], (FCount - AIndex - 1) * SizeOf(TFDDatSObject));
{$IFDEF AUTOREFCOUNT}
    Pointer(FArray[FCount - 1]) := nil;
{$ENDIF}
  end;
  Dec(FCount);
  if OwnObjects then begin
    oObj.FOwner := nil;
    try
      Notify(snObjectRemoved, FDefaultReason, NativeInt(Self), NativeInt(oObj));
    finally
      if not ANotDestroy then
        FDFreeAndNil(oObj);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.SetCapacity(const AValue: Integer);
begin
  ASSERT((AValue <= MAXINT div SizeOf(Pointer)) and (AValue >= 0));
  if FCapacity <> AValue then begin
    SetLength(FArray, AValue);
    FCapacity := AValue;
    if FCount > FCapacity then
      FCount := FCapacity;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.SetMinimumCapacity(const AValue: Integer);
begin
  ASSERT((AValue <= MAXINT div SizeOf(Pointer)) and (AValue >= 0));
  if FMinimumCapacity <> AValue then begin
    FMinimumCapacity := AValue;
    if FMinimumCapacity > Capacity then
      Capacity := FMinimumCapacity;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSList.MoveTo(AFromIndex, AToIndex: Integer): Boolean;
var
  oObj: TFDDatSObject;
begin
  Result := AFromIndex <> AToIndex;
  if not Result then
    Exit;
  ASSERT((AFromIndex >= 0) and (AFromIndex < FCount));
  ASSERT((AToIndex >= 0) and (AToIndex < FCount));
  oObj := FArray[AFromIndex];
  if AFromIndex < AToIndex then
    Move(FArray[AFromIndex + 1], FArray[AFromIndex], (AToIndex - AFromIndex) * SizeOf(TFDDatSObject))
  else if AFromIndex > AToIndex then
    Move(FArray[AToIndex], FArray[AToIndex + 1], (AFromIndex - AToIndex) * SizeOf(TFDDatSObject));
{$IFDEF AUTOREFCOUNT}
  Pointer(FArray[AToIndex]) := nil;
{$ENDIF}
  FArray[AToIndex] := oObj;
end;

{-------------------------------------------------------------------------------}
class function TFDDatSList.GetObjectStyle: TFDStorageObjectStyle;
begin
  Result := osFlatArray;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  sName: String;
begin
  sName := GetStreamingName(AStorage);
  while not AStorage.IsObjectEnd(sName) do
    AddEx(AStorage.LoadObject as TFDDatSObject);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSList.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    AStorage.SaveObject(ItemsI[i]);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSNamedObject                                                          -}
{-------------------------------------------------------------------------------}
type
  TFDDatSNamedObjectUpdateInfo = record
    FPrevName: String;
  end;
  PFDDatSNamedObjectUpdateInfo = ^TFDDatSNamedObjectUpdateInfo;

{-------------------------------------------------------------------------------}
constructor TFDDatSNamedObject.Create;
begin
  inherited Create;
  FName := GetDefaultName;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedObject.Assign(AObj: TFDDatSObject);
var
  oList: TFDDatSNamedList;
begin
  if (AObj is TFDDatSNamedObject) and
     (MetaCompareText(Name, TFDDatSNamedObject(AObj).Name) <> 0) then begin
    oList := NamedList;
    if oList <> nil then
      Name := oList.BuildUniqueName(TFDDatSNamedObject(AObj).Name)
    else
      Name := TFDDatSNamedObject(AObj).Name;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedObject.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := TFDDatSNamedObject(AObj).Name = Name;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedObject.GetNamedList: TFDDatSNamedList;
begin
  Result := TFDDatSNamedList(GetOwnerByClass(TFDDatSNamedList));
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedObject.GetDefaultName: String;
begin
  Result := UpperCase(ClassName);
  if (Length(Result) > 9) and (Copy(Result, 1, 7) = 'TFDDATS') then
    Result := Copy(ClassName, 8, Length(Result) - 7)
  else
    Result := ClassName;
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedObject.GetIsDefaultName: Boolean;
begin
  Result := Pos(DefaultName, Name) = 1;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedObject.SetName(const AValue: String);
var
  oList: TFDDatSNamedList;
  rInfo: TFDDatSNamedObjectUpdateInfo;
begin
  if FName <> AValue then begin
    oList := NamedList;
    if oList <> nil then
      oList.CheckUniqueName(AValue, Self);
    FPrevName := FName;
    FName := AValue;
    try
      if FPrevName <> '' then begin
        rInfo.FPrevName := PrevName;
        Notify(snObjectNameChanged, srMetaChange, NativeInt(Self), NativeInt(@rInfo));
      end;
      FPrevName := FName;
    except
      FName := FPrevName;
      raise;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedObject.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  Name := AStorage.ReadString('Name', Name);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedObject.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  if (Name <> '') and (Name <> DefaultName) then
    AStorage.WriteString('Name', Name, '');
end;

{-------------------------------------------------------------------------------}
{- TFDDatSNamedList                                                            -}
{-------------------------------------------------------------------------------}
constructor TFDDatSNamedList.Create;
begin
  inherited Create;
  FNamesIndex := TFDStringList.Create(dupAccept, True, False);
{$IFDEF FireDAC_NOLOCALE_META}
  FNamesIndex.UseLocale := False;
{$ENDIF}
  FDefaultReason := srMetaChange;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSNamedList.Destroy;
begin
  inherited Destroy;
  FDFreeAndNil(FNamesIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedList.AddObjectAt(AObj: TFDDatSObject; AIndex: Integer);
begin
  ASSERT(AObj <> nil);
  if TFDDatSNamedObject(AObj).FPrevName = '' then
    TFDDatSNamedObject(AObj).Name := BuildUniqueName(TFDDatSNamedObject(AObj).Name);
  inherited AddObjectAt(AObj, AIndex);
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedList.Find(const AName: String; out AIndex: Integer): Boolean;
begin
  Result := FNamesIndex.Find(AName, AIndex);
  if not Result then
    AIndex := -1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedList.FindRealIndex(const AName: String; out AIndex: Integer): Boolean;
begin
  Result := Find(AName, AIndex);
  if Result then
    AIndex := TFDDatSNamedObject(FNamesIndex.Objects[AIndex]).Index;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedList.CheckUniqueName(const AName: String; ASelf: TFDDatSNamedObject);
  procedure ErrorDubName;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_DuplicatedName, [AName]);
  end;
var
  i: Integer;
begin
  i := -1;
  if (AName <> '') and FindRealIndex(AName, i) and (ASelf <> ItemsI[i]) then
    ErrorDubName;
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedList.ContainsName(const AName: String): Boolean;
var
  i: Integer;
begin
  Result := Find(AName, i);
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedList.GetItemsI(AIndex: Integer): TFDDatSNamedObject;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSNamedObject(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedList.IndexOfName(const AName: String): Integer;
begin
  Result := -1;
  FindRealIndex(AName, Result);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedList.ErrorNameNotFound(const AName: String);
begin
  FDException(Self, [S_FD_LDatS], er_FD_NameNotFound, [AName]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedList.ItemByName(const AName: String): TFDDatSNamedObject;
var
  i: Integer;
begin
  i := -1;
  if not Find(AName, i) then
    ErrorNameNotFound(AName);
  Result := TFDDatSNamedObject(FNamesIndex.Objects[i]);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedList.Notify(AParam: PFDDatSNotifyParam);

  procedure DoObjectChanged;
  var
    sName: String;
    i: Integer;
  begin
    if AParam^.FKind = snObjectInserting then begin
      sName := TFDDatSNamedObject(AParam^.FParam2).Name;
      if sName <> '' then
        CheckUniqueName(sName, TFDDatSNamedObject(AParam^.FParam2));
    end
    else if AParam^.FKind = snObjectRemoved then begin
      sName := TFDDatSNamedObject(AParam^.FParam2).Name;
      i := -1;
      if (sName <> '') and FNamesIndex.Find(sName, i) then
        FNamesIndex.Delete(i);
    end
    else if AParam^.FKind = snObjectInserted then begin
      sName := TFDDatSNamedObject(AParam^.FParam2).Name;
      if sName <> '' then
        FNamesIndex.AddObject(sName, TFDDatSNamedObject(AParam^.FParam2));
    end;
  end;

  procedure DoObjectRenamed;
  var
    oObj: TFDDatSNamedObject;
    sPrevName: String;
    i: Integer;
  begin
    oObj := TFDDatSNamedObject(AParam^.FParam1);
    if oObj.List = Self then begin
      sPrevName := PFDDatSNamedObjectUpdateInfo(AParam^.FParam2)^.FPrevName;
      if sPrevName <> '' then begin
        i := -1;
        if FNamesIndex.Find(sPrevName, i) then
          FNamesIndex.Delete(i);
      end;
      if oObj.Name <> '' then
        FNamesIndex.AddObject(oObj.Name, oObj);
    end;
  end;

begin
  if AParam^.FParam1 = NativeInt(Self) then
    DoObjectChanged
  else if AParam^.FKind = snObjectNameChanged then
    DoObjectRenamed;
  inherited Notify(AParam);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedList.RemoveByName(const AName: String);
var
  i: Integer;
begin
  i := IndexOfName(AName);
  if i = -1 then
    ErrorNameNotFound(AName);
  RemoveAt(i);
end;

{-------------------------------------------------------------------------------}
function TFDDatSNamedList.BuildUniqueName(const AName: String): String;
var
  i: Integer;
begin
  Result := AName;
  i := 0;
  while ContainsName(Result) do begin
    Inc(i);
    Result := AName + '_' + IntToStr(i);
  end;
end;

{-------------------------------------------------------------------------------}
class function TFDDatSNamedList.GetObjectStyle: TFDStorageObjectStyle;
begin
  Result := osTypedArray;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNamedList.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  sStrName, sObj, sName: String;
  i: Integer;
  lFirst: Boolean;
  oBmk: TObject;
begin
  sStrName := GetStreamingName(AStorage);
  lFirst := True;
  while not AStorage.IsObjectEnd(sStrName) do begin
    oBmk := AStorage.GetBookmark;
    try
      sObj := AStorage.ReadObjectBegin('', osObject);
      sName := AStorage.ReadString('Name', '');
      AStorage.SetBookmark(oBmk);
    finally
      FDFree(oBmk);
    end;
    i := IndexOfName(sName);
    if (i = -1) and lFirst and (Count > 0) and
       (Self is TFDDatSTableList) and not AStorage.IsStored(siMeta) then
      i := 0;
    if (i <> -1) and (CompareText(ItemsI[i].GetStreamingName(AStorage), sObj) = 0) then
      ItemsI[i].LoadFromStorage(AStorage)
    else
      AddEx(AStorage.LoadObject as TFDDatSObject);
    lFirst := False;
  end;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSBindedObject                                                         -}
{-------------------------------------------------------------------------------}
constructor TFDDatSBindedObject.Create;
begin
  inherited Create;
  FSourceName := Name;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSBindedObject.Assign(AObj: TFDDatSObject);
begin
  inherited Assign(AObj);
  if AObj is TFDDatSBindedObject then begin
    FSourceName := TFDDatSBindedObject(AObj).FSourceName;
    FSourceID := TFDDatSBindedObject(AObj).FSourceID;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSBindedObject.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalLoadFromStorage(AStorage);
  SourceName := AStorage.ReadString('SourceName', '');
  SourceID := AStorage.ReadInteger('SourceID', 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSBindedObject.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteString('SourceName', SourceName, '');
  AStorage.WriteInteger('SourceID', SourceID, 0);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSBindedList                                                           -}
{-------------------------------------------------------------------------------}
function TFDDatSBindedList.ItemByName(const AName: String): TFDDatSBindedObject;
begin
  Result := TFDDatSBindedObject(inherited ItemByName(AName));
end;

{-------------------------------------------------------------------------------}
function TFDDatSBindedList.GetItemsI(AIndex: Integer): TFDDatSBindedObject;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSBindedObject(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSBindedList.IndexOfSourceName(const AName: String): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if MetaCompareText(ItemsI[i].SourceName, AName) = 0 then begin
      Result := i;
      Break;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSBindedList.IndexOfSourceID(AID: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if ItemsI[i].SourceID = AID then begin
      Result := i;
      Break;
    end;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSColumn                                                               -}
{-------------------------------------------------------------------------------}
constructor TFDDatSColumn.Create;
begin
  inherited Create;
  FAttributes := [caAllowNull];
  FOptions := [coAllowNull, coInUpdate, coInWhere];
  FAutoIncrementSeed := 1;
  FAutoIncrementStep := 1;
  FIndex := -1;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSColumn.Create(const AName: String;
  AType: TFDDataType = dtAnsiString; const AExpression: String = '');
begin
  Create;
  if AName <> '' then
    Name := AName;
  DataType := AType;
  Expression := AExpression;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.Assign(AObj: TFDDatSObject);
begin
  DefinitionChanging(True);
  inherited Assign(AObj);
  if AObj is TFDDatSColumn then begin
    FAttributes := TFDDatSColumn(AObj).FAttributes;
    FAutoIncrement := TFDDatSColumn(AObj).FAutoIncrement;
    FAutoIncrementSeed := TFDDatSColumn(AObj).FAutoIncrementSeed;
    FAutoIncrementStep := TFDDatSColumn(AObj).FAutoIncrementStep;
    FCaption := TFDDatSColumn(AObj).FCaption;
    FDataType := TFDDatSColumn(AObj).FDataType;
    FExpression := TFDDatSColumn(AObj).FExpression;
    if FExpression <> '' then
      FEvaluator := nil
    else
      FEvaluator := TFDDatSColumn(AObj).FEvaluator;
    FOptions := TFDDatSColumn(AObj).FOptions;
    FPrecision := TFDDatSColumn(AObj).FPrecision;
    FSize := TFDDatSColumn(AObj).FSize;
    FScale := TFDDatSColumn(AObj).FScale;
    FSourceDataType := TFDDatSColumn(AObj).FSourceDataType;
    FSourcePrecision := TFDDatSColumn(AObj).FSourcePrecision;
    FSourceScale := TFDDatSColumn(AObj).FSourceScale;
    FSourceSize := TFDDatSColumn(AObj).FSourceSize;
    FSourceDataTypeName := TFDDatSColumn(AObj).FSourceDataTypeName;
    FOriginTabName := TFDDatSColumn(AObj).FOriginTabName;
    FOriginColName := TFDDatSColumn(AObj).FOriginColName;
    FSourceGenerator := TFDDatSColumn(AObj).FSourceGenerator;
    DefinitionChanged(True);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.DefinitionChanged(ALayoutChanged: Boolean);
begin
  Notify(snColumnDefChanged, srMetaChange, NativeInt(Self), NativeInt(ALayoutChanged));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.DefinitionChanging(ALayoutChanging: Boolean);
var
  oTab: TFDDatSTable;
begin
  if ALayoutChanging then begin
    oTab := Table;
    if oTab <> nil then
      oTab.CheckLayoutChanging;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.Notify(AParam: PFDDatSNotifyParam);
begin
  inherited Notify(AParam);
  if (AParam^.FKind = snObjectNameChanged) and (AParam^.FParam1 = NativeInt(Self)) then begin
    if FSourceName = PFDDatSNamedObjectUpdateInfo(AParam^.FParam2)^.FPrevName then
      FSourceName := Name;
    if FOriginColName = PFDDatSNamedObjectUpdateInfo(AParam^.FParam2)^.FPrevName then
      FOriginColName := Name;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetCaption: String;
begin
  if FCaption = '' then
    Result := Name
  else
    Result := FCaption;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetNestedTable: TFDDatSTable;
var
  oManager: TFDDatSManager;
  oRel: TFDDatSRelation;
begin
  Result := nil;
  oManager := Manager;
  if oManager <> nil then begin
    oRel := oManager.Relations.FindRelation(Table, Self);
    if oRel <> nil then
      Result := oRel.ChildTable;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetParentColumn: TFDDatSColumn;
var
  oManager: TFDDatSManager;
  oRel: TFDDatSRelation;
begin
  Result := nil;
  oManager := Manager;
  if oManager <> nil then begin
    oRel := oManager.Relations.FindRelation(Table);
    if oRel <> nil then
      Result := oRel.ParentColumns[0];
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetColumnList: TFDDatSColumnList;
begin
  Result := List as TFDDatSColumnList;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetReadOnly: Boolean;
begin
  Result := coReadOnly in ActualOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetReadOnly(const AValue: Boolean);
begin
  if AValue then
    Options := Options + [coReadOnly]
  else
    Options := Options - [coReadOnly];
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.UpdateStorageSize;
  procedure ErrorColTypeUndef;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ColTypeUndefined, [Name]);
  end;
begin
  FStorageSize := 0;
  if caBlobData in Attributes then
    FStorageSize := Sizeof(TFDBlobData)
  else if not (DataType in C_FD_InvariantDataTypes) then
    case DataType of
    dtUnknown:          ErrorColTypeUndef;
    dtBoolean:          FStorageSize := Sizeof(WordBool);
    dtSByte:            FStorageSize := Sizeof(ShortInt);
    dtInt16:            FStorageSize := Sizeof(SmallInt);
    dtInt32:            FStorageSize := Sizeof(Integer);
    dtInt64:            FStorageSize := Sizeof(Int64);
    dtByte:             FStorageSize := Sizeof(Byte);
    dtUInt16:           FStorageSize := Sizeof(Word);
    dtUInt32:           FStorageSize := Sizeof(Cardinal);
    dtUInt64:           FStorageSize := Sizeof(UInt64);
    dtSingle:           FStorageSize := Sizeof(Single);
    dtDouble:           FStorageSize := Sizeof(Double);
    dtExtended:         FStorageSize := Sizeof(Extended);
    dtCurrency:         FStorageSize := Sizeof(Currency);
    dtBCD,
    dtFmtBCD:           FStorageSize := Sizeof(TBcd);
    dtDateTime:         FStorageSize := Sizeof(TDateTimeRec);
    dtDateTimeStamp:    FStorageSize := Sizeof(TSQLTimeStamp);
    dtTimeIntervalFull,
    dtTimeIntervalYM,
    dtTimeIntervalDS:   FStorageSize := SizeOf(TFDSQLTimeInterval);
    dtTime:             FStorageSize := Sizeof(Integer);
    dtDate:             FStorageSize := Sizeof(Integer);
    dtAnsiString:       FStorageSize := SizeOf(Word) + Size * SizeOf(TFDAnsiChar) + SizeOf(TFDAnsiChar);
    dtByteString:       FStorageSize := SizeOf(Word) + Size;
    dtWideString:       FStorageSize := SizeOf(Word) + Size * SizeOf(WideChar) + SizeOf(WideChar);
    dtGUID:             FStorageSize := Sizeof(TGUID);
    dtObject:           FStorageSize := Sizeof(IFDDataStoredObject);
    else                ASSERT(False);
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetStorageSize: Integer;
begin
  if FStorageSize = 0 then
    UpdateStorageSize;
  Result := FStorageSize;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetDisplayWidth: Integer;
begin
  case DataType of
  dtBoolean:          Result := 5;
  dtSByte:            if Precision > 0 then Result := Precision + 1 else Result := 4;
  dtInt16:            if Precision > 0 then Result := Precision + 1 else Result := 6;
  dtInt32:            if Precision > 0 then Result := Precision + 1 else Result := 11;
  dtInt64:            if Precision > 0 then Result := Precision + 1 else Result := 21;
  dtByte:             if Precision > 0 then Result := Precision + 1 else Result := 3;
  dtUInt16:           if Precision > 0 then Result := Precision + 1 else Result := 5;
  dtUInt32:           if Precision > 0 then Result := Precision + 1 else Result := 10;
  dtUInt64:           if Precision > 0 then Result := Precision + 1 else Result := 20;
  dtSingle:           if Precision > 0 then Result := Precision + 2 else Result := 10;
  dtDouble:           if Precision > 0 then Result := Precision + 2 else Result := 18;
  dtExtended:         if Precision > 0 then Result := Precision + 2 else Result := 22;
  dtCurrency:         if Precision > 0 then Result := Precision + 2 else Result := 22;
  dtBCD:              if Precision > 0 then Result := Precision + 2 else Result := 22;
  dtFmtBCD:           if Precision > 0 then Result := Precision + 2 else Result := 38;
  dtDateTime:         Result := 27;
  dtDateTimeStamp:    Result := 27;
  dtTimeIntervalFull: if Precision > 0 then Result := Precision + 26 else Result := 35;
  dtTimeIntervalYM:   if Precision > 0 then Result := Precision + 4 else Result := 13;
  dtTimeIntervalDS:   if Precision > 0 then Result := Precision + 14 else Result := 23;
  dtTime:             Result := 11;
  dtDate:             Result := 16;
  dtAnsiString:       Result := Size;
  dtByteString:       Result := Size * 2;
  dtWideString:       Result := Size;
  dtGUID:             Result := C_FD_GUIDStrLen;
  else                Result := 20;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetAttributes(const AValue: TFDDataAttributes);
var
  ePrevAttrs: TFDDataAttributes;
  lLayout: Boolean;
begin
  if FAttributes <> AValue then begin
    lLayout :=
      ([caBlobData, caAutoInc, caCalculated, caVirtual] * FAttributes) <>
      ([caBlobData, caAutoInc, caCalculated, caVirtual] * AValue);
    DefinitionChanging(lLayout);
    ePrevAttrs := FAttributes;
    FAttributes := AValue;
    if (caCalculated in ePrevAttrs) and not (caCalculated in FAttributes) then
      Expression := '';
    if FDataType in C_FD_NonSearchableDataTypes then
      Exclude(FAttributes, caSearchable);
    if not (caAllowNull in ePrevAttrs) and (caAllowNull in FAttributes) then
      Include(FOptions, coAllowNull)
    else if (caAllowNull in ePrevAttrs) and not (caAllowNull in FAttributes) then
      Exclude(FOptions, coAllowNull);
    if not (caReadOnly in ePrevAttrs) and (caReadOnly in FAttributes) then
      Include(FOptions, coReadOnly)
    else if (caReadOnly in ePrevAttrs) and not (caReadOnly in FAttributes) then
      Exclude(FOptions, coReadOnly);
    DefinitionChanged(lLayout);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetAutoIncrement(const AValue: Boolean);
begin
  if FAutoIncrement <> AValue then begin
    DefinitionChanging(True);
    FAutoIncrement := AValue;
    if FAutoIncrement and not IsAutoIncrementType(FDataType) then
      FDataType := dtUInt32;
    DefinitionChanged(True);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetServerAutoIncrement: Boolean;
begin
  Result := AutoIncrement and
    (Attributes * [caAutoInc, caAllowNull] = [caAutoInc, caAllowNull]) and
    (Options * [coAfterInsChanged, coInUpdate] = [coAfterInsChanged]) and
    (AutoIncrementSeed = -1) and (AutoIncrementStep = -1);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetServerAutoIncrement(const Value: Boolean);
begin
  SetAutoIncrement(Value);
  if Value then begin
    Attributes := Attributes + [caAutoInc, caAllowNull];
    Options := Options + [coAfterInsChanged] - [coInUpdate];
    AutoIncrementSeed := -1;
    AutoIncrementStep := -1;
  end
  else begin
    Attributes := Attributes - [caAutoInc];
    Options := Options - [coAfterInsChanged] + [coInUpdate];
    AutoIncrementSeed := 1;
    AutoIncrementStep := 1;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetAutoIncrementSeed(const AValue: Integer);
begin
  if FAutoIncrementSeed <> AValue then begin
    DefinitionChanging(False);
    FAutoIncrementSeed := AValue;
    DefinitionChanged(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetAutoIncrementStep(const AValue: Integer);
begin
  if FAutoIncrementStep <> AValue then begin
    DefinitionChanging(False);
    FAutoIncrementStep := AValue;
    DefinitionChanged(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetSourceGenerator(const AValue: String);
begin
  if FSourceGenerator <> AValue then begin
    FSourceGenerator := AValue;
    Include(FOptions, coInUpdate);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetCaption(const AValue: String);
begin
  if FCaption <> AValue then begin
    if AValue = Name then
      FCaption := ''
    else
      FCaption := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.IsAutoIncrementType(const AValue: TFDDataType): Boolean;
begin
  Result := AValue in [dtSByte, dtInt16, dtInt32, dtInt64,
                       dtByte, dtUInt16, dtUInt32, dtUInt64,
                       dtSingle, dtDouble, dtExtended, dtBCD, dtFmtBCD];
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetDataType(const AValue: TFDDataType);
  procedure CantChangeDataType;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantChngColType, [Name]);
  end;
var
  ePrevDataType: TFDDataType;
  iPrevSize: LongWord;
  iPrevPrec: Integer;
begin
  if FDataType <> AValue then begin
    DefinitionChanging(True);
    if Table <> nil then begin
      if Table.Rows.Count > 0 then
        CantChangeDataType;
    end;
    iPrevSize := FSize;
    iPrevPrec := FPrecision;
    ePrevDataType := FDataType;
    FDataType := AValue;
    if not IsAutoIncrementType(FDataType) then
      FAutoIncrement := False;
    if FDataType in [dtAnsiString, dtWideString, dtByteString] then
      if ColumnList <> nil then
        if ColumnList.InlineDataSize = 0 then
          FSize := MAXINT
        else
          FSize := ColumnList.InlineDataSize
      else
        FSize := 50
    else
      FSize := 0;
    if FDataType in C_FD_NonSearchableDataTypes then
      Exclude(FAttributes, caSearchable);
    if FDataType in C_FD_BlobTypes then
      Include(FAttributes, caBlobData)
    else
      Exclude(FAttributes, caBlobData);
    case FDataType of
    dtSingle:   FPrecision := 8;
    dtDouble:   FPrecision := 16;
    dtExtended: FPrecision := 20;
    dtCurrency: FPrecision := 20;
    dtBCD,
    dtFmtBCD:   FPrecision := 64;
    else        FPrecision := 0;
    end;
    if FSourceDataType = ePrevDataType then
      FSourceDataType := AValue;
    if FSourceSize = iPrevSize then
      FSourceSize := FSize;
    if FSourcePrecision = iPrevPrec then
      FSourcePrecision := FPrecision;
    DefinitionChanged(True);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetExpression(const AValue: String);
var
  oCols: TFDDatSColumnList;
  oParser: IFDStanExpressionParser;
begin
  if FExpression <> AValue then begin
    FExpression := AValue;
    FEvaluator := nil;
    if SourceID <= 0 then
      if AValue <> '' then begin
        FAttributes := FAttributes + [caReadOnly, caCalculated];
        FOptions := FOptions + [coReadOnly];
      end
      else
        FAttributes := FAttributes - [caCalculated];
    oCols := GetColumnList;
    if (FExpression = '') or (oCols = nil) or (Length(oCols.FDataOffsets) = 0) then
      DefinitionChanged(True)
    else begin
      oCols.FHasThings := oCols.FHasThings + [ctExps, ctDefs, ctCalcs];
      FDCreateInterface(IFDStanExpressionParser, oParser);
      FEvaluator := oParser.Prepare(TFDDatSTableExpressionDS.Create(Table),
        Expression, [], [poDefaultExpr], Name);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetEvaluator(const AValue: IFDStanExpressionEvaluator);
begin
  if FEvaluator <> AValue then begin
    Expression := '';
    FEvaluator := AValue;
    if FEvaluator <> nil then begin
      FAttributes := FAttributes + [caReadOnly, caCalculated];
      FOptions := FOptions + [coReadOnly];
    end;
    DefinitionChanged(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetOptions(const AValue: TFDDataOptions);
var
  lUKChng: Boolean;
begin
  if FOptions <> AValue then begin
    lUKChng := (coUnique in Options) <> (coUnique in AValue);
    FOptions := AValue;
    if lUKChng and (Table <> nil) then
      UpdateUniqueKey(coUnique in AValue);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetPrecision(const AValue: Integer);
begin
  if FPrecision <> AValue then begin
    DefinitionChanging(False);
    if FPrecision = FSourcePrecision then begin
      FPrecision := AValue;
      FSourcePrecision := AValue;
    end
    else
      FPrecision := AValue;
    DefinitionChanged(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetScale(const AValue: Integer);
begin
  if FScale <> AValue then begin
    DefinitionChanging(False);
    if FScale = FSourceScale then begin
      FScale := AValue;
      FSourceScale := AValue;
    end
    else
      FScale := AValue;
    DefinitionChanged(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetSize(const AValue: LongWord);
begin
  if FSize <> AValue then begin
    DefinitionChanging(True);
    if FSize = FSourceSize then begin
      FSize := AValue;
      FSourceSize := AValue;
    end
    else
      FSize := AValue;
    DefinitionChanged(True);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetAllowDBNull: Boolean;
begin
  Result := coAllowNull in ActualOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetAllowDBNull(const AValue: Boolean);
begin
  if AValue then
    Options := Options + [coAllowNull]
  else
    Options := Options - [coAllowNull];
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetUnique: Boolean;
begin
  Result := coUnique in ActualOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.SetUnique(const AValue: Boolean);
begin
  if AValue then
    Options := Options + [coUnique]
  else
    Options := Options - [coUnique];
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.UpdateUniqueKey(AUnique: Boolean);
var
  oCons: TFDDatSConstraintList;
  oCon: TFDDatSConstraintBase;
  i: Integer;
  oList: TFDDatSColumnList;
begin
  oCons := Table.Constraints;
  if oCons = nil then
    Exit;
  oCon := nil;
  for i := 0 to oCons.Count - 1 do begin
    oCon := oCons.ItemsI[i];
    if (oCon is TFDDatSUniqueConstraint) and
       (TFDDatSUniqueConstraint(oCon).ColumnCount = 1) and
       (TFDDatSUniqueConstraint(oCon).Columns[0] = Self) then
      Break
    else
      oCon := nil;
  end;
  if AUnique then begin
    try
      oList := GetColumnList;
      if (oCon = nil) then begin
        if (oList = nil) or not (ctSerializing in oList.HasThings) then
          oCons.AddUK('', Self, False);
      end
      else
        oCon.Enforce := True;
    except
      Exclude(FOptions, coUnique);
      raise;
    end;
  end
  else begin
    if oCon <> nil then
      FDFree(oCon);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.DoListInserting;
begin
  DefinitionChanging(True);
  inherited DoListInserting;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.DoListInserted;
begin
  inherited DoListInserted;
  if Unique then
    UpdateUniqueKey(True);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.DoListRemoving;
begin
  DefinitionChanging(True);
  inherited DoListRemoving;
  if Unique then
    UpdateUniqueKey(False);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetIndex: Integer;
begin
  Result := FIndex;
  if Result = -1 then
    Result := inherited GetIndex;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetActualCaption: String;
begin
  Result := Caption;
  if Assigned(Table.MetadataCallback) then
    Table.MetadataCallback.GetColumnCaption(Self, Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetActualAttributes: TFDDataAttributes;
begin
  Result := Attributes;
  if Assigned(Table.MetadataCallback) then
    Table.MetadataCallback.GetColumnAttributes(Self, Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetActualOptions: TFDDataOptions;
begin
  Result := Options;
  if Assigned(Table.MetadataCallback) then
    Table.MetadataCallback.GetColumnOptions(Self, Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetActualOriginColName: String;
begin
  Result := OriginColName;
  if Result = '' then
    Result := SourceName;
  if Assigned(Table.MetadataCallback) then
    Table.MetadataCallback.GetColumnOrigin(Self, Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumn.GetActualGenerator: String;
begin
  Result := SourceGenerator;
  if Assigned(Table.MetadataCallback) then
    Table.MetadataCallback.GetColumnGenerator(Self, Result);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  eAttrs: TFDDataAttributes;
  eAttr: TFDDataAttribute;
  eOpts: TFDDataOptions;
  eOpt: TFDDataOption;
begin
  inherited InternalLoadFromStorage(AStorage);
  DataType := TFDDataType(AStorage.ReadEnum('DataType',
    TypeInfo(TFDDataType), Integer(dtUnknown)));
  Precision := AStorage.ReadInteger('Precision', 0);
  Scale := AStorage.ReadInteger('Scale', 0);
  Size := AStorage.ReadInteger('Size', 0);
  eAttrs := [];
  for eAttr := Low(TFDDataAttribute) to High(TFDDataAttribute) do
    if AStorage.ReadBoolean(Copy(GetEnumName(TypeInfo(TFDDataAttribute),
                            Integer(eAttr)), 3, MAXINT), False) then
      Include(eAttrs, eAttr);
  Attributes := eAttrs;
  AutoIncrement := AStorage.ReadBoolean('AutoIncrement', caAutoInc in Attributes);
  AutoIncrementSeed := AStorage.ReadInteger('AutoIncrementSeed', 1);
  AutoIncrementStep := AStorage.ReadInteger('AutoIncrementStep', 1);
  Caption := AStorage.ReadString('Caption', Caption);
  Expression := AStorage.ReadString('Expression', '');
  eOpts := [];
  for eOpt := Low(TFDDataOption) to High(TFDDataOption) do
    if AStorage.ReadBoolean('O' + Copy(GetEnumName(TypeInfo(TFDDataOption),
                            Integer(eOpt)), 3, MAXINT), False) then
      Include(eOpts, eOpt);
  Options := eOpts;
  if AStorage.TestProperty('OriginName') then begin
    OriginTabName := '';
    OriginColName := AStorage.ReadString('OriginName', '');
  end
  else begin
    OriginTabName := AStorage.ReadString('OriginTabName', '');
    OriginColName := AStorage.ReadString('OriginColName', '');
  end;
  if AStorage.TestProperty('SourceDataType') then
    SourceDataType := TFDDataType(AStorage.ReadEnum('SourceDataType',
      TypeInfo(TFDDataType), Integer(dtUnknown)));
  SourcePrecision := AStorage.ReadInteger('SourcePrecision', 0);
  SourceScale := AStorage.ReadInteger('SourceScale', 0);
  SourceSize := AStorage.ReadInteger('SourceSize', 0);
  SourceDataTypeName := AStorage.ReadString('SourceDataTypeName', '');
  SourceDirectory := AStorage.ReadString('SourceDirectory', '');
  SourceGenerator := AStorage.ReadString('SourceGenerator', '');
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumn.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  eAttr: TFDDataAttribute;
  eAttrs: TFDDataAttributes;
  eOpt: TFDDataOption;
  eOpts: TFDDataOptions;
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteEnum('DataType', TypeInfo(TFDDataType), Integer(DataType),
    Integer(dtUnknown));
  AStorage.WriteInteger('Precision', Precision, 0);
  AStorage.WriteInteger('Scale', Scale, 0);
  AStorage.WriteInteger('Size', Size, 0);
  eAttrs := ActualAttributes;
  for eAttr := Low(TFDDataAttribute) to High(TFDDataAttribute) do
    if (eAttr in eAttrs) and
       ((AStorage.StreamVersion >= 7) or (eAttr <> caBase) and (eAttr <> caExpr)) then
      AStorage.WriteBoolean(Copy(GetEnumName(TypeInfo(TFDDataAttribute),
        Integer(eAttr)), 3, MAXINT), True, False);
  AStorage.WriteBoolean('AutoIncrement', AutoIncrement, caAutoInc in Attributes);
  AStorage.WriteInteger('AutoIncrementSeed', AutoIncrementSeed, 1);
  AStorage.WriteInteger('AutoIncrementStep', AutoIncrementStep, 1);
  if (ActualCaption <> '') and (ActualCaption <> Name) then
    AStorage.WriteString('Caption', ActualCaption, '');
  AStorage.WriteString('Expression', Expression, '');
  eOpts := ActualOptions;
  for eOpt := Low(TFDDataOption) to High(TFDDataOption) do
    if eOpt in eOpts then
      AStorage.WriteBoolean('O' + Copy(GetEnumName(TypeInfo(TFDDataOption),
        Integer(eOpt)), 3, MAXINT), True, False);
  if AStorage.StreamVersion >= 2 then begin
    AStorage.WriteString('OriginTabName', ActualOriginTabName, '');
    AStorage.WriteString('OriginColName', ActualOriginColName, '');
  end
  else
    AStorage.WriteString('OriginName', ActualOriginColName, '');
  if (SourceDataType <> dtUnknown) and (SourceDataType <> DataType) then
    AStorage.WriteEnum('SourceDataType', TypeInfo(TFDDataType),
      Integer(SourceDataType), Integer(dtUnknown));
  AStorage.WriteInteger('SourcePrecision', SourcePrecision, 0);
  AStorage.WriteInteger('SourceScale', SourceScale, 0);
  AStorage.WriteInteger('SourceSize', SourceSize, 0);
  AStorage.WriteString('SourceDataTypeName', SourceDataTypeName, '');
  AStorage.WriteString('SourceDirectory', SourceDirectory, '');
  AStorage.WriteString('SourceGenerator', ActualGenerator, '');
end;

{-------------------------------------------------------------------------------}
{- TFDDatSTableExpressionDS                                                    -}
{-------------------------------------------------------------------------------}
constructor TFDDatSTableExpressionDS.Create(ATable: TFDDatSTable);
begin
  ASSERT(ATable <> nil);
  inherited Create;
  FTable := ATable;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetPosition: Pointer;
begin
  Result := FRow;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTableExpressionDS.SetPosition(AValue: Pointer);
begin
  FRow := TFDDatSRow(AValue);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetRowNum: Integer;
begin
  ASSERT(FRow <> nil);
  Result := FRow.Index + 1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetDatabase: String;
begin
  Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetUser: String;
begin
  Result := '';
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetSubAggregateValue(AIndex: Integer): Variant;
begin
  Result := Unassigned;
  ASSERT(False);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetVarIndex(const AName: String): Integer;
begin
  Result := FTable.Columns.IndexOfName(AName);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetVarType(AIndex: Integer): TFDDataType;
begin
  Result := FTable.Columns[AIndex].DataType;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetVarScope(AIndex: Integer): TFDExpressionScopeKind;
begin
  Result := ckField;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableExpressionDS.GetVarData(AIndex: Integer): Variant;
begin
  ASSERT(FRow <> nil);
  Result := FRow.GetData(AIndex, rvDefault);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTableExpressionDS.SetVarData(AIndex: Integer;
  const AValue: Variant);
begin
  ASSERT(FRow <> nil);
  FRow.SetData(AIndex, AValue);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSColumnList                                                           -}
{-------------------------------------------------------------------------------}
constructor TFDDatSColumnList.CreateForTable(ATable: TFDDatSTable);
begin
  ASSERT(ATable <> nil);
  inherited Create;
  FOwner := ATable;
  OwnObjects := True;
  FInlineDataSize := C_FD_DefInlineDataSize;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.Assign(AObj: TFDDatSObject);
begin
  inherited Assign(AObj);
  if AObj is TFDDatSColumnList then begin
    OnCalcColumns := TFDDatSColumnList(AObj).OnCalcColumns;
    InlineDataSize := TFDDatSColumnList(AObj).InlineDataSize;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnList.Add(AObj: TFDDatSColumn): Integer;
begin
  Result := AddObject(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnList.Add(const AName: String;
  AType: TFDDataType = dtAnsiString; const AExpression: String = ''): TFDDatSColumn;
begin
  Result := TFDDatSColumn.Create(AName, AType, AExpression);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.AddObjectAt(AObj: TFDDatSObject; AIndex: Integer);
var
  oTab: TFDDatSTable;
begin
  oTab := Table;
  if oTab <> nil then
    oTab.CheckLayoutChanging;
  inherited AddObjectAt(AObj, AIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.RemoveAt(AIndex: Integer; ANotDestroy: Boolean = False);
var
  oTab: TFDDatSTable;
begin
  oTab := Table;
  if oTab <> nil then
    oTab.CheckLayoutChanging;
  inherited RemoveAt(AIndex, ANotDestroy);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnList.ColumnByName(const AName: String): TFDDatSColumn;
begin
  Result := TFDDatSColumn(inherited ItemByName(AName));
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnList.GetCurrValues(AIndex: Integer): Variant;
var
  [unsafe] oCol: TFDDatSColumn;
  iVal: Integer;
  sVal: Single;
  dVal: Double;
  eVal: Extended;
begin
  Result := Null;
  oCol := ItemsI[AIndex];
  if oCol.AutoIncrement then begin
    iVal := FAutoIncs[AIndex];
    case oCol.DataType of
    dtByte:
      Result := Byte(iVal);
    dtSByte:
      Result := ShortInt(iVal);
    dtUInt16:
      Result := Word(iVal);
    dtInt16:
      Result := SmallInt(iVal);
    dtUInt32:
      Result := Cardinal(iVal);
    dtInt32:
      Result := iVal;
    dtUInt64:
      Result := UInt64(iVal);
    dtInt64:
      Result := Int64(iVal);
    dtSingle:
      begin
        sVal := iVal;
        Result := sVal;
      end;
    dtDouble:
      begin
        dVal := iVal;
        Result := dVal;
      end;
    dtExtended:
      begin
        eVal := iVal;
        Result := eVal;
      end;
    dtBCD,
    dtFmtBCD:
      Result := VarFMTBcdCreate(iVal);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnList.GetItemsI(AIndex: Integer): TFDDatSColumn;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSColumn(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.Notify(AParam: PFDDatSNotifyParam);
begin
  if (AParam^.FKind = snColumnDefChanged) and
       (TFDDatSColumn(TFDDatSObject(AParam^.FParam1)).List = Self) and (AParam^.FParam2 <> 0) or
     (AParam^.FKind = snObjectInserted) and (TFDDatSObject(AParam^.FParam1) = Self) or
     (AParam^.FKind = snObjectRemoved) and (TFDDatSObject(AParam^.FParam1) = Self) then
    TerminateLayout;
  // MSGOPT this condition is only for optimization
  if AParam^.FKind <> snColumnDefChanged then
    inherited Notify(AParam);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  // MSGOPT nothing - just exit
  // if AParam^.FReason = srDataChange then
  //   Exit;
  // inherited HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.SetInlineDataSize(const AValue: Word);
begin
  if FInlineDataSize <> AValue then begin
    FInlineDataSize := AValue;
    TerminateLayout;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.CheckUpdateLayout;
begin
  if Length(FDataOffsets) = 0 then
    UpdateLayout;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.UpdateLayout;
  procedure ErrorNoCols;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_NoColsDefined, []);
  end;
  procedure ErrorRowSinglePar;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_RowMayHaveSingleParent, []);
  end;
var
  iOffset: Integer;
  i: Integer;
  oParentCol: TFDDatSColumn;
  oParser: IFDStanExpressionParser;
  oCol: TFDDatSColumn;
begin
  if Count = 0 then
    ErrorNoCols;
  try
    SetLength(FDataOffsets, Count + 1);
    SetLength(FNullOffsets, Count);
    SetLength(FNullMasks, Count);
    iOffset := 0;
    FInvariants := 0;
    FParentRowRefCol := -1;
    FParentCol := -1;
    FHasThings := [];
    oParser := nil;
    for i := 0 to Count - 1 do begin
      oCol := ItemsI[i];
      oCol.FIndex := i;
      if oCol.DataType in C_FD_StrTypes then
        if oCol.Size > InlineDataSize then
          Include(oCol.FAttributes, caBlobData);
      FDataOffsets[i] := iOffset;
      Inc(iOffset, FDAlign(oCol.StorageSize));
      if oCol.AutoIncrement then
        Include(FHasThings, ctAutoIncs);
      if oCol.DataType = dtParentRowRef then begin
        if FParentRowRefCol <> -1 then
          ErrorRowSinglePar
        else
          FParentRowRefCol := i;
        oParentCol := oCol.ParentColumn;
        if oParentCol <> nil then
          FParentCol := oParentCol.Index;
      end;
      if oCol.DataType in C_FD_InvariantDataTypes then begin
        Inc(FInvariants);
        Include(FHasThings, ctInvars);
        if oCol.DataType = dtParentRowRef then
          Include(FHasThings, ctParentRef);
      end;
      if caCalculated in oCol.Attributes then
        Include(FHasThings, ctCalcs)
      else if oCol.Expression <> '' then
        Include(FHasThings, ctExps);
      if (oCol.Expression <> '') or oCol.AutoIncrement then
        Include(FHasThings, ctDefs);
      if (caBlobData in oCol.FAttributes) or (oCol.DataType = dtObject) then
        Include(FHasThings, ctComp);
      if oCol.DataType in C_FD_LateSerTypes then
        Include(FHasThings, ctLateSer);
    end;
    FDataOffsets[Count] := iOffset;
    for i := 0 to Count - 1 do begin
      FNullOffsets[i] := iOffset + i div 8;
      FNullMasks[i] := Byte(1 shl (i mod 8));
    end;
    if ctAutoIncs in FHasThings then begin
      SetLength(FAutoIncs, Count);
      for i := 0 to Count - 1 do begin
        oCol := ItemsI[i];
        if oCol.AutoIncrement then
          FAutoIncs[i] := oCol.AutoIncrementSeed - oCol.AutoIncrementStep;
      end;
    end;
    if FInvariants <> 0 then begin
      SetLength(FInvariantMap, Count);
      FInvariants := 0;
      for i := 0 to Count - 1 do begin
        oCol := ItemsI[i];
        if oCol.DataType in C_FD_InvariantDataTypes then begin
          FInvariantMap[i] := FInvariants;
          Inc(FInvariants);
        end;
      end;
    end;
    for i := 0 to Count - 1 do begin
      oCol := ItemsI[i];
      if oCol.Expression <> '' then begin
        if oParser = nil then
          FDCreateInterface(IFDStanExpressionParser, oParser);
        oCol.FEvaluator := oParser.Prepare(TFDDatSTableExpressionDS.Create(Table),
          oCol.Expression, [], [poDefaultExpr], oCol.Name);
      end;
    end;
    FFetchedSize := (Count + 7) div 8;
    if FInvariants <> 0 then
      FInvariantSize := FInvariants * SizeOf(NativeInt)
    else
      FInvariantSize := 0;
    FInfoSize := FFetchedSize + FInvariantSize;
  except
    TerminateLayout;
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.TerminateLayout;
var
  i: Integer;
  oCol: TFDDatSColumn;
begin
  if Length(FDataOffsets) <> 0 then begin
    FParentRowRefCol := -1;
    FParentCol := -1;
    FFetchedSize := 0;
    FInvariantSize := 0;
    FInvariants := 0;
    FHasThings := [];
    SetLength(FDataOffsets, 0);
    SetLength(FNullOffsets, 0);
    SetLength(FNullMasks, 0);
    SetLength(FAutoIncs, 0);
    SetLength(FInvariantMap, 0);
    for i := 0 to Count - 1 do begin
      oCol := ItemsI[i];
      oCol.FIndex := -1;
      oCol.FEvaluator := nil;
      oCol.FStorageSize := 0;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnList.GetStorageSize: LongWord;
begin
  Result := DataOffsets[Count] + LongWord((Count + 7) div 8);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.FixAutoIncs(ARow: TFDDatSRow);

  procedure DoFixAutoIncs;
  var
//Fix by flying wang.
    Temp: Variant;
    TempInt,
    i: Integer;
  begin
    for i := 0 to Count - 1 do
      if ItemsI[i].AutoIncrement then
      begin
        TempInt := 0;
        Temp := ARow.GetData(i);
        if VarIsNumeric(Temp) then
        begin
          TempInt := Temp;
        end
        else
        begin
          TempInt := StrToIntDef(VarToStr(Temp) ,TempInt);
        end;
//        if ItemsI[i].AutoIncrementStep > 0 then begin
//          if FAutoIncs[i] < ARow.GetData(i) then
//            FAutoIncs[i] := ARow.GetData(i);
//        end
//        else begin
//          if FAutoIncs[i] > ARow.GetData(i) then
//            FAutoIncs[i] := ARow.GetData(i);
//        end;
        if ItemsI[i].AutoIncrementStep > 0 then begin
          if FAutoIncs[i] < TempInt then
            FAutoIncs[i] := TempInt;
        end
        else begin
          if FAutoIncs[i] > TempInt then
            FAutoIncs[i] := TempInt;
        end;
      end;
  end;

begin
  if ctAutoIncs in FHasThings then
    DoFixAutoIncs;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  Include(FHasThings, ctSerializing);
  try
    if AStorage.StreamVersion < 12 then
      InlineDataSize := Word(AStorage.ReadInteger('InlineDataSize', C_FD_DefInlineDataSize));
    inherited InternalLoadFromStorage(AStorage);
  finally
    Exclude(FHasThings, ctSerializing);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnList.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  Include(FHasThings, ctSerializing);
  try
    if AStorage.StreamVersion < 12 then
      AStorage.WriteInteger('InlineDataSize', InlineDataSize, C_FD_DefInlineDataSize);
    inherited InternalSaveToStorage(AStorage);
  finally
    Exclude(FHasThings, ctSerializing);
  end;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSColumnSublist                                                        -}
{-------------------------------------------------------------------------------}
procedure TFDDatSColumnSublist.Clear;
begin
  SetLength(FArray, 0);
  FNames := '';
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSColumnSublist.Add(ACol: TFDDatSColumn);
begin
  SetLength(FArray, Length(FArray) + 1);
  FArray[Length(FArray) - 1] := ACol;
end;

{-------------------------------------------------------------------------------}
// field[:[D][A][N]];
procedure TFDDatSColumnSublist.Fill(AObject: TFDDatSObject;
  const AFields: String; ACaseInsensitiveColumnList: TFDDatSColumnSublist = nil;
  ADescendingColumnList: TFDDatSColumnSublist = nil);
var
  oCols: TFDDatSColumnList;
  oCol: TFDDatSColumn;
  i, j, jFrom: Integer;
  lNoCase, lDesc, lInvalid: Boolean;
  sItem: String;
begin
  ASSERT((AObject <> nil) and (AObject.Table <> nil));
  Clear;
  oCols := AObject.Table.Columns;
  if AFields = '*' then begin
    SetLength(FArray, oCols.Count);
    for i := 0 to oCols.Count - 1 do begin
      FArray[i] := oCols.ItemsI[i];
      if FNames <> '' then
        FNames := FNames + ';';
      FNames := FNames + FArray[i].Name;
    end;
  end
  else begin
    i := 1;
    while i <= Length(AFields) do begin
      sItem := FDExtractFieldName(AFields, i);
      j := Pos(':', sItem);
      lNoCase := False;
      lDesc := False;
      lInvalid := j <= 1;
      if not lInvalid then begin
        jFrom := j;
        while j < Length(sItem) do begin
          Inc(j);
          case sItem[j] of
          'n', 'N': lNoCase := True;
          'd', 'D': lDesc := True;
          'a', 'A': lDesc := False;
          else      lInvalid := True; Break;
          end;
        end;
        if not lInvalid then
          sItem := Copy(sItem, 1, jFrom - 1);
      end;
      oCol := oCols.ColumnByName(sItem);
      Add(oCol);
      if lNoCase and (ACaseInsensitiveColumnList <> nil) then
        ACaseInsensitiveColumnList.Add(oCol);
      if lDesc and (ADescendingColumnList <> nil) then
        ADescendingColumnList.Add(oCol);
    end;
    FNames := AFields;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnSublist.GetCount: Integer;
begin
  Result := Length(FArray);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnSublist.GetItemsI(AIndex: Integer): TFDDatSColumn;
begin
  ASSERT((AIndex >= 0) and (AIndex < Length(FArray)));
  Result := TFDDatSColumn(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnSublist.HandleNotification(AParam: PFDDatSNotifyParam): Boolean;
begin
  if (AParam^.FReason = srMetaChange) and (
       (AParam^.FKind = snObjectNameChanged) and (IndexOf(TFDDatSColumn(AParam^.FParam1)) <> -1) or
// MSGOPT (AParam^.FKind = snObjectInserted) and (IndexOf(TFDDatSColumn(AParam^.FParam2)) <> -1) or
       (AParam^.FKind = snObjectRemoved) and (IndexOf(TFDDatSColumn(AParam^.FParam2)) <> -1)
     ) then
    Result := True
  else
    Result := False;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnSublist.IndexOf(AColumn: TFDDatSColumn): Integer;
begin
  ASSERT(AColumn <> nil);
  Result := FDIndexOf(FArray, -1, AColumn);
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnSublist.IndexOfName(const AName: String): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if TFDDatSObject.MetaCompareText(FArray[i].Name, AName) = 0 then begin
      Result := i;
      Exit;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnSublist.FindColumn(const AName: String): TFDDatSColumn;
var
  i: Integer;
begin
  i := IndexOfName(AName);
  if i <> -1 then
    Result := FArray[i]
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDDatSColumnSublist.Matches(AList: TFDDatSColumnSublist;
  ACount: Integer): Boolean;
var
  iCnt, i: Integer;
begin
  if AList = nil then
    iCnt := -1
  else if ACount = -1 then
    iCnt := AList.Count
  else if ACount = -2 then begin
    iCnt := AList.Count;
    if iCnt <> Count then begin
      Result := False;
      Exit;
    end;
  end
  else
    iCnt := ACount;
  if iCnt > Count then
    Result := False
  else begin
    Result := True;
    for i := 0 to iCnt - 1 do
      if FArray[i] <> AList.FArray[i] then begin
        Result := False;
        Break;
      end;
  end;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSConstraintBase                                                       -}
{-------------------------------------------------------------------------------}
constructor TFDDatSConstraintBase.Create;
begin
  inherited Create;
  FEnforce := True;
  FRely := True;
  FLastActualEnforce := ActualEnforce;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSConstraintBase.Destroy;
begin
  Enforce := False;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.Assign(AObj: TFDDatSObject);
begin
  inherited Assign(AObj);
  if AObj is TFDDatSConstraintBase then begin
    Rely := TFDDatSConstraintBase(AObj).Rely;
    Enforce := TFDDatSConstraintBase(AObj).Enforce;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintBase.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then
    Result := (Rely = TFDDatSConstraintBase(AObj).Rely);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.Check(ARow: TFDDatSRow; AProposedState:
  TFDDatSRowState; ATime: TFDDatSCheckTime);
begin
  ASSERT(ARow <> nil);
  if ActualEnforce and (ATime = CheckTime) and CheckRow(ARow) then
    DoCheck(ARow, AProposedState);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintBase.CheckRow(ARow: TFDDatSRow): Boolean;
begin
  // nothing
  Result := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.DoCheck(ARow: TFDDatSRow;
  AProposedState: TFDDatSRowState);
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.CheckAll;
var
  oRows: TFDDatSTableRowList;
  i: Integer;
begin
  oRows := Table.Rows;
  for i := 0 to oRows.Count - 1 do
    DoCheck(oRows[i], rsChecking);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.DoEnforceUpdated;
begin
  // nothing
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.EnforceUpdated;
begin
  if FLastActualEnforce <> ActualEnforce then begin
    FLastActualEnforce := ActualEnforce;
    try
      DoEnforceUpdated;
      if ActualEnforce and not Rely then
        CheckAll;
    except
      Enforce := False;
      raise;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.SetEnforce(const AValue: Boolean);
begin
  if FEnforce <> AValue then begin
    FEnforce := AValue;
    EnforceUpdated;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.DoListInserted;
begin
  EnforceUpdated;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.DoListRemoved(ANewOwner: TFDDatSObject);
begin
  EnforceUpdated;
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintBase.GetActualEnforce: Boolean;
begin
  Result := Enforce and (ConstraintList <> nil);
  if Result then begin
    Result := ConstraintList.Enforce;
    if Result and (Manager <> nil) then
      Result := Manager.EnforceConstraints;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintBase.GetConstraintList: TFDDatSConstraintList;
begin
  Result := List as TFDDatSConstraintList;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.ResolveEnforce(const AName, AValue: String);
begin
  if SameText(AName, 'Enforce') and SameText(AValue, S_FD_True) then
    Enforce := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  lEnforce: Boolean;
begin
  Enforce := False;
  inherited InternalLoadFromStorage(AStorage);
  lEnforce := AStorage.ReadBoolean('Enforce', True);
  if lEnforce then
    AStorage.DeferAction('Enforce', S_FD_True, ResolveEnforce);
  Rely := AStorage.ReadBoolean('Rely', True);
  CheckTime := TFDDatSCheckTime(AStorage.ReadEnum('CheckTime',
    TypeInfo(TFDDatSCheckTime), Integer(ctAtEditEnd)));
  Message := AStorage.ReadString('Message', '');
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintBase.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteBoolean('Enforce', Enforce, True);
  AStorage.WriteBoolean('Rely', Rely, True);
  AStorage.WriteEnum('CheckTime', TypeInfo(TFDDatSCheckTime),
    Integer(CheckTime), Integer(ctAtEditEnd));
  AStorage.WriteString('Message', Message, '');
end;

{-------------------------------------------------------------------------------}
{- TFDDatSConstraintList                                                       -}
{-------------------------------------------------------------------------------}
constructor TFDDatSConstraintList.CreateForTable(ATable: TFDDatSTable);
begin
  ASSERT(ATable <> nil);
  inherited Create;
  FOwner := ATable;
  OwnObjects := True;
  FEnforce := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.Assign(AObj: TFDDatSObject);
begin
  Clear;
  if AObj is TFDDatSConstraintList then
    Enforce := False;
  inherited Assign(AObj);
  if AObj is TFDDatSConstraintList then
    Enforce := TFDDatSConstraintList(AObj).Enforce;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if AParam^.FReason = srDataChange then
    Exit;
  inherited HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.Add(AObj: TFDDatSConstraintBase): Integer;
begin
  Result := AddObject(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.AddUK(const AName: String; AColumn: TFDDatSColumn;
  APrimaryKey: Boolean): TFDDatSUniqueConstraint;
begin
  Result := AddUK(AName, [AColumn], APrimaryKey);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.AddUK(const AName: String;
  const AColumns: array of TFDDatSColumn; APrimaryKey: Boolean): TFDDatSUniqueConstraint;
begin
  Result := TFDDatSUniqueConstraint.Create(AName, AColumns, APrimaryKey);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.AddUK(const AName, AColumnNames: String;
  APrimaryKey: Boolean): TFDDatSUniqueConstraint;
begin
  Result := TFDDatSUniqueConstraint.Create(AName, AColumnNames, APrimaryKey);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.AddFK(const AName: String;
  APrimaryKeyColumn, AForeignKeyColumn: TFDDatSColumn): TFDDatSForeignKeyConstraint;
begin
  Result := AddFK(AName, [APrimaryKeyColumn], [AForeignKeyColumn]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.AddFK(const AName: String;
  const APrimaryKeyColumns, AForeignKeyColumns: array of TFDDatSColumn): TFDDatSForeignKeyConstraint;
begin
  Result := TFDDatSForeignKeyConstraint.Create(AName, APrimaryKeyColumns,
    AForeignKeyColumns, crCascade, crRestrict);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.AddFK(const AName, AParentTableName, APrimaryKeyColumns,
  AForeignKeyColumns: String): TFDDatSForeignKeyConstraint;
begin
  Result := TFDDatSForeignKeyConstraint.Create(AName, AParentTableName,
    APrimaryKeyColumns, AForeignKeyColumns, crCascade, crRestrict);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.AddFK(const AName: String; AParentTable: TFDDatSTable;
  const APrimaryKeyColumns, AForeignKeyColumns: String): TFDDatSForeignKeyConstraint;
begin
  Result := TFDDatSForeignKeyConstraint.Create(AName, AParentTable,
    APrimaryKeyColumns, AForeignKeyColumns, crCascade, crRestrict);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.AddChk(const AName, AExpression: String;
  const AMessage: String = ''; ACheckTime: TFDDatSCheckTime = ctAtEditEnd): TFDDatSCheckConstraint;
begin
  Result := TFDDatSCheckConstraint.Create(AName, AExpression, AMessage, ACheckTime);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.Check(ARow: TFDDatSRow; AProposedState:
  TFDDatSRowState; ATime: TFDDatSCheckTime);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].Check(ARow, AProposedState, ATime);
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.ConstraintByName(const AName: String):
  TFDDatSConstraintBase;
begin
  Result := TFDDatSConstraintBase(inherited ItemByName(AName));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.EnforceUpdated;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].EnforceUpdated;
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.GetItemsI(AIndex: Integer): TFDDatSConstraintBase;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSConstraintBase(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.SetEnforce(const AValue: Boolean);
begin
  if FEnforce <> AValue then begin
    FEnforce := AValue;
    EnforceUpdated;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.FindUnique(
  const AFields: String): TFDDatSUniqueConstraint;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if ItemsI[i] is TFDDatSUniqueConstraint then
      if MetaCompareText(AFields, TFDDatSUniqueConstraint(ItemsI[i]).ColumnNames) = 0 then begin
        Result := TFDDatSUniqueConstraint(ItemsI[i]);
        Break;
      end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSConstraintList.FindPrimaryKey: TFDDatSUniqueConstraint;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if ItemsI[i] is TFDDatSUniqueConstraint then
      if TFDDatSUniqueConstraint(ItemsI[i]).IsPrimaryKey then begin
        Result := TFDDatSUniqueConstraint(ItemsI[i]);
        Break;
      end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.CheckAll;
var
  i: Integer;
  oCons: TFDDatSConstraintBase;
begin
  for i := 0 to Count - 1 do begin
    oCons := ItemsI[i];
    if oCons.ActualEnforce and not oCons.Rely then
      try
        oCons.CheckAll;
      except
        oCons.Enforce := False;
      end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.ResolveEnforce(const AName, AValue: String);
begin
  if SameText(AName, 'Enforce') and SameText(AValue, S_FD_True) then
    Enforce := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  lEnforce: Boolean;
begin
  if AStorage.StreamVersion < 12 then begin
    Enforce := False;
    lEnforce := AStorage.ReadBoolean('Enforce', True);
    if lEnforce then
      AStorage.DeferAction('Enforce', S_FD_True, ResolveEnforce);
  end;
  inherited InternalLoadFromStorage(AStorage);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSConstraintList.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  if AStorage.StreamVersion < 12 then
    AStorage.WriteBoolean('Enforce', Enforce, True);
  inherited InternalSaveToStorage(AStorage);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSUniqueConstraint                                                     -}
{-------------------------------------------------------------------------------}
constructor TFDDatSUniqueConstraint.Create;
begin
  inherited Create;
  FColumns := TFDDatSColumnSublist.Create;
  FOptions := [soUnique];
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSUniqueConstraint.Create(AColumn: TFDDatSColumn;
  APrimaryKey: Boolean);
begin
  Create('', [AColumn], APrimaryKey);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSUniqueConstraint.Create(
  const AColumns: array of TFDDatSColumn; APrimaryKey: Boolean);
begin
  Create('', AColumns, APrimaryKey);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSUniqueConstraint.Create(const AName: String;
  AColumn: TFDDatSColumn; APrimaryKey: Boolean);
begin
  Create(AName, [AColumn], APrimaryKey);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSUniqueConstraint.Create(const AName: String;
  const AColumns: array of TFDDatSColumn; APrimaryKey: Boolean);
var
  s: String;
  i: Integer;
begin
  ASSERT(AColumns[Low(AColumns)] <> nil);
  s := AColumns[Low(AColumns)].Name;
  for i := Low(AColumns) + 1 to High(AColumns) do begin
    ASSERT(AColumns[i] <> nil);
    s := s + ';' + AColumns[i].Name;
  end;
  Create(AName, s, APrimaryKey);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSUniqueConstraint.Create(const AName,
  AColumnNames: String; APrimaryKey: Boolean);
begin
  Create;
  if AName <> '' then
    Name := AName;
  ColumnNames := AColumnNames;
  if APrimaryKey then
    Options := Options + [soPrimary];
  Enforce := True;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSUniqueConstraint.Destroy;
begin
  Enforce := False;
  FDFreeAndNil(FColumns);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.Assign(AObj: TFDDatSObject);
begin
  inherited Assign(AObj);
  if AObj is TFDDatSUniqueConstraint then begin
    ColumnNames := TFDDatSUniqueConstraint(AObj).ColumnNames;
    Options := TFDDatSUniqueConstraint(AObj).Options;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUniqueConstraint.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := (ColumnNames = TFDDatSUniqueConstraint(AObj).ColumnNames) and
              (Options = TFDDatSUniqueConstraint(AObj).Options);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUniqueConstraint.GetUniqueSortedView: TFDDatSView;
begin
  Result := Table.Views.FindSortedView(ColumnNames, Options -
    [soNullFirst, soDescending], []);
  if Result = nil then begin
    Result := TFDDatSView.Create(Table, C_FD_SysNamePrefix + 'UC_' + Name,
      vcUniqueConstraint, False);
    try
      Result.Mechanisms.AddSort(ColumnNames, '', '', Options);
      Result.Active := True;
    except
      FDFree(Result);
      raise;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.DoCheck(ARow: TFDDatSRow; AProposedState: TFDDatSRowState);
  procedure ErrorViolated;
  begin
    if Message <> '' then
      FDException(Self, [S_FD_LDatS], er_FD_DuplicateRows, [Message, 0])
    else
      FDException(Self, [S_FD_LDatS], er_FD_DuplicateRows, [Name, 1]);
  end;
var
  oView: TFDDatSView;
  iPos: Integer;
  lFound: Boolean;
  eOpts: TFDLocateOptions;
begin
  if AProposedState in [rsInserted, rsModified] then begin
    oView := GetUniqueSortedView;
    eOpts := [loExcludeKeyRow];
    if soNoCase in Options then
      Include(eOpts, loNoCase);
    lFound := False;
    iPos := -1;
    oView.Search(ARow, nil, nil, -1, eOpts, iPos, lFound);
    if lFound then
      ErrorViolated;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.DoEnforceUpdated;
  procedure InvalidUniqueKey;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_BadUniqueKey, [Name]);
  end;
var
  i: Integer;
  oCol: TFDDatSColumn;
begin
  if not ActualEnforce then begin
    if soPrimary in Options then
      for i := 0 to FColumns.Count - 1 do begin
        oCol := FColumns[i];
        if not (caAutoInc in oCol.FAttributes) then
          Include(oCol.FAttributes, caAllowNull);
        Exclude(oCol.FOptions, coInKey);
      end;
    FColumns.Clear;
  end
  else begin
    FColumns.Fill(Self, FColumnNames);
    if FColumns.Count = 0 then
      InvalidUniqueKey;
    if soPrimary in Options then
      for i := 0 to FColumns.Count - 1 do begin
        oCol := FColumns[i];
        if not (caAutoInc in oCol.FAttributes) then
          Exclude(oCol.FAttributes, caAllowNull);
        Include(oCol.FOptions, coInKey);
      end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUniqueConstraint.GetColumnCount: Integer;
begin
  Result := FColumns.Count;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUniqueConstraint.GetColumns(AIndex: Integer):
  TFDDatSColumn;
begin
  Result := FColumns.ItemsI[AIndex];
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if (FColumns <> nil) and FColumns.HandleNotification(AParam) then
    Enforce := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.SetColumnNames(const AValue: String);
begin
  if FColumnNames <> AValue then begin
    FColumnNames := AValue;
    Enforce := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.SetOptions(const AValue: TFDSortOptions);
begin
  if FOptions <> AValue then begin
    FOptions := AValue;
    Enforce := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUniqueConstraint.GetIsPrimaryKey: Boolean;
begin
  Result := soPrimary in Options;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.SetIsPrimaryKey(const AValue: Boolean);
begin
  if AValue then
    Options := Options + [soPrimary]
  else
    Options := Options - [soPrimary];
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  eOpt: TFDSortOption;
  eOpts: TFDSortOptions;
begin
  inherited InternalLoadFromStorage(AStorage);
  ColumnNames := AStorage.ReadString('ColumnNames', '');
  eOpts := [];
  for eOpt := Low(TFDSortOption) to High(TFDSortOption) do
    if AStorage.ReadBoolean(Copy(GetEnumName(TypeInfo(TFDSortOption),
                            Integer(eOpt)), 3, MAXINT), False) then
      Include(eOpts, eOpt);
  Options := eOpts;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUniqueConstraint.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  eOpt: TFDSortOption;
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteString('ColumnNames', ColumnNames, '');
  for eOpt := Low(TFDSortOption) to High(TFDSortOption) do
    if eOpt in Options then
      AStorage.WriteBoolean(Copy(GetEnumName(TypeInfo(TFDSortOption),
        Integer(eOpt)), 3, MAXINT), True, False);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSForeignKeyConstraint                                                 -}
{-------------------------------------------------------------------------------}
constructor TFDDatSForeignKeyConstraint.Create;
begin
  inherited Create;
  FDeleteRule := crCascade;
  FUpdateRule := crCascade;
  FInsertRule := crCascade;
  FAcceptRejectRule := arCascade;
  FColumns := TFDDatSColumnSublist.Create;
  FRelatedColumns := TFDDatSColumnSublist.Create;
  FCascadingRows := TFDObjList.Create;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSForeignKeyConstraint.Create(const AName: String;
  AParentColumn, AChildColumn: TFDDatSColumn; ADeleteRule,
  AUpdateRule: TFDDatSConstraintRule);
begin
  Create(AName, [AParentColumn], [AChildColumn], ADeleteRule, AUpdateRule);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSForeignKeyConstraint.Create(AParentColumn,
  AChildColumn: TFDDatSColumn; ADeleteRule,
  AUpdateRule: TFDDatSConstraintRule);
begin
  Create('', [AParentColumn], [AChildColumn], ADeleteRule, AUpdateRule);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSForeignKeyConstraint.Create(const AParentColumns,
  AChildColumns: array of TFDDatSColumn; ADeleteRule,
  AUpdateRule: TFDDatSConstraintRule);
begin
  Create('', AParentColumns, AChildColumns, ADeleteRule, AUpdateRule);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSForeignKeyConstraint.Create(const AName: String;
  const AParentColumns, AChildColumns: array of TFDDatSColumn; ADeleteRule,
  AUpdateRule: TFDDatSConstraintRule);
var
  s: String;
  i: Integer;
begin
  Create;
  if AName <> '' then
    Name := AName;
  ASSERT(AParentColumns[Low(AParentColumns)] <> nil);
  RelatedTableName := AParentColumns[Low(AParentColumns)].Table.Name;
  s := AParentColumns[Low(AParentColumns)].Name;
  for i := Low(AParentColumns) + 1 to High(AParentColumns) do begin
    ASSERT(AParentColumns[i] <> nil);
    s := s + ';' + AParentColumns[i].Name;
  end;
  RelatedColumnNames := s;
  ASSERT(AChildColumns[Low(AChildColumns)] <> nil);
  s := AChildColumns[Low(AChildColumns)].Name;
  for i := Low(AChildColumns) + 1 to High(AChildColumns) do begin
    ASSERT(AChildColumns[i] <> nil);
    s := s + ';' + AChildColumns[i].Name;
  end;
  ColumnNames := s;
  DeleteRule := ADeleteRule;
  UpdateRule := AUpdateRule;
  Enforce := True;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSForeignKeyConstraint.Create(const AName,
  AParentTableName, AParentColumnNames, AChildColumnNames: String;
  ADeleteRule, AUpdateRule: TFDDatSConstraintRule);
begin
  Create;
  if AName <> '' then
    Name := AName;
  RelatedTableName := AParentTableName;
  RelatedColumnNames := AParentColumnNames;
  ColumnNames := AChildColumnNames;
  DeleteRule := ADeleteRule;
  UpdateRule := AUpdateRule;
  Enforce := True;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSForeignKeyConstraint.Create(const AName: String;
  AParentTable: TFDDatSTable; const AParentColumnNames, AChildColumnNames: String;
  ADeleteRule, AUpdateRule: TFDDatSConstraintRule);
begin
  Create;
  if AName <> '' then
    Name := AName;
  RelatedTableName := AParentTable.Name;
  RelatedColumnNames := AParentColumnNames;
  ColumnNames := AChildColumnNames;
  DeleteRule := ADeleteRule;
  UpdateRule := AUpdateRule;
  Enforce := True;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSForeignKeyConstraint.Destroy;
begin
  Enforce := False;
  FDFreeAndNil(FColumns);
  FDFreeAndNil(FRelatedColumns);
  FDFreeAndNil(FCascadingRows);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.Assign(AObj: TFDDatSObject);
begin
  inherited Assign(AObj);
  if AObj is TFDDatSForeignKeyConstraint then begin
    ColumnNames := TFDDatSForeignKeyConstraint(AObj).ColumnNames;
    RelatedColumnNames := TFDDatSForeignKeyConstraint(AObj).RelatedColumnNames;
    RelatedTableName := TFDDatSForeignKeyConstraint(AObj).RelatedTableName;
    DeleteRule := TFDDatSForeignKeyConstraint(AObj).DeleteRule;
    UpdateRule := TFDDatSForeignKeyConstraint(AObj).UpdateRule;
    ParentMessage := TFDDatSForeignKeyConstraint(AObj).ParentMessage;
    AcceptRejectRule := TFDDatSForeignKeyConstraint(AObj).AcceptRejectRule;
    FieldValueRequired := TFDDatSForeignKeyConstraint(AObj).FieldValueRequired;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSForeignKeyConstraint.IsEqualTo(AObj: TFDDatSObject):
  Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then
    Result := (ColumnNames = TFDDatSForeignKeyConstraint(AObj).ColumnNames) and
              (RelatedColumnNames = TFDDatSForeignKeyConstraint(AObj).RelatedColumnNames) and
              (RelatedTableName = TFDDatSForeignKeyConstraint(AObj).RelatedTableName) and
              (DeleteRule = TFDDatSForeignKeyConstraint(AObj).DeleteRule) and
              (UpdateRule = TFDDatSForeignKeyConstraint(AObj).UpdateRule) and
              (ParentMessage = TFDDatSForeignKeyConstraint(AObj).ParentMessage) and
              (AcceptRejectRule = TFDDatSForeignKeyConstraint(AObj).AcceptRejectRule) and
              (FieldValueRequired = TFDDatSForeignKeyConstraint(AObj).FieldValueRequired);
end;

{-------------------------------------------------------------------------------}
function TFDDatSForeignKeyConstraint.GetChildSortedView: TFDDatSView;
begin
  Result := Table.Views.FindSortedView(ColumnNames, [], [soNoCase]);
  if Result = nil then begin
    Result := TFDDatSView.Create(Table, C_FD_SysNamePrefix + 'FKC_' + Name,
      vcForeignKeyConstraint, False);
    try
      Result.Mechanisms.AddSort(ColumnNames);
      Result.Active := True;
    except
      FDFree(Result);
      raise;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSForeignKeyConstraint.GetMasterSortedView: TFDDatSView;
begin
  Result := RelatedTable.Views.FindSortedView(RelatedColumnNames, [], [soNoCase]);
  if Result = nil then begin
    Result := TFDDatSView.Create(RelatedTable, C_FD_SysNamePrefix + 'FKM_' + Name,
      vcForeignKeyConstraint, False);
    try
      Result.Mechanisms.AddSort(RelatedColumnNames);
      Result.Active := True;
    except
      FDFree(Result);
      raise;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSForeignKeyConstraint.CheckRow(ARow: TFDDatSRow): Boolean;
begin
  Result := (FCascadingRows.IndexOf(ARow) = -1);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.DoCheck(ARow: TFDDatSRow;
  AProposedState: TFDDatSRowState);
var
  oMasterView, oChildView: TFDDatSView;
  iPos: Integer;
  lFound: Boolean;
  oRowList: TFDObjList;

  procedure SelectChildRows(ARowVersion: TFDDatSRowVersion);
  var
    oRow: TFDDatSRow;
  begin
    oRowList := TFDObjList.Create;
    repeat
      oRow := oChildView.Rows.ItemsI[iPos];
      if oRow.RowState = rsChecking then
        FDException(Self, [S_FD_LDatS], er_FD_FoundCascadeLoop, [Name]);
      oRowList.Add(oRow);
      Inc(iPos);
    until (iPos >= oChildView.Rows.Count) or
          (ARow.CompareRows(FRelatedColumns, nil, nil, -1, oChildView.Rows.ItemsI[iPos],
                            FColumns, ARowVersion, [], FDEmptyCC) <> 0);
  end;

  procedure DeleteChildRows;
  var
    i: Integer;
    oCurRow: TFDDatSRow;
  begin
    for i := 0 to oRowList.Count - 1 do begin
      oCurRow := TFDDatSRow(oRowList[i]);
      if not (oCurRow.RowState in [rsDeleted, rsDetached, rsInitializing]) then begin
        FCascadingRows.Add(oCurRow);
        try
          oCurRow.Delete;
        finally
          FCascadingRows.Remove(oCurRow);
        end;
      end;
    end;
  end;

  procedure NullifyChildRows;
  var
    i, j: Integer;
    oCurRow: TFDDatSRow;
    lNeedEndEdit: Boolean;
    pBuff: Pointer;
    iLen: LongWord;
  begin
    iLen := 0;
    pBuff := nil;
    for i := 0 to oRowList.Count - 1 do begin
      oCurRow := TFDDatSRow(oRowList[i]);
      if not (oCurRow.RowState in [rsDeleted, rsDetached, rsInitializing]) then begin
        FCascadingRows.Add(oCurRow);
        try
          lNeedEndEdit := False;
          try
            for j := 0 to FColumns.Count - 1 do begin
              if oCurRow.GetData(FColumns.ItemsI[j].Index, rvDefault, pBuff, 0, iLen, False) then begin
                if oCurRow.RowState <> rsEditing then begin
                  oCurRow.BeginEdit;
                  lNeedEndEdit := True;
                end;
                oCurRow.SetData(FColumns.ItemsI[j].Index, nil, 0);
                if CascadeOriginal then
                  oCurRow.InternalSetData(FColumns.ItemsI[j].Index, rvOriginal, nil, 0);
              end;
            end;
            if lNeedEndEdit then
              oCurRow.EndEdit;
          except
            if lNeedEndEdit then
              oCurRow.CancelEdit;
            raise;
          end;
        finally
          FCascadingRows.Remove(oCurRow);
        end;
      end;
    end;
  end;

  procedure UpdateChildRows;
  var
    i, j: Integer;
    iLen: LongWord;
    pData: Pointer;
    oCurRow: TFDDatSRow;
    lNeedEndEdit: Boolean;
  begin
    iLen := 0;
    pData := nil;
    for i := 0 to oRowList.Count - 1 do begin
      oCurRow := TFDDatSRow(oRowList[i]);
      if not (oCurRow.RowState in [rsDeleted, rsDetached, rsInitializing]) then begin
        FCascadingRows.Add(oCurRow);
        try
          lNeedEndEdit := False;
          try
            if ARow.CompareRows(FRelatedColumns, nil, nil, -1, oCurRow,
                                FColumns, rvDefault, [], FDEmptyCC) <> 0 then
              for j := 0 to FColumns.Count - 1 do begin
                if oCurRow.RowState <> rsEditing then begin
                  oCurRow.BeginEdit;
                  lNeedEndEdit := True;
                end;
                ARow.GetData(FRelatedColumns.ItemsI[j].Index, rvDefault, pData, 0, iLen, False);
                oCurRow.SetData(FColumns.ItemsI[j].Index, pData, iLen);
                if CascadeOriginal then
                  oCurRow.InternalSetData(FColumns.ItemsI[j].Index, rvOriginal, pData, iLen);
              end;
            if lNeedEndEdit then
              oCurRow.EndEdit;
          except
            if lNeedEndEdit then
              oCurRow.CancelEdit;
            raise;
          end;
        finally
          FCascadingRows.Remove(oCurRow);
        end;
      end;
    end;
  end;

  procedure AcceptChildRows(AAccept: Boolean);
  var
    i: Integer;
    oCurRow: TFDDatSRow;
  begin
    for i := 0 to oRowList.Count - 1 do begin
      oCurRow := TFDDatSRow(oRowList[i]);
      if AAccept then
        oCurRow.AcceptChanges
      else
        oCurRow.RejectChanges;
    end;
  end;

  function CheckNotNull(AColumns: TFDDatSColumnSublist): Boolean;
  var
    i: Integer;
    pBuff: Pointer;
    iLen: LongWord;
  begin
    Result := True;
    if FFieldValueRequired then begin
      iLen := 0;
      pBuff := nil;
      for i := 0 to AColumns.Count - 1 do
        if not ARow.GetData(AColumns.ItemsI[i].Index, rvDefault, pBuff, 0, iLen, False) then begin
          Result := False;
          Break;
        end;
    end;
  end;

  procedure ErrorHasChildRows;
  begin
    if ParentMessage <> '' then
      FDException(Self, [S_FD_LDatS], er_FD_HasChildRows, [ParentMessage, 0])
    else
      FDException(Self, [S_FD_LDatS], er_FD_HasChildRows, [Name, 1]);
  end;

  procedure ErrorNoMasterRow;
  begin
    if Message <> '' then
      FDException(Self, [S_FD_LDatS], er_FD_NoMasterRow, [Message, 0])
    else
      FDException(Self, [S_FD_LDatS], er_FD_NoMasterRow, [Name, 1]);
  end;

begin
  if RelatedTable = nil then
    Exit;
  oRowList := nil;
  iPos := -1;
  lFound := False;
  try
    // --- master table
    if ARow.Table = RelatedTable then begin
      oChildView := GetChildSortedView;
      case AProposedState of
      rsInitializing,
      rsDetached,
      rsDeleted:
        case DeleteRule of
        crRestrict:
          if CheckNotNull(FRelatedColumns) then begin
            oChildView.Search(ARow, nil, FRelatedColumns, -1, [], iPos, lFound, rvDefault);
            if lFound then
              ErrorHasChildRows;
          end;
        crCascade:
          begin
            oChildView.Search(ARow, nil, FRelatedColumns, -1, [], iPos, lFound, rvPrevious);
            if lFound then begin
              SelectChildRows(rvPrevious);
              DeleteChildRows;
            end;
          end;
        crNullify:
          begin
            oChildView.Search(ARow, nil, FRelatedColumns, -1, [], iPos, lFound, rvPrevious);
            if lFound then begin
              SelectChildRows(rvPrevious);
              NullifyChildRows;
            end;
          end;
        end;
      rsModified:
        case UpdateRule of
        crRestrict:
          if CheckNotNull(FRelatedColumns) then begin
            oChildView.Search(ARow, nil, FRelatedColumns, -1, [], iPos, lFound, rvCurrent);
            if lFound and not ARow.CompareColumnsVersions(FRelatedColumns, rvPrevious, rvDefault) then
              ErrorHasChildRows;
          end;
        crCascade:
          begin
            oChildView.Search(ARow, nil, FRelatedColumns, -1, [], iPos, lFound, rvCurrent);
            if lFound then begin
              SelectChildRows(rvCurrent);
              UpdateChildRows;
            end;
          end;
        crNullify:
          begin
            oChildView.Search(ARow, nil, FRelatedColumns, -1, [], iPos, lFound, rvCurrent);
            if lFound then begin
              SelectChildRows(rvCurrent);
              NullifyChildRows;
            end;
          end;
        end;
      rsUnchanged,
      rsDestroying:
        if AcceptRejectRule = arCascade then begin
          oChildView.Search(ARow, nil, FRelatedColumns, -1, [], iPos, lFound, rvDefault);
          if lFound then begin
            SelectChildRows(rvDefault);
            AcceptChildRows(AProposedState = rsUnchanged);
          end;
        end;
      end;
    end
    // --- child table
    else if ARow.Table = Table then begin
      if (AProposedState in [rsInserted, rsModified]) and CheckNotNull(FColumns) then begin
        oMasterView := GetMasterSortedView;
        oMasterView.Search(ARow, nil, FColumns, -1, [], iPos, lFound);
        if not lFound then
          ErrorNoMasterRow;
      end;
    end;
  finally
    FDFreeAndNil(oRowList);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.DoInsertAssignParentValues(AParentRow,
  AChildRow: TFDDatSRow);
var
  i: Integer;
  iLen: LongWord;
  pData: Pointer;
begin
  iLen := 0;
  pData := nil;
  for i := 0 to FColumns.Count - 1 do begin
    AParentRow.GetData(FRelatedColumns.ItemsI[i].Index, rvDefault, pData, 0, iLen, False);
    AChildRow.SetData(FColumns.ItemsI[i].Index, pData, iLen);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.DoEnforceUpdated;
  procedure InvalidForeignKey;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_BadForeignKey, [Name]);
  end;
var
  i: Integer;
begin
  if not ActualEnforce then begin
    FColumns.Clear;
    FRelatedColumns.Clear;
    FRelatedTable := nil;
  end
  else begin
    if (FRelatedTableName <> '') and (Manager <> nil) then
      FRelatedTable := Manager.Tables.TableByName(FRelatedTableName);
    FColumns.Fill(Self, FColumnNames);
    if FRelatedTable <> nil then
      FRelatedColumns.Fill(FRelatedTable, FRelatedColumnNames);
    if (FRelatedTable = nil) or (FRelatedTable.Manager <> Manager) or
       (FColumns.Count = 0) or (FColumns.Count <> FRelatedColumns.Count) or
       FColumns.Matches(FRelatedColumns) then
      InvalidForeignKey;
    for i := 0 to FColumns.Count - 1 do
      if FColumns[i].DataType <> FRelatedColumns[i].DataType then
        InvalidForeignKey;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSForeignKeyConstraint.GetColumnCount: Integer;
begin
  Result := FColumns.Count;
end;

{-------------------------------------------------------------------------------}
function TFDDatSForeignKeyConstraint.GetColumns(AIndex: Integer): TFDDatSColumn;
begin
  Result := FColumns.ItemsI[AIndex];
end;

{-------------------------------------------------------------------------------}
function TFDDatSForeignKeyConstraint.GetRelatedColumnCount: Integer;
begin
  Result := FRelatedColumns.Count;
end;

{-------------------------------------------------------------------------------}
function TFDDatSForeignKeyConstraint.GetRelatedColumns(AIndex: Integer): TFDDatSColumn;
begin
  Result := FRelatedColumns.ItemsI[AIndex];
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if (FColumns <> nil) and FColumns.HandleNotification(AParam) or
     (FRelatedColumns <> nil) and FRelatedColumns.HandleNotification(AParam) then
    Enforce := False
  else
    if (AParam^.FKind = snObjectRemoved) and (AParam^.FParam2 = NativeInt(RelatedTable)) then
      Enforce := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.SetColumnNames(const AValue: String);
begin
  if FColumnNames <> AValue then begin
    FColumnNames := AValue;
    Enforce := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.SetRelatedColumnNames(const AValue: String);
begin
  if FRelatedColumnNames <> AValue then begin
    FRelatedColumnNames := AValue;
    Enforce := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.SetRelatedTableName(const AValue: String);
begin
  if FRelatedTableName <> AValue then begin
    FRelatedTableName := AValue;
    Enforce := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalLoadFromStorage(AStorage);
  ColumnNames := AStorage.ReadString('ColumnNames', '');
  RelatedColumnNames := AStorage.ReadString('RelatedColumnNames', '');
  RelatedTableName := AStorage.ReadString('RelatedTableName', '');
  DeleteRule := TFDDatSConstraintRule(AStorage.ReadEnum('DeleteRule',
    TypeInfo(TFDDatSConstraintRule), Integer(crCascade)));
  InsertRule := TFDDatSConstraintRule(AStorage.ReadEnum('InsertRule',
    TypeInfo(TFDDatSConstraintRule), Integer(crCascade)));
  UpdateRule := TFDDatSConstraintRule(AStorage.ReadEnum('UpdateRule',
    TypeInfo(TFDDatSConstraintRule), Integer(crCascade)));
  AcceptRejectRule := TFDDatSConstraintARRule(AStorage.ReadEnum('AcceptRejectRule',
    TypeInfo(TFDDatSConstraintARRule), Integer(arCascade)));
  FieldValueRequired := AStorage.ReadBoolean('FieldValueRequired', False);
  ParentMessage := AStorage.ReadString('ParentMessage', '');
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSForeignKeyConstraint.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteString('ColumnNames', ColumnNames, '');
  AStorage.WriteString('RelatedColumnNames', RelatedColumnNames, '');
  AStorage.WriteString('RelatedTableName', RelatedTableName, '');
  AStorage.WriteEnum('DeleteRule', TypeInfo(TFDDatSConstraintRule),
    Integer(DeleteRule), Integer(crCascade));
  AStorage.WriteEnum('InsertRule', TypeInfo(TFDDatSConstraintRule),
    Integer(InsertRule), Integer(crCascade));
  AStorage.WriteEnum('UpdateRule', TypeInfo(TFDDatSConstraintRule),
    Integer(UpdateRule), Integer(crCascade));
  AStorage.WriteEnum('AcceptRejectRule', TypeInfo(TFDDatSConstraintARRule),
    Integer(AcceptRejectRule), Integer(arCascade));
  AStorage.WriteBoolean('FieldValueRequired', FieldValueRequired, False);
  AStorage.WriteString('ParentMessage', ParentMessage, '');
end;

{-------------------------------------------------------------------------------}
{- TFDDatSCheckConstraint                                                      -}
{-------------------------------------------------------------------------------}
constructor TFDDatSCheckConstraint.Create(const AExpression: string);
begin
  Create('', AExpression);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSCheckConstraint.Create(const AName, AExpression: string;
  const AMessage: String = ''; ACheckTime: TFDDatSCheckTime = ctAtEditEnd);
begin
  Create;
  if AName <> '' then
    Name := AName;
  Expression := AExpression;
  Message := AMessage;
  CheckTime := ACheckTime;
  Enforce := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSCheckConstraint.Assign(AObj: TFDDatSObject);
begin
  inherited Assign(AObj);
  if AObj is TFDDatSCheckConstraint then
    Expression := TFDDatSCheckConstraint(AObj).Expression;
end;

{-------------------------------------------------------------------------------}
function TFDDatSCheckConstraint.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then
    Result := (Expression = TFDDatSCheckConstraint(AObj).Expression);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSCheckConstraint.DoCheck(ARow: TFDDatSRow; AProposedState: TFDDatSRowState);
  procedure ErrorCheckViolated;
  begin
    if Message <> '' then
      FDException(Self, [S_FD_LDatS], er_FD_CheckViolated, [Message, 0])
    else if IsDefaultName then
      FDException(Self, [S_FD_LDatS], er_FD_CheckViolated, [Expression, 1])
    else
      FDException(Self, [S_FD_LDatS], er_FD_CheckViolated, [Name, 1]);
  end;
begin
  if (AProposedState in [rsInserted, rsModified]) and (CheckTime = ctAtEditEnd) or
     (AProposedState in [rsEditing, rsImportingCurent, rsImportingOriginal,
      rsImportingProposed]) and (CheckTime = ctAtColumnChange) then begin
    FEvaluator.DataSource.Position := ARow;
    try
      if not FEvaluator.Evaluate then
        ErrorCheckViolated;
    finally
      FEvaluator.DataSource.Position := nil;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSCheckConstraint.DoEnforceUpdated;
var
  oParser: IFDStanExpressionParser;
begin
  if ActualEnforce then begin
    FDCreateInterface(IFDStanExpressionParser, oParser);
    FEvaluator := oParser.Prepare(TFDDatSTableExpressionDS.Create(Table),
      Expression, [],  [], '');
  end
  else
    FEvaluator := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSCheckConstraint.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if (FEvaluator <> nil) and
     FEvaluator.HandleNotification(Word(AParam^.FKind), Word(AParam^.FReason),
                                   AParam^.FParam1, AParam^.FParam2) then
    Enforce := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSCheckConstraint.SetExpression(const AValue: String);
begin
  if FExpression <> AValue then begin
    FExpression := AValue;
    Enforce := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSCheckConstraint.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalLoadFromStorage(AStorage);
  Expression := AStorage.ReadString('Expression', '');
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSCheckConstraint.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteString('Expression', Expression, '');
end;

{-------------------------------------------------------------------------------}
{- TFDDatSRelation                                                             -}
{-------------------------------------------------------------------------------}
constructor TFDDatSRelation.Create;
begin
  inherited Create;
  FChildColumns := TFDDatSColumnSublist.Create;
  FParentColumns := TFDDatSColumnSublist.Create;
  FRefs := TFDRefCounter.Create(Self);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSRelation.Create(const ARelName: String;
  AParentColumn, AChildColumn: TFDDatSColumn; ANested: Boolean;
  ACreateConstraints: Boolean);
begin
  Create(ARelName, [AParentColumn], [AChildColumn], ANested, ACreateConstraints);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSRelation.Create(const ARelName: String;
  const AParentColumns, AChildColumns: array of TFDDatSColumn; ANested: Boolean;
  ACreateConstraints: Boolean);
var
  sPar, sChild: String;
  i: Integer;
begin
  ASSERT(AParentColumns[Low(AParentColumns)] <> nil);
  sPar := AParentColumns[Low(AParentColumns)].Name;
  for i := Low(AParentColumns) + 1 to High(AParentColumns) do begin
    ASSERT(AParentColumns[i] <> nil);
    sPar := sPar + ';' + AParentColumns[i].Name;
  end;
  ASSERT(AChildColumns[Low(AChildColumns)] <> nil);
  sChild := AChildColumns[Low(AChildColumns)].Name;
  for i := Low(AChildColumns) + 1 to High(AChildColumns) do begin
    ASSERT(AChildColumns[i] <> nil);
    sChild := sChild + ';' + AChildColumns[i].Name;
  end;
  Create(ARelName, sPar, sChild,
    AParentColumns[Low(AParentColumns)].Table,
    AChildColumns[Low(AChildColumns)].Table,
    ANested, ACreateConstraints);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSRelation.Create(const ARelName: String; const AParentColumnNames,
  AChildColumnNames: String; AParentTable, AChildTable: TFDDatSTable;
  ANested: Boolean = False;
  ACreateConstraints: Boolean = True);
begin
  Create;
  if ARelName <> '' then
    Name := ARelName;
  ParentTable := AParentTable;
  ParentColumnNames := AParentColumnNames;
  ChildTable := AChildTable;
  ChildColumnNames := AChildColumnNames;
  Nested := ANested;
  if ACreateConstraints then begin
    FOwnConstraints := True;
    FParentKeyConstraint := BuildParentKeyConstraint;
    FChildKeyConstraint := BuildChildKeyConstraint;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.BuildChildKeyConstraint: TFDDatSForeignKeyConstraint;
begin
  ASSERT((ChildColumnNames <> '') and (ParentColumnNames <> '') and
    (ParentTable <> nil) and (ChildTable <> nil));
  Result := ChildTable.Constraints.AddFK('', ParentTable, ParentColumnNames,
    ChildColumnNames);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.BuildParentKeyConstraint: TFDDatSUniqueConstraint;
begin
  ASSERT((ParentColumnNames <> '') and (ParentTable <> nil));
  Result := ParentTable.Constraints.AddUK('', ParentColumnNames, True);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSRelation.Create(const ARelName: String;
  APK: TFDDatSUniqueConstraint; AFK: TFDDatSForeignKeyConstraint);
begin
  Create;
  if ARelName <> '' then
    Name := ARelName;
  ParentKeyConstraint := APK;
  ChildKeyConstraint := AFK;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSRelation.Destroy;
begin
  FDFreeAndNil(FParentColumns);
  FParentTable := nil;
  if FOwnConstraints then
    FDFree(FParentKeyConstraint);
  FParentKeyConstraint := nil;
  FDFreeAndNil(FChildColumns);
  FChildTable := nil;
  if FOwnConstraints then
    FDFree(FChildKeyConstraint);
  FChildKeyConstraint := nil;
  FDFreeAndNil(FRefs);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.Assign(AObj: TFDDatSObject);
var
  srcManager: TFDDatSManager;
  destManager: TFDDatSManager;
begin
  inherited Assign(AObj);
  if AObj is TFDDatSRelation then begin
    ChildColumnNames := TFDDatSRelation(AObj).ChildColumnNames;
    ParentColumnNames := TFDDatSRelation(AObj).ParentColumnNames;
    Nested := TFDDatSRelation(AObj).Nested;
    srcManager := TFDDatSRelation(AObj).Manager;
    destManager := Manager;
    if srcManager = destManager then begin
      ChildTable := TFDDatSRelation(AObj).ChildTable;
      ChildKeyConstraint := TFDDatSRelation(AObj).ChildKeyConstraint;
      ParentTable := TFDDatSRelation(AObj).ParentTable;
      ParentKeyConstraint := TFDDatSRelation(AObj).ParentKeyConstraint;
    end
    else if destManager <> nil then begin
                                                             
      ChildTable := destManager.Tables.TableByName(TFDDatSRelation(AObj).ChildTable.Name);
      ChildKeyConstraint := ChildTable.Constraints.ConstraintByName(
        TFDDatSRelation(AObj).ChildKeyConstraint.Name) as TFDDatSForeignKeyConstraint;
      ParentTable := destManager.Tables.TableByName(TFDDatSRelation(AObj).ParentTable.Name);
      ParentKeyConstraint := ChildTable.Constraints.ConstraintByName(
        TFDDatSRelation(AObj).ParentKeyConstraint.Name) as TFDDatSUniqueConstraint;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.Check;
  procedure ErrorBadRelation;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_BadRelation, [Name]);
  end;
var
  i: Integer;
begin
  if Nested then begin
    if (FChildTable <> nil) and (FChildTable = FParentTable) then
      ErrorBadRelation;
    if (FChildColumns.Count > 1) or
       (FChildColumns.Count = 1) and (FChildColumns.ItemsI[0].DataType <> dtParentRowRef) then
      ErrorBadRelation;
    if (FParentColumns.Count > 1) or
       (FParentColumns.Count = 1) and not (FParentColumns.ItemsI[0].DataType in
        [dtRowSetRef, dtCursorRef, dtRowRef, dtArrayRef]) then
      ErrorBadRelation;
  end
  else begin
    for i := 0 to FChildColumns.Count - 1 do
      if FChildColumns.ItemsI[i].DataType = dtParentRowRef then
        ErrorBadRelation;
    for i := 0 to FParentColumns.Count - 1 do
      if FParentColumns.ItemsI[i].DataType in
         [dtRowSetRef, dtCursorRef, dtRowRef, dtArrayRef] then
        ErrorBadRelation;
    if (FChildTable <> nil) and (FParentTable <> nil) and
       (FChildColumns.Count > 0) and (FParentColumns.Count > 0) and
       (FChildTable = FParentTable) and FChildColumns.Matches(FParentColumns) then
      ErrorBadRelation;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.GetChildColumnCount: Integer;
begin
  Result := FChildColumns.Count;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.GetChildColumns(AIndex: Integer): TFDDatSColumn;
begin
  Result := FChildColumns.ItemsI[AIndex];
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.GetIsDefined: Boolean;
begin
  Result := (FParentTable <> nil) and (FChildTable <> nil) and
    (FParentColumnNames <> '') and (FParentColumns.Count > 0) and
    (FChildColumnNames <> '') and (FChildColumns.Count > 0);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.GetParentColumnCount: Integer;
begin
  Result := FParentColumns.Count;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.GetParentColumns(AIndex: Integer): TFDDatSColumn;
begin
  Result := FParentColumns.ItemsI[AIndex];
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.GetRelationList: TFDDatSRelationList;
begin
  Result := List as TFDDatSRelationList;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if (FChildColumns <> nil) and FChildColumns.HandleNotification(AParam) then
    ChildColumnNames := '';
  if (FParentColumns <> nil) and FParentColumns.HandleNotification(AParam) then
    ParentColumnNames := '';
  if AParam^.FKind = snObjectRemoved then
    if TFDDatSObject(AParam^.FParam2) = ParentTable then
      ParentTable := nil
    else if TFDDatSObject(AParam^.FParam2) = ParentKeyConstraint then
      ParentKeyConstraint := nil
    else if TFDDatSObject(AParam^.FParam2) = ChildTable then
      ChildTable := nil
    else if TFDDatSObject(AParam^.FParam2) = ChildKeyConstraint then
      ChildKeyConstraint := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.FillChildColumns(ATable: Boolean);
begin
  if FChildTable <> nil then begin
    FChildColumns.Fill(FChildTable, FChildColumnNames);
    try
      Check;
    except
      if ATable then
        ChildTable := nil
      else
        ChildColumnNames := '';
      raise;
    end;
  end
  else
    FChildColumns.Clear;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.SetChildColumnNames(const AValue: String);
begin
  if FChildColumnNames <> AValue then begin
    FChildColumnNames := AValue;
    FillChildColumns(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.SetChildTable(const AValue: TFDDatSTable);
begin
  if FChildTable <> AValue then begin
    FChildTable := AValue;
    FillChildColumns(True);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.SetChildKeyConstraint(const AValue:
  TFDDatSForeignKeyConstraint);
begin
  if FChildKeyConstraint <> AValue then begin
    FChildKeyConstraint := AValue;
    if FChildKeyConstraint <> nil then begin
      Nested := False;
      ChildTable := FChildKeyConstraint.Table;
      ChildColumnNames := FChildKeyConstraint.ColumnNames;
      if FChildKeyConstraint.RelatedTable <> nil then
        ParentTable := FChildKeyConstraint.RelatedTable
      else if (Manager <> nil) and (FChildKeyConstraint.RelatedTableName <> '') then
        ParentTable := Manager.Tables.TableByName(FChildKeyConstraint.RelatedTableName);
      ParentColumnNames := FChildKeyConstraint.RelatedColumnNames;
      Nested := False;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.SetNested(const AValue: Boolean);
begin
  if FNested <> AValue then begin
    FNested := AValue;
    try
      Check;
    except
      FNested := not FNested;
      raise;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.FillParentColumns(ATable: Boolean);
begin
  if FParentTable <> nil then begin
    FParentColumns.Fill(FParentTable, FParentColumnNames);
    try
      Check;
    except
      if ATable then
        ParentTable := nil
      else
        ParentColumnNames := '';
      raise;
    end;
  end
  else
    FParentColumns.Clear;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.SetParentColumnNames(const AValue: String);
begin
  if FParentColumnNames <> AValue then begin
    FParentColumnNames := AValue;
    FillParentColumns(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.SetParentTable(const AValue: TFDDatSTable);
begin
  if FParentTable <> AValue then begin
    FParentTable := AValue;
    FillParentColumns(True);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.SetParentKeyConstraint(const AValue: TFDDatSUniqueConstraint);
begin
  if FParentKeyConstraint <> AValue then begin
    FParentKeyConstraint := AValue;
    if FParentKeyConstraint <> nil then begin
      Nested := False;
      ParentTable := FParentKeyConstraint.Table;
      ParentColumnNames := FParentKeyConstraint.ColumnNames;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.ResolveReferences(const AName, AValue: String);
begin
  if SameText(AName, 'ChildTable') then
    ChildTable := Manager.Tables.TableByName(AValue)
  else if SameText(AName, 'ChildKeyConstraint') then begin
    if ChildTable <> nil then
      ChildKeyConstraint := TFDDatSForeignKeyConstraint(ChildTable.Constraints.ConstraintByName(AValue));
  end
  else if SameText(AName, 'ChildColumnNames') then
    ChildColumnNames := AValue
  else if SameText(AName, 'ParentTable') then
    ParentTable := Manager.Tables.TableByName(AValue)
  else if SameText(AName, 'ParentKeyConstraint') then begin
    if ParentTable <> nil then
      ParentKeyConstraint := TFDDatSUniqueConstraint(ParentTable.Constraints.ConstraintByName(AValue));
  end
  else if SameText(AName, 'ParentColumnNames') then
    ParentColumnNames := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalLoadFromStorage(AStorage);
  AStorage.DeferAction('ChildTable', AStorage.ReadString('ChildTable', ''), ResolveReferences);
  AStorage.DeferAction('ChildKeyConstraint', AStorage.ReadString('ChildKeyConstraint', ''), ResolveReferences);
  AStorage.DeferAction('ChildColumnNames', AStorage.ReadString('ChildColumnNames', ''), ResolveReferences);
  Nested := AStorage.ReadBoolean('Nested', False);
  AStorage.DeferAction('ParentTable', AStorage.ReadString('ParentTable', ''), ResolveReferences);
  AStorage.DeferAction('ParentKeyConstraint', AStorage.ReadString('ParentKeyConstraint', ''), ResolveReferences);
  AStorage.DeferAction('ParentColumnNames', AStorage.ReadString('ParentColumnNames', ''), ResolveReferences);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  if ChildTable <> nil then
    AStorage.WriteString('ChildTable', ChildTable.Name, '');
  if ChildKeyConstraint <> nil then
    AStorage.WriteString('ChildKeyConstraint', ChildKeyConstraint.Name, '');
  AStorage.WriteString('ChildColumnNames', ChildColumnNames, '');
  AStorage.WriteBoolean('Nested', Nested, False);
  if ParentTable <> nil then
    AStorage.WriteString('ParentTable', ParentTable.Name, '');
  if ParentKeyConstraint <> nil then
    AStorage.WriteString('ParentKeyConstraint', ParentKeyConstraint.Name, '');
  AStorage.WriteString('ParentColumnNames', ParentColumnNames, '');
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.CountRef(AInit: Integer = 1);
begin
  FRefs.CountRef(AInit);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.AddRef;
begin
  FRefs.AddRef;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelation.RemRef;
begin
  FRefs.RemRef;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelation.GetIsRefCounted: Boolean;
begin
  Result := FRefs.Refs >= 0;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSRelationList                                                         -}
{-------------------------------------------------------------------------------}
constructor TFDDatSRelationList.CreateForManager(AManager: TFDDatSManager);
begin
  ASSERT(AManager <> nil);
  inherited Create;
  FOwner := AManager;
  OwnObjects := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRelationList.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if AParam^.FReason = srDataChange then
    Exit;
  inherited HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.Add(AObj: TFDDatSRelation): Integer;
begin
  Result := AddObject(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.Add(AParentColumn, AChildColumn: TFDDatSColumn;
  ANested, ACreateConstraints: Boolean): TFDDatSRelation;
begin
  Result := TFDDatSRelation.Create('', AParentColumn, AChildColumn, ANested,
    ACreateConstraints);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.Add(const ARelName: String;
  AParentColumn, AChildColumn: TFDDatSColumn; ANested,
  ACreateConstraints: Boolean): TFDDatSRelation;
begin
  Result := TFDDatSRelation.Create(ARelName, AParentColumn, AChildColumn,
    ANested, ACreateConstraints);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.Add(const AParentColumns, AChildColumns: array of TFDDatSColumn;
  ANested, ACreateConstraints: Boolean): TFDDatSRelation;
begin
  Result := TFDDatSRelation.Create('', AParentColumns, AChildColumns, ANested,
    ACreateConstraints);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.Add(const ARelName: String;
  const AParentColumns, AChildColumns: array of TFDDatSColumn;
  ANested, ACreateConstraints: Boolean): TFDDatSRelation;
begin
  Result := TFDDatSRelation.Create(ARelName, AParentColumns, AChildColumns,
    ANested, ACreateConstraints);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.Add(const ARelName: String; const AParentColumnNames,
  AChildColumnNames: String; AParentTable, AChildTable: TFDDatSTable;
  ANested: Boolean = False;
  ACreateConstraints: Boolean = True): TFDDatSRelation;
begin
  Result := TFDDatSRelation.Create(ARelName, AParentColumnNames, AChildColumnNames,
    AParentTable, AChildTable, ANested, ACreateConstraints);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.Add(const ARelName: String;
  APK: TFDDatSUniqueConstraint;
  AFK: TFDDatSForeignKeyConstraint): TFDDatSRelation;
begin
  Result := TFDDatSRelation.Create(ARelName, APK, AFK);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.FindRelation(AParentTable, AChildTable:
  TFDDatSTable; AMBNested: Boolean): TFDDatSRelation;
var
  i: Integer;
  oRel: TFDDatSRelation;
begin
  Result := nil;
  for i := 0 to Count - 1 do begin
    oRel := ItemsI[i];
    if (oRel.ParentTable = AParentTable) and (oRel.ChildTable = AChildTable) and
       (not AMBNested or AMBNested and oRel.Nested) then begin
      if oRel.IsDefined then begin
        Result := ItemsI[i];
        Break;
      end
      else if Result = nil then
        Result := ItemsI[i];
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.FindRelation(AParentTable: TFDDatSTable;
  AObjColumn: TFDDatSColumn): TFDDatSRelation;
var
  i: Integer;
  oRel: TFDDatSRelation;
begin
  Result := nil;
  for i := 0 to Count - 1 do begin
    oRel := ItemsI[i];
    if (oRel.ParentTable = AParentTable) and (oRel.ParentColumnCount = 1) and
       (oRel.ChildColumnCount = 1) and (oRel.ParentColumns[0] = AObjColumn) and oRel.Nested then begin
      if oRel.IsDefined then begin
        Result := ItemsI[i];
        Break;
      end
      else if Result = nil then
        Result := ItemsI[i];
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.FindRelation(ANestedTable: TFDDatSTable): TFDDatSRelation;
var
  i: Integer;
  oRel: TFDDatSRelation;
begin
  Result := nil;
  for i := 0 to Count - 1 do begin
    oRel := ItemsI[i];
    if (oRel.ChildTable = ANestedTable) and (oRel.ParentColumnCount = 1) and
       (oRel.ChildColumnCount = 1) and oRel.Nested then begin
      if oRel.IsDefined then begin
        Result := ItemsI[i];
        Break;
      end
      else if Result = nil then
        Result := ItemsI[i];
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.GetItemsI(AIndex: Integer): TFDDatSRelation;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSRelation(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.RelationByName(const AName: String):
  TFDDatSRelation;
begin
  Result := TFDDatSRelation(inherited ItemByName(AName));
end;

{-------------------------------------------------------------------------------}
function TFDDatSRelationList.GetRelationsForTable(AParentRelations: Boolean;
  ATable: TFDDatSTable): TFDDatSRelationArray;
var
  iCount, i: Integer;
begin
  SetLength(Result, 32);
  iCount := 0;
  for i := 0 to Count - 1 do
    if AParentRelations and (ItemsI[i].ChildTable = ATable) or
       not AParentRelations and (ItemsI[i].ParentTable = ATable) then begin
      if Length(Result) = iCount then
        SetLength(Result, Length(Result) + 32);
      Result[iCount] := ItemsI[i];
      Inc(iCount);
    end;
  SetLength(Result, iCount);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechBase                                                             -}
{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.Assign(AObj: TFDDatSObject);
begin
  if AObj is TFDDatSMechBase then
    Active := TFDDatSMechBase(AObj).Active;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechBase.GetRowsRange(var ARowList: TFDDatSRowListBase;
  out ABeginInd, AEndInd: Integer): Boolean;
begin
  Result := False;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechBase.AcceptRow(ARow: TFDDatSRow; AVersion:
  TFDDatSRowVersion): Boolean;
begin
  Result := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.PostProcess(AList: TFDDatSRowListBase);
begin
  // none
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechBase.GetActualActive: Boolean;
begin
  Result := Active and (View <> nil) and View.ActualActive;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.CheckActiveChanged;
begin
  if FPrevActualActive <> ActualActive then begin
    DoActiveChanged;
    FPrevActualActive := ActualActive;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.DoActiveChanged;
begin
  if not Locator then
    Notify(snMechanismStateChanged, srMetaChange, NativeInt(Self), 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.SetActive(const AValue: Boolean);
begin
  if FActive <> AValue then begin
    FActive := AValue;
    CheckActiveChanged;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.DoListInserted;
begin
  CheckActiveChanged;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.DoListRemoving;
begin
  Active := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.DoListRemoved(ANewOwner: TFDDatSObject);
begin
  CheckActiveChanged;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechBase.GetTable: TFDDatSTable;
var
  oView: TFDDatSView;
begin
  oView := View;
  if oView <> nil then
    Result := oView.Table
  else
    Result := nil;
  ASSERT((Result = nil) or (Result is TFDDatSTable));
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechBase.GetView: TFDDatSView;
begin
  if Owner <> nil then
    Result := TFDDatSView(Owner.Owner)
  else
    Result := nil;
  ASSERT((Result = nil) or (Result is TFDDatSView));
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechBase.GetViewList: TFDDatSViewList;
var
  oView: TFDDatSView;
begin
  oView := View;
  if oView <> nil then
    Result := oView.ViewList
  else
    Result := nil;
  ASSERT((Result = nil) or (Result is TFDDatSViewList));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.ResolveActive(const AName, AValue: String);
begin
  if SameText(AName, 'Active') and SameText(AValue, S_FD_True) then
    Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  lActive: Boolean;
begin
  Active := False;
  lActive := AStorage.ReadBoolean('Active', False);
  if lActive then
    AStorage.DeferAction('Active', S_FD_True, ResolveActive);
  Active := AStorage.ReadBoolean('Active', False);
  Locator := AStorage.ReadBoolean('Locator', False);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechBase.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  AStorage.WriteBoolean('Active', Active, False);
  AStorage.WriteBoolean('Locator', Locator, False);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSViewMechList                                                         -}
{-------------------------------------------------------------------------------}
constructor TFDDatSViewMechList.CreateForView(AView: TFDDatSView);
begin
  ASSERT(AView <> nil);
  inherited Create;
  FOwner := AView;
  OwnObjects := True;
  FDefaultReason := srMetaChange;
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.AcceptRow(ARow: TFDDatSRow; AVersion:
  TFDDatSRowVersion): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to Count - 1 do
    if not ItemsI[i].AcceptRow(ARow, AVersion) then begin
      Result := False;
      Exit;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.Add(AObj: TFDDatSMechBase): Integer;
begin
  Result := AddObject(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.AddFilter(const AExpression: String;
  AOptions: TFDExpressionOptions; AEvent: TFDFilterRowEvent): TFDDatSMechFilter;
begin
  Result := TFDDatSMechFilter.Create(AExpression, AOptions, AEvent);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.AddSort(const AColumns, ADescColumns,
  ACaseInsColumns: String; AOptions: TFDSortOptions): TFDDatSMechSort;
begin
  Result := TFDDatSMechSort.Create(AColumns, ADescColumns,
    ACaseInsColumns, AOptions);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.AddSort(const AExpression: String;
  AOptions: TFDSortOptions): TFDDatSMechSort;
begin
  Result := TFDDatSMechSort.Create(AExpression, AOptions);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.AddDistinct(AColumnCount: Integer): TFDDatSMechDistinct;
begin
  Result := TFDDatSMechDistinct.Create(AColumnCount);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.AddStates(
  AStates: TFDDatSRowStates): TFDDatSMechRowState;
begin
  Result := TFDDatSMechRowState.Create(AStates);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.AddError: TFDDatSMechError;
begin
  Result := TFDDatSMechError.CreateErr;
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.AddDetail(AParentRel: TFDDatSRelation;
  AParentRow: TFDDatSRow): TFDDatSMechDetails;
begin
  Result := TFDDatSMechDetails.Create(AParentRel, AParentRow);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSViewMechList.Clear;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].Active := False;
  inherited Clear;
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewMechList.GetItemsI(AIndex: Integer): TFDDatSMechBase;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSMechBase(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSViewMechList.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if AParam^.FReason = srDataChange then
    Exit;
  inherited HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechSort                                                             -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechSort.Create;
begin
  inherited Create;
  FKinds := [mkSort];
  FColumnList := TFDDatSColumnSublist.Create;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSMechSort.Create(const AColumns, ADescColumns,
  ACaseInsColumns: String; AOptions: TFDSortOptions);
begin
  Create;
  Columns := AColumns;
  DescendingColumns := ADescColumns;
  CaseInsensitiveColumns := ACaseInsColumns;
  SortOptions := AOptions;
  Active := True;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSMechSort.Create(const AExpression: String;
  AOptions: TFDSortOptions);
begin
  Create;
  Expression := AExpression;
  SortOptions := AOptions;
  Active := True;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSMechSort.Destroy;
begin
  FDFreeAndNil(FColumnList);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.Assign(AObj: TFDDatSObject);
begin
  if AObj is TFDDatSMechSort then begin
    Columns := TFDDatSMechSort(AObj).Columns;
    DescendingColumns := TFDDatSMechSort(AObj).DescendingColumns;
    CaseInsensitiveColumns := TFDDatSMechSort(AObj).CaseInsensitiveColumns;
    SortOptions := TFDDatSMechSort(AObj).SortOptions;
    Expression := TFDDatSMechSort(AObj).Expression;
  end;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := (Columns = TFDDatSMechSort(AObj).Columns) and
      (DescendingColumns = TFDDatSMechSort(AObj).DescendingColumns) and
      (CaseInsensitiveColumns = TFDDatSMechSort(AObj).CaseInsensitiveColumns) and
      (SortOptions = TFDDatSMechSort(AObj).SortOptions) and
      (Expression = TFDDatSMechSort(AObj).Expression);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort._AddRef: Integer;
begin
  Result := 1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort._Release: Integer;
begin
  Result := 1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.CreateUniqueConstraint: TFDDatSUniqueConstraint;
begin
  Result := TFDDatSUniqueConstraint.Create;
  Result.Rely := True;
  Result.Name := Table.Constraints.BuildUniqueName(C_FD_SysNamePrefix + 'UC_' + View.Name);
  Result.ColumnNames := Columns;
  Result.Options := SortOptions;
  Table.Constraints.Add(Result);
  Result.Enforce := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.DoActiveChanged;
var
  oParser: IFDStanExpressionParser;
begin
  if ActualActive then begin
    FUniqueKey := nil;
    if FExpression <> '' then
      FSortSource := ssExpression
    else if (FColumns <> '') and (FColumns <> '#') then
      FSortSource := ssColumns
    else
      FSortSource := ssRowId;
    if not FSortOptionsChanged then
      if not Table.CaseSensitive then
        FSortOptions := FSortOptions + [soNoCase];
    case FSortSource of
    ssColumns:
      begin
        FCaseInsensitiveColumnList := TFDDatSColumnSublist.Create;
        FDescendingColumnList := TFDDatSColumnSublist.Create;
        try
          if FCaseInsensitiveColumns <> '' then
            FCaseInsensitiveColumnList.Fill(Self, FCaseInsensitiveColumns);
          if FDescendingColumns <> '' then
            FDescendingColumnList.Fill(Self, FDescendingColumns);
          FColumnList.Fill(Self, FColumns, FCaseInsensitiveColumnList,
            FDescendingColumnList);
        finally
          if FCaseInsensitiveColumnList.Count = 0 then
            FDFreeAndNil(FCaseInsensitiveColumnList);
          if FDescendingColumnList.Count = 0 then
            FDFreeAndNil(FDescendingColumnList);
        end;
        if [soUnique, soPrimary] * SortOptions <> [] then
          if Table.Constraints.FindUnique(FColumns) = nil then
            FUniqueKey := CreateUniqueConstraint;
      end;
    ssExpression:
      begin
        FDCreateInterface(IFDStanExpressionParser, oParser);
        FEvaluator := oParser.Prepare(TFDDatSTableExpressionDS.Create(Table),
          Expression, [], [poDefaultExpr], '');
      end;
    end;
  end
  else begin
    if FColumnList <> nil then
      FColumnList.Clear;
    FDFreeAndNil(FCaseInsensitiveColumnList);
    FDFreeAndNil(FDescendingColumnList);
    FEvaluator := nil;
    FDFreeAndNil(FUniqueKey);
  end;
  inherited DoActiveChanged;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.Search(ARowList: TFDDatSRowListBase;
  AKeyRow: TFDDatSRow; AKeyColumnList, AKeyColumnList2: TFDDatSColumnSublist;
  AKeyColumnCount: Integer; AOptions: TFDLocateOptions; out AIndex: Integer;
  out AFound: Boolean; ARowVersion: TFDDatSRowVersion): Integer;
var
  iMid: Integer;
  iFirstNo, iLastNo: Integer;
  oRow: TFDDatSRow;
  eOpts: TFDCompareDataOptions;
  oKeyColumns: TFDDatSColumnSublist;
  oCache: TFDDatSCompareRowsCache;
  lOnKeyRow, lUseRowId: Boolean;

  function CompareRows(ARow1, ARow2: TFDDatSRow): Integer;
  begin
    case FSortSource of
    ssColumns:
      Result := ARow1.CompareRows(oKeyColumns, FDescendingColumnList,
        FCaseInsensitiveColumnList, AKeyColumnCount, ARow2, AKeyColumnList2,
        ARowVersion, eOpts, oCache);
    ssExpression:
      Result := ARow1.CompareRowsExp(FEvaluator, ARow2, ARowVersion, eOpts);
    else
      Result := 0;
    end;
    if lUseRowId and (Result = 0) then
      if ARow1.FRowID < ARow2.FRowID then
        Result := -1
      else if ARow1.FRowID > ARow2.FRowID then
        Result := 1
      else
        Result := 0;
  end;

begin
  ASSERT((ARowList <> nil) and (AKeyRow <> nil));
  Result := 0;
  AIndex := -1;
  AFound := False;
  iFirstNo := 0;
  iLastNo := ARowList.Count - 1;
  eOpts := [coCache];
  iMid := -1;
  lOnKeyRow := False;
  lUseRowId := (loUseRowID in AOptions) and ([soUnique, soPrimary] * FSortOptions = []) or
    (FSortSource = ssRowID);
  if AKeyColumnList = nil then
    oKeyColumns := FColumnList
  else
    oKeyColumns := AKeyColumnList;
  if loNoCase in AOptions then
    Include(eOpts, coNoCase);
  if soNullFirst in SortOptions then
    Include(eOpts, coNullFirst);
  if soDescNullLast in SortOptions then
    Include(eOpts, coDescNullLast);
  if soDescending in SortOptions then
    Include(eOpts, coDescending);
  if soNoSymbols in SortOptions then
    Include(eOpts, coNoSymbols);
  if loPartial in AOptions then
    Include(eOpts, coPartial);
  while iFirstNo <= iLastNo do begin
    iMid := (iFirstNo + iLastNo) div 2;
    oRow := ARowList.ItemsI[iMid];
    if (loExcludeKeyRow in AOptions) and (oRow = AKeyRow) then begin
      if iMid < iLastNo then begin
        Inc(iMid);
        oRow := ARowList.ItemsI[iMid];
      end
      else if iMid > iFirstNo then begin
        Dec(iMid);
        oRow := ARowList.ItemsI[iMid];
      end
      else begin
        lOnKeyRow := True;
        Result := -1;
        Dec(iMid);
        Break;
      end;
    end;
    if oRow <> nil then
      Result := CompareRows(oRow, AKeyRow);
    if Result > 0 then
      iLastNo := iMid - 1
    else if Result < 0 then
      iFirstNo := iMid + 1
    else begin
      if (loLast in AOptions) xor (loBackward in AOptions) then
        while iMid < ARowList.Count - 1 do begin
          Inc(iMid);
          oRow := ARowList.ItemsI[iMid];
          Result := CompareRows(oRow, AKeyRow);
          if Result <> 0 then begin
            Dec(iMid);
            Break;
          end;
        end
      else
        while iMid > 0 do begin
          Dec(iMid);
          oRow := ARowList.ItemsI[iMid];
          Result := CompareRows(oRow, AKeyRow);
          if Result <> 0 then begin
            Inc(iMid);
            Break;
          end;
        end;
      Result := 0;
      AFound := True;
      Break;
    end;
  end;
  if iFirstNo >= ARowList.Count then
    AIndex := ARowList.Count
  else if iLastNo < 0 then
    AIndex := -1
  else if iMid < 0 then
    AIndex := iFirstNo
  else if iMid >= ARowList.Count then
    AIndex := iLastNo
  else if ARowList.Count <> 0 then begin
    AIndex := iMid;
    if (lOnKeyRow or (Result = -1)) and ([loLast, loNearest] * AOptions <> []) then begin
      if Result = -1 then
        Inc(AIndex)
      else if Result = 1 then
        Dec(AIndex);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if (FColumnList <> nil) and
       FColumnList.HandleNotification(AParam) or
     (FDescendingColumnList <> nil) and
       FDescendingColumnList.HandleNotification(AParam) or
     (FCaseInsensitiveColumnList <> nil) and
       FCaseInsensitiveColumnList.HandleNotification(AParam) or
     (FEvaluator <> nil) and
       FEvaluator.HandleNotification(Word(AParam^.FKind), Word(AParam^.FReason),
                                     AParam^.FParam1, AParam^.FParam2) then
    Active := False
  else if AParam^.FKind = snObjectRemoved then
    if AParam^.FParam2 = NativeInt(FUniqueKey) then
      FUniqueKey := nil
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.SetCaseInsensitiveColumns(const AValue: String);
begin
  if FCaseInsensitiveColumns <> AValue then begin
    FCaseInsensitiveColumns := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.SetColumns(const AValue: String);
begin
  if FColumns <> AValue then begin
    FColumns := AValue;
    FExpression := '';
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.SetExpression(const AValue: String);
begin
  if FExpression <> AValue then begin
    FExpression := AValue;
    FColumns := '';
    FCaseInsensitiveColumns := '';
    FDescendingColumns := '';
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.SetDescendingColumns(const AValue: String);
begin
  if FDescendingColumns <> AValue then begin
    FDescendingColumns := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.GetSortOptions: TFDSortOptions;
begin
  Result := FSortOptions;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.SetSortOptions(const AValue: TFDSortOptions);
begin
  if FSortOptions <> AValue then begin
    FSortOptions := AValue;
    FSortOptionsChanged := True;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.CompareRows(ARow1, ARow2: TFDDatSRow;
  AColumnCount: Integer; AOptions: TFDCompareDataOptions): Integer;
begin
  case FSortSource of
  ssColumns:
    Result := ARow1.CompareRows(FColumnList, FDescendingColumnList,
      FCaseInsensitiveColumnList, AColumnCount, ARow2, nil, rvDefault,
      AOptions, FDEmptyCC);
  ssExpression:
    Result := ARow1.CompareRowsExp(FEvaluator, ARow2, rvDefault, AOptions);
  else
    Result := 0;
  end;
  // take into account original sort order
  if (FSortSource = ssRowId) or ((Result = 0) and
     (AColumnCount < 0) and ([soUnique, soPrimary] * FSortOptions = [])) then
    if ARow1.FRowID < ARow2.FRowID then
      Result := -1
    else if ARow1.FRowID > ARow2.FRowID then
      Result := 1
    else
      Result := 0;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.GetCompareDataOptions: TFDCompareDataOptions;
begin
  Result := [];
  if soNoCase in SortOptions then
    Include(Result, coNoCase);
  if soNullFirst in SortOptions then
    Include(Result, coNullFirst);
  if soDescNullLast in SortOptions then
    Include(Result, coDescNullLast);
  if soDescending in SortOptions then
    Include(Result, coDescending);
  if soNoSymbols in SortOptions then
    Include(Result, coNoSymbols);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.CompareRows(ARow1, ARow2: TFDDatSRow;
  AColumnCount: Integer): Integer;
begin
  Result := CompareRows(ARow1, ARow2, AColumnCount, GetCompareDataOptions);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.Sort(AList: TFDDatSRowListBase);
var
  eOpts: TFDCompareDataOptions;
begin
  eOpts := GetCompareDataOptions;
  AList.Sort(CompareRows, eOpts);
  if ([soUnique, soPrimary] * SortOptions <> []) and (GetSortSource <> ssRowId) then
    AList.CheckDuplicates(CompareRows, eOpts);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.RemoveDuplicates(AList: TFDDatSRowListBase; AColumnCount: Integer);
begin
  AList.RemoveDuplicates(CompareRows, AColumnCount, GetCompareDataOptions);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.MatchOptions(ARequiredOptions, AProhibitedOptions: TFDSortOptions): Boolean;

  function NormOpts(AOpts: TFDSortOptions): TFDSortOptions;
  begin
    if [soUnique, soPrimary] * AOpts <> [] then
      Result := AOpts + [soUnique, soPrimary]
    else
      Result := AOpts;
  end;

var
  eSortOpts, eReqOpts, eProhOpts: TFDSortOptions;
begin
  eSortOpts := NormOpts(SortOptions);
  eReqOpts := NormOpts(ARequiredOptions);
  eProhOpts := NormOpts(AProhibitedOptions);
  Result := (eSortOpts * eReqOpts = eReqOpts) and (eSortOpts * eProhOpts = []);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.SortingOn(const AColumnNames: String;
  ARequiredOptions, AProhibitedOptions: TFDSortOptions): Boolean;
var
  oCols, oDescs, oNoCases: TFDDatSColumnSublist;
begin
  if SortSource = ssColumns then begin
    oCols := TFDDatSColumnSublist.Create;
    oDescs := TFDDatSColumnSublist.Create;
    oNoCases := TFDDatSColumnSublist.Create;
    try
      oCols.Fill(Self, AColumnNames, oNoCases, oDescs);
      Result := SortColumnList.Matches(oCols, oCols.Count) and
        ((SortDescendingColumnList = nil) and (oDescs.Count = 0) or
         (SortDescendingColumnList <> nil) and SortDescendingColumnList.Matches(oDescs, -2)) and
        ((SortCaseInsensitiveColumnList = nil) and (oNoCases.Count = 0) or
         (SortCaseInsensitiveColumnList <> nil) and SortCaseInsensitiveColumnList.Matches(oNoCases, -2));
    finally
      FDFree(oCols);
      FDFree(oDescs);
      FDFree(oNoCases);
    end;
  end
  else
    Result := (SortSource = ssRowId) and (AColumnNames = '#');
  Result := Result and MatchOptions(ARequiredOptions, AProhibitedOptions);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.SortingOn(AKeyColumnList: TFDDatSColumnSublist;
  AKeyColumnCount: Integer; ARequiredOptions, AProhibitedOptions: TFDSortOptions): Boolean;
begin
  Result := (SortSource = ssColumns) and
    SortColumnList.Matches(AKeyColumnList, AKeyColumnCount) and
    MatchOptions(ARequiredOptions, AProhibitedOptions);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.GetSortCaseInsensitiveColumnList: TFDDatSColumnSublist;
begin
  Result := FCaseInsensitiveColumnList;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.GetSortColumnList: TFDDatSColumnSublist;
begin
  Result := FColumnList;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.GetSortDescendingColumnList: TFDDatSColumnSublist;
begin
  Result := FDescendingColumnList;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.GetSortSource: TFDDatSMechSortSource;
begin
  Result := FSortSource;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechSort.GetSortedRows: TFDDatSRowListBase;
begin
  Result := View.Rows;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  eOpt: TFDSortOption;
  eOpts: TFDSortOptions;
begin
  inherited InternalLoadFromStorage(AStorage);
  Expression := AStorage.ReadString('Expression', '');
  Columns := AStorage.ReadString('Columns', '');
  DescendingColumns := AStorage.ReadString('DescendingColumns', '');
  CaseInsensitiveColumns := AStorage.ReadString('CaseInsensitiveColumns', '');
  eOpts := [];
  for eOpt := Low(TFDSortOption) to High(TFDSortOption) do
    if AStorage.ReadBoolean(Copy(GetEnumName(TypeInfo(TFDSortOption),
                            Integer(eOpt)), 3, MAXINT), False) then
      Include(eOpts, eOpt);
  SortOptions := eOpts;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechSort.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  eOpt: TFDSortOption;
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteString('Expression', Expression, '');
  AStorage.WriteString('Columns', Columns, '');
  AStorage.WriteString('DescendingColumns', DescendingColumns, '');
  AStorage.WriteString('CaseInsensitiveColumns', CaseInsensitiveColumns, '');
  for eOpt := Low(TFDSortOption) to High(TFDSortOption) do
    if eOpt in SortOptions then
      AStorage.WriteBoolean(Copy(GetEnumName(TypeInfo(TFDSortOption),
        Integer(eOpt)), 3, MAXINT), True, False);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechRowState                                                         -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechRowState.Create;
begin
  inherited Create;
  FKinds := [mkFilter];
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSMechRowState.Create(AStates: TFDDatSRowStates);
begin
  Create;
  RowStates := AStates;
  Active := True;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechRowState.AcceptRow(ARow: TFDDatSRow; AVersion:
  TFDDatSRowVersion): Boolean;
begin
  ASSERT(ARow <> nil);
  Result := ARow.RowState in RowStates;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRowState.Assign(AObj: TFDDatSObject);
begin
  if AObj is TFDDatSMechRowState then
    RowStates := TFDDatSMechRowState(AObj).RowStates;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechRowState.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := RowStates = TFDDatSMechRowState(AObj).RowStates;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRowState.SetRowStates(const AValue: TFDDatSRowStates);
begin
  if FRowStates <> AValue then begin
    FRowStates := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRowState.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  eState: TFDDatSRowState;
  eStates: TFDDatSRowStates;
begin
  inherited InternalLoadFromStorage(AStorage);
  eStates := [];
  for eState := Low(TFDDatSRowState) to High(TFDDatSRowState) do
    if AStorage.ReadBoolean(Copy(GetEnumName(TypeInfo(TFDDatSRowState),
                            Integer(eState)), 3, MAXINT), False) then
      Include(eStates, eState);
  RowStates := eStates;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRowState.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  eState: TFDDatSRowState;
begin
  inherited InternalSaveToStorage(AStorage);
  for eState := Low(TFDDatSRowState) to High(TFDDatSRowState) do
    if eState in RowStates then
      AStorage.WriteBoolean(Copy(GetEnumName(TypeInfo(TFDDatSRowState),
        Integer(eState)), 3, MAXINT), True, False);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechRange                                                            -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechRange.Create;
begin
  inherited Create;
  FKinds := [mkFilter];
  BottomColumnCount := -1;
  BottomExclusive := False;
  TopColumnCount := -1;
  TopExclusive := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.Assign(AObj: TFDDatSObject);
begin
  if AObj is TFDDatSMechRange then begin
    SortMech := TFDDatSMechRange(AObj).SortMech;
    BottomExclusive := TFDDatSMechRange(AObj).BottomExclusive;
    TopExclusive := TFDDatSMechRange(AObj).TopExclusive;
    BottomColumnCount := TFDDatSMechRange(AObj).BottomColumnCount;
    TopColumnCount := TFDDatSMechRange(AObj).TopColumnCount;
    if (TFDDatSMechRange(AObj).Top <> nil) and
       (TFDDatSMechRange(AObj).Top.Table <> Table) then
      Top := TFDDatSMechRange(AObj).Top
    else
      Top := nil;
    if (TFDDatSMechRange(AObj).Bottom <> nil) and
       (TFDDatSMechRange(AObj).Bottom.Table <> Table) then
      Bottom := TFDDatSMechRange(AObj).Bottom
    else
      Bottom := nil;
  end;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechRange.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result :=
      (SortMech = TFDDatSMechRange(AObj).SortMech) and
      (BottomExclusive = TFDDatSMechRange(AObj).BottomExclusive) and
      (TopExclusive = TFDDatSMechRange(AObj).TopExclusive) and
      (BottomColumnCount = TFDDatSMechRange(AObj).BottomColumnCount) and
      (TopColumnCount = TFDDatSMechRange(AObj).TopColumnCount);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.DoActiveChanged;
var
  oView: TFDDatSView;
begin
  if ActualActive then
    if SortMech = nil then begin
      oView := View;
      if oView <> nil then
        FSortMech := oView.SortingMechanism;
    end;
  inherited DoActiveChanged;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechRange.NoRangeNoRecords: Boolean;
begin
  Result := False;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechRange.GetRowsRange(var ARowList: TFDDatSRowListBase;
  out ABeginInd, AEndInd: Integer): Boolean;
var
  eOpts: TFDLocateOptions;
  iRes: Integer;
  lTemp: Boolean;
begin
  if (SortMech <> nil) and ((Top <> nil) or (Bottom <> nil)) then begin
    eOpts := [loNearest];
    if soNoCase in SortMech.SortOptions then
      Include(eOpts, loNoCase);
    if Bottom <> nil then begin
      lTemp := False;
      iRes := SortMech.Search(ARowList, Bottom, nil, FBottomColumnList,
        FBottomColumnCount, eOpts, ABeginInd, lTemp);
      if iRes > 0 then
        Dec(ABeginInd);
    end;
    if Top <> nil then
      SortMech.Search(ARowList, Top, nil, FTopColumnList,
        FTopColumnCount, eOpts + [loLast], AEndInd, lTemp);
    Result := True;
  end
  else begin
    if NoRangeNoRecords then begin
      Result := True;
      ABeginInd := 0;
      AEndInd := -1;
    end
    else
      Result := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechRange.AcceptRow(ARow: TFDDatSRow; AVersion:
  TFDDatSRowVersion): Boolean;
var
  eOpts: TFDCompareDataOptions;
  iRes: Integer;
begin
  Result := not NoRangeNoRecords;
  if SortMech <> nil then begin
    eOpts := [];
    if soNoCase in SortMech.SortOptions then
      Include(eOpts, coNoCase);
    if soNullFirst in SortMech.SortOptions then
      Include(eOpts, coNullFirst);
    if soDescNullLast in SortMech.SortOptions then
      Include(eOpts, coDescNullLast);
    if soDescending in SortMech.SortOptions then
      Include(eOpts, coDescending);
    if soNoSymbols in SortMech.SortOptions then
      Include(eOpts, coNoSymbols);
    if Bottom <> nil then begin
      iRes := ARow.CompareRows(SortMech.SortColumnList, SortMech.SortDescendingColumnList,
        SortMech.SortCaseInsensitiveColumnList, FBottomColumnCount, Bottom, FBottomColumnList,
        rvDefault, eOpts, FDEmptyCC);
      Result := (iRes > 0) or (iRes = 0) and not BottomExclusive;
    end;
    if Result and (Top <> nil) then begin
      iRes := ARow.CompareRows(SortMech.SortColumnList, SortMech.SortDescendingColumnList,
        SortMech.SortCaseInsensitiveColumnList, FTopColumnCount, Top, FTopColumnList,
        rvDefault, eOpts, FDEmptyCC);
      Result := (iRes < 0) or (iRes = 0) and not TopExclusive;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.SetBottom(const AValue: TFDDatSRow);
begin
  if FBottom <> AValue then begin
    FBottom := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.SetTop(const AValue: TFDDatSRow);
begin
  if FTop <> AValue then begin
    FTop := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.SetBottomExclusive(const AValue: Boolean);
begin
  if FBottomExclusive <> AValue then begin
    FBottomExclusive := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.SetTopExclusive(const AValue: Boolean);
begin
  if FTopExclusive <> AValue then begin
    FTopExclusive := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.SetSortMech(const AValue: IFDDatSMechSort);
begin
  FSortMech := AValue;
  Active := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.SetBottomColumnCount(const AValue: Integer);
begin
  if FBottomColumnCount <> AValue then begin
    FBottomColumnCount := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.SetTopColumnCount(const AValue: Integer);
begin
  if FTopColumnCount <> AValue then begin
    FTopColumnCount := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalLoadFromStorage(AStorage);
  BottomExclusive := AStorage.ReadBoolean('BottomExclusive', False);
  TopExclusive := AStorage.ReadBoolean('TopExclusive', False);
  BottomColumnCount := AStorage.ReadInteger('BottomColumnCount', -1);
  TopColumnCount := AStorage.ReadInteger('TopColumnCount', -1);
                                        
{
    property Bottom: TFDDatSRow read FBottom write SetBottom;
    property Top: TFDDatSRow read FTop write SetTop;
    property SortMech: IFDDatSMechSort read FSortMech write SetSortMech;
}
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechRange.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteBoolean('BottomExclusive', BottomExclusive, False);
  AStorage.WriteBoolean('TopExclusive', TopExclusive, False);
  AStorage.WriteInteger('BottomColumnCount', BottomColumnCount, -1);
  AStorage.WriteInteger('TopColumnCount', TopColumnCount, -1);
                                         
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechDistinct                                                         -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechDistinct.Create;
begin
  inherited Create;
  FKinds := [mkFilter, mkPost];
  FColumnCount := -1;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSMechDistinct.Create(AColumnCount: Integer);
begin
  Create;
  ColumnCount := AColumnCount;
  Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDistinct.Assign(AObj: TFDDatSObject);
begin
  if AObj is TFDDatSMechDistinct then begin
    SortMech := TFDDatSMechDistinct(AObj).SortMech;
    ColumnCount := TFDDatSMechDistinct(AObj).ColumnCount;
  end;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechDistinct.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result :=
      (SortMech = TFDDatSMechDistinct(AObj).SortMech) and
      (ColumnCount = TFDDatSMechDistinct(AObj).ColumnCount);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDistinct.DoActiveChanged;
var
  oView: TFDDatSView;
begin
  if ActualActive then begin
    if SortMech = nil then begin
      oView := View;
      if oView <> nil then
        FSortMech := oView.SortingMechanism;
    end;
    // ColumnCount must be <> -1, otherwise SortMech.CompareRows will
    // always return non-zero
    if (ColumnCount = -1) and (FSortMech <> nil) then
      FColumnCount := FSortMech.SortColumnList.Count;
  end;
  inherited DoActiveChanged;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechDistinct.AcceptRow(ARow: TFDDatSRow;
  AVersion: TFDDatSRowVersion): Boolean;
var
  eOpts: TFDLocateOptions;
  iPos: Integer;
begin
  if SortMech <> nil then begin
    eOpts := [];
    if soNoCase in SortMech.SortOptions then
      Include(eOpts, loNoCase);
    SortMech.Search(View.Rows, ARow, nil, nil, ColumnCount, eOpts, iPos, Result, AVersion);
    Result := not Result;
  end
  else
    Result := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDistinct.PostProcess(AList: TFDDatSRowListBase);
begin
  if SortMech <> nil then
    SortMech.RemoveDuplicates(AList, ColumnCount);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDistinct.SetColumnCount(const AValue: Integer);
begin
  if FColumnCount <> AValue then begin
    FColumnCount := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDistinct.SetSortMech(const AValue: IFDDatSMechSort);
begin
  FSortMech := AValue;
  Active := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDistinct.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalLoadFromStorage(AStorage);
  ColumnCount := AStorage.ReadInteger('ColumnCount', -1);
                                        
{
    property SortMech: IFDDatSMechSort read FSortMech write SetSortMech;
}
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDistinct.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteInteger('ColumnCount', ColumnCount, -1);
                                         
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechFilter                                                           -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechFilter.Create;
begin
  inherited Create;
  FKinds := [mkFilter];
  FOptions := [];
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSMechFilter.Create(const AExpression: String;
  AOptions: TFDExpressionOptions; AEvent: TFDFilterRowEvent);
begin
  Create;
  Options := AOptions;
  Expression := AExpression;
  OnFilterRow := AEvent;
  Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechFilter.Assign(AObj: TFDDatSObject);
begin
  if AObj is TFDDatSMechFilter then begin
    Options := TFDDatSMechFilter(AObj).Options;
    Expression := TFDDatSMechFilter(AObj).Expression;
    OnFilterRow := TFDDatSMechFilter(AObj).OnFilterRow;
  end;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechFilter.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := (Expression = TFDDatSMechFilter(AObj).Expression) and
      (Options = TFDDatSMechFilter(AObj).Options) and
      (TMethod(OnFilterRow).Code <> TMethod(OnFilterRow).Code) and
      (TMethod(OnFilterRow).Data <> TMethod(OnFilterRow).Data);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechFilter.DoActiveChanged;
var
  oParser: IFDStanExpressionParser;
begin
  if ActualActive and (Expression <> '') then begin
    FDCreateInterface(IFDStanExpressionParser, oParser);
    FEvaluator := oParser.Prepare(TFDDatSTableExpressionDS.Create(Table),
      Expression, FOptions, [], '');
  end
  else
    FEvaluator := nil;
  inherited DoActiveChanged;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechFilter.AcceptRow(ARow: TFDDatSRow; AVersion:
  TFDDatSRowVersion): Boolean;
begin
  Result := True;
  if FEvaluator <> nil then begin
    FEvaluator.DataSource.Position := ARow;
    try
      Result := FEvaluator.Evaluate;
    finally
      FEvaluator.DataSource.Position := nil;
    end;
  end;
  if Result and Assigned(FOnFilterRow) then
    Result := FOnFilterRow(Self, ARow, AVersion);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechFilter.SetExpression(const AValue: String);
begin
  if FExpression <> AValue then begin
    FExpression := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechFilter.SetOptions(const AValue: TFDExpressionOptions);
begin
  if FOptions <> AValue then begin
    FOptions := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechFilter.SetOnFilterRow(const AValue: TFDFilterRowEvent);
begin
  if (TMethod(AValue).Code <> TMethod(FOnFilterRow).Code) or
     (TMethod(AValue).Data <> TMethod(FOnFilterRow).Data) then begin
    FOnFilterRow := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechFilter.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  eOpt: TFDExpressionOption;
  eOpts: TFDExpressionOptions;
begin
  inherited InternalLoadFromStorage(AStorage);
  Expression := AStorage.ReadString('Expression', '');
  eOpts := [];
  for eOpt := Low(TFDExpressionOption) to High(TFDExpressionOption) do
    if AStorage.ReadBoolean(Copy(GetEnumName(TypeInfo(TFDExpressionOption),
                            Integer(eOpt)), 3, MAXINT), False) then
      Include(eOpts, eOpt);
  Options := eOpts;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechFilter.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  eOpt: TFDExpressionOption;
begin
  inherited InternalLoadFromStorage(AStorage);
  AStorage.WriteString('Expression', Expression, '');
  for eOpt := Low(TFDExpressionOption) to High(TFDExpressionOption) do
    if eOpt in Options then
      AStorage.WriteBoolean(Copy(GetEnumName(TypeInfo(TFDExpressionOption),
        Integer(eOpt)), 3, MAXINT), True, False);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechError                                                            -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechError.Create;
begin
  inherited Create;
  FKinds := [mkFilter];
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSMechError.CreateErr(ADummy: Integer);
begin
  Create;
  Active := True;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechError.AcceptRow(ARow: TFDDatSRow; AVersion:
  TFDDatSRowVersion): Boolean;
begin
  Result := ARow.HasErrors;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechDetails                                                          -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechDetails.Create(
  AParentRel: TFDDatSRelation; AParentRow: TFDDatSRow);
begin
  Create;
  ParentRelation := AParentRel;
  ParentRow := AParentRow;
  Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDetails.Assign(AObj: TFDDatSObject);
var
  oManager: TFDDatSManager;
begin
  if AObj is TFDDatSMechDetails then begin
    oManager := Manager;
    if oManager = TFDDatSMechDetails(AObj).Manager then
      ParentRelation := TFDDatSMechDetails(AObj).ParentRelation
    else
      ParentRelation := oManager.Relations.RelationByName(
        TFDDatSMechDetails(AObj).ParentRelation.Name);
    if (TFDDatSMechDetails(AObj).ParentRow <> nil) and
       (TFDDatSMechDetails(AObj).ParentRow.Table <> Table) then
      ParentRow := TFDDatSMechDetails(AObj).ParentRow
    else
      ParentRow := nil;
  end;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechDetails.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := ParentRelation = TFDDatSMechDetails(AObj).ParentRelation;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechDetails.GetActualActive: Boolean;
begin
  Result := inherited GetActualActive and
    (ParentRelation <> nil);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechDetails.NoRangeNoRecords: Boolean;
begin
  Result := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDetails.DoActiveChanged;
var
  i: Integer;
begin
  if ActualActive then begin
    FBottom := ParentRow;
    FTop := ParentRow;
    FTopColumnList := ParentRelation.FParentColumns;
    FBottomColumnList := ParentRelation.FParentColumns;
    FSortMech := nil;
  end
  else begin
    FBottom := nil;
    FTop := nil;
    FTopColumnList := nil;
    FBottomColumnList := nil;
    FSortMech := nil;
  end;
  inherited DoActiveChanged;
  if ActualActive and (SortMech <> nil) then
    if SortMech.GetSortColumnList.Count <> ParentRelation.FChildColumns.Count then
      FSortMech := nil
    else
      for i := 0 to SortMech.GetSortColumnList.Count - 1 do
        if SortMech.GetSortColumnList.ItemsI[i] <> ParentRelation.FChildColumns.ItemsI[i] then begin
          FSortMech := nil;
          Break;
        end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDetails.SetParentRelation(const AValue: TFDDatSRelation);
begin
  if FParentRelation <> AValue then begin
    FParentRelation := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDetails.SetParentRow(const AValue: TFDDatSRow);
begin
  if FParentRow <> AValue then begin
    FParentRow := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDetails.ResolveReferences(const AName, AValue: String);
begin
  if SameText(AName, 'ParentRelation') then
    ParentRelation := Manager.Relations.RelationByName(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDetails.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalLoadFromStorage(AStorage);
  AStorage.DeferAction('ParentRelation',
    AStorage.ReadString('ParentRelation', ''), ResolveReferences);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechDetails.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  if ParentRelation <> nil then
    AStorage.WriteString('ParentRelation', ParentRelation.Name, '');
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechChilds                                                           -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechChilds.Create;
begin
  inherited Create;
  FKinds := [mkFilter, mkHasList];
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSMechChilds.Create(AParentRow: TFDDatSRow);
begin
  Create;
  ParentRow := AParentRow;
  Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechChilds.Assign(AObj: TFDDatSObject);
begin
  if AObj is TFDDatSMechChilds then
    if (TFDDatSMechChilds(AObj).ParentRow <> nil) and
       (TFDDatSMechChilds(AObj).ParentRow.Table <> Table) then
      ParentRow := TFDDatSMechChilds(AObj).ParentRow
    else
      ParentRow := nil;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechChilds.SetParentRow(const AValue: TFDDatSRow);
begin
  if FParentRow <> AValue then begin
    FParentRow := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechChilds.DoActiveChanged;
var
  oRel: TFDDatSRelation;
begin
  if ActualActive and (ParentRow <> nil) then begin
    oRel := Manager.Relations.FindRelation(ParentRow.Table, Table, True);
    if oRel = nil then
      Active := False
    else begin
      FRefCol := oRel.FParentColumns.ItemsI[0].Index;
      FRefColType := oRel.ParentTable.Columns.ItemsI[FRefCol].DataType;
    end;
  end
  else begin
    FRefCol := -1;
    FRefColType := dtUnknown;
  end;
  if ActualActive and (FRefColType in [dtRowRef, dtArrayRef]) then
    FRefRow := TFDDatSNestedRowList.CreateForRow(nil)
  else
    FDFreeAndNil(FRefRow);
  inherited DoActiveChanged;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechChilds.GetRowsRange(var ARowList: TFDDatSRowListBase;
  out ABeginInd, AEndInd: Integer): Boolean;
var
  oRow: TFDDatSRow;
begin
  if ParentRow = nil then
    AEndInd := -1
  else begin
    case FRefColType of
    dtRowSetRef, dtCursorRef:
      ARowList := ParentRow.NestedRows[FRefCol];
    dtRowRef, dtArrayRef:
      begin
        FRefRow.Clear;
        oRow := ParentRow.NestedRow[FRefCol];
        if oRow <> nil then
          FRefRow.Add(oRow);
        ARowList := FRefRow;
      end;
    end;
    AEndInd := ARowList.Count - 1;
  end;
  ABeginInd := 0;
  Result := True;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechChilds.AcceptRow(ARow: TFDDatSRow;
  AVersion: TFDDatSRowVersion): Boolean;
begin
  Result := False;
  if ParentRow <> nil then
    case FRefColType of
    dtRowSetRef, dtCursorRef:
      Result := (ParentRow.NestedRows[FRefCol].ContainsObj(ARow));
    dtRowRef, dtArrayRef:
      Result := (ParentRow.NestedRow[FRefCol] = ARow);
    end;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechMaster                                                           -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechMaster.Create(AChildRel: TFDDatSRelation;
  AChildRow: TFDDatSRow);
begin
  inherited Create;
  ChildRelation := AChildRel;
  ChildRow := AChildRow;
  Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechMaster.Assign(AObj: TFDDatSObject);
var
  oManager: TFDDatSManager;
begin
  if AObj is TFDDatSMechMaster then begin
    oManager := Manager;
    if oManager = TFDDatSMechMaster(AObj).Manager then
      ChildRelation := TFDDatSMechMaster(AObj).ChildRelation
    else
      ChildRelation := oManager.Relations.RelationByName(
        TFDDatSMechMaster(AObj).ChildRelation.Name);
    if (TFDDatSMechMaster(AObj).ChildRow <> nil) and
       (TFDDatSMechMaster(AObj).ChildRow.Table <> Table) then
      ChildRow := TFDDatSMechMaster(AObj).ChildRow
    else
      ChildRow := nil;
  end;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechMaster.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := ChildRelation = TFDDatSMechMaster(AObj).ChildRelation;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechMaster.GetActualActive: Boolean;
begin
  Result := inherited GetActualActive and
    (ChildRelation <> nil);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechMaster.NoRangeNoRecords: Boolean;
begin
  Result := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechMaster.DoActiveChanged;
var
  i: Integer;
begin
  if ActualActive then begin
    FBottom := ChildRow;
    FTop := ChildRow;
    FTopColumnList := ChildRelation.FChildColumns;
    FBottomColumnList := ChildRelation.FChildColumns;
    FSortMech := nil;
  end
  else begin
    FBottom := nil;
    FTop := nil;
    FTopColumnList := nil;
    FBottomColumnList := nil;
    FSortMech := nil;
  end;
  inherited DoActiveChanged;
  if ActualActive and (SortMech <> nil) then
    if SortMech.GetSortColumnList.Count <> ChildRelation.FParentColumns.Count then
      FSortMech := nil
    else
      for i := 0 to SortMech.GetSortColumnList.Count - 1 do
        if SortMech.GetSortColumnList.ItemsI[i] <> ChildRelation.FParentColumns.ItemsI[i] then begin
          FSortMech := nil;
          Break;
        end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechMaster.SetChildRelation(const AValue: TFDDatSRelation);
begin
  if FChildRelation <> AValue then begin
    FChildRelation := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechMaster.SetChildRow(const AValue: TFDDatSRow);
begin
  if FChildRow <> AValue then begin
    FChildRow := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechMaster.ResolveReferences(const AName, AValue: String);
begin
  if SameText(AName, 'ChildRelation') then
    ChildRelation := Manager.Relations.RelationByName(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechMaster.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalLoadFromStorage(AStorage);
  AStorage.DeferAction('ChildRelation',
    AStorage.ReadString('ChildRelation', ''), ResolveReferences);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechMaster.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  if ChildRelation <> nil then
    AStorage.WriteString('ChildRelation', ChildRelation.Name, '');
end;

{-------------------------------------------------------------------------------}
{- TFDDatSMechParent                                                           -}
{-------------------------------------------------------------------------------}
constructor TFDDatSMechParent.Create;
begin
  inherited Create;
  FKinds := [mkFilter, mkHasRow];
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSMechParent.Create(AChildRow: TFDDatSRow);
begin
  Create;
  ChildRow := AChildRow;
  Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechParent.Assign(AObj: TFDDatSObject);
begin
  if AObj is TFDDatSMechParent then
    if (TFDDatSMechParent(AObj).ChildRow <> nil) and
       (TFDDatSMechParent(AObj).ChildRow.Table <> Table) then
      ChildRow := TFDDatSMechParent(AObj).ChildRow
    else
      ChildRow := nil;
  inherited Assign(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechParent.GetActualActive: Boolean;
begin
  Result := inherited GetActualActive and (ChildRow <> nil);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechParent.SetChildRow(const AValue: TFDDatSRow);
begin
  if FChildRow <> AValue then begin
    FChildRow := AValue;
    Active := False;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSMechParent.DoActiveChanged;
begin
  if ActualActive then begin
    FParentRow := TFDDatSRowListBase.Create;
    FParentRow.Add(ChildRow.ParentRow);
  end
  else
    FDFreeAndNil(FParentRow);
  inherited DoActiveChanged;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechParent.GetRowsRange(var ARowList: TFDDatSRowListBase;
  out ABeginInd, AEndInd: Integer): Boolean;
begin
  ARowList := FParentRow;
  AEndInd := 0;
  ABeginInd := 0;
  Result := True;
end;

{-------------------------------------------------------------------------------}
function TFDDatSMechParent.AcceptRow(ARow: TFDDatSRow;
  AVersion: TFDDatSRowVersion): Boolean;
begin
  Result := (ARow = FParentRow.ItemsI[0]);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSRow                                                                  -}
{-------------------------------------------------------------------------------}
{$IFDEF FireDAC_DEBUG}
class function TFDDatSRow.NewInstance: TObject {$IFDEF AUTOREFCOUNT} unsafe {$ENDIF};
begin
  Result := inherited NewInstance;
  Inc(GRowsAlive);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.FreeInstance;
begin
  inherited FreeInstance;
  Dec(GRowsAlive);
end;
{$ENDIF}

{-------------------------------------------------------------------------------}
constructor TFDDatSRow.CreateForTable(ATable: TFDDatSTable; ASetToDefaults: Boolean);
var
  oCols: TFDDatSColumnList;
begin
  ASSERT(ATable <> nil);
  inherited Create;
  FOwner := ATable;
  FTable := ATable;
  oCols := ATable.Columns;
  oCols.CheckUpdateLayout;
  FRowID := $FFFFFFFF;
  FChangeNumber := $FFFFFFFF;
  FRowState := rsDetached;
  FRowPriorState := rsDetached;
  FpProposed := AllocBuffer;
  GetMem(FpInfo, oCols.FInfoSize);
{$IFDEF NEXTGEN}
  FillChar(FpInfo^, oCols.FInfoSize, 0);
{$ENDIF}
  SetFetchedMarks(not (FTable.DataHandleMode in [lmHavyFetching, lmFetching, lmRefreshing]));
  AllocInvariants;
  if ASetToDefaults then
    AssignDefaults;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSRow.Destroy;
begin
  CancelEdit;
  FRowPriorState := RowState;
  FRowState := rsDestroying;
  if Table.Columns.ParentRowRefCol <> -1 then
    ParentRow := nil;
  ClearNestedErrors;
  SetRowError(nil);
  DBUnlock;
  FreeInvariants;
  inherited Destroy;
  // If to move following lines before inherited Destroy, then
  // if table has sorted views and user is doing oRow.Free, then
  // binary search to delete row from view will fail, because row
  // already does not have the values
  FreeBuffer(FpCurrent);
  FreeBuffer(FpOriginal);
  FreeBuffer(FpProposed);
  FreeMem(FpInfo);
  FpInfo := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.CheckNoInfo;
begin
  if (FExtraInfo^.FRowException = nil) and (FExtraInfo^.FCheckColumn = -1) and
     (FExtraInfo^.FLockID = 0) then begin
    FreeMem(FExtraInfo);
    FExtraInfo := nil;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetRowInfo(AForce: Boolean): Pointer;
begin
  if (FExtraInfo = nil) and AForce then begin
    GetMem(FExtraInfo, SizeOf(TFDDatSRowExtraInfo));
    FillChar(FExtraInfo^, SizeOf(TFDDatSRowExtraInfo), 0);
    FExtraInfo^.FCheckColumn := -1;
  end;
  Result := FExtraInfo;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.AllocBuffer: PByte;
begin
  ASSERT(Table.Columns.StorageSize <> 0);
  GetMem(Result, Table.Columns.StorageSize);
  FillChar(Result^, Table.Columns.StorageSize, 0);
  // We does't need the following call, if to follow the rule - memory area
  // filled by the zero's is an empty value of any data type.
  // InternalInitComplexData(Result);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.FreeBuffer(var ApBuffer: PByte);
begin
  if ApBuffer <> nil then begin
    InternalInitComplexData(ApBuffer);
    FreeMem(ApBuffer);
    ApBuffer := nil;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.InternalGetInvariantObject(AColumn: Integer): NativeInt;
var
  oCols: TFDDatSColumnList;
begin
  oCols := Table.Columns;
  ASSERT((AColumn >= 0) and (AColumn < oCols.Count));
  ASSERT((oCols.ItemsI[AColumn].DataType in C_FD_InvariantDataTypes) and
         (oCols.FInvariantSize <> 0));
  Result := PNativeInt(FpInfo + oCols.FFetchedSize +
    SizeOf(NativeInt) * oCols.FInvariantMap[AColumn])^;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetInvariantObject(AColumn: Integer): TFDDatSObject;
begin
  Result := TFDDatSObject(InternalGetInvariantObject(AColumn));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.InternalSetInvariantObject(AColumn: Integer; AValue: NativeInt);
var
  oCols: TFDDatSColumnList;
begin
  oCols := Table.Columns;
  ASSERT((AColumn >= 0) and (AColumn < oCols.Count));
  ASSERT((oCols.ItemsI[AColumn].DataType in C_FD_InvariantDataTypes) and
         (oCols.FInvariantSize <> 0));
  PNativeInt(FpInfo + oCols.FFetchedSize +
    SizeOf(NativeInt) * oCols.FInvariantMap[AColumn])^ := AValue;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetInvariantObject(AColumn: Integer; AObj: TFDDatSObject);
{$IFDEF NEXTGEN}
var
  oPrevObj: TFDDatSObject;
{$ENDIF}
begin
{$IFDEF NEXTGEN}
  oPrevObj := GetInvariantObject(AColumn);
  if oPrevObj <> nil then
    oPrevObj.__ObjRelease;
  if AObj <> nil then
    AObj.__ObjAddRef;
{$ENDIF}
  InternalSetInvariantObject(AColumn, NativeInt(AObj));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.AllocInvariants;
var
  oCols: TFDDatSColumnList;
  i: Integer;
begin
  oCols := Table.Columns;
  if oCols.FInvariants <> 0 then
    for i := 0 to oCols.Count - 1 do
      case oCols.ItemsI[i].DataType of
      dtRowSetRef,
      dtCursorRef:     SetInvariantObject(i, TFDDatSNestedRowList.CreateForRow(Self));
      dtRowRef,
      dtArrayRef,
      dtParentRowRef:  SetInvariantObject(i, nil);
      end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.FreeInvariants;
var
  [unsafe] oCols: TFDDatSColumnList;
  oNestedRowList: TFDDatSNestedRowList;
  oNestedRow: TFDDatSRow;
  i, j: Integer;
begin
  oCols := Table.Columns;
  if oCols.FInvariants <> 0 then
    for i := 0 to oCols.Count - 1 do
      case oCols.ItemsI[i].DataType of
      dtRowSetRef, dtCursorRef:
        begin
          oNestedRowList := NestedRows[i];
          for j := oNestedRowList.Count - 1 downto 0 do begin
            oNestedRow := oNestedRowList.ItemsI[j];
            if oNestedRow <> nil then begin
              oNestedRow.ParentRow := nil;
              FDFree(oNestedRow);
            end;
          end;
          FDFree(oNestedRowList);
          SetInvariantObject(i, nil);
        end;
      dtRowRef, dtArrayRef:
        begin
          oNestedRow := NestedRow[i];
          if oNestedRow <> nil then begin
            oNestedRow.ParentRow := nil;
            FDFree(oNestedRow);
          end;
          SetInvariantObject(i, nil);
        end;
      dtParentRowRef:
        SetInvariantObject(i, nil);
      end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetFetchedMarks(AOn: Boolean);
var
  C: Byte;
  oCols: TFDDatSColumnList;
begin
  oCols := Table.Columns;
  if AOn then
    C := $FF
  else
    C := 0;
  FillChar(FpInfo^, oCols.FFetchedSize, C);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.InternalAssignDefaults(ACols: TFDDatSColumnList);
var
  i: Integer;
  pVal: Pointer;
  i8Val: Shortint;
  i16Val: Smallint;
  i32Val: Integer;
  i64Val: Int64;
  sVal: Single;
  dVal: Double;
  eVal: Extended;
  bcdVal: TBcd;
  eTmpPriorRowState: TFDDatSRowState;
  [unsafe] oCol: TFDDatSColumn;
begin
  eTmpPriorRowState := FRowPriorState;
  FRowPriorState := RowState;
  FRowState := rsInitializing;
  try
    for i := 0 to ACols.Count - 1 do begin
      oCol := ACols.ItemsI[i];
      if oCol.AutoIncrement then begin
        ACols.FAutoIncs[i] := ACols.FAutoIncs[i] + oCol.AutoIncrementStep;
        case oCol.DataType of
        dtByte,
        dtSByte:
          begin
            i8Val := ShortInt(ACols.FAutoIncs[i]);
            pVal := @i8Val;
          end;
        dtUInt16,
        dtInt16:
          begin
            i16Val := SmallInt(ACols.FAutoIncs[i]);
            pVal := @i16Val;
          end;
        dtUInt32,
        dtInt32:
          begin
            i32Val := ACols.FAutoIncs[i];
            pVal := @i32Val;
          end;
        dtUInt64,
        dtInt64:
          begin
            i64Val := ACols.FAutoIncs[i];
            pVal := @i64Val;
          end;
        dtSingle:
          begin
            sVal := ACols.FAutoIncs[i];
            pVal := @sVal;
          end;
        dtDouble:
          begin
            dVal := ACols.FAutoIncs[i];
            pVal := @dVal;
          end;
        dtExtended:
          begin
            eVal := ACols.FAutoIncs[i];
            pVal := @eVal;
          end;
        dtBCD,
        dtFmtBCD:
          begin
            bcdVal := VarToBcd(ACols.FAutoIncs[i]);
            pVal := @bcdVal;
          end;
        else
          pVal := nil;
        end;
        SetData(i, pVal, 0);
      end;
    end;
  finally
    FRowState := RowPriorState;
    FRowPriorState := eTmpPriorRowState;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.AssignDefaults;
var
  oCols: TFDDatSColumnList;
begin
  oCols := Table.Columns;
  if not (ctDefs in oCols.FHasThings) or
     (Table.DataHandleMode in [lmHavyFetching, lmFetching, lmRefreshing]) then
    Exit;
  InternalAssignDefaults(oCols);
  if ctExps in oCols.FHasThings then
    InternalCalculateColumns(True, oCols);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.BeginEdit;

  procedure ErrorCantEdit;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantBeginEdit, []);
  end;

var
  oList: TFDDatSTableRowList;
  pCurBuff: PByte;
begin
  if not (RowState in [rsInserted, rsModified, rsUnchanged]) then
    ErrorCantEdit;
  oList := RowList;
  if oList <> nil then begin
    FpProposed := AllocBuffer;
    pCurBuff := GetBuffer(rvCurrent);
    if pCurBuff <> nil then
      CopyBuffer(FpProposed, pCurBuff);
    FRowPriorState := RowState;
    FRowState := rsEditing;
    Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.CancelEdit;
begin
  if RowState = rsEditing then begin
    CancelNestedRows;
    FreeBuffer(FpProposed);
    FRowState := RowPriorState;
    Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.SkipConstraintCheck: Boolean;
var
  oManager: TFDDatSManager;
begin
  Result := not Table.EnforceConstraints or (Owner = nil) or
    not (Table.DataHandleMode in [lmStandard, lmRefreshing]) or
    (RowState = rsChecking);
  if not Result then begin
    oManager := Manager;
    Result := (oManager <> nil) and not oManager.EnforceConstraints;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.CascadeAcceptReject(AAccept: Boolean);
var
  oTab, oPKTab: TFDDatSTable;
  oManager: TFDDatSManager;
  oCons: TFDDatSConstraintBase;
  i, j: Integer;
  eProposedState: TFDDatSRowState;
begin
  if SkipConstraintCheck then
    Exit;
  oTab := Table;
  oManager := Manager;
  if AAccept then
    eProposedState := rsUnchanged
  else
    eProposedState := rsDestroying;
  if (oManager <> nil) and oManager.EnforceConstraints then
    for i := 0 to oManager.Tables.Count - 1 do begin
      oPKTab := oManager.Tables.ItemsI[i];
      if oPKTab.EnforceConstraints then
        for j := 0 to oPKTab.Constraints.Count - 1 do begin
          oCons := oPKTab.Constraints.ItemsI[j];
          if (oCons is TFDDatSForeignKeyConstraint) and
             (TFDDatSForeignKeyConstraint(oCons).RelatedTable = oTab) then
            oCons.Check(Self, eProposedState, ctAtEditEnd);
        end;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.CheckRowConstraints(AProposedState: TFDDatSRowState);
var
  lSkipCheck: Boolean;
  oTab, oPKTab: TFDDatSTable;
  oManager: TFDDatSManager;
  oCons: TFDDatSConstraintBase;
  [unsafe] oCol: TFDDatSColumn;
  i, j: Integer;
  pBuff: PByte;
  eTempState, eTempPriorState: TFDDatSRowState;

  procedure ErrorNotNull;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_RowColMBNotNull, [oCol.Name]);
  end;

begin
  lSkipCheck := SkipConstraintCheck;
  if lSkipCheck and not (ctInvars in Table.Columns.HasThings) then
    Exit;
  eTempState := RowState;
  eTempPriorState := RowPriorState;
  FRowPriorState := FRowState;
  FRowState := rsChecking;
  try
    ConstrainChildRow(AProposedState);
    ConstrainParentRow(AProposedState);
    if lSkipCheck then
      Exit;
    oTab := Table;
    oManager := Manager;
    if oTab.EnforceConstraints and ((oManager = nil) or oManager.EnforceConstraints) then begin
      if oTab.CheckNotNull and (AProposedState in [rsInserted, rsModified]) then begin
        pBuff := GetBuffer(rvDefault);
        for i := 0 to oTab.Columns.Count - 1 do begin
          oCol := oTab.Columns.ItemsI[i];
          if not oCol.AllowDBNull and not oCol.ReadOnly and GetIsNull(pBuff, i) then
            ErrorNotNull;
        end;
      end;
      oTab.Constraints.Check(Self, AProposedState, ctAtEditEnd);
    end;
    if (oManager <> nil) and oManager.EnforceConstraints then
      for i := 0 to oManager.Tables.Count - 1 do begin
        oPKTab := oManager.Tables.ItemsI[i];
        if oPKTab.EnforceConstraints then
          for j := 0 to oPKTab.Constraints.Count - 1 do begin
            oCons := oPKTab.Constraints.ItemsI[j];
            if (oCons is TFDDatSForeignKeyConstraint) and
               (TFDDatSForeignKeyConstraint(oCons).RelatedTable = oTab) then
              oCons.Check(Self, AProposedState, ctAtEditEnd);
          end;
      end;
  finally
    FRowState := eTempState;
    FRowPriorState := eTempPriorState;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.CheckColumnConstraints;
var
  oTab: TFDDatSTable;
  oManager: TFDDatSManager;
  eTempState, eTempPriorState: TFDDatSRowState;
begin
  if SkipConstraintCheck then
    Exit;
  eTempState := RowState;
  eTempPriorState := RowPriorState;
  FRowPriorState := FRowState;
  FRowState := rsChecking;
  try
    oTab := Table;
    oManager := Manager;
    if oTab.EnforceConstraints and ((oManager = nil) or oManager.EnforceConstraints) then
      oTab.Constraints.Check(Self, rsEditing, ctAtColumnChange);
  finally
    FRowState := eTempState;
    FRowPriorState := eTempPriorState;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.InternalInitComplexData(ABuffer: PByte);
var
  [unsafe] oCols: TFDDatSColumnList;
  [unsafe] oCol: TFDDatSColumn;
  i: Integer;
begin
  oCols := Table.Columns;
  if ctComp in oCols.FHasThings then
    for i := 0 to oCols.Count - 1 do begin
      oCol := oCols.ItemsI[i];
      if caBlobData in oCol.Attributes then
        SetBlobData(ABuffer, i, nil, 0)
      else if oCol.DataType = dtObject then
        PFDDataStoredObject(PByte(ABuffer) + oCols.DataOffsets[i])^ := nil;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.CleanupBuffer(ABuffer: PByte);
begin
  InternalInitComplexData(ABuffer);
  FillChar(ABuffer^, Table.Columns.StorageSize, 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.Clear(ASetColsToDefaults: Boolean);
var
  lWasDetached: Boolean;
begin
  lWasDetached := (RowState in [rsDetached, rsInitializing]) or
    (RowState in [rsForceWrite, rsDestroying]) and (RowPriorState = rsDetached);
  LockNotification;
  try
    if RowState = rsEditing then
      CancelEdit;
    UnregisterChange;
    if RowState <> rsForceWrite then
      FRowPriorState := rsDetached;
    if Owner is TFDDatSTable then begin
      if RowState <> rsForceWrite then
        FRowState := rsDetached;
      FreeBuffer(FpCurrent);
      if FpProposed <> nil then
        CleanupBuffer(FpProposed)
      else
        FpProposed := AllocBuffer;
    end
    else begin
      if RowState <> rsForceWrite then
        FRowState := rsInserted;
      FreeBuffer(FpProposed);
      if FpCurrent <> nil then
        CleanupBuffer(FpCurrent)
      else
        FpCurrent := AllocBuffer;
    end;
    FreeBuffer(FpOriginal);
    ClearNestedRows;
    ClearErrors;
    SetFetchedMarks(True);
    if ASetColsToDefaults then
      AssignDefaults;
  finally
    UnlockNotification;
    if not lWasDetached then
      Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.ClearErrors;
begin
  ClearNestedErrors;
  if SetRowError(nil) then
    Notify(snRowErrorStateChanged, srDataChange, NativeInt(Self), 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.Erase;
var
  i: Integer;
  lFetching: Boolean;
begin
  lFetching := Table.DataHandleMode in [lmHavyFetching, lmFetching, lmRefreshing];
  for i := 0 to Table.Columns.Count - 1 do
    if not lFetching or Fetched[i] then
      SetData(i, nil, 0);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.CompareColumnVersions(AColumn: Integer;
  AVersion1, AVersion2: TFDDatSRowVersion): Boolean;
var
  pBuff1, pBuff2: Pointer;
  iLen1, iLen2: LongWord;
  lIsNull1, lIsNull2: Boolean;
  lIsEmpty1, lIsEmpty2: Boolean;
begin
  iLen1 := 0;
  iLen2 := 0;
  pBuff1 := nil;
  pBuff2 := nil;
  lIsNull1 := not GetData(AColumn, AVersion1, pBuff1, 0, iLen1, False);
  lIsNull2 := not GetData(AColumn, AVersion2, pBuff2, 0, iLen2, False);
  lIsEmpty1 := (pBuff1 = nil) and (iLen1 = 0);
  lIsEmpty2 := (pBuff2 = nil) and (iLen2 = 0);
  if lIsNull1 and lIsNull2 or lIsEmpty1 and lIsEmpty2 then
    Result := True
  else if not lIsNull1 and not lIsNull2 and not lIsEmpty1 and not lIsEmpty2 then
    Result := (CompareData(AColumn, pBuff1, iLen1, pBuff2, iLen2, []) = 0)
  else
    Result := False;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.CompareColumnsVersions(AColumns: TFDDatSColumnSublist;
  AVersion1, AVersion2: TFDDatSRowVersion): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to AColumns.Count - 1 do
    if not CompareColumnVersions(AColumns.ItemsI[i].Index, AVersion1, AVersion2) then begin
      Result := False;
      Break;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.CompareData(AColumn: Integer; ABuff1: Pointer;
  ADataLen1: Integer; ABuff2: Pointer; ADataLen2: Integer;
  AOptions: TFDCompareDataOptions): Integer;

  procedure ErrorColIsNotSearch;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ColIsNotSearchable,
      [Table.Columns.ItemsI[AColumn].Name]);
  end;

  function GetBCDDiff(ABuff1, ABuff2: Pointer): Extended;
  var
    buff: array[0 .. 100] of Char;
    iSz: Integer;
    s1, s2: String;
  begin
    iSz := 0;
    FDBCD2Str(buff, iSz, PBcd(ABuff1)^, FormatSettings.DecimalSeparator);
    SetString(s1, buff, iSz);
    FDBCD2Str(buff, iSz, PBcd(ABuff2)^, FormatSettings.DecimalSeparator);
    SetString(s2, buff, iSz);
    Result := FDStr2Float(s1, FormatSettings.DecimalSeparator) - FDStr2Float(s2, FormatSettings.DecimalSeparator);
  end;

var
  i: Integer;
  sDiff: Single;
  dDiff, dPrec: Double;
  eDiff: Extended;
  iDiff, iPrec: Integer;
  E: Extended;
  [unsafe] oCol: TFDDatSColumn;
begin
  ASSERT((Self <> nil) and (ABuff1 <> nil) and (ABuff2 <> nil));
  oCol := Table.Columns.ItemsI[AColumn];
  case oCol.DataType of
  dtBoolean:
    if PWordBool(ABuff1)^ then
      if PWordBool(ABuff2)^ then
        Result := 0
      else
        Result := 1
    else
      if PWordBool(ABuff2)^ then
        Result := -1
      else
        Result := 0;
  dtSByte:
    if PShortInt(ABuff1)^ > PShortInt(ABuff2)^ then
      Result := 1
    else if PShortInt(ABuff1)^ < PShortInt(ABuff2)^ then
      Result := -1
    else
      Result := 0;
  dtInt16:
    if PSmallInt(ABuff1)^ > PSmallInt(ABuff2)^ then
      Result := 1
    else if PSmallInt(ABuff1)^ < PSmallInt(ABuff2)^ then
      Result := -1
    else
      Result := 0;
  dtInt32:
    if PInteger(ABuff1)^ > PInteger(ABuff2)^ then
      Result := 1
    else if PInteger(ABuff1)^ < PInteger(ABuff2)^ then
      Result := -1
    else
      Result := 0;
  dtInt64:
    if PInt64(ABuff1)^ > PInt64(ABuff2)^ then
      Result := 1
    else if PInt64(ABuff1)^ < PInt64(ABuff2)^ then
      Result := -1
    else
      Result := 0;
  dtByte:
    if PByte(ABuff1)^ > PByte(ABuff2)^ then
      Result := 1
    else if PByte(ABuff1)^ < PByte(ABuff2)^ then
      Result := -1
    else
      Result := 0;
  dtUInt16:
    if PWord(ABuff1)^ > PWord(ABuff2)^ then
      Result := 1
    else if PWord(ABuff1)^ < PWord(ABuff2)^ then
      Result := -1
    else
      Result := 0;
  dtUInt32:
    begin
      if PCardinal(ABuff1)^ > PCardinal(ABuff2)^ then
        Result := 1
      else if PCardinal(ABuff1)^ < PCardinal(ABuff2)^ then
        Result := -1
      else
        Result := 0;
    end;
  dtUInt64:
    if PUInt64(ABuff1)^ > PUInt64(ABuff2)^ then
      Result := 1
    else if PUInt64(ABuff1)^ < PUInt64(ABuff2)^ then
      Result := -1
    else
      Result := 0;
  dtSingle:
    begin
      sDiff := PSingle(ABuff1)^ - PSingle(ABuff2)^;
      if sDiff > 0.00001 then
        Result := 1
      else if sDiff < -0.00001 then
        Result := -1
      else
        Result := 0;
    end;
  dtDouble:
    begin
      dDiff := PDouble(ABuff1)^ - PDouble(ABuff2)^;
      if dDiff > 0.0000000000001 then
        Result := 1
      else if dDiff < -0.0000000000001 then
        Result := -1
      else
        Result := 0;
    end;
  dtExtended:
    begin
      eDiff := PExtended(ABuff1)^ - PExtended(ABuff2)^;
      if eDiff > 0.0000000000001 then
        Result := 1
      else if eDiff < -0.0000000000001 then
        Result := -1
      else
        Result := 0;
    end;
  dtCurrency:
    if PCurrency(ABuff1)^ > PCurrency(ABuff2)^ then
      Result := 1
    else if PCurrency(ABuff1)^ < PCurrency(ABuff2)^ then
      Result := -1
    else
      Result := 0;
  dtBCD,
  dtFmtBCD:
    begin
      Result := BcdCompare(PBcd(ABuff1)^, PBcd(ABuff2)^);
      if Result > 0 then
        Result := 1
      else if Result < 0 then
        Result := -1
      else
      begin
        E := GetBCDDiff(ABuff1, ABuff2);
        if E > 0.0000000000001 then
          Result := 1
        else if E < -0.0000000000001 then
          Result := -1
        else
          Result := 0;
      end;
    end;
  dtDate,
  dtTime:
    begin
      iDiff := PInteger(ABuff1)^ - PInteger(ABuff2)^;
      if oCol.Scale > 0 then
        iPrec := oCol.Scale
      else
        iPrec := 0;
      if iDiff = 0 then
        Result := 0
      else if iDiff >= iPrec then
        Result := 1
      else if iDiff <= -iPrec then
        Result := -1
      else
        Result := 0;
    end;
  dtDateTime:
    begin
      dDiff := PDateTimeRec(ABuff1)^.DateTime - PDateTimeRec(ABuff2)^.DateTime;
      if oCol.Scale > 0 then
        dPrec := oCol.Scale
      else
        dPrec := 0.1;
      if dDiff = 0 then
        Result := 0
      else if dDiff >= dPrec then
        Result := 1
      else if dDiff <= -dPrec then
        Result := -1
      else
        Result := 0;
    end;
  dtDateTimeStamp:
    if PSQLTimeStamp(ABuff1)^.Year > PSQLTimeStamp(ABuff2)^.Year then
      Result := 1
    else if PSQLTimeStamp(ABuff1)^.Year < PSQLTimeStamp(ABuff2)^.Year then
      Result := -1
    else if PSQLTimeStamp(ABuff1)^.Month > PSQLTimeStamp(ABuff2)^.Month then
      Result := 1
    else if PSQLTimeStamp(ABuff1)^.Month < PSQLTimeStamp(ABuff2)^.Month then
      Result := -1
    else if PSQLTimeStamp(ABuff1)^.Day > PSQLTimeStamp(ABuff2)^.Day then
      Result := 1
    else if PSQLTimeStamp(ABuff1)^.Day < PSQLTimeStamp(ABuff2)^.Day then
      Result := -1
    else if PSQLTimeStamp(ABuff1)^.Hour > PSQLTimeStamp(ABuff2)^.Hour then
      Result := 1
    else if PSQLTimeStamp(ABuff1)^.Hour < PSQLTimeStamp(ABuff2)^.Hour then
      Result := -1
    else if PSQLTimeStamp(ABuff1)^.Minute > PSQLTimeStamp(ABuff2)^.Minute then
      Result := 1
    else if PSQLTimeStamp(ABuff1)^.Minute < PSQLTimeStamp(ABuff2)^.Minute then
      Result := -1
    else if (oCol.Scale <= 60000) and (PSQLTimeStamp(ABuff1)^.Second > PSQLTimeStamp(ABuff2)^.Second) then
      Result := 1
    else if (oCol.Scale <= 60000) and (PSQLTimeStamp(ABuff1)^.Second < PSQLTimeStamp(ABuff2)^.Second) then
      Result := -1
    else if (oCol.Scale <= 1000) and (PSQLTimeStamp(ABuff1)^.Fractions > PSQLTimeStamp(ABuff2)^.Fractions) then
      Result := 1
    else if (oCol.Scale <= 1000) and (PSQLTimeStamp(ABuff1)^.Fractions < PSQLTimeStamp(ABuff2)^.Fractions) then
      Result := -1
    else
      Result := 0;
  dtTimeIntervalFull,
  dtTimeIntervalYM,
  dtTimeIntervalDS:
    Result := FDSQLTimeIntervalCompare(PFDSQLTimeInterval(ABuff1)^, PFDSQLTimeInterval(ABuff2)^);
  dtAnsiString,
  dtMemo,
  dtHMemo:
    Result := FDCompareAnsiStr(PFDAnsiString(ABuff1), PFDAnsiString(ABuff2),
      ADataLen1, ADataLen2, Self.Table.Locale, coNoCase in AOptions,
      coPartial in AOptions, coNoSymbols in AOptions);
  dtWideString,
  dtWideMemo,
  dtWideHMemo,
  dtXML:
    Result := FDCompareWideStr(PWideChar(ABuff1), PWideChar(ABuff2),
      ADataLen1, ADataLen2, Self.Table.Locale, coNoCase in AOptions,
      coPartial in AOptions, coNoSymbols in AOptions);
  dtByteString,
  dtBlob,
  dtHBlob,
  dtHBFile:
    Result := FDCompareByteStr(PByte(ABuff1), PByte(ABuff2),
      ADataLen1, ADataLen2);
  dtGUID:
    begin
      if PGUID(ABuff1)^.D1 < PGUID(ABuff2)^.D1 then
        Result := -1
      else if PGUID(ABuff1)^.D1 > PGUID(ABuff2)^.D1 then
        Result := 1
      else if PGUID(ABuff1)^.D2 < PGUID(ABuff2)^.D2 then
        Result := -1
      else if PGUID(ABuff1)^.D2 > PGUID(ABuff2)^.D2 then
        Result := 1
      else if PGUID(ABuff1)^.D3 < PGUID(ABuff2)^.D3 then
        Result := -1
      else if PGUID(ABuff1)^.D3 > PGUID(ABuff2)^.D3 then
        Result := 1
      else begin
        Result := 0;
        for i := 0 to 7 do begin
          if PGUID(ABuff1)^.D4[i] < PGUID(ABuff2)^.D4[i] then begin
            Result := -1;
            Break;
          end
          else if PGUID(ABuff1)^.D4[i] > PGUID(ABuff2)^.D4[i] then begin
            Result := 1;
            Break;
          end;
        end;
      end;
    end;
  dtObject:
    Result := PFDDataStoredObject(ABuff1)^.Compare(PFDDataStoredObject(ABuff2)^, AOptions);
  else
    if not (caSearchable in oCol.Attributes) then
      ErrorColIsNotSearch;
    Result := 0;
  end;
  if coDescending in AOptions then
    Result := - Result;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.CompareNulls(AIsNull1, AIsNull2: Boolean; AOptions: TFDCompareDataOptions): Integer;
begin
  if not AIsNull1 and AIsNull2 then
    if not (coDescending in AOptions) then
      if coNullFirst in AOptions then
        Result := 1
      else
        Result := -1
    else
      if coDescNullLast in AOptions then
        Result := -1
      else
        Result := 1
  else if AIsNull1 and not AIsNull2 then
    if not (coDescending in AOptions) then
      if coNullFirst in AOptions then
        Result := -1
      else
        Result := 1
    else
      if coDescNullLast in AOptions then
        Result := 1
      else
        Result := -1
  else if coNullsNotEqual in AOptions then
    Result := -1
  else
    Result := 0;
end;

{-------------------------------------------------------------------------------}
(*
type
  TFDDatSRowComparision = class(TObject)
  private
    FRow1, FRow2: TFDDatSRow;
    FColumns1, FColumns2: TFDDatSColumnSublist;
    FVersion1, FVersion2: TFDDatSRowVersion;
    FColumnCount: Integer;
    FDescendingColumns,
    FCaseInsensitiveColumns: TFDDatSColumnSublist;
    FOptions: TFDCompareDataOptions;
    FCache: TFDDatSCompareRowsCache;
  public
    procedure Setup(ARow1: TFDDatSRow; AColumns, ADescendingColumns,
      ACaseInsensitiveColumns: TFDDatSColumnSublist; AColumnCount: Integer;
      ARow2: TFDDatSRow; AColumns2: TFDDatSColumnSublist; AVersion: TFDDatSRowVersion;
      AOptions: TFDCompareDataOptions);
  end;

{ TFDDatSRowComparision }

procedure TFDDatSRowComparision.Setup(ARow1: TFDDatSRow; AColumns, ADescendingColumns,
  ACaseInsensitiveColumns: TFDDatSColumnSublist; AColumnCount: Integer;
  ARow2: TFDDatSRow; AColumns2: TFDDatSColumnSublist;
  AVersion: TFDDatSRowVersion; AOptions: TFDCompareDataOptions);
begin
  inherited Create;
  FRow1 := ARow1;
  FRow2 := ARow2;
end;
*)

function TFDDatSRow.CompareRows(AColumns, ADescendingColumns,
    ACaseInsensitiveColumns: TFDDatSColumnSublist; AColumnCount: Integer;
    ARow2: TFDDatSRow; AColumns2: TFDDatSColumnSublist;
    AVersion: TFDDatSRowVersion; AOptions: TFDCompareDataOptions;
    var ACache: TFDDatSCompareRowsCache): Integer;
  procedure ErrorCantCompareRows;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantCompareRows, []);
  end;
var
  pBuff1, pBuff2: Pointer;
  iLen1, iLen2: LongWord;
  lIsNull1, lIsNull2: Boolean;
  i, iCol1, iCol2: Integer;
  iColCount: Integer;
  eOpts: TFDCompareDataOptions;
  oCol1, oCol2: TFDDatSColumn;
  pItem: PFDDatSCompareRowsCacheItem;
begin
  if (Self = nil) or (ARow2 = nil) or
     (AColumns2 <> nil) and (AColumns = nil) then
    ErrorCantCompareRows;

  Result := 0;
  if AColumnCount = -1 then
    if AColumns = nil then
      iColCount := Table.Columns.Count
    else
      iColCount := AColumns.Count
  else
    iColCount := AColumnCount;
  if AColumns2 <> nil then begin
    if AColumns2.Count < iColCount then
      iColCount := AColumns2.Count;
  end
  else if ARow2.Table.Columns.Count < iColCount then
    iColCount := ARow2.Table.Columns.Count;

  if (coCache in AOptions) and (Length(ACache) = 0) then
    SetLength(ACache, iColCount);

  for i := 0 to iColCount - 1 do begin
    if AColumns = nil then begin
      oCol1 := Table.Columns.ItemsI[i];
      iCol1 := i;
    end
    else begin
      oCol1 := AColumns.ItemsI[i];
      iCol1 := oCol1.Index;
    end;
    if AColumns2 = nil then begin
      oCol2 := ARow2.Table.Columns.ItemsI[iCol1];
      iCol2 := iCol1;
    end
    else begin
      oCol2 := AColumns2.ItemsI[i];
      iCol2 := oCol2.Index;
    end;
    if oCol1.DataType <> oCol2.DataType then
      ErrorCantCompareRows;
    if oCol1.DataType in C_FD_InvariantDataTypes then
      Result := 0
    else begin
      iLen1 := 0;
      pBuff1 := nil;
      iLen2 := 0;
      pBuff2 := nil;
      lIsNull1 := not GetData(iCol1, AVersion, pBuff1, 0, iLen1, False);
      if not (coCache in AOptions) or not ACache[i].FInit then begin
        lIsNull2 := not ARow2.GetData(iCol2, AVersion, pBuff2, 0, iLen2, False);
        eOpts := AOptions;
        if (ADescendingColumns <> nil) and (ADescendingColumns.IndexOf(oCol1) <> -1) then
          Include(eOpts, coDescending);
        if (ACaseInsensitiveColumns <> nil) and (ACaseInsensitiveColumns.IndexOf(oCol1) <> -1) then
          Include(eOpts, coNoCase);
        if i < iColCount - 1 then
          Exclude(eOpts, coPartial);
        if (coCache in AOptions) and not ACache[i].FInit then begin
          pItem := @ACache[i];
          pItem^.FIsNull := lIsNull2;
          pItem^.FpBuff := pBuff2;
          pItem^.FLen := iLen2;
          pItem^.FOpts := eOpts;
          pItem^.FInit := True;
        end;
      end
      else begin
        pItem := @ACache[i];
        lIsNull2 := pItem^.FIsNull;
        pBuff2 := pItem^.FpBuff;
        iLen2 := pItem^.FLen;
        eOpts := pItem^.FOpts;
      end;
      if not lIsNull1 and not lIsNull2 then
        Result := CompareData(iCol1, pBuff1, iLen1, pBuff2, iLen2, eOpts)
      else
        Result := CompareNulls(lIsNull1, lIsNull2, eOpts);
    end;
    if Result <> 0 then
      Break;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.CompareRows(ARow2: TFDDatSRow;
  AVersion: TFDDatSRowVersion; AOptions: TFDCompareDataOptions): Integer;
begin
  Result := CompareRows(nil, nil, nil, -1, ARow2, nil, AVersion, AOptions, FDEmptyCC);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.CompareRowsExp(const AEvaluator: IFDStanExpressionEvaluator;
  ARow2: TFDDatSRow; AVersion: TFDDatSRowVersion; AOptions: TFDCompareDataOptions): Integer;
var
  V1, V2: Variant;
  lIsNull1, lIsNull2: Boolean;
  iType1, iType2: Integer;
begin
  ASSERT((Self <> nil) and (AEvaluator <> nil));
  AEvaluator.DataSource.Position := Self;
  V1 := AEvaluator.Evaluate;
  lIsNull1 := VarIsNull(V1) or VarIsEmpty(V1);
  AEvaluator.DataSource.Position := ARow2;
  V2 := AEvaluator.Evaluate;
  lIsNull2 := VarIsNull(V1) or VarIsEmpty(V1);
  if not lIsNull1 and not lIsNull2 then begin
    iType1 := VarType(V1);
    iType2 := VarType(V2);
    Result := 0;
    if (iType1 = iType2) and
       ((iType1 = varUString) or
        (iType1 = varOleStr) or (iType1 = varString)) then
      case iType1 of
      varUString:
        Result := FDCompareWideStr(
          PWideChar(UnicodeString(TVarData(V1).VUString)), PWideChar(UnicodeString(TVarData(V2).VUString)),
          Length(UnicodeString(TVarData(V1).VUString)), Length(UnicodeString(TVarData(V2).VUString)),
          Table.Locale, coNoCase in AOptions, coPartial in AOptions, coNoSymbols in AOptions);
      varOleStr:
        Result := FDCompareWideStr(
          TVarData(V1).VOleStr, TVarData(V2).VOleStr,
          StrLen(TVarData(V1).VOleStr), StrLen(TVarData(V2).VOleStr),
          Table.Locale, coNoCase in AOptions, coPartial in AOptions, coNoSymbols in AOptions);
{$IFNDEF NEXTGEN}
      varString:
        Result := FDCompareAnsiStr(
          PFDAnsiString(AnsiString(TVarData(V1).VString)), PFDAnsiString(AnsiString(TVarData(V2).VString)),
          Length(AnsiString(TVarData(V1).VString)), Length(AnsiString(TVarData(V2).VString)),
          Table.Locale, coNoCase in AOptions, coPartial in AOptions, coNoSymbols in AOptions);
{$ENDIF}
      else
        ASSERT(False);
      end
    else
      if V1 > V2 then
        Result := 1
      else if V1 < V2 then
        Result := -1
      else
        Result := 0;
  end
  else
    Result := CompareNulls(lIsNull1, lIsNull2, AOptions);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.CopyBuffer(ADestination, ASource: PByte);
var
  [unsafe] oCols: TFDDatSColumnList;
  [unsafe] oCol: TFDDatSColumn;
  i: Integer;
  pSrc: PByte;
  pDest: PByte;
  iLen: Integer;
begin
  if ADestination <> nil then begin
    CleanupBuffer(ADestination);
    if ASource <> nil then begin
      oCols := Table.Columns;
      for i := 0 to oCols.Count - 1 do begin
        if GetIsNull(ASource, i) then
          SetIsNull(ADestination, i, True)
        else begin
          SetIsNull(ADestination, i, False);
          pSrc := PByte(ASource) + oCols.DataOffsets[i];
          pDest := PByte(ADestination) + oCols.DataOffsets[i];
          oCol := oCols.ItemsI[i];
          if caBlobData in oCol.Attributes then begin
            iLen := 0;
            GetBlobData(ASource, i, pSrc, iLen);
            SetBlobData(ADestination, i, pSrc, iLen, True);
          end
          else
            case oCol.DataType of
            dtBoolean:          PWordBool(pDest)^ := PWordBool(pSrc)^;
            dtSByte:            PShortInt(pDest)^ := PShortInt(pSrc)^;
            dtInt16:            PSmallInt(pDest)^ := PSmallInt(pSrc)^;
            dtInt32:            PInteger(pDest)^ := PInteger(pSrc)^;
            dtInt64:            PInt64(pDest)^ := PInt64(pSrc)^;
            dtByte:             PByte(pDest)^ := PByte(pSrc)^;
            dtUInt16:           PWord(pDest)^ := PWord(pSrc)^;
            dtUInt32:           PCardinal(pDest)^ := PCardinal(pSrc)^;
            dtUInt64:           PUInt64(pDest)^ := PUInt64(pSrc)^;
            dtSingle:           PSingle(pDest)^ := PSingle(pSrc)^;
            dtDouble:           PDouble(pDest)^ := PDouble(pSrc)^;
            dtExtended:         PExtended(pDest)^ := PExtended(pSrc)^;
            dtCurrency:         PCurrency(pDest)^ := PCurrency(pSrc)^;
            dtBCD,
            dtFmtBCD:           PBcd(pDest)^ := PBcd(pSrc)^;
            dtDateTime:         PDateTimeRec(pDest)^ := PDateTimeRec(pSrc)^;
            dtDateTimeStamp:    PSQLTimeStamp(pDest)^ := PSQLTimeStamp(pSrc)^;
            dtTimeIntervalFull,
            dtTimeIntervalYM,
            dtTimeIntervalDS:   PFDSQLTimeInterval(pDest)^ := PFDSQLTimeInterval(pSrc)^;
            dtTime:             PInteger(pDest)^ := PInteger(pSrc)^;
            dtDate:             PInteger(pDest)^ := PInteger(pSrc)^;
            dtAnsiString:       Move(pSrc^, pDest^, PWord(pSrc)^ * SizeOf(TFDAnsiChar) + SizeOf(Word) + SizeOf(TFDAnsiChar));
            dtByteString:       Move(pSrc^, pDest^, PWord(pSrc)^ + SizeOf(Word));
            dtWideString:       Move(pSrc^, pDest^, PWord(pSrc)^ * SizeOf(WideChar) + SizeOf(Word) + SizeOf(WideChar));
            dtGUID:             PGUID(pDest)^ := PGUID(pSrc)^;
            dtObject:           PFDDataStoredObject(pDest)^ := PFDDataStoredObject(pSrc)^;
            end;
        end;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetChildRows(const AChildRelationName: String): TFDDatSView;
  procedure ErrorCantGetChildRows;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantCreateChildView, [AChildRelationName]);
  end;
var
  oManager: TFDDatSManager;
begin
  oManager := Manager;
  if oManager = nil then
    ErrorCantGetChildRows;
  Result := GetChildRows(Manager.Relations.RelationByName(AChildRelationName));
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetChildRows(AChildTable: TFDDatSTable): TFDDatSView;
  procedure ErrorCantGetChildRows;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantCreateChildView, [S_FD_NotFound]);
  end;
var
  oRel: TFDDatSRelation;
begin
  ASSERT(AChildTable <> nil);
  if (Manager = nil) or (AChildTable.Manager <> Manager) then
    ErrorCantGetChildRows;
  oRel := Manager.Relations.FindRelation(Table, AChildTable, False);
  if (oRel = nil) or (not oRel.Nested and (oRel.ChildKeyConstraint = nil)) then
    ErrorCantGetChildRows;
  Result := GetChildRows(oRel);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetChildRows(AChildRelation: TFDDatSRelation): TFDDatSView;
  procedure ErrorCantGetChildRows;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantCreateChildView, [AChildRelation.Name]);
  end;
var
  oChildTab: TFDDatSTable;
  oSrtView: TFDDatSView;
begin
  ASSERT(AChildRelation <> nil);
  if (AChildRelation.ChildKeyConstraint = nil) or
     (AChildRelation.ParentTable <> Table) or
     not AChildRelation.IsDefined then
    ErrorCantGetChildRows;
  oChildTab := AChildRelation.ChildTable;
  Result := TFDDatSView.Create(oChildTab, C_FD_SysNamePrefix + 'CHLD',
    vcChildRelation, False);
  try
    if AChildRelation.Nested then
      Result.Mechanisms.AddEx(TFDDatSMechChilds.Create(Self))
    else begin
      oSrtView := oChildTab.Views.FindSortedView(AChildRelation.ChildColumnNames, [], []);
      if oSrtView <> nil then
        Result.SourceView := oSrtView
      else
        Result.SourceView := AChildRelation.ChildKeyConstraint.GetChildSortedView;
      Result.Mechanisms.AddEx(TFDDatSMechDetails.Create(AChildRelation, Self));
    end;
    Result.Active := True;
  except
    FDFree(Result);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetParentRows(const AParentRelationName: String): TFDDatSView;
  procedure ErrorCantGetParentRows;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantCreateParentView, [AParentRelationName]);
  end;
var
  oManager: TFDDatSManager;
begin
  oManager := Manager;
  if oManager = nil then
    ErrorCantGetParentRows;
  Result := GetParentRows(Manager.Relations.RelationByName(AParentRelationName));
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetParentRows(AParentTable: TFDDatSTable): TFDDatSView;
  procedure ErrorCantGetParentRows;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantCreateParentView, [S_FD_NotFound]);
  end;
var
  oRel: TFDDatSRelation;
begin
  ASSERT(AParentTable <> nil);
  if (Manager = nil) or (AParentTable.Manager <> Manager) then
    ErrorCantGetParentRows;
  oRel := Manager.Relations.FindRelation(AParentTable, Table, False);
  if (oRel = nil) or (not oRel.Nested and (oRel.ParentKeyConstraint = nil)) then
    ErrorCantGetParentRows;
  Result := GetParentRows(oRel);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetParentRows(AParentRelation: TFDDatSRelation): TFDDatSView;
  procedure ErrorCantGetParentRows;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantCreateParentView, [AParentRelation.Name]);
  end;
var
  oParentTab: TFDDatSTable;
  oSrtView: TFDDatSView;
begin
  ASSERT(AParentRelation <> nil);
  if (AParentRelation.ParentKeyConstraint = nil) or
     (AParentRelation.ChildTable <> Table) or
     not AParentRelation.IsDefined then
    ErrorCantGetParentRows;
  oParentTab := AParentRelation.ParentTable;
  Result := TFDDatSView.Create(oParentTab, C_FD_SysNamePrefix + 'PRNT',
    vcChildRelation, False);
  try
    if AParentRelation.Nested then
      Result.Mechanisms.AddEx(TFDDatSMechParent.Create(Self))
    else begin
      oSrtView := oParentTab.Views.FindSortedView(AParentRelation.ParentColumnNames, [], []);
      if oSrtView <> nil then
        Result.SourceView := oSrtView
      else
        Result.SourceView := AParentRelation.ParentKeyConstraint.GetUniqueSortedView;
      Result.Mechanisms.AddEx(TFDDatSMechMaster.Create(AParentRelation, Self));
    end;
    Result.Active := True;
  except
    FDFree(Result);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.InternalCalculateColumns(ADefaults: Boolean; ACols: TFDDatSColumnList);
var
  i: Integer;
  eTmpPriorRowState: TFDDatSRowState;
  [unsafe] oCol: TFDDatSColumn;
begin
  eTmpPriorRowState := FRowPriorState;
  FRowPriorState := RowState;
  FRowState := rsCalculating;
  try
    for i := 0 to ACols.Count - 1 do begin
      oCol := ACols.ItemsI[i];
      if (([caCalculated, caVirtual] * oCol.Attributes <> []) or ADefaults) and
         (oCol.FEvaluator <> nil) then begin
        oCol.FEvaluator.DataSource.Position := Self;
        try
          oCol.FEvaluator.Evaluate;
        finally
          oCol.FEvaluator.DataSource.Position := nil;
        end;
      end;
    end;
    if not ADefaults then
      if Assigned(ACols.OnCalcColumns) then
        ACols.OnCalcColumns(Self);
  finally
    FRowState := RowPriorState;
    FRowPriorState := eTmpPriorRowState;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.CalculateColumns(ADefaults: Boolean);
var
  oCols: TFDDatSColumnList;
begin
  oCols := Table.Columns;
  if not ADefaults and not (ctCalcs in oCols.FHasThings) or
     ADefaults and not (ctExps in oCols.FHasThings) then
    Exit;
  InternalCalculateColumns(ADefaults, oCols);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.Delete(ANotDestroy: Boolean = False);
  procedure ErrorRowCantBeDeleted;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_RowCantBeDeleted, []);
  end;
var
  oList: TFDDatSTableRowList;
  oTab: TFDDatSTable;
begin
  oTab := Table;
  if RowState in [rsDeleted, rsInitializing, rsDetached, rsCalculating,
                  rsChecking, rsForceWrite] then
    ErrorRowCantBeDeleted
  else if RowState = rsInserted then begin
    UnregisterChange;
    oList := RowList;
    if oList <> nil then
      oList.Remove(Self, ANotDestroy);
  end
  else begin
    CheckRowConstraints(rsDeleted);
    LockNotification;
    try
      CancelEdit;
      FRowState := rsDeleted;
    finally
      UnlockNotification;
    end;
    Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
    RegisterChange;
  end;
  oTab.NotifyDataChanged(Self, rsDeleted);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoListInserting;
  procedure ErrorRowCantBeInserted;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_RowCantBeInserted, []);
  end;
begin
  if not (RowState in [rsInitializing, rsDetached, rsInserted,
                       rsImportingCurent, rsImportingOriginal, rsImportingProposed]) then
    ErrorRowCantBeInserted;
  CheckRowConstraints(rsInserted);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoListInserted;
begin
  FTable := GetTable;
  if FRowID = $FFFFFFFF then begin
    FRowID := FTable.Rows.FLastRowID;
    ASSERT(FTable.Rows.FLastRowID <> $FFFFFFFF);
    Inc(FTable.Rows.FLastRowID);
  end;
  if not (FTable.DataHandleMode in [lmLoading, lmHavyLoading]) then begin
    if FTable.DataHandleMode in [lmHavyFetching, lmFetching, lmRefreshing] then begin
      FRowState := rsUnchanged;
      FpOriginal := FpProposed;
      FpProposed := nil;
    end
    else if not (RowState in [rsImportingCurent, rsImportingOriginal, rsImportingProposed]) then begin
      FRowState := rsInserted;
      FpCurrent := FpProposed;
      FpProposed := nil;
      RegisterChange;
    end
    else
      RegisterChange;
    CalculateColumns(False);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoPostListInserted;
begin
  Table.NotifyDataChanged(Self, rsInserted);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoListRemoving;
  procedure ErrorRowCantBeDeleted;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_RowCantBeDeleted, []);
  end;
begin
  if RowState = rsDestroying then
    Exit;
  if RowState = rsEditing then
    CancelEdit;
  if not (Table.DataHandleMode in [lmDestroying, lmHavyMove, lmHavyFetching]) and
     not (RowState in [rsInserted, rsDeleted]) then
    ErrorRowCantBeDeleted;
  CheckRowConstraints(rsDetached);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoListRemoved(ANewOwner: TFDDatSObject);
begin
  if RowState <> rsDestroying then begin
    ASSERT(FpProposed = nil);
    FRowState := rsDetached;
    FpProposed := FpCurrent;
    FpCurrent := nil;
  end;
  FOwner := ANewOwner;
  FTable := GetTable;
  UnregisterChange;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoNREndEditNoVer(ARow: TFDDatSRow);
begin
  ARow.EndEditNested(True);
  ARow.EndEdit(True);
end;

procedure TFDDatSRow.DoNREndEdit(ARow: TFDDatSRow);
begin
  ARow.EndEditNested(False);
  ARow.EndEdit(False);
end;

procedure TFDDatSRow.EndEditNested(ANoVersion: Boolean = False);
begin
  if ANoVersion then
    ProcessNestedRows(DoNREndEditNoVer)
  else
    ProcessNestedRows(DoNREndEdit);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.EndEdit(ANoVersion: Boolean = False);
var
  pOrig: PByte;
begin
  if RowState = rsEditing then begin
    if (RowPriorState = rsInserted) or (RowPriorState = rsModified) then begin
      CheckRowConstraints(rsModified);
      pOrig := FpOriginal;
      FpOriginal := FpCurrent;
      try
        FpCurrent := FpProposed;
        FpProposed := nil;
        FRowState := RowPriorState;
        if FRowState = rsInserted then
          FRowPriorState := rsDetached
        else if FRowState = rsModified then
          FRowPriorState := rsUnchanged;
        Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
      finally
        FreeBuffer(FpOriginal);
        FpOriginal := pOrig;
      end;
      if not ANoVersion then
        RegisterChange;
    end
    else if RowPriorState = rsUnchanged then begin
      CheckRowConstraints(rsModified);
      if not ANoVersion then begin
        FpCurrent := FpProposed;
        FpProposed := nil;
        FRowState := rsModified;
      end
      else begin
        FreeBuffer(FpOriginal);
        FpOriginal := FpProposed;
        FpProposed := nil;
        FRowState := rsUnchanged;
      end;
      Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
      if not ANoVersion then
        RegisterChange;
    end;
    CalculateColumns(False);
    Table.NotifyDataChanged(Self, rsModified);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.ForceChange(ARowState: TFDDatSRowState);
begin
  ASSERT((FTable <> nil) and (FRowID <> $FFFFFFFF) and (FRowState = rsUnchanged) and
         (ARowState in [rsInserted, rsDeleted, rsModified]));
  case ARowState of
  rsInserted:
    begin
      FRowState := rsInserted;
      FpCurrent := FpOriginal;
      FpOriginal := nil;
    end;
  rsDeleted:
    FRowState := rsDeleted;
  rsModified:
    begin
      FRowState := rsModified;
      FpCurrent := FpOriginal;
      FpOriginal := AllocBuffer;
      CopyBuffer(FpOriginal, FpCurrent);
    end;
  end;
  Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
  RegisterChange;
  CalculateColumns(False);
  Table.NotifyDataChanged(Self, ARowState);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.RegisterChange;
var
  oManager: TFDDatSManager;
begin
  if Table.DataHandleMode = lmHavyLoading then
    Exit;
  oManager := Manager;
  if (oManager <> nil) and oManager.UpdatesRegistry then begin
    if oManager.Updates <> nil then
      oManager.Updates.RegisterRow(Self);
  end
  else
    if Table.Updates <> nil then
      Table.Updates.RegisterRow(Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.UnregisterChange;
var
  oManager: TFDDatSManager;
begin
  oManager := Manager;
  if (oManager <> nil) and oManager.UpdatesRegistry then begin
    if oManager.Updates <> nil then
      oManager.Updates.UnregisterRow(Self);
  end
  else begin
    if (Table.DataHandleMode <> lmDestroying) and (Table.Updates <> nil) then
      Table.Updates.UnregisterRow(Self);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetBlobData(ABuffer: PByte; AColumn: Integer; var
  ApData: PByte; var ALen: Integer): Boolean;
var
  [unsafe] oCols: TFDDatSColumnList;
  [unsafe] oCol: TFDDatSColumn;
  pBlobData: PFDBlobData;

  procedure ErrorColMBBlob;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ColMBBlob, [oCol.Name]);
  end;

begin
  Result := False;
  if ABuffer <> nil then begin
    oCols := Table.Columns;
    oCol := oCols.ItemsI[AColumn];
    if not (caBlobData in oCol.Attributes) then
      ErrorColMBBlob;
    if GetIsNull(ABuffer, AColumn) then begin
      if @ApData <> nil then
        ApData := nil;
      if @ALen <> nil then
        ALen := 0;
    end
    else begin
      Result := True;
      pBlobData := PFDBlobData(PByte(ABuffer) + oCols.DataOffsets[AColumn]);
      if @ApData <> nil then
        ApData := pBlobData^.FData;
      if @ALen <> nil then
        ALen := pBlobData^.FLength;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetBuffer(AVersion: TFDDatSRowVersion): PByte;
var
  iRowState: TFDDatSRowState;
begin
  if RowState in [rsInitializing, rsCalculating, rsChecking, rsForceWrite, rsDestroying] then
    iRowState := RowPriorState
  else
    iRowState := RowState;
  case iRowState of
  rsImportingCurent:
    Result := FpCurrent;
  rsImportingOriginal:
    Result := FpOriginal;
  rsImportingProposed:
    Result := FpProposed;
  rsDetached:
    if FpProposed <> nil then
      // new row, not yet inserted into the rows list
      case AVersion of
      rvDefault:  Result := FpProposed;
      rvCurrent:  Result := FpProposed;
      rvOriginal: Result := nil;
      rvPrevious: Result := FpProposed;
      rvProposed: Result := FpProposed;
      else        Result := nil;
      end
    else
      // deleted row, was deleted from the rows list
      case AVersion of
      rvDefault:  Result := FpOriginal;
      rvCurrent:  Result := nil;
      rvOriginal: Result := FpOriginal;
      rvPrevious: if FpCurrent <> nil then
                    Result := FpCurrent
                  else
                    Result := FpOriginal;
      rvProposed: Result := nil;
      else        Result := nil;
      end;
  rsInserted:
    case AVersion of
    rvDefault:  Result := FpCurrent;
    rvCurrent:  Result := FpCurrent;
    rvOriginal: Result := nil;
    rvPrevious: if FpOriginal <> nil then
                  Result := FpOriginal
                else
                  Result := FpCurrent;
    rvProposed: Result := nil;
    else        Result := nil;
    end;
  rsDeleted:
    case AVersion of
    rvDefault:  Result := FpOriginal;
    rvCurrent:  Result := nil;
    rvOriginal: Result := FpOriginal;
    rvPrevious: if FpCurrent <> nil then
                  Result := FpCurrent
                else
                  Result := FpOriginal;
    rvProposed: Result := nil;
    else        Result := nil;
    end;
  rsModified:
    case AVersion of
    rvDefault:  Result := FpCurrent;
    rvCurrent:  Result := FpCurrent;
    rvOriginal: Result := FpOriginal;
    rvPrevious: Result := FpOriginal;
    rvProposed: Result := nil;
    else        Result := nil;
    end;
  rsUnchanged:
    case AVersion of
    rvDefault:  Result := FpOriginal;
    rvCurrent:  Result := FpOriginal;
    rvOriginal: Result := FpOriginal;
    rvPrevious: Result := FpOriginal;
    rvProposed: Result := nil;
    else        Result := nil;
    end;
  rsEditing:
    case AVersion of
    rvDefault:  Result := FpProposed;
    rvCurrent:  if FpCurrent <> nil then
                  Result := FpCurrent
                else
                  Result := FpOriginal;
    rvOriginal: if (RowPriorState = rsDeleted) or (RowPriorState = rsModified) or
                   (RowPriorState = rsUnchanged) then
                  Result := FpOriginal
                else
                  Result := nil;
    rvPrevious: if FpCurrent <> nil then
                  Result := FpCurrent
                else
                  Result := FpOriginal;
    rvProposed: Result := FpProposed;
    else        Result := nil;
    end;
  else
    Result := nil;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetCheckInfo(ACheckColumn: Integer; out ACheckValue: PByte;
  out ACheckLen: LongWord): Boolean;
var
  pInfo: PFDDataRowExtraInfo;
begin
  pInfo := GetRowInfo(False);
  Result := False;
  if pInfo <> nil then
    if pInfo^.FCheckColumn = ACheckColumn then begin
      ACheckValue := pInfo^.FCheckValue;
      ACheckLen := pInfo^.FCheckLen;
      Result := True;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetCheckInfo(ACheckColumn: Integer; ACheckValue: PByte;
  ACheckLen: Integer);
var
  pInfo: PFDDataRowExtraInfo;
begin
  pInfo := GetRowInfo(ACheckColumn <> -1);
  if pInfo <> nil then begin
    pInfo^.FCheckColumn := ACheckColumn;
    pInfo^.FCheckValue := ACheckValue;
    pInfo^.FCheckLen := ACheckLen;
    if ACheckColumn = -1 then
      CheckNoInfo;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetDataI(const AColumn: Integer): Variant;
begin
  Result := GetData(AColumn, rvDefault);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetDataO(AColumn: TFDDatSColumn): Variant;
begin
  Result := GetData(AColumn, rvDefault);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetDataS(const AColumn: String): Variant;
begin
  Result := GetData(AColumn, rvDefault);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetDataV(const AColumn: Variant): Variant;
var
  i: Integer;
  s: String;
begin
  case VarType(AColumn) of
  varSmallint,
  varInteger,
  varSingle,
  varDouble,
  varCurrency,
  varByte,
  varShortInt,
  varWord,
  varLongWord,
  varUInt64,
  varInt64:
    begin
      i := AColumn;
      Result := GetData(i, rvDefault);
    end;
  varUString,
  varOleStr,
  varString:
    begin
      s := AColumn;
      Result := GetData(s, rvDefault);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetDataI(const AColumn: Integer; const Value: Variant);
begin
  SetData(AColumn, Value);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetDataO(AColumn: TFDDatSColumn; const Value: Variant);
begin
  SetData(AColumn.Index, Value);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetDataS(const AColumn: String; const Value: Variant);
begin
  SetData(Table.Columns.ColumnByName(AColumn).Index, Value);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetDataV(const AColumn: Variant; const Value: Variant);
var
  i: Integer;
  s: String;
begin
  case VarType(AColumn) of
  varSmallint,
  varInteger,
  varSingle,
  varDouble,
  varCurrency,
  varByte,
  varShortInt,
  varWord,
  varLongWord,
  varUInt64,
  varInt64:
    begin
      i := AColumn;
      SetData(i, rvDefault);
    end;
  varUString,
  varOleStr,
  varString:
    begin
      s := AColumn;
      SetDataS(s, rvDefault);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetData(const AColumn: TFDDatSColumn;
  AVersion: TFDDatSRowVersion = rvDefault): Variant;
begin
  Result := GetData(AColumn.Index, AVersion);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetData(const AColumn: Integer;
  AVersion: TFDDatSRowVersion = rvDefault): Variant;
var
  pBuff, p: Pointer;
  iLen: LongWord;
{$IFNDEF NEXTGEN}
  SA: AnsiString;
{$ENDIF}
  S: String;
begin
  pBuff := nil;
  iLen := 0;
  if not GetData(AColumn, AVersion, pBuff, 0, iLen, False) then
    Result := Null
  else
    case Table.Columns.ItemsI[AColumn].DataType of
    dtBoolean:
      Result := PWordBool(pBuff)^;
    dtSByte:
      Result := PShortInt(pBuff)^;
    dtInt16:
      Result := PSmallInt(pBuff)^;
    dtInt32:
      Result := PInteger(pBuff)^;
    dtInt64:
      Result := PInt64(pBuff)^;
    dtByte:
      Result := PByte(pBuff)^;
    dtUInt16:
      Result := PWord(pBuff)^;
    dtUInt32:
      Result := PCardinal(pBuff)^;
    dtUInt64:
      Result := PUInt64(pBuff)^;
    dtSingle:
      Result := PSingle(pBuff)^;
    dtDouble:
      Result := PDouble(pBuff)^;
    dtExtended:
      Result := PExtended(pBuff)^;
    dtCurrency:
      Result := PCurrency(pBuff)^;
    dtBCD,
    dtFmtBCD:
      Result := VarFMTBcdCreate(PBcd(pBuff)^);
    dtDateTime:
      Result := FDMSecs2DateTime(PDateTimeRec(pBuff)^.DateTime);
    dtDateTimeStamp:
      Result := VarSQLTimeStampCreate(PSQLTimeStamp(pBuff)^);
    dtTimeIntervalFull,
    dtTimeIntervalYM,
    dtTimeIntervalDS:
      Result := FDVarSQLTimeIntervalCreate(PFDSQLTimeInterval(pBuff)^);
    dtTime:
      // Delphi does not support negative time value
      if PInteger(pBuff)^ < 0 then
        Result := FDTime2DateTime(PInteger(pBuff)^)
      else
        Result := VarSQLTimeStampCreate(FDTime2SQLTimeStamp(PInteger(pBuff)^));
    dtDate:
      Result := VarSQLTimeStampCreate(FDDate2SQLTimeStamp(PInteger(pBuff)^));
    dtByteString:
      begin
        if iLen = 0 then
          Result := VarArrayCreate([0, -1], varByte)
        else
          Result := VarArrayCreate([0, iLen - 1], varByte);
        p := VarArrayLock(Result);
        try
          Move(pBuff^, p^, iLen);
        finally
          VarArrayUnlock(Result);
        end;
      end;
    dtAnsiString, dtMemo, dtHMemo, dtBlob, dtHBlob, dtHBFile:
      begin
{$IFDEF NEXTGEN}
        Result := TFDEncoder.Deco(pBuff, iLen, ecANSI);
{$ELSE}
        SetString(SA, PAnsiChar(pBuff), iLen);
        Result := SA;
{$ENDIF}
      end;
    dtWideString, dtWideMemo, dtWideHMemo, dtXML:
      begin
        SetString(S, PWideChar(pBuff), iLen);
        Result := S;
      end;
    dtGUID:
      Result := GUIDToString(PGUID(pBuff)^);
    dtObject:
      Result := PFDDataStoredObject(pBuff)^;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetData(const AColumnName: String;
  AVersion: TFDDatSRowVersion = rvDefault): Variant;
begin
  Result := GetData(Table.Columns.ColumnByName(AColumnName).Index, AVersion);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetData(const AColumn: Integer; AVersion:
  TFDDatSRowVersion; var ABuff: Pointer; ABuffLen: LongWord; var ADataLen:
  LongWord; AByVal: Boolean): Boolean;
var
  iLen: LongWord;
  [unsafe] oCols: TFDDatSColumnList;
  [unsafe] oCol: TFDDatSColumn;
  pSrc: PByte;
  pBuff: PByte;
  lColumnChecking: Boolean;

  procedure ErrorFixedLenDataMismatch;
  begin
    try
      FDException(Self, [S_FD_LDatS], er_FD_FixedLenDataMismatch, [oCol.Name, ABuffLen, ADataLen]);
    finally
      ADataLen := 0;
    end;
  end;

  procedure ProcessVariableDataByVal(AActualLength, AItemLength, AZeros: LongWord; AActualData: PByte);
  begin
    if ABuffLen = 0 then
      iLen := AActualLength
    else begin
      iLen := ABuffLen div AItemLength - AZeros;
      if iLen > AActualLength then
        iLen := AActualLength;
    end;
    ADataLen := iLen;
    if ABuff <> nil then begin
      Move(AActualData^, ABuff^, iLen * AItemLength);
      if AZeros = 1 then
        (PByte(ABuff) + iLen * AItemLength)^ := 0
      else if AZeros = 2 then begin
        (PByte(ABuff) + iLen * AItemLength)^ := 0;
        (PByte(ABuff) + iLen * AItemLength + 1)^ := 0;
      end;
    end;
  end;

  procedure ProcessVariableDataByRef(AActualLength, AItemLength, AZeros: LongWord;
    AActualData: PByte);
  begin
    if ABuffLen = 0 then
      iLen := AActualLength
    else begin
      iLen := ABuffLen div AItemLength - AZeros;
      if iLen > AActualLength then
        iLen := AActualLength;
    end;
    ADataLen := iLen;
    ABuff := AActualData;
    // ABuff=nil and ADataLen=0 means NULL, but it is not
    if (ABuff = nil) and (ADataLen = 0) and Result then
      ABuff := Self;
  end;

  procedure ErrorCantOperateInvObj;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantOperateInvObj, [oCol.Name]);
  end;

begin
  ASSERT(Self <> nil);
  oCols := Table.Columns;
  ASSERT(Length(oCols.FDataOffsets) <> 0);
  ASSERT((AColumn >= 0) and (AColumn < oCols.Count));
  oCol := TFDDatSColumn(oCols.FArray[AColumn]);

  pSrc := nil;
  iLen := 0;
  lColumnChecking := (RowState = rsChecking) and GetCheckInfo(AColumn, pSrc, iLen);
  if lColumnChecking then begin
    if pSrc = nil then begin
      ADataLen := 0;
      if not AByVal then
        ABuff := nil;
      Result := False;
      Exit;
    end;
  end
  else begin
    pBuff := GetBuffer(AVersion);
    if (pBuff = nil) or
       ((PByte(PByte(pBuff) + oCols.NullOffsets[AColumn])^ and oCols.NullMasks[AColumn]) = 0) then begin
      ADataLen := 0;
      if not AByVal then
        ABuff := nil;
      Result := False;
      Exit;
    end;
    pSrc := PByte(pBuff) + oCols.DataOffsets[AColumn];
  end;

  Result := True;
  if AByVal then
    if caBlobData in oCol.Attributes then
      if oCol.DataType in [dtWideString, dtWideMemo, dtWideHMemo, dtXML] then
        ProcessVariableDataByVal(PFDBlobData(pSrc)^.FLength, SizeOf(WideChar), 0,
          PFDBlobData(pSrc)^.FData)
      else
        ProcessVariableDataByVal(PFDBlobData(pSrc)^.FLength, SizeOf(TFDAnsiChar), 0,
          PFDBlobData(pSrc)^.FData)
    else
      case oCol.DataType of
      dtBoolean:
        begin
          ADataLen := SizeOf(WordBool);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PWordBool(ABuff)^ := PWordBool(pSrc)^;
        end;
      dtSByte:
        begin
          ADataLen := SizeOf(ShortInt);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PShortInt(ABuff)^ := PShortInt(pSrc)^;
        end;
      dtInt16:
        begin
          ADataLen := SizeOf(SmallInt);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PSmallInt(ABuff)^ := PSmallInt(pSrc)^;
        end;
      dtInt32:
        begin
          ADataLen := SizeOf(Integer);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PInteger(ABuff)^ := PInteger(pSrc)^;
        end;
      dtInt64:
        begin
          ADataLen := SizeOf(Int64);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PInt64(ABuff)^ := PInt64(pSrc)^;
        end;
      dtByte:
        begin
          ADataLen := SizeOf(Byte);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PByte(ABuff)^ := PByte(pSrc)^;
        end;
      dtUInt16:
        begin
          ADataLen := SizeOf(Word);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PWord(ABuff)^ := PWord(pSrc)^;
        end;
      dtUInt32:
        begin
          ADataLen := SizeOf(Cardinal);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PCardinal(ABuff)^ := PCardinal(pSrc)^;
        end;
      dtUInt64:
        begin
          ADataLen := SizeOf(UInt64);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PUInt64(ABuff)^ := PUInt64(pSrc)^;
        end;
      dtSingle:
        begin
          ADataLen := SizeOf(Single);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PSingle(ABuff)^ := PSingle(pSrc)^;
        end;
      dtDouble:
        begin
          ADataLen := SizeOf(Double);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PDouble(ABuff)^ := PDouble(pSrc)^;
        end;
      dtExtended:
        begin
          ADataLen := SizeOf(Extended);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PExtended(ABuff)^ := PExtended(pSrc)^;
        end;
      dtCurrency:
        begin
          ADataLen := SizeOf(Currency);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PCurrency(ABuff)^ := PCurrency(pSrc)^;
        end;
      dtBCD,
      dtFmtBCD:
        begin
          ADataLen := SizeOf(TBcd);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PBcd(ABuff)^ := PBcd(pSrc)^;
        end;
      dtDateTime:
        begin
          ADataLen := SizeOf(TDateTimeRec);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PDateTimeRec(ABuff)^ := PDateTimeRec(pSrc)^;
        end;
      dtDateTimeStamp:
        begin
          ADataLen := SizeOf(TSQLTimeStamp);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PSQLTimeStamp(ABuff)^ := PSQLTimeStamp(pSrc)^;
        end;
      dtTimeIntervalFull,
      dtTimeIntervalYM,
      dtTimeIntervalDS:
        begin
          ADataLen := SizeOf(TFDSQLTimeInterval);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PFDSQLTimeInterval(ABuff)^ := PFDSQLTimeInterval(pSrc)^;
        end;
      dtTime,
      dtDate:
        begin
          ADataLen := SizeOf(Integer);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PInteger(ABuff)^ := PInteger(pSrc)^;
        end;
      dtAnsiString:
        if lColumnChecking then
          ProcessVariableDataByVal(iLen, SizeOf(TFDAnsiChar), 1, pSrc)
        else
          ProcessVariableDataByVal(PWord(pSrc)^, SizeOf(TFDAnsiChar), 1, PByte(pSrc) + SizeOf(Word));
      dtByteString:
        if lColumnChecking then
          ProcessVariableDataByVal(iLen, SizeOf(Byte), 1, pSrc)
        else
          ProcessVariableDataByVal(PWord(pSrc)^, SizeOf(Byte), 0, PByte(pSrc) + SizeOf(Word));
      dtWideString:
        if lColumnChecking then
          ProcessVariableDataByVal(iLen, SizeOf(WideChar), 1, pSrc)
        else
          ProcessVariableDataByVal(PWord(pSrc)^, SizeOf(WideChar), 1, PByte(pSrc) + SizeOf(Word));
      dtGUID:
        begin
          ADataLen := SizeOf(TGUID);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PGUID(ABuff)^ := PGUID(pSrc)^;
        end;
      dtObject:
        begin
          ADataLen := SizeOf(IFDDataStoredObject);
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch
          else if ABuff <> nil then
            PFDDataStoredObject(ABuff)^ := PFDDataStoredObject(pSrc)^;
        end;
      dtRowSetRef,
      dtCursorRef,
      dtRowRef,
      dtArrayRef,
      dtParentRowRef:
        ErrorCantOperateInvObj;
      end
  else
    if caBlobData in oCol.Attributes then
      if oCol.DataType in [dtWideString, dtWideMemo, dtWideHMemo, dtXML] then
        ProcessVariableDataByRef(PFDBlobData(pSrc)^.FLength, SizeOf(WideChar), 0,
          PFDBlobData(pSrc)^.FData)
      else
        ProcessVariableDataByRef(PFDBlobData(pSrc)^.FLength, SizeOf(TFDAnsiChar), 0,
          PFDBlobData(pSrc)^.FData)
    else
      case oCol.DataType of
      dtAnsiString:
        if lColumnChecking then
          ProcessVariableDataByRef(iLen, SizeOf(TFDAnsiChar), 1, pSrc)
        else
          ProcessVariableDataByRef(PWord(pSrc)^, SizeOf(TFDAnsiChar), 1, PByte(pSrc) + SizeOf(Word));
      dtByteString:
        if lColumnChecking then
          ProcessVariableDataByRef(iLen, SizeOf(Byte), 1, pSrc)
        else
          ProcessVariableDataByRef(PWord(pSrc)^, SizeOf(Byte), 0, PByte(pSrc) + SizeOf(Word));
      dtWideString:
        if lColumnChecking then
          ProcessVariableDataByRef(iLen, SizeOf(WideChar), 1, pSrc)
        else
          ProcessVariableDataByRef(PWord(pSrc)^, SizeOf(WideChar), 1, PByte(pSrc) + SizeOf(Word));
      dtRowSetRef,
      dtCursorRef,
      dtRowRef,
      dtArrayRef,
      dtParentRowRef:
        ErrorCantOperateInvObj;
      else
        begin
          ADataLen := oCol.StorageSize;
          if (ABuffLen <> ADataLen) and (ABuffLen <> 0) then
            ErrorFixedLenDataMismatch;
          ABuff := pSrc;
        end;
      end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetValues(const ANames: String): Variant;
var
  iFields, i, j: Integer;
begin
  iFields := FDCountFieldNames(ANames);
  if iFields <= 1 then
    Result := GetData(ANames)
  else begin
    Result := VarArrayCreate([0, iFields - 1], varVariant);
    i := 1;
    for j := 0 to iFields - 1 do
      Result[j] := GetData(FDExtractFieldName(ANames, i));
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetHasErrors: Boolean;
begin
  Result := GetRowError <> nil;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetIsNull(ABuffer: PByte; AColumn: Integer): Boolean;
var
  oCols: TFDDatSColumnList;
begin
  oCols := Table.Columns;
  ASSERT((AColumn >= 0) and (AColumn < oCols.Count));
  case oCols.ItemsI[AColumn].DataType of
  dtRowSetRef,
  dtCursorRef,
  dtRowRef,
  dtParentRowRef,
  dtArrayRef:
    Result := GetInvariantObject(AColumn) = nil;
  else
    Result := (PByte(PByte(ABuffer) + oCols.NullOffsets[AColumn])^ and oCols.NullMasks[AColumn]) = 0;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetRowList: TFDDatSTableRowList;
begin
  if (Owner <> nil) and (Owner.ClassType = TFDDatSTableRowList) then
    Result := TFDDatSTableRowList(Owner)
  else
    Result := nil;
  ASSERT((Result = nil) or (Owner <> nil) and (Owner is TFDDatSTableRowList));
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetTable: TFDDatSTable;
begin
  if FOwner.ClassType = TFDDatSTable then
    Result := TFDDatSTable(FOwner)
  else
    Result := TFDDatSTable(FOwner.FOwner);
  ASSERT((Result <> nil) and (Result is TFDDatSTable));
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetManager: TFDDatSManager;
begin
  Result := Table.Manager;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.HasVersion(AVersion: TFDDatSRowVersion): Boolean;
begin
  Result := (GetBuffer(AVersion) <> nil);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.AcceptChanges(AUseCascade: Boolean = True);
  procedure ErrorCantPerform;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_OperCNBPerfInState, []);
  end;
var
  oList: TFDDatSTableRowList;
begin
  AcceptNestedChanges;
  if RowState = rsEditing then
    EndEdit;
  if RowState in [rsInitializing, rsCalculating, rsChecking, rsForceWrite] then
    ErrorCantPerform;
  UnregisterChange;
  if AUseCascade then
    CascadeAcceptReject(True);
  case RowState of
  rsInserted:
    begin
      FpOriginal := FpCurrent;
      FpCurrent := nil;
      FRowState := rsUnchanged;
      Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
    end;
  rsDeleted:
    begin
      oList := RowList;
      if oList <> nil then begin
        oList.Remove(Self);
        // at this point row does not exist, so exit from here
        Exit;
      end;
    end;
  rsModified:
    begin
      FreeBuffer(FpOriginal);
      FpOriginal := FpCurrent;
      FpCurrent := nil;
      FRowState := rsUnchanged;
      Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
    end;
  end;
  if DBLockID <> 0 then
    DBUnlock;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.RejectChanges(AUseCascade: Boolean = True);
  procedure ErrorCantPerform;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_OperCNBPerfInState, []);
  end;
var
  oList: TFDDatSTableRowList;
begin
  RejectNestedChanges;
  if RowState = rsEditing then
    CancelEdit;
  if RowState in [rsInitializing, rsCalculating, rsChecking, rsForceWrite] then
    ErrorCantPerform;
  UnregisterChange;
  if AUseCascade then
    CascadeAcceptReject(False);
  case RowState of
  rsInserted:
    begin
      oList := RowList;
      if oList <> nil then
        oList.Remove(Self)
      else
        Destroy;
      // at this point row does not exist, so exit from here
      Exit;
    end;
  rsDeleted:
    begin
      FreeBuffer(FpCurrent);
      FRowState := rsUnchanged;
      Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
    end;
  rsModified:
    begin
      FreeBuffer(FpCurrent);
      FRowState := rsUnchanged;
      Notify(snRowStateChanged, srDataChange, NativeInt(Self), 0);
    end;
  end;
  if DBLockID <> 0 then
    DBUnlock;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.SetBlobData(ABuffer: PByte; AColumn: Integer;
  ApData: PByte; ALength: Integer; AForceNotNull: Boolean = False): PByte;
var
  [unsafe] oCols: TFDDatSColumnList;
  [unsafe] oCol: TFDDatSColumn;
  pBlobData: PFDBlobData;
  iZeroAddOn, iUnitSize: Integer;

  procedure ErrorColMBBlob;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ColMBBLob, [oCol.Name]);
  end;

begin
  Result := nil;
  if ABuffer = nil then
    Exit;
  oCols := Table.Columns;
  oCol := oCols.ItemsI[AColumn];
  if not (caBlobData in oCol.Attributes) then
    ErrorColMBBlob;
  pBlobData := PFDBlobData(PByte(ABuffer) + oCols.DataOffsets[AColumn]);
  case oCol.DataType of
  dtAnsiString,
  dtMemo, dtHMemo:
    begin
      iUnitSize := SizeOf(TFDAnsiChar);
      iZeroAddOn := SizeOf(TFDAnsiChar);
    end;
  dtWideString,
  dtWideMemo, dtWideHMemo, dtXML:
    begin
      iUnitSize := SizeOf(WideChar);
      iZeroAddOn := SizeOf(WideChar);
    end;
  dtByteString,
  dtBlob, dtHBlob, dtHBFile:
    begin
      iUnitSize := SizeOf(Byte);
      iZeroAddOn := 0;
    end;
  else
    iUnitSize := 0;
    iZeroAddOn := 0;
    ErrorColMBBlob;
  end;

  if ALength < 0 then
    ALength := 0;
  if (pBlobData^.FData <> nil) and (ALength = 0) then begin
    FreeMem(pBlobData^.FData, pBlobData^.FLength * iUnitSize + iZeroAddOn);
    pBlobData^.FData := nil;
  end
  else if (pBlobData^.FData = nil) and (ALength > 0) then
    GetMem(pBlobData^.FData, ALength * iUnitSize + iZeroAddOn)
  else if (pBlobData^.FData <> nil) and (ALength > 0) and (pBlobData^.FLength <> ALength) then
    ReallocMem(pBlobData^.FData, ALength * iUnitSize + iZeroAddOn);
  pBlobData^.FLength := ALength;
  Result := pBlobData^.FData;

  SetIsNull(ABuffer, AColumn, not AForceNotNull and (ALength = 0) and (ApData = nil));
  if (Result <> nil) and (ApData <> nil) and (ALength <> 0) then begin
    Move(ApData^, Result^, ALength * iUnitSize);
    case iZeroAddOn of
    SizeOf(TFDAnsiChar): (PFDAnsiString(Result) + ALength)^ := TFDAnsiChar(0);
    SizeOf(WideChar):    (PWideChar(Result) + ALength)^ := #0;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.BeginForceWrite;
begin
  ASSERT(RowState in [rsDetached, rsInitializing]);
  FRowState := rsForceWrite;
  FRowPriorState := rsDetached;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.EndForceWrite;
begin
  ASSERT(RowState = rsForceWrite);
  FRowState := rsDetached;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.CheckWrite(AColumn: Integer; AVersion: TFDDatSRowVersion): PByte;
  procedure CheckUpdatable;
  var
    [unsafe] oCol: TFDDatSColumn;
  begin
    oCol := Table.Columns.ItemsI[AColumn];
    if not (oCol.DataType in C_FD_InvariantDataTypes) and
       not (RowState in [rsCalculating, rsInitializing, rsDetached, rsEditing, rsForceWrite,
                         rsImportingCurent, rsImportingOriginal, rsImportingProposed]) then
      FDException(Self, [S_FD_LDatS], er_FD_RowNotInEditableState, []);
    if Table.EnforceConstraints and Table.CheckReadOnly and oCol.ReadOnly and
       not (RowState in [rsCalculating, rsInitializing, rsForceWrite,
                         rsImportingCurent, rsImportingOriginal, rsImportingProposed]) then
      FDException(Self, [S_FD_LDatS], er_FD_ColIsReadOnly, [oCol.Name]);
  end;
begin
  if Table.DataHandleMode = lmStandard then
    CheckUpdatable;
  Result := GetBuffer(AVersion);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.InternalSetData(AColumn: Integer; AVersion: TFDDatSRowVersion;
  ABuff: Pointer; ADataLen: LongWord);
const
  GUID_NULL: TGUID = '{00000000-0000-0000-0000-000000000000}';
var
  [unsafe] oCols: TFDDatSColumnList;
  [unsafe] oCol: TFDDatSColumn;
  pBuff: PByte;
  pSrc: PByte;
  pCh: PByte;
  lIsNull, lFetching: Boolean;
  iPrec, iScale: SmallInt;

  procedure ErrorCantOperateInvObj;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantOperateInvObj, [oCol.Name]);
  end;

  procedure ErrorFixedLenDataMismatch(ATypeLen: LongWord);
  begin
    FDException(Self, [S_FD_LDatS], er_FD_FixedLenDataMismatch, [oCol.Name, ADataLen, ATypeLen]);
  end;

  procedure ErrorVarLenDataMismatch;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_VarLenDataMismatch, [oCol.Name, ADataLen, oCol.Size]);
  end;

  procedure ErrorValueOutOfRange;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ValueOutOfRange, [oCol.Name,
      Format('BCD(%d,%d)', [oCol.Precision, oCol.Scale])]);
  end;

  procedure ValidateValue;
  var
    rBlob: TFDBlobData;
  begin
    if SkipConstraintCheck then
      Exit;
    if caBlobData in oCol.Attributes then begin
      rBlob.FData := PByte(ABuff);
      rBlob.FLength := ADataLen;
      SetCheckInfo(AColumn, PByte(@rBlob), SizeOf(rBlob));
    end
    else
      SetCheckInfo(AColumn, PByte(ABuff), ADataLen);
    try
      CheckColumnConstraints;
    finally
      SetCheckInfo(-1, nil, 0);
    end;
  end;

  procedure ProcessFixedLength(ATypeLen: LongWord);
  begin
    if (ADataLen <> 0) and (ADataLen <> ATypeLen) then
      ErrorFixedLenDataMismatch(ATypeLen);
    if not lFetching then
      ValidateValue;
  end;

  procedure ProcessVarLength;
  begin
    if ADataLen > oCol.Size then
      if Table.StrsTrim2Len then
        ADataLen := oCol.Size
      else
        ErrorVarLenDataMismatch;
    if not lFetching then
      ValidateValue;
  end;

  function RoundTime(AValue: Integer; AScale: Integer): Integer;
  var
    iRem: Integer;
  begin
    // Special case - MSSQL scale for DATETIME
    if AScale = 3 then begin
      iRem := AValue mod 10;
      case iRem of
      1:       Result := AValue - iRem;
      2, 4:    Result := AValue - iRem + 3;
      5, 6, 8: Result := AValue - iRem + 7;
      9:       Result := AValue + 1;
      else     Result := AValue; // 0, 3, 7
      end;
    end
    // Special case - MSSQL scale for SMALLDATETIME
    else if AScale = 60000 then begin
      iRem := AValue mod AScale;
      if iRem < AScale div 2 - 1 then
        Result := AValue - iRem
      else
        Result := AValue - iRem + AScale;
    end
    // Else just truncate value
    else
      Result := AValue - AValue mod AScale;
  end;

  function RoundDateTime(AValue: TDateTimeAlias; AScale: Integer): TDateTimeAlias;
  var
    dRem: Double;
  begin
    if AScale = 3 then begin
      dRem := AValue - Trunc(AValue / 10.0) * 10.0;
      case Trunc(dRem) of
      1:       Result := AValue - dRem;
      2, 4:    Result := AValue - dRem + 3.0;
      5, 6, 8: Result := AValue - dRem + 7.0;
      9:       Result := AValue + 1.0;
      else     Result := AValue; // 0, 3, 7
      end;
    end
    // Special case - MSSQL scale for SMALLDATETIME
    else if AScale = 60000 then begin
      dRem := AValue - Trunc(AValue / AScale) * AScale;
      if dRem < AScale / 2.0 - 1 then
        Result := AValue - dRem
      else
        Result := AValue - dRem + AScale;
    end
    // Else just truncate value
    else
      Result := Trunc(AValue / AScale) * AScale;
  end;

  procedure RoundTimeStamp(var AValue: TSQLTimeStamp; AScale: Integer);
  var
    iTime: Integer;
  begin
    if AScale = 1000 then
      AValue.Fractions := 0
    // Special case - MSSQL scale for DATETIME or SMALLDATETIME
    else if (AScale = 3) or (AScale = 60000) then begin
      iTime := RoundTime(FDSQLTimeStamp2Time(AValue), AScale);
      AValue.Fractions := iTime mod 1000;
      AValue.Second := (iTime div 1000) mod 60;
      AValue.Minute := (iTime div (1000 * 60)) mod 60;
      AValue.Hour := iTime div (1000 * 60 * 60);
                                              
    end
    else if AScale < 1000 then
      AValue.Fractions := AValue.Fractions - AValue.Fractions mod Cardinal(AScale)
    else if AScale < 60000 then begin
      AValue.Fractions := 0;
      AValue.Second := AValue.Second - AValue.Second mod (AScale div 1000);
    end;
  end;

  procedure RoundTimeInterval(var AValue: TFDSQLTimeInterval; AScale: Integer);
  begin
    if AScale = 1000 then
      AValue.Fractions := 0
    else if AScale < 1000 then
      AValue.Fractions := AValue.Fractions - AValue.Fractions mod Cardinal(AScale)
    else if AScale < 60000 then begin
      AValue.Fractions := 0;
      AValue.Seconds := AValue.Seconds - AValue.Seconds mod Cardinal(AScale div 1000);
    end;
  end;

begin
  ASSERT(Self <> nil);
  oCols := Table.Columns;
  ASSERT(Length(oCols.FDataOffsets) <> 0);
  oCol := oCols.ItemsI[AColumn];

  pBuff := CheckWrite(AColumn, AVersion);
  if pBuff = nil then
    Exit;
  pSrc := PByte(pBuff) + oCols.DataOffsets[AColumn];
  lIsNull := (ABuff = nil);
  lFetching := Table.DataHandleMode in [lmHavyFetching, lmFetching, lmRefreshing];

  if caBlobData in oCol.Attributes then begin
    if not lFetching then
      ValidateValue;
    SetBlobData(pBuff, AColumn, ABuff, ADataLen);
    if lFetching then
      SetFetched(AColumn, True);
  end
  else begin
    case oCol.DataType of
    dtBoolean:
      begin
        ProcessFixedLength(SizeOf(WordBool));
        if ABuff <> nil then
          PWordBool(pSrc)^ := PWordBool(ABuff)^
        else
          PWordBool(pSrc)^ := False;
      end;
    dtSByte:
      begin
        ProcessFixedLength(SizeOf(ShortInt));
        if ABuff <> nil then
          PShortInt(pSrc)^ := PShortInt(ABuff)^
        else
          PShortInt(pSrc)^ := 0;
      end;
    dtInt16:
      begin
        ProcessFixedLength(SizeOf(SmallInt));
        if ABuff <> nil then
          PSmallInt(pSrc)^ := PSmallInt(ABuff)^
        else
          PSmallInt(pSrc)^ := 0;
      end;
    dtInt32:
      begin
        ProcessFixedLength(SizeOf(Integer));
        if ABuff <> nil then
          PInteger(pSrc)^ := PInteger(ABuff)^
        else
          PInteger(pSrc)^ := 0;
      end;
    dtInt64:
      begin
        ProcessFixedLength(SizeOf(Int64));
        if ABuff <> nil then
          PInt64(pSrc)^ := PInt64(ABuff)^
        else
          PInt64(pSrc)^ := 0;
      end;
    dtByte:
      begin
        ProcessFixedLength(SizeOf(Byte));
        if ABuff <> nil then
          PByte(pSrc)^ := PByte(ABuff)^
        else
          PByte(pSrc)^ := 0;
      end;
    dtUInt16:
      begin
        ProcessFixedLength(SizeOf(Word));
        if ABuff <> nil then
          PWord(pSrc)^ := PWord(ABuff)^
        else
          PWord(pSrc)^ := 0;
      end;
    dtUInt32:
      begin
        ProcessFixedLength(SizeOf(Cardinal));
        if ABuff <> nil then
          PCardinal(pSrc)^ := PCardinal(ABuff)^
        else
          PCardinal(pSrc)^ := 0;
      end;
    dtUInt64:
      begin
        ProcessFixedLength(SizeOf(UInt64));
        if ABuff <> nil then
          PUInt64(pSrc)^ := PUInt64(ABuff)^
        else
          PUInt64(pSrc)^ := 0;
      end;
    dtSingle:
      begin
        ProcessFixedLength(SizeOf(Single));
        if ABuff <> nil then
          PSingle(pSrc)^ := PSingle(ABuff)^
        else
          PSingle(pSrc)^ := 0.0;
      end;
    dtDouble:
      begin
        ProcessFixedLength(SizeOf(Double));
        if ABuff <> nil then
          PDouble(pSrc)^ := PDouble(ABuff)^
        else
          PDouble(pSrc)^ := 0.0;
      end;
    dtExtended:
      begin
        ProcessFixedLength(SizeOf(Extended));
        if ABuff <> nil then
          PExtended(pSrc)^ := PExtended(ABuff)^
        else
          PExtended(pSrc)^ := 0.0;
      end;
    dtCurrency:
      begin
        ProcessFixedLength(SizeOf(Currency));
        if ABuff <> nil then
          PCurrency(pSrc)^ := PCurrency(ABuff)^
        else
          PCurrency(pSrc)^ := 0.0;
      end;
    dtBCD,
    dtFmtBCD:
      begin
        ProcessFixedLength(SizeOf(TBcd));
        if ABuff <> nil then begin
          if lFetching then
            PBcd(pSrc)^ := PBcd(ABuff)^
          else begin
            if Table.CheckPrecision and (oCol.Precision > 0) then begin
              FDBcdGetMetrics(PBcd(ABuff)^, iPrec, iScale);
              if Table.Round2Scale and (iPrec - iScale > oCol.Precision - oCol.Scale) or
                 not Table.Round2Scale and (iPrec > oCol.Precision) then
                ErrorValueOutOfRange;
            end;
            if Table.Round2Scale and (oCol.Scale > 0) then
              PBcd(pSrc)^ := BCDRoundTo(PBcd(ABuff)^, - oCol.Scale)
            else
              PBcd(pSrc)^ := PBcd(ABuff)^;
          end;
        end
        else
          PBcd(pSrc)^ := NullBcd;
      end;
    dtDateTime:
      begin
        ProcessFixedLength(SizeOf(TDateTimeRec));
        if ABuff <> nil then
          if not lFetching and Table.Round2Scale and (oCol.Scale > 0) then
            PDateTimeRec(pSrc)^.DateTime := RoundDateTime(PDateTimeRec(ABuff)^.DateTime, oCol.Scale)
          else
            PDateTimeRec(pSrc)^ := PDateTimeRec(ABuff)^
        else
          PDateTimeRec(pSrc)^.DateTime := 0.0;
      end;
    dtDateTimeStamp:
      begin
        ProcessFixedLength(SizeOf(TSQLTimeStamp));
        if ABuff <> nil then begin
          PSQLTimeStamp(pSrc)^ := PSQLTimeStamp(ABuff)^;
          if not lFetching and Table.Round2Scale and (oCol.Scale > 0) then
            RoundTimeStamp(PSQLTimeStamp(pSrc)^, oCol.Scale);
        end
        else
          PSQLTimeStamp(pSrc)^ := NullSQLTimeStamp;
      end;
    dtTimeIntervalFull,
    dtTimeIntervalYM,
    dtTimeIntervalDS:
      begin
        ProcessFixedLength(SizeOf(TFDSQLTimeInterval));
        if ABuff <> nil then begin
          PFDSQLTimeInterval(pSrc)^ := PFDSQLTimeInterval(ABuff)^;
          if not lFetching and Table.Round2Scale and (oCol.Scale > 0) then
            RoundTimeInterval(PFDSQLTimeInterval(pSrc)^, oCol.Scale);
        end
        else
          FillChar(PFDSQLTimeInterval(pSrc)^, SizeOf(TFDSQLTimeInterval), 0);
      end;
    dtTime:
      begin
        ProcessFixedLength(SizeOf(Integer));
        if ABuff <> nil then
          if not lFetching and Table.Round2Scale and (oCol.Scale > 0) then
            PInteger(pSrc)^ := RoundTime(PInteger(ABuff)^, oCol.Scale)
          else
            PInteger(pSrc)^ := PInteger(ABuff)^
        else
          PInteger(pSrc)^ := 0;
      end;
    dtDate:
      begin
        ProcessFixedLength(SizeOf(Integer));
        if ABuff <> nil then
          PInteger(pSrc)^ := PInteger(ABuff)^
        else
          PInteger(pSrc)^ := 0;
      end;
    dtAnsiString:
      begin
        ProcessVarLength;
        if ABuff <> nil then begin
          PWord(pSrc)^ := Word(ADataLen);
          Move(ABuff^, (pSrc + SizeOf(Word))^, ADataLen * SizeOf(TFDAnsiChar));
          (pSrc + SizeOf(Word) + ADataLen * SizeOf(TFDAnsiChar))^ := 0;
        end
        else begin
          PWord(pSrc)^ := 0;
          (pSrc + SizeOf(Word))^ := 0;
        end;
      end;
    dtByteString:
      begin
        ProcessVarLength;
        if ABuff <> nil then begin
          PWord(pSrc)^ := Word(ADataLen);
          Move(ABuff^, (pSrc + SizeOf(Word))^, ADataLen);
        end
        else
          PWord(pSrc)^ := 0;
      end;
    dtWideString:
      begin
        ProcessVarLength;
        if ABuff <> nil then begin
          PWord(pSrc)^ := Word(ADataLen);
          Move(ABuff^, (pSrc + SizeOf(Word))^, ADataLen * SizeOf(WideChar));
          pCh := pSrc + SizeOf(Word) + ADataLen * SizeOf(WideChar);
          pCh^ := 0;
          (pCh + 1)^ := 0;
        end
        else begin
          PWord(pSrc)^ := 0;
          pCh := PByte(pSrc) + SizeOf(Word);
          pCh^ := 0;
          (pCh + 1)^ := 0;
        end;
      end;
    dtGUID:
      begin
        ProcessFixedLength(SizeOf(TGUID));
        if ABuff <> nil then
          PGUID(pSrc)^ := PGUID(ABuff)^
        else
          PGUID(pSrc)^ := GUID_NULL;
      end;
    dtObject:
      begin
        ProcessFixedLength(SizeOf(IFDDataStoredObject));
        if ABuff <> nil then
          PFDDataStoredObject(pSrc)^ := PFDDataStoredObject(ABuff)^
        else
          PFDDataStoredObject(pSrc)^ := nil;
      end;
    dtRowSetRef,
    dtCursorRef,
    dtRowRef,
    dtArrayRef,
    dtParentRowRef:
      if ABuff <> nil then
        ErrorCantOperateInvObj;
    end;
    SetIsNull(pBuff, AColumn, lIsNull);
    if lFetching then
      SetFetched(AColumn, True);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetData(AColumn: Integer; ABuff: Pointer; ADataLen: LongWord);
begin
  InternalSetData(AColumn, rvDefault, ABuff, ADataLen);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.BeginDirectWriteBlob(AColumn: Integer; ABlobLen: Integer): PByte;
var
  pBuff: PByte;
  [unsafe] oCol: TFDDatSColumn;

  procedure ErrorColMBBlob;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ColMBBLob, [oCol.Name]);
  end;

begin
  ASSERT(Self <> nil);
  oCol := Table.Columns.ItemsI[AColumn];
  if not (caBlobData in oCol.Attributes) then
    ErrorColMBBlob;
  pBuff := CheckWrite(AColumn, rvDefault);
  Result := SetBlobData(pBuff, AColumn, nil, ABlobLen);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.EndDirectWriteBlob(AColumn: Integer; AFinalBlobLen: Integer = -1);
var
  pBuff: PByte;
begin
  if AFinalBlobLen <> -1 then begin
    pBuff := CheckWrite(AColumn, rvDefault);
    SetBlobData(pBuff, AColumn, nil, AFinalBlobLen, True);
  end;
  if Table.DataHandleMode in [lmHavyFetching, lmFetching, lmRefreshing] then
    SetFetched(AColumn, True);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetData(AColumn: TFDDatSColumn; const AValue: Variant);
begin
  SetData(AColumn.Index, AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetData(AColumn: Integer; const AValue: Variant);
const
  SFloatFmt = '0.##################';
var
  iLen: Integer;
  pData: Pointer;
  L: WordBool;
  iSB: ShortInt;
  i16: SmallInt;
  i32: Integer;
  i64: Int64;
  iB: Byte;
  iU16: Word;
  iU32: Cardinal;
  iU64: UInt64;
  F: Single;
  D: Double;
  E: Extended;
  C: Currency;
  rBCD: TBcd;
  T: TSQLTimeStamp;
  TI: TFDSQLTimeInterval;
  DT: TDateTime;
  MS: TDateTimeRec;
  SB: TFDByteString;
  S: String;
  lUnlock: Boolean;
  rGUID: TGUID;

  procedure TypeIncompatError(E: EVariantTypeCastError);
  var
    s: String;
  begin
    try
      s := AValue;
    except
      s := '<unknown>';
    end;
    FDException(Self, [S_FD_LDatS], er_FD_TypeIncompat,
      [s, Table.Columns.ItemsI[AColumn].Name, E.Message]);
  end;

begin
  iLen := 0;
  pData := nil;
  lUnlock := False;
  try
    try
      if not VarIsNull(AValue) and not VarIsEmpty(AValue) then
        case Table.Columns.ItemsI[AColumn].DataType of
        dtBoolean:
          begin
            L := AValue;
            pData := @L;
          end;
        dtSByte:
          begin
            iSB := AValue;
            pData := @iSB;
          end;
        dtInt16:
          begin
            i16 := AValue;
            pData := @i16;
          end;
        dtInt32:
          begin
            i32 := AValue;
            pData := @i32;
          end;
        dtInt64:
          begin
            i64 := AValue;
            pData := @i64;
          end;
        dtByte:
          begin
            iB := AValue;
            pData := @iB;
          end;
        dtUInt16:
          begin
            iU16 := AValue;
            pData := @iU16;
          end;
        dtUInt32:
          begin
            iU32 := AValue;
            pData := @iU32;
          end;
        dtUInt64:
          begin
            iU64 := AValue;
            pData := @iU64;
          end;
        dtSingle:
          begin
            F := AValue;
            pData := @F;
          end;
        dtDouble:
          begin
            D := AValue;
            pData := @D;
          end;
        dtExtended:
          begin
            E := AValue;
            pData := @E;
          end;
        dtCurrency:
          begin
            C := AValue;
            pData := @C;
          end;
        dtBCD,
        dtFmtBCD:
          begin
            case TVarData(AValue).VType of
              varSingle:
                rBCD := StrToBcd(FormatFloat(SFloatFmt, TVarData(AValue).VSingle));
              varDouble:
                rBCD := StrToBcd(FormatFloat(SFloatFmt, TVarData(AValue).VDouble));
              else
                rBCD := VarToBcd(AValue);
            end;
            pData := @rBCD;
          end;
        dtDateTime:
          begin
            DT := VarAsType(AValue, varDate);
            MS.DateTime := FDDateTime2MSecs(DT);
            pData := @MS;
          end;
        dtDateTimeStamp:
          begin
            T := VarToSQLTimeStamp(AValue);
            pData := @T;
          end;
        dtTimeIntervalFull,
        dtTimeIntervalYM,
        dtTimeIntervalDS:
          begin
            TI := FDVar2SQLTimeInterval(AValue);
            pData := @TI;
          end;
        dtTime:
          begin
            i32 := FDSQLTimeStamp2Time(VarToSQLTimeStamp(AValue));
            pData := @i32;
          end;
        dtDate:
          begin
            i32 := FDSQLTimeStamp2Date(VarToSQLTimeStamp(AValue));
            pData := @i32;
          end;
        dtByteString,
        dtAnsiString,
        dtMemo,
        dtHMemo,
        dtBlob,
        dtHBlob,
        dtHBFile:
          if VarIsArray(AValue) then begin
            pData := VarArrayLock(AValue);
            lUnlock := True;
            iLen := VarArrayHighBound(AValue, 1) + 1;
          end
          else begin
            SB := TFDEncoder.Enco(AValue, ecANSI);
            pData := PByte(SB);
            iLen := TFDEncoder.EncoLength(SB, ecANSI);
          end;
        dtWideString,
        dtWideMemo,
        dtWideHMemo,
        dtXML:
          begin
            S := AValue;
            pData := PWideChar(S);
            iLen := Length(S);
          end;
        dtRowSetRef,
        dtCursorRef,
        dtRowRef,
        dtArrayRef,
        dtParentRowRef:
          pData := nil;
        dtGUID:
          if VarIsArray(AValue) then begin
            pData := VarArrayLock(AValue);
            lUnlock := True;
            iLen := VarArrayHighBound(AValue, 1) + 1;
          end
          else begin
            S := AValue;
            rGUID := StringToGUID(S);
            pData := @rGUID;
            iLen := SizeOf(rGUID);
          end;
        dtObject:
          if VarType(AValue) = varUnknown then
            pData := @(TVarData(AValue).VUnknown);
        end;
      SetData(AColumn, pData, iLen);
    except
      on E: EVariantTypeCastError do
        TypeIncompatError(E);
    end;
  finally
    if lUnlock then
      VarArrayUnlock(AValue);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetValues(const AValues: array of Variant);
var
  i: Integer;
begin
  for i := Low(AValues) to High(AValues) do
    if not VarIsEmpty(AValues[i]) then
      SetData(i, AValues[i]);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetValues(const ANames: String; const AValue: Variant);
var
  i, j: Integer;
begin
  if Pos(';', ANames) = 0 then
    SetData(Table.Columns.ItemsS[ANames], AValue)
  else begin
    i := 1;
    j := 0;
    while i <= Length(ANames) do begin
      SetData(Table.Columns.ItemsS[FDExtractFieldName(ANames, i)], AValue[j]);
      Inc(j);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetIsNull(ABuffer: PByte; AColumn: Integer; AValue: Boolean);
var
  [unsafe] oCols: TFDDatSColumnList;
  pNullsByte: PByte;
begin
  oCols := Table.Columns;
  ASSERT((AColumn >= 0) and (AColumn < oCols.Count));
  pNullsByte := PByte(PByte(ABuffer) + oCols.NullOffsets[AColumn]);
  if AValue then
    pNullsByte^ := pNullsByte^ and not oCols.NullMasks[AColumn]
  else
    pNullsByte^ := pNullsByte^ or oCols.NullMasks[AColumn];
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetAsString(const AColumn: String): String;
begin
  Result := VarToStr(GetDataS(AColumn));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetAsString(const AColumn, AValue: String);
begin
  SetDataS(AColumn, AValue);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetFetched(const AColumn: Integer): Boolean;
begin
  ASSERT((AColumn >= 0) and (AColumn < Table.Columns.Count));
  Result := (PByte(FpInfo + AColumn div 8)^
    and (1 shl (AColumn mod 8))) <> 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetFetched(const AColumn: Integer; const AValue: Boolean);
var
  pFetchedByte: PByte;
begin
  ASSERT((AColumn >= 0) and (AColumn < Table.Columns.Count));
  pFetchedByte := PByte(FpInfo + AColumn div 8);
  if AValue then
    pFetchedByte^ := pFetchedByte^ or Byte(1 shl (AColumn mod 8))
  else
    pFetchedByte^ := pFetchedByte^ and not Byte(1 shl (AColumn mod 8));
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetRowError: EFDException;
var
  pInfo: PFDDataRowExtraInfo;
begin
  pInfo := GetRowInfo(False);
  if pInfo <> nil then
    Result := pInfo^.FRowException
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.SetRowError(const AValue: EFDException): Boolean;
var
  pInfo: PFDDataRowExtraInfo;
begin
  Result := False;
  pInfo := GetRowInfo(AValue <> nil);
  if pInfo <> nil then begin
    if pInfo^.FRowException <> nil then begin
      Result := True;
      FDFreeAndNil(pInfo^.FRowException);
    end;
    if AValue <> nil then
      AValue.Duplicate(pInfo^.FRowException)
    else
      CheckNoInfo;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetRowErrorPrc(const AValue: EFDException);
begin
  SetRowError(AValue);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DBLock(ALockID: LongWord = $FFFFFFFF);
var
  pInfo: PFDDataRowExtraInfo;
begin
  pInfo := GetRowInfo(True);
  if pInfo^.FLockID <> 0 then
    FDException(Self, [S_FD_LDatS], er_FD_RecLocked, []);
  pInfo^.FLockID := ALockID;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DBUnlock;
var
  pInfo: PFDDataRowExtraInfo;
begin
  pInfo := GetRowInfo(False);
  if pInfo <> nil then begin
    if pInfo^.FLockID = 0 then
      FDException(Self, [S_FD_LDatS], er_FD_RecNotLocked, []);
    pInfo^.FLockID := 0;
    CheckNoInfo;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetDBLockID: LongWord;
var
  pInfo: PFDDataRowExtraInfo;
begin
  pInfo := GetRowInfo(False);
  if pInfo <> nil then
    Result := pInfo^.FLockID
  else
    Result := 0;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetParentRow: TFDDatSRow;
  procedure ErrorRowIsNotNested;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_RowIsNotNested, []);
  end;
var
  oCols: TFDDatSColumnList;
begin
  oCols := Table.Columns;
  if oCols.ParentRowRefCol = -1 then
    ErrorRowIsNotNested;
  Result := GetInvariantObject(oCols.ParentRowRefCol) as TFDDatSRow;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetParentRow(const ARow: TFDDatSRow);
  procedure ErrorRowIsNotNested;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_RowIsNotNested, []);
  end;
  procedure ErrorCantSetParentRow;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantSetParentRow, []);
  end;
var
  oCols: TFDDatSColumnList;
  oManager: TFDDatSManager;
  oRel: TFDDatSRelation;
  oParentCol: TFDDatSColumn;
  oParentRow: TFDDatSRow;
begin
  oCols := Table.Columns;
  oManager := Table.Manager;
  if (oCols.ParentRowRefCol = -1) or (oManager = nil) then
    ErrorRowIsNotNested;
  if ARow = nil then begin
    oParentRow := TFDDatSRow(GetInvariantObject(oCols.ParentRowRefCol));
    if oParentRow = nil then
      Exit;
    oRel := oManager.Relations.FindRelation(oParentRow.Table, Table, True);
  end
  else begin
    oParentRow := TFDDatSRow(GetInvariantObject(oCols.ParentRowRefCol));
    if oParentRow = ARow then
      Exit;
    oRel := oManager.Relations.FindRelation(ARow.Table, Table, True);
  end;
  if (oParentRow <> nil) and (ARow <> nil) or
     (oRel = nil) or
     (ARow <> nil) and (oRel.ParentTable <> ARow.Table) then
    ErrorCantSetParentRow;
  oParentCol := oRel.ParentColumns[0];
  if (RowState <> rsDestroying) and ((oParentRow = nil) or (oParentRow.RowState <> rsDestroying)) then begin
    CheckWrite(oCols.ParentRowRefCol, rvDefault);
    if ARow = nil then
      oParentRow.CheckWrite(oParentCol.Index, rvDefault)
    else
      ARow.CheckWrite(oParentCol.Index, rvDefault);
  end;
  SetInvariantObject(oCols.ParentRowRefCol, ARow);
  case oParentCol.DataType of
  dtRowSetRef,
  dtCursorRef:
    if ARow = nil then
      TFDDatSNestedRowList(oParentRow.GetInvariantObject(oParentCol.Index)).Remove(Self)
    else
      TFDDatSNestedRowList(ARow.GetInvariantObject(oParentCol.Index)).Add(Self);
  dtRowRef,
  dtArrayRef:
    if ARow = nil then
      oParentRow.SetInvariantObject(oParentCol.Index, nil)
    else
      ARow.SetInvariantObject(oParentCol.Index, Self);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetNestedRow(const AColumn: Integer): TFDDatSRow;
var
  [unsafe] oCol: TFDDatSColumn;

  procedure ErrorColIsNotRef;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ColumnIsNotRef, [oCol.Name]);
  end;

begin
  oCol := Table.Columns.ItemsI[AColumn];
  if not (oCol.DataType in [dtRowRef, dtArrayRef]) then
    ErrorColIsNotRef;
  Result := GetInvariantObject(AColumn) as TFDDatSRow;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SetNestedRow(const AColumn: Integer; const ARow: TFDDatSRow);
var
  [unsafe] oCol: TFDDatSColumn;

  procedure ErrorColIsNotRef;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ColumnIsNotRef, [oCol.Name]);
  end;

begin
  oCol := Table.Columns.ItemsI[AColumn];
  if not (oCol.DataType in [dtRowRef, dtArrayRef]) then
    ErrorColIsNotRef;
  ARow.SetParentRow(Self);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.GetNestedRows(const AColumn: Integer): TFDDatSNestedRowList;
var
  [unsafe] oCol: TFDDatSColumn;

  procedure ErrorColIsNotSetRef;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_ColumnIsNotSetRef, [oCol.Name]);
  end;

begin
  oCol := Table.Columns.ItemsI[AColumn];
  if not (oCol.DataType in [dtRowSetRef, dtCursorRef]) then
    ErrorColIsNotSetRef;
  Result := GetInvariantObject(AColumn) as TFDDatSNestedRowList;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.ConstrainChildRow(AProposedState: TFDDatSRowState);
  procedure ErrorRowCantInsert;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_RowCantBeInserted, []);
  end;
var
  oParentRow: TFDDatSRow;
begin
  if not (Table.DataHandleMode in [lmStandard, lmRefreshing]) or
     (Table.Columns.ParentRowRefCol = -1) then
    Exit;
  oParentRow := ParentRow;
  if AProposedState = rsInserted then
    if (oParentRow = nil) or (oParentRow.RowState in [rsInitializing, rsDetached, rsDeleted]) then
      ErrorRowCantInsert;
  if (oParentRow <> nil) and (oParentRow.RowState = rsUnchanged) then
    oParentRow.BeginEdit;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.ProcessNestedRows(AMethod: TFDDatSProcessNestedRowsMethod);
var
  oCols: TFDDatSColumnList;
  oNestedRows: TFDDatSNestedRowList;
  oNestedRow: TFDDatSRow;
  i, j: Integer;
begin
  oCols := Table.Columns;
  if ctInvars in oCols.FHasThings then
    for i := 0 to oCols.Count - 1 do
      case oCols.ItemsI[i].DataType of
      dtRowSetRef, dtCursorRef:
        begin
          oNestedRows := NestedRows[i];
          for j := oNestedRows.Count - 1 downto 0 do begin
            oNestedRow := oNestedRows.ItemsI[j];
            if oNestedRow <> nil then
              AMethod(oNestedRow);
          end;
        end;
      dtRowRef, dtArrayRef:
        begin
          oNestedRow := NestedRow[i];
          if oNestedRow <> nil then
            AMethod(oNestedRow);
        end;
      end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoNRDelete(ARow: TFDDatSRow);
begin
  ARow.Delete;
end;

procedure TFDDatSRow.DoNRDetache(ARow: TFDDatSRow);
begin
  ARow.Delete(True);
end;

procedure TFDDatSRow.DoNREndModify(ARow: TFDDatSRow);
begin
  case ARow.RowState of
  rsEditing:  ARow.EndEdit;
  rsInitializing,
  rsDetached: ARow.Table.Rows.Add(ARow);
  end;
end;

procedure TFDDatSRow.ConstrainParentRow(AProposedState: TFDDatSRowState);
begin
  if not (Table.DataHandleMode in [lmStandard, lmRefreshing, lmMove, lmHavyMove]) then
    Exit;
  case AProposedState of
  rsInitializing,
  rsDetached:     ProcessNestedRows(DoNRDetache);
  rsDeleted:      ProcessNestedRows(DoNRDelete);
  rsInserted,
  rsModified:     ProcessNestedRows(DoNREndModify);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoNRCancel(ARow: TFDDatSRow);
begin
  if ARow.RowState = rsEditing then
    ARow.CancelEdit;
end;

procedure TFDDatSRow.CancelNestedRows;
begin
  ProcessNestedRows(DoNRCancel);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoNRFree(ARow: TFDDatSRow);
begin
  FDFree(ARow);
end;

procedure TFDDatSRow.ClearNestedRows;
begin
  ProcessNestedRows(DoNRFree);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoNRAcceptChanges(ARow: TFDDatSRow);
begin
  ARow.AcceptChanges;
end;

procedure TFDDatSRow.AcceptNestedChanges;
begin
  ProcessNestedRows(DoNRAcceptChanges);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoNRClearErrors(ARow: TFDDatSRow);
begin
  ARow.ClearErrors;
end;

procedure TFDDatSRow.ClearNestedErrors;
begin
  ProcessNestedRows(DoNRClearErrors);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.DoNRRejectChanges(ARow: TFDDatSRow);
begin
  ARow.RejectChanges;
end;

procedure TFDDatSRow.RejectNestedChanges;
begin
  ProcessNestedRows(DoNRRejectChanges);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.DumpCol(AColumn: Integer; AWithColNames: Boolean;
  AVersion: TFDDatSRowVersion): String;
var
  eType: TFDDataType;
  oNestRow: TFDDatSRow;
  V: Variant;
begin
  eType := Table.Columns[AColumn].DataType;
  case eType of
  dtRowSetRef:
    Result := '<rowset>';
  dtCursorRef:
    Result := '<cursor>';
  dtRowRef,
  dtArrayRef:
    begin
      oNestRow := NestedRow[AColumn];
      if oNestRow = nil then
        Result := '<nil>'
      else
        Result := '(' + oNestRow.DumpRow(AWithColNames and (eType <> dtArrayRef), AVersion) + ')';
    end;
  dtParentRowRef:
    Result := '<parent>';
  else
    V := GetData(AColumn, AVersion);
    if VarIsNull(V) then
      Result := '<null>'
    else if eType in [dtDateTime, dtDateTimeStamp] then
      Result := SQLTimeStampToStr('yyyy-mm-dd hh:nn:ss.zzz', VarToSQLTimeStamp(V))
    else if eType <> dtTime then
      Result := VarToStr(V)
    else
      Result := TimeToStr(VarAsType(V, varDate));
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRow.DumpRow(AWithColNames: Boolean; AVersion: TFDDatSRowVersion): String;
var
  i: Integer;
begin
  if AWithColNames then
    Result := Table.Name + ': '
  else
    Result := '';
  for i := 0 to Table.Columns.Count - 1 do begin
    if i > 0 then
      Result := Result + '; ';
    if AWithColNames then
      Result := Result + Table.Columns[i].Name + ': ';
    Result := Result + DumpCol(i, AWithColNames, AVersion);
  end;
end;

{-------------------------------------------------------------------------------}
class function TFDDatSRow.GetStreamingName(const AStorage: IFDStanStorage): String;
begin
  if (AStorage <> nil) and
     (AStorage.StreamVersion <= 4) and (AStorage.StreamVersion > 2) then
    Result := 'DatSRow'
  else
    Result := 'Row';
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.LoadRowVersion(const AStorage: IFDStanStorage; const AName: String;
  var ABuff: PByte; ABuffKind: TFDDatSRowState);
var
  iPriorRowState: TFDDatSRowState;

  procedure LoadTypes(ATypes: TFDDataTypes);
  var
    i: Integer;
    pBuff: Pointer;
    iLen: Cardinal;
    [unsafe] oCols: TFDDatSColumnList;
    [unsafe] oCol: TFDDatSColumn;
  begin
    oCols := Table.Columns;
    for i := 0 to oCols.Count - 1 do begin
      oCol := oCols.ItemsI[i];
      if (oCol.DataType in ATypes) and
         AStorage.ReadValue(oCol.Name, i, oCol.DataType, pBuff, iLen) then
        SetData(i, pBuff, iLen);
    end;
  end;

  procedure LoadInvars;
  var
    i: Integer;
    pBuff: Pointer;
    iLen: Cardinal;
    [unsafe] oCols: TFDDatSColumnList;
    [unsafe] oCol: TFDDatSColumn;
  begin
    oCols := Table.Columns;
    for i := 0 to oCols.Count - 1 do begin
      oCol := oCols.ItemsI[i];
      if (oCol.DataType = dtParentRowRef) and
         AStorage.ReadValue(oCol.Name, i, oCol.DataType, pBuff, iLen) then
        InternalSetInvariantObject(i, PCardinal(pBuff)^);
    end;
  end;

begin
  if not AStorage.TestAndReadObjectBegin(AName, osObject) then begin
    if ABuff <> nil then
      FreeBuffer(ABuff);
    Exit;
  end;
  iPriorRowState := RowState;
  FRowState := ABuffKind;
  try
    if ABuff <> nil then
      CleanupBuffer(ABuff)
    else
      ABuff := AllocBuffer;
    LoadTypes(C_FD_AllTypes - C_FD_InvariantDataTypes - C_FD_LateSerTypes);
    if (ctInvars in Table.Columns.HasThings) and (AStorage.StreamVersion >= 15) then
      LoadInvars;
    if ctLateSer in Table.Columns.HasThings then
      LoadTypes(C_FD_LateSerTypes);
  finally
    FRowState := iPriorRowState;
    AStorage.ReadObjectEnd(AName, osObject);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.InternalLoadFromStorage(const AStorage: IFDStanStorage);
begin
  FRowID := AStorage.ReadLongWord('RowID', $FFFFFFFF);
  FRowState := TFDDatSRowState(AStorage.ReadEnum('RowState',
    TypeInfo(TFDDatSRowState), Integer(rsUnchanged)));
  FRowPriorState := TFDDatSRowState(AStorage.ReadEnum('RowPriorState',
    TypeInfo(TFDDatSRowState), Integer(rsDetached)));
  if AStorage.TestAndReadObjectBegin('Exception', osObject) then
    try
      RowError := AStorage.LoadObject as EFDException;
    finally
      AStorage.ReadObjectEnd('Exception', osObject);
    end;
  LoadRowVersion(AStorage, 'Original', FpOriginal, rsImportingOriginal);
  LoadRowVersion(AStorage, 'Current', FpCurrent, rsImportingCurent);
  LoadRowVersion(AStorage, 'Proposed', FpProposed, rsImportingProposed);
                                        
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.SaveRowVersion(const AStorage: IFDStanStorage; const AName: String;
  ABuff: PByte; ABuffKind: TFDDatSRowState);
var
  iPriorRowState: TFDDatSRowState;

  procedure WriteTypes(ATypes: TFDDataTypes);
  var
    i: Integer;
    pBuff: Pointer;
    iLen: LongWord;
    [unsafe] oCols: TFDDatSColumnList;
    [unsafe] oCol: TFDDatSColumn;
  begin
    oCols := Table.Columns;
    for i := 0 to oCols.Count - 1 do begin
      pBuff := nil;
      iLen := 0;
      oCol := oCols.ItemsI[i];
      if (oCol.DataType in ATypes) and GetData(i, rvDefault, pBuff, 0, iLen, False) then
        AStorage.WriteValue(oCol.Name, i, oCol.DataType, pBuff, iLen);
    end;
  end;

  procedure WriteInvars;
  var
    i: Integer;
    [unsafe] oCols: TFDDatSColumnList;
    [unsafe] oCol: TFDDatSColumn;
    iRowID: Cardinal;
  begin
    oCols := Table.Columns;
    for i := 0 to oCols.Count - 1 do begin
      oCol := oCols.ItemsI[i];
      if (oCol.DataType = dtParentRowRef) and (ParentRow <> nil) then begin
        iRowID := ParentRow.RowID;
        AStorage.WriteValue(oCol.Name, i, oCol.DataType, @iRowID, SizeOf(iRowID));
      end;
    end;
  end;

begin
  AStorage.WriteObjectBegin(AName, osObject);
  iPriorRowState := RowState;
  FRowState := ABuffKind;
  try
    WriteTypes(C_FD_AllTypes - C_FD_InvariantDataTypes - C_FD_LateSerTypes);
    if (ctInvars in Table.Columns.HasThings) and (AStorage.StreamVersion >= 15) then
      WriteInvars;
    if ctLateSer in Table.Columns.HasThings then
      WriteTypes(C_FD_LateSerTypes);
  finally
    FRowState := iPriorRowState;
    AStorage.WriteObjectEnd(AName, osObject);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRow.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  AStorage.WriteLongWord('RowID', Integer(RowID), $FFFFFFFF);
  AStorage.WriteEnum('RowState', TypeInfo(TFDDatSRowState),
    Integer(RowState), Integer(rsUnchanged));
  AStorage.WriteEnum('RowPriorState', TypeInfo(TFDDatSRowState),
    Integer(RowPriorState), Integer(rsDetached));
  if FExtraInfo <> nil then begin
    AStorage.WriteObjectBegin('Exception', osObject);
    try
      AStorage.SaveObject(FExtraInfo^.FRowException);
    finally
      AStorage.WriteObjectEnd('Exception', osObject);
    end;
  end;
  if FpOriginal <> nil then SaveRowVersion(AStorage, 'Original', FpOriginal, rsImportingOriginal);
  if FpCurrent <> nil then  SaveRowVersion(AStorage, 'Current', FpCurrent, rsImportingCurent);
  if FpProposed <> nil then SaveRowVersion(AStorage, 'Proposed', FpProposed, rsImportingProposed);
                                        
end;

{-------------------------------------------------------------------------------}
{- TFDDatSRowListBase                                                          -}
{-------------------------------------------------------------------------------}
constructor TFDDatSRowListBase.Create;
begin
  inherited Create;
  FDefaultReason := srDataChange;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  // MSGOPT nothing - just exit
  // inherited HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRowListBase.Add(ARow: TFDDatSRow): Integer;
begin
  Result := AddObject(ARow);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.AddAt(ARow: TFDDatSRow; AIndex: Integer);
begin
  AddObjectAt(ARow, AIndex);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRowListBase.GetItemsI(AIndex: Integer): TFDDatSRow;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSRow(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRowListBase.GetLast: TFDDatSRow;
begin
  ASSERT(FCount > 0);
  Result := TFDDatSRow(FArray[FCount - 1]);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.InternalSort1(L, R: Integer;
  ACompareRowsProc: TFDCompareRowsProc; AOpts: TFDCompareDataOptions);
var
  I, J: Integer;
  P, T: TFDDatSRow;
begin
  if R - L > 4 then begin
    I := (R + L) div 2;
    if ACompareRowsProc(TFDDatSRow(FArray[L]), TFDDatSRow(FArray[I]), -1, AOpts) > 0 then begin
      T := TFDDatSRow(FArray[I]);
      FArray[I] := FArray[L];
      FArray[L] := T;
    end;
    if ACompareRowsProc(TFDDatSRow(FArray[L]), TFDDatSRow(FArray[R]), -1, AOpts) > 0 then begin
      T := TFDDatSRow(FArray[R]);
      FArray[R] := FArray[L];
      FArray[L] := T;
    end;
    if ACompareRowsProc(TFDDatSRow(FArray[I]), TFDDatSRow(FArray[R]), -1, AOpts) > 0 then begin
      T := TFDDatSRow(FArray[R]);
      FArray[R] := FArray[I];
      FArray[I] := T;
    end;
    J := R - 1;
    T := TFDDatSRow(FArray[J]);
    FArray[J] := FArray[I];
    FArray[I] := T;
    I := L;
    P := TFDDatSRow(FArray[J]);
    while True do begin
      Inc(I);
      Dec(J);
      while (I <= R) and (ACompareRowsProc(TFDDatSRow(FArray[I]), P, -1, AOpts) < 0) do
        Inc(I);
      while (J >= L) and (ACompareRowsProc(TFDDatSRow(FArray[J]), P, -1, AOpts) > 0) do
        Dec(J);
      if J < I then
        Break;
      T := TFDDatSRow(FArray[J]);
      FArray[J] := FArray[I];
      FArray[I] := T;
    end;
    if I <= R then begin
      T := TFDDatSRow(FArray[R - 1]);
      FArray[R - 1] := FArray[I];
      FArray[I] := T;
    end;
    InternalSort1(L, J, ACompareRowsProc, AOpts);
    InternalSort1(I + 1, R, ACompareRowsProc, AOpts);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.InternalSort2(L, H: Integer;
  ACompareRowsProc: TFDCompareRowsProc; AOpts: TFDCompareDataOptions);
var
  I, J: Integer;
  P: TFDDatSRow;
begin
  for I := L + 1 to H do begin
    P := TFDDatSRow(FArray[I]);
    J := I;
    while (J > L) and (ACompareRowsProc(TFDDatSRow(FArray[J - 1]), P, -1, AOpts) > 0) do begin
      FArray[J] := FArray[J - 1];
      Dec(J);
    end;
    FArray[J] := P;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.InternalSort(L, R: Integer;
  ACompareRowsProc: TFDCompareRowsProc; AOpts: TFDCompareDataOptions);
begin
  InternalSort1(L, R, ACompareRowsProc, AOpts);
  InternalSort2(L, R, ACompareRowsProc, AOpts);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.Sort(ACompareRowsProc: TFDCompareRowsProc;
  AOpts: TFDCompareDataOptions);
begin
  if Count > 1 then
    InternalSort(0, Count - 1, ACompareRowsProc, AOpts);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.CheckDuplicates(ACompareRowsProc:
  TFDCompareRowsProc; AOpts: TFDCompareDataOptions);
  procedure ErrorDubRows;
  var
    sName: String;
  begin
    if (Owner <> nil) and (Owner is TFDDatSNamedObject) then
      sName := TFDDatSNamedObject(Owner).Name
    else
      sName := '';
    FDException(Self, [S_FD_LDatS], er_FD_DuplicateRows, [sName, 1]);
  end;
var
  i: Integer;
begin
  ASSERT(Assigned(ACompareRowsProc));
  AOpts := AOpts + [coNullsNotEqual] - [coNoSymbols];
  for i := 1 to Count - 1 do
    if ACompareRowsProc(ItemsI[i - 1], ItemsI[i], -1, AOpts) = 0 then
      ErrorDubRows;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.RemoveDuplicates(ACompareRowsProc:
  TFDCompareRowsProc; AColumnCount: Integer; AOpts: TFDCompareDataOptions);
var
  i: Integer;
begin
  ASSERT(Assigned(ACompareRowsProc));
  for i := Count - 1 downto 1 do
    if ACompareRowsProc(ItemsI[i - 1], ItemsI[i], AColumnCount, AOpts) = 0 then
      RemoveAt(i);
end;

{-------------------------------------------------------------------------------}
function TFDDatSRowListBase.GetValuesList(const AColumnName, ADelimiter, ANullName: String): String;
var
  i: Integer;
  v: Variant;
  s: String;
begin
  Result := '';
  for i := 0 to Count - 1 do begin
    if i > 0 then
      Result := Result + ADelimiter;
    v := ItemsI[i].GetData(AColumnName);
    if VarIsNull(v) then
      s := ANullName
    else
      s := v;
    Result := Result + s;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRowListBase.DumpCol(ACol: Integer; AWithColNames: Boolean): String;
var
  s: String;
begin
  s := Table.Columns.ItemsI[ACol].Name;
  if AWithColNames then
    Result := s + ': ';
  Result := Result + GetValuesList(s, '; ', '<null>');
end;

{-------------------------------------------------------------------------------}
class function TFDDatSRowListBase.GetStreamingName(const AStorage: IFDStanStorage): String;
begin
  if (AStorage <> nil) and (AStorage.StreamVersion <= 9) then
    Result := inherited GetStreamingName(AStorage)
  else
    Result := 'RowList';
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListBase.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  i: Integer;
  oRow: TFDDatSRow;
  lDelta: Boolean;
  iBase: Int64;
begin
  iBase := AStorage.BeginGrowthEstimation;
  lDelta := AStorage.IsStored(siDelta) and not AStorage.IsStored(siData);
  for i := 0 to Count - 1 do begin
    oRow := ItemsI[i];
    if not lDelta or (oRow.RowState in [rsModified, rsInserted, rsDeleted]) then
      AStorage.SaveObject(oRow);
    if (i = 99) and (Count >= 500) then
      AStorage.EndGrowthEstimation(iBase, Count div 100 + 1);
  end;
end;

{-------------------------------------------------------------------------------}
{ TFDDatSRowListWithAggregates                                                  }
{-------------------------------------------------------------------------------}
type
  TFDAggVals = array [0 .. 1023] of TFDDatSAggregateValue;
  PFDAggVals = ^TFDAggVals;

constructor TFDDatSRowListWithAggregates.Create;
begin
  inherited Create;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSRowListWithAggregates.Destroy;
begin
  if FAggregateValues <> nil then begin
    DeleteAggregates;
    FDFreeAndNil(FAggregateValues);
    FDFreeAndNil(FAggregateSlots);
  end;
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.RemoveAggregatesRow(ARowIndex: Integer);
var
  j: Integer;
  pAggs: PFDAggVals;
begin
  ASSERT(FAggregateValues <> nil);
  pAggs := PFDAggVals(FAggregateValues[ARowIndex]);
  if pAggs <> nil then begin
    for j := 0 to FAggregateSlotUsed - 1 do
      if pAggs^[j] <> nil then begin
        pAggs^[j].RemRef;
        pAggs^[j] := nil;
      end;
    FreeMem(pAggs, FAggregateSlotAllocated * SizeOf(TFDDatSAggregateValue));
    FAggregateValues[ARowIndex] := nil;
  end;
  FAggregateValues.Delete(ARowIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.AddAggregatesRow(ARowIndex: Integer);
var
  pAggs: PFDAggVals;
begin
  ASSERT(FAggregateValues <> nil);
  if ARowIndex = -1 then
    ARowIndex := FAggregateValues.Count;
  GetMem(pAggs, FAggregateSlotAllocated * SizeOf(TFDDatSAggregateValue));
  FillChar(pAggs^, FAggregateSlotAllocated * SizeOf(TFDDatSAggregateValue), 0);
  FAggregateValues.Insert(ARowIndex, pAggs);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.AddObjectAt(AObj: TFDDatSObject;
  AIndex: Integer);
begin
  inherited AddObjectAt(AObj, AIndex);
  if FAggregateSlotAllocated > 0 then
    AddAggregatesRow(AIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.RemoveAt(AIndex: Integer;
  ANotDestroy: Boolean);
begin
  inherited RemoveAt(AIndex, ANotDestroy);
  if FAggregateSlotAllocated > 0 then
    RemoveAggregatesRow(AIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.DeleteAggregates;
var
  i: Integer;
begin
  if FAggregateValues <> nil then begin
    for i := FAggregateValues.Count - 1 downto 0 do
      RemoveAggregatesRow(i);
    for i := 0 to FAggregateSlots.Size - 1 do
      FAggregateSlots.Bits[i] := False;
    FAggregateSlotAllocated := 0;
    FAggregateSlotUsed := 0;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.ClearAggregate(AIndex: Integer);
var
  i: Integer;
  pAggs: PFDAggVals;
begin
  ASSERT(FAggregateValues <> nil);
  for i := 0 to FAggregateValues.Count - 1 do begin
    pAggs := PFDAggVals(FAggregateValues[i]);
    if (pAggs <> nil) and (pAggs^[AIndex] <> nil) then begin
      pAggs^[AIndex].RemRef;
      pAggs^[AIndex] := nil;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.DeleteAggregate(var AIndex: Integer);
begin
  try
    ClearAggregate(AIndex);
  finally
    FAggregateSlots.Bits[AIndex] := False;
    if AIndex = FAggregateSlotUsed - 1 then
      Dec(FAggregateSlotUsed);
    AIndex := -1;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRowListWithAggregates.AllocateAggregate: Integer;
var
  i, j: Integer;
  pAggs: PFDAggVals;

  procedure ErrorTooManyAggs;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_TooManyAggs, []);
  end;

begin
  if FAggregateSlots = nil then begin
    FAggregateSlots := TBits.Create;
    FAggregateSlots.Size := C_FD_MaxAggsPerView;
    FAggregateValues := TFDPtrList.Create;
  end;
  Result := FAggregateSlots.OpenBit;
  if Result = FAggregateSlots.Size then
    ErrorTooManyAggs;
  FAggregateSlots.Bits[Result] := True;
  while FAggregateValues.Count < Count do
    FAggregateValues.Add(nil);
  if Result >= FAggregateSlotAllocated then begin
    for i := 0 to Count - 1 do begin
      pAggs := PFDAggVals(FAggregateValues[i]);
      ReallocMem(pAggs, (Result + 4) * SizeOf(TFDDatSAggregateValue));
      FAggregateValues[i] := pAggs;
      for j := FAggregateSlotAllocated to Result + 4 - 1 do
        Pointer(pAggs^[j]) := nil;
    end;
    FAggregateSlotAllocated := Result + 4;
  end;
  for i := 0 to Count - 1 do
    PFDAggVals(FAggregateValues[i])^[Result] := nil;
  if Result >= FAggregateSlotUsed then
    FAggregateSlotUsed := Result + 1;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.AttachAggregate(ARowIndex,
  AValIndex: Integer; AObj: TFDDatSAggregateValue);
begin
  ASSERT(FAggregateValues <> nil);
  AObj.AddRef;
  PFDAggVals(FAggregateValues[ARowIndex])^[AValIndex] := AObj;
end;

{-------------------------------------------------------------------------------}
function TFDDatSRowListWithAggregates.FetchAggregate(ARowIndex,
  AValIndex: Integer): TFDDatSAggregateValue;
begin
  ASSERT(FAggregateValues <> nil);
  Result := PFDAggVals(FAggregateValues[ARowIndex])^[AValIndex];
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSRowListWithAggregates.DetachAggregate(ARowIndex,
  AValIndex: Integer);
var
  oObj: TFDDatSAggregateValue;
begin
  ASSERT(FAggregateValues <> nil);
  oObj := FetchAggregate(ARowIndex, AValIndex);
  oObj.RemRef;
  PFDAggVals(FAggregateValues[ARowIndex])^[AValIndex] := nil;
end;

{-------------------------------------------------------------------------------}
{ TFDDatSAggregateValue                                                         }
{-------------------------------------------------------------------------------}
constructor TFDDatSAggregateValue.Create(ASubAggregateCnt: Integer);
begin
  inherited Create;
  FRefs := TFDRefCounter.Create(Self);
  FRefs.CountRef;
  SetLength(FSubValues, ASubAggregateCnt);
  Clear;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSAggregateValue.CreateCopy(AValue: TFDDatSAggregateValue);
var
  i: Integer;
begin
  Create(Length(AValue.FSubValues));
  FValue := AValue.Value;
  for i := 0 to Length(AValue.FSubValues) - 1 do
    FSubValues[i] := AValue.FSubValues[i];
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSAggregateValue.Destroy;
begin
  FDFreeAndNil(FRefs);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregateValue.Clear;
var
  i: Integer;
begin
  for i := 0 to Length(FSubValues) - 1 do
    FSubValues[i] := Null;
  FValue := Null;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregateValue.AddRef;
begin
  FRefs.AddRef;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregateValue.RemRef;
begin
  FRefs.RemRef;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateValue.GetRefs: Integer;
begin
  Result := FRefs.Refs;
end;

{-------------------------------------------------------------------------------}
{ TFDDatSAggregateExpressionDS                                                  }
{-------------------------------------------------------------------------------}
type
  TFDDatSAggregateExpressionDS = class(TFDDatSTableExpressionDS)
  private
    FView: TFDDatSView;
    FAggregate: TFDDatSAggregate;
  protected
    function GetVarIndex(const AName: String): Integer; override;
    function GetVarType(AIndex: Integer): TFDDataType; override;
    function GetVarScope(AIndex: Integer): TFDExpressionScopeKind; override;
    function GetVarData(AIndex: Integer): Variant; override;
    function GetSubAggregateValue(AIndex: Integer): Variant; override;
    function GetRowNum: Integer; override;
  public
    constructor Create(AView: TFDDatSView; AAggregate: TFDDatSAggregate);
  end;

{-------------------------------------------------------------------------------}
constructor TFDDatSAggregateExpressionDS.Create(AView: TFDDatSView; AAggregate: TFDDatSAggregate);
begin
  inherited Create(AView.Table);
  FView := AView;
  FAggregate := AAggregate;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateExpressionDS.GetRowNum: Integer;
begin
  Result := FView.Rows.IndexOf(FRow) + 1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateExpressionDS.GetSubAggregateValue(AIndex: Integer): Variant;
begin
  Result := FAggregate.GetSubAggregateValue(AIndex);
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateExpressionDS.GetVarIndex(const AName: String): Integer;
begin
  Result := inherited GetVarIndex(AName);
  if Result = -1 then begin
    Result := FView.Aggregates.IndexOfName(AName);
    if Result <> -1 then
      Result := FTable.Columns.Count + Result;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateExpressionDS.GetVarType(AIndex: Integer): TFDDataType;
begin
  if AIndex < FTable.Columns.Count then
    Result := inherited GetVarType(AIndex)
  else
    Result := FView.Aggregates.ItemsI[AIndex - FTable.Columns.Count].DataType;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateExpressionDS.GetVarScope(AIndex: Integer): TFDExpressionScopeKind;
begin
  if AIndex < FTable.Columns.Count then
    Result := inherited GetVarScope(AIndex)
  else
    Result := ckAgg;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateExpressionDS.GetVarData(AIndex: Integer): Variant;
begin
  if AIndex < FTable.Columns.Count then
    Result := inherited GetVarData(AIndex)
  else
    Result := FView.Aggregates.ItemsI[AIndex - FTable.Columns.Count].Value[FView.Rows.IndexOf(FRow)];
end;

{-------------------------------------------------------------------------------}
{ TFDDatSAggregate                                                              }
{-------------------------------------------------------------------------------}
constructor TFDDatSAggregate.Create;
begin
  inherited Create;
  FValueIndex := -1;
  FRefs := TFDRefCounter.Create(Self);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSAggregate.Create(const AName, AExpression: String;
  AGroupingLevel: Integer);
begin
  Create;
  if AName <> '' then
    Name := AName;
  Expression := AExpression;
  GroupingLevel := AGroupingLevel;
  Active := True;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSAggregate.Destroy;
begin
  Unprepare;
  FDFreeAndNil(FRefs);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.Assign(AObj: TFDDatSObject);
begin
  inherited Assign(AObj);
  if AObj is TFDDatSAggregate then begin
    Expression := TFDDatSAggregate(AObj).Expression;
    GroupingLevel := TFDDatSAggregate(AObj).GroupingLevel;
    Active := TFDDatSAggregate(AObj).Active;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := (Expression = TFDDatSAggregate(AObj).Expression) and
      (GroupingLevel = TFDDatSAggregate(AObj).GroupingLevel) and
      (Active = TFDDatSAggregate(AObj).Active);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.CountRef(AInit: Integer = 1);
begin
  FRefs.CountRef(AInit);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.AddRef;
begin
  FRefs.AddRef;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.RemRef;
begin
  FRefs.RemRef;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.GetIsRefCounted: Boolean;
begin
  Result := FRefs.Refs >= 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.CheckActiveChanged;
begin
  if FPrevActualActive <> ActualActive then begin
    Unprepare;
    FPrevActualActive := ActualActive;
    if FPrevActualActive then
      Update;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.SetActive(const AValue: Boolean);
begin
  if FActive <> AValue then begin
    FActive := AValue;
    CheckActiveChanged;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.DoListInserted;
begin
  CheckActiveChanged;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.DoListRemoving;
begin
  Active := False;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.GetActualActive: Boolean;
var
  oView: TFDDatSView;
begin
  oView := View;
  Result := Active and (oView <> nil) and oView.ActualActive;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.GetView: TFDDatSView;
begin
  Result := TFDDatSView(GetOwnerByClass(TFDDatSView));
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.GetRows: TFDDatSRowListWithAggregates;
var
  oView: TFDDatSView;
begin
  oView := View;
  if oView <> nil then
    Result := TFDDatSViewRowList(oView.Rows)
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.GetSortMech: IFDDatSMechSort;
var
  oView: TFDDatSView;
begin
  oView := View;
  if oView <> nil then
    Result := oView.SortingMechanism
  else
    Result := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.SetExpression(const AValue: String);
begin
  if FExpression <> AValue then begin
    FExpression := AValue;
    FActive := False;
    CheckActiveChanged;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.SetGroupingLevel(const AValue: Integer);
begin
  ASSERT(AValue >= 0);
  if FGroupingLevel <> AValue then begin
    FGroupingLevel := AValue;
    FActive := False;
    CheckActiveChanged;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.Unprepare;
var
  oRows: TFDDatSRowListWithAggregates;
begin
  if agPrepared in FState then
    try
      oRows := Rows;
      if oRows <> nil then
        oRows.DeleteAggregate(FValueIndex);
      SetLength(FSubAggregates, 0);
      FEvaluator := nil;
    finally
      FState := [];
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.Prepare;
  procedure TooMuchGrouping;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_GrpLvlExceeds, [Name]);
  end;
var
  i: Integer;
  oRows: TFDDatSRowListWithAggregates;
  oSortMech: IFDDatSMechSort;
  oParser: IFDStanExpressionParser;
begin
  if not (agPrepared in FState) then begin
    FState := [];
    oRows := Rows;
    oSortMech := SortMech;
    if oSortMech <> nil then
      case oSortMech.SortSource of
      ssExpression:
        if 1 < FGroupingLevel then
          TooMuchGrouping;
      ssRowId:
        if 0 < FGroupingLevel then
          TooMuchGrouping;
      ssColumns:
        if oSortMech.SortColumnList.Count < FGroupingLevel then
          TooMuchGrouping;
      end
    else if FGroupingLevel > 0 then
      TooMuchGrouping;
    try
      FDCreateInterface(IFDStanExpressionParser, oParser);
      FEvaluator := oParser.Prepare(TFDDatSAggregateExpressionDS.Create(View, Self),
        Expression, [], [poAggregate, poDefaultExpr], '');
      SetLength(FSubAggregates, FEvaluator.SubAggregateCount);
      FSubAggregateValues := 0;
      for i := 0 to FEvaluator.SubAggregateCount - 1 do begin
        FSubAggregates[i].FKind := FEvaluator.SubAggregateKind[i];
        FSubAggregates[i].FValueIndex := FSubAggregateValues;
        Inc(FSubAggregateValues);
        case FSubAggregates[i].FKind of
        akAvg:
          begin
            FSubAggregates[i].FCountIndex := FSubAggregateValues;
            Inc(FSubAggregateValues);
          end;
        akMin, akMax:
          begin
            FSubAggregates[i].FCountIndex := -1;
            Include(FState, agMinMax);
          end;
        else
          FSubAggregates[i].FCountIndex := -1;
        end;
      end;
      FValueIndex := oRows.AllocateAggregate;
    except
      FEvaluator := nil;
      SetLength(FSubAggregates, 0);
      if FValueIndex <> -1 then
        oRows.DeleteAggregate(FValueIndex);
      raise;
    end;
    Include(FState, agPrepared);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.Recalc;
begin
  if ActualActive then
    CalcAll
  else
    Exclude(FState, agActual);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.Update;
begin
  if not (agActual in FState) and ActualActive then
    CalcAll;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.IncAggVals(AKind: TFDAggregateKind;
  const AVal: Variant; var AAggVal, AAggCnt: Variant);
begin
  case AKind of
  akSum:
    if VarIsNull(AAggVal) then
      AAggVal := AVal
    else if not VarIsNull(AVal) then
      AAggVal := AAggVal + AVal;
  akAvg:
    begin
      if VarIsNull(AAggVal) then
        AAggVal := AVal
      else if not VarIsNull(AVal) then
        AAggVal := AAggVal + AVal;
      if not VarIsNull(AVal) then
        if VarIsNull(AAggCnt) then
          AAggCnt := 1
        else
          AAggCnt := AAggCnt + 1;
    end;
  akCount:
    if not VarIsNull(AVal) then
      if VarIsNull(AAggVal) then
        AAggVal := 1
      else
        AAggVal := AAggVal + 1;
  akMin:
    if VarIsNull(AAggVal) then
      AAggVal := AVal
    else if not VarIsNull(AVal) and (AAggVal > AVal) then
      AAggVal := AVal;
  akMax:
    if VarIsNull(AAggVal) then
      AAggVal := AVal
    else if not VarIsNull(AVal) and (AAggVal < AVal) then
      AAggVal := AVal;
  akFirst:
    if VarIsNull(AAggVal) then
      if not VarIsNull(AVal) then
        AAggVal := AVal;
  akLast:
    if not VarIsNull(AVal) then
      AAggVal := AVal;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.DecAggVals(AKind: TFDAggregateKind;
  const AVal: Variant; var AAggVal, AAggCnt: Variant);
begin
  if VarIsNull(AAggVal) or VarIsNull(AVal) then
    Exit;
  case AKind of
  akSum:
    AAggVal := AAggVal - AVal;
  akAvg:
    begin
      AAggVal := AAggVal - AVal;
      AAggCnt := AAggCnt - 1;
      if AAggCnt = 0 then begin
        AAggVal := Null;
        AAggCnt := Null;
      end;
    end;
  akCount:
    begin
      AAggVal := AAggVal - 1;
      if AAggVal = 0 then
        AAggVal := Null;
    end;
  akMin:
    ;
  akMax:
    ;
  akFirst:
    ;
  akLast:
    ;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.SetEvaluatorToRow(ARows: TFDDatSRowListWithAggregates;
  ARowIndex: Integer);
begin
  FCurrentRow := ARowIndex;
  FEvaluator.DataSource.Position := ARows.ItemsI[ARowIndex];
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.GetSubAggregateValue(ASubAggregateIndex: Integer): Variant;
var
  oVal: TFDDatSAggregateValue;
  vCnt, vVal: Variant;
  pAgg: PFDDatSSubAggregate;
begin
  Result := Null;
  oVal := Rows.FetchAggregate(FCurrentRow, FValueIndex);
  pAgg := @FSubAggregates[ASubAggregateIndex];
  vVal := oVal.FSubValues[pAgg^.FValueIndex];
  if not VarIsNull(vVal) and not VarIsEmpty(vVal) then
    if pAgg^.FKind = akAvg then begin
      vCnt := oVal.FSubValues[pAgg^.FCountIndex];
      if not VarIsNull(vCnt) then
        Result := vVal / vCnt;
    end
    else
      Result := vVal;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.ClearGroup(ARowIndex: Integer; var AGroupFrom, AGroupTo: Integer);
var
  oRows: TFDDatSRowListWithAggregates;
  oSortMech: IFDDatSMechSort;
  i, j: Integer;
  oVal, oLastVal: TFDDatSAggregateValue;
begin
  oRows := Rows;
  oSortMech := SortMech;
  if (GroupingLevel > 0) and (oSortMech <> nil) then begin
    AGroupFrom := ARowIndex;
    while (AGroupFrom > 0) and
          (oSortMech.CompareRows(oRows.ItemsI[AGroupFrom], oRows.ItemsI[AGroupFrom - 1], GroupingLevel) = 0) do
      Dec(AGroupFrom);
    AGroupTo := ARowIndex;
    while (AGroupTo < oRows.Count - 1) and
          (oSortMech.CompareRows(oRows.ItemsI[AGroupTo], oRows.ItemsI[AGroupTo + 1], GroupingLevel) = 0) do
      Inc(AGroupTo);
  end
  else begin
    AGroupFrom := 0;
    AGroupTo := oRows.Count - 1;
  end;
  oLastVal := nil;
  for i := AGroupFrom to AGroupTo do begin
    oVal := oRows.FetchAggregate(i, FValueIndex);
    if oVal = nil then begin
      if oLastVal = nil then
        for j := i + 1 to AGroupTo do begin
          oLastVal := oRows.FetchAggregate(j, FValueIndex);
          if oLastVal <> nil then
            Break;
        end;
      if oLastVal = nil then
        oVal := TFDDatSAggregateValue.Create(FSubAggregateValues)
      else
        oVal := oLastVal;
      oRows.AttachAggregate(i, FValueIndex, oVal);
    end;
    if oLastVal <> oVal then begin
      ASSERT(oLastVal = nil);
      oVal.Clear;
      oLastVal := oVal;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.CalcGroup(AGroupFrom, AGroupTo, AExclude: Integer);
var
  oRows: TFDDatSRowListWithAggregates;
  oVal, oLastVal: TFDDatSAggregateValue;
  j, i: Integer;
  V, vTmp: Variant;
  pAgg: PFDDatSSubAggregate;
begin
  oRows := Rows;
  for j := 0 to Length(FSubAggregates) - 1 do
    for i := AGroupFrom to AGroupTo do
      if i <> AExclude then begin
        oVal := oRows.FetchAggregate(i, FValueIndex);
        SetEvaluatorToRow(oRows, i);
        V := FEvaluator.EvaluateSubAggregateArg(j);
        pAgg := @FSubAggregates[j];
        if pAgg^.FKind = akAvg then
          IncAggVals(pAgg^.FKind, V, oVal.FSubValues[pAgg^.FValueIndex], oVal.FSubValues[pAgg^.FCountIndex])
        else begin
          vTmp := Unassigned;
          IncAggVals(pAgg^.FKind, V, oVal.FSubValues[pAgg^.FValueIndex], vTmp);
        end;
      end;
  oLastVal := nil;
  for i := AGroupFrom to AGroupTo do
    if i <> AExclude then begin
      oVal := oRows.FetchAggregate(i, FValueIndex);
      if oLastVal <> oVal then begin
        SetEvaluatorToRow(oRows, i);
        oVal.FValue := FEvaluator.Evaluate;
        oLastVal := oVal;
      end;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.CalcAll;
var
  oRows: TFDDatSRowListWithAggregates;
  oVal: TFDDatSAggregateValue;
  i, iLevel: Integer;
  oSortMech: IFDDatSMechSort;
  lBreak: Boolean;
begin
  oRows := Rows;
  if agPrepared in FState then
    oRows.ClearAggregate(FValueIndex)
  else
    Prepare;
  oSortMech := SortMech;
  iLevel := GroupingLevel;
  oVal := nil;
  for i := 0 to oRows.Count - 1 do begin
    lBreak := False;
    if oVal = nil then
      lBreak := True
    else if (iLevel > 0) and (oSortMech <> nil) then
      lBreak := (oSortMech.CompareRows(oRows.ItemsI[i], oRows.ItemsI[i - 1], iLevel) <> 0);
    if lBreak then
      oVal := TFDDatSAggregateValue.Create(FSubAggregateValues);
    oRows.AttachAggregate(i, FValueIndex, oVal);
    if lBreak then
      oVal.RemRef;
  end;
  CalcGroup(0, oRows.Count - 1, -1);
  Include(FState, agActual);
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.GetDataType: TFDDataType;
begin
  if FEvaluator = nil then
    Result := dtUnknown
  else
    Result := FEvaluator.DataType;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregate.GetValue(ARowIndex: Integer): Variant;
begin
  if agPrepared in FState then
    Result := Rows.FetchAggregate(ARowIndex, FValueIndex).Value
  else
    Result := Unassigned;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.IncRow(ARows: TFDDatSRowListWithAggregates;
  ARowIndex: Integer; AVal: TFDDatSAggregateValue);
var
  i: Integer;
  V, vTmp: Variant;
  pAgg: PFDDatSSubAggregate;
begin
  SetEvaluatorToRow(ARows, ARowIndex);
  for i := 0 to Length(FSubAggregates) - 1 do begin
    V := FEvaluator.EvaluateSubAggregateArg(i);
    pAgg := @FSubAggregates[i];
    if pAgg^.FKind = akAvg then
      IncAggVals(pAgg^.FKind, V, AVal.FSubValues[pAgg^.FValueIndex],
        AVal.FSubValues[pAgg^.FCountIndex])
    else begin
      vTmp := Unassigned;
      IncAggVals(pAgg^.FKind, V, AVal.FSubValues[pAgg^.FValueIndex], vTmp);
    end;
  end;
  AVal.FValue := FEvaluator.Evaluate;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.DecRow(ARows: TFDDatSRowListWithAggregates;
  ARowIndex: Integer; AVal: TFDDatSAggregateValue);
var
  i: Integer;
  V, vTmp: Variant;
  pAgg: PFDDatSSubAggregate;
begin
  SetEvaluatorToRow(ARows, ARowIndex);
  for i := 0 to Length(FSubAggregates) - 1 do begin
    V := FEvaluator.EvaluateSubAggregateArg(i);
    pAgg := @FSubAggregates[i];
    if pAgg^.FKind = akAvg then
      DecAggVals(pAgg^.FKind, V, AVal.FSubValues[pAgg^.FValueIndex],
        AVal.FSubValues[pAgg^.FCountIndex])
    else begin
      vTmp := Unassigned;
      DecAggVals(pAgg^.FKind, V, AVal.FSubValues[pAgg^.FValueIndex], vTmp);
    end;
  end;
  AVal.FValue := FEvaluator.Evaluate;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.RowInserted(ARowIndex: Integer);
var
  oRows: TFDDatSRowListWithAggregates;
  oSortMech: IFDDatSMechSort;
  i: Integer;
  oVal: TFDDatSAggregateValue;
begin
  if ActualActive then begin
    oRows := Rows;
    oSortMech := SortMech;
    if (GroupingLevel > 0) and (oSortMech <> nil) then begin
      if (ARowIndex > 0) and
         (oSortMech.CompareRows(oRows.ItemsI[ARowIndex], oRows.ItemsI[ARowIndex - 1], GroupingLevel) = 0) then
        i := ARowIndex - 1
      else if (ARowIndex < oRows.Count - 1) and
              (oSortMech.CompareRows(oRows.ItemsI[ARowIndex], oRows.ItemsI[ARowIndex + 1], GroupingLevel) = 0) then
        i := ARowIndex + 1
      else
        i := -1;
    end
    else
      if ARowIndex > 0 then
        i := ARowIndex - 1
      else if ARowIndex < oRows.Count - 1 then
        i := ARowIndex + 1
      else
        i := -1;
    if i = -1 then
      oVal := TFDDatSAggregateValue.Create(FSubAggregateValues)
    else
      oVal := oRows.FetchAggregate(i, FValueIndex);
    oRows.AttachAggregate(ARowIndex, FValueIndex, oVal);
    if i = -1 then
      oVal.RemRef;
    IncRow(oRows, ARowIndex, oVal);
  end
  else
    Exclude(FState, agActual);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.RowDeleted(ARowIndex: Integer);
var
  oVal: TFDDatSAggregateValue;
  oRows: TFDDatSRowListWithAggregates;
  iFrom, iTo: Integer;
begin
  if ActualActive then begin
    oRows := Rows;
    oVal := oRows.FetchAggregate(ARowIndex, FValueIndex);
    if oVal.Refs > 1 then
      if agMinMax in FState then begin
        iFrom := -1;
        iTo := -1;
        ClearGroup(ARowIndex, iFrom, iTo);
        CalcGroup(iFrom, iTo, ARowIndex);
      end
      else
        DecRow(oRows, ARowIndex, oVal);
    oRows.DetachAggregate(ARowIndex, FValueIndex);
  end
  else
    Exclude(FState, agActual);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.RowUpdated(ARowIndex, AOldRowIndex: Integer);
var
//  oRows: TFDDatSRowListWithAggregates;
  iFrom, iTo: Integer;
//  oVal: TFDDatSAggregateValue;
begin
  if ActualActive then begin
               
                                                              
                                                                 
//    if agMinMax in FState then begin
      iFrom := -1;
      iTo := -1;
      ClearGroup(AOldRowIndex, iFrom, iTo);
      CalcGroup(iFrom, iTo, -1);
      if (ARowIndex < iFrom) or (ARowIndex > iTo) then begin
        ClearGroup(ARowIndex, iFrom, iTo);
        CalcGroup(iFrom, iTo, -1);
      end;
//    end
//    else begin
//      oRows := Rows;
//      oVal := oRows.FetchAggregate(AOldRowIndex, FValueIndex);
//      DecRow(oRows, AOldRowIndex, oVal);
//      oVal := oRows.FetchAggregate(ARowIndex, FValueIndex);
//      IncRow(oRows, ARowIndex, oVal);
//    end;
  end
  else
    Exclude(FState, agActual);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.ResolveActive(const AName, AValue: String);
begin
  if SameText(AName, 'Active') and SameText(AValue, S_FD_True) then
    Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  lActive: Boolean;
begin
  Active := False;
  inherited InternalLoadFromStorage(AStorage);
  lActive := AStorage.ReadBoolean('Active', False);
  if lActive then
    AStorage.DeferAction('Active', S_FD_True, ResolveActive);
  Expression := AStorage.ReadString('Expression', '');
  GroupingLevel := AStorage.ReadInteger('GroupingLevel', 0);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregate.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteBoolean('Active', Active, False);
  AStorage.WriteString('Expression', Expression, '');
  AStorage.WriteInteger('GroupingLevel', GroupingLevel, 0);
end;

{-------------------------------------------------------------------------------}
{ TFDDatSAggregateList                                                          }
{-------------------------------------------------------------------------------}
constructor TFDDatSAggregateList.CreateForView(AOwner: TFDDatSView);
begin
  ASSERT(AOwner <> nil);
  inherited Create;
  OwnObjects := True;
  FOwner := AOwner;
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateList.Add(AObj: TFDDatSAggregate): Integer;
begin
  Result := AddObject(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateList.Add(const AName, AExpression: String;
  AGroupingLevel: Integer): TFDDatSAggregate;
begin
  Result := TFDDatSAggregate.Create(AName, AExpression, AGroupingLevel);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateList.GetItemsI(AIndex: Integer): TFDDatSAggregate;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSAggregate(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSAggregateList.AggregateByName(const AName: String): TFDDatSAggregate;
begin
  Result := TFDDatSAggregate(ItemByName(AName));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregateList.RowInserted(ARowIndex: Integer);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].RowInserted(ARowIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregateList.RowUpdated(ARowIndex, AOldRowIndex: Integer);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].RowUpdated(ARowIndex, AOldRowIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregateList.RowDeleted(ARowIndex: Integer);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].RowDeleted(ARowIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregateList.Update;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].Update;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSAggregateList.Recalc;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].Recalc;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSTableRowList                                                         -}
{-------------------------------------------------------------------------------}
constructor TFDDatSTableRowList.CreateForTable(ATable: TFDDatSTable);
begin
  ASSERT(ATable <> nil);
  inherited Create;
  FOwner := ATable;
  OwnObjects := True;
  FRowIDOrdered := True;
  FLastRowCount := -1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableRowList.Add(const AValues: array of Variant): TFDDatSRow;
begin
  Result := Table.NewRow(AValues, True);
  Add(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableRowList.IndexOf(AObj: TFDDatSObject): Integer;
begin
  ASSERT(AObj <> nil);
  if FRowIDOrdered then
    Result := IndexOf(TFDDatSRow(AObj).FRowID)
  else
    Result := inherited IndexOf(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableRowList.IndexOf(ARowID: LongWord): Integer;
var
  i, iFirstNo, iLastNo: Integer;
  oRow: TFDDatSRow;
begin
  if ARowId <> $FFFFFFFF then
    if not FRowIDOrdered then begin
      for i := 0 to FCount - 1 do
        if TFDDatSRow(FArray[i]).RowID = ARowID then begin
          Result := i;
          Exit;
        end;
    end
    else begin
      iFirstNo := 0;
      iLastNo := FCount - 1;
      while iFirstNo <= iLastNo do begin
        Result := (iFirstNo + iLastNo) div 2;
        oRow := TFDDatSRow(FArray[Result]);
        if oRow.FRowID > ARowId then
          iLastNo := Result - 1
        else if oRow.FRowID < ARowId then
          iFirstNo := Result + 1
        else
          Exit;
      end;
    end;
  Result := -1;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTableRowList.Clear;
begin
  inherited Clear;
  FLastRowID := 0;
  FLastRowCount := -1;
  FRowIDOrdered := True;
  Inc(FResultSetNum);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTableRowList.AddObjectAt(AObj: TFDDatSObject; AIndex: Integer);
begin
  inherited AddObjectAt(AObj, AIndex);
  if not ((AIndex = -1) or (AIndex = Count - 1)) then
    FRowIDOrdered := False;
  TFDDatSRow(AObj).DoPostListInserted;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTableRowList.RemoveAt(AIndex: Integer; ANotDestroy: Boolean);
begin
  inherited RemoveAt(AIndex, ANotDestroy);
  if Count = 0 then
    FRowIDOrdered := True;
end;

{-------------------------------------------------------------------------------}
class function TFDDatSTableRowList.GetStreamingName(const AStorage: IFDStanStorage): String;
begin
  if (ExceptObject <> nil) and
     (EFDException(ExceptObject).FDCode = er_FD_StanStrgCantReadObj) and
     (AStorage.StreamVersion = 9) then
    Result := 'TableRowList_Updates'
  else
    Result := inherited GetStreamingName(AStorage);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTableRowList.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  oRow: TFDDatSRow;
  sName: String;
begin
  sName := GetStreamingName(AStorage);
  while not AStorage.IsObjectEnd(sName) do begin
    oRow := Table.NewRow(False);
    Add(oRow);
    oRow.LoadFromStorage(AStorage);
    Table.Columns.FixAutoIncs(oRow);
    if FLastRowID <= oRow.RowID then
      FLastRowID := oRow.RowID + 1;
    if (Count >= 2) and (ItemsI[Count - 2].RowID >= oRow.RowID) then
      FRowIDOrdered := False;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableRowList.MoveTo(AFromIndex, AToIndex: Integer): Boolean;
begin
  Result := AFromIndex <> AToIndex;
  if not Result then
    Exit;
  inherited MoveTo(AFromIndex, AToIndex);
  FRowIDOrdered := False;
  if (FLastRowCount <> -1) and
     ((AFromIndex < FLastRowCount) or (AToIndex < FLastRowCount)) then
    FLastRowCount := -1;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSViewRowList                                                          -}
{-------------------------------------------------------------------------------}
constructor TFDDatSViewRowList.CreateForView(AView: TFDDatSView);
begin
  ASSERT(AView <> nil);
  inherited Create;
  FOwner := AView;
  OwnObjects := False;
  LockNotification;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSNestedRowList                                                        -}
{-------------------------------------------------------------------------------}
constructor TFDDatSNestedRowList.CreateForRow(ARow: TFDDatSRow);
begin
  ASSERT(ARow <> nil);
  inherited Create;
  FOwner := ARow;
  OwnObjects := False;
  LockNotification;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNestedRowList.AddObjectAt(AObj: TFDDatSObject; AIndex: Integer);
begin
  ASSERT(AObj <> nil);
  TFDDatSRow(AObj).ParentRow := TFDDatSRow(FOwner);
  inherited AddObjectAt(AObj, AIndex);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSNestedRowList.RemoveAt(AIndex: Integer; ANotDestroy: Boolean);
begin
  ItemsI[AIndex].ParentRow := nil;
  inherited RemoveAt(AIndex, ANotDestroy);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSView                                                                 -}
{-------------------------------------------------------------------------------}
type
  TFDDatSViewUpdateInfoKind = (vuRowAdded, vuRowChanged, vuRowDeleted);
  PFDDataViewUpdateInfo = ^TFDDatSViewUpdateInfo;
  TFDDatSViewUpdateInfo = record
    FKind: TFDDatSViewUpdateInfoKind;
    FIndex: Integer;
    FOldIndex: Integer;
    FRow: TFDDatSRow;
  end;

{-------------------------------------------------------------------------------}
constructor TFDDatSView.Create;
begin
  inherited Create;
  FRows := TFDDatSViewRowList.CreateForView(Self);
  FMechanisms := TFDDatSViewMechList.CreateForView(Self);
  FAggregates := TFDDatSAggregateList.CreateForView(Self);
  FState := [vsOutdated];
  FRefs := TFDRefCounter.Create(Self);
  FProposedPosition := -1;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSView.Create(ATable: TFDDatSTable; const AFilter, ASort: String;
  AStates: TFDDatSRowStates);
begin
  ASSERT(ATable <> nil);
  Create;
  if ASort <> '' then
    Mechanisms.AddSort(ASort);
  if AFilter <> '' then
    Mechanisms.AddFilter(AFilter);
  if AStates <> [] then
    Mechanisms.AddStates(AStates)
  else
    // filter out deleted rows
    Mechanisms.AddStates(C_AllViewRows);
  Active := True;
  ATable.Views.AddObjectAt(Self, -1);
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSView.Create(ATable: TFDDatSTable;
  const ABaseName: String; ACreator: TFDDatSViewCreator;
  ACountRef: Boolean);
begin
  ASSERT(ATable <> nil);
  Create;
  if ABaseName <> '' then
    Name := ATable.Views.BuildUniqueName(ABaseName);
  Creator := ACreator;
  ATable.Views.AddEx(Self);
  if ACountRef then
    CountRef;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSView.Destroy;
begin
  Active := False;
  FDFreeAndNil(FRows);
  FDFreeAndNil(FMechanisms);
  FDFreeAndNil(FAggregates);
  FDFreeAndNil(FRefs);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.Assign(AObj: TFDDatSObject);
begin
  Active := False;
  inherited Assign(AObj);
  if AObj is TFDDatSView then begin
    Creator := TFDDatSView(AObj).Creator;
    SourceView := TFDDatSView(AObj).SourceView;
    Mechanisms.Assign(TFDDatSView(AObj).Mechanisms);
    Active := TFDDatSView(AObj).Active;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then begin
    ASSERT(AObj <> nil);
    Result := (SourceView = TFDDatSView(AObj).SourceView) and
      Mechanisms.IsEqualTo(TFDDatSView(AObj).Mechanisms);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.CountRef(AInit: Integer = 1);
begin
  FRefs.CountRef(AInit);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.AddRef;
begin
  FRefs.AddRef;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.RemRef;
begin
  FRefs.RemRef;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetIsRefCounted: Boolean;
begin
  Result := FRefs.Refs >= 0;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.CheckRebuild;
begin
  if ActualActive and (vsOutdated in FState) then
    Rebuild;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.InvalidateRebuild;
begin
  FState := FState + [vsOutdated];
  CheckRebuild;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.Clear;
begin
  try
    Rows.Clear;
    ProposedPosition := -1;
    FLastUpdatePosition := -1;
  finally
    FState := FState + [vsOutdated];
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.DoRowAdded(ARow: TFDDatSRow);
var
  iNewPos, iOldPos: Integer;
  info: TFDDatSViewUpdateInfo;
begin
  if not ActualActive then begin
    FState := FState + [vsOutdated];
    ProposedPosition := -1;
    FLastUpdatePosition := -1;
    Exit;
  end;
  iNewPos := -1;
  iOldPos := -1;
  if ProcessRow(ARow, iNewPos, iOldPos, True) = psAccepted then begin
    info.FRow := ARow;
    info.FIndex := iNewPos;
    info.FKind := vuRowAdded;
    Notify(snViewUpdated, srDataChange, NativeInt(Self), NativeInt(@info));
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.DoRowChanged(ARow: TFDDatSRow);
var
  iNewPos, iOldPos: Integer;
  info: TFDDatSViewUpdateInfo;
  ePS: TFDDatSViewProcessRowStatus;
begin
  if not ActualActive then begin
    FState := FState + [vsOutdated];
    ProposedPosition := -1;
    FLastUpdatePosition := -1;
    Exit;
  end;
  iNewPos := -1;
  iOldPos := -1;
  ePS := ProcessRow(ARow, iNewPos, iOldPos, False);
  if ePS = psAccepted then begin
    info.FRow := ARow;
    info.FIndex := iNewPos;
    if iOldPos <> -1 then begin
      info.FKind := vuRowChanged;
      info.FOldIndex := iOldPos;
    end
    else
      info.FKind := vuRowAdded;
    Notify(snViewUpdated, srDataChange, NativeInt(Self), NativeInt(@info));
  end
  else if (ePS = psRejected) and (iOldPos <> -1) then begin
    info.FRow := ARow;
    info.FIndex := iOldPos;
    info.FKind := vuRowDeleted;
    Notify(snViewUpdated, srDataChange, NativeInt(Self), NativeInt(@info));
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.DoRowDeleted(ARow: TFDDatSRow);
var
  i: Integer;
  info: TFDDatSViewUpdateInfo;
begin
  if not ActualActive then begin
    FState := FState + [vsOutdated];
    ProposedPosition := -1;
    FLastUpdatePosition := -1;
    Exit;
  end;
  i := ProposedPosition;
  ProposedPosition := -1;
  FLastUpdatePosition := -1;
  if (i < 0) or (i >= Rows.Count) or (Rows.ItemsI[i] <> ARow) then
    i := IndexOf(ARow, rvPrevious);
  if i <> -1 then begin
    Aggregates.RowDeleted(i);
    Rows.RemoveAt(i);
    info.FRow := ARow;
    info.FIndex := i;
    info.FKind := vuRowDeleted;
    Notify(snViewUpdated, srDataChange, NativeInt(Self), NativeInt(@info));
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetActual: Boolean;
begin
  Result := not (vsOutdated in FState);
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetViewList: TFDDatSViewList;
begin
  if Owner <> nil then
    Result := TFDDatSViewList(Owner)
  else
    Result := nil;
  ASSERT((Result = nil) or (Result is TFDDatSViewList));
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetTable: TFDDatSTable;
begin
  if (Owner <> nil) and (Owner.Owner <> nil) then
    Result := TFDDatSTable(Owner.Owner)
  else
    Result := nil;
  ASSERT((Result = nil) or (Result is TFDDatSTable));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.HandleNotification(AParam: PFDDatSNotifyParam);
var
  pInfo: PFDDataViewUpdateInfo;
  oTab: TFDDatSTable;
  oView, oViewMsg: TFDDatSView;
begin
  if Mechanisms <> nil then
    Mechanisms.HandleNotification(AParam);
  if Aggregates <> nil then
    Aggregates.HandleNotification(AParam);
  if AParam^.FKind = snMechanismStateChanged then begin
    oViewMsg := TFDDatSMechBase(AParam^.FParam1).View;
    oView := Self;
    while (oView <> nil) and (oView <> oViewMsg) do
      oView := oView.SourceView;
    if oView <> nil then begin
      UpdateSortingMechanism(nil);
      InvalidateRebuild;
    end;
  end
  else if (AParam^.FKind = snObjectRemoving) and (TFDDatSObject(AParam^.FParam2) is TFDDatSView) then begin
    oViewMsg := TFDDatSView(AParam^.FParam2);
    if SourceView = oViewMsg then
      SourceView := nil
    else if oViewMsg <> Self then begin
      oView := Self;
      while (oView <> nil) and (oView <> oViewMsg) do
        oView := oView.SourceView;
      if oView <> nil then
        UpdateSortingMechanism(oViewMsg);
    end;
  end
  else begin
    oTab := Table;
    if oTab <> nil then
      if SourceView = nil then
        case AParam^.FKind of
        snObjectInserted:
          if (TFDDatSList(AParam^.FParam1) is TFDDatSTableRowList) and
             (TFDDatSTableRowList(AParam^.FParam1) = oTab.Rows) then
            DoRowAdded(TFDDatSRow(AParam^.FParam2));
        snObjectRemoved:
          if (TFDDatSList(AParam^.FParam1) is TFDDatSTableRowList) and
             (TFDDatSTableRowList(AParam^.FParam1) = oTab.Rows) then
            DoRowDeleted(TFDDatSRow(AParam^.FParam2));
        snRowStateChanged, snRowErrorStateChanged:
          if (TFDDatSRow(AParam^.FParam1).Table = oTab) and
             ((AParam^.FKind <> snRowStateChanged) or
               not (TFDDatSRow(AParam^.FParam1).RowState in
                    [rsEditing,
                     rsImportingCurent, rsImportingOriginal, rsImportingProposed])) then
            DoRowChanged(TFDDatSRow(AParam^.FParam1));
        end
      else
        if (AParam^.FKind = snViewUpdated) and (TFDDatSView(AParam^.FParam1) = SourceView) then begin
          pInfo := PFDDataViewUpdateInfo(AParam^.FParam2);
          case pInfo^.FKind of
          vuRowAdded:
            DoRowAdded(pInfo^.FRow);
          vuRowDeleted:
            DoRowDeleted(pInfo^.FRow);
          vuRowChanged:
            DoRowChanged(pInfo^.FRow);
          end;
        end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.ProcessRow(ARow: TFDDatSRow; var ANewPos, AOldPos: Integer;
  AAdding: Boolean): TFDDatSViewProcessRowStatus;
var
  i: Integer;
  lFound: Boolean;
  oMech: TFDDatSMechBase;
begin
  if vsProcessing in FState then begin
    Result := psUnchanged;
    Exit;
  end;
  FState := FState + [vsProcessing];
  try
    Result := psAccepted;
    FLastUpdatePosition := -1;
    if AAdding then begin
      AOldPos := -1;
      ANewPos := ProposedPosition;
    end
    else begin
      AOldPos := ProposedPosition;
      ProposedPosition := -1;
      if (AOldPos < 0) or (AOldPos >= Rows.Count) or (Rows.ItemsI[AOldPos] <> ARow) then
        AOldPos := IndexOf(ARow, rvPrevious);
      ANewPos := AOldPos;
    end;
    for i := 0 to Mechanisms.Count - 1 do begin
      oMech := Mechanisms.ItemsI[i];
      if oMech.ActualActive and (mkFilter in oMech.Kinds) and not oMech.Locator then
        if not oMech.AcceptRow(ARow, rvDefault) then begin
          Result := psRejected;
          Break;
        end;
    end;
    if Result = psAccepted then begin
      if (SortingMechanism = nil) and not AAdding and (AOldPos <> -1) then
        Result := psUnchanged
      else begin
        if (SortingMechanism = nil) and AAdding then begin
          lFound := True;
          if ANewPos = -1 then
            ANewPos := Rows.Count;
        end
        else begin
          Search(ARow, nil, nil, -1, [loNearest, loLast, loExcludeKeyRow, loUseRowID],
            ANewPos, lFound, rvDefault);
          if ANewPos = -1 then
            ANewPos := 0
          else if lFound then
            Inc(ANewPos);
        end;
        if AOldPos <> ANewPos then begin
          if AOldPos <> -1 then begin
            Rows.RemoveAt(AOldPos);
            if ANewPos > AOldPos then
              Dec(ANewPos);
          end;
          Rows.AddAt(ARow, ANewPos);
        end;
      end;
      if AOldPos = -1 then
        Aggregates.RowInserted(ANewPos)
      else
        Aggregates.RowUpdated(ANewPos, AOldPos);
      FLastUpdatePosition := ANewPos;
    end
    else if (Result = psRejected) and (AOldPos <> -1) then begin
      Aggregates.RowDeleted(AOldPos);
      Rows.RemoveAt(AOldPos);
    end;
  finally
    FState := FState - [vsProcessing];
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.Rebuild;
var
  i: Integer;
  j: Integer;
  lAccepted, lFilters: Boolean;
  [unsafe] oMech: TFDDatSMechBase;
  oRows: TFDDatSRowListBase;
  iNewBegin, iBegin, iNewEnd, iEnd: Integer;
  oSortMech: IFDDatSMechSort;
  [unsafe] oRow: TFDDatSRow;
  pRow: PFDDatSRow;
  aMechMap: array of Boolean;
begin
  if vsProcessing in FState then
    Exit;
  FState := FState + [vsProcessing];
  try
    if SourceView <> nil then begin
      oRows := SourceView.Rows;
      iBegin := 0;
      iEnd := oRows.Count - 1;
      Clear;
    end
    else if Table <> nil then begin
      oRows := Table.Rows;
      if (Table.Rows.FLastRowCount > 0) and (Table.Rows.FLastRowCount <= oRows.Count) and
         (SortingMechanism = nil) then begin
        iBegin := Table.Rows.FLastRowCount;
        iEnd := oRows.Count - 1;
      end
      else begin
        iBegin := 0;
        iEnd := oRows.Count - 1;
        Clear;
      end;
    end
    else begin
      Clear;
      Exit;
    end;
    try
      if iEnd >= 0 then begin
        lFilters := False;
        SetLength(aMechMap, Mechanisms.Count);
        // restrict rows by a range
        for j := 0 to Mechanisms.Count - 1 do begin
          oMech := Mechanisms.ItemsI[j];
          aMechMap[j] := oMech.ActualActive and
            ([mkFilter, mkPost] * oMech.Kinds = [mkFilter]) and not oMech.Locator;
          if aMechMap[j] then begin
            lFilters := True;
            if mkHasList in oMech.Kinds then begin
              // expecting, here oRows will be set to nested rows list
              if (SourceView = nil) and oMech.GetRowsRange(oRows, iBegin, iEnd) then
                Break;
            end
            else begin
              iNewBegin := iBegin;
              iNewEnd := iEnd;
              if oMech.GetRowsRange(oRows, iNewBegin, iNewEnd) then begin
                if iNewBegin > iBegin then
                  iBegin := iNewBegin;
                if iNewEnd < iEnd then
                  iEnd := iNewEnd;
              end;
            end;
          end;
        end;
        // filter rows
        if iBegin <= iEnd then begin
          if oRows.Count = 0 then
            oRows.Capacity := iEnd - iBegin + 1;
          pRow := @oRows.FArray[iBegin];
          for i := iBegin to iEnd do begin
            oRow := pRow^;
            if oRow.RowState <> rsChecking then begin
              if not lFilters then
                Rows.Add(oRow)
              else begin
                lAccepted := True;
                for j := 0 to Mechanisms.Count - 1 do begin
                  oMech := Mechanisms.ItemsI[j];
                  if aMechMap[j] then
                    if not oMech.AcceptRow(oRow, rvDefault) then begin
                      lAccepted := False;
                      Break;
                    end;
                end;
                if lAccepted then
                  Rows.Add(oRow);
              end;
            end;
            pRow := PFDDatSRow(NativeInt(pRow) + SizeOf(TFDDatSRow));
          end;
        end;
        // sort rows
        for j := 0 to Mechanisms.Count - 1 do begin
          oMech := Mechanisms.ItemsI[j];
          if oMech.ActualActive and (mkSort in oMech.Kinds) and
             Supports(oMech, IFDDatSMechSort, oSortMech) then
            oSortMech.Sort(Rows);
        end;
        // post filter rows
        for j := 0 to Mechanisms.Count - 1 do begin
          oMech := Mechanisms.ItemsI[j];
          if oMech.ActualActive and
             ([mkFilter, mkPost] * oMech.Kinds = [mkFilter, mkPost]) and not oMech.Locator then
            oMech.PostProcess(Rows);
        end;
      end;
      FState := FState - [vsOutdated];
      Aggregates.Recalc;
    except
      Clear;
      raise;
    end;
  finally
    FState := FState - [vsProcessing];
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetActualActive: Boolean;
var
  oViewList: TFDDatSViewList;
begin
  oViewList := ViewList;
  Result := Active and (Table <> nil) and
    ((oViewList = nil) or oViewList.Active) and
    ((SourceView = nil) or SourceView.Active and (SourceView.Table = Table));
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.CheckActiveChanged;
var
  i: Integer;
begin
  if FPrevActualActive <> ActualActive then begin
    FPrevActualActive := ActualActive;
    LockNotification;
    try
      FDFreeAndNil(FFindRow);
      for i := 0 to Mechanisms.Count - 1 do
        if mkSort in Mechanisms.ItemsI[i].Kinds then
          Mechanisms.ItemsI[i].CheckActiveChanged;
      UpdateSortingMechanism(nil);
      for i := 0 to Mechanisms.Count - 1 do
        if not (mkSort in Mechanisms.ItemsI[i].Kinds) then
          Mechanisms.ItemsI[i].CheckActiveChanged;
    finally
      UnlockNotification;
    end;
    if FPrevActualActive then
      CheckRebuild
    else
      FState := FState + [vsOutdated];
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.DoListInserted;
begin
  CheckActiveChanged;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.DoListRemoving;
begin
  Active := False;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.SetActive(const AValue: Boolean);
begin
  if FActive <> AValue then begin
    FActive := AValue;
    CheckActiveChanged;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.SetSourceView(const AValue: TFDDatSView);
begin
  ASSERT(AValue <> Self);
  if FSourceView <> AValue then begin
    Active := False;
    FSourceView := AValue;
    if (AValue <> nil) and (AValue.Index > Index) then
      Table.Views.MoveTo(AValue.Index, Index);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.UpdateSortingMechanism(AExcludeView: TFDDatSView);
var
  i: Integer;
begin
  if Mechanisms = nil then
    Exit;
  PPointer(@FSortingMechanism)^ := nil;
  i := Mechanisms.Count - 1;
  while (i >= 0) and not (Mechanisms.ItemsI[i].ActualActive and
        (mkSort in Mechanisms.ItemsI[i].Kinds) and
        Supports(Mechanisms.ItemsI[i], IFDDatSMechSort, FSortingMechanism)) do
    Dec(i);
  if i = -1 then
    if (SourceView <> nil) and (SourceView <> AExcludeView) then begin
      SourceView.UpdateSortingMechanism(AExcludeView);
      FSortingMechanism := SourceView.SortingMechanism;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.Search(AKeyRow: TFDDatSRow;
  AKeyColumnList, AKeyColumnList2: TFDDatSColumnSublist; AKeyColumnCount: Integer;
  AOptions: TFDLocateOptions; {$IFDEF LINUX} var {$ELSE} out {$ENDIF} AIndex: Integer; out AFound: Boolean;
  ARowVersion: TFDDatSRowVersion = rvDefault): Integer;
var
  i: Integer;
  eProhibitSortOpts: TFDSortOptions;
  eCompOpts: TFDCompareDataOptions;
  oRow: TFDDatSRow;
  oCache: TFDDatSCompareRowsCache;
  iFrom, iTo: Integer;
  bIndexSearch: Boolean;
begin
  ASSERT(AKeyRow <> nil);
  Result := -1;
  AFound := False;
  oCache := nil;
(*
  Ind Src	Ok
  S	  S	  +	  Src
  S	  I	  +	  Src
  I	  S	  -	  -
  I	  I	  +	  Src

  loNoCase -> [], []
           -> [], [soNoCase]
*)
  eCompOpts := [coCache];
  if loPartial in AOptions then
    Include(eCompOpts, coPartial);
  if loNoCase in AOptions then
    Include(eCompOpts, coNoCase);

  eProhibitSortOpts := [];
  if not (loNoCase in AOptions) then
    Include(eProhibitSortOpts, soNoCase);

  if (AIndex < 0) or (AIndex >= Rows.Count) then
    Exclude(AOptions, loFromCurrent);

  if (SortingMechanism <> nil) and (
      (AKeyColumnList = nil) or
      SortingMechanism.SortingOn(AKeyColumnList, AKeyColumnCount, [], eProhibitSortOpts)
     ) then begin
    bIndexSearch := True;
    if loFromCurrent in AOptions then begin
      Result := Rows[AIndex].CompareRows(AKeyColumnList, nil, nil, AKeyColumnCount,
        AKeyRow, AKeyColumnList2, ARowVersion, eCompOpts, oCache);
      if Result = 0 then begin
        // current record matches, so check next or previous record
        bIndexSearch := False;
        if loBackward in AOptions then
          Dec(AIndex)
        else
          Inc(AIndex);
        AFound := (AIndex >= 0) and (AIndex < Rows.Count) and
          (Rows[AIndex].CompareRows(AKeyColumnList, nil, nil, AKeyColumnCount,
           AKeyRow, AKeyColumnList2, ARowVersion, eCompOpts, oCache) = 0);
      end
      else if ((Result > 0) and not (loBackward in AOptions)) or
              ((Result < 0) and (loBackward in AOptions)) then
        // no desired records in given direction
        bIndexSearch := False;
    end;
    if bIndexSearch then
      Result := SortingMechanism.Search(Rows, AKeyRow, AKeyColumnList,
        AKeyColumnList2, AKeyColumnCount, AOptions, AIndex, AFound, ARowVersion)
    else if not AFound then begin
      Result := -1;
      AIndex := -1;
    end;
  end
  else begin
    if (AKeyRow.RowState = rsUnchanged) and
       (AKeyRow.RowPriorState in [rsInitializing, rsDetached]) and
       (Table.DataHandleMode in [lmHavyFetching, lmFetching]) then begin
      // fetching - not in a list yet
    end
    else if [loUseRowID, loNearest] * AOptions = [loUseRowID, loNearest] then begin
      for i := 0 to Rows.Count - 1 do begin
        oRow := Rows.ItemsI[i];
        if (oRow <> AKeyRow) or not (loExcludeKeyRow in AOptions) then
          if AKeyRow.RowID <= oRow.RowID then begin
            AIndex := i;
            AFound := AKeyRow.RowID = oRow.RowID;
            if AFound then
              Result := 0
            else
              Result := 1;
            Break;
          end;
      end;
      if Result = -1 then begin
        AIndex := Rows.Count;
        Result := 1;
        AFound := False;
      end;
      Exit;
    end
    else if AKeyRow.Owner = Table.Rows then begin
      AIndex := IndexOf(AKeyRow, ARowVersion);
      if AIndex <> -1 then begin
        Result := 0;
        AFound := True;
      end;
    end
    else begin
      if loFromCurrent in AOptions then begin
        if loBackward in AOptions then begin
          iFrom := 0;
          iTo := AIndex - 1;
        end
        else begin
          iFrom := AIndex + 1;
          iTo := Rows.Count - 1;
        end;
      end
      else begin
        iFrom := 0;
        iTo := Rows.Count - 1;
      end;
      if loBackward in AOptions then
        i := iTo
      else
        i := iFrom;
      while (i >= iFrom) and (i <= iTo) do begin
        oRow := Rows.ItemsI[i];
        if (oRow <> AKeyRow) or not (loExcludeKeyRow in AOptions) then
          if (oRow = AKeyRow) or
             (oRow.CompareRows(AKeyColumnList, nil, nil, AKeyColumnCount,
                               AKeyRow, AKeyColumnList2, ARowVersion, eCompOpts,
                               oCache) = 0) then begin
            AIndex := i;
            AFound := True;
            Result := 0;
            Break;
          end;
        if loBackward in AOptions then
          Dec(i)
        else
          Inc(i);
      end;
    end;
    if not AFound and (loNearest in AOptions) then begin
      AIndex := Rows.Count;
      Result := 1;
      AFound := False;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetFindRow: TFDDatSRow;
begin
  if FFindRow = nil then
    FFindRow := Table.NewRow(False)
  else begin
    if FFindRow.FpCurrent <> nil then
      FFindRow.CleanupBuffer(FFindRow.FpCurrent);
    if FFindRow.FpProposed <> nil then
      FFindRow.CleanupBuffer(FFindRow.FpProposed);
  end;
  Result := FFindRow;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.Find(const AValues: array of Variant;
  AOptions: TFDLocateOptions): Integer;
var
  oRow: TFDDatSRow;
  i: Integer;
begin
  ASSERT(Table <> nil);
  if SortingMechanism = nil then begin
    Result := -1;
    Exit;
  end;
  oRow := GetFindRow;
  if SortingMechanism.SortSource = ssRowId then
    oRow.FRowID := AValues[0]
  else begin
    oRow.BeginForceWrite;
    for i := Low(AValues) to High(AValues) do
      oRow.SetData(SortingMechanism.SortColumnList[i - Low(AValues)], AValues[i]);
    oRow.EndForceWrite;
  end;
  Result := Find(oRow, AOptions);
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.Find(ARow: TFDDatSRow; AOptions: TFDLocateOptions): Integer;
var
  lFound: Boolean;
begin
  ASSERT(Table <> nil);
  if SortingMechanism = nil then begin
    Result := -1;
    Exit;
  end;
  lFound := False;
  Search(ARow, nil, nil, -1, AOptions, Result, lFound);
  if not lFound then
    Result := -1;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.Find(const AValues: array of Variant; const AColumns: String;
  AOptions: TFDLocateOptions): Integer;
var
  oRow: TFDDatSRow;
  i: Integer;
  lFound: Boolean;
  oKeyCols: TFDDatSColumnSublist;
begin
  ASSERT(Table <> nil);
  oKeyCols := TFDDatSColumnSublist.Create;
  try
    oKeyCols.Fill(Self, AColumns);
    oRow := GetFindRow;
    if (SortingMechanism <> nil) and (SortingMechanism.SortSource = ssRowId) then
      oRow.FRowID := AValues[0]
    else begin
      oRow.BeginForceWrite;
      for i := 0 to oKeyCols.Count - 1 do
        oRow.SetData(oKeyCols.ItemsI[i], AValues[i]);
      oRow.EndForceWrite;
    end;
    lFound := False;
    Result := -1;
    Search(oRow, oKeyCols, nil, -1, AOptions, Result, lFound);
    if not lFound then
      Result := -1;
  finally
    FDFree(oKeyCols);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.Find(ARow: TFDDatSRow; const AColumns: String;
  AOptions: TFDLocateOptions): Integer;
var
  lFound: Boolean;
  oKeyCols: TFDDatSColumnSublist;
begin
  ASSERT(Table <> nil);
  oKeyCols := TFDDatSColumnSublist.Create;
  try
    oKeyCols.Fill(Self, AColumns);
    lFound := False;
    Result := -1;
    Search(ARow, oKeyCols, nil, -1, AOptions, Result, lFound);
    if not lFound then
      Result := -1;
  finally
    FDFree(oKeyCols);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.IndexOf(AKeyRow: TFDDatSRow; ARowVersion: TFDDatSRowVersion;
  APossibleIndex: Integer): Integer;
var
  iIndex: Integer;
  lFound: Boolean;
begin
  ASSERT(AKeyRow <> nil);
  if (AKeyRow.FRowID < LongWord(Rows.Count)) and (Rows.ItemsI[AKeyRow.FRowID] = AKeyRow) then
    Result := AKeyRow.FRowID
  else if (APossibleIndex >= 0) and (APossibleIndex < Rows.Count) and
          (Rows.ItemsI[APossibleIndex] = AKeyRow) then
    Result := APossibleIndex
  else if (SortingMechanism <> nil) and
          (SortingMechanism.SortOptions * [soUnique, soPrimary] <> []) then begin
    lFound := False;
    iIndex := -1;
    SortingMechanism.Search(Rows, AKeyRow, nil, nil, -1, [], iIndex, lFound, ARowVersion);
    if lFound then
      // When constraints are disabled then view may contain duplicated rows.
      // This is optimistic check, that here are no duplicated AKeyRow values
      // and exactly AKeyRow is found. If not, then use FDIndexOf.
      if Rows[iIndex] = AKeyRow then
        Result := iIndex
      else
        Result := Rows.IndexOf(AKeyRow)
    else
      Result := -1;
  end
  else
    Result := Rows.IndexOf(AKeyRow);
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetGroupState(ARecordIndex, AGroupingLevel: Integer): TFDDatSGroupPositions;
var
  lMiddle: Boolean;
begin
  Result := [];
  lMiddle := True;
  if (ARecordIndex <= 0) or (AGroupingLevel <> 0) and (SortingMechanism <> nil) and (ARecordIndex < Rows.Count) and
     (SortingMechanism.CompareRows(Rows[ARecordIndex - 1], Rows[ARecordIndex], AGroupingLevel) <> 0) then begin
    Include(Result, gpFirst);
    lMiddle := False;
  end;
  if (ARecordIndex >= Rows.Count - 1) or (AGroupingLevel <> 0) and (SortingMechanism <> nil) and (ARecordIndex >= 0) and
     (SortingMechanism.CompareRows(Rows[ARecordIndex], Rows[ARecordIndex + 1], AGroupingLevel) <> 0) then begin
    Include(Result, gpLast);
    lMiddle := False;
  end;
  if lMiddle then
    Include(Result, gpMiddle);
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetGroupingLevel: Integer;
begin
  Result := 0;
  if SortingMechanism <> nil then
    case SortingMechanism.SortSource of
    ssColumns:    Result := SortingMechanism.SortColumnList.Count;
    ssExpression: Result := 1;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetMechanismByClass(AClass: TFDDatSMechBaseClass;
  AKind: TFDDatSMechanismKind): TFDDatSMechBase;
var
  i: Integer;
  oMech: TFDDatSMechBase;
begin
  Result := nil;
  for i := 0 to Mechanisms.Count - 1 do begin
    oMech := Mechanisms[i];
    if (AKind in oMech.Kinds) and (oMech is AClass) then begin
      Result := oMech;
      Exit;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetRowFilter: String;
var
  oFlt: TFDDatSMechFilter;
begin
  oFlt := TFDDatSMechFilter(GetMechanismByClass(TFDDatSMechFilter, mkFilter));
  if oFlt = nil then
    Result := ''
  else
    Result := oFlt.Expression;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.SetRowFilter(const AValue: String);
var
  oFlt: TFDDatSMechFilter;
begin
  oFlt := TFDDatSMechFilter(GetMechanismByClass(TFDDatSMechFilter, mkFilter));
  if oFlt = nil then
    Mechanisms.AddFilter(AValue)
  else begin
    oFlt.Expression := AValue;
    oFlt.Active := True;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetRowStateFilter: TFDDatSRowStates;
var
  oState: TFDDatSMechRowState;
begin
  oState := TFDDatSMechRowState(GetMechanismByClass(TFDDatSMechRowState, mkFilter));
  if oState = nil then
    Result := [rsInitializing .. rsImportingProposed]
  else
    Result := oState.RowStates;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.SetRowStateFilter(const AValue: TFDDatSRowStates);
var
  oState: TFDDatSMechRowState;
begin
  oState := TFDDatSMechRowState(GetMechanismByClass(TFDDatSMechRowState, mkFilter));
  if oState = nil then
    Mechanisms.AddStates(AValue)
  else begin
    oState.RowStates := AValue;
    oState.Active := True;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.GetSort: String;
var
  oSort: TFDDatSMechSort;
begin
  oSort := TFDDatSMechSort(GetMechanismByClass(TFDDatSMechSort, mkSort));
  if oSort = nil then
    Result := ''
  else
    Result := oSort.Columns;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.SetSort(const AValue: String);
var
  oSort: TFDDatSMechSort;
begin
  oSort := TFDDatSMechSort(GetMechanismByClass(TFDDatSMechSort, mkSort));
  if oSort = nil then
    Mechanisms.AddSort(AValue)
  else begin
    oSort.Columns := AValue;
    oSort.Active := True;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSView.Locate(var ARowIndex: Integer; AGoForward, ARestart: Boolean): Boolean;
var
  i, iMechs: Integer;
  oRow: TFDDatSRow;
  oMech: TFDDatSMechBase;
begin
  if ARestart then
    if AGoForward then
      ARowIndex := 0
    else
      ARowIndex := Rows.Count - 1
  else
    if AGoForward then
      Inc(ARowIndex)
    else
      Dec(ARowIndex);
  Result := False;
  iMechs := Mechanisms.Count - 1;
  while (ARowIndex < Rows.Count) and (ARowIndex >= 0) do begin
    oRow := Rows.ItemsI[ARowIndex];
    i := 0;
    while i <= iMechs do begin
      oMech := Mechanisms.ItemsI[i];
      if oMech.Locator and oMech.ActualActive and
         not oMech.AcceptRow(oRow, rvDefault) then
        Break;
      Inc(i);
    end;
    if i = iMechs + 1 then begin
      Result := True;
      Exit;
    end;
    if AGoForward then
      Inc(ARowIndex)
    else
      Dec(ARowIndex);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.DeleteAll(AAcceptChanges: Boolean = False);
var
  i: Integer;
  oRow: TFDDatSRow;
begin
  for i := Rows.Count - 1 downto 0 do begin
    oRow := Rows.ItemsI[i];
    oRow.Delete;
    if AAcceptChanges then
      oRow.AcceptChanges();
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.ResolveActive(const AName, AValue: String);
begin
  if SameText(AName, 'Active') and SameText(AValue, S_FD_True) then
    Active := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  sName: String;
  lActive: Boolean;
begin
  Active := False;
  inherited InternalLoadFromStorage(AStorage);
  lActive := AStorage.ReadBoolean('Active', False);
  if lActive then
    AStorage.DeferAction('Active', S_FD_True, ResolveActive);
  sName := AStorage.ReadString('SourceView', '');
  if sName <> '' then
    SourceView := ViewList.ViewByName(sName);
  Mechanisms.LoadFromStorage(AStorage);
  Aggregates.LoadFromStorage(AStorage);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSView.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  AStorage.WriteBoolean('Active', Active, False);
  if SourceView <> nil then
    AStorage.WriteString('SourceView', SourceView.Name, '');
  Mechanisms.SaveToStorage(AStorage);
  Aggregates.SaveToStorage(AStorage);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSViewList                                                             -}
{-------------------------------------------------------------------------------}
constructor TFDDatSViewList.CreateForTable(ATable: TFDDatSTable);
begin
  ASSERT(ATable <> nil);
  inherited Create;
  FActive := True;
  FOwner := ATable;
  OwnObjects := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSViewList.Assign(AObj: TFDDatSObject);
begin
  Active := False;
  inherited Assign(AObj);
  if AObj is TFDDatSViewList then
    Active := TFDDatSViewList(AObj).Active;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSViewList.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if (AParam^.FReason = srDataChange) and
     (TFDDatSTable(Owner).DataHandleMode in [lmHavyMove, lmHavyFetching,
                                             lmHavyLoading]) then
    Exit;
  inherited HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSViewList.SetActive(const AValue: Boolean);
var
  i: Integer;
begin
  if FActive <> AValue then begin
    FActive := AValue;
    if FActive then
      for i := 0 to Count - 1 do
        ItemsI[i].CheckActiveChanged;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewList.Add(AObj: TFDDatSView): Integer;
begin
  Result := AddObject(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewList.Add(const AName: String): TFDDatSView;
begin
  Result := TFDDatSView.Create;
  Result.Name := AName;
  Result.Active := True;
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSViewList.Clear;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].Active := False;
  inherited Clear;
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewList.GetItemsI(AIndex: Integer): TFDDatSView;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSView(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewList.ViewByName(const AName: String): TFDDatSView;
begin
  Result := TFDDatSView(inherited ItemByName(AName));
end;

{-------------------------------------------------------------------------------}
function TFDDatSViewList.FindSortedView(const AColumns: String;
  ARequiredOptions, AProhibitedOptions: TFDSortOptions): TFDDatSView;
var
  i: Integer;
  oView: TFDDatSView;
  oSortMech: IFDDatSMechSort;
begin
  Result := nil;
  for i := 0 to Count - 1 do begin
    oView := ItemsI[i];
    if oView.Actual and (oView.Mechanisms.Count = 1) and
       (oView.Mechanisms.ItemsI[0].Kinds = [mkSort]) and
       Supports(oView.Mechanisms.ItemsI[0], IFDDatSMechSort, oSortMech) and
       oSortMech.SortingOn(AColumns, ARequiredOptions, AProhibitedOptions) then begin
      Result := oView;
      Break;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSViewList.Rebuild;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemsI[i].Rebuild;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSViewList.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    if ItemsI[i].Creator = vcUser then
      AStorage.SaveObject(ItemsI[i]);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSTable                                                                -}
{-------------------------------------------------------------------------------}
constructor TFDDatSTable.Create;
begin
  inherited Create;
  FColumns := TFDDatSColumnList.CreateForTable(Self);
  FConstraints := TFDDatSConstraintList.CreateForTable(Self);
  FRows := TFDDatSTableRowList.CreateForTable(Self);
  FViews := TFDDatSViewList.CreateForTable(Self);
  FUpdates := TFDDatSUpdatesJournal.Create(Self);
  FUpdatesRegistry := True;
  FRefs := TFDRefCounter.Create(Self);
  FLocale := LOCALE_USER_DEFAULT;
  FCaseSensitive := True;
  FCheckNotNull := True;
  FCheckReadOnly := True;
end;

{-------------------------------------------------------------------------------}
constructor TFDDatSTable.Create(const AName: String);
begin
  Create;
  if AName <> '' then
    Name := AName;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSTable.Destroy;
begin
  FViews.Clear;
  FConstraints.Clear;
  FDataHandleMode := lmDestroying;
  FDFreeAndNil(FUpdates);
  FDFreeAndNil(FViews);
  FDFreeAndNil(FRows);
  FDFreeAndNil(FConstraints);
  FDFreeAndNil(FColumns);
  FDefaultView := nil;
  FErrors := nil;
  FDFreeAndNil(FRefs);
  FDFreeAndNil(FDataCallbacks);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Assign(AObj: TFDDatSObject);
begin
  Reset;
  inherited Assign(AObj);
  if AObj is TFDDatSTable then begin
    Rows.MinimumCapacity := TFDDatSTable(AObj).Rows.MinimumCapacity;
    FCaseSensitive := TFDDatSTable(AObj).CaseSensitive;
    FLocale := TFDDatSTable(AObj).Locale;
    FUpdatesRegistry := TFDDatSTable(AObj).FUpdatesRegistry;
    FRound2Scale := TFDDatSTable(AObj).Round2Scale;
    FCheckPrecision := TFDDatSTable(AObj).CheckPrecision;
    FStrsTrim2Len := TFDDatSTable(AObj).StrsTrim2Len;
    FCheckNotNull := TFDDatSTable(AObj).CheckNotNull;
    FCheckReadOnly := TFDDatSTable(AObj).CheckReadOnly;
    Columns.Assign(TFDDatSTable(AObj).Columns);
    Views.Assign(TFDDatSTable(AObj).Views);
    if TFDDatSTable(AObj).FDefaultView <> nil then
      FDefaultView := Views.ViewByName(TFDDatSTable(AObj).FDefaultView.Name);
    if TFDDatSTable(AObj).FErrors <> nil then
      FErrors := Views.ViewByName(TFDDatSTable(AObj).FErrors.Name);
    if TFDDatSTable(AObj).FChanges <> nil then
      FChanges := Views.ViewByName(TFDDatSTable(AObj).FChanges.Name);
    Constraints.Assign(TFDDatSTable(AObj).Constraints);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then
    Result := (MinimumCapacity = TFDDatSTable(AObj).MinimumCapacity) and
      (CaseSensitive = TFDDatSTable(AObj).CaseSensitive) and
      (Locale = TFDDatSTable(AObj).Locale) and
      (Round2Scale = TFDDatSTable(AObj).Round2Scale) and
      (CheckPrecision = TFDDatSTable(AObj).CheckPrecision) and
      (StrsTrim2Len = TFDDatSTable(AObj).StrsTrim2Len) and
      (CheckNotNull = TFDDatSTable(AObj).CheckNotNull) and
      (CheckReadOnly = TFDDatSTable(AObj).CheckReadOnly) and
      (EnforceConstraints = TFDDatSTable(AObj).EnforceConstraints) and
      Columns.IsEqualTo(TFDDatSTable(AObj).Columns) and
      Constraints.IsEqualTo(TFDDatSTable(AObj).Constraints) and
      (UpdatesRegistry = TFDDatSTable(AObj).FUpdatesRegistry);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.CountRef(AInit: Integer = 1);
begin
  FRefs.CountRef(AInit);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.AddRef;
begin
  FRefs.AddRef;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.RemRef;
begin
  FRefs.RemRef;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetIsRefCounted: Boolean;
begin
  Result := FRefs.Refs >= 0;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetRefCount: Integer;
begin
  Result := FRefs.Refs;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetTable: TFDDatSTable;
begin
  Result := Self;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetManager: TFDDatSManager;
begin
  Result := FManager;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.CheckLayoutChanging;
begin
  if (DataHandleMode <> lmDestroying) and (Rows.Count > 0) then
    FDException(Self, [S_FD_LDatS], er_FD_CantChangeTableStruct, [Name]);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.DoListRemoving;
begin
  if FDataHandleMode = lmDestroying then
    Exit;
  Views.Active := False;
  Reset;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.DoListRemoved(ANewOwner: TFDDatSObject);
begin
  FManager := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.DoListInserted;
begin
  inherited DoListInserted;
  FManager := inherited GetManager;
  if Manager <> nil then
    FUpdatesRegistry := not Manager.UpdatesRegistry;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.AcceptChanges;
var
  i: Integer;
  lastState: TFDDatSRowState;
begin
  if UpdatesRegistry then
    Updates.AcceptChanges(Self)
  else begin
    i := 0;
    while i < Rows.Count do begin
      lastState := Rows.ItemsI[i].RowState;
      Rows.ItemsI[i].AcceptChanges;
      if lastState <> rsDeleted then
        Inc(i);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.UpdateLayout;
begin
  Columns.CheckUpdateLayout;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.BeginLoadData(var AState: TFDDatSLoadState; ADataHandleMode: TFDDatSHandleMode = lmHavyMove);
var
  i: Integer;
  oChildTab: TFDDatSTable;
  pChildState: PFDDatSLoadState;
  oCol: TFDDatSColumn;
begin
  if FDataHandleMode <> lmStandard then begin
    AState.FRestoreState := False;
    Exit;
  end;
  AState.FRestoreState := True;
  if Columns.Count > 0 then
    UpdateLayout;
  if ADataHandleMode in [lmHavyFetching, lmHavyMove, lmDestroying, lmHavyLoading] then
    LockNotification;
  if ADataHandleMode <> lmRefreshing then begin
    AState.FConstraintsEnforce := Constraints.Enforce;
    Constraints.Enforce := False;
  end;
  if ADataHandleMode in [lmHavyFetching, lmHavyMove, lmDestroying, lmHavyLoading] then begin
    AState.FViewsActive := Views.Active;
    Views.Active := False;
  end;
  AState.FPrevMode := FDataHandleMode;
  FDataHandleMode := ADataHandleMode;
  if ADataHandleMode in [lmHavyFetching, lmFetching] then
    Rows.FLastRowCount := Rows.Count;
  SetLength(AState.FSubStates, 0);
  if ctInvars in Columns.FHasThings then
    for i := 0 to Columns.Count - 1 do begin
      oCol := Columns.ItemsI[i];
      if oCol.DataType in [dtRowSetRef, dtCursorRef, dtRowRef, dtArrayRef] then begin
        oChildTab := oCol.NestedTable;
        if oChildTab <> nil then begin
          New(pChildState);
          SetLength(AState.FSubStates, Length(AState.FSubStates) + 1);
          AState.FSubStates[Length(AState.FSubStates) - 1] := pChildState;
          oChildTab.BeginLoadData(pChildState^, ADataHandleMode);
        end;
      end;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.EndLoadData(var AState: TFDDatSLoadState);
var
  i, j: Integer;
  oChildTab: TFDDatSTable;
  lGlobalChanges, lRefreshing: Boolean;
  oCol: TFDDatSColumn;
begin
  if (FDataHandleMode = lmStandard) or not AState.FRestoreState then
    Exit;
  if ctInvars in Columns.FHasThings then
    try
      j := 0;
      for i := 0 to Columns.Count - 1 do begin
        oCol := Columns.ItemsI[i];
        if oCol.DataType in [dtRowSetRef, dtCursorRef, dtRowRef, dtArrayRef] then begin
          oChildTab := oCol.NestedTable;
          if oChildTab <> nil then begin
            oChildTab.EndLoadData(AState.FSubStates[j]^);
            Inc(j);
          end;
        end;
      end;
    finally
      for i := 0 to Length(AState.FSubStates) - 1 do
        Dispose(AState.FSubStates[i]);
      SetLength(AState.FSubStates, 0);
    end;
  lGlobalChanges := (FDataHandleMode in [lmHavyFetching, lmHavyMove, lmDestroying,
                                         lmHavyLoading]);
  lRefreshing := (FDataHandleMode = lmRefreshing);
  FDataHandleMode := AState.FPrevMode;
  try
    if lGlobalChanges and AState.FViewsActive then begin
      Views.Active := True;
      Views.Rebuild;
    end;
    if not lRefreshing and AState.FConstraintsEnforce then
      Constraints.Enforce := True;
    if lGlobalChanges then
      UnlockNotification;
    NotifyDataChanged(nil, rsUnchanged);
  finally
    Rows.FLastRowCount := -1;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Clear;
var
  rState: TFDDatSLoadState;
begin
  if (FDataHandleMode = lmDestroying) or (Rows.Count = 0) then
    Exit;
  BeginLoadData(rState, lmDestroying);
  try
    Rows.Clear;
    if Updates <> nil then
      Updates.Clear;
  finally
    EndLoadData(rState);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.Copy: TFDDatSTable;
var
  i: Integer;
  rState: TFDDatSLoadState;
begin
  Result := TFDDatSTable.Create;
  try
    Result.Assign(Self);
    Result.BeginLoadData(rState);
    try
      for i := 0 to Rows.Count - 1 do
        Result.Import(Rows.ItemsI[i]);
    finally
      Result.EndLoadData(rState);
    end;
  except
    FDFree(Result);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetBaseView(AStates: TFDDatSRowStates): TFDDatSView;
begin
  if FDefaultView = nil then begin
    FDefaultView := TFDDatSView.Create(Self, '', '', AStates);
    try
      FDefaultView.Creator := vcDefaultView;
      FDefaultView.Name := Views.BuildUniqueName(C_FD_SysNamePrefix + 'FDF');
    except
      FDFreeAndNil(FDefaultView);
      raise;
    end;
  end;
  Result := FDefaultView;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetDefaultView: TFDDatSView;
begin
  Result := GetBaseView(C_AllViewRows);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetFullView: TFDDatSView;
begin
  Result := GetBaseView(C_AllViewRows + [rsDeleted]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetEnforceConstraints: Boolean;
begin
  Result := Constraints.Enforce;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetErrors: TFDDatSView;
begin
  if FErrors = nil then begin
    FErrors := TFDDatSView.Create(Self, C_FD_SysNamePrefix + 'ERR',
      vcErrorView, False);
    try
      FErrors.Mechanisms.AddError;
      FErrors.Active := True;
    except
      FDFreeAndNil(FErrors);
      raise;
    end;
  end;
  Result := FErrors;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetHasErrors: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Rows.Count - 1 do
    if Rows.ItemsI[i].HasErrors then begin
      Result := True;
      Exit;
    end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetTableList: TFDDatSTableList;
begin
  Result := List as TFDDatSTableList;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if (AParam^.FReason = srDataChange) and
     (DataHandleMode in [lmHavyMove, lmHavyFetching, lmHavyLoading]) then
    Exit;
  if Columns <> nil then
    Columns.HandleNotification(AParam);
  if Constraints <> nil then
    Constraints.HandleNotification(AParam);
  if Rows <> nil then
    Rows.HandleNotification(AParam);
  if Views <> nil then
    Views.HandleNotification(AParam);
  if AParam^.FKind = snObjectRemoved then
    if AParam^.FParam2 = NativeInt(FDefaultView) then
      FDefaultView := nil
    else if AParam^.FParam2 = NativeInt(FErrors) then
      FErrors := nil
    else if AParam^.FParam2 = NativeInt(FChanges) then
      FChanges := nil;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.HasChanges(ARowStates: TFDDatSRowStates): Boolean;
var
  i: Integer;
begin
  if UpdatesRegistry then
    Result := Updates.HasChanges(Self)
  else begin
    Result := False;
    for i := 0 to Rows.Count - 1 do
      if Rows.ItemsI[i].RowState in ARowStates then begin
        Result := True;
        Break;
      end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetChangesView(ARowStates: TFDDatSRowStates): TFDDatSView;
begin
  if FChanges = nil then begin
    FChanges := TFDDatSView.Create(Self, C_FD_SysNamePrefix + 'CHV',
      vcChangesView, False);
    try
      FChanges.Mechanisms.AddStates(ARowStates);
      FChanges.Active := True;
    except
      FDFreeAndNil(FChanges);
      raise;
    end;
  end;
  Result := FChanges;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetChanges2: TFDDatSView;
begin
  Result := GetChangesView;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetChanges(ARowStates: TFDDatSRowStates): TFDDatSTable;
begin
  Result := TFDDatSTable.Create;
  Result.Assign(Self);
  Result.Import(GetChangesView(ARowStates));
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.Select(const AFilter, ASort: String;
  AStates: TFDDatSRowStates): TFDDatSView;
begin
  Result := TFDDatSView.Create(Self, AFilter, ASort, AStates);
  Result.Name := Views.BuildUniqueName(C_FD_SysNamePrefix + 'SEL');
  Result.Creator := vcSelectView;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.ImportRow(ASrcRow: TFDDatSRow);
begin
  Import(ASrcRow, nil);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.MakeColumnMap(ASrcTab: TFDDatSTable; out AColumnMap: TFDArrayOfInteger);
var
  i: Integer;
begin
  ASSERT(ASrcTab <> nil);
  SetLength(AColumnMap, Columns.Count);
  for i := 0 to Columns.Count - 1 do
    if ASrcTab = Self then
      AColumnMap[i] := i
    else begin
      AColumnMap[i] := ASrcTab.Columns.IndexOfName(Columns[i].Name);
      if (AColumnMap[i] >= 0) and
         (Columns[i].DataType in [dtRowSetRef, dtCursorRef, dtRowRef,
                                  dtArrayRef, dtParentRowRef]) and
         (Columns[i].DataType <> ASrcTab.Columns[AColumnMap[i]].DataType) then
        AColumnMap[i] := -1;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.ImportBuffer(ASrcRow, ADestRow: TFDDatSRow;
  ASrcKind, ADestKind: TFDDatSRowState; const AColumnMap: TFDArrayOfInteger);
var
  iDestColInd, iSrcColInd: Integer;
  i, iAssignMode: Integer;
  oSrcTab: TFDDatSTable;

  procedure AssignColData(ASrcKind, ADestKind: TFDDatSRowState);
  var
    iPriorSrcRowState, iPriorDestRowState: TFDDatSRowState;
    iLen: LongWord;
    pBuff: Pointer;
  begin
    iPriorSrcRowState := ASrcRow.RowState;
    iPriorDestRowState := ADestRow.RowState;
    ASrcRow.FRowState := ASrcKind;
    ADestRow.FRowState := ADestKind;
    try
      if ASrcRow.GetBuffer(rvDefault) <> nil then begin
        if ADestRow.GetBuffer(rvDefault) = nil then
          case ADestKind of
          rsImportingCurent:
            begin
              ASSERT(ADestRow.FpCurrent = nil);
              ADestRow.FpCurrent := ADestRow.AllocBuffer;
            end;
          rsImportingOriginal:
            begin
              ASSERT(ADestRow.FpOriginal = nil);
              ADestRow.FpOriginal := ADestRow.AllocBuffer;
            end;
          rsImportingProposed:
            begin
              ASSERT(ADestRow.FpProposed = nil);
              ADestRow.FpProposed := ADestRow.AllocBuffer;
            end;
          end;
        if iAssignMode = 1 then
          ADestRow.SetData(iDestColInd, ASrcRow.GetData(iSrcColInd, rvDefault))
        else if iAssignMode = 2 then begin
          iLen := 0;
          pBuff := nil;
          ASrcRow.GetData(iSrcColInd, rvDefault, pBuff, 0, iLen, False);
          ADestRow.SetData(iDestColInd, pBuff, iLen);
        end;
      end;
    finally
      ASrcRow.FRowState := iPriorSrcRowState;
      ADestRow.FRowState := iPriorDestRowState;
    end;
  end;

  procedure ImportNestedRows;
  var
    oSrcNestedRow, oDestNestedRow: TFDDatSRow;
    oDestNestedTab: TFDDatSTable;
    oSrcNestedRows: TFDDatSNestedRowList;
    j: Integer;
    aMap: TFDArrayOfInteger;
  begin
    if iAssignMode = 2 then begin
      case oSrcTab.Columns.ItemsI[iSrcColInd].DataType of
      dtRowRef, dtArrayRef:
        begin
          oSrcNestedRow := ASrcRow.NestedRow[iSrcColInd];
          if oSrcNestedRow <> nil then begin
            oDestNestedTab := Columns.ItemsI[iDestColInd].NestedTable;
            oDestNestedTab.MakeColumnMap(oSrcNestedRow.Table, aMap);
            oDestNestedRow := oDestNestedTab.NewRow(True);
            try
              oDestNestedRow.ParentRow := ADestRow;
              oDestNestedTab.Import(oSrcNestedRow, oDestNestedRow, aMap);
            except
              FDFree(oDestNestedRow);
              raise;
            end;
          end;
        end;
      dtRowSetRef, dtCursorRef:
        begin
          oSrcNestedRows := ASrcRow.NestedRows[iSrcColInd];
          if oSrcNestedRows.Count <> 0 then begin
            oDestNestedTab := Columns.ItemsI[iDestColInd].NestedTable;
            oDestNestedTab.MakeColumnMap(oSrcNestedRows[0].Table, aMap);
            for j := 0 to oSrcNestedRows.Count - 1 do begin
              oDestNestedRow := oDestNestedTab.NewRow(True);
              try
                oDestNestedRow.ParentRow := ADestRow;
                oDestNestedTab.Import(oSrcNestedRows.ItemsI[j], oDestNestedRow, aMap);
              except
                FDFree(oDestNestedRow);
                raise;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

begin
  oSrcTab := ASrcRow.Table;
  for i := 0 to Columns.Count - 1 do begin
    iDestColInd := i;
    iSrcColInd := AColumnMap[i];
    if iSrcColInd < 0 then
      iAssignMode := 0
    else if Columns[i].DataType <> oSrcTab.Columns[iSrcColInd].DataType then
      iAssignMode := 1
    else
      iAssignMode := 2;

    if Columns[i].DataType in [dtRowSetRef, dtCursorRef, dtRowRef, dtArrayRef, dtParentRowRef] then
      ImportNestedRows
    else if (ASrcKind = rsInitializing) and (ADestKind = rsInitializing) then begin
      AssignColData(rsImportingCurent, rsImportingCurent);
      AssignColData(rsImportingOriginal, rsImportingOriginal);
      AssignColData(rsImportingProposed, rsImportingProposed);
    end
    else
      AssignColData(ASrcKind, ADestKind);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Import(ASrcRow, ADestRow: TFDDatSRow;
  const AColumnMap: TFDArrayOfInteger);
begin
  ASSERT((ASrcRow <> nil) and (ASrcRow <> ADestRow) and
         ((ADestRow = nil) or (ADestRow.Table = Self)));
  if ADestRow = nil then
    ADestRow := NewRow(True)
  else begin
    if ASrcRow.FpOriginal = nil then
      ADestRow.FreeBuffer(ADestRow.FpOriginal);
    if ASrcRow.FpCurrent = nil then
      ADestRow.FreeBuffer(ADestRow.FpCurrent);
    if ASrcRow.FpProposed = nil then
      ADestRow.FreeBuffer(ADestRow.FpProposed);
  end;
  try
    ImportBuffer(ASrcRow, ADestRow, rsInitializing, rsInitializing, AColumnMap);
    if not ((ASrcRow.RowState in [rsInitializing, rsDetached]) or
            (ASrcRow.RowState = rsForceWrite) and (ASrcRow.RowPriorState = rsDetached)) and
       ((ADestRow.RowState in [rsInitializing, rsDetached]) or
        (ADestRow.RowState = rsForceWrite) and (ADestRow.RowPriorState = rsDetached)) then begin
      // sign, that we are importing row, not a real rowstate
      if ASrcRow.RowState in [rsUnchanged, rsDeleted] then
        ADestRow.FRowState := rsImportingOriginal
      else
        ADestRow.FRowState := rsImportingCurent;
      Rows.Add(ADestRow);
    end;
    ADestRow.FRowState := ASrcRow.RowState;
    ADestRow.FRowPriorState := ASrcRow.RowPriorState;
    ADestRow.RowError := ASrcRow.RowError;
    if not ((ADestRow.RowState in [rsInitializing, rsDetached]) or
            (ADestRow.RowState = rsForceWrite) and (ADestRow.RowPriorState = rsDetached)) then begin
      ADestRow.Notify(snRowStateChanged, srDataChange, NativeInt(ADestRow), 0);
      if ADestRow.RowError <> nil then
        ADestRow.Notify(snRowErrorStateChanged, srDataChange, NativeInt(ADestRow), 0);
      if ADestRow.RowState in [rsInserted, rsDeleted, rsModified] then
        ADestRow.RegisterChange;
    end;
    if not ((ADestRow.RowState in [rsEditing, rsInitializing, rsDetached]) or
            (ADestRow.RowState = rsForceWrite) and (ADestRow.RowPriorState = rsDetached)) and
       (ADestRow.FpProposed <> nil) then
      ADestRow.FreeBuffer(ADestRow.FpProposed);
  except
    FDFree(ADestRow);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Import(ASrcRow: TFDDatSRow; ADestRow: TFDDatSRow = nil);
var
  aMap: TFDArrayOfInteger;
begin
  ASSERT(ASrcRow <> nil);
  MakeColumnMap(ASrcRow.Table, aMap);
  Import(ASrcRow, ADestRow, aMap);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Import(ARowList: TFDDatSRowListBase);
var
  i: Integer;
  aMap: TFDArrayOfInteger;
  rState: TFDDatSLoadState;
begin
  ASSERT(ARowList <> nil);
  if ARowList.Count > 0 then begin
    MakeColumnMap(ARowList[0].Table, aMap);
    BeginLoadData(rState);
    try
      for i := 0 to ARowList.Count - 1 do
        Import(ARowList.ItemsI[i], nil, aMap);
    finally
      EndLoadData(rState);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Import(AView: TFDDatSView);
begin
  ASSERT(AView <> nil);
  Import(AView.Rows);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Import(ATable: TFDDatSTable);
begin
  ASSERT(ATable <> nil);
  Import(ATable.Rows);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Merge(ATable: TFDDatSTable; AData: TFDMergeDataMode;
  AMeta: TFDMergeMetaMode; AOptions: TFDMergeOptions);

  procedure UpdateRowState(ARow: TFDDatSRow; AState: TFDDatSRowState;
    AExc: EFDException);
  var
    ePrevState: TFDDatSRowState;
  begin
    ePrevState := ARow.FRowState;
    ARow.FRowState := AState;
    ARow.FRowPriorState := ePrevState;
    ARow.RowError := AExc;
    if ePrevState <> ARow.RowState then
      ARow.Notify(snRowStateChanged, srDataChange, NativeInt(ARow), 0);
    if AExc <> nil then
      ARow.Notify(snRowErrorStateChanged, srDataChange, NativeInt(ARow), 0);
    if (ARow.RowState in [rsInserted, rsDeleted, rsModified]) and
       not (ePrevState in [rsInserted, rsDeleted, rsModified]) then
      ARow.RegisterChange;
  end;

  procedure ImportInserted(ASrcRow, ADestRow: TFDDatSRow; const AMap: TFDArrayOfInteger);
  begin
    Rows.Add(ADestRow);
    if ADestRow.FpCurrent = nil then
      ADestRow.FpCurrent := ADestRow.AllocBuffer;
    ADestRow.FreeBuffer(ADestRow.FpProposed);
    if ASrcRow.RowState in [rsInserted, rsModified] then
      ImportBuffer(ASrcRow, ADestRow, rsImportingCurent, rsImportingCurent, AMap)
    else
      ImportBuffer(ASrcRow, ADestRow, rsImportingOriginal, rsImportingCurent, AMap);
    UpdateRowState(ADestRow, rsInserted, ASrcRow.RowError);
  end;

  procedure MergeByRestructuring;
  var
    oDestTab: TFDDatSTable;
  begin
    oDestTab := TFDDatSTable.Create;
    try
      oDestTab.Merge(Self, dmNone, mmMerge, []);
      oDestTab.Merge(ATable, dmNone, mmMerge, []);
      oDestTab.Merge(Self, AData, mmNone, [moPreserveState]);
      oDestTab.Merge(ATable, AData, mmNone, []);
      Clear;
      Columns.Assign(oDestTab.Columns);
      Merge(oDestTab, AData, mmNone, [moPreserveState]);
    finally
      FDFree(oDestTab);
    end;
  end;

  procedure Error(const AName, AMsg: String);
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantMerge, [AName, AMsg]);
  end;

var
  iCol, i: Integer;
  oSrcCol, oDestCol: TFDDatSColumn;
  rState: TFDDatSLoadState;
  aMap: TFDArrayOfInteger;
  sDestKey, sSrcKey: String;
  oView: TFDDatSView;
  lFound: Boolean;
  iPos: Integer;
  oSrcRow: TFDDatSRow;
  oDestRow: TFDDatSRow;
  eDestState: TFDDatSRowState;
  sName: String;
begin
                 
                                                           
                                                
                                                              
                                                                 
                                                                              
   
  if (ATable = nil) or (ATable = Self) then
    Exit;

  if AMeta = mmAddOrError then
    if Columns.Count = 0 then
      AMeta := mmAdd
    else
      AMeta := mmError;

  if AMeta <> mmNone then
    for i := 0 to ATable.Columns.Count - 1 do begin
      oSrcCol := ATable.Columns.ItemsI[i];
      if not Columns.FindRealIndex(oSrcCol.Name, iCol) then begin
        if AMeta in [mmMerge, mmAdd] then
          if Rows.Count = 0 then begin
            oDestCol := TFDDatSColumn.Create;
            oDestCol.Assign(oSrcCol);
            Columns.Add(oDestCol);
          end
          else begin
            MergeByRestructuring;
            Exit;
          end
        else if AMeta = mmError then
          Error(ATable.Name + '.' + oSrcCol.Name, 'does not exist');
      end
      else begin
        oDestCol := Columns.ItemsI[iCol];
        if (oSrcCol.DataType <> oDestCol.DataType) or (oSrcCol.Size > oDestCol.Size) then
          if AMeta in [mmMerge, mmUpdate] then
            if Rows.Count = 0 then begin
              oSrcCol.DataType := oDestCol.DataType;
              oSrcCol.Size := oDestCol.Size;
              oSrcCol.Precision := oDestCol.Precision;
              oSrcCol.Scale := oDestCol.Scale;
            end
            else begin
              MergeByRestructuring;
              Exit;
            end
          else if AMeta = mmError then
            Error(ATable.Name + '.' + oSrcCol.Name, 'type mismatch');
      end;
    end;

  if AData in [dmDataSet, dmDeltaSet] then begin
    Clear;
    case AData of
    dmDataSet:  AData := dmDataAppend;
    dmDeltaSet: AData := dmDeltaAppend;
    end;
  end;

  if AData in [dmDataMerge, dmDeltaMerge] then begin
    sDestKey := PrimaryKey;
    sSrcKey := ATable.PrimaryKey;
    if sDestKey = '' then
      Error(Name, 'no destination key defined');
    if (AMeta <> mmNone) and (sSrcKey <> '') and
       (Pos(';' + UpperCase(sDestKey) + ';', ';' + UpperCase(sSrcKey) + ';') <> 1) then
      Error(ATable.Name, 'keys are not compatible');
  end
  else
    sDestKey := '';

  if (ATable.Rows.Count > 0) and (AData <> dmNone) then begin
    MakeColumnMap(ATable, aMap);
    BeginLoadData(rState, lmLoading);
    try

      // Try to keep single merge view
      if (Rows.Count > 0) and (sDestKey <> '') then begin
        sName := C_FD_SysNamePrefix + 'MERGE';
        if Views.FindRealIndex(sName, iPos) then
          oView := Views.ItemsI[iPos]
        else begin
          oView := TFDDatSView.Create;
          oView.Name := sName;
          Views.AddEx(oView);
        end;
        oView.Sort := sDestKey;
        oView.Active := True;
      end
      else begin
        oView := nil;
        case AData of
        dmDataMerge:  AData := dmDataAppend;
        dmDeltaMerge: AData := dmDeltaAppend;
        end;
      end;

      for i := 0 to ATable.Rows.Count - 1 do begin
        oSrcRow := ATable.Rows.ItemsI[i];
        oDestRow := nil;
        if oView <> nil then begin
          ASSERT(AData in [dmDataMerge, dmDeltaMerge]);
          lFound := False;
          iPos := -1;
          oView.Search(oSrcRow, nil, nil, -1, [], iPos, lFound);

          // Data merging -> incoming data & delta is applying to existing
          // records, as their original state. Existing changes are not lost.
          if AData = dmDataMerge then begin
            if lFound then begin
              oDestRow := oView.Rows[iPos];
              if (oSrcRow.RowState = rsDeleted) and (oDestRow.RowState <> rsInserted) then
                FDFreeAndNil(oDestRow)
              else if oSrcRow.RowState <> rsDeleted then begin
                if oDestRow.FpOriginal = nil then
                  oDestRow.FpOriginal := oDestRow.AllocBuffer;
                if oSrcRow.FpCurrent <> nil then
                  ImportBuffer(oSrcRow, oDestRow, rsImportingCurent, rsImportingOriginal, aMap)
                else
                  ImportBuffer(oSrcRow, oDestRow, rsImportingOriginal, rsImportingOriginal, aMap);
                if oDestRow.RowState = rsInserted then
                  eDestState := rsModified
                else
                  eDestState := oDestRow.RowState;
                UpdateRowState(oDestRow, eDestState, nil);
              end;
            end
            else
              if oSrcRow.RowState <> rsDeleted then begin
                oDestRow := NewRow(True);
                Import(oSrcRow, oDestRow, aMap);
                oDestRow.AcceptChanges();
              end;
          end

          // Delta merging -> incoming data & delta is applying to existing
          // records, as their new state. Existing changes are overriden.
          else begin
            if lFound then begin
              oDestRow := oView.Rows[iPos];
              if oSrcRow.RowState in [rsInserted, rsModified] then begin
                if oDestRow.FpCurrent = nil then
                  oDestRow.FpCurrent := oDestRow.AllocBuffer;
                ImportBuffer(oSrcRow, oDestRow, rsImportingCurent, rsImportingCurent, aMap);
              end;
              if (oSrcRow.RowState in [rsDeleted, rsUnchanged]) or
                 (oDestRow.RowState = rsInserted) and (oSrcRow.RowState <> rsInserted) then begin
                if oDestRow.FpOriginal = nil then
                  oDestRow.FpOriginal := oDestRow.AllocBuffer;
                ImportBuffer(oSrcRow, oDestRow, rsImportingOriginal, rsImportingOriginal, aMap);
              end;
              if (oDestRow.RowState in [rsUnchanged, rsModified]) and
                 (oSrcRow.RowState = rsInserted) then
                eDestState := rsModified
              else
                eDestState := oSrcRow.RowState;
              UpdateRowState(oDestRow, eDestState, oSrcRow.RowError);
            end
            else begin
              oDestRow := NewRow(True);
              if not (moPreserveState in AOptions) and
                 (oSrcRow.RowState in [rsUnchanged, rsInserted, rsModified]) then
                ImportInserted(oSrcRow, oDestRow, aMap)
              else
                Import(oSrcRow, oDestRow, aMap);
            end;
          end;
        end

        // Data append -> Add and AcceptChanges
        // Delta append -> Add
        else begin
          ASSERT(AData in [dmDataAppend, dmDeltaAppend]);
          if (AData = dmDeltaAppend) or (oSrcRow.RowState <> rsDeleted) then begin
            oDestRow := NewRow(True);
            if (AData = dmDeltaAppend) and not (moPreserveState in AOptions) and
               (oSrcRow.RowState in [rsUnchanged, rsInserted, rsModified]) then
              ImportInserted(oSrcRow, oDestRow, aMap)
            else
              Import(oSrcRow, oDestRow, aMap);
            if AData = dmDataAppend then
              oDestRow.AcceptChanges();
          end;
        end;

        if oDestRow <> nil then begin
          Columns.FixAutoIncs(oDestRow);
          if Rows.FLastRowID <= oDestRow.RowID then
            Rows.FLastRowID := oDestRow.RowID + 1;
          if (Rows.Count >= 2) and (Rows.ItemsI[Rows.Count - 2].RowID >= oDestRow.RowID) then
            Rows.FRowIDOrdered := False;
        end;
      end;

    finally
      EndLoadData(rState);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.NewRow(ASetToDefaults: Boolean): TFDDatSRow;
begin
  Result := TFDDatSRow.CreateForTable(Self, ASetToDefaults);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.NewRow(const AValues: array of Variant;
  ASetToDefaults: Boolean): TFDDatSRow;
begin
  Result := NewRow(ASetToDefaults);
  Result.SetValues(AValues);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.NewRow(ASetToDefaults: Boolean;
  const AParentRows: array of TFDDatSRow): TFDDatSRow;
var
  oCons: TFDDatSConstraintBase;
  i, j: Integer;
begin
  Result := NewRow(ASetToDefaults);
  for i := Low(AParentRows) to High(AParentRows) do
    if AParentRows[i] <> nil then
      for j := 0 to Constraints.Count - 1 do begin
        oCons := Constraints.ItemsI[j];
        if (oCons is TFDDatSForeignKeyConstraint) and oCons.ActualEnforce and
           (TFDDatSForeignKeyConstraint(oCons).InsertRule = crCascade) and
           (TFDDatSForeignKeyConstraint(oCons).RelatedTable = AParentRows[i].Table) then
          TFDDatSForeignKeyConstraint(oCons).DoInsertAssignParentValues(AParentRows[i], Result);
      end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.RejectChanges;
var
  i: Integer;
  lastState: TFDDatSRowState;
begin
  if UpdatesRegistry then
    Updates.RejectChanges(Self)
  else begin
    i := 0;
    while i < Rows.Count do begin
      lastState := Rows.ItemsI[i].RowState;
      Rows.ItemsI[i].RejectChanges;
      if lastState <> rsInserted then
        Inc(i);
    end;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetChildRelations: TFDDatSRelationArray;
var
  oManager: TFDDatSManager;
begin
  oManager := Manager;
  if oManager <> nil then
    Result := oManager.Relations.GetRelationsForTable(False, Self);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetParentRelations: TFDDatSRelationArray;
var
  oManager: TFDDatSManager;
begin
  oManager := Manager;
  if oManager <> nil then
    Result := oManager.Relations.GetRelationsForTable(True, Self);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Reset;
var
  i: Integer;
  oRels: TFDDatSRelationArray;
begin
  oRels := nil;
  if FDataHandleMode = lmDestroying then
    Exit;
  FDataHandleMode := lmDestroying;
  try
    Constraints.Clear;
    Views.Clear;
    Updates.Clear;
    Rows.Clear;
    oRels := ParentRelations;
    for i := 0 to Length(oRels) - 1 do
      FDFree(oRels[i]);
    oRels := ChildRelations;
    for i := 0 to Length(oRels) - 1 do
      FDFree(oRels[i]);
    Columns.Clear;
  finally
    FDataHandleMode := lmStandard;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.SetEnforceConstraints(const AValue: Boolean);
begin
  Constraints.Enforce := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetMinimumCapacity: Integer;
begin
  Result := Rows.MinimumCapacity;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.SetMinimumCapacity(const AValue: Integer);
begin
  Rows.MinimumCapacity := AValue;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.LoadDataRow(const AValues: array of Variant;
  AAcceptChanges: Boolean): TFDDatSRow;
var
  oNewRow, oTrgRow: TFDDatSRow;
  i: Integer;
begin
  i := -1;
  oNewRow := NewRow(AValues, True);
  try
    i := FindRowByPK(oNewRow);
    if i = -1 then begin
      Rows.Add(oNewRow);
      if AAcceptChanges then
        oNewRow.AcceptChanges;
      Result := oNewRow;
    end
    else begin
      oTrgRow := Rows[i];
      oTrgRow.CancelEdit;
      oTrgRow.BeginEdit;
      try
        oTrgRow.SetValues(AValues);
        oTrgRow.EndEdit;
      except
        oTrgRow.CancelEdit;
        raise;
      end;
      if AAcceptChanges then
        oTrgRow.AcceptChanges;
      Result := oTrgRow;
    end;
  finally
    if i <> -1 then
      FDFree(oNewRow);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.FindRowByPK(ARow: TFDDatSRow): Integer;
var
  oKey: TFDDatSUniqueConstraint;
  oView: TFDDatSView;
begin
  oKey := Constraints.FindPrimaryKey();
  if oKey = nil then
    Result := -1
  else begin
    oView := oKey.GetUniqueSortedView();
    Result := oView.Find(ARow, []);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.Compute(const AExpression, AFilter: String): Variant;
var
  oView: TFDDatSView;
begin
  oView := Select(AFilter);
  try
    if oView.Rows.Count = 0 then
      Result := Null
    else
      Result := oView.Aggregates.Add('', AExpression).Value[0];
  finally
    FDFree(oView);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.SetLocale(const AValue: TFDLocalID);
begin
  if FLocale <> AValue then begin
    FLocale := AValue;
    Views.Rebuild;
    Constraints.CheckAll;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.SetCaseSensitive(const AValue: Boolean);
begin
  if FCaseSensitive <> AValue then begin
    FCaseSensitive := AValue;
    Views.Rebuild;
    Constraints.CheckAll;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetPrimaryKey: String;
var
  oKey: TFDDatSUniqueConstraint;
  i: Integer;
  oCol: TFDDatSColumn;
begin
  oKey := Constraints.FindPrimaryKey();
  if oKey <> nil then
    Result := oKey.ColumnNames
  else begin
    Result := '';
    for i := 0 to Columns.Count - 1 do begin
      oCol := Table.Columns[i];
      if coInKey in oCol.ActualOptions then begin
        if Result <> '' then
          Result := Result + ';';
        Result := Result + oCol.Name;
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.SetPrimaryKey(const AValue: String);
var
  oKey: TFDDatSUniqueConstraint;
begin
  if PrimaryKey <> AValue then begin
    oKey := Constraints.FindPrimaryKey();
    if AValue = '' then begin
      if oKey <> nil then
        FDFree(oKey);
    end
    else if oKey <> nil then begin
      oKey.ColumnNames := AValue;
      oKey.Enforce := True;
    end
    else
      Constraints.AddUK(Constraints.BuildUniqueName(C_FD_SysNamePrefix + 'PK'), AValue, True);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTable.GetActualOriginName: String;
begin
  Result := SourceName;
  if Assigned(MetadataCallback) then
    MetadataCallback.GetTableOrigin(Result);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.ResolveEnforceConstraints(const AName, AValue: String);
begin
  if SameText(AName, 'EnforceConstraints') and SameText(AValue, S_FD_True) then
    EnforceConstraints := True;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.ResolveInvars(const AName, AValue: String);
var
  oRel: TFDDatSRelation;
  oCol: TFDDatSColumn;
  oRow: TFDDatSRow;
  i, j, iPar: Integer;
  oParentCol: TFDDatSColumn;
begin
  if Manager <> nil then
    oRel := Manager.Relations.FindRelation(Self)
  else
    oRel := nil;
  for j := 0 to Columns.Count - 1 do begin
    oCol := Columns.ItemsI[j];
    if oCol.DataType = dtParentRowRef then begin
      oParentCol := oCol.ParentColumn;
      if oParentCol <> nil then
        Columns.FParentCol := oParentCol.Index;
      for i := 0 to Rows.Count - 1 do begin
        oRow := Rows.ItemsI[i];
        if oRel = nil then
          iPar := -1
        else
          iPar := oRel.ParentTable.Rows.IndexOf(oRow.InternalGetInvariantObject(j));
        oRow.InternalSetInvariantObject(j, 0);
        if iPar <> -1 then
          oRow.ParentRow := oRel.ParentTable.Rows[iPar];
      end;
    end;
  end;
end;

{-------------------------------------------------------------------------------}
{$HINTS OFF}
procedure TFDDatSTable.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  iIndex: Integer;
  rState: TFDDatSLoadState;
  lEnforce: Boolean;
  oBmk: TObject;
begin
  if AStorage.IsStored(siMeta) then
    Reset
  else
    Clear;
  inherited InternalLoadFromStorage(AStorage);
  if AStorage.IsStored(siMeta) then begin
    iIndex := AStorage.ReadInteger('TabID', -1);
    ASSERT((Owner = nil) or (iIndex = Index));
    CaseSensitive := AStorage.ReadBoolean('CaseSensitive', True);
    if AStorage.StreamVersion < 12 then
      EnforceConstraints := AStorage.ReadBoolean('EnforceConstraints', True)
    else begin
      EnforceConstraints := False;
      lEnforce := AStorage.ReadBoolean('EnforceConstraints', True);
      if lEnforce then
        AStorage.DeferAction('EnforceConstraints', S_FD_True, ResolveEnforceConstraints);
    end;
    Locale := AStorage.ReadLongWord('Locale', LOCALE_USER_DEFAULT);
    MinimumCapacity := AStorage.ReadInteger('MinimumCapacity', 0);
    Nested := AStorage.ReadBoolean('Nested', False);
    Round2Scale := AStorage.ReadBoolean('Round2Scale', False);
    if AStorage.StreamVersion >= 14 then
      CheckPrecision := AStorage.ReadBoolean('CheckPrecision', False);
    if AStorage.StreamVersion >= 7 then
      StrsTrim2Len := AStorage.ReadBoolean('StrsTrim2Len', False);
    CheckNotNull := AStorage.ReadBoolean('CheckNotNull', True);
    if AStorage.StreamVersion >= 6 then
      CheckReadOnly := AStorage.ReadBoolean('CheckReadOnly', True);
    if AStorage.StreamVersion >= 12 then
      Columns.InlineDataSize := Word(AStorage.ReadInteger('InlineDataSize', C_FD_DefInlineDataSize));
    Columns.LoadFromStorage(AStorage);
    Constraints.LoadFromStorage(AStorage);
    Views.LoadFromStorage(AStorage);
  end;
  if AStorage.IsStored(siData) or AStorage.IsStored(siDelta) then begin
    BeginLoadData(rState, lmHavyLoading);
    oBmk := AStorage.GetBookmark;
    try
      try
        Rows.LoadFromStorage(AStorage);
      except
        on E: EFDException do
          if (E.FDCode = er_FD_StanStrgCantReadObj) and
             (AStorage.StreamVersion = 9) then begin
            AStorage.SetBookmark(oBmk);
            Rows.LoadFromStorage(AStorage);
          end
          else
            raise;
      end;
    finally
      FDFree(oBmk);
      EndLoadData(rState);
    end;
    if Rows.Count > 0 then
      NotifyDataChanged(nil, rsInserted);
  end;
  if UpdatesRegistry and AStorage.TestObject(Updates.GetStreamingName(AStorage)) and
     AStorage.IsStored(siDelta) then
    Updates.LoadFromStorage(AStorage);
end;
{$HINTS ON}

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  oFilter: TObject;
begin
  inherited InternalSaveToStorage(AStorage);
  if AStorage.IsStored(siMeta) then begin
    AStorage.WriteInteger('TabID', Index, -1);
    AStorage.WriteBoolean('CaseSensitive', CaseSensitive, True);
    AStorage.WriteBoolean('EnforceConstraints', EnforceConstraints, True);
    AStorage.WriteLongWord('Locale', Locale, LOCALE_USER_DEFAULT);
    AStorage.WriteInteger('MinimumCapacity', MinimumCapacity, 0);
    AStorage.WriteBoolean('Nested', Nested, False);
    AStorage.WriteBoolean('Round2Scale', Round2Scale, False);
    if AStorage.StreamVersion >= 14 then
      AStorage.WriteBoolean('CheckPrecision', CheckPrecision, False);
    if AStorage.StreamVersion >= 7 then
      AStorage.WriteBoolean('StrsTrim2Len', StrsTrim2Len, False);
    AStorage.WriteBoolean('CheckNotNull', CheckNotNull, True);
    if AStorage.StreamVersion >= 6 then
      AStorage.WriteBoolean('CheckReadOnly', CheckReadOnly, True);
    if AStorage.StreamVersion >= 12 then
      AStorage.WriteInteger('InlineDataSize', Columns.InlineDataSize, C_FD_DefInlineDataSize);
    Columns.SaveToStorage(AStorage);
    Constraints.SaveToStorage(AStorage);
    Views.SaveToStorage(AStorage);
  end;
  if AStorage.IsStored(siData) or AStorage.IsStored(siDelta) then
    if AStorage.IsStored(siVisible) then begin
      oFilter := AStorage.GetFilterObj(Self);
      if (oFilter <> nil) and (Views.IndexOf(TFDDatSView(oFilter)) <> -1) then
        TFDDatSView(oFilter).Rows.SaveToStorage(AStorage)
      else
        Rows.SaveToStorage(AStorage);
    end
    else
      Rows.SaveToStorage(AStorage);
  if UpdatesRegistry and AStorage.IsStored(siDelta) then
    Updates.SaveToStorage(AStorage);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.AddDataCallback(const ACallback: IFDDatSTableDataCallback);
begin
  if FDataCallbacks = nil then
    FDataCallbacks := TInterfaceList.Create;
  if FDataCallbacks.IndexOf(ACallback) = -1 then
    FDataCallbacks.Add(ACallback);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.RemoveDataCallback(const ACallback: IFDDatSTableDataCallback;
  ARemoveLastOne: Boolean);
begin
  if FDataCallbacks = nil then
    Exit;
  FDataCallbacks.Remove(ACallback);
  if ARemoveLastOne and (FDataCallbacks.Count = 1) then
    FDataCallbacks.Clear;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.NotifyDataChanged(ARow: TFDDatSRow; AChangeKind: TFDDatSRowState);
var
  i: Integer;
begin
  if (FDataCallbacks = nil) or
     (DataHandleMode in [lmHavyMove, lmHavyLoading, lmHavyFetching, lmFetching, lmRefreshing]) then
    Exit;
  for i := 0 to FDataCallbacks.Count - 1 do
    IFDDatSTableDataCallback(FDataCallbacks[i]).TableDataChanged(ARow, AChangeKind);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSTable.Setup(const AOptions: IFDStanOptions);
begin
  ASSERT(AOptions <> nil);
  MinimumCapacity := AOptions.FetchOptions.ActualRowsetSize;
  if Rows.Count = 0 then
    Columns.InlineDataSize := AOptions.FormatOptions.InlineDataSize;

  Round2Scale := AOptions.FormatOptions.Round2Scale;
  CheckPrecision := AOptions.FormatOptions.CheckPrecision;
  StrsTrim2Len := AOptions.FormatOptions.StrsTrim2Len;
  Locale := AOptions.FormatOptions.SortLocale;

  CheckNotNull := AOptions.UpdateOptions.CheckRequired;
  CheckReadOnly := AOptions.UpdateOptions.CheckReadOnly;
end;

{-------------------------------------------------------------------------------}
{- TFDDatSTableList                                                            -}
{-------------------------------------------------------------------------------}
constructor TFDDatSTableList.CreateForManager(AManager: TFDDatSManager);
begin
  ASSERT(AManager <> nil);
  inherited Create;
  FOwner := AManager;
  OwnObjects := True;
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableList.Add(AObj: TFDDatSTable): Integer;
begin
  Result := AddObject(AObj);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableList.Add(const AName: String): TFDDatSTable;
begin
  Result := TFDDatSTable.Create(AName);
  AddEx(Result);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableList.GetItemsI(AIndex: Integer): TFDDatSTable;
begin
  ASSERT((AIndex >= 0) and (AIndex < FCount));
  Result := TFDDatSTable(FArray[AIndex]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSTableList.TableByName(const AName: String): TFDDatSTable;
begin
  Result := TFDDatSTable(inherited ItemByName(AName));
end;

{-------------------------------------------------------------------------------}
{- TFDDatSUpdatesJournal                                                       -}
{-------------------------------------------------------------------------------}
constructor TFDDatSUpdatesJournal.Create(AOwner: TFDDatSObject);
begin
  ASSERT(AOwner <> nil);
  inherited Create;
  FOwner := AOwner;
  Clear;
end;

{-------------------------------------------------------------------------------}
class function TFDDatSUpdatesJournal.GetClassPrefix: String;
begin
  Result := 'TFDDatS';
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.Lock;
begin
  Inc(FLocked);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.Unlock;
begin
  Dec(FLocked);
end;

{-------------------------------------------------------------------------------}
function TFDDatSUpdatesJournal.GetLocked: Boolean;
begin
  Result := FLocked > 0;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUpdatesJournal.HasChanges(AOwner: TFDDatSObject): Boolean;
begin
  Result := FirstChange(AOwner) <> nil;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUpdatesJournal.FirstChange(AOwner: TFDDatSObject): TFDDatSRow;
var
  iMode: Integer;
  lFound: Boolean;
begin
  Result := FFirstChange;
  if AOwner = nil then
    iMode := 0
  else if AOwner is TFDDatSTable then
    iMode := 1
  else
    iMode := 2;
  lFound := False;
  while (Result <> nil) and not lFound do begin
    case iMode of
    0: lFound := True;
    1: lFound := (Result.Table = AOwner);
    2: lFound := (Result.Manager = AOwner);
    end;
    if not lFound then
      Result := Result.FNextChange;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUpdatesJournal.NextChange(ACurRow: TFDDatSRow;
  AOwner: TFDDatSObject): TFDDatSRow;
var
  iMode: Integer;
  lFound: Boolean;
begin
  if ACurRow = nil then begin
    Result := nil;
    Exit;
  end;
  Result := ACurRow.FNextChange;
  if AOwner = nil then
    iMode := 0
  else if AOwner is TFDDatSTable then
    iMode := 1
  else
    iMode := 2;
  lFound := False;
  while (Result <> nil) and not lFound do begin
    case iMode of
    0: lFound := True;
    1: lFound := (Result.Table = AOwner);
    2: lFound := (Result.Manager = AOwner);
    end;
    if not lFound then
      Result := Result.FNextChange;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUpdatesJournal.LastChange(AOwner: TFDDatSObject): TFDDatSRow;
var
  iMode: Integer;
  lFound: Boolean;
begin
  Result := FLastChange;
  if AOwner = nil then
    iMode := 0
  else if AOwner is TFDDatSTable then
    iMode := 1
  else
    iMode := 2;
  lFound := False;
  while (Result <> nil) and not lFound do begin
    case iMode of
    0: lFound := True;
    1: lFound := (Result.Table = AOwner);
    2: lFound := (Result.Manager = AOwner);
    end;
    if not lFound then
      Result := Result.FPriorChange;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.AppendRow(ARow: TFDDatSRow);
begin
  if FFirstChange = nil then begin
    FLastChange := ARow;
    FFirstChange := ARow;
    ARow.FNextChange := nil;
    ARow.FPriorChange := nil;
  end
  else begin
    FLastChange.FNextChange := ARow;
    ARow.FPriorChange := FLastChange;
    ARow.FNextChange := nil;
    FLastChange := ARow;
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSUpdatesJournal.RegisterRow(ARow: TFDDatSRow): Integer;
begin
  ASSERT(ARow <> nil);
  if ARow.FChangeNumber <> $FFFFFFFF then
    if (FLocked > 0) or (ARow.RowState = rsInserted) then begin
      Result := ARow.FChangeNumber;
      Exit;
    end
    else
      UnregisterRow(ARow);
  ARow.FChangeNumber := FChangeNumber;
  AppendRow(ARow);
  Result := FChangeNumber;
  ASSERT(FChangeNumber <> $FFFFFFFF);
  Inc(FChangeNumber);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.UnregisterRow(ARow: TFDDatSRow);
begin
  ASSERT(ARow <> nil);
  if ARow.FNextChange <> nil then
    ARow.FNextChange.FPriorChange := ARow.FPriorChange;
  if ARow.FPriorChange <> nil then
    ARow.FPriorChange.FNextChange := ARow.FNextChange;
  if FFirstChange = ARow then
    FFirstChange := ARow.FNextChange;
  if FLastChange = ARow then
    FLastChange := ARow.FPriorChange;
  if FTmpNextRow = ARow then
    FTmpNextRow := ARow.FNextChange;
  ARow.FChangeNumber := $FFFFFFFF;
  ARow.FPriorChange := nil;
  ARow.FNextChange := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.SetSavePoint(const AValue: LongWord);
var
  oRow, oPriorRow: TFDDatSRow;
begin
  oRow := FLastChange;
  while (oRow <> nil) and (oRow.FChangeNumber >= AValue) do begin
    oPriorRow := oRow.FPriorChange;
    oRow.RejectChanges;
    oRow := oPriorRow;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.AcceptChanges(AOwner: TFDDatSObject);
var
  oRow: TFDDatSRow;
  iMode: Integer;
begin
  ASSERT(FTmpNextRow = nil);
  if AOwner = nil then
    iMode := 0
  else if AOwner is TFDDatSTable then
    iMode := 1
  else
    iMode := 2;
  oRow := FFirstChange;
  try
    while oRow <> nil do begin
      FTmpNextRow := oRow.FNextChange;
      case iMode of
      0:
        oRow.AcceptChanges;
      1:
        if oRow.Table = AOwner then
          oRow.AcceptChanges;
      2:
        if oRow.Manager = AOwner then
          oRow.AcceptChanges;
      end;
      oRow := FTmpNextRow;
    end;
  finally
    FTmpNextRow := nil;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.RejectChanges(AOwner: TFDDatSObject);
begin
  SetSavePoint(0);
end;

{-------------------------------------------------------------------------------}
function TFDDatSUpdatesJournal.GetCount(AOwner: TFDDatSObject = nil): Integer;
var
  oRow, oNextRow: TFDDatSRow;
  iMode: Integer;
begin
  if AOwner = nil then
    iMode := 0
  else if AOwner is TFDDatSTable then
    iMode := 1
  else
    iMode := 2;
  oRow := FFirstChange;
  Result := 0;
  while oRow <> nil do begin
    oNextRow := oRow.FNextChange;
    case iMode of
    0:
      Inc(Result);
    1:
      if oRow.Table = AOwner then
        Inc(Result);
    2:
      if oRow.Manager = AOwner then
        Inc(Result);
    end;
    oRow := oNextRow;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.Clear;
begin
  FChangeNumber := 0;
  FFirstChange := nil;
  FLastChange := nil;
  FTmpNextRow := nil;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  sName: String;
  oRow: TFDDatSRow;
  oTab: TFDDatSTable;
  iTID: Integer;
  iRID: LongWord;
  iChangeNumber: LongWord;
  i: Integer;
begin
  if not AStorage.IsStored(siDelta) then
    Exit;
  FChangeNumber := AStorage.ReadLongWord('SavePoint', 0);
  if AStorage.StreamVersion >= 11 then begin
    AStorage.ReadObjectBegin('Changes', osFlatArray);
    sName := 'Changes';
  end
  else
    sName := GetStreamingName(AStorage);
  while not AStorage.IsObjectEnd(sName) do begin
    AStorage.ReadObjectBegin('Change', osObject);
    if FOwner is TFDDatSManager then begin
      iTID := AStorage.ReadInteger('TabID', -1);
      oTab := TFDDatSManager(FOwner).Tables[iTID];
    end
    else
      oTab := TFDDatSTable(FOwner);
    iRID := AStorage.ReadLongWord('RowID', $FFFFFFFF);
    iChangeNumber := AStorage.ReadLongWord('ChangeNumber', $FFFFFFFF);
    i := oTab.Rows.IndexOf(iRID);
    if i <> -1 then begin
      oRow := oTab.Rows.ItemsI[i];
      oRow.FChangeNumber := iChangeNumber;
      AppendRow(oRow);
    end;
    AStorage.ReadObjectEnd('Change', osObject);
  end;
  if AStorage.StreamVersion >= 11 then
    AStorage.ReadObjectEnd('Changes', osFlatArray);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSUpdatesJournal.InternalSaveToStorage(const AStorage: IFDStanStorage);
var
  oRow: TFDDatSRow;
begin
  if not AStorage.IsStored(siDelta) then
    Exit;
  AStorage.WriteLongWord('SavePoint', SavePoint, 0);
  if AStorage.StreamVersion >= 11 then
    AStorage.WriteObjectBegin('Changes', osFlatArray);
  oRow := FirstChange(nil);
  while oRow <> nil do begin
    AStorage.WriteObjectBegin('Change', osObject);
    if FOwner is TFDDatSManager then
      AStorage.WriteInteger('TabID', oRow.Table.Index, -1);
    AStorage.WriteLongWord('RowID', oRow.RowID, $FFFFFFFF);
    AStorage.WriteLongWord('ChangeNumber', oRow.ChangeNumber, $FFFFFFFF);
    AStorage.WriteObjectEnd('Change', osObject);
    oRow := NextChange(oRow, nil);
  end;
  if AStorage.StreamVersion >= 11 then
    AStorage.WriteObjectEnd('Changes', osFlatArray);
end;

{-------------------------------------------------------------------------------}
{- TFDDatSManager                                                              -}
{-------------------------------------------------------------------------------}
constructor TFDDatSManager.Create;
begin
  inherited Create;
  FUpdates := TFDDatSUpdatesJournal.Create(Self);
  FTables := TFDDatSTableList.CreateForManager(Self);
  FRelations := TFDDatSRelationList.CreateForManager(Self);
  FEnforceConstraints := True;
  FUpdatesRegistry := False;
  FRefs := TFDRefCounter.Create(Self);
  FCaseSensitive := True;
  FLocale := LOCALE_USER_DEFAULT;
  FCheckNotNull := True;
  FCheckReadOnly := True;
end;

{-------------------------------------------------------------------------------}
destructor TFDDatSManager.Destroy;
begin
  FDFreeAndNil(FUpdates);
  FDFreeAndNil(FTables);
  FDFreeAndNil(FRelations);
  FDFreeAndNil(FRefs);
  inherited Destroy;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.Assign(AObj: TFDDatSObject);
begin
  Reset;
  inherited Assign(AObj);
  if AObj is TFDDatSManager then begin
    CaseSensitive := TFDDatSManager(AObj).CaseSensitive;
    Locale := TFDDatSManager(AObj).Locale;
    Round2Scale := TFDDatSManager(AObj).Round2Scale;
    CheckPrecision := TFDDatSManager(AObj).CheckPrecision;
    StrsTrim2Len := TFDDatSManager(AObj).StrsTrim2Len;
    CheckNotNull := TFDDatSManager(AObj).CheckNotNull;
    CheckReadOnly := TFDDatSManager(AObj).CheckReadOnly;
    EnforceConstraints := TFDDatSManager(AObj).EnforceConstraints;
    UpdatesRegistry := TFDDatSManager(AObj).UpdatesRegistry;
    Tables.Assign(TFDDatSManager(AObj).Tables);
    Relations.Assign(TFDDatSManager(AObj).Relations);
  end;
end;

{-------------------------------------------------------------------------------}
function TFDDatSManager.IsEqualTo(AObj: TFDDatSObject): Boolean;
begin
  Result := inherited IsEqualTo(AObj);
  if Result then
    Result := (CaseSensitive = TFDDatSManager(AObj).CaseSensitive) and
      (Locale = TFDDatSManager(AObj).Locale) and
      (Round2Scale = TFDDatSManager(AObj).Round2Scale) and
      (CheckPrecision = TFDDatSManager(AObj).CheckPrecision) and
      (StrsTrim2Len = TFDDatSManager(AObj).StrsTrim2Len) and
      (CheckNotNull = TFDDatSManager(AObj).CheckNotNull) and
      (CheckReadOnly = TFDDatSManager(AObj).CheckReadOnly) and
      (EnforceConstraints = TFDDatSManager(AObj).EnforceConstraints) and
      (UpdatesRegistry = TFDDatSManager(AObj).UpdatesRegistry) and
      Tables.IsEqualTo(TFDDatSManager(AObj).Tables) and
      Relations.IsEqualTo(TFDDatSManager(AObj).Relations);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.CountRef(AInit: Integer = 1);
begin
  FRefs.CountRef(AInit);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.AddRef;
begin
  FRefs.AddRef;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.RemRef;
begin
  FRefs.RemRef;
end;

{-------------------------------------------------------------------------------}
function TFDDatSManager.GetIsRefCounted: Boolean;
begin
  Result := FRefs.Refs >= 0;
end;

{-------------------------------------------------------------------------------}
function TFDDatSManager.GetRefs: Integer;
begin
  Result := FRefs.Refs;
end;

{-------------------------------------------------------------------------------}
function TFDDatSManager.GetManager: TFDDatSManager;
begin
  Result := Self;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.AcceptChanges;
var
  i: Integer;
begin
  if UpdatesRegistry then
    Updates.AcceptChanges(Self)
  else
    for i := 0 to Tables.Count - 1 do
      Tables.ItemsI[i].AcceptChanges;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.Clear;
var
  i: Integer;
begin
  for i := 0 to Tables.Count - 1 do
    Tables.ItemsI[i].Clear;
end;

{-------------------------------------------------------------------------------}
function TFDDatSManager.Copy: TFDDatSManager;
var
  i: Integer;
  j: Integer;
  oSrcTab: TFDDatSTable;
  oDestTab: TFDDatSTable;
  rState: TFDDatSLoadState;
begin
  Result := TFDDatSManager.Create;
  try
    Result.Assign(Self);
    for i := 0 to Tables.Count - 1 do begin
      oSrcTab := Tables.ItemsI[i];
      oDestTab := Result.Tables.ItemsI[i];
      oDestTab.BeginLoadData(rState);
      try
        for j := 0 to oSrcTab.Rows.Count - 1 do
          oDestTab.Import(oSrcTab.Rows.ItemsI[j]);
      finally
        oDestTab.EndLoadData(rState);
      end;
    end;
  except
    FDFree(Result);
    raise;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.BeginLoadData(var AStates: TFDDatSLoadStates; ADataHandleMode: TFDDatSHandleMode);
var
  i: Integer;
begin
  SetLength(AStates, Tables.Count);
  for i := 0 to Tables.Count - 1 do
    Tables.ItemsI[i].BeginLoadData(AStates[i], ADataHandleMode);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.EndLoadData(const AStates: TFDDatSLoadStates);
var
  i: Integer;
begin
  for i := 0 to Tables.Count - 1 do
    Tables.ItemsI[i].EndLoadData(AStates[i]);
end;

{-------------------------------------------------------------------------------}
function TFDDatSManager.GetHasErrors: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Tables.Count - 1 do
    if Tables.ItemsI[i].HasErrors then begin
      Result := True;
      Exit;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.HandleNotification(AParam: PFDDatSNotifyParam);
begin
  if Relations <> nil then
    Relations.HandleNotification(AParam);
  if Tables <> nil then
    Tables.HandleNotification(AParam);
end;

{-------------------------------------------------------------------------------}
function TFDDatSManager.HasChanges(ARowStates: TFDDatSRowStates): Boolean;
var
  i: Integer;
begin
  if UpdatesRegistry then
    Result := Updates.HasChanges(Self)
  else begin
    Result := False;
    for i := 0 to Tables.Count - 1 do
      if Tables.ItemsI[i].HasChanges(ARowStates) then begin
        Result := True;
        Exit;
      end;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.Merge(AManager: TFDDatSManager; AData: TFDMergeDataMode;
  AMeta: TFDMergeMetaMode; AOptions: TFDMergeOptions);

  procedure Error(const AName, AMsg: String);
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantMerge, [AName, AMsg]);
  end;

var
  i: Integer;
  oSrcTab, oDestTab: TFDDatSTable;
  iTab: Integer;
  oParTab, oChldTab: TFDDatSTable;
  oSrcRel: TFDDatSRelation;
  iPar, iChld, iRel: Integer;
begin
  if AManager = nil then
    Exit;

  if AMeta = mmAddOrError then
    if Tables.Count = 0 then
      AMeta := mmAdd
    else
      AMeta := mmError;

  for i := 0 to AManager.Tables.Count - 1 do begin
    oSrcTab := AManager.Tables.ItemsI[i];
    oDestTab := nil;
    if not Tables.FindRealIndex(oSrcTab.Name, iTab) then begin
      if AMeta in [mmMerge, mmAdd] then begin
        oDestTab := Tables.Add(oSrcTab.Name);
        oDestTab.Assign(oSrcTab);
      end
      else if AMeta = mmError then
        Error(oSrcTab.Name, 'does not exist');
    end
    else
      oDestTab := Tables.ItemsI[iTab];
    if oDestTab <> nil then
      oDestTab.Merge(oSrcTab, AData, AMeta, AOptions);
  end;

  if AMeta in [mmMerge, mmAdd] then
    for i := 0 to AManager.Relations.Count - 1 do begin
      oSrcRel := AManager.Relations.ItemsI[i];
      if not Relations.FindRealIndex(oSrcRel.Name, iRel) then begin
        oParTab := nil;
        oChldTab := nil;
        if (oSrcRel.ParentTable <> nil) and Tables.FindRealIndex(oSrcRel.ParentTable.Name, iPar) then
          oParTab := Tables.ItemsI[iPar];
        if (oSrcRel.ChildTable <> nil) and Tables.FindRealIndex(oSrcRel.ChildTable.Name, iChld) then
          oChldTab := Tables.ItemsI[iChld];
        if (oParTab <> nil) and (oChldTab <> nil) and
           (Relations.FindRelation(oParTab, oChldTab, oSrcRel.Nested) = nil) then
          Relations.Add(oSrcRel.Name, oSrcRel.ParentColumnNames, oSrcRel.ChildColumnNames,
            oParTab, oChldTab, oSrcRel.Nested,
            (oSrcRel.ParentKeyConstraint <> nil) or (oSrcRel.ChildKeyConstraint <> nil));
      end;
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.LoadFromStorage(const AStorage: IFDStanStorage;
  AMergeData: TFDMergeDataMode; AMergeMeta: TFDMergeMetaMode; AOptions: TFDMergeOptions);
var
  oMan: TFDDatSManager;
begin
  if (AMergeData <> dmNone) or (AMergeMeta <> mmNone) then begin
    oMan := TFDDatSManager.Create;
    try
      oMan.LoadFromStorage(AStorage);
      Merge(oMan, AMergeData, AMergeMeta, AOptions);
    finally
      FDFree(oMan);
    end;
  end
  else
    LoadFromStorage(AStorage);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.RejectChanges;
var
  i: Integer;
begin
  if UpdatesRegistry then
    Updates.RejectChanges(Self)
  else
    for i := 0 to Tables.Count - 1 do
      Tables.ItemsI[i].RejectChanges;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.Reset;
begin
  Tables.Clear;
  Relations.Clear;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetEnforceConstraints(const AValue: Boolean);
var
  i: Integer;
begin
  if FEnforceConstraints <> AValue then begin
    FEnforceConstraints := AValue;
    for i := 0 to Tables.Count - 1 do
      Tables.ItemsI[i].Constraints.EnforceUpdated;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetUpdatesRegistry(const AValue: Boolean);
  procedure ErrorCantSetUpdReg;
  begin
    FDException(Self, [S_FD_LDatS], er_FD_CantSetUpdReg, [Name]);
  end;
var
  i: Integer;
begin
  if UpdatesRegistry <> AValue then begin
    for i := 0 to Tables.Count - 1 do
      if Tables.ItemsI[i].HasChanges([rsInserted, rsDeleted, rsModified]) then
        ErrorCantSetUpdReg;
    for i := 0 to Tables.Count - 1 do
      Tables.ItemsI[i].FUpdatesRegistry := not AValue;
    FUpdatesRegistry := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
function DoCompRootTabs(Item1, Item2: Pointer): Integer;
var
  iID1, iID2: Integer;
begin
  if TFDDatSTable(Item1).SourceID > 0 then
    iID1 := TFDDatSTable(Item1).SourceID
  else
    iID1 := 1000 + TFDDatSTable(Item1).Index;
  if TFDDatSTable(Item2).SourceID > 0 then
    iID2 := TFDDatSTable(Item2).SourceID
  else
    iID2 := 1000 + TFDDatSTable(Item2).Index;
  Result := iID1 - iID2;
end;

{$IFDEF AUTOREFCOUNT}
type
  TFDDatSTableComparer = class(TInterfacedObject, IComparer<TObject>)
    function Compare(const Left, Right: TObject): Integer;
  end;

function TFDDatSTableComparer.Compare(const Left, Right: TObject): Integer;
begin
  Result := DoCompRootTabs(Left, Right);
end;
{$ENDIF}

function TFDDatSManager.GetRootTables: TFDDatSTableArray;
var
  i, j: Integer;
  lInRoot: Boolean;
  oList: TFDObjList;
begin
  if Tables.Count = 1 then begin
    SetLength(Result, 1);
    Result[0] := Tables.ItemsI[0];
    Exit;
  end;
  oList := TFDObjList.Create;
  try
    for i := 0 to Tables.Count - 1 do begin
      lInRoot := True;
      for j := 0 to Relations.Count - 1 do
        if Relations.ItemsI[j].ChildTable = Tables.ItemsI[i] then begin
          lInRoot := False;
          Break;
        end;
      if lInRoot then
        oList.Add(Tables.ItemsI[i]);
    end;
    if oList.Count > 1 then
      oList.Sort({$IFDEF AUTOREFCOUNT} TFDDatSTableComparer.Create {$ELSE} DoCompRootTabs {$ENDIF});
    SetLength(Result, oList.Count);
    for i := 0 to oList.Count - 1 do
      Result[i] := TFDDatSTable(oList[i]);
  finally
    FDFree(oList);
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetCaseSensitive(const AValue: Boolean);
var
  i: Integer;
begin
  if FCaseSensitive <> AValue then begin
    FCaseSensitive := AValue;
    for i := 0 to Tables.Count - 1 do
      Tables[i].CaseSensitive := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetLocale(const AValue: TFDLocalID);
var
  i: Integer;
begin
  if FLocale <> AValue then begin
    FLocale := AValue;
    for i := 0 to Tables.Count - 1 do
      Tables[i].Locale := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetRound2Scale(const AValue: Boolean);
var
  i: Integer;
begin
  if FRound2Scale <> AValue then begin
    FRound2Scale := AValue;
    for i := 0 to Tables.Count - 1 do
      Tables[i].Round2Scale := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetCheckPrecision(const AValue: Boolean);
var
  i: Integer;
begin
  if FCheckPrecision <> AValue then begin
    FCheckPrecision := AValue;
    for i := 0 to Tables.Count - 1 do
      Tables[i].CheckPrecision := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetStrsTrim2Len(const AValue: Boolean);
var
  i: Integer;
begin
  if FStrsTrim2Len <> AValue then begin
    FStrsTrim2Len := AValue;
    for i := 0 to Tables.Count - 1 do
      Tables[i].StrsTrim2Len := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetCheckNotNull(const AValue: Boolean);
var
  i: Integer;
begin
  if FCheckNotNull <> AValue then begin
    FCheckNotNull := AValue;
    for i := 0 to Tables.Count - 1 do
      Tables[i].CheckNotNull := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.SetCheckReadOnly(const AValue: Boolean);
var
  i: Integer;
begin
  if FCheckReadOnly <> AValue then begin
    FCheckReadOnly := AValue;
    for i := 0 to Tables.Count - 1 do
      Tables[i].CheckReadOnly := AValue;
  end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.InternalLoadFromStorage(const AStorage: IFDStanStorage);
var
  i: Integer;
  oTab: TFDDatSTable;
begin
  if AStorage.IsStored(siMeta) then
    Reset
  else
    Clear;
  inherited InternalLoadFromStorage(AStorage);
  if AStorage.IsStored(siMeta) then begin
    CaseSensitive := AStorage.ReadBoolean('CaseSensitive', True);
    EnforceConstraints := AStorage.ReadBoolean('EnforceConstraints', True);
    Locale := AStorage.ReadLongWord('Locale', LOCALE_USER_DEFAULT);
    UpdatesRegistry := AStorage.ReadBoolean('UpdatesRegistry', False);
    Round2Scale := AStorage.ReadBoolean('Round2Scale', False);
    if AStorage.StreamVersion >= 14 then
      CheckPrecision := AStorage.ReadBoolean('CheckPrecision', False);
    if AStorage.StreamVersion >= 7 then
      StrsTrim2Len := AStorage.ReadBoolean('StrsTrim2Len', False);
    CheckNotNull := AStorage.ReadBoolean('CheckNotNull', True);
    if AStorage.StreamVersion >= 6 then
      CheckReadOnly := AStorage.ReadBoolean('CheckReadOnly', True);
  end;
  Tables.LoadFromStorage(AStorage);
  if AStorage.IsStored(siMeta) then
    Relations.LoadFromStorage(AStorage);
  if UpdatesRegistry and AStorage.TestObject(Updates.GetStreamingName(AStorage)) and
     AStorage.IsStored(siDelta) then
    Updates.LoadFromStorage(AStorage);
  if AStorage.StreamVersion >= 15 then
    for i := 0 to Tables.Count - 1 do begin
      oTab := Tables.ItemsI[i];
      if ctInvars in oTab.Columns.HasThings then
        AStorage.DeferAction('ResolveInvars', S_FD_True, oTab.ResolveInvars);
    end;
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.InternalSaveToStorage(const AStorage: IFDStanStorage);
begin
  inherited InternalSaveToStorage(AStorage);
  if AStorage.IsStored(siMeta) then begin
    AStorage.WriteBoolean('CaseSensitive', CaseSensitive, True);
    AStorage.WriteBoolean('EnforceConstraints', EnforceConstraints, True);
    AStorage.WriteLongWord('Locale', Locale, LOCALE_USER_DEFAULT);
    AStorage.WriteBoolean('UpdatesRegistry', UpdatesRegistry, False);
    AStorage.WriteBoolean('Round2Scale', Round2Scale, False);
    if AStorage.StreamVersion >= 14 then
      AStorage.WriteBoolean('CheckPrecision', CheckPrecision, False);
    if AStorage.StreamVersion >= 7 then
      AStorage.WriteBoolean('StrsTrim2Len', StrsTrim2Len, False);
    AStorage.WriteBoolean('CheckNotNull', CheckNotNull, True);
    if AStorage.StreamVersion >= 6 then
      AStorage.WriteBoolean('CheckReadOnly', CheckReadOnly, True);
  end;
  Tables.SaveToStorage(AStorage);
  if AStorage.IsStored(siMeta) then
    Relations.SaveToStorage(AStorage);
  if UpdatesRegistry and AStorage.IsStored(siDelta) then
    Updates.SaveToStorage(AStorage);
end;

{-------------------------------------------------------------------------------}
procedure TFDDatSManager.Setup(const AOptions: IFDStanOptions);
var
  i: Integer;
begin
  for i := 0 to Tables.Count - 1 do begin
    Tables[i].Columns.InlineDataSize := AOptions.FormatOptions.InlineDataSize;
    Tables[i].MinimumCapacity := AOptions.FetchOptions.ActualRowsetSize;
  end;
  Round2Scale := AOptions.FormatOptions.Round2Scale;
  CheckPrecision := AOptions.FormatOptions.CheckPrecision;
  StrsTrim2Len := AOptions.FormatOptions.StrsTrim2Len;
  Locale := AOptions.FormatOptions.SortLocale;

  CheckNotNull := AOptions.UpdateOptions.CheckRequired;
  CheckReadOnly := AOptions.UpdateOptions.CheckReadOnly;
end;

{-------------------------------------------------------------------------------}
var
  oMan: TFDStorageManager;

initialization
  oMan := FDStorageManager();
  oMan.RegisterClass(TFDDatSObject);
  oMan.RegisterClass(TFDDatSNamedObject);
  oMan.RegisterClass(TFDDatSList);
  oMan.RegisterClass(TFDDatSNamedList);
  oMan.RegisterClass(TFDDatSColumn);
  oMan.RegisterClass(TFDDatSColumnList);
  oMan.RegisterClass(TFDDatSConstraintBase);
  oMan.RegisterClass(TFDDatSConstraintList);
  oMan.RegisterClass(TFDDatSUniqueConstraint);
  oMan.RegisterClass(TFDDatSForeignKeyConstraint);
  oMan.RegisterClass(TFDDatSCheckConstraint);
  oMan.RegisterClass(TFDDatSRelation);
  oMan.RegisterClass(TFDDatSRelationList);
  oMan.RegisterClass(TFDDatSMechBase);
  oMan.RegisterClass(TFDDatSViewMechList);
  oMan.RegisterClass(TFDDatSMechSort);
  oMan.RegisterClass(TFDDatSMechRowState);
  oMan.RegisterClass(TFDDatSMechRange);
  oMan.RegisterClass(TFDDatSMechFilter);
  oMan.RegisterClass(TFDDatSMechError);
  oMan.RegisterClass(TFDDatSMechDetails);
  oMan.RegisterClass(TFDDatSMechChilds);
  oMan.RegisterClass(TFDDatSMechMaster);
  oMan.RegisterClass(TFDDatSMechParent);
  oMan.RegisterClass(TFDDatSRow);
  oMan.RegisterClassAlias('DatSRow', TFDDatSRow);
  oMan.RegisterClass(TFDDatSRowListBase);
  oMan.RegisterClass(TFDDatSView);
  oMan.RegisterClass(TFDDatSViewList);
  oMan.RegisterClass(TFDDatSAggregate);
  oMan.RegisterClass(TFDDatSAggregateList);
  oMan.RegisterClass(TFDDatSTable);
  oMan.RegisterClass(TFDDatSTableList);
  oMan.RegisterClass(TFDDatSManager);

end.
