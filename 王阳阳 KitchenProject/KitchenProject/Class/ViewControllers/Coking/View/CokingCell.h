//
//  CokingCell.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/3.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CellModel;

@interface CokingCell : UITableViewCell

@property (nonatomic,retain)UIImageView *cellImageView;
@property (nonatomic,retain)UILabel *titleLabel;
@property (nonatomic,retain)UILabel *menuLabel;
@property (nonatomic,retain)UILabel *contentLabel;
@property (nonatomic,retain)UILabel *bottomLabel;
@property (nonatomic,retain)UIButton *rightBtn;
@property (nonatomic,retain)UILabel *rightNameLabel;

@property (nonatomic,retain)CellModel *cellObj;

@end
