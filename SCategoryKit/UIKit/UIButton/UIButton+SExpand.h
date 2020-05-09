//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIButton+SExpand.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/17: Created by Cyrex on 2020/1/17
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SUIButtonLayoutStyle) {
    SImageLeftTitleRightStyle = 0, // image L title R
    STitleLeftImageRightStyle = 1, // image R title L
    SImageTopTitleBottomStyle = 2, // image T title B
    STitleTopImageBottomStyle = 3, // image B title T
};

@interface UIButton (SExpand)

- (void)s_setLayout:(SUIButtonLayoutStyle)style
             spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
