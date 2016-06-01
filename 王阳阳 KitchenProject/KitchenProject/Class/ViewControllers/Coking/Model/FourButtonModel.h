//
//  FourButtonModel.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FourButtonModel : NSObject

@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *picurl;
- (id)initWithFourButtonDic:(NSDictionary *)fourBtnDic;

@end
