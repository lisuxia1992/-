//
//  ThirdViewController.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/10.
//  Copyright © 2015年 number1. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIViewController+CustomTracker.h"
#import "FourViewController.h"


@interface ThirdViewController ()

@end

@implementation ThirdViewController

-(void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)unwindToThirdViewController:(UIStoryboardSegue *)segue {
    UIViewController *sourceVC = segue.destinationViewController;
    
    NSLog(@"unwindSegue %@     source VC  = %@", segue , [sourceVC class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
