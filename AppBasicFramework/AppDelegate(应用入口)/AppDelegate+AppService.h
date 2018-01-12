//
//  AppDelegate+AppService.h
//  App基础框架
//
//  Created by apple on 17/5/27.
//  Copyright © 2017年 BasicFrameworkFromIGS. All rights reserved.
//

#import "AppDelegate.h"
/**
 包含第三方 和 应用内业务的实现，减轻入口代码压力
 */
@interface AppDelegate (AppService)

//初始化window
-(void)initWindow;

//UMeng初始化
-(void)initUMeng;
//UMeng分享初始化
- (void)initUMengUShare;

//bugly初始化
-(void)initBugly;

//CocoaLumberjack初始化
- (void)initCocoaLumberjack;

/**
    当前顶层控制器
 */
- (UIViewController *)getTopVC;
- (UIViewController *)getCurrentVC;
- (UIViewController *)getCurrentUIVC;


+ (AppDelegate *)shareAppDelegate;

@end
