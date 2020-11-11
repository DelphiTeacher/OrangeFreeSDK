program TestCoreTelephony;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit5 in 'Unit5.pas' {Form5},
  iOSApi.CTCellularData in 'CoreTelephonySDK\iOSApi.CTCellularData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
