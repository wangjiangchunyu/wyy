//
//  DatabaseTool.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/10.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "DatabaseTool.h"
#import "FMDatabase.h"
#import "CellModel.h"
static FMDatabase *__db = nil;
@implementation DatabaseTool
/*
 @property (nonatomic,retain)UIImageView *cellImageView;
 @property (nonatomic,retain)UILabel *titleLabel;
 @property (nonatomic,retain)UILabel *menuLabel;
 @property (nonatomic,retain)UILabel *contentLabel;
 @property (nonatomic,retain)UILabel *bottomLabel;
 @property (nonatomic,retain)UIButton *rightBtn;
 @property (nonatomic,retain)UILabel *rightNameLabel;
 */
//创建一个数据库
+ (void)createDatabaseAndTable {
    if (__db == nil) {
        __db = [[FMDatabase alloc] initWithPath:[NSHomeDirectory()stringByAppendingPathComponent:@"Documents/database.sqlite"]];
        WYYLog(@"%@",NSHomeDirectory());
    }
    [__db open];
    NSString *createStr = @"create table if not exists KitchenTable(userID integer primary key autoincrement,url text,title_1st text,title_2nd text,title text,desc text,photo text,name text) ";
    [__db executeUpdate:createStr];
}
//往cell的table表中插入数据
+ (void)insertIntoDataToKitchenTable:(NSArray *)array {
    for (NSInteger i = 0; i<array.count; i ++) {
        CellModel *obj = array[i];
        NSString *insertStr = [NSString stringWithFormat:@"insert into KitchenTable (url,title_1st,title_2nd,title,desc,photo,name) values ('%@','%@','%@','%@','%@','%@','%@')",obj.contentsObj.imageObj.url,obj.contentsObj.title_1st,obj.contentsObj.title_2nd,obj.contentsObj.title,obj.contentsObj.desc,obj.contentsObj.authorObj.photo,obj.contentsObj.authorObj.name];
        [__db executeUpdate:insertStr];
    }
    
}
//从cell的表中取数据
+ (NSMutableArray *)selectDataFromKitchenTable {
    NSString *select = @"select * from KitchenTable";
    FMResultSet *set = [__db executeQuery:select];
    NSMutableArray *array = [NSMutableArray array];
    while ([set next]) {
        CellModel *obj = [[CellModel alloc] initWithFMResult:set];
        [array addObject:obj];
    }
    [set close];
    return array;
}





@end







