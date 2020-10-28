program IOSTencentSDK_D10_3;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  TencentOAuth_iOSApi in 'TencentSDK\IOS\TencentOAuth_iOSApi.pas',
  TencentOAuthObject_iOSApi in 'TencentSDK\IOS\TencentOAuthObject_iOSApi.pas',
  QQApiInterface_iOSApi in 'TencentSDK\IOS\QQApiInterface_iOSApi.pas',
  QQApiInterfaceObject_iOSApi in 'TencentSDK\IOS\QQApiInterfaceObject_iOSApi.pas',
  sdkdef_iOSApi in 'TencentSDK\IOS\sdkdef_iOSApi.pas',
  TencentApiInterface_iOSApi in 'TencentSDK\IOS\TencentApiInterface_iOSApi.pas',
  TencentMessageObject_iOSApi in 'TencentSDK\IOS\TencentMessageObject_iOSApi.pas',
  uTencentQQAPI in 'TencentSDK\uTencentQQAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
