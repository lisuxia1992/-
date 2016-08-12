//
//  FourViewController.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/10.
//  Copyright © 2015年 number1. All rights reserved.
//

#import "FourViewController.h"
#import "UIViewController+CustomTracker.h"
#import "FifthViewController.h"
@interface FourViewController ()

@end

@implementation FourViewController

-(void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)unwindToFourViewController:(UIStoryboardSegue *)segue {
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
