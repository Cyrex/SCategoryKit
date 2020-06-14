//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIImage+SColor.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/3: Created by Cyrex on 2020/1/3
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SColor)

+ (UIImage *)s_imageWithColor:(UIColor *)color;

+ (UIImage *)s_imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)s_imageWithImage:(UIImage *)image withTintColor:(UIColor *)color;

+ (UIImage *)s_imageWithLinearColors:(NSArray *)colors
                          startPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint;

+ (UIImage *)s_imageWithLinearColors:(NSArray *)colors
                          startPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint
                                size:(CGSize)size;

+ (UIImage *)s_imageWithLinearColors:(NSArray *)colors
                          startPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint
                                size:(CGSize)size
                           locations:(NSArray<NSNumber *> *)locations;

@end

NS_ASSUME_NONNULL_END
