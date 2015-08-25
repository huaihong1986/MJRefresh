//
//  CustomCell.h
//  test
//
//  Created by Vincent DU on 15/8/10.
//  Copyright (c) 2015年 Vincent DU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondCustomCell : UITableViewCell<UIScrollViewDelegate>


@property (retain, nonatomic) IBOutlet UIScrollView *MainProductsSecondItemScrollView;

- (void) addMainProductsSecondDataItem;


@end
