//
//  CustomNavigationViewController.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 16/1/14.
//  Copyright © 2016年 number1. All rights reserved.
//

#import "CustomNavigationViewController.h"

@interface CustomNavigationViewController ()

@end

@implementation CustomNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//继承UINavigationController,加入一个实现
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //适配ios7
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)){
        self.navigationBar.translucent = NO;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
