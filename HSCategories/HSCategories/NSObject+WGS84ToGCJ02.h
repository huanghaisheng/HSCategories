//
//  NSObject+WGS84ToGCJ02.h
//  Categories
//
//  Created by haisheng huang on 2016/10/21.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface NSObject (WGS84ToGCJ02)


/**
 * @author huanghaisheng
 * 判断当前坐标是否还在中国境内
 **/

+ (BOOL)isLocationOutOfChina:(CLLocationCoordinate2D)location;

/**
 * @author huanghaisheng
 * 火星坐标转成中国偏移坐标
 **/

+ (CLLocationCoordinate2D)transformFromWGSToGCJ:(CLLocationCoordinate2D)wgsLocation;



@end
