//
//  UIView+LG_BackgroundGradients.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/26.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LG_BackgroundGradients)
///背景渐变，渐变背景图，渐变区域，渐变颜色数组
+ (void)BackgroundGradientsWithFatherView:(UIView *)fatherView
                                    Frame:(CGRect)rect
                           ArrayForColors:(NSArray *)arrayForColors;
@end
