//
//  ANCPostTableViewCell.m
//  AppNetClient
//
//  Created by Zeke Shearer on 6/23/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import "ANCPostTableViewCell.h"
#import "EZSImageView.h"

NSString *ANCPostTableViewCellIdentifier = @"ANCPostTableViewCellIdentifier";

@interface ANCPostTableViewCell ()

@property (weak, nonatomic) IBOutlet EZSImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@end

@implementation ANCPostTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}


- (void)setPost:(ANCPost *)post
{
    _post = post;
    [self updateUI];
}

- (void)updateUI
{
    [self.avatarImageView setImageAtURL:[NSURL URLWithString:self.post.user.avatarUrl]];
    self.avatarImageView.layer.cornerRadius = 10;
    self.nameLabel.text = self.post.user.userName;
    self.bodyLabel.text = self.post.postText;
}

- (void)prepareForReuse
{
    self.avatarImageView.imageView.image = nil;
}

@end
