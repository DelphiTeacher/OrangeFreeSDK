//
//  HBaseNavigationController.m
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import "HBaseNavigationController.h"
#import "HConst.h"

@interface HBaseNavigationController ()

@end

@implementation HBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 13, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        appearance.backgroundImage = ThemeImage;
        appearance.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
        appearance.shadowImage = [[UIImage alloc] init];
        self.navigationBar.standardAppearance = appearance;
        self.navigationBar.scrollEdgeAppearance = appearance;
        [self.navigationBar setTranslucent:NO];
        self.navigationBar.barStyle = UIBarStyleBlack;
        self.navigationBar.tintColor = [UIColor whiteColor];
        
    }else {
        self.navigationBar.barStyle = UIBarStyleBlack;
        self.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
        [self.navigationBar setBackgroundImage:ThemeImage forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.shadowImage = [[UIImage alloc] init];
    }
}


@end




