//
//  RegionSelector.m
//  HuaRJProject
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "RegionSelector.h"
#import "ClickAreaModel.h"
#import "ClickAreaModelForCity.h"
#import "ClickAreaModelForCounties.h"
@interface RegionSelector ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>

{
    BackToCompleteLoginView _backToCompleteLoginView;
}
@property (nonatomic,strong) UIPickerView *pickerView;

//显示时间
@property (nonatomic,strong) UITextField *TextForTop;
@property (nonatomic,strong) NSString *strForProvincial;
@property (nonatomic,strong) NSString *strForCitiesTow;
@property (nonatomic,strong) NSString *strForCountiesTow;
//存储滑动是选择省的下标
@property (nonatomic,assign) NSInteger countForProvincial;
@property (nonatomic,assign) NSInteger countForCitiesTow;
@property (nonatomic,assign) NSInteger countForCitiesThree;

@property (nonatomic,strong) NSString *str;


@end

@implementation RegionSelector

- (instancetype)init
{
    self = [super init];
    if (self)
    {

        [self createlabelBottom];
        [self createlabelForTop];
        [self createViewForTopBottom];
        
        _countForProvincial = 0;
        _countForCitiesTow = 0;
    }
    return self;
}
-(void)setBackToCompleteLoginView:(BackToCompleteLoginView)callBack
{
    _backToCompleteLoginView = callBack;
}
#pragma mark - --数据处理--
-(void)setMutArrForAll:(NSMutableArray *)mutArrForAll
{
    _mutArrForAll = mutArrForAll;
    
    NSMutableArray *mutArrForProvincial = self.mutArrForAll[0];
    ClickAreaModel *model = mutArrForProvincial[0];
    _strForProvincial = model.DivisionName;
    
    NSMutableArray *mutArrForCitiesTow = self.mutArrForAll[1];
    NSMutableArray *mutArrForCitiesOne  = mutArrForCitiesTow[0];
    ClickAreaModelForCity *model1 = mutArrForCitiesOne[0];
    _strForCitiesTow = model1.DivisionName;
    
    NSMutableArray *mutArrForCountiesTow = self.mutArrForAll[2];
    NSMutableArray *mutArrForCountiesOne = mutArrForCountiesTow[0];
    NSMutableArray *mutArr6 = mutArrForCountiesOne[0];
    ClickAreaModelForCounties *model2 = mutArr6[0];
    _strForCountiesTow = model2.DivisionName;
    
    _strForProvincial = [[NSString alloc]initWithFormat:@"%@",_strForProvincial];
    _strForCitiesTow = [[NSString alloc]initWithFormat:@"%@",_strForCitiesTow];
    _strForCountiesTow = [[NSString alloc]initWithFormat:@"%@",_strForCountiesTow];
    
    [self createPickerView];
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
#pragma mark - --显示地区三级联动--
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
    return 3;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        NSMutableArray *mutArrForProvincial = self.mutArrForAll[0];
        return mutArrForProvincial.count;
    }
    if (component == 1)
    {
        NSMutableArray *mutArrForCitiesTow = self.mutArrForAll[1];
        NSMutableArray *mutArrForCitiesOne = mutArrForCitiesTow[_countForProvincial];
        return mutArrForCitiesOne.count;
    }
    if (component == 2)
    {
        NSMutableArray *mutArrForCountiesTow = self.mutArrForAll[2];
        NSMutableArray *mutArr3 = mutArrForCountiesTow[_countForProvincial];
        NSMutableArray *mutArr4 = mutArr3[_countForCitiesTow];
        return mutArr4.count;
    }
    return 0;
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        NSMutableArray *mutArrForProvincial = self.mutArrForAll[0];
        ClickAreaModel *model = mutArrForProvincial[row];
        return model.DivisionName;
    }
    if (component == 1)
    {
        NSMutableArray *mutArrForCitiesTow = self.mutArrForAll[1];
        NSMutableArray *mutArrForCitiesOne = mutArrForCitiesTow[_countForProvincial];
        ClickAreaModelForCity *model = mutArrForCitiesOne[row];
        return model.DivisionName;
    }
    if (component == 2)
    {
        NSMutableArray *mutArrForCountiesTow = self.mutArrForAll[2];
        NSMutableArray *mutArrForCountiesOne = mutArrForCountiesTow[_countForProvincial];
        NSMutableArray *mutArr6 = mutArrForCountiesOne[_countForCitiesTow];
        ClickAreaModelForCounties *model = mutArr6[row];
        return model.DivisionName;
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //滑动省
    if (component == 0)
    {
        _countForProvincial = row;
        
        //取省的数据
        NSMutableArray *mutArrForProvincial = self.mutArrForAll[0];
        ClickAreaModel *model = mutArrForProvincial[row];
        _strForProvincial = model.DivisionName;
        
        //取市的数据
        NSMutableArray *mutArrForCitiesTow = self.mutArrForAll[1];
        NSMutableArray *mutArrForCitiesOne  = mutArrForCitiesTow[_countForProvincial];
        //如果超出了市的个数，默认选择第一个
        if (_countForCitiesTow>=mutArrForCitiesOne.count)
        {
            _countForCitiesTow = mutArrForCitiesOne.count-1;
        }
        ClickAreaModelForCity *model1 = mutArrForCitiesOne[_countForCitiesTow];
        _strForCitiesTow = model1.DivisionName;
        
        //取县的数据
        NSMutableArray *mutArrForCountiesTow = self.mutArrForAll[2];
        NSMutableArray *mutArrForCountiesOne = mutArrForCountiesTow[_countForProvincial];
        //如果超出了市的个数，默认选择第一个
        if (_countForCitiesTow>=mutArrForCitiesOne.count)
        {
            _countForCitiesTow = mutArrForCitiesOne.count-1;
        }
        NSMutableArray *mutArr6 = mutArrForCountiesOne[_countForCitiesTow];
        //如果超出县的个数，默认选择第一个
        if (_countForCitiesThree >= mutArr6.count)
        {
            _countForCitiesThree = mutArr6.count-1;
        }
        ClickAreaModelForCounties *model2 = mutArr6[_countForCitiesThree];
        _strForCountiesTow = model2.DivisionName;
        
        [_pickerView reloadComponent:1];
        [_pickerView reloadComponent:2];
    }
    //滑动市
    if (component == 1)
    {
        _countForCitiesTow = row;
        
        //取对应省的信息
        NSMutableArray *mutArrForCitiesTow = self.mutArrForAll[1];
        NSMutableArray *mutArrForCitiesOne  = mutArrForCitiesTow[_countForProvincial];
        ClickAreaModelForCity *model = mutArrForCitiesOne[_countForCitiesTow];
        _strForCitiesTow = model.DivisionName;
        
        NSMutableArray *mutArrForCountiesTow = self.mutArrForAll[2];
        NSMutableArray *mutArrForCountiesOne = mutArrForCountiesTow[_countForProvincial];
        
        NSMutableArray *mutArr6 = mutArrForCountiesOne[_countForCitiesTow];
        //如果超出县的个数，默认选择第一个
        if (_countForCitiesThree >= mutArr6.count)
        {
            _countForCitiesThree = mutArr6.count-1;
            
        }
        ClickAreaModelForCounties *model2 = mutArr6[_countForCitiesThree];
        _strForCountiesTow = model2.DivisionName;
        
        [_pickerView reloadAllComponents];
    }
    //滑动县
    if (component == 2)
    {
        _countForCitiesThree = row;
        NSMutableArray *mutArrForCountiesTow = self.mutArrForAll[2];
        NSMutableArray *mutArrForCountiesOne = mutArrForCountiesTow[_countForProvincial];
        NSMutableArray *mutArr6 = mutArrForCountiesOne[_countForCitiesTow];
        ClickAreaModelForCounties *model = mutArr6[row];
        _strForCountiesTow = model.DivisionName;
        
        [_pickerView reloadAllComponents];
    }
    _TextForTop.text = [NSString stringWithFormat:@"%@%@%@",_strForProvincial,_strForCitiesTow,_strForCountiesTow];
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
-(void)tap:(UITapGestureRecognizer *)tap
{
    if (tap.view.tag == 100)
    {
        
    }
    if (tap.view.tag == 101)
    {
        //信息同步
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
