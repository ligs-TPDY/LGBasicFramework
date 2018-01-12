//
//  说明文档.m
//  HuaRJProject
//
//  Created by apple on 17/3/31.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 UMShareViewForCustom *UMVFC = [[UMShareViewForCustom alloc]init];
 [weakSelf addSubview:UMVFC];
 */

/**
 3.1  分享面板注意事项
 由于 1. 创建Xcode项目会默认添加Main.storyboard作为Main Interface(General - Deployment Info)，也就是项目的主Window。 2. 如果没使用Main.storyboard而又另外在AppDelegate中创建了UIWindow对象，如
 
 self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds]
 
 如果项目中同时出现Main Interface以及代码创建UIWindow会导致分享面板无法正常弹出，解决方法是移除其一即可。
 */
