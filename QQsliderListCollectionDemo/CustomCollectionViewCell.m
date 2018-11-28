//
//  CustomCollectionViewCell.m
//  QQsliderListCollectionDemo
//
//  Created by MacOS on 2018/11/22.
//  Copyright © 2018 MacOS. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@interface CustomCollectionViewCell ()

@property(nonatomic,strong)UIView *editeView;


@end

@implementation CustomCollectionViewCell{
    CGFloat crWidth,crHeight;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        crWidth = self.frame.size.width;
        crHeight = self.frame.size.height;
        [self configUI];
    }
    return self;
}

- (void)configUI{
    
    //头像
    UIImageView *mainImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, crWidth, crWidth)];
    [self.contentView addSubview:mainImageView];
    self.mainImageView = mainImageView;
    
    mainImageView.layer.borderWidth = 2;
    mainImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    mainImageView.clipsToBounds = YES;
    mainImageView.layer.cornerRadius = (crWidth)/2;
    mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    mainImageView.backgroundColor = [UIColor redColor];
    
}

@end
