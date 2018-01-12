//
//  ClassicScrollDisplayBottomView.h
//  LCTProject
//
//  Created by 李广帅 on 2017/10/26.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ClassicScrollDisplayBottomView : UIView<UIScrollViewDelegate>

@property (nonatomic,copy,readonly) NSArray *arrayForText;
@property (nonatomic,strong,readonly) NSArray *arrayForclassName;
@property (nonatomic,copy,readonly) UIColor *colorForSelect;
@property (nonatomic,copy,readonly) UIColor *colorForNoSelect;
@property (nonatomic,strong) UIView *markView;
@property (nonatomic,strong) UIScrollView *bigScrollView;

- (instancetype)initWithTitleText:(NSArray *)arrayForText colorForSelect:(UIColor *)colorForSelect colorForNoSelect:(UIColor *)colorForNoSelect detailClass:(NSArray *)arrayForclassName;

@end
