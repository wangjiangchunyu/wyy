//
//  CokingViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/21.
//  Copyright © 2016年 王阳阳. All rights reserved.
//
#define kWidth self.view.bounds.size.width
#define kHeight self.view.bounds.size.height

#import "CokingViewController.h"
#import "HeaderView.h"
#import "CokingCell.h"
#import "CokingRequest.h"
#import "CellModel.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"

#import "PrevailRecipeViewController.h"
#import "FriendViewController.h"

#import "LeaderboardViewController.h"
#import "VideoViewController.h"
#import "BuyViewController.h"
#import "MenuViewController.h"

#import "CellViewController.h"

#import "LeftBtnViewController.h"
#import "RightBtnViewController.h"

#import "ScrollViewController.h"
#import "MyTool.h"
#import "DatabaseTool.h"
#import "MJChiBaoZiHeader.h"

@interface CokingViewController () <UITableViewDataSource,UITableViewDelegate,HeaderViewDelegate>
//搜索框
@property(nonatomic, strong)UISearchBar *searchBar;
//tableView
@property (nonatomic,retain)UITableView *tabeView;
@property (nonatomic,retain)NSMutableArray *dataArr;
@property (nonatomic,assign) BOOL load;
@end

@implementation CokingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //记录tabBar的次数
    NSInteger index = self.tabBarController.selectedIndex;
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:index] forKey:@"tab"];
    
    //调用tableView请求的数据
//    self.tabeView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if ([MyTool isHaveWifi]) {
            [CokingRequest requestCokingCell:^(NSMutableArray *array) {
                self.dataArr = [NSMutableArray arrayWithArray:array];
                [self.tabeView reloadData];
                
                [self.tabeView.mj_header endRefreshing];
            
                [DatabaseTool insertIntoDataToKitchenTable:array];
            }];
        }else{
            self.dataArr = [DatabaseTool selectDataFromKitchenTable];
        }
    [_tabeView.mj_header beginRefreshing];
    
//    self.tabeView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
//        [CokingRequest requestFirstUpLoadCokingCell:^(NSMutableArray *array) {
//            self.dataArr = [NSMutableArray arrayWithArray:array];
//            [self.tabeView reloadData];
//            [self.tabeView.mj_footer endRefreshing];
//        }];
//        
//    }];

    self.view.backgroundColor = [UIColor whiteColor];
    //创建导航控制器上的按钮
    [self createNavBarItem];
    //布局UI
    [self createView];
//    self.tabeView.mj_header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    // 马上进入刷新状态
//    [self.tabeView.mj_header beginRefreshing];
    
}
//- (void)loadNewData
//{
//    // 刷新表格
//    [self.tabeView reloadData];
//    
//    // 拿到当前的下拉刷新控件，结束刷新状态
//    [self.tabeView.mj_header endRefreshing];
//}




- (void)createNavBarItem
{
    
    //创建左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"stepperAddEnabled~iphone"addTarget:self action:@selector(leftBarButtonItemClick:)];
    
    //创建右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:nil withImageName:@"buylistButtonImage~iphone" addTarget:self action:@selector(rightBarButtonItemClick:)];
    
    //设置导航条中间的搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:self.navigationItem.titleView.bounds];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal ;
    _searchBar.placeholder = @"菜谱、食谱";
    self.navigationItem.titleView = _searchBar;
    //让搜索框放弃第一响应
    //    [self.searchBar resignFirstResponder];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *arr = [self.tabeView indexPathsForVisibleRows];
    NSIndexPath *index = [arr lastObject];
    if (index.row == self.dataArr.count-1)
    {
        //        NSLog(@"234567890");
        if (!_load)
        {
            NSLog(@"65432345");
            _load = !_load;
            [CokingRequest requestCokingCell:^(NSMutableArray *array) {
                [self.dataArr addObjectsFromArray:array];
                [self.tabeView reloadData];
                self.load = !_load;
            }];
        }
        
    }
    
    
}



//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSArray *arr = [self.tabeView indexPathsForVisibleRows];
//    NSIndexPath *index = [arr lastObject];
//    if (index.row == self.dataArr.count - 1) {
//            self.tabeView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
//                [CokingRequest requestFirstUpLoadCokingCell:^(NSMutableArray *array) {
//                    self.dataArr = [NSMutableArray arrayWithArray:array];
//                    [self.tabeView reloadData];
//                    [self.tabeView.mj_footer endRefreshing];
//                }];
//        
//            }];
//
//    }

//    self.tabeView.mj_footer = [MJRefreshAutoStateFooter footerWithRefreshingBlock:^{
//        [CokingRequest requestFirstUpLoadCokingCell:^(NSMutableArray *array) {
//            self.dataArr = [NSMutableArray arrayWithArray:array];
//            [self.tabeView reloadData];
//            [self.tabeView.mj_footer endRefreshing];
//        }];
//
//    }];
    
    
    
//    self.tabeView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
//            }];
//    [_tabeView.mj_footer beginRefreshing];

//}
//左边按钮点击事件
- (void)leftBarButtonItemClick:(UIButton *)btn
{
    LeftBtnViewController *vc = [[LeftBtnViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//右边按钮点击事件
- (void)rightBarButtonItemClick:(UIButton *)btn
{
    RightBtnViewController *vc = [[RightBtnViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)createView
{
    self.tabeView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tabeView.delegate = self;
    self.tabeView.dataSource = self;
    [self.view addSubview:self.tabeView];
    
    [self.tabeView registerClass:[CokingCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark---------TableViewDelegate
//设置多少个区头
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 440.f;
    }
    return 50.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        HeaderView *view = [[HeaderView alloc] init];
        view.delegate = self;
        return view;
    }
    
    //创建日期
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor redColor];
    label.text = @"待请求";
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CokingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor blueColor];
    
    CellModel *cellObj = self.dataArr[indexPath.row];
    cell.cellObj = cellObj;
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 350.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel *cellObj = self.dataArr[indexPath.row];
    CellViewController *cellVC = [[CellViewController alloc] init];
    cellVC.view.backgroundColor = [UIColor whiteColor];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:cellObj.url]];
    [cellVC.webView loadRequest:request];
    [self.navigationController pushViewController:cellVC animated:YES];
}

#pragma mark----------HeaderViewDelegate
//通过代理方法进入到本周流行菜谱界面
- (void)createTopOneButtonClick
{
    PrevailRecipeViewController *vc = [[PrevailRecipeViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}
//通过代理方法进入到查看好友并关注界面
- (void)createTopTwoButtonClick
{
    FriendViewController *vc = [[FriendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//通过代理方法进入排行榜界面
- (void)getIntoLeaderboardViewController
{
    LeaderboardViewController *leaderVC = [[LeaderboardViewController alloc] init];
    [self.navigationController pushViewController:leaderVC animated:YES];
}
//进入看视频界面
- (void)getIntoVideoViewController
{
    VideoViewController *vc = [[VideoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//进入买买买界面
- (void)getIntoBuyViewController
{
    BuyViewController *vc = [[BuyViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//进入菜单分类界面
- (void)getINtoMenuViewController
{
    MenuViewController *vc = [[MenuViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//进入scrollViewController界面
- (void)getIntoScrollViewController
{
    ScrollViewController *vc = [[ScrollViewController alloc] init];
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
