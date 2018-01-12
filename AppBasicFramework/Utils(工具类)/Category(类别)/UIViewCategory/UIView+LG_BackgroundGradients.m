//
//  UIView+LG_BackgroundGradients.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/26.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "UIView+LG_BackgroundGradients.h"

@implementation UIView (LG_BackgroundGradients)
+ (void)BackgroundGradientsWithFatherView:(UIView *)fatherView
                                    Frame:(CGRect)rect
                           ArrayForColors:(NSArray *)arrayForColors;
{
    //实现背景渐变
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = rect;
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [fatherView.layer addSublayer:gradientLayer];
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    //设置颜色数组
    //    gradientLayer.colors = @[(__bridge id)RGB(57, 212, 236, 1.0).CGColor,
    //                             (__bridge id)RGB(36, 129, 215, 1.0).CGColor];
    gradientLayer.colors = arrayForColors;
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = @[@(0.3f), @(1.0f)];
}
@end
