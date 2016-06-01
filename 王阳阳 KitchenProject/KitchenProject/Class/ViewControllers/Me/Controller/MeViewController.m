//
//  MeViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/21.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "MeViewController.h"
#import "MeSecondViewController.h"

@interface MeViewController ()

@property(nonatomic, strong)UISearchBar *searchBar;

@end

@implementation MeViewController

//当视图将要出现的时候push到下一界面
- (void)viewWillAppear:(BOOL)animated
{
//    [super viewWillAppear:animated];
//    MeSecondViewController *vc = [[MeSecondViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    MeSecondViewController *vc = [[MeSecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    //创建导航控制器上的按钮
    [self createNavBarItem];
    
}

- (void)createNavBarItem
{
    //创建左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"navFindFriendsImage~iphone"addTarget:self action:@selector(leftBarButtonItemClick:)];
    
    //创建右边的按钮
    //self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"rightPageSetting~iphone" addTarget:self action:@selector(rightBarButtonItemClick:)];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"timg.jpg" addTarget:self action:@selector(rightBarButtonItemClick:)];
}
//左边按钮点击事件
- (void)leftBarButtonItemClick:(UIButton *)btn
{
    
    
    
}
//右边按钮点击事件
//- (void)rightBarButtonItemClick:(UIButton *)btn
//{
//    
//}



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
