unit uShangHaiHospitalPay;

interface


//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}



uses
  SysUtils,
  StrUtils,

  Windows,
  XSuperObject,

  uPayAPIParam,
  uPayPublic,
  uFileCommon,
  uFuncCommon,
  DateUtils,
  uBaseLog,

  uBaseDBHelper,
  uADODBHelper,
  uAlipayRSA2,
  AES,
  EncdDecd,
  uCaptcha,

//  IdSSLOpenSSL,
//  IdSSLOpenSSLHeaders,
//  IdCoderMIME,
//  IdGlobal,
  IdHTTP,

  Classes;



const
  LineBreak=#10;


type
  //支付方式
  TPaymentType=(
                //支付宝
                ptAlipay,
                //微信支付
                ptWeixin,
                //聚合扫码支付
                ptPolymerization);
  //支付方法
  TPayMethodType=(
                  //二维码支付
                  pmtQRCode,
                  //条码支付
                  pmtBarCode,
                  //聚合扫码支付
                  pmtPolymerization);


  //交易成功记录
  TTradeBizContent=record
    //内部交易号
    out_trade_no:String;
    //交易号
    trade_no:String;
    //交易状态
    trade_status:String;
    //交易金额
    total_amount:Double;
    //支付方式
    payment_type:String;
    pay_date:String;
  end;


  //支付结果事件
  TPayResultEvent=procedure(Sender:TObject;
                            //是否支付成功
                            AIsSucc:Boolean;
                            //交易数据
                            ATradeBizContent:TTradeBizContent;
                            //服务器返回的字符串
                            AServerResponseJson:ISuperObject;
                            //描述
                            ADesc:String;
                            AIsTimeout:Boolean) of object;




  TShangHaiHospitalPay=class(TComponent)
  private
    FAppID: String;
    FAppKey: String;
    FPayRSAPrivateKey: String;
    FGatewayUrl: String;
    FPayShopID: String;
    FPayPublicRSAKey: String;

    //次要的参数
    FOperatorID:String;
    FTerminalID:String;
    FDisablePayChannels:String;
    FSignType:String;
    FTimeoutExpress:String;
    FNotifyUrl:String;


    //检测支付超时的时间(分钟)
    FCheckStateTimeoutMinitue:Integer;
  private
    FOnPayResult: TPayResultEvent;
  public
    FDBHelper:TADODBHelper;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    //设置交易处理成功
    function SetTradeProcessedSuccToDatabase(AOutTradeNo:String):Boolean;
    //设置交易撤消成功
    function SetTradeCancelSuccToDatabase(AOutTradeNo:String):Boolean;
    //设置交易关闭成功
    function SetTradeCloseSuccToDatabase(AOutTradeNo:String):Boolean;
  public
    //设置交易退款成功
    function SetTradeRefundSuccSuccToDatabase(AOutTradeNo:String;AOutRefundRequestNo:String):Boolean;
    //设置交易退款处理成功
    function SetTradeRefundProcessedSuccSuccToDatabase(AOutTradeNo:String;AOutRefundRequestNo:String;ARefundAmount:String):Boolean;
  public
    //二维码支付
    function Pay(
                //内部单号
                AOutTradeNo:String;
                //主题
                ASubject:String;
                //内容
                ABody:String;
                //总金额
                ATotalAmount:String;
                //支付方式,支付宝或微信
                APaymentType:TPaymentType;
                //支付方法,二维码或条码
                APayMethodType:TPayMethodType;
                //用户授权的条码
                AUserPayAuthBarCode:String;
                var ADesc:String;
                var AServerResponse:String
                ):Boolean;


    //查询支付结果
    function QueryTrade(AOutTradeNo:String;
                          //支付方式,支付宝或微信
                          APaymentType:TPaymentType;
                          var ADesc:String;
                          var AServerResponse:String;
                          var AIsPaySucc:Boolean;
                          var ATradeStatus:String):Boolean;



    //支付关闭(长时间没有支付,不需要再需要用户支付)
    function CloseTrade(AOutTradeNo:String;
                        //支付方式,支付宝或微信
                        APaymentType:TPaymentType;
                        var ADesc:String;
                        var AServerResponse:String;
                        var AIsCloseSucc:Boolean):Boolean;


    //支付撤消(业务逻辑没有处理成功,全额退款)
    function CancelTrade(AOutTradeNo:String;
                        //支付方式,支付宝或微信
                        APaymentType:TPaymentType;
                        var ADesc:String;
                        var AServerResponse:String;
                        var AIsCancelSucc:Boolean):Boolean;


    //退款
    function RefundTrade(AOutTradeNo:String;
                        //退款单号
                        AOutRefundRequestNo:String;
                        //退款原因
                        ARefundReason:String;
                        //原交易总金额
                        ATotalAmount:String;
                        ARefundAmount:String;
                        //支付方式,支付宝或微信
                        APaymentType:TPaymentType;
                        var ADesc:String;
                        var AServerResponse:String;
                        var AIsRefundSucc:Boolean):Boolean;



    //查询退款结果
    function QueryRefundTrade(AOutTradeNo:String;
                              AOutRefundRequestNo:String;
                              //支付方式,支付宝或微信
                              APaymentType:TPaymentType;
                              var ADesc:String;
                              var AServerResponse:String;
                              var AIsRefundSucc:Boolean):Boolean;



  published
    //网关接口链接
    property GatewayUrl:String read FGatewayUrl write FGatewayUrl;
    //支付应用的ID
    property AppID:String read FAppID write FAppID;
    //支付应用的密钥
    property AppKey:String read FAppKey write FAppKey;


    //支付商家ID
    property PayShopID:String read FPayShopID write FPayShopID;
    //支付商家的私钥
    property PayRSAPrivateKey:String read FPayRSAPrivateKey write FPayRSAPrivateKey;
    //支付商家的公钥
    property PayPublicRSAKey:String read FPayPublicRSAKey write FPayPublicRSAKey;



    //内部参数
    //操作员号
    property OperatorID:String read FOperatorID write FOperatorID;
    //终端号
    property TerminalID:String read FTerminalID write FTerminalID;


    //支付结果事件
    property OnPayResult:TPayResultEvent read FOnPayResult write FOnPayResult;



  end;



  TTradeQueryType=(
                    tqtQueryPayedSucc,
                    tqtQueryRefundedSucc
                    );
  TShangHaiHospitalPayTradeQueryThread=class(TThread)
  private
    FShangHaiHospitalPay:TShangHaiHospitalPay;
    FOutTradeNo: String;
    FOutRefundRequestNo:String;
    FPaymentType:TPaymentType;
    FTradeQueryType:TTradeQueryType;

    FIsTimeout:Boolean;
    FDesc:String;
    FServerResponseJson:ISuperObject;
    FIsSucc:Boolean;
  private
    FTradeBizContent:TTradeBizContent;
    procedure DoPayResult;
  protected
    procedure Execute;override;
  public
    constructor Create(ACreateSuspended:Boolean;
                        AShangHaiHospitalPay:TShangHaiHospitalPay;
                        APaymentType:TPaymentType;
                        AOutTradeNo:String;
                        AOutRefundRequestNo:String;
                        ATradeQueryType:TTradeQueryType);
  end;





//生成支付的业务参数-上海
function GenerateBizContentJson_ShangHaiHospitalPay(
              //商品的标题/交易标题/订单标题/订单关键字等。
              ASubject:String;
              //对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。
              ABody:String;
              //商户网站唯一订单号
              AOut_trade_no:String;
              //订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]
              ATotal_amount:String;
              //该笔订单允许的最晚付款时间，逾期将关闭交易。
              ATimeout_express:String;
              //支付方式
              APaymentType:String;
              //回调URL
              ANotifyUrl:String;
              //操作员编码
              AOperatorID:String;
              //终端编码
              ATerminalId:String;
              //禁用支付渠道
              ADisablePayChannels:String;
              //用户授权的支付条码
              AUserAuthPayBarCode:String
              ):String;



//生成支付订单URL
function GeneratePayOrderUrl_ShangHaiHospitalPay(
            APayMethod:String;
            //应用ID
            APayAppID:String;
            //商户KCS8的RSA私钥
            ARSAPrivateKey:String;
            ASignType:String;
            //支付业务参数
            ABizContent:String;
            AIsNeedUrlEncode:Boolean;
            var AIsSignSucc:Boolean):String;


//通用网关接口调用
function CallShangHaiGatewayAPI(
            AInterfaceUrl:String;
            AAppID:String;
            AAppKey:String;
            AApiName:String;
            AApiMethod:String;
            ABodyUrl:String;
            var AServerResponse:String):Boolean;

//生成网关的签名
function GenGatewaySign(AAppID:String;AAppKey:String;AApiName:String):String;

//生成带签名的链接
function GenerateBodyUrl(
            AParamNames:Array of String;
            AParamValues:Array of Variant;
            //KCS8的RSA私钥
            ARSAPrivateKey:String;
            ASignType:String;
            var AIsSignSucc:Boolean
            ):String;


function GetStreamUTF8String(AResponseContent:TStream):String;

function GetPaymentTypeStr(APaymentType:TPaymentType):String;


procedure Register;


implementation



procedure Register;
begin
  RegisterComponents('ShanghaiHospitalPay',[TShangHaiHospitalPay]);
end;


function GetPaymentTypeStr(APaymentType:TPaymentType):String;
begin
  Result:='';
  case APaymentType of
    ptAlipay: Result:='alipay';
    ptWeixin: Result:='weixin';
    ptPolymerization: Result:='';
  end;
end;


function GetStreamUTF8String(AResponseContent:TStream):String;
var
  AResponseContentDataString_UTF8:UTF8String;
begin
    SetLength(AResponseContentDataString_UTF8,AResponseContent.Size);
    AResponseContent.Position:=0;
    AResponseContent.Read(AResponseContentDataString_UTF8[1],AResponseContent.Size);

    //转换成UTF8格式
    AResponseContentDataString_UTF8:=UTF8Decode(AResponseContentDataString_UTF8);
    Result:=AResponseContentDataString_UTF8;
end;


//通用网关接口调用
function CallShangHaiGatewayAPI(
            AInterfaceUrl:String;
            AAppID:String;
            AAppKey:String;
            AApiName:String;
            AApiMethod:String;
            ABodyUrl:String;
            var AServerResponse:String):Boolean;
var
  AIdHttp:TIdHttp;
  ASourceStr:UTF8String;
  ASouceStream:TStringStream;
  AResponseContent:TMemoryStream;
begin
  AServerResponse:='';
  Result:=False;

  AIdHttp:=TIdHttp.Create(nil);
  ASouceStream:=TStringStream.Create('');
  AResponseContent:=TMemoryStream.Create();
  try
      try

          AIdHttp.Request.UserAgent:='Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)';
          AIdHttp.Request.Accept:='*/*';
          AIdHttp.Request.AcceptLanguage:='zh-cn';
          AIdHttp.Request.ContentType:='application/x-www-form-urlencoded';


          AIdHttp.Request.CustomHeaders.Add('Appid: '+AAppID);
          AIdHttp.Request.CustomHeaders.Add('ApiName: '+AApiName);
          AIdHttp.Request.CustomHeaders.Add('Signature: '+GenGatewaySign(AAppID,AAppKey,AApiName));
          //      AIdHttp.Request.CustomHeaders.AddValue('Appid',AAppID);
          //      AIdHttp.Request.CustomHeaders.AddValue('ApiName',AApiName);
          //      AIdHttp.Request.CustomHeaders.AddValue('Signature',GenGatewaySign(AAppID,AAppKey,AApiName));


          ASourceStr:=ABodyUrl;
          ASouceStream.Write(ASourceStr[1],Length(ASourceStr));
          ASouceStream.Position:=0;

          {$IFDEF OFFLINE_TEST_MODE}
          //测试模式,离线模式
          if FileExists('.\TestResponseJson\'+'test.'+AApiMethod+'.json') then
          begin
              AResponseContent.LoadFromFile('.\TestResponseJson\'+'test.'+AApiMethod+'.json');
          end
          else
          begin

          end;
          {$ELSE}
          //真实模式
          AIdHttp.Post(AInterfaceUrl,ASouceStream,AResponseContent);
          {$ENDIF}


//          AResponseContent.Position:=0;
//          AResponseContent.SaveToFile(AApiMethod+' '+FormatDateTime('HH_MM_SS_ZZZ',Now)+'.json');


          AResponseContent.Position:=0;
          AServerResponse:=GetStreamUTF8String(AResponseContent);
          Result:=True;
      except
        on E:Exception do
        begin
          uBaseLog.HandleException(E,'CallShangHaiGatewayAPI');
        end;
      end;

  finally
    FreeAndNil(AIdHttp);
    FreeAndNil(ASouceStream);
    FreeAndNil(AResponseContent);
  end;
end;

function GenerateBodyUrl(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant;
                    //KCS8的RSA私钥
                    ARSAPrivateKey:String;
                    ASignType:String;
                    var AIsSignSucc:Boolean
                    ):String;
var
  I:Integer;
  ASign:String;
  AParamValue:String;
  //订单参数列表
  APayParamList:TInterfaceParameters;
begin
  AIsSignSucc:=False;

  APayParamList:=TInterfaceParameters.Create;
  try

    for I := 0 to Length(AParamNames)-1 do
    begin
      AParamValue:=AParamValues[I];
      if AParamValue<>'' then
      begin
        APayParamList.AddQueryParameter(AParamNames[I],AParamValue);
      end;
    end;


    //排序
    APayParamList.Sort;
    //生成需要签名的串
    ASign:=APayParamList.GetQueryParamsStr(False);


    //商户请求参数的签名串，详见签名
    ASign:=RSASign(ARSAPrivateKey,ASign);
    if ASign<>'' then
    begin
      AIsSignSucc:=True;
    end;


    //最终
    Result:=APayParamList.GetQueryParamsStr(False,True,'+')
                    //FPayOrderInfo经过RSA加密
                    +'&sign='+ASign+''
                    ;

  finally
    FreeAndNil(APayParamList);
  end;

end;


function GenGatewaySign(AAppID:String;AAppKey:String;AApiName:String):String;
var
  AWaitSignStr:UTF8String;
  ATimeStamp:String;

  AKey:String;

  AStringStream:TMemoryStream;
  AStreamOut:TMemoryStream;
  ABase64Stream:TStringStream;
begin
  //string=appid+apiName+timestamp
  ATimeStamp:=//'1552453311006';//
      IntToStr(DateUtils.SecondsBetween(StandardStrToDateTime('1970-01-01 00:00:00'),Now));
  AWaitSignStr:=AAppID+AApiName+ATimeStamp;


  //对待签名字符串进行 AES 加密，秘钥为 appkey 去除”-”字符，
  AKey:=ReplaceStr(AAppKey,'-','');
  //AES 算法采用 32 位长密钥的 ECB 算法


  {$IFDEF VER185}
  //D2007
  Result:=ReplaceStr(EncodeString(EncryptStringEx(AWaitSignStr,AKey,kb256)),#13#10,'');
  {$ELSE}
  AStringStream:=TMemoryStream.Create;
  AStreamOut:=TMemoryStream.Create;
  ABase64Stream:=TStringStream.Create('');
  try

      AStringStream.WriteBuffer(AWaitSignStr[1],Length(AWaitSignStr)*SizeOf(AWaitSignStr[1]));
      AStringStream.Position:=0;

      //D2010
      AESEncryptStream256(AStringStream,AStreamOut,AKey);

      AStreamOut.Position:=0;
      EncdDecd.EncodeStream(AStreamOut,ABase64Stream);

      //有换行,要去掉
      Result:=ReplaceStr(ABase64Stream.DataString,#13#10,'');
  finally
    FreeAndNil(AStringStream);
    FreeAndNil(AStreamOut);
    FreeAndNil(ABase64Stream);
  end;
  {$ENDIF}
end;



function GenerateBizContentJson_ShangHaiHospitalPay(
                  //商品的标题/交易标题/订单标题/订单关键字等。
                  ASubject:String;
                  //对一笔交易的具体描述信息。如果是多种商品，请将商品描述字符串累加传给body。
                  ABody:String;
                  //商户网站唯一订单号
                  AOut_trade_no:String;
                  //订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000]
                  ATotal_amount:String;
                  //该笔订单允许的最晚付款时间，逾期将关闭交易。
                  ATimeout_express:String;
                  //支付方式
                  APaymentType:String;
                  //回调URL
                  ANotifyUrl:String;
                  //操作员编码
                  AOperatorID:String;
                  //终端编码
                  ATerminalId:String;
                  //禁用支付渠道
                  ADisablePayChannels:String;
                  //用户授权的支付条码
                  AUserAuthPayBarCode:String
                  ): String;
var
  ABizContentJson:ISuperObject;
begin
  ABizContentJson:=TSuperObject.Create();


  ABizContentJson.S['out_trade_no']:=AOut_trade_no;
  ABizContentJson.S['total_amount']:=ATotal_amount;
  ABizContentJson.S['subject']:=ASubject;
  ABizContentJson.S['body']:=ABody;
  //为了和Android Demo对起来好排查签名是否正确
  if ATimeout_express<>'' then
  begin
    ABizContentJson.S['timeout_express']:=ATimeout_express;
  end;
  if APaymentType<>'' then
  begin
    ABizContentJson.S['payment_type']:=APaymentType;
  end;
  if ANotifyUrl<>'' then
  begin
    ABizContentJson.S['notify_url']:=ANotifyUrl;
  end;
  if AOperatorID<>'' then
  begin
    ABizContentJson.S['operator_id']:=AOperatorID;
  end;
  if ATerminalId<>'' then
  begin
    ABizContentJson.S['terminal_id']:=ATerminalID;
  end;
  if ADisablePayChannels<>'' then
  begin
    ABizContentJson.S['disable_pay_channels']:=ADisablePayChannels;
  end;
  if AUserAuthPayBarCode<>'' then
  begin
    ABizContentJson.S['auth_code']:=AUserAuthPayBarCode;
  end;


  Result:=ABizContentJson.AsJSON;

end;

function GeneratePayOrderUrl_ShangHaiHospitalPay(
                      APayMethod:String;
                      //应用ID
                      APayAppID:String;
                      //商户KCS8的RSA私钥
                      ARSAPrivateKey:String;
                      ASignType:String;
                      ABizContent:String;
                      AIsNeedUrlEncode:Boolean;
                      var AIsSignSucc:Boolean):String;
var
  ASign:String;
  ANonceStr:String;
  //订单参数列表
  APayParamList:TInterfaceParameters;
begin
  AIsSignSucc:=False;

  APayParamList:=TInterfaceParameters.Create;

  try


    ANonceStr:=GetRandStr(32);

    //准备订单参数//
    //公共参数
    //分配给开发者的应用ID
    APayParamList.AddQueryParameter('app_id',APayAppID);
    //接口名称
    APayParamList.AddQueryParameter('method',APayMethod);
    //发送请求的时间，格式"yyyy-MM-dd HH:mm:ss"
    APayParamList.AddQueryParameter('timestamp',FormatDateTime('YYYY-MM-DD HH:MM:SS',Now));
    //业务请求参数的集合，最大长度不限，除公共参数外所有请求参数都必须放在这个参数中传递，具体参照各产品快速接入文档
    APayParamList.AddQueryParameter('biz_content',ABizContent);
    //商户生成签名字符串所使用的签名算法类型，RSA
    APayParamList.AddQueryParameter('sign_type',ASignType);

    APayParamList.AddQueryParameter('nonce_str',ANonceStr);

    //排序
    APayParamList.Sort;
    //生成需要签名的串
    ASign:=APayParamList.GetQueryParamsStr(False);


    //商户请求参数的签名串，详见签名
    ASign:=RSASign(ARSAPrivateKey,ASign);
    if ASign<>'' then
    begin
      AIsSignSucc:=True;
    end;


    //最终
    Result:=APayParamList.GetQueryParamsStr(False,AIsNeedUrlEncode,'+')
                    //FPayOrderInfo经过RSA加密
                    +'&sign='+ASign+''
                    ;

  finally
    FreeAndNil(APayParamList);
  end;

end;




{ TShangHaiHospitalPay }

function TShangHaiHospitalPay.CloseTrade(
                        AOutTradeNo:String;
                        //支付方式,支付宝或微信
                        APaymentType:TPaymentType;
                        var ADesc:String;
                        var AServerResponse:String;
                        var AIsCloseSucc:Boolean):Boolean;
var
  ABizContent:ISuperObject;

  ABodyUrl:String;
  AIsSignSucc:Boolean;
  AServerResponseW:WideString;
  AServerResponseJson:ISuperObject;
begin
  Result:=False;
  AIsCloseSucc:=False;
  ADesc:='';
  AServerResponse:='';


  ABizContent:=TSuperObject.Create;
  ABizContent.S['out_trade_no']:=AOutTradeNo;
  ABizContent.S['payment_type']:=GetPaymentTypeStr(APaymentType);
  ABizContent.S['operator_id']:=FOperatorID;
  ABizContent.S['terminal_id']:=FTerminalID;



  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            'lc.trade.close',
                            //商户ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            Self.FSignType,
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if Not AIsSignSucc then
  begin
    ADesc:='签名失败';
    Exit;
  end;


  if not CallShangHaiGatewayAPI(
                          Self.FGatewayUrl,
                          FAppID,
                          FAppKey,
                          'c03d3bdc-bcc0-4061-be9b-dc3598c247b9',
                          'lc.trade.close',
                          ABodyUrl,
                          AServerResponse
                          ) then
  begin
    ADesc:='与服务器通信失败';
    Exit;
  end;




  AServerResponseW:=AServerResponse;

  {$IF CompilerVersion >= 30.0}//XE10
  AServerResponseJson:=TSuperObject.Create(AServerResponseW);
  {$ELSE}
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  {$ENDIF}


  if SameText(AServerResponseJson.S['msg'],'success') then
  begin

      if not SetTradeCloseSuccToDatabase(AOutTradeNo) then
      begin
        ADesc:='更新到数据库出错';
        Exit;
      end;

      ADesc:='交易关闭成功';
      AIsCloseSucc:=True;
  end
  else
  begin
      ADesc:='网关返回码code:'+AServerResponseJson.S['code']+#13#10
             +'网关返回码描述msg:'+AServerResponseJson.S['msg']+#13#10
             +'业务返回码code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'业务返回码描述sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;


  Result:=True;

end;


function TShangHaiHospitalPay.CancelTrade(
                                AOutTradeNo:String;
                                //支付方式,支付宝或微信
                                APaymentType:TPaymentType;
                                var ADesc:String;
                                var AServerResponse:String;
                                var AIsCancelSucc:Boolean):Boolean;
var
  ABizContent:ISuperObject;

  ABodyUrl:String;
  AIsSignSucc:Boolean;
  AServerResponseW:WideString;
  AServerResponseJson:ISuperObject;
begin
  Result:=False;
  AIsCancelSucc:=False;
  ADesc:='';
  AServerResponse:='';


  ABizContent:=TSuperObject.Create;
  ABizContent.S['out_trade_no']:=AOutTradeNo;
  ABizContent.S['payment_type']:=GetPaymentTypeStr(APaymentType);
  ABizContent.S['operator_id']:=FOperatorID;
  ABizContent.S['terminal_id']:=FTerminalID;



  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            'lc.trade.cancel',
                            //商户ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            Self.FSignType,
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if Not AIsSignSucc then
  begin
    ADesc:='签名失败';
    Exit;
  end;


  if not CallShangHaiGatewayAPI(
                          Self.FGatewayUrl,
                          FAppID,
                          FAppKey,
                          '416fcb6f-71b4-4b94-81ea-efcb8a703384',
                          'lc.trade.cancel',
                          ABodyUrl,
                          AServerResponse
                          ) then
  begin
    ADesc:='与服务器通信失败';
    Exit;
  end;




  AServerResponseW:=AServerResponse;
  {$IF CompilerVersion >= 30.0}//XE10
  AServerResponseJson:=TSuperObject.Create(AServerResponseW);
  {$ELSE}
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  {$ENDIF}
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin

      if not SetTradeCancelSuccToDatabase(AOutTradeNo) then
      begin
        ADesc:='更新到数据库失败';
        Exit;
      end;


      //有退款,要记录下来

      AIsCancelSucc:=True;
      ADesc:='交易撤消成功';
  end
  else
  begin
      ADesc:='网关返回码code:'+AServerResponseJson.S['code']+#13#10
             +'网关返回码描述msg:'+AServerResponseJson.S['msg']+#13#10
             +'业务返回码code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'业务返回码描述sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;


  Result:=True;

end;

constructor TShangHaiHospitalPay.Create(AOwner: TComponent);
begin
  inherited;

  FAppID:='d14dcc33-9cc0-4ac6-80d9-758dcef918ba';
  FAppKey:='aebd39ee-98ea-4a23-9132-67d39af4ef09';
  FGatewayUrl:='http://172.169.10.240:8090/clientgateway/';


  FPayShopID:='LCOP20190313172413707';//联空的支付宝测试S'LCOP20181218163027704';
  FPayRSAPrivateKey:=''
//        //pkcs8,14行
      +'MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALpqXujXP7ZAMSzl'+LineBreak
      +'qrTmSTHhCXDxavO/2sswj226XQOpOx3H6eqQtJcJCTDdXJjFyzvxHuAB5hbUiDQ+'+LineBreak
      +'E7buUy1vIBRpi9hnhTJ0d62ydM74mnEB4lz2Scgi0u1qqLkncjayDgcH7HFd2CWT'+LineBreak
      +'nayhwHy7aSkfqd2hEOpyQxhAc0xtAgMBAAECgYBTM9TmseQC8UXBl0SI91vmAl4X'+LineBreak
      +'Zflpj9EU7bimrg6D6s2y7h6OjkW8P9E1WSfSHD4oo+c27kIHIJcmUiq0dEz078uL'+LineBreak
      +'nqRcaSSOEkaUQPtd0Udyn8/ddtc791W3iEKu7zt2wnB1vKOutTbdC/mVIlOxrcPp'+LineBreak
      +'1OjhEzXX+WS0OOzlNQJBAOyI6Kjqxz/MYX18zNwRU4emhU3LwLL5oHe2L8XqD5Vq'+LineBreak
      +'KqeHlpi8B+A9I4WbDEonRHAlGRaAT+WDutE6D6j23zsCQQDJwZifqUIeBnOyqoyd'+LineBreak
      +'FbuNMVMPdkP8WNsg7GxN3QeQ32mOKxp9jBWj48k4weoPSJkRW8idFGRPNFgzUzeu'+LineBreak
      +'DBh3AkAWYWnqObS6o6MB1aIonHcT2by5PLMx/A6j5RgmGNx6nb4Fdf3Y28m+/On0'+LineBreak
      +'hVQnXAnMtqXmDCQDKnCtxVmf+iPrAkEAx/PFRh8iNs2gJqceOqSKPxFuRzmngVWy'+LineBreak
      +'vntxju2KjQrN+yc+1sRZwhaDm2ubg9AoW2rCdOL70v+Glj9YRHcaWwJBAJH3Yi/y'+LineBreak
      +'G4Dx5MUlmMJSwcxQYbRkRJERoKllX0hzxkynXCDWtvBFGEI6yRE2EYBcjV9Vy7wB'+LineBreak
      +'8tr5628hUmCGm3o=';
  FPayPublicRSAKey:='';

  //次要的参数
  FOperatorID:='OP001';
  FTerminalID:='NJ_T_001';
  FDisablePayChannels:='credit_group';
  FSignType:='rsa';
  FTimeoutExpress:='5m';//在用户账单列表串的状态



  //检测支付超时时间
  FCheckStateTimeoutMinitue:=1;//3;
end;

destructor TShangHaiHospitalPay.Destroy;
begin

  inherited;
end;

function TShangHaiHospitalPay.Pay(AOutTradeNo, ASubject, ABody: String;
  ATotalAmount: String;
  //支付方式,支付宝或微信
  APaymentType:TPaymentType;
  //支付方法,二维码或条码
  APayMethodType:TPayMethodType;
  //用户授权的条码
  AUserPayAuthBarCode:String;
  var ADesc:String;
  var AServerResponse:String
  ): Boolean;
var
  ABizContentStr:String;

  ABodyUrl:String;
  AIsSignSucc:Boolean;

  APayMethod:String;
  APayApiName:String;
  AServerResponseW:WideString;
  AServerResponseJson:ISuperObject;

  APayTradeQueryThread:TShangHaiHospitalPayTradeQueryThread;
begin
  Result:=False;
  ADesc:='';
  AServerResponse:='';



  case APayMethodType of
    pmtQRCode:
    begin
        //二维码支付
        APayMethod:='lc.trade.qrcode.pay';
        APayApiName:='232bc351-722f-4e50-aa33-c3c70b2a7b2b';
    end;
    pmtBarCode:
    begin
        //条码支付
        APayMethod:='lc.trade.barcode.pay';
        APayApiName:='b2ba3f5e-cc3f-4b53-b57c-4ebda9164053';
    end;
    pmtPolymerization:
    begin
        //聚合扫码支付
        APayMethod:='lc.trade.polymerization.pay';
        APayApiName:='7c80c90e-07de-4563-8052-2cb1dcedcf30';
    end;
  end;

  

  ABizContentStr:=
    uShangHaiHospitalPay.GenerateBizContentJson_ShangHaiHospitalPay(
                            ASubject,
                            ABody,
                            AOutTradeNo,
                            ATotalAmount,
                            FTimeoutExpress,
                            GetPaymentTypeStr(APaymentType),
                            FNotifyUrl,
                            FOperatorID,
                            FTerminalID,
                            FDisablePayChannels,
                            AUserPayAuthBarCode
                            );

  //生成支付的url
  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            APayMethod,
                            //商户ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            Self.FSignType,
                            ABizContentStr,
                            True,//False,
                            AIsSignSucc
                            );

  if Not AIsSignSucc then
  begin
    ADesc:='签名失败';
    Exit;
  end;



  //将该记录插入到数据库
  if FDBHelper<>nil then
  begin
    if not FDBHelper.SelfQuery_EasyInsert(
            'tblOnlinePayTrade',
            ['out_trade_no','total_amount','subject','body','payment_type','operator_id','terminal_id','auth_code','createtime',
                'refund_amount'],
            [AOutTradeNo,ATotalAmount,ASubject,ABody,GetPaymentTypeStr(APaymentType),FOperatorID,FTerminalID,AUserPayAuthBarCode,FormatDateTime('YYYY-MM-DD HH:MM:SS',Now),
                0]) then
    begin
      ADesc:='插入付款记录失败';
      Exit;
    end;
  end;




  if not CallShangHaiGatewayAPI(
                                Self.FGatewayUrl,
                                FAppID,
                                FAppKey,
                                APayApiName,
                                APayMethod,
                                ABodyUrl,
                                AServerResponse
                                ) then
  begin
    ADesc:='与服务器通信失败';
    Exit;
  end;




  AServerResponseW:=AServerResponse;
  {$IF CompilerVersion >= 30.0}//XE10
  AServerResponseJson:=TSuperObject.Create(AServerResponseW);
  {$ELSE}
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  {$ENDIF}
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin
  end
  else
  begin
      ADesc:='网关返回码code:'+AServerResponseJson.S['code']+#13#10
             +'网关返回码描述msg:'+AServerResponseJson.S['msg']+#13#10
             +'业务返回码sub_code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'业务返回码描述sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;



  Result:=True;



  //创建支付查询线程
  APayTradeQueryThread:=TShangHaiHospitalPayTradeQueryThread.Create(False,Self,APaymentType,AOutTradeNo,'',tqtQueryPayedSucc);
  APayTradeQueryThread.FreeOnTerminate:=True;


end;

function TShangHaiHospitalPay.SetTradeProcessedSuccToDatabase(AOutTradeNo: String): Boolean;
begin
  Result:=False;

  //回写状态到数据库
  if Self.FDBHelper<>nil then
  begin
      if Self.FDBHelper.SelfQuery_EasyUpdate('tblOnlinePayTrade',
                ['is_processed_succ'],
                [1],
                ' WHERE out_trade_no=:out_trade_no ',
                ['out_trade_no'],[AOutTradeNo]
                ) then
      begin
        Result:=True;
      end;
  end
  else
  begin
    Result:=True;
  end;
end;

function TShangHaiHospitalPay.SetTradeRefundProcessedSuccSuccToDatabase(
  AOutTradeNo, AOutRefundRequestNo, ARefundAmount: String): Boolean;
begin
  Result:=False;

  //回写状态到数据库
  if Self.FDBHelper<>nil then
  begin

      if Self.FDBHelper.SelfQuery_EasyUpdate('tblTradeRefund',
                                              ['is_processed_succ'],
                                              [1],
                                              ' WHERE out_refund_request_no=:out_refund_request_no ',
                                              ['out_refund_request_no'],[AOutRefundRequestNo]
                                              ) then
      begin

          //处理成功之后将总的退款金额回填到原支付记录表
          if Self.FDBHelper.SelfQuery_EasyUpdate('tblOnlinePayTrade',
                                                ['refund_amount=refund_amount+'+ARefundAmount,'is_refunded'],
                                                ['',1],
                                                ' WHERE out_trade_no=:out_trade_no ',
                                                ['out_trade_no'],[AOutTradeNo]
                                                ) then
          begin
            Result:=True;
          end;

            Result:=True;
      end;


  end
  else
  begin
    Result:=True;
  end;

end;

function TShangHaiHospitalPay.SetTradeRefundSuccSuccToDatabase(
  AOutTradeNo:String;AOutRefundRequestNo: String): Boolean;
begin
  Result:=False;

  //回写状态到数据库
  if Self.FDBHelper<>nil then
  begin

      if Self.FDBHelper.SelfQuery_EasyUpdate('tblTradeRefund',
                                              ['is_refunded'],
                                              [1],
                                              ' WHERE out_refund_request_no=:out_refund_request_no ',
                                              ['out_refund_request_no'],[AOutRefundRequestNo]
                                              ) then
      begin

//          //处理成功之后将总的退款金额回填到原支付记录表
//          if Self.FDBHelper.SelfQuery_EasyUpdate('tblOnlinePayTrade',
//                                                ['refund_amount=refund_amount+'+ARefundAmount,'is_refunded'],
//                                                ['',1],
//                                                ' WHERE out_trade_no=:out_trade_no ',
//                                                ['out_trade_no'],[AOutTradeNo]
//                                                ) then
//          begin
//            Result:=True;
//          end;

            Result:=True;
      end;


  end
  else
  begin
    Result:=True;
  end;

end;

function TShangHaiHospitalPay.QueryTrade(AOutTradeNo: String;
  //支付方式,支付宝或微信
  APaymentType:TPaymentType;
  var ADesc:String;
  var AServerResponse: String;
  var AIsPaySucc:Boolean;
  var ATradeStatus:String): Boolean;
var
  ABizContent:ISuperObject;

  ABodyUrl:String;
  AIsSignSucc:Boolean;
  AServerResponseW:WideString;
  AServerResponseJson:ISuperObject;
  ABizContentJson:ISuperObject;
begin
  Result:=False;
  ADesc:='';
  AServerResponse:='';
  ATradeStatus:='';


  ABizContent:=TSuperObject.Create;
  ABizContent.S['payment_type']:=GetPaymentTypeStr(APaymentType);
  ABizContent.S['out_trade_no']:=AOutTradeNo;


  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            'lc.trade.query',
                            //商户ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            Self.FSignType,
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if not AIsSignSucc then
  begin
    ADesc:='签名失败';
    Exit;
  end;
  

  if not CallShangHaiGatewayAPI(
                      Self.FGatewayUrl,
                      FAppID,
                      FAppKey,
                      'ba39b313-7bdd-42c0-b585-84389cdf72dc',
                      'lc.trade.query',
                      ABodyUrl,
                      AServerResponse
                      ) then
  begin
    ADesc:='与服务器通信失败';
    Exit;
  end;





  AServerResponseW:=AServerResponse;
  {$IF CompilerVersion >= 30.0}//XE10
  AServerResponseJson:=TSuperObject.Create(AServerResponseW);
  {$ELSE}
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  {$ENDIF}
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin
      ATradeStatus:=AServerResponseJson.O['biz_content'].S['trade_status'];

      if SameText(ATradeStatus,'TRADE_SUCCESS') then
      begin

          //付款成功
          //回写状态到数据库
          if Self.FDBHelper<>nil then
          begin
              ABizContentJson:=AServerResponseJson.O['biz_content'];
              if not Self.FDBHelper.SelfQuery_EasyUpdate('tblOnlinePayTrade',
                                                          ['is_payed','trade_no','trade_status','pay_date','query_time'],
                                                          [1,AOutTradeNo,ABizContentJson.S['trade_status'],ABizContentJson.S['pay_date'],FormatDateTime('YYYY-MM-DD HH:MM:SS',Now)],
                                                          ' WHERE out_trade_no=:out_trade_no ',
                                                          ['out_trade_no'],[AOutTradeNo]
                                                          ) then
              begin
                ADesc:='更新到数据库失败';
                Exit;
              end;
          end;



          ADesc:='付款成功';
          AIsPaySucc:=True;


      end;
  end
  else
  begin
      ADesc:='网关返回码code:'+AServerResponseJson.S['code']+#13#10
             +'网关返回码描述msg:'+AServerResponseJson.S['msg']+#13#10
             +'业务返回码sub_code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'业务返回码描述sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;



  Result:=True;

end;

function TShangHaiHospitalPay.QueryRefundTrade(
                              AOutTradeNo:String;
                              AOutRefundRequestNo:String;
                              //支付方式,支付宝或微信
                              APaymentType:TPaymentType;
                              var ADesc:String;
                              var AServerResponse:String;
                              var AIsRefundSucc:Boolean): Boolean;
var
  ABizContent:ISuperObject;

  ABodyUrl:String;
  AIsSignSucc:Boolean;
  AServerResponseW:WideString;
  AServerResponseJson:ISuperObject;
begin
  Result:=False;
  ADesc:='';
  AServerResponse:='';


  ABizContent:=TSuperObject.Create;
  ABizContent.S['payment_type']:=GetPaymentTypeStr(APaymentType);
  ABizContent.S['out_trade_no']:=AOutTradeNo;
  //退款申请单号
  ABizContent.S['out_request_no']:=AOutRefundRequestNo;


  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            'lc.trade.fastpay.refund.query',
                            //商户ID
                            Self.FPayShopID,
                            FPayRSAPrivateKey,
                            'rsa',
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if Not AIsSignSucc then
  begin
    ADesc:='签名失败';
    Exit;
  end;


  if not CallShangHaiGatewayAPI(
                      Self.FGatewayUrl,
                      FAppID,
                      FAppKey,
                      '5ba9a734-421d-4d11-978d-1bfcd21261d0',
                      'lc.trade.fastpay.refund.query',
                      ABodyUrl,
                      AServerResponse
                      ) then
  begin
    ADesc:='与服务器通信失败';
    Exit;
  end;



  AServerResponseW:=AServerResponse;
  {$IF CompilerVersion >= 30.0}//XE10
  AServerResponseJson:=TSuperObject.Create(AServerResponseW);
  {$ELSE}
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  {$ENDIF}
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin
      //退款成功
      AIsRefundSucc:=True;



  end
  else
  begin
      ADesc:='网关返回码code:'+AServerResponseJson.S['code']+#13#10
             +'网关返回码描述msg:'+AServerResponseJson.S['msg']+#13#10
             +'业务返回码sub_code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'业务返回码描述sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;



  Result:=True;
end;

function TShangHaiHospitalPay.RefundTrade(
                        AOutTradeNo:String;
                        //退款单号
                        AOutRefundRequestNo:String;
                        //退款原因
                        ARefundReason:String;
                        //原交易总金额
                        ATotalAmount:String;
                        ARefundAmount:String;
                        //支付方式,支付宝或微信
                        APaymentType:TPaymentType;
                        var ADesc:String;
                        var AServerResponse:String;
                        var AIsRefundSucc:Boolean): Boolean;
var
  ABizContent:ISuperObject;

  ABodyUrl:String;
  AIsSignSucc:Boolean;
  AServerResponseW:WideString;
  AServerResponseJson:ISuperObject;
begin
  Result:=False;
  AIsRefundSucc:=False;
  ADesc:='';
  AServerResponse:='';



  ABizContent:=TSuperObject.Create;
  ABizContent.S['out_trade_no']:=AOutTradeNo;
  ABizContent.S['payment_type']:=GetPaymentTypeStr(APaymentType);
  ABizContent.S['operator_id']:=FOperatorID;
  ABizContent.S['terminal_id']:=FTerminalID;
  //订单金额
  ABizContent.S['trade_amount']:=ATotalAmount;
  //退款金额
  ABizContent.S['refund_amount']:=ARefundAmount;
  //退款单号
  ABizContent.S['out_request_no']:=AOutRefundRequestNo;
  ABizContent.S['refund_reason']:=ARefundReason;


  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            'lc.trade.refund',
                            //商户ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            FSignType,
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if Not AIsSignSucc then
  begin
    ADesc:='签名失败';
    Exit;
  end;





  //将该记录插入到数据库
  if FDBHelper<>nil then
  begin
    if not FDBHelper.SelfQuery_EasyInsert(
              'tblTradeRefund',
              ['out_trade_no','out_refund_request_no','total_amount','refund_amount','reason','payment_type','operator_id','terminal_id','createtime'],
              [AOutTradeNo,AOutRefundRequestNo,ATotalAmount,ARefundAmount,ARefundReason,GetPaymentTypeStr(APaymentType),FOperatorID,FTerminalID,FormatDateTime('YYYY-MM-DD HH:MM:SS',Now)]) then
    begin
      ADesc:='插入退款记录失败';
      Exit;
    end;
  end;




  if not CallShangHaiGatewayAPI(
                      Self.FGatewayUrl,
                      FAppID,
                      FAppKey,
                      '444928c2-c1cc-441c-a031-f6d0a669e519',
                      'lc.trade.refund',
                      ABodyUrl,
                      AServerResponse
                      ) then
  begin
    ADesc:='与服务器通信失败';
    Exit;
  end;




  AServerResponseW:=AServerResponse;
  {$IF CompilerVersion >= 30.0}//XE10
  AServerResponseJson:=TSuperObject.Create(AServerResponseW);
  {$ELSE}
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  {$ENDIF}
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin

      if not SetTradeRefundSuccSuccToDatabase(AOutTradeNo,AOutRefundRequestNo) then
      begin
        ADesc:='更新到数据库失败';
        Exit;
      end;


      ADesc:='交易退款成功';
      AIsRefundSucc:=True;

  end
  else
  begin
      ADesc:='网关返回码code:'+AServerResponseJson.S['code']+#13#10
             +'网关返回码描述msg:'+AServerResponseJson.S['msg']+#13#10
             +'业务返回码sub_code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'业务返回码描述sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;




  Result:=True;

end;

function TShangHaiHospitalPay.SetTradeCancelSuccToDatabase(
  AOutTradeNo: String): Boolean;
begin
  Result:=False;

  //回写状态到数据库
  if Self.FDBHelper<>nil then
  begin
      if Self.FDBHelper.SelfQuery_EasyUpdate('tblOnlinePayTrade',
                ['is_cancelled'],
                [1],
                ' WHERE out_trade_no=:out_trade_no ',
                ['out_trade_no'],[AOutTradeNo]
                ) then
      begin
        Result:=True;
      end;
  end
  else
  begin
    Result:=True;
  end;

end;

function TShangHaiHospitalPay.SetTradeCloseSuccToDatabase(
  AOutTradeNo: String): Boolean;
begin
  Result:=False;

  //回写状态到数据库
  if Self.FDBHelper<>nil then
  begin
      if Self.FDBHelper.SelfQuery_EasyUpdate('tblOnlinePayTrade',
                ['is_closed'],
                [1],
                ' WHERE out_trade_no=:out_trade_no ',
                ['out_trade_no'],[AOutTradeNo]
                ) then
      begin
        Result:=True;
      end;
  end
  else
  begin
    Result:=True;
  end;

end;

{ TShangHaiHospitalPayTradeQueryThread }

constructor TShangHaiHospitalPayTradeQueryThread.Create(
  ACreateSuspended: Boolean;
  AShangHaiHospitalPay:TShangHaiHospitalPay;
  APaymentType:TPaymentType;
  AOutTradeNo: String;
  AOutRefundRequestNo:String;
  ATradeQueryType:TTradeQueryType);
begin
  FShangHaiHospitalPay:=AShangHaiHospitalPay;
  FOutTradeNo:=AOutTradeNo;
  FOutRefundRequestNo:=AOutRefundRequestNo;
  FPaymentType:=APaymentType;
  FTradeQueryType:=ATradeQueryType;

  Inherited Create(ACreateSuspended);
end;

procedure TShangHaiHospitalPayTradeQueryThread.DoPayResult;
begin
  if Assigned(FShangHaiHospitalPay.FOnPayResult) then
  begin
    FShangHaiHospitalPay.FOnPayResult(Self,
                                      FIsSucc,
                                      FTradeBizContent,
                                      FServerResponseJson,
                                      FDesc,
                                      Self.FIsTimeout);
  end;
end;

procedure TShangHaiHospitalPayTradeQueryThread.Execute;
var
  ABeginTime:TDateTime;
  AIsDontNeedQuery:Boolean;
  AServerResponse:String;
  AServerResponseWStr:WideString;
  ATradeStatus:String;
begin
  ABeginTime:=Now;
  AIsDontNeedQuery:=False;

  while not Self.Terminated do
  begin
          //隔三秒查询一次
          Sleep(3000);


          if (DateUtils.MinutesBetween(ABeginTime,Now)>FShangHaiHospitalPay.FCheckStateTimeoutMinitue) then
          begin
              FIsTimeout:=True;
              FDesc:='检测超时';

              //超时了
              case Self.FTradeQueryType of
                  tqtQueryPayedSucc:
                  begin
                      //是否查询超时了
                      //要做同步,万一在线程中调用的
                      TThread.Synchronize(nil,Self.DoPayResult);
                  end;
              end;
              Exit;
          end;




          //支付已经结束,不需要再查询了
          if (not AIsDontNeedQuery) then
          begin

                try
                    case Self.FTradeQueryType of
                        tqtQueryPayedSucc:
                        begin
                              //查询订单支付状态
                              FShangHaiHospitalPay.QueryTrade(
                                                                Self.FOutTradeNo,
                                                                FPaymentType,
                                                                FDesc,
                                                                AServerResponse,
                                                                FIsSucc,
                                                                ATradeStatus
                                                                );
                        end;
                        tqtQueryRefundedSucc:
                        begin
                              //查询订单退款状态
                              FShangHaiHospitalPay.QueryRefundTrade(
                                                                    Self.FOutTradeNo,
                                                                    Self.FOutRefundRequestNo,
                                                                    FPaymentType,
                                                                    FDesc,
                                                                    AServerResponse,
                                                                    FIsSucc
                                                                    );
                        end;
                    end;




                    if AServerResponse<>'' then
                    begin
                        AServerResponseWStr:=AServerResponse;
                        {$IF CompilerVersion >= 30.0}//XE10
                        FServerResponseJson:=TSuperObject.Create(AServerResponseWStr);
                        {$ELSE}
                        FServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseWStr),True);
                        {$ENDIF}

                        FDesc:='网关返回码code:'+FServerResponseJson.S['code']+#13#10
                               +'网关返回码描述msg:'+FServerResponseJson.S['msg']+#13#10
                               +'业务返回码sub_code:'+FServerResponseJson.O['biz_content'].S['sub_code']+#13#10
                               +'业务返回码描述sub_msg:'+FServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
                               ;

                        case Self.FTradeQueryType of
                            tqtQueryPayedSucc:
                            begin
                                if SameText(FServerResponseJson.O['biz_content'].S['trade_status'],'TRADE_SUCCESS') then
                                begin
                                    //支付成功
                                    FTradeBizContent.out_trade_no:=FServerResponseJson.O['biz_content'].S['out_trade_no'];
                                    FTradeBizContent.trade_no:=FServerResponseJson.O['biz_content'].S['trade_no'];
                                    FTradeBizContent.trade_status:=FServerResponseJson.O['biz_content'].S['trade_status'];
                                    {$IF CompilerVersion >= 30.0}//XE10
                                    FTradeBizContent.total_amount:=FServerResponseJson.O['biz_content'].F['total_amount'];
                                    {$ELSE}
                                    FTradeBizContent.total_amount:=FServerResponseJson.O['biz_content'].D['total_amount'];
                                    {$ENDIF}
                                    FTradeBizContent.payment_type:=FServerResponseJson.O['biz_content'].S['payment_type'];
                                    //
                                    FTradeBizContent.pay_date:=FServerResponseJson.O['biz_content'].S['pay_date'];


                                    FIsSucc:=True;
                                    FDesc:='支付成功';
                                    //不需要再次继续查询了
                                    AIsDontNeedQuery:=True;
                                end;
                            end;
                            tqtQueryRefundedSucc:
                            begin

                            end;
                        end;




                        if AIsDontNeedQuery then
                        begin
                            case Self.FTradeQueryType of
                                tqtQueryPayedSucc:
                                begin
                                  //要做同步,万一在线程中调用的
                                  TThread.Synchronize(nil,Self.DoPayResult);
                                end;

                            end;

                            //退出不再查询
                            Exit;
                        end;

                    end;

                except
                  on E:Exception do
                  begin
                    uBaseLog.HandleException(E,'TShangHaiHospitalPayTradeQueryThread.Execute');
                  end;
                end;

          end;
  end;




end;


//initialization
//  uBaseLog.GetGlobalLog.

end.
