//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIImage+SClip.h
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

@interface UIImage (SClip)

+ (UIImage *)s_clipImage:(UIImage *)image withRect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
