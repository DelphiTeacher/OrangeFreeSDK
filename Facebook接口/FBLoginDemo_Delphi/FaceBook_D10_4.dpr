program FaceBook_D10_4;

uses
  System.StartUpCopy,
  FMX.Forms,
  FBLoginForm in 'FBLoginForm.pas' {Form1},
  Androidapi.JNI.my_facebook_library in 'FacebookSDK\Android_4_6\Androidapi.JNI.my_facebook_library.pas',
  Androidapi.JNI.facebook in 'FacebookSDK\Android_4_6\Androidapi.JNI.facebook.pas',
  iOSApi.FBSDKAccessToken in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKAccessToken.pas',
  iOSApi.FBSDKAppEvents in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKAppEvents.pas',
  iOSApi.FBSDKApplicationDelegate in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKApplicationDelegate.pas',
  iOSApi.FBSDKCoreKit in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKCoreKit.pas',
  iOSApi.FBSDKGraphRequest in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKGraphRequest.pas',
  iOSApi.FBSDKGraphRequestConnection in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKGraphRequestConnection.pas',
  iOSApi.FBSDKLoginKit in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKLoginKit.pas',
  iOSApi.FBSDKLoginManager in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKLoginManager.pas',
  iOSApi.FBSDKLoginManagerLoginResult in 'FacebookSDK\IOS_4_6\iOSApi.FBSDKLoginManagerLoginResult.pas',
  FBLoginCommon in 'FacebookSDK\FBLoginCommon.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
