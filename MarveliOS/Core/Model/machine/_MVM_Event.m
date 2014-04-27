// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Event.m instead.

#import "_MVM_Event.h"

const struct MVM_EventAttributes MVM_EventAttributes = {
	.apiDescription = @"apiDescription",
	.apiId = @"apiId",
	.end = @"end",
	.modified = @"modified",
	.partialImport = @"partialImport",
	.resourceURI = @"resourceURI",
	.start = @"start",
	.title = @"title",
};

const struct MVM_EventRelationships MVM_EventRelationships = {
	.characters = @"characters",
	.comics = @"comics",
	.creators = @"creators",
	.series = @"series",
	.stories = @"stories",
	.thumbnail = @"thumbnail",
	.urls = @"urls",
};

const struct MVM_EventFetchedProperties MVM_EventFetchedProperties = {
};

@implementation MVM_EventID
@end

@implementation _MVM_Event

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Event";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Event" inManagedObjectContext:moc_];
}

- (MVM_EventID*)objectID {
	return (MVM_EventID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"apiIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"apiId"];
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





@dynamic end;






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





@dynamic resourceURI;






@dynamic start;






@dynamic title;






@dynamic characters;

	
- (NSMutableSet*)charactersSet {
	[self willAccessValueForKey:@"characters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"characters"];
  
	[self didAccessValueForKey:@"characters"];
	return result;
}
	

@dynamic comics;

	
- (NSMutableSet*)comicsSet {
	[self willAccessValueForKey:@"comics"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"comics"];
  
	[self didAccessValueForKey:@"comics"];
	return result;
}
	

@dynamic creators;

	
- (NSMutableSet*)creatorsSet {
	[self willAccessValueForKey:@"creators"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"creators"];
  
	[self didAccessValueForKey:@"creators"];
	return result;
}
	

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
	

@dynamic thumbnail;

	

@dynamic urls;

	
- (NSMutableSet*)urlsSet {
	[self willAccessValueForKey:@"urls"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"urls"];
  
	[self didAccessValueForKey:@"urls"];
	return result;
}
	






@end
