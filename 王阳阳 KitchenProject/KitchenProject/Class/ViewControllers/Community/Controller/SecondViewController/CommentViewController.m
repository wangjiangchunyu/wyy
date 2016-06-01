//
//  CommentViewController.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/5.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kRGBColor(242/255.0, 243/255.0, 230/255.0, 1);
    
    self.title = @"意见反馈";
    
    //创建导航栏左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"取消" withTitleColor:kRGBColor(1, 0, 0, 1) addTarget:self action:@selector(leftBtnClick:)];
    //创建导航栏右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"确定" withTitleColor:kRGBColor(1, 0, 0, 1) addTarget:self action:@selector(rightBtnClick:)];
    
    //布局UI
    [self createView];
}
- (void)leftBtnClick:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightBtnClick:(UIButton *)btn
{
    NSLog(@"确定按钮被点击了");
}

- (void)createView
{
    //创建顶部文本框
//    UITextField *topTextField = [[UITextField alloc] init];
//    topTextField.center = CGPointMake(self.view.center.x, self.view.center.y-160);
//    topTextField.backgroundColor = [UIColor whiteColor];
//    topTextField.bounds = CGRectMake(0, 0, kScreenWidth, 270);
//    topTextField.borderStyle = UITextBorderStyleNone;
//    [self.view addSubview:topTextField];
    
//    self.modalPresentationCapturesStatusBarAppearance = NO;
    
//    self.extendedLayoutIncludesOpaqueBars = NO;
    
    //创建文本视图
    UITextView *textView =[[UITextView alloc] init];
    textView.center = CGPointMake(self.view.center.x, self.view.center.y-180);
    textView.bounds = CGRectMake(0, 0, kScreenWidth, 350);
    textView.backgroundColor = [UIColor whiteColor];
    //设置字体名字和字体大小
    textView.font = [UIFont fontWithName:@"Arial"size:18.0];
//    textView.delegate = self;//设置它的委托方法
    //返回键的类型
    textView.returnKeyType = UIReturnKeyDefault;
    //键盘类型
    textView.keyboardType = UIKeyboardTypeDefault;
    //是否可以拖动
    textView.scrollEnabled = NO;
    //禁止编辑
//    textView.editable =NO;
    //自适应高度
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    //让textView的光标移到左上角的位置
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:textView];

    
    //创建中间的label
    UILabel *centrolLabel = [[UILabel alloc] init];
    centrolLabel.center = CGPointMake(self.view.center.x, self.view.center.y-30);
    centrolLabel.bounds = CGRectMake(0, 0, 400, 30);
    centrolLabel.text = @"请留下邮箱，以便我们及时帮你解决";
    centrolLabel.textAlignment = NSTextAlignmentCenter;
    centrolLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:centrolLabel];
    
    //创建底部textField
    UITextField *bottomTextField = [[UITextField alloc] init];
    bottomTextField.center = CGPointMake(self.view.center.x, self.view.center.y+10);
    bottomTextField.backgroundColor = [UIColor whiteColor];
    bottomTextField.bounds = CGRectMake(0, 0, kScreenWidth, 40);
    bottomTextField.placeholder = @"   如：xman@gmail.com";
    bottomTextField.borderStyle = UITextBorderStyleNone;
    [self.view addSubview:bottomTextField];
    
    //创建底部按钮
    UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomBtn.center = CGPointMake(self.view.center.x, self.view.center.y+80);
    bottomBtn.bounds = CGRectMake(0, 0, 150, 30);
    [bottomBtn setTitle:@"查看帮助中心" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [bottomBtn addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomBtn];
    
}
- (void)bottomBtnClick:(UIButton *)btn
{
    NSLog(@"查看帮助中心被点击了");
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
