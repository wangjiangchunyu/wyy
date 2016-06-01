//
//  UIBarButtonItem+Extension.m
//  NewsBoardDemo
//
//  Created by 王阳阳 on 16/4/19.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (id)itemWithTitle:(NSString *)title withImageName:(NSString *)imageName addTarget:(id)target action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 上 左 下 右
    // [button setContentEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
//    button.width = 60;
//    button.height = 30;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    button.height = 50;
    button.width = button.currentTitle.stringWidth + button.currentImage.size.width;
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

//标题和颜色
+ (id)itemWithTitle:(NSString *)title withTitleColor:(UIColor *)titleColor addTarget:(id)target action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.height = 50;
    button.width = button.currentTitle.stringWidth + button.currentImage.size.width;
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc] initWithCustomView:button];
}

@end
