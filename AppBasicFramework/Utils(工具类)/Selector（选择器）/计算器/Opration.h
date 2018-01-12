//
//  Opraton.h
//  Calculator
//
//  Created by lanou3g on 15/4/25.
//  Copyright (c) 2015年 张永涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Opration : NSObject
//多态：有一个计算类是父类，子类有加减乘除，创建的时候是父类对象，具体的操作用子类创建。创建的时候用工厂
@property (nonatomic,assign)double number1;
@property (nonatomic,assign)double number2;


-(id)initWithNum1:(double)num1 Num2:(double)num2;

-(NSString*)getResult;

@end
//子类，这里用代码在一个类里面创建的
@interface OprationAdd : Opration
@end

@interface OprationSub : Opration
@end

@interface OprationMul : Opration
@end

@interface OprationDiv : Opration
@end

