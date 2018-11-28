//
//  ScrollUICollectionViewFlowLayout.h
//  QQsliderListCollectionDemo
//
//  Created by MacOS on 2018/11/22.
//  Copyright © 2018 MacOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollUICollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) NSInteger page;//当前居中的页码
//@property (nonatomic, assign) BOOL isScal;//是否缩放，默认yes
@property (nonatomic, assign) BOOL isOverlap;//是否重叠，默认YES

@end

NS_ASSUME_NONNULL_END
