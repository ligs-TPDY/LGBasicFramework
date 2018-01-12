//
//  TransactionRecordView.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/27.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "TransactionRecordView.h"
#import "ClassicClassificationDropDownView.h"
#import "TransactionRecordTableViewCell.h"
@implementation TransactionRecordView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self TRTableView];
        
        ClassicClassificationDropDownView *CCDD = [ClassicClassificationDropDownView createSunViewOnFatherView:self];
        [CCDD setCallback:^(NSString *str) {
            if (_callback) {
                _callback(str);
            }
        }];
    }
    return self;
}
- (UITableView *)TRTableView
{
    _TRTableView = [[UITableView alloc]init];
    _TRTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_TRTableView];
    [_TRTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(GSDistance(35), 0, 0, 0));
    }];
    
    if (@available(iOS 11.0, *)){
        _TRTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    _TRTableView.delegate = self;
    _TRTableView.dataSource = self;
    
    _TRTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    _TRTableView.estimatedRowHeight = 0;
    _TRTableView.estimatedSectionHeaderHeight = 0;
    _TRTableView.estimatedSectionFooterHeight = 0;
    
    _TRTableView.backgroundColor = [UIColor whiteColor];
    
    [_TRTableView registerClass:[TransactionRecordTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    return _TRTableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return GSDistance(64.5);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TransactionRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return GSDistance(10);
}

@end
