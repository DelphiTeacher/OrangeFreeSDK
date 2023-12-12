program TencentUnionAdSDK_FMX_D11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit6 in 'Unit6.pas' {Form6},
  Androidapi.JNI.helper in 'TencentUnionSDK\Android\Androidapi.JNI.helper.pas',
  Androidapi.JNI.GDTSDK_unionNormal_4_541_1411_aar in 'TencentUnionSDK\Android\Androidapi.JNI.GDTSDK_unionNormal_4_541_1411_aar.pas',
  uSkinUnifiedBannerView in 'TencentUnionSDK\uSkinUnifiedBannerView.pas',
  uBaseNativeView in 'TencentUnionSDK\uBaseNativeView.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
