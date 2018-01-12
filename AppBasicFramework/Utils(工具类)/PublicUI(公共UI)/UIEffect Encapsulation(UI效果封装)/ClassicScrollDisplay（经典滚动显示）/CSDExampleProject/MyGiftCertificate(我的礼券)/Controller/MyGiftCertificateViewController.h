//
//  MyGiftCertificateViewController.h
//  LCTProject
//
//  Created by 李广帅 on 2017/10/25.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "RootViewController.h"

@interface MyGiftCertificateViewController : RootViewController

@property (nonatomic,strong) NSMutableArray *mutArrForGiftListOne;
@property (nonatomic,strong) NSMutableArray *mutArrForGiftListTow;
@property (nonatomic,strong) NSMutableArray *mutArrForGiftListThree;

//当前页码
@property (nonatomic,assign) CGFloat currentPageNumberForLoadMore1;
@property (nonatomic,assign) CGFloat currentPageNumber1;
//总页码
@property (nonatomic,assign) NSInteger AllPage1;
//总数据
@property (nonatomic,strong) NSMutableArray *mutArrAll1;
@property (nonatomic,strong) NSMutableDictionary *mutDic1;

//当前页码
@property (nonatomic,assign) CGFloat currentPageNumberForLoadMore2;
@property (nonatomic,assign) CGFloat currentPageNumber2;
//总页码
@property (nonatomic,assign) NSInteger AllPage2;
//总数据
@property (nonatomic,strong) NSMutableArray *mutArrAll2;
@property (nonatomic,strong) NSMutableDictionary *mutDic2;

//当前页码
@property (nonatomic,assign) CGFloat currentPageNumberForLoadMore3;
@property (nonatomic,assign) CGFloat currentPageNumber3;
//总页码
@property (nonatomic,assign) NSInteger AllPage3;
//总数据
@property (nonatomic,strong) NSMutableArray *mutArrAll3;
@property (nonatomic,strong) NSMutableDictionary *mutDic3;

@end
