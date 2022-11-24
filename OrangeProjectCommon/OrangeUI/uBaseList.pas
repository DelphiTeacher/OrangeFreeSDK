//convert pas to utf8 by
/// <summary>
///   <para>
///     �б����
///   </para>
///   <para>
///     Base class of list
///   </para>
/// </summary>
unit uBaseList;



interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}




//���ڹ����·���FrameWork.inc
//�����ڹ�������������FMX����ָ��
//�ſ�����������˵�Ԫ
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}




uses
  Classes,
  SysUtils,


  uBaseLog,
  uFuncCommon;



type
  TBaseList=class;
  TSkinObjectChangeManager=class;



  TNotifyMessageEvent=procedure(Sender:TObject;AMessageID:String;AMessageDataStr:String;AMessageData:Pointer) of object;

  /// <summary>
  ///   <para>
  ///     ֪ͨ���ĵ�����
  ///   </para>
  ///   <para>
  ///     Link of NotifyChange
  ///   </para>
  /// </summary>
  TSkinObjectChangeLink = class(TObject)
  private
    FSender: TSkinObjectChangeManager;
    FOnChange: TNotifyEvent;
    FOnMessage: TNotifyMessageEvent;
    FOnDestroy: TNotifyEvent;
    FIsTemp:Boolean;
  public
    destructor Destroy; override;
  public
    FName:String;
    /// <summary>
    ///   <para>
    ///     ִ��OnChange
    ///   </para>
    ///   <para>
    ///     Execute OnChange
    ///   </para>
    /// </summary>
    procedure DoChange(Sender:TObject;AMessageID:String='';AMessageDataStr:String='';AMessageData:Pointer=nil);
    /// <summary>
    ///   <para>
    ///     ִ��OnDestroy
    ///   </para>
    ///   <para>
    ///     Execute OnDestroy
    ///   </para>
    /// </summary>
    procedure DoDestroy(Sender:TObject);
    /// <summary>
    ///   <para>
    ///     ���ĵ��¼�
    ///   </para>
    ///   <para>
    ///     Changed event
    ///   </para>
    /// </summary>
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnMessage: TNotifyMessageEvent read FOnMessage write FOnMessage;
    /// <summary>
    ///   <para>
    ///     �ͷŵ��¼�
    ///   </para>
    ///   <para>
    ///    Released event
    ///   </para>
    /// </summary>
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
  end;











  /// <summary>
  ///   <para>
  ///     ֪ͨ���ĵĹ�����
  ///   </para>
  ///   <para>
  ///     Manager of NotifyChange
  ///   </para>
  /// </summary>
  TSkinObjectChangeManager=class(TObject)
  private
    //ӵ����
    FOwner:TObject;



    //������TSkinObjectChangeLink�б�
    FLinks: TBaseList;
    //�Ƿ���Ĺ���
    FChanged: Boolean;
    //ֹͣ���ĵ��õĴ���
    FUpdateCount: Integer;
    //���ĵ��¼�
    FOnChange:TNotifyEvent;
    //�Ƿ��ͷ���
    FIsDestroy:Boolean;
  public
    constructor Create(AOwner:TObject);
    destructor Destroy;override;
  public
    //��ʼ�ͷ�,֪ͨLinkȥ��һЩ����(������OnChange�¼�)
    procedure BeginDestroy(Sender:TObject);virtual;
  public

    /// <summary>
    ///   <para>
    ///     ֪ͨ����Link���ø��ĵ��¼�(OnChange)
    ///   </para>
    ///   <para>
    ///     Notify every Link call changed event(OnChange)
    ///   </para>
    /// </summary>
    procedure DoChange(Sender:TObject;AName:String='';AMessageID:String='';AMessageDataStr:String='';AMessageData:Pointer=nil);virtual;

    /// <summary>
    ///   <para>
    ///     �ж��ٸ�Linnk
    ///   </para>
    ///   <para>
    ///     ??
    ///   </para>
    /// </summary>
    function LinkCount:Integer;


    /// <summary>
    ///   <para>
    ///     ֪ͨ����Link�����ͷŵ��¼�(OnDestroy)
    ///   </para>
    ///   <para>
    ///     Notify every Link call released event(OnDestroy)
    ///   </para>
    /// </summary>
    procedure DoDestroy(Sender:TObject);virtual;



    /// <summary>
    ///   <para>
    ///     ��ʼ����
    ///   </para>
    ///   <para>
    ///     Begin Update
    ///   </para>
    /// </summary>
    procedure BeginUpdate;virtual;

    /// <summary>
    ///   <para>
    ///     ��������
    ///   </para>
    ///   <para>
    ///     End Update
    ///   </para>
    /// </summary>
    procedure EndUpdate(AIsForce:Boolean=False);virtual;



    /// <summary>
    ///   <para>
    ///     ����BeginUpdate�����Ĵ���
    ///   </para>
    ///   <para>
    ///     Call count of BeginUpdate
    ///   </para>
    /// </summary>
    property UpdateCount:Integer read FUpdateCount;
  public

    /// <summary>
    ///   <para>
    ///     ע��֪ͨ���ĵ�����
    ///   </para>
    ///   <para>
    ///     Regist link of NotifyChange
    ///   </para>
    /// </summary>
    procedure RegisterChanges(Value: TSkinObjectChangeLink);overload;
    procedure RegisterChanges(AName:String;AOnChange: TNotifyEvent);overload;

    /// <summary>
    ///   <para>
    ///     ��ע��֪ͨ���ĵ�����
    ///   </para>
    ///   <para>
    ///    Unregist link of NotifyChange
    ///   </para>
    /// </summary>
    procedure UnRegisterChanges(Value: TSkinObjectChangeLink);overload;
    procedure UnRegisterChanges(AName:String;AOnChange: TNotifyEvent);overload;
  public

    /// <summary>
    ///   <para>
    ///     �Ƿ�ʼ�ͷ���
    ///   </para>
    ///   <para>
    ///     Whether begin release
    ///   </para>
    /// </summary>
    property IsDestroy:Boolean read FIsDestroy;

    /// <summary>
    ///   <para>
    ///     ���ĵ��¼�
    ///   </para>
    ///   <para>
    ///     Changed event
    ///   </para>
    /// </summary>
    property OnChange:TNotifyEvent read FOnChange write FOnChange;
  end;















  /// <summary>
  ///   <para>
  ///     �Ӷ���ӵ�й�ϵ������
  ///   </para>
  ///   <para>
  ///     Type of relationship subobject owns
  ///   </para>
  /// </summary>
  TObjectOwnership=(
                    /// <summary>
                    ///   ����,�б������ʱ���Ӷ����ͷ�
                    ///   <para>
                    ///    Reference, not release subobject when clear list
                    ///   </para>
                    /// </summary>
                    ooReference,
                    /// <summary>
                    ///   ӵ��,�Ӷ������б��,�б������ʱ���Ӷ����ͷ�
                    ///   <para>
                    ///     Own,subobject is own by list,release subobject when clear list
                    ///   </para>
                    /// </summary>
                    ooOwned
                    );






  /// <summary>
  ///   <para>
  ///     �Ӷ�����ĵ�����
  ///   </para>
  ///   <para>
  ///     ChangeType of subobject
  ///   </para>
  /// </summary>
  TItemChangeType=(
                    /// <summary>
                    ///   �����Ŀ
                    ///   <para>
                    ///     add item
                    ///   </para>
                    /// </summary>
                    ictAdd,
                    /// <summary>
                    ///   ɾ����Ŀ
                    ///   <para>
                    ///     delete item
                    ///   </para>
                    /// </summary>
                    ictDel,
                    /// <summary>
                    ///   �ƶ���Ŀ
                    ///   <para>
                    ///     move item
                    ///   </para>
                    /// </summary>
                    ictMove,
                    /// <summary>
                    ///   ������Ŀ
                    ///   <para>
                    ///     set item
                    ///   </para>
                    /// </summary>
                    ictSetItem

                    );
  /// <summary>
  ///   <para>
  ///     �Ӷ���������ͼ���
  ///   </para>
  ///   <para>
  ///     Set of subobject ChangeType
  ///   </para>
  /// </summary>
  TItemChangeTypes=set of TItemChangeType;







  /// <summary>
  ///   <para>
  ///     �Ӷ���ɾ�����¼�(��������֪ͨһЩ�ؼ���ն�Item������)
  ///   </para>
  ///   <para>
  ///     DeleteEvent of subobject(Used for informing some controls clear the
  ///     refrence of Item immediately)
  ///   </para>
  /// </summary>
  TItemDeleteEvent=procedure(Sender:TObject;AItem:TObject;AIndex:Integer) of object;








  /// <summary>
  ///   <para>
  ///     �Ӷ����б�
  ///   </para>
  ///   <para>
  ///     Subobject list
  ///   </para>
  /// </summary>
  TBaseList=class(TInterfacedPersistent)
  protected

    //��ǰ�Ƿ����ڼ���,
    //������ڼ���,
    //�ǲ�ô����DoAdd,OnChange�¼���
//    IsLoading:Boolean;

    /// <summary>
    ///   <para>
    ///     �б�
    ///   </para>
    ///   <para>
    ///     List
    ///   </para>
    /// </summary>
    FItems:TList;


    //֪ͨ���ĵĹ�����
    FSkinObjectChangeManager:TSkinObjectChangeManager;
    //�Ӷ����ӵ�й�ϵ
    FObjectOwnership:TObjectOwnership;



    //�ϴ��Ӷ���ĸ�������
    FLastItemChangeTypes:TItemChangeTypes;
    //���Ӷ���ɾ��
    FHasItemDeleted: Boolean;
    //�Ӷ���ɾ�����¼�
    FOnItemDelete: TItemDeleteEvent;


    //����OnChange�¼�
    procedure DoChange;virtual;
    //������Ŀ
    function GetItem(Index: Integer): TObject;
    procedure SetItem(Index: Integer; const Value: TObject);
    //�����¼�
    function GetOnChange: TNotifyEvent;
    procedure SetOnChange(const Value: TNotifyEvent);

  public
    /// <summary>
    ///   <para>
    ///     ���췽��
    ///   </para>
    ///   <para>
    ///     Construct methods
    ///   </para>
    /// </summary>
    /// <param name="AObjectOwnership">
    ///   �Ӷ����ϵ <br />Subobject relationship
    /// </param>
    /// <param name="AIsCreateObjectChangeManager">
    ///   �Ƿ񴴽�֪ͨ���ĵĹ�����
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
    ///     �Ӷ���ĸ���
    ///   </para>
    ///   <para>
    ///     Subobject count
    ///   </para>
    /// </summary>
    function GetCount:Integer;virtual;

    /// <summary>
    ///   <para>
    ///     ���
    ///   </para>
    ///   <para>
    ///     Clear
    ///   </para>
    /// </summary>
    /// <param name="AIsFree">
    ///   �Ƿ��ͷ��Ӷ���
    ///  <para>
    ///  whether release subobject
    ///  </para>
    /// </param>
    /// <param name="AIsNeedDelete">
    ///   �Ƿ���Ҫɾ���Ӷ���
    ///  <para>
    ///  whether need to delete subobject
    ///  </para>
    /// </param>
    procedure Clear(AIsFree:Boolean=True;AIsNeedDelete:Boolean=True);virtual;

    /// <summary>
    ///   <para>
    ///     �ƶ�(����)
    ///   </para>
    ///   <para>
    ///     Move (Exchange)
    ///   </para>
    /// </summary>
    /// <param name="ASrcIndex">
    ///   Դ�±�
    ///  <para>
    ///  original index
    ///  </para>
    /// </param>
    /// <param name="ADestIndex">
    ///   Ŀ���±�
    ///  <para>
    ///  target index
    ///  </para>
    /// </param>
    procedure Move(ASrcIndex:Integer;ADestIndex:Integer);overload;
  protected

    /// <summary>
    ///   <para>
    ///     �Ӷ������ʱ���ô˷���
    ///   </para>
    ///   <para>
    ///     Call this method when adding subobject
    ///   </para>
    /// </summary>
    procedure DoAdd(AObject:TObject);virtual;

    /// <summary>
    ///   <para>
    ///     �Ӷ���ɾ��ʱ���ô˷���
    ///   </para>
    ///   <para>
    ///     Call it when deleting subobject
    ///   </para>
    /// </summary>
    procedure DoDelete(AObject:TObject;AIndex:Integer);virtual;

    /// <summary>
    ///   <para>
    ///     �Ӷ������ʱ���ô˷���
    ///   </para>
    ///   <para>
    ///     Call it when inserting subobject
    ///   </para>
    /// </summary>
    procedure DoInsert(AObject:TObject;AIndex:Integer);virtual;

  public

    /// <summary>
    ///   <para>
    ///     ɾ��ָ���±���Ӷ���
    ///   </para>
    ///   <para>
    ///     Delete subobject of assigned index
    ///   </para>
    /// </summary>
    function Delete(AIndex:Integer;AIsFree:Boolean=True;AIsNeedDelete:Boolean=True):Integer;virtual;
    /// <summary>
    ///   <para>
    ///     ���ָ���Ӷ���
    ///   </para>
    ///   <para>
    ///     Clear assigned subobject
    ///   </para>
    /// </summary>
    function Remove(AObject:TObject;AIsFree:Boolean=True;AIsNeedDelete:Boolean=True):Integer;virtual;

    /// <summary>
    ///   <para>
    ///     ����Ӷ���
    ///   </para>
    ///   <para>
    ///     Add subobject
    ///   </para>
    /// </summary>
    function Add(AObject:TObject):Integer;virtual;

    /// <summary>
    ///   <para>
    ///     �����Ӷ���ָ���±�
    ///   </para>
    ///   <para>
    ///     Insert subobject to assigned index
    ///   </para>
    /// </summary>
    function Insert(AIndex: Integer;AObject:TObject):Integer;virtual;
  public

    /// <summary>
    ///   <para>
    ///     ��ȡ�Ӷ��������±�
    ///   </para>
    ///   <para>
    ///     Get index of subobject
    ///   </para>
    /// </summary>
    function IndexOf(AObject:TObject):Integer;virtual;

    /// <summary>
    ///   <para>
    ///     ����
    ///   </para>
    ///   <para>
    ///     Sort
    ///   </para>
    /// </summary>
    procedure Sort(Compare: TListSortCompare);virtual;
  public

    /// <summary>
    ///   <para>
    ///     ��ʼ����
    ///   </para>
    ///   <para>
    ///     Begin update
    ///   </para>
    /// </summary>
    procedure BeginUpdate;virtual;

    /// <summary>
    ///   <para>
    ///     ��������
    ///   </para>
    ///   <para>
    ///     End update
    ///   </para>
    /// </summary>
    /// <param name="Force">
    ///   �Ƿ�ǿ�Ƹ���
    ///  <para>
    ///  Whetehr forced to update
    ///  </para>
    /// </param>
    procedure EndUpdate(AIsForce:Boolean=False);virtual;


    /// <summary>
    ///   <para>
    ///     �Ƿ����Ӷ���ɾ����
    ///   </para>
    ///   <para>
    ///     Whether there is a subobject deleted
    ///   </para>
    /// </summary>
    property HasItemDeleted:Boolean read FHasItemDeleted write FHasItemDeleted;

    /// <summary>
    ///   <para>
    ///     �ϴ��Ӷ����������
    ///   </para>
    ///   <para>
    ///     Last ChangeType of subobject
    ///   </para>
    /// </summary>
    property LastItemChangeTypes:TItemChangeTypes read FLastItemChangeTypes;


    /// <summary>
    ///   <para>
    ///     �Ӷ���ɾ�����¼�
    ///   </para>
    ///   <para>
    ///     Event of Subobject deleted
    ///   </para>
    /// </summary>
    property OnItemDelete:TItemDeleteEvent read FOnItemDelete write FOnItemDelete;

    /// <summary>
    ///   <para>
    ///     ���ĵ��¼�
    ///   </para>
    ///   <para>
    ///     Changed event
    ///   </para>
    /// </summary>
    property OnChange:TNotifyEvent read GetOnChange write SetOnChange;

    /// <summary>
    ///   <para>
    ///     ֪ͨ���ĵĹ�����
    ///   </para>
    ///   <para>
    ///     Manager of NotifyChange
    ///   </para>
    /// </summary>
    property SkinObjectChangeManager:TSkinObjectChangeManager read FSkinObjectChangeManager;
  public

    /// <summary>
    ///   <para>
    ///     �Ӷ����ӵ�й�ϵ
    ///   </para>
    ///   <para>
    ///     Owner relationship of subobject
    ///   </para>
    /// </summary>
    property ObjectOwnership:TObjectOwnership read FObjectOwnership write FObjectOwnership;

    /// <summary>
    ///   <para>
    ///     �Ӷ���
    ///   </para>
    ///   <para>
    ///     Subobject
    ///   </para>
    /// </summary>
    property Items[Index:Integer]:TObject read GetItem write SetItem;default;
  published

    /// <summary>
    ///   <para>
    ///     �Ӷ���ĸ���
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

//  if Not IsLoading then//Ϊʲô?Ϊ���ٷ���Change��?
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
  //��ʼ����ɾ��֪ͨ
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
  //������While,��Ϊ��ʱ����Ҫɾ��,��While����ѭ��
  //while Self.Count>0 do

  //ֻ����For
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


  //�ͷ�
  if AIsFree and (AObject<>nil) then
  begin
    try
      ObjRelease(AObject);
      SysUtils.FreeAndNil(AObject);
    except
      on E:Exception do
      begin
        uBaseLog.OutputDebugString('TBaseList.Delete'+' '+Self.ClassName+' '+E.Message);
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
  //��ʼ֪ͨ����Link��List��ʼ�ͷ���
  if FSkinObjectChangeManager<>nil then
  begin
    FSkinObjectChangeManager.BeginDestroy(Self);
  end;



  //����б�
  Self.Clear((FObjectOwnership=ooOwned),True);

  SysUtils.FreeAndNil(FSkinObjectChangeManager);

  SysUtils.FreeAndNil(FItems);
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
//    //ASrcIndex 0 �Ƶ� ADestIndex 2
//    //0 Delete��֮��,ԭ����ADestIndex�����1
//    Self.Insert(ADestIndex,ASrcPointer);
//  end
//  else
//  begin
    //ASrcIndex 2 �Ƶ� ADestIndex 0
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

procedure TSkinObjectChangeManager.DoChange(Sender:TObject;AName:String='';AMessageID:String='';AMessageDataStr:String='';AMessageData:Pointer=nil);
var
  I: Integer;
begin
  FChanged := True;
  if FUpdateCount > 0 then Exit;

  if FLinks <> nil then
  begin
    //֪ͨ�����Ŀؼ�
    for I := FLinks.Count - 1 downto 0 do
    begin
      if TSkinObjectChangeLink(FLinks[I]).FName=AName then
      begin
        TSkinObjectChangeLink(FLinks[I]).DoChange(Sender,AMessageID,AMessageDataStr,AMessageData);
      end;
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
    //֪ͨ�����Ŀؼ�
    for I := FLinks.Count - 1 downto 0 do
    begin
      TSkinObjectChangeLink(FLinks[I]).DoDestroy(Sender);
    end;
  end;
end;

constructor TSkinObjectChangeManager.Create(AOwner:TObject);
begin
  FOwner:=AOwner;
  //�����Ŀؼ�
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

        if Value.FIsTemp then
        begin
          FreeAndNil(Value);
        end;

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

procedure TSkinObjectChangeManager.RegisterChanges(AName: String;
  AOnChange: TNotifyEvent);
var
  AChangeLink:TSkinObjectChangeLink;
begin
  AChangeLink:=TSkinObjectChangeLink.Create;
  AChangeLink.FName:=AName;
  AChangeLink.OnChange:=AOnChange;
  AChangeLink.FIsTemp:=True;
//  AChangeLink.OnDestroy:=OnSkinImageListDestroy;
  Self.RegisterChanges(AChangeLink);
end;

destructor TSkinObjectChangeManager.Destroy;
var
  I: Integer;
begin
  FIsDestroy:=True;

  FChanged:=False;
  FUpdateCount:=0;
  FOnChange:=nil;

  //ȡ��ע�����еĹ���Link
  for I := FLinks.Count-1 downto 0 do
  begin
    UnRegisterChanges(TSkinObjectChangeLink(FLinks[I]));
  end;

  FLinks.Clear(False);

  SysUtils.FreeAndNil(FLinks);
  inherited;
end;

procedure TSkinObjectChangeManager.UnRegisterChanges(AName: String;
  AOnChange: TNotifyEvent);
var
  I: Integer;
  AChangeLink:TSkinObjectChangeLink;
begin
  if FLinks <> nil then
  begin
    //֪ͨ�����Ŀؼ�
    for I := FLinks.Count - 1 downto 0 do
    begin
      if (TSkinObjectChangeLink(FLinks[I]).FName=AName)
        {}
//        and (TMethod(TSkinObjectChangeLink(FLinks[I]).FOnChange)=TMethod(AOnChange))
        and (TMethod(TSkinObjectChangeLink(FLinks[I]).FOnChange).Code=TMethod(AOnChange).Code)
        and (TMethod(TSkinObjectChangeLink(FLinks[I]).FOnChange).Data=TMethod(AOnChange).Data)
        then
      begin
        AChangeLink:=TSkinObjectChangeLink(FLinks[I]);

        FLinks.Delete(I,False);

        if AChangeLink.FIsTemp then
        begin
          FreeAndNil(AChangeLink);
        end;

        Break;
      end;
    end;
  end;

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

procedure TSkinObjectChangeLink.DoChange(Sender:TObject;AMessageID:String='';AMessageDataStr:String='';AMessageData:Pointer=nil);
begin
  if Assigned(FOnChange) then
  begin
    FOnChange(Sender);
  end;
  if Assigned(FOnMessage) then
  begin
    FOnMessage(Sender,AMessageID,AMessageDataStr,AMessageData);
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





