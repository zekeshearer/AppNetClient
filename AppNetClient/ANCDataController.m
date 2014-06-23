//
//  ANCDataController.m
//  AppNetClient
//
//  Created by Zeke Shearer on 6/23/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import "ANCDataController.h"
#import "AFNetworking.h"
#import "ANCModelController.h"

@interface ANCDataController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

static NSString *ANCPostUrl = @"https://alpha-api.app.net/stream/0/posts/stream/global";

@implementation ANCDataController

static ANCDataController *_instance = nil;

- (id)init
{
    self = [super init];
    if ( self ) {
        self.operationQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

+ (ANCDataController *)instance
{
    static dispatch_once_t onceToken;
    static ANCDataController *_instance = nil;
    dispatch_once(&onceToken, ^{
        _instance= [[ANCDataController alloc] init];
    });
    return _instance;
}

- (void)fetchPostsWithCompletion:(ANCPostsCompletion)completion
{
    AFHTTPRequestOperation *operation;
    
    operation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:ANCPostUrl]]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *response;
        NSArray *postDicts;

        response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        postDicts = response[@"data"];
        [self _updatePosts:postDicts withCompletion:completion];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if ( completion ) {
            completion(NO, error);
        }
    }];
    
    [self.operationQueue addOperation:operation];
}

- (void)_updatePosts:(NSArray *)postDictionaries withCompletion:(ANCPostsCompletion)completion
{
    NSManagedObjectContext *moc;
    
    moc = [[ANCModelController instance] writeMOC];
    
    [moc performBlock:^{
        NSArray *existingPosts;
        NSMutableArray *existingUsers;
        NSMutableDictionary *existingPostsCache;
        NSMutableDictionary *existingUsersCache;
        NSString *postId;
        NSMutableSet *activeUsers;
        ANCPost *post;
        NSDictionary *userDictionary;
        ANCUser *user;
        NSString *userID;
        
        //getting what we currently have in the database
        existingPosts = [moc objectsForEntityNamed:@"Post"];
        existingUsers = [moc objectsForEntityNamed:@"User"].mutableCopy;
        existingPostsCache = [NSMutableDictionary dictionary];
        for ( ANCPost *existingPost in existingPosts ) {
            [existingPostsCache setObject:existingPost forKey:existingPost.postId];
        }
        existingUsersCache = [NSMutableDictionary dictionary];
        for ( ANCUser *existingUser in existingUsers ) {
            [existingUsersCache setObject:existingUser forKey:existingUser.userId];
        }
        
        //updating from the web service
        activeUsers = [NSMutableSet set];
        for ( NSDictionary *postDict in postDictionaries ) {
            //post
            postId = [postDict nonNullValueForKey:@"id"];
            if ( !postId ) {
                continue;
            }
            post = [existingPostsCache objectForKey:postId];
            if ( !post ) {
                post = [ANCPost insertInManagedObjectContext:moc];
            } else {
                [existingPostsCache removeObjectForKey:postId];
            }
            
            [post updateFromDictionary:postDict];
            
            //user
            userDictionary = [postDict nonNullValueForKey:@"user"];
            userID = [userDictionary nonNullValueForKey:@"id"];
            user = [existingUsersCache objectForKey:userID];
            if ( !user ) {
                user = [ANCUser insertInManagedObjectContext:moc];
            } else {
                [activeUsers addObject:user];
            }
            [user updateFromDictionary:userDictionary];
            post.user = user;
        }
        
        //deleting expired posts and orphaned users
        [existingUsers removeObjectsInArray:activeUsers.allObjects];
        [moc deleteObjects:existingUsers];
        [moc deleteObjects:existingPostsCache.allValues];
        
        [moc save:nil];
        if ( completion ) {
            completion(YES, nil);
        }
    }];
}

- (NSArray *)existingPosts
{
    NSManagedObjectContext *moc;
    NSArray *posts;
    
    moc = [[ANCModelController instance] readMOC];
    posts = [moc objectsForEntityNamed:@"Post"];
    return [posts sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]]];
}

























@end
