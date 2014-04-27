// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Series.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_SeriesAttributes {
	__unsafe_unretained NSString *apiDescription;
	__unsafe_unretained NSString *apiId;
	__unsafe_unretained NSString *endYear;
	__unsafe_unretained NSString *modified;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *resourceURI;
	__unsafe_unretained NSString *startYear;
} MVM_SeriesAttributes;

extern const struct MVM_SeriesRelationships {
	__unsafe_unretained NSString *characters;
	__unsafe_unretained NSString *comic;
	__unsafe_unretained NSString *creators;
	__unsafe_unretained NSString *events;
	__unsafe_unretained NSString *next;
	__unsafe_unretained NSString *previous;
	__unsafe_unretained NSString *stories;
	__unsafe_unretained NSString *thumbnail;
	__unsafe_unretained NSString *urls;
} MVM_SeriesRelationships;

extern const struct MVM_SeriesFetchedProperties {
} MVM_SeriesFetchedProperties;

@class MVM_Character;
@class MVM_Comic;
@class MVM_Creator;
@class MVM_Event;
@class MVM_Series;
@class MVM_Series;
@class MVM_Story;
@class MVM_Image;
@class MVM_URL;









@interface MVM_SeriesID : NSManagedObjectID {}
@end

@interface _MVM_Series : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_SeriesID*)objectID;





@property (nonatomic, strong) NSString* apiDescription;



//- (BOOL)validateApiDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* apiId;



@property int64_t apiIdValue;
- (int64_t)apiIdValue;
- (void)setApiIdValue:(int64_t)value_;

//- (BOOL)validateApiId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* endYear;



@property int32_t endYearValue;
- (int32_t)endYearValue;
- (void)setEndYearValue:(int32_t)value_;

//- (BOOL)validateEndYear:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* modified;



//- (BOOL)validateModified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* rating;



//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* resourceURI;



//- (BOOL)validateResourceURI:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* startYear;



@property int32_t startYearValue;
- (int32_t)startYearValue;
- (void)setStartYearValue:(int32_t)value_;

//- (BOOL)validateStartYear:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *characters;

- (NSMutableSet*)charactersSet;




@property (nonatomic, strong) NSSet *comic;

- (NSMutableSet*)comicSet;




@property (nonatomic, strong) NSSet *creators;

- (NSMutableSet*)creatorsSet;




@property (nonatomic, strong) NSSet *events;

- (NSMutableSet*)eventsSet;




@property (nonatomic, strong) MVM_Series *next;

//- (BOOL)validateNext:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Series *previous;

//- (BOOL)validatePrevious:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *stories;

- (NSMutableSet*)storiesSet;




@property (nonatomic, strong) MVM_Image *thumbnail;

//- (BOOL)validateThumbnail:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *urls;

- (NSMutableSet*)urlsSet;





@end

@interface _MVM_Series (CoreDataGeneratedAccessors)

- (void)addCharacters:(NSSet*)value_;
- (void)removeCharacters:(NSSet*)value_;
- (void)addCharactersObject:(MVM_Character*)value_;
- (void)removeCharactersObject:(MVM_Character*)value_;

- (void)addComic:(NSSet*)value_;
- (void)removeComic:(NSSet*)value_;
- (void)addComicObject:(MVM_Comic*)value_;
- (void)removeComicObject:(MVM_Comic*)value_;

- (void)addCreators:(NSSet*)value_;
- (void)removeCreators:(NSSet*)value_;
- (void)addCreatorsObject:(MVM_Creator*)value_;
- (void)removeCreatorsObject:(MVM_Creator*)value_;

- (void)addEvents:(NSSet*)value_;
- (void)removeEvents:(NSSet*)value_;
- (void)addEventsObject:(MVM_Event*)value_;
- (void)removeEventsObject:(MVM_Event*)value_;

- (void)addStories:(NSSet*)value_;
- (void)removeStories:(NSSet*)value_;
- (void)addStoriesObject:(MVM_Story*)value_;
- (void)removeStoriesObject:(MVM_Story*)value_;

- (void)addUrls:(NSSet*)value_;
- (void)removeUrls:(NSSet*)value_;
- (void)addUrlsObject:(MVM_URL*)value_;
- (void)removeUrlsObject:(MVM_URL*)value_;

@end

@interface _MVM_Series (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveApiDescription;
- (void)setPrimitiveApiDescription:(NSString*)value;




- (NSNumber*)primitiveApiId;
- (void)setPrimitiveApiId:(NSNumber*)value;

- (int64_t)primitiveApiIdValue;
- (void)setPrimitiveApiIdValue:(int64_t)value_;




- (NSNumber*)primitiveEndYear;
- (void)setPrimitiveEndYear:(NSNumber*)value;

- (int32_t)primitiveEndYearValue;
- (void)setPrimitiveEndYearValue:(int32_t)value_;




- (NSDate*)primitiveModified;
- (void)setPrimitiveModified:(NSDate*)value;




- (NSString*)primitiveRating;
- (void)setPrimitiveRating:(NSString*)value;




- (NSString*)primitiveResourceURI;
- (void)setPrimitiveResourceURI:(NSString*)value;




- (NSNumber*)primitiveStartYear;
- (void)setPrimitiveStartYear:(NSNumber*)value;

- (int32_t)primitiveStartYearValue;
- (void)setPrimitiveStartYearValue:(int32_t)value_;





- (NSMutableSet*)primitiveCharacters;
- (void)setPrimitiveCharacters:(NSMutableSet*)value;



- (NSMutableSet*)primitiveComic;
- (void)setPrimitiveComic:(NSMutableSet*)value;



- (NSMutableSet*)primitiveCreators;
- (void)setPrimitiveCreators:(NSMutableSet*)value;



- (NSMutableSet*)primitiveEvents;
- (void)setPrimitiveEvents:(NSMutableSet*)value;



- (MVM_Series*)primitiveNext;
- (void)setPrimitiveNext:(MVM_Series*)value;



- (MVM_Series*)primitivePrevious;
- (void)setPrimitivePrevious:(MVM_Series*)value;



- (NSMutableSet*)primitiveStories;
- (void)setPrimitiveStories:(NSMutableSet*)value;



- (MVM_Image*)primitiveThumbnail;
- (void)setPrimitiveThumbnail:(MVM_Image*)value;



- (NSMutableSet*)primitiveUrls;
- (void)setPrimitiveUrls:(NSMutableSet*)value;


@end
