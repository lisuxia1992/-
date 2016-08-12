//
//  LaunchView.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 16/1/4.
//  Copyright © 2016年 number1. All rights reserved.
//

#import "LaunchView.h"
#import "UIImage+LayerAction.h"

@implementation LaunchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        [self addSubview:_iconView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _iconView.frame = CGRectMake((self.bounds.size.width - 80)/2, (self.bounds.size.height/2 - 80)/2 + 64, 80, 80);
    
    _titleLabel.frame = CGRectMake(0, self.bounds.size.height/2, self.bounds.size.width, self.bounds.size.height/2);
}

- (void)setIconName:(NSString *)iconName{
    
    _iconView.image = [UIImage imageNamed:iconName];
    UIImage *image = [UIImage imageNamed:iconName];
   [image cutCircleImageWithCorner:3];
}
@end
