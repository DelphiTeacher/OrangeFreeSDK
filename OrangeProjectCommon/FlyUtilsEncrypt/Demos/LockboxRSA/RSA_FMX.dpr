program RSA_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitFmxRSAMain in 'UnitFmxRSAMain.pas' {Form1},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  LbAsym in '..\..\Source\LockBoxRSA\LbAsym.pas',
  LbRSA in '..\..\Source\LockBoxRSA\LbRSA.pas',
  LbBigInt in '..\..\Source\LockBoxRSA\LbBigInt.pas',
  LbRandom in '..\..\Source\LockBoxRSA\LbRandom.pas',
  LbCipher in '..\..\Source\LockBoxRSA\LbCipher.pas',
  LbUtils in '..\..\Source\LockBoxRSA\LbUtils.pas',
  LbConst in '..\..\Source\LockBoxRSA\LbConst.pas',
  LbClass in '..\..\Source\LockBoxRSA\LbClass.pas',
  LbProc in '..\..\Source\LockBoxRSA\LbProc.pas',
  LbBytes in '..\..\Source\LockBoxRSA\LbBytes.pas';


{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
