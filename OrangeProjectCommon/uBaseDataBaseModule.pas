//convert pas to utf8 by ¥
//数据库模块基类
unit uBaseDataBaseModule;

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
  DateUtils,
//  XSuperObject,
  uBaseDBHelper,
  uUniDBHelper,
  uBaseList,
  uFileCommon,
  uTimerTask,
  Generics.Collections,

  uObjectPool,

  uUniDBHelperPool,
  uDataBaseConfig,

  UniProvider, Data.DB, DBAccess, Uni,
  //kbmMWUniDAC,
//  kbmMWCustomSQLMetaData, kbmMWMSSQLMetaData,
  //kbmMWCustomConnectionPool,
  MySQLUniProvider,
  SQLServerUniProvider;




type
  TDatabaseModuleStatus=record
    //最大个数
    MaxCount:Integer;
    //当前个数
    CurCount:Integer;
    //占用次数
    LockTimes:Integer;
    //释放次数
    UnlockTimes:Integer;

    //检测连接次数
    CheckConnectTimes:Integer;
    //连接连接数
    ConnectedTimes:Integer;
    //连接断开数
    DisconnectedTimes:Integer;
    //重连成功次数
    ReConnectedTimes:Integer;
  end;

  TBaseDatabaseModuleClass=class of TBaseDatabaseModule;
  TBaseDatabaseModule=class
  public
    //独享的数据库连接配置
    DBConfig: TDataBaseConfig;

//    //数据库类型,MYSQL,MSSQL等
//    DBType:String;

    //DBHelper池
    DBHelperPool:TUniDBHelperPool;
    FDBHelperPoolErrorMsg:String;


    //数据库配置文件名
    FDBConfigFileName:String;



    FStatus:TDatabaseModuleStatus;




//    //数据库查询使用组件
//    DBHelper: TBaseDBHelper;
    procedure SetDBConfigFileName(const Value: String);

    procedure DoDBHelperPoolLockFailException(Sender: TObject; E: Exception);
  public
    function GetDBHelperFromPool(var ASQLDBHelper:TBaseDBHelper;var ADesc:String):Boolean;virtual;
    procedure FreeDBHelperToPool(ASQLDBHelper:TBaseDBHelper);virtual;
  public
    procedure tmrActiveMySQLPoolConnectionTimer(Sender: TObject);virtual;

    //准备启动
    function DoPrepareStart(var AError:String): Boolean;virtual;
    //准备停止
    function DoPrepareStop: Boolean;virtual;
    //获取数据库状态
    function GetStatus():TDatabaseModuleStatus;virtual;abstract;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  public
    //数据库配置文件名
    property DBConfigFileName: String read FDBConfigFileName write SetDBConfigFileName;
  end;


  TActiveMySQLPoolConnectionThread=class(TBaseServiceThread)
  protected
    FDatabaseModule:TBaseDatabaseModule;
    procedure Execute;override;
  public
    constructor Create(ACreateSuspended:Boolean;ADatabaseModule:TBaseDatabaseModule);
  end;




var
  GlobalDatabaseModuleClass:TBaseDatabaseModuleClass;
var
  GlobalDBModule:TBaseDatabaseModule;



implementation





{ TBaseDatabaseModule }

constructor TBaseDatabaseModule.Create;
begin
  DBConfig := TDataBaseConfig.Create;
end;

destructor TBaseDatabaseModule.Destroy;
begin
  FreeAndNil(DBConfig);

  inherited;
end;

procedure TBaseDatabaseModule.DoDBHelperPoolLockFailException(Sender: TObject;
  E: Exception);
begin
  FDBHelperPoolErrorMsg:=E.Message;
end;

function TBaseDatabaseModule.DoPrepareStart(var AError: String): Boolean;
begin


end;

function TBaseDatabaseModule.DoPrepareStop: Boolean;
begin

end;

procedure TBaseDatabaseModule.FreeDBHelperToPool(ASQLDBHelper: TBaseDBHelper);
begin


  ASQLDBHelper.UnlockConnectionToPool;
  Self.DBHelperPool.FreeCustomObject(ASQLDBHelper);

  //归还次数
  Inc(FStatus.UnLockTimes);


end;

function TBaseDatabaseModule.GetDBHelperFromPool(var ASQLDBHelper: TBaseDBHelper; var ADesc: String): Boolean;
begin
  Result:=False;

  Self.DBHelperPool.OnLockFail:=Self.DoDBHelperPoolLockFailException;


  ASQLDBHelper:=TBaseDBHelper(Self.DBHelperPool.GetCustomObject);
  if ASQLDBHelper<>nil then
  begin
      ASQLDBHelper.DBType:=DBConfig.FDBType;


      //从数据库连接池中取出可用链接
      if (ASQLDBHelper.GetConnectionFromPool = nil) then
      begin
        ADesc:=Trans('服务端无可用的数据库连接');
        Exit;
      end;


      //3分钟测试检测一下连接
      if DateUtils.SecondsBetween(ASQLDBHelper.FLastUseTime,Now)>3*60 then
      begin


          //2分钟测试检测一下连接
          Inc(FStatus.CheckConnectTimes);
          if not ASQLDBHelper.SelfQuery('SELECT 1') then
          begin


              //连接失败
              Inc(FStatus.DisconnectedTimes);


              {$IFDEF NOT_USE_kbmMWUNIDACConnectionPool}
              {$ELSE}
              if TUniDBHelper(ASQLDBHelper).FUnidacConnection.Database.Connected then
              begin
                //重连成功
                Inc(FStatus.ReConnectedTimes);
              end;
              {$ENDIF}



          end
          else
          begin
              //已连接
              Inc(FStatus.ConnectedTimes);
          end;

          ASQLDBHelper.FLastUseTime:=Now;
      end;


      //使用次数
      Inc(FStatus.LockTimes);

      Result:=True;
  end
  else
  begin
      ADesc:=FDBHelperPoolErrorMsg;
  end;

end;

procedure TBaseDatabaseModule.SetDBConfigFileName(const Value: String);
begin
  if FDBConfigFileName<>Value then
  begin
      FDBConfigFileName := Value;

      DBConfig.Clear;

      if FDBConfigFileName<>'' then
      begin
          if FileExists(GetApplicationPath+FDBConfigFileName) then
          begin
              //加载数据库配置文件
              DBConfig.Load(FDBConfigFileName);
          end
          else
          begin
              //使用手动设置
              uBaseLog.HandleException(nil,'TUnidacDatabaseModule.SetDBConfigFileName '+FDBConfigFileName+' not found!');
              //AError:='数据库配置文件'+DBConfigFileName+' 不存在!';
              //Exit;
          end;
      end;
  end;
end;


procedure TBaseDatabaseModule.tmrActiveMySQLPoolConnectionTimer(
  Sender: TObject);
begin

end;

{ TActiveMySQLPoolConnectionThread }

constructor TActiveMySQLPoolConnectionThread.Create(
  ACreateSuspended:Boolean;ADatabaseModule: TBaseDatabaseModule);
begin
  FDatabaseModule:=ADatabaseModule;
  Inherited Create(ACreateSuspended);
end;

procedure TActiveMySQLPoolConnectionThread.Execute;
begin
  while not Self.Terminated do
  begin
    uBaseLog.HandleException(nil, 'TActiveMySQLPoolConnectionThread.Execute');

    //十分钟检测一次
    SleepThread(2*60*1000);

    FDatabaseModule.tmrActiveMySQLPoolConnectionTimer(nil);

  end;

end;


end.
