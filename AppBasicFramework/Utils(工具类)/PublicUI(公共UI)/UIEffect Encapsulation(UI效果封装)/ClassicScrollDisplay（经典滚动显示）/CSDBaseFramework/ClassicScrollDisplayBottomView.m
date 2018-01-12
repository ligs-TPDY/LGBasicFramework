//
//  ClassicScrollDisplayBottomView.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/26.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "ClassicScrollDisplayBottomView.h"
#import "MyGiftCertificateDetailedView.h"
static int widthForLabel;
static int count;

static const int heightForLabel = 35;

@implementation ClassicScrollDisplayBottomView

- (instancetype)initWithTitleText:(NSArray *)arrayForText colorForSelect:(UIColor *)colorForSelect colorForNoSelect:(UIColor *)colorForNoSelect detailClass:(NSArray *)arrayForclassName;
{
    self = [super init];
    if (self) {
        
        _arrayForText = arrayForText;
        _colorForSelect = colorForSelect;
        _colorForNoSelect = colorForNoSelect;
        _arrayForclassName = arrayForclassName;
        
        count = (int)_arrayForText.count;
        
        widthForLabel = GScreenWidth/count;
        
        [self createLabelForTitle];
        
        [self markView];
        
        [self bigScrollView];
        
    }
    return self;
}
#pragma mark - ---创建分类文字---
- (void)createLabelForTitle
{
    for (int i = 0; i < count; i++) {
        UILabel *label = [UILabel initForLabelWithFatherView:self Size:15 Color:RGB(53.0, 53.0, 53.0, 1.0) Tital:@"00"];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.width.mas_equalTo(widthForLabel);
            make.left.mas_equalTo(self).offset(i * widthForLabel);
            make.height.mas_equalTo(GSDistance(heightForLabel));
        }];
        label.tag = 700 + i;
        label.text = _arrayForText[i];
        label.textAlignment = NSTextAlignmentCenter;
        if (i == 0) {
            label.textColor = _colorForSelect;
        }else{
            label.textColor = _colorForNoSelect;
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cliclForLabel:)];
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:tap];
    }
}
#pragma mark - ---创建标记条模块---
- (UIView *)markView
{
    if (_markView != nil) {
        return _markView;
    }
    
    _markView = [[UIView alloc]init];
    _markView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_markView];
    [_markView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(heightForLabel);
        make.left.mas_equalTo(self);
        make.height.mas_equalTo(2);
        make.width.mas_equalTo(widthForLabel);
    }];
    _markView.backgroundColor = _colorForSelect;
    _markView.layer.cornerRadius = 2.0;
    [_markView.layer setMasksToBounds:YES];
    
    return _markView;
}
#pragma mark - ---创建显示模块---
- (UIScrollView *)bigScrollView
{
    if (_bigScrollView != nil) {
        return _bigScrollView;
    }
    
    _bigScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, heightForLabel + 2, GScreenWidth, GScreenHeight-heightForLabel-2)];
    _bigScrollView.contentOffset = CGPointMake(0, heightForLabel + 2);
    _bigScrollView.contentSize = CGSizeMake(GScreenWidth * count, GScreenHeight-heightForLabel-2);
    [self addSubview:_bigScrollView];
    
    _bigScrollView.pagingEnabled = YES;
    _bigScrollView.delegate = self;
    _bigScrollView.backgroundColor = [UIColor whiteColor];

    for (int i=0; i<count; i++) {
        MyGiftCertificateDetailedView *view = _arrayForclassName[i];
        view.frame = CGRectMake(GScreenWidth * i,0 , GScreenWidth, GScreenHeight-heightForLabel-2);
        [_bigScrollView addSubview:view];
    }
    
    return _bigScrollView;
}
#pragma mark - ---动画---
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_markView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scrollView.contentOffset.x/3);
    }];
    
    CGFloat tag = scrollView.contentOffset.x/GScreenWidth + 700;
    [self selectLabel:tag];
}
- (void)cliclForLabel:(UITapGestureRecognizer *)tap
{
    [self selectLabel:tap.view.tag];
    
    [UIView animateWithDuration:0.3 animations:^{
        _bigScrollView.contentOffset = CGPointMake(GScreenWidth * (tap.view.tag - 700), 0);
    }];
}
- (void)selectLabel:(CGFloat)tag
{
    for (int i = 0;i < count ; i++) {
        UILabel *label = [self viewWithTag:700+i];
        label.textColor = _colorForNoSelect;
    };
    
    UILabel *label = [self viewWithTag:tag];
    label.textColor = _colorForSelect;
}
@end
