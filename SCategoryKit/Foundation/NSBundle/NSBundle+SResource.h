//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: NSBundle+SResource.h
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/11/30: Created by Cyrex on 2020/11/30
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (SResource)

+ (NSBundle *)s_bundleWithName:(NSString *)name;

- (nullable NSData *)s_dataForResource:(nullable NSString *)name ofType:(nullable NSString *)ext;

- (nullable id)s_plistForResource:(nullable NSString *)name ofType:(nullable NSString *)ext;

- (nullable id)s_jsonForResource:(nullable NSString *)name ofType:(nullable NSString *)ext;

@end

NS_ASSUME_NONNULL_END
