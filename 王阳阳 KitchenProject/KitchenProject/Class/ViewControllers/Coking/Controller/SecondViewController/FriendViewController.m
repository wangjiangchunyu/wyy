//
//  FriendViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "FriendViewController.h"
#import "WYYCameraVC.h"
@interface FriendViewController ()

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"关注动态";
    self.view.backgroundColor = [UIColor whiteColor];
    //创建导航条上的按钮
    [self createNavBarItem];
    
    //布局UI
    [self createView];
}
- (void)createNavBarItem
{
    //创建右边的两个按钮
    UIBarButtonItem *rightBellBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"notification~iphone"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBellBtnClick:)];
    UIBarButtonItem *rightCameraBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"creatdishicon~iphone"] style:UIBarButtonItemStylePlain target:self action:@selector(rightCameraBtnClick:)];
    [self.navigationItem setRightBarButtonItems:@[rightBellBtn,rightCameraBtn]];

}
#pragma mark - 响铃按钮的点击事件
- (void)rightBellBtnClick:(UIButton *)sender
{
    //WYYLog(@"铃铛按钮被点击了");
}
#pragma mark - 相加按钮的点击事件
- (void)rightCameraBtnClick:(UIButton *)cameraBtn
{
    WYYCameraVC *cameraVC = [[WYYCameraVC alloc] init];
    [self.navigationController pushViewController:cameraVC animated:YES];
}

- (void)createView
{
    //创建你还没有关注过厨友
    UILabel *label = [[UILabel alloc] init];
    label.center = CGPointMake(self.view.center.x, self.view.center.y-200);
    label.bounds = CGRectMake(0, 0, 200, 40);
//    label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"你还没有关注过厨友";
    [self.view addSubview:label];
    
    //创建添加厨友按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.center = CGPointMake(self.view.center.x, self.view.center.y-170);
    btn.bounds = CGRectMake(0, 0, 200, 30);
    [btn setTitle:@"试着去添加一些厨友吧" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
//试着去添加一些厨友吧按钮点击事件
- (void)btnClick:(UIButton *)btn
{
    WYYLog(@"试着去添加一些厨友吧按钮被点击了");
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
