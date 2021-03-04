program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Androidapi.JNI.classes in 'Androidapi.JNI.classes.pas',
  Androidapi.JNI.my_callback_library in 'Androidapi.JNI.my_callback_library.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
