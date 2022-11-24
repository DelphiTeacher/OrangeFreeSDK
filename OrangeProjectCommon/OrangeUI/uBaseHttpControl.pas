//convert pas to utf8
/// <summary>
///   <para>
///     Http���ػ���
///   </para>
///   <para>
///     Http download base class
///   </para>
/// </summary>
unit uBaseHttpControl;


interface
{$IF DEFINED(ANDROID) OR DEFINED(IOS) OR DEFINED(MACOS) }
  {$DEFINE FMX}
{$IFEND}



//���ڹ����·���FrameWork.inc
//�����ڹ�������������FMX����ָ��
//�ſ�����������˵�Ԫ
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}


{$IF CompilerVersion >= 30.0}
//{$IFDEF FMX}
  //�Ƿ���ҪSystemHttpControl,
  //FMX����Ҫ
  //VCL����û��NetHttpClient,��˲���Ҫ
  {$DEFINE NEED_SystemHttpControl}
//{$ENDIF}
//{$IFDEF VCL}
//{$ENDIF}
{$IFEND}



uses
  Classes,

  //FMX.Types�������Android�����п���
//  FMX.Types,

  {$IFDEF NEED_SystemHttpControl}
  uBaseLog,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.Types,
  {$ENDIF}

  uFuncCommon,
  IdURI,
  SysUtils;

const
    user_agent_list:array [0..17] of string = (
        'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1',
        'Mozilla/5.0 (X11; CrOS i686 2268.111.0) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11',
        'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6',
        'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1090.0 Safari/536.6',
        'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/19.77.34.5 Safari/537.1',
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5',
        'Mozilla/5.0 (Windows NT 6.0) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.36 Safari/536.5',
        'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3',
        'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3',
        'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3',
        'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3',
        'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3',
        'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3',
        'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3',
        'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.0 Safari/536.3',
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24',
        'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24'
    );

type
  THttpControlClass=class of THttpControl;



  //��������ʹ����֪ͨ�¼�(����ͳ��ʹ�õ���������)
  TNetworkDataUsageNotifyEvent=procedure(Sender:TObject;ADownloadDataSize:Int64;AUploadDataSize:Int64);




  /// <summary>
  ///   <para>
  ///     Http���ػ���
  ///   </para>
  ///   <para>
  ///     Http download base class
  ///   </para>
  /// </summary>
  THttpControl=class
  public
    constructor Create;virtual;
    destructor Destroy;override;
  public
    /// <summary>
    ///   <para>
    ///     ��ָ��URL�л�ȡ������
    ///   </para>
    ///   <para>
    ///     Get data stream from assigned URL
    ///   </para>
    /// </summary>
    /// <param name="AHttpUrl">
    ///   ���� <br />
    /// </param>
    /// <param name="AResponseStream">
    ///   ���ص������� <br />
    ///   <para>
    ///     Responsed data stream
    ///   </para>
    /// </param>
    /// <returns>
    ///   �Ƿ��ȡ�ɹ�
    ///   <para>
    ///    Whether get succeedly
    ///   </para>
    /// </returns>
    function Get(const AHttpUrl:String;AResponseStream:TStream):Boolean;overload;virtual;abstract;
    /// <summary>
    ///   <para>
    ///     �ύ��������ָ��Url,����ȡ���ص�������
    ///   </para>
    ///   <para>
    ///     Post data stream to assigned Url and get responsed data stream
    ///   </para>
    /// </summary>
    /// <param name="AHttpUrl">
    ///   ����
    ///  <para>
    ///  link
    ///  </para>
    /// </param>
    /// <param name="ARequestStream">
    ///   �ύ��������
    ///  <para>
    ///  Posted data stream
    ///  </para>
    /// </param>
    /// <param name="AResponseStream">
    ///   ���ص�������
    ///  <para>
    ///  Responsed data stream
    ///  </para>
    /// </param>
    /// <returns>
    ///   �Ƿ��ύ�ɹ�
    ///  <para>
    ///  Whether post succeedly
    ///  </para>
    /// </returns>
    function Post(const AHttpUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;virtual;abstract;
  end;





  {$IFDEF NEED_SystemHttpControl}
  TSystemHttpControl=class(THttpControl)
  protected
    FOnReceiveData:TReceiveDataEvent;

  protected
    procedure DoNeedClientCertificate(const Sender: TObject; const ARequest: TURLRequest; const ACertificateList: TCertificateList;
                                      var AnIndex: Integer);
    procedure DoNetHTTPClientReceiveData(const Sender: TObject; AContentLength,AReadCount: Int64; var Abort: Boolean);virtual;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    FNetHTTPClient:TNetHTTPClient;
    FNetHTTPRequestHeaders:TNetHeaders;

    function Get(const AHttpUrl:String;AResponseStream:TStream):Boolean;overload;override;
    function Post(const AHttpUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;override;
  public
    property OnReceiveData:TReceiveDataEvent read FOnReceiveData write FOnReceiveData;
  end;
  {$ENDIF}




//type
//
//  //���ýӿڵ��¼�
//  TCallAPIEvent=procedure(AHttpControl: THttpControl;AAPIUrl:String) of object;
//

//  TTimerTaskNotifyCallback=reference to procedure(Sender:TTimerTask);
//
//  TCallAPITaskItem=class
//  public
//    API: String;
//    InterfaceUrl:String;
//    UrlParamNames:Array of String;
//    UrlParamValues:Array of Variant;
//    OnExecuteEnd:TTimerTaskNotify;
//    //��������
//    OnExecuteEndCallback:TTimerTaskNotifyCallback;
//    procedure DoTaskExecute(ATimerTask:TObject);
//    procedure DoTaskExecuteEnd(ATimerTask:TObject);
//  end;
//
//
//
//var
//  OnCallAPIEvent:TCallAPIEvent;
//  GlobalCallAPITaskList:TBaseList;
//  //�û��ٴ��ύʱʹ��
//  GlobalLastParamJsonArray:ISuperArray;






var
  //(����Ӧ�ó�����)�����Ƿ����ӵı���
  IsNetworkConnected:Boolean;
  //��������ʹ�ø���
  OnNetworkDataUsageChange:TNetworkDataUsageNotifyEvent;
  GlobalSystemHttpControlClass:THttpControlClass;





////����rest�ӿ�,����������
//function SimpleGet(API: String;
//                  AHttpControl: THttpControl;
//                  AInterfaceUrl:String;
//                  AUrlParamNames:Array of String;
//                  AUrlParamValues:Array of Variant;
//                  AResponseStream: TStream;
//                  AIsPost:Boolean=False):Boolean;
//
//
//
////����rest�ӿ�,�����ַ���
//function SimpleCallAPI(API: String;
//          AHttpControl: THttpControl;
//          AInterfaceUrl:String;
//          AUrlParamNames:Array of String;
//          AUrlParamValues:Array of Variant;
//                    AIsPost:Boolean=False): String;overload;
//
//
////����rest�ӿ�,�����ַ���,�ڷ������ʹ��
//function SimpleCallAPI(API: String;
//          AHttpControl: THttpControl;
//          AInterfaceUrl:String;
//          AUrlParamNames:Array of String;
//          AUrlParamValues:Array of Variant;
//          var ACode:Integer;
//          var ADesc:String;
//          var ADataJson:ISuperObject): Boolean;overload;




////ͨ������������rest�ӿ�,�����ַ���
//function SimpleCallAPIByTimerTask(API: String;
//          AInterfaceUrl:String;
//          AUrlParamNames:Array of String;
//          AUrlParamValues:Array of Variant;
//          AOnExecuteEnd:TTimerTaskNotify;
//          AOnExecuteEndCallback:TTimerTaskNotifyCallback=nil
//          ): String;




////����TableCommonRest�Ļ�ȡ��¼�б�ӿ�get_record_list,�����ַ���
//function SimpleCallAPI_TableCommonGetRecordList(
//          ARestName: String;
//          AHttpControl: THttpControl;
//          AInterfaceUrl:String;
//          AAppID:Integer;
//          AUserFID:String;
//          AKey:String;
//          APageIndex:Integer=1;
//          APageSize:Integer=MaxInt;
//          //4��Stringһ��
//          AWhereConditions:TVariantDynArray=[];
//          AOrderBy:String='';
//          AWhereSQL:String=''): String;







////���ýӿ�,����������,��������APP
//function JsonSimplePost(API: String;
//                        //����Ϊnil
//                        AHttpControl: THttpControl;
//                        AInterfaceUrl:String;
//                        AParamJsonArray:ISuperArray;
//                        AResponseStream: TStream):Boolean;overload;
//function JsonSimpleCall(API: String;
//                        //����Ϊnil
//                        AHttpControl: THttpControl;
//                        AInterfaceUrl:String;
//                        AJsonParamNames:Array of String;
//                        AJsonParamValues:Array of Variant):String;overload;
//function JsonSimpleCall(API: String;
//                        //����Ϊnil
//                        AHttpControl: THttpControl;
//                        AInterfaceUrl:String;
//                        AParamJsonArray:ISuperArray):String;overload;






//function GetWhereConditions(AFieldNames:Array of String;
//                            AFieldValues:Array of Variant):String;
//function GetWhereKeyJson(AFieldNames:Array of String;
//                            AFieldValues:Array of Variant):String;
//function GetWhereConditionsPro(AFieldNames:Array of String;
//                            //�Ƚ������
//                            AFieldOpers:Array of String;
//                            AFieldValues:Array of Variant):String;




{$IFDEF FMX}
//�޸�URL֧��IPV6(�����ǰ��IPV6����,��ô�Զ��������м���[])
function FixSupportIPV6URL(const Url:String):String;

//��ǰ�����·���Ƿ�֧��IPV6
function IsSupportIPV6Host_IOS(const Host:String):Boolean;
{$ENDIF}


//����ͼƬ
function DownloadImage(APicUrl:String;APicFilePath:String;AIsRandomUserAgent:Boolean=False):Boolean;




implementation




{$IFDEF FMX}

    {$IFDEF IOS}
    uses
      FMX.Types,
      StrUtils,
      Posix.NetDB,
      Posix.ArpaInet,
      IdStackConsts
      ;
    {$ENDIF}


    //�Ƿ�֧��IPV6
    function IsSupportIPV6Host_IOS(const Host:String):Boolean;
    {$IFDEF IOS}
      var
        APHostEnt:PHostEnt;
    {$ENDIF}
    begin
      Result:=False;
      {$IFDEF IOS}


      //IOS�汾Ҫ����9,������XE10���Ͻ��б���
      if TOSVersion.Check(9) then
      begin
        try
          FMX.Types.Log.d('OrangeUI IsSupportIPV6Host_IOS '+Host);
          //�����ǰ������IPV4,APHostEntΪnil
          APHostEnt:=gethostbyname2(MarshaledAString(TEncoding.UTF8.GetBytes(Host)),Id_PF_INET6);
          Result:=(APHostEnt<>nil);
          FMX.Types.Log.d('OrangeUI IsSupportIPV6Host_IOS IsIPV6 '+BoolToStr(Result));
        except
          //������IPV4�л���IPV6,����û���˳���ʱ��,�ᱨ��
        end;
      end;

      {$ENDIF}
    end;

    //�޸�URL֧��IPV6
    function FixSupportIPV6URL(const Url:String):String;
    {$IFDEF IOS}
      var
        Host:String;
        HostBeginIndex:Integer;
        HostBeginIndex2:Integer;
        HostEndIndex:Integer;
    {$ENDIF}
    begin
      Result:=Url;
      {$IFDEF IOS}
      if TOSVersion.Check(9) then
      begin
        FMX.Types.Log.d('OrangeUI FixSupportIPV6URL '+Url);


        //��ȡ��������
        HostBeginIndex:=Pos('//',Url);
        if HostBeginIndex<=0 then
        begin
          HostBeginIndex:=0;
        end
        else
        begin
          HostBeginIndex:=HostBeginIndex+2;
        end;


        //ȥ���˿�
        HostEndIndex:=PosEx(':',Url,HostBeginIndex+2);
        if HostEndIndex<=0 then
        begin
          HostEndIndex:=Length(Url);

          //ȥ����׺
          HostEndIndex:=PosEx('/',Url,HostBeginIndex+2);
          if HostEndIndex<=0 then
          begin
            HostEndIndex:=Length(Url);
          end;

        end;





        //ȥ���û�������
        //'apis:35337f1232b9b5c92996e059174ef735@jg.czfood360.cn'
        HostBeginIndex2:=PosEx('@',Url,HostBeginIndex);
        if (HostBeginIndex2>0) and (HostBeginIndex2<HostEndIndex) then
        begin
          HostBeginIndex:=HostBeginIndex2+1;
        end;



        Host:=Copy(Url,HostBeginIndex,HostEndIndex-HostBeginIndex);

        FMX.Types.Log.d('OrangeUI FixSupportIPV6URL Host��'+Host);
    //    //IPV4��ַΪ::192.168.0.199
    //    if inet_addr(MarshaledAString(TEncoding.UTF8.GetBytes(Host)))<>-1 then
    //    begin
    //      Host:='::'+Host;
    //    end;

        if IsSupportIPV6Host_IOS(Host) then
        begin
          //�����ǰ���绷����IPV6,
          //��ô�����Ӽ���[]
          Result:=Copy(Url,0,HostBeginIndex-1)
                  +'['
                  +Host
                  +']'
                  +Copy(Url,HostEndIndex,MaxInt);


          FMX.Types.Log.d('OrangeUI FixSupportIPV6URL Result��'+Result);
        end;

      end;
      {$ENDIF}
    end;
{$ENDIF}




//����ͼƬ
function DownloadImage(APicUrl:String;APicFilePath:String;AIsRandomUserAgent:Boolean=False):Boolean;
var
//  AHttpControl:THttpControl;
  ANetHTTPClient:TNetHTTPClient;
  AResponseStream:TMemoryStream;
begin
  Result:=False;
  ANetHTTPClient:=TNetHTTPClient.Create(nil);
  AResponseStream:=TMemoryStream.Create;
  try
    try
      if AIsRandomUserAgent then
      begin
        //facebook����,����tiktok���ܼ���һ��
        Randomize();
        ANetHTTPClient.CustomHeaders['user-agent']:=user_agent_list[Random(Length(user_agent_list))];
      end;

      ANetHTTPClient.Get(APicUrl,AResponseStream);
      AResponseStream.SaveToFile(APicFilePath);
      Result:=True;
    except
      on E:Exception do
      begin
        uBaseLog.HandleException(E,'DownloadImage '+APicUrl);
      end;
    end;
  finally
    FreeAndNil(ANetHTTPClient);
    FreeAndNil(AResponseStream);
  end;
end;


{$IFDEF NEED_SystemHttpControl}

{ TSystemHttpControl }

constructor TSystemHttpControl.Create;
begin
  Inherited;

  FNetHTTPClient:=TNetHTTPClient.Create(nil);



  //������ô����
//  FNetHTTPClient.ConnectionTimeout:=30*1000;  //���ӳ�ʱ-��ʮ��
//  FNetHTTPClient.ResponseTimeout:=30*1000;    //��Ӧ��ʱ��ʮ��



  //Post�ϴ��ļ�����ʱ��Ҫ����,��ȻIDHttpServer���յ������ʱ��ᱨ��
  //����Ϊ���������UrlParams
  FNetHTTPClient.ContentType:='application/octet-stream; charset=utf-8';
  FNetHTTPClient.OnReceiveData:=Self.DoNetHTTPClientReceiveData;
  FNetHTTPClient.OnNeedClientCertificate:=DoNeedClientCertificate;
end;

destructor TSystemHttpControl.Destroy;
begin

  FreeAndNil(FNetHTTPClient);

  inherited;
end;

procedure TSystemHttpControl.DoNeedClientCertificate(const Sender: TObject;
  const ARequest: TURLRequest; const ACertificateList: TCertificateList;
  var AnIndex: Integer);
begin
  //
end;

procedure TSystemHttpControl.DoNetHTTPClientReceiveData(const Sender: TObject;AContentLength, AReadCount: Int64; var Abort: Boolean);
begin
  if Assigned(FOnReceiveData) then
  begin
    FOnReceiveData(Sender,AContentLength,AReadCount,Abort);
  end;
end;

function TSystemHttpControl.Get(const AHttpUrl: String;AResponseStream: TStream): Boolean;
//var
//  AResponseStream1:TStringStream;
begin
    Result:=False;

//    AResponseStream1:=TStringStream.Create('',TEncoding.UTF8);
//    try
//      FNetHTTPClient.Get(AUrl,AResponseStream1);
//      //������Ƿ��ص�����
//      AResponseStream1.DataString;
//    finally
//      FreeAndNil(AResponseStream1);
//    end;


    try
      Self.FNetHTTPClient.Get(AHttpUrl,AResponseStream,FNetHTTPRequestHeaders);
      IsNetworkConnected:=True;
      Result:=True;


      //����
      if Assigned(OnNetworkDataUsageChange) then
      begin
        OnNetworkDataUsageChange(Self,AResponseStream.Size,0);
      end;

    except
      on E:Exception do
      begin
        IsNetworkConnected:=False;
        uBaseLog.HandleException(E,'TSystemHttpControl.Get '+AHttpUrl);
      end;
    end;
end;

function TSystemHttpControl.Post(const AHttpUrl: String; ARequestStream,AResponseStream: TStream): Boolean;
begin
    Result:=False;

    try

      FNetHTTPClient.Post(AHttpUrl,
                          ARequestStream,
                          AResponseStream,
                          FNetHTTPRequestHeaders);

      IsNetworkConnected:=True;
      Result:=True;


      //�ϴ�
      if Assigned(OnNetworkDataUsageChange) then
      begin
        if ARequestStream=nil then
        begin
          OnNetworkDataUsageChange(Self,AResponseStream.Size,0);
        end
        else
        begin
          OnNetworkDataUsageChange(Self,AResponseStream.Size,ARequestStream.Size);
        end;
      end;

    except
      on E:Exception do
      begin
        IsNetworkConnected:=False;
        uBaseLog.HandleException(E,'TSystemHttpControl.Post '+AHttpUrl);
      end;
    end;
end;
{$ENDIF}



{ THttpControl }

constructor THttpControl.Create;
begin

end;

destructor THttpControl.Destroy;
begin

  inherited;
end;



//function GetWhereKeyJson(AFieldNames:Array of String;
//                            AFieldValues:Array of Variant):String;
//begin
//  Result:=GetWhereConditions(AFieldNames,AFieldValues);
//end;


//function GetWhereConditions(AFieldNames:Array of String;
//                            AFieldValues:Array of Variant):String;
//var
//  I:Integer;
//
//  AWhereKeyJson:ISuperObject;
//  AWhereKeyJsonArray:ISuperArray;
//begin
//  AWhereKeyJsonArray:=TSuperArray.Create;
//
//  for I := 0 to Length(AFieldNames)-1 do
//  begin
//
//    AWhereKeyJson:=TSuperObject.Create;
//    AWhereKeyJson.S['logical_operator']:='AND';
//    AWhereKeyJson.S['name']:=AFieldNames[I];
//    AWhereKeyJson.S['operator']:='=';
//    AWhereKeyJson.V['value']:=AFieldValues[I];
//
//    AWhereKeyJsonArray.O[I]:=AWhereKeyJson;
//
//  end;
//
//  Result:=AWhereKeyJsonArray.AsJSON;
//end;
//
//
//function GetWhereConditionsPro(AFieldNames:Array of String;
//                            AFieldOpers:Array of String;
//                            AFieldValues:Array of Variant):String;
//var
//  I:Integer;
//
//  AWhereKeyJson:ISuperObject;
//  AWhereKeyJsonArray:ISuperArray;
//begin
//  AWhereKeyJsonArray:=TSuperArray.Create;
//
//  for I := 0 to Length(AFieldNames)-1 do
//  begin
//
//    AWhereKeyJson:=TSuperObject.Create;
//    AWhereKeyJson.S['logical_operator']:='AND';
//    AWhereKeyJson.S['name']:=AFieldNames[I];
//    AWhereKeyJson.S['operator']:=AFieldOpers[I];
//    AWhereKeyJson.V['value']:=AFieldValues[I];
//
//    AWhereKeyJsonArray.O[I]:=AWhereKeyJson;
//
//  end;
//
//  Result:=AWhereKeyJsonArray.AsJSON;
//end;
//
//function SimpleCallAPI_TableCommonGetRecordList(
//                      ARestName: String;
//                      AHttpControl: THttpControl;
//                      AInterfaceUrl:String;
//                      AAppID:Integer;
//                      AUserFID:String;
//                      AKey:String;
//                      APageIndex:Integer;
//                      APageSize:Integer;
//                      AWhereConditions:TVariantDynArray;
//                      AOrderBy:String;
//                      AWhereSQL:String): String;
//var
//  AWhereKeyJson:ISuperObject;
//  AWhereKeyJsonArray:ISuperArray;
//
//  ASuperObject:ISuperObject;
//  I: Integer;
//begin
//  Result:='';
//
//
//  //����
//  AWhereKeyJsonArray:=TSuperArray.Create;
//  for I := 0 to Length(AWhereConditions) div 4 -1 do
//  begin
//    AWhereKeyJson:=TSuperObject.Create;
//    AWhereKeyJson.S['logical_operator']:=AWhereConditions[I*4];
//    AWhereKeyJson.S['name']:=AWhereConditions[I*4+1];
//    AWhereKeyJson.S['operator']:=AWhereConditions[I*4+2];
//    AWhereKeyJson.V['value']:=AWhereConditions[I*4+3];
//    AWhereKeyJsonArray.O[I]:=AWhereKeyJson;
//  end;
//
//
//
//  Result:=SimpleCallAPI('get_record_list',
//                    AHttpControl,
//                    AInterfaceUrl,
//                    ['appid',
//                    'user_fid',
//                    'key',
//                    'rest_name',
//                    'pageindex',
//                    'pagesize',
//                    'where_key_json',
//                    'order_by',
//                    'where_sql'],
//                    [AAppID,
//                    AUserFID,
//                    AKey,
//                    ARestName,
//                    APageIndex,
//                    APageSize,
//                    AWhereKeyJsonArray.AsJson,
//                    AOrderBy,
//                    AWhereSQL
//                    ]
//                    );
//
//
//end;
//
//
//function JsonSimpleCall(API: String;
//                        //����Ϊnil
//                        AHttpControl: THttpControl;
//                        AInterfaceUrl:String;
//                        AParamJsonArray:ISuperArray):String;
//var
//  ACallResult:Boolean;
//  AIsNeedFreeAHttpControl:Boolean;
//  AResponseStream: TStringStream;
//begin
////  FMX.Types.Log.d('SimpleCallAPI '+API+' '+'begin');
//
//  Result:='';
//
//  AIsNeedFreeAHttpControl:=False;
//  if AHttpControl=nil then
//  begin
//    AIsNeedFreeAHttpControl:=True;
//    AHttpControl:=TSystemHttpControl.Create;
//  end;
//
//
//  //AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
//  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
//  try
//
//
//    //2����¼
//    //APP������
//    //[
//    //  {"HotelID":"�ֵ��","Action":"Login","AccountID":"����","PassWord":"����"}
//    //]
//    //
//    //���Ե�APP
//    //[
//    //  {"Action":"Login","Flag":"4"},
//    //  {
//    //	 Ȩ�޲���,���ع��ܰ�ť
//    //	 ...
//    //  }
//    //]
//
//
//
//    GlobalLastParamJsonArray:=AParamJsonArray;
//    ACallResult:=JsonSimplePost(
//                       API,
//                       AHttpControl,
//                       AInterfaceUrl,
//                       AParamJsonArray,
//                       AResponseStream
//                       );
//
//
//    if ACallResult then
//    begin
//        //���óɹ�
//
//        //�������ʱ�ļ�,��������־
//        {$IFDEF MSWINDOWS}
//        AResponseStream.Position:=0;
//        AResponseStream.
//            SaveToFile(GetApplicationPath
////                        +ReplaceStr(API,'/','_')+' '
//                        +AParamJsonArray.O[0].S['Action']+' '
//                        +FormatDateTime('YYYY-MM-DD HH-MM-SS-ZZZ',Now)+'.json');
//        {$ENDIF}
//
//
//
//        AResponseStream.Position:=0;
//        try
//          Result:=AResponseStream.DataString;//���� 'SvrHandID' ��Ч��
//        except
//          on E:Exception do
//          begin
//            //���벻��ʶ��,��Ҫ���⴦��һ��
//            Result:='';
//          end;
//        end;
//
//        //���񲻿���
//        if Result='Service Unavailable' then
//        begin
//          Result:='';
//        end;
//
//        if Result='Internal Server Error' then
//        begin
//          Result:='';
//        end;
//
//
//    end
//    else
//    begin
//        //����ʧ��
//
//    end;
//
//  finally
//    SysUtils.FreeAndNil(AResponseStream);
//    if AIsNeedFreeAHttpControl then
//    begin
//      SysUtils.FreeAndNil(AHttpControl);
//    end;
//  end;
//
////  FMX.Types.Log.d('SimpleCallAPI '+API+' '+'end');
//
//
//end;
//
//function JsonSimpleCall(API: String;
//                        AHttpControl: THttpControl;
//                        AInterfaceUrl:String;
//                        AJsonParamNames:Array of String;
//                        AJsonParamValues:Array of Variant):String;
//var
//  I:Integer;
//  AParamJsonArray:ISuperArray;
//  AParamJson:ISuperObject;
//begin
////  FMX.Types.Log.d('SimpleCallAPI '+API+' '+'begin');
//
//  Result:='';
//
//
//  AParamJsonArray:=TSuperArray.Create;
//  AParamJson:=TSuperObject.Create;
//  AParamJsonArray.O[0]:=AParamJson;
//
//  for I:=0 to Length(AJsonParamNames)-1 do
//  begin
//    AParamJson.V[AJsonParamNames[I]]:=AJsonParamValues[I];
//  end;
//
//
//  Result:=JsonSimpleCall(
//                     API,
//                     AHttpControl,
//                     AInterfaceUrl,
//                     AParamJsonArray
//                     );
//
//end;
//
//
//function SimpleCallAPI(API: String;
//                      AHttpControl:THttpControl;
//                      AInterfaceUrl:String;
//                      AUrlParamNames:Array of String;
//                      AUrlParamValues:Array of Variant;
//                      AIsPost:Boolean): String;
//var
//  ACallResult:Boolean;
//  AResponseStream: TStringStream;
//begin
////  FMX.Types.Log.d('SimpleCallAPI '+API+' '+'begin');
//
//  Result:='';
//
//  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
//  try
//    ACallResult:=SimpleGet(
//                       API,
//                       AHttpControl,
//                       AInterfaceUrl,
//                       AUrlParamNames,
//                       AUrlParamValues,
//                       AResponseStream,
//                       AIsPost
//                       );
//
//
//    if ACallResult then
//    begin
//        //���óɹ�
//
//
//
////        //�������ʱ�ļ�,��������־
////        {$IFDEF MSWINDOWS}
////        AResponseStream.Position:=0;
////        AResponseStream.
////            SaveToFile(GetApplicationPath
//////                        +ReplaceStr(API,'/','_')+' '
////                        +FormatDateTime('YYYY-MM-DD HH-MM-SS-ZZZ',Now)+'.json');
////        {$ENDIF}
//
//
//
//
//        AResponseStream.Position:=0;
//        Result:=AResponseStream.DataString;
//
//        //���񲻿���
//        if Result='Service Unavailable' then
//        begin
//          Result:='';
//        end;
//
//        if Result='Internal Server Error' then
//        begin
//          Result:='';
//        end;
//
//
//    end
//    else
//    begin
//      //����ʧ��
//
//    end;
//
//  finally
//    SysUtils.FreeAndNil(AResponseStream);
//  end;
//
////  FMX.Types.Log.d('SimpleCallAPI '+API+' '+'end');
//end;
//
//
//function SimpleCallAPI(API: String;
//          AHttpControl: THttpControl;
//          AInterfaceUrl:String;
//          AUrlParamNames:Array of String;
//          AUrlParamValues:Array of Variant;
//          var ACode:Integer;
//          var ADesc:String;
//          var ADataJson:ISuperObject): Boolean;
//var
//  AHttpResponse:String;
//  ASuperObject:ISuperObject;
//begin
//  Result:=False;
//
//  //�������ʼ����,�������������ʼ��
//  ACode:=FAIL;
//  ADesc:='';
//  ADataJson:=nil;
//
//  AHttpResponse:=SimpleCallAPI(API,
//                              AHttpControl,
//                              AInterfaceUrl,
//                              AUrlParamNames,
//                              AUrlParamValues);
//  if (AHttpResponse<>'')
////    and not SameText(AHttpResponse,'Service Unavailable')
//    then
//  begin
//      try
//        ASuperObject:=TSuperObject.Create(AHttpResponse);
//
//        ACode:=ASuperObject.I['Code'];
//        ADesc:=ASuperObject.S['Desc'];
//        ADataJson:=ASuperObject.O['Data'];
//
//        if ACode=SUCC then
//        begin
//          //�ӿڷ��سɹ�
//          Result:=True;
//        end;
//
//      except
//        on E:Exception do
//        begin
//          ADesc:=E.Message;
//          uBaseLog.HandleException(E,'SimpleCallAPI Url:'+AInterfaceUrl+' API'+API);
//        end;
//      end;
//  end
//  else
//  begin
//      ADesc:=API+Trans('�ӿڵ���ʧ��'+AHttpResponse);
//  end;
//end;
//
//function SimpleGet(API: String;
//                  AHttpControl:THttpControl;
//                  AInterfaceUrl:String;
//                  AUrlParamNames:Array of String;
//                  AUrlParamValues:Array of Variant;
//                  AResponseStream: TStream;
//                  AIsPost:Boolean=False): Boolean;
//var
//  I:Integer;
//  AStrValue:String;
//  AParamsStr:String;
//  ABefore:TDateTime;
//  AIsNeedFreeAHttpControl:Boolean;
//begin
//    ABefore:=Now;
////    FMX.Types.Log.d('SimplePost'+' '+'begin'+' '+FormatDateTime('HH:MM:SS',ABefore));
//
//
//  AIsNeedFreeAHttpControl:=False;
//  if AHttpControl=nil then
//  begin
//    AIsNeedFreeAHttpControl:=True;
//    AHttpControl:=TSystemHttpControl.Create;
//  end;
//  try
//
//      AParamsStr:='';
//      for I:=0 to Length(AUrlParamNames)-1 do
//      begin
//        AStrValue:=AUrlParamValues[I];
//        if AParamsStr<>'' then
//        begin
//          AParamsStr:=AParamsStr+'&'+AUrlParamNames[I]+'='+AStrValue;
//        end
//        else
//        begin
//          AParamsStr:=AUrlParamNames[I]+'='+AStrValue;
//        end;
//      end;
//
//      if Assigned(OnCallAPIEvent) then
//      begin
//        OnCallAPIEvent(AHttpControl,AInterfaceUrl+API+'?'+AParamsStr);
//      end;
//
//      if not AIsPost then
//      begin
//        Result:=AHttpControl.Get(
//            TIdURI.URLEncode(AInterfaceUrl+API+'?'+AParamsStr),
//            AResponseStream);
//      end
//      else
//      begin
//        Result:=AHttpControl.Post(
//            TIdURI.URLEncode(AInterfaceUrl+API+'?'+AParamsStr),
//            nil,
//            AResponseStream);
//      end;
//
//  finally
//    if AIsNeedFreeAHttpControl then
//    begin
//      SysUtils.FreeAndNil(AHttpControl);
//    end;
//  end;
//
////    uBaseLog.OutputDebugString('SimpleGet'+' '+AInterfaceUrl+API+' '+'end'+' '+'��ʱ'+IntToStr(DateUtils.SecondsBetween(ABefore,Now)));
//
//end;
//
//function JsonSimplePost(API: String;
//                  AHttpControl:THttpControl;
//                  AInterfaceUrl:String;
//                  AParamJsonArray:ISuperArray;
////                  AJsonParamNames:Array of String;
////                  AJsonParamValues:Array of Variant;
//                  AResponseStream: TStream): Boolean;
//var
//  ABefore:TDateTime;
//  ARequestStream:TStringStream;
//begin
//    ABefore:=Now;
////    FMX.Types.Log.d('SimplePost'+' '+'begin'+' '+FormatDateTime('HH:MM:SS',ABefore));
//
//
//    if Assigned(OnCallAPIEvent) then
//    begin
//      OnCallAPIEvent(AHttpControl,AInterfaceUrl+API);
//    end;
//
//
//
//    ARequestStream:=TStringStream.Create('',TEncoding.UTF8);
//    try
//        ARequestStream.WriteString(AParamJsonArray.AsJSON);
//        ARequestStream.Position:=0;
//
//        Result:=AHttpControl.Post(
//                                TIdURI.URLEncode(AInterfaceUrl+API),
//                                ARequestStream,
//                                AResponseStream);
//    finally
//      FreeAndNil(ARequestStream);
//    end;
//
//
////    uBaseLog.OutputDebugString('SimpleGet'+' '+AInterfaceUrl+API+' '+'end'+' '+'��ʱ'+IntToStr(DateUtils.SecondsBetween(ABefore,Now)));
//
//end;





//function SimpleCallAPIByTimerTask(API: String;
//                                  AInterfaceUrl:String;
//                                  AUrlParamNames:Array of String;
//                                  AUrlParamValues:Array of Variant;
//                                  AOnExecuteEnd:TTimerTaskNotify;
//                                  AOnExecuteEndCallback:TTimerTaskNotifyCallback): String;
//var
//  I:Integer;
//  ACallAPITaskItem:TCallAPITaskItem;
//begin
//  ACallAPITaskItem:=TCallAPITaskItem.Create;
//  ACallAPITaskItem.API:=API;
//  ACallAPITaskItem.InterfaceUrl:=AInterfaceUrl;
//  ACallAPITaskItem.OnExecuteEnd:=AOnExecuteEnd;
//  ACallAPITaskItem.OnExecuteEndCallback:=AOnExecuteEndCallback;
//
//  //���Ʋ���������
//  SetLength(ACallAPITaskItem.UrlParamNames,Length(AUrlParamNames));
//  for I := 0 to Length(AUrlParamNames)-1 do
//  begin
//    ACallAPITaskItem.UrlParamNames[I]:=AUrlParamNames[I];
//  end;
//
//  //���Ʋ���ֵ����
//  SetLength(ACallAPITaskItem.UrlParamValues,Length(AUrlParamValues));
//  for I := 0 to Length(AUrlParamValues)-1 do
//  begin
//    ACallAPITaskItem.UrlParamValues[I]:=AUrlParamValues[I];
//  end;
//
//
//  GetGlobalTimerThread.RunTempTask(
//      ACallAPITaskItem.DoTaskExecute,
//      ACallAPITaskItem.DoTaskExecuteEnd,
//      'SimpleCallAPIByTimerTask'
//      );
//  GlobalCallAPITaskList.Add(ACallAPITaskItem);
//
//end;
//
//
//{ TCallAPITaskItem }
//
//procedure TCallAPITaskItem.DoTaskExecute(ATimerTask: TObject);
//begin
//  //����
//  TTimerTask(ATimerTask).TaskTag:=0;
//  try
//
//    TTimerTask(ATimerTask).TaskDesc:=SimpleCallAPI(Self.API,
//                                          nil,
//                                          Self.InterfaceUrl,
//                                          Self.UrlParamNames,
//                                          Self.UrlParamValues
//                                          );
//
//    if TTimerTask(ATimerTask).TaskDesc<>'' then
//    begin
//      TTimerTask(ATimerTask).TaskTag:=0;
//    end;
//
//  except
//    on E:Exception do
//    begin
//      //�쳣
//      TTimerTask(ATimerTask).TaskDesc:=E.Message;
//    end;
//  end;
//end;
//
//procedure TCallAPITaskItem.DoTaskExecuteEnd(ATimerTask: TObject);
//begin
//  if Assigned(Self.OnExecuteEnd) then
//  begin
//    OnExecuteEnd(TTimerTask(ATimerTask));
//  end;
//  if Assigned(Self.OnExecuteEndCallback) then
//  begin
//    OnExecuteEndCallback(TTimerTask(ATimerTask));
//  end;
//end;
//
//
//
//
//initialization
//  GlobalCallAPITaskList:=TBaseList.Create;
//
//finalization
//  FreeAndNil(GlobalCallAPITaskList);





initialization
  IsNetworkConnected:=True;
  {$IFDEF NEED_SystemHttpControl}
  GlobalSystemHttpControlClass:=TSystemHttpControl;
  {$ENDIF}


end.






