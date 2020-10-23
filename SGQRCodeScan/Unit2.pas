unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,

  iOSApi.WBQRCodeVC,
  iOSApi.WCQRCodeVC,
  iOSApi.SGQRCodeObtain,
  iOSApi.Foundation,
  iOSApi.UIKit,
  FMX.Platform.iOS,
	MacApi.ObjectiveC,
  Macapi.Helpers,

  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.StdActns,
  FMX.MediaLibrary.Actions, System.Actions, FMX.ActnList;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    WBVC:WBQRCodeVC;
    WCVC:WCQRCodeVC;
  	procedure SGQRCodeObtainScanResultBlockEvent(obtain:SGQRCodeObtain;result:NSString);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
  WBVC:=TWBQRCodeVC.Wrap(TWBQRCodeVC.Alloc.init);
  WBVC.setBlockWithQRCodeObtainScanResult(SGQRCodeObtainScanResultBlockEvent);
  WindowHandleToPlatform(Self.Handle).Wnd.rootViewController.presentViewController(
    WBVC,True,nil
    );
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  WCVC:=TWCQRCodeVC.Wrap(TWCQRCodeVC.Alloc.init);
  WCVC.setBlockWithQRCodeObtainScanResult(SGQRCodeObtainScanResultBlockEvent);
  WindowHandleToPlatform(Self.Handle).Wnd.rootViewController.presentViewController(
    WCVC,True,nil
    );
end;

procedure TForm2.SGQRCodeObtainScanResultBlockEvent(obtain: SGQRCodeObtain;
  result: NSString);
begin
  ShowMessage(NSStrToStr(result));
end;

end.
