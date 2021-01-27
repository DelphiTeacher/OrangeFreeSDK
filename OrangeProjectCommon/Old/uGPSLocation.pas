//convert pas to utf8 by ¥
unit uGPSLocation;

interface

//使用自带的LocationSensor控件定位(IOS)
//{$DEFINE USE_LOCATIONSENSOR}


//使用百度定位(Android)
//{$DEFINE USE_BAIDULOCATION}


////使用INI(Android服务定位保存在本地的结果)
//{$DEFINE USE_INI_LOCATION}
//{$IFDEF MSWINDOWS}
//  {$DEFINE USE_INI_LOCATION}
//{$ENDIF}

//当前是Android服务
//{$DEFINE IN_ANDROIDSERVICE}


//当前项目是EMPLOCATION
//{$DEFINE EMP_LOCATION}

uses
  Classes,
  System.StrUtils,
  IniFiles,

  XSuperObject,
  XSuperJson,

  {$IFDEF EMP_LOCATION}
  uManager,
  uGetDeviceInfo,
  {$ENDIF}

  uAppCommon,
  uAndroidLog,

  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,



  {$IFDEF ANDROID}
    Androidapi.Helpers,
    Androidapi.JNIBridge,
    Androidapi.JNI.JavaTypes,
    Androidapi.JNI.Net,
    Androidapi.JNI.GraphicsContentViewText,


    {$IFDEF EMP_LOCATION}
    Androidapi.JNI.ServiceAssistant,
    {$ENDIF}

    {$IFNDEF IN_ANDROIDSERVICE}
    FMX.Helpers.Android,
    {$ENDIF}
  {$ENDIF}


  {$IFDEF USE_INI_LOCATION}
  FMX.Types,
  {$ENDIF}

  {$IFDEF USE_LOCATIONSENSOR}
  uGPSUtils,
  {$ENDIF}


  {$IFDEF USE_BAIDULOCATION}
  FlyUtils.Android.PostRunnableAndTimer,
  com.baidu.location.LocationClient,
  com.baidu.location.LocationClientOption,
  baidu.locTest.Location,
  {$ENDIF}



  {$IFDEF USE_LOCATIONSENSOR}
  System.Sensors,
    {$IFDEF IOS}
    System.iOS.Sensors,
    {$ENDIF IOS}
  System.Sensors.Components,
//  System.Notification,
  DateUtils,
  {$ENDIF}



  SysUtils;




type
  TGPSType=(
            //大地坐标
            gtWGS84,
            //国测局加密坐标
            gtGCJ02
            );

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


  //根据Location刷新Addr
  TAutoSyncAddrThread=class(TThread)
  private
    FGPSLocation:TGPSLocation;
    procedure DoSyncAddr;
  protected
    procedure Execute;override;
  public
    Constructor Create(CreateSuspended: Boolean;AGPSLocation:TGPSLocation);
  end;




  //获取定位
  TGPSLocation=class
  public
    LocationChanged:Boolean;

    Longitude:Double;
    Latitude:Double;

    Addr:String;
    FProvince:String;
    FCity:String;

    //上次记录的时间
    LastRecordTime:String;


    //自动更新地址的线程
    //Android平台下直接使用百度定位返回的地址
    //那IOS,Windows平台下则需要此线程
    {$IFNDEF ANDROID}
    FAutoSyncAddrThread:TAutoSyncAddrThread;
    {$ENDIF}



  public
    {$IFDEF USE_INI_LOCATION}
    FReadIniTimer:TTimer;
    procedure DoReadIniTimer(Sender:TObject);
    {$ENDIF}


  public
    //使用百度定位
    {$IFDEF USE_BAIDULOCATION}
    IsFirstInit,
    mIsStart: Boolean;
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
    constructor Create;
    destructor Destroy;override;
  public
    IsStarted:Boolean;

    //坐标更改事件
    OnLocationChange:TNotifyEvent;
    //地址更改事件
    OnAddrChange:TNotifyEvent;

    //接收到定位
    procedure DoReceiveLocation(ALongitude:Double;ALatitude:Double);
    //接收到地址
    procedure DoReceiveAddr(AAddr:String;AProvince:String;ACity:String);

  public

    procedure SaveToIni(AIniFilePath:String);
    procedure LoadFromIni(AIniFilePath:String);

    procedure SaveToJson(AFilePath:String);
    procedure LoadFromJson(AFilePath:String);

    //设置定位参数
    procedure SetLocationOption;
    //开始定位
    procedure StartLocation;
    //结束定位
    procedure StopLocation;

  public

    //是否得到定位
    function HasLocated:Boolean;

    //更新定位
    procedure SyncLocation;

  public
    ScanSpan:Integer;
    GPSType:TGPSType;
    Mode:TLocationMode;
  end;




var
  GPSTypeNames:Array[TGPSType] of String;


  //百度API浏览器类型AK(用于根据GPS获取地址)
  //也用于获取详细地址
  BaiduAPIKey:String;


{$IFDEF EMP_LOCATION}

//获取用户所使用的定位类型
function GetUserLocationMode(AUser:TUser):TLocationMode;

//统计HttpControl所使用的数据流量
procedure DoHttpControlNetworkDataUsageChange(Sender:TObject;ADownloadDataSize:Int64;AUploadDataSize:Int64);

function IsWifiEnabled:Boolean;

{$ENDIF}


implementation


{$IFDEF EMP_LOCATION}
function IsWifiEnabled:Boolean;
  {$IFDEF ANDROID}
var
  Service: JObject;
  WifiManager: JWifiManager;
  {$ENDIF}
begin
  Result:=False;
  {$IFDEF ANDROID}
  Service := SharedActivityContext.getSystemService(TJContext.JavaClass.WIFI_SERVICE);
  WifiManager := TJWifiManager.Wrap((Service as ILocalObject).GetObjectID);
  Result:=WifiManager.isWifiEnabled;
  {$ENDIF}
end;

procedure DoHttpControlNetworkDataUsageChange(Sender:TObject;ADownloadDataSize:Int64;AUploadDataSize:Int64);
begin


  if
    //当前WIFI关闭
    not IsWifiEnabled
    {$IFDEF ANDROID}
    //当前数据流量开启
    and TJMobileDataSwitcher.JavaClass.getMobileDataState(SharedActivityContext,nil)
    {$ENDIF}
    then
  begin

    GlobalMobileDataUsage.Load(GetApplicationPath());

    GlobalMobileDataUsage.UseMobileDataTimes:=GlobalMobileDataUsage.UseMobileDataTimes+1;
    GlobalMobileDataUsage.UploadMobileDataSize:=GlobalMobileDataUsage.UploadMobileDataSize+AUploadDataSize;
    GlobalMobileDataUsage.DownloadMobileDataSize:=GlobalMobileDataUsage.DownloadMobileDataSize+ADownloadDataSize;

    GlobalMobileDataUsage.Save(GetApplicationPath());

  end;

end;


function GetUserLocationMode(AUser:TUser):TLocationMode;
begin
  case AUser.LocationMode of
    1:
    begin
      Result:=lmNetwork;
    end;
    2:
    begin
      Result:=lmGPS;
    end
    else
    begin
      Result:=lmGPSAndNetwork;
    end;
  end;
end;
{$ENDIF}




{ TGPSLocation }

constructor TGPSLocation.Create;
begin

  {$IFDEF USE_INI_LOCATION}
  FReadIniTimer:=TTimer.Create(nil);
  FReadIniTimer.OnTimer:=Self.DoReadIniTimer;
  FReadIniTimer.Interval:=3000;
  FReadIniTimer.Enabled:=False;
  {$ENDIF}


  {$IFDEF USE_BAIDULOCATION}
  mIsStart := False;
  IsFirstInit := True;
  mLocClient := nil;
  mBaiduLocationApp := nil;
  {$ENDIF}


  //地址扫描时间间隔
  ScanSpan:=5000;


  Longitude:=0;
  Latitude:=0;



  //测试
  //119.649502,29.076664
  {$IFDEF MSWINDOWS}
  Longitude:=119.649502;
  Latitude:=29.076664;
  Addr:='';
  LocationChanged:=True;
  SaveToIni(GetApplicationPath+'Location.ini');
  SaveToJson(GetApplicationPath+'Location.json');
  {$ENDIF}




  //IOS模拟器
  {$IFDEF IOS}
  {$IFDEF CPUX86}
  Longitude:=119.649502;
  Latitude:=29.076664;
  Addr:='';
  LocationChanged:=True;
  SaveToIni(GetApplicationPath+'Location.ini');
  SaveToJson(GetApplicationPath+'Location.json');
  {$ENDIF}
  {$ENDIF}



  //自动更新地址的线程
  //Android平台下直接使用百度定位返回的地址
  //那IOS,Windows平台下则需要此线程
  {$IFNDEF ANDROID}
  FAutoSyncAddrThread:=TAutoSyncAddrThread.Create(False,Self);
  {$ENDIF}
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

  {$IFDEF USE_INI_LOCATION}
  FreeAndNil(FReadIniTimer);
  {$ENDIF}

  {$IFNDEF ANDROID}
  if FAutoSyncAddrThread<>nil then
  begin
    FreeAndNil(FAutoSyncAddrThread);
  end;
  {$ENDIF}

  inherited;
end;

procedure TGPSLocation.DoReceiveAddr(AAddr: String;AProvince:String;ACity:String);
begin
  HandleException(nil,'TGPSLocation.DoReceiveAddr');

  Addr:=AAddr;
  FProvince:=AProvince;
  FCity:=ACity;

  SaveToIni(GetApplicationPath+'Location.ini');
  SaveToJson(GetApplicationPath+'Location.json');

  if Assigned(OnAddrChange) then
  begin
    OnAddrChange(Self);
  end;

end;

procedure TGPSLocation.DoReceiveLocation(ALongitude, ALatitude: Double);
begin
  HandleException(nil,'TGPSLocation.DoReceiveLocation '+FloatToStr(ALongitude)+','+FloatToStr(ALatitude));

  if ALongitude>0.1 then
  begin
      LocationChanged:=True;


      //定位到了
      Longitude:=ALongitude;
      Latitude:=ALatitude;

      SaveToIni(GetApplicationPath+'Location.ini');
      SaveToJson(GetApplicationPath+'Location.json');


      if Assigned(OnLocationChange) then
      begin
        OnLocationChange(Self);
      end;

  end;
end;

function TGPSLocation.HasLocated: Boolean;
begin
  Result:=False;

  if not (Longitude<0.1)
    and not (Latitude<0.1) then
  begin
      Result:=True;
  end;

end;


procedure TGPSLocation.LoadFromIni(AIniFilePath: String);
var
  AIniFile:TIniFile;
  ARecordTime:String;
begin

  if FileExists(AINIFilePath) then
  begin
    AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});


    Self.Longitude:=AIniFile.ReadFloat('','Longitude',0);
    Self.Latitude:=AIniFile.ReadFloat('','Latitude',0);
    Self.Addr:=AIniFile.ReadString('','Addr','');
    ARecordTime:=AIniFile.ReadString('','RecordTime','');
    if ARecordTime<>Self.LastRecordTime then
    begin

//      HandleException(nil,'TGPSLocation.LoadFromIni '+FloatToStr(Longitude)+','+FloatToStr(Latitude));

      LastRecordTime:=ARecordTime;
      Self.LocationChanged:=True;

    end;


    FreeAndNil(AIniFile);
  end;

end;

procedure TGPSLocation.LoadFromJson(AFilePath: String);
var
  ASuperObject:ISuperObject;
  ARecordTime:String;
begin

  if FileExists(AFilePath) then
  begin
    ASuperObject:=TSuperObject.ParseFile(AFilePath);


    Self.Longitude:=ASuperObject.F['Longitude'];
    Self.Latitude:=ASuperObject.F['Latitude'];
    Self.Addr:=ASuperObject.S['Addr'];
    ARecordTime:=ASuperObject.S['RecordTime'];
    if ARecordTime<>Self.LastRecordTime then
    begin

//      HandleException(nil,'TGPSLocation.LoadFromJson '+FloatToStr(Longitude)+','+FloatToStr(Latitude));

      LastRecordTime:=ARecordTime;
      Self.LocationChanged:=True;

    end;

  end;


end;


{$IFDEF USE_INI_LOCATION}
procedure TGPSLocation.DoReadIniTimer(Sender:TObject);
begin
  LoadFromIni(GetApplicationPath+'Location.ini');
  LoadFromJson(GetApplicationPath+'Location.json');

  if LocationChanged then
  begin
    if Assigned(OnLocationChange) then
    begin
      OnLocationChange(Self);
    end;
    if Assigned(OnAddrChange) then
    begin
      OnAddrChange(Self);
    end;
  end;


  //测试Windows下定位
  {$IFDEF MSWINDOWS}
  Longitude:=Longitude+0.00001;
  Latitude:=Latitude+0.00001;
  SaveToIni(GetApplicationPath+'Location.ini');
  SaveToJson(GetApplicationPath+'Location.json');
  {$ENDIF}

end;
{$ENDIF}


procedure TGPSLocation.SaveToIni(AIniFilePath: String);
var
  AIniFile:TIniFile;
begin
  AIniFile:=TIniFile.Create(AINIFilePath{$IFNDEF MSWINDOWS},TEncoding.UTF8{$ENDIF});

  AIniFile.WriteFloat('','Longitude',Self.Longitude);
  AIniFile.WriteFloat('','Latitude',Self.Latitude);
  AIniFile.WriteString('','Addr',Self.Addr);
  AIniFile.WriteDateTime('','RecordTime',Now);

  FreeAndNil(AIniFile);

end;

procedure TGPSLocation.SaveToJson(AFilePath: String);
var
  ASuperObject:ISuperObject;
begin
  ASuperObject:=TSuperObject.Create;

  ASuperObject.F['Longitude']:=Self.Longitude;
  ASuperObject.F['Latitude']:=Self.Latitude;
  ASuperObject.S['Addr']:=Self.Addr;
  ASuperObject.S['RecordTime']:=StandardDateTimeToStr(Now);

  ASuperObject.SaveTo(AFilePath);

end;

procedure TGPSLocation.SetLocationOption;
  {$IFDEF USE_BAIDULOCATION}
var
  option: JBDLocationClientOption;
  tempMode: JBDLocationClientOption_LocationMode;
  tempcoor: string;
  {$ENDIF}
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
  option.setIsNeedAddress(True);


  mLocClient.setLocOption(option);
  {$ENDIF}
end;

procedure TGPSLocation.StartLocation;
begin
  HandleException(nil,'TGPSLocation.StartLocation Begin');

  {$IFDEF USE_INI_LOCATION}
  FReadIniTimer.Enabled:=True;
  IsStarted:=True;
  {$ENDIF}




  {$IFDEF USE_LOCATIONSENSOR}
  try
    if FLocationSensor=nil then
    begin
      FLocationSensor:=TLocationSensor.Create(nil);
      FLocationSensor.OnLocationChanged:=Self.DoLocationSensor1LocationChanged;
    end;
    if not FLocationSensor.Active then
    begin
      FLocationSensor.Active:=True;
    end;
    IsStarted:=True;
  except
    on E:Exception do
    begin
      HandleException(E,'TGPSLocation.StartLocation');
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


          if IsFirstInit then
          begin
            HandleException(nil,'TGPSLocation.StartLocation FirstInit');

            mBaiduLocationApp := TBaiduLocationApp.Create;
            mBaiduLocationApp.LocationObject:=Self;


            mLocClient := mBaiduLocationApp.mLocationClient;
            IsFirstInit := False;
          end;
          if not Assigned(mLocClient) then exit;
          if not mIsStart then
          begin
            HandleException(nil,'TGPSLocation.StartLocation mLocClient.start');

            SetLocationOption;
            mLocClient.start;
            mIsStart := True;


            IsStarted:=True;

            HandleException(nil,'TGPSLocation.StartLocation End');
          end
          else
          begin
//            mLocClient.stop;
//            mIsStart := False;
          end;


      end);

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
  mIsStart:=False;
//  FreeAndNil(mBaiduLocationApp);
  {$ENDIF}

  IsStarted:=False;
end;


{$IFDEF USE_LOCATIONSENSOR}
procedure TGPSLocation.DoLocationSensor1LocationChanged(Sender: TObject;const OldLocation, NewLocation: TLocationCoord2D);
var
  AGPS:TGPS;
//var
//  NotificationCenter1: TNotificationCenter;
//  ANotification:TNotification;
begin
  HandleException(nil,'TGPSLocation.DoLocationSensor1LocationChanged');

  //NewLocation是GPS84,需要转换成GCJ02
  AGPS:=gps84_To_Gcj02(NewLocation.Latitude,NewLocation.Longitude);
  DoReceiveLocation(AGPS.Longitude,AGPS.Latitude);

  //如果时间过了一段之后,发个推送通知

//  NotificationCenter1:=TNotificationCenter.Create(nil);
//  ANotification:=NotificationCenter1.CreateNotification;
//  ANotification.Title:='定位';
//  ANotification.AlertBody:='DoLocationSensor1LocationChanged';
//  ANotification.FireDate:=DateUtils.IncSecond(Now,5);
//  NotificationCenter1.ScheduleNotification(ANotification);

end;
{$ENDIF}

procedure TGPSLocation.SyncLocation;
  {$IFDEF USE_LOCATIONSENSOR}
var
  AGPS:TGPS;
  {$ENDIF}
begin

  {$IFDEF USE_LOCATIONSENSOR}
  HandleException(nil,'TGPSLocation.SyncLocation');
  //是否获取到地址
  if (FLocationSensor<>nil)
    and (Self.FLocationSensor.Sensor<>nil)
    and (FloatToStr(Self.FLocationSensor.Sensor.latitude)<>'NAN') then
  begin

//        Longitude:=Self.FLocationSensor.Sensor.Longitude;
//        Latitude:=Self.FLocationSensor.Sensor.Latitude;


        //NewLocation是GPS84,需要转换成GCJ02
        AGPS:=gps84_To_Gcj02(Self.FLocationSensor.Sensor.Latitude,Self.FLocationSensor.Sensor.Longitude);
        Longitude:=AGPS.Longitude;
        Latitude:=AGPS.Latitude;

  end
  else
  begin
  end;
  {$ENDIF}

end;



{ TAutoSyncAddrThread }

{ TAutoSyncAddrThread }

constructor TAutoSyncAddrThread.Create(CreateSuspended: Boolean;AGPSLocation: TGPSLocation);
begin
  Inherited Create(CreateSuspended);
  FGPSLocation:=AGPSLocation;
end;

procedure TAutoSyncAddrThread.DoSyncAddr;
var
  NetHTTPClient1: TNetHTTPClient;
  AResponseStream:TStringStream;
  AResponseString:String;
  AResultJson:ISuperObject;
  AAddressComponentJson:ISuperObject;
  AProvince:String;
  ACity:String;

  AGeocoderUrl:String;
begin
  HandleException(nil,'TAutoUploadLocationService.DoSyncAddr Begin');

  NetHTTPClient1:=TNetHTTPClient.Create(nil);
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try
      try

          //先调用百度接口,根据GPS获取Addr
          //http://api.map.baidu.com/geocoder/v2/?callback=renderReverse&coordtype=wgs84ll&location=39.983424,116.322987&output=json&pois=0&ak=8dlnIKumxm6hAhkxs7OyCrg3
//        renderReverse&&renderReverse(
//        {"status":0,"result":
//              {
//              "location":{"lng":116.32298699999993,"lat":39.98342407140365},
//              "formatted_address":"北京市海淀区中关村大街27号1101-08室",
//              "business":"中关村,人民大学,苏州街",
//              "addressComponent":{"country":"中国","country_code":0,"province":"北京市","city":"北京市","district":"海淀区","adcode":"110108","street":"中关村大街","street_number":"27号1101-08室","direction":"附近","distance":"7"},
//              "pois":[],
//              "poiRegions":[],
//              "sematic_description":"北京远景国际公寓(中关村店)内0米",
//              "cityCode":131
//              }
//        }
//        )



          HandleException(nil,'TAutoSyncAddrThread.DoAutoUploadLocation geocoder');

          AGeocoderUrl:= 'http://api.map.baidu.com/geocoder/v2/'
                          +'?callback=renderReverse'
                          +'&location='+FloatToStr(FGPSLocation.Latitude)+','+FloatToStr(FGPSLocation.Longitude)
                          +'&output=json'
                          +'&pois=0'
                          +'&ak='+BaiduAPIKey;
          case FGPSLocation.GPSType of
            gtWGS84:
            begin
              AGeocoderUrl:=AGeocoderUrl+'&coordtype=wgs84ll';
            end;
            gtGCJ02:
            begin
              AGeocoderUrl:=AGeocoderUrl+'&coordtype=gcj02ll';
            end;
          end;


          NetHTTPClient1.Get(
                          AGeocoderUrl,
                          AResponseStream
                          );


          {$IFDEF EMP_LOCATION}
          DoHttpControlNetworkDataUsageChange(nil,AResponseStream.Size,0);
          {$ENDIF}


          AResponseString:=AResponseStream.DataString;

          //'renderReverse&&renderReverse(
          //{
          //  "status":0,
          //  "result":{
          //          "location":{
          //                    "lng":119.65594360797496,"lat":29.08298389997244
          //                    },
          //          "formatted_address":"浙江省金华市婺城区丹溪路1133号",
          //          "business":"",
          //          "addressComponent":{
          //                            "country":"中国","country_code":0,"country_code_iso":"CHN",
          //                            "country_code_iso2":"CN","province":"浙江省","city":"金华市",
          //                            "city_level":2,"district":"婺城区","town":"","adcode":"330702",
          //                            "street":"丹溪路","street_number":"1133号","direction":"附近",
          //                            "distance":"13"
          //                            },
          //          "pois":[],
          //          "roads":[],
          //          "poiRegions":[
          //                      {"direction_desc":"内","name":"寺前皇小区","tag":"房地产",
          //                      "uid":"3da907f319ccda52b320a86b"}
          //                      ],
          //          "sematic_description":"寺前皇小区内,龙腾创业大厦-东1门附近27米",
          //          "cityCode":333
          //          }
          //})'
          if Pos('renderReverse',AResponseString)>0 then
          begin
            AResponseString:=Copy(AResponseString,
                                  Pos('(',AResponseString)+1,
                                  MaxInt);
            AResponseString:=Copy(AResponseString,Low(AResponseString),Length(AResponseString)-1);
            AResultJson:=TSuperObject.Create(AResponseString);
            if AResultJson.I['status']=0 then
            begin
              HandleException(nil,'TAutoSyncAddrThread.DoSyncAddr geocoder succ');

              //获取成功
              AProvince:='';
              ACity:='';
              AAddressComponentJson:=nil;
              if AResultJson.O['result'].Contains('addressComponent') then
              begin
                if AResultJson.O['result'].GetType('addressComponent')=varObject then
                begin
                  AAddressComponentJson:=AResultJson.O['result'].O['addressComponent'];
                end
                else
                begin
                  AAddressComponentJson:=AResultJson.O['result'].A['addressComponent'].O[0];
                end;

                AProvince:=AAddressComponentJson.S['province'];
                ACity:=AAddressComponentJson.S['city'];
              end;

              FGPSLocation.DoReceiveAddr(
                AResultJson.O['result'].S['formatted_address'],
                AProvince,
                ACity);

            end
            else
            begin
              HandleException(nil,'TAutoSyncAddrThread.DoSyncAddr geocoder fail code '+IntToStr(AResultJson.I['status']));
            end;
          end;




      except
        on E:Exception do
        begin
          HandleException(E,'TAutoUploadLocationService.DoSyncAddr Error');
        end;
      end;
  finally
    FreeAndNil(NetHTTPClient1);
    FreeAndNil(AResponseStream);
  end;
end;


procedure TAutoSyncAddrThread.Execute;
begin
  inherited;

  while not Self.Terminated do
  begin

    if FGPSLocation.LocationChanged
      and FGPSLocation.HasLocated then
    begin
      FGPSLocation.LocationChanged:=False;

      //更新Addr
      DoSyncAddr;

    end;


    //每三秒更新一次
    Sleep(3000);
  end;

end;



initialization
  GPSTypeNames[gtWGS84]:='wgs84';
  GPSTypeNames[gtGCJ02]:='gcj02';

  //显示轨迹
  BaiduAPIKey:='8dlnIKumxm6hAhkxs7OyCrg3';


end.
