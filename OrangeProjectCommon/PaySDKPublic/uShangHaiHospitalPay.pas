unit uShangHaiHospitalPay;

interface


//���ڹ����·���FrameWork.inc
//�����ڹ�������������FMX����ָ��
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
  //֧����ʽ
  TPaymentType=(
                //֧����
                ptAlipay,
                //΢��֧��
                ptWeixin,
                //�ۺ�ɨ��֧��
                ptPolymerization);
  //֧������
  TPayMethodType=(
                  //��ά��֧��
                  pmtQRCode,
                  //����֧��
                  pmtBarCode,
                  //�ۺ�ɨ��֧��
                  pmtPolymerization);


  //���׳ɹ���¼
  TTradeBizContent=record
    //�ڲ����׺�
    out_trade_no:String;
    //���׺�
    trade_no:String;
    //����״̬
    trade_status:String;
    //���׽��
    total_amount:Double;
    //֧����ʽ
    payment_type:String;
    pay_date:String;
  end;


  //֧������¼�
  TPayResultEvent=procedure(Sender:TObject;
                            //�Ƿ�֧���ɹ�
                            AIsSucc:Boolean;
                            //��������
                            ATradeBizContent:TTradeBizContent;
                            //���������ص��ַ���
                            AServerResponseJson:ISuperObject;
                            //����
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

    //��Ҫ�Ĳ���
    FOperatorID:String;
    FTerminalID:String;
    FDisablePayChannels:String;
    FSignType:String;
    FTimeoutExpress:String;
    FNotifyUrl:String;


    //���֧����ʱ��ʱ��(����)
    FCheckStateTimeoutMinitue:Integer;
  private
    FOnPayResult: TPayResultEvent;
  public
    FDBHelper:TADODBHelper;
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    //���ý��״���ɹ�
    function SetTradeProcessedSuccToDatabase(AOutTradeNo:String):Boolean;
    //���ý��׳����ɹ�
    function SetTradeCancelSuccToDatabase(AOutTradeNo:String):Boolean;
    //���ý��׹رճɹ�
    function SetTradeCloseSuccToDatabase(AOutTradeNo:String):Boolean;
  public
    //���ý����˿�ɹ�
    function SetTradeRefundSuccSuccToDatabase(AOutTradeNo:String;AOutRefundRequestNo:String):Boolean;
    //���ý����˿��ɹ�
    function SetTradeRefundProcessedSuccSuccToDatabase(AOutTradeNo:String;AOutRefundRequestNo:String;ARefundAmount:String):Boolean;
  public
    //��ά��֧��
    function Pay(
                //�ڲ�����
                AOutTradeNo:String;
                //����
                ASubject:String;
                //����
                ABody:String;
                //�ܽ��
                ATotalAmount:String;
                //֧����ʽ,֧������΢��
                APaymentType:TPaymentType;
                //֧������,��ά�������
                APayMethodType:TPayMethodType;
                //�û���Ȩ������
                AUserPayAuthBarCode:String;
                var ADesc:String;
                var AServerResponse:String
                ):Boolean;


    //��ѯ֧�����
    function QueryTrade(AOutTradeNo:String;
                          //֧����ʽ,֧������΢��
                          APaymentType:TPaymentType;
                          var ADesc:String;
                          var AServerResponse:String;
                          var AIsPaySucc:Boolean;
                          var ATradeStatus:String):Boolean;



    //֧���ر�(��ʱ��û��֧��,����Ҫ����Ҫ�û�֧��)
    function CloseTrade(AOutTradeNo:String;
                        //֧����ʽ,֧������΢��
                        APaymentType:TPaymentType;
                        var ADesc:String;
                        var AServerResponse:String;
                        var AIsCloseSucc:Boolean):Boolean;


    //֧������(ҵ���߼�û�д���ɹ�,ȫ���˿�)
    function CancelTrade(AOutTradeNo:String;
                        //֧����ʽ,֧������΢��
                        APaymentType:TPaymentType;
                        var ADesc:String;
                        var AServerResponse:String;
                        var AIsCancelSucc:Boolean):Boolean;


    //�˿�
    function RefundTrade(AOutTradeNo:String;
                        //�˿��
                        AOutRefundRequestNo:String;
                        //�˿�ԭ��
                        ARefundReason:String;
                        //ԭ�����ܽ��
                        ATotalAmount:String;
                        ARefundAmount:String;
                        //֧����ʽ,֧������΢��
                        APaymentType:TPaymentType;
                        var ADesc:String;
                        var AServerResponse:String;
                        var AIsRefundSucc:Boolean):Boolean;



    //��ѯ�˿���
    function QueryRefundTrade(AOutTradeNo:String;
                              AOutRefundRequestNo:String;
                              //֧����ʽ,֧������΢��
                              APaymentType:TPaymentType;
                              var ADesc:String;
                              var AServerResponse:String;
                              var AIsRefundSucc:Boolean):Boolean;



  published
    //���ؽӿ�����
    property GatewayUrl:String read FGatewayUrl write FGatewayUrl;
    //֧��Ӧ�õ�ID
    property AppID:String read FAppID write FAppID;
    //֧��Ӧ�õ���Կ
    property AppKey:String read FAppKey write FAppKey;


    //֧���̼�ID
    property PayShopID:String read FPayShopID write FPayShopID;
    //֧���̼ҵ�˽Կ
    property PayRSAPrivateKey:String read FPayRSAPrivateKey write FPayRSAPrivateKey;
    //֧���̼ҵĹ�Կ
    property PayPublicRSAKey:String read FPayPublicRSAKey write FPayPublicRSAKey;



    //�ڲ�����
    //����Ա��
    property OperatorID:String read FOperatorID write FOperatorID;
    //�ն˺�
    property TerminalID:String read FTerminalID write FTerminalID;


    //֧������¼�
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





//����֧����ҵ�����-�Ϻ�
function GenerateBizContentJson_ShangHaiHospitalPay(
              //��Ʒ�ı���/���ױ���/��������/�����ؼ��ֵȡ�
              ASubject:String;
              //��һ�ʽ��׵ľ���������Ϣ������Ƕ�����Ʒ���뽫��Ʒ�����ַ����ۼӴ���body��
              ABody:String;
              //�̻���վΨһ������
              AOut_trade_no:String;
              //�����ܽ���λΪԪ����ȷ��С�������λ��ȡֵ��Χ[0.01,100000000]
              ATotal_amount:String;
              //�ñʶ��������������ʱ�䣬���ڽ��رս��ס�
              ATimeout_express:String;
              //֧����ʽ
              APaymentType:String;
              //�ص�URL
              ANotifyUrl:String;
              //����Ա����
              AOperatorID:String;
              //�ն˱���
              ATerminalId:String;
              //����֧������
              ADisablePayChannels:String;
              //�û���Ȩ��֧������
              AUserAuthPayBarCode:String
              ):String;



//����֧������URL
function GeneratePayOrderUrl_ShangHaiHospitalPay(
            APayMethod:String;
            //Ӧ��ID
            APayAppID:String;
            //�̻�KCS8��RSA˽Կ
            ARSAPrivateKey:String;
            ASignType:String;
            //֧��ҵ�����
            ABizContent:String;
            AIsNeedUrlEncode:Boolean;
            var AIsSignSucc:Boolean):String;


//ͨ�����ؽӿڵ���
function CallShangHaiGatewayAPI(
            AInterfaceUrl:String;
            AAppID:String;
            AAppKey:String;
            AApiName:String;
            AApiMethod:String;
            ABodyUrl:String;
            var AServerResponse:String):Boolean;

//�������ص�ǩ��
function GenGatewaySign(AAppID:String;AAppKey:String;AApiName:String):String;

//���ɴ�ǩ��������
function GenerateBodyUrl(
            AParamNames:Array of String;
            AParamValues:Array of Variant;
            //KCS8��RSA˽Կ
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

    //ת����UTF8��ʽ
    AResponseContentDataString_UTF8:=UTF8Decode(AResponseContentDataString_UTF8);
    Result:=AResponseContentDataString_UTF8;
end;


//ͨ�����ؽӿڵ���
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
          //����ģʽ,����ģʽ
          if FileExists('.\TestResponseJson\'+'test.'+AApiMethod+'.json') then
          begin
              AResponseContent.LoadFromFile('.\TestResponseJson\'+'test.'+AApiMethod+'.json');
          end
          else
          begin

          end;
          {$ELSE}
          //��ʵģʽ
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
                    //KCS8��RSA˽Կ
                    ARSAPrivateKey:String;
                    ASignType:String;
                    var AIsSignSucc:Boolean
                    ):String;
var
  I:Integer;
  ASign:String;
  AParamValue:String;
  //���������б�
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


    //����
    APayParamList.Sort;
    //������Ҫǩ���Ĵ�
    ASign:=APayParamList.GetQueryParamsStr(False);


    //�̻����������ǩ���������ǩ��
    ASign:=RSASign(ARSAPrivateKey,ASign);
    if ASign<>'' then
    begin
      AIsSignSucc:=True;
    end;


    //����
    Result:=APayParamList.GetQueryParamsStr(False,True,'+')
                    //FPayOrderInfo����RSA����
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


  //�Դ�ǩ���ַ������� AES ���ܣ���ԿΪ appkey ȥ����-���ַ���
  AKey:=ReplaceStr(AAppKey,'-','');
  //AES �㷨���� 32 λ����Կ�� ECB �㷨


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

      //�л���,Ҫȥ��
      Result:=ReplaceStr(ABase64Stream.DataString,#13#10,'');
  finally
    FreeAndNil(AStringStream);
    FreeAndNil(AStreamOut);
    FreeAndNil(ABase64Stream);
  end;
  {$ENDIF}
end;



function GenerateBizContentJson_ShangHaiHospitalPay(
                  //��Ʒ�ı���/���ױ���/��������/�����ؼ��ֵȡ�
                  ASubject:String;
                  //��һ�ʽ��׵ľ���������Ϣ������Ƕ�����Ʒ���뽫��Ʒ�����ַ����ۼӴ���body��
                  ABody:String;
                  //�̻���վΨһ������
                  AOut_trade_no:String;
                  //�����ܽ���λΪԪ����ȷ��С�������λ��ȡֵ��Χ[0.01,100000000]
                  ATotal_amount:String;
                  //�ñʶ��������������ʱ�䣬���ڽ��رս��ס�
                  ATimeout_express:String;
                  //֧����ʽ
                  APaymentType:String;
                  //�ص�URL
                  ANotifyUrl:String;
                  //����Ա����
                  AOperatorID:String;
                  //�ն˱���
                  ATerminalId:String;
                  //����֧������
                  ADisablePayChannels:String;
                  //�û���Ȩ��֧������
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
  //Ϊ�˺�Android Demo���������Ų�ǩ���Ƿ���ȷ
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
                      //Ӧ��ID
                      APayAppID:String;
                      //�̻�KCS8��RSA˽Կ
                      ARSAPrivateKey:String;
                      ASignType:String;
                      ABizContent:String;
                      AIsNeedUrlEncode:Boolean;
                      var AIsSignSucc:Boolean):String;
var
  ASign:String;
  ANonceStr:String;
  //���������б�
  APayParamList:TInterfaceParameters;
begin
  AIsSignSucc:=False;

  APayParamList:=TInterfaceParameters.Create;

  try


    ANonceStr:=uCaptcha.GetRandStr(32);

    //׼����������//
    //��������
    //����������ߵ�Ӧ��ID
    APayParamList.AddQueryParameter('app_id',APayAppID);
    //�ӿ�����
    APayParamList.AddQueryParameter('method',APayMethod);
    //���������ʱ�䣬��ʽ"yyyy-MM-dd HH:mm:ss"
    APayParamList.AddQueryParameter('timestamp',FormatDateTime('YYYY-MM-DD HH:MM:SS',Now));
    //ҵ����������ļ��ϣ���󳤶Ȳ��ޣ�����������������������������������������д��ݣ�������ո���Ʒ���ٽ����ĵ�
    APayParamList.AddQueryParameter('biz_content',ABizContent);
    //�̻�����ǩ���ַ�����ʹ�õ�ǩ���㷨���ͣ�RSA
    APayParamList.AddQueryParameter('sign_type',ASignType);

    APayParamList.AddQueryParameter('nonce_str',ANonceStr);

    //����
    APayParamList.Sort;
    //������Ҫǩ���Ĵ�
    ASign:=APayParamList.GetQueryParamsStr(False);


    //�̻����������ǩ���������ǩ��
    ASign:=RSASign(ARSAPrivateKey,ASign);
    if ASign<>'' then
    begin
      AIsSignSucc:=True;
    end;


    //����
    Result:=APayParamList.GetQueryParamsStr(False,AIsNeedUrlEncode,'+')
                    //FPayOrderInfo����RSA����
                    +'&sign='+ASign+''
                    ;

  finally
    FreeAndNil(APayParamList);
  end;

end;




{ TShangHaiHospitalPay }

function TShangHaiHospitalPay.CloseTrade(
                        AOutTradeNo:String;
                        //֧����ʽ,֧������΢��
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
                            //�̻�ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            Self.FSignType,
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if Not AIsSignSucc then
  begin
    ADesc:='ǩ��ʧ��';
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
    ADesc:='�������ͨ��ʧ��';
    Exit;
  end;




  AServerResponseW:=AServerResponse;
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin

      if not SetTradeCloseSuccToDatabase(AOutTradeNo) then
      begin
        ADesc:='���µ����ݿ����';
        Exit;
      end;

      ADesc:='���׹رճɹ�';
      AIsCloseSucc:=True;
  end
  else
  begin
      ADesc:='���ط�����code:'+AServerResponseJson.S['code']+#13#10
             +'���ط���������msg:'+AServerResponseJson.S['msg']+#13#10
             +'ҵ�񷵻���code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'ҵ�񷵻�������sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;


  Result:=True;

end;


function TShangHaiHospitalPay.CancelTrade(
                                AOutTradeNo:String;
                                //֧����ʽ,֧������΢��
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
                            //�̻�ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            Self.FSignType,
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if Not AIsSignSucc then
  begin
    ADesc:='ǩ��ʧ��';
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
    ADesc:='�������ͨ��ʧ��';
    Exit;
  end;




  AServerResponseW:=AServerResponse;
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin

      if not SetTradeCancelSuccToDatabase(AOutTradeNo) then
      begin
        ADesc:='���µ����ݿ�ʧ��';
        Exit;
      end;


      //���˿�,Ҫ��¼����

      AIsCancelSucc:=True;
      ADesc:='���׳����ɹ�';
  end
  else
  begin
      ADesc:='���ط�����code:'+AServerResponseJson.S['code']+#13#10
             +'���ط���������msg:'+AServerResponseJson.S['msg']+#13#10
             +'ҵ�񷵻���code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'ҵ�񷵻�������sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
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


  FPayShopID:='LCOP20190313172413707';//���յ�֧��������S'LCOP20181218163027704';
  FPayRSAPrivateKey:=''
//        //pkcs8,14��
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

  //��Ҫ�Ĳ���
  FOperatorID:='OP001';
  FTerminalID:='NJ_T_001';
  FDisablePayChannels:='credit_group';
  FSignType:='rsa';
  FTimeoutExpress:='5m';//���û��˵��б���״̬



  //���֧����ʱʱ��
  FCheckStateTimeoutMinitue:=1;//3;
end;

destructor TShangHaiHospitalPay.Destroy;
begin

  inherited;
end;

function TShangHaiHospitalPay.Pay(AOutTradeNo, ASubject, ABody: String;
  ATotalAmount: String;
  //֧����ʽ,֧������΢��
  APaymentType:TPaymentType;
  //֧������,��ά�������
  APayMethodType:TPayMethodType;
  //�û���Ȩ������
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
        //��ά��֧��
        APayMethod:='lc.trade.qrcode.pay';
        APayApiName:='232bc351-722f-4e50-aa33-c3c70b2a7b2b';
    end;
    pmtBarCode:
    begin
        //����֧��
        APayMethod:='lc.trade.barcode.pay';
        APayApiName:='b2ba3f5e-cc3f-4b53-b57c-4ebda9164053';
    end;
    pmtPolymerization:
    begin
        //�ۺ�ɨ��֧��
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

  //����֧����url
  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            APayMethod,
                            //�̻�ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            Self.FSignType,
                            ABizContentStr,
                            True,//False,
                            AIsSignSucc
                            );

  if Not AIsSignSucc then
  begin
    ADesc:='ǩ��ʧ��';
    Exit;
  end;



  //���ü�¼���뵽���ݿ�
  if FDBHelper<>nil then
  begin
    if not FDBHelper.SelfQuery_EasyInsert(
            'tblOnlinePayTrade',
            ['out_trade_no','total_amount','subject','body','payment_type','operator_id','terminal_id','auth_code','createtime',
                'refund_amount'],
            [AOutTradeNo,ATotalAmount,ASubject,ABody,GetPaymentTypeStr(APaymentType),FOperatorID,FTerminalID,AUserPayAuthBarCode,FormatDateTime('YYYY-MM-DD HH:MM:SS',Now),
                0]) then
    begin
      ADesc:='���븶���¼ʧ��';
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
    ADesc:='�������ͨ��ʧ��';
    Exit;
  end;




  AServerResponseW:=AServerResponse;
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin
  end
  else
  begin
      ADesc:='���ط�����code:'+AServerResponseJson.S['code']+#13#10
             +'���ط���������msg:'+AServerResponseJson.S['msg']+#13#10
             +'ҵ�񷵻���sub_code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'ҵ�񷵻�������sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;



  Result:=True;



  //����֧����ѯ�߳�
  APayTradeQueryThread:=TShangHaiHospitalPayTradeQueryThread.Create(False,Self,APaymentType,AOutTradeNo,'',tqtQueryPayedSucc);
  APayTradeQueryThread.FreeOnTerminate:=True;


end;

function TShangHaiHospitalPay.SetTradeProcessedSuccToDatabase(AOutTradeNo: String): Boolean;
begin
  Result:=False;

  //��д״̬�����ݿ�
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

  //��д״̬�����ݿ�
  if Self.FDBHelper<>nil then
  begin

      if Self.FDBHelper.SelfQuery_EasyUpdate('tblTradeRefund',
                                              ['is_processed_succ'],
                                              [1],
                                              ' WHERE out_refund_request_no=:out_refund_request_no ',
                                              ['out_refund_request_no'],[AOutRefundRequestNo]
                                              ) then
      begin

          //����ɹ�֮���ܵ��˿�����ԭ֧����¼��
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

  //��д״̬�����ݿ�
  if Self.FDBHelper<>nil then
  begin

      if Self.FDBHelper.SelfQuery_EasyUpdate('tblTradeRefund',
                                              ['is_refunded'],
                                              [1],
                                              ' WHERE out_refund_request_no=:out_refund_request_no ',
                                              ['out_refund_request_no'],[AOutRefundRequestNo]
                                              ) then
      begin

//          //����ɹ�֮���ܵ��˿�����ԭ֧����¼��
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
  //֧����ʽ,֧������΢��
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
                            //�̻�ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            Self.FSignType,
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if not AIsSignSucc then
  begin
    ADesc:='ǩ��ʧ��';
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
    ADesc:='�������ͨ��ʧ��';
    Exit;
  end;





  AServerResponseW:=AServerResponse;
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin
      ATradeStatus:=AServerResponseJson.O['biz_content'].S['trade_status'];

      if SameText(ATradeStatus,'TRADE_SUCCESS') then
      begin

          //����ɹ�
          //��д״̬�����ݿ�
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
                ADesc:='���µ����ݿ�ʧ��';
                Exit;
              end;
          end;



          ADesc:='����ɹ�';
          AIsPaySucc:=True;


      end;
  end
  else
  begin
      ADesc:='���ط�����code:'+AServerResponseJson.S['code']+#13#10
             +'���ط���������msg:'+AServerResponseJson.S['msg']+#13#10
             +'ҵ�񷵻���sub_code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'ҵ�񷵻�������sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;



  Result:=True;

end;

function TShangHaiHospitalPay.QueryRefundTrade(
                              AOutTradeNo:String;
                              AOutRefundRequestNo:String;
                              //֧����ʽ,֧������΢��
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
  //�˿����뵥��
  ABizContent.S['out_request_no']:=AOutRefundRequestNo;


  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            'lc.trade.fastpay.refund.query',
                            //�̻�ID
                            Self.FPayShopID,
                            FPayRSAPrivateKey,
                            'rsa',
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if Not AIsSignSucc then
  begin
    ADesc:='ǩ��ʧ��';
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
    ADesc:='�������ͨ��ʧ��';
    Exit;
  end;



  AServerResponseW:=AServerResponse;
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin
      //�˿�ɹ�
      AIsRefundSucc:=True;



  end
  else
  begin
      ADesc:='���ط�����code:'+AServerResponseJson.S['code']+#13#10
             +'���ط���������msg:'+AServerResponseJson.S['msg']+#13#10
             +'ҵ�񷵻���sub_code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'ҵ�񷵻�������sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;



  Result:=True;
end;

function TShangHaiHospitalPay.RefundTrade(
                        AOutTradeNo:String;
                        //�˿��
                        AOutRefundRequestNo:String;
                        //�˿�ԭ��
                        ARefundReason:String;
                        //ԭ�����ܽ��
                        ATotalAmount:String;
                        ARefundAmount:String;
                        //֧����ʽ,֧������΢��
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
  //�������
  ABizContent.S['trade_amount']:=ATotalAmount;
  //�˿���
  ABizContent.S['refund_amount']:=ARefundAmount;
  //�˿��
  ABizContent.S['out_request_no']:=AOutRefundRequestNo;
  ABizContent.S['refund_reason']:=ARefundReason;


  ABodyUrl:=GeneratePayOrderUrl_ShangHaiHospitalPay(
                            'lc.trade.refund',
                            //�̻�ID
                            FPayShopID,
                            FPayRSAPrivateKey,
                            FSignType,
                            ABizContent.AsJson,
                            True,//False,
                            AIsSignSucc
                            );
  if Not AIsSignSucc then
  begin
    ADesc:='ǩ��ʧ��';
    Exit;
  end;





  //���ü�¼���뵽���ݿ�
  if FDBHelper<>nil then
  begin
    if not FDBHelper.SelfQuery_EasyInsert(
              'tblTradeRefund',
              ['out_trade_no','out_refund_request_no','total_amount','refund_amount','reason','payment_type','operator_id','terminal_id','createtime'],
              [AOutTradeNo,AOutRefundRequestNo,ATotalAmount,ARefundAmount,ARefundReason,GetPaymentTypeStr(APaymentType),FOperatorID,FTerminalID,FormatDateTime('YYYY-MM-DD HH:MM:SS',Now)]) then
    begin
      ADesc:='�����˿��¼ʧ��';
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
    ADesc:='�������ͨ��ʧ��';
    Exit;
  end;




  AServerResponseW:=AServerResponse;
  AServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseW),True);
  if SameText(AServerResponseJson.S['msg'],'success') then
  begin

      if not SetTradeRefundSuccSuccToDatabase(AOutTradeNo,AOutRefundRequestNo) then
      begin
        ADesc:='���µ����ݿ�ʧ��';
        Exit;
      end;


      ADesc:='�����˿�ɹ�';
      AIsRefundSucc:=True;

  end
  else
  begin
      ADesc:='���ط�����code:'+AServerResponseJson.S['code']+#13#10
             +'���ط���������msg:'+AServerResponseJson.S['msg']+#13#10
             +'ҵ�񷵻���sub_code:'+AServerResponseJson.O['biz_content'].S['sub_code']+#13#10
             +'ҵ�񷵻�������sub_msg:'+AServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
             ;
      Exit;
  end;




  Result:=True;

end;

function TShangHaiHospitalPay.SetTradeCancelSuccToDatabase(
  AOutTradeNo: String): Boolean;
begin
  Result:=False;

  //��д״̬�����ݿ�
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

  //��д״̬�����ݿ�
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
          //�������ѯһ��
          Sleep(3000);


          if (DateUtils.MinutesBetween(ABeginTime,Now)>FShangHaiHospitalPay.FCheckStateTimeoutMinitue) then
          begin
              FIsTimeout:=True;
              FDesc:='��ⳬʱ';

              //��ʱ��
              case Self.FTradeQueryType of
                  tqtQueryPayedSucc:
                  begin
                      //�Ƿ��ѯ��ʱ��
                      //Ҫ��ͬ��,��һ���߳��е��õ�
                      TThread.Synchronize(nil,Self.DoPayResult);
                  end;
              end;
              Exit;
          end;




          //֧���Ѿ�����,����Ҫ�ٲ�ѯ��
          if (not AIsDontNeedQuery) then
          begin

                try
                    case Self.FTradeQueryType of
                        tqtQueryPayedSucc:
                        begin
                              //��ѯ����֧��״̬
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
                              //��ѯ�����˿�״̬
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
                        FServerResponseJson:=TSuperObject.ParseString(PWideChar(AServerResponseWStr),True);

                        FDesc:='���ط�����code:'+FServerResponseJson.S['code']+#13#10
                               +'���ط���������msg:'+FServerResponseJson.S['msg']+#13#10
                               +'ҵ�񷵻���sub_code:'+FServerResponseJson.O['biz_content'].S['sub_code']+#13#10
                               +'ҵ�񷵻�������sub_msg:'+FServerResponseJson.O['biz_content'].S['sub_msg']+#13#10
                               ;

                        case Self.FTradeQueryType of
                            tqtQueryPayedSucc:
                            begin
                                if SameText(FServerResponseJson.O['biz_content'].S['trade_status'],'TRADE_SUCCESS') then
                                begin
                                    //֧���ɹ�
                                    FTradeBizContent.out_trade_no:=FServerResponseJson.O['biz_content'].S['out_trade_no'];
                                    FTradeBizContent.trade_no:=FServerResponseJson.O['biz_content'].S['trade_no'];
                                    FTradeBizContent.trade_status:=FServerResponseJson.O['biz_content'].S['trade_status'];
                                    FTradeBizContent.total_amount:=FServerResponseJson.O['biz_content'].D['total_amount'];
                                    FTradeBizContent.payment_type:=FServerResponseJson.O['biz_content'].S['payment_type'];
                                    //
                                    FTradeBizContent.pay_date:=FServerResponseJson.O['biz_content'].S['pay_date'];


                                    FIsSucc:=True;
                                    FDesc:='֧���ɹ�';
                                    //����Ҫ�ٴμ�����ѯ��
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
                                  //Ҫ��ͬ��,��һ���߳��е��õ�
                                  TThread.Synchronize(nil,Self.DoPayResult);
                                end;

                            end;

                            //�˳����ٲ�ѯ
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
