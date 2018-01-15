//
//  ColorMactos.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/22.
//  Copyright © 2017年 IGS. All rights reserved.
//

#ifndef ColorMactos_h
#define ColorMactos_h

/** 十进制颜色*/
#define RGB(r,g,b,a)                [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
/** rgb颜色转换（16进制->10进制）*/
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

///0xF4BF1B,RGB(244,191,27)
#define ColorF4BF1B         UIColorFromRGB(0xF4BF1B)



#endif /* ColorMactos_h */
