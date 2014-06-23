// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APNPost.m instead.

#import "_APNPost.h"


const struct APNPostAttributes APNPostAttributes = {
	.creationDate = @"creationDate",
	.postText = @"postText",
};



const struct APNPostRelationships APNPostRelationships = {
	.user = @"user",
};





const struct APNPostUserInfo APNPostUserInfo = {
};


@implementation APNPostID
@end

@implementation _APNPost

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

- (APNPostID*)objectID {
	return (APNPostID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic creationDate;






@dynamic postText;






@dynamic user;

	






@end




