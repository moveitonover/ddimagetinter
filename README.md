# DDImageTinter
A slim, ease of use image manipulation framework for iOS

## Example
```objective-c
UIImage *foo = [UIImage imageNamed:@"foo"];

// Convert to grayscale
[foo grayScaleImage];

// Tint image with custom color
[foo tintedImageWithColor:[UIColor greenColor]];
```