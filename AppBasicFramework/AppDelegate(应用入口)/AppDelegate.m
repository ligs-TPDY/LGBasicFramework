//
//  AppDelegate.m
//  App基础框架
//
//  Created by apple on 17/5/27.
//  Copyright © 2017年 BasicFrameworkFromIGS. All rights reserved.
//

#import "AppDelegate.h"

#import "AppDelegate+AppService.h"

#import "UMMobClick/MobClick.h"
#import <UMSocialCore/UMSocialCore.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSLog(@"willFinishLaunchingWithOptions(告诉代理进程启动但还没进入状态保存)");
    
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化window
    [self initWindow];
    //初始化友盟统计
    [self initUMeng];
    //初始化友盟分享
    [self initUMengUShare];
    //初始化Bugly(捕获到异常后，CocoaLumber中的异常捕获方法就不会再走了，冲突)
    [self initBugly];
    //初始化CocoaLumjack
    [self initCocoaLumberjack];
    
    NSLog(@"didFinishLaunchingWithOptions(告诉代理启动基本完成程序准备开始运行)");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSLog(@"applicationWillResignActive(当应用程序将要进入非活动状态执行，在此期间，应用程序不接收消息或事件，比如来电话了)");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    NSLog(@"applicationDidEnterBackground(当应用程序入活动状态执行，在此期间，应用程序接收消息或事件)");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    NSLog(@"applicationWillEnterForeground(当程序被推送到后台的时候调用。所以要设置后台继续运行，则在这个函数里面设置即可)");
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    NSLog(@"applicationDidBecomeActive(当程序从后台将要重新回到前台时候调用)");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    
    NSLog(@"applicationWillTerminate(当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作。这个需要要设置UIApplicationExitsOnSuspend的键值。)");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}
- (void)applicationDidFinishLaunching:(UIApplication*)application{
    
    
    NSLog(@"applicationDidFinishLaunching(当程序载入后执行)");
}

#pragma mark - Core Data stack
@synthesize persistentContainer = _persistentContainer;
- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"App____"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
