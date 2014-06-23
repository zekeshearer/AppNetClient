// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ANCPost.h instead.

#import <CoreData/CoreData.h>



extern const struct ANCPostAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *postId;
	__unsafe_unretained NSString *postText;
} ANCPostAttributes;



extern const struct ANCPostRelationships {
	__unsafe_unretained NSString *user;
} ANCPostRelationships;





extern const struct ANCPostUserInfo {
} ANCPostUserInfo;


@class ANCUser;








@interface ANCPostID : NSManagedObjectID {}
@end

@interface _ANCPost : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ANCPostID* objectID;





@property (nonatomic, strong) NSDate* creationDate;



//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* postId;



//- (BOOL)validatePostId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* postText;



//- (BOOL)validatePostText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) ANCUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end



@interface _ANCPost (CoreDataGeneratedPrimitiveAccessors)



- (ANCUser*)primitiveUser;
- (void)setPrimitiveUser:(ANCUser*)value;


@end
