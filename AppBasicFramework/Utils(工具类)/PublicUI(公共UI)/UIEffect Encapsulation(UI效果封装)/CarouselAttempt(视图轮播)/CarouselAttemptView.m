//
//  CarouselAttemptView.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2017/12/7.
//  Copyright © 2017年 IGS. All rights reserved.
//

#import "CarouselAttemptView.h"
#import <UIImageView+WebCache.h>
#define kBGColor [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1]
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define  kPageHeight 20  // 指示器高度
#define kSpacing 10  // 指示器距离底部高度
#define kPageIndicatorTintColor [UIColor lightGrayColor]  // 指示器的颜色
#define kCurrentPageIndicatorTintColor [UIColor whiteColor]//当前页码指示器颜色
#define kIntervalTime 2 // 自动翻页时间
#define kPlaceholderImageName @"image0" // 占位图片名

@interface CarouselAttemptView ()<UISearchBarDelegate, UIScrollViewDelegate>
/** scrollView */
@property(nonatomic, strong) UIScrollView *scrollView;
/** 指示器 */
@property(nonatomic, strong) UIPageControl *pageControl;
// 定时器
@property (nonatomic, strong) NSTimer *timer;
//时间间隔
@property (nonatomic, assign) int IntervalTime;
@property (nonatomic,assign) CGFloat oldContentOffsetX;
@end
@implementation CarouselAttemptView
void(^_action)(NSInteger index);
CarouselAttemptView *_rollingView;
RollingStyle _style; // 记录样式
NSArray *_data; // 记录传入的数组
CGRect _frame; // 记录尺寸
+ (instancetype)rollingViewWithFrame:(CGRect)frame RollingStyle:(RollingStyle)style Data:(NSArray *)data IntervalTime:(int)intervalTime action:(void(^)(NSInteger index))action; {
    _rollingView = [[CarouselAttemptView alloc] initWithFrame:frame];
    _style = style;
    _data = data;
    _frame = frame;
    _action = action;
    _rollingView.IntervalTime = intervalTime;
    return _rollingView;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self addScrollView];
}
#pragma mark - 添加ScrollView
- (void)addScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView = scrollView;
    scrollView.backgroundColor = kBGColor;
    [self addSubview:scrollView];
    // 设置控制器成为代理
    _scrollView.delegate = self;
    // 图片的数量
    switch (_style) {
        case RollingStyleLocal: { // 本地
            for(int i = 0; i < _data.count+2; i++){
                // 添加一张图片
                // 1. 实例化 UIImageView
                CGFloat imageViewX = i * kScreenW;
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, 0, kScreenW, _frame.size.height)];
                // 2. 设置图片
                
                if (i == _data.count) {
                    imageView.image = [UIImage imageNamed:_data.firstObject];
                }else if (i < _data.count){
                    imageView.image = [UIImage imageNamed:_data[i]];
                }
                [self addButtonWithView:imageView index:i];
                // 3. 添加imageView 到 scrollView上
                [_scrollView addSubview:imageView];
            }
        }break;
        case RollingStyleNetwork: { // 网络
            for(int i = 0; i < _data.count+2; i++){
                // 添加一张图片
                // 1. 实例化 UIImageView
                CGFloat imageViewX = i * kScreenW;
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, 0, kScreenW, _frame.size.height)];
                // 2. 设置图片
                if (i == _data.count) {
                    //                    NSLog(@"%@",_data.firstObject);
                    [imageView sd_setImageWithURL:[NSURL URLWithString:_data.firstObject] placeholderImage:[UIImage imageNamed:kPlaceholderImageName]];
                }else if (i < _data.count){
                    [imageView sd_setImageWithURL:[NSURL URLWithString:_data[i]] placeholderImage:[UIImage imageNamed:kPlaceholderImageName]];
                }
                [self addButtonWithView:imageView index:i];
                // 3. 添加imageView 到 scrollView上
                [_scrollView addSubview:imageView];
            }
        }break;
    }
    // 设置scrollView的contentSize
    _scrollView.contentSize = CGSizeMake(kScreenW * (_data.count + 1), 0);
    // 隐藏水平滚动指示器
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 设置分页属性
    // 分页是通过 scrollView的width 来确定，这样的话，当滑动的时候，图片被滑动一半的时候，图片会立即切换成新的图片
    _scrollView.pagingEnabled = YES;
    [self addPageControl];
    // 创建一个定时器
    [self startTimer];
}
- (void)addButtonWithView:(UIView *)view index:(NSInteger)index{
    view.userInteractionEnabled = YES;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenW, _frame.size.height)];
    btn.tag = index;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}
- (void)btnClick:(UIButton *)btn {
    NSInteger index;
    if (btn.tag == _data.count) {
        index = 0;
    } else {
        index = btn.tag;
    }
    _action(index);
}
#pragma mark - 添加指示器
- (void)addPageControl {
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, _frame.size.height -  kPageHeight - kSpacing, kScreenW,  kPageHeight);
    _pageControl = pageControl;
    // UIPageControl
    // 设置显示几个点
    _pageControl.numberOfPages = _data.count;
    // 取消用户点击事件
    _pageControl.userInteractionEnabled = NO;
    // 当前在第几个点
    _pageControl.currentPage = 0;
    // 指示器的颜色
    _pageControl.pageIndicatorTintColor = kPageIndicatorTintColor;
    // 设置 当前页码指示器颜色
    _pageControl.currentPageIndicatorTintColor = kCurrentPageIndicatorTintColor;
    [self addSubview:pageControl];
}
- (void)startTimer {
    // scheduled 计划
    /**
     scheduledTimerWithTimeInterval 间隔
     target     通过谁调用下面的方法
     selector   方法
     userInfo  : 传递的参数
     repeats : 是否重复执行 方法
     */
    _timer = [NSTimer scheduledTimerWithTimeInterval:_IntervalTime
                                              target:self
                                            selector:@selector(changeImage)
                                            userInfo:nil
                                             repeats:YES];
    // 调整timer 的优先级
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    [mainLoop addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)changeImage {
    [self.scrollView setContentOffset:CGPointMake((self.pageControl.currentPage+1)*kScreenW, 0) animated:YES];
}
- (void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    BOOL isRight = self.oldContentOffsetX < point.x;
    self.oldContentOffsetX = point.x;
    // 开始显示最后一张图片的时候切换到第二个图
    if (point.x > kScreenW*(_data.count-1)+kScreenW*0.5 && !self.timer) {//从最后一个图片会到第一个图片
        self.pageControl.currentPage = 0;
    }else if (point.x > kScreenW*(_data.count-1) && self.timer && isRight){
        self.pageControl.currentPage = 0;
    }else{
        self.pageControl.currentPage = (point.x + kScreenW*0.5) / kScreenW;
    }
    // 开始显示第一张图片的时候切换到倒数第二个图
    if (point.x >= kScreenW*_data.count) {
        //HWScreenW+point.x-HWScreenW*(self.count+1)
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }else if (point.x < 0) {
        [scrollView setContentOffset:CGPointMake(point.x+kScreenW*(_data.count), 0) animated:NO];
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (_callback) {
        NSLog(@"%@",_data[self.pageControl.currentPage]);
        NSString *str = _data[self.pageControl.currentPage];
        _callback(str);
    }
}
/** 手指开始拖动的时候, 就让计时器停止 invalidate  无效 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 让计时器无效
    //    [_timer invalidate];
    [self stopTimer];
}

/** 手指离开屏幕的时候, 就让计时器开始工作 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    // 让计时器开始工作
    // fire , 马上执行, 方法, 不会等间隔时间
    // 如果 timer 调用了 invalidate 方法, time就不存在了, 需要再次创建
    //    [_timer fire];
    [self startTimer];
}

@end
