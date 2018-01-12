//
//  UIView+LG_init.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LG_init)

///创建对象到父视图
+ (UIView *)initViewWithFatherView:(UIView *)fatherView;

///创建对象到父视图,同时设置背景颜色(默认橙色)
+ (UIView *)initViewWithFatherView:(UIView *)fatherView
                   backgroundColor:(UIColor *)color;

@end
