//
//  EachBigBankListbackground.m
//  HuaRJProject
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
/*
 //    //读取本地的文件获得字典
 //    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"EachBigBankList" ofType:@"plist"];
 //    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
 //
 ////    NSLog(@"%@",dictionary);
 //
 //    NSArray *arr = dictionary[@"nameLists"];
 //    for (int i=0; i<arr.count; i++)
 //    {
 //
 //       [self.mutArrBankName addObject:[BankModel clickAllClassificationLeftToModel:arr[i]]] ;
 //    }
 //
 ////    NSLog(@"%@",self.mutArrBankName);
 */

#import "EachBigBankListbackground.h"
#import "EachBigBankList.h"
#import "BankModel.h"
@interface EachBigBankListbackground ()

@property (nonatomic,strong) EachBigBankList *bank;

@property (nonatomic,strong) NSMutableArray *mutArrBankName;

@end

@implementation EachBigBankListbackground

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor =[UIColor lightGrayColor];
        
        self.mutArrBankName = [[NSMutableArray alloc]init];
        
        //创建显示列表
        [self createBankList];
        
        //获取银行列表信息
        [self requestBankName];
    }
    return self;
}
#pragma mark - --创建显示列表--
- (void)createBankList
{
    CGFloat width = GScreenWidth;
    CGFloat heigthFor = width * 0.73;
    CGFloat widthFor = width * 0.70;
    
    _bank = [[EachBigBankList alloc]init];
    _bank.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_bank];
    [_bank mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(heigthFor);
        make.width.mas_equalTo(widthFor);
        make.centerX.mas_equalTo(self);
    }];
    
    _bank.layer.cornerRadius = 8;
    _bank.clipsToBounds = YES;
    //首先将其隐藏，点击后，将其隐藏状态取消
    _bank.hidden = YES;
    _bank.backgroundColor = [UIColor whiteColor];
    
    _bank.layer.borderWidth = 1;
    _bank.layer.borderColor = [[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:248.0/255.0 alpha:1.0]CGColor];
    
    //解决强引用问题
    __weak typeof(self) weakSelf = self;
    [_bank setBackToEachBigBankListbackground:^{
        weakSelf.hidden = YES;
    }];
}
- (void)DisplayEachBigBankList;
{
    _bank.hidden = NO;
}
#pragma mark - --获取银行列表信息--
-(void)requestBankName;
{
    //读取本地的文件获得字典
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"EachBigBankList" ofType:@"plist"];
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSArray *arr = dictionary[@"nameLists"];
    for (int i=0; i<arr.count; i++)
    {
    
        [self.mutArrBankName addObject:[BankModel clickAllClassificationLeftToModel:arr[i]]] ;
    }
    _bank.mutArrForAll = self.mutArrBankName;
}

@end
