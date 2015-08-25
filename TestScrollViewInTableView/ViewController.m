//
//  ViewController.m
//  TestScrollViewInTableView
//
//  Created by Hu Aihong on 15-8-25.
//  Copyright (c) 2015年 ChinaCloud. All rights reserved.
//

#import "ViewController.h"
#import "SecondCustomCell.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter.h"
#import "MJChiBaoZiFooter2.h"
#import "MJDIYHeader.h"
#import "MJDIYAutoFooter.h"
#import "MJDIYBackFooter.h"
static const CGFloat MJDuration = 2.0;
@interface ViewController ()

@end

@implementation ViewController
@synthesize ScrollViewView,TableViewView,CollectionViewView,scrollView,tableView,collectionView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    //self.tableView.delegate = self;
    //self.tableView.dataSource = self;
    
    //下拉刷新01-默认
    //self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    //}];
    //或
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    //注册Cell，必须要有
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.collectionView.header beginRefreshing];
   
    //下拉刷新02-动画图片
    
    /*NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [idleImages addObject:image];
    }
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 设置普通状态的动画图片
    [header setImages:idleImages forState:MJRefreshStateIdle];
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    [header setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    // 设置header
    self.tableView.header = header;*/
    
    //下拉刷新03-隐藏时间
    
    // 隐藏时间
    /*header.lastUpdatedTimeLabel.hidden = YES;*/
    
    //下拉刷新04-隐藏状态和时间
    /*
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
     */
    
    //下拉刷新05-自定义文字
    
    // 设置文字
    /*[header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
    
    // 设置字体
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    // 设置颜色
    header.stateLabel.textColor = [UIColor redColor];
    header.lastUpdatedTimeLabel.textColor = [UIColor blueColor];
     */
    //自定义刷新控件
    /*self.tableView.header = [MJDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 具体实现参考MJDIYHeader.h和MJDIYHeader.m
    */
    
    
    //上拉刷新01-默认
    
    /*self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];
    //或
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];*/
    
    //上拉刷新02-动画图片
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    /*  
     NSMutableArray *refreshingImages = [NSMutableArray array];
     for (NSUInteger i = 1; i<=3; i++) {
     UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
     [refreshingImages addObject:image];
     }
     MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    // 设置刷新图片
    [footer setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    // 设置尾部
    self.tableView.footer = footer;*/
    
    //上拉刷新03-隐藏刷新状态的文字
    /*
    // 隐藏刷新状态的文字
    footer.refreshingTitleHidden = YES;
    // 如果没有上面的方法，就用footer.stateLabel.hidden = YES;*/
    
    //上拉刷新04-全部加载完毕
    
    /*// 变为没有更多数据的状态
    [footer noticeNoMoreData];*/
    
    //上拉刷新05-自定义文字
    
    /*// 设置文字
    [footer setTitle:@"Click or drag up to refresh" forState:MJRefreshStateIdle];
    [footer setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"No more data" forState:MJRefreshStateNoMoreData];
    
    // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    
    // 设置颜色
    footer.stateLabel.textColor = [UIColor blueColor];*/
    
    //上拉刷新06-加载后隐藏
    // 隐藏当前的上拉刷新控件
    /*self.tableView.footer.hidden = YES;*/
    
    //上拉刷新07-自动回弹的上拉01
    
    /*self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];*/
}

#pragma mark 下拉刷新数据
- (void)loadNewData
{
    // 1.添加假数据
    NSLog(@"TestReloadNewData");
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    /*dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        //[self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.header endRefreshing];
    });*/
}

//这个方法用来告诉表格有几个分组

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//这个方法告诉表格第section个分段有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return 10;
}

/***
 绘画cell
 ***/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *CellIdentifier = @"LazyTableCell";
        SecondCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        if (cell == nil) {
            NSArray *views=[[NSBundle mainBundle]loadNibNamed:@"SecondCustomCell" owner:nil options:nil];
            for (UIView *view in views){
                if ([view isKindOfClass:[SecondCustomCell class]]){
                    cell=(SecondCustomCell *)view;
                }
            }
        }




//        UIScrollView * myView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,160)];
//        cell.MainProductsSecondItemScrollView = myView;
//        [cell addSubview:myView];
[cell  addMainProductsSecondDataItem];

return  cell;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    
    
    int64_t nId = 100002 + (arc4random() % 1100 * 3);
    
    NSString *strURL        = [NSString stringWithFormat:@"http://lingo7.oss-cn-hangzhou.aliyuncs.com/images/%lld.jpg",nId];
    NSURL *url              = [NSURL URLWithString:strURL];
    NSURL *imageUrl = [NSURL URLWithString:[strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    
    UIImage *image = [UIImage imageWithData:imageData];
    if(image)
        imgView.image=image;
    
    else {
        image = [UIImage imageNamed:@"image_default.png"];
        imgView.image = image;
    }
    
    [cell.contentView addSubview:imgView];
    
    [cell.contentView addSubview:label];
    
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
    cell.backgroundColor = [UIColor greenColor];
    NSLog(@"item======%d",indexPath.item);
    NSLog(@"row=======%d",indexPath.row);
    NSLog(@"section===%d",indexPath.section);
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
