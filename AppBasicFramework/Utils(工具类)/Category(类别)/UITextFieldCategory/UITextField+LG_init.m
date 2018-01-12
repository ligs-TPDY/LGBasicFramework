//
//  UITextField+LG_init.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "UITextField+LG_init.h"

@implementation UITextField (LG_init)

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认显示提示文字）.提示文字（默认请输入有关信息）.字体名称（默认宏定义）
+ (UITextField *)initTextFieldWithFatherView:(UIView *)fatherView
                                        Size:(CGFloat)size
                                  TitalColor:(UIColor *)titalColor
                                       Tital:(NSString *)Tital
                                 Placeholder:(NSString *)placeholder
                                    FontName:(NSString *)fontName;
{
    UITextField *text = [UITextField initTextFieldWithFatherView:fatherView Size:size TitalColor:titalColor Placeholder:placeholder Tital:Tital];
    
    if (fontName != nil) {
        if (GScreenWidth == 414)
        {
            text.font = [UIFont fontWithName:fontName size:size + 3];
        }
        if (GScreenWidth == 375)
        {
            text.font = [UIFont fontWithName:fontName size:size + 2];
        }
        if (GScreenWidth == 320)
        {
            text.font = [UIFont fontWithName:fontName size:size];
        }
    }
    
    return text;
}
///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认100）.提示文字（默认请输入有关信息）
+ (UITextField *)initTextFieldWithFatherView:(UIView *)fatherView
                                        Size:(CGFloat)size
                                  TitalColor:(UIColor *)titalColor
                                 Placeholder:(NSString *)placeholder
                                       Tital:(NSString *)Tital
{
    UITextField *text = [UITextField initTextFieldWithFatherView:fatherView Size:size TitalColor:titalColor Placeholder:placeholder];
    
    if (Tital != nil) {
        text.text = Tital;
    }
    
    return text;
}
///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色.提示文字（默认请输入有关信息)
+ (UITextField *)initTextFieldWithFatherView:(UIView *)fatherView
                                        Size:(CGFloat)size
                                  TitalColor:(UIColor *)titalColor
                                 Placeholder:(NSString *)placeholder
{
    UITextField *text = [[UITextField alloc]init];
    text.translatesAutoresizingMaskIntoConstraints = NO;
    [fatherView addSubview:text];
    
    [UITextField setForTextFieldWithDiffScr:text Size:size];
    
    if (titalColor == nil) {
        text.textColor = [UIColor blackColor];
    }else{
        text.textColor = titalColor;
    }
    
    if (placeholder == nil) {
        text.placeholder = @"请输入有关信息";
    }else{
        text.placeholder = placeholder;
    }
    
    return text;
}
///字体大小的屏幕适配
+ (void)setForTextFieldWithDiffScr:(UITextField *)textField Size:(CGFloat)size
{
    if (GScreenWidth == 414)
    {
        textField.font = [UITextField setForTextFieldWithFontNameWithSize:size + 3];
    }
    if (GScreenWidth == 375)
    {
        textField.font = [UITextField setForTextFieldWithFontNameWithSize:size + 2];
    }
    if (GScreenWidth == 320)
    {
        textField.font = [UITextField setForTextFieldWithFontNameWithSize:size];
    }
}
///设置字体格式和大小
+ (UIFont *)setForTextFieldWithFontNameWithSize:(CGFloat)size
{
    return [UIFont fontWithName:LG_FONT size:size];
}

@end
