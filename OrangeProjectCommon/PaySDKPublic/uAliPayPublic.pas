//copyright delphiteacher QQ:452330643
//2015-08-08
//未经授权,严禁出售赠送或转上他人使用
//
unit uAliPayPublic;

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

  {$IFDEF IN_ORANGESDK}
  uSkinSuperObject_Copy,
  {$ELSE}
  XSuperObject,
  {$ENDIF}

  //  uBaseLog,

  uPayAPIParam,
  uPayPublic,



  {$IFDEF IN_ORANGESDK}
  //在OrangeSDK包里面
  uFileCommon_Copy,
  uFuncCommon_Copy,
  {$ELSE}
  //在OrangeUI里面
  uFileCommon,
  uFuncCommon,
  {$ENDIF}


//  System.NetEncoding,

  uAlipayRSA2,

  {$IFDEF FMX}
  FMX.Dialogs,
  {$ENDIF}


  Classes;



const
  LineBreak=#10;




//生成支付的业务参数
function GenerateBizContentJson(
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
              //商品主类型：0—虚拟类商品，1—实物类商品 注：虚拟类商品不支持使用花呗渠道
              AGoods_type:String;
              //公用回传参数，如果请求时传递了该参数，则返回给商户时会回传该参数。支付宝会在异步通知时将该参数原样返回。本参数必须进行UrlEncode之后才可以发送给支付宝
              APassback_params:String;
              AProductCode:String='QUICK_MSECURITY_PAY';
              //用户付款码
              AUserPayCode:String='';
              AScene:String=''
              ):String;



function DoGenerateBizContentJson(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant):ISuperObject;

function GenerateBizContentJsonStr(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant):String;

function GenerateAlipayAppPayUrl(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant;
                    //商户KCS8的RSA私钥
//                    ARSAPrivateKey:String;
                    ARSAPrivateKey2:String;
//                    ASignType:String;
                    var AIsSignSucc:Boolean;
                    ANeedUrlEncode:Boolean=True
                    ):String;





//生成支付宝手机支付订单URL
function GenerateAliPayAppPayOrderUrl(
            APayMethod:String;
            //应用ID
            AAlipayAppID:String;
            //商户KCS8的RSA私钥
//            ARSAPrivateKey:String;
            ARSAPrivateKey2:String;
//            ASignType:String;
            //支付结果通知地址
            ANotify_url:String;
            //支付业务参数
            ABizContent:String;
            var AIsSignSucc:Boolean):String;


//去掉私钥中的换行符
function ConvertPrivateKeyNoEnter(APrivateKey:String):String;
//给私钥添加换行符
function ConvertPrivateKeyHasEnter(APrivateKey:String):String;





implementation




function ConvertPrivateKeyNoEnter(APrivateKey:String):String;
begin
//  Result:=ReplaceStr(APrivateKey,LineBreak,'');


  //D7
  Result:=StringReplace(APrivateKey,LineBreak,'', [rfReplaceAll]);
end;

function ConvertPrivateKeyHasEnter(APrivateKey:String):String;
begin
  Result:='';
  if Pos(LineBreak,APrivateKey)=0 then
  begin
    //不存在换行,那么添加
    while Length(APrivateKey)>0 do
    begin
      Result:=Result+Copy(APrivateKey,LowStr(APrivateKey),64);
      APrivateKey:=Copy(APrivateKey,LowStr(APrivateKey)+64,MaxInt);
      if APrivateKey<>'' then
      begin
        Result:=Result+LineBreak;
      end;
    end;
  end;
end;



function GenerateAliPayAppPayOrderUrl(
                      APayMethod:String;
                      //应用ID
                      AAlipayAppID:String;
                      //商户KCS8的RSA私钥
//                      ARSAPrivateKey:String;
                      ARSAPrivateKey2:String;
//                      ASignType:String;
                      //支付结果通知地址
                      ANotify_url:String;
                      ABizContent:String;
                      var AIsSignSucc:Boolean):String;
var
  ASign:String;
  //订单参数列表
  APayParamList:TInterfaceParameters;
begin
  AIsSignSucc:=False;

  APayParamList:=TInterfaceParameters.Create;

  try

    //准备订单参数//
    //公共参数
    //支付宝分配给开发者的应用ID
    APayParamList.AddQueryParameter('app_id',AAlipayAppID);
    //接口名称
    APayParamList.AddQueryParameter('method',APayMethod);//'alipay.trade.app.pay');
    //请求使用的编码格式，如utf-8,gbk,gb2312等
    APayParamList.AddQueryParameter('charset','utf-8');
    //发送请求的时间，格式"yyyy-MM-dd HH:mm:ss"
    APayParamList.AddQueryParameter('timestamp',FormatDateTime('YYYY-MM-DD HH:MM:SS',Now));
    //调用的接口版本，固定为：1.0
    APayParamList.AddQueryParameter('version','1.0');
    //支付宝服务器主动通知商户服务器里指定的页面http/https路径。建议商户使用https
    APayParamList.AddQueryParameter('notify_url',ANotify_url);
    //业务请求参数的集合，最大长度不限，除公共参数外所有请求参数都必须放在这个参数中传递，具体参照各产品快速接入文档
    APayParamList.AddQueryParameter('biz_content',ABizContent);
    //商户生成签名字符串所使用的签名算法类型，目前支持RSA2和RSA，推荐使用RSA2
//    APayParamList.AddQueryParameter('sign_type',ASignType);//'RSA');
    APayParamList.AddQueryParameter('sign_type','RSA2');//'RSA');





    //排序
    APayParamList.Sort;
    //生成需要签名的串
    ASign:=APayParamList.GetQueryParamsStr(False);


    //商户请求参数的签名串，详见签名
//    if ASignType='RSA2' then
//    begin
      ASign:=RSASign2(ARSAPrivateKey2,ASign);
//    end
//    else
//    begin
//      ASign:=RSASign(ARSAPrivateKey,ASign);
//    end;
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

function GenerateAlipayAppPayUrl(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant;
                    //商户KCS8的RSA私钥
//                    ARSAPrivateKey:String;
                    ARSAPrivateKey2:String;
//                    ASignType:String;
                    var AIsSignSucc:Boolean;
                    ANeedUrlEncode:Boolean
                    ):String;
var
  I:Integer;
  ASign:String;
  AParamValue:String;
  //订单参数列表
  APayParamList:TInterfaceParameters;
begin

//  {$IFDEF FREE_VERSION}
//  TThread.Synchronize(nil,procedure
//  begin
//    ShowMessage('三方SDK免费版限制');
//  end);
//  {$ENDIF}


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


//    //商户请求参数的签名串，详见签名
//    if ASignType='RSA2' then
//    begin
      ASign:=RSASign2(ARSAPrivateKey2,ASign);
//    end
//    else
//    begin
//      ASign:=RSASign(ARSAPrivateKey,ASign);
//    end;
    if ASign<>'' then
    begin
      AIsSignSucc:=True;
    end;


    //最终
    Result:=APayParamList.GetQueryParamsStr(False,ANeedUrlEncode,'+')
                    //FPayOrderInfo经过RSA加密
                    +'&sign='+ASign+''
                    ;

  finally
    FreeAndNil(APayParamList);
  end;

end;


function GenerateBizContentJsonStr(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant):String;
var
  I: Integer;
  AParamValue:String;
var
  ABizContentJson:ISuperObject;
begin
  ABizContentJson:=TSuperObject.Create();

  Result:='';


  for I := 0 to Length(AParamNames)-1 do
  begin
    AParamValue:=AParamValues[I];
    if AParamValue<>'' then
    begin
      ABizContentJson.S[AParamNames[I]]:=AParamValue;
    end;
  end;

  Result:=ABizContentJson.AsJSON;
end;

function DoGenerateBizContentJson(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant):ISuperObject;
var
  I: Integer;
  AParamValue:String;
var
  ABizContentJson:ISuperObject;
begin
  Result:=nil;

  ABizContentJson:=TSuperObject.Create();


  for I := 0 to Length(AParamNames)-1 do
  begin
    AParamValue:=AParamValues[I];
    if AParamValue<>'' then
    begin
      ABizContentJson.S[AParamNames[I]]:=AParamValue;
    end;
  end;

  Result:=ABizContentJson;
end;

function GenerateBizContentJson(
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
                  //商品主类型：0—虚拟类商品，1—实物类商品 注：虚拟类商品不支持使用花呗渠道
                  AGoods_type:String;
                  //公用回传参数，如果请求时传递了该参数，则返回给商户时会回传该参数。支付宝会在异步通知时将该参数原样返回。本参数必须进行UrlEncode之后才可以发送给支付宝
                  APassback_params:String;
                  AProductCode:String;
                  //用户付款码
                  AUserPayCode:String;
                  AScene:String
                  ): String;
var
  ABizContentJson:ISuperObject;
begin
  ABizContentJson:=TSuperObject.Create();


  //为了和Android Demo对起来好排查签名是否正确
  if ATimeout_express<>'' then
  begin
    ABizContentJson.S['timeout_express']:=ATimeout_express;
  end;

  //销售产品码，商家和支付宝签约的产品码，为固定值QUICK_MSECURITY_PAY
  if AProductCode<>'' then
  begin
    ABizContentJson.S['product_code']:=AProductCode;//'QUICK_MSECURITY_PAY';
  end;

  ABizContentJson.S['total_amount']:=ATotal_amount;
  ABizContentJson.S['subject']:=ASubject;
  ABizContentJson.S['body']:=ABody;
  ABizContentJson.S['out_trade_no']:=AOut_trade_no;
  if AGoods_type<>'' then
  begin
    ABizContentJson.S['goods_type']:=AGoods_type;
  end;
  if APassback_params<>'' then
  begin
    ABizContentJson.S['passback_params']:=APassback_params;
  end;
  if AUserPayCode<>'' then
  begin
    ABizContentJson.S['auth_code']:=AUserPayCode;
  end;
  if AScene<>'' then
  begin
    ABizContentJson.S['scene']:=AScene;
  end;

  Result:=ABizContentJson.AsJSON;

end;



end.
