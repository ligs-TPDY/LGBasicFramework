//
//  IGSNetworkHelper.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "IGSNetworkHelper.h"

@implementation IGSNetworkHelper

+ (NSURLSessionTask *)getDatAccordingTag:(NSString *)tag Parameters:(id)parameters success:(IGSRequestSuccess)success failure:(IGSRequestFailure)failure
{
    if (kIsNetwork) {
        NSString *url = nil;
        NSMutableDictionary *dicForParameters = nil;
        if ([tag isEqualToString:@"AppStore"]) {
            url = [NSString stringWithFormat:@"%@%@",GApiAppStore,APPID];//将请求前缀与请求路径拼接成一个完整的URL
            NSArray *arrayForKey = @[@"",@"",@""];
            dicForParameters = [NSMutableDictionary dictionaryWithObjects:parameters forKeys:arrayForKey];
        }
        if ([tag isEqualToString:@"UShareContent"]) {
            url = [NSString stringWithFormat:@"%@%@",httpNetworkAddress,UShareContent];//将请求前缀与请求路径拼接成一个完整的URL
            NSArray *arrayForKey = @[@"",@"",@""];
            dicForParameters = [NSMutableDictionary dictionaryWithObjects:parameters forKeys:arrayForKey];
        }
        GLogDebug(@"\n-------组装URL-------\n==%@",url);
        GLogDebug(@"\n-------组装Parameters-------==%@",dicForParameters);
        return [self requestWithURL:url parameters:dicForParameters success:success failure:failure];
    }else{
        [IGSNetworkHelper NetworkStateForFailure];
        return nil;
    }
}
/*
    配置好PPNetworkHelper各项请求参数,封装成一个公共方法,给以上方法调用,
    相比在项目中单个分散的使用PPNetworkHelper/其他网络框架请求,可大大降低耦合度,方便维护
    在项目的后期, 你可以在公共请求方法内任意更换其他的网络请求工具,切换成本小
 */
#pragma mark - 请求的公共方法
+ (NSURLSessionTask *)requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(IGSRequestSuccess)success failure:(IGSRequestFailure)failure
{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
    //在APP请求头添加标记
    [PPNetworkHelper setValue:@"iOS" forHTTPHeaderField:@"App-Client"];
    //在APP请求头添加标记
    [PPNetworkHelper setValue:@"XMLHttpRequest" forHTTPHeaderField:@"X-Requested-With"];
    //在APP请求头添加版本号
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [PPNetworkHelper setValue:app_Version forHTTPHeaderField:@"version"];
    //添加手机的详细信息
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSString* phoneModel = [NSObject iphoneType];
    NSString* mark = [NSString stringWithFormat:@"lichuangtou %@ (IOS%@; %@)",app_Version,phoneVersion,phoneModel];
    [PPNetworkHelper setValue:mark forHTTPHeaderField:@"User-Agent"];
    //发起请求
    return [PPNetworkHelper POST:URL parameters:parameter success:^(id responseObject) {
        GLogDebug(@"\n-------数据请求成功-------\nURL====%@\nPAR====%@\nRES==%@\n\n\n",URL,parameter,responseObject);
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        success(responseObject);
    } failure:^(NSError *error) {
        // 同上
        GLogError(@"%@",error);
    }];
    return nil;
}
@end
