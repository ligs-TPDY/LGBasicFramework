//
//  CocoaLumberjackMactos.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/29.
//  Copyright © 2017年 IGS. All rights reserved.
//

#ifndef CocoaLumberjackMactos_h
#define CocoaLumberjackMactos_h

//定义并导入CoCoaLumberJack框架
#define LOG_LEVEL_DEF ddLogLevel

#import <CocoaLumberjack.h>
#import "CatchCrash.h"

/**
   DDLogError(@"[Error]:%@", @"输出错误信息");//输出错误信息
   DDLogWarn(@"[Warn]:%@", @"输出警告信息");//输出警告信息
   DDLogInfo(@"[Info]:%@", @"输出描述信息");//输出描述信息
   DDLogDebug(@"[Debug]:%@", @"输出调试信息");//输出调试信息
   DDLogVerbose(@"[Verbose]:%@", @"输出详细信息");//输出详细信息
 */

//通过DEBUG模式设置全局日志等级，DEBUG时为Verbose，所有日志信息都可以打印，否则Error，只打印
#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelDebug;
#else
static const DDLogLevel ddLogLevel = DDLogLevelError;
#endif

//但是这样并不能满足我们打印文件名、函数名、行号的需求，于是，在PCH文件中，再次宏定义一下，例如DDLogError：
#define GLogError(format, ...)      DDLogError((@"\n[函数名:%s]" "\n[行号:%d]\n" format), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#define GLogWarn(format, ...)       DDLogWarn((@"\n[函数名:%s]" "\n[行号:%d]\n" format),__FUNCTION__, __LINE__, ##__VA_ARGS__);
#define GLogInfo(format, ...)       DDLogInfo((@"\n[函数名:%s]" "\n[行号:%d]\n" format),__FUNCTION__, __LINE__, ##__VA_ARGS__);
#define GLogDebug(format, ...)      DDLogDebug((@"\n[函数名:%s]" "\n[行号:%d]\n" format),__FUNCTION__, __LINE__, ##__VA_ARGS__);
#define GLogVerbose(format, ...)    DDLogVerbose((@"\n[函数名:%s]" "\n[行号:%d]\n" format),__FUNCTION__, __LINE__, ##__VA_ARGS__);

/*
    1,GLogVerbose:前期开发阶段使用此打印，主要用于基本的数据调试，基本的日志布局，由于基本所以繁琐，在后期调试bug时，谨慎使用。
    2,GLogDebug:用来开发后期调试bug使用，关键bug疑似位置用此打印。
    3,GLogInfo:用来与网络请求数据进行调试，此模式支持所有网络请求的数据打印，包括GLogError的错误信息。
    4,GLogWarn:用来标记提示信息，如需要后期跟进的，特别留意的等信息。
    5,GLogError:打印错误的系统返回的原因。
*/

#endif /* CocoaLumberjackMactos_h */
