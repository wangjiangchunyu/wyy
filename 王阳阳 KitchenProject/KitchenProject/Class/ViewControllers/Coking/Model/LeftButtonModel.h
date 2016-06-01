//
//  LeftButtonModel.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeftButtonModel : NSObject

@property (nonatomic,copy)NSString *pop_recipe_picurl;
- (id)initWithLeftButtonDic:(NSDictionary *)leftButtonDic;

@end
