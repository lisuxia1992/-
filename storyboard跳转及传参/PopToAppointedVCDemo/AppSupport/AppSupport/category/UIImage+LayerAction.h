//
//  UIImage+LayerAction.h
//  PopToAppointedVCDemo
//
//  Created by jihuiduo on 16/8/8.
//  Copyright © 2016年 number1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LayerAction)
/** 设置圆角图片(放到分类中使用) */
- (UIImage *)cutCircleImageWithCorner:(CGFloat) radius;
/*通过图片Data数据第一个字节 来获取图片扩展名*/
- (NSString *)contentTypeForImageData:(NSData *)data;

@end
