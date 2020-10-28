program AndroidQQSDK_D10_3;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit4 in 'Unit4.pas' {Form4},
  FlyFilesUtils in 'C:\MyFiles\OrangeProjectCommon\FlyFilesUtils\FlyFilesUtils.pas',
  Androidapi.JNI.Environment in 'C:\MyFiles\OrangeProjectCommon\FlyFilesUtils\Androidapi.JNI.Environment.pas',
  Androidapi.JNI.StatFs in 'C:\MyFiles\OrangeProjectCommon\FlyFilesUtils\Androidapi.JNI.StatFs.pas',
  Androidapi.JNI.Stream2 in 'C:\MyFiles\OrangeProjectCommon\FlyFilesUtils\Androidapi.JNI.Stream2.pas',
  Androidapi.JNI.ActivityManager in 'C:\MyFiles\OrangeProjectCommon\FlyFilesUtils\Androidapi.JNI.ActivityManager.pas',
  Androidapi.JNI.android.os.storage.StorageManager in 'C:\MyFiles\OrangeProjectCommon\FlyFilesUtils\Androidapi.JNI.android.os.storage.StorageManager.pas',
  Androidapi.JNI.java.lang.FlyUtils in 'C:\MyFiles\OrangeProjectCommon\FlyFilesUtils\Androidapi.JNI.java.lang.FlyUtils.pas',
  QQShare in 'TencentSDK\QQShare.pas',
  Androidapi.JNI.open_sdk_r5886_lite in 'TencentSDK\Android\Androidapi.JNI.open_sdk_r5886_lite.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
