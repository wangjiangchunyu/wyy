//
//  DatabaseTool.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/10.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseTool : NSObject

//创建一个数据库
+ (void)createDatabaseAndTable;
//往cell的table表中插入数据
+ (void)insertIntoDataToKitchenTable:(NSArray *)array;
//从cell的表中取数据
+ (NSMutableArray *)selectDataFromKitchenTable;
@end
