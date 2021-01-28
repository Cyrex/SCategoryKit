//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIView+SRenderImage.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/16: Created by Cyrex on 2020/1/16
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SRenderImage)

- (UIImage *)s_renderImage:(BOOL)opaque;

- (UIImage *)s_renderImage:(BOOL)opaque frame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
