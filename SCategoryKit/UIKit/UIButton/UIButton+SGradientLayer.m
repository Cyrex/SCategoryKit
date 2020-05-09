//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIButton+SGradientLayer.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/6: Created by Cyrex on 2020/1/6
//

#import "UIButton+SGradientLayer.h"
#import <objc/runtime.h>

@implementation UIButton (SGradientLayer)
- (void)s_displayTextColors:(NSArray<UIColor *> *)colors withFrame:(CGRect)frame {
    if (![self.gradientLayer superlayer]) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(1, 0);

        [self.layer addSublayer:self.gradientLayer];
        self.gradientLayer.frame = frame;
        self.gradientLayer.mask  = self.titleLabel.layer;
    }

    NSMutableArray *displayColors = [NSMutableArray array];
    [colors enumerateObjectsUsingBlock:^(UIColor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [displayColors addObject:(id)obj.CGColor];
    }];

    self.gradientLayer.colors = [displayColors copy];
}

- (CAGradientLayer *)gradientLayer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setGradientLayer:(CAGradientLayer *)gradientLayer {
    objc_setAssociatedObject(self, @selector(gradientLayer), gradientLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
