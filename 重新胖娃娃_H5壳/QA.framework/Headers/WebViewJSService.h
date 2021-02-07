//
//  WebViewJSService.h
//  QA
//
//  Created by wangqi on 2018/12/9.
//  Copyright © 2018年 冉黎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>;
#import <JavaScriptCore/JavaScriptCore.h>

@protocol WebViewJSServiceDelegate;
@protocol WebViewJSServiceProtocol;

@interface WebViewJSService : NSObject<WebViewJSServiceProtocol>
@property (nonatomic, readwrite, weak) id<WebViewJSServiceDelegate> delegate;
+(id)sharedInstance:(UIWebView *)webView;
@end

@protocol WebViewJSServiceDelegate <NSObject>
-(void)javascriptCallback:(NSString *)value;
@end

@protocol WebViewJSServiceProtocol <JSExport>
-(void)javascriptCallback:(NSString *)value;
@end;
