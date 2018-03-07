//
//  AppDelegate+LG_localNotification.h
//  BlockDemo
//
//  Created by IOS on 2018/3/7.
//  Copyright © 2018年 KennyHito. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (LG_localNotification)


//创建本地通知
- (void)createLGLocalNotification:(NSDictionary *)launchOptions;

// 设置本地通知
+ (void)setLGLocalNotification;


@end
