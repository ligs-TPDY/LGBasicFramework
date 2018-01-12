//
//  AppDelegate.h
//  App基础框架
//
//  Created by apple on 17/5/27.
//  Copyright © 2017年 BasicFrameworkFromIGS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

