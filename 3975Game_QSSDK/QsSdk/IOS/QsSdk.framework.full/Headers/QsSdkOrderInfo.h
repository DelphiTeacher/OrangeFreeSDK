#import <QsSdk/QsSdkRoleInfo.h>

@interface QsSdkOrderInfo : NSObject

@property (nonatomic, strong) NSString *cpOrderIdQsSdk;     //CP订单号
@property (nonatomic, strong) NSString *productNameQsSdk;   //商品名称
@property (nonatomic, strong) NSString *productDescQsSdk;   //商品描述
@property (nonatomic, strong) NSString *productIdQsSdk;     //商品id
@property (nonatomic, strong) NSString *productPriceQsSdk;  //商品价格，单位元
@property (nonatomic, strong) NSString *extraQsSdk;         //扩展参数
@property (nonatomic) BOOL isBoxQsSdk;                      //是否盒子进入

@property (nonatomic, strong) QsSdkRoleInfo *roleInfoQsSdk; //角色信息

@property (nonatomic, strong) NSString *qsOrderIdQsSdk;     //强盛订单号

@end
