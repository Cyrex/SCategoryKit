//
//  Copyright © 2019 ZhiweiSun. All rights reserved.
//
//  File name: UIPageViewController+SGestureConflict.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2019/11/28: Created by Cyrex on 2019/11/28
//

#import "UIPageViewController+SGestureConflict.h"

@implementation UIPageViewController (SGestureConflict)
- (void)s_requireGestureRecognizerToFail:(UIGestureRecognizer *)recognizer {
    UIGestureRecognizer *requireGesture = nil;

    if (recognizer) {
        requireGesture = recognizer;
    } else {
        requireGesture = self.navigationController.interactivePopGestureRecognizer;
    }

    NSMutableArray *gestureArray = [NSMutableArray array];

    for (UIView *subView in self.view.subviews) {
        [gestureArray addObjectsFromArray:subView.gestureRecognizers];
    }

    for (UIGestureRecognizer *gesture in gestureArray) {
        if (requireGesture) {
            [gesture requireGestureRecognizerToFail:requireGesture];
        }
    }
}

@end
