//
//  NSString+Extension.m
//  NewsBoardDemo
//
//  Created by 王阳阳 on 16/4/20.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

//重写stringWidth的get方法
- (CGFloat)stringWidth
{
    CGFloat width = [self boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25]} context:nil].size.width;
    
    return width;
}

@end
