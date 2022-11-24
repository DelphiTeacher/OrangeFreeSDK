unit uGPSLocation;

interface


//默认使用百度路线规划

//{$IFDEF MSWINDOWS}
//  //Windows下使用谷歌路线规划
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}

//{$IFDEF ANDROID}
//  //Android下使用谷歌路线规划
//  {$DEFINE USE_GOOGLE_ROUTE_PLAN}
//{$ENDIF}





//使用DELPHI自带的LocationSensor控件定位(IOS),不需要用到三方SDK,使用简单
//但是在Android下面比较慢,所以一般不建议在Android下使用
 {$DEFINE USE_LOCATIONSENSOR}



//{$IFDEF IOS}
//  {$DEFINE USE_LOCATIONSENSOR}
//{$ENDIF}



//使用百度定位(Android)
//在Android下面定位比较快
//{$DEFINE USE_BAIDULOCATION}





////使用INI(Android服务定位保存在本地的结果)
/// 百度定位SDK放在服务端中运行,把定位的结果保存在INI,APP端通过这个INI去读取
//{$DEFINE USE_INI_LOCATION}
//{$IFDEF MSWINDOWS}
//  {$DEFINE USE_INI_LOCATION}
//{$ENDIF}




//当前是Android服务
/// 百度定位SDK放在服务端中运行,把定位的结果保存在INI
//{$DEFINE IN_ANDROIDSERVICE}



uses
  Classes,
  System.StrUtils,
  System.Types,
  IniFiles,

  XSuperObject,
  XSuperJson,

//  uAppCommon,
  uBaseLog,
//  uAndroidLog,
  uGPSUtils,
  DateUtils,
  uMapCommon,
  uBaseList,
  FMX.Types,

  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,



  {$IFDEF ANDROID}
    Androidapi.Helpers,
    Androidapi.JNIBridge,
    Androidapi.JNI.JavaTypes,
    Androidapi.JNI.Net,
    Androidapi.JNI.GraphicsContentViewText,
    Androidapi.JNI.Os,
    Androidapi.JNI.App,
    System.Generics.Collections,
    System.Messaging,


    {$IFNDEF IN_ANDROIDSERVICE}
    //Android服务中不能使用这个文件,不然会卡死
    FMX.Helpers.Android,
    {$ENDIF}

    {$IF RTLVersion=32}// 10.2  TJManifest_permission
    uOpenCommon,
    uAndroidPermission_D10_2,
    {$ENDIF}

    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}

  {$ENDIF}


  {$IFDEF USE_INI_LOCATION}
  FMX.Types,
  {$ENDIF}



  {$IFDEF USE_BAIDULOCATION}
  FlyUtils.Android.PostRunnableAndTimer,
  com.baidu.location.LocationClient,
  com.baidu.location.LocationClientOption,
  baidu.locTest.Location,
  {$ENDIF}



  System.Sensors,
  {$IFDEF USE_LOCATIONSENSOR}
    {$IFDEF IOS}
    System.iOS.Sensors,
    {$ENDIF}
    System.Sensors.Components,
  {$ENDIF USE_LOCATIONSENSOR}



//  FMX.AddressBook.Types,
  FMX.Dialogs,

  SysUtils;




type

  //定位模式
  TLocationMode=(
                //高精度
                lmGPSAndNetwork,
                //低功耗
                lmNetwork,
                //仅设备
                lmGPS
                );



  TGPSLocation=class;





  {$IFDEF ANDROID}
  {$IF RTLVersion=32}
// ===== Interface declarations =====

  JContextCompatClass = interface(JObjectClass)
    ['{17CBF90F-B907-448F-9BFE-07ABAD5919D0}']
    {class} function checkSelfPermission(context: JContext; permission: JString): Integer; cdecl;
    {class} function createDeviceProtectedStorageContext(context: JContext): JContext; cdecl;
    {class} function getCodeCacheDir(context: JContext): JFile; cdecl;
    {class} function getColor(context: JContext; id: Integer): Integer; cdecl;
    {class} function getColorStateList(context: JContext; id: Integer): JColorStateList; cdecl;
    {class} function getDataDir(context: JContext): JFile; cdecl;
    {class} function getDrawable(context: JContext; id: Integer): JDrawable; cdecl;
    {class} function getExternalCacheDirs(context: JContext): TJavaObjectArray<JFile>; cdecl;
    {class} function getExternalFilesDirs(context: JContext; type_: JString): TJavaObjectArray<JFile>; cdecl;
    {class} function getNoBackupFilesDir(context: JContext): JFile; cdecl;
    {class} function getObbDirs(context: JContext): TJavaObjectArray<JFile>; cdecl;
    {class} function isDeviceProtectedStorage(context: JContext): Boolean; cdecl;
    {class} function startActivities(context: JContext; intents: TJavaObjectArray<JIntent>): Boolean; cdecl; overload;
    {class} function startActivities(context: JContext; intents: TJavaObjectArray<JIntent>; options: JBundle): Boolean; cdecl; overload;
    {class} procedure startActivity(context: JContext; intent: JIntent; options: JBundle); cdecl;
    {class} procedure startForegroundService(context: JContext; intent: JIntent); cdecl;
  end;

  [JavaSignature('android/support/v4/content/ContextCompat')]
  JContextCompat = interface(JObject)
    ['{DA319CC4-B7F8-4702-B969-3137BE6260C9}']
  end;
  TJContextCompat = class(TJavaGenericImport<JContextCompatClass, JContextCompat>) end;




  JActivityCompatClass = interface(JContextCompatClass)
    ['{AF83EB83-0A07-45E4-A615-3E9F50EEC123}']
    {class} procedure finishAffinity(activity: JActivity); cdecl;
    {class} procedure finishAfterTransition(activity: JActivity); cdecl;
    {class} function getReferrer(activity: JActivity): Jnet_Uri; cdecl;
    {class} function invalidateOptionsMenu(activity: JActivity): Boolean; cdecl;
    {class} procedure postponeEnterTransition(activity: JActivity); cdecl;
    {class} procedure requestPermissions(activity: JActivity; permissions: TJavaObjectArray<JString>; requestCode: Integer); cdecl;
//    {class} procedure setEnterSharedElementCallback(activity: JActivity; callback: Japp_SharedElementCallback); cdecl;
//    {class} procedure setExitSharedElementCallback(activity: JActivity; callback: Japp_SharedElementCallback); cdecl;
    {class} function shouldShowRequestPermissionRationale(activity: JActivity; permission: JString): Boolean; cdecl;
    {class} procedure startActivityForResult(activity: JActivity; intent: JIntent; requestCode: Integer; options: JBundle); cdecl;
    {class} procedure startIntentSenderForResult(activity: JActivity; intent: JIntentSender; requestCode: Integer; fillInIntent: JIntent; flagsMask: Integer; flagsValues: Integer; extraFlags: Integer; options: JBundle); cdecl;
    {class} procedure startPostponedEnterTransition(activity: JActivity); cdecl;
  end;

  [JavaSignature('android/support/v4/app/ActivityCompat')]
  JActivityCompat = interface(JContextCompat)
    ['{7108F0BF-5819-4668-9D20-7165FCB5A871}']
  end;
  TJActivityCompat = class(TJavaGenericImport<JActivityCompatClass, JActivityCompat>) end;





  TPermissionStatus = (Granted, Denied, PermanentlyDenied);
  /// <summary>Callback type for when the system has processed our permission requests</summary>
  /// <remarks>For each requested permission in APermissions, there is
  /// a Boolean in AGrantResults indicating if the permission was granted.
  /// <para>This type is compatible with an event handler method.</para></remarks>
  TRequestPermissionsResultEvent = procedure(Sender: TObject; const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>) of object;
  /// <summary>Callback type for when the system has processed our permission requests</summary>
  /// <remarks>For each requested permission in APermissions, there is
  /// a Boolean in AGrantResults indicating if the permission was granted.
  /// <para>This type is compatible with an anonymous procedure.</para></remarks>
  TRequestPermissionsResultProc = reference to procedure(const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>);

  TDisplayRationaleEvent = procedure(Sender: TObject; const APermissions: TArray<string>; const APostRationaleProc: TProc) of object;
  TDisplayRationaleProc = reference to procedure(const APermissions: TArray<string>; const APostRationaleProc: TProc);


  TRequestPermissionsCallbackPair = Class
    RequestCode:Integer;
    Permissions: TArray<string>;
    Proc: TRequestPermissionsResultProc;
    Event: TRequestPermissionsResultEvent;
    constructor Create(const ARequestCode:Integer;
                        const APermissions: TArray<string>;
                        const AProc: TRequestPermissionsResultProc;
                        const AEvent: TRequestPermissionsResultEvent);
  end;
  TRequestPermissionsCallbackPairList=class(TBaseList)
  private
    function GetItem(Index: Integer): TRequestPermissionsCallbackPair;
  public
    property Items[Index:Integer]:TRequestPermissionsCallbackPair read GetItem;default;
  end;

  TDisplayRationaleCallbackPair = Class
    RequestCode:Integer;
    Permissions: TArray<string>;
    Proc: TDisplayRationaleProc;
    Event: TDisplayRationaleEvent;
    constructor Create(const ARequestCode:Integer;
                      const APermissions: TArray<string>;
                      const AProc: TDisplayRationaleProc;
                      const AEvent: TDisplayRationaleEvent);
  end;
  TDisplayRationaleCallbackPairList=class(TBaseList)
  private
    function GetItem(Index: Integer): TDisplayRationaleCallbackPair;
  public
    property Items[Index:Integer]:TDisplayRationaleCallbackPair read GetItem;default;
  end;


  TAndroidPermissionsService = class//(TPermissionsService)
  private
    FPermissionsRequestsAndCallbacks: TRequestPermissionsCallbackPairList;//TDictionary<Integer, TRequestPermissionsCallbackPair>;

    procedure DoRequestPermissions(const APermissions: TArray<string>; const ARequestCode: Integer);
    procedure DoRequestPermissionsCallback(const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair; const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>);

    procedure InternalRequestPermissions(const APermissions: TArray<string>;
      const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
      const ADisplayRationaleCallbackPair: TDisplayRationaleCallbackPair
      );
    function CheckRequestPermissions(const ARequestCode: Integer;const APermissions: TArray<string>):Boolean;

    /// <summary>RTL messaging system listener</summary>
//    procedure HandlePermissionsRequest(const Sender: TObject; const AMessage: TMessage);
    /// <summary>Delphi representation of the Android onRequestPermissionsResult callback</summary>
    function OnPermissionsRequest(const ARequestCode: Integer; const APermissions: TJavaObjectArray<JString>;
      const AGrantResults: TJavaArray<Integer>):Boolean;

    /// <summary>Helper routine to get a unique request code</summary>
    function NextAvailableRequestCode: Integer;
  private
    //用定时器检测权限是否已经开启了
    FCheckTimer:TTimer;
    procedure DoCheckTimer(Sender:TObject);
  public
    constructor Create;
    destructor Destroy; override;
  public
    function IsPermissionGranted(const APermission: string): Boolean;
    function IsEveryPermissionGranted(const APermissions: TArray<string>): Boolean;

    procedure RequestPermissions(const APermissions: TArray<string>;
      const AOnRequestPermissionsResult: TRequestPermissionsResultEvent;
      AOnDisplayRationale: TDisplayRationaleEvent = nil);
      overload; //override;
    procedure RequestPermissions(const APermissions: TArray<string>;
      const AOnRequestPermissionsResult: TRequestPermissionsResultProc;
      AOnDisplayRationale: TDisplayRationaleProc = nil);
      overload; //override;
  end;

  {$IFEND}
  {$ENDIF}





//  //根据Location刷新Addr(使用百度接口)
//  TAutoSyncAddrThread=class(TThread)
//  private
//    FGPSLocation:TGPSLocation;
//  protected
//    procedure Execute;override;
//  public
//    Constructor Create(CreateSuspended: Boolean;
//                        AGPSLocation:TGPSLocation);
//  end;




  //获取定位
  TGPSLocation=class(TComponent)
  private
    //定位模式,仅在百度定位下才使用
    FMode: TLocationMode;
    //百度定位-扫描间隔
    FScanSpan: Integer;



//    //定位返回的GPS经纬度的类型
//    FGPSType: TGPSType;


    //设置定位超时时间(毫秒)
    LocationTimeout:Integer;
    //设置地址解析超时时间(毫秒)
    GeocodeAddrTimeout:Integer;



//    //自动更新地址的线程
//    //Android平台下直接使用百度定位返回的地址
//    //那IOS,Windows平台下则需要此线程
//    FAutoSyncAddrThread:TAutoSyncAddrThread;



//    {$IFDEF USE_INI_LOCATION}
//    //上次记录到文件的时间
//    LastRecordToFileTime:String;
//    {$ENDIF USE_INI_LOCATION}


    FOnAddrChange: TNotifyEvent;
    FOnLocationChange: TNotifyEvent;
    FOnLocationTimeout: TNotifyEvent;
    FOnStartError: TNotifyEvent;

    FOnGeocodeAddrTimeout: TNotifyEvent;
    FOnGeocodeAddrError: TNotifyEvent;

    FPermissionStatus:TAuthorizationType;

    function GetLatitude: Double;
    function GetLongitude: Double;
    procedure SetLatitude(const Value: Double);
    procedure SetLongitude(const Value: Double);
    function GetGPSType: TGPSType;
    procedure SetGPSType(const Value: TGPSType);
  public
    //是否需要调用API获取Addr
    LocationChanged:Boolean;

    Location:TLocation;

    //扫描到的经纬度
    property Longitude:Double read GetLongitude write SetLongitude;
    property Latitude:Double read GetLatitude write SetLatitude;
  public
    //获取到的详细地址信息
    //"country":"中国","country_code":0,"country_code_iso":"CHN",
    //"country_code_iso2":"CN","province":"浙江省","city":"金华市",
    //"city_level":2,"district":"婺城区","town":"","adcode":"330702",
    //"street":"丹溪路","street_number":"1133号","direction":"附近",
    //"distance":"13"
    //国家
    Country:String;
    //省
    Province:String;
    //市
    City:String;
    //区
    District:String;
    //镇
    Town:String;
    //短地址,比如丹溪路1171号,比如龙腾创业大厦
    RegionName:String;
    //长地址,比如浙江省金华市婺城区丹溪路1171号
    Addr:String;

    //什么路
    Route:String;
    //邮编
    PostCode:String;

    //反向地址解析
    FGeocoder: TGeocoder;
    procedure DoGeocodeReverseEvent(const Address: TCivicAddress);


//  public
//    //读取INI
//    {$IFDEF USE_INI_LOCATION}
//    FReadIniTimer:TTimer;
//    procedure DoReadIniTimer(Sender:TObject);
//    {$ENDIF}
  public
    //使用百度定位
    {$IFDEF USE_BAIDULOCATION}
    mBaiduLocationApp: TBaiduLocationApp;
    mLocClient: JBDLocationClient;
    {$ENDIF}
  public
    //使用LocationSensor
    {$IFDEF USE_LOCATIONSENSOR}
    FLocationSensor: TLocationSensor;
    procedure DoLocationSensor1LocationChanged(Sender: TObject;const OldLocation, NewLocation: TLocationCoord2D);
    {$ENDIF}
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy;override;
  public
    //定位的状态//
    //状态-定位是否已经启动了
    IsStartedLocation:Boolean;
    //状态-是否启动失败了
    IsStartError:Boolean;
    //状态-定位启动之后定位到了经纬度
    HasLocatedAfterStart:Boolean;

    //状态-定位是否已经超时了
    IsLocationTimeout:Boolean;


  public

    //状态-解析是否已经启动了
    IsStartedGeocodeAddr:Boolean;
    //状态-是否地址解析超时
    IsGeocodeAddrTimeout:Boolean;
    //状态-是否地址解析失败
    IsGeocodeAddrError:Boolean;
    //状态-启动定位之后是否解析了地址
    HasGeocodedAfterStart:Boolean;


    //接收到定位
    procedure DoReceiveLocation(ALongitude:Double;
                                ALatitude:Double);
    //接收到地址
    procedure DoReceiveAddr(AAddr:String;
                            ACountry:String;
                            AProvince:String;
                            ACity:String;
                            ADistrict:String;
                            ATown:String;
                            AShortAddr:String);

//  public
//    {$IFDEF USE_INI_LOCATION}
    procedure LoadFromIni(AIniFilePath:String);overload;
    procedure CustomLoadFromIni(AIniFile:TIniFile);overload;
//    procedure LoadFromJson(AFilePath:String);
//    {$ENDIF USE_INI_LOCATION}
  public
    procedure SaveToIni(AIniFilePath:String);overload;
    procedure CustomSaveToIni(AIniFile:TIniFile);overload;
//    procedure SaveToJson(AFilePath:String);
  public
    procedure AssignTo(AMapAnnotation:TMapAnnotation);

    //清除数据和状态
    procedure Clear;

    //设置定位参数
    procedure SetLocationOption;
    //开始定位
    function StartLocation:Boolean;
    function DoStartLocation:Boolean;
    //结束定位
    procedure StopLocation;

    //是否得到定位
    function HasLocated:Boolean;

    //解析成为地址
    function GeocodeAddr:Boolean;


    function GetPermissionStatus:TAuthorizationType;
  published
    //百度定位下使用
    //扫描间隔(毫秒)
    property ScanSpan:Integer read FScanSpan write FScanSpan;
    //定位模式-精度
    property Mode:TLocationMode read FMode write FMode;
  published
    //GPS经纬度的类型
    property GPSType:TGPSType read GetGPSType write SetGPSType;

    //定位启动失败的事件
    property OnStartError:TNotifyEvent read FOnStartError write FOnStartError;
    //坐标更改事件(在线程中运行的)
    property OnLocationChange:TNotifyEvent read FOnLocationChange write FOnLocationChange;
    //定位超时事件
    property OnLocationTimeout:TNotifyEvent read FOnLocationTimeout write FOnLocationTimeout;


    //地址更改事件(在线程中运行的)
    property OnAddrChange:TNotifyEvent read FOnAddrChange write FOnAddrChange;
    //地址解析失败
    property OnGeocodeAddrError:TNotifyEvent read FOnGeocodeAddrError write FOnGeocodeAddrError;
    //地址解析超时
    property OnGeocodeAddrTimeout:TNotifyEvent read FOnGeocodeAddrTimeout write FOnGeocodeAddrTimeout;
  end;




var
  GPSTypeNames:Array[TGPSType] of String;



  GlobalGPSLocation:TGPSLocation;



  {$IFDEF ANDROID}
  {$IF RTLVersion=32}
  PermissionsService:TAndroidPermissionsService;
  StartingRequestCode :Integer;//= 10000;
  {$IFEND}
  {$ENDIF}


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('FireCat',[TGPSLocation])
end;


{ TGPSLocation }

procedure TGPSLocation.Clear;
begin
  Location.Longitude:=0;
  Location.Latitude:=0;
  Country:='';
  Province:='';
  City:='';
  District:='';
  Town:='';
  Addr:='';
  RegionName:='';

  LocationChanged:=False;


  //定位是否已经启动了
  IsStartedLocation:=False;
  HasLocatedAfterStart:=False;

  //定位是否已经超时了
  IsLocationTimeout:=False;
  //是否启动失败了
  IsStartError:=False;





  IsStartedGeocodeAddr:=False;
  //是否地址解析失败
  IsGeocodeAddrTimeout:=False;
  IsGeocodeAddrError:=False;
  HasGeocodedAfterStart:=False;


end;

constructor TGPSLocation.Create(AOwner:TComponent);
begin
  Inherited;

  //定位超时15秒
  LocationTimeout:=60*1000;
  //将GPS坐标解析为地址,超时15秒
  GeocodeAddrTimeout:=15*1000;



//  {$IFDEF USE_INI_LOCATION}
//  //读取INI的定时器
//  FReadIniTimer:=TTimer.Create(nil);
//  FReadIniTimer.OnTimer:=Self.DoReadIniTimer;
//  FReadIniTimer.Interval:=3000;
//  FReadIniTimer.Enabled:=False;
//  {$ENDIF}



  {$IFDEF USE_BAIDULOCATION}
  //使用百度定位
  mLocClient := nil;
  mBaiduLocationApp := nil;
  {$ENDIF}




  //百度定位-地址扫描时间间隔
  FScanSpan:=5000;

//  IsNeedGeocodeAddr:=True;


  Location.Longitude:=0;
  Location.Latitude:=0;



  //Windows下测试
  //119.649502,29.076664
  {$IFDEF MSWINDOWS}
  Location.Longitude:=119.649502;
  Location.Latitude:=29.076664;
  Country:='中国';
  Province:='浙江省';
  City:='金华市';
  District:='婺城区';
  Town:='';
  Addr:='浙江省金华市婺城区丹溪路1133号';
  RegionName:='龙腾创业大厦826室';
  LocationChanged:=True;
//  SaveToIni(GetApplicationPath+'Location.ini');
//  SaveToJson(GetApplicationPath+'Location.json');
  {$ENDIF}




  //IOS模拟器下测试
  {$IFDEF IOS}
  {$IFDEF CPUX86}
  Longitude:=119.649502;
  Latitude:=29.076664;
  Country:='中国';
  Province:='浙江省';
  City:='金华市';
  District:='婺城区';
  Town:='';
  Addr:='浙江省金华市婺城区丹溪路1133号';
  RegionName:='龙腾创业大厦826室';
  LocationChanged:=True;
//  SaveToIni(GetApplicationPath+'Location.ini');
//  SaveToJson(GetApplicationPath+'Location.json');
  {$ENDIF}
  {$ENDIF}



//  //自动更新地址的线程
//  //Android平台下直接使用百度定位返回的地址
//  //那IOS,Windows平台下则需要此线程
//  FAutoSyncAddrThread:=TAutoSyncAddrThread.Create(False,Self);


end;

destructor TGPSLocation.Destroy;
begin
  {$IFDEF USE_BAIDULOCATION}
  if Assigned(mLocClient) then
  begin
    mLocClient.stop;
  end;
  FreeAndNil(mBaiduLocationApp);
  {$ENDIF}


  {$IFDEF USE_LOCATIONSENSOR}
  FreeAndNil(FLocationSensor);
  {$ENDIF}



//  {$IFDEF USE_INI_LOCATION}
//  FreeAndNil(FReadIniTimer);
//  {$ENDIF}



//  FAutoSyncAddrThread.Terminate;
//  FAutoSyncAddrThread.WaitFor;
//  FreeAndNil(FAutoSyncAddrThread);

  inherited;
end;

procedure TGPSLocation.DoReceiveAddr(AAddr:String;
                                      ACountry:String;
                                      AProvince:String;
                                      ACity:String;
                                      ADistrict:String;
                                      ATown:String;
                                      AShortAddr:String);
begin
  HandleException(nil,'TGPSLocation.DoReceiveAddr Begin');

  //获取到了地址
  HasGeocodedAfterStart:=True;



  Addr:=AAddr;
  Country:=ACountry;
  Province:=AProvince;
  City:=ACity;
  District:=ADistrict;
  Town:=ATown;
  RegionName:=AShortAddr;

//  SaveToIni(GetApplicationPath+'Location.ini');
//  SaveToJson(GetApplicationPath+'Location.json');


  if Assigned(OnAddrChange) then
  begin
    OnAddrChange(Self);
  end;

  HandleException(nil,'TGPSLocation.DoReceiveAddr End');
end;

procedure TGPSLocation.DoReceiveLocation(ALongitude, ALatitude: Double);
begin
  HandleException(nil,'TGPSLocation.DoReceiveLocation Begin '
                      +FloatToStr(ALongitude)+','
                      +FloatToStr(ALatitude));

  //排除脏数据
  if ALongitude>0.1 then
  begin


      //定位到了
      HasLocatedAfterStart:=True;


      //定位到了
      LocationChanged:=True;

      Longitude:=ALongitude;
      Latitude:=ALatitude;

//      SaveToIni(GetApplicationPath+'Location.ini');
//      SaveToJson(GetApplicationPath+'Location.json');


      if Assigned(OnLocationChange) then
      begin
        OnLocationChange(Self);
      end;
  end;

  HandleException(nil,'TGPSLocation.DoReceiveLocation End ');
end;


function TGPSLocation.GetPermissionStatus:TAuthorizationType;
begin
  Result:=TAuthorizationType.atNotSpecified;

  //低版本的API等级是不需要权限的
//  TAuthorizationType = (atNotSpecified, atUnauthorized, atAuthorized);


  {$IFDEF USE_LOCATIONSENSOR}
        {$IFDEF IOS}
        if (FLocationSensor<>nil) then
        begin
            //需要Active为True,不然Sensor为nil
            try
                FLocationSensor.Active:=True;

                if (FLocationSensor.Sensor<>nil) then
                begin
                  Result:=FLocationSensor.Sensor.Authorized;
                end
                else
                begin
                  ShowMessage('FLocationSensor.Sensor nil');
                end;
            except
              on E:Exception do
              begin
                HandleException(E,'TGPSLocation.GetPermissionStatus End ');
                //异常的话表示没有授权
                Result:=TAuthorizationType.atUnauthorized;
              end;
            end;
        end
        else
        begin
            ShowMessage('FLocationSensor nil');
        end;
        {$ENDIF}

        {$IFDEF ANDROID}
        Result:=FPermissionStatus;
        {$ENDIF}
  {$ENDIF}



end;


function TGPSLocation.GeocodeAddr: Boolean;
var
  ALocationCoord2D:TLocationCoord2D;
begin
  Result:=False;


  if Self.HasLocated then
  begin

      IsStartedGeocodeAddr:=True;
      IsGeocodeAddrTimeout:=False;
      IsGeocodeAddrError:=False;
      HasGeocodedAfterStart:=False;



//      {$IFDEF MSWINDOWS}
          //Windows
          TThread.CreateAnonymousThread(procedure
          begin
              HandleException(nil,'TGPSLocation.GeocodeAddr GetGeocoder Begin');
              if GetGeocoder(Location,Addr,Country,Province,City,District,Route,RegionName,PostCode) then
              begin
                DoReceiveAddr(Addr,Country,Province,City,District,Town,RegionName);
              end
              else
              begin
                HandleException(nil,'TGPSLocation.GeocodeAddr GetGeocoder Fail');
              end;
              HandleException(nil,'TGPSLocation.GeocodeAddr GetGeocoder End');

          end).Start;
//      {$ELSE}
//          //IOS,Android
//          //使用系统自带的TGeocoder来地址解析
//          try
//              if FGeocoder=nil then
//              begin
//                  if TGeocoder.Current<>nil then
//                  begin
//                    HandleException(nil,'TGPSLocation.GeocodeAddr TGeocoder.Current<>nil');
//                    FGeocoder:=TGeocoder.Current.Create;
//                  end;
//              end;
//
//
//              if FGeocoder<>nil then
//              begin
//                  //异步
//                  FGeocoder.OnGeocodeReverse:=DoGeocodeReverseEvent;
//
//                  //解析地址
//                  if (FGeocoder<>nil) and not FGeocoder.Geocoding then
//                  begin
//                    ALocationCoord2D:=TLocationCoord2D.Create(Self.Location.ConvertToGCJ02.Latitude,
//                                                              Self.Location.ConvertToGCJ02.Longitude);
//                    HandleException(nil,'TGPSLocation.GeocodeAddr FGeocoder.GeocodeReverse Begin');
//                    FGeocoder.GeocodeReverse(ALocationCoord2D);
//                    HandleException(nil,'TGPSLocation.GeocodeAddr FGeocoder.GeocodeReverse End');
//
//                    Result:=True;
//                  end;
//
//              end;
//
//          except
//            on E:Exception do
//            begin
//              HandleException(E,'TGPSLocation.GeocodeAddr Geocoer service error');
//            end;
//          end;
//      {$ENDIF}



      //检测地址解析是否超时
      TThread.CreateAnonymousThread(procedure
      begin
          HandleException(nil,'TGPSLocation.GeocodeAddr Sleep('+IntToStr(GeocodeAddrTimeout)+') Begin');
          //等待超时时间
          Sleep(GeocodeAddrTimeout);
          HandleException(nil,'TGPSLocation.GeocodeAddr Sleep('+IntToStr(GeocodeAddrTimeout)+') End');

          //判断地址解析是否超时
          if
            //地址解析后没有获取到经纬度
            Not Self.HasGeocodedAfterStart then
          begin
              HandleException(nil,'TGPSLocation.GeocodeAddr OnLocationTimeout');
              Self.IsGeocodeAddrTimeout:=True;
              if Assigned(Self.OnGeocodeAddrTimeout) then
              begin
                Self.OnGeocodeAddrTimeout(Self);
              end;
          end;

      end).Start;


  end
  else
  begin
    HandleException(nil,'TGPSLocation.GeocodeAddr Has Not Located');
  end;

end;

procedure TGPSLocation.DoGeocodeReverseEvent(const Address: TCivicAddress);
var
  ASuperObject:ISuperObject;
  ARegionName:String;
  AAddress:String;
begin
  if Address=nil then Exit;


  ASuperObject:=TSuperObject.Create;
  ASuperObject.S['Address']:=Address.Address;
  ASuperObject.S['AdminArea']:=Address.AdminArea;
  ASuperObject.S['CountryCode']:=Address.CountryCode;
  ASuperObject.S['CountryName']:=Address.CountryName;
  ASuperObject.S['FeatureName']:=Address.FeatureName;
  ASuperObject.S['PostalCode']:=Address.PostalCode;
  ASuperObject.S['Locale']:=Address.Locale;
  ASuperObject.S['Locality']:=Address.Locality;
  ASuperObject.S['SubLocality']:=Address.SubLocality;
  ASuperObject.S['SubAdminArea']:=Address.SubAdminArea;
  ASuperObject.S['SubThoroughfare']:=Address.SubThoroughfare;
  ASuperObject.S['Thoroughfare']:=Address.Thoroughfare;


  HandleException(nil,'TGPSLocation.DoGeocodeReverseEvent '+ASuperObject.AsJson);
//IOS
//	"AdminArea": "浙江省",
//	"CountryCode": "CN",
//	"CountryName": "中国",
//	"FeatureName": "丹溪路",
//	"PostalCode": "",
//	"Locale": "",
//	"Locality": "金华市",
//	"SubLocality": "婺城区",
//	"SubAdminArea": "",
//	"Thoroughfare": "丹溪路"
//	"SubThoroughfare": "",

//Android
//	"Address": "",
//	"AdminArea": "浙江省",
//	"CountryCode": "CN",
//	"CountryName": "中国",
//	"FeatureName": "三江街道四季·和兴园",
//	"PostalCode": "",
//	"Locale": "",
//	"Locality": "金华市",
//	"SubLocality": "婺城区",
//	"SubAdminArea": "浙江省",
//	"Thoroughfare": ""
//	"SubThoroughfare": "",

//{
//	"Address": "",
//	"AdminArea": "浙江省",
//	"SubAdminArea ":"浙江省 ",
//	"CountryCode": "CN",
//	"CountryName": "中国",
//	"FeatureName": "",
//	"PostalCode": "",
//	"Locale": "",
//	"Locality": "金华市",
//	"SubLocality": "婺城区",
//	"Thoroughfare ":"东莱路 "
//	"SubThoroughfare ":"",
//}

  ARegionName:=Address.FeatureName;
  if ARegionName='' then
  begin
      {$IFDEF NZ}
      //拼起来
      ARegionName:=Address.SubThoroughfare;
      if Address.Thoroughfare<>'' then ARegionName:=ARegionName+' '+Address.Thoroughfare;
      if Address.SubLocality<>'' then ARegionName:=ARegionName+' '+Address.SubLocality;
      if Address.Locality<>'' then ARegionName:=ARegionName+' '+Address.Locality;
      {$ELSE}
      if ARegionName='' then ARegionName:=Address.SubThoroughfare;
      if ARegionName='' then ARegionName:=Address.Thoroughfare;
      if ARegionName='' then ARegionName:=Address.SubLocality;
      if ARegionName='' then ARegionName:=Address.Locality;
      {$ENDIF}
      ARegionName:=Trim(ARegionName);
  end;



  AAddress:=Address.Address;
  if AAddress='' then
  begin
      {$IFDEF NZ}
      //国外
      AAddress:=Address.SubThoroughfare;
      if Address.Thoroughfare<>'' then AAddress:=AAddress+' '+Address.Thoroughfare;
      if Address.SubLocality<>'' then AAddress:=AAddress+' '+Address.SubLocality;
      if Address.Locality<>'' then AAddress:=AAddress+' '+Address.Locality;
      if Address.AdminArea<>'' then AAddress:=AAddress+' '+Address.AdminArea;
      {$ELSE}
      //国内
      AAddress:=Address.AdminArea
                +Address.Locality
                +Address.SubLocality
                +Address.Thoroughfare
                +Address.SubThoroughfare
                ;
      {$ENDIF}
      AAddress:=Trim(AAddress);
  end;


  DoReceiveAddr(AAddress,
                Address.CountryName,    //国
                Address.AdminArea,      //省,浙江省
                Address.Locality,       //市,金华市
                Address.SubLocality,    //区,婺城区
                '',                     //镇
                ARegionName             //地址名
                );

end;

procedure TGPSLocation.AssignTo(AMapAnnotation:TMapAnnotation);
begin
  AMapAnnotation.Location:=Self.Location;

  AMapAnnotation.Country:=Self.Country;
  //省
  AMapAnnotation.Province:=Self.Province;
  //市
  AMapAnnotation.City:=Self.City;
  //区
  AMapAnnotation.Area:=Self.District;
  //镇
  AMapAnnotation.Town:=Self.Town;
  //短地址,比如丹溪路1171号,比如龙腾创业大厦
  AMapAnnotation.RegionName:=Self.RegionName;
  //长地址,比如浙江省金华市婺城区丹溪路1171号
  AMapAnnotation.Addr:=Self.Addr;
end;

function TGPSLocation.GetGPSType: TGPSType;
begin
  Result:=Location.GPSType;
end;

function TGPSLocation.GetLatitude: Double;
begin
  Result:=Location.Latitude;
end;

function TGPSLocation.GetLongitude: Double;
begin
  Result:=Location.Longitude;
end;

function TGPSLocation.HasLocated: Boolean;
begin
  Result:=False;

  if not (ABS(Longitude)<0.1)
    //北纬是正数,南纬是负数
    and not (ABS(Latitude)<0.1) then
  begin
      Result:=True;
  end;

end;

//{$IFDEF USE_INI_LOCATION}
procedure TGPSLocation.LoadFromIni(AIniFilePath: String);
var
  AIniFile:TIniFile;
//  ARecordTime:String;
begin

  if FileExists(AINIFilePath) then
  begin
    AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});

    CustomLoadFromIni(AIniFile);


//    ARecordTime:=AIniFile.ReadString('','RecordTime','');
//    if ARecordTime<>Self.LastRecordToFileTime then
//    begin
//
////      HandleException(nil,'TGPSLocation.LoadFromIni '+FloatToStr(Longitude)+','+FloatToStr(Latitude));
//
//      LastRecordToFileTime:=ARecordTime;
//      Self.LocationChanged:=True;
//
//    end;


    FreeAndNil(AIniFile);
  end;

end;

procedure TGPSLocation.CustomLoadFromIni(AIniFile:TIniFile);
begin
    Self.Longitude:=AIniFile.ReadFloat('','Longitude',0);
    Self.Latitude:=AIniFile.ReadFloat('','Latitude',0);

    Self.Country:=AIniFile.ReadString('','Country','');
    Self.Province:=AIniFile.ReadString('','Province','');
    Self.City:=AIniFile.ReadString('','City','');
    Self.District:=AIniFile.ReadString('','District','');
    Self.Town:=AIniFile.ReadString('','Town','');
    Self.RegionName:=AIniFile.ReadString('','RegionName','');
    Self.Addr:=AIniFile.ReadString('','Addr','');

end;

//procedure TGPSLocation.LoadFromJson(AFilePath: String);
//var
//  ASuperObject:ISuperObject;
//  ARecordTime:String;
//begin
//
//  if FileExists(AFilePath) then
//  begin
//    ASuperObject:=TSuperObject.ParseFile(AFilePath);
//
//
//    Self.Longitude:=ASuperObject.F['Longitude'];
//    Self.Latitude:=ASuperObject.F['Latitude'];
//
//    Self.Country:=ASuperObject.S['Country'];
//    Self.Province:=ASuperObject.S['Province'];
//    Self.City:=ASuperObject.S['City'];
//    Self.District:=ASuperObject.S['District'];
//    Self.Town:=ASuperObject.S['Town'];
//
//    Self.RegionName:=ASuperObject.S['RegionName'];
//    Self.Addr:=ASuperObject.S['Addr'];
//
//    ARecordTime:=ASuperObject.S['RecordTime'];
//    if ARecordTime<>Self.LastRecordToFileTime then
//    begin
//
////      HandleException(nil,'TGPSLocation.LoadFromJson '+FloatToStr(Longitude)+','+FloatToStr(Latitude));
//
//      LastRecordToFileTime:=ARecordTime;
//      Self.LocationChanged:=True;
//
//    end;
//
//  end;
//end;
//
//procedure TGPSLocation.DoReadIniTimer(Sender:TObject);
//begin
//  LoadFromIni(GetApplicationPath+'Location.ini');
//  LoadFromJson(GetApplicationPath+'Location.json');
//
//  if LocationChanged then
//  begin
//    if Assigned(OnLocationChange) then
//    begin
//      OnLocationChange(Self);
//    end;
//    if Assigned(OnAddrChange) then
//    begin
//      OnAddrChange(Self);
//    end;
//  end;
//
//
//  //测试Windows下定位
//  {$IFDEF MSWINDOWS}
//  //一点点移动
//  Longitude:=Longitude+0.00001;
//  Latitude:=Latitude+0.00001;
//  SaveToIni(GetApplicationPath+'Location.ini');
//  SaveToJson(GetApplicationPath+'Location.json');
//  {$ENDIF}
//
//end;
//{$ENDIF USE_INI_LOCATION}


procedure TGPSLocation.SaveToIni(AIniFilePath: String);
var
  AIniFile:TIniFile;
begin
  AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});
  try
    CustomSaveToIni(AIniFile);

    AIniFile.WriteDateTime('','RecordTime',Now);
  finally
    FreeAndNil(AIniFile);
  end;
end;

procedure TGPSLocation.CustomSaveToIni(AIniFile:TIniFile);
begin
  AIniFile.WriteFloat('','Longitude',Self.Longitude);
  AIniFile.WriteFloat('','Latitude',Self.Latitude);

  AIniFile.WriteString('','Country',Self.Country);
  AIniFile.WriteString('','Province',Self.Province);
  AIniFile.WriteString('','City',Self.City);
  AIniFile.WriteString('','District',Self.District);
  AIniFile.WriteString('','Town',Self.Town);

  AIniFile.WriteString('','Addr',Self.Addr);
  AIniFile.WriteString('','RegionName',Self.RegionName);

end;

//procedure TGPSLocation.SaveToJson(AFilePath: String);
//var
//  ASuperObject:ISuperObject;
//begin
//  ASuperObject:=TSuperObject.Create;
//
//  ASuperObject.F['Longitude']:=Self.Longitude;
//  ASuperObject.F['Latitude']:=Self.Latitude;
//
//  ASuperObject.S['Country']:=Self.Country;
//  ASuperObject.S['Province']:=Self.Province;
//  ASuperObject.S['City']:=Self.City;
//  ASuperObject.S['District']:=Self.District;
//  ASuperObject.S['Town']:=Self.Town;
//
//  ASuperObject.S['Addr']:=Self.Addr;
//  ASuperObject.S['RegionName']:=Self.RegionName;
//
//  ASuperObject.S['RecordTime']:=StandardDateTimeToStr(Now);
//
//  ASuperObject.SaveTo(AFilePath);
//
//end;

procedure TGPSLocation.SetGPSType(const Value: TGPSType);
begin
  Self.Location.GPSType:=Value;
end;

procedure TGPSLocation.SetLatitude(const Value: Double);
begin
  Self.Location.Latitude:=Value;
end;

procedure TGPSLocation.SetLocationOption;
  {$IFDEF USE_BAIDULOCATION}
var
  option: JBDLocationClientOption;
  tempMode: JBDLocationClientOption_LocationMode;
  tempcoor: string;
  {$ENDIF USE_BAIDULOCATION}
begin
  {$IFDEF USE_BAIDULOCATION}



  if not Assigned(mLocClient) then exit;
  tempcoor := 'gps';
  case Self.GPSType of
    gtWGS84: tempcoor := 'gps';
    gtGCJ02: tempcoor := 'gcj02';
  end;

  case Mode of
    lmGPSAndNetwork:
    begin
      tempMode := TJBDLocationClientOption_LocationMode.JavaClass.Hight_Accuracy;
      HandleException(nil,'TGPSLocation.Mode lmGPSAndNetwork');
    end;
    lmNetwork:
    begin
      tempMode := TJBDLocationClientOption_LocationMode.JavaClass.Battery_Saving;
      HandleException(nil,'TGPSLocation.Mode lmNetwork');
    end;
    lmGPS:
    begin
      tempMode := TJBDLocationClientOption_LocationMode.JavaClass.Device_Sensors;
      HandleException(nil,'TGPSLocation.Mode lmGPS');
    end;
  end;

  option := TJBDLocationClientOption.JavaClass.init;

  //设置定位模式
  option.setLocationMode(tempMode);

  //设置GPS格式
  option.setCoorType(StringToJString(tempcoor));


  //地址扫描时间间隔
  option.setScanSpan(ScanSpan);

  //是否需要获取地址
  //不需要了,统一使用线程去获取
//  option.setIsNeedAddress(True);


  mLocClient.setLocOption(option);
  {$ENDIF USE_BAIDULOCATION}
end;

procedure TGPSLocation.SetLongitude(const Value: Double);
begin
  Self.Location.Longitude:=Value;
end;

function TGPSLocation.DoStartLocation:Boolean;
begin
  HandleException(nil,'TGPSLocation.StartLocation Begin');

  //能调用定位说明已经有权限了
  FPermissionStatus:=TAuthorizationType.atAuthorized;


  Result:=False;

  IsLocationTimeout:=False;
  IsStartError:=False;
  HasLocatedAfterStart:=False;

  IsStartedGeocodeAddr:=False;
  IsGeocodeAddrTimeout:=False;
  IsGeocodeAddrError:=False;




  {$IFDEF MSWINDOWS}
  //Windows下面测试
  IsStartedLocation:=True;
  Result:=True;
  {$ENDIF}



//  {$IFDEF USE_INI_LOCATION}
//  FReadIniTimer.Enabled:=True;
//  IsStartedLocation:=True;
//  Result:=True;
//  {$ENDIF}




  {$IFDEF USE_LOCATIONSENSOR}
  //使用自带的LocationSensor
  try
      HandleException(nil,'TGPSLocation.StartLocation Prepare TLocationSensor.Create ');

      //创建GPS定位
      if FLocationSensor=nil then
      begin
        FLocationSensor:=TLocationSensor.Create(nil);
        FLocationSensor.OnLocationChanged:=Self.DoLocationSensor1LocationChanged;
      end;


      HandleException(nil,'TGPSLocation.StartLocation Prepare TLocationSensor.Active ');
      //启动GPS定位
      if not FLocationSensor.Active then
      begin
        HandleException(nil,'TGPSLocation.StartLocation FLocationSensor.Active:=True');
        FLocationSensor.Active:=True;
      end;


      IsStartedLocation:=True;


      //检测定位是否超时
      TThread.CreateAnonymousThread(procedure
      begin
          HandleException(nil,'TGPSLocation.StartLocation Sleep('+IntToStr(LocationTimeout)+') Begin');
          //等待超时时间
          Sleep(LocationTimeout);
          HandleException(nil,'TGPSLocation.StartLocation Sleep('+IntToStr(LocationTimeout)+') End');

          //判断定位是否超时
          if
            //定位启动后没有获取到经纬度
            Not Self.HasLocatedAfterStart then
          begin
              HandleException(nil,'TGPSLocation.StartLocation OnLocationTimeout');
              Self.IsLocationTimeout:=True;
              if Assigned(Self.OnLocationTimeout) then
              begin
                Self.OnLocationTimeout(Self);
              end;
          end;

      end).Start;





      //因为FLocationSensor.Active从False->True之后,
      //可能不会再调用OnChange,因为可能位置没有移动过,
      //只能判断一下有没有定位到,

      //判断是否已经定位到了经纬度
      //是否获取到地址
      HandleException(nil,'TGPSLocation.StartLocation Prepare TLocationSensor.Sensor ');
      if (Self.FLocationSensor.Sensor<>nil) then
      begin
        if (FloatToStr(Self.FLocationSensor.Sensor.latitude)<>'NAN') then
        begin
          DoLocationSensor1LocationChanged(
                        FLocationSensor,
                        TLocationCoord2D.Create(Self.FLocationSensor.Sensor.Latitude,
                                                Self.FLocationSensor.Sensor.Longitude),
                        TLocationCoord2D.Create(Self.FLocationSensor.Sensor.Latitude,
                                                Self.FLocationSensor.Sensor.Longitude)
                        );
        end
        else
        begin
            HandleException(nil,'TGPSLocation.StartLocation Prepare TLocationSensor.Sensor NAN');
        end;
      end;




      Result:=True;

  except
    on E:Exception do
    begin
        HandleException(E,'TGPSLocation.StartLocation');
        //启动定位出错了
        IsStartError:=True;
        if Assigned(Self.FOnStartError) then
        begin
          FOnStartError(Self);
        end;
    end;
  end;
  {$ENDIF}




  {$IFDEF USE_BAIDULOCATION}
      HandleException(nil,'TGPSLocation.StartLocation Begin 1');

      {$IFDEF IN_ANDROIDSERVICE}
      //服务中使用CallInPostRunnable
      CallInPostRunnable(
      {$ELSE}
      //APP中使用CallInUIThread
      CallInUIThread(
      {$ENDIF}
      procedure
      begin

          try
              //创建百度定位组件
              if mBaiduLocationApp=nil then
              begin
                HandleException(nil,'TGPSLocation.StartLocation FirstInit');

                mBaiduLocationApp := TBaiduLocationApp.Create;
                mBaiduLocationApp.LocationObject:=Self;
                mLocClient := mBaiduLocationApp.mLocationClient;
              end;

              if not Assigned(mLocClient) then
              begin
                  //启动定位出错了
                  IsStartError:=True;
                  if Assigned(Self.FOnStartError) then
                  begin
                    FOnStartError(Self);
                  end;
                  Exit;
              end;


              if not IsStartedLocation then
              begin
                HandleException(nil,'TGPSLocation.StartLocation mLocClient.start');

                SetLocationOption;
                mLocClient.start;

                IsStartedLocation:=True;

                HandleException(nil,'TGPSLocation.StartLocation End');
              end;

          except
            on E:Exception do
            begin
              HandleException(E,'TGPSLocation.StartLocation');
              //启动定位出错了
              IsStartError:=True;
              if Assigned(Self.FOnStartError) then
              begin
                FOnStartError(Self);
              end;
            end;
          end;

      end);
      Result:=True;
  {$ENDIF}


  HandleException(nil,'TGPSLocation.StartLocation End');
end;


function TGPSLocation.StartLocation: Boolean;
begin
  HandleException(nil,'TGPSLocation.StartLocation');

  {$IFDEF ANDROID}
      {$IF RTLVersion>=32}// 10.2+
      PermissionsService.RequestPermissions([JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION),
                                              JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION)
                                              ],
          procedure(const APermissions: {$IF CompilerVersion >= 35.0}TClassicStringDynArray{$ELSE}TArray<string>{$IFEND};
            const AGrantResults: {$IF CompilerVersion >= 35.0}TClassicPermissionStatusDynArray{$ELSE}TArray<TPermissionStatus>{$IFEND})
            begin
                  HandleException(nil,'TGPSLocation.StartLocation RequestPermissions CallBack');
                  if (Length(AGrantResults) = 2) then // 为什么为2？因为只申请了2个权限 ，返回肯定判断2个
                  begin
                    if (AGrantResults[0] = TPermissionStatus.Granted)
                      and (AGrantResults[1] = TPermissionStatus.Granted)
                      then
                    begin

                        HandleException(nil,'TGPSLocation.StartLocation RequestPermissions Granted');
                        //ShowHintFrame(nil,'开始启动定位!');
                        if not DoStartLocation then
                        begin
                          //ShowHintFrame(nil,'启动定位失败!');
                        end;
                    end
                    else
                    begin
                        HandleException(nil,'TGPSLocation.StartLocation RequestPermissions Denied');
                    end;
                  end;
            end);
      Result:=True;
      {$ELSE}
      Result:=DoStartLocation;
      {$ENDIF}
  {$ELSE}
  //IOS
  Result:=DoStartLocation;
  {$ENDIF}

end;

procedure TGPSLocation.StopLocation;
begin
  HandleException(nil,'TGPSLocation.StopLocation');


  {$IFDEF USE_INI_LOCATION}
  FReadIniTimer.Enabled:=False;
  {$ENDIF}



  {$IFDEF USE_LOCATIONSENSOR}
  if FLocationSensor<>nil then
  begin
    FLocationSensor.Active:=False;
  end;
  {$ENDIF}



  {$IFDEF USE_BAIDULOCATION}
  if Assigned(mLocClient) then
  begin
    mLocClient.stop;
  end;
  {$ENDIF}


  IsStartedLocation:=False;
end;


{$IFDEF USE_LOCATIONSENSOR}
procedure TGPSLocation.DoLocationSensor1LocationChanged(Sender: TObject;const OldLocation, NewLocation: TLocationCoord2D);
var
  AGPS:TGPS;
begin
  HandleException(nil,'TGPSLocation.DoLocationSensor1LocationChanged');

  //NewLocation是GPS84,需要转换成GCJ02
  case Self.GPSType of
    //大地坐标
    gtWGS84:
    begin
      AGPS:=TGPS.Create(NewLocation.Latitude,NewLocation.Longitude,gtWGS84);
    end;
    //国测局加密坐标
    gtGCJ02:
    begin
      AGPS:=gps84_To_Gcj02(NewLocation.Latitude,NewLocation.Longitude);
    end;
    //百度坐标
    gtBD09LL:
    begin
      AGPS:=gps84_To_Gcj02(NewLocation.Latitude,NewLocation.Longitude);
      AGPS:=gcj02_To_Bd09(AGPS.Latitude,AGPS.Longitude);
    end;

  end;
  DoReceiveLocation(AGPS.Longitude,AGPS.Latitude);

end;
{$ENDIF}




//{ TAutoSyncAddrThread }
//
//constructor TAutoSyncAddrThread.Create(CreateSuspended: Boolean;AGPSLocation: TGPSLocation);
//begin
//  Inherited Create(CreateSuspended);
//  FGPSLocation:=AGPSLocation;
//end;
//
//procedure TAutoSyncAddrThread.Execute;
//var
//  AAddr:String;
//  ACountry:String;
//  AProvince:String;
//  ACity:String;
//  ADistrict:String;
//  ATown:String;
//  AShortAddr:String;
//  APostCode:String;
//begin
//  inherited;
//
//  while not Self.Terminated do
//  begin
//
//      try
//          if FGPSLocation.LocationChanged
//            and FGPSLocation.HasLocated
//            then
//          begin
//
//
//              FGPSLocation.LocationChanged:=False;
//
//              //更新Addr
//              HandleException(nil,'TAutoUploadLocationService.DoSyncAddr Begin');
//
//
//              //国内
//              //百度地址解析
//              if GetGeocoder(
//                      FGPSLocation.Location,
//                      AAddr,ACountry,AProvince,ACity,ADistrict,ATown,AShortAddr,APostCode
//                      ) then
//              begin
//                  //地址解析成功
//
//                  FGPSLocation.DoReceiveAddr(
//                    AAddr,ACountry,AProvince,ACity,ADistrict,ATown,AShortAddr
//                    );
//
//              end
//              else
//              begin
//                  //地址解析失败
//                  HandleException(nil,'TAutoUploadLocationService.DoSyncAddr Fail');
//
//                  FGPSLocation.IsGeocodeAddrError:=True;
//                  if Assigned(Self.FGPSLocation.OnGeocodeAddrError) then
//                  begin
//                    Self.FGPSLocation.OnGeocodeAddrError(FGPSLocation);
//                  end;
//              end;
//
//
//          end;
//      except
//        on E:Exception do
//        begin
//          HandleException(E,'TAutoSyncAddrThread.Execute Error'+' ThreadID:'+IntToStr(TThread.CurrentThread.ThreadID));
//        end;
//      end;
//
//
//      //每三秒更新一次
//      Sleep(3000);
//
//      HandleException(nil,'TAutoSyncAddrThread.Execute Sleep(3000)'+' ThreadID:'+IntToStr(TThread.CurrentThread.ThreadID));
//  end;
//
//end;


{$IFDEF ANDROID}
{$IF RTLVersion=32}

{ TRequestPermissionsCallbackPair }

constructor TRequestPermissionsCallbackPair.Create(const ARequestCode:Integer;
  const APermissions: TArray<string>;const AProc: TRequestPermissionsResultProc;
  const AEvent: TRequestPermissionsResultEvent);
begin
  RequestCode:=ARequestCode;
  Permissions:=APermissions;
  Proc := AProc;
  Event := AEvent;
end;

{ TDisplayRationaleCallbackPair }

constructor TDisplayRationaleCallbackPair.Create(const ARequestCode:Integer;const APermissions: TArray<string>;const AProc: TDisplayRationaleProc; const AEvent: TDisplayRationaleEvent);
begin
  RequestCode:=ARequestCode;
  Permissions:=APermissions;
  Proc := AProc;
  Event := AEvent;
end;


{ TAndroidPermissionsService }

constructor TAndroidPermissionsService.Create;
begin
//  inherited Create;

  FCheckTimer:=TTimer.Create(nil);
  FCheckTimer.Interval:=5000;
  FCheckTimer.Enabled:=False;
  FCheckTimer.OnTimer:=DoCheckTimer;

  FPermissionsRequestsAndCallbacks := TRequestPermissionsCallbackPairList.Create;//TDictionary<Integer, TRequestPermissionsCallbackPair>.Create;
//  TMessageManager.DefaultManager.SubscribeToMessage(TPermissionsRequestResultMessage,
//    HandlePermissionsRequest);
end;

destructor TAndroidPermissionsService.Destroy;
begin
  FreeAndNil(FCheckTimer);

//  TMessageManager.DefaultManager.Unsubscribe(TPermissionsRequestResultMessage, HandlePermissionsRequest);

  FPermissionsRequestsAndCallbacks.Free;
  inherited Destroy;
end;

procedure TAndroidPermissionsService.DoRequestPermissions(const APermissions: TArray<string>;
  const ARequestCode: Integer);
var
  Permissions: TJavaObjectArray<JString>;
  I: Integer;
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.DoRequestPermissions');


  Permissions := TJavaObjectArray<JString>.Create(Length(APermissions));
  for I := Low(APermissions) to High(APermissions) do
    Permissions[I] := StringToJString(APermissions[I]);
  // Using helper class from Android Support Library, so no OS version-checking required
  TJActivityCompat.JavaClass.RequestPermissions(TAndroidHelper.Activity, Permissions, ARequestCode);
end;

function TAndroidPermissionsService.IsPermissionGranted(const APermission: string): Boolean;
begin
  // Using helper class from Android Support Library, so no OS version checking required
  Result := TJContextCompat.JavaClass.checkSelfPermission(TAndroidHelper.Context,
    StringToJString(APermission)) = TJPackageManager.JavaClass.PERMISSION_GRANTED
end;

procedure TAndroidPermissionsService.DoCheckTimer(Sender:TObject);
var
  AKey:Integer;
  I:Integer;
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.DoCheckTimer Begin');


  Self.FCheckTimer.Enabled:=False;

//  for AKey in FPermissionsRequestsAndCallbacks.Keys do
  for I := FPermissionsRequestsAndCallbacks.Count-1 downto 0 do
  begin
//    if CheckRequestPermissions(AKey,FPermissionsRequestsAndCallbacks.Items[AKey].Permissions) then
//    if CheckRequestPermissions(FPermissionsRequestsAndCallbacks[I].RequestCode,FPermissionsRequestsAndCallbacks[I].Permissions) then
//    begin
//      Break;
//    end;
    if CheckRequestPermissions(FPermissionsRequestsAndCallbacks[I].RequestCode,FPermissionsRequestsAndCallbacks[I].Permissions) then
    begin
      FPermissionsRequestsAndCallbacks.Delete(I);
    end;
  end;

  Self.FCheckTimer.Enabled:=(FPermissionsRequestsAndCallbacks.Count>0);


  uBaseLog.HandleException(nil,'TAndroidPermissionsService.DoCheckTimer End');
end;

function TAndroidPermissionsService.IsEveryPermissionGranted(const APermissions: TArray<string>): Boolean;
var
  Permission: string;
begin
  Result := True;
  for Permission in APermissions do
    if not IsPermissionGranted(Permission) then
      Exit(False)
end;

procedure TAndroidPermissionsService.DoRequestPermissionsCallback(
  const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
  const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>);
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.DoRequestPermissionsCallback');


  // Call whichever callback (method or anonymous procedure) was passed in
  if Assigned(ARequestPermissionsCallbackPair.Proc) then
    ARequestPermissionsCallbackPair.Proc(APermissions, AGrantResults)
  else if Assigned(ARequestPermissionsCallbackPair.Event) then
    ARequestPermissionsCallbackPair.Event(Self, APermissions, AGrantResults)
end;

procedure TAndroidPermissionsService.InternalRequestPermissions(const APermissions: TArray<string>;
  const ARequestPermissionsCallbackPair: TRequestPermissionsCallbackPair;
  const ADisplayRationaleCallbackPair: TDisplayRationaleCallbackPair);
var
  RequestCode, I, NextRationaleRequirementIndex: Integer;
  RequestedPermissionsNotAllGranted, ShowRationale: Boolean;
  GrantResults: TArray<TPermissionStatus>;
  Permissions: TArray<string>;
  PostRationale: TProc;
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions Begin');



  // First, check which permissions are not currently granted
  SetLength(GrantResults, Length(APermissions));
  RequestedPermissionsNotAllGranted := False;
  for I := Low(GrantResults) to High(GrantResults) do
  begin
    if IsPermissionGranted(APermissions[I]) then
      GrantResults[I] := TPermissionStatus.Granted
    else
      GrantResults[I] := TPermissionStatus.Denied;
    if GrantResults[I] <> TPermissionStatus.Granted then
      RequestedPermissionsNotAllGranted := True;
  end;

  uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions 2');


  // If we have any then act accordingly
  if RequestedPermissionsNotAllGranted then
  begin
        RequestCode := NextAvailableRequestCode;
        uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions 3');
//        FPermissionsRequestsAndCallbacks.Add(RequestCode, ARequestPermissionsCallbackPair);

        ARequestPermissionsCallbackPair.RequestCode:=RequestCode;
        FPermissionsRequestsAndCallbacks.Add(ARequestPermissionsCallbackPair);
        uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions 4');


        ShowRationale := False;

        // Permissions are not granted. Is there an explanation/rationale to show
        if Assigned(ADisplayRationaleCallbackPair.Proc) or Assigned(ADisplayRationaleCallbackPair.Event) then
        begin
              SetLength(Permissions, Length(APermissions));
              NextRationaleRequirementIndex := 0;
              // Iterate all the permissions and get any rationale strings that need displaying
              for I := Low(APermissions) to High(APermissions) do
              begin
                // References to the Activity won't work in a service where it's nil and will
                // throw an exception if read there, so we check the DelphiActivity symbol first
                if DelphiActivity <> nil then
                begin
                  if TJActivityCompat.JavaClass.shouldShowRequestPermissionRationale(
                       TAndroidHelper.Activity, StringToJString(APermissions[I])) then
                  begin
                    Permissions[NextRationaleRequirementIndex] := APermissions[I];
                    ShowRationale := True;
                    Inc(NextRationaleRequirementIndex);
                  end;
                end;
              end;
              SetLength(Permissions, NextRationaleRequirementIndex);
        end;


        if ShowRationale then
        begin
          PostRationale := procedure
          begin
            DoRequestPermissions(APermissions, RequestCode)
          end;
          // Call whichever rationale display callback has been passed in.
          // This should show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
          // After the user sees the explanation, try again to request the permission.
          if Assigned(ADisplayRationaleCallbackPair.Proc) then
            ADisplayRationaleCallbackPair.Proc(Permissions, PostRationale)
          else if Assigned(ADisplayRationaleCallbackPair.Event) then
            ADisplayRationaleCallbackPair.Event(Self, Permissions, PostRationale)
        end
        else
        begin
          DoRequestPermissions(APermissions, RequestCode);
        end;


        Self.FCheckTimer.Enabled:=True;

  end
  else // Permissions already granted
  begin
      //权限已经申请了
      DoRequestPermissionsCallback(ARequestPermissionsCallbackPair, APermissions, GrantResults);
  end;


  uBaseLog.HandleException(nil,'TAndroidPermissionsService.InternalRequestPermissions End');
end;

function TAndroidPermissionsService.CheckRequestPermissions(const ARequestCode: Integer;
  const APermissions: TArray<string>):Boolean;
var
  RequestCode, I, NextRationaleRequirementIndex: Integer;
  RequestedPermissionsNotAllGranted, ShowRationale: Boolean;
  GrantResults: TArray<TPermissionStatus>;
//  BPermissions: TArray<JString>;
//  PostRationale: TProc;
  BPermissions:TJavaObjectArray<JString>;
  BGrantResults: TJavaArray<Integer>;
begin
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.CheckRequestPermissions Begin');
  Result:=False;

  try

      // First, check which permissions are not currently granted
      SetLength(GrantResults, Length(APermissions));
      RequestedPermissionsNotAllGranted := False;
      for I := Low(GrantResults) to High(GrantResults) do
      begin
        if IsPermissionGranted(APermissions[I]) then
          GrantResults[I] := TPermissionStatus.Granted
        else
          GrantResults[I] := TPermissionStatus.Denied;
        if GrantResults[I] <> TPermissionStatus.Granted then
          RequestedPermissionsNotAllGranted := True;
      end;


      BPermissions := TJavaObjectArray<JString>.Create(Length(APermissions));
      for I := Low(APermissions) to High(APermissions) do
        BPermissions[I] := StringToJString(APermissions[I]);


      BGrantResults := TJavaArray<Integer>.Create(Length(APermissions));
      for I := Low(APermissions) to High(APermissions) do
        BGrantResults[I] := Ord(GrantResults[I]);




      // If we have any then act accordingly
      if not RequestedPermissionsNotAllGranted then
      begin

        uBaseLog.HandleException(nil,'TAndroidPermissionsService.CheckRequestPermissions RequestedPermissions AllGranted');
        //权限已经申请了
        Result:=OnPermissionsRequest(ARequestCode, BPermissions, BGrantResults);
      end;

  except
    on E:Exception do
    begin
      uBaseLog.HandleException(E,'TAndroidPermissionsService.CheckRequestPermissions');
    end;
  end;


  uBaseLog.HandleException(nil,'TAndroidPermissionsService.CheckRequestPermissions End');
end;

procedure TAndroidPermissionsService.RequestPermissions(const APermissions: TArray<string>;
  const AOnRequestPermissionsResult: TRequestPermissionsResultEvent;
  AOnDisplayRationale: TDisplayRationaleEvent);
begin
  if Length(APermissions)=0 then Exit;

  InternalRequestPermissions(APermissions,
                              TRequestPermissionsCallbackPair.Create(0,APermissions,nil, AOnRequestPermissionsResult),
                              TDisplayRationaleCallbackPair.Create(0,APermissions,nil, AOnDisplayRationale)
                              );
end;

procedure TAndroidPermissionsService.RequestPermissions(const APermissions: TArray<string>;
  const AOnRequestPermissionsResult: TRequestPermissionsResultProc;
  AOnDisplayRationale: TDisplayRationaleProc);
begin
  if Length(APermissions)=0 then Exit;

  InternalRequestPermissions(APermissions,
                    TRequestPermissionsCallbackPair.Create(0,APermissions,AOnRequestPermissionsResult, nil),
                    TDisplayRationaleCallbackPair.Create(0,APermissions,AOnDisplayRationale, nil)
                    );
end;

//procedure TAndroidPermissionsService.HandlePermissionsRequest(const Sender: TObject; const AMessage: TMessage);
//var
//  MessageData: TPermissionsRequestResultData;
//  RequestCode: Integer;
//  Permissions: TJavaObjectArray<JString>;
//  GrantResults: TJavaArray<Integer>;
//begin
//  if AMessage is TPermissionsRequestResultMessage then
//  begin
//    MessageData := TPermissionsRequestResultMessage(AMessage).Value;
//    RequestCode := MessageData.RequestCode;
//    Permissions := MessageData.Permissions;
//    GrantResults := MessageData.GrantResults;
//    OnPermissionsRequest(RequestCode, Permissions, GrantResults);
//  end;
//end;

function TAndroidPermissionsService.NextAvailableRequestCode: Integer;
//const
//  StartingRequestCode = 10000;
//var
//  CallbackPair: TRequestPermissionsCallbackPair;
begin
  Result := StartingRequestCode;
  // Loop until we encounter an unused request code
//  while FPermissionsRequestsAndCallbacks.TryGetValue(Result, CallbackPair) do
    Inc(StartingRequestCode,1)
end;

function TAndroidPermissionsService.OnPermissionsRequest(const ARequestCode: Integer;
  const APermissions: TJavaObjectArray<JString>;
  const AGrantResults: TJavaArray<Integer>):Boolean;
var
  CallbackPair: TRequestPermissionsCallbackPair;
  Permissions: TArray<string>;
  GrantResults: TArray<TPermissionStatus>;
  NumPermissions: Integer;
  I: Integer;
begin
  Result:=False;
  uBaseLog.HandleException(nil,'TAndroidPermissionsService.OnPermissionsRequest Begin');


  // Look up the request code in FPermissionsRequestsAndCallbacks CallbackPair to get the user callback to call
//  if FPermissionsRequestsAndCallbacks.TryGetValue(ARequestCode, CallbackPair) then
  CallbackPair:=nil;
  for I := 0 to FPermissionsRequestsAndCallbacks.Count-1 do
  begin
    if FPermissionsRequestsAndCallbacks[I].RequestCode=ARequestCode then
    begin
      CallbackPair:=FPermissionsRequestsAndCallbacks[I];
      Break;
    end;
  end;


  if CallbackPair<>nil then  
  begin
      NumPermissions := APermissions.Length;
      // This callback appears to be called twice, once with empty arrays and then with populated arrays
      if (NumPermissions > 0) and (NumPermissions = AGrantResults.Length) then
      begin
          SetLength(Permissions, NumPermissions);
          SetLength(GrantResults, NumPermissions);
          for I := 0 to Pred(NumPermissions) do
          begin
            Permissions[I] := JStringToString(APermissions[I]);

            if AGrantResults[I] = TJPackageManager.JavaClass.PERMISSION_GRANTED then
              GrantResults[I] := TPermissionStatus.Granted
            else if TJActivityCompat.JavaClass.shouldShowRequestPermissionRationale(
                      TAndroidHelper.Activity, APermissions[I]) then
              GrantResults[I] := TPermissionStatus.Denied
            else
              GrantResults[I] := TPermissionStatus.PermanentlyDenied;
          end;


          try
            DoRequestPermissionsCallback(CallbackPair, Permissions, GrantResults);
          finally
            // Tidy up the resources logged against this request code
//            FPermissionsRequestsAndCallbacks.Remove(ARequestCode);
          end;

          //处理完成
          Result:=True;
      end;
  end;


  uBaseLog.HandleException(nil,'TAndroidPermissionsService.OnPermissionsRequest End');
end;





{ TRequestPermissionsCallbackPairList }

function TRequestPermissionsCallbackPairList.GetItem(
  Index: Integer): TRequestPermissionsCallbackPair;
begin
  Result:=TRequestPermissionsCallbackPair(Inherited Items[Index]);
end;

{ TDisplayRationaleCallbackPairList }

function TDisplayRationaleCallbackPairList.GetItem(
  Index: Integer): TDisplayRationaleCallbackPair;
begin
  Result:=TDisplayRationaleCallbackPair(Inherited Items[Index]);
end;
{$ENDIF}
{$ENDIF}




initialization
  GPSTypeNames[gtWGS84]:='wgs84';
  GPSTypeNames[gtGCJ02]:='gcj02';




  {$IFDEF ANDROID}
  {$IF RTLVersion=32}
  StartingRequestCode := 10000;
  PermissionsService:=TAndroidPermissionsService.Create;
  {$ENDIF}
  {$ENDIF}



finalization
  FreeAndNil(GlobalGPSLocation);



  {$IFDEF ANDROID}
  {$IF RTLVersion=32}
  FreeAndNil(PermissionsService);
  {$ENDIF}
  {$ENDIF}





end.






//{
//	"results": [{
//			"address_components": [{
//					"long_name": "226A",
//					"short_name": "226A",
//					"types": ["street_number"]
//				},
//				{
//					"long_name": "Park Road",
//					"short_name": "Park Rd",
//					"types": ["route"]
//				},
//				{
//					"long_name": "Hokowhitu",
//					"short_name": "Hokowhitu",
//					"types": ["political", "sublocality", "sublocality_level_1"]
//				},
//				{
//					"long_name": "Palmerston North",
//					"short_name": "Palmerston North",
//					"types": ["locality", "political"]
//				},
//				{
//					"long_name": "Manawatu-Wanganui",
//					"short_name": "Manawatu-Wanganui",
//					"types": ["administrative_area_level_1", "political"]
//				},
//				{
//					"long_name": "New Zealand",
//					"short_name": "NZ",
//					"types": ["country", "political"]
//				},
//				{
//					"long_name": "4410",
//					"short_name": "4410",
//					"types": ["postal_code"]
//				}
//			],
//			"formatted_address": "226A Park Rd, Hokowhitu, Palmerston North 4410, New Zealand",
//			"geometry": {
//				"location": {
//					"lat": -40.3637919,
//					"lng": 175.6216724
//				},
//				"location_type": "ROOFTOP",
//				"viewport": {
//					"northeast": {
//						"lat": -40.3624429197085,
//						"lng": 175.6230213802915
//					},
//					"southwest": {
//						"lat": -40.3651408802915,
//						"lng": 175.6203234197085
//					}
//				}
//			},
//			"place_id": "ChIJlS-MH8KyQW0RSj1U7P14UYY",
//			"types": ["street_address"]
//		},
//		{
//			"address_components": [{
//					"long_name": "Hokowhitu",
//					"short_name": "Hokowhitu",
//					"types": ["political", "sublocality", "sublocality_level_1"]
//				},
//				{
//					"long_name": "Palmerston North",
//					"short_name": "Palmerston North",
//					"types": ["locality", "political"]
//				},
//				{
//					"long_name": "Palmerston North City",
//					"short_name": "Palmerston North City",
//					"types": ["administrative_area_level_2", "political"]
//				},
//				{
//					"long_name": "Manawatu-Wanganui",
//					"short_name": "Manawatu-Wanganui",
//					"types": ["administrative_area_level_1", "political"]
//				},
//				{
//					"long_name": "New Zealand",
//					"short_name": "NZ",
//					"types": ["country", "political"]
//				},
//				{
//					"long_name": "4410",
//					"short_name": "4410",
//					"types": ["postal_code"]
//				}
//			],
//			"formatted_address": "Hokowhitu, Palmerston North 4410, New Zealand",
//			"geometry": {
//				"bounds": {
//					"northeast": {
//						"lat": -40.35295319999999,
//						"lng": 175.6491059
//					},
//					"southwest": {
//						"lat": -40.37816830000001,
//						"lng": 175.614721
//					}
//				},
//				"location": {
//					"lat": -40.3623838,
//					"lng": 175.6334011
//				},
//				"location_type": "APPROXIMATE",
//				"viewport": {
//					"northeast": {
//						"lat": -40.35295319999999,
//						"lng": 175.6491059
//					},
//					"southwest": {
//						"lat": -40.37816830000001,
//						"lng": 175.614721
//					}
//				}
//			},
//			"place_id": "ChIJLSYUTJGyQW0RkM2iQ2HvAAU",
//			"types": ["political", "sublocality", "sublocality_level_1"]
//		},
//		{
//			"address_components": [{
//					"long_name": "Palmerston North",
//					"short_name": "Palmerston North",
//					"types": ["locality", "political"]
//				},
//				{
//					"long_name": "Palmerston North City",
//					"short_name": "Palmerston North City",
//					"types": ["administrative_area_level_2", "political"]
//				},
//				{
//					"long_name": "Manawatu-Wanganui",
//					"short_name": "Manawatu-Wanganui",
//					"types": ["administrative_area_level_1", "political"]
//				},
//				{
//					"long_name": "New Zealand",
//					"short_name": "NZ",
//					"types": ["country", "political"]
//				}
//			],
//			"formatted_address": "Palmerston North, New Zealand",
//			"geometry": {
//				"bounds": {
//					"northeast": {
//						"lat": -40.288726,
//						"lng": 175.7071963
//					},
//					"southwest": {
//						"lat": -40.417773,
//						"lng": 175.552863
//					}
//				},
//				"location": {
//					"lat": -40.3523065,
//					"lng": 175.6082145
//				},
//				"location_type": "APPROXIMATE",
//				"viewport": {
//					"northeast": {
//						"lat": -40.288726,
//						"lng": 175.7071963
//					},
//					"southwest": {
//						"lat": -40.417773,
//						"lng": 175.552863
//					}
//				}
//			},
//			"place_id": "ChIJg0SjvZ-tQW0RFZmiQ2HvAAU",
//			"types": ["locality", "political"]
//		},
//		{
//			"address_components": [{
//					"long_name": "4410",
//					"short_name": "4410",
//					"types": ["postal_code"]
//				},
//				{
//					"long_name": "Manawatu-Wanganui",
//					"short_name": "Manawatu-Wanganui",
//					"types": ["administrative_area_level_1", "political"]
//				},
//				{
//					"long_name": "New Zealand",
//					"short_name": "NZ",
//					"types": ["country", "political"]
//				}
//			],
//			"formatted_address": "Manawatu-Wanganui 4410, New Zealand",
//			"geometry": {
//				"bounds": {
//					"northeast": {
//						"lat": -40.3379188,
//						"lng": 175.66432
//					},
//					"southwest": {
//						"lat": -40.4001704,
//						"lng": 175.5933902
//					}
//				},
//				"location": {
//					"lat": -40.3625276,
//					"lng": 175.6334536
//				},
//				"location_type": "APPROXIMATE",
//				"viewport": {
//					"northeast": {
//						"lat": -40.3379188,
//						"lng": 175.66432
//					},
//					"southwest": {
//						"lat": -40.4001704,
//						"lng": 175.5933902
//					}
//				}
//			},
//			"place_id": "ChIJLSYUTJGyQW0RFFU7TQE-GCA",
//			"types": ["postal_code"]
//		},
//		{
//			"address_components": [{
//					"long_name": "Palmerston North City",
//					"short_name": "Palmerston North City",
//					"types": ["administrative_area_level_2", "political"]
//				},
//				{
//					"long_name": "Manawatu-Wanganui",
//					"short_name": "Manawatu-Wanganui",
//					"types": ["administrative_area_level_1", "political"]
//				},
//				{
//					"long_name": "New Zealand",
//					"short_name": "NZ",
//					"types": ["country", "political"]
//				}
//			],
//			"formatted_address": "Palmerston North City, Manawatu-Wanganui, New Zealand",
//			"geometry": {
//				"bounds": {
//					"northeast": {
//						"lat": -40.288726,
//						"lng": 175.7906657
//					},
//					"southwest": {
//						"lat": -40.5296903,
//						"lng": 175.4966319
//					}
//				},
//				"location": {
//					"lat": -40.4097363,
//					"lng": 175.6229296
//				},
//				"location_type": "APPROXIMATE",
//				"viewport": {
//					"northeast": {
//						"lat": -40.288726,
//						"lng": 175.7906657
//					},
//					"southwest": {
//						"lat": -40.5296903,
//						"lng": 175.4966319
//					}
//				}
//			},
//			"place_id": "ChIJg0SjvZ-tQW0RwKyiQ2HvAAQ",
//			"types": ["administrative_area_level_2", "political"]
//		},
//		{
//			"address_components": [{
//					"long_name": "Palmerston North",
//					"short_name": "Palmerston North",
//					"types": ["postal_town"]
//				},
//				{
//					"long_name": "Manawatu-Wanganui",
//					"short_name": "Manawatu-Wanganui",
//					"types": ["administrative_area_level_1", "political"]
//				},
//				{
//					"long_name": "New Zealand",
//					"short_name": "NZ",
//					"types": ["country", "political"]
//				}
//			],
//			"formatted_address": "Palmerston North, Manawatu-Wanganui, New Zealand",
//			"geometry": {
//				"bounds": {
//					"northeast": {
//						"lat": -40.1709103,
//						"lng": 175.7906442
//					},
//					"southwest": {
//						"lat": -40.6327604,
//						"lng": 175.2163869
//					}
//				},
//				"location": {
//					"lat": -40.3463147,
//					"lng": 175.56121
//				},
//				"location_type": "APPROXIMATE",
//				"viewport": {
//					"northeast": {
//						"lat": -40.1709103,
//						"lng": 175.7906442
//					},
//					"southwest": {
//						"lat": -40.6327604,
//						"lng": 175.2163869
//					}
//				}
//			},
//			"place_id": "ChIJIwEfl-tRQG0RKogF4vBEhAk",
//			"types": ["postal_town"]
//		},
//		{
//			"address_components": [{
//					"long_name": "Manawatu-Wanganui",
//					"short_name": "Manawatu-Wanganui",
//					"types": ["administrative_area_level_1", "political"]
//				},
//				{
//					"long_name": "New Zealand",
//					"short_name": "NZ",
//					"types": ["country", "political"]
//				}
//			],
//			"formatted_address": "Manawatu-Wanganui, New Zealand",
//			"geometry": {
//				"bounds": {
//					"northeast": {
//						"lat": -38.4711149,
//						"lng": 176.6308589
//					},
//					"southwest": {
//						"lat": -40.77409,
//						"lng": 174.697216
//					}
//				},
//				"location": {
//					"lat": -39.7273356,
//					"lng": 175.4375574
//				},
//				"location_type": "APPROXIMATE",
//				"viewport": {
//					"northeast": {
//						"lat": -38.4711149,
//						"lng": 176.6308589
//					},
//					"southwest": {
//						"lat": -40.77409,
//						"lng": 174.697216
//					}
//				}
//			},
//			"place_id": "ChIJA9E1Od9eam0RVWqrT8HZJ1c",
//			"types": ["administrative_area_level_1", "political"]
//		},
//		{
//			"address_components": [{
//				"long_name": "New Zealand",
//				"short_name": "NZ",
//				"types": ["country", "political"]
//			}],
//			"formatted_address": "New Zealand",
//			"geometry": {
//				"bounds": {
//					"northeast": {
//						"lat": -28.8773225,
//						"lng": -175.1235077
//					},
//					"southwest": {
//						"lat": -52.7224663,
//						"lng": 165.7437641
//					}
//				},
//				"location": {
//					"lat": -40.900557,
//					"lng": 174.885971
//				},
//				"location_type": "APPROXIMATE",
//				"viewport": {
//					"northeast": {
//						"lat": -28.8773225,
//						"lng": -175.1235077
//					},
//					"southwest": {
//						"lat": -52.7224663,
//						"lng": 165.7437641
//					}
//				}
//			},
//			"place_id": "ChIJh5Z3Fw4gLG0RM0dqdeIY1rE",
//			"types": ["country", "political"]
//		}
//	],
//	"status": "OK"
//}

