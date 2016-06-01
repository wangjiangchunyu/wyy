//
//  LeftButtonModel.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "LeftButtonModel.h"

@implementation LeftButtonModel

- (id)initWithLeftButtonDic:(NSDictionary *)leftButtonDic
{
    self = [super init];
    if (self)
    {
        self.pop_recipe_picurl = leftButtonDic[@"pop_recipe_picurl"];
    }
    return self;
}

@end
