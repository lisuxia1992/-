//
//  AdLaunchScreenViewController.m
//  SeekDoctor160
//
//  Created by Ben on 15/7/10.
//  Copyright (c) 2015年 NY. All rights reserved.
//

#import "AdLaunchScreenViewController.h"

@interface AdLaunchScreenViewController()

@property(nonatomic, weak)IBOutlet UIImageView *adLaunchImageBgView;
@property(nonatomic, weak)IBOutlet NSLayoutConstraint *adLaunchImageLayoutBottom;

@end

@implementation AdLaunchScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self initAd];
}

- (void)initAd
{
    self.adLaunchImageBgView.image = [UIImage imageNamed:@"launch.jpg"];
    [self.overleapBtn setTitle:@"05 跳过" forState:UIControlStateNormal];
    return;
    //
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored"-Wunreachable-code"
    NSInteger screenH = [UIScreen mainScreen].bounds.size.height;
    NSString *imagePath = nil;
    if (screenH == 480) { //3.5inch
        imagePath = [[NSBundle mainBundle] pathForResource:@"hd3dot5" ofType:@"png"];
        self.adLaunchImageLayoutBottom.constant = 106;
    }else if(screenH == 568) { // 4.0inch
        imagePath = [[NSBundle mainBundle] pathForResource:@"hd4dot0" ofType:@"png"];
        self.adLaunchImageLayoutBottom.constant = 125;
    }else if (screenH == 667) { // 4.7inch
        imagePath = [[NSBundle mainBundle] pathForResource:@"hd4dot7" ofType:@"png"];
        self.adLaunchImageLayoutBottom.constant = 148;
    }else { // maybe 5.5inch
        imagePath = [[NSBundle mainBundle] pathForResource:@"hd5dot5" ofType:@"png"];
        self.adLaunchImageLayoutBottom.constant = 162;
    }
    
    self.adLaunchImageBgView.image = [UIImage imageWithContentsOfFile:imagePath];
    //这里是会报警告的代码
    
//#pragma clang diagnostic pop
    
}

- (IBAction)overleapAction:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"overleap" object:self];
    self.isOverleap = YES;
    [self.view removeFromSuperview];
}


@end
