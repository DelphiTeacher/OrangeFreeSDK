program FlyUtilsAES;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitAESMain in 'UnitAESMain.pas' {FormMain},
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas',
  FlyUtils.AES in '..\..\Source\FlyUtils.AES.pas',
  FlyUtils.AES.ElAES in '..\..\Source\FlyUtils.AES.ElAES.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
