//
//  TowSectionViewController.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "TowSectionViewController.h"

#import "TowSectionView.h"

@interface TowSectionViewController ()

@property (nonatomic,strong) TowSectionView *mainView;
@end

@implementation TowSectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mainView];
}
- (TowSectionView *)mainView
{
    if (!_mainView)
    {
        TowSectionView *view = [[TowSectionView alloc]init];
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
