//
//  NSURLProtocolQA.h
//  QA
//
//  Created by wangqi on 2018/11/29.
//  Copyright © 2018年 冉黎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

static NSString* const FilteredKey = @"FilteredKey";

@interface NSURLProtocolQA : NSURLProtocol
@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSURLConnection *connection;
@end
