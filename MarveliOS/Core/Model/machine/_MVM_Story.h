// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Story.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_StoryAttributes {
	__unsafe_unretained NSString *apiDescription;
	__unsafe_unretained NSString *apiId;
	__unsafe_unretained NSString *modified;
	__unsafe_unretained NSString *partialImport;
	__unsafe_unretained NSString *resourceURI;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *totleInitial;
	__unsafe_unretained NSString *type;
} MVM_StoryAttributes;

extern const struct MVM_StoryRelationships {
	__unsafe_unretained NSString *characters;
	__unsafe_unretained NSString *comics;
	__unsafe_unretained NSString *creators;
	__unsafe_unretained NSString *events;
	__unsafe_unretained NSString *series;
	__unsafe_unretained NSString *thumbnail;
	__unsafe_unretained NSString *urls;
} MVM_StoryRelationships;

extern const struct MVM_StoryFetchedProperties {
} MVM_StoryFetchedProperties;

@class MVM_Character;
@class MVM_Comic;
@class MVM_Creator;
@class MVM_Event;
@class MVM_Series;
@class MVM_Image;
@class MVM_URL;










@interface MVM_StoryID : NSManagedObjectID {}
@end

@interface _MVM_Story : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_StoryID*)objectID;





@property (nonatomic, strong) NSString* apiDescription;



//- (BOOL)validateApiDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* apiId;



@property int64_t apiIdValue;
- (int64_t)apiIdValue;
- (void)setApiIdValue:(int64_t)value_;

//- (BOOL)validateApiId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* modified;



//- (BOOL)validateModified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* partialImport;



@property BOOL partialImportValue;
- (BOOL)partialImportValue;
- (void)setPartialImportValue:(BOOL)value_;

//- (BOOL)validatePartialImport:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* resourceURI;



//- (BOOL)validateResourceURI:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* totleInitial;



//- (BOOL)validateTotleInitial:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *characters;

- (NSMutableSet*)charactersSet;




@property (nonatomic, strong) NSSet *comics;

- (NSMutableSet*)comicsSet;




@property (nonatomic, strong) NSSet *creators;

- (NSMutableSet*)creatorsSet;




@property (nonatomic, strong) NSSet *events;

- (NSMutableSet*)eventsSet;




@property (nonatomic, strong) NSSet *series;

- (NSMutableSet*)seriesSet;




@property (nonatomic, strong) MVM_Image *thumbnail;

//- (BOOL)validateThumbnail:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *urls;

- (NSMutableSet*)urlsSet;





@end

@interface _MVM_Story (CoreDataGeneratedAccessors)

- (void)addCharacters:(NSSet*)value_;
- (void)removeCharacters:(NSSet*)value_;
- (void)addCharactersObject:(MVM_Character*)value_;
- (void)removeCharactersObject:(MVM_Character*)value_;

- (void)addComics:(NSSet*)value_;
- (void)removeComics:(NSSet*)value_;
- (void)addComicsObject:(MVM_Comic*)value_;
- (void)removeComicsObject:(MVM_Comic*)value_;

- (void)addCreators:(NSSet*)value_;
- (void)removeCreators:(NSSet*)value_;
- (void)addCreatorsObject:(MVM_Creator*)value_;
- (void)removeCreatorsObject:(MVM_Creator*)value_;

- (void)addEvents:(NSSet*)value_;
- (void)removeEvents:(NSSet*)value_;
- (void)addEventsObject:(MVM_Event*)value_;
- (void)removeEventsObject:(MVM_Event*)value_;

- (void)addSeries:(NSSet*)value_;
- (void)removeSeries:(NSSet*)value_;
- (void)addSeriesObject:(MVM_Series*)value_;
- (void)removeSeriesObject:(MVM_Series*)value_;

- (void)addUrls:(NSSet*)value_;
- (void)removeUrls:(NSSet*)value_;
- (void)addUrlsObject:(MVM_URL*)value_;
- (void)removeUrlsObject:(MVM_URL*)value_;

@end

@interface _MVM_Story (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveApiDescription;
- (void)setPrimitiveApiDescription:(NSString*)value;




- (NSNumber*)primitiveApiId;
- (void)setPrimitiveApiId:(NSNumber*)value;

- (int64_t)primitiveApiIdValue;
- (void)setPrimitiveApiIdValue:(int64_t)value_;




- (NSDate*)primitiveModified;
- (void)setPrimitiveModified:(NSDate*)value;




- (NSNumber*)primitivePartialImport;
- (void)setPrimitivePartialImport:(NSNumber*)value;

- (BOOL)primitivePartialImportValue;
- (void)setPrimitivePartialImportValue:(BOOL)value_;




- (NSString*)primitiveResourceURI;
- (void)setPrimitiveResourceURI:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveTotleInitial;
- (void)setPrimitiveTotleInitial:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (NSMutableSet*)primitiveCharacters;
- (void)setPrimitiveCharacters:(NSMutableSet*)value;



- (NSMutableSet*)primitiveComics;
- (void)setPrimitiveComics:(NSMutableSet*)value;



- (NSMutableSet*)primitiveCreators;
- (void)setPrimitiveCreators:(NSMutableSet*)value;



- (NSMutableSet*)primitiveEvents;
- (void)setPrimitiveEvents:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSeries;
- (void)setPrimitiveSeries:(NSMutableSet*)value;



- (MVM_Image*)primitiveThumbnail;
- (void)setPrimitiveThumbnail:(MVM_Image*)value;



- (NSMutableSet*)primitiveUrls;
- (void)setPrimitiveUrls:(NSMutableSet*)value;


@end
