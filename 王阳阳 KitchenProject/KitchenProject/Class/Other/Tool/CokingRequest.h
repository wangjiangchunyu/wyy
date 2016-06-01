//
//  CokingRequest.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 WangYangYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CokingRequest : NSObject

//请求头部的数据
+ (void)requestCoking:(void(^)(NSMutableArray *array))completeBlock;

//请求Cell上数据
+ (void)requestCokingCell:(void(^)(NSMutableArray *array))completeBlock;

//第一次上拉刷新cell上的数据
+ (void)requestFirstUpLoadCokingCell:(void(^)(NSMutableArray *array))completeBlock;

//请求红包的数据
+ (void)requestRedEnvelope:(void(^)(NSMutableArray *array))completeBlock;

@end
