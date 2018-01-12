//
//  UIView+LG_init.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "UIView+LG_init.h"

@implementation UIView (LG_init)
///创建对象到父视图,同时设置背景颜色(默认橙色)
+ (UIView *)initViewWithFatherView:(UIView *)fatherView
                   backgroundColor:(UIColor *)color
{
    UIView *view = [UIView initViewWithFatherView:fatherView];
    
    if (color == nil) {
        view.backgroundColor = [UIColor orangeColor];
    }else{
        view.backgroundColor = color;
    }
    
    return view;
}
///创建对象到父视图
+ (UIView *)initViewWithFatherView:(UIView *)fatherView
{
    UIView *view = [[UIView alloc]init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [fatherView addSubview:view];
    
    return view;
}

@end
