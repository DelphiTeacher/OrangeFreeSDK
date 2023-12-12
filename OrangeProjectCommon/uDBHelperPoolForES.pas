//convert pas to utf8 by ¥
//Uni数据库操作类的线程池,用于连接MSSQL//
unit uDBHelperPoolForES;


interface


uses
//  Windows,
  SysUtils,
  Classes,
//  Forms,
//  IniFiles,
//  DB,ADODB,
//  SyncObjs,



  uBaseLog,
  uDatabaseConfig,
  uDBHelperForES,
  uObjectPool;


  //不使用kbmMWUNIDACConnectionPool
//  {$DEFINE NOT_USE_kbmMWUNIDACConnectionPool}


type
  TESDBHelperPoolObject = class(TPoolObject)
  protected
    function CreateCustomObject: TObject; override;
  public
    FDBHelper:TESDBHelper;
    destructor Destroy; override;
  end;



  TESDBHelperPool=class(TObjectPool)
  protected
    function GetPoolItemClass: TPoolObjectClass; override;
  public
    //FMX,APP,一般不需要KBMMW的线程池控件
    FDBConfig:TDatabaseConfig;
  end;




//function GetGlobalSQLDBHelperPool
////  (AUnidacConnectionPool:TkbmMWUNIDACConnectionPool)
//  :TESDBHelperPool;
//procedure FreeGlobalESDBHelperPool;



implementation



//var
//  GlobalESDBHelperPool: TESDBHelperPool;
//
//function GetGlobalSQLDBHelperPool
////  (AUnidacConnectionPool:TkbmMWUNIDACConnectionPool)
//  :TESDBHelperPool;
//begin
//  if GlobalESDBHelperPool=nil then
//  begin
//    GlobalESDBHelperPool:=TESDBHelperPool.Create(nil);
////    GlobalESDBHelperPool.FUnidacConnectionPool:=AUnidacConnectionPool;
//  end;
//  Result:=GlobalESDBHelperPool;
//end;
//
//procedure FreeGlobalESDBHelperPool;
//begin
//  FreeAndNil(GlobalESDBHelperPool);
//end;









{ TESDBHelperPool }

function TESDBHelperPool.GetPoolItemClass: TPoolObjectClass;
begin
  Result:=TESDBHelperPoolObject;
end;

{ TESDBHelperPoolObject }

function TESDBHelperPoolObject.CreateCustomObject: TObject;
var
  AProviderName:String;
  AESDBHelperPool:TESDBHelperPool;

begin
  Result:=nil;

  AESDBHelperPool:=TESDBHelperPool(Self.Collection.Owner);


  try

      FDBHelper:=TESDBHelper.Create;//(AESDBHelperPool.FUnidacConnectionPool);

      FDBHelper.Connect(AESDBHelperPool.FDBConfig);





      Result:=FDBHelper;


  finally
  end;
end;


destructor TESDBHelperPoolObject.Destroy;
begin

  inherited;
end;

end.



