program Project3;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  uDeTongPrinter in 'uDeTongPrinter.pas',
  Androidapi.JNI.LPAPI_2024_10_21_R in 'Androidapi.JNI.LPAPI_2024_10_21_R.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
