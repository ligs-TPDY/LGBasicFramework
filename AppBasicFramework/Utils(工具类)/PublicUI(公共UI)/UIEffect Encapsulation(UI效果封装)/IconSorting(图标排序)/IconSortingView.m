//
//  IconSortingView.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/22.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "IconSortingView.h"

@interface IconSortingView ()
@property (nonatomic,copy)backToMainViewWithTag back;
@end

@implementation IconSortingView
- (void)setBackToMainViewWithTag:(backToMainViewWithTag)back
{
    _back = back;
}
- (instancetype)initWithNumber:(int)number Height:(CGFloat)heightFlt Icon:(NSArray *)iconArr Title:(NSArray *)titleArr
{
    self = [super init];
    if (self) {
        
        [self createUIWithNumber:number Height:heightFlt Icon:iconArr Title:titleArr];
    }
    return self;
}
- (void)createUIWithNumber:(int)number Height:(CGFloat)height Icon:(NSArray *)iconArr Title:(NSArray *)titleArr
{
    CGFloat ScreenWidth = GScreenWidth;
    CGFloat widthForImgLab = ScreenWidth/number;
    CGFloat heightForImgLab = height;
    
    UILabel *beforeLab = nil;
    UIImageView *beforeImg = nil;
    for (int i=0; i<iconArr.count; i++){
        /** 确定第一个的位置*/
        if (i==0){
            UIImageView *img = [self createImg];
            [img mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self);
                make.top.mas_equalTo(self);
                make.width.mas_equalTo(widthForImgLab);
                make.height.mas_equalTo(heightForImgLab*3/4);
            }];
            [img setImage:[UIImage imageNamed:iconArr[i]]];
            img.tag = 10000 + i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callBack:)];
            [img addGestureRecognizer:tap];
            beforeImg = img;
            
            UILabel *label = [self createLabel];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(img.mas_bottom);
                make.centerX.mas_equalTo(img.mas_centerX);
                make.height.mas_equalTo(heightForImgLab/4);
            }];
            label.text = titleArr[i];
            label.tag = 20000 + i;
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callBack:)];
            [label addGestureRecognizer:tap1];
            beforeLab = label;
        }else{
            /** 确定要不要换行*/
            BOOL equal = NO;
            for (int j=1; j<10; j++){
                if (i == number * j) {
                    equal = YES;
                    break;
                }else{
                    equal = NO;
                }
            }
            if (equal){
                /** 第二行起，每一行的第一个*/
                UIImageView *img = [self createImg];
                [img mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(self);
                    make.top.mas_equalTo(beforeLab.mas_bottom);
                    make.width.mas_equalTo(beforeImg);
                    make.height.mas_equalTo(beforeImg);
                }];
                [img setImage:[UIImage imageNamed:iconArr[i]]];
                img.tag = 10000 + i;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callBack:)];
                [img addGestureRecognizer:tap];
                beforeImg = img;
                UILabel *label = [self createLabel];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(img.mas_bottom);
                    make.centerX.mas_equalTo(img);
                    make.height.mas_equalTo(beforeLab);
                }];
                label.text = titleArr[i];
                label.tag = 20000 + i;
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callBack:)];
                [label addGestureRecognizer:tap1];
                beforeLab = label;
            }else{
                /** 每一行第二个及其以后*/
                UIImageView *img = [self createImg];
                [img mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(beforeImg.mas_right);
                    make.top.bottom.mas_equalTo(beforeImg);
                    make.width.mas_equalTo(beforeImg);
                }];
                [img setImage:[UIImage imageNamed:iconArr[i]]];
                img.tag = 10000 + i;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callBack:)];
                [img addGestureRecognizer:tap];
                beforeImg = img;
                UILabel *label = [self createLabel];
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(img.mas_bottom);
                    make.centerX.mas_equalTo(img);
                    make.height.mas_equalTo(beforeLab);
                }];
                label.text = titleArr[i];
                label.tag = 20000 + i;
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callBack:)];
                [label addGestureRecognizer:tap1];
                beforeLab = label;
            }
        }
    }
}
- (void)callBack:(UITapGestureRecognizer *)tap
{
    int tag = (int)tap.view.tag;
    if (_back)
    {
        _back(tag);
    }
}
- (UILabel *)createLabel
{
    UILabel *label = [[UILabel alloc]init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:label];
    
    CGFloat width = GScreenWidth;
    if (width == 414)
    {
        label.font = [UIFont systemFontOfSize:15];
    }
    if (width == 375)
    {
        label.font = [UIFont systemFontOfSize:13];
    }
    if (width == 320)
    {
        label.font = [UIFont systemFontOfSize:12];
    }
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.userInteractionEnabled = YES;
    
    return label;
}
- (UIImageView *)createImg
{
    UIImageView *img = [[UIImageView alloc]init];
    img.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:img];
    
    img.contentMode = UIViewContentModeCenter;
    
    img.userInteractionEnabled = YES;
    
    return img;
}
@end
