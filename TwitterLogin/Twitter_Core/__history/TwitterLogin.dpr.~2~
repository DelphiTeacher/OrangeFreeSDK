program TwitterLogin;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {FormLogin},
  TwitterCore in 'TwitterSDK\TwitterCore.pas',
  uBaseNativeView in '..\..\OrangeProjectCommon\OrangeSDKPublic\uBaseNativeView.pas',
  Androidapi.JNI.classes in 'Androidapi.JNI.classes.pas',
  Androidapi.JNI.my_twitter_user in 'Androidapi.JNI.my_twitter_user.pas',
  Androidapi.JNI.my_twitter_UserInformation in 'Androidapi.JNI.my_twitter_UserInformation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
