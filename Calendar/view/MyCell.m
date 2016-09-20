//
//  MyCell.m
//  dateCollect
//
//  Created by 赵萌智 on 16/3/17.
//  Copyright © 2016年 赵萌智. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 20, 20)];
        [_label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
        _label.textAlignment = NSTextAlignmentCenter;
        
        _TodayImage = [[UIImageView alloc]initWithFrame:CGRectMake(28, 0, 12, 12)];
        
        _TodayImage.image = [UIImage imageNamed:@"Rectangle 121"];

        _label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 50, 20)];
        //_label1.font = [UIFont systemFontOfSize:12];
        [_label1 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
        _label1.textColor = RGBA_Color(57, 201, 214, 1);
        _label1.textAlignment = NSTextAlignmentCenter;
       
        
        _lala = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
        _lala.backgroundColor = RGBA_Color(236, 236, 236, 1);
        _lala.alpha = 0.3;
        
        [self.contentView addSubview:_label1];
        [self.contentView addSubview:_label];
        [self.contentView addSubview:_lala];
        [self.contentView addSubview:_TodayImage];
       
    }
    return self;
}

-(void)addviewlabel
{
    [self.contentView addSubview:_label1];
    [self.contentView addSubview:_label];
    [self.contentView addSubview:_lala];
}


@end
