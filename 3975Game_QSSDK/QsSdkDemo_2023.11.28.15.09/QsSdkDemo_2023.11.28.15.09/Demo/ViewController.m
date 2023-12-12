

#import "ViewController.h"

#import <QsSdk/QsSdk.h>

@interface ViewController()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *roleIdTf;
@property (nonatomic, strong) UITextField *roleNameTf;
@property (nonatomic, strong) UITextField *roleLevelTf;
@property (nonatomic, strong) UITextField *serverIdTf;
@property (nonatomic, strong) UITextField *serverNameTf;

@property (nonatomic, strong) UITextField *productId;
@property (nonatomic, strong) UITextField *productPrice;

@end

@implementation ViewController

- (BOOL)shouldAutorotate {
    return NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.roleIdTf resignFirstResponder];
    [self.roleNameTf resignFirstResponder];
    [self.roleLevelTf resignFirstResponder];
    [self.serverIdTf resignFirstResponder];
    [self.serverNameTf resignFirstResponder];
    [self.productId resignFirstResponder];
    [self.productPrice resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn --- ");
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)viewDidAppear:(BOOL)animated{
    
    NSLog(@"viewDidAppear-------");
    
}

- (void)viewDidLoad {
    NSLog(@"viewDidLoad-------");
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    
    
    
    UIButton *btn_init = [UIButton buttonWithType:0];
    btn_init.frame = CGRectMake(20, 15, 100, 30);
    btn_init.backgroundColor = [UIColor blueColor];
    [btn_init setTitle:@"初始化" forState:UIControlStateNormal];
    [btn_init addTarget:self action:@selector(action_init) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_init];
    
    
    UIButton *btn_login = [UIButton buttonWithType:0];
    btn_login.frame = CGRectMake(20, 55, 100, 30);
    btn_login.backgroundColor = [UIColor blueColor];
    [btn_login setTitle:@"登录" forState:UIControlStateNormal];
    [btn_login addTarget:self action:@selector(action_login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_login];
    
    
    UIButton *btn_logout = [UIButton buttonWithType:0];
    btn_logout.frame = CGRectMake(20, 95, 100, 30);
    btn_logout.backgroundColor = [UIColor blueColor];
    [btn_logout setTitle:@"登出" forState:UIControlStateNormal];
    [btn_logout addTarget:self action:@selector(action_logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_logout];
    
    
    UIButton *btn_pay = [UIButton buttonWithType:0];
    btn_pay.frame = CGRectMake(20, 135, 100, 30);
    btn_pay.backgroundColor = [UIColor blueColor];
    [btn_pay setTitle:@"支付" forState:UIControlStateNormal];
    [btn_pay addTarget:self action:@selector(action_pay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_pay];
    
    
    UIButton *btn_createrole = [UIButton buttonWithType:0];
    btn_createrole.frame = CGRectMake(20, 175, 100, 30);
    btn_createrole.backgroundColor = [UIColor blueColor];
    [btn_createrole setTitle:@"创建角色" forState:UIControlStateNormal];
    [btn_createrole addTarget:self action:@selector(action_createrole) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_createrole];
    
    UIButton *btn_rolelogin = [UIButton buttonWithType:0];
    btn_rolelogin.frame = CGRectMake(20, 215, 100, 30);
    btn_rolelogin.backgroundColor = [UIColor blueColor];
    [btn_rolelogin setTitle:@"角色登陆" forState:UIControlStateNormal];
    [btn_rolelogin addTarget:self action:@selector(action_rolelogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_rolelogin];
    
    UIButton *btn_levelup = [UIButton buttonWithType:0];
    btn_levelup.frame = CGRectMake(20, 255, 100, 30);
    btn_levelup.backgroundColor = [UIColor blueColor];
    [btn_levelup setTitle:@"角色升级" forState:UIControlStateNormal];
    [btn_levelup addTarget:self action:@selector(action_levelup) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_levelup];
    
    self.roleIdTf = [[UITextField alloc] initWithFrame:CGRectMake(130, 15, 120, 30)];
    [self.roleIdTf setText:@"1"];
    self.roleIdTf.placeholder = @"输入roleid";
    self.roleIdTf.borderStyle = UITextBorderStyleLine;
    self.roleIdTf.returnKeyType = UIReturnKeyDone;
    self.roleIdTf.delegate = self;
    [self.view addSubview:self.roleIdTf];
    
    self.roleNameTf = [[UITextField alloc] initWithFrame:CGRectMake(130, 55, 120, 30)];
    [self.roleNameTf setText:@"rolename"];
    self.roleNameTf.placeholder = @"输入rolename";
    self.roleNameTf.borderStyle = UITextBorderStyleLine;
    self.roleNameTf.returnKeyType = UIReturnKeyDone;
    self.roleNameTf.delegate = self;
    [self.view addSubview:self.roleNameTf];
    
    self.roleLevelTf = [[UITextField alloc] initWithFrame:CGRectMake(130, 95, 120, 30)];
    [self.roleLevelTf setText:@"500"];
    self.roleLevelTf.placeholder = @"输入rolelevel";
    self.roleLevelTf.borderStyle = UITextBorderStyleLine;
    self.roleLevelTf.returnKeyType = UIReturnKeyDone;
    self.roleLevelTf.delegate = self;
    [self.view addSubview:self.roleLevelTf];
    
    self.serverIdTf = [[UITextField alloc] initWithFrame:CGRectMake(130, 135, 120, 30)];
    [self.serverIdTf setText:@"1001"];
    self.serverIdTf.placeholder = @"输入serverid";
    self.serverIdTf.borderStyle = UITextBorderStyleLine;
    self.serverIdTf.returnKeyType = UIReturnKeyDone;
    self.serverIdTf.delegate = self;
    [self.view addSubview:self.serverIdTf];
    
    self.serverNameTf = [[UITextField alloc] initWithFrame:CGRectMake(130, 175, 120, 30)];
    [self.serverNameTf setText:@"1001区"];
    self.serverNameTf.placeholder = @"输入servername";
    self.serverNameTf.borderStyle = UITextBorderStyleLine;
    self.serverNameTf.returnKeyType = UIReturnKeyDone;
    self.serverNameTf.delegate = self;
    [self.view addSubview:self.serverNameTf];
    
    self.productId = [[UITextField alloc] initWithFrame:CGRectMake(130, 215, 120, 30)];
    [self.productId setText:@"test.product.id"];
    self.productId.placeholder = @"输入商品id";
    self.productId.borderStyle = UITextBorderStyleLine;
    self.productId.returnKeyType = UIReturnKeyDone;
    self.productId.delegate = self;
    [self.view addSubview:self.productId];
    
    self.productPrice = [[UITextField alloc] initWithFrame:CGRectMake(130, 255, 120, 30)];
    [self.productPrice setText:@"6"];
    self.productPrice.placeholder = @"输入价格";
    self.productPrice.borderStyle = UITextBorderStyleLine;
    self.productPrice.returnKeyType = UIReturnKeyDone;
    self.productPrice.delegate = self;
    [self.view addSubview:self.productPrice];
    

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [NSThread sleepForTimeInterval:1.0];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self action_init];
        });

    });
    

}





-(void)action_init{
    NSLog(@"action_init ------------------ 1 ");
    [QsSdk initQsSdk:^{
        NSLog(@"QsSdk init success");
        
    } initFail:^(NSString *code, NSString *msg) {
        NSLog(@"QsSdk init fail, code = %@, msg =%@", code, msg);
        
    } loginSuccess:^(NSString *userId, NSString *token) {
        NSLog(@"QsSdk login success, userId = %@, token =%@", userId, token);
        
    } loginFail:^(NSString *code, NSString *msg) {
        NSLog(@"QsSdk login fail, code = %@, msg =%@", code, msg);
        
    } logoutSuccess:^{
        NSLog(@"QsSdk logout success");
        
    } paySuccess:^(NSString *orderId) {
        NSLog(@"QsSdk pay success");
        
    } payFail:^(NSString *code, NSString *msg) {
        NSLog(@"QsSdk pay fail, code = %@, msg =%@", code, msg);
        
    } uploadSuccess:^{
        NSLog(@"QsSdk upload success");
        
    } uploadFail:^(NSString *code, NSString *msg) {
        NSLog(@"QsSdk upload fail, code = %@, msg =%@", code, msg);
        
    }];
    
}


-(void)action_login{
    [QsSdk loginQsSdk];
}



-(void)action_logout{
    [QsSdk logoutQsSdk];
}



-(void)action_pay{
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString* orderId = [NSString stringWithFormat:@"demo%f", a];
    
    QsSdkRoleInfo *roleInfo = [QsSdkRoleInfo alloc];
    roleInfo.roleIdQsSdk = self.roleIdTf.text;
    roleInfo.roleNameQsSdk = self.roleNameTf.text;
    roleInfo.roleLevelQsSdk = self.roleLevelTf.text;
    roleInfo.serverIdQsSdk = self.serverIdTf.text;
    roleInfo.serverNameQsSdk = self.serverNameTf.text;
    
    QsSdkOrderInfo *orderInfo = [QsSdkOrderInfo alloc];
    orderInfo.productIdQsSdk = self.productId.text;    //商品id
    orderInfo.productPriceQsSdk = self.productPrice.text; //商品价格，单位元
    orderInfo.productDescQsSdk = @"60元宝";  //商品描述
    orderInfo.productNameQsSdk = @"60元宝";  //商品名称
    orderInfo.cpOrderIdQsSdk = orderId;    //CP订单号
    orderInfo.extraQsSdk = @"扩展信息";    //扩展参数
    orderInfo.roleInfoQsSdk = roleInfo;   //角色信息
    [QsSdk payQsSdk:orderInfo];
}


-(void)action_createrole{
    NSDate* data1= [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval interval=[data1 timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", interval];//转为字符型
    
    QsSdkRoleInfo *roleInfo = [QsSdkRoleInfo alloc];
    roleInfo.roleIdQsSdk = self.roleIdTf.text;
    roleInfo.roleNameQsSdk = self.roleNameTf.text;
    roleInfo.roleLevelQsSdk = self.roleLevelTf.text;
    roleInfo.serverIdQsSdk = self.serverIdTf.text;
    roleInfo.serverNameQsSdk = self.serverNameTf.text;
    roleInfo.roleCreateTimeQsSdk = timeString;
    [QsSdk uploadQsSdkRoleInfo:roleInfo type:QsSdkUploadRoleCreate];
}

-(void)action_rolelogin{
    NSDate* data1= [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval interval=[data1 timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", interval];//转为字符型
    
    QsSdkRoleInfo *roleInfo = [QsSdkRoleInfo alloc];
    roleInfo.roleIdQsSdk = self.roleIdTf.text;
    roleInfo.roleNameQsSdk = self.roleNameTf.text;
    roleInfo.roleLevelQsSdk = self.roleLevelTf.text;
    roleInfo.serverIdQsSdk = self.serverIdTf.text;
    roleInfo.serverNameQsSdk = self.serverNameTf.text;
    roleInfo.roleCreateTimeQsSdk = timeString;
    [QsSdk uploadQsSdkRoleInfo:roleInfo type:QsSdkUploadRoleLogin];
}

-(void)action_levelup{
    NSDate* data1= [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval interval=[data1 timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%0.f", interval];//转为字符型
    
    QsSdkRoleInfo *roleInfo = [QsSdkRoleInfo alloc];
    roleInfo.roleIdQsSdk = self.roleIdTf.text;
    roleInfo.roleNameQsSdk = self.roleNameTf.text;
    roleInfo.roleLevelQsSdk = self.roleLevelTf.text;
    roleInfo.serverIdQsSdk = self.serverIdTf.text;
    roleInfo.serverNameQsSdk = self.serverNameTf.text;
    roleInfo.roleCreateTimeQsSdk = timeString;
    [QsSdk uploadQsSdkRoleInfo:roleInfo type:QsSdkUploadRoleLevelUp];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
