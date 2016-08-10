//
//  InsetsLabel.m
//  YSZS
//
//  Created by 李素霞 on 15/8/24.
//  Copyright (c) 2015年 meng. All rights reserved.
//

#import "InsetsLabel.h"

@implementation InsetsLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize insets=_insets;
-(id) initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets {
    self = [super initWithFrame:frame];
    if(self){
        self.insets = insets;
    }
    return self;
}
-(id) initWithInsets:(UIEdgeInsets)insets {
    self = [super init];
    if(self){
    self.insets = insets;
    }
    return self;
}
-(void) drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
