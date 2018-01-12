//
//  WebPageLoadingViewController.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/22.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootWebViewController.h"

@interface RootWebViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *H5web;
@end

@implementation RootWebViewController

- (instancetype)initWithStrUrl:(NSString *)str
{
    self = [super init];
    if (self) {
        
        if (str.length != 0){
            [self LoadWebview:str];
        }
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    //自定义右边按钮文字
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}
/** 
    第三方库，PopAction-master
    拿到系统返回按钮的点击事件
 */
- (BOOL)navigationShouldPopOnBackButton
{
    if ([SVProgressHUD isVisible]) {
        //加载完成时提示信息圈圈消失
        [SVProgressHUD dismiss];
    };
    return YES;
}
- (void)back
{
    if ([SVProgressHUD isVisible]) {
        //加载完成时提示信息圈圈消失
        [SVProgressHUD dismiss];
    };
    
    if ([_H5web canGoBack]){
        [_H5web goBack];
    }else{
        [PromptBounced popUpPromptBounced:@"您已经回到首页"];
    }
}
- (void)refresh
{
    if ([SVProgressHUD isVisible]) {
        //加载完成时提示信息圈圈消失
        [SVProgressHUD dismiss];
    };
    
    [_H5web reload];
}

- (void)LoadWebview:(NSString *)str
{
    CGFloat H = GScreenHeight;
    CGFloat W = GScreenWidth;
    _H5web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, W, H)];
    NSString *versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *requestStr = nil;
    if([str rangeOfString:@"?"].location !=NSNotFound){
        requestStr = [NSString stringWithFormat:@"%@%@%@",str,@"&from=app&v=",versionStr];
    }else{
        requestStr = [NSString stringWithFormat:@"%@%@%@",str,@"?&from=app&v=",versionStr];
    }
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:requestStr]];
    [_H5web loadRequest:request];
    _H5web.delegate = self;
    _H5web.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    [self.view addSubview:_H5web];
}
#pragma mark - --UIWebView的代理方法--
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //加载时提示信息圈圈
    [SVProgressHUD show];
    return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
    if ([SVProgressHUD isVisible]) {
        //加载完成时提示信息圈圈消失
        [SVProgressHUD dismiss];
    };
    
    if ([webView.scrollView.mj_header isRefreshing])
    {
        [webView.scrollView.mj_header endRefreshing];
    }
    
    self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}
@end
