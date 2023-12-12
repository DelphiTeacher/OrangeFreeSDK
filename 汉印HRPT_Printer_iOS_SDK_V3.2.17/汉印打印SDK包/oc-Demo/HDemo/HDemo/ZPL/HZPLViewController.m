//
//  HZPLViewController.m
//  HDemo
//
//  Created by ios on 2021/8/19.
//  Copyright © 2021 Hanin. All rights reserved.
//

#import "HZPLViewController.h"
#import "HConst.h"
#import "HZPLFunctions.h"

@interface HZPLViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *functions;

@end

@implementation HZPLViewController

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
    
    self.navigationItem.title = @"ZPL function".localized;
    
    self.functions = @[@"Self-test page Sample".localized,
                       @"Bitmap Sample".localized,
                       @"Barcode Sample".localized,
                       @"Graphics Sample".localized,
                       @"Text Sample1".localized];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-kSafeAreaBottomHeight);
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
        [HZPLFunctions testPrintSelfpage];
        break;
    case 1:
        [HZPLFunctions testPrintImage];
        break;
    case 2:
        [HZPLFunctions testPrintBarcode];
        break;
    case 3:
        [HZPLFunctions testGraphicsSample];
        break;
    case 4:
        [HZPLFunctions testTextSample];
        break;
    default:
        break;
    }
}

@end
