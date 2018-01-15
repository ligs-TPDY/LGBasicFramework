//
//  AppDelegate+Routes.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2018/1/15.
//  Copyright © 2018年 IGS. All rights reserved.
//

#import "AppDelegate+Routes.h"
#import "JLRoutes.h"
@implementation AppDelegate (Routes)

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options
{
    return [JLRoutes routeURL:url];
}

- (void)registeredRoute
{
    //navigation Push规则
    [[JLRoutes globalRoutes] addRoute:@"/NaviPush/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        UIViewController *currentVc = [self currentViewController];
        UIViewController *v = [[NSClassFromString(parameters[@"controller"]) alloc] init];
        [self paramToVc:v param:parameters];
        [currentVc.navigationController pushViewController:v animated:YES];
        return YES;
    }];
}
-(void)paramToVc:(UIViewController *) v param:(NSDictionary<NSString *,NSString *> *)parameters{
    //runtime将参数传递至需要跳转的控制器
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(v.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [v setValue:param forKey:key];
        }
    }
}
/**
 *获取当前控制器
 */
-(UIViewController *)currentViewController{
    
    return [self getCurrentUIVC];
}
@end
