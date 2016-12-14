//
//  UIImage+External.h
//  Categories
//
//  Created by haisheng huang on 2016/10/21.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (External)

/**
 * @author huanghaisheng
 * 给图片加水印
 * @param markIamge 水印图
 * @param originalImage 要加水印的原图
 * @param point 水印加在原图的坐标点
 **/

+ (UIImage *)addMarkImage:(UIImage *)markIamge
          ToOriginalImage:(UIImage *)originalImage
                  AtPoint:(CGPoint)point;

/**
 * @author huanghaisheng
 * 返回一个大小为size，颜色为color的image
 **/
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


@end
