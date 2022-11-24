//copyright delphiteacher QQ:452330643
//2015-08-08
//未经授权,严禁出售赠送或转上他人使用
//
unit uWxpayPublic;

interface
//{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MSWINDOWS) }
//{$DEFINE FMX}
//{$ENDIF}

//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
{$IFNDEF FMX}
{$IFNDEF VCL}
{$I FrameWork.inc}
{$ENDIF}
{$ENDIF}


uses
  SysUtils,
//  System.IOUtils,
//  System.Types,
  Classes,


  {$IF CompilerVersion >= 30.0}//XE10
  MD5,
  {$ELSE}
  MD5_D7,
  {$IFEND}

  Math,
  DateUtils,
  StrUtils,
//  uCaptcha,

//  Xml.XMLDoc,
//  Xml.XMLIntf,
//  Xml.adomxmldom,

  XMLDoc,
  XMLIntf,
//  Xml.adomxmldom,


  //创建xml要用,com
  {$IFDEF MSWINDOWS}
  ActiveX,
  {$ENDIF}


  //创建xml要用
  {$IFDEF FMX}
  FMX.Forms,
  {$ENDIF}
  {$IFDEF VCL}
  Forms,
  {$ENDIF}


  uPayPublic,
  uPayAPIParam,
  uWorkThreadList,
  uFuncCommon_Copy
  ;




//生成微信手机支付的预付单号和签名
function GenerateWxpayAppPayPrepayId_XMLPackage(
                    //微信应用的ID
                    AAppID:String;
//                    AAppSecret:String;
                    //商户的ID
                    APartnerID:String;
                    //商户的密钥
                    APartnerKey:String;
                    //订单内容
                    ABody:String;
                    //价格(分)
                    ATotalFee:Integer;
                    //随机字符串
                    ANonceStr:String;
                    //商户订单号
                    AOutTradeNo:String;
                    //终端IP
                    ASpbillCreateIP:String;
                    //通知地址,接收微信支付异步通知回调地址
                    ANotifyUrl:String;
                    //APP
                    ATradeType:String;
                    //自定义的附加数据,通知时原样返回,可以为空
                    AAttach:String='';
                    AUserPayAuthCode:String='';
                    ASubPartnerID:String=''):String;


//通用的用于生成微信接口请求XML包的方法
function GenerateWxpayAppPayXMLPackage(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant;
                    APartnerKey:String):String;



//从微信返回的XML中找到预付单号
function FindWxpayAppPayPrepayId(AXML:String;var AError:String):String;
//从微信返回的XML中找到预付单号,扫码支付的URL
function FindWxpayAppPayPrepayIdEx(AXML:String;var APrepayId:String;var AQRCodePayUrl:String;var AError:String):Boolean;
//微信支付返回是否成功
function IsWxpayAppPayResponseSucc(AXML:String;var AError:String):Boolean;
function FindXMLTextByNodeName(AXML:String;ANodeName:String;var AError:String):String;



//获取直接调起支付所需要的参数
function GetWxpayDirectPayParams(AAppID:String;
                                 APartnerID:String;
                                 APartnerKey:String;
                                 APrepayId:String;
                                 var ANonceStr:String;
                                 var ATimeStamp:Integer;
                                 var ASign:String
                                 ):Boolean;



function MD5En(AContenStr:string):string;



function CreateUTF8StringStream(AStr:String):TStringStream;



implementation

function CreateUTF8StringStream(AStr:String):TStringStream;
  {$IF CompilerVersion < 21.0}//D7
var
  AUTF8Str:UTF8String;
  {$IFEND}
begin
  {$IF CompilerVersion < 21.0}//D7
  Result:=TStringStream.Create('');

  AUTF8Str:=AnsiToUTF8(AStr);
  Result.WriteBuffer(PAnsiChar(AUTF8Str)^,Length(AUTF8Str)-1);


  {$ELSE}
  Result:=TStringStream.Create(AStr,TEncoding.UTF8);
  {$IFEND}
end;

function MD5En(AContenStr:string):string;
begin
//  AContenStr:=
//    'appid=wx8e8f30be080c6177&auth_code=555555555555555555555555555'
//    +'&body=百果园&detail=西瓜等水果&mch_id=1487423322'
//    +'&nonce_str=wn714q3v875u4hd3snyfpfcmfcogr2le&out_trade_no=20180720133537537-8437'
//    +'&spbill_create_ip=192.168.1.1&total_fee=10&key=13857563773wangnengdelphiteacher';
  //正确的结果
  //'4DE015B3F79341717572DA26146FFAA6'


  {$IF CompilerVersion >= 30.0}//XE10
  Result:=MD5.MD5En(AContenStr);
  {$ELSE}
  Result:=MD5_D7.MD5En(AContenStr);
  {$IFEND}
end;


function GetWxpayDirectPayParams(AAppID:String;
                                 APartnerID:String;
                                 APartnerKey:String;
                                 APrepayId:String;
                                 var ANonceStr:String;
                                 var ATimeStamp:Integer;
                                 var ASign:String
                                 ): Boolean;
var
  APayParamList:TInterfaceParameters;
begin
  Result:=False;

  //获取到了预付单号
  //自1970年1月1日 0点0分0秒以来的秒数
  ATimeStamp:=DateUtils.SecondsBetween(StandardStrToDateTime('1970-01-01 00:00:00'),Now);

  //生成随机串
  ANonceStr:=GetRandStr(32);


  APayParamList:=TInterfaceParameters.Create;
  try
    APayParamList.Clear(True);
    //公众账号ID
    APayParamList.AddQueryParameter('appid',AAppID);
    //商户号
    APayParamList.AddQueryParameter('partnerid',APartnerID);

    //随机字符串,随机字符串，不长于32位
    APayParamList.AddQueryParameter('noncestr',ANonceStr);
    APayParamList.AddQueryParameter('package','Sign=WXPay');
    //时间戳
    APayParamList.AddQueryParameter('timestamp',IntToStr(ATimeStamp));
    //预付单号
    APayParamList.AddQueryParameter('prepayid',APrepayId);
    APayParamList.Sort;


    ASign:=MD5En(APayParamList.GetQueryParamsStr(False)+'&key='+APartnerKey);

    Result:=True;
  finally
    FreeAndNil(APayParamList);
  end;
end;

function FindWxpayAppPayPrepayId(AXML:String;var AError:String):String;
var
  XMLDocument: TXMLDocument;
  XMLNode: IXMLNode;
begin
  {$IFDEF MSWINDOWS}
  ActiveX.CoInitialize(nil);
  {$ENDIF}

  Result:='';
  AError:='';

  XMLDocument := TXMLDocument.Create(Application);
  try

    //成功
    //<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>
    //<return_msg><![CDATA[OK]]></return_msg>
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>
    //<mch_id><![CDATA[1487423322]]></mch_id>
    //<nonce_str><![CDATA[XRptpQizjlPFcooG]]></nonce_str>
    //<sign><![CDATA[CBE4DA27B788898617304DCFCBC8FA09]]></sign>
    //<result_code><![CDATA[SUCCESS]]></result_code>
    //<prepay_id><![CDATA[wx201711161112268ec945442d0288783717]]></prepay_id>
    //<trade_type><![CDATA[APP]]></trade_type>
    //</xml>

    //失败
    //'<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>'#$A'
    //<return_msg><![CDATA[OK]]></return_msg>'#$A'
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>'#$A'
    //<mch_id><![CDATA[1487423322]]></mch_id>'#$A'
    //<nonce_str><![CDATA[9qJmtsWjGEN945fh]]></nonce_str>'#$A'
    //<sign><![CDATA[86972C2DE74CE8B957BDEF16B31E4DB1]]></sign>'#$A'
    //<result_code><![CDATA[FAIL]]></result_code>'#$A'
    //<err_code><![CDATA[INVALID_REQUEST]]></err_code>'#$A'
    //<err_code_des><![CDATA[201 商户订单号重复]]></err_code_des>'#$A'
    //</xml>'


    //'<xml>
    //<return_code><![CDATA[FAIL]]></return_code>'#$A'
    //<return_msg><![CDATA[商户号该产品权限未开通，请前往商户平台>产品中心检查后重试]]></return_msg>'#$A'
    //</xml>'


    XMLDocument.Active := True;
    XMLDocument.Version := '1.0';
    XMLDocument.Encoding := 'UTF-8';
    XMLDocument.LoadFromXML(AXML);
    XMLNode := XMLDocument.DocumentElement;



    if (XMLNode.ChildNodes.FindNode('return_code')<>nil)
      and (XMLNode.ChildNodes.FindNode('return_msg')<>nil)
      and (XMLNode.ChildNodes.FindNode('return_code').Text='SUCCESS')
      and (XMLNode.ChildNodes.FindNode('return_msg').Text='OK')
      then
    begin
        //接口调用成功
        if (XMLNode.ChildNodes.FindNode('result_code')<>nil)
          and (XMLNode.ChildNodes.FindNode('result_code').Text='SUCCESS')
          then
        begin

            //没有错误
            if XMLNode.ChildNodes.FindNode('prepay_id')<>nil then
            begin
              //成功
              Result:=XMLNode.ChildNodes.FindNode('prepay_id').Text;
            end
            else
            begin
              AError:='XML中不存在prepay_id结点';
            end;

        end
        else
        begin
            AError:='Unknow';
            if XMLNode.ChildNodes.FindNode('err_code_des')<>nil then
            begin
              //失败
              AError:=XMLNode.ChildNodes.FindNode('err_code_des').Text;
            end;
        end;


    end
    else
    begin
        //接口调用有错误
        AError:='Unknow';
        if XMLNode.ChildNodes.FindNode('return_msg')<>nil then
        begin
          //失败
          AError:=XMLNode.ChildNodes.FindNode('return_msg').Text;
        end;
    end;


  finally
    FreeAndNil(XMLDocument);
    {$IFDEF MSWINDOWS}
    ActiveX.CoUnInitialize();
    {$ENDIF}
  end;
end;

function FindWxpayAppPayPrepayIdEx(AXML:String;var APrepayId:String;var AQRCodePayUrl:String;var AError:String):Boolean;
var
  XMLDocument: TXMLDocument;
  XMLNode: IXMLNode;
begin
  {$IFDEF MSWINDOWS}
  ActiveX.CoInitialize(nil);
  {$ENDIF}

  Result:=False;
  APrepayId:='';
  AQRCodePayUrl:='';
  AError:='';

  XMLDocument := TXMLDocument.Create(Application);
  try

    //成功
    //<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>
    //<return_msg><![CDATA[OK]]></return_msg>
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>
    //<mch_id><![CDATA[1487423322]]></mch_id>
    //<nonce_str><![CDATA[XRptpQizjlPFcooG]]></nonce_str>
    //<sign><![CDATA[CBE4DA27B788898617304DCFCBC8FA09]]></sign>
    //<result_code><![CDATA[SUCCESS]]></result_code>
    //<prepay_id><![CDATA[wx201711161112268ec945442d0288783717]]></prepay_id>
    //<trade_type><![CDATA[APP]]></trade_type>
    //</xml>

    //失败
    //'<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>'#$A'
    //<return_msg><![CDATA[OK]]></return_msg>'#$A'
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>'#$A'
    //<mch_id><![CDATA[1487423322]]></mch_id>'#$A'
    //<nonce_str><![CDATA[9qJmtsWjGEN945fh]]></nonce_str>'#$A'
    //<sign><![CDATA[86972C2DE74CE8B957BDEF16B31E4DB1]]></sign>'#$A'
    //<result_code><![CDATA[FAIL]]></result_code>'#$A'
    //<err_code><![CDATA[INVALID_REQUEST]]></err_code>'#$A'
    //<err_code_des><![CDATA[201 商户订单号重复]]></err_code_des>'#$A'
    //</xml>'


    //'<xml>
    //<return_code><![CDATA[FAIL]]></return_code>'#$A'
    //<return_msg><![CDATA[商户号该产品权限未开通，请前往商户平台>产品中心检查后重试]]></return_msg>'#$A'
    //</xml>'


    XMLDocument.Active := True;
    XMLDocument.Version := '1.0';
    XMLDocument.Encoding := 'UTF-8';
    XMLDocument.LoadFromXML(AXML);
    XMLNode := XMLDocument.DocumentElement;



    if (XMLNode.ChildNodes.FindNode('return_code')<>nil)
      and (XMLNode.ChildNodes.FindNode('return_msg')<>nil)
      and (XMLNode.ChildNodes.FindNode('return_code').Text='SUCCESS')
      and (XMLNode.ChildNodes.FindNode('return_msg').Text='OK')
      then
    begin
        //接口调用成功
        if (XMLNode.ChildNodes.FindNode('result_code')<>nil)
          and (XMLNode.ChildNodes.FindNode('result_code').Text='SUCCESS')
          then
        begin

            //没有错误
            if XMLNode.ChildNodes.FindNode('prepay_id')<>nil then
            begin
              //成功
              APrepayId:=XMLNode.ChildNodes.FindNode('prepay_id').Text;

              Result:=True;
            end
            else
            begin
              AError:='XML中不存在prepay_id结点';
            end;

            //没有错误
            if XMLNode.ChildNodes.FindNode('code_url')<>nil then
            begin
              //成功
              AQRCodePayUrl:=XMLNode.ChildNodes.FindNode('code_url').Text;
            end
            else
            begin
              //AError:='XML中不存在code_url结点';
            end;


        end
        else
        begin
            AError:='Unknow';
            if XMLNode.ChildNodes.FindNode('err_code_des')<>nil then
            begin
              //失败
              AError:=XMLNode.ChildNodes.FindNode('err_code_des').Text;
            end;
        end;


    end
    else
    begin
        //接口调用有错误
        AError:='Unknow';
        if XMLNode.ChildNodes.FindNode('return_msg')<>nil then
        begin
          //失败
          AError:=XMLNode.ChildNodes.FindNode('return_msg').Text;
        end;
    end;


  finally
    FreeAndNil(XMLDocument);
    {$IFDEF MSWINDOWS}
    ActiveX.CoUnInitialize();
    {$ENDIF}
  end;
end;

function IsWxpayAppPayResponseSucc(AXML:String;var AError:String):Boolean;
var
  XMLDocument: TXMLDocument;
  XMLNode: IXMLNode;
begin
  {$IFDEF MSWINDOWS}
  ActiveX.CoInitialize(nil);
  {$ENDIF}

  Result:=False;
  AError:='';

  XMLDocument := TXMLDocument.Create(Application);
  try

    //成功
    //<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>
    //<return_msg><![CDATA[OK]]></return_msg>
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>
    //<mch_id><![CDATA[1487423322]]></mch_id>
    //<nonce_str><![CDATA[XRptpQizjlPFcooG]]></nonce_str>
    //<sign><![CDATA[CBE4DA27B788898617304DCFCBC8FA09]]></sign>
    //<result_code><![CDATA[SUCCESS]]></result_code>
    //<prepay_id><![CDATA[wx201711161112268ec945442d0288783717]]></prepay_id>
    //<trade_type><![CDATA[APP]]></trade_type>
    //</xml>

    //失败
    //'<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>'#$A'
    //<return_msg><![CDATA[OK]]></return_msg>'#$A'
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>'#$A'
    //<mch_id><![CDATA[1487423322]]></mch_id>'#$A'
    //<nonce_str><![CDATA[9qJmtsWjGEN945fh]]></nonce_str>'#$A'
    //<sign><![CDATA[86972C2DE74CE8B957BDEF16B31E4DB1]]></sign>'#$A'
    //<result_code><![CDATA[FAIL]]></result_code>'#$A'
    //<err_code><![CDATA[INVALID_REQUEST]]></err_code>'#$A'
    //<err_code_des><![CDATA[201 商户订单号重复]]></err_code_des>'#$A'
    //</xml>'


    //'<xml>
    //<return_code><![CDATA[FAIL]]></return_code>'#$A'
    //<return_msg><![CDATA[商户号该产品权限未开通，请前往商户平台>产品中心检查后重试]]></return_msg>'#$A'
    //</xml>'


    XMLDocument.Active := True;
    XMLDocument.Version := '1.0';
    XMLDocument.Encoding := 'UTF-8';
    XMLDocument.LoadFromXML(AXML);
    XMLNode := XMLDocument.DocumentElement;



    if (XMLNode.ChildNodes.FindNode('return_code')<>nil)
      and (XMLNode.ChildNodes.FindNode('return_msg')<>nil)
      and (XMLNode.ChildNodes.FindNode('return_code').Text='SUCCESS')
      and (XMLNode.ChildNodes.FindNode('return_msg').Text='OK')
      then
    begin
        //接口调用成功
        if (XMLNode.ChildNodes.FindNode('result_code')<>nil)
          and (XMLNode.ChildNodes.FindNode('result_code').Text='SUCCESS')
          then
        begin

            //没有错误
            Result:=True;

        end
        else
        begin
            AError:='Unknow';
            if XMLNode.ChildNodes.FindNode('err_code_des')<>nil then
            begin
              //失败
              AError:=XMLNode.ChildNodes.FindNode('err_code_des').Text;
            end;
        end;


    end
    else
    begin
        //接口调用有错误
        AError:='Unknow';
        if XMLNode.ChildNodes.FindNode('return_msg')<>nil then
        begin
          //失败
          AError:=XMLNode.ChildNodes.FindNode('return_msg').Text;
        end;
    end;


  finally
    FreeAndNil(XMLDocument);
    {$IFDEF MSWINDOWS}
    ActiveX.CoUnInitialize();
    {$ENDIF}
  end;
end;

function FindXMLTextByNodeName(AXML:String;ANodeName:String;var AError:String):String;
var
  XMLDocument: TXMLDocument;
  XMLNode: IXMLNode;
begin
  {$IFDEF MSWINDOWS}
  ActiveX.CoInitialize(nil);
  {$ENDIF}

  Result:='';
  XMLDocument := TXMLDocument.Create(Application);
  try

    //成功
    //<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>
    //<return_msg><![CDATA[OK]]></return_msg>
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>
    //<mch_id><![CDATA[1487423322]]></mch_id>
    //<nonce_str><![CDATA[XRptpQizjlPFcooG]]></nonce_str>
    //<sign><![CDATA[CBE4DA27B788898617304DCFCBC8FA09]]></sign>
    //<result_code><![CDATA[SUCCESS]]></result_code>
    //<prepay_id><![CDATA[wx201711161112268ec945442d0288783717]]></prepay_id>
    //<trade_type><![CDATA[APP]]></trade_type>
    //</xml>

    //失败
    //'<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>'#$A'
    //<return_msg><![CDATA[OK]]></return_msg>'#$A'
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>'#$A'
    //<mch_id><![CDATA[1487423322]]></mch_id>'#$A'
    //<nonce_str><![CDATA[9qJmtsWjGEN945fh]]></nonce_str>'#$A'
    //<sign><![CDATA[86972C2DE74CE8B957BDEF16B31E4DB1]]></sign>'#$A'
    //<result_code><![CDATA[FAIL]]></result_code>'#$A'
    //<err_code><![CDATA[INVALID_REQUEST]]></err_code>'#$A'
    //<err_code_des><![CDATA[201 商户订单号重复]]></err_code_des>'#$A'
    //</xml>'

    XMLDocument.Active := True;
    XMLDocument.Version := '1.0';
    XMLDocument.Encoding := 'UTF-8';
    XMLDocument.LoadFromXML(AXML);
    XMLNode := XMLDocument.DocumentElement;


    //没有错误
    if XMLNode.ChildNodes.FindNode(ANodeName)<>nil then
    begin
      //成功
      Result:=XMLNode.ChildNodes.FindNode(ANodeName).Text;
    end
    else
    begin
      AError:='XML中不存在'+ANodeName+'节点';
    end;


  finally
    FreeAndNil(XMLDocument);
    {$IFDEF MSWINDOWS}
    ActiveX.CoUnInitialize();
    {$ENDIF}
  end;
end;

function GenerateWxpayAppPayPrepayId_XMLPackage(
                    //微信应用的ID
                    AAppID:String;
//                    AAppSecret:String;
                    //商户的ID
                    APartnerID:String;
                    //商户的密钥
                    APartnerKey:String;
                    //订单内容
                    ABody:String;
                    //价格(分)
                    ATotalFee:Integer;
                    //随机字符串
                    ANonceStr:String;
                    //商户订单号
                    AOutTradeNo:String;
                    //终端IP
                    ASpbillCreateIP:String;
                    //通知地址,接收微信支付异步通知回调地址
                    ANotifyUrl:String;
                    //交易类型APP
                    ATradeType:String;
                    //自定义的附加数据,通知时原样返回,可以为空
                    AAttach:String;
                    AUserPayAuthCode:String;
                    ASubPartnerID:String):String;
var
  APayParamList:TInterfaceParameters;
begin

  Result:='';

  APayParamList:=TInterfaceParameters.Create;
  try

    //调用统一下单API
    APayParamList.Clear(True);

    //公众账号ID
    APayParamList.AddQueryParameter('appid',AAppID);
    //商户号
    APayParamList.AddQueryParameter('mch_id',APartnerID);

    if ASubPartnerID<>'' then
    begin
      APayParamList.AddQueryParameter('sub_mch_id',ASubPartnerID);
    end;

    //随机字符串,随机字符串，不长于32位
    APayParamList.AddQueryParameter('nonce_str',ANonceStr);
    //商品描述
    APayParamList.AddQueryParameter('body',ABody);//Ipad mini  16G  白色  测试商品
    //商品详情
//    APayParamList.AddQueryParameter('detail','Ipad mini  16G  白色');
  //  //附加数据,附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
  //  APayParamList.AddQueryParameter('attach','test');
    //商户订单号
    APayParamList.AddQueryParameter('out_trade_no',AOutTradeNo);
    //总金额,订单总金额，以分为单位
    APayParamList.AddQueryParameter('total_fee',IntToStr(ATotalFee));


    //终端IP,APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP。
    APayParamList.AddQueryParameter('spbill_create_ip',ASpbillCreateIP);
    //通知地址,接收微信支付异步通知回调地址
    APayParamList.AddQueryParameter('notify_url',ANotifyUrl);


    //交易类型,取值如下：JSAPI，NATIVE，APP
    if ATradeType<>'' then
    begin
      APayParamList.AddQueryParameter('trade_type',ATradeType);
    end;

    if Trim(AAttach)<>'' then
    begin
      APayParamList.AddQueryParameter('attach',AAttach);
    end;

    if Trim(AUserPayAuthCode)<>'' then
    begin
      APayParamList.AddQueryParameter('auth_code',AUserPayAuthCode);
    end;



    //生成签名
    //生成需要签名的串
    APayParamList.Sort;

    //签名
    APayParamList.AddQueryParameter('sign',
                MD5En(APayParamList.GetQueryParamsStr(False)
                +'&key='+APartnerKey)
                );

    Result:=APayParamList.GetXMLPackage;

  finally
    FreeAndNil(APayParamList);
  end;
end;


function GenerateWxpayAppPayXMLPackage(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant;
                    APartnerKey:String):String;
var
  APayParamList:TInterfaceParameters;
  I: Integer;
  AParamValue:String;
begin

  Result:='';

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




    //生成签名
    //生成需要签名的串
    APayParamList.Sort;

    //最后加上签名
    //签名
    APayParamList.AddQueryParameter('sign',
                MD5En(APayParamList.GetQueryParamsStr(False)
                +'&key='+APartnerKey)
                );

    Result:=APayParamList.GetXMLPackage;

  finally
    FreeAndNil(APayParamList);
  end;
end;



end.
