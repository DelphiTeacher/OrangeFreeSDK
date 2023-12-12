//
//  HBLEViewController.m
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import "HBLEViewController.h"
#import "HConst.h"

@interface HBLEViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<PTPrinter *> *devices;

@end

@implementation HBLEViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}

- (NSArray *)devices
{
    if (!_devices) {
        _devices = [[NSArray alloc] init];
    }
    return _devices;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"BLE".localized;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-kSafeAreaBottomHeight);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [PTDispatcher share].unconnectBlock = nil;
    
    /// 判断手机蓝牙状态
    if ([[PTDispatcher share] getBluetoothStatus] == PTBluetoothStatePoweredOn) {
        
        [[PTDispatcher share] scanBluetooth];
        
        __weak HBLEViewController *weakSelf = self;
        [[PTDispatcher share] whenFindAllBluetooth:^(NSMutableArray<PTPrinter *> *printerArray) {
            __strong HBLEViewController *strongSelf = weakSelf;
            
            /// 按照距离排序
            strongSelf.devices = [printerArray sortedArrayUsingComparator:^NSComparisonResult(PTPrinter*  _Nonnull obj1, PTPrinter*  _Nonnull obj2) {
                return obj1.distance.floatValue > obj2.distance.floatValue;
            }];
            [strongSelf.tableView reloadData];
        }];
        
    }else if ([[PTDispatcher share] getBluetoothStatus] == PTBluetoothStatePoweredOff) {
        [SVProgressHUD showInfoWithStatus:@"Please turn on Bluetooth".localized];
    }else {
        [SVProgressHUD showInfoWithStatus:@"Please go to system Settings to find your APP open bluetooth permissions".localized];
    }
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [SVProgressHUD showWithStatus:@"Connecting, pls. wait".localized];
    
    [[PTDispatcher share] connectPrinter:self.devices[indexPath.row]];
    
    /// 异步回调
    __weak HBLEViewController *weakSelf = self;
    [[PTDispatcher share] whenConnectSuccess:^{
        [SVProgressHUD showSuccessWithStatus:@"Connection succeeded".localized];
        __strong HBLEViewController *strongSelf = weakSelf;
        [strongSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    /// 异步回调
    [[PTDispatcher share] whenConnectFailureWithErrorBlock:^(PTConnectError error) {
        NSString *errorString = @"";
        switch (error) {
        case PTConnectErrorBleSystem:
            errorString = @"System error".localized;
            break;
        case PTConnectErrorBleTimeout:
            errorString = @"Connection timeout".localized;
            break;
        case PTConnectErrorBleValidateFail:
            errorString = @"Vertification failed".localized;
            break;
        case PTConnectErrorBleUnknownDevice:
            errorString = @"Unknow device".localized;
            break;
        case PTConnectErrorBleValidateTimeout:
            errorString = @"Vertification timeout".localized;
            break;
        case PTConnectErrorBleDisvocerServiceTimeout:
            errorString = @"Connection failed".localized;
            break;
        default:
            break;
        }
        [SVProgressHUD showErrorWithStatus:errorString];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idea"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"idea"];
    }
    
    cell.textLabel.text = self.devices[indexPath.row].name;
    cell.detailTextLabel.text = self.devices[indexPath.row].mac;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Bluetooth device nearby".localized;
}


@end
