//
//  EachBigBankList.h
//  HuaRJProject
//
//  Created by apple on 17/3/8.
//  Copyright © 2017年 华融佳电子有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackToEachBigBankListbackground)();

@interface EachBigBankList : UIView

- (void)setBackToEachBigBankListbackground:(BackToEachBigBankListbackground )callback;

//存储所有信息
@property (nonatomic,strong) NSMutableArray *mutArrForAll;

@property (nonatomic,strong) NSMutableDictionary *dic;

@end
