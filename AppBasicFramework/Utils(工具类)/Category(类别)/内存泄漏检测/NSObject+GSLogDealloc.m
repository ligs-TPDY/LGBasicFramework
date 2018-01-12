//
//  NSObject+GSLogDealloc.m
//  AppBasicFramework
//
//  Created by IOS on 2017/8/4.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "NSObject+GSLogDealloc.h"
#import <objc/runtime.h>

@interface logDealloc : NSObject

@property (nonatomic,copy) NSString *message;

@end

@implementation logDealloc

- (void)dealloc
{
    GLogInfo(@"dealloc:%@",self.message);
}

@end

static char __logDeallocAssociatdeKey__;

@implementation NSObject (GSLogDealloc)

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
    if (objc_getAssociatedObject(self, &__logDeallocAssociatdeKey__) == nil) {
        logDealloc *log = [[logDealloc alloc]init];
        log.message = NSStringFromClass(self.class);
        objc_setAssociatedObject(self, &__logDeallocAssociatdeKey__, log, OBJC_ASSOCIATION_RETAIN);
    }
}

@end



