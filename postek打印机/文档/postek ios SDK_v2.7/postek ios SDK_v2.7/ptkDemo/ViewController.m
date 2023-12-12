//
//  ViewController.m
//  ptkDemo
//
//  Created by SDP-MAC on 2017/9/29.
//  Copyright © 2017年 Postek. All rights reserved.
//

#import "ViewController.h"
#import "PTKPrintSDK.h"
#import "ptktestUtil.h"


@interface ViewController ()<SocketLinkerDelegate>
@property (strong, nonatomic) PTKPrintSDK *ptkSDk;
@property (strong, nonatomic) ptktestUtil *ptkTestUtil;
@property (nonatomic) CGFloat cgBoldweight;

@property (weak, nonatomic) IBOutlet UIImageView *UIimage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    
    [self.view addGestureRecognizer:singleTap];
    
    _ptkSDk = [PTKPrintSDK sharedPTKPrintInstance];
    _ptkTestUtil = [[ptktestUtil alloc]init];
    _ptkTestUtil.ptkSDK = _ptkSDk;
    _ptkTestUtil.NarrowWidth = 1;
    _ptkTestUtil.WideWidth = 1;
    
    _cgBoldweight = UIFontWeightUltraLight;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//连接网络打印机
-(IBAction)connect{
    NSLog(@"IP:%@ PORT:%d\r\n", _editIP.text, [_editPort.text intValue]);
  
    [_ptkSDk PTKConnect:_editIP.text  andPort:[_editPort.text intValue]];
   
    if([_ptkSDk PTKConnect:_editIP.text  andPort:[_editPort.text intValue]]==PTK_SUCCESS){
        _label0.text = [NSString stringWithFormat:@"打印机连接成功IP:%@ PORT:%@",_editIP.text, _editPort.text];
        //NSLog(@"连接成功");
    }else{
        
    }
    

    int64_t delayInSeconds = 1.0;      // 延迟的时间
    /*
     *@parameter 1,时间参照，从此刻开始计时
     *@parameter 2,延时多久，此处为秒级，还有纳秒等。10ull * NSEC_PER_MSEC
     */
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // do something
            if ([_ptkSDk isConnect]) {
                _label0.text = [NSString stringWithFormat:@"打印机连接成功IP:%@ PORT:%@",_editIP.text, _editPort.text];
               
                NSLog(@"连接成功");
            }else{
                _label0.text = [NSString stringWithFormat:@"打印机连接失败IP:%@ PORT:%@",_editIP.text, _editPort.text];
                 NSLog(@"连接失败");
            }
    });
}
- (void)socketDidConnectToHost:(NSString *)host port:(uint16_t)port{

   
    NSLog(@"连接成功1");

}
- (void)socketDidDisconnectWithError:(NSError *)error{
    NSLog(@"连接失败%@",error);
}

-(IBAction)disconnect{
    [_ptkSDk PTKCloseConnect];
    
    _label0.text = @"断开打印机连接成功";
}

-(IBAction)printBtn{
    NSLog(@"打印\r\n");

/*    [_ptkSDk PTKClearBuffer];
    [_ptkSDk PTKDrawText:20 andPy:20 andDirec:0 andFont:'6' andHorizontal:3 andVertical:3 andText:'N' andStr:@"繁华如三千东流水"];
    [_ptkSDk PTKPrintLabel:1 andCPNum:1];*/
    [self printShoppingOrderList:nil];
//    [_ptkTestUtil setPageLength:mm2inch(136)];
}

double mm2inch(double mm) {
    return (double) mm / 25.4;
}

//图形方式打印
-(IBAction)printBtn5{
    [_ptkSDk PTKSetDarkness:10];// 设置黑度，取值范围：0—20，缺省为 10；
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(10) andVertical:mm2inch(2) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆大漠孤烟直长河落日圆" andShowStyle:TRUE];
/*    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(10) andVertical:mm2inch(10) andFontName:nil andBoldweight:_cgBoldweight andSize:15 andText:@"大漠孤烟直，长河落日圆！" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(10) andVertical:mm2inch(20) andFontName:@"HiraginoSans-W3" andBoldweight:_cgBoldweight andSize:16 andText:@"大漠孤烟直，长河落日圆！" andShowStyle:FALSE];*/
    [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:20 andVertical:20 andHeight:1 andWidth:1 andText:@""];
}

// ---------------------------- 本地销售单据打印
// 开始--------------------------------------
-(IBAction)printBtn1{
    [self PrintSaleList:1];
}

-(IBAction)printBtn2{
    [self printSample:0 andNums:1];
}

-(IBAction)printBtn3{
    [self barcodePrint:0 andNums:1];
}

-(IBAction)printBtn4{
    [self printTransferDetail:1 andPresentPageNum:0 andPresentBill:0 andBillNums:1];
}
- (IBAction)printImage {
    NSLog(@"打印图片");
    [_ptkSDk PTKSetLabelHeight:CONTINUOUS_MODE andHeight:1800 andGapH:0 andGap:0];
    [_ptkSDk PTKSetLabelWidth:1123];
    [_ptkSDk PTKClearBuffer];

    NSString *imageName = @"aac.png";
    UIImage *image = [UIImage imageNamed:imageName];
    //Scale :缩放倍数
    [_ptkTestUtil DSZPLDrawGraphics:0 andVertical:0 andImage:image andScale:1];
    //[_ptkTestUtil prinBarcodeQRCenterImage:2 andVertical:2 andQRContext:@"postek electricety" andWidth:200.0 andHeight:200.0 AndCenterImage:image];
    [_ptkSDk PTKPrintLabel:1 andCPNum:1];
    
}


- (IBAction)printBarcodeQR {
    NSLog(@"打印QR码");
    [_ptkSDk PTKSetLabelHeight:CONTINUOUS_MODE andHeight:900 andGapH:0 andGap:0];
    [_ptkSDk PTKSetLabelWidth:1123];
    [_ptkSDk PTKClearBuffer];
    [_ptkTestUtil prinBarcodeQR:2 andVertical:2 andQRContext:@"博思得科技发展有限公司 客服热线：S4006002368 公司理念：设计精湛好用耐用" andWidth:200.0 andHeight:200.0];
    [_ptkSDk PTKPrintLabel:1 andCPNum:1];
}


int x = 1, y = 1;
#pragma mark- 打印购物清单
-(void)printShoppingOrderList:(NSString *)dataString
{
    x = 1;
    y = 1;
    _cgBoldweight = UIFontWeightUltraLight;
    fontSize = 9;
    tailPos = 0;
//    [_ptkSDk PTKClearBuffer];
    [self PrintShoppingOrder];
}

- (BOOL)PrintShoppingOrder
{
    double yPos = 50.0;//
    BOOL result = false;
    BOOL printH = true;
    [_ptkTestUtil setPageLengthEX:mm2inch(304)];
            NSInteger num = 2;
            // -----------------------------------------
            for (int i = 0; i < num; i++) {
                yPos += 4.02;
                if (!(yPos < 125)) {
                    yPos = 50.0;
                    x++;
                }
            }
            if (!((yPos + 30) < 125) && yPos != 44) {
                x++;
            }
            // -----------------------------------------
            yPos = 50.0;
            for (int i = 0; i < num; i++) {
                if (printH) {
                    [self printShoppingListHead];
                }
                    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:@"策划是多少氛围二分二微风份儿饭我的文档多群的测试的安达市阿萨" andShowStyle:TRUE];
                [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:@"哈哈" andShowStyle:TRUE];

                [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:@"购物" andShowStyle:TRUE];
                
                yPos += 4.02;
                if (yPos < 121) {
                    printH = false;
                } else {
                    y++;

                    [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
                    yPos = 50.0;
                    printH = true;
                }
            
            if (yPos == 50) {
                [self printShoppingListHead];
                tailPos = 35;
                [self printShoppingListTail];
                
            } else if ((yPos + 25) < 130) {// 一页内
                tailPos = yPos + 1;
                [self printShoppingListTail];
                
            } else { // 1页内 头打不下
                y++;
                [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
                [self printShoppingListHead];
                tailPos = 50;
                [self printShoppingListTail];
            }

            [_ptkTestUtil DSZPLSetCutter:1 andCutter:true];
            result = [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
            
        }
        
        if (_ptkTestUtil != nil) {
//            [_ptkTestUtil DSCloseWifi];
        }
    x = 1;
    y = 1;
    return result;
}
/**
 * 购物清单头部
 *
 */
- (void)printShoppingListHead {

    [_ptkTestUtil PrintText:2 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
    [_ptkTestUtil DSSetDirection:0];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(44) andVertical:mm2inch(10) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:@"asa" andShowStyle:TRUE];
    [_ptkTestUtil PrintCode128:0 andDarkness:30 andHorizontal:mm2inch(20) andVertical:mm2inch(16) andHeight:0.3 andHeightHuman:26 andWidthHuman:50 andFlagHuman:false andPosHuman:false andContent:@"审计"];

        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:mm2inch(26) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"订单编号： %@",@"ABCADDD"] andShowStyle:TRUE];

        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:mm2inch(30) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"客户名称： %@",@"李嘉诚"] andShowStyle:TRUE];

    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    [forMatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:mm2inch(34) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"订购时间： %@",forMatter] andShowStyle:TRUE];

    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(34) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"商品数量： %d",100] andShowStyle:TRUE];

    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:mm2inch(45) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"商品名称"] andShowStyle:TRUE];

    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(45) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"规格"] andShowStyle:TRUE];

    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(90) andVertical:mm2inch(45) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"数量"] andShowStyle:TRUE];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(1) andVertical:mm2inch(44) andLenth:mm2inch(100) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(1) andVertical:mm2inch(48.5) andLenth:mm2inch(100) andThick:mm2inch(0.3)];

}
- (void)printShoppingListTail
{
    double printHight = mm2inch(tailPos);

    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(1) andVertical:printHight + 0.05 andLenth:mm2inch(100) andThick:mm2inch(0.3)];

    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:printHight + 0.06 andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"发货联     快递单号： %@",@"LALLALLA "] andShowStyle:TRUE];
    
    double remarkHeight = 0;
    remarkHeight += mm2inch(3);
    double totalTipLines = mm2inch(2);
    NSString *printTicketRemark = @"adasdadvs";
    
        NSArray *remarks = [printTicketRemark componentsSeparatedByString:@"。"];
        if (remarks.count > 0) {
            double i = mm2inch(2);
            [_ptkTestUtil DSZPLPrintTextLine:mm2inch(45) andVertical:printHight + remarkHeight + 0.12 andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:@"温馨提示" andShowStyle:TRUE];
            for (NSString *s in remarks) {
                if (s.length > 40) {
                    for (int j = 0; j <= s.length / 41; j++) {  // 每行最大长度是41个
                        if ((j + 1) * 41 >= s.length) {

                            [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:printHight + remarkHeight + 0.17 + i andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"%@。",[s substringWithRange:NSMakeRange(j*41, s.length - j*41)]] andShowStyle:TRUE];
                        } else {

                            [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:printHight + remarkHeight + 0.17 + i andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"%@",[s substringWithRange:NSMakeRange(j*41, 41)]] andShowStyle:TRUE];
                            i += mm2inch(3);
                            totalTipLines += mm2inch(3);
                        }
                    }
                } else {
                    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:printHight + remarkHeight + 0.17 + i andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"%@。",s] andShowStyle:TRUE];
                }
                
                i = i + mm2inch(3);
                totalTipLines += mm2inch(3);
                
            }
        }
    
    totalTipLines += mm2inch(3);
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:printHight + remarkHeight + 0.17 + totalTipLines andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"退货地址： %@",@"深圳"] andShowStyle:TRUE];

    NSString *receiveNameReturn = @"甲方";
    NSString *zipCode = @"乙方";
    NSString *receiveTel = @"电话";
        
    receiveNameReturn = [receiveNameReturn isEqualToString:@"null"]?receiveNameReturn:@" ";
    zipCode =  [zipCode isEqualToString:@"null"]?receiveNameReturn:@" ";
    receiveTel = [receiveTel isEqualToString:@"null"]?receiveNameReturn:@" ";

    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:printHight + remarkHeight + 0.17 + totalTipLines + mm2inch(3) andFontName:nil andBoldweight:_cgBoldweight andSize:fontSize andText:[NSString stringWithFormat:@"收货人：%@        邮编：%@           电话：%@",receiveNameReturn,zipCode,receiveTel] andShowStyle:TRUE];
    
}

double tailPos = 0;// mm

int fontSize = 20;

-(BOOL)PrintSaleList:(int) isEnd {
    double yPos = 40.0;// mm
    bool result = false;
    bool printH = true;
    [_ptkTestUtil setPageLengthEX:mm2inch(136)];//连续纸模式
    
    int num = 2;
    // -----------------------------------------
    for (int i = 0; i < num; i++) {
        
        yPos += 4.02;
        if (!(yPos < 125)) {
            yPos = 40.0;
            x++;
        }
    }
    
    if (!((yPos + 30) < 125) && yPos != 44) {
        x++;
    }
    
    [self printHead];

    // -----------------------------------------
    yPos = 40.0;
    for (int i = 0; i < num; i++) {
        if (printH) {
            [self printHead];
        }
        
        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"00000001" andShowStyle:TRUE];
        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(28) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"225" andShowStyle:TRUE];
        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(40) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"11100" andShowStyle:TRUE]; // 牌价
        
        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(52) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"55%" andShowStyle:TRUE]; // 扣率
        
        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(64) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"11100" andShowStyle:TRUE];
        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(77) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"11100" andShowStyle:TRUE];
        [_ptkTestUtil DSZPLPrintTextLine:mm2inch(88) andVertical:mm2inch(yPos) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"11100" andShowStyle:TRUE];
        
        yPos += 4.02;
        if (yPos < 121) {
            
            printH = false;
        } else {
            y++;
            [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
            yPos = 40.0;
            printH = true;
            
        }
    }
    
    if (yPos == 40) {
        
        [self printHead];
        tailPos = 40;
        [self printTail];
        
    } else if ((yPos + 25) < 130) {// 一页内
        tailPos = yPos + 1;
        [self printTail];
        
    } else { // 1页内 头打不下
        y++;
        [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
        [self printHead];
        tailPos = 40;
        [self printTail];
        
    }
    [_ptkTestUtil DSZPLSetCutter:1 andCutter:TRUE];
    result = [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
    if (isEnd == 1) {
        if (_ptkTestUtil != nil) {
//            [_ptkTestUtil DSCloseWifi];
        }
    }
    
    x = 1;
    y = 1;
    return result;
}

-(void) printTail{
    
    double printHight = mm2inch(tailPos);
    
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:printHight + 0.05 andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"合计" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(78) andVertical:printHight + 0.05 andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"10" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(86) andVertical:printHight + 0.05 andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"30" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:printHight + 0.2 andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"付款" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(86) andVertical:printHight + 0.2 andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"100000" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:printHight + 0.35 andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"找零" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(86) andVertical:printHight + 0.35 andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"0" andShowStyle:TRUE];
    
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(2) andVertical:printHight + 0.35 andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"沈阳百思图有限公司" andShowStyle:TRUE];
    
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(62) andVertical:printHight andLenth:mm2inch(38) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(62) andVertical:printHight + 0.5 andLenth:mm2inch(38) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(62) andVertical:printHight + 0.69 andLenth:mm2inch(100) andThick:mm2inch(0.3)];
}

-(void) printHead {
    
    [_ptkTestUtil PrintText:2 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
    [_ptkTestUtil DSSetDirection:0];
    [_ptkTestUtil PrintCode128:0 andDarkness:30 andHorizontal:mm2inch(1.5) andVertical:mm2inch(6) andHeight:0.3 andHeightHuman:26 andWidthHuman:28 andFlagHuman:true andPosHuman:false andContent:@"CA01BS00000001"];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(44) andVertical:mm2inch(2) andFontName:nil andBoldweight:_cgBoldweight andSize:22 andText:@"销售单" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(6) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"系统日：2017-10-10" andShowStyle:TRUE];
    NSDate * date = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init ];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * dateStr = [dateFormatter stringFromDate:date];
    
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(10) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:[NSString stringWithFormat:@" 打印 %@", dateStr] andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(14) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"交易日：2017-10-10 " andShowStyle:TRUE];
    
    /**
     * 订单业务类型 Y 0-正常销售 1-跨店销售 2-商场团购 (3-公司团购，暂不启用） 3-内购 4-员购 5-专柜团购 6-特卖销售
     * 默认为0 - 离线开单为0
     */
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(18) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:[NSString stringWithFormat:@"    类型： "] andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(22) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"    单号： CA01BS00000001" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(26) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"营业员：AAAAAA " andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(30) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"会员卡：  " andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(1.5) andVertical:mm2inch(18) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"沈阳中兴BST" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(1.5) andVertical:mm2inch(30)andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"Tel:1380000000000" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(1.5) andVertical:mm2inch(24)andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"沈阳XXXXXXX" andShowStyle:TRUE];
    
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(41) andVertical:mm2inch(35) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"牌价" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(53) andVertical:mm2inch(35) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"折扣" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(7) andVertical:mm2inch(35) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"商品编码" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(29) andVertical:mm2inch(35) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"规格" andShowStyle:TRUE];
    
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(65) andVertical:mm2inch(35) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"结算价" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(78) andVertical:mm2inch(35) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"数量" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(88) andVertical:mm2inch(35) andFontName:nil andBoldweight:_cgBoldweight andSize:14 andText:@"金额" andShowStyle:TRUE];
    
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(1) andVertical:mm2inch(34) andLenth:mm2inch(100) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(1) andVertical:mm2inch(38.5) andLenth:mm2inch(100) andThick:mm2inch(0.3)];
}

/**
 * 转货单70*45mm标签打印
 *
 * transferBean
 *            转货单相关数据bean
 * @param persent
 *            当前页
 * @param nums
 *            总页数
 * @return BOOL
 */
-(BOOL) printSample:(int)persent andNums:(int)nums {
    [_ptkTestUtil setPageLength:3];
    [_ptkTestUtil PrintText:2 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
    [_ptkTestUtil DSSetDirection:0];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + 4) andVertical:mm2inch(1) andLenth:mm2inch(66) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + 4) andVertical:mm2inch(1+6) andLenth:mm2inch(66) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + 4) andVertical:mm2inch(1+6+9) andLenth:mm2inch(66) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + 4) andVertical:mm2inch(1 + 6 + 14 + 4) andLenth:mm2inch(66) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + 4) andVertical:mm2inch(1 + 6 + 11 + 16 + 2 + 4) andLenth:mm2inch(66) andThick:mm2inch(0.3)];
    
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(17 + 4) andVertical:mm2inch(1) andLenth:mm2inch(39) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(66 + 17 + 3.5) andVertical:mm2inch(1) andLenth:mm2inch(39) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(17 + 3 + 19) andVertical:mm2inch(7) andLenth:mm2inch(18) andThick:mm2inch(0.3)];
    
    [_ptkTestUtil DSZPLPrintTextLine:mm2inch(17 + 3 + 9) andVertical:mm2inch(1+2) andFontName:nil andBoldweight:_cgBoldweight andSize:11 andText:@"第_ _箱 , 共_ _箱 , 本 箱 数 量_ _, 总 数__" andShowStyle:TRUE];
    [_ptkTestUtil DSZPLPrintCenterTextInCell:0 andCellH:mm2inch(17 + 4) andVertical:mm2inch(1 + 6 + 3) andCellW:mm2inch(18) andFont:nil andBold:false andFontSize:20 andText:@"发货方"];
    [_ptkTestUtil DSZPLPrintCenterTextInCell:0 andCellH:mm2inch(17 + 3 + 19) andVertical:mm2inch(1 + 8 + 1) andCellW:mm2inch(48) andFont:nil andBold:false andFontSize:20 andText:@"CA01BS 沈阳中兴BST"];
    [_ptkTestUtil DSZPLPrintCenterTextInCell:0 andCellH:mm2inch(17 + 4) andVertical:mm2inch(1 + 16 + 2) andCellW:mm2inch(18) andFont:nil andBold:true andFontSize:24 andText:@"收货方"];
    
    [_ptkTestUtil DSZPLPrintCenterTextInCell:0 andCellH:mm2inch(17 + 19) andVertical:mm2inch(1 + 16) andCellW:mm2inch(48) andFont:nil andBold:true andFontSize:20 andText:@"CA01BS 沈阳商业BST"];
    
    [_ptkTestUtil DSPrintCode128Dispersion:0 andDarkness:12 andHorizontal:mm2inch(17 + 5.5) andVertical:mm2inch(23 + 3 + 2) andHeight:0.3 andSizeHuman:25 andFont:nil andBold:true andContent:@"CA01BSC000000001"];
  //  [_ptkTestUtil DSZPLDrawGraphics:mm2inch(50) andVertical:mm2inch(15) andImage:nil];
    
    // 打印圆圈必须放在结束符上一行
    [_ptkTestUtil PrintBelle:mm2inch(17 + 3 + 3) andYpos:mm2inch(1 + 1) andData:@"转"];
    [_ptkTestUtil DSZPLSetCutter:1 andCutter:true];
    int ret = [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
    if ((nums - 1) == persent) {
//        [_ptkTestUtil DSCloseWifi];
    }
    return ret;
}

/**
 * 转货单80*60mm标签打印
 *
 *  transferBean
 *            转货单相关数据bean
 * @param persent
 *            当前页
 * @param nums
 *            总页数
 * @return BOOL
 */
-(BOOL) barcodePrint:(int) persent andNums:(int)nums {
    [_ptkTestUtil setPageLength:3];
    [_ptkTestUtil PrintText:2 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
    [_ptkTestUtil DSSetDirection:0];
    int ypos = 4;
    int xpos = 1;
    // mSmartPrint.DSSetUpsideDown(false); // 为防止错误发生，打印前将旋转重新置为false
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 - ypos) andLenth:mm2inch(73) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 10 - ypos) andLenth:mm2inch(73) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 16.5 - ypos) andLenth:mm2inch(73) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 25 - ypos) andLenth:mm2inch(73) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 30 - ypos) andLenth:mm2inch(73) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 35 - ypos) andLenth:mm2inch(73) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 48 - ypos) andLenth:mm2inch(73) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_HLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 53 - ypos) andLenth:mm2inch(73) andThick:mm2inch(0.3)];
    
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 - ypos) andLenth:mm2inch(53) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(17 + 73 - 0.4 + xpos) andVertical:mm2inch(1 + 4 - ypos) andLenth:mm2inch(53) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(17 + 16 + xpos) andVertical:mm2inch(1 + 4 + 10 - ypos) andLenth:mm2inch(15) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(17 + 16 + xpos) andVertical:mm2inch(1 + 4 + 48 - ypos) andLenth:mm2inch(5) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(17 + 24 + xpos) andVertical:mm2inch(1 + 4 + 25 - ypos) andLenth:mm2inch(5) andThick:mm2inch(0.3)];
    [_ptkTestUtil Print_VLine:0 andHorizontal:mm2inch(17 + 44 + xpos) andVertical:mm2inch(1 + 4 + 25 - ypos) andLenth:mm2inch(5) andThick:mm2inch(0.3)];
    
    [_ptkTestUtil PrintText:0 andDarkness:30 andHorizontal:mm2inch(17 + 9 + xpos) andVertical:mm2inch(1 + 4 + 4 - ypos) andHeight:1 andWidth:1 andText:@"第__箱  共__箱  本箱数量__ 总数__"];
    [_ptkTestUtil PrintCenterTextInCell:0 andDarkNess:30 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 12 - ypos) andWidth:mm2inch(16) andHeight:1 andWidth:1 andText:@"发货方"];
    [_ptkTestUtil PrintCenterTextInCell:0 andDarkNess:30 andHorizontal:mm2inch(17 + 16 + xpos) andVertical:mm2inch(1 + 4 + 12 - ypos) andWidth:mm2inch(56) andHeight:1 andWidth:1 andText:@"CA01BS 沈阳中兴BS"];
    [_ptkTestUtil PrintCenterTextInCell:0 andDarkNess:30 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 20 - ypos) andWidth:mm2inch(16) andHeight:1 andWidth:1 andText:@"收货方"];
    [_ptkTestUtil PrintCenterTextInCell:0 andDarkNess:30 andHorizontal:mm2inch(17 + 16+xpos) andVertical:mm2inch(1 + 4 + 20 - ypos) andWidth:mm2inch(56) andHeight:1 andWidth:1 andText:@"CA02BS 沈阳商业城BST"];
    [_ptkTestUtil PrintCenterTextInCell:0 andDarkNess:30 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 26 - ypos) andWidth:mm2inch(24) andHeight:1 andWidth:1 andText:@""];
    
    [_ptkTestUtil PrintText:0 andDarkness:30 andHorizontal:mm2inch(17 + 25.5 + xpos) andVertical:mm2inch(1 + 4 + 26 - ypos) andHeight:1 andWidth:1 andText:@"重量:"];
    [_ptkTestUtil PrintText:0 andDarkness:30 andHorizontal:mm2inch(17 + 44.5 + xpos) andVertical:mm2inch(1 + 4 + 26 - ypos) andHeight:1 andWidth:1 andText:@"日期:2017-10-10"];
    [_ptkTestUtil PrintCenterTextInCell:0 andDarkNess:30 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 31) andWidth:mm2inch(73) andHeight:1 andWidth:1 andText:@""];
    [_ptkTestUtil PrintCode128:0 andDarkness:12 andHorizontal:mm2inch(17 + 5 + xpos) andVertical: mm2inch(1 + 4 + 36 - ypos) andHeight:0.26 andHeightHuman:30 andWidthHuman:30 andFlagHuman:true andPosHuman:false andContent:@"CA01BSC00000001"];
    [_ptkTestUtil PrintCenterTextInCell:0 andDarkNess:30 andHorizontal:mm2inch(17 + xpos) andVertical:mm2inch(1 + 4 + 49) andWidth:mm2inch(16) andHeight:1 andWidth:1 andText:@"备注"];
    
    [_ptkTestUtil PrintBelle:mm2inch(17 + 2 + xpos) andYpos:mm2inch(1 + 5 + 2 - ypos) andData:@"转"];
    [_ptkTestUtil DSZPLSetCutter:1 andCutter:TRUE];
    
    int ret = [_ptkTestUtil PrintText:3 andDarkness:30 andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
    if ((nums - 1) == persent) {
//        [_ptkTestUtil DSCloseWifi];
    }
    return ret;
}

/**
 * 转货单单据详情打印
 *
 *  transferBean
 *            转货数据bean
 *  transferDetailDtls
 *  pageNums
 *            每张转货单总页数
 *  presentPageNum
 *            转货单当前页数
 *  presentbill
 *            批量打印转货单当前第几单
 *  billNums
 *            批量打印转货单总数
 *
 */
int dark = 12;
- (BOOL) printTransferDetail:(int)pageNums andPresentPageNum:(int) presentPageNum andPresentBill:(int)presentbill andBillNums:(int) billNums {
    double hLineYposStart = 0.36; // 横线条Y坐标起始值
    double hLineXposStart = 0.2; // 横线条X坐标
    double vLineLength = 2.67;
    double hLineLength = mm2inch(238);
    [_ptkTestUtil setPageLength:mm2inch(304.8)];
    [_ptkTestUtil PrintText:2 andDarkness:dark andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""]; // 发开始标志
    
    [_ptkTestUtil DSSetDirection:1];
    
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:0.2 andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:1.55 andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:2.9 andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:3.8 andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:5.12 andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:mm2inch(144.6) andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:mm2inch(162.4) andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:mm2inch(180.2) andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:mm2inch(198) andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:mm2inch(215.8) + 0.1 andLenth:vLineLength andThick:0.01];
    [_ptkTestUtil Print_HLine:0 andHorizontal:0.55 andVertical:hLineLength + 0.2 andLenth:vLineLength andThick:0.01];
    
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*2 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*3 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*4 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*5 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*6 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*7 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*8 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*9 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*10 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*11 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*12 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*13 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*14 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    [_ptkTestUtil Print_VLine:0 andHorizontal:hLineYposStart + 0.19*15 andVertical:hLineXposStart andLenth:hLineLength andThick:0.01];
    // mSmartPrint.Print_VLine(0, hLineYposStart + 0.19 * 16,
    // hLineXposStart, hLineLength, 0.01);
    
    [_ptkTestUtil PrintCode128:0 andDarkness:dark andHorizontal:hLineYposStart + 0.41 + 0.19 * 15 andVertical:0.2 andHeight:0.4 andHeightHuman:40 andWidthHuman:30 andFlagHuman:false andPosHuman:false andContent:@"CA01BSC0000001"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:hLineYposStart + 0.2 + 0.19 * 15 andVertical:0.2 andHeight:1 andWidth:1 andText:@"发货方：CA01BS 沈阳中兴BST"];
    // 店转货
    // 店退仓
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:hLineYposStart + 0.2 + 0.19 * 15 andVertical:2.5 andHeight:1 andWidth:1 andText:@"收货方：CA02BS 沈阳商业城BST"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:hLineYposStart + 0.51 + 0.19 * 15 andVertical:3.23 andHeight:2 andWidth:2 andText:@"转货单[CA01BSC0000001]"];
    
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:hLineYposStart + 0.32 + 0.19 * 15 andVertical:4.72 andHeight:1 andWidth:1 andText:@"发货日期：2018-06-13"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:hLineYposStart + 0.19 + 0.19 * 15 andVertical:4.72 andHeight:1 andWidth:1 andText:@"收货日期："];
    
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:hLineYposStart + 0.28 + 0.19 * 15 andVertical:6.78 andHeight:1 andWidth:1 andText:@"发方订货单位：CA01BS 沈阳中兴BST"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:hLineYposStart + 0.12 + 0.19 * 15 andVertical:6.78 andHeight:1 andWidth:1 andText:@"收方订货单位：CA02BS 沈阳商业城BST"];
    
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:0.67 andHeight:1 andWidth:1 andText:@"商品编码"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:1.9 andHeight:1 andWidth:1 andText:@"商品名称"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:3.16 andHeight:1 andWidth:1 andText:@"品牌"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:4.3 andHeight:1 andWidth:1 andText:@"箱号"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:5.27 andHeight:1 andWidth:1 andText:@"尺码"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:5.79 andHeight:1 andWidth:1 andText:@"发出数量"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:6.49 andHeight:1 andWidth:1 andText:@"验货数量"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:7.19 andHeight:1 andWidth:1 andText:@"差异数量"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:8.05 andHeight:1 andWidth:1 andText:@"牌价"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * 14 andVertical:8.9 andHeight:1 andWidth:1 andText:@"备注"];
    
    int n = 13;
    if ((pageNums - 1) == presentPageNum) {
        for (int i = presentPageNum * 13; i < 10; i++) {
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:0.47 andHeight:1 andWidth:1 andText:@"000000001"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:1.68 andHeight:1 andWidth:1 andText:@"黑色牛皮"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:3.0 andHeight:1 andWidth:1 andText:@"她"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:3.9 andHeight:1 andWidth:1 andText:[NSString stringWithFormat:@"C000000000%d", i]];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:5.27 andHeight:1 andWidth:1 andText:@"225"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:5.89 andHeight:1 andWidth:1 andText:@"10"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:6.49 andHeight:1 andWidth:1 andText:@""];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:7.29 andHeight:1 andWidth:1 andText:@""];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:7.9 andHeight:1 andWidth:1 andText:@""];
            n = n - 1;
        }
    } else {
        for (int i = presentPageNum * 13; i < (presentPageNum + 1) * 13; i++) {
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:0.47 andHeight:1 andWidth:1 andText:@"000000001"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:1.68 andHeight:1 andWidth:1 andText:@"黑色牛皮"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:3.0 andHeight:1 andWidth:1 andText:@"她"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:3.9 andHeight:1 andWidth:1 andText:[NSString stringWithFormat:@"C000000000%d", i]];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:5.27 andHeight:1 andWidth:1 andText:@"225"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:5.89 andHeight:1 andWidth:1 andText:@"10"];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:6.49 andHeight:1 andWidth:1 andText:@""];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:7.29 andHeight:1 andWidth:1 andText:@""];
            [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.4 + 0.19 * n andVertical:7.9 andHeight:1 andWidth:1 andText:@""];
            n = n - 1;
        }
    }
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.36 andVertical:0.51 andHeight:1 andWidth:1 andText:@"制单人：AAAAAA"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.2 andVertical:0.51 andHeight:1 andWidth:1 andText:@"制单时间： 2017-06-12"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.05 andVertical:0.51 andHeight:1 andWidth:1 andText:@"打印人：BBBBSS"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.36 andVertical:3.07 andHeight:1 andWidth:1 andText:@"发货确认人：AAAAAA"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.2 andVertical:3.07 andHeight:1 andWidth:1 andText:@"发货确认时间：2018-06-16"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.05 andVertical:3.07 andHeight:1 andWidth:1 andText:@"打印时间：2018-06-16"];
    
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.36 andVertical:5.63 andHeight:1 andWidth:1 andText:@"收货人: "];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.2 andVertical:5.63 andHeight:1 andWidth:1 andText:@"收货时间："];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.05 andVertical:5.63 andHeight:1 andWidth:1 andText:@"货运公司："];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.36 andVertical:7.0 andHeight:1 andWidth:1 andText:@"状态：已发未收"];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.2 andVertical:7.0 andHeight:1 andWidth:1 andText:@"备注: "];
    [_ptkTestUtil PrintText:0 andDarkness:dark andHorizontal:0.05 andVertical:7.0 andHeight:1 andWidth:1 andText:[NSString stringWithFormat:@"共%d页 当前第%d页",pageNums, presentPageNum+1]];
    
//    [_ptkTestUtil DSZPLSetCutter:1 andCutter:true];
    
    // 发结束标志
    int ret = [_ptkTestUtil PrintText:3 andDarkness:dark andHorizontal:0 andVertical:0 andHeight:1 andWidth:1 andText:@""];
    if ((billNums - 1) == presentbill && (pageNums - 1) == presentPageNum) {
//        [_ptkTestUtil DSCloseWifi];
    }
    return ret;
}

////
- (UIImage *)snapshot {
    //显示区域的大小
    CGSize sz;
    sz.width = _editPcxMsg.frame.size.width;
    sz.height = _editPcxMsg.frame.size.height;
    UIGraphicsBeginImageContextWithOptions(sz, NO, [[UIScreen mainScreen] scale]);
    
    CGRect btnFrame = _editPcxMsg.frame;
    //截屏图片的大小
    CALayer *layer = _editPcxMsg.layer;
    CGRect rt;
    CGPoint pt;
    pt.x = layer.position.x + 2;
    pt.y = layer.position.y + 2;
    rt.origin.x = layer.bounds.origin.x;
    rt.origin.y = layer.bounds.origin.y;
    rt.size.height = layer.bounds.size.height - 4;//
    rt.size.width = [self widthForString:_editPcxMsg.text fontSize:[UIFont systemFontSize] andHeight:10.0];//layer.bounds.size.width - 4;
    layer.bounds = rt;
    layer.position = pt;
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _editPcxMsg.frame = btnFrame;
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    [_imgView addSubview:imgView];
    return image;
}

//----
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer
{
    
    [self.view endEditing:YES];
}

//获取字符串的宽度
-(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, height) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}
//获得字符串的高度
-(float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByCharWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.height;
}

@end
