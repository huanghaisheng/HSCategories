//
//  NSDate+External.h
//  Categories
//
//  Created by haisheng huang on 2016/10/20.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (External)

/**
 * @author huanghaisheng
 * 获取当前日期的时间戳（以毫秒为单位）
 **/
+ (long long)timestampWithCurrentDate;

/**
 * @author huanghaisheng
 * 获取date的时间戳 （以毫秒为单位）
 **/
+ (long long)timestampWithDate:(NSDate *)date;

/**
 * @author huanghaisheng
 * 获取date string的时间戳 （以毫秒为单位） @"2014-10-01" || @"2014-10-01 12:12:12"
 **/
+ (long long)timestampWithDateString:(NSString *)dateString;

/**
 * @author huanghaisheng
 * 根据“2015-09-30”样式转换成中国样式“2015年9月30日”,date(nsdate or @"2015-09-30")
 **/
+ (NSString *)transformChineseDateWithDate:(id)date;


@end
