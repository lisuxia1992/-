//
//  MCPieChartViewController.m
//  MCChartView
//
//  Created by zhmch0329 on 15/8/20.
//  Copyright (c) 2015年 zhmch0329. All rights reserved.
//

#import "MCPieChartViewController.h"
#import "MCPieChartView.h"
#import "UIColor+Extends.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface MCPieChartViewController () <MCPieChartViewDataSource, MCPieChartViewDelegate>

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) MCPieChartView *pieChartView;

@end

@implementation MCPieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor colorWithRed:31/255.0 green:31/255.0 blue:85/255.0 alpha:1.0];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshData)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@100,@200,@300,@200, nil];
    _dataSource = [NSArray arrayWithArray:mutableArray];
    
    _pieChartView = [[MCPieChartView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width - 140)];
    _pieChartView.dataSource = self;
    _pieChartView.delegate = self;
    //_pieChartView.circle = NO;//是否自动计算总数
    //_pieChartView.ringTitle = @"总收益\n467.00";
    _pieChartView.ringWidth = 36;//圆环宽度
    [self.view addSubview:_pieChartView];
    _pieChartView.backgroundColor = [UIColor clearColor];
    [_pieChartView reloadDataWithAnimate:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshData {
    //NSMutableArray *mutableArray = [NSMutableArray array];
    //for (NSInteger i = 0; i < 4; i ++) {
        //[mutableArray addObject:@(arc4random()%400)];
    //}
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@65,@70,@132,@200, nil];
    _dataSource = [NSArray arrayWithArray:mutableArray];
    [_pieChartView reloadData];
}

- (NSInteger)numberOfPieInPieChartView:(MCPieChartView *)pieChartView {
    return _dataSource.count;
}

- (id)pieChartView:(MCPieChartView *)pieChartView valueOfPieAtIndex:(NSInteger)index {
    return _dataSource[index];
}

//中间提示文案view
//- (UIView *)ringViewInPieChartView:(MCPieChartView *)pieChartView
//{
    //UIView *centerView = [[UIView alloc] init];
    //centerView.backgroundColor = [UIColor orangeColor];
    ////centerView.center = _pieChartView.center;
    //centerView.frame = CGRectMake(_pieChartView.frame.origin.x + _pieChartView.ringWidth, _pieChartView.frame.origin.y + _pieChartView.ringWidth, (_pieChartView.bounds.size.width - _pieChartView.ringWidth)/2.0, (_pieChartView.bounds.size.width - _pieChartView.ringWidth)/2.0);
    ////centerView.bounds = CGRectMake(0, 0, _pieChartView.bounds.size.width - _pieChartView.ringWidth, _pieChartView.bounds.size.width - _pieChartView.ringWidth);
    ////[_pieChartView addSubview:centerView];
    //UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(centerView.frame), CGRectGetHeight(centerView.frame))];
    //titleLabel.text = _pieChartView.ringTitle;
    //titleLabel.center = centerView.center;
    //titleLabel.numberOfLines = 0;
    //titleLabel.tag = 't';
    //titleLabel.textAlignment = NSTextAlignmentCenter;
    //titleLabel.backgroundColor = [UIColor purpleColor];
    //[centerView addSubview:titleLabel];
    //return centerView;
//}

//- (id)sumValueInPieChartView:(MCPieChartView *)pieChartView {
    //return @400;
//}

- (NSAttributedString *)ringTitleInPieChartView:(MCPieChartView *)pieChartView {
    return [[NSAttributedString alloc] initWithString:_pieChartView.ringTitle attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:22.0], NSForegroundColorAttributeName:[UIColor blackColor]}];
}

- (UIColor *)pieChartView:(MCPieChartView *)pieChartView colorOfPieAtIndex:(NSInteger)index {
    //NSMutableArray *colorArray = [NSMutableArray arrayWithCapacity:0];
    NSArray *normalColor = [NSMutableArray arrayWithObjects:[UIColor colorWithHexString:@"#ff1133"],[UIColor colorWithHexString:@"#6f88fe"],[UIColor colorWithHexString:@"#00ffbb"],[UIColor colorWithRed:0/255.0 green:207/255.0 blue:187/255.0 alpha:1.0], nil];

    //所有扇形之间都加上白色间隙
    //for (int i = 0; i < _dataSource.count; i++) {
        //if (index % 2 == 1) {
            //UIColor *color = [UIColor whiteColor];
            //[colorArray addObject:color];
        //}else{
            //[colorArray addObject:[normalColor objectAtIndex:index/2]];
        //}
    //}
    //以下是随机颜色值
    //for (int i = 0; i < 5; i++) {
        //srand((unsigned)time(0));  //不加这句每次产生的随机数不变
        //UIColor *randomColor = [UIColor colorWithRed:(255 + arc4random()%255) green:(255 + arc4random()%255) blue:(255 + arc4random()%255) alpha:1.0];
        //[colorArray addObject:randomColor];
    //}
    
    return [normalColor objectAtIndex:index];
    
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com