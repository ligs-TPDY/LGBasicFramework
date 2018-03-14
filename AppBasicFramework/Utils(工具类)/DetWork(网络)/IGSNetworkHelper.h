//
//  IGSNetworkHelper.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/15.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RootObject.h"

///请求成功的block
typedef void(^IGSRequestSuccess)(id response);
///请求失败的block
typedef void(^IGSRequestFailure)(NSError *error);

///网络请求方式
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
} requestType;


@interface IGSNetworkHelper : RootObject

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

@end
