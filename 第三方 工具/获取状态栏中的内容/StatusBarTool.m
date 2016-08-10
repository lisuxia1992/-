//
//  StatusBarTool.m
//  多线程-02.加载图片
//
//  Created by Cherry on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "StatusBarTool.h"

@implementation StatusBarTool
+(NSString *)currentBatteryPercent{
    
    NSArray *infoArray = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    for (id info in infoArray)
        
    {
        
        if ([info isKindOfClass:NSClassFromString(@"UIStatusBarBatteryPercentItemView")])
            
        {
            
            NSString *percentString = [info valueForKeyPath:@"percentString"];
            
            NSLog(@"电量为：%@",percentString);
            
            return percentString;
            
        }
        
    }
    
    return @"";
    
}

+(NSString *)currentNetworkType{
    
    NSArray *infoArray = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    NetWorkType type;
    
    for (id info in infoArray)
        
    {
        
        if ([info isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            
            type = [[info valueForKeyPath:@"dataNetworkType"] integerValue];
            
            NSLog(@"—-%lu", (unsigned long)type);
            
            switch (type) {
                case NetWorkType2G:
                    return @"2G";
                    break;
                case NetWorkType3G:
                    return @"3G";
                case NetWorkType4G:
                    return @"4G";
                case NetWorkTypeWiFI:
                    return @"WiFi";
                default:
                    break;
            }
            
        }
        
    }
    
    return @"无网络";
    
}

+(NSString *)currentTimeString{
    
    NSArray *infoArray = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    for (id info in infoArray)
        
    {
        
        if ([info isKindOfClass:NSClassFromString(@"UIStatusBarTimeItemView")])
            
        {
            
            NSString *timeString = [info valueForKeyPath:@"timeString"];
            
            NSLog(@"当前显示时间为：%@",timeString);
            
            return timeString;
            
        }
        
    }
    
    return @"";
    
}

+(NSString *)serviceCompany{
    
    NSArray *infoArray = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    for (id info in infoArray)
        
    {
        
        if ([info isKindOfClass:NSClassFromString(@"UIStatusBarServiceItemView")])
            
        {
            
            NSString *serviceString = [info valueForKeyPath:@"serviceString"];
            
            NSLog(@"运营商为：%@",serviceString);
            
            return serviceString;
            
        }
        
    }
    
    return @"";
    
}


@end
