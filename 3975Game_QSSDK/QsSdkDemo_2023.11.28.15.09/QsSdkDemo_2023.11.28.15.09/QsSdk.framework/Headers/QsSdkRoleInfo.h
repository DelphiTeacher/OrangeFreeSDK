
typedef enum {
    QsSdkUploadRoleCreate,      //创建角色
    QsSdkUploadRoleLogin,       //角色登录
    QsSdkUploadRoleLevelUp,       //角色升级
    QsSdkUploadRoleLogout,      //角色登出
    QsSdkUploadChooseServer,    //选择区服
    QsSdkUploadChooseRole,      //选择角色
    QsSdkUploadEnterParty,      //加入工会
    QsSdkUploadOrderSuccess     //支付成功
} QsSdkUploadType;

@interface QsSdkRoleInfo : NSObject

@property (nonatomic, strong) NSString *roleIdQsSdk;            //角色ID
@property (nonatomic, strong) NSString *roleNameQsSdk;          //角色名
@property (nonatomic, strong) NSString *roleLevelQsSdk;         //角色等级
@property (nonatomic, strong) NSString *serverIdQsSdk;          //区服ID
@property (nonatomic, strong) NSString *serverNameQsSdk;        //区服名
@property (nonatomic, strong) NSString *roleCreateTimeQsSdk;    //角色创建时间

@property (nonatomic, strong) NSString *roleVipLevelQsSdk;      //角色VIP等级
@property (nonatomic, strong) NSString *rolePowerQsSdk;         //角色战力值
@property (nonatomic, strong) NSString *rolePartyQsSdk;         //角色工会/帮派
@property (nonatomic, strong) NSString *roleBalanceQsSdk;       //角色元宝余额
@property (nonatomic, strong) NSString *roleReincarnationQsSdk; //角色转生等级
@property (nonatomic, strong) NSDictionary  *extQsSdk;          //扩展参数

@end
