//
//  MGViewModel.m
//  LCTProject
//
//  Created by 李广帅 on 2017/11/1.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "MGViewModel.h"
#import "MyGiftCertificateViewController.h"
@implementation MGViewModel
+ (void)getGiftListData:(RootViewController *)controller Parameters:(NSDictionary *)dic
{
    [IGSNetworkHelper getDatAccordingTag:@"giftList" Parameters:dic success:^(id response) {
        if ([super unifiedAnalyticNetwork:response Controller:controller]) {
            MyGiftCertificateViewController *con =(MyGiftCertificateViewController *)controller;
            NSMutableArray *mutArr0 = [RootModel dataStoredClass:@"MGModel" DataArr:response[@"content"][@"list"]];
            con.mutArrForGiftListOne = mutArr0;
            con.AllPage1 = [response[@"content"][@"pageCount"] integerValue];
        }
    } failure:^(NSError *error) {
    }];
}
+ (void)getGiftList2Data:(RootViewController *)controller Parameters:(NSDictionary *)dic
{
    [IGSNetworkHelper getDatAccordingTag:@"giftList" Parameters:dic success:^(id response) {
        if ([super unifiedAnalyticNetwork:response Controller:controller]) {
            MyGiftCertificateViewController *con =(MyGiftCertificateViewController *)controller;
            NSMutableArray *mutArr0 = [RootModel dataStoredClass:@"MGModel" DataArr:response[@"content"][@"list"]];
            con.mutArrForGiftListTow = mutArr0;
            con.AllPage2 = [response[@"content"][@"pageCount"] integerValue];
        }
    } failure:^(NSError *error) {
    }];
}
+ (void)getGiftList3Data:(RootViewController *)controller Parameters:(NSDictionary *)dic
{
    [IGSNetworkHelper getDatAccordingTag:@"giftList" Parameters:dic success:^(id response) {
        if ([super unifiedAnalyticNetwork:response Controller:controller]) {
            MyGiftCertificateViewController *con =(MyGiftCertificateViewController *)controller;
            NSMutableArray *mutArr0 = [RootModel dataStoredClass:@"MGModel" DataArr:response[@"content"][@"list"]];
            con.mutArrForGiftListThree = mutArr0;
            con.AllPage3 = [response[@"content"][@"pageCount"] integerValue];
        }
    } failure:^(NSError *error) {
    }];
}
@end
