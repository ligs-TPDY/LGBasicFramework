//
//  OneSectionViewController.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "OneSectionViewController.h"
#import "JLRoutes.h"
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [IGSNetworkHelper obtainDatAccordingTag:@"AppStore" requestType:POST Parameters:nil success:^(id response) {
        BLYLogDebug(@"%@",response);
    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *customURL = @"One://Webview/RootWKWebViewViewController?strAboutUrl=mobile/loanEvent";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
    
//    NSURL *editPost = [NSURL URLWithString:@"BASIC://Webview/RootWKWebViewViewController?strAboutUrl=mobile/loanEvent"];
//    [JLRoutes routeURL:editPost];
}

@end
