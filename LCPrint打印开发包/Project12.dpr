program Project12;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit10 in 'Unit10.pas' {Form10},
  Androidapi.JNI.lcprintsdk1_0_release_aar in 'Androidapi.JNI.lcprintsdk1_0_release_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm10, Form10);
  Application.Run;
end.
