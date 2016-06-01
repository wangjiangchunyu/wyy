//
//  CokingCell.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/3.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "CokingCell.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "CellModel.h"

@implementation CokingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //布局Cell
        [self createView];
    }
    return self;
}
- (void)createView
{
    //创建图片
    self.cellImageView = [[UIImageView alloc] init];
    [self addSubview:self.cellImageView];
    
    //创建图片上的标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.titleLabel];
    
    //创建图片上的标题下的菜谱
    self.menuLabel = [[UILabel alloc]init];
    self.menuLabel.textColor = [UIColor whiteColor];
    self.menuLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.menuLabel];
    
    
    //创建图片下方的内容
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    self.contentLabel.numberOfLines = 3;
    [self addSubview:self.contentLabel];
    //创建图片下方的大标题
    self.bottomLabel = [[UILabel alloc] init];
    self.bottomLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.bottomLabel];
    
    //创建图片下面作家头像
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.rightBtn];
    //创建图片下面作家名字
    self.rightNameLabel = [[UILabel alloc] init];
    self.rightNameLabel.font = [UIFont systemFontOfSize:15];
    self.rightNameLabel.textAlignment = NSTextAlignmentCenter;
    self.rightNameLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.rightNameLabel];
    
}

//重写cellModel的set方法，在此赋值
- (void)setCellObj:(CellModel *)cellObj
{
    [self.cellImageView sd_setImageWithURL:[NSURL URLWithString:cellObj.contentsObj.imageObj.url]];
    self.titleLabel.text = cellObj.contentsObj.title_1st;
    self.menuLabel.text = cellObj.contentsObj.title_2nd;
    
    if (cellObj.contentsObj.desc == nil)
    {
        self.cellImageView.frame = CGRectMake(0, 0, kScreenWidth, 340);
        
        self.titleLabel.center = self.cellImageView.center;
        self.titleLabel.bounds = CGRectMake(0, 0, kScreenWidth-30, 60);
        
        self.menuLabel.frame = CGRectMake(self.titleLabel.center.x-150, self.titleLabel.center.y+20, kScreenWidth-70, 40);
        
        self.contentLabel.hidden = YES;
        self.bottomLabel.hidden = YES;
        self.rightBtn.hidden = YES;
        self.rightNameLabel.hidden = YES;
  
    }else
    {
       self.cellImageView.frame = CGRectMake(0, 0, kScreenWidth, 240);
        
       self.contentLabel.text = cellObj.contentsObj.desc;
        self.contentLabel.frame = CGRectMake(10, self.cellImageView.frame.origin.y+280, kScreenWidth-20, 70);
//        self.contentLabel.backgroundColor = [UIColor redColor];
        
        self.bottomLabel.text = cellObj.contentsObj.title;
        self.bottomLabel.frame = CGRectMake(10, self.cellImageView.frame.origin.y+230, kScreenWidth-20, 70);
//        self.titleLabel.backgroundColor = [UIColor redColor];
        
        self.contentLabel.hidden = NO;
        self.bottomLabel.hidden = NO;
        self.rightBtn.hidden = NO;
        self.rightNameLabel.hidden = NO;
        if (cellObj.contentsObj.authorObj.photo ==nil)
        {
            self.contentLabel.frame = CGRectMake(10, self.cellImageView.frame.origin.y+280, kScreenWidth-15, 70);
            self.bottomLabel.frame = CGRectMake(10, self.cellImageView.frame.origin.y+230, kScreenWidth-80, 70);
            self.rightBtn.hidden = YES;
            self.rightNameLabel.hidden = YES;
        }else
        {
            self.rightBtn.frame = CGRectMake(kScreenWidth-80, 223, 60, 60);
            self.rightBtn.clipsToBounds = YES;
            self.rightBtn.layer.cornerRadius = 30;
//            self.rightBtn.backgroundColor = [UIColor redColor];
            self.rightNameLabel.frame = CGRectMake(self.rightBtn.center.x-50, self.rightBtn.center.y+30, 100, 30);
        }
    }
    self.rightNameLabel.text = cellObj.contentsObj.authorObj.name;
    [self.rightBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:cellObj.contentsObj.authorObj.photo] forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
//头像按钮
- (void)rightBtnClick:(UIButton *)sender
{
    
}

- (void)awakeFromNib {
    // Initialization code
    NSLog(@"asdfghjkl");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
