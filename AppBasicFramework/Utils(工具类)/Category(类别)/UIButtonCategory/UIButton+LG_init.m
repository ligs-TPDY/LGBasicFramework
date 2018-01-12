//
//  UIButton+LG_init.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "UIButton+LG_init.h"

@implementation UIButton (LG_init)

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认按钮）.背景颜色（默认蓝色）.字体名称（默认宏定义）
+ (UIButton *)initButtonWithFatherView:(UIView *)fatherView
                                  Size:(CGFloat)size
                            TitleColor:(UIColor *)color
                                 Title:(NSString *)title
                       backgroundColor:(UIColor *)bgcolor
                              FontName:(NSString *)fontName;
{
    UIButton *button = [UIButton initButtonWithFatherView:fatherView Size:size TitleColor:color Title:title backgroundColor:bgcolor];
    
    if (fontName != nil) {
        [UIButton setForButtonWithDiffScr:button FontName:fontName Size:size];
    }
    
    return button;
}
///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认按钮）.背景颜色（默认蓝色）
+ (UIButton *)initButtonWithFatherView:(UIView *)fatherView
                                  Size:(CGFloat)size
                            TitleColor:(UIColor *)color
                                 Title:(NSString *)title
                       backgroundColor:(UIColor *)bgcolor
{
    UIButton *button = [UIButton initButtonWithFatherView:fatherView Size:size TitleColor:color Title:title];
    
    if (bgcolor == nil) {
        button.backgroundColor = [UIColor blueColor];
    }else{
        button.backgroundColor = bgcolor;
    }
    
    return button;
}
///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认按钮）
+ (UIButton *)initButtonWithFatherView:(UIView *)fatherView
                                  Size:(CGFloat)size
                            TitleColor:(UIColor *)color
                                 Title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [fatherView addSubview:button];
    
    [UIButton setForButtonWithDiffScr:button Size:size];
    
    if (color == nil) {
        [button setTintColor:[UIColor blackColor]];
    }else{
        [button setTintColor:color];
    }
    
    if (title == nil) {
        [button setTitle:@"按钮" forState:UIControlStateNormal];
    }else{
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    return button;
}

+ (void)setForButtonWithDiffScr:(UIButton *)button Size:(CGFloat)size;
{
    if (GScreenWidth == 414)
    {
        button.titleLabel.font = [UIButton setForButtonWithFontNameWithSize:size + 3];
    }
    if (GScreenWidth == 375)
    {
        button.titleLabel.font = [UIButton setForButtonWithFontNameWithSize:size + 2];
    }
    if (GScreenWidth == 320)
    {
        button.titleLabel.font = [UIButton setForButtonWithFontNameWithSize:size];
    }
}
+ (UIFont *)setForButtonWithFontNameWithSize:(CGFloat)size
{
    return [UIFont fontWithName:LG_FONT size:size];
}


+ (void)setForButtonWithDiffScr:(UIButton *)button FontName:(NSString *)fontName Size:(CGFloat)size;
{
    if (GScreenWidth == 414)
    {
        button.titleLabel.font = [UIButton setForButtonWithFontName:fontName WithSize:size + 3];
    }
    if (GScreenWidth == 375)
    {
        button.titleLabel.font = [UIButton setForButtonWithFontName:fontName WithSize:size + 2];
    }
    if (GScreenWidth == 320)
    {
        button.titleLabel.font = [UIButton setForButtonWithFontName:fontName WithSize:size];
    }
}
+ (UIFont *)setForButtonWithFontName:(NSString *)fontName WithSize:(CGFloat)size
{
    return [UIFont fontWithName:fontName size:size];
}

@end
