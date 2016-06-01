//
//  CommunityCell.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/27.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommunityCell : UITableViewCell
//左上角图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView_LeftTop_Phone;
//上边图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView_Top_Phone;
//左下角图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView_LeftBottom_Phone;
//下边图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView_Bottom_Phone;
//标题
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//内容
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;




@end
