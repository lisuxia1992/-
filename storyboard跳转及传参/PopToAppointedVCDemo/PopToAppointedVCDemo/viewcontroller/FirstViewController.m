//
//  FirstViewController.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/10.
//  Copyright © 2015年 number1. All rights reserved.
//

#import "FirstViewController.h"
#import "UIViewController+CustomTracker.h"
#import "SecondViewController.h"

@interface FirstViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation FirstViewController

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentTextView.text = self.content;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification) name:UITextViewTextDidChangeNotification object:nil];
    /*相同的通知添加多遍,移除一遍不会闪退*/
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification) name:UITextViewTextDidChangeNotification object:nil];
}

-(void)notification
{
    NSLog(@"textview's text did changed");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *firstVC = segue.destinationViewController;
    [self indexForCurrentVC:self.navigationController currentVC:firstVC];
}

- (IBAction)unwindToFirstViewController:(UIStoryboardSegue *)segue {
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
