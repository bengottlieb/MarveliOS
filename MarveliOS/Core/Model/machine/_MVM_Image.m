// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Image.m instead.

#import "_MVM_Image.h"

const struct MVM_ImageAttributes MVM_ImageAttributes = {
	.extension = @"extension",
	.path = @"path",
};

const struct MVM_ImageRelationships MVM_ImageRelationships = {
	.character = @"character",
	.comic = @"comic",
	.comicImage = @"comicImage",
	.event = @"event",
	.series = @"series",
	.story = @"story",
};

const struct MVM_ImageFetchedProperties MVM_ImageFetchedProperties = {
};

@implementation MVM_ImageID
@end

@implementation _MVM_Image

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Image";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Image" inManagedObjectContext:moc_];
}

- (MVM_ImageID*)objectID {
	return (MVM_ImageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic extension;






@dynamic path;






@dynamic character;

	

@dynamic comic;

	

@dynamic comicImage;

	

@dynamic event;

	

@dynamic series;

	

@dynamic story;

	






@end
