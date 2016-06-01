//
//  CellModel.h
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 WangYangYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@class Image;
@class Author;
@class Contents;

@interface CellModel : NSObject

@property (nonatomic,copy)NSString *url;
@property (nonatomic,retain)Contents *contentsObj;
- (id)initWithDic:(NSDictionary *)dic;
- (id)initWithFMResult:(FMResultSet *)set;
+ (id)cellModelWithFMResult:(FMResultSet *)set;
@end



/*
 "image": {
    "url": "http://s1.cdn.xiachufang.com/015acc8f7d5611e59dbda54a361fa956.jpg@2o_50sh_1pr_1l_620w_90q_1wh.jpg",
    "width": "597",
    "height": "411"}
 */
//图片
@interface Image : NSObject

@property (nonatomic,copy)NSString *url;
- (id)initWithImageDic:(NSDictionary *)imageDic;
+ (id)imageWithFMResult:(FMResultSet *)set;
@end

/*"author": {
"url": "http://www.xiachufang.com/cook/10164004/",
"photo": "http://s2.cdn.xiachufang.com/12ac88ba815e11e589c0e9bc1990c0e6.jpg?imageView2/1/w/160/h/160/interlace/1/q/90/format/jpg/.jpg",
"id": "10164004",
"name": "Biu\u7237"},
*/
//作家
@interface Author : NSObject

@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *photo;
@property (nonatomic,copy)NSString *name;
- (id)initWithAuthorDic:(NSDictionary *)authorDic;
+ (id)authorWithFMResult:(FMResultSet *)set;
@end

/*"contents": {
    "title_2nd": "86\u9053\u83dc\u8c31",
    "title_1st": "\u56e4\u597d\u8fd9\u4e9b\u83dc\uff0c\u5077\u61d2\u4e5f\u80fd\u5403\u597d\u996d",
    "image": {"url": "http://s2.cdn.xiachufang.com/fd1f99dc7dbe11e592d6e5a9b56dcca8.jpg?imageView2/2/w/620/interlace/1/q/90/format/jpg/.jpg",
        "width": "581",
        "height": "400"}},
    "author": {
       "url": "http://www.xiachufang.com/cook/100795343/",
       "photo": "http://s2.cdn.xiachufang.com/083d285c84f011e591a3a3dd73125bfd.jpg?imageView2/1/w/160/h/160/interlace/1/q/90/format/jpg/.jpg",
       "id": "100795343",
       "name": "moli\u53a8\u623f"},
    "desc": "\u6ee1\u5c4b\u98d8\u7740\u6930\u9999\uff0c\u5473\u9053\u81ea\u7136\u8f6f\u7cef"},
 */
//内容
@interface Contents : NSObject

@property (nonatomic,copy)NSString *title_1st;
@property (nonatomic,copy)NSString *title_2nd;
@property (nonatomic,copy)NSString *desc;
@property (nonatomic,retain)Image *imageObj;
@property (nonatomic,retain)Author *authorObj;
@property (nonatomic,copy)NSString *title;
- (id)initWithContentsDic:(NSDictionary *)contentsDic;
+ (id)contentsWithFMResult:(FMResultSet *)set;
@end
