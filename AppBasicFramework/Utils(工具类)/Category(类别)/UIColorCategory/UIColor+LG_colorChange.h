//
//  UIColor+LG_colorChange.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/7.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LG_colorChange)

/// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *)colorWithHexString: (NSString *)color;

@end
