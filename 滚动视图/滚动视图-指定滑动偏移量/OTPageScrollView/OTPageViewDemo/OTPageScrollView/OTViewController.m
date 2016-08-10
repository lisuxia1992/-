//
//  OTViewController.m
//  OTPageScrollView
//
//  Created by akron on 7/22/14.
//  Copyright (c) 2014 Oolong Tea. All rights reserved.
//

#import "OTViewController.h"
#import "OTPageScrollView.h"
#import "OTPageView.h"

CGFloat contentWidth = 0;

@interface OTViewController ()<OTPageScrollViewDataSource,OTPageScrollViewDelegate>

@end

@implementation OTViewController{
    NSArray *_dataArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    contentWidth = self.view.frame.size.width - 80;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    OTPageView *PScrollView = [[OTPageView alloc] initWithFrame:CGRectMake(0, 60, [[UIScreen mainScreen] bounds].size.width, 200)];
    PScrollView.pageScrollView.dataSource = self;
    PScrollView.pageScrollView.Customdelegate = self;
    PScrollView.pageScrollView.padding = 20;
    PScrollView.pageScrollView.frame = CGRectMake(40, 60, contentWidth, 100);
    PScrollView.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:139.0f/255.0f blue:139.0f/255.0f alpha:1.0f];
    _dataArray = [NSArray arrayWithObjects:
                          @"0 Google",
                          @"1 Yahoo",
                          @"2 Facebook",
                          @"3 Twitter",
                          @"4 Amazon",
                          @"5 microsoft",
                          nil];
     [PScrollView.pageScrollView reloadData];
     [self.view addSubview:PScrollView];
    
}

- (NSInteger)numberOfPageInPageScrollView:(OTPageScrollView*)pageScrollView{
    return [_dataArray count];
}

- (UIView *)pageScrollView:(OTPageScrollView*)pageScrollView viewForRowAtIndex:(int)index{
    UIImageView *cell = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, contentWidth, 100)];
    cell.backgroundColor = [UIColor colorWithRed:191.0f/255.0f green:239.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, cell.frame.size.width-40, cell.frame.size.height - 40)];
    label.text = _dataArray[index];
    [cell addSubview:label];
    return cell;
}

- (CGSize)sizeCellForPageScrollView:(OTPageScrollView*)pageScrollView
{
    return CGSizeMake(contentWidth, 100);
}

- (void)pageScrollView:(OTPageScrollView *)pageScrollView didTapPageAtIndex:(NSInteger)index{
    NSLog(@"click cell at %ld",(long)index);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSLog(@"click cell at %ld",(long)index);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
