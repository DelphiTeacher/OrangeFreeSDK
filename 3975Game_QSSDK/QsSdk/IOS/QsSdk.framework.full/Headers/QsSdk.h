#import <UIKit/UIKit.h>

#import <QsSdk/QsSdkDef.h>
#import <QsSdk/QsSdkRoleInfo.h>
#import <QsSdk/QsSdkOrderInfo.h>
#import <QsSdk/QsSdkBoxInfo.h>


@interface QsSdk : NSObject

+ (void)initQsSdk:(InitQsSdkSuccess _Nonnull )initSuccess initFail:(InitQsSdkFail _Nonnull)initFail loginSuccess:(LoginQsSdkSuccess _Nonnull)loginSuccess loginFail:(LoginQsSdkFail _Nonnull)loginFail logoutSuccess:(LogoutQsSdkSuccess _Nonnull)logoutSuccess paySuccess:(PayQsSdkSuccess _Nonnull)paySuccess payFail:(PayQsSdkFail _Nonnull)payFail uploadSuccess:(UploadRoleInfoQsSdkSuccess _Nonnull)uploadSuccess uploadFail:(UploadRoleInfoQsSdkFail _Nonnull)uploadFail;

+ (void)loginQsSdk;

+ (void)logoutQsSdk;

+ (void)payQsSdk:(QsSdkOrderInfo *_Nonnull)orderInfo;

+ (void)uploadQsSdkRoleInfo:(QsSdkRoleInfo *_Nonnull)roleInfo type:(QsSdkUploadType)type;




+ (BOOL)application:(UIApplication *_Nullable)application didFinishLaunchingWithOptions:(NSDictionary *_Nullable)launchOptions;

+ (void)applicationWillResignActive:(UIApplication *_Nullable)application;

+ (void) applicationDidEnterBackground:(UIApplication *_Nullable)application;

+ (void) applicationWillEnterForeground:(UIApplication *_Nullable)application;

+ (void) applicationDidBecomeActive:(UIApplication *_Nullable)application;

+ (void) applicationWillTerminate:(UIApplication *_Nullable)application;

+ (void)application:(UIApplication *_Nullable)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *_Nullable)deviceToken;

+ (void)application:(UIApplication *_Nullable)application didFailToRegisterForRemoteNotificationsWithError:(NSError *_Nullable)error;

+ (void)application:(UIApplication *_Nullable)application didReceiveRemoteNotification:(NSDictionary *_Nullable)userInfo;

+(UIInterfaceOrientationMask)application:(UIApplication *_Nullable)application supportedInterfaceOrientationsForWindow:(UIWindow *_Nullable)window;

+ (BOOL)application:(UIApplication *_Nullable)application handleOpenURL:(NSURL *_Nullable)url;

+ (BOOL)application:(UIApplication *_Nullable)application openURL:(NSURL *_Nullable)url sourceApplication:(NSString *_Nullable)sourceApplication annotation:(id _Nullable )annotation;

+ (BOOL)application:(UIApplication *_Nullable)application openURL:(NSURL *_Nullable)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *_Nullable)options;

+ (BOOL)application:(UIApplication *_Nullable)application continueUserActivity:(NSUserActivity *_Nullable)userActivity restorationHandler:(void(^_Nullable)(NSArray *_Nullable restorableObjects))restorationHandler;



+(void)setQsSdkBoxParams:(QsSdkBoxInfo *_Nullable)boxInfo;

+(void)boxInitQsSdk:(PayQsSdkSuccess _Nonnull)paySuccess payFail:(PayQsSdkFail _Nonnull)payFail uploadSuccess:(UploadRoleInfoQsSdkSuccess _Nonnull)uploadSuccess uploadFail:(UploadRoleInfoQsSdkFail _Nonnull)uploadFail;

+(void)boxLoginQsSdk:(LoginQsSdkSuccess _Nonnull)loginSuccess;

+(void)boxShowAgeTipsQsSdk;

+(void)boxHideAgeTipsQsSdk;

@end


