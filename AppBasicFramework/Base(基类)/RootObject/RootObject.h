//
//  RootObject.h
//  AppBasicFramework
//
//  Created by IOS on 2017/8/29.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <Foundation/Foundation.h>

///返回,不携带任何参数
typedef void (^backForUpperLevelWithVoid)();

///返回,携带一个颜色
typedef void (^backForUpperLevelWithColor)(UIColor *color);

///返回,携带一个字符串
typedef void (^backForUpperLevelWithString)(NSString *str);

///返回,携带一个Int
typedef void (^backForUpperLevelWithInt)(int a);

///返回,携带一个存储相同类型的数组
typedef void (^backForUpperLevelWithArray)(NSArray *array);

///返回,携带一个字典
typedef void (^backForUpperLevelWithDictionary)(NSDictionary *dic);

@interface RootObject : NSObject

@end
