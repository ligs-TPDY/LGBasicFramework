//
//  CustomEqual.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/26.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "CustomEqual.h"

@implementation CustomEqual

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[CustomEqual class]]) {
        return NO;
    }
    
    return [self isEqualToPerson:(CustomEqual *)object];
}
- (BOOL)isEqualToPerson:(CustomEqual *)CE {
    if (!CE) {
        return NO;
    }
    
    BOOL haveEqualtext1 = (!self.test1 && !CE.test1) || [self.test1 isEqualToString:CE.test1];
    BOOL haveEqualtext2 = (!self.test2 && !CE.test2) || [self.test2 isEqualToDate:CE.test2];
    
    return haveEqualtext1 && haveEqualtext2;
}
/**
    上述代码主要步骤如下
    Step 1: ==运算符判断是否是同一对象, 因为同一对象必然完全相同
    Step 2: 判断是否是同一类型, 这样不仅可以提高判等的效率, 还可以避免隐式类型转换带来的潜在风险
    Step 3: 通过封装的isEqualToPerson方法, 提高代码复用性
    Step 4: 判断person是否是nil, 做参数有效性检查
    Step 5: 对各个属性分别使用默认判等方法进行判断
    Step 6: 返回所有属性判等的与结果
    isEqual的实现并不复杂, 但是从代码质量(效率, 安全, 复用)来说, 上述实现仍然值得仔细学习和借鉴
 */


@end
