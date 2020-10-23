program TestSGQRCodeScan;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  iOSApi.SGQRCodeObtain in 'SGQRCodeScanSDK\iOSApi.SGQRCodeObtain.pas',
  iOSApi.SGQRCodeObtainConfigure in 'SGQRCodeScanSDK\iOSApi.SGQRCodeObtainConfigure.pas',
  iOSApi.SGQRCodeScanView in 'SGQRCodeScanSDK\iOSApi.SGQRCodeScanView.pas',
  iOSApi.WBQRCodeVC in 'SGQRCodeScanSDK\iOSApi.WBQRCodeVC.pas',
  iOSApi.WCQRCodeVC in 'SGQRCodeScanSDK\iOSApi.WCQRCodeVC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
