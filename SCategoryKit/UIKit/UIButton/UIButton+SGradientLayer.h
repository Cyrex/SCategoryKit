//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIButton+SGradientLayer.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/6: Created by Cyrex on 2020/1/6
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (SGradientLayer)

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

- (void)s_displayTextColors:(NSArray<UIColor *> *)colors withFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
