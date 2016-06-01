//
//  RegisterTableData.m
//  注册登录
//
//  Created by Mac on 16/4/28.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "DatabaseModel.h"

@implementation DatabaseModel
+(DatabaseModel *)sharData
{
    static DatabaseModel *database;
        if (database==nil) {
            database=[[DatabaseModel alloc]init];
            [database createData];
            [database createUserTable];
        }
        return database;
}
-(void)createUserTable//创建表
{
    NSString *createTableSQL=@"create table if not exists User (userName text primary key,userPassword text)";
    BOOL success=[_database executeUpdate:createTableSQL];
    if (success) {
        NSLog(@"表创建成功");
    }else{
        NSLog(@"表创建失败");
    }
}
-(void)createData//创建数据库
{
    NSString *path=[self createDataPath];
    _database=[FMDatabase databaseWithPath:path];
    if ([_database open]) {
        NSLog(@"打开数据库成功");
    }else{
        NSLog(@"打开数据库失败");
    }
}
-(NSString *)createDataPath//创建数据库路径
{
    NSArray *documents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPath=[[documents firstObject]stringByAppendingPathComponent:@"user.sqlite"];
    NSLog(@"%@",dbPath);
    return dbPath;
}
-(BOOL)insertUserName:(NSString *)userName password:(NSString *)password
{
    NSString *insertSQL=@"insert into User (userName,userPassword) values (?,?)";
    BOOL success=[_database executeUpdate:insertSQL,userName,password];
    return success;
}
-(BOOL)queryUserWithUserName:(NSString *)userName password:(NSString *)userPassword
{
    NSString *selectSQL=@"select * from User where userName=? and userPassword=?";
    FMResultSet *set= [_database executeQuery:selectSQL,userName,userPassword];
    BOOL result=[set next];
    return result;
}
-(NSMutableArray *)savedNameAndPassword
{
    NSMutableArray *mutArr=[NSMutableArray array];
    NSString *selectSQL=@"select userName,userPassword from User";
    FMResultSet *set=[_database executeQuery:selectSQL];
    while ([set next]) {
        NSString *userName=[set stringForColumn:@"userName"];
        NSString *userPassword=[set stringForColumn:@"userPassword"];
        NSArray *arr=[NSArray arrayWithObjects:userName,userPassword, nil];
        [mutArr addObject:arr];
    }
    return mutArr;
}
@end
