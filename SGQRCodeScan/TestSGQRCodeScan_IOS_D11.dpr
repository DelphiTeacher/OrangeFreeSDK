program TestSGQRCodeScan_IOS_D11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  iOSApi.WCQRCodeVC in 'iOSApi.WCQRCodeVC.pas',
  iOSApi.SGQRCodeObtain in 'iOSApi.SGQRCodeObtain.pas',
  iOSApi.SGQRCodeObtainConfigure in 'iOSApi.SGQRCodeObtainConfigure.pas',
  iOSApi.SGQRCodeScanView in 'iOSApi.SGQRCodeScanView.pas',
  iOSApi.WBQRCodeVC in 'iOSApi.WBQRCodeVC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
