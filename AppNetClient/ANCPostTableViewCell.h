//
//  ANCPostTableViewCell.h
//  AppNetClient
//
//  Created by Zeke Shearer on 6/23/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *ANCPostTableViewCellIdentifier;

@interface ANCPostTableViewCell : UITableViewCell

@property (nonatomic, strong) ANCPost *post;

@end
