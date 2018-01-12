//
//  RootModel.h
//  AppBasicFramework
//
//  Created by IOS on 2017/7/17.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootModel : NSObject

//利用类方法赋值(数据源=数组)
+(NSMutableArray *)dataStoredClass:(NSString *)className DataArr:(NSArray *)array;

//利用类方法赋值(数据源=字典)
+(NSMutableArray *)dataStoredClass:(NSString *)className DataDic:(NSDictionary *)dic;

@end
