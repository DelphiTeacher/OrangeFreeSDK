program FlyUtilsCnSM4;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitSM4Main in 'UnitSM4Main.pas' {FormMain},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  FlyUtils.CnSM4 in '..\..\Source\FlyUtils.CnSM4.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
