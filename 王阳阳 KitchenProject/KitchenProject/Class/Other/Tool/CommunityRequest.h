//
//  CommunityRequest.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 WangYangYang. All rights reserved.

/*社区URL
 @"v2/social/init_page.json?origin=iphone&longitude=116.302625&api_sign=a853053285b17f8eea07e00143eed77b&sk=z00zJGwoQSS53CR6h04P2w&latitude=40.035940&version=5.2.2&api_key=0f9f79be1dac5f003e7de6f876b17c00"*/

#import <Foundation/Foundation.h>

@interface CommunityRequest : NSObject

//请求社区的URL
+ (void)requestCommunity:(void(^)(NSMutableArray *array))completeBlock;

@end
