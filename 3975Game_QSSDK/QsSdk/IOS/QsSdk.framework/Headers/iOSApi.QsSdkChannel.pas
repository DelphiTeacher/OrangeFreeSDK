unit iOSApi.QsSdkChannel;

interface

{$IFDEF IOS}
uses
	//#import <UIKit/UIKit.h>
	iOSapi.UIKit,
	//#import <QsSdk/QsSdkRoleInfo.h>
	iOSapi.QsSdkRoleInfo,
	//#import <QsSdk/QsSdkOrderInfo.h>
	iOSapi.QsSdkOrderInfo,
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

  instancetype=Pointer;
  NSUserActivity=Pointer;

	TChannelInitQsSdkSuccessEvent=procedure () of object;
	//typedef void (^ChannelInitQsSdkSuccess)(void);
  ChannelInitQsSdkSuccess=TChannelInitQsSdkSuccessEvent;

	//typedef void (^ChannelInitQsSdkSuccess)(void);
	TChannelInitQsSdkFailEvent=procedure (code:NSString;msg:NSString) of object;
	//typedef void (^ChannelInitQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);
  ChannelInitQsSdkFail=TChannelInitQsSdkFailEvent;

	//typedef void (^ChannelInitQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);
	TChannelLoginQsSdkSuccessEvent=procedure (userId:NSString;token:NSString;ext:NSString) of object;
	//typedef void (^ChannelLoginQsSdkSuccess)(NSString * _Nullable userId, NSString * _Nullable token, NSString * _Nullable ext);
  ChannelLoginQsSdkSuccess=TChannelLoginQsSdkSuccessEvent;

	//typedef void (^ChannelLoginQsSdkSuccess)(NSString * _Nullable userId, NSString * _Nullable token, NSString * _Nullable ext);
	TChannelLoginQsSdkFailEvent=procedure (code:NSString;msg:NSString) of object;
	//typedef void (^ChannelLoginQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);
  ChannelLoginQsSdkFail=TChannelLoginQsSdkFailEvent;

	//typedef void (^ChannelLoginQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);
	TChannelLogoutQsSdkSuccessEvent=procedure () of object;
	//typedef void (^ChannelLogoutQsSdkSuccess)(void);
  ChannelLogoutQsSdkSuccess=TChannelLogoutQsSdkSuccessEvent;

	//typedef void (^ChannelLogoutQsSdkSuccess)(void);
	TChannelPayQsSdkSuccessEvent=procedure (orderId:NSString) of object;
	//typedef void (^ChannelPayQsSdkSuccess)(NSString * _Nullable orderId);
  ChannelPayQsSdkSuccess=TChannelPayQsSdkSuccessEvent;

	//typedef void (^ChannelPayQsSdkSuccess)(NSString * _Nullable orderId);
	TChannelPayQsSdkFailEvent=procedure (code:NSString;msg:NSString) of object;
	//typedef void (^ChannelPayQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);
  ChannelPayQsSdkFail=TChannelPayQsSdkFailEvent;

	//typedef void (^ChannelPayQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);
	
	
//	TEvent=function ():{_Nullable}void(^)(NSArray of object;
	//@interface QsSdkChannel : NSObject
	//@interface QsSdkChannel : NSObject
	QsSdkChannel=interface(NSObject)//
	['{4269F16B-2492-4BE1-839E-B981B238D7B5}']
		
		
		//-(NSString *_Nonnull)getQsSdkChannelVersion;
		function getQsSdkChannelVersion:{_Nonnull}NSString;cdecl;
		
		
		//- (void)channelInitQsSdk:(ChannelInitQsSdkSuccess _Nonnull )initSuccess initFail:(ChannelInitQsSdkFail _Nonnull)initFail loginSuccess:(ChannelLoginQsSdkSuccess _Nonnull)loginSuccess loginFail:(ChannelLoginQsSdkFail _Nonnull)loginFail logoutSuccess:(ChannelLogoutQsSdkSuccess _Nonnull)logoutSuccess paySuccess:(ChannelPayQsSdkSuccess _Nonnull)paySuccess payFail:(ChannelPayQsSdkFail _Nonnull)payFail;
		[MethodName('channelInitQsSdk:initFail:loginSuccess:loginFail:logoutSuccess:paySuccess:payFail:')]
		procedure channelInitQsSdkinitFailloginSuccessloginFaillogoutSuccesspaySuccesspayFail(initSuccess:{_Nonnull}ChannelInitQsSdkSuccess;initFail:{_Nonnull}ChannelInitQsSdkFail;loginSuccess:{_Nonnull}ChannelLoginQsSdkSuccess;loginFail:{_Nonnull}ChannelLoginQsSdkFail;logoutSuccess:{_Nonnull}ChannelLogoutQsSdkSuccess;paySuccess:{_Nonnull}ChannelPayQsSdkSuccess;payFail:{_Nonnull}ChannelPayQsSdkFail);cdecl;
		
		
		//- (void)channelLoginQsSdk;
		procedure channelLoginQsSdk;cdecl;

		
		//- (void)channelLogoutQsSdk;
		procedure channelLogoutQsSdk;cdecl;
		
		
		//- (void)channelPayQsSdk:(QsSdkOrderInfo *_Nonnull)orderInfo;
		procedure channelPayQsSdk(orderInfo:{_Nonnull}QsSdkOrderInfo);cdecl;
		
		
		//- (void)channelUploadQsSdkRoleInfo:(QsSdkRoleInfo *_Nonnull)roleInfo type:(QsSdkUploadType)type;
		[MethodName('channelUploadQsSdkRoleInfo:type:')]
		procedure channelUploadQsSdkRoleInfotype(roleInfo:{_Nonnull}QsSdkRoleInfo;_type:QsSdkUploadType);cdecl;
		
		
		
		
		
		//- (BOOL)application:(UIApplication *_Nullable)application didFinishLaunchingWithOptions:(NSDictionary *_Nullable)launchOptions;
		[MethodName('application:didFinishLaunchingWithOptions:')]
		function applicationdidFinishLaunchingWithOptions(application:{_Nullable}UIApplication;launchOptions:{_Nullable}NSDictionary):Boolean;cdecl;
		
		
		//- (void)applicationWillResignActive:(UIApplication *_Nullable)application;
		procedure applicationWillResignActive(application:{_Nullable}UIApplication);cdecl;
		
		
		//- (void) applicationDidEnterBackground:(UIApplication *_Nullable)application;
		procedure applicationDidEnterBackground(application:{_Nullable}UIApplication);cdecl;
		
		
		//- (void) applicationWillEnterForeground:(UIApplication *_Nullable)application;
		procedure applicationWillEnterForeground(application:{_Nullable}UIApplication);cdecl;
		
		
		//- (void) applicationDidBecomeActive:(UIApplication *_Nullable)application;
		procedure applicationDidBecomeActive(application:{_Nullable}UIApplication);cdecl;
		
		
		//- (void) applicationWillTerminate:(UIApplication *_Nullable)application;
		procedure applicationWillTerminate(application:{_Nullable}UIApplication);cdecl;
		
		
		//- (void)application:(UIApplication *_Nullable)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *_Nullable)deviceToken;
		[MethodName('application:didRegisterForRemoteNotificationsWithDeviceToken:')]
		procedure applicationdidRegisterForRemoteNotificationsWithDeviceToken(application:{_Nullable}UIApplication;deviceToken:{_Nullable}NSData);cdecl;
		
		
		//- (void)application:(UIApplication *_Nullable)application didFailToRegisterForRemoteNotificationsWithError:(NSError *_Nullable)error;
		[MethodName('application:didFailToRegisterForRemoteNotificationsWithError:')]
		procedure applicationdidFailToRegisterForRemoteNotificationsWithError(application:{_Nullable}UIApplication;error:{_Nullable}NSError);cdecl;
		
		
		//- (void)application:(UIApplication *_Nullable)application didReceiveRemoteNotification:(NSDictionary *_Nullable)userInfo;
		[MethodName('application:didReceiveRemoteNotification:')]
		procedure applicationdidReceiveRemoteNotification(application:{_Nullable}UIApplication;userInfo:{_Nullable}NSDictionary);cdecl;
		
		
		//-(UIInterfaceOrientationMask)application:(UIApplication *_Nullable)application supportedInterfaceOrientationsForWindow:(UIWindow *_Nullable)window;
		[MethodName('application:supportedInterfaceOrientationsForWindow:')]
		function applicationsupportedInterfaceOrientationsForWindow(application:{_Nullable}UIApplication;window:{_Nullable}UIWindow):UIInterfaceOrientationMask;cdecl;
		
		
		//- (BOOL)application:(UIApplication *_Nullable)application handleOpenURL:(NSURL *_Nullable)url;
		[MethodName('application:handleOpenURL:')]
		function applicationhandleOpenURL(application:{_Nullable}UIApplication;url:{_Nullable}NSURL):Boolean;cdecl;
		
		
		//- (BOOL)application:(UIApplication *_Nullable)application openURL:(NSURL *_Nullable)url sourceApplication:(NSString *_Nullable)sourceApplication annotation:(id _Nullable )annotation;
		[MethodName('application:openURL:sourceApplication:annotation:')]
		function applicationopenURLsourceApplicationannotation(application:{_Nullable}UIApplication;url:{_Nullable}NSURL;sourceApplication:{_Nullable}NSString;annotation:{_Nullable}id):Boolean;cdecl;
		
		
		//- (BOOL)application:(UIApplication *_Nullable)application openURL:(NSURL *_Nullable)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *_Nullable)options;
		[MethodName('application:openURL:options:')]
		function applicationopenURLoptions(application:{_Nullable}UIApplication;url:{_Nullable}NSURL;options:{_Nullable}NSDictionary{<UIApplicationOpenURLOptionsKey,id>}):Boolean;cdecl;
		
		
		//- (BOOL)application:(UIApplication *_Nullable)application continueUserActivity:(NSUserActivity *_Nullable)userActivity restorationHandler:(void(^_Nullable)(NSArray *_Nullable restorableObjects))restorationHandler;
		[MethodName('application:continueUserActivity:restorationHandler:')]
		function applicationcontinueUserActivityrestorationHandler(application:{_Nullable}UIApplication;userActivity:{_Nullable}NSUserActivity;restorationHandler:Pointer{_Nullable}{void(^)(NSArray * restorableObjects)}):Boolean;cdecl;
		
	end;
	
	QsSdkChannelClass=interface(NSObjectClass)//
	['{E04A949B-F40B-4538-A7E8-DE2A7CD12883}']
		//+(instancetype _Nonnull )insQsSdk;
		function insQsSdk:{_Nonnull}instancetype;cdecl;
		
	end;
	
	TQsSdkChannel=class(TOCGenericImport<QsSdkChannelClass,QsSdkChannel>)
	end;
	
	
	
	
{$ENDIF}

implementation

{$IFDEF IOS}

{$O-}
function QsSdkChannel_FakeLoader : QsSdkChannel; cdecl; external {$I FrameworkDylibPath_QsSdk.inc} name 'OBJC_CLASS_$_QsSdkChannel';
{$O+}



{$ENDIF}

end.

