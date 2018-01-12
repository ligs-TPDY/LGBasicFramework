//
//  MGDTableViewCell.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/27.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "MGDTableViewCell.h"

@implementation MGDTableViewCell
- (void)setModel:(MGModel *)model
{
    _model = model;
    
    //投资红包,体验金券
    if (_model.type != nil) {
        _MGDLabelForTital.text = [NSString stringWithFormat:@"%@",_model.type];
//        if ([_model.type isEqualToString:@"加息券"]) {
//
//        }else{
//            _MGDLabelForMoney.text = [NSString stringWithFormat:@"%f%@",_model.amountValue,_model.amountUnit];
//        }
        _MGDLabelForMoney.text = [NSString stringWithFormat:@"%.lf%@",_model.amountValue,_model.amountUnit];
    }
    
    //起投金额
    if (_model.accountValue == 0) {
        _MGDLabelForInvestmentAmount.text = @"投资金额不限";
    }else{
        _MGDLabelForInvestmentAmount.text = [NSString stringWithFormat:@"投资%d%@元以上可用",_model.accountValue,_model.accountUnit];
    }
    //起投期限
    if (_model.minBidLimit == 0) {
        _MGDLabelForInvestmentLimit.text = @"限投期限不限";
    }else{
        _MGDLabelForInvestmentLimit.text = [NSString stringWithFormat:@"限投%d天以上",_model.minBidLimit];
    }
    //红包有效期
    NSArray *array = [_model.endTime componentsSeparatedByString:@" "];
    _MGDLabelForValidPeriod.text = [NSString stringWithFormat:@"有效期至%@",array[0]];
}
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
//    _MGDImgViewForBackGround = [self createImgView];
//    [_MGDImgViewForBackGround mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self).offset(GSDistance(10));
//        make.left.mas_equalTo(self).offset(GSDistance(12));
//        make.right.mas_equalTo(self).offset(GSDistance(-12));
//        make.bottom.mas_equalTo(self);
//    }];
//    _MGDImgViewForBackGround.backgroundColor = [UIColor whiteColor];
//    [_MGDImgViewForBackGround setImage:[UIImage imageNamed:@"icon_as_hongbao_bg"]];
//
//    _MGDLabelForTital = [UILabel initFatherView:self Size:12 Color:[UIColor whiteColor]];
//    [_MGDLabelForTital mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_MGDImgViewForBackGround).offset(GSDistance(25));
//        make.top.mas_equalTo(_MGDImgViewForBackGround).offset(GSDistance(35));
//        make.height.mas_equalTo(GSDistance(15));
//    }];
//    _MGDLabelForTital.text = @"投资红包(元)";
//    _MGDLabelForTital.textColor = [UIColor whiteColor];
//
//    _MGDLabelForMoney = [UILabel initFatherView:self Size:32 Color:[UIColor whiteColor]];
//    [_MGDLabelForMoney mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(_MGDLabelForTital);
//        make.top.mas_equalTo(_MGDLabelForTital.mas_bottom).offset(GSDistance(5));
//        make.bottom.mas_equalTo(_MGDImgViewForBackGround).offset(GSDistance(-25));
//    }];
//    _MGDLabelForMoney.text = @"200";
//
//
//    _MGDLabelForInvestmentLimit = [UILabel initFatherView:self Size:12 Color:RGB(53.0, 53.0, 53.0, 1.0)];
//    [_MGDLabelForInvestmentLimit mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(_MGDImgViewForBackGround);
//        make.left.mas_equalTo(_MGDImgViewForBackGround).offset(GSDistance(150));
//        make.height.mas_equalTo(GSDistance(30));
//    }];
//    _MGDLabelForInvestmentLimit.text = @"起投期限>3个月";
//
//    _MGDLabelForInvestmentAmount = [UILabel initFatherView:self Size:12 Color:RGB(53.0, 53.0, 53.0, 1.0)];
//    [_MGDLabelForInvestmentAmount mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_MGDLabelForInvestmentLimit);
//        make.bottom.mas_equalTo(_MGDLabelForInvestmentLimit.mas_top);
//        make.height.mas_equalTo(GSDistance(30));
//    }];
//    _MGDLabelForInvestmentAmount.text = @"起投金额>5000元";
//
//    _MGDLabelForValidPeriod = [UILabel initFatherView:self Size:12 Color:RGB(53.0, 53.0, 53.0, 1.0)];
//    [_MGDLabelForValidPeriod mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(_MGDLabelForInvestmentLimit);
//        make.top.mas_equalTo(_MGDLabelForInvestmentLimit.mas_bottom);
//        make.height.mas_equalTo(GSDistance(30));
//    }];
//    _MGDLabelForValidPeriod.text = @"有效期至2015-20-20";
//
//    _MGDLabelForUseImmediately = [UILabel initFatherView:self Size:12 Color:RGB(53.0, 53.0, 53.0, 1.0)];
//    [_MGDLabelForUseImmediately mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.mas_equalTo(_MGDImgViewForBackGround);
//        make.right.mas_equalTo(_MGDImgViewForBackGround).offset(GSDistance(-10));
//        make.width.mas_equalTo(GSDistance(20));
//    }];
//    _MGDLabelForUseImmediately.numberOfLines = 0;
//    _MGDLabelForUseImmediately.text = @"立即使用";
//
//}
//- (UIImageView *)createImgView
//{
//    UIImageView *imgView = [[UIImageView alloc]init];
//    imgView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addSubview:imgView];
//
//    return imgView;
//}

@end
