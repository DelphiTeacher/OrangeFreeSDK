
#import <UIKit/UIKit.h>

@interface QsSdkDeviceInfo : NSObject

+(QsSdkDeviceInfo *)insQsSdk;

-(NSString *)getQsSdkIDFA;

-(NSString *)getQsSdkIDFV;

-(NSString *)getQsSdkDeviceId;

// 判断是否是刘海屏
-(BOOL)isIPhoneNotchScreenQsSdk;
 
// 获取刘海屏高度
-(CGFloat)getIPhoneNotchScreenHeightQsSdk;

-(NSString *)getQsSdkDeviceModel;

-(NSString *)getQsSdkSystemVersion;

-(NSString *)getQsSdkUA;

-(NSString *)getQsSdkNetType;

-(NSString *)getQsSdkNetIsp;

-(NSString *)getQsSdkResolution;
@end



