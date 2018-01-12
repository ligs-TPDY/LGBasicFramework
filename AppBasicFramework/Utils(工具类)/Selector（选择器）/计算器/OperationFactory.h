//
//  Operation.h
//  Calculator
//
//  Created by lanou3g on 15/4/25.
//  Copyright (c) 2015年 张永涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Opration.h"

@interface OperationFactory : NSObject
//简单工厂模式，对象由工厂创建，需要谁就创建谁

+(id)creatOpration:(char)operate;

@end
