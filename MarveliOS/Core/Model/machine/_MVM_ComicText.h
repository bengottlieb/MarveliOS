// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_ComicText.h instead.

#import <CoreData/CoreData.h>
#import "MVM_Object.h"

extern const struct MVM_ComicTextAttributes {
	__unsafe_unretained NSString *language;
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *type;
} MVM_ComicTextAttributes;

extern const struct MVM_ComicTextRelationships {
	__unsafe_unretained NSString *comic;
} MVM_ComicTextRelationships;

extern const struct MVM_ComicTextFetchedProperties {
} MVM_ComicTextFetchedProperties;

@class MVM_Comic;





@interface MVM_ComicTextID : NSManagedObjectID {}
@end

@interface _MVM_ComicText : MVM_Object {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (MVM_ComicTextID*)objectID;





@property (nonatomic, strong) NSString* language;



//- (BOOL)validateLanguage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* text;



//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) MVM_Comic *comic;

//- (BOOL)validateComic:(id*)value_ error:(NSError**)error_;





@end

@interface _MVM_ComicText (CoreDataGeneratedAccessors)

@end

@interface _MVM_ComicText (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveLanguage;
- (void)setPrimitiveLanguage:(NSString*)value;




- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (MVM_Comic*)primitiveComic;
- (void)setPrimitiveComic:(MVM_Comic*)value;


@end
