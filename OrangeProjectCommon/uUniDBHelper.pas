
//convert pas to utf8 by ¥
//UniDac数据库操作类,用于连接MSSQL//
unit uUniDBHelper;

interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
//才可以正常编译此单元
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}




uses
//  Windows,
  SysUtils,
  Classes,
//  Forms,
  IniFiles,
  DB,
//  ADODB,
  SyncObjs,
//  ActiveX,
  uBaseLog,
  uFuncCommon,

  StrUtils,
  uBaseDBHelper,
  uDataBaseConfig,


  {$IFNDEF NOT_USE_kbmMWUNIDACConnectionPool}
  kbmMWCustomConnectionPool,
  kbmMWCustomDataset,
  kbmMWUniDAC,
  {$ENDIF}


  uni,

  {$IFDEF MSWINDOWS}
  ActiveX,
  {$ENDIF}

  DateUtils,
  Variants//,
//  Messages
  ;



  //不使用kbmMWUNIDACConnectionPool
//  {$DEFINE NOT_USE_kbmMWUNIDACConnectionPool}


type
  TUniDBHelper=class(TBaseDBHelper)
  protected
    FQuery: TuniQuery;
    //连接池会赋给将连接赋给他
    FConnection: TUniConnection;
  public
    constructor Create;overload;override;
    destructor Destroy;override;
  public
    {$IFDEF NOT_USE_kbmMWUNIDACConnectionPool}
    {$ELSE}
    //可以设置
    FUnidacConnectionPool:TkbmMWUNIDACConnectionPool;
    //要么使用连接池
    FUnidacConnection:TkbmMWunidacConnection;
    constructor Create(AUnidacConnectionPool:TkbmMWUNIDACConnectionPool);overload;
    //为了兼容老代码而已,功能和GetConnectionFromPool一样
    function GetUnidacConnectionFromPool:TkbmMWunidacConnection;
    {$ENDIF}

  public
    procedure Close;override;

    procedure StartTransaction;override;
    procedure CommitTransaction;override;
    procedure RollBackTransaction;override;


    function GetConnectionFromPool:TObject;override;
    procedure UnlockConnectionToPool;override;

    procedure SetConnection(const Value: TUniConnection);


    function Connect(ADataBaseConfig:TDataBaseConfig):Boolean;override;
    function Disconnect:Boolean;override;


    //检测数据库是否OK(MySql8小时断开一次连接)
    function CheckDBOK:Boolean;

    //数据库查询
    function Query:TDataset;override;
    function NewTempQuery:TDataset;override;
    //数据库连接
    property Connection:TUniConnection read FConnection write SetConnection;
    //查询
    function SelfQuery(AQueryString:String;
                        AParamNames:TStringDynArray;
                        AParamValues:TVariantDynArray;
                        AOperation:TSQLOperation;
                        AParamsCompleted:Boolean=False;
                        ACustomQueryDataSet:TDataSet=nil):Boolean;override;
  end;







implementation





{ TUniDBHelper }

function TUniDBHelper.Connect(ADataBaseConfig: TDataBaseConfig): Boolean;
var
  AUniConnection:TUniConnection;
begin
    //直连SQLServer时不再需要CoUnInitialize
//  if SameText(ADataBaseConfig.FDBType,'MSSQL') or SameText(ADataBaseConfig.FDBType,'MSSQL2000') then
//  begin
//    {$IFDEF MSWINDOWS}
//    CoInitialize(nil);
//    {$ENDIF}
//  end;
  try
      Result:=False;

      AUniConnection:=nil;
      {$IFNDEF NOT_USE_kbmMWUNIDACConnectionPool}
      //用连接池的原始数据库
      if (FUnidacConnectionPool<>nil) and (FUnidacConnectionPool.Database<>nil) then
      begin
        AUniConnection:=FUnidacConnectionPool.Database;
      end
      else if (FConnection<>nil) then
      begin
        AUniConnection:=FConnection;
      end;
      {$ELSE}
      if (FConnection<>nil) then
      begin
        AUniConnection:=FConnection;
      end;
      {$ENDIF}





      if AUniConnection<>nil then
      begin
          AUniConnection.Connected:=False;

          Self.DBType:=ADataBaseConfig.FDBType;

          if SameText(ADataBaseConfig.FDBType,'MSSQL') or SameText(ADataBaseConfig.FDBType,'MSSQL2000') then
          begin
            //微软的SQL SERVER
            AUniConnection.ProviderName:='SQL Server';
      //      //用直连模式可以不需要调用CoInitializeEx,但是有些东西会报错
      //      FUnidacConnectionPool.Database.SpecificOptions.Add('SQL Server.Provider=prDirect');
      //
      //      SpecificOptions.Strings = (
      //        'MySQL.UseUnicode=True'
      //        'SQL Server.Provider=prDirect')

//            AUniConnection.SpecificOptions.Va

              //    SpecificOptions.Strings = (
              //      'MySQL.Charset=utf8mb4'
              //      'MySQL.UseUnicode=True'
              //      'SQL Server.Provider=prDirect')


              //在windows的service模式下设置直连会报错
//              {$IFDEF IS_WINDOWS_SERVICE}
//              AUniConnection.SpecificOptions.Values['Provider']:='prDirect';
//              {$ELSE}
              AUniConnection.SpecificOptions.Values['Provider']:=ADataBaseConfig.FSpecificOptions_Provider;//'prDirect';
//              {$ENDIF}
              AUniConnection.SpecificOptions.Values['NativeClientVersion']:=ADataBaseConfig.FSpecificOptions_NativeClientVersion;//'prDirect';


          end
          else if SameText(ADataBaseConfig.FDBType,'SQLite') then
          begin

            AUniConnection.ProviderName:='SQLite';
            AUniConnection.SpecificOptions.Values['UseUnicode']:='True';
            if not FileExists(ADataBaseConfig.FDBDataBaseName) then
            begin
              AUniConnection.SpecificOptions.Values['ForceCreateDatabase']:='True';
            end;
//            AUniConnection.SpecificOptions.Values['EnableSharedCache']:='True';

            {$IFDEF MSWINDOWS}
            {$IFDEF CPUX64}
            AUniConnection.SpecificOptions.Values['Direct']:='True';//查询诊断的时候会卡
            {$ENDIF}
            {$ENDIF}
          end
          else if (ADataBaseConfig.FDBType='') or SameText(ADataBaseConfig.FDBType,'MYSQL') then
          begin
            //默认是MYSQL
            AUniConnection.ProviderName:='MySQL';
            AUniConnection.SpecificOptions.Values['Charset']:=ADataBaseConfig.FDBCharset;//GlobalDataBaseCharset;'utf8mb4';//
            AUniConnection.SpecificOptions.Values['UseUnicode']:='True';
          end;


          try
              uBaseLog.HandleException(nil,'TUniDBHelper.Connect '
                                            +'ProviderName='+AUniConnection.ProviderName+' '
                                            +'Server='+ADataBaseConfig.FDBHostName+' '
                                            +'Port='+ADataBaseConfig.FDBHostPort+' '
                                            +'Username='+ADataBaseConfig.FDBUserName+' '
                                            +'Password='+ADataBaseConfig.FDBPassword+' '
                                            +'Database='+ADataBaseConfig.FDBDataBaseName+' '
                                            );

              //连接数据库,MYSQL
              AUniConnection.Server:=ADataBaseConfig.FDBHostName;
              AUniConnection.Port:=StrToInt(ADataBaseConfig.FDBHostPort);
              AUniConnection.Username:=ADataBaseConfig.FDBUserName;
              AUniConnection.Password:=ADataBaseConfig.FDBPassword;
              AUniConnection.Database:=ADataBaseConfig.FDBDataBaseName;


              uBaseLog.HandleException(nil,'TUniDBHelper.Connect Set Connected:=True Begin '+AUniConnection.ConnectString);
              AUniConnection.Connected:=True;
              uBaseLog.HandleException(nil,'TUniDBHelper.Connect Set Connected:=True End');

              Result:=True;
          except
            on E:Exception do
            begin
//              ShowException('数据库连接错误，请确认正确参数配置并重启服务端');
              uBaseLog.HandleException(nil,'TUniDBHelper.Connect '+E.Message);
            end;
          end;
      end;




  finally
      //直连SQLServer时不再需要CoUnInitialize
//    if SameText(ADataBaseConfig.FDBType,'MSSQL') or SameText(ADataBaseConfig.FDBType,'MSSQL2000') then
//    begin
//      {$IFDEF MSWINDOWS}
//      CoUnInitialize();
//      {$ENDIF}
//    end;
  end;
end;

constructor TUniDBHelper.Create;
begin
  Inherited;
  FQuery:=TuniQuery.Create(nil);

end;

function TUniDBHelper.CheckDBOK: Boolean;
begin
  if not SelfQuery(
                    'SELECT 1',
                    [],
                    [],
                    asoOpen
                    ) then
  begin
    try
        if FConnection<>nil then
        begin
          FConnection.Close;
          FConnection.Open;
        end;
    except
      on E:Exception do
      begin
        uBaseLog.HandleException(E,'TUniDBHelper.CheckDBOK');
//        DoLog(E,'CheckDBOK');
      end;
    end;
  end;
end;

procedure TUniDBHelper.Close;
begin
  Inherited;

  if FQuery<>nil then
  begin
    Self.FQuery.Close;
  end;

end;

procedure TUniDBHelper.CommitTransaction;
begin
  Self.FConnection.Commit;
end;

{$IFNDEF NOT_USE_kbmMWUNIDACConnectionPool}
constructor TUniDBHelper.Create(AUnidacConnectionPool:TkbmMWUNIDACConnectionPool);
begin
  Create;

  FUnidacConnectionPool:=AUnidacConnectionPool;
end;
{$ENDIF}

destructor TUniDBHelper.Destroy;
begin

  if FQuery<>nil then
  begin
    FQuery.Close;
    FQuery.Connection:=nil;
    FreeAndNil(FQuery);
  end;

  inherited;
end;

function TUniDBHelper.Disconnect: Boolean;
begin
  Result:=False;
  if (FConnection<>nil) then
  begin
    Self.FConnection.Connected:=False;
  end;
  Result:=True;
end;

procedure TUniDBHelper.UnlockConnectionToPool;
begin
  {$IFNDEF NOT_USE_kbmMWUNIDACConnectionPool}
  if FUnidacConnection<>nil then
  begin
    Self.FUnidacConnection.UnlockConnection;
    FUnidacConnection:=nil;
    Self.Connection:=nil;
  end;
  {$ENDIF}

end;

function TUniDBHelper.GetConnectionFromPool: TObject;
begin
  {$IFNDEF NOT_USE_kbmMWUNIDACConnectionPool}
  if FUnidacConnectionPool<>nil then
  begin
    //有连接池,要从连接池中区域链接
    FUnidacConnection:=TkbmMWunidacConnection(FUnidacConnectionPool.GetBestConnection(True, 0, nil, 10000));
    if FUnidacConnection <> nil then
    begin
      Self.Connection:=FUnidacConnection.Database;
    end;
    Result:=FUnidacConnection;
  end
  else
  begin
    Result:=Self.Connection;
  end;
  {$ENDIF}
  //在FMX平台下,没有连接池,不需要获取

end;

{$IFNDEF NOT_USE_kbmMWUNIDACConnectionPool}
function TUniDBHelper.GetUnidacConnectionFromPool: TkbmMWunidacConnection;
begin
  Result:=TkbmMWunidacConnection(GetConnectionFromPool);
end;
{$ENDIF}

function TUniDBHelper.Query: TDataset;
begin
  Result:=FQuery;
end;

function TUniDBHelper.NewTempQuery: TDataset;
begin
  Result:=TuniQuery.Create(nil);
  TuniQuery(Result).Connection:=FConnection;
end;

procedure TUniDBHelper.RollBackTransaction;
begin
  Self.FConnection.Rollback;
end;

function TUniDBHelper.SelfQuery(AQueryString: String;
                                AParamNames: TStringDynArray;
                                AParamValues: TVariantDynArray;
                                AOperation: TSQLOperation;
                                AParamsCompleted:Boolean;
                                ACustomQueryDataSet:TDataSet): Boolean;
var
  I: Integer;
  AQuery:TuniQuery;

  AIndex:Integer;
  AValueStr:String;
  ATempQuerySQL:String;
//  StartTime,EndTime:TDateTime;
//  sParams : String;
begin
  Result:=False;



  if Length(AParamNames)<>Length(AParamValues) then
  begin
    FLastExceptMessage:='参数与值的个数不匹配 '+AQueryString;
    uBaseLog.HandleException(nil,'TnbUniDBHelper.SelfQuery '+FLastExceptMessage+' '+AQueryString);
    Exit;
  end;
  


//  sParams := '';
//  StartTime:=Now;
  if ACustomQueryDataSet=nil then
  begin
    //自己的FQuery
    AQuery:=TuniQuery(FQuery);
  end
  else
  begin
    //创建临时的Query
    AQuery:=TuniQuery(ACustomQueryDataSet);
  end;




  if SameText(Self.DBType,'MSSQL') or SameText(Self.DBType,'MSSQL2000') then
  begin
    {$IFDEF MSWINDOWS}
    CoInitialize(nil);
    {$ENDIF}
    if (Pos('IFNULL',AQueryString)>0)
      or (Pos('ifnull',AQueryString)>0)
      or (Pos('last_insert_id()',AQueryString)>0) then
    begin
      AQueryString:=ReplaceStr(AQueryString,'IFNULL','ISNULL');
      AQueryString:=ReplaceStr(AQueryString,'ifnull','ifnull');
      AQueryString:=ReplaceStr(AQueryString,'last_insert_id()','@@identity');
    end;

  end;
  try

        try

            if (FConnection<>nil) and Not Self.FConnection.Connected then
            begin
              Self.FConnection.Connected:=True;
            end;
            if (FConnection<>nil) and Self.FConnection.Connected then
            begin
//                HandleException(nil,'TUniDBHelper.SelfQuery '+AQueryString);
                ATempQuerySQL:=AQueryString;

                AQuery.Close;
                AQuery.SQL.Clear;
                AQuery.Connection:=Self.FConnection;
                AQuery.SQL.Text:=TransSelectSQL(AQueryString,DBType);
                //AQuery.Prepare;
                if Not AParamsCompleted then
                begin
                  for I:=Length(AParamNames)-1 downto 0 do
                  begin
                    if AParamNames[I]<>'' then
                    begin
                        AQuery.Params.ParamByName(AParamNames[I]).Value:=AParamValues[I];


                        //f,保存到日志文件中去
                        try
                            AIndex:=Pos(':'+AParamNames[I],ATempQuerySQL);
                            AValueStr:=AParamValues[I];
                            case VarType(AParamValues[I]) of
                                varString, varUString:
                                begin
                                  AValueStr:=QuotedStr(AValueStr);
                                end
                                else
                                begin

                                end;
                            end;
                    
                            if AIndex>0 then
                            begin
                              ATempQuerySQL:=Copy(ATempQuerySQL,1,AIndex-1)
                                              +AValueStr
                                              +Copy(ATempQuerySQL,AIndex+Length(AParamNames[I])+1{:的长度},MaxInt);
                            end;
                        except
                           //避免出错
                        end;


                    end;
                  end;
                end;


                if Length(AParamNames)>0 then
                begin
                    HandleException(nil,'TUniDBHelper.SelfQuery '+ATempQuerySQL);

//                    if (Pos('INSERT',UpperCase(ATempQuerySQL))>0)
//                      or (Pos('UPDATE',UpperCase(ATempQuerySQL))>0)
//                      or (Pos('DELETE',UpperCase(ATempQuerySQL))>0) then
//                    begin
//                      GetGlobalDBLog.HandleException(nil,'TUniDBHelper.SelfQuery '+ATempQuerySQL);
//                    end;
                end
                else
                begin
                    HandleException(nil,'TUniDBHelper.SelfQuery '+AQueryString);
                end;


                case AOperation of
                  asoOpen: AQuery.Open;
                  asoExec:
                  begin
                      //AQuery.Prepare;
                      AQuery.ExecSql;
                  end;
                end;
                Result:=True;


            end
            else
            begin
                FLastExceptMessage:='数据库未连接';
                uBaseLog.HandleException(nil,'TUniDBHelper.SelfQuery '+FLastExceptMessage+' '+AQueryString);
            end;
        except
          on E: Exception do
          begin
            Result:=False;
            //'Lost connection to MySQL server during query'#$D#$A'Error on data reading from the connection:'#$D#$A'你的主机中的软件中止了一个已建立的连接。.'#$D#$A'Socket Error Code: 10053($2745)'
            FLastExceptMessage:=E.Message;
            //      DoLog(E,'SelfQuery');
            uBaseLog.HandleException(E,'TUniDBHelper.SelfQuery '+E.Message
                                        //上次使用时间,跟踪MYSQL是否在10分钟之内就断开连接了
                                        +' '+FormatDateTime('YYYY-MM-DD HH:MM:SS:ZZZ',Self.FLastUseTime)
                                        +' '+AQueryString);

            //是否需要要将connection的connected设置为False
            if (Copy(E.Message,1,Length('Lost connection'))='Lost connection') and (FConnection<>nil) then
            begin
              try
                Self.FConnection.Connected:=False;
                Self.FConnection.Connected:=True;
                uBaseLog.HandleException(nil,'TUniDBHelper.SelfQuery 数据库重连成功');
              finally

              end;
            end;


          end;
        end;

  finally
    if SameText(Self.DBType,'MSSQL') or SameText(Self.DBType,'MSSQL2000') then
    begin
      {$IFDEF MSWINDOWS}
      CoUnInitialize();
      {$ENDIF}
    end;
  end;
end;

//procedure TUniDBHelper.ReCreateConnection;
//begin
//
//end;

procedure TUniDBHelper.SetConnection(const Value: TUniConnection);
begin
  if FConnection<>Value then
  begin
    FConnection := Value;

    if FQuery<>nil then
    begin
      FQuery.Connection:=FConnection;
    end;

  end;
end;

procedure TUniDBHelper.StartTransaction;
begin
  Self.FConnection.StartTransaction;
end;

end.



