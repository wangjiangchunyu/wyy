//
//  RightViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/6.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"购物车";
    //布局UI
    [self createView];
}
- (void)createView
{
    //创建页面label
    UILabel *maxLabel = [[UILabel alloc] init];
    maxLabel.center = CGPointMake(self.view.center.x, self.view.center.y-200);
    maxLabel.bounds = CGRectMake(0, 0, 200, 40);
    maxLabel.text = @"这个页面是空的";
    maxLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:maxLabel];
    //创建别的label
    UILabel *label = [[UILabel alloc] init];
    label.center = CGPointMake(self.view.center.x, self.view.center.y-175);
    label.bounds = CGRectMake(0, 0, 200, 30);
    label.text = @"去别的地方看看吧";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:label];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
