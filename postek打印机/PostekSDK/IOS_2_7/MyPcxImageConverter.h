//
//  PcxImageConverter.h
//  ptkDemo
//
//  Created by SDP-MAC on 2017/9/30.
//  Copyright © 2017年 Postek. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>

@interface PcxImageConverter : NSObject
+(NSData* )convertToPcx:(NSArray*) arrContent withFont: (UIFont *)font andShowStyle:(BOOL)bShowStyle;
+(NSData* )ImageConvertToPcx:(UIImage*)image;
+(NSData*)BarcodeImageConvertToPCX:(NSString *)string Width:(double)width
                            Height:(double)height;
+(NSData*)BarcodeCenterImageConvertToPCX:(NSString *)string Width:(double)width
                            Height:(double)height AndCenterImage:(UIImage *)centerImage;
@end
