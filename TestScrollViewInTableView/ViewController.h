//
//  ViewController.h
//  TestScrollViewInTableView
//
//  Created by Hu Aihong on 15-8-25.
//  Copyright (c) 2015年 ChinaCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate, UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic) IBOutlet UIView *ScrollViewView;
@property (nonatomic) IBOutlet UIView *TableViewView;
@property (nonatomic) IBOutlet UIView *CollectionViewView;
@property (nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) IBOutlet UICollectionView *collectionView;

@end

