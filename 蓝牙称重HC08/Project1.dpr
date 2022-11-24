program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Androidapi.JNI.bleweight_debug in 'BleWeightHC08SDK\Androidapi.JNI.bleweight_debug.pas',
  Androidapi.JNI.bluetoothlibrary_debug in 'BleWeightHC08SDK\Androidapi.JNI.bluetoothlibrary_debug.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
