//
//  FairViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/21.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "FairViewController.h"
#import "FairRequest.h"
#import "LeftViewController.h"
#import "RightViewController.h"

@interface FairViewController ()

@property(nonatomic, strong)UISearchBar *searchBar;

@end

@implementation FairViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //记录tabBar的次数
    NSInteger index = self.tabBarController.selectedIndex;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:index] forKey:@"tab"];
    
    self.view.backgroundColor = kRGBColor(0.4, 0.2, 0.2, 1.0);
    //创建导航控制器上的按钮
    [self createNavBarItem];
    
    //创建WebView
    [self createWebView];
}

- (void)createWebView
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:webView];
    NSURL *url = [NSURL URLWithString:@"http://www.xiachufang.com/page/ec-tab/?version=12"];
    NSURLRequest *requst = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requst];

}


- (void)createNavBarItem
{
    //创建左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"leftPageButtonBackgroundNormal~iphone" addTarget:self action:@selector(leftBarButtonItemClick:)];
    
    //创建右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"shoppingCart~iphone" addTarget:self action:@selector(rightBarButtonItemClick:)];
    
    //设置导航条中间的搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:self.navigationItem.titleView.bounds];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal ;
    _searchBar.placeholder = @"搜索 商品";
    self.navigationItem.titleView = _searchBar;
    //让搜索框放弃第一响应
    //    [self.searchBar resignFirstResponder];
    
}

//左边按钮点击事件
- (void)leftBarButtonItemClick:(UIButton *)btn
{
//    LeftViewController *leftVC = [[LeftViewController alloc] init];
//    [self.navigationController pushViewController:leftVC animated:YES];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.xiachufang.com"]];
    
}
//右边按钮点击事件
- (void)rightBarButtonItemClick:(UIButton *)btn
{
    RightViewController *vc = [[RightViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
