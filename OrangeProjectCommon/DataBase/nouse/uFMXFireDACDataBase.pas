//convert pas to utf8 by ¥

unit uFMXFireDACDataBase;

interface
//{$I FrameWork.inc}

uses
//  {$IFDEF FMX}
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.FMXUI.Wait,
  FireDAC.Comp.UI,
//  {$ENDIF}
  Classes,
  uBaseLog,
  SysUtils,
  uFuncCommon,
  uBaseDataBase;


type
  TFMXFireDACDataBase=class(TBaseDataBase)
  public
    WaitCursor: TObject;
    //驱动链接
    DriverLink: TObject;
    //连接
    Connection: TFDConnection;
    //查询
    Query: TFDQuery;
  protected
    function GetConnected: Boolean;override;
    procedure SetConnected(const Value: Boolean);override;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    //获取查询的数据集
    function QueryDataSet:TDataSet;override;
    //关闭查询
    function CloseQuery:Boolean;override;
    //查询
    function QuerySQL(SQLText:String;
                      ParamNames:Array of String;
                      ParamValues:Array of Variant;
                      Operation:TQueryOperationType):Boolean;override;
    //设置数据库类型
    function SetDataBaseType(DataBaseType:TDataBaseType):Boolean;override;
    //设置连接参数
    function SetConnection(ConnectionParams:TStringList):Boolean;override;
  end;



implementation



{ TFMXSQLiteDataBase }

function TFMXFireDACDataBase.CloseQuery: Boolean;
begin
  Result:=False;
  Query.Close;
  Result:=True;
end;

constructor TFMXFireDACDataBase.Create;
begin
  inherited;

  Connection:= TFDConnection.Create(nil);
  Connection.LoginPrompt:=False;
  Connection.DriverName:='SQLite';
//  Connection.ConnectionName:='SQLite';

  Query:= TFDQuery.Create(nil);
  Query.Connection:=Connection;

end;

destructor TFMXFireDACDataBase.Destroy;
begin
  FreeAndNil(Query);
  FreeAndNil(Connection);
  FreeAndNil(DriverLink);
  FreeAndNil(WaitCursor);
  inherited;
end;

function TFMXFireDACDataBase.GetConnected: Boolean;
begin
  Result:=Self.Connection.Connected;
end;

function TFMXFireDACDataBase.QueryDataSet: TDataSet;
begin
  Result:=Self.Query;
end;

function TFMXFireDACDataBase.QuerySQL(SQLText: String;
                                      ParamNames:Array of String;
                                      ParamValues:Array of Variant;
                                      Operation: TQueryOperationType): Boolean;
var
  I:Integer;
begin
  Result:=False;

  FCriticalSection.Enter;
  try
      try
        if Not Connected then
        begin
          Connected:=True;
        end;

        Query.Close;
        Query.SQL.Text:=SQLText;
        for I:=Length(ParamNames)-1 downto 0 do
        begin
          Self.Query.Params.ParamByName(ParamNames[I]).Value:=ParamValues[I];
        end;
        case Operation of
          qotOpen: Query.Open();
          qotExec: Query.ExecSQL();
        end;
      except
        on E:Exception do
        begin
          uBaseLog.HandleException(E,'Main','uFMXFireDACDataBase','TFMXFireDACDataBase.QuerySQL');
        end;
      end;
  finally
    FCriticalSection.Leave;
  end;
  Result:=True;
end;

procedure TFMXFireDACDataBase.SetConnected(const Value: Boolean);
begin
  Self.Connection.Connected:=Value;
end;

function TFMXFireDACDataBase.SetConnection(ConnectionParams: TStringList): Boolean;
begin
  Self.Connection.Params.Assign(ConnectionParams);
end;

function TFMXFireDACDataBase.SetDataBaseType(DataBaseType: TDataBaseType): Boolean;
begin
  if DBType<>DataBaseType then
  begin
    DBType:=DataBaseType;
    FreeAndNil(DriverLink);
    case DBType of
      dbtUnknow: ;
      dbtSqlite:
      begin
        DriverLink:=TFDPhysSQLiteDriverLink.Create(nil);
        WaitCursor:=TFDGUIxWaitCursor.Create(nil);
      end;
    end;
  end;

end;

end.

