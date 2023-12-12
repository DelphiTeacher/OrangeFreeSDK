

#import "AppDelegate.h"
#import "ViewController.h"

#import <QsSdk/QsSdk.h>

@interface AppDelegate ()

@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    //此处填入原来游戏的viercontroller
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *controller = [[ViewController alloc] init];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];

    
    
    NSLog(@"didFinishLaunchingWithOptions ------------------  ");
    [QsSdk application:application didFinishLaunchingWithOptions:launchOptions];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application{
    [QsSdk applicationWillResignActive:application];
}

- (void) applicationDidEnterBackground:(UIApplication *)application{
    [QsSdk applicationDidEnterBackground:application];
}

- (void) applicationWillEnterForeground:(UIApplication *)application{
    [QsSdk applicationWillEnterForeground:application];
}

- (void) applicationDidBecomeActive:(UIApplication *)application{
    [QsSdk applicationDidBecomeActive:application];
}

- (void) applicationWillTerminate:(UIApplication *)application{
    [QsSdk applicationWillTerminate:application];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [QsSdk application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    [QsSdk application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [QsSdk application:application didReceiveRemoteNotification:userInfo];
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window{
    return [QsSdk application:application supportedInterfaceOrientationsForWindow:window];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    [QsSdk application:application handleOpenURL:url];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    [QsSdk application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    [QsSdk application:application openURL:url options:options];
    return YES;
}



@end

