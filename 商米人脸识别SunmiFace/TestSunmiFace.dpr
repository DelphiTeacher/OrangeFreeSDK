program TestSunmiFace;




uses
  System.StartUpCopy,
  FMX.Forms,
  Unit8 in 'Unit8.pas' {Form8},
  Androidapi.JNI.Environment in 'C:\MyFiles\OrangeProjectCommon\FlyFilesUtils\Androidapi.JNI.Environment.pas',
  Androidapi.JNI.mysunmifacelibrary_debug_aar in 'SunmiFaceSDK_v1.6.1\Androidapi.JNI.mysunmifacelibrary_debug_aar.pas',
  Androidapi.JNI.facelib_release_aar in 'SunmiFaceSDK_v1.6.1\Androidapi.JNI.facelib_release_aar.pas',
  uSettings in 'uSettings.pas',
  uMain in 'uMain.pas',
  uSunmiFaceSDK in 'uSunmiFaceSDK.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
