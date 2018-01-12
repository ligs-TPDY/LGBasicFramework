//
//  FourSectionViewController.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "FourSectionViewController.h"

#import "RACSignal.h"

#import "FourSectionView.h"

@interface FourSectionViewController ()

@property (nonatomic,strong) FourSectionView *mainView;
@end

@implementation FourSectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mainView];
}
- (FourSectionView *)mainView
{
    if (!_mainView)
    {
        FourSectionView *view = [[FourSectionView alloc]init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }];
        _mainView = view;
    }
    return _mainView;
}

@end
