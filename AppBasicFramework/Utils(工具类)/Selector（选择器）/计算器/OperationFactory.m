//
//  Operation.m
//  Calculator
//
//  Created by lanou3g on 15/4/25.
//  Copyright (c) 2015年 张永涛. All rights reserved.
//

#import "OperationFactory.h"

@implementation OperationFactory

+(id)creatOpration:(char)operate
{
    Opration *oper;
    //根据参数的不同创建对象，这里的参数是输入的运算符
    //
    switch (operate) {
        case '+':
            oper=[[OprationAdd alloc]init];
            break;
        case '-':
            oper=[[OprationSub alloc]init];
            break;
        case '*':
            oper=[[OprationMul alloc]init];
            break;
        case '/':
            oper=[[OprationDiv alloc]init];
            break;
        default:
            break;
    }
    return oper;
}
@end
