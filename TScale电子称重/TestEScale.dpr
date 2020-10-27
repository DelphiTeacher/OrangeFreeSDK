program TestEScale;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit4 in 'Unit4.pas' {Form4},
  Androidapi.JNI.libserial_release_aar in 'EScaleSDK\Androidapi.JNI.libserial_release_aar.pas',
  Androidapi.JNI.tsscale_aar in 'EScaleSDK\Androidapi.JNI.tsscale_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
