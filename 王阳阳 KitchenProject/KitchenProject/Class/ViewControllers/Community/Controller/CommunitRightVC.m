//
//  CommunitRightVC.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/6.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "CommunitRightVC.h"

@interface CommunitRightVC ()

@end

@implementation CommunitRightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"消息";
    //创建导航栏右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"设置" withTitleColor:kRGBColor(1, 0, 0, 1) addTarget:self action:@selector(rightBtnClick:)];
    
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
- (void)rightBtnClick:(UIButton *)btn
{
    NSLog(@"设置按钮被点击了");
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
