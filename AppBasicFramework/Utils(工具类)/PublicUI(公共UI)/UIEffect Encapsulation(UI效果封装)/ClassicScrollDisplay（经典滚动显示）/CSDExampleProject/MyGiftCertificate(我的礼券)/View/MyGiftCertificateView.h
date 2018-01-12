//
//  MyGiftCertificateView.h
//  LCTProject
//
//  Created by 李广帅 on 2017/10/26.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "RootView.h"
@class ClassicScrollDisplayBottomView;
#import "MyGiftCertificateDetailedView.h"
@interface MyGiftCertificateView : RootView
@property (nonatomic,strong) ClassicScrollDisplayBottomView *CSDBView;
@property (nonatomic,strong) MyGiftCertificateDetailedView *MGViewForUnused;
@property (nonatomic,strong) MyGiftCertificateDetailedView *MGViewForUsed;
@property (nonatomic,strong) MyGiftCertificateDetailedView *MGViewForExpired;

@property (nonatomic,strong) NSMutableArray *mutArrForGiftListOne;
@property (nonatomic,strong) NSMutableArray *mutArrForGiftListTow;
@property (nonatomic,strong) NSMutableArray *mutArrForGiftListThree;

@end
