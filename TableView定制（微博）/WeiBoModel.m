//
//  WeiBoModel.m
//  TableView定制（微博）
//
//  Created by liu on 16/9/19.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "WeiBoModel.h"

@implementation WeiBoModel


#pragma mark - 初始化方法（模型转字典）
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        
        //通过KVC的方式进行赋值。注意两点：1.字典必须包含其所有键，2.属性名必须和键一模一样。
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;

}

@end
