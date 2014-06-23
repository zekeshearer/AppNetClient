// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APNUser.h instead.

#import <CoreData/CoreData.h>



extern const struct APNUserAttributes {
	__unsafe_unretained NSString *avatarUrl;
	__unsafe_unretained NSString *userName;
} APNUserAttributes;



extern const struct APNUserRelationships {
	__unsafe_unretained NSString *posts;
} APNUserRelationships;





extern const struct APNUserUserInfo {
} APNUserUserInfo;


@class APNPost;






@interface APNUserID : NSManagedObjectID {}
@end

@interface _APNUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) APNUserID* objectID;





@property (nonatomic, strong) NSString* avatarUrl;



//- (BOOL)validateAvatarUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userName;



//- (BOOL)validateUserName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *posts;

- (NSMutableSet*)postsSet;





@end


@interface _APNUser (PostsCoreDataGeneratedAccessors)
- (void)addPosts:(NSSet*)value_;
- (void)removePosts:(NSSet*)value_;
- (void)addPostsObject:(APNPost*)value_;
- (void)removePostsObject:(APNPost*)value_;
@end


@interface _APNUser (CoreDataGeneratedPrimitiveAccessors)



- (NSMutableSet*)primitivePosts;
- (void)setPrimitivePosts:(NSMutableSet*)value;


@end
