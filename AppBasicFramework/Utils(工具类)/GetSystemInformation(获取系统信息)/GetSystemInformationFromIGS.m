//
//  GetSystemInformationFromIGS.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "GetSystemInformationFromIGS.h"

@implementation GetSystemInformationFromIGS
//获取系统时间
+ (NSString *)getsCurrentSystemTime
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *DateTime = [formatter stringFromDate:date];
    NSLog(@"当前系统时间%@",DateTime);
    return DateTime;
}
//获取当前程序版本号
+ (NSString *)getsCurrentSystemVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

@end
