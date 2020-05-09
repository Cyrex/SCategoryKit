//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIImage+SColor.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/3: Created by Cyrex on 2020/1/3
//

#import "UIImage+SColor.h"

@implementation UIImage (SColor)
// MARK: - Class Methods
+ (UIImage *)s_imageWithColor:(UIColor *)color {
    return [UIImage s_imageWithColor:color size:CGSizeMake(10, 10)];
}

+ (UIImage *)s_imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, (CGRect){.size = size});

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)s_imageWithImage:(UIImage *)image withTintColor:(UIColor *)color {
    UIImage *img = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsBeginImageContextWithOptions(img.size, NO, img.scale);
    [color set];
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;
}

+ (UIImage *)s_imageWithLinearColors:(NSArray *)colors
                          startPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint {

    return [self s_imageWithLinearColors:colors startPoint:startPoint endPoint:endPoint size:CGSizeMake(40.f, 40.f)];
}

+ (UIImage *)s_imageWithLinearColors:(NSArray *)colors
                          startPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint
                                size:(CGSize)size {

    return [self s_imageWithLinearColors:colors startPoint:startPoint endPoint:endPoint size:size locations:@[@(0.f), @(1.f)]];
}

+ (UIImage *)s_imageWithLinearColors:(NSArray *)colors
                          startPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint
                                size:(CGSize)size
                           locations:(NSArray<NSNumber *> *)locations {

    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat *rLocations;
    if (locations.count > 0) {

        rLocations = (CGFloat *)malloc(sizeof(CGFloat) * locations.count);
        for (int i = 0; i < locations.count; i++) {
            rLocations[i] = locations[i].floatValue;
        }
    }
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, rLocations);
    float (^floatBlock)(float) = ^(float x) {

        if (x <= 0.f) {
            return 0.f;
        } else if (x >= 1.f) {
            return 1.f;
        } else {
            return x;
        }
    };
    CGPoint rsPoint = CGPointMake(floatBlock(startPoint.x) * size.width, floatBlock(startPoint.y) * size.height);
    CGPoint rePoint = CGPointMake(floatBlock(endPoint.x) * size.width, floatBlock(endPoint.y) * size.height);
    CGContextDrawLinearGradient(context, gradient, rsPoint, rePoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
