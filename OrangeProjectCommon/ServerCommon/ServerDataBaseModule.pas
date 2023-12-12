//convert pas to utf8 by ¥
unit ServerDataBaseModule;

interface

uses
  System.SysUtils, System.Classes,
  kbmMWCustomConnectionPool,

//  Vcl.Controls,
//  Vcl.StdCtrls,
//  Vcl.ExtCtrls,
//  uLang,
  System.StrUtils,
  uFileCommon,
//  DES,

//  Forms,
  uBaseLog,
  XSuperObject,
  uBaseDBHelper,
  uUniDBHelper,
  uBaseList,
  Generics.Collections,

  uUniDBHelperPool,
  uDataBaseConfig,
//  DataBaseConfigForm,
  uBaseDatabaseModule,
//  uTableCommonRestCenter,
//  MySQLUniProvider,
//  SQLServerUniProvider,

  UniProvider, Data.DB, DBAccess, Uni, SQLServerUniProvider,MySQLUniProvider,SQLiteUniProvider,
  kbmMWUniDAC,
  kbmMWCustomSQLMetaData, kbmMWMSSQLMetaData;




type
  TdmServerDataBase = class(TDataModule)
    UniConnection1: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    SQLiteUniProvider1: TSQLiteUniProvider;
    SQLServerUniProvider1: TSQLServerUniProvider;
    kbmMWPooledSession1: TkbmMWPooledSession;
    kbmMWUNIDACConnectionPool1: TkbmMWUNIDACConnectionPool;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
    { Public declarations }
  end;



  TDatabaseModule=class;

  //数据库访问模块
  TDatabaseModule = class(TBaseDatabaseModule)
  public
    FActiveMySQLPoolConnectionThread:TActiveMySQLPoolConnectionThread;
//    tmrActiveMySQLPoolConnection: TTimer;
    procedure tmrActiveMySQLPoolConnectionTimer(Sender: TObject);override;
//    procedure SetDBConfigFileName(const Value: String);
  public
    //数据库连接DataModule
    dmServerDataBase: TdmServerDataBase;

  public
    constructor Create; override;
    destructor Destroy; override;
  public
    //准备启动
    function DoPrepareStart(var AError:String): Boolean;override;
    //准备停止
    function DoPrepareStop: Boolean;override;

    //获取数据库状态
    function GetStatus():TDatabaseModuleStatus;override;
//    //保存数据库配置文件
//    procedure SaveDBConfigFile();
  public
//    function GetDBHelperFromPool(var ASQLDBHelper:TUniDBHelper;var ADesc:String):Boolean;overload;
//    function GetDBHelperFromPool(var ASQLDBHelper:TBaseDBHelper;var ADesc:String):Boolean;overload;
//    procedure FreeDBHelperToPool(ASQLDBHelper:TBaseDBHelper);
  end;



//var
//  GlobalDataBaseCharset:String;

implementation



{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}



type
  //用于能访问到数据库连接列表
  //避免连接mysql之后8小时会断线
  TMykbmMWUNIDACConnectionPool = class(TkbmMWUNIDACConnectionPool)
  end;



  { TDatabaseModule }

constructor TDatabaseModule.Create;
begin
  Inherited Create;

//  DBType:='MYSQL';




  //Provider Name=MySQL;User ID=root;Password=138575wangneng;Use Unicode=True;Character Set=utf8mb4;Data Source=www.orangeui.cn;Database=alipay;Port=3306;Login Prompt=False
  //数据库连接DataModule
  dmServerDataBase := TdmServerDataBase.Create(nil);



//  //数据库查询使用组件
//  DBHelper := TUniDBHelper.Create(dmServerDataBase.kbmMWUNIDACConnectionPool1);
  //数据库连接池
  DBHelperPool:=TUniDBHelperPool.Create(nil);
  TUniDBHelperPool(DBHelperPool).FDBConfig:=DBConfig;
  TUniDBHelperPool(DBHelperPool).FUnidacConnectionPool:=dmServerDataBase.kbmMWUNIDACConnectionPool1;
//  DBHelperPool.FIsUseUnidacConnectionPool:=False;
  TUniDBHelperPool(DBHelperPool).FIsUseUnidacConnectionPool:=True;



//  tmrActiveMySQLPoolConnection := TTimer.Create(nil);
//  tmrActiveMySQLPoolConnection.OnTimer :=Self.tmrActiveMySQLPoolConnectionTimer;
//  tmrActiveMySQLPoolConnection.Enabled := False;
//  //60*60*1000,一个小时检查一次
////  tmrActiveMySQLPoolConnection.Interval := 3600000;
//  tmrActiveMySQLPoolConnection.Interval := 10000;

end;

destructor TDatabaseModule.Destroy;
begin
//  FreeAndNil(tmrActiveMySQLPoolConnection);

//  FreeAndNil(DBHelper);

  FreeAndNil(dmServerDataBase);

  Inherited;
end;

function TDatabaseModule.GetStatus: TDatabaseModuleStatus;
begin
      Result:=FStatus;

//    //最大个数
//    MaxCount:Integer;
      Result.MaxCount:=dmServerDataBase.kbmMWUNIDACConnectionPool1.MaxConnections;
//    //当前个数
//    CurCount:Integer;
      Result.CurCount:=dmServerDataBase.kbmMWUNIDACConnectionPool1.CurConnections;

end;

function TDatabaseModule.DoPrepareStart(var AError:String): Boolean;
var
//  AOptions:TStringList;
  ADBHelper:TUniDBHelper;
begin
  Result:=False;

  Inherited;

  if not IsStarted then
  begin
      if DBConfigFileName<>'' then
      begin
//          if FileExists(ExtractFilePath(Application.ExeName)+DBConfigFileName) then
          if FileExists(GetApplicationPath+DBConfigFileName) then
          begin
              //加载数据库配置文件
              DBConfig.Load(DBConfigFileName);
          end
          else
          begin
              //使用手动设置
              uBaseLog.HandleException(nil,'TDatabaseModule.DoPrepareStart '+DBConfigFileName+' not found!');
              AError:='数据库配置文件'+DBConfigFileName+' 不存在!';
              Exit;
          end;
      end;


      if not DBConfig.IsEmpty then
      begin
//          AOptions:=TStringList.Create;
//
//          AOptions.StrictDelimiter:=True;
//          AOptions.Delimiter:=';';
//          //'Provider Name=MySQL;User ID=root;Password=138575wangneng;Use Unicode=True;Character Set=utf8mb4;Data Source=www.orangeui.cn;Database=alipay;Port=3306;Login Prompt=False'
//          AOptions.DelimitedText:=dmServerDataBase.UniConnection1.ConnectString;
//          uBaseLog.HandleException(nil,'TDatabaseModule.DoPrepareStart dmServerDataBase.UniConnection1.ConnectString='+dmServerDataBase.UniConnection1.ConnectString);
//
//
//          //+'Use Unicode=True;'
//          AOptions.Values['Use Unicode']:='True';
//          AOptions.Values['Character Set']:=Self.DBConfig.FDBCharset;//GlobalDataBaseCharset;'utf8mb4';//
//          dmServerDataBase.UniConnection1.ConnectString:=AOptions.DelimitedText;
//          uBaseLog.HandleException(nil,'TDatabaseModule.DoPrepareStart dmServerDataBase.UniConnection1.ConnectString='+dmServerDataBase.UniConnection1.ConnectString);
//
//
//          FreeAndNil(AOptions);




          ADBHelper:=TUniDBHelper.Create;
          try
              ADBHelper.Connection:=dmServerDataBase.UniConnection1;

              //有数据库配置,需要连接
              //测试连接
              if not ADBHelper.Connect(DBConfig) then
              begin
                  AError:='数据库'+DBConfig.FDBDataBaseName+' 连接失败!';
                  Exit;
              end;


              //连接池中的所有Connection也要切换数据库
              dmServerDataBase.kbmMWUNIDACConnectionPool1.Active:=False;
              dmServerDataBase.kbmMWUNIDACConnectionPool1.Active:=True;
              //SQLITE不支持并发
              dmServerDataBase.kbmMWUNIDACConnectionPool1.MaxConnections:=DBConfig.FMaxConnections;

              //mysql才需要,而SQLITE,ES则不需要
              if SameText(DBConfig.FDBType,'MYSQL') or SameText(DBConfig.FDBType,'MSSQL') or SameText(DBConfig.FDBType,'MSSQL2000') then
              begin
//              Self.tmrActiveMySQLPoolConnection.Enabled := True;
                FActiveMySQLPoolConnectionThread:=TActiveMySQLPoolConnectionThread.Create(False,Self);
              end;
          finally
            FreeAndNil(ADBHelper);
          end;

      end
      else
      begin
          //raise Exception.Create('TDatabaseModule.DoPrepareStart DBConfig is empty!');
          uBaseLog.HandleException(nil,'TDatabaseModule.DoPrepareStart DBConfig Is Empty!');
      end;

  end;
  Result := True;

  IsStarted:=True;
end;

function TDatabaseModule.DoPrepareStop: Boolean;
begin
  Result:=False;

  IsStarted:=False;


  //断开数据库连接
//  if not DBConfig.IsEmpty then
//  begin
//    DBHelper.Disconnect;
//  end;

//  tmrActiveMySQLPoolConnection.Enabled:=False;

  if FActiveMySQLPoolConnectionThread<>nil then
  begin
    FActiveMySQLPoolConnectionThread.Terminate;
    FActiveMySQLPoolConnectionThread.WaitFor;
    FreeAndNil(FActiveMySQLPoolConnectionThread);
  end;


  Result := True;
end;


//function TDatabaseModule.GetDBHelperFromPool(var ASQLDBHelper: TBaseDBHelper;
//  var ADesc: String): Boolean;
//begin
//  Result:=False;
//
//  ASQLDBHelper:=TUniDBHelper(Self.DBHelperPool.GetCustomObject);
//  ASQLDBHelper.DBType:=DBType;
//
//  //从数据库连接池中取出可用链接
//  if (ASQLDBHelper.GetConnectionFromPool = nil) then
//  begin
//    ADesc:=('服务端无可用的数据库连接');
//    Exit;
//  end;
//
//  Result:=True;
//end;
//
//procedure TDatabaseModule.SetDBConfigFileName(const Value: String);
//begin
//  if FDBConfigFileName<>Value then
//  begin
//      FDBConfigFileName := Value;
//
//      DBConfig.Clear;
//
//      if FDBConfigFileName<>'' then
//      begin
//          if FileExists(ExtractFilePath(Application.ExeName)+FDBConfigFileName) then
//          begin
//              //加载数据库配置文件
//              DBConfig.Load(FDBConfigFileName);
//          end
//          else
//          begin
//              //使用手动设置
//              uBaseLog.HandleException(nil,'TDatabaseModule.SetDBConfigFileName '+FDBConfigFileName+' not found!');
//              //AError:='数据库配置文件'+DBConfigFileName+' 不存在!';
//              //Exit;
//          end;
//      end;
//  end;
//end;

//function TDatabaseModule.GetDBHelperFromPool(var ASQLDBHelper: TUniDBHelper;
//  var ADesc: String): Boolean;
//begin
//  Result:=False;
//
//  ASQLDBHelper:=TUniDBHelper(Self.DBHelperPool.GetCustomObject);
//  ASQLDBHelper.DBType:=DBConfig.FDBType;
//
//
//  //从数据库连接池中取出可用链接
//  if (ASQLDBHelper.GetConnectionFromPool = nil) then
//  begin
//    ADesc:=('服务端无可用的数据库连接');
//    Exit;
//  end;
//
//
//
//
//  Result:=True;
//end;

procedure TDatabaseModule.tmrActiveMySQLPoolConnectionTimer(Sender: TObject);
var
  AMykbmMWUNIDACConnectionPool: TMykbmMWUNIDACConnectionPool;
  I: Integer;
  lst: TList<TkbmMWCustomConnection>;
  AUniQuery:TUniQuery;
begin
  uBaseLog.HandleException(nil, 'TDatabaseModule.tmrActiveMySQLPoolConnectionTimer '+Self.FDBConfigFileName);


  //检测连接次数
  Inc(FStatus.CheckConnectTimes);


  //因为MySQL连接超过8小时没有活动就自动断开了,要定时执行一下查询  Self.tmrActiveMySQLPoolConnection.Enabled:=False;
  AMykbmMWUNIDACConnectionPool := TMykbmMWUNIDACConnectionPool(dmServerDataBase.kbmMWUNIDACConnectionPool1);
  lst := AMykbmMWUNIDACConnectionPool.ConnectionList.BeginWrite;
  AUniQuery:=TUniQuery.Create(nil);
  try

      for I := 0 to lst.Count - 1 do
      begin

          if not lst[I].Locked then
          begin
              //连接没有被锁住,可以执行数据库操作

              try
                AUniQuery.Close;
                AUniQuery.Connection := TkbmMWunidacConnection(lst[I]).Database;
                AUniQuery.SQL.Text:='SELECT 1';
                AUniQuery.Open;
                uBaseLog.HandleException(nil, 'TDatabaseModule.tmrActiveMySQLPoolConnectionTimer '+Self.FDBConfigFileName+' SELECT 1');


                //已连接
                Inc(FStatus.ConnectedTimes);
              except
                on E: Exception do
                begin
                  //记录出错日志
                  uBaseLog.HandleException(E, 'TDatabaseModule.tmrActiveMySQLPoolConnectionTimer '+Self.FDBConfigFileName);

                  //如果断开了,则尝试重新连接
                  //断开次数
                  Inc(FStatus.DisconnectedTimes);

                  try
                    TkbmMWunidacConnection(lst[I]).Database.Connected:=False;
                    TkbmMWunidacConnection(lst[I]).Database.Connected:=True;
                    //重连成功次数
                    Inc(FStatus.ReConnectedTimes);
                  finally

                  end;


                end;
              end;

          end
          else
          begin
              //连接已经被锁住了,表示在使用中,不需要处理
              uBaseLog.HandleException(nil, 'TDatabaseModule.tmrActiveMySQLPoolConnectionTimer '+Self.FDBConfigFileName+' connection is in use');
          end;

      end;

  finally
    AMykbmMWUNIDACConnectionPool.ConnectionList.EndWrite;

//    Self.tmrActiveMySQLPoolConnection.Enabled := True;

    FreeAndNil(AUniQuery);
  end;

//var
//  AMykbmMWUNIDACConnectionPool: TMykbmMWUNIDACConnectionPool;
//  I: Integer;
//  lst: TList<TkbmMWCustomConnection>;
//  ADBHelper:TUniDBHelper;
//begin
//
//  //因为MySQL连接超过8小时没有活动就自动断开了,要定时执行一下查询  Self.tmrActiveMySQLPoolConnection.Enabled:=False;
//  AMykbmMWUNIDACConnectionPool := TMykbmMWUNIDACConnectionPool(dmServerDataBase.kbmMWUNIDACConnectionPool1);
//  lst := AMykbmMWUNIDACConnectionPool.ConnectionList.BeginWrite;
//  ADBHelper:=TUniDBHelper.Create;
//  try
//
//      for I := 0 to lst.Count - 1 do
//      begin
//
//          if not lst[I].Locked then
//          begin
//              //连接没有被锁住,可以执行数据库操作
//              uBaseLog.HandleException(nil, 'Main', 'MainForm','tmrActiveMySQLPoolConnectionTimer connection is not locked');
//
//              try
//                TUniDBHelper(ADBHelper).Connection := TkbmMWunidacConnection(lst[I]).Database;
//                TUniDBHelper(ADBHelper).CheckDBOK;
//              except
//                on E: Exception do
//                begin
//                  //记录出错日志
//                  uBaseLog.HandleException(E, 'Main', 'MainForm','tmrActiveMySQLPoolConnectionTimer ');
//                end;
//              end;
//
//          end
//          else
//          begin
//              //连接已经被锁住了,表示在使用中
//              uBaseLog.HandleException(nil, 'Main', 'MainForm','tmrActiveMySQLPoolConnectionTimer connection is locked');
//          end;
//
//      end;
//
//  finally
//    AMykbmMWUNIDACConnectionPool.ConnectionList.EndWrite;
//    Self.tmrActiveMySQLPoolConnection.Enabled := True;
//    FreeAndNil(ADBHelper);
//  end;

end;


{ TdmServerDataBase }

constructor TdmServerDataBase.Create(AOwner: TComponent);
begin
  inherited;

//  SQLServerUniProvider1.
end;



destructor TdmServerDataBase.Destroy;
begin
  kbmMWUNIDACConnectionPool1.Active:=False;
  FreeAndNil(kbmMWUNIDACConnectionPool1);
  inherited;
end;

initialization
//  GlobalDataBaseCharset:='utf8';
  GlobalDatabaseModuleClass:=TDatabaseModule;



end.
