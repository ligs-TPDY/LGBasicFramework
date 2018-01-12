//
//  RootModel.m
//  AppBasicFramework
//
//  Created by IOS on 2017/7/17.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootModel.h"

@implementation RootModel

+(NSMutableArray *)dataStoredClass:(NSString *)className DataArr:(NSArray *)array;
{
    NSMutableArray *mutArr = [[NSMutableArray alloc]init];
    
    for (int i=0; i<array.count; i++) {
        
        NSDictionary *dic = array[i];
        
        NSMutableDictionary *mutDic = [[NSMutableDictionary alloc]initWithDictionary:dic];
        
        //将id转化为ID
        if ([mutDic objectForKey:@"id"])
        {
            NSString *str = mutDic[@"id"];
            [mutDic removeObjectForKey:@"id"];
            [mutDic setObject:str forKey:@"ID"];
        }
        
        Class cls = NSClassFromString(className);
        NSObject *model = [[cls alloc]init];
        [model setValuesForKeysWithDictionary:mutDic];
        
        [mutArr addObject:model];
    }
    
    return mutArr;
}

+(NSMutableArray *)dataStoredClass:(NSString *)className DataDic:(NSDictionary *)dic
{
    NSMutableArray *mutArr = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *mutDic = [[NSMutableDictionary alloc]initWithDictionary:dic];
    
    //将id转化为ID
    if ([mutDic objectForKey:@"id"])
    {
        NSString *str = mutDic[@"id"];
        [mutDic removeObjectForKey:@"id"];
        [mutDic setObject:str forKey:@"ID"];
    }
    
    Class cls = NSClassFromString(className);
    NSObject *model = [[cls alloc]init];
    [model setValuesForKeysWithDictionary:mutDic];
    [mutArr addObject:model];
    
    return mutArr;
}

//防止模型性质与字典key出现不匹配的情况
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
//防止模型性质与字典key出现不匹配的情况
-(id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

@end
