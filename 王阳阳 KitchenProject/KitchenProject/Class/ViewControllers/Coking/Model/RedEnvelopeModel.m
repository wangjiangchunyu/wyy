//
//  RedEnvelopeModel.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "RedEnvelopeModel.h"

@implementation RedEnvelopeModel

- (id)initRedEnvelopeDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        self.url = dic[@"url"];
    }
    return self;
}

@end
