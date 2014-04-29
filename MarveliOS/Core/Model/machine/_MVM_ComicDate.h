// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_ComicDate.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_ComicDateAttributes {
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *type;
} MVM_ComicDateAttributes;

extern const struct MVM_ComicDateRelationships {
	__unsafe_unretained NSString *comic;
} MVM_ComicDateRelationships;

extern const struct MVM_ComicDateFetchedProperties {
} MVM_ComicDateFetchedProperties;

@class MVM_Comic;




@interface MVM_ComicDateID : NSManagedObjectID {}
@end

@interface _MVM_ComicDate : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_ComicDateID*)objectID;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) MVM_Comic *comic;

//- (BOOL)validateComic:(id*)value_ error:(NSError**)error_;





@end

@interface _MVM_ComicDate (CoreDataGeneratedAccessors)

@end

@interface _MVM_ComicDate (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (MVM_Comic*)primitiveComic;
- (void)setPrimitiveComic:(MVM_Comic*)value;


@end
