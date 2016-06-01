//
//  CellModel.m
//  KitchenProject
//
//  Created by 王阳阳 on 16/5/4.
//  Copyright © 2016年 WangYangYang. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

- (id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self)
    {
        self.url = dic[@"url"];
        self.contentsObj = [[Contents alloc] initWithContentsDic:dic[@"contents"]];
    }
    return self;
}

- (id)initWithFMResult:(FMResultSet *)set {
    self = [super init];
    if (self) {
        self.url = [set stringForColumn:@"url"];
        self.contentsObj = [Contents contentsWithFMResult:set];
        
    }
    return self;
}

+ (id)imageWithFMResult:(FMResultSet *)set {
    return [[self alloc] initWithFMResult:set];
}
@end

//图片
@implementation Image

- (id)initWithImageDic:(NSDictionary *)imageDic
{
    self = [super init];
    if (self)
    {
        self.url = imageDic[@"url"];
    }
    return self;
}

- (id)initWithFMResult:(FMResultSet *)set {
    self = [super init];
    if (self) {
        self.url = [set stringForColumn:@"url"];
    }
    return self;
}

+ (id)imageWithFMResult:(FMResultSet *)set {
    return [[self alloc] initWithFMResult:set];
}
@end


//作家
@implementation Author

- (id)initWithAuthorDic:(NSDictionary *)authorDic
{
    self = [super init];
    if (self)
    {
        self.url = authorDic[@"url"];
        self.photo = authorDic[@"photo"];
        self.name = authorDic[@"name"];
        self.ID = [authorDic[@"id"] integerValue];
    }
    return self;
}
- (id)initWithFMResult:(FMResultSet *)set {
    self = [super init];
    if (self) {
        self.url = [set stringForColumn:@"url"];
        self.photo = [set stringForColumn:@"photo"];
        self.name = [set stringForColumn:@"name"];
        
    }
    return self;
}

+ (id)authorWithFMResult:(FMResultSet *)set {
    return [[self alloc] initWithFMResult:set];
}


@end

//内容
@implementation Contents

- (id)initWithContentsDic:(NSDictionary *)contentsDic
{
    self = [super init];
    if (self)
    {
        self.title_1st = contentsDic[@"title_1st"];
        self.title_2nd = contentsDic[@"title_2nd"];
        self.desc = contentsDic[@"desc"];
        self.title = contentsDic[@"title"];
        self.imageObj = [[Image alloc] initWithImageDic:contentsDic[@"image"]];
        self.authorObj = [[Author alloc] initWithAuthorDic:contentsDic[@"author"]];
    }
    return self;
}

- (id)initWithFMResult:(FMResultSet *)set {
    self = [super init];
    if (self) {
        self.title_1st = [set stringForColumn:@"title_1st"];
        self.title_2nd = [set stringForColumn:@"title_2nd"];
        self.desc = [set stringForColumn:@"desc"];
        self.title = [set stringForColumn:@"title"];
        self.imageObj = [Image imageWithFMResult:set];
        self.authorObj = [Author authorWithFMResult:set];
    }
    return self;
}

+ (id)contentsWithFMResult:(FMResultSet *)set {
    return [[self alloc] initWithFMResult:set];
}




@end

