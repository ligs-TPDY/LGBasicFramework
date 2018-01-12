//
//  IGSInterfacedConst.h
//  AppBasicFramework
//
//  Created by apple on 2017/6/16.
//  Copyright © 2017年 IGS. All rights reserved.
//

#ifndef IGSInterfacedConst_h
#define IGSInterfacedConst_h
/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever 0
#define TestSever    0
#define ProductSever 1

#if DevelopSever
/** 接口前缀-开发服务器*/
#define GApiPrefix  @"接口服务器的请求前缀 例: http://192.168.10.10:8080"
#elif TestSever
/** 接口前缀-测试服务器*/
#define GApiPrefix  @"https://www.baidu.com"
#elif ProductSever
/** 接口前缀-生产服务器*/
#define GApiPrefix  @"https://www.sztianjinsuo.com/"
#endif



#pragma mark - 详细接口地址
/** 获取App Store中有关APP的信息*/
#define GApiAppStore         @"https://itunes.apple.com/lookup?id="
//商店APPID
#define APPID                @"1229015399"
//友盟分享内容
#define UShareContent        @"/app/shareInvite"



#endif /* IGSInterfacedConst_h */
