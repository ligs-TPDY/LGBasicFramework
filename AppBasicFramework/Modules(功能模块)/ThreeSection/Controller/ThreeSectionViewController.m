//
//  ThreeSectionViewController.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "ThreeSectionViewController.h"

#import "ThreeSectionView.h"

@interface ThreeSectionViewController ()

@property (nonatomic,strong) ThreeSectionView *mainView;

@end

@implementation ThreeSectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mainView];
}

- (ThreeSectionView *)mainView
{
    if (!_mainView)
    {
        ThreeSectionView *view = [[ThreeSectionView alloc]init];
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
