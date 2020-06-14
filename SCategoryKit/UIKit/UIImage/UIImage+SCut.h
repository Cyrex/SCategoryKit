//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIImage+SCut.h
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

@interface UIImage (SCut)

+ (UIImage *)s_cutImage:(UIImage *)image rect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
