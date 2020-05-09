//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIImage+SScale.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/2/10: Created by Cyrex on 2020/2/10
//

#import "UIImage+SScale.h"

@implementation UIImage (SScale)
+ (UIImage *)s_scaleImage:(UIImage *)image size:(CGSize)size {
    UIGraphicsBeginImageContext(size);

    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return scaledImage;
}

@end
