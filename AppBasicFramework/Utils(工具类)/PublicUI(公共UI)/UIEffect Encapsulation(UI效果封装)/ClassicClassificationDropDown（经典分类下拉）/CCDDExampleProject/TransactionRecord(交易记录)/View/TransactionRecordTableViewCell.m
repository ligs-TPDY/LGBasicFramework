//
//  TransactionRecordTableViewCell.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/30.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "TransactionRecordTableViewCell.h"

@implementation TransactionRecordTableViewCell

//自定义tabelView的cell的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //初始化cell上的控件
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        [self createUI];
    }
    return self;
}
//- (void)createUI
//{
//    UIView *view = [[UIView alloc]init];
//    view.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self).offset(GSDistance(10));
//        make.right.mas_equalTo(self).offset(GSDistance(-10));
//        make.bottom.mas_equalTo(self);
//        make.height.mas_equalTo(1);
//    }];
//    view.backgroundColor = RGB(232.0, 232.0, 232.0, 1.0);
//    
//    _TRLabelForSource = [UILabel initFatherView:self Size:16 Color:RGB(51.0, 51.0, 51.0, 1.0)];
//    [_TRLabelForSource mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(view);
//        make.bottom.mas_equalTo(self.mas_centerY).offset(GSDistance(10));
//        make.top.mas_equalTo(self);
//    }];
//    _TRLabelForSource.text = @"默认字";
//    
//    _TRLabelForMoney =[UILabel initFatherView:self Size:16 Color:RGB(51.0, 51.0, 51.0, 1.0)];
//    [_TRLabelForMoney mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(view);
//        make.top.bottom.mas_equalTo(_TRLabelForSource);
//    }];
//    _TRLabelForMoney.text = @"默认字";
//    
//    _TRLabelForTime = [UILabel initFatherView:self Size:12 Color:RGB(169.0, 169.0, 169.0, 1.0)];
//    [_TRLabelForTime mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_TRLabelForSource);
//        make.top.mas_equalTo(_TRLabelForSource.mas_bottom).offset(GSDistance(-15));
//        make.bottom.mas_equalTo(self);
//    }];
//    _TRLabelForTime.text = @"2017-23-45 20:20";
//    
//    _TRLabelForBalance = [UILabel initFatherView:self Size:12 Color:RGB(169.0, 169.0, 169.0, 1.0)];
//    [_TRLabelForBalance mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(_TRLabelForMoney);
//        make.top.bottom.mas_equalTo(_TRLabelForTime);
//    }];
//    _TRLabelForBalance.text = @"默认字";
//}

@end
