//
//  MCPieChartView.m
//  MCChartView
//
//  Created by zhmch0329 on 15/8/20.
//  Copyright (c) 2015年 zhmch0329. All rights reserved.
//

#import "MCPieChartView.h"

#define PIE_CHART_PADDING 16.0

@interface MCPieChartView ()

@property (nonatomic, strong) NSMutableArray *chartDataSource;
@property (nonatomic, strong) NSMutableArray *pathArray;

@end

@implementation MCPieChartView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    self.backgroundColor = [UIColor clearColor];
    
    _centerPoint = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
    _radius = MIN(CGRectGetWidth(self.bounds)/2 - PIE_CHART_PADDING, CGRectGetHeight(self.bounds)/2);
    _ring = YES;
    //_ringWidth = _radius;
    _circle = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (self.chartDataSource == nil) {
        [self reloadData];
    }
    //if ([self.delegate respondsToSelector:@selector(ringViewInPieChartView:)]) {
        //UIView *view = [self.delegate ringViewInPieChartView:self];
        //view.center = CGPointMake(_centerPoint.x, _centerPoint.y);
        //[self addSubview:view];
        //UILabel *titleLabel = (UILabel *)[view viewWithTag:'t'];
        //titleLabel.center = view.center;
    //}
    if (![self.delegate respondsToSelector:@selector(ringViewInPieChartView:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [paragraphStyle setLineBreakMode:NSLineBreakByClipping];
        [paragraphStyle setAlignment:NSTextAlignmentCenter];
        if ([self.delegate respondsToSelector:@selector(ringTitleInPieChartView:)]) {
            NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithAttributedString:[self.delegate ringTitleInPieChartView:self]];
            [title addAttribute:NSForegroundColorAttributeName
                                value:[UIColor lightGrayColor]
                                range:NSMakeRange(0, 3)];
            [title addAttribute:NSFontAttributeName
                          value:[UIFont systemFontOfSize:14]
                          range:NSMakeRange(0, 3)];
            [title addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, title.length)];
            CGSize titleSize = [title size];
            CGRect titleRect = CGRectMake(_centerPoint.x - titleSize.width/2, _centerPoint.y - titleSize.height/2, titleSize.width, titleSize.height);
            [title drawInRect:titleRect];
        } else if (_ringTitle.length > 0) {
            NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
            [paragraphStyle setLineBreakMode:NSLineBreakByClipping];
            [paragraphStyle setAlignment:NSTextAlignmentCenter];
            NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:_ringTitle attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:22.0], NSForegroundColorAttributeName: [UIColor blackColor], NSParagraphStyleAttributeName: paragraphStyle}];
            [title addAttribute:NSForegroundColorAttributeName
                          value:[UIColor lightGrayColor]
                          range:NSMakeRange(0, 3)];
            [title addAttribute:NSFontAttributeName
                          value:[UIFont systemFontOfSize:14]
                          range:NSMakeRange(0, 3)];
            CGSize titleSize = [title size];
            CGRect titleRect = CGRectMake(_centerPoint.x - titleSize.width/2, _centerPoint.y - titleSize.height/2, titleSize.width, titleSize.height);
            [title drawInRect:titleRect];
        }
    }
}

- (void)reloadData {
    [self reloadDataWithAnimate:NO];
}

- (void)reloadDataWithAnimate:(BOOL)animate {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    NSAssert([self.dataSource respondsToSelector:@selector(numberOfPieInPieChartView:)], @"You must implemetation the 'numberOfPieInPieChartView:' method");
    NSAssert([self.dataSource respondsToSelector:@selector(pieChartView:valueOfPieAtIndex:)], @"You must implemetation the 'pieChartView:valueOfPieAtIndex:' method");
    NSInteger numberOfPie = [self.dataSource numberOfPieInPieChartView:self];
    _chartDataSource = [NSMutableArray arrayWithCapacity:numberOfPie];
    _pathArray = [NSMutableArray arrayWithCapacity:numberOfPie];
    for (NSInteger index = 0; index < numberOfPie; index ++) {
        id value = [self.dataSource pieChartView:self valueOfPieAtIndex:index];
        [_chartDataSource addObject:value];
    }
    CGFloat sumValue = 0.0;
    if ([self.dataSource respondsToSelector:@selector(sumValueInPieChartView:)]) {
        sumValue = [[self.dataSource sumValueInPieChartView:self] floatValue];
    } else if (_circle) {
        for (int i = 0; i < _chartDataSource.count; i++) {
            id value = [_chartDataSource objectAtIndex:i];
            //if (i % 2 == 0) {
                sumValue += [value floatValue];
            //}
        }
    } else {
        NSAssert([self.dataSource respondsToSelector:@selector(sumValueInPieChartView:)], @"You must have a sumValue");
    }
    _ringTitle = [NSString stringWithFormat:@"总收益\n%.2f",sumValue];
    //画圆环
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:_centerPoint radius:_radius - _ringWidth/2 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    //画圆
    //UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:_radius];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.lineWidth = _ringWidth;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    if (_chartDataSource.count == 0) {
        _pieBackgroundColor = [UIColor lightGrayColor];
        shapeLayer.strokeColor = _pieBackgroundColor.CGColor;
    }
    shapeLayer.path = bezierPath.CGPath;
    [self.layer addSublayer:shapeLayer];
    
    CGFloat startAngle = 3 * M_PI_2;
    CGFloat endAngle = 0.0;
    for (NSInteger index = 0; index < numberOfPie; index ++) {
        //设置百分比
        /*
         若有逆时针需求,做如下修改:
         1.clockwise  属性改为NO
         2.修改结束弧度值:endAngle = startAngle - [_chartDataSource[index] floatValue]/sumValue * 2 * M_PI;
         3.延迟时间:(3*M_PI_2 - startAngle)/(2 * M_PI) * 1.5 * NSEC_PER_SEC)
         4.执行动画时间:(startAngle - endAngle)/(2 * M_PI) * 1.5
         */
        endAngle = startAngle + [_chartDataSource[index] floatValue]/sumValue * 2 * M_PI;
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:_centerPoint radius:_radius - _ringWidth/2 startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        UIColor *pieColor = [UIColor colorWithRed:(index + 1.0)/numberOfPie green:1 - (index + 1.0)/numberOfPie blue:index * 1.0/numberOfPie alpha:1.0];
        if ([self.delegate respondsToSelector:@selector(pieChartView:colorOfPieAtIndex:)]) {
            pieColor = [self.delegate pieChartView:self colorOfPieAtIndex:index];
        }
        if (index == 2) {
            NSLog(@"-----%f  ----- end:%f",endAngle - 3*M_PI_2,endAngle- startAngle);
        }
        if (animate) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (startAngle - 3*M_PI_2)/(2 * M_PI) * 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            
                CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
                shapeLayer.lineWidth = _ringWidth;
                shapeLayer.fillColor = [UIColor clearColor].CGColor;
                shapeLayer.strokeColor = pieColor.CGColor;
                shapeLayer.path = bezierPath.CGPath;
                [self.layer addSublayer:shapeLayer];
                NSLog(@"-----index:%ld",(long)index);
                NSLog(@"----- time:%f    duration:%f",((endAngle - 3*M_PI_2)/(2 * M_PI) * 1.5 * NSEC_PER_SEC),(endAngle - startAngle)/(2 * M_PI));
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
                animation.fromValue = @(0.0);
                animation.toValue = @(1.0);
                animation.repeatCount = 1.0;
                animation.duration = (endAngle - startAngle)/(2 * M_PI) *1.5;
                animation.fillMode = kCAFillModeForwards;
                animation.delegate = self;
                [shapeLayer addAnimation:animation forKey:@"animation"];
            });
        } else {
            CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
            shapeLayer.lineWidth = _ringWidth;
            shapeLayer.fillColor = [UIColor clearColor].CGColor;
            shapeLayer.strokeColor = pieColor.CGColor;
            shapeLayer.path = bezierPath.CGPath;
            [self.layer addSublayer:shapeLayer];
        }
        //NSLog(@"start:%f-----end:%f",startAngle,endAngle);
        [_pathArray addObject:bezierPath];
        startAngle = endAngle;
        
    }
    
    [self setNeedsDisplay];
}

- (void)tapAction:(UIGestureRecognizer *)tap
{
    
    if(tap.state != UIGestureRecognizerStateEnded)
        return;
    if ([self.delegate respondsToSelector:@selector(didSelectPieChartView)]) {
        [self.delegate didSelectPieChartView];
    }
    
}

//- (NSInteger)indexOfTapPoint:(UIGestureRecognizer *)tap
//{
    //CGPoint point = [tap locationInView:self];
    //if (CGRectContainsPoint(self.frame, point)) {
        //CGFloat ponintX = _radius*cosf(30*M_PI/180);
        //CGFloat pointY = _radius*sinf(30*M_PI/180);
    //}
    //return 0;
//}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com