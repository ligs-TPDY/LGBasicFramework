//
//  ClickOnTheHeadViewTableViewCell.m
//  ZDTQProject
//
//  Created by 李广帅 on 16/7/23.
//  Copyright © 2016年 李广帅. All rights reserved.
//

#import "ClickOnTheHeadViewTableViewCell.h"

#import "Masonry.h"

@implementation ClickOnTheHeadViewTableViewCell

//自定义tabelView的cell的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //初始化cell上的控件
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        CGFloat width = GScreenWidth;
        
        _label = [[UILabel alloc]init];
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self);
            make.right.mas_equalTo(self).offset(-15);
        }];
        _label.textColor = [UIColor orangeColor];
        _label.textAlignment = NSTextAlignmentRight;
        
        if (width == 414)
        {
            _label.font = [UIFont systemFontOfSize:14];
        }
        if (width == 375)
        {
            _label.font = [UIFont systemFontOfSize:13];
        }
        if (width == 320)
        {
            _label.font = [UIFont systemFontOfSize:11];
        }
    }
    return self;
}
@end
