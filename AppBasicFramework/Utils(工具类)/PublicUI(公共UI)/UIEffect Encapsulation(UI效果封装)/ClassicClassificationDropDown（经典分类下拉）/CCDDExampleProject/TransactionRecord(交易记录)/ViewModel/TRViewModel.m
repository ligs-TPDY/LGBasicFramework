//
//  TRViewModel.m
//  LCTProject
//
//  Created by 李广帅 on 2017/11/2.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "TRViewModel.h"

@implementation TRViewModel
+ (void)getTradeDetailData:(RootViewController *)controller Parameters:(NSDictionary *)dic
{
    [IGSNetworkHelper getDatAccordingTag:@"tradeDetail" Parameters:dic success:^(id response) {
        if ([self unifiedAnalyticNetwork:response Controller:controller]) {
            
        }
    } failure:^(NSError *error) {
    }];
}
@end
