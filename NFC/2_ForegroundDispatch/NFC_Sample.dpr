program NFC_Sample;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  MainFormU in 'MainFormU.pas' {MainForm},
  Androidapi.JNI.Nfc in '..\Common\Androidapi.JNI.Nfc.pas',
  Androidapi.JNI.Nfc.Tech in '..\Common\Androidapi.JNI.Nfc.Tech.pas',
  Androidapi.JNI.Toast in '..\Common\Androidapi.JNI.Toast.pas',
  NFCHelper in '..\Common\NFCHelper.pas',
  uOrangeAndroidNFC in '..\uOrangeAndroidNFC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
