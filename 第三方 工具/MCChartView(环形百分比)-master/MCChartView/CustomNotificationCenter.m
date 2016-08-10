//
//  CustomNotificationCenter.m
//  MCChartView
//
//  Created by Cherry on 16/3/21.
//  Copyright © 2016年 zhmch0329. All rights reserved.
//

#import "CustomNotificationCenter.h"

//你的单例中心，如何写单例有不少教程
static CustomNotificationCenter *yourNotificationCenter;

@implementation CustomNotificationCenter

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    [super addObserver:observer selector:aSelector name:aName object:anObject];
    
}

- (void)postNotification:(NSNotification *)notification
{
    [super postNotification:notification];
    
}
- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
    [super postNotificationName:aName object:anObject userInfo:aUserInfo];
    
}

- (void)removeObserver:(id)observer
{
    [super removeObserver:observer];
}

- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject
{
    [super removeObserver:observer name:aName object:anObject];
    
}


@end
