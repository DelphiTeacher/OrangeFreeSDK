program Blowfish_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitFmxMain in 'UnitFmxMain.pas' {FormMain},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  FlyUtils.Blowfish in '..\..\Source\FlyUtils.Blowfish.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
