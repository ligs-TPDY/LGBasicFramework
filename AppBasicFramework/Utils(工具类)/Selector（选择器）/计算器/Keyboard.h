//
//  Keyboard.h
//  Calculator
//
//  Created by lanou3g on 15/4/24.
//  Copyright (c) 2015年 张永涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OperationFactory.h"

@interface Keyboard : UIView
{
    UIButton *b;
}
@property (nonatomic,assign)double num1;
@property (nonatomic,assign)double num2;


@property (nonatomic,strong)NSMutableString *result;

-(id)initWithFrame:(CGRect)frame;
@end
