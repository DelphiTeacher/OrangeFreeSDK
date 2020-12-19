program OrangeJava2PasFixer;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  UnitOrangeUIJava2PasFixer in 'UnitOrangeUIJava2PasFixer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
