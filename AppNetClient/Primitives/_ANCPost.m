// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANCPost.m instead.

#import "_ANCPost.h"


const struct ANCPostAttributes ANCPostAttributes = {
	.creationDate = @"creationDate",
	.postId = @"postId",
	.postText = @"postText",
};



const struct ANCPostRelationships ANCPostRelationships = {
	.user = @"user",
};





const struct ANCPostUserInfo ANCPostUserInfo = {
};


@implementation ANCPostID
@end

@implementation _ANCPost

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Post" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Post";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Post" inManagedObjectContext:moc_];
}

- (ANCPostID*)objectID {
	return (ANCPostID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic creationDate;






@dynamic postId;






@dynamic postText;






@dynamic user;

	






@end




