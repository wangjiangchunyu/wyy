//
//  CokingRequest.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 WangYangYang. All rights reserved.
//


#import "CokingRequest.h"
#import "AFNetWorking.h"
#import "LeftButtonModel.h"
#import "FourButtonModel.h"
#import "CellModel.h"
#import "RedEnvelopeModel.h"

@implementation CokingRequest

//请求头部的数据
+ (void)requestCoking:(void(^)(NSMutableArray *array))completeBlock
{
//    AFNetworkReachabilityManager *afManager = [AFNetworkReachabilityManager manager];
//    NSLog(@"Reachability***%ld",afManager.networkReachabilityStatus);
    NSMutableArray *maxArr = [NSMutableArray array];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.xiachufang.com/v2/init_page_v5.json?timezone=Asia%2FShanghai&api_sign=68aeeb939943f67b51a886af151b2b2b&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&version=5.2.2" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSDictionary *dic = responseObject;
        NSDictionary *contentDic = dic[@"content"];
//        NSLog(@"contentDic---%@",contentDic);
        
        //左上按钮
        LeftButtonModel *leftObj = [[LeftButtonModel alloc] initWithLeftButtonDic:contentDic];
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObject:leftObj];
        [maxArr addObject:arr];
        
        //四个按钮
        NSArray *fourArr = contentDic[@"navs"];
        //WYYLog(@"======%@",fourArr);
        NSMutableArray *fourMutableArr = [NSMutableArray array];
        for (NSDictionary *fourDic in fourArr)
        {
            FourButtonModel *fourBtnObj = [[FourButtonModel alloc] initWithFourButtonDic:fourDic];
            [fourMutableArr addObject:fourBtnObj];
        }
        [maxArr addObject:fourMutableArr];
        
        if (completeBlock)
        {
            completeBlock(maxArr);
        }

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"coking--error--%@",error);
    }];
}

//请求Cell上数据
+ (void)requestCokingCell:(void(^)(NSMutableArray *array))completeBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=554adc185b559ebf74f227679e15afb1&sk=z00zJGwoQSS53CR6h04P2w&size=2&timezone=Asia%2FShanghai&version=5.2.3&api_key=0f9f79be1dac5f003e7de6f876b17c00" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSDictionary *dic = responseObject;
//        NSLog(@"cell----%@",dic);
        NSDictionary *contentDic = dic[@"content"];
        NSArray *issuesArr = contentDic[@"issues"];
        NSDictionary *itemDic = [issuesArr firstObject];
        NSArray *itemArr = itemDic[@"items"];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in itemArr)
        {
            CellModel *cellObj = [[CellModel alloc] initWithDic:dic];
            [array addObject:cellObj];
        }
        if (completeBlock)
        {
            completeBlock(array);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"cell-error---%@",error);
    }];
}

//第一次上拉刷新cell上的数据
+ (void)requestFirstUpLoadCokingCell:(void(^)(NSMutableArray *array))completeBlock {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://api.xiachufang.com/v2/issues/list.json?cursor=2016-05-08&origin=iphone&api_sign=7cdd9334cd8f61e9d38503f1f0dc3bde&size=2&timezone=Asia%2FShanghai&version=5.3.3&api_key=0f9f79be1dac5f003e7de6f876b17c00" parameters:nil constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        //        NSLog(@"cell----%@",dic);
        NSDictionary *contentDic = dic[@"content"];
        NSArray *issuesArr = contentDic[@"issues"];
        NSDictionary *itemDic = [issuesArr firstObject];
        NSArray *itemArr = itemDic[@"items"];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in itemArr)
        {
            CellModel *cellObj = [[CellModel alloc] initWithDic:dic];
            [array addObject:cellObj];
        }
        if (completeBlock)
        {
            completeBlock(array);
        }
     
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}





//请求红包的数据
+ (void)requestRedEnvelope:(void(^)(NSMutableArray *array))completeBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.xiachufang.com/v2/ad/show.json?slot_name=homepage_banner_ad1&height=172.5&origin=iphone&api_sign=f2dfd7fcfcee24a68b589a1f73064b21&width=690&supported_types=1&version=5.2.2&api_key=0f9f79be1dac5f003e7de6f876b17c00" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSDictionary *dic = responseObject;
        NSDictionary *contentDic = dic[@"content"];
        NSDictionary *ad_infoDic = contentDic[@"ad_info"];
        NSMutableArray *array = [NSMutableArray array];
        RedEnvelopeModel *redObj = [[RedEnvelopeModel alloc] initRedEnvelopeDic:ad_infoDic];
        [array addObject:redObj];
        if (completeBlock)
        {
            completeBlock(array);
        }
   
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"red--error---%@",error);
    }];
}

@end
