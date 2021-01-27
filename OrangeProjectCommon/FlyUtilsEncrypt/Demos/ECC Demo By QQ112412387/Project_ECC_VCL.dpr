program Project_ECC_VCL;

uses
  Vcl.Forms,
  UntMain in 'UntMain.pas' {FrmMain},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  FlyUtils.ECC.ECElGamal in '..\..\Source\FlyUtils.ECC.ECElGamal.pas',
  FlyUtils.ECC.ECGFp in '..\..\Source\FlyUtils.ECC.ECGFp.pas',
  FlyUtils.ECC.FGInt in '..\..\Source\FlyUtils.ECC.FGInt.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
