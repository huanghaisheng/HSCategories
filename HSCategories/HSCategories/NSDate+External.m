//
//  NSDate+External.m
//  Categories
//
//  Created by haisheng huang on 2016/10/20.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import "NSDate+External.h"
#import "NSObject+External.h"
#import "NSString+External.h"

@implementation NSDate (External)

//获取当前日期的时间戳（以毫秒为单位）
+ (long long)timestampWithCurrentDate
{
    return [[NSDate date] timeIntervalSince1970] * 1000;
}

//获取date的时间戳 （以毫秒为单位）
+ (long long)timestampWithDate:(NSDate *)date
{
    return [date timeIntervalSince1970] * 1000;
}

//获取date string的时间戳 （以毫秒为单位） @"2014-10-01" || @"2014-10-01 12:12:12"
+ (long long)timestampWithDateString:(NSString *)dateString
{
    //NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    NSDateFormatter *dateFormatter = [NSObject shareDateFormatter];
    //[dateFormatter setTimeZone:GTMzone];
    NSString *formatterString = @"yyyy-MM-dd";
    if (dateString.length == formatterString.length) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    } else {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    return [date timeIntervalSince1970] * 1000;
}

//根据“2015-09-30”样式转换成中国样式“2015年9月30日”,date(nsdate or @"2015-09-30")
+ (NSString *)transformChineseDateWithDate:(id)date {
    
    if ([date isKindOfClass:[NSDate class]]) {
        NSString *dateString = [NSString stringWithFormatter:@"yyyy-MM-dd" date:date];
        NSArray *dateArray = [dateString componentsSeparatedByString:@"-"];
        return [NSString stringWithFormat:@"%@年%zd月%zd日",dateArray[0], [dateArray[1] integerValue], [dateArray[2] integerValue]];
    } else if ([date isKindOfClass:[NSString class]]) {
        NSArray *dateArray = [date componentsSeparatedByString:@"-"];
        return [NSString stringWithFormat:@"%@年%zd月%zd日",dateArray[0], [dateArray[1] integerValue], [dateArray[2] integerValue]];
    } else {
        return @"";
    }
    
}


@end
