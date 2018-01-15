//
//  RootWKWebViewViewController.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/12.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "RootWKWebViewViewController.h"
//导入头文件
#import <WebKit/WebKit.h>

#import "WKDelegateController.h"

@interface RootWKWebViewViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *wkwebview;
@property (nonatomic,strong) WKUserContentController* userContentController;
@end

@implementation RootWKWebViewViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    _userContentController =[[WKUserContentController alloc]init];
    config.userContentController = _userContentController;
    _wkwebview = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
    [self.view addSubview:_wkwebview];
    _wkwebview.UIDelegate = self;
    _wkwebview.navigationDelegate = self;
    
    //注册方法
    WKDelegateController * delegateController = [[WKDelegateController alloc]init];
    delegateController.delegate = self;
    [_userContentController addScriptMessageHandler:delegateController  name:@"sayhello"];
    
    [_wkwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",httpNetworkAddress,_strAboutUrl]]]];
}
- (void)dealloc{
    //这里需要注意，前面增加过的方法一定要remove掉。
    [_userContentController removeScriptMessageHandlerForName:@"sayhello"];
}
#pragma mark - --WKNavigationDelegate--
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    GLogDebug(@"在发送请求之前，决定是否跳转");
    GLogDebug(@"%@",navigationAction.request.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    GLogDebug(@"页面开始加载时调用");
}
// 接收到服务器跳转请求之后调用，主机地址被重定向时调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    GLogDebug(@"接收到服务器跳转请求之后调用");
}
// 在收到服务器响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    GLogDebug(@"在收到服务器响应后，决定是否跳转");
    GLogDebug(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    GLogDebug(@"当内容开始返回时调用");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    GLogDebug(@"页面加载完成之后调用");
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    GLogDebug(@"页面加载失败时调用");
}



#pragma mark - WKUIDelegate
// 输入框
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
    [[[UIAlertView alloc] initWithTitle:@"输入框" message:prompt delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil] show];
    completionHandler(@"你是谁！");
}
// 确认框
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
    [[[UIAlertView alloc] initWithTitle:@"确认框" message:message delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil] show];
    
    completionHandler(YES);
}
// 警告框
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    [[[UIAlertView alloc] initWithTitle:@"警告框" message:message delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil] show];
    completionHandler();
}
// webview关闭时回调
- (void)webViewDidClose:(WKWebView *)webView {
    
}
// 创建一个新的WebView，或者在原对象上加载新链接
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
//    return [[WKWebView alloc]init];
    
    WKFrameInfo *frameInfo = navigationAction.targetFrame;
    if (![frameInfo isMainFrame]) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"name:%@\\\\n body:%@\\\\n frameInfo:%@\\\\n",message.name,message.body,message.frameInfo);
}
@end
