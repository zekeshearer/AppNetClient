// NSManagedObjectContextAdditions.m Copyright(c) 2010 Surf Shack Software.
// Under MIT License. See bottom of this file.

#import "NSManagedObjectContextAdditions.h"
#import "NSSortDescriptorAdditions.h"

@implementation NSManagedObjectContext (SSSAdditions)

- (NSArray *)objectsForEntityNamed:(NSString *)entityName predicate:(NSPredicate *)predicate sortString:(NSString *)sortString error:(NSError **)inError
{
    NSFetchRequest *request;
    NSError *myError;
    NSArray *results;
    
    request = [self fetchRequestForEntityNamed:entityName predicate:predicate sortString:sortString];
    
    if ( inError ) {
        results = [self executeFetchRequest:request error:inError];
        if ( !results || *inError ) {
            NSLog(@"Error executing fetch:%@", *inError);
        }
    } else {
        myError = nil;
        results = [self executeFetchRequest:request error:&myError];
        if ( !results || myError ) {
            NSLog(@"Error executing fetch:%@", myError);
        }
    }
    
    return results;
}

- (id)objectForEntityNamed:(NSString *)entityName predicate:(NSPredicate *)predicate
{
    NSArray *results;
    NSError *error;
    
    error = nil;
    results = [self objectsForEntityNamed:entityName predicate:predicate sortString:nil error:&error];
    if ( !results || error ) {
        NSLog(@"%@", error);
    }
    switch ( results.count ) {
        case 0:
            return nil;
            break;
        case 1:
            return [results objectAtIndex:0];
            break;
        default:
            NSLog(@"More than one object fetched. Returning nil");
            return nil;
            break;
    }
    return nil;
}

- (NSArray *)objectsForEntityNamed:(NSString *)entityName
{
    return [self objectsForEntityNamed:entityName predicate:nil sortString:nil error:NULL];
}

- (NSArray *)objectsForEntityNamed:(NSString *)entityName matchingKey:(NSString *)key andValue:(id)value
{
    NSString *formatString;
    NSPredicate *predicate;
    
    formatString = [key stringByAppendingString:@" = %@"];
    predicate = [NSPredicate predicateWithFormat:formatString, value];
    return [self objectsForEntityNamed:entityName predicate:predicate sortString:nil error:nil];
}

- (NSManagedObject *)objectForEntityNamed:(NSString *)entityName matchingKey:(NSString *)key andValue:(id)value error:(NSError **)error
{
    NSString *formatString;
    NSPredicate *predicate;
    NSArray *results;
    
    formatString = [key stringByAppendingString:@" = %@"];
    predicate = [NSPredicate predicateWithFormat:formatString, value];
    results = [self objectsForEntityNamed:entityName predicate:predicate sortString:nil error:error];    
    switch ( results.count ) {
        case 0:
            if ( error != NULL ) {
                *error = [NSError errorWithDomain:@"SSSCoreDataErrorDomain" code:1 userInfo:[NSDictionary dictionaryWithObject:@"Object Not Found" forKey:NSLocalizedDescriptionKey]];
            }
            return nil;
        case 1:
            if ( error != NULL ) {
                *error = nil;
            }
            return [results objectAtIndex:0];
        default:
            if ( error != NULL ) {
                *error = [NSError errorWithDomain:@"SSSCoreDataErrorDomain" code:2 userInfo:[NSDictionary dictionaryWithObject:@"More than one object found when only one expected" forKey:NSLocalizedDescriptionKey]];
            }
            return nil;
    }
    return nil;
}

- (NSInteger)countOfObjectsForEntityNamed:(NSString *)entity predicate:(NSPredicate *)predicate
{
    NSFetchRequest *fetchRequest;
    
    fetchRequest = [self fetchRequestForEntityNamed:entity predicate:predicate sortString:nil];
    return [self countForFetchRequest:fetchRequest error:nil];
}

- (id)optionalObjectForEntityNamed:(NSString *)entityName matchingKey:(NSString *)key andValue:(id)value
{
    NSString *formatString;
    NSPredicate *predicate;
    NSArray *results;
    NSError *error;
    
    formatString = [key stringByAppendingString:@" = %@"];
    predicate = [NSPredicate predicateWithFormat:formatString, value];
    results = [self objectsForEntityNamed:entityName predicate:predicate sortString:nil error:&error];    
    switch ( results.count ) {
        case 0:
            return nil;
        case 1:
            return [results objectAtIndex:0];
        default:
            NSLog(@"More than one object found matching %@ = %@", key, value);
            return nil;
    }
    return nil;    
}

- (NSFetchRequest *)fetchRequestForEntityNamed:(NSString *)entityName predicate:(NSPredicate *)predicate sortString:(NSString *)sortString
{
    NSEntityDescription *entity;
    NSFetchRequest *request;
    
    entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self];
    request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    if ( predicate ) {
        [request setPredicate:predicate];
    }
    if ( sortString ) {
        [request setSortDescriptors:[NSSortDescriptor sortDescriptorsFromString:sortString]];
    }
    return request;
}

- (void)refaultAllObjects
{
     NSSet *registeredObjects;
    
    registeredObjects = [self registeredObjects];
    for ( NSManagedObject *mo in registeredObjects ) {
        [self refreshObject:mo mergeChanges:NO];
    }
    
}

- (void)deleteObjects:(NSArray *)mos
{
    for ( NSManagedObject *mo in mos ) {
        [self deleteObject:mo];
    }
}

@end

/*
 NSManagedObjectContextAdditions.m

 Copyright (c) 2010 Surf Shack Software

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/
