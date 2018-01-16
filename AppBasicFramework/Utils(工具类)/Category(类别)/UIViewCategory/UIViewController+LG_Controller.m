//
//  UIViewController+LG_Controller.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2018/1/16.
//  Copyright © 2018年 IGS. All rights reserved.
//

#import "UIViewController+LG_Controller.h"

@implementation UIViewController (LG_Controller)

- (UIViewController *)viewController {
    UIResponder *responder = self;
    while (![responder isKindOfClass:[UIViewController class]]) {
        responder = [responder nextResponder];
        if (nil == responder) {
            break;
        }
    }
    return (UIViewController *)responder;
}

@end
