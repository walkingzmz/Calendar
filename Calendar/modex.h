//
//  modex.h
//  Calendar
//
//  Created by CiHon-IOS2 on 16/9/20.
//  Copyright © 2016年 walkingzmz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface modex : NSObject

+(NSInteger)totaldaysInThisMonth:(NSDate *)date;
+(NSInteger)getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate;
+(NSDate *)dateFromString:(NSString *)dateString;
+(NSString*)time:(NSString*)num;
+(NSInteger)firstWeekdayInThisMonth:(NSDate *)date;
@end
