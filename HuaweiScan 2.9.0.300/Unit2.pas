unit Unit2;

interface

//{$DEFINE OrangeSDK_TEST}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  DateUtils,Math,
  System.Messaging,
  FMX.MultiResBitmap,

  {$IFDEF ANDROID}
  FMX.Platform.Android,
  Androidapi.JNIBridge,
  Androidapi.JNI.Widget,


  Androidapi.JNI.Net,
  Androidapi.JNI.jetified_scanplus_2_9_0_300_aar,
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
  FMX.Memo.Types, FMX.Objects;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Timer1: TTimer;
    PaintBox1: TPaintBox;
    Image1: TImage;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
    procedure Button3Click(Sender: TObject);
  private
    FLeft:Double;
    FBufferBitmap:TBitmap;
    FCanvas:TCanvas;

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
  //跳转到华为扫码页面
  AIntent:=TJIntent.JavaClass.init;
  AIntent.setClassName(TAndroidHelper.Context,
    StringToJString('com.huawei.hms.hmsscankit.ScanKitActivity'));
  TAndroidHelper.Activity.startActivityForResult(AIntent,666);
  {$ENDIF}
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FMX.Types.Log.d('OrangeUI TForm2.FormCreate Begin');
//  FCanvas := TDirect2DCanvas.Create(Handle, ClientWidth, ClientHeight);

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
    nil);
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

procedure TForm2.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
//var
//  ABitmap:TFixedBitmapItem;
begin
//  if FBufferBitmap=nil then
//  begin
//    FBufferBitmap:=TBitmap.Create(Ceil(PaintBox1.Width),Ceil(PaintBox1.Height));
//  end;
//
//
//  //绘制
//  ABitmap:=Self.Image1.MultiResBitmap.Items[0];
//  FBufferBitmap.Canvas.BeginScene();
//  FBufferBitmap.Clear(TAlphaColorRec.White);
//  FBufferBitmap.Canvas.DrawBitmap(ABitmap.Bitmap,RectF(0,0,ABitmap.Width,ABitmap.Height),RectF(FLeft,0,FLeft+100,100),1,True);
//  FBufferBitmap.Canvas.EndScene;
//
//  Canvas.DrawBitmap(FBufferBitmap,RectF(0,0,FBufferBitmap.Width,FBufferBitmap.Height),RectF(0,0,FBufferBitmap.Width,FBufferBitmap.Height),1,True);

end;

procedure TForm2.Timer1Timer(Sender: TObject);
//var
//  ABitmap:TFixedBitmapItem;
begin
  //
//  FLeft:=FLeft+1;
//  //绘制
//  ABitmap:=Self.Image1.MultiResBitmap.Items[0];
//  FBufferBitmap.Canvas.BeginScene();
//  FBufferBitmap.Clear(TAlphaColorRec.White);
//  FBufferBitmap.Canvas.DrawBitmap(ABitmap.Bitmap,RectF(0,0,ABitmap.Width,ABitmap.Height),RectF(FLeft,0,FLeft+100,100),1,True);
//  FBufferBitmap.Canvas.EndScene;
//
//
//
//  PaintBox1.Canvas.BeginScene();
//  PaintBox1.Canvas.DrawBitmap(FBufferBitmap,RectF(0,0,FBufferBitmap.Width,FBufferBitmap.Height),
//  RectF(PaintBox1.Position.X,
//        PaintBox1.Position.Y,
//        PaintBox1.Position.X+FBufferBitmap.Width,
//        PaintBox1.Position.Y+FBufferBitmap.Height),1,True);
//  PaintBox1.Canvas.EndScene;
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

procedure TForm2.Button3Click(Sender: TObject);
var
  creator: JHmsScanAnalyzerOptions_Creator;
  options: JHmsScanAnalyzerOptions;
begin
  // 扫描
  creator:=TJHmsScanAnalyzerOptions_Creator.JavaClass.init;
  creator.setHmsScanTypes(TJHmsScanBase.JavaClass.QRCODE_SCAN_TYPE,nil);
//  creator.setHmsScanTypes(TJHmsScanBase.JavaClass.EAN13_SCAN_TYPE,nil);
  options:=creator.create;
  TJScanUtil.JavaClass.startScan(TAndroidHelper.Activity,666,options);

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
