//
//  UIColor+External.h
//  Categories
//
//  Created by haisheng huang on 2016/10/21.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (External)


/**
 * @author huanghaisheng
 * 通过@“#fafafa”16进制字符串去获取颜色
 **/

+ (UIColor *) colorWithHexString: (NSString *) hexString;

/**
 * @author huanghaisheng
 * @param alpha 透明度
 **/

+ (UIColor *) colorWithHexString: (NSString *) hexString alpha:(float)alpha;


@end
