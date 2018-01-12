//
//  IconSortingView.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/22.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^backToMainViewWithTag)(int tag);

@interface IconSortingView : UIView
/**
    section:行数
    number:列数
    height:整体高度
    IconArr:图标名字
    titleArr:文字说明
 */
- (instancetype)initWithNumber:(int)number
                        Height:(CGFloat)height
                          Icon:(NSArray *)iconArr
                         Title:(NSArray *)titleArr;

- (void)setBackToMainViewWithTag:(backToMainViewWithTag)back;

@end
