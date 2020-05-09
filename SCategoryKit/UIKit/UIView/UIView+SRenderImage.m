//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIView+SRenderImage.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/16: Created by Cyrex on 2020/1/16
//

#import "UIView+SRenderImage.h"

@implementation UIView (SRenderImage)
- (UIImage *)s_renderImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return viewImage;
}

- (UIImage *)s_renderImageWithFrame:(CGRect)frame {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    CGFloat scale = [UIScreen mainScreen].scale;

    CGFloat x = frame.origin.x * scale;
    CGFloat y = frame.origin.y * scale;
    CGFloat w = frame.size.width * scale;
    CGFloat h = frame.size.height * scale;
    CGRect newFrame = CGRectMake(x, y, w, h);

    CGImageRef imageRef = [viewImage CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(imageRef, newFrame);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    CGImageRelease(newImageRef);

    return newImage;
}


@end
