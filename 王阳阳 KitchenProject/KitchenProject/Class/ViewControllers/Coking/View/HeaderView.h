//
//  HeaderView.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/28.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderViewDelegate;

@interface HeaderView : UIView

@property (nonatomic,retain)NSMutableArray *maxArr;
@property (nonatomic,retain)NSMutableArray *leftBtnArr;
@property (nonatomic,retain)NSMutableArray *fourBtnArr;
@property (nonatomic,retain)NSMutableArray *redArr;
@property (nonatomic,assign) id<HeaderViewDelegate> delegate;

@end

//代理区头的事件
@protocol HeaderViewDelegate <NSObject>

@required
//进入本周流行菜谱界面
- (void)createTopOneButtonClick;
//进入查看好友并关注界面
- (void)createTopTwoButtonClick;
//进入排行榜界面
- (void)getIntoLeaderboardViewController;
//进入看视频界面界面
- (void)getIntoVideoViewController;
//进入买卖界面
- (void)getIntoBuyViewController;
//进入菜谱分类界面
- (void)getINtoMenuViewController;
//进入scrollView的界面
- (void)getIntoScrollViewController;

@end