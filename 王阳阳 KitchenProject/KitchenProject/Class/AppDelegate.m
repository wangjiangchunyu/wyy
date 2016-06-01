//
//  AppDelegate.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/4/21.
//  Copyright © 2016年 WangYangYang. All rights reserved.

#import "AppDelegate.h"
#import "WYYTabBarController.h"
#import "CokingRequest.h"
#import "DatabaseTool.h"
#import "IntroduceViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
//腾讯开放平台（对应QQ和QQ空间）SDK头文件
//#import <TencentOpenAPI/TencentOAuth.h>
//#import <TencentOpenAPI/QQApiInterface.h>
//
////微信SDK头文件
//#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [DatabaseTool createDatabaseAndTable];
//     [ShareSDK registerApp:@"123cfcd3d90ac"
//activePlatforms:@[
//                  @(SSDKPlatformTypeSinaWeibo),
//                  @(SSDKPlatformTypeMail),
//                  @(SSDKPlatformTypeSMS),
//                  @(SSDKPlatformTypeCopy),
//                  @(SSDKPlatformTypeWechat),
//                  @(SSDKPlatformTypeQQ),
//                  @(SSDKPlatformTypeRenren),
//                  @(SSDKPlatformTypeGooglePlus)]
//onImport:^(SSDKPlatformType platformType)
//    {
//        switch (platformType)
//        {
//                
//                
//            case SSDKPlatformTypeSinaWeibo:
//                [ShareSDKConnector connectWeibo:[WeiboSDK class]];
//                break;
//                
//            default:
//                break;
//        }
//    }
//onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
//    {
//        
//        switch (platformType)
//        {
//            case SSDKPlatformTypeSinaWeibo:
//                //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
//                [appInfo SSDKSetupSinaWeiboByAppKey:@"1434722261"
//                                          appSecret:@"980b21afea4fb409478d19d76a000ddf"
//                                        redirectUri:@"http://www.baidu.com"
//                                           authType:SSDKAuthTypeBoth];
//                break;
//            case SSDKPlatformTypeWechat:
//                [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
//                                      appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
//                break;
//            case SSDKPlatformTypeQQ:
//                [appInfo SSDKSetupQQByAppId:@"100371282"
//                                     appKey:@"aed9b0303e3ed1e27bae87c33761161d"
//                                   authType:SSDKAuthTypeBoth];
//                break;
//                
//            default:
//                break;
//        }
//    }];
    //创建一个window
    self.window = [[UIWindow alloc] initWithFrame:kScreenBounds];
    self.window.backgroundColor = kRGBColor(0.4, 0.5, 0.6, 1.0);
    
    //将window的根视图设置成TabBarController
    self.window.rootViewController = [[WYYTabBarController alloc] init];
    //将你的窗口变成主窗口显示出来
    [self.window makeKeyAndVisible];
   
     
     

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
/*
 
 
 {"status": "ok", 
  "content": {
    "cursor": {
       "has_next": true, 
       "has_prev": false, 
       "prev": "", 
       "next": "2016-05-03"}, 
    "count": 2,
    "issues": [{
      "items_count": 10,
      "title": "5\u67083\u65e5 \u661f\u671f\u4e8c",
      "items": [
 //点击第一张图片
     {"publish_time": "2016-05-03 00:00:20",
      "url": "http://www.xiachufang.com/recipe_list/11787/",
      "template": 2,
      "id": 2212,
      "contents": {
         "title_2nd": "302\u9053\u83dc\u8c31",
         "title_1st": "\u51cf\u80a5\u515a\u4eec\uff0c\u4f60\u4eec\u73b0\u5728\u53ea\u80fd\u5403\u8fd9\u4e9b",
         "image": {
            "url": "http://s1.cdn.xiachufang.com/015acc8f7d5611e59dbda54a361fa956.jpg@2o_50sh_1pr_1l_620w_90q_1wh.jpg",
            "width": "597", 
            "height": "411"}}, 
     "column_name": ""},
 //点击第二张图片
     {"publish_time": "2016-05-03 00:00:18", 
      "url": "http://www.xiachufang.com/recipe_list/100077842/", 
      "template": 2, 
      "id": 2210, 
      "contents": {
         "title_2nd": "86\u9053\u83dc\u8c31", 
         "title_1st": "\u56e4\u597d\u8fd9\u4e9b\u83dc\uff0c\u5077\u61d2\u4e5f\u80fd\u5403\u597d\u996d", 
          "image": {"url": "http://s2.cdn.xiachufang.com/fd1f99dc7dbe11e592d6e5a9b56dcca8.jpg?imageView2/2/w/620/interlace/1/q/90/format/jpg/.jpg", 
             "width": "581", 
             "height": "400"}}, 
       "column_name": ""},
 //点击第三张图片
    {"publish_time": "2016-05-03 00:00:16", 
     "url": "http://www.xiachufang.com/recipe/101769422/", 
     "template": 5, 
     "id": 2211, 
     "contents": {
        "video_url": "", 
        "title": "\u8292\u679c\u996d-\u7535\u996d\u9505\u7248", 
        "image": {"url": "http://s1.cdn.xiachufang.com/01168de6f22011e5aa61a76bca3c36ed.jpg@2o_50sh_1pr_1l_620w_90q_1wh.jpg", "width": "620", "height": "368"}, 
        "author": {
          "url": "http://www.xiachufang.com/cook/100795343/", 
          "photo": "http://s2.cdn.xiachufang.com/083d285c84f011e591a3a3dd73125bfd.jpg?imageView2/1/w/160/h/160/interlace/1/q/90/format/jpg/.jpg",
          "id": "100795343", 
          "name": "moli\u53a8\u623f"},
         "n_cooked": "1", 
         "n_dishes": "1", 
         "score": "", 
         "recipe_id": "101769422", 
         "desc": "\u6ee1\u5c4b\u98d8\u7740\u6930\u9999\uff0c\u5473\u9053\u81ea\u7136\u8f6f\u7cef"},
     "column_name": ""},
//点击第四张图片
{"publish_time": "2016-05-03 00:00:14", 
 "url": "http://simplecms.xiachufang.com/posts/776/", 
 "template": 1, 
 "id": 2213, 
 "contents": {
     "image": {
        "url": "http://s2.cdn.xiachufang.com/50517a88103111e68695b82a72e00100.jpg?imageView2/2/interlace/1/q/85/format/jpg/.jpg",
        "width": "640", "height": "380"}, 
        "title": "\u8fd9\u79cd\u591a\u8089\u690d\u7269\uff0c\u62cc\u6c99\u62c9\u592a\u597d\u5403\uff01", 
        "desc": "\u9c81\u7eff\u5e84\u56ed\u519c\u573a | \u65b0\u9c9c\u51b0\u8349 2\u65a4\uff0c36.9\u5143\u987a\u4e30\u5305\u90ae\uff08\u539f\u4ef739.9\u5143\uff09\uff0c5.3\u81f35.8\u9650\u65f6\u4f18\u60e0"}, 
 "column_name": ""},
 //点击第五张图片
{"publish_time": "2016-05-03 00:00:12", "url": "http://simplecms.xiachufang.com/posts/790/", "template": 1, "id": 2216, "contents": {"image": {"url": "http://s1.cdn.xiachufang.com/1d4990a3103511e6b7ee956428eeca24.png@2o_50sh_1pr_1l_85q_1wh.jpg", "width": "640", "height": "380"}, 
 "desc": "\u6ce1\u9762\u867d\u4e0d\u5065\u5eb7\uff0c\u4f46\u7edd\u5bf9\u4e0d\u662f\u6bd2\u98df\uff0c\u6709\u5f88\u591a\u529e\u6cd5\u53ef\u4ee5\u5c06\u5176\u6539\u826f\u3002\u4eca\u5929\u603b\u7ed3\u8eab\u8fb9\u6ce1\u9762\u8fbe\u4eba\u7684\u7edd\u62db\uff0c\u6559\u4f60\u5982\u4f55\u628a\u6ce1\u9762\uff0c\u53d8\u6210\u5065\u5eb7\u53c8\u7f8e\u5473\u7684\u7b80\u9910\u3002", "title": "\u4e0d\u5403\u6ce1\u9762\u4f1a\u6b7b\u661f\u4eba\u7684\u6ce1\u9762\u6cd5\u5219"}, "column_name": ""},
 //点击第六张图片
{"publish_time": "2016-05-03 00:00:10", "url": "http://www.xiachufang.com/recipe_list/86/", "template": 2, "id": 2215, "contents": {"title_2nd": "42\u9053\u83dc\u8c31", "title_1st": "\u5c5e\u4e8e\u51b0\u6dc7\u6dcb\u7684\u5b63\u8282\uff0c\u7ec8\u4e8e\u6765\u4e86", "image": {"url": "http://s2.cdn.xiachufang.com/51ac6fcc7d1b11e5b5724711ca32c4dd.jpg?imageView2/2/w/620/interlace/1/q/90/format/jpg/.jpg", "width": "490", "height": "336"}}, "column_name": ""},
 //点击第七张图片
{"publish_time": "2016-05-03 00:00:08", 
 "url": "http://www.xiachufang.com/recipe/101799535/", 
 "template": 5, 
 "id": 2214, 
 "contents": {
    "video_url": "", 
    "title": "\u7167\u70e7\u9e21\u817f\u4fbf\u5f53", 
    "image": {
       "url": "http://s1.cdn.xiachufang.com/c653f61c0be911e6b2bb95b141a9cc8d.jpg@2o_50sh_1pr_1l_620w_90q_1wh.jpg", 
        "width": "579", 
        "height": "344"},
    "author": {
       "url": "http://www.xiachufang.com/cook/10164004/",
       "photo": "http://s2.cdn.xiachufang.com/12ac88ba815e11e589c0e9bc1990c0e6.jpg?imageView2/1/w/160/h/160/interlace/1/q/90/format/jpg/.jpg",
        "id": "10164004",
        "name": "Biu\u7237"},
    "desc": "\u7b80\u5355\u5feb\u624b\uff0c\u660e\u5929\u4fbf\u5f53\u5c31\u5b83\u4e86"},
 "column_name": ""},
 //点击第八张图片
{"publish_time": "2016-05-03 00:00:06", "url": "http://www.xiachufang.com/recipe/100121360/", "template": 5, "id": 2217, "contents": {"video_url": "", "author": {"url": "http://www.xiachufang.com/cook/10323404/", "photo": "http://s2.cdn.xiachufang.com/fd2f3572819a11e5b8fcb82a72e00100.jpg?imageView2/1/w/160/h/160/interlace/1/q/90/format/jpg/.jpg", "id": "10323404", "name": "\u5154\u9ad8\u5174"}, "image": {"url": "http://s2.cdn.xiachufang.com/98c00c877ddf11e59e3241082a12cf5e.jpg?imageView2/2/w/620/interlace/1/q/90/format/jpg/.jpg", "width": "620", "height": "368"}, "title": "\u5168\u9ea6\u997c\u5e72 \u00b7 \u5154\u5b50\u661f\u4eba", "n_cooked": "49", "n_dishes": "49", "score": "", "recipe_id": "100121360", "desc": "\u7b80\u5355\u7684\u6574\u5f62\u65b9\u6cd5\uff0c\u5916\u8868\u5446\u840c\u53e3\u611f\u9165\u8106"}, "column_name": ""},
 //点击第九张图片
{"publish_time": "2016-05-03 00:00:04", "url": "http://simplecms.xiachufang.com/posts/791/", "template": 1, "id": 2218, "contents": {"image": {"url": "http://s2.cdn.xiachufang.com/720c3e84103511e6a81ab82a72e00100.png?imageView2/2/interlace/1/q/85/format/jpg/.jpg", "width": "640", "height": "380"}, "title": "\u5317\u4eac\u7ae5\u8c23\u91cc\uff0c\u66fe\u5531\u8fc7\u8fd9\u6837\u4e00\u7897\u70b8\u9171\u9762", "desc": "\u4e00\u7897\u70ed\u4e4e\u7684\u70b8\u9171\u9762\u4e0b\u809a\uff0c\u5fc3\u91cc\u8981\u591a\u8212\u5766\u5c31\u6709\u591a\u8212\u5766\u3002\u8fd9\u65e5\u5b50\u5440\uff0c\u4e5f\u50cf\u8fd9\u5317\u4eac\u7ae5\u8c23\u91cc\u7684\u5404\u8272\u83dc\u7801\u4e00\u6837\uff0c\u6709\u6ecb\u6709\u5473\u513f\u8d77\u6765\u3002"}, "column_name": ""},
 //点击第十张图片
 {"publish_time": "2016-05-03 00:00:00", "url": "http://www.xiachufang.com/dish/116101377", "template": 4, "id": 2219, "contents": {"whisper": "", "image": {"url": "http://s2.cdn.xiachufang.com/694b953e107f11e6a6bdb82a72e00100.jpg?imageView2/2/interlace/1/q/85/format/jpg/.jpg", "width": "794", "height": "794"}}, "column_name": ""}], 
  "issue_id": 224,
  "publish_date": "2016-05-03",
  "today_events": []}]}} */
