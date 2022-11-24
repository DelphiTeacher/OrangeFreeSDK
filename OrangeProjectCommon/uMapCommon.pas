//convert pas to utf8 by ¥
//地图公共单元

unit uMapCommon;

interface

uses
  SysUtils,
  Classes,
  UITypes,
  StrUtils,
  FMX.Types,
  IdURI,
//  uAppCommon,


  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,

  {$IFDEF ANDROID}
  Androidapi.JNI.JavaTypes,Androidapi.JNI.Telephony,
  Androidapi.JNI.Net,Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,FMX.Helpers.Android,
  Androidapi.JNI.Embarcadero,
  FMX.VirtualKeyboard,
  Androidapi.JNI.App, Androidapi.JNIBridge,
  System.SyncObjs,
  FMX.Platform.Android,
  {$ENDIF}

  {$IFDEF ANDROID}
  uMobileUtils,
  {$ENDIF}
  {$IFDEF IOS}
  uMobileUtils,
  {$ENDIF}


  XSuperObject,
  XSuperJson,



  uBaseHttpControl,
  uGPSUtils,
  uBaseLog,
  uBaseList;


type
  //地图显示模式
  TMapFrameViewMode=(
        //查看模式
        mfvmView,
        //坐标抬取器,点击获取坐标
        mfvmSetPoint
        );





  //导航模式，
  //固定为
  //  transit、driving、
  //  navigation、
  //  walking，riding
  //分别表示公交、驾车、导航、步行和骑行
  TRoutePlanType=(rptTransit,   //公交
                  rptDriving,   //驾车
//                  rptNavigation,//导航
                  rptWalking,   //步行
                  rptRiding     //骑行
                  );


  //地图标注
  TMapAnnotation=class(TPersistent)
  protected
    procedure AssignTo(Source: TPersistent);override;
  public
    constructor Create;
  public

    ///aaasdf
    //位置坐标
    Location:TLocation;



    //标注的名称
    Name:String;
    //详细地址
    Addr:String;


    //区分
    User:String;

    //国家
    Country:String;
    //省份
    Province:String;
    //城市
    City:String;
    //区域
    Area:String;

    //镇
    Town:String;
    //短地址,比如丹溪路1171号,比如龙腾创业大厦
    RegionName:String;
    PostCode:String;

    //图标的本地路径
    IconFilePath:String;
    //是否需要弹出窗体
    NeedInfoWindow:Boolean;


    //线段
    StrokeColor:TAlphaColor;//颜色blue
    StrokeWeight:Integer;//粗细4
    StrokeOpacity:Double;//透明度0.5

    procedure Clear;
    function IconUrl:String;
  end;

  //标注的列表
  TMapAnnotationList=class(TBaseList)
  private
    function GetItem(Index: Integer): TMapAnnotation;
  protected
    procedure AssignTo(Dest: TPersistent);override;
  public
    procedure AddList(ASrc: TMapAnnotationList);
    property Items[Index:Integer]:TMapAnnotation read GetItem;default;
  end;



  TMapFrameSetPointEvent=procedure(Sender:TObject;
                                    ALocation:TLocation;
                                    AAddr:String;
                                    AMapAnnotation:TMapAnnotation) of object;




//计算标记列表的中心点
function CalcAnnotationListCenter(AMapAnnotationList:TMapAnnotationList):TLocation;

//获取百度的路线规划
function GetBaiduRoutePlan(AStartLocation:TLocation;
                            AEndLocation:TLocation;
                            AStartRegion:String;
                            AEndRegion:String;
                            ABaiduKey:String;
                            var AError:String):TMapAnnotationList;

//获取百度路线规划的距离
function GetBaiduRouteDistance(AStartLocation:TLocation;
                               AEndLocation:TLocation;
                               AStartRegion:String;
                               AEndRegion:String;
                               ABaiduKey:String;
                               var AError:String;
                               var ADistance:Double):Boolean;


//android和ios GoogleMap画导航线路图 路径规划（Directions）
//https://blog.csdn.net/mad1989/article/details/9734667
function GetGoogleRoutePlan(AStartLocation:TMapAnnotation;
                            AEndLocation:TMapAnnotation;
                            AGoogleAPIKey:String;
                            var AError:String):TMapAnnotationList;

//获取谷歌路线规划的距离,米
function GetGoogleRouteDistance(AStartLocation:TLocation;
                                AEndLocation:TLocation;
                                AGoogleAPIKey:String;
                                var AError:String;
                                var ADistance:Double):Boolean;

//百度地图以URI的方式调起路线规划
procedure BaiduMapUriRoutePlan(AStartLocation:TLocation;
                                AEndLocation:TLocation;
                                ARoutePlanType:TRoutePlanType;
                                AStartName:String;
                                AEndName:String;
                                AYourCompanyName:String;
                                AYourAppName:String);

//高德地图以URI的方式调起路线规划
procedure AMapUriRoutePlan(AStartLocation:TLocation;
                          AEndLocation:TLocation;
                          ARoutePlanType:TRoutePlanType;
                          AStartName:String;
                          AEndName:String;
                          ASourceApplicationName:String);


//谷歌地图以URI的方式调起路线规划
procedure GoogleMapUriRoutePlan(AStartLocation:TLocation;
                                AEndLocation:TLocation;
                                ARoutePlanType:TRoutePlanType;
                                AStartName:String;
                                AEndName:String);



function BaiduMapGeocoder(ALocation:TLocation;
                            var AAddr:String;
                            var ACountry:String;
                            var AProvince:String;
                            var ACity:String;
                            var ADistrict:String;
                            var ATown:String;
                            var AShortAddr:String
                            ):Boolean;


function GoogleMapGeocoder(ALocation:TLocation;
                            var AAddr:String;
                            var ACountry:String;
                            var AProvince:String;
                            var ACity:String;
                            var ADistrict:String;
                            var ARoute:String;
                            var AShortAddr:String;
                            var APostCode:String
                            ):Boolean;


function GetGeocoder(ALocation:TLocation;
                            var AAddr:String;
                            var ACountry:String;
                            var AProvince:String;
                            var ACity:String;
                            var ADistrict:String;
                            var ARoute:String;
                            var AShortAddr:String;
                            var APostCode:String):Boolean;



implementation



function GetGeocoder(ALocation:TLocation;
                            var AAddr:String;
                            var ACountry:String;
                            var AProvince:String;
                            var ACity:String;
                            var ADistrict:String;
                            var ARoute:String;
                            var AShortAddr:String;
                            var APostCode:String):Boolean;
begin

  Result:=False;

  {$IFDEF USE_GOOGLE_ROUTE_PLAN}
  Result:=GoogleMapGeocoder(ALocation,
                            AAddr,
                            ACountry,
                            AProvince,
                            ACity,
                            ADistrict,
                            ARoute,
                            AShortAddr,
                            APostCode);
  {$ELSE}
  Result:=BaiduMapGeocoder(ALocation,
                            AAddr,
                            ACountry,
                            AProvince,
                            ACity,
                            ADistrict,
                            ARoute,
                            AShortAddr);

  {$ENDIF}
end;


function GoogleMapGeocoder(ALocation:TLocation;
                            var AAddr:String;
                            var ACountry:String;
                            var AProvince:String;
                            var ACity:String;
                            var ADistrict:String;
                            var ARoute:String;
                            var AShortAddr:String;
                            var APostCode:String):Boolean;
var
  NetHTTPClient1: TNetHTTPClient;
  AResponseStream:TStringStream;
  AResponseString:String;
  AResultJson:ISuperObject;
  AAddressComponentJson:ISuperArray;

  AGeocoderUrl:String;

  ARegionName:String;
  AStreetNumber:String;

  AArea:String;
  I: Integer;
  J: Integer;

begin
  HandleException(nil,'GoogleMapGeocoder Begin');



  Result:=False;
  AAddr:='';
  ACountry:='';
  AProvince:='';
  ACity:='';
  ADistrict:='';
  ARoute:='';
  AShortAddr:='';

  AArea:='';
  AStreetNumber:='';



  NetHTTPClient1:=TNetHTTPClient.Create(nil);
  NetHTTPClient1.ConnectionTimeout:=10*1000;  //连接超时-10秒
  NetHTTPClient1.ResponseTimeout:=10*1000;    //响应超时-10秒
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try
      try



            HandleException(nil,'GoogleMapGeocoder geocoder');

            AGeocoderUrl:= 'https://maps.googleapis.com/maps/api/geocode/json'
                            +'?'
                            +'latlng='+FloatToStr(ALocation.Latitude)+','+FloatToStr(ALocation.Longitude)
                            +'&key='+GoogleAPIKey;
            case ALocation.GPSType of
              gtWGS84:
              begin
                AGeocoderUrl:=AGeocoderUrl+'&coordtype=wgs84ll';
              end;
              gtGCJ02:
              begin
                AGeocoderUrl:=AGeocoderUrl+'&coordtype=gcj02ll';
              end;
            end;


            NetHTTPClient1.Get(AGeocoderUrl,AResponseStream);
//            GetWebUrl_From_OrangeUIServer(NetHTTPClient1,AGeocoderUrl,AResponseStream);


            //返回的格式在最面,因为内容太长,显示不下
            AResponseString:=AResponseStream.DataString;
            HandleException(nil,'GoogleMapGeocoder AResponseString='+AResponseString);


//            AResponseString:=Copy(AResponseString,
//                                  Pos('(',AResponseString)+1,
//                                  MaxInt);
//            AResponseString:=Copy(AResponseString,Low(AResponseString),Length(AResponseString)-1);
            AResultJson:=TSuperObject.Create(AResponseString);
            if AResultJson.S['status']='OK' then
            begin

                HandleException(nil,'TAutoSyncAddrThread.DoSyncAddr geocoder succ');

                //获取成功
                AAddressComponentJson:=nil;

                if AResultJson.A['results'].Length>0 then
                begin
//
                  AAddressComponentJson:=AResultJson.A['results'].O[0].A['address_components'];

                  for I := 0 to AAddressComponentJson.Length-1 do
                  begin
//                    if AResultJson.A['results'].O[0].A['types'].S[0]=
//                             AResultJson.A['results'].O[0].A['address_components'].O[J].A['types'].S[0] then
//                    begin

                        //{
                        //"long_name": "Park Road",
                        //"short_name": "Park Rd",
                        //"types": ["route"]
                        //},
                        //"types": ["street_number"]
                        //"types": ["route"]
                        //"types": ["political", "sublocality", "sublocality_level_1"]
                        //"types": ["locality", "political"]
                        //"types": ["administrative_area_level_1", "political"]
                        //"types": ["country", "political"]
                        //"types": ["postal_code"]
                        if AAddressComponentJson.O[I].A['types'].S[0]='postal_code' then
                        begin
                          APostCode:=AAddressComponentJson.O[I].S['long_name'];
                        end;

                        if AAddressComponentJson.O[I].A['types'].S[0]='country' then
                        begin
                          ACountry:=AAddressComponentJson.O[I].S['long_name'];
                        end;

                        if AAddressComponentJson.O[I].A['types'].S[0]='administrative_area_level_1' then
                        begin
                          AProvince:=AAddressComponentJson.O[I].S['long_name'];
                        end;

                        if AAddressComponentJson.O[I].A['types'].S[0]='locality' then
                        begin
                          ACity:=AAddressComponentJson.O[I].S['long_name'];
                        end;

                        if AAddressComponentJson.O[I].A['types'].S[0]='political' then
                        begin
                          ADistrict:=AAddressComponentJson.O[I].S['long_name'];
                        end;

                        if AAddressComponentJson.O[I].A['types'].S[0]='route' then
                        begin
                          ARoute:=AAddressComponentJson.O[I].S['long_name'];
                        end;

                        if AAddressComponentJson.O[I].A['types'].S[0]='street_number' then
                        begin
                          AStreetNumber:=AAddressComponentJson.O[I].S['long_name'];
                        end;

//                    end
//                    else
//                    begin
//                          if AResultJson.A['results'].O[I].A['types'].S[0]='street_address' then
//                          begin
//                            if AResultJson.A['results'].O[I].A['address_components'].O[J].A['types'].S[0]='route' then
//                            begin
//                              ARoute:=AResultJson.A['results'].O[I].A['address_components'].O[J].S['long_name'];
//                            end;
//
//                            if AResultJson.A['results'].O[I].A['address_components'].O[J].A['types'].S[0]='street_number' then
//                            begin
//                              AStreetNumber:=AResultJson.A['results'].O[I].A['address_components'].O[J].S['long_name'];
//                            end;
//
//                          end;
//                    end;


                  end;

//                    end;

                    //国外的拼法和国内的拼法
                    AShortAddr:=AStreetNumber+','+ARoute+','+ADistrict+','+ACity+','+AProvince;

                    //'226A Park Rd, Hokowhitu, Palmerston North 4410, New Zealand'
                    AAddr:=AResultJson.A['results'].O[0].S['formatted_address'];



                    Result:=True;

                end
                else
                begin
                    AAddr:='';
                    ACountry:='';
                    AProvince:='';
                    ACity:='';
                    ADistrict:='';
                    ARoute:='';
                    APostCode:='';
                    AShortAddr:=AAddr;

                end;

            end
            else
            begin
              HandleException(nil,'GoogleMapGeocoder geocoder fail code '+IntToStr(AResultJson.I['status']));
            end;

      except
        on E:Exception do
        begin
          HandleException(E,'GoogleMapGeocoder Error');
        end;
      end;
  finally
    FreeAndNil(NetHTTPClient1);
    FreeAndNil(AResponseStream);
  end;
end;

function BaiduMapGeocoder(ALocation:TLocation;
                            var AAddr:String;
                            var ACountry:String;
                            var AProvince:String;
                            var ACity:String;
                            var ADistrict:String;
                            var ATown:String;
                            var AShortAddr:String):Boolean;
var
  NetHTTPClient1: TNetHTTPClient;
  AResponseStream:TStringStream;
  AResponseString:String;
  AResultJson:ISuperObject;
  AAddressComponentJson:ISuperObject;

  AGeocoderUrl:String;

  ARegionName:String;
begin
  HandleException(nil,'BaiduMapGeocoder Begin');



  Result:=False;
  AAddr:='';
  ACountry:='';
  AProvince:='';
  ACity:='';
  ADistrict:='';
  ATown:='';
  AShortAddr:='';



  NetHTTPClient1:=TNetHTTPClient.Create(nil);
  NetHTTPClient1.ConnectionTimeout:=10*1000;  //连接超时-五秒
  NetHTTPClient1.ResponseTimeout:=10*1000;    //响应超时-五秒
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



          HandleException(nil,'BaiduMapGeocoder geocoder');

          AGeocoderUrl:= 'http://api.map.baidu.com/geocoder/v2/'
                          +'?callback=renderReverse'
                          +'&location='+FloatToStr(ALocation.Latitude)+','+FloatToStr(ALocation.Longitude)
                          +'&output=json'
                          +'&pois=0'
                          +'&ak='+BaiduAPIKey;
          case ALocation.GPSType of
            gtWGS84:
            begin
              AGeocoderUrl:=AGeocoderUrl+'&coordtype=wgs84ll';
            end;
            gtGCJ02:
            begin
              AGeocoderUrl:=AGeocoderUrl+'&coordtype=gcj02ll';
            end;
          end;


          NetHTTPClient1.Get(AGeocoderUrl,AResponseStream);
//          GetWebUrl_From_OrangeUIServer(NetHTTPClient1,AGeocoderUrl,AResponseStream);


//          {$IFDEF EMP_LOCATION}
//          //添加网络使用量
//          DoHttpControlNetworkDataUsageChange(nil,AResponseStream.Size,0);
//          {$ENDIF}


          AResponseString:=AResponseStream.DataString;
          HandleException(nil,'BaiduMapGeocoder AResponseString='+AResponseString);

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


          //{
          //	"status": 0,
          //	"result": {
          //		"location": {
          //			"lng": 119.65585241713565,
          //			"lat": 29.08296571399391
          //		},
          //		"formatted_address": "浙江省金华市婺城区丹溪路1133号",
          //		"business": "",
          //		"addressComponent": {
          //			"country": "中国",
          //			"country_code": 0,
          //			"country_code_iso": "CHN",
          //			"country_code_iso2": "CN",
          //			"province": "浙江省",
          //			"city": "金华市",
          //			"city_level": 2,
          //			"district": "婺城区",
          //			"town": "",
          //			"adcode": "330702",
          //			"street": "丹溪路",
          //			"street_number": "1133号",
          //			"direction": "附近",
          //			"distance": "19"
          //		},
          //		"pois": [],
          //		"roads": [],
          //		"poiRegions": [{
          //			"direction_desc": "内",
          //			"name": "龙腾创业大厦",
          //			"tag": "房地产;写字楼",
          //			"uid": "1eeed546686dc78fb5147f0b"
          //		}],
          //		"sematic_description": "龙腾创业大厦内,浙江师范大学行知学院实践基地附近32米",
          //		"cityCode": 333
          //	}
          //}


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

                    ARegionName:=AAddressComponentJson.S['street']
                              +AAddressComponentJson.S['street_number']
                              +AAddressComponentJson.S['direction'];



                    if AResultJson.O['result'].Contains('poiRegions')
                      and (AResultJson.O['result'].A['poiRegions'].Length>0) then
                    begin
                      ARegionName:=AResultJson.O['result'].A['poiRegions'].O[0].S['name'];
                    end
                    else
                    begin
                      ARegionName:=AResultJson.O['result'].S['sematic_description'];
                    end;

                    AAddr:=AResultJson.O['result'].S['formatted_address'];
                    ACountry:=AAddressComponentJson.S['country'];
                    AProvince:=AAddressComponentJson.S['province'];
                    ACity:=AAddressComponentJson.S['city'];
                    ADistrict:=AAddressComponentJson.S['district'];
                    ATown:=AAddressComponentJson.S['town'];
                    AShortAddr:=ARegionName;

                    Result:=True;

                end
                else
                begin
                    AAddr:=AResultJson.O['result'].S['formatted_address'];
                    ACountry:='';
                    AProvince:='';
                    ACity:='';
                    ADistrict:='';
                    ATown:='';
                    AShortAddr:=AAddr;

                end;

            end
            else
            begin
              HandleException(nil,'BaiduMapGeocoder geocoder fail code '+IntToStr(AResultJson.I['status']));
            end;
          end;

      except
        on E:Exception do
        begin
          HandleException(E,'BaiduMapGeocoder Error');
        end;
      end;
  finally
    FreeAndNil(NetHTTPClient1);
    FreeAndNil(AResponseStream);
  end;


end;



procedure GoogleMapUriRoutePlan(AStartLocation:TLocation;
                                AEndLocation:TLocation;
                                ARoutePlanType:TRoutePlanType;
                                AStartName:String;
                                AEndName:String);
var
  AUrl:String;
{$IFDEF ANDROID}
var
  Intent:JIntent;
{$ENDIF}
begin
        //IOS下
        {$IFDEF IOS}
        //comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic
        //comgooglemaps://?saddr=Google+Inc,+8th+Avenue,+New+York,+NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York
            //&directionsmode=transit
        //comgooglemaps://?saddr=Google,+1600+Amphitheatre+Parkway,+Mountain+View,+CA+94043&daddr=Google+Inc,+345+Spear+Street,+San+Francisco,+CA
            //&center=37.422185,-122.083898
            //&zoom=10
        //comgooglemaps://?saddr=2025+Garcia+Ave,+Mountain+View,+CA,+USA&daddr=Google,+1600+Amphitheatre+Parkway,+Mountain+View,+CA,+United+States
            //&center=37.423725,-122.0877
            //&directionsmode=walking
            //&zoom=17
        //谷歌官方文档
        //https://developers.google.com/maps/documentation/urls/ios-urlscheme

        AUrl:='comgooglemaps://?'
          +'saddr='+FloatToStr(AStartLocation.Latitude)+','
                  +FloatToStr(AStartLocation.Longitude)
          +'&daddr='+FloatToStr(AEndLocation.Latitude)+','
                  +FloatToStr(AEndLocation.Longitude);

        case ARoutePlanType of
          rptTransit: AUrl:=AUrl+'&directionsmode=transit';
          rptDriving: AUrl:=AUrl+'&directionsmode=driving';
//          rptNavigation: AUrl:=AUrl+'&t=0';
          rptWalking: AUrl:=AUrl+'&directionsmode=walking';
          rptRiding: AUrl:=AUrl+'&directionsmode=bicycling';
        end;
        {$ENDIF}
        {$IFDEF ANDROID}
        //谷歌官方文档
        //https://developers.google.com/maps/documentation/urls/android-intents
        AUrl:='google.navigation:'
              +'q='+FloatToStr(AEndLocation.Latitude)+','
                  +FloatToStr(AEndLocation.Longitude);

        case ARoutePlanType of
//          rptTransit: AUrl:=AUrl+'&mode=t';
          rptDriving: AUrl:=AUrl+'&mode=d';
//          rptNavigation: AUrl:=AUrl+'&t=0';
          rptWalking: AUrl:=AUrl+'&mode=w';
          rptRiding: AUrl:=AUrl+'&mode=b';
        end;
        {$ENDIF}


        {$IFDEF IOS}
        OpenWebBrowserAndNavigateURL(AUrl);
        {$ENDIF}
        {$IFDEF ANDROID}
        Intent := TJIntent.JavaClass.init();
        intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
        intent.setData(
            TJnet_Uri.JavaClass.parse(
                StringToJString(AUrl)
                ));
        intent.setPackage(StringToJString('com.google.android.apps.maps'));

        SharedActivityContext.startActivity(Intent);
        {$ENDIF}
end;


procedure AMapUriRoutePlan(AStartLocation:TLocation;
                          AEndLocation:TLocation;
                          ARoutePlanType:TRoutePlanType;
                          AStartName:String;
                          AEndName:String;
                          ASourceApplicationName:String);
var
  AUrl:String;
{$IFDEF ANDROID}
var
  Intent:JIntent;
{$ENDIF}
begin
        //IOS下
        {$IFDEF IOS}
        //https://www.jianshu.com/p/e4039b5a1a43
        //http://lbs.amap.com/api/amap-mobile/guide/ios/route

        AUrl:='iosamap://path?'
            +'sourceApplication='+ASourceApplicationName;
        {$ENDIF}
        {$IFDEF ANDROID}
        AUrl:='amapuri://route/plan/?';
        {$ENDIF}


        AUrl:=AUrl+'&sid='+'BGVIS1'
            +'&slat='+FloatToStr(AStartLocation.Latitude)
            +'&slon='+FloatToStr(AStartLocation.Longitude)
            +'&sname='+AStartName
            +'&did='+'BGVIS2'
            +'&dlat='+FloatToStr(AEndLocation.Latitude)
            +'&dlon='+FloatToStr(AEndLocation.Longitude)
            +'&dname='+AEndName
            +'&dev=0';


        //t = 0 驾车；
        //t = 1 公交；
        //t = 2 步行；
        //t = 3 骑行（骑行仅在V788以上版本支持）；
        case ARoutePlanType of
          rptTransit: AUrl:=AUrl+'&t=1';
          rptDriving: AUrl:=AUrl+'&t=0';
//          rptNavigation: AUrl:=AUrl+'&t=0';
          rptWalking: AUrl:=AUrl+'&t=2';
          rptRiding: AUrl:=AUrl+'&t=3';
        end;


        {$IFDEF IOS}
        //有中文,需要Url编码
        AUrl:=TIdURI.URLEncode(AUrl);

//        AUrl:='iosamap://path?sourceApplication=applicationName&sid=BGVIS1&slat=39.92848272&slon=116.39560823&sname=A&did=BGVIS2&dlat=39.98848272&dlon=116.47560823&dname=B&dev=0&t=0';
        OpenWebBrowserAndNavigateURL(AUrl);
        {$ENDIF}
        {$IFDEF ANDROID}
        //发送消息
        //act=android.intent.action.VIEW
        //cat=android.intent.category.DEFAULT
        //dat=amapuri://route/plan/?sid=BGVIS1&slat=39.92848272&slon=116.39560823&sname=A&did=BGVIS2&dlat=39.98848272&dlon=116.47560823&dname=B&dev=0&t=0
        //pkg=com.autonavi.minimap
        Intent := TJIntent.JavaClass.init();
        intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
        intent.addCategory(TJIntent.JavaClass.CATEGORY_DEFAULT);
        intent.setData(
            TJnet_Uri.JavaClass.parse(
                StringToJString(AUrl)
                ));
        intent.setPackage(StringToJString('com.autonavi.minimap'));

        SharedActivityContext.startActivity(Intent);
        {$ENDIF}

end;


procedure BaiduMapUriRoutePlan(AStartLocation:TLocation;
                                AEndLocation:TLocation;
                                ARoutePlanType:TRoutePlanType;
                                AStartName:String;
                                AEndName:String;
                                AYourCompanyName:String;
                                AYourAppName:String);
var
  AUrl:String;
begin
        //IOS下
        {$IFDEF IOS}
        //百度官方说明文档
        //http://lbsyun.baidu.com/index.php?title=uri/api/ios
        AUrl:='baidumap://map/direction?';
        {$ENDIF}
        {$IFDEF ANDROID}
        //发送消息
        AUrl:= 'intent://map/direction?';
        {$ENDIF}



        //起点
        if AStartName<>'' then
        begin
          AUrl:=AUrl+'origin='+'name:'+AStartName+'|'
                +'latlng:'
                      +FloatToStr(AStartLocation.Latitude)
                      +','+FloatToStr(AStartLocation.Longitude)
        end
        else
        begin
          AUrl:=AUrl+'origin='+FloatToStr(AStartLocation.Latitude)
                      +','+FloatToStr(AStartLocation.Longitude)
        end;
        //终点
        if AEndName<>'' then
        begin
          AUrl:=AUrl+'&destination='
            +'name:'+AEndName+'|'
                +'latlng:'
                      +FloatToStr(AEndLocation.Latitude)
                      +','+FloatToStr(AEndLocation.Longitude)
        end
        else
        begin
          AUrl:=AUrl+'&destination='
                      +FloatToStr(AEndLocation.Latitude)
                      +','+FloatToStr(AEndLocation.Longitude)
        end;

        //导航模式
        case ARoutePlanType of
          rptTransit: AUrl:=AUrl+'&mode=transit';
          rptDriving: AUrl:=AUrl+'&mode=driving';
//          rptNavigation: AUrl:=AUrl+'&mode=navigation';
          rptWalking: AUrl:=AUrl+'&mode=walking';
          rptRiding: AUrl:=AUrl+'&mode=riding';
        end;




        {$IFDEF IOS}
        //此参数不传值，不保证服务。
        AUrl:=AUrl+'&src=webapp.navi.'+AYourCompanyName+'.'+AYourAppName;
        //有中文,需要Url编码,不然跳转不过去
        AUrl:=TIdURI.URLEncode(AUrl);

//        url:='baidumap://map/direction?origin=34.264642646862,108.95108518068&destination=40.007623,116.360582&mode=driving';
        OpenWebBrowserAndNavigateURL(AUrl);
        {$ENDIF}
        {$IFDEF ANDROID}
        //要加这一段,不然会闪退
        AUrl:=AUrl+'#Intent;'
                    +'scheme=bdapp;'
                    +'package=com.baidu.BaiduMap;'
                    +'end';


//        //Android不用加这一段
//        //有中文,需要Url编码,不然跳转不过去
//        AUrl:=TIdURI.URLEncode(AUrl);

        OpenWebBrowserAndNavigateURL(AUrl);
        {$ENDIF}

end;


function GetGoogleRoutePlan(AStartLocation:TMapAnnotation;
                            AEndLocation:TMapAnnotation;
                            AGoogleAPIKey:String;
                            var AError:String):TMapAnnotationList;
var
  AHttpControl:TSystemHttpControl;
  AResponseStream:TStringStream;
var
  I:Integer;
  J:Integer;
  AMapAnnotation:TMapAnnotation;
  ASuperObject:ISuperObject;
  ASuperArray:ISuperArray;
  AStrartLocationStr:String;
  AEndLocationStr:String;
begin
  AError:='';
  Result:=nil;
  AStrartLocationStr:='';
  AEndLocationStr:='';

  AHttpControl:=TSystemHttpControl.Create;
  AHttpControl.FNetHTTPClient.ConnectionTimeout:=10*1000;  //连接超时-五秒
  AHttpControl.FNetHTTPClient.ResponseTimeout:=10*1000;    //响应超时-五秒
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try
    try
        FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 1');

        //接口说明地址
        //https://maps.googleapis.com/maps/api/directions/json?
        //origin=39.99709957757345,116.31184045225382
        //&destination=39.949158391497214,116.4154639095068
        //&sensor=false
        //&mode=driving

//        if AHttpControl.Get('https://maps.googleapis.com/maps/api/directions/json?'
//            +'mode=driving'
//            +'&origin='+FloatToStr(AStartLocation.Location.ConvertToGCJ02.latitude)
//                      +'%2c'+FloatToStr(AStartLocation.Location.ConvertToGCJ02.longitude)
//            +'&destination='+FloatToStr(AEndLocation.Location.ConvertToGCJ02.latitude)
//                        +'%2c'+FloatToStr(AEndLocation.Location.ConvertToGCJ02.longitude)
//            +'&sensor=true'
//            +'&key='+AGoogleAPIKey
//            +'&mode=driving',
//            AResponseStream
//          ) then

//        if AHttpControl.Get(

        if AStartLocation.User<>'rider' then
        begin
          AStrartLocationStr:=AStartLocation.Addr;
        end
        else
        begin
          AStrartLocationStr:=FloatToStr(AStartLocation.Location.ConvertToGCJ02.latitude)
                      +'%2c'+FloatToStr(AStartLocation.Location.ConvertToGCJ02.longitude);
        end;

        if AEndLocation.User<>'rider' then
        begin
          AEndLocationStr:=AEndLocation.Addr;
        end
        else
        begin
          AEndLocationStr:=FloatToStr(AEndLocation.Location.ConvertToGCJ02.latitude)
                      +'%2c'+FloatToStr(AEndLocation.Location.ConvertToGCJ02.longitude);
        end;

        if AHttpControl.Get(
//            GetWebUrl_From_OrangeUIServer(AHttpControl,
            'https://maps.googleapis.com/maps/api/directions/json?'
            +'origin='+AStrartLocationStr
            +'&destination='+AEndLocationStr
            +'&mode=driving'
            +'&key='+AGoogleAPIKey,//wn
            AResponseStream
            ) then
        begin

            FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 2 '+AResponseStream.DataString);


            ASuperObject:=TSuperObject.Create(AResponseStream.DataString);
            if (ASuperObject.S['status']='OK') then
            begin
                FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 3 OK');

                FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 4 Data'+ASuperObject.AsJSON);
                if ASuperObject.Contains('routes')
                  and (ASuperObject.A['routes'].Length>0)
                  and ASuperObject.A['routes'].O[0].Contains('legs')
                  and (ASuperObject.A['routes'].O[0].A['legs'].Length>0)
                  and ASuperObject.A['routes'].O[0].A['legs'].O[0].Contains('steps') then
                begin

                    FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 5 ');

                    Result:=TMapAnnotationList.Create();

                    //获取路线规划成功
                    ASuperArray:=ASuperObject.A['routes'].O[0].A['legs'].O[0].A['steps'];
                    for I := 0 to ASuperArray.Length-1 do
                    begin

                          if I=0 then
                          begin
                            AMapAnnotation:=TMapAnnotation.Create;
                            AMapAnnotation.Location.gpstype:=TGPSType.gtGCJ02;
                            AMapAnnotation.Location.longitude:=ASuperArray.O[I].O['start_location'].F['lng'];
                            AMapAnnotation.Location.latitude:=ASuperArray.O[I].O['start_location'].F['lat'];
                            Result.Add(AMapAnnotation);
                          end;

                          AMapAnnotation:=TMapAnnotation.Create;
                          AMapAnnotation.Location.gpstype:=TGPSType.gtGCJ02;
                          AMapAnnotation.Location.longitude:=ASuperArray.O[I].O['end_location'].F['lng'];
                          AMapAnnotation.Location.latitude:=ASuperArray.O[I].O['end_location'].F['lat'];
                          Result.Add(AMapAnnotation);

                    end;

                    AMapAnnotation:=TMapAnnotation.Create;
                    AMapAnnotation.Location.gpstype:=TGPSType.gtGCJ02;
                    AMapAnnotation.Location.longitude:=AEndLocation.Location.ConvertToGCJ02.Longitude;
                    AMapAnnotation.Location.latitude:=AEndLocation.Location.ConvertToGCJ02.Latitude;
                    Result.Add(AMapAnnotation);

                end
                else
                begin
                    FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 3 DataStruct is not valid ');
                    //调用失败
                    AError:=AResponseStream.DataString;
                end;
            end
            else if ASuperObject.S['status']='NOT_FOUND' then
            begin
                FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 3 Error ');
                //调用失败
                AError:='NOT_FOUND';
            end
            else
            begin
              //调用失败
               AError:=AResponseStream.DataString;
            end;
        end
        else
        begin

        end;

    except
      on E: Exception do
      begin
        // 异常
        AError:=E.Message;
      end;
    end;
  finally
    FreeAndNil(AHttpControl);
    FreeAndNil(AResponseStream);
  end;


end;

function GetGoogleRouteDistance(AStartLocation:TLocation;
                                AEndLocation:TLocation;
                                AGoogleAPIKey:String;
                                var AError:String;
                                var ADistance:Double):Boolean;
var
  AHttpControl:TSystemHttpControl;
  AResponseStream:TStringStream;
var
  ASuperObject:ISuperObject;
begin
  AError:='';
  ADistance:=0;
  Result:=False;

  //因为蓝灯的问题,先测试
  if DirectoryExists('E:\MyFiles') or DirectoryExists('D:\MyFiles') then
  begin
    ADistance:=1000;
    Result:=True;
    Exit;
  end;


  AHttpControl:=TSystemHttpControl.Create;
  AHttpControl.FNetHTTPClient.ConnectionTimeout:=10*1000;  //连接超时-五秒
  AHttpControl.FNetHTTPClient.ResponseTimeout:=10*1000;    //响应超时-五秒
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try
    try
        FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 1');

        //接口说明地址
        //https://maps.googleapis.com/maps/api/directions/json?
        //origin=39.99709957757345,116.31184045225382
        //&destination=39.949158391497214,116.4154639095068
        //&sensor=false
        //&mode=driving
        if AHttpControl.Get(
//            GetWebUrl_From_OrangeUIServer(AHttpControl,
            'https://maps.googleapis.com/maps/api/directions/json?'
            +'mode=driving'
            +'&origin='+FloatToStr(AStartLocation.ConvertToGCJ02.latitude)
                      +','+FloatToStr(AStartLocation.ConvertToGCJ02.longitude)
            +'&destination='+FloatToStr(AEndLocation.ConvertToGCJ02.latitude)
                        +','+FloatToStr(AEndLocation.ConvertToGCJ02.longitude)
            +'&sensor=false'
            +'&key='+AGoogleAPIKey
            +'&mode=driving',
            AResponseStream
          ) then
        begin

            FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 2 '+AResponseStream.DataString);


          ASuperObject:=TSuperObject.Create(AResponseStream.DataString);
          if (ASuperObject.S['status']='OK') then
          begin
            FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 3 OK');


            if ASuperObject.Contains('routes')
              and (ASuperObject.A['routes'].Length>0)
              and ASuperObject.A['routes'].O[0].Contains('legs')
              and (ASuperObject.A['routes'].O[0].A['legs'].Length>0)
              and ASuperObject.A['routes'].O[0].A['legs'].O[0].Contains('steps') then
            begin
              ADistance:=ASuperObject.A['routes'].O[0].A['legs'].O[0].O['distance'].F['value'];
              Result:=True;
            end
            else
            begin
                FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 3 DataStruct is not valid ');
                //调用失败
                AError:=AResponseStream.DataString;
            end;
          end
          else
          begin
              FMX.Types.Log.d('OrangeUI GetGoogleRoutePlan 3 Error ');
              //调用失败
              AError:=AResponseStream.DataString;
          end;
        end
        else
        begin

        end;

    except
      on E: Exception do
      begin
        // 异常
        AError:=E.Message;
      end;
    end;
  finally
    FreeAndNil(AHttpControl);
    FreeAndNil(AResponseStream);
  end;


end;


function GetBaiduRoutePlan(AStartLocation:TLocation;
                            AEndLocation:TLocation;
                            AStartRegion:String;
                            AEndRegion:String;
                            ABaiduKey:String;
                            var AError:String):TMapAnnotationList;
var
  AHttpControl:TSystemHttpControl;
  AResponseStream:TStringStream;
var
  I:Integer;
  J:Integer;
  AMapAnnotation:TMapAnnotation;
  ASuperObject:ISuperObject;
  ASuperArray:ISuperArray;
  APathStringList:TStringList;
  AGPSStringList:TStringList;
begin
  AError:='';
  Result:=nil;


  APathStringList:=TStringList.Create;
  AGPSStringList:=TStringList.Create;
  AHttpControl:=TSystemHttpControl.Create;
  AHttpControl.FNetHTTPClient.ConnectionTimeout:=10*1000;  //连接超时-五秒
  AHttpControl.FNetHTTPClient.ResponseTimeout:=10*1000;    //响应超时-五秒
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try
    try
        //接口说明地址
        //http://api.map.baidu.com/direction/v1?'
        //    +'mode=driving'
        //    +'&origin=清华大学'
        //    +'&destination=北京大学'
        //    +'&origin_region=北京'
        //    +'&destination_region=北京'
        //    +'&output=json'
        //    +'&ak=您的ak';
        AHttpControl.Get(
//        GetWebUrl_From_OrangeUIServer(AHttpControl,
            'http://api.map.baidu.com/direction/v1?'
            +'mode=driving'
            +'&origin='+FloatToStr(AStartLocation.ConvertToBD09.latitude)
                      +','+FloatToStr(AStartLocation.ConvertToBD09.longitude)
            +'&destination='+FloatToStr(AEndLocation.ConvertToBD09.latitude)
                        +','+FloatToStr(AEndLocation.ConvertToBD09.longitude)
            +'&origin_region='+AStartRegion
            +'&destination_region='+AEndRegion
            //传进去的经纬度格式
            +'$coord_type=bd09ll'


//            //返回的经纬度格式
            +'$ret_coordtype=bd09ll'//非常准

//            +'$ret_coordtype=gcj02'//不准

            +'&output=json'
            +'&ak='+ABaiduKey,
            AResponseStream
          );


        ASuperObject:=TSuperObject.Create(AResponseStream.DataString);
        if (ASuperObject.I['status']=0)
          and (ASuperObject.S['message']='ok') then
        begin

            Result:=TMapAnnotationList.Create();




            if ASuperObject.Contains('result')
              //"routes": null,
              and ASuperObject.O['result'].Contains('routes')
              and (ASuperObject.O['result'].GetType('routes')=varArray)
              and (ASuperObject.O['result'].A['routes'].Length>0)
              and ASuperObject.O['result'].A['routes'].O[0].Contains('steps')
              and (ASuperObject.O['result'].A['routes'].O[0].A['steps'].Length>0) then
            begin

                //获取路线规划成功
                ASuperArray:=ASuperObject.O['result'].A['routes'].O[0].A['steps'];
                for I := 0 to ASuperArray.Length-1 do
                begin


                    APathStringList.Delimiter:=';';
                    APathStringList.DelimitedText:=ASuperArray.O[I].S['path'];


                    for J := 0 to APathStringList.Count -1 do
                    begin
                      AGPSStringList.CommaText:=APathStringList[J];

                      AMapAnnotation:=TMapAnnotation.Create;
                      AMapAnnotation.Location.gpstype:=TGPSType.gtBD09LL;
                      AMapAnnotation.Location.longitude:=StrToFloat(AGPSStringList[0]);
                      AMapAnnotation.Location.latitude:=StrToFloat(AGPSStringList[1]);
                      Result.Add(AMapAnnotation);
                    end;

                end;
            end
            else
            begin
                //调用失败
                FMX.Types.Log.d('OrangeUI GetBaiduRoutePlan 3 DataStruct is not valid ');
                AError:=AResponseStream.DataString;
            end;

        end
        else
        begin
            //调用失败
            FMX.Types.Log.d('OrangeUI GetBaiduRoutePlan 3 Error ');
            AError:=AResponseStream.DataString;
        end;


    except
      on E: Exception do
      begin
        // 异常
        AError:=E.Message;
      end;
    end;
  finally
    FreeAndNil(AHttpControl);
    FreeAndNil(AResponseStream);
    FreeAndNil(APathStringList);
    FreeAndNil(AGPSStringList);
  end;
end;


function GetBaiduRouteDistance(AStartLocation:TLocation;
                               AEndLocation:TLocation;
                               AStartRegion:String;
                               AEndRegion:String;
                               ABaiduKey:String;
                               var AError:String;
                               var ADistance:Double):Boolean;
var
  AHttpControl:TSystemHttpControl;
  AResponseStream:TStringStream;
var
  ASuperObject:ISuperObject;
begin
  AError:='';
  ADistance:=0;
  Result:=False;

  AHttpControl:=TSystemHttpControl.Create;
  AHttpControl.FNetHTTPClient.ConnectionTimeout:=10*1000;  //连接超时-五秒
  AHttpControl.FNetHTTPClient.ResponseTimeout:=10*1000;    //响应超时-五秒
  AResponseStream:=TStringStream.Create('',TEncoding.UTF8);
  try
    try
        //接口说明地址
        //http://api.map.baidu.com/direction/v1?'
        //    +'mode=driving'
        //    +'&origin=清华大学'
        //    +'&destination=北京大学'
        //    +'&origin_region=北京'
        //    +'&destination_region=北京'
        //    +'&output=json'
        //    +'&ak=您的ak';
        AHttpControl.Get(
//        GetWebUrl_From_OrangeUIServer(AHttpControl,
            'http://api.map.baidu.com/direction/v1?'
            +'mode=driving'
            +'&origin='+FloatToStr(AStartLocation.ConvertToBD09.latitude)
                      +','+FloatToStr(AStartLocation.ConvertToBD09.longitude)
            +'&destination='+FloatToStr(AEndLocation.ConvertToBD09.latitude)
                        +','+FloatToStr(AEndLocation.ConvertToBD09.longitude)
            +'&origin_region='+AStartRegion
            +'&destination_region='+AEndRegion
            //传进去的经纬度格式
            +'$coord_type=bd09ll'


//            //返回的经纬度格式
            +'$ret_coordtype=bd09ll'//非常准

//            +'$ret_coordtype=gcj02'//不准

            +'&output=json'
            +'&ak='+ABaiduKey,
            AResponseStream
          );


        ASuperObject:=TSuperObject.Create(AResponseStream.DataString);
        if (ASuperObject.I['status']=0)
          and (ASuperObject.S['message']='ok') then
        begin
          ADistance:=ASuperObject.O['result'].A['routes'].O[0].F['distance'];
          Result:=True;
        end
        else
        begin
          //调用失败
          AError:=AResponseStream.DataString;
        end;


    except
      on E: Exception do
      begin
        // 异常
        AError:=E.Message;
      end;
    end;
  finally
    FreeAndNil(AHttpControl);
    FreeAndNil(AResponseStream);
  end;
end;

function CalcAnnotationListCenter(AMapAnnotationList: TMapAnnotationList): TLocation;
var
  I:Integer;
  AValidCount:Integer;
begin
  //签到轨迹坐标
  Result.longitude:=0;
  Result.latitude:=0;
  AValidCount:=0;
  for I := 0 to AMapAnnotationList.Count-1 do
  begin
    if AMapAnnotationList[I].Location.HasData then
    begin
      Inc(AValidCount);
      Result.GPSType:=AMapAnnotationList[I].Location.GPSType;
      Result.longitude:=Result.longitude+AMapAnnotationList[I].Location.Longitude;
      Result.latitude:=Result.latitude+AMapAnnotationList[I].Location.latitude;
    end;
  end;

  if AValidCount>0 then
  begin
    //取中心点
    Result.longitude:=Result.longitude/AValidCount;
    Result.latitude:=Result.latitude/AValidCount;
  end;

end;


{ TMapAnnotationList }

procedure TMapAnnotationList.AddList(ASrc: TMapAnnotationList);
var
  I: Integer;
  AMapAnnotation:TMapAnnotation;
begin
  for I := 0 to ASrc.Count-1 do
  begin
    AMapAnnotation:=TMapAnnotation.Create;
    AMapAnnotation.Assign(ASrc.Items[I]);
    Self.Add(AMapAnnotation);
  end;
end;

procedure TMapAnnotationList.AssignTo(Dest: TPersistent);
var
  ADest:TMapAnnotationList;
  I: Integer;
  AMapAnnotation:TMapAnnotation;
begin
  ADest:=TMapAnnotationList(Dest);

  ADest.Clear(True);
  for I := 0 to Self.Count-1 do
  begin
    AMapAnnotation:=TMapAnnotation.Create;
    AMapAnnotation.Assign(Items[I]);
    ADest.Add(AMapAnnotation);
  end;
end;

function TMapAnnotationList.GetItem(Index: Integer): TMapAnnotation;
begin
  Result:=TMapAnnotation(Inherited Items[Index]);
end;

{ TMapAnnotation }

procedure TMapAnnotation.AssignTo(Source: TPersistent);
var
  ADest:TMapAnnotation;
begin
  ADest:=TMapAnnotation(Source);

  //位置坐标
  ADest.Location:=Location;
  //标注的名称
  ADest.Name:=Name;
  //详细地址
  ADest.Addr:=Addr;
  //图标的本地路径
  ADest.IconFilePath:=IconFilePath;

  ADest.User:=User;

  ADest.Country:=Country;
  ADest.Province:=Province;
  ADest.City:=City;
  ADest.Area:=Area;

  //镇
  ADest.Town:=Town;
  //短地址,比如丹溪路1171号,比如龙腾创业大厦
  ADest.RegionName:=RegionName;
  ADest.PostCode:=PostCode;


  ADest.StrokeColor:=StrokeColor;     //颜色blue
  ADest.StrokeWeight:=StrokeWeight;   //粗细4
  ADest.StrokeOpacity:=StrokeOpacity; //透明度0.5

end;

procedure TMapAnnotation.Clear;
begin
  //线段
  StrokeColor:=TAlphaColorRec.Blue;//'blue';  //颜色blue
  StrokeWeight:=4;      //粗细4
  StrokeOpacity:=1;//0.5;   //透明度0.5


  //位置坐标
  Location.Clear;
  //标注的名称
  Name:='';
  //详细地址
  Addr:='';

  //区分
  User:='';

  //国家
  Country:='';
  //省份
  Province:='';
  //城市
  City:='';
  //区域
  Area:='';
  //图标的本地路径
  IconFilePath:='';
  //是否需要弹出窗体
  NeedInfoWindow:=False;


end;

constructor TMapAnnotation.Create;
begin
  Clear;
//  //线段
//  StrokeColor:=TAlphaColorRec.Blue;//'blue';  //颜色blue
//  StrokeWeight:=4;      //粗细4
//  StrokeOpacity:=1;//0.5;   //透明度0.5
end;

function TMapAnnotation.IconUrl: String;
begin
  Result:='';
  if IconFilePath<>'' then
  begin
    Result:='file://'+ReplaceStr(IconFilePath,'\','/');
  end;
end;

//{
//	"error_message": "This IP,
//site or mobile application is not authorized to use this API key.
//Request received from IP address 47.74.3.229, with empty referer",
//	"routes": [],
//	"status": "REQUEST_DENIED"
//}


//{
//	"error_message": "API keys with referer restrictions cannot be used with this API.",
//	"routes": [],
//	"status": "REQUEST_DENIED"
//}


//{
//	"geocoded_waypoints": [{
//		"geocoder_status": "OK",
//		"place_id": "ChIJgRKq6J0RSTQRv7R7Ql4wow8",
//		"types": ["street_address"]
//	}, {
//		"geocoder_status": "OK",
//		"place_id": "EkjkuK3lm73mtZnmsZ_nnIHph5HljY7luILlqbrln47ljLrlj4zpvpnljZfooZc5MDTlj7cg6YKu5pS_57yW56CBOiAzMjEwMDAiGxIZChQKEgmN6d7ynhFJNBH4rgiVl1mfghCIBw",
//		"types": ["street_address"]
//	}],

//	"routes": [{
//		"bounds": {
//			"northeast": {
//				"lat": 29.0771959,
//				"lng": 119.651362
//			},
//			"southwest": {
//				"lat": 29.0754152,
//				"lng": 119.6460756
//			}
//		},
//		"copyrights": "Map data ©2018",


//		"legs": [

//    {
//			"distance": {
//				"text": "0.9 km",
//				"value": 930
//			},
//			"duration": {
//				"text": "5 mins",
//				"value": 276
//			},
//			"end_address": "904 Shuang Long Nan Jie, Wucheng Qu, Jinhua Shi, Zhejiang Sheng, China, 321000",
//			"end_location": {
//				"lat": 29.0754152,
//				"lng": 119.6462076
//			},
//			"start_address": "39 Dan Yang Jie, Wucheng Qu, Jinhua Shi, Zhejiang Sheng, China, 321017",
//			"start_location": {
//				"lat": 29.0763425,
//				"lng": 119.648716
//			},



//			"steps": [

//      {
//				"distance": {
//					"text": "30 m",
//					"value": 30
//				},
//				"duration": {
//					"text": "1 min",
//					"value": 5
//				},
//				"end_location": {
//					"lat": 29.0766111,
//					"lng": 119.6486686
//				},
//				"html_instructions": "Head <b>north</b> on <b>丹阳街</b> toward <b>丹溪路</b>",
//				"polyline": {
//					"points": "c~mpDo{gyUu@H"
//				},
//				"start_location": {
//					"lat": 29.0763425,
//					"lng": 119.648716
//				},
//				"travel_mode": "DRIVING"
//			},



//      {
//				"distance": {
//					"text": "0.1 km",
//					"value": 115
//				},
//				"duration": {
//					"text": "1 min",
//					"value": 56
//				},
//				"end_location": {
//					"lat": 29.0754152,
//					"lng": 119.6462076
//				},
//				"html_instructions": "Turn <b>left</b> at <b>双龙南街</b><div style=\"font-size:0.9em\">Destination will be on the right</div>",
//				"maneuver": "turn-left",
//				"polyline": {
//					"points": "m~mpD}kgyULPx@JxBY"
//				},
//				"start_location": {
//					"lat": 29.076387,
//					"lng": 119.6462348
//				},
//				"travel_mode": "DRIVING"
//			}],
//    end of steps



//			"traffic_speed_entry": [],
//			"via_waypoint": []
//		}],
//		"overview_polyline": {
//			"points": "c~mpDo{gyUu@H[iDKqAOSc@{EEm@SBj@hGPnBfArMZnDLPx@JxBY"
//		},
//		"summary": "丹溪路",
//		"warnings": [],
//		"waypoint_order": []
//	}],
//	"status": "OK"
//}




end.

