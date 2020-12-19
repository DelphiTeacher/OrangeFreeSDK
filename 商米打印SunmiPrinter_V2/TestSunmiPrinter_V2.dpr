program TestSunmiPrinter_V2;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Androidapi.JNI.sunmi_printer_all in 'SunmiPrinterSDK_V2\Androidapi.JNI.sunmi_printer_all.pas',
  Androidapi.JNI.sunmi_helper in 'SunmiPrinterSDK_V2\Androidapi.JNI.sunmi_helper.pas',
  uSunmiPrinterHelper in 'SunmiPrinterSDK_V2\uSunmiPrinterHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
