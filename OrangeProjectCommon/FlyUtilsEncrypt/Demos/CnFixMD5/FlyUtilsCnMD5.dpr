program FlyUtilsCnMD5;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMD5Main in 'UnitMD5Main.pas' {FormMain},
  FlyUtils.CnMD5 in '..\..\Source\FlyUtils.CnMD5.pas',
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
