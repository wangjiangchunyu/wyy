//
//  FairRequest.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FairRequest : NSObject

//设置市集的请求
+ (void)requestFail:(void(^)(NSString *str)) completeBlock;

@end
