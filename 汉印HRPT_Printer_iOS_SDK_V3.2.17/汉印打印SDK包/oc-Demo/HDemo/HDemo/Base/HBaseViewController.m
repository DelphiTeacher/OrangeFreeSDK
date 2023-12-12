//
//  HBaseViewController.m
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import "HBaseViewController.h"
#import "HConst.h"

@interface HBaseViewController ()

@end

@implementation HBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SELECT_COLOR(242, 242, 242, 1);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self configNavigationBar];
}

/** 设置返回按钮 */
- (void)configNavigationBar
{
    if (self.navigationController.visibleViewController == self) {
        [self.navigationController setNavigationBarHidden:NO];
        if (self.navigationController.viewControllers.count > 1) {
            self.hidesBottomBarWhenPushed = YES;
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_return_btn"] style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
        }
    }
}

- (void)pressBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}



@end
