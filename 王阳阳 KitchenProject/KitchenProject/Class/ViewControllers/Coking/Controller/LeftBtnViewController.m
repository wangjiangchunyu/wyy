//
//  LeftBtnViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "LeftBtnViewController.h"

@interface LeftBtnViewController ()

@end

@implementation LeftBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"菜谱名称";
    
    //创建导航栏按钮
    [self createNavItem];
    
    //布局UI
    [self createView];
    
}
- (void)createNavItem
{
    //创建导航栏左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"取消" withTitleColor:kRGBColor(1, 0, 0, 1) addTarget:self action:@selector(leftBtnClick:)];
    //创建导航栏右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"下一步" withTitleColor:kRGBColor(1, 0, 0, 1) addTarget:self action:@selector(rightBtnClick:)];
}
//取消按钮点击事件
- (void)leftBtnClick:(UIButton *)leftBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}
//下一步按钮点击事件
- (void)rightBtnClick:(UIButton *)rightBtn
{
    NSLog(@"下一步按钮被点击了");
}

- (void)createView
{
    //创建输入框
    UITextField *textField = [[UITextField alloc] init];
    textField.center = CGPointMake(self.view.center.x, self.view.center.y-180);
    textField.bounds = CGRectMake(0, 0, kScreenWidth-20, 30);
    textField.placeholder = @"在此添加菜谱名称";
    textField.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textField];
    
    //创建菜谱的人都是厨房里的天使label
    UILabel *label = [[UILabel alloc] init];
    label.center = CGPointMake(self.view.center.x, self.view.center.y-150);
    label.bounds = CGRectMake(0, 0, 300, 30);
    label.text = @"(创建菜谱的人都是厨房里的天使)";
    label.textColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.alpha = 0.6;
    [self.view addSubview:label];
    
    //创建草稿箱按钮
    UIButton *draftsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    draftsBtn.center = CGPointMake(self.view.center.x, self.view.center.y+343);
    draftsBtn.bounds = CGRectMake(0, 0, kScreenWidth, 50);
    draftsBtn.backgroundColor = kRGBColor(1, 0, 0, 0.7);
    [draftsBtn setTitle:@"草稿箱" forState:UIControlStateNormal];
    [draftsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [draftsBtn addTarget:self action:@selector(draftsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:draftsBtn];
    
}
#pragma mark 草稿箱按钮点击事件
- (void)draftsBtnClick:(UIButton *)btn
{
    //NSLog(@"草稿箱按钮被点击了");
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
