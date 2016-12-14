//
//  NSString+External.m
//  Categories
//
//  Created by haisheng huang on 2016/10/20.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import "NSString+External.h"

@implementation NSString (External)

- (BOOL)isNonnegativeInteger {
    
    NSString *regex = @"^[1-9]d*|0$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self] == YES;
    
}

- (BOOL)isNumberValid {
    
    NSString *regex = @".*[0-9].*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self] == YES;
    
}

- (BOOL)isFloatNumber {
    
    NSString *regex = @"^[1-9]d*.d*|0.d*[1-9]d*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self] == YES;
    
}

- (BOOL)isMobilePhoneNumber {
    
    NSString *regex = @"1[0-9]{10}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self] == YES;
    
}

- (BOOL)isEmailValid {
    
    NSString* regex = @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9._%+-]+\\.[A-Za-z0-9._%+-]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self] == YES;
    
}


+ (NSString *)currentDateString {
    
    NSDateFormatter *dateFormatter = [NSObject shareDateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *curDate = [NSDate date];
    NSString *dateString = [dateFormatter stringFromDate:curDate];
    return dateString;
    
}

+ (NSString *)nextMonth:(NSString *)currentDate {
    
    NSDateFormatter *dateFormatter = [NSObject shareDateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:currentDate];
    date = [NSDate dateWithTimeInterval:2592000 sinceDate:date];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
    
}

+ (NSString *)stringWithFormatter:(NSString *)formatter date:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [NSObject shareDateFormatter];
    [dateFormatter setDateFormat:formatter];
    NSString *dateString = [dateFormatter stringFromDate: date];
    return dateString;
    
}

- (NSString *)howLongTimePassed {
    
    NSDateFormatter *dateFormatter = [NSObject shareDateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString: self];
    NSTimeInterval interval = -[date timeIntervalSinceNow];
    NSString *dateString = @"";
    
    double minute = interval / 60;
    if (minute <=1) {
        dateString = @"刚刚";
    } else if(minute < 60) {
        dateString = [NSString stringWithFormat:@"%d分钟前",(int)minute];
    } else if(minute < 24*60) {
        dateString = [NSString stringWithFormat:@"%d小时前",(int)(minute/60)];
    } else if(minute < 60*24*7){
        dateString = [NSString stringWithFormat:@"%d天前",(int)(minute/60/24)];
    } else {
        dateString = [self substringWithRange:NSMakeRange(0, 10)];
    }
    
    return dateString;
    
}

- (NSString *)weekDescription {
    
    NSArray *weeks = @[@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    NSArray *arrComs = [self componentsSeparatedByString:@"-"];
    int y = [arrComs[0] intValue];
    int m = [arrComs[1] intValue];
    int d = [arrComs[2] intValue];
    
    int tmpY = y, tmpM = m, tmpD = d;
    tmpM = (m == 1 || m == 2) ? (12 + m) : m;
    tmpY = (m == 1 || m == 2) ? (y - 1) : y;
    int week = (tmpD + 2 * tmpM + 3 * (tmpM + 1) / 5 + tmpY + tmpY / 4 - tmpY / 100 + tmpY / 400 + 1) % 7;
    return weeks[week];
    
}

- (NSString *)URLEncodeString {
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    return encodedString;
    
}

+ (NSString *)documentsPath {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
}

+ (NSString *)getFilePathInDocumentsWithName:(NSString *)name {
    
    return [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:name];
    
}

+ (NSString *)getFilePathInDocumentsAtFolder:(NSString *)folder FileName:(NSString *)fileName {
    
    return [[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:folder] stringByAppendingPathComponent:fileName];
    
}

+ (NSString *)libraryCachesPath {
    
    NSString *libraryPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSString *cachePath = [libraryPath stringByAppendingPathComponent:@"Caches"];
    return cachePath;
    
}

+ (NSString *)checkSqlParam:(NSString *)param {
    
    if (!param) {
        return @"";
    }
    
    NSMutableString *mutableString = [[NSMutableString alloc] initWithString:param];
    
    NSInteger count = 0;
    
    if ([param isKindOfClass:[NSString class]]) {
        
        if ([param rangeOfString:@"'"].length) {
            
            for (NSInteger i = 0; i < param.length; i++) {
                
                char c = [param characterAtIndex:i];
                if (c == 39) {
                    [mutableString insertString:@"'" atIndex:i + count];
                    count += 1;
                }
            }
            
            return mutableString;
            
        } else {
            return param;
        }
        
    } else {
        return @"";
    }
    
}

- (CGFloat)calculateHeightWithWidth:(CGFloat)width Font:(UIFont *)font {
    
    CGSize requiredSize = CGSizeZero;
    CGSize boundingSize = CGSizeMake(width, CGFLOAT_MAX);
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        NSDictionary *atrribute = @{NSFontAttributeName:font};
        CGRect requiredFrame = [self boundingRectWithSize:boundingSize
                                                  options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                               attributes:atrribute
                                                  context:nil];
        requiredSize = requiredFrame.size;
    } else {
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
        requiredSize = [self sizeWithFont:font
                        constrainedToSize:boundingSize
                            lineBreakMode:NSLineBreakByWordWrapping];
#endif
        
    }
    
    return requiredSize.height;
    
}

- (CGSize)calculateSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    
    CGSize requiredSize = CGSizeZero;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
        NSDictionary *atrribute = @{NSFontAttributeName:font};
        CGRect requiredFrame = [self boundingRectWithSize:size
                                                  options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                               attributes:atrribute
                                                  context:nil];
        requiredSize = requiredFrame.size;
        
    } else {
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
        requiredSize = [self sizeWithFont:font
                        constrainedToSize:boundingSize
                            lineBreakMode:NSLineBreakByWordWrapping];
#endif
        
    }
    
    return requiredSize;
}

- (long long)transformTimeStamp {
    
    NSDateFormatter *dateFormatter = [NSObject shareDateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:self];
    return [date timeIntervalSince1970] * 1000;
    
}

+ (NSString *)transformDateStringWithTimeStamp:(long long)timeStamp {
    
    NSDateFormatter *dateFormatter = [NSObject shareDateFormatter];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp/1000];
    
    return [dateFormatter stringFromDate:date];
    
}



@end
