unit Unit2;

interface
//{$DEFINE OrangeSDK_TEST}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,


  {$IFDEF IOS}
  iOSApi.WBQRCodeVC,
  iOSApi.WCQRCodeVC,
  iOSApi.SGQRCodeObtain,
  iOSApi.Foundation,
  iOSApi.UIKit,
  FMX.Platform.iOS,
	MacApi.ObjectiveC,
  Macapi.Helpers,
  {$ENDIF IOS}

  {$IFDEF OrangeSDK_TEST}
  uOrangeScanCodeForm,
  {$ENDIF OrangeSDK_TEST}


  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.StdActns,
  FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    {$IFDEF IOS}
    WBVC:WBQRCodeVC;
    WCVC:WCQRCodeVC;
  	procedure SGQRCodeObtainScanResultBlockEvent(obtain:SGQRCodeObtain;result:NSString);
    {$ENDIF IOS}
    procedure DoScanResultEvent(Sender:TObject;
                            //É¨Ãèµ½µÄ¶þÎ¬Âë
                            ACode:String;
                            AFormat:String;
                            //ÊÇ·ñ¼ÌÐøÉ¨Ãè
                            var AIsNeedContinue:Boolean);
    { Private declarations }
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
begin
  {$IFDEF IOS}
  WBVC:=TWBQRCodeVC.Wrap(TWBQRCodeVC.Alloc.init);
  WBVC.setBlockWithQRCodeObtainScanResult(SGQRCodeObtainScanResultBlockEvent);
  WindowHandleToPlatform(Self.Handle).Wnd.rootViewController.presentViewController(
    WBVC,True,nil
    );
  {$ENDIF IOS}
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  {$IFDEF IOS}
  WCVC:=TWCQRCodeVC.Wrap(TWCQRCodeVC.Alloc.init);
  WCVC.setBlockWithQRCodeObtainScanResult(SGQRCodeObtainScanResultBlockEvent);
  WindowHandleToPlatform(Self.Handle).Wnd.rootViewController.presentViewController(
    WCVC,True,nil
    );
  {$ENDIF IOS}
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  //OrangeSDK·â×°²âÊÔ
  {$IFDEF OrangeSDK_TEST}
//  FStartTime:=Now;

  if FOrangeScanCodeForm=nil then
  begin
    FOrangeScanCodeForm:=TOrangeScanCodeForm.Create(Self);
    FOrangeScanCodeForm.IOSScanCodeUIType:=iscutSGQRCode;
    FOrangeScanCodeForm.OnScanResult:=DoScanResultEvent;
  end;
  FOrangeScanCodeForm.StartScan;
  {$ENDIF OrangeSDK_TEST}

end;

procedure TForm2.DoScanResultEvent(Sender: TObject; ACode, AFormat: String;
  var AIsNeedContinue: Boolean);
begin
  ShowMessage(ACode);
end;

{$IFDEF IOS}
procedure TForm2.SGQRCodeObtainScanResultBlockEvent(obtain: SGQRCodeObtain;
  result: NSString);
begin
  ShowMessage(NSStrToStr(result));
end;
{$ENDIF IOS}

end.
