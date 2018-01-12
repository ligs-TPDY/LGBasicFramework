//
//  TransactionRecordTableViewCell.h
//  LCTProject
//
//  Created by 李广帅 on 2017/10/30.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionRecordTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *TRLabelForSource;
@property (nonatomic,strong) UILabel *TRLabelForMoney;
@property (nonatomic,strong) UILabel *TRLabelForTime;
@property (nonatomic,strong) UILabel *TRLabelForBalance;

@end
