//
//  RootModelView.h
//  AppBasicFramework
//
//  Created by IOS on 2017/7/17.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RootViewController.h"

@interface RootViewModel : RootObject

//统一解析网络
+ (BOOL)unifiedAnalyticNetwork:(id)response Controller:(RootViewController *)controller;

@end
