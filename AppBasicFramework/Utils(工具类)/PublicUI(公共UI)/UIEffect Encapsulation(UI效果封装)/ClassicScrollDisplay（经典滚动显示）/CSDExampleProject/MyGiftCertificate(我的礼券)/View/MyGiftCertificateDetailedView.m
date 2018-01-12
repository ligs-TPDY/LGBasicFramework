//
//  MyGiftCertificateDetailedView.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/26.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "MyGiftCertificateDetailedView.h"
#import "MGDTableViewCell.h"
@implementation MyGiftCertificateDetailedView
- (void)setMutArrForGiftList:(NSMutableArray *)mutArrForGiftList
{
    _mutArrForGiftList = mutArrForGiftList;
    
    if (_mutArrForGiftList.count == 0) {
        [self NoDataAndStopRefresh];
    }else{
        [self haveDataAndStopRefresh];
    }
    
    [_MGTableView reloadData];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
       self.RVTableView = self.MGTableView;
    }
    return self;
}
- (UITableView *)MGTableView
{
    _MGTableView = [[UITableView alloc]init];
    _MGTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_MGTableView];
    [_MGTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 64, 0));
    }];
    
    if (@available(iOS 11.0, *)){
        _MGTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    _MGTableView.delegate = self;
    _MGTableView.dataSource = self;
    
    _MGTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    _MGTableView.estimatedRowHeight = 0;
    _MGTableView.estimatedSectionHeaderHeight = 0;
    _MGTableView.estimatedSectionFooterHeight = 0;
    
    _MGTableView.backgroundColor = RGB(243.0, 243.0, 243.0, 1.0);
    
    [_MGTableView registerClass:[MGDTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    return _MGTableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _mutArrForGiftList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return GSDistance(140);
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MGDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = RGB(243.0, 243.0, 243.0, 1.0);
    if (_type == 2 || _type == 3) {
        [cell.MGDImgViewForBackGround setImage:[UIImage imageNamed:@"icon_as_hongbao_bg_hui"]];
    }
    if (_type == 2) {
        cell.MGDLabelForUseImmediately.text = @"已使用";
    }
    if (_type == 3) {
        cell.MGDLabelForUseImmediately.text = @"已过期";
    }
    if (_type == 1) {
        cell.MGDLabelForUseImmediately.text = @"立即使用";
    }
    if (indexPath.row < _mutArrForGiftList.count) {
        cell.model = _mutArrForGiftList[indexPath.row];
    }
    return cell;
}

@end
