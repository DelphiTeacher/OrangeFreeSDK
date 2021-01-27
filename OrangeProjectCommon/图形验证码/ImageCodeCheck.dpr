program ImageCodeCheck;

uses
  System.StartUpCopy,
  FMX.Forms,
  MakeImageCode in 'MakeImageCode.pas' {Form1},
  uImageCode in '..\uImageCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
