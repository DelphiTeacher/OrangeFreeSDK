program Project_ECC_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitFmxMain in 'UnitFmxMain.pas' {Form1},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  FlyUtils.ECC.ECElGamal in '..\..\Source\FlyUtils.ECC.ECElGamal.pas',
  FlyUtils.ECC.ECGFp in '..\..\Source\FlyUtils.ECC.ECGFp.pas',
  FlyUtils.ECC.FGInt in '..\..\Source\FlyUtils.ECC.FGInt.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
