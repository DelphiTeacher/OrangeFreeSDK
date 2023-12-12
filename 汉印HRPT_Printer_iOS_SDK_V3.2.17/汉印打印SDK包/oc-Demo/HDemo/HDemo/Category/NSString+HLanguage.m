//
//  NSString+HLanguage.m
//  HDemo
//
//  Created by ios on 2021/6/16.
//  Copyright © 2021 Hanin. All rights reserved.
//

#import "NSString+HLanguage.h"

@implementation NSString (HLanguage)

- (NSString *)localized
{
    return [[NSBundle mainBundle] localizedStringForKey:self value:nil table:nil];
}

@end
