//
//  UIBarButtonItem+Extension.h
//  NewsBoardDemo
//
//  Created by 王阳阳 on 16/4/19.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

//标题和图片
+ (id)itemWithTitle:(NSString *)title withImageName:(NSString *)imageName addTarget:(id)target action:(SEL)selector;

//标题和颜色
+ (id)itemWithTitle:(NSString *)title withTitleColor:(UIColor *)titleColor addTarget:(id)target action:(SEL)selector;

@end
