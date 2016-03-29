//
//  UIImage+DDImageTinter.m
//  DDImageTinter
//
//  Created by Daniel Djurfelter on 14/03/16.
//  Copyright © 2016 Daniel Djurfelter. All rights reserved.
//

#import "UIImage+DDImageTinter.h"

@implementation UIImage (DDImageTinter)

- (UIImage *)tintedImageWithColor:(UIColor *)tintColor
{
    return [self tintedImageWithColor:tintColor
                            blendMode:kCGBlendModeMultiply
                                alpha:1.0];
}

- (UIImage*)tintedImageWithColor:(UIColor*)tintColor
                      blendMode:(CGBlendMode)blendMode
                          alpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    [self drawInRect:bounds blendMode:blendMode alpha:alpha];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

- (UIImage*)grayScaleImage {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    UIImage *grayScaleImage = [self imageWithColorSpace:colorSpace];
    CGColorSpaceRelease(colorSpace);
    return grayScaleImage;
}

- (UIImage*)imageWithColorSpace:(CGColorSpaceRef)colorSpace {
    UIImage *newImage = [self carbonCopy];
    CGRect bounds = CGRectMake(0, 0, newImage.size.width, newImage.size.height);
    
    CGContextRef context = CGBitmapContextCreate(nil, bounds.size.width, bounds.size.height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGContextDrawImage(context, bounds, [newImage CGImage]);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    
    UIImage *colorSpacedImage = [UIImage imageWithCGImage:imageRef];
    
    CGContextRelease(context);
    CFRelease(imageRef);
    
    return colorSpacedImage;
}

/*
 Create a carbon copy of the image to prevent rotation issues when
 changing the color space
 */
- (UIImage*)carbonCopy {
    CGSize size = self.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    CGRect bounds = CGRectMake(0, 0, size.width, size.height);
    
    [self drawInRect:bounds];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end
