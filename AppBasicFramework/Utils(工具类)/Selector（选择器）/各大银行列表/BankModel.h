//
//  BankModel.h
//  HuaRJProject
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankModel : NSObject

//利用类方法赋值
+(BankModel *)clickAllClassificationLeftToModel:(NSDictionary *)dic;

//银行名字
@property (nonatomic,strong) NSString *BankName;

@end
