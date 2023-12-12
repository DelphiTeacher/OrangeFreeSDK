

@interface QsSdkBoxInfo : NSObject

@property (nonatomic, strong) NSString *mainUserIdQsSdk;       //主帐号id
@property (nonatomic, strong) NSString *finalUserIdQsSdk;      //子帐号id
@property (nonatomic, strong) NSString *tokenQsSdk;            //token
//@property (nonatomic, strong) NSString *promoteIdQsSdk;        //推广员id
@property (nonatomic, strong) NSString *packageIdQsSdk;        //包id
@property (nonatomic, strong) NSString *appIdQsSdk;            //应用id
@property (nonatomic, strong) NSString *appSecretQsSdk;        //应用密钥
@property (nonatomic) BOOL isLandscapeQsSdk;                   //应用是否横屏
@property (nonatomic) BOOL releaseModeQsSdk;                    //是否正式环境
@property (nonatomic) NSString *urlTypeQsSdk;                   //域名类型：千年传"0"， 传奇传"1"


@end
