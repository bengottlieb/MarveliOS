// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_URL.m instead.

#import "_MVM_URL.h"

const struct MVM_URLAttributes MVM_URLAttributes = {
	.path = @"path",
	.type = @"type",
};

const struct MVM_URLRelationships MVM_URLRelationships = {
	.character = @"character",
	.comic = @"comic",
	.creator = @"creator",
	.event = @"event",
	.series = @"series",
	.story = @"story",
};

const struct MVM_URLFetchedProperties MVM_URLFetchedProperties = {
};

@implementation MVM_URLID
@end

@implementation _MVM_URL

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"URL" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"URL";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"URL" inManagedObjectContext:moc_];
}

- (MVM_URLID*)objectID {
	return (MVM_URLID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic path;






@dynamic type;






@dynamic character;

	

@dynamic comic;

	

@dynamic creator;

	

@dynamic event;

	

@dynamic series;

	

@dynamic story;

	






@end
