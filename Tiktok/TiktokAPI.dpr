program TiktokAPI;

uses
  System.StartUpCopy,
  FMX.Forms,
  uCEFApplication,
  Unit9 in 'Unit9.pas' {Form9},
  TiktokAuthLoginForm in 'TiktokAuthLoginForm.pas' {frmTiktokAuthLogin},
  uTiktokAPI in 'uTiktokAPI.pas',
  XSuperJSON in 'C:\MyFiles\OrangeProjectCommon\XSuperObject\XSuperJSON.pas',
  XSuperObject in 'C:\MyFiles\OrangeProjectCommon\XSuperObject\XSuperObject.pas',
  WebbrowserControlUtils in 'C:\MyFiles\OrangeProjectCommon\WebbrowserControlUtils.pas',
  EasyServiceCommonMaterialDataMoudle in 'C:\MyFiles\OrangeProjectCommon\EasyServiceCommonMaterialDataMoudle.pas',
  uCEFProcess in 'C:\MyFiles\OrangeUIProduct\ÄÚÈÝÅÀ³æ\DelphiClient\uCEFProcess.pas',
  uSimpleFMXBrowser in 'uSimpleFMXBrowser.pas',
  WebBrowserFrame in 'C:\MyFiles\OrangeProjectCommon\WebBrowserFrame.pas',
  uPayAPIParam in '..\OrangeProjectCommon\PaySDKPublic\uPayAPIParam.pas',
  uPayPublic in '..\OrangeProjectCommon\PaySDKPublic\uPayPublic.pas',
  uBaseThirdPartyAccountAuthLogin in 'C:\MyFiles\OrangeProjectCommon\uBaseThirdPartyAccountAuthLogin.pas';

{$R *.res}

begin

    uCEFProcess.CreateGlobalCEFApp;

    if GlobalCEFApp.StartMainProcess then
    begin


      Application.Initialize;
      Application.CreateForm(TForm9, Form9);
  Application.Run;

    end;

    DestroyGlobalCEFApp;

end.
