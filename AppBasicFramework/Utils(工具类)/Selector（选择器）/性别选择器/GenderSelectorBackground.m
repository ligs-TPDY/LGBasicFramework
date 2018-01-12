//
//  GenderSelectorBackground.m
//  HuaRJProject
//
//  Created by apple on 17/3/6.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import "GenderSelectorBackground.h"
#import "ClickOnTheHeadViewTableViewCell.h"
@interface GenderSelectorBackground ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation GenderSelectorBackground

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        [self createTableView];
        
    }
    return self;
}
-(void)createTableView
{
    _tableView = [[UITableView alloc]init];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    _tableView.separatorStyle = NO;
    
    [_tableView registerClass:[ClickOnTheHeadViewTableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = GScreenWidth;
    if (indexPath.row == 4)
    {
        ClickOnTheHeadViewTableViewCell *cellwww = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cellwww.label.text  = @"取消";
        if (width == 414)
        {
            cellwww.textLabel.font = [UIFont systemFontOfSize:14];
        }
        if (width == 375)
        {
            cellwww.textLabel.font = [UIFont systemFontOfSize:13];
        }
        if (width == 320)
        {
            cellwww.textLabel.font = [UIFont systemFontOfSize:11];
        }
        cellwww.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellwww;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"更改性别";
            if (width == 414)
            {
                cell.textLabel.font = [UIFont systemFontOfSize:16];
            }
            if (width == 375)
            {
                cell.textLabel.font = [UIFont systemFontOfSize:15];
            }
            if (width == 320)
            {
                cell.textLabel.font = [UIFont systemFontOfSize:13];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }
        if (indexPath.row == 1)
        {
            cell.textLabel.text = @"男";
        }
        if (indexPath.row == 2)
        {
            cell.textLabel.text = @"女";
        }
        if (indexPath.row == 3)
        {
            cell.textLabel.text = @"保密";
        }
        if (width == 414)
        {
            cell.textLabel.font = [UIFont systemFontOfSize:14];
        }
        if (width == 375)
        {
            cell.textLabel.font = [UIFont systemFontOfSize:13];
        }
        if (width == 320)
        {
            cell.textLabel.font = [UIFont systemFontOfSize:11];
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = GScreenWidth;
    if (width == 414)
    {
        return 44;
    }
    if (width == 375)
    {
        return 40;
    }
    if (width == 320)
    {
        return 33;
    }
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        
        //隐藏选择框
        self.hidden = YES;
        
        //信息同步
        [self userInformationSynchronization:@"男"];
    }
    if (indexPath.row == 2)
    {
        
        //隐藏选择框
        self.hidden = YES;
        
        //信息同步
        [self userInformationSynchronization:@"女"];
    }
    if (indexPath.row == 3)
    {
        
        //隐藏选择框
        self.hidden = YES;
        //信息同步
        [self userInformationSynchronization:@"保密"];
        
    }
    if (indexPath.row == 4)
    {
        //隐藏选择框
        self.hidden = YES;
    }
}
- (void)userInformationSynchronization:(NSString *)str
{
    
    
}
@end
