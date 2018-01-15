//
//  BasicMacros.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#ifndef BasicMacros_h
#define BasicMacros_h

/** 获取屏幕宽高*/
#define GScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define GScreenHeight [[UIScreen mainScreen] bounds].size.height
#define GSPercentage(s)  s/375
#define GSDistance(s) GScreenWidth *GSPercentage(s)

/** 强弱引用*/
#define GWeakSelf(type)  __weak typeof(type) weak##type = type;
#define GStrongSelf(type) __strong typeof(type) type = weak##type;

/** 打印日志*/
#define GLog(format,...)     NSLog((@"[函数名:%s--行号:%d]" format),__FUNCTION__, __LINE__, ##__VA_ARGS__)

//获取系统对象
#define GApplication        [UIApplication sharedApplication]
#define GAppWindow          [UIApplication sharedApplication].delegate.window
#define GAppDelegate        [AppDelegate shareAppDelegate]
#define GRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define GUserDefaults       [NSUserDefaults standardUserDefaults]
#define GNotificationCenter [NSNotificationCenter defaultCenter]

/** 属性快速声明*/
#define PropertyFloat(s) @property (nonatomic,assign) float  s
#define PropertyNSInteger(s) @property (nonatomic,assign) NSInteger  s
#define PropertyString(s) @property (nonatomic,copy) NSString * s
#define PropertyNSArray(s) @property (nonatomic,strong) NSArray * s
#define PropertyNSMutableArray(s) @property (nonatomic,strong) NSMutableArray * s
#define PropertyNSDictionary(s) @property (nonatomic,strong) NSDictionary * s

#endif /* BasicMacros_h */
