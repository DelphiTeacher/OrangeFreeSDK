//
unit uFMXUnidacDataBaseModule;

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
  System.SysUtils,
  System.Classes,

//  Vcl.Controls,
//  Vcl.StdCtrls,
//  Vcl.ExtCtrls,
  uLang,
  {$IFDEF FMX}
  FMX.Types,
  {$ENDIF}
  {$IFDEF VCL}
  ExtCtrls,
  {$ENDIF}
//  StdCtrls,

//  Forms,
  uBaseLog,
//  XSuperObject,
  uBaseDBHelper,
  uUniDBHelper,
  uBaseList,
  uFileCommon,
  Generics.Collections,

  uUniDBHelperPool,
  uDataBaseConfig,
  uBaseDataBaseModule,
//  DataBaseConfigForm,
//  uTableCommonRestCenter,

  UniProvider, Data.DB, DBAccess, Uni,
  //kbmMWUniDAC,
//  kbmMWCustomSQLMetaData, kbmMWMSSQLMetaData,
  //kbmMWCustomConnectionPool,
  SQLiteUniProvider,
  MySQLUniProvider,
  SQLServerUniProvider;




type
  //FireMonkey平台下Unidac数据库访问模块
  TFMXUnidacDatabaseModule = class(TBaseDatabaseModule)
  private
    FSQLiteUniProvider:TSQLiteUniProvider;
    FMySQLUniProvider:TMySQLUniProvider;
    FSQLServerUniProvider:TSQLServerUniProvider;
//    tmrActiveMySQLPoolConnection: TTimer;
//    FActiveMySQLPoolConnectionThread:TActiveMySQLPoolConnectionThread;
//    procedure tmrActiveMySQLPoolConnectionTimer(Sender: TObject);override;
  public
    //是否已连接数据库,避免重复启动
    IsStarted:Boolean;
//               TObjectPool
  public
    constructor Create; override;
    destructor Destroy; override;
  public
    UniConnection1: TUniConnection;
    //在服务启动的时候,会调用它们,确保数据库能连接成功
    //准备启动
    function DoPrepareStart(var AError:String): Boolean;override;
    //准备停止
    function DoPrepareStop: Boolean;override;

//    //保存数据库配置文件
//    procedure SaveDBConfigFile();
  public
//    function GetDBHelperFromPool(var ASQLDBHelper:TUniDBHelper;var ADesc:String):Boolean;overload;
//    function GetDBHelperFromPool(var ASQLDBHelper:TBaseDBHelper;var ADesc:String):Boolean;overload;
//    procedure FreeDBHelperToPool(ASQLDBHelper:TBaseDBHelper);
//  public
//    //数据库配置文件名
//    property DBConfigFileName: String read FDBConfigFileName write SetDBConfigFileName;
  end;



//var
//  GlobalDataBaseCharset:String;


implementation





{ TFMXUnidacDatabaseModule }

constructor TFMXUnidacDatabaseModule.Create;
begin
  Inherited Create;

  FSQLiteUniProvider:=TSQLiteUniProvider.Create(nil);
  FMySQLUniProvider:=TMySQLUniProvider.Create(nil);
  FSQLServerUniProvider:=TSQLServerUniProvider.Create(nil);

//  DBType:='MYSQL';


  UniConnection1:=TUniConnection.Create(nil);


  //Provider Name=MySQL;User ID=root;Password=138575wangneng;Use Unicode=True;Character Set=utf8mb4;Data Source=www.orangeui.cn;Database=alipay;Port=3306;Login Prompt=False
  //数据库连接DataModule
//  dmServerDataBase := TdmServerDataBase.Create(nil);



//  //数据库查询使用组件
//  DBHelper := TUniDBHelper.Create;//(dmServerDataBase.kbmMWUNIDACConnectionPool1);



  //数据库连接池
  DBHelperPool:=TUniDBHelperPool.Create(nil);
  TUniDBHelperPool(DBHelperPool).FDBConfig:=DBConfig;
  DBHelperPool.FIsUseUnidacConnectionPool:=False;
//  TUniDBHelperPool(DBHelperPool).FUnidacConnectionPool:=dmServerDataBase.kbmMWUNIDACConnectionPool1;




//  tmrActiveMySQLPoolConnection := TTimer.Create(nil);
//  tmrActiveMySQLPoolConnection.OnTimer :=Self.tmrActiveMySQLPoolConnectionTimer;
//  tmrActiveMySQLPoolConnection.Enabled := False;
//  //60*60*1000,一个小时检查一次
//  tmrActiveMySQLPoolConnection.Interval := 3600000;

end;

destructor TFMXUnidacDatabaseModule.Destroy;
begin
//  FreeAndNil(tmrActiveMySQLPoolConnection);


//  FreeAndNil(dmServerDataBase);
//  FreeAndNil(DBHelper);
  FreeAndNil(DBHelperPool);

  FreeAndNil(UniConnection1);

  FreeAndNil(FSQLiteUniProvider);
  FreeAndNil(FMySQLUniProvider);
  FreeAndNil(FSQLServerUniProvider);
  Inherited;
end;

function TFMXUnidacDatabaseModule.DoPrepareStart(var AError:String): Boolean;
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
          if FileExists(GetApplicationPath+DBConfigFileName) then
          begin
              //加载数据库配置文件
              DBConfig.Load(DBConfigFileName);
          end
          else
          begin
              //使用手动设置
              uBaseLog.HandleException(nil,'TFMXUnidacDatabaseModule.DoPrepareStart '+DBConfigFileName+' not found!');
              AError:='数据库配置文件'+DBConfigFileName+' 不存在!';
              Exit;
          end;
      end;




      if not DBConfig.IsEmpty then
      begin
//          AOptions:=TStringList.Create;
//          AOptions.StrictDelimiter:=True;
//          AOptions.Delimiter:=';';
//          AOptions.DelimitedText:=dmServerDataBase.UniConnection1.ConnectString;
//          AOptions.Values['Character Set']:=DBConfig.FDBCharset;
//          dmServerDataBase.UniConnection1.ConnectString:=AOptions.DelimitedText;
//          FreeAndNil(AOptions);
//
//          //数据库类型
//          DBType:=DBConfig.FDBType;





//          //从连接池中取一个DBHelper
//          if not Self.GetDBHelperFromPool(ADBHelper,AError) then
//          begin
//            Exit;
//          end;
          ADBHelper:=TUniDBHelper.Create;
          try
              ADBHelper.Connection:=UniConnection1;

              //有数据库配置,需要连接
              //测试连接
              if not ADBHelper.Connect(DBConfig) then
              begin
                  AError:='数据库'+DBConfig.FDBDataBaseName+' 连接失败!';
                  Exit;
              end;


//              Self.tmrActiveMySQLPoolConnection.Enabled := True;
//              FActiveMySQLPoolConnectionThread:=TActiveMySQLPoolConnectionThread.Create(False,Self);


          finally
//            Self.FreeDBHelperToPool(ADBHelper);
            FreeAndNil(ADBHelper);
          end;

      end
      else
      begin
        //raise Exception.Create('TFMXUnidacDatabaseModule.DoPrepareStart DBConfig is empty!');
      end;

  end;
  Result := True;

  IsStarted:=True;
end;

function TFMXUnidacDatabaseModule.DoPrepareStop: Boolean;
begin
  Result:=False;

  IsStarted:=False;

  //断开连接池所有的数据库连接

//  if not DBConfig.IsEmpty then
//  begin

//    DBHelper.Disconnect;


//  end;

//  tmrActiveMySQLPoolConnection.Enabled:=False;

//  if FActiveMySQLPoolConnectionThread <> nil then
//  begin
//    FActiveMySQLPoolConnectionThread.Terminate;
//    FActiveMySQLPoolConnectionThread.WaitFor;
//    FreeAndNil(FActiveMySQLPoolConnectionThread);
//  end;



  Result := True;
end;


//function TFMXUnidacDatabaseModule.GetDBHelperFromPool(var ASQLDBHelper: TBaseDBHelper;
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
//function TFMXUnidacDatabaseModule.GetDBHelperFromPool(var ASQLDBHelper: TUniDBHelper;
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

//procedure TFMXUnidacDatabaseModule.tmrActiveMySQLPoolConnectionTimer(Sender: TObject);
////var
////  AMykbmMWUNIDACConnectionPool: TMykbmMWUNIDACConnectionPool;
////  I: Integer;
////  lst: TList<TkbmMWCustomConnection>;
//var
//  I: LongInt;
//  ADesc:String;
//  ABaseDBHelper:TBaseDBHelper;
//begin
//  uBaseLog.HandleException(nil, 'TFMXUnidacDatabaseModule.tmrActiveMySQLPoolConnectionTimer');
//
//
//
//  //因为MySQL连接超过8小时没有活动就自动断开了,要定时执行一下查询  Self.tmrActiveMySQLPoolConnection.Enabled:=False;
////  AMykbmMWUNIDACConnectionPool := TMykbmMWUNIDACConnectionPool
////    (dmServerDataBase.kbmMWUNIDACConnectionPool1);
////  lst := AMykbmMWUNIDACConnectionPool.ConnectionList.BeginWrite;
//  try
//
//
//      DBHelperPool.FCS.Enter;
//      try
//        for I := 0 to DBHelperPool.FCustomObjects.Count - 1 do
//        begin
//          if not DBHelperPool.FCustomObjects[I].Busy then
//          begin
//            TUniDBHelperPoolObject(DBHelperPool.FCustomObjects[I]).FDBHelper.CheckDBOK;
//          end;
//        end;
//      finally
//        DBHelperPool.FCS.Leave;
//      end;
//
//
//
//
//      if DBHelperPool.FCustomObjects.Count>0 then
//      begin
//        if not Self.GetDBHelperFromPool(ABaseDBHelper,ADesc) then
//        begin
//          Exit;
//        end;
//        try
//          ABaseDBHelper.SelfQuery('SELECT 1');
//        finally
//          Self.FreeDBHelperToPool(ABaseDBHelper);
//        end;
//      end;
//
//
//
////    for I := 0 to lst.Count - 1 do
////    begin
////
////      if not lst[I].Locked then
////      begin
////          //连接没有被锁住,可以执行数据库操作
////          uBaseLog.HandleException(nil, 'Main', 'MainForm',
////            'tmrActiveMySQLPoolConnectionTimer connection is not locked');
////
////          try
////            TUniDBHelper(DBHelper).Connection := TkbmMWunidacConnection(lst[I]
////              ).Database;
////            TUniDBHelper(DBHelper).CheckDBOK;
////          except
////            on E: Exception do
////            begin
////              //记录出错日志
////              uBaseLog.HandleException(E, 'Main', 'MainForm',
////                'tmrActiveMySQLPoolConnectionTimer ');
////            end;
////          end;
////
////      end
////      else
////      begin
////          //连接已经被锁住了,表示在使用中
////          uBaseLog.HandleException(nil, 'Main', 'MainForm',
////            'tmrActiveMySQLPoolConnectionTimer connection is locked');
////      end;
////
////    end;
//
//  finally
////    AMykbmMWUNIDACConnectionPool.ConnectionList.EndWrite;
////    Self.tmrActiveMySQLPoolConnection.Enabled := True;
//  end;
//
//end;


initialization
//  GlobalDataBaseCharset:='utf8mb4';
  GlobalDatabaseModuleClass:=TFMXUnidacDatabaseModule;




end.
