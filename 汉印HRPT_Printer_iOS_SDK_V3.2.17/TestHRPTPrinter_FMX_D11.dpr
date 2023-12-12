program TestHRPTPrinter_FMX_D11;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit4 in 'Unit4.pas' {Form4},
  iOSApi.PTLog in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTLog.pas',
  iOSApi.PTOldCommandCPCL in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTOldCommandCPCL.pas',
  iOSApi.PTOldCommandTSPL in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTOldCommandTSPL.pas',
  iOSApi.PTPrinter in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTPrinter.pas',
  iOSApi.SDKDefine in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.SDKDefine.pas',
  iOSApi.PrinterSDK in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PrinterSDK.pas',
  iOSApi.PTBitmapManager in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTBitmapManager.pas',
  iOSApi.PTCommandCommon in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTCommandCommon.pas',
  iOSApi.PTCommandCPCL in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTCommandCPCL.pas',
  iOSApi.PTCommandESC in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTCommandESC.pas',
  iOSApi.PTCommandTSPL in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTCommandTSPL.pas',
  iOSApi.PTCommandZPL in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTCommandZPL.pas',
  iOSApi.PTDispatcher in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTDispatcher.pas',
  iOSApi.PTEncode in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTEncode.pas',
  iOSApi.PTEnumList in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTEnumList.pas',
  iOSApi.PTLabel in 'iOS_SDK_V3.2.17\PrinterSDK.framework\Headers\iOSApi.PTLabel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
