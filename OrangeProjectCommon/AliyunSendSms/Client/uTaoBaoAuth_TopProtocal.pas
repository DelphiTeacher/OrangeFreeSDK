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
    //应用的App Secret
    FAppSecret:String;
    //应用的App Key
    FAppKey:String;
    //API调用Url
    FAPIUrl:String;


//    //的版本,2.0
//    FVersion:String;
//
//    /////////以下是系统参数的名称///////
//    //API接口名称
//    FAPIMethodSysParamName:String;
//    //时间戳的参数名 时间戳，格式为yyyy-mm-dd HH:mm:ss，例如：2008-01-25 20:23:30。淘宝API服务端允许客户端请求时间误差为6分钟。
//    FTimeStampSysParamName:String;
//    //响应格式参数名
//    FFormatSysParamName:String;
//    //AppKey参数名
//    FAppKeySysParamName:String;
//    //版本号的参数名
//    FVersionSysParamName:String;
//    //签名的参数名
//    FSignSysParamName:String;
//    //签名所用的算法 参数的加密方法选择，可选值是：md5,hmac
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



//全球标准时间
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
  //创建参数列表
  AParams:=TQueryParameters.Create;
  Try

    DT:=SystemNow;

    CreateGUID(GUID);



    //添加参数
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

    //按照参数名称,参数值进行排序
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
//  //创建参数列表
//  AParams:=TQueryParameters.Create;
//  //添加参数
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


