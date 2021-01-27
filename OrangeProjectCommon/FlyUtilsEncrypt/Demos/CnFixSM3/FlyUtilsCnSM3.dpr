program FlyUtilsCnSM3;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitSM3Main in 'UnitSM3Main.pas' {FormMain},
  FlyUtils.CnSM3 in '..\..\Source\FlyUtils.CnSM3.pas',
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
