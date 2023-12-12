#import <UIKit/UIKit.h>
#import <QsSdk/QsSdkRoleInfo.h>
#import <QsSdk/QsSdkOrderInfo.h>

typedef void (^ChannelInitQsSdkSuccess)(void);
typedef void (^ChannelInitQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);
typedef void (^ChannelLoginQsSdkSuccess)(NSString * _Nullable userId, NSString * _Nullable token, NSString * _Nullable ext);
typedef void (^ChannelLoginQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);
typedef void (^ChannelLogoutQsSdkSuccess)(void);
typedef void (^ChannelPayQsSdkSuccess)(NSString * _Nullable orderId);
typedef void (^ChannelPayQsSdkFail)(NSString * _Nullable code, NSString * _Nullable msg);


@interface QsSdkChannel : NSObject

+(instancetype _Nonnull )insQsSdk;

-(NSString *_Nonnull)getQsSdkChannelVersion;

- (void)channelInitQsSdk:(ChannelInitQsSdkSuccess _Nonnull )initSuccess initFail:(ChannelInitQsSdkFail _Nonnull)initFail loginSuccess:(ChannelLoginQsSdkSuccess _Nonnull)loginSuccess loginFail:(ChannelLoginQsSdkFail _Nonnull)loginFail logoutSuccess:(ChannelLogoutQsSdkSuccess _Nonnull)logoutSuccess paySuccess:(ChannelPayQsSdkSuccess _Nonnull)paySuccess payFail:(ChannelPayQsSdkFail _Nonnull)payFail;

- (void)channelLoginQsSdk;

- (void)channelLogoutQsSdk;

- (void)channelPayQsSdk:(QsSdkOrderInfo *_Nonnull)orderInfo;

- (void)channelUploadQsSdkRoleInfo:(QsSdkRoleInfo *_Nonnull)roleInfo type:(QsSdkUploadType)type;




- (BOOL)application:(UIApplication *_Nullable)application didFinishLaunchingWithOptions:(NSDictionary *_Nullable)launchOptions;

- (void)applicationWillResignActive:(UIApplication *_Nullable)application;

- (void) applicationDidEnterBackground:(UIApplication *_Nullable)application;

- (void) applicationWillEnterForeground:(UIApplication *_Nullable)application;

- (void) applicationDidBecomeActive:(UIApplication *_Nullable)application;

- (void) applicationWillTerminate:(UIApplication *_Nullable)application;

- (void)application:(UIApplication *_Nullable)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *_Nullable)deviceToken;

- (void)application:(UIApplication *_Nullable)application didFailToRegisterForRemoteNotificationsWithError:(NSError *_Nullable)error;

- (void)application:(UIApplication *_Nullable)application didReceiveRemoteNotification:(NSDictionary *_Nullable)userInfo;

-(UIInterfaceOrientationMask)application:(UIApplication *_Nullable)application supportedInterfaceOrientationsForWindow:(UIWindow *_Nullable)window;

- (BOOL)application:(UIApplication *_Nullable)application handleOpenURL:(NSURL *_Nullable)url;

- (BOOL)application:(UIApplication *_Nullable)application openURL:(NSURL *_Nullable)url sourceApplication:(NSString *_Nullable)sourceApplication annotation:(id _Nullable )annotation;

- (BOOL)application:(UIApplication *_Nullable)application openURL:(NSURL *_Nullable)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *_Nullable)options;

- (BOOL)application:(UIApplication *_Nullable)application continueUserActivity:(NSUserActivity *_Nullable)userActivity restorationHandler:(void(^_Nullable)(NSArray *_Nullable restorableObjects))restorationHandler;
@end
