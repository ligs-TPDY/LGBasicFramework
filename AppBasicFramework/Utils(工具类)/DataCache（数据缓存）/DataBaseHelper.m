//
//  DataBaseHelper.m
//  AppBasicFramework
//
//  Created by 李广帅 on 2018/3/3.
//  Copyright © 2018年 IGS. All rights reserved.
//

#import "DataBaseHelper.h"
#import <FMDatabase.h>
@interface DataBaseHelper()
{
    FMDatabase *_database;
}
@end

@implementation DataBaseHelper
//单例
+(DataBaseHelper *)sharedInfo
{
    static DataBaseHelper *data = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [[DataBaseHelper alloc]init];
    });
    
    return data;
}
//创建指定名字的table
- (BOOL)createTable:(NSString *)tableName
{
    return [self createTabelFromName:tableName];
}

#pragma mark - ----------------createDatabase-----------------
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createDatabse];
    }
    return self;
}
//拼接数据库存储路径
- (NSString *)dbPath
{
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [documents firstObject];
    NSString *db = [documentsPath stringByAppendingString:@"/XJD.db"];
    return db;
}
//打开指定路径的数据库
- (void)createDatabse
{
    _database = [FMDatabase databaseWithPath:[self dbPath]];
    BOOL success = [_database open];
    if (success){
        NSLog(@"数据库打开成功");
    }else{
        NSLog(@"数据库打开失败");
    }
}
//创建指定名字的table
- (BOOL)createTabelFromName:(NSString *)tabelName
{
    NSString *createSQL = [NSString stringWithFormat:@"create table if not exists %@(id integer primary key, title text, director_name text, pic text)",tabelName];
    BOOL success = [_database executeUpdate:createSQL];
    if (success) {
        NSLog(@"%@创建成功",tabelName);
    }else{
        NSLog(@"%@创建失败",tabelName);
    }
    return success;
}
///增加数据到对应表格（insert into 表名 (属性名2,属性名1) values ('','')）
- (BOOL)insertKeysValues:(NSString *)KeysValues ForTable:(NSString *)tableName
{
    NSString *insertSQL = [NSString stringWithFormat:@"insert into %@ %@",tableName,KeysValues];
    BOOL success = [_database executeUpdate:insertSQL];
    if (success){
        NSLog(@"%@插入%@成功",tableName,KeysValues);
    }else{
        NSLog(@"%@插入%@失败",tableName,KeysValues);
    }
    return success;
}
//删除指定名字的table
-(BOOL)delectTabel:(NSString *)tabelName
{
    NSString *deleteSQL = [NSString stringWithFormat:@"delete from %@",tabelName];
    BOOL success = [_database executeUpdate:deleteSQL,tabelName];
    if (success) {
        NSLog(@"%@删除成功",tabelName);
    }else{
        NSLog(@"%@删除失败",tabelName);
    }
    return success;
}
//根据条件删除数据
- (BOOL)delectDataFromTable:(NSString *)tabelName Andwhere:(NSString *)where
{
    NSString *deleteSQL = nil;
    if (where) {
        deleteSQL = [NSString stringWithFormat:@"delete from %@ where %@",tabelName,where];
    }else{
        deleteSQL = [NSString stringWithFormat:@"delete from %@",tabelName];
    }
    BOOL success = [_database executeUpdate:deleteSQL,tabelName];
    if (success) {
        NSLog(@"%@删除成功",tabelName);
    }else{
        NSLog(@"%@删除失败",tabelName);
    }
    return success;
}
///修改更新对应表格的对应数据
- (BOOL)updateDataFromTable:(NSString *)tableName SetXX:(NSString *)setXX WhereXX:(NSString *)whereXX;
{
    NSString *updateSQL = [NSString stringWithFormat:@"update %@ set %@ where %@",tableName,setXX,whereXX];
    BOOL success = [_database executeUpdate:updateSQL];
    if (success){
        NSLog(@"%@更新%@的%@成功",tableName,whereXX,setXX);
    }else{
        NSLog(@"%@更新%@的%@失败",tableName,whereXX,setXX);
    }
    return success;
}
///查询对应表格的对应条件的数据
- (FMResultSet *)selectDataFromTable:(NSString *)tabelName where:(NSString *)where
{
    NSString *selectSQL = [NSString stringWithFormat:@"select * from %@ where %@",tabelName,where];
    FMResultSet *set = [_database executeQuery:selectSQL];
    return set;
}

@end
