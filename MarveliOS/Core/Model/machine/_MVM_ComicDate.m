// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_ComicDate.m instead.

#import "_MVM_ComicDate.h"

const struct MVM_ComicDateAttributes MVM_ComicDateAttributes = {
	.date = @"date",
	.type = @"type",
};

const struct MVM_ComicDateRelationships MVM_ComicDateRelationships = {
	.comic = @"comic",
};

const struct MVM_ComicDateFetchedProperties MVM_ComicDateFetchedProperties = {
};

@implementation MVM_ComicDateID
@end

@implementation _MVM_ComicDate

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ComicDate" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ComicDate";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ComicDate" inManagedObjectContext:moc_];
}

- (MVM_ComicDateID*)objectID {
	return (MVM_ComicDateID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic date;






@dynamic type;






@dynamic comic;

	






@end
