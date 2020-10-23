//
//  WCQRCodeVC.h
//  SGQRCodeExample
//
//  Created by kingsic on 17/3/20.
//  Copyright © 2017年 kingsic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGQRCodeObtain.h"

@interface WCQRCodeVC : UIViewController
/** 扫描二维码回调方法 */
- (void)setBlockWithQRCodeObtainScanResult:(SGQRCodeObtainScanResultBlock)block;
@end
