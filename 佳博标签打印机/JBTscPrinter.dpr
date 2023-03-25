program JBTscPrinter;

uses
  System.StartUpCopy,
  FMX.Forms,
  QXMBlueTooth in 'QXMBlueTooth.pas',
  Unit1 in 'Unit1.pas' {Form1},
  Androidapi.JNI.SDKLib in 'Androidapi.JNI.SDKLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
