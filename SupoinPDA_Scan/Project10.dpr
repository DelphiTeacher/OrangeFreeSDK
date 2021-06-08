program Project10;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit8 in 'Unit8.pas' {Form8},
  Androidapi.JNI.ReaderManager in 'PDA(android)开发包\jar包\Androidapi.JNI.ReaderManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
