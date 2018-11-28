//
//  CustomCollectionViewCell.h
//  QQsliderListCollectionDemo
//
//  Created by MacOS on 2018/11/22.
//  Copyright © 2018 MacOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell<UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIImageView *mainImageView;
@property(nonatomic,strong)NSIndexPath *indexPath;

@end

