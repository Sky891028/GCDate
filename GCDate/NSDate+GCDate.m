//
//  NSDate+GCDate.m
//  dateCategory
//
//  Created by Sky on 16/6/20.
//  Copyright © 2016年 Sky. All rights reserved.
//

#import "NSDate+GCDate.h"

@implementation NSDate (GCDate)

+(NSString *)ttimeUptoNowFrom:(NSInteger)timestamp
{
    NSDate *nowDate = [NSDate date];
    NSInteger nowTimestamp = [nowDate timeIntervalSince1970];
    NSInteger second = 1;
    NSInteger minute = second * 60;
    NSInteger hour   = minute * 60;
    NSInteger day    = hour   * 24;
    NSInteger month  = day    * 30;
    NSInteger year   = month  * 12;
    NSInteger difference = nowTimestamp - timestamp;
    if (difference >= year) {
        return [self convertUnixTime:timestamp timeType:1];
    } else if (difference >= day) {
        return [NSString stringWithFormat:@"%ld天前",difference/day];
    } else if (difference >= hour) {
        return [NSString stringWithFormat:@"%ld小时前",difference/hour];
    } else if (difference >= minute*5) {
        return [NSString stringWithFormat:@"%ld分钟前",difference/minute];
    } else {
        return @"刚刚";
    }
}

+(NSString*)convertUnixTime:(NSInteger )unixTime timeType:(NSUInteger)type
{
    NSDateFormatter* YMD = [[NSDateFormatter alloc]init];
    switch (type) {
        case 0:     [YMD setDateFormat:@"HH:mm"];                       break;
        case 1:     [YMD setDateFormat:@"yyyy-MM-dd HH:mm"];            break;
        case 2:     [YMD setDateFormat:@"yyyy-MM-dd HH:mm:ss"];         break;
        case 3:     [YMD setDateFormat:@"yy/MM/dd"];                    break;
        case 4:     [YMD setDateFormat:@"MM月d日"];                      break;
        case 5:     [YMD setDateFormat:@"yyyy年MM月dd日 HH:mm"];         break;
        case 6:     [YMD setDateFormat:@"M月d日 HH:mm"];                 break;
        case 7:     [YMD setDateFormat:@"yyyy年MM月dd日"];               break;
        case 8:     [YMD setDateFormat:@"yyyyMMddHHmmss"];              break;
        case 9:     [YMD setDateFormat:@"yyyy-MM-dd"];                  break;
        case 10:    [YMD setDateFormat:@"yyyy.MM.dd"];                  break;
        default:                                                        break;
    }
    NSDate* confromPostTime = [NSDate dateWithTimeIntervalSince1970:unixTime];
    return  [YMD stringFromDate:confromPostTime];
}

+(NSDate *)dateStartOfWeek:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian] ;
    [gregorian setFirstWeekday:2]; //monday is first day
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: - ((([components weekday] - [gregorian firstWeekday])
                                      + 7 ) % 7)];
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:date options:0];
    NSDateComponents *componentsStripped = [gregorian components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                        fromDate: beginningOfWeek];
    //gestript
    beginningOfWeek = [gregorian dateFromComponents: componentsStripped];
    return beginningOfWeek;
}

+(NSDate* )getStartOfMonth:(NSDate *)date
{
    NSDateFormatter* YMD = [[NSDateFormatter alloc]init];
    [YMD setDateFormat:@"yyyy.MM"];
    NSString* a = [YMD stringFromDate:date];
    NSDate* beginningOfMonth = [YMD dateFromString:a];
    return beginningOfMonth;
}

+(NSDate* )integerToDate:(NSInteger)timeStamp{
    return [NSDate dateWithTimeIntervalSince1970:timeStamp];
}



+(NSInteger)getDateInteger:(NSDate *)date{
    return  (long)[date timeIntervalSince1970];
}

+(NSString* )getDateString:(NSDate *)date{
    return  [NSString stringWithFormat:@"%ld",[self getDateInteger:date]];
}


+(BOOL)isOneDay:(NSInteger)t1 t2:(NSInteger)t2{
    NSDateFormatter* YMD = [[NSDateFormatter alloc]init];
    [YMD setDateFormat:@"yyyy.MM.dd"];
    NSString* a = [YMD stringFromDate:[NSDate dateWithTimeIntervalSince1970:t1]];
    NSInteger newt = [self getDateInteger:[YMD dateFromString:a]];
    if (t2 > newt && t2 < newt + 86400) {
        return YES;
    }
    return NO;
}

@end
