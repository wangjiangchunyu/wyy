//
//  MeSecondViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/6.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "MeSecondViewController.h"
#import "LoginViewController.h"
#import "PhoneViewController.h"
#import "RegistViewController.h"

@interface MeSecondViewController ()

@end

@implementation MeSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    
    //布局UI
    [self createView];
    //self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"timg.jpg" addTarget:self action:@selector(rightBarButtonItemClick:)];
    
}
- (void)rightBarButtonItemClick:(UIButton *)sender {
    
}
- (void)createView
{
    //创建取消按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(15, 20, 40, 30);
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //创建图片
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo~iphone"]];
    image.center = CGPointMake(self.view.center.x, self.view.center.y-180);
    image.bounds = CGRectMake(0, 0, 150, 80);
    [self.view addSubview:image];
    
    //创建登录按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.center = CGPointMake(self.view.center.x, self.view.center.y+200);
    loginBtn.bounds = CGRectMake(0, 0, kScreenWidth-30, 40);
    loginBtn.clipsToBounds = YES;
    loginBtn.layer.cornerRadius = 5;
    loginBtn.backgroundColor = kRGBColor(1, 0, 0, 0.6);
    [loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //创建手机注册按钮
    UIButton *handsetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    handsetBtn.center = CGPointMake(self.view.center.x, self.view.center.y+250);
    handsetBtn.bounds = CGRectMake(0, 0, kScreenWidth-30, 40);
    handsetBtn.clipsToBounds = YES;
    handsetBtn.layer.cornerRadius = 5;
    handsetBtn.backgroundColor = kRGBColor(0, 0, 1, 0.5);
    [handsetBtn setTitle:@"注册" forState:UIControlStateNormal];
    [handsetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [handsetBtn addTarget:self action:@selector(handsetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:handsetBtn];
    
}
//登录按钮点击事件
- (void)loginBtnClick:(UIButton *)loginBtn
{
    LoginViewController *vc = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//手机注册按钮点击事件
- (void)handsetBtnClick:(UIButton *)handsetBtn
{
    RegistViewController *registVC = [[RegistViewController alloc] init];
//    PhoneViewController *vc = [[PhoneViewController alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
}

//取消按钮点击事件
- (void)buttonClick:(UIButton *)btn
{
    NSInteger index = [[[NSUserDefaults standardUserDefaults] objectForKey:@"tab"] integerValue];
    self.tabBarController.selectedViewController = self.tabBarController.viewControllers[index];
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
