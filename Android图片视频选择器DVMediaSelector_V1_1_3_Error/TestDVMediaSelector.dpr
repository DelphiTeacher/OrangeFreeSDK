program TestDVMediaSelector;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit17 in 'Unit17.pas' {Form17},
  Androidapi.JNI.glide_4_0_0 in 'C:\MyFiles\OrangeSDKControl\Source\GlideSDK_V4_0_0_0\Androidapi.JNI.glide_4_0_0.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm17, Form17);
  Application.Run;
end.
