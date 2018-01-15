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
 */

#ifdef  DEBUG
#define httpNetworkAddress     @"http://192.168.1.251:8080/qjr/"
#else
#define httpNetworkAddress     @"https://www.qianjr.com/"
#endif



#pragma mark - 详细接口地址
/** 获取App Store中有关APP的信息*/
#define GApiAppStore         @"https://itunes.apple.com/lookup?id="
//商店APPID
#define APPID                @"1229015399"
//友盟分享内容
#define UShareContent        @"/app/shareInvite"



#endif /* IGSInterfacedConst_h */
