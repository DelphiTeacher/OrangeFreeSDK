unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,



  System.Messaging,
  DateUtils,
  FMX.DialogService,


  {$IFDEF ANDROID}

  Androidapi.JNI.scanplus_2_13_0_302,


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
  {$ENDIF}


  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm2 = class(TForm)
    btnScan: TButton;
    Memo1: TMemo;
    procedure btnScanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FStartTime: TDateTime;

    FMessageSubscriptionID: integer;
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);

  public
    { Public declarations }
    FAverageMilliSeconds:Integer;
    procedure DoScanResultEvent(Sender:TObject;
                            //扫描到的二维码
                            ACode:String;
                            AFormat:String;
                            //是否继续扫描
                            var AIsNeedContinue:Boolean);    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.btnScanClick(Sender: TObject);
var
  AIntent:JIntent;
  ScanOptions: JHmsScanAnalyzerOptions;
begin
  FStartTime:=Now;
  { “QRCODE_SCAN_TYPE”和“DATAMATRIX_SCAN_TYPE”表示只扫描QR和DataMatrix的码，
   setViewType设置扫码标题，
    0表示设置扫码标题为“扫描二维码/条码”，
    1表示设置扫码标题为“扫描二维码”，默认为0；

    setPhotoMode 设置Bitmap扫码模式为相机模式还是图片模式
    false：设置Bitmap扫码模式为相机模式，默认为false。
    true：设置Bitmap扫码模式为图片模式

    setErrorCheck设置错误监听，true表示监听错误并退出扫码页面，false表示不上报错误，
    仅检查到识别结果后退出扫码页面，默认为false
    HmsScanAnalyzerOptions options = new HmsScanAnalyzerOptions.Creator()
      .setHmsScanTypes(HmsScan.QRCODE_SCAN_TYPE, HmsScan.DATAMATRIX_SCAN_TYPE)
      .setViewType(1)
      .setErrorCheck(true)
      .create();
  }

//   设置扫描参数
    ScanOptions := TJHmsScanAnalyzerOptions_Creator.JavaClass.init
//    .setHmsScanTypes(TJHmsScan.JavaClass.QRCODE_SCAN_TYPE, fJavaArr)
//    .setPhotoMode(False)
//    .setViewType(0)
    .create;

  // 打开默认扫描界面
  TJScanUtil.JavaClass.startScan(TAndroidHelper.Activity, 666, ScanOptions);//可传入 ScanOptions参数, 也可为空(按SDK默认参数)


////  也可直接用 TJIntent 方式启动扫描
//  AIntent:=TJIntent.JavaClass.init;
//  AIntent.setClassName(TAndroidHelper.Context,StringToJString('com.huawei.hms.hmsscankit.ScanKitActivity'));
//  TAndroidHelper.Activity.startActivityForResult(AIntent,666);


end;

procedure TForm2.DoScanResultEvent(Sender: TObject; ACode, AFormat: String;
  var AIsNeedContinue: Boolean);
var
  AUsedMilliSeconds:Integer;
begin
  AUsedMilliSeconds:=DateUtils.MilliSecondsBetween(Self.FStartTime,Now);
  if FAverageMilliSeconds=0 then
  begin
    FAverageMilliSeconds:=AUsedMilliSeconds;
  end
  else
  begin
    FAverageMilliSeconds:=(FAverageMilliSeconds+AUsedMilliSeconds) div 2;
  end;


  TThread.Synchronize(nil,procedure
  begin
    Self.Memo1.Lines.Insert(0,'耗时 '+IntToStr(AUsedMilliSeconds)+'ms '+'平均 '+IntToStr(FAverageMilliSeconds)+'ms ');
    Self.Memo1.Lines.Insert(0,ACode+' '+AFormat);
  end);
  AIsNeedContinue:=False;

end;


procedure TForm2.FormShow(Sender: TObject);
begin

  // 订阅消息
  FMessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessage);

   //申请权限
  {$IFDEF ANDROID}
  PermissionsService.RequestPermissions([JStringToString(TJManifest_permission.JavaClass.CAMERA),
        JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE)],
    {$IF RTLVersion>=35}
    procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
    {$ELSE}
    procedure(const APermissions: TArray<string>; const AGrantResults: TArray<TPermissionStatus>)
    {$ENDIF}
    begin
      if (Length(AGrantResults) = 2) and (AGrantResults[0] = TPermissionStatus.Granted)
        and (AGrantResults[1] = TPermissionStatus.Granted) then
      begin
        //
      end
      else
      begin

        TDialogService.ShowMessage('需要开启摄像头权限');

      end;
    end);
  {$ENDIF}
end;


procedure TForm2.HandleActivityMessage(const Sender: TObject;
  const M: TMessage);
var
  AJParcelable:JParcelable;
  AJHmsScan:JHmsScan;
  AResultString:String;
  AIsNeedContinue:Boolean;
begin
  FMX.Types.Log.d('HandleActivityMessage');

  if TMessageResultNotification(M).RequestCode = 666 then
  begin

    if Assigned(TMessageResultNotification(M).Value) then
    begin

      AJParcelable:=TMessageResultNotification(M).Value.getParcelableExtra(TJScanUtil.JavaClass.RESULT);
      if AJParcelable<>nil then
      begin
        AJHmsScan:=TJHmsScan.Wrap((AJParcelable as ILocalObject).GetObjectID);
        AResultString:=JStringToString(AJHmsScan.originalValue);
        FMX.Types.Log.d('返回结果: '+AResultString);

        AIsNeedContinue:=False;
        DoScanResultEvent(Self,AResultString,'',AIsNeedContinue);

      end;

    end;

  end;

end;

end.
