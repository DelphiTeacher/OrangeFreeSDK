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
    System.Permissions, // ��̬Ȩ�޵�Ԫ
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
  //setAgreePrivacy�ӿ���Ҫ��LocationClientʵ����֮ǰ����
  //���setAgreePrivacy�ӿڲ�������Ϊ��false����λ���ܲ���ʵ��
  //true����ʾ�û�ͬ����˽�Ϲ�����
  //false����ʾ�û���ͬ����˽�Ϲ�����



  ///**
  //* ��ʼ����λ��������
  //*/

  //��λ����Ŀͻ��ˡ����������ڿͻ����������࣬�����ã�Ŀǰֻ֧�������߳�������
  locationClient := TJLocationClient.JavaClass.init(TAndroidHelper.Context.getApplicationContext());
  //����LocationClient��ʵ�������ö�λ����
  locationOption := TJLocationClientOption.Create;
  myLocationListener := TJBDLocationListener.Create();
  //ע���������
  locationClient.registerLocationListener(myLocationListener);

  //��ѡ��Ĭ�ϸ߾��ȣ����ö�λģʽ���߾��ȣ��͹��ģ����豸
  locationOption.setLocationMode(TJLocationClientOption_LocationMode.JavaClass.Hight_Accuracy);
  //��ѡ��Ĭ��gcj02�����÷��صĶ�λ�������ϵ�������ϰٶȵ�ͼʹ�ã���������Ϊbd09ll;
  locationOption.setCoorType(StringToJString('gcj02'));
  //��ѡ��Ĭ��0��������λһ�Σ����÷���������λ����ļ����Ҫ���ڵ���1000ms������Ч��
  locationOption.setScanSpan(1000);
  //��ѡ�������Ƿ���Ҫ��ַ��Ϣ��Ĭ�ϲ���Ҫ
//  locationOption.setIsNeedAddress(true);
  //��ѡ�������Ƿ���Ҫ��ַ����
//  locationOption.setIsNeedLocationDescribe(true);
  //��ѡ�������Ƿ���Ҫ�豸������
  locationOption.setNeedDeviceDirect(false);
//  //��ѡ��Ĭ��false�������Ƿ����Ƕ�λ��Чʱ����1S1��Ƶ��������Ƕ�λ���
//  locationOption.setLocationNotify(true);
  //��ѡ��Ĭ��true����λSDK�ڲ���һ��SERVICE�����ŵ��˶������̣������Ƿ���stop��ʱ��ɱ��������̣�Ĭ�ϲ�ɱ��
  locationOption.setIgnoreKillProcess(true);
//  //��ѡ��Ĭ��false�������Ƿ���Ҫλ�����廯�����������BDLocation.getLocationDescribe��õ�����������ڡ��ڱ����찲�Ÿ�����
//  locationOption.setIsNeedLocationDescribe(true);
//  //��ѡ��Ĭ��false�������Ƿ���ҪPOI�����������BDLocation.getPoiList��õ�
//  locationOption.setIsNeedLocationPoiList(true);
  //��ѡ��Ĭ��false�������Ƿ��ռ�CRASH��Ϣ��Ĭ���ռ�
  locationOption.SetIgnoreCacheException(false);
  //��ѡ��Ĭ��false�������Ƿ������Ƕ�λ
  locationOption.setOpenGnss(true);
  //��ѡ��Ĭ��false�����ö�λʱ�Ƿ���Ҫ������Ϣ��Ĭ�ϲ���Ҫ����������λ�汾������
  locationOption.setIsNeedAltitude(false);
  //���ô��Զ��ص�λ��ģʽ���ÿ��ش򿪺��ڼ�ֻҪ��λSDK��⵽λ�ñ仯�ͻ������ص��������ߣ���ģʽ�¿����������ٹ��Ķ�λ����Ƕ��٣���λSDK������λ�ñ仯�ͻἰʱ�ص���������
  //locationOption.setOpenAutoNotifyMode();
  //���ô��Զ��ص�λ��ģʽ���ÿ��ش򿪺��ڼ�ֻҪ��λSDK��⵽λ�ñ仯�ͻ������ص���������
  //locationOption.setOpenAutoNotifyMode(3000,1, TJLocationClientOption.JavaClass.LOC_SENSITIVITY_HIGHT);
  //�轫���úõ�LocationClientOption����ͨ��setLocOption�������ݸ�LocationClient����ʹ��
  locationClient.setLocOption(locationOption);
  //��ʼ��λ
  locationClient.start();

end;



{ TJBDLocationListener }

procedure TJBDLocationListener.onReceiveLocation(P1: JBDLocation);
begin
  FMX.Types.Log.d('OrangeUI TJBDLocationListener.onReceiveLocation');

  //�˴���BDLocationΪ��λ�����Ϣ�࣬ͨ�����ĸ���get�����ɻ�ȡ��λ��ص�ȫ�����
  //����ֻ�оٲ��ֻ�ȡ��γ����أ����ã��Ľ����Ϣ
  //��������Ϣ��ȡ˵�����������ο���BDLocation���е�˵��

//  //��ȡγ����Ϣ
//  double latitude = location.getLatitude();
//  //��ȡ������Ϣ
//  double longitude = location.getLongitude();
//  //��ȡ��λ���ȣ�Ĭ��ֵΪ0.0f
//  float radius = location.getRadius();
//  //��ȡ��γ���������ͣ���LocationClientOption�����ù�����������Ϊ׼
//  String coorType = location.getCoorType();
//  //��ȡ��λ���͡���λ���󷵻��룬������Ϣ�ɲ�����ο���BDLocation���е�˵��
//  int errorCode = location.getLocType();

  TThread.Synchronize(nil,procedure
  begin
    Form3.Memo1.Lines.Insert(0,DateTimeToStr(Now)+' '+FloatToStr(P1.getLatitude)+','+FloatToStr(P1.getLongitude));
  end);


end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  locationOption.setScanSpan(StrToInt(Self.edtScanSpan.Text)*1000);
  //�轫���úõ�LocationClientOption����ͨ��setLocOption�������ݸ�LocationClient����ʹ��
  locationClient.setLocOption(locationOption);

end;

procedure TForm3.FormShow(Sender: TObject);
begin
  //����Ȩ��
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
