program AppCrashToBrowser;

uses
  System.StartUpCopy,
  FMX.Forms,
  AppCrashToBrowser_Main in 'AppCrashToBrowser_Main.pas' {FormMain},
  FlyUtils.App.CrashHandler in '..\..\Source\FlyUtils.App.CrashHandler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
