//
//  WeiBoTableViewCell.h
//  TableView定制（微博）
//
//  Created by liu on 16/9/19.
//  Copyright © 2016年 liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiBoModel;
@class FrameModel;

@interface WeiBoTableViewCell : UITableViewCell


//接收cell对应的数据
@property(nonatomic, strong)WeiBoModel * model;
//接收cell对应的frame
@property(nonatomic, strong)FrameModel * frameModel;




@end
