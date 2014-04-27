// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Comic.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_ComicAttributes {
	__unsafe_unretained NSString *apiDescription;
	__unsafe_unretained NSString *apiId;
	__unsafe_unretained NSString *diamondCode;
	__unsafe_unretained NSString *digialId;
	__unsafe_unretained NSString *ean;
	__unsafe_unretained NSString *format;
	__unsafe_unretained NSString *isbn;
	__unsafe_unretained NSString *issn;
	__unsafe_unretained NSString *issueNumber;
	__unsafe_unretained NSString *modified;
	__unsafe_unretained NSString *pageCount;
	__unsafe_unretained NSString *partialImport;
	__unsafe_unretained NSString *resourceURI;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *titleInitial;
	__unsafe_unretained NSString *upc;
	__unsafe_unretained NSString *variantDescription;
} MVM_ComicAttributes;

extern const struct MVM_ComicRelationships {
	__unsafe_unretained NSString *characters;
	__unsafe_unretained NSString *creators;
	__unsafe_unretained NSString *events;
	__unsafe_unretained NSString *images;
	__unsafe_unretained NSString *prices;
	__unsafe_unretained NSString *series;
	__unsafe_unretained NSString *stories;
	__unsafe_unretained NSString *textBlurbs;
	__unsafe_unretained NSString *thumbnail;
	__unsafe_unretained NSString *urls;
	__unsafe_unretained NSString *variants;
} MVM_ComicRelationships;

extern const struct MVM_ComicFetchedProperties {
} MVM_ComicFetchedProperties;

@class MVM_Character;
@class MVM_Creator;
@class MVM_Event;
@class MVM_Image;
@class MVM_ComicPrice;
@class MVM_Series;
@class MVM_Story;
@class MVM_ComicText;
@class MVM_Image;
@class MVM_URL;
@class MVM_Comic;



















@interface MVM_ComicID : NSManagedObjectID {}
@end

@interface _MVM_Comic : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_ComicID*)objectID;





@property (nonatomic, strong) NSString* apiDescription;



//- (BOOL)validateApiDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* apiId;



@property int64_t apiIdValue;
- (int64_t)apiIdValue;
- (void)setApiIdValue:(int64_t)value_;

//- (BOOL)validateApiId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* diamondCode;



//- (BOOL)validateDiamondCode:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* digialId;



@property int64_t digialIdValue;
- (int64_t)digialIdValue;
- (void)setDigialIdValue:(int64_t)value_;

//- (BOOL)validateDigialId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* ean;



//- (BOOL)validateEan:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* format;



//- (BOOL)validateFormat:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* isbn;



//- (BOOL)validateIsbn:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* issn;



//- (BOOL)validateIssn:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* issueNumber;



@property double issueNumberValue;
- (double)issueNumberValue;
- (void)setIssueNumberValue:(double)value_;

//- (BOOL)validateIssueNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* modified;



//- (BOOL)validateModified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* pageCount;



@property int16_t pageCountValue;
- (int16_t)pageCountValue;
- (void)setPageCountValue:(int16_t)value_;

//- (BOOL)validatePageCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* partialImport;



@property BOOL partialImportValue;
- (BOOL)partialImportValue;
- (void)setPartialImportValue:(BOOL)value_;

//- (BOOL)validatePartialImport:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* resourceURI;



//- (BOOL)validateResourceURI:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* titleInitial;



//- (BOOL)validateTitleInitial:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* upc;



//- (BOOL)validateUpc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* variantDescription;



//- (BOOL)validateVariantDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *characters;

- (NSMutableSet*)charactersSet;




@property (nonatomic, strong) NSSet *creators;

- (NSMutableSet*)creatorsSet;




@property (nonatomic, strong) NSSet *events;

- (NSMutableSet*)eventsSet;




@property (nonatomic, strong) NSSet *images;

- (NSMutableSet*)imagesSet;




@property (nonatomic, strong) MVM_ComicPrice *prices;

//- (BOOL)validatePrices:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *series;

- (NSMutableSet*)seriesSet;




@property (nonatomic, strong) NSSet *stories;

- (NSMutableSet*)storiesSet;




@property (nonatomic, strong) MVM_ComicText *textBlurbs;

//- (BOOL)validateTextBlurbs:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_Image *thumbnail;

//- (BOOL)validateThumbnail:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) MVM_URL *urls;

//- (BOOL)validateUrls:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *variants;

- (NSMutableSet*)variantsSet;





@end

@interface _MVM_Comic (CoreDataGeneratedAccessors)

- (void)addCharacters:(NSSet*)value_;
- (void)removeCharacters:(NSSet*)value_;
- (void)addCharactersObject:(MVM_Character*)value_;
- (void)removeCharactersObject:(MVM_Character*)value_;

- (void)addCreators:(NSSet*)value_;
- (void)removeCreators:(NSSet*)value_;
- (void)addCreatorsObject:(MVM_Creator*)value_;
- (void)removeCreatorsObject:(MVM_Creator*)value_;

- (void)addEvents:(NSSet*)value_;
- (void)removeEvents:(NSSet*)value_;
- (void)addEventsObject:(MVM_Event*)value_;
- (void)removeEventsObject:(MVM_Event*)value_;

- (void)addImages:(NSSet*)value_;
- (void)removeImages:(NSSet*)value_;
- (void)addImagesObject:(MVM_Image*)value_;
- (void)removeImagesObject:(MVM_Image*)value_;

- (void)addSeries:(NSSet*)value_;
- (void)removeSeries:(NSSet*)value_;
- (void)addSeriesObject:(MVM_Series*)value_;
- (void)removeSeriesObject:(MVM_Series*)value_;

- (void)addStories:(NSSet*)value_;
- (void)removeStories:(NSSet*)value_;
- (void)addStoriesObject:(MVM_Story*)value_;
- (void)removeStoriesObject:(MVM_Story*)value_;

- (void)addVariants:(NSSet*)value_;
- (void)removeVariants:(NSSet*)value_;
- (void)addVariantsObject:(MVM_Comic*)value_;
- (void)removeVariantsObject:(MVM_Comic*)value_;

@end

@interface _MVM_Comic (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveApiDescription;
- (void)setPrimitiveApiDescription:(NSString*)value;




- (NSNumber*)primitiveApiId;
- (void)setPrimitiveApiId:(NSNumber*)value;

- (int64_t)primitiveApiIdValue;
- (void)setPrimitiveApiIdValue:(int64_t)value_;




- (NSString*)primitiveDiamondCode;
- (void)setPrimitiveDiamondCode:(NSString*)value;




- (NSNumber*)primitiveDigialId;
- (void)setPrimitiveDigialId:(NSNumber*)value;

- (int64_t)primitiveDigialIdValue;
- (void)setPrimitiveDigialIdValue:(int64_t)value_;




- (NSString*)primitiveEan;
- (void)setPrimitiveEan:(NSString*)value;




- (NSString*)primitiveFormat;
- (void)setPrimitiveFormat:(NSString*)value;




- (NSString*)primitiveIsbn;
- (void)setPrimitiveIsbn:(NSString*)value;




- (NSString*)primitiveIssn;
- (void)setPrimitiveIssn:(NSString*)value;




- (NSNumber*)primitiveIssueNumber;
- (void)setPrimitiveIssueNumber:(NSNumber*)value;

- (double)primitiveIssueNumberValue;
- (void)setPrimitiveIssueNumberValue:(double)value_;




- (NSDate*)primitiveModified;
- (void)setPrimitiveModified:(NSDate*)value;




- (NSNumber*)primitivePageCount;
- (void)setPrimitivePageCount:(NSNumber*)value;

- (int16_t)primitivePageCountValue;
- (void)setPrimitivePageCountValue:(int16_t)value_;




- (NSNumber*)primitivePartialImport;
- (void)setPrimitivePartialImport:(NSNumber*)value;

- (BOOL)primitivePartialImportValue;
- (void)setPrimitivePartialImportValue:(BOOL)value_;




- (NSString*)primitiveResourceURI;
- (void)setPrimitiveResourceURI:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveTitleInitial;
- (void)setPrimitiveTitleInitial:(NSString*)value;




- (NSString*)primitiveUpc;
- (void)setPrimitiveUpc:(NSString*)value;




- (NSString*)primitiveVariantDescription;
- (void)setPrimitiveVariantDescription:(NSString*)value;





- (NSMutableSet*)primitiveCharacters;
- (void)setPrimitiveCharacters:(NSMutableSet*)value;



- (NSMutableSet*)primitiveCreators;
- (void)setPrimitiveCreators:(NSMutableSet*)value;



- (NSMutableSet*)primitiveEvents;
- (void)setPrimitiveEvents:(NSMutableSet*)value;



- (NSMutableSet*)primitiveImages;
- (void)setPrimitiveImages:(NSMutableSet*)value;



- (MVM_ComicPrice*)primitivePrices;
- (void)setPrimitivePrices:(MVM_ComicPrice*)value;



- (NSMutableSet*)primitiveSeries;
- (void)setPrimitiveSeries:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStories;
- (void)setPrimitiveStories:(NSMutableSet*)value;



- (MVM_ComicText*)primitiveTextBlurbs;
- (void)setPrimitiveTextBlurbs:(MVM_ComicText*)value;



- (MVM_Image*)primitiveThumbnail;
- (void)setPrimitiveThumbnail:(MVM_Image*)value;



- (MVM_URL*)primitiveUrls;
- (void)setPrimitiveUrls:(MVM_URL*)value;



- (NSMutableSet*)primitiveVariants;
- (void)setPrimitiveVariants:(NSMutableSet*)value;


@end
