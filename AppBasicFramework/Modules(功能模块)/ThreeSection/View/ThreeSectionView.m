//
//  ThreeSectionView.m
//  AppBasicFramework
//
//  Created by apple on 2017/6/22.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "ThreeSectionView.h"
#import "ScanQrCodeViewController.h"
@interface ThreeSectionView ()

@end

@implementation ThreeSectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIViewController *vc = [self viewController];
    ScanQrCodeViewController *scan = [[ScanQrCodeViewController alloc]init];
    [vc.navigationController pushViewController:scan animated:YES];
}
FATHER_VIEW
@end
