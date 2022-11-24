program OrangeSDK_SmartDeploy;



uses
  Vcl.Forms,
  SmartDeployForm in 'SmartDeployForm.pas' {frmSmartDeploy},
  uOrangeUISmartSDKDeployment in 'uOrangeUISmartSDKDeployment.pas',
  uCommandLineHelper in '..\OrangeProjectCommon\uCommandLineHelper.pas',
  XSuperJSON in '..\OrangeProjectCommon\XSuperObject\XSuperJSON.pas',
  XSuperObject in '..\OrangeProjectCommon\XSuperObject\XSuperObject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSmartDeploy, frmSmartDeploy);
  Application.Run;
end.
