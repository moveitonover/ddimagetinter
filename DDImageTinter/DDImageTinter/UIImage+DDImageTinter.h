//
//  UIImage+DDImageTinter.h
//  DDImageTinter
//
//  Created by Daniel Djurfelter on 14/03/16.
//  Copyright © 2016 Daniel Djurfelter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DDImageTinter)

// Returns the image tinted with the tint color with multiply blend mode
-(UIImage *)tintedImageWithColor:(UIColor *)tintColor;

// Returns the image tinted with the tint color, defined blendmode and alpha
-(UIImage*)tintedImageWithColor:(UIColor*)tintColor
                      blendMode:(CGBlendMode)blendMode
                          alpha:(CGFloat)alpha;

// Returns a grayscale representation of the image
-(UIImage*)grayScaleImage;

@end
