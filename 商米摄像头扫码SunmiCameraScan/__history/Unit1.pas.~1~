unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,

  DateUtils,
  System.Messaging,


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
  {$ENDIF}



  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    BtnGet: TButton;
    Memo1: TMemo;
    procedure BtnGetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.BtnGetClick(Sender: TObject);
{$IFDEF ANDROID}
var
  AIntent:JIntent;
{$ENDIF}
begin
//为了降低开发难度，SUNMI OS内置了一个扫码的模块，开发者在项目需要调用扫码的地方通过startActivityForResult()调用商米的扫码模块，然后在onActivityResult()方法中接受扫码结果返回值。
///*
//外部应用在自己的业务代码需要启动扫码的地方使用下面的方式创建Intent，然后使用startActivityForResult()调用起商米的扫码模块;
//*/
//	Intent intent = new Intent("com.summi.scan");
//	intent.setPackage("com.sunmi.sunmiqrcodescanner")
///*
//	使用该方式也可以调用扫码模块
//	Intent intent = new Intent("com.summi.scan");
//	intent.setClassName("com.sunmi.sunmiqrcodescanner",
//	"com.sunmi.sunmiqrcodescanner.activity.ScanActivity");
//
//	扫码模块有一些功能选项，开发者可以通过传递参数控制这些参数，
//	所有参数都有一个默认值，开发者只要在需要的时候添加这些配置就可以。
//	intent.putExtra("CURRENT_PPI", 0X0003);//当前分辨率
//	//M1和V1的最佳是800*480,
//	//PPI_1920_1080 = 0X0001;
//	//PPI_1280_720 = 0X0002;
//	//PPI_BEST = 0X0003;
//	intent.putExtra("PLAY_SOUND", true);// 扫描完成声音提示  默认true
//	intent.putExtra("PLAY_VIBRATE", false);
//	//扫描完成震动,默认false，目前M1硬件支持震动可用该配置，V1不支持
//	intent.putExtra("IDENTIFY_MORE_CODE", false);// 识别画面中多个二维码，默认false
//	intent.putExtra("IS_SHOW_SETTING", true);// 是否显示右上角设置按钮，默认true
//	intent.putExtra("IS_SHOW_ALBUM", true);// 是否显示从相册选择图片按钮，默认true
//*/
//	startActivityForResult(intent, START_SCAN);
  {$IFDEF ANDROID}
  FStartTime:=Now;


  AIntent:=TJIntent.JavaClass.init;
  AIntent.setClassName(StringToJString('com.sunmi.sunmiqrcodescanner'),
                        StringToJString('com.sunmi.sunmiqrcodescanner.activity.ScanActivity'));
  TAndroidHelper.Activity.startActivityForResult(AIntent,666);
  {$ENDIF}


end;

procedure TForm1.FormShow(Sender: TObject);
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

procedure TForm1.HandleActivityMessage(const Sender: TObject;
  const M: TMessage);
{$IFDEF ANDROID}
var
  I:Integer;
  AJbundle:Jbundle;
  AJresult:JArrayList;
  AJhashMap:JHashMap;
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

      //在onActivityResult方法中接收返回的扫码结果参数，参考如下代码：
      //	@Override
      //protected void onActivityResult(int requestCode, int resultCode, Intent data) {
      //	super.onActivityResult(requestCode, resultCode, data);
      //	if (requestCode == 1 && data != null) {
      //		Bundle bundle = data.getExtras();
      //		ArrayList result = (ArrayList<>) bundle .getSerializable(“data”);
      //		Iterator<> it = result.iterator();
      //		while (it.hasNext()) {
      //			HashMap hashMap = it.next();
      //			Log.i(“sunmi”, hashMap.get(“TYPE”));//扫码类型
      //			Log.i(“sunmi”, hashMap.get(“VALUE”));//扫码结果
      //		}
      //	}
      //}      AJbundle:=TMessageResultNotification(M).Value.getExtras();
      AJresult := TJArrayList.Wrap((AJbundle.getSerializable(StringToJString('data')) as ILocalObject).GetObjectID);

      for I := 0 to AJresult.size-1 do
      begin
        AJhashMap:=TJHashMap.Wrap((AJresult.&get(I) AS ILocalObject).GetObjectID);

        AResultString:=JStringToString(
                              TJString.Wrap(
                                (AJhashMap.get(StringToJString('VALUE')) AS ILocalObject).GetObjectID
                                  )
                                );
        FMX.Types.Log.d('OrangeUI TForm2.HandleActivityMessage 666 3 '+AResultString);

        AIsNeedContinue:=False;
        DoScanResultEvent(Self,AResultString,'',AIsNeedContinue);
      end;


    end;

  end;


  FMX.Types.Log.d('OrangeUI TForm2.HandleActivityMessage End');
  {$ENDIF}


end;

procedure TForm1.DoScanResultEvent(Sender: TObject; ACode, AFormat: String;
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
