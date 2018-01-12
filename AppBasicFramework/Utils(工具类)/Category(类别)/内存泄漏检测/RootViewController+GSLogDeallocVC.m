//
//  UIViewController+GSLogDeallocVC.m
//  AppBasicFramework
//
//  Created by IOS on 2017/8/4.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootViewController+GSLogDeallocVC.h"

#import <objc/runtime.h>

@interface logDeallocVC : RootViewController

@property (nonatomic,copy) NSString *message;

@end

@implementation logDeallocVC

- (void)dealloc
{
    //对象消失时，打印对象的名字
    GLogInfo(@"dealloc:%@",self.message);
}

@end

//标记关联对象的关键字
static char __logDeallocAssociatedKey__;

@implementation RootViewController (GSLogDeallocVC)

+ (void)load
{
    SEL orignsel  = @selector(logOnDealloc);
    SEL exchgesel = @selector(viewDidLoad);
    
    Method originalM  = class_getInstanceMethod([self class], orignsel);
    Method exchangeM  = class_getInstanceMethod([self class], exchgesel);
    
    BOOL didAddMethod = class_addMethod([self class], orignsel, method_getImplementation(exchangeM), method_getTypeEncoding(exchangeM));
    if (didAddMethod){
        class_replaceMethod([self class], exchgesel, method_getImplementation(originalM), method_getTypeEncoding(originalM));
    }else{
        method_exchangeImplementations(originalM, exchangeM);
    }
}

- (void)logOnDealloc
{
    //得到关联对象
    if (objc_getAssociatedObject(self, &__logDeallocAssociatedKey__) == nil) {
        logDeallocVC *log = [[logDeallocVC alloc]init];
        log.message = NSStringFromClass(self.class);
        //设置关联对象
        objc_setAssociatedObject(self, &__logDeallocAssociatedKey__, log, OBJC_ASSOCIATION_RETAIN);
    }
    
    [self logOnDealloc];
}

@end


