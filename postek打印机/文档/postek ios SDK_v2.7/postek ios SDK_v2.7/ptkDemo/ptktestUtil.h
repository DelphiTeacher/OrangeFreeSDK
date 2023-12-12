//
//  ptktestUtil.h
//  ptkDemo
//
//  Created by SDP-MAC on 2017/10/7.
//  Copyright © 2017年 Postek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PTKPrintSDK.h"

@interface ptktestUtil : NSObject
@property (strong, nonatomic) PTKPrintSDK *ptkSDK;
@property (nonatomic) int pdirec; // 打印方向，全局变量
@property (nonatomic) int NarrowWidth; // 条码中窄单元的宽度
@property (nonatomic) int WideWidth; // 条码中宽单元的宽度

-(void) DSLinkWifi:(NSString*) ipString andPort:(int)port;
-(void)DSCloseWifi;
-(BOOL)setPageLength:(double)len;
-(BOOL)setPageLengthEX:(double)nHeight;
-(BOOL) PrintText:(int)command andDarkness:(int)darkness andHorizontal:(double) horizontal andVertical:(double)vertical andHeight:(int)height andWidth:(int) width andText:(NSString*) text;
-(BOOL) DSSetDirection:(int) dir;
- (BOOL) Print_HLine:(int) command andHorizontal:(double) horizontal andVertical:(double) vertical andLenth:(double)length andThick:(double) thick;
-(BOOL) Print_VLine:(int)command andHorizontal:(double)horizontal andVertical:(double)vertical andLenth:(double)length andThick:(double)thick;
-(BOOL) DSZPLPrintTextLine:(double)horizontal andVertical:(double)vertical andFontName:(NSString *)FontName andBoldweight:(CGFloat)andBoldweight andSize:(int)size andText:(NSString*) text andShowStyle:(BOOL)bShowStyleBlackFont;
-(BOOL)prinBarcodeQR:(double) horizontal andVertical:(double)vertical andQRContext:(NSString*)message andWidth:(double)width andHeight:(double)height;
-(BOOL)prinBarcodeQRCenterImage:(double) horizontal andVertical:(double)vertical andQRContext:(NSString*)message andWidth:(double)width andHeight:(double)height AndCenterImage:(UIImage *)centerImage;
- (BOOL) DSZPLDrawGraphics:(double) horizontal andVertical:(double)vertical andImage:(UIImage*)image andScale:(double)scale;
-(BOOL) DSZPLPrintCenterTextInCell:(int)command andCellH:(double)cellHorizontal andVertical:(double) vertical andCellW:(double)CellWidth andFont:(UIFont *) fontface andBold:(BOOL) bold andFontSize:(int)fontsize andText:(NSString *) text;
-(BOOL) PrintCenterTextInCell:(int) command andDarkNess:(int) darkness andHorizontal:(double) cellHorizontal andVertical:(double)vertical andWidth:(double) CellWidth andHeight:(int)height andWidth:(int)width andText:(NSString *) text;
-(BOOL) PrintBelle:(double) xPos andYpos:(double)yPos andData:(NSString *)data;
-(BOOL)DSZPLSetCutter:(int)iQty andCutter:(BOOL)bEnableCutter;
-(BOOL) PrintCode128:(int) command andDarkness:(int) darkness andHorizontal:(double) horizontal andVertical:(double) vertical andHeight:(double) height andHeightHuman:(int) heightHumanRead andWidthHuman:(int) widthHumanRead andFlagHuman:(BOOL) flagHumanRead andPosHuman:(BOOL) posHumanRead andContent:(NSString *) content;
-(BOOL) DSPrintCode128Dispersion:(int) command andDarkness:(int)darkness andHorizontal:(double)horizontal andVertical:(double)vertical andHeight:(double) height andSizeHuman:(int)sizeHumanRead andFont:(UIFont *) fontface andBold:(BOOL) bold andContent:(NSString *) content;
-(int) DSZPLSetBarcodeDefaults:(int)narrowBarWidth andWideToNarrowRatio:(double) wideToNarrowRatio;
-(int)DSSetBarcodeDefaults:(int) narrowBarWidth andWideToNarrowRatio:(double) wideToNarrowRatio;

//
-(int) countTextLength:(NSString *)text;
-(int)InchToDots:(double)x;
-(int) countSpaceNum:(NSString *) str;
-( NSString*) getPCXName;
@end
