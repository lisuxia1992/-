//
//  UncaughtExceptionHandler.h
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/17.
//  Copyright © 2015年 number1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UncaughtExceptionHandler : NSObject<UIAlertViewDelegate>
{
    BOOL dismissed;
}

@end
void HandleException(NSException *exception);
void SignalHandler(int signal);


void InstallUncaughtExceptionHandler(void);

