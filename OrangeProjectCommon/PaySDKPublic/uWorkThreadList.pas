//convert pas to utf8 by ¥
//copyright delphiteacher QQ:452330643
//2015-08-08
//未经授权,严禁出售赠送或转上他人使用


//列表基类
unit uWorkThreadList;

interface


uses
  Classes,
  SysUtils;



type
//  {$Region '列表基类'}
  TWorkThreadList=class;



  //子对象拥有关系类型
  TObjectOwnership=(ooReference,//引用，子对象要别人释放
                    ooOwned);   //拥有，子对象都是自己的，自己释放





  //子对象更改类型
  TItemChangeType=(ictAdd,          //添加项目
                    ictDel,         //删除项目
                    ictMove,        //移动项目
                    ictSetItem      //设置项目
                    );
  TItemChangeTypes=set of TItemChangeType;




  //子对象被删除的事件(用于立即通知一些控件清空对Item的引用)
  TItemDeleteEvent=procedure(Sender:TObject;AItem:TObject;AIndex:Integer) of object;

  //子对象列表
  TWorkThreadList=class(TInterfacedPersistent)
  protected
    //列表
    FItems:TList;
    //上次项目更改类型
    FLastItemChangeTypes:TItemChangeTypes;
    //拥有关系
    FObjectOwnership:TObjectOwnership;

    //有子对象被删除
    FHasItemDeleted: Boolean;
    //子对象被删除的事件
    FOnItemDelete: TItemDeleteEvent;
    //设置项目
    function GetItem(Index: Integer): TObject;
    procedure SetItem(Index: Integer; const Value: TObject);

  public
    constructor Create(AObjectOwnership:TObjectOwnership=ooOwned);virtual;
    destructor Destroy;override;
  public
    //个数
    function GetCount:Integer;virtual;
    //清除
    procedure Clear(AIsFree:Boolean;AIsNeedDelete:Boolean=True);virtual;
    //移动互换
    procedure Move(ASrcIndex:Integer;ADestIndex:Integer);overload;
    procedure Move(ASrcObject:TObject;ADestObject:TObject);overload;
  public
    //添加时
    procedure DoAdd(AObject:TObject);virtual;
    //删除时
    procedure DoDelete(AObject:TObject;AIndex:Integer);virtual;
    //插入时
    procedure DoInsert(AObject:TObject;AIndex:Integer);virtual;

    //删除
    function Delete(AIndex:Integer;AIsFree:Boolean=True;AIsNeedDelete:Boolean=True):Integer;virtual;
    function Remove(AObject:TObject;AIsFree:Boolean=True;AIsNeedDelete:Boolean=True):Integer;virtual;
    //添加
    function Add(AObject:TObject):Integer;virtual;
    //插入
    function Insert(AIndex: Integer;AObject:TObject):Integer;virtual;
  public
    //定位
    function IndexOf(AObject:TObject):Integer;virtual;
    //排序
    procedure Sort(Compare: TListSortCompare);
  public

    //是否有列表被删除了
    property HasItemDeleted:Boolean read FHasItemDeleted write FHasItemDeleted;
    //上次更新类型
    property LastItemChangeTypes:TItemChangeTypes read FLastItemChangeTypes;

    //更件事件
    property OnItemDelete:TItemDeleteEvent read FOnItemDelete write FOnItemDelete;
  public
    //拥有关系
    property ObjectOwnership:TObjectOwnership read FObjectOwnership write FObjectOwnership;
    //
    property Items[Index:Integer]:TObject read GetItem write SetItem;default;
  published
    //个数
    property Count:Integer read GetCount;
  end;




//增加引用
procedure ObjAddRef(Obj:TObject);
//减少引用
procedure ObjRelease(Obj:TObject);
//释放
//释放
//释放
{$IF CompilerVersion<=33.0}
procedure FreeAndNil(var Obj);
{$ELSE}
procedure FreeAndNil(const [ref] Obj:TObject);
{$IFEND}


implementation



procedure ObjAddRef(Obj:TObject);
begin
  {$IF CompilerVersion<=33.0}
    {$IFDEF IOS}
    Obj.__ObjAddRef;
    {$ENDIF}
    {$IFDEF ANDROID}
    Obj.__ObjAddRef;
    {$ENDIF}
  {$IFEND}
end;

procedure ObjRelease(Obj:TObject);
begin
  {$IF CompilerVersion<=33.0}
    {$IFDEF IOS}
    Obj.__ObjRelease;
    {$ENDIF}
    {$IFDEF ANDROID}
    Obj.__ObjRelease;
    {$ENDIF}
  {$IFEND}
end;

{$IF CompilerVersion<=33.0}
procedure FreeAndNil(var Obj);
begin
  Sysutils.FreeAndNil(Obj);
end;
{$ELSE}
procedure FreeAndNil(const [ref] Obj:TObject);
begin
  Sysutils.FreeAndNil(Obj);
end;
{$IFEND}




{ TWorkThreadList }

function TWorkThreadList.Add(AObject:TObject):Integer;
begin
  Result:=Self.FItems.Add(AObject);

  DoAdd(AObject);

  ObjAddRef(AObject);
  FLastItemChangeTypes:=FLastItemChangeTypes+[ictAdd];
end;

procedure TWorkThreadList.DoAdd(AObject: TObject);
begin
end;


procedure TWorkThreadList.DoDelete(AObject: TObject;AIndex:Integer);
begin
end;

procedure TWorkThreadList.DoInsert(AObject: TObject; AIndex: Integer);
begin
end;

procedure TWorkThreadList.Clear(AIsFree:Boolean;AIsNeedDelete:Boolean);
begin
  while Self.Count>0 do
  begin
    Delete(0,AIsFree,AIsNeedDelete);
  end;
  Self.FItems.Clear;
end;

function TWorkThreadList.GetCount: Integer;
begin
  Result:=FItems.Count;
end;

constructor TWorkThreadList.Create(AObjectOwnership:TObjectOwnership);
begin
  FHasItemDeleted:=False;
  FItems:=TList.Create;
  FObjectOwnership:=AObjectOwnership;
//  if CreateObjectChange then
//  begin
//    FSkinObjectChange:=TSkinObjectChange.Create;
//  end;
end;

function TWorkThreadList.Delete(AIndex: Integer;AIsFree: Boolean;AIsNeedDelete:Boolean): Integer;
var
  AObject:TObject;
begin
  AObject:=nil;
  if Self.FItems[AIndex]<>nil then
  begin
    AObject:=TObject(Self.FItems[AIndex]);
  end;


  //开始调用删除通知
  if Assigned(FOnItemDelete) then
  begin
    FOnItemDelete(Self,AObject,AIndex);
  end;


  DoDelete(AObject,AIndex);


  if AIsNeedDelete then Self.FItems.Delete(AIndex);


  //释放
  if AIsFree and (AObject<>nil) then
  begin
//    try
      ObjRelease(AObject);
      FreeAndNil(AObject);
//    except
//      on E:Exception do
//      begin
//        uBaseLog.OutputDebugString(E.Message);
//      end;
//    end;
  end;

  Result:=AIndex;
  FLastItemChangeTypes:=FLastItemChangeTypes+[ictDel];
  FHasItemDeleted:=True;

end;

destructor TWorkThreadList.Destroy;
begin
  //清除列表
  Self.Clear((FObjectOwnership=ooOwned),True);
  FreeAndNil(FItems);
  inherited;
end;

function TWorkThreadList.GetItem(Index: Integer): TObject;
begin
  Result:=nil;
  if (Index>-1) and (Index<Self.FItems.Count) then
  begin
    Result:=TObject(Self.FItems[Index]);
  end;
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

function TWorkThreadList.Insert(AIndex: Integer;AObject: TObject): Integer;
begin
  Self.FItems.Insert(AIndex,AObject);

  DoInsert(AObject,AIndex);

  ObjAddRef(AObject);
  FLastItemChangeTypes:=FLastItemChangeTypes+[ictAdd];
//  DoChange;
  Result:=AIndex;
end;

procedure TWorkThreadList.Move(ASrcIndex, ADestIndex: Integer);
var
  ASrcPointer:Pointer;
begin
  ASrcPointer:=Self.FItems[ASrcIndex];
  Self.FItems[ASrcIndex]:=Self.FItems[ADestIndex];
  Self.FItems[ADestIndex]:=ASrcPointer;
  FLastItemChangeTypes:=FLastItemChangeTypes+[ictMove];
//  DoChange;
end;

procedure TWorkThreadList.Move(ASrcObject, ADestObject: TObject);
var
  ASrcIndex,ADestIndex:Integer;
begin
  ASrcIndex:=Self.FItems.IndexOf(ASrcObject);
  ADestIndex:=Self.FItems.IndexOf(ADestObject);
  Self.Move(ASrcIndex,ADestIndex);
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
  FLastItemChangeTypes:=FLastItemChangeTypes+[ictSetItem];
//  DoChange;
end;

procedure TWorkThreadList.Sort(Compare: TListSortCompare);
begin
  Self.FItems.Sort(Compare);
end;


end.


