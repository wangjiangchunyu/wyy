//
//  IntroduceViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/11.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "IntroduceViewController.h"
#import "WYYTabBarController.h"

@interface IntroduceViewController ()

@property (nonatomic,retain)UIScrollView *scrollView;
@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.view.window.rootViewController = [[CSTabBarController alloc] init];
    [self setupScrollView];
}

//创建scrollView
- (void)setupScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:self.scrollView];
    
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
