//
//  ScrollHeadView.h
//  customScrollView
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackToController)();

@interface ScrollHeadView : UIView

- (instancetype)initWithFrame:(CGRect)frame AndMUTARR:(NSMutableArray *)mutArr AndDifference:(CGFloat )count;

-(void)setBackToController:(BackToController )callBack;

@end
