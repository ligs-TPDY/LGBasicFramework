//
//  RootViewController+LG_Navigation.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/12.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootViewController+LG_Navigation.h"

@implementation RootViewController (LG_Navigation)

#pragma mark --统一表头设置(navigationController)--
- (void)setUpTital
{
    
}
///设置导航控制器的背景颜色(默认白色)，标题颜色（默认黑色），标题（默认标题），字体大小（0==19）
- (void)setForNavWithbackgroundColor:(UIColor *)backgroundColor
                          TitleColor:(UIColor *)TitleColor
                               Title:(NSString *)title
                           TitleSize:(int)size;
{
    if (backgroundColor != nil) {
        self.navigationController.navigationBar.barTintColor = backgroundColor;
    }else{
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    }
    
    if (title != nil) {
        self.navigationItem.title = title;
    }else{
        self.navigationItem.title = @"标题";
    }
    
    if (TitleColor != nil && size != 0) {
        [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName : TitleColor,NSFontAttributeName:[UIFont systemFontOfSize:size]}];
    }else if (TitleColor == nil && size != 0){
        [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:size]}];
    }else if (TitleColor != nil && size == 0){
        [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName : TitleColor,NSFontAttributeName:[UIFont systemFontOfSize:19]}];
    }else{
        [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:19]}];
    }
}
///设置导航控制器的返回样式字体颜色（默认黑色），文字内容（默认为空)
- (void)setForNavWithBackTextColor:(UIColor *)backTextColor
                          BackText:(NSString *)backText
{
    UIBarButtonItem *leftBarItemTitle = nil;
    if (backText != nil) {
        leftBarItemTitle = [[UIBarButtonItem alloc] initWithTitle:backText
                                                            style:UIBarButtonItemStylePlain
                                                           target:nil
                                                           action:nil];
    }else{
        leftBarItemTitle = [[UIBarButtonItem alloc] initWithTitle:@""
                                                            style:UIBarButtonItemStylePlain
                                                           target:nil
                                                           action:nil];
    }
    if (backTextColor != nil) {
        leftBarItemTitle.tintColor = backTextColor;
    }else{
        leftBarItemTitle.tintColor = [UIColor blackColor];
    }
    
    self.navigationItem.backBarButtonItem = leftBarItemTitle;
}

@end
