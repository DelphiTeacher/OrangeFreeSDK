//
//  WBQRCodeVC.h
//  SGQRCodeExample
//
//  Created by kingsic on 2018/2/8.
//  Copyright © 2018年 kingsic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGQRCodeObtain.h"

@interface WBQRCodeVC : UIViewController
/** 扫描二维码回调方法 */
- (void)setBlockWithQRCodeObtainScanResult:(SGQRCodeObtainScanResultBlock)block;
@end
