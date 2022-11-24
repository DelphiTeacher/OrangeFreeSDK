//convert pas to utf8 by ¥
unit uGPSUtils;

interface

uses
  SysUtils,
  Classes,
  uFuncCommon,
  Math;

///**
// * 各地图API坐标系统比较与转换;
// * WGS84坐标系：即地球坐标系,国际上通用的坐标系。设备一般包含GPS芯片或者北斗芯片获取的经纬度为WGS84地理坐标系,
// * 谷歌地图采用的是WGS84地理坐标系（中国范围除外）;
// * GCJ02坐标系：即火星坐标系,是由中国国家测绘局制订的地理信息系统的坐标系统。由WGS84坐标系经加密后的坐标系。
// * 谷歌中国地图和搜搜中国地图采用的是GCJ02地理坐标系; BD09坐标系：即百度坐标系,GCJ02坐标系经加密后的坐标系;
// * 搜狗坐标系、图吧坐标系等,估计也是在GCJ02基础上加密而成的。 chenhua
// */
//public class PositionUtil {
//
//	public static final String BAIDU_LBS_TYPE = "bd09ll";
//
//	public static double pi = 3.1415926535897932384626;
//	public static double a = 6378245.0;
//	public static double ee = 0.00669342162296594323;

const
  pi=3.1415926535897932384626;
  a=6378245.0;
  ee=0.00669342162296594323;
  EARTH_RADIUS = 6378137.0;    //单位M


const
//  a = 6378245.0;
//  ee = 0.00669342162296594323;
  x_pi = 3.14159265358979324 * 3000.0 / 180.0;



const
  CAR_PLATE_PREFIXS=
                  //北京市(京)：
                  '京A、京C、京E、京F、北京市(城区),京G 北京市(远郊区), 京B 出租车,京O 警察,'
                  //天津市(津)：
                  +'津A、津B、津C、天津市,津E 出租车,'
                  //上海市(沪)：
                  +'沪A、沪B、沪D 上海市,沪C 远郊区,'
                  //重庆市(渝)：
                  +'渝A 重庆市区(江南),渝B 重庆市区(江北),渝C 永川区,渝F 万江区,渝G 涪陵区,渝H 黔江区,'
                  //河北省(冀)：
                  +'冀A 石家庄,冀B 唐山,冀C 秦皇岛,冀D 邯郸,冀E 邢台,冀F 保定,冀G 张家口,冀H 承德,冀J 沧州,冀R 廊坊,冀T 衡水,'
                  //河南省(豫)：
                  +'豫A 郑州,豫B 开封,豫C 洛阳,豫D 平顶山,豫E 安阳,豫F 鹤壁,豫G 新乡,豫H 焦作,豫J 濮阳,豫K 许昌,豫L 漯河,豫M 三门峡,豫N 商丘,豫P 周口,豫Q 驻马店,豫R 南阳,豫S 信阳,豫U 济源,'
                  //云南省(云)：
                  +'云A 昆明,云B 东川,云C 昭通,云D 曲靖, 云E 楚雄彝族,云F 玉溪,云G 红河哈尼族,云H 文山壮族苗,云J 思茅,云L 大理白族,云K 西双版纳,云M 保山,云N 德宏傣族,云P 丽江,云Q 怒江僳族,云R 迪庆藏族,云S 临沧,'
                  //辽宁省(辽)：
                  +'辽A 沈阳,辽B 大连,辽C 鞍山,辽D 抚顺,辽E 本溪,辽F 丹东,辽G 锦州,辽H 营口,辽J 阜新,辽K 辽阳,辽L 盘锦,辽M 铁岭,辽N 朝阳,辽P 葫芦岛,辽V 省直机关,'
                  //黑龙江省(黑)：
                  +'黑A 哈尔滨 ,黑B 齐齐哈尔,黑C 牡丹江,黑D 佳木斯,黑E 大庆,黑F 伊春,黑G 鸡西,黑H 鹤岗,黑J 双鸭山,黑K 七台河,黑L 松花江行署,黑M 绥化,黑N 黑河,黑P 大兴安岭,'
                  //湖南省(湘)：
                  +'湘A 长沙,湘B 株洲,湘C 湘潭,湘D 衡阳,湘E 邵阳,湘F 岳阳,湘G 大庸,湘H 益阳,湘J 常德,湘K 娄底,湘L 郴州,湘M 零陵,湘N怀化,湘P 湘西州,'
                  //安徽省(皖)：
                  +'皖A 合肥,皖B 芜湖,皖C 蚌埠,皖D 淮南,皖E 马鞍山,皖F 淮北,皖G 铜陵,皖H 安庆,皖J 黄山,皖K 阜阳,皖L 宿州,皖M 滁州,皖N 六安,皖P 宣城,皖Q 巢湖,皖R 池州,'
                  //山东省(鲁)：
                  +'鲁A 济南,鲁B 青岛,鲁C 淄博,鲁D 枣庄,鲁E 东营,鲁F 烟台,鲁G 潍坊,鲁H 济宁,鲁J 泰安,鲁K 威海,鲁L 日照,鲁M 莱芜,鲁N 德州,鲁P 聊城,鲁Q 临沂,鲁R 菏泽,鲁U 青岛开发区,'
                  //新疆维吾尔(新)：
                  +'新A 乌鲁木齐,新B 昌吉回族,新C 石河子,新D 奎屯,新E 博尔塔拉,新F 伊犁哈萨,新G 塔城,新H 阿勒泰,新J 克拉玛依,新K 吐鲁番, 新L 哈密,新M 巴音郭,新N 阿克苏,新P 克孜勒苏柯,新Q 喀什,新R 和田,'
                  //江苏省(苏)：
                  +'苏A 南京,苏B 无锡,苏C 徐州,苏D 常州,苏E 苏州,苏F 南通,苏G 连云港,苏H 淮阴,苏J 盐城,苏K 扬州,苏L 镇江,苏M 泰州,苏N 宿迁,'
                  //浙江省(浙)：
                  +'浙A 杭州,浙B 宁波,浙C 温州,浙D 绍兴,浙E 湖州,浙F 嘉兴,浙G 金华,浙H 衢州,浙J 台州,浙K 丽水,浙L 舟山,'
                  //江西省(赣)：
                  +'赣A 南昌,赣B 赣州,赣C 宜春,赣D 吉安,赣E 上饶,赣F 抚州,赣G 九江,赣H 景德镇,赣J 萍乡,赣K 新余,赣L 鹰潭,'
                  //湖北省(鄂)：
                  +'鄂A 武汉,鄂B 黄石,鄂C 十堰,鄂D 沙市,鄂E 宜昌,鄂F 襄樊,鄂G 鄂州,鄂H 荆门,鄂J 黄岗,鄂K 孝感,鄂L 咸宁,鄂M 荆州,鄂N 郧阳,鄂P 宜昌,鄂Q 鄂西州,'
                  //广西壮族(桂)：
                  +'桂A 南宁,桂B 柳州,桂C 桂林,桂D 梧州,桂E 北海,桂F 南宁,桂G 柳州,桂H 桂林,桂J 贺州(属梧州),桂K 玉林,桂M 河池,桂L 百色,桂N 钦州,桂P 防城,'
                  //甘肃省(甘)：
                  +'甘A 兰州,甘B 嘉峪关,甘C 金昌,甘D 白银,甘E 天水,甘F 酒泉,甘G 张掖,甘H 武威,甘J 定西,甘K 陇南,甘L 平凉,甘M 庆阳,甘N 临夏回族,甘P 甘南藏族,'
                  //山西省(晋)：
                  +'晋A 太原,晋B 大同,晋C 阳泉,晋D 长治,晋E 晋城,晋F 朔州,晋H 忻州,晋J 吕梁,晋K 晋中,晋L 临汾,晋M 运城,'
                  //内蒙古(蒙)：
                  +'蒙A 呼和浩特,蒙B 包头,蒙C 乌海,蒙D 赤峰,蒙E 呼伦贝尔盟,蒙F 兴安盟,蒙G 锡林郭勒盟,蒙H 乌兰察布盟,蒙J 伊克昭盟,蒙K 巴彦淖尔盟,蒙L 阿拉善盟,'
                  //陕西省(陕)：
                  +'陕A 西安,陕B 铜川,陕C 宝鸡,陕D 威阳,陕E 渭南,陕F 汉中,陕G 安康,陕H 商洛,陕J 延安,陕K 榆林,陕U 省直机关,'
                  //吉林省(吉)：
                  +'吉A 长春,吉B 吉林,吉C 四平,吉D 辽源,吉E 通化,吉F 白山,吉G 白城,吉H 延边朝鲜族,'
                  //福建省(闽)：
                  +'闽A 福州,闽B 莆田,闽C 泉州,闽D 厦门,闽E 漳州,闽F 龙岩,闽G 三明,闽H 南平,闽J 宁德,闽K 省直机关,'
                  //贵州省(贵)：
                  +'贵A 贵阳,贵B 六盘水,贵C 遵义,贵D 铜仁,贵E 黔西南州,贵F 毕节,贵G 安顺,贵H 黔东南州,贵J 黔南州,'
                  //广东省(粤)：
                  +'粤A 广州,粤B 深圳,粤C 珠海,粤D 汕头,粤E 佛山,粤F 韶关,粤G 湛江,粤H 肇庆,粤J 江门,粤K 茂名,粤L 惠州,粤M 梅州,粤N 汕尾,粤P 河源,粤Q 阳江,粤R 清远,粤S 东莞,粤T 中山,粤U 潮州,粤V 揭阳,粤W 云浮,粤X 顺德,粤Y 南海,粤Z港澳进入内地车辆,'
                  //青海省(青)：
                  +'青A 西宁,青B 海东,青C 海北,青D 黄南,青E 海南州,青F 果洛州,青G 玉树州,青H 海西州,'
                  //西藏(藏)：
                  +'藏A 拉萨,藏B 昌都,藏C 山南,藏D 日喀则,藏E 那曲,藏F 阿里,藏G 林芝,'
                  //四川省(川),'
                  +'川A 成都,川B 绵阳,川C 自贡,川D 攀枝花,川E 泸州,川F 德阳,川H 广元,川J 遂宁,川K 内江,川L 乐山,川Q 宜宾,川R 南充,川S 达县,川T 雅安,川U 阿坝藏族,川V 甘孜藏族,川W 凉山彝族,川Z 眉山,'
                  //宁夏回族(宁)
                  +'宁A 银川,宁B 石嘴山,宁C 银南,宁D 固原,'
                  //海南省(琼)：
                  +'琼A 海口,琼B 三亚,琼C 琼北';





type
  TGPSType=(
            //大地坐标
            gtWGS84,
            //国测局加密坐标
            gtGCJ02,
            //百度坐标
            gtBD09LL
            );
//  TLatlngType=(ltWGS84,//GPS
//              ltBD09LL
//              );

//  TGPS=record
//    latitude:Double;
//    longitude:Double;
//  end;


  //坐标
  TLatLng = record
    GPSType:TGPSType;
    Latitude: Double;
    Longitude: Double;
    constructor Create(ALatitude,ALongitude:Double;AGPSType:TGPSType);
    function ConvertToBD09:TLatLng;
    function ConvertToWGS84:TLatLng;
    function ConvertToGCJ02:TLatLng;
    procedure Clear;
    function HasData:Boolean;
    function ToString:String;
  end;
  TGPS=TLatLng;
  TLocation=TLatLng;
  TLocationArray=array of TLocation;
  PLocation=^TLocation;


//  TGPSAddr=record
//    LatLng:TLatLng;
//    //获取到的详细地址信息
//    //"country":"中国","country_code":0,"country_code_iso":"CHN",
//    //"country_code_iso2":"CN","province":"浙江省","city":"金华市",
//    //"city_level":2,"district":"婺城区","town":"","adcode":"330702",
//    //"street":"丹溪路","street_number":"1133号","direction":"附近",
//    //"distance":"13"
//    //国家
//    Country:String;
//    //省
//    Province:String;
//    //市
//    City:String;
//    //区
//    District:String;
//    //镇
//    Town:String;
//    //短地址,比如丹溪路1171号,比如龙腾创业大厦
//    RegionName:String;
//    //长地址,比如浙江省金华市婺城区丹溪路1171号
//    Addr:String;
//  end;



var
  //百度API浏览器类型AK(用于根据GPS获取地址)
  //也用于获取详细地址
  BaiduAPIKey:String;

  GoogleAPIKey:String;



function gps84_To_Gcj02(lat:Double;lon:Double):TGPS;
function gcj_To_Gps84(lat:Double;lon:Double):TGPS;
function gcj02_To_Bd09(gg_lat:Double;gg_lon:Double):TGPS;
function bd09_To_Gcj02(bd_lat:Double;bd_lon:Double):TGPS;
function bd09_To_Gps84(bd_lat:Double;bd_lon:Double):TGPS;
function outOfChina(lat:Double;lon:Double):Boolean;
function transform(lat:Double;lon:Double):TGPS;
function transformLat(x:Double;y:Double):Double;
function transformLon(x:Double;y:Double):Double;
//根据经纬度获取两地距离
function getRad(d: Double): Double;
function GetFlatternDistance(lat1, lng1, lat2, lng2: Double): Double;


procedure Gps_Gcj02(wgLat,wgLon:double;var mgLat,mgLon:double);   // gps转火星
procedure Gcj02_bd09ll(gg_lat, gg_lon:double;var bd_lat,bd_lon:double) ;    //火星转百度
procedure bd09ll_Gcj02(bd_lat, bd_lon:double;var gg_lat, gg_lon:double);     //百度转火星
//function GetFlatternDistance(lat1, lng1, lat2, lng2: Double): Double;   //获取两点距离 单位米


{$IF CompilerVersion > 21.0} // XE or older
//根据城市获取到车牌号的前缀,金华->浙G,杭州->浙A
function GetCarPlatePrefixByCity(ACity:String):String;
{$IFEND}



implementation

var
  GlobalCarPlatePrefixList:TStringList;

{$IF CompilerVersion > 21.0} // XE or older
function GetCarPlatePrefixByCity(ACity:String):String;
var
  I: Integer;
begin
  Result:='';
  if GlobalCarPlatePrefixList=nil then
  begin
    GlobalCarPlatePrefixList:=TStringList.Create;
    GlobalCarPlatePrefixList.StrictDelimiter:=True;
    GlobalCarPlatePrefixList.DelimitedText:=CAR_PLATE_PREFIXS;
  end;
  ACity:=ACity.Replace('市','');
  for I := 0 to GlobalCarPlatePrefixList.Count-1 do
  begin
    if GlobalCarPlatePrefixList[I].IndexOf(ACity)<>-1 then
    begin
      //闽B 莆田
      Result:=GlobalCarPlatePrefixList[I].Substring(0,2);
      Break;
    end;
  end;
end;
{$IFEND}




//	/**
//	 * 84 to 火星坐标系 (GCJ-02) World Geodetic System ==> Mars Geodetic System
//	 *
//	 * @param lat
//	 * @param lon
//	 * @return
//	 */
//	public static Gps gps84_To_Gcj02(double lat, double lon) {
//		if (outOfChina(lat, lon)) {
//			return null;
//		}
//		double dLat = transformLat(lon - 105.0, lat - 35.0);
//		double dLon = transformLon(lon - 105.0, lat - 35.0);
//		double radLat = lat / 180.0 * pi;
//		double magic = Math.sin(radLat);
//		magic = 1 - ee * magic * magic;
//		double sqrtMagic = Math.sqrt(magic);
//		dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
//		dLon = (dLon * 180.0) / (a / sqrtMagic * Math.cos(radLat) * pi);
//		double mgLat = lat + dLat;
//		double mgLon = lon + dLon;
//		return new Gps(mgLat, mgLon);
//	}
  function gps84_To_Gcj02(lat:Double;lon:Double):TGPS;
  var
    dLat:Double;
    dLon:Double;
    radLat:Double;
    magic:Double;
    sqrtMagic:Double;
  begin
      if IsSameDouble(lat,0) and IsSameDouble(lon,0) then
      begin
        Result.Latitude:=0;
        Result.Longitude:=0;
        Exit;
      end;

      if (outOfChina(lat, lon)) then
      begin
        Result.Latitude:=0;
        Result.Longitude:=0;
      end;
		 dLat := transformLat(lon - 105.0, lat - 35.0);
		 dLon := transformLon(lon - 105.0, lat - 35.0);
		 radLat := lat / 180.0 * pi;
		 magic := sin(radLat);
		magic := 1 - ee * magic * magic;
		 sqrtMagic := Math.Power(magic,0.5);
		dLat := (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
		dLon := (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * pi);
		Result.Latitude := lat + dLat;
		Result.Longitude := lon + dLon;
  end;


//	/**
//	 * * 火星坐标系 (GCJ-02) to 84 * * @param lon * @param lat * @return
//	 * */
//	public static Gps gcj_To_Gps84(double lat, double lon) {
//		Gps gps = transform(lat, lon);
//		double lontitude = lon * 2 - gps.getWgLon();
//		double Latitude = lat * 2 - gps.getWgLat();
//		return new Gps(Latitude, lontitude);
//	}
  function gcj_To_Gps84(lat:Double;lon:Double):TGPS;
  var
    gps:TGPS;
  begin
    if IsSameDouble(lat,0) and IsSameDouble(lon,0) then
    begin
      Result.Latitude:=0;
      Result.Longitude:=0;
      Exit;
    end;

    gps:=transform(lat, lon);
    Result.Longitude:=lon * 2 - gps.Longitude;
    Result.Latitude:=lat * 2 - gps.Latitude;
  end;



//	/**
//	 * 火星坐标系 (GCJ-02) 与百度坐标系 (BD-09) 的转换算法 将 GCJ-02 坐标转换成 BD-09 坐标
//	 *
//	 * @param gg_lat
//	 * @param gg_lon
//	 */
//	public static Gps gcj02_To_Bd09(double gg_lat, double gg_lon) {
//		double x = gg_lon, y = gg_lat;
//		double z = Math.sqrt(x * x + y * y) + 0.00002 * Math.sin(y * pi);
//		double theta = Math.atan2(y, x) + 0.000003 * Math.cos(x * pi);
//		double bd_lon = z * Math.cos(theta) + 0.0065;
//		double bd_lat = z * Math.sin(theta) + 0.006;
//		return new Gps(bd_lat, bd_lon);
//	}
  function gcj02_To_Bd09(gg_lat:Double;gg_lon:Double):TGPS;
  var
    x:Double;
    y:Double;
    z:Double;
    theta:Double;
  begin
      if IsSameDouble(gg_lat,0) and IsSameDouble(gg_lon,0) then
      begin
        Result.Latitude:=0;
        Result.Longitude:=0;
        Exit;
      end;

      x := gg_lon;
      y := gg_lat;
      z := Math.Power(x * x + y * y,0.5) + 0.00002 * sin(y * pi);
      theta := Math.ArcTan2(y, x) + 0.000003 * cos(x * pi);
      Result.Longitude:=z * cos(theta) + 0.0065;
      Result.Latitude:=z * sin(theta) + 0.006;
  end;




//	/**
//	 * * 火星坐标系 (GCJ-02) 与百度坐标系 (BD-09) 的转换算法 * * 将 BD-09 坐标转换成GCJ-02 坐标 * * @param
//	 * bd_lat * @param bd_lon * @return
//	 */
//	public static Gps bd09_To_Gcj02(double bd_lat, double bd_lon) {
//		double x = bd_lon - 0.0065, y = bd_lat - 0.006;
//		double z = Math.sqrt(x * x + y * y) - 0.00002 * Math.sin(y * pi);
//		double theta = Math.atan2(y, x) - 0.000003 * Math.cos(x * pi);
//		double gg_lon = z * Math.cos(theta);
//		double gg_lat = z * Math.sin(theta);
//		return new Gps(gg_lat, gg_lon);
//	}
  function bd09_To_Gcj02(bd_lat:Double;bd_lon:Double):TGPS;
  var
    x:Double;
    y:Double;
    z:Double;
    theta:Double;
  begin
    if IsSameDouble(bd_lat,0) and IsSameDouble(bd_lon,0) then
    begin
      Result.Latitude:=0;
      Result.Longitude:=0;
      Exit;
    end;


		x := bd_lon - 0.0065;
     y := bd_lat - 0.006;
		 z := Math.Power(x * x + y * y,0.5) - 0.00002 * sin(y * pi);
		 theta := Math.ArcTan2(y, x) - 0.000003 * cos(x * pi);
    Result.Longitude:=z * cos(theta);
    Result.Latitude:=z * sin(theta);
  end;


//	/**
//	 * (BD-09)-->84
//	 * @param bd_lat
//	 * @param bd_lon
//	 * @return
//	 */
//	public static Gps bd09_To_Gps84(double bd_lat, double bd_lon) {
//
//		Gps gcj02 = PositionUtil.bd09_To_Gcj02(bd_lat, bd_lon);
//		Gps map84 = PositionUtil.gcj_To_Gps84(gcj02.getWgLat(),
//				gcj02.getWgLon());
//		return map84;
//
//	}
  function bd09_To_Gps84(bd_lat:Double;bd_lon:Double):TGPS;
  var
    gcj02:TGPS;
  begin
    if IsSameDouble(bd_lat,0) and IsSameDouble(bd_lon,0) then
    begin
      Result.Latitude:=0;
      Result.Longitude:=0;
      Exit;
    end;


    gcj02:=bd09_To_Gcj02(bd_lat, bd_lon);
    Result:=gcj_To_Gps84(gcj02.Latitude,gcj02.Longitude);
  end;


////	public static boolean outOfChina(double lat, double lon) {
////		if (lon < 72.004 || lon > 137.8347)
////			return true;
////		if (lat < 0.8293 || lat > 55.8271)
////			return true;
////		return false;
////	}
//  function outOfChina(lat:Double;lon:Double):Boolean;
//  begin
//		Result:= false;
//		if (lon < 72.004) or (lon > 137.8347) then
//			Result:= true;
//		if (lat < 0.8293) or (lat > 55.8271) then
//			Result:= true;
//
//  end;
//
//
////	public static Gps transform(double lat, double lon) {
////		if (outOfChina(lat, lon)) {
////			return new Gps(lat, lon);
////		}
////		double dLat = transformLat(lon - 105.0, lat - 35.0);
////		double dLon = transformLon(lon - 105.0, lat - 35.0);
////		double radLat = lat / 180.0 * pi;
////		double magic = Math.sin(radLat);
////		magic = 1 - ee * magic * magic;
////		double sqrtMagic = Math.sqrt(magic);
////		dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
////		dLon = (dLon * 180.0) / (a / sqrtMagic * Math.cos(radLat) * pi);
////		double mgLat = lat + dLat;
////		double mgLon = lon + dLon;
////		return new Gps(mgLat, mgLon);
////	}

  function transform(lat:Double;lon:Double):TGPS;
  var
    dLat:Double;
    dLon:Double;
    radLat:Double;
    magic:Double;
    sqrtMagic:Double;
  begin
      if (outOfChina(lat, lon)) then
      begin
        Result.Latitude:=0;
        Result.Longitude:=0;
      end;
      dLat := transformLat(lon - 105.0, lat - 35.0);
       dLon := transformLon(lon - 105.0, lat - 35.0);
       radLat := lat / 180.0 * pi;
       magic := sin(radLat);
      magic := 1 - ee * magic * magic;
       sqrtMagic := Math.Power(magic,0.5);
      dLat := (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
      dLon := (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * pi);


       Result.Latitude:=lat + dLat;
       Result.Longitude:=lon + dLon;
  end;


////	public static double transformLat(double x, double y) {
////		double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y
////				+ 0.2 * Math.sqrt(Math.abs(x));
////		ret += (20.0 * Math.sin(6.0 * x * pi) + 20.0 * Math.sin(2.0 * x * pi)) * 2.0 / 3.0;
////		ret += (20.0 * Math.sin(y * pi) + 40.0 * Math.sin(y / 3.0 * pi)) * 2.0 / 3.0;
////		ret += (160.0 * Math.sin(y / 12.0 * pi) + 320 * Math.sin(y * pi / 30.0)) * 2.0 / 3.0;
////		return ret;
////	}
//  function transformLat(x:Double;y:Double):Double;
//  begin
//		 Result := -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y
//				+ 0.2 * Math.Power(ABS(x),0.5);
//		Result :=Result+ (20.0 * sin(6.0 * x * pi) + 20.0 * sin(2.0 * x * pi)) * 2.0 / 3.0;
//		Result :=Result+ (20.0 * sin(y * pi) + 40.0 * sin(y / 3.0 * pi)) * 2.0 / 3.0;
//		Result :=Result+ (160.0 * sin(y / 12.0 * pi) + 320 * sin(y * pi / 30.0)) * 2.0 / 3.0;
//
//  end;
//
//
////	public static double transformLon(double x, double y) {
////		double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1
////				* Math.sqrt(Math.abs(x));
////		ret += (20.0 * Math.sin(6.0 * x * pi) + 20.0 * Math.sin(2.0 * x * pi)) * 2.0 / 3.0;
////		ret += (20.0 * Math.sin(x * pi) + 40.0 * Math.sin(x / 3.0 * pi)) * 2.0 / 3.0;
////		ret += (150.0 * Math.sin(x / 12.0 * pi) + 300.0 * Math.sin(x / 30.0
////				* pi)) * 2.0 / 3.0;
////		return ret;
////	}
//  function transformLon(x:Double;y:Double):Double;
//  begin
//		 Result := 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1
//				* Math.Power(abs(x),0.5);
//		Result :=Result+ (20.0 * sin(6.0 * x * pi) + 20.0 * sin(2.0 * x * pi)) * 2.0 / 3.0;
//		Result :=Result+ (20.0 * sin(x * pi) + 40.0 * sin(x / 3.0 * pi)) * 2.0 / 3.0;
//		Result :=Result+ (150.0 * sin(x / 12.0 * pi) + 300.0 * sin(x / 30.0
//				* pi)) * 2.0 / 3.0;
//  end;

//	public static void main(String[] args) {
//
//		// 北斗芯片获取的经纬度为WGS84地理坐标 31.426896,119.496145
//		Gps gps = new Gps(31.426896, 119.496145);
//		System.out.println("gps :" + gps);
//		Gps gcj = gps84_To_Gcj02(gps.getWgLat(), gps.getWgLon());
//		System.out.println("gcj :" + gcj);
//		Gps star = gcj_To_Gps84(gcj.getWgLat(), gcj.getWgLon());
//		System.out.println("star:" + star);
//		Gps bd = gcj02_To_Bd09(gcj.getWgLat(), gcj.getWgLon());
//		System.out.println("bd  :" + bd);
//		Gps gcj2 = bd09_To_Gcj02(bd.getWgLat(), bd.getWgLon());
//		System.out.println("gcj :" + gcj2);
//	}
//}
function getRad(d: Double): Double;
begin
  Result := d * PI / 180.0;
end;

function GetFlatternDistance(lat1, lng1, lat2, lng2: Double): Double;
var
  f, g, l: Double;
  sg, sl, sf: Double;
  s, c, w, r, d, h1, h2: Double;
  a, fl: Double;
begin
  Result:=-1;
  try
    f := getRad((lat1 + lat2)/2);
    g := getRad((lat1 - lat2)/2);
    l := getRad((lng1 - lng2)/2);

    sg := sin(g);
    sl := sin(l);
    sf := sin(f);

    a := EARTH_RADIUS;
    fl := 1/298.257;

    sg := sg*sg;
    sl := sl*sl;
    sf := sf*sf;

    s := sg*(1-sl) + (1-sf)*sl;
    c := (1-sg)*(1-sl) + sf*sl;

    w := ArcTan(sqrt(s/c));
    r := sqrt(s*c)/w;
    d := 2 * w * a;
    h1 := (3*r -1)/2/c;
    h2 := (3*r +1)/2/s;

    Result := d*(1 + fl*(h1*sf*(1-sg) - h2*(1-sf)*sg));
  except

  end;
end;






//************************************************************************************
function outOfChina(lat,lon:double):boolean;
begin
  if ((lon < 72.004) or (lon > 137.8347)) then
    result:=true
  else if ((lat < 0.8293) or (lat > 55.8271)) then
    result:=true
  else
    result:=false;
end;
function transformLat(x,y:double):double;
var
  ret:double;
begin
  ret := -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * Sqrt(Abs(x));
  ret:=ret+ (20.0 * Sin(6.0 * x * pi) + 20.0 * Sin(2.0 * x * pi)) * 2.0 / 3.0;
  ret:=ret+ (20.0 * Sin(y * pi) + 40.0 * Sin(y / 3.0 * pi)) * 2.0 / 3.0;
  ret:=ret+ (160.0 * Sin(y / 12.0 * pi) + 320 * Sin(y * pi / 30.0)) * 2.0 / 3.0;
  result:=ret;
end;
function transformLon(x,y:double):double;
var
  ret:double;
begin
  ret := 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * Sqrt(Abs(x));
  ret:=ret+ (20.0 * Sin(6.0 * x * pi) + 20.0 * Sin(2.0 * x * pi)) * 2.0 / 3.0;
  ret:=ret+ (20.0 * Sin(x * pi) + 40.0 * Sin(x / 3.0 * pi)) * 2.0 / 3.0;
  ret:=ret+ (150.0 * Sin(x / 12.0 * pi) + 300.0 * Sin(x / 30.0 * pi)) * 2.0 / 3.0;
  result:=ret;
end;


procedure Gps_Gcj02(wgLat,wgLon:double;var mgLat,mgLon:double);  //gps转火星
var
  dLat,dLon,radLat,magic,sqrtMagic:double;
begin
    if outOfChina(wgLat, wgLon) then
    begin
        mgLat := wgLat;
        mgLon := wgLon;
        exit;
    end;
    dLat := transformLat(wgLon - 105.0, wgLat - 35.0);
    dLon := transformLon(wgLon - 105.0, wgLat - 35.0);
    radLat := wgLat / 180.0 * pi;
    magic := Sin(radLat);
    magic := 1 - ee * magic * magic;
    sqrtMagic := Sqrt(magic);
    dLat := (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
    dLon := (dLon * 180.0) / (a / sqrtMagic * Cos(radLat) * pi);
    mgLat := wgLat + dLat;
    mgLon := wgLon + dLon;
end;
//************************************************************************************
procedure Gcj02_bd09ll(gg_lat, gg_lon:double;var bd_lat,bd_lon:double) ; //火星转百度
var
  x,y,z,theta:double;
begin
  x := gg_lon;
  y := gg_lat;
  z := sqrt(x * x + y * y) + 0.00002 * sin(y * x_pi);
  theta := arctan2(y, x) + 0.000003 * cos(x * x_pi);
  bd_lon := z * cos(theta) + 0.0065;
  bd_lat := z * sin(theta) + 0.006;
end;
procedure bd09ll_Gcj02(bd_lat, bd_lon:double;var gg_lat, gg_lon:double);   //百度转火星
var
  x,y,z,theta:double;
begin
  x := bd_lon - 0.0065;
  y := bd_lat - 0.006;
  z := sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
  theta := arctan2(y, x) - 0.000003 * cos(x * x_pi);
  gg_lon := z * cos(theta);
  gg_lat := z * sin(theta);
end;



////************************************************************************************
//function GetFlatternDistance(lat1, lng1, lat2, lng2: Double): Double;      //计算两个坐标的距离
//function getRad(d: Double): Double;
//begin
//  Result := d * PI / 180.0;
//end;
//const
//  EARTH_RADIUS = 6378137.0;    //单位M
//var
//  f, g, l: Double;
//  sg, sl, sf: Double;
//  s, c, w, r, d, h1, h2: Double;
//  a, fl: Double;
//begin
//  if (lat1=lat2) and (lng1=lng2) then
//    result:=0
//  else
//  begin
//    f := getRad((lat1 + lat2)/2);
//    g := getRad((lat1 - lat2)/2);
//    l := getRad((lng1 - lng2)/2);
//
//    sg := sin(g);
//    sl := sin(l);
//    sf := sin(f);
//
//    a := EARTH_RADIUS;
//    fl := 1/298.257;
//
//    sg := sg*sg;
//    sl := sl*sl;
//    sf := sf*sf;
//
//    s := sg*(1-sl) + (1-sf)*sl;
//    c := (1-sg)*(1-sl) + sf*sl;
//
//    w := ArcTan(sqrt(s/c));
//    r := sqrt(s*c)/w;
//    d := 2 * w * a;
//    h1 := (3*r -1)/2/c;
//    h2 := (3*r +1)/2/s;
//
//    Result := d*(1 + fl*(h1*sf*(1-sg) - h2*(1-sf)*sg));
//  end;
//end;




{ TLatLng }

procedure TLatLng.Clear;
begin
  Longitude:=0;
  Latitude:=0;
end;

function TLatLng.ConvertToBD09: TLatLng;
begin
  case Self.GPSType of
    gtWGS84:
    begin
      Result:=gps84_To_Gcj02(Self.Latitude,Self.Longitude);
      Result:=gcj02_To_Bd09(Result.Latitude,Result.Longitude);
    end;
    gtGCJ02: Gcj02_bd09ll(Self.Latitude,Self.Longitude,Result.Latitude,Result.Longitude);
    gtBD09LL: Result:=Self;
  end;
  Result.GPSType:=gtBD09LL;
end;

function TLatLng.ConvertToGCJ02: TLatLng;
begin
  case Self.GPSType of
    gtWGS84:
    begin
      Result:=gps84_To_Gcj02(Self.Latitude,Self.Longitude);
    end;
    gtGCJ02:
    begin
      Result:=Self;
    end;
    gtBD09LL:
    begin
      Result:=bd09_To_Gcj02(Self.Latitude,Self.Longitude);
    end;
  end;
  Result.GPSType:=gtGCJ02;
end;

function TLatLng.ConvertToWGS84: TLatLng;
begin
  case Self.GPSType of
    gtWGS84:
    begin
      Result:=Self;
    end;
    gtGCJ02:
    begin
      Result:=gcj_To_Gps84(Self.Latitude,Self.Longitude);
    end;
    gtBD09LL:
    begin
      Result:=bd09_To_Gps84(Self.Latitude,Self.Longitude);
    end;
  end;
  Result.GPSType:=gtWGS84;
end;

constructor TLatLng.Create(ALatitude, ALongitude: Double;AGPSType:TGPSType);
begin
  GPSType:=AGPSType;
  Latitude:=ALatitude;
  Longitude:=ALongitude;
end;

function TLatLng.HasData: Boolean;
begin
  //有负数,要取绝对值
  Result:=(ABS(Longitude)>0.1)
          and (ABS(Latitude)>0.1);
end;

function TLatLng.ToString: String;
begin
  Result:=FloatToStr(Longitude)+','
          +FloatToStr(Latitude);
end;


initialization
  //显示轨迹
  BaiduAPIKey:='8dlnIKumxm6hAhkxs7OyCrg3';

  //丁丽花申请的账号:
  GoogleAPIKey:='AIzaSyBAkDSJ00aWcoJ1MIFmK_uqEb_sNRM7ePI'; //原Key
  //王能的账号申请的:ggggcexx@googlemail.com
//  GoogleAPIKey:='AIzaSyCf4AmT8hO376pF6-NX21ll56eGoM8gCas'; //新申请的Key



finalization
  FreeAndNil(GlobalCarPlatePrefixList);


end.
