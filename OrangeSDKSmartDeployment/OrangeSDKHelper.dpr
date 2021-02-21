program OrangeSDKHelper;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  VCL.Dialogs,
  uBaseLog_Copy,
  System.SysUtils,
  uOrangeUISmartSDKDeployment in 'uOrangeUISmartSDKDeployment.pas',
  uCommandLineHelper in 'uCommandLineHelper.pas';


var
  I:Integer;
  AParams:String;
  AProjectFilePath:String;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }

    //输出命令行的参数
//    ParamStr(0);
//    ShowMessage(ParamStr(0)+' '+ParamStr(1));
    AParams:='';
    for I := 0 to ParamCount-1 do
    begin
      AParams:=AParams+ParamStr(I)+' ';
    end;



    //ShowMessage('Hello');

    //记录日志
    uBaseLog_Copy.GetGlobalLog.IsWriteLog:=True;
    uBaseLog_Copy.HandleException(nil,AParams);



    //"C:\OrangeFreeSDK\OrangeSDKSmartDeployment\Win32\Debug\OrangeSDKSmartDeployCommand.exe" $(PROJECTPATH) -C $(Config)
    AProjectFilePath:=ParamStr(1);
    if AProjectFilePath='' then
    begin
      AProjectFilePath:='C:\OrangeFreeSDK\Android图片视频选择器DVMediaSelector_V1_0_0\TestDVMediaSelector.dproj';
    end;

    if FileExists(AProjectFilePath) then
    begin
      GenerateProject_R_Java_Jar(
                                AProjectFilePath,
                                'Android',
                                '21.0',
                                GlobalCommandLineOutputHelper.DoGetCommandLineOutput
                                );
    end;


  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
