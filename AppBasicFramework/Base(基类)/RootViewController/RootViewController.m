//
//  RootViewController.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

//初始化数据
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _AllPage = 1;
        _currentPageNumber = 1;
        _currentPageNumberForLoadMore = 1;
        _mutArrAll = [[NSMutableArray alloc]init];
        
        _canClick = YES;
        
        _isOK = NO;
    }
    return self;
}

#pragma mark --初始化底层视图--
- (RootView *)RVCBottomView
{
    if (_RVCBottomView != nil) {
        return _RVCBottomView;
    };
    
    _RVCBottomView = [[RootView alloc]init];
    _RVCBottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_RVCBottomView];
    [_RVCBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    return _RVCBottomView;
}

@end
