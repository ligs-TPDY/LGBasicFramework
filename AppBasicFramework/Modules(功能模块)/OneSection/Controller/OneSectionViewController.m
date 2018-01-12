//
//  OneSectionViewController.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "OneSectionViewController.h"

#import "OneSectionView.h"

@interface OneSectionViewController ()

@property (nonatomic,strong) OneSectionView *mainView;

@end

@implementation OneSectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mainView];
}
- (OneSectionView *)mainView
{
    if (!_mainView)
    {
        OneSectionView *view = [[OneSectionView alloc]init];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
        }];
        _mainView = view;
    }
    return _mainView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    RootWKWebViewViewController *wk = [[RootWKWebViewViewController alloc]init];
    [self.navigationController pushViewController:wk animated:YES];
}
@end
