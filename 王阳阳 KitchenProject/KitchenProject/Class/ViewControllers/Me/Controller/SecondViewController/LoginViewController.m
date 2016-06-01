//
//  LoginViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/6.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "LoginViewController.h"
#import "SecondLoginViewController.h"
#import "DatabaseModel.h"
#import "WeiBoViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
@interface LoginViewController ()
{
    UIButton *loginBtn;
    UITextField *topTF;
    UITextField *bottomTF;
    DatabaseModel *data;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    self.title = @"登录";
    self.view.backgroundColor = kRGBColor(246/255.0, 246/255.0, 241/255.0, 1);
    
    //布局UI
    [self createView];
    data = [DatabaseModel sharData];
}
- (void)createView
{
    //创建顶部TF
    topTF = [[UITextField alloc] init];
    topTF.center = CGPointMake(self.view.center.x+15, self.view.center.y-200);
    topTF.bounds = CGRectMake(0, 0, kScreenWidth, 40);
    topTF.backgroundColor = [UIColor whiteColor];
    topTF.placeholder = @"账号";
    [topTF addTarget:self action:@selector(tfChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:topTF];
    UILabel *topLabel = [[UILabel alloc] init];
    topLabel.center = CGPointMake(self.view.center.x-199, self.view.center.y-200);
    topLabel.bounds = CGRectMake(0, 0, 15, 40);
    topLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topLabel];
    
    //创建底部TF
    bottomTF = [[UITextField alloc] init];
    bottomTF.center = CGPointMake(self.view.center.x+15, self.view.center.y-158);
    bottomTF.bounds = CGRectMake(0, 0, kScreenWidth, 40);
    bottomTF.backgroundColor = [UIColor whiteColor];
    bottomTF.placeholder = @"登录密码";
    bottomTF.secureTextEntry = YES;
    [bottomTF addTarget:self action:@selector(tfChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:bottomTF];
    UILabel *bottomLabel = [[UILabel alloc] init];
    bottomLabel.center = CGPointMake(self.view.center.x-199, self.view.center.y-158);
    bottomLabel.bounds = CGRectMake(0, 0, 15, 40);
    bottomLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomLabel];
    
    //创建登录按钮
    loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.center = CGPointMake(self.view.center.x, self.view.center.y-90);
    loginBtn.bounds = CGRectMake(0, 0, kScreenWidth-30, 40);
    loginBtn.clipsToBounds = YES;
    loginBtn.layer.cornerRadius = 5;
    [loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    loginBtn.backgroundColor = ([topTF.text isEqualToString:@""]&&s[bottomTF.text isEqualToString:@""])?[UIColor lightGrayColor]:kRGBColor(1, 0, 0, 0.8);
    loginBtn.backgroundColor = [UIColor lightGrayColor];
    loginBtn.alpha = 0.7;
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    //创建通过短信验证登录
    UIButton *noteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    noteBtn.frame = CGRectMake(15, self.view.center.y-58, 130, 20);
    noteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [noteBtn setTitle:@"通过短信验证登录" forState:UIControlStateNormal];
    [noteBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    noteBtn.alpha = 0.7;
    [noteBtn addTarget:self action:@selector(noteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:noteBtn];
    
    //创建登录遇到问题
    UIButton *questionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    questionBtn.frame = CGRectMake(kScreenWidth-125, self.view.center.y-58, 120, 20);
    questionBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [questionBtn setTitle:@"登录遇到问题?" forState:UIControlStateNormal];
    [questionBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    questionBtn.alpha = 0.7;
    [questionBtn addTarget:self action:@selector(questionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:questionBtn];
    
    //创建或用其他方式登录
    UILabel *loginLabel = [[UILabel alloc] init];
    loginLabel.center = CGPointMake(self.view.center.x, self.view.center.y+150);
    loginLabel.bounds = CGRectMake(0, 0, 200, 20);
    loginLabel.text = @"或用其他方式快速登录";
    loginLabel.textAlignment = NSTextAlignmentCenter;
    loginLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:loginLabel];
    
    NSArray *threeArr = @[@"share_weibo~iphone",@"share_qq~iphone",@"share_douban~iphone"];
    NSArray *labelArr = @[@"微博",@"QQ",@"豆瓣"];
    //创建三个按钮
    for (int i=0; i<3; i++)
    {
        UIButton *threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                if (1==i) {
            threeBtn.center = CGPointMake(self.view.center.x, self.view.center.y+190);
        }else if (2==i){
            threeBtn.center = CGPointMake(self.view.center.x+60, self.view.center.y+190);
        }else{
            threeBtn.center = CGPointMake(self.view.center.x-60, self.view.center.y+190);
            threeBtn.backgroundColor = [UIColor redColor];
  
        }
        threeBtn.bounds = CGRectMake(0, 0, 30, 30);
        threeBtn.clipsToBounds = YES;
        threeBtn.layer.cornerRadius = 15;
        [threeBtn setImage:[UIImage imageNamed:threeArr[i]] forState:UIControlStateNormal];
        [threeBtn addTarget:self action:@selector(threeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        threeBtn.tag = 30+i;
        [self.view addSubview:threeBtn];
        
        UILabel *threeLabel = [[UILabel alloc] init];
        threeLabel.center = CGPointMake(threeBtn.center.x, self.view.center.y+220);
        threeLabel.bounds = CGRectMake(0, 0, 30, 30);
        threeLabel.text = labelArr[i];
        threeLabel.textAlignment = NSTextAlignmentCenter;
        threeLabel.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:threeLabel];
    }
    
    
}
//TF点击事件
- (void)tfChange:(UITextField *)tf
{
    if ([topTF.text isEqualToString:@""]||[bottomTF.text isEqualToString:@""])
    {
        loginBtn.backgroundColor = [UIColor lightGrayColor];
        loginBtn.alpha = 0.7;
    }
    else
    {
        loginBtn.backgroundColor = kRGBColor(1, 0, 0, 0.8);
    }
    
}
//登录按钮点击事件
- (void)loginBtnClick:(UIButton *)btn
{
    BOOL result = [data queryUserWithUserName:topTF.text password:bottomTF.text];
    if (result == YES) {
        SecondLoginViewController *secondVC = [[SecondLoginViewController alloc] init];
        secondVC.database = [DatabaseModel sharData];
        secondVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:secondVC animated:YES completion:nil];
    }else{
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:@"账号或密码错误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"账号或密码错误");
        }];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
}
//短信验证按钮点击事件
- (void)noteBtnClick:(UIButton *)btn
{
    NSLog(@"短信验证按钮被点击了");
}
//登录遇到问题按钮点击事件
- (void)questionBtnClick:(UIButton *)btn
{
    NSLog(@"登录遇到问题按钮被点击了");
}
//三个按钮点击事件
- (void)threeBtnClick:(UIButton *)sender
{
    if (sender.tag == 30)//微博按钮
    {
        
        [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
               onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
         {
             if (state == SSDKResponseStateSuccess)
             {
                 
                 NSLog(@"uid=%@",user.uid);
                 NSLog(@"%@",user.credential);
                 NSLog(@"token=%@",user.credential.token);
                 NSLog(@"nickname=%@",user.nickname);
             }
             
             else
             {
                 NSLog(@"%@",error);
             }
             
         }];

        WeiBoViewController *weiBoVC = [[WeiBoViewController alloc] init];
        [self.navigationController pushViewController:weiBoVC animated:YES];
    }
    else if (sender.tag == 31)//QQ按钮
    {
        NSLog(@"QQ按钮被点击了");
    }
    else if (sender.tag == 32)//豆瓣按钮
    {
        NSLog(@"豆瓣按钮被点击了");
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
