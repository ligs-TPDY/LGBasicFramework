//
//  IGSNetworkHelper.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "IGSNetworkHelper.h"

#import "PPNetworkHelper+LG_RequestType.h"

@implementation IGSNetworkHelper

+ (NSString *)slpiceURL:(NSString *)tag
{
    NSString *url = nil;
    if ([tag isEqualToString:@"AppStore"]) {
        url = [NSString stringWithFormat:@"%@%@",GApiAppStore,APPID];//将请求前缀与请求路径拼接成一个完整的URL
    }
    if ([tag isEqualToString:@"UShareContent"]) {
        url = [NSString stringWithFormat:@"%@%@",httpNetworkAddress,UShareContent];//将请求前缀与请求路径拼接成一个完整的URL
    }
    DDLogInfo(@"\n-------组装URL-------\n==%@",url);
    return url;
}
+ (NSMutableDictionary *)slpiceTag:(NSString *)tag parameters:(NSArray *)parameters
{
    NSMutableDictionary *dicForParameters = nil;
    if ([tag isEqualToString:@"AppStore"]) {
        dicForParameters = nil;
    }
    if ([tag isEqualToString:@"UShareContent"]) {
        NSArray *arrayForKey = @[@"",@"",@""];
        dicForParameters = [NSMutableDictionary dictionaryWithObjects:parameters forKeys:arrayForKey];
    }
    GLogInfo(@"\n-------组装Parameters-------\n==%@",dicForParameters);
    return dicForParameters;
}
+ (void)setHTTPHeader
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
    //设置超时时长
    [PPNetworkHelper setRequestTimeoutInterval:30];
}

/**
 根据标记获取数据
 
 @param tag             网络请求标记(字符串类型，以接口名字作为标记)
 @param requestType     网络请求类型（字符串类型，post，get，put，delete）
 @param parameters      网络请求参数(数组，参数以字符串的形式)
 @param success         网络成功的回调(获取到的数据（json格式）)
 @param failure         网络失败的回调(数据获取失败)
 
 */
+ (NSURLSessionTask *)obtainDatAccordingTag:(NSString *)tag
                                requestType:(requestType)type
                                 Parameters:(id)parameters
                                    success:(IGSRequestSuccess)success
                                    failure:(IGSRequestFailure)failure;
{
    if (kIsNetwork) {

        //根据tag来拼接参数
        NSString *strForURL = [self slpiceURL:tag];
        //根据参数来拼接请求参数
        NSMutableDictionary *dicForParameters = [self slpiceTag:tag parameters:parameters];
        
        //设置请求头
        [self setHTTPHeader];
        
        //打印请求头
        [PPNetworkHelper obtainHeaderFields];
        
        switch (type) {
            case GET:
                return  [PPNetworkHelper GET:strForURL parameters:dicForParameters success:^(id responseObject) {
                    GLogInfo(@"\n-------数据请求成功-------\nURL====%@\nrequestType===GET\nPAR====%@\nRES==%@\n\n\n",strForURL, dicForParameters,responseObject);
                    // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
                    success(responseObject);
                } failure:^(NSError *error) {
                    // 同上
                    GLogError(@"%@",error);
                }];
                break;
            case POST:
                return  [PPNetworkHelper POST:strForURL parameters:dicForParameters success:^(id responseObject) {
                    GLogInfo(@"\n-------数据请求成功-------\nURL====%@\nrequestType===POST\nPAR====%@\nRES==%@\n\n\n",strForURL,dicForParameters,responseObject);
                    // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
                    success(responseObject);
                } failure:^(NSError *error) {
                    // 同上
                    GLogError(@"%@",error);
                }];
                break;
            case PUT:
                return  [PPNetworkHelper PUT:strForURL parameters:dicForParameters success:^(id responseObject) {
                    GLogInfo(@"\n-------数据请求成功-------\nURL====%@\nrequestType===POST\nPAR====%@\nRES==%@\n\n\n",strForURL,dicForParameters,responseObject);
                    // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
                    success(responseObject);
                } failure:^(NSError *error) {
                    // 同上
                    GLogError(@"%@",error);
                }];
                break;
            case DELETE:
                return  [PPNetworkHelper DELETE:strForURL parameters:dicForParameters success:^(id responseObject) {
                    GLogInfo(@"\n-------数据请求成功-------\nURL====%@\nrequestType===POST\nPAR====%@\nRES==%@\n\n\n",strForURL,dicForParameters,responseObject);
                    // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
                    success(responseObject);
                } failure:^(NSError *error) {
                    // 同上
                    GLogError(@"%@",error);
                }];
                break;
            default:
                break;
        }
        
        
    }else{
        [IGSNetworkHelper NetworkStateForFailure];
        return nil;
    }
    return nil;
}

@end
