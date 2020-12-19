program TestSunmiPrinter;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Androidapi.JNI.sunmiprinter in 'SunmiPrinterSDK\Androidapi.JNI.sunmiprinter.pas',
  Androidapi.JNI.zxing_core_3_4_0 in 'SunmiPrinterSDK\Androidapi.JNI.zxing_core_3_4_0.pas',
  utest in 'utest.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
