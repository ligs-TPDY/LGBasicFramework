//
//  UIImageView+LG_init.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "UIImageView+LG_init.h"

@implementation UIImageView (LG_init)
///创建对象到父视图
+ (UIImageView *)initImageViewWithFatherView:(UIView *)fatherView;
{
    UIImageView *imgview = [[UIImageView alloc]init];
    imgview.translatesAutoresizingMaskIntoConstraints = NO;
    [fatherView addSubview:imgview];
    
    return imgview;
}
///创建对象到父视图.背景颜色（默认为橙色）
+ (UIImageView *)initImageViewWithFatherView:(UIView *)fatherView
                             backgroundColor:(UIColor *)color;
{
    UIImageView *imgview = [UIImageView initImageViewWithFatherView:fatherView];
    
    if (color == nil) {
        imgview.backgroundColor = [UIColor orangeColor];
    }else{
        imgview.backgroundColor = color;
    }
    
    return imgview;
}
@end
