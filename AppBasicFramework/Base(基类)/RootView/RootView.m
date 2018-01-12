//
//  RootView.m
//  AppBasicFramework
//
//  Created by IOS on 2017/7/18.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootView.h"

@interface RootView ()

@end

@implementation RootView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self createUI];
    }
    return self;
}
#pragma mark - --下拉和上拉刷新--
- (void)setRVTableView:(UITableView *)RVTableView
{
    _RVTableView = RVTableView;
    
    _RVTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
}
- (void)NoDataAndStopRefresh
{
    _RVTableView.mj_footer = nil;
    _RVTableView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    
    [self stopRefresh];
}
- (void)haveDataAndStopRefresh
{
    _RVTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    _RVTableView.backgroundColor = [UIColor whiteColor];
    
    [self stopRefresh];
}
- (void)haveDataAndStopRefreshNoLoadMore
{
    [self stopRefresh];
}
-(void)refresh
{
    if (_callBackToRefresh)
    {
        _callBackToRefresh();
    }
}
-(void)loadMore
{
    if (_callBackToLoadMore)
    {
        _callBackToLoadMore();
    }
}
-(void)stopRefresh
{
    if ([_RVTableView.mj_header isRefreshing])
    {
        [_RVTableView.mj_header endRefreshing];
    }
    if ([_RVTableView.mj_footer isRefreshing])
    {
        [_RVTableView.mj_footer endRefreshing];
    }
}
#pragma mark - --无数据时提示用户数据为空--
- (void)createUI
{
    CGFloat width = GScreenWidth;
    
    CGFloat ww = width * 0.2;
    CGFloat hh = width * 0.25;
    
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
        make.width.mas_equalTo(ww);
        make.height.mas_equalTo(hh);
    }];
    [imgView setImage:[UIImage imageNamed:@"icon_wushuju"]];
}

@end
