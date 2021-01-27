//convert pas to utf8 by ¥
unit ServerDataBaseModule;

interface

uses
  System.SysUtils, System.Classes,
  kbmMWCustomConnectionPool,

  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uLang,

  Forms,
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

  UniProvider, Data.DB, DBAccess, Uni, SQLServerUniProvider,MySQLUniProvider,
  kbmMWUniDAC,
  kbmMWCustomSQLMetaData, kbmMWMSSQLMetaData;




type
  TdmServerDataBase = class(TDataModule)
    UniConnection1: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    SQLServerUniProvider1: TSQLServerUniProvider;
    kbmMWPooledSession1: TkbmMWPooledSession;
    kbmMWUNIDACConnectionPool1: TkbmMWUNIDACConnectionPool;
  private
    { Private declarations }
  public
    { Public declarations }
  end;






  //数据库访问模块
  TDatabaseModule = class(TBaseDatabaseModule)
  private
    tmrActiveMySQLPoolConnection: TTimer;
    procedure tmrActiveMySQLPoolConnectionTimer(Sender: TObject);
//    procedure SetDBConfigFileName(const Value: String);
  public
    //数据库连接DataModule
    dmServerDataBase: TdmServerDataBase;

    //是否已连接数据库,避免重复启动
    IsStarted:Boolean;

//               TObjectPool
  public
    constructor Create; override;
    destructor Destroy; override;
  public
    //准备启动
    function DoPrepareStart(var AError:String): Boolean;override;
    //准备停止
    function DoPrepareStop: Boolean;override;

//    //保存数据库配置文件
//    procedure SaveDBConfigFile();
  public
    function GetDBHelperFromPool(var ASQLDBHelper:TUniDBHelper;var ADesc:String):Boolean;overload;
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
  TUniDBHelperPool(DBHelperPool).FUnidacConnectionPool:=dmServerDataBase.kbmMWUNIDACConnectionPool1;



  tmrActiveMySQLPoolConnection := TTimer.Create(nil);
  tmrActiveMySQLPoolConnection.OnTimer :=Self.tmrActiveMySQLPoolConnectionTimer;
  tmrActiveMySQLPoolConnection.Enabled := False;
  //60*60*1000,一个小时检查一次
//  tmrActiveMySQLPoolConnection.Interval := 3600000;
  tmrActiveMySQLPoolConnection.Interval := 10000;

end;

destructor TDatabaseModule.Destroy;
begin
  FreeAndNil(tmrActiveMySQLPoolConnection);
  FreeAndNil(dmServerDataBase);
//  FreeAndNil(DBHelper);
  FreeAndNil(DBHelperPool);

  Inherited;
end;

function TDatabaseModule.DoPrepareStart(var AError:String): Boolean;
var
  AOptions:TStringList;
  ADBHelper:TUniDBHelper;
begin
  Result:=False;

  Inherited;

  if not IsStarted then
  begin
      if DBConfigFileName<>'' then
      begin
          if FileExists(ExtractFilePath(Application.ExeName)+DBConfigFileName) then
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
          AOptions:=TStringList.Create;
          AOptions.StrictDelimiter:=True;
          AOptions.Delimiter:=';';
          AOptions.DelimitedText:=dmServerDataBase.UniConnection1.ConnectString;

          //+'Use Unicode=True;'
          AOptions.Values['Use Unicode']:='True';
          AOptions.Values['Character Set']:=Self.DBConfig.FDBCharset;//GlobalDataBaseCharset;'utf8mb4';//
          dmServerDataBase.UniConnection1.ConnectString:=AOptions.DelimitedText;
          FreeAndNil(AOptions);

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



              Self.tmrActiveMySQLPoolConnection.Enabled := True;

          finally
            FreeAndNil(ADBHelper);
          end;

//          //从连接池中取一个DBHelper
//          if not Self.GetDBHelperFromPool(ADBHelper,AError) then
//          begin
//            Exit;
//          end;
//          try
//
//              //有数据库配置,需要连接
//              //测试连接
//              if not ADBHelper.Connect(DBConfig) then
//              begin
//                  AError:='数据库'+DBConfig.FDBDataBaseName+' 连接失败!';
//                  Exit;
//              end;
//
//              Self.tmrActiveMySQLPoolConnection.Enabled := True;
//
//          finally
//            Self.FreeDBHelperToPool(ADBHelper);
//          end;
      end
      else
      begin
        //raise Exception.Create('TDatabaseModule.DoPrepareStart DBConfig is empty!');
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

  tmrActiveMySQLPoolConnection.Enabled:=False;


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
//    ADesc:=Trans('服务端无可用的数据库连接');
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

function TDatabaseModule.GetDBHelperFromPool(var ASQLDBHelper: TUniDBHelper;
  var ADesc: String): Boolean;
begin
  Result:=False;

  ASQLDBHelper:=TUniDBHelper(Self.DBHelperPool.GetCustomObject);
  ASQLDBHelper.DBType:=DBConfig.FDBType;


  //从数据库连接池中取出可用链接
  if (ASQLDBHelper.GetConnectionFromPool = nil) then
  begin
    ADesc:=Trans('服务端无可用的数据库连接');
    Exit;
  end;

  Result:=True;
end;

procedure TDatabaseModule.tmrActiveMySQLPoolConnectionTimer(Sender: TObject);
var
  AMykbmMWUNIDACConnectionPool: TMykbmMWUNIDACConnectionPool;
  I: Integer;
  lst: TList<TkbmMWCustomConnection>;
  AUniQuery:TUniQuery;
begin

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
              except
                on E: Exception do
                begin
                  //记录出错日志
                end;
              end;

          end
          else
          begin
              //连接已经被锁住了,表示在使用中,不需要处理
          end;

      end;

  finally
    AMykbmMWUNIDACConnectionPool.ConnectionList.EndWrite;
    Self.tmrActiveMySQLPoolConnection.Enabled := True;
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


initialization
//  GlobalDataBaseCharset:='utf8';
  GlobalDatabaseModuleClass:=TDatabaseModule;



end.
