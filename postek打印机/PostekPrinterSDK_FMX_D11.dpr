program PostekPrinterSDK_FMX_D11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit5 in 'Unit5.pas' {Form5},
  iOSApi.PTKPrintSDK in 'PostekSDK\IOS_2_7\iOSApi.PTKPrintSDK.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
