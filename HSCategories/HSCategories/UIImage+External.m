//
//  UIImage+External.m
//  Categories
//
//  Created by haisheng huang on 2016/10/21.
//  Copyright © 2016年 haisheng huang. All rights reserved.
//

#import "UIImage+External.h"

@implementation UIImage (External)

+ (UIImage *)addMarkImage:(UIImage *)markIamge
          ToOriginalImage:(UIImage *)originalImage
                  AtPoint:(CGPoint)point
{
    CGSize tempsize = originalImage.size;
    
    if (point.y > (originalImage.size.height - markIamge.size.height)) {
        tempsize.height = point.y + markIamge.size.height;
    }
    
    UIGraphicsBeginImageContext(tempsize);
    [originalImage drawInRect:CGRectMake(0.0f, 0.0f, originalImage.size.width, originalImage.size.height)];
    [markIamge drawInRect:CGRectMake(point.x, point.y, markIamge.size.width, markIamge.size.height)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext();
    return image;
}


@end
