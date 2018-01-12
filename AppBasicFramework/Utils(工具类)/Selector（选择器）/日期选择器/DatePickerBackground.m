//
//  DatePickerBackground.m
//  HuaRJProject
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "DatePickerBackground.h"
#import "DatePicker.h"
@interface DatePickerBackground ()

@property (nonatomic,strong)DatePicker *date;

@end

@implementation DatePickerBackground

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        CGFloat width = GScreenWidth;
        CGFloat heigthFor = width * 0.73;
        CGFloat widthFor = width * 0.70;
        
        _date = [[DatePicker alloc]init];
        _date.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_date];
        [_date mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(heigthFor);
            make.width.mas_equalTo(widthFor);
            make.centerX.mas_equalTo(self);
        }];
        
        _date.layer.cornerRadius = 8;
        _date.clipsToBounds = YES;
        //首先将其隐藏，点击后，将其隐藏状态取消
        _date.hidden = YES;
        _date.backgroundColor = [UIColor whiteColor];
        
        _date.layer.borderWidth = 1;
        _date.layer.borderColor = [[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:248.0/255.0 alpha:1.0]CGColor];
        
        //解决强引用问题
        __weak typeof(self) weakSelf = self;
        //回调，点击取消时，将背景VIew隐藏
        [_date setBackToCompleteLoginView:^{
            weakSelf.hidden = YES;
        }];
        
        self.backgroundColor = Color244c191c27;
 
    }
    return self;
}
- (void)DisplayDateSelection;
{
    _date.hidden = NO;
}
@end
