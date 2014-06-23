#import "ANCPost.h"


@interface ANCPost ()

// Private interface goes here.

@end


@implementation ANCPost

- (NSError *)updateFromDictionary:(NSDictionary *)dictionary;
{
    self.postText = [dictionary nonNullValueForKey:@"text"];
    self.creationDate = [[self.class creationDateFormatter] dateFromString:[dictionary nonNullValueForKey:@"created_at"]];
    self.postId = [dictionary nonNullValueForKey:@"id"];
    
    return nil;
}

+ (NSDateFormatter *)creationDateFormatter
{
    NSDateFormatter *dateFormatter;
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    
    return dateFormatter;
}

@end
