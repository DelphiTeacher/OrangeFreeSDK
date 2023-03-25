program HuaweiScan_FMX_D11;


uses
  System.StartUpCopy,
  FMX.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  Androidapi.JNI.jetified_scanplus_2_9_0_300_aar in 'HuaweiSDK 2.9.0.300\Androidapi.JNI.jetified_scanplus_2_9_0_300_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
