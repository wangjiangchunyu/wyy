//
//  CommunityViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/21.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "CommunityViewController.h"
#import "CommunityCell.h"
#import "CommunityRequest.h"
#import "CommentViewController.h"
#import "CommunitRightVC.h"


@interface CommunityViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)UITableView *tableView;

@end

@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //记录tabBar的次数
    NSInteger index = self.tabBarController.selectedIndex;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:index] forKey:@"tab"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //创建导航栏右边的按钮
    [self createNavRightBarBtn];
    
    //创建导航条左边的相机按钮
    //[self createNavLeftbar];
    //创建TableView
    [self createTableView];
    
    
    //创建意见反馈
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.center = CGPointMake(self.view.center.x, self.view.center.y+300);
    btn.bounds = CGRectMake(0, 0, 100, 30);
    [btn setTitle:@"意见反馈" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
//创建导航栏右边的按钮
- (void)createNavRightBarBtn
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"notification~iphone" addTarget:self action:@selector(rightBarButtonItemClick:)];
}
#pragma mark - 导航条左边相机按钮的点击事件
//- (void)createNavLeftbar {
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"creatdishicon~iphone" addTarget:self action:@selector(leftBarButtonItemClick:)];
//}
- (void)btnClick:(UIButton *)sender
{
    CommentViewController *vc = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - 导航条左边按钮的点击事件
- (void)leftBarButtonItemClick:(UIButton *)sender {
    
}
//创建TableView
- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"CommunityCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}
#pragma mark--------TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommunityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //定义cell的下线
    UIView *lbl = [[UIView alloc] init];
    lbl.frame = CGRectMake(cell.frame.origin.x, cell.frame.size.height - 3, kScreenWidth, 1);
    lbl.backgroundColor =  [UIColor lightGrayColor];
    lbl.alpha = 0.5;
    [cell.contentView addSubview:lbl];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}
//右边按钮点击事件
- (void)rightBarButtonItemClick:(UIButton *)btn
{
    CommunitRightVC *vc = [[CommunitRightVC alloc] init];
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
