// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANCUser.h instead.

#import <CoreData/CoreData.h>



extern const struct ANCUserAttributes {
	__unsafe_unretained NSString *avatarUrl;
	__unsafe_unretained NSString *userId;
	__unsafe_unretained NSString *userName;
} ANCUserAttributes;



extern const struct ANCUserRelationships {
	__unsafe_unretained NSString *posts;
} ANCUserRelationships;





extern const struct ANCUserUserInfo {
} ANCUserUserInfo;


@class ANCPost;








@interface ANCUserID : NSManagedObjectID {}
@end

@interface _ANCUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ANCUserID* objectID;





@property (nonatomic, strong) NSString* avatarUrl;



//- (BOOL)validateAvatarUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userId;



//- (BOOL)validateUserId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userName;



//- (BOOL)validateUserName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *posts;

- (NSMutableSet*)postsSet;





@end


@interface _ANCUser (PostsCoreDataGeneratedAccessors)
- (void)addPosts:(NSSet*)value_;
- (void)removePosts:(NSSet*)value_;
- (void)addPostsObject:(ANCPost*)value_;
- (void)removePostsObject:(ANCPost*)value_;
@end


@interface _ANCUser (CoreDataGeneratedPrimitiveAccessors)



- (NSMutableSet*)primitivePosts;
- (void)setPrimitivePosts:(NSMutableSet*)value;


@end
