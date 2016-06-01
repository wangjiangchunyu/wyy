//
//  FourButtonModel.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "FourButtonModel.h"

@implementation FourButtonModel

- (id)initWithFourButtonDic:(NSDictionary *)fourBtnDic
{
    self = [super init];
    if (self)
    {
        self.url = fourBtnDic[@"url"];
        self.name = fourBtnDic[@"name"];
        self.picurl = fourBtnDic[@"picurl"];
    }
    return self;
}

@end
