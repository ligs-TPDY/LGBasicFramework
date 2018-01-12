//
//  文档.m
//  App基础框架
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 BasicFrameworkFromIGS. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 iOS5及其以后提供了一个比较强大的工具UIAppearance，我们通过UIAppearance设置一些UI的全局效果，这样就可以很方便的实现UI的自定义效果又能最简单的实现统一界面风格，它提供如下两个方法。
 + (id)appearance
 这个方法是统一全部改，比如你设置UINavBar的tintColor，你可以这样写：[[UINavigationBar appearance] setTintColor:myColor];
 
 + (id)appearanceWhenContainedIn:(Class <>)ContainerClass,...
 这个方法可设置某个类的改变：例如：设置UIBarButtonItem 在UINavigationBar、UIPopoverController、UITabbar中的效果。就可以这样写
 [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], [UIPopoverController class],[UITabbar class] nil] setTintColor:myPopoverNavBarColor];
 
 请注意＊使用appearance设置UI效果最好采用全局的设置，在所有界面初始化前开始设置，否则可能失效。
 */
