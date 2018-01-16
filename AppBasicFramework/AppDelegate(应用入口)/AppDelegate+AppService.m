//
//  AppDelegate+AppService.m
//  App基础框架
//
//  Created by apple on 17/5/27.
//  Copyright © 2017年 BasicFrameworkFromIGS. All rights reserved.
//

#import "AppDelegate+AppService.h"
//主控制器
#import "MainTabBarController.h"
//友盟分享和统计
#import "UMMobClick/MobClick.h"
#import <UMSocialCore/UMSocialCore.h>
//腾讯bugly
#import <Bugly/Bugly.h>
//引导界面
#import "GuideInterfaceViewController.h"
//友盟的key
#define UMStatisticalAppKey @"59473dfe6e27a447100013ed"

@implementation AppDelegate (AppService)

#pragma mark - ——————— 初始化window ————————
-(void)initWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /*
        ExclusiveTouch的作用是：可以达到同一界面上多个控件接受事件时的排他性,从而避免一些问题。也就是说避免在一个界面上同时点击多个button。
    */
    [[UIButton appearance] setExclusiveTouch:YES];
    
    //判断是否为首次启动或者版本更新
    BOOL isHasFile=[[NSUserDefaults standardUserDefaults] boolForKey:@"FirstStart"];
    if (isHasFile){
        self.window.rootViewController = [[MainTabBarController alloc]init];
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"FirstStart"];
        
        GuideInterfaceViewController *guideInterfaceViewController = [[GuideInterfaceViewController alloc]init];
        self.window.rootViewController = guideInterfaceViewController;
        
        [guideInterfaceViewController setBackToWindow:^{
            self.window.rootViewController = [[MainTabBarController alloc]init];
        }];
    }
}
#pragma mark ————— 友盟统计 初始化 —————
-(void)initUMeng{
    
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    
    UMConfigInstance.appKey = UMStatisticalAppKey;
    UMConfigInstance.channelId = @"App Store";

    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK！
}
#pragma mark ————— 友盟分享  初始化 —————
- (void)initUMengUShare
{
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMStatisticalAppKey];
    
    [self configUSharePlatforms];
}
- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession
                                          appKey:@"wx931c39ba94ed37ca"
                                       appSecret:@"3e222410b863ed5c996e21bade598dc6"
                                     redirectURL:@"http://mobile.umeng.com/social"];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ
                                          appKey:@"1106083951"/*设置QQ平台的appID*/
                                       appSecret:@"tqtPvFoyj0rCehWC"
                                     redirectURL:@"http://mobile.umeng.com/social"];
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
                                          appKey:@"2441330919"
                                       appSecret:@"d56b1a200b5c845026c0192577381ae5"
                                     redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


#pragma mark ————— bugly初始化 —————
-(void)initBugly
{
    [Bugly startWithAppId:@"6c83048fc8"];
}

#pragma mark ————— CocoaLumberjack初始化 —————
- (void)initCocoaLumberjack
{
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    //CocoaLumberjack设置打印日志
    // 添加DDASLLogger，你的日志语句将被发送到Xcode控制台
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    // 添加DDTTYLogger，你的日志语句将被发送到Console.app
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    // 添加DDFileLogger，你的日志语句将写入到一个文件中，默认路径在沙盒的Library/Caches/Logs/目录下，文件名为bundleid+空格+日期.log。
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    //注册消息处理函数的处理方法
    //如此一来，程序崩溃时会自动进入CatchCrash.m的uncaughtExceptionHandler()方法
    InstallUncaughtExceptionHandler();
    
    /**
        当APP再次启动时，会将之前崩溃的日志上传到服务器
     */
    //若crash文件存在，则写入log并上传，然后删掉crash文件
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *errorLogPath = [NSString stringWithFormat:@"%@/Documents/error.log", NSHomeDirectory()];
    GLogInfo(@"\ncrash文件路径%@",errorLogPath);
    
    if ([fileManager fileExistsAtPath:errorLogPath]) {
        //用CocoaLumberJack库的fileLogger.logFileManager自带的方法创建一个新的Log文件，这样才能获取到对应文件夹下排序的Log文件
        [fileLogger.logFileManager createNewLogFile];
        //此处必须用firstObject而不能用lastObject，因为是按照日期逆序排列的，即最新的Log文件排在前面
        NSString *newLogFilePath = [fileLogger.logFileManager sortedLogFilePaths].firstObject;
        NSError *error = nil;
        NSString *errorLogContent = [NSString stringWithContentsOfFile:errorLogPath encoding:NSUTF8StringEncoding error:nil];
        BOOL isSuccess = [errorLogContent writeToFile:newLogFilePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (!isSuccess){
            GLogError(@"crash文件写入log失败: %@", error.userInfo);
        }else{
            GLogInfo(@"crash文件写入log成功");
            NSError *error = nil;
            BOOL isSuccess = [fileManager removeItemAtPath:errorLogPath error:&error];
            if (!isSuccess){
                GLogError(@"删除本地的crash文件失败: %@", error.userInfo);
            }
        }
        
        //上传最近的3个log文件，
        //至少要3个，因为最后一个是crash的记录信息，另外2个是防止其中后一个文件只写了几行代码而不够分析
        NSArray *logFilePaths = [fileLogger.logFileManager sortedLogFilePaths];
        NSUInteger logCounts = logFilePaths.count;
        if (logCounts >= 3){
            for (NSUInteger i = 0; i < 3; i++){
                NSString *logFilePath = logFilePaths[i];
                GLogInfo(@"logFilePath%@",logFilePath);
                
                //上传服务器
                //以读写方式打开，并获取句柄对象
                NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:logFilePath];
                if(handle) //如果文件句柄获取成功,则进行文件操作
                {
                    //文件句柄的读写，都是以二进制数据流的形式进行
                    //-------------1.文件句柄的读操作-------------
                    //从指定游标位置开始一直读取到文件末尾
                    NSData *data1 = [handle readDataToEndOfFile];
                    //NSData-->NSString
                    //数据流转字符串：   参数1:数据流  参数2:编码
                    NSString *str1 = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
                    GLogInfo(@"\n崩溃信息详情%@",str1);
#warning 将崩溃信息上传到服务器
                }
            }
        }else{
            for (NSUInteger i = 0; i < logCounts; i++){
                NSString *logFilePath = logFilePaths[i];
                GLogInfo(@"logFilePath%@",logFilePath);
                //上传服务器
                //以读写方式打开，并获取句柄对象
                NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:logFilePath];
                if(handle) //如果文件句柄获取成功,则进行文件操作
                {
                    //文件句柄的读写，都是以二进制数据流的形式进行
                    //-------------1.文件句柄的读操作-------------
                    //从指定游标位置开始一直读取到文件末尾
                    NSData *data1 = [handle readDataToEndOfFile];
                    //NSData-->NSString
                    //数据流转字符串：   参数1:数据流  参数2:编码
                    NSString *str1 = [[NSString alloc] initWithData:data1 encoding:NSUTF8StringEncoding];
                    GLogInfo(@"崩溃信息详情%@",str1);
#warning 将崩溃信息上传到服务器
                }
            }
        }
    }
}

#pragma mark - --获取到最上层的控制器--
- (UIViewController *)getTopVC
{
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    if (!window) {
        return nil;
    }
    UIView *tempView;
    for (UIView *subview in window.subviews) {
        if ([[subview.classForCoder description] isEqualToString:@"UILayoutContainerView"]) {
            tempView = subview;
            break;
        }
    }
    if (!tempView) {
        tempView = [window.subviews lastObject];
    }
    
    id nextResponder = [tempView nextResponder];
    while (![nextResponder isKindOfClass:[UIViewController class]] || [nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UITabBarController class]]) {
        tempView =  [tempView.subviews firstObject];
        
        if (!tempView) {
            return nil;
        }
        nextResponder = [tempView nextResponder];
    }
    return  (UIViewController *)nextResponder;
}

-(UIViewController *)getCurrentVC
{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}

+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end
