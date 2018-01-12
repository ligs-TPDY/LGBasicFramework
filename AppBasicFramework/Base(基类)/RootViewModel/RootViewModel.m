//
//  RootModelView.m
//  AppBasicFramework
//
//  Created by IOS on 2017/7/17.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootViewModel.h"

@interface RootViewModel ()

@end

@implementation RootViewModel

//统一解析网络
+ (BOOL)unifiedAnalyticNetwork:(id)response Controller:(RootViewController *)controller;
{
    NSDictionary *dic = (NSDictionary *)response;
    NSString *status    = [NSString stringWithFormat:@"%@",dic[@"status"]];
    NSString *message   = [NSString stringWithFormat:@"%@",dic[@"message"]];
//    NSString *content   = [NSString stringWithFormat:@"%@",dic[@"content"]];
    NSString *callback  = [NSString stringWithFormat:@"%@",dic[@"callback"]];
//    NSString *url       = [NSString stringWithFormat:@"%@",dic[@"url"]];
//    NSString *remark    = [NSString stringWithFormat:@"%@",dic[@"remark"]];
    if ([status isEqualToString:@"OK"]) {
        return YES;
    }else{
        NSArray *array = @[@"/app/login"];
        if ([array containsObject:callback]) {
//            if ([callback isEqualToString:@"/app/login"]) {
//                UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc]init]];
//                [controller presentViewController:nav animated:YES completion:nil];
//            }
        }else{
            [PromptBounced popUpPromptBounced:message];
        }
    }
    
    return NO;
}
@end
