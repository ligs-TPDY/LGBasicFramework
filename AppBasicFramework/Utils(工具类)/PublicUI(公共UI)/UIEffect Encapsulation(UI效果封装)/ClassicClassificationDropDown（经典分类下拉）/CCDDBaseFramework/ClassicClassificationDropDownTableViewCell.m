//
//  ClassicClassificationDropDownTableViewCell.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/30.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "ClassicClassificationDropDownTableViewCell.h"

@implementation ClassicClassificationDropDownTableViewCell

//自定义tabelView的cell的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //初始化cell上的控件
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self createUI];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)createUI
{
    _CCLabelForTital = [UILabel initForLabelWithFatherView:self Size:15 Color:RGB(53.0, 53.0, 53.0, 1.0)Tital:@"00"];
    [_CCLabelForTital mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(GSDistance(20));
        make.top.bottom.mas_equalTo(self);
    }];
    _CCLabelForTital.text = @"默认字";
    
    _CCImgView = [self createImgView];
    [_CCImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self);
        make.top.bottom.mas_equalTo(self);
        make.width.mas_equalTo(GSDistance(45));
    }];
    [_CCImgView setImage:[UIImage imageNamed:@"icon_as_correct"]];
    _CCImgView.contentMode = UIViewContentModeCenter;
    _CCImgView.hidden = YES;
}
- (UIImageView *)createImgView
{
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:imgView];
    
    return imgView;
}
@end
