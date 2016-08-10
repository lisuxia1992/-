//
//  OTPageScrollView.m
//  OTPageScrollView
//
//  Created by yechunxiao on 7/22/14.
//  Copyright (c) 2014 Oolong Tea. All rights reserved.
//

#import "OTPageScrollView.h"

@interface OTPageScrollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) NSMutableArray * viewsInPage;
@property (nonatomic, assign) NSInteger numberOfCell;

@end

@implementation OTPageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initializeValue];
        [self reloadData];
    }
    return self;
}

- (void)initializeValue
{
    self.delegate = self;
    self.bounces = NO;//默认为yes
    self.clipsToBounds = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.autoresizesSubviews = NO;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.multipleTouchEnabled = NO;
    self.scrollsToTop=YES;
    self.decelerationRate = UIScrollViewDecelerationRateFast;
    [self addGestureRecognizer:self.tapGesture];
    
}

- (void)reloadData
{
    if (!self.Customdelegate || ![self.Customdelegate respondsToSelector:@selector(numberOfPageInPageScrollView:)]) {
        return;
    }
    if (!self.dataSource || ![self.dataSource respondsToSelector:@selector(pageScrollView:viewForRowAtIndex:)]) {
        return;
    }
    
    _cellSize.width = self.frame.size.width - 40;
    if ([self.Customdelegate respondsToSelector:@selector(sizeCellForPageScrollView:)]) {
        _cellSize = [self.Customdelegate sizeCellForPageScrollView:self];
    }
    
    _numberOfCell = [self.Customdelegate numberOfPageInPageScrollView:self];
    
    float startX = self.leftRightOffset;
    float topY   = (self.frame.size.height - _cellSize.height)/2;
    
    [[self subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
    
    self.viewsInPage = nil;
    self.viewsInPage = [NSMutableArray array];
    
    for (int i = 0; i < _numberOfCell; i ++) {
        
        UIView * cell = [self.dataSource pageScrollView:self viewForRowAtIndex:i];
        cell.frame = CGRectMake(startX, topY, _cellSize.width, _cellSize.height);
        [self addSubview:cell];
        startX += self.padding + _cellSize.width;
        [self.viewsInPage addObject:cell];
    }
    
    float scrollViewSizeWith = startX - self.padding + self.leftRightOffset;
    self.contentSize = CGSizeMake(scrollViewSizeWith, 1);
    
}

- (UIView*)viewForRowAtIndex:(NSInteger)index
{
    if (index < self.viewsInPage.count) {
        return self.viewsInPage[index];
    }
    return nil;
}

#pragma mark - Properties

- (NSMutableArray*)viewsInPage
{
    if (!_viewsInPage) {
        _viewsInPage = [NSMutableArray array];
    }
    return _viewsInPage;
}

- (UITapGestureRecognizer*)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        [_tapGesture setNumberOfTapsRequired:1];
        [_tapGesture setNumberOfTouchesRequired:1];
    }
    return _tapGesture;
}

- (float)leftRightOffset
{
    if (!_leftRightOffset) {
        //return _cellSize.width + self.padding;
        return (self.frame.size.width - _cellSize.width)/2;
    }
    return _leftRightOffset;
}

- (CGFloat)padding{
    if (!_padding) {
        return 10;
    }
    return _padding;
}

#pragma mark - Action

- (void)handleTapGesture:(UITapGestureRecognizer*)tapGesture
{
    CGPoint tapPoint = [tapGesture locationInView:self];
    
    float topY   = (self.frame.size.height - _cellSize.height)/2;
    BOOL yInCell = NO;
    if (tapPoint.y > topY && tapPoint.y < self.frame.size.height-topY){
        yInCell = YES;
    }
    int xInCellNumber = (tapPoint.x - self.leftRightOffset)/(_cellSize.width + self.padding);
    BOOL xInCell = NO;
    if (tapPoint.x > self.leftRightOffset + ((_cellSize.width + self.padding) * xInCellNumber)
        && tapPoint.x < self.leftRightOffset + ((_cellSize.width + self.padding) * xInCellNumber) + _cellSize.width) {
        xInCell = YES;
    }
    if (xInCellNumber < 0 || xInCellNumber >= _numberOfCell) {
        xInCell = NO;
    }
    if (yInCell && xInCell) {
        self.selectedIndex = xInCellNumber;
        [self.Customdelegate pageScrollView:self didTapPageAtIndex:xInCellNumber];
        [UIView animateWithDuration:0.3 animations:^{
            [self setContentOffset:CGPointMake((_cellSize.width + self.padding) * xInCellNumber, 0)];
        }];
    }
    
}
static int currentPageDecelerat = 0;
static int currentPageDragging = 0;
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat currentPostion = scrollView.contentOffset.x;
    CGFloat pageWidth = scrollView.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int page = floor((scrollView.contentOffset.x - pageWidth/ 2) / pageWidth) + 1;
    
    //if (abs(currentPageDecelerat - page) > 1) {
        
        //if (currentPostion > 0 && currentPostion - _lastContentOffset > 0 ) {
            //NSLog(@"ScrollUp now");
            //page = currentPageDecelerat + 1;
        //}
        //else if ((_lastContentOffset - currentPostion > 0) && (currentPostion  <= scrollView.contentSize.width-scrollView.bounds.size.width))
        //{
            //page = currentPageDecelerat - 1;
        //}
    //}
    scrollView.contentOffset = CGPointMake((_cellSize.width + self.padding)*page, 0);
    currentPageDecelerat = page;
    _lastContentOffset = currentPostion;
    
    //[self changePosition:scrollView withPage:currentPageDecelerat];
}

-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView{
    
    _lastContentOffset = scrollView.contentOffset.x;
    
}

/**
 *  @author Cherry, 2016-01-20 14:06:58
 *
 *  @brief 没有减速的情况下,根据需求判定
 *
 *  @param scrollView scrollview
 *  @param decelerate 指代，当我们手指离开那一瞬后，视图是否还将继续向前滚动（一段距离）
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        CGFloat currentPostion = scrollView.contentOffset.x;
        CGFloat pageWidth = scrollView.frame.size.width;
        // 根据当前的x坐标和页宽度计算出当前页数
        int page = floor((scrollView.contentOffset.x - pageWidth/ 2) / pageWidth) + 1;
        //if (abs(currentPageDragging - page) > 1) {
            
            //if (currentPostion > 0 && currentPostion - _lastContentOffset > 0 ) {
                //NSLog(@"ScrollLeft now");
                //page = currentPageDragging + 1;
            //}
            //else if ((_lastContentOffset - currentPostion > 0) && (currentPostion  <= scrollView.contentSize.width-scrollView.bounds.size.width))
            //{
                //page = currentPageDragging - 1;
            //}
        //}
        scrollView.contentOffset = CGPointMake((_cellSize.width + self.padding)*page, 0);
        currentPageDragging = page;
        _lastContentOffset = currentPostion;
        //[self changePosition:scrollView withPage:currentPageDragging];
    }
    
}

// 指示当用户点击状态栏后，滚动视图是否能够滚动到顶部。需要设置滚动视图的属性
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}

-(void)changePosition:(UIScrollView *)scrollView withPage:(int)appointPage
{
    CGFloat currentPostion = scrollView.contentOffset.x;
    CGFloat pageWidth = scrollView.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int page = floor((scrollView.contentOffset.x - pageWidth/ 2) / pageWidth) + 1;
    if (abs(appointPage - page) > 1) {
        if (currentPostion > 0 && currentPostion - _lastContentOffset > 0 ) {
            NSLog(@"ScrollUp now");
            page = appointPage + 1;
        }
        else if ((_lastContentOffset - currentPostion > 0) && (currentPostion  <= scrollView.contentSize.width-scrollView.bounds.size.width))
        {
            page = appointPage - 1;
        }
    }
    scrollView.contentOffset = CGPointMake((_cellSize.width + self.padding)*page, 0);
    appointPage = page;
    _lastContentOffset = currentPostion;
    
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
