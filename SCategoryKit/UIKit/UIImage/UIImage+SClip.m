//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIImage+SClip.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/2/10: Created by Cyrex on 2020/2/10
//

#import "UIImage+SClip.h"

@implementation UIImage (SClip)
+ (UIImage *)s_clipImage:(UIImage *)image withRect:(CGRect)rect {
    CGFloat scale = [UIScreen mainScreen].scale;
    CGRect clipFrame = CGRectMake(rect.origin.x * scale,
                                  rect.origin.y * scale,
                                  rect.size.width * scale,
                                  rect.size.height * scale);

    CGImageRef refImage = CGImageCreateWithImageInRect(image.CGImage, clipFrame);
    UIImage *newImage = [UIImage imageWithCGImage:refImage];

    CGImageRelease(refImage);
    
    return newImage;
}

@end
