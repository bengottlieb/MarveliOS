// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_ComicText.m instead.

#import "_MVM_ComicText.h"

const struct MVM_ComicTextAttributes MVM_ComicTextAttributes = {
	.language = @"language",
	.text = @"text",
	.type = @"type",
};

const struct MVM_ComicTextRelationships MVM_ComicTextRelationships = {
	.comic = @"comic",
};

const struct MVM_ComicTextFetchedProperties MVM_ComicTextFetchedProperties = {
};

@implementation MVM_ComicTextID
@end

@implementation _MVM_ComicText

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ComicText" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ComicText";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ComicText" inManagedObjectContext:moc_];
}

- (MVM_ComicTextID*)objectID {
	return (MVM_ComicTextID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic language;






@dynamic text;






@dynamic type;






@dynamic comic;

	






@end
