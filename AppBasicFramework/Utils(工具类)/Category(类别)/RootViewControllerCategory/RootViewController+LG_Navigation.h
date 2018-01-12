//
//  RootViewController+LG_Navigation.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/12.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController (LG_Navigation)
#pragma mark --导航控制器的相关设置--
///设置导航中间按钮
- (void)setUpTital;

///设置导航控制器的背景颜色(默认白色)，标题颜色（默认黑色），标题（默认标题），字体大小（0==19）
- (void)setForNavWithbackgroundColor:(UIColor *)backgroundColor
                          TitleColor:(UIColor *)TitleColor
                               Title:(NSString *)title
                           TitleSize:(int)size;

///设置导航控制器的返回样式字体颜色（默认黑色），文字内容（默认为空）
- (void)setForNavWithBackTextColor:(UIColor *)backTextColor
                          BackText:(NSString *)backText;

@end
