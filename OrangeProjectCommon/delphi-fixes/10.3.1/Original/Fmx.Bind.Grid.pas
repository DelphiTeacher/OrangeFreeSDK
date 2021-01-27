{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2012-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

{$HPPEMIT LINKUNIT}
unit Fmx.Bind.Grid;

interface

uses System.SysUtils, System.Classes, Data.Bind.Components, Data.Bind.Grid, FMX.Types, FMX.Edit, System.Bindings.Outputs,
  FMX.Grid, System.Generics.Collections;

implementation

uses
  System.RTLConsts, FMX.Consts, Fmx.Bind.Consts, FMX.utils, System.TypInfo;

{$REGION 'utils'}
function GetClassList(const BaseClass: TComponentClass; const ExceptClasses: TArray<TComponentClass>;
  const ExceptBaseClass: Boolean = True): TArray<TComponentClass>;
var
  ClassNames: TStringList;
  LClasses: TList<TComponentClass>;
  I, J, K: Integer;
  S: string;
  LClass: TPersistentClass;
  CanAdd: Boolean;
begin
  ClassNames := TStringList.Create;
  try
    ReportClassGroups(ClassNames);
    LClasses := TList<TComponentClass>.Create;
    try
      for I := 0 to ClassNames.Count - 1 do
      begin
        S := Trim(ClassNames[I]);
        J := Pos('=', S);
        if J > 1 then
        begin
          S := Trim(System.Copy(S, 1, J - 1));
          LClass := GetClass(S);
          if (LClass <> nil) and LClass.InheritsFrom(BaseClass) and
            (not ExceptBaseClass or (LClass.ClassName <> BaseClass.ClassName)) then
          begin
            CanAdd := True;
            for K := Low(ExceptClasses) to High(ExceptClasses) do
              if LClass = ExceptClasses[K] then
              begin
                CanAdd := False;
                Break;
              end;
            if CanAdd then
              LClasses.Add(TComponentClass(LClass));
          end;
        end;
      end;
      Result := LClasses.ToArray;
    finally
      LClasses.Free;
    end;
  finally
    ClassNames.Free;
  end;
end;

function ExtractColumnStyle(AClass: TClass): string;
begin
  Result := AClass.ClassName;
  if (Length(Result) > 2) and (Upcase(Result.Chars[0]) = 'T') then
    Result := Result.Remove(0, 1);
end;

procedure DoUpdateColumn(const AColumn: TColumn; const ADescription: TCreateColumnDescription;
  const DefaultColumnWidth: Integer);
begin
  if AColumn = nil then
    raise EArgumentException.Create(SArgumentNil);
  AColumn.BeginUpdate;
  try
    AColumn.Header := ADescription.Header;
    if ADescription.Width <> -1 then
      AColumn.Width := ADescription.Width
    else
      AColumn.Width := DefaultColumnWidth;
    AColumn.Visible := ADescription.Visible;
    AColumn.ReadOnly := ADescription.ReadOnly;
  finally
    AColumn.EndUpdate;
  end;
end;
{$ENDREGION}

type
  TBaseLinkGridToDataSourceControlManager = class(TInterfacedObject, ILinkGridToDataSourceControlManager,
    IFreeNotification)
  private
    [Weak] FGrid: TCustomGrid;
    FDefaultColumnWidth: Integer;
    function AddColumn(const ADescription: TCreateColumnDescription): Integer; overload;
    function DescribeColumn(AIndex: Integer;
      const ADescription: TCreateColumnDescription): TLinkGridColumnDescription; overload;
    procedure UpdateColumn(AIndex: Integer; const ACreateDescription: TCreateColumnDescription); overload;
    function DefaultLiteralExpression(const AMemberType: TScopeMemberType): string;
  protected
    function FormatCellDataExpression(AIndex: Integer): string; virtual; abstract;
    function SupportsMemberType(AMemberType: TScopeMemberType; var ALiteralExpression: string): Boolean; virtual;
    function CreateColumn(const ADescription: TCreateColumnDescription; AGrid: TCustomGrid): TColumn; virtual;
    function CreateColumnDescription(AIndex: Integer;
      ADescription: TCreateColumnDescription): TLinkGridColumnDescription; virtual;
    function GetColumnClass(ADescription: TCreateColumnDescription): TComponentClass; virtual;
    procedure FreeNotification(AObject: TObject);
  protected
    procedure BeginUpdate;
    procedure EndUpdate;
    function GetDefaultColumnWidth: Integer;
    procedure SetDefaultColumnWidth(AWidth: Integer);
    function CanAddColumn(AColumn: TBaseLinkGridToDataSourceColumn): Boolean; overload;
    function CanAddColumn(ADataSource: TBaseLinkingBindSource; const AMemberName: string): Boolean; overload;
    procedure ClearColumns;
    function DescribeColumn(AIndex: Integer; AColumn: TBaseLinkGridToDataSourceColumn): TLinkGridColumnDescription; overload;
    function DescribeColumn(AIndex: Integer; ADataSource: TBaseLinkingBindSource; const AMemberName: string): TLinkGridColumnDescription; overload;
    function AddColumn(AColumn: TBaseLinkGridToDataSourceColumn): Integer; overload;
    function AddColumn(ADataSource: TBaseLinkingBindSource; const AMemberName: string): Integer; overload;
    procedure UpdateColumn(AIndex: Integer; AColumn: TBaseLinkGridToDataSourceColumn); overload;
    procedure UpdateColumn(AIndex: Integer; ADataSource: TBaseLinkingBindSource; const AMemberName: string); overload;
    function UnsupportedMemberTypes: TScopeMemberTypes; virtual;
    function GetDefaultColumnClass(AMemberType: TScopeMemberType): TComponentClass; virtual;
  public
    constructor Create(ACustomGrid: TCustomGrid);
    destructor Destroy; override;
    property Grid: TCustomGrid read FGrid;
  end;

  TLinkGridToDataSourceControlManager = class(TBaseLinkGridToDataSourceControlManager)
  protected
    function FormatCellDataExpression(AIndex: Integer): string; override;
    function UnsupportedMemberTypes: TScopeMemberTypes; override;
    function GetDefaultColumnClass(AMemberType: TScopeMemberType): TComponentClass; override;
  end;

  TBaseLinkGridToDataSourceColumnFactory = class(TLinkGridToDataSourceColumnFactory)
  protected
    function IsColumnClassAllowed(const AClass: TComponentClass): Boolean; virtual; abstract;
  public
    function UsesUnits: TArray<string>; override;
    function FrameworkExt: string; override;
    function Supports(AIntf: TGuid; AGrid: TComponent): Boolean; override;
    function GetColumnStyles: TArray<string>; override;
  end;

  TLinkCustomGridToDataSourceColumnFactory = class(TBaseLinkGridToDataSourceColumnFactory)
  private class var
    FLock: TObject;
    FGridClasses: TArray<TComponentClass>;
    FGridClassesInit: Boolean;
    FFirstLibModule: PLibModule;
  private
    class constructor Create;
    class destructor Destroy;
    class procedure InvalidateGridClasses(HInstance: NativeInt); static;
  protected
    function IsColumnClassAllowed(const AClass: TComponentClass): Boolean; override;
  public
    function GridClasses: TArray<TComponentClass>; override;
    function CreateFactory(AIntf: TGuid; AGrid: TComponent): IInterface; override;
  end;

  TLinkStringGridToDataSourceControlManager = class(TBaseLinkGridToDataSourceControlManager)
  protected
    function FormatCellDataExpression(AIndex: Integer): string; override;
    function UnsupportedMemberTypes: TScopeMemberTypes; override;
    function GetDefaultColumnClass(AMemberType: TScopeMemberType): TComponentClass; override;
  end;

  TLinkStringGridToDataSourceColumnFactory = class(TBaseLinkGridToDataSourceColumnFactory)
  protected
    function IsColumnClassAllowed(const AClass: TComponentClass): Boolean; override;
  public
    function GridClasses: TArray<TComponentClass>; override;
    function CreateFactory(AIntf: TGuid; AGrid: TComponent): IInterface; override;
  end;

{$REGION 'TBaseLinkGridToDataSourceControlManager'}

constructor TBaseLinkGridToDataSourceControlManager.Create(ACustomGrid: TCustomGrid);
begin
  inherited Create;
  FGrid := ACustomGrid;
  if FGrid <> nil then
    FGrid.AddFreeNotify(Self);
  FDefaultColumnWidth := 64;
end;

destructor TBaseLinkGridToDataSourceControlManager.Destroy;
begin
  if FGrid <> nil then
    FGrid.RemoveFreeNotify(Self);
  inherited;
end;

function TBaseLinkGridToDataSourceControlManager.AddColumn(
  ADataSource: TBaseLinkingBindSource; const AMemberName: string): Integer;
var
  LDescription: TCreateColumnDescription;
begin
  LDescription := TCreateColumnDescription.Create(ADataSource, AMemberName);
  Result := AddColumn(LDescription);
end;

procedure TBaseLinkGridToDataSourceControlManager.BeginUpdate;
begin
  if FGrid <> nil then
    FGrid.BeginUpdate;
end;

function TBaseLinkGridToDataSourceControlManager.DescribeColumn(
  AIndex: Integer; AColumn: TBaseLinkGridToDataSourceColumn): TLinkGridColumnDescription;
begin
  Result := DescribeColumn(AIndex, TCreateColumnDescription.Create(AColumn as TLinkGridToDataSourceColumn));
end;

function TBaseLinkGridToDataSourceControlManager.DescribeColumn(
  AIndex: Integer; ADataSource: TBaseLinkingBindSource; const AMemberName: string): TLinkGridColumnDescription;
begin
  Result := DescribeColumn(AIndex, TCreateColumnDescription.Create(ADataSource, AMemberName));
end;

function TBaseLinkGridToDataSourceControlManager.AddColumn(
  AColumn: TBaseLinkGridToDataSourceColumn): Integer;
begin
  Result := AddColumn(TCreateColumnDescription.Create(AColumn as TLinkGridToDataSourceColumn));
end;

procedure TBaseLinkGridToDataSourceControlManager.UpdateColumn(
  AIndex: Integer; const ACreateDescription: TCreateColumnDescription);
begin
  if FGrid <> nil then
    DoUpdateColumn(FGrid.Columns[AIndex], ACreateDescription, GetDefaultColumnWidth);
end;

procedure TBaseLinkGridToDataSourceControlManager.UpdateColumn(
  AIndex: Integer; AColumn: TBaseLinkGridToDataSourceColumn);
var
  LCreateDescription: TCreateColumnDescription;
begin
  LCreateDescription := TCreateColumnDescription.Create(AColumn as TLinkGridToDataSourceColumn);
  UpdateColumn(AIndex, LCreateDescription);
end;

function TBaseLinkGridToDataSourceControlManager.UnsupportedMemberTypes: TScopeMemberTypes;
begin
  Result := [];
end;

procedure TBaseLinkGridToDataSourceControlManager.UpdateColumn(AIndex: Integer; ADataSource: TBaseLinkingBindSource; const AMemberName: string);
var
  LCreateDescription: TCreateColumnDescription;
begin
  LCreateDescription := TCreateColumnDescription.Create(ADataSource, AMemberName);
  UpdateColumn(AIndex, LCreateDescription);
end;

function TBaseLinkGridToDataSourceControlManager.AddColumn(
  const ADescription: TCreateColumnDescription): Integer;
var
  LColumn: TColumn;
begin
  if FGrid <> nil then
  begin
    LColumn := CreateColumn(ADescription, FGrid);
    DoUpdateColumn(LColumn, ADescription, GetDefaultColumnWidth);
    FGrid.AddObject(LColumn);
    Result := LColumn.Index;
  end
  else
    Result := -1;
end;

function TBaseLinkGridToDataSourceControlManager.CreateColumn(const ADescription: TCreateColumnDescription;
  AGrid: TCustomGrid): TColumn;
var
  DefaultClass: TComponentClass;
begin
  DefaultClass := GetColumnClass(ADescription);
  if DefaultClass = nil then
    Result := TColumn.Create(nil)
  else if DefaultClass.InheritsFrom(TColumn) then
    Result := TColumnClass(DefaultClass).Create(nil)
  else
    raise EArgumentException.CreateFMT(SEUseHeirs, [DefaultClass.ClassName])at ReturnAddress;
  Result.Stored := False;
  Result.Locked := True;
end;

const
  sDataExpression = 'Data';
  sLiteralExpression = '''(%s)''';
  sSelf = 'Self';
  sSelectedText = 'SelectedText(Self)';

function TBaseLinkGridToDataSourceControlManager.CreateColumnDescription(AIndex: Integer;
  ADescription: TCreateColumnDescription): TLinkGridColumnDescription;
var
  LColumn: TLinkGridColumnDescription;
  LGridColumn: TColumn;
  FPairsList: TList<TLinkGridColumnExpressionPair>;
  LPair: TLinkGridColumnExpressionPair;
  LFormatColumnExpressions: TArray<TLinkGridColumnExpressionPair>;
  LFormatCellExpressions: TArray<TLinkGridColumnExpressionPair>;
  LParseCellExpressions: TArray<TLinkGridColumnExpressionPair>;
  LCellExpression: String;
  LMemberName: string;
  LMemberType: TScopeMemberType;
  LMemberGetter: string;
  LMemberSetter: string;
  LSelectedText: string;
  LLiteralExpression: string;
begin
  if FGrid <> nil then
  begin
    LMemberName := ADescription.MemberName;
    LMemberType := ADescription.MemberType;
    LMemberGetter := ADescription.MemberGetter;
    LMemberSetter := ADescription.MemberSetter;
    FPairsList := TList<TLinkGridColumnExpressionPair>.Create;
    try
      FPairsList.Clear;
      LFormatColumnExpressions := FPairsList.ToArray;

      if not SupportsMemberType(LMemberType, LLiteralExpression) then
      begin
        Assert(LLiteralExpression <> '');
        LCellExpression := LLiteralExpression;
      end
      else
      begin
        LCellExpression := LMemberGetter;
      end;

      if ADescription.CustomFormat <> '' then
        LCellExpression := Format(ADescription.CustomFormat, [LCellExpression]);
      FPairsList.Clear;
      if LCellExpression <> '' then
      begin
        LPair := TLinkGridColumnExpressionPair.Create(
          FormatCellDataExpression(AIndex), LCellExpression, ADescription.CustomFormat <> '');
        FPairsList.Add(LPair);
        LFormatCellExpressions := FPairsList.ToArray;
      end;

      if ADescription.ReadOnly then
        // No parse expression
        LCellExpression := ''
      else
      begin
        if (LMemberSetter = '')   then
          LCellExpression := ''
        else
        begin
          case LMemberType of
  // Support unknown types such as TField of type ftAggregate
  //          mtUnknown:
  //            LCellExpression := '';
            mtBitmap:
              LCellExpression := '';
          else
            LCellExpression := LMemberSetter;
            Assert(LCellExpression <> '');
          end;
        end;
      end;
      FPairsList.Clear;
      if LCellExpression <> '' then
      begin
        if ADescription.CustomParse <> '' then
          LSelectedText := Format(ADescription.CustomParse, [sSelectedText])
        else
          LSelectedText := sSelectedText;
        LPair := TLinkGridColumnExpressionPair.Create(
        LSelectedText, LCellExpression, ADescription.CustomFormat <> '');   // do not localize
        FPairsList.Add(LPair);
      end;
      LParseCellExpressions := FPairsList.ToArray;

      if AIndex >= FGrid.ColumnCount then
        LGridColumn := nil
      else
        LGridColumn := FGrid.Columns[AIndex];

      LColumn := TLinkGridColumnDescription.Create(LGridColumn, '', AIndex, '', ADescription.MemberName,
        ADescription.ColumnStyle, LFormatColumnExpressions, LFormatCellExpressions, LParseCellExpressions);
      Result := LColumn;
    finally
      FPairsList.Free;
    end;
  end
  else
    FillChar(Result, SizeOf(Result), 0);
end;

function TBaseLinkGridToDataSourceControlManager.DescribeColumn(AIndex: Integer;
  const ADescription: TCreateColumnDescription): TLinkGridColumnDescription;
begin
  Result := CreateColumnDescription(AIndex, ADescription);
end;

function TBaseLinkGridToDataSourceControlManager.GetDefaultColumnClass(AMemberType: TScopeMemberType): TComponentClass;
begin
  Result := nil;
end;

function TBaseLinkGridToDataSourceControlManager.GetDefaultColumnWidth: Integer;
begin
  Result := FDefaultColumnWidth;
end;

procedure TBaseLinkGridToDataSourceControlManager.SetDefaultColumnWidth(AWidth: Integer);
begin
  FDefaultColumnWidth := AWidth;
end;

function TBaseLinkGridToDataSourceControlManager.SupportsMemberType(AMemberType: TScopeMemberType;
  var ALiteralExpression: string): Boolean;
begin
  Result := not (AMemberType in UnsupportedMemberTypes);
  if not Result then
    ALiteralExpression := DefaultLiteralExpression(AMemberType);
end;

procedure TBaseLinkGridToDataSourceControlManager.EndUpdate;
begin
  if FGrid <> nil then
    FGrid.EndUpdate;
end;

procedure TBaseLinkGridToDataSourceControlManager.FreeNotification(AObject: TObject);
begin
  if AObject = FGrid then
    FGrid := nil;
end;

function TBaseLinkGridToDataSourceControlManager.CanAddColumn(AColumn: TBaseLinkGridToDataSourceColumn): Boolean;
begin
  Result := True;
end;

function TBaseLinkGridToDataSourceControlManager.CanAddColumn(ADataSource: TBaseLinkingBindSource;
  const AMemberName: string): Boolean;
begin
  Result := True;
end;

procedure TBaseLinkGridToDataSourceControlManager.ClearColumns;
begin
  if FGrid <> nil then
    FGrid.ClearColumns;
end;

function TBaseLinkGridToDataSourceControlManager.DefaultLiteralExpression(const AMemberType: TScopeMemberType): string;
begin
  Result := GetEnumName(TypeInfo(TScopeMemberType), Ord(AMemberType));
  if (string.LowerCase(Result.Substring(0, 2)) = 'mt') and (Result.Length > 3) then
    Result := Result.Remove(0, 2);
  Result := Format(sLiteralExpression, [Result]);
end;


function TBaseLinkGridToDataSourceControlManager.GetColumnClass(ADescription: TCreateColumnDescription): TComponentClass;
var
  Classes: TArray<TColumnClass>;
  I: Integer;
begin
  Result := nil;
  if ADescription.ColumnStyle <> '' then
  begin
    Classes := TColumnClasses.RegisteredColumns;
    for I := Low(Classes) to High(Classes) do
      if ADescription.ColumnStyle = ExtractColumnStyle(Classes[I]) then
      begin
        Result := Classes[I];
        Break;
      end;
  end;
  if Result = nil then
    Result := GetDefaultColumnClass(ADescription.MemberType);
end;

{$ENDREGION}

{$REGION 'TLinkGridToDataSourceControlManager'}

function TLinkGridToDataSourceControlManager.GetDefaultColumnClass(AMemberType: TScopeMemberType): TComponentClass;
begin
  case AMemberType of
    mtBitmap, mtObject:
      Result := TImageColumn;
    mtBoolean:
      Result := TCheckColumn;
    mtDate:
      Result := TDateColumn;
    mtTime:
      Result := TTimeColumn;
    mtText:
      Result := TStringColumn;
    mtCurrency:
      Result := TCurrencyColumn;
    mtFloat:
      Result := TFloatColumn;
    mtBCD, mtInteger, mtUInteger:
      Result := TIntegerColumn;
  else
    Result := nil;
  end
end;

function TLinkGridToDataSourceControlManager.FormatCellDataExpression(AIndex: Integer): string;
begin
  Result := sDataExpression;
end;

function TLinkGridToDataSourceControlManager.UnsupportedMemberTypes: TScopeMemberTypes;
begin
  Result := [mtUnknown, mtBCD, mtObject];
end;

{$ENDREGION}

{$REGION 'TBaseLinkGridToDataSourceColumnFactory'}

function TBaseLinkGridToDataSourceColumnFactory.FrameworkExt: string;
begin
  Result := sFmx;
end;

function TBaseLinkGridToDataSourceColumnFactory.UsesUnits: TArray<string>;
begin
  Result := TArray<string>.Create('Fmx.Bind.Grid'); // Do not localize
end;

function TBaseLinkGridToDataSourceColumnFactory.GetColumnStyles: TArray<string>;
var
  Classes: TArray<TColumnClass>;
  I: Integer;
begin
  Classes := TColumnClasses.RegisteredColumns;
  Result := [];
  for I := Low(Classes) to High(Classes) do
    if IsColumnClassAllowed(Classes[I]) then
      Result := Result + [ExtractColumnStyle(Classes[I])];
end;

function TBaseLinkGridToDataSourceColumnFactory.Supports(AIntf: TGuid; AGrid: TComponent): Boolean;
var
  Classes: TArray<TComponentClass>;
  I: Integer;
begin
  Result := False;
  if AIntf = ILinkGridToDataSourceControlManager then
  begin
    Classes := GridClasses;
    for I := Low(Classes) to High(Classes) do
      if Classes[I] = AGrid.ClassType then
        Exit(True);
  end;
end;

{$ENDREGION}

{$REGION 'TLinkCustomGridToDataSourceColumnFactory'}
class constructor TLinkCustomGridToDataSourceColumnFactory.Create;
begin
  FLock := TObject.Create;
  InvalidateGridClasses(0);
  AddModuleUnloadProc(InvalidateGridClasses);
end;

class destructor TLinkCustomGridToDataSourceColumnFactory.Destroy;
begin
  RemoveModuleUnloadProc(InvalidateGridClasses);
  FLock.Free;
end;

class procedure TLinkCustomGridToDataSourceColumnFactory.InvalidateGridClasses(HInstance: NativeInt);
begin
  TMonitor.Enter(FLock);
  try
    FGridClasses := nil;
    FGridClassesInit := False;
    FFirstLibModule := nil;
  finally
    TMonitor.Exit(FLock);
  end;
end;

function TLinkCustomGridToDataSourceColumnFactory.CreateFactory(AIntf: TGuid; AGrid: TComponent): IInterface;
begin
  ValidateInheritance(AGrid, TCustomGrid, False);
  Result := TLinkGridToDataSourceControlManager.Create(TCustomGrid(AGrid));
end;

function TLinkCustomGridToDataSourceColumnFactory.IsColumnClassAllowed(const AClass: TComponentClass): Boolean;
begin
  // Do not allow TProgressColumn and TPopupColumn.  LiveBindings column editor does not provide a way
  // to set TProgressColumn.Min, TProgressColumn.Max, or TPopupColumn.Lines.  So these columns are not usable.
  Result := not ((AClass = TPopupColumn) or (AClass = TProgressColumn)) and TColumnClasses.IsRegistered(AClass);
end;

function TLinkCustomGridToDataSourceColumnFactory.GridClasses: TArray<TComponentClass>;
begin
  TMonitor.Enter(FLock);
  try
    if FFirstLibModule <> LibModuleList then
      InvalidateGridClasses(0);
    if not FGridClassesInit then
    begin
      // Here we exclude TStringGrid for compatibility with older versions
      FGridClasses := GetClassList(TCustomGrid, [TStringGrid]);
      FGridClassesInit := True;
      FFirstLibModule := LibModuleList;
    end;
    Result := FGridClasses;
  finally
    TMonitor.Exit(FLock);
  end;
end;

{$ENDREGION}

{$REGION 'TLinkStringGridToDataSourceControlManager'}

function TLinkStringGridToDataSourceControlManager.GetDefaultColumnClass(AMemberType: TScopeMemberType): TComponentClass;
begin
  Result := TStringColumn;
end;

function TLinkStringGridToDataSourceControlManager.FormatCellDataExpression(AIndex: Integer): string;
begin
  Result := Format('Cells[%d]', [AIndex]);
end;

function TLinkStringGridToDataSourceControlManager.UnSupportedMemberTypes: TScopeMemberTypes;
begin
  Result := [mtUnknown, mtBCD, mtObject, mtBitmap];
end;
{$ENDREGION}

{$REGION 'TLinkStringGridToDataSourceColumnFactory'}
function TLinkStringGridToDataSourceColumnFactory.CreateFactory(AIntf: TGuid; AGrid: TComponent): IInterface;
begin
  ValidateInheritance(AGrid, TStringGrid, False);
  Result := TLinkStringGridToDataSourceControlManager.Create(TStringGrid(AGrid));
end;

function TLinkStringGridToDataSourceColumnFactory.IsColumnClassAllowed(const AClass: TComponentClass): Boolean;
begin
  // Do not allow TImageColumn, TProgressColumn and TPopupColumn.  LiveBindings column editor does not provide a way
                                                                   
  Result := not ((AClass = TPopupColumn) or (AClass = TProgressColumn) or AClass.InheritsFrom(TImageColumn)) and
    TColumnClasses.IsRegistered(AClass);
end;

function TLinkStringGridToDataSourceColumnFactory.GridClasses: TArray<TComponentClass>;
begin
  // We use only TStringGrid for compatibility with older versions
  Result := [TStringGrid];
end;
{$ENDREGION}

initialization
  RegisterLinkGridToDataSourceColumnFactory([TLinkCustomGridToDataSourceColumnFactory,
    TLinkStringGridToDataSourceColumnFactory]);
finalization
  UnregisterLinkGridToDataSourceColumnFactory([TLinkCustomGridToDataSourceColumnFactory,
    TLinkStringGridToDataSourceColumnFactory]);

end.
