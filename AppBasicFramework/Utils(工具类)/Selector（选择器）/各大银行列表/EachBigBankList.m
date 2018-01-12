//
//  EachBigBankList.m
//  HuaRJProject
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "EachBigBankList.h"
#import "BankModel.h"
@interface EachBigBankList ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
{
    BackToEachBigBankListbackground _callBack;
}

@property (nonatomic,strong) UIPickerView *pickerView;
//显示时间
@property (nonatomic,strong) UITextField *TextForTop;

@end

@implementation EachBigBankList

- (void)setBackToEachBigBankListbackground:(BackToEachBigBankListbackground)callback
{
    _callBack = callback;
}
- (void)setMutArrForAll:(NSMutableArray *)mutArrForAll
{
    _mutArrForAll = mutArrForAll;
    
    /*
        默认显示第一个银行
     */
    BankModel *bm = _mutArrForAll.firstObject;
    _TextForTop.text = bm.BankName;
    
    /*
        刷新控件，加载新数据
     */
    [_pickerView reloadAllComponents];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self createlabelBottom];
        
        [self createlabelForTop];
        
        [self createViewForTopBottom];
        
        [self createPickerView];
    
    }
    return self;
}
-(void)createlabelForTop
{
    CGFloat width = GScreenWidth;
    CGFloat heightForlabelForTop = width * 0.1;
    
    _TextForTop = [[UITextField alloc]init];
    _TextForTop.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_TextForTop];
    [_TextForTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.height.mas_equalTo(heightForlabelForTop-2);
    }];
    //禁止输入框输入文字
    _TextForTop.userInteractionEnabled = NO;
    
    _TextForTop.textAlignment = NSTextAlignmentCenter;
    _TextForTop.delegate = self;
}
-(void)createViewForTopBottom
{
    CGFloat width = GScreenWidth;
    CGFloat heightForlabelForTop = width * 0.1;
    
    UIView *view = [[UIView alloc]init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.top.mas_equalTo(self).offset(heightForlabelForTop-2);
        make.height.mas_equalTo(1);
    }];
    view.backgroundColor = [UIColor orangeColor];
}
-(void)createPickerView
{
    CGFloat width = GScreenWidth;
    CGFloat heightForSelf = width * 0.1;
    CGFloat heightForSelfBottom = width * 0.1127;
    
    _pickerView = [[UIPickerView alloc]init];
    _pickerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_pickerView];
    [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(heightForSelf);
        make.bottom.mas_equalTo(self).offset(-heightForSelfBottom);
    }];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return _mutArrForAll.count;
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    BankModel *bm = _mutArrForAll[row];
    return bm.BankName;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    BankModel *bm = _mutArrForAll[row];
    
    _TextForTop.text = [NSString stringWithFormat:@"%@",bm.BankName];
}
#pragma mark - --确认取消按钮--
-(void)createlabelBottom
{
    CGFloat width = GScreenWidth;
    CGFloat widthForlabelForCancel = width * 0.35;
    CGFloat heightForlabelForCancel = width * 0.1127;
    
    UILabel *labelForCancel = [self createLabelFor];
    [labelForCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(self);
        make.width.mas_equalTo(widthForlabelForCancel);
        make.height.mas_equalTo(heightForlabelForCancel);
    }];
    labelForCancel.text = @"取消";
    labelForCancel.tag = 100;
    labelForCancel.textColor = [UIColor blackColor];
    
    UILabel *labelForConfirm = [self createLabelFor];
    [labelForConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self);
        make.width.mas_equalTo(widthForlabelForCancel);
        make.height.mas_equalTo(heightForlabelForCancel);
    }];
    labelForConfirm.text = @"确认";
    labelForConfirm.tag = 101;
    labelForConfirm.textColor = [UIColor whiteColor];
    labelForConfirm.backgroundColor = [UIColor orangeColor];
}
#pragma mark - --点击确认取消按钮--
-(void)tap:(UITapGestureRecognizer *)tap
{
    //点击取消
    if (tap.view.tag == 100)
    {
        if (_callBack)
        {
            _callBack();
        }
    }
    //点击确定
    if (tap.view.tag == 101)
    {
        if (_callBack)
        {
            _callBack();
        }
    }
    self.hidden = YES;
}

#pragma mark - --生产控件--
-(UILabel *)createLabelFor
{
    UILabel *label = [[UILabel alloc]init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:label];
    
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [label addGestureRecognizer:tap];
    
    label.textAlignment = NSTextAlignmentCenter;
    //文字适配
    CGFloat width = GScreenWidth;
    if (width == 414)
    {
        label.font = [UIFont systemFontOfSize:16];
    }
    if (width == 375)
    {
        label.font = [UIFont systemFontOfSize:15];
    }
    if (width == 320)
    {
        label.font = [UIFont systemFontOfSize:13];
    }
    return label;
}

@end
