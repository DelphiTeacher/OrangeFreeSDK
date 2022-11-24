//convert pas to utf8 by ¥
//Uni数据库操作类的线程池,用于连接MSSQL//
unit uRedisClientPool;


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
//  IniFiles,
//  DB,ADODB,
//  SyncObjs,


//  {$IFNDEF NOT_USE_kbmMWUNIDACConnectionPool}
//  kbmMWCustomConnectionPool,
//  kbmMWCustomDataset,
//  kbmMWUniDAC,
//  {$ENDIF}
//
//
//  uni,
//  {$IFDEF MSWINDOWS}
//  ActiveX,
//  {$ENDIF}

  Redis.Commons,
  Redis.Client,
  uBaseLog,
//  uDatabaseConfig,
//  uRedisClient,
  uObjectPool;


  //不使用kbmMWUNIDACConnectionPool
//  {$DEFINE NOT_USE_kbmMWUNIDACConnectionPool}


type
  TRedisClientPoolObject = class(TPoolObject)
  protected
    function CreateCustomObject: TObject; override;
  public
    FRedisClient:TRedisClient;
    destructor Destroy; override;
  end;



  TRedisClientPool=class(TObjectPool)
  protected
    function GetPoolItemClass: TPoolObjectClass; override;
  public
    FRedis_Host:String;
    FRedis_Port:Integer;
//    FRedis_Password:String;
//    FRedis_dbIdx:Integer;

    constructor Create(aOwner: TComponent); override;
  end;




function GetGlobalRedisClientPool
//  (AUnidacConnectionPool:TkbmMWUNIDACConnectionPool)
  :TRedisClientPool;
procedure FreeGlobalRedisClientPool;



implementation



var
  GlobalRedisClientPool: TRedisClientPool;

function GetGlobalRedisClientPool
//  (AUnidacConnectionPool:TkbmMWUNIDACConnectionPool)
  :TRedisClientPool;
begin
  if GlobalRedisClientPool=nil then
  begin
    GlobalRedisClientPool:=TRedisClientPool.Create(nil);
//    GlobalRedisClientPool.FUnidacConnectionPool:=AUnidacConnectionPool;
  end;
  Result:=GlobalRedisClientPool;
end;

procedure FreeGlobalRedisClientPool;
begin
  FreeAndNil(GlobalRedisClientPool);
end;


{ TRedisClientPool }

constructor TRedisClientPool.Create(aOwner: TComponent);
begin
  inherited;


  FRedis_Host:='127.0.0.1';
  FRedis_Port:=6379;
//  FRedis_Password:='';
//  FRedis_dbIdx:=0;
  //有效期几秒
//  FTimerInval_VerifyExpire:=;


end;

function TRedisClientPool.GetPoolItemClass: TPoolObjectClass;
begin
  Result:=TRedisClientPoolObject;
end;

{ TRedisClientPoolObject }

function TRedisClientPoolObject.CreateCustomObject: TObject;
var
  ARedisClientPool:TRedisClientPool;
begin
  Result:=nil;

  ARedisClientPool:=TRedisClientPool(Self.Collection.Owner);
  try

      //VCL,一般用于服务端,需要KBMMW的线程池组件
      //VCL下,用POOL
//      FRedisClient:=TRedisClient.Create(ARedisClientPool.FUnidacConnectionPool);
      FRedisClient := TRedisClient.Create(ARedisClientPool.FRedis_Host, ARedisClientPool.FRedis_Port);
      FRedisClient.Connect;
  //    if FRedis_Password<>'' then
  //    begin
  //      FRedisClient.AUTH(FRedis_Password);
  //    end;
      FRedisClient.SELECT(0);    // 选择库，默认有16个（0..15）

      Result:=FRedisClient;


//    except
//      on E:Exception do
//      begin
//        uBaseLog.HandleException(E,'TRedisClientPoolObject.CreateCustomObject');
//      end;
//    end;
  finally
  end;
end;


destructor TRedisClientPoolObject.Destroy;
begin
  FRedisClient.Disconnect;

  FRedisClient.Free;

  inherited;
end;


initialization

finalization
  FreeGlobalRedisClientPool;

end.



