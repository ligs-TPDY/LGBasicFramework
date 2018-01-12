//
//  ClickAreaModelForCity.m
//  ZDTQProject
//
//  Created by 李广帅 on 16/7/25.
//  Copyright © 2016年 李广帅. All rights reserved.
//

#import "ClickAreaModelForCity.h"

@implementation ClickAreaModelForCity

//利用类方法赋值
+(ClickAreaModelForCity *)clickAreaModelForCity:(NSDictionary *)dic
{
    ClickAreaModelForCity *model = [[ClickAreaModelForCity alloc]init];
    
    if ([dic objectForKey:@"DivisionName"])
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
    return [NSString stringWithFormat:@"DivisionName%@",_DivisionName];
}

@end
