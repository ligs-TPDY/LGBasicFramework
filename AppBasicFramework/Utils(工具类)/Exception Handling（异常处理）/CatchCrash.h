//
//  CatchCrash.h
//  HuaRJProject
//
//  Created by apple on 17/3/1.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CatchCrash : NSObject
{
    
    BOOL dismissed;
    
}

void HandleException(NSException *exception);
void SignalHandler(int signal);


void InstallUncaughtExceptionHandler(void);

@end
