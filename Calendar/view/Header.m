//
//  Header.m
//  dateCollect
//
//  Created by 赵萌智 on 16/3/17.
//  Copyright © 2016年 赵萌智. All rights reserved.
//

#import "Header.h"

@implementation Header
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(10, 7, 80, 25)];
        _label.textColor = [UIColor whiteColor];
        _label.layer.cornerRadius = 12;
        _label.layer.backgroundColor = RGBA_Color(57, 201, 214, 1).CGColor;
        _label.layer.borderWidth = 1;
        _label.layer.borderColor = RGBA_Color(57, 201, 214, 1).CGColor;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:17];
        [self addSubview:_label];
        
        _countString = [[UILabel alloc]initWithFrame:CGRectMake(WidthScale(200), 5, WidthScale(160), 30)];
        [_countString setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        _countString.textAlignment = NSTextAlignmentRight;
        _countString.textColor = RGBA_Color(57, 201, 214, 1);
        _countString.textAlignment = NSTextAlignmentCenter;
       // _countString.backgroundColor = [UIColor redColor];
        [self addSubview:_countString];
        
        
        
        UILabel *lala = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1)];
        lala.backgroundColor = RGBA_Color(236, 236, 236, 1);
        lala.alpha = 0.3;
        [self addSubview:lala];
        
    }
    return self;
}
@end
