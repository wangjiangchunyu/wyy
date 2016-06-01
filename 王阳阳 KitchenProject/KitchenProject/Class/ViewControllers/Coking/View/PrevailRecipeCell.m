//
//  PrevailRecipeCell.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "PrevailRecipeCell.h"

@implementation PrevailRecipeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //布局UI
        [self createView];
    }
    return self;
}

- (void)createView
{
    //设置图片
    UIImageView *topImage = [[UIImageView alloc] init];
    topImage.backgroundColor = [UIColor cyanColor];
    topImage.frame = CGRectMake(0, 0, kScreenWidth, 200);
    [self addSubview:topImage];
    
    //设置标题
    UILabel *maxLabel = [[UILabel alloc] init];
    maxLabel.frame = CGRectMake(10, 205, kScreenWidth-80, 40);
    maxLabel.text = @"BigTitle";
    maxLabel.font = [UIFont systemFontOfSize:23];
    maxLabel.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:maxLabel];
    
    //设置多少人做过
    UILabel *scoreLabel = [[UILabel alloc] init];
    scoreLabel.frame = CGRectMake(10, 250, 100, 20);
    scoreLabel.text = @"Score";
    scoreLabel.font = [UIFont systemFontOfSize:15];
    scoreLabel.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:scoreLabel];
    
    //设置头像
    UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame = CGRectMake(kScreenWidth-70, 190, 50, 50);
    //headBtn.backgroundColor = [UIColor yellowColor];
    headBtn.clipsToBounds = YES;
    headBtn.layer.cornerRadius = 25;
    [headBtn addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:headBtn];
    //设置头像的名字
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.center = CGPointMake(headBtn.center.x, headBtn.center.y+40);
    nameLabel.bounds = CGRectMake(0, 0, 60, 20);
    nameLabel.text = @"Name";
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:nameLabel];
    
}
- (void)headBtnClick:(UIButton *)btn
{
    NSLog(@"本周欢迎中的头像被点击了");
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
