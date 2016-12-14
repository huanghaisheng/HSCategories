//
//  NSObject+External.m
//  Categories
//
//  Created by haisheng huang on 2016/10/20.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import "NSObject+External.h"

@implementation NSObject (External)

+ (NSDateFormatter *)shareDateFormatter
{
    static NSDateFormatter *shareFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareFormatter = [[NSDateFormatter alloc] init];
    });
    return shareFormatter;
    
}

@end
