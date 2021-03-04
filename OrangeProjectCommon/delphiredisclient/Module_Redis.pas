unit Module_Redis;

interface

uses
//  Shar_GlobalData ,
  Redis.Commons,
  Redis.Client,
  Redis.NetLib.INDY,
  Redis.Values;

  type
    TRedisOptClass  = class
      private

        FRedis_Host:String;
        FRedis_Port:Integer;
        FRedis_Password:String;
        FRedis_dbIdx:Integer;
        //有效期几秒
        FTimerInval_VerifyExpire:Integer;

      public
        FRedisClient: IRedisClient;
        //服务端提交或者更新验证码
        //Vericode是保存在Key这个位置
        //OpenId是保存在Value这个位置
        function UpLoadVerifyCode(OpenId , Vericode : string ; nReTry : Integer):Boolean;
        //检测验证码是否存在,返回验证码对应的OpenId
        //AVericode是Key
        //AOpenId是Value
        function CheckVerifyCodeIsExist(AVericode : string;var AOpenId:String):Boolean;

      public
        constructor Create(ARedis_Host:String;
                          ARedis_Port:Integer;
                          ARedis_Password:String;
                          ARedis_dbIdx:Integer;
                          ATimerInval_VerifyExpire:Integer);
        destructor Destroy;   override;
    end;



    var
      gRedisOpt : TRedisOptClass;

implementation

//  uses
//    Shar_CenterData
//    ;

function TRedisOptClass.UpLoadVerifyCode(OpenId , Vericode : string; nReTry : Integer):Boolean;
  begin
    if nReTry > 3 then Exit;
    result  :=  False;

    try
      if FRedisClient.EXISTS(Vericode) then begin
        Result := True;
        Exit;
      end;

      FRedisClient.&SET(Vericode  , OpenId,  FTimerInval_VerifyExpire);
    except
      FRedisClient.Connect;
      inc(nretry);
      UpLoadVerifyCode(OpenId , Vericode, nReTry);
    end;
  end;

function TRedisOptClass.CheckVerifyCodeIsExist(AVericode: string;var AOpenId:String): Boolean;
//var
//  ATempOpenId:String;
begin
    result  :=  False;

    try
      if not FRedisClient.EXISTS(AVericode) then begin
        Exit;
      end;

      FRedisClient.GET(AVericode  , AOpenId);

//      if ATempOpenId=AOpenId then
//      begin
//        Result:=True;
//      end;

      Result:=True;
    except
      FRedisClient.Connect;
    end;

end;

constructor TRedisOptClass.Create(ARedis_Host:String;
                                  ARedis_Port:Integer;
                                  ARedis_Password:String;
                                  ARedis_dbIdx:Integer;
                                  ATimerInval_VerifyExpire:Integer);
  begin
    FRedis_Host:=ARedis_Host;
    FRedis_Port:=ARedis_Port;
    FRedis_Password:=ARedis_Password;
    FRedis_dbIdx:=ARedis_dbIdx;
    FTimerInval_VerifyExpire:=ATimerInval_VerifyExpire;


    FRedisClient := TRedisClient.Create(FRedis_Host, FRedis_Port);
    FRedisClient.Connect;
    if FRedis_Password<>'' then
    begin
      FRedisClient.AUTH(FRedis_Password);
    end;
    FRedisClient.SELECT(FRedis_dbIdx);    // 选择库，默认有16个（0..15）
  end;

destructor TRedisOptClass.Destroy;
  begin
    Inherited;//这句没加,有内存泄露
    FRedisClient.Disconnect;
  end;

end.
