program Project11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit9 in 'Unit9.pas' {Form9},
  uOrangeAndroidNFC in '..\uOrangeAndroidNFC.pas',
  NFCHelper in '..\Common\NFCHelper.pas',
  Androidapi.JNI.Toast in '..\Common\Androidapi.JNI.Toast.pas',
  Androidapi.JNI.Nfc.Tech in '..\Common\Androidapi.JNI.Nfc.Tech.pas',
  Androidapi.JNI.Nfc in '..\Common\Androidapi.JNI.Nfc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
