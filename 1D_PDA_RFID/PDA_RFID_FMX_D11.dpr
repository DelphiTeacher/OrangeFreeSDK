program PDA_RFID_FMX_D11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  Androidapi.JNI.Serialport_module in '2D_PDA_RFID_SDK\Androidapi.JNI.Serialport_module.pas',
  Androidapi.JNI.xdl2d_RFID in '2D_PDA_RFID_SDK\Androidapi.JNI.xdl2d_RFID.pas',
  Androidapi.JNI.my1drfidhelper_debug_aar in '1D_PDA_RFID_SDK\Androidapi.JNI.my1drfidhelper_debug_aar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
