//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIImage+SCut.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/2/10: Created by Cyrex on 2020/2/10
//

#import "UIImage+SCut.h"

@implementation UIImage (SCut)
+ (UIImage *)s_cutImage:(UIImage *)image rect:(CGRect)rect {
    CGImageRef refImage = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage *newImage = [UIImage imageWithCGImage:refImage];

    CGImageRelease(refImage);

    return newImage;
}

@end
