//
//  MethodsMactos.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/20.
//  Copyright © 2017年 IGS. All rights reserved.
//

#ifndef MethodsMactos_h
#define MethodsMactos_h

/** 创建单例*/
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

/** 创建定时器*/
#define CREATE_TIMER(method) \
\
[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(method) userInfo:nil repeats:YES];

/** 点击任意位置，结束软键盘输入*/
#define END_SOFTKEYBOARD_INPUT \
\
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {\
[self.view endEditing:YES];\
}

/** UILabel切圆角*/
#define UILABEL_CUT_ROUNDED(label) \
\
label.layer.cornerRadius = 10;\
label.layer.masksToBounds = YES;

/** 抖动动画*/
#define SHAKE_ANIMATION \
\
- (void)shakeAnimation:(UIView *)view{\
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];\
    CGFloat positionX = view.layer.position.x;\
    animation.values = @[@(positionX-10),@(positionX),@(positionX+10)];\
    animation.repeatCount = 100;\
    animation.duration = 0.07;\
    animation.autoreverses = YES;\
    [view.layer addAnimation:animation forKey:nil];\
}

/** 获取父视图*/
#define FATHER_VIEW \
\
- (UIViewController *)viewController\
{\
    for (UIView* next = [self superview]; next; next = next.superview)\
    {\
        UIResponder *nextResponder = [next nextResponder];\
        if ([nextResponder isKindOfClass:[UIViewController class]])\
        {\
            return (UIViewController *)nextResponder;\
        }\
    }\
    return nil;\
}




#endif /* MethodsMactos_h */
