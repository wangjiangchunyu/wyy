//
//  CSAlertView.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/7.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "WYYAlertView.h"

@interface WYYAlertView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)UITableView *tableView;

@end

@implementation WYYAlertView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.frame = kScreenBounds;
        self.backgroundColor = kRGBColor(0, 0, 0, 0.2);
        //创建tableView
        [self createView];
    }
    return self;
}
- (void)createView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.center = self.center;
    self.tableView.bounds = CGRectMake(0, 0, kScreenWidth-40, kScreenHeight-140);
    self.tableView.clipsToBounds = YES;
    self.tableView.layer.cornerRadius = 10;
    [self addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
#pragma mark------------TableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITextField *topTF = [[UITextField alloc] init];
    topTF.frame = CGRectMake(0, 0, 100, 50);
    topTF.placeholder = @"搜索 国家/地区";
    topTF.backgroundColor = [UIColor redColor];
    
    return topTF;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view == self)
    {
        [self removeFromSuperview];
    }
}
- (void)persentTableView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
