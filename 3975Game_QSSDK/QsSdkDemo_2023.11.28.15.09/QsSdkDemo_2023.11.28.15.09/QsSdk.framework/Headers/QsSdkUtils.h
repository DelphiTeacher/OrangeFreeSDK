#import <UIKit/UIKit.h>

@interface QsSdkUtils : NSObject

+(void)saveScreenCutPhotoQsSdk:(UIView *)view;

+(BOOL)checkNullQsSdk:(NSString *)text;

+(NSString *)dicToJsonQsSdk:(NSDictionary *)dic;

@end

