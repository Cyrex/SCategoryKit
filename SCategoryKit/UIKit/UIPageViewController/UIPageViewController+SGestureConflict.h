//
//  Copyright © 2019 ZhiweiSun. All rights reserved.
//
//  File name: UIPageViewController+SGestureConflict.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2019/11/28: Created by Cyrex on 2019/11/28
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIPageViewController (SGestureConflict)

/// Handle gesture conflicts between pageviewcontroller's pan gesture and other gesture,
/// especially for screen edge pan gestureRecognizer in navigationController.
/// @param recognizer a gestureRecognizer, default is navigationController's pop gestureRecognizer.
- (void)s_requireGestureRecognizerToFail:(UIGestureRecognizer *)recognizer;

@end

NS_ASSUME_NONNULL_END
