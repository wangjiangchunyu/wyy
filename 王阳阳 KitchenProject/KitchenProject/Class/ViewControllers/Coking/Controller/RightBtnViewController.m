//
//  RightBtnViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "RightBtnViewController.h"

@interface RightBtnViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain)UITableView *tableView;

@end

@implementation RightBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"菜篮子";
    
    //创建导航栏右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"清空" withTitleColor:kRGBColor(1, 0, 0, 1) addTarget:self action:@selector(rightBtnClick:)];
    
    //布局UI
    [self createView];
}
//清空按钮点击事件
- (void)rightBtnClick:(UIButton *)rightBtn
{
    NSLog(@"清空按钮被点击了");
}

- (void)createView
{
//    CGRectMake(0, 0, kScreenWidth, 44)
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    //创建屏幕中心label
    UILabel *maxLabel = [[UILabel alloc] init];
    maxLabel.center = CGPointMake(self.view.center.x, self.view.center.y-100);
    maxLabel.bounds = CGRectMake(0, 0, 300, 40);
    maxLabel.text = @"再也不会忘记要买葱了";
    maxLabel.textAlignment = NSTextAlignmentCenter;
    maxLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:maxLabel];
    //创建小label
    UILabel *label = [[UILabel alloc] init];
    label.center = CGPointMake(self.view.center.x, self.view.center.y-75);
    label.bounds = CGRectMake(0, 0, 300, 30);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"(购买清单改名叫做菜篮子了)";
    label.textColor = [UIColor lightGrayColor];
    label.alpha = 0.7;
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
}
#pragma mark----------TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //定义cell左边的字
    cell.textLabel.text = @"已添加0个";
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    
    //定义cell的下线
    UIView *lbl = [[UIView alloc] init];
    lbl.frame = CGRectMake(cell.frame.origin.x, cell.frame.size.height - 5, kScreenWidth, 1);
    lbl.backgroundColor =  [UIColor lightGrayColor];
    lbl.alpha = 0.5;
    [cell.contentView addSubview:lbl];
    
    //定义cell左边的图片
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buyListRecipeButtonNormal~iphone"]];
    image.center = CGPointMake(cell.center.x+230, cell.center.y);
    [cell.contentView addSubview:image];
    
    return cell;
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
