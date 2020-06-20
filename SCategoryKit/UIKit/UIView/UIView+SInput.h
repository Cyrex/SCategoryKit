//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIView+SInput.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/6/19: Created by Cyrex on 2020/6/19
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: -
// MARK: - SInputModel
@interface SInputModel : NSObject

@property (nonatomic, weak) UIView  *dismissView;
@property (nonatomic, weak) UIView  *transformView;
@property (nonatomic, weak) UIView  *visibleView;

@end


// MARK: -
// MARK: - UIView (SInput)
@interface UIView (SInput)

- (SInputModel *)s_inputModel;

- (void)s_changeInputEnable:(BOOL)inputEnable;

@end

NS_ASSUME_NONNULL_END
