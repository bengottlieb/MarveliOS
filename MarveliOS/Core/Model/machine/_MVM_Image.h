// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Image.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_ImageAttributes {
	__unsafe_unretained NSString *extension;
	__unsafe_unretained NSString *path;
} MVM_ImageAttributes;

extern const struct MVM_ImageRelationships {
	__unsafe_unretained NSString *character;
	__unsafe_unretained NSString *comic;
	__unsafe_unretained NSString *comicImage;
	__unsafe_unretained NSString *creator;
	__unsafe_unretained NSString *event;
	__unsafe_unretained NSString *series;
	__unsafe_unretained NSString *story;
} MVM_ImageRelationships;

extern const struct MVM_ImageFetchedProperties {
} MVM_ImageFetchedProperties;

@class MVM_Character;
@class MVM_Comic;
@class MVM_Comic;
@class MVM_Creator;
@class MVM_Event;
@class MVM_Series;
@class MVM_Story;




@interface MVM_ImageID : NSManagedObjectID {}
@end

@interface _MVM_Image : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_ImageID*)objectID;





@property (nonatomic, strong) NSString* extension;



//- (BOOL)validateExtension:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* path;



//- (BOOL)validatePath:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) MVM_Character *character;

//- (BOOL)validateCharacter:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Comic *comic;

//- (BOOL)validateComic:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Comic *comicImage;

//- (BOOL)validateComicImage:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Creator *creator;

//- (BOOL)validateCreator:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Event *event;

//- (BOOL)validateEvent:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Series *series;

//- (BOOL)validateSeries:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Story *story;

//- (BOOL)validateStory:(id*)value_ error:(NSError**)error_;





@end

@interface _MVM_Image (CoreDataGeneratedAccessors)

@end

@interface _MVM_Image (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveExtension;
- (void)setPrimitiveExtension:(NSString*)value;




- (NSString*)primitivePath;
- (void)setPrimitivePath:(NSString*)value;





- (MVM_Character*)primitiveCharacter;
- (void)setPrimitiveCharacter:(MVM_Character*)value;



- (MVM_Comic*)primitiveComic;
- (void)setPrimitiveComic:(MVM_Comic*)value;



- (MVM_Comic*)primitiveComicImage;
- (void)setPrimitiveComicImage:(MVM_Comic*)value;



- (MVM_Creator*)primitiveCreator;
- (void)setPrimitiveCreator:(MVM_Creator*)value;



- (MVM_Event*)primitiveEvent;
- (void)setPrimitiveEvent:(MVM_Event*)value;



- (MVM_Series*)primitiveSeries;
- (void)setPrimitiveSeries:(MVM_Series*)value;



- (MVM_Story*)primitiveStory;
- (void)setPrimitiveStory:(MVM_Story*)value;


@end
