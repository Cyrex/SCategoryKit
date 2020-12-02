//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: NSBundle+SResource.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/11/30: Created by Cyrex on 2020/11/30
//

#import "NSBundle+SResource.h"

@implementation NSBundle (SResource)
+ (NSBundle *)s_bundleWithName:(NSString *)name {
    NSString *path = [NSBundle.mainBundle pathForResource:name
                                                   ofType:@"bundle"];

    return path?[NSBundle bundleWithPath:path]:nil;
}

- (NSData *)s_dataForResource:(NSString *)name ofType:(NSString *)ext {
    NSString *path = [self pathForResource:name ofType:ext];

    return path?[NSData dataWithContentsOfFile:path]:nil;
}

- (id)s_plistForResource:(NSString *)name ofType:(NSString *)ext {
    NSString *path = [self pathForResource:name ofType:ext];
    NSData *plistData = path?[NSData dataWithContentsOfFile:path]:nil;
    if (!plistData) {
        return nil;
    }

    return [NSPropertyListSerialization propertyListWithData:plistData
                                                     options:0
                                                      format:nil
                                                       error:nil];
}

- (id)s_jsonForResource:(NSString *)name ofType:(NSString *)ext {
    NSString *path = [self pathForResource:name ofType:ext];
    NSData *jsonData = path?[NSData dataWithContentsOfFile:path]:nil;
    if (!jsonData) {
        return nil;
    }

    return [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
}

@end
