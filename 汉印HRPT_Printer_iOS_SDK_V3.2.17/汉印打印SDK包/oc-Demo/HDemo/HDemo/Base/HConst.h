//
//  HConst.h
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#ifndef HConst_h
#define HConst_h

#import <SVProgressHUD/SVProgressHUD.h>
#import <MJRefresh/MJRefresh.h>
#import <HMSegmentedControl/HMSegmentedControl.h>
#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>
#import <PrinterSDK/PrinterSDK.h>
#import "NSString+HLanguage.h"
#import "UIImage+Color.h"
#import "UIColor+RGB.h"

#define SELECT_COLOR(_r,_g,_b,_alpha) [UIColor colorWithRed:_r / 255.0 green:_g / 255.0 blue:_b / 255.0 alpha:_alpha]

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define CURRENT_SIZE(_size) _size / 375.0 * SCREEN_WIDTH

#define ThemeColor [UIColor colorWithRGB:0xea5036]
#define ThemeImage [UIImage imageWithColor:ThemeColor]

#define kStatusBarHegiht [UIApplication sharedApplication].statusBarFrame.size.height
#define kSafeAreaBottomHeight (kStatusBarHegiht > 20 ? 34.0 : 0)
#define kSafeAreaTopHeight (kStatusBarHegiht > 20 ? 88.0 : 64.0)


#endif /* HConst_h */
