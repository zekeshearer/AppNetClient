//
//  EZSImageView.h
//
//  Created by Zeke Shearer on 2/4/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EZSImageView : UIView

- (void)setImageAtURL:(NSURL *)url;
- (void)setImage:(UIImage *)image;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSURL *imageURL;

@end
