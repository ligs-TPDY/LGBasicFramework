//
//  CalculatorViewController.m
//  HuaRJProject
//
//  Created by apple on 17/3/16.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Keyboard.h"
@interface CalculatorViewController ()
{
    UILabel *showView;
}
@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建计算器操作界面
    [self createCalculator];
}
- (void)createCalculator
{
    CGFloat screenHeight = GScreenWidth;
    CGFloat searchForScreenHeight = screenHeight/14+22;
    
    int width=[[UIScreen mainScreen] bounds].size.width;
    int height=[[UIScreen mainScreen] bounds].size.height;//获得屏幕宽高，下面需要使用来设置控件大小
    
    showView=[[UILabel alloc]initWithFrame:CGRectMake(0, searchForScreenHeight, width,200-searchForScreenHeight)];
    showView.backgroundColor=[UIColor darkGrayColor];
    showView.tag=1;//设置tag，方便后面对他操作
    [showView setTextAlignment:NSTextAlignmentRight];
    [showView setFont:[UIFont systemFontOfSize:40]];
    [self.view addSubview:showView];
    
    //创建了一个自定义视图，显示键盘，并且按键监控
    Keyboard *key=[[Keyboard alloc]initWithFrame:CGRectMake(0, 200, width, height-200)];
    [self.view addSubview:key];
    showView .text =[NSString stringWithFormat:@"%@",key.result];//设置显示的结果
}
@end
