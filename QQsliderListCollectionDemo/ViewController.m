//
//  ViewController.m
//  QQsliderListCollectionDemo
//
//  Created by MacOS on 2018/11/22.
//  Copyright © 2018 MacOS. All rights reserved.
//

#import "ViewController.h"
#import "ScrollLimitessCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ScrollLimitessCollectionView *limitessCollectionView = [[ScrollLimitessCollectionView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
    
    [self.view addSubview:limitessCollectionView];
    
    limitessCollectionView.backgroundColor = [UIColor blueColor];
}


@end
