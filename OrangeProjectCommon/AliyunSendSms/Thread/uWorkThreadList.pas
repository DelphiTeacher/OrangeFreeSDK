//工作基类//
unit uWorkThreadList;

interface

uses
  Windows,
  SysUtils,
  Controls,
  SyncObjs,
  Classes,
  ActiveX;

type
  //{$Region '列表基类'}
  TWorkThreadList=class
  private
    FIsInitializeLock:Boolean;
    FLock:TRTLCriticalSection;
    function GetItem(Index: Integer): TObject;
  protected
    FItems:TList;
  public
    constructor Create;virtual;
    destructor Destroy;override;
  public
    procedure LockList;
    procedure UnLockList;
    procedure Clear(AIsFree:Boolean;AIsNeedDelete:Boolean=True);
    function Count:Integer;
    function Delete(AIndex:Integer;AIsFree:Boolean;AIsNeedDelete:Boolean=True):Integer;
    function Remove(AObject:TObject;AIsFree:Boolean;AIsNeedDelete:Boolean=True):Integer;
    function Add(AObject:TObject):Integer;
    function IndexOf(AObject:TObject):Integer;
    procedure SetItem(Index: Integer; const Value: TObject);
    property Items[Index:Integer]:TObject read GetItem;default;
  end;
  //{$EndRegion}

implementation

{ TWorkThreadList }

function TWorkThreadList.Add(AObject:TObject):Integer;
begin
  Result:=Self.FItems.Add(AObject);
end;

procedure TWorkThreadList.Clear(AIsFree:Boolean;AIsNeedDelete:Boolean);
begin
  while Self.Count>0 do
  begin
    Delete(0,AIsFree,AIsNeedDelete);
  end;
  Self.FItems.Clear;
end;

function TWorkThreadList.Count: Integer;
begin
  Result:=FItems.Count;
end;

constructor TWorkThreadList.Create;
begin
  FItems:=TList.Create;
  FIsInitializeLock:=False;
end;

function TWorkThreadList.Delete(AIndex: Integer;AIsFree: Boolean;AIsNeedDelete:Boolean): Integer;
begin
  if AIsFree then
  begin
    if Self.FItems[AIndex]<>nil then
    begin
      TObject(Self.FItems[AIndex]).Free;
      Self.FItems[AIndex]:=nil;
    end;
  end;
  if AIsNeedDelete then Self.FItems.Delete(AIndex);
  Result:=AIndex;
end;

destructor TWorkThreadList.Destroy;
begin
  Clear(True);
  if FIsInitializeLock then
  begin
    DeleteCriticalSection(FLock);
  end;
  FItems.Free;
  inherited;
end;

procedure TWorkThreadList.LockList;
begin
  if Not FIsInitializeLock then
  begin
    FIsInitializeLock:=True;
    InitializeCriticalSection(FLock);
  end;
  EnterCriticalSection(FLock);
end;

procedure TWorkThreadList.UnLockList;
begin
  LeaveCriticalSection(FLock);
end;

function TWorkThreadList.GetItem(Index: Integer): TObject;
begin
  Result:=TObject(Self.FItems[Index]);
end;

function TWorkThreadList.IndexOf(AObject: TObject): Integer;
var
  I: Integer;
begin
  Result:=-1;
  for I := 0 to Self.FItems.Count - 1 do
  begin
    if Integer(Self.FItems[I])=Integer(AObject) then
    begin
      Result:=I;
      Break;
    end;
  end;
end;

function TWorkThreadList.Remove(AObject: TObject;AIsFree:Boolean;AIsNeedDelete:Boolean): Integer;
begin
  Result:=Self.FItems.IndexOf(AObject);
  if Result<>-1 then
  begin
    Result:=Delete(Result,AIsFree,AIsNeedDelete);
  end;
end;

procedure TWorkThreadList.SetItem(Index: Integer; const Value: TObject);
begin
  Self.FItems[Index]:=Value;
end;



end.



