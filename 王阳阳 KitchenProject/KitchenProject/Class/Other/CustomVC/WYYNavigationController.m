//
//  CSNavigationController.m
//  NewsBoardDemo
//
//  Created by 王阳阳 on 16/4/20.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "WYYNavigationController.h"

@interface WYYNavigationController ()

@end

@implementation WYYNavigationController

//系统的初始化方法
+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//重写父类的push方法 设置返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //将push父类的方法后调是因为方便二级界面的返回标题可以自定义
    if (self.viewControllers.count >0)
    {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"backStretchBackgroundNormal~iphone" addTarget:self action:@selector(leftBarButtonClick:)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}
- (void)leftBarButtonClick:(UIButton *)btn
{
    [self popViewControllerAnimated:YES];
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
