//
//  PhoneViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/6.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "PhoneViewController.h"
#import "WYYAlertView.h"

@interface PhoneViewController () 
{
    UIButton *verifyBtn;
    UITextField *bottomTF;
    BOOL selected;
    UIView *view;
}


@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = kRGBColor(246/255.0, 246/255.0, 241/255.0, 1);
    self.title = @"注册界面";
    
    //布局UI
    [self createView];
    
}
- (void)createView
{
    //创建顶部Label
    UILabel *topLabel = [[UILabel alloc] init];
    topLabel.center = CGPointMake(self.view.center.x-167, self.view.center.y-200);
    topLabel.text = @"账号";
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.bounds = CGRectMake(0, 0, 80, 40);
    topLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topLabel];
    UILabel *label = [[UILabel alloc] init];
    label.center = CGPointMake(self.view.center.x+40, self.view.center.y-200);
    label.bounds = CGRectMake(0, 0, kScreenWidth-80, 40);
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"中国大陆 +86";
    label.textColor = [UIColor lightGrayColor];
    label.alpha = 0.7;
    [self.view addSubview:label];
    
    
    //创建底部TF
    bottomTF = [[UITextField alloc] init];
    bottomTF.center = CGPointMake(self.view.center.x+79, self.view.center.y-158);
    bottomTF.bounds = CGRectMake(0, 0, kScreenWidth, 40);
    bottomTF.backgroundColor = [UIColor whiteColor];
    bottomTF.placeholder = @"请输入手机号";
    bottomTF.secureTextEntry = YES;
    [bottomTF addTarget:self action:@selector(bottomChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:bottomTF];
    UILabel *bottomLabel = [[UILabel alloc] init];
    bottomLabel.center = CGPointMake(self.view.center.x-167, self.view.center.y-158);
    bottomLabel.text = @"手机号";
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.bounds = CGRectMake(0, 0, 80, 40);
    bottomLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomLabel];
    //创建登录按钮
    verifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    verifyBtn.center = CGPointMake(self.view.center.x, self.view.center.y-98);
    verifyBtn.bounds = CGRectMake(0, 0, kScreenWidth-30, 40);
    verifyBtn.clipsToBounds = YES;
    verifyBtn.layer.cornerRadius = 5;
    [verifyBtn setTitle:@"收取验证码" forState:UIControlStateNormal];
    [verifyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    verifyBtn.backgroundColor = [UIColor lightGrayColor];
    verifyBtn.alpha = 0.7;
    [verifyBtn addTarget:self action:@selector(verifyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:verifyBtn];
    
    //创建三角形按钮
    UIButton *graphicsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    graphicsBtn.center = CGPointMake(label.center.x+130, label.center.y);
    graphicsBtn.bounds = CGRectMake(0, 0, 20, 20);
//    graphicsBtn.backgroundColor = [UIColor redColor];
    [graphicsBtn setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal];
    [graphicsBtn addTarget:self action:@selector(graphicsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:graphicsBtn];

}
//三角形按钮点击事件
- (void)graphicsBtnClick:(UIButton *)btn
{
    WYYAlertView *alert = [[WYYAlertView alloc] init];
    [alert persentTableView];
   
}
//bottomTF点击事件
- (void)bottomChange:(UITextField *)bottom
{
    if ([bottomTF.text isEqualToString:@""]) {
        return;
    }
    
    if (bottom.text.length == 11 && !selected) {
        verifyBtn.backgroundColor = kRGBColor(1, 0, 0, 0.8);;
        verifyBtn.userInteractionEnabled = YES;
    }else {
        verifyBtn.backgroundColor = [UIColor lightGrayColor];
        verifyBtn.alpha = 0.7;
        verifyBtn.userInteractionEnabled = NO;
    }
}
//收取验证码按钮点击事件
- (void)verifyBtnClick:(UIButton *)btn
{
    
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
