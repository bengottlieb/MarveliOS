// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_ComicPrice.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_ComicPriceAttributes {
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *type;
} MVM_ComicPriceAttributes;

extern const struct MVM_ComicPriceRelationships {
	__unsafe_unretained NSString *comic;
} MVM_ComicPriceRelationships;

extern const struct MVM_ComicPriceFetchedProperties {
} MVM_ComicPriceFetchedProperties;

@class MVM_Comic;




@interface MVM_ComicPriceID : NSManagedObjectID {}
@end

@interface _MVM_ComicPrice : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_ComicPriceID*)objectID;





@property (nonatomic, strong) NSNumber* price;



@property float priceValue;
- (float)priceValue;
- (void)setPriceValue:(float)value_;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) MVM_Comic *comic;

//- (BOOL)validateComic:(id*)value_ error:(NSError**)error_;





@end

@interface _MVM_ComicPrice (CoreDataGeneratedAccessors)

@end

@interface _MVM_ComicPrice (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitivePrice;
- (void)setPrimitivePrice:(NSNumber*)value;

- (float)primitivePriceValue;
- (void)setPrimitivePriceValue:(float)value_;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (MVM_Comic*)primitiveComic;
- (void)setPrimitiveComic:(MVM_Comic*)value;


@end
