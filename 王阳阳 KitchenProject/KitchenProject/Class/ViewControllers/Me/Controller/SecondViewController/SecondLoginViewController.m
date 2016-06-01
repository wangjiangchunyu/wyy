//
//  SecondLoginViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/11.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "SecondLoginViewController.h"
#import "DatabaseModel.h"

@interface SecondLoginViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSMutableArray *dataArr;
@property (nonatomic,retain)DatabaseModel *data;
@end

@implementation SecondLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [self.data savedNameAndPassword];
    NSLog(@"++++%@",self.dataArr);
    [self createTableView];
}
- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    //[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"账号%@",self.dataArr[indexPath.row][0]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"密码%@",self.dataArr[indexPath.row][1]];
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
