program SDCardTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitMain in 'UnitMain.pas' {Form1},
  FlyFilesUtils in '..\..\Source\FlyFilesUtils.pas',
  FlyUtils.App.CrashHandler in '..\..\Source\FlyUtils.App.CrashHandler.pas',
  FlyUtils.ShowMessageWait in '..\..\Source\FlyUtils.ShowMessageWait.pas',
  FlyUtils.TBitmapHelper in '..\..\Source\FlyUtils.TBitmapHelper.pas',
  Androidapi.JNI.ActivityManager in '..\..\Source\Androidapi.JNI.ActivityManager.pas',
  Androidapi.JNI.android.os.storage.StorageManager in '..\..\Source\Androidapi.JNI.android.os.storage.StorageManager.pas',
  Androidapi.JNI.Environment in '..\..\Source\Androidapi.JNI.Environment.pas',
  Androidapi.JNI.java.lang.FlyUtils in '..\..\Source\Androidapi.JNI.java.lang.FlyUtils.pas',
  Androidapi.JNI.StatFs in '..\..\Source\Androidapi.JNI.StatFs.pas',
  Androidapi.JNI.Stream2 in '..\..\Source\Androidapi.JNI.Stream2.pas',
  Androidapi.JNI.ToastForService in '..\..\Source\Androidapi.JNI.ToastForService.pas',
  FlyFmxUtils in '..\..\Source\FlyFmxUtils.pas',
  FlyStrUtils in '..\..\Source\FlyStrUtils.pas',
  FlyUtils.Android.PostRunnableAndTimer in '..\..\Source\FlyUtils.Android.PostRunnableAndTimer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
