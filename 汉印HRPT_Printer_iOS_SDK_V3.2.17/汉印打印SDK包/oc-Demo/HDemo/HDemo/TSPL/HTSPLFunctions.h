//
//  HTSPLFunctions.h
//  HDemo
//
//  Created by ios on 2020/9/28.
//  Copyright © 2020 Hanin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTSPLFunctions : NSObject

+ (void)testPrinterStatus;

+ (void)testPrintSelfpage;

+ (void)testPrinterVectorText;

+ (void)testPrintDotMatrixText;

+ (void)testPrintBarcode;

+ (void)testPrintImage;

@end

NS_ASSUME_NONNULL_END
