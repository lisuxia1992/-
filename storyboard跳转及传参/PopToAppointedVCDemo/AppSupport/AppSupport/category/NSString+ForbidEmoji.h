//
//  NSString+ForbidEmoji.h
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/18.
//  Copyright © 2015年 number1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ForbidEmoji)
/*禁止表情输入*/
- (NSString *)disable_emoji:(NSString *)text;
/*字符串是否包含表情*/
-(BOOL)stringContainsEmoji:(NSString *)string;
@end
