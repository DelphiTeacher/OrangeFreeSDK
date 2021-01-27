//copyright delphiteacher QQ:452330643
//2015-08-08
//δ����Ȩ,�Ͻ��������ͻ�ת������ʹ��
//
unit uAliPayPublic;

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

  {$IFDEF SKIN_SUPEROBJECT}
  uSkinSuperObject_Copy,
  {$ELSE}
  XSuperObject,
  {$ENDIF}

  //  uBaseLog,

  uPayAPIParam,
  uPayPublic,



  {$IFDEF IN_ORANGESDK}
  //��OrangeSDK������
  uFileCommon_Copy,
  uFuncCommon_Copy,
  {$ELSE}
  //��OrangeUI����
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




//����֧����ҵ�����
function GenerateBizContentJson(
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
              //��Ʒ�����ͣ�0����������Ʒ��1��ʵ������Ʒ ע����������Ʒ��֧��ʹ�û�������
              AGoods_type:String;
              //���ûش��������������ʱ�����˸ò������򷵻ظ��̻�ʱ��ش��ò�����֧���������첽֪ͨʱ���ò���ԭ�����ء��������������UrlEncode֮��ſ��Է��͸�֧����
              APassback_params:String;
              AProductCode:String='QUICK_MSECURITY_PAY';
              //�û�������
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
                    //�̻�KCS8��RSA˽Կ
//                    ARSAPrivateKey:String;
                    ARSAPrivateKey2:String;
//                    ASignType:String;
                    var AIsSignSucc:Boolean;
                    ANeedUrlEncode:Boolean=True
                    ):String;





//����֧�����ֻ�֧������URL
function GenerateAliPayAppPayOrderUrl(
            APayMethod:String;
            //Ӧ��ID
            AAlipayAppID:String;
            //�̻�KCS8��RSA˽Կ
//            ARSAPrivateKey:String;
            ARSAPrivateKey2:String;
//            ASignType:String;
            //֧�����֪ͨ��ַ
            ANotify_url:String;
            //֧��ҵ�����
            ABizContent:String;
            var AIsSignSucc:Boolean):String;


//ȥ��˽Կ�еĻ��з�
function ConvertPrivateKeyNoEnter(APrivateKey:String):String;
//��˽Կ��ӻ��з�
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
    //�����ڻ���,��ô���
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
                      //Ӧ��ID
                      AAlipayAppID:String;
                      //�̻�KCS8��RSA˽Կ
//                      ARSAPrivateKey:String;
                      ARSAPrivateKey2:String;
//                      ASignType:String;
                      //֧�����֪ͨ��ַ
                      ANotify_url:String;
                      ABizContent:String;
                      var AIsSignSucc:Boolean):String;
var
  ASign:String;
  //���������б�
  APayParamList:TInterfaceParameters;
begin
  AIsSignSucc:=False;

  APayParamList:=TInterfaceParameters.Create;

  try

    //׼����������//
    //��������
    //֧��������������ߵ�Ӧ��ID
    APayParamList.AddQueryParameter('app_id',AAlipayAppID);
    //�ӿ�����
    APayParamList.AddQueryParameter('method',APayMethod);//'alipay.trade.app.pay');
    //����ʹ�õı����ʽ����utf-8,gbk,gb2312��
    APayParamList.AddQueryParameter('charset','utf-8');
    //���������ʱ�䣬��ʽ"yyyy-MM-dd HH:mm:ss"
    APayParamList.AddQueryParameter('timestamp',FormatDateTime('YYYY-MM-DD HH:MM:SS',Now));
    //���õĽӿڰ汾���̶�Ϊ��1.0
    APayParamList.AddQueryParameter('version','1.0');
    //֧��������������֪ͨ�̻���������ָ����ҳ��http/https·���������̻�ʹ��https
    APayParamList.AddQueryParameter('notify_url',ANotify_url);
    //ҵ����������ļ��ϣ���󳤶Ȳ��ޣ�����������������������������������������д��ݣ�������ո���Ʒ���ٽ����ĵ�
    APayParamList.AddQueryParameter('biz_content',ABizContent);
    //�̻�����ǩ���ַ�����ʹ�õ�ǩ���㷨���ͣ�Ŀǰ֧��RSA2��RSA���Ƽ�ʹ��RSA2
//    APayParamList.AddQueryParameter('sign_type',ASignType);//'RSA');
    APayParamList.AddQueryParameter('sign_type','RSA2');//'RSA');





    //����
    APayParamList.Sort;
    //������Ҫǩ���Ĵ�
    ASign:=APayParamList.GetQueryParamsStr(False);


    //�̻����������ǩ���������ǩ��
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


    //����
    Result:=APayParamList.GetQueryParamsStr(False,True,'+')
                    //FPayOrderInfo����RSA����
                    +'&sign='+ASign+''
                    ;

  finally
    FreeAndNil(APayParamList);
  end;

end;

function GenerateAlipayAppPayUrl(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant;
                    //�̻�KCS8��RSA˽Կ
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
  //���������б�
  APayParamList:TInterfaceParameters;
begin

//  {$IFDEF FREE_VERSION}
//  TThread.Synchronize(nil,procedure
//  begin
//    ShowMessage('����SDK��Ѱ�����');
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


    //����
    APayParamList.Sort;
    //������Ҫǩ���Ĵ�
    ASign:=APayParamList.GetQueryParamsStr(False);


//    //�̻����������ǩ���������ǩ��
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


    //����
    Result:=APayParamList.GetQueryParamsStr(False,ANeedUrlEncode,'+')
                    //FPayOrderInfo����RSA����
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
                  //��Ʒ�����ͣ�0����������Ʒ��1��ʵ������Ʒ ע����������Ʒ��֧��ʹ�û�������
                  AGoods_type:String;
                  //���ûش��������������ʱ�����˸ò������򷵻ظ��̻�ʱ��ش��ò�����֧���������첽֪ͨʱ���ò���ԭ�����ء��������������UrlEncode֮��ſ��Է��͸�֧����
                  APassback_params:String;
                  AProductCode:String;
                  //�û�������
                  AUserPayCode:String;
                  AScene:String
                  ): String;
var
  ABizContentJson:ISuperObject;
begin
  ABizContentJson:=TSuperObject.Create();


  //Ϊ�˺�Android Demo���������Ų�ǩ���Ƿ���ȷ
  if ATimeout_express<>'' then
  begin
    ABizContentJson.S['timeout_express']:=ATimeout_express;
  end;

  //���۲�Ʒ�룬�̼Һ�֧����ǩԼ�Ĳ�Ʒ�룬Ϊ�̶�ֵQUICK_MSECURITY_PAY
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
