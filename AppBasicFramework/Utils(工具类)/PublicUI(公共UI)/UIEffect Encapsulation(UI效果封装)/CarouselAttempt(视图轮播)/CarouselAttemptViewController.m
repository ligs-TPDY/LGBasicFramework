//
//  CarouselAttemptViewController.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/7.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "CarouselAttemptViewController.h"
#import "CarouselAttemptView.h"
@interface CarouselAttemptViewController ()

@end

@implementation CarouselAttemptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *mutarr = [[NSMutableArray alloc]initWithObjects:@"http://192.168.1.251:8080/hyjr/static-uploads/public/2017-11/1-20171124-105332423.jpg",@"http://192.168.1.251:8080/lct/static-uploads/public/2017-10/1-20171030-195338578.png",@"http://192.168.1.251:8080/lct/static-uploads/public/2017-11/1-20171129-135853372.jpg",@"http://192.168.1.251:8080/hyjr/static-uploads/public/2017-11/1-20171124-105338862.jpg",@"http://192.168.1.251:8080/hyjr/static-uploads/public/2017-11/1-20171124-105345475.jpg", nil];
    
    CarouselAttemptView * RollingView = [CarouselAttemptView rollingViewWithFrame:CGRectMake(0, 0, GScreenWidth, GSDistance(200)) RollingStyle:RollingStyleNetwork Data:mutarr IntervalTime:2 action:^(NSInteger index){
        //回调，可以达到当前点击图片的下标进行相应的操作
        
    }];
    [self.view addSubview:RollingView];
    //根据当前图片的颜色来渲染当前view的背景色
    [UIImage mainColorFromImage:mutarr.firstObject View:self.view];
    //每次滚动一张，则渲染一次背景颜色
    [RollingView setCallback:^(NSString *str) {
        //根据当前图片的颜色来渲染当前view的背景色
        [UIImage mainColorFromImage:str View:self.view];
    }];
}

@end
