// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Creator.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_CreatorAttributes {
	__unsafe_unretained NSString *apiDescription;
	__unsafe_unretained NSString *apiId;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *fullName;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *lastNameInitial;
	__unsafe_unretained NSString *middleName;
	__unsafe_unretained NSString *modified;
	__unsafe_unretained NSString *partialImport;
	__unsafe_unretained NSString *resourceURI;
	__unsafe_unretained NSString *suffix;
} MVM_CreatorAttributes;

extern const struct MVM_CreatorRelationships {
	__unsafe_unretained NSString *comics;
	__unsafe_unretained NSString *events;
	__unsafe_unretained NSString *series;
	__unsafe_unretained NSString *stories;
	__unsafe_unretained NSString *thumbnail;
	__unsafe_unretained NSString *urls;
} MVM_CreatorRelationships;

extern const struct MVM_CreatorFetchedProperties {
} MVM_CreatorFetchedProperties;

@class MVM_Comic;
@class MVM_Event;
@class MVM_Series;
@class MVM_Story;
@class MVM_Image;
@class MVM_URL;













@interface MVM_CreatorID : NSManagedObjectID {}
@end

@interface _MVM_Creator : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_CreatorID*)objectID;





@property (nonatomic, strong) NSString* apiDescription;



//- (BOOL)validateApiDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* apiId;



@property int64_t apiIdValue;
- (int64_t)apiIdValue;
- (void)setApiIdValue:(int64_t)value_;

//- (BOOL)validateApiId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* fullName;



//- (BOOL)validateFullName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastNameInitial;



//- (BOOL)validateLastNameInitial:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* middleName;



//- (BOOL)validateMiddleName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* modified;



//- (BOOL)validateModified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* partialImport;



@property BOOL partialImportValue;
- (BOOL)partialImportValue;
- (void)setPartialImportValue:(BOOL)value_;

//- (BOOL)validatePartialImport:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* resourceURI;



//- (BOOL)validateResourceURI:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* suffix;



//- (BOOL)validateSuffix:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *comics;

- (NSMutableSet*)comicsSet;




@property (nonatomic, strong) NSSet *events;

- (NSMutableSet*)eventsSet;




@property (nonatomic, strong) NSSet *series;

- (NSMutableSet*)seriesSet;




@property (nonatomic, strong) NSSet *stories;

- (NSMutableSet*)storiesSet;




@property (nonatomic, strong) MVM_Image *thumbnail;

//- (BOOL)validateThumbnail:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *urls;

- (NSMutableSet*)urlsSet;





@end

@interface _MVM_Creator (CoreDataGeneratedAccessors)

- (void)addComics:(NSSet*)value_;
- (void)removeComics:(NSSet*)value_;
- (void)addComicsObject:(MVM_Comic*)value_;
- (void)removeComicsObject:(MVM_Comic*)value_;

- (void)addEvents:(NSSet*)value_;
- (void)removeEvents:(NSSet*)value_;
- (void)addEventsObject:(MVM_Event*)value_;
- (void)removeEventsObject:(MVM_Event*)value_;

- (void)addSeries:(NSSet*)value_;
- (void)removeSeries:(NSSet*)value_;
- (void)addSeriesObject:(MVM_Series*)value_;
- (void)removeSeriesObject:(MVM_Series*)value_;

- (void)addStories:(NSSet*)value_;
- (void)removeStories:(NSSet*)value_;
- (void)addStoriesObject:(MVM_Story*)value_;
- (void)removeStoriesObject:(MVM_Story*)value_;

- (void)addUrls:(NSSet*)value_;
- (void)removeUrls:(NSSet*)value_;
- (void)addUrlsObject:(MVM_URL*)value_;
- (void)removeUrlsObject:(MVM_URL*)value_;

@end

@interface _MVM_Creator (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveApiDescription;
- (void)setPrimitiveApiDescription:(NSString*)value;




- (NSNumber*)primitiveApiId;
- (void)setPrimitiveApiId:(NSNumber*)value;

- (int64_t)primitiveApiIdValue;
- (void)setPrimitiveApiIdValue:(int64_t)value_;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSString*)primitiveFullName;
- (void)setPrimitiveFullName:(NSString*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSString*)primitiveLastNameInitial;
- (void)setPrimitiveLastNameInitial:(NSString*)value;




- (NSString*)primitiveMiddleName;
- (void)setPrimitiveMiddleName:(NSString*)value;




- (NSDate*)primitiveModified;
- (void)setPrimitiveModified:(NSDate*)value;




- (NSNumber*)primitivePartialImport;
- (void)setPrimitivePartialImport:(NSNumber*)value;

- (BOOL)primitivePartialImportValue;
- (void)setPrimitivePartialImportValue:(BOOL)value_;




- (NSString*)primitiveResourceURI;
- (void)setPrimitiveResourceURI:(NSString*)value;




- (NSString*)primitiveSuffix;
- (void)setPrimitiveSuffix:(NSString*)value;





- (NSMutableSet*)primitiveComics;
- (void)setPrimitiveComics:(NSMutableSet*)value;



- (NSMutableSet*)primitiveEvents;
- (void)setPrimitiveEvents:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSeries;
- (void)setPrimitiveSeries:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStories;
- (void)setPrimitiveStories:(NSMutableSet*)value;



- (MVM_Image*)primitiveThumbnail;
- (void)setPrimitiveThumbnail:(MVM_Image*)value;



- (NSMutableSet*)primitiveUrls;
- (void)setPrimitiveUrls:(NSMutableSet*)value;


@end
