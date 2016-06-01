//
//  RegisterTableData.h
//  注册登录
//
//  Created by Mac on 16/4/28.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface DatabaseModel : FMDatabase
@property (nonatomic,strong)FMDatabase *database;
+(DatabaseModel *)sharData;//创建单例
-(BOOL)insertUserName:(NSString *)userName password:(NSString *)password;//输入的数据是否添加成功
-(BOOL)queryUserWithUserName:(NSString *)userName password:(NSString *)userPassword;//查询对应数据
-(NSMutableArray *)savedNameAndPassword;//获取已保存的所有数据
@end
