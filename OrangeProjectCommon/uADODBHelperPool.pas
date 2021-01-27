//ADO数据库操作类的线程池,用于连接MSSQL//
unit uADODBHelperPool;

interface

uses
//  Windows,
  SysUtils,
//  Classes,
//  Forms,
//  IniFiles,
//  DB,ADODB,
//  SyncObjs,
  uADODBHelper,
  uObjectPool;


type
  TADODBHelperPoolObject = class(TPoolObject)
  private
    FADODBHelper:TADODBHelper;
  protected
    function CreateCustomObject: TObject; override;
  public
    destructor Destroy; override;
    property ADODBHelper:TADODBHelper read FADODBHelper;
  end;



  TADODBHelperPool=class(TObjectPool)
  protected
    function GetPoolItemClass: TPoolObjectClass; override;
  end;




function GetGlobalSQLDBHelperPool:TADODBHelperPool;
procedure FreeGlobalADODBHelperPool;



implementation



var
  GlobalADODBHelperPool: TADODBHelperPool;

function GetGlobalSQLDBHelperPool:TADODBHelperPool;
begin
  if GlobalADODBHelperPool=nil then
  begin
    GlobalADODBHelperPool:=TADODBHelperPool.Create(nil);
  end;
  Result:=GlobalADODBHelperPool;
end;

procedure FreeGlobalADODBHelperPool;
begin
  FreeAndNil(GlobalADODBHelperPool);
end;









{ TADODBHelperPool }

function TADODBHelperPool.GetPoolItemClass: TPoolObjectClass;
begin
  Result:=TADODBHelperPoolObject;
end;

{ TADODBHelperPoolObject }

function TADODBHelperPoolObject.CreateCustomObject: TObject;
begin
  FADODBHelper:=TADODBHelper.Create;
  Result:=FADODBHelper;
end;


destructor TADODBHelperPoolObject.Destroy;
begin
  FreeAndNil(FADODBHelper);
  inherited;
end;

end.


