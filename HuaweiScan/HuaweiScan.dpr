program HuaweiScan;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  Androidapi.JNI.scan_1_1_3_301_aar in 'Androidapi.JNI.scan_1_1_3_301_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
