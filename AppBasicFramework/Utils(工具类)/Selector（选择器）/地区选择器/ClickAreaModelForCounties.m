//
//  ClickAreaModelForCounties.m
//  ZDTQProject
//
//  Created by 李广帅 on 16/7/25.
//  Copyright © 2016年 李广帅. All rights reserved.
//

#import "ClickAreaModelForCounties.h"

@implementation ClickAreaModelForCounties

//利用类方法赋值
+(ClickAreaModelForCounties *)clickAreaModelForCounties:(NSDictionary *)dic;
{
    ClickAreaModelForCounties *model = [[ClickAreaModelForCounties alloc]init];
    
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
