program ReadHospitialCard;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit13 in 'Unit13.pas' {Form13},
  Androidapi.JNI.YSF_release_aar in 'ReadHospitalCardSDK\Androidapi.JNI.YSF_release_aar.pas',
  uReadHospitalCardSDK in 'ReadHospitalCardSDK\uReadHospitalCardSDK.pas',
  Androidapi.JNI.myysflibrary in 'ReadHospitalCardSDK\Androidapi.JNI.myysflibrary.pas',
  XSuperJSON in '..\OrangeProjectCommon\XSuperObject\XSuperJSON.pas',
  XSuperObject in '..\OrangeProjectCommon\XSuperObject\XSuperObject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
