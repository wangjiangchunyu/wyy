//
//  RegistViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/11.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "RegistViewController.h"
#import "DatabaseModel.h"

@interface RegistViewController (){
    DatabaseModel *_database;
    UITextField *countText;
    UITextField *secureText;
}

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = NO;
    self.title = @"注册界面";
    self.view.backgroundColor = kRGBColor(0.8, 0.8, 0.8, 1);
    [self setupRegistView];
    _database = [DatabaseModel sharData];
}
- (void)setupRegistView {
    //创建账号Label
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 50, 40)];
    topLabel.text = @"账号";
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topLabel];
    //创建账号TextField
    countText = [[UITextField alloc] initWithFrame:CGRectMake(80, 150, kScreenWidth-85, 40)];
    countText.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:countText];
    
    //创建密码Label
    UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 50, 40)];
    bottomLabel.text = @"密码";
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomLabel];
    //创建密码TextField
    secureText = [[UITextField alloc] initWithFrame:CGRectMake(80, 200, kScreenWidth-85 ,40)];
    secureText.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:secureText];
    
    //创建注册按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 300, kScreenWidth, 40);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"注册" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
- (void)buttonClick:(UIButton *)sender {
    BOOL result = [_database insertUserName:countText.text password:secureText.text];
    if (result == YES) {
        if (countText.text.length>0 && secureText.text.length>0) {
            UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账号注册成功,请返回登录" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"注册成功");
            }];
            [alertController addAction:ok];
            [self presentViewController:alertController animated:YES completion:nil];

        }
    }else{
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您的账号不能为空或已注册" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"账号注册失败");
        }];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
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
