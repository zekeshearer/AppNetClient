//
//  ANCDataController.h
//  AppNetClient
//
//  Created by Zeke Shearer on 6/23/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ANCPostsCompletion)(BOOL success, NSError *error);

@interface ANCDataController : NSObject

+ (ANCDataController *)instance;
- (void)fetchPostsWithCompletion:(ANCPostsCompletion)completion;
- (NSArray *)existingPosts;

@end
