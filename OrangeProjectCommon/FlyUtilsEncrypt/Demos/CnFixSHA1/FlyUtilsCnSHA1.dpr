program FlyUtilsCnSHA1;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitSHAMain in 'UnitSHAMain.pas' {FormMain},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  FlyUtils.CnSHA1 in '..\..\Source\FlyUtils.CnSHA1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
