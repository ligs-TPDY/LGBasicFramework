//
//  DataBaseHelper.h
//  AppBasicFramework
//
//  Created by 李广帅 on 2018/3/3.
//  Copyright © 2018年 IGS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseHelper : NSObject

///单例
+(DataBaseHelper *)sharedInfo;
///建立对应名字的表格
- (BOOL)createTable:(NSString *)tableName;
///增加数据到对应表格（insert into 表名 (属性名2,属性名1) values ('','')）
- (BOOL)insertKeysValues:(NSString *)KeysValues ForTable:(NSString *)tableName;
///删除对应名字和条件的表格数据（delete from Book where age = ‘18’ and name = '张三'）(where为空时删除整张表格)
- (BOOL)delectDataFromTable:(NSString *)tabelName Andwhere:(NSString *)where;
///修改更新对应表格的对应数据（update 表名 set 属性名 = '关键字' where 属性名 = 关键字）
- (BOOL)updateDataFromTable:(NSString *)tableName SetXX:(NSString *)setXX WhereXX:(NSString *)whereXX;
///查询对应表格的对应条件的数据
/// 条件查询
/// select * from stuent where stuname like '%张%'
/// {
///      select * from student where stuno in (1,9) 等价于
///      select * from student where stuno=1 or stuno=9
/// }
/// select * from student where stuno between 1 and 9 范围查询
/// select * from student limit 3  查询前3条
/// select * from student order by stuno desc|asc  降序or升序
/// select * from student order by stuno asc limit 3
/// 模糊查询
/// select 字段名 from 表名 where  属性 like '%关键字%'; rangOfString
///                                         %关键字       endWith
///                                         关键字%      startWith
/// IN查询
/// select 字段名 from 表名 where 字段名 in ('关键字','关键字');
//- (FMResultSet *)selectDataFromTable:(NSString *)tabelName where:(NSString *)where;



@end
