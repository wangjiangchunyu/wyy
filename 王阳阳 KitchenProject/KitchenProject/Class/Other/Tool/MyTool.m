

//
//  MyTool.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/9.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "MyTool.h"
#import "Reachability.h"

@implementation MyTool
+ (BOOL)isHaveWifi {
    Reachability *reach = [Reachability reachabilityWithHostName:@"http://www.baidu.com"];
    if ([reach currentReachabilityStatus]==NotReachable) {
        return NO;
    }
    return YES;
}

@end
