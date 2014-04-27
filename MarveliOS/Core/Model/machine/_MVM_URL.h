// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_URL.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_URLAttributes {
	__unsafe_unretained NSString *path;
	__unsafe_unretained NSString *type;
} MVM_URLAttributes;

extern const struct MVM_URLRelationships {
	__unsafe_unretained NSString *character;
	__unsafe_unretained NSString *comic;
	__unsafe_unretained NSString *creator;
	__unsafe_unretained NSString *event;
	__unsafe_unretained NSString *series;
	__unsafe_unretained NSString *story;
} MVM_URLRelationships;

extern const struct MVM_URLFetchedProperties {
} MVM_URLFetchedProperties;

@class MVM_Character;
@class MVM_Comic;
@class MVM_Creator;
@class MVM_Event;
@class MVM_Series;
@class MVM_Story;




@interface MVM_URLID : NSManagedObjectID {}
@end

@interface _MVM_URL : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_URLID*)objectID;





@property (nonatomic, strong) NSString* path;



//- (BOOL)validatePath:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) MVM_Character *character;

//- (BOOL)validateCharacter:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Comic *comic;

//- (BOOL)validateComic:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Creator *creator;

//- (BOOL)validateCreator:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Event *event;

//- (BOOL)validateEvent:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Series *series;

//- (BOOL)validateSeries:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Story *story;

//- (BOOL)validateStory:(id*)value_ error:(NSError**)error_;





@end

@interface _MVM_URL (CoreDataGeneratedAccessors)

@end

@interface _MVM_URL (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitivePath;
- (void)setPrimitivePath:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (MVM_Character*)primitiveCharacter;
- (void)setPrimitiveCharacter:(MVM_Character*)value;



- (MVM_Comic*)primitiveComic;
- (void)setPrimitiveComic:(MVM_Comic*)value;



- (MVM_Creator*)primitiveCreator;
- (void)setPrimitiveCreator:(MVM_Creator*)value;



- (MVM_Event*)primitiveEvent;
- (void)setPrimitiveEvent:(MVM_Event*)value;



- (MVM_Series*)primitiveSeries;
- (void)setPrimitiveSeries:(MVM_Series*)value;



- (MVM_Story*)primitiveStory;
- (void)setPrimitiveStory:(MVM_Story*)value;


@end
