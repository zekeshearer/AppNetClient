// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APNUser.m instead.

#import "_APNUser.h"


const struct APNUserAttributes APNUserAttributes = {
	.avatarUrl = @"avatarUrl",
	.userName = @"userName",
};



const struct APNUserRelationships APNUserRelationships = {
	.posts = @"posts",
};





const struct APNUserUserInfo APNUserUserInfo = {
};


@implementation APNUserID
@end

@implementation _APNUser

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

- (APNUserID*)objectID {
	return (APNUserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic avatarUrl;






@dynamic userName;






@dynamic posts;

	
- (NSMutableSet*)postsSet {
	[self willAccessValueForKey:@"posts"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"posts"];
  
	[self didAccessValueForKey:@"posts"];
	return result;
}
	






@end




