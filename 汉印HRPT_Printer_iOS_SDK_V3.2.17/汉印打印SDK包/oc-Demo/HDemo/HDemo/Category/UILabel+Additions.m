//
//  UILabel+Additions.m
//  HDemo
//
//  Created by ios on 2020/11/5.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

+ (UILabel *(^)(CGRect frame))label
{
    return ^(CGRect frame) {
        return [[UILabel alloc] initWithFrame:frame];
    };
}


@end
