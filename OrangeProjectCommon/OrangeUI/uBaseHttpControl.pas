//convert pas to utf8
/// <summary>
///   <para>
///     Http下载基类
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



//请在工程下放置FrameWork.inc
//或者在工程设置中配置FMX编译指令
//才可以正常编译此单元
{$IFNDEF FMX}
  {$IFNDEF VCL}
    {$I FrameWork.inc}
  {$ENDIF}
{$ENDIF}


{$IF CompilerVersion >= 30.0}
//{$IFDEF FMX}
  //是否需要SystemHttpControl,
  //FMX下需要
  //VCL下面没有NetHttpClient,因此不需要
  {$DEFINE NEED_SystemHttpControl}
//{$ENDIF}
//{$IFDEF VCL}
//{$ENDIF}
{$IFEND}



uses
  Classes,

  //FMX.Types会造成在Android服务中卡死
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
  uBaseList,
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



  //网络数据使用量通知事件(用于统计使用的数据流量)
  TNetworkDataUsageNotifyEvent=procedure(Sender:TObject;ADownloadDataSize:Int64;AUploadDataSize:Int64);




  /// <summary>
  ///   <para>
  ///     Http下载基类
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
    ///     从指定URL中获取数据流
    ///   </para>
    ///   <para>
    ///     Get data stream from assigned URL
    ///   </para>
    /// </summary>
    /// <param name="AHttpUrl">
    ///   链接 <br />
    /// </param>
    /// <param name="AResponseStream">
    ///   返回的数据流 <br />
    ///   <para>
    ///     Responsed data stream
    ///   </para>
    /// </param>
    /// <returns>
    ///   是否获取成功
    ///   <para>
    ///    Whether get succeedly
    ///   </para>
    /// </returns>
    function Get(const AHttpUrl:String;AResponseStream:TStream):Boolean;overload;virtual;abstract;
    /// <summary>
    ///   <para>
    ///     提交数据流到指定Url,并获取返回的数据流
    ///   </para>
    ///   <para>
    ///     Post data stream to assigned Url and get responsed data stream
    ///   </para>
    /// </summary>
    /// <param name="AHttpUrl">
    ///   链接
    ///  <para>
    ///  link
    ///  </para>
    /// </param>
    /// <param name="ARequestStream">
    ///   提交的数据流
    ///  <para>
    ///  Posted data stream
    ///  </para>
    /// </param>
    /// <param name="AResponseStream">
    ///   返回的数据流
    ///  <para>
    ///  Responsed data stream
    ///  </para>
    /// </param>
    /// <returns>
    ///   是否提交成功
    ///  <para>
    ///  Whether post succeedly
    ///  </para>
    /// </returns>
    function Post(const AHttpUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;virtual;abstract;
    procedure SetCustomHeader(ACustomHeaders:TVariantDynArray);virtual;abstract;
  end;





  {$IFDEF NEED_SystemHttpControl}
  TSystemHttpControl=class(THttpControl)
  protected
//    FOnReceiveData:TReceiveDataEvent;
//
//  protected
    //可能是因为赋了这个事件，导致在HTTP服务中卡死
//    procedure DoNeedClientCertificate(const Sender: TObject; const ARequest: TURLRequest; const ACertificateList: TCertificateList;
//                                      var AnIndex: Integer);
//    procedure DoNetHTTPClientReceiveData(const Sender: TObject; AContentLength,AReadCount: Int64; var Abort: Boolean);virtual;
  public
    constructor Create;override;
    destructor Destroy;override;
  public
    FNetHTTPClient:TNetHTTPClient;
    FNetHTTPRequestHeaders:TNetHeaders;

    function Get(const AHttpUrl:String;AResponseStream:TStream):Boolean;overload;override;
    function Post(const AHttpUrl:String;ARequestStream:TStream;AResponseStream:TStream):Boolean;overload;override;
    procedure SetCustomHeader(ACustomHeaderPairs:TVariantDynArray);override;
//  public
//    property OnReceiveData:TReceiveDataEvent read FOnReceiveData write FOnReceiveData;
  end;
  {$ENDIF}


  //请求的参数键值对
  TQueryParameter=class
  private
    FName:String;
    FValue:Variant;
  public
    constructor Create(const AName:String;const AValue:Variant);
    destructor Destroy;override;
  public
    property Name:String read FName write FName;
    property Value:Variant read FValue write FValue;
  end;

  //参数列表
  TQueryParameters=class(TBaseList)
  private
    function GetItem(Index: Integer): TQueryParameter;
  public
    //需要按照名字顺序排序,如果名字相同,那要根据值来排序,生成的签名才是有用的
    procedure Sort;
    function GetUtf8UrlEncodeQueryParamsStr:String;
    function GetUtf8UrlEncodeQueryParamsStr1:String;
    function GetSignQueryParamsStr:String;
    //添加一对键值
    procedure AddQueryParameter(const AName:String;const AValue:Variant);
  public
    function FindItemByName(AName:String):TQueryParameter;
    property Items[Index:Integer]:TQueryParameter read GetItem;default;
  end;


//type
//
//  //调用接口的事件
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
//    //匿名函数
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
//  //用户再次提交时使用
//  GlobalLastParamJsonArray:ISuperArray;






var
  //(整个应用程序内)网络是否连接的变量
  IsNetworkConnected:Boolean;
  //网络数据使用更改
  OnNetworkDataUsageChange:TNetworkDataUsageNotifyEvent;
  GlobalSystemHttpControlClass:THttpControlClass;





////调用rest接口,返回数据流
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
////调用rest接口,返回字符串
//function SimpleCallAPI(API: String;
//          AHttpControl: THttpControl;
//          AInterfaceUrl:String;
//          AUrlParamNames:Array of String;
//          AUrlParamValues:Array of Variant;
//                    AIsPost:Boolean=False): String;overload;
//
//
////调用rest接口,返回字符串,在服务端中使用
//function SimpleCallAPI(API: String;
//          AHttpControl: THttpControl;
//          AInterfaceUrl:String;
//          AUrlParamNames:Array of String;
//          AUrlParamValues:Array of Variant;
//          var ACode:Integer;
//          var ADesc:String;
//          var ADataJson:ISuperObject): Boolean;overload;




////通过任务来调用rest接口,返回字符串
//function SimpleCallAPIByTimerTask(API: String;
//          AInterfaceUrl:String;
//          AUrlParamNames:Array of String;
//          AUrlParamValues:Array of Variant;
//          AOnExecuteEnd:TTimerTaskNotify;
//          AOnExecuteEndCallback:TTimerTaskNotifyCallback=nil
//          ): String;




////调用TableCommonRest的获取记录列表接口get_record_list,返回字符串
//function SimpleCallAPI_TableCommonGetRecordList(
//          ARestName: String;
//          AHttpControl: THttpControl;
//          AInterfaceUrl:String;
//          AAppID:Integer;
//          AUserFID:String;
//          AKey:String;
//          APageIndex:Integer=1;
//          APageSize:Integer=MaxInt;
//          //4个String一组
//          AWhereConditions:TVariantDynArray=[];
//          AOrderBy:String='';
//          AWhereSQL:String=''): String;







////调用接口,返回数据流,用于推拿APP
//function JsonSimplePost(API: String;
//                        //不能为nil
//                        AHttpControl: THttpControl;
//                        AInterfaceUrl:String;
//                        AParamJsonArray:ISuperArray;
//                        AResponseStream: TStream):Boolean;overload;
//function JsonSimpleCall(API: String;
//                        //可以为nil
//                        AHttpControl: THttpControl;
//                        AInterfaceUrl:String;
//                        AJsonParamNames:Array of String;
//                        AJsonParamValues:Array of Variant):String;overload;
//function JsonSimpleCall(API: String;
//                        //可以为nil
//                        AHttpControl: THttpControl;
//                        AInterfaceUrl:String;
//                        AParamJsonArray:ISuperArray):String;overload;






//function GetWhereConditions(AFieldNames:Array of String;
//                            AFieldValues:Array of Variant):String;
//function GetWhereKeyJson(AFieldNames:Array of String;
//                            AFieldValues:Array of Variant):String;
//function GetWhereConditionsPro(AFieldNames:Array of String;
//                            //比较运算符
//                            AFieldOpers:Array of String;
//                            AFieldValues:Array of Variant):String;




{$IFDEF FMX}
//修复URL支持IPV6(如果当前是IPV6环境,那么自动在域名中加上[])
function FixSupportIPV6URL(const Url:String):String;

//当前网络的路由是否支持IPV6
function IsSupportIPV6Host_IOS(const Host:String):Boolean;
{$ENDIF}


{$IF CompilerVersion>=30.0}
//下载图片
function DownloadImage(APicUrl:String;APicFilePath:String;AIsRandomUserAgent:Boolean=False):Boolean;overload;
function DownloadImage(APicUrl:String;AResponseStream:TStream;AIsRandomUserAgent:Boolean=False):Boolean;overload;
{$IFEND}

//HasWWW:是不是包含域名,是域名的话，参数列表前面会加?号
function ParseUrlQueryParameters(URL:String;HasWWW:Boolean=True):TQueryParameters;
function GetUrlParamValue(AURL:String;AParamName:String;HasWWW:Boolean=True):String;

function GetCustomHeader(ACustomHeaderPairs:TVariantDynArray):TNetHeaders;overload;
function GetCustomHeader(ACustomHeaderPairs:TStringList):TNetHeaders;overload;


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


    //是否支持IPV6
    function IsSupportIPV6Host_IOS(const Host:String):Boolean;
    {$IFDEF IOS}
      var
        APHostEnt:PHostEnt;
    {$ENDIF}
    begin
      Result:=False;
      {$IFDEF IOS}


      //IOS版本要大于9,必须用XE10以上进行编译
      if TOSVersion.Check(9) then
      begin
        try
          FMX.Types.Log.d('OrangeUI IsSupportIPV6Host_IOS '+Host);
          //如果当前环境是IPV4,APHostEnt为nil
          APHostEnt:=gethostbyname2(MarshaledAString(TEncoding.UTF8.GetBytes(Host)),Id_PF_INET6);
          Result:=(APHostEnt<>nil);
          FMX.Types.Log.d('OrangeUI IsSupportIPV6Host_IOS IsIPV6 '+BoolToStr(Result));
        except
          //但是在IPV4切换到IPV6,程序没有退出的时候,会报错
        end;
      end;

      {$ENDIF}
    end;

    //修复URL支持IPV6
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


        //获取出服务器
        HostBeginIndex:=Pos('//',Url);
        if HostBeginIndex<=0 then
        begin
          HostBeginIndex:=0;
        end
        else
        begin
          HostBeginIndex:=HostBeginIndex+2;
        end;


        //去掉端口
        HostEndIndex:=PosEx(':',Url,HostBeginIndex+2);
        if HostEndIndex<=0 then
        begin
          HostEndIndex:=Length(Url);

          //去掉后缀
          HostEndIndex:=PosEx('/',Url,HostBeginIndex+2);
          if HostEndIndex<=0 then
          begin
            HostEndIndex:=Length(Url);
          end;

        end;





        //去掉用户名密码
        //'apis:35337f1232b9b5c92996e059174ef735@jg.czfood360.cn'
        HostBeginIndex2:=PosEx('@',Url,HostBeginIndex);
        if (HostBeginIndex2>0) and (HostBeginIndex2<HostEndIndex) then
        begin
          HostBeginIndex:=HostBeginIndex2+1;
        end;



        Host:=Copy(Url,HostBeginIndex,HostEndIndex-HostBeginIndex);

        FMX.Types.Log.d('OrangeUI FixSupportIPV6URL Host：'+Host);
    //    //IPV4地址为::192.168.0.199
    //    if inet_addr(MarshaledAString(TEncoding.UTF8.GetBytes(Host)))<>-1 then
    //    begin
    //      Host:='::'+Host;
    //    end;

        if IsSupportIPV6Host_IOS(Host) then
        begin
          //如果当前网络环境是IPV6,
          //那么给链接加上[]
          Result:=Copy(Url,0,HostBeginIndex-1)
                  +'['
                  +Host
                  +']'
                  +Copy(Url,HostEndIndex,MaxInt);


          FMX.Types.Log.d('OrangeUI FixSupportIPV6URL Result：'+Result);
        end;

      end;
      {$ENDIF}
    end;
{$ENDIF}




function _IntToHex(Value: Integer; Digits: Integer): String;
begin
  Result := SysUtils.IntToHex(Value, Digits);
end;

function XDigit(Ch : Char) : Integer;
begin
  if (Ch >= '0') and (Ch <= '9') then
      Result := Ord(Ch) - Ord('0')
  else
      Result := (Ord(Ch) and 15) + 9;
end;


function IsXDigit(Ch : Char) : Boolean;
begin
  Result := ((Ch >= '0') and (Ch <= '9')) or
            ((Ch >= 'a') and (Ch <= 'f')) or
            ((Ch >= 'A') and (Ch <= 'F'));
end;

function htoin(Value : PChar; Len : Integer) : Integer;
var
  I : Integer;
begin
  Result := 0;
  I      := 0;
  while (I < Len) and (Value[I] = ' ') do
      I := I + 1;
  while (I < len) and (IsXDigit(Value[I])) do begin
      Result := Result * 16 + XDigit(Value[I]);
      I := I + 1;
  end;
end;

function htoi2(Value : PChar) : Integer;
begin
  Result := htoin(Value, 2);
end;

function FuncUrlEncode(const S : String) : String;
var
  I : Integer;
  Ch : Char;
begin
  Result := '';
  for I := 1 to Length(S) do begin
      Ch := S[I];
      if ((Ch >= '0') and (Ch <= '9')) or
         ((Ch >= 'a') and (Ch <= 'z')) or
         ((Ch >= 'A') and (Ch <= 'Z')) or
         (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')then
          Result := Result + Ch
      else
          Result := Result + '%' + _IntToHex(Ord(Ch), 2);
  end;
end;

function FuncUrlEncodeUTF8(const S : UTF8String) : String;
var
  I : Integer;
  Ch : AnsiChar;
begin
  Result := '';
  for I := 1 to Length(S) do begin
      Ch := S[I];
      if ((Ch >= '0') and (Ch <= '9')) or
         ((Ch >= 'a') and (Ch <= 'z')) or
         ((Ch >= 'A') and (Ch <= 'Z')) or
         (Ch = '.') or (Ch = '-') or (Ch = '_') or (Ch = '~')then
          Result := Result + Ch
      else
          Result := Result + '%' + _IntToHex(Ord(Ch), 2);
  end;
end;

function urlEncode(URL: string): string;
var
  URL1: string;
begin
  URL1 := FuncUrlEncode(URL);
  //URL1 := StringReplace(URL1, '+', ' ', [rfReplaceAll, rfIgnoreCase]);
  result := URL1;
end;

function UrlEncodeUTF8(URL: UTF8String): string;
var
  URL1: string;
begin
  URL1 := FuncUrlEncodeUTF8(URL);
  //URL1 := StringReplace(URL1, '+', ' ', [rfReplaceAll, rfIgnoreCase]);
  result := URL1;
end;



{$IF CompilerVersion>=30.0}
//下载图片

function DownloadImage(APicUrl:String;AResponseStream:TStream;AIsRandomUserAgent:Boolean=False):Boolean;
var
//  AHttpControl:THttpControl;
  ANetHTTPClient:TNetHTTPClient;
//  AResponseStream:TMemoryStream;
begin
  Result:=False;
  ANetHTTPClient:=TNetHTTPClient.Create(nil);
//  AResponseStream:=TMemoryStream.Create;
  try
    try
      if AIsRandomUserAgent then
      begin
        //facebook防爬,但是tiktok不能加这一段
        Randomize();
        ANetHTTPClient.CustomHeaders['user-agent']:=user_agent_list[Random(Length(user_agent_list))];
      end;
      uBaseLog.HandleException(nil,'DownloadImage 下载图片 '+APicUrl);
      ANetHTTPClient.Get(APicUrl,AResponseStream);
//      AResponseStream.SaveToFile(APicFilePath);
      Result:=True;
    except
      on E:Exception do
      begin
        uBaseLog.HandleException(E,'DownloadImage 下载图片 '+APicUrl);
      end;
    end;
  finally
    FreeAndNil(ANetHTTPClient);
//    FreeAndNil(AResponseStream);
  end;

end;

function DownloadImage(APicUrl:String;APicFilePath:String;AIsRandomUserAgent:Boolean=False):Boolean;
var
//  AHttpControl:THttpControl;
//  ANetHTTPClient:TNetHTTPClient;
  AResponseStream:TMemoryStream;
begin
  Result:=False;
//  ANetHTTPClient:=TNetHTTPClient.Create(nil);
  AResponseStream:=TMemoryStream.Create;
  try
    try
//      if AIsRandomUserAgent then
//      begin
//        //facebook防爬,但是tiktok不能加这一段
//        Randomize();
//        ANetHTTPClient.CustomHeaders['user-agent']:=user_agent_list[Random(Length(user_agent_list))];
//      end;
//
//      ANetHTTPClient.Get(APicUrl,AResponseStream);
      if not DownloadImage(APicUrl,AResponseStream,AIsRandomUserAgent) then
      begin
        Exit;
      end;
      AResponseStream.SaveToFile(APicFilePath);
      Result:=True;
    except
      on E:Exception do
      begin
        uBaseLog.HandleException(E,'DownloadImage 下载图片 '+APicUrl);
      end;
    end;
  finally
//    FreeAndNil(ANetHTTPClient);
    FreeAndNil(AResponseStream);
  end;
end;
{$IFEND}



{$IFDEF NEED_SystemHttpControl}

{ TSystemHttpControl }

constructor TSystemHttpControl.Create;
begin
  Inherited;

  FNetHTTPClient:=TNetHTTPClient.Create(nil);



  //不能这么设置
//  FNetHTTPClient.ConnectionTimeout:=30*1000;  //连接超时-三十秒
//  FNetHTTPClient.ResponseTimeout:=30*1000;    //响应超时三十秒



  //Post上传文件流的时候要设置,不然IDHttpServer接收到请求的时候会报错
  //会以为流里面的是UrlParams
  FNetHTTPClient.ContentType:='application/octet-stream; charset=utf-8';

//  FNetHTTPClient.OnReceiveData:=Self.DoNetHTTPClientReceiveData;
//  FNetHTTPClient.OnNeedClientCertificate:=DoNeedClientCertificate;
end;

destructor TSystemHttpControl.Destroy;
begin

  FreeAndNil(FNetHTTPClient);

  inherited;
end;

//procedure TSystemHttpControl.DoNeedClientCertificate(const Sender: TObject;
//  const ARequest: TURLRequest; const ACertificateList: TCertificateList;
//  var AnIndex: Integer);
//begin
//  //
//end;

//procedure TSystemHttpControl.DoNetHTTPClientReceiveData(const Sender: TObject;AContentLength, AReadCount: Int64; var Abort: Boolean);
//begin
//  if Assigned(FOnReceiveData) then
//  begin
//    FOnReceiveData(Sender,AContentLength,AReadCount,Abort);
//  end;
//end;

function TSystemHttpControl.Get(const AHttpUrl: String;AResponseStream: TStream): Boolean;
//var
//  AResponseStream1:TStringStream;
begin
    Result:=False;

//    AResponseStream1:=TStringStream.Create('',TEncoding.UTF8);
//    try
//      FNetHTTPClient.Get(AUrl,AResponseStream1);
//      //这个就是返回的数据
//      AResponseStream1.DataString;
//    finally
//      FreeAndNil(AResponseStream1);
//    end;


    try
      Self.FNetHTTPClient.Get(AHttpUrl,AResponseStream,FNetHTTPRequestHeaders);
      IsNetworkConnected:=True;
      Result:=True;


      //下载
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


      //上传
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

procedure TSystemHttpControl.SetCustomHeader(ACustomHeaderPairs:TVariantDynArray);
var
//  ANameValuePair:TNameValuePair;
  I: Integer;
begin
  SetLength(Self.FNetHTTPRequestHeaders,Length(ACustomHeaderPairs) div 2);
  for I := 0 to Length(ACustomHeaderPairs) div 2 - 1 do
  begin
    FNetHTTPRequestHeaders[I].Name:= ACustomHeaderPairs[I*2];//'Content-type';
    FNetHTTPRequestHeaders[I].Value:= ACustomHeaderPairs[I*2+1];//AContentType;//'application/json';
//    Self.FNetHTTPRequestHeaders[I]:=ANameValuePair;
  end;
end;

{$ENDIF}

function GetCustomHeader(ACustomHeaderPairs:TStringList):TNetHeaders;overload;
var
//  ANameValuePair:TNameValuePair;
  I: Integer;
begin
//  SetLength(Self.FNetHTTPRequestHeaders,Length(ACustomHeaderPairs) div 2);
  SetLength(Result,ACustomHeaderPairs.Count);
  for I := 0 to ACustomHeaderPairs.Count-1 do
  begin
    Result[I].Name:= ACustomHeaderPairs.Names[I];//'Content-type';
    Result[I].Value:= ACustomHeaderPairs.Values[ACustomHeaderPairs.Names[I]];//AContentType;//'application/json';
//    Result[I]:=ANameValuePair;
  end;
end;

function GetCustomHeader(ACustomHeaderPairs:TVariantDynArray):TNetHeaders;
var
//  ANameValuePair:TNameValuePair;
  I: Integer;
begin
//  SetLength(Self.FNetHTTPRequestHeaders,Length(ACustomHeaderPairs) div 2);
  SetLength(Result,Length(ACustomHeaderPairs) div 2);
  for I := 0 to Length(ACustomHeaderPairs) div 2 - 1 do
  begin
    Result[I].Name:= ACustomHeaderPairs[I*2];//'Content-type';
    Result[I].Value:= ACustomHeaderPairs[I*2+1];//AContentType;//'application/json';
//    Result[I]:=ANameValuePair;
  end;
end;


{ THttpControl }

constructor THttpControl.Create;
begin

end;

destructor THttpControl.Destroy;
begin

  inherited;
end;



function ParseUrlQueryParameters(URL:String;HasWWW:Boolean):TQueryParameters;
var
  I: Integer;
  AName,AValue:String;
  AEqualCharIndex:Integer;
  AParamStrList:TStringList;
  AParametersString:String;
  AParametersStringStartIndex:Integer;
begin
  Result:=TQueryParameters.Create;
  if HasWWW then
  begin
    //解析出参数列表字符串
    AParametersStringStartIndex:=Pos('?',URL);
    AParametersString:=Copy(URL,AParametersStringStartIndex+1,MaxInt);
  end
  else
  begin
    AParametersString:=URL;
  end;

  if AParametersString<>'' then
  begin
    //找到参数列表字符串
    AParamStrList:=TStringList.Create;
    Try
      AParamStrList.Delimiter:='&';
      AParamStrList.DelimitedText:=AParametersString;
      for I := 0 to AParamStrList.Count-1 do
      begin
        if (AParamStrList[I]<>'') then
        begin
          AEqualCharIndex:=Pos('=',AParamStrList[I]);
          if AEqualCharIndex>0 then
          begin
            AName:=Copy(AParamStrList[I],1,AEqualCharIndex-1);
            AValue:=Copy(AParamStrList[I],AEqualCharIndex+1,Length(AParamStrList[I])-AEqualCharIndex);
            Result.AddQueryParameter(AName,AValue);
          end;
        end;
      end;
    Finally
      AParamStrList.Free;
    End;
  end;

end;

function GetUrlParamValue(AURL:String;AParamName:String;HasWWW:Boolean=True):String;
var
  AQueryParameter:TQueryParameter;
  AQueryParameters:TQueryParameters;
begin
  Result:='';
  AQueryParameters:=ParseUrlQueryParameters(AURL);
  try
    AQueryParameter:=AQueryParameters.FindItemByName(AParamName);
    if AQueryParameter<>nil then
    begin
      Result:=AQueryParameter.Value;
    end;
  finally
    FreeAndNil(AQueryParameters);
  end;

end;


{ TQueryParameter }

constructor TQueryParameter.Create(const AName:String;const AValue:Variant);
begin
  FName:=AName;
  FValue:=AValue;
end;

destructor TQueryParameter.Destroy;
begin
  inherited;
end;

{ TQueryParameters }

function TQueryParameters.GetUtf8UrlEncodeQueryParamsStr: String;
var
  I:Integer;
  ValueStr:String;
begin
  Result:='';
  for I := 0 to Count-1 do
  begin
    ValueStr:=Items[I].Value;
    if ValueStr<>'' then
    begin
      Result:=Result+Items[I].Name+'='+URLEncodeUTF8(UTF8Encode(ValueStr));
      if I<Count-1 then
      begin
        Result:=Result+'&';
      end;
    end;
  end;
end;

function TQueryParameters.GetUtf8UrlEncodeQueryParamsStr1: String;
var
  I:Integer;
  ValueStr:String;
begin
  Result:='';
  for I := 0 to Count-1 do
  begin
    ValueStr:=Items[I].Value;
    if ValueStr<>'' then
    begin
      Result:=Result+Items[I].Name+'%3D'+URLEncode(URLEncodeUTF8(UTF8Encode(ValueStr)));
      if I<Count-1 then
      begin
        Result:=Result+'%26';
      end;
    end;
  end;
end;

procedure TQueryParameters.AddQueryParameter(const AName: String;const AValue: Variant);
begin
  Self.Add(TQueryParameter.Create(AName,AValue));
end;

function TQueryParameters.FindItemByName(AName: String): TQueryParameter;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Self.Count - 1 do
  begin
    if Items[I].Name=AName then
    begin
      Result:=Items[I];
      Break;
    end;
  end;
end;

function TQueryParameters.GetItem(Index: Integer): TQueryParameter;
begin
  Result:=TQueryParameter(Inherited Items[Index]);
end;

function TQueryParameters.GetSignQueryParamsStr: String;
var
  I:Integer;
  ValueStr:String;
begin
  Result:='';
  for I := 0 to Count-1 do
  begin
    ValueStr:=Items[I].Value;
    //if ValueStr<>'' then
    begin
      Result:=Result+Items[I].Name+ValueStr;
    end;
  end;
end;

function SortByName_Compare(Item1, Item2: Pointer): Integer;
var
  Param1,Param2:TQueryParameter;
begin
  Param1:=TQueryParameter(Item1);
  Param2:=TQueryParameter(Item2);
  if Param1.FName>Param2.FName then
  begin
    Result:=1;
  end
  else if Param1.FName<Param2.FName then
  begin
    Result:=-1;
  end
  else
  begin
    Result:=0;
  end;
end;

procedure TQueryParameters.Sort;
begin
  FItems.Sort(SortByName_Compare);
end;



initialization
  IsNetworkConnected:=True;
  {$IFDEF NEED_SystemHttpControl}
  GlobalSystemHttpControlClass:=TSystemHttpControl;
  {$ENDIF}


end.






