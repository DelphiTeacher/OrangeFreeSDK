program HuaWeiScanDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMain in 'UnitMain.pas' {Form1},
  Androidapi.JNI.scan_1_1_3_301_aar in 'Androidapi.JNI.scan_1_1_3_301_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
