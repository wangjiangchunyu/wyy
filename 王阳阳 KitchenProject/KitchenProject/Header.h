//
//  Header.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/21.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#ifndef Header_h
#define Header_h
/**
 * debug状态下的NSLog 哈哈哈
 */
#ifdef  DEBUG
#define WYYLog(...)    NSLog(__VA_ARGS__)
#else
#define WYYLog(...)
#endif
/**
 *屏幕宽高
 */
#define kScreenBounds [[UIScreen mainScreen] bounds]
#define kScreenHeight kScreenBounds.size.height
#define kScreenWidth kScreenBounds.size.width

/*
 *颜色
 */
#define kRGBColor(r,g,b,a) [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:(a)]


#endif /* Header_h */
