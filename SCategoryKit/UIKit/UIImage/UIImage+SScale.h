//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIImage+SScale.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/2/10: Created by Cyrex on 2020/2/10
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SScale)

+ (UIImage *)s_scaleImage:(UIImage *)image size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
