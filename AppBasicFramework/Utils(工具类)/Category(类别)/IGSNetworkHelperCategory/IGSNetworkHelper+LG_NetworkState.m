//
//  IGSNetworkHelper+LG_NetworkState.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "IGSNetworkHelper+LG_NetworkState.h"

static NSString *DateTime0;

@implementation IGSNetworkHelper (LG_NetworkState)

//提示网络失败信息
+ (void)NetworkStateForFailure
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *DateTime = [formatter stringFromDate:date];
    GLogVerbose(@"%@",DateTime);
    
    NSArray *a = [DateTime componentsSeparatedByString:@":"];
    NSArray *b = [DateTime0 componentsSeparatedByString:@":"];
    if (a.count==3 && b.count == 3)
    {
        if (![a[1] isEqualToString:b[1]])
        {
            NSInteger first = [b[2] integerValue];
            NSInteger second = [a[2] integerValue]+60;
            
            if (second-first >= 10)
            {
                DateTime0 = DateTime;
                
                [SVProgressHUD showErrorWithStatus:@"亲，网络开小差了，请稍后再试"];
                [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
            }
        }else{
            NSInteger first = [b[2] integerValue];
            NSInteger second = [a[2] integerValue];
            
            if (second-first >= 10)
            {
                DateTime0 = DateTime;
                
                [SVProgressHUD showErrorWithStatus:@"亲，网络开小差了，请稍后再试"];
                [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
            }
        }
    }
    if (b.count == 0)
    {
        DateTime0 = DateTime;
        
        [SVProgressHUD showErrorWithStatus:@"亲，网络开小差了，请稍后再试"];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }
}

@end
