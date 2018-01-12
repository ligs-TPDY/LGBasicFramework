//
//  RootView.h
//  AppBasicFramework
//
//  Created by IOS on 2017/7/18.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

///刷新回调
typedef void(^backToRootRefresh)(void);
typedef void(^backToRootLoadMore)(void);

@interface RootView : UIView

#pragma mark --视图数据刷新--
@property (nonatomic,strong) UITableView * RVTableView;

///刷新回调
@property (nonatomic,copy) backToRootRefresh callBackToRefresh;
- (void)setCallBackToRefresh:(backToRootRefresh)callBackToRefresh;
///刷新回调
@property (nonatomic,copy) backToRootLoadMore callBackToLoadMore;
- (void)setCallBackToLoadMore:(backToRootLoadMore)callBackToLoadMore;

///数据为空时停止刷新
- (void)NoDataAndStopRefresh;
///数据不为空时停止刷新
- (void)haveDataAndStopRefresh;
///数据不为空时停止刷新没有加载更多功能
- (void)haveDataAndStopRefreshNoLoadMore;

@end
