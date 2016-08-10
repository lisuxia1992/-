//
//  CustomNotificition.h
//  MCChartView
//
//  Created by Cherry on 16/3/21.
//  Copyright © 2016年 zhmch0329. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomNotificition : NSNotification
{
    //所需数据
    id object;
    id observer;
    SEL selector;
}


@end
