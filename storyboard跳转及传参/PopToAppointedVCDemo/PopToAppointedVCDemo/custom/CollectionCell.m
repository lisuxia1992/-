//
//  Demo5Cell.m
//  YXCollectionView
//
//  Created by yixiang on 15/10/19.
//  Copyright © 2015年 yixiang. All rights reserved.
//

#import "CollectionCell.h"

@interface CollectionCell()

@property (nonatomic , strong) UILabel *titleLabel;

@end

@implementation CollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = self.contentView.frame;
    
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

@end
