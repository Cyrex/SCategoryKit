//
//  Copyright © 2020 ZhiweiSun. All rights reserved.
//
//  File name: UIColor+SHex.m
//  Author:    Zhiwei Sun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2020/1/7: Created by Cyrex on 2020/1/7
//

#import "UIColor+SHex.h"

@implementation UIColor (SHex)
+ (UIColor *)s_colorWithHex:(uint)hex {
    int red, green, blue, alpha;

    blue = hex & 0x000000FF;
    green = ((hex & 0x0000FF00) >> 8);
    red = ((hex & 0x00FF0000) >> 16);
    alpha = ((hex & 0xFF000000) >> 24);

    return [UIColor colorWithRed:red/255.0f
                           green:green/255.0f
                            blue:blue/255.0f
                           alpha:alpha/255.f];
}


+ (UIColor *)s_colorWithHexString:(NSString *)hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self s_colorComponentFrom:colorString start:0 length:1];
            green = [self s_colorComponentFrom:colorString start:1 length:1];
            blue  = [self s_colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: // #ARGB
            alpha = [self s_colorComponentFrom:colorString start:0 length:1];
            red   = [self s_colorComponentFrom:colorString start:1 length:1];
            green = [self s_colorComponentFrom:colorString start:2 length:1];
            blue  = [self s_colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self s_colorComponentFrom:colorString start:0 length:2];
            green = [self s_colorComponentFrom:colorString start:2 length:2];
            blue  = [self s_colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self s_colorComponentFrom:colorString start:0 length:2];
            red   = [self s_colorComponentFrom:colorString start:2 length:2];
            green = [self s_colorComponentFrom:colorString start:4 length:2];
            blue  = [self s_colorComponentFrom:colorString start:6 length:2];
            break;
        default:
#ifdef DEBUG
            [NSException raise:@"Invalid color value"
                        format:@"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
#else
            alpha = 1.0f;
            red   = 1.0f;
            green = 1.0f;
            blue  = 1.0f;
#endif
            break;
    }

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)s_colorComponentFrom:(NSString *)string start:(NSUInteger) start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];

    return hexComponent / 255.0;
}

@end
