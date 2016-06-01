//
//  CommunityRequest.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "CommunityRequest.h"
#import "AFNetWorking.h"

@implementation CommunityRequest

//请求社区的URL
+ (void)requestCommunity:(void(^)(NSMutableArray *array))completeBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"v2/social/init_page.json?origin=iphone&longitude=116.302625&api_sign=a853053285b17f8eea07e00143eed77b&sk=z00zJGwoQSS53CR6h04P2w&latitude=40.035940&version=5.2.2&api_key=0f9f79be1dac5f003e7de6f876b17c00" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSDictionary *dic = responseObject;
        NSLog(@"communtity---%@",dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"Communtity-error--%@",error);
    }];
    
    
}

@end
