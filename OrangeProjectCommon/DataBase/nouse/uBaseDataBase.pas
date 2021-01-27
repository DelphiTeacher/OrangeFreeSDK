//convert pas to utf8 by ¥

unit uBaseDataBase;

interface

//{$I FrameWork.inc}

uses
//  {$IFDEF FMX}
  Data.DBXDataSnap,
  IPPeerClient,
  Data.DBXCommon,
  Data.DB,
  Data.SqlExpr,
  Datasnap.DBClient,
  Datasnap.DSConnect,
//  {$ENDIF}
  Classes,
  SysUtils,
  SyncObjs,
  uFuncCommon,
  uBaseList;


type
  TDataBaseType=(dbtUnknow,dbtSqlite);
  TQueryOperationType=(qotOpen,qotExec);

  //数据库基类
  TBaseDataBase=class//(TBinaryObject)
  protected
    DBType:TDataBaseType;
    //临界区
    FCriticalSection:TCriticalSection;
  protected
    function GetConnected: Boolean;virtual;abstract;
    procedure SetConnected(const Value: Boolean);virtual;abstract;
  public
    constructor Create;virtual;
    destructor Destroy;override;
  public
    //获取查询的数据集
    function QueryDataSet:TDataSet;virtual;abstract;
    //关闭查询
    function CloseQuery:Boolean;virtual;abstract;
    //查询
    function QuerySQL(SQLText:String;
                      ParamNames:Array of String;
                      ParamValues:Array of Variant;
                      Operation:TQueryOperationType):Boolean;virtual;abstract;
    //设置数据库类型
    function SetDataBaseType(DataBaseType:TDataBaseType):Boolean;virtual;abstract;
    //设置连接参数
    function SetConnection(ConnectionParams:TStringList):Boolean;virtual;abstract;
    //是否连接
    property Connected:Boolean read GetConnected write SetConnected;


  end;


implementation



{ TBaseDataBase }

constructor TBaseDataBase.Create;
begin
  FCriticalSection:=TCriticalSection.Create;
  DBType:=dbtUnknow;
end;

destructor TBaseDataBase.Destroy;
begin
  FreeAndNil(FCriticalSection);
  inherited;
end;







end.

