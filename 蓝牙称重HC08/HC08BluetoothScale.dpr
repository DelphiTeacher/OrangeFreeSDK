program HC08BluetoothScale;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Androidapi.JNI.bleweight_debug in 'BleWeightHC08SDK\Androidapi.JNI.bleweight_debug.pas',
  Androidapi.JNI.bluetoothlibrary_debug in 'BleWeightHC08SDK\Androidapi.JNI.bluetoothlibrary_debug.pas',
  uBluetoothScaleDevice in 'uBluetoothScaleDevice.pas',
  DeviceFrame in 'DeviceFrame.pas' {FrameDevice: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrameDevice, FrameDevice);
  Application.Run;
end.
