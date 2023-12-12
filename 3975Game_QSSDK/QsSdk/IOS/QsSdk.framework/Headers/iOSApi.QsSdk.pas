unit iOSApi.QsSdk;

interface

{$IFDEF IOS}
uses
	//#import <UIKit/UIKit.h>
	iOSapi.UIKit,
	//#import <QsSdk/QsSdkDef.h>
	iOSapi.QsSdkDef,
	//#import <QsSdk/QsSdkRoleInfo.h>
	iOSapi.QsSdkRoleInfo,
	//#import <QsSdk/QsSdkOrderInfo.h>
	iOSapi.QsSdkOrderInfo,
	//#import <QsSdk/QsSdkBoxInfo.h>
	iOSapi.QsSdkBoxInfo,
	MacApi.ObjectiveC,
	iOSApi.CocoaTypes,
	iOSApi.CoreGraphics,
	iOSApi.OpenGLES,
	iOSApi.Foundation,
	iOSApi.CoreLocation,
	Macapi.ObjCRuntime,
	SysUtils,Types,FMX.Types,Classes;

type
	//declare pointer
	id=Pointer;

	
	
	
//	TEvent=function ():{_Nullable}void(^)(NSArray of object;
	//@interface QsSdk : NSObject
	//@interface QsSdk : NSObject
	QsSdk=interface(NSObject)//
	['{4469444E-5480-46C3-8B14-F310327C15F0}']
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	end;
	
	QsSdkClass=interface(NSObjectClass)//
	['{73FE343C-B581-4474-9E59-865DFACAC405}']
		//+ (void)initQsSdk:(InitQsSdkSuccess _Nonnull )initSuccess initFail:(InitQsSdkFail _Nonnull)initFail loginSuccess:(LoginQsSdkSuccess _Nonnull)loginSuccess loginFail:(LoginQsSdkFail _Nonnull)loginFail logoutSuccess:(LogoutQsSdkSuccess _Nonnull)logoutSuccess paySuccess:(PayQsSdkSuccess _Nonnull)paySuccess payFail:(PayQsSdkFail _Nonnull)payFail uploadSuccess:(UploadRoleInfoQsSdkSuccess _Nonnull)uploadSuccess uploadFail:(UploadRoleInfoQsSdkFail _Nonnull)uploadFail;
//		[MethodName('initQsSdk:initFail:loginSuccess:loginFail:logoutSuccess:paySuccess:payFail:uploadSuccess:uploadFail:')]
//		procedure initQsSdkinitFailloginSuccessloginFaillogoutSuccesspaySuccesspayFailuploadSuccessuploadFail(initSuccess:{_Nonnull}InitQsSdkSuccess;initFail:{_Nonnull}InitQsSdkFail;loginSuccess:{_Nonnull}LoginQsSdkSuccess;loginFail:{_Nonnull}LoginQsSdkFail;logoutSuccess:{_Nonnull}LogoutQsSdkSuccess;paySuccess:{_Nonnull}PayQsSdkSuccess;payFail:{_Nonnull}PayQsSdkFail;uploadSuccess:{_Nonnull}UploadRoleInfoQsSdkSuccess;uploadFail:{_Nonnull}UploadRoleInfoQsSdkFail);cdecl;

		//+ (void)loginQsSdk;
		procedure loginQsSdk;cdecl;
		
		//+ (void)logoutQsSdk;
		procedure logoutQsSdk;cdecl;
		
		//+ (void)payQsSdk:(QsSdkOrderInfo *_Nonnull)orderInfo;
		procedure payQsSdk(orderInfo:{_Nonnull}QsSdkOrderInfo);cdecl;
		
		//+ (void)uploadQsSdkRoleInfo:(QsSdkRoleInfo *_Nonnull)roleInfo type:(QsSdkUploadType)type;
		[MethodName('uploadQsSdkRoleInfo:type:')]
		procedure uploadQsSdkRoleInfotype(roleInfo:{_Nonnull}QsSdkRoleInfo;_type:QsSdkUploadType);cdecl;
		
		//+ (BOOL)application:(UIApplication *_Nullable)application didFinishLaunchingWithOptions:(NSDictionary *_Nullable)launchOptions;
		[MethodName('application:didFinishLaunchingWithOptions:')]
		function applicationdidFinishLaunchingWithOptions(application:{_Nullable}UIApplication;launchOptions:{_Nullable}NSDictionary):Boolean;cdecl;
		
		//+ (void)applicationWillResignActive:(UIApplication *_Nullable)application;
		procedure applicationWillResignActive(application:{_Nullable}UIApplication);cdecl;
		
		//+ (void) applicationDidEnterBackground:(UIApplication *_Nullable)application;
		procedure applicationDidEnterBackground(application:{_Nullable}UIApplication);cdecl;
		
		//+ (void) applicationWillEnterForeground:(UIApplication *_Nullable)application;
		procedure applicationWillEnterForeground(application:{_Nullable}UIApplication);cdecl;
		
		//+ (void) applicationDidBecomeActive:(UIApplication *_Nullable)application;
		procedure applicationDidBecomeActive(application:{_Nullable}UIApplication);cdecl;
		
		//+ (void) applicationWillTerminate:(UIApplication *_Nullable)application;
		procedure applicationWillTerminate(application:{_Nullable}UIApplication);cdecl;
		
		//+ (void)application:(UIApplication *_Nullable)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *_Nullable)deviceToken;
		[MethodName('application:didRegisterForRemoteNotificationsWithDeviceToken:')]
		procedure applicationdidRegisterForRemoteNotificationsWithDeviceToken(application:{_Nullable}UIApplication;deviceToken:{_Nullable}NSData);cdecl;
		
		//+ (void)application:(UIApplication *_Nullable)application didFailToRegisterForRemoteNotificationsWithError:(NSError *_Nullable)error;
		[MethodName('application:didFailToRegisterForRemoteNotificationsWithError:')]
		procedure applicationdidFailToRegisterForRemoteNotificationsWithError(application:{_Nullable}UIApplication;error:{_Nullable}NSError);cdecl;
		
		//+ (void)application:(UIApplication *_Nullable)application didReceiveRemoteNotification:(NSDictionary *_Nullable)userInfo;
		[MethodName('application:didReceiveRemoteNotification:')]
		procedure applicationdidReceiveRemoteNotification(application:{_Nullable}UIApplication;userInfo:{_Nullable}NSDictionary);cdecl;
		
		//+(UIInterfaceOrientationMask)application:(UIApplication *_Nullable)application supportedInterfaceOrientationsForWindow:(UIWindow *_Nullable)window;
		[MethodName('application:supportedInterfaceOrientationsForWindow:')]
		function applicationsupportedInterfaceOrientationsForWindow(application:{_Nullable}UIApplication;window:{_Nullable}UIWindow):UIInterfaceOrientationMask;cdecl;
		
		//+ (BOOL)application:(UIApplication *_Nullable)application handleOpenURL:(NSURL *_Nullable)url;
		[MethodName('application:handleOpenURL:')]
		function applicationhandleOpenURL(application:{_Nullable}UIApplication;url:{_Nullable}NSURL):Boolean;cdecl;
		
		//+ (BOOL)application:(UIApplication *_Nullable)application openURL:(NSURL *_Nullable)url sourceApplication:(NSString *_Nullable)sourceApplication annotation:(id _Nullable )annotation;
		[MethodName('application:openURL:sourceApplication:annotation:')]
		function applicationopenURLsourceApplicationannotation(application:{_Nullable}UIApplication;url:{_Nullable}NSURL;sourceApplication:{_Nullable}NSString;annotation:{_Nullable}id):Boolean;cdecl;
		
		//+ (BOOL)application:(UIApplication *_Nullable)application openURL:(NSURL *_Nullable)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *_Nullable)options;
		[MethodName('application:openURL:options:')]
		function applicationopenURLoptions(application:{_Nullable}UIApplication;url:{_Nullable}NSURL;options:{_Nullable}NSDictionary{<UIApplicationOpenURLOptionsKey,id>}):Boolean;cdecl;
		
		//+ (BOOL)application:(UIApplication *_Nullable)application continueUserActivity:(NSUserActivity *_Nullable)userActivity restorationHandler:(void(^_Nullable)(NSArray *_Nullable restorableObjects))restorationHandler;
//		[MethodName('application:continueUserActivity:restorationHandler:')]
//		function applicationcontinueUserActivityrestorationHandler(application:{_Nullable}UIApplication;userActivity:{_Nullable}NSUserActivity;restorationHandler:{_Nullable}void(^)(NSArray * restorableObjects)):Boolean;cdecl;

		//+(void)setQsSdkBoxParams:(QsSdkBoxInfo *_Nullable)boxInfo;
		procedure setQsSdkBoxParams(boxInfo:{_Nullable}QsSdkBoxInfo);cdecl;
		
//		//+(void)boxInitQsSdk:(PayQsSdkSuccess _Nonnull)paySuccess payFail:(PayQsSdkFail _Nonnull)payFail uploadSuccess:(UploadRoleInfoQsSdkSuccess _Nonnull)uploadSuccess uploadFail:(UploadRoleInfoQsSdkFail _Nonnull)uploadFail;
//		[MethodName('boxInitQsSdk:payFail:uploadSuccess:uploadFail:')]
//		procedure boxInitQsSdkpayFailuploadSuccessuploadFail(paySuccess:{_Nonnull}PayQsSdkSuccess;payFail:{_Nonnull}PayQsSdkFail;uploadSuccess:{_Nonnull}UploadRoleInfoQsSdkSuccess;uploadFail:{_Nonnull}UploadRoleInfoQsSdkFail);cdecl;
//
//		//+(void)boxLoginQsSdk:(LoginQsSdkSuccess _Nonnull)loginSuccess;
//		procedure boxLoginQsSdk(loginSuccess:{_Nonnull}LoginQsSdkSuccess);cdecl;

		//+(void)boxShowAgeTipsQsSdk;
		procedure boxShowAgeTipsQsSdk;cdecl;
		
		//+(void)boxHideAgeTipsQsSdk;
		procedure boxHideAgeTipsQsSdk;cdecl;
		
	end;
	
	TQsSdk=class(TOCGenericImport<QsSdkClass,QsSdk>)
	end;
	
	
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdk_FakeLoader : QsSdk; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdk';
{$O+}



{$ENDIF}

end.

