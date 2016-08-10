//
//  CustomNotificationCenter.h
//  MCChartView
//
//  Created by Cherry on 16/3/21.
//  Copyright © 2016年 zhmch0329. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomNotificationCenter : NSNotificationCenter
{
    //通过key value存放你的notificationName和observer
    NSMutableDictionary *observers;
    
    //异步队列，当然你也可以不需要这个，直接通过线程delay去做
    NSNotificationQueue *queue;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;

- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject;


@end
