//
//  PromptBounced.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/22.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "PromptBounced.h"

@implementation PromptBounced

+ (void)popUpPromptBounced:(NSString *)message
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(message, nil)
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"好的"
                                          otherButtonTitles:nil, nil];
    [alert show];
}
@end
