//
//  NSDate+GCDate.h
//  dateCategory
//
//  Created by Sky on 16/6/20.
//  Copyright © 2016年 Sky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GCDate)

+(NSDate* )integerToDate:(NSInteger)timeStamp;           //timeSp to date

+(NSInteger)getDateInteger:(NSDate *)date;              //date to (int)timeSp

+(NSString* )getDateString:(NSDate *)date;              //date to (str)timeSp

/**
 *  计算时间到当前时间的跨度
 *
 *  @param timeSp
 *
 *  @return 根据业务调整 默认为x分钟前、x小时前、x天前
 */
+(NSString *)ttimeUptoNowFrom:(NSInteger)timestamp;

/**
 *  时间戳格式化
 *
 *  @param unixTime 时间戳
 *  @param type     type description
 *
 *  @return return value description
 */
+(NSString*)convertUnixTime:(NSInteger )unixTime timeType:(NSUInteger)type;

+(NSDate *)dateStartOfWeek:(NSDate *)date;          //获取当前星期的第一天的date

+(NSDate* )getStartOfMonth:(NSDate *)date;          //获取当月第一天的date

+(BOOL)isOneDay:(NSInteger)t1 t2:(NSInteger)t2;     //判断两个timeSp是否同一天

@end
