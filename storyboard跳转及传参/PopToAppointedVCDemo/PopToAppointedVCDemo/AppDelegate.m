//
//  AppDelegate.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/10.
//  Copyright © 2015年 number1. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIViewController+CustomTracker.h"
#import "UncaughtExceptionHandler.h"
#import "AdLaunchScreenViewController.h"

#define DAY_SECOND 24*60*60*60*1000

@interface AppDelegate ()
{
    long long _expectedLeght;
    NSURLConnection *_conn;
    NSData *_recieveData;
    UIView *_adLaunchView;
    UIWindow * tempWindow;
    
}
@end

@implementation AppDelegate

//void UncaughtExceptionHandler(NSException *exception) {
//    NSArray *arr = [exception callStackSymbols];//得到当前调用栈信息
//    NSString *reason = [exception reason];//非常重要，就是崩溃的原因
//    NSString *name = [exception name];//异常类型
//    NSLog(@"exception type : %@ \n crash reason : %@ \n call stack info : %@", name, reason, arr);
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor cyanColor]];//全局更改导航栏颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//全局更改导航栏 item颜色
    
    self.window.backgroundColor = [UIColor greenColor];
    NSLog(@"%d  -----  %d",1000/DAY_SECOND,1000/(24*60*60*60*1000));//宏定义一定注意加括号，尤其是多运算符时
    
    //[self performSelector:@selector(initAdView) withObject:nil afterDelay:2];
    //[self initAdView];
    NSLog(@"----22222----");
    NSLog(@"---aaaaa----");
    //sleep(3);
    NSLog(@"---bbbbb----");
    //InstallUncaughtExceptionHandler();
    //NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    return YES;
    
}

-(void)initAdView
{
    NSLog(@"----11111----");
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    AdLaunchScreenViewController *adLaunchViewVC = [[AdLaunchScreenViewController alloc]initWithNibName:@"LaunchView" bundle:nil];
    _adLaunchView = adLaunchViewVC.view;
    _adLaunchView.frame = delegate.window.frame;
    [_adLaunchView setNeedsLayout];
    //_adLaunchView
    [delegate.window addSubview:_adLaunchView];
    //[self.view bringSubviewToFront:adLaunchView];
    
    [UIView animateWithDuration:2 animations:^{
        _adLaunchView.alpha = 0;
    } completion:^(BOOL finished) {
        [_adLaunchView removeFromSuperview];
        
    }];
   
}

-(void)requestImage
{
    UIView *bgView = [[UIView alloc] initWithFrame:self.window.frame];
    bgView.backgroundColor = [UIColor redColor];
    [self.window addSubview:bgView];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"active" object:nil];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
