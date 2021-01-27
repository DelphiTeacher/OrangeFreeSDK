program FlyUtilsCJDES;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitDESMain in 'UnitDESMain.pas' {FormMain},
  FlyUtils.CSharpJavaDES in '..\..\Source\FlyUtils.CSharpJavaDES.pas',
  FlyUtils.CnXXX.Common in '..\..\Source\FlyUtils.CnXXX.Common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
