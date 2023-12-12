
#import <UIKit/UIKit.h>

@interface QsSdkAppInfo : NSObject

+(QsSdkAppInfo *)insQsSdk;

-(NSString *)getQsSdkVersion;

-(NSString *)getQsSdkBundleId;

-(NSString *)getQsSdkAppVersion;

-(NSString *)getQsSdkAppBuildVersion;

-(NSString *)getQsSdkAppName;

-(UIView *)getQsSdkCurrentView;

-(UIViewController *)getQsSdkCurrentViewController;


@end



