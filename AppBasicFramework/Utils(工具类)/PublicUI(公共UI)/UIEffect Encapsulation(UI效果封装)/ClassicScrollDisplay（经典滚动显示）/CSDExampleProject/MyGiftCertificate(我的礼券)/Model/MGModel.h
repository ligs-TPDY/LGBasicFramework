//
//  MGModel.h
//  LCTProject
//
//  Created by 李广帅 on 2017/11/1.
//  Copyright © 2017年 YongXing. All rights reserved.
//

@interface MGModel : RootModel
//起投金额单位
@property (nonatomic,strong) NSString *accountUnit;
//红包金额单位
@property (nonatomic,strong) NSString *amountUnit;
//红包有效期
@property (nonatomic,strong) NSString *endTime;

//距离红包过期的天数，如果为负表示已经过期
@property (nonatomic,assign) int days;
//起投金额
@property (nonatomic,assign) int accountValue;
//红包金额
@property (nonatomic,assign) CGFloat amountValue;
//起投期限（单位天）
@property (nonatomic,assign) int minBidLimit;

@property (nonatomic,strong) NSString *requirement;
//红包状态（0=无效，1=有效，2=使用中，3=已用完）
@property (nonatomic,assign) int status;
@property (nonatomic,strong) NSString *statusLabel;

//红包的主键id,投标的主键Id
@property (nonatomic,assign) int ID;

//投资金额
@property (nonatomic,strong) NSString *bidAccount;
//使用红包或者金券金额
@property (nonatomic,strong) NSString *money;
//使用时间
@property (nonatomic,strong) NSString *addTime_;
//投标的标题
@property (nonatomic,strong) NSString *title;
//使用的是投资红包还是体验金券
@property (nonatomic,strong) NSString *type;
//年化lilv
@property (nonatomic,strong) NSString *apr;

//区分红包和礼券
@property (nonatomic,assign) int isGift;

//平台
@property (nonatomic,strong) NSString *from;
@end
