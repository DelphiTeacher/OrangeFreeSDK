//
//  UILabel+Additions.h
//  HDemo
//
//  Created by ios on 2020/11/5.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UILabel*_Nullable(^PDFrame)(CGRect frame);

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Additions)

+ (UILabel *(^)(CGRect frame))label;

@end

NS_ASSUME_NONNULL_END
