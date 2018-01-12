//
//  UITextField+LG_init.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LG_init)

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色.提示文字（默认请输入有关信息)
+ (UITextField *)initTextFieldWithFatherView:(UIView *)fatherView
                                        Size:(CGFloat)size
                                  TitalColor:(UIColor *)titalColor
                                 Placeholder:(NSString *)placeholder;

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认100）.提示文字（默认请输入有关信息）
+ (UITextField *)initTextFieldWithFatherView:(UIView *)fatherView
                                        Size:(CGFloat)size
                                  TitalColor:(UIColor *)titalColor
                                 Placeholder:(NSString *)placeholder
                                       Tital:(NSString *)Tital;

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认100）.提示文字（默认请输入有关信息）.字体名称（默认宏定义）
+ (UITextField *)initTextFieldWithFatherView:(UIView *)fatherView
                                        Size:(CGFloat)size
                                  TitalColor:(UIColor *)titalColor
                                       Tital:(NSString *)Tital
                                 Placeholder:(NSString *)placeholder
                                    FontName:(NSString *)fontName;
@end
