//convert pas to utf8 by ¥
unit uOpenPlatformServerManager;

interface

uses

  {$IFDEF MSWINDOWS}
  ActiveX,
  Winapi.Windows, Winapi.Messages,
  Graphics,
  Controls, Forms, Dialogs,
  {$ENDIF}
  SyncObjs,
  System.SysUtils, System.Variants,
  System.Classes,
  DateUtils,
  StrUtils,

//  uLang,
  IniFiles,
  IdGlobal,
  uBaseLog,
  XSuperObject,
  uBaseDBHelper,
  uUniDBHelper,
  uBaseList,
  uFileCommon,
  uOpenCommon,
  uFuncCommon,
  uDatasetToJson,

  uDataBaseConfig,

  uRestInterfaceCall,
  uBaseDataBaseModule,
  uCommandLineHelper,



//  {$IFDEF HAS_REDIS}
  Redis.Client,
  Redis.Commons,
  uRedisClientPool,
//  {$ELSE}
//  {$ENDIF}
//  Unit2,




  {$IFDEF USE_IDHTTPSERVERMODE}
    uFMXUnidacDataBaseModule,
  {$ELSE}
//    DataBaseConfigForm,
    ServerDataBaseModule,

    kbmMWGlobal,
    kbmMWScheduler,
    kbmMWUniDAC,
    kbmMWCustomConnectionPool,
    Generics.Collections,
    uModule_InterfaceSign,

    kbmMWHTTPUtils,
    kbmMWCustomTransport,
    kbmMWServer,
    kbmMWAJAXTransStream,
  //  kbmMWTCPIPIndyServerTransport,
    kbmMWCustomHTTPService,
    kbmMWCustomLoadBalancingService,
    kbmMWFilePool,
    kbmMWSecurity,
    kbmMWCrypt,

    IdSocketHandle,
    {$IFDEF NO_HTTPSYSServerTransport}
  //  kbmMWAJAXTransStream,
    kbmMWSOAPTransStream,
    kbmMWRESTTransStream,
    kbmMWTCPIPIndyServerTransport,
    {$ELSE}
    kbmMWHTTPSYSServerTransport,
    {$ENDIF}

    MySQLUniProvider,
    kbmMWCustomSQLMetaData,
    kbmMWMSSQLMetaData,
    kbmMWHTTPStdTransStream,
  //  uRestInterfaceCall,

    UniProvider, DBAccess,
  {$ENDIF}




//  uBaseDataBaseModule,
  Data.DB,
  Uni;



{$IFDEF USE_IDHTTPSERVERMODE}
{$ELSE}
{$ENDIF}


type
  {$IFDEF USE_IDHTTPSERVERMODE}
  {$ELSE}
    TkbmMWCustomServiceClass = class of TkbmMWCustomService;
  {$ENDIF}
  TServiceProject=class;

//  {$IFDEF HAS_REDIS}
//  {$ELSE}
//  TRedisClient=TObject;
//  {$ENDIF}


  //接口调用统计
  TAPICallStatisticsItem=class
    //接口名称
    FAPI:String;
    //次数
    FCount:Double;
    //最大耗时
    FMaxCostMilliSeconds:Double;
    //总耗时，用来计算平均耗时
    FSumCostMilliSeconds:Double;

  end;
  TAPICallStatisticsList=class(TBaseList)
  private
    function GetItem(Index: Integer): TAPICallStatisticsItem;
  public
    //添加一次接口调用
    procedure AddCall(AAPI:String;ACostMilliSeconds:Double);
    function Find(AAPI:String):TAPICallStatisticsItem;
    property Items[Index:Integer]:TAPICallStatisticsItem read GetItem;default;
  end;




  //开放平台的APP
  TOpenPlatformApp=class
  public
    fid:String;


    //是否启用签名
    is_enable_sign:Integer;
    //签名类型
    sign_type:String;
    //签名私钥
    appsecret_xfapp:String;



    //是否有FastMsg的功能
    is_enable_fastmsg:Integer;

    //FastMsg的WebService功能,不再使用
//    fastmsg_webservice_url:String;

    //Fastmsg的rest接口
    fastmsg_webapi_url:String;

    fastmsg_key:String;
    //客服
    service_user_fid:String;



//    appid:Integer;
//    user_fid:String;

    appsecret:String;
//    name:String;
//    icon_path:String;
//    app_desc:String;
    Json:ISuperObject;
    procedure LoadFromDataset(ADataset:TDataset);
  end;
  TOpenPlatformAppList=class(TBaseList)
  private
    function GetItem(Index: Integer): TOpenPlatformApp;
  public
    procedure Add(AAppID:String;
                  AIsEnableSign:Boolean;
                  ASignType:String;
                  AAppSecret:String
                  );overload;
    function Find(AAppID:String):TOpenPlatformApp;
    property Items[Index:Integer]:TOpenPlatformApp read GetItem;default;
  end;





  TBaseServiceThread=class(TThread)
  public
    procedure SleepThread(ATimeout:Integer;ACheckTerminateInterval:Integer=2000);
  end;



  //服务模块基类
  TServiceModule = class
  protected
  public
    FServiceProject:TServiceProject;

    //是否已连接数据库,避免重复启动
    IsStarted:Boolean;

    //模块名称,比如验证码、用户中心、IM、朋友圈
    Name: String;

    FIsInited:Boolean;
    {$IFDEF USE_IDHTTPSERVERMODE}
    {$ELSE}
      //实现服务的核心
      kbmMWCustomServiceClass: TkbmMWCustomServiceClass;
    {$ENDIF}
  public
    constructor Create; virtual;
  public
    //从别的APP复制配置到新APP
    function CopyConfigFromApp(ASourceAppID:Integer;ADestAppID:Integer;ADestAppJson:ISuperObject;var ADesc:String):Boolean;virtual;

    procedure Init;virtual;
    //准备启动
    function DoPrepareStart(var AError:String): Boolean; virtual;
    //准备停止
    function DoPrepareStop: Boolean; virtual;
    //启动后
    procedure DoAfterStart; virtual;
  end;





  //KBM服务模块(含数据库)
  TKbmMWServiceModule = class(TServiceModule)
  protected
    function CustomCopyConfigFromApp(ASQLDBHelper:TBaseDBHelper;ASourceAppID:Integer;ADestAppID:Integer;ADestAppJson:ISuperObject;var ADesc:String):Boolean;virtual;
  public
    //使用的数据库连接
    FDBModule: TBaseDatabaseModule;
    function DBModule: TBaseDatabaseModule;
  public
    constructor Create; override;
    destructor Destroy; override;
  public
    function CopyConfigFromApp(ASourceAppID:Integer;ADestAppID:Integer;ADestAppJson:ISuperObject;var ADesc:String):Boolean;override;

    //准备启动
    function DoPrepareStart(var AError:String): Boolean; override;
    //准备停止
    function DoPrepareStop: Boolean; override;
  end;


  //一分钟打印一次
  //输出服务端状态的线程
  TServiceStatusOutputThread=class(TBaseServiceThread)
  protected
    FServiceProject:TServiceProject;
    procedure Execute;override;
    constructor Create(ACreateSuspended:Boolean;AServiceProject:TServiceProject);
  end;


//  TServiceModuleInitProcEvent=procedure(AServiceProject:TServiceProject);
//  TServiceModuleInitProcItem=class
//    FInitProc:TServiceModuleInitProcEvent;
//  end;
//  TServiceModuleInitProcList=class(TBaseList)
//  private
//    function GetItem(Index: Integer): TServiceModuleInitProcItem;
//  public
//    property Items[Index:Integer]:TServiceModuleInitProcItem read GetItem;default;
//  end;


  //服务端启动线程
  TSerivceStartThread=class(TBaseServiceThread)
  public
    FServiceProject:TServiceProject;
    procedure Execute;override;
    constructor Create(ACreateSuspended:Boolean;AServiceProject:TServiceProject);
  end;


  //用户Token
  TUserAccessToken=class
    AppID:String;
    UserFID:String;
    IsSystem:Boolean;
    AccessToken:String;
    AccessTokenCreateTime:TDateTime;
  end;
  TUserAccessTokenList=class(TBaseList)
  private
    function GetItem(Index: Integer): TUserAccessToken;
  public
    function Add(AAppID:String;AUserFID:String;AAccessToken:String;AIsSystem:Boolean=False):TUserAccessToken;overload;
    function Find(AAppID:String;AUserFID:String;AIsSystem:Boolean=False):TUserAccessToken;overload;
    function Find(AAccessToken:String):TUserAccessToken;overload;
    property Items[Index:Integer]:TUserAccessToken read GetItem;default;
  end;


  TServiceStartEndNotifyEvent=procedure(Sender:TObject;AIsStartSucc:Boolean;AError:String) of object;
  //服务工程
  TServiceProject = class
  public
    Name: String;
    ServiceName: String;
    ServiceDisplayName: String;
    //服务端端口
    Port: Integer;
    SSLPort: Integer;
    //域名
    Domain:String;

    //只需要一个数据库
    IsNeedOneDatabase:Boolean;

    //是否需要Redis
    IsNeedRedis:Boolean;

    //是否使用同一个DBModule
    IsUseOneDBModule:Boolean;



    {$IFDEF USE_IDHTTPSERVERMODE}
    {$ELSE}
      kbmMWServer1: TkbmMWServer;
      kbmMWFilePool1: TkbmMWFilePool;
      {$IFDEF NO_HTTPSYSServerTransport}
      kbmMWTCPIPIndyServerTransport1: TkbmMWTCPIPIndyServerTransport;
      {$ELSE}
      kbmMWHTTPSysServerTransport1: TkbmMWHTTPSysServerTransport;
      {$ENDIF}
    {$ENDIF}

    //服务模块列表
    ServiceModuleList: TBaseList;
//    //服务端模块初始方法
//    FServiceModuleInitProcList: TServiceModuleInitProcList;


    //使用的数据库连接
    FDBModule: TBaseDatabaseModule;


  public

    //开放平台的应用列表
    AppList:TOpenPlatformAppList;

    //是否启用接口参数验签名
    IsEnableRestAPICheckSign:Boolean;
    //是否检查Header中的Key
    IsEnableRestAPICheckAccessToken:Boolean;
    IsNeedLoadAppList:Boolean;

//    NonceList:TStringList;
//    NonceListLock:TCriticalSection;
//    //上一次是什么时候清的
//    LastNoceListClearTime:TDateTime;
//    //上一次清的时候还剩多少,下一期清
//    LastNoceListCount:Integer;

    //用户令牌列表
    FUserAccessTokenList:TUserAccessTokenList;
    //白名单列表
    FIPWhiteList:TStringList;
  public

    //接口调用统计列表
    FAPICallStatisticsList:TAPICallStatisticsList;

    //当前接口总调用数
    SumCallCount:Integer;
    //无效的接口调用
    InvalidCallCount:Integer;



    //上次总调用数
    LastSumCallCount:Integer;
    //最高每秒并发
    MaxParallelCallCountPerSecond:Integer;
    //输出服务端状态的线程
    FServiceStatusOutputThread:TServiceStatusOutputThread;

//    {$IFDEF USE_IDHTTPSERVERMODE}
//    {$ELSE}
//    {$ENDIF}
    FOnGetCommandLineOutput: TGetCommandLineOutputEvent;
    procedure DoGetCommandLineOutput(ACommandLine:String;ATag:String;AOutput:String);
  public
    FRedis_Host:String;
    FRedis_Port:Integer;
//    FRedis_Password:String;
//    FRedis_dbIdx:Integer;
//    //有效期几秒
//    FTimerInval_VerifyExpire:Integer;
  public
    procedure Load;
    procedure Save;
  public
    //签名相关
    function GetAppSignType(AAppID:String):String;
    function GetAppSecret(AAppID:String):String;
    //更新开放平台的应用列表
    function SyncAppList(var ADesc:String):Boolean;
    //检测接口的签名
    function CheckInterfaceSign(ClientIdent: TkbmMWClientIdentity;ARequestTransportStream:IkbmMWCustomRequestTransportStream;AAPI:String;AUrlParams:String;var ADesc:String):Boolean;
    {$IFDEF USE_IDHTTPSERVERMODE}
    {$ELSE}
    procedure SyncAppListEvent(const AScheduledEvent:IkbmMWScheduledEvent);
    function CheckInterfaceSignByAppSecret(AApp:TOpenPlatformApp;AUrlParams:String;
                                            ASignType:string;
                                            ASign:String;
                                            AAppSecret:String;
                                            var ADesc:String;
                                            AOldQueryParams:TkbmMWHTTPQueryValues=nil
                                            ):Boolean;
    {$ENDIF}
    //返回数据
    function ReturnJson(AAppID:String;
                        ACode:Integer;
                        ADesc:String;
                        ADataJson:ISuperObject;
                        ADesc2:String='';
                        ADataJson2:ISuperObject=nil):ISuperObject;

  public
    function AddApp(ASQLDBHelper:TBaseDBHelper;AAppID:String;ARecordDataJsonObject:ISuperObject;copy_from_appid:String;var AError:String):Boolean;
    //从别的APP复制配置到新APP
    function CopyConfigFromApp(ASourceAppID:Integer;ADestAppID:Integer;ADestAppJson:ISuperObject;var ADesc:String):Boolean;
  public
    constructor Create; virtual;
    destructor Destroy;override;
  public
    FSerivceStartThread:TSerivceStartThread;
    FOnStartEnd:TServiceStartEndNotifyEvent;
    procedure Start;
    function DoStart(var AMessages:String): Boolean;
    function Stop: Boolean;
  public
    //Redis连接池
    function GetRedisClient:TRedisClient;
    procedure FreeRedisClient(ARedisClient:TRedisClient);

  public
    function ServerUrl:String;
    function DomainUrl:String;
    function FileManageDomainUrl:String;
    function ServerUploadUrl:String;
    function UserCenterServer:String;
    function CaptchaServer:String;
    function ContentCenterServer:String;
    function ScoreCenterServer:String;
    function ShopCenterServer:String;
    function PayCenterServer:String;

    procedure FixContentPicPath(AContentJson:ISuperObject);
  public
    function IsValidUserRestUrl:String;
    //查询验证码的接口地址
    function QueryCaptchaRestUrl:String;
    //发送验证码的接口地址
    function SendCaptchaRestUrl:String;
    //检查验证码的接口地址
    function CheckCaptchaRestUrl:String;
//    //发送通知给用户
//    function PushMessageToUser:String;
    //上传商品防伪码、积分兑换码Excel文件的接口地址
    function UploadExcelFile:String;

    //更新订单状态
    function UpdateOrderStateRestUrl:String;
    //添加订单跟踪状态记录
    function AddOrderStateTrackRestUrl:String;
    //商家中心订单完成接口
    function OrderCompletedRestUrl:String;
    //获取订单详情接口
    function GetOrderInfoRestUrl:String;


    //积分中心获取积分规则列表接口
    function GetRuleTypeListRestUrl:String;
    //积分中心操作用户积分接口
    function ChangeUserScoreRestUrl:String;
    //积分中心操作用户经验接口
    function ChangeUserExpRestUrl:String;

    //积分中心计算积分
    function GetUserScoreRestUrl:String;

    //支付中心操作用户余额接口
    function ChangeUserMoneyRestUrl:String;
//  public
//    //获取用户类型
//    function GetUserType(AAppID:String;
//                          AUserFID:String;
//                          AKey:String;
//                          var ACode:Integer;
//                          var ADesc:String;
//                          var ADataJson:ISuperObject;
//                          var AUserType:Integer):Boolean;
  end;









var
  //服务模块
  GlobalServiceProject:TServiceProject;

  //是否需要从Ini文件加载端口的配置,像汽修服务就不需要从配置中加载
  IsNeedLoadServiceProjectFromIni:Boolean;
  IsNeedSaveServiceProjectFromIni:Boolean;


var
  //REDIS默认的缓存时间
  REDIS_COMMON_TIMEOUT:Integer;//=10*60;
  //验证码
  CAPTCHA_REDIS_COMMON_TIMEOUT:Integer;//=1*60;


function RegisterServiceModule(AServiceModule: TServiceModule): Boolean;


implementation



//uses
//  uTableCommonRestCenter,
//  TableCommonRestService;



function GetGlobalServiceProject:TServiceProject;
begin
  if GlobalServiceProject=nil then
  begin
    GlobalServiceProject:=TServiceProject.Create
  end;
  Result:=GlobalServiceProject;
end;

function RegisterServiceModule(AServiceModule: TServiceModule): Boolean;
begin
  uBaseLog.HandleException(nil,'RegisterServiceModule '+AServiceModule.Name);
  AServiceModule.FServiceProject:=GetGlobalServiceProject;
  GetGlobalServiceProject.ServiceModuleList.Add(AServiceModule);
end;


{ TServiceProject }

function TServiceProject.AddApp(ASQLDBHelper:TBaseDBHelper;AAppID:String;ARecordDataJsonObject: ISuperObject;copy_from_appid:String;
  var AError: String): Boolean;
var
  ACode:Integer;
  ADesc:String;
  ADataJson:ISuperObject;

  ADesc2:String;
  ARecordDataJson:ISuperObject;
  AClientAppPackage:String;
begin
      Result:=False;

      //初始接口访问密钥
      ARecordDataJsonObject.I['is_enable_sign']:=1;
      ARecordDataJsonObject.S['sign_type']:='MD5';
      ARecordDataJsonObject.S['appsecret']:=CreateGUIDString();
      ARecordDataJsonObject.S['appsecret_xfapp']:=CreateGUIDString();





//      if not CommonRestServiceModule.AddRecord(
//          'app',
//          ASQLDBHelper,
//          AAppID,
//          ARecordDataJsonObject,
//          ACode,
//          ADesc,
//          ADataJson
//          ) then
//      begin
//        Exit;
//      end;



      //应用初始
      //初始包名
      AClientAppPackage:='';
      AClientAppPackage:='com.jinjie.appid'+IntToStr(ADataJson.I['fid']);
      if not ASQLDBHelper.SelfQuery('UPDATE tblapp SET client_android_package=:client_android_package,client_ios_package=:client_ios_package WHERE fid=:fid',
                                    ['client_android_package','client_ios_package','fid'],[AClientAppPackage,AClientAppPackage,ADataJson.I['fid']],
                                    asoExec) then
      begin
        //数据库连接失败或异常
        ADesc:='更新应用包名时'+'数据库连接失败或异常'+' '+ASQLDBHelper.LastExceptMessage;
        Exit;
      end;
      ADataJson.S['client_android_package']:=AClientAppPackage;
      ADataJson.S['client_ios_package']:=AClientAppPackage;



      if copy_from_appid<>'' then
      begin
        //复制配置,比如创圈客平台创建了一个社区应用,那么这个新建应用的配置可以直接从创圈客APP中复制,避免
        CopyConfigFromApp(StrToInt(copy_from_appid),ADataJson.I['fid'],ADataJson,ADesc2);
      end;


      Result:=True;

end;

function TServiceProject.AddOrderStateTrackRestUrl: String;
begin
  Result:=ShopCenterServer+'add_order_state_track';
end;

function TServiceProject.CaptchaServer: String;
begin
  Result:=ServerUrl+'captcha/';
end;

function TServiceProject.ChangeUserMoneyRestUrl: String;
begin
  Result:=PayCenterServer+'direct_oper_money';
end;

function TServiceProject.ChangeUserScoreRestUrl: String;
begin
  Result:=ScoreCenterServer+'direct_oper_score';
end;

function TServiceProject.ChangeUserExpRestUrl: String;
begin
  Result:=ScoreCenterServer+'direct_oper_exp';
end;

function TServiceProject.CheckCaptchaRestUrl: String;
begin
  Result:=CaptchaServer+'check_captcha';
end;

function TServiceProject.ReturnJson(
                                    AAppID:String;
                                    ACode:Integer;
                                    ADesc:String;
                                    ADataJson:ISuperObject;
                                    ADesc2:String;
                                    ADataJson2:ISuperObject):ISuperObject;
var
  ASign:String;
  ATimestamp:Integer;

  AApp:TOpenPlatformApp;
begin
  Result:=TSuperObject.Create;

  //返回的Json规范
  //Code是代码,200表示成功,400表示失败
  Result.I['Code']:=ACode;
  //Desc为返回的信息,比如操作***成功,***失败
  Result.S['Desc']:=ADesc;
  //Data则为返回的数据,比如***列表
  if ADataJson<>nil then
  begin
    Result.O['Data']:=ADataJson;
  end;




  if ADesc2<>'' then
  begin
    //Desc为返回的信息,比如操作***成功,***失败
    Result.S['Desc2']:=ADesc2;
    //Data则为返回的数据,比如***列表
    if ADataJson2<>nil then
    begin
      Result.O['Data2']:=ADataJson2;
    end;
  end;



  //加上时间戳
  ATimestamp:=DateTimeToUnix(now,false);//timeIntervalSince1970(Now);
  Result.I['Timestamp']:=ATimestamp;



  //判断是否需要签名
  //判断APP是否存在
  AApp:=Self.AppList.Find(AAppID);
  if AApp=nil then
  begin
    Exit;
  end;



  if AApp.is_enable_sign=0 then
  begin
      //该App不需要签名就能调用
      Exit;
  end;


  Result.S['SignType']:=AApp.sign_type;

  Result.S['Sign']:=SignParam(
                              ['code','desc','timestamp'],
                              [ACode,ADesc,ATimestamp],
                              AApp.sign_type,
                              AApp.appsecret_xfapp);


end;


function TServiceProject.CheckInterfaceSign(ClientIdent: TkbmMWClientIdentity;ARequestTransportStream:IkbmMWCustomRequestTransportStream;AAPI:String;AUrlParams: String;var ADesc: String): Boolean;
  {$IFDEF USE_IDHTTPSERVERMODE}
  {$ELSE}
var
  AQueryParams:TkbmMWHTTPQueryValues;
  I: Integer;
  sl:TStringList;
  AApp:TOpenPlatformApp;
  AAppID:String;
  ASignType:String;
  ASign:String;
  AServerSign:String;
  AUserAccessToken:TUserAccessToken;
  reqh:TkbmMWHTTPTransportStreamHelper;
  AKey:String;
  AClientIP:String;
  {$ENDIF}
begin

  {$IFDEF USE_IDHTTPSERVERMODE}
  {$ELSE}
  Result:=False;//内测阶段
  ADesc:='';


  //当前总调用数
  Inc(SumCallCount);




  if not IsEnableRestAPICheckSign and not IsEnableRestAPICheckAccessToken then
  begin
    Result:=True;
    Exit;
  end;


  //先判断白名单
  AClientIP:=ClientIdent.RemoteLocation;
  if AClientIP<>'' then
  begin
    I:=Pos(':',AClientIP);
    if I>0 then
    begin
      AClientIP:=Copy(AClientIP,1,I-1);
      if //(AClientIP='127.0.0.1') or
        (Self.FIPWhiteList.IndexOf(AClientIP)<>-1) then
      begin
        //在白名单里面,则不检测签名
        Result:=True;
        Exit;
      end;
    end;
  end;



  //判断有没有sign,signtype
  // Execute method.
  AQueryParams:=TkbmMWHTTPQueryValues.Create;
  try
      AQueryParams.AsString:=AUrlParams;



      if IsEnableRestAPICheckAccessToken and (AQueryParams.ValueByName['sign']='') then
      begin

          reqh:=TkbmMWHTTPTransportStreamHelper(ARequestTransportStream.Helper);
          AKey:=reqh.Header.ValueByName[CUSTROM_HEADER_ACCESS_TOKEN];

          if AKey='' then
          begin
            AKey:=AQueryParams.ValueByName['key'];
          end;

          //判断有没有sign
          if (AKey='')then
          begin
              Inc(InvalidCallCount);
              ADesc:='key参数不存在';
              Exit;
          end;

          AUserAccessToken:=Self.FUserAccessTokenList.Find(AKey);
          if AUserAccessToken=nil then
          begin
              Inc(InvalidCallCount);
              ADesc:='key:'+AKey+'无效或已过期';
              Exit;
          end;

          //有key就验证key,就不验证签名了
          Result:=True;
          Exit;
      end;



      if IsEnableRestAPICheckSign then
      begin
          //判断有没有appid
          if AQueryParams.ValueByName['appid']='' then
          begin
              ADesc:='appid参数不存在';
              //表示不签名
              Result:=False;
              Exit;


    //          //表示不签名
    //          Result:=True;
    //          Exit;
          end;
//          AAppID:='';
    //      TryStrToInt(AQueryParams.ValueByName['appid'],AAppID);
          AAppID:=AQueryParams.ValueByName['appid'];



          //判断是否需要签名
          //判断APP是否存在
          AApp:=Self.AppList.Find(AAppID);
          if AApp=nil then
          begin
            ADesc:='appid为'+(AAppID)+'的App不存在';
            Exit;
          end;








          if AApp.is_enable_sign=0 then
          begin
              //该App不需要签名就能调用
              Result:=True;
              Exit;
          end;




          //判断有没有sign
          if AQueryParams.ValueByName['sign']='' then
          begin
              Inc(InvalidCallCount);
              ADesc:='sign参数不存在';
              Exit;
          end;



          //判断有没有signtype
          ASignType:=AQueryParams.ValueByName['signtype'];
          if ASignType='' then
          begin
            ASignType:=AApp.sign_type;
          end;
//          if AQueryParams.ValueByName['signtype']='' then
          if ASignType='' then
          begin
              Inc(InvalidCallCount);
              ADesc:='sign_type不存在';
              Exit;
          end;



          ASign:=AQueryParams.ValueByName['sign'];



//          AAppID:=AQueryParams.ValueByName['appid'];
    //      if not TryStrToInt(AQueryParams.ValueByName['appid'],AAppID) then
    //      begin
    //          Inc(InvalidCallCount);
    //          ADesc:='appid参数不合法';
    //          Exit;
    //      end;





          //1是旋风OnLine项目所使用的签名方式
          if ASignType<>'' then
          begin
              //1是旋风OnLine项目所使用的签名方式

              //判断APP的私钥是否存在
              if not CheckInterfaceSignByAppSecret(AApp,AUrlParams,
                                                  ASignType,
                                                  ASign,
                                                  AApp.appsecret,
                                                  ADesc,
                                                  AQueryParams) then
              begin
                Exit;
              end;


          end;

      end;


      Result:=True;

  finally
    if not Result then
    begin
      uBaseLog.HandleException(nil,'TServiceProject.CheckInterfaceSign '+AAPI+' '+ADesc);
    end;
//    Result:=True;//内测阶段，只记录不开放
    FreeAndNil(AQueryParams);
  end;
  {$ENDIF}

  Result:=True;
end;

{$IFDEF USE_IDHTTPSERVERMODE}
{$ELSE}
function TServiceProject.CheckInterfaceSignByAppSecret(AApp:TOpenPlatformApp;AUrlParams,
  ASignType:string;
  ASign:String;
  AAppSecret: String;
  var ADesc: String;
  AOldQueryParams:TkbmMWHTTPQueryValues=nil): Boolean;
var
  AQueryParams:TkbmMWHTTPQueryValues;
  I: Integer;
  sl:TStringList;
  AAppID:String;
//  ASignType:String;
//  ASign:String;
  AServerSign:String;
  ATimestamp:Int64;
begin
  Result:=False;
  ADesc:='';



  //判断有没有sign,signtype
  // Execute method.
  AQueryParams:=AOldQueryParams;
  if AOldQueryParams=nil then
  begin
    AQueryParams:=TkbmMWHTTPQueryValues.Create;
  end;
  try
      if AOldQueryParams=nil then
      begin
        AQueryParams.AsString:=AUrlParams;
      end;

//      //判断有没有appid
//      if AQueryParams.ValueByName['appid']='' then
//      begin
//          Inc(InvalidCallCount);
//          ADesc:='appid参数不存在';
//          Exit;
//      end;



      //判断有没有timestamp
      if AQueryParams.ValueByName['timestamp']='' then
      begin
          //老版本的接口
          //ADesc:='timestamp参数不存在';
          //Exit;
      end
      else
      begin

          ATimestamp:=0;
          TryStrToInt64(AQueryParams.ValueByName['timestamp'],ATimestamp);
          //超过30秒就算是非法的请求了
          //if ABS(ATimestamp-timeIntervalSince1970(Now))>5*60 the//1609312837 1609312813
          if ABS(ATimestamp-DateTimeToUnix(now,false))>5*60 then//1609312837 1609312813
          begin
            Inc(InvalidCallCount);
            ADesc:='timestamp超时,请求已过期';
            Exit;
          end;

      end;



      //nonce有锁，影响性能
//      //判断有没有nonce随机数
//      if AQueryParams.ValueByName['nonce']='' then
//      begin
//          //老版本的接口
//          //ADesc:='nonce参数不存在';
//          //Exit;
//      end
//      else
//      begin
//
//
//          //判断有没有重复
//          if NonceList.IndexOf(AQueryParams.ValueByName['nonce'])<>-1 then
//          begin
//            //重复了
//            Inc(InvalidCallCount);
//            ADesc:='nonce参数不能重复';
//            Exit;
//          end;
//          NonceListLock.Enter;
//          try
//            NonceList.Add(AQueryParams.ValueByName['nonce']);
//
//            //删除过期的,一方面这个随机数只要保证90秒之内的请求不要重复就可以了
//            //超过90秒由timestamp会检测
//            if DateUtils.SecondsBetween(LastNoceListClearTime,Now)>5*60 then
//            begin
//              //上一次是什么时候清的
//              LastNoceListClearTime:=Now;
//              //清掉上一90秒的
//              for I := 0 to LastNoceListCount-1 do
//              begin
//                NonceList.Delete(0);
//              end;
//              //上一次清的时候还剩多少,下一期清
//              LastNoceListCount:=NonceList.Count;
//            end;
//
//          finally
//            NonceListLock.Leave;
//          end;
//
//      end;




//      //判断有没有sign
//      if AQueryParams.ValueByName['sign']='' then
//      begin
//          Inc(InvalidCallCount);
//          ADesc:='sign参数不存在';
//          Exit;
//      end;


//      ASignType:=AQueryParams.ValueByName['signtype'];
//      if ASignType='' then
//      begin
//        ASignType:=Self.AppList.Find(AQueryParams.ValueByName['appid']).sign_type;
//      end;
////      //判断有没有signtype
////      if AQueryParams.ValueByName['signtype']='' then
//      if ASignType='' then
//      begin
//          Inc(InvalidCallCount);
//          ADesc:='sign_type不存在';
//          Exit;
//      end;



//      ASign:=AQueryParams.ValueByName['sign'];



//      AAppID:=AQueryParams.ValueByName['appid'];
//      if not TryStrToInt(AQueryParams.ValueByName['appid'],AAppID) then
//      begin
//          Inc(InvalidCallCount);
//          ADesc:='appid参数不合法';
//          Exit;
//      end;




//      //1是旋风OnLine项目所使用的签名方式
//      if ASignType=CONST_REST_SIGNTYPE_XFAPP then
//      begin
//          //1是旋风OnLine项目所使用的签名方式
//
//          //判断APP的私钥是否存在
//          if AAppSecret='' then
//          begin
//            Inc(InvalidCallCount);
//            ADesc:='appid为'+(AAppID)+'的私钥appsecrect为空';
//            Exit;
//          end;
//
//
//          sl:=TStringList.Create;
//          try
//
//              //开始验签
//              for I := 0 to AQueryParams.Count-1 do
//              begin
//
//                if AQueryParams[I].Name<>'sign' then
//                begin
//                  sl.Values[AQueryParams[I].Name]:=AQueryParams[I].Value;
//                end;
//              end;
//
//              //生成签名
//              AServerSign:=uModule_InterfaceSign.LoadSignAsStringList(sl,AAppSecret);
//
//
//              //比对
//              if ASign<>AServerSign then
//              begin
//                Inc(InvalidCallCount);
//                ADesc:='签名不一致,请升级新版本';
//                Exit;
//              end;
//
//
//          finally
//            FreeAndNil(sl);
//          end;
//
//      end
//      else
      if ASignType=CONST_REST_SIGNTYPE_MD5 then
      begin
          //1是旋风OnLine项目所使用的签名方式

          //判断APP的私钥是否存在
          if AAppSecret='' then
          begin
            Inc(InvalidCallCount);
            ADesc:='appid为'+(AAppID)+'的私钥appsecrect为空';
            Exit;
          end;


          sl:=TStringList.Create;
          try

              //开始验签
              for I := 0 to AQueryParams.Count-1 do
              begin

                if AQueryParams[I].Name<>'sign' then
                begin
                  sl.Values[AQueryParams[I].Name]:=AQueryParams[I].Value;
                end;
              end;

              //生成签名
              AServerSign:=uModule_InterfaceSign.LoadMD5SignAsStringList(sl,AAppSecret);


              //比对
              if not SameText(ASign,AServerSign) then
              begin
                Inc(InvalidCallCount);
                ADesc:='签名不一致';
                Exit;
              end;


          finally
            FreeAndNil(sl);
          end;

      end
      else
      begin
          Inc(InvalidCallCount);
          ADesc:='不支持该签名方法'+ASignType;
          Exit;
      end;


  finally
    if AOldQueryParams=nil then
    begin
        FreeAndNil(AQueryParams);
    end;
  end;


  Result:=True;

end;
{$ENDIF}



function TServiceProject.ContentCenterServer: String;
begin
  Result:=ServerUrl+'contentcenter/';
end;

function TServiceProject.CopyConfigFromApp(ASourceAppID, ADestAppID: Integer;ADestAppJson:ISuperObject;
  var ADesc: String): Boolean;
var
  I: Integer;
  ASubDesc:String;
begin

    Result:=True;


    //服务模块列表
    for I := 0 to ServiceModuleList.Count-1 do
    begin

      ASubDesc:='';

      if not TServiceModule(ServiceModuleList[I]).CopyConfigFromApp(ASourceAppID,ADestAppID,ADestAppJson,ASubDesc) then
      begin
        Result:=False;
      end;

      if ASubDesc<>'' then
      begin
        ADesc:=ADesc+',';
      end;
      ADesc:=ADesc+ASubDesc;

    end;


end;

constructor TServiceProject.Create;
begin
  Name := ('默认服务');

  Port:=10000;
  SSLPort:=0;
  Domain:='www.orangeui.cn';


  FRedis_Host:='127.0.0.1';
  FRedis_Port:=6379;
//  FRedis_Password:='';
//  FRedis_dbIdx:=0;
//  //有效期几秒
//  FTimerInval_VerifyExpire:=;


  //是否需要Redis
  IsNeedRedis:=True;


  //服务包含的模块
  ServiceModuleList := TBaseList.Create(ooReference);
  AppList:=TOpenPlatformAppList.Create();


  {$IFDEF USE_IDHTTPSERVERMODE}
  //数据库模块
  FDBModule := TFMXUnidacDatabaseModule.Create;
  {$ELSE}
  //数据库模块
  FDBModule := TDatabaseModule.Create;
  FDBModule.DBConfigFileName:='ProgramFrameworkManageDBConfig.ini';
  {$ENDIF}


//  NonceList:=TStringList.Create;
//  NonceListLock:=TCriticalSection.Create;

  FUserAccessTokenList:=TUserAccessTokenList.Create();
//  FServiceModuleInitProcList:=TServiceModuleInitProcList.Create;

  //接口调用统计列表
  FAPICallStatisticsList:=TAPICallStatisticsList.Create();
  FIPWhiteList:=TStringList.Create;
end;

destructor TServiceProject.Destroy;
//var
//  I: Integer;
//  AServiceModule:TServiceModule;
begin

//  for I := 0 to ServiceModuleList.Count-1 do
//  begin
//    AServiceModule:=TServiceModule(ServiceModuleList[I]);
//    FreeAndNil(AServiceModule);
//  end;

//  FreeAndNil(FServiceModuleInitProcList);


  Stop;


  {$IFDEF USE_IDHTTPSERVERMODE}
  {$ELSE}
    {$IFDEF NO_HTTPSYSServerTransport}
    FreeAndNil(kbmMWTCPIPIndyServerTransport1);
    {$ELSE}
    FreeAndNil(kbmMWHTTPSysServerTransport1);
    {$ENDIF}
    FreeAndNil(kbmMWServer1);
    FreeAndNil(kbmMWFilePool1);
  {$ENDIF}

  FreeAndNil(FDBModule);

  FreeAndNil(ServiceModuleList);
  FreeAndNil(AppList);



  FreeAndNil(FUserAccessTokenList);

//  FreeAndNil(NonceList);
//  FreeAndNil(NonceListLock);

  FreeAndNil(FAPICallStatisticsList);

  FreeAndNil(FIPWhiteList);
  Inherited;
end;

//{$IFDEF USE_IDHTTPSERVERMODE}
//{$ELSE}
procedure TServiceProject.DoGetCommandLineOutput(ACommandLine, ATag,
  AOutput: String);
begin
  if Assigned(FOnGetCommandLineOutput) then
  begin
    FOnGetCommandLineOutput(ACommandLine,ATag,AOutput);
  end;
end;

function TServiceProject.DomainUrl: String;
begin
  Result:='http://'+Domain+':'+IntToStr(Self.Port)+'/';
end;

function TServiceProject.FileManageDomainUrl: String;
begin
  Result:=DomainUrl+'filemanage/';
end;

procedure TServiceProject.FixContentPicPath(AContentJson: ISuperObject);
 begin
  if (AContentJson.S['pic1_path']<>'') and not IsUrl(AContentJson.S['pic1_path']) then
  begin
    AContentJson.S['pic1_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic1_path'],'\','/');
  end;
  if (AContentJson.S['pic2_path']<>'') and not IsUrl(AContentJson.S['pic2_path']) then
  begin
    AContentJson.S['pic2_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic2_path'],'\','/');
  end;
  if (AContentJson.S['pic3_path']<>'') and not IsUrl(AContentJson.S['pic3_path']) then
  begin
    AContentJson.S['pic3_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic3_path'],'\','/');
  end;
  if (AContentJson.S['pic4_path']<>'') and not IsUrl(AContentJson.S['pic4_path']) then
  begin
    AContentJson.S['pic4_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic4_path'],'\','/');
  end;
  if (AContentJson.S['pic5_path']<>'') and not IsUrl(AContentJson.S['pic5_path']) then
  begin
    AContentJson.S['pic5_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic5_path'],'\','/');
  end;
  if (AContentJson.S['pic6_path']<>'') and not IsUrl(AContentJson.S['pic6_path']) then
  begin
    AContentJson.S['pic6_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic6_path'],'\','/');
  end;
  if (AContentJson.S['pic7_path']<>'') and not IsUrl(AContentJson.S['pic7_path']) then
  begin
    AContentJson.S['pic7_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic7_path'],'\','/');
  end;
  if (AContentJson.S['pic8_path']<>'') and not IsUrl(AContentJson.S['pic8_path']) then
  begin
    AContentJson.S['pic8_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic8_path'],'\','/');
  end;
  if (AContentJson.S['pic9_path']<>'') and not IsUrl(AContentJson.S['pic9_path']) then
  begin
    AContentJson.S['pic9_path']:=GlobalServiceProject.FileManageDomainUrl+ReplaceStr(AContentJson.S['pic9_path'],'\','/');
  end;

end;

procedure TServiceProject.FreeRedisClient(ARedisClient: TRedisClient);
begin
  {$IFDEF HAS_REDIS}
  if IsNeedRedis then GetGlobalRedisClientPool.FreeCustomObject(ARedisClient);
  {$ENDIF}
end;

//{$ENDIF}

function TServiceProject.GetAppSecret(AAppID: String): String;
var
  AApp:TOpenPlatformApp;
begin
  Result:='';

  AApp:=Self.AppList.Find(AAppID);
  if AApp=nil then
  begin
//    ADesc:='appid为'+IntToStr(AAppID)+'的App不存在';
    Exit;
  end;
  if AApp.is_enable_sign=0 then
  begin
      //该App不需要签名就能调用
      Exit;
  end;

//  if AApp.sign_type=CONST_REST_SIGNTYPE_XFAPP then
//  begin
    Result:=AApp.appsecret_xfapp;
//  end
//  else
//  begin
//
//  end;

end;

function TServiceProject.GetAppSignType(AAppID: String): String;
var
  AApp:TOpenPlatformApp;
begin
  Result:='';

  AApp:=Self.AppList.Find(AAppID);
  if AApp=nil then
  begin
//    ADesc:='appid为'+IntToStr(AAppID)+'的App不存在';
    Exit;
  end;
  if AApp.is_enable_sign=0 then
  begin
      //该App不需要签名就能调用
      Exit;
  end;

  Result:=AApp.sign_type;

end;

function TServiceProject.GetOrderInfoRestUrl: String;
begin
  Result:=ShopCenterServer+'user_get_order';
end;

//function TServiceProject.GetRedisOptClass: TRedisOptClass;
//begin
//
//end;



function TServiceProject.GetRedisClient: TRedisClient;
begin
//    FRedis_Host:=ARedis_Host;
//    FRedis_Port:=ARedis_Port;
//    FRedis_Password:=ARedis_Password;
//    FRedis_dbIdx:=ARedis_dbIdx;
//    FTimerInval_VerifyExpire:=ATimerInval_VerifyExpire;


//    Result := TRedisClient.Create(FRedis_Host, FRedis_Port);
//    Result.Connect;
////    if FRedis_Password<>'' then
////    begin
////      FRedisClient.AUTH(FRedis_Password);
////    end;
//    Result.SELECT(0);    // 选择库，默认有16个（0..15）
  Result:=nil;
  {$IFDEF HAS_REDIS}
  if IsNeedRedis then Result:=TRedisClient(GetGlobalRedisClientPool.GetCustomObject);
  {$ENDIF}
end;

function TServiceProject.GetRuleTypeListRestUrl: String;
begin
  Result:=ScoreCenterServer+'get_app_score_rule_list';
end;

function TServiceProject.GetUserScoreRestUrl: String;
begin
  Result:=ScoreCenterServer+'calc_gift_score';
end;

//function TServiceProject.GetUserType(AAppID:String;
//  AUserFID: String; AKey: String;
//  var ACode: Integer; var ADesc: String; var ADataJson: ISuperObject;
//  var AUserType: Integer): Boolean;
//begin
//  Result:=False;
//  AUserType:=0;
//
//  //接口验证用户是否合法
//  if not SimpleCallAPI(Self.UserCenterServer+'get_user_type',
//                              nil,
//                              '',
//                              ['appid',
//                              'user_fid',
//                              'key'],
//                              [AAppID,
//                              AUserFID,
//                              AKey],
//                              ACode,
//                              ADesc,
//                              ADataJson,
//                              Self.GetAppSignType(AAppID),
//                              Self.GetAppSecret(AAppID)
//                              ) then
//  begin
//    Exit;
//  end;
//  //'{"user_type":1}'
//  AUserType:=ADataJson.I['user_type'];
//  Result:=True;
//end;

function TServiceProject.IsValidUserRestUrl: String;
begin
  Result:=UserCenterServer+'is_valid_user';
end;

procedure TServiceProject.Load;
var
  AIniFile:TIniFile;
begin
  uBaseLog.HandleException(nil,'TServiceProject.Load');

  //白名单列表
  if FileExists(GetApplicationPath+'IPWhiteList.txt') then
  begin
    FIPWhiteList.LoadFromFile(GetApplicationPath+'IPWhiteList.txt');
  end;

  if IsNeedLoadServiceProjectFromIni and FileExists(GetApplicationPath+'Config.ini') then
  begin
    AIniFile:=TIniFile.Create(GetApplicationPath+'Config.ini'{$IFDEF MSWINDOWS}{$ELSE},TEncoding.UTF8{$ENDIF});
    try

      Self.Name:=AIniFile.ReadString('','Name',Name);
      if AIniFile.ReadString('','ServiceName',ServiceName)<>'' then
      begin
        Self.ServiceName:=AIniFile.ReadString('','ServiceName',ServiceName);
      end;
      if AIniFile.ReadString('','ServiceDisplayName',ServiceDisplayName)<>'' then
      begin
        Self.ServiceDisplayName:=AIniFile.ReadString('','ServiceDisplayName',ServiceDisplayName);
      end;

      Self.Port:=AIniFile.ReadInteger('','Port',Port);
      Self.SSLPort:=AIniFile.ReadInteger('','SSLPort',SSLPort);
      Self.Domain:=AIniFile.ReadString('','Domain','www.orangeui.cn');


      Self.FRedis_Host:=AIniFile.ReadString('','Redis_Host','127.0.0.1');
      Self.FRedis_Port:=AIniFile.ReadInteger('','Redis_Port',6379);
      {$IFDEF USE_IDHTTPSERVERMODE}
      {$ELSE}
        {$IFDEF HAS_REDIS}
          if IsNeedRedis then
          begin
            GetGlobalRedisClientPool.FRedis_Host:=FRedis_Host;//'127.0.0.1';
            GetGlobalRedisClientPool.FRedis_Port:=FRedis_Port;//6379;
          //  GetGlobalSQLDBHelperPool.FRedis_Password:='';
          //  GetGlobalSQLDBHelperPool.FRedis_dbIdx:=0;
          //  //有效期几秒
          //  GetGlobalSQLDBHelperPool.FTimerInval_VerifyExpire:=;
          end;
        {$ENDIF}
      {$ENDIF}


    finally
      FreeAndNil(AIniFile);
    end;
  end;
end;

function TServiceProject.OrderCompletedRestUrl: String;
begin
  Result:=ShopCenterServer+'order_completed';
end;

function TServiceProject.PayCenterServer: String;
begin
  Result:=ServerUrl+'paycenter/';
end;

//function TServiceProject.PushMessageToUser: String;
//begin
//  Result:=ServerUrl+'pushmanage/push_message_to_user';
//end;

function TServiceProject.QueryCaptchaRestUrl: String;
begin
  Result:=CaptchaServer+'query_captcha';
end;

procedure TServiceProject.Save;
var
  AIniFile:TIniFile;
begin
  uBaseLog.HandleException(nil,'TServiceProject.Save');



  AIniFile:=TIniFile.Create(GetApplicationPath+'Config.ini'{$IFDEF MSWINDOWS}{$ELSE},TEncoding.UTF8{$ENDIF});
  try

    AIniFile.WriteString('','Name',Self.Name);
    AIniFile.WriteString('','ServiceName',Self.ServiceName);
    AIniFile.WriteString('','ServiceDisplayName',Self.ServiceDisplayName);
    AIniFile.WriteInteger('','Port',Self.Port);
    AIniFile.WriteInteger('','SSLPort',Self.SSLPort);
    AIniFile.WriteString('','Domain',Self.Domain);

  finally
    FreeAndNil(AIniFile);
  end;

end;

function TServiceProject.ScoreCenterServer: String;
begin
  Result:=ServerUrl+'scorecenter/';
end;

function TServiceProject.SendCaptchaRestUrl: String;
begin
  Result:=CaptchaServer+'send_captcha';
end;

function TServiceProject.ServerUploadUrl: String;
begin
  Result:='http://127.0.0.1:'+IntToStr(Self.Port+1)+'/';
end;

function TServiceProject.ServerUrl: String;
begin
  Result:='http://127.0.0.1:'+IntToStr(Self.Port)+'/';
end;

function TServiceProject.ShopCenterServer: String;
begin
  Result:=ServerUrl+'shopcenter/';
end;

function TServiceProject.DoStart(var AMessages:String): Boolean;
var
  I: Integer;
  AServiceModule: TServiceModule;
  AError:String;
//  AMessages:String;
//var
//   sd:TkbmMWHTTPServiceDefinition;
{$IFDEF USE_IDHTTPSERVERMODE}
{$ELSE}
//var
//  sd: TKbmMWCustomServiceDefinition;
//  AServiceList:TList<TkbmMWCustomServiceDefinition>;
  AIdSocketHandle:TIdSocketHandle;
{$ENDIF}
begin
  uBaseLog.HandleException(nil,'TServiceProject.DoStart Begin');


  Result := False;


  //因为服务启动的时候，SQLServer服务不一定已经启动,所以要重复启动


  {$IFDEF MSWINDOWS}
  CoInitializeEx(nil,COINIT_MULTITHREADED);
  {$ENDIF}
  try

    try


      {$IFDEF USE_IDHTTPSERVERMODE}
      {$ELSE}
          if kbmMWServer1=nil then
          begin
            kbmMWServer1 := TkbmMWServer.Create(nil);
            kbmMWServer1.ShutdownWait:=0;

            {$IFDEF NO_HTTPSYSServerTransport}
            kbmMWTCPIPIndyServerTransport1:=TkbmMWTCPIPIndyServerTransport.Create(nil);
            kbmMWTCPIPIndyServerTransport1.Server := kbmMWServer1;
            kbmMWTCPIPIndyServerTransport1.Enabled:=True;
            {$ELSE}
            kbmMWHTTPSysServerTransport1 := TkbmMWHTTPSysServerTransport.Create(nil);
            kbmMWHTTPSysServerTransport1.Server := kbmMWServer1;
            kbmMWHTTPSysServerTransport1.Enabled:=True;
            {$ENDIF}


            kbmMWFilePool1:=TkbmMWFilePool.Create(nil);


            //自动注册，全部放在这里，先注册，因为后右文件服务要修改ServiceDefinition
            kbmMWServer1.AutoRegisterServices;

          end;


          uBaseLog.HandleException(nil,'TServiceProject.Start ServiceModuleList.Count='+IntToStr(ServiceModuleList.Count));


      {$ENDIF}


      //所有模块使用同一个数据库连接
      //先启动这个数据库连接，因为其他模块可能需要使用数据库连接查询一些东西
      if Self.IsUseOneDBModule then
      begin
          AError:='';
          if not FDBModule.DoPrepareStart(AError) then
          begin
              AMessages:='FDBModule.DoPrepareStart '+AMessages+AError+#13#10;
              Exit;
          end;
      end;


      //取到开放平台的APP列表
      //顺序不能换
      if //IsEnableRestAPICheckSign or
        IsNeedLoadAppList then
      begin
          //查询所有App列有
          AError:='';
          if not FDBModule.DoPrepareStart(AError) then
          begin
              AMessages:='FDBModule.DoPrepareStart '+AMessages+AError+#13#10;
              Exit;
          end
          else
          begin
              AppList.Clear();

              if not Self.SyncAppList(AError) then
              begin
                AMessages:='SyncAppList '+AMessages+AError+#13#10;
                Exit;
              end;

          end;
      end;



      //启动各个服务模块
      AMessages:='';
      for I := 0 to Self.ServiceModuleList.Count - 1 do
      begin
          //注册
          AServiceModule := TServiceModule(ServiceModuleList[I]);

          AServiceModule.DoPrepareStop;
          AServiceModule.IsStarted:=False;

          //连接数据库等初始
          AError:='';
          if not AServiceModule.IsStarted and not AServiceModule.DoPrepareStart(AError) then
          begin
              AMessages:=AServiceModule.Name+' '+AMessages+AError+#13#10;
              //如果启动失败,不退出
              Exit;
          end
          else
          begin
              AServiceModule.IsStarted:=True;
          end;
      end;




      if AMessages<>'' then
      begin
        //初始模块失败
        {$IFDEF MSWINDOWS}
        //ShowMessage(AMessages);
        {$ENDIF}

        uBaseLog.HandleException(nil,'TServiceProject.DoStart '+AMessages);
        Exit;
      end;





      {$IFDEF USE_IDHTTPSERVERMODE}
      {$ELSE}



            {$IFDEF NO_HTTPSYSServerTransport}
              kbmMWTCPIPIndyServerTransport1.Bindings.Clear;
              AIdSocketHandle:=kbmMWTCPIPIndyServerTransport1.Bindings.Add;
              AIdSocketHandle.IP:='0.0.0.0';
              AIdSocketHandle.Port:=Port;//+3;
        //      AIdSocketHandle.Port:=Port+3;
              kbmMWTCPIPIndyServerTransport1.StreamFormat:='REST';
            {$ELSE}
        //      //使用设置的端口号
        //      kbmMWHTTPSysServerTransport1.URLs.Clear;
        //      kbmMWHTTPSysServerTransport1.URLs.Add('http://+:' + IntToStr(Port) + '/');
              //使用设置的端口号
              kbmMWHTTPSysServerTransport1.URLs.Clear;
              kbmMWHTTPSysServerTransport1.URLs.Add('http://+:' + IntToStr(Port) + '/');
            {$ENDIF}


              //SSL
              if SSLPort<>0 then
              begin
                  {$IFDEF NO_HTTPSYSServerTransport}
                  {$ELSE}
                  //需要SSL
                  if Port=10000 then
                  begin
                    kbmMWHTTPSysServerTransport1.URLs.Add('https://+:' + IntToStr(SSLPort) +'/');
                  end
                  else
                  begin
                    kbmMWHTTPSysServerTransport1.URLs.Add('https://+:' + IntToStr(Port+443) +'/');
                  end;
                  {$ENDIF}

              end;




              //启动服务
              //提供数据服务
              kbmMWServer1.Active := True;


        //      //定时更新AppList
        //      Scheduler
        //          .Schedule(SyncAppListEvent)
        //          .NamedAs('SyncAppListEvent')
        ////          .Synchronized
        //          //每五分钟
        //          .EveryMSecond(5*60)
        //          //指任务的精度类型，可忽略
        //          .Relaxed
        //          //第一次执行的延时
        //          .DelayInitial(60)
        //          //
        //          .Active:=True;

              FServiceStatusOutputThread:=TServiceStatusOutputThread.Create(False,Self);



      {$ENDIF}


      Result := True;



      //各个服务模块启动后
      for I := 0 to Self.ServiceModuleList.Count - 1 do
      begin
          AServiceModule := TServiceModule(ServiceModuleList[I]);

          AServiceModule.DoAfterStart;
      end;





    except
      on E:Exception do
      begin
        AMessages:=E.Message;
        uBaseLog.HandleException(E,'TServiceProject.Start');
      end;
    end;


  finally
    {$IFDEF MSWINDOWS}
    CoUnInitialize;
    {$ENDIF}


    if Assigned(FOnStartEnd) then
    begin
      FOnStartEnd(Self,Result,AMessages);
    end;

    uBaseLog.HandleException(nil,'TServiceProject.Start End');
  end;

end;

procedure TServiceProject.Start;
begin
  uBaseLog.HandleException(nil,'TServiceProject.Start Begin');

  if FSerivceStartThread<>nil then
  begin
    FSerivceStartThread.Terminate;
    FSerivceStartThread.WaitFor;
    FreeAndNil(FSerivceStartThread);
  end;
  FSerivceStartThread:=TSerivceStartThread.Create(False,Self);


  uBaseLog.HandleException(nil,'TServiceProject.Start End');

end;

function TServiceProject.Stop: Boolean;
var
  I: Integer;
  AStartTime:TDateTime;
  AServiceModule: TServiceModule;
begin
  Result:=False;

  uBaseLog.HandleException(nil,'TServiceProject.Stop Begin ');

  if FSerivceStartThread<>nil then
  begin
    FSerivceStartThread.Terminate;
    FSerivceStartThread.WaitFor;
    FreeAndNil(FSerivceStartThread);
  end;


  if FServiceStatusOutputThread<>nil then
  begin
    FServiceStatusOutputThread.Terminate;
    FServiceStatusOutputThread.WaitFor;
    FreeAndNil(FServiceStatusOutputThread);
  end;


  {$IFDEF USE_IDHTTPSERVERMODE}
  {$ELSE}
  //if (kbmMWServer1=nil) or not kbmMWServer1.Active then Exit;
  {$ENDIF}


  {$IFDEF MSWINDOWS}
  CoInitializeEx(nil,COINIT_MULTITHREADED);
  {$ENDIF}
  try


      //停止各个模块
      for I := 0 to Self.ServiceModuleList.Count - 1 do
      begin
        AServiceModule := TServiceModule(ServiceModuleList[I]);

        if AServiceModule.IsStarted then
        begin
          AServiceModule.IsStarted:=False;

          AStartTime:=Now;
          uBaseLog.HandleException(nil,AServiceModule.ClassName+' DoPrepareStop Begin ');
          //断开数据库连接等停止
          AServiceModule.DoPrepareStop;

          uBaseLog.HandleException(nil,AServiceModule.ClassName+' DoPrepareStop End 耗时'+IntToStr(DateUtils.SecondsBetween(Now,AStartTime))+'秒');

        end;

      end;





      {$IFDEF USE_IDHTTPSERVERMODE}
      {$ELSE}

        AStartTime:=Now;
        uBaseLog.HandleException(nil,'kbmMWServer1.Stop Begin ');
        //停止服务
        try
          if kbmMWServer1.Active then
          begin
            kbmMWServer1.Active := False;
          end;
  //        kbmMWServer1.Shutdown;
  //
  //        kbmMWServer1.ShutdownWait;


          {$IFDEF NO_HTTPSYSServerTransport}
          kbmMWTCPIPIndyServerTransport1.Enabled:=False;
          {$ELSE}
          kbmMWHTTPSysServerTransport1.Enabled:=False;
          {$ENDIF}


        except
          on E:Exception do
          begin
            uBaseLog.HandleException(E,'kbmMWServer1.Stop ');
          end;
        end;
        uBaseLog.HandleException(nil,'kbmMWServer1.Stop End 耗时'+IntToStr(DateUtils.SecondsBetween(Now,AStartTime))+'秒');


      {$ENDIF}




      //不需要了
//      {$IFDEF USE_IDHTTPSERVERMODE}
//      {$ELSE}
//      kbmMWServer1.UnregisterServices;
//      {$ENDIF}

      Result := True;

  finally
    {$IFDEF MSWINDOWS}
    CoUnInitialize;
    {$ENDIF}
  end;
  uBaseLog.HandleException(nil,'TServiceProject.Stop End ');
end;

function TServiceProject.SyncAppList(var ADesc:String):Boolean;
var
  ASQLDBHelper:TBaseDBHelper;
  AApp:TOpenPlatformApp;
begin
    Result:=False;
    {$IFDEF USE_IDHTTPSERVERMODE}
    {$ELSE}

    if not FDBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
    begin
      Exit;
    end;
    try
        if not ASQLDBHelper.SelfQuery('SELECT * FROM tblapp',[],[],asoOpen) then
        begin
          ADesc:='数据库连接失败或异常'+' '+ASQLDBHelper.LastExceptMessage;
          Exit;
        end;


        while not ASQLDBHelper.Query.Eof do
        begin
          AApp:=AppList.Find(IntToStr(ASQLDBHelper.Query.FieldByName('fid').AsInteger));
          if AApp=nil then
          begin
            AApp:=TOpenPlatformApp.Create;
            AppList.Add(AApp);
          end;

          AApp.LoadFromDataset(ASQLDBHelper.Query);

          ASQLDBHelper.Query.Next;
        end;

    finally
      FDBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;

    {$ENDIF}
    Result:=True;
end;

{$IFDEF USE_IDHTTPSERVERMODE}
{$ELSE}
procedure TServiceProject.SyncAppListEvent(const AScheduledEvent: IkbmMWScheduledEvent);
var
  ADesc:String;
begin
  SyncAppList(ADesc);
end;
{$ENDIF}


function TServiceProject.UpdateOrderStateRestUrl: String;
begin
  Result:=ShopCenterServer+'update_order_state';
end;

function TServiceProject.UploadExcelFile: String;
begin
  Result:=ServerUploadUrl+'upload';
end;

function TServiceProject.UserCenterServer: String;
begin
  Result:=ServerUrl+'usercenter/';
end;

{ TKbmMWServiceModule }

function TKbmMWServiceModule.CopyConfigFromApp(ASourceAppID,
  ADestAppID: Integer;ADestAppJson:ISuperObject;var ADesc:String): Boolean;
var
  ASQLDBHelper:TBaseDBHelper;
begin
  if not Self.DBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
  begin
    Exit;
  end;
  try

      Result:=CustomCopyConfigFromApp(ASQLDBHelper,ASourceAppID,ADestAppID,ADestAppJson,ADesc);

  finally
    Self.DBModule.FreeDBHelperToPool(ASQLDBHelper);
  end;
end;

constructor TKbmMWServiceModule.Create;
begin
  {$IFDEF USE_IDHTTPSERVERMODE}
  //数据库模块
  FDBModule := TFMXUnidacDatabaseModule.Create;
  {$ELSE}
  //数据库模块
  FDBModule := TDatabaseModule.Create;
  {$ENDIF}
end;

function TKbmMWServiceModule.CustomCopyConfigFromApp(
  ASQLDBHelper: TBaseDBHelper; ASourceAppID, ADestAppID: Integer;ADestAppJson:ISuperObject;var ADesc:String): Boolean;
begin
  Result:=True;
end;

function TKbmMWServiceModule.DBModule: TBaseDatabaseModule;
begin
  if (FServiceProject<>nil) and (FServiceProject.IsUseOneDBModule) then
  begin
    Result:=FServiceProject.FDBModule;
  end
  else
  begin
    Result:=FDBModule;
  end;
end;

destructor TKbmMWServiceModule.Destroy;
begin
  FreeAndNil(FDBModule);
  Inherited;
end;

function TKbmMWServiceModule.DoPrepareStart(var AError:String): Boolean;
begin
  Result := False;

  Inherited;

  if (FServiceProject<>nil) and (FServiceProject.IsUseOneDBModule) then
  begin
    //所有模块使用同一个数据库连接
    Result:=True;
  end
  else
  begin
    //连接数据库
    Result := DBModule.DoPrepareStart(AError);
  end;


  if Result then
  begin
    uBaseLog.HandleException('TKbmMWServiceModule.DoPrepareStart '+Name+'模块启动成功');
  end
  else
  begin
    uBaseLog.HandleException('TKbmMWServiceModule.DoPrepareStart '+Name+'模块启动失败');
  end;
end;

function TKbmMWServiceModule.DoPrepareStop: Boolean;
begin
  Result := False;

  //断开数据库
  Result := DBModule.DoPrepareStop;
end;

{ TServiceModule }

function TServiceModule.CopyConfigFromApp(ASourceAppID, ADestAppID: Integer;ADestAppJson:ISuperObject;
  var ADesc: String): Boolean;
begin
  Result:=True;
end;

constructor TServiceModule.Create;
begin
end;

procedure TServiceModule.DoAfterStart;
begin

end;

function TServiceModule.DoPrepareStart(var AError: String): Boolean;
begin

  if not FIsInited then
  begin
    Self.Init;
    FIsInited:=True;
  end;

  Result:=True;
end;

function TServiceModule.DoPrepareStop: Boolean;
begin
  Result:=True;

end;

procedure TServiceModule.Init;
begin

end;

{ TBaseServiceThread }

procedure TBaseServiceThread.SleepThread(ATimeout,
  ACheckTerminateInterval: Integer);
var
  ASumTimeout:Integer;
begin
  ASumTimeout:=0;
  while not Self.Terminated and (ASumTimeout<ATimeout) do
  begin
    Sleep(ACheckTerminateInterval);
    ASumTimeout:=ASumTimeout+ACheckTerminateInterval;
  end;
end;




{ TOpenPlatformAppList }

procedure TOpenPlatformAppList.Add(AAppID: String; AIsEnableSign: Boolean;
  ASignType, AAppSecret: String);
var
  AApp:TOpenPlatformApp;
begin
  AApp:=TOpenPlatformApp.Create;

  AApp.fid:=AAppID;


  AApp.appsecret:=AAppSecret;
  AApp.sign_type:=ASignType;
  AApp.is_enable_sign:=Ord(AIsEnableSign);

  Inherited Add(AApp);



end;

function TOpenPlatformAppList.Find(AAppID: String): TOpenPlatformApp;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if Items[I].fid=AAppID then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TOpenPlatformAppList.GetItem(Index: Integer): TOpenPlatformApp;
begin
  Result:=TOpenPlatformApp(Inherited Items[Index]);
end;




{ TOpenPlatformApp }

procedure TOpenPlatformApp.LoadFromDataset(ADataset: TDataset);
begin
  Self.fid:=IntToStr(ADataset.FieldByName('fid').AsInteger);

  //是否有FastMsg的功能
  Self.is_enable_fastmsg:=ADataset.FieldByName('is_enable_fastmsg').AsInteger;

  //FastMsg的WebService功能
//  Self.fastmsg_webservice_url:=ADataset.FieldByName('fastmsg_webservice_url').AsString;
  Self.fastmsg_webapi_url:=ADataset.FieldByName('fastmsg_webapi_url').AsString;
  Self.fastmsg_key:=ADataset.FieldByName('fastmsg_key').AsString;


  Self.appsecret_xfapp:=ADataset.FieldByName('appsecret_xfapp').AsString;
  Self.sign_type:=ADataset.FieldByName('sign_type').AsString;
  Self.is_enable_sign:=ADataset.FieldByName('is_enable_sign').AsInteger;

  Self.service_user_fid:=ADataset.FieldByName('service_user_fid').AsString;

  Json:=JsonFromRecord(ADataset);
end;





{ TServiceStatusOutputThread }

constructor TServiceStatusOutputThread.Create(ACreateSuspended: Boolean;
  AServiceProject: TServiceProject);
begin
  inherited Create(ACreateSuspended);
  FServiceProject:=AServiceProject;

end;

procedure TServiceStatusOutputThread.Execute;
var
  I: Integer;
  ASumCurCount:Integer;
  AServiceModule:TServiceModule;
  ADatabaseModuleStatus:TDatabaseModuleStatus;
  AAPICallStatisticsItem:TAPICallStatisticsItem;
  ALog:String;
begin

  while not Self.Terminated do
  begin

      SleepThread(60*1000);
      //加载日志设置,因为可能会更新,有时候需要输出日志
      uBaseLog.GetGlobalLog.LoadConfig;

    //    //上次总调用数
    //    LastSumCallCount:Integer;
    //    //最高每秒并发
    //    MaxParallelCallCountPerSecond:Integer;

      //刷新服务端状态

      ALog:='服务端状态:'+#13#10;

    //  Self.lblSumCallCount.Caption:=IntToStr(FServiceProject.SumCallCount);
      ALog:=ALog+'接口总调用次数:'+IntToStr(FServiceProject.SumCallCount)+#13#10;



      if FServiceProject.SumCallCount-FServiceProject.LastSumCallCount>FServiceProject.MaxParallelCallCountPerSecond then
      begin
        FServiceProject.MaxParallelCallCountPerSecond:=FServiceProject.SumCallCount-FServiceProject.LastSumCallCount;
      end;
//      Self.lblMaxCallCountPerSecond.Caption:=IntToStr(FServiceProject.MaxParallelCallCountPerSecond);
      ALog:=ALog+'每秒最高并发数:'+IntToStr(FServiceProject.MaxParallelCallCountPerSecond)+#13#10;


      FServiceProject.LastSumCallCount:=FServiceProject.SumCallCount;
    //  Self.lblInvalidCallCount.Caption:=IntToStr(FServiceProject.InvalidCallCount);
      ALog:=ALog+'无效调用次数:'+IntToStr(FServiceProject.InvalidCallCount)+#13#10;



      //Redis缓存池
    //  Self.lblRedisPoolCount.Caption:=IntToStr(GetGlobalRedisClientPool.FCustomObjects.Count);



      ASumCurCount:=0;
    //  Self.gridDatabasePool.RowCount:=FServiceProject.ServiceModuleList.Count+2;
    //  Self.gridDatabasePool.ColCount:=9;
    //
    //  Self.gridDatabasePool.Cells[0,0]:='模块名';
    //  Self.gridDatabasePool.Cells[1,0]:='最大数';
    //  Self.gridDatabasePool.Cells[2,0]:='当前数';
    //  Self.gridDatabasePool.Cells[3,0]:='使用次数';
    //  Self.gridDatabasePool.Cells[4,0]:='归还次数';
    //  Self.gridDatabasePool.Cells[5,0]:='检测连接状态次数';
    //  Self.gridDatabasePool.Cells[6,0]:='连接成功次数';
    //  Self.gridDatabasePool.Cells[7,0]:='连接断开次数';
    //  Self.gridDatabasePool.Cells[8,0]:='重连成功次数';
      //先将数据库模块显示出来
      for I := 0 to FServiceProject.ServiceModuleList.Count-1 do
      begin
        AServiceModule:=TServiceModule(FServiceProject.ServiceModuleList[I]);

    //    Self.gridDatabasePool.Cells[0,I+1]:=AServiceModule.Name;
        ALog:=ALog+'模块名:'+AServiceModule.Name+#9;
        if AServiceModule is TKbmMWServiceModule then
        begin

          ADatabaseModuleStatus:=TKbmMWServiceModule(AServiceModule).DBModule.GetStatus;


    //      Self.gridDatabasePool.Cells[1,I+1]:=IntToStr(ADatabaseModuleStatus.MaxCount);
          ALog:=ALog+'最大数:'+IntToStr(ADatabaseModuleStatus.MaxCount)+#9;
    //      Self.gridDatabasePool.Cells[2,I+1]:=IntToStr(ADatabaseModuleStatus.CurCount);
          ALog:=ALog+'当前数:'+IntToStr(ADatabaseModuleStatus.CurCount)+#9;
          ASumCurCount:=ASumCurCount+ADatabaseModuleStatus.CurCount;

    //      Self.gridDatabasePool.Cells[3,I+1]:=IntToStr(ADatabaseModuleStatus.LockTimes);
          ALog:=ALog+'使用次数:'+IntToStr(ADatabaseModuleStatus.LockTimes)+#9;
    //      Self.gridDatabasePool.Cells[4,I+1]:=IntToStr(ADatabaseModuleStatus.UnlockTimes);
          ALog:=ALog+'归还次数:'+IntToStr(ADatabaseModuleStatus.UnlockTimes)+#9;
    //      Self.gridDatabasePool.Cells[5,I+1]:=IntToStr(ADatabaseModuleStatus.CheckConnectTimes);
          ALog:=ALog+'检测连接状态次数:'+IntToStr(ADatabaseModuleStatus.CheckConnectTimes)+#9;
    //      Self.gridDatabasePool.Cells[6,I+1]:=IntToStr(ADatabaseModuleStatus.ConnectedTimes);
          ALog:=ALog+'连接成功次数:'+IntToStr(ADatabaseModuleStatus.ConnectedTimes)+#9;
    //      Self.gridDatabasePool.Cells[7,I+1]:=IntToStr(ADatabaseModuleStatus.DisconnectedTimes);
          ALog:=ALog+'连接断开次数:'+IntToStr(ADatabaseModuleStatus.DisconnectedTimes)+#9;
    //      Self.gridDatabasePool.Cells[8,I+1]:=IntToStr(ADatabaseModuleStatus.ReConnectedTimes);
          ALog:=ALog+'重连成功次数:'+IntToStr(ADatabaseModuleStatus.ReConnectedTimes)+#13#10;



        end;

      end;




    //  //汇总
    //  Self.gridDatabasePool.Cells[0,I+1]:='汇总';
    //  Self.gridDatabasePool.Cells[2,I+1]:=IntToStr(ASumCurCount);


      ALog:=ALog+'输出接口调用统计:'+#13#10;
      ALog:=ALog
                  +'最大耗时(毫秒)'+#9
                  +'平均耗时(毫秒)'+#9
                  +'接口名称'
                  +#13#10;
      //输出接口调用统计
      //先将数据库模块显示出来
      for I := 0 to FServiceProject.FAPICallStatisticsList.Count-1 do
      begin
        AAPICallStatisticsItem:=FServiceProject.FAPICallStatisticsList.Items[I];
        ALog:=ALog
                  +FloatToStr(AAPICallStatisticsItem.FMaxCostMilliSeconds)+#9
                  +FloatToStr(AAPICallStatisticsItem.FSumCostMilliSeconds / AAPICallStatisticsItem.FCount)+#9
                  +AAPICallStatisticsItem.FAPI
                  +#13#10;

      end;



      uBaseLog.HandleException(nil,ALog);


  end;


end;

//{ TServiceModuleInitProcList }
//
//function TServiceModuleInitProcList.GetItem(Index: Integer): TServiceModuleInitProcItem;
//begin
//  Result:=TServiceModuleInitProcItem(Inherited Items[Index]);
//end;

{ TAPICallStatisticsList }

procedure TAPICallStatisticsList.AddCall(AAPI: String;ACostMilliSeconds: Double);
var
  AItem:TAPICallStatisticsItem;
begin
  //http://127.0.0.1:9000/easyservice/helloworld
  AItem:=Find(AAPI);
  if AItem=nil then
  begin
    AItem:=TAPICallStatisticsItem.Create;
    AItem.FAPI:=AAPI;
    Self.Add(AItem);
  end;
  //不能溢出了
  AItem.FCount:=AItem.FCount+1;
  //保存最大的耗时
  if ACostMilliSeconds>AItem.FMaxCostMilliSeconds then
  begin
    AItem.FMaxCostMilliSeconds:=ACostMilliSeconds;
  end;
  //保存平均的耗时
  AItem.FSumCostMilliSeconds:=AItem.FSumCostMilliSeconds+ACostMilliSeconds;


end;

function TAPICallStatisticsList.Find(AAPI: String): TAPICallStatisticsItem;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if Items[I].FAPI=AAPI then
    begin
      Result:=Items[I];
      Exit;
    end;
  end;
end;

function TAPICallStatisticsList.GetItem(Index: Integer): TAPICallStatisticsItem;
begin
  Result:=TAPICallStatisticsItem(Inherited Items[Index]);
end;

{ TSerivceStartThread }

constructor TSerivceStartThread.Create(ACreateSuspended: Boolean;
  AServiceProject: TServiceProject);
begin
  inherited Create(ACreateSuspended);
  FServiceProject:=AServiceProject;
end;

procedure TSerivceStartThread.Execute;
var
  AStarted:Boolean;
  AMessage:String;
begin
  uBaseLog.HandleException(nil,'TSerivceStartThread.Execute Begin');
  uBaseLog.GetGlobalLog.OutputDebugString('TSerivceStartThread.Execute Begin');

  AStarted:=False;
  while not AStarted and not Self.Terminated do
  begin
    AMessage:='';
    AStarted:=FServiceProject.DoStart(AMessage);

    if AStarted then
    begin
      uBaseLog.HandleException(nil,'TSerivceStartThread.Execute 服务启动成功');
      uBaseLog.GetGlobalLog.OutputDebugString('TSerivceStartThread.Execute 服务启动成功');
    end
    else
    begin
      uBaseLog.HandleException(nil,'TSerivceStartThread.Execute 服务启动失败:'+AMessage+',10秒后重试');
      uBaseLog.GetGlobalLog.OutputDebugString('TSerivceStartThread.Execute 服务启动失败:'+AMessage+',10秒后重试');
      SleepThread(5*1000);
    end;

  end;

  uBaseLog.HandleException(nil,'TSerivceStartThread.Execute End');
  uBaseLog.GetGlobalLog.OutputDebugString('TSerivceStartThread.Execute End');

end;

{ TUserAccessTokenList }

function TUserAccessTokenList.Add(AAppID, AUserFID,AAccessToken: String;AIsSystem:Boolean=False): TUserAccessToken;
begin
  Result:=TUserAccessToken.Create;
  Result.AppID:=AAppID;
  Result.UserFID:=AUserFID;
  Result.AccessToken:=AAccessToken;
  Result.IsSystem:=AIsSystem;
  Self.Add(Result);
end;

function TUserAccessTokenList.Find(AAppID, AUserFID: String;AIsSystem:Boolean=False): TUserAccessToken;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if (Items[I].AppID=AAppID)
      and (Items[I].UserFID=AUserFID)
      and (Items[I].IsSystem=AIsSystem) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TUserAccessTokenList.Find(AAccessToken: String): TUserAccessToken;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count-1 do
  begin
    if (Items[I].AccessToken=AAccessToken) then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TUserAccessTokenList.GetItem(Index: Integer): TUserAccessToken;
begin
  Result:=TUserAccessToken(Inherited Items[Index]);
end;

initialization
  //需要记录日志
  uBaseLog.GetGlobalLog.IsWriteLog:=True;
  uBaseLog.GetGlobalLog.SaveConfig;
//  {$IFDEF CONSOLE}
  //经测试在Windows下,Console程序打印日志会卡死
  GetGlobalLog.IsOutputLog:=False;
//  {$ENDIF}
  uBaseLog.GetGlobalLog.HandleException(nil,'服务端初始');


  GlobalServiceProject:=GetGlobalServiceProject;

  //默认服务的标题(不要改)
  GlobalServiceProject.Name:='开放平台服务端';
  //默认服务的端口
  GlobalServiceProject.Port:=10000;

  IsNeedLoadServiceProjectFromIni:=True;
//  IsNeedSaveServiceProjectFromIni:=True;


  //REDIS默认的缓存时间
  REDIS_COMMON_TIMEOUT:=10*60;
  //验证码
  CAPTCHA_REDIS_COMMON_TIMEOUT:=1*60;


  if DirectoryExists('C:\MyFiles') or DirectoryExists('D:\MyFiles') then
  begin
    //开发测试电脑
    //缓存时间调短一点

    //REDIS默认的缓存时间
//    REDIS_COMMON_TIMEOUT:=10*60;
    REDIS_COMMON_TIMEOUT:=1;//10*60;

  end;




finalization
  FreeAndNil(GlobalServiceProject);


end.
