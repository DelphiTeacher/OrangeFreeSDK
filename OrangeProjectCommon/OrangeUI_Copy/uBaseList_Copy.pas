//convert pas to utf8 by ¥
/// <summary>
///   <para>
///     列表基类
///   </para>
///   <para>
///     Base class of list
///   </para>
/// </summary>
unit uBaseList_Copy;



interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MSWINDOWS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}




//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
//才可以正常编译此单元
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}




uses
  Classes,
  SysUtils,

  uBaseLog_Copy,
  uFuncCommon_Copy;



type
  TBaseList=class;
  TSkinObjectChangeManager=class;





  /// <summary>
  ///   <para>
  ///     通知更改的链接
  ///   </para>
  ///   <para>
  ///     Link of NotifyChange
  ///   </para>
  /// </summary>
  TSkinObjectChangeLink = class(TObject)
  private
    FSender: TSkinObjectChangeManager;
    FOnChange: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
  public
    destructor Destroy; override;
  public
    /// <summary>
    ///   <para>
    ///     执行OnChange
    ///   </para>
    ///   <para>
    ///     Execute OnChange
    ///   </para>
    /// </summary>
    procedure DoChange(Sender:TObject);
    /// <summary>
    ///   <para>
    ///     执行OnDestroy
    ///   </para>
    ///   <para>
    ///     Execute OnDestroy
    ///   </para>
    /// </summary>
    procedure DoDestroy(Sender:TObject);
    /// <summary>
    ///   <para>
    ///     更改的事件
    ///   </para>
    ///   <para>
    ///     Changed event
    ///   </para>
    /// </summary>
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    /// <summary>
    ///   <para>
    ///     释放的事件
    ///   </para>
    ///   <para>
    ///    Released event
    ///   </para>
    /// </summary>
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
  end;











  /// <summary>
  ///   <para>
  ///     通知更改的管理者
  ///   </para>
  ///   <para>
  ///     Manager of NotifyChange
  ///   </para>
  /// </summary>
  TSkinObjectChangeManager=class(TObject)
  private
    //拥有者
    FOwner:TObject;



    //关联的TSkinObjectChangeLink列表
    FLinks: TBaseList;
    //是否更改过了
    FChanged: Boolean;
    //停止更改调用的次数
    FUpdateCount: Integer;
    //更改的事件
    FOnChange:TNotifyEvent;
    //是否释放了
    FIsDestroy:Boolean;
  public
    constructor Create(AOwner:TObject);
    destructor Destroy;override;
  public
    //开始释放,通知Link去除一些引用(不调用OnChange事件)
    procedure BeginDestroy(Sender:TObject);virtual;
  public

    /// <summary>
    ///   <para>
    ///     通知各个Link调用更改的事件(OnChange)
    ///   </para>
    ///   <para>
    ///     Notify every Link call changed event(OnChange)
    ///   </para>
    /// </summary>
    procedure DoChange(Sender:TObject);virtual;

    /// <summary>
    ///   <para>
    ///     有多少个Linnk
    ///   </para>
    ///   <para>
    ///     ??
    ///   </para>
    /// </summary>
    function LinkCount:Integer;


    /// <summary>
    ///   <para>
    ///     通知各个Link调用释放的事件(OnDestroy)
    ///   </para>
    ///   <para>
    ///     Notify every Link call released event(OnDestroy)
    ///   </para>
    /// </summary>
    procedure DoDestroy(Sender:TObject);virtual;



    /// <summary>
    ///   <para>
    ///     开始更新
    ///   </para>
    ///   <para>
    ///     Begin Update
    ///   </para>
    /// </summary>
    procedure BeginUpdate;virtual;

    /// <summary>
    ///   <para>
    ///     结束更新
    ///   </para>
    ///   <para>
    ///     End Update
    ///   </para>
    /// </summary>
    procedure EndUpdate(AIsForce:Boolean=False);virtual;



    /// <summary>
    ///   <para>
    ///     调用BeginUpdate方法的次数
    ///   </para>
    ///   <para>
    ///     Call count of BeginUpdate
    ///   </para>
    /// </summary>
    property UpdateCount:Integer read FUpdateCount;
  public

    /// <summary>
    ///   <para>
    ///     注册通知更改的链接
    ///   </para>
    ///   <para>
    ///     Regist link of NotifyChange
    ///   </para>
    /// </summary>
    procedure RegisterChanges(Value: TSkinObjectChangeLink);

    /// <summary>
    ///   <para>
    ///     反注册通知更改的链接
    ///   </para>
    ///   <para>
    ///    Unregist link of NotifyChange
    ///   </para>
    /// </summary>
    procedure UnRegisterChanges(Value: TSkinObjectChangeLink);
  public

    /// <summary>
    ///   <para>
    ///     是否开始释放了
    ///   </para>
    ///   <para>
    ///     Whether begin release
    ///   </para>
    /// </summary>
    property IsDestroy:Boolean read FIsDestroy;

    /// <summary>
    ///   <para>
    ///     更改的事件
    ///   </para>
    ///   <para>
    ///     Changed event
    ///   </para>
    /// </summary>
    property OnChange:TNotifyEvent read FOnChange write FOnChange;
  end;















  /// <summary>
  ///   <para>
  ///     子对象拥有关系的类型
  ///   </para>
  ///   <para>
  ///     Type of relationship subobject owns
  ///   </para>
  /// </summary>
  TObjectOwnership=(
                    /// <summary>
                    ///   引用,列表清除的时候子对象不释放
                    ///   <para>
                    ///    Reference, not release subobject when clear list
                    ///   </para>
                    /// </summary>
                    ooReference,
                    /// <summary>
                    ///   拥有,子对象都是列表的,列表清除的时候子对象释放
                    ///   <para>
                    ///     Own,subobject is own by list,release subobject when clear list
                    ///   </para>
                    /// </summary>
                    ooOwned
                    );






  /// <summary>
  ///   <para>
  ///     子对象更改的类型
  ///   </para>
  ///   <para>
  ///     ChangeType of subobject
  ///   </para>
  /// </summary>
  TItemChangeType=(
                    /// <summary>
                    ///   添加项目
                    ///   <para>
                    ///     add item
                    ///   </para>
                    /// </summary>
                    ictAdd,
                    /// <summary>
                    ///   删除项目
                    ///   <para>
                    ///     delete item
                    ///   </para>
                    /// </summary>
                    ictDel,
                    /// <summary>
                    ///   移动项目
                    ///   <para>
                    ///     move item
                    ///   </para>
                    /// </summary>
                    ictMove,
                    /// <summary>
                    ///   设置项目
                    ///   <para>
                    ///     set item
                    ///   </para>
                    /// </summary>
                    ictSetItem

                    );
  /// <summary>
  ///   <para>
  ///     子对象更改类型集合
  ///   </para>
  ///   <para>
  ///     Set of subobject ChangeType
  ///   </para>
  /// </summary>
  TItemChangeTypes=set of TItemChangeType;







  /// <summary>
  ///   <para>
  ///     子对象被删除的事件(用于立即通知一些控件清空对Item的引用)
  ///   </para>
  ///   <para>
  ///     DeleteEvent of subobject(Used for informing some controls clear the
  ///     refrence of Item immediately)
  ///   </para>
  /// </summary>
  TItemDeleteEvent=procedure(Sender:TObject;AItem:TObject;AIndex:Integer) of object;








  /// <summary>
  ///   <para>
  ///     子对象列表
  ///   </para>
  ///   <para>
  ///     Subobject list
  ///   </para>
  /// </summary>
  TBaseList=class(TInterfacedPersistent)
  protected

    //当前是否正在加载,
    //如果正在加载,
    //那不么调用DoAdd,OnChange事件等
//    IsLoading:Boolean;

    /// <summary>
    ///   <para>
    ///     列表
    ///   </para>
    ///   <para>
    ///     List
    ///   </para>
    /// </summary>
    FItems:TList;


    //通知更改的管理者
    FSkinObjectChangeManager:TSkinObjectChangeManager;
    //子对象的拥有关系
    FObjectOwnership:TObjectOwnership;



    //上次子对象的更改类型
    FLastItemChangeTypes:TItemChangeTypes;
    //有子对象被删除
    FHasItemDeleted: Boolean;
    //子对象被删除的事件
    FOnItemDelete: TItemDeleteEvent;


    //调用OnChange事件
    procedure DoChange;virtual;
    //设置项目
    function GetItem(Index: Integer): TObject;
    procedure SetItem(Index: Integer; const Value: TObject);
    //设置事件
    function GetOnChange: TNotifyEvent;
    procedure SetOnChange(const Value: TNotifyEvent);

  public
    /// <summary>
    ///   <para>
    ///     构造方法
    ///   </para>
    ///   <para>
    ///     Construct methods
    ///   </para>
    /// </summary>
    /// <param name="AObjectOwnership">
    ///   子对象关系 <br />Subobject relationship
    /// </param>
    /// <param name="AIsCreateObjectChangeManager">
    ///   是否创建通知更改的管理者
    ///  <para>
    ///Whether create NotifyChange manager
    ///  </para>
    /// </param>
    constructor Create(
                        const AObjectOwnership:TObjectOwnership=ooOwned;
                        const AIsCreateObjectChangeManager:Boolean=True
                        );virtual;
    destructor Destroy;override;
  public


    /// <summary>
    ///   <para>
    ///     子对象的个数
    ///   </para>
    ///   <para>
    ///     Subobject count
    ///   </para>
    /// </summary>
    function GetCount:Integer;virtual;

    /// <summary>
    ///   <para>
    ///     清除
    ///   </para>
    ///   <para>
    ///     Clear
    ///   </para>
    /// </summary>
    /// <param name="AIsFree">
    ///   是否释放子对象
    ///  <para>
    ///  whether release subobject
    ///  </para>
    /// </param>
    /// <param name="AIsNeedDelete">
    ///   是否需要删除子对象
    ///  <para>
    ///  whether need to delete subobject
    ///  </para>
    /// </param>
    procedure Clear(AIsFree:Boolean=True;AIsNeedDelete:Boolean=True);virtual;

    /// <summary>
    ///   <para>
    ///     移动(互换)
    ///   </para>
    ///   <para>
    ///     Move (Exchange)
    ///   </para>
    /// </summary>
    /// <param name="ASrcIndex">
    ///   源下标
    ///  <para>
    ///  original index
    ///  </para>
    /// </param>
    /// <param name="ADestIndex">
    ///   目的下标
    ///  <para>
    ///  target index
    ///  </para>
    /// </param>
    procedure Move(ASrcIndex:Integer;ADestIndex:Integer);overload;
  protected

    /// <summary>
    ///   <para>
    ///     子对象添加时调用此方法
    ///   </para>
    ///   <para>
    ///     Call this method when adding subobject
    ///   </para>
    /// </summary>
    procedure DoAdd(AObject:TObject);virtual;

    /// <summary>
    ///   <para>
    ///     子对象删除时调用此方法
    ///   </para>
    ///   <para>
    ///     Call it when deleting subobject
    ///   </para>
    /// </summary>
    procedure DoDelete(AObject:TObject;AIndex:Integer);virtual;

    /// <summary>
    ///   <para>
    ///     子对象插入时调用此方法
    ///   </para>
    ///   <para>
    ///     Call it when inserting subobject
    ///   </para>
    /// </summary>
    procedure DoInsert(AObject:TObject;AIndex:Integer);virtual;

  public

    /// <summary>
    ///   <para>
    ///     删除指定下标的子对象
    ///   </para>
    ///   <para>
    ///     Delete subobject of assigned index
    ///   </para>
    /// </summary>
    function Delete(AIndex:Integer;AIsFree:Boolean=True;AIsNeedDelete:Boolean=True):Integer;virtual;
    /// <summary>
    ///   <para>
    ///     清除指定子对象
    ///   </para>
    ///   <para>
    ///     Clear assigned subobject
    ///   </para>
    /// </summary>
    function Remove(AObject:TObject;AIsFree:Boolean=True;AIsNeedDelete:Boolean=True):Integer;virtual;

    /// <summary>
    ///   <para>
    ///     添加子对象
    ///   </para>
    ///   <para>
    ///     Add subobject
    ///   </para>
    /// </summary>
    function Add(AObject:TObject):Integer;virtual;

    /// <summary>
    ///   <para>
    ///     插入子对象到指定下标
    ///   </para>
    ///   <para>
    ///     Insert subobject to assigned index
    ///   </para>
    /// </summary>
    function Insert(AIndex: Integer;AObject:TObject):Integer;virtual;
  public

    /// <summary>
    ///   <para>
    ///     获取子对象所在下标
    ///   </para>
    ///   <para>
    ///     Get index of subobject
    ///   </para>
    /// </summary>
    function IndexOf(AObject:TObject):Integer;virtual;

    /// <summary>
    ///   <para>
    ///     排序
    ///   </para>
    ///   <para>
    ///     Sort
    ///   </para>
    /// </summary>
    procedure Sort(Compare: TListSortCompare);virtual;
  public

    /// <summary>
    ///   <para>
    ///     开始更新
    ///   </para>
    ///   <para>
    ///     Begin update
    ///   </para>
    /// </summary>
    procedure BeginUpdate;virtual;

    /// <summary>
    ///   <para>
    ///     结束更新
    ///   </para>
    ///   <para>
    ///     End update
    ///   </para>
    /// </summary>
    /// <param name="Force">
    ///   是否强制更新
    ///  <para>
    ///  Whetehr forced to update
    ///  </para>
    /// </param>
    procedure EndUpdate(AIsForce:Boolean=False);virtual;


    /// <summary>
    ///   <para>
    ///     是否有子对象被删除了
    ///   </para>
    ///   <para>
    ///     Whether there is a subobject deleted
    ///   </para>
    /// </summary>
    property HasItemDeleted:Boolean read FHasItemDeleted write FHasItemDeleted;

    /// <summary>
    ///   <para>
    ///     上次子对象更改类型
    ///   </para>
    ///   <para>
    ///     Last ChangeType of subobject
    ///   </para>
    /// </summary>
    property LastItemChangeTypes:TItemChangeTypes read FLastItemChangeTypes;


    /// <summary>
    ///   <para>
    ///     子对象被删除的事件
    ///   </para>
    ///   <para>
    ///     Event of Subobject deleted
    ///   </para>
    /// </summary>
    property OnItemDelete:TItemDeleteEvent read FOnItemDelete write FOnItemDelete;

    /// <summary>
    ///   <para>
    ///     更改的事件
    ///   </para>
    ///   <para>
    ///     Changed event
    ///   </para>
    /// </summary>
    property OnChange:TNotifyEvent read GetOnChange write SetOnChange;

    /// <summary>
    ///   <para>
    ///     通知更改的管理者
    ///   </para>
    ///   <para>
    ///     Manager of NotifyChange
    ///   </para>
    /// </summary>
    property SkinObjectChangeManager:TSkinObjectChangeManager read FSkinObjectChangeManager;
  public

    /// <summary>
    ///   <para>
    ///     子对象的拥有关系
    ///   </para>
    ///   <para>
    ///     Owner relationship of subobject
    ///   </para>
    /// </summary>
    property ObjectOwnership:TObjectOwnership read FObjectOwnership write FObjectOwnership;

    /// <summary>
    ///   <para>
    ///     子对象
    ///   </para>
    ///   <para>
    ///     Subobject
    ///   </para>
    /// </summary>
    property Items[Index:Integer]:TObject read GetItem write SetItem;default;
  published

    /// <summary>
    ///   <para>
    ///     子对象的个数
    ///   </para>
    ///   <para>
    ///     Subobject count
    ///   </para>
    /// </summary>
    property Count:Integer read GetCount;
  end;





implementation







{ TBaseList }

function TBaseList.Add(AObject:TObject):Integer;
begin
  Result:=Self.FItems.Add(AObject);

//  if Not IsLoading then//为什么?为了少发生Change吗?
//  begin
    DoAdd(AObject);
//  end;

  if AObject<>nil then ObjAddRef(AObject);
  FLastItemChangeTypes:=FLastItemChangeTypes+[ictAdd];

//  if Not IsLoading then
//  begin
    DoChange;
//  end;
end;

procedure TBaseList.BeginUpdate;
begin
  FHasItemDeleted:=False;

  FLastItemChangeTypes:=[];

  if FSkinObjectChangeManager<>nil then
  begin
    Self.FSkinObjectChangeManager.BeginUpdate;
  end;
end;

procedure TBaseList.DoChange;
begin
  if FSkinObjectChangeManager<>nil then
  begin
    Self.FSkinObjectChangeManager.DoChange(Self);
  end;
end;

procedure TBaseList.DoAdd(AObject: TObject);
begin
end;

procedure TBaseList.DoDelete(AObject: TObject;AIndex:Integer);
begin
  //开始调用删除通知
  if Assigned(FOnItemDelete) then
  begin
    FOnItemDelete(Self,AObject,AIndex);
  end;
end;

procedure TBaseList.DoInsert(AObject: TObject; AIndex: Integer);
begin
end;

procedure TBaseList.Clear(AIsFree:Boolean;AIsNeedDelete:Boolean);
var
  I:Integer;
begin
  //不能用While,因为有时不需要删除,用While就死循环
  //while Self.Count>0 do

  //只能用For
  for I := Self.Count-1 downto 0 do
  begin
    Delete(I,AIsFree,AIsNeedDelete);
  end;

  if AIsNeedDelete then
  begin
    Self.FItems.Clear;
  end;

end;

function TBaseList.GetCount: Integer;
begin
  Result:=FItems.Count;
end;

constructor TBaseList.Create(const AObjectOwnership:TObjectOwnership;const AIsCreateObjectChangeManager:Boolean);
begin
  FHasItemDeleted:=False;
  FItems:=TList.Create;
  FObjectOwnership:=AObjectOwnership;


  if AIsCreateObjectChangeManager then
  begin
    FSkinObjectChangeManager:=TSkinObjectChangeManager.Create(Self);
  end;
end;

function TBaseList.Delete(AIndex: Integer;AIsFree: Boolean;AIsNeedDelete:Boolean): Integer;
var
  AObject:TObject;
begin
  AObject:=nil;
  if Self.FItems[AIndex]<>nil then
  begin
    AObject:=TObject(Self.FItems[AIndex]);
  end;




  DoDelete(AObject,AIndex);


  if AIsNeedDelete then
  begin
    Self.FItems.Delete(AIndex);
  end;


  //释放
  if AIsFree and (AObject<>nil) then
  begin
    try
      ObjRelease(AObject);
      uFuncCommon_Copy.FreeAndNil(AObject);
    except
      on E:Exception do
      begin
        uBaseLog_Copy.OutputDebugString('TBaseList.Delete'+' '+Self.ClassName+' '+E.Message);
      end;
    end;
  end;



  Result:=AIndex;
  FLastItemChangeTypes:=FLastItemChangeTypes+[ictDel];
  FHasItemDeleted:=True;

  DoChange;
end;

destructor TBaseList.Destroy;
begin
  //开始通知各个Link本List开始释放了
  if FSkinObjectChangeManager<>nil then
  begin
    FSkinObjectChangeManager.BeginDestroy(Self);
  end;



  //清除列表
  Self.Clear((FObjectOwnership=ooOwned),True);

  uFuncCommon_Copy.FreeAndNil(FSkinObjectChangeManager);

  uFuncCommon_Copy.FreeAndNil(FItems);
  inherited;


end;

procedure TBaseList.EndUpdate(AIsForce:Boolean);
begin
  if FSkinObjectChangeManager<>nil then
  begin
    FSkinObjectChangeManager.EndUpdate(AIsForce);
  end;
end;

function TBaseList.GetItem(Index: Integer): TObject;
begin
  Result:=nil;
  if (Index>-1) and (Index<Self.FItems.Count) then
  begin
    Result:=TObject(Self.FItems[Index]);
  end;
end;

function TBaseList.GetOnChange: TNotifyEvent;
begin
  Result:=nil;
  if FSkinObjectChangeManager<>nil then
  begin
    Result:=Self.FSkinObjectChangeManager.FOnChange;
  end;
end;

function TBaseList.IndexOf(AObject: TObject): Integer;
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

function TBaseList.Insert(AIndex: Integer;AObject: TObject): Integer;
begin

  Self.FItems.Insert(AIndex,AObject);

  DoInsert(AObject,AIndex);



  if AObject<>nil then ObjAddRef(AObject);
  FLastItemChangeTypes:=FLastItemChangeTypes+[ictAdd];
  DoChange;
  Result:=AIndex;
end;

procedure TBaseList.Move(ASrcIndex, ADestIndex: Integer);
var
  ASrcPointer:Pointer;
begin
  ASrcPointer:=Self.FItems[ASrcIndex];
  Self.FItems.Delete(ASrcIndex);

//  if ASrcIndex<ADestIndex then
//  begin
//    //ASrcIndex 0 移到 ADestIndex 2
//    //0 Delete掉之后,原来的ADestIndex变成了1
//    Self.Insert(ADestIndex,ASrcPointer);
//  end
//  else
//  begin
    //ASrcIndex 2 移到 ADestIndex 0
    Self.Insert(ADestIndex,ASrcPointer);
//  end;

//  Self.FItems[ASrcIndex]:=Self.FItems[ADestIndex];
//  Self.FItems[ADestIndex]:=ASrcPointer;

  FLastItemChangeTypes:=FLastItemChangeTypes+[ictMove];
  DoChange;
end;

function TBaseList.Remove(AObject: TObject;AIsFree:Boolean;AIsNeedDelete:Boolean): Integer;
begin
  Result:=Self.FItems.IndexOf(AObject);
  if Result<>-1 then
  begin
    Result:=Delete(Result,AIsFree,AIsNeedDelete);
  end;
end;

procedure TBaseList.SetItem(Index: Integer; const Value: TObject);
begin
  Self.FItems[Index]:=Value;

  FLastItemChangeTypes:=FLastItemChangeTypes+[ictSetItem];

  DoChange;
end;

procedure TBaseList.SetOnChange(const Value: TNotifyEvent);
begin
  if FSkinObjectChangeManager<>nil then
  begin
    Self.FSkinObjectChangeManager.FOnChange:=Value;
  end;
end;

procedure TBaseList.Sort(Compare: TListSortCompare);
begin
  BeginUpdate;
  try
    Self.FItems.Sort(Compare);
  finally
    EndUpdate(True);
  end;
end;




{ TSkinObjectChangeManager }

procedure TSkinObjectChangeManager.DoChange(Sender:TObject);
var
  I: Integer;
begin
  FChanged := True;
  if FUpdateCount > 0 then Exit;

  if FLinks <> nil then
  begin
    //通知关联的控件
    for I := FLinks.Count - 1 downto 0 do
    begin
      TSkinObjectChangeLink(FLinks[I]).DoChange(Sender);
    end;
  end;


  if Assigned(FOnChange) then
  begin
    FOnChange(Self);
  end;
end;

procedure TSkinObjectChangeManager.DoDestroy(Sender:TObject);
var
  I: Integer;
begin
  if FLinks <> nil then
  begin
    //通知关联的控件
    for I := FLinks.Count - 1 downto 0 do
    begin
      TSkinObjectChangeLink(FLinks[I]).DoDestroy(Sender);
    end;
  end;
end;

constructor TSkinObjectChangeManager.Create(AOwner:TObject);
begin
  FOwner:=AOwner;
  //关联的控件
  FLinks := TBaseList.Create(ooReference,False);
end;

procedure TSkinObjectChangeManager.UnRegisterChanges(Value: TSkinObjectChangeLink);
var
  I: Integer;
begin
  if FLinks <> nil then
  begin
    for I := 0 to FLinks.Count - 1 do
    begin
      if FLinks[I] = Value then
      begin
        Value.FSender := nil;
        FLinks.Delete(I,False);
        Break;
      end;
    end;
  end;
end;

procedure TSkinObjectChangeManager.RegisterChanges(Value: TSkinObjectChangeLink);
begin
  Value.FSender := Self;
  if FLinks <> nil then FLinks.Add(Value);
end;

procedure TSkinObjectChangeManager.BeginDestroy(Sender:TObject);
begin
  FIsDestroy:=True;
  FChanged:=False;
  FUpdateCount:=0;
  FOnChange:=nil;

  DoDestroy(Sender);
end;

procedure TSkinObjectChangeManager.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TSkinObjectChangeManager.EndUpdate(AIsForce:Boolean);
begin
  if FUpdateCount > 0 then
  begin
    Dec(FUpdateCount);
  end;

  if AIsForce then FUpdateCount:=0;

  if (FUpdateCount=0) and FChanged then
  begin
    FChanged := False;
    DoChange(FOwner);
  end;
end;

function TSkinObjectChangeManager.LinkCount: Integer;
begin
  Result:=Self.FLinks.Count;
end;

destructor TSkinObjectChangeManager.Destroy;
var
  I: Integer;
begin
  FIsDestroy:=True;

  FChanged:=False;
  FUpdateCount:=0;
  FOnChange:=nil;

  //取消注册所有的关联Link
  for I := FLinks.Count-1 downto 0 do
  begin
    UnRegisterChanges(TSkinObjectChangeLink(FLinks[I]));
  end;

  FLinks.Clear(False);

  uFuncCommon_Copy.FreeAndNil(FLinks);
  inherited;
end;







{ TSkinObjectChangeLink }

destructor TSkinObjectChangeLink.Destroy;
begin
  FOnChange:=nil;

  if FSender <> nil then
  begin
    FSender.UnRegisterChanges(Self);
  end;
  inherited Destroy;
end;

procedure TSkinObjectChangeLink.DoChange(Sender:TObject);
begin
  if Assigned(FOnChange) then
  begin
    FOnChange(Sender);
  end;
end;

procedure TSkinObjectChangeLink.DoDestroy(Sender:TObject);
begin
  if Assigned(FOnDestroy) then
  begin
    FOnDestroy(Sender);
  end;
end;






end.





