// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Series.m instead.

#import "_MVM_Series.h"

const struct MVM_SeriesAttributes MVM_SeriesAttributes = {
	.apiDescription = @"apiDescription",
	.apiId = @"apiId",
	.endYear = @"endYear",
	.modified = @"modified",
	.partialImport = @"partialImport",
	.rating = @"rating",
	.resourceURI = @"resourceURI",
	.startYear = @"startYear",
	.title = @"title",
	.titleInitial = @"titleInitial",
};

const struct MVM_SeriesRelationships MVM_SeriesRelationships = {
	.characters = @"characters",
	.comic = @"comic",
	.creators = @"creators",
	.events = @"events",
	.next = @"next",
	.previous = @"previous",
	.stories = @"stories",
	.thumbnail = @"thumbnail",
	.urls = @"urls",
};

const struct MVM_SeriesFetchedProperties MVM_SeriesFetchedProperties = {
};

@implementation MVM_SeriesID
@end

@implementation _MVM_Series

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Series" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Series";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Series" inManagedObjectContext:moc_];
}

- (MVM_SeriesID*)objectID {
	return (MVM_SeriesID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"apiIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"apiId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"endYearValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"endYear"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"partialImportValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"partialImport"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"startYearValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"startYear"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic apiDescription;






@dynamic apiId;



- (int64_t)apiIdValue {
	NSNumber *result = [self apiId];
	return [result longLongValue];
}

- (void)setApiIdValue:(int64_t)value_ {
	[self setApiId:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveApiIdValue {
	NSNumber *result = [self primitiveApiId];
	return [result longLongValue];
}

- (void)setPrimitiveApiIdValue:(int64_t)value_ {
	[self setPrimitiveApiId:[NSNumber numberWithLongLong:value_]];
}





@dynamic endYear;



- (int32_t)endYearValue {
	NSNumber *result = [self endYear];
	return [result intValue];
}

- (void)setEndYearValue:(int32_t)value_ {
	[self setEndYear:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveEndYearValue {
	NSNumber *result = [self primitiveEndYear];
	return [result intValue];
}

- (void)setPrimitiveEndYearValue:(int32_t)value_ {
	[self setPrimitiveEndYear:[NSNumber numberWithInt:value_]];
}





@dynamic modified;






@dynamic partialImport;



- (BOOL)partialImportValue {
	NSNumber *result = [self partialImport];
	return [result boolValue];
}

- (void)setPartialImportValue:(BOOL)value_ {
	[self setPartialImport:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitivePartialImportValue {
	NSNumber *result = [self primitivePartialImport];
	return [result boolValue];
}

- (void)setPrimitivePartialImportValue:(BOOL)value_ {
	[self setPrimitivePartialImport:[NSNumber numberWithBool:value_]];
}





@dynamic rating;






@dynamic resourceURI;






@dynamic startYear;



- (int32_t)startYearValue {
	NSNumber *result = [self startYear];
	return [result intValue];
}

- (void)setStartYearValue:(int32_t)value_ {
	[self setStartYear:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveStartYearValue {
	NSNumber *result = [self primitiveStartYear];
	return [result intValue];
}

- (void)setPrimitiveStartYearValue:(int32_t)value_ {
	[self setPrimitiveStartYear:[NSNumber numberWithInt:value_]];
}





@dynamic title;






@dynamic titleInitial;






@dynamic characters;

	
- (NSMutableSet*)charactersSet {
	[self willAccessValueForKey:@"characters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"characters"];
  
	[self didAccessValueForKey:@"characters"];
	return result;
}
	

@dynamic comic;

	
- (NSMutableSet*)comicSet {
	[self willAccessValueForKey:@"comic"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"comic"];
  
	[self didAccessValueForKey:@"comic"];
	return result;
}
	

@dynamic creators;

	
- (NSMutableSet*)creatorsSet {
	[self willAccessValueForKey:@"creators"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"creators"];
  
	[self didAccessValueForKey:@"creators"];
	return result;
}
	

@dynamic events;

	
- (NSMutableSet*)eventsSet {
	[self willAccessValueForKey:@"events"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"events"];
  
	[self didAccessValueForKey:@"events"];
	return result;
}
	

@dynamic next;

	

@dynamic previous;

	

@dynamic stories;

	
- (NSMutableSet*)storiesSet {
	[self willAccessValueForKey:@"stories"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"stories"];
  
	[self didAccessValueForKey:@"stories"];
	return result;
}
	

@dynamic thumbnail;

	

@dynamic urls;

	
- (NSMutableSet*)urlsSet {
	[self willAccessValueForKey:@"urls"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"urls"];
  
	[self didAccessValueForKey:@"urls"];
	return result;
}
	






@end
