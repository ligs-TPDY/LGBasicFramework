//
//  UILabel+LG_init.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "UILabel+LG_init.h"

@implementation UILabel (LG_init)

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认写字板）.字体名称（默认宏定义）
+ (UILabel *)initForLabelWithFatherView:(UIView *)fatherView
                                   Size:(CGFloat)size
                                  Color:(UIColor *)color
                                  Tital:(NSString *)tital
{
    UILabel *label = [UILabel initForLabelWithFatherView:fatherView Size:size
                                                   Color:color Tital:tital FontName:nil];
    
    return label;
}
///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认写字板）.字体名称（默认宏定义）
+ (UILabel *)initForLabelWithFatherView:(UIView *)fatherView
                                   Size:(CGFloat)size
                                  Color:(UIColor *)color
                                  Tital:(NSString *)tital
                               FontName:(NSString *)fontName;
{
    UILabel *label = [[UILabel alloc]init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [fatherView addSubview:label];
    
    if (color == nil) {
        label.textColor = [UIColor blackColor];
    }else{
        label.textColor = color;
    }
    
    if (tital == nil) {
        label.text = @"写字板";
    }else{
        label.text = tital;
    }
    
    [UILabel setForLabelWithDiffScr:label Size:size FontName:fontName];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}
+ (void)setForLabelWithDiffScr:(UILabel *)label Size:(CGFloat)size FontName:(NSString *)fontName;
{
    if (GScreenWidth == 414){
        label.font = [UILabel setForLabelWithFontNameWithSize:size+3 FontName:fontName];
    }
    if (GScreenWidth == 375){
        label.font = [UILabel setForLabelWithFontNameWithSize:size+2 FontName:fontName];
    }
    if (GScreenWidth == 320){
        label.font = [UILabel setForLabelWithFontNameWithSize:size FontName:fontName];
    }
}
+ (UIFont *)setForLabelWithFontNameWithSize:(CGFloat)size FontName:(NSString *)fontName;
{
    if (fontName == nil) {
        return [UIFont fontWithName:LG_FONT size:size];
    }else{
        return [UIFont fontWithName:fontName size:size];
    }
}

@end
