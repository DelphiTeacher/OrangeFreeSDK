//
//  UIColor+RGB.h
//  HDemo
//
//  Created by ios on 2021/11/3.
//  Copyright © 2021 Hanin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (RGB)
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;
@end

NS_ASSUME_NONNULL_END
