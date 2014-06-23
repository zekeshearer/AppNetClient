// NSSortDescriptorAdditions.m Copyright(c) 2010 Surf Shack Software.
// Under MIT License. See bottom of this file.

@implementation NSSortDescriptor(SSSAdditions)

+ (NSArray *)sortDescriptorsFromString:(NSString *)string
{
    static NSArray *SORT_STRINGS_ASCENDING = nil;
    static NSArray *SORT_STRINGS_DESCENDING = nil;
    static NSArray *SORT_STRINGS_CASEINSENSITIVE_ASCENDING = nil;
    static NSArray *SORT_STRINGS_CASEINSENSITIVE_DESCENDING = nil;
    static NSArray *SORT_DATE_ASCENDING = nil;
    static NSArray *SORT_DATE_DESCENDING = nil;

    NSArray *components;
    NSSortDescriptor *descriptor;
    NSMutableArray *descriptors;
    NSString *key;
    NSString *direction;
    NSInteger count;
    NSInteger i;
    
    if ( !SORT_STRINGS_ASCENDING ) {
        SORT_STRINGS_ASCENDING = [@"up,asc" componentsSeparatedByString:@","];
        SORT_STRINGS_DESCENDING = [@"down,desc" componentsSeparatedByString:@","];
        SORT_STRINGS_CASEINSENSITIVE_ASCENDING = [@"ciup,ciasc" componentsSeparatedByString:@","];
        SORT_STRINGS_CASEINSENSITIVE_DESCENDING = [@"cidown,cidesc" componentsSeparatedByString:@","];
        SORT_DATE_ASCENDING = [@"dateup,dateasc" componentsSeparatedByString:@","];
        SORT_DATE_DESCENDING = [@"datedown,datedesc" componentsSeparatedByString:@","];
    }
    
    descriptors = [NSMutableArray array];
    components = [string componentsSeparatedByString:@","];
    count = [components count];
    for ( i = 0 ; i < count ; i += 2 ) {
        key = [components objectAtIndex:i];
        direction = [components objectAtIndex:i + 1];
        descriptor = nil;
        if ( [SORT_STRINGS_ASCENDING containsObject:direction] ) {
            descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES];
        } else if ( [SORT_STRINGS_DESCENDING containsObject:direction] ) {
            descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:NO];
        } else if ( [SORT_STRINGS_CASEINSENSITIVE_ASCENDING containsObject:direction] ) {
            descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES selector:@selector(caseInsensitiveCompare:)];
        } else if (  [SORT_STRINGS_CASEINSENSITIVE_DESCENDING containsObject:direction] ) {
            descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:NO selector:@selector(caseInsensitiveCompare:)];
        } else if ( [SORT_DATE_ASCENDING containsObject:direction] ) {
            descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:YES selector:@selector(compare:)];
        } else if ( [SORT_DATE_DESCENDING containsObject:direction] ) {
            descriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:NO selector:@selector(compare:)];
        } else {
            [NSException raise:NSInvalidArgumentException format:@"Unsupported sort direction '%@'", direction];
        }
        [descriptors addObject:descriptor];
    }
    
    return descriptors;
}

@end


/*
 NSSortDescriptorAdditions.m

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
