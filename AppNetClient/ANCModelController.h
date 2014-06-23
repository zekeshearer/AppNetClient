//
//  ANCModelController.h
//  AppNetClient
//
//  Created by Zeke Shearer on 6/23/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ANCModelController : NSObject

+ (ANCModelController *)instance;

@property (readonly, strong, nonatomic) NSManagedObjectContext *readMOC;
@property (readonly, strong, nonatomic) NSManagedObjectContext *writeMOC;


@end
