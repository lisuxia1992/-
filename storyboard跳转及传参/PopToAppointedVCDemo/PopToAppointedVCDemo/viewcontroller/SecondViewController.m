//
//  SecondViewController.m
//  PopToAppointedVCDemo
//
//  Created by Cherry on 15/12/10.
//  Copyright © 2015年 number1. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+CustomTracker.h"
#import "ThirdViewController.h"
#import "StretchyHeaderCollectionViewLayout.h"
#import "LaunchView.h"
#import "CollectionCell.h"

@interface SecondViewController ()
{
    UICollectionView *_collectionView;
}
@end

@implementation SecondViewController

-(void)dealloc
{
    [self clearIndex:NSStringFromClass([self class])];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    StretchyHeaderCollectionViewLayout *stretchyLayout = [[StretchyHeaderCollectionViewLayout alloc] init];
    //stretchyLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    stretchyLayout.itemSize = CGSizeMake(self.view.frame.size.width, 50);//collectioncell的宽高
    stretchyLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 250);//头部宽高
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:stretchyLayout];
    _collectionView.backgroundColor = [UIColor orangeColor];
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerClass:[LaunchView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headCell"];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        LaunchView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headCell" forIndexPath:indexPath];
        headView.iconName = @"launch.jpg";
        headView.titleLabel.text = @"没有任何借口,连谎言都难厮守";
        headView.backgroundColor = [UIColor cyanColor];
        return headView;
    }
    return nil;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThirdViewController *firstVC = [ThirdViewController defaultViewControllerWithStoryboard:@"Main"];
    [self.navigationController pushViewController:firstVC animated:YES];
}


- (IBAction)unwindToSecondViewController:(UIStoryboardSegue *)segue {
    UIViewController *sourceVC = segue.destinationViewController;
    
    NSLog(@"unwindSegue %@     source VC  = %@", segue , [sourceVC class]);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    cell.contentView.backgroundColor = [UIColor greenColor];
    cell.title = @"世界之大,为何我们相遇";
    
    return cell;
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
