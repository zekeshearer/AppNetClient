// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANCUser.m instead.

#import "_ANCUser.h"


const struct ANCUserAttributes ANCUserAttributes = {
	.avatarUrl = @"avatarUrl",
	.userId = @"userId",
	.userName = @"userName",
};



const struct ANCUserRelationships ANCUserRelationships = {
	.posts = @"posts",
};





const struct ANCUserUserInfo ANCUserUserInfo = {
};


@implementation ANCUserID
@end

@implementation _ANCUser

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (ANCUserID*)objectID {
	return (ANCUserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic avatarUrl;






@dynamic userId;






@dynamic userName;






@dynamic posts;

	
- (NSMutableSet*)postsSet {
	[self willAccessValueForKey:@"posts"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"posts"];
  
	[self didAccessValueForKey:@"posts"];
	return result;
}
	






@end




