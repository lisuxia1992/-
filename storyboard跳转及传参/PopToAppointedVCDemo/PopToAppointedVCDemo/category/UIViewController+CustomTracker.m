//
//  UIViewController+CustomTracker.m
//  PopWallPapers
//
//  Created by sugar chen on 12-10-6.
//  Copyright (c) 2012年 NULL. All rights reserved.
//

#import "UIViewController+CustomTracker.h"

#ifndef RGBACOLOR
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/256.0 green:g/256.0 blue:b/256.0 alpha:a]
#endif

#define  TABBAR_HEIGHT 49
@implementation UIViewController (CustomTracker)


+ (instancetype)defaultViewControllerWithStoryboard:(NSString *)name
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

-(void)setNavigationTitle:(NSString *)customTitle
{
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.navigationItem.title = customTitle;
}

-(void)indexForCurrentVC:(UINavigationController *)currentNav currentVC:(UIViewController *)currentVC
{
    if ([self.navigationController.viewControllers containsObject:currentVC]) {
        NSInteger index = [self.navigationController.viewControllers indexOfObject:currentVC];
        if (![[NSUserDefaults standardUserDefaults] objectForKey:NSStringFromClass([currentVC class])]) {
            [[NSUserDefaults standardUserDefaults] setObject:@(index) forKey:[NSString stringWithFormat:@"%@",NSStringFromClass([currentVC class])]];
        }
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@(-1) forKey:[NSString stringWithFormat:@"%@",NSStringFromClass([currentVC class])]];
    }
}

-(NSInteger)indexForDestinationVC:(NSString *)destinationVC
{
    NSInteger index = [[[NSUserDefaults standardUserDefaults] objectForKey:destinationVC] integerValue];
    if (index && index != -1) {
        return [[[NSUserDefaults standardUserDefaults] objectForKey:destinationVC] integerValue];
    }
    return 0;
}

-(void)clearIndex:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}


@end
