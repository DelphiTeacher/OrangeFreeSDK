
#define QsSdkVersion @"1.0.1"

typedef void (^InitQsSdkSuccess)(void);
typedef void (^InitQsSdkFail)(NSString *code, NSString *msg);
typedef void (^LoginQsSdkSuccess)(NSString *userId, NSString *token);
typedef void (^LoginQsSdkFail)(NSString *code, NSString *msg);
typedef void (^LogoutQsSdkSuccess)(void);
typedef void (^PayQsSdkSuccess)(NSString *orderId);
typedef void (^PayQsSdkFail)(NSString *code, NSString *msg);
typedef void (^UploadRoleInfoQsSdkSuccess)(void);
typedef void (^UploadRoleInfoQsSdkFail)(NSString *code, NSString *msg);


typedef void (^QsSdkCommonCb)(void);
typedef void (^QsSdkStrCommonCb)(NSString *msg);
typedef void (^QsSdkDicCommonCb)(NSDictionary *dic);
typedef void (^QsSdkStrCb)(NSString *code, NSString *msg, NSString *ext);

