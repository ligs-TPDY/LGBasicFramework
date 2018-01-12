//
//  MGDTableViewCell.h
//  LCTProject
//
//  Created by 李广帅 on 2017/10/27.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGModel.h"
@interface MGDTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *MGDImgViewForBackGround;
@property (nonatomic,strong) UILabel *MGDLabelForTital;
@property (nonatomic,strong) UILabel *MGDLabelForMoney;
@property (nonatomic,strong) UILabel *MGDLabelForInvestmentAmount;
@property (nonatomic,strong) UILabel *MGDLabelForInvestmentLimit;
@property (nonatomic,strong) UILabel *MGDLabelForValidPeriod;
@property (nonatomic,strong) UILabel *MGDLabelForUseImmediately;

@property (nonatomic,strong) MGModel *model;

@end
