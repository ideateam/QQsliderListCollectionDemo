//
//  ScrollLimitessCollectionView.m
//  QQsliderListCollectionDemo
//
//  Created by MacOS on 2018/11/22.
//  Copyright © 2018 MacOS. All rights reserved.
//

#import "ScrollLimitessCollectionView.h"
#import "ScrollUICollectionViewFlowLayout.h"
#import "CustomCollectionViewCell.h"

static NSString * const reuseIdentifier = @"CustomCollectionViewCellID";

@interface ScrollLimitessCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)ScrollUICollectionViewFlowLayout *customLayout;

@property(nonatomic,assign)CGFloat collectionWidth;

@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)UIButton *titleButton;

@end

@implementation ScrollLimitessCollectionView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];

    if (self) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    self.dataArray = @[@"img1.jpg",@"img2.jpg",@"img3.jpg",@"img4.jpg",@"img5.jpg"];
    self.titleArray = @[@"这是一个名字1",@"这是一个名字2",@"这是一个名字3",@"这是一个名字4",@"这是一个名字5"];
    
    [self configUI];
    
    UIButton *titleButton = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width - 140)/2, self.frame.size.height - 50, 140, 40)];
    [self addSubview:titleButton];
    self.titleButton = titleButton;
    
    [titleButton setTitle:self.titleArray[self.titleArray.count/2] forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    titleButton.backgroundColor = [UIColor blueColor];

}
-(void)configUI{
   
    _collectionWidth = 100;
    _customLayout = [[ScrollUICollectionViewFlowLayout alloc]init];
    _customLayout.itemSize = CGSizeMake(_collectionWidth, 100);
    
    // 设置滚动方向（默认垂直滚动）
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) collectionViewLayout:_customLayout];
    collectionView.backgroundColor=[UIColor orangeColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    
    [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    if (self.dataArray &&self.dataArray.count >= 1) {
        //默认滑动到中间位置
        [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataArray.count/2 inSection:0]  atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}
#pragma mark - UICollectionViewDelegateFlowLayout

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.mainImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    cell.indexPath = indexPath;
   
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    [collectionView setContentOffset:CGPointMake(_collectionWidth * indexPath.row, 0) animated:YES];
    _customLayout.page = indexPath.row;
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    [self.titleButton setTitle:self.titleArray[indexPath.row] forState:UIControlStateNormal];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    float scrollViewY = scrollView.contentOffset.x;
    
    NSInteger currentPage = scrollViewY / _collectionWidth;
    
    [self.titleButton setTitle:self.titleArray[currentPage] forState:UIControlStateNormal];
    
    NSLog(@"------------currentPage = %ld--------------------",currentPage);
}

@end
