// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to APNPost.h instead.

#import <CoreData/CoreData.h>



extern const struct APNPostAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *postText;
} APNPostAttributes;



extern const struct APNPostRelationships {
	__unsafe_unretained NSString *user;
} APNPostRelationships;





extern const struct APNPostUserInfo {
} APNPostUserInfo;


@class APNUser;






@interface APNPostID : NSManagedObjectID {}
@end

@interface _APNPost : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) APNPostID* objectID;





@property (nonatomic, strong) NSDate* creationDate;



//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* postText;



//- (BOOL)validatePostText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) APNUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end



@interface _APNPost (CoreDataGeneratedPrimitiveAccessors)



- (APNUser*)primitiveUser;
- (void)setPrimitiveUser:(APNUser*)value;


@end
