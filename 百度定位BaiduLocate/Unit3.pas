unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,

//  uFuncCommon,


  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNI.App,
  FMX.Helpers.Android,
  Androidapi.JNI.Os,
    {$IF RTLVersion>=33}// 10.3+
    System.Permissions, // 动态权限单元
    {$ENDIF}


  Androidapi.JNI.Location,
  Androidapi.JNI.BaiduLBS_Android,
  {$ENDIF}


  FMX.Controls.Presentation, FMX.StdCtrls, System.Sensors,
  System.Sensors.Components, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.Edit;

type
  TJBDLocationListener=class(TJavaLocal,JBDLocationListener)
    procedure onReceiveLocation(P1: JBDLocation); cdecl;
  end;


  TForm3 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    edtScanSpan: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    locationClient:JLocationClient;
    locationOption:JLocationClientOption;
    myLocationListener:JBDLocationListener;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
  TJLocationClient.JavaClass.setAgreePrivacy(true);
  //setAgreePrivacy接口需要在LocationClient实例化之前调用
  //如果setAgreePrivacy接口参数设置为了false，则定位功能不会实现
  //true，表示用户同意隐私合规政策
  //false，表示用户不同意隐私合规政策



  ///**
  //* 初始化定位参数配置
  //*/

  //定位服务的客户端。宿主程序在客户端声明此类，并调用，目前只支持在主线程中启动
  locationClient := TJLocationClient.JavaClass.init(TAndroidHelper.Context.getApplicationContext());
  //声明LocationClient类实例并配置定位参数
  locationOption := TJLocationClientOption.Create;
  myLocationListener := TJBDLocationListener.Create();
  //注册监听函数
  locationClient.registerLocationListener(myLocationListener);

  //可选，默认高精度，设置定位模式，高精度，低功耗，仅设备
  locationOption.setLocationMode(TJLocationClientOption_LocationMode.JavaClass.Hight_Accuracy);
  //可选，默认gcj02，设置返回的定位结果坐标系，如果配合百度地图使用，建议设置为bd09ll;
  locationOption.setCoorType(StringToJString('gcj02'));
  //可选，默认0，即仅定位一次，设置发起连续定位请求的间隔需要大于等于1000ms才是有效的
  locationOption.setScanSpan(1000);
  //可选，设置是否需要地址信息，默认不需要
//  locationOption.setIsNeedAddress(true);
  //可选，设置是否需要地址描述
//  locationOption.setIsNeedLocationDescribe(true);
  //可选，设置是否需要设备方向结果
  locationOption.setNeedDeviceDirect(false);
//  //可选，默认false，设置是否当卫星定位有效时按照1S1次频率输出卫星定位结果
//  locationOption.setLocationNotify(true);
  //可选，默认true，定位SDK内部是一个SERVICE，并放到了独立进程，设置是否在stop的时候杀死这个进程，默认不杀死
  locationOption.setIgnoreKillProcess(true);
//  //可选，默认false，设置是否需要位置语义化结果，可以在BDLocation.getLocationDescribe里得到，结果类似于“在北京天安门附近”
//  locationOption.setIsNeedLocationDescribe(true);
//  //可选，默认false，设置是否需要POI结果，可以在BDLocation.getPoiList里得到
//  locationOption.setIsNeedLocationPoiList(true);
  //可选，默认false，设置是否收集CRASH信息，默认收集
  locationOption.SetIgnoreCacheException(false);
  //可选，默认false，设置是否开启卫星定位
  locationOption.setOpenGnss(true);
  //可选，默认false，设置定位时是否需要海拔信息，默认不需要，除基础定位版本都可用
  locationOption.setIsNeedAltitude(false);
  //设置打开自动回调位置模式，该开关打开后，期间只要定位SDK检测到位置变化就会主动回调给开发者，该模式下开发者无需再关心定位间隔是多少，定位SDK本身发现位置变化就会及时回调给开发者
  //locationOption.setOpenAutoNotifyMode();
  //设置打开自动回调位置模式，该开关打开后，期间只要定位SDK检测到位置变化就会主动回调给开发者
  //locationOption.setOpenAutoNotifyMode(3000,1, TJLocationClientOption.JavaClass.LOC_SENSITIVITY_HIGHT);
  //需将配置好的LocationClientOption对象，通过setLocOption方法传递给LocationClient对象使用
  locationClient.setLocOption(locationOption);
  //开始定位
  locationClient.start();

end;



{ TJBDLocationListener }

procedure TJBDLocationListener.onReceiveLocation(P1: JBDLocation);
begin
  FMX.Types.Log.d('OrangeUI TJBDLocationListener.onReceiveLocation');

  //此处的BDLocation为定位结果信息类，通过它的各种get方法可获取定位相关的全部结果
  //以下只列举部分获取经纬度相关（常用）的结果信息
  //更多结果信息获取说明，请参照类参考中BDLocation类中的说明

//  //获取纬度信息
//  double latitude = location.getLatitude();
//  //获取经度信息
//  double longitude = location.getLongitude();
//  //获取定位精度，默认值为0.0f
//  float radius = location.getRadius();
//  //获取经纬度坐标类型，以LocationClientOption中设置过的坐标类型为准
//  String coorType = location.getCoorType();
//  //获取定位类型、定位错误返回码，具体信息可参照类参考中BDLocation类中的说明
//  int errorCode = location.getLocType();

  TThread.Synchronize(nil,procedure
  begin
    Form3.Memo1.Lines.Insert(0,DateTimeToStr(Now)+' '+FloatToStr(P1.getLatitude)+','+FloatToStr(P1.getLongitude));
  end);


end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  locationOption.setScanSpan(StrToInt(Self.edtScanSpan.Text)*1000);
  //需将配置好的LocationClientOption对象，通过setLocOption方法传递给LocationClient对象使用
  locationClient.setLocOption(locationOption);

end;

procedure TForm3.FormShow(Sender: TObject);
begin
  //申请权限
  {$IFDEF ANDROID}
  PermissionsService.RequestPermissions
      ([JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION),
      JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION),
      'android.permission.ACCESS_BACKGROUND_LOCATION'
        ],
    nil);
  {$ENDIF}


end;

end.
