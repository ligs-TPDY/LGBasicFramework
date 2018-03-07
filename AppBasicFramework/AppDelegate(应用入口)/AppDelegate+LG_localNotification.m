//
//  AppDelegate+LG_localNotification.m
//  BlockDemo
//
//  Created by IOS on 2018/3/7.
//  Copyright © 2018年 KennyHito. All rights reserved.
//

#import "AppDelegate+LG_localNotification.h"

@implementation AppDelegate (LG_localNotification)

//创建本地通知
- (void)createLGLocalNotification:(NSDictionary *)launchOptions;
{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        // 设置通知的类型可以为弹窗提示,声音提示,应用图标数字提示
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        // 授权通知
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    }
    
    // 处理退出后通知的点击，程序启动后获取通知对象，如果是首次启动还没有发送通知，那第一次通知对象为空，没必要去处理通知（如跳转到指定页面）
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        UILocalNotification *localNotifi = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
        [self changeLocalNotifi:localNotifi];
    }
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [self changeLocalNotifi:notification];
}
- (void)changeLocalNotifi:(UILocalNotification *)notification{
    // 如果在前台直接返回
    /*  判断用户当前是否是激活状态 ,枚举值：
        UIApplicationStateActive,       激活
        UIApplicationStateInactive,     将要激活
        UIApplicationStateBackground    后台
    */
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
        //APP激活时
        NSLog(@"%@",notification.userInfo);
        return;
    }else{
        //程序退出获取本地通知的方法
        NSLog(@"%@",notification.userInfo);
    }
}

// 设置本地通知
+ (void)setLGLocalNotification
{
    // 1.创建通知
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    // 2.设置通知的必选参数
    // 设置通知显示的内容
    localNotification.alertBody = @"本地通知测试123";
    // 设置通知的发送时间，每隔3秒发送一个通知
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    // 标题
    localNotification.alertTitle = @"赶紧的了!";
    // 通知角标
    localNotification.applicationIconBadgeNumber = 1;
    // 通知声音
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    // 设置通知推送携带的参数，一般用于点击通知打开指定控制器页面
    localNotification.userInfo = @{@"1":@"2"};
    // 3.发送通知
    // 方式一: 根据通知的发送时间(fireDate)发送通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    // 方式二: 立即发送通知
    //    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
}


@end
