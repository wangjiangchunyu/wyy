//
//  PrevailRecipeViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "PrevailRecipeViewController.h"
#import "PrevailRecipeCell.h"

@interface PrevailRecipeViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain)UITableView *tableView;

@end

@implementation PrevailRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"本周最受欢迎";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建导航控制器上的控件
    [self createNavBarItem];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
   
    [self.tableView registerClass:[PrevailRecipeCell class] forCellReuseIdentifier:@"cell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PrevailRecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 280;
}

- (void)createNavBarItem
{
    //创建右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"buylistButtonImage~iphone" addTarget:self action:@selector(rightBarButtonItemClick:)];
}
//右边按钮点击事件
- (void)rightBarButtonItemClick:(UIButton *)rightButton
{
    WYYLog(@"本周最受欢迎右边按钮被点击了");
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
