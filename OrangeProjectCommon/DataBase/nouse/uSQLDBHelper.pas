//ADO数据库操作类,用于连接MSSQL//
unit uSQLDBHelper;

interface

uses
  Windows,
  SysUtils,
  Classes,
//  uConfig,
  Forms,
  Data.DBXMSSQL,
  Data.DB, Data.SqlExpr, Data.FMTBcd
  ;


type
  TSQLOperation=(asoOpen,asoExec);

  TSQLDBHelper=class
  private
    FThreadID: String;
    FQuery: TSQLQuery;
    FProc: TSQLStoredProc;
    FLastConnectFail:Boolean;
    FLock: TRTLCriticalSection;
    FLastExceptMessage: String;
    FConnection: TSQLConnection;
    FIsUseMainConnection: Boolean;
  public
    procedure ReConnected;
    procedure ReCreateConnection;
    constructor Create;
    destructor Destroy;override;
  public
    procedure Close;
    procedure Lock;
    procedure UnLock;
    //数据库查询
    property Query:TSQLQuery read FQuery;
    //存储过程
    property Proc:TSQLStoredProc read FProc;
    //数据库连接
    property Connection:TSQLConnection read FConnection;
    //线程号
    property ThreadID:String read FThreadID write FThreadID;
    //上次异常字符串
    property LastExceptMessage:String read FLastExceptMessage;
    //查询
    function SelfQuery(AQueryString:String;
                      AParamNames:Array of String;
                      AParamValues:Array of Variant;
                      AOperation:TSQLOperation;
                      AParamsCompleted:Boolean=False):Boolean;
//    //存储过程
//    function SelfProc(AProcName:String;
//                      AProcParams:TParameters;
//                      AOperation:TSQLOperation;
//                      AParamsCompleted:Boolean;
//                      AProc:TSQLStoredProc=nil):Boolean;
  end;


function GetGlobalSQLDBHelper:TSQLDBHelper;
procedure FreeGlobalSQLDBHelper;

function GetMaxFID(ASQLDBHelper:TSQLDBHelper;
                      ATableName:String;
                      AFieldName:String;
                      ANeedLock:Boolean):Integer;

implementation

var
  SQLDBHelperList:TList;
  GlobalSQLDBHelper: TSQLDBHelper;


function GetMaxFID(ASQLDBHelper:TSQLDBHelper;
                      ATableName:String;
                      AFieldName:String;
                      ANeedLock:Boolean):Integer;
begin
  Result:=-1;
  if ANeedLock then ASQLDBHelper.Lock;
  try
    if ASQLDBHelper.SelfQuery('SELECT MAX(['+AFieldName+']) as MaxFID FROM ['+ATableName+']',
                                      [],
                                      [],
                                      asoOpen) then
    begin
      Result:=GetGlobalSQLDBHelper.Query.FieldByName('MaxFID').AsInteger+1;
    end;
  finally
    if ANeedLock then ASQLDBHelper.UnLock;
  end;
end;


procedure AllSQLDBHelperConnectFail;
var
  I:Integer;
begin
  for I := 0 to SQLDBHelperList.Count - 1 do
  begin
    TSQLDBHelper(SQLDBHelperList[I]).FLastConnectFail:=True;
  end;
end;


function GetGlobalSQLDBHelper:TSQLDBHelper;
begin
  if GlobalSQLDBHelper=nil then
  begin
    GlobalSQLDBHelper:=TSQLDBHelper.Create;
  end;
  Result:=GlobalSQLDBHelper;
end;

procedure FreeGlobalSQLDBHelper;
begin
  FreeAndNil(GlobalSQLDBHelper);
end;

{ TSQLDBHelper }

procedure TSQLDBHelper.Close;
begin
  Self.FProc.Close;
  Self.FQuery.Close;
end;

constructor TSQLDBHelper.Create;
begin
    FIsUseMainConnection:=False;
    FQuery:=TSQLQuery.Create(nil);
    FProc:=TSQLStoredProc.Create(nil);
    SQLDBHelperList.Add(Self);
    FLastConnectFail:=False;
    InitializeCriticalSection(FLock);
end;

destructor TSQLDBHelper.Destroy;
begin
  SQLDBHelperList.Remove(Self);
  FreeAndNil(FProc);
  FQuery.Close;
  FreeAndNil(FQuery);
  FreeAndNil(FConnection);
  DeleteCriticalSection(FLock);

  if Self=GlobalSQLDBHelper then
  begin
    GlobalSQLDBHelper:=nil;
  end;

  inherited;
end;

procedure TSQLDBHelper.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TSQLDBHelper.ReConnected;
begin
  if FConnection<>nil then
  begin
    Self.FConnection.Connected:=False;
    Self.FConnection.Connected:=True;
  end;
end;

procedure TSQLDBHelper.ReCreateConnection;
begin
  if FConnection<>nil then
  begin
    FConnection.Close;
    FConnection.Free;
  end;
  FConnection:=TSQLConnection.Create(nil);


  FConnection.DriverName := 'MSSQL';
  FConnection.ConnectionName := 'MSSQLConnection';
  FConnection.LoginPrompt := False;

  FConnection.Params.Clear;
//  FConnection.Params.Add(  'SchemaOverride=%.dbo'                                                     );
//  FConnection.Params.Add(  'DriverUnit=Data.DBXMSSQL'                                                 );
//
//  FConnection.Params.Add(    'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver230.' +
//      'bpl'                                                                                              );
//
//  FConnection.Params.Add(    'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
//      'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
//      'eyToken=91d62ebb5b0d1b1b'                                                                         );
//
//  FConnection.Params.Add(    'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
//      'iver230.bpl'                                                                                      );
//
//  FConnection.Params.Add(    'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
//      'ory,Borland.Data.DbxMSSQLDriver,Version=23.0.0.0,Culture=neutral' +
//      ',PublicKeyToken=91d62ebb5b0d1b1b'                                                                 );
//  FConnection.Params.Add(  'DriverName=MSSQL'                                                   );
  FConnection.Params.Add(  'GetDriverFunc=getSQLDriverMSSQL'                                          );
  FConnection.Params.Add(  'LibraryName=dbxmss.dll'                                                   );

  if FileExists(ExtractFilePath(Application.ExeName)+'sqlncli11.dll') then
  begin
    FConnection.Params.Add(  'VendorLib=sqlncli11.dll'                                                  );
    FConnection.Params.Add(  'VendorLibWin64=sqlncli11.dll'                                             );
  end
  else
  if FileExists(ExtractFilePath(Application.ExeName)+'sqlncli10.dll') then
  begin
    FConnection.Params.Add(  'VendorLib=sqlncli10.dll'                                                  );
    FConnection.Params.Add(  'VendorLibWin64=sqlncli10.dll'                                             );
  end;

//  FConnection.Params.Add(  'HostName=ORANGEPC\MSSQL'                                                   );
  FConnection.Params.Add(  'HostName='+GlobalConfig.GetDBHostName                                                   );
  FConnection.Params.Add(  'Database='+GlobalConfig.GetDBDataBaseName                                                        );
//  FConnection.Params.Add(  'MaxBlobSize=-1'                                                           );
//  FConnection.Params.Add(  'LocaleCode=0000'                                                          );
//  FConnection.Params.Add(  'IsolationLevel=ReadCommitted'                                             );
//  FConnection.Params.Add(  'OSAuthentication='+GlobalConfig.GetDBOSAuthentication                                              );
//  FConnection.Params.Add(  'PrepareSQL=True'                                                          );
  FConnection.Params.Add(  'User_Name='+GlobalConfig.GetDBUserName                                                             );
  FConnection.Params.Add(  'Password='+GlobalConfig.GetDBPassword                                                        );
//  FConnection.Params.Add(  'BlobSize=-1'                                                              );
//  FConnection.Params.Add(  'ErrorResourceFile='                                                       );
//  FConnection.Params.Add(  'OS Authentication='+GlobalConfig.GetDBOSAuthentication                                                     );
//  FConnection.Params.Add(  'Prepare SQL=False'                                                        );
  FConnection.Connected:=True;


//    FConnection.ConnectionString:=ConnectionString;
    FConnection.KeepConnection:=True;
    FConnection.LoginPrompt:=False;

end;

//function TSQLDBHelper.SelfProc(AProcName: String;
//                              AProcParams: TParameters;
//                              AOperation:TSQLOperation;
//                              AParamsCompleted:Boolean;
//                              AProc:TSQLStoredProc=nil): Boolean;
//var
//  I: Integer;
//  StartTime,EndTime:TDateTime;
//begin
//  Result:=False;
//  Try
//    if AProc=nil then
//    begin
//      AProc:=FProc;
//    end;
//
//    if (FConnection=nil) or FLastConnectFail then
//    begin
//      FLastConnectFail:=False;
//      ReCreateConnection;
//    end;
//
//    if Not Self.FConnection.Connected then
//    begin
//      ReConnected;
//    end;
//
//    if FConnection.Connected then
//    begin
//      StartTime:=Now;
//      Try
//        Try
//          AProc.Connection:=FConnection;
//          AProc.Close;
//          if Not AParamsCompleted then
//          begin
//            HandleException(nil, 'DB', 'uSQLDBHelper', 'SQL_QueryDataBase', '存储过程名称:'+AProcName,Self.FThreadID);
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
//            HandleException(E, 'DB', 'uSQLDBHelper', 'SelfProc', AProc.ProcedureName);
//            if (Pos('连接失败',E.Message)>0)
//            or (Pos('对象打开时，不允许操作。',E.Message)>0)
//            or (Pos('一般性网络错误。请检查网络文档。',E.Message)>0) then
//            begin
//              AllSQLDBHelperConnectFail;
//            end;
//          end;
//        end;
//      Finally
//        EndTime:=Now;
//        HandleException(nil, 'DB', 'uSQLDBHelper', 'SelfProc', '执行存储过程('+AProc.ProcedureName+')'+'结束,用时(毫秒):'+IntToStr(DateUtils.MilliSecondsBetween(StartTime,EndTime)));
//      End;
//    end
//    else
//    begin
//      HandleException(nil, 'DB', 'uSQLDBHelper', 'SelfProc', '未连接');
//    end;
//
//  except
//    on E: Exception do
//    begin
//      HandleException(E, 'DB', 'uSQLDBHelper', 'SelfProc', '');
//    end;
//  end;
//end;

function TSQLDBHelper.SelfQuery(AQueryString: String;
                                AParamNames: array of String; AParamValues: array of Variant;
                                AOperation: TSQLOperation;
                                AParamsCompleted:Boolean): Boolean;
var
  I: Integer;
  StartTime,EndTime:TDateTime;
begin
  Result:=False;








  StartTime:=Now;
  Try
      if Not AParamsCompleted or AParamsCompleted and (Length(AParamNames) = Length(AParamValues)) then
      begin

        try

          if (FConnection=nil) or FLastConnectFail then
          begin
            FLastConnectFail:=False;
            ReCreateConnection;
          end;

          if Not Self.FConnection.Connected then
          begin
            ReConnected;
          end;

          if Self.FConnection.Connected then
          begin
//            HandleException(nil, 'DB', 'uSQLDBHelper', 'SQL_QueryDataBase', 'SQL语句:'+AQueryString,Self.FThreadID);

            Self.FQuery.Close;
            Self.FQuery.SQL.Clear;
            Self.FQuery.SQLConnection:=Self.FConnection;
            Self.FQuery.SQL.Text:=AQueryString;
            if Not AParamsCompleted then
            begin
              for I:=Length(AParamNames)-1 downto 0 do
              begin
                Self.FQuery.Params.ParamByName(AParamNames[I]).Value:=AParamValues[I];
              end;
            end;
            case AOperation of
              asoOpen: Self.FQuery.Open;
              asoExec: Self.FQuery.ExecSql;
            end;
            Result:=True;
          end
          else
          begin
//            HandleException(nil, 'DB', 'uSQLDBHelper', 'SelfQuery', '未连接',Self.FThreadID);
          end;
        except
          on E: Exception do
          begin
            Result:=False;
            FLastExceptMessage:=E.Message;
//            HandleException(E, 'DB', 'uSQLDBHelper', 'SelfQuery', '',Self.FThreadID);
//            if (Pos('连接失败',E.Message)>0)
//            or (Pos('对象打开时，不允许操作。',E.Message)>0)
//            or (Pos('一般性网络错误。请检查网络文档。',E.Message)>0) then
//            begin
//              AllSQLDBHelperConnectFail;
//            end;
          end;
        end;

      end
      else
      begin
//        HandleException(nil, 'DB', 'uSQLDBHelper', 'SelfQuery', '参数与参数值个数不相等',Self.FThreadID);
      end;

  Finally
    EndTime:=Now;
//    HandleException(nil, 'DB', 'uSQLDBHelper', 'SQL_QueryDataBase', 'Query End,用时(毫秒):'+IntToStr(DateUtils.MilliSecondsBetween(StartTime,EndTime)),Self.FThreadID);
  End;

end;

procedure TSQLDBHelper.UnLock;
begin
  LeaveCriticalSection(FLock);
end;



Initialization
  SQLDBHelperList:=TList.Create;

finalization
  FreeGlobalSQLDBHelper;
  FreeAndNil(SQLDBHelperList);

end.


