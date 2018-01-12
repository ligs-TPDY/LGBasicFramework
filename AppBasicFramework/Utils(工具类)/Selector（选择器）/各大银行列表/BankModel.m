//
//  BankModel.m
//  HuaRJProject
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "BankModel.h"

@implementation BankModel

//类方法创建对象并赋值
+(BankModel *)clickAllClassificationLeftToModel:(NSDictionary *)dic;
{
    BankModel *model = [[BankModel alloc]init];
    
    if ([dic objectForKey:@"BankName"])
    {
        [model setValuesForKeysWithDictionary:dic];
    }
    
    return model;
}
//防止模型性质与字典key出现不匹配的情况
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
-(id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"BankName=%@", _BankName];
}

@end
