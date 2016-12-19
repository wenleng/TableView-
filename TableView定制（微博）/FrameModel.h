//
//  FrameModel.h
//  TableView定制（微博）
//
//  Created by liu on 16/9/19.
//  Copyright © 2016年 liu. All rights reserved.
//

//需要修改一下框架
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class WeiBoModel;

@interface FrameModel : NSObject

//文字frame
@property (nonatomic, assign) CGRect textFrame;

//头像frame
@property (nonatomic, assign) CGRect iconFrame;

//名字frame
@property (nonatomic, assign) CGRect nameFrame;

//VIPframe
@property (nonatomic, assign) CGRect vipFrame;

//图片frame
@property (nonatomic, assign) CGRect imageFrame;

//cell的高度
@property (nonatomic, assign) CGFloat cellHight;



//通过这个模型来算每一个CEll的frame
@property (nonatomic, assign) WeiBoModel *model;




@end
