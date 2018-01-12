//
//  ClassicClassificationDropDownView.m
//  LCTProject
//
//  Created by 李广帅 on 2017/10/27.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "ClassicClassificationDropDownView.h"
#import "ClassicClassificationDropDownTableViewCell.h"

static NSInteger height = 590;

@implementation ClassicClassificationDropDownView

+ (ClassicClassificationDropDownView *)createSunViewOnFatherView:(UIView *)fatherView;
{
    ClassicClassificationDropDownView *sunView = [[ClassicClassificationDropDownView alloc]init];
    sunView.translatesAutoresizingMaskIntoConstraints = NO;
    [fatherView addSubview:sunView];
    [sunView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(fatherView).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.top.right.left.mas_equalTo(fatherView);
        make.height.mas_equalTo(GSDistance(35));
    }];
    
    sunView.fatherView = fatherView;
    
    return sunView;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor =RGB(178.0, 178.0, 178.0, 0.5);
//        self.backgroundColor = [UIColor whiteColor];
        
        _array1 = @[@"充值",@"奖励",@"其他"];
        _array2 = @[@"投资",@"提现",@"其他"];
        _mutArr = [[NSMutableArray alloc]init];
        
        _selectRow = 0.0;
        
        UIView *viewLeft = [[UIView alloc]init];
        viewLeft.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:viewLeft];
        [viewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(self);
            make.width.mas_equalTo(GScreenWidth/2);
            make.height.mas_equalTo(GSDistance(35));
        }];
        viewLeft.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tapForLeft = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLeft)];
        viewLeft.userInteractionEnabled = YES;
        [viewLeft addGestureRecognizer:tapForLeft];
        
        UIView *viewLine = [[UIView alloc]init];
        viewLine.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:viewLine];
        [viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viewLeft).offset(GSDistance(5));
            make.bottom.mas_equalTo(viewLeft).offset(GSDistance(-5));
            make.left.mas_equalTo(viewLeft.mas_right).offset(GSDistance(-0.8));
            make.width.mas_equalTo(GSDistance(0.8));
        }];
        viewLine.backgroundColor = RGB(232.0, 232.0, 232.0, 1.0);
        
        UIView *viewRight = [[UIView alloc]init];
        viewRight.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:viewRight];
        [viewRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.mas_equalTo(self);
            make.width.mas_equalTo(GScreenWidth/2);
            make.height.mas_equalTo(GSDistance(35));
        }];
        viewRight.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *tapForRight = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickRight)];
        viewRight.userInteractionEnabled = YES;
        [viewRight addGestureRecognizer:tapForRight];
        
        UIView *viewBottomLine = [[UIView alloc]init];
        viewBottomLine.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:viewBottomLine];
        [viewBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(viewLeft);
            make.left.right.mas_equalTo(self);
            make.height.mas_equalTo(0.8);
        }];
        viewBottomLine.backgroundColor = RGB(232.0, 232.0, 232.0, 1.0);
        
        _CCLabelForLeft = [UILabel initForLabelWithFatherView:self Size:15 Color:RGB(53.0, 53.0, 53.0, 1.0) Tital:@"00"];
        [_CCLabelForLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(viewLeft.mas_centerX).offset(GSDistance(6));
            make.top.bottom.mas_equalTo(viewLine);
            make.width.mas_equalTo(50);
        }];
        _CCLabelForLeft.text = @"收入";
        _CCLabelForLeft.textAlignment = NSTextAlignmentRight;
        
        _CCImgViewForLeft = [self createImgView];
        [_CCImgViewForLeft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(viewLeft.mas_centerX).offset(GSDistance(8));
            make.centerY.mas_equalTo(viewLeft);
            make.height.mas_equalTo(7);
            make.width.mas_equalTo(10);
        }];
        [_CCImgViewForLeft setImage:[UIImage imageNamed:@"icon_as_sjx"]];
        
        _CCLabelForRight = [UILabel initForLabelWithFatherView:self Size:15 Color:RGB(53.0, 53.0, 53.0, 1.0)Tital:@"00"];
        [_CCLabelForRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(viewRight.mas_centerX).offset(GSDistance(6));
            make.top.bottom.mas_equalTo(viewLine);
            make.width.mas_equalTo(50);
        }];
        _CCLabelForRight.text = @"支出";
        _CCLabelForRight.textAlignment = NSTextAlignmentRight;
        
        _CCImgViewForRight = [self createImgView];
        [_CCImgViewForRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(viewRight.mas_centerX).offset(GSDistance(8));
            make.centerY.mas_equalTo(viewRight);
            make.height.mas_equalTo(7);
            make.width.mas_equalTo(10);
        }];
        [_CCImgViewForRight setImage:[UIImage imageNamed:@"icon_as_sjx"]];
        
        [self CCTableView];
    }
    return self;
}
- (UITableView *)CCTableView
{
    _CCTableView = [[UITableView alloc]init];
    _CCTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_CCTableView];
    [_CCTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(GSDistance(35), 0, 0, 0));
    }];
    
    if (@available(iOS 11.0, *)){
        _CCTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    _CCTableView.delegate = self;
    _CCTableView.dataSource = self;
    
    //    _AVTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    _CCTableView.estimatedRowHeight = 0;
    _CCTableView.estimatedSectionHeaderHeight = 0;
    _CCTableView.estimatedSectionFooterHeight = 0;
    
    _CCTableView.backgroundColor = RGB(255.0, 255.0, 255.0, 1.0);
    
    [_CCTableView registerClass:[ClassicClassificationDropDownTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    return _CCTableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _mutArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return GSDistance(45);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassicClassificationDropDownTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == _selectRow) {
        cell.CCLabelForTital.textColor = RGB(0.0, 204.0, 255.0, 1.0);
        cell.CCImgView.hidden = NO;
    }else{
        cell.CCLabelForTital.textColor = RGB(53.0, 53.0, 53.0, 1.0);
        cell.CCImgView.hidden = YES;
    }
    
    if (indexPath.row < _mutArr.count) {
        cell.CCLabelForTital.text = _mutArr[indexPath.row];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectRow = indexPath.row;
    
    if (_selectLeftOrRight == 0) {
        _selectLeftRow = indexPath.row;
    }
    if (_selectLeftOrRight == 1) {
        _selectRightRow = indexPath.row;
    }
    
    [tableView reloadData];
    
    [self leftMoveBack];
    [self rightMoveBack];
    _isOpen = !_isOpen;
    
    if (_callback) {
        if (_selectLeftOrRight == 0) {
            _callback([NSString stringWithFormat:@"%ld",indexPath.row + 1]);
        }
        if (_selectLeftOrRight == 1) {
            _callback([NSString stringWithFormat:@"%ld",indexPath.row + 4]);
        }
    }
    
}
#pragma mark --事件--
- (void)clickLeft
{
    _mutArr = _array1;
    
    _selectLeftOrRight = 0;
    
    if (_isOpen) {
        [self leftMoveBack];
        [self rightMoveBack];
        _isOpen = !_isOpen;
    }else{
        [self leftMove];
        _isOpen = !_isOpen;
    }
    
    _selectRow = _selectLeftRow;
    [_CCTableView reloadData];
}
- (void)clickRight
{
    _mutArr = _array2;
    
    _selectLeftOrRight = 1;
    
    if (_isOpen) {
        [self leftMoveBack];
        [self rightMoveBack];
        _isOpen = !_isOpen;
    }else{
        [self rightMove];
        _isOpen = !_isOpen;
    }
    
    _selectRow = _selectRightRow;
    [_CCTableView reloadData];
}
- (void)leftMove
{
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(GSDistance(height));
    }];
    _CCLabelForLeft.textColor = RGB(0.0, 204.0, 255.0, 1.0);
    
    [UIView animateWithDuration:0.2 animations:^{
        _CCImgViewForLeft.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
- (void)leftMoveBack
{
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(GSDistance(35));
    }];
    _CCLabelForLeft.textColor = RGB(53.0, 53.0, 53.0, 1.0);
    
    [UIView animateWithDuration:0.2 animations:^{
        _CCImgViewForLeft.transform = CGAffineTransformMakeRotation(0);
    }];
}
- (void)rightMove
{
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(GSDistance(height));
    }];
    _CCLabelForRight.textColor = RGB(0.0, 204.0, 255.0, 1.0);
    
    [UIView animateWithDuration:0.2 animations:^{
        _CCImgViewForRight.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
- (void)rightMoveBack
{
    _CCLabelForRight.textColor = RGB(53.0, 53.0, 53.0, 1.0);
    
    [UIView animateWithDuration:0.2 animations:^{
        _CCImgViewForRight.transform = CGAffineTransformMakeRotation(0);
    }];
}
- (UIImageView *)createImgView
{
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:imgView];
    
    return imgView;
}
@end
