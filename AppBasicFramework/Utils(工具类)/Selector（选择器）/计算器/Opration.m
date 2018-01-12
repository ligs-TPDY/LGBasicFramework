//
//  Opraton.m
//  Calculator
//
//  Created by lanou3g on 15/4/25.
//  Copyright (c) 2015年 张永涛. All rights reserved.
//

#import "Opration.h"

@implementation Opration
//初始化两个数字
-(id)initWithNum1:(double)num1 Num2:(double)num2
{
    if ([super init]) {
        self.number1=num1;
        self.number2=num2;
    }
    return self;
}
//父类的运算
-(NSString*)getResult
{
    double result=0;
    NSString *str=[NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

//下面全是子类，重写的父类的运算方法
@implementation OprationAdd
-(NSString*)getResult
{
    double result=0;
    result= self.number1+self.number2;
    NSString *str=[NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OprationSub
-(NSString*)getResult
{
    double result=0;
    result= self.number1-self.number2;
    NSString *str=[NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OprationMul
-(NSString*)getResult
{
    double result=0;
    result= self.number1*self.number2;
    NSString *str=[NSString stringWithFormat:@"%lf",result];
    return str;
}
@end

@implementation OprationDiv
-(NSString*)getResult
{
    double result=0;
    NSString *str;
    if (self.number2==0) {
        str=[NSString stringWithFormat:@"错误"];
    }else{
        result= self.number1/self.number2;
        str=[NSString stringWithFormat:@"%lf",result];
    }
    return str;
    
}
@end
