//
//  CustomCell.m
//  test
//
//  Created by Vincent DU on 15/8/10.
//  Copyright (c) 2015年 Vincent DU. All rights reserved.
//

#import "SecondCustomCell.h"

@implementation SecondCustomCell

@synthesize MainProductsSecondItemScrollView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) addMainProductsSecondDataItem{
    
    int i=0;
    while(i<6)
    {
       
      
        UIImageView*imgView=[[UIImageView alloc] initWithFrame:CGRectMake(160*i, 0, 160, 160)];
       
        UIImage* image = [UIImage imageNamed:@"image_default.png"];
        imgView.image = image;
        [self.MainProductsSecondItemScrollView addSubview:imgView];
       
          i++;
    }
     [self checkMainProductsSecondItemScrollViewWidth];
}


- (void)checkMainProductsSecondItemScrollViewWidth{
    if(self.MainProductsSecondItemScrollView != nil) {
        
        NSArray* Subviews = [self.MainProductsSecondItemScrollView subviews];
        
        CGFloat totalWidth = 0;
        for (int i = [Subviews count] - 1; i >= 0; i--){
            UIView* view = [Subviews objectAtIndex:i];
            //NSLog(@"Viewhidden%@",view.description);
            if (! view.hidden){
                
                totalWidth += view.frame.size.width;
            }
        }
        
        
        //NSLog(@"TestWidth%f",totalWidth);
        [self.MainProductsSecondItemScrollView setContentSize:CGSizeMake(totalWidth, self.MainProductsSecondItemScrollView.frame.size.height)];
        
        
    }
}
@end
