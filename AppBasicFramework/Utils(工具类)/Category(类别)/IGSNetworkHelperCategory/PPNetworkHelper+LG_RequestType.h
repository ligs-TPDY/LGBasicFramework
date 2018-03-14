//
//  PPNetworkHelper+LG_RequestType.h
//  AppBasicFramework
//
//  Created by AKL on 2018/3/14.
//  Copyright © 2018年 IGS. All rights reserved.
//

#import <PPNetworkHelper/PPNetworkHelper.h>

@interface PPNetworkHelper (LG_RequestType)

/**
 *  PUT请求,无缓存
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)PUT:(NSString *)URL
                        parameters:(id)parameters
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure;

/**
 *  DELETE请求,无缓存
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)DELETE:(NSString *)URL
                        parameters:(id)parameters
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure;

+ (void)obtainHeaderFields;


@end
