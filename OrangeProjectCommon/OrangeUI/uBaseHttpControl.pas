//convert pas to utf8 by ¥
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
  SysUtils;




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



//
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
//  //条件
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
//                        //可以为nil
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
//    //2、登录
//    //APP到电脑
//    //[
//    //  {"HotelID":"分店号","Action":"Login","AccountID":"工号","PassWord":"密码"}
//    //]
//    //
//    //电脑到APP
//    //[
//    //  {"Action":"Login","Flag":"4"},
//    //  {
//    //	 权限参数,隐藏功能按钮
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
//        //调用成功
//
//        //保存成临时文件,用来查日志
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
//          Result:=AResponseStream.DataString;//列名 'SvrHandID' 无效。
//        except
//          on E:Exception do
//          begin
//            //编码不能识别,需要特殊处理一下
//            Result:='';
//          end;
//        end;
//
//        //服务不可用
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
//        //调用失败
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
//        //调用成功
//
//
//
////        //保存成临时文件,用来查日志
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
//        //服务不可用
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
//      //调用失败
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
//  //在外面初始好了,不用再在里面初始了
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
//          //接口返回成功
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
//      ADesc:=API+Trans('接口调用失败'+AHttpResponse);
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
////    uBaseLog.OutputDebugString('SimpleGet'+' '+AInterfaceUrl+API+' '+'end'+' '+'耗时'+IntToStr(DateUtils.SecondsBetween(ABefore,Now)));
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
////    uBaseLog.OutputDebugString('SimpleGet'+' '+AInterfaceUrl+API+' '+'end'+' '+'耗时'+IntToStr(DateUtils.SecondsBetween(ABefore,Now)));
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
//  //复制参数名数组
//  SetLength(ACallAPITaskItem.UrlParamNames,Length(AUrlParamNames));
//  for I := 0 to Length(AUrlParamNames)-1 do
//  begin
//    ACallAPITaskItem.UrlParamNames[I]:=AUrlParamNames[I];
//  end;
//
//  //复制参数值数组
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
//  //出错
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
//      //异常
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


end.






