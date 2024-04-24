program TestLCPrinter_FMX_D11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit10 in 'Unit10.pas' {Form10},
  Androidapi.JNI.lcprintsdk1_1_release_aar in 'lcprintsdk1.1-release_aar\Androidapi.JNI.lcprintsdk1_1_release_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm10, Form10);
  Application.Run;
end.
