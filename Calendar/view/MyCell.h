//
//  MyCell.h
//  dateCollect
//
//  Created by 赵萌智 on 16/3/17.
//  Copyright © 2016年 赵萌智. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UICollectionViewCell
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *label1,*lala;
@property(nonatomic,strong)UIImageView *TodayImage;
-(void)addviewlabel;
@end
