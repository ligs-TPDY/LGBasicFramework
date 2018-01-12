//
//  MyGiftCertificateView.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/26.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "MyGiftCertificateView.h"
#import "ClassicScrollDisplayBottomView.h"
#import "MyGiftCertificateDetailedView.h"
@implementation MyGiftCertificateView
- (void)setMutArrForGiftListOne:(NSMutableArray *)mutArrForGiftListOne
{
    _mutArrForGiftListOne = mutArrForGiftListOne;
    
    _MGViewForUnused.mutArrForGiftList = _mutArrForGiftListOne;
}
- (void)setMutArrForGiftListTow:(NSMutableArray *)mutArrForGiftListTow
{
    _mutArrForGiftListTow = mutArrForGiftListTow;
    
    _MGViewForUsed.mutArrForGiftList = _mutArrForGiftListTow;
}
- (void)setMutArrForGiftListThree:(NSMutableArray *)mutArrForGiftListThree
{
    _mutArrForGiftListThree = mutArrForGiftListThree;
    
    _MGViewForExpired.mutArrForGiftList = _mutArrForGiftListThree;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self CSDBView];
    }
    return self;
}
- (ClassicScrollDisplayBottomView *)CSDBView
{
    if (_CSDBView != nil) {
        return _CSDBView;
    }
    
    NSArray *array = @[@"未使用",@"已使用",@"已过期"];
    _MGViewForUnused = [[MyGiftCertificateDetailedView alloc]init];
    _MGViewForUnused.type = 1;
    _MGViewForUsed = [[MyGiftCertificateDetailedView alloc]init];
    _MGViewForUsed.type = 2;
    _MGViewForExpired = [[MyGiftCertificateDetailedView alloc]init];
    _MGViewForExpired.type = 3;
    NSArray *arrayForClass = @[_MGViewForUnused,_MGViewForUsed,_MGViewForExpired];
    _CSDBView = [[ClassicScrollDisplayBottomView alloc]initWithTitleText:array
                                                          colorForSelect:RGB(0.0, 204.0, 255.0, 1.0)
                                                        colorForNoSelect:RGB(169.0, 169.0, 169.0, 1.0)
                                                             detailClass:arrayForClass];
    _CSDBView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_CSDBView];
    [_CSDBView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    return _CSDBView;
}
@end
