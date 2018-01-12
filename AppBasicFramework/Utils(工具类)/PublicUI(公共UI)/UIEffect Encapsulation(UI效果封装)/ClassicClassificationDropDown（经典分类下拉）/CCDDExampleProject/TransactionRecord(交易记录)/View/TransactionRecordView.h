//
//  TransactionRecordView.h
//  LCTProject
//
//  Created by 李广帅 on 2017/10/27.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "RootView.h"

@interface TransactionRecordView : RootView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *TRTableView;

@property (nonatomic,strong) NSMutableArray *mutArrForLoanList;


@property (nonatomic,copy) backForUpperLevelWithString callback;
- (void)setCallback:(backForUpperLevelWithString)callback;
@end
