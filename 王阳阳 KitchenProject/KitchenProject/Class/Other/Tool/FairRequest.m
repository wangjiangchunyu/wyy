//
//  FairRequest.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 王阳阳. All rights reserved.
//



#import "FairRequest.h"
#import "AFNetWorking.h"

@implementation FairRequest

//设置市集的请求
+ (void)requestFail:(void(^)(NSString *str)) completeBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:@"https://www.xiachufang.com/page/ec-tab/?version=12" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
        if (completeBlock)
        {
            completeBlock(str);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"Fail---error---%@",error);
    }];
    
    
}

@end







