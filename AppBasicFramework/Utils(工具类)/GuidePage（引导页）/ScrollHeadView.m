//
//  ScrollHeadView.m
//  customScrollView
//
//  Created by mac on 16/8/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ScrollHeadView.h"

#define WIDTH self.frame.size.width

@interface ScrollHeadView()<UIScrollViewDelegate>
{
    BackToController _callback;
    
    UIScrollView *_scrollView;
    UIPageControl *_page;
    NSTimer *_time;
    CGFloat _COUNT;
    NSMutableArray *_mutArr;
}
@end

@implementation ScrollHeadView

-(void)setBackToController:(BackToController )callBack
{
    _callback = callBack;
}

- (instancetype)initWithFrame:(CGRect)frame AndMUTARR:(NSMutableArray *)mutArr AndDifference:(CGFloat )count;
{
    if (self=[super initWithFrame:frame])
    {
        _COUNT = mutArr.count;
        _mutArr = mutArr;
        
        //创建滚动视图
        [self creatScrollerAndPageControll:frame];
        
        if (count == 1){
            [self LoadLocalImage];
        }
        if (count == 2){
            [self LoadNetworkImage];
        }
    }
    return self;
}
//创建滚动视图
- (void)creatScrollerAndPageControll:(CGRect )frame
{
    _scrollView = [[UIScrollView alloc] initWithFrame:frame];
    _scrollView.contentSize = CGSizeMake(WIDTH * _COUNT, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    //显示第一张图片
    _scrollView.contentOffset = CGPointMake(0, 0);
    [self addSubview:_scrollView];
    
    
    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(0,self.frame.origin.y + self.frame.size.height - 30, WIDTH, 30)];
    //设置页数
    _page.numberOfPages = _COUNT;
    _page.backgroundColor = [UIColor lightGrayColor];
    //未走的颜色
    _page.pageIndicatorTintColor = [UIColor redColor];
    //当前page的颜色
    _page.currentPageIndicatorTintColor = [UIColor greenColor];
    [_page addTarget:self action:@selector(imageMove) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_page];
    
    //定时器
    _time = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(go) userInfo:nil repeats:YES];
}
//加载本地图片
- (void)LoadLocalImage
{
    //i = 0 放第四张图片
    //i = 1 ...4 1-4张图片
    //i = 5 放第一张图片
    for(int i = 0; i < _COUNT; i++)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i * WIDTH, 0, WIDTH, self.frame.size.height)];
        
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",_mutArr[i]]];
        
        [_scrollView addSubview:imgView];
    }
}
//加载网络视图
- (void)LoadNetworkImage
{
    //i = 0 放第四张图片
    //i = 1 ...4 1-4张图片
    //i = 5 放第一张图片
    for(int i = 0; i < _COUNT; i++)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i * WIDTH, 0, WIDTH, self.frame.size.height)];
        
//        加载网络图片
        NSURL *url = [NSURL URLWithString:_mutArr[i]];
        //不存在缓存的图片加载方法
        NSData *data = [[NSData alloc]initWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc]initWithData:data];
        [imgView setImage:img];
        
         //加载本地图片
         //        imageV.image = [UIImage imageNamed:_arraySource[i]];
        
         /*
         图片是从网络上加载的（存在缓存，如果图片需要实时更新的话，就不要用这个方法。用苹果原生的控件和方法）
         注意此时数组中存的应该是图片正确的下载网址否则不可用,并且需要导入第三方库(SDWebImage),及其头文件(#import "UIImageView+WebCache.h")否则无法使用网络资源
         [_imageV sd_setImageWithURL:[NSURL URLWithString:array[i]]];
         */
        
        //存在缓存的图片加载方法
//        加载网络图片
//        NSURL *url = [NSURL URLWithString:_mutArr[i]];
//        [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"启动页01"]];
        
        [_scrollView addSubview:imgView];
    }
}

//pageControl
- (void)imageMove
{
    [_scrollView setContentOffset:CGPointMake((_page.currentPage + 1) * self.frame.size.width, 0) animated:YES];
}

//定时器
- (void)go
{
    if (_scrollView.contentOffset.x + WIDTH <= (_mutArr.count-1) * WIDTH)
    {
        
        [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + WIDTH, 0) animated:YES];
    }
    if (_scrollView.contentOffset.x + WIDTH > (_mutArr.count-1) * WIDTH)
    {
        
        if (_callback)
        {
            _callback();
        }
    }
    
}


//手动滑动图片时触发
//图片停止移动时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / WIDTH;
    
    _page.currentPage = index;
    
    _time.fireDate = [NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]];
}


//动画结束后调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / WIDTH;
  
    _page.currentPage = index;
}


@end
