program QSSDK_FMX_D12;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  iOSApi.QsSdkOrderInfo in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkOrderInfo.pas',
  iOSApi.QsSdkRoleInfo in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkRoleInfo.pas',
  iOSApi.QsSdkUtils in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkUtils.pas',
  iOSApi.QsSdk in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdk.pas',
  iOSApi.QsSdkAppInfo in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkAppInfo.pas',
  iOSApi.QsSdkBoxInfo in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkBoxInfo.pas',
  iOSApi.QsSdkChannel in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkChannel.pas',
  iOSApi.QsSdkDef in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkDef.pas',
  iOSApi.QsSdkDeviceInfo in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkDeviceInfo.pas',
  iOSApi.QsSdkHttpResponse in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkHttpResponse.pas',
  iOSApi.QsSdkHttpsApi in 'QsSdk\IOS\QsSdk.framework\Headers\iOSApi.QsSdkHttpsApi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
