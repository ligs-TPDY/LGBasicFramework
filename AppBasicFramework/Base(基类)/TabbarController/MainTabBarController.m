//
//  MainTabBarController.m
//  App基础框架
//
//  Created by apple on 17/5/27.
//  Copyright © 2017年 BasicFrameworkFromIGS. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()
//子控制器名字
@property (nonatomic,strong) NSArray *childControllerNames;
//标题
@property (nonatomic,strong) NSArray *titles;
//未选中图片
@property (nonatomic,strong) NSArray *normalImageNames;
//选中时的图片
@property (nonatomic,strong) NSArray *selectImageNames;

@end

@implementation MainTabBarController
//懒加载初始化数组
-(NSArray *)childControllerNames
{
    if (!_childControllerNames)
    {
        _childControllerNames = @[@"OneSectionViewController",
                                  @"TowSectionViewController",
                                  @"ThreeSectionViewController",
                                  @"FourSectionViewController"];
    }
    return _childControllerNames;
}
//标题
-(NSArray *)titles
{
    if (!_titles)
    {
        _titles = @[@"首页",@"理财",@"我的",@"更多"];
    }
    return _titles;
}
//没有选中时的图标
-(NSArray *)normalImageNames
{
    if (!_normalImageNames)
    {
        _normalImageNames = @[@"OneSection1",@"TowSection1",@"ThreeSection1",@"FourSection1"];
    }
    return _normalImageNames;
}
//选中时的图标
-(NSArray *)selectImageNames
{
    if (!_selectImageNames)
    {
        _selectImageNames = @[@"OneSection2",@"TowSection2",@"ThreeSection2",@"FourSection2"];
    }
    return _selectImageNames;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建UITabBar的子控制器
    [self createChildController];
    //选中时的颜色
    self.tabBar.tintColor = Color244c191c27;
}
//利用反射的方式创建子控制器对象（亮点）
-(void)createChildController
{
    for (int i = 0; i < self.childControllerNames.count; i++)
    {
        //获得类名字符串
        NSString *className = self.childControllerNames[i];
        //由字符串得到类
        Class cls = NSClassFromString(className);
        //创建类对象
        UIViewController *object = [[cls alloc] init];
        //        object.view.backgroundColor = [UIColor redColor];
        //设置表头
        object.title = self.titles[i];
        //设置图片
        object.tabBarItem.image = [UIImage imageNamed:self.normalImageNames[i]];
        
        object.tabBarItem.selectedImage = [[UIImage imageNamed:self.selectImageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:object];
        
        [self addChildViewController:nav];
    }
}

@end
