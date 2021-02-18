//convert pas to utf8 by ¥
unit uOpenPlatformServerManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  DateUtils,
  SyncObjs,

  uLang,
  IniFiles,
  ActiveX,
  IdGlobal,
  uBaseLog,
  XSuperObject,
  uBaseDBHelper,
  uUniDBHelper,
  uBaseList,
  uFileCommon,
  uOpenCommon,
  uFuncCommon,

  uDataBaseConfig,
  DataBaseConfigForm,

  uRestInterfaceCall,
  ServerDataBaseModule,

  kbmMWScheduler,
  kbmMWUniDAC,
  kbmMWCustomConnectionPool,
  Generics.Collections,
  uModule_InterfaceSign,
  Redis.Client,
  Redis.Commons,
  uRedisClientPool,
//  uRestInterfaceCall,


  kbmMWHTTPUtils,
  kbmMWCustomTransport,
  kbmMWServer,
  kbmMWAJAXTransStream,
  kbmMWTCPIPIndyServerTransport,
  kbmMWCustomHTTPService,
  kbmMWCustomLoadBalancingService,
  kbmMWFilePool,
  kbmMWSecurity,
  kbmMWCrypt,
  kbmMWHTTPSYSServerTransport,

  MySQLUniProvider,
  UniProvider, Data.DB, DBAccess, Uni,
  kbmMWCustomSQLMetaData,
  kbmMWMSSQLMetaData,

  Vcl.StdCtrls, Vcl.ExtCtrls;





type
  TkbmMWCustomServiceClass = class of TkbmMWCustomService;




  //开放平台的APP
  TOpenPlatformApp=class
  public
    fid:Integer;


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
//
//    appsecret:String;
//    name:String;
//    icon_path:String;
//    app_desc:String;
    procedure LoadFromDataset(ADataset:TDataset);
  end;
  TOpenPlatformAppList=class(TBaseList)
  private
    function GetItem(Index: Integer): TOpenPlatformApp;
  public
    function Find(AAppID:Integer):TOpenPlatformApp;
    property Items[Index:Integer]:TOpenPlatformApp read GetItem;default;
  end;





  TBaseServiceThread=class(TThread)
  public
    procedure SleepThread(ATimeout:Integer;ACheckTerminateInterval:Integer=2000);
  end;



  //服务模块基类
  TServiceModule = class
  public
    //模块名称,比如验证码、用户中心、IM、朋友圈
    Name: String;
  public
    constructor Create; virtual;
  public
    //准备启动
    function DoPrepareStart(var AError:String): Boolean; virtual; abstract;
    //准备停止
    function DoPrepareStop: Boolean; virtual; abstract;
  end;





  //KBM服务模块(含数据库)
  TKbmMWServiceModule = class(TServiceModule)
  public
    //使用的数据库连接
    DBModule: TDatabaseModule;
    //实现服务的核心
    kbmMWCustomServiceClass: TkbmMWCustomServiceClass;
  public
    constructor Create; override;
    destructor Destroy; override;
  public
    //准备启动
    function DoPrepareStart(var AError:String): Boolean; override;
    //准备停止
    function DoPrepareStop: Boolean; override;
  end;



//  TServiceLogEvent=procedure() of object;

  //服务工程
  TServiceProject = class
  public
    Name: String;
    //服务端端口
    Port: Integer;
    SSLPort: Integer;
    //域名
    Domain:String;


    kbmMWServer1: TkbmMWServer;
    kbmMWHTTPSysServerTransport1: TkbmMWHTTPSysServerTransport;

    //服务模块列表
    ServiceModuleList: TBaseList;


    //使用的数据库连接
    DBModule: TDatabaseModule;


  public

    //开放平台的应用列表
    AppList:TOpenPlatformAppList;

    //是否启用接口参数验签名
    IsEnableRestAPICheckSign:Boolean;

    NonceList:TStringList;
    NonceListLock:TCriticalSection;
    //上一次是什么时候清的
    LastNoceListClearTime:TDateTime;
    //上一次清的时候还剩多少,下一期清
    LastNoceListCount:Integer;




    //当前总调用数
    SumCallCount:Integer;
    InvalidCallCount:Integer;
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
    function GetAppSignType(AAppID:Integer):String;
    function GetAppSecret(AAppID:Integer):String;
    //更新开放平台的应用列表
    function SyncAppList(var ADesc:String):Boolean;
    procedure SyncAppListEvent(const AScheduledEvent:IkbmMWScheduledEvent);
    //检测接口的签名
    function CheckInterfaceSign(AAPI:String;AUrlParams:String;var ADesc:String):Boolean;
    function CheckInterfaceSignByAppSecret(AUrlParams:String;
                                            AAppSecret_XFAPP:String;
                                            var ADesc:String;
                                            AOldQueryParams:TkbmMWHTTPQueryValues=nil
                                            ):Boolean;
    //返回数据
    function ReturnJson(AAppID:Integer;
                        ACode:Integer;
                        ADesc:String;
                        ADataJson:ISuperObject;
                        ADesc2:String='';
                        ADataJson2:ISuperObject=nil):ISuperObject;
  public
    constructor Create; virtual;
    destructor Destroy;override;
  public
    function Start: Boolean;
    function Stop: Boolean;
  public
    function GetRedisClient:TRedisClient;
    procedure FreeRedisClient(ARedisClient:TRedisClient);


    function ServerUrl:String;
    function ServerUploadUrl:String;
    function UserCenterServer:String;
    function CaptchaServer:String;
    function ContentCenterServer:String;
    function ScoreCenterServer:String;
    function ShopCenterServer:String;
    function PayCenterServer:String;
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
  public
    //获取用户类型
    function GetUserType(AAppID:Integer;
                          AUserFID:String;
                          AKey:String;
                          var ACode:Integer;
                          var ADesc:String;
                          var ADataJson:ISuperObject;
                          var AUserType:Integer):Boolean;
  end;




var
  //服务模块
  GlobalServiceProject:TServiceProject;

  //是否需要从Ini文件加载端口的配置,像汽修服务就不需要从配置中加载
  IsNeedLoadServiceProjectFromIni:Boolean;


var
  //REDIS默认的缓存时间
  REDIS_COMMON_TIMEOUT:Integer;//=10*60;
  //验证码
  CAPTCHA_REDIS_COMMON_TIMEOUT:Integer;//=1*60;


function RegisterServiceModule(AServiceModule: TServiceModule): Boolean;


implementation


function RegisterServiceModule(AServiceModule: TServiceModule): Boolean;
begin
  uBaseLog.HandleException(nil,'RegisterServiceModule '+AServiceModule.Name);
  GlobalServiceProject.ServiceModuleList.Add(AServiceModule);
end;


{ TServiceProject }

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
                                    AAppID:Integer;
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


function TServiceProject.CheckInterfaceSign(AAPI:String;AUrlParams: String;var ADesc: String): Boolean;
var
  AQueryParams:TkbmMWHTTPQueryValues;
  I: Integer;
  sl:TStringList;
  AApp:TOpenPlatformApp;
  AAppID:Integer;
  ASignType:String;
  ASign:String;
  AServerSign:String;
begin
  Result:=False;//内测阶段
  ADesc:='';



  //当前总调用数
  Inc(SumCallCount);




  if not IsEnableRestAPICheckSign then
  begin
    Result:=True;
    Exit;
  end;




  //判断有没有sign,signtype
  // Execute method.
  AQueryParams:=TkbmMWHTTPQueryValues.Create;
  try
      AQueryParams.AsString:=AUrlParams;



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
      AAppID:=0;
      TryStrToInt(AQueryParams.ValueByName['appid'],AAppID);




      //判断是否需要签名
      //判断APP是否存在
      AApp:=Self.AppList.Find(AAppID);
      if AApp=nil then
      begin
        ADesc:='appid为'+IntToStr(AAppID)+'的App不存在';
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
      if AQueryParams.ValueByName['signtype']='' then
      begin
          Inc(InvalidCallCount);
          ADesc:='signtype参数不存在';
          Exit;
      end;



      ASign:=AQueryParams.ValueByName['sign'];
      ASignType:=AQueryParams.ValueByName['signtype'];



      AAppID:=0;
      if not TryStrToInt(AQueryParams.ValueByName['appid'],AAppID) then
      begin
          Inc(InvalidCallCount);
          ADesc:='appid参数不合法';
          Exit;
      end;





      //1是旋风OnLine项目所使用的签名方式
      if ASignType<>'' then
      begin
          //1是旋风OnLine项目所使用的签名方式

          //判断APP的私钥是否存在
          if not CheckInterfaceSignByAppSecret(AUrlParams,
                                              AApp.appsecret_xfapp,
                                              ADesc,
                                              AQueryParams) then
          begin
            Exit;
          end;


      end;



      Result:=True;

  finally
    if not Result then
    begin
      uBaseLog.HandleException(nil,'TServiceProject.CheckInterfaceSign '+AAPI+' '+ADesc);
    end;
    Result:=True;//内测阶段，只记录不开放
    FreeAndNil(AQueryParams);
  end;

  Result:=True;
end;

function TServiceProject.CheckInterfaceSignByAppSecret(AUrlParams,
  AAppSecret_XFAPP: String;
  var ADesc: String;
  AOldQueryParams:TkbmMWHTTPQueryValues=nil): Boolean;
var
  AQueryParams:TkbmMWHTTPQueryValues;
  I: Integer;
  sl:TStringList;
  AAppID:Integer;
  ASignType:String;
  ASign:String;
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

      //判断有没有appid
      if AQueryParams.ValueByName['appid']='' then
      begin
          Inc(InvalidCallCount);
          ADesc:='appid参数不存在';
          Exit;
      end;



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




      //判断有没有nonce随机数
      if AQueryParams.ValueByName['nonce']='' then
      begin
          //老版本的接口
          //ADesc:='nonce参数不存在';
          //Exit;
      end
      else
      begin


          //判断有没有重复
          if NonceList.IndexOf(AQueryParams.ValueByName['nonce'])<>-1 then
          begin
            //重复了
            Inc(InvalidCallCount);
            ADesc:='nonce参数不能重复';
            Exit;
          end;
          NonceListLock.Enter;
          try
            NonceList.Add(AQueryParams.ValueByName['nonce']);

            //删除过期的,一方面这个随机数只要保证90秒之内的请求不要重复就可以了
            //超过90秒由timestamp会检测
            if DateUtils.SecondsBetween(LastNoceListClearTime,Now)>5*60 then
            begin
              //上一次是什么时候清的
              LastNoceListClearTime:=Now;
              //清掉上一90秒的
              for I := 0 to LastNoceListCount-1 do
              begin
                NonceList.Delete(0);
              end;
              //上一次清的时候还剩多少,下一期清
              LastNoceListCount:=NonceList.Count;
            end;

          finally
            NonceListLock.Leave;
          end;

      end;




      //判断有没有sign
      if AQueryParams.ValueByName['sign']='' then
      begin
          Inc(InvalidCallCount);
          ADesc:='sign参数不存在';
          Exit;
      end;



      //判断有没有signtype
      if AQueryParams.ValueByName['signtype']='' then
      begin
          Inc(InvalidCallCount);
          ADesc:='signtype参数不存在';
          Exit;
      end;



      ASign:=AQueryParams.ValueByName['sign'];
      ASignType:=AQueryParams.ValueByName['signtype'];



      AAppID:=0;
      if not TryStrToInt(AQueryParams.ValueByName['appid'],AAppID) then
      begin
          Inc(InvalidCallCount);
          ADesc:='appid参数不合法';
          Exit;
      end;




      //1是旋风OnLine项目所使用的签名方式
      if ASignType=CONST_REST_SIGNTYPE_XFAPP then
      begin
          //1是旋风OnLine项目所使用的签名方式

          //判断APP的私钥是否存在
          if AAppSecret_XFAPP='' then
          begin
            Inc(InvalidCallCount);
            ADesc:='appid为'+IntToStr(AAppID)+'的私钥appsecrect_xfapp为空';
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
              AServerSign:=uModule_InterfaceSign.LoadSignAsStringList(sl,AAppSecret_XFAPP);


              //比对
              if ASign<>AServerSign then
              begin
                Inc(InvalidCallCount);
                ADesc:='签名不一致,请升级新版本';
                Exit;
              end;


          finally
            FreeAndNil(sl);
          end;

      end
      else if ASignType=CONST_REST_SIGNTYPE_MD5 then
      begin
          //1是旋风OnLine项目所使用的签名方式

          //判断APP的私钥是否存在
          if AAppSecret_XFAPP='' then
          begin
            Inc(InvalidCallCount);
            ADesc:='appid为'+IntToStr(AAppID)+'的私钥appsecrect_xfapp为空';
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
              AServerSign:=uModule_InterfaceSign.LoadMD5SignAsStringList(sl,AAppSecret_XFAPP);


              //比对
              if ASign<>AServerSign then
              begin
                Inc(InvalidCallCount);
                ADesc:='签名不一致,请升级新版本';
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

function TServiceProject.ContentCenterServer: String;
begin
  Result:=ServerUrl+'contentcenter/';
end;

constructor TServiceProject.Create;
begin
  Name := Trans('默认服务');

  Port:=10000;
  SSLPort:=0;
  Domain:='www.orangeui.cn';


  FRedis_Host:='127.0.0.1';
  FRedis_Port:=6379;
//  FRedis_Password:='';
//  FRedis_dbIdx:=0;
//  //有效期几秒
//  FTimerInval_VerifyExpire:=;



  //服务包含的模块
  ServiceModuleList := TBaseList.Create(ooReference);
  AppList:=TOpenPlatformAppList.Create();
  //数据库模块
  DBModule := TDatabaseModule.Create;
  DBModule.DBConfigFileName:='ProgramFrameworkManageDBConfig.ini';


  NonceList:=TStringList.Create;
  NonceListLock:=TCriticalSection.Create;


end;

destructor TServiceProject.Destroy;
begin
  FreeAndNil(kbmMWHTTPSysServerTransport1);
  FreeAndNil(kbmMWServer1);


  FreeAndNil(ServiceModuleList);
  FreeAndNil(AppList);

  FreeAndNil(DBModule);


  FreeAndNil(NonceList);
  FreeAndNil(NonceListLock);

  Inherited;
end;

procedure TServiceProject.FreeRedisClient(ARedisClient: TRedisClient);
begin
  GetGlobalRedisClientPool.FreeCustomObject(ARedisClient);
end;

function TServiceProject.GetAppSecret(AAppID: Integer): String;
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

function TServiceProject.GetAppSignType(AAppID: Integer): String;
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
  Result:=TRedisClient(GetGlobalRedisClientPool.GetCustomObject);
end;

function TServiceProject.GetRuleTypeListRestUrl: String;
begin
  Result:=ScoreCenterServer+'get_app_score_rule_list';
end;

function TServiceProject.GetUserScoreRestUrl: String;
begin
  Result:=ScoreCenterServer+'calc_gift_score';
end;

function TServiceProject.GetUserType(AAppID:Integer;
  AUserFID: String; AKey: String;
  var ACode: Integer; var ADesc: String; var ADataJson: ISuperObject;
  var AUserType: Integer): Boolean;
begin
  Result:=False;
  AUserType:=0;

  //接口验证用户是否合法
  if not SimpleCallAPI(Self.UserCenterServer+'get_user_type',
                              nil,
                              '',
                              ['appid',
                              'user_fid',
                              'key'],
                              [AAppID,
                              AUserFID,
                              AKey],
                              ACode,
                              ADesc,
                              ADataJson,
                              Self.GetAppSignType(AAppID),
                              Self.GetAppSecret(AAppID)
                              ) then
  begin
    Exit;
  end;
  //'{"user_type":1}'
  AUserType:=ADataJson.I['user_type'];
  Result:=True;
end;

function TServiceProject.IsValidUserRestUrl: String;
begin
  Result:=UserCenterServer+'is_valid_user';
end;

procedure TServiceProject.Load;
var
  AIniFile:TIniFile;
begin

  if FileExists(GetApplicationPath+'Config.ini') then
  begin
    AIniFile:=TIniFile.Create(GetApplicationPath+'Config.ini');

    Self.Port:=AIniFile.ReadInteger('','Port',Port);
    Self.SSLPort:=AIniFile.ReadInteger('','SSLPort',SSLPort);
    Self.Domain:=AIniFile.ReadString('','Domain','www.orangeui.cn');


    GetGlobalRedisClientPool.FRedis_Host:='127.0.0.1';
    GetGlobalRedisClientPool.FRedis_Port:=6379;
  //  GetGlobalSQLDBHelperPool.FRedis_Password:='';
  //  GetGlobalSQLDBHelperPool.FRedis_dbIdx:=0;
  //  //有效期几秒
  //  GetGlobalSQLDBHelperPool.FTimerInval_VerifyExpire:=;



    FreeAndNil(AIniFile);
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
  AIniFile:=TIniFile.Create(GetApplicationPath+'Config.ini');

  AIniFile.WriteInteger('','Port',Self.Port);
  AIniFile.WriteInteger('','SSLPort',Self.SSLPort);
  AIniFile.WriteString('','Domain',Self.Domain);


  FreeAndNil(AIniFile);
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

function TServiceProject.Start: Boolean;
var
  I: Integer;
  AServiceModule: TServiceModule;
var
  sd: TKbmMWCustomServiceDefinition;
  AError:String;
  AMessages:String;
begin
  Result := False;
  CoInitializeEx(nil,COINIT_MULTITHREADED);
  try

      uBaseLog.HandleException(nil,'TServiceProject.Start Begin');

      if kbmMWServer1=nil then
      begin
        kbmMWServer1 := TkbmMWServer.Create(nil);

        kbmMWHTTPSysServerTransport1 := TkbmMWHTTPSysServerTransport.Create(nil);
        kbmMWHTTPSysServerTransport1.Server := kbmMWServer1;
      end;


      uBaseLog.HandleException(nil,'TServiceProject.Start ServiceModuleList.Count='+IntToStr(ServiceModuleList.Count));







      //启动各个服务模块
      AMessages:='';
      for I := 0 to Self.ServiceModuleList.Count - 1 do
      begin
          //注册
          AServiceModule := TServiceModule(ServiceModuleList[I]);

          //连接数据库等初始
          AError:='';
          if not AServiceModule.DoPrepareStart(AError) then
          begin
              AMessages:=AServiceModule.Name+' '+AMessages+AError+#13#10;
              //如果启动失败,不退出
          end;
      end;



      //取到开放平台的APP列表
      if IsEnableRestAPICheckSign then
      begin
          //查询所有App列有
          AError:='';
          if not DBModule.DoPrepareStart(AError) then
          begin
              AMessages:='DBModule.DoPrepareStart '+AMessages+AError+#13#10;
          end
          else
          begin
              AppList.Clear();

              if not Self.SyncAppList(AError) then
              begin
                AMessages:='SyncAppList '+AMessages+AError+#13#10;
              end;

          end;
      end;





      if AMessages<>'' then
      begin
        //初始模块失败
        ShowMessage(AMessages);
      end;






      //自动注册
      kbmMWServer1.AutoRegisterServices;




      //使用设置的端口号
      kbmMWHTTPSysServerTransport1.URLs.Clear;
      kbmMWHTTPSysServerTransport1.URLs.Add('http://+:' + IntToStr(Port) + '/');
      //SSL
      if SSLPort<>0 then
      begin
          //需要SSL
          if Port=10000 then
          begin
            kbmMWHTTPSysServerTransport1.URLs.Add('https://+:' + IntToStr(SSLPort) +'/');
          end
          else
          begin
            kbmMWHTTPSysServerTransport1.URLs.Add('https://+:' + IntToStr(Port+443) +'/');
          end;
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



      uBaseLog.HandleException(nil,'TServiceProject.Start End');


      Result := True;

  finally
    CoUnInitialize;
  end;

end;

function TServiceProject.Stop: Boolean;
var
  I: Integer;
  AStartTime:TDateTime;
  AServiceModule: TServiceModule;
begin
  Result:=False;

  CoInitializeEx(nil,COINIT_MULTITHREADED);
  try


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
      finally
      end;
      uBaseLog.HandleException(nil,'kbmMWServer1.Stop End 耗时'+IntToStr(DateUtils.SecondsBetween(Now,AStartTime))+'秒');



      //停止各个模块
      for I := 0 to Self.ServiceModuleList.Count - 1 do
      begin
        AServiceModule := TServiceModule(ServiceModuleList[I]);

        AStartTime:=Now;
        uBaseLog.HandleException(nil,AServiceModule.ClassName+' DoPrepareStop Begin ');
        //断开数据库连接等停止
        AServiceModule.DoPrepareStop;

        uBaseLog.HandleException(nil,AServiceModule.ClassName+' DoPrepareStop End 耗时'+IntToStr(DateUtils.SecondsBetween(Now,AStartTime))+'秒');


      end;



      kbmMWServer1.UnregisterServices;


      Result := True;

  finally
    CoUnInitialize;
  end;
end;

function TServiceProject.SyncAppList(var ADesc:String):Boolean;
var
  ASQLDBHelper:TBaseDBHelper;
  AApp:TOpenPlatformApp;
begin
    Result:=False;

    if not DBModule.GetDBHelperFromPool(ASQLDBHelper,ADesc) then
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
          AApp:=AppList.Find(ASQLDBHelper.Query.FieldByName('fid').AsInteger);
          if AApp=nil then
          begin
            AApp:=TOpenPlatformApp.Create;
            AppList.Add(AApp);
          end;

          AApp.LoadFromDataset(ASQLDBHelper.Query);

          ASQLDBHelper.Query.Next;
        end;

    finally
      DBModule.FreeDBHelperToPool(ASQLDBHelper);
    end;

    Result:=True;
end;

procedure TServiceProject.SyncAppListEvent(const AScheduledEvent: IkbmMWScheduledEvent);
var
  ADesc:String;
begin
  SyncAppList(ADesc);
end;

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

constructor TKbmMWServiceModule.Create;
begin
  //数据库模块
  DBModule := TDatabaseModule.Create;
end;

destructor TKbmMWServiceModule.Destroy;
begin
  FreeAndNil(DBModule);
end;

function TKbmMWServiceModule.DoPrepareStart(var AError:String): Boolean;
begin
  Result := False;

  //连接数据库
  Result := DBModule.DoPrepareStart(AError);

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

constructor TServiceModule.Create;
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

function TOpenPlatformAppList.Find(AAppID: Integer): TOpenPlatformApp;
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
  Self.fid:=ADataset.FieldByName('fid').AsInteger;

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

end;





initialization
  //需要记录日志
  uBaseLog.GetGlobalLog.IsWriteLog:=True;


  GlobalServiceProject:=TServiceProject.Create;

  //默认服务的标题(不要改)
  GlobalServiceProject.Name:='开放平台服务端';
  //默认服务的端口
  GlobalServiceProject.Port:=10000;

  IsNeedLoadServiceProjectFromIni:=True;



  //REDIS默认的缓存时间
  REDIS_COMMON_TIMEOUT:=10*60;
  //验证码
  CAPTCHA_REDIS_COMMON_TIMEOUT:=1*60;


  if DirectoryExists('C:\MyFiles') or DirectoryExists('D:\MyFiles') then
  begin
    //开发测试电脑
    //缓存时间调短一点

    //REDIS默认的缓存时间
    REDIS_COMMON_TIMEOUT:=10*60;
//    REDIS_COMMON_TIMEOUT:=1;//10*60;

  end;




finalization
  FreeAndNil(GlobalServiceProject);


end.
