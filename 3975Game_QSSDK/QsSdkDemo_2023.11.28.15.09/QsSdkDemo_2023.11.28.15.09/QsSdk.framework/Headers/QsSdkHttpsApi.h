
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QsSdkDef.h"

#import "QsSdkHttpResponse.h"


typedef void (^QsSdkRequestSuccess)(QsSdkHttpResponse*);
typedef void (^QsSdkRequestError)(NSString*);

@interface QsSdkHttpsApi : NSObject

+(QsSdkHttpsApi*)insQsSdk;

-(NSString *)getQsSdkPayUrl;

-(NSString *)getQsSdkUserCenter1Url;

-(void)doQsSdkGetInitConfigRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkGetRandomAccountRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkGetPicCodeRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkGetPhoneCodeRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkRegisterRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkLogoutRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkTokenLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkPhoneLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

//忘记密码
-(void)doQsSdkForgetPwdRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkRoleUploadRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkSmrzRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkChildUserRegisterRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkChildUserLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkGetChildUserListRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkCreateOrderRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkQueryOrderRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkIapVerifyRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkSendActiveRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkSendHeartRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkQuerySmrzRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

-(void)doQsSdkChannelLoginRequest:(NSMutableDictionary *)params success:(QsSdkRequestSuccess)success failed:(QsSdkRequestError)failed;

- (void)doQsSdkPostAction:(NSString *)Path
              Params:(NSMutableDictionary *)Params
             Success:(QsSdkRequestSuccess)Success
               Error:(QsSdkRequestError)Error
                 Msg:(NSString *)Msg
               showLoading:(BOOL)showLoading
                   timeOut:(int)time;


@end


