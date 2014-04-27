// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Story.m instead.

#import "_MVM_Story.h"

const struct MVM_StoryAttributes MVM_StoryAttributes = {
	.apiDescription = @"apiDescription",
	.apiId = @"apiId",
	.modified = @"modified",
	.partialImport = @"partialImport",
	.resourceURI = @"resourceURI",
	.type = @"type",
};

const struct MVM_StoryRelationships MVM_StoryRelationships = {
	.characters = @"characters",
	.comics = @"comics",
	.creators = @"creators",
	.events = @"events",
	.series = @"series",
	.thumbnail = @"thumbnail",
	.urls = @"urls",
};

const struct MVM_StoryFetchedProperties MVM_StoryFetchedProperties = {
};

@implementation MVM_StoryID
@end

@implementation _MVM_Story

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Story" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Story";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Story" inManagedObjectContext:moc_];
}

- (MVM_StoryID*)objectID {
	return (MVM_StoryID*)[super objectID];
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






@dynamic type;






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
	

@dynamic events;

	
- (NSMutableSet*)eventsSet {
	[self willAccessValueForKey:@"events"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"events"];
  
	[self didAccessValueForKey:@"events"];
	return result;
}
	

@dynamic series;

	
- (NSMutableSet*)seriesSet {
	[self willAccessValueForKey:@"series"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"series"];
  
	[self didAccessValueForKey:@"series"];
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
