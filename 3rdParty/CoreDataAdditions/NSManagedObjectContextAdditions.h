// NSManagedObjectContextAdditions.h Copyright(c) 2010 Surf Shack Software.
// Under MIT License. See bottom of this file.

#import <CoreData/NSManagedObjectContext.h>

@interface NSManagedObjectContext (SSSAdditions)

- (NSArray *)objectsForEntityNamed:(NSString *)entityName predicate:(NSPredicate *)predicate sortString:(NSString *)sortString error:(NSError **)inError;
- (id)objectForEntityNamed:(NSString *)entityName predicate:(NSPredicate *)predicate;
- (NSArray *)objectsForEntityNamed:(NSString *)entityName;
- (NSArray *)objectsForEntityNamed:(NSString *)entityName matchingKey:(NSString *)key andValue:(id)value;
- (NSInteger)countOfObjectsForEntityNamed:(NSString *)entity predicate:(NSPredicate *)predicate;
- (id)objectForEntityNamed:(NSString *)entityName matchingKey:(NSString *)key andValue:(id)value error:(NSError **)error;
// Returns object if it exists, nil if it does not.
- (id)optionalObjectForEntityNamed:(NSString *)entityName matchingKey:(NSString *)key andValue:(id)value;

- (NSFetchRequest *)fetchRequestForEntityNamed:(NSString *)entityName predicate:(NSPredicate *)predicate sortString:(NSString *)sortString;

- (void)deleteObjects:(NSArray *)mos;

- (void)refaultAllObjects;
@end

/*
 NSManagedObjectContextAdditions.h

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
