//ADO数据库操作类,用于连接MSSQL//
unit uADODBHelper;

interface

uses
//  Windows,
  SysUtils,
  Classes,
//  Forms,
//  IniFiles,
  DB,ADODB,
//  SyncObjs,
//  ActiveX,
  uFuncCommon,

  uBaseLog,
  uDataBaseConfig,
  uBaseDBHelper,

//  DateUtils,
  Variants;




type
  TADODBHelper=class(TBaseDBHelper)
  private
    procedure SetConnection(const Value: TADOConnection);
  protected
//    FThreadID: String;
    FQuery: TADOQuery;
//    FProc: TADOStoredProc;
//    FLastConnectFail:Boolean;
//    FLock: TRTLCriticalSection;
//    FLastExceptMessage: String;
    FConnection: TADOConnection;
//    procedure CreateProc;
//    procedure CreateQuery;
//    function GetProc: TADOStoredProc;
//    function GetQuery: TADOQuery;
  public
//    procedure ReConnected;
    procedure ReCreateConnection;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    procedure Close;override;

    function GetConnectionFromPool:TObject;override;
    procedure UnlockConnectionToPool;override;

    //连接数据库
    function Connect(ADataBaseConfig:TDataBaseConfig):Boolean;override;
    function Disconnect:Boolean;override;

    //数据库查询
    function Query:TDataset;override;
    function NewTempQuery:TDataset;override;
//    //数据库查询
//    property Query:TADOQuery read GetQuery;
//    //存储过程
//    property Proc:TADOStoredProc read GetProc;
    //数据库连接
    property Connection:TADOConnection read FConnection write SetConnection;

//    //线程号
//    property ThreadID:String read FThreadID write FThreadID;
//    //上次异常字符串
//    property LastExceptMessage:String read FLastExceptMessage write FLastExceptMessage;


    //查询
    function SelfQuery(AQueryString:String;
                      AParamNames:TStringDynArray;
                      AParamValues:TVariantDynArray;
                      AOperation:TSQLOperation;
                      AParamsCompleted:Boolean=False;
                      ACustomQueryDataSet:TDataSet=nil):Boolean;override;
//    //存储过程
//    function SelfProc(AProcName:String;
//                      AProcParams:TParameters;
//                      AOperation:TSQLOperation;
//                      AParamsCompleted:Boolean;
//                      AProc:TADOStoredProc=nil):Boolean;
    public
      class var ConnectionString:String;
  end;

//  TADODBHelperPoolObject = class(TPoolObject)
//  private
//    FADODBHelper:TADODBHelper;
//  protected
//    function CreateCustomObject: TObject; override;
//  public
//    property ADODBHelper:TADODBHelper read FADODBHelper;
//  end;
//
//  TADODBHelperPool=class(TObjectPool)
//  protected
//    function GetPoolItemClass: TPoolObjectClass; override;
//  end;
//



function GetGlobalSQLDBHelper:TADODBHelper;
procedure FreeGlobalSQLDBHelper;





function GetMaxFID(ASQLDBHelper:TADODBHelper;
                      ATableName:String;
                      AFieldName:String;
                      ANeedLock:Boolean):Integer;


implementation



var
  ADODBHelperList:TList;
  GlobalADODBHelper: TADODBHelper;

function GetMaxFID(ASQLDBHelper:TADODBHelper;
                      ATableName:String;
                      AFieldName:String;
                      ANeedLock:Boolean):Integer;
begin
  Result:=-1;
  if ANeedLock then ASQLDBHelper.Lock;
  try


    if ASQLDBHelper.SelfQuery('SELECT * FROM tblMaxFID WHERE TableName=:TableName',
                                      ['TableName'],
                                      [ATableName],
                                      asoOpen) then
    begin
      if not ASQLDBHelper.Query.Eof then
      begin
        //tblMaxFID中存在

        Result:=ASQLDBHelper.Query.FieldByName('MaxFID').AsInteger+1;
        //修改
        ASQLDBHelper.SelfQuery('UPDATE tblMaxFID SET MaxFID=:MaxFID WHERE TableName=:TableName',
                                      ['TableName','MaxFID'],
                                      [ATableName,Result],
                                      asoExec);
      end
      else
      begin
        //tblMaxFID中不存在

        //添加
        if ASQLDBHelper.SelfQuery('SELECT MAX(['+AFieldName+']) as MaxFID FROM ['+ATableName+']',
                                          [],
                                          [],
                                          asoOpen) then
        begin
          Result:=ASQLDBHelper.Query.FieldByName('MaxFID').AsInteger+1;

          ASQLDBHelper.SelfQuery('INSERT INTO tblMaxFID(TableName,MaxFID) VALUES(:TableName,:MaxFID)',
                                        ['TableName','MaxFID'],
                                        [ATableName,Result],
                                        asoExec);
        end;

      end;
    end;

  finally
    if ANeedLock then ASQLDBHelper.UnLock;
  end;
end;


//procedure AllADODBHelperConnectFail;
//var
//  I:Integer;
//begin
//  for I := 0 to ADODBHelperList.Count - 1 do
//  begin
//    TADODBHelper(ADODBHelperList[I]).FLastConnectFail:=True;
//  end;
//end;

function GetGlobalSQLDBHelper:TADODBHelper;
begin
  if GlobalADODBHelper=nil then
  begin
    GlobalADODBHelper:=TADODBHelper.Create;
  end;
  Result:=GlobalADODBHelper;
end;

procedure FreeGlobalSQLDBHelper;
begin
  FreeAndNil(GlobalADODBHelper);
end;


{ TADODBHelper }

procedure TADODBHelper.Close;
begin
  inherited;
//  if FProc<>nil then
//  begin
//    Self.FProc.Close;
//  end;
//  if FQuery<>nil then
//  begin
//    Self.FQuery.Close;
//  end;
end;

function TADODBHelper.Connect(ADataBaseConfig: TDataBaseConfig): Boolean;
begin
  Result:=False;

  try

    Self.DBType:=ADataBaseConfig.FDBType;

    //连接SQL
    TADODBHelper.ConnectionString:=
        'Provider=SQLOLEDB.1;'
        +'Persist Security Info=True;'
        +'Password='+ADataBaseConfig.FDBPassword+';'
        +'User ID='+ADataBaseConfig.FDBUserName+';'
        +'Initial Catalog='+ADataBaseConfig.FDBDataBaseName+';'
        +'Data Source='+ADataBaseConfig.FDBHostName;

    Self.ReCreateConnection;
    Self.Connection.Connected:=True;

    Result:=True;
  except
    on E:Exception do
    begin
      uBaseLog.HandleException(E,'TADODBHelper.Connect');
    end;
  end;

end;

constructor TADODBHelper.Create;
begin
  Inherited;

  ReCreateConnection;


  //在EXE模式下
  FQuery:=TADOQuery.Create(nil);
  FQuery.Connection:=Self.FConnection;
  FQuery.CommandTimeout:=600*2;


//  FProc:=TADOStoredProc.Create(nil);


  ADODBHelperList.Add(Self);
//  FLastConnectFail:=False;
//  InitializeCriticalSection(FLock);
end;

//procedure TADODBHelper.CreateProc;
//var
//  OldProc:TADOStoredProc;
//begin
//  OldProc:=FProc;
//
//  FProc:=TADOStoredProc.Create(nil);//(Application);
//
//
//  //恢复
//  if OldProc<>nil then
//  begin
//    FProc.ProcedureName:=OldProc.ProcedureName;
//    FProc.Parameters.Assign(OldProc.Parameters);
//  end;
//  FreeAndNil(OldProc);
//
//
//  FProc.Connection:=Self.FConnection;
//  FProc.CommandTimeout:=600*2;
//end;

//procedure TADODBHelper.CreateQuery;
//begin
//  FreeAndNil(FQuery);
//
//  FQuery:=TADOQuery.Create(nil);//(Application);
//
//  FQuery.Connection:=Self.FConnection;
//  FQuery.CommandTimeout:=600*2;
//end;

destructor TADODBHelper.Destroy;
begin
  ADODBHelperList.Remove(Self);

//  if FProc<>nil then
//  begin
//    FProc.Close;
//    FProc.Connection:=nil;
//    FreeAndNil(FProc);
//  end;

  if FQuery<>nil then
  begin
    FQuery.Close;
    FQuery.Connection:=nil;
    FreeAndNil(FQuery);
  end;

  if FConnection<>nil then
  begin
    FConnection.Close;
  end;
  FreeAndNil(FConnection);



//  DeleteCriticalSection(FLock);
  if Self=GlobalADODBHelper then
  begin
    GlobalADODBHelper:=nil;
  end;
  inherited;
end;

function TADODBHelper.Disconnect: Boolean;
begin
  Result:=False;
  if FConnection<>nil then
  begin
    FConnection.Connected:=False;
  end;
  Result:=True;
end;

function TADODBHelper.GetConnectionFromPool: TObject;
begin
  Result:=FConnection;
end;

function TADODBHelper.NewTempQuery: TDataset;
begin
  Result:=TADOQuery.Create(nil);
  TADOQuery(Result).Connection:=FConnection;
end;

function TADODBHelper.Query: TDataset;
begin
  Result:=FQuery;
end;

//function TADODBHelper.GetProc: TADOStoredProc;
//begin
//  if FProc=nil then
//  begin
//    CreateProc;
//  end;
//  Result:=FProc;
//end;
//
//function TADODBHelper.GetQuery: TADOQuery;
//begin
//  if FQuery=nil then
//  begin
//    CreateQuery;
//  end;
//  Result:=FQuery;
//end;

//procedure TADODBHelper.Lock;
//begin
//  EnterCriticalSection(FLock);
//end;

//procedure TADODBHelper.ReConnected;
//begin
//  if FConnection<>nil then
//  begin
//    Self.FConnection.Connected:=False;
//    FConnection.ConnectionString:=ConnectionString;
//    Self.FConnection.Connected:=True;
//  end;
//end;

procedure TADODBHelper.ReCreateConnection;
begin

  if FConnection<>nil then
  begin
    FConnection.Close;
    FConnection.Free;
  end;


  FConnection:=TADOConnection.Create(nil);
  FConnection.ConnectionString:=ConnectionString;
  FConnection.KeepConnection:=True;
  FConnection.LoginPrompt:=False;
  FConnection.ConnectionTimeout:=600*2;
  FConnection.CommandTimeout:=600*2;


  if FQuery<>nil then
  begin
    FQuery.Connection:=Self.FConnection;
    FQuery.CommandTimeout:=600*2;
  end;

//  FProc.Connection:=Self.FConnection;
//  FProc.CommandTimeout:=600*2;

end;

//function TADODBHelper.SelfProc(AProcName: String;
//                              AProcParams: TParameters;
//                              AOperation:TSQLOperation;
//                              AParamsCompleted:Boolean;
//                              AProc:TADOStoredProc=nil): Boolean;
//var
//  I: Integer;
////  StartTime,EndTime:TDateTime;
//begin
//  Result:=False;
//
//    if (FConnection=nil) or FLastConnectFail then
//    begin
//      if ConnectionString<>'' then
//      begin
//        FLastConnectFail:=False;
//        ReCreateConnection;
//      end;
//    end;
//
//    if (FConnection<>nil) and Not Self.FConnection.Connected then
//    begin
//      ReConnected;
//    end;
//
//    if (FConnection<>nil) and FConnection.Connected then
//    begin
////      StartTime:=Now;
////      Try
//        Try
//
//          if AProc=nil then
//          begin
//            AProc:=FProc;
//          end;
//
//
//          AProc.Connection:=FConnection;
//          AProc.Close;
//          if Not AParamsCompleted then
//          begin
//
//            AProc.ProcedureName:=AProcName;
//            AProc.Parameters.Clear;
//            for I:=0 to AProcParams.Count - 1 do
//            begin
//              AProc.Parameters.CreateParameter(AProcParams[I].Name,
//                                                AProcParams[I].DataType,
//                                                AProcParams[I].Direction,
//                                                AProcParams[I].Size,
//                                                AProcParams[I].Value);
//            end;
//          end;
//          case AOperation of
//            asoOpen:
//            begin
//              AProc.Open;
//            end;
//            asoExec:
//            begin
//              AProc.ExecProc;
//            end;
//          end;
//
//          Result:=True;
//        except
//          on E: Exception do
//          begin
//            Self.FLastExceptMessage:=E.Message;
//            if (Pos('连接失败',E.Message)>0)
//            or (Pos('对象打开时，不允许操作。',E.Message)>0)
//            or (Pos('一般性网络错误。请检查网络文档。',E.Message)>0) then
//            begin
//              AllADODBHelperConnectFail;
//            end;
//          end;
//        end;
////      Finally
////        EndTime:=Now;
////      End;
//    end;
//
//end;

function TADODBHelper.SelfQuery(AQueryString: String;
                                AParamNames: TStringDynArray;
                                AParamValues: TVariantDynArray;
                                AOperation: TSQLOperation;
                                AParamsCompleted:Boolean;
                                ACustomQueryDataSet:TDataSet): Boolean;
var
  I: Integer;
  AQuery:TADOQuery;
//  StartTime,EndTime:TDateTime;
//  sParams : String;
begin
  Result:=False;

  if Length(AParamNames)<>Length(AParamValues) then
  begin
    FLastExceptMessage:='参数与值的个数不匹配 '+AQueryString;
    uBaseLog.HandleException(nil,'TUniDBHelper.SelfQuery '+FLastExceptMessage+' '+AQueryString);
    Exit;
  end;



//  sParams := '';
//  StartTime:=Now;
  if ACustomQueryDataSet=nil then
  begin
    AQuery:=TADOQuery(FQuery);
  end
  else
  begin
    AQuery:=TADOQuery(ACustomQueryDataSet);
  end;

  try

  //    if (FConnection=nil) or FLastConnectFail then
  //    begin
  //      if ConnectionString<>'' then
  //      begin
  //        FLastConnectFail:=False;
  //        ReCreateConnection;
  //      end;
  //    end;

      if (FConnection<>nil) and Not Self.FConnection.Connected then
      begin
        Self.FConnection.Connected:=False;
        FConnection.ConnectionString:=ConnectionString;
        Self.FConnection.Connected:=True;
  //      ReConnected;
      end;

      if (FConnection<>nil) and Self.FConnection.Connected then
      begin
          //HandleException(nil, 'DB', 'uADODBHelper', 'ADO_QueryDataBase', 'SQL语句:'+AQueryString,Self.FThreadID);
    //      DoLog(nil,AQueryString);

          AQuery.Close;
          AQuery.SQL.Clear;
          AQuery.Connection:=Self.FConnection;
          AQuery.SQL.Text:=AQueryString;
          if Not AParamsCompleted then
          begin
            for I:=Length(AParamNames)-1 downto 0 do
            begin
              if AParamNames[I]<>'' then
              begin
                AQuery.Parameters.ParamByName(AParamNames[I]).Value:=AParamValues[I];
              end;
            end;
          end;
          case AOperation of
            asoOpen: AQuery.Open;
            asoExec: AQuery.ExecSql;
          end;
          Result:=True;
      end
      else
      begin
          FLastExceptMessage:='数据库未连接';
          uBaseLog.HandleException(nil,'TADODBHelper.SelfQuery 数据库未连接');
  //        DoLog(nil,'数据库未连接');
      end;
  except
    on E: Exception do
    begin
      Result:=False;
      FLastExceptMessage:=E.Message;
//      DoLog(E,'SelfQuery');
      uBaseLog.HandleException(E,'TADODBHelper.SelfQuery');
//      if (Pos('连接失败',E.Message)>0)
//      or (Pos('对象打开时，不允许操作。',E.Message)>0)
//      or (Pos('一般性网络错误。请检查网络文档。',E.Message)>0) then
//      begin
//        AllADODBHelperConnectFail;
//      end;
    end;
  end;

end;

procedure TADODBHelper.SetConnection(const Value: TADOConnection);
begin
  FConnection := Value;
end;

procedure TADODBHelper.UnlockConnectionToPool;
begin
end;

//procedure TADODBHelper.UnLock;
//begin
//  LeaveCriticalSection(FLock);
//end;


Initialization
  ADODBHelperList:=TList.Create;




finalization
  FreeGlobalSQLDBHelper;
  FreeAndNil(ADODBHelperList);

end.


