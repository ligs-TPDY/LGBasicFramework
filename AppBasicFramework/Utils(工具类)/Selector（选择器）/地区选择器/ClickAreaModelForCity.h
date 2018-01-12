//
//  ClickAreaModelForCity.h
//  ZDTQProject
//
//  Created by 李广帅 on 16/7/25.
//  Copyright © 2016年 李广帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClickAreaModelForCity : NSObject

//利用类方法赋值
+(ClickAreaModelForCity *)clickAreaModelForCity:(NSDictionary *)dic;

//存储省，市，县三级信息
@property (nonatomic,strong) NSString *DivisionName;

@end
