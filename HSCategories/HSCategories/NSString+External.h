//
//  NSString+External.h
//  Categories
//
//  Created by haisheng huang on 2016/10/20.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSObject+External.h"

@interface NSString (External)

/**
 * author huanghaisheng
 * 是否是正整数
 **/

- (BOOL)isNonnegativeInteger;

/**
 * @author huanghaisheng
 * 是否都是数字
 **/

- (BOOL)isNumberValid;

/**
 * @author huanghaisheng
 * 是否是浮点型数
 **/

- (BOOL)isFloatNumber;

/**
 * @author huanghaisheng
 * 是否是移动电话号码
 **/

- (BOOL)isMobilePhoneNumber;

/**
 * @author huanghaisheng
 * 是否是邮件
 **/

- (BOOL)isEmailValid;


/**
 * @author huanghaisheng
 * 当前时间的字符串@“yyyy－MM－dd”
 *
 **/

+ (NSString *)currentDateString;

/**
 * @author huanghaisheng
 * 当前年月日的下－个月
 **/

+ (NSString *)nextMonth:(NSString *)currentDate;

/**
 * @author huanghaisheng
 * 根据formatter yyyy-MM-dd HH:mm:ss 获取NSDate的年月日时分秒
 **/

+ (NSString *)stringWithFormatter:(NSString *)formatter date:(NSDate *)date;

/**
 * @author huanghaisheng
 * 距离当前字符串时间过去了多久
 **/

- (NSString *)howLongTimePassed;

/**
 * @author huanghaisheng
 * 获取年月日字符串相对应的星期
 **/

- (NSString *)weekDescription;

/**
 * @author huanghaisheng
 * 字符串中文转encode
 **/

- (NSString *)URLEncodeString;

/**
 * @author huanghaisheng
 * 获取Documents的path
 **/

+ (NSString *)documentsPath;

/**
 * @author huanghaisheng
 * 获取Documents目录下的名为name的path
 **/

+ (NSString *)getFilePathInDocumentsWithName:(NSString *)name;

/**
 * @author huanghaisheng
 * 获取Documents目录下的文件夹为folder，名为fileName的path
 **/

+ (NSString *)getFilePathInDocumentsAtFolder:(NSString *)folder FileName:(NSString *)fileName;

/**
 * @author huanghaisheng
 * 获取Library的Caches的path
 **/

+ (NSString *)libraryCachesPath;

/**
 * @author huanghaisheng
 * 检查并修复sql语句中参数带有非法字符“`”
 **/

+ (NSString *)checkSqlParam:(NSString *)param;

/**
 * @author huanghaisheng
 * 计算字符串要占多高的位置
 **/

- (CGFloat)calculateHeightWithWidth:(CGFloat)width Font:(UIFont *)font;

/**
 * @author huanghaisheng
 * 计算字符串要占多高的位置
 **/
- (CGSize)calculateSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

/**
 * @author huanghaisheng
 * 根据时间字符串 yyyy-MM-dd 获取时间戳
 **/

- (long long)transformTimeStamp;

/**
 * @author huanghaisheng
 * 将时间戳转换成年月日字符串
 **/

+ (NSString *)transformDateStringWithTimeStamp:(long long)timeStamp;


@end
