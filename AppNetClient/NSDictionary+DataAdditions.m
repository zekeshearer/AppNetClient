//
//  NSDictionary+DataAdditions.m
//  AppNetClient
//
//  Created by Zeke Shearer on 6/23/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import "NSDictionary+DataAdditions.h"

@implementation NSDictionary (DataAdditions)

- (id)nonNullValueForKey:(NSString *)key
{
    id value = [self valueForKey:key];
    if ( value == [NSNull null] ) {
        return nil;
    }
    return value;
}

@end
