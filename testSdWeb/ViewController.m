//
//  ViewController.m
//  testSdWeb
//
//  Created by Theodor Lindgren on 21/01/15.
//  Copyright (c) 2015 Rabble Communications AB. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"https://www.apple.com/anzsea/ios/images/og.jpg?1234"];
    
    [self setImageViewTwoWithURL:url];
    
    [self setImageViewOneWithURL:url];

    [self performSelector:@selector(setImageViewTwoWithURL:) withObject:url afterDelay:0.1];
}

-(void)setImageViewOneWithURL:(NSURL *)url {
    [self.imageViewOne sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"ImageViewOne completed");
    }];
}

-(void)setImageViewTwoWithURL:(NSURL *)url {
    [self.imageViewTwo sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"ImageViewTwo completed");
    }];
}

@end
