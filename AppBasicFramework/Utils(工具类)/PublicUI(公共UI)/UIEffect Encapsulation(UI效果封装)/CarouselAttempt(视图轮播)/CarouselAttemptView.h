//
//  CarouselAttemptView.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/7.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RollingStyle){ // 滚动样式
    RollingStyleLocal, // 本地 根据图片名加载
    RollingStyleNetwork // 网络 根据URL下载
};

@interface CarouselAttemptView : UIView

/**
 frame:
 style:   滚动图样式 (RollingStyleLocal:本地 RollingStyleNetwork:网络)
 data:   数组 (样式为本地:传入图片名 网络:传入url数组)
 action: 点击图片的回调
 */
+ (instancetype)rollingViewWithFrame:(CGRect)frame RollingStyle:(RollingStyle)style Data:(NSArray *)data IntervalTime:(int)intervalTime action:(void(^)(NSInteger index))action;

///滑动结束时，拿到当前加载图片地址
@property (nonatomic,copy) backForUpperLevelWithString callback;
- (void)setCallback:(backForUpperLevelWithString)callback;

@end
