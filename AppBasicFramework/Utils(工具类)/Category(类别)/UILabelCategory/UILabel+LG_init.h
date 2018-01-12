//
//  UILabel+LG_init.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/6.
//  Copyright © 2017年 IGS. All rights reserved.


#import <UIKit/UIKit.h>

@interface UILabel (LG_init)

///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认写字板)
+ (UILabel *)initForLabelWithFatherView:(UIView *)fatherView
                                   Size:(CGFloat)size
                                  Color:(UIColor *)color
                                  Tital:(NSString *)tital;
///创建对象到父视图（必填），确定文字大小（必填）.文字颜色（默认黑色）.文字内容（默认写字板）.字体名称（默认宏定义）
+ (UILabel *)initForLabelWithFatherView:(UIView *)fatherView
                                   Size:(CGFloat)size
                                  Color:(UIColor *)color
                                  Tital:(NSString *)tital
                               FontName:(NSString *)fontName;
@end
