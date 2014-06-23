//
//  NSDictionary+DataAdditions.h
//  AppNetClient
//
//  Created by Zeke Shearer on 6/23/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DataAdditions)

- (id)nonNullValueForKey:(NSString *)key;

@end
