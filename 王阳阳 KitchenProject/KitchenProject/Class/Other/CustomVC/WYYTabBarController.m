//
//  CSTabBarController.m
//  NewsBoardDemo
//
//  Created by 王阳阳 on 16/4/19.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "WYYTabBarController.h"
#import "WYYNavigationController.h"
#import "CokingViewController.h"
#import "FairViewController.h"
#import "CommunityViewController.h"
#import "MeViewController.h"

@interface WYYTabBarController ()

@end

@implementation WYYTabBarController

//系统的初始化方法
+ (void)initialize
{
    NSDictionary *normalDic = @{
                                NSFontAttributeName:[UIFont systemFontOfSize:14],
                                NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    NSDictionary *selectDic = @{
                                NSFontAttributeName:[UIFont systemFontOfSize:14],
                                NSForegroundColorAttributeName:[UIColor redColor]
                                };
    //统一设定TabBarItem的字体大小及颜色
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectDic forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CokingViewController *vc1 = [[CokingViewController alloc] init];
    [self setUpChildVC:vc1 withTitle:@"下厨房" withNormalImage:@"tabADeselected~iphone" withSelectImage:@"tabASelected~iphone"];
    
    FairViewController *vc2 = [[FairViewController alloc] init];
    [self setUpChildVC:vc2 withTitle:@"市集" withNormalImage:@"tabBDeselected~iphone" withSelectImage:@"tabBSelected~iphone"];
    
    CommunityViewController *vc3 = [[CommunityViewController alloc] init];
    [self setUpChildVC:vc3 withTitle:@"社区" withNormalImage:@"tabCDeselected~iphone" withSelectImage:@"tabCSelected~iphone"];
    
    MeViewController *vc4 = [[MeViewController alloc] init];
    [self setUpChildVC:vc4 withTitle:@"我" withNormalImage:@"tabDDeselected~iphone" withSelectImage:@"tabDSelected~iphone"];
}

//封装各个VC的方法
- (void)setUpChildVC:(UIViewController *)vc withTitle:(NSString *)title withNormalImage:(NSString *)normalImage withSelectImage:(NSString *)selectImage
{
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalImage];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    WYYNavigationController *nav = [[WYYNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
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
