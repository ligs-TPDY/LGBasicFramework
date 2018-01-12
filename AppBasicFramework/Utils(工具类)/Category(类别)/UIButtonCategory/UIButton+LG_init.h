//
//  UIButton+LG_init.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LG_init)

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认按钮）
+ (UIButton *)initButtonWithFatherView:(UIView *)fatherView
                                  Size:(CGFloat)size
                            TitleColor:(UIColor *)color
                                 Title:(NSString *)title;

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认按钮）.背景颜色（默认蓝色）
+ (UIButton *)initButtonWithFatherView:(UIView *)fatherView
                                  Size:(CGFloat)size
                            TitleColor:(UIColor *)color
                                 Title:(NSString *)title
                       backgroundColor:(UIColor *)bgcolor;

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认按钮）.背景颜色（默认蓝色）.字体名称（默认宏定义）
+ (UIButton *)initButtonWithFatherView:(UIView *)fatherView
                                  Size:(CGFloat)size
                            TitleColor:(UIColor *)color
                                 Title:(NSString *)title
                       backgroundColor:(UIColor *)bgcolor
                              FontName:(NSString *)fontName;
@end
