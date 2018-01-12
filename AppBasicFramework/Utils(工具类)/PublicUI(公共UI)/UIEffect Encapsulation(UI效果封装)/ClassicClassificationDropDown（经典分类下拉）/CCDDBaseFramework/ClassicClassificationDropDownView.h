//
//  ClassicClassificationDropDownView.h
//  LCTProject
//
//  Created by 李广帅 on 2017/10/27.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassicClassificationDropDownView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UILabel *CCLabelForLeft;
@property (nonatomic,strong) UILabel *CCLabelForRight;
@property (nonatomic,strong) UIImageView *CCImgViewForLeft;
@property (nonatomic,strong) UIImageView *CCImgViewForRight;
@property (nonatomic,strong) UITableView *CCTableView;


@property (nonatomic,strong) UIView *fatherView;
@property (nonatomic,assign) BOOL isOpen;
@property (nonatomic,assign) NSInteger selectRow;
@property (nonatomic,assign) NSInteger selectLeftRow;
@property (nonatomic,assign) NSInteger selectRightRow;
@property (nonatomic,assign) NSInteger selectLeftOrRight;

@property (nonatomic,strong) NSMutableArray *mutArr;
@property (nonatomic,strong) NSArray *array1;
@property (nonatomic,strong) NSArray *array2;

+ (ClassicClassificationDropDownView *)createSunViewOnFatherView:(UIView *)fatherView;

@property (nonatomic,copy) backForUpperLevelWithString callback;
- (void)setCallback:(backForUpperLevelWithString)callback;

@end
