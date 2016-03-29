//
//  ViewController.m
//  DDImageTinter
//
//  Created by Daniel Djurfelter on 14/03/16.
//  Copyright © 2016 Daniel Djurfelter. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+DDImageTinter.h"

typedef NS_ENUM(NSInteger, DDButtonType)
{
    DDButtonTypeDefault = 0,
    DDButtonTypeGrayScale,
};

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *defaultImage;
@property (nonatomic, strong) UIImage *originalImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalImage = [self.defaultImage.image copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tintImage:(UIButton *)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        switch (sender.tag) {
            case DDButtonTypeGrayScale:
                self.defaultImage.image = [[self.originalImage copy] grayScaleImage];
                break;
            default: {
                UIColor *tintColor = [sender backgroundColor];
                self.defaultImage.image = [[self.originalImage copy] tintedImageWithColor:tintColor];
                break;
            }
        }
    });
}

@end
