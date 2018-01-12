//
//  RootViewController.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

#pragma mark --控制器数据刷新操作--
///当前页码
@property (nonatomic,assign) CGFloat currentPageNumber;
@property (nonatomic,assign) CGFloat currentPageNumberForLoadMore;
///总页码
@property (nonatomic,assign) NSInteger AllPage;
///总数据
@property (nonatomic,strong) NSMutableArray *mutArrAll;

///视图
@property (nonatomic,strong) RootView *RVCBottomView;

#pragma mark --激活，关闭点击事件（默认激活）--
///激活，关闭点击事件（默认激活)
@property (nonatomic,assign) BOOL canClick;
#pragma mark --状态OK，NO（默认NO）--
///状态OK，NO（默认NO）
@property (nonatomic,assign) BOOL isOK;

@end
