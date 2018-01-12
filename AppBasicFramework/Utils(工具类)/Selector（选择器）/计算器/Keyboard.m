//
//  Keyboard.m
//  Calculator
//
//  Created by lanou3g on 15/4/24.
//  Copyright (c) 2015年 张永涛. All rights reserved.
//

#import "Keyboard.h"
@interface Keyboard()
{
    Opration *oper;
    double a;
    BOOL flag;
}
@end
@implementation Keyboard

//初始化，用两层for循环来创建的键盘
-(id)initWithFrame:(CGRect)frame
{
    
    if ([super initWithFrame:frame]) {
        self.backgroundColor=[UIColor blackColor];
        //初始化显示的是0
        self.result=[[NSMutableString alloc]initWithFormat:@"0"];
        flag=YES;
        int width=frame.size.width;
        int height=frame.size.height;
        
        for (int i=0; i<5; i++) {
            for (int j=0; j<4; j++) {
                
                if ((i==4)&&(j==0)) {
                    //这里创建的是按键 0 的按钮，因为按键 0 占了两个，宽度是原先的两倍，并且跳过下一次的按钮创建
                    b=[[UIButton alloc]initWithFrame:CGRectMake(j*(width/4), i*(height/5), width/2, height/5)];
                    b.backgroundColor=[UIColor lightGrayColor];
                    b.tag=(i+1)*10+(j+1);//设置tag的值
                    [b.layer setBorderWidth:1];//设置边框
                    [b setTitle:@"0" forState:UIControlStateNormal];
                    [b addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                    [self addSubview:b];
                    j++;
                    continue;
                }
                
                //按钮的创建，按钮的宽高是通过计算得出来的，为了屏幕适配
                b=[[UIButton alloc]initWithFrame:CGRectMake(j*(width/4), i*(height/5), width/4, height/5)];
                b.backgroundColor=[UIColor lightGrayColor];
                [b.layer setBorderWidth:1];
                b.tag=(i+1)*10+(j+1);
                
                if (((j+1)==4)) {
                    //在这里设置最边上竖排的按钮颜色为橘黄色
                    [b setBackgroundColor:[UIColor orangeColor]];
                }
                [self addSubview:b];
                
                
                if (i>0&&j<3&&i<4) {//在这里，为数字按键赋显示的值
                    int num=(3-i)*3+(j+1);//num 的值可以通过计算得出来，与i、j相关
                    NSString *s=[NSString stringWithFormat:@"%d",num];//把int转成字符串，并给按钮赋值
                    [b setTitle:s forState:UIControlStateNormal];
                    [b addTarget:self action:@selector(number:) forControlEvents:UIControlEventTouchDown];
                    //这里为数字按键设置方法、因为数字是一类的，所以都用一个方法
                }
                switch (b.tag) {
                        //这里为其他的功能键设置显示和按键的方法
                    case 11:
                        [b setTitle:@"C" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(clearNum) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 12:
                        [b setTitle:@"+/-" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(symbol:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 13:
                        [b setTitle:@"%" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(percent:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 14:
                        [b setTitle:@"/" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(myOption:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 24:
                        [b setTitle:@"x" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(myOption:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 34:
                        [b setTitle:@"-" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(myOption:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 44:
                        [b setTitle:@"+" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(myOption:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 53:
                        [b setTitle:@"." forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(decimal:) forControlEvents:UIControlEventTouchDown];
                        break;
                    case 54:
                        [b setTitle:@"=" forState:UIControlStateNormal];
                        [b addTarget:self action:@selector(OptionResult) forControlEvents:UIControlEventTouchDown];
                        break;
                    default:
                        break;
                }
            }
        }
    }
    
    return self;
}

-(void)decimal:(UIButton*)btn
{
        if ([self.result isEqualToString:@""])
        {
            [self.result appendString:@"0."];
        }
        else
        {
            [self.result appendString:@"."];
        }

}

//数字按钮的方法
-(void)number:(UIButton*)btn
{
    
    if ([self.result isEqualToString:@"0"]) {
        [self.result setString:@""];
        //如果初始状态为0，先置空一下，这样做的目的是为了在显示的时候不会开头还带着一个0
    }
    
    //这里的result是可变字符串，这样才可以对自己进行更改，添加
    [self.result appendString:btn.titleLabel.text];
    //把所有的输入拼接起来，得到一个完整的多位数字
    self.num1=[self.result doubleValue];//转成
    
    //这里是取到父视图，通过tag取到label，但是注意一点，，通过tag取到的是视图对象，这里先强制类型转换一下，然后用uilabel对象接收，这样就可以操作者的label对象
    
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
}

-(void)clearNum
{
    //清除按钮
    [self.result setString:@"0"];
    self.num1=0;
    self.num2=0;
    a=0;
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
}
//运算符 按钮
-(void)myOption:(UIButton*)btn
{
    
    //这里遇到一个问题，就是在判断中用的是char类型，而按钮的text是string类型，需要先转换一下
    const char *options=[btn.titleLabel.text UTF8String];
    char option=options[0];
    if (option=='x') {
        option='*';
    }
    //在网上搜到这个，转utf8，转换成char字符串，然后再取到第一个。为什么不能直接转？因为他们的编码方式不同，转换之后就不是想要的字符串了
    
    //NSLog(@"%c",option);
    //这里就用到工厂来创建对象了，oper是父类的对象，但是根据运算符的不同实例化出来子类对象
    oper=[OperationFactory creatOpration:option];
    self.num2=[self.result doubleValue];
    [self.result setString:@""];//每次都置空一下，为了下一次的字符输入
    
}
//等号 按钮
-(void)OptionResult
{
    if (a!=0&&self.num2==0) {
        self.num2=a;
        //判断如果运算完之后继续运算的话，用之前的结果当做第一个数
    }
    //为运算类的两个数赋值
    oper.number1=self.num2;
    oper.number2=self.num1;
    //NSLog(@"%d",oper.number2);
    [self.result setString:[oper getResult]];//执行运算方法
    [self ClearZero];
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
    a=[self.result doubleValue];//接收运算结果
    [self.result setString:@""];
    self.num2=0;
    //置空，为下一下次输入准备
}

-(void)symbol:(UIButton*)btn
{
    if (a!=0&&[self.result isEqualToString:@""]) {
        self.num1=a;
    }
    self.num1= -self.num1;
    [self.result setString:[NSString stringWithFormat:@"%f",self.num1]];
    [self ClearZero];
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
    
}

-(void)percent:(UIButton*)btn
{
    if (a!=0&&[self.result isEqualToString:@""]) {
        self.num1=a;
    }
    self.num1=self.num1*0.01;
    [self.result setString:[NSString stringWithFormat:@"%lf",self.num1]];
    [self ClearZero];
    UILabel *l=(UILabel*)[[self superview] viewWithTag:1];
    l.text=self.result;
}

-(void)ClearZero
{
    for (int i=[self.result length]-1; i>=0; i--) {
        char c=[self.result characterAtIndex:i];
        switch (c) {
            case '0':
                [self.result deleteCharactersInRange:NSMakeRange(i, 1)];
                break;
            case '.':
                [self.result deleteCharactersInRange:NSMakeRange(i, 1)];
                goto end;
                break;
            default:
                goto end;
                break;
        }
    }
    end:;
}

@end
