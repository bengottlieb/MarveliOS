// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MVM_Character.m instead.

#import "_MVM_Character.h"

const struct MVM_CharacterAttributes MVM_CharacterAttributes = {
	.apiDescription = @"apiDescription",
	.apiId = @"apiId",
	.modified = @"modified",
	.name = @"name",
	.resourceURI = @"resourceURI",
};

const struct MVM_CharacterRelationships MVM_CharacterRelationships = {
	.comics = @"comics",
	.creators = @"creators",
	.events = @"events",
	.series = @"series",
	.stories = @"stories",
	.thumbnail = @"thumbnail",
	.urls = @"urls",
};

const struct MVM_CharacterFetchedProperties MVM_CharacterFetchedProperties = {
};

@implementation MVM_CharacterID
@end

@implementation _MVM_Character

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Character";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Character" inManagedObjectContext:moc_];
}

- (MVM_CharacterID*)objectID {
	return (MVM_CharacterID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"apiIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"apiId"];
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






@dynamic name;






@dynamic resourceURI;






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
	

@dynamic stories;

	
- (NSMutableSet*)storiesSet {
	[self willAccessValueForKey:@"stories"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"stories"];
  
	[self didAccessValueForKey:@"stories"];
	return result;
}
	

@dynamic thumbnail;

	

@dynamic urls;

	






@end
