//
//  HCPCLViewController.m
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import "HCPCLViewController.h"
#import "HConst.h"
#import "HCPCLFunctions.h"

@interface HCPCLViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *functions;

@end

@implementation HCPCLViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"CPCL function".localized;
    self.functions = @[@"Device Status Sample".localized, @"Self-test page Sample".localized, @"Font Sample".localized, @"Text Sample".localized, @"Barcode Sample".localized, @"Bitmap Sample".localized, @"Text Sample1".localized];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-kSafeAreaBottomHeight);
    }];
    
    /// 打印完成的回调 需要打开这个状态回调 大部分机器默认打开
    [[PTDispatcher share] whenUpdatePrintState:^(PTPrintState state) {
        switch (state) {
        case PTPrintStateSuccess:
            [SVProgressHUD showSuccessWithStatus:@"Print Success".localized];
            break;
        case PTPrintStateFailureLidOpen:
            [SVProgressHUD showErrorWithStatus:@"Print fail (LidOpe)".localized];
            break;
        case PTPrintStateFailurePaperEmpty:
            [SVProgressHUD showErrorWithStatus:@"Print fail (PaperEmpty)".localized];
            break;
        default:
            break;
        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.functions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idea"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idea"];
    }
    
    cell.textLabel.text = self.functions[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
    case 0:
        [HCPCLFunctions testPrinterStatus];
        break;
    case 1:
        [HCPCLFunctions testPrintSelfpage];
        break;
    case 2:
        [HCPCLFunctions testPrinterFont];
        break;
    case 3:
        [HCPCLFunctions testPrintText];
        break;
    case 4:
        [HCPCLFunctions testPrintBarcode];
        break;
    case 5:
        [HCPCLFunctions testPrintImage];
        break;
    case 6:
        [HCPCLFunctions testSample];
        break;
    default:
        break;
    }
}

@end
