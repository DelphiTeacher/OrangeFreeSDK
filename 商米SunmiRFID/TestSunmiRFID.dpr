program TestSunmiRFID;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit4 in 'Unit4.pas' {Form4},
  Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar in 'SunmiRFIDSDK\Androidapi.JNI.SunmiRFID_SDK_release_v1_0_0_aar.pas',
  Androidapi.JNI.sunmiuhfhelper_debug_aar in 'SunmiRFIDSDK\Androidapi.JNI.sunmiuhfhelper_debug_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
