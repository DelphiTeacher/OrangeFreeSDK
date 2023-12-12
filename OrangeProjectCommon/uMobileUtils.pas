//convert pas to utf8 by ¥

unit uMobileUtils;

interface

uses
  SysUtils,
  Types,
  StrUtils,
  FMX.Types,
  FMX.Forms,
  System.IOUtils,
  FMX.Platform,

  System.Rtti,
  System.Messaging,
  FMX.Dialogs,
  UITypes,



  {$IFDEF MSWINDOWS}
  Winapi.Windows,
  Winapi.ShellAPI,
  FMX.Platform.Win,
  {$ENDIF}

  {$IFDEF IOS}
  Macapi.ObjCRuntime,
  iOSapi.CoreGraphics,
  FMX.Platform.iOS,
  FMX.Helpers.iOS,
  Macapi.ObjectiveC,
  Macapi.Helpers,
  iOSapi.Foundation,
  iOSapi.UIKit,
  {$ENDIF}



  {$IFDEF ANDROID}
  Androidapi.JNI.JavaTypes,Androidapi.JNI.Telephony,
  Androidapi.JNI.Net,Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,FMX.Helpers.Android,
  Androidapi.JNI.Embarcadero,
  Androidapi.JNI.Os,
  FMX.VirtualKeyboard,
  Androidapi.JNI.App, Androidapi.JNIBridge,
  System.SyncObjs,
  FMX.Platform.Android,
  Androidapi.JNI.Provider,
  {$ENDIF}


//  {$IFNDEF ANDROID}
//  //在小米上会报错闪退
//  FMX.PhoneDialer,
//  {$ENDIF}
//  MessageBoxFrame,

  IniFiles,
  Classes;




const
  //从设置页面返回然后安装APK
  Const_ResultCode_JumpToAndroidSettingPage_ForInstallAPK=10086;
  //写系统设置的权限
  Const_ResultCode_JumpToAndroidSettingPage_ForWriteSetting=10087;


//用于预览文件
{$IFDEF IOS}
type
  UIDocumentInteractionControllerDelegate = interface(IObjectiveC)
    ['{F529FE94-2D8A-4C20-BF2A-ED14C7A00CB1}']
    function documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController)
      : UIViewController; cdecl;
    function documentInteractionControllerRectForPreview(controller: UIDocumentInteractionController): CGRect; cdecl;
    function documentInteractionControllerViewForPreview(controller: UIDocumentInteractionController): UIView; cdecl;
    procedure documentInteractionControllerWillBeginPreview(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerDidEndPreview(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerWillPresentOptionsMenu(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerDidDismissOptionsMenu(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerWillPresentOpenInMenu(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerDidDismissOpenInMenu(controller: UIDocumentInteractionController); cdecl;
    [MethodName('documentInteractionController:willBeginSendingToApplication:')]
    procedure documentInteractionControllerWillBeginSendingToApplication(controller: UIDocumentInteractionController;
      willBeginSendingToApplication: NSString); cdecl;
    [MethodName('documentInteractionController:didEndSendingToApplication:')]
    procedure documentInteractionControllerDidEndSendingToApplication(controller: UIDocumentInteractionController;
      didEndSendingToApplication: NSString); cdecl;
  end;


	TUIDocumentInteractionControllerDelegate=class(TOCLocal,UIDocumentInteractionControllerDelegate)
	public
    Form:TForm;
		constructor Create;
		destructor Destroy;override;
	public

    function documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController): UIViewController; cdecl;
    function documentInteractionControllerRectForPreview(controller: UIDocumentInteractionController): CGRect; cdecl;
    function documentInteractionControllerViewForPreview(controller: UIDocumentInteractionController): UIView; cdecl;
    procedure documentInteractionControllerWillBeginPreview(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerDidEndPreview(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerWillPresentOptionsMenu(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerDidDismissOptionsMenu(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerWillPresentOpenInMenu(controller: UIDocumentInteractionController); cdecl;
    procedure documentInteractionControllerDidDismissOpenInMenu(controller: UIDocumentInteractionController); cdecl;
    [MethodName('documentInteractionController:willBeginSendingToApplication:')]
    procedure documentInteractionControllerWillBeginSendingToApplication(controller: UIDocumentInteractionController;willBeginSendingToApplication: NSString); cdecl;
    [MethodName('documentInteractionController:didEndSendingToApplication:')]
    procedure documentInteractionControllerDidEndSendingToApplication(controller: UIDocumentInteractionController;didEndSendingToApplication: NSString); cdecl;

	end;


//  function UIApplicationOpenSettingsURLString:NSString;

{$ENDIF}








//查看文件
function GetMimeType(ext:string): string;
function OpenFile(AForm:TForm;AFilePath:String):Boolean;
//打开浏览器并浏览指定网页
function OpenWebBrowserAndNavigateURL(URL:String):Boolean;
//发短信
function SendSMS(Mobile:String):Boolean;
//打电话
function Dail(Mobile:String):Boolean;



//复制
procedure MySetClipboard(Atxt:string);
//黏贴
function MyGetClipboard:string;

//跳转到定位设置页面
procedure JumpToLocaitonSettingPage;

//跳转到联系人设置页面
//procedure JumpToContactSettingPage;

{$IFDEF ANDROID}
//获取当前apk版本
function GetAndroidAppVersionName:String;
procedure JumpToAndroidSettingPage(AAction:String;AResultCode:Integer);
function DoAndroidInstallAppPackage(Path:String):Boolean;
{$ENDIF}

{$IFDEF IOS}
//获取bound id
function GetIOSBundleKey(AKey:String): string;
{$ENDIF}

function GetAppPackageName:String;



var
  mime_types: THashedStringList;

  {$IFDEF ANDROID}
  FMessageID_JumpToAndroidSettingPage:Integer;
  //从设置页面返回然后安装APK的路径
  FInstallAPKPath:String;
  {$ENDIF}


  {$IFDEF IOS}
  GlobalUIDocumentInteractionControllerDelegate:TUIDocumentInteractionControllerDelegate;
  GlobaldocumentController:UIDocumentInteractionController;
  function UIApplicationOpenSettingsURLString:NSString;
  {$ENDIF}



implementation


const
  UIKitFwk: string = '/System/Library/Frameworks/UIKit.framework/UIKit';

{$IFDEF IOS}

function UIApplicationOpenSettingsURLString: NSString;
begin
  Result := CocoaNSStringConst(UIKitFwk, 'UIApplicationOpenSettingsURLString');
end;


//获取bound id
function GetIOSBundleKey(AKey:String): string;
var
  AppNameKey: Pointer;
  AppBundle: NSBundle;
  NSAppName: NSString;
begin
  AppNameKey := (StrToNSStr(AKey) as ILocalObject).GetObjectID;
  AppBundle := TNSBundle.Wrap(TNSBundle.OCClass.mainBundle);
  NSAppName := TNSString.Wrap(AppBundle.infoDictionary.objectForKey(AppNameKey));
  Result := UTF8ToString(NSAppName.UTF8String);
end;
{$ENDIF}


{$IFDEF ANDROID}
function GetAndroidAppVersionName:String;
var
  Manager:JPackageManager;
  Info:JPackageInfo;
  Version:JString;
begin
  Manager:=SharedActivityContext.getPackageManager;
  Info:=Manager.getPackageInfo(SharedActivityContext.getPackageName,0);
  Version:=Info.versionName;

  Result:=JStringToString(Version);

//  uBaseLog.OutputDebugString('Android APP CurrentVersion '+CurrentVersion);
end;
{$ENDIF}


procedure MySetClipboard(Atxt:string);
var
  Clipboard: IFMXClipboardService;
  Value: TValue;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService,IInterface(Clipboard)) then
  begin
    Value := TValue.From(Atxt);
    Clipboard.SetClipboard(Value);
  end;
end;

function MyGetClipboard:string;
var
  Clipboard: IFMXClipboardService;
  Value: TValue;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService,IInterface(Clipboard)) then
  begin
    Value:=Clipboard.GetClipboard;
    result:=Value.ToString;
  end;
end;

{$IFDEF ANDROID}
procedure HandleActivityMessageForJumpToAndroidSettingPage(const Sender: TObject; const M: TMessage);
begin
  FMX.Types.Log.d('OrangeUI HandleActivityMessageForJumpToAndroidSettingPage');

  //Const_JumpToAndroidSettingPageForInstallAPK_ResultCode
  if (M is TMessageResultNotification) and (TMessageResultNotification(M).RequestCode = Const_ResultCode_JumpToAndroidSettingPage_ForInstallAPK) then
  begin
      FMX.Types.Log.d('OrangeUI HandleActivityMessageForJumpToAndroidSettingPage RequestCode Const_ResultCode_JumpToAndroidSettingPage_ForInstallAPK');
      //从设置页面回来安装APK
      DoAndroidInstallAppPackage(FInstallAPKPath);
  end;
end;
{$ENDIF}

{$IFDEF ANDROID}
procedure JumpToAndroidSettingPage(AAction:String;AResultCode:Integer);
var
  AIntent:JIntent;
begin

  //授权之后返回
  if FMessageID_JumpToAndroidSettingPage=0 then
  begin
    FMessageID_JumpToAndroidSettingPage := TMessageManager.DefaultManager.SubscribeToMessage(TMessageResultNotification, HandleActivityMessageForJumpToAndroidSettingPage);
  end;


  AIntent:=nil;

  AIntent:=TJIntent.JavaClass.init;
  AIntent.setAction(StringToJString(AAction));
  AIntent.setData(StrToJURI('package:'+JStringToString(TAndroidHelper.Activity.getPackageName)));


  if AIntent<>nil then
  begin
    TAndroidHelper.Activity.startActivityForResult(AIntent,AResultCode);
//    TAndroidHelper.Context.startActivity(AIntent);
  end;
end;
{$ENDIF}

function GetAppPackageName:String;
begin
  Result:='';
  {$IFDEF ANDROID}
  Result:=JStringToString(TAndroidHelper.Activity.getPackageName);
  {$ENDIF}
  {$IFDEF IOS}
   Result:=GetIOSBundleKey('CFBundleIdentifier');
  {$ENDIF}
end;

procedure JumpToLocaitonSettingPage;
{$IFDEF IOS}
var
  ANSURL:NSURL;
{$ENDIF}
{$IFDEF ANDROID}
var
  AIntent:JIntent;
//  AManufactor:String;
//  AComp:JComponentName;
{$ENDIF}
begin
//  ShowMessage('JumpToLocaitonSettingPage');
  {$IFDEF IOS}
  ANSURL:=TNSURL.Wrap(TNSURL.OCClass.URLWithString(UIApplicationOpenSettingsURLString));
  if (SharedApplication.canOpenURL(ANSURL)) then
  begin
      SharedApplication.openURL(ANSURL);
  end;
  {$ENDIF}
  {$IFDEF ANDROID}
//  ShowMessage('JumpToLocaitonSettingPage 1');
  AIntent:=nil;

//  AIntent:=TJIntent.JavaClass.init(TJSettings.JavaClass.ACTION_LOCATION_SOURCE_SETTINGS);


//  TAndroidHelper.Context.startActivity(AIntent);
//  AIntent:=TJIntent.JavaClass.init(TJSettings.JavaClass.ACTION_APPLICATION_DETAILS_SETTINGS);
//  AIntent.setData(StrToJURI('package:'+JStringToString(TAndroidHelper.Activity.getPackageName())));
//  TAndroidHelper.Context.startActivity(AIntent);

//跳转到应用设置界面
//
//public static void toSelfSetting(Context context) {  
//
//    Intent mIntent = new Intent();  
//    mIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);  
//    if (Build.VERSION.SDK_INT >= 9) {  
//        mIntent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");  
//        mIntent.setData(Uri.fromParts("package", context.getPackageName(), null));  
//    } else if (Build.VERSION.SDK_INT <= 8) {  
//        mIntent.setAction(Intent.ACTION_VIEW);  
//        mIntent.setClassName("com.android.settings", "com.android.setting.InstalledAppDetails");  
//        mIntent.putExtra("com.android.settings.ApplicationPkgName", context.getPackageName());  
//    }  
//    context.startActivity(mIntent);  
//}  
//
//  if TOSVersion.Major>=9 then
//  begin


      AIntent:=TJIntent.JavaClass.init;
      AIntent.setAction(TJSettings.JavaClass.ACTION_APPLICATION_DETAILS_SETTINGS);
      AIntent.setData(StrToJURI('package:'+JStringToString(TAndroidHelper.Activity.getPackageName)));

//  end
//  else
//  begin



//  AManufactor:=JStringToString(TJBuild.JavaClass.MANUFACTURER);
////  ShowMessage(AManufactor);
//  if AManufactor.Contains('HUAWEI') then
//  begin
//
//      //Intent intent = new Intent(packageName);
//      //intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//      //ComponentName comp = new ComponentName("com.huawei.systemmanager", "com.huawei.permissionmanager.ui.MainActivity");
//      //intent.setComponent(comp);
//      //mContext.startActivity(intent);
//
//      AIntent:=TJIntent.JavaClass.init(TAndroidHelper.Activity.getPackageName);
//      AIntent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
//      AComp:=TJComponentName.JavaClass.init(StringToJString('com.huawei.systemmanager'),StringToJString('com.huawei.permissionmanager.ui.MainActivit'));
//      AIntent.setComponent(AComp);
//  end
//  else
//  begin
//      AIntent:=TJIntent.JavaClass.init;//(TJSettings.JavaClass.ACTION_LOCATION_SOURCE_SETTINGS);
//      AIntent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
//      AIntent.setAction(TJIntent.JavaClass.ACTION_VIEW);
//      AIntent.setClassName(StringToJString('com.android.settings'),StringToJString('com.android.setting.InstalledAppDetails'));
//      AIntent.putExtra(StringToJString('com.android.settings.ApplicationPkgName'),TAndroidHelper.Activity.getPackageName);
//  end;

//  end;

  if AIntent<>nil then
  begin
    TAndroidHelper.Context.startActivity(AIntent);
  end;

  {$ENDIF}
end;

//procedure JumpToContactSettingPage;
//{$IFDEF IOS}
//var
//  ANSURL:NSURL;
//{$ENDIF}
//{$IFDEF ANDROID}
//var
//  AIntent:JIntent;
//{$ENDIF}
//begin
////  ShowMessage('JumpToLocaitonSettingPage');
//  {$IFDEF IOS}
//  ANSURL:=TNSURL.Wrap(TNSURL.OCClass.URLWithString(UIApplicationOpenSettingsURLString));
//  if (SharedApplication.canOpenURL(ANSURL)) then
//  begin
//      SharedApplication.openURL(ANSURL);
//  end;
//  {$ENDIF}
//  {$IFDEF ANDROID}
//  AIntent:=nil;
//
////  AIntent:=TJIntent.JavaClass.init(TJSettings.JavaClass.Action_);
//
//  if AIntent<>nil then
//  begin
//    TAndroidHelper.Context.startActivity(AIntent);
//  end;
//  {$ENDIF}
//end;

function OpenWebBrowserAndNavigateURL(URL:String):Boolean;
begin
  {$IFDEF MSWINDOWS}
  //FmxHandleToHWND(FMX.Forms.Application.MainForm.Handle)
  ShellExecuteW(0, nil, PWideChar(URL), nil,nil, SW_SHOW);
  {$ENDIF}

  {$IFDEF IOS}
  SharedApplication.openURL(StrToNSUrl(URL));
  {$ENDIF}

  {$IFDEF ANDROID}
  SharedActivityContext.startActivity(TJIntent.JavaClass.getIntent(StringToJString(URL)));
  {$ENDIF}
end;

//根据文件后缀名获得对应的MIME类型
function GetMimeType(ext:string): string;
var
  ret: string;
begin
  ret := mime_types.Values[lowercase(ext)];
  if ret = '' then
    result := mime_types.Values['']
  else
    result := ret;
end;


function GetAndroidAppVersion: string;
  {$IFDEF ANDROID}
var
  vPackageInfo: JPackageInfo;
  vPackageName: JString;
  {$ENDIF}
begin
  {$IFDEF ANDROID}
  vPackageName := SharedActivityContext.getPackageName;
  vPackageInfo := SharedActivityContext.getPackageManager.getPackageInfo(vPackageName, 0);
  Result := JStringToString(vPackageInfo.VersionName);
  {$ENDIF}
end;


function OpenFile(AForm:TForm;AFilePath:String):Boolean;
{$IFDEF IOS}
var
  R:NSRect;
  WindowHandle:TiOSWindowHandle;
{$ENDIF}
{$IFDEF ANDROID}
var
  AFileMimeType:String;
  Intent:JIntent;
  APublicFilePath:String;
{$ENDIF}
begin
  {$IFDEF ANDROID}
//  AFilePath:='http://115.28.240.141:8020/Reports/TSI.pdf';
//    Intent intent = new Intent();
//    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//    //设置intent的Action属性
//    intent.setAction(Intent.ACTION_VIEW);
//    //获取文件file的MIME类型
//    String type = getMIMEType(file);
//    //设置intent的data和Type属性。
//    intent.setDataAndType(/*uri*/Uri.fromFile(file), type);
//    //跳转
//    startActivity(intent);
  Intent := TJIntent.JavaClass.init();
  Intent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
  //设置intent的Action属性
  intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  //获取文件file的MIME类型
  AFileMimeType:=GetMimeType(ReplaceStr(ExtractFileExt(AFilePath),'.',''));

  //设置文件
  //把文件拷贝到公共目录,不然别的程序访问不了
  APublicFilePath:=TPath.GetPublicPath+PathDelim+ExtractFileName(AFilePath);
  TFile.Copy(AFilePath,APublicFilePath,True);
  FMX.Types.Log.d('OrangeUI OpenFile AFileMimeType '+AFileMimeType+' APublicFilePath '+APublicFilePath);
  intent.setDataAndType(
                TJnet_Uri.JavaClass.fromFile(
                    TJFile.JavaClass.init(StringToJString(APublicFilePath))
                    ),
                StringToJString(AFileMimeType));

  SharedActivityContext.startActivity(Intent);
  {$ENDIF}

  {$IFDEF MSWINDOWS}
  ShellExecuteW(FmxHandleToHWND(AForm.Handle), nil, PWideChar(AFilePath), PWideChar(''), PWideChar(AFilePath), SW_SHOW);
  {$ENDIF}

  {$IFDEF IOS}
  GlobaldocumentController:=TUIDocumentInteractionController.Wrap(
            TUIDocumentInteractionController.OCClass
              .interactionControllerWithURL(
                  TNSURL.Wrap(
                    TNSURL.OCClass.fileURLWithPath(
                      StrToNSStr(AFilePath)
                        )
                      )
                    )
                  );
  //interactionControllerWithURL创建的必须来这么一句
  GlobaldocumentController.retain;


  if GlobalUIDocumentInteractionControllerDelegate=nil then
  begin
    GlobalUIDocumentInteractionControllerDelegate:=TUIDocumentInteractionControllerDelegate.Create;
  end;
  GlobalUIDocumentInteractionControllerDelegate.Form:=AForm;
  GlobaldocumentController.setDelegate(
        (GlobalUIDocumentInteractionControllerDelegate as ILocalObject).GetObjectID
        );

  //默认都是0
  R.origin.x := 0;
  R.origin.y := 0;
  R.size.width := 0;
  R.size.height := 0;

  WindowHandle:=WindowHandleToPlatform(AForm.Handle);
  GlobaldocumentController.presentOpenInMenuFromRect(
                      R,
                      WindowHandle.View,
                      True
                      );
  {$ENDIF}
end;



function SendSMS(Mobile:String):Boolean;
//{$IFDEF ANDROID}
//var
//  Intent:JIntent;
//{$ENDIF}
begin
  {$IFDEF IOS}
  SharedApplication.openURL(StrToNSUrl('sms://'+Mobile));
  {$ENDIF}
//  {$IFDEF ANDROID}
//  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SENDTO, StrToJURI('smsto:'+Mobile));
//  Intent.putExtra(StringToJString('sms_body'), StringToJString(''));
//  SharedActivityContext.startActivity(Intent);
//  {$ENDIF}
end;



function Dail(Mobile:String):Boolean;
{$IFDEF ANDROID}
var
  Intent:JIntent;
{$ENDIF}
////{$IFDEF IOS}
//var
//  PhoneDialerService: IFMXPhoneDialerService;
////{$ENDIF}
begin

////  {$IFDEF IOS}
//    { test whether the PhoneDialer services are supported }
//    if TPlatformServices.Current.SupportsPlatformService(IFMXPhoneDialerService, IInterface(PhoneDialerService)) then
//    begin
//        { if the Telephone Number is entered in the edit box then make the call, else
//        display an error message }
////      if edtTelephoneNumber.Text <> '' then
////      begin
//        PhoneDialerService.Call(Mobile);
//        //edtTelephoneNumber.Text);
////      end
////      else
////      begin
////        ShowMessage('Please type in a telephone number.');
////        edtTelephoneNumber.SetFocus;
////      end;
//    end
//    else
//    begin
//        ShowMessage('PhoneDialer service not supported');
//    end;
////  {$ENDIF}


  {$IFDEF IOS}
  SharedApplication.openURL(StrToNSUrl('tel://'+Mobile));
  {$ENDIF}

  {$IFDEF ANDROID}
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_DIAL, StrToJURI('tel:'+Mobile));
  SharedActivityContext.startActivity(Intent);
  {$ENDIF}

  {$IFDEF MSWINDOWS}
  ShowMessage('拨打:'+Mobile);
  {$ENDIF}
end;


{$IFDEF ANDROID}
function DoAndroidInstallAppPackage(Path:String):Boolean;
var
  Intent: JIntent;
  AApkFile: JFile;
  AApkUri: Jnet_Uri;
begin

  Intent:=TJIntent.Create;
  Intent.addFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);


//<!-- 要加这个权限,不然升级包安装不了 -->
//<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES"/>
  Intent.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);


  AApkFile := TJFile.JavaClass.init(StringToJString(Path));
  AApkUri := TAndroidHelper.JFileToJURI(AApkFile);

  //Android下不能安装
  Intent.setDataAndType(
                        AApkUri,//TJnet_Uri.JavaClass.parse(StringToJString('file://'+Path)),
                        StringToJString('application/vnd.android.package-archive')
                        );
  try
    SharedActivity.startActivity(Intent);
    exit(true);
  except
    on e: Exception do
    begin
    end;
  end;

end;
{$ENDIF}


{$IFDEF IOS}
{ TUIDocumentInteractionControllerDelegate }

constructor TUIDocumentInteractionControllerDelegate.Create;
begin
  Inherited Create;
end;

destructor TUIDocumentInteractionControllerDelegate.Destroy;
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.Destroy');
  inherited;
end;

procedure TUIDocumentInteractionControllerDelegate.documentInteractionControllerDidDismissOpenInMenu(
  controller: UIDocumentInteractionController);
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerDidDismissOpenInMenu');
end;

procedure TUIDocumentInteractionControllerDelegate.documentInteractionControllerDidDismissOptionsMenu(
  controller: UIDocumentInteractionController);
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerDidDismissOptionsMenu');
end;

procedure TUIDocumentInteractionControllerDelegate.documentInteractionControllerDidEndPreview(
  controller: UIDocumentInteractionController);
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerDidEndPreview');
end;

procedure TUIDocumentInteractionControllerDelegate.documentInteractionControllerDidEndSendingToApplication(
  controller: UIDocumentInteractionController;
  didEndSendingToApplication: NSString);
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerDidEndSendingToApplication');
end;

function TUIDocumentInteractionControllerDelegate.documentInteractionControllerRectForPreview(
  controller: UIDocumentInteractionController): CGRect;
var
  WindowHandle:TiOSWindowHandle;
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerRectForPreview');
  WindowHandle:=WindowHandleToPlatform(Form.Handle);
  Result:=WindowHandle.View.frame;
end;

function TUIDocumentInteractionControllerDelegate.documentInteractionControllerViewControllerForPreview(
  controller: UIDocumentInteractionController): UIViewController;
var
  WindowHandle:TiOSWindowHandle;
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerViewControllerForPreview');
  WindowHandle:=WindowHandleToPlatform(Form.Handle);
  Result:=WindowHandle.Wnd.rootViewController;
end;

function TUIDocumentInteractionControllerDelegate.documentInteractionControllerViewForPreview(
  controller: UIDocumentInteractionController): UIView;
var
  WindowHandle:TiOSWindowHandle;
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerViewForPreview');
  WindowHandle:=WindowHandleToPlatform(Form.Handle);
  Result:=WindowHandle.View;
end;

procedure TUIDocumentInteractionControllerDelegate.documentInteractionControllerWillBeginPreview(
  controller: UIDocumentInteractionController);
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerWillBeginPreview');
end;

procedure TUIDocumentInteractionControllerDelegate.documentInteractionControllerWillBeginSendingToApplication(
  controller: UIDocumentInteractionController;
  willBeginSendingToApplication: NSString);
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerWillBeginSendingToApplication');
end;

procedure TUIDocumentInteractionControllerDelegate.documentInteractionControllerWillPresentOpenInMenu(
  controller: UIDocumentInteractionController);
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerWillPresentOpenInMenu');
  controller._AddRef;
end;

procedure TUIDocumentInteractionControllerDelegate.documentInteractionControllerWillPresentOptionsMenu(
  controller: UIDocumentInteractionController);
begin
  FMX.Types.Log.d('TUIDocumentInteractionControllerDelegate.documentInteractionControllerWillPresentOptionsMenu');

end;
{$ENDIF}










initialization
  //initialize hashmap
  mime_types := THashedStringList.Create;
  mime_types.Values['apk'] := 'application/vnd.android.package-archive';
  mime_types.Values['3gp'] := 'video/3gpp';
  mime_types.Values['ai'] := 'application/postscript';
  mime_types.Values['aif'] := 'audio/x-aiff';
  mime_types.Values['aifc'] := 'audio/x-aiff';
  mime_types.Values['aiff'] := 'audio/x-aiff';
  mime_types.Values['asc'] := 'text/plain';
  mime_types.Values['atom'] := 'application/atom+xml';
  mime_types.Values['au'] := 'audio/basic';
  mime_types.Values['avi'] := 'video/x-msvideo';
  mime_types.Values['bcpio'] := 'application/x-bcpio';
  mime_types.Values['bin'] := 'application/octet-stream';
  mime_types.Values['bmp'] := 'image/bmp';
  mime_types.Values['cdf'] := 'application/x-netcdf';
  mime_types.Values['cgm'] := 'image/cgm';
  mime_types.Values['class'] := 'application/octet-stream';
  mime_types.Values['cpio'] := 'application/x-cpio';
  mime_types.Values['cpt'] := 'application/mac-compactpro';
  mime_types.Values['csh'] := 'application/x-csh';
  mime_types.Values['css'] := 'text/css';
  mime_types.Values['dcr'] := 'application/x-director';
  mime_types.Values['dif'] := 'video/x-dv';
  mime_types.Values['dir'] := 'application/x-director';
  mime_types.Values['djv'] := 'image/vnd.djvu';
  mime_types.Values['djvu'] := 'image/vnd.djvu';
  mime_types.Values['dll'] := 'application/octet-stream';
  mime_types.Values['dmg'] := 'application/octet-stream';
  mime_types.Values['dms'] := 'application/octet-stream';
  mime_types.Values['doc'] := 'application/msword';
  mime_types.Values['dtd'] := 'application/xml-dtd';
  mime_types.Values['dv'] := 'video/x-dv';
  mime_types.Values['dvi'] := 'application/x-dvi';
  mime_types.Values['dxr'] := 'application/x-director';
  mime_types.Values['eps'] := 'application/postscript';
  mime_types.Values['etx'] := 'text/x-setext';
  mime_types.Values['exe'] := 'application/octet-stream';
  mime_types.Values['ez'] := 'application/andrew-inset';
  mime_types.Values['flv'] := 'video/x-flv';
  mime_types.Values['gif'] := 'image/gif';
  mime_types.Values['gram'] := 'application/srgs';
  mime_types.Values['grxml'] := 'application/srgs+xml';
  mime_types.Values['gtar'] := 'application/x-gtar';
  mime_types.Values['gz'] := 'application/x-gzip';
  mime_types.Values['hdf'] := 'application/x-hdf';
  mime_types.Values['hqx'] := 'application/mac-binhex40';
  mime_types.Values['htm'] := 'text/html';
  mime_types.Values['html'] := 'text/html';
  mime_types.Values['ice'] := 'x-conference/x-cooltalk';
  mime_types.Values['ico'] := 'image/x-icon';
  mime_types.Values['ics'] := 'text/calendar';
  mime_types.Values['ief'] := 'image/ief';
  mime_types.Values['ifb'] := 'text/calendar';
  mime_types.Values['iges'] := 'model/iges';
  mime_types.Values['igs'] := 'model/iges';
  mime_types.Values['jnlp'] := 'application/x-java-jnlp-file';
  mime_types.Values['jp2'] := 'image/jp2';
  mime_types.Values['jpe'] := 'image/jpeg';
  mime_types.Values['jpeg'] := 'image/jpeg';
  mime_types.Values['jpg'] := 'image/jpeg';
  mime_types.Values['js'] := 'application/x-javascript';
  mime_types.Values['kar'] := 'audio/midi';
  mime_types.Values['latex'] := 'application/x-latex';
  mime_types.Values['lha'] := 'application/octet-stream';
  mime_types.Values['lzh'] := 'application/octet-stream';
  mime_types.Values['m3u'] := 'audio/x-mpegurl';
  mime_types.Values['m4a'] := 'audio/mp4a-latm';
  mime_types.Values['m4p'] := 'audio/mp4a-latm';
  mime_types.Values['m4u'] := 'video/vnd.mpegurl';
  mime_types.Values['m4v'] := 'video/x-m4v';
  mime_types.Values['mac'] := 'image/x-macpaint';
  mime_types.Values['man'] := 'application/x-troff-man';
  mime_types.Values['mathml'] := 'application/mathml+xml';
  mime_types.Values['me'] := 'application/x-troff-me';
  mime_types.Values['mesh'] := 'model/mesh';
  mime_types.Values['mid'] := 'audio/midi';
  mime_types.Values['midi'] := 'audio/midi';
  mime_types.Values['mif'] := 'application/vnd.mif';
  mime_types.Values['mov'] := 'video/quicktime';
  mime_types.Values['movie'] := 'video/x-sgi-movie';
  mime_types.Values['mp2'] := 'audio/mpeg';
  mime_types.Values['mp3'] := 'audio/mpeg';
  mime_types.Values['mp4'] := 'video/mp4';
  mime_types.Values['mpe'] := 'video/mpeg';
  mime_types.Values['mpeg'] := 'video/mpeg';
  mime_types.Values['mpg'] := 'video/mpeg';
  mime_types.Values['mpga'] := 'audio/mpeg';
  mime_types.Values['ms'] := 'application/x-troff-ms';
  mime_types.Values['msh'] := 'model/mesh';
  mime_types.Values['mxu'] := 'video/vnd.mpegurl';
  mime_types.Values['nc'] := 'application/x-netcdf';
  mime_types.Values['oda'] := 'application/oda';
  mime_types.Values['ogg'] := 'application/ogg';
  mime_types.Values['ogv'] := 'video/ogv';
  mime_types.Values['pbm'] := 'image/x-portable-bitmap';
  mime_types.Values['pct'] := 'image/pict';
  mime_types.Values['pdb'] := 'chemical/x-pdb';
  mime_types.Values['pdf'] := 'application/pdf';
  mime_types.Values['pgm'] := 'image/x-portable-graymap';
  mime_types.Values['pgn'] := 'application/x-chess-pgn';
  mime_types.Values['pic'] := 'image/pict';
  mime_types.Values['pict'] := 'image/pict';
  mime_types.Values['png'] := 'image/png';
  mime_types.Values['pnm'] := 'image/x-portable-anymap';
  mime_types.Values['pnt'] := 'image/x-macpaint';
  mime_types.Values['pntg'] := 'image/x-macpaint';
  mime_types.Values['ppm'] := 'image/x-portable-pixmap';
  mime_types.Values['ppt'] := 'application/vnd.ms-powerpoint';
  mime_types.Values['ps'] := 'application/postscript';
  mime_types.Values['qt'] := 'video/quicktime';
  mime_types.Values['qti'] := 'image/x-quicktime';
  mime_types.Values['qtif'] := 'image/x-quicktime';
  mime_types.Values['ra'] := 'audio/x-pn-realaudio';
  mime_types.Values['ram'] := 'audio/x-pn-realaudio';
  mime_types.Values['ras'] := 'image/x-cmu-raster';
  mime_types.Values['rdf'] := 'application/rdf+xml';
  mime_types.Values['rgb'] := 'image/x-rgb';
  mime_types.Values['rm'] := 'application/vnd.rn-realmedia';
  mime_types.Values['roff'] := 'application/x-troff';
  mime_types.Values['rtf'] := 'text/rtf';
  mime_types.Values['rtx'] := 'text/richtext';
  mime_types.Values['sgm'] := 'text/sgml';
  mime_types.Values['sgml'] := 'text/sgml';
  mime_types.Values['sh'] := 'application/x-sh';
  mime_types.Values['shar'] := 'application/x-shar';
  mime_types.Values['silo'] := 'model/mesh';
  mime_types.Values['sit'] := 'application/x-stuffit';
  mime_types.Values['skd'] := 'application/x-koan';
  mime_types.Values['skm'] := 'application/x-koan';
  mime_types.Values['skp'] := 'application/x-koan';
  mime_types.Values['skt'] := 'application/x-koan';
  mime_types.Values['smi'] := 'application/smil';
  mime_types.Values['smil'] := 'application/smil';
  mime_types.Values['snd'] := 'audio/basic';
  mime_types.Values['so'] := 'application/octet-stream';
  mime_types.Values['spl'] := 'application/x-futuresplash';
  mime_types.Values['src'] := 'application/x-wais-source';
  mime_types.Values['sv4cpio'] := 'application/x-sv4cpio';
  mime_types.Values['sv4crc'] := 'application/x-sv4crc';
  mime_types.Values['svg'] := 'image/svg+xml';
  mime_types.Values['swf'] := 'application/x-shockwave-flash';
  mime_types.Values['t'] := 'application/x-troff';
  mime_types.Values['tar'] := 'application/x-tar';
  mime_types.Values['tcl'] := 'application/x-tcl';
  mime_types.Values['tex'] := 'application/x-tex';
  mime_types.Values['texi'] := 'application/x-texinfo';
  mime_types.Values['texinfo'] := 'application/x-texinfo';
  mime_types.Values['tif'] := 'image/tiff';
  mime_types.Values['tiff'] := 'image/tiff';
  mime_types.Values['tr'] := 'application/x-troff';
  mime_types.Values['tsv'] := 'text/tab-separated-values';
  mime_types.Values['txt'] := 'text/plain';
  mime_types.Values['ustar'] := 'application/x-ustar';
  mime_types.Values['vcd'] := 'application/x-cdlink';
  mime_types.Values['vrml'] := 'model/vrml';
  mime_types.Values['vxml'] := 'application/voicexml+xml';
  mime_types.Values['wav'] := 'audio/x-wav';
  mime_types.Values['wbmp'] := 'image/vnd.wap.wbmp';
  mime_types.Values['wbxml'] := 'application/vnd.wap.wbxml';
  mime_types.Values['webm'] := 'video/webm';
  mime_types.Values['wml'] := 'text/vnd.wap.wml';
  mime_types.Values['wmlc'] := 'application/vnd.wap.wmlc';
  mime_types.Values['wmls'] := 'text/vnd.wap.wmlscript';
  mime_types.Values['wmlsc'] := 'application/vnd.wap.wmlscriptc';
  mime_types.Values['wmv'] := 'video/x-ms-wmv';
  mime_types.Values['wrl'] := 'model/vrml';
  mime_types.Values['xbm'] := 'image/x-xbitmap';
  mime_types.Values['xht'] := 'application/xhtml+xml';
  mime_types.Values['xhtml'] := 'application/xhtml+xml';
  mime_types.Values['xls'] := 'application/vnd.ms-excel';
  mime_types.Values['xml'] := 'application/xml';
  mime_types.Values['xpm'] := 'image/x-xpixmap';
  mime_types.Values['xsl'] := 'application/xml';
  mime_types.Values['xslt'] := 'application/xslt+xml';
  mime_types.Values['xul'] := 'application/vnd.mozilla.xul+xml';
  mime_types.Values['xwd'] := 'image/x-xwindowdump';
  mime_types.Values['xyz'] := 'chemical/x-xyz';
  mime_types.Values['zip'] := 'application/zip';
  mime_types.Values[''] := 'application/octet-stream'; //new

finalization
  FreeAndNil(mime_types);



end.



