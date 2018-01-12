//
//  GuideInterfaceViewController.h
//  ZDTQProject
//
//  Created by 李广帅 on 16/8/10.
//  Copyright © 2016年 李广帅. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackToWindow)();

@interface GuideInterfaceViewController : UIViewController

-(void)setBackToWindow:(BackToWindow )callBack;

@end
