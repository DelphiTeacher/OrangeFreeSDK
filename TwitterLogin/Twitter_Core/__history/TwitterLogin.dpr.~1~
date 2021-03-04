program TwitterLogin;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {FormLogin},
  TwitterCore in 'TwitterSDK\TwitterCore.pas',
  iOSApi.TwitterCore in 'TwitterSDK\IOS_3_0\iOSApi.TwitterCore.pas',
  iOSApi.TWTRAPIErrorCode in 'TwitterSDK\IOS_3_0\iOSApi.TWTRAPIErrorCode.pas',
  iOSApi.TWTRAuthConfig in 'TwitterSDK\IOS_3_0\iOSApi.TWTRAuthConfig.pas',
  iOSApi.TWTRAuthSession in 'TwitterSDK\IOS_3_0\iOSApi.TWTRAuthSession.pas',
  iOSApi.TWTRConstants in 'TwitterSDK\IOS_3_0\iOSApi.TWTRConstants.pas',
  iOSApi.TWTRCoreOAuthSigning in 'TwitterSDK\IOS_3_0\iOSApi.TWTRCoreOAuthSigning.pas',
  iOSApi.TWTRDefines in 'TwitterSDK\IOS_3_0\iOSApi.TWTRDefines.pas',
  iOSApi.TWTRGuestSession in 'TwitterSDK\IOS_3_0\iOSApi.TWTRGuestSession.pas',
  iOSApi.TWTRSession in 'TwitterSDK\IOS_3_0\iOSApi.TWTRSession.pas',
  iOSApi.TWTRSessionStore in 'TwitterSDK\IOS_3_0\iOSApi.TWTRSessionStore.pas',
  iOSApi.Twitter in 'TwitterSDK\IOS_3_0\iOSApi.Twitter.pas',
  iOSApi.TWTRAPIClient in 'TwitterSDK\IOS_3_0\iOSApi.TWTRAPIClient.pas',
  iOSApi.TWTRUser in 'TwitterSDK\IOS_3_0\iOSApi.TWTRUser.pas',
  Androidapi.JNI.my_twitter_UserInformation in 'TwitterSDK\Android_3_0\Androidapi.JNI.my_twitter_UserInformation.pas',
  Androidapi.JNI.classes in 'TwitterSDK\Android_3_0\Androidapi.JNI.classes.pas',
  Androidapi.JNI.my_twitter_user in 'TwitterSDK\Android_3_0\Androidapi.JNI.my_twitter_user.pas',
  uBaseNativeView in '..\..\OrangeProjectCommon\OrangeSDKPublic\uBaseNativeView.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
