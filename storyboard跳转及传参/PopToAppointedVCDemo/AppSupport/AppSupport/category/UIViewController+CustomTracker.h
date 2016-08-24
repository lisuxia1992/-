//
//  UIViewController+CustomTracker.h
//  PopWallPapers
//
//  Created by sugar chen on 12-10-6.
//  Copyright (c) 2012年 NULL. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (CustomTracker)

/*根据storyboard的名字获取Viewcontroller对象*/
+ (instancetype)defaultViewControllerWithStoryboard:(NSString *)name;
/*存储当前VC所在位置*/
-(void)indexForCurrentVC:(UINavigationController *)currentNav currentVC:(UIViewController *)currentVC;
/*获取当前VC所在位置*/
-(NSInteger)indexForDestinationVC:(NSString *)destinationVC;
/*清除某个VC存储的位置*/
-(void)clearIndex:(NSString *)key;
/*设置NAV的title*/
-(void)setNavigationTitle:(NSString *)customTitle;

@end