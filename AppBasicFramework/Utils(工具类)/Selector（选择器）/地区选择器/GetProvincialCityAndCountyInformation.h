//
//  GetProvincialCityAndCountyInformation.h
//  HuaRJProject
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetProvincialCityAndCountyInformation : NSObject

#pragma mark - --读取本地的Plist文件，获取全国省市县的信息--
//省市县三级信息联动的数据模型和结构建设，属于比较典型，且容易出错的结构，以后需回顾，并总结
-(NSMutableArray *)requestProvincialCitiesAndCounties;

@end
