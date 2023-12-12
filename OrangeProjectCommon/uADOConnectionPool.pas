//ADO数据库操作类的线程池,用于连接MSSQL//
unit uADOConnectionPool;

interface

uses
//  Windows,
  SysUtils,
  Classes,
//  Forms,
//  IniFiles,
//  DB,ADODB,
//  SyncObjs,
  DB,ADODB,
  uDatabaseConfig,
  uObjectPool;


type
  TADOConnectionPoolObject = class(TPoolObject)
  private
    FADOConnection:TADOConnection;
  protected
    function CreateCustomObject: TObject; override;
  public
    property ADOConnection:TADOConnection read FADOConnection;
  end;



  TADOConnectionPool=class(TObjectPool)
  protected
    function GetPoolItemClass: TPoolObjectClass; override;
  public
    FDBConfig:TDatabaseConfig;
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
  end;




function GetGlobalSQLDBHelperPool:TADOConnectionPool;
procedure FreeGlobalADOConnectionPool;



implementation



var
  GlobalADOConnectionPool: TADOConnectionPool;

function GetGlobalSQLDBHelperPool:TADOConnectionPool;
begin
  if GlobalADOConnectionPool=nil then
  begin
    GlobalADOConnectionPool:=TADOConnectionPool.Create(nil);
  end;
  Result:=GlobalADOConnectionPool;
end;

procedure FreeGlobalADOConnectionPool;
begin
  FreeAndNil(GlobalADOConnectionPool);
end;









{ TADOConnectionPool }

constructor TADOConnectionPool.Create(aOwner: TComponent);
begin
  inherited;
  FDBConfig:=TDatabaseConfig.Create();

end;

destructor TADOConnectionPool.Destroy;
begin
  FreeAndNil(FDBConfig);
  inherited;
end;

function TADOConnectionPool.GetPoolItemClass: TPoolObjectClass;
begin
  Result:=TADOConnectionPoolObject;
end;

{ TADOConnectionPoolObject }

function TADOConnectionPoolObject.CreateCustomObject: TObject;
var
  ADBConfig:TDatabaseConfig;
begin
  ADBConfig:=TADOConnectionPool(Self.Collection.Owner).FDBConfig;
  //Provider=SQLOLEDB.1;Password=138575wangneng;Persist Security Info=True;User ID=sa;Initial Catalog=ZJK;Data Source=.
  FADOConnection:=TADOConnection.Create(nil);
    FADOConnection.Provider:='SQLOLEDB.1';//ADOConfig.ProviderName;
    FADOConnection.Properties['Data Source'].Value:=ADBConfig.FDBHostName;
    FADOConnection.Properties['User ID'].Value:=ADBConfig.FDBUserName;
    FADOConnection.Properties['Password'].Value:=ADBConfig.FDBPassWord;
    FADOConnection.Properties['Initial Catalog'].Value:=ADBConfig.FDBDataBaseName;
  Result:=FADOConnection;
end;


end.


