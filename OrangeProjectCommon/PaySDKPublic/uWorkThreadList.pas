//convert pas to utf8 by
//copyright delphiteacher QQ:452330643
//2015-08-08
//δ����Ȩ,�Ͻ��������ͻ�ת������ʹ��


//�б����
unit uWorkThreadList;

interface


uses
  Classes,
  SysUtils;



type
//  {$Region '�б����'}
  TWorkThreadList=class;



  //�Ӷ���ӵ�й�ϵ����
  TObjectOwnership=(ooReference,//���ã��Ӷ���Ҫ�����ͷ�
                    ooOwned);   //ӵ�У��Ӷ������Լ��ģ��Լ��ͷ�





  //�Ӷ����������
  TItemChangeType=(ictAdd,          //�����Ŀ
                    ictDel,         //ɾ����Ŀ
                    ictMove,        //�ƶ���Ŀ
                    ictSetItem      //������Ŀ
                    );
  TItemChangeTypes=set of TItemChangeType;




  //�Ӷ���ɾ�����¼�(��������֪ͨһЩ�ؼ���ն�Item������)
  TItemDeleteEvent=procedure(Sender:TObject;AItem:TObject;AIndex:Integer) of object;

  //�Ӷ����б�
  TWorkThreadList=class(TInterfacedPersistent)
  protected
    //�б�
    FItems:TList;
    //�ϴ���Ŀ��������
    FLastItemChangeTypes:TItemChangeTypes;
    //ӵ�й�ϵ
    FObjectOwnership:TObjectOwnership;

    //���Ӷ���ɾ��
    FHasItemDeleted: Boolean;
    //�Ӷ���ɾ�����¼�
    FOnItemDelete: TItemDeleteEvent;
    //������Ŀ
    function GetItem(Index: Integer): TObject;
    procedure SetItem(Index: Integer; const Value: TObject);

  public
    constructor Create(AObjectOwnership:TObjectOwnership=ooOwned);virtual;
    destructor Destroy;override;
  public
    //����
    function GetCount:Integer;virtual;
    //���
    procedure Clear(AIsFree:Boolean;AIsNeedDelete:Boolean=True);virtual;
    //�ƶ�����
    procedure Move(ASrcIndex:Integer;ADestIndex:Integer);overload;
    procedure Move(ASrcObject:TObject;ADestObject:TObject);overload;
  public
    //���ʱ
    procedure DoAdd(AObject:TObject);virtual;
    //ɾ��ʱ
    procedure DoDelete(AObject:TObject;AIndex:Integer);virtual;
    //����ʱ
    procedure DoInsert(AObject:TObject;AIndex:Integer);virtual;

    //ɾ��
    function Delete(AIndex:Integer;AIsFree:Boolean=True;AIsNeedDelete:Boolean=True):Integer;virtual;
    function Remove(AObject:TObject;AIsFree:Boolean=True;AIsNeedDelete:Boolean=True):Integer;virtual;
    //���
    function Add(AObject:TObject):Integer;virtual;
    //����
    function Insert(AIndex: Integer;AObject:TObject):Integer;virtual;
  public
    //��λ
    function IndexOf(AObject:TObject):Integer;virtual;
    //����
    procedure Sort(Compare: TListSortCompare);
  public

    //�Ƿ����б�ɾ����
    property HasItemDeleted:Boolean read FHasItemDeleted write FHasItemDeleted;
    //�ϴθ�������
    property LastItemChangeTypes:TItemChangeTypes read FLastItemChangeTypes;

    //�����¼�
    property OnItemDelete:TItemDeleteEvent read FOnItemDelete write FOnItemDelete;
  public
    //ӵ�й�ϵ
    property ObjectOwnership:TObjectOwnership read FObjectOwnership write FObjectOwnership;
    //
    property Items[Index:Integer]:TObject read GetItem write SetItem;default;
  published
    //����
    property Count:Integer read GetCount;
  end;




//��������
procedure ObjAddRef(Obj:TObject);
//��������
procedure ObjRelease(Obj:TObject);
//�ͷ�
//�ͷ�
//�ͷ�
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


  //��ʼ����ɾ��֪ͨ
  if Assigned(FOnItemDelete) then
  begin
    FOnItemDelete(Self,AObject,AIndex);
  end;


  DoDelete(AObject,AIndex);


  if AIsNeedDelete then Self.FItems.Delete(AIndex);


  //�ͷ�
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
  //����б�
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


