//
//  BasicMacros.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#ifndef BasicMacros_h
#define BasicMacros_h

/** 打印日志*/
#define GLog(format,...)     NSLog((@"[函数名:%s--行号:%d]" format),__FUNCTION__, __LINE__, ##__VA_ARGS__)

//获取系统对象
#define GApplication        [UIApplication sharedApplication]
#define GAppWindow          [UIApplication sharedApplication].delegate.window
#define GAppDelegate        [AppDelegate shareAppDelegate]
#define GRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define GUserDefaults       [NSUserDefaults standardUserDefaults]
#define GNotificationCenter [NSNotificationCenter defaultCenter]

/** 获取屏幕宽高*/
#define GScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define GScreenHeight [[UIScreen mainScreen] bounds].size.height
#define GSPercentage(s)  s/375
#define GSDistance(s) GScreenWidth *GSPercentage(s)

/** 强弱引用*/
#define GWeakSelf(type)  __weak typeof(type) weak##type = type;
#define GStrongSelf(type) __strong typeof(type) type = weak##type;

/** 属性快速声明*/
#define PropertyFloat(s) @property (nonatomic,assign) float  s
#define PropertyNSInteger(s) @property (nonatomic,assign) NSInteger  s
#define PropertyString(s) @property (nonatomic,copy) NSString * s
#define PropertyNSArray(s) @property (nonatomic,strong) NSArray * s
#define PropertyNSMutableArray(s) @property (nonatomic,strong) NSMutableArray * s
#define PropertyNSDictionary(s) @property (nonatomic,strong) NSDictionary * s

/** 十进制颜色*/
#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
/** rgb颜色转换（16进制->10进制）*/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]/// rgb颜色转换（16进制->10进制）



#endif /* BasicMacros_h */
