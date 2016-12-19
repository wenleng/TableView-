//
//  WeiBoTableViewCell.m
//  TableView定制（微博）
//
//  Created by liu on 16/9/19.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "WeiBoTableViewCell.h"

#import "WeiBoModel.h"

#import "FrameModel.h"

#pragma mark - 声明子试图

@interface WeiBoTableViewCell (){
    
    
    UIImageView *_iconImge;
    
    UILabel *_nameLabel;
    
    UIImageView *_vipImage;
    
    UILabel *_textLabel;
    
    UIImageView *_imagePricture;
}

@end

@implementation WeiBoTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _iconImge = [[UIImageView alloc]init];
        
        [self.contentView addSubview:_iconImge];
        
        _nameLabel = [[UILabel alloc]init];
        
        [self.contentView addSubview:_nameLabel];
        _nameLabel.font = [UIFont systemFontOfSize:14];
      //  _nameLabel.adjustsFontSizeToFitWidth = YES;
        
        
        _vipImage =[[ UIImageView alloc]init];
        
        [self.contentView addSubview:_vipImage];
        _vipImage.image = [UIImage imageNamed:@"vip"];
        
        _textLabel = [[UILabel alloc]init];
        
        [self.contentView addSubview:_textLabel];
        _textLabel.numberOfLines = 0;
        _textLabel.font = [UIFont systemFontOfSize:14];
        
        _imagePricture  = [[UIImageView alloc]init];
        
        [self.contentView addSubview:_imagePricture];
        
    }
    return self;
    
    
}

#pragma mark - 计算frame
- (void)layoutSubviews{
    
    _iconImge.frame = self.frameModel.iconFrame;
    
    _nameLabel.frame = self.frameModel.nameFrame;
    
    _vipImage.frame = self.frameModel.vipFrame;
    
    _textLabel.frame = self.frameModel.textFrame;
    
    _imagePricture.frame = self.frameModel.imageFrame;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - 重写set方法，给成员变量赋值
- (void)setModel:(WeiBoModel *)model{
    
    _model = model;
    
    _iconImge.image = [UIImage imageNamed:self.model.icon];
    
    _nameLabel.text = self.model.text;
    
    if (model.vip) {
        
        _vipImage.hidden = NO;
        _nameLabel.textColor = [UIColor redColor];
        
        
    }else{
        
        _vipImage.hidden = YES;
        _nameLabel.textColor = [UIColor blackColor];
    }
    
    _textLabel.text =  self.model.text;
    
    _imagePricture.image = [UIImage imageNamed:self.model.picture];
    
    
    
}

@end
