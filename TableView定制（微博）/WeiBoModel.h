//
//  WeiBoModel.h
//  TableView定制（微博）
//
//  Created by liu on 16/9/19.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiBoModel : NSObject


//文字
@property (nonatomic, copy) NSString *text;

//头像
@property (nonatomic, copy) NSString *icon;

//图片
@property (nonatomic, copy) NSString *picture;

//名字
@property (nonatomic, copy) NSString *name;

//是否是VIP
@property (nonatomic, assign) BOOL vip;


//通过一个字典来存储模型
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
