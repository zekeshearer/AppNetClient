#import "ANCUser.h"


@interface ANCUser ()

// Private interface goes here.

@end


@implementation ANCUser

- (NSError *)updateFromDictionary:(NSDictionary *)dictionary;
{
    NSDictionary *imageDictionary;
    
    self.userId = [dictionary nonNullValueForKey:@"id"];
    self.userName = [dictionary nonNullValueForKey:@"username"];
    
    imageDictionary = [dictionary nonNullValueForKey:@"avatar_image"];
    self.avatarUrl = [imageDictionary nonNullValueForKey:@"url"];
    
    return nil;
}

@end
