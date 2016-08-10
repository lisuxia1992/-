//
//  StatusBarTool.h
//  多线程-02.加载图片
//
//  Created by Cherry on 16/3/7.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

//0 - 无网络 ; 1 - 2G ; 2 - 3G ; 3 - 4G ; 5 - WIFI

typedef NS_ENUM(NSUInteger, NetWorkType) {
    
    NetWorkTypeNone=0,
    
    NetWorkType2G=1,
    
    NetWorkType3G=2,
    
    NetWorkType4G=3,
    
    NetWorkTypeWiFI=5,
    
};

@interface StatusBarTool : NSObject

/**
 
 * @return 当前网络类型
 
 */

+(NSString *)currentNetworkType;

/**
 
 * @return SIM卡所属的运营商（公司）
 
 */

+(NSString *)serviceCompany;

/**
 
 * @return 当前电池电量百分比
 
 */

+(NSString *)currentBatteryPercent;

/**
 
 * @return 当前时间显示的字符串
 
 */

+(NSString *)currentTimeString;

@end


