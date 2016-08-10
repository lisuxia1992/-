//
//  UIColor+Extends.h
//  AppSupport
//
//  Created by Ben on 15/7/21.
//  Copyright (c) 2015年 NY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extends)

+ (UIColor *)colorWithHex:(int32_t)hex;
+ (UIColor *)colorWithHex:(int32_t)hex alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGB:(NSInteger)r G:(NSInteger)g B:(NSInteger)b;
+ (UIColor *)colorWithRGB:(NSInteger)r G:(NSInteger)g B:(NSInteger)b alpha:(CGFloat)a;
+ (UIColor *) colorWithHexString: (NSString *)color;

@end
