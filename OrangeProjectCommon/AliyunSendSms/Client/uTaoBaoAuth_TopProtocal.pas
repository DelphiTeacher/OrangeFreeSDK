unit uTaoBaoAuth_TopProtocal;

interface

uses
  Windows,
  SysUtils,
  Classes,
  StrUtils,
  DateUtils,
  Dialogs,
  Forms,
  Controls,
  EncdDecd,
  uTaoBaoAuth,
  uTaoBaoAPIParam,
  uTaoBaoPublic;


type
  TTaoBaoAuth_TopProtocal=class
  private
    //Ӧ�õ�App Secret
    FAppSecret:String;
    //Ӧ�õ�App Key
    FAppKey:String;
    //API����Url
    FAPIUrl:String;


//    //�İ汾,2.0
//    FVersion:String;
//
//    /////////������ϵͳ����������///////
//    //API�ӿ�����
//    FAPIMethodSysParamName:String;
//    //ʱ����Ĳ����� ʱ�������ʽΪyyyy-mm-dd HH:mm:ss�����磺2008-01-25 20:23:30���Ա�API���������ͻ�������ʱ�����Ϊ6���ӡ�
//    FTimeStampSysParamName:String;
//    //��Ӧ��ʽ������
//    FFormatSysParamName:String;
//    //AppKey������
//    FAppKeySysParamName:String;
//    //�汾�ŵĲ�����
//    FVersionSysParamName:String;
//    //ǩ���Ĳ�����
//    FSignSysParamName:String;
//    //ǩ�����õ��㷨 �����ļ��ܷ���ѡ�񣬿�ѡֵ�ǣ�md5,hmac
//    FSignMethodSysParamName:String;
//    //
//    FSessionSysParamName:String;
  public
    constructor Create(AAppKey:String;
                        AAppSecret:String;
                        AAPIUrl:String
                        );
  public
    property AppKey:String read FAppKey write FAppKey;
    property AppSecret:String read FAppSecret write FAppSecret;
    property APIUrl:String read FAPIUrl write FAPIUrl;
  public
    function GetCallAPIHttpUrl(const AAPIItem:TObject;
                                const AParamNames:array of String;
                                const AParamValues:array of Variant;
                                const ACallAPIFormat:TCallAPIFormat;
                                var ACallAPIHttpUrl:String):Boolean;
//    function PostCallAPIHttpUrl(const AAPIItem:TObject;
//                                const AParamNames:array of String;
//                                const AParamValues:array of Variant;
//                                const ACallAPIFormat:TCallAPIFormat;
//                                var AParams:TQueryParameters;
//                                var ACallAPIHttpUrl:String):Boolean;
  end;



//ȫ���׼ʱ��
function SystemNow:TDateTime;


implementation

uses
  uTaoBaoAPI;



function SystemNow:TDateTime;
var
  SysTime:TSystemTime;
begin
  GetSystemTime(SysTime);
  Result:=SystemTimeToDateTime(SysTime);
end;



{ TTaoBaoAuth_TopProtocal }


constructor TTaoBaoAuth_TopProtocal.Create(AAppKey:String;
                                AAppSecret:String;
                                AAPIUrl:String
                                );
begin
  FAppSecret:=AAppSecret;
  FAppKey:=AAppKey;
  FAPIUrl:=AAPIUrl;

//  FVersion:='1.0';
//  FAPIMethodSysParamName:='Action';
//  FTimeStampSysParamName:='Timestamp';
//  FFormatSysParamName:='Format';
//  FAppKeySysParamName:='AccessKeyId';
//  FVersionSysParamName:='SignatureVersion';
//  FSignSysParamName:='Signature';
//  FSignMethodSysParamName:='SignatureMethod';
//  FSessionSysParamName:='SignatureNonce';
end;

function TTaoBaoAuth_TopProtocal.GetCallAPIHttpUrl(const AAPIItem: TObject;
                                                    const AParamNames: array of String;
                                                    const AParamValues: array of Variant;
                                                    const ACallAPIFormat:TCallAPIFormat;
                                                    var ACallAPIHttpUrl: String): Boolean;
var
  I: Integer;
  ASign:String;
  APIItem:TTaoBaoAPIItem;
  AParams:TQueryParameters;
var
  DT: TDateTime;
  GUID: TGUID;
begin
  Result:=False;
  APIItem:=TTaoBaoAPIItem(AAPIItem);
  //���������б�
  AParams:=TQueryParameters.Create;
  Try

    DT:=SystemNow;

    CreateGUID(GUID);



    //��Ӳ���
    if APIItem.NeedSignMethodParam then
      AParams.AddQueryParameter('SignatureMethod',Const_SignTypeNames[stHMAC_SHA1]);
    AParams.AddQueryParameter('SignatureNonce',
                               LowerCase(MidStr(GUIDToString(GUID),2,36))
                              );
    if APIItem.NeedAppKeyParam then
      AParams.AddQueryParameter('AccessKeyId',AppKey);
    if APIItem.NeedVersionParam then
      AParams.AddQueryParameter('SignatureVersion','1.0');
    if APIItem.NeedTimeStampParam then
      AParams.AddQueryParameter('Timestamp',
//            '2017-07-12T02:42:19Z'
                              FormatDateTime('YYYY-MM-DD',DT)
                              +'T'
                              +FormatDateTime('HH:MM:SS',DT)
                              +'Z'
                              );
    if APIItem.NeedFormatParam then
      AParams.AddQueryParameter('Format',Const_CallAPIFormatNames[ACallAPIFormat]);


    if APIItem.NeedMethodParam then
      AParams.AddQueryParameter('Action',APIItem.APIMethod);
    AParams.AddQueryParameter('Version','2017-05-25');
    AParams.AddQueryParameter('RegionId','cn-hangzhou');



    for I:=0 to Length(AParamNames) - 1 do
    begin
      AParams.AddQueryParameter(AParamNames[I],AParamValues[I]);
    end;

    //���ղ�������,����ֵ��������
    AParams.Sort;

    ASign:=EncryptHMAC_SHA1(Self.AppSecret+'&',
                            'GET'+'&'
                            +'%2F'+'&'
                            +AParams.GetUtf8UrlEncodeQueryParamsStr1
                            );

    ACallAPIHttpUrl:='Signature'+'='+URLEncode(ASign)
                      +'&'
                      +AParams.GetUtf8UrlEncodeQueryParamsStr
                      ;
    Result:=True;
  Finally
    AParams.Free;
  End;
end;

//function TTaoBaoAuth_TopProtocal.PostCallAPIHttpUrl(const AAPIItem: TObject;
//                                                    const AParamNames: array of String;
//                                                    const AParamValues: array of Variant;
//                                                    const ACallAPIFormat:TCallAPIFormat;
//                                                    var AParams:TQueryParameters;
//                                                    var ACallAPIHttpUrl:String): Boolean;
//var
//  I: Integer;
//  ASign:String;
//  APIItem:TTaoBaoAPIItem;
//begin
//  Result:=False;
//  APIItem:=TTaoBaoAPIItem(AAPIItem);
//  //���������б�
//  AParams:=TQueryParameters.Create;
//  //��Ӳ���
//  if APIItem.NeedVersionParam then AParams.AddQueryParameter(Self.FVersionSysParamName,FVersion);
//  if APIItem.NeedMethodParam then AParams.AddQueryParameter(Self.FAPIMethodSysParamName,APIItem.APIMethod);
//  if APIItem.NeedAppKeyParam then AParams.AddQueryParameter(Self.FAppKeySysParamName,AppKey);
//  if APIItem.NeedTimeStampParam then AParams.AddQueryParameter(Self.FTimeStampSysParamName,TaoBaoDateTimeToStr(Now));
//  if APIItem.NeedSignMethodParam then AParams.AddQueryParameter(Self.FSignMethodSysParamName,Const_SignTypeNames[stMD5]);
//  if APIItem.NeedFormatParam then AParams.AddQueryParameter(Self.FFormatSysParamName,Const_CallAPIFormatNames[ACallAPIFormat]);
//
//  for I:=0 to Length(AParamNames) - 1 do
//  begin
//    AParams.AddQueryParameter(AParamNames[I],AParamValues[I]);
//  end;
//  AParams.Sort;
//
//  ASign:=EncryptMD5(Self.AppSecret+AParams.GetSignQueryParamsStr+Self.AppSecret);
//
//  ACallAPIHttpUrl:=AParams.GetUtf8UrlEncodeQueryParamsStr+'&'+Self.FSignSysParamName+'='+URLEncode(ASign);
//  Result:=True;
//end;

end.


