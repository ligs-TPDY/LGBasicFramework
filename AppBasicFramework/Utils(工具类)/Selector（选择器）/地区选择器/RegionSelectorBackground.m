//
//  RegionSelectorBackground.m
//  HuaRJProject
//
//  Created by apple on 17/3/3.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "RegionSelectorBackground.h"
#import "RegionSelector.h"
#import "GetProvincialCityAndCountyInformation.h"
@interface RegionSelectorBackground ()

@property (nonatomic,strong) RegionSelector *region;

@end

@implementation RegionSelectorBackground

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        CGFloat width = GScreenWidth;
        CGFloat heigthFor = width * 0.73;
        CGFloat widthFor = width * 0.70;
        
        _region = [[RegionSelector alloc]init];
        _region.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_region];
        [_region mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(heigthFor);
            make.width.mas_equalTo(widthFor);
            make.centerX.mas_equalTo(self);
        }];
        
        GetProvincialCityAndCountyInformation *infor = [[GetProvincialCityAndCountyInformation alloc]init];
        
        NSMutableArray *mutArr = [infor requestProvincialCitiesAndCounties];
        
        _region.mutArrForAll = mutArr;
        
        _region.layer.cornerRadius = 8;
        _region.clipsToBounds = YES;
        //首先将其隐藏，点击后，将其隐藏状态取消
        _region.hidden = YES;
        _region.backgroundColor = [UIColor whiteColor];
        
        _region.layer.borderWidth = 1;
        _region.layer.borderColor = [[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:248.0/255.0 alpha:1.0]CGColor];
        
        //解决强引用问题
        __weak typeof(self) weakSelf = self;
        //回调，点击取消时，将背景VIew隐藏
        [_region setBackToCompleteLoginView:^{
            
            weakSelf.hidden = YES;
            
        }];
        
        self.backgroundColor =[UIColor lightGrayColor];
        
    }
    return self;
}
- (void)DisplayRegionSelector;
{
    _region.hidden = NO;
}
@end
