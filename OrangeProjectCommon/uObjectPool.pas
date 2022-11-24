//convert pas to utf8 by ¥
/// /////////////////////////////////////////////////////////////////////////////
//
// The uObjectPool unit contains base classes of CustomObject Pool.
//
unit uObjectPool;




interface

uses
  Classes,
  uBaseLog,
//  Windows ,
  SyncObjs,
  SysUtils;

type
  TPoolObjectClass = class of TPoolObject;
  TObjectPool = class;





  /// ///////////////////////////////////////////////////////////////////////////
  //
  // Summary:
  // TPoolObject represents a object in a object pool
  // (TObjectPool).
  //
  // Description:
  // Each TObjectPool uses a TPoolObjects to maintain a
  // collection of TPoolObject objects. Each TPoolObject object
  // represents the single database object in the pool.
  //
  TPoolObject = class(TCollectionItem)
  private
    FBusy: Boolean;
//    FisDel: Boolean;
//    FIsError: Boolean;
//    FFirstUsed: Boolean;
//    FOwnerObj: tObject;
//    FPoolObjectIndex: Integer;
//    FCreateDateTime: string;
  protected
    FCustomObject: TObject;
    //
    // Summary:
    // Locks the object in the object pool
    //
    // Description:
    // Lock mark object as "locked" and opens object if it closed.
    //
    // SeeAlso:
    // Busy, TObjectPool.GetCustomObject
    //
    //
    // Summary:
    // Unlocks the object in the object pool
    //
    // Description:
    // Unlock mark object as "unlocked". Unlocked object can be
    // retreived by calling TObjectPool.GetCustomObject
    //
    // SeeAlso:
    // Busy, TObjectPool.FreeCustomObject
    //
    procedure Unlock; virtual;
    //
    // Summary:
    // Connected checks database object
    //
    // Result:
    // True - if object connected to database
    // False - otherwise
    //
    // SeeAlso:
    // CustomObject
    //
//    function Connected: Boolean; virtual;
    //
    // Summary:
    // CreateCustomObject creates object element
    //
    // Result:
    // Newly created TObject descendant
    //
    // SeeAlso:
    // CustomObject
    //
    function CreateCustomObject: TObject; virtual; abstract;
  public
      procedure Lock; virtual;
    //
    // Summary:
    // Indicates that the object has been locked.
    //
    // Description:
    // Busy is a Boolean property that indicates when the object has been
    // locked.
    //
    // SeeAlso:
    // Lock, Unlock
    //
    property Busy: Boolean read FBusy;
//    property IsError: Boolean read FIsError write FIsError;
//    property FirstUsed: Boolean read FFirstUsed write FFirstUsed;
//    property OwnerObj: tObject read FOwnerObj write FOwnerObj;
//    property CreateDateTime: string read FCreateDateTime;
//    property isDel: Boolean read FisDel write FisDel;

    //
    // Summary:
    // Contains TObject descendants represented by this object
    // pool item.
    //
    // SeeAlso:
    // TObjectPool.GetCustomObject,
    // TObjectPool.FreeCustomObject
    //
    property CustomObject: TObject read FCustomObject;
    //
    // Summary:
    // Creates and initializes a TPoolObject instance.
    //
    // Description:
    // The Create method takes as a parameter the name of a TCollection
    // instance. Create is called by TPoolObject抯 Add method.
    //
    // SeeAlso:
    // TPoolObjects.Add
    //
    constructor Create(aCollection: TCollection); override;

    //
    // Summary:
    // Destroys the TPoolObject instance and frees its memory.
    //
    // Description:
    // Destroy is called indirectly by TCollection抯 Clear method.
    //
    // SeeAlso:
    // TCollection.Clear
    //
    destructor Destroy; override;
  end;
















  /// ///////////////////////////////////////////////////////////////////////////
  //
  // Summary:
  // TPoolObjects is a container for TPoolObject objects.
  //
  // Description:
  // Each TPoolObjects holds a collection of TPoolObject objects in a
  // object pool (TObjectPool). TPoolObjects maintains an
  // index of the object in its Items array. The Count property contains
  // the number of connections in the collection.
  //
  // SeeAlso:
  // TObjectPool, TPoolObject
  //
  TPoolObjects = class(TOwnedCollection)
  private
    function GetItem(aIndex: Integer): TPoolObject;
    procedure SetItem(aIndex: Integer; const Value: TPoolObject);
  public
    //
    // Summary:
    // Provides indexed access to the items in the collection.
    //
    // Description:
    // Use Items to access individual items in the collection. The value of
    // the Index parameter corresponds to the Index property of
    // TPoolObject. It represents the position of the item in the
    // collection.
    //
    property Items[aIndex: Integer]: TPoolObject read GetItem write SetItem; default;

    //
    // Summary:
    // Creates a new TPoolObject instance and adds it to the Items array.
    //
    // Description:
    // Call Add to create an item in the collection. The new item is placed at
    // the end of the Items array.
    //
    // Result:
    // Add returns the new collection item.
    //
    function Add: TPoolObject;
{$IFNDEF VER140}
    //
    // Summary:
    // Returns the Owner of the collection.
    //
    // Description:
    // Call Owner to obtain a reference to the object that owns this
    // collection. Typically, the owner uses the collection to implement one
    // of its properties.
    //
    function Owner: TPersistent;
{$ENDIF}
  end;







  TExceptionEvent = procedure(Sender: TObject; E: Exception) of object;

  /// ///////////////////////////////////////////////////////////////////////////
  //
  // Summary:
  // TObject is the base class for components that represents a pool
  // of connections to one database.
  //
  // Description:
  // Use TObject as a base class for components that represent a
  // poolof connections to one database. Do not create instances of
  // TObjectPool. To add a component that represents the object
  // pool, use a TObjectPool descendant such as TBDEConnectioPool,
  // TADOObjectPool, TDBXObjectPool.
  //
  // SeeAlso:
  // TBDEConnectioPool, TADOObjectPool, TDBXObjectPool.
  //
  TObjectPool = class(TComponent)
  private
    FMaxCustomObjects: LongInt;

    FOnLockCustomObject: TNotifyEvent;
    FOnLockFail: TExceptionEvent;
    FOnUnLockCustomObject: TNotifyEvent;
    FOnCreateCustomObject: TNotifyEvent;
    FOnFreeCustomObject: TNotifyEvent;
    function GetUnusedCustomObjects: LongInt;
    function GetTotalCustomObjects: LongInt;
  protected
    //
    // Summary:
    // Returns class of items into pool collection.
    //
    // Description:
    // TObjectPool descendants overrides GetPoolItemClass for
    // declaring class of items in the pool collection.
    //
    // Result:
    // Class of items into pool collection.
    //
    function GetPoolItemClass: TPoolObjectClass; virtual; abstract;

    //
    // Summary:
    // Generates an OnLock event.
    //
    // Description:
    // DoLock is called automatically when object locked. Override this
    // method to provide additional processing other than calling the OnLock
    // event handler.
    //
    // SeeAlso:
    // OnLock, TPoolObject.Lock
    //
    procedure DoLock; virtual;

    //
    // Summary:
    // Generates an OnLockFail event.
    //
    // Description:
    // DoLockFail is called automatically when object locking
    // failed (CustomObject limit exceeded or any other error raised).
    // Override this method to provide additional processing other than
    // calling the OnLockFail event handler.
    //
    // SeeAlso:
    // OnLockCustomObject, OnLockFail
    //
    procedure DoLockFail(E: Exception); virtual;

    //
    // Summary:
    // Generates an OnUnlock event.
    //
    // Description:
    // DoUnlock is called automatically when object unlocked. Override
    // this method to provide additional processing other than calling the
    // OnUnlock event handler.
    //
    // SeeAlso:
    // OnUnlock, TPoolObject.Unlock
    //
    procedure DoUnlock; virtual;

    //
    // Summary:
    // Generates an OnCreateCustomObject event.
    //
    // Description:
    // DoCreateCustomObject is called automatically when new object
    // allocated. Override this method to provide additional processing other
    // than calling the OnCreateCustomObject event handler.
    //
    // SeeAlso:
    // OnCreateCustomObject
    //
    procedure DoCreateCustomObject; virtual;

    //
    // Summary:
    // Generates an OnFreeCustomObject event.
    //
    // Description:
    // OnFreeCustomObject is called automatically when object destroyed
    // Override this method to provide additional processing other than
    // calling the OnCreateCustomObject event handler.
    //
    // SeeAlso:
    // OnFreeCustomObject
    //
    procedure DoFreeCustomObject; virtual;
  public
    FCS: TCriticalSection;
    FCustomObjects: TPoolObjects;
    FRecvEvent:TEvent;
    FWaitCount:Integer;

    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    // Summary:
    // Copies the contents of another ObjectPool or CustomObject.
    //
    // Description:
    // Call Assign to copy the properties of CustomObject Pool from another
    // ObjectPool or CustomObject. The standard form of a call to Assign is
    // <CODE>
    // Destination.Assign(Source);
    // </CODE>
//    procedure AssignTo(Dest: TPersistent); override;

    //
    // Summary:
    // MaxCustomObjects reprsents the max. number of connections in the pool.
    //
    // Description
    // MaxCustomObjects property is used to set the number of concurrent
    // connections the object pool will make to the database.
    // If MaxCustomObjects = -1, then number of connections is unlimited.
    //
    // SeeAlso:
    // GetCustomObject
    //
    property MaxCustomObjects
      : LongInt read FMaxCustomObjects write FMaxCustomObjects
      default - 1;

    function GetPoolObject: TPoolObject;
//    function GetNewPoolObject: TPoolObject;
    //
    // Summary:
    // Retreives object from the pool.
    //
    // Description:
    // GetCustomObject looks into connections list for unlocked object.
    // If none found and number of connections less than MaxCustomObjects, then
    // new object is allocated.
    //
    // Result:
    // Returns pooled object.
    //
    // SeeAlso:
    // FreeCustomObject, MaxCustomObjects.
    //
    function GetCustomObject: TObject;

    //
    // Summary:
    // Returns object into the pool.
    //
    // Description:
    // FreeCustomObject calls Unlock method of the TPoolObject
    //
    // Parameters:
    // aCustomObject - freed object.
    //
    // SeeAlso:
    // GetCustomObject
    //
    procedure FreeCustomObject(aCustomObject: TObject;
      bDelete: Boolean = false);
    procedure FreePoolObject(APoolObject: TPoolObject); //
    // Summary:
    // Returns number of unused connections in the pool.
    //
    // Description:
    // Use UnusedCustomObjects for calculating number of allocated and not used
    // connections.
    //
    property UnusedCustomObjects: LongInt read GetUnusedCustomObjects;

    //
    // Summary:
    // Returns number of allocated connections in the pool.
    //
    // Description:
    // Use TotalCustomObjects for retrieving number of allocated connections in
    // the pool.
    //
    property TotalCustomObjects: LongInt read GetTotalCustomObjects;

    //
    // Summary:
    // Occurs when a object into pool is locked.
    //
    // Description:
    // Write an OnLockCustomObject event handler to take application-specific
    // actions immediately after the object pool component locks a
    // object.
    //
    property OnLockCustomObject
      : TNotifyEvent read FOnLockCustomObject write FOnLockCustomObject;
    //
    // Summary:
    // Occurs when a object into pool is unlocked.
    //
    // Description:
    // Write an OnUnlockCustomObject event handler to take application-specific
    // actions immediately after the object pool component unlocks a
    // object.
    //
    property OnUnlockCustomObject
      : TNotifyEvent read FOnUnLockCustomObject write FOnUnLockCustomObject;

    //
    // Summary:
    // Occurs when a object pool allocates new object.
    //
    // Description:
    // Write an OnCreateCustomObject event handler to take application-specific
    // actions immediately after the new object into pool is allocated.
    //
    property OnCreateCustomObject
      : TNotifyEvent read FOnCreateCustomObject write FOnCreateCustomObject;

    //
    // Summary:
    // Occurs when locking a object into pool is failed.
    //
    // Description:
    // Write an OnLockFail event handler to take application-specific
    // actions immediately after the locking object  into pool is failed.
    //
    property OnLockFail: TExceptionEvent read FOnLockFail write FOnLockFail;

    //
    // Summary:
    // Occurs when a object pool frees object.
    //
    // Description:
    // Write an OnFreeCustomObject event handler to take application-specific
    // actions immediately after the object into pool is freed.
    //
    property OnFreeCustomObject
      : TNotifyEvent read FOnFreeCustomObject write FOnFreeCustomObject;
  end;




  var
    GPoolObjectCount, GPoolObjectNick: Integer;
    GPoolObjectCountLock:TCriticalSection;

implementation



//{$IFDEF TRIAL}
//
//uses
//  Windows;
//{$ENDIF}
//
//uses uADOObjectPool;

{ TPoolObject }
{ - protected ----------------------------------------------------------------- }
procedure TPoolObject.Lock;
begin
  FBusy := true;
//  if not Connected then
//    CustomObject.Open;
  if Assigned(Collection) then
    TObjectPool(TPoolObjects(Collection).Owner).DoLock;
end;

procedure TPoolObject.Unlock;
begin
  FBusy := false;
  if Assigned(Collection) then
    TObjectPool(TPoolObjects(Collection).Owner).DoUnlock;
end;

//function TPoolObject.Connected: Boolean;
//begin
//  Result := CustomObject.Connected;
//end;

{ - public ------------------------------------------------------------------- }
constructor TPoolObject.Create(aCollection: TCollection);
begin
  inherited;

  if GPoolObjectCountLock<>nil then GPoolObjectCountLock.Enter;
  try
//    InterlockedIncrement(GPoolObjectCount);
    Inc(GPoolObjectCount);
  finally
    if GPoolObjectCountLock<>nil then GPoolObjectCountLock.Leave;
  end;




//  FCreateDateTime := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
  if Assigned(aCollection) then
  begin
    FCustomObject := CreateCustomObject;
    TObjectPool(TPoolObjects(Collection).Owner)
      .DoCreateCustomObject;
  end;
end;

destructor TPoolObject.Destroy;
begin

  if GPoolObjectCountLock<>nil then GPoolObjectCountLock.Enter;
  try
//  InterlockedDecrement(GPoolObjectCount);
      Dec(GPoolObjectCount);
  finally
    if GPoolObjectCountLock<>nil then GPoolObjectCountLock.Leave;
  end;




  if Busy then
    Unlock;
  FreeAndNil(FCustomObject);
  if Assigned(Collection) then
    TObjectPool(TPoolObjects(Collection).Owner).DoFreeCustomObject;

  inherited;
end;

{ TPoolObjects }
{ - private ------------------------------------------------------------------ }
function TPoolObjects.GetItem(aIndex: Integer): TPoolObject;
begin
  Result := inherited GetItem(aIndex) as TPoolObject;
end;

procedure TPoolObjects.SetItem(aIndex: Integer;
  const Value: TPoolObject);
begin
  inherited SetItem(aIndex, Value);
end;

{ - public ------------------------------------------------------------------- }
function TPoolObjects.Add: TPoolObject;
begin
  Result := inherited Add as TPoolObject;
end;
{$IFNDEF VER140}

function TPoolObjects.Owner: TPersistent;
begin
  Result := GetOwner;
end;
{$ENDIF}

{ TObjectPool }
{ - private ------------------------------------------------------------------ }
function TObjectPool.GetUnusedCustomObjects: LongInt;
var
  I: LongInt;
begin
  FCS.Enter;
  Result := 0;
  try
    for I := 0 to FCustomObjects.Count - 1 do
      if not FCustomObjects[I].Busy then
        Inc(Result);
  finally
    FCS.Leave;
  end;
end;

function TObjectPool.GetTotalCustomObjects: LongInt;
begin
  Result := FCustomObjects.Count;
end;

{ - public ------------------------------------------------------------------- }
constructor TObjectPool.Create(aOwner: TComponent);
begin
  inherited;
  FCS := TCriticalSection.Create;
  FCustomObjects := TPoolObjects.Create(Self, GetPoolItemClass);
  FMaxCustomObjects := -1;
  FRecvEvent:=TEvent.Create(nil, True, False, '');
end;

destructor TObjectPool.Destroy;
begin
  FCS.Enter;
  try
    FCustomObjects.Free;
    // FreeAndNil(FCustomObjects);
  finally
    FCS.Leave;
  end;
  FreeAndNil(FCS);
  FreeAndNil(FRecvEvent);
  inherited;
end;

//procedure TObjectPool.AssignTo(Dest: TPersistent);
//begin
//  if Dest is TObjectPool then
//    TObjectPool(Dest).MaxCustomObjects := MaxCustomObjects
//  else
//    inherited AssignTo(Dest);
//end;

function TObjectPool.GetCustomObject: TObject;
var
  APoolObject: TPoolObject;
begin
  Result := nil;
  APoolObject := GetPoolObject;
  if Assigned(APoolObject) then
    Result := APoolObject.CustomObject
end;

//function TObjectPool.GetNewPoolObject: TPoolObject;
//begin
//  //Result := GetPoolObject;
//  //exit;
//  Result := TADOPoolObject.Create(nil);
////  TADOPoolObject(Result).ADOObjectPool := TADOObjectPool
////    (TPoolObjects(FCustomObjects).Owner);
////  Result.FCustomObject := TADOPoolObject(Result).CreateCustomObject;
//  Result.FFirstUsed := true;
//  //with Result do
//  //begin
//  //  Lock;
//  //end;
//end;

function TObjectPool.GetPoolObject: TPoolObject;
var
  I: LongInt;
begin
  Result := nil;
  //Assert(false);

  while Result=nil do
  begin


    FCS.Enter;
    try

      try


            I := 0;
            while I < FCustomObjects.Count do
            begin
              if not FCustomObjects[I].Busy then
              begin
                Result := FCustomObjects[I];
      //          if Result.FFirstUsed then
      //            Result.FFirstUsed := false;
                try
                  FCustomObjects[I].Lock;
                  Break;
                except
                  FCustomObjects.Delete(I);
                  Continue;
                end;
              end;
              Inc(I);
            end;


            if Result = nil then
              if ((FCustomObjects.Count < MaxCustomObjects) or (MaxCustomObjects = -1))
      {$IFDEF TRIAL}
              and ((FindWindow('TAppBuilder', nil) <> 0) or (FCustomObjects.Count < 3))
      {$ENDIF}
              then
              begin
                Result := FCustomObjects.Add;
      //          Result.FFirstUsed := true;
                with Result do
                begin
                  Lock;
                end;
              end
              else
              begin
                //raise Exception.Create('CustomObject pool limit exceeded.');
                Inc(FWaitCount);
                uBaseLog.HandleException(nil,'TObjectPool.GetPoolObject '+'CustomObject pool limit exceeded. Wait FWaitCount:'+IntToStr(FWaitCount));

              end;




      except
        On E: Exception do
          DoLockFail(E);
      end;
    finally
      FCS.Leave;
    end;


    if Result=nil then
    begin
      //不应该报错,应该在这里等
      FRecvEvent.WaitFor(INFINITE);
      Dec(FWaitCount);

      uBaseLog.HandleException(nil,'TObjectPool.GetPoolObject '+'CustomObject pool limit exceeded. OK Try FWaitCount:'+IntToStr(FWaitCount));

    end;

  end;

end;

procedure TObjectPool.FreeCustomObject(aCustomObject: TObject;
  bDelete: Boolean);
var
  I: LongInt;
begin
  //bDelete := False;
  try
//    if (aCustomObject as TADOCustomObject).InTransaction then
//    begin (aCustomObject as TADOCustomObject)
//      .RollbackTrans;
//    end;
//    if bDelete then (aCustomObject as TADOCustomObject)
//      .Connected := false;
    FCS.Enter;
    try
      for I := 0 to FCustomObjects.Count - 1 do
        if FCustomObjects[I].CustomObject = aCustomObject then
        begin
          if bDelete then
            FCustomObjects.Delete(I)
          else
            FCustomObjects[I].Unlock;
          Break;
        end;

      if FWaitCount>0 then
      begin
        //有一个空了
        FRecvEvent.SetEvent;
      end;


    finally
      FCS.Leave;
    end;
  except
  end;
end;

procedure TObjectPool.FreePoolObject
  (APoolObject: TPoolObject);
begin
  FreeCustomObject(APoolObject.CustomObject);
  //exit;
//  try
////    TADOCustomObject(APoolObject.CustomObject).Connected := False;
//    APoolObject.Free;
//  except
//  end;
end;

procedure TObjectPool.DoLock;
begin
  if Assigned(FOnLockCustomObject) then
    FOnLockCustomObject(Self);
end;

procedure TObjectPool.DoUnlock;
begin
  if Assigned(FOnUnLockCustomObject) then
    FOnUnLockCustomObject(Self);
end;

procedure TObjectPool.DoCreateCustomObject;
begin
  if Assigned(FOnCreateCustomObject) then
    FOnCreateCustomObject(Self);
end;

procedure TObjectPool.DoLockFail(E: Exception);
begin
  if Assigned(FOnLockFail) then
    FOnLockFail(Self, E);
end;

procedure TObjectPool.DoFreeCustomObject;
begin
  if Assigned(FOnFreeCustomObject) then
    FOnFreeCustomObject(Self);
end;


initialization
  GPoolObjectCountLock:=TCriticalSection.Create;


finalization
  FreeAndNil(GPoolObjectCountLock);



end.



