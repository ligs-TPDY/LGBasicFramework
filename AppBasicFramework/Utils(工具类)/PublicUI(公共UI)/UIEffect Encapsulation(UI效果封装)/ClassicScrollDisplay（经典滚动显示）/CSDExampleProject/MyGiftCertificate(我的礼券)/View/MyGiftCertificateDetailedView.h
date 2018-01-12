//
//  MyGiftCertificateDetailedView.h
//  LCTProject
//
//  Created by 李广帅 on 2017/10/26.
//  Copyright © 2017年 YongXing. All rights reserved.
//

#import "RootView.h"

@interface MyGiftCertificateDetailedView : RootView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *MGTableView;
@property (nonatomic,assign) CGFloat type;
@property (nonatomic,strong) NSMutableArray *mutArrForGiftList;
@end
