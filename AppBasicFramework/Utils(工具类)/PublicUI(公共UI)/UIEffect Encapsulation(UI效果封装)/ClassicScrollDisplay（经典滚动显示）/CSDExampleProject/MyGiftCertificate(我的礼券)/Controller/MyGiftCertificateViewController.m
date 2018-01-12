//
//  MyGiftCertificateViewController.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/25.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "MyGiftCertificateViewController.h"
#import "MyGiftCertificateView.h"
#import "MGViewModel.h"
@interface MyGiftCertificateViewController ()
@property (nonatomic,strong) MyGiftCertificateView *MGBottomView;
@end

@implementation MyGiftCertificateViewController
- (void)setMutArrForGiftListOne:(NSMutableArray *)mutArrForGiftListOne
{
    _mutArrForGiftListOne = mutArrForGiftListOne;
    [_mutArrAll1 addObjectsFromArray:_mutArrForGiftListOne];
    self.MGBottomView.mutArrForGiftListOne = _mutArrAll1;
}
- (void)setMutArrForGiftListTow:(NSMutableArray *)mutArrForGiftListTow
{
    _mutArrForGiftListTow = mutArrForGiftListTow;
    [_mutArrAll2 addObjectsFromArray:_mutArrForGiftListTow];
    self.MGBottomView.mutArrForGiftListTow = _mutArrAll2;
}
- (void)setMutArrForGiftListThree:(NSMutableArray *)mutArrForGiftListThree
{
    _mutArrForGiftListThree = mutArrForGiftListThree;
    [_mutArrAll3 addObjectsFromArray:_mutArrForGiftListThree];
    self.MGBottomView.mutArrForGiftListThree = _mutArrAll3;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTitle];
    
    [self MGBottomView];
    
    _currentPageNumber1 = 1;
    _currentPageNumber2 = 1;
    _currentPageNumber3 = 1;
    _currentPageNumberForLoadMore1 = 1;
    _currentPageNumberForLoadMore2 = 1;
    _currentPageNumberForLoadMore3 = 1;
    _AllPage1 = 1;
    _AllPage2 = 1;
    _AllPage3 = 1;
    _mutArrAll1 = [[NSMutableArray alloc]init];
    _mutArrAll2 = [[NSMutableArray alloc]init];
    _mutArrAll3 = [[NSMutableArray alloc]init];
    NSString *str1 = [NSString stringWithFormat:@"%f",_currentPageNumber1];
    _mutDic1 = [[NSMutableDictionary alloc]initWithObjects:@[@"1",str1] forKeys:@[@"gift.status",@"page.current"]];
    NSString *str2 = [NSString stringWithFormat:@"%f",_currentPageNumber2];
    _mutDic2 = [[NSMutableDictionary alloc]initWithObjects:@[@"2",str2] forKeys:@[@"gift.status",@"page.current"]];
    NSString *str3 = [NSString stringWithFormat:@"%f",_currentPageNumber1];
    _mutDic3 = [[NSMutableDictionary alloc]initWithObjects:@[@"3",str3] forKeys:@[@"gift.status",@"page.current"]];
    
    GWeakSelf(self);
    [self.MGBottomView.MGViewForUnused setCallBackToRefresh:^{
        weakself.currentPageNumberForLoadMore1 = 1;
        weakself.currentPageNumber1 = weakself.currentPageNumberForLoadMore1;
        [weakself.mutArrAll1 removeAllObjects];
        [weakself request1];
    }];
    [self.MGBottomView.MGViewForUsed setCallBackToRefresh:^{
        weakself.currentPageNumberForLoadMore2 = 1;
        weakself.currentPageNumber2 = weakself.currentPageNumberForLoadMore2;
        [weakself.mutArrAll2 removeAllObjects];
        [weakself request2];
    }];
    [self.MGBottomView.MGViewForExpired setCallBackToRefresh:^{
        weakself.currentPageNumberForLoadMore3 = 1;
        weakself.currentPageNumber3 = weakself.currentPageNumberForLoadMore3;
        [weakself.mutArrAll3 removeAllObjects];
        [weakself request3];
    }];
    [self.MGBottomView.MGViewForUnused setCallBackToLoadMore:^{
        weakself.currentPageNumberForLoadMore1 ++;
        weakself.currentPageNumber1 = weakself.currentPageNumberForLoadMore1;
        if (weakself.currentPageNumber1 < weakself.AllPage1)
        {
            [weakself request1];
        }else{
            weakself.MGBottomView.mutArrForGiftListOne = weakself.mutArrAll1;
            weakself.MGBottomView.MGViewForUnused.MGTableView.mj_footer.state = MJRefreshStateNoMoreData;
        }
    }];
    [self.MGBottomView.MGViewForUsed setCallBackToLoadMore:^{
        weakself.currentPageNumberForLoadMore2 ++;
        weakself.currentPageNumber2= weakself.currentPageNumberForLoadMore2;
        if (weakself.currentPageNumber2 < weakself.AllPage2)
        {
            [weakself request2];
        }else{
            weakself.MGBottomView.mutArrForGiftListTow = weakself.mutArrAll2;
            weakself.MGBottomView.MGViewForUsed.MGTableView.mj_footer.state = MJRefreshStateNoMoreData;
        }
    }];
    [self.MGBottomView.MGViewForExpired setCallBackToLoadMore:^{
        weakself.currentPageNumberForLoadMore3 ++;
        weakself.currentPageNumber3 = weakself.currentPageNumberForLoadMore3;
        if (weakself.currentPageNumber3 < weakself.AllPage3)
        {
            [weakself request3];
        }else{
            weakself.MGBottomView.mutArrForGiftListThree = weakself.mutArrAll3;
            weakself.MGBottomView.MGViewForExpired.MGTableView.mj_footer.state = MJRefreshStateNoMoreData;
        }
    }];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self request1];
    [self request2];
    [self request3];
}
- (void)request1
{
//    NSString *str = [NSString stringWithFormat:@"%f",_currentPageNumber1];
//    [_mutDic1 setObject:str forKey:@"page.current"];
//    [MGViewModel getGiftListData:self Parameters:_mutDic1];
}
- (void)request2
{
//    NSString *str = [NSString stringWithFormat:@"%f",_currentPageNumber2];
//    [_mutDic2 setObject:str forKey:@"page.current"];
//    [MGViewModel getGiftList2Data:self Parameters:_mutDic2];
}
- (void)request3
{
//    NSString *str = [NSString stringWithFormat:@"%f",_currentPageNumber3];
//    [_mutDic3 setObject:str forKey:@"page.current"];
//    [MGViewModel getGiftList3Data:self Parameters:_mutDic3];
}
- (MyGiftCertificateView *)MGBottomView
{
    if (_MGBottomView != nil) {
        return _MGBottomView;
    }
    
    _MGBottomView = [[MyGiftCertificateView alloc]init];
    _MGBottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_MGBottomView];
    [_MGBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    return _MGBottomView;
}
#pragma mark -- 设置表头 --
- (void)setUpTitle
{
    [self setForNavWithbackgroundColor:nil TitleColor:nil Title:@"经典滚动示例" TitleSize:19];
    
    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_as_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(clickForBack)];
    leftBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBarItem;
}
- (void)clickForBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
