unit Unit2;

interface

//{$DEFINE OrangeSDK_TEST}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  DateUtils,
  System.Messaging,

  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
  Androidapi.JNI.scan_1_1_3_301_aar,
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

  {$IFDEF OrangeSDK_TEST}
  uOrangeScanCodeForm,
  {$ENDIF OrangeSDK_TEST}


  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  FMX.Memo.Types;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FStartTime:TDateTime;

    FMessageSubscriptionID: integer;
    procedure HandleActivityMessage(const Sender: TObject; const M: TMessage);
    { Private declarations }
  public
    FAverageMilliSeconds:Integer;
    procedure DoScanResultEvent(Sender:TObject;
                            //扫描到的二维码
                            ACode:String;
                            AFormat:String;
                            //是否继续扫描
                            var AIsNeedContinue:Boolean);
  public
    {$IFDEF OrangeSDK_TEST}
    FOrangeScanCodeForm:TOrangeScanCodeForm;
    {$ENDIF OrangeSDK_TEST}
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
{$IFDEF ANDROID}
var
  AIntent:JIntent;
{$ENDIF}
begin
  {$IFDEF ANDROID}
  FStartTime:=Now;


  AIntent:=TJIntent.JavaClass.init;
  AIntent.setClassName(TAndroidHelper.Context,StringToJString('com.huawei.hms.hmsscankit.ScanKitActivity'));
  TAndroidHelper.Activity.startActivityForResult(AIntent,666);
  {$ENDIF}

end;

procedure TForm2.FormShow(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm2.FormCreate');
  {$IFDEF ANDROID}
  FMessageSubscriptionID := TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessage);
  {$ENDIF}

  //申请权限
  {$IFDEF ANDROID}
  PermissionsService.RequestPermissions
      ([JStringToString(TJManifest_permission.JavaClass.CAMERA),
      //要有震动的权限
      JStringToString(TJManifest_permission.JavaClass.VIBRATE)
        ],
    procedure(const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>)
    begin
    end);
  {$ENDIF}


end;

procedure TForm2.HandleActivityMessage(const Sender: TObject;
  const M: TMessage);
{$IFDEF ANDROID}
var
  AJParcelable:JParcelable;
  AJHmsScan:JHmsScan;
  AResultString:String;
  AIsNeedContinue:Boolean;
{$ENDIF}
begin
  FMX.Types.Log.d('OrangeUI TForm2.HandleActivityMessage Begin');

  {$IFDEF ANDROID}
  if TMessageResultNotification(M).RequestCode = 666 then
  begin
    FMX.Types.Log.d('OrangeUI TForm2.HandleActivityMessage 666 1');

    if Assigned(TMessageResultNotification(M).Value) then
    begin
      FMX.Types.Log.d('OrangeUI TForm2.HandleActivityMessage 666 2');

      //  if (resultCode != RESULT_OK || data == null) {
      //    return;
      //  }
      //  if (requestCode == REQUEST_CODE_SCAN_ONE) {
      //    HmsScan obj = data.getParcelableExtra(ScanUtil.RESULT);
      //    if (obj != null) {
      //      this.textView.setText(obj.originalValue);
      //    }
      //  }

      AJParcelable:=TMessageResultNotification(M).Value.getParcelableExtra(TJScanUtil.JavaClass.RESULT);
      if AJParcelable<>nil then
      begin
        AJHmsScan:=TJHmsScan.Wrap((AJParcelable as ILocalObject).GetObjectID);
        AResultString:=JStringToString(AJHmsScan.originalValue);
        FMX.Types.Log.d('OrangeUI TForm2.HandleActivityMessage 666 3 '+AResultString);

        AIsNeedContinue:=False;
        DoScanResultEvent(Self,AResultString,'',AIsNeedContinue);

      end;

    end;

  end;


  FMX.Types.Log.d('OrangeUI TForm2.HandleActivityMessage End');
  {$ENDIF}


end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  //OrangeSDK封装测试
  {$IFDEF OrangeSDK_TEST}
  FStartTime:=Now;

  if FOrangeScanCodeForm=nil then
  begin
    FOrangeScanCodeForm:=TOrangeScanCodeForm.Create(Self);
    FOrangeScanCodeForm.AndroidScanCodeUIType:=ascutHuawei;
    FOrangeScanCodeForm.OnScanResult:=DoScanResultEvent;
  end;
  FOrangeScanCodeForm.StartScan;
  {$ENDIF OrangeSDK_TEST}
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

end.
