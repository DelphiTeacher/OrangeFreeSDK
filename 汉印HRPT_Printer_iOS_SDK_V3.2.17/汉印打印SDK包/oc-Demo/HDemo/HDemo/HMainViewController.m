//
//  HMainViewController.m
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import "HMainViewController.h"
#import "HConst.h"
#import "HBLEViewController.h"
#import "HCPCLViewController.h"
#import "HTSPLViewController.h"
#import "HESCViewController.h"
#import "HZPLViewController.h"

@interface HMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"SDK Sample".localized;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Disconnect".localized style:UIBarButtonItemStylePlain target:self action:@selector(disconnect)];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}

- (void)disconnect
{
    if ([PTDispatcher share].printerConnected != nil) {
        [[PTDispatcher share] disconnect];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    
    __weak HMainViewController *weakSelf = self;
    [[PTDispatcher share] whenUnconnect:^(BOOL isActive) {
        __strong HMainViewController *strongSelf = weakSelf;
        [strongSelf.tableView reloadData];
        [SVProgressHUD showInfoWithStatus:@"The device is disconnected".localized];
        [strongSelf.navigationController popToRootViewControllerAnimated:YES];
    }];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        [self.navigationController pushViewController:[[HBLEViewController alloc] init] animated:YES];
    }
    
    if (indexPath.section == 1) {
        if ([PTDispatcher share].printerConnected == nil) {
            [SVProgressHUD showInfoWithStatus:@"Printer unconnected, pls. connect".localized];
        }else {
            switch (indexPath.row) {
            case 0:
                [self.navigationController pushViewController:[[HCPCLViewController alloc] init] animated:YES];
                break;
             case 1:
                [self.navigationController pushViewController:[[HTSPLViewController alloc] init] animated:YES];
                break;
            case 2:
               [self.navigationController pushViewController:[[HESCViewController alloc] init] animated:YES];
               break;
            case 3:
               [self.navigationController pushViewController:[[HZPLViewController alloc] init] animated:YES];
               break;
            default:
                break;
            }
        }
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 1 : 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iden"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"iden"];
    }
    
    if (indexPath.section == 0) {
        if ([PTDispatcher share].printerConnected == nil) {
            cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.9 blue:1.0 alpha:1.0];
            cell.textLabel.text = @"Unconnected".localized;
            cell.detailTextLabel.text = @"";
            
            cell.textLabel.textColor = ThemeColor;
            cell.detailTextLabel.textColor = ThemeColor;
            
            [UIView beginAnimations:nil context:nil];
            
            cell.textLabel.alpha = 0;
            cell.detailTextLabel.alpha = 0;

            [UIView setAnimationDelay:0];
            [UIView setAnimationDuration:0.6];
            [UIView setAnimationRepeatCount:UINT32_MAX];
            [UIView setAnimationRepeatAutoreverses:YES];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            
            cell.textLabel.alpha = 1.0;
            cell.detailTextLabel.alpha = 1.0;
            
            [UIView commitAnimations];
        }else {
            
            if ([[PTDispatcher share].printerConnected.name length] > 0) {
                cell.textLabel.text = [PTDispatcher share].printerConnected.name;
            }else {
                cell.textLabel.text = @"Connected".localized;
            }
            cell.textLabel.textColor = [UIColor blackColor];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setUserInteractionEnabled:YES];
    }
    
    if (indexPath.section == 1) {
        NSArray *cmdArrays = @[@"CPCL",@"TSPL",@"ESC",@"ZPL"];
        cell.textLabel.text = cmdArrays[indexPath.row];
        cell.detailTextLabel.text = @"";
        
        cell.textLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section == 0 ? @"Destination Device".localized : @"Printer Command".localized;
}




@end





