program OpenFileApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  OpenfileMain in 'OpenfileMain.pas' {FormMain},
  FlyFilesUtils in '..\..\Source\FlyFilesUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
