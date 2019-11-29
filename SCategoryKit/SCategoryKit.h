///
///  Copyright © 2019 ZhiweiSun. All rights reserved.
///
///  File name: SCategoryKit.h
///  Author:    ZhiweiSun @Cyrex
///  E-mail:    szwathub@gmail.com
///
///  Description:
///
///  History:
///      11/27/2019: Created by Cyrex on 11/27/2019
///

#import <UIKit/UIKit.h>

//! Project version number for SCategoryKit.
FOUNDATION_EXPORT double SCategoryKitVersionNumber;

//! Project version string for SCategoryKit.
FOUNDATION_EXPORT const unsigned char SCategoryKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SCategoryKit/PublicHeader.h>
#if __has_include(<SCategoryKit/SCategoryKit.h>)
    #import <SCategoryKit/SUIKit.h>
#else
    #import "SUIKit.h"
#endif
