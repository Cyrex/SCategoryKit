//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIColor+SHex.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/7: Created by Cyrex on 2020/1/7
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SHex)

+ (UIColor *)s_colorWithHex:(uint)hex;

+ (UIColor *)s_colorWithHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
