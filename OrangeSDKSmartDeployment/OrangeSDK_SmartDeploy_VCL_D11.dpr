program OrangeSDK_SmartDeploy_VCL_D11;



uses
  Vcl.Forms,
  SmartDeployForm in 'SmartDeployForm.pas' {frmSmartDeploy},
  uOrangeUISmartSDKDeployment in 'uOrangeUISmartSDKDeployment.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSmartDeploy, frmSmartDeploy);
  Application.Run;
end.
