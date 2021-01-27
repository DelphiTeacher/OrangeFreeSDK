program ObjectiveC2Delphi_Simple;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  uOCParseToPascal in 'uOCParseToPascal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
