//
//  FifthViewController.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/10.
//  Copyright © 2015年 number1. All rights reserved.
//

#import "FifthViewController.h"
#import "UIViewController+CustomTracker.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface FifthViewController ()

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonAction:(id)sender {
    
    [self performSegueWithIdentifier:@"third" sender:self];
    //UIViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:[self indexForDestinationVC:NSStringFromClass([SecondViewController class])]] animated:YES];
    
}

-(void)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC
{
    
}
/**
 *  @author Cherry, 2016-01-13 10:20:36
 *
 *  @brief 询问是否处理UnwindSegue的action
 *
 *  @param action             UnwindSegue的action
 *  @param fromViewController 目标源控制器
 *  @param sender             参数
 *
 *  @return 返回是否可以处理
 */
//-(BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender

//{
    //return YES;
//}

- (IBAction)unwindToFifthViewController:(UIStoryboardSegue *)segue {
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
