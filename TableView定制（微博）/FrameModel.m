//
//  FrameModel.m
//  TableView定制（微博）
//
//  Created by liu on 16/9/19.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "FrameModel.h"
#import "WeiBoModel.h"

@implementation FrameModel


- (void)setModel:(WeiBoModel *)model{
    
    _model = model;
    
    //=============计算各个子试图的frame======
    
    CGFloat W = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat margin = 15;
    
    
    //1.头像
    
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconW = 80;
    CGFloat iconH = iconW;
    
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //2.名字
    CGRect nameRect = [self.model.name boundingRectWithSize:CGSizeMake(1000, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    CGFloat nameX = margin + iconW + iconX;
    CGFloat nameW = nameRect.size.width;
    CGFloat nameH = nameRect.size.height;
    CGFloat nameY = iconY + iconH / 2.0f - nameH / 2.0f;
    self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    //3.vip
    
    CGFloat vipX = nameX + nameW + margin;
    CGFloat vipY = nameY;
    CGFloat vipW = nameH;
    CGFloat VipH = vipW;
    
    self.vipFrame = CGRectMake(vipX, vipY, vipW, VipH);
    
    //4.文字内容
    CGRect textRect = [self.model.text boundingRectWithSize:CGSizeMake(W - margin * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    CGFloat textX = iconX;
    CGFloat textY = iconY + iconH + margin;
    CGFloat textW = textRect.size.width;
    CGFloat textH = textRect.size.height;
    self.textFrame = CGRectMake(textX, textY, textW, textH);
    
    //5.图片
    
    UIImage *image = [UIImage imageNamed:self.model.picture];
    
    CGFloat imageX = iconX;
    CGFloat imageY = textY +textH +margin;
    CGFloat imageW = image.size.width / 2.0f;
    CGFloat imageH = image.size.height /2.0f;
    
    self.imageFrame = CGRectMake(imageX, imageY, imageW, imageH);
    
    //6做判断
    if (self.model.picture) {
        
        self.cellHight = imageY + imageH + margin;
        
    }else{
        
        self.cellHight = textY +textH + margin;
    }
    
    
    
}

@end
