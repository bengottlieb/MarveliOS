// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Comic.m instead.

#import "_MVM_Comic.h"

const struct MVM_ComicAttributes MVM_ComicAttributes = {
	.apiDescription = @"apiDescription",
	.apiId = @"apiId",
	.diamondCode = @"diamondCode",
	.digialId = @"digialId",
	.ean = @"ean",
	.format = @"format",
	.isbn = @"isbn",
	.issn = @"issn",
	.issueNumber = @"issueNumber",
	.modified = @"modified",
	.pageCount = @"pageCount",
	.partialImport = @"partialImport",
	.resourceURI = @"resourceURI",
	.title = @"title",
	.titleInitial = @"titleInitial",
	.upc = @"upc",
	.variantDescription = @"variantDescription",
};

const struct MVM_ComicRelationships MVM_ComicRelationships = {
	.characters = @"characters",
	.creators = @"creators",
	.dates = @"dates",
	.events = @"events",
	.images = @"images",
	.prices = @"prices",
	.series = @"series",
	.stories = @"stories",
	.textBlurbs = @"textBlurbs",
	.thumbnail = @"thumbnail",
	.urls = @"urls",
	.variants = @"variants",
};

const struct MVM_ComicFetchedProperties MVM_ComicFetchedProperties = {
};

@implementation MVM_ComicID
@end

@implementation _MVM_Comic

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Comic" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Comic";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Comic" inManagedObjectContext:moc_];
}

- (MVM_ComicID*)objectID {
	return (MVM_ComicID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"apiIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"apiId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"digialIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"digialId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"issueNumberValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"issueNumber"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"pageCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pageCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"partialImportValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"partialImport"];
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





@dynamic diamondCode;






@dynamic digialId;



- (int64_t)digialIdValue {
	NSNumber *result = [self digialId];
	return [result longLongValue];
}

- (void)setDigialIdValue:(int64_t)value_ {
	[self setDigialId:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveDigialIdValue {
	NSNumber *result = [self primitiveDigialId];
	return [result longLongValue];
}

- (void)setPrimitiveDigialIdValue:(int64_t)value_ {
	[self setPrimitiveDigialId:[NSNumber numberWithLongLong:value_]];
}





@dynamic ean;






@dynamic format;






@dynamic isbn;






@dynamic issn;






@dynamic issueNumber;



- (double)issueNumberValue {
	NSNumber *result = [self issueNumber];
	return [result doubleValue];
}

- (void)setIssueNumberValue:(double)value_ {
	[self setIssueNumber:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveIssueNumberValue {
	NSNumber *result = [self primitiveIssueNumber];
	return [result doubleValue];
}

- (void)setPrimitiveIssueNumberValue:(double)value_ {
	[self setPrimitiveIssueNumber:[NSNumber numberWithDouble:value_]];
}





@dynamic modified;






@dynamic pageCount;



- (int16_t)pageCountValue {
	NSNumber *result = [self pageCount];
	return [result shortValue];
}

- (void)setPageCountValue:(int16_t)value_ {
	[self setPageCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePageCountValue {
	NSNumber *result = [self primitivePageCount];
	return [result shortValue];
}

- (void)setPrimitivePageCountValue:(int16_t)value_ {
	[self setPrimitivePageCount:[NSNumber numberWithShort:value_]];
}





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





@dynamic resourceURI;






@dynamic title;






@dynamic titleInitial;






@dynamic upc;






@dynamic variantDescription;






@dynamic characters;

	
- (NSMutableSet*)charactersSet {
	[self willAccessValueForKey:@"characters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"characters"];
  
	[self didAccessValueForKey:@"characters"];
	return result;
}
	

@dynamic creators;

	
- (NSMutableSet*)creatorsSet {
	[self willAccessValueForKey:@"creators"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"creators"];
  
	[self didAccessValueForKey:@"creators"];
	return result;
}
	

@dynamic dates;

	
- (NSMutableSet*)datesSet {
	[self willAccessValueForKey:@"dates"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"dates"];
  
	[self didAccessValueForKey:@"dates"];
	return result;
}
	

@dynamic events;

	
- (NSMutableSet*)eventsSet {
	[self willAccessValueForKey:@"events"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"events"];
  
	[self didAccessValueForKey:@"events"];
	return result;
}
	

@dynamic images;

	
- (NSMutableSet*)imagesSet {
	[self willAccessValueForKey:@"images"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"images"];
  
	[self didAccessValueForKey:@"images"];
	return result;
}
	

@dynamic prices;

	

@dynamic series;

	
- (NSMutableSet*)seriesSet {
	[self willAccessValueForKey:@"series"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"series"];
  
	[self didAccessValueForKey:@"series"];
	return result;
}
	

@dynamic stories;

	
- (NSMutableSet*)storiesSet {
	[self willAccessValueForKey:@"stories"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"stories"];
  
	[self didAccessValueForKey:@"stories"];
	return result;
}
	

@dynamic textBlurbs;

	

@dynamic thumbnail;

	

@dynamic urls;

	

@dynamic variants;

	
- (NSMutableSet*)variantsSet {
	[self willAccessValueForKey:@"variants"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"variants"];
  
	[self didAccessValueForKey:@"variants"];
	return result;
}
	






@end
