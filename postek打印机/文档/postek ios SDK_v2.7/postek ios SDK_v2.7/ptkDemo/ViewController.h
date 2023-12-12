//
//  ViewController.h
//  ptkDemo
//
//  Created by SDP-MAC on 2017/9/29.
//  Copyright © 2017年 Postek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
-(IBAction)connect;
-(IBAction)disconnect;
-(IBAction)printBtn;
-(IBAction)printBtn1;
-(IBAction)printBtn2;
-(IBAction)printBtn3;
-(IBAction)printBtn4;
-(IBAction)printBtn5;
- (UIImage *)snapshot;
@property (weak, nonatomic) IBOutlet UITextField *editIP;
@property (weak, nonatomic) IBOutlet UITextField *editPort;
@property (weak, nonatomic) IBOutlet UILabel *label0;
@property (weak, nonatomic) IBOutlet UITextField *editMsg1;
@property (weak, nonatomic) IBOutlet UITextField *editPcxMsg;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

