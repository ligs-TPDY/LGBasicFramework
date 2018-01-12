//
//  GuideInterfaceViewController.m
//  ZDTQProject
//
//  Created by 李广帅 on 16/8/10.
//  Copyright © 2016年 李广帅. All rights reserved.
//

#import "GuideInterfaceViewController.h"

#define WIDTH self.view.frame.size.width
#define HIGHT self.view.frame.size.height

#import "ScrollHeadView.h"

@interface GuideInterfaceViewController ()
{
    BackToWindow _callBack;
}

@property (nonatomic,strong) ScrollHeadView *scrollHeadView;

@end

@implementation GuideInterfaceViewController

-(void)setBackToWindow:(BackToWindow )callBack
{
    _callBack = callBack;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
        
        
        [self scrollHeadView];

        
    }
    return self;
}

-(ScrollHeadView *)scrollHeadView
{
    if (!_scrollHeadView)
    {
//        NSArray *array = @[@"启动页01",@"启动页02",@"启动页03"];
        /*
            1，加载本地图片时，这里是图片名字
            2，加载网络图片时，这里的参数是网络图片的地址
         */
        NSArray *array = @[@"http://www.tqb2o.com/images/start/start.jpg",
                           @"http://www.tqb2o.com/images/start/start.jpg",
                           @"http://www.tqb2o.com/images/start/start.jpg",
                           @"http://www.tqb2o.com/images/start/start.jpg",
                           @"http://www.tqb2o.com/images/start/start.jpg"];
        NSMutableArray *mutArr = [[NSMutableArray alloc]initWithArray:array];
        
         //参数：1，代表本地。2，代表网络。
        ScrollHeadView *view = [[ScrollHeadView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HIGHT) AndMUTARR:mutArr AndDifference:2];
        
        /*
            回到启动函数中，更改主控制器
         */
        [view setBackToController:^{
            
            _callBack();
        }];
        
        [self.view addSubview:view];
        
        _scrollHeadView = view;
    }
    return _scrollHeadView;
}

@end
