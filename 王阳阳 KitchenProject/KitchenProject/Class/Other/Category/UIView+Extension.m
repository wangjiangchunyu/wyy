//
//  UIView+Extension.m
//  NewsBoardDemo
//
//  Created by 王阳阳 on 16/4/19.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

//重写height的set和get方法
- (void)setHeight:(CGFloat)height
{
//  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
- (CGFloat)height
{
    return self.frame.size.height;
}

//重写width的set和get方法
- (void)setWidth:(CGFloat)width
{
//  self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

//重写x坐标的set和get方法
- (void)setX:(CGFloat)x
{
//    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}

//重写用坐标的set和get方法
- (void)setY:(CGFloat)y
{
//    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}

@end
