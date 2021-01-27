//copyright delphiteacher QQ:452330643
//2015-08-08
//δ����Ȩ,�Ͻ��������ͻ�ת������ʹ��
//
unit uWxpayPublic;

interface
//{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MSWINDOWS) }
//{$DEFINE FMX}
//{$ENDIF}

//���ڹ����·���FrameWork.inc
//�����ڹ�������������FMX����ָ��
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


  //����xmlҪ��,com
  {$IFDEF MSWINDOWS}
  ActiveX,
  {$ENDIF}


  //����xmlҪ��
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




//����΢���ֻ�֧����Ԥ�����ź�ǩ��
function GenerateWxpayAppPayPrepayId_XMLPackage(
                    //΢��Ӧ�õ�ID
                    AAppID:String;
//                    AAppSecret:String;
                    //�̻���ID
                    APartnerID:String;
                    //�̻�����Կ
                    APartnerKey:String;
                    //��������
                    ABody:String;
                    //�۸�(��)
                    ATotalFee:Integer;
                    //����ַ���
                    ANonceStr:String;
                    //�̻�������
                    AOutTradeNo:String;
                    //�ն�IP
                    ASpbillCreateIP:String;
                    //֪ͨ��ַ,����΢��֧���첽֪ͨ�ص���ַ
                    ANotifyUrl:String;
                    //APP
                    ATradeType:String;
                    //�Զ���ĸ�������,֪ͨʱԭ������,����Ϊ��
                    AAttach:String='';
                    AUserPayAuthCode:String='';
                    ASubPartnerID:String=''):String;


//ͨ�õ���������΢�Žӿ�����XML���ķ���
function GenerateWxpayAppPayXMLPackage(
                    AParamNames:Array of String;
                    AParamValues:Array of Variant;
                    APartnerKey:String):String;



//��΢�ŷ��ص�XML���ҵ�Ԥ������
function FindWxpayAppPayPrepayId(AXML:String;var AError:String):String;
//��΢�ŷ��ص�XML���ҵ�Ԥ������,ɨ��֧����URL
function FindWxpayAppPayPrepayIdEx(AXML:String;var APrepayId:String;var ACodeUrl:String;var AError:String):Boolean;
//΢��֧�������Ƿ�ɹ�
function IsWxpayAppPayResponseSucc(AXML:String;var AError:String):Boolean;
function FindXMLTextByNodeName(AXML:String;ANodeName:String;var AError:String):String;



//��ȡֱ�ӵ���֧������Ҫ�Ĳ���
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
//    +'&body=�ٹ�԰&detail=���ϵ�ˮ��&mch_id=1487423322'
//    +'&nonce_str=wn714q3v875u4hd3snyfpfcmfcogr2le&out_trade_no=20180720133537537-8437'
//    +'&spbill_create_ip=192.168.1.1&total_fee=10&key=13857563773wangnengdelphiteacher';
  //��ȷ�Ľ��
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

  //��ȡ����Ԥ������
  //��1970��1��1�� 0��0��0������������
  ATimeStamp:=DateUtils.SecondsBetween(StandardStrToDateTime('1970-01-01 00:00:00'),Now);

  //���������
  ANonceStr:=GetRandStr(32);


  APayParamList:=TInterfaceParameters.Create;
  try
    APayParamList.Clear(True);
    //�����˺�ID
    APayParamList.AddQueryParameter('appid',AAppID);
    //�̻���
    APayParamList.AddQueryParameter('partnerid',APartnerID);

    //����ַ���,����ַ�����������32λ
    APayParamList.AddQueryParameter('noncestr',ANonceStr);
    APayParamList.AddQueryParameter('package','Sign=WXPay');
    //ʱ���
    APayParamList.AddQueryParameter('timestamp',IntToStr(ATimeStamp));
    //Ԥ������
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

    //�ɹ�
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

    //ʧ��
    //'<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>'#$A'
    //<return_msg><![CDATA[OK]]></return_msg>'#$A'
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>'#$A'
    //<mch_id><![CDATA[1487423322]]></mch_id>'#$A'
    //<nonce_str><![CDATA[9qJmtsWjGEN945fh]]></nonce_str>'#$A'
    //<sign><![CDATA[86972C2DE74CE8B957BDEF16B31E4DB1]]></sign>'#$A'
    //<result_code><![CDATA[FAIL]]></result_code>'#$A'
    //<err_code><![CDATA[INVALID_REQUEST]]></err_code>'#$A'
    //<err_code_des><![CDATA[201 �̻��������ظ�]]></err_code_des>'#$A'
    //</xml>'


    //'<xml>
    //<return_code><![CDATA[FAIL]]></return_code>'#$A'
    //<return_msg><![CDATA[�̻��Ÿò�ƷȨ��δ��ͨ����ǰ���̻�ƽ̨>��Ʒ���ļ�������]]></return_msg>'#$A'
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
        //�ӿڵ��óɹ�
        if (XMLNode.ChildNodes.FindNode('result_code')<>nil)
          and (XMLNode.ChildNodes.FindNode('result_code').Text='SUCCESS')
          then
        begin

            //û�д���
            if XMLNode.ChildNodes.FindNode('prepay_id')<>nil then
            begin
              //�ɹ�
              Result:=XMLNode.ChildNodes.FindNode('prepay_id').Text;
            end
            else
            begin
              AError:='XML�в�����prepay_id���';
            end;

        end
        else
        begin
            AError:='Unknow';
            if XMLNode.ChildNodes.FindNode('err_code_des')<>nil then
            begin
              //ʧ��
              AError:=XMLNode.ChildNodes.FindNode('err_code_des').Text;
            end;
        end;


    end
    else
    begin
        //�ӿڵ����д���
        AError:='Unknow';
        if XMLNode.ChildNodes.FindNode('return_msg')<>nil then
        begin
          //ʧ��
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

function FindWxpayAppPayPrepayIdEx(AXML:String;var APrepayId:String;var ACodeUrl:String;var AError:String):Boolean;
var
  XMLDocument: TXMLDocument;
  XMLNode: IXMLNode;
begin
  {$IFDEF MSWINDOWS}
  ActiveX.CoInitialize(nil);
  {$ENDIF}

  Result:=False;
  APrepayId:='';
  ACodeUrl:='';
  AError:='';

  XMLDocument := TXMLDocument.Create(Application);
  try

    //�ɹ�
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

    //ʧ��
    //'<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>'#$A'
    //<return_msg><![CDATA[OK]]></return_msg>'#$A'
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>'#$A'
    //<mch_id><![CDATA[1487423322]]></mch_id>'#$A'
    //<nonce_str><![CDATA[9qJmtsWjGEN945fh]]></nonce_str>'#$A'
    //<sign><![CDATA[86972C2DE74CE8B957BDEF16B31E4DB1]]></sign>'#$A'
    //<result_code><![CDATA[FAIL]]></result_code>'#$A'
    //<err_code><![CDATA[INVALID_REQUEST]]></err_code>'#$A'
    //<err_code_des><![CDATA[201 �̻��������ظ�]]></err_code_des>'#$A'
    //</xml>'


    //'<xml>
    //<return_code><![CDATA[FAIL]]></return_code>'#$A'
    //<return_msg><![CDATA[�̻��Ÿò�ƷȨ��δ��ͨ����ǰ���̻�ƽ̨>��Ʒ���ļ�������]]></return_msg>'#$A'
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
        //�ӿڵ��óɹ�
        if (XMLNode.ChildNodes.FindNode('result_code')<>nil)
          and (XMLNode.ChildNodes.FindNode('result_code').Text='SUCCESS')
          then
        begin

            //û�д���
            if XMLNode.ChildNodes.FindNode('prepay_id')<>nil then
            begin
              //�ɹ�
              APrepayId:=XMLNode.ChildNodes.FindNode('prepay_id').Text;

              Result:=True;
            end
            else
            begin
              AError:='XML�в�����prepay_id���';
            end;

            //û�д���
            if XMLNode.ChildNodes.FindNode('code_url')<>nil then
            begin
              //�ɹ�
              ACodeUrl:=XMLNode.ChildNodes.FindNode('code_url').Text;
            end
            else
            begin
              AError:='XML�в�����code_url���';
            end;


        end
        else
        begin
            AError:='Unknow';
            if XMLNode.ChildNodes.FindNode('err_code_des')<>nil then
            begin
              //ʧ��
              AError:=XMLNode.ChildNodes.FindNode('err_code_des').Text;
            end;
        end;


    end
    else
    begin
        //�ӿڵ����д���
        AError:='Unknow';
        if XMLNode.ChildNodes.FindNode('return_msg')<>nil then
        begin
          //ʧ��
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

    //�ɹ�
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

    //ʧ��
    //'<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>'#$A'
    //<return_msg><![CDATA[OK]]></return_msg>'#$A'
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>'#$A'
    //<mch_id><![CDATA[1487423322]]></mch_id>'#$A'
    //<nonce_str><![CDATA[9qJmtsWjGEN945fh]]></nonce_str>'#$A'
    //<sign><![CDATA[86972C2DE74CE8B957BDEF16B31E4DB1]]></sign>'#$A'
    //<result_code><![CDATA[FAIL]]></result_code>'#$A'
    //<err_code><![CDATA[INVALID_REQUEST]]></err_code>'#$A'
    //<err_code_des><![CDATA[201 �̻��������ظ�]]></err_code_des>'#$A'
    //</xml>'


    //'<xml>
    //<return_code><![CDATA[FAIL]]></return_code>'#$A'
    //<return_msg><![CDATA[�̻��Ÿò�ƷȨ��δ��ͨ����ǰ���̻�ƽ̨>��Ʒ���ļ�������]]></return_msg>'#$A'
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
        //�ӿڵ��óɹ�
        if (XMLNode.ChildNodes.FindNode('result_code')<>nil)
          and (XMLNode.ChildNodes.FindNode('result_code').Text='SUCCESS')
          then
        begin

            //û�д���
            Result:=True;

        end
        else
        begin
            AError:='Unknow';
            if XMLNode.ChildNodes.FindNode('err_code_des')<>nil then
            begin
              //ʧ��
              AError:=XMLNode.ChildNodes.FindNode('err_code_des').Text;
            end;
        end;


    end
    else
    begin
        //�ӿڵ����д���
        AError:='Unknow';
        if XMLNode.ChildNodes.FindNode('return_msg')<>nil then
        begin
          //ʧ��
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

    //�ɹ�
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

    //ʧ��
    //'<xml>
    //<return_code><![CDATA[SUCCESS]]></return_code>'#$A'
    //<return_msg><![CDATA[OK]]></return_msg>'#$A'
    //<appid><![CDATA[wx8e8f30be080c6177]]></appid>'#$A'
    //<mch_id><![CDATA[1487423322]]></mch_id>'#$A'
    //<nonce_str><![CDATA[9qJmtsWjGEN945fh]]></nonce_str>'#$A'
    //<sign><![CDATA[86972C2DE74CE8B957BDEF16B31E4DB1]]></sign>'#$A'
    //<result_code><![CDATA[FAIL]]></result_code>'#$A'
    //<err_code><![CDATA[INVALID_REQUEST]]></err_code>'#$A'
    //<err_code_des><![CDATA[201 �̻��������ظ�]]></err_code_des>'#$A'
    //</xml>'

    XMLDocument.Active := True;
    XMLDocument.Version := '1.0';
    XMLDocument.Encoding := 'UTF-8';
    XMLDocument.LoadFromXML(AXML);
    XMLNode := XMLDocument.DocumentElement;


    //û�д���
    if XMLNode.ChildNodes.FindNode(ANodeName)<>nil then
    begin
      //�ɹ�
      Result:=XMLNode.ChildNodes.FindNode(ANodeName).Text;
    end
    else
    begin
      AError:='XML�в�����'+ANodeName+'�ڵ�';
    end;


  finally
    FreeAndNil(XMLDocument);
    {$IFDEF MSWINDOWS}
    ActiveX.CoUnInitialize();
    {$ENDIF}
  end;
end;

function GenerateWxpayAppPayPrepayId_XMLPackage(
                    //΢��Ӧ�õ�ID
                    AAppID:String;
//                    AAppSecret:String;
                    //�̻���ID
                    APartnerID:String;
                    //�̻�����Կ
                    APartnerKey:String;
                    //��������
                    ABody:String;
                    //�۸�(��)
                    ATotalFee:Integer;
                    //����ַ���
                    ANonceStr:String;
                    //�̻�������
                    AOutTradeNo:String;
                    //�ն�IP
                    ASpbillCreateIP:String;
                    //֪ͨ��ַ,����΢��֧���첽֪ͨ�ص���ַ
                    ANotifyUrl:String;
                    //��������APP
                    ATradeType:String;
                    //�Զ���ĸ�������,֪ͨʱԭ������,����Ϊ��
                    AAttach:String;
                    AUserPayAuthCode:String;
                    ASubPartnerID:String):String;
var
  APayParamList:TInterfaceParameters;
begin

  Result:='';

  APayParamList:=TInterfaceParameters.Create;
  try

    //����ͳһ�µ�API
    APayParamList.Clear(True);

    //�����˺�ID
    APayParamList.AddQueryParameter('appid',AAppID);
    //�̻���
    APayParamList.AddQueryParameter('mch_id',APartnerID);

    if ASubPartnerID<>'' then
    begin
      APayParamList.AddQueryParameter('sub_mch_id',ASubPartnerID);
    end;

    //����ַ���,����ַ�����������32λ
    APayParamList.AddQueryParameter('nonce_str',ANonceStr);
    //��Ʒ����
    APayParamList.AddQueryParameter('body',ABody);//Ipad mini  16G  ��ɫ  ������Ʒ
    //��Ʒ����
//    APayParamList.AddQueryParameter('detail','Ipad mini  16G  ��ɫ');
  //  //��������,�������ݣ��ڲ�ѯAPI��֧��֪ͨ��ԭ�����أ����ֶ���Ҫ�����̻�Я���������Զ�������
  //  APayParamList.AddQueryParameter('attach','test');
    //�̻�������
    APayParamList.AddQueryParameter('out_trade_no',AOutTradeNo);
    //�ܽ��,�����ܽ��Է�Ϊ��λ
    APayParamList.AddQueryParameter('total_fee',IntToStr(ATotalFee));


    //�ն�IP,APP����ҳ֧���ύ�û���ip��Native֧�������΢��֧��API�Ļ���IP��
    APayParamList.AddQueryParameter('spbill_create_ip',ASpbillCreateIP);
    //֪ͨ��ַ,����΢��֧���첽֪ͨ�ص���ַ
    APayParamList.AddQueryParameter('notify_url',ANotifyUrl);


    //��������,ȡֵ���£�JSAPI��NATIVE��APP
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



    //����ǩ��
    //������Ҫǩ���Ĵ�
    APayParamList.Sort;

    //ǩ��
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




    //����ǩ��
    //������Ҫǩ���Ĵ�
    APayParamList.Sort;

    //������ǩ��
    //ǩ��
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
