//
//  DatePicker.m
//  HuaRJProject
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "DatePicker.h"

@interface DatePicker ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
{
    BackToCompleteLoginView _backToCompleteLoginView;
}

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIPickerView *pickerView;
//月份数据源
@property (nonatomic,strong) NSArray *arrayForMonth;
//年的数据源
@property (nonatomic,strong) NSMutableArray *mutArrForYear;
//日的数据源
@property (nonatomic,strong) NSMutableArray *mutArrForDay;
//显示时间
@property (nonatomic,strong) UITextField *TextForTop;
@property (nonatomic,strong) NSString *strForDay;
@property (nonatomic,strong) NSString *strForMonth;
@property (nonatomic,strong) NSString *strForYear;

@property (nonatomic,strong) NSString *str;

@end

@implementation DatePicker

-(void)setBackToCompleteLoginView:(BackToCompleteLoginView)callBack
{
    _backToCompleteLoginView = callBack;
}
//获取月份数据
-(NSArray *)arrayForMonth
{
    if (!_arrayForMonth)
    {
        _arrayForMonth = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    }
    return _arrayForMonth;
}
//获取日子月份
-(NSMutableArray *)mutArrForDay
{
    if (!_mutArrForDay)
    {
        NSArray *array = @[];
        _mutArrForDay = [[NSMutableArray alloc]initWithArray:array];
        for (int i=1; i<32; i++)
        {
            NSString *str = [[NSString alloc]initWithFormat:@"%d",i];
            [_mutArrForDay addObject:str];
        }
    }
    return _mutArrForDay;
}
//获取年份
-(NSMutableArray *)mutArrForYear
{
    if (!_mutArrForYear)
    {
        NSArray *array = @[];
        _mutArrForYear = [[NSMutableArray alloc]initWithArray:array];
        for (int i=2017; i<2019; i++)
        {
            NSString *str = [[NSString alloc]initWithFormat:@"%d",i];
            [_mutArrForYear addObject:str];
        }
    }
    return _mutArrForYear;
}
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self createlabelBottom];
        [self createPickerView];
        [self createlabelForTop];
        [self createlabelForTopBottom];
        
        
        //未滑动选择时，默认显示第一个时间
        _strForYear = self.mutArrForYear[0];
        _strForMonth = self.arrayForMonth[0];
        _strForDay = self.mutArrForDay[0];
        //当有滑动时，选择滑动的数据
        _strForDay = [[NSString alloc]initWithFormat:@"%@",_strForDay];
        _strForMonth = [[NSString alloc]initWithFormat:@"%@",_strForMonth];
        _strForYear = [[NSString alloc]initWithFormat:@"%@",_strForYear];
        
        NSDate *date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:@"YYYY-MM-dd"];
        NSString *DateTime = [formatter stringFromDate:date];
//        NSLog(@"%@============年-月-日  时：分：秒=====================",DateTime);
        
        NSArray *temp=[DateTime componentsSeparatedByString:@"-"];
        
        _TextForTop.text = [NSString stringWithFormat:@"%@-%@-%@",temp[0],temp[1],temp[2]];
        _strForYear = temp[0];
        _strForMonth = temp[1];
        _strForDay = temp[2];
        
        NSInteger count1 = [temp[1] integerValue]-1;
        NSInteger count2 = [temp[2] integerValue]-1;
        
        [_pickerView selectRow:count1 inComponent:1 animated:YES];
        [_pickerView selectRow:count2 inComponent:2 animated:YES];
    }
    return self;
}
#pragma mark - --确认取消按钮--
-(void)createlabelBottom
{
    CGFloat width = GScreenWidth;
    CGFloat widthForlabelForCancel = width * 0.35;
    CGFloat heightForlabelForCancel = width * 0.1127;
    
    //取消按钮
    UILabel *labelForCancel = [self createLabelFor];
    [labelForCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(self);
        make.width.mas_equalTo(widthForlabelForCancel);
        make.height.mas_equalTo(heightForlabelForCancel);
    }];
    labelForCancel.text = @"取消";
    labelForCancel.tag = 100;
    labelForCancel.textColor = [UIColor blackColor];
    
    //确认按钮
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
#pragma mark - --显示当前选择的时间--
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
}
-(void)createlabelForTopBottom
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
#pragma mark - --滑动选择器--
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
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.mutArrForYear.count;
    }
    if (component == 1)
    {
        return self.arrayForMonth.count;
    }
    if (component == 2)
    {
        int year = [_strForYear intValue];
        if (year%4 == 0)
        {
            if ([_strForMonth isEqualToString:@"2"])
            {
                return 29;
            }
        }else{
            if ([_strForMonth isEqualToString:@"2"])
            {
                return 28;
            }
        }
        if ([_strForMonth isEqualToString:@"4"])
        {
            return 30;
        }
        if ([_strForMonth isEqualToString:@"6"])
        {
            return 30;
        }
        if ([_strForMonth isEqualToString:@"9"])
        {
            return 30;
        }
        if ([_strForMonth isEqualToString:@"11"])
        {
            return 30;
        }
        if ([_strForMonth isEqualToString:@"1"])
        {
            return 31;
        }
        if ([_strForMonth isEqualToString:@"3"])
        {
            return 31;
        }
        if ([_strForMonth isEqualToString:@"5"])
        {
            return 31;
        }
        if ([_strForMonth isEqualToString:@"7"])
        {
            return 31;
        }
        if ([_strForMonth isEqualToString:@"8"])
        {
            return 31;
        }
        if ([_strForMonth isEqualToString:@"10"])
        {
            return 31;
        }
        if ([_strForMonth isEqualToString:@"12"])
        {
            return 31;
        }
        return self.mutArrForDay.count;
    }
    return 0;
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.mutArrForYear[row];
    }
    if (component == 1)
    {
        return self.arrayForMonth[row];
    }
    if (component == 2)
    {
        return self.mutArrForDay[row];
    }
    return nil;
}
//当前选择的时间
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        _strForYear = self.mutArrForYear[row];
        
        [_pickerView reloadAllComponents];
    }
    if (component == 1)
    {
        _strForMonth = self.arrayForMonth[row];
        
        [_pickerView reloadAllComponents];
    }
    if (component == 2)
    {
        _strForDay = self.mutArrForDay[row];
        
        [_pickerView reloadAllComponents];
    }
    _TextForTop.text = [NSString stringWithFormat:@"%@-%@-%@",_strForYear,_strForMonth,_strForDay];
}
#pragma mark - --点击取消和确认按钮--
-(void)tap:(UITapGestureRecognizer *)tap
{
    //点击取消，数据不保存
    if (tap.view.tag == 100)
    {
        
    }
    //点击确认，数据保存
    if (tap.view.tag == 101)
    {
        //同步数据，成功后刷新显示界面
        [self userInformationSynchronization];
    }
    self.hidden = YES;
    
    if (_backToCompleteLoginView)
    {
        _backToCompleteLoginView();
    }
}
#pragma mark - --用户信息做同步--
-(void)userInformationSynchronization
{
    
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
