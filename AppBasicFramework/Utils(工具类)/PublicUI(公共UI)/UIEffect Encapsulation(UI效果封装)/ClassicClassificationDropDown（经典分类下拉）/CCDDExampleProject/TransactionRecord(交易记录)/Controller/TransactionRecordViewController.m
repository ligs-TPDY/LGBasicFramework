//
//  TransactionRecordViewController.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/25.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "TransactionRecordViewController.h"
#import "TransactionRecordView.h"
#import "TRViewModel.h"
@interface TransactionRecordViewController ()
@property (nonatomic,strong) TransactionRecordView *TRBottomView;
@end

@implementation TransactionRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cate = @"1";
    
    [self setUpTitle];
    
    GWeakSelf(self);
//    [self.TRBottomView setCallback:^(NSString *str) {
//        weakself.currentPageNumberForLoadMore = 1;
//        weakself.currentPageNumber = weakself.currentPageNumberForLoadMore;
//        [weakself.mutArrAll removeAllObjects];
//        [weakself requsetData];
//        
//        weakself.cate = str;
//    }];
    
    [self.TRBottomView setCallBackToRefresh:^{
        weakself.currentPageNumberForLoadMore = 1;
        weakself.currentPageNumber = weakself.currentPageNumberForLoadMore;
        [weakself.mutArrAll removeAllObjects];
        [weakself requsetData];
    }];
    
    [self.TRBottomView setCallBackToLoadMore:^{
        weakself.currentPageNumberForLoadMore ++;
        weakself.currentPageNumber = weakself.currentPageNumberForLoadMore;
        if (weakself.currentPageNumber <= weakself.AllPage)
        {
            [weakself requsetData];
        }else{
            weakself.TRBottomView.mutArrForLoanList = weakself.mutArrAll;
            weakself.TRBottomView.TRTableView.mj_footer.state = MJRefreshStateNoMoreData;
        }
    }];
}
- (void)requsetData
{
//    NSString *str = [NSString stringWithFormat:@"%f",self.currentPageNumber];
//    [self.mutDic setObject:@[_cate,str] forKey:@[@"tradeType",@"page.current"]];
//    
//    [TRViewModel getTradeDetailData:self Parameters:self.mutDic];
}
- (TransactionRecordView *)TRBottomView
{
    if (_TRBottomView != nil) {
        return _TRBottomView;
    }
    
    _TRBottomView = [[TransactionRecordView alloc]init];
    _TRBottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_TRBottomView];
    [_TRBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    return _TRBottomView;
}
#pragma mark -- 设置表头 --
- (void)setUpTitle
{
    [self setForNavWithbackgroundColor:nil TitleColor:nil Title:@"经典下拉显示" TitleSize:19];
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_as_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(clickForBack)];
    leftBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBarItem;
}
- (void)clickForBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
