//
//  WKDelegateController.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/13.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <WebKit/WebKit.h>

@protocol WKDelegate <NSObject>

- (void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message;

@end

@interface WKDelegateController : UIViewController<WKScriptMessageHandler>

@property (nonatomic,weak) id<WKDelegate> delegate;

@end
