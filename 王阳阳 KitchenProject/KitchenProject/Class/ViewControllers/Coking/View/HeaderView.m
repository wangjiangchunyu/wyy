//
//  HeaderView.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/28.
//  Copyright © 2016年 王阳阳. All rights reserved.
//

#define kTopImageViewHeight 150

#import "HeaderView.h"
#import "CokingRequest.h"
#import "UIButton+WebCache.h"
#import "LeftButtonModel.h"
#import "FourButtonModel.h"
#import "RedEnvelopeModel.h"


@interface HeaderView ()<UIScrollViewDelegate>
{
    UIScrollView *bottomScrollView;
    UIPageControl *page;

}

@end

@implementation HeaderView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [CokingRequest requestCoking:^(NSMutableArray *array)
        {
            self.maxArr = [NSMutableArray arrayWithArray:array];
            
            //左上按钮
            self.leftBtnArr = self.maxArr[0];
            UIButton *button = [self viewWithTag:10];
            LeftButtonModel *lefeBtn = self.leftBtnArr[0];
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:lefeBtn.pop_recipe_picurl] forState:UIControlStateNormal];
            
            //四个按钮
            self.fourBtnArr = self.maxArr[1];
            for (int i=0; i<4; i++)
            {
                UIButton *fourBtn = [self viewWithTag:100+i];
                FourButtonModel *fourBtnObj = self.fourBtnArr[i];
                [fourBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:fourBtnObj.picurl] forState:UIControlStateNormal];
                
                UILabel *fourLabel = [self viewWithTag:1000+i];
                fourLabel.text = fourBtnObj.name;
            }
            
        }];
        
        //请求红包数据
        [CokingRequest requestRedEnvelope:^(NSMutableArray *array)
        {
            self.redArr = [NSMutableArray arrayWithArray:array];
        }];
        
        //布局UI
        [self createView];
    }
    return self;
}

- (void)createView
{
    //创建顶部按钮
    for (int i=0; i<2; i++)
    {
        UIButton *topBtn = [[UIButton alloc] initWithFrame:CGRectMake(i*(kScreenWidth/2+1), 0, kScreenWidth/2-1, kTopImageViewHeight)];
//        topBtn.backgroundColor = [UIColor redColor];
        topBtn.tag = i+10;
        [topBtn addTarget:self action:@selector(topBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:topBtn];
    }
    
    UIButton *topButton = [self viewWithTag:10];
    UILabel *topLabel = [[UILabel alloc] init];
    topLabel.center = CGPointMake(topButton.center.x, topButton.center.y+50);
    topLabel.bounds = CGRectMake(0, 0, 120, 30);
//    topLabel.backgroundColor = [UIColor redColor];
    topLabel.text = @"本周流行菜谱";
    topLabel.font = [UIFont systemFontOfSize:15];
    topLabel.textColor = [UIColor whiteColor];
    topLabel.textAlignment = NSTextAlignmentCenter;
    [topButton addSubview:topLabel];
    
    
    UIButton *twoBtn = [self viewWithTag:11];
    [twoBtn setBackgroundImage:[UIImage imageNamed:@"feedsNoFriends~iphone"] forState:UIControlStateNormal];
    [self addSubview:twoBtn];
    UIImageView *btnImage = [[UIImageView alloc] init];
    btnImage.image = [UIImage imageNamed:@"feedsNoFriendsIcon~iphone"];
//    btnImage.backgroundColor = [UIColor redColor];
    btnImage.center = twoBtn.center;
    btnImage.bounds = CGRectMake(0, 0, 50, 50);
    [twoBtn addSubview:btnImage];
    UILabel *btnLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 110, 120, 30)];
//    btnLabel.backgroundColor = [UIColor redColor];
    btnLabel.text = @"查看好友并关注";
    btnLabel.font = [UIFont systemFontOfSize:15];
    btnLabel.textColor = [UIColor whiteColor];
    [twoBtn addSubview:btnLabel];
    
    
    //创建中部四个按钮
    for (int i=0; i<4; i++)
    {
        UIButton *centrolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        centrolBtn.frame = CGRectMake(i*(kScreenWidth/4)+15, kTopImageViewHeight+15, kScreenWidth/4-30, kTopImageViewHeight-100);
        centrolBtn.tag = 100+i;
//        centrolBtn.backgroundColor = [UIColor blueColor];
        [centrolBtn addTarget:self action:@selector(centrolButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:centrolBtn];
        
        UILabel *fourLabel = [[UILabel alloc] initWithFrame:CGRectMake(i*(kScreenWidth/4)+5, kTopImageViewHeight+65, kScreenWidth/4-10, kTopImageViewHeight-120)];
        fourLabel.tag = 1000+i;
//        fourLabel.backgroundColor = [UIColor yellowColor];
        fourLabel.font = [UIFont systemFontOfSize:15];
        fourLabel.textAlignment = NSTextAlignmentCenter;
//        fourLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:fourLabel];
    }
    
    //创建新用户可领取20元红包
    UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    newBtn.frame = CGRectMake(0, kTopImageViewHeight+100, kScreenWidth, kTopImageViewHeight-100);
    newBtn.backgroundColor = kRGBColor(250/255.0, 247/255.0, 210/255.0, 1.0);
    [newBtn setTitle:@"新用户可领取20元红包" forState:UIControlStateNormal];
    [newBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [newBtn addTarget:self action:@selector(newBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:newBtn];
    
    //创建ScrollView
    bottomScrollView = [[UIScrollView alloc] init];
    bottomScrollView.center = CGPointMake(self.center.x+207, self.center.y+350);
    bottomScrollView.bounds = CGRectMake(0, 0, kScreenWidth, 100);

    NSArray *scrollArr = @[@"themeSmallPicForBreakfast~iphone",@"themeSmallPicForLaunch~iphone",@"themeSmallPicForSupper~iphone"];
    NSArray *imageLabelArr = @[@"- 早餐 -",@"- 午餐 -",@"- 晚餐 -"];
    for (int i=0; i<3; i++)
    {
        //创建早中晚三个按钮
        UIButton *threeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        threeBtn.frame = CGRectMake(kScreenWidth*i-50, bottomScrollView.bounds.origin.y, kScreenWidth, bottomScrollView.bounds.size.height);
        threeBtn.tag = 50+i;
        [threeBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",scrollArr[i]]] forState:UIControlStateNormal];
        [threeBtn addTarget:self action:@selector(sBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bottomScrollView addSubview:threeBtn];
        
        //创建早中晚三个label
        UILabel *imagelabel = [[UILabel alloc] init];
        imagelabel.center = CGPointMake(200+414*i, threeBtn.center.y-10);
        imagelabel.bounds = CGRectMake(0, 0, 100, 30);
        imagelabel.text = imageLabelArr[i];
//        imagelabel.backgroundColor = [UIColor redColor];
        imagelabel.textAlignment = NSTextAlignmentCenter;
        [bottomScrollView addSubview:imagelabel];
    }

    bottomScrollView.contentSize = CGSizeMake(kScreenWidth*3, bottomScrollView.frame.size.height);
    bottomScrollView.pagingEnabled = YES;
    bottomScrollView.showsHorizontalScrollIndicator = NO;
    bottomScrollView.showsVerticalScrollIndicator = NO;
    bottomScrollView.delegate = self;
    [self addSubview:bottomScrollView];
    
    //创建页码控制器
    page = [[UIPageControl alloc] init];
    page.frame = CGRectMake(0, 370, 0, 10);
//    page.backgroundColor = [UIColor cyanColor];
    page.numberOfPages = 3;
    page.userInteractionEnabled = NO;
    page.currentPageIndicatorTintColor = [UIColor redColor];
    page.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self addSubview:page];
    
    
    
    //创建日期
    UILabel *label = [[UILabel alloc] init];
//    label.frame = CGRectMake(bottomScrollView.center.x-100, self.center.y+390, 200, 50);
    label.center = CGPointMake(bottomScrollView.center.x, bottomScrollView.center.y+65);
    label.bounds = CGRectMake(0, 0, kScreenWidth, 50);
    label.backgroundColor = kRGBColor(242/255.0, 243/255.0, 230/255.0, 1);
    label.text = @"5月7日 星期六";
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
}
//开始拖拽的时候此方法会被调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == bottomScrollView)
    {
        CGPoint offset = scrollView.contentOffset;
        page.currentPage = offset.x / (bottomScrollView.bounds.size.width); //计算当前的页码
        [bottomScrollView setContentOffset:CGPointMake(bottomScrollView.bounds.size.width * (page.currentPage),               bottomScrollView.contentOffset.y) animated:YES]; //设置scrollview的显示为当前滑动到的页面
    }
    
}

//顶部按钮点击事件
- (void)topBtnClick:(UIButton *)btn
{
    if (btn.tag == 10)//进入本周流行菜谱界面
    {
        if ([self.delegate respondsToSelector:@selector(createTopOneButtonClick)])
        {
            [self.delegate createTopOneButtonClick];
        }
    }else if (btn.tag == 11)//进入查看好友并关注界面
    {
        if ([self.delegate respondsToSelector:@selector(createTopTwoButtonClick)])
        {
            [self.delegate createTopTwoButtonClick];
        }
    }
    
}

//四个控制按钮点击事件
- (void)centrolButtonClick:(UIButton *)btn
{
    if (btn.tag == 100)//进入排行榜界面
    {
        if ([self.delegate respondsToSelector:@selector(getIntoLeaderboardViewController)])
        {
            [self.delegate getIntoLeaderboardViewController];
        }
    }else if (btn.tag == 101)//进入看视频界面界面
    {
        if ([self.delegate respondsToSelector:@selector(getIntoVideoViewController)])
        {
            [self.delegate getIntoVideoViewController];
        }
    }
    else if (btn.tag == 102)//进入买卖界面
    {
        if ([self.delegate respondsToSelector:@selector(getIntoBuyViewController)])
        {
            [self.delegate getIntoBuyViewController];
        }
    }else if (btn.tag == 103)//进入菜谱分类界面
    {
        if ([self.delegate respondsToSelector:@selector(getINtoMenuViewController)])
        {
            [self.delegate getINtoMenuViewController];
        }
    }
}

//新用户红包按钮点击事件
- (void)newBtnClick:(UIButton *)btn
{
    RedEnvelopeModel *redObj = [self.redArr firstObject];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:redObj.url]];
    
}

//scrollView点击事件
- (void)sBtnClick:(UIButton *)sBtn
{
//    if (sBtn.tag == 50)
//    {
//        NSLog(@"50");
//    }
//    else if (sBtn.tag == 51)
//    {
//        NSLog(@"51");
//    }
//    else if (sBtn.tag == 52)
//    {
//        NSLog(@"52");
//    }
    if ([self.delegate respondsToSelector:@selector(getIntoScrollViewController)])
    {
        [self.delegate getIntoScrollViewController];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
