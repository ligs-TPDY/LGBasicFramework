//
//  UIImageView+LG_init.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LG_init)
///创建对象到父视图
+ (UIImageView *)initImageViewWithFatherView:(UIView *)fatherView;

///创建对象到父视图.背景颜色（默认为橙色）
+ (UIImageView *)initImageViewWithFatherView:(UIView *)fatherView
                             backgroundColor:(UIColor *)color;

@end
